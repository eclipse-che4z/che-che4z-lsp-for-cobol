1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:27   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:27   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2014.2
   000002         000200 PROGRAM-ID.                                                      IC2014.2
   000003         000300     IC201A.                                                      IC2014.2
   000004         000500*                                                              *  IC2014.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2014.2
   000006         000700*                                                              *  IC2014.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2014.2
   000008         000900*                                                              *  IC2014.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2014.2
   000010         001100*                                                              *  IC2014.2
   000011         001300*                                                              *  IC2014.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2014.2
   000013         001500*                                                              *  IC2014.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2014.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2014.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2014.2
   000017         001900*                                                              *  IC2014.2
   000018         002100*        THE PROGRAM IC201 TESTS THE CALL STATEMENT WITH AN       IC2014.2
   000019         002200*    IDENTIFIER AS AN OPERAND, AND FOUR OPERANDS IN THE           IC2014.2
   000020         002300*    USING PHRASE.  THE REPETITION OF A DATA-NAME IN THE          IC2014.2
   000021         002400*    USING PHRASE IS TESTED, AND THE USE OF THE ON OVERFLOW       IC2014.2
   000022         002500*    PHRASE IN A CALL STATEMENT IS SYNTACTICALLY CHECKED          IC2014.2
   000023         002600*    IN THE PROGRAM.                                              IC2014.2
   000024         002800 ENVIRONMENT DIVISION.                                            IC2014.2
   000025         002900 CONFIGURATION SECTION.                                           IC2014.2
   000026         003000 SOURCE-COMPUTER.                                                 IC2014.2
   000027         003100     XXXXX082.                                                    IC2014.2
   000028         003200 OBJECT-COMPUTER.                                                 IC2014.2
   000029         003300     XXXXX083.                                                    IC2014.2
   000030         003400 INPUT-OUTPUT SECTION.                                            IC2014.2
   000031         003500 FILE-CONTROL.                                                    IC2014.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  IC2014.2 36
   000033         003700     XXXXX055.                                                    IC2014.2
   000034         003800 DATA DIVISION.                                                   IC2014.2
   000035         003900 FILE SECTION.                                                    IC2014.2
   000036         004000 FD  PRINT-FILE.                                                  IC2014.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    IC2014.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 IC2014.2
   000039         004300 WORKING-STORAGE SECTION.                                         IC2014.2
   000040         004400 77  DN1 PICTURE S99  VALUE ZERO.                                 IC2014.2 IMP
   000041         004500 77  DN3 PICTURE S99.                                             IC2014.2
   000042         004600 77  ID1 PICTURE X(6) VALUE "IC202A".                             IC2014.2
   000043         004700 77  ID2 PICTURE X(6).                                            IC2014.2
   000044         004800 77  DN2 PICTURE S99                                              IC2014.2
   000045         004900         USAGE COMPUTATIONAL, VALUE ZERO.                         IC2014.2 IMP
   000046         005000 77  DN4 PICTURE S99                                              IC2014.2
   000047         005100         USAGE IS COMPUTATIONAL.                                  IC2014.2
   000048         005200 77  CALL-COUNT PIC S99.                                          IC2014.2
   000049         005300 77  FAIL-FLAG PIC 9.                                             IC2014.2
   000050         005400 01  TEST-RESULTS.                                                IC2014.2
   000051         005500     02 FILLER                   PIC X      VALUE SPACE.          IC2014.2 IMP
   000052         005600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2014.2 IMP
   000053         005700     02 FILLER                   PIC X      VALUE SPACE.          IC2014.2 IMP
   000054         005800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02 FILLER                   PIC X      VALUE SPACE.          IC2014.2 IMP
   000056         006000     02  PAR-NAME.                                                IC2014.2
   000057         006100       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2014.2 IMP
   000058         006200       03  PARDOT-X              PIC X      VALUE SPACE.          IC2014.2 IMP
   000059         006300       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2014.2 IMP
   000060         006400     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2014.2 IMP
   000061         006500     02 RE-MARK                  PIC X(61).                       IC2014.2
   000062         006600 01  TEST-COMPUTED.                                               IC2014.2
   000063         006700     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2014.2 IMP
   000064         006800     02 FILLER                   PIC X(17)  VALUE                 IC2014.2
   000065         006900            "       COMPUTED=".                                   IC2014.2
   000066         007000     02 COMPUTED-X.                                               IC2014.2
   000067         007100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2014.2 IMP
   000068         007200     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2014.2 67
   000069         007300                                 PIC -9(9).9(9).                  IC2014.2
   000070         007400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2014.2 67
   000071         007500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2014.2 67
   000072         007600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2014.2 67
   000073         007700     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2014.2 67
   000074         007800         04 COMPUTED-18V0                    PIC -9(18).          IC2014.2
   000075         007900         04 FILLER                           PIC X.               IC2014.2
   000076         008000     03 FILLER PIC X(50) VALUE SPACE.                             IC2014.2 IMP
   000077         008100 01  TEST-CORRECT.                                                IC2014.2
   000078         008200     02 FILLER PIC X(30) VALUE SPACE.                             IC2014.2 IMP
   000079         008300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2014.2
   000080         008400     02 CORRECT-X.                                                IC2014.2
   000081         008500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2014.2 IMP
   000082         008600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2014.2 81
   000083         008700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2014.2 81
   000084         008800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2014.2 81
   000085         008900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2014.2 81
   000086         009000     03      CR-18V0 REDEFINES CORRECT-A.                         IC2014.2 81
   000087         009100         04 CORRECT-18V0                     PIC -9(18).          IC2014.2
   000088         009200         04 FILLER                           PIC X.               IC2014.2
   000089         009300     03 FILLER PIC X(2) VALUE SPACE.                              IC2014.2 IMP
   000090         009400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2014.2 IMP
   000091         009500 01  CCVS-C-1.                                                    IC2014.2
   000092         009600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2014.2
   000093         009700-    "SS  PARAGRAPH-NAME                                          IC2014.2
   000094         009800-    "       REMARKS".                                            IC2014.2
   000095         009900     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2014.2 IMP
   000096         010000 01  CCVS-C-2.                                                    IC2014.2
   000097         010100     02 FILLER                     PIC X        VALUE SPACE.      IC2014.2 IMP
   000098         010200     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2014.2
   000099         010300     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2014.2 IMP
   000100         010400     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2014.2
   000101         010500     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2014.2 IMP
   000102         010600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2014.2 IMP
   000103         010700 01  REC-CT                        PIC 99       VALUE ZERO.       IC2014.2 IMP
   000104         010800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2014.2 IMP
   000105         010900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2014.2 IMP
   000106         011000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2014.2 IMP
   000107         011100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2014.2 IMP
   000108         011200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2014.2 IMP
   000109         011300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2014.2 IMP
   000110         011400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2014.2 IMP
   000111         011500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2014.2 IMP
   000113         011700 01  CCVS-H-1.                                                    IC2014.2
   000114         011800     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2014.2 IMP
   000115         011900     02  FILLER                    PIC X(42)    VALUE             IC2014.2
   000116         012000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2014.2
   000117         012100     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2014.2 IMP
   000118         012200 01  CCVS-H-2A.                                                   IC2014.2
   000119         012300   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2014.2 IMP
   000120         012400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2014.2
   000121         012500   02  FILLER                        PIC XXXX   VALUE             IC2014.2
   000122         012600     "4.2 ".                                                      IC2014.2
   000123         012700   02  FILLER                        PIC X(28)  VALUE             IC2014.2
   000124         012800            " COPY - NOT FOR DISTRIBUTION".                       IC2014.2
   000125         012900   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2014.2 IMP
   000126         013000                                                                  IC2014.2
   000127         013100 01  CCVS-H-2B.                                                   IC2014.2
   000128         013200   02  FILLER                        PIC X(15)  VALUE             IC2014.2
   000129         013300            "TEST RESULT OF ".                                    IC2014.2
   000130         013400   02  TEST-ID                       PIC X(9).                    IC2014.2
   000131         013500   02  FILLER                        PIC X(4)   VALUE             IC2014.2
   000132         013600            " IN ".                                               IC2014.2
   000133         013700   02  FILLER                        PIC X(12)  VALUE             IC2014.2
   000134         013800     " HIGH       ".                                              IC2014.2
   000135         013900   02  FILLER                        PIC X(22)  VALUE             IC2014.2
   000136         014000            " LEVEL VALIDATION FOR ".                             IC2014.2
   000137         014100   02  FILLER                        PIC X(58)  VALUE             IC2014.2
   000138         014200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2014.2
   000139         014300 01  CCVS-H-3.                                                    IC2014.2
   000140         014400     02  FILLER                      PIC X(34)  VALUE             IC2014.2
   000141         014500            " FOR OFFICIAL USE ONLY    ".                         IC2014.2
   000142         014600     02  FILLER                      PIC X(58)  VALUE             IC2014.2
   000143         014700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2014.2
   000144         014800     02  FILLER                      PIC X(28)  VALUE             IC2014.2
   000145         014900            "  COPYRIGHT   1985 ".                                IC2014.2
   000146         015000 01  CCVS-E-1.                                                    IC2014.2
   000147         015100     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2014.2 IMP
   000148         015200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2014.2
   000149         015300     02 ID-AGAIN                     PIC X(9).                    IC2014.2
   000150         015400     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2014.2 IMP
   000151         015500 01  CCVS-E-2.                                                    IC2014.2
   000152         015600     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2014.2 IMP
   000153         015700     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2014.2 IMP
   000154         015800     02 CCVS-E-2-2.                                               IC2014.2
   000155         015900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2014.2 IMP
   000156         016000         03 FILLER                   PIC X      VALUE SPACE.      IC2014.2 IMP
   000157         016100         03 ENDER-DESC               PIC X(44)  VALUE             IC2014.2
   000158         016200            "ERRORS ENCOUNTERED".                                 IC2014.2
   000159         016300 01  CCVS-E-3.                                                    IC2014.2
   000160         016400     02  FILLER                      PIC X(22)  VALUE             IC2014.2
   000161         016500            " FOR OFFICIAL USE ONLY".                             IC2014.2
   000162         016600     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2014.2 IMP
   000163         016700     02  FILLER                      PIC X(58)  VALUE             IC2014.2
   000164         016800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2014.2
   000165         016900     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2014.2 IMP
   000166         017000     02 FILLER                       PIC X(15)  VALUE             IC2014.2
   000167         017100             " COPYRIGHT 1985".                                   IC2014.2
   000168         017200 01  CCVS-E-4.                                                    IC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2014.2 IMP
   000170         017400     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2014.2
   000171         017500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2014.2 IMP
   000172         017600     02 FILLER                       PIC X(40)  VALUE             IC2014.2
   000173         017700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2014.2
   000174         017800 01  XXINFO.                                                      IC2014.2
   000175         017900     02 FILLER                       PIC X(19)  VALUE             IC2014.2
   000176         018000            "*** INFORMATION ***".                                IC2014.2
   000177         018100     02 INFO-TEXT.                                                IC2014.2
   000178         018200       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2014.2 IMP
   000179         018300       04 XXCOMPUTED                 PIC X(20).                   IC2014.2
   000180         018400       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2014.2 IMP
   000181         018500       04 XXCORRECT                  PIC X(20).                   IC2014.2
   000182         018600     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2014.2
   000183         018700 01  HYPHEN-LINE.                                                 IC2014.2
   000184         018800     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2014.2 IMP
   000185         018900     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2014.2
   000186         019000-    "*****************************************".                 IC2014.2
   000187         019100     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2014.2
   000188         019200-    "******************************".                            IC2014.2
   000189         019300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2014.2
   000190         019400     "IC201A".                                                    IC2014.2
   000191         019500 PROCEDURE DIVISION.                                              IC2014.2
   000192         019600 CCVS1 SECTION.                                                   IC2014.2
   000193         019700 OPEN-FILES.                                                      IC2014.2
   000194         019800     OPEN     OUTPUT PRINT-FILE.                                  IC2014.2 36
   000195         019900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2014.2 189 130 189 149
   000196         020000     MOVE    SPACE TO TEST-RESULTS.                               IC2014.2 IMP 50
   000197         020100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2014.2 222 227
   000198         020200     GO TO CCVS1-EXIT.                                            IC2014.2 304
   000199         020300 CLOSE-FILES.                                                     IC2014.2
   000200         020400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2014.2 231 252 36
   000201         020500 TERMINATE-CCVS.                                                  IC2014.2
   000202         020600     EXIT PROGRAM.                                                IC2014.2
   000203         020700 TERMINATE-CALL.                                                  IC2014.2
   000204         020800     STOP     RUN.                                                IC2014.2
   000205         020900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2014.2 54 106
   000206         021000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2014.2 54 107
   000207         021100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2014.2 54 105
   000208         021200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2014.2 54 104
   000209         021300     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2014.2 61
   000210         021400 PRINT-DETAIL.                                                    IC2014.2
   000211         021500     IF REC-CT NOT EQUAL TO ZERO                                  IC2014.2 103 IMP
   000212      1  021600             MOVE "." TO PARDOT-X                                 IC2014.2 58
   000213      1  021700             MOVE REC-CT TO DOTVALUE.                             IC2014.2 103 59
   000214         021800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2014.2 50 37 264
   000215         021900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2014.2 54 264
   000216      1  022000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2014.2 281 294
   000217      1  022100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2014.2 295 303
   000218         022200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2014.2 IMP 54 IMP 66
   000219         022300     MOVE SPACE TO CORRECT-X.                                     IC2014.2 IMP 80
   000220         022400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2014.2 103 IMP IMP 56
   000221         022500     MOVE     SPACE TO RE-MARK.                                   IC2014.2 IMP 61
   000222         022600 HEAD-ROUTINE.                                                    IC2014.2
   000223         022700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2014.2 113 38 264
   000224         022800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2014.2 118 38 264
   000225         022900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2014.2 127 38 264
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2014.2 139 38 264
   000227         023100 COLUMN-NAMES-ROUTINE.                                            IC2014.2
   000228         023200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2014.2 91 38 264
   000229         023300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2014.2 96 38 264
   000230         023400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2014.2 183 38 264
   000231         023500 END-ROUTINE.                                                     IC2014.2
   000232         023600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2014.2 183 38 264
   000233         023700 END-RTN-EXIT.                                                    IC2014.2
   000234         023800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2014.2 146 38 264
   000235         023900 END-ROUTINE-1.                                                   IC2014.2
   000236         024000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2014.2 105 109 106
   000237         024100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2014.2 109 104 109
   000238         024200      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2014.2 107 109
   000239         024300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2014.2
   000240         024400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2014.2 107 169
   000241         024500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2014.2 109 171
   000242         024600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2014.2 168 154
   000243         024700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2014.2 151 38 264
   000244         024800  END-ROUTINE-12.                                                 IC2014.2
   000245         024900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2014.2 157
   000246         025000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2014.2 105 IMP
   000247      1  025100         MOVE "NO " TO ERROR-TOTAL                                IC2014.2 155
   000248         025200         ELSE                                                     IC2014.2
   000249      1  025300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2014.2 105 155
   000250         025400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2014.2 151 38
   000251         025500     PERFORM WRITE-LINE.                                          IC2014.2 264
   000252         025600 END-ROUTINE-13.                                                  IC2014.2
   000253         025700     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2014.2 104 IMP
   000254      1  025800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2014.2 155
   000255      1  025900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2014.2 104 155
   000256         026000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2014.2 157
   000257         026100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2014.2 151 38 264
   000258         026200      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2014.2 106 IMP
   000259      1  026300          MOVE "NO " TO ERROR-TOTAL                               IC2014.2 155
   000260      1  026400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2014.2 106 155
   000261         026500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2014.2 157
   000262         026600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2014.2 151 38 264
   000263         026700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2014.2 159 38 264
   000264         026800 WRITE-LINE.                                                      IC2014.2
   000265         026900     ADD 1 TO RECORD-COUNT.                                       IC2014.2 111
   000266         027000     IF RECORD-COUNT GREATER 50                                   IC2014.2 111
   000267      1  027100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2014.2 38 110
   000268      1  027200         MOVE SPACE TO DUMMY-RECORD                               IC2014.2 IMP 38
   000269      1  027300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2014.2 38
   000270      1  027400         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2014.2 91 38 276
   000271      1  027500         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2014.2 96 38 276
   000272      1  027600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2014.2 183 38 276
   000273      1  027700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2014.2 110 38
   000274      1  027800         MOVE ZERO TO RECORD-COUNT.                               IC2014.2 IMP 111
   000275         027900     PERFORM WRT-LN.                                              IC2014.2 276
   000276         028000 WRT-LN.                                                          IC2014.2
   000277         028100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2014.2 38
   000278         028200     MOVE SPACE TO DUMMY-RECORD.                                  IC2014.2 IMP 38
   000279         028300 BLANK-LINE-PRINT.                                                IC2014.2
   000280         028400     PERFORM WRT-LN.                                              IC2014.2 276
   000281         028500 FAIL-ROUTINE.                                                    IC2014.2
   000282         028600     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2014.2 66 IMP 289
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2014.2 80 IMP 289
   000284         028800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2014.2 112 182
   000285         028900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2014.2 177
   000286         029000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2014.2 174 38 264
   000287         029100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2014.2 IMP 182
   000288         029200     GO TO  FAIL-ROUTINE-EX.                                      IC2014.2 294
   000289         029300 FAIL-ROUTINE-WRITE.                                              IC2014.2
   000290         029400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2014.2 62 37 264
   000291         029500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2014.2 112 90
   000292         029600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2014.2 77 37 264
   000293         029700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2014.2 IMP 90
   000294         029800 FAIL-ROUTINE-EX. EXIT.                                           IC2014.2
   000295         029900 BAIL-OUT.                                                        IC2014.2
   000296         030000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2014.2 67 IMP 298
   000297         030100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2014.2 81 IMP 303
   000298         030200 BAIL-OUT-WRITE.                                                  IC2014.2
   000299         030300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2014.2 81 181 67 179
   000300         030400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2014.2 112 182
   000301         030500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2014.2 174 38 264
   000302         030600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2014.2 IMP 182
   000303         030700 BAIL-OUT-EX. EXIT.                                               IC2014.2
   000304         030800 CCVS1-EXIT.                                                      IC2014.2
   000305         030900     EXIT.                                                        IC2014.2
   000306         031000 SECT-IC201-0001 SECTION.                                         IC2014.2
   000307         031100 CALL-TEST-01.                                                    IC2014.2
   000308         031200     MOVE "CALL-TEST-01" TO PAR-NAME.                             IC2014.2 56
   000309         031300     MOVE     "LEV 2 CALL STATEMENT" TO FEATURE.                  IC2014.2 52
   000310         031400     MOVE 0 TO CALL-COUNT.                                        IC2014.2 48
   000311         031500*        THIS TEST HAS CALL STATEMENTS WITH AN IDENTIFIER         IC2014.2
   000312         031600*    CONTAINING THE NAME OF THE SUBPROGRAM TO BE CALLED.          IC2014.2
   000313         031700*        CALL-TEST-01 CONTAINS THE BASIC LEVEL 2 CALL STATEMENT.  IC2014.2
   000314         031800*    IF IT CANNOT BE COMPILED AND EXECUTED CORRECTLY, THERE IS    IC2014.2
   000315         031900*    NO USE IN RUNNING THE LEVEL 2 IPC ROUTINES.                  IC2014.2
   000316         032000 CALL-TEST-01-01.                                                 IC2014.2
   000317         032100     MOVE 1 TO REC-CT.                                            IC2014.2 103
   000318         032200     MOVE ZERO TO DN3, DN4.                                       IC2014.2 IMP 41 46
   000319         032300     CALL "IC202A" USING DN1, DN2, DN3, DN4.                      IC2014.2 EXT 40 44 41 46
   000320         032400     PERFORM CHECK-TEST-01.                                       IC2014.2 590
   000321         032500     IF FAIL-FLAG EQUAL TO ZERO                                   IC2014.2 49 IMP
   000322      1  032600         PERFORM PASS                                             IC2014.2 206
   000323      1  032700         GO TO CALL-WRITE-01-01.                                  IC2014.2 328
   000324         032800 CALL-FAIL-01-01.                                                 IC2014.2
   000325         032900     PERFORM FAIL.                                                IC2014.2 207
   000326         033000     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2014.2 49 74
   000327         033100     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2014.2 61
   000328         033200 CALL-WRITE-01-01.                                                IC2014.2
   000329         033300     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000330         033400 CALL-TEST-01-02.                                                 IC2014.2
   000331         033500     ADD 1 TO REC-CT.                                             IC2014.2 103
   000332         033600     MOVE ZERO TO DN3, DN4.                                       IC2014.2 IMP 41 46
   000333         033700     CALL ID1 USING DN1, DN2, DN3, DN4.                           IC2014.2 42 40 44 41 46
   000334         033800     PERFORM CHECK-TEST-01.                                       IC2014.2 590
   000335         033900     IF FAIL-FLAG EQUAL TO ZERO                                   IC2014.2 49 IMP
   000336      1  034000         PERFORM PASS                                             IC2014.2 206
   000337      1  034100         GO TO CALL-WRITE-01-02.                                  IC2014.2 342
   000338         034200 CALL-FAIL-01-02.                                                 IC2014.2
   000339         034300     PERFORM FAIL.                                                IC2014.2 207
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2014.2 49 74
   000341         034500     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2014.2 61
   000342         034600 CALL-WRITE-01-02.                                                IC2014.2
   000343         034700     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000344         034800 CALL-TEST-01-03.                                                 IC2014.2
   000345         034900     ADD 1 TO REC-CT.                                             IC2014.2 103
   000346         035000     MOVE ID1 TO ID2.                                             IC2014.2 42 43
   000347         035100     MOVE ZERO TO DN3, DN4.                                       IC2014.2 IMP 41 46
   000348         035200     CALL ID2 USING DN1 DN2 DN3 DN4.                              IC2014.2 43 40 44 41 46
   000349         035300     PERFORM CHECK-TEST-01.                                       IC2014.2 590
   000350         035400     IF FAIL-FLAG EQUAL TO ZERO                                   IC2014.2 49 IMP
   000351      1  035500         PERFORM PASS                                             IC2014.2 206
   000352      1  035600         GO TO CALL-WRITE-01-03.                                  IC2014.2 357
   000353         035700 CALL-FAIL-01-03.                                                 IC2014.2
   000354         035800     PERFORM FAIL.                                                IC2014.2 207
   000355         035900     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2014.2 49 74
   000356         036000     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2014.2 61
   000357         036100 CALL-WRITE-01-03.                                                IC2014.2
   000358         036200     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000359         036300 CALL-TEST-01-04.                                                 IC2014.2
   000360         036400     ADD 1 TO REC-CT.                                             IC2014.2 103
   000361         036500     MOVE "IC202A" TO ID2.                                        IC2014.2 43
   000362         036600     MOVE ZERO TO DN3, DN4.                                       IC2014.2 IMP 41 46
   000363         036700     CALL ID2 USING DN1, DN2, DN3, DN4.                           IC2014.2 43 40 44 41 46
   000364         036800     PERFORM CHECK-TEST-01.                                       IC2014.2 590
   000365         036900     IF FAIL-FLAG EQUAL TO ZERO                                   IC2014.2 49 IMP
   000366      1  037000         PERFORM PASS                                             IC2014.2 206
   000367      1  037100         GO TO CALL-WRITE-01-04.                                  IC2014.2 372
   000368         037200 CALL-FAIL-01-04.                                                 IC2014.2
   000369         037300     PERFORM FAIL.                                                IC2014.2 207
   000370         037400     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2014.2 49 74
   000371         037500     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2014.2 61
   000372         037600 CALL-WRITE-01-04.                                                IC2014.2
   000373         037700     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000374         037800 CALL-TEST-02.                                                    IC2014.2
   000375         037900     MOVE "CALL-TEST-02" TO PAR-NAME.                             IC2014.2 56
   000376         038000     MOVE "DATA-NAME USED TWICE" TO FEATURE.                      IC2014.2 52
   000377         038100*        THIS TEST USES A DATA-NAME MORE THAN ONCE IN             IC2014.2
   000378         038200*    A USING PHRASE OF A CALL STATEMENT.                          IC2014.2
   000379         038300 CALL-TEST-02-01.                                                 IC2014.2
   000380         038400     MOVE 1 TO REC-CT.                                            IC2014.2 103
   000381         038500     MOVE 1 TO DN1.                                               IC2014.2 40
   000382         038600     MOVE 0 TO DN2, DN3, DN4.                                     IC2014.2 44 41 46
   000383         038700     CALL "IC202A" USING DN1, DN2, DN1, DN4.                      IC2014.2 EXT 40 44 40 46
   000384         038800     IF DN1 NOT EQUAL TO 2                                        IC2014.2 40
   000385      1  038900         GO TO CALL-FAIL-02-01-1.                                 IC2014.2 399
   000386         039000     IF DN2 NOT EQUAL TO 0                                        IC2014.2 44
   000387      1  039100         GO TO CALL-FAIL-02-01-2.                                 IC2014.2 404
   000388         039200     IF DN3 NOT EQUAL TO 0                                        IC2014.2 41
   000389      1  039300         GO TO CALL-FAIL-02-01-3.                                 IC2014.2 409
   000390         039400     IF DN4 NOT EQUAL TO 5                                        IC2014.2 46
   000391      1  039500         GO TO CALL-FAIL-02-01-4.                                 IC2014.2 414
   000392         039600     GO TO CALL-PASS-02-01.                                       IC2014.2 396
   000393         039700 CALL-DELETE-02-01.                                               IC2014.2
   000394         039800     PERFORM DE-LETE.                                             IC2014.2 208
   000395         039900     GO TO CALL-WRITE-02-01.                                      IC2014.2 420
   000396         040000 CALL-PASS-02-01.                                                 IC2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     PERFORM PASS.                                                IC2014.2 206
   000398         040200     GO TO CALL-WRITE-02-01.                                      IC2014.2 420
   000399         040300 CALL-FAIL-02-01-1.                                               IC2014.2
   000400         040400     MOVE DN1 TO COMPUTED-18V0.                                   IC2014.2 40 74
   000401         040500     MOVE 2 TO CORRECT-18V0.                                      IC2014.2 87
   000402         040600     MOVE "ERROR IN DN1 VALUE RETURNED" TO RE-MARK.               IC2014.2 61
   000403         040700     GO TO CALL-FAIL-02-01.                                       IC2014.2 418
   000404         040800 CALL-FAIL-02-01-2.                                               IC2014.2
   000405         040900     MOVE DN2 TO COMPUTED-18V0.                                   IC2014.2 44 74
   000406         041000     MOVE 0 TO CORRECT-18V0.                                      IC2014.2 87
   000407         041100     MOVE "ERROR IN DN2 VALUE RETURNED" TO RE-MARK.               IC2014.2 61
   000408         041200     GO TO CALL-FAIL-02-01.                                       IC2014.2 418
   000409         041300 CALL-FAIL-02-01-3.                                               IC2014.2
   000410         041400     MOVE DN3 TO COMPUTED-18V0.                                   IC2014.2 41 74
   000411         041500     MOVE ZERO TO CORRECT-18V0.                                   IC2014.2 IMP 87
   000412         041600     MOVE "DN3 VALUE CHANGED BY CALL" TO RE-MARK.                 IC2014.2 61
   000413         041700     GO TO CALL-FAIL-02-01.                                       IC2014.2 418
   000414         041800 CALL-FAIL-02-01-4.                                               IC2014.2
   000415         041900     MOVE DN4 TO COMPUTED-18V0.                                   IC2014.2 46 74
   000416         042000     MOVE 5 TO CORRECT-18V0.                                      IC2014.2 87
   000417         042100     MOVE "ERROR IN DN4 VALUE RETURNED" TO RE-MARK.               IC2014.2 61
   000418         042200 CALL-FAIL-02-01.                                                 IC2014.2
   000419         042300     PERFORM FAIL.                                                IC2014.2 207
   000420         042400 CALL-WRITE-02-01.                                                IC2014.2
   000421         042500     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000422         042600 CALL-TEST-02-02.                                                 IC2014.2
   000423         042700     ADD 1 TO REC-CT.                                             IC2014.2 103
   000424         042800     MOVE 0 TO DN4, DN3, DN2, DN1.                                IC2014.2 46 41 44 40
   000425         042900     CALL ID1 USING DN1 DN2 DN3 DN2.                              IC2014.2 42 40 44 41 44
   000426         043000     IF DN1 NOT EQUAL TO 0                                        IC2014.2 40
   000427      1  043100         GO TO CALL-FAIL-02-02-1.                                 IC2014.2 441
   000428         043200     IF DN2 NOT EQUAL TO 6                                        IC2014.2 44
   000429      1  043300         GO TO CALL-FAIL-02-02-2.                                 IC2014.2 446
   000430         043400     IF DN3 NOT EQUAL TO 1                                        IC2014.2 41
   000431      1  043500         GO TO CALL-FAIL-02-02-3.                                 IC2014.2 451
   000432         043600     IF DN4 NOT EQUAL TO 0                                        IC2014.2 46
   000433      1  043700         GO TO CALL-FAIL-02-02-4.                                 IC2014.2 456
   000434         043800     GO TO CALL-PASS-02-02.                                       IC2014.2 438
   000435         043900 CALL-DELETE-02-02.                                               IC2014.2
   000436         044000     PERFORM DE-LETE.                                             IC2014.2 208
   000437         044100     GO TO CALL-WRITE-02-02.                                      IC2014.2 462
   000438         044200 CALL-PASS-02-02.                                                 IC2014.2
   000439         044300     PERFORM PASS.                                                IC2014.2 206
   000440         044400     GO TO CALL-WRITE-02-02.                                      IC2014.2 462
   000441         044500 CALL-FAIL-02-02-1.                                               IC2014.2
   000442         044600     MOVE DN1 TO COMPUTED-18V0.                                   IC2014.2 40 74
   000443         044700     MOVE ZERO TO CORRECT-18V0.                                   IC2014.2 IMP 87
   000444         044800     MOVE "ERROR IN DN1 VALUE RETURNED" TO RE-MARK.               IC2014.2 61
   000445         044900     GO TO CALL-FAIL-02-02.                                       IC2014.2 460
   000446         045000 CALL-FAIL-02-02-2.                                               IC2014.2
   000447         045100     MOVE DN2 TO COMPUTED-18V0.                                   IC2014.2 44 74
   000448         045200     MOVE 6 TO CORRECT-18V0.                                      IC2014.2 87
   000449         045300     MOVE "ERROR IN DN2 VALUE RETURNED" TO RE-MARK.               IC2014.2 61
   000450         045400     GO TO CALL-FAIL-02-02.                                       IC2014.2 460
   000451         045500 CALL-FAIL-02-02-3.                                               IC2014.2
   000452         045600     MOVE DN3 TO COMPUTED-18V0.                                   IC2014.2 41 74
   000453         045700     MOVE 1 TO CORRECT-18V0.                                      IC2014.2 87
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     MOVE "ERROR IN DN3 VALUE RETURNED" TO RE-MARK.               IC2014.2 61
   000455         045900     GO TO CALL-FAIL-02-02.                                       IC2014.2 460
   000456         046000 CALL-FAIL-02-02-4.                                               IC2014.2
   000457         046100     MOVE DN4 TO COMPUTED-18V0.                                   IC2014.2 46 74
   000458         046200     MOVE 0 TO CORRECT-18V0.                                      IC2014.2 87
   000459         046300     MOVE "DN4 VALUE CHANGED BY CALL" TO RE-MARK.                 IC2014.2 61
   000460         046400 CALL-FAIL-02-02.                                                 IC2014.2
   000461         046500     PERFORM FAIL.                                                IC2014.2 207
   000462         046600 CALL-WRITE-02-02.                                                IC2014.2
   000463         046700     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000464         046800 CALL-TEST-02-03.                                                 IC2014.2
   000465         046900     ADD 1 TO REC-CT.                                             IC2014.2 103
   000466         047000     MOVE 0 TO DN4, DN3.                                          IC2014.2 46 41
   000467         047100     MOVE 10 TO DN2.                                              IC2014.2 44
   000468         047200     MOVE 25 TO DN1.                                              IC2014.2 40
   000469         047300     CALL ID1 USING DN1 DN2 DN1 DN2.                              IC2014.2 42 40 44 40 44
   000470         047400     IF DN1 EQUAL TO 26                                           IC2014.2 40
   000471      1  047500         GO TO CHECK-02-03-2.                                     IC2014.2 481
   000472         047600     GO TO CALL-FAIL-02-03-1.                                     IC2014.2 476
   000473         047700 CALL-DELETE-02-03.                                               IC2014.2
   000474         047800     PERFORM DE-LETE.                                             IC2014.2 208
   000475         047900     GO TO CALL-WRITE-02-03.                                      IC2014.2 509
   000476         048000 CALL-FAIL-02-03-1.                                               IC2014.2
   000477         048100     MOVE DN1 TO COMPUTED-18V0.                                   IC2014.2 40 74
   000478         048200     MOVE 26 TO CORRECT-18V0.                                     IC2014.2 87
   000479         048300     MOVE "ERROR IN DN1 VALUE RETURNED" TO RE-MARK.               IC2014.2 61
   000480         048400     GO TO CALL-FAIL-02-03.                                       IC2014.2 504
   000481         048500 CHECK-02-03-2.                                                   IC2014.2
   000482         048600     IF DN2 EQUAL TO 7                                            IC2014.2 44
   000483      1  048700         GO TO CHECK-02-03-3.                                     IC2014.2 489
   000484         048800 CALL-FAIL-02-03-2.                                               IC2014.2
   000485         048900     MOVE DN2 TO COMPUTED-18V0.                                   IC2014.2 44 74
   000486         049000     MOVE 7 TO CORRECT-18V0.                                      IC2014.2 87
   000487         049100     MOVE "ERROR IN DN2 VALUE RETURNED" TO RE-MARK.               IC2014.2 61
   000488         049200     GO TO CALL-FAIL-02-03.                                       IC2014.2 504
   000489         049300 CHECK-02-03-3.                                                   IC2014.2
   000490         049400     IF DN3 EQUAL TO 0                                            IC2014.2 41
   000491      1  049500         GO TO CHECK-02-03-4.                                     IC2014.2 497
   000492         049600 CALL-FAIL-02-03-3.                                               IC2014.2
   000493         049700     MOVE DN3 TO COMPUTED-18V0.                                   IC2014.2 41 74
   000494         049800     MOVE 0 TO CORRECT-18V0.                                      IC2014.2 87
   000495         049900     MOVE "DN3 VALUE CHANGED BY CALL" TO RE-MARK.                 IC2014.2 61
   000496         050000     GO TO CALL-FAIL-02-03.                                       IC2014.2 504
   000497         050100 CHECK-02-03-4.                                                   IC2014.2
   000498         050200     IF DN4 EQUAL TO 0                                            IC2014.2 46
   000499      1  050300         GO TO CALL-PASS-02-03.                                   IC2014.2 507
   000500         050400 CALL-FAIL-02-03-4.                                               IC2014.2
   000501         050500     MOVE DN4 TO COMPUTED-18V0.                                   IC2014.2 46 74
   000502         050600     MOVE 0 TO CORRECT-18V0.                                      IC2014.2 87
   000503         050700     MOVE "DN4 VALUE CHANGED BY CALL" TO RE-MARK.                 IC2014.2 61
   000504         050800 CALL-FAIL-02-03.                                                 IC2014.2
   000505         050900     PERFORM FAIL.                                                IC2014.2 207
   000506         051000     GO TO CALL-WRITE-02-03.                                      IC2014.2 509
   000507         051100 CALL-PASS-02-03.                                                 IC2014.2
   000508         051200     PERFORM PASS.                                                IC2014.2 206
   000509         051300 CALL-WRITE-02-03.                                                IC2014.2
   000510         051400     PERFORM PRINT-DETAIL.                                        IC2014.2 210
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500 CALL-TEST-03.                                                    IC2014.2
   000512         051600*        THIS TEST USES THE ON OVERFLOW PHRASE IN THE CALL        IC2014.2
   000513         051700*    STATEMENT.  THIS IS A SYNTACTICAL CHECK ONLY, THE ON         IC2014.2
   000514         051800*    OVERFLOW CONDITION SHOULD NEVER OCCUR.                       IC2014.2
   000515         051900     MOVE "CALL-TEST-03" TO PAR-NAME.                             IC2014.2 56
   000516         052000     MOVE "ON OVERFLOW PHRASE" TO FEATURE.                        IC2014.2 52
   000517         052100 CALL-TEST-03-01.                                                 IC2014.2
   000518         052200     MOVE 7 TO CALL-COUNT.                                        IC2014.2 48
   000519         052300     MOVE 20 TO DN1.                                              IC2014.2 40
   000520         052400     MOVE 30 TO DN2.                                              IC2014.2 44
   000521         052500     MOVE ZERO TO DN3, DN4.                                       IC2014.2 IMP 41 46
   000522         052600     CALL "IC202A" USING DN1, DN2, DN3, DN4;                      IC2014.2 EXT 40 44 41 46
   000523      1  052700         ON OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK  IC2014.2 61
   000524      1  052800                     GO TO CALL-FAIL-03-01.                       IC2014.2 531
   000525         052900     PERFORM CHECK-TEST-03.                                       IC2014.2 602
   000526         053000     IF FAIL-FLAG EQUAL TO ZERO                                   IC2014.2 49 IMP
   000527      1  053100         PERFORM PASS                                             IC2014.2 206
   000528      1  053200         GO TO CALL-WRITE-03-01.                                  IC2014.2 533
   000529         053300     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2014.2 49 74
   000530         053400     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2014.2 61
   000531         053500 CALL-FAIL-03-01.                                                 IC2014.2
   000532         053600     PERFORM FAIL.                                                IC2014.2 207
   000533         053700 CALL-WRITE-03-01.                                                IC2014.2
   000534         053800     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000535         053900 CALL-TEST-03-02.                                                 IC2014.2
   000536         054000     MOVE ZERO TO DN3, DN4.                                       IC2014.2 IMP 41 46
   000537         054100     CALL "IC202A" USING DN1, DN2, DN3, DN4;                      IC2014.2 EXT 40 44 41 46
   000538      1  054200         OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK     IC2014.2 61
   000539      1  054300                  GO TO CALL-FAIL-03-02.                          IC2014.2 546
   000540         054400     PERFORM CHECK-TEST-03.                                       IC2014.2 602
   000541         054500     IF FAIL-FLAG EQUAL TO ZERO                                   IC2014.2 49 IMP
   000542      1  054600         PERFORM PASS                                             IC2014.2 206
   000543      1  054700         GO TO CALL-WRITE-03-02.                                  IC2014.2 548
   000544         054800     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2014.2 49 74
   000545         054900     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2014.2 61
   000546         055000 CALL-FAIL-03-02.                                                 IC2014.2
   000547         055100     PERFORM FAIL.                                                IC2014.2 207
   000548         055200 CALL-WRITE-03-02.                                                IC2014.2
   000549         055300     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000550         055400 CALL-TEST-03-03.                                                 IC2014.2
   000551         055500     MOVE ZERO TO DN3, DN4.                                       IC2014.2 IMP 41 46
   000552         055600     CALL ID1 USING DN1 DN2 DN3 DN4                               IC2014.2 42 40 44 41 46
   000553      1  055700         ON OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK  IC2014.2 61
   000554      1  055800                     GO TO CALL-FAIL-03-03.                       IC2014.2 561
   000555         055900     PERFORM   CHECK-TEST-03.                                     IC2014.2 602
   000556         056000     IF FAIL-FLAG EQUAL TO ZERO                                   IC2014.2 49 IMP
   000557      1  056100         PERFORM PASS                                             IC2014.2 206
   000558      1  056200         GO TO CALL-WRITE-03-03.                                  IC2014.2 563
   000559         056300     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2014.2 49 74
   000560         056400     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2014.2 61
   000561         056500 CALL-FAIL-03-03.                                                 IC2014.2
   000562         056600     PERFORM FAIL.                                                IC2014.2 207
   000563         056700 CALL-WRITE-03-03.                                                IC2014.2
   000564         056800     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000565         056900 CALL-TEST-03-04.                                                 IC2014.2
   000566         057000     MOVE ZERO TO DN3, DN4.                                       IC2014.2 IMP 41 46
   000567         057100     CALL ID1 USING DN1 DN2 DN3 DN4;                              IC2014.2 42 40 44 41 46
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  057200         OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK,    IC2014.2 61
   000569      1  057300                  GO TO CALL-FAIL-03-04.                          IC2014.2 576
   000570         057400     PERFORM CHECK-TEST-03.                                       IC2014.2 602
   000571         057500     IF FAIL-FLAG EQUAL TO ZERO                                   IC2014.2 49 IMP
   000572      1  057600         PERFORM PASS                                             IC2014.2 206
   000573      1  057700         GO TO CALL-WRITE-03-04.                                  IC2014.2 578
   000574         057800     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2014.2 49 74
   000575         057900     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2014.2 61
   000576         058000 CALL-FAIL-03-04.                                                 IC2014.2
   000577         058100     PERFORM FAIL.                                                IC2014.2 207
   000578         058200 CALL-WRITE-03-04.                                                IC2014.2
   000579         058300     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000580         058400     GO TO EXIT-IC201.                                            IC2014.2 587
   000581         058500 CALL-DELETE-03.                                                  IC2014.2
   000582         058600*        IF THE ON OVERFLOW PHRASE IS NOT RECOGNIZED, DELETE ALL  IC2014.2
   000583         058700*    OF THE ABOVE CALL-TEST-03 PARAGRAPHS, STARTING WITH          IC2014.2
   000584         058800*    CALL-TEST-03-01.                                             IC2014.2
   000585         058900     PERFORM DE-LETE.                                             IC2014.2 208
   000586         059000     PERFORM PRINT-DETAIL.                                        IC2014.2 210
   000587         059100 EXIT-IC201.                                                      IC2014.2
   000588         059200     GO TO CCVS-EXIT.                                             IC2014.2 613
   000589         059300 SECT-IC201-0002 SECTION.                                         IC2014.2
   000590         059400 CHECK-TEST-01.                                                   IC2014.2
   000591         059500     MOVE ZERO TO FAIL-FLAG.                                      IC2014.2 IMP 49
   000592         059600     ADD 1 TO CALL-COUNT.                                         IC2014.2 48
   000593         059700     IF DN1 EQUAL TO ZERO                                         IC2014.2 40 IMP
   000594      1  059800             NEXT SENTENCE                                        IC2014.2
   000595      1  059900         ELSE ADD 1 TO FAIL-FLAG.                                 IC2014.2 49
   000596         060000     IF DN2 NOT EQUAL TO ZERO                                     IC2014.2 44 IMP
   000597      1  060100         ADD 1 TO FAIL-FLAG.                                      IC2014.2 49
   000598         060200     IF DN3 NOT EQUAL TO 1                                        IC2014.2 41
   000599      1  060300         ADD 1 TO FAIL-FLAG.                                      IC2014.2 49
   000600         060400     IF DN4 NOT EQUAL TO CALL-COUNT                               IC2014.2 46 48
   000601      1  060500         ADD 1 TO FAIL-FLAG.                                      IC2014.2 49
   000602         060600 CHECK-TEST-03.                                                   IC2014.2
   000603         060700     MOVE ZERO TO FAIL-FLAG.                                      IC2014.2 IMP 49
   000604         060800     ADD 1 TO CALL-COUNT.                                         IC2014.2 48
   000605         060900     IF DN4 NOT EQUAL TO CALL-COUNT                               IC2014.2 46 48
   000606      1  061000         ADD 1 TO FAIL-FLAG.                                      IC2014.2 49
   000607         061100     IF DN3 NOT EQUAL TO 21                                       IC2014.2 41
   000608      1  061200         ADD 1 TO FAIL-FLAG.                                      IC2014.2 49
   000609         061300     IF DN2 NOT EQUAL TO 30                                       IC2014.2 44
   000610      1  061400         ADD 1 TO FAIL-FLAG.                                      IC2014.2 49
   000611         061500     IF DN1 NOT EQUAL TO 20                                       IC2014.2 40
   000612      1  061600         ADD 1 TO FAIL-FLAG.                                      IC2014.2 49
   000613         061700 CCVS-EXIT SECTION.                                               IC2014.2
   000614         061800 CCVS-999999.                                                     IC2014.2
   000615         061900     GO TO CLOSE-FILES.                                           IC2014.2 199
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      112   ANSI-REFERENCE . . . . . . . .  284 291 300
       48   CALL-COUNT . . . . . . . . . .  M310 M518 M592 600 M604 605
       91   CCVS-C-1 . . . . . . . . . . .  228 270
       96   CCVS-C-2 . . . . . . . . . . .  229 271
      146   CCVS-E-1 . . . . . . . . . . .  234
      151   CCVS-E-2 . . . . . . . . . . .  243 250 257 262
      154   CCVS-E-2-2 . . . . . . . . . .  M242
      159   CCVS-E-3 . . . . . . . . . . .  263
      168   CCVS-E-4 . . . . . . . . . . .  242
      169   CCVS-E-4-1 . . . . . . . . . .  M240
      171   CCVS-E-4-2 . . . . . . . . . .  M241
      113   CCVS-H-1 . . . . . . . . . . .  223
      118   CCVS-H-2A. . . . . . . . . . .  224
      127   CCVS-H-2B. . . . . . . . . . .  225
      139   CCVS-H-3 . . . . . . . . . . .  226
      189   CCVS-PGM-ID. . . . . . . . . .  195 195
       73   CM-18V0
       67   COMPUTED-A . . . . . . . . . .  68 70 71 72 73 296 299
       68   COMPUTED-N
       66   COMPUTED-X . . . . . . . . . .  M218 282
       70   COMPUTED-0V18
       72   COMPUTED-14V4
       74   COMPUTED-18V0. . . . . . . . .  M326 M340 M355 M370 M400 M405 M410 M415 M442 M447 M452 M457 M477 M485 M493 M501
                                            M529 M544 M559 M574
       71   COMPUTED-4V14
       90   COR-ANSI-REFERENCE . . . . . .  M291 M293
       81   CORRECT-A. . . . . . . . . . .  82 83 84 85 86 297 299
       82   CORRECT-N
       80   CORRECT-X. . . . . . . . . . .  M219 283
       83   CORRECT-0V18
       85   CORRECT-14V4
       87   CORRECT-18V0 . . . . . . . . .  M401 M406 M411 M416 M443 M448 M453 M458 M478 M486 M494 M502
       84   CORRECT-4V14
       86   CR-18V0
      104   DELETE-COUNTER . . . . . . . .  M208 237 253 255
       40   DN1. . . . . . . . . . . . . .  319 333 348 363 M381 383 383 384 400 M424 425 426 442 M468 469 469 470 477 M519
                                            522 537 552 567 593 611
       44   DN2. . . . . . . . . . . . . .  319 333 348 363 M382 383 386 405 M424 425 425 428 447 M467 469 469 482 485 M520
                                            522 537 552 567 596 609
       41   DN3. . . . . . . . . . . . . .  M318 319 M332 333 M347 348 M362 363 M382 388 410 M424 425 430 452 M466 490 493
                                            M521 522 M536 537 M551 552 M566 567 598 607
       46   DN4. . . . . . . . . . . . . .  M318 319 M332 333 M347 348 M362 363 M382 383 390 415 M424 432 457 M466 498 501
                                            M521 522 M536 537 M551 552 M566 567 600 605
       59   DOTVALUE . . . . . . . . . . .  M213
      110   DUMMY-HOLD . . . . . . . . . .  M267 273
       38   DUMMY-RECORD . . . . . . . . .  M223 M224 M225 M226 M228 M229 M230 M232 M234 M243 M250 M257 M262 M263 267 M268
                                            269 M270 M271 M272 M273 277 M278 M286 M301
      157   ENDER-DESC . . . . . . . . . .  M245 M256 M261
      105   ERROR-COUNTER. . . . . . . . .  M207 236 246 249
      109   ERROR-HOLD . . . . . . . . . .  M236 M237 M237 M238 241
      155   ERROR-TOTAL. . . . . . . . . .  M247 M249 M254 M255 M259 M260
       49   FAIL-FLAG. . . . . . . . . . .  321 326 335 340 350 355 365 370 526 529 541 544 556 559 571 574 M591 M595 M597
                                            M599 M601 M603 M606 M608 M610 M612
       52   FEATURE. . . . . . . . . . . .  M309 M376 M516
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page    15
0 Defined   Cross-reference of data names   References

0     183   HYPHEN-LINE. . . . . . . . . .  230 232 272
      149   ID-AGAIN . . . . . . . . . . .  M195
       42   ID1. . . . . . . . . . . . . .  333 346 425 469 552 567
       43   ID2. . . . . . . . . . . . . .  M346 348 M361 363
      182   INF-ANSI-REFERENCE . . . . . .  M284 M287 M300 M302
      177   INFO-TEXT. . . . . . . . . . .  M285
      106   INSPECT-COUNTER. . . . . . . .  M205 236 258 260
       54   P-OR-F . . . . . . . . . . . .  M205 M206 M207 M208 215 M218
       56   PAR-NAME . . . . . . . . . . .  M220 M308 M375 M515
       58   PARDOT-X . . . . . . . . . . .  M212
      107   PASS-COUNTER . . . . . . . . .  M206 238 240
       36   PRINT-FILE . . . . . . . . . .  32 194 200
       37   PRINT-REC. . . . . . . . . . .  M214 M290 M292
       61   RE-MARK. . . . . . . . . . . .  M209 M221 M327 M341 M356 M371 M402 M407 M412 M417 M444 M449 M454 M459 M479 M487
                                            M495 M503 M523 M530 M538 M545 M553 M560 M568 M575
      103   REC-CT . . . . . . . . . . . .  211 213 220 M317 M331 M345 M360 M380 M423 M465
      102   REC-SKL-SUB
      111   RECORD-COUNT . . . . . . . . .  M265 266 M274
       62   TEST-COMPUTED. . . . . . . . .  290
       77   TEST-CORRECT . . . . . . . . .  292
      130   TEST-ID. . . . . . . . . . . .  M195
       50   TEST-RESULTS . . . . . . . . .  M196 214
      108   TOTAL-ERROR
      179   XXCOMPUTED . . . . . . . . . .  M299
      181   XXCORRECT. . . . . . . . . . .  M299
      174   XXINFO . . . . . . . . . . . .  286 301
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page    16
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

      295   BAIL-OUT . . . . . . . . . . .  P217
      303   BAIL-OUT-EX. . . . . . . . . .  E217 G297
      298   BAIL-OUT-WRITE . . . . . . . .  G296
      279   BLANK-LINE-PRINT
      393   CALL-DELETE-02-01
      435   CALL-DELETE-02-02
      473   CALL-DELETE-02-03
      581   CALL-DELETE-03
      324   CALL-FAIL-01-01
      338   CALL-FAIL-01-02
      353   CALL-FAIL-01-03
      368   CALL-FAIL-01-04
      418   CALL-FAIL-02-01. . . . . . . .  G403 G408 G413
      399   CALL-FAIL-02-01-1. . . . . . .  G385
      404   CALL-FAIL-02-01-2. . . . . . .  G387
      409   CALL-FAIL-02-01-3. . . . . . .  G389
      414   CALL-FAIL-02-01-4. . . . . . .  G391
      460   CALL-FAIL-02-02. . . . . . . .  G445 G450 G455
      441   CALL-FAIL-02-02-1. . . . . . .  G427
      446   CALL-FAIL-02-02-2. . . . . . .  G429
      451   CALL-FAIL-02-02-3. . . . . . .  G431
      456   CALL-FAIL-02-02-4. . . . . . .  G433
      504   CALL-FAIL-02-03. . . . . . . .  G480 G488 G496
      476   CALL-FAIL-02-03-1. . . . . . .  G472
      484   CALL-FAIL-02-03-2
      492   CALL-FAIL-02-03-3
      500   CALL-FAIL-02-03-4
      531   CALL-FAIL-03-01. . . . . . . .  G524
      546   CALL-FAIL-03-02. . . . . . . .  G539
      561   CALL-FAIL-03-03. . . . . . . .  G554
      576   CALL-FAIL-03-04. . . . . . . .  G569
      396   CALL-PASS-02-01. . . . . . . .  G392
      438   CALL-PASS-02-02. . . . . . . .  G434
      507   CALL-PASS-02-03. . . . . . . .  G499
      307   CALL-TEST-01
      316   CALL-TEST-01-01
      330   CALL-TEST-01-02
      344   CALL-TEST-01-03
      359   CALL-TEST-01-04
      374   CALL-TEST-02
      379   CALL-TEST-02-01
      422   CALL-TEST-02-02
      464   CALL-TEST-02-03
      511   CALL-TEST-03
      517   CALL-TEST-03-01
      535   CALL-TEST-03-02
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page    17
0 Defined   Cross-reference of procedures   References

0     550   CALL-TEST-03-03
      565   CALL-TEST-03-04
      328   CALL-WRITE-01-01 . . . . . . .  G323
      342   CALL-WRITE-01-02 . . . . . . .  G337
      357   CALL-WRITE-01-03 . . . . . . .  G352
      372   CALL-WRITE-01-04 . . . . . . .  G367
      420   CALL-WRITE-02-01 . . . . . . .  G395 G398
      462   CALL-WRITE-02-02 . . . . . . .  G437 G440
      509   CALL-WRITE-02-03 . . . . . . .  G475 G506
      533   CALL-WRITE-03-01 . . . . . . .  G528
      548   CALL-WRITE-03-02 . . . . . . .  G543
      563   CALL-WRITE-03-03 . . . . . . .  G558
      578   CALL-WRITE-03-04 . . . . . . .  G573
      613   CCVS-EXIT. . . . . . . . . . .  G588
      614   CCVS-999999
      192   CCVS1
      304   CCVS1-EXIT . . . . . . . . . .  G198
      590   CHECK-TEST-01. . . . . . . . .  P320 P334 P349 P364
      602   CHECK-TEST-03. . . . . . . . .  P525 P540 P555 P570
      481   CHECK-02-03-2. . . . . . . . .  G471
      489   CHECK-02-03-3. . . . . . . . .  G483
      497   CHECK-02-03-4. . . . . . . . .  G491
      199   CLOSE-FILES. . . . . . . . . .  G615
      227   COLUMN-NAMES-ROUTINE . . . . .  E197
      208   DE-LETE. . . . . . . . . . . .  P394 P436 P474 P585
      231   END-ROUTINE. . . . . . . . . .  P200
      235   END-ROUTINE-1
      244   END-ROUTINE-12
      252   END-ROUTINE-13 . . . . . . . .  E200
      233   END-RTN-EXIT
      587   EXIT-IC201 . . . . . . . . . .  G580
      207   FAIL . . . . . . . . . . . . .  P325 P339 P354 P369 P419 P461 P505 P532 P547 P562 P577
      281   FAIL-ROUTINE . . . . . . . . .  P216
      294   FAIL-ROUTINE-EX. . . . . . . .  E216 G288
      289   FAIL-ROUTINE-WRITE . . . . . .  G282 G283
      222   HEAD-ROUTINE . . . . . . . . .  P197
      205   INSPT
      193   OPEN-FILES
      206   PASS . . . . . . . . . . . . .  P322 P336 P351 P366 P397 P439 P508 P527 P542 P557 P572
      210   PRINT-DETAIL . . . . . . . . .  P329 P343 P358 P373 P421 P463 P510 P534 P549 P564 P579 P586
      306   SECT-IC201-0001
      589   SECT-IC201-0002
      203   TERMINATE-CALL
      201   TERMINATE-CCVS
      264   WRITE-LINE . . . . . . . . . .  P214 P215 P223 P224 P225 P226 P228 P229 P230 P232 P234 P243 P251 P257 P262 P263
                                            P286 P290 P292 P301
      276   WRT-LN . . . . . . . . . . . .  P270 P271 P272 P275 P280
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page    18
0 Defined   Cross-reference of programs     References

        3   IC201A
 EXTERNAL   IC202A . . . . . . . . . . . .  319 383 522 537
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC201A    Date 06/04/2022  Time 11:58:27   Page    19
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC201A:
 *    Source records = 615
 *    Data Division statements = 71
 *    Procedure Division statements = 358
 *    Generated COBOL statements = 0
 *    Program complexity factor = 366
0End of compilation 1,  program IC201A,  highest severity 0.
0Return code 0
