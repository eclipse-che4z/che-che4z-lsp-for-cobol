1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:58   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:58   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1114.2
   000002         000200 PROGRAM-ID.                                                      IX1114.2
   000003         000300     IX111A.                                                      IX1114.2
   000004         000500*                                                              *  IX1114.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1114.2
   000006         000700*                                                              *  IX1114.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1114.2
   000008         000900*                                                              *  IX1114.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1114.2
   000010         001100*                                                              *  IX1114.2
   000011         001300*                                                                 IX1114.2
   000012         001400*    1. THE ROUTINE CHECKS THE PERMANENT ERROR CONDITIONS WITH    IX1114.2
   000013         001500*       UNSUCCESSFUL COMPLETION FOR AN OPEN STATEMENT FOR A FILE  IX1114.2
   000014         001600*       WHICH IS NOT PRESENT (STATUS CODE 35 EXPECTED).           IX1114.2
   000015         001700*       THIS PROGRAM USES THE FILE IX-NOP WHICH DOES NOT EXIST.   IX1114.2
   000016         001800*                                                                 IX1114.2
   000017         001900*    2. THE ROUTINE CHECKS THE FILE STATUS CODES:                 IX1114.2
   000018         002000*           35  -  AFTER OPEN INPUT  (NOT EXISTING FILE)          IX1114.2
   000019         002100                                                                  IX1114.2
   000020         002200*    3. X-CARDS USED IN THIS PROGRAM (WITH THE OPT CODE):         IX1114.2
   000021         002300*                                                                 IX1114.2
   000022         002400*                 XXXXX025    (FOR THE NON EXISTING IX-NOP)       IX1114.2
   000023         002500*                 XXXXX055.                                       IX1114.2
   000024         002600*                 XXXXX082.                                       IX1114.2
   000025         002700*                 XXXXX083.                                       IX1114.2
   000026         002800*                                                                 IX1114.2
   000027         002900*                                                                 IX1114.2
   000028         003000 ENVIRONMENT DIVISION.                                            IX1114.2
   000029         003100 CONFIGURATION SECTION.                                           IX1114.2
   000030         003200 SOURCE-COMPUTER.                                                 IX1114.2
   000031         003300     XXXXX082.                                                    IX1114.2
   000032         003400 OBJECT-COMPUTER.                                                 IX1114.2
   000033         003500     XXXXX083.                                                    IX1114.2
   000034         003600 INPUT-OUTPUT SECTION.                                            IX1114.2
   000035         003700 FILE-CONTROL.                                                    IX1114.2
   000036         003800     SELECT PRINT-FILE ASSIGN TO                                  IX1114.2 51
   000037         003900     XXXXX055.                                                    IX1114.2
   000038         004000*                                                                 IX1114.2
   000039         004100     SELECT IX-NOP ASSIGN                                         IX1114.2 57
   000040         004200     XXXXX025                                                     IX1114.2
   000041         004300     ORGANIZATION IS INDEXED                                      IX1114.2
   000042         004400     ACCESS MODE IS SEQUENTIAL                                    IX1114.2
   000043         004500     RECORD KEY IS IX-NOP-KEY                                     IX1114.2 67
   000044         004600     FILE STATUS IS IX-NOP-STATUS.                                IX1114.2 75
   000045         004700                                                                  IX1114.2
   000046         004800                                                                  IX1114.2
   000047         004900 DATA DIVISION.                                                   IX1114.2
   000048         005000                                                                  IX1114.2
   000049         005100 FILE SECTION.                                                    IX1114.2
   000050         005200                                                                  IX1114.2
   000051         005300 FD  PRINT-FILE.                                                  IX1114.2

 ==000051==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000052         005400                                                                  IX1114.2
   000053         005500 01  PRINT-REC               PIC X(120).                          IX1114.2
   000054         005600                                                                  IX1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005700 01  DUMMY-RECORD            PIC X(120).                          IX1114.2
   000056         005800                                                                  IX1114.2
   000057         005900 FD  IX-NOP                                                       IX1114.2

 ==000057==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000057==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000058         006000        LABEL RECORD STANDARD                                     IX1114.2
   000059         006100        DATA RECORDS IX-NOPR1-F-G-240                             IX1114.2 *
   000060         006200        RECORD 240                                                IX1114.2
   000061         006300        BLOCK CONTAINS 2 RECORDS.                                 IX1114.2
   000062         006400                                                                  IX1114.2
   000063         006500 01  IX-NOPR1-F-G-240.                                            IX1114.2
   000064         006600     05  IX-NOP-REC-120      PIC X(120).                          IX1114.2
   000065         006700     05  IX-NOP-REC-120-240.                                      IX1114.2
   000066         006800         10  FILLER          PIC X(8).                            IX1114.2
   000067         006900         10  IX-NOP-KEY      PIC X(29).                           IX1114.2
   000068         007000         10  FILLER          PIC X(9).                            IX1114.2
   000069         007100         10  IX-NOP-ALTER-KEY  PIC X(29).                         IX1114.2
   000070         007200         10  FILLER            PIC X(45).                         IX1114.2
   000071         007300                                                                  IX1114.2
   000072         007400                                                                  IX1114.2
   000073         007500 WORKING-STORAGE SECTION.                                         IX1114.2
   000074         007600                                                                  IX1114.2
   000075         007700 01  IX-NOP-STATUS           PIC XX.                              IX1114.2
   000076         007800                                                                  IX1114.2
   000077         007900 01  TEST-RESULTS.                                                IX1114.2
   000078         008000     02 FILLER                   PIC X      VALUE SPACE.          IX1114.2 IMP
   000079         008100     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1114.2 IMP
   000080         008200     02 FILLER                   PIC X      VALUE SPACE.          IX1114.2 IMP
   000081         008300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1114.2 IMP
   000082         008400     02 FILLER                   PIC X      VALUE SPACE.          IX1114.2 IMP
   000083         008500     02  PAR-NAME.                                                IX1114.2
   000084         008600       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1114.2 IMP
   000085         008700       03  PARDOT-X              PIC X      VALUE SPACE.          IX1114.2 IMP
   000086         008800       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1114.2 IMP
   000087         008900     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1114.2 IMP
   000088         009000     02 RE-MARK                  PIC X(61).                       IX1114.2
   000089         009100 01  TEST-COMPUTED.                                               IX1114.2
   000090         009200     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1114.2 IMP
   000091         009300     02 FILLER                   PIC X(17)  VALUE                 IX1114.2
   000092         009400            "       COMPUTED=".                                   IX1114.2
   000093         009500     02 COMPUTED-X.                                               IX1114.2
   000094         009600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1114.2 IMP
   000095         009700     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1114.2 94
   000096         009800                                 PIC -9(9).9(9).                  IX1114.2
   000097         009900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1114.2 94
   000098         010000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1114.2 94
   000099         010100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1114.2 94
   000100         010200     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1114.2 94
   000101         010300         04 COMPUTED-18V0                    PIC -9(18).          IX1114.2
   000102         010400         04 FILLER                           PIC X.               IX1114.2
   000103         010500     03 FILLER PIC X(50) VALUE SPACE.                             IX1114.2 IMP
   000104         010600 01  TEST-CORRECT.                                                IX1114.2
   000105         010700     02 FILLER PIC X(30) VALUE SPACE.                             IX1114.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000106         010800     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1114.2
   000107         010900     02 CORRECT-X.                                                IX1114.2
   000108         011000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1114.2 IMP
   000109         011100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1114.2 108
   000110         011200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1114.2 108
   000111         011300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1114.2 108
   000112         011400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1114.2 108
   000113         011500     03      CR-18V0 REDEFINES CORRECT-A.                         IX1114.2 108
   000114         011600         04 CORRECT-18V0                     PIC -9(18).          IX1114.2
   000115         011700         04 FILLER                           PIC X.               IX1114.2
   000116         011800     03 FILLER PIC X(2) VALUE SPACE.                              IX1114.2 IMP
   000117         011900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1114.2 IMP
   000118         012000 01  CCVS-C-1.                                                    IX1114.2
   000119         012100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1114.2
   000120         012200-    "SS  PARAGRAPH-NAME                                          IX1114.2
   000121         012300-    "       REMARKS".                                            IX1114.2
   000122         012400     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1114.2 IMP
   000123         012500 01  CCVS-C-2.                                                    IX1114.2
   000124         012600     02 FILLER                     PIC X        VALUE SPACE.      IX1114.2 IMP
   000125         012700     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1114.2
   000126         012800     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1114.2 IMP
   000127         012900     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1114.2
   000128         013000     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1114.2 IMP
   000129         013100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1114.2 IMP
   000130         013200 01  REC-CT                        PIC 99       VALUE ZERO.       IX1114.2 IMP
   000131         013300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1114.2 IMP
   000132         013400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1114.2 IMP
   000133         013500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1114.2 IMP
   000134         013600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1114.2 IMP
   000135         013700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1114.2 IMP
   000136         013800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1114.2 IMP
   000137         013900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1114.2 IMP
   000138         014000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1114.2 IMP
   000139         014100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1114.2 IMP
   000140         014200 01  CCVS-H-1.                                                    IX1114.2
   000141         014300     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1114.2 IMP
   000142         014400     02  FILLER                    PIC X(42)    VALUE             IX1114.2
   000143         014500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1114.2
   000144         014600     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1114.2 IMP
   000145         014700 01  CCVS-H-2A.                                                   IX1114.2
   000146         014800   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1114.2 IMP
   000147         014900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1114.2
   000148         015000   02  FILLER                        PIC XXXX   VALUE             IX1114.2
   000149         015100     "4.2 ".                                                      IX1114.2
   000150         015200   02  FILLER                        PIC X(28)  VALUE             IX1114.2
   000151         015300            " COPY - NOT FOR DISTRIBUTION".                       IX1114.2
   000152         015400   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1114.2 IMP
   000153         015500                                                                  IX1114.2
   000154         015600 01  CCVS-H-2B.                                                   IX1114.2
   000155         015700   02  FILLER                        PIC X(15)  VALUE             IX1114.2
   000156         015800            "TEST RESULT OF ".                                    IX1114.2
   000157         015900   02  TEST-ID                       PIC X(9).                    IX1114.2
   000158         016000   02  FILLER                        PIC X(4)   VALUE             IX1114.2
   000159         016100            " IN ".                                               IX1114.2
   000160         016200   02  FILLER                        PIC X(12)  VALUE             IX1114.2
   000161         016300     " HIGH       ".                                              IX1114.2
   000162         016400   02  FILLER                        PIC X(22)  VALUE             IX1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000163         016500            " LEVEL VALIDATION FOR ".                             IX1114.2
   000164         016600   02  FILLER                        PIC X(58)  VALUE             IX1114.2
   000165         016700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1114.2
   000166         016800 01  CCVS-H-3.                                                    IX1114.2
   000167         016900     02  FILLER                      PIC X(34)  VALUE             IX1114.2
   000168         017000            " FOR OFFICIAL USE ONLY    ".                         IX1114.2
   000169         017100     02  FILLER                      PIC X(58)  VALUE             IX1114.2
   000170         017200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1114.2
   000171         017300     02  FILLER                      PIC X(28)  VALUE             IX1114.2
   000172         017400            "  COPYRIGHT   1985 ".                                IX1114.2
   000173         017500 01  CCVS-E-1.                                                    IX1114.2
   000174         017600     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1114.2 IMP
   000175         017700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1114.2
   000176         017800     02 ID-AGAIN                     PIC X(9).                    IX1114.2
   000177         017900     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1114.2 IMP
   000178         018000 01  CCVS-E-2.                                                    IX1114.2
   000179         018100     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1114.2 IMP
   000180         018200     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1114.2 IMP
   000181         018300     02 CCVS-E-2-2.                                               IX1114.2
   000182         018400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1114.2 IMP
   000183         018500         03 FILLER                   PIC X      VALUE SPACE.      IX1114.2 IMP
   000184         018600         03 ENDER-DESC               PIC X(44)  VALUE             IX1114.2
   000185         018700            "ERRORS ENCOUNTERED".                                 IX1114.2
   000186         018800 01  CCVS-E-3.                                                    IX1114.2
   000187         018900     02  FILLER                      PIC X(22)  VALUE             IX1114.2
   000188         019000            " FOR OFFICIAL USE ONLY".                             IX1114.2
   000189         019100     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1114.2 IMP
   000190         019200     02  FILLER                      PIC X(58)  VALUE             IX1114.2
   000191         019300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1114.2
   000192         019400     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1114.2 IMP
   000193         019500     02 FILLER                       PIC X(15)  VALUE             IX1114.2
   000194         019600             " COPYRIGHT 1985".                                   IX1114.2
   000195         019700 01  CCVS-E-4.                                                    IX1114.2
   000196         019800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1114.2 IMP
   000197         019900     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1114.2
   000198         020000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1114.2 IMP
   000199         020100     02 FILLER                       PIC X(40)  VALUE             IX1114.2
   000200         020200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1114.2
   000201         020300 01  XXINFO.                                                      IX1114.2
   000202         020400     02 FILLER                       PIC X(19)  VALUE             IX1114.2
   000203         020500            "*** INFORMATION ***".                                IX1114.2
   000204         020600     02 INFO-TEXT.                                                IX1114.2
   000205         020700       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1114.2 IMP
   000206         020800       04 XXCOMPUTED                 PIC X(20).                   IX1114.2
   000207         020900       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1114.2 IMP
   000208         021000       04 XXCORRECT                  PIC X(20).                   IX1114.2
   000209         021100     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1114.2
   000210         021200 01  HYPHEN-LINE.                                                 IX1114.2
   000211         021300     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1114.2 IMP
   000212         021400     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1114.2
   000213         021500-    "*****************************************".                 IX1114.2
   000214         021600     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1114.2
   000215         021700-    "******************************".                            IX1114.2
   000216         021800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1114.2
   000217         021900     "IX111A".                                                    IX1114.2
   000218         022000 PROCEDURE DIVISION.                                              IX1114.2
   000219         022100 DECLARATIVES.                                                    IX1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000220         022200                                                                  IX1114.2
   000221         022300 SECT-IX111-0001 SECTION.                                         IX1114.2
   000222         022400     USE AFTER EXCEPTION PROCEDURE ON IX-NOP.                     IX1114.2 57
   000223         022500 INPUT-PROCESS.                                                   IX1114.2
   000224         022600     IF IX-NOP-STATUS = "35"                                      IX1114.2 75
   000225      1  022700             PERFORM PASS-DECL                                    IX1114.2 237
   000226      1  022800             GO TO ABNORMAL-TERM-DECL                             IX1114.2 306
   000227         022900     ELSE                                                         IX1114.2
   000228      1  023000             MOVE "35" TO CORRECT-A                               IX1114.2 108
   000229      1  023100             MOVE IX-NOP-STATUS TO COMPUTED-A                     IX1114.2 75 94
   000230      1  023200             MOVE "STATUS FOR OPEN INPUT OF FILE THAT IS NOT      IX1114.2
   000231      1  023300-                 "PRESENT INCORRECT" TO RE-MARK                  IX1114.2 88
   000232      1  023400             MOVE "IX-2, FILE STATUS" TO ANSI-REFERENCE           IX1114.2 139
   000233      1  023500             PERFORM FAIL-DECL                                    IX1114.2 242
   000234      1  023600             GO TO ABNORMAL-TERM-DECL                             IX1114.2 306
   000235         023700     END-IF.                                                      IX1114.2
   000236         023800                                                                  IX1114.2
   000237         023900 PASS-DECL.                                                       IX1114.2
   000238         024000     MOVE   "PASS " TO P-OR-F.                                    IX1114.2 81
   000239         024100     ADD     1 TO PASS-COUNTER.                                   IX1114.2 134
   000240         024200     PERFORM PRINT-DETAIL-DECL.                                   IX1114.2 247
   000241         024300*                                                                 IX1114.2
   000242         024400 FAIL-DECL.                                                       IX1114.2
   000243         024500     MOVE   "FAIL*" TO P-OR-F.                                    IX1114.2 81
   000244         024600     ADD     1 TO ERROR-COUNTER.                                  IX1114.2 132
   000245         024700     PERFORM PRINT-DETAIL-DECL.                                   IX1114.2 247
   000246         024800*                                                                 IX1114.2
   000247         024900 PRINT-DETAIL-DECL.                                               IX1114.2
   000248         025000     IF REC-CT NOT EQUAL TO ZERO                                  IX1114.2 130 IMP
   000249      1  025100         MOVE   "." TO PARDOT-X                                   IX1114.2 85
   000250      1  025200         MOVE   REC-CT TO DOTVALUE.                               IX1114.2 130 86
   000251         025300     MOVE    TEST-RESULTS TO PRINT-REC.                           IX1114.2 77 53
   000252         025400     PERFORM WRITE-LINE-DECL.                                     IX1114.2 264
   000253         025500     IF P-OR-F EQUAL TO "FAIL*"                                   IX1114.2 81
   000254      1  025600         PERFORM WRITE-LINE-DECL                                  IX1114.2 264
   000255      1  025700         PERFORM FAIL-ROUTINE-DECL THRU FAIL-ROUTINE-EX-DECL      IX1114.2 273 291
   000256         025800     ELSE                                                         IX1114.2
   000257      1  025900         PERFORM BAIL-OUT-DECL THRU BAIL-OUT-EX-DECL.             IX1114.2 293 303
   000258         026000     MOVE    SPACE TO P-OR-F.                                     IX1114.2 IMP 81
   000259         026100     MOVE    SPACE TO COMPUTED-X.                                 IX1114.2 IMP 93
   000260         026200     MOVE    SPACE TO CORRECT-X.                                  IX1114.2 IMP 107
   000261         026300     IF REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.             IX1114.2 130 IMP IMP 83
   000262         026400     MOVE    SPACE TO RE-MARK.                                    IX1114.2 IMP 88
   000263         026500*                                                                 IX1114.2
   000264         026600 WRITE-LINE-DECL.                                                 IX1114.2
   000265         026700     ADD     1 TO RECORD-COUNT.                                   IX1114.2 138
   000266         026800     PERFORM WRT-LN-DECL.                                         IX1114.2 268
   000267         026900*                                                                 IX1114.2
   000268         027000 WRT-LN-DECL.                                                     IX1114.2
   000269         027100     WRITE   DUMMY-RECORD AFTER ADVANCING 1 LINES.                IX1114.2 55
   000270         027200     MOVE    SPACE TO DUMMY-RECORD.                               IX1114.2 IMP 55
   000271         027300 BLANK-LINE-PRINT-DECL.                                           IX1114.2
   000272         027400     PERFORM WRT-LN-DECL.                                         IX1114.2 268
   000273         027500 FAIL-ROUTINE-DECL.                                               IX1114.2
   000274         027600     IF COMPUTED-X NOT EQUAL TO SPACE                             IX1114.2 93 IMP
   000275      1  027700             GO TO FAIL-ROUTINE-WRITE-DECL.                       IX1114.2 284
   000276         027800     IF CORRECT-X NOT EQUAL TO SPACE                              IX1114.2 107 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000277      1  027900             GO TO FAIL-ROUTINE-WRITE-DECL.                       IX1114.2 284
   000278         028000     MOVE    ANSI-REFERENCE TO INF-ANSI-REFERENCE.                IX1114.2 139 209
   000279         028100     MOVE   "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.  IX1114.2 204
   000280         028200     MOVE    XXINFO TO DUMMY-RECORD.                              IX1114.2 201 55
   000281         028300     PERFORM WRITE-LINE-DECL 2 TIMES.                             IX1114.2 264
   000282         028400     MOVE    SPACES TO INF-ANSI-REFERENCE.                        IX1114.2 IMP 209
   000283         028500     GO TO   FAIL-ROUTINE-EX-DECL.                                IX1114.2 291
   000284         028600 FAIL-ROUTINE-WRITE-DECL.                                         IX1114.2
   000285         028700     MOVE    TEST-COMPUTED  TO PRINT-REC                          IX1114.2 89 53
   000286         028800     PERFORM WRITE-LINE-DECL                                      IX1114.2 264
   000287         028900     MOVE    ANSI-REFERENCE TO COR-ANSI-REFERENCE.                IX1114.2 139 117
   000288         029000     MOVE    TEST-CORRECT   TO PRINT-REC                          IX1114.2 104 53
   000289         029100     PERFORM WRITE-LINE-DECL 2 TIMES.                             IX1114.2 264
   000290         029200     MOVE    SPACES         TO COR-ANSI-REFERENCE.                IX1114.2 IMP 117
   000291         029300 FAIL-ROUTINE-EX-DECL.                                            IX1114.2
   000292         029400     EXIT.                                                        IX1114.2
   000293         029500 BAIL-OUT-DECL.                                                   IX1114.2
   000294         029600     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE-DECL.  IX1114.2 94 IMP 296
   000295         029700     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX-DECL.          IX1114.2 108 IMP 303
   000296         029800 BAIL-OUT-WRITE-DECL.                                             IX1114.2
   000297         029900     MOVE    CORRECT-A      TO XXCORRECT.                         IX1114.2 108 208
   000298         030000     MOVE    COMPUTED-A     TO XXCOMPUTED.                        IX1114.2 94 206
   000299         030100     MOVE    ANSI-REFERENCE TO INF-ANSI-REFERENCE.                IX1114.2 139 209
   000300         030200     MOVE    XXINFO TO DUMMY-RECORD.                              IX1114.2 201 55
   000301         030300     PERFORM WRITE-LINE-DECL 2 TIMES.                             IX1114.2 264
   000302         030400     MOVE    SPACES TO INF-ANSI-REFERENCE.                        IX1114.2 IMP 209
   000303         030500 BAIL-OUT-EX-DECL.                                                IX1114.2
   000304         030600     EXIT.                                                        IX1114.2
   000305         030700*                                                                 IX1114.2
   000306         030800 ABNORMAL-TERM-DECL.                                              IX1114.2
   000307         030900     MOVE    SPACE TO DUMMY-RECORD.                               IX1114.2 IMP 55
   000308         031000     PERFORM WRITE-LINE-DECL.                                     IX1114.2 264
   000309         031100     MOVE    "ABNORMAL TERMINATION AT THIS POINT IS ACCEPTABLE"   IX1114.2
   000310         031200                     TO DUMMY-RECORD.                             IX1114.2 55
   000311         031300     PERFORM WRITE-LINE-DECL 3 TIMES.                             IX1114.2 264
   000312         031400*                                                                 IX1114.2
   000313         031500 EXIT-DECL.                                                       IX1114.2
   000314         031600     EXIT.                                                        IX1114.2
   000315         031700 END DECLARATIVES.                                                IX1114.2
   000316         031800                                                                  IX1114.2
   000317         031900                                                                  IX1114.2
   000318         032000 CCVS1 SECTION.                                                   IX1114.2
   000319         032100 OPEN-FILES.                                                      IX1114.2
   000320         032200     OPEN    OUTPUT PRINT-FILE.                                   IX1114.2 51
   000321         032300     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1114.2 216 157 216 176
   000322         032400     MOVE    SPACE TO TEST-RESULTS.                               IX1114.2 IMP 77
   000323         032500     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1114.2 331 336
   000324         032600     MOVE    ZERO TO REC-SKL-SUB.                                 IX1114.2 IMP 129
   000325         032700 CCVS-INIT-EXIT.                                                  IX1114.2
   000326         032800     GO TO CCVS1-EXIT.                                            IX1114.2 418
   000327         032900 CLOSE-FILES.                                                     IX1114.2
   000328         033000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1114.2 340 361 51
   000329         033100 TERMINATE-CCVS.                                                  IX1114.2
   000330         033200     STOP     RUN.                                                IX1114.2
   000331         033300 HEAD-ROUTINE.                                                    IX1114.2
   000332         033400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1114.2 140 55 373
   000333         033500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1114.2 145 55 373
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000334         033600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1114.2 154 55 373
   000335         033700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1114.2 166 55 373
   000336         033800 COLUMN-NAMES-ROUTINE.                                            IX1114.2
   000337         033900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1114.2 118 55 373
   000338         034000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1114.2 123 55 373
   000339         034100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1114.2 210 55 373
   000340         034200 END-ROUTINE.                                                     IX1114.2
   000341         034300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1114.2 210 55 373
   000342         034400 END-RTN-EXIT.                                                    IX1114.2
   000343         034500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1114.2 173 55 373
   000344         034600 END-ROUTINE-1.                                                   IX1114.2
   000345         034700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1114.2 132 136 133
   000346         034800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1114.2 136 131 136
   000347         034900      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1114.2 134 136
   000348         035000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1114.2
   000349         035100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1114.2 134 196
   000350         035200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1114.2 136 198
   000351         035300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1114.2 195 181
   000352         035400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1114.2 178 55 373
   000353         035500  END-ROUTINE-12.                                                 IX1114.2
   000354         035600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1114.2 184
   000355         035700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1114.2 132 IMP
   000356      1  035800         MOVE "NO " TO ERROR-TOTAL                                IX1114.2 182
   000357         035900         ELSE                                                     IX1114.2
   000358      1  036000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1114.2 132 182
   000359         036100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1114.2 178 55
   000360         036200     PERFORM WRITE-LINE.                                          IX1114.2 373
   000361         036300 END-ROUTINE-13.                                                  IX1114.2
   000362         036400     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1114.2 131 IMP
   000363      1  036500         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1114.2 182
   000364      1  036600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1114.2 131 182
   000365         036700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1114.2 184
   000366         036800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1114.2 178 55 373
   000367         036900      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1114.2 133 IMP
   000368      1  037000          MOVE "NO " TO ERROR-TOTAL                               IX1114.2 182
   000369      1  037100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1114.2 133 182
   000370         037200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1114.2 184
   000371         037300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1114.2 178 55 373
   000372         037400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1114.2 186 55 373
   000373         037500 WRITE-LINE.                                                      IX1114.2
   000374         037600     ADD 1 TO RECORD-COUNT.                                       IX1114.2 138
   000375         037700     IF RECORD-COUNT GREATER 42                                   IX1114.2 138
   000376      1  037800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1114.2 55 137
   000377      1  037900         MOVE SPACE TO DUMMY-RECORD                               IX1114.2 IMP 55
   000378      1  038000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1114.2 55
   000379      1  038100         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1114.2 140 55 389
   000380      1  038200         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1114.2 145 55 389
   000381      1  038300         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1114.2 154 55 389
   000382      1  038400         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1114.2 166 55 389
   000383      1  038500         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1114.2 118 55 389
   000384      1  038600         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1114.2 123 55 389
   000385      1  038700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1114.2 210 55 389
   000386      1  038800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1114.2 137 55
   000387      1  038900         MOVE ZERO TO RECORD-COUNT.                               IX1114.2 IMP 138
   000388         039000     PERFORM WRT-LN.                                              IX1114.2 389
   000389         039100 WRT-LN.                                                          IX1114.2
   000390         039200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1114.2 55
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000391         039300     MOVE SPACE TO DUMMY-RECORD.                                  IX1114.2 IMP 55
   000392         039400 BLANK-LINE-PRINT.                                                IX1114.2
   000393         039500     PERFORM WRT-LN.                                              IX1114.2 389
   000394         039600 FAIL-ROUTINE.                                                    IX1114.2
   000395         039700     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1114.2 93 IMP
   000396      1  039800            GO TO   FAIL-ROUTINE-WRITE.                           IX1114.2 403
   000397         039900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1114.2 107 IMP 403
   000398         040000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1114.2 139 209
   000399         040100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1114.2 204
   000400         040200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1114.2 201 55 373
   000401         040300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1114.2 IMP 209
   000402         040400     GO TO  FAIL-ROUTINE-EX.                                      IX1114.2 408
   000403         040500 FAIL-ROUTINE-WRITE.                                              IX1114.2
   000404         040600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1114.2 89 53 373
   000405         040700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1114.2 139 117
   000406         040800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1114.2 104 53 373
   000407         040900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1114.2 IMP 117
   000408         041000 FAIL-ROUTINE-EX. EXIT.                                           IX1114.2
   000409         041100 BAIL-OUT.                                                        IX1114.2
   000410         041200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1114.2 94 IMP 412
   000411         041300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1114.2 108 IMP 417
   000412         041400 BAIL-OUT-WRITE.                                                  IX1114.2
   000413         041500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1114.2 108 208 94 206
   000414         041600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1114.2 139 209
   000415         041700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1114.2 201 55 373
   000416         041800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1114.2 IMP 209
   000417         041900 BAIL-OUT-EX. EXIT.                                               IX1114.2
   000418         042000 CCVS1-EXIT.                                                      IX1114.2
   000419         042100     EXIT.                                                        IX1114.2
   000420         042200                                                                  IX1114.2
   000421         042300 SECT-IX111A-0003 SECTION.                                        IX1114.2
   000422         042400 SEQ-INIT-010.                                                    IX1114.2
   000423         042500                                                                  IX1114.2
   000424         042700*   TEST  1                                                      *IX1114.2
   000425         042800*         OPEN INPUT  (FILE DOES NOT EXIST)   35  EXPECTED       *IX1114.2
   000426         042900*         IX-4, 1.3.4 (4) B                                      *IX1114.2
   000427         043100 OPN-INIT-GF-01-0.                                                IX1114.2

 ==000427==> IGYPS2015-I The paragraph or section prior to paragraph or section "OPN-INIT-GF-01-0"
                         did not contain any statements.

   000428         043200     MOVE SPACES TO IX-NOP-STATUS.                                IX1114.2 IMP 75
   000429         043300     MOVE "OPEN INPUT   35 EXP." TO FEATURE.                      IX1114.2 79
   000430         043400     MOVE "OPN-TEST-GF-01-0" TO PAR-NAME.                         IX1114.2 83
   000431         043500 OPN-TEST-GF-01-0.                                                IX1114.2
   000432         043600     OPEN                                                         IX1114.2
   000433         043700        INPUT IX-NOP.                                             IX1114.2 57
   000434         043800                                                                  IX1114.2
   000435         043900 TERMINATE-ROUTINE.                                               IX1114.2
   000436         044000     EXIT.                                                        IX1114.2
   000437         044100                                                                  IX1114.2
   000438         044200 CCVS-EXIT SECTION.                                               IX1114.2
   000439         044300 CCVS-999999.                                                     IX1114.2
   000440         044400     GO TO CLOSE-FILES.                                           IX1114.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page    11
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      139   ANSI-REFERENCE . . . . . . . .  M232 278 287 299 398 405 414
      118   CCVS-C-1 . . . . . . . . . . .  337 383
      123   CCVS-C-2 . . . . . . . . . . .  338 384
      173   CCVS-E-1 . . . . . . . . . . .  343
      178   CCVS-E-2 . . . . . . . . . . .  352 359 366 371
      181   CCVS-E-2-2 . . . . . . . . . .  M351
      186   CCVS-E-3 . . . . . . . . . . .  372
      195   CCVS-E-4 . . . . . . . . . . .  351
      196   CCVS-E-4-1 . . . . . . . . . .  M349
      198   CCVS-E-4-2 . . . . . . . . . .  M350
      140   CCVS-H-1 . . . . . . . . . . .  332 379
      145   CCVS-H-2A. . . . . . . . . . .  333 380
      154   CCVS-H-2B. . . . . . . . . . .  334 381
      166   CCVS-H-3 . . . . . . . . . . .  335 382
      216   CCVS-PGM-ID. . . . . . . . . .  321 321
      100   CM-18V0
       94   COMPUTED-A . . . . . . . . . .  95 97 98 99 100 M229 294 298 410 413
       95   COMPUTED-N
       93   COMPUTED-X . . . . . . . . . .  M259 274 395
       97   COMPUTED-0V18
       99   COMPUTED-14V4
      101   COMPUTED-18V0
       98   COMPUTED-4V14
      117   COR-ANSI-REFERENCE . . . . . .  M287 M290 M405 M407
      108   CORRECT-A. . . . . . . . . . .  109 110 111 112 113 M228 295 297 411 413
      109   CORRECT-N
      107   CORRECT-X. . . . . . . . . . .  M260 276 397
      110   CORRECT-0V18
      112   CORRECT-14V4
      114   CORRECT-18V0
      111   CORRECT-4V14
      113   CR-18V0
      131   DELETE-COUNTER . . . . . . . .  346 362 364
       86   DOTVALUE . . . . . . . . . . .  M250
      137   DUMMY-HOLD . . . . . . . . . .  M376 386
       55   DUMMY-RECORD . . . . . . . . .  269 M270 M280 M300 M307 M310 M332 M333 M334 M335 M337 M338 M339 M341 M343 M352
                                            M359 M366 M371 M372 376 M377 378 M379 M380 M381 M382 M383 M384 M385 M386 390
                                            M391 M400 M415
      184   ENDER-DESC . . . . . . . . . .  M354 M365 M370
      132   ERROR-COUNTER. . . . . . . . .  M244 345 355 358
      136   ERROR-HOLD . . . . . . . . . .  M345 M346 M346 M347 350
      182   ERROR-TOTAL. . . . . . . . . .  M356 M358 M363 M364 M368 M369
       79   FEATURE. . . . . . . . . . . .  M429
      210   HYPHEN-LINE. . . . . . . . . .  339 341 385
      176   ID-AGAIN . . . . . . . . . . .  M321
      209   INF-ANSI-REFERENCE . . . . . .  M278 M282 M299 M302 M398 M401 M414 M416
      204   INFO-TEXT. . . . . . . . . . .  M279 M399
      133   INSPECT-COUNTER. . . . . . . .  345 367 369
       57   IX-NOP . . . . . . . . . . . .  39 222 433
       69   IX-NOP-ALTER-KEY
       67   IX-NOP-KEY . . . . . . . . . .  43
       64   IX-NOP-REC-120
       65   IX-NOP-REC-120-240
       75   IX-NOP-STATUS. . . . . . . . .  44 224 229 M428
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page    12
0 Defined   Cross-reference of data names   References

0      63   IX-NOPR1-F-G-240
       81   P-OR-F . . . . . . . . . . . .  M238 M243 253 M258
       83   PAR-NAME . . . . . . . . . . .  M261 M430
       85   PARDOT-X . . . . . . . . . . .  M249
      134   PASS-COUNTER . . . . . . . . .  M239 347 349
       51   PRINT-FILE . . . . . . . . . .  36 320 328
       53   PRINT-REC. . . . . . . . . . .  M251 M285 M288 M404 M406
       88   RE-MARK. . . . . . . . . . . .  M231 M262
      130   REC-CT . . . . . . . . . . . .  248 250 261
      129   REC-SKL-SUB. . . . . . . . . .  M324
      138   RECORD-COUNT . . . . . . . . .  M265 M374 375 M387
       89   TEST-COMPUTED. . . . . . . . .  285 404
      104   TEST-CORRECT . . . . . . . . .  288 406
      157   TEST-ID. . . . . . . . . . . .  M321
       77   TEST-RESULTS . . . . . . . . .  251 M322
      135   TOTAL-ERROR
      206   XXCOMPUTED . . . . . . . . . .  M298 M413
      208   XXCORRECT. . . . . . . . . . .  M297 M413
      201   XXINFO . . . . . . . . . . . .  280 300 400 415
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page    13
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

      306   ABNORMAL-TERM-DECL . . . . . .  G226 G234
      409   BAIL-OUT
      293   BAIL-OUT-DECL. . . . . . . . .  P257
      417   BAIL-OUT-EX. . . . . . . . . .  G411
      303   BAIL-OUT-EX-DECL . . . . . . .  E257 G295
      412   BAIL-OUT-WRITE . . . . . . . .  G410
      296   BAIL-OUT-WRITE-DECL. . . . . .  G294
      392   BLANK-LINE-PRINT
      271   BLANK-LINE-PRINT-DECL
      438   CCVS-EXIT
      325   CCVS-INIT-EXIT
      439   CCVS-999999
      318   CCVS1
      418   CCVS1-EXIT . . . . . . . . . .  G326
      327   CLOSE-FILES. . . . . . . . . .  G440
      336   COLUMN-NAMES-ROUTINE . . . . .  E323
      340   END-ROUTINE. . . . . . . . . .  P328
      344   END-ROUTINE-1
      353   END-ROUTINE-12
      361   END-ROUTINE-13 . . . . . . . .  E328
      342   END-RTN-EXIT
      313   EXIT-DECL
      242   FAIL-DECL. . . . . . . . . . .  P233
      394   FAIL-ROUTINE
      273   FAIL-ROUTINE-DECL. . . . . . .  P255
      408   FAIL-ROUTINE-EX. . . . . . . .  G402
      291   FAIL-ROUTINE-EX-DECL . . . . .  E255 G283
      403   FAIL-ROUTINE-WRITE . . . . . .  G396 G397
      284   FAIL-ROUTINE-WRITE-DECL. . . .  G275 G277
      331   HEAD-ROUTINE . . . . . . . . .  P323
      223   INPUT-PROCESS
      319   OPEN-FILES
      427   OPN-INIT-GF-01-0
      431   OPN-TEST-GF-01-0
      237   PASS-DECL. . . . . . . . . . .  P225
      247   PRINT-DETAIL-DECL. . . . . . .  P240 P245
      221   SECT-IX111-0001
      421   SECT-IX111A-0003
      422   SEQ-INIT-010
      329   TERMINATE-CCVS
      435   TERMINATE-ROUTINE
      373   WRITE-LINE . . . . . . . . . .  P332 P333 P334 P335 P337 P338 P339 P341 P343 P352 P360 P366 P371 P372 P400 P404
                                            P406 P415
      264   WRITE-LINE-DECL. . . . . . . .  P252 P254 P281 P286 P289 P301 P308 P311
      389   WRT-LN . . . . . . . . . . . .  P379 P380 P381 P382 P383 P384 P385 P388 P393
      268   WRT-LN-DECL. . . . . . . . . .  P266 P272
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page    14
0 Defined   Cross-reference of programs     References

        3   IX111A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX111A    Date 06/04/2022  Time 11:57:58   Page    15
0LineID  Message code  Message text

     51  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     57  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     57  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.

    427  IGYPS2015-I   The paragraph or section prior to paragraph or section "OPN-INIT-GF-01-0" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       4           4
-* Statistics for COBOL program IX111A:
 *    Source records = 440
 *    Data Division statements = 69
 *    Procedure Division statements = 186
 *    Generated COBOL statements = 0
 *    Program complexity factor = 193
0End of compilation 1,  program IX111A,  highest severity 0.
0Return code 0
