1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:59   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:59   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2244.2
   000002         000200 PROGRAM-ID.                                                      NC2244.2
   000003         000300     NC224A.                                                      NC2244.2
   000004         000500*                                                              *  NC2244.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2244.2
   000006         000700*                                                              *  NC2244.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2244.2
   000008         000900*                                                              *  NC2244.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2244.2
   000010         001100*                                                              *  NC2244.2
   000011         001300*                                                              *  NC2244.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2244.2
   000013         001500*                                                              *  NC2244.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2244.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2244.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2244.2
   000017         001900*                                                              *  NC2244.2
   000018         002100*    PROGRAM NC224A TESTS THE USE OF REFERENCE MODIFICATION    *  NC2244.2
   000019         002200*    ON A VARIETY OF DATA ITEMS USING LITERALS, DATA NAMES     *  NC2244.2
   000020         002300*    AND ARITHMETIC EXPRESSIONS AS PARAMETERS.                 *  NC2244.2
   000021         002400*    SUBSCRIPTED AND QUALIFIED DATA ITEMS ARE ALSO USED.       *  NC2244.2
   000022         002500*                                                              *  NC2244.2
   000023         002700 ENVIRONMENT DIVISION.                                            NC2244.2
   000024         002800 CONFIGURATION SECTION.                                           NC2244.2
   000025         002900 SOURCE-COMPUTER.                                                 NC2244.2
   000026         003000     XXXXX082.                                                    NC2244.2
   000027         003100 OBJECT-COMPUTER.                                                 NC2244.2
   000028         003200     XXXXX083.                                                    NC2244.2
   000029         003300 INPUT-OUTPUT SECTION.                                            NC2244.2
   000030         003400 FILE-CONTROL.                                                    NC2244.2
   000031         003500     SELECT PRINT-FILE ASSIGN TO                                  NC2244.2 35
   000032         003600     XXXXX055.                                                    NC2244.2
   000033         003700 DATA DIVISION.                                                   NC2244.2
   000034         003800 FILE SECTION.                                                    NC2244.2
   000035         003900 FD  PRINT-FILE.                                                  NC2244.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         004000 01  PRINT-REC PICTURE X(120).                                    NC2244.2
   000037         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC2244.2
   000038         004200 WORKING-STORAGE SECTION.                                         NC2244.2
   000039         004300 01  TEST-1-DATA                 PIC   9(6)     VALUE 123456.     NC2244.2
   000040         004400 01  TEST-2-DATA                 PIC   Z(5)9.                     NC2244.2
   000041         004500 01  TEST-3-DATA-GRP.                                             NC2244.2
   000042         004600   03  TEST-3-DATA               PIC   X(6)     VALUE "ABCDEF".   NC2244.2
   000043         004700 01  TEST-4-DATA                 PIC   XXBXXBXX VALUE "AB CD EF". NC2244.2
   000044         004800                                                                  NC2244.2
   000045         004900 01  WS-2                        PIC  S9        VALUE +2.         NC2244.2
   000046         005000 01  WS-3                        PIC  S9        VALUE +3.         NC2244.2
   000047         005100 01  WS-5                        PIC  S9        VALUE +5.         NC2244.2
   000048         005200 01  WS-6                        PIC  S9        VALUE +6.         NC2244.2
   000049         005300 01  WS-7                        PIC  S9        VALUE +7.         NC2244.2
   000050         005400 01  WS-10                       PIC  S99       VALUE +10.        NC2244.2
   000051         005500 01  TEST-5-TABLE.                                                NC2244.2
   000052         005600   03        TABLE-GROUP         OCCURS 4.                        NC2244.2
   000053         005700     05      TABLE-1             PIC 9(8)                         NC2244.2
   000054         005800                                 OCCURS 2.                        NC2244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900   03         TEST-3-DATA        PIC X(6).                        NC2244.2
   000056         006000*                                                                 NC2244.2
   000057         006100 01  TEST-RESULTS.                                                NC2244.2
   000058         006200     02 FILLER                   PIC X      VALUE SPACE.          NC2244.2 IMP
   000059         006300     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2244.2 IMP
   000060         006400     02 FILLER                   PIC X      VALUE SPACE.          NC2244.2 IMP
   000061         006500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2244.2 IMP
   000062         006600     02 FILLER                   PIC X      VALUE SPACE.          NC2244.2 IMP
   000063         006700     02  PAR-NAME.                                                NC2244.2
   000064         006800       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2244.2 IMP
   000065         006900       03  PARDOT-X              PIC X      VALUE SPACE.          NC2244.2 IMP
   000066         007000       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2244.2 IMP
   000067         007100     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2244.2 IMP
   000068         007200     02 RE-MARK                  PIC X(61).                       NC2244.2
   000069         007300 01  TEST-COMPUTED.                                               NC2244.2
   000070         007400     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2244.2 IMP
   000071         007500     02 FILLER                   PIC X(17)  VALUE                 NC2244.2
   000072         007600            "       COMPUTED=".                                   NC2244.2
   000073         007700     02 COMPUTED-X.                                               NC2244.2
   000074         007800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2244.2 IMP
   000075         007900     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2244.2 74
   000076         008000                                 PIC -9(9).9(9).                  NC2244.2
   000077         008100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2244.2 74
   000078         008200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2244.2 74
   000079         008300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2244.2 74
   000080         008400     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2244.2 74
   000081         008500         04 COMPUTED-18V0                    PIC -9(18).          NC2244.2
   000082         008600         04 FILLER                           PIC X.               NC2244.2
   000083         008700     03 FILLER PIC X(50) VALUE SPACE.                             NC2244.2 IMP
   000084         008800 01  TEST-CORRECT.                                                NC2244.2
   000085         008900     02 FILLER PIC X(30) VALUE SPACE.                             NC2244.2 IMP
   000086         009000     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2244.2
   000087         009100     02 CORRECT-X.                                                NC2244.2
   000088         009200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2244.2 IMP
   000089         009300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2244.2 88
   000090         009400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2244.2 88
   000091         009500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2244.2 88
   000092         009600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2244.2 88
   000093         009700     03      CR-18V0 REDEFINES CORRECT-A.                         NC2244.2 88
   000094         009800         04 CORRECT-18V0                     PIC -9(18).          NC2244.2
   000095         009900         04 FILLER                           PIC X.               NC2244.2
   000096         010000     03 FILLER PIC X(2) VALUE SPACE.                              NC2244.2 IMP
   000097         010100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2244.2 IMP
   000098         010200 01  CCVS-C-1.                                                    NC2244.2
   000099         010300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2244.2
   000100         010400-    "SS  PARAGRAPH-NAME                                          NC2244.2
   000101         010500-    "       REMARKS".                                            NC2244.2
   000102         010600     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2244.2 IMP
   000103         010700 01  CCVS-C-2.                                                    NC2244.2
   000104         010800     02 FILLER                     PIC X        VALUE SPACE.      NC2244.2 IMP
   000105         010900     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2244.2
   000106         011000     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2244.2 IMP
   000107         011100     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2244.2
   000108         011200     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2244.2 IMP
   000109         011300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2244.2 IMP
   000110         011400 01  REC-CT                        PIC 99       VALUE ZERO.       NC2244.2 IMP
   000111         011500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2244.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2244.2 IMP
   000113         011700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2244.2 IMP
   000114         011800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2244.2 IMP
   000115         011900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2244.2 IMP
   000116         012000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2244.2 IMP
   000117         012100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2244.2 IMP
   000118         012200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2244.2 IMP
   000119         012300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2244.2 IMP
   000120         012400 01  CCVS-H-1.                                                    NC2244.2
   000121         012500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2244.2 IMP
   000122         012600     02  FILLER                    PIC X(42)    VALUE             NC2244.2
   000123         012700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2244.2
   000124         012800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2244.2 IMP
   000125         012900 01  CCVS-H-2A.                                                   NC2244.2
   000126         013000   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2244.2 IMP
   000127         013100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2244.2
   000128         013200   02  FILLER                        PIC XXXX   VALUE             NC2244.2
   000129         013300     "4.2 ".                                                      NC2244.2
   000130         013400   02  FILLER                        PIC X(28)  VALUE             NC2244.2
   000131         013500            " COPY - NOT FOR DISTRIBUTION".                       NC2244.2
   000132         013600   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2244.2 IMP
   000133         013700                                                                  NC2244.2
   000134         013800 01  CCVS-H-2B.                                                   NC2244.2
   000135         013900   02  FILLER                        PIC X(15)  VALUE             NC2244.2
   000136         014000            "TEST RESULT OF ".                                    NC2244.2
   000137         014100   02  TEST-ID                       PIC X(9).                    NC2244.2
   000138         014200   02  FILLER                        PIC X(4)   VALUE             NC2244.2
   000139         014300            " IN ".                                               NC2244.2
   000140         014400   02  FILLER                        PIC X(12)  VALUE             NC2244.2
   000141         014500     " HIGH       ".                                              NC2244.2
   000142         014600   02  FILLER                        PIC X(22)  VALUE             NC2244.2
   000143         014700            " LEVEL VALIDATION FOR ".                             NC2244.2
   000144         014800   02  FILLER                        PIC X(58)  VALUE             NC2244.2
   000145         014900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2244.2
   000146         015000 01  CCVS-H-3.                                                    NC2244.2
   000147         015100     02  FILLER                      PIC X(34)  VALUE             NC2244.2
   000148         015200            " FOR OFFICIAL USE ONLY    ".                         NC2244.2
   000149         015300     02  FILLER                      PIC X(58)  VALUE             NC2244.2
   000150         015400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2244.2
   000151         015500     02  FILLER                      PIC X(28)  VALUE             NC2244.2
   000152         015600            "  COPYRIGHT   1985 ".                                NC2244.2
   000153         015700 01  CCVS-E-1.                                                    NC2244.2
   000154         015800     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2244.2 IMP
   000155         015900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2244.2
   000156         016000     02 ID-AGAIN                     PIC X(9).                    NC2244.2
   000157         016100     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2244.2 IMP
   000158         016200 01  CCVS-E-2.                                                    NC2244.2
   000159         016300     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2244.2 IMP
   000160         016400     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2244.2 IMP
   000161         016500     02 CCVS-E-2-2.                                               NC2244.2
   000162         016600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2244.2 IMP
   000163         016700         03 FILLER                   PIC X      VALUE SPACE.      NC2244.2 IMP
   000164         016800         03 ENDER-DESC               PIC X(44)  VALUE             NC2244.2
   000165         016900            "ERRORS ENCOUNTERED".                                 NC2244.2
   000166         017000 01  CCVS-E-3.                                                    NC2244.2
   000167         017100     02  FILLER                      PIC X(22)  VALUE             NC2244.2
   000168         017200            " FOR OFFICIAL USE ONLY".                             NC2244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2244.2 IMP
   000170         017400     02  FILLER                      PIC X(58)  VALUE             NC2244.2
   000171         017500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2244.2
   000172         017600     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2244.2 IMP
   000173         017700     02 FILLER                       PIC X(15)  VALUE             NC2244.2
   000174         017800             " COPYRIGHT 1985".                                   NC2244.2
   000175         017900 01  CCVS-E-4.                                                    NC2244.2
   000176         018000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2244.2 IMP
   000177         018100     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2244.2
   000178         018200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2244.2 IMP
   000179         018300     02 FILLER                       PIC X(40)  VALUE             NC2244.2
   000180         018400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2244.2
   000181         018500 01  XXINFO.                                                      NC2244.2
   000182         018600     02 FILLER                       PIC X(19)  VALUE             NC2244.2
   000183         018700            "*** INFORMATION ***".                                NC2244.2
   000184         018800     02 INFO-TEXT.                                                NC2244.2
   000185         018900       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2244.2 IMP
   000186         019000       04 XXCOMPUTED                 PIC X(20).                   NC2244.2
   000187         019100       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2244.2 IMP
   000188         019200       04 XXCORRECT                  PIC X(20).                   NC2244.2
   000189         019300     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2244.2
   000190         019400 01  HYPHEN-LINE.                                                 NC2244.2
   000191         019500     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2244.2 IMP
   000192         019600     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2244.2
   000193         019700-    "*****************************************".                 NC2244.2
   000194         019800     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2244.2
   000195         019900-    "******************************".                            NC2244.2
   000196         020000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2244.2
   000197         020100     "NC224A".                                                    NC2244.2
   000198         020200 PROCEDURE DIVISION.                                              NC2244.2
   000199         020300 CCVS1 SECTION.                                                   NC2244.2
   000200         020400 OPEN-FILES.                                                      NC2244.2
   000201         020500     OPEN     OUTPUT PRINT-FILE.                                  NC2244.2 35
   000202         020600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2244.2 196 137 196 156
   000203         020700     MOVE    SPACE TO TEST-RESULTS.                               NC2244.2 IMP 57
   000204         020800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2244.2 229 234
   000205         020900     GO TO CCVS1-EXIT.                                            NC2244.2 313
   000206         021000 CLOSE-FILES.                                                     NC2244.2
   000207         021100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2244.2 238 260 35
   000208         021200 TERMINATE-CCVS.                                                  NC2244.2
   000209         021300     EXIT PROGRAM.                                                NC2244.2
   000210         021400 TERMINATE-CALL.                                                  NC2244.2
   000211         021500     STOP     RUN.                                                NC2244.2
   000212         021600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2244.2 61 113
   000213         021700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2244.2 61 114
   000214         021800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2244.2 61 112
   000215         021900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2244.2 61 111
   000216         022000     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2244.2 68
   000217         022100 PRINT-DETAIL.                                                    NC2244.2
   000218         022200     IF REC-CT NOT EQUAL TO ZERO                                  NC2244.2 110 IMP
   000219      1  022300             MOVE "." TO PARDOT-X                                 NC2244.2 65
   000220      1  022400             MOVE REC-CT TO DOTVALUE.                             NC2244.2 110 66
   000221         022500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2244.2 57 36 272
   000222         022600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2244.2 61 272
   000223      1  022700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2244.2 289 303
   000224      1  022800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2244.2 304 312
   000225         022900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2244.2 IMP 61 IMP 73
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE SPACE TO CORRECT-X.                                     NC2244.2 IMP 87
   000227         023100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2244.2 110 IMP IMP 63
   000228         023200     MOVE     SPACE TO RE-MARK.                                   NC2244.2 IMP 68
   000229         023300 HEAD-ROUTINE.                                                    NC2244.2
   000230         023400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2244.2 120 37 272
   000231         023500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2244.2 125 37 272
   000232         023600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2244.2 134 37 272
   000233         023700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2244.2 146 37 272
   000234         023800 COLUMN-NAMES-ROUTINE.                                            NC2244.2
   000235         023900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2244.2 98 37 272
   000236         024000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2244.2 103 37 272
   000237         024100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2244.2 190 37 272
   000238         024200 END-ROUTINE.                                                     NC2244.2
   000239         024300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2244.2 190 37 272
   000240         024400 END-RTN-EXIT.                                                    NC2244.2
   000241         024500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2244.2 153 37 272
   000242         024600 END-ROUTINE-1.                                                   NC2244.2
   000243         024700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2244.2 112 116 113
   000244         024800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2244.2 116 111 116
   000245         024900      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2244.2 114 116
   000246         025000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2244.2
   000247         025100                                                                  NC2244.2
   000248         025200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2244.2 114 176
   000249         025300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2244.2 116 178
   000250         025400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2244.2 175 161
   000251         025500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2244.2 158 37 272
   000252         025600  END-ROUTINE-12.                                                 NC2244.2
   000253         025700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2244.2 164
   000254         025800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2244.2 112 IMP
   000255      1  025900         MOVE "NO " TO ERROR-TOTAL                                NC2244.2 162
   000256         026000         ELSE                                                     NC2244.2
   000257      1  026100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2244.2 112 162
   000258         026200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2244.2 158 37
   000259         026300     PERFORM WRITE-LINE.                                          NC2244.2 272
   000260         026400 END-ROUTINE-13.                                                  NC2244.2
   000261         026500     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2244.2 111 IMP
   000262      1  026600         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2244.2 162
   000263      1  026700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2244.2 111 162
   000264         026800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2244.2 164
   000265         026900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2244.2 158 37 272
   000266         027000      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2244.2 113 IMP
   000267      1  027100          MOVE "NO " TO ERROR-TOTAL                               NC2244.2 162
   000268      1  027200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2244.2 113 162
   000269         027300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2244.2 164
   000270         027400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2244.2 158 37 272
   000271         027500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2244.2 166 37 272
   000272         027600 WRITE-LINE.                                                      NC2244.2
   000273         027700     ADD 1 TO RECORD-COUNT.                                       NC2244.2 118
   000274         027800     IF RECORD-COUNT GREATER 50                                   NC2244.2 118
   000275      1  027900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2244.2 37 117
   000276      1  028000         MOVE SPACE TO DUMMY-RECORD                               NC2244.2 IMP 37
   000277      1  028100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2244.2 37
   000278      1  028200         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2244.2 98 37 284
   000279      1  028300         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2244.2 103 37 284
   000280      1  028400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2244.2 190 37 284
   000281      1  028500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2244.2 117 37
   000282      1  028600         MOVE ZERO TO RECORD-COUNT.                               NC2244.2 IMP 118
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     PERFORM WRT-LN.                                              NC2244.2 284
   000284         028800 WRT-LN.                                                          NC2244.2
   000285         028900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2244.2 37
   000286         029000     MOVE SPACE TO DUMMY-RECORD.                                  NC2244.2 IMP 37
   000287         029100 BLANK-LINE-PRINT.                                                NC2244.2
   000288         029200     PERFORM WRT-LN.                                              NC2244.2 284
   000289         029300 FAIL-ROUTINE.                                                    NC2244.2
   000290         029400     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC2244.2 73 IMP
   000291      1  029500            GO TO    FAIL-ROUTINE-WRITE.                          NC2244.2 298
   000292         029600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2244.2 87 IMP 298
   000293         029700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2244.2 119 189
   000294         029800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2244.2 184
   000295         029900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2244.2 181 37 272
   000296         030000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2244.2 IMP 189
   000297         030100     GO TO  FAIL-ROUTINE-EX.                                      NC2244.2 303
   000298         030200 FAIL-ROUTINE-WRITE.                                              NC2244.2
   000299         030300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2244.2 69 36 272
   000300         030400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2244.2 119 97
   000301         030500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2244.2 84 36 272
   000302         030600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2244.2 IMP 97
   000303         030700 FAIL-ROUTINE-EX. EXIT.                                           NC2244.2
   000304         030800 BAIL-OUT.                                                        NC2244.2
   000305         030900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2244.2 74 IMP 307
   000306         031000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2244.2 88 IMP 312
   000307         031100 BAIL-OUT-WRITE.                                                  NC2244.2
   000308         031200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2244.2 88 188 74 186
   000309         031300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2244.2 119 189
   000310         031400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2244.2 181 37 272
   000311         031500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2244.2 IMP 189
   000312         031600 BAIL-OUT-EX. EXIT.                                               NC2244.2
   000313         031700 CCVS1-EXIT.                                                      NC2244.2
   000314         031800     EXIT.                                                        NC2244.2
   000315         031900 SECT-NC224A-001 SECTION.                                         NC2244.2
   000316         032000*                                                                 NC2244.2
   000317         032100 REF-INIT-GF-1.                                                   NC2244.2
   000318         032200     MOVE   "REFERENCE MODIFICATION" TO FEATURE.                  NC2244.2 59
   000319         032300     MOVE   "IV-22 4.3.8.3" TO ANSI-REFERENCE.                    NC2244.2 119
   000320         032400     MOVE    123456  TO TEST-1-DATA.                              NC2244.2 39
   000321         032500     MOVE    1       TO REC-CT.                                   NC2244.2 110
   000322         032600     GO TO   REF-TEST-GF-1-1.                                     NC2244.2 327
   000323         032700 REF-DELETE-GF-1.                                                 NC2244.2
   000324         032800     PERFORM DE-LETE.                                             NC2244.2 215
   000325         032900     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000326         033000     GO TO   REF-INIT-GF-2.                                       NC2244.2 384
   000327         033100 REF-TEST-GF-1-1.                                                 NC2244.2
   000328         033200     MOVE   "REF-TEST-GF-1-1" TO PAR-NAME.                        NC2244.2 63
   000329         033300     IF      TEST-1-DATA (3:) = 3456                              NC2244.2 39
   000330      1  033400             PERFORM PASS                                         NC2244.2 213
   000331      1  033500             GO TO REF-WRITE-GF-1-1                               NC2244.2 342
   000332         033600     ELSE                                                         NC2244.2
   000333      1  033700             GO TO REF-FAIL-GF-1-1.                               NC2244.2 337
   000334         033800 REF-DELETE-GF-1-1.                                               NC2244.2
   000335         033900     PERFORM DE-LETE.                                             NC2244.2 215
   000336         034000     GO TO REF-WRITE-GF-1-1.                                      NC2244.2 342
   000337         034100 REF-FAIL-GF-1-1.                                                 NC2244.2
   000338         034200     MOVE    3456 TO CORRECT-N                                    NC2244.2 89
   000339         034300     MOVE    TEST-1-DATA (3:) TO COMPUTED-X                       NC2244.2 39 73
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000341         034500     PERFORM FAIL.                                                NC2244.2 214
   000342         034600 REF-WRITE-GF-1-1.                                                NC2244.2
   000343         034700     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000344         034800*                                                                 NC2244.2
   000345         034900 REF-TEST-GF-1-2.                                                 NC2244.2
   000346         035000     ADD     1       TO REC-CT.                                   NC2244.2 110
   000347         035100     MOVE   "REF-TEST-GF-1-2" TO PAR-NAME.                        NC2244.2 63
   000348         035200     IF      TEST-1-DATA (2: WS-3) = 234                          NC2244.2 39 46
   000349      1  035300             PERFORM PASS                                         NC2244.2 213
   000350      1  035400             GO TO REF-WRITE-GF-1-2                               NC2244.2 361
   000351         035500     ELSE                                                         NC2244.2
   000352      1  035600             GO TO REF-FAIL-GF-1-2.                               NC2244.2 356
   000353         035700 REF-DELETE-GF-1-2.                                               NC2244.2
   000354         035800     PERFORM DE-LETE.                                             NC2244.2 215
   000355         035900     GO TO REF-WRITE-GF-1-2.                                      NC2244.2 361
   000356         036000 REF-FAIL-GF-1-2.                                                 NC2244.2
   000357         036100     MOVE    234 TO CORRECT-N                                     NC2244.2 89
   000358         036200     MOVE    TEST-1-DATA (2: WS-3) TO COMPUTED-X                  NC2244.2 39 46 73
   000359         036300     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000360         036400     PERFORM FAIL.                                                NC2244.2 214
   000361         036500 REF-WRITE-GF-1-2.                                                NC2244.2
   000362         036600     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000363         036700*                                                                 NC2244.2
   000364         036800 REF-TEST-GF-1-3.                                                 NC2244.2
   000365         036900     ADD     1       TO REC-CT.                                   NC2244.2 110
   000366         037000     MOVE   "REF-TEST-GF-1-3" TO PAR-NAME.                        NC2244.2 63
   000367         037100     IF      TEST-1-DATA (10 - 7: 6 + 2 - 5) = 345                NC2244.2 39
   000368      1  037200             PERFORM PASS                                         NC2244.2 213
   000369      1  037300             GO TO REF-WRITE-GF-1-3                               NC2244.2 381
   000370         037400     ELSE                                                         NC2244.2
   000371      1  037500             GO TO REF-FAIL-GF-1-3.                               NC2244.2 375
   000372         037600 REF-DELETE-GF-1-3.                                               NC2244.2
   000373         037700     PERFORM DE-LETE.                                             NC2244.2 215
   000374         037800     GO TO REF-WRITE-GF-1-3.                                      NC2244.2 381
   000375         037900 REF-FAIL-GF-1-3.                                                 NC2244.2
   000376         038000     MOVE    345 TO CORRECT-N                                     NC2244.2 89
   000377         038100     MOVE    TEST-1-DATA (10 - 7: 6 + 2 - 5)                      NC2244.2 39
   000378         038200         TO COMPUTED-X                                            NC2244.2 73
   000379         038300     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000380         038400     PERFORM FAIL.                                                NC2244.2 214
   000381         038500 REF-WRITE-GF-1-3.                                                NC2244.2
   000382         038600     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000383         038700*                                                                 NC2244.2
   000384         038800 REF-INIT-GF-2.                                                   NC2244.2
   000385         038900     MOVE   "IV-22 4.3.8.3" TO ANSI-REFERENCE.                    NC2244.2 119
   000386         039000     MOVE    1234    TO TEST-2-DATA.                              NC2244.2 40
   000387         039100     MOVE    1       TO REC-CT.                                   NC2244.2 110
   000388         039200     GO TO   REF-TEST-GF-2-1.                                     NC2244.2 393
   000389         039300 REF-DELETE-GF-2.                                                 NC2244.2
   000390         039400     PERFORM DE-LETE.                                             NC2244.2 215
   000391         039500     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000392         039600     GO TO   REF-INIT-GF-3.                                       NC2244.2 450
   000393         039700 REF-TEST-GF-2-1.                                                 NC2244.2
   000394         039800     MOVE   "REF-TEST-GF-2-1" TO PAR-NAME.                        NC2244.2 63
   000395         039900     IF      TEST-2-DATA (WS-3:) = "1234"                         NC2244.2 40 46
   000396      1  040000             PERFORM PASS                                         NC2244.2 213
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040100             GO TO REF-WRITE-GF-2-1                               NC2244.2 408
   000398         040200     ELSE                                                         NC2244.2
   000399      1  040300             GO TO REF-FAIL-GF-2-1.                               NC2244.2 403
   000400         040400 REF-DELETE-GF-2-1.                                               NC2244.2
   000401         040500     PERFORM DE-LETE.                                             NC2244.2 215
   000402         040600     GO TO REF-WRITE-GF-2-1.                                      NC2244.2 408
   000403         040700 REF-FAIL-GF-2-1.                                                 NC2244.2
   000404         040800     MOVE   "1234" TO CORRECT-X                                   NC2244.2 87
   000405         040900     MOVE    TEST-2-DATA (WS-3:) TO COMPUTED-X                    NC2244.2 40 46 73
   000406         041000     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000407         041100     PERFORM FAIL.                                                NC2244.2 214
   000408         041200 REF-WRITE-GF-2-1.                                                NC2244.2
   000409         041300     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000410         041400*                                                                 NC2244.2
   000411         041500 REF-TEST-GF-2-2.                                                 NC2244.2
   000412         041600     ADD     1       TO REC-CT.                                   NC2244.2 110
   000413         041700     MOVE   "REF-TEST-GF-2-2" TO PAR-NAME.                        NC2244.2 63
   000414         041800     IF      TEST-2-DATA (WS-2: 3) = " 12"                        NC2244.2 40 45
   000415      1  041900             PERFORM PASS                                         NC2244.2 213
   000416      1  042000             GO TO REF-WRITE-GF-2-2                               NC2244.2 427
   000417         042100     ELSE                                                         NC2244.2
   000418      1  042200             GO TO REF-FAIL-GF-2-2.                               NC2244.2 422
   000419         042300 REF-DELETE-GF-2-2.                                               NC2244.2
   000420         042400     PERFORM DE-LETE.                                             NC2244.2 215
   000421         042500     GO TO REF-WRITE-GF-2-2.                                      NC2244.2 427
   000422         042600 REF-FAIL-GF-2-2.                                                 NC2244.2
   000423         042700     MOVE   " 12" TO CORRECT-X                                    NC2244.2 87
   000424         042800     MOVE    TEST-2-DATA (WS-2: 3) TO COMPUTED-X                  NC2244.2 40 45 73
   000425         042900     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000426         043000     PERFORM FAIL.                                                NC2244.2 214
   000427         043100 REF-WRITE-GF-2-2.                                                NC2244.2
   000428         043200     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000429         043300*                                                                 NC2244.2
   000430         043400 REF-TEST-GF-2-3.                                                 NC2244.2
   000431         043500     ADD     1       TO REC-CT.                                   NC2244.2 110
   000432         043600     MOVE   "REF-TEST-GF-2-3" TO PAR-NAME.                        NC2244.2 63
   000433         043700     IF      TEST-2-DATA (10 - 7: 6 + 2 - 5) = "123"              NC2244.2 40
   000434      1  043800             PERFORM PASS                                         NC2244.2 213
   000435      1  043900             GO TO REF-WRITE-GF-2-3                               NC2244.2 447
   000436         044000     ELSE                                                         NC2244.2
   000437      1  044100             GO TO REF-FAIL-GF-2-3.                               NC2244.2 441
   000438         044200 REF-DELETE-GF-2-3.                                               NC2244.2
   000439         044300     PERFORM DE-LETE.                                             NC2244.2 215
   000440         044400     GO TO REF-WRITE-GF-2-3.                                      NC2244.2 447
   000441         044500 REF-FAIL-GF-2-3.                                                 NC2244.2
   000442         044600     MOVE   "123" TO CORRECT-X                                    NC2244.2 87
   000443         044700     MOVE    TEST-2-DATA (10 - 7: 6 + 2 - 5)                      NC2244.2 40
   000444         044800          TO COMPUTED-X                                           NC2244.2 73
   000445         044900     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000446         045000     PERFORM FAIL.                                                NC2244.2 214
   000447         045100 REF-WRITE-GF-2-3.                                                NC2244.2
   000448         045200     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000449         045300*                                                                 NC2244.2
   000450         045400 REF-INIT-GF-3.                                                   NC2244.2
   000451         045500     MOVE   "IV-22 4.3.8.3" TO ANSI-REFERENCE.                    NC2244.2 119
   000452         045600     MOVE   "ABCDEF" TO TEST-3-DATA IN TEST-3-DATA-GRP.           NC2244.2 42 41
   000453         045700     MOVE    1       TO REC-CT.                                   NC2244.2 110
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     GO TO   REF-TEST-GF-3-1.                                     NC2244.2 459
   000455         045900 REF-DELETE-GF-3.                                                 NC2244.2
   000456         046000     PERFORM DE-LETE.                                             NC2244.2 215
   000457         046100     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000458         046200     GO TO   REF-INIT-GF-3.                                       NC2244.2 450
   000459         046300 REF-TEST-GF-3-1.                                                 NC2244.2
   000460         046400     MOVE   "REF-TEST-GF-3-1" TO PAR-NAME.                        NC2244.2 63
   000461         046500     IF      TEST-3-DATA IN TEST-3-DATA-GRP (3:) = "CDEF"         NC2244.2 42 41
   000462      1  046600             PERFORM PASS                                         NC2244.2 213
   000463      1  046700             GO TO REF-WRITE-GF-3-1                               NC2244.2 474
   000464         046800     ELSE                                                         NC2244.2
   000465      1  046900             GO TO REF-FAIL-GF-3-1.                               NC2244.2 469
   000466         047000 REF-DELETE-GF-3-1.                                               NC2244.2
   000467         047100     PERFORM DE-LETE.                                             NC2244.2 215
   000468         047200     GO TO REF-WRITE-GF-3-1.                                      NC2244.2 474
   000469         047300 REF-FAIL-GF-3-1.                                                 NC2244.2
   000470         047400     MOVE   "CDEF" TO CORRECT-X.                                  NC2244.2 87
   000471         047500     MOVE    TEST-3-DATA IN TEST-3-DATA-GRP (3:) TO COMPUTED-X.   NC2244.2 42 41 73
   000472         047600     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK.        NC2244.2 68
   000473         047700     PERFORM FAIL.                                                NC2244.2 214
   000474         047800 REF-WRITE-GF-3-1.                                                NC2244.2
   000475         047900     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000476         048000*                                                                 NC2244.2
   000477         048100 REF-TEST-GF-3-2.                                                 NC2244.2
   000478         048200     ADD     1       TO REC-CT.                                   NC2244.2 110
   000479         048300     MOVE   "REF-TEST-GF-3-2" TO PAR-NAME.                        NC2244.2 63
   000480         048400     IF      TEST-3-DATA IN TEST-3-DATA-GRP (2: WS-3) = "BCD"     NC2244.2 42 41 46
   000481      1  048500             PERFORM PASS                                         NC2244.2 213
   000482      1  048600             GO TO REF-WRITE-GF-3-2                               NC2244.2 494
   000483         048700     ELSE                                                         NC2244.2
   000484      1  048800             GO TO REF-FAIL-GF-3-2.                               NC2244.2 488
   000485         048900 REF-DELETE-GF-3-2.                                               NC2244.2
   000486         049000     PERFORM DE-LETE.                                             NC2244.2 215
   000487         049100     GO TO REF-WRITE-GF-3-2.                                      NC2244.2 494
   000488         049200 REF-FAIL-GF-3-2.                                                 NC2244.2
   000489         049300     MOVE   "BCD" TO CORRECT-X.                                   NC2244.2 87
   000490         049400     MOVE    TEST-3-DATA IN TEST-3-DATA-GRP (2: WS-3)             NC2244.2 42 41 46
   000491         049500          TO COMPUTED-X.                                          NC2244.2 73
   000492         049600     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK.        NC2244.2 68
   000493         049700     PERFORM FAIL.                                                NC2244.2 214
   000494         049800 REF-WRITE-GF-3-2.                                                NC2244.2
   000495         049900     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000496         050000*                                                                 NC2244.2
   000497         050100 REF-TEST-GF-3-3.                                                 NC2244.2
   000498         050200     ADD     1       TO REC-CT.                                   NC2244.2 110
   000499         050300     MOVE   "REF-TEST-GF-3-3" TO PAR-NAME.                        NC2244.2 63
   000500         050400     IF      TEST-3-DATA IN TEST-3-DATA-GRP (10 - 7: 6 + 2 - 5)   NC2244.2 42 41
   000501         050500           = "CDE"                                                NC2244.2
   000502      1  050600             PERFORM PASS                                         NC2244.2 213
   000503      1  050700             GO TO REF-WRITE-GF-3-3                               NC2244.2 515
   000504         050800     ELSE                                                         NC2244.2
   000505      1  050900             GO TO REF-FAIL-GF-3-3.                               NC2244.2 509
   000506         051000 REF-DELETE-GF-3-3.                                               NC2244.2
   000507         051100     PERFORM DE-LETE.                                             NC2244.2 215
   000508         051200     GO TO REF-WRITE-GF-3-3.                                      NC2244.2 515
   000509         051300 REF-FAIL-GF-3-3.                                                 NC2244.2
   000510         051400     MOVE   "CDE" TO CORRECT-X.                                   NC2244.2 87
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     MOVE    TEST-3-DATA IN TEST-3-DATA-GRP (10 - 7: 6 + 2 - 5)   NC2244.2 42 41
   000512         051600          TO COMPUTED-X                                           NC2244.2 73
   000513         051700     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000514         051800     PERFORM FAIL.                                                NC2244.2 214
   000515         051900 REF-WRITE-GF-3-3.                                                NC2244.2
   000516         052000     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000517         052100*                                                                 NC2244.2
   000518         052200 REF-INIT-GF-4.                                                   NC2244.2
   000519         052300     MOVE   "IV-22 4.3.8.3" TO ANSI-REFERENCE.                    NC2244.2 119
   000520         052400     MOVE   "ABCDEF" TO TEST-4-DATA.                              NC2244.2 43
   000521         052500     MOVE    1       TO REC-CT.                                   NC2244.2 110
   000522         052600     GO TO   REF-TEST-GF-4-1.                                     NC2244.2 527
   000523         052700 REF-DELETE-GF-4.                                                 NC2244.2
   000524         052800     PERFORM DE-LETE.                                             NC2244.2 215
   000525         052900     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000526         053000     GO TO   REF-INIT-GF-5.                                       NC2244.2 584
   000527         053100 REF-TEST-GF-4-1.                                                 NC2244.2
   000528         053200     MOVE   "REF-TEST-GF-4-1" TO PAR-NAME.                        NC2244.2 63
   000529         053300     IF      TEST-4-DATA (3:) = " CD EF"                          NC2244.2 43
   000530      1  053400             PERFORM PASS                                         NC2244.2 213
   000531      1  053500             GO TO REF-WRITE-GF-4-1                               NC2244.2 542
   000532         053600     ELSE                                                         NC2244.2
   000533      1  053700             GO TO REF-FAIL-GF-4-1.                               NC2244.2 537
   000534         053800 REF-DELETE-GF-4-1.                                               NC2244.2
   000535         053900     PERFORM DE-LETE.                                             NC2244.2 215
   000536         054000     GO TO REF-WRITE-GF-4-1.                                      NC2244.2 542
   000537         054100 REF-FAIL-GF-4-1.                                                 NC2244.2
   000538         054200     MOVE   " CD EF" TO CORRECT-X                                 NC2244.2 87
   000539         054300     MOVE    TEST-4-DATA (3:) TO COMPUTED-X                       NC2244.2 43 73
   000540         054400     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000541         054500     PERFORM FAIL.                                                NC2244.2 214
   000542         054600 REF-WRITE-GF-4-1.                                                NC2244.2
   000543         054700     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000544         054800*                                                                 NC2244.2
   000545         054900 REF-TEST-GF-4-2.                                                 NC2244.2
   000546         055000     ADD     1       TO REC-CT.                                   NC2244.2 110
   000547         055100     MOVE   "REF-TEST-GF-4-2" TO PAR-NAME.                        NC2244.2 63
   000548         055200     IF      TEST-4-DATA (WS-2: WS-3) = "B C"                     NC2244.2 43 45 46
   000549      1  055300             PERFORM PASS                                         NC2244.2 213
   000550      1  055400             GO TO REF-WRITE-GF-4-2                               NC2244.2 561
   000551         055500     ELSE                                                         NC2244.2
   000552      1  055600             GO TO REF-FAIL-GF-4-2.                               NC2244.2 556
   000553         055700 REF-DELETE-GF-4-2.                                               NC2244.2
   000554         055800     PERFORM DE-LETE.                                             NC2244.2 215
   000555         055900     GO TO REF-WRITE-GF-4-2.                                      NC2244.2 561
   000556         056000 REF-FAIL-GF-4-2.                                                 NC2244.2
   000557         056100     MOVE   "B C" TO CORRECT-X                                    NC2244.2 87
   000558         056200     MOVE    TEST-4-DATA (WS-2: WS-3) TO COMPUTED-X               NC2244.2 43 45 46 73
   000559         056300     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000560         056400     PERFORM FAIL.                                                NC2244.2 214
   000561         056500 REF-WRITE-GF-4-2.                                                NC2244.2
   000562         056600     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000563         056700*                                                                 NC2244.2
   000564         056800 REF-TEST-GF-4-3.                                                 NC2244.2
   000565         056900     ADD     1       TO REC-CT.                                   NC2244.2 110
   000566         057000     MOVE   "REF-TEST-GF-4-3" TO PAR-NAME.                        NC2244.2 63
   000567         057100     IF      TEST-4-DATA (10 - 7: 6 + 2 - 5) = " CD"              NC2244.2 43
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  057200             PERFORM PASS                                         NC2244.2 213
   000569      1  057300             GO TO REF-WRITE-GF-4-3                               NC2244.2 581
   000570         057400     ELSE                                                         NC2244.2
   000571      1  057500             GO TO REF-FAIL-GF-4-3.                               NC2244.2 575
   000572         057600 REF-DELETE-GF-4-3.                                               NC2244.2
   000573         057700     PERFORM DE-LETE.                                             NC2244.2 215
   000574         057800     GO TO REF-WRITE-GF-4-3.                                      NC2244.2 581
   000575         057900 REF-FAIL-GF-4-3.                                                 NC2244.2
   000576         058000     MOVE   " CD" TO CORRECT-X                                    NC2244.2 87
   000577         058100     MOVE    TEST-4-DATA (10 - 7: 6 + 2 - 5)                      NC2244.2 43
   000578         058200          TO COMPUTED-X                                           NC2244.2 73
   000579         058300     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000580         058400     PERFORM FAIL.                                                NC2244.2 214
   000581         058500 REF-WRITE-GF-4-3.                                                NC2244.2
   000582         058600     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000583         058700*                                                                 NC2244.2
   000584         058800 REF-INIT-GF-5.                                                   NC2244.2
   000585         058900*    ===-->  SUBSCRIPTED DATA-NAME  <--===                        NC2244.2
   000586         059000     MOVE   "IV-22 4.3.8.3.3 SR4" TO ANSI-REFERENCE.              NC2244.2 119
   000587         059100     MOVE    12345678 TO TABLE-1 (3 2).                           NC2244.2 53
   000588         059200     MOVE    1       TO REC-CT.                                   NC2244.2 110
   000589         059300     GO TO   REF-TEST-GF-5-1.                                     NC2244.2 594
   000590         059400 REF-DELETE-GF-5.                                                 NC2244.2
   000591         059500     PERFORM DE-LETE.                                             NC2244.2 215
   000592         059600     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000593         059700     GO TO   REF-INIT-GF-6.                                       NC2244.2 612
   000594         059800 REF-TEST-GF-5-1.                                                 NC2244.2
   000595         059900     MOVE   "REF-TEST-GF-5-1" TO PAR-NAME.                        NC2244.2 63
   000596         060000     IF      TABLE-1 (3 2) (2: 5) = 23456                         NC2244.2 53
   000597      1  060100             PERFORM PASS                                         NC2244.2 213
   000598      1  060200             GO TO REF-WRITE-GF-5-1                               NC2244.2 609
   000599         060300     ELSE                                                         NC2244.2
   000600      1  060400             GO TO REF-FAIL-GF-5-1.                               NC2244.2 604
   000601         060500 REF-DELETE-GF-5-1.                                               NC2244.2
   000602         060600     PERFORM DE-LETE.                                             NC2244.2 215
   000603         060700     GO TO REF-WRITE-GF-5-1.                                      NC2244.2 609
   000604         060800 REF-FAIL-GF-5-1.                                                 NC2244.2
   000605         060900     MOVE    23456   TO CORRECT-N                                 NC2244.2 89
   000606         061000     MOVE    TABLE-1 (3 2) (2: 5) TO COMPUTED-X                   NC2244.2 53 73
   000607         061100     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000608         061200     PERFORM FAIL.                                                NC2244.2 214
   000609         061300 REF-WRITE-GF-5-1.                                                NC2244.2
   000610         061400     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000611         061500*                                                                 NC2244.2
   000612         061600 REF-INIT-GF-6.                                                   NC2244.2
   000613         061700*    ===-->  QUALIFIED DATA-NAME  <--===                          NC2244.2
   000614         061800     MOVE   "IV-22 4.3.8.3.3 SR4" TO ANSI-REFERENCE.              NC2244.2 119
   000615         061900     MOVE   "OPQRST" TO TEST-3-DATA OF TEST-5-TABLE.              NC2244.2 55 51
   000616         062000     MOVE    1       TO REC-CT.                                   NC2244.2 110
   000617         062100     GO TO   REF-TEST-GF-6-1.                                     NC2244.2 622
   000618         062200 REF-DELETE-GF-6.                                                 NC2244.2
   000619         062300     PERFORM DE-LETE.                                             NC2244.2 215
   000620         062400     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000621         062500     GO TO   CCVS-EXIT.                                           NC2244.2 641
   000622         062600 REF-TEST-GF-6-1.                                                 NC2244.2
   000623         062700     MOVE   "REF-TEST-GF-6-1" TO PAR-NAME.                        NC2244.2 63
   000624         062800     IF      TEST-3-DATA OF TEST-5-TABLE (2: 4) = "PQRS"          NC2244.2 55 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  062900             PERFORM PASS                                         NC2244.2 213
   000626      1  063000             GO TO   REF-WRITE-GF-6-1                             NC2244.2 638
   000627         063100     ELSE                                                         NC2244.2
   000628      1  063200             GO TO   REF-FAIL-GF-6-1.                             NC2244.2 632
   000629         063300 REF-DELETE-GF-6-1.                                               NC2244.2
   000630         063400     PERFORM DE-LETE.                                             NC2244.2 215
   000631         063500     GO TO   REF-WRITE-GF-6-1.                                    NC2244.2 638
   000632         063600 REF-FAIL-GF-6-1.                                                 NC2244.2
   000633         063700     MOVE   "PQRS"   TO CORRECT-X.                                NC2244.2 87
   000634         063800     MOVE    TEST-3-DATA OF TEST-5-TABLE (2: 4)                   NC2244.2 55 51
   000635         063900          TO COMPUTED-X                                           NC2244.2 73
   000636         064000     MOVE   "INCORRECT REFERENCE MODIFICATION" TO RE-MARK         NC2244.2 68
   000637         064100     PERFORM FAIL.                                                NC2244.2 214
   000638         064200 REF-WRITE-GF-6-1.                                                NC2244.2
   000639         064300     PERFORM PRINT-DETAIL.                                        NC2244.2 217
   000640         064400*                                                                 NC2244.2
   000641         064500 CCVS-EXIT SECTION.                                               NC2244.2
   000642         064600 CCVS-999999.                                                     NC2244.2
   000643         064700     GO TO CLOSE-FILES.                                           NC2244.2 206
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      119   ANSI-REFERENCE . . . . . . . .  293 300 309 M319 M385 M451 M519 M586 M614
       98   CCVS-C-1 . . . . . . . . . . .  235 278
      103   CCVS-C-2 . . . . . . . . . . .  236 279
      153   CCVS-E-1 . . . . . . . . . . .  241
      158   CCVS-E-2 . . . . . . . . . . .  251 258 265 270
      161   CCVS-E-2-2 . . . . . . . . . .  M250
      166   CCVS-E-3 . . . . . . . . . . .  271
      175   CCVS-E-4 . . . . . . . . . . .  250
      176   CCVS-E-4-1 . . . . . . . . . .  M248
      178   CCVS-E-4-2 . . . . . . . . . .  M249
      120   CCVS-H-1 . . . . . . . . . . .  230
      125   CCVS-H-2A. . . . . . . . . . .  231
      134   CCVS-H-2B. . . . . . . . . . .  232
      146   CCVS-H-3 . . . . . . . . . . .  233
      196   CCVS-PGM-ID. . . . . . . . . .  202 202
       80   CM-18V0
       74   COMPUTED-A . . . . . . . . . .  75 77 78 79 80 305 308
       75   COMPUTED-N
       73   COMPUTED-X . . . . . . . . . .  M225 290 M339 M358 M378 M405 M424 M444 M471 M491 M512 M539 M558 M578 M606 M635
       77   COMPUTED-0V18
       79   COMPUTED-14V4
       81   COMPUTED-18V0
       78   COMPUTED-4V14
       97   COR-ANSI-REFERENCE . . . . . .  M300 M302
       88   CORRECT-A. . . . . . . . . . .  89 90 91 92 93 306 308
       89   CORRECT-N. . . . . . . . . . .  M338 M357 M376 M605
       87   CORRECT-X. . . . . . . . . . .  M226 292 M404 M423 M442 M470 M489 M510 M538 M557 M576 M633
       90   CORRECT-0V18
       92   CORRECT-14V4
       94   CORRECT-18V0
       91   CORRECT-4V14
       93   CR-18V0
      111   DELETE-COUNTER . . . . . . . .  M215 244 261 263
       66   DOTVALUE . . . . . . . . . . .  M220
      117   DUMMY-HOLD . . . . . . . . . .  M275 281
       37   DUMMY-RECORD . . . . . . . . .  M230 M231 M232 M233 M235 M236 M237 M239 M241 M251 M258 M265 M270 M271 275 M276
                                            277 M278 M279 M280 M281 285 M286 M295 M310
      164   ENDER-DESC . . . . . . . . . .  M253 M264 M269
      112   ERROR-COUNTER. . . . . . . . .  M214 243 254 257
      116   ERROR-HOLD . . . . . . . . . .  M243 M244 M244 M245 249
      162   ERROR-TOTAL. . . . . . . . . .  M255 M257 M262 M263 M267 M268
       59   FEATURE. . . . . . . . . . . .  M318
      190   HYPHEN-LINE. . . . . . . . . .  237 239 280
      156   ID-AGAIN . . . . . . . . . . .  M202
      189   INF-ANSI-REFERENCE . . . . . .  M293 M296 M309 M311
      184   INFO-TEXT. . . . . . . . . . .  M294
      113   INSPECT-COUNTER. . . . . . . .  M212 243 266 268
       61   P-OR-F . . . . . . . . . . . .  M212 M213 M214 M215 222 M225
       63   PAR-NAME . . . . . . . . . . .  M227 M328 M347 M366 M394 M413 M432 M460 M479 M499 M528 M547 M566 M595 M623
       65   PARDOT-X . . . . . . . . . . .  M219
      114   PASS-COUNTER . . . . . . . . .  M213 245 248
       35   PRINT-FILE . . . . . . . . . .  31 201 207
       36   PRINT-REC. . . . . . . . . . .  M221 M299 M301
       68   RE-MARK. . . . . . . . . . . .  M216 M228 M340 M359 M379 M406 M425 M445 M472 M492 M513 M540 M559 M579 M607 M636
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    16
0 Defined   Cross-reference of data names   References

0     110   REC-CT . . . . . . . . . . . .  218 220 227 M321 M346 M365 M387 M412 M431 M453 M478 M498 M521 M546 M565 M588
                                            M616
      109   REC-SKL-SUB
      118   RECORD-COUNT . . . . . . . . .  M273 274 M282
       52   TABLE-GROUP
       53   TABLE-1. . . . . . . . . . . .  M587 596 606
       69   TEST-COMPUTED. . . . . . . . .  299
       84   TEST-CORRECT . . . . . . . . .  301
      137   TEST-ID. . . . . . . . . . . .  M202
       57   TEST-RESULTS . . . . . . . . .  M203 221
       39   TEST-1-DATA. . . . . . . . . .  M320 329 339 348 358 367 377
       40   TEST-2-DATA. . . . . . . . . .  M386 395 405 414 424 433 443
       42   TEST-3-DATA. . . . . . . . . .  M452 461 471 480 490 500 511
       55   TEST-3-DATA. . . . . . . . . .  M615 624 634
       41   TEST-3-DATA-GRP. . . . . . . .  452 461 471 480 490 500 511
       43   TEST-4-DATA. . . . . . . . . .  M520 529 539 548 558 567 577
       51   TEST-5-TABLE . . . . . . . . .  615 624 634
      115   TOTAL-ERROR
       50   WS-10
       45   WS-2 . . . . . . . . . . . . .  414 424 548 558
       46   WS-3 . . . . . . . . . . . . .  348 358 395 405 480 490 548 558
       47   WS-5
       48   WS-6
       49   WS-7
      186   XXCOMPUTED . . . . . . . . . .  M308
      188   XXCORRECT. . . . . . . . . . .  M308
      181   XXINFO . . . . . . . . . . . .  295 310
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    17
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

      304   BAIL-OUT . . . . . . . . . . .  P224
      312   BAIL-OUT-EX. . . . . . . . . .  E224 G306
      307   BAIL-OUT-WRITE . . . . . . . .  G305
      287   BLANK-LINE-PRINT
      641   CCVS-EXIT. . . . . . . . . . .  G621
      642   CCVS-999999
      199   CCVS1
      313   CCVS1-EXIT . . . . . . . . . .  G205
      206   CLOSE-FILES. . . . . . . . . .  G643
      234   COLUMN-NAMES-ROUTINE . . . . .  E204
      215   DE-LETE. . . . . . . . . . . .  P324 P335 P354 P373 P390 P401 P420 P439 P456 P467 P486 P507 P524 P535 P554 P573
                                            P591 P602 P619 P630
      238   END-ROUTINE. . . . . . . . . .  P207
      242   END-ROUTINE-1
      252   END-ROUTINE-12
      260   END-ROUTINE-13 . . . . . . . .  E207
      240   END-RTN-EXIT
      214   FAIL . . . . . . . . . . . . .  P341 P360 P380 P407 P426 P446 P473 P493 P514 P541 P560 P580 P608 P637
      289   FAIL-ROUTINE . . . . . . . . .  P223
      303   FAIL-ROUTINE-EX. . . . . . . .  E223 G297
      298   FAIL-ROUTINE-WRITE . . . . . .  G291 G292
      229   HEAD-ROUTINE . . . . . . . . .  P204
      212   INSPT
      200   OPEN-FILES
      213   PASS . . . . . . . . . . . . .  P330 P349 P368 P396 P415 P434 P462 P481 P502 P530 P549 P568 P597 P625
      217   PRINT-DETAIL . . . . . . . . .  P325 P343 P362 P382 P391 P409 P428 P448 P457 P475 P495 P516 P525 P543 P562 P582
                                            P592 P610 P620 P639
      323   REF-DELETE-GF-1
      334   REF-DELETE-GF-1-1
      353   REF-DELETE-GF-1-2
      372   REF-DELETE-GF-1-3
      389   REF-DELETE-GF-2
      400   REF-DELETE-GF-2-1
      419   REF-DELETE-GF-2-2
      438   REF-DELETE-GF-2-3
      455   REF-DELETE-GF-3
      466   REF-DELETE-GF-3-1
      485   REF-DELETE-GF-3-2
      506   REF-DELETE-GF-3-3
      523   REF-DELETE-GF-4
      534   REF-DELETE-GF-4-1
      553   REF-DELETE-GF-4-2
      572   REF-DELETE-GF-4-3
      590   REF-DELETE-GF-5
      601   REF-DELETE-GF-5-1
      618   REF-DELETE-GF-6
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    18
0 Defined   Cross-reference of procedures   References

0     629   REF-DELETE-GF-6-1
      337   REF-FAIL-GF-1-1. . . . . . . .  G333
      356   REF-FAIL-GF-1-2. . . . . . . .  G352
      375   REF-FAIL-GF-1-3. . . . . . . .  G371
      403   REF-FAIL-GF-2-1. . . . . . . .  G399
      422   REF-FAIL-GF-2-2. . . . . . . .  G418
      441   REF-FAIL-GF-2-3. . . . . . . .  G437
      469   REF-FAIL-GF-3-1. . . . . . . .  G465
      488   REF-FAIL-GF-3-2. . . . . . . .  G484
      509   REF-FAIL-GF-3-3. . . . . . . .  G505
      537   REF-FAIL-GF-4-1. . . . . . . .  G533
      556   REF-FAIL-GF-4-2. . . . . . . .  G552
      575   REF-FAIL-GF-4-3. . . . . . . .  G571
      604   REF-FAIL-GF-5-1. . . . . . . .  G600
      632   REF-FAIL-GF-6-1. . . . . . . .  G628
      317   REF-INIT-GF-1
      384   REF-INIT-GF-2. . . . . . . . .  G326
      450   REF-INIT-GF-3. . . . . . . . .  G392 G458
      518   REF-INIT-GF-4
      584   REF-INIT-GF-5. . . . . . . . .  G526
      612   REF-INIT-GF-6. . . . . . . . .  G593
      327   REF-TEST-GF-1-1. . . . . . . .  G322
      345   REF-TEST-GF-1-2
      364   REF-TEST-GF-1-3
      393   REF-TEST-GF-2-1. . . . . . . .  G388
      411   REF-TEST-GF-2-2
      430   REF-TEST-GF-2-3
      459   REF-TEST-GF-3-1. . . . . . . .  G454
      477   REF-TEST-GF-3-2
      497   REF-TEST-GF-3-3
      527   REF-TEST-GF-4-1. . . . . . . .  G522
      545   REF-TEST-GF-4-2
      564   REF-TEST-GF-4-3
      594   REF-TEST-GF-5-1. . . . . . . .  G589
      622   REF-TEST-GF-6-1. . . . . . . .  G617
      342   REF-WRITE-GF-1-1 . . . . . . .  G331 G336
      361   REF-WRITE-GF-1-2 . . . . . . .  G350 G355
      381   REF-WRITE-GF-1-3 . . . . . . .  G369 G374
      408   REF-WRITE-GF-2-1 . . . . . . .  G397 G402
      427   REF-WRITE-GF-2-2 . . . . . . .  G416 G421
      447   REF-WRITE-GF-2-3 . . . . . . .  G435 G440
      474   REF-WRITE-GF-3-1 . . . . . . .  G463 G468
      494   REF-WRITE-GF-3-2 . . . . . . .  G482 G487
      515   REF-WRITE-GF-3-3 . . . . . . .  G503 G508
      542   REF-WRITE-GF-4-1 . . . . . . .  G531 G536
      561   REF-WRITE-GF-4-2 . . . . . . .  G550 G555
      581   REF-WRITE-GF-4-3 . . . . . . .  G569 G574
      609   REF-WRITE-GF-5-1 . . . . . . .  G598 G603
      638   REF-WRITE-GF-6-1 . . . . . . .  G626 G631
      315   SECT-NC224A-001
      210   TERMINATE-CALL
      208   TERMINATE-CCVS
      272   WRITE-LINE . . . . . . . . . .  P221 P222 P230 P231 P232 P233 P235 P236 P237 P239 P241 P251 P259 P265 P270 P271
                                            P295 P299 P301 P310
      284   WRT-LN . . . . . . . . . . . .  P278 P279 P280 P283 P288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    19
0 Defined   Cross-reference of programs     References

        3   NC224A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC224A    Date 06/04/2022  Time 11:57:59   Page    20
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC224A:
 *    Source records = 643
 *    Data Division statements = 78
 *    Procedure Division statements = 347
 *    Generated COBOL statements = 0
 *    Program complexity factor = 355
0End of compilation 1,  program NC224A,  highest severity 0.
0Return code 0
