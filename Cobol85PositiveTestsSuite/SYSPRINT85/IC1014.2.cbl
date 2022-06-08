1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:19   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:19   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1014.2
   000002         000200 PROGRAM-ID.                                                      IC1014.2
   000003         000300     IC101A.                                                      IC1014.2
   000004         000500*                                                              *  IC1014.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1014.2
   000006         000700*                                                              *  IC1014.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1014.2
   000008         000900*                                                              *  IC1014.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1014.2
   000010         001100*                                                              *  IC1014.2
   000011         001300*                                                              *  IC1014.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1014.2
   000013         001500*                                                              *  IC1014.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1014.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1014.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1014.2
   000017         001900*                                                              *  IC1014.2
   000018         002100*         THIS ROUTINE CHECKS THE USE OF THE CALL STATEMENT       IC1014.2
   000019         002200*    WITH ONE PARAMETER IN THE USING PHRASE.  SUBSEQUENT CALLS    IC1014.2
   000020         002300*    CHECK THAT THE CALLED ROUTINE REMAINS IN THE LAST USED STATE.IC1014.2
   000021         002400*                                                                 IC1014.2
   000022         002500*        THERE ARE NO DELETE PARAGRAPHS IN THIS ROUTINE           IC1014.2
   000023         002600*    SINCE THESE ARE THE BASIC CALL TESTS AND IF A CALL           IC1014.2
   000024         002700*    STATEMENT IS REJECTED THERE IS NO REASON TO RUN THE ROUTINE. IC1014.2
   000025         002800*                                                                 IC1014.2
   000026         002900*    THE FIRST THREE CALLS USE A DATA-NAME THE SAME AS            IC1014.2
   000027         003000*    THE NAME IN THE SUBPROGRAM.  THE LAST TWO CALLS USE          IC1014.2
   000028         003100*    A DIFFERENT DATA-NAME FROM THE NAME IN THE SUBPROGRAM.       IC1014.2
   000029         003200*    THE PICTURE CLAUSES FOR DATA-NAMES IN THE USING PHRASES      IC1014.2
   000030         003300*    OF THE CALLED AND CALLING PROGRAMS ARE IDENTICAL.            IC1014.2
   000031         003400 ENVIRONMENT DIVISION.                                            IC1014.2
   000032         003500 CONFIGURATION SECTION.                                           IC1014.2
   000033         003600 SOURCE-COMPUTER.                                                 IC1014.2
   000034         003700     XXXXX082.                                                    IC1014.2
   000035         003800 OBJECT-COMPUTER.                                                 IC1014.2
   000036         003900     XXXXX083.                                                    IC1014.2
   000037         004000 INPUT-OUTPUT SECTION.                                            IC1014.2
   000038         004100 FILE-CONTROL.                                                    IC1014.2
   000039         004200     SELECT PRINT-FILE ASSIGN TO                                  IC1014.2 43
   000040         004300     XXXXX055.                                                    IC1014.2
   000041         004400 DATA DIVISION.                                                   IC1014.2
   000042         004500 FILE SECTION.                                                    IC1014.2
   000043         004600 FD  PRINT-FILE.                                                  IC1014.2

 ==000043==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000044         004700 01  PRINT-REC PICTURE X(120).                                    IC1014.2
   000045         004800 01  DUMMY-RECORD PICTURE X(120).                                 IC1014.2
   000046         004900 WORKING-STORAGE SECTION.                                         IC1014.2
   000047         005000 77  DN1 PICTURE S9  VALUE ZERO.                                  IC1014.2 IMP
   000048         005100 77  DN2 PICTURE S9  VALUE ZERO.                                  IC1014.2 IMP
   000049         005200 01  TEST-RESULTS.                                                IC1014.2
   000050         005300     02 FILLER                   PIC X      VALUE SPACE.          IC1014.2 IMP
   000051         005400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC1014.2 IMP
   000052         005500     02 FILLER                   PIC X      VALUE SPACE.          IC1014.2 IMP
   000053         005600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC1014.2 IMP
   000054         005700     02 FILLER                   PIC X      VALUE SPACE.          IC1014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02  PAR-NAME.                                                IC1014.2
   000056         005900       03 FILLER                 PIC X(19)  VALUE SPACE.          IC1014.2 IMP
   000057         006000       03  PARDOT-X              PIC X      VALUE SPACE.          IC1014.2 IMP
   000058         006100       03 DOTVALUE               PIC 99     VALUE ZERO.           IC1014.2 IMP
   000059         006200     02 FILLER                   PIC X(8)   VALUE SPACE.          IC1014.2 IMP
   000060         006300     02 RE-MARK                  PIC X(61).                       IC1014.2
   000061         006400 01  TEST-COMPUTED.                                               IC1014.2
   000062         006500     02 FILLER                   PIC X(30)  VALUE SPACE.          IC1014.2 IMP
   000063         006600     02 FILLER                   PIC X(17)  VALUE                 IC1014.2
   000064         006700            "       COMPUTED=".                                   IC1014.2
   000065         006800     02 COMPUTED-X.                                               IC1014.2
   000066         006900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC1014.2 IMP
   000067         007000     03 COMPUTED-N               REDEFINES COMPUTED-A             IC1014.2 66
   000068         007100                                 PIC -9(9).9(9).                  IC1014.2
   000069         007200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC1014.2 66
   000070         007300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC1014.2 66
   000071         007400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC1014.2 66
   000072         007500     03       CM-18V0 REDEFINES COMPUTED-A.                       IC1014.2 66
   000073         007600         04 COMPUTED-18V0                    PIC -9(18).          IC1014.2
   000074         007700         04 FILLER                           PIC X.               IC1014.2
   000075         007800     03 FILLER PIC X(50) VALUE SPACE.                             IC1014.2 IMP
   000076         007900 01  TEST-CORRECT.                                                IC1014.2
   000077         008000     02 FILLER PIC X(30) VALUE SPACE.                             IC1014.2 IMP
   000078         008100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC1014.2
   000079         008200     02 CORRECT-X.                                                IC1014.2
   000080         008300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC1014.2 IMP
   000081         008400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC1014.2 80
   000082         008500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC1014.2 80
   000083         008600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC1014.2 80
   000084         008700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC1014.2 80
   000085         008800     03      CR-18V0 REDEFINES CORRECT-A.                         IC1014.2 80
   000086         008900         04 CORRECT-18V0                     PIC -9(18).          IC1014.2
   000087         009000         04 FILLER                           PIC X.               IC1014.2
   000088         009100     03 FILLER PIC X(2) VALUE SPACE.                              IC1014.2 IMP
   000089         009200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC1014.2 IMP
   000090         009300 01  CCVS-C-1.                                                    IC1014.2
   000091         009400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC1014.2
   000092         009500-    "SS  PARAGRAPH-NAME                                          IC1014.2
   000093         009600-    "       REMARKS".                                            IC1014.2
   000094         009700     02 FILLER                     PIC X(20)    VALUE SPACE.      IC1014.2 IMP
   000095         009800 01  CCVS-C-2.                                                    IC1014.2
   000096         009900     02 FILLER                     PIC X        VALUE SPACE.      IC1014.2 IMP
   000097         010000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC1014.2
   000098         010100     02 FILLER                     PIC X(15)    VALUE SPACE.      IC1014.2 IMP
   000099         010200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC1014.2
   000100         010300     02 FILLER                     PIC X(94)    VALUE SPACE.      IC1014.2 IMP
   000101         010400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC1014.2 IMP
   000102         010500 01  REC-CT                        PIC 99       VALUE ZERO.       IC1014.2 IMP
   000103         010600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC1014.2 IMP
   000104         010700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC1014.2 IMP
   000105         010800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC1014.2 IMP
   000106         010900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC1014.2 IMP
   000107         011000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC1014.2 IMP
   000108         011100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC1014.2 IMP
   000109         011200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC1014.2 IMP
   000110         011300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC1014.2 IMP
   000111         011400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC1014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  CCVS-H-1.                                                    IC1014.2
   000113         011600     02  FILLER                    PIC X(39)    VALUE SPACES.     IC1014.2 IMP
   000114         011700     02  FILLER                    PIC X(42)    VALUE             IC1014.2
   000115         011800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC1014.2
   000116         011900     02  FILLER                    PIC X(39)    VALUE SPACES.     IC1014.2 IMP
   000117         012000 01  CCVS-H-2A.                                                   IC1014.2
   000118         012100   02  FILLER                        PIC X(40)  VALUE SPACE.      IC1014.2 IMP
   000119         012200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC1014.2
   000120         012300   02  FILLER                        PIC XXXX   VALUE             IC1014.2
   000121         012400     "4.2 ".                                                      IC1014.2
   000122         012500   02  FILLER                        PIC X(28)  VALUE             IC1014.2
   000123         012600            " COPY - NOT FOR DISTRIBUTION".                       IC1014.2
   000124         012700   02  FILLER                        PIC X(41)  VALUE SPACE.      IC1014.2 IMP
   000125         012800                                                                  IC1014.2
   000126         012900 01  CCVS-H-2B.                                                   IC1014.2
   000127         013000   02  FILLER                        PIC X(15)  VALUE             IC1014.2
   000128         013100            "TEST RESULT OF ".                                    IC1014.2
   000129         013200   02  TEST-ID                       PIC X(9).                    IC1014.2
   000130         013300   02  FILLER                        PIC X(4)   VALUE             IC1014.2
   000131         013400            " IN ".                                               IC1014.2
   000132         013500   02  FILLER                        PIC X(12)  VALUE             IC1014.2
   000133         013600     " HIGH       ".                                              IC1014.2
   000134         013700   02  FILLER                        PIC X(22)  VALUE             IC1014.2
   000135         013800            " LEVEL VALIDATION FOR ".                             IC1014.2
   000136         013900   02  FILLER                        PIC X(58)  VALUE             IC1014.2
   000137         014000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1014.2
   000138         014100 01  CCVS-H-3.                                                    IC1014.2
   000139         014200     02  FILLER                      PIC X(34)  VALUE             IC1014.2
   000140         014300            " FOR OFFICIAL USE ONLY    ".                         IC1014.2
   000141         014400     02  FILLER                      PIC X(58)  VALUE             IC1014.2
   000142         014500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1014.2
   000143         014600     02  FILLER                      PIC X(28)  VALUE             IC1014.2
   000144         014700            "  COPYRIGHT   1985 ".                                IC1014.2
   000145         014800 01  CCVS-E-1.                                                    IC1014.2
   000146         014900     02 FILLER                       PIC X(52)  VALUE SPACE.      IC1014.2 IMP
   000147         015000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC1014.2
   000148         015100     02 ID-AGAIN                     PIC X(9).                    IC1014.2
   000149         015200     02 FILLER                       PIC X(45)  VALUE SPACES.     IC1014.2 IMP
   000150         015300 01  CCVS-E-2.                                                    IC1014.2
   000151         015400     02  FILLER                      PIC X(31)  VALUE SPACE.      IC1014.2 IMP
   000152         015500     02  FILLER                      PIC X(21)  VALUE SPACE.      IC1014.2 IMP
   000153         015600     02 CCVS-E-2-2.                                               IC1014.2
   000154         015700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC1014.2 IMP
   000155         015800         03 FILLER                   PIC X      VALUE SPACE.      IC1014.2 IMP
   000156         015900         03 ENDER-DESC               PIC X(44)  VALUE             IC1014.2
   000157         016000            "ERRORS ENCOUNTERED".                                 IC1014.2
   000158         016100 01  CCVS-E-3.                                                    IC1014.2
   000159         016200     02  FILLER                      PIC X(22)  VALUE             IC1014.2
   000160         016300            " FOR OFFICIAL USE ONLY".                             IC1014.2
   000161         016400     02  FILLER                      PIC X(12)  VALUE SPACE.      IC1014.2 IMP
   000162         016500     02  FILLER                      PIC X(58)  VALUE             IC1014.2
   000163         016600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1014.2
   000164         016700     02  FILLER                      PIC X(13)  VALUE SPACE.      IC1014.2 IMP
   000165         016800     02 FILLER                       PIC X(15)  VALUE             IC1014.2
   000166         016900             " COPYRIGHT 1985".                                   IC1014.2
   000167         017000 01  CCVS-E-4.                                                    IC1014.2
   000168         017100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC1014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 FILLER                       PIC X(4)   VALUE " OF ".     IC1014.2
   000170         017300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC1014.2 IMP
   000171         017400     02 FILLER                       PIC X(40)  VALUE             IC1014.2
   000172         017500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC1014.2
   000173         017600 01  XXINFO.                                                      IC1014.2
   000174         017700     02 FILLER                       PIC X(19)  VALUE             IC1014.2
   000175         017800            "*** INFORMATION ***".                                IC1014.2
   000176         017900     02 INFO-TEXT.                                                IC1014.2
   000177         018000       04 FILLER                     PIC X(8)   VALUE SPACE.      IC1014.2 IMP
   000178         018100       04 XXCOMPUTED                 PIC X(20).                   IC1014.2
   000179         018200       04 FILLER                     PIC X(5)   VALUE SPACE.      IC1014.2 IMP
   000180         018300       04 XXCORRECT                  PIC X(20).                   IC1014.2
   000181         018400     02 INF-ANSI-REFERENCE           PIC X(48).                   IC1014.2
   000182         018500 01  HYPHEN-LINE.                                                 IC1014.2
   000183         018600     02 FILLER  PIC IS X VALUE IS SPACE.                          IC1014.2 IMP
   000184         018700     02 FILLER  PIC IS X(65)    VALUE IS "************************IC1014.2
   000185         018800-    "*****************************************".                 IC1014.2
   000186         018900     02 FILLER  PIC IS X(54)    VALUE IS "************************IC1014.2
   000187         019000-    "******************************".                            IC1014.2
   000188         019100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC1014.2
   000189         019200     "IC101A".                                                    IC1014.2
   000190         019300 PROCEDURE DIVISION.                                              IC1014.2
   000191         019400 CCVS1 SECTION.                                                   IC1014.2
   000192         019500 OPEN-FILES.                                                      IC1014.2
   000193         019600     OPEN     OUTPUT PRINT-FILE.                                  IC1014.2 43
   000194         019700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC1014.2 188 129 188 148
   000195         019800     MOVE    SPACE TO TEST-RESULTS.                               IC1014.2 IMP 49
   000196         019900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC1014.2 221 226
   000197         020000     GO TO CCVS1-EXIT.                                            IC1014.2 303
   000198         020100 CLOSE-FILES.                                                     IC1014.2
   000199         020200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC1014.2 230 251 43
   000200         020300 TERMINATE-CCVS.                                                  IC1014.2
   000201         020400     EXIT PROGRAM.                                                IC1014.2
   000202         020500 TERMINATE-CALL.                                                  IC1014.2
   000203         020600     STOP     RUN.                                                IC1014.2
   000204         020700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC1014.2 53 105
   000205         020800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC1014.2 53 106
   000206         020900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC1014.2 53 104
   000207         021000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC1014.2 53 103
   000208         021100     MOVE "****TEST DELETED****" TO RE-MARK.                      IC1014.2 60
   000209         021200 PRINT-DETAIL.                                                    IC1014.2
   000210         021300     IF REC-CT NOT EQUAL TO ZERO                                  IC1014.2 102 IMP
   000211      1  021400             MOVE "." TO PARDOT-X                                 IC1014.2 57
   000212      1  021500             MOVE REC-CT TO DOTVALUE.                             IC1014.2 102 58
   000213         021600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC1014.2 49 44 263
   000214         021700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC1014.2 53 263
   000215      1  021800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC1014.2 280 293
   000216      1  021900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC1014.2 294 302
   000217         022000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC1014.2 IMP 53 IMP 65
   000218         022100     MOVE SPACE TO CORRECT-X.                                     IC1014.2 IMP 79
   000219         022200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC1014.2 102 IMP IMP 55
   000220         022300     MOVE     SPACE TO RE-MARK.                                   IC1014.2 IMP 60
   000221         022400 HEAD-ROUTINE.                                                    IC1014.2
   000222         022500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC1014.2 112 45 263
   000223         022600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC1014.2 117 45 263
   000224         022700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC1014.2 126 45 263
   000225         022800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC1014.2 138 45 263
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 COLUMN-NAMES-ROUTINE.                                            IC1014.2
   000227         023000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1014.2 90 45 263
   000228         023100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1014.2 95 45 263
   000229         023200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC1014.2 182 45 263
   000230         023300 END-ROUTINE.                                                     IC1014.2
   000231         023400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC1014.2 182 45 263
   000232         023500 END-RTN-EXIT.                                                    IC1014.2
   000233         023600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1014.2 145 45 263
   000234         023700 END-ROUTINE-1.                                                   IC1014.2
   000235         023800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC1014.2 104 108 105
   000236         023900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC1014.2 108 103 108
   000237         024000      ADD PASS-COUNTER TO ERROR-HOLD.                             IC1014.2 106 108
   000238         024100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC1014.2
   000239         024200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC1014.2 106 168
   000240         024300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC1014.2 108 170
   000241         024400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC1014.2 167 153
   000242         024500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC1014.2 150 45 263
   000243         024600  END-ROUTINE-12.                                                 IC1014.2
   000244         024700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC1014.2 156
   000245         024800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC1014.2 104 IMP
   000246      1  024900         MOVE "NO " TO ERROR-TOTAL                                IC1014.2 154
   000247         025000         ELSE                                                     IC1014.2
   000248      1  025100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC1014.2 104 154
   000249         025200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC1014.2 150 45
   000250         025300     PERFORM WRITE-LINE.                                          IC1014.2 263
   000251         025400 END-ROUTINE-13.                                                  IC1014.2
   000252         025500     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC1014.2 103 IMP
   000253      1  025600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC1014.2 154
   000254      1  025700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC1014.2 103 154
   000255         025800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC1014.2 156
   000256         025900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1014.2 150 45 263
   000257         026000      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC1014.2 105 IMP
   000258      1  026100          MOVE "NO " TO ERROR-TOTAL                               IC1014.2 154
   000259      1  026200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC1014.2 105 154
   000260         026300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC1014.2 156
   000261         026400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC1014.2 150 45 263
   000262         026500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1014.2 158 45 263
   000263         026600 WRITE-LINE.                                                      IC1014.2
   000264         026700     ADD 1 TO RECORD-COUNT.                                       IC1014.2 110
   000265         026800     IF RECORD-COUNT GREATER 50                                   IC1014.2 110
   000266      1  026900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC1014.2 45 109
   000267      1  027000         MOVE SPACE TO DUMMY-RECORD                               IC1014.2 IMP 45
   000268      1  027100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC1014.2 45
   000269      1  027200         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC1014.2 90 45 275
   000270      1  027300         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC1014.2 95 45 275
   000271      1  027400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC1014.2 182 45 275
   000272      1  027500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC1014.2 109 45
   000273      1  027600         MOVE ZERO TO RECORD-COUNT.                               IC1014.2 IMP 110
   000274         027700     PERFORM WRT-LN.                                              IC1014.2 275
   000275         027800 WRT-LN.                                                          IC1014.2
   000276         027900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC1014.2 45
   000277         028000     MOVE SPACE TO DUMMY-RECORD.                                  IC1014.2 IMP 45
   000278         028100 BLANK-LINE-PRINT.                                                IC1014.2
   000279         028200     PERFORM WRT-LN.                                              IC1014.2 275
   000280         028300 FAIL-ROUTINE.                                                    IC1014.2
   000281         028400     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC1014.2 65 IMP 288
   000282         028500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC1014.2 79 IMP 288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC1014.2 111 181
   000284         028700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC1014.2 176
   000285         028800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1014.2 173 45 263
   000286         028900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC1014.2 IMP 181
   000287         029000     GO TO  FAIL-ROUTINE-EX.                                      IC1014.2 293
   000288         029100 FAIL-ROUTINE-WRITE.                                              IC1014.2
   000289         029200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC1014.2 61 44 263
   000290         029300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC1014.2 111 89
   000291         029400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC1014.2 76 44 263
   000292         029500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC1014.2 IMP 89
   000293         029600 FAIL-ROUTINE-EX. EXIT.                                           IC1014.2
   000294         029700 BAIL-OUT.                                                        IC1014.2
   000295         029800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC1014.2 66 IMP 297
   000296         029900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC1014.2 80 IMP 302
   000297         030000 BAIL-OUT-WRITE.                                                  IC1014.2
   000298         030100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC1014.2 80 180 66 178
   000299         030200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC1014.2 111 181
   000300         030300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1014.2 173 45 263
   000301         030400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC1014.2 IMP 181
   000302         030500 BAIL-OUT-EX. EXIT.                                               IC1014.2
   000303         030600 CCVS1-EXIT.                                                      IC1014.2
   000304         030700     EXIT.                                                        IC1014.2
   000305         030800 SECT-IC101-0001 SECTION.                                         IC1014.2
   000306         030900 CALL-INIT-1.                                                     IC1014.2
   000307         031000     MOVE "CALL...USING DATA-NM" TO FEATURE.                      IC1014.2 51
   000308         031100     MOVE "CALL-TEST-01" TO PAR-NAME.                             IC1014.2 55
   000309         031200 CALL-TEST-1.                                                     IC1014.2
   000310         031300     CALL "IC102A" USING DN1.                                     IC1014.2 EXT 47
   000311         031400     IF DN1 IS EQUAL TO 1                                         IC1014.2 47
   000312      1  031500         PERFORM PASS                                             IC1014.2 205
   000313      1  031600             GO TO CALL-WRITE-1.                                  IC1014.2 318
   000314         031700 CALL-FAIL-1.                                                     IC1014.2
   000315         031800     MOVE 1 TO CORRECT-18V0.                                      IC1014.2 86
   000316         031900     MOVE DN1 TO COMPUTED-18V0.                                   IC1014.2 47 73
   000317         032000     PERFORM FAIL.                                                IC1014.2 206
   000318         032100 CALL-WRITE-1.                                                    IC1014.2
   000319         032200     PERFORM PRINT-DETAIL.                                        IC1014.2 209
   000320         032300 CALL-INIT-2.                                                     IC1014.2
   000321         032400     MOVE 0 TO DN1.                                               IC1014.2 47
   000322         032500 CALL-TEST-2.                                                     IC1014.2
   000323         032600     CALL "IC102A" USING DN1.                                     IC1014.2 EXT 47
   000324         032700     IF DN1 IS EQUAL TO 2                                         IC1014.2 47
   000325      1  032800         PERFORM PASS                                             IC1014.2 205
   000326      1  032900             GO TO CALL-WRITE-2.                                  IC1014.2 331
   000327         033000 CALL-FAIL-2.                                                     IC1014.2
   000328         033100     MOVE 2 TO CORRECT-18V0.                                      IC1014.2 86
   000329         033200     MOVE DN1 TO COMPUTED-18V0.                                   IC1014.2 47 73
   000330         033300     PERFORM FAIL.                                                IC1014.2 206
   000331         033400 CALL-WRITE-2.                                                    IC1014.2
   000332         033500     MOVE "CALL-TEST-02" TO PAR-NAME.                             IC1014.2 55
   000333         033600     PERFORM PRINT-DETAIL.                                        IC1014.2 209
   000334         033700 CALL-INIT-3.                                                     IC1014.2
   000335         033800     ADD 4 TO DN1.                                                IC1014.2 47
   000336         033900 CALL-TEST-3.                                                     IC1014.2
   000337         034000     CALL "IC102A" USING DN1.                                     IC1014.2 EXT 47
   000338         034100     IF DN1 IS EQUAL TO 3                                         IC1014.2 47
   000339      1  034200         PERFORM PASS                                             IC1014.2 205
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340      1  034300             GO TO CALL-WRITE-3.                                  IC1014.2 345
   000341         034400 CALL-FAIL-3.                                                     IC1014.2
   000342         034500     MOVE 3 TO CORRECT-18V0.                                      IC1014.2 86
   000343         034600     MOVE DN1 TO COMPUTED-18V0.                                   IC1014.2 47 73
   000344         034700     PERFORM FAIL.                                                IC1014.2 206
   000345         034800 CALL-WRITE-3.                                                    IC1014.2
   000346         034900     MOVE "CALL-TEST-03" TO PAR-NAME.                             IC1014.2 55
   000347         035000     PERFORM PRINT-DETAIL.                                        IC1014.2 209
   000348         035100 CALL-TEST-4.                                                     IC1014.2
   000349         035200     CALL "IC102A" USING DN2.                                     IC1014.2 EXT 48
   000350         035300     IF DN2 IS NOT EQUAL TO 4                                     IC1014.2 48
   000351      1  035400             GO TO CALL-FAIL-4.                                   IC1014.2 354
   000352         035500     PERFORM PASS.                                                IC1014.2 205
   000353         035600     GO TO CALL-WRITE-4.                                          IC1014.2 358
   000354         035700 CALL-FAIL-4.                                                     IC1014.2
   000355         035800     MOVE 4 TO CORRECT-18V0.                                      IC1014.2 86
   000356         035900     MOVE DN2 TO COMPUTED-18V0.                                   IC1014.2 48 73
   000357         036000     PERFORM FAIL.                                                IC1014.2 206
   000358         036100 CALL-WRITE-4.                                                    IC1014.2
   000359         036200     MOVE "CALL-TEST-04" TO PAR-NAME.                             IC1014.2 55
   000360         036300     PERFORM PRINT-DETAIL.                                        IC1014.2 209
   000361         036400 CALL-INIT-5.                                                     IC1014.2
   000362         036500     MOVE 0 TO DN2.                                               IC1014.2 48
   000363         036600 CALL-TEST-5.                                                     IC1014.2
   000364         036700     CALL "IC102A" USING DN2.                                     IC1014.2 EXT 48
   000365         036800     IF DN2 IS EQUAL TO 5                                         IC1014.2 48
   000366      1  036900         PERFORM PASS                                             IC1014.2 205
   000367      1  037000             GO TO CALL-WRITE-5.                                  IC1014.2 372
   000368         037100 CALL-FAIL-5.                                                     IC1014.2
   000369         037200     MOVE 5 TO CORRECT-18V0.                                      IC1014.2 86
   000370         037300     MOVE DN2 TO COMPUTED-18V0.                                   IC1014.2 48 73
   000371         037400     PERFORM FAIL.                                                IC1014.2 206
   000372         037500 CALL-WRITE-5.                                                    IC1014.2
   000373         037600     MOVE "CALL-TEST-05" TO PAR-NAME.                             IC1014.2 55
   000374         037700     PERFORM PRINT-DETAIL.                                        IC1014.2 209
   000375         037800 CALL-END-ROUTINE.                                                IC1014.2
   000376         037900     GO TO CCVS-EXIT.                                             IC1014.2 377
   000377         038000 CCVS-EXIT SECTION.                                               IC1014.2
   000378         038100 CCVS-999999.                                                     IC1014.2
   000379         038200     GO TO CLOSE-FILES.                                           IC1014.2 198
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page    10
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      111   ANSI-REFERENCE . . . . . . . .  283 290 299
       90   CCVS-C-1 . . . . . . . . . . .  227 269
       95   CCVS-C-2 . . . . . . . . . . .  228 270
      145   CCVS-E-1 . . . . . . . . . . .  233
      150   CCVS-E-2 . . . . . . . . . . .  242 249 256 261
      153   CCVS-E-2-2 . . . . . . . . . .  M241
      158   CCVS-E-3 . . . . . . . . . . .  262
      167   CCVS-E-4 . . . . . . . . . . .  241
      168   CCVS-E-4-1 . . . . . . . . . .  M239
      170   CCVS-E-4-2 . . . . . . . . . .  M240
      112   CCVS-H-1 . . . . . . . . . . .  222
      117   CCVS-H-2A. . . . . . . . . . .  223
      126   CCVS-H-2B. . . . . . . . . . .  224
      138   CCVS-H-3 . . . . . . . . . . .  225
      188   CCVS-PGM-ID. . . . . . . . . .  194 194
       72   CM-18V0
       66   COMPUTED-A . . . . . . . . . .  67 69 70 71 72 295 298
       67   COMPUTED-N
       65   COMPUTED-X . . . . . . . . . .  M217 281
       69   COMPUTED-0V18
       71   COMPUTED-14V4
       73   COMPUTED-18V0. . . . . . . . .  M316 M329 M343 M356 M370
       70   COMPUTED-4V14
       89   COR-ANSI-REFERENCE . . . . . .  M290 M292
       80   CORRECT-A. . . . . . . . . . .  81 82 83 84 85 296 298
       81   CORRECT-N
       79   CORRECT-X. . . . . . . . . . .  M218 282
       82   CORRECT-0V18
       84   CORRECT-14V4
       86   CORRECT-18V0 . . . . . . . . .  M315 M328 M342 M355 M369
       83   CORRECT-4V14
       85   CR-18V0
      103   DELETE-COUNTER . . . . . . . .  M207 236 252 254
       47   DN1. . . . . . . . . . . . . .  310 311 316 M321 323 324 329 M335 337 338 343
       48   DN2. . . . . . . . . . . . . .  349 350 356 M362 364 365 370
       58   DOTVALUE . . . . . . . . . . .  M212
      109   DUMMY-HOLD . . . . . . . . . .  M266 272
       45   DUMMY-RECORD . . . . . . . . .  M222 M223 M224 M225 M227 M228 M229 M231 M233 M242 M249 M256 M261 M262 266 M267
                                            268 M269 M270 M271 M272 276 M277 M285 M300
      156   ENDER-DESC . . . . . . . . . .  M244 M255 M260
      104   ERROR-COUNTER. . . . . . . . .  M206 235 245 248
      108   ERROR-HOLD . . . . . . . . . .  M235 M236 M236 M237 240
      154   ERROR-TOTAL. . . . . . . . . .  M246 M248 M253 M254 M258 M259
       51   FEATURE. . . . . . . . . . . .  M307
      182   HYPHEN-LINE. . . . . . . . . .  229 231 271
      148   ID-AGAIN . . . . . . . . . . .  M194
      181   INF-ANSI-REFERENCE . . . . . .  M283 M286 M299 M301
      176   INFO-TEXT. . . . . . . . . . .  M284
      105   INSPECT-COUNTER. . . . . . . .  M204 235 257 259
       53   P-OR-F . . . . . . . . . . . .  M204 M205 M206 M207 214 M217
       55   PAR-NAME . . . . . . . . . . .  M219 M308 M332 M346 M359 M373
       57   PARDOT-X . . . . . . . . . . .  M211
      106   PASS-COUNTER . . . . . . . . .  M205 237 239
       43   PRINT-FILE . . . . . . . . . .  39 193 199
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page    11
0 Defined   Cross-reference of data names   References

0      44   PRINT-REC. . . . . . . . . . .  M213 M289 M291
       60   RE-MARK. . . . . . . . . . . .  M208 M220
      102   REC-CT . . . . . . . . . . . .  210 212 219
      101   REC-SKL-SUB
      110   RECORD-COUNT . . . . . . . . .  M264 265 M273
       61   TEST-COMPUTED. . . . . . . . .  289
       76   TEST-CORRECT . . . . . . . . .  291
      129   TEST-ID. . . . . . . . . . . .  M194
       49   TEST-RESULTS . . . . . . . . .  M195 213
      107   TOTAL-ERROR
      178   XXCOMPUTED . . . . . . . . . .  M298
      180   XXCORRECT. . . . . . . . . . .  M298
      173   XXINFO . . . . . . . . . . . .  285 300
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page    12
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

      294   BAIL-OUT . . . . . . . . . . .  P216
      302   BAIL-OUT-EX. . . . . . . . . .  E216 G296
      297   BAIL-OUT-WRITE . . . . . . . .  G295
      278   BLANK-LINE-PRINT
      375   CALL-END-ROUTINE
      314   CALL-FAIL-1
      327   CALL-FAIL-2
      341   CALL-FAIL-3
      354   CALL-FAIL-4. . . . . . . . . .  G351
      368   CALL-FAIL-5
      306   CALL-INIT-1
      320   CALL-INIT-2
      334   CALL-INIT-3
      361   CALL-INIT-5
      309   CALL-TEST-1
      322   CALL-TEST-2
      336   CALL-TEST-3
      348   CALL-TEST-4
      363   CALL-TEST-5
      318   CALL-WRITE-1 . . . . . . . . .  G313
      331   CALL-WRITE-2 . . . . . . . . .  G326
      345   CALL-WRITE-3 . . . . . . . . .  G340
      358   CALL-WRITE-4 . . . . . . . . .  G353
      372   CALL-WRITE-5 . . . . . . . . .  G367
      377   CCVS-EXIT. . . . . . . . . . .  G376
      378   CCVS-999999
      191   CCVS1
      303   CCVS1-EXIT . . . . . . . . . .  G197
      198   CLOSE-FILES. . . . . . . . . .  G379
      226   COLUMN-NAMES-ROUTINE . . . . .  E196
      207   DE-LETE
      230   END-ROUTINE. . . . . . . . . .  P199
      234   END-ROUTINE-1
      243   END-ROUTINE-12
      251   END-ROUTINE-13 . . . . . . . .  E199
      232   END-RTN-EXIT
      206   FAIL . . . . . . . . . . . . .  P317 P330 P344 P357 P371
      280   FAIL-ROUTINE . . . . . . . . .  P215
      293   FAIL-ROUTINE-EX. . . . . . . .  E215 G287
      288   FAIL-ROUTINE-WRITE . . . . . .  G281 G282
      221   HEAD-ROUTINE . . . . . . . . .  P196
      204   INSPT
      192   OPEN-FILES
      205   PASS . . . . . . . . . . . . .  P312 P325 P339 P352 P366
      209   PRINT-DETAIL . . . . . . . . .  P319 P333 P347 P360 P374
      305   SECT-IC101-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page    13
0 Defined   Cross-reference of procedures   References

0     202   TERMINATE-CALL
      200   TERMINATE-CCVS
      263   WRITE-LINE . . . . . . . . . .  P213 P214 P222 P223 P224 P225 P227 P228 P229 P231 P233 P242 P250 P256 P261 P262
                                            P285 P289 P291 P300
      275   WRT-LN . . . . . . . . . . . .  P269 P270 P271 P274 P279
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page    14
0 Defined   Cross-reference of programs     References

        3   IC101A
 EXTERNAL   IC102A . . . . . . . . . . . .  310 323 337 349 364
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC101A    Date 06/04/2022  Time 11:57:19   Page    15
0LineID  Message code  Message text

     43  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC101A:
 *    Source records = 379
 *    Data Division statements = 65
 *    Procedure Division statements = 179
 *    Generated COBOL statements = 0
 *    Program complexity factor = 186
0End of compilation 1,  program IC101A,  highest severity 0.
0Return code 0
