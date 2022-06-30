1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:16   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:16   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2254.2
   000002         000200 PROGRAM-ID.                                                      NC2254.2
   000003         000300     NC225A.                                                      NC2254.2
   000004         000500*                                                              *  NC2254.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2254.2
   000006         000700*                                                              *  NC2254.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2254.2
   000008         000900*                                                              *  NC2254.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2254.2
   000010         001100*                                                              *  NC2254.2
   000011         001300*                                                              *  NC2254.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2254.2
   000013         001500*                                                              *  NC2254.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2254.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2254.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2254.2
   000017         001900*                                                              *  NC2254.2
   000018         002100*                                                              *  NC2254.2
   000019         002200*    PROGRAM NC225A TESTS THE USE OF THE "EVALUATE" STATEMENT. *  NC2254.2
   000020         002300*    VARIOUS COMBINATIONS OF IDENTIFIERS, LITERALS, ARITHMETIC *  NC2254.2
   000021         002400*    EXPRESSIONS AND CONDITIONAL EXPRESSIONS AS WELL AS THE    *  NC2254.2
   000022         002500*    OPTIONAL WORDS "TRUE" AND "FALSE" ARE USED AS SELECTION   *  NC2254.2
   000023         002600*    SUBJECTS AND SELECTION OBJECTS.                           *  NC2254.2
   000024         002700*    MULTIPLE SELECTION SUBJECTS AND SETS OF SELECTION         *  NC2254.2
   000025         002800*    OBJECTS ARE ALSO TESTED.                                  *  NC2254.2
   000026         002900*                                                              *  NC2254.2
   000027         003100 ENVIRONMENT DIVISION.                                            NC2254.2
   000028         003200 CONFIGURATION SECTION.                                           NC2254.2
   000029         003300 SOURCE-COMPUTER.                                                 NC2254.2
   000030         003400     XXXXX082.                                                    NC2254.2
   000031         003500 OBJECT-COMPUTER.                                                 NC2254.2
   000032         003600     XXXXX083.                                                    NC2254.2
   000033         003700 INPUT-OUTPUT SECTION.                                            NC2254.2
   000034         003800 FILE-CONTROL.                                                    NC2254.2
   000035         003900     SELECT PRINT-FILE ASSIGN TO                                  NC2254.2 39
   000036         004000     XXXXX055.                                                    NC2254.2
   000037         004100 DATA DIVISION.                                                   NC2254.2
   000038         004200 FILE SECTION.                                                    NC2254.2
   000039         004300 FD  PRINT-FILE.                                                  NC2254.2

 ==000039==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000040         004400 01  PRINT-REC PICTURE X(120).                                    NC2254.2
   000041         004500 01  DUMMY-RECORD PICTURE X(120).                                 NC2254.2
   000042         004600 WORKING-STORAGE SECTION.                                         NC2254.2
   000043         004700 01  WRK-XN-00001-1              PIC   X.                         NC2254.2
   000044         004800 01  WRK-XN-00001-2              PIC   X.                         NC2254.2
   000045         004900 01  WRK-XN-00001-3              PIC   X.                         NC2254.2
   000046         005000 01  WRK-XN-00001-4              PIC   X.                         NC2254.2
   000047         005100 01  WRK-DU-02V00                PIC   99.                        NC2254.2
   000048         005200 01  WRK-DU-08V00                PIC   9(8).                      NC2254.2
   000049         005300 01  WRK-DU-08V00-1              PIC   9(8).                      NC2254.2
   000050         005400 01  WRK-DU-08V00-2              PIC   9(8).                      NC2254.2
   000051         005500         88 IT-IS-81         VALUE 81.                            NC2254.2
   000052         005600 01  WRK-DU-08V00-3              PIC   9(8).                      NC2254.2
   000053         005700 01  WRK-DU-08V00-4              PIC   9(8).                      NC2254.2
   000054         005800 01  TEST-3-DATA                 PIC   X(6)     VALUE "ABCDEF".   NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 01  TEST-4-DATA                 PIC   XXBXXBXX VALUE "AB CD EF". NC2254.2
   000056         006000                                                                  NC2254.2
   000057         006100 01  WS-2                        PIC  S9        VALUE +2.         NC2254.2
   000058         006200 01  WS-3                        PIC  S9        VALUE +3.         NC2254.2
   000059         006300 01  WS-5                        PIC  S9        VALUE +5.         NC2254.2
   000060         006400 01  WS-6                        PIC  S9        VALUE +6.         NC2254.2
   000061         006500 01  WS-7                        PIC  S9        VALUE +7.         NC2254.2
   000062         006600 01  WS-10                       PIC  S99       VALUE +10.        NC2254.2
   000063         006700 01  WS-81                       PIC  S99       VALUE +81.        NC2254.2
   000064         006800 01  TEST-5-TABLE.                                                NC2254.2
   000065         006900   03        TABLE-GROUP         OCCURS 4.                        NC2254.2
   000066         007000     05      TABLE-1             PIC 9(8)                         NC2254.2
   000067         007100                                 OCCURS 2.                        NC2254.2
   000068         007200   03         TEST-5-DATA        PIC X(6).                        NC2254.2
   000069         007300*                                                                 NC2254.2
   000070         007400 01  TEST-RESULTS.                                                NC2254.2
   000071         007500     02 FILLER                   PIC X      VALUE SPACE.          NC2254.2 IMP
   000072         007600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2254.2 IMP
   000073         007700     02 FILLER                   PIC X      VALUE SPACE.          NC2254.2 IMP
   000074         007800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2254.2 IMP
   000075         007900     02 FILLER                   PIC X      VALUE SPACE.          NC2254.2 IMP
   000076         008000     02  PAR-NAME.                                                NC2254.2
   000077         008100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2254.2 IMP
   000078         008200       03  PARDOT-X              PIC X      VALUE SPACE.          NC2254.2 IMP
   000079         008300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2254.2 IMP
   000080         008400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2254.2 IMP
   000081         008500     02 RE-MARK                  PIC X(61).                       NC2254.2
   000082         008600 01  TEST-COMPUTED.                                               NC2254.2
   000083         008700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2254.2 IMP
   000084         008800     02 FILLER                   PIC X(17)  VALUE                 NC2254.2
   000085         008900            "       COMPUTED=".                                   NC2254.2
   000086         009000     02 COMPUTED-X.                                               NC2254.2
   000087         009100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2254.2 IMP
   000088         009200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2254.2 87
   000089         009300                                 PIC -9(9).9(9).                  NC2254.2
   000090         009400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2254.2 87
   000091         009500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2254.2 87
   000092         009600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2254.2 87
   000093         009700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2254.2 87
   000094         009800         04 COMPUTED-18V0                    PIC -9(18).          NC2254.2
   000095         009900         04 FILLER                           PIC X.               NC2254.2
   000096         010000     03 FILLER PIC X(50) VALUE SPACE.                             NC2254.2 IMP
   000097         010100 01  TEST-CORRECT.                                                NC2254.2
   000098         010200     02 FILLER PIC X(30) VALUE SPACE.                             NC2254.2 IMP
   000099         010300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2254.2
   000100         010400     02 CORRECT-X.                                                NC2254.2
   000101         010500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2254.2 IMP
   000102         010600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2254.2 101
   000103         010700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2254.2 101
   000104         010800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2254.2 101
   000105         010900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2254.2 101
   000106         011000     03      CR-18V0 REDEFINES CORRECT-A.                         NC2254.2 101
   000107         011100         04 CORRECT-18V0                     PIC -9(18).          NC2254.2
   000108         011200         04 FILLER                           PIC X.               NC2254.2
   000109         011300     03 FILLER PIC X(2) VALUE SPACE.                              NC2254.2 IMP
   000110         011400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2254.2 IMP
   000111         011500 01  CCVS-C-1.                                                    NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2254.2
   000113         011700-    "SS  PARAGRAPH-NAME                                          NC2254.2
   000114         011800-    "       REMARKS".                                            NC2254.2
   000115         011900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2254.2 IMP
   000116         012000 01  CCVS-C-2.                                                    NC2254.2
   000117         012100     02 FILLER                     PIC X        VALUE SPACE.      NC2254.2 IMP
   000118         012200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2254.2
   000119         012300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2254.2 IMP
   000120         012400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2254.2
   000121         012500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2254.2 IMP
   000122         012600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2254.2 IMP
   000123         012700 01  REC-CT                        PIC 99       VALUE ZERO.       NC2254.2 IMP
   000124         012800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2254.2 IMP
   000125         012900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2254.2 IMP
   000126         013000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2254.2 IMP
   000127         013100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2254.2 IMP
   000128         013200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2254.2 IMP
   000129         013300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2254.2 IMP
   000130         013400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2254.2 IMP
   000131         013500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2254.2 IMP
   000132         013600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2254.2 IMP
   000133         013700 01  CCVS-H-1.                                                    NC2254.2
   000134         013800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2254.2 IMP
   000135         013900     02  FILLER                    PIC X(42)    VALUE             NC2254.2
   000136         014000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2254.2
   000137         014100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2254.2 IMP
   000138         014200 01  CCVS-H-2A.                                                   NC2254.2
   000139         014300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2254.2 IMP
   000140         014400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2254.2
   000141         014500   02  FILLER                        PIC XXXX   VALUE             NC2254.2
   000142         014600     "4.2 ".                                                      NC2254.2
   000143         014700   02  FILLER                        PIC X(28)  VALUE             NC2254.2
   000144         014800            " COPY - NOT FOR DISTRIBUTION".                       NC2254.2
   000145         014900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2254.2 IMP
   000146         015000                                                                  NC2254.2
   000147         015100 01  CCVS-H-2B.                                                   NC2254.2
   000148         015200   02  FILLER                        PIC X(15)  VALUE             NC2254.2
   000149         015300            "TEST RESULT OF ".                                    NC2254.2
   000150         015400   02  TEST-ID                       PIC X(9).                    NC2254.2
   000151         015500   02  FILLER                        PIC X(4)   VALUE             NC2254.2
   000152         015600            " IN ".                                               NC2254.2
   000153         015700   02  FILLER                        PIC X(12)  VALUE             NC2254.2
   000154         015800     " HIGH       ".                                              NC2254.2
   000155         015900   02  FILLER                        PIC X(22)  VALUE             NC2254.2
   000156         016000            " LEVEL VALIDATION FOR ".                             NC2254.2
   000157         016100   02  FILLER                        PIC X(58)  VALUE             NC2254.2
   000158         016200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2254.2
   000159         016300 01  CCVS-H-3.                                                    NC2254.2
   000160         016400     02  FILLER                      PIC X(34)  VALUE             NC2254.2
   000161         016500            " FOR OFFICIAL USE ONLY    ".                         NC2254.2
   000162         016600     02  FILLER                      PIC X(58)  VALUE             NC2254.2
   000163         016700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2254.2
   000164         016800     02  FILLER                      PIC X(28)  VALUE             NC2254.2
   000165         016900            "  COPYRIGHT   1985 ".                                NC2254.2
   000166         017000 01  CCVS-E-1.                                                    NC2254.2
   000167         017100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2254.2 IMP
   000168         017200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02 ID-AGAIN                     PIC X(9).                    NC2254.2
   000170         017400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2254.2 IMP
   000171         017500 01  CCVS-E-2.                                                    NC2254.2
   000172         017600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2254.2 IMP
   000173         017700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2254.2 IMP
   000174         017800     02 CCVS-E-2-2.                                               NC2254.2
   000175         017900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2254.2 IMP
   000176         018000         03 FILLER                   PIC X      VALUE SPACE.      NC2254.2 IMP
   000177         018100         03 ENDER-DESC               PIC X(44)  VALUE             NC2254.2
   000178         018200            "ERRORS ENCOUNTERED".                                 NC2254.2
   000179         018300 01  CCVS-E-3.                                                    NC2254.2
   000180         018400     02  FILLER                      PIC X(22)  VALUE             NC2254.2
   000181         018500            " FOR OFFICIAL USE ONLY".                             NC2254.2
   000182         018600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2254.2 IMP
   000183         018700     02  FILLER                      PIC X(58)  VALUE             NC2254.2
   000184         018800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2254.2
   000185         018900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2254.2 IMP
   000186         019000     02 FILLER                       PIC X(15)  VALUE             NC2254.2
   000187         019100             " COPYRIGHT 1985".                                   NC2254.2
   000188         019200 01  CCVS-E-4.                                                    NC2254.2
   000189         019300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2254.2 IMP
   000190         019400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2254.2
   000191         019500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2254.2 IMP
   000192         019600     02 FILLER                       PIC X(40)  VALUE             NC2254.2
   000193         019700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2254.2
   000194         019800 01  XXINFO.                                                      NC2254.2
   000195         019900     02 FILLER                       PIC X(19)  VALUE             NC2254.2
   000196         020000            "*** INFORMATION ***".                                NC2254.2
   000197         020100     02 INFO-TEXT.                                                NC2254.2
   000198         020200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2254.2 IMP
   000199         020300       04 XXCOMPUTED                 PIC X(20).                   NC2254.2
   000200         020400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2254.2 IMP
   000201         020500       04 XXCORRECT                  PIC X(20).                   NC2254.2
   000202         020600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2254.2
   000203         020700 01  HYPHEN-LINE.                                                 NC2254.2
   000204         020800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2254.2 IMP
   000205         020900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2254.2
   000206         021000-    "*****************************************".                 NC2254.2
   000207         021100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2254.2
   000208         021200-    "******************************".                            NC2254.2
   000209         021300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2254.2
   000210         021400     "NC225A".                                                    NC2254.2
   000211         021500 PROCEDURE DIVISION.                                              NC2254.2
   000212         021600 CCVS1 SECTION.                                                   NC2254.2
   000213         021700 OPEN-FILES.                                                      NC2254.2
   000214         021800     OPEN     OUTPUT PRINT-FILE.                                  NC2254.2 39
   000215         021900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2254.2 209 150 209 169
   000216         022000     MOVE    SPACE TO TEST-RESULTS.                               NC2254.2 IMP 70
   000217         022100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2254.2 242 247
   000218         022200     GO TO CCVS1-EXIT.                                            NC2254.2 326
   000219         022300 CLOSE-FILES.                                                     NC2254.2
   000220         022400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2254.2 251 273 39
   000221         022500 TERMINATE-CCVS.                                                  NC2254.2
   000222         022600     EXIT PROGRAM.                                                NC2254.2
   000223         022700 TERMINATE-CALL.                                                  NC2254.2
   000224         022800     STOP     RUN.                                                NC2254.2
   000225         022900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2254.2 74 126
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2254.2 74 127
   000227         023100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2254.2 74 125
   000228         023200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2254.2 74 124
   000229         023300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2254.2 81
   000230         023400 PRINT-DETAIL.                                                    NC2254.2
   000231         023500     IF REC-CT NOT EQUAL TO ZERO                                  NC2254.2 123 IMP
   000232      1  023600             MOVE "." TO PARDOT-X                                 NC2254.2 78
   000233      1  023700             MOVE REC-CT TO DOTVALUE.                             NC2254.2 123 79
   000234         023800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2254.2 70 40 285
   000235         023900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2254.2 74 285
   000236      1  024000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2254.2 302 316
   000237      1  024100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2254.2 317 325
   000238         024200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2254.2 IMP 74 IMP 86
   000239         024300     MOVE SPACE TO CORRECT-X.                                     NC2254.2 IMP 100
   000240         024400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2254.2 123 IMP IMP 76
   000241         024500     MOVE     SPACE TO RE-MARK.                                   NC2254.2 IMP 81
   000242         024600 HEAD-ROUTINE.                                                    NC2254.2
   000243         024700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2254.2 133 41 285
   000244         024800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2254.2 138 41 285
   000245         024900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2254.2 147 41 285
   000246         025000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2254.2 159 41 285
   000247         025100 COLUMN-NAMES-ROUTINE.                                            NC2254.2
   000248         025200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2254.2 111 41 285
   000249         025300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2254.2 116 41 285
   000250         025400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2254.2 203 41 285
   000251         025500 END-ROUTINE.                                                     NC2254.2
   000252         025600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2254.2 203 41 285
   000253         025700 END-RTN-EXIT.                                                    NC2254.2
   000254         025800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2254.2 166 41 285
   000255         025900 END-ROUTINE-1.                                                   NC2254.2
   000256         026000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2254.2 125 129 126
   000257         026100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2254.2 129 124 129
   000258         026200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2254.2 127 129
   000259         026300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2254.2
   000260         026400                                                                  NC2254.2
   000261         026500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2254.2 127 189
   000262         026600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2254.2 129 191
   000263         026700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2254.2 188 174
   000264         026800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2254.2 171 41 285
   000265         026900  END-ROUTINE-12.                                                 NC2254.2
   000266         027000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2254.2 177
   000267         027100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2254.2 125 IMP
   000268      1  027200         MOVE "NO " TO ERROR-TOTAL                                NC2254.2 175
   000269         027300         ELSE                                                     NC2254.2
   000270      1  027400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2254.2 125 175
   000271         027500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2254.2 171 41
   000272         027600     PERFORM WRITE-LINE.                                          NC2254.2 285
   000273         027700 END-ROUTINE-13.                                                  NC2254.2
   000274         027800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2254.2 124 IMP
   000275      1  027900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2254.2 175
   000276      1  028000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2254.2 124 175
   000277         028100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2254.2 177
   000278         028200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2254.2 171 41 285
   000279         028300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2254.2 126 IMP
   000280      1  028400          MOVE "NO " TO ERROR-TOTAL                               NC2254.2 175
   000281      1  028500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2254.2 126 175
   000282         028600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2254.2 177
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2254.2 171 41 285
   000284         028800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2254.2 179 41 285
   000285         028900 WRITE-LINE.                                                      NC2254.2
   000286         029000     ADD 1 TO RECORD-COUNT.                                       NC2254.2 131
   000287         029100     IF RECORD-COUNT GREATER 50                                   NC2254.2 131
   000288      1  029200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2254.2 41 130
   000289      1  029300         MOVE SPACE TO DUMMY-RECORD                               NC2254.2 IMP 41
   000290      1  029400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2254.2 41
   000291      1  029500         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2254.2 111 41 297
   000292      1  029600         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2254.2 116 41 297
   000293      1  029700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2254.2 203 41 297
   000294      1  029800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2254.2 130 41
   000295      1  029900         MOVE ZERO TO RECORD-COUNT.                               NC2254.2 IMP 131
   000296         030000     PERFORM WRT-LN.                                              NC2254.2 297
   000297         030100 WRT-LN.                                                          NC2254.2
   000298         030200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2254.2 41
   000299         030300     MOVE SPACE TO DUMMY-RECORD.                                  NC2254.2 IMP 41
   000300         030400 BLANK-LINE-PRINT.                                                NC2254.2
   000301         030500     PERFORM WRT-LN.                                              NC2254.2 297
   000302         030600 FAIL-ROUTINE.                                                    NC2254.2
   000303         030700     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC2254.2 86 IMP
   000304      1  030800            GO TO    FAIL-ROUTINE-WRITE.                          NC2254.2 311
   000305         030900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2254.2 100 IMP 311
   000306         031000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2254.2 132 202
   000307         031100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2254.2 197
   000308         031200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2254.2 194 41 285
   000309         031300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2254.2 IMP 202
   000310         031400     GO TO  FAIL-ROUTINE-EX.                                      NC2254.2 316
   000311         031500 FAIL-ROUTINE-WRITE.                                              NC2254.2
   000312         031600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2254.2 82 40 285
   000313         031700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2254.2 132 110
   000314         031800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2254.2 97 40 285
   000315         031900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2254.2 IMP 110
   000316         032000 FAIL-ROUTINE-EX. EXIT.                                           NC2254.2
   000317         032100 BAIL-OUT.                                                        NC2254.2
   000318         032200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2254.2 87 IMP 320
   000319         032300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2254.2 101 IMP 325
   000320         032400 BAIL-OUT-WRITE.                                                  NC2254.2
   000321         032500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2254.2 101 201 87 199
   000322         032600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2254.2 132 202
   000323         032700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2254.2 194 41 285
   000324         032800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2254.2 IMP 202
   000325         032900 BAIL-OUT-EX. EXIT.                                               NC2254.2
   000326         033000 CCVS1-EXIT.                                                      NC2254.2
   000327         033100     EXIT.                                                        NC2254.2
   000328         033200*                                                                 NC2254.2
   000329         033300 SECT-NC225A-001-1 SECTION.                                       NC2254.2
   000330         033400*                                                                 NC2254.2
   000331         033500 EVA-INIT-GF-1.                                                   NC2254.2
   000332         033600     MOVE   "EVALUATE STATEMENT"  TO FEATURE.                     NC2254.2 72
   000333         033700     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000334         033800     MOVE    1       TO REC-CT.                                   NC2254.2 123
   000335         033900     MOVE   "6" TO WRK-XN-00001-1.                                NC2254.2 43
   000336         034000     GO TO   EVA-TEST-GF-1-1.                                     NC2254.2 341
   000337         034100 EVA-DELETE-GF-1.                                                 NC2254.2
   000338         034200     PERFORM DE-LETE.                                             NC2254.2 228
   000339         034300     PERFORM PRINT-DETAIL.                                        NC2254.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     GO TO   EVA-INIT-GF-2.                                       NC2254.2 374
   000341         034500 EVA-TEST-GF-1-1.                                                 NC2254.2
   000342         034600     MOVE   "EVA-TEST-GF-1-1" TO PAR-NAME.                        NC2254.2 76
   000343         034700     EVALUATE WRK-XN-00001-1 NUMERIC                              NC2254.2 43
   000344         034800        WHEN TRUE                                                 NC2254.2
   000345      1  034900             PERFORM PASS                                         NC2254.2 226
   000346      1  035000             GO TO   EVA-WRITE-GF-1-1.                            NC2254.2 354
   000347         035100     GO TO EVA-FAIL-GF-1-1.                                       NC2254.2 351
   000348         035200 EVA-DELETE-GF-1-1.                                               NC2254.2
   000349         035300     PERFORM DE-LETE.                                             NC2254.2 228
   000350         035400     GO TO EVA-WRITE-GF-1-1.                                      NC2254.2 354
   000351         035500 EVA-FAIL-GF-1-1.                                                 NC2254.2
   000352         035600     MOVE   "EXPECTING NUMERIC CONDITION" TO RE-MARK.             NC2254.2 81
   000353         035700     PERFORM FAIL.                                                NC2254.2 227
   000354         035800 EVA-WRITE-GF-1-1.                                                NC2254.2
   000355         035900     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000356         036000*                                                                 NC2254.2
   000357         036100 EVA-TEST-GF-1-2.                                                 NC2254.2
   000358         036200     ADD     1       TO REC-CT.                                   NC2254.2 123
   000359         036300     MOVE   "EVA-TEST-GF-1-2" TO PAR-NAME.                        NC2254.2 76
   000360         036400     EVALUATE WRK-XN-00001-1 NOT NUMERIC                          NC2254.2 43
   000361         036500        WHEN TRUE                                                 NC2254.2
   000362      1  036600             GO TO EVA-FAIL-GF-1-2.                               NC2254.2 368
   000363         036700     PERFORM PASS.                                                NC2254.2 226
   000364         036800     GO TO   EVA-WRITE-GF-1-2.                                    NC2254.2 371
   000365         036900 EVA-DELETE-GF-1-2.                                               NC2254.2
   000366         037000     PERFORM DE-LETE.                                             NC2254.2 228
   000367         037100     GO TO EVA-WRITE-GF-1-2.                                      NC2254.2 371
   000368         037200 EVA-FAIL-GF-1-2.                                                 NC2254.2
   000369         037300     MOVE   "EXPECTING NUMERIC CONDITION" TO RE-MARK              NC2254.2 81
   000370         037400     PERFORM FAIL.                                                NC2254.2 227
   000371         037500 EVA-WRITE-GF-1-2.                                                NC2254.2
   000372         037600     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000373         037700*                                                                 NC2254.2
   000374         037800 EVA-INIT-GF-2.                                                   NC2254.2
   000375         037900     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000376         038000     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000377         038100     MOVE   "*" TO WRK-XN-00001-1.                                NC2254.2 43
   000378         038200     GO TO   EVA-TEST-GF-2-1.                                     NC2254.2 383
   000379         038300 EVA-DELETE-GF-2.                                                 NC2254.2
   000380         038400     PERFORM DE-LETE.                                             NC2254.2 228
   000381         038500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000382         038600     GO TO   EVA-INIT-GF-3.                                       NC2254.2 416
   000383         038700 EVA-TEST-GF-2-1.                                                 NC2254.2
   000384         038800     MOVE   "EVA-TEST-GF-2-1" TO PAR-NAME.                        NC2254.2 76
   000385         038900     EVALUATE WRK-XN-00001-1 NUMERIC                              NC2254.2 43
   000386         039000        WHEN TRUE                                                 NC2254.2
   000387      1  039100             GO TO EVA-FAIL-GF-2-1.                               NC2254.2 393
   000388         039200     PERFORM PASS.                                                NC2254.2 226
   000389         039300     GO TO EVA-WRITE-GF-2-1.                                      NC2254.2 396
   000390         039400 EVA-DELETE-GF-2-1.                                               NC2254.2
   000391         039500     PERFORM DE-LETE.                                             NC2254.2 228
   000392         039600     GO TO EVA-WRITE-GF-2-1.                                      NC2254.2 396
   000393         039700 EVA-FAIL-GF-2-1.                                                 NC2254.2
   000394         039800     MOVE   "EXPECTING NON-NUMERIC CONDITION" TO RE-MARK          NC2254.2 81
   000395         039900     PERFORM FAIL.                                                NC2254.2 227
   000396         040000 EVA-WRITE-GF-2-1.                                                NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000398         040200*                                                                 NC2254.2
   000399         040300 EVA-TEST-GF-2-2.                                                 NC2254.2
   000400         040400     ADD     1 TO REC-CT.                                         NC2254.2 123
   000401         040500     MOVE   "EVA-TEST-GF-2-2" TO PAR-NAME.                        NC2254.2 76
   000402         040600     EVALUATE WRK-XN-00001-1 NOT NUMERIC                          NC2254.2 43
   000403         040700        WHEN TRUE                                                 NC2254.2
   000404      1  040800             PERFORM PASS                                         NC2254.2 226
   000405      1  040900             GO TO   EVA-WRITE-GF-2-2.                            NC2254.2 413
   000406         041000     GO TO EVA-FAIL-GF-2-2.                                       NC2254.2 410
   000407         041100 EVA-DELETE-GF-2-2.                                               NC2254.2
   000408         041200     PERFORM DE-LETE.                                             NC2254.2 228
   000409         041300     GO TO EVA-WRITE-GF-2-2.                                      NC2254.2 413
   000410         041400 EVA-FAIL-GF-2-2.                                                 NC2254.2
   000411         041500     MOVE   "EXPECTING NON-NUMERIC CONDITION" TO RE-MARK.         NC2254.2 81
   000412         041600     PERFORM FAIL.                                                NC2254.2 227
   000413         041700 EVA-WRITE-GF-2-2.                                                NC2254.2
   000414         041800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000415         041900*                                                                 NC2254.2
   000416         042000 EVA-INIT-GF-3.                                                   NC2254.2
   000417         042100     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000418         042200     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000419         042300     MOVE   "6" TO WRK-XN-00001-1.                                NC2254.2 43
   000420         042400     MOVE   "6" TO WRK-XN-00001-2.                                NC2254.2 44
   000421         042500     GO TO   EVA-TEST-GF-3-1.                                     NC2254.2 426
   000422         042600 EVA-DELETE-GF-3.                                                 NC2254.2
   000423         042700     PERFORM DE-LETE.                                             NC2254.2 228
   000424         042800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000425         042900     GO TO   EVA-INIT-GF-4.                                       NC2254.2 459
   000426         043000 EVA-TEST-GF-3-1.                                                 NC2254.2
   000427         043100     MOVE   "EVA-TEST-GF-3-1" TO PAR-NAME.                        NC2254.2 76
   000428         043200     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000429         043300        WHEN WRK-XN-00001-2                                       NC2254.2 44
   000430      1  043400             PERFORM PASS                                         NC2254.2 226
   000431      1  043500             GO TO   EVA-WRITE-GF-3-1.                            NC2254.2 439
   000432         043600     GO TO EVA-FAIL-GF-3-1.                                       NC2254.2 436
   000433         043700 EVA-DELETE-GF-3-1.                                               NC2254.2
   000434         043800     PERFORM DE-LETE.                                             NC2254.2 228
   000435         043900     GO TO EVA-WRITE-GF-3-1.                                      NC2254.2 439
   000436         044000 EVA-FAIL-GF-3-1.                                                 NC2254.2
   000437         044100     MOVE   "EXPECTING EQUAL IDENTIFIER" TO RE-MARK.              NC2254.2 81
   000438         044200     PERFORM FAIL.                                                NC2254.2 227
   000439         044300 EVA-WRITE-GF-3-1.                                                NC2254.2
   000440         044400     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000441         044500*                                                                 NC2254.2
   000442         044600 EVA-TEST-GF-3-2.                                                 NC2254.2
   000443         044700     ADD     1       TO REC-CT.                                   NC2254.2 123
   000444         044800     MOVE   "EVA-TEST-GF-3-2" TO PAR-NAME.                        NC2254.2 76
   000445         044900     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000446         045000        WHEN NOT WRK-XN-00001-2                                   NC2254.2 44
   000447      1  045100             GO TO EVA-FAIL-GF-3-2.                               NC2254.2 453
   000448         045200     PERFORM PASS.                                                NC2254.2 226
   000449         045300     GO TO   EVA-WRITE-GF-3-2.                                    NC2254.2 456
   000450         045400 EVA-DELETE-GF-3-2.                                               NC2254.2
   000451         045500     PERFORM DE-LETE.                                             NC2254.2 228
   000452         045600     GO TO EVA-WRITE-GF-3-2.                                      NC2254.2 456
   000453         045700 EVA-FAIL-GF-3-2.                                                 NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     MOVE   "EXPECTING EQUAL IDENTIFIERS" TO RE-MARK              NC2254.2 81
   000455         045900     PERFORM FAIL.                                                NC2254.2 227
   000456         046000 EVA-WRITE-GF-3-2.                                                NC2254.2
   000457         046100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000458         046200*                                                                 NC2254.2
   000459         046300 EVA-INIT-GF-4.                                                   NC2254.2
   000460         046400     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000461         046500     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000462         046600     MOVE   "1" TO WRK-XN-00001-1.                                NC2254.2 43
   000463         046700     MOVE   "*" TO WRK-XN-00001-2.                                NC2254.2 44
   000464         046800     GO TO   EVA-TEST-GF-4-1.                                     NC2254.2 469
   000465         046900 EVA-DELETE-GF-4.                                                 NC2254.2
   000466         047000     PERFORM DE-LETE.                                             NC2254.2 228
   000467         047100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000468         047200     GO TO   EVA-INIT-GF-5.                                       NC2254.2 502
   000469         047300 EVA-TEST-GF-4-1.                                                 NC2254.2
   000470         047400     MOVE   "EVA-TEST-GF-4-1" TO PAR-NAME.                        NC2254.2 76
   000471         047500     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000472         047600        WHEN WRK-XN-00001-2                                       NC2254.2 44
   000473      1  047700             GO TO EVA-FAIL-GF-4-1.                               NC2254.2 479
   000474         047800     PERFORM PASS.                                                NC2254.2 226
   000475         047900     GO TO   EVA-WRITE-GF-4-1.                                    NC2254.2 482
   000476         048000 EVA-DELETE-GF-4-1.                                               NC2254.2
   000477         048100     PERFORM DE-LETE.                                             NC2254.2 228
   000478         048200     GO TO EVA-WRITE-GF-4-1.                                      NC2254.2 482
   000479         048300 EVA-FAIL-GF-4-1.                                                 NC2254.2
   000480         048400     MOVE   "EXPECTING UNEQUAL IDENTIFIERS" TO RE-MARK            NC2254.2 81
   000481         048500     PERFORM FAIL.                                                NC2254.2 227
   000482         048600 EVA-WRITE-GF-4-1.                                                NC2254.2
   000483         048700     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000484         048800*                                                                 NC2254.2
   000485         048900 EVA-TEST-GF-4-2.                                                 NC2254.2
   000486         049000     ADD     1 TO REC-CT.                                         NC2254.2 123
   000487         049100     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000488         049200        WHEN NOT WRK-XN-00001-2                                   NC2254.2 44
   000489      1  049300             PERFORM PASS                                         NC2254.2 226
   000490      1  049400             GO TO   EVA-WRITE-GF-4-2.                            NC2254.2 498
   000491         049500     GO TO EVA-FAIL-GF-4-2.                                       NC2254.2 495
   000492         049600 EVA-DELETE-GF-4-2.                                               NC2254.2
   000493         049700     PERFORM DE-LETE.                                             NC2254.2 228
   000494         049800     GO TO   EVA-WRITE-GF-4-2.                                    NC2254.2 498
   000495         049900 EVA-FAIL-GF-4-2.                                                 NC2254.2
   000496         050000     MOVE   "EXPECTING UNEQUAL IDENTIFIERS" TO RE-MARK.           NC2254.2 81
   000497         050100     PERFORM FAIL.                                                NC2254.2 227
   000498         050200 EVA-WRITE-GF-4-2.                                                NC2254.2
   000499         050300     MOVE   "EVA-TEST-GF-4-2" TO PAR-NAME.                        NC2254.2 76
   000500         050400     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000501         050500*                                                                 NC2254.2
   000502         050600 EVA-INIT-GF-5.                                                   NC2254.2
   000503         050700     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000504         050800     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000505         050900     MOVE   "A" TO WRK-XN-00001-1.                                NC2254.2 43
   000506         051000     GO TO   EVA-TEST-GF-5-1.                                     NC2254.2 511
   000507         051100 EVA-DELETE-GF-5.                                                 NC2254.2
   000508         051200     PERFORM DE-LETE.                                             NC2254.2 228
   000509         051300     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000510         051400     GO TO   EVA-INIT-GF-6.                                       NC2254.2 544
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500 EVA-TEST-GF-5-1.                                                 NC2254.2
   000512         051600     MOVE   "EVA-TEST-GF-5-1" TO PAR-NAME.                        NC2254.2 76
   000513         051700     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000514         051800        WHEN "A"                                                  NC2254.2
   000515      1  051900             PERFORM PASS                                         NC2254.2 226
   000516      1  052000             GO TO   EVA-WRITE-GF-5-1.                            NC2254.2 524
   000517         052100     GO TO EVA-FAIL-GF-5-1.                                       NC2254.2 521
   000518         052200 EVA-DELETE-GF-5-1.                                               NC2254.2
   000519         052300     PERFORM DE-LETE.                                             NC2254.2 228
   000520         052400     GO TO EVA-WRITE-GF-5-1.                                      NC2254.2 524
   000521         052500 EVA-FAIL-GF-5-1.                                                 NC2254.2
   000522         052600     MOVE   "EXPECTING EQUAL LITERAL" TO RE-MARK.                 NC2254.2 81
   000523         052700     PERFORM FAIL.                                                NC2254.2 227
   000524         052800 EVA-WRITE-GF-5-1.                                                NC2254.2
   000525         052900     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000526         053000*                                                                 NC2254.2
   000527         053100 EVA-TEST-GF-5-2.                                                 NC2254.2
   000528         053200     ADD     1       TO REC-CT.                                   NC2254.2 123
   000529         053300     MOVE   "EVA-TEST-GF-5-2" TO PAR-NAME.                        NC2254.2 76
   000530         053400     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000531         053500        WHEN NOT "A"                                              NC2254.2
   000532      1  053600             GO TO EVA-FAIL-GF-5-2.                               NC2254.2 538
   000533         053700     PERFORM PASS.                                                NC2254.2 226
   000534         053800     GO TO   EVA-WRITE-GF-5-2.                                    NC2254.2 541
   000535         053900 EVA-DELETE-GF-5-2.                                               NC2254.2
   000536         054000     PERFORM DE-LETE.                                             NC2254.2 228
   000537         054100     GO TO EVA-WRITE-GF-5-2.                                      NC2254.2 541
   000538         054200 EVA-FAIL-GF-5-2.                                                 NC2254.2
   000539         054300     MOVE   "EXPECTING EQUAL LITERAL" TO RE-MARK                  NC2254.2 81
   000540         054400     PERFORM FAIL.                                                NC2254.2 227
   000541         054500 EVA-WRITE-GF-5-2.                                                NC2254.2
   000542         054600     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000543         054700*                                                                 NC2254.2
   000544         054800 EVA-INIT-GF-6.                                                   NC2254.2
   000545         054900     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000546         055000     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000547         055100     MOVE   "A" TO WRK-XN-00001-1.                                NC2254.2 43
   000548         055200     GO TO   EVA-TEST-GF-6-1.                                     NC2254.2 553
   000549         055300 EVA-DELETE-GF-6.                                                 NC2254.2
   000550         055400     PERFORM DE-LETE.                                             NC2254.2 228
   000551         055500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000552         055600     GO TO   EVA-INIT-GF-7.                                       NC2254.2 586
   000553         055700 EVA-TEST-GF-6-1.                                                 NC2254.2
   000554         055800     MOVE   "EVA-TEST-GF-6-1" TO PAR-NAME.                        NC2254.2 76
   000555         055900     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000556         056000        WHEN "Z"                                                  NC2254.2
   000557      1  056100             GO TO EVA-FAIL-GF-6-1.                               NC2254.2 563
   000558         056200     PERFORM PASS.                                                NC2254.2 226
   000559         056300     GO TO   EVA-WRITE-GF-6-1.                                    NC2254.2 566
   000560         056400 EVA-DELETE-GF-6-1.                                               NC2254.2
   000561         056500     PERFORM DE-LETE.                                             NC2254.2 228
   000562         056600     GO TO EVA-WRITE-GF-6-1.                                      NC2254.2 566
   000563         056700 EVA-FAIL-GF-6-1.                                                 NC2254.2
   000564         056800     MOVE   "EXPECTING UNEQUAL LITERAL" TO RE-MARK                NC2254.2 81
   000565         056900     PERFORM FAIL.                                                NC2254.2 227
   000566         057000 EVA-WRITE-GF-6-1.                                                NC2254.2
   000567         057100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200*                                                                 NC2254.2
   000569         057300 EVA-TEST-GF-6-2.                                                 NC2254.2
   000570         057400     ADD     1 TO REC-CT.                                         NC2254.2 123
   000571         057500     MOVE   "EVA-TEST-GF-6-2" TO PAR-NAME.                        NC2254.2 76
   000572         057600     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000573         057700        WHEN NOT "Z"                                              NC2254.2
   000574      1  057800             PERFORM PASS                                         NC2254.2 226
   000575      1  057900             GO TO   EVA-WRITE-GF-6-2.                            NC2254.2 583
   000576         058000     GO TO EVA-FAIL-GF-6-2.                                       NC2254.2 580
   000577         058100 EVA-DELETE-GF-6-2.                                               NC2254.2
   000578         058200     PERFORM DE-LETE.                                             NC2254.2 228
   000579         058300     GO TO EVA-WRITE-GF-6-2.                                      NC2254.2 583
   000580         058400 EVA-FAIL-GF-6-2.                                                 NC2254.2
   000581         058500     MOVE   "EXPECTING UNEQUAL LITERAL" TO RE-MARK.               NC2254.2 81
   000582         058600     PERFORM FAIL.                                                NC2254.2 227
   000583         058700 EVA-WRITE-GF-6-2.                                                NC2254.2
   000584         058800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000585         058900*                                                                 NC2254.2
   000586         059000 EVA-INIT-GF-7.                                                   NC2254.2
   000587         059100     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000588         059200     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000589         059300     MOVE    89 TO WRK-DU-08V00.                                  NC2254.2 48
   000590         059400     GO TO   EVA-TEST-GF-7-1.                                     NC2254.2 595
   000591         059500 EVA-DELETE-GF-7.                                                 NC2254.2
   000592         059600     PERFORM DE-LETE.                                             NC2254.2 228
   000593         059700     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000594         059800     GO TO   EVA-INIT-GF-8.                                       NC2254.2 629
   000595         059900 EVA-TEST-GF-7-1.                                                 NC2254.2
   000596         060000     MOVE   "EVA-TEST-GF-7-1" TO PAR-NAME.                        NC2254.2 76
   000597         060100     EVALUATE WRK-DU-08V00                                        NC2254.2 48
   000598         060200        WHEN (33 + (99 - 43))                                     NC2254.2
   000599      1  060300             PERFORM PASS                                         NC2254.2 226
   000600      1  060400             GO TO   EVA-WRITE-GF-7-1.                            NC2254.2 608
   000601         060500     GO TO EVA-FAIL-GF-7-1.                                       NC2254.2 605
   000602         060600 EVA-DELETE-GF-7-1.                                               NC2254.2
   000603         060700     PERFORM DE-LETE.                                             NC2254.2 228
   000604         060800     GO TO EVA-WRITE-GF-7-1.                                      NC2254.2 608
   000605         060900 EVA-FAIL-GF-7-1.                                                 NC2254.2
   000606         061000     MOVE   "EXPECTING EQUAL ARITHMETIC EXPRESSION" TO RE-MARK.   NC2254.2 81
   000607         061100     PERFORM FAIL.                                                NC2254.2 227
   000608         061200 EVA-WRITE-GF-7-1.                                                NC2254.2
   000609         061300     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000610         061400*                                                                 NC2254.2
   000611         061500 EVA-TEST-GF-7-2.                                                 NC2254.2
   000612         061600     ADD     1       TO REC-CT.                                   NC2254.2 123
   000613         061700     MOVE   "EVA-TEST-GF-7-2" TO PAR-NAME.                        NC2254.2 76
   000614         061800     EVALUATE WRK-DU-08V00                                        NC2254.2 48
   000615         061900        WHEN NOT (33 + (99 - 43))                                 NC2254.2
   000616      1  062000             GO TO EVA-FAIL-GF-7-2.                               NC2254.2 622
   000617         062100     PERFORM PASS.                                                NC2254.2 226
   000618         062200     GO TO   EVA-WRITE-GF-7-2.                                    NC2254.2 626
   000619         062300 EVA-DELETE-GF-7-2.                                               NC2254.2
   000620         062400     PERFORM DE-LETE.                                             NC2254.2 228
   000621         062500     GO TO EVA-WRITE-GF-7-2.                                      NC2254.2 626
   000622         062600 EVA-FAIL-GF-7-2.                                                 NC2254.2
   000623         062700     MOVE   "EXPECTING EQUAL ARITHMETIC EXPRESSION"               NC2254.2
   000624         062800          TO RE-MARK                                              NC2254.2 81
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     PERFORM FAIL.                                                NC2254.2 227
   000626         063000 EVA-WRITE-GF-7-2.                                                NC2254.2
   000627         063100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000628         063200*                                                                 NC2254.2
   000629         063300 EVA-INIT-GF-8.                                                   NC2254.2
   000630         063400     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000631         063500     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000632         063600     MOVE    89 TO WRK-DU-08V00.                                  NC2254.2 48
   000633         063700     GO TO   EVA-TEST-GF-8-1.                                     NC2254.2 638
   000634         063800 EVA-DELETE-GF-8.                                                 NC2254.2
   000635         063900     PERFORM DE-LETE.                                             NC2254.2 228
   000636         064000     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000637         064100     GO TO   EVA-INIT-GF-9.                                       NC2254.2 672
   000638         064200 EVA-TEST-GF-8-1.                                                 NC2254.2
   000639         064300     MOVE   "EVA-TEST-GF-8-1" TO PAR-NAME.                        NC2254.2 76
   000640         064400     EVALUATE WRK-DU-08V00                                        NC2254.2 48
   000641         064500        WHEN (2 + 4 + 8 + 16 + 32 + 64)                           NC2254.2
   000642      1  064600             GO TO EVA-FAIL-GF-8-1.                               NC2254.2 648
   000643         064700     PERFORM PASS.                                                NC2254.2 226
   000644         064800     GO TO   EVA-WRITE-GF-8-1.                                    NC2254.2 652
   000645         064900 EVA-DELETE-GF-8-1.                                               NC2254.2
   000646         065000     PERFORM DE-LETE.                                             NC2254.2 228
   000647         065100     GO TO EVA-WRITE-GF-8-1.                                      NC2254.2 652
   000648         065200 EVA-FAIL-GF-8-1.                                                 NC2254.2
   000649         065300     MOVE   "EXPECTING UNEQUAL ARITHMETIC EXPRESSION"             NC2254.2
   000650         065400          TO RE-MARK                                              NC2254.2 81
   000651         065500     PERFORM FAIL.                                                NC2254.2 227
   000652         065600 EVA-WRITE-GF-8-1.                                                NC2254.2
   000653         065700     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000654         065800*                                                                 NC2254.2
   000655         065900 EVA-TEST-GF-8-2.                                                 NC2254.2
   000656         066000     ADD     1 TO REC-CT.                                         NC2254.2 123
   000657         066100     MOVE   "EVA-TEST-GF-8-2" TO PAR-NAME.                        NC2254.2 76
   000658         066200     EVALUATE WRK-DU-08V00                                        NC2254.2 48
   000659         066300        WHEN NOT (2 + 4 + 8 + 16 + 32 + 64)                       NC2254.2
   000660      1  066400             PERFORM PASS                                         NC2254.2 226
   000661      1  066500             GO TO   EVA-WRITE-GF-8-2.                            NC2254.2 669
   000662         066600     GO TO   EVA-FAIL-GF-8-2.                                     NC2254.2 666
   000663         066700 EVA-DELETE-GF-8-2.                                               NC2254.2
   000664         066800     PERFORM DE-LETE.                                             NC2254.2 228
   000665         066900     GO TO EVA-WRITE-GF-8-2.                                      NC2254.2 669
   000666         067000 EVA-FAIL-GF-8-2.                                                 NC2254.2
   000667         067100     MOVE   "EXPECTING UNEQUAL ARITHMETIC EXPRESSION" TO RE-MARK. NC2254.2 81
   000668         067200     PERFORM FAIL.                                                NC2254.2 227
   000669         067300 EVA-WRITE-GF-8-2.                                                NC2254.2
   000670         067400     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000671         067500*                                                                 NC2254.2
   000672         067600 EVA-INIT-GF-9.                                                   NC2254.2
   000673         067700     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000674         067800     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000675         067900     MOVE   "J" TO WRK-XN-00001-1.                                NC2254.2 43
   000676         068000     MOVE   "A" TO WRK-XN-00001-2.                                NC2254.2 44
   000677         068100     MOVE   "N" TO WRK-XN-00001-3.                                NC2254.2 45
   000678         068200     GO TO   EVA-TEST-GF-9-1.                                     NC2254.2 683
   000679         068300 EVA-DELETE-GF-9.                                                 NC2254.2
   000680         068400     PERFORM DE-LETE.                                             NC2254.2 228
   000681         068500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600     GO TO   EVA-INIT-GF-10.                                      NC2254.2 718
   000683         068700 EVA-TEST-GF-9-1.                                                 NC2254.2
   000684         068800     MOVE   "EVA-TEST-GF-9-1" TO PAR-NAME.                        NC2254.2 76
   000685         068900     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000686         069000        WHEN WRK-XN-00001-2 THRU WRK-XN-00001-3                   NC2254.2 44 45
   000687      1  069100             PERFORM PASS                                         NC2254.2 226
   000688      1  069200             GO TO   EVA-WRITE-GF-9-1.                            NC2254.2 697
   000689         069300     GO TO   EVA-FAIL-GF-9-1.                                     NC2254.2 693
   000690         069400 EVA-DELETE-GF-9-1.                                               NC2254.2
   000691         069500     PERFORM DE-LETE.                                             NC2254.2 228
   000692         069600     GO TO EVA-WRITE-GF-9-1.                                      NC2254.2 697
   000693         069700 EVA-FAIL-GF-9-1.                                                 NC2254.2
   000694         069800     MOVE   "SUBJECT IDENTIFIER SHOULD BE WITHIN RANGE"           NC2254.2
   000695         069900          TO RE-MARK.                                             NC2254.2 81
   000696         070000     PERFORM FAIL.                                                NC2254.2 227
   000697         070100 EVA-WRITE-GF-9-1.                                                NC2254.2
   000698         070200     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000699         070300*                                                                 NC2254.2
   000700         070400 EVA-TEST-GF-9-2.                                                 NC2254.2
   000701         070500     ADD     1       TO REC-CT.                                   NC2254.2 123
   000702         070600     MOVE   "EVA-TEST-GF-9-2" TO PAR-NAME.                        NC2254.2 76
   000703         070700     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000704         070800        WHEN NOT WRK-XN-00001-2 THRU WRK-XN-00001-3               NC2254.2 44 45
   000705      1  070900             GO TO EVA-FAIL-GF-9-2.                               NC2254.2 711
   000706         071000     PERFORM PASS.                                                NC2254.2 226
   000707         071100     GO TO   EVA-WRITE-GF-9-2.                                    NC2254.2 715
   000708         071200 EVA-DELETE-GF-9-2.                                               NC2254.2
   000709         071300     PERFORM DE-LETE.                                             NC2254.2 228
   000710         071400     GO TO EVA-WRITE-GF-9-2.                                      NC2254.2 715
   000711         071500 EVA-FAIL-GF-9-2.                                                 NC2254.2
   000712         071600     MOVE   "SUBJECT IDENTIFIER SHOULD BE WITHIN RANGE"           NC2254.2
   000713         071700          TO RE-MARK                                              NC2254.2 81
   000714         071800     PERFORM FAIL.                                                NC2254.2 227
   000715         071900 EVA-WRITE-GF-9-2.                                                NC2254.2
   000716         072000     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000717         072100*                                                                 NC2254.2
   000718         072200 EVA-INIT-GF-10.                                                  NC2254.2
   000719         072300     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000720         072400     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000721         072500     MOVE   "J" TO WRK-XN-00001-1.                                NC2254.2 43
   000722         072600     MOVE   "A" TO WRK-XN-00001-2.                                NC2254.2 44
   000723         072700     MOVE   "N" TO WRK-XN-00001-3.                                NC2254.2 45
   000724         072800     GO TO   EVA-TEST-GF-10-1.                                    NC2254.2 729
   000725         072900 EVA-DELETE-GF-10.                                                NC2254.2
   000726         073000     PERFORM DE-LETE.                                             NC2254.2 228
   000727         073100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000728         073200     GO TO   EVA-INIT-GF-11.                                      NC2254.2 764
   000729         073300 EVA-TEST-GF-10-1.                                                NC2254.2
   000730         073400     MOVE   "EVA-TEST-GF-10-1" TO PAR-NAME.                       NC2254.2 76
   000731         073500     EVALUATE WRK-XN-00001-3                                      NC2254.2 45
   000732         073600        WHEN WRK-XN-00001-2 THRU WRK-XN-00001-1                   NC2254.2 44 43
   000733      1  073700             GO TO EVA-FAIL-GF-10-1.                              NC2254.2 739
   000734         073800     PERFORM PASS.                                                NC2254.2 226
   000735         073900     GO TO   EVA-WRITE-GF-10-1.                                   NC2254.2 743
   000736         074000 EVA-DELETE-GF-10-1.                                              NC2254.2
   000737         074100     PERFORM DE-LETE.                                             NC2254.2 228
   000738         074200     GO TO EVA-WRITE-GF-10-1.                                     NC2254.2 743
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300 EVA-FAIL-GF-10-1.                                                NC2254.2
   000740         074400     MOVE "SUBJECT IDENTIFIER SHOULD NOT BE WITHIN RANGE"         NC2254.2
   000741         074500          TO RE-MARK                                              NC2254.2 81
   000742         074600     PERFORM FAIL.                                                NC2254.2 227
   000743         074700 EVA-WRITE-GF-10-1.                                               NC2254.2
   000744         074800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000745         074900*                                                                 NC2254.2
   000746         075000 EVA-TEST-GF-10-2.                                                NC2254.2
   000747         075100     ADD     1 TO REC-CT.                                         NC2254.2 123
   000748         075200     MOVE   "EVA-TEST-GF-10-2" TO PAR-NAME.                       NC2254.2 76
   000749         075300     EVALUATE WRK-XN-00001-3                                      NC2254.2 45
   000750         075400        WHEN NOT WRK-XN-00001-2 THRU WRK-XN-00001-1               NC2254.2 44 43
   000751      1  075500             PERFORM PASS                                         NC2254.2 226
   000752      1  075600             GO TO   EVA-WRITE-GF-10-2.                           NC2254.2 761
   000753         075700     GO TO EVA-FAIL-GF-10-2.                                      NC2254.2 757
   000754         075800 EVA-DELETE-GF-10-2.                                              NC2254.2
   000755         075900     PERFORM DE-LETE.                                             NC2254.2 228
   000756         076000     GO TO EVA-WRITE-GF-10-2.                                     NC2254.2 761
   000757         076100 EVA-FAIL-GF-10-2.                                                NC2254.2
   000758         076200     MOVE "  SUBJECT IDENTIFIER SHOULD NOT BE WITHIN RANGE"       NC2254.2
   000759         076300          TO RE-MARK.                                             NC2254.2 81
   000760         076400     PERFORM FAIL.                                                NC2254.2 227
   000761         076500 EVA-WRITE-GF-10-2.                                               NC2254.2
   000762         076600     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000763         076700*                                                                 NC2254.2
   000764         076800 EVA-INIT-GF-11.                                                  NC2254.2
   000765         076900     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000766         077000     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000767         077100     MOVE   "J" TO WRK-XN-00001-1.                                NC2254.2 43
   000768         077200     MOVE   "A" TO WRK-XN-00001-2.                                NC2254.2 44
   000769         077300     MOVE   "N" TO WRK-XN-00001-3.                                NC2254.2 45
   000770         077400     GO TO   EVA-TEST-GF-11-1.                                    NC2254.2 775
   000771         077500 EVA-DELETE-GF-11.                                                NC2254.2
   000772         077600     PERFORM DE-LETE.                                             NC2254.2 228
   000773         077700     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000774         077800     GO TO   EVA-INIT-GF-12.                                      NC2254.2 810
   000775         077900 EVA-TEST-GF-11-1.                                                NC2254.2
   000776         078000     MOVE   "EVA-TEST-GF-11-1" TO PAR-NAME.                       NC2254.2 76
   000777         078100     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
   000778         078200        WHEN "A" THROUGH "N"                                      NC2254.2
   000779      1  078300             PERFORM PASS                                         NC2254.2 226
   000780      1  078400             GO TO   EVA-WRITE-GF-11-1.                           NC2254.2 789
   000781         078500     GO TO EVA-FAIL-GF-11-1.                                      NC2254.2 785
   000782         078600 EVA-DELETE-GF-11-1.                                              NC2254.2
   000783         078700     PERFORM DE-LETE.                                             NC2254.2 228
   000784         078800     GO TO EVA-WRITE-GF-11-1.                                     NC2254.2 789
   000785         078900 EVA-FAIL-GF-11-1.                                                NC2254.2
   000786         079000     MOVE   "SUBJECT IDENTIFIER SHOULD BE WITHIN RANGE"           NC2254.2
   000787         079100          TO RE-MARK.                                             NC2254.2 81
   000788         079200     PERFORM FAIL.                                                NC2254.2 227
   000789         079300 EVA-WRITE-GF-11-1.                                               NC2254.2
   000790         079400     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000791         079500*                                                                 NC2254.2
   000792         079600 EVA-TEST-GF-11-2.                                                NC2254.2
   000793         079700     ADD     1       TO REC-CT.                                   NC2254.2 123
   000794         079800     MOVE   "EVA-TEST-GF-11-2" TO PAR-NAME.                       NC2254.2 76
   000795         079900     EVALUATE WRK-XN-00001-1                                      NC2254.2 43
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000        WHEN NOT "A" THROUGH "N"                                  NC2254.2
   000797      1  080100             GO TO EVA-FAIL-GF-11-2.                              NC2254.2 803
   000798         080200     PERFORM PASS.                                                NC2254.2 226
   000799         080300     GO TO   EVA-WRITE-GF-11-2.                                   NC2254.2 807
   000800         080400 EVA-DELETE-GF-11-2.                                              NC2254.2
   000801         080500     PERFORM DE-LETE.                                             NC2254.2 228
   000802         080600     GO TO EVA-WRITE-GF-11-2.                                     NC2254.2 807
   000803         080700 EVA-FAIL-GF-11-2.                                                NC2254.2
   000804         080800     MOVE   "SUBJECT IDENTIFIER SHOULD BE WITHIN RANGE"           NC2254.2
   000805         080900          TO RE-MARK                                              NC2254.2 81
   000806         081000     PERFORM FAIL.                                                NC2254.2 227
   000807         081100 EVA-WRITE-GF-11-2.                                               NC2254.2
   000808         081200     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000809         081300*                                                                 NC2254.2
   000810         081400 EVA-INIT-GF-12.                                                  NC2254.2
   000811         081500     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000812         081600     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000813         081700     MOVE   "J" TO WRK-XN-00001-1.                                NC2254.2 43
   000814         081800     MOVE   "A" TO WRK-XN-00001-2.                                NC2254.2 44
   000815         081900     MOVE   "N" TO WRK-XN-00001-3.                                NC2254.2 45
   000816         082000     GO TO   EVA-TEST-GF-12-1.                                    NC2254.2 821
   000817         082100 EVA-DELETE-GF-12.                                                NC2254.2
   000818         082200     PERFORM DE-LETE.                                             NC2254.2 228
   000819         082300     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000820         082400     GO TO   EVA-INIT-GF-13.                                      NC2254.2 856
   000821         082500 EVA-TEST-GF-12-1.                                                NC2254.2
   000822         082600     MOVE   "EVA-TEST-GF-12-1" TO PAR-NAME.                       NC2254.2 76
   000823         082700     EVALUATE WRK-XN-00001-3                                      NC2254.2 45
   000824         082800        WHEN "A" THROUGH "J"                                      NC2254.2
   000825      1  082900             GO TO EVA-FAIL-GF-12-1.                              NC2254.2 831
   000826         083000     PERFORM PASS.                                                NC2254.2 226
   000827         083100     GO TO   EVA-WRITE-GF-12-1.                                   NC2254.2 835
   000828         083200 EVA-DELETE-GF-12-1.                                              NC2254.2
   000829         083300     PERFORM DE-LETE.                                             NC2254.2 228
   000830         083400     GO TO EVA-WRITE-GF-12-1.                                     NC2254.2 835
   000831         083500 EVA-FAIL-GF-12-1.                                                NC2254.2
   000832         083600     MOVE "SUBJECT IDENTIFIER SHOULD NOT BE WITHIN RANGE"         NC2254.2
   000833         083700          TO RE-MARK                                              NC2254.2 81
   000834         083800     PERFORM FAIL.                                                NC2254.2 227
   000835         083900 EVA-WRITE-GF-12-1.                                               NC2254.2
   000836         084000     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000837         084100*                                                                 NC2254.2
   000838         084200 EVA-TEST-GF-12-2.                                                NC2254.2
   000839         084300     ADD     1 TO REC-CT.                                         NC2254.2 123
   000840         084400     MOVE   "EVA-TEST-GF-12-2" TO PAR-NAME.                       NC2254.2 76
   000841         084500     EVALUATE WRK-XN-00001-3                                      NC2254.2 45
   000842         084600        WHEN NOT "A" THROUGH "J"                                  NC2254.2
   000843      1  084700             PERFORM PASS                                         NC2254.2 226
   000844      1  084800             GO TO   EVA-WRITE-GF-12-2.                           NC2254.2 853
   000845         084900     GO TO   EVA-FAIL-GF-12-2.                                    NC2254.2 849
   000846         085000 EVA-DELETE-GF-12-2.                                              NC2254.2
   000847         085100     PERFORM DE-LETE.                                             NC2254.2 228
   000848         085200     GO TO EVA-WRITE-GF-12-2.                                     NC2254.2 853
   000849         085300 EVA-FAIL-GF-12-2.                                                NC2254.2
   000850         085400     MOVE "  SUBJECT IDENTIFIER SHOULD NOT BE WITHIN RANGE"       NC2254.2
   000851         085500          TO RE-MARK.                                             NC2254.2 81
   000852         085600     PERFORM FAIL.                                                NC2254.2 227
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700 EVA-WRITE-GF-12-2.                                               NC2254.2
   000854         085800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000855         085900*                                                                 NC2254.2
   000856         086000 EVA-INIT-GF-13.                                                  NC2254.2
   000857         086100     MOVE   "VI-84 6.12.4 GR1(a)" TO ANSI-REFERENCE.              NC2254.2 132
   000858         086200     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000859         086300     MOVE    89 TO WRK-DU-08V00.                                  NC2254.2 48
   000860         086400     GO TO   EVA-TEST-GF-13-1.                                    NC2254.2 865
   000861         086500 EVA-DELETE-GF-13.                                                NC2254.2
   000862         086600     PERFORM DE-LETE.                                             NC2254.2 228
   000863         086700     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000864         086800     GO TO   EVA-INIT-GF-14.                                      NC2254.2 900
   000865         086900 EVA-TEST-GF-13-1.                                                NC2254.2
   000866         087000     MOVE   "EVA-TEST-GF-13-1" TO PAR-NAME.                       NC2254.2 76
   000867         087100     EVALUATE WRK-DU-08V00                                        NC2254.2 48
   000868         087200        WHEN (11 + (99 - 43)) THRU (20 * 5)                       NC2254.2
   000869      1  087300             PERFORM PASS                                         NC2254.2 226
   000870      1  087400             GO TO   EVA-WRITE-GF-13-1.                           NC2254.2 879
   000871         087500     GO TO   EVA-FAIL-GF-13-1.                                    NC2254.2 875
   000872         087600 EVA-DELETE-GF-13-1.                                              NC2254.2
   000873         087700     PERFORM DE-LETE.                                             NC2254.2 228
   000874         087800     GO TO EVA-WRITE-GF-13-1.                                     NC2254.2 879
   000875         087900 EVA-FAIL-GF-13-1.                                                NC2254.2
   000876         088000     MOVE   "SUBJECT IDENTIFIER SHOULD BE WITHIN RANGE"           NC2254.2
   000877         088100          TO RE-MARK.                                             NC2254.2 81
   000878         088200     PERFORM FAIL.                                                NC2254.2 227
   000879         088300 EVA-WRITE-GF-13-1.                                               NC2254.2
   000880         088400     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000881         088500*                                                                 NC2254.2
   000882         088600 EVA-TEST-GF-13-2.                                                NC2254.2
   000883         088700     ADD     1       TO REC-CT.                                   NC2254.2 123
   000884         088800     MOVE   "EVA-TEST-GF-13-2" TO PAR-NAME.                       NC2254.2 76
   000885         088900     EVALUATE WRK-DU-08V00                                        NC2254.2 48
   000886         089000        WHEN NOT (11 + (99 - 43)) THRU (20 * 5)                   NC2254.2
   000887      1  089100             GO TO EVA-FAIL-GF-13-2.                              NC2254.2 893
   000888         089200     PERFORM PASS.                                                NC2254.2 226
   000889         089300     GO TO   EVA-WRITE-GF-13-2.                                   NC2254.2 897
   000890         089400 EVA-DELETE-GF-13-2.                                              NC2254.2
   000891         089500     PERFORM DE-LETE.                                             NC2254.2 228
   000892         089600     GO TO EVA-WRITE-GF-13-2.                                     NC2254.2 897
   000893         089700 EVA-FAIL-GF-13-2.                                                NC2254.2
   000894         089800     MOVE   "SUBJECT IDENTIFIER SHOULD BE WITHIN RANGE"           NC2254.2
   000895         089900          TO RE-MARK                                              NC2254.2 81
   000896         090000     PERFORM FAIL.                                                NC2254.2 227
   000897         090100 EVA-WRITE-GF-13-2.                                               NC2254.2
   000898         090200     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000899         090300*                                                                 NC2254.2
   000900         090400 EVA-INIT-GF-14.                                                  NC2254.2
   000901         090500     MOVE   "VI-84 6.12.4 GR1(A)" TO ANSI-REFERENCE.              NC2254.2 132
   000902         090600     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000903         090700     MOVE    89 TO WRK-DU-08V00.                                  NC2254.2 48
   000904         090800     GO TO   EVA-TEST-GF-14-1.                                    NC2254.2 909
   000905         090900 EVA-DELETE-GF-14.                                                NC2254.2
   000906         091000     PERFORM DE-LETE.                                             NC2254.2 228
   000907         091100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000908         091200     GO TO   EVA-INIT-GF-15.                                      NC2254.2 944
   000909         091300 EVA-TEST-GF-14-1.                                                NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091400     MOVE   "EVA-TEST-GF-14-1" TO PAR-NAME.                       NC2254.2 76
   000911         091500     EVALUATE WRK-DU-08V00                                        NC2254.2 48
   000912         091600        WHEN (11 + (99 - 20)) THRU (20 * 5)                       NC2254.2
   000913      1  091700             GO TO EVA-FAIL-GF-14-1.                              NC2254.2 919
   000914         091800     PERFORM PASS.                                                NC2254.2 226
   000915         091900     GO TO   EVA-WRITE-GF-14-1.                                   NC2254.2 923
   000916         092000 EVA-DELETE-GF-14-1.                                              NC2254.2
   000917         092100     PERFORM DE-LETE.                                             NC2254.2 228
   000918         092200     GO TO EVA-WRITE-GF-14-1.                                     NC2254.2 923
   000919         092300 EVA-FAIL-GF-14-1.                                                NC2254.2
   000920         092400     MOVE "SUBJECT IDENTIFIER SHOULD NOT BE WITHIN RANGE"         NC2254.2
   000921         092500          TO RE-MARK                                              NC2254.2 81
   000922         092600     PERFORM FAIL.                                                NC2254.2 227
   000923         092700 EVA-WRITE-GF-14-1.                                               NC2254.2
   000924         092800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000925         092900*                                                                 NC2254.2
   000926         093000 EVA-TEST-GF-14-2.                                                NC2254.2
   000927         093100     ADD     1 TO REC-CT.                                         NC2254.2 123
   000928         093200     MOVE   "EVA-TEST-GF-14-2" TO PAR-NAME.                       NC2254.2 76
   000929         093300     EVALUATE WRK-DU-08V00                                        NC2254.2 48
   000930         093400        WHEN NOT (11 + (99 - 20)) THRU (20 * 5)                   NC2254.2
   000931      1  093500             PERFORM PASS                                         NC2254.2 226
   000932      1  093600             GO TO   EVA-WRITE-GF-14-2.                           NC2254.2 941
   000933         093700     GO TO   EVA-FAIL-GF-14-2.                                    NC2254.2 937
   000934         093800 EVA-DELETE-GF-14-2.                                              NC2254.2
   000935         093900     PERFORM DE-LETE.                                             NC2254.2 228
   000936         094000     GO TO EVA-WRITE-GF-14-2.                                     NC2254.2 941
   000937         094100 EVA-FAIL-GF-14-2.                                                NC2254.2
   000938         094200     MOVE   "SUBJECT IDENTIFIER SHOULD NOT BE WITHIN RANGE"       NC2254.2
   000939         094300          TO RE-MARK.                                             NC2254.2 81
   000940         094400     PERFORM FAIL.                                                NC2254.2 227
   000941         094500 EVA-WRITE-GF-14-2.                                               NC2254.2
   000942         094600     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000943         094700*                                                                 NC2254.2
   000944         094800 EVA-INIT-GF-15.                                                  NC2254.2
   000945         094900     MOVE   "VI-84 6.12.4 GR1(b)" TO ANSI-REFERENCE.              NC2254.2 132
   000946         095000     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000947         095100     MOVE    26 TO WRK-DU-08V00.                                  NC2254.2 48
   000948         095200     GO TO   EVA-TEST-GF-15-1.                                    NC2254.2 953
   000949         095300 EVA-DELETE-GF-15.                                                NC2254.2
   000950         095400     PERFORM DE-LETE.                                             NC2254.2 228
   000951         095500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000952         095600     GO TO   EVA-INIT-GF-16.                                      NC2254.2 988
   000953         095700 EVA-TEST-GF-15-1.                                                NC2254.2
   000954         095800     MOVE   "EVA-TEST-GF-15-1" TO PAR-NAME.                       NC2254.2 76
   000955         095900     EVALUATE 26                                                  NC2254.2
   000956         096000        WHEN WRK-DU-08V00                                         NC2254.2 48
   000957      1  096100             PERFORM PASS                                         NC2254.2 226
   000958      1  096200             GO TO   EVA-WRITE-GF-15-1.                           NC2254.2 967
   000959         096300     GO TO   EVA-FAIL-GF-15-1.                                    NC2254.2 963
   000960         096400 EVA-DELETE-GF-15-1.                                              NC2254.2
   000961         096500     PERFORM DE-LETE.                                             NC2254.2 228
   000962         096600     GO TO EVA-WRITE-GF-15-1.                                     NC2254.2 967
   000963         096700 EVA-FAIL-GF-15-1.                                                NC2254.2
   000964         096800     MOVE   "IDENTIFIER AND LITERAL SHOULD BE EQUAL"              NC2254.2
   000965         096900          TO RE-MARK.                                             NC2254.2 81
   000966         097000     PERFORM FAIL.                                                NC2254.2 227
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097100 EVA-WRITE-GF-15-1.                                               NC2254.2
   000968         097200     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000969         097300*                                                                 NC2254.2
   000970         097400 EVA-TEST-GF-15-2.                                                NC2254.2
   000971         097500     ADD     1       TO REC-CT.                                   NC2254.2 123
   000972         097600     MOVE   "EVA-TEST-GF-15-2" TO PAR-NAME.                       NC2254.2 76
   000973         097700     EVALUATE 26                                                  NC2254.2
   000974         097800        WHEN NOT WRK-DU-08V00                                     NC2254.2 48
   000975      1  097900             GO TO EVA-FAIL-GF-15-2.                              NC2254.2 981
   000976         098000     PERFORM PASS.                                                NC2254.2 226
   000977         098100     GO TO   EVA-WRITE-GF-15-2.                                   NC2254.2 985
   000978         098200 EVA-DELETE-GF-15-2.                                              NC2254.2
   000979         098300     PERFORM DE-LETE.                                             NC2254.2 228
   000980         098400     GO TO EVA-WRITE-GF-15-2.                                     NC2254.2 985
   000981         098500 EVA-FAIL-GF-15-2.                                                NC2254.2
   000982         098600     MOVE   "IDENTIFIER AND LITERAL SHOULD BE EQUAL"              NC2254.2
   000983         098700          TO RE-MARK                                              NC2254.2 81
   000984         098800     PERFORM FAIL.                                                NC2254.2 227
   000985         098900 EVA-WRITE-GF-15-2.                                               NC2254.2
   000986         099000     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000987         099100*                                                                 NC2254.2
   000988         099200 EVA-INIT-GF-16.                                                  NC2254.2
   000989         099300     MOVE   "VI-84 6.12.4 GR1(b)" TO ANSI-REFERENCE.              NC2254.2 132
   000990         099400     MOVE    1  TO REC-CT.                                        NC2254.2 123
   000991         099500     MOVE    78 TO WRK-DU-08V00.                                  NC2254.2 48
   000992         099600     GO TO   EVA-TEST-GF-16-1.                                    NC2254.2 997
   000993         099700 EVA-DELETE-GF-16.                                                NC2254.2
   000994         099800     PERFORM DE-LETE.                                             NC2254.2 228
   000995         099900     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   000996         100000     GO TO   EVA-INIT-GF-17.                                      NC2254.2 1032
   000997         100100 EVA-TEST-GF-16-1.                                                NC2254.2
   000998         100200     MOVE   "EVA-TEST-GF-16-1" TO PAR-NAME.                       NC2254.2 76
   000999         100300     EVALUATE 1234                                                NC2254.2
   001000         100400        WHEN WRK-DU-08V00                                         NC2254.2 48
   001001      1  100500             GO TO EVA-FAIL-GF-16-1.                              NC2254.2 1007
   001002         100600     PERFORM PASS.                                                NC2254.2 226
   001003         100700     GO TO   EVA-WRITE-GF-16-1.                                   NC2254.2 1011
   001004         100800 EVA-DELETE-GF-16-1.                                              NC2254.2
   001005         100900     PERFORM DE-LETE.                                             NC2254.2 228
   001006         101000     GO TO EVA-WRITE-GF-16-1.                                     NC2254.2 1011
   001007         101100 EVA-FAIL-GF-16-1.                                                NC2254.2
   001008         101200     MOVE   "IDENTIFIER AND LITERAL SHOULD NOT BE EQUAL"          NC2254.2
   001009         101300          TO RE-MARK                                              NC2254.2 81
   001010         101400     PERFORM FAIL.                                                NC2254.2 227
   001011         101500 EVA-WRITE-GF-16-1.                                               NC2254.2
   001012         101600     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001013         101700*                                                                 NC2254.2
   001014         101800 EVA-TEST-GF-16-2.                                                NC2254.2
   001015         101900     ADD     1 TO REC-CT.                                         NC2254.2 123
   001016         102000     MOVE   "EVA-TEST-GF-16-2" TO PAR-NAME.                       NC2254.2 76
   001017         102100     EVALUATE 1234                                                NC2254.2
   001018         102200        WHEN NOT WRK-DU-08V00                                     NC2254.2 48
   001019      1  102300             PERFORM PASS                                         NC2254.2 226
   001020      1  102400             GO TO   EVA-WRITE-GF-16-2.                           NC2254.2 1029
   001021         102500     GO TO   EVA-FAIL-GF-16-2.                                    NC2254.2 1025
   001022         102600 EVA-DELETE-GF-16-2.                                              NC2254.2
   001023         102700     PERFORM DE-LETE.                                             NC2254.2 228
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102800     GO TO EVA-WRITE-GF-16-2.                                     NC2254.2 1029
   001025         102900 EVA-FAIL-GF-16-2.                                                NC2254.2
   001026         103000     MOVE   "IDENTIFIER AND LITERAL SHOULD NOT BE EQUAL"          NC2254.2
   001027         103100          TO RE-MARK.                                             NC2254.2 81
   001028         103200     PERFORM FAIL.                                                NC2254.2 227
   001029         103300 EVA-WRITE-GF-16-2.                                               NC2254.2
   001030         103400     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001031         103500*                                                                 NC2254.2
   001032         103600 EVA-INIT-GF-17.                                                  NC2254.2
   001033         103700     MOVE   "VI-84 6.12.4 GR1(d)" TO ANSI-REFERENCE.              NC2254.2 132
   001034         103800     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001035         103900     MOVE    8  TO WRK-XN-00001-1.                                NC2254.2 43
   001036         104000     GO TO   EVA-TEST-GF-17-1.                                    NC2254.2 1041
   001037         104100 EVA-DELETE-GF-17.                                                NC2254.2
   001038         104200     PERFORM DE-LETE.                                             NC2254.2 228
   001039         104300     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001040         104400     GO TO   EVA-INIT-GF-18.                                      NC2254.2 1093
   001041         104500 EVA-TEST-GF-17-1.                                                NC2254.2
   001042         104600     MOVE   "EVA-TEST-GF-17-1" TO PAR-NAME.                       NC2254.2 76
   001043         104700     EVALUATE WRK-XN-00001-1 NUMERIC                              NC2254.2 43
   001044         104800        WHEN TRUE                                                 NC2254.2
   001045      1  104900             PERFORM PASS                                         NC2254.2 226
   001046      1  105000             GO TO   EVA-WRITE-GF-17-1.                           NC2254.2 1055
   001047         105100     GO TO   EVA-FAIL-GF-17-1.                                    NC2254.2 1051
   001048         105200 EVA-DELETE-GF-17-1.                                              NC2254.2
   001049         105300     PERFORM DE-LETE.                                             NC2254.2 228
   001050         105400     GO TO EVA-WRITE-GF-17-1.                                     NC2254.2 1055
   001051         105500 EVA-FAIL-GF-17-1.                                                NC2254.2
   001052         105600     MOVE   "CONDITIONAL EXPRESSION SHOULD BE TRUE"               NC2254.2
   001053         105700          TO RE-MARK.                                             NC2254.2 81
   001054         105800     PERFORM FAIL.                                                NC2254.2 227
   001055         105900 EVA-WRITE-GF-17-1.                                               NC2254.2
   001056         106000     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001057         106100*                                                                 NC2254.2
   001058         106200 EVA-TEST-GF-17-2.                                                NC2254.2
   001059         106300     ADD     1       TO REC-CT.                                   NC2254.2 123
   001060         106400     MOVE   "EVA-TEST-GF-17-2" TO PAR-NAME.                       NC2254.2 76
   001061         106500     EVALUATE WRK-XN-00001-1 NUMERIC                              NC2254.2 43
   001062         106600        WHEN FALSE                                                NC2254.2
   001063      1  106700             GO TO EVA-FAIL-GF-17-2.                              NC2254.2 1069
   001064         106800     PERFORM PASS.                                                NC2254.2 226
   001065         106900     GO TO   EVA-WRITE-GF-17-2.                                   NC2254.2 1073
   001066         107000 EVA-DELETE-GF-17-2.                                              NC2254.2
   001067         107100     PERFORM DE-LETE.                                             NC2254.2 228
   001068         107200     GO TO EVA-WRITE-GF-17-2.                                     NC2254.2 1073
   001069         107300 EVA-FAIL-GF-17-2.                                                NC2254.2
   001070         107400     MOVE   "CONDITIONAL EXPRESSION SHOULD BE TRUE"               NC2254.2
   001071         107500          TO RE-MARK                                              NC2254.2 81
   001072         107600     PERFORM FAIL.                                                NC2254.2 227
   001073         107700 EVA-WRITE-GF-17-2.                                               NC2254.2
   001074         107800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001075         107900*                                                                 NC2254.2
   001076         108000 EVA-TEST-GF-17-3.                                                NC2254.2
   001077         108100     ADD     1       TO REC-CT.                                   NC2254.2 123
   001078         108200     MOVE   "EVA-TEST-GF-17-3" TO PAR-NAME.                       NC2254.2 76
   001079         108300     EVALUATE WRK-XN-00001-1 NUMERIC                              NC2254.2 43
   001080         108400        WHEN ANY                                                  NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081      1  108500             PERFORM PASS                                         NC2254.2 226
   001082      1  108600             GO TO   EVA-WRITE-GF-17-3.                           NC2254.2 1090
   001083         108700     GO TO   EVA-FAIL-GF-17-3.                                    NC2254.2 1087
   001084         108800 EVA-DELETE-GF-17-3.                                              NC2254.2
   001085         108900     PERFORM DE-LETE.                                             NC2254.2 228
   001086         109000     GO TO EVA-WRITE-GF-17-3.                                     NC2254.2 1090
   001087         109100 EVA-FAIL-GF-17-3.                                                NC2254.2
   001088         109200     MOVE   "WHEN 'ANY' SHOULD HAVE EXECUTED" TO RE-MARK          NC2254.2 81
   001089         109300     PERFORM FAIL.                                                NC2254.2 227
   001090         109400 EVA-WRITE-GF-17-3.                                               NC2254.2
   001091         109500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001092         109600*                                                                 NC2254.2
   001093         109700 EVA-INIT-GF-18.                                                  NC2254.2
   001094         109800     MOVE   "VI-84 6.12.4 GR1(d)" TO ANSI-REFERENCE.              NC2254.2 132
   001095         109900     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001096         110000     MOVE   "*" TO WRK-XN-00001-1.                                NC2254.2 43
   001097         110100     GO TO   EVA-TEST-GF-18-1.                                    NC2254.2 1102
   001098         110200 EVA-DELETE-GF-18.                                                NC2254.2
   001099         110300     PERFORM DE-LETE.                                             NC2254.2 228
   001100         110400     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001101         110500     GO TO   EVA-INIT-GF-19.                                      NC2254.2 1154
   001102         110600 EVA-TEST-GF-18-1.                                                NC2254.2
   001103         110700     MOVE   "EVA-TEST-GF-18-1" TO PAR-NAME.                       NC2254.2 76
   001104         110800     EVALUATE WRK-XN-00001-1 NUMERIC                              NC2254.2 43
   001105         110900        WHEN TRUE                                                 NC2254.2
   001106      1  111000             GO TO EVA-FAIL-GF-18-1.                              NC2254.2 1112
   001107         111100     PERFORM PASS.                                                NC2254.2 226
   001108         111200     GO TO   EVA-WRITE-GF-18-1.                                   NC2254.2 1116
   001109         111300 EVA-DELETE-GF-18-1.                                              NC2254.2
   001110         111400     PERFORM DE-LETE.                                             NC2254.2 228
   001111         111500     GO TO EVA-WRITE-GF-18-1.                                     NC2254.2 1116
   001112         111600 EVA-FAIL-GF-18-1.                                                NC2254.2
   001113         111700     MOVE   "CONDITIONAL EXPRESSION SHOULD BE FALSE"              NC2254.2
   001114         111800          TO RE-MARK                                              NC2254.2 81
   001115         111900     PERFORM FAIL.                                                NC2254.2 227
   001116         112000 EVA-WRITE-GF-18-1.                                               NC2254.2
   001117         112100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001118         112200*                                                                 NC2254.2
   001119         112300 EVA-TEST-GF-18-2.                                                NC2254.2
   001120         112400     ADD     1 TO REC-CT.                                         NC2254.2 123
   001121         112500     MOVE   "EVA-TEST-GF-18-2" TO PAR-NAME.                       NC2254.2 76
   001122         112600     EVALUATE WRK-XN-00001-1 NUMERIC                              NC2254.2 43
   001123         112700        WHEN FALSE                                                NC2254.2
   001124      1  112800             PERFORM PASS                                         NC2254.2 226
   001125      1  112900             GO TO   EVA-WRITE-GF-18-2.                           NC2254.2 1134
   001126         113000     GO TO   EVA-WRITE-GF-18-2.                                   NC2254.2 1134
   001127         113100 EVA-DELETE-GF-18-2.                                              NC2254.2
   001128         113200     PERFORM DE-LETE.                                             NC2254.2 228
   001129         113300     GO TO EVA-WRITE-GF-18-2.                                     NC2254.2 1134
   001130         113400 EVA-FAIL-GF-18-2.                                                NC2254.2
   001131         113500     MOVE   "CONDITIONAL EXPRESSION SHOULD BE FALSE"              NC2254.2
   001132         113600          TO RE-MARK.                                             NC2254.2 81
   001133         113700     PERFORM FAIL.                                                NC2254.2 227
   001134         113800 EVA-WRITE-GF-18-2.                                               NC2254.2
   001135         113900     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001136         114000*                                                                 NC2254.2
   001137         114100 EVA-TEST-GF-18-3.                                                NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114200     ADD     1       TO REC-CT.                                   NC2254.2 123
   001139         114300     MOVE   "EVA-TEST-GF-18-3" TO PAR-NAME.                       NC2254.2 76
   001140         114400     EVALUATE WRK-XN-00001-1 NUMERIC                              NC2254.2 43
   001141         114500        WHEN ANY                                                  NC2254.2
   001142      1  114600             PERFORM PASS                                         NC2254.2 226
   001143      1  114700             GO TO   EVA-WRITE-GF-18-3.                           NC2254.2 1151
   001144         114800     GO TO   EVA-FAIL-GF-18-3.                                    NC2254.2 1148
   001145         114900 EVA-DELETE-GF-18-3.                                              NC2254.2
   001146         115000     PERFORM DE-LETE.                                             NC2254.2 228
   001147         115100     GO TO EVA-WRITE-GF-18-3.                                     NC2254.2 1151
   001148         115200 EVA-FAIL-GF-18-3.                                                NC2254.2
   001149         115300     MOVE   "WHEN 'ANY' SHOULD HAVE EXECUTED" TO RE-MARK          NC2254.2 81
   001150         115400     PERFORM FAIL.                                                NC2254.2 227
   001151         115500 EVA-WRITE-GF-18-3.                                               NC2254.2
   001152         115600     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001153         115700*                                                                 NC2254.2
   001154         115800 EVA-INIT-GF-19.                                                  NC2254.2
   001155         115900     MOVE   "VI-84 6.12.4 GR1(c)" TO ANSI-REFERENCE.              NC2254.2 132
   001156         116000     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001157         116100     MOVE    9  TO WRK-DU-08V00.                                  NC2254.2 48
   001158         116200     GO TO   EVA-TEST-GF-19-1.                                    NC2254.2 1163
   001159         116300 EVA-DELETE-GF-19.                                                NC2254.2
   001160         116400     PERFORM DE-LETE.                                             NC2254.2 228
   001161         116500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001162         116600     GO TO   EVA-INIT-GF-20.                                      NC2254.2 1216
   001163         116700 EVA-TEST-GF-19-1.                                                NC2254.2
   001164         116800     MOVE   "EVA-TEST-GF-19-1" TO PAR-NAME.                       NC2254.2 76
   001165         116900     EVALUATE (WRK-DU-08V00 * 9)                                  NC2254.2 48
   001166         117000        WHEN WS-81                                                NC2254.2 63
   001167      1  117100             PERFORM PASS                                         NC2254.2 226
   001168      1  117200             GO TO   EVA-WRITE-GF-19-1.                           NC2254.2 1177
   001169         117300     GO TO   EVA-FAIL-GF-19-1.                                    NC2254.2 1173
   001170         117400 EVA-DELETE-GF-19-1.                                              NC2254.2
   001171         117500     PERFORM DE-LETE.                                             NC2254.2 228
   001172         117600     GO TO EVA-WRITE-GF-19-1.                                     NC2254.2 1177
   001173         117700 EVA-FAIL-GF-19-1.                                                NC2254.2
   001174         117800     MOVE   "SELECTION SUBJECT SHOULD EQUAL IDENTIFIER"           NC2254.2
   001175         117900          TO RE-MARK.                                             NC2254.2 81
   001176         118000     PERFORM FAIL.                                                NC2254.2 227
   001177         118100 EVA-WRITE-GF-19-1.                                               NC2254.2
   001178         118200     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001179         118300*                                                                 NC2254.2
   001180         118400 EVA-TEST-GF-19-2.                                                NC2254.2
   001181         118500     ADD     1       TO REC-CT.                                   NC2254.2 123
   001182         118600     MOVE   "EVA-TEST-GF-19-2" TO PAR-NAME.                       NC2254.2 76
   001183         118700     EVALUATE (WRK-DU-08V00 * 9)                                  NC2254.2 48
   001184         118800        WHEN 81                                                   NC2254.2
   001185      1  118900             PERFORM PASS                                         NC2254.2 226
   001186      1  119000             GO TO   EVA-WRITE-GF-19-2.                           NC2254.2 1195
   001187         119100     GO TO   EVA-FAIL-GF-19-2.                                    NC2254.2 1191
   001188         119200 EVA-DELETE-GF-19-2.                                              NC2254.2
   001189         119300     PERFORM DE-LETE.                                             NC2254.2 228
   001190         119400     GO TO EVA-WRITE-GF-19-2.                                     NC2254.2 1195
   001191         119500 EVA-FAIL-GF-19-2.                                                NC2254.2
   001192         119600     MOVE   "SELECTION SUBJECT SHOULD EQUAL LITERAL"              NC2254.2
   001193         119700          TO RE-MARK.                                             NC2254.2 81
   001194         119800     PERFORM FAIL.                                                NC2254.2 227
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119900 EVA-WRITE-GF-19-2.                                               NC2254.2
   001196         120000     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001197         120100*                                                                 NC2254.2
   001198         120200 EVA-TEST-GF-19-3.                                                NC2254.2
   001199         120300     ADD     1       TO REC-CT.                                   NC2254.2 123
   001200         120400     MOVE   "EVA-TEST-GF-19-3" TO PAR-NAME.                       NC2254.2 76
   001201         120500     EVALUATE (WRK-DU-08V00 * 9)                                  NC2254.2 48
   001202         120600        WHEN (9 + 9 + 9 + 9 + 9 + 9 + 9 + 9 + 9)                  NC2254.2
   001203      1  120700             PERFORM PASS                                         NC2254.2 226
   001204      1  120800             GO TO   EVA-WRITE-GF-19-3.                           NC2254.2 1213
   001205         120900     GO TO   EVA-FAIL-GF-19-3.                                    NC2254.2 1209
   001206         121000 EVA-DELETE-GF-19-3.                                              NC2254.2
   001207         121100     PERFORM DE-LETE.                                             NC2254.2 228
   001208         121200     GO TO EVA-WRITE-GF-19-3.                                     NC2254.2 1213
   001209         121300 EVA-FAIL-GF-19-3.                                                NC2254.2
   001210         121400     MOVE   "SELECTION SUBJECT SHOULD EQUAL ARITHMETIC EXPRESSION"NC2254.2
   001211         121500          TO RE-MARK.                                             NC2254.2 81
   001212         121600     PERFORM FAIL.                                                NC2254.2 227
   001213         121700 EVA-WRITE-GF-19-3.                                               NC2254.2
   001214         121800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001215         121900*                                                                 NC2254.2
   001216         122000 EVA-INIT-GF-20.                                                  NC2254.2
   001217         122100     MOVE   "VI-84 6.12.4 GR1(c)" TO ANSI-REFERENCE.              NC2254.2 132
   001218         122200     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001219         122300     MOVE    8  TO WRK-DU-08V00.                                  NC2254.2 48
   001220         122400     GO TO   EVA-TEST-GF-20-1.                                    NC2254.2 1225
   001221         122500 EVA-DELETE-GF-20.                                                NC2254.2
   001222         122600     PERFORM DE-LETE.                                             NC2254.2 228
   001223         122700     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001224         122800     GO TO   EVA-INIT-GF-21.                                      NC2254.2 1279
   001225         122900 EVA-TEST-GF-20-1.                                                NC2254.2
   001226         123000     MOVE   "EVA-TEST-GF-20-1" TO PAR-NAME.                       NC2254.2 76
   001227         123100     EVALUATE (WRK-DU-08V00 * 9)                                  NC2254.2 48
   001228         123200        WHEN WS-81                                                NC2254.2 63
   001229      1  123300             GO TO EVA-FAIL-GF-20-1.                              NC2254.2 1235
   001230         123400     PERFORM PASS.                                                NC2254.2 226
   001231         123500     GO TO   EVA-WRITE-GF-20-1.                                   NC2254.2 1239
   001232         123600 EVA-DELETE-GF-20-1.                                              NC2254.2
   001233         123700     PERFORM DE-LETE.                                             NC2254.2 228
   001234         123800     GO TO EVA-WRITE-GF-20-1.                                     NC2254.2 1239
   001235         123900 EVA-FAIL-GF-20-1.                                                NC2254.2
   001236         124000     MOVE "SELECTION SUBJECT SHOULD NOT EQUAL IDENTIFIER"         NC2254.2
   001237         124100          TO RE-MARK                                              NC2254.2 81
   001238         124200     PERFORM FAIL.                                                NC2254.2 227
   001239         124300 EVA-WRITE-GF-20-1.                                               NC2254.2
   001240         124400     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001241         124500*                                                                 NC2254.2
   001242         124600 EVA-TEST-GF-20-2.                                                NC2254.2
   001243         124700     ADD     1 TO REC-CT.                                         NC2254.2 123
   001244         124800     MOVE   "EVA-TEST-GF-20-2" TO PAR-NAME.                       NC2254.2 76
   001245         124900     EVALUATE (WRK-DU-08V00 * 9)                                  NC2254.2 48
   001246         125000        WHEN 81                                                   NC2254.2
   001247      1  125100             GO TO EVA-FAIL-GF-20-2.                              NC2254.2 1253
   001248         125200     PERFORM PASS.                                                NC2254.2 226
   001249         125300     GO TO   EVA-WRITE-GF-20-2.                                   NC2254.2 1257
   001250         125400 EVA-DELETE-GF-20-2.                                              NC2254.2
   001251         125500     PERFORM DE-LETE.                                             NC2254.2 228
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125600     GO TO EVA-WRITE-GF-20-2.                                     NC2254.2 1257
   001253         125700 EVA-FAIL-GF-20-2.                                                NC2254.2
   001254         125800     MOVE   "SELECTION SUBJECT SHOULD NOT EQUAL LITERAL"          NC2254.2
   001255         125900          TO RE-MARK                                              NC2254.2 81
   001256         126000     PERFORM FAIL.                                                NC2254.2 227
   001257         126100 EVA-WRITE-GF-20-2.                                               NC2254.2
   001258         126200     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001259         126300                                                                  NC2254.2
   001260         126400 EVA-TEST-GF-20-3.                                                NC2254.2
   001261         126500     ADD     1       TO REC-CT.                                   NC2254.2 123
   001262         126600     MOVE   "EVA-TEST-GF-20-3" TO PAR-NAME.                       NC2254.2 76
   001263         126700     EVALUATE (WRK-DU-08V00 * 9)                                  NC2254.2 48
   001264         126800        WHEN (9 + 9 + 9 + 9 + 9 + 9 + 9 + 9 + 9)                  NC2254.2
   001265      1  126900             GO TO EVA-FAIL-GF-20-3.                              NC2254.2 1271
   001266         127000     PERFORM PASS.                                                NC2254.2 226
   001267         127100     GO TO   EVA-WRITE-GF-20-3.                                   NC2254.2 1276
   001268         127200 EVA-DELETE-GF-20-3.                                              NC2254.2
   001269         127300     PERFORM DE-LETE.                                             NC2254.2 228
   001270         127400     GO TO EVA-WRITE-GF-20-3.                                     NC2254.2 1276
   001271         127500 EVA-FAIL-GF-20-3.                                                NC2254.2
   001272         127600     MOVE                                                         NC2254.2
   001273         127700     "SELECTION SUBJECT SHOULD NOT = ARITHMETIC EXPRESSION"       NC2254.2
   001274         127800          TO RE-MARK                                              NC2254.2 81
   001275         127900     PERFORM FAIL.                                                NC2254.2 227
   001276         128000 EVA-WRITE-GF-20-3.                                               NC2254.2
   001277         128100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001278         128200*                                                                 NC2254.2
   001279         128300 EVA-INIT-GF-21.                                                  NC2254.2
   001280         128400     MOVE   "VI-84 6.12.4 GR1(e)" TO ANSI-REFERENCE.              NC2254.2 132
   001281         128500     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001282         128600     MOVE    SPACE TO WRK-XN-00001-1.                             NC2254.2 IMP 43
   001283         128700     GO TO   EVA-TEST-GF-21-1.                                    NC2254.2 1288
   001284         128800 EVA-DELETE-GF-21.                                                NC2254.2
   001285         128900     PERFORM DE-LETE.                                             NC2254.2 228
   001286         129000     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001287         129100     GO TO   EVA-INIT-GF-22.                                      NC2254.2 1305
   001288         129200 EVA-TEST-GF-21-1.                                                NC2254.2
   001289         129300     MOVE   "EVA-TEST-GF-21-1" TO PAR-NAME.                       NC2254.2 76
   001290         129400     EVALUATE TRUE                                                NC2254.2
   001291         129500        WHEN WRK-XN-00001-1 = SPACE                               NC2254.2 43 IMP
   001292      1  129600             PERFORM PASS                                         NC2254.2 226
   001293      1  129700             GO TO   EVA-WRITE-GF-21-1.                           NC2254.2 1302
   001294         129800     GO TO   EVA-FAIL-GF-21-1.                                    NC2254.2 1298
   001295         129900 EVA-DELETE-GF-21-1.                                              NC2254.2
   001296         130000     PERFORM DE-LETE.                                             NC2254.2 228
   001297         130100     GO TO EVA-WRITE-GF-21-1.                                     NC2254.2 1302
   001298         130200 EVA-FAIL-GF-21-1.                                                NC2254.2
   001299         130300     MOVE   "SELECTION OBJECT CONDITION SHOULD BE TRUE"           NC2254.2
   001300         130400          TO RE-MARK.                                             NC2254.2 81
   001301         130500     PERFORM FAIL.                                                NC2254.2 227
   001302         130600 EVA-WRITE-GF-21-1.                                               NC2254.2
   001303         130700     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001304         130800*                                                                 NC2254.2
   001305         130900 EVA-INIT-GF-22.                                                  NC2254.2
   001306         131000     MOVE   "VI-84 6.12.4 GR1(e)" TO ANSI-REFERENCE.              NC2254.2 132
   001307         131100     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001308         131200     MOVE   "#" TO WRK-XN-00001-1.                                NC2254.2 43
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131300     GO TO   EVA-TEST-GF-22-1.                                    NC2254.2 1314
   001310         131400 EVA-DELETE-GF-22.                                                NC2254.2
   001311         131500     PERFORM DE-LETE.                                             NC2254.2 228
   001312         131600     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001313         131700     GO TO   EVA-INIT-GF-23.                                      NC2254.2 1331
   001314         131800 EVA-TEST-GF-22-1.                                                NC2254.2
   001315         131900     MOVE   "EVA-TEST-GF-22-1" TO PAR-NAME.                       NC2254.2 76
   001316         132000     EVALUATE TRUE                                                NC2254.2
   001317         132100        WHEN WRK-XN-00001-1 = SPACE                               NC2254.2 43 IMP
   001318      1  132200             GO TO EVA-FAIL-GF-22-1.                              NC2254.2 1324
   001319         132300     PERFORM PASS.                                                NC2254.2 226
   001320         132400     GO TO   EVA-WRITE-GF-22-1.                                   NC2254.2 1328
   001321         132500 EVA-DELETE-GF-22-1.                                              NC2254.2
   001322         132600     PERFORM DE-LETE.                                             NC2254.2 228
   001323         132700     GO TO EVA-WRITE-GF-22-1.                                     NC2254.2 1328
   001324         132800 EVA-FAIL-GF-22-1.                                                NC2254.2
   001325         132900     MOVE   "SELECTION OBJECT CONDITION SHOULD BE FALSE"          NC2254.2
   001326         133000          TO RE-MARK                                              NC2254.2 81
   001327         133100     PERFORM FAIL.                                                NC2254.2 227
   001328         133200 EVA-WRITE-GF-22-1.                                               NC2254.2
   001329         133300     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001330         133400*                                                                 NC2254.2
   001331         133500 EVA-INIT-GF-23.                                                  NC2254.2
   001332         133600     MOVE   "VI-84 6.12.4 GR1(e)" TO ANSI-REFERENCE.              NC2254.2 132
   001333         133700     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001334         133800     MOVE    SPACE TO WRK-XN-00001-1.                             NC2254.2 IMP 43
   001335         133900     GO TO   EVA-TEST-GF-23-1.                                    NC2254.2 1340
   001336         134000 EVA-DELETE-GF-23.                                                NC2254.2
   001337         134100     PERFORM DE-LETE.                                             NC2254.2 228
   001338         134200     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001339         134300     GO TO   EVA-INIT-GF-24.                                      NC2254.2 1357
   001340         134400 EVA-TEST-GF-23-1.                                                NC2254.2
   001341         134500     MOVE   "EVA-TEST-GF-23-1" TO PAR-NAME.                       NC2254.2 76
   001342         134600     EVALUATE FALSE                                               NC2254.2
   001343         134700        WHEN WRK-XN-00001-1 = SPACE                               NC2254.2 43 IMP
   001344      1  134800             GO TO EVA-FAIL-GF-23-1.                              NC2254.2 1350
   001345         134900     PERFORM PASS.                                                NC2254.2 226
   001346         135000     GO TO   EVA-WRITE-GF-23-1.                                   NC2254.2 1354
   001347         135100 EVA-DELETE-GF-23-1.                                              NC2254.2
   001348         135200     PERFORM DE-LETE.                                             NC2254.2 228
   001349         135300     GO TO EVA-WRITE-GF-23-1.                                     NC2254.2 1354
   001350         135400 EVA-FAIL-GF-23-1.                                                NC2254.2
   001351         135500     MOVE   "SELECTION OBJECT CONDITION SHOULD BE TRUE"           NC2254.2
   001352         135600          TO RE-MARK                                              NC2254.2 81
   001353         135700     PERFORM FAIL.                                                NC2254.2 227
   001354         135800 EVA-WRITE-GF-23-1.                                               NC2254.2
   001355         135900     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001356         136000*                                                                 NC2254.2
   001357         136100 EVA-INIT-GF-24.                                                  NC2254.2
   001358         136200     MOVE   "VI-84 6.12.4 GR1(e)" TO ANSI-REFERENCE.              NC2254.2 132
   001359         136300     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001360         136400     MOVE   "#" TO WRK-XN-00001-1.                                NC2254.2 43
   001361         136500     GO TO   EVA-TEST-GF-24-1.                                    NC2254.2 1366
   001362         136600 EVA-DELETE-GF-24.                                                NC2254.2
   001363         136700     PERFORM DE-LETE.                                             NC2254.2 228
   001364         136800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001365         136900     GO TO   EVA-INIT-GF-25.                                      NC2254.2 1383
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         137000 EVA-TEST-GF-24-1.                                                NC2254.2
   001367         137100     MOVE   "EVA-TEST-GF-24-1" TO PAR-NAME.                       NC2254.2 76
   001368         137200     EVALUATE FALSE                                               NC2254.2
   001369         137300        WHEN WRK-XN-00001-1 = SPACE                               NC2254.2 43 IMP
   001370      1  137400             PERFORM PASS                                         NC2254.2 226
   001371      1  137500             GO TO   EVA-WRITE-GF-24-1.                           NC2254.2 1380
   001372         137600     GO TO   EVA-FAIL-GF-24-1.                                    NC2254.2 1376
   001373         137700 EVA-DELETE-GF-24-1.                                              NC2254.2
   001374         137800     PERFORM DE-LETE.                                             NC2254.2 228
   001375         137900     GO TO EVA-WRITE-GF-24-1.                                     NC2254.2 1380
   001376         138000 EVA-FAIL-GF-24-1.                                                NC2254.2
   001377         138100     MOVE   "SELECTION OBJECT CONDITION SHOULD BE FALSE"          NC2254.2
   001378         138200          TO RE-MARK.                                             NC2254.2 81
   001379         138300     PERFORM FAIL.                                                NC2254.2 227
   001380         138400 EVA-WRITE-GF-24-1.                                               NC2254.2
   001381         138500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001382         138600*                                                                 NC2254.2
   001383         138700 EVA-INIT-GF-25.                                                  NC2254.2
   001384         138800     MOVE   "VI-84 6.12.4 GR3(b)" TO ANSI-REFERENCE.              NC2254.2 132
   001385         138900     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001386         139000     MOVE    26 TO WRK-DU-08V00.                                  NC2254.2 48
   001387         139100     GO TO   EVA-TEST-GF-25-1.                                    NC2254.2 1392
   001388         139200 EVA-DELETE-GF-25.                                                NC2254.2
   001389         139300     PERFORM DE-LETE.                                             NC2254.2 228
   001390         139400     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001391         139500     GO TO   EVA-INIT-GF-16.                                      NC2254.2 988
   001392         139600 EVA-TEST-GF-25-1.                                                NC2254.2
   001393         139700     MOVE   "EVA-TEST-GF-25-1" TO PAR-NAME.                       NC2254.2 76
   001394         139800     EVALUATE 26                                                  NC2254.2
   001395         139900        WHEN WRK-DU-08V00                                         NC2254.2 48
   001396      1  140000             PERFORM PASS                                         NC2254.2 226
   001397         140100        WHEN OTHER                                                NC2254.2
   001398      1  140200             GO TO EVA-FAIL-GF-25-1.                              NC2254.2 1403
   001399         140300     GO TO EVA-WRITE-GF-25-1.                                     NC2254.2 1407
   001400         140400 EVA-DELETE-GF-25-1.                                              NC2254.2
   001401         140500     PERFORM DE-LETE.                                             NC2254.2 228
   001402         140600     GO TO EVA-WRITE-GF-25-1.                                     NC2254.2 1407
   001403         140700 EVA-FAIL-GF-25-1.                                                NC2254.2
   001404         140800     MOVE   "IDENTIFIER AND LITERAL SHOULD BE EQUAL"              NC2254.2
   001405         140900          TO RE-MARK                                              NC2254.2 81
   001406         141000     PERFORM FAIL.                                                NC2254.2 227
   001407         141100 EVA-WRITE-GF-25-1.                                               NC2254.2
   001408         141200     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001409         141300*                                                                 NC2254.2
   001410         141400 EVA-INIT-GF-26.                                                  NC2254.2
   001411         141500     MOVE   "VI-84 6.12.4 GR3(b)" TO ANSI-REFERENCE.              NC2254.2 132
   001412         141600     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001413         141700     MOVE    78 TO WRK-DU-08V00.                                  NC2254.2 48
   001414         141800     GO TO   EVA-TEST-GF-26-1.                                    NC2254.2 1419
   001415         141900 EVA-DELETE-GF-26.                                                NC2254.2
   001416         142000     PERFORM DE-LETE.                                             NC2254.2 228
   001417         142100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001418         142200     GO TO   EVA-INIT-GF-27.                                      NC2254.2 1437
   001419         142300 EVA-TEST-GF-26-1.                                                NC2254.2
   001420         142400     MOVE   "EVA-TEST-GF-26-1" TO PAR-NAME.                       NC2254.2 76
   001421         142500     EVALUATE 1234                                                NC2254.2
   001422         142600        WHEN WRK-DU-08V00                                         NC2254.2 48
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423      1  142700             GO TO EVA-FAIL-GF-26-1                               NC2254.2 1430
   001424         142800        WHEN OTHER                                                NC2254.2
   001425      1  142900             PERFORM PASS.                                        NC2254.2 226
   001426         143000     GO TO EVA-WRITE-GF-26-1.                                     NC2254.2 1434
   001427         143100 EVA-DELETE-GF-26-1.                                              NC2254.2
   001428         143200     PERFORM DE-LETE.                                             NC2254.2 228
   001429         143300     GO TO EVA-WRITE-GF-26-1.                                     NC2254.2 1434
   001430         143400 EVA-FAIL-GF-26-1.                                                NC2254.2
   001431         143500     MOVE   "IDENTIFIER AND LITERAL SHOULD NOT BE EQUAL"          NC2254.2
   001432         143600          TO RE-MARK                                              NC2254.2 81
   001433         143700     PERFORM FAIL.                                                NC2254.2 227
   001434         143800 EVA-WRITE-GF-26-1.                                               NC2254.2
   001435         143900     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001436         144000*                                                                 NC2254.2
   001437         144100 EVA-INIT-GF-27.                                                  NC2254.2
   001438         144200     MOVE   "VI-84 6.12.4 GR3(c)" TO ANSI-REFERENCE.              NC2254.2 132
   001439         144300     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001440         144400     MOVE    26 TO WRK-DU-08V00.                                  NC2254.2 48
   001441         144500     GO TO   EVA-TEST-GF-27-1.                                    NC2254.2 1446
   001442         144600 EVA-DELETE-GF-27.                                                NC2254.2
   001443         144700     PERFORM DE-LETE.                                             NC2254.2 228
   001444         144800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001445         144900     GO TO   EVA-INIT-GF-28.                                      NC2254.2 1464
   001446         145000 EVA-TEST-GF-27-1.                                                NC2254.2
   001447         145100     MOVE   "EVA-TEST-GF-27-1" TO PAR-NAME.                       NC2254.2 76
   001448         145200     EVALUATE 26                                                  NC2254.2
   001449         145300        WHEN NOT WRK-DU-08V00                                     NC2254.2 48
   001450      1  145400             GO TO   EVA-FAIL-GF-27-1                             NC2254.2 1457
   001451         145500     END-EVALUATE.                                                NC2254.2
   001452         145600     PERFORM PASS.                                                NC2254.2 226
   001453         145700     GO TO   EVA-WRITE-GF-27-1.                                   NC2254.2 1461
   001454         145800 EVA-DELETE-GF-27-1.                                              NC2254.2
   001455         145900     PERFORM DE-LETE.                                             NC2254.2 228
   001456         146000     GO TO EVA-WRITE-GF-27-1.                                     NC2254.2 1461
   001457         146100 EVA-FAIL-GF-27-1.                                                NC2254.2
   001458         146200     MOVE   "IDENTIFIER AND LITERAL SHOULD BE EQUAL"              NC2254.2
   001459         146300          TO RE-MARK                                              NC2254.2 81
   001460         146400     PERFORM FAIL.                                                NC2254.2 227
   001461         146500 EVA-WRITE-GF-27-1.                                               NC2254.2
   001462         146600     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001463         146700*                                                                 NC2254.2
   001464         146800 EVA-INIT-GF-28.                                                  NC2254.2
   001465         146900     MOVE   "VI-84 6.12.4 GR3(c)" TO ANSI-REFERENCE.              NC2254.2 132
   001466         147000     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001467         147100     MOVE    78 TO WRK-DU-08V00.                                  NC2254.2 48
   001468         147200     GO TO   EVA-TEST-GF-28-1.                                    NC2254.2 1473
   001469         147300 EVA-DELETE-GF-28.                                                NC2254.2
   001470         147400     PERFORM DE-LETE.                                             NC2254.2 228
   001471         147500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001472         147600     GO TO   EVA-INIT-GF-29.                                      NC2254.2 1491
   001473         147700 EVA-TEST-GF-28-1.                                                NC2254.2
   001474         147800     MOVE   "EVA-TEST-GF-28-1" TO PAR-NAME.                       NC2254.2 76
   001475         147900     EVALUATE 1234                                                NC2254.2
   001476         148000        WHEN NOT WRK-DU-08V00                                     NC2254.2 48
   001477      1  148100             PERFORM PASS                                         NC2254.2 226
   001478      1  148200             GO TO   EVA-WRITE-GF-28-1                            NC2254.2 1488
   001479         148300     end-evaluate.                                                NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148400     GO TO   EVA-FAIL-GF-28-1.                                    NC2254.2 1484
   001481         148500 EVA-DELETE-GF-28-1.                                              NC2254.2
   001482         148600     PERFORM DE-LETE.                                             NC2254.2 228
   001483         148700     GO TO EVA-WRITE-GF-28-1.                                     NC2254.2 1488
   001484         148800 EVA-FAIL-GF-28-1.                                                NC2254.2
   001485         148900     MOVE   "IDENTIFIER AND LITERAL SHOULD NOT BE EQUAL"          NC2254.2
   001486         149000          TO RE-MARK.                                             NC2254.2 81
   001487         149100     PERFORM FAIL.                                                NC2254.2 227
   001488         149200 EVA-WRITE-GF-28-1.                                               NC2254.2
   001489         149300     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001490         149400*                                                                 NC2254.2
   001491         149500 EVA-INIT-GF-29.                                                  NC2254.2
   001492         149600     MOVE   "VI-84 6.12.4 GR3" TO ANSI-REFERENCE.                 NC2254.2 132
   001493         149700     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001494         149800     MOVE    8  TO WRK-XN-00001-1.                                NC2254.2 43
   001495         149900     GO TO   EVA-TEST-GF-29-1.                                    NC2254.2 1500
   001496         150000 EVA-DELETE-GF-29.                                                NC2254.2
   001497         150100     PERFORM DE-LETE.                                             NC2254.2 228
   001498         150200     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001499         150300     GO TO   EVA-INIT-GF-30.                                      NC2254.2 1519
   001500         150400 EVA-TEST-GF-29-1.                                                NC2254.2
   001501         150500     MOVE   "EVA-TEST-GF-29-1" TO PAR-NAME.                       NC2254.2 76
   001502         150600     EVALUATE WRK-XN-00001-1 NUMERIC                              NC2254.2 43
   001503         150700        WHEN TRUE                                                 NC2254.2
   001504      1  150800             PERFORM PASS                                         NC2254.2 226
   001505         150900        WHEN OTHER                                                NC2254.2
   001506      1  151000             GO TO   EVA-FAIL-GF-29-1                             NC2254.2 1512
   001507         151100     END-EVALUATE                                                 NC2254.2
   001508         151200     GO TO   EVA-WRITE-GF-29-1.                                   NC2254.2 1516
   001509         151300 EVA-DELETE-GF-29-1.                                              NC2254.2
   001510         151400     PERFORM DE-LETE.                                             NC2254.2 228
   001511         151500     GO TO EVA-WRITE-GF-29-1.                                     NC2254.2 1516
   001512         151600 EVA-FAIL-GF-29-1.                                                NC2254.2
   001513         151700     MOVE   "CONDITIONAL EXPRESSION SHOULD BE TRUE"               NC2254.2
   001514         151800          TO RE-MARK                                              NC2254.2 81
   001515         151900     PERFORM FAIL.                                                NC2254.2 227
   001516         152000 EVA-WRITE-GF-29-1.                                               NC2254.2
   001517         152100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001518         152200*                                                                 NC2254.2
   001519         152300 EVA-INIT-GF-30.                                                  NC2254.2
   001520         152400     MOVE   "VI-84 6.12.4 GR3" TO ANSI-REFERENCE.                 NC2254.2 132
   001521         152500     MOVE    1  TO REC-CT.                                        NC2254.2 123
   001522         152600     MOVE   "*" TO WRK-XN-00001-1.                                NC2254.2 43
   001523         152700     GO TO   EVA-TEST-GF-30-1.                                    NC2254.2 1528
   001524         152800 EVA-DELETE-GF-30.                                                NC2254.2
   001525         152900     PERFORM DE-LETE.                                             NC2254.2 228
   001526         153000     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001527         153100     GO TO   EVA-INIT-GF-31.                                      NC2254.2 1547
   001528         153200 EVA-TEST-GF-30-1.                                                NC2254.2
   001529         153300     MOVE   "EVA-TEST-GF-30-1" TO PAR-NAME.                       NC2254.2 76
   001530         153400     EVALUATE WRK-XN-00001-1 NUMERIC                              NC2254.2 43
   001531         153500        WHEN TRUE                                                 NC2254.2
   001532      1  153600             GO TO EVA-FAIL-GF-30-1                               NC2254.2 1540
   001533         153700        WHEN OTHER                                                NC2254.2
   001534      1  153800             PERFORM PASS                                         NC2254.2 226
   001535         153900     END-EVALUATE                                                 NC2254.2
   001536         154000     GO TO   EVA-WRITE-GF-30-1.                                   NC2254.2 1544
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154100 EVA-DELETE-GF-30-1.                                              NC2254.2
   001538         154200     PERFORM DE-LETE.                                             NC2254.2 228
   001539         154300     GO TO EVA-WRITE-GF-30-1.                                     NC2254.2 1544
   001540         154400 EVA-FAIL-GF-30-1.                                                NC2254.2
   001541         154500     MOVE   "CONDITIONAL EXPRESSION SHOULD BE FALSE"              NC2254.2
   001542         154600          TO RE-MARK                                              NC2254.2 81
   001543         154700     PERFORM FAIL.                                                NC2254.2 227
   001544         154800 EVA-WRITE-GF-30-1.                                               NC2254.2
   001545         154900     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001546         155000*                                                                 NC2254.2
   001547         155100 EVA-INIT-GF-31.                                                  NC2254.2
   001548         155200     MOVE   "VI-84 6.12.4 GR3" TO ANSI-REFERENCE.                 NC2254.2 132
   001549         155300     MOVE   "EVA-TEST-GF-31-1"   TO PAR-NAME.                     NC2254.2 76
   001550         155400     MOVE    1   TO REC-CT.                                       NC2254.2 123
   001551         155500     MOVE    81  TO WRK-DU-08V00.                                 NC2254.2 48
   001552         155600     MOVE   "*"  TO WRK-XN-00001-1.                               NC2254.2 43
   001553         155700     MOVE    "*" TO WRK-XN-00001-2.                               NC2254.2 44
   001554         155800     MOVE    987 TO WRK-DU-08V00-1.                               NC2254.2 49
   001555         155900     MOVE    81  TO WRK-DU-08V00-2.                               NC2254.2 50
   001556         156000     MOVE    0   TO WRK-DU-08V00-3.                               NC2254.2 52
   001557         156100     MOVE    567 TO WRK-DU-08V00-4.                               NC2254.2 53
   001558         156200     GO TO   EVA-TEST-GF-31-0.                                    NC2254.2 1563
   001559         156300 EVA-DELETE-GF-31.                                                NC2254.2
   001560         156400     PERFORM DE-LETE.                                             NC2254.2 228
   001561         156500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001562         156600     GO TO   EVA-INIT-GF-32.                                      NC2254.2 1631
   001563         156700 EVA-TEST-GF-31-0.                                                NC2254.2
   001564         156800     EVALUATE     WRK-DU-08V00                                    NC2254.2 48
   001565         156900             ALSO 81                                              NC2254.2
   001566         157000             ALSO (WRK-DU-08V00 * 9)                              NC2254.2 48
   001567         157100             ALSO IT-IS-81                                        NC2254.2 51
   001568         157200             ALSO TRUE                                            NC2254.2
   001569         157300             ALSO FALSE                                           NC2254.2
   001570         157400        WHEN NOT  WRK-DU-08V00-1                                  NC2254.2 49
   001571         157500             ALSO WRK-DU-08V00-2                                  NC2254.2 50
   001572         157600             ALSO 729                                             NC2254.2
   001573         157700             ALSO TRUE                                            NC2254.2
   001574         157800             ALSO WRK-DU-08V00-3 = 0                              NC2254.2 52
   001575         157900             ALSO WRK-DU-08V00-4 < 9                              NC2254.2 53
   001576      1  158000                  MOVE  "A" TO WRK-XN-00001-1                     NC2254.2 43
   001577      1  158100                  MOVE  "B" TO WRK-XN-00001-2                     NC2254.2 44
   001578         158200        WHEN      81                                              NC2254.2
   001579         158300             ALSO WRK-DU-08V00                                    NC2254.2 48
   001580         158400             ALSO (9 * 9 * 9)                                     NC2254.2
   001581         158500             ALSO FALSE                                           NC2254.2
   001582         158600             ALSO WRK-XN-00001-2 = "*"                            NC2254.2 44
   001583         158700             ALSO WRK-DU-08V00 > 8                                NC2254.2 48
   001584      1  158800                  MOVE  "C" TO WRK-XN-00001-1                     NC2254.2 43
   001585      1  158900                  MOVE  "D" TO WRK-XN-00001-2                     NC2254.2 44
   001586         159000        WHEN      ANY                                             NC2254.2
   001587         159100             ALSO ANY                                             NC2254.2
   001588         159200             ALSO ANY                                             NC2254.2
   001589         159300             ALSO ANY                                             NC2254.2
   001590         159400             ALSO ANY                                             NC2254.2
   001591         159500             ALSO WRK-DU-08V00 = 6                                NC2254.2 48
   001592      1  159600                  MOVE  "E" TO WRK-XN-00001-1                     NC2254.2 43
   001593      1  159700                  MOVE  "F" TO WRK-XN-00001-2                     NC2254.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159800        WHEN      OTHER                                           NC2254.2
   001595      1  159900                  MOVE  "G" TO WRK-XN-00001-1                     NC2254.2 43
   001596      1  160000                  MOVE  "H" TO WRK-XN-00001-2                     NC2254.2 44
   001597         160100     END-EVALUATE.                                                NC2254.2
   001598         160200 EVA-TEST-GF-31-1.                                                NC2254.2
   001599         160300     IF      WRK-XN-00001-1 = "A"                                 NC2254.2 43
   001600      1  160400             PERFORM PASS                                         NC2254.2 226
   001601      1  160500             GO TO EVA-WRITE-GF-31-1                              NC2254.2 1612
   001602         160600     ELSE                                                         NC2254.2
   001603      1  160700             GO TO EVA-FAIL-GF-31-1.                              NC2254.2 1607
   001604         160800 EVA-DELETE-GF-31-1.                                              NC2254.2
   001605         160900     PERFORM DE-LETE.                                             NC2254.2 228
   001606         161000     GO TO EVA-WRITE-GF-31-1.                                     NC2254.2 1612
   001607         161100 EVA-FAIL-GF-31-1.                                                NC2254.2
   001608         161200     MOVE   "EVALUATE FAILURE" TO RE-MARK                         NC2254.2 81
   001609         161300     MOVE    WRK-XN-00001-1 TO COMPUTED-X                         NC2254.2 43 86
   001610         161400     MOVE   "A"             TO CORRECT-X                          NC2254.2 100
   001611         161500     PERFORM FAIL.                                                NC2254.2 227
   001612         161600 EVA-WRITE-GF-31-1.                                               NC2254.2
   001613         161700     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001614         161800 EVA-TEST-GF-31-2.                                                NC2254.2
   001615         161900     IF      WRK-XN-00001-2 = "B"                                 NC2254.2 44
   001616      1  162000             PERFORM PASS                                         NC2254.2 226
   001617      1  162100             GO TO EVA-WRITE-GF-31-2                              NC2254.2 1628
   001618         162200     ELSE                                                         NC2254.2
   001619      1  162300             GO TO EVA-FAIL-GF-31-2.                              NC2254.2 1623
   001620         162400 EVA-DELETE-GF-31-2.                                              NC2254.2
   001621         162500     PERFORM DE-LETE.                                             NC2254.2 228
   001622         162600     GO TO EVA-WRITE-GF-31-2.                                     NC2254.2 1628
   001623         162700 EVA-FAIL-GF-31-2.                                                NC2254.2
   001624         162800     MOVE   "EVALUATE FAILURE" TO RE-MARK                         NC2254.2 81
   001625         162900     MOVE    WRK-XN-00001-2 TO COMPUTED-X                         NC2254.2 44 86
   001626         163000     MOVE   "B"             TO CORRECT-X                          NC2254.2 100
   001627         163100     PERFORM FAIL.                                                NC2254.2 227
   001628         163200 EVA-WRITE-GF-31-2.                                               NC2254.2
   001629         163300     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001630         163400*                                                                 NC2254.2
   001631         163500 EVA-INIT-GF-32.                                                  NC2254.2
   001632         163600     MOVE   "VI-84 6.12.4 GR3" TO ANSI-REFERENCE.                 NC2254.2 132
   001633         163700     MOVE   "EVA-TEST-GF-32-1"   TO PAR-NAME.                     NC2254.2 76
   001634         163800     MOVE    1   TO REC-CT.                                       NC2254.2 123
   001635         163900     MOVE    81  TO WRK-DU-08V00.                                 NC2254.2 48
   001636         164000     MOVE   "*"  TO WRK-XN-00001-1.                               NC2254.2 43
   001637         164100     MOVE    987 TO WRK-DU-08V00-1.                               NC2254.2 49
   001638         164200     MOVE    7   TO WRK-DU-08V00-2.                               NC2254.2 50
   001639         164300     MOVE    0   TO WRK-DU-08V00-3.                               NC2254.2 52
   001640         164400     MOVE    567 TO WRK-DU-08V00-4.                               NC2254.2 53
   001641         164500     GO TO   EVA-TEST-GF-32-0.                                    NC2254.2 1646
   001642         164600 EVA-DELETE-GF-32.                                                NC2254.2
   001643         164700     PERFORM DE-LETE.                                             NC2254.2 228
   001644         164800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001645         164900     GO TO   EVA-INIT-GF-33.                                      NC2254.2 1715
   001646         165000 EVA-TEST-GF-32-0.                                                NC2254.2
   001647         165100     EVALUATE     WRK-DU-08V00                                    NC2254.2 48
   001648         165200             ALSO 81                                              NC2254.2
   001649         165300             ALSO (WRK-DU-08V00 * 2)                              NC2254.2 48
   001650         165400             ALSO IT-IS-81                                        NC2254.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165500             ALSO TRUE                                            NC2254.2
   001652         165600             ALSO FALSE                                           NC2254.2
   001653         165700        WHEN NOT  WRK-DU-08V00-1                                  NC2254.2 49
   001654         165800             ALSO WRK-DU-08V00-2                                  NC2254.2 50
   001655         165900             ALSO 81                                              NC2254.2
   001656         166000             ALSO TRUE                                            NC2254.2
   001657         166100             ALSO WRK-DU-08V00-3 = 0                              NC2254.2 52
   001658         166200             ALSO WRK-DU-08V00-4 < 9                              NC2254.2 53
   001659      1  166300                  MOVE  "A" TO WRK-XN-00001-1                     NC2254.2 43
   001660      1  166400                  MOVE  "B" TO WRK-XN-00001-2                     NC2254.2 44
   001661         166500        WHEN      81                                              NC2254.2
   001662         166600             ALSO WRK-DU-08V00-3 THROUGH WRK-DU-08V00-4           NC2254.2 52 53
   001663         166700             ALSO (WRK-DU-08V00-2 * 8) THRU (WRK-DU-08V00-2 * 30) NC2254.2 50 50
   001664         166800             ALSO FALSE                                           NC2254.2
   001665         166900             ALSO WRK-DU-08V00-2 = 7                              NC2254.2 50
   001666         167000             ALSO WRK-DU-08V00 > 88                               NC2254.2 48
   001667      1  167100                  MOVE  "C" TO WRK-XN-00001-1                     NC2254.2 43
   001668      1  167200                  MOVE  "D" TO WRK-XN-00001-2                     NC2254.2 44
   001669         167300        WHEN      ANY                                             NC2254.2
   001670         167400             ALSO ANY                                             NC2254.2
   001671         167500             ALSO ANY                                             NC2254.2
   001672         167600             ALSO ANY                                             NC2254.2
   001673         167700             ALSO ANY                                             NC2254.2
   001674         167800             ALSO WRK-DU-08V00 = 6                                NC2254.2 48
   001675      1  167900                  MOVE  "E" TO WRK-XN-00001-1                     NC2254.2 43
   001676      1  168000                  MOVE  "F" TO WRK-XN-00001-2                     NC2254.2 44
   001677         168100        WHEN      OTHER                                           NC2254.2
   001678      1  168200                  MOVE  "G" TO WRK-XN-00001-1                     NC2254.2 43
   001679      1  168300                  MOVE  "H" TO WRK-XN-00001-2                     NC2254.2 44
   001680         168400     END-EVALUATE.                                                NC2254.2
   001681         168500 EVA-TEST-GF-32-1.                                                NC2254.2
   001682         168600     IF      WRK-XN-00001-1 = "C"                                 NC2254.2 43
   001683      1  168700             PERFORM PASS                                         NC2254.2 226
   001684      1  168800             GO TO EVA-WRITE-GF-32-1                              NC2254.2 1695
   001685         168900     ELSE                                                         NC2254.2
   001686      1  169000             GO TO EVA-FAIL-GF-32-1.                              NC2254.2 1690
   001687         169100 EVA-DELETE-GF-32-1.                                              NC2254.2
   001688         169200     PERFORM DE-LETE.                                             NC2254.2 228
   001689         169300     GO TO EVA-WRITE-GF-32-1.                                     NC2254.2 1695
   001690         169400 EVA-FAIL-GF-32-1.                                                NC2254.2
   001691         169500     MOVE   "EVALUATE FAILURE" TO RE-MARK                         NC2254.2 81
   001692         169600     MOVE    WRK-XN-00001-1 TO COMPUTED-X                         NC2254.2 43 86
   001693         169700     MOVE   "C"             TO CORRECT-X                          NC2254.2 100
   001694         169800     PERFORM FAIL.                                                NC2254.2 227
   001695         169900 EVA-WRITE-GF-32-1.                                               NC2254.2
   001696         170000     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001697         170100 EVA-TEST-GF-32-2.                                                NC2254.2
   001698         170200     ADD     1 TO REC-CT.                                         NC2254.2 123
   001699         170300     IF      WRK-XN-00001-2 = "D"                                 NC2254.2 44
   001700      1  170400             PERFORM PASS                                         NC2254.2 226
   001701      1  170500             GO TO EVA-WRITE-GF-32-2                              NC2254.2 1712
   001702         170600     ELSE                                                         NC2254.2
   001703      1  170700             GO TO EVA-FAIL-GF-32-2.                              NC2254.2 1707
   001704         170800 EVA-DELETE-GF-32-2.                                              NC2254.2
   001705         170900     PERFORM DE-LETE.                                             NC2254.2 228
   001706         171000     GO TO EVA-WRITE-GF-32-2.                                     NC2254.2 1712
   001707         171100 EVA-FAIL-GF-32-2.                                                NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171200     MOVE   "EVALUATE FAILURE" TO RE-MARK                         NC2254.2 81
   001709         171300     MOVE    WRK-XN-00001-2 TO COMPUTED-X                         NC2254.2 44 86
   001710         171400     MOVE   "D"             TO CORRECT-X                          NC2254.2 100
   001711         171500     PERFORM FAIL.                                                NC2254.2 227
   001712         171600 EVA-WRITE-GF-32-2.                                               NC2254.2
   001713         171700     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001714         171800*                                                                 NC2254.2
   001715         171900 EVA-INIT-GF-33.                                                  NC2254.2
   001716         172000     MOVE   "VI-84 6.12.4 GR3" TO ANSI-REFERENCE.                 NC2254.2 132
   001717         172100     MOVE   "EVA-TEST-GF-33-1"   TO PAR-NAME.                     NC2254.2 76
   001718         172200     MOVE    1   TO REC-CT.                                       NC2254.2 123
   001719         172300     MOVE    6   TO WRK-DU-08V00.                                 NC2254.2 48
   001720         172400     MOVE   "*"  TO WRK-XN-00001-1.                               NC2254.2 43
   001721         172500     MOVE    987 TO WRK-DU-08V00-1.                               NC2254.2 49
   001722         172600     MOVE    7   TO WRK-DU-08V00-2.                               NC2254.2 50
   001723         172700     MOVE    0   TO WRK-DU-08V00-3.                               NC2254.2 52
   001724         172800     MOVE    567 TO WRK-DU-08V00-4.                               NC2254.2 53
   001725         172900     GO TO   EVA-TEST-GF-33-0.                                    NC2254.2 1730
   001726         173000 EVA-DELETE-GF-33.                                                NC2254.2
   001727         173100     PERFORM DE-LETE.                                             NC2254.2 228
   001728         173200     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001729         173300     GO TO   EVA-INIT-GF-34.                                      NC2254.2 1799
   001730         173400 EVA-TEST-GF-33-0.                                                NC2254.2
   001731         173500     EVALUATE     WRK-DU-08V00                                    NC2254.2 48
   001732         173600             ALSO 81                                              NC2254.2
   001733         173700             ALSO (WRK-DU-08V00-2 * 9)                            NC2254.2 50
   001734         173800             ALSO IT-IS-81                                        NC2254.2 51
   001735         173900             ALSO TRUE                                            NC2254.2
   001736         174000             ALSO FALSE                                           NC2254.2
   001737         174100        WHEN NOT  WRK-DU-08V00-1                                  NC2254.2 49
   001738         174200             ALSO WRK-DU-08V00-2                                  NC2254.2 50
   001739         174300             ALSO 81                                              NC2254.2
   001740         174400             ALSO TRUE                                            NC2254.2
   001741         174500             ALSO WRK-DU-08V00-3 = 0                              NC2254.2 52
   001742         174600             ALSO WRK-DU-08V00-4 < 9                              NC2254.2 53
   001743      1  174700                  MOVE  "A" TO WRK-XN-00001-1                     NC2254.2 43
   001744      1  174800                  MOVE  "B" TO WRK-XN-00001-2                     NC2254.2 44
   001745         174900        WHEN      81                                              NC2254.2
   001746         175000             ALSO WRK-DU-08V00-3 THROUGH WRK-DU-08V00-4           NC2254.2 52 53
   001747         175100             ALSO (WRK-DU-08V00-2 * 7) THRU (WRK-DU-08V00-2 * 8)  NC2254.2 50 50
   001748         175200             ALSO FALSE                                           NC2254.2
   001749         175300             ALSO WRK-DU-08V00-2 = 81                             NC2254.2 50
   001750         175400             ALSO WRK-DU-08V00 > 8                                NC2254.2 48
   001751      1  175500                  MOVE  "C" TO WRK-XN-00001-1                     NC2254.2 43
   001752      1  175600                  MOVE  "D" TO WRK-XN-00001-2                     NC2254.2 44
   001753         175700        WHEN      ANY                                             NC2254.2
   001754         175800             ALSO ANY                                             NC2254.2
   001755         175900             ALSO ANY                                             NC2254.2
   001756         176000             ALSO ANY                                             NC2254.2
   001757         176100             ALSO ANY                                             NC2254.2
   001758         176200             ALSO WRK-DU-08V00-2 = 6                              NC2254.2 50
   001759      1  176300                  MOVE  "E" TO WRK-XN-00001-1                     NC2254.2 43
   001760      1  176400                  MOVE  "F" TO WRK-XN-00001-2                     NC2254.2 44
   001761         176500        WHEN      OTHER                                           NC2254.2
   001762      1  176600                  MOVE  "G" TO WRK-XN-00001-1                     NC2254.2 43
   001763      1  176700                  MOVE  "H" TO WRK-XN-00001-2                     NC2254.2 44
   001764         176800     END-EVALUATE.                                                NC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176900 EVA-TEST-GF-33-1.                                                NC2254.2
   001766         177000     IF      WRK-XN-00001-1 = "E"                                 NC2254.2 43
   001767      1  177100             PERFORM PASS                                         NC2254.2 226
   001768      1  177200             GO TO EVA-WRITE-GF-33-1                              NC2254.2 1779
   001769         177300     ELSE                                                         NC2254.2
   001770      1  177400             GO TO EVA-FAIL-GF-33-1.                              NC2254.2 1774
   001771         177500 EVA-DELETE-GF-33-1.                                              NC2254.2
   001772         177600     PERFORM DE-LETE.                                             NC2254.2 228
   001773         177700     GO TO EVA-WRITE-GF-33-1.                                     NC2254.2 1779
   001774         177800 EVA-FAIL-GF-33-1.                                                NC2254.2
   001775         177900     MOVE   "EVALUATE FAILURE" TO RE-MARK                         NC2254.2 81
   001776         178000     MOVE    WRK-XN-00001-1 TO COMPUTED-X                         NC2254.2 43 86
   001777         178100     MOVE   "E"             TO CORRECT-X                          NC2254.2 100
   001778         178200     PERFORM FAIL.                                                NC2254.2 227
   001779         178300 EVA-WRITE-GF-33-1.                                               NC2254.2
   001780         178400     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001781         178500 EVA-TEST-GF-33-2.                                                NC2254.2
   001782         178600     ADD     1 TO REC-CT.                                         NC2254.2 123
   001783         178700     IF      WRK-XN-00001-2 = "F"                                 NC2254.2 44
   001784      1  178800             PERFORM PASS                                         NC2254.2 226
   001785      1  178900             GO TO EVA-WRITE-GF-33-2                              NC2254.2 1796
   001786         179000     ELSE                                                         NC2254.2
   001787      1  179100             GO TO EVA-FAIL-GF-33-2.                              NC2254.2 1791
   001788         179200 EVA-DELETE-GF-33-2.                                              NC2254.2
   001789         179300     PERFORM DE-LETE.                                             NC2254.2 228
   001790         179400     GO TO EVA-WRITE-GF-33-2.                                     NC2254.2 1796
   001791         179500 EVA-FAIL-GF-33-2.                                                NC2254.2
   001792         179600     MOVE   "EVALUATE FAILURE" TO RE-MARK                         NC2254.2 81
   001793         179700     MOVE    WRK-XN-00001-2 TO COMPUTED-X                         NC2254.2 44 86
   001794         179800     MOVE   "F"             TO CORRECT-X                          NC2254.2 100
   001795         179900     PERFORM FAIL.                                                NC2254.2 227
   001796         180000 EVA-WRITE-GF-33-2.                                               NC2254.2
   001797         180100     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001798         180200*                                                                 NC2254.2
   001799         180300 EVA-INIT-GF-34.                                                  NC2254.2
   001800         180400     MOVE   "VI-84 6.12.4 GR3" TO ANSI-REFERENCE.                 NC2254.2 132
   001801         180500     MOVE   "EVA-TEST-GF-34-1"   TO PAR-NAME.                     NC2254.2 76
   001802         180600     MOVE    1   TO REC-CT.                                       NC2254.2 123
   001803         180700     MOVE    99  TO WRK-DU-08V00.                                 NC2254.2 48
   001804         180800     MOVE   "*"  TO WRK-XN-00001-1.                               NC2254.2 43
   001805         180900     MOVE    99  TO WRK-DU-08V00-1.                               NC2254.2 49
   001806         181000     MOVE    99  TO WRK-DU-08V00-2.                               NC2254.2 50
   001807         181100     MOVE    99  TO WRK-DU-08V00-3.                               NC2254.2 52
   001808         181200     MOVE    99  TO WRK-DU-08V00-4.                               NC2254.2 53
   001809         181300     GO TO   EVA-TEST-GF-34-0.                                    NC2254.2 1814
   001810         181400 EVA-DELETE-GF-34.                                                NC2254.2
   001811         181500     PERFORM DE-LETE.                                             NC2254.2 228
   001812         181600     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001813         181700     GO TO   EVA-INIT-GF-35.                                      NC2254.2 1883
   001814         181800 EVA-TEST-GF-34-0.                                                NC2254.2
   001815         181900     EVALUATE     WRK-DU-08V00                                    NC2254.2 48
   001816         182000             ALSO 81                                              NC2254.2
   001817         182100             ALSO (WRK-DU-08V00-2 * 9)                            NC2254.2 50
   001818         182200             ALSO IT-IS-81                                        NC2254.2 51
   001819         182300             ALSO TRUE                                            NC2254.2
   001820         182400             ALSO FALSE                                           NC2254.2
   001821         182500        WHEN NOT  WRK-DU-08V00-1                                  NC2254.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822         182600             ALSO WRK-DU-08V00-2                                  NC2254.2 50
   001823         182700             ALSO 81                                              NC2254.2
   001824         182800             ALSO TRUE                                            NC2254.2
   001825         182900             ALSO WRK-DU-08V00-3 = 0                              NC2254.2 52
   001826         183000             ALSO WRK-DU-08V00-4 < 9                              NC2254.2 53
   001827      1  183100                  MOVE  "A" TO WRK-XN-00001-1                     NC2254.2 43
   001828      1  183200                  MOVE  "B" TO WRK-XN-00001-2                     NC2254.2 44
   001829         183300        WHEN      81                                              NC2254.2
   001830         183400             ALSO WRK-DU-08V00-3 THROUGH WRK-DU-08V00-4           NC2254.2 52 53
   001831         183500             ALSO (WRK-DU-08V00-2 * 7) THRU (WRK-DU-08V00-2 * 8)  NC2254.2 50 50
   001832         183600             ALSO FALSE                                           NC2254.2
   001833         183700             ALSO WRK-DU-08V00-2 = 81                             NC2254.2 50
   001834         183800             ALSO WRK-DU-08V00 > 8                                NC2254.2 48
   001835      1  183900                  MOVE  "C" TO WRK-XN-00001-1                     NC2254.2 43
   001836      1  184000                  MOVE  "D" TO WRK-XN-00001-2                     NC2254.2 44
   001837         184100        WHEN      ANY                                             NC2254.2
   001838         184200             ALSO ANY                                             NC2254.2
   001839         184300             ALSO ANY                                             NC2254.2
   001840         184400             ALSO ANY                                             NC2254.2
   001841         184500             ALSO ANY                                             NC2254.2
   001842         184600             ALSO WRK-DU-08V00 = 99                               NC2254.2 48
   001843      1  184700                  MOVE  "E" TO WRK-XN-00001-1                     NC2254.2 43
   001844      1  184800                  MOVE  "F" TO WRK-XN-00001-2                     NC2254.2 44
   001845         184900        WHEN      OTHER                                           NC2254.2
   001846      1  185000                  MOVE  "G" TO WRK-XN-00001-1                     NC2254.2 43
   001847      1  185100                  MOVE  "H" TO WRK-XN-00001-2                     NC2254.2 44
   001848         185200     END-EVALUATE.                                                NC2254.2
   001849         185300 EVA-TEST-GF-34-1.                                                NC2254.2
   001850         185400     IF      WRK-XN-00001-1 = "G"                                 NC2254.2 43
   001851      1  185500             PERFORM PASS                                         NC2254.2 226
   001852      1  185600             GO TO EVA-WRITE-GF-34-1                              NC2254.2 1863
   001853         185700     ELSE                                                         NC2254.2
   001854      1  185800             GO TO EVA-FAIL-GF-34-1.                              NC2254.2 1858
   001855         185900 EVA-DELETE-GF-34-1.                                              NC2254.2
   001856         186000     PERFORM DE-LETE.                                             NC2254.2 228
   001857         186100     GO TO EVA-WRITE-GF-34-1.                                     NC2254.2 1863
   001858         186200 EVA-FAIL-GF-34-1.                                                NC2254.2
   001859         186300     MOVE   "EVALUATE FAILURE" TO RE-MARK                         NC2254.2 81
   001860         186400     MOVE    WRK-XN-00001-1 TO COMPUTED-X                         NC2254.2 43 86
   001861         186500     MOVE   "G"             TO CORRECT-X                          NC2254.2 100
   001862         186600     PERFORM FAIL.                                                NC2254.2 227
   001863         186700 EVA-WRITE-GF-34-1.                                               NC2254.2
   001864         186800     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001865         186900 EVA-TEST-GF-34-2.                                                NC2254.2
   001866         187000     ADD     1 TO REC-CT.                                         NC2254.2 123
   001867         187100     IF      WRK-XN-00001-2 = "H"                                 NC2254.2 44
   001868      1  187200             PERFORM PASS                                         NC2254.2 226
   001869      1  187300             GO TO EVA-WRITE-GF-34-2                              NC2254.2 1880
   001870         187400     ELSE                                                         NC2254.2
   001871      1  187500             GO TO EVA-FAIL-GF-34-2.                              NC2254.2 1875
   001872         187600 EVA-DELETE-GF-34-2.                                              NC2254.2
   001873         187700     PERFORM DE-LETE.                                             NC2254.2 228
   001874         187800     GO TO EVA-WRITE-GF-34-2.                                     NC2254.2 1880
   001875         187900 EVA-FAIL-GF-34-2.                                                NC2254.2
   001876         188000     MOVE   "EVALUATE FAILURE" TO RE-MARK                         NC2254.2 81
   001877         188100     MOVE    WRK-XN-00001-2 TO COMPUTED-X                         NC2254.2 44 86
   001878         188200     MOVE   "H"             TO CORRECT-X                          NC2254.2 100
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879         188300     PERFORM FAIL.                                                NC2254.2 227
   001880         188400 EVA-WRITE-GF-34-2.                                               NC2254.2
   001881         188500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001882         188600*                                                                 NC2254.2
   001883         188700 EVA-INIT-GF-35.                                                  NC2254.2
   001884         188800     MOVE   "VI-84 6.12.4 GR3" TO ANSI-REFERENCE.                 NC2254.2 132
   001885         188900     MOVE   "EVA-TEST-GF-35-1" TO PAR-NAME.                       NC2254.2 76
   001886         189000     MOVE    1   TO REC-CT.                                       NC2254.2 123
   001887         189100     MOVE    81  TO WRK-DU-08V00-1.                               NC2254.2 49
   001888         189200     GO TO   EVA-TEST-GF-35-1.                                    NC2254.2 1893
   001889         189300 EVA-DELETE-GF-35.                                                NC2254.2
   001890         189400     PERFORM DE-LETE.                                             NC2254.2 228
   001891         189500     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001892         189600     GO TO   CCVS-EXIT.                                           NC2254.2 1918
   001893         189700 EVA-TEST-GF-35-1.                                                NC2254.2
   001894         189800     EVALUATE     TRUE                                            NC2254.2
   001895         189900             WHEN WRK-DU-08V00 NUMERIC                            NC2254.2 48
   001896         190000             WHEN WRK-DU-08V00 > 10                               NC2254.2 48
   001897         190100             WHEN WRK-DU-08V00 < 100                              NC2254.2 48
   001898      1  190200                  MOVE "A" TO WRK-XN-00001-1                      NC2254.2 43
   001899         190300             WHEN OTHER                                           NC2254.2
   001900      1  190400                  MOVE "Z" TO WRK-XN-00001-1                      NC2254.2 43
   001901         190500     END-EVALUATE.                                                NC2254.2
   001902         190600     IF      WRK-XN-00001-1 = "A"                                 NC2254.2 43
   001903      1  190700             PERFORM PASS                                         NC2254.2 226
   001904      1  190800             GO TO EVA-WRITE-GF-35-1                              NC2254.2 1915
   001905         190900     ELSE                                                         NC2254.2
   001906      1  191000             GO TO EVA-FAIL-GF-35-1.                              NC2254.2 1910
   001907         191100 EVA-DELETE-GF-35-1.                                              NC2254.2
   001908         191200     PERFORM DE-LETE.                                             NC2254.2 228
   001909         191300     GO TO EVA-WRITE-GF-35-1.                                     NC2254.2 1915
   001910         191400 EVA-FAIL-GF-35-1.                                                NC2254.2
   001911         191500     MOVE   "EVALUATE FAILURE" TO RE-MARK                         NC2254.2 81
   001912         191600     MOVE    WRK-XN-00001-1 TO COMPUTED-X                         NC2254.2 43 86
   001913         191700     MOVE   "A"             TO CORRECT-X                          NC2254.2 100
   001914         191800     PERFORM FAIL.                                                NC2254.2 227
   001915         191900 EVA-WRITE-GF-35-1.                                               NC2254.2
   001916         192000     PERFORM PRINT-DETAIL.                                        NC2254.2 230
   001917         192100*                                                                 NC2254.2
   001918         192200 CCVS-EXIT SECTION.                                               NC2254.2
   001919         192300 CCVS-999999.                                                     NC2254.2
   001920         192400     GO TO CLOSE-FILES.                                           NC2254.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    37
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      132   ANSI-REFERENCE . . . . . . . .  306 313 322 M333 M375 M417 M460 M503 M545 M587 M630 M673 M719 M765 M811 M857
                                            M901 M945 M989 M1033 M1094 M1155 M1217 M1280 M1306 M1332 M1358 M1384 M1411 M1438
                                            M1465 M1492 M1520 M1548 M1632 M1716 M1800 M1884
      111   CCVS-C-1 . . . . . . . . . . .  248 291
      116   CCVS-C-2 . . . . . . . . . . .  249 292
      166   CCVS-E-1 . . . . . . . . . . .  254
      171   CCVS-E-2 . . . . . . . . . . .  264 271 278 283
      174   CCVS-E-2-2 . . . . . . . . . .  M263
      179   CCVS-E-3 . . . . . . . . . . .  284
      188   CCVS-E-4 . . . . . . . . . . .  263
      189   CCVS-E-4-1 . . . . . . . . . .  M261
      191   CCVS-E-4-2 . . . . . . . . . .  M262
      133   CCVS-H-1 . . . . . . . . . . .  243
      138   CCVS-H-2A. . . . . . . . . . .  244
      147   CCVS-H-2B. . . . . . . . . . .  245
      159   CCVS-H-3 . . . . . . . . . . .  246
      209   CCVS-PGM-ID. . . . . . . . . .  215 215
       93   CM-18V0
       87   COMPUTED-A . . . . . . . . . .  88 90 91 92 93 318 321
       88   COMPUTED-N
       86   COMPUTED-X . . . . . . . . . .  M238 303 M1609 M1625 M1692 M1709 M1776 M1793 M1860 M1877 M1912
       90   COMPUTED-0V18
       92   COMPUTED-14V4
       94   COMPUTED-18V0
       91   COMPUTED-4V14
      110   COR-ANSI-REFERENCE . . . . . .  M313 M315
      101   CORRECT-A. . . . . . . . . . .  102 103 104 105 106 319 321
      102   CORRECT-N
      100   CORRECT-X. . . . . . . . . . .  M239 305 M1610 M1626 M1693 M1710 M1777 M1794 M1861 M1878 M1913
      103   CORRECT-0V18
      105   CORRECT-14V4
      107   CORRECT-18V0
      104   CORRECT-4V14
      106   CR-18V0
      124   DELETE-COUNTER . . . . . . . .  M228 257 274 276
       79   DOTVALUE . . . . . . . . . . .  M233
      130   DUMMY-HOLD . . . . . . . . . .  M288 294
       41   DUMMY-RECORD . . . . . . . . .  M243 M244 M245 M246 M248 M249 M250 M252 M254 M264 M271 M278 M283 M284 288 M289
                                            290 M291 M292 M293 M294 298 M299 M308 M323
      177   ENDER-DESC . . . . . . . . . .  M266 M277 M282
      125   ERROR-COUNTER. . . . . . . . .  M227 256 267 270
      129   ERROR-HOLD . . . . . . . . . .  M256 M257 M257 M258 262
      175   ERROR-TOTAL. . . . . . . . . .  M268 M270 M275 M276 M280 M281
       72   FEATURE. . . . . . . . . . . .  M332
      203   HYPHEN-LINE. . . . . . . . . .  250 252 293
      169   ID-AGAIN . . . . . . . . . . .  M215
      202   INF-ANSI-REFERENCE . . . . . .  M306 M309 M322 M324
      197   INFO-TEXT. . . . . . . . . . .  M307
      126   INSPECT-COUNTER. . . . . . . .  M225 256 279 281
       51   IT-IS-81 . . . . . . . . . . .  1567 1650 1734 1818
       74   P-OR-F . . . . . . . . . . . .  M225 M226 M227 M228 235 M238
       76   PAR-NAME . . . . . . . . . . .  M240 M342 M359 M384 M401 M427 M444 M470 M499 M512 M529 M554 M571 M596 M613 M639
                                            M657 M684 M702 M730 M748 M776 M794 M822 M840 M866 M884 M910 M928 M954 M972 M998
                                            M1016 M1042 M1060 M1078 M1103 M1121 M1139 M1164 M1182 M1200 M1226 M1244 M1262
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    38
0 Defined   Cross-reference of data names   References

0                                           M1289 M1315 M1341 M1367 M1393 M1420 M1447 M1474 M1501 M1529 M1549 M1633 M1717
                                            M1801 M1885
       78   PARDOT-X . . . . . . . . . . .  M232
      127   PASS-COUNTER . . . . . . . . .  M226 258 261
       39   PRINT-FILE . . . . . . . . . .  35 214 220
       40   PRINT-REC. . . . . . . . . . .  M234 M312 M314
       81   RE-MARK. . . . . . . . . . . .  M229 M241 M352 M369 M394 M411 M437 M454 M480 M496 M522 M539 M564 M581 M606 M624
                                            M650 M667 M695 M713 M741 M759 M787 M805 M833 M851 M877 M895 M921 M939 M965 M983
                                            M1009 M1027 M1053 M1071 M1088 M1114 M1132 M1149 M1175 M1193 M1211 M1237 M1255
                                            M1274 M1300 M1326 M1352 M1378 M1405 M1432 M1459 M1486 M1514 M1542 M1608 M1624
                                            M1691 M1708 M1775 M1792 M1859 M1876 M1911
      123   REC-CT . . . . . . . . . . . .  231 233 240 M334 M358 M376 M400 M418 M443 M461 M486 M504 M528 M546 M570 M588
                                            M612 M631 M656 M674 M701 M720 M747 M766 M793 M812 M839 M858 M883 M902 M927 M946
                                            M971 M990 M1015 M1034 M1059 M1077 M1095 M1120 M1138 M1156 M1181 M1199 M1218 M1243
                                            M1261 M1281 M1307 M1333 M1359 M1385 M1412 M1439 M1466 M1493 M1521 M1550 M1634
                                            M1698 M1718 M1782 M1802 M1866 M1886
      122   REC-SKL-SUB
      131   RECORD-COUNT . . . . . . . . .  M286 287 M295
       65   TABLE-GROUP
       66   TABLE-1
       82   TEST-COMPUTED. . . . . . . . .  312
       97   TEST-CORRECT . . . . . . . . .  314
      150   TEST-ID. . . . . . . . . . . .  M215
       70   TEST-RESULTS . . . . . . . . .  M216 234
       54   TEST-3-DATA
       55   TEST-4-DATA
       68   TEST-5-DATA
       64   TEST-5-TABLE
      128   TOTAL-ERROR
       47   WRK-DU-02V00
       48   WRK-DU-08V00 . . . . . . . . .  M589 597 614 M632 640 658 M859 867 885 M903 911 929 M947 956 974 M991 1000 1018
                                            M1157 1165 1183 1201 M1219 1227 1245 1263 M1386 1395 M1413 1422 M1440 1449 M1467
                                            1476 M1551 1564 1566 1579 1583 1591 M1635 1647 1649 1666 1674 M1719 1731 1750
                                            M1803 1815 1834 1842 1895 1896 1897
       49   WRK-DU-08V00-1 . . . . . . . .  M1554 1570 M1637 1653 M1721 1737 M1805 1821 M1887
       50   WRK-DU-08V00-2 . . . . . . . .  M1555 1571 M1638 1654 1663 1663 1665 M1722 1733 1738 1747 1747 1749 1758 M1806
                                            1817 1822 1831 1831 1833
       52   WRK-DU-08V00-3 . . . . . . . .  M1556 1574 M1639 1657 1662 M1723 1741 1746 M1807 1825 1830
       53   WRK-DU-08V00-4 . . . . . . . .  M1557 1575 M1640 1658 1662 M1724 1742 1746 M1808 1826 1830
       43   WRK-XN-00001-1 . . . . . . . .  M335 343 360 M377 385 402 M419 428 445 M462 471 487 M505 513 530 M547 555 572
                                            M675 685 703 M721 732 750 M767 777 795 M813 M1035 1043 1061 1079 M1096 1104 1122
                                            1140 M1282 1291 M1308 1317 M1334 1343 M1360 1369 M1494 1502 M1522 1530 M1552
                                            M1576 M1584 M1592 M1595 1599 1609 M1636 M1659 M1667 M1675 M1678 1682 1692 M1720
                                            M1743 M1751 M1759 M1762 1766 1776 M1804 M1827 M1835 M1843 M1846 1850 1860 M1898
                                            M1900 1902 1912
       44   WRK-XN-00001-2 . . . . . . . .  M420 429 446 M463 472 488 M676 686 704 M722 732 750 M768 M814 M1553 M1577 1582
                                            M1585 M1593 M1596 1615 1625 M1660 M1668 M1676 M1679 1699 1709 M1744 M1752 M1760
                                            M1763 1783 1793 M1828 M1836 M1844 M1847 1867 1877
       45   WRK-XN-00001-3 . . . . . . . .  M677 686 704 M723 731 749 M769 M815 823 841
       46   WRK-XN-00001-4
       62   WS-10
       57   WS-2
       58   WS-3
       59   WS-5
       60   WS-6
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    39
0 Defined   Cross-reference of data names   References

0      61   WS-7
       63   WS-81. . . . . . . . . . . . .  1166 1228
      199   XXCOMPUTED . . . . . . . . . .  M321
      201   XXCORRECT. . . . . . . . . . .  M321
      194   XXINFO . . . . . . . . . . . .  308 323
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    40
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

      317   BAIL-OUT . . . . . . . . . . .  P237
      325   BAIL-OUT-EX. . . . . . . . . .  E237 G319
      320   BAIL-OUT-WRITE . . . . . . . .  G318
      300   BLANK-LINE-PRINT
     1918   CCVS-EXIT. . . . . . . . . . .  G1892
     1919   CCVS-999999
      212   CCVS1
      326   CCVS1-EXIT . . . . . . . . . .  G218
      219   CLOSE-FILES. . . . . . . . . .  G1920
      247   COLUMN-NAMES-ROUTINE . . . . .  E217
      228   DE-LETE. . . . . . . . . . . .  P338 P349 P366 P380 P391 P408 P423 P434 P451 P466 P477 P493 P508 P519 P536 P550
                                            P561 P578 P592 P603 P620 P635 P646 P664 P680 P691 P709 P726 P737 P755 P772 P783
                                            P801 P818 P829 P847 P862 P873 P891 P906 P917 P935 P950 P961 P979 P994 P1005 P1023
                                            P1038 P1049 P1067 P1085 P1099 P1110 P1128 P1146 P1160 P1171 P1189 P1207 P1222
                                            P1233 P1251 P1269 P1285 P1296 P1311 P1322 P1337 P1348 P1363 P1374 P1389 P1401
                                            P1416 P1428 P1443 P1455 P1470 P1482 P1497 P1510 P1525 P1538 P1560 P1605 P1621
                                            P1643 P1688 P1705 P1727 P1772 P1789 P1811 P1856 P1873 P1890 P1908
      251   END-ROUTINE. . . . . . . . . .  P220
      255   END-ROUTINE-1
      265   END-ROUTINE-12
      273   END-ROUTINE-13 . . . . . . . .  E220
      253   END-RTN-EXIT
      337   EVA-DELETE-GF-1
      348   EVA-DELETE-GF-1-1
      365   EVA-DELETE-GF-1-2
      725   EVA-DELETE-GF-10
      736   EVA-DELETE-GF-10-1
      754   EVA-DELETE-GF-10-2
      771   EVA-DELETE-GF-11
      782   EVA-DELETE-GF-11-1
      800   EVA-DELETE-GF-11-2
      817   EVA-DELETE-GF-12
      828   EVA-DELETE-GF-12-1
      846   EVA-DELETE-GF-12-2
      861   EVA-DELETE-GF-13
      872   EVA-DELETE-GF-13-1
      890   EVA-DELETE-GF-13-2
      905   EVA-DELETE-GF-14
      916   EVA-DELETE-GF-14-1
      934   EVA-DELETE-GF-14-2
      949   EVA-DELETE-GF-15
      960   EVA-DELETE-GF-15-1
      978   EVA-DELETE-GF-15-2
      993   EVA-DELETE-GF-16
     1004   EVA-DELETE-GF-16-1
     1022   EVA-DELETE-GF-16-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    41
0 Defined   Cross-reference of procedures   References

0    1037   EVA-DELETE-GF-17
     1048   EVA-DELETE-GF-17-1
     1066   EVA-DELETE-GF-17-2
     1084   EVA-DELETE-GF-17-3
     1098   EVA-DELETE-GF-18
     1109   EVA-DELETE-GF-18-1
     1127   EVA-DELETE-GF-18-2
     1145   EVA-DELETE-GF-18-3
     1159   EVA-DELETE-GF-19
     1170   EVA-DELETE-GF-19-1
     1188   EVA-DELETE-GF-19-2
     1206   EVA-DELETE-GF-19-3
      379   EVA-DELETE-GF-2
      390   EVA-DELETE-GF-2-1
      407   EVA-DELETE-GF-2-2
     1221   EVA-DELETE-GF-20
     1232   EVA-DELETE-GF-20-1
     1250   EVA-DELETE-GF-20-2
     1268   EVA-DELETE-GF-20-3
     1284   EVA-DELETE-GF-21
     1295   EVA-DELETE-GF-21-1
     1310   EVA-DELETE-GF-22
     1321   EVA-DELETE-GF-22-1
     1336   EVA-DELETE-GF-23
     1347   EVA-DELETE-GF-23-1
     1362   EVA-DELETE-GF-24
     1373   EVA-DELETE-GF-24-1
     1388   EVA-DELETE-GF-25
     1400   EVA-DELETE-GF-25-1
     1415   EVA-DELETE-GF-26
     1427   EVA-DELETE-GF-26-1
     1442   EVA-DELETE-GF-27
     1454   EVA-DELETE-GF-27-1
     1469   EVA-DELETE-GF-28
     1481   EVA-DELETE-GF-28-1
     1496   EVA-DELETE-GF-29
     1509   EVA-DELETE-GF-29-1
      422   EVA-DELETE-GF-3
      433   EVA-DELETE-GF-3-1
      450   EVA-DELETE-GF-3-2
     1524   EVA-DELETE-GF-30
     1537   EVA-DELETE-GF-30-1
     1559   EVA-DELETE-GF-31
     1604   EVA-DELETE-GF-31-1
     1620   EVA-DELETE-GF-31-2
     1642   EVA-DELETE-GF-32
     1687   EVA-DELETE-GF-32-1
     1704   EVA-DELETE-GF-32-2
     1726   EVA-DELETE-GF-33
     1771   EVA-DELETE-GF-33-1
     1788   EVA-DELETE-GF-33-2
     1810   EVA-DELETE-GF-34
     1855   EVA-DELETE-GF-34-1
     1872   EVA-DELETE-GF-34-2
     1889   EVA-DELETE-GF-35
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    42
0 Defined   Cross-reference of procedures   References

0    1907   EVA-DELETE-GF-35-1
      465   EVA-DELETE-GF-4
      476   EVA-DELETE-GF-4-1
      492   EVA-DELETE-GF-4-2
      507   EVA-DELETE-GF-5
      518   EVA-DELETE-GF-5-1
      535   EVA-DELETE-GF-5-2
      549   EVA-DELETE-GF-6
      560   EVA-DELETE-GF-6-1
      577   EVA-DELETE-GF-6-2
      591   EVA-DELETE-GF-7
      602   EVA-DELETE-GF-7-1
      619   EVA-DELETE-GF-7-2
      634   EVA-DELETE-GF-8
      645   EVA-DELETE-GF-8-1
      663   EVA-DELETE-GF-8-2
      679   EVA-DELETE-GF-9
      690   EVA-DELETE-GF-9-1
      708   EVA-DELETE-GF-9-2
      351   EVA-FAIL-GF-1-1. . . . . . . .  G347
      368   EVA-FAIL-GF-1-2. . . . . . . .  G362
      739   EVA-FAIL-GF-10-1 . . . . . . .  G733
      757   EVA-FAIL-GF-10-2 . . . . . . .  G753
      785   EVA-FAIL-GF-11-1 . . . . . . .  G781
      803   EVA-FAIL-GF-11-2 . . . . . . .  G797
      831   EVA-FAIL-GF-12-1 . . . . . . .  G825
      849   EVA-FAIL-GF-12-2 . . . . . . .  G845
      875   EVA-FAIL-GF-13-1 . . . . . . .  G871
      893   EVA-FAIL-GF-13-2 . . . . . . .  G887
      919   EVA-FAIL-GF-14-1 . . . . . . .  G913
      937   EVA-FAIL-GF-14-2 . . . . . . .  G933
      963   EVA-FAIL-GF-15-1 . . . . . . .  G959
      981   EVA-FAIL-GF-15-2 . . . . . . .  G975
     1007   EVA-FAIL-GF-16-1 . . . . . . .  G1001
     1025   EVA-FAIL-GF-16-2 . . . . . . .  G1021
     1051   EVA-FAIL-GF-17-1 . . . . . . .  G1047
     1069   EVA-FAIL-GF-17-2 . . . . . . .  G1063
     1087   EVA-FAIL-GF-17-3 . . . . . . .  G1083
     1112   EVA-FAIL-GF-18-1 . . . . . . .  G1106
     1130   EVA-FAIL-GF-18-2
     1148   EVA-FAIL-GF-18-3 . . . . . . .  G1144
     1173   EVA-FAIL-GF-19-1 . . . . . . .  G1169
     1191   EVA-FAIL-GF-19-2 . . . . . . .  G1187
     1209   EVA-FAIL-GF-19-3 . . . . . . .  G1205
      393   EVA-FAIL-GF-2-1. . . . . . . .  G387
      410   EVA-FAIL-GF-2-2. . . . . . . .  G406
     1235   EVA-FAIL-GF-20-1 . . . . . . .  G1229
     1253   EVA-FAIL-GF-20-2 . . . . . . .  G1247
     1271   EVA-FAIL-GF-20-3 . . . . . . .  G1265
     1298   EVA-FAIL-GF-21-1 . . . . . . .  G1294
     1324   EVA-FAIL-GF-22-1 . . . . . . .  G1318
     1350   EVA-FAIL-GF-23-1 . . . . . . .  G1344
     1376   EVA-FAIL-GF-24-1 . . . . . . .  G1372
     1403   EVA-FAIL-GF-25-1 . . . . . . .  G1398
     1430   EVA-FAIL-GF-26-1 . . . . . . .  G1423
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    43
0 Defined   Cross-reference of procedures   References

0    1457   EVA-FAIL-GF-27-1 . . . . . . .  G1450
     1484   EVA-FAIL-GF-28-1 . . . . . . .  G1480
     1512   EVA-FAIL-GF-29-1 . . . . . . .  G1506
      436   EVA-FAIL-GF-3-1. . . . . . . .  G432
      453   EVA-FAIL-GF-3-2. . . . . . . .  G447
     1540   EVA-FAIL-GF-30-1 . . . . . . .  G1532
     1607   EVA-FAIL-GF-31-1 . . . . . . .  G1603
     1623   EVA-FAIL-GF-31-2 . . . . . . .  G1619
     1690   EVA-FAIL-GF-32-1 . . . . . . .  G1686
     1707   EVA-FAIL-GF-32-2 . . . . . . .  G1703
     1774   EVA-FAIL-GF-33-1 . . . . . . .  G1770
     1791   EVA-FAIL-GF-33-2 . . . . . . .  G1787
     1858   EVA-FAIL-GF-34-1 . . . . . . .  G1854
     1875   EVA-FAIL-GF-34-2 . . . . . . .  G1871
     1910   EVA-FAIL-GF-35-1 . . . . . . .  G1906
      479   EVA-FAIL-GF-4-1. . . . . . . .  G473
      495   EVA-FAIL-GF-4-2. . . . . . . .  G491
      521   EVA-FAIL-GF-5-1. . . . . . . .  G517
      538   EVA-FAIL-GF-5-2. . . . . . . .  G532
      563   EVA-FAIL-GF-6-1. . . . . . . .  G557
      580   EVA-FAIL-GF-6-2. . . . . . . .  G576
      605   EVA-FAIL-GF-7-1. . . . . . . .  G601
      622   EVA-FAIL-GF-7-2. . . . . . . .  G616
      648   EVA-FAIL-GF-8-1. . . . . . . .  G642
      666   EVA-FAIL-GF-8-2. . . . . . . .  G662
      693   EVA-FAIL-GF-9-1. . . . . . . .  G689
      711   EVA-FAIL-GF-9-2. . . . . . . .  G705
      331   EVA-INIT-GF-1
      718   EVA-INIT-GF-10 . . . . . . . .  G682
      764   EVA-INIT-GF-11 . . . . . . . .  G728
      810   EVA-INIT-GF-12 . . . . . . . .  G774
      856   EVA-INIT-GF-13 . . . . . . . .  G820
      900   EVA-INIT-GF-14 . . . . . . . .  G864
      944   EVA-INIT-GF-15 . . . . . . . .  G908
      988   EVA-INIT-GF-16 . . . . . . . .  G952 G1391
     1032   EVA-INIT-GF-17 . . . . . . . .  G996
     1093   EVA-INIT-GF-18 . . . . . . . .  G1040
     1154   EVA-INIT-GF-19 . . . . . . . .  G1101
      374   EVA-INIT-GF-2. . . . . . . . .  G340
     1216   EVA-INIT-GF-20 . . . . . . . .  G1162
     1279   EVA-INIT-GF-21 . . . . . . . .  G1224
     1305   EVA-INIT-GF-22 . . . . . . . .  G1287
     1331   EVA-INIT-GF-23 . . . . . . . .  G1313
     1357   EVA-INIT-GF-24 . . . . . . . .  G1339
     1383   EVA-INIT-GF-25 . . . . . . . .  G1365
     1410   EVA-INIT-GF-26
     1437   EVA-INIT-GF-27 . . . . . . . .  G1418
     1464   EVA-INIT-GF-28 . . . . . . . .  G1445
     1491   EVA-INIT-GF-29 . . . . . . . .  G1472
      416   EVA-INIT-GF-3. . . . . . . . .  G382
     1519   EVA-INIT-GF-30 . . . . . . . .  G1499
     1547   EVA-INIT-GF-31 . . . . . . . .  G1527
     1631   EVA-INIT-GF-32 . . . . . . . .  G1562
     1715   EVA-INIT-GF-33 . . . . . . . .  G1645
     1799   EVA-INIT-GF-34 . . . . . . . .  G1729
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    44
0 Defined   Cross-reference of procedures   References

0    1883   EVA-INIT-GF-35 . . . . . . . .  G1813
      459   EVA-INIT-GF-4. . . . . . . . .  G425
      502   EVA-INIT-GF-5. . . . . . . . .  G468
      544   EVA-INIT-GF-6. . . . . . . . .  G510
      586   EVA-INIT-GF-7. . . . . . . . .  G552
      629   EVA-INIT-GF-8. . . . . . . . .  G594
      672   EVA-INIT-GF-9. . . . . . . . .  G637
      341   EVA-TEST-GF-1-1. . . . . . . .  G336
      357   EVA-TEST-GF-1-2
      729   EVA-TEST-GF-10-1 . . . . . . .  G724
      746   EVA-TEST-GF-10-2
      775   EVA-TEST-GF-11-1 . . . . . . .  G770
      792   EVA-TEST-GF-11-2
      821   EVA-TEST-GF-12-1 . . . . . . .  G816
      838   EVA-TEST-GF-12-2
      865   EVA-TEST-GF-13-1 . . . . . . .  G860
      882   EVA-TEST-GF-13-2
      909   EVA-TEST-GF-14-1 . . . . . . .  G904
      926   EVA-TEST-GF-14-2
      953   EVA-TEST-GF-15-1 . . . . . . .  G948
      970   EVA-TEST-GF-15-2
      997   EVA-TEST-GF-16-1 . . . . . . .  G992
     1014   EVA-TEST-GF-16-2
     1041   EVA-TEST-GF-17-1 . . . . . . .  G1036
     1058   EVA-TEST-GF-17-2
     1076   EVA-TEST-GF-17-3
     1102   EVA-TEST-GF-18-1 . . . . . . .  G1097
     1119   EVA-TEST-GF-18-2
     1137   EVA-TEST-GF-18-3
     1163   EVA-TEST-GF-19-1 . . . . . . .  G1158
     1180   EVA-TEST-GF-19-2
     1198   EVA-TEST-GF-19-3
      383   EVA-TEST-GF-2-1. . . . . . . .  G378
      399   EVA-TEST-GF-2-2
     1225   EVA-TEST-GF-20-1 . . . . . . .  G1220
     1242   EVA-TEST-GF-20-2
     1260   EVA-TEST-GF-20-3
     1288   EVA-TEST-GF-21-1 . . . . . . .  G1283
     1314   EVA-TEST-GF-22-1 . . . . . . .  G1309
     1340   EVA-TEST-GF-23-1 . . . . . . .  G1335
     1366   EVA-TEST-GF-24-1 . . . . . . .  G1361
     1392   EVA-TEST-GF-25-1 . . . . . . .  G1387
     1419   EVA-TEST-GF-26-1 . . . . . . .  G1414
     1446   EVA-TEST-GF-27-1 . . . . . . .  G1441
     1473   EVA-TEST-GF-28-1 . . . . . . .  G1468
     1500   EVA-TEST-GF-29-1 . . . . . . .  G1495
      426   EVA-TEST-GF-3-1. . . . . . . .  G421
      442   EVA-TEST-GF-3-2
     1528   EVA-TEST-GF-30-1 . . . . . . .  G1523
     1563   EVA-TEST-GF-31-0 . . . . . . .  G1558
     1598   EVA-TEST-GF-31-1
     1614   EVA-TEST-GF-31-2
     1646   EVA-TEST-GF-32-0 . . . . . . .  G1641
     1681   EVA-TEST-GF-32-1
     1697   EVA-TEST-GF-32-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    45
0 Defined   Cross-reference of procedures   References

0    1730   EVA-TEST-GF-33-0 . . . . . . .  G1725
     1765   EVA-TEST-GF-33-1
     1781   EVA-TEST-GF-33-2
     1814   EVA-TEST-GF-34-0 . . . . . . .  G1809
     1849   EVA-TEST-GF-34-1
     1865   EVA-TEST-GF-34-2
     1893   EVA-TEST-GF-35-1 . . . . . . .  G1888
      469   EVA-TEST-GF-4-1. . . . . . . .  G464
      485   EVA-TEST-GF-4-2
      511   EVA-TEST-GF-5-1. . . . . . . .  G506
      527   EVA-TEST-GF-5-2
      553   EVA-TEST-GF-6-1. . . . . . . .  G548
      569   EVA-TEST-GF-6-2
      595   EVA-TEST-GF-7-1. . . . . . . .  G590
      611   EVA-TEST-GF-7-2
      638   EVA-TEST-GF-8-1. . . . . . . .  G633
      655   EVA-TEST-GF-8-2
      683   EVA-TEST-GF-9-1. . . . . . . .  G678
      700   EVA-TEST-GF-9-2
      354   EVA-WRITE-GF-1-1 . . . . . . .  G346 G350
      371   EVA-WRITE-GF-1-2 . . . . . . .  G364 G367
      743   EVA-WRITE-GF-10-1. . . . . . .  G735 G738
      761   EVA-WRITE-GF-10-2. . . . . . .  G752 G756
      789   EVA-WRITE-GF-11-1. . . . . . .  G780 G784
      807   EVA-WRITE-GF-11-2. . . . . . .  G799 G802
      835   EVA-WRITE-GF-12-1. . . . . . .  G827 G830
      853   EVA-WRITE-GF-12-2. . . . . . .  G844 G848
      879   EVA-WRITE-GF-13-1. . . . . . .  G870 G874
      897   EVA-WRITE-GF-13-2. . . . . . .  G889 G892
      923   EVA-WRITE-GF-14-1. . . . . . .  G915 G918
      941   EVA-WRITE-GF-14-2. . . . . . .  G932 G936
      967   EVA-WRITE-GF-15-1. . . . . . .  G958 G962
      985   EVA-WRITE-GF-15-2. . . . . . .  G977 G980
     1011   EVA-WRITE-GF-16-1. . . . . . .  G1003 G1006
     1029   EVA-WRITE-GF-16-2. . . . . . .  G1020 G1024
     1055   EVA-WRITE-GF-17-1. . . . . . .  G1046 G1050
     1073   EVA-WRITE-GF-17-2. . . . . . .  G1065 G1068
     1090   EVA-WRITE-GF-17-3. . . . . . .  G1082 G1086
     1116   EVA-WRITE-GF-18-1. . . . . . .  G1108 G1111
     1134   EVA-WRITE-GF-18-2. . . . . . .  G1125 G1126 G1129
     1151   EVA-WRITE-GF-18-3. . . . . . .  G1143 G1147
     1177   EVA-WRITE-GF-19-1. . . . . . .  G1168 G1172
     1195   EVA-WRITE-GF-19-2. . . . . . .  G1186 G1190
     1213   EVA-WRITE-GF-19-3. . . . . . .  G1204 G1208
      396   EVA-WRITE-GF-2-1 . . . . . . .  G389 G392
      413   EVA-WRITE-GF-2-2 . . . . . . .  G405 G409
     1239   EVA-WRITE-GF-20-1. . . . . . .  G1231 G1234
     1257   EVA-WRITE-GF-20-2. . . . . . .  G1249 G1252
     1276   EVA-WRITE-GF-20-3. . . . . . .  G1267 G1270
     1302   EVA-WRITE-GF-21-1. . . . . . .  G1293 G1297
     1328   EVA-WRITE-GF-22-1. . . . . . .  G1320 G1323
     1354   EVA-WRITE-GF-23-1. . . . . . .  G1346 G1349
     1380   EVA-WRITE-GF-24-1. . . . . . .  G1371 G1375
     1407   EVA-WRITE-GF-25-1. . . . . . .  G1399 G1402
     1434   EVA-WRITE-GF-26-1. . . . . . .  G1426 G1429
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    46
0 Defined   Cross-reference of procedures   References

0    1461   EVA-WRITE-GF-27-1. . . . . . .  G1453 G1456
     1488   EVA-WRITE-GF-28-1. . . . . . .  G1478 G1483
     1516   EVA-WRITE-GF-29-1. . . . . . .  G1508 G1511
      439   EVA-WRITE-GF-3-1 . . . . . . .  G431 G435
      456   EVA-WRITE-GF-3-2 . . . . . . .  G449 G452
     1544   EVA-WRITE-GF-30-1. . . . . . .  G1536 G1539
     1612   EVA-WRITE-GF-31-1. . . . . . .  G1601 G1606
     1628   EVA-WRITE-GF-31-2. . . . . . .  G1617 G1622
     1695   EVA-WRITE-GF-32-1. . . . . . .  G1684 G1689
     1712   EVA-WRITE-GF-32-2. . . . . . .  G1701 G1706
     1779   EVA-WRITE-GF-33-1. . . . . . .  G1768 G1773
     1796   EVA-WRITE-GF-33-2. . . . . . .  G1785 G1790
     1863   EVA-WRITE-GF-34-1. . . . . . .  G1852 G1857
     1880   EVA-WRITE-GF-34-2. . . . . . .  G1869 G1874
     1915   EVA-WRITE-GF-35-1. . . . . . .  G1904 G1909
      482   EVA-WRITE-GF-4-1 . . . . . . .  G475 G478
      498   EVA-WRITE-GF-4-2 . . . . . . .  G490 G494
      524   EVA-WRITE-GF-5-1 . . . . . . .  G516 G520
      541   EVA-WRITE-GF-5-2 . . . . . . .  G534 G537
      566   EVA-WRITE-GF-6-1 . . . . . . .  G559 G562
      583   EVA-WRITE-GF-6-2 . . . . . . .  G575 G579
      608   EVA-WRITE-GF-7-1 . . . . . . .  G600 G604
      626   EVA-WRITE-GF-7-2 . . . . . . .  G618 G621
      652   EVA-WRITE-GF-8-1 . . . . . . .  G644 G647
      669   EVA-WRITE-GF-8-2 . . . . . . .  G661 G665
      697   EVA-WRITE-GF-9-1 . . . . . . .  G688 G692
      715   EVA-WRITE-GF-9-2 . . . . . . .  G707 G710
      227   FAIL . . . . . . . . . . . . .  P353 P370 P395 P412 P438 P455 P481 P497 P523 P540 P565 P582 P607 P625 P651 P668
                                            P696 P714 P742 P760 P788 P806 P834 P852 P878 P896 P922 P940 P966 P984 P1010 P1028
                                            P1054 P1072 P1089 P1115 P1133 P1150 P1176 P1194 P1212 P1238 P1256 P1275 P1301
                                            P1327 P1353 P1379 P1406 P1433 P1460 P1487 P1515 P1543 P1611 P1627 P1694 P1711
                                            P1778 P1795 P1862 P1879 P1914
      302   FAIL-ROUTINE . . . . . . . . .  P236
      316   FAIL-ROUTINE-EX. . . . . . . .  E236 G310
      311   FAIL-ROUTINE-WRITE . . . . . .  G304 G305
      242   HEAD-ROUTINE . . . . . . . . .  P217
      225   INSPT
      213   OPEN-FILES
      226   PASS . . . . . . . . . . . . .  P345 P363 P388 P404 P430 P448 P474 P489 P515 P533 P558 P574 P599 P617 P643 P660
                                            P687 P706 P734 P751 P779 P798 P826 P843 P869 P888 P914 P931 P957 P976 P1002 P1019
                                            P1045 P1064 P1081 P1107 P1124 P1142 P1167 P1185 P1203 P1230 P1248 P1266 P1292
                                            P1319 P1345 P1370 P1396 P1425 P1452 P1477 P1504 P1534 P1600 P1616 P1683 P1700
                                            P1767 P1784 P1851 P1868 P1903
      230   PRINT-DETAIL . . . . . . . . .  P339 P355 P372 P381 P397 P414 P424 P440 P457 P467 P483 P500 P509 P525 P542 P551
                                            P567 P584 P593 P609 P627 P636 P653 P670 P681 P698 P716 P727 P744 P762 P773 P790
                                            P808 P819 P836 P854 P863 P880 P898 P907 P924 P942 P951 P968 P986 P995 P1012 P1030
                                            P1039 P1056 P1074 P1091 P1100 P1117 P1135 P1152 P1161 P1178 P1196 P1214 P1223
                                            P1240 P1258 P1277 P1286 P1303 P1312 P1329 P1338 P1355 P1364 P1381 P1390 P1408
                                            P1417 P1435 P1444 P1462 P1471 P1489 P1498 P1517 P1526 P1545 P1561 P1613 P1629
                                            P1644 P1696 P1713 P1728 P1780 P1797 P1812 P1864 P1881 P1891 P1916
      329   SECT-NC225A-001-1
      223   TERMINATE-CALL
      221   TERMINATE-CCVS
      285   WRITE-LINE . . . . . . . . . .  P234 P235 P243 P244 P245 P246 P248 P249 P250 P252 P254 P264 P272 P278 P283 P284
                                            P308 P312 P314 P323
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    47
0 Defined   Cross-reference of procedures   References

0     297   WRT-LN . . . . . . . . . . . .  P291 P292 P293 P296 P301
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    48
0 Defined   Cross-reference of programs     References

        3   NC225A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC225A    Date 06/04/2022  Time 12:00:16   Page    49
0LineID  Message code  Message text

     39  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC225A:
 *    Source records = 1920
 *    Data Division statements = 87
 *    Procedure Division statements = 1115
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1122
0End of compilation 1,  program NC225A,  highest severity 0.
0Return code 0
