1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:35   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:35   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1414.2
   000002         000200 PROGRAM-ID.                                                      NC1414.2
   000003         000300     NC141A.                                                      NC1414.2
   000004         000500*                                                              *  NC1414.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1414.2
   000006         000700*                                                              *  NC1414.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1414.2
   000008         000900*                                                              *  NC1414.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1414.2
   000010         001100*                                                              *  NC1414.2
   000011         001300*                                                              *  NC1414.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1414.2
   000013         001500*                                                              *  NC1414.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1414.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1414.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1414.2
   000017         001900*                                                              *  NC1414.2
   000018         002100*                                                                 NC1414.2
   000019         002200*    PROGRAM NC141A TESTS FORMAT 1 AND 2 OF THE "SET"             NC1414.2
   000020         002300*    STATEMENT USING IDENTIFIERS INDEXED BY RELATIVE INDEXES      NC1414.2
   000021         002400*    AND NUMERIC LITERALS.                                        NC1414.2
   000022         002500*                                                                 NC1414.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1414.2
   000024         002700 CONFIGURATION SECTION.                                           NC1414.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1414.2
   000026         002900     XXXXX082.                                                    NC1414.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1414.2
   000028         003100     XXXXX083.                                                    NC1414.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1414.2
   000030         003300 FILE-CONTROL.                                                    NC1414.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1414.2 35
   000032         003500     XXXXX055.                                                    NC1414.2
   000033         003600 DATA DIVISION.                                                   NC1414.2
   000034         003700 FILE SECTION.                                                    NC1414.2
   000035         003800 FD  PRINT-FILE.                                                  NC1414.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1414.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1414.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1414.2
   000039         004200 01  TABLE1.                                                      NC1414.2
   000040         004300     02  TABLE1-REC              PICTURE 99                       NC1414.2
   000041         004400                                 OCCURS 100 TIMES                 NC1414.2
   000042         004500                                 INDEXED BY INDEX1.               NC1414.2
   000043         004600 01  TABLE2.                                                      NC1414.2
   000044         004700     02  TABLE2-REC              PICTURE 99                       NC1414.2
   000045         004800                                 OCCURS 12 TIMES                  NC1414.2
   000046         004900                                 INDEXED BY INDEX2.               NC1414.2
   000047         005000 01  INDEX-ID                    PIC 999         VALUE ZERO.      NC1414.2 IMP
   000048         005100 01  TEST-RESULTS.                                                NC1414.2
   000049         005200     02 FILLER                   PIC X      VALUE SPACE.          NC1414.2 IMP
   000050         005300     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1414.2 IMP
   000051         005400     02 FILLER                   PIC X      VALUE SPACE.          NC1414.2 IMP
   000052         005500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1414.2 IMP
   000053         005600     02 FILLER                   PIC X      VALUE SPACE.          NC1414.2 IMP
   000054         005700     02  PAR-NAME.                                                NC1414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1414.2 IMP
   000056         005900       03  PARDOT-X              PIC X      VALUE SPACE.          NC1414.2 IMP
   000057         006000       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1414.2 IMP
   000058         006100     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1414.2 IMP
   000059         006200     02 RE-MARK                  PIC X(61).                       NC1414.2
   000060         006300 01  TEST-COMPUTED.                                               NC1414.2
   000061         006400     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1414.2 IMP
   000062         006500     02 FILLER                   PIC X(17)  VALUE                 NC1414.2
   000063         006600            "       COMPUTED=".                                   NC1414.2
   000064         006700     02 COMPUTED-X.                                               NC1414.2
   000065         006800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1414.2 IMP
   000066         006900     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1414.2 65
   000067         007000                                 PIC -9(9).9(9).                  NC1414.2
   000068         007100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1414.2 65
   000069         007200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1414.2 65
   000070         007300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1414.2 65
   000071         007400     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1414.2 65
   000072         007500         04 COMPUTED-18V0                    PIC -9(18).          NC1414.2
   000073         007600         04 FILLER                           PIC X.               NC1414.2
   000074         007700     03 FILLER PIC X(50) VALUE SPACE.                             NC1414.2 IMP
   000075         007800 01  TEST-CORRECT.                                                NC1414.2
   000076         007900     02 FILLER PIC X(30) VALUE SPACE.                             NC1414.2 IMP
   000077         008000     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1414.2
   000078         008100     02 CORRECT-X.                                                NC1414.2
   000079         008200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1414.2 IMP
   000080         008300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1414.2 79
   000081         008400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1414.2 79
   000082         008500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1414.2 79
   000083         008600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1414.2 79
   000084         008700     03      CR-18V0 REDEFINES CORRECT-A.                         NC1414.2 79
   000085         008800         04 CORRECT-18V0                     PIC -9(18).          NC1414.2
   000086         008900         04 FILLER                           PIC X.               NC1414.2
   000087         009000     03 FILLER PIC X(2) VALUE SPACE.                              NC1414.2 IMP
   000088         009100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1414.2 IMP
   000089         009200 01  CCVS-C-1.                                                    NC1414.2
   000090         009300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1414.2
   000091         009400-    "SS  PARAGRAPH-NAME                                          NC1414.2
   000092         009500-    "       REMARKS".                                            NC1414.2
   000093         009600     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1414.2 IMP
   000094         009700 01  CCVS-C-2.                                                    NC1414.2
   000095         009800     02 FILLER                     PIC X        VALUE SPACE.      NC1414.2 IMP
   000096         009900     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1414.2
   000097         010000     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1414.2 IMP
   000098         010100     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1414.2
   000099         010200     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1414.2 IMP
   000100         010300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1414.2 IMP
   000101         010400 01  REC-CT                        PIC 99       VALUE ZERO.       NC1414.2 IMP
   000102         010500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1414.2 IMP
   000103         010600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1414.2 IMP
   000104         010700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1414.2 IMP
   000105         010800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1414.2 IMP
   000106         010900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1414.2 IMP
   000107         011000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1414.2 IMP
   000108         011100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1414.2 IMP
   000109         011200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1414.2 IMP
   000110         011300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1414.2 IMP
   000111         011400 01  CCVS-H-1.                                                    NC1414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1414.2 IMP
   000113         011600     02  FILLER                    PIC X(42)    VALUE             NC1414.2
   000114         011700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1414.2
   000115         011800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1414.2 IMP
   000116         011900 01  CCVS-H-2A.                                                   NC1414.2
   000117         012000   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1414.2 IMP
   000118         012100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1414.2
   000119         012200   02  FILLER                        PIC XXXX   VALUE             NC1414.2
   000120         012300     "4.2 ".                                                      NC1414.2
   000121         012400   02  FILLER                        PIC X(28)  VALUE             NC1414.2
   000122         012500            " COPY - NOT FOR DISTRIBUTION".                       NC1414.2
   000123         012600   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1414.2 IMP
   000124         012700                                                                  NC1414.2
   000125         012800 01  CCVS-H-2B.                                                   NC1414.2
   000126         012900   02  FILLER                        PIC X(15)  VALUE             NC1414.2
   000127         013000            "TEST RESULT OF ".                                    NC1414.2
   000128         013100   02  TEST-ID                       PIC X(9).                    NC1414.2
   000129         013200   02  FILLER                        PIC X(4)   VALUE             NC1414.2
   000130         013300            " IN ".                                               NC1414.2
   000131         013400   02  FILLER                        PIC X(12)  VALUE             NC1414.2
   000132         013500     " HIGH       ".                                              NC1414.2
   000133         013600   02  FILLER                        PIC X(22)  VALUE             NC1414.2
   000134         013700            " LEVEL VALIDATION FOR ".                             NC1414.2
   000135         013800   02  FILLER                        PIC X(58)  VALUE             NC1414.2
   000136         013900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1414.2
   000137         014000 01  CCVS-H-3.                                                    NC1414.2
   000138         014100     02  FILLER                      PIC X(34)  VALUE             NC1414.2
   000139         014200            " FOR OFFICIAL USE ONLY    ".                         NC1414.2
   000140         014300     02  FILLER                      PIC X(58)  VALUE             NC1414.2
   000141         014400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1414.2
   000142         014500     02  FILLER                      PIC X(28)  VALUE             NC1414.2
   000143         014600            "  COPYRIGHT   1985 ".                                NC1414.2
   000144         014700 01  CCVS-E-1.                                                    NC1414.2
   000145         014800     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1414.2 IMP
   000146         014900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1414.2
   000147         015000     02 ID-AGAIN                     PIC X(9).                    NC1414.2
   000148         015100     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1414.2 IMP
   000149         015200 01  CCVS-E-2.                                                    NC1414.2
   000150         015300     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1414.2 IMP
   000151         015400     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1414.2 IMP
   000152         015500     02 CCVS-E-2-2.                                               NC1414.2
   000153         015600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1414.2 IMP
   000154         015700         03 FILLER                   PIC X      VALUE SPACE.      NC1414.2 IMP
   000155         015800         03 ENDER-DESC               PIC X(44)  VALUE             NC1414.2
   000156         015900            "ERRORS ENCOUNTERED".                                 NC1414.2
   000157         016000 01  CCVS-E-3.                                                    NC1414.2
   000158         016100     02  FILLER                      PIC X(22)  VALUE             NC1414.2
   000159         016200            " FOR OFFICIAL USE ONLY".                             NC1414.2
   000160         016300     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1414.2 IMP
   000161         016400     02  FILLER                      PIC X(58)  VALUE             NC1414.2
   000162         016500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1414.2
   000163         016600     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1414.2 IMP
   000164         016700     02 FILLER                       PIC X(15)  VALUE             NC1414.2
   000165         016800             " COPYRIGHT 1985".                                   NC1414.2
   000166         016900 01  CCVS-E-4.                                                    NC1414.2
   000167         017000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1414.2 IMP
   000168         017100     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1414.2 IMP
   000170         017300     02 FILLER                       PIC X(40)  VALUE             NC1414.2
   000171         017400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1414.2
   000172         017500 01  XXINFO.                                                      NC1414.2
   000173         017600     02 FILLER                       PIC X(19)  VALUE             NC1414.2
   000174         017700            "*** INFORMATION ***".                                NC1414.2
   000175         017800     02 INFO-TEXT.                                                NC1414.2
   000176         017900       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1414.2 IMP
   000177         018000       04 XXCOMPUTED                 PIC X(20).                   NC1414.2
   000178         018100       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1414.2 IMP
   000179         018200       04 XXCORRECT                  PIC X(20).                   NC1414.2
   000180         018300     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1414.2
   000181         018400 01  HYPHEN-LINE.                                                 NC1414.2
   000182         018500     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1414.2 IMP
   000183         018600     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1414.2
   000184         018700-    "*****************************************".                 NC1414.2
   000185         018800     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1414.2
   000186         018900-    "******************************".                            NC1414.2
   000187         019000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1414.2
   000188         019100     "NC141A".                                                    NC1414.2
   000189         019200 PROCEDURE DIVISION.                                              NC1414.2
   000190         019300 CCVS1 SECTION.                                                   NC1414.2
   000191         019400 OPEN-FILES.                                                      NC1414.2
   000192         019500     OPEN     OUTPUT PRINT-FILE.                                  NC1414.2 35
   000193         019600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1414.2 187 128 187 147
   000194         019700     MOVE    SPACE TO TEST-RESULTS.                               NC1414.2 IMP 48
   000195         019800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1414.2 220 225
   000196         019900     GO TO CCVS1-EXIT.                                            NC1414.2 307
   000197         020000 CLOSE-FILES.                                                     NC1414.2
   000198         020100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1414.2 229 250 35
   000199         020200 TERMINATE-CCVS.                                                  NC1414.2
   000200         020300     EXIT PROGRAM.                                                NC1414.2
   000201         020400 TERMINATE-CALL.                                                  NC1414.2
   000202         020500     STOP     RUN.                                                NC1414.2
   000203         020600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1414.2 52 104
   000204         020700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1414.2 52 105
   000205         020800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1414.2 52 103
   000206         020900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1414.2 52 102
   000207         021000     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1414.2 59
   000208         021100 PRINT-DETAIL.                                                    NC1414.2
   000209         021200     IF REC-CT NOT EQUAL TO ZERO                                  NC1414.2 101 IMP
   000210      1  021300             MOVE "." TO PARDOT-X                                 NC1414.2 56
   000211      1  021400             MOVE REC-CT TO DOTVALUE.                             NC1414.2 101 57
   000212         021500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1414.2 48 36 262
   000213         021600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1414.2 52 262
   000214      1  021700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1414.2 283 297
   000215      1  021800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1414.2 298 306
   000216         021900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1414.2 IMP 52 IMP 64
   000217         022000     MOVE SPACE TO CORRECT-X.                                     NC1414.2 IMP 78
   000218         022100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1414.2 101 IMP IMP 54
   000219         022200     MOVE     SPACE TO RE-MARK.                                   NC1414.2 IMP 59
   000220         022300 HEAD-ROUTINE.                                                    NC1414.2
   000221         022400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1414.2 111 37 262
   000222         022500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1414.2 116 37 262
   000223         022600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1414.2 125 37 262
   000224         022700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1414.2 137 37 262
   000225         022800 COLUMN-NAMES-ROUTINE.                                            NC1414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1414.2 89 37 262
   000227         023000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1414.2 94 37 262
   000228         023100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1414.2 181 37 262
   000229         023200 END-ROUTINE.                                                     NC1414.2
   000230         023300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1414.2 181 37 262
   000231         023400 END-RTN-EXIT.                                                    NC1414.2
   000232         023500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1414.2 144 37 262
   000233         023600 END-ROUTINE-1.                                                   NC1414.2
   000234         023700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1414.2 103 107 104
   000235         023800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1414.2 107 102 107
   000236         023900      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1414.2 105 107
   000237         024000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1414.2
   000238         024100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1414.2 105 167
   000239         024200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1414.2 107 169
   000240         024300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1414.2 166 152
   000241         024400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1414.2 149 37 262
   000242         024500  END-ROUTINE-12.                                                 NC1414.2
   000243         024600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1414.2 155
   000244         024700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1414.2 103 IMP
   000245      1  024800         MOVE "NO " TO ERROR-TOTAL                                NC1414.2 153
   000246         024900         ELSE                                                     NC1414.2
   000247      1  025000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1414.2 103 153
   000248         025100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1414.2 149 37
   000249         025200     PERFORM WRITE-LINE.                                          NC1414.2 262
   000250         025300 END-ROUTINE-13.                                                  NC1414.2
   000251         025400     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1414.2 102 IMP
   000252      1  025500         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1414.2 153
   000253      1  025600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1414.2 102 153
   000254         025700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1414.2 155
   000255         025800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1414.2 149 37 262
   000256         025900      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1414.2 104 IMP
   000257      1  026000          MOVE "NO " TO ERROR-TOTAL                               NC1414.2 153
   000258      1  026100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1414.2 104 153
   000259         026200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1414.2 155
   000260         026300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1414.2 149 37 262
   000261         026400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1414.2 157 37 262
   000262         026500 WRITE-LINE.                                                      NC1414.2
   000263         026600     ADD 1 TO RECORD-COUNT.                                       NC1414.2 109
   000264         026700     IF RECORD-COUNT GREATER 42                                   NC1414.2 109
   000265      1  026800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1414.2 37 108
   000266      1  026900         MOVE SPACE TO DUMMY-RECORD                               NC1414.2 IMP 37
   000267      1  027000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1414.2 37
   000268      1  027100         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1414.2 111 37 278
   000269      1  027200         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1414.2 116 37 278
   000270      1  027300         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1414.2 125 37 278
   000271      1  027400         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1414.2 137 37 278
   000272      1  027500         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1414.2 89 37 278
   000273      1  027600         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1414.2 94 37 278
   000274      1  027700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1414.2 181 37 278
   000275      1  027800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1414.2 108 37
   000276      1  027900         MOVE ZERO TO RECORD-COUNT.                               NC1414.2 IMP 109
   000277         028000     PERFORM WRT-LN.                                              NC1414.2 278
   000278         028100 WRT-LN.                                                          NC1414.2
   000279         028200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1414.2 37
   000280         028300     MOVE SPACE TO DUMMY-RECORD.                                  NC1414.2 IMP 37
   000281         028400 BLANK-LINE-PRINT.                                                NC1414.2
   000282         028500     PERFORM WRT-LN.                                              NC1414.2 278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600 FAIL-ROUTINE.                                                    NC1414.2
   000284         028700     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1414.2 64 IMP
   000285      1  028800            GO TO FAIL-ROUTINE-WRITE.                             NC1414.2 292
   000286         028900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1414.2 78 IMP 292
   000287         029000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1414.2 110 180
   000288         029100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1414.2 175
   000289         029200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1414.2 172 37 262
   000290         029300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1414.2 IMP 180
   000291         029400     GO TO  FAIL-ROUTINE-EX.                                      NC1414.2 297
   000292         029500 FAIL-ROUTINE-WRITE.                                              NC1414.2
   000293         029600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1414.2 60 36 262
   000294         029700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1414.2 110 88
   000295         029800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1414.2 75 36 262
   000296         029900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1414.2 IMP 88
   000297         030000 FAIL-ROUTINE-EX. EXIT.                                           NC1414.2
   000298         030100 BAIL-OUT.                                                        NC1414.2
   000299         030200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1414.2 65 IMP 301
   000300         030300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1414.2 79 IMP 306
   000301         030400 BAIL-OUT-WRITE.                                                  NC1414.2
   000302         030500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1414.2 79 179 65 177
   000303         030600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1414.2 110 180
   000304         030700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1414.2 172 37 262
   000305         030800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1414.2 IMP 180
   000306         030900 BAIL-OUT-EX. EXIT.                                               NC1414.2
   000307         031000 CCVS1-EXIT.                                                      NC1414.2
   000308         031100     EXIT.                                                        NC1414.2
   000309         031200 SECT-NC141A-001 SECTION.                                         NC1414.2
   000310         031300 INIT-PARA.                                                       NC1414.2
   000311         031400     MOVE "VI-127 6.22.4" TO ANSI-REFERENCE.                      NC1414.2 110
   000312         031500 BUILD-TABLE2.                                                    NC1414.2
   000313         031600     MOVE 21 TO TABLE2-REC (1).                                   NC1414.2 44
   000314         031700     MOVE 02 TO TABLE2-REC (2).                                   NC1414.2 44
   000315         031800     MOVE 03 TO TABLE2-REC (3).                                   NC1414.2 44
   000316         031900     MOVE 11 TO TABLE2-REC (4).                                   NC1414.2 44
   000317         032000     MOVE 05 TO TABLE2-REC (5).                                   NC1414.2 44
   000318         032100     MOVE 10 TO TABLE2-REC (6).                                   NC1414.2 44
   000319         032200     MOVE 26 TO TABLE2-REC (7).                                   NC1414.2 44
   000320         032300     MOVE 02 TO TABLE2-REC (8).                                   NC1414.2 44
   000321         032400     MOVE 16 TO TABLE2-REC (9).                                   NC1414.2 44
   000322         032500     MOVE 62 TO TABLE2-REC (10).                                  NC1414.2 44
   000323         032600     MOVE 10 TO TABLE2-REC (11).                                  NC1414.2 44
   000324         032700     MOVE 04 TO TABLE2-REC (12).                                  NC1414.2 44
   000325         032800 SET-TEST-1.                                                      NC1414.2
   000326         032900     MOVE "SET ... TO" TO FEATURE.                                NC1414.2 50
   000327         033000     SET INDEX1 TO 1.                                             NC1414.2 42
   000328         033100     SET INDEX2 TO 7.                                             NC1414.2 46
   000329         033200     SET INDEX1 TO TABLE2-REC (INDEX2).                           NC1414.2 42 44 46
   000330         033300     IF INDEX1 EQUAL TO 26                                        NC1414.2 42
   000331      1  033400        PERFORM PASS                                              NC1414.2 204
   000332      1  033500        ELSE GO TO SET-FAIL-1.                                    NC1414.2 337
   000333         033600     GO TO SET-WRITE-1.                                           NC1414.2 342
   000334         033700 SET-DELETE-1.                                                    NC1414.2
   000335         033800     PERFORM DE-LETE.                                             NC1414.2 206
   000336         033900     GO TO SET-WRITE-1.                                           NC1414.2 342
   000337         034000 SET-FAIL-1.                                                      NC1414.2
   000338         034100     PERFORM FAIL.                                                NC1414.2 205
   000339         034200     SET INDEX-ID TO INDEX1.                                      NC1414.2 47 42
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE INDEX-ID TO COMPUTED-18V0.                              NC1414.2 47 72
   000341         034400     MOVE 26 TO CORRECT-18V0.                                     NC1414.2 85
   000342         034500 SET-WRITE-1.                                                     NC1414.2
   000343         034600     MOVE "SET-TEST-1" TO PAR-NAME.                               NC1414.2 54
   000344         034700     PERFORM PRINT-DETAIL.                                        NC1414.2 208
   000345         034800 SET-TEST-2.                                                      NC1414.2
   000346         034900     MOVE "SET ... UP BY" TO FEATURE.                             NC1414.2 50
   000347         035000     SET INDEX1 TO 7.                                             NC1414.2 42
   000348         035100     SET INDEX2 TO 8.                                             NC1414.2 46
   000349         035200     SET INDEX1 UP BY TABLE2-REC (INDEX2).                        NC1414.2 42 44 46
   000350         035300     IF INDEX1 EQUAL TO 9                                         NC1414.2 42
   000351      1  035400        PERFORM PASS                                              NC1414.2 204
   000352      1  035500        ELSE GO TO SET-FAIL-2.                                    NC1414.2 357
   000353         035600     GO TO SET-WRITE-2.                                           NC1414.2 362
   000354         035700 SET-DELETE-2.                                                    NC1414.2
   000355         035800     PERFORM DE-LETE.                                             NC1414.2 206
   000356         035900     GO TO SET-WRITE-2.                                           NC1414.2 362
   000357         036000 SET-FAIL-2.                                                      NC1414.2
   000358         036100     PERFORM FAIL.                                                NC1414.2 205
   000359         036200     SET INDEX-ID TO INDEX1.                                      NC1414.2 47 42
   000360         036300     MOVE INDEX-ID TO COMPUTED-18V0.                              NC1414.2 47 72
   000361         036400     MOVE 09 TO CORRECT-18V0.                                     NC1414.2 85
   000362         036500 SET-WRITE-2.                                                     NC1414.2
   000363         036600     MOVE "SET-TEST-2" TO PAR-NAME.                               NC1414.2 54
   000364         036700     PERFORM PRINT-DETAIL.                                        NC1414.2 208
   000365         036800 SET-TEST-3.                                                      NC1414.2
   000366         036900     MOVE "SET ... DOWN BY" TO FEATURE.                           NC1414.2 50
   000367         037000     SET INDEX1 TO 56.                                            NC1414.2 42
   000368         037100     SET INDEX2 TO 9.                                             NC1414.2 46
   000369         037200     SET INDEX1 DOWN BY TABLE2-REC (INDEX2).                      NC1414.2 42 44 46
   000370         037300     IF INDEX1 EQUAL TO 40                                        NC1414.2 42
   000371      1  037400        PERFORM PASS                                              NC1414.2 204
   000372      1  037500        ELSE GO TO SET-FAIL-3.                                    NC1414.2 377
   000373         037600     GO TO SET-WRITE-3.                                           NC1414.2 382
   000374         037700 SET-DELETE-3.                                                    NC1414.2
   000375         037800     PERFORM DE-LETE.                                             NC1414.2 206
   000376         037900     GO TO SET-WRITE-3.                                           NC1414.2 382
   000377         038000 SET-FAIL-3.                                                      NC1414.2
   000378         038100     PERFORM FAIL.                                                NC1414.2 205
   000379         038200     SET INDEX-ID TO INDEX1.                                      NC1414.2 47 42
   000380         038300     MOVE INDEX-ID TO COMPUTED-18V0.                              NC1414.2 47 72
   000381         038400     MOVE 40 TO CORRECT-18V0.                                     NC1414.2 85
   000382         038500 SET-WRITE-3.                                                     NC1414.2
   000383         038600     MOVE "SET-TEST-3" TO PAR-NAME.                               NC1414.2 54
   000384         038700     PERFORM PRINT-DETAIL.                                        NC1414.2 208
   000385         038800 SET-TEST-4.                                                      NC1414.2
   000386         038900     MOVE "SET ... TO" TO FEATURE.                                NC1414.2 50
   000387         039000     SET INDEX1 TO 1.                                             NC1414.2 42
   000388         039100     SET INDEX2 TO 9.                                             NC1414.2 46
   000389         039200     SET INDEX1 TO TABLE2-REC (INDEX2 + 1).                       NC1414.2 42 44 46
   000390         039300     IF INDEX1 EQUAL TO 62                                        NC1414.2 42
   000391      1  039400        PERFORM PASS                                              NC1414.2 204
   000392      1  039500        ELSE GO TO SET-FAIL-4.                                    NC1414.2 397
   000393         039600     GO TO SET-WRITE-4.                                           NC1414.2 402
   000394         039700 SET-DELETE-4.                                                    NC1414.2
   000395         039800     PERFORM DE-LETE.                                             NC1414.2 206
   000396         039900     GO TO SET-WRITE-4.                                           NC1414.2 402
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 SET-FAIL-4.                                                      NC1414.2
   000398         040100     PERFORM FAIL.                                                NC1414.2 205
   000399         040200     SET INDEX-ID TO INDEX1.                                      NC1414.2 47 42
   000400         040300     MOVE INDEX-ID TO COMPUTED-18V0.                              NC1414.2 47 72
   000401         040400     MOVE 62 TO CORRECT-18V0.                                     NC1414.2 85
   000402         040500 SET-WRITE-4.                                                     NC1414.2
   000403         040600     MOVE "SET-TEST-4" TO PAR-NAME.                               NC1414.2 54
   000404         040700     PERFORM PRINT-DETAIL.                                        NC1414.2 208
   000405         040800 SET-TEST-5.                                                      NC1414.2
   000406         040900     MOVE "SET ... UP BY" TO FEATURE.                             NC1414.2 50
   000407         041000     SET INDEX1 TO 10.                                            NC1414.2 42
   000408         041100     SET INDEX2 TO 12.                                            NC1414.2 46
   000409         041200     SET INDEX1 UP BY TABLE2-REC (INDEX2 - 1).                    NC1414.2 42 44 46
   000410         041300     IF INDEX1 EQUAL TO 20                                        NC1414.2 42
   000411      1  041400        PERFORM PASS                                              NC1414.2 204
   000412      1  041500        ELSE GO TO SET-FAIL-5.                                    NC1414.2 417
   000413         041600     GO TO SET-WRITE-5.                                           NC1414.2 422
   000414         041700 SET-DELETE-5.                                                    NC1414.2
   000415         041800     PERFORM DE-LETE.                                             NC1414.2 206
   000416         041900     GO TO SET-WRITE-5.                                           NC1414.2 422
   000417         042000 SET-FAIL-5.                                                      NC1414.2
   000418         042100     PERFORM FAIL.                                                NC1414.2 205
   000419         042200     SET INDEX-ID TO INDEX1.                                      NC1414.2 47 42
   000420         042300     MOVE INDEX-ID TO COMPUTED-18V0.                              NC1414.2 47 72
   000421         042400     MOVE 20 TO CORRECT-18V0.                                     NC1414.2 85
   000422         042500 SET-WRITE-5.                                                     NC1414.2
   000423         042600     MOVE "SET-TEST-5" TO PAR-NAME.                               NC1414.2 54
   000424         042700     PERFORM PRINT-DETAIL.                                        NC1414.2 208
   000425         042800 SET-TEST-6.                                                      NC1414.2
   000426         042900     MOVE "SET ... DOWN BY" TO FEATURE.                           NC1414.2 50
   000427         043000     SET INDEX1 TO 15.                                            NC1414.2 42
   000428         043100     SET INDEX2 TO 8.                                             NC1414.2 46
   000429         043200     SET INDEX1 DOWN BY TABLE2-REC (INDEX2 + 4).                  NC1414.2 42 44 46
   000430         043300     IF INDEX1 EQUAL TO 11                                        NC1414.2 42
   000431      1  043400        PERFORM PASS                                              NC1414.2 204
   000432      1  043500        ELSE GO TO SET-FAIL-6.                                    NC1414.2 437
   000433         043600     GO TO SET-WRITE-6.                                           NC1414.2 442
   000434         043700 SET-DELETE-6.                                                    NC1414.2
   000435         043800     PERFORM DE-LETE.                                             NC1414.2 206
   000436         043900     GO TO SET-WRITE-6.                                           NC1414.2 442
   000437         044000 SET-FAIL-6.                                                      NC1414.2
   000438         044100     PERFORM FAIL.                                                NC1414.2 205
   000439         044200     SET INDEX-ID TO INDEX1.                                      NC1414.2 47 42
   000440         044300     MOVE INDEX-ID TO COMPUTED-18V0.                              NC1414.2 47 72
   000441         044400     MOVE 11 TO CORRECT-18V0.                                     NC1414.2 85
   000442         044500 SET-WRITE-6.                                                     NC1414.2
   000443         044600     MOVE "SET-TEST-6" TO PAR-NAME.                               NC1414.2 54
   000444         044700     PERFORM PRINT-DETAIL.                                        NC1414.2 208
   000445         044800 SET-TEST-7.                                                      NC1414.2
   000446         044900     MOVE "SET ... TO" TO FEATURE.                                NC1414.2 50
   000447         045000     SET INDEX1 TO 1.                                             NC1414.2 42
   000448         045100     SET INDEX1 TO TABLE2-REC (1).                                NC1414.2 42 44
   000449         045200     IF INDEX1 EQUAL TO 21                                        NC1414.2 42
   000450      1  045300        PERFORM PASS                                              NC1414.2 204
   000451      1  045400        ELSE GO TO SET-FAIL-7.                                    NC1414.2 456
   000452         045500     GO TO SET-WRITE-7.                                           NC1414.2 461
   000453         045600 SET-DELETE-7.                                                    NC1414.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     PERFORM DE-LETE.                                             NC1414.2 206
   000455         045800     GO TO SET-WRITE-7.                                           NC1414.2 461
   000456         045900 SET-FAIL-7.                                                      NC1414.2
   000457         046000     PERFORM FAIL.                                                NC1414.2 205
   000458         046100     SET INDEX-ID TO INDEX1.                                      NC1414.2 47 42
   000459         046200     MOVE INDEX-ID TO COMPUTED-18V0.                              NC1414.2 47 72
   000460         046300     MOVE 21 TO CORRECT-18V0.                                     NC1414.2 85
   000461         046400 SET-WRITE-7.                                                     NC1414.2
   000462         046500     MOVE "SET-TEST-7" TO PAR-NAME.                               NC1414.2 54
   000463         046600     PERFORM PRINT-DETAIL.                                        NC1414.2 208
   000464         046700 SET-TEST-8.                                                      NC1414.2
   000465         046800     MOVE "SET ... UP BY" TO FEATURE.                             NC1414.2 50
   000466         046900     SET INDEX1 TO 21.                                            NC1414.2 42
   000467         047000     SET INDEX1 UP BY TABLE2-REC (2).                             NC1414.2 42 44
   000468         047100     IF INDEX1 EQUAL TO 23                                        NC1414.2 42
   000469      1  047200        PERFORM PASS                                              NC1414.2 204
   000470      1  047300        ELSE GO TO SET-FAIL-8.                                    NC1414.2 475
   000471         047400     GO TO SET-WRITE-8.                                           NC1414.2 480
   000472         047500 SET-DELETE-8.                                                    NC1414.2
   000473         047600     PERFORM DE-LETE.                                             NC1414.2 206
   000474         047700     GO TO SET-WRITE-8.                                           NC1414.2 480
   000475         047800 SET-FAIL-8.                                                      NC1414.2
   000476         047900     PERFORM FAIL.                                                NC1414.2 205
   000477         048000     SET INDEX-ID TO INDEX1.                                      NC1414.2 47 42
   000478         048100     MOVE INDEX-ID TO COMPUTED-18V0.                              NC1414.2 47 72
   000479         048200     MOVE 23 TO CORRECT-18V0.                                     NC1414.2 85
   000480         048300 SET-WRITE-8.                                                     NC1414.2
   000481         048400     MOVE "SET-TEST-8" TO PAR-NAME.                               NC1414.2 54
   000482         048500     PERFORM PRINT-DETAIL.                                        NC1414.2 208
   000483         048600 SET-TEST-9.                                                      NC1414.2
   000484         048700     MOVE "SET ... DOWN BY" TO FEATURE.                           NC1414.2 50
   000485         048800     SET INDEX1 TO 23.                                            NC1414.2 42
   000486         048900     SET INDEX1 DOWN BY TABLE2-REC (3).                           NC1414.2 42 44
   000487         049000     IF INDEX1 EQUAL TO 20                                        NC1414.2 42
   000488      1  049100        PERFORM PASS                                              NC1414.2 204
   000489      1  049200        ELSE GO TO SET-FAIL-9.                                    NC1414.2 494
   000490         049300     GO TO SET-WRITE-9.                                           NC1414.2 499
   000491         049400 SET-DELETE-9.                                                    NC1414.2
   000492         049500     PERFORM DE-LETE.                                             NC1414.2 206
   000493         049600     GO TO SET-WRITE-9.                                           NC1414.2 499
   000494         049700 SET-FAIL-9.                                                      NC1414.2
   000495         049800     PERFORM FAIL.                                                NC1414.2 205
   000496         049900     SET INDEX-ID TO INDEX1.                                      NC1414.2 47 42
   000497         050000     MOVE INDEX-ID TO COMPUTED-18V0.                              NC1414.2 47 72
   000498         050100     MOVE 20 TO CORRECT-18V0.                                     NC1414.2 85
   000499         050200 SET-WRITE-9.                                                     NC1414.2
   000500         050300     MOVE "SET-TEST-9" TO PAR-NAME.                               NC1414.2 54
   000501         050400     PERFORM PRINT-DETAIL.                                        NC1414.2 208
   000502         050500 CCVS-EXIT SECTION.                                               NC1414.2
   000503         050600 CCVS-999999.                                                     NC1414.2
   000504         050700     GO TO CLOSE-FILES.                                           NC1414.2 197
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      110   ANSI-REFERENCE . . . . . . . .  287 294 303 M311
       89   CCVS-C-1 . . . . . . . . . . .  226 272
       94   CCVS-C-2 . . . . . . . . . . .  227 273
      144   CCVS-E-1 . . . . . . . . . . .  232
      149   CCVS-E-2 . . . . . . . . . . .  241 248 255 260
      152   CCVS-E-2-2 . . . . . . . . . .  M240
      157   CCVS-E-3 . . . . . . . . . . .  261
      166   CCVS-E-4 . . . . . . . . . . .  240
      167   CCVS-E-4-1 . . . . . . . . . .  M238
      169   CCVS-E-4-2 . . . . . . . . . .  M239
      111   CCVS-H-1 . . . . . . . . . . .  221 268
      116   CCVS-H-2A. . . . . . . . . . .  222 269
      125   CCVS-H-2B. . . . . . . . . . .  223 270
      137   CCVS-H-3 . . . . . . . . . . .  224 271
      187   CCVS-PGM-ID. . . . . . . . . .  193 193
       71   CM-18V0
       65   COMPUTED-A . . . . . . . . . .  66 68 69 70 71 299 302
       66   COMPUTED-N
       64   COMPUTED-X . . . . . . . . . .  M216 284
       68   COMPUTED-0V18
       70   COMPUTED-14V4
       72   COMPUTED-18V0. . . . . . . . .  M340 M360 M380 M400 M420 M440 M459 M478 M497
       69   COMPUTED-4V14
       88   COR-ANSI-REFERENCE . . . . . .  M294 M296
       79   CORRECT-A. . . . . . . . . . .  80 81 82 83 84 300 302
       80   CORRECT-N
       78   CORRECT-X. . . . . . . . . . .  M217 286
       81   CORRECT-0V18
       83   CORRECT-14V4
       85   CORRECT-18V0 . . . . . . . . .  M341 M361 M381 M401 M421 M441 M460 M479 M498
       82   CORRECT-4V14
       84   CR-18V0
      102   DELETE-COUNTER . . . . . . . .  M206 235 251 253
       57   DOTVALUE . . . . . . . . . . .  M211
      108   DUMMY-HOLD . . . . . . . . . .  M265 275
       37   DUMMY-RECORD . . . . . . . . .  M221 M222 M223 M224 M226 M227 M228 M230 M232 M241 M248 M255 M260 M261 265 M266
                                            267 M268 M269 M270 M271 M272 M273 M274 M275 279 M280 M289 M304
      155   ENDER-DESC . . . . . . . . . .  M243 M254 M259
      103   ERROR-COUNTER. . . . . . . . .  M205 234 244 247
      107   ERROR-HOLD . . . . . . . . . .  M234 M235 M235 M236 239
      153   ERROR-TOTAL. . . . . . . . . .  M245 M247 M252 M253 M257 M258
       50   FEATURE. . . . . . . . . . . .  M326 M346 M366 M386 M406 M426 M446 M465 M484
      181   HYPHEN-LINE. . . . . . . . . .  228 230 274
      147   ID-AGAIN . . . . . . . . . . .  M193
       47   INDEX-ID . . . . . . . . . . .  M339 340 M359 360 M379 380 M399 400 M419 420 M439 440 M458 459 M477 478 M496
                                            497
       42   INDEX1 . . . . . . . . . . . .  M327 M329 330 339 M347 M349 350 359 M367 M369 370 379 M387 M389 390 399 M407
                                            M409 410 419 M427 M429 430 439 M447 M448 449 458 M466 M467 468 477 M485 M486
                                            487 496
       46   INDEX2 . . . . . . . . . . . .  M328 329 M348 349 M368 369 M388 389 M408 409 M428 429
      180   INF-ANSI-REFERENCE . . . . . .  M287 M290 M303 M305
      175   INFO-TEXT. . . . . . . . . . .  M288
      104   INSPECT-COUNTER. . . . . . . .  M203 234 256 258
       52   P-OR-F . . . . . . . . . . . .  M203 M204 M205 M206 213 M216
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page    13
0 Defined   Cross-reference of data names   References

0      54   PAR-NAME . . . . . . . . . . .  M218 M343 M363 M383 M403 M423 M443 M462 M481 M500
       56   PARDOT-X . . . . . . . . . . .  M210
      105   PASS-COUNTER . . . . . . . . .  M204 236 238
       35   PRINT-FILE . . . . . . . . . .  31 192 198
       36   PRINT-REC. . . . . . . . . . .  M212 M293 M295
       59   RE-MARK. . . . . . . . . . . .  M207 M219
      101   REC-CT . . . . . . . . . . . .  209 211 218
      100   REC-SKL-SUB
      109   RECORD-COUNT . . . . . . . . .  M263 264 M276
       39   TABLE1
       40   TABLE1-REC
       43   TABLE2
       44   TABLE2-REC . . . . . . . . . .  M313 M314 M315 M316 M317 M318 M319 M320 M321 M322 M323 M324 329 349 369 389 409
                                            429 448 467 486
       60   TEST-COMPUTED. . . . . . . . .  293
       75   TEST-CORRECT . . . . . . . . .  295
      128   TEST-ID. . . . . . . . . . . .  M193
       48   TEST-RESULTS . . . . . . . . .  M194 212
      106   TOTAL-ERROR
      177   XXCOMPUTED . . . . . . . . . .  M302
      179   XXCORRECT. . . . . . . . . . .  M302
      172   XXINFO . . . . . . . . . . . .  289 304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page    14
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

      298   BAIL-OUT . . . . . . . . . . .  P215
      306   BAIL-OUT-EX. . . . . . . . . .  E215 G300
      301   BAIL-OUT-WRITE . . . . . . . .  G299
      281   BLANK-LINE-PRINT
      312   BUILD-TABLE2
      502   CCVS-EXIT
      503   CCVS-999999
      190   CCVS1
      307   CCVS1-EXIT . . . . . . . . . .  G196
      197   CLOSE-FILES. . . . . . . . . .  G504
      225   COLUMN-NAMES-ROUTINE . . . . .  E195
      206   DE-LETE. . . . . . . . . . . .  P335 P355 P375 P395 P415 P435 P454 P473 P492
      229   END-ROUTINE. . . . . . . . . .  P198
      233   END-ROUTINE-1
      242   END-ROUTINE-12
      250   END-ROUTINE-13 . . . . . . . .  E198
      231   END-RTN-EXIT
      205   FAIL . . . . . . . . . . . . .  P338 P358 P378 P398 P418 P438 P457 P476 P495
      283   FAIL-ROUTINE . . . . . . . . .  P214
      297   FAIL-ROUTINE-EX. . . . . . . .  E214 G291
      292   FAIL-ROUTINE-WRITE . . . . . .  G285 G286
      220   HEAD-ROUTINE . . . . . . . . .  P195
      310   INIT-PARA
      203   INSPT
      191   OPEN-FILES
      204   PASS . . . . . . . . . . . . .  P331 P351 P371 P391 P411 P431 P450 P469 P488
      208   PRINT-DETAIL . . . . . . . . .  P344 P364 P384 P404 P424 P444 P463 P482 P501
      309   SECT-NC141A-001
      334   SET-DELETE-1
      354   SET-DELETE-2
      374   SET-DELETE-3
      394   SET-DELETE-4
      414   SET-DELETE-5
      434   SET-DELETE-6
      453   SET-DELETE-7
      472   SET-DELETE-8
      491   SET-DELETE-9
      337   SET-FAIL-1 . . . . . . . . . .  G332
      357   SET-FAIL-2 . . . . . . . . . .  G352
      377   SET-FAIL-3 . . . . . . . . . .  G372
      397   SET-FAIL-4 . . . . . . . . . .  G392
      417   SET-FAIL-5 . . . . . . . . . .  G412
      437   SET-FAIL-6 . . . . . . . . . .  G432
      456   SET-FAIL-7 . . . . . . . . . .  G451
      475   SET-FAIL-8 . . . . . . . . . .  G470
      494   SET-FAIL-9 . . . . . . . . . .  G489
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page    15
0 Defined   Cross-reference of procedures   References

0     325   SET-TEST-1
      345   SET-TEST-2
      365   SET-TEST-3
      385   SET-TEST-4
      405   SET-TEST-5
      425   SET-TEST-6
      445   SET-TEST-7
      464   SET-TEST-8
      483   SET-TEST-9
      342   SET-WRITE-1. . . . . . . . . .  G333 G336
      362   SET-WRITE-2. . . . . . . . . .  G353 G356
      382   SET-WRITE-3. . . . . . . . . .  G373 G376
      402   SET-WRITE-4. . . . . . . . . .  G393 G396
      422   SET-WRITE-5. . . . . . . . . .  G413 G416
      442   SET-WRITE-6. . . . . . . . . .  G433 G436
      461   SET-WRITE-7. . . . . . . . . .  G452 G455
      480   SET-WRITE-8. . . . . . . . . .  G471 G474
      499   SET-WRITE-9. . . . . . . . . .  G490 G493
      201   TERMINATE-CALL
      199   TERMINATE-CCVS
      262   WRITE-LINE . . . . . . . . . .  P212 P213 P221 P222 P223 P224 P226 P227 P228 P230 P232 P241 P249 P255 P260 P261
                                            P289 P293 P295 P304
      278   WRT-LN . . . . . . . . . . . .  P268 P269 P270 P271 P272 P273 P274 P277 P282
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page    16
0 Defined   Cross-reference of programs     References

        3   NC141A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC141A    Date 06/04/2022  Time 11:58:35   Page    17
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC141A:
 *    Source records = 504
 *    Data Division statements = 68
 *    Procedure Division statements = 290
 *    Generated COBOL statements = 0
 *    Program complexity factor = 297
0End of compilation 1,  program NC141A,  highest severity 0.
0Return code 0
