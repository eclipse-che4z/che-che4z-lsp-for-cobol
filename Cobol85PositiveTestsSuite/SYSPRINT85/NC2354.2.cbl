1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:52   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:52   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2354.2
   000002         000200 PROGRAM-ID.                                                      NC2354.2
   000003         000300     NC235A.                                                      NC2354.2
   000004         000400*                                                                 NC2354.2
   000005         000600*                                                              *  NC2354.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2354.2
   000007         000800*                                                              *  NC2354.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2354.2
   000009         001000*                                                              *  NC2354.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2354.2
   000011         001200*                                                              *  NC2354.2
   000012         001400*                                                              *  NC2354.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2354.2
   000014         001600*                                                              *  NC2354.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2354.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2354.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2354.2
   000018         002000*                                                              *  NC2354.2
   000019         002200*    PROGRAM NC235A TESTS THE USE OF FORMATS 1 AND 2 OF THE    *  NC2354.2
   000020         002300*    "SEARCH" STATEMENT ON A ONE DIMENSIONAL TABLE WITH A      *  NC2354.2
   000021         002400*    VARIABLE NUMBER OF OCCURRENCES.   THE TABLE IS DEFINED    *  NC2354.2
   000022         002500*    USING FORMAT 2 OF THE "OCCURS" CLAUSE.                    *  NC2354.2
   000023         002600*                                                              *  NC2354.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2354.2
   000025         002900 CONFIGURATION SECTION.                                           NC2354.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2354.2
   000027         003100     XXXXX082.                                                    NC2354.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2354.2
   000029         003300     XXXXX083.                                                    NC2354.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2354.2
   000031         003500 FILE-CONTROL.                                                    NC2354.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2354.2 36
   000033         003700     XXXXX055.                                                    NC2354.2
   000034         003800 DATA DIVISION.                                                   NC2354.2
   000035         003900 FILE SECTION.                                                    NC2354.2
   000036         004000 FD  PRINT-FILE.                                                  NC2354.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2354.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2354.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2354.2
   000040         004400 77  TBL-LENGTH                  PIC 99  VALUE 26.                NC2354.2
   000041         004500 77  SUB-1                       PIC 99  VALUE ZERO.              NC2354.2 IMP
   000042         004600 01  TBL-TH309.                                                   NC2354.2
   000043         004700     02  TH309-ENTRY OCCURS 1 TO 26 DEPENDING TBL-LENGTH          NC2354.2 40
   000044         004800         DESCENDING KEY IS DEC-KEY INDEXED BY IDX-1, IDX-2, IDX-3.NC2354.2 45
   000045         004900         03  DEC-KEY             PIC XX.                          NC2354.2
   000046         005000             88  FIRSTZ VALUE "ZZ".                               NC2354.2
   000047         005100             88  LASTA  VALUE "AA".                               NC2354.2
   000048         005200             88  MIDDLE-PP VALUE "PP".                            NC2354.2
   000049         005300 01  NOTE-1.                                                      NC2354.2
   000050         005400     02  FILLER                  PIC X(74) VALUE                  NC2354.2
   000051         005500     "NOTE 1 - CORRECT AND COMPUTED DATA ARE EQUAL BUT THE AT END NC2354.2
   000052         005600-    "PATH WAS TAKEN".                                            NC2354.2
   000053         005700     02  FILLER                  PIC X(46) VALUE SPACE.           NC2354.2 IMP
   000054         005800 01  NOTE-2.                                                      NC2354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02  FILLER                  PIC X(112) VALUE                 NC2354.2
   000056         006000     "NOTE 2 - CORRECT AND COMPUTED DATA ARE NOT EQUAL. THE COMPUTNC2354.2
   000057         006100-    "ED ENTRY WAS EXTRACTED FROM THE TABLE BY SUBSCRIPTS.".      NC2354.2
   000058         006200     02  FILLER                  PIC X(8)  VALUE SPACE.           NC2354.2 IMP
   000059         006300 01  TEST-RESULTS.                                                NC2354.2
   000060         006400     02 FILLER                   PIC X      VALUE SPACE.          NC2354.2 IMP
   000061         006500     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2354.2 IMP
   000062         006600     02 FILLER                   PIC X      VALUE SPACE.          NC2354.2 IMP
   000063         006700     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2354.2 IMP
   000064         006800     02 FILLER                   PIC X      VALUE SPACE.          NC2354.2 IMP
   000065         006900     02  PAR-NAME.                                                NC2354.2
   000066         007000       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2354.2 IMP
   000067         007100       03  PARDOT-X              PIC X      VALUE SPACE.          NC2354.2 IMP
   000068         007200       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2354.2 IMP
   000069         007300     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2354.2 IMP
   000070         007400     02 RE-MARK                  PIC X(61).                       NC2354.2
   000071         007500 01  TEST-COMPUTED.                                               NC2354.2
   000072         007600     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2354.2 IMP
   000073         007700     02 FILLER                   PIC X(17)  VALUE                 NC2354.2
   000074         007800            "       COMPUTED=".                                   NC2354.2
   000075         007900     02 COMPUTED-X.                                               NC2354.2
   000076         008000     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2354.2 IMP
   000077         008100     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2354.2 76
   000078         008200                                 PIC -9(9).9(9).                  NC2354.2
   000079         008300     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2354.2 76
   000080         008400     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2354.2 76
   000081         008500     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2354.2 76
   000082         008600     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2354.2 76
   000083         008700         04 COMPUTED-18V0                    PIC -9(18).          NC2354.2
   000084         008800         04 FILLER                           PIC X.               NC2354.2
   000085         008900     03 FILLER PIC X(50) VALUE SPACE.                             NC2354.2 IMP
   000086         009000 01  TEST-CORRECT.                                                NC2354.2
   000087         009100     02 FILLER PIC X(30) VALUE SPACE.                             NC2354.2 IMP
   000088         009200     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2354.2
   000089         009300     02 CORRECT-X.                                                NC2354.2
   000090         009400     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2354.2 IMP
   000091         009500     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2354.2 90
   000092         009600     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2354.2 90
   000093         009700     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2354.2 90
   000094         009800     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2354.2 90
   000095         009900     03      CR-18V0 REDEFINES CORRECT-A.                         NC2354.2 90
   000096         010000         04 CORRECT-18V0                     PIC -9(18).          NC2354.2
   000097         010100         04 FILLER                           PIC X.               NC2354.2
   000098         010200     03 FILLER PIC X(2) VALUE SPACE.                              NC2354.2 IMP
   000099         010300     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2354.2 IMP
   000100         010400 01  CCVS-C-1.                                                    NC2354.2
   000101         010500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2354.2
   000102         010600-    "SS  PARAGRAPH-NAME                                          NC2354.2
   000103         010700-    "       REMARKS".                                            NC2354.2
   000104         010800     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2354.2 IMP
   000105         010900 01  CCVS-C-2.                                                    NC2354.2
   000106         011000     02 FILLER                     PIC X        VALUE SPACE.      NC2354.2 IMP
   000107         011100     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2354.2
   000108         011200     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2354.2 IMP
   000109         011300     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2354.2
   000110         011400     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2354.2 IMP
   000111         011500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2354.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  REC-CT                        PIC 99       VALUE ZERO.       NC2354.2 IMP
   000113         011700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2354.2 IMP
   000114         011800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2354.2 IMP
   000115         011900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2354.2 IMP
   000116         012000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2354.2 IMP
   000117         012100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2354.2 IMP
   000118         012200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2354.2 IMP
   000119         012300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2354.2 IMP
   000120         012400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2354.2 IMP
   000121         012500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2354.2 IMP
   000122         012600 01  CCVS-H-1.                                                    NC2354.2
   000123         012700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2354.2 IMP
   000124         012800     02  FILLER                    PIC X(42)    VALUE             NC2354.2
   000125         012900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2354.2
   000126         013000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2354.2 IMP
   000127         013100 01  CCVS-H-2A.                                                   NC2354.2
   000128         013200   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2354.2 IMP
   000129         013300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2354.2
   000130         013400   02  FILLER                        PIC XXXX   VALUE             NC2354.2
   000131         013500     "4.2 ".                                                      NC2354.2
   000132         013600   02  FILLER                        PIC X(28)  VALUE             NC2354.2
   000133         013700            " COPY - NOT FOR DISTRIBUTION".                       NC2354.2
   000134         013800   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2354.2 IMP
   000135         013900                                                                  NC2354.2
   000136         014000 01  CCVS-H-2B.                                                   NC2354.2
   000137         014100   02  FILLER                        PIC X(15)  VALUE             NC2354.2
   000138         014200            "TEST RESULT OF ".                                    NC2354.2
   000139         014300   02  TEST-ID                       PIC X(9).                    NC2354.2
   000140         014400   02  FILLER                        PIC X(4)   VALUE             NC2354.2
   000141         014500            " IN ".                                               NC2354.2
   000142         014600   02  FILLER                        PIC X(12)  VALUE             NC2354.2
   000143         014700     " HIGH       ".                                              NC2354.2
   000144         014800   02  FILLER                        PIC X(22)  VALUE             NC2354.2
   000145         014900            " LEVEL VALIDATION FOR ".                             NC2354.2
   000146         015000   02  FILLER                        PIC X(58)  VALUE             NC2354.2
   000147         015100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2354.2
   000148         015200 01  CCVS-H-3.                                                    NC2354.2
   000149         015300     02  FILLER                      PIC X(34)  VALUE             NC2354.2
   000150         015400            " FOR OFFICIAL USE ONLY    ".                         NC2354.2
   000151         015500     02  FILLER                      PIC X(58)  VALUE             NC2354.2
   000152         015600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2354.2
   000153         015700     02  FILLER                      PIC X(28)  VALUE             NC2354.2
   000154         015800            "  COPYRIGHT   1985 ".                                NC2354.2
   000155         015900 01  CCVS-E-1.                                                    NC2354.2
   000156         016000     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2354.2 IMP
   000157         016100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2354.2
   000158         016200     02 ID-AGAIN                     PIC X(9).                    NC2354.2
   000159         016300     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2354.2 IMP
   000160         016400 01  CCVS-E-2.                                                    NC2354.2
   000161         016500     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2354.2 IMP
   000162         016600     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2354.2 IMP
   000163         016700     02 CCVS-E-2-2.                                               NC2354.2
   000164         016800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2354.2 IMP
   000165         016900         03 FILLER                   PIC X      VALUE SPACE.      NC2354.2 IMP
   000166         017000         03 ENDER-DESC               PIC X(44)  VALUE             NC2354.2
   000167         017100            "ERRORS ENCOUNTERED".                                 NC2354.2
   000168         017200 01  CCVS-E-3.                                                    NC2354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02  FILLER                      PIC X(22)  VALUE             NC2354.2
   000170         017400            " FOR OFFICIAL USE ONLY".                             NC2354.2
   000171         017500     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2354.2 IMP
   000172         017600     02  FILLER                      PIC X(58)  VALUE             NC2354.2
   000173         017700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2354.2
   000174         017800     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2354.2 IMP
   000175         017900     02 FILLER                       PIC X(15)  VALUE             NC2354.2
   000176         018000             " COPYRIGHT 1985".                                   NC2354.2
   000177         018100 01  CCVS-E-4.                                                    NC2354.2
   000178         018200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2354.2 IMP
   000179         018300     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2354.2
   000180         018400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2354.2 IMP
   000181         018500     02 FILLER                       PIC X(40)  VALUE             NC2354.2
   000182         018600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2354.2
   000183         018700 01  XXINFO.                                                      NC2354.2
   000184         018800     02 FILLER                       PIC X(19)  VALUE             NC2354.2
   000185         018900            "*** INFORMATION ***".                                NC2354.2
   000186         019000     02 INFO-TEXT.                                                NC2354.2
   000187         019100       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2354.2 IMP
   000188         019200       04 XXCOMPUTED                 PIC X(20).                   NC2354.2
   000189         019300       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2354.2 IMP
   000190         019400       04 XXCORRECT                  PIC X(20).                   NC2354.2
   000191         019500     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2354.2
   000192         019600 01  HYPHEN-LINE.                                                 NC2354.2
   000193         019700     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2354.2 IMP
   000194         019800     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2354.2
   000195         019900-    "*****************************************".                 NC2354.2
   000196         020000     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2354.2
   000197         020100-    "******************************".                            NC2354.2
   000198         020200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2354.2
   000199         020300     "NC235A".                                                    NC2354.2
   000200         020400 PROCEDURE DIVISION.                                              NC2354.2
   000201         020500 CCVS1 SECTION.                                                   NC2354.2
   000202         020600 OPEN-FILES.                                                      NC2354.2
   000203         020700     OPEN     OUTPUT PRINT-FILE.                                  NC2354.2 36
   000204         020800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2354.2 198 139 198 158
   000205         020900     MOVE    SPACE TO TEST-RESULTS.                               NC2354.2 IMP 59
   000206         021000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2354.2 231 236
   000207         021100     GO TO CCVS1-EXIT.                                            NC2354.2 313
   000208         021200 CLOSE-FILES.                                                     NC2354.2
   000209         021300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2354.2 240 261 36
   000210         021400 TERMINATE-CCVS.                                                  NC2354.2
   000211         021500     EXIT PROGRAM.                                                NC2354.2
   000212         021600 TERMINATE-CALL.                                                  NC2354.2
   000213         021700     STOP     RUN.                                                NC2354.2
   000214         021800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2354.2 63 115
   000215         021900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2354.2 63 116
   000216         022000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2354.2 63 114
   000217         022100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2354.2 63 113
   000218         022200     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2354.2 70
   000219         022300 PRINT-DETAIL.                                                    NC2354.2
   000220         022400     IF REC-CT NOT EQUAL TO ZERO                                  NC2354.2 112 IMP
   000221      1  022500             MOVE "." TO PARDOT-X                                 NC2354.2 67
   000222      1  022600             MOVE REC-CT TO DOTVALUE.                             NC2354.2 112 68
   000223         022700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2354.2 59 37 273
   000224         022800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2354.2 63 273
   000225      1  022900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2354.2 290 303
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  023000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2354.2 304 312
   000227         023100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2354.2 IMP 63 IMP 75
   000228         023200     MOVE SPACE TO CORRECT-X.                                     NC2354.2 IMP 89
   000229         023300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2354.2 112 IMP IMP 65
   000230         023400     MOVE     SPACE TO RE-MARK.                                   NC2354.2 IMP 70
   000231         023500 HEAD-ROUTINE.                                                    NC2354.2
   000232         023600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2354.2 122 38 273
   000233         023700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2354.2 127 38 273
   000234         023800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2354.2 136 38 273
   000235         023900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2354.2 148 38 273
   000236         024000 COLUMN-NAMES-ROUTINE.                                            NC2354.2
   000237         024100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2354.2 100 38 273
   000238         024200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2354.2 105 38 273
   000239         024300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2354.2 192 38 273
   000240         024400 END-ROUTINE.                                                     NC2354.2
   000241         024500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2354.2 192 38 273
   000242         024600 END-RTN-EXIT.                                                    NC2354.2
   000243         024700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2354.2 155 38 273
   000244         024800 END-ROUTINE-1.                                                   NC2354.2
   000245         024900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2354.2 114 118 115
   000246         025000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2354.2 118 113 118
   000247         025100      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2354.2 116 118
   000248         025200*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2354.2
   000249         025300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2354.2 116 178
   000250         025400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2354.2 118 180
   000251         025500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2354.2 177 163
   000252         025600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2354.2 160 38 273
   000253         025700  END-ROUTINE-12.                                                 NC2354.2
   000254         025800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2354.2 166
   000255         025900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2354.2 114 IMP
   000256      1  026000         MOVE "NO " TO ERROR-TOTAL                                NC2354.2 164
   000257         026100         ELSE                                                     NC2354.2
   000258      1  026200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2354.2 114 164
   000259         026300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2354.2 160 38
   000260         026400     PERFORM WRITE-LINE.                                          NC2354.2 273
   000261         026500 END-ROUTINE-13.                                                  NC2354.2
   000262         026600     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2354.2 113 IMP
   000263      1  026700         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2354.2 164
   000264      1  026800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2354.2 113 164
   000265         026900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2354.2 166
   000266         027000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2354.2 160 38 273
   000267         027100      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2354.2 115 IMP
   000268      1  027200          MOVE "NO " TO ERROR-TOTAL                               NC2354.2 164
   000269      1  027300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2354.2 115 164
   000270         027400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2354.2 166
   000271         027500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2354.2 160 38 273
   000272         027600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2354.2 168 38 273
   000273         027700 WRITE-LINE.                                                      NC2354.2
   000274         027800     ADD 1 TO RECORD-COUNT.                                       NC2354.2 120
   000275         027900     IF RECORD-COUNT GREATER 50                                   NC2354.2 120
   000276      1  028000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2354.2 38 119
   000277      1  028100         MOVE SPACE TO DUMMY-RECORD                               NC2354.2 IMP 38
   000278      1  028200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2354.2 38
   000279      1  028300         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2354.2 100 38 285
   000280      1  028400         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2354.2 105 38 285
   000281      1  028500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2354.2 192 38 285
   000282      1  028600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2354.2 119 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700         MOVE ZERO TO RECORD-COUNT.                               NC2354.2 IMP 120
   000284         028800     PERFORM WRT-LN.                                              NC2354.2 285
   000285         028900 WRT-LN.                                                          NC2354.2
   000286         029000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2354.2 38
   000287         029100     MOVE SPACE TO DUMMY-RECORD.                                  NC2354.2 IMP 38
   000288         029200 BLANK-LINE-PRINT.                                                NC2354.2
   000289         029300     PERFORM WRT-LN.                                              NC2354.2 285
   000290         029400 FAIL-ROUTINE.                                                    NC2354.2
   000291         029500     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2354.2 75 IMP 298
   000292         029600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2354.2 89 IMP 298
   000293         029700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2354.2 121 191
   000294         029800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2354.2 186
   000295         029900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2354.2 183 38 273
   000296         030000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2354.2 IMP 191
   000297         030100     GO TO  FAIL-ROUTINE-EX.                                      NC2354.2 303
   000298         030200 FAIL-ROUTINE-WRITE.                                              NC2354.2
   000299         030300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2354.2 71 37 273
   000300         030400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2354.2 121 99
   000301         030500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2354.2 86 37 273
   000302         030600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2354.2 IMP 99
   000303         030700 FAIL-ROUTINE-EX. EXIT.                                           NC2354.2
   000304         030800 BAIL-OUT.                                                        NC2354.2
   000305         030900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2354.2 76 IMP 307
   000306         031000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2354.2 90 IMP 312
   000307         031100 BAIL-OUT-WRITE.                                                  NC2354.2
   000308         031200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2354.2 90 190 76 188
   000309         031300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2354.2 121 191
   000310         031400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2354.2 183 38 273
   000311         031500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2354.2 IMP 191
   000312         031600 BAIL-OUT-EX. EXIT.                                               NC2354.2
   000313         031700 CCVS1-EXIT.                                                      NC2354.2
   000314         031800     EXIT.                                                        NC2354.2
   000315         031900 SECT-NC235A-001 SECTION.                                         NC2354.2
   000316         032000 TH-08-001.                                                       NC2354.2
   000317         032100 INIT-TBL-TH309.                                                  NC2354.2

 ==000317==> IGYPS2015-I The paragraph or section prior to paragraph or section "INIT-TBL-TH309"
                         did not contain any statements.

   000318         032200     MOVE "ZZYYXXWWVVUUTTSSRRQQPPOONNMMLLKKJJIIHHGGFFEEDDCCBBAA"  NC2354.2
   000319         032300         TO TBL-TH309.                                            NC2354.2 42
   000320         032400     IF FIRSTZ (1)               AND LASTA (26)                   NC2354.2 46 47
   000321      1  032500         MOVE "26 ENTRY TABLE CONSTRUCTED " TO RE-MARK            NC2354.2 70
   000322      1  032600         GO TO INIT-WRITE.                                        NC2354.2 325
   000323         032700     MOVE "TBL ENTRIES BUILT INCORRECT" TO RE-MARK.               NC2354.2 70
   000324         032800     MOVE "*****" TO CORRECT-A  COMPUTED-A.                       NC2354.2 90 76
   000325         032900 INIT-WRITE.                                                      NC2354.2
   000326         033000     MOVE "INIT-TBL-TH309" TO PAR-NAME.                           NC2354.2 65
   000327         033100     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000328         033200     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000329         033300*                                                                 NC2354.2
   000330         033400 IDX-INIT-F2-1.                                                   NC2354.2
   000331         033500     MOVE "IDX-TEST-F2-1 " TO PAR-NAME.                           NC2354.2 65
   000332         033600     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000333         033700     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000334         033800     SET IDX-2 TO 26.                                             NC2354.2 44
   000335         033900 IDX-TEST-F2-1.                                                   NC2354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000336         034000     SEARCH ALL TH309-ENTRY AT END                                NC2354.2 43
   000337      1  034100          GO TO IDX-FAIL-F2-1                                     NC2354.2 344
   000338      1  034200      WHEN DEC-KEY (IDX-1) EQUAL TO "BB" NEXT SENTENCE.           NC2354.2 45 44
   000339         034300     PERFORM PASS.                                                NC2354.2 215
   000340         034400     GO TO IDX-WRITE-F2-1.                                        NC2354.2 349
   000341         034500 IDX-DELETE-F2-1.                                                 NC2354.2
   000342         034600     PERFORM DE-LETE                                              NC2354.2 217
   000343         034700     GO TO IDX-WRITE-F2-1.                                        NC2354.2 349
   000344         034800 IDX-FAIL-F2-1.                                                   NC2354.2
   000345         034900     MOVE 25 TO SUB-1                                             NC2354.2 41
   000346         035000     MOVE "BB" TO CORRECT-A                                       NC2354.2 90
   000347         035100     PERFORM PUTOUT-COMPUTED-A.                                   NC2354.2 615
   000348         035200     PERFORM FAIL.                                                NC2354.2 216
   000349         035300 IDX-WRITE-F2-1.                                                  NC2354.2
   000350         035400     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000351         035500*                                                                 NC2354.2
   000352         035600 IDX-INIT-F2-2.                                                   NC2354.2
   000353         035700     MOVE "IDX-TEST-F2-2 " TO PAR-NAME.                           NC2354.2 65
   000354         035800     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000355         035900     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000356         036000     SET IDX-3 TO 01.                                             NC2354.2 44
   000357         036100 IDX-TEST-F2-2.                                                   NC2354.2
   000358         036200     SEARCH ALL TH309-ENTRY AT END                                NC2354.2 43
   000359      1  036300         GO TO IDX-FAIL-F2-2                                      NC2354.2 366
   000360         036400      WHEN DEC-KEY (IDX-1) EQUAL TO "XX"                          NC2354.2 45 44
   000361      1  036500         PERFORM PASS                                             NC2354.2 215
   000362      1  036600         GO TO IDX-WRITE-F2-2.                                    NC2354.2 371
   000363         036700 IDX-DELETE-F2-2.                                                 NC2354.2
   000364         036800     PERFORM DE-LETE.                                             NC2354.2 217
   000365         036900     GO TO IDX-WRITE-F2-2.                                        NC2354.2 371
   000366         037000 IDX-FAIL-F2-2.                                                   NC2354.2
   000367         037100     MOVE 03 TO SUB-1                                             NC2354.2 41
   000368         037200     MOVE "XX" TO CORRECT-A                                       NC2354.2 90
   000369         037300     PERFORM PUTOUT-COMPUTED-A.                                   NC2354.2 615
   000370         037400     PERFORM FAIL.                                                NC2354.2 216
   000371         037500 IDX-WRITE-F2-2.                                                  NC2354.2
   000372         037600     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000373         037700*                                                                 NC2354.2
   000374         037800 IDX-INIT-F2-3.                                                   NC2354.2
   000375         037900     MOVE "IDX-TEST-F2-3 " TO PAR-NAME.                           NC2354.2 65
   000376         038000     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000377         038100     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000378         038200     MOVE 25 TO TBL-LENGTH.                                       NC2354.2 40
   000379         038300 IDX-TEST-F2-3.                                                   NC2354.2
   000380         038400     SEARCH ALL TH309-ENTRY AT END                                NC2354.2 43
   000381      1  038500         PERFORM PASS                                             NC2354.2 215
   000382      1  038600         GO TO IDX-WRITE-F2-3                                     NC2354.2 392
   000383         038700      WHEN DEC-KEY (IDX-1) EQUAL TO "AA"                          NC2354.2 45 44
   000384      1  038800         GO TO IDX-FAIL-F2-3.                                     NC2354.2 388
   000385         038900 IDX-DELETE-F2-3.                                                 NC2354.2
   000386         039000     PERFORM DE-LETE.                                             NC2354.2 217
   000387         039100     GO TO IDX-WRITE-F2-3.                                        NC2354.2 392
   000388         039200 IDX-FAIL-F2-3.                                                   NC2354.2
   000389         039300     MOVE "ENTRY SHOULD NOT BE FOUND  " TO RE-MARK                NC2354.2 70
   000390         039400     MOVE "AA" TO COMPUTED-A                                      NC2354.2 76
   000391         039500     PERFORM FAIL.                                                NC2354.2 216
   000392         039600 IDX-WRITE-F2-3.                                                  NC2354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393         039700     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000394         039800*                                                                 NC2354.2
   000395         039900 IDX-INIT-F1-4.                                                   NC2354.2
   000396         040000     MOVE "IDX-TEST-F1-4" TO PAR-NAME.                            NC2354.2 65
   000397         040100     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000398         040200     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000399         040300     MOVE 24 TO TBL-LENGTH.                                       NC2354.2 40
   000400         040400     SET IDX-3 TO 01.                                             NC2354.2 44
   000401         040500 IDX-TEST-F1-4.                                                   NC2354.2
   000402         040600     SEARCH TH309-ENTRY VARYING IDX-3 AT END                      NC2354.2 43 44
   000403      1  040700         PERFORM PASS                                             NC2354.2 215
   000404      1  040800         GO TO IDX-WRITE-F1-4                                     NC2354.2 414
   000405         040900      WHEN DEC-KEY (IDX-3) EQUAL TO "BB"                          NC2354.2 45 44
   000406      1  041000         GO TO IDX-FAIL-F1-4.                                     NC2354.2 410
   000407         041100 IDX-DELETE-F1-4.                                                 NC2354.2
   000408         041200     PERFORM DE-LETE.                                             NC2354.2 217
   000409         041300     GO TO IDX-WRITE-F1-4.                                        NC2354.2 414
   000410         041400 IDX-FAIL-F1-4.                                                   NC2354.2
   000411         041500     MOVE "ENTRY SHOULD NOT BE FOUND  " TO RE-MARK                NC2354.2 70
   000412         041600     MOVE "BB" TO COMPUTED-A                                      NC2354.2 76
   000413         041700     PERFORM FAIL.                                                NC2354.2 216
   000414         041800 IDX-WRITE-F1-4.                                                  NC2354.2
   000415         041900     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000416         042000*                                                                 NC2354.2
   000417         042100 IDX-INIT-F1-5.                                                   NC2354.2
   000418         042200     MOVE "IDX-TEST-F1-5 " TO PAR-NAME.                           NC2354.2 65
   000419         042300     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000420         042400     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000421         042500     SET IDX-2 TO 01.                                             NC2354.2 44
   000422         042600 IDX-TEST-F1-5.                                                   NC2354.2
   000423         042700     SEARCH TH309-ENTRY VARYING IDX-2 AT END                      NC2354.2 43 44
   000424      1  042800         GO TO IDX-FAIL-F1-5                                      NC2354.2 431
   000425         042900     WHEN DEC-KEY (IDX-2) EQUAL TO "KK"                           NC2354.2 45 44
   000426      1  043000         PERFORM PASS                                             NC2354.2 215
   000427      1  043100         GO TO IDX-WRITE-F1-5.                                    NC2354.2 436
   000428         043200 IDX-DELETE-F1-5.                                                 NC2354.2
   000429         043300     PERFORM DE-LETE.                                             NC2354.2 217
   000430         043400     GO TO IDX-WRITE-F1-5.                                        NC2354.2 436
   000431         043500 IDX-FAIL-F1-5.                                                   NC2354.2
   000432         043600     MOVE 16 TO SUB-1                                             NC2354.2 41
   000433         043700     MOVE "KK" TO CORRECT-A                                       NC2354.2 90
   000434         043800     PERFORM PUTOUT-COMPUTED-A.                                   NC2354.2 615
   000435         043900     PERFORM FAIL.                                                NC2354.2 216
   000436         044000 IDX-WRITE-F1-5.                                                  NC2354.2
   000437         044100     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000438         044200*                                                                 NC2354.2
   000439         044300 IDX-INIT-F1-6.                                                   NC2354.2
   000440         044400     MOVE "IDX-TEST-F1-6 " TO PAR-NAME.                           NC2354.2 65
   000441         044500     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000442         044600     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000443         044700     MOVE 22 TO TBL-LENGTH.                                       NC2354.2 40
   000444         044800     SET IDX-1 TO 09.                                             NC2354.2 44
   000445         044900 IDX-TEST-F1-6.                                                   NC2354.2
   000446         045000     SEARCH TH309-ENTRY VARYING IDX-1 AT END                      NC2354.2 43 44
   000447      1  045100         PERFORM PASS                                             NC2354.2 215
   000448      1  045200         GO TO IDX-WRITE-F1-6                                     NC2354.2 458
   000449         045300     WHEN TH309-ENTRY (IDX-1) EQUAL TO "DD"                       NC2354.2 43 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450      1  045400         GO TO IDX-FAIL-F1-6.                                     NC2354.2 454
   000451         045500 IDX-DELETE-F1-6.                                                 NC2354.2
   000452         045600     PERFORM DE-LETE.                                             NC2354.2 217
   000453         045700     GO TO IDX-WRITE-F1-6.                                        NC2354.2 458
   000454         045800 IDX-FAIL-F1-6.                                                   NC2354.2
   000455         045900     MOVE "ENTRY SHOULD NOT BE FOUND  " TO RE-MARK                NC2354.2 70
   000456         046000     MOVE "DD" TO COMPUTED-A                                      NC2354.2 76
   000457         046100     PERFORM FAIL.                                                NC2354.2 216
   000458         046200 IDX-WRITE-F1-6.                                                  NC2354.2
   000459         046300     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000460         046400*                                                                 NC2354.2
   000461         046500 IDX-INIT-F1-7.                                                   NC2354.2
   000462         046600     MOVE "IDX-TEST-F1-7 " TO PAR-NAME.                           NC2354.2 65
   000463         046700     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000464         046800     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000465         046900     MOVE 22 TO TBL-LENGTH.                                       NC2354.2 40
   000466         047000     SET IDX-3 TO 23.                                             NC2354.2 44
   000467         047100 IDX-TEST-F1-7.                                                   NC2354.2
   000468         047200     SEARCH TH309-ENTRY VARYING IDX-3 AT END                      NC2354.2 43 44
   000469      1  047300         PERFORM PASS                                             NC2354.2 215
   000470      1  047400         GO TO IDX-WRITE-F1-7                                     NC2354.2 480
   000471         047500     WHEN TH309-ENTRY (IDX-3) EQUAL TO "DD"                       NC2354.2 43 44
   000472      1  047600         GO TO IDX-FAIL-F1-7.                                     NC2354.2 476
   000473         047700 IDX-DELETE-F1-7.                                                 NC2354.2
   000474         047800     PERFORM DE-LETE.                                             NC2354.2 217
   000475         047900     GO TO IDX-WRITE-F1-7.                                        NC2354.2 480
   000476         048000 IDX-FAIL-F1-7.                                                   NC2354.2
   000477         048100     MOVE "ENTRY SHOULD NOT BE FOUND  " TO RE-MARK                NC2354.2 70
   000478         048200     MOVE "DD" TO COMPUTED-A                                      NC2354.2 76
   000479         048300     PERFORM FAIL.                                                NC2354.2 216
   000480         048400 IDX-WRITE-F1-7.                                                  NC2354.2
   000481         048500     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000482         048600*                                                                 NC2354.2
   000483         048700 IDX-INIT-F2-8.                                                   NC2354.2
   000484         048800     MOVE "IDX-TEST-F2-8 " TO PAR-NAME.                           NC2354.2 65
   000485         048900     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000486         049000     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000487         049100     MOVE 20 TO TBL-LENGTH.                                       NC2354.2 40
   000488         049200     SET IDX-2 TO 21.                                             NC2354.2 44
   000489         049300 IDX-TEST-F2-8.                                                   NC2354.2
   000490         049400     SEARCH ALL TH309-ENTRY AT END                                NC2354.2 43
   000491      1  049500         GO TO IDX-FAIL-F2-8                                      NC2354.2 498
   000492         049600     WHEN DEC-KEY (IDX-1) EQUAL TO "GG"                           NC2354.2 45 44
   000493      1  049700         PERFORM PASS                                             NC2354.2 215
   000494      1  049800         GO TO IDX-WRITE-F2-8.                                    NC2354.2 503
   000495         049900 IDX-DELETE-F2-8.                                                 NC2354.2
   000496         050000     PERFORM DE-LETE.                                             NC2354.2 217
   000497         050100     GO TO IDX-WRITE-F2-8.                                        NC2354.2 503
   000498         050200 IDX-FAIL-F2-8.                                                   NC2354.2
   000499         050300     MOVE 20 TO SUB-1                                             NC2354.2 41
   000500         050400     MOVE "GG" TO CORRECT-A                                       NC2354.2 90
   000501         050500     PERFORM PUTOUT-COMPUTED-A.                                   NC2354.2 615
   000502         050600     PERFORM FAIL.                                                NC2354.2 216
   000503         050700 IDX-WRITE-F2-8.                                                  NC2354.2
   000504         050800     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000505         050900*                                                                 NC2354.2
   000506         051000 IDX-INIT-F2-9.                                                   NC2354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051100     MOVE "IDX-TEST-F2-9 " TO PAR-NAME.                           NC2354.2 65
   000508         051200     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000509         051300     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000510         051400     MOVE 20 TO TBL-LENGTH.                                       NC2354.2 40
   000511         051500 IDX-TEST-F2-9.                                                   NC2354.2
   000512         051600     SEARCH ALL TH309-ENTRY AT END                                NC2354.2 43
   000513      1  051700         PERFORM PASS                                             NC2354.2 215
   000514      1  051800         GO TO IDX-WRITE-F2-9                                     NC2354.2 524
   000515         051900     WHEN   LASTA (IDX-1)                                         NC2354.2 47 44
   000516      1  052000         GO TO IDX-FAIL-F2-9.                                     NC2354.2 520
   000517         052100 IDX-DELETE-F2-9.                                                 NC2354.2
   000518         052200     PERFORM DE-LETE.                                             NC2354.2 217
   000519         052300     GO TO IDX-WRITE-F2-9.                                        NC2354.2 524
   000520         052400 IDX-FAIL-F2-9.                                                   NC2354.2
   000521         052500     MOVE "CONDITION-NAME TEST" TO RE-MARK                        NC2354.2 70
   000522         052600     PERFORM FAIL                                                 NC2354.2 216
   000523         052700     MOVE "AA" TO COMPUTED-A.                                     NC2354.2 76
   000524         052800 IDX-WRITE-F2-9.                                                  NC2354.2
   000525         052900     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000526         053000*                                                                 NC2354.2
   000527         053100 IDX-INIT-F2-10.                                                  NC2354.2
   000528         053200     MOVE "IDX-TEST-F2-10 " TO PAR-NAME.                          NC2354.2 65
   000529         053300     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000530         053400     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000531         053500     SET IDX-1, IDX-2, IDX-3 TO 10.                               NC2354.2 44 44 44
   000532         053600 IDX-TEST-F2-10.                                                  NC2354.2
   000533         053700     SEARCH ALL TH309-ENTRY AT END                                NC2354.2 43
   000534      1  053800         GO TO IDX-FAIL-F2-10                                     NC2354.2 541
   000535         053900     WHEN DEC-KEY (IDX-1) EQUAL TO "RR"                           NC2354.2 45 44
   000536      1  054000         PERFORM PASS                                             NC2354.2 215
   000537      1  054100         GO TO IDX-WRITE-F2-10.                                   NC2354.2 546
   000538         054200 IDX-DELETE-F2-10.                                                NC2354.2
   000539         054300     PERFORM DE-LETE.                                             NC2354.2 217
   000540         054400     GO TO IDX-WRITE-F2-10.                                       NC2354.2 546
   000541         054500 IDX-FAIL-F2-10.                                                  NC2354.2
   000542         054600     MOVE 9 TO SUB-1                                              NC2354.2 41
   000543         054700     MOVE "RR" TO CORRECT-A                                       NC2354.2 90
   000544         054800     PERFORM PUTOUT-COMPUTED-A.                                   NC2354.2 615
   000545         054900     PERFORM FAIL.                                                NC2354.2 216
   000546         055000 IDX-WRITE-F2-10.                                                 NC2354.2
   000547         055100     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000548         055200*                                                                 NC2354.2
   000549         055300 IDX-INIT-F2-11.                                                  NC2354.2
   000550         055400     MOVE "IDX-TEST-F2-11 " TO PAR-NAME.                          NC2354.2 65
   000551         055500     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000552         055600     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000553         055700     MOVE 1 TO TBL-LENGTH.                                        NC2354.2 40
   000554         055800 IDX-TEST-F2-11.                                                  NC2354.2
   000555         055900     SEARCH ALL TH309-ENTRY AT END                                NC2354.2 43
   000556      1  056000         PERFORM PASS                                             NC2354.2 215
   000557      1  056100         GO TO IDX-WRITE-F2-11                                    NC2354.2 568
   000558         056200     WHEN DEC-KEY (IDX-1) EQUAL TO "YY"                           NC2354.2 45 44
   000559      1  056300         GO TO IDX-FAIL-F2-11.                                    NC2354.2 563
   000560         056400 IDX-DELETE-F2-11.                                                NC2354.2
   000561         056500     PERFORM DE-LETE.                                             NC2354.2 217
   000562         056600     GO TO IDX-WRITE-F2-11.                                       NC2354.2 568
   000563         056700 IDX-FAIL-F2-11.                                                  NC2354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564         056800     MOVE 2 TO SUB-1                                              NC2354.2 41
   000565         056900     MOVE "YY" TO COMPUTED-A                                      NC2354.2 76
   000566         057000     MOVE "ENTRY SHOULD NOT BE FOUND" TO RE-MARK                  NC2354.2 70
   000567         057100     PERFORM FAIL.                                                NC2354.2 216
   000568         057200 IDX-WRITE-F2-11.                                                 NC2354.2
   000569         057300     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000570         057400*                                                                 NC2354.2
   000571         057500 IDX-INIT-F2-12.                                                  NC2354.2
   000572         057600     MOVE "IDX-TEST-F2-12 " TO PAR-NAME.                          NC2354.2 65
   000573         057700     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000574         057800     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000575         057900     MOVE 10 TO TBL-LENGTH.                                       NC2354.2 40
   000576         058000 IDX-TEST-F2-12.                                                  NC2354.2
   000577         058100     SEARCH ALL TH309-ENTRY AT END                                NC2354.2 43
   000578      1  058200         PERFORM PASS                                             NC2354.2 215
   000579      1  058300         GO TO IDX-WRITE-F2-12                                    NC2354.2 590
   000580         058400     WHEN MIDDLE-PP (IDX-1)                                       NC2354.2 48 44
   000581      1  058500         GO TO IDX-FAIL-F2-12.                                    NC2354.2 585
   000582         058600 IDX-DELETE-F2-12.                                                NC2354.2
   000583         058700     PERFORM DE-LETE.                                             NC2354.2 217
   000584         058800     GO TO IDX-WRITE-F2-12.                                       NC2354.2 590
   000585         058900 IDX-FAIL-F2-12.                                                  NC2354.2
   000586         059000     MOVE 10 TO SUB-1                                             NC2354.2 41
   000587         059100     MOVE "ENTRY SHOULD NOT BE FOUND " TO RE-MARK                 NC2354.2 70
   000588         059200     MOVE "PP" TO COMPUTED-A                                      NC2354.2 76
   000589         059300     PERFORM FAIL.                                                NC2354.2 216
   000590         059400 IDX-WRITE-F2-12.                                                 NC2354.2
   000591         059500     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000592         059600*                                                                 NC2354.2
   000593         059700 IDX-INIT-F2-13.                                                  NC2354.2
   000594         059800     MOVE "IDX-TEST-F2-13 " TO PAR-NAME.                          NC2354.2 65
   000595         059900     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2354.2 121
   000596         060000     MOVE "LEVEL 3 TBL HANDLING" TO FEATURE.                      NC2354.2 61
   000597         060100     MOVE 2 TO TBL-LENGTH.                                        NC2354.2 40
   000598         060200 IDX-TEST-F2-13.                                                  NC2354.2
   000599         060300     SEARCH ALL TH309-ENTRY AT END                                NC2354.2 43
   000600      1  060400         PERFORM PASS                                             NC2354.2 215
   000601      1  060500         GO TO IDX-WRITE-F2-13                                    NC2354.2 611
   000602         060600     WHEN DEC-KEY (IDX-1) EQUAL TO "XX"                           NC2354.2 45 44
   000603      1  060700         GO TO IDX-FAIL-F2-13.                                    NC2354.2 607
   000604         060800 IDX-DELETE-F2-13.                                                NC2354.2
   000605         060900     PERFORM DE-LETE.                                             NC2354.2 217
   000606         061000     GO TO IDX-WRITE-F2-13.                                       NC2354.2 611
   000607         061100 IDX-FAIL-F2-13.                                                  NC2354.2
   000608         061200     MOVE "XX" TO COMPUTED-A                                      NC2354.2 76
   000609         061300     MOVE "ENTRY SHOULD NOT BE FOUND " TO RE-MARK                 NC2354.2 70
   000610         061400     PERFORM FAIL.                                                NC2354.2 216
   000611         061500 IDX-WRITE-F2-13.                                                 NC2354.2
   000612         061600     PERFORM PRINT-DETAIL.                                        NC2354.2 219
   000613         061700     GO TO CCVS-EXIT.                                             NC2354.2 620
   000614         061800*                                                                 NC2354.2
   000615         061900 PUTOUT-COMPUTED-A.                                               NC2354.2
   000616         062000     IF TH309-ENTRY (SUB-1) EQUAL TO CORRECT-A                    NC2354.2 43 41 90
   000617      1  062100         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2354.2 70
   000618      1  062200     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK.                 NC2354.2 70
   000619         062300     MOVE TH309-ENTRY (SUB-1) TO COMPUTED-A.                      NC2354.2 43 41 76
   000620         062400 CCVS-EXIT SECTION.                                               NC2354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000621         062500 CCVS-999999.                                                     NC2354.2
   000622         062600     GO TO CLOSE-FILES.                                           NC2354.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      121   ANSI-REFERENCE . . . . . . . .  293 300 309 M332 M354 M376 M397 M419 M441 M463 M485 M508 M529 M551 M573 M595
      100   CCVS-C-1 . . . . . . . . . . .  237 279
      105   CCVS-C-2 . . . . . . . . . . .  238 280
      155   CCVS-E-1 . . . . . . . . . . .  243
      160   CCVS-E-2 . . . . . . . . . . .  252 259 266 271
      163   CCVS-E-2-2 . . . . . . . . . .  M251
      168   CCVS-E-3 . . . . . . . . . . .  272
      177   CCVS-E-4 . . . . . . . . . . .  251
      178   CCVS-E-4-1 . . . . . . . . . .  M249
      180   CCVS-E-4-2 . . . . . . . . . .  M250
      122   CCVS-H-1 . . . . . . . . . . .  232
      127   CCVS-H-2A. . . . . . . . . . .  233
      136   CCVS-H-2B. . . . . . . . . . .  234
      148   CCVS-H-3 . . . . . . . . . . .  235
      198   CCVS-PGM-ID. . . . . . . . . .  204 204
       82   CM-18V0
       76   COMPUTED-A . . . . . . . . . .  77 79 80 81 82 305 308 M324 M390 M412 M456 M478 M523 M565 M588 M608 M619
       77   COMPUTED-N
       75   COMPUTED-X . . . . . . . . . .  M227 291
       79   COMPUTED-0V18
       81   COMPUTED-14V4
       83   COMPUTED-18V0
       80   COMPUTED-4V14
       99   COR-ANSI-REFERENCE . . . . . .  M300 M302
       90   CORRECT-A. . . . . . . . . . .  91 92 93 94 95 306 308 M324 M346 M368 M433 M500 M543 616
       91   CORRECT-N
       89   CORRECT-X. . . . . . . . . . .  M228 292
       92   CORRECT-0V18
       94   CORRECT-14V4
       96   CORRECT-18V0
       93   CORRECT-4V14
       95   CR-18V0
       45   DEC-KEY. . . . . . . . . . . .  44 338 360 383 405 425 492 535 558 602
      113   DELETE-COUNTER . . . . . . . .  M217 246 262 264
       68   DOTVALUE . . . . . . . . . . .  M222
      119   DUMMY-HOLD . . . . . . . . . .  M276 282
       38   DUMMY-RECORD . . . . . . . . .  M232 M233 M234 M235 M237 M238 M239 M241 M243 M252 M259 M266 M271 M272 276 M277
                                            278 M279 M280 M281 M282 286 M287 M295 M310
      166   ENDER-DESC . . . . . . . . . .  M254 M265 M270
      114   ERROR-COUNTER. . . . . . . . .  M216 245 255 258
      118   ERROR-HOLD . . . . . . . . . .  M245 M246 M246 M247 250
      164   ERROR-TOTAL. . . . . . . . . .  M256 M258 M263 M264 M268 M269
       61   FEATURE. . . . . . . . . . . .  M327 M333 M355 M377 M398 M420 M442 M464 M486 M509 M530 M552 M574 M596
       46   FIRSTZ . . . . . . . . . . . .  320
      192   HYPHEN-LINE. . . . . . . . . .  239 241 281
      158   ID-AGAIN . . . . . . . . . . .  M204
       44   IDX-1. . . . . . . . . . . . .  338 360 383 M444 M446 449 492 515 M531 535 558 580 602
       44   IDX-2. . . . . . . . . . . . .  M334 M421 M423 425 M488 M531
       44   IDX-3. . . . . . . . . . . . .  M356 M400 M402 405 M466 M468 471 M531
      191   INF-ANSI-REFERENCE . . . . . .  M293 M296 M309 M311
      186   INFO-TEXT. . . . . . . . . . .  M294
      115   INSPECT-COUNTER. . . . . . . .  M214 245 267 269
       47   LASTA. . . . . . . . . . . . .  320 515
       48   MIDDLE-PP. . . . . . . . . . .  580
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    16
0 Defined   Cross-reference of data names   References

0      49   NOTE-1
       54   NOTE-2
       63   P-OR-F . . . . . . . . . . . .  M214 M215 M216 M217 224 M227
       65   PAR-NAME . . . . . . . . . . .  M229 M326 M331 M353 M375 M396 M418 M440 M462 M484 M507 M528 M550 M572 M594
       67   PARDOT-X . . . . . . . . . . .  M221
      116   PASS-COUNTER . . . . . . . . .  M215 247 249
       36   PRINT-FILE . . . . . . . . . .  32 203 209
       37   PRINT-REC. . . . . . . . . . .  M223 M299 M301
       70   RE-MARK. . . . . . . . . . . .  M218 M230 M321 M323 M389 M411 M455 M477 M521 M566 M587 M609 M617 M618
      112   REC-CT . . . . . . . . . . . .  220 222 229
      111   REC-SKL-SUB
      120   RECORD-COUNT . . . . . . . . .  M274 275 M283
       41   SUB-1. . . . . . . . . . . . .  M345 M367 M432 M499 M542 M564 M586 616 619
       40   TBL-LENGTH . . . . . . . . . .  43 M378 M399 M443 M465 M487 M510 M553 M575 M597
       42   TBL-TH309. . . . . . . . . . .  M319
       71   TEST-COMPUTED. . . . . . . . .  299
       86   TEST-CORRECT . . . . . . . . .  301
      139   TEST-ID. . . . . . . . . . . .  M204
       59   TEST-RESULTS . . . . . . . . .  M205 223
       43   TH309-ENTRY. . . . . . . . . .  336 358 380 402 423 446 449 468 471 490 512 533 555 577 599 616 619
      117   TOTAL-ERROR
      188   XXCOMPUTED . . . . . . . . . .  M308
      190   XXCORRECT. . . . . . . . . . .  M308
      183   XXINFO . . . . . . . . . . . .  295 310
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    17
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

      304   BAIL-OUT . . . . . . . . . . .  P226
      312   BAIL-OUT-EX. . . . . . . . . .  E226 G306
      307   BAIL-OUT-WRITE . . . . . . . .  G305
      288   BLANK-LINE-PRINT
      620   CCVS-EXIT. . . . . . . . . . .  G613
      621   CCVS-999999
      201   CCVS1
      313   CCVS1-EXIT . . . . . . . . . .  G207
      208   CLOSE-FILES. . . . . . . . . .  G622
      236   COLUMN-NAMES-ROUTINE . . . . .  E206
      217   DE-LETE. . . . . . . . . . . .  P342 P364 P386 P408 P429 P452 P474 P496 P518 P539 P561 P583 P605
      240   END-ROUTINE. . . . . . . . . .  P209
      244   END-ROUTINE-1
      253   END-ROUTINE-12
      261   END-ROUTINE-13 . . . . . . . .  E209
      242   END-RTN-EXIT
      216   FAIL . . . . . . . . . . . . .  P348 P370 P391 P413 P435 P457 P479 P502 P522 P545 P567 P589 P610
      290   FAIL-ROUTINE . . . . . . . . .  P225
      303   FAIL-ROUTINE-EX. . . . . . . .  E225 G297
      298   FAIL-ROUTINE-WRITE . . . . . .  G291 G292
      231   HEAD-ROUTINE . . . . . . . . .  P206
      407   IDX-DELETE-F1-4
      428   IDX-DELETE-F1-5
      451   IDX-DELETE-F1-6
      473   IDX-DELETE-F1-7
      341   IDX-DELETE-F2-1
      538   IDX-DELETE-F2-10
      560   IDX-DELETE-F2-11
      582   IDX-DELETE-F2-12
      604   IDX-DELETE-F2-13
      363   IDX-DELETE-F2-2
      385   IDX-DELETE-F2-3
      495   IDX-DELETE-F2-8
      517   IDX-DELETE-F2-9
      410   IDX-FAIL-F1-4. . . . . . . . .  G406
      431   IDX-FAIL-F1-5. . . . . . . . .  G424
      454   IDX-FAIL-F1-6. . . . . . . . .  G450
      476   IDX-FAIL-F1-7. . . . . . . . .  G472
      344   IDX-FAIL-F2-1. . . . . . . . .  G337
      541   IDX-FAIL-F2-10 . . . . . . . .  G534
      563   IDX-FAIL-F2-11 . . . . . . . .  G559
      585   IDX-FAIL-F2-12 . . . . . . . .  G581
      607   IDX-FAIL-F2-13 . . . . . . . .  G603
      366   IDX-FAIL-F2-2. . . . . . . . .  G359
      388   IDX-FAIL-F2-3. . . . . . . . .  G384
      498   IDX-FAIL-F2-8. . . . . . . . .  G491
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    18
0 Defined   Cross-reference of procedures   References

0     520   IDX-FAIL-F2-9. . . . . . . . .  G516
      395   IDX-INIT-F1-4
      417   IDX-INIT-F1-5
      439   IDX-INIT-F1-6
      461   IDX-INIT-F1-7
      330   IDX-INIT-F2-1
      527   IDX-INIT-F2-10
      549   IDX-INIT-F2-11
      571   IDX-INIT-F2-12
      593   IDX-INIT-F2-13
      352   IDX-INIT-F2-2
      374   IDX-INIT-F2-3
      483   IDX-INIT-F2-8
      506   IDX-INIT-F2-9
      401   IDX-TEST-F1-4
      422   IDX-TEST-F1-5
      445   IDX-TEST-F1-6
      467   IDX-TEST-F1-7
      335   IDX-TEST-F2-1
      532   IDX-TEST-F2-10
      554   IDX-TEST-F2-11
      576   IDX-TEST-F2-12
      598   IDX-TEST-F2-13
      357   IDX-TEST-F2-2
      379   IDX-TEST-F2-3
      489   IDX-TEST-F2-8
      511   IDX-TEST-F2-9
      414   IDX-WRITE-F1-4 . . . . . . . .  G404 G409
      436   IDX-WRITE-F1-5 . . . . . . . .  G427 G430
      458   IDX-WRITE-F1-6 . . . . . . . .  G448 G453
      480   IDX-WRITE-F1-7 . . . . . . . .  G470 G475
      349   IDX-WRITE-F2-1 . . . . . . . .  G340 G343
      546   IDX-WRITE-F2-10. . . . . . . .  G537 G540
      568   IDX-WRITE-F2-11. . . . . . . .  G557 G562
      590   IDX-WRITE-F2-12. . . . . . . .  G579 G584
      611   IDX-WRITE-F2-13. . . . . . . .  G601 G606
      371   IDX-WRITE-F2-2 . . . . . . . .  G362 G365
      392   IDX-WRITE-F2-3 . . . . . . . .  G382 G387
      503   IDX-WRITE-F2-8 . . . . . . . .  G494 G497
      524   IDX-WRITE-F2-9 . . . . . . . .  G514 G519
      317   INIT-TBL-TH309
      325   INIT-WRITE . . . . . . . . . .  G322
      214   INSPT
      202   OPEN-FILES
      215   PASS . . . . . . . . . . . . .  P339 P361 P381 P403 P426 P447 P469 P493 P513 P536 P556 P578 P600
      219   PRINT-DETAIL . . . . . . . . .  P328 P350 P372 P393 P415 P437 P459 P481 P504 P525 P547 P569 P591 P612
      615   PUTOUT-COMPUTED-A. . . . . . .  P347 P369 P434 P501 P544
      315   SECT-NC235A-001
      212   TERMINATE-CALL
      210   TERMINATE-CCVS
      316   TH-08-001
      273   WRITE-LINE . . . . . . . . . .  P223 P224 P232 P233 P234 P235 P237 P238 P239 P241 P243 P252 P260 P266 P271 P272
                                            P295 P299 P301 P310
      285   WRT-LN . . . . . . . . . . . .  P279 P280 P281 P284 P289
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    19
0 Defined   Cross-reference of programs     References

        3   NC235A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC235A    Date 06/04/2022  Time 11:58:52   Page    20
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    317  IGYPS2015-I   The paragraph or section prior to paragraph or section "INIT-TBL-TH309" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC235A:
 *    Source records = 622
 *    Data Division statements = 73
 *    Procedure Division statements = 335
 *    Generated COBOL statements = 0
 *    Program complexity factor = 343
0End of compilation 1,  program NC235A,  highest severity 0.
0Return code 0
