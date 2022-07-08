1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:08   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:08   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2034.2
   000002         000200 PROGRAM-ID.                                                      IC2034.2
   000003         000300     IC203A.                                                      IC2034.2
   000004         000500*                                                              *  IC2034.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2034.2
   000006         000700*                                                              *  IC2034.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2034.2
   000008         000900*                                                              *  IC2034.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2034.2
   000010         001100*                                                              *  IC2034.2
   000011         001300*                                                              *  IC2034.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2034.2
   000013         001500*                                                              *  IC2034.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2034.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2034.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2034.2
   000017         001900*                                                              *  IC2034.2
   000018         002100*        THE PROGRAM IC203 TESTS THE USE OF THE CANCEL         *  IC2034.2
   000019         002200*    STATEMENT.  THIS PROGRAM VERIFIES THAT THE INITIAL        *  IC2034.2
   000020         002300*    CALL TO A SUBPROGRAM AND THE FIRST CALL AFTER A CANCEL    *  IC2034.2
   000021         002400*    RESULTS IN A SUBPROGRAM BEING INITIATED IN ITS INITIAL    *  IC2034.2
   000022         002500*    STATE.  THE PROGRAM ALSO CANCELS A PROGRAM WHICH HAS      *  IC2034.2
   000023         002600*    NOT BEEN CALLED, IN WHICH CASE CONTROL SHOULD PASS        *  IC2034.2
   000024         002700*    TO THE NEXT SENTENCE.                                     *  IC2034.2
   000025         002900 ENVIRONMENT DIVISION.                                            IC2034.2
   000026         003000 CONFIGURATION SECTION.                                           IC2034.2
   000027         003100 SOURCE-COMPUTER.                                                 IC2034.2
   000028         003200     XXXXX082.                                                    IC2034.2
   000029         003300 OBJECT-COMPUTER.                                                 IC2034.2
   000030         003400     XXXXX083.                                                    IC2034.2
   000031         003500 INPUT-OUTPUT SECTION.                                            IC2034.2
   000032         003600 FILE-CONTROL.                                                    IC2034.2
   000033         003700     SELECT PRINT-FILE ASSIGN TO                                  IC2034.2 37
   000034         003800     XXXXX055.                                                    IC2034.2
   000035         003900 DATA DIVISION.                                                   IC2034.2
   000036         004000 FILE SECTION.                                                    IC2034.2
   000037         004100 FD  PRINT-FILE.                                                  IC2034.2

 ==000037==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000038         004200 01  PRINT-REC PICTURE X(120).                                    IC2034.2
   000039         004300 01  DUMMY-RECORD PICTURE X(120).                                 IC2034.2
   000040         004400 WORKING-STORAGE SECTION.                                         IC2034.2
   000041         004500 77  ID1 PICTURE X(6)     VALUE "IC204A".                         IC2034.2
   000042         004600 77  ID2 PICTURE X(6)     VALUE "IC206A".                         IC2034.2
   000043         004700 77  DN1 PICTURE S999.                                            IC2034.2
   000044         004800 77  DN5 PICTURE S999.                                            IC2034.2
   000045         004900 01  TABLE-1.                                                     IC2034.2
   000046         005000     02  DN2 PICTURE XXX.                                         IC2034.2
   000047         005100     02  DN3 PICTURE 99.                                          IC2034.2
   000048         005200     02  DN4 PICTURE X(5).                                        IC2034.2
   000049         005300 01  TABLE-2.                                                     IC2034.2
   000050         005400     02  DN6 PICTURE X                                            IC2034.2
   000051         005500             OCCURS 2 TIMES.                                      IC2034.2
   000052         005600 01  TEST-RESULTS.                                                IC2034.2
   000053         005700     02 FILLER                   PIC X      VALUE SPACE.          IC2034.2 IMP
   000054         005800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2034.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02 FILLER                   PIC X      VALUE SPACE.          IC2034.2 IMP
   000056         006000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2034.2 IMP
   000057         006100     02 FILLER                   PIC X      VALUE SPACE.          IC2034.2 IMP
   000058         006200     02  PAR-NAME.                                                IC2034.2
   000059         006300       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2034.2 IMP
   000060         006400       03  PARDOT-X              PIC X      VALUE SPACE.          IC2034.2 IMP
   000061         006500       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2034.2 IMP
   000062         006600     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2034.2 IMP
   000063         006700     02 RE-MARK                  PIC X(61).                       IC2034.2
   000064         006800 01  TEST-COMPUTED.                                               IC2034.2
   000065         006900     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2034.2 IMP
   000066         007000     02 FILLER                   PIC X(17)  VALUE                 IC2034.2
   000067         007100            "       COMPUTED=".                                   IC2034.2
   000068         007200     02 COMPUTED-X.                                               IC2034.2
   000069         007300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2034.2 IMP
   000070         007400     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2034.2 69
   000071         007500                                 PIC -9(9).9(9).                  IC2034.2
   000072         007600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2034.2 69
   000073         007700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2034.2 69
   000074         007800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2034.2 69
   000075         007900     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2034.2 69
   000076         008000         04 COMPUTED-18V0                    PIC -9(18).          IC2034.2
   000077         008100         04 FILLER                           PIC X.               IC2034.2
   000078         008200     03 FILLER PIC X(50) VALUE SPACE.                             IC2034.2 IMP
   000079         008300 01  TEST-CORRECT.                                                IC2034.2
   000080         008400     02 FILLER PIC X(30) VALUE SPACE.                             IC2034.2 IMP
   000081         008500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2034.2
   000082         008600     02 CORRECT-X.                                                IC2034.2
   000083         008700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2034.2 IMP
   000084         008800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2034.2 83
   000085         008900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2034.2 83
   000086         009000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2034.2 83
   000087         009100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2034.2 83
   000088         009200     03      CR-18V0 REDEFINES CORRECT-A.                         IC2034.2 83
   000089         009300         04 CORRECT-18V0                     PIC -9(18).          IC2034.2
   000090         009400         04 FILLER                           PIC X.               IC2034.2
   000091         009500     03 FILLER PIC X(2) VALUE SPACE.                              IC2034.2 IMP
   000092         009600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2034.2 IMP
   000093         009700 01  CCVS-C-1.                                                    IC2034.2
   000094         009800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2034.2
   000095         009900-    "SS  PARAGRAPH-NAME                                          IC2034.2
   000096         010000-    "       REMARKS".                                            IC2034.2
   000097         010100     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2034.2 IMP
   000098         010200 01  CCVS-C-2.                                                    IC2034.2
   000099         010300     02 FILLER                     PIC X        VALUE SPACE.      IC2034.2 IMP
   000100         010400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2034.2
   000101         010500     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2034.2 IMP
   000102         010600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2034.2
   000103         010700     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2034.2 IMP
   000104         010800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2034.2 IMP
   000105         010900 01  REC-CT                        PIC 99       VALUE ZERO.       IC2034.2 IMP
   000106         011000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2034.2 IMP
   000107         011100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2034.2 IMP
   000108         011200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2034.2 IMP
   000109         011300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2034.2 IMP
   000110         011400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2034.2 IMP
   000111         011500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2034.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2034.2 IMP
   000113         011700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2034.2 IMP
   000114         011800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2034.2 IMP
   000115         011900 01  CCVS-H-1.                                                    IC2034.2
   000116         012000     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2034.2 IMP
   000117         012100     02  FILLER                    PIC X(42)    VALUE             IC2034.2
   000118         012200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2034.2
   000119         012300     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2034.2 IMP
   000120         012400 01  CCVS-H-2A.                                                   IC2034.2
   000121         012500   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2034.2 IMP
   000122         012600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2034.2
   000123         012700   02  FILLER                        PIC XXXX   VALUE             IC2034.2
   000124         012800     "4.2 ".                                                      IC2034.2
   000125         012900   02  FILLER                        PIC X(28)  VALUE             IC2034.2
   000126         013000            " COPY - NOT FOR DISTRIBUTION".                       IC2034.2
   000127         013100   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2034.2 IMP
   000128         013200                                                                  IC2034.2
   000129         013300 01  CCVS-H-2B.                                                   IC2034.2
   000130         013400   02  FILLER                        PIC X(15)  VALUE             IC2034.2
   000131         013500            "TEST RESULT OF ".                                    IC2034.2
   000132         013600   02  TEST-ID                       PIC X(9).                    IC2034.2
   000133         013700   02  FILLER                        PIC X(4)   VALUE             IC2034.2
   000134         013800            " IN ".                                               IC2034.2
   000135         013900   02  FILLER                        PIC X(12)  VALUE             IC2034.2
   000136         014000     " HIGH       ".                                              IC2034.2
   000137         014100   02  FILLER                        PIC X(22)  VALUE             IC2034.2
   000138         014200            " LEVEL VALIDATION FOR ".                             IC2034.2
   000139         014300   02  FILLER                        PIC X(58)  VALUE             IC2034.2
   000140         014400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2034.2
   000141         014500 01  CCVS-H-3.                                                    IC2034.2
   000142         014600     02  FILLER                      PIC X(34)  VALUE             IC2034.2
   000143         014700            " FOR OFFICIAL USE ONLY    ".                         IC2034.2
   000144         014800     02  FILLER                      PIC X(58)  VALUE             IC2034.2
   000145         014900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2034.2
   000146         015000     02  FILLER                      PIC X(28)  VALUE             IC2034.2
   000147         015100            "  COPYRIGHT   1985 ".                                IC2034.2
   000148         015200 01  CCVS-E-1.                                                    IC2034.2
   000149         015300     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2034.2 IMP
   000150         015400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2034.2
   000151         015500     02 ID-AGAIN                     PIC X(9).                    IC2034.2
   000152         015600     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2034.2 IMP
   000153         015700 01  CCVS-E-2.                                                    IC2034.2
   000154         015800     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2034.2 IMP
   000155         015900     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2034.2 IMP
   000156         016000     02 CCVS-E-2-2.                                               IC2034.2
   000157         016100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2034.2 IMP
   000158         016200         03 FILLER                   PIC X      VALUE SPACE.      IC2034.2 IMP
   000159         016300         03 ENDER-DESC               PIC X(44)  VALUE             IC2034.2
   000160         016400            "ERRORS ENCOUNTERED".                                 IC2034.2
   000161         016500 01  CCVS-E-3.                                                    IC2034.2
   000162         016600     02  FILLER                      PIC X(22)  VALUE             IC2034.2
   000163         016700            " FOR OFFICIAL USE ONLY".                             IC2034.2
   000164         016800     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2034.2 IMP
   000165         016900     02  FILLER                      PIC X(58)  VALUE             IC2034.2
   000166         017000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2034.2
   000167         017100     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2034.2 IMP
   000168         017200     02 FILLER                       PIC X(15)  VALUE             IC2034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300             " COPYRIGHT 1985".                                   IC2034.2
   000170         017400 01  CCVS-E-4.                                                    IC2034.2
   000171         017500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2034.2 IMP
   000172         017600     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2034.2
   000173         017700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2034.2 IMP
   000174         017800     02 FILLER                       PIC X(40)  VALUE             IC2034.2
   000175         017900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2034.2
   000176         018000 01  XXINFO.                                                      IC2034.2
   000177         018100     02 FILLER                       PIC X(19)  VALUE             IC2034.2
   000178         018200            "*** INFORMATION ***".                                IC2034.2
   000179         018300     02 INFO-TEXT.                                                IC2034.2
   000180         018400       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2034.2 IMP
   000181         018500       04 XXCOMPUTED                 PIC X(20).                   IC2034.2
   000182         018600       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2034.2 IMP
   000183         018700       04 XXCORRECT                  PIC X(20).                   IC2034.2
   000184         018800     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2034.2
   000185         018900 01  HYPHEN-LINE.                                                 IC2034.2
   000186         019000     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2034.2 IMP
   000187         019100     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2034.2
   000188         019200-    "*****************************************".                 IC2034.2
   000189         019300     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2034.2
   000190         019400-    "******************************".                            IC2034.2
   000191         019500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2034.2
   000192         019600     "IC203A".                                                    IC2034.2
   000193         019700 PROCEDURE DIVISION.                                              IC2034.2
   000194         019800 CCVS1 SECTION.                                                   IC2034.2
   000195         019900 OPEN-FILES.                                                      IC2034.2
   000196         020000     OPEN     OUTPUT PRINT-FILE.                                  IC2034.2 37
   000197         020100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2034.2 191 132 191 151
   000198         020200     MOVE    SPACE TO TEST-RESULTS.                               IC2034.2 IMP 52
   000199         020300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2034.2 224 229
   000200         020400     GO TO CCVS1-EXIT.                                            IC2034.2 306
   000201         020500 CLOSE-FILES.                                                     IC2034.2
   000202         020600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2034.2 233 254 37
   000203         020700 TERMINATE-CCVS.                                                  IC2034.2
   000204         020800     EXIT PROGRAM.                                                IC2034.2
   000205         020900 TERMINATE-CALL.                                                  IC2034.2
   000206         021000     STOP     RUN.                                                IC2034.2
   000207         021100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2034.2 56 108
   000208         021200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2034.2 56 109
   000209         021300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2034.2 56 107
   000210         021400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2034.2 56 106
   000211         021500     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2034.2 63
   000212         021600 PRINT-DETAIL.                                                    IC2034.2
   000213         021700     IF REC-CT NOT EQUAL TO ZERO                                  IC2034.2 105 IMP
   000214      1  021800             MOVE "." TO PARDOT-X                                 IC2034.2 60
   000215      1  021900             MOVE REC-CT TO DOTVALUE.                             IC2034.2 105 61
   000216         022000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2034.2 52 38 266
   000217         022100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2034.2 56 266
   000218      1  022200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2034.2 283 296
   000219      1  022300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2034.2 297 305
   000220         022400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2034.2 IMP 56 IMP 68
   000221         022500     MOVE SPACE TO CORRECT-X.                                     IC2034.2 IMP 82
   000222         022600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2034.2 105 IMP IMP 58
   000223         022700     MOVE     SPACE TO RE-MARK.                                   IC2034.2 IMP 63
   000224         022800 HEAD-ROUTINE.                                                    IC2034.2
   000225         022900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2034.2 115 39 266
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2034.2 120 39 266
   000227         023100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2034.2 129 39 266
   000228         023200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2034.2 141 39 266
   000229         023300 COLUMN-NAMES-ROUTINE.                                            IC2034.2
   000230         023400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2034.2 93 39 266
   000231         023500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2034.2 98 39 266
   000232         023600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2034.2 185 39 266
   000233         023700 END-ROUTINE.                                                     IC2034.2
   000234         023800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2034.2 185 39 266
   000235         023900 END-RTN-EXIT.                                                    IC2034.2
   000236         024000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2034.2 148 39 266
   000237         024100 END-ROUTINE-1.                                                   IC2034.2
   000238         024200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2034.2 107 111 108
   000239         024300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2034.2 111 106 111
   000240         024400      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2034.2 109 111
   000241         024500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2034.2
   000242         024600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2034.2 109 171
   000243         024700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2034.2 111 173
   000244         024800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2034.2 170 156
   000245         024900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2034.2 153 39 266
   000246         025000  END-ROUTINE-12.                                                 IC2034.2
   000247         025100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2034.2 159
   000248         025200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2034.2 107 IMP
   000249      1  025300         MOVE "NO " TO ERROR-TOTAL                                IC2034.2 157
   000250         025400         ELSE                                                     IC2034.2
   000251      1  025500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2034.2 107 157
   000252         025600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2034.2 153 39
   000253         025700     PERFORM WRITE-LINE.                                          IC2034.2 266
   000254         025800 END-ROUTINE-13.                                                  IC2034.2
   000255         025900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2034.2 106 IMP
   000256      1  026000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2034.2 157
   000257      1  026100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2034.2 106 157
   000258         026200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2034.2 159
   000259         026300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2034.2 153 39 266
   000260         026400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2034.2 108 IMP
   000261      1  026500          MOVE "NO " TO ERROR-TOTAL                               IC2034.2 157
   000262      1  026600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2034.2 108 157
   000263         026700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2034.2 159
   000264         026800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2034.2 153 39 266
   000265         026900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2034.2 161 39 266
   000266         027000 WRITE-LINE.                                                      IC2034.2
   000267         027100     ADD 1 TO RECORD-COUNT.                                       IC2034.2 113
   000268         027200     IF RECORD-COUNT GREATER 50                                   IC2034.2 113
   000269      1  027300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2034.2 39 112
   000270      1  027400         MOVE SPACE TO DUMMY-RECORD                               IC2034.2 IMP 39
   000271      1  027500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2034.2 39
   000272      1  027600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2034.2 93 39 278
   000273      1  027700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2034.2 98 39 278
   000274      1  027800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2034.2 185 39 278
   000275      1  027900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2034.2 112 39
   000276      1  028000         MOVE ZERO TO RECORD-COUNT.                               IC2034.2 IMP 113
   000277         028100     PERFORM WRT-LN.                                              IC2034.2 278
   000278         028200 WRT-LN.                                                          IC2034.2
   000279         028300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2034.2 39
   000280         028400     MOVE SPACE TO DUMMY-RECORD.                                  IC2034.2 IMP 39
   000281         028500 BLANK-LINE-PRINT.                                                IC2034.2
   000282         028600     PERFORM WRT-LN.                                              IC2034.2 278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700 FAIL-ROUTINE.                                                    IC2034.2
   000284         028800     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2034.2 68 IMP 291
   000285         028900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2034.2 82 IMP 291
   000286         029000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2034.2 114 184
   000287         029100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2034.2 179
   000288         029200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2034.2 176 39 266
   000289         029300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2034.2 IMP 184
   000290         029400     GO TO  FAIL-ROUTINE-EX.                                      IC2034.2 296
   000291         029500 FAIL-ROUTINE-WRITE.                                              IC2034.2
   000292         029600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2034.2 64 38 266
   000293         029700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2034.2 114 92
   000294         029800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2034.2 79 38 266
   000295         029900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2034.2 IMP 92
   000296         030000 FAIL-ROUTINE-EX. EXIT.                                           IC2034.2
   000297         030100 BAIL-OUT.                                                        IC2034.2
   000298         030200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2034.2 69 IMP 300
   000299         030300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2034.2 83 IMP 305
   000300         030400 BAIL-OUT-WRITE.                                                  IC2034.2
   000301         030500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2034.2 83 183 69 181
   000302         030600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2034.2 114 184
   000303         030700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2034.2 176 39 266
   000304         030800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2034.2 IMP 184
   000305         030900 BAIL-OUT-EX. EXIT.                                               IC2034.2
   000306         031000 CCVS1-EXIT.                                                      IC2034.2
   000307         031100     EXIT.                                                        IC2034.2
   000308         031200 SECT-IC203-0001 SECTION.                                         IC2034.2
   000309         031300 CALL-TEST-04.                                                    IC2034.2
   000310         031400*        CALL-TEST-04 VERIFIES THAT A PROGRAM IS IN ITS           IC2034.2
   000311         031500*    INITIAL STATE THE FIRST TIME IT IS CALLED.                   IC2034.2
   000312         031600     MOVE "CALL-TEST-04" TO PAR-NAME.                             IC2034.2 58
   000313         031700     MOVE "INITIAL STATE" TO FEATURE.                             IC2034.2 54
   000314         031800     MOVE 1 TO DN3.                                               IC2034.2 47
   000315         031900     MOVE SPACE TO DN2, DN4.                                      IC2034.2 IMP 46 48
   000316         032000     MOVE ZERO TO DN1.                                            IC2034.2 IMP 43
   000317         032100     CALL ID1 USING TABLE-1, DN1.                                 IC2034.2 41 45 43
   000318         032200     GO TO CALL-TEST-04-01.                                       IC2034.2 323
   000319         032300 CALL-DELETE-04.                                                  IC2034.2
   000320         032400     PERFORM DE-LETE.                                             IC2034.2 210
   000321         032500     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000322         032600     GO TO CALL-TEST-05.                                          IC2034.2 359
   000323         032700 CALL-TEST-04-01.                                                 IC2034.2
   000324         032800     MOVE 1 TO REC-CT.                                            IC2034.2 105
   000325         032900     IF DN1 IS EQUAL TO 1                                         IC2034.2 43
   000326      1  033000         PERFORM PASS                                             IC2034.2 208
   000327      1  033100         GO TO CALL-WRITE-04-01.                                  IC2034.2 333
   000328         033200 CALL-FAIL-04-01.                                                 IC2034.2
   000329         033300     PERFORM FAIL.                                                IC2034.2 209
   000330         033400     MOVE DN1 TO COMPUTED-18V0.                                   IC2034.2 43 76
   000331         033500     MOVE 1 TO CORRECT-18V0.                                      IC2034.2 89
   000332         033600     MOVE "DN1 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000333         033700 CALL-WRITE-04-01.                                                IC2034.2
   000334         033800     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000335         033900 CALL-TEST-04-02.                                                 IC2034.2
   000336         034000     ADD 1 TO REC-CT.                                             IC2034.2 105
   000337         034100     IF DN2 IS EQUAL TO "YES"                                     IC2034.2 46
   000338      1  034200         PERFORM PASS                                             IC2034.2 208
   000339      1  034300         GO TO CALL-WRITE-04-02.                                  IC2034.2 345
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400 CALL-FAIL-04-02.                                                 IC2034.2
   000341         034500     PERFORM FAIL.                                                IC2034.2 209
   000342         034600     MOVE DN2 TO COMPUTED-A.                                      IC2034.2 46 69
   000343         034700     MOVE "YES" TO CORRECT-A.                                     IC2034.2 83
   000344         034800     MOVE "DN2 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000345         034900 CALL-WRITE-04-02.                                                IC2034.2
   000346         035000     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000347         035100 CALL-TEST-04-03.                                                 IC2034.2
   000348         035200     ADD 1 TO REC-CT.                                             IC2034.2 105
   000349         035300     IF DN4 EQUAL TO "EQUAL"                                      IC2034.2 48
   000350      1  035400         PERFORM PASS                                             IC2034.2 208
   000351      1  035500         GO TO CALL-WRITE-04-03.                                  IC2034.2 357
   000352         035600 CALL-FAIL-04-03.                                                 IC2034.2
   000353         035700     PERFORM FAIL.                                                IC2034.2 209
   000354         035800     MOVE DN4 TO COMPUTED-A.                                      IC2034.2 48 69
   000355         035900     MOVE "EQUAL" TO CORRECT-A.                                   IC2034.2 83
   000356         036000     MOVE "DN4 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000357         036100 CALL-WRITE-04-03.                                                IC2034.2
   000358         036200     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000359         036300 CALL-TEST-05.                                                    IC2034.2
   000360         036400     MOVE "CALL-TEST-05" TO PAR-NAME.                             IC2034.2 58
   000361         036500     MOVE "STATE UNCHANGED" TO FEATURE.                           IC2034.2 54
   000362         036600*        CALL-TEST-05 TESTS THAT THE STATE OF THE SUBPROGRAM      IC2034.2
   000363         036700*    IS UNCHANGED FROM ITS STATE WHEN LAST EXITED.                IC2034.2
   000364         036800     MOVE 2 TO DN3.                                               IC2034.2 47
   000365         036900     MOVE SPACE TO DN2, DN4.                                      IC2034.2 IMP 46 48
   000366         037000     MOVE ZERO TO DN5.                                            IC2034.2 IMP 44
   000367         037100     CALL ID1 USING TABLE-1, DN5.                                 IC2034.2 41 45 44
   000368         037200     GO TO CALL-TEST-05-01.                                       IC2034.2 373
   000369         037300 CALL-DELETE-05.                                                  IC2034.2
   000370         037400     PERFORM DE-LETE.                                             IC2034.2 210
   000371         037500     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000372         037600     GO TO CNCL-TEST-01.                                          IC2034.2 409
   000373         037700 CALL-TEST-05-01.                                                 IC2034.2
   000374         037800     MOVE 1 TO REC-CT.                                            IC2034.2 105
   000375         037900     IF DN5 EQUAL TO 2                                            IC2034.2 44
   000376      1  038000         PERFORM PASS                                             IC2034.2 208
   000377      1  038100         GO TO CALL-WRITE-05-01.                                  IC2034.2 383
   000378         038200 CALL-FAIL-05-01.                                                 IC2034.2
   000379         038300     PERFORM FAIL.                                                IC2034.2 209
   000380         038400     MOVE DN5 TO COMPUTED-18V0.                                   IC2034.2 44 76
   000381         038500     MOVE 2 TO CORRECT-18V0.                                      IC2034.2 89
   000382         038600     MOVE "DN5 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000383         038700 CALL-WRITE-05-01.                                                IC2034.2
   000384         038800     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000385         038900 CALL-TEST-05-02.                                                 IC2034.2
   000386         039000     ADD 1 TO REC-CT.                                             IC2034.2 105
   000387         039100     IF DN2 EQUAL TO "NO"                                         IC2034.2 46
   000388      1  039200         PERFORM PASS                                             IC2034.2 208
   000389      1  039300         GO TO CALL-WRITE-05-02.                                  IC2034.2 395
   000390         039400 CALL-FAIL-05-02.                                                 IC2034.2
   000391         039500     PERFORM FAIL.                                                IC2034.2 209
   000392         039600     MOVE DN2 TO COMPUTED-A.                                      IC2034.2 46 69
   000393         039700     MOVE "NO" TO CORRECT-A.                                      IC2034.2 83
   000394         039800     MOVE "DN2 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000395         039900 CALL-WRITE-05-02.                                                IC2034.2
   000396         040000     PERFORM PRINT-DETAIL.                                        IC2034.2 212
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100 CALL-TEST-05-03.                                                 IC2034.2
   000398         040200     ADD 1 TO REC-CT.                                             IC2034.2 105
   000399         040300     IF DN4 EQUAL TO "EQUAL"                                      IC2034.2 48
   000400      1  040400         PERFORM PASS                                             IC2034.2 208
   000401      1  040500         GO TO CALL-WRITE-05-03.                                  IC2034.2 407
   000402         040600 CALL-FAIL-05-03.                                                 IC2034.2
   000403         040700     PERFORM FAIL.                                                IC2034.2 209
   000404         040800     MOVE DN4 TO COMPUTED-A.                                      IC2034.2 48 69
   000405         040900     MOVE "EQUAL" TO CORRECT-A.                                   IC2034.2 83
   000406         041000     MOVE "DN4 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000407         041100 CALL-WRITE-05-03.                                                IC2034.2
   000408         041200     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000409         041300 CNCL-TEST-01.                                                    IC2034.2
   000410         041400*        THIS TEST VERIFIES THAT A SUBPROGRAM IS IN ITS           IC2034.2
   000411         041500*    INITIAL STATE THE FIRST TIME IT IS CALLED FOLLOWING          IC2034.2
   000412         041600*    A CANCEL STATEMENT.                                          IC2034.2
   000413         041700     MOVE "CNCL-TEST-01" TO PAR-NAME.                             IC2034.2 58
   000414         041800     MOVE "SET TO INITIAL STATE" TO FEATURE.                      IC2034.2 54
   000415         041900     CALL "IC204A" USING TABLE-1, DN1.                            IC2034.2 EXT 45 43
   000416         042000     CANCEL "IC204A".                                             IC2034.2 EXT
   000417         042100     MOVE 1 TO DN3.                                               IC2034.2 47
   000418         042200     MOVE SPACE TO DN2, DN4.                                      IC2034.2 IMP 46 48
   000419         042300     MOVE ZERO TO DN1.                                            IC2034.2 IMP 43
   000420         042400     CALL "IC204A" USING TABLE-1, DN1.                            IC2034.2 EXT 45 43
   000421         042500     GO TO CNCL-TEST-01-01.                                       IC2034.2 426
   000422         042600 CNCL-DELETE-01.                                                  IC2034.2
   000423         042700     PERFORM DE-LETE.                                             IC2034.2 210
   000424         042800     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000425         042900     GO TO CNCL-TEST-02.                                          IC2034.2 462
   000426         043000 CNCL-TEST-01-01.                                                 IC2034.2
   000427         043100     MOVE 1 TO REC-CT.                                            IC2034.2 105
   000428         043200     IF DN1 IS EQUAL TO 1                                         IC2034.2 43
   000429      1  043300         PERFORM PASS                                             IC2034.2 208
   000430      1  043400         GO TO CNCL-WRITE-01-01.                                  IC2034.2 436
   000431         043500 CNCL-FAIL-01-01.                                                 IC2034.2
   000432         043600     PERFORM FAIL.                                                IC2034.2 209
   000433         043700     MOVE DN1 TO COMPUTED-18V0.                                   IC2034.2 43 76
   000434         043800     MOVE 1 TO CORRECT-18V0.                                      IC2034.2 89
   000435         043900     MOVE "DN1 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000436         044000 CNCL-WRITE-01-01.                                                IC2034.2
   000437         044100     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000438         044200 CNCL-TEST-01-02.                                                 IC2034.2
   000439         044300     ADD 1 TO REC-CT.                                             IC2034.2 105
   000440         044400     IF DN2 IS EQUAL TO "YES"                                     IC2034.2 46
   000441      1  044500         PERFORM PASS                                             IC2034.2 208
   000442      1  044600         GO TO CNCL-WRITE-01-02.                                  IC2034.2 448
   000443         044700 CNCL-FAIL-01-02.                                                 IC2034.2
   000444         044800     PERFORM FAIL.                                                IC2034.2 209
   000445         044900     MOVE DN2 TO COMPUTED-A.                                      IC2034.2 46 69
   000446         045000     MOVE "YES" TO CORRECT-A.                                     IC2034.2 83
   000447         045100     MOVE "DN2 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000448         045200 CNCL-WRITE-01-02.                                                IC2034.2
   000449         045300     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000450         045400 CNCL-TEST-01-03.                                                 IC2034.2
   000451         045500     ADD 1 TO REC-CT.                                             IC2034.2 105
   000452         045600     IF DN4 EQUAL TO "EQUAL"                                      IC2034.2 48
   000453      1  045700         PERFORM PASS                                             IC2034.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  045800         GO TO CNCL-WRITE-01-03.                                  IC2034.2 460
   000455         045900 CNCL-FAIL-01-03.                                                 IC2034.2
   000456         046000     PERFORM FAIL.                                                IC2034.2 209
   000457         046100     MOVE DN4 TO COMPUTED-A.                                      IC2034.2 48 69
   000458         046200     MOVE "EQUAL" TO CORRECT-A.                                   IC2034.2 83
   000459         046300     MOVE "DN4 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000460         046400 CNCL-WRITE-01-03.                                                IC2034.2
   000461         046500     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000462         046600 CNCL-TEST-02.                                                    IC2034.2
   000463         046700*        THIS TEST USES AN IDENTIFIER IN THE CANCEL STATEMENT.    IC2034.2
   000464         046800*    THE SUBPROGRAM SHOULD BE IN ITS INITIAL STATE ON THE FIRST   IC2034.2
   000465         046900*    CALL FOLLOWING A CANCEL OF THE SUBPROGRAM.                   IC2034.2
   000466         047000     MOVE "CNCL-TEST-02" TO PAR-NAME.                             IC2034.2 58
   000467         047100     MOVE "SET TO INITIAL STATE" TO FEATURE.                      IC2034.2 54
   000468         047200     CALL "IC204A" USING TABLE-1, DN1.                            IC2034.2 EXT 45 43
   000469         047300     CANCEL ID1.                                                  IC2034.2 41
   000470         047400     MOVE 1 TO DN3.                                               IC2034.2 47
   000471         047500     MOVE SPACE TO DN2, DN4.                                      IC2034.2 IMP 46 48
   000472         047600     MOVE ZERO TO DN1.                                            IC2034.2 IMP 43
   000473         047700     CALL ID1 USING TABLE-1, DN1.                                 IC2034.2 41 45 43
   000474         047800     GO TO CNCL-TEST-02-01.                                       IC2034.2 479
   000475         047900 CNCL-DELETE-02.                                                  IC2034.2
   000476         048000     PERFORM DE-LETE.                                             IC2034.2 210
   000477         048100     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000478         048200     GO TO CNCL-TEST-03.                                          IC2034.2 515
   000479         048300 CNCL-TEST-02-01.                                                 IC2034.2
   000480         048400     MOVE 1 TO REC-CT.                                            IC2034.2 105
   000481         048500     IF DN1 EQUAL TO 1                                            IC2034.2 43
   000482      1  048600         PERFORM PASS                                             IC2034.2 208
   000483      1  048700         GO TO CNCL-WRITE-02-01.                                  IC2034.2 489
   000484         048800 CNCL-FAIL-02-01.                                                 IC2034.2
   000485         048900     PERFORM FAIL.                                                IC2034.2 209
   000486         049000     MOVE 1 TO CORRECT-18V0.                                      IC2034.2 89
   000487         049100     MOVE DN1 TO COMPUTED-18V0.                                   IC2034.2 43 76
   000488         049200     MOVE "DN1 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000489         049300 CNCL-WRITE-02-01.                                                IC2034.2
   000490         049400     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000491         049500 CNCL-TEST-02-02.                                                 IC2034.2
   000492         049600     ADD 1 TO REC-CT.                                             IC2034.2 105
   000493         049700     IF DN2 EQUAL TO "YES"                                        IC2034.2 46
   000494      1  049800         PERFORM PASS                                             IC2034.2 208
   000495      1  049900         GO TO CNCL-WRITE-02-02.                                  IC2034.2 501
   000496         050000 CNCL-FAIL-02-02.                                                 IC2034.2
   000497         050100     PERFORM FAIL.                                                IC2034.2 209
   000498         050200     MOVE DN2 TO COMPUTED-A.                                      IC2034.2 46 69
   000499         050300     MOVE "YES" TO CORRECT-A.                                     IC2034.2 83
   000500         050400     MOVE "DN2 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000501         050500 CNCL-WRITE-02-02.                                                IC2034.2
   000502         050600     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000503         050700 CNCL-TEST-02-03.                                                 IC2034.2
   000504         050800     ADD 1 TO REC-CT.                                             IC2034.2 105
   000505         050900     IF DN4 EQUAL TO "EQUAL"                                      IC2034.2 48
   000506      1  051000         PERFORM PASS                                             IC2034.2 208
   000507      1  051100         GO TO CNCL-WRITE-02-03.                                  IC2034.2 513
   000508         051200 CNCL-FAIL-02-03.                                                 IC2034.2
   000509         051300     PERFORM FAIL.                                                IC2034.2 209
   000510         051400     MOVE DN4 TO COMPUTED-A.                                      IC2034.2 48 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     MOVE "EQUAL" TO CORRECT-A.                                   IC2034.2 83
   000512         051600     MOVE "DN4 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000513         051700 CNCL-WRITE-02-03.                                                IC2034.2
   000514         051800     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000515         051900 CNCL-TEST-03.                                                    IC2034.2
   000516         052000*        THIS TEST CANCELS A SUBPROGRAM WHICH HAS ALREADY         IC2034.2
   000517         052100*    BEEN CANCELED.  THE SUBPROGRAM IS THEN CALLED AND A CHECK    IC2034.2
   000518         052200*    IS MADE TO ENSURE THAT THE SUBPROGRAM WAS IN ITS INITIAL     IC2034.2
   000519         052300*    STATE.                                                       IC2034.2
   000520         052400     MOVE "CNCL-TEST-03" TO PAR-NAME.                             IC2034.2 58
   000521         052500     MOVE "PREVIOUSLY CANCELED" TO FEATURE.                       IC2034.2 54
   000522         052600 CNCL-INIT-03.                                                    IC2034.2
   000523         052700     CALL "IC204A" USING TABLE-1, DN1.                            IC2034.2 EXT 45 43
   000524         052800     CANCEL ID1.                                                  IC2034.2 41
   000525         052900     CANCEL ID1.                                                  IC2034.2 41
   000526         053000     MOVE 1 TO DN3.                                               IC2034.2 47
   000527         053100     MOVE SPACE TO DN2, DN4.                                      IC2034.2 IMP 46 48
   000528         053200     MOVE ZERO TO DN1.                                            IC2034.2 IMP 43
   000529         053300     CALL ID1 USING TABLE-1, DN1.                                 IC2034.2 41 45 43
   000530         053400     GO TO CNCL-TEST-03-01.                                       IC2034.2 535
   000531         053500 CNCL-DELETE-03.                                                  IC2034.2
   000532         053600     PERFORM DE-LETE.                                             IC2034.2 210
   000533         053700     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000534         053800     GO TO CNCL-TEST-04.                                          IC2034.2 575
   000535         053900 CNCL-TEST-03-01.                                                 IC2034.2
   000536         054000     MOVE 1 TO REC-CT.                                            IC2034.2 105
   000537         054100     IF DN1 EQUAL TO 1                                            IC2034.2 43
   000538      1  054200         PERFORM PASS                                             IC2034.2 208
   000539      1  054300         GO TO CNCL-WRITE-03-01.                                  IC2034.2 545
   000540         054400 CNCL-FAIL-03-01.                                                 IC2034.2
   000541         054500     PERFORM FAIL.                                                IC2034.2 209
   000542         054600     MOVE 1 TO CORRECT-18V0.                                      IC2034.2 89
   000543         054700     MOVE DN1 TO COMPUTED-18V0.                                   IC2034.2 43 76
   000544         054800     MOVE "DN1 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000545         054900 CNCL-WRITE-03-01.                                                IC2034.2
   000546         055000     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000547         055100 CNCL-TEST-03-02.                                                 IC2034.2
   000548         055200     ADD 1 TO REC-CT.                                             IC2034.2 105
   000549         055300     IF DN2 IS EQUAL TO "YES"                                     IC2034.2 46
   000550      1  055400         PERFORM PASS                                             IC2034.2 208
   000551      1  055500         GO TO CNCL-WRITE-03-02.                                  IC2034.2 557
   000552         055600 CNCL-FAIL-03-02.                                                 IC2034.2
   000553         055700     PERFORM FAIL.                                                IC2034.2 209
   000554         055800     MOVE DN2 TO COMPUTED-A.                                      IC2034.2 46 69
   000555         055900     MOVE "YES" TO CORRECT-A.                                     IC2034.2 83
   000556         056000     MOVE "DN2 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000557         056100 CNCL-WRITE-03-02.                                                IC2034.2
   000558         056200     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000559         056300 CNCL-TEST-03-03.                                                 IC2034.2
   000560         056400     ADD 1 TO REC-CT.                                             IC2034.2 105
   000561         056500     IF DN4 EQUAL TO "EQUAL"                                      IC2034.2 48
   000562      1  056600         PERFORM PASS                                             IC2034.2 208
   000563      1  056700         GO TO CNCL-WRITE-03-03.                                  IC2034.2 569
   000564         056800 CNCL-FAIL-03-03.                                                 IC2034.2
   000565         056900     PERFORM FAIL.                                                IC2034.2 209
   000566         057000     MOVE DN4 TO COMPUTED-A.                                      IC2034.2 48 69
   000567         057100     MOVE "EQUAL" TO CORRECT-A.                                   IC2034.2 83
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200     MOVE "DN4 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000569         057300 CNCL-WRITE-03-03.                                                IC2034.2
   000570         057400     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000571         057500 CNCL-INIT-04.                                                    IC2034.2
   000572         057600     MOVE "CNCL-TEST-04" TO PAR-NAME.                             IC2034.2 58
   000573         057700     MOVE "CANCEL UNCALLED PROG" TO FEATURE.                      IC2034.2 54
   000574         057800     MOVE ZERO TO REC-CT.                                         IC2034.2 IMP 105
   000575         057900 CNCL-TEST-04.                                                    IC2034.2
   000576         058000*        THIS TEST CANCELS A SUBPROGRAM WHICH HAS NEVER           IC2034.2
   000577         058100*    BEEN CALLED.  THE NEXT SENTENCE SHOULD BE EXECUTED           IC2034.2
   000578         058200*    IN THIS CASE.                                                IC2034.2
   000579         058300     CANCEL "IC205A".                                             IC2034.2 EXT
   000580         058400     GO TO CNCL-PASS-04.                                          IC2034.2 584
   000581         058500 CNCL-DELETE-04.                                                  IC2034.2
   000582         058600     PERFORM DE-LETE.                                             IC2034.2 210
   000583         058700     GO TO CNCL-WRITE-04.                                         IC2034.2 586
   000584         058800 CNCL-PASS-04.                                                    IC2034.2
   000585         058900     PERFORM PASS.                                                IC2034.2 208
   000586         059000 CNCL-WRITE-04.                                                   IC2034.2
   000587         059100     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000588         059200 CNCL-INIT-05.                                                    IC2034.2
   000589         059300     MOVE "CNCL-TEST-05" TO PAR-NAME.                             IC2034.2 58
   000590         059400     MOVE "CANCEL IN SUBPROGRAM" TO FEATURE.                      IC2034.2 54
   000591         059500*        THIS TEST CALLS SUBPROGRAM IC205 WHICH CALLS AND         IC2034.2
   000592         059600*    CANCELS A THIRD SUBPROGRAM IC206.                            IC2034.2
   000593         059700 CNCL-TEST-05.                                                    IC2034.2
   000594         059800     MOVE SPACE TO DN2, DN4, TABLE-2.                             IC2034.2 IMP 46 48 49
   000595         059900     MOVE ZERO TO DN1.                                            IC2034.2 IMP 43
   000596         060000     CALL "IC205A" USING TABLE-1, TABLE-2, DN1.                   IC2034.2 EXT 45 49 43
   000597         060100     IF TABLE-2 EQUAL TO "AB"                                     IC2034.2 49
   000598      1  060200         PERFORM PASS                                             IC2034.2 208
   000599      1  060300         GO TO CNCL-WRITE-05.                                     IC2034.2 609
   000600         060400     GO TO CNCL-FAIL-05.                                          IC2034.2 604
   000601         060500 CNCL-DELETE-05.                                                  IC2034.2
   000602         060600     PERFORM DE-LETE.                                             IC2034.2 210
   000603         060700     GO TO CNCL-WRITE-05.                                         IC2034.2 609
   000604         060800 CNCL-FAIL-05.                                                    IC2034.2
   000605         060900     PERFORM FAIL.                                                IC2034.2 209
   000606         061000     MOVE "AB" TO CORRECT-A.                                      IC2034.2 83
   000607         061100     MOVE TABLE-2 TO COMPUTED-A.                                  IC2034.2 49 69
   000608         061200     MOVE "TABLE-2 INCORRECT" TO RE-MARK.                         IC2034.2 63
   000609         061300 CNCL-WRITE-05.                                                   IC2034.2
   000610         061400     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000611         061500 CNCL-INIT-06.                                                    IC2034.2
   000612         061600     MOVE "CNCL-TEST-06" TO PAR-NAME.                             IC2034.2 58
   000613         061700     MOVE "CALL CANCELED PROG" TO FEATURE.                        IC2034.2 54
   000614         061800*        THIS TEST CHECKS THAT THE CANCEL OF IC204 WHICH          IC2034.2
   000615         061900*    WAS MADE IN THE SUBPROGRAM IC205 WAS EXECUTED PROPERLY.      IC2034.2
   000616         062000*    THE SUBPROGRAM IC204 IS CALLED AND THE DATA VALUES           IC2034.2
   000617         062100*    ARE CHECKED TO SEE IF IC204 WAS IN ITS INITIAL STATE.        IC2034.2
   000618         062200 CNCL-TEST-06.                                                    IC2034.2
   000619         062300     MOVE 1 TO DN3.                                               IC2034.2 47
   000620         062400     MOVE SPACE TO DN2, DN4.                                      IC2034.2 IMP 46 48
   000621         062500     MOVE ZERO TO DN1.                                            IC2034.2 IMP 43
   000622         062600     CALL ID1 USING TABLE-1, DN1.                                 IC2034.2 41 45 43
   000623         062700     GO TO CNCL-TEST-06-01.                                       IC2034.2 627
   000624         062800 CNCL-DELETE-06.                                                  IC2034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     PERFORM DE-LETE.                                             IC2034.2 210
   000626         063000     GO TO CNCL-WRITE-06-03.                                      IC2034.2 661
   000627         063100 CNCL-TEST-06-01.                                                 IC2034.2
   000628         063200     MOVE 1 TO REC-CT.                                            IC2034.2 105
   000629         063300     IF DN1 IS EQUAL TO 1                                         IC2034.2 43
   000630      1  063400         PERFORM PASS                                             IC2034.2 208
   000631      1  063500         GO TO CNCL-WRITE-06-01.                                  IC2034.2 637
   000632         063600 CNCL-FAIL-06-01.                                                 IC2034.2
   000633         063700     PERFORM FAIL.                                                IC2034.2 209
   000634         063800     MOVE DN1 TO COMPUTED-18V0.                                   IC2034.2 43 76
   000635         063900     MOVE 1 TO CORRECT-18V0.                                      IC2034.2 89
   000636         064000     MOVE "DN1 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000637         064100 CNCL-WRITE-06-01.                                                IC2034.2
   000638         064200     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000639         064300 CNCL-TEST-06-02.                                                 IC2034.2
   000640         064400     ADD 1 TO REC-CT.                                             IC2034.2 105
   000641         064500     IF DN2 IS EQUAL TO "YES"                                     IC2034.2 46
   000642      1  064600         PERFORM PASS                                             IC2034.2 208
   000643      1  064700         GO TO CNCL-WRITE-06-02.                                  IC2034.2 649
   000644         064800 CNCL-FAIL-06-02.                                                 IC2034.2
   000645         064900     PERFORM FAIL.                                                IC2034.2 209
   000646         065000     MOVE DN2 TO COMPUTED-A.                                      IC2034.2 46 69
   000647         065100     MOVE "YES" TO CORRECT-A.                                     IC2034.2 83
   000648         065200     MOVE "DN2 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000649         065300 CNCL-WRITE-06-02.                                                IC2034.2
   000650         065400     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000651         065500 CNCL-TEST-06-03.                                                 IC2034.2
   000652         065600     ADD 1 TO REC-CT.                                             IC2034.2 105
   000653         065700     IF DN4 EQUAL TO "EQUAL"                                      IC2034.2 48
   000654      1  065800         PERFORM PASS                                             IC2034.2 208
   000655      1  065900         GO TO CNCL-WRITE-06-03.                                  IC2034.2 661
   000656         066000 CNCL-FAIL-06-03.                                                 IC2034.2
   000657         066100     PERFORM FAIL.                                                IC2034.2 209
   000658         066200     MOVE DN4 TO COMPUTED-A.                                      IC2034.2 48 69
   000659         066300     MOVE "EQUAL" TO CORRECT-A.                                   IC2034.2 83
   000660         066400     MOVE "DN4 INCORRECT" TO RE-MARK.                             IC2034.2 63
   000661         066500 CNCL-WRITE-06-03.                                                IC2034.2
   000662         066600     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000663         066700 CNCL-INIT-07.                                                    IC2034.2
   000664         066800*        THIS TEST CANCELS THE THREE SUBPROGRAMS                  IC2034.2
   000665         066900*    CALLED BY THIS ROUTINE.                                      IC2034.2
   000666         067000     MOVE "CNCL-TEST-07" TO PAR-NAME.                             IC2034.2 58
   000667         067100     MOVE "CANCEL 3 PROGS" TO FEATURE.                            IC2034.2 54
   000668         067200     MOVE ZERO TO REC-CT.                                         IC2034.2 IMP 105
   000669         067300 CNCL-TEST-07.                                                    IC2034.2
   000670         067400     CANCEL ID1, "IC205A", ID2.                                   IC2034.2 41 EXT 42
   000671         067500     PERFORM PASS.                                                IC2034.2 208
   000672         067600     GO TO CNCL-WRITE-07.                                         IC2034.2 675
   000673         067700 CNCL-DELETE-07.                                                  IC2034.2
   000674         067800     PERFORM DE-LETE.                                             IC2034.2 210
   000675         067900 CNCL-WRITE-07.                                                   IC2034.2
   000676         068000     PERFORM PRINT-DETAIL.                                        IC2034.2 212
   000677         068100 CCVS-EXIT SECTION.                                               IC2034.2
   000678         068200 CCVS-999999.                                                     IC2034.2
   000679         068300     GO TO CLOSE-FILES.                                           IC2034.2 201
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      114   ANSI-REFERENCE . . . . . . . .  286 293 302
       93   CCVS-C-1 . . . . . . . . . . .  230 272
       98   CCVS-C-2 . . . . . . . . . . .  231 273
      148   CCVS-E-1 . . . . . . . . . . .  236
      153   CCVS-E-2 . . . . . . . . . . .  245 252 259 264
      156   CCVS-E-2-2 . . . . . . . . . .  M244
      161   CCVS-E-3 . . . . . . . . . . .  265
      170   CCVS-E-4 . . . . . . . . . . .  244
      171   CCVS-E-4-1 . . . . . . . . . .  M242
      173   CCVS-E-4-2 . . . . . . . . . .  M243
      115   CCVS-H-1 . . . . . . . . . . .  225
      120   CCVS-H-2A. . . . . . . . . . .  226
      129   CCVS-H-2B. . . . . . . . . . .  227
      141   CCVS-H-3 . . . . . . . . . . .  228
      191   CCVS-PGM-ID. . . . . . . . . .  197 197
       75   CM-18V0
       69   COMPUTED-A . . . . . . . . . .  70 72 73 74 75 298 301 M342 M354 M392 M404 M445 M457 M498 M510 M554 M566 M607
                                            M646 M658
       70   COMPUTED-N
       68   COMPUTED-X . . . . . . . . . .  M220 284
       72   COMPUTED-0V18
       74   COMPUTED-14V4
       76   COMPUTED-18V0. . . . . . . . .  M330 M380 M433 M487 M543 M634
       73   COMPUTED-4V14
       92   COR-ANSI-REFERENCE . . . . . .  M293 M295
       83   CORRECT-A. . . . . . . . . . .  84 85 86 87 88 299 301 M343 M355 M393 M405 M446 M458 M499 M511 M555 M567 M606
                                            M647 M659
       84   CORRECT-N
       82   CORRECT-X. . . . . . . . . . .  M221 285
       85   CORRECT-0V18
       87   CORRECT-14V4
       89   CORRECT-18V0 . . . . . . . . .  M331 M381 M434 M486 M542 M635
       86   CORRECT-4V14
       88   CR-18V0
      106   DELETE-COUNTER . . . . . . . .  M210 239 255 257
       43   DN1. . . . . . . . . . . . . .  M316 317 325 330 415 M419 420 428 433 468 M472 473 481 487 523 M528 529 537 543
                                            M595 596 M621 622 629 634
       46   DN2. . . . . . . . . . . . . .  M315 337 342 M365 387 392 M418 440 445 M471 493 498 M527 549 554 M594 M620 641
                                            646
       47   DN3. . . . . . . . . . . . . .  M314 M364 M417 M470 M526 M619
       48   DN4. . . . . . . . . . . . . .  M315 349 354 M365 399 404 M418 452 457 M471 505 510 M527 561 566 M594 M620 653
                                            658
       44   DN5. . . . . . . . . . . . . .  M366 367 375 380
       50   DN6
       61   DOTVALUE . . . . . . . . . . .  M215
      112   DUMMY-HOLD . . . . . . . . . .  M269 275
       39   DUMMY-RECORD . . . . . . . . .  M225 M226 M227 M228 M230 M231 M232 M234 M236 M245 M252 M259 M264 M265 269 M270
                                            271 M272 M273 M274 M275 279 M280 M288 M303
      159   ENDER-DESC . . . . . . . . . .  M247 M258 M263
      107   ERROR-COUNTER. . . . . . . . .  M209 238 248 251
      111   ERROR-HOLD . . . . . . . . . .  M238 M239 M239 M240 243
      157   ERROR-TOTAL. . . . . . . . . .  M249 M251 M256 M257 M261 M262
       54   FEATURE. . . . . . . . . . . .  M313 M361 M414 M467 M521 M573 M590 M613 M667
      185   HYPHEN-LINE. . . . . . . . . .  232 234 274
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    16
0 Defined   Cross-reference of data names   References

0     151   ID-AGAIN . . . . . . . . . . .  M197
       41   ID1. . . . . . . . . . . . . .  317 367 469 473 524 525 529 622 670
       42   ID2. . . . . . . . . . . . . .  670
      184   INF-ANSI-REFERENCE . . . . . .  M286 M289 M302 M304
      179   INFO-TEXT. . . . . . . . . . .  M287
      108   INSPECT-COUNTER. . . . . . . .  M207 238 260 262
       56   P-OR-F . . . . . . . . . . . .  M207 M208 M209 M210 217 M220
       58   PAR-NAME . . . . . . . . . . .  M222 M312 M360 M413 M466 M520 M572 M589 M612 M666
       60   PARDOT-X . . . . . . . . . . .  M214
      109   PASS-COUNTER . . . . . . . . .  M208 240 242
       37   PRINT-FILE . . . . . . . . . .  33 196 202
       38   PRINT-REC. . . . . . . . . . .  M216 M292 M294
       63   RE-MARK. . . . . . . . . . . .  M211 M223 M332 M344 M356 M382 M394 M406 M435 M447 M459 M488 M500 M512 M544 M556
                                            M568 M608 M636 M648 M660
      105   REC-CT . . . . . . . . . . . .  213 215 222 M324 M336 M348 M374 M386 M398 M427 M439 M451 M480 M492 M504 M536
                                            M548 M560 M574 M628 M640 M652 M668
      104   REC-SKL-SUB
      113   RECORD-COUNT . . . . . . . . .  M267 268 M276
       45   TABLE-1. . . . . . . . . . . .  317 367 415 420 468 473 523 529 596 622
       49   TABLE-2. . . . . . . . . . . .  M594 596 597 607
       64   TEST-COMPUTED. . . . . . . . .  292
       79   TEST-CORRECT . . . . . . . . .  294
      132   TEST-ID. . . . . . . . . . . .  M197
       52   TEST-RESULTS . . . . . . . . .  M198 216
      110   TOTAL-ERROR
      181   XXCOMPUTED . . . . . . . . . .  M301
      183   XXCORRECT. . . . . . . . . . .  M301
      176   XXINFO . . . . . . . . . . . .  288 303
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    17
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

      297   BAIL-OUT . . . . . . . . . . .  P219
      305   BAIL-OUT-EX. . . . . . . . . .  E219 G299
      300   BAIL-OUT-WRITE . . . . . . . .  G298
      281   BLANK-LINE-PRINT
      319   CALL-DELETE-04
      369   CALL-DELETE-05
      328   CALL-FAIL-04-01
      340   CALL-FAIL-04-02
      352   CALL-FAIL-04-03
      378   CALL-FAIL-05-01
      390   CALL-FAIL-05-02
      402   CALL-FAIL-05-03
      309   CALL-TEST-04
      323   CALL-TEST-04-01. . . . . . . .  G318
      335   CALL-TEST-04-02
      347   CALL-TEST-04-03
      359   CALL-TEST-05 . . . . . . . . .  G322
      373   CALL-TEST-05-01. . . . . . . .  G368
      385   CALL-TEST-05-02
      397   CALL-TEST-05-03
      333   CALL-WRITE-04-01 . . . . . . .  G327
      345   CALL-WRITE-04-02 . . . . . . .  G339
      357   CALL-WRITE-04-03 . . . . . . .  G351
      383   CALL-WRITE-05-01 . . . . . . .  G377
      395   CALL-WRITE-05-02 . . . . . . .  G389
      407   CALL-WRITE-05-03 . . . . . . .  G401
      677   CCVS-EXIT
      678   CCVS-999999
      194   CCVS1
      306   CCVS1-EXIT . . . . . . . . . .  G200
      201   CLOSE-FILES. . . . . . . . . .  G679
      422   CNCL-DELETE-01
      475   CNCL-DELETE-02
      531   CNCL-DELETE-03
      581   CNCL-DELETE-04
      601   CNCL-DELETE-05
      624   CNCL-DELETE-06
      673   CNCL-DELETE-07
      431   CNCL-FAIL-01-01
      443   CNCL-FAIL-01-02
      455   CNCL-FAIL-01-03
      484   CNCL-FAIL-02-01
      496   CNCL-FAIL-02-02
      508   CNCL-FAIL-02-03
      540   CNCL-FAIL-03-01
      552   CNCL-FAIL-03-02
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    18
0 Defined   Cross-reference of procedures   References

0     564   CNCL-FAIL-03-03
      604   CNCL-FAIL-05 . . . . . . . . .  G600
      632   CNCL-FAIL-06-01
      644   CNCL-FAIL-06-02
      656   CNCL-FAIL-06-03
      522   CNCL-INIT-03
      571   CNCL-INIT-04
      588   CNCL-INIT-05
      611   CNCL-INIT-06
      663   CNCL-INIT-07
      584   CNCL-PASS-04 . . . . . . . . .  G580
      409   CNCL-TEST-01 . . . . . . . . .  G372
      426   CNCL-TEST-01-01. . . . . . . .  G421
      438   CNCL-TEST-01-02
      450   CNCL-TEST-01-03
      462   CNCL-TEST-02 . . . . . . . . .  G425
      479   CNCL-TEST-02-01. . . . . . . .  G474
      491   CNCL-TEST-02-02
      503   CNCL-TEST-02-03
      515   CNCL-TEST-03 . . . . . . . . .  G478
      535   CNCL-TEST-03-01. . . . . . . .  G530
      547   CNCL-TEST-03-02
      559   CNCL-TEST-03-03
      575   CNCL-TEST-04 . . . . . . . . .  G534
      593   CNCL-TEST-05
      618   CNCL-TEST-06
      627   CNCL-TEST-06-01. . . . . . . .  G623
      639   CNCL-TEST-06-02
      651   CNCL-TEST-06-03
      669   CNCL-TEST-07
      436   CNCL-WRITE-01-01 . . . . . . .  G430
      448   CNCL-WRITE-01-02 . . . . . . .  G442
      460   CNCL-WRITE-01-03 . . . . . . .  G454
      489   CNCL-WRITE-02-01 . . . . . . .  G483
      501   CNCL-WRITE-02-02 . . . . . . .  G495
      513   CNCL-WRITE-02-03 . . . . . . .  G507
      545   CNCL-WRITE-03-01 . . . . . . .  G539
      557   CNCL-WRITE-03-02 . . . . . . .  G551
      569   CNCL-WRITE-03-03 . . . . . . .  G563
      586   CNCL-WRITE-04. . . . . . . . .  G583
      609   CNCL-WRITE-05. . . . . . . . .  G599 G603
      637   CNCL-WRITE-06-01 . . . . . . .  G631
      649   CNCL-WRITE-06-02 . . . . . . .  G643
      661   CNCL-WRITE-06-03 . . . . . . .  G626 G655
      675   CNCL-WRITE-07. . . . . . . . .  G672
      229   COLUMN-NAMES-ROUTINE . . . . .  E199
      210   DE-LETE. . . . . . . . . . . .  P320 P370 P423 P476 P532 P582 P602 P625 P674
      233   END-ROUTINE. . . . . . . . . .  P202
      237   END-ROUTINE-1
      246   END-ROUTINE-12
      254   END-ROUTINE-13 . . . . . . . .  E202
      235   END-RTN-EXIT
      209   FAIL . . . . . . . . . . . . .  P329 P341 P353 P379 P391 P403 P432 P444 P456 P485 P497 P509 P541 P553 P565 P605
                                            P633 P645 P657
      283   FAIL-ROUTINE . . . . . . . . .  P218
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    19
0 Defined   Cross-reference of procedures   References

0     296   FAIL-ROUTINE-EX. . . . . . . .  E218 G290
      291   FAIL-ROUTINE-WRITE . . . . . .  G284 G285
      224   HEAD-ROUTINE . . . . . . . . .  P199
      207   INSPT
      195   OPEN-FILES
      208   PASS . . . . . . . . . . . . .  P326 P338 P350 P376 P388 P400 P429 P441 P453 P482 P494 P506 P538 P550 P562 P585
                                            P598 P630 P642 P654 P671
      212   PRINT-DETAIL . . . . . . . . .  P321 P334 P346 P358 P371 P384 P396 P408 P424 P437 P449 P461 P477 P490 P502 P514
                                            P533 P546 P558 P570 P587 P610 P638 P650 P662 P676
      308   SECT-IC203-0001
      205   TERMINATE-CALL
      203   TERMINATE-CCVS
      266   WRITE-LINE . . . . . . . . . .  P216 P217 P225 P226 P227 P228 P230 P231 P232 P234 P236 P245 P253 P259 P264 P265
                                            P288 P292 P294 P303
      278   WRT-LN . . . . . . . . . . . .  P272 P273 P274 P277 P282
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    20
0 Defined   Cross-reference of programs     References

        3   IC203A
 EXTERNAL   IC204A . . . . . . . . . . . .  415 416 420 468 523
 EXTERNAL   IC205A . . . . . . . . . . . .  579 596 670
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC203A    Date 06/04/2022  Time 11:58:08   Page    21
0LineID  Message code  Message text

     37  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC203A:
 *    Source records = 679
 *    Data Division statements = 73
 *    Procedure Division statements = 389
 *    Generated COBOL statements = 0
 *    Program complexity factor = 396
0End of compilation 1,  program IC203A,  highest severity 0.
0Return code 0
