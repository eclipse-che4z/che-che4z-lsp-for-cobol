1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:49   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:49   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1114.2
   000002         000200 PROGRAM-ID.                                                      NC1114.2
   000003         000300     NC111A.                                                      NC1114.2
   000004         000500*                                                              *  NC1114.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1114.2
   000006         000700*                                                              *  NC1114.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1114.2
   000008         000900*                                                              *  NC1114.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1114.2
   000010         001100*                                                              *  NC1114.2
   000011         001300*                                                              *  NC1114.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1114.2
   000013         001500*                                                              *  NC1114.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1114.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1114.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1114.2
   000017         001900*                                                              *  NC1114.2
   000018         002100*                                                                 NC1114.2
   000019         002200*   PROGRAM NC111A TESTS THE TRUNCATION OF RESULTANT IDENTIFIERS  NC1114.2
   000020         002300*         USING ADD SUBTRACT AND MULTIPLY STATEMENTS.             NC1114.2
   000021         002400*                                                                 NC1114.2
   000022         002500*                                                                 NC1114.2
   000023         002600                                                                  NC1114.2
   000024         002700 ENVIRONMENT DIVISION.                                            NC1114.2
   000025         002800 CONFIGURATION SECTION.                                           NC1114.2
   000026         002900 SOURCE-COMPUTER.                                                 NC1114.2
   000027         003000     XXXXX082.                                                    NC1114.2
   000028         003100 OBJECT-COMPUTER.                                                 NC1114.2
   000029         003200     XXXXX083.                                                    NC1114.2
   000030         003300 INPUT-OUTPUT SECTION.                                            NC1114.2
   000031         003400 FILE-CONTROL.                                                    NC1114.2
   000032         003500     SELECT PRINT-FILE ASSIGN TO                                  NC1114.2 36
   000033         003600     XXXXX055.                                                    NC1114.2
   000034         003700 DATA DIVISION.                                                   NC1114.2
   000035         003800 FILE SECTION.                                                    NC1114.2
   000036         003900 FD  PRINT-FILE.                                                  NC1114.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000 01  PRINT-REC PICTURE X(120).                                    NC1114.2
   000038         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC1114.2
   000039         004200 WORKING-STORAGE SECTION.                                         NC1114.2
   000040         004300 01  N-11                               PICTURE IS 9 VALUE IS 9.  NC1114.2
   000041         004400 01  N-12                               PICTURE IS 9 VALUE IS 9.  NC1114.2
   000042         004500 01  N-40                               PICTURE IS 9(7)           NC1114.2
   000043         004600     VALUE IS 7777777.                                            NC1114.2
   000044         004700 01  N-41                               PICTURE IS 9(7)           NC1114.2
   000045         004800     VALUE IS 1111111.                                            NC1114.2
   000046         004900 01  N-42                               PICTURE IS 9(3)P(4).      NC1114.2
   000047         005000 01  TRUNC-DATA.                                                  NC1114.2
   000048         005100     02 N-43  PICTURE S9V9 VALUE +1.6.                            NC1114.2
   000049         005200     02 N-44  PICTURE S9V9 VALUE -1.6.                            NC1114.2
   000050         005300     02 N-45  PICTURE S9.                                         NC1114.2
   000051         005400 01  TEST-RESULTS.                                                NC1114.2
   000052         005500     02 FILLER                   PIC X      VALUE SPACE.          NC1114.2 IMP
   000053         005600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1114.2 IMP
   000054         005700     02 FILLER                   PIC X      VALUE SPACE.          NC1114.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1114.2 IMP
   000056         005900     02 FILLER                   PIC X      VALUE SPACE.          NC1114.2 IMP
   000057         006000     02  PAR-NAME.                                                NC1114.2
   000058         006100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1114.2 IMP
   000059         006200       03  PARDOT-X              PIC X      VALUE SPACE.          NC1114.2 IMP
   000060         006300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1114.2 IMP
   000061         006400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1114.2 IMP
   000062         006500     02 RE-MARK                  PIC X(61).                       NC1114.2
   000063         006600 01  TEST-COMPUTED.                                               NC1114.2
   000064         006700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1114.2 IMP
   000065         006800     02 FILLER                   PIC X(17)  VALUE                 NC1114.2
   000066         006900            "       COMPUTED=".                                   NC1114.2
   000067         007000     02 COMPUTED-X.                                               NC1114.2
   000068         007100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1114.2 IMP
   000069         007200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1114.2 68
   000070         007300                                 PIC -9(9).9(9).                  NC1114.2
   000071         007400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1114.2 68
   000072         007500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1114.2 68
   000073         007600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1114.2 68
   000074         007700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1114.2 68
   000075         007800         04 COMPUTED-18V0                    PIC -9(18).          NC1114.2
   000076         007900         04 FILLER                           PIC X.               NC1114.2
   000077         008000     03 FILLER PIC X(50) VALUE SPACE.                             NC1114.2 IMP
   000078         008100 01  TEST-CORRECT.                                                NC1114.2
   000079         008200     02 FILLER PIC X(30) VALUE SPACE.                             NC1114.2 IMP
   000080         008300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1114.2
   000081         008400     02 CORRECT-X.                                                NC1114.2
   000082         008500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1114.2 IMP
   000083         008600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1114.2 82
   000084         008700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1114.2 82
   000085         008800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1114.2 82
   000086         008900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1114.2 82
   000087         009000     03      CR-18V0 REDEFINES CORRECT-A.                         NC1114.2 82
   000088         009100         04 CORRECT-18V0                     PIC -9(18).          NC1114.2
   000089         009200         04 FILLER                           PIC X.               NC1114.2
   000090         009300     03 FILLER PIC X(2) VALUE SPACE.                              NC1114.2 IMP
   000091         009400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1114.2 IMP
   000092         009500 01  CCVS-C-1.                                                    NC1114.2
   000093         009600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1114.2
   000094         009700-    "SS  PARAGRAPH-NAME                                          NC1114.2
   000095         009800-    "       REMARKS".                                            NC1114.2
   000096         009900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1114.2 IMP
   000097         010000 01  CCVS-C-2.                                                    NC1114.2
   000098         010100     02 FILLER                     PIC X        VALUE SPACE.      NC1114.2 IMP
   000099         010200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1114.2
   000100         010300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1114.2 IMP
   000101         010400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1114.2
   000102         010500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1114.2 IMP
   000103         010600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1114.2 IMP
   000104         010700 01  REC-CT                        PIC 99       VALUE ZERO.       NC1114.2 IMP
   000105         010800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1114.2 IMP
   000106         010900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1114.2 IMP
   000107         011000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1114.2 IMP
   000108         011100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1114.2 IMP
   000109         011200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1114.2 IMP
   000110         011300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1114.2 IMP
   000111         011400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1114.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1114.2 IMP
   000113         011600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1114.2 IMP
   000114         011700 01  CCVS-H-1.                                                    NC1114.2
   000115         011800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1114.2 IMP
   000116         011900     02  FILLER                    PIC X(42)    VALUE             NC1114.2
   000117         012000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1114.2
   000118         012100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1114.2 IMP
   000119         012200 01  CCVS-H-2A.                                                   NC1114.2
   000120         012300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1114.2 IMP
   000121         012400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1114.2
   000122         012500   02  FILLER                        PIC XXXX   VALUE             NC1114.2
   000123         012600     "4.2 ".                                                      NC1114.2
   000124         012700   02  FILLER                        PIC X(28)  VALUE             NC1114.2
   000125         012800            " COPY - NOT FOR DISTRIBUTION".                       NC1114.2
   000126         012900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1114.2 IMP
   000127         013000                                                                  NC1114.2
   000128         013100 01  CCVS-H-2B.                                                   NC1114.2
   000129         013200   02  FILLER                        PIC X(15)  VALUE             NC1114.2
   000130         013300            "TEST RESULT OF ".                                    NC1114.2
   000131         013400   02  TEST-ID                       PIC X(9).                    NC1114.2
   000132         013500   02  FILLER                        PIC X(4)   VALUE             NC1114.2
   000133         013600            " IN ".                                               NC1114.2
   000134         013700   02  FILLER                        PIC X(12)  VALUE             NC1114.2
   000135         013800     " HIGH       ".                                              NC1114.2
   000136         013900   02  FILLER                        PIC X(22)  VALUE             NC1114.2
   000137         014000            " LEVEL VALIDATION FOR ".                             NC1114.2
   000138         014100   02  FILLER                        PIC X(58)  VALUE             NC1114.2
   000139         014200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1114.2
   000140         014300 01  CCVS-H-3.                                                    NC1114.2
   000141         014400     02  FILLER                      PIC X(34)  VALUE             NC1114.2
   000142         014500            " FOR OFFICIAL USE ONLY    ".                         NC1114.2
   000143         014600     02  FILLER                      PIC X(58)  VALUE             NC1114.2
   000144         014700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1114.2
   000145         014800     02  FILLER                      PIC X(28)  VALUE             NC1114.2
   000146         014900            "  COPYRIGHT   1985 ".                                NC1114.2
   000147         015000 01  CCVS-E-1.                                                    NC1114.2
   000148         015100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1114.2 IMP
   000149         015200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1114.2
   000150         015300     02 ID-AGAIN                     PIC X(9).                    NC1114.2
   000151         015400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1114.2 IMP
   000152         015500 01  CCVS-E-2.                                                    NC1114.2
   000153         015600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1114.2 IMP
   000154         015700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1114.2 IMP
   000155         015800     02 CCVS-E-2-2.                                               NC1114.2
   000156         015900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1114.2 IMP
   000157         016000         03 FILLER                   PIC X      VALUE SPACE.      NC1114.2 IMP
   000158         016100         03 ENDER-DESC               PIC X(44)  VALUE             NC1114.2
   000159         016200            "ERRORS ENCOUNTERED".                                 NC1114.2
   000160         016300 01  CCVS-E-3.                                                    NC1114.2
   000161         016400     02  FILLER                      PIC X(22)  VALUE             NC1114.2
   000162         016500            " FOR OFFICIAL USE ONLY".                             NC1114.2
   000163         016600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1114.2 IMP
   000164         016700     02  FILLER                      PIC X(58)  VALUE             NC1114.2
   000165         016800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1114.2
   000166         016900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1114.2 IMP
   000167         017000     02 FILLER                       PIC X(15)  VALUE             NC1114.2
   000168         017100             " COPYRIGHT 1985".                                   NC1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  CCVS-E-4.                                                    NC1114.2
   000170         017300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1114.2 IMP
   000171         017400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1114.2
   000172         017500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1114.2 IMP
   000173         017600     02 FILLER                       PIC X(40)  VALUE             NC1114.2
   000174         017700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1114.2
   000175         017800 01  XXINFO.                                                      NC1114.2
   000176         017900     02 FILLER                       PIC X(19)  VALUE             NC1114.2
   000177         018000            "*** INFORMATION ***".                                NC1114.2
   000178         018100     02 INFO-TEXT.                                                NC1114.2
   000179         018200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1114.2 IMP
   000180         018300       04 XXCOMPUTED                 PIC X(20).                   NC1114.2
   000181         018400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1114.2 IMP
   000182         018500       04 XXCORRECT                  PIC X(20).                   NC1114.2
   000183         018600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1114.2
   000184         018700 01  HYPHEN-LINE.                                                 NC1114.2
   000185         018800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1114.2 IMP
   000186         018900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1114.2
   000187         019000-    "*****************************************".                 NC1114.2
   000188         019100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1114.2
   000189         019200-    "******************************".                            NC1114.2
   000190         019300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1114.2
   000191         019400     "NC111A".                                                    NC1114.2
   000192         019500 PROCEDURE DIVISION.                                              NC1114.2
   000193         019600 CCVS1 SECTION.                                                   NC1114.2
   000194         019700 OPEN-FILES.                                                      NC1114.2
   000195         019800     OPEN     OUTPUT PRINT-FILE.                                  NC1114.2 36
   000196         019900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1114.2 190 131 190 150
   000197         020000     MOVE    SPACE TO TEST-RESULTS.                               NC1114.2 IMP 51
   000198         020100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1114.2 223 228
   000199         020200     GO TO CCVS1-EXIT.                                            NC1114.2 310
   000200         020300 CLOSE-FILES.                                                     NC1114.2
   000201         020400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1114.2 232 253 36
   000202         020500 TERMINATE-CCVS.                                                  NC1114.2
   000203         020600     EXIT PROGRAM.                                                NC1114.2
   000204         020700 TERMINATE-CALL.                                                  NC1114.2
   000205         020800     STOP     RUN.                                                NC1114.2
   000206         020900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1114.2 55 107
   000207         021000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1114.2 55 108
   000208         021100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1114.2 55 106
   000209         021200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1114.2 55 105
   000210         021300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1114.2 62
   000211         021400 PRINT-DETAIL.                                                    NC1114.2
   000212         021500     IF REC-CT NOT EQUAL TO ZERO                                  NC1114.2 104 IMP
   000213      1  021600             MOVE "." TO PARDOT-X                                 NC1114.2 59
   000214      1  021700             MOVE REC-CT TO DOTVALUE.                             NC1114.2 104 60
   000215         021800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1114.2 51 37 265
   000216         021900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1114.2 55 265
   000217      1  022000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1114.2 286 300
   000218      1  022100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1114.2 301 309
   000219         022200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1114.2 IMP 55 IMP 67
   000220         022300     MOVE SPACE TO CORRECT-X.                                     NC1114.2 IMP 81
   000221         022400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1114.2 104 IMP IMP 57
   000222         022500     MOVE     SPACE TO RE-MARK.                                   NC1114.2 IMP 62
   000223         022600 HEAD-ROUTINE.                                                    NC1114.2
   000224         022700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1114.2 114 38 265
   000225         022800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1114.2 119 38 265
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1114.2 128 38 265
   000227         023000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1114.2 140 38 265
   000228         023100 COLUMN-NAMES-ROUTINE.                                            NC1114.2
   000229         023200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1114.2 92 38 265
   000230         023300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1114.2 97 38 265
   000231         023400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1114.2 184 38 265
   000232         023500 END-ROUTINE.                                                     NC1114.2
   000233         023600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1114.2 184 38 265
   000234         023700 END-RTN-EXIT.                                                    NC1114.2
   000235         023800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1114.2 147 38 265
   000236         023900 END-ROUTINE-1.                                                   NC1114.2
   000237         024000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1114.2 106 110 107
   000238         024100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1114.2 110 105 110
   000239         024200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1114.2 108 110
   000240         024300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1114.2
   000241         024400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1114.2 108 170
   000242         024500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1114.2 110 172
   000243         024600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1114.2 169 155
   000244         024700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1114.2 152 38 265
   000245         024800  END-ROUTINE-12.                                                 NC1114.2
   000246         024900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1114.2 158
   000247         025000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1114.2 106 IMP
   000248      1  025100         MOVE "NO " TO ERROR-TOTAL                                NC1114.2 156
   000249         025200         ELSE                                                     NC1114.2
   000250      1  025300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1114.2 106 156
   000251         025400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1114.2 152 38
   000252         025500     PERFORM WRITE-LINE.                                          NC1114.2 265
   000253         025600 END-ROUTINE-13.                                                  NC1114.2
   000254         025700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1114.2 105 IMP
   000255      1  025800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1114.2 156
   000256      1  025900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1114.2 105 156
   000257         026000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1114.2 158
   000258         026100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1114.2 152 38 265
   000259         026200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1114.2 107 IMP
   000260      1  026300          MOVE "NO " TO ERROR-TOTAL                               NC1114.2 156
   000261      1  026400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1114.2 107 156
   000262         026500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1114.2 158
   000263         026600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1114.2 152 38 265
   000264         026700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1114.2 160 38 265
   000265         026800 WRITE-LINE.                                                      NC1114.2
   000266         026900     ADD 1 TO RECORD-COUNT.                                       NC1114.2 112
   000267         027000     IF RECORD-COUNT GREATER 42                                   NC1114.2 112
   000268      1  027100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1114.2 38 111
   000269      1  027200         MOVE SPACE TO DUMMY-RECORD                               NC1114.2 IMP 38
   000270      1  027300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1114.2 38
   000271      1  027400         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1114.2 114 38 281
   000272      1  027500         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1114.2 119 38 281
   000273      1  027600         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1114.2 128 38 281
   000274      1  027700         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1114.2 140 38 281
   000275      1  027800         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1114.2 92 38 281
   000276      1  027900         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1114.2 97 38 281
   000277      1  028000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1114.2 184 38 281
   000278      1  028100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1114.2 111 38
   000279      1  028200         MOVE ZERO TO RECORD-COUNT.                               NC1114.2 IMP 112
   000280         028300     PERFORM WRT-LN.                                              NC1114.2 281
   000281         028400 WRT-LN.                                                          NC1114.2
   000282         028500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1114.2 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     MOVE SPACE TO DUMMY-RECORD.                                  NC1114.2 IMP 38
   000284         028700 BLANK-LINE-PRINT.                                                NC1114.2
   000285         028800     PERFORM WRT-LN.                                              NC1114.2 281
   000286         028900 FAIL-ROUTINE.                                                    NC1114.2
   000287         029000     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1114.2 67 IMP
   000288      1  029100            GO TO FAIL-ROUTINE-WRITE.                             NC1114.2 295
   000289         029200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1114.2 81 IMP 295
   000290         029300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1114.2 113 183
   000291         029400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1114.2 178
   000292         029500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1114.2 175 38 265
   000293         029600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1114.2 IMP 183
   000294         029700     GO TO  FAIL-ROUTINE-EX.                                      NC1114.2 300
   000295         029800 FAIL-ROUTINE-WRITE.                                              NC1114.2
   000296         029900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1114.2 63 37 265
   000297         030000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1114.2 113 91
   000298         030100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1114.2 78 37 265
   000299         030200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1114.2 IMP 91
   000300         030300 FAIL-ROUTINE-EX. EXIT.                                           NC1114.2
   000301         030400 BAIL-OUT.                                                        NC1114.2
   000302         030500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1114.2 68 IMP 304
   000303         030600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1114.2 82 IMP 309
   000304         030700 BAIL-OUT-WRITE.                                                  NC1114.2
   000305         030800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1114.2 82 182 68 180
   000306         030900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1114.2 113 183
   000307         031000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1114.2 175 38 265
   000308         031100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1114.2 IMP 183
   000309         031200 BAIL-OUT-EX. EXIT.                                               NC1114.2
   000310         031300 CCVS1-EXIT.                                                      NC1114.2
   000311         031400     EXIT.                                                        NC1114.2
   000312         031500 SECT-NC111A-001 SECTION.                                         NC1114.2
   000313         031600 BLURB-REMARK.                                                    NC1114.2
   000314         031700     MOVE     SPACE TO TEST-RESULTS.                              NC1114.2 IMP 51
   000315         031800     MOVE "THE FOLLOWING 3 TESTS TEST " TO RE-MARK.               NC1114.2 62
   000316         031900     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000317         032000     MOVE "SOME SPECIFIC FEATURES OF  " TO RE-MARK.               NC1114.2 62
   000318         032100     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000319         032200     MOVE "THE TRUNCATION, ROUNDED AND" TO RE-MARK.               NC1114.2 62
   000320         032300     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000321         032400     MOVE "SIZE ERROR OPTIONS. GENERAL" TO RE-MARK.               NC1114.2 62
   000322         032500     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000323         032600     MOVE "FEATURES OF THESE OPTIONS  " TO RE-MARK.               NC1114.2 62
   000324         032700     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000325         032800     MOVE "ARE TESTED IN THE ADD, SUB-" TO RE-MARK.               NC1114.2 62
   000326         032900     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000327         033000     MOVE "TRACT, MULTIPLY, AND DIVIDE" TO RE-MARK.               NC1114.2 62
   000328         033100     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000329         033200     MOVE "TESTS.                     " TO RE-MARK.               NC1114.2 62
   000330         033300     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000331         033400 TRU-INIT-GF-1.                                                   NC1114.2
   000332         033500     MOVE   "V1-67 6.4.1" TO ANSI-REFERENCE.                      NC1114.2 113
   000333         033600     MOVE    7777777 TO N-40.                                     NC1114.2 42
   000334         033700     MOVE    1111111 TO N-41.                                     NC1114.2 44
   000335         033800 TRU-TEST-GF-1-0.                                                 NC1114.2
   000336         033900     ADD      N-40 N-41 GIVING N-42.                              NC1114.2 42 44 46
   000337         034000 TRU-TEST-GF-1-1.                                                 NC1114.2
   000338         034100     IF       N-42 EQUAL TO 8880000                               NC1114.2 46
   000339      1  034200              PERFORM PASS                                        NC1114.2 207
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340      1  034300              GO TO TRU-WRITE-GF-1.                               NC1114.2 349
   000341         034400     GO TO    TRU-FAIL-GF-1.                                      NC1114.2 345
   000342         034500 TRU-DELETE-GF-1.                                                 NC1114.2
   000343         034600     PERFORM  DE-LETE.                                            NC1114.2 209
   000344         034700     GO TO    TRU-WRITE-GF-1.                                     NC1114.2 349
   000345         034800 TRU-FAIL-GF-1.                                                   NC1114.2
   000346         034900     MOVE     N-42 TO COMPUTED-N.                                 NC1114.2 46 69
   000347         035000     MOVE     8880000 TO CORRECT-N.                               NC1114.2 83
   000348         035100     PERFORM  FAIL.                                               NC1114.2 208
   000349         035200 TRU-WRITE-GF-1.                                                  NC1114.2
   000350         035300     MOVE "TRUNCATION" TO FEATURE.                                NC1114.2 53
   000351         035400     MOVE "TRU-TEST-GF-1" TO PAR-NAME.                            NC1114.2 57
   000352         035500     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000353         035600 TRU-INIT-GF-2.                                                   NC1114.2
   000354         035700     MOVE   "V1-67 6.4.1" TO ANSI-REFERENCE.                      NC1114.2 113
   000355         035800     MOVE    ZERO TO N-45.                                        NC1114.2 IMP 50
   000356         035900     MOVE   +1.6  TO N-43.                                        NC1114.2 48
   000357         036000 TRU-TEST-GF-2-0.                                                 NC1114.2
   000358         036100     ADD      N-43 1.4       GIVING N-45.                         NC1114.2 48 50
   000359         036200 TRU-TEST-GF-2-1.                                                 NC1114.2
   000360         036300     IF       N-45 EQUAL TO +3                                    NC1114.2 50
   000361      1  036400              PERFORM PASS GO TO TRU-WRITE-GF-2.                  NC1114.2 207 370
   000362         036500     GO       TO TRU-FAIL-GF-2.                                   NC1114.2 366
   000363         036600 TRU-DELETE-GF-2.                                                 NC1114.2
   000364         036700     PERFORM  DE-LETE.                                            NC1114.2 209
   000365         036800     GO       TO TRU-WRITE-GF-2.                                  NC1114.2 370
   000366         036900 TRU-FAIL-GF-2.                                                   NC1114.2
   000367         037000     PERFORM  FAIL.                                               NC1114.2 208
   000368         037100     MOVE     N-45 TO COMPUTED-N.                                 NC1114.2 50 69
   000369         037200     MOVE     3 TO CORRECT-N.                                     NC1114.2 83
   000370         037300 TRU-WRITE-GF-2.                                                  NC1114.2
   000371         037400     MOVE     "TRU-TEST-GF-2 " TO PAR-NAME.                       NC1114.2 57
   000372         037500     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000373         037600 TRU-INIT-GF-3.                                                   NC1114.2
   000374         037700     MOVE   "V1-67 6.4.1" TO ANSI-REFERENCE.                      NC1114.2 113
   000375         037800     MOVE    ZERO TO N-45.                                        NC1114.2 IMP 50
   000376         037900     MOVE   -1.6  TO N-44.                                        NC1114.2 49
   000377         038000 TRU-TEST-GF-3-0.                                                 NC1114.2
   000378         038100     ADD      N-44 -1.4      GIVING N-45.                         NC1114.2 49 50
   000379         038200 TRU-TEST-GF-3-1.                                                 NC1114.2
   000380         038300     IF       N-45 EQUAL TO -3                                    NC1114.2 50
   000381      1  038400              PERFORM PASS GO TO TRU-WRITE-GF-3.                  NC1114.2 207 390
   000382         038500     GO       TO TRU-FAIL-GF-3.                                   NC1114.2 386
   000383         038600 TRU-DELETE-GF-3.                                                 NC1114.2
   000384         038700     PERFORM  DE-LETE.                                            NC1114.2 209
   000385         038800     GO       TO TRU-WRITE-GF-3.                                  NC1114.2 390
   000386         038900 TRU-FAIL-GF-3.                                                   NC1114.2
   000387         039000     PERFORM  FAIL.                                               NC1114.2 208
   000388         039100     MOVE     N-45 TO COMPUTED-N.                                 NC1114.2 50 69
   000389         039200     MOVE     -3 TO CORRECT-N.                                    NC1114.2 83
   000390         039300 TRU-WRITE-GF-3.                                                  NC1114.2
   000391         039400     MOVE     "TRU-TEST-GF-3 " TO PAR-NAME.                       NC1114.2 57
   000392         039500     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000393         039600 TRU-INIT-GF-4.                                                   NC1114.2
   000394         039700     MOVE   "V1-67 6.4.1" TO ANSI-REFERENCE.                      NC1114.2 113
   000395         039800     MOVE    ZERO TO N-45.                                        NC1114.2 IMP 50
   000396         039900     MOVE   +1.6  TO N-43.                                        NC1114.2 48
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 TRU-TEST-GF-4-0.                                                 NC1114.2
   000398         040100     MULTIPLY 5 BY N-43      GIVING N-45.                         NC1114.2 48 50
   000399         040200 TRU-TEST-GF-4-1.                                                 NC1114.2
   000400         040300     IF       N-45 EQUAL TO +8                                    NC1114.2 50
   000401      1  040400              PERFORM PASS GO TO TRU-WRITE-GF-4.                  NC1114.2 207 410
   000402         040500     GO       TO TRU-FAIL-GF-4.                                   NC1114.2 406
   000403         040600 TRU-DELETE-GF-4.                                                 NC1114.2
   000404         040700     PERFORM  DE-LETE.                                            NC1114.2 209
   000405         040800     GO       TO TRU-WRITE-GF-4.                                  NC1114.2 410
   000406         040900 TRU-FAIL-GF-4.                                                   NC1114.2
   000407         041000     PERFORM  FAIL.                                               NC1114.2 208
   000408         041100     MOVE     N-45 TO COMPUTED-N.                                 NC1114.2 50 69
   000409         041200     MOVE     8 TO CORRECT-N.                                     NC1114.2 83
   000410         041300 TRU-WRITE-GF-4.                                                  NC1114.2
   000411         041400     MOVE     "TRU-TEST-GF-4 " TO PAR-NAME.                       NC1114.2 57
   000412         041500     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000413         041600 TRU-INIT-GF-5.                                                   NC1114.2
   000414         041700     MOVE   "V1-67 6.4.1" TO ANSI-REFERENCE.                      NC1114.2 113
   000415         041800     MOVE    ZERO TO N-45.                                        NC1114.2 IMP 50
   000416         041900     MOVE   -1.6  TO N-44.                                        NC1114.2 49
   000417         042000 TRU-TEST-GF-5-0.                                                 NC1114.2
   000418         042100     MULTIPLY 5 BY N-44      GIVING N-45.                         NC1114.2 49 50
   000419         042200 TRU-TEST-GF-5-1.                                                 NC1114.2
   000420         042300     IF       N-45 EQUAL TO -8                                    NC1114.2 50
   000421      1  042400              PERFORM PASS GO TO TRU-WRITE-GF-5.                  NC1114.2 207 430
   000422         042500     GO       TO TRU-FAIL-GF-5.                                   NC1114.2 426
   000423         042600 TRU-DELETE-GF-5.                                                 NC1114.2
   000424         042700     PERFORM  DE-LETE.                                            NC1114.2 209
   000425         042800     GO       TO TRU-WRITE-GF-5.                                  NC1114.2 430
   000426         042900 TRU-FAIL-GF-5.                                                   NC1114.2
   000427         043000     PERFORM  FAIL.                                               NC1114.2 208
   000428         043100     MOVE     N-45 TO COMPUTED-N.                                 NC1114.2 50 69
   000429         043200     MOVE     -8 TO CORRECT-N.                                    NC1114.2 83
   000430         043300 TRU-WRITE-GF-5.                                                  NC1114.2
   000431         043400     MOVE     "TRU-TEST-GF-5 " TO PAR-NAME.                       NC1114.2 57
   000432         043500     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000433         043600 TRU-INIT-GF-6.                                                   NC1114.2
   000434         043700     MOVE   "V1-67 6.4.1" TO ANSI-REFERENCE.                      NC1114.2 113
   000435         043800     MOVE    ZERO TO N-45.                                        NC1114.2 IMP 50
   000436         043900     MOVE   +1.6  TO N-43.                                        NC1114.2 48
   000437         044000 TRU-TEST-GF-6-0.                                                 NC1114.2
   000438         044100     SUBTRACT -1.4 FROM N-43 GIVING N-45.                         NC1114.2 48 50
   000439         044200 TRU-TEST-GF-6-1.                                                 NC1114.2
   000440         044300     IF       N-45 EQUAL TO +3                                    NC1114.2 50
   000441      1  044400              PERFORM PASS GO TO TRU-WRITE-GF-6.                  NC1114.2 207 450
   000442         044500     GO       TO TRU-FAIL-GF-6.                                   NC1114.2 446
   000443         044600 TRU-DELETE-GF-6.                                                 NC1114.2
   000444         044700     PERFORM  DE-LETE.                                            NC1114.2 209
   000445         044800     GO       TO TRU-WRITE-GF-6.                                  NC1114.2 450
   000446         044900 TRU-FAIL-GF-6.                                                   NC1114.2
   000447         045000     PERFORM  FAIL.                                               NC1114.2 208
   000448         045100     MOVE     N-45 TO COMPUTED-N.                                 NC1114.2 50 69
   000449         045200     MOVE     3 TO CORRECT-N.                                     NC1114.2 83
   000450         045300 TRU-WRITE-GF-6.                                                  NC1114.2
   000451         045400     MOVE     "TRU-TEST-GF-6 " TO PAR-NAME.                       NC1114.2 57
   000452         045500     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000453         045600 TRU-INIT-GF-7.                                                   NC1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     MOVE   "V1-67 6.4.1" TO ANSI-REFERENCE.                      NC1114.2 113
   000455         045800     MOVE    ZERO TO N-45.                                        NC1114.2 IMP 50
   000456         045900     MOVE   -1.6  TO N-44.                                        NC1114.2 49
   000457         046000 TRU-TEST-GF-7-0.                                                 NC1114.2
   000458         046100     SUBTRACT +1.4 FROM N-44 GIVING N-45.                         NC1114.2 49 50
   000459         046200 TRU-TEST-GF-7-1.                                                 NC1114.2
   000460         046300     IF       N-45 EQUAL TO -3                                    NC1114.2 50
   000461      1  046400              PERFORM PASS GO TO TRU-WRITE-GF-7.                  NC1114.2 207 470
   000462         046500     GO       TO TRU-FAIL-GF-7.                                   NC1114.2 466
   000463         046600 TRU-DELETE-GF-7.                                                 NC1114.2
   000464         046700     PERFORM  DE-LETE.                                            NC1114.2 209
   000465         046800     GO       TO TRU-WRITE-GF-7.                                  NC1114.2 470
   000466         046900 TRU-FAIL-GF-7.                                                   NC1114.2
   000467         047000     PERFORM  FAIL.                                               NC1114.2 208
   000468         047100     MOVE     N-45 TO COMPUTED-N.                                 NC1114.2 50 69
   000469         047200     MOVE     -3 TO CORRECT-N.                                    NC1114.2 83
   000470         047300 TRU-WRITE-GF-7.                                                  NC1114.2
   000471         047400     MOVE     "TRU-TEST-GF-7 " TO PAR-NAME.                       NC1114.2 57
   000472         047500     PERFORM  PRINT-DETAIL.                                       NC1114.2 211
   000473         047600 CCVS-EXIT SECTION.                                               NC1114.2
   000474         047700 CCVS-999999.                                                     NC1114.2
   000475         047800     GO TO CLOSE-FILES.                                           NC1114.2 200
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      113   ANSI-REFERENCE . . . . . . . .  290 297 306 M332 M354 M374 M394 M414 M434 M454
       92   CCVS-C-1 . . . . . . . . . . .  229 275
       97   CCVS-C-2 . . . . . . . . . . .  230 276
      147   CCVS-E-1 . . . . . . . . . . .  235
      152   CCVS-E-2 . . . . . . . . . . .  244 251 258 263
      155   CCVS-E-2-2 . . . . . . . . . .  M243
      160   CCVS-E-3 . . . . . . . . . . .  264
      169   CCVS-E-4 . . . . . . . . . . .  243
      170   CCVS-E-4-1 . . . . . . . . . .  M241
      172   CCVS-E-4-2 . . . . . . . . . .  M242
      114   CCVS-H-1 . . . . . . . . . . .  224 271
      119   CCVS-H-2A. . . . . . . . . . .  225 272
      128   CCVS-H-2B. . . . . . . . . . .  226 273
      140   CCVS-H-3 . . . . . . . . . . .  227 274
      190   CCVS-PGM-ID. . . . . . . . . .  196 196
       74   CM-18V0
       68   COMPUTED-A . . . . . . . . . .  69 71 72 73 74 302 305
       69   COMPUTED-N . . . . . . . . . .  M346 M368 M388 M408 M428 M448 M468
       67   COMPUTED-X . . . . . . . . . .  M219 287
       71   COMPUTED-0V18
       73   COMPUTED-14V4
       75   COMPUTED-18V0
       72   COMPUTED-4V14
       91   COR-ANSI-REFERENCE . . . . . .  M297 M299
       82   CORRECT-A. . . . . . . . . . .  83 84 85 86 87 303 305
       83   CORRECT-N. . . . . . . . . . .  M347 M369 M389 M409 M429 M449 M469
       81   CORRECT-X. . . . . . . . . . .  M220 289
       84   CORRECT-0V18
       86   CORRECT-14V4
       88   CORRECT-18V0
       85   CORRECT-4V14
       87   CR-18V0
      105   DELETE-COUNTER . . . . . . . .  M209 238 254 256
       60   DOTVALUE . . . . . . . . . . .  M214
      111   DUMMY-HOLD . . . . . . . . . .  M268 278
       38   DUMMY-RECORD . . . . . . . . .  M224 M225 M226 M227 M229 M230 M231 M233 M235 M244 M251 M258 M263 M264 268 M269
                                            270 M271 M272 M273 M274 M275 M276 M277 M278 282 M283 M292 M307
      158   ENDER-DESC . . . . . . . . . .  M246 M257 M262
      106   ERROR-COUNTER. . . . . . . . .  M208 237 247 250
      110   ERROR-HOLD . . . . . . . . . .  M237 M238 M238 M239 242
      156   ERROR-TOTAL. . . . . . . . . .  M248 M250 M255 M256 M260 M261
       53   FEATURE. . . . . . . . . . . .  M350
      184   HYPHEN-LINE. . . . . . . . . .  231 233 277
      150   ID-AGAIN . . . . . . . . . . .  M196
      183   INF-ANSI-REFERENCE . . . . . .  M290 M293 M306 M308
      178   INFO-TEXT. . . . . . . . . . .  M291
      107   INSPECT-COUNTER. . . . . . . .  M206 237 259 261
       40   N-11
       41   N-12
       42   N-40 . . . . . . . . . . . . .  M333 336
       44   N-41 . . . . . . . . . . . . .  M334 336
       46   N-42 . . . . . . . . . . . . .  M336 338 346
       48   N-43 . . . . . . . . . . . . .  M356 358 M396 398 M436 438
       49   N-44 . . . . . . . . . . . . .  M376 378 M416 418 M456 458
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page    13
0 Defined   Cross-reference of data names   References

0      50   N-45 . . . . . . . . . . . . .  M355 M358 360 368 M375 M378 380 388 M395 M398 400 408 M415 M418 420 428 M435
                                            M438 440 448 M455 M458 460 468
       55   P-OR-F . . . . . . . . . . . .  M206 M207 M208 M209 216 M219
       57   PAR-NAME . . . . . . . . . . .  M221 M351 M371 M391 M411 M431 M451 M471
       59   PARDOT-X . . . . . . . . . . .  M213
      108   PASS-COUNTER . . . . . . . . .  M207 239 241
       36   PRINT-FILE . . . . . . . . . .  32 195 201
       37   PRINT-REC. . . . . . . . . . .  M215 M296 M298
       62   RE-MARK. . . . . . . . . . . .  M210 M222 M315 M317 M319 M321 M323 M325 M327 M329
      104   REC-CT . . . . . . . . . . . .  212 214 221
      103   REC-SKL-SUB
      112   RECORD-COUNT . . . . . . . . .  M266 267 M279
       63   TEST-COMPUTED. . . . . . . . .  296
       78   TEST-CORRECT . . . . . . . . .  298
      131   TEST-ID. . . . . . . . . . . .  M196
       51   TEST-RESULTS . . . . . . . . .  M197 215 M314
      109   TOTAL-ERROR
       47   TRUNC-DATA
      180   XXCOMPUTED . . . . . . . . . .  M305
      182   XXCORRECT. . . . . . . . . . .  M305
      175   XXINFO . . . . . . . . . . . .  292 307
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page    14
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

      301   BAIL-OUT . . . . . . . . . . .  P218
      309   BAIL-OUT-EX. . . . . . . . . .  E218 G303
      304   BAIL-OUT-WRITE . . . . . . . .  G302
      284   BLANK-LINE-PRINT
      313   BLURB-REMARK
      473   CCVS-EXIT
      474   CCVS-999999
      193   CCVS1
      310   CCVS1-EXIT . . . . . . . . . .  G199
      200   CLOSE-FILES. . . . . . . . . .  G475
      228   COLUMN-NAMES-ROUTINE . . . . .  E198
      209   DE-LETE. . . . . . . . . . . .  P343 P364 P384 P404 P424 P444 P464
      232   END-ROUTINE. . . . . . . . . .  P201
      236   END-ROUTINE-1
      245   END-ROUTINE-12
      253   END-ROUTINE-13 . . . . . . . .  E201
      234   END-RTN-EXIT
      208   FAIL . . . . . . . . . . . . .  P348 P367 P387 P407 P427 P447 P467
      286   FAIL-ROUTINE . . . . . . . . .  P217
      300   FAIL-ROUTINE-EX. . . . . . . .  E217 G294
      295   FAIL-ROUTINE-WRITE . . . . . .  G288 G289
      223   HEAD-ROUTINE . . . . . . . . .  P198
      206   INSPT
      194   OPEN-FILES
      207   PASS . . . . . . . . . . . . .  P339 P361 P381 P401 P421 P441 P461
      211   PRINT-DETAIL . . . . . . . . .  P316 P318 P320 P322 P324 P326 P328 P330 P352 P372 P392 P412 P432 P452 P472
      312   SECT-NC111A-001
      204   TERMINATE-CALL
      202   TERMINATE-CCVS
      342   TRU-DELETE-GF-1
      363   TRU-DELETE-GF-2
      383   TRU-DELETE-GF-3
      403   TRU-DELETE-GF-4
      423   TRU-DELETE-GF-5
      443   TRU-DELETE-GF-6
      463   TRU-DELETE-GF-7
      345   TRU-FAIL-GF-1. . . . . . . . .  G341
      366   TRU-FAIL-GF-2. . . . . . . . .  G362
      386   TRU-FAIL-GF-3. . . . . . . . .  G382
      406   TRU-FAIL-GF-4. . . . . . . . .  G402
      426   TRU-FAIL-GF-5. . . . . . . . .  G422
      446   TRU-FAIL-GF-6. . . . . . . . .  G442
      466   TRU-FAIL-GF-7. . . . . . . . .  G462
      331   TRU-INIT-GF-1
      353   TRU-INIT-GF-2
      373   TRU-INIT-GF-3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page    15
0 Defined   Cross-reference of procedures   References

0     393   TRU-INIT-GF-4
      413   TRU-INIT-GF-5
      433   TRU-INIT-GF-6
      453   TRU-INIT-GF-7
      335   TRU-TEST-GF-1-0
      337   TRU-TEST-GF-1-1
      357   TRU-TEST-GF-2-0
      359   TRU-TEST-GF-2-1
      377   TRU-TEST-GF-3-0
      379   TRU-TEST-GF-3-1
      397   TRU-TEST-GF-4-0
      399   TRU-TEST-GF-4-1
      417   TRU-TEST-GF-5-0
      419   TRU-TEST-GF-5-1
      437   TRU-TEST-GF-6-0
      439   TRU-TEST-GF-6-1
      457   TRU-TEST-GF-7-0
      459   TRU-TEST-GF-7-1
      349   TRU-WRITE-GF-1 . . . . . . . .  G340 G344
      370   TRU-WRITE-GF-2 . . . . . . . .  G361 G365
      390   TRU-WRITE-GF-3 . . . . . . . .  G381 G385
      410   TRU-WRITE-GF-4 . . . . . . . .  G401 G405
      430   TRU-WRITE-GF-5 . . . . . . . .  G421 G425
      450   TRU-WRITE-GF-6 . . . . . . . .  G441 G445
      470   TRU-WRITE-GF-7 . . . . . . . .  G461 G465
      265   WRITE-LINE . . . . . . . . . .  P215 P216 P224 P225 P226 P227 P229 P230 P231 P233 P235 P244 P252 P258 P263 P264
                                            P292 P296 P298 P307
      281   WRT-LN . . . . . . . . . . . .  P271 P272 P273 P274 P275 P276 P277 P280 P285
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page    16
0 Defined   Cross-reference of programs     References

        3   NC111A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC111A    Date 06/04/2022  Time 11:57:49   Page    17
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC111A:
 *    Source records = 475
 *    Data Division statements = 72
 *    Procedure Division statements = 259
 *    Generated COBOL statements = 0
 *    Program complexity factor = 267
0End of compilation 1,  program NC111A,  highest severity 0.
0Return code 0
