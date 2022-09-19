1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:54   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:54   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1314.2
   000002         000200 PROGRAM-ID.                                                      NC1314.2
   000003         000300     NC131A.                                                      NC1314.2
   000004         000500*                                                              *  NC1314.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1314.2
   000006         000700*                                                              *  NC1314.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1314.2
   000008         000900*                                                              *  NC1314.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1314.2
   000010         001100*                                                              *  NC1314.2
   000011         001300*                                                              *  NC1314.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1314.2
   000013         001500*                                                              *  NC1314.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1314.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1314.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1314.2
   000017         001900*                                                              *  NC1314.2
   000018         002100*                                                                 NC1314.2
   000019         002200*    PROGRAM NC131A TESTS FORMAT 1 OF THE SET STATEMENT USING     NC1314.2
   000020         002300*    VARIOUS COMBINATIONS OF INDEX-NAMES, IDENTIFIERS & INTEGERS  NC1314.2
   000021         002400*                                                                 NC1314.2
   000022         002500 ENVIRONMENT DIVISION.                                            NC1314.2
   000023         002600 CONFIGURATION SECTION.                                           NC1314.2
   000024         002700 SOURCE-COMPUTER.                                                 NC1314.2
   000025         002800     XXXXX082.                                                    NC1314.2
   000026         002900 OBJECT-COMPUTER.                                                 NC1314.2
   000027         003000     XXXXX083.                                                    NC1314.2
   000028         003100 INPUT-OUTPUT SECTION.                                            NC1314.2
   000029         003200 FILE-CONTROL.                                                    NC1314.2
   000030         003300     SELECT PRINT-FILE ASSIGN TO                                  NC1314.2 34
   000031         003400     XXXXX055.                                                    NC1314.2
   000032         003500 DATA DIVISION.                                                   NC1314.2
   000033         003600 FILE SECTION.                                                    NC1314.2
   000034         003700 FD  PRINT-FILE.                                                  NC1314.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003800 01  PRINT-REC PICTURE X(120).                                    NC1314.2
   000036         003900 01  DUMMY-RECORD PICTURE X(120).                                 NC1314.2
   000037         004000 WORKING-STORAGE SECTION.                                         NC1314.2
   000038         004100 77  I-DATA-1  USAGE IS INDEX.                                    NC1314.2
   000039         004200 77  IDENT-1   PICTURE   9 VALUE IS 4.                            NC1314.2
   000040         004300 77  IDENT-2   PICTURE 9.                                         NC1314.2
   000041         004400 77  IDENT-3  PICTURE S99  USAGE COMPUTATIONAL.                   NC1314.2
   000042         004500 77  SGN-IDX          PICTURE  9(18).                             NC1314.2
   000043         004600 01   INDEX-VALUE  PIC 9999.                                      NC1314.2
   000044         004700 01  I-DATA-GROUP USAGE IS INDEX.                                 NC1314.2
   000045         004800     02  I-DATA-2 USAGE IS INDEX.                                 NC1314.2
   000046         004900     02  I-DATA-3 USAGE IS INDEX.                                 NC1314.2
   000047         005000 01  TABLE-1.                                                     NC1314.2
   000048         005100     02  TAB1-REC  PICTURE  99  OCCURS 100 TIMES                  NC1314.2
   000049         005200                   INDEXED BY INDEX1.                             NC1314.2
   000050         005300 01  TABLE-2.                                                     NC1314.2
   000051         005400     02  TAB2-REC  PICTURE 999 OCCURS 100 TIMES                   NC1314.2
   000052         005500                   INDEXED BY INDEX2.                             NC1314.2
   000053         005600 01  TEST-RESULTS.                                                NC1314.2
   000054         005700     02 FILLER                   PIC X      VALUE SPACE.          NC1314.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1314.2 IMP
   000056         005900     02 FILLER                   PIC X      VALUE SPACE.          NC1314.2 IMP
   000057         006000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1314.2 IMP
   000058         006100     02 FILLER                   PIC X      VALUE SPACE.          NC1314.2 IMP
   000059         006200     02  PAR-NAME.                                                NC1314.2
   000060         006300       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1314.2 IMP
   000061         006400       03  PARDOT-X              PIC X      VALUE SPACE.          NC1314.2 IMP
   000062         006500       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1314.2 IMP
   000063         006600     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1314.2 IMP
   000064         006700     02 RE-MARK                  PIC X(61).                       NC1314.2
   000065         006800 01  TEST-COMPUTED.                                               NC1314.2
   000066         006900     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1314.2 IMP
   000067         007000     02 FILLER                   PIC X(17)  VALUE                 NC1314.2
   000068         007100            "       COMPUTED=".                                   NC1314.2
   000069         007200     02 COMPUTED-X.                                               NC1314.2
   000070         007300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1314.2 IMP
   000071         007400     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1314.2 70
   000072         007500                                 PIC -9(9).9(9).                  NC1314.2
   000073         007600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1314.2 70
   000074         007700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1314.2 70
   000075         007800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1314.2 70
   000076         007900     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1314.2 70
   000077         008000         04 COMPUTED-18V0                    PIC -9(18).          NC1314.2
   000078         008100         04 FILLER                           PIC X.               NC1314.2
   000079         008200     03 FILLER PIC X(50) VALUE SPACE.                             NC1314.2 IMP
   000080         008300 01  TEST-CORRECT.                                                NC1314.2
   000081         008400     02 FILLER PIC X(30) VALUE SPACE.                             NC1314.2 IMP
   000082         008500     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1314.2
   000083         008600     02 CORRECT-X.                                                NC1314.2
   000084         008700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1314.2 IMP
   000085         008800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1314.2 84
   000086         008900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1314.2 84
   000087         009000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1314.2 84
   000088         009100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1314.2 84
   000089         009200     03      CR-18V0 REDEFINES CORRECT-A.                         NC1314.2 84
   000090         009300         04 CORRECT-18V0                     PIC -9(18).          NC1314.2
   000091         009400         04 FILLER                           PIC X.               NC1314.2
   000092         009500     03 FILLER PIC X(2) VALUE SPACE.                              NC1314.2 IMP
   000093         009600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1314.2 IMP
   000094         009700 01  CCVS-C-1.                                                    NC1314.2
   000095         009800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1314.2
   000096         009900-    "SS  PARAGRAPH-NAME                                          NC1314.2
   000097         010000-    "       REMARKS".                                            NC1314.2
   000098         010100     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1314.2 IMP
   000099         010200 01  CCVS-C-2.                                                    NC1314.2
   000100         010300     02 FILLER                     PIC X        VALUE SPACE.      NC1314.2 IMP
   000101         010400     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1314.2
   000102         010500     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1314.2 IMP
   000103         010600     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1314.2
   000104         010700     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1314.2 IMP
   000105         010800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1314.2 IMP
   000106         010900 01  REC-CT                        PIC 99       VALUE ZERO.       NC1314.2 IMP
   000107         011000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1314.2 IMP
   000108         011100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1314.2 IMP
   000109         011200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1314.2 IMP
   000110         011300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1314.2 IMP
   000111         011400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1314.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1314.2 IMP
   000113         011600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1314.2 IMP
   000114         011700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1314.2 IMP
   000115         011800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1314.2 IMP
   000116         011900 01  CCVS-H-1.                                                    NC1314.2
   000117         012000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1314.2 IMP
   000118         012100     02  FILLER                    PIC X(42)    VALUE             NC1314.2
   000119         012200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1314.2
   000120         012300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1314.2 IMP
   000121         012400 01  CCVS-H-2A.                                                   NC1314.2
   000122         012500   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1314.2 IMP
   000123         012600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1314.2
   000124         012700   02  FILLER                        PIC XXXX   VALUE             NC1314.2
   000125         012800     "4.2 ".                                                      NC1314.2
   000126         012900   02  FILLER                        PIC X(28)  VALUE             NC1314.2
   000127         013000            " COPY - NOT FOR DISTRIBUTION".                       NC1314.2
   000128         013100   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1314.2 IMP
   000129         013200                                                                  NC1314.2
   000130         013300 01  CCVS-H-2B.                                                   NC1314.2
   000131         013400   02  FILLER                        PIC X(15)  VALUE             NC1314.2
   000132         013500            "TEST RESULT OF ".                                    NC1314.2
   000133         013600   02  TEST-ID                       PIC X(9).                    NC1314.2
   000134         013700   02  FILLER                        PIC X(4)   VALUE             NC1314.2
   000135         013800            " IN ".                                               NC1314.2
   000136         013900   02  FILLER                        PIC X(12)  VALUE             NC1314.2
   000137         014000     " HIGH       ".                                              NC1314.2
   000138         014100   02  FILLER                        PIC X(22)  VALUE             NC1314.2
   000139         014200            " LEVEL VALIDATION FOR ".                             NC1314.2
   000140         014300   02  FILLER                        PIC X(58)  VALUE             NC1314.2
   000141         014400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1314.2
   000142         014500 01  CCVS-H-3.                                                    NC1314.2
   000143         014600     02  FILLER                      PIC X(34)  VALUE             NC1314.2
   000144         014700            " FOR OFFICIAL USE ONLY    ".                         NC1314.2
   000145         014800     02  FILLER                      PIC X(58)  VALUE             NC1314.2
   000146         014900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1314.2
   000147         015000     02  FILLER                      PIC X(28)  VALUE             NC1314.2
   000148         015100            "  COPYRIGHT   1985 ".                                NC1314.2
   000149         015200 01  CCVS-E-1.                                                    NC1314.2
   000150         015300     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1314.2 IMP
   000151         015400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1314.2
   000152         015500     02 ID-AGAIN                     PIC X(9).                    NC1314.2
   000153         015600     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1314.2 IMP
   000154         015700 01  CCVS-E-2.                                                    NC1314.2
   000155         015800     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1314.2 IMP
   000156         015900     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1314.2 IMP
   000157         016000     02 CCVS-E-2-2.                                               NC1314.2
   000158         016100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1314.2 IMP
   000159         016200         03 FILLER                   PIC X      VALUE SPACE.      NC1314.2 IMP
   000160         016300         03 ENDER-DESC               PIC X(44)  VALUE             NC1314.2
   000161         016400            "ERRORS ENCOUNTERED".                                 NC1314.2
   000162         016500 01  CCVS-E-3.                                                    NC1314.2
   000163         016600     02  FILLER                      PIC X(22)  VALUE             NC1314.2
   000164         016700            " FOR OFFICIAL USE ONLY".                             NC1314.2
   000165         016800     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1314.2 IMP
   000166         016900     02  FILLER                      PIC X(58)  VALUE             NC1314.2
   000167         017000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1314.2
   000168         017100     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1314.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 FILLER                       PIC X(15)  VALUE             NC1314.2
   000170         017300             " COPYRIGHT 1985".                                   NC1314.2
   000171         017400 01  CCVS-E-4.                                                    NC1314.2
   000172         017500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1314.2 IMP
   000173         017600     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1314.2
   000174         017700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1314.2 IMP
   000175         017800     02 FILLER                       PIC X(40)  VALUE             NC1314.2
   000176         017900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1314.2
   000177         018000 01  XXINFO.                                                      NC1314.2
   000178         018100     02 FILLER                       PIC X(19)  VALUE             NC1314.2
   000179         018200            "*** INFORMATION ***".                                NC1314.2
   000180         018300     02 INFO-TEXT.                                                NC1314.2
   000181         018400       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1314.2 IMP
   000182         018500       04 XXCOMPUTED                 PIC X(20).                   NC1314.2
   000183         018600       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1314.2 IMP
   000184         018700       04 XXCORRECT                  PIC X(20).                   NC1314.2
   000185         018800     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1314.2
   000186         018900 01  HYPHEN-LINE.                                                 NC1314.2
   000187         019000     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1314.2 IMP
   000188         019100     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1314.2
   000189         019200-    "*****************************************".                 NC1314.2
   000190         019300     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1314.2
   000191         019400-    "******************************".                            NC1314.2
   000192         019500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1314.2
   000193         019600     "NC131A".                                                    NC1314.2
   000194         019700 PROCEDURE DIVISION.                                              NC1314.2
   000195         019800 CCVS1 SECTION.                                                   NC1314.2
   000196         019900 OPEN-FILES.                                                      NC1314.2
   000197         020000     OPEN     OUTPUT PRINT-FILE.                                  NC1314.2 34
   000198         020100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1314.2 192 133 192 152
   000199         020200     MOVE    SPACE TO TEST-RESULTS.                               NC1314.2 IMP 53
   000200         020300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1314.2 225 230
   000201         020400     GO TO CCVS1-EXIT.                                            NC1314.2 312
   000202         020500 CLOSE-FILES.                                                     NC1314.2
   000203         020600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1314.2 234 255 34
   000204         020700 TERMINATE-CCVS.                                                  NC1314.2
   000205         020800     EXIT PROGRAM.                                                NC1314.2
   000206         020900 TERMINATE-CALL.                                                  NC1314.2
   000207         021000     STOP     RUN.                                                NC1314.2
   000208         021100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1314.2 57 109
   000209         021200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1314.2 57 110
   000210         021300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1314.2 57 108
   000211         021400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1314.2 57 107
   000212         021500     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1314.2 64
   000213         021600 PRINT-DETAIL.                                                    NC1314.2
   000214         021700     IF REC-CT NOT EQUAL TO ZERO                                  NC1314.2 106 IMP
   000215      1  021800             MOVE "." TO PARDOT-X                                 NC1314.2 61
   000216      1  021900             MOVE REC-CT TO DOTVALUE.                             NC1314.2 106 62
   000217         022000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1314.2 53 35 267
   000218         022100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1314.2 57 267
   000219      1  022200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1314.2 288 302
   000220      1  022300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1314.2 303 311
   000221         022400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1314.2 IMP 57 IMP 69
   000222         022500     MOVE SPACE TO CORRECT-X.                                     NC1314.2 IMP 83
   000223         022600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1314.2 106 IMP IMP 59
   000224         022700     MOVE     SPACE TO RE-MARK.                                   NC1314.2 IMP 64
   000225         022800 HEAD-ROUTINE.                                                    NC1314.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1314.2 116 36 267
   000227         023000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1314.2 121 36 267
   000228         023100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1314.2 130 36 267
   000229         023200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1314.2 142 36 267
   000230         023300 COLUMN-NAMES-ROUTINE.                                            NC1314.2
   000231         023400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1314.2 94 36 267
   000232         023500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1314.2 99 36 267
   000233         023600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1314.2 186 36 267
   000234         023700 END-ROUTINE.                                                     NC1314.2
   000235         023800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1314.2 186 36 267
   000236         023900 END-RTN-EXIT.                                                    NC1314.2
   000237         024000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1314.2 149 36 267
   000238         024100 END-ROUTINE-1.                                                   NC1314.2
   000239         024200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1314.2 108 112 109
   000240         024300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1314.2 112 107 112
   000241         024400      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1314.2 110 112
   000242         024500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1314.2
   000243         024600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1314.2 110 172
   000244         024700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1314.2 112 174
   000245         024800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1314.2 171 157
   000246         024900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1314.2 154 36 267
   000247         025000  END-ROUTINE-12.                                                 NC1314.2
   000248         025100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1314.2 160
   000249         025200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1314.2 108 IMP
   000250      1  025300         MOVE "NO " TO ERROR-TOTAL                                NC1314.2 158
   000251         025400         ELSE                                                     NC1314.2
   000252      1  025500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1314.2 108 158
   000253         025600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1314.2 154 36
   000254         025700     PERFORM WRITE-LINE.                                          NC1314.2 267
   000255         025800 END-ROUTINE-13.                                                  NC1314.2
   000256         025900     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1314.2 107 IMP
   000257      1  026000         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1314.2 158
   000258      1  026100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1314.2 107 158
   000259         026200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1314.2 160
   000260         026300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1314.2 154 36 267
   000261         026400      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1314.2 109 IMP
   000262      1  026500          MOVE "NO " TO ERROR-TOTAL                               NC1314.2 158
   000263      1  026600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1314.2 109 158
   000264         026700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1314.2 160
   000265         026800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1314.2 154 36 267
   000266         026900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1314.2 162 36 267
   000267         027000 WRITE-LINE.                                                      NC1314.2
   000268         027100     ADD 1 TO RECORD-COUNT.                                       NC1314.2 114
   000269         027200     IF RECORD-COUNT GREATER 42                                   NC1314.2 114
   000270      1  027300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1314.2 36 113
   000271      1  027400         MOVE SPACE TO DUMMY-RECORD                               NC1314.2 IMP 36
   000272      1  027500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1314.2 36
   000273      1  027600         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1314.2 116 36 283
   000274      1  027700         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1314.2 121 36 283
   000275      1  027800         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1314.2 130 36 283
   000276      1  027900         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1314.2 142 36 283
   000277      1  028000         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1314.2 94 36 283
   000278      1  028100         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1314.2 99 36 283
   000279      1  028200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1314.2 186 36 283
   000280      1  028300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1314.2 113 36
   000281      1  028400         MOVE ZERO TO RECORD-COUNT.                               NC1314.2 IMP 114
   000282         028500     PERFORM WRT-LN.                                              NC1314.2 283
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600 WRT-LN.                                                          NC1314.2
   000284         028700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1314.2 36
   000285         028800     MOVE SPACE TO DUMMY-RECORD.                                  NC1314.2 IMP 36
   000286         028900 BLANK-LINE-PRINT.                                                NC1314.2
   000287         029000     PERFORM WRT-LN.                                              NC1314.2 283
   000288         029100 FAIL-ROUTINE.                                                    NC1314.2
   000289         029200     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1314.2 69 IMP
   000290      1  029300            GO TO FAIL-ROUTINE-WRITE.                             NC1314.2 297
   000291         029400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1314.2 83 IMP 297
   000292         029500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1314.2 115 185
   000293         029600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1314.2 180
   000294         029700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1314.2 177 36 267
   000295         029800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1314.2 IMP 185
   000296         029900     GO TO  FAIL-ROUTINE-EX.                                      NC1314.2 302
   000297         030000 FAIL-ROUTINE-WRITE.                                              NC1314.2
   000298         030100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1314.2 65 35 267
   000299         030200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1314.2 115 93
   000300         030300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1314.2 80 35 267
   000301         030400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1314.2 IMP 93
   000302         030500 FAIL-ROUTINE-EX. EXIT.                                           NC1314.2
   000303         030600 BAIL-OUT.                                                        NC1314.2
   000304         030700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1314.2 70 IMP 306
   000305         030800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1314.2 84 IMP 311
   000306         030900 BAIL-OUT-WRITE.                                                  NC1314.2
   000307         031000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1314.2 84 184 70 182
   000308         031100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1314.2 115 185
   000309         031200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1314.2 177 36 267
   000310         031300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1314.2 IMP 185
   000311         031400 BAIL-OUT-EX. EXIT.                                               NC1314.2
   000312         031500 CCVS1-EXIT.                                                      NC1314.2
   000313         031600     EXIT.                                                        NC1314.2
   000314         031700 SECT-NC131A-001 SECTION.                                         NC1314.2
   000315         031800 TEST-1.                                                          NC1314.2
   000316         031900     MOVE "VI-127 6.23.4" TO ANSI-REFERENCE.                      NC1314.2 115
   000317         032000     SET INDEX1 TO 5.                                             NC1314.2 49
   000318         032100     IF INDEX1 EQUAL TO 5 PERFORM PASS GO TO OK1.                 NC1314.2 49 209 323
   000319         032200     SET SGN-IDX TO INDEX1.                                       NC1314.2 42 49
   000320         032300     MOVE SGN-IDX TO COMPUTED-18V0.                               NC1314.2 42 77
   000321         032400     MOVE 5 TO CORRECT-18V0.                                      NC1314.2 90
   000322         032500     PERFORM FAIL.                                                NC1314.2 210
   000323         032600 OK1.                                                             NC1314.2
   000324         032700     MOVE "TEST-1" TO PAR-NAME.                                   NC1314.2 59
   000325         032800     MOVE  "SET  OPT 1" TO FEATURE.                               NC1314.2 55
   000326         032900     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000327         033000 TEST-2.                                                          NC1314.2
   000328         033100     SET INDEX1 TO IDENT-1.                                       NC1314.2 49 39
   000329         033200     IF INDEX1 EQUAL TO 4 PERFORM PASS GO TO OK2.                 NC1314.2 49 209 334
   000330         033300     SET SGN-IDX TO INDEX1.                                       NC1314.2 42 49
   000331         033400     MOVE SGN-IDX TO COMPUTED-18V0.                               NC1314.2 42 77
   000332         033500     MOVE IDENT-1 TO CORRECT-18V0.                                NC1314.2 39 90
   000333         033600     PERFORM FAIL.                                                NC1314.2 210
   000334         033700 OK2.                                                             NC1314.2
   000335         033800     MOVE "TEST-2" TO PAR-NAME.                                   NC1314.2 59
   000336         033900     MOVE "SET  OPT 2" TO FEATURE.                                NC1314.2 55
   000337         034000     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000338         034100 TEST-3.                                                          NC1314.2
   000339         034200     SET INDEX1 TO 4.                                             NC1314.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     SET INDEX2 TO INDEX1.                                        NC1314.2 52 49
   000341         034400     IF INDEX2 EQUAL TO INDEX1 PERFORM PASS GO TO OK3.            NC1314.2 52 49 209 346
   000342         034500     SET SGN-IDX TO INDEX2.                                       NC1314.2 42 52
   000343         034600     MOVE SGN-IDX TO COMPUTED-18V0.                               NC1314.2 42 77
   000344         034700     MOVE 4 TO CORRECT-18V0.                                      NC1314.2 90
   000345         034800     PERFORM FAIL.                                                NC1314.2 210
   000346         034900 OK3.                                                             NC1314.2
   000347         035000     MOVE "TEST-3" TO PAR-NAME.                                   NC1314.2 59
   000348         035100     MOVE "SET  OPT 3" TO FEATURE.                                NC1314.2 55
   000349         035200     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000350         035300 TEST-4.                                                          NC1314.2
   000351         035400     SET INDEX2 TO 4.                                             NC1314.2 52
   000352         035500     SET I-DATA-1  TO INDEX2.                                     NC1314.2 38 52
   000353         035600     IF I-DATA-1 EQUAL TO INDEX2 PERFORM PASS GO TO OK4.          NC1314.2 38 52 209 358
   000354         035700     SET      INDEX-VALUE TO INDEX2.                              NC1314.2 43 52
   000355         035800     MOVE     INDEX-VALUE TO COMPUTED-18V0.                       NC1314.2 43 77
   000356         035900     MOVE 4 TO CORRECT-18V0.                                      NC1314.2 90
   000357         036000     PERFORM FAIL.                                                NC1314.2 210
   000358         036100 OK4.                                                             NC1314.2
   000359         036200     MOVE "TEST-4" TO PAR-NAME.                                   NC1314.2 59
   000360         036300     MOVE  "SET  OPT 4" TO FEATURE.                               NC1314.2 55
   000361         036400     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000362         036500 TEST-5.                                                          NC1314.2
   000363         036600     SET INDEX2 TO 4.                                             NC1314.2 52
   000364         036700     SET I-DATA-1 TO INDEX2.                                      NC1314.2 38 52
   000365         036800     SET I-DATA-2 TO I-DATA-1.                                    NC1314.2 45 38
   000366         036900     IF I-DATA-2 EQUAL TO I-DATA-1 PERFORM PASS GO TO OK5.        NC1314.2 45 38 209 371
   000367         037000     SET      INDEX-VALUE TO INDEX2.                              NC1314.2 43 52
   000368         037100     MOVE     INDEX-VALUE TO COMPUTED-18V0.                       NC1314.2 43 77
   000369         037200     MOVE 4 TO CORRECT-18V0.                                      NC1314.2 90
   000370         037300     PERFORM FAIL.                                                NC1314.2 210
   000371         037400 OK5.                                                             NC1314.2
   000372         037500     MOVE "TEST-5" TO PAR-NAME.                                   NC1314.2 59
   000373         037600     MOVE "SET  OPT 5" TO FEATURE.                                NC1314.2 55
   000374         037700     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000375         037800 TEST-6.                                                          NC1314.2
   000376         037900     SET INDEX2 TO 6.                                             NC1314.2 52
   000377         038000     SET IDENT-2 TO  INDEX2.                                      NC1314.2 40 52
   000378         038100     IF IDENT-2 EQUAL TO INDEX2 PERFORM PASS GO TO OK6.           NC1314.2 40 52 209 383
   000379         038200     SET SGN-IDX TO INDEX2.                                       NC1314.2 42 52
   000380         038300     MOVE SGN-IDX TO COMPUTED-18V0.                               NC1314.2 42 77
   000381         038400     MOVE 6 TO CORRECT-18V0.                                      NC1314.2 90
   000382         038500     PERFORM FAIL.                                                NC1314.2 210
   000383         038600 OK6.                                                             NC1314.2
   000384         038700     MOVE "TEST-6" TO PAR-NAME.                                   NC1314.2 59
   000385         038800     MOVE "SET  OPT 6" TO FEATURE.                                NC1314.2 55
   000386         038900     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000387         039000     MOVE SPACE TO FEATURE.                                       NC1314.2 IMP 55
   000388         039100 END-TEST.                                                        NC1314.2
   000389         039200     PERFORM BLANK-LINE-PRINT 2 TIMES.                            NC1314.2 286
   000390         039300      MOVE "ASCENDING NUMBER LIST" TO RE-MARK.                    NC1314.2 64
   000391         039400      PERFORM PRINT-DETAIL.                                       NC1314.2 213
   000392         039500     PERFORM BLANK-LINE-PRINT.                                    NC1314.2 286
   000393         039600     SET INDEX1 TO 1.                                             NC1314.2 49
   000394         039700     MOVE 1 TO IDENT-3.                                           NC1314.2 41
   000395         039800 L.  MOVE IDENT-3 TO TAB1-REC (INDEX1).                           NC1314.2 41 48 49
   000396         039900     IF   IDENT-3          EQUAL TO 99 GO TO P-LIST.              NC1314.2 41 400
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     ADD 1 TO IDENT-3.                                            NC1314.2 41
   000398         040100     SET INDEX1 TO IDENT-3.                                       NC1314.2 49 41
   000399         040200     GO TO L.                                                     NC1314.2 395
   000400         040300 P-LIST.                                                          NC1314.2
   000401         040400     SET INDEX1 TO 1.                                             NC1314.2 49
   000402         040500     MOVE 1 TO IDENT-3.                                           NC1314.2 41
   000403         040600 M.                                                               NC1314.2
   000404         040700      MOVE TAB1-REC (INDEX1) TO RE-MARK.                          NC1314.2 48 49 64
   000405         040800      PERFORM PRINT-DETAIL.                                       NC1314.2 213
   000406         040900     IF IDENT-3 EQUAL TO 99 GO TO CL-OSE.                         NC1314.2 41 410
   000407         041000     ADD 1 TO  IDENT-3.                                           NC1314.2 41
   000408         041100     SET INDEX1 TO IDENT-3.                                       NC1314.2 49 41
   000409         041200     GO TO M.                                                     NC1314.2 403
   000410         041300 CL-OSE.                                                          NC1314.2
   000411         041400     PERFORM BLANK-LINE-PRINT.                                    NC1314.2 286
   000412         041500     MOVE "END OF TABLE LIST" TO RE-MARK.                         NC1314.2 64
   000413         041600     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000414         041700*                                                                 NC1314.2
   000415         041800 IDX-INIT-8.                                                      NC1314.2
   000416         041900     MOVE   "VI-127 6.23.4 GR3(c)" TO ANSI-REFERENCE.             NC1314.2 115
   000417         042000     SET     INDEX1 TO 4.                                         NC1314.2 49
   000418         042100 IDX-TEST-8-0.                                                    NC1314.2
   000419         042200     SET     INDEX2                                               NC1314.2 52
   000420         042300             IDENT-1 TO INDEX1.                                   NC1314.2 39 49
   000421         042400 IDX-TEST-8-1.                                                    NC1314.2
   000422         042500     IF      IDENT-1 EQUAL TO 4 PERFORM PASS GO TO OK8-1.         NC1314.2 39 209 426
   000423         042600     MOVE    IDENT-1 TO COMPUTED-18V0.                            NC1314.2 39 77
   000424         042700     MOVE    4 TO CORRECT-18V0.                                   NC1314.2 90
   000425         042800     PERFORM FAIL.                                                NC1314.2 210
   000426         042900 OK8-1.                                                           NC1314.2
   000427         043000     MOVE   "IDX-TEST-8-1" TO PAR-NAME.                           NC1314.2 59
   000428         043100     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000429         043200 IDX-TEST-8-2.                                                    NC1314.2
   000430         043300     IF      INDEX2  EQUAL TO INDEX1 PERFORM PASS GO TO OK8-2.    NC1314.2 52 49 209 435
   000431         043400     SET     INDEX-VALUE TO INDEX2.                               NC1314.2 43 52
   000432         043500     MOVE    INDEX-VALUE TO COMPUTED-18V0.                        NC1314.2 43 77
   000433         043600     MOVE    4 TO CORRECT-18V0.                                   NC1314.2 90
   000434         043700     PERFORM FAIL.                                                NC1314.2 210
   000435         043800 OK8-2.                                                           NC1314.2
   000436         043900     MOVE   "IDX-TEST-8-2" TO PAR-NAME.                           NC1314.2 59
   000437         044000     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000438         044100*                                                                 NC1314.2
   000439         044200 IDX-INIT-9.                                                      NC1314.2
   000440         044300     MOVE   "VI-127 6.23.4 GR3(c)" TO ANSI-REFERENCE.             NC1314.2 115
   000441         044400     SET     INDEX1 TO 4.                                         NC1314.2 49
   000442         044500 IDX-TEST-9-0.                                                    NC1314.2
   000443         044600     SET IDENT-1                                                  NC1314.2 39
   000444         044700         INDEX2  TO INDEX1.                                       NC1314.2 52 49
   000445         044800 IDX-TEST-9-1.                                                    NC1314.2
   000446         044900     IF      IDENT-1 EQUAL TO 4 PERFORM PASS GO TO OK9-1.         NC1314.2 39 209 450
   000447         045000     MOVE    IDENT-1 TO COMPUTED-18V0.                            NC1314.2 39 77
   000448         045100     MOVE    4 TO CORRECT-18V0.                                   NC1314.2 90
   000449         045200     PERFORM FAIL.                                                NC1314.2 210
   000450         045300 OK9-1.                                                           NC1314.2
   000451         045400     MOVE   "IDX-TEST-9-1" TO PAR-NAME.                           NC1314.2 59
   000452         045500     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000453         045600 IDX-TEST-9-2.                                                    NC1314.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     IF      INDEX2  EQUAL TO INDEX1 PERFORM PASS GO TO OK9-2.    NC1314.2 52 49 209 459
   000455         045800     SET     INDEX-VALUE TO INDEX2.                               NC1314.2 43 52
   000456         045900     MOVE    INDEX-VALUE TO COMPUTED-18V0.                        NC1314.2 43 77
   000457         046000     MOVE    4 TO CORRECT-18V0.                                   NC1314.2 90
   000458         046100     PERFORM FAIL.                                                NC1314.2 210
   000459         046200 OK9-2.                                                           NC1314.2
   000460         046300     MOVE   "IDX-TEST-9-2" TO PAR-NAME.                           NC1314.2 59
   000461         046400     PERFORM PRINT-DETAIL.                                        NC1314.2 213
   000462         046500*                                                                 NC1314.2
   000463         046600 CCVS-EXIT SECTION.                                               NC1314.2
   000464         046700 CCVS-999999.                                                     NC1314.2
   000465         046800     GO TO CLOSE-FILES.                                           NC1314.2 202
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      115   ANSI-REFERENCE . . . . . . . .  292 299 308 M316 M416 M440
       94   CCVS-C-1 . . . . . . . . . . .  231 277
       99   CCVS-C-2 . . . . . . . . . . .  232 278
      149   CCVS-E-1 . . . . . . . . . . .  237
      154   CCVS-E-2 . . . . . . . . . . .  246 253 260 265
      157   CCVS-E-2-2 . . . . . . . . . .  M245
      162   CCVS-E-3 . . . . . . . . . . .  266
      171   CCVS-E-4 . . . . . . . . . . .  245
      172   CCVS-E-4-1 . . . . . . . . . .  M243
      174   CCVS-E-4-2 . . . . . . . . . .  M244
      116   CCVS-H-1 . . . . . . . . . . .  226 273
      121   CCVS-H-2A. . . . . . . . . . .  227 274
      130   CCVS-H-2B. . . . . . . . . . .  228 275
      142   CCVS-H-3 . . . . . . . . . . .  229 276
      192   CCVS-PGM-ID. . . . . . . . . .  198 198
       76   CM-18V0
       70   COMPUTED-A . . . . . . . . . .  71 73 74 75 76 304 307
       71   COMPUTED-N
       69   COMPUTED-X . . . . . . . . . .  M221 289
       73   COMPUTED-0V18
       75   COMPUTED-14V4
       77   COMPUTED-18V0. . . . . . . . .  M320 M331 M343 M355 M368 M380 M423 M432 M447 M456
       74   COMPUTED-4V14
       93   COR-ANSI-REFERENCE . . . . . .  M299 M301
       84   CORRECT-A. . . . . . . . . . .  85 86 87 88 89 305 307
       85   CORRECT-N
       83   CORRECT-X. . . . . . . . . . .  M222 291
       86   CORRECT-0V18
       88   CORRECT-14V4
       90   CORRECT-18V0 . . . . . . . . .  M321 M332 M344 M356 M369 M381 M424 M433 M448 M457
       87   CORRECT-4V14
       89   CR-18V0
      107   DELETE-COUNTER . . . . . . . .  M211 240 256 258
       62   DOTVALUE . . . . . . . . . . .  M216
      113   DUMMY-HOLD . . . . . . . . . .  M270 280
       36   DUMMY-RECORD . . . . . . . . .  M226 M227 M228 M229 M231 M232 M233 M235 M237 M246 M253 M260 M265 M266 270 M271
                                            272 M273 M274 M275 M276 M277 M278 M279 M280 284 M285 M294 M309
      160   ENDER-DESC . . . . . . . . . .  M248 M259 M264
      108   ERROR-COUNTER. . . . . . . . .  M210 239 249 252
      112   ERROR-HOLD . . . . . . . . . .  M239 M240 M240 M241 244
      158   ERROR-TOTAL. . . . . . . . . .  M250 M252 M257 M258 M262 M263
       55   FEATURE. . . . . . . . . . . .  M325 M336 M348 M360 M373 M385 M387
      186   HYPHEN-LINE. . . . . . . . . .  233 235 279
       44   I-DATA-GROUP
       38   I-DATA-1 . . . . . . . . . . .  M352 353 M364 365 366
       45   I-DATA-2 . . . . . . . . . . .  M365 366
       46   I-DATA-3
      152   ID-AGAIN . . . . . . . . . . .  M198
       39   IDENT-1. . . . . . . . . . . .  328 332 M420 422 423 M443 446 447
       40   IDENT-2. . . . . . . . . . . .  M377 378
       41   IDENT-3. . . . . . . . . . . .  M394 395 396 M397 398 M402 406 M407 408
       43   INDEX-VALUE. . . . . . . . . .  M354 355 M367 368 M431 432 M455 456
       49   INDEX1 . . . . . . . . . . . .  M317 318 319 M328 329 330 M339 340 341 M393 395 M398 M401 404 M408 M417 420 430
                                            M441 444 454
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page    13
0 Defined   Cross-reference of data names   References

0      52   INDEX2 . . . . . . . . . . . .  M340 341 342 M351 352 353 354 M363 364 367 M376 377 378 379 M419 430 431 M444
                                            454 455
      185   INF-ANSI-REFERENCE . . . . . .  M292 M295 M308 M310
      180   INFO-TEXT. . . . . . . . . . .  M293
      109   INSPECT-COUNTER. . . . . . . .  M208 239 261 263
       57   P-OR-F . . . . . . . . . . . .  M208 M209 M210 M211 218 M221
       59   PAR-NAME . . . . . . . . . . .  M223 M324 M335 M347 M359 M372 M384 M427 M436 M451 M460
       61   PARDOT-X . . . . . . . . . . .  M215
      110   PASS-COUNTER . . . . . . . . .  M209 241 243
       34   PRINT-FILE . . . . . . . . . .  30 197 203
       35   PRINT-REC. . . . . . . . . . .  M217 M298 M300
       64   RE-MARK. . . . . . . . . . . .  M212 M224 M390 M404 M412
      106   REC-CT . . . . . . . . . . . .  214 216 223
      105   REC-SKL-SUB
      114   RECORD-COUNT . . . . . . . . .  M268 269 M281
       42   SGN-IDX. . . . . . . . . . . .  M319 320 M330 331 M342 343 M379 380
       47   TABLE-1
       50   TABLE-2
       48   TAB1-REC . . . . . . . . . . .  M395 404
       51   TAB2-REC
       65   TEST-COMPUTED. . . . . . . . .  298
       80   TEST-CORRECT . . . . . . . . .  300
      133   TEST-ID. . . . . . . . . . . .  M198
       53   TEST-RESULTS . . . . . . . . .  M199 217
      111   TOTAL-ERROR
      182   XXCOMPUTED . . . . . . . . . .  M307
      184   XXCORRECT. . . . . . . . . . .  M307
      177   XXINFO . . . . . . . . . . . .  294 309
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page    14
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

      303   BAIL-OUT . . . . . . . . . . .  P220
      311   BAIL-OUT-EX. . . . . . . . . .  E220 G305
      306   BAIL-OUT-WRITE . . . . . . . .  G304
      286   BLANK-LINE-PRINT . . . . . . .  P389 P392 P411
      463   CCVS-EXIT
      464   CCVS-999999
      195   CCVS1
      312   CCVS1-EXIT . . . . . . . . . .  G201
      410   CL-OSE . . . . . . . . . . . .  G406
      202   CLOSE-FILES. . . . . . . . . .  G465
      230   COLUMN-NAMES-ROUTINE . . . . .  E200
      211   DE-LETE
      234   END-ROUTINE. . . . . . . . . .  P203
      238   END-ROUTINE-1
      247   END-ROUTINE-12
      255   END-ROUTINE-13 . . . . . . . .  E203
      236   END-RTN-EXIT
      388   END-TEST
      210   FAIL . . . . . . . . . . . . .  P322 P333 P345 P357 P370 P382 P425 P434 P449 P458
      288   FAIL-ROUTINE . . . . . . . . .  P219
      302   FAIL-ROUTINE-EX. . . . . . . .  E219 G296
      297   FAIL-ROUTINE-WRITE . . . . . .  G290 G291
      225   HEAD-ROUTINE . . . . . . . . .  P200
      415   IDX-INIT-8
      439   IDX-INIT-9
      418   IDX-TEST-8-0
      421   IDX-TEST-8-1
      429   IDX-TEST-8-2
      442   IDX-TEST-9-0
      445   IDX-TEST-9-1
      453   IDX-TEST-9-2
      208   INSPT
      395   L. . . . . . . . . . . . . . .  G399
      403   M. . . . . . . . . . . . . . .  G409
      323   OK1. . . . . . . . . . . . . .  G318
      334   OK2. . . . . . . . . . . . . .  G329
      346   OK3. . . . . . . . . . . . . .  G341
      358   OK4. . . . . . . . . . . . . .  G353
      371   OK5. . . . . . . . . . . . . .  G366
      383   OK6. . . . . . . . . . . . . .  G378
      426   OK8-1. . . . . . . . . . . . .  G422
      435   OK8-2. . . . . . . . . . . . .  G430
      450   OK9-1. . . . . . . . . . . . .  G446
      459   OK9-2. . . . . . . . . . . . .  G454
      196   OPEN-FILES
      400   P-LIST . . . . . . . . . . . .  G396
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page    15
0 Defined   Cross-reference of procedures   References

0     209   PASS . . . . . . . . . . . . .  P318 P329 P341 P353 P366 P378 P422 P430 P446 P454
      213   PRINT-DETAIL . . . . . . . . .  P326 P337 P349 P361 P374 P386 P391 P405 P413 P428 P437 P452 P461
      314   SECT-NC131A-001
      206   TERMINATE-CALL
      204   TERMINATE-CCVS
      315   TEST-1
      327   TEST-2
      338   TEST-3
      350   TEST-4
      362   TEST-5
      375   TEST-6
      267   WRITE-LINE . . . . . . . . . .  P217 P218 P226 P227 P228 P229 P231 P232 P233 P235 P237 P246 P254 P260 P265 P266
                                            P294 P298 P300 P309
      283   WRT-LN . . . . . . . . . . . .  P273 P274 P275 P276 P277 P278 P279 P282 P287
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page    16
0 Defined   Cross-reference of programs     References

        3   NC131A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC131A    Date 06/04/2022  Time 11:58:54   Page    17
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC131A:
 *    Source records = 465
 *    Data Division statements = 76
 *    Procedure Division statements = 273
 *    Generated COBOL statements = 0
 *    Program complexity factor = 280
0End of compilation 1,  program NC131A,  highest severity 0.
0Return code 0
