1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:55   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:55   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2364.2
   000002         000200 PROGRAM-ID.                                                      NC2364.2
   000003         000300     NC236A.                                                      NC2364.2
   000004         000500*                                                              *  NC2364.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2364.2
   000006         000700*                                                              *  NC2364.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2364.2
   000008         000900*                                                              *  NC2364.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2364.2
   000010         001100*                                                              *  NC2364.2
   000011         001300*                                                              *  NC2364.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2364.2
   000013         001500*                                                              *  NC2364.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2364.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2364.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2364.2
   000017         001900*                                                              *  NC2364.2
   000018         002100                                                                  NC2364.2
   000019         002200*                                                              *  NC2364.2
   000020         002300*    PROGRAM NC236A TESTS FORMAT 1 OF THE "SEARCH" STATEMENT   *  NC2364.2
   000021         002400*    USING TWO-DIMAENSIONAL TABKES WHICH HAVE BEEN REDEFINED.  *  NC2364.2
   000022         002500*    THE OPTIONAL "VARYING" AND "AT END" PHRASES ARE USED.     *  NC2364.2
   000023         002600*                                                              *  NC2364.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2364.2
   000025         002900 CONFIGURATION SECTION.                                           NC2364.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2364.2
   000027         003100     XXXXX082.                                                    NC2364.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2364.2
   000029         003300     XXXXX083.                                                    NC2364.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2364.2
   000031         003500 FILE-CONTROL.                                                    NC2364.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2364.2 36
   000033         003700     XXXXX055.                                                    NC2364.2
   000034         003800 DATA DIVISION.                                                   NC2364.2
   000035         003900 FILE SECTION.                                                    NC2364.2
   000036         004000 FD  PRINT-FILE.                                                  NC2364.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2364.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2364.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2364.2
   000040         004400 01  NOTE-1.                                                      NC2364.2
   000041         004500     02  FILLER        PIC X(74)  VALUE                           NC2364.2
   000042         004600     "NOTE 1 - CORRECT AND COMPUTED DATA ARE EQUAL BUT THE AT END NC2364.2
   000043         004700-    "PATH WAS TAKEN".                                            NC2364.2
   000044         004800     02  FILLER        PIC X(46)  VALUE SPACES.                   NC2364.2 IMP
   000045         004900 01  NOTE-2.                                                      NC2364.2
   000046         005000     02  FILLER        PIC X(112) VALUE                           NC2364.2
   000047         005100     "NOTE 2 - CORRECT AND COMPUTED DATA ARE NOT EQUAL. THE COMPUTNC2364.2
   000048         005200-    "ED ENTRY WAS EXTRACTED FROM THE TABLE BY SUBSCRIPTS.".      NC2364.2
   000049         005300     02  FILLER        PIC X(8)   VALUE SPACES.                   NC2364.2 IMP
   000050         005400 01  TABLE-A PIC X(20) VALUE "01020304050607080910".              NC2364.2
   000051         005500 01  TABLE-1 REDEFINES TABLE-A.                                   NC2364.2 50
   000052         005600     02  TBL-A OCCURS 10 TIMES INDEXED BY A.                      NC2364.2
   000053         005700         03  ELMT-A   PIC 99.                                     NC2364.2
   000054         005800 01  W  USAGE INDEX.                                              NC2364.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 01   INDEX-VALUE  PIC 9999.                                      NC2364.2
   000056         006000 01  TABLE-B PIC X(20) VALUE "01020304050607080910".              NC2364.2
   000057         006100 01  TABLE-2 REDEFINES TABLE-B.                                   NC2364.2 56
   000058         006200     02  TBL-B OCCURS 10 TIMES INDEXED BY B.                      NC2364.2
   000059         006300         03  ELMT-B   PIC 99.                                     NC2364.2
   000060         006400 01  TEST-RESULTS.                                                NC2364.2
   000061         006500     02 FILLER                   PIC X      VALUE SPACE.          NC2364.2 IMP
   000062         006600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2364.2 IMP
   000063         006700     02 FILLER                   PIC X      VALUE SPACE.          NC2364.2 IMP
   000064         006800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2364.2 IMP
   000065         006900     02 FILLER                   PIC X      VALUE SPACE.          NC2364.2 IMP
   000066         007000     02  PAR-NAME.                                                NC2364.2
   000067         007100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2364.2 IMP
   000068         007200       03  PARDOT-X              PIC X      VALUE SPACE.          NC2364.2 IMP
   000069         007300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2364.2 IMP
   000070         007400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2364.2 IMP
   000071         007500     02 RE-MARK                  PIC X(61).                       NC2364.2
   000072         007600 01  TEST-COMPUTED.                                               NC2364.2
   000073         007700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2364.2 IMP
   000074         007800     02 FILLER                   PIC X(17)  VALUE                 NC2364.2
   000075         007900            "       COMPUTED=".                                   NC2364.2
   000076         008000     02 COMPUTED-X.                                               NC2364.2
   000077         008100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2364.2 IMP
   000078         008200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2364.2 77
   000079         008300                                 PIC -9(9).9(9).                  NC2364.2
   000080         008400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2364.2 77
   000081         008500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2364.2 77
   000082         008600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2364.2 77
   000083         008700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2364.2 77
   000084         008800         04 COMPUTED-18V0                    PIC -9(18).          NC2364.2
   000085         008900         04 FILLER                           PIC X.               NC2364.2
   000086         009000     03 FILLER PIC X(50) VALUE SPACE.                             NC2364.2 IMP
   000087         009100 01  TEST-CORRECT.                                                NC2364.2
   000088         009200     02 FILLER PIC X(30) VALUE SPACE.                             NC2364.2 IMP
   000089         009300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2364.2
   000090         009400     02 CORRECT-X.                                                NC2364.2
   000091         009500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2364.2 IMP
   000092         009600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2364.2 91
   000093         009700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2364.2 91
   000094         009800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2364.2 91
   000095         009900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2364.2 91
   000096         010000     03      CR-18V0 REDEFINES CORRECT-A.                         NC2364.2 91
   000097         010100         04 CORRECT-18V0                     PIC -9(18).          NC2364.2
   000098         010200         04 FILLER                           PIC X.               NC2364.2
   000099         010300     03 FILLER PIC X(2) VALUE SPACE.                              NC2364.2 IMP
   000100         010400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2364.2 IMP
   000101         010500 01  CCVS-C-1.                                                    NC2364.2
   000102         010600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2364.2
   000103         010700-    "SS  PARAGRAPH-NAME                                          NC2364.2
   000104         010800-    "       REMARKS".                                            NC2364.2
   000105         010900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2364.2 IMP
   000106         011000 01  CCVS-C-2.                                                    NC2364.2
   000107         011100     02 FILLER                     PIC X        VALUE SPACE.      NC2364.2 IMP
   000108         011200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2364.2
   000109         011300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2364.2 IMP
   000110         011400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2364.2
   000111         011500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2364.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2364.2 IMP
   000113         011700 01  REC-CT                        PIC 99       VALUE ZERO.       NC2364.2 IMP
   000114         011800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2364.2 IMP
   000115         011900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2364.2 IMP
   000116         012000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2364.2 IMP
   000117         012100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2364.2 IMP
   000118         012200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2364.2 IMP
   000119         012300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2364.2 IMP
   000120         012400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2364.2 IMP
   000121         012500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2364.2 IMP
   000122         012600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2364.2 IMP
   000123         012700 01  CCVS-H-1.                                                    NC2364.2
   000124         012800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2364.2 IMP
   000125         012900     02  FILLER                    PIC X(42)    VALUE             NC2364.2
   000126         013000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2364.2
   000127         013100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2364.2 IMP
   000128         013200 01  CCVS-H-2A.                                                   NC2364.2
   000129         013300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2364.2 IMP
   000130         013400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2364.2
   000131         013500   02  FILLER                        PIC XXXX   VALUE             NC2364.2
   000132         013600     "4.2 ".                                                      NC2364.2
   000133         013700   02  FILLER                        PIC X(28)  VALUE             NC2364.2
   000134         013800            " COPY - NOT FOR DISTRIBUTION".                       NC2364.2
   000135         013900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2364.2 IMP
   000136         014000                                                                  NC2364.2
   000137         014100 01  CCVS-H-2B.                                                   NC2364.2
   000138         014200   02  FILLER                        PIC X(15)  VALUE             NC2364.2
   000139         014300            "TEST RESULT OF ".                                    NC2364.2
   000140         014400   02  TEST-ID                       PIC X(9).                    NC2364.2
   000141         014500   02  FILLER                        PIC X(4)   VALUE             NC2364.2
   000142         014600            " IN ".                                               NC2364.2
   000143         014700   02  FILLER                        PIC X(12)  VALUE             NC2364.2
   000144         014800     " HIGH       ".                                              NC2364.2
   000145         014900   02  FILLER                        PIC X(22)  VALUE             NC2364.2
   000146         015000            " LEVEL VALIDATION FOR ".                             NC2364.2
   000147         015100   02  FILLER                        PIC X(58)  VALUE             NC2364.2
   000148         015200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2364.2
   000149         015300 01  CCVS-H-3.                                                    NC2364.2
   000150         015400     02  FILLER                      PIC X(34)  VALUE             NC2364.2
   000151         015500            " FOR OFFICIAL USE ONLY    ".                         NC2364.2
   000152         015600     02  FILLER                      PIC X(58)  VALUE             NC2364.2
   000153         015700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2364.2
   000154         015800     02  FILLER                      PIC X(28)  VALUE             NC2364.2
   000155         015900            "  COPYRIGHT   1985 ".                                NC2364.2
   000156         016000 01  CCVS-E-1.                                                    NC2364.2
   000157         016100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2364.2 IMP
   000158         016200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2364.2
   000159         016300     02 ID-AGAIN                     PIC X(9).                    NC2364.2
   000160         016400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2364.2 IMP
   000161         016500 01  CCVS-E-2.                                                    NC2364.2
   000162         016600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2364.2 IMP
   000163         016700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2364.2 IMP
   000164         016800     02 CCVS-E-2-2.                                               NC2364.2
   000165         016900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2364.2 IMP
   000166         017000         03 FILLER                   PIC X      VALUE SPACE.      NC2364.2 IMP
   000167         017100         03 ENDER-DESC               PIC X(44)  VALUE             NC2364.2
   000168         017200            "ERRORS ENCOUNTERED".                                 NC2364.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  CCVS-E-3.                                                    NC2364.2
   000170         017400     02  FILLER                      PIC X(22)  VALUE             NC2364.2
   000171         017500            " FOR OFFICIAL USE ONLY".                             NC2364.2
   000172         017600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2364.2 IMP
   000173         017700     02  FILLER                      PIC X(58)  VALUE             NC2364.2
   000174         017800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2364.2
   000175         017900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2364.2 IMP
   000176         018000     02 FILLER                       PIC X(15)  VALUE             NC2364.2
   000177         018100             " COPYRIGHT 1985".                                   NC2364.2
   000178         018200 01  CCVS-E-4.                                                    NC2364.2
   000179         018300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2364.2 IMP
   000180         018400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2364.2
   000181         018500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2364.2 IMP
   000182         018600     02 FILLER                       PIC X(40)  VALUE             NC2364.2
   000183         018700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2364.2
   000184         018800 01  XXINFO.                                                      NC2364.2
   000185         018900     02 FILLER                       PIC X(19)  VALUE             NC2364.2
   000186         019000            "*** INFORMATION ***".                                NC2364.2
   000187         019100     02 INFO-TEXT.                                                NC2364.2
   000188         019200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2364.2 IMP
   000189         019300       04 XXCOMPUTED                 PIC X(20).                   NC2364.2
   000190         019400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2364.2 IMP
   000191         019500       04 XXCORRECT                  PIC X(20).                   NC2364.2
   000192         019600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2364.2
   000193         019700 01  HYPHEN-LINE.                                                 NC2364.2
   000194         019800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2364.2 IMP
   000195         019900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2364.2
   000196         020000-    "*****************************************".                 NC2364.2
   000197         020100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2364.2
   000198         020200-    "******************************".                            NC2364.2
   000199         020300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2364.2
   000200         020400     "NC236A".                                                    NC2364.2
   000201         020500 PROCEDURE DIVISION.                                              NC2364.2
   000202         020600 CCVS1 SECTION.                                                   NC2364.2
   000203         020700 OPEN-FILES.                                                      NC2364.2
   000204         020800     OPEN     OUTPUT PRINT-FILE.                                  NC2364.2 36
   000205         020900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2364.2 199 140 199 159
   000206         021000     MOVE    SPACE TO TEST-RESULTS.                               NC2364.2 IMP 60
   000207         021100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2364.2 232 237
   000208         021200     GO TO CCVS1-EXIT.                                            NC2364.2 314
   000209         021300 CLOSE-FILES.                                                     NC2364.2
   000210         021400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2364.2 241 262 36
   000211         021500 TERMINATE-CCVS.                                                  NC2364.2
   000212         021600     EXIT PROGRAM.                                                NC2364.2
   000213         021700 TERMINATE-CALL.                                                  NC2364.2
   000214         021800     STOP     RUN.                                                NC2364.2
   000215         021900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2364.2 64 116
   000216         022000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2364.2 64 117
   000217         022100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2364.2 64 115
   000218         022200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2364.2 64 114
   000219         022300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2364.2 71
   000220         022400 PRINT-DETAIL.                                                    NC2364.2
   000221         022500     IF REC-CT NOT EQUAL TO ZERO                                  NC2364.2 113 IMP
   000222      1  022600             MOVE "." TO PARDOT-X                                 NC2364.2 68
   000223      1  022700             MOVE REC-CT TO DOTVALUE.                             NC2364.2 113 69
   000224         022800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2364.2 60 37 274
   000225         022900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2364.2 64 274
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  023000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2364.2 291 304
   000227      1  023100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2364.2 305 313
   000228         023200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2364.2 IMP 64 IMP 76
   000229         023300     MOVE SPACE TO CORRECT-X.                                     NC2364.2 IMP 90
   000230         023400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2364.2 113 IMP IMP 66
   000231         023500     MOVE     SPACE TO RE-MARK.                                   NC2364.2 IMP 71
   000232         023600 HEAD-ROUTINE.                                                    NC2364.2
   000233         023700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2364.2 123 38 274
   000234         023800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2364.2 128 38 274
   000235         023900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2364.2 137 38 274
   000236         024000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2364.2 149 38 274
   000237         024100 COLUMN-NAMES-ROUTINE.                                            NC2364.2
   000238         024200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2364.2 101 38 274
   000239         024300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2364.2 106 38 274
   000240         024400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2364.2 193 38 274
   000241         024500 END-ROUTINE.                                                     NC2364.2
   000242         024600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2364.2 193 38 274
   000243         024700 END-RTN-EXIT.                                                    NC2364.2
   000244         024800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2364.2 156 38 274
   000245         024900 END-ROUTINE-1.                                                   NC2364.2
   000246         025000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2364.2 115 119 116
   000247         025100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2364.2 119 114 119
   000248         025200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2364.2 117 119
   000249         025300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2364.2
   000250         025400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2364.2 117 179
   000251         025500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2364.2 119 181
   000252         025600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2364.2 178 164
   000253         025700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2364.2 161 38 274
   000254         025800  END-ROUTINE-12.                                                 NC2364.2
   000255         025900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2364.2 167
   000256         026000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2364.2 115 IMP
   000257      1  026100         MOVE "NO " TO ERROR-TOTAL                                NC2364.2 165
   000258         026200         ELSE                                                     NC2364.2
   000259      1  026300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2364.2 115 165
   000260         026400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2364.2 161 38
   000261         026500     PERFORM WRITE-LINE.                                          NC2364.2 274
   000262         026600 END-ROUTINE-13.                                                  NC2364.2
   000263         026700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2364.2 114 IMP
   000264      1  026800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2364.2 165
   000265      1  026900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2364.2 114 165
   000266         027000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2364.2 167
   000267         027100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2364.2 161 38 274
   000268         027200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2364.2 116 IMP
   000269      1  027300          MOVE "NO " TO ERROR-TOTAL                               NC2364.2 165
   000270      1  027400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2364.2 116 165
   000271         027500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2364.2 167
   000272         027600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2364.2 161 38 274
   000273         027700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2364.2 169 38 274
   000274         027800 WRITE-LINE.                                                      NC2364.2
   000275         027900     ADD 1 TO RECORD-COUNT.                                       NC2364.2 121
   000276         028000     IF RECORD-COUNT GREATER 50                                   NC2364.2 121
   000277      1  028100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2364.2 38 120
   000278      1  028200         MOVE SPACE TO DUMMY-RECORD                               NC2364.2 IMP 38
   000279      1  028300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2364.2 38
   000280      1  028400         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2364.2 101 38 286
   000281      1  028500         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2364.2 106 38 286
   000282      1  028600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2364.2 193 38 286
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2364.2 120 38
   000284      1  028800         MOVE ZERO TO RECORD-COUNT.                               NC2364.2 IMP 121
   000285         028900     PERFORM WRT-LN.                                              NC2364.2 286
   000286         029000 WRT-LN.                                                          NC2364.2
   000287         029100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2364.2 38
   000288         029200     MOVE SPACE TO DUMMY-RECORD.                                  NC2364.2 IMP 38
   000289         029300 BLANK-LINE-PRINT.                                                NC2364.2
   000290         029400     PERFORM WRT-LN.                                              NC2364.2 286
   000291         029500 FAIL-ROUTINE.                                                    NC2364.2
   000292         029600     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2364.2 76 IMP 299
   000293         029700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2364.2 90 IMP 299
   000294         029800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2364.2 122 192
   000295         029900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2364.2 187
   000296         030000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2364.2 184 38 274
   000297         030100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2364.2 IMP 192
   000298         030200     GO TO  FAIL-ROUTINE-EX.                                      NC2364.2 304
   000299         030300 FAIL-ROUTINE-WRITE.                                              NC2364.2
   000300         030400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2364.2 72 37 274
   000301         030500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2364.2 122 100
   000302         030600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2364.2 87 37 274
   000303         030700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2364.2 IMP 100
   000304         030800 FAIL-ROUTINE-EX. EXIT.                                           NC2364.2
   000305         030900 BAIL-OUT.                                                        NC2364.2
   000306         031000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2364.2 77 IMP 308
   000307         031100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2364.2 91 IMP 313
   000308         031200 BAIL-OUT-WRITE.                                                  NC2364.2
   000309         031300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2364.2 91 191 77 189
   000310         031400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2364.2 122 192
   000311         031500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2364.2 184 38 274
   000312         031600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2364.2 IMP 192
   000313         031700 BAIL-OUT-EX. EXIT.                                               NC2364.2
   000314         031800 CCVS1-EXIT.                                                      NC2364.2
   000315         031900     EXIT.                                                        NC2364.2
   000316         032000 SECT-NC236A-001 SECTION.                                         NC2364.2
   000317         032100 TH-09-001.                                                       NC2364.2
   000318         032200 SCH-INIT-F1-1.                                                   NC2364.2

 ==000318==> IGYPS2015-I The paragraph or section prior to paragraph or section "SCH-INIT-F1-1"
                         did not contain any statements.

   000319         032300     MOVE "SCH-TEST-F1-1" TO PAR-NAME.                            NC2364.2 66
   000320         032400     MOVE "VI-121 6.21.6" TO ANSI-REFERENCE.                      NC2364.2 122
   000321         032500     MOVE "SEARCH " TO FEATURE.                                   NC2364.2 62
   000322         032600     SET A TO 01.                                                 NC2364.2 52
   000323         032700     SET W TO A.                                                  NC2364.2 54 52
   000324         032800 SCH-TEST-F1-1.                                                   NC2364.2
   000325         032900     SEARCH TBL-A VARYING W AT END GO TO SCH-FAIL-F1-1            NC2364.2 52 54 334
   000326         033000         WHEN ELMT-A (A) EQUAL TO  05                             NC2364.2 53 52
   000327      1  033100         SET A TO W.                                              NC2364.2 52 54
   000328         033200     IF ELMT-A (A) EQUAL TO  05                                   NC2364.2 53 52
   000329      1  033300         PERFORM PASS                                             NC2364.2 216
   000330      1  033400         GO TO SCH-WRITE-F1-1.                                    NC2364.2 343
   000331         033500 SCH-DELETE-F1-1.                                                 NC2364.2
   000332         033600     PERFORM DE-LETE.                                             NC2364.2 218
   000333         033700     GO TO SCH-WRITE-F1-1.                                        NC2364.2 343
   000334         033800 SCH-FAIL-F1-1.                                                   NC2364.2
   000335         033900     IF ELMT-A (05) EQUAL TO  05                                  NC2364.2 53
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000336      1  034000         MOVE 05 TO CORRECT-18V0                                  NC2364.2 97
   000337      1  034100         MOVE ELMT-A (05) TO COMPUTED-18V0                        NC2364.2 53 84
   000338      1  034200         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2364.2 71
   000339      1  034300     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK                  NC2364.2 71
   000340      1  034400     MOVE ELMT-A (05) TO COMPUTED-18V0                            NC2364.2 53 84
   000341      1  034500     MOVE 05 TO CORRECT-18V0.                                     NC2364.2 97
   000342         034600     PERFORM FAIL.                                                NC2364.2 217
   000343         034700 SCH-WRITE-F1-1.                                                  NC2364.2
   000344         034800     PERFORM PRINT-DETAIL.                                        NC2364.2 220
   000345         034900*                                                                 NC2364.2
   000346         035000 SCH-INIT-F1-2.                                                   NC2364.2
   000347         035100     MOVE "SCH-TEST-F1-2" TO PAR-NAME.                            NC2364.2 66
   000348         035200     MOVE "VI-121 6.21.6" TO ANSI-REFERENCE.                      NC2364.2 122
   000349         035300     MOVE "SEARCH " TO FEATURE.                                   NC2364.2 62
   000350         035400     SET A TO 09.                                                 NC2364.2 52
   000351         035500     SET W TO A.                                                  NC2364.2 54 52
   000352         035600 SCH-TEST-F1-2.                                                   NC2364.2
   000353         035700     SEARCH TBL-A VARYING W AT END GO TO SCH-FAIL-F1-2            NC2364.2 52 54 362
   000354         035800         WHEN ELMT-A (A) EQUAL TO  10                             NC2364.2 53 52
   000355      1  035900         SET A TO W.                                              NC2364.2 52 54
   000356         036000     IF ELMT-A (A) EQUAL TO  10                                   NC2364.2 53 52
   000357      1  036100         PERFORM PASS                                             NC2364.2 216
   000358      1  036200         GO TO SCH-WRITE-F1-2.                                    NC2364.2 371
   000359         036300 SCH-DELETE-F1-2.                                                 NC2364.2
   000360         036400     PERFORM DE-LETE.                                             NC2364.2 218
   000361         036500     GO TO SCH-WRITE-F1-2.                                        NC2364.2 371
   000362         036600 SCH-FAIL-F1-2.                                                   NC2364.2
   000363         036700     IF ELMT-A (10) EQUAL TO  10                                  NC2364.2 53
   000364      1  036800         MOVE 10 TO CORRECT-18V0                                  NC2364.2 97
   000365      1  036900         MOVE ELMT-A (10) TO COMPUTED-18V0                        NC2364.2 53 84
   000366      1  037000         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2364.2 71
   000367      1  037100     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK                  NC2364.2 71
   000368      1  037200     MOVE ELMT-A (10) TO COMPUTED-18V0                            NC2364.2 53 84
   000369      1  037300     MOVE 10 TO CORRECT-18V0.                                     NC2364.2 97
   000370         037400     PERFORM FAIL.                                                NC2364.2 217
   000371         037500 SCH-WRITE-F1-2.                                                  NC2364.2
   000372         037600     PERFORM PRINT-DETAIL.                                        NC2364.2 220
   000373         037700*                                                                 NC2364.2
   000374         037800 SCH-INIT-F1-3.                                                   NC2364.2
   000375         037900     MOVE "SCH-TEST-F1-3" TO PAR-NAME.                            NC2364.2 66
   000376         038000     MOVE "VI-121 6.21.6" TO ANSI-REFERENCE.                      NC2364.2 122
   000377         038100     MOVE "SEARCH " TO FEATURE.                                   NC2364.2 62
   000378         038200     SET A TO 02.                                                 NC2364.2 52
   000379         038300     SET W TO A.                                                  NC2364.2 54 52
   000380         038400 SCH-TEST-F1-3.                                                   NC2364.2
   000381         038500     SEARCH TBL-A VARYING W AT END GO TO SCH-FAIL-F1-3            NC2364.2 52 54 390
   000382         038600         WHEN ELMT-A (A) EQUAL TO  02                             NC2364.2 53 52
   000383      1  038700         SET A TO W.                                              NC2364.2 52 54
   000384         038800     IF ELMT-A (A) EQUAL TO  02                                   NC2364.2 53 52
   000385      1  038900         PERFORM PASS                                             NC2364.2 216
   000386      1  039000         GO TO SCH-WRITE-F1-3.                                    NC2364.2 399
   000387         039100 SCH-DELETE-F1-3.                                                 NC2364.2
   000388         039200     PERFORM DE-LETE.                                             NC2364.2 218
   000389         039300     GO TO SCH-WRITE-F1-3.                                        NC2364.2 399
   000390         039400 SCH-FAIL-F1-3.                                                   NC2364.2
   000391         039500     IF ELMT-A (02) EQUAL TO  02                                  NC2364.2 53
   000392      1  039600         MOVE 02 TO CORRECT-18V0                                  NC2364.2 97
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393      1  039700         MOVE ELMT-A (02) TO COMPUTED-18V0                        NC2364.2 53 84
   000394      1  039800         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2364.2 71
   000395      1  039900     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK                  NC2364.2 71
   000396      1  040000     MOVE ELMT-A (02) TO COMPUTED-18V0                            NC2364.2 53 84
   000397      1  040100     MOVE 02 TO CORRECT-18V0.                                     NC2364.2 97
   000398         040200     PERFORM FAIL.                                                NC2364.2 217
   000399         040300 SCH-WRITE-F1-3.                                                  NC2364.2
   000400         040400     PERFORM PRINT-DETAIL.                                        NC2364.2 220
   000401         040500*                                                                 NC2364.2
   000402         040600 SCH-INIT-F1-4.                                                   NC2364.2
   000403         040700     MOVE "SCH-TEST-F1-4" TO PAR-NAME.                            NC2364.2 66
   000404         040800     MOVE "VI-121 6.21.6" TO ANSI-REFERENCE.                      NC2364.2 122
   000405         040900     MOVE "SEARCH " TO FEATURE.                                   NC2364.2 62
   000406         041000     SET A TO 07.                                                 NC2364.2 52
   000407         041100     SET W TO A.                                                  NC2364.2 54 52
   000408         041200 SCH-TEST-F1-4.                                                   NC2364.2
   000409         041300     SEARCH TBL-A VARYING W AT END GO TO SCH-FAIL-F1-4            NC2364.2 52 54 418
   000410         041400         WHEN ELMT-A (A) EQUAL TO  07                             NC2364.2 53 52
   000411      1  041500         SET A TO W.                                              NC2364.2 52 54
   000412         041600     IF ELMT-A (A) EQUAL TO  07                                   NC2364.2 53 52
   000413      1  041700         PERFORM PASS                                             NC2364.2 216
   000414      1  041800         GO TO SCH-WRITE-F1-4.                                    NC2364.2 427
   000415         041900 SCH-DELETE-F1-4.                                                 NC2364.2
   000416         042000     PERFORM DE-LETE.                                             NC2364.2 218
   000417         042100     GO TO SCH-WRITE-F1-4.                                        NC2364.2 427
   000418         042200 SCH-FAIL-F1-4.                                                   NC2364.2
   000419         042300     IF ELMT-A (07) EQUAL TO  07                                  NC2364.2 53
   000420      1  042400         MOVE 07 TO CORRECT-18V0                                  NC2364.2 97
   000421      1  042500         MOVE ELMT-A (07) TO COMPUTED-18V0                        NC2364.2 53 84
   000422      1  042600         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2364.2 71
   000423      1  042700     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK                  NC2364.2 71
   000424      1  042800     MOVE ELMT-A (07) TO COMPUTED-18V0                            NC2364.2 53 84
   000425      1  042900     MOVE 07 TO CORRECT-18V0.                                     NC2364.2 97
   000426         043000     PERFORM FAIL.                                                NC2364.2 217
   000427         043100 SCH-WRITE-F1-4.                                                  NC2364.2
   000428         043200     PERFORM PRINT-DETAIL.                                        NC2364.2 220
   000429         043300*                                                                 NC2364.2
   000430         043400 SCH-INIT-F1-5.                                                   NC2364.2
   000431         043500     MOVE "SCH-TEST-F1-5" TO PAR-NAME.                            NC2364.2 66
   000432         043600     MOVE "VI-121 6.21.6" TO ANSI-REFERENCE.                      NC2364.2 122
   000433         043700     MOVE "SEARCH " TO FEATURE.                                   NC2364.2 62
   000434         043800     SET A TO 03.                                                 NC2364.2 52
   000435         043900     SET W TO A.                                                  NC2364.2 54 52
   000436         044000 SCH-TEST-F1-5.                                                   NC2364.2
   000437         044100     SEARCH TBL-A VARYING W AT END GO TO SCH-FAIL-F1-5            NC2364.2 52 54 446
   000438         044200         WHEN ELMT-A (A) EQUAL TO 08                              NC2364.2 53 52
   000439      1  044300         SET A TO W.                                              NC2364.2 52 54
   000440         044400     IF ELMT-A (A) EQUAL TO 08                                    NC2364.2 53 52
   000441      1  044500         PERFORM PASS                                             NC2364.2 216
   000442      1  044600         GO TO SCH-WRITE-F1-5.                                    NC2364.2 455
   000443         044700 SCH-DELETE-F1-5.                                                 NC2364.2
   000444         044800     PERFORM DE-LETE.                                             NC2364.2 218
   000445         044900     GO TO SCH-WRITE-F1-5.                                        NC2364.2 455
   000446         045000 SCH-FAIL-F1-5.                                                   NC2364.2
   000447         045100     IF ELMT-A (08) EQUAL TO 08                                   NC2364.2 53
   000448      1  045200         MOVE 08 TO CORRECT-18V0                                  NC2364.2 97
   000449      1  045300         MOVE ELMT-A (08) TO COMPUTED-18V0                        NC2364.2 53 84
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450      1  045400         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2364.2 71
   000451      1  045500     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK                  NC2364.2 71
   000452      1  045600     MOVE ELMT-A (08) TO COMPUTED-18V0                            NC2364.2 53 84
   000453      1  045700     MOVE 08 TO CORRECT-18V0.                                     NC2364.2 97
   000454         045800     PERFORM FAIL.                                                NC2364.2 217
   000455         045900 SCH-WRITE-F1-5.                                                  NC2364.2
   000456         046000     PERFORM PRINT-DETAIL.                                        NC2364.2 220
   000457         046100*                                                                 NC2364.2
   000458         046200 SCH-INIT-F1-6.                                                   NC2364.2
   000459         046300     MOVE "SCH-TEST-F1-6" TO PAR-NAME.                            NC2364.2 66
   000460         046400     MOVE "VI-121 6.21.6" TO ANSI-REFERENCE.                      NC2364.2 122
   000461         046500     MOVE "SEARCH " TO FEATURE.                                   NC2364.2 62
   000462         046600     SET A B TO 01.                                               NC2364.2 52 58
   000463         046700 SCH-TEST-F1-6.                                                   NC2364.2
   000464         046800     SEARCH TBL-B VARYING A AT END GO TO SCH-FAIL-F1-6            NC2364.2 58 52 471
   000465         046900         WHEN ELMT-B (B) EQUAL TO ELMT-A (8)                      NC2364.2 59 58 53
   000466      1  047000             PERFORM PASS                                         NC2364.2 216
   000467      1  047100             GO TO SCH-WRITE-F1-6.                                NC2364.2 479
   000468         047200 SCH-DELETE-F1-6.                                                 NC2364.2
   000469         047300     PERFORM DE-LETE.                                             NC2364.2 218
   000470         047400     GO TO SCH-WRITE-F1-6.                                        NC2364.2 479
   000471         047500 SCH-FAIL-F1-6.                                                   NC2364.2
   000472         047600     IF ELMT-B (8) EQUAL TO ELMT-A (8)                            NC2364.2 59 53
   000473      1  047700         MOVE 08 TO CORRECT-18V0 COMPUTED-18V0                    NC2364.2 97 84
   000474      1  047800         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2364.2 71
   000475      1  047900     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK                  NC2364.2 71
   000476      1  048000     MOVE ELMT-B (8) TO COMPUTED-18V0                             NC2364.2 59 84
   000477      1  048100     MOVE ELMT-A (8) TO CORRECT-18V0.                             NC2364.2 53 97
   000478         048200     PERFORM FAIL.                                                NC2364.2 217
   000479         048300 SCH-WRITE-F1-6.                                                  NC2364.2
   000480         048400     PERFORM PRINT-DETAIL.                                        NC2364.2 220
   000481         048500*                                                                 NC2364.2
   000482         048600 SCH-INIT-F1-7.                                                   NC2364.2
   000483         048700     MOVE "SCH-TEST-F1-7" TO PAR-NAME.                            NC2364.2 66
   000484         048800     MOVE "VI-121 6.21.6" TO ANSI-REFERENCE.                      NC2364.2 122
   000485         048900     MOVE "SEARCH " TO FEATURE.                                   NC2364.2 62
   000486         049000     SET A B TO 05.                                               NC2364.2 52 58
   000487         049100 SCH-TEST-F1-7.                                                   NC2364.2
   000488         049200     SEARCH TBL-B VARYING A AT END GO TO SCH-FAIL-F1-7            NC2364.2 58 52 495
   000489         049300         WHEN ELMT-B (B) EQUAL TO ELMT-A (10)                     NC2364.2 59 58 53
   000490      1  049400             PERFORM PASS                                         NC2364.2 216
   000491      1  049500             GO TO SCH-WRITE-F1-7.                                NC2364.2 503
   000492         049600 SCH-DELETE-F1-7.                                                 NC2364.2
   000493         049700     PERFORM DE-LETE.                                             NC2364.2 218
   000494         049800     GO TO SCH-WRITE-F1-6.                                        NC2364.2 479
   000495         049900 SCH-FAIL-F1-7.                                                   NC2364.2
   000496         050000     IF ELMT-B (10) EQUAL TO ELMT-A (10)                          NC2364.2 59 53
   000497      1  050100         MOVE 10 TO CORRECT-18V0 COMPUTED-18V0                    NC2364.2 97 84
   000498      1  050200         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2364.2 71
   000499      1  050300     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK                  NC2364.2 71
   000500      1  050400     MOVE ELMT-B (10) TO COMPUTED-18V0                            NC2364.2 59 84
   000501      1  050500     MOVE ELMT-A (10) TO CORRECT-18V0.                            NC2364.2 53 97
   000502         050600     PERFORM FAIL.                                                NC2364.2 217
   000503         050700 SCH-WRITE-F1-7.                                                  NC2364.2
   000504         050800     PERFORM PRINT-DETAIL.                                        NC2364.2 220
   000505         050900*                                                                 NC2364.2
   000506         051000 SCH-INIT-F1-8.                                                   NC2364.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051100     MOVE "SCH-TEST-F1-8" TO PAR-NAME.                            NC2364.2 66
   000508         051200     MOVE "VI-121 6.21.6" TO ANSI-REFERENCE.                      NC2364.2 122
   000509         051300     MOVE "SEARCH " TO FEATURE.                                   NC2364.2 62
   000510         051400     SET A B TO 09.                                               NC2364.2 52 58
   000511         051500 SCH-TEST-F1-8.                                                   NC2364.2
   000512         051600     SEARCH TBL-B VARYING A AT END GO TO SCH-FAIL-F1-8            NC2364.2 58 52 519
   000513         051700         WHEN ELMT-B (09) EQUAL TO ELMT-A (A)                     NC2364.2 59 53 52
   000514      1  051800             PERFORM PASS                                         NC2364.2 216
   000515      1  051900             GO TO SCH-WRITE-F1-8.                                NC2364.2 527
   000516         052000 SCH-DELETE-F1-8.                                                 NC2364.2
   000517         052100     PERFORM DE-LETE.                                             NC2364.2 218
   000518         052200     GO TO SCH-WRITE-F1-8.                                        NC2364.2 527
   000519         052300 SCH-FAIL-F1-8.                                                   NC2364.2
   000520         052400     IF ELMT-B (09) EQUAL TO ELMT-A (09)                          NC2364.2 59 53
   000521      1  052500         MOVE 09 TO CORRECT-18V0 COMPUTED-18V0                    NC2364.2 97 84
   000522      1  052600         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2364.2 71
   000523      1  052700     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK                  NC2364.2 71
   000524      1  052800     MOVE ELMT-B (09) TO COMPUTED-18V0                            NC2364.2 59 84
   000525      1  052900     MOVE ELMT-A (09) TO CORRECT-18V0.                            NC2364.2 53 97
   000526         053000     PERFORM FAIL.                                                NC2364.2 217
   000527         053100 SCH-WRITE-F1-8.                                                  NC2364.2
   000528         053200     PERFORM PRINT-DETAIL.                                        NC2364.2 220
   000529         053300*                                                                 NC2364.2
   000530         053400 SCH-INIT-F1-9.                                                   NC2364.2
   000531         053500     MOVE "SCH-TEST-F1-9" TO PAR-NAME.                            NC2364.2 66
   000532         053600     MOVE "VI-121 6.21.6" TO ANSI-REFERENCE.                      NC2364.2 122
   000533         053700     MOVE "SEARCH " TO FEATURE.                                   NC2364.2 62
   000534         053800     SET A B TO 3.                                                NC2364.2 52 58
   000535         053900 SCH-TEST-F1-9.                                                   NC2364.2
   000536         054000     SEARCH TBL-B VARYING A AT END GO TO SCH-FAIL-F1-9            NC2364.2 58 52 543
   000537         054100         WHEN ELMT-B (B) EQUAL TO ELMT-A (A)                      NC2364.2 59 58 53 52
   000538      1  054200             PERFORM PASS                                         NC2364.2 216
   000539      1  054300             GO TO SCH-WRITE-F1-9.                                NC2364.2 551
   000540         054400 SCH-DELETE-F1-9.                                                 NC2364.2
   000541         054500     PERFORM DE-LETE.                                             NC2364.2 218
   000542         054600     GO TO SCH-WRITE-F1-9.                                        NC2364.2 551
   000543         054700 SCH-FAIL-F1-9.                                                   NC2364.2
   000544         054800     IF ELMT-B (3) EQUAL TO ELMT-A (3)                            NC2364.2 59 53
   000545      1  054900         MOVE 03 TO CORRECT-18V0 COMPUTED-18V0                    NC2364.2 97 84
   000546      1  055000         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2364.2 71
   000547      1  055100     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK                  NC2364.2 71
   000548      1  055200     MOVE ELMT-B (3) TO COMPUTED-18V0                             NC2364.2 59 84
   000549      1  055300     MOVE ELMT-A (3) TO CORRECT-18V0.                             NC2364.2 53 97
   000550         055400     PERFORM FAIL.                                                NC2364.2 217
   000551         055500 SCH-WRITE-F1-9.                                                  NC2364.2
   000552         055600     PERFORM PRINT-DETAIL.                                        NC2364.2 220
   000553         055700*                                                                 NC2364.2
   000554         055800 SCH-INIT-F1-10.                                                  NC2364.2
   000555         055900     MOVE "SCH-TEST-F1-10" TO PAR-NAME.                           NC2364.2 66
   000556         056000     MOVE "VI-121 6.21.6" TO ANSI-REFERENCE.                      NC2364.2 122
   000557         056100     MOVE "SEARCH " TO FEATURE.                                   NC2364.2 62
   000558         056200     SET A B TO 06.                                               NC2364.2 52 58
   000559         056300 SCH-TEST-F1-10.                                                  NC2364.2
   000560         056400     SEARCH TBL-B VARYING A AT END GO TO SCH-FAIL-F1-10           NC2364.2 58 52 567
   000561         056500         WHEN ELMT-B (9) EQUAL TO ELMT-A (9)                      NC2364.2 59 53
   000562      1  056600             PERFORM PASS                                         NC2364.2 216
   000563      1  056700             GO TO SCH-WRITE-F1-10.                               NC2364.2 575
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564         056800 SCH-DELETE-F1-10.                                                NC2364.2
   000565         056900     PERFORM DE-LETE.                                             NC2364.2 218
   000566         057000     GO TO SCH-WRITE-F1-10.                                       NC2364.2 575
   000567         057100 SCH-FAIL-F1-10.                                                  NC2364.2
   000568         057200     IF ELMT-B (9) EQUAL TO ELMT-A (9)                            NC2364.2 59 53
   000569      1  057300         MOVE 09 TO CORRECT-18V0 COMPUTED-18V0                    NC2364.2 97 84
   000570      1  057400         MOVE "SEE NOTE 1 FOR DIAGNOSTIC" TO RE-MARK ELSE         NC2364.2 71
   000571      1  057500     MOVE "SEE NOTE 2 FOR DIAGNOSTIC" TO RE-MARK                  NC2364.2 71
   000572      1  057600     MOVE ELMT-B (9) TO COMPUTED-18V0                             NC2364.2 59 84
   000573      1  057700     MOVE ELMT-A (9) TO CORRECT-18V0.                             NC2364.2 53 97
   000574         057800     PERFORM FAIL.                                                NC2364.2 217
   000575         057900 SCH-WRITE-F1-10.                                                 NC2364.2
   000576         058000     PERFORM PRINT-DETAIL.                                        NC2364.2 220
   000577         058100*                                                                 NC2364.2
   000578         058200 CCVS-EXIT SECTION.                                               NC2364.2
   000579         058300 CCVS-999999.                                                     NC2364.2
   000580         058400     GO TO CLOSE-FILES.                                           NC2364.2 209
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       52   A. . . . . . . . . . . . . . .  M322 323 326 M327 328 M350 351 354 M355 356 M378 379 382 M383 384 M406 407 410
                                            M411 412 M434 435 438 M439 440 M462 M464 M486 M488 M510 M512 513 M534 M536 537
                                            M558 M560
      122   ANSI-REFERENCE . . . . . . . .  294 301 310 M320 M348 M376 M404 M432 M460 M484 M508 M532 M556
       58   B. . . . . . . . . . . . . . .  M462 465 M486 489 M510 M534 537 M558
      101   CCVS-C-1 . . . . . . . . . . .  238 280
      106   CCVS-C-2 . . . . . . . . . . .  239 281
      156   CCVS-E-1 . . . . . . . . . . .  244
      161   CCVS-E-2 . . . . . . . . . . .  253 260 267 272
      164   CCVS-E-2-2 . . . . . . . . . .  M252
      169   CCVS-E-3 . . . . . . . . . . .  273
      178   CCVS-E-4 . . . . . . . . . . .  252
      179   CCVS-E-4-1 . . . . . . . . . .  M250
      181   CCVS-E-4-2 . . . . . . . . . .  M251
      123   CCVS-H-1 . . . . . . . . . . .  233
      128   CCVS-H-2A. . . . . . . . . . .  234
      137   CCVS-H-2B. . . . . . . . . . .  235
      149   CCVS-H-3 . . . . . . . . . . .  236
      199   CCVS-PGM-ID. . . . . . . . . .  205 205
       83   CM-18V0
       77   COMPUTED-A . . . . . . . . . .  78 80 81 82 83 306 309
       78   COMPUTED-N
       76   COMPUTED-X . . . . . . . . . .  M228 292
       80   COMPUTED-0V18
       82   COMPUTED-14V4
       84   COMPUTED-18V0. . . . . . . . .  M337 M340 M365 M368 M393 M396 M421 M424 M449 M452 M473 M476 M497 M500 M521 M524
                                            M545 M548 M569 M572
       81   COMPUTED-4V14
      100   COR-ANSI-REFERENCE . . . . . .  M301 M303
       91   CORRECT-A. . . . . . . . . . .  92 93 94 95 96 307 309
       92   CORRECT-N
       90   CORRECT-X. . . . . . . . . . .  M229 293
       93   CORRECT-0V18
       95   CORRECT-14V4
       97   CORRECT-18V0 . . . . . . . . .  M336 M341 M364 M369 M392 M397 M420 M425 M448 M453 M473 M477 M497 M501 M521 M525
                                            M545 M549 M569 M573
       94   CORRECT-4V14
       96   CR-18V0
      114   DELETE-COUNTER . . . . . . . .  M218 247 263 265
       69   DOTVALUE . . . . . . . . . . .  M223
      120   DUMMY-HOLD . . . . . . . . . .  M277 283
       38   DUMMY-RECORD . . . . . . . . .  M233 M234 M235 M236 M238 M239 M240 M242 M244 M253 M260 M267 M272 M273 277 M278
                                            279 M280 M281 M282 M283 287 M288 M296 M311
       53   ELMT-A . . . . . . . . . . . .  326 328 335 337 340 354 356 363 365 368 382 384 391 393 396 410 412 419 421 424
                                            438 440 447 449 452 465 472 477 489 496 501 513 520 525 537 544 549 561 568 573
       59   ELMT-B . . . . . . . . . . . .  465 472 476 489 496 500 513 520 524 537 544 548 561 568 572
      167   ENDER-DESC . . . . . . . . . .  M255 M266 M271
      115   ERROR-COUNTER. . . . . . . . .  M217 246 256 259
      119   ERROR-HOLD . . . . . . . . . .  M246 M247 M247 M248 251
      165   ERROR-TOTAL. . . . . . . . . .  M257 M259 M264 M265 M269 M270
       62   FEATURE. . . . . . . . . . . .  M321 M349 M377 M405 M433 M461 M485 M509 M533 M557
      193   HYPHEN-LINE. . . . . . . . . .  240 242 282
      159   ID-AGAIN . . . . . . . . . . .  M205
       55   INDEX-VALUE
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page    15
0 Defined   Cross-reference of data names   References

0     192   INF-ANSI-REFERENCE . . . . . .  M294 M297 M310 M312
      187   INFO-TEXT. . . . . . . . . . .  M295
      116   INSPECT-COUNTER. . . . . . . .  M215 246 268 270
       40   NOTE-1
       45   NOTE-2
       64   P-OR-F . . . . . . . . . . . .  M215 M216 M217 M218 225 M228
       66   PAR-NAME . . . . . . . . . . .  M230 M319 M347 M375 M403 M431 M459 M483 M507 M531 M555
       68   PARDOT-X . . . . . . . . . . .  M222
      117   PASS-COUNTER . . . . . . . . .  M216 248 250
       36   PRINT-FILE . . . . . . . . . .  32 204 210
       37   PRINT-REC. . . . . . . . . . .  M224 M300 M302
       71   RE-MARK. . . . . . . . . . . .  M219 M231 M338 M339 M366 M367 M394 M395 M422 M423 M450 M451 M474 M475 M498 M499
                                            M522 M523 M546 M547 M570 M571
      113   REC-CT . . . . . . . . . . . .  221 223 230
      112   REC-SKL-SUB
      121   RECORD-COUNT . . . . . . . . .  M275 276 M284
       50   TABLE-A. . . . . . . . . . . .  51
       56   TABLE-B. . . . . . . . . . . .  57
       51   TABLE-1
       57   TABLE-2
       52   TBL-A. . . . . . . . . . . . .  325 353 381 409 437
       58   TBL-B. . . . . . . . . . . . .  464 488 512 536 560
       72   TEST-COMPUTED. . . . . . . . .  300
       87   TEST-CORRECT . . . . . . . . .  302
      140   TEST-ID. . . . . . . . . . . .  M205
       60   TEST-RESULTS . . . . . . . . .  M206 224
      118   TOTAL-ERROR
       54   W. . . . . . . . . . . . . . .  M323 M325 327 M351 M353 355 M379 M381 383 M407 M409 411 M435 M437 439
      189   XXCOMPUTED . . . . . . . . . .  M309
      191   XXCORRECT. . . . . . . . . . .  M309
      184   XXINFO . . . . . . . . . . . .  296 311
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page    16
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

      305   BAIL-OUT . . . . . . . . . . .  P227
      313   BAIL-OUT-EX. . . . . . . . . .  E227 G307
      308   BAIL-OUT-WRITE . . . . . . . .  G306
      289   BLANK-LINE-PRINT
      578   CCVS-EXIT
      579   CCVS-999999
      202   CCVS1
      314   CCVS1-EXIT . . . . . . . . . .  G208
      209   CLOSE-FILES. . . . . . . . . .  G580
      237   COLUMN-NAMES-ROUTINE . . . . .  E207
      218   DE-LETE. . . . . . . . . . . .  P332 P360 P388 P416 P444 P469 P493 P517 P541 P565
      241   END-ROUTINE. . . . . . . . . .  P210
      245   END-ROUTINE-1
      254   END-ROUTINE-12
      262   END-ROUTINE-13 . . . . . . . .  E210
      243   END-RTN-EXIT
      217   FAIL . . . . . . . . . . . . .  P342 P370 P398 P426 P454 P478 P502 P526 P550 P574
      291   FAIL-ROUTINE . . . . . . . . .  P226
      304   FAIL-ROUTINE-EX. . . . . . . .  E226 G298
      299   FAIL-ROUTINE-WRITE . . . . . .  G292 G293
      232   HEAD-ROUTINE . . . . . . . . .  P207
      215   INSPT
      203   OPEN-FILES
      216   PASS . . . . . . . . . . . . .  P329 P357 P385 P413 P441 P466 P490 P514 P538 P562
      220   PRINT-DETAIL . . . . . . . . .  P344 P372 P400 P428 P456 P480 P504 P528 P552 P576
      331   SCH-DELETE-F1-1
      564   SCH-DELETE-F1-10
      359   SCH-DELETE-F1-2
      387   SCH-DELETE-F1-3
      415   SCH-DELETE-F1-4
      443   SCH-DELETE-F1-5
      468   SCH-DELETE-F1-6
      492   SCH-DELETE-F1-7
      516   SCH-DELETE-F1-8
      540   SCH-DELETE-F1-9
      334   SCH-FAIL-F1-1. . . . . . . . .  G325
      567   SCH-FAIL-F1-10 . . . . . . . .  G560
      362   SCH-FAIL-F1-2. . . . . . . . .  G353
      390   SCH-FAIL-F1-3. . . . . . . . .  G381
      418   SCH-FAIL-F1-4. . . . . . . . .  G409
      446   SCH-FAIL-F1-5. . . . . . . . .  G437
      471   SCH-FAIL-F1-6. . . . . . . . .  G464
      495   SCH-FAIL-F1-7. . . . . . . . .  G488
      519   SCH-FAIL-F1-8. . . . . . . . .  G512
      543   SCH-FAIL-F1-9. . . . . . . . .  G536
      318   SCH-INIT-F1-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page    17
0 Defined   Cross-reference of procedures   References

0     554   SCH-INIT-F1-10
      346   SCH-INIT-F1-2
      374   SCH-INIT-F1-3
      402   SCH-INIT-F1-4
      430   SCH-INIT-F1-5
      458   SCH-INIT-F1-6
      482   SCH-INIT-F1-7
      506   SCH-INIT-F1-8
      530   SCH-INIT-F1-9
      324   SCH-TEST-F1-1
      559   SCH-TEST-F1-10
      352   SCH-TEST-F1-2
      380   SCH-TEST-F1-3
      408   SCH-TEST-F1-4
      436   SCH-TEST-F1-5
      463   SCH-TEST-F1-6
      487   SCH-TEST-F1-7
      511   SCH-TEST-F1-8
      535   SCH-TEST-F1-9
      343   SCH-WRITE-F1-1 . . . . . . . .  G330 G333
      575   SCH-WRITE-F1-10. . . . . . . .  G563 G566
      371   SCH-WRITE-F1-2 . . . . . . . .  G358 G361
      399   SCH-WRITE-F1-3 . . . . . . . .  G386 G389
      427   SCH-WRITE-F1-4 . . . . . . . .  G414 G417
      455   SCH-WRITE-F1-5 . . . . . . . .  G442 G445
      479   SCH-WRITE-F1-6 . . . . . . . .  G467 G470 G494
      503   SCH-WRITE-F1-7 . . . . . . . .  G491
      527   SCH-WRITE-F1-8 . . . . . . . .  G515 G518
      551   SCH-WRITE-F1-9 . . . . . . . .  G539 G542
      316   SECT-NC236A-001
      213   TERMINATE-CALL
      211   TERMINATE-CCVS
      317   TH-09-001
      274   WRITE-LINE . . . . . . . . . .  P224 P225 P233 P234 P235 P236 P238 P239 P240 P242 P244 P253 P261 P267 P272 P273
                                            P296 P300 P302 P311
      286   WRT-LN . . . . . . . . . . . .  P280 P281 P282 P285 P290
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page    18
0 Defined   Cross-reference of programs     References

        3   NC236A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC236A    Date 06/04/2022  Time 11:58:55   Page    19
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    318  IGYPS2015-I   The paragraph or section prior to paragraph or section "SCH-INIT-F1-1" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC236A:
 *    Source records = 580
 *    Data Division statements = 75
 *    Procedure Division statements = 328
 *    Generated COBOL statements = 0
 *    Program complexity factor = 335
0End of compilation 1,  program NC236A,  highest severity 0.
0Return code 0
