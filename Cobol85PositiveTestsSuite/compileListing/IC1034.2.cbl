1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:28   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:28   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1034.2
   000002         000200 PROGRAM-ID.                                                      IC1034.2
   000003         000300     IC103A.                                                      IC1034.2
   000004         000500*                                                              *  IC1034.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1034.2
   000006         000700*                                                              *  IC1034.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1034.2
   000008         000900*                                                              *  IC1034.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1034.2
   000010         001100*                                                              *  IC1034.2
   000011         001300*                                                              *  IC1034.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1034.2
   000013         001500*                                                              *  IC1034.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1034.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1034.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1034.2
   000017         001900*                                                              *  IC1034.2
   000018         002100*        THIS PROGRAM TESTS THE USE OF MULTIPLE DATA-NAMES        IC1034.2
   000019         002200*    IN THE USING PHRASE OF THE CALL STATEMENT.  TWO 01 GROUP     IC1034.2
   000020         002300*    ITEMS AND AN ELEMENTARY 77 ITEM ARE THE PARAMETERS.  THE     IC1034.2
   000021         002400*    DATA DEFINITIONS FOR THE GROUP ITEM PARAMETERS ARE NOT       IC1034.2
   000022         002500*    THE SAME AS IN THE SUBPROGRAM BUT THE NUMBER OF CHARACTERS   IC1034.2
   000023         002600*    ARE IDENTICAL.                                               IC1034.2
   000024         002700*        THIS PROGRAM ALSO CALLS A SUBPROGRAM WITH MORE           IC1034.2
   000025         002800*    THAN ONE EXIT PROGRAM STATEMENT.                             IC1034.2
   000026         002900 ENVIRONMENT DIVISION.                                            IC1034.2
   000027         003000 CONFIGURATION SECTION.                                           IC1034.2
   000028         003100 SOURCE-COMPUTER.                                                 IC1034.2
   000029         003200     XXXXX082.                                                    IC1034.2
   000030         003300 OBJECT-COMPUTER.                                                 IC1034.2
   000031         003400     XXXXX083.                                                    IC1034.2
   000032         003500 INPUT-OUTPUT SECTION.                                            IC1034.2
   000033         003600 FILE-CONTROL.                                                    IC1034.2
   000034         003700     SELECT PRINT-FILE ASSIGN TO                                  IC1034.2 38
   000035         003800     XXXXX055.                                                    IC1034.2
   000036         003900 DATA DIVISION.                                                   IC1034.2
   000037         004000 FILE SECTION.                                                    IC1034.2
   000038         004100 FD  PRINT-FILE.                                                  IC1034.2

 ==000038==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000039         004200 01  PRINT-REC PICTURE X(120).                                    IC1034.2
   000040         004300 01  DUMMY-RECORD PICTURE X(120).                                 IC1034.2
   000041         004400 WORKING-STORAGE SECTION.                                         IC1034.2
   000042         004500 77  MAIN-DN1 PICTURE 999.                                        IC1034.2
   000043         004600 77  MAIN-DN2 PICTURE S99 COMPUTATIONAL.                          IC1034.2
   000044         004700 77  ELEM-77   PICTURE V9(4) COMPUTATIONAL.                       IC1034.2
   000045         004800 01  GROUP-01.                                                    IC1034.2
   000046         004900     02 ALPHA-NUM-FIELD  PIC X(5).                                IC1034.2
   000047         005000     02 GROUP-LEV2.                                               IC1034.2
   000048         005100        03 NUMER-FIELD PIC 99.                                    IC1034.2
   000049         005200        03 ALPHA-FIELD PIC A(3).                                  IC1034.2
   000050         005300 01  GROUP-02.                                                    IC1034.2
   000051         005400     02  NUM-ITEM PIC S99.                                        IC1034.2
   000052         005500     02  ALPHA-EDITED PICTURE X(6).                               IC1034.2
   000053         005600 01  TEST-RESULTS.                                                IC1034.2
   000054         005700     02 FILLER                   PIC X      VALUE SPACE.          IC1034.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC1034.2 IMP
   000056         005900     02 FILLER                   PIC X      VALUE SPACE.          IC1034.2 IMP
   000057         006000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC1034.2 IMP
   000058         006100     02 FILLER                   PIC X      VALUE SPACE.          IC1034.2 IMP
   000059         006200     02  PAR-NAME.                                                IC1034.2
   000060         006300       03 FILLER                 PIC X(19)  VALUE SPACE.          IC1034.2 IMP
   000061         006400       03  PARDOT-X              PIC X      VALUE SPACE.          IC1034.2 IMP
   000062         006500       03 DOTVALUE               PIC 99     VALUE ZERO.           IC1034.2 IMP
   000063         006600     02 FILLER                   PIC X(8)   VALUE SPACE.          IC1034.2 IMP
   000064         006700     02 RE-MARK                  PIC X(61).                       IC1034.2
   000065         006800 01  TEST-COMPUTED.                                               IC1034.2
   000066         006900     02 FILLER                   PIC X(30)  VALUE SPACE.          IC1034.2 IMP
   000067         007000     02 FILLER                   PIC X(17)  VALUE                 IC1034.2
   000068         007100            "       COMPUTED=".                                   IC1034.2
   000069         007200     02 COMPUTED-X.                                               IC1034.2
   000070         007300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC1034.2 IMP
   000071         007400     03 COMPUTED-N               REDEFINES COMPUTED-A             IC1034.2 70
   000072         007500                                 PIC -9(9).9(9).                  IC1034.2
   000073         007600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC1034.2 70
   000074         007700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC1034.2 70
   000075         007800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC1034.2 70
   000076         007900     03       CM-18V0 REDEFINES COMPUTED-A.                       IC1034.2 70
   000077         008000         04 COMPUTED-18V0                    PIC -9(18).          IC1034.2
   000078         008100         04 FILLER                           PIC X.               IC1034.2
   000079         008200     03 FILLER PIC X(50) VALUE SPACE.                             IC1034.2 IMP
   000080         008300 01  TEST-CORRECT.                                                IC1034.2
   000081         008400     02 FILLER PIC X(30) VALUE SPACE.                             IC1034.2 IMP
   000082         008500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC1034.2
   000083         008600     02 CORRECT-X.                                                IC1034.2
   000084         008700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC1034.2 IMP
   000085         008800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC1034.2 84
   000086         008900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC1034.2 84
   000087         009000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC1034.2 84
   000088         009100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC1034.2 84
   000089         009200     03      CR-18V0 REDEFINES CORRECT-A.                         IC1034.2 84
   000090         009300         04 CORRECT-18V0                     PIC -9(18).          IC1034.2
   000091         009400         04 FILLER                           PIC X.               IC1034.2
   000092         009500     03 FILLER PIC X(2) VALUE SPACE.                              IC1034.2 IMP
   000093         009600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC1034.2 IMP
   000094         009700 01  CCVS-C-1.                                                    IC1034.2
   000095         009800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC1034.2
   000096         009900-    "SS  PARAGRAPH-NAME                                          IC1034.2
   000097         010000-    "       REMARKS".                                            IC1034.2
   000098         010100     02 FILLER                     PIC X(20)    VALUE SPACE.      IC1034.2 IMP
   000099         010200 01  CCVS-C-2.                                                    IC1034.2
   000100         010300     02 FILLER                     PIC X        VALUE SPACE.      IC1034.2 IMP
   000101         010400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC1034.2
   000102         010500     02 FILLER                     PIC X(15)    VALUE SPACE.      IC1034.2 IMP
   000103         010600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC1034.2
   000104         010700     02 FILLER                     PIC X(94)    VALUE SPACE.      IC1034.2 IMP
   000105         010800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC1034.2 IMP
   000106         010900 01  REC-CT                        PIC 99       VALUE ZERO.       IC1034.2 IMP
   000107         011000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC1034.2 IMP
   000108         011100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC1034.2 IMP
   000109         011200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC1034.2 IMP
   000110         011300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC1034.2 IMP
   000111         011400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC1034.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC1034.2 IMP
   000113         011600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC1034.2 IMP
   000114         011700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC1034.2 IMP
   000115         011800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC1034.2 IMP
   000116         011900 01  CCVS-H-1.                                                    IC1034.2
   000117         012000     02  FILLER                    PIC X(39)    VALUE SPACES.     IC1034.2 IMP
   000118         012100     02  FILLER                    PIC X(42)    VALUE             IC1034.2
   000119         012200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC1034.2
   000120         012300     02  FILLER                    PIC X(39)    VALUE SPACES.     IC1034.2 IMP
   000121         012400 01  CCVS-H-2A.                                                   IC1034.2
   000122         012500   02  FILLER                        PIC X(40)  VALUE SPACE.      IC1034.2 IMP
   000123         012600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC1034.2
   000124         012700   02  FILLER                        PIC XXXX   VALUE             IC1034.2
   000125         012800     "4.2 ".                                                      IC1034.2
   000126         012900   02  FILLER                        PIC X(28)  VALUE             IC1034.2
   000127         013000            " COPY - NOT FOR DISTRIBUTION".                       IC1034.2
   000128         013100   02  FILLER                        PIC X(41)  VALUE SPACE.      IC1034.2 IMP
   000129         013200                                                                  IC1034.2
   000130         013300 01  CCVS-H-2B.                                                   IC1034.2
   000131         013400   02  FILLER                        PIC X(15)  VALUE             IC1034.2
   000132         013500            "TEST RESULT OF ".                                    IC1034.2
   000133         013600   02  TEST-ID                       PIC X(9).                    IC1034.2
   000134         013700   02  FILLER                        PIC X(4)   VALUE             IC1034.2
   000135         013800            " IN ".                                               IC1034.2
   000136         013900   02  FILLER                        PIC X(12)  VALUE             IC1034.2
   000137         014000     " HIGH       ".                                              IC1034.2
   000138         014100   02  FILLER                        PIC X(22)  VALUE             IC1034.2
   000139         014200            " LEVEL VALIDATION FOR ".                             IC1034.2
   000140         014300   02  FILLER                        PIC X(58)  VALUE             IC1034.2
   000141         014400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1034.2
   000142         014500 01  CCVS-H-3.                                                    IC1034.2
   000143         014600     02  FILLER                      PIC X(34)  VALUE             IC1034.2
   000144         014700            " FOR OFFICIAL USE ONLY    ".                         IC1034.2
   000145         014800     02  FILLER                      PIC X(58)  VALUE             IC1034.2
   000146         014900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1034.2
   000147         015000     02  FILLER                      PIC X(28)  VALUE             IC1034.2
   000148         015100            "  COPYRIGHT   1985 ".                                IC1034.2
   000149         015200 01  CCVS-E-1.                                                    IC1034.2
   000150         015300     02 FILLER                       PIC X(52)  VALUE SPACE.      IC1034.2 IMP
   000151         015400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC1034.2
   000152         015500     02 ID-AGAIN                     PIC X(9).                    IC1034.2
   000153         015600     02 FILLER                       PIC X(45)  VALUE SPACES.     IC1034.2 IMP
   000154         015700 01  CCVS-E-2.                                                    IC1034.2
   000155         015800     02  FILLER                      PIC X(31)  VALUE SPACE.      IC1034.2 IMP
   000156         015900     02  FILLER                      PIC X(21)  VALUE SPACE.      IC1034.2 IMP
   000157         016000     02 CCVS-E-2-2.                                               IC1034.2
   000158         016100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC1034.2 IMP
   000159         016200         03 FILLER                   PIC X      VALUE SPACE.      IC1034.2 IMP
   000160         016300         03 ENDER-DESC               PIC X(44)  VALUE             IC1034.2
   000161         016400            "ERRORS ENCOUNTERED".                                 IC1034.2
   000162         016500 01  CCVS-E-3.                                                    IC1034.2
   000163         016600     02  FILLER                      PIC X(22)  VALUE             IC1034.2
   000164         016700            " FOR OFFICIAL USE ONLY".                             IC1034.2
   000165         016800     02  FILLER                      PIC X(12)  VALUE SPACE.      IC1034.2 IMP
   000166         016900     02  FILLER                      PIC X(58)  VALUE             IC1034.2
   000167         017000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1034.2
   000168         017100     02  FILLER                      PIC X(13)  VALUE SPACE.      IC1034.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 FILLER                       PIC X(15)  VALUE             IC1034.2
   000170         017300             " COPYRIGHT 1985".                                   IC1034.2
   000171         017400 01  CCVS-E-4.                                                    IC1034.2
   000172         017500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC1034.2 IMP
   000173         017600     02 FILLER                       PIC X(4)   VALUE " OF ".     IC1034.2
   000174         017700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC1034.2 IMP
   000175         017800     02 FILLER                       PIC X(40)  VALUE             IC1034.2
   000176         017900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC1034.2
   000177         018000 01  XXINFO.                                                      IC1034.2
   000178         018100     02 FILLER                       PIC X(19)  VALUE             IC1034.2
   000179         018200            "*** INFORMATION ***".                                IC1034.2
   000180         018300     02 INFO-TEXT.                                                IC1034.2
   000181         018400       04 FILLER                     PIC X(8)   VALUE SPACE.      IC1034.2 IMP
   000182         018500       04 XXCOMPUTED                 PIC X(20).                   IC1034.2
   000183         018600       04 FILLER                     PIC X(5)   VALUE SPACE.      IC1034.2 IMP
   000184         018700       04 XXCORRECT                  PIC X(20).                   IC1034.2
   000185         018800     02 INF-ANSI-REFERENCE           PIC X(48).                   IC1034.2
   000186         018900 01  HYPHEN-LINE.                                                 IC1034.2
   000187         019000     02 FILLER  PIC IS X VALUE IS SPACE.                          IC1034.2 IMP
   000188         019100     02 FILLER  PIC IS X(65)    VALUE IS "************************IC1034.2
   000189         019200-    "*****************************************".                 IC1034.2
   000190         019300     02 FILLER  PIC IS X(54)    VALUE IS "************************IC1034.2
   000191         019400-    "******************************".                            IC1034.2
   000192         019500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC1034.2
   000193         019600     "IC103A".                                                    IC1034.2
   000194         019700 PROCEDURE DIVISION.                                              IC1034.2
   000195         019800 CCVS1 SECTION.                                                   IC1034.2
   000196         019900 OPEN-FILES.                                                      IC1034.2
   000197         020000     OPEN     OUTPUT PRINT-FILE.                                  IC1034.2 38
   000198         020100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC1034.2 192 133 192 152
   000199         020200     MOVE    SPACE TO TEST-RESULTS.                               IC1034.2 IMP 53
   000200         020300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC1034.2 225 230
   000201         020400     GO TO CCVS1-EXIT.                                            IC1034.2 307
   000202         020500 CLOSE-FILES.                                                     IC1034.2
   000203         020600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC1034.2 234 255 38
   000204         020700 TERMINATE-CCVS.                                                  IC1034.2
   000205         020800     EXIT PROGRAM.                                                IC1034.2
   000206         020900 TERMINATE-CALL.                                                  IC1034.2
   000207         021000     STOP     RUN.                                                IC1034.2
   000208         021100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC1034.2 57 109
   000209         021200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC1034.2 57 110
   000210         021300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC1034.2 57 108
   000211         021400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC1034.2 57 107
   000212         021500     MOVE "****TEST DELETED****" TO RE-MARK.                      IC1034.2 64
   000213         021600 PRINT-DETAIL.                                                    IC1034.2
   000214         021700     IF REC-CT NOT EQUAL TO ZERO                                  IC1034.2 106 IMP
   000215      1  021800             MOVE "." TO PARDOT-X                                 IC1034.2 61
   000216      1  021900             MOVE REC-CT TO DOTVALUE.                             IC1034.2 106 62
   000217         022000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC1034.2 53 39 267
   000218         022100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC1034.2 57 267
   000219      1  022200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC1034.2 284 297
   000220      1  022300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC1034.2 298 306
   000221         022400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC1034.2 IMP 57 IMP 69
   000222         022500     MOVE SPACE TO CORRECT-X.                                     IC1034.2 IMP 83
   000223         022600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC1034.2 106 IMP IMP 59
   000224         022700     MOVE     SPACE TO RE-MARK.                                   IC1034.2 IMP 64
   000225         022800 HEAD-ROUTINE.                                                    IC1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC1034.2 116 40 267
   000227         023000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC1034.2 121 40 267
   000228         023100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC1034.2 130 40 267
   000229         023200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC1034.2 142 40 267
   000230         023300 COLUMN-NAMES-ROUTINE.                                            IC1034.2
   000231         023400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1034.2 94 40 267
   000232         023500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1034.2 99 40 267
   000233         023600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC1034.2 186 40 267
   000234         023700 END-ROUTINE.                                                     IC1034.2
   000235         023800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC1034.2 186 40 267
   000236         023900 END-RTN-EXIT.                                                    IC1034.2
   000237         024000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1034.2 149 40 267
   000238         024100 END-ROUTINE-1.                                                   IC1034.2
   000239         024200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC1034.2 108 112 109
   000240         024300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC1034.2 112 107 112
   000241         024400      ADD PASS-COUNTER TO ERROR-HOLD.                             IC1034.2 110 112
   000242         024500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC1034.2
   000243         024600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC1034.2 110 172
   000244         024700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC1034.2 112 174
   000245         024800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC1034.2 171 157
   000246         024900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC1034.2 154 40 267
   000247         025000  END-ROUTINE-12.                                                 IC1034.2
   000248         025100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC1034.2 160
   000249         025200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC1034.2 108 IMP
   000250      1  025300         MOVE "NO " TO ERROR-TOTAL                                IC1034.2 158
   000251         025400         ELSE                                                     IC1034.2
   000252      1  025500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC1034.2 108 158
   000253         025600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC1034.2 154 40
   000254         025700     PERFORM WRITE-LINE.                                          IC1034.2 267
   000255         025800 END-ROUTINE-13.                                                  IC1034.2
   000256         025900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC1034.2 107 IMP
   000257      1  026000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC1034.2 158
   000258      1  026100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC1034.2 107 158
   000259         026200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC1034.2 160
   000260         026300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1034.2 154 40 267
   000261         026400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC1034.2 109 IMP
   000262      1  026500          MOVE "NO " TO ERROR-TOTAL                               IC1034.2 158
   000263      1  026600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC1034.2 109 158
   000264         026700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC1034.2 160
   000265         026800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC1034.2 154 40 267
   000266         026900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1034.2 162 40 267
   000267         027000 WRITE-LINE.                                                      IC1034.2
   000268         027100     ADD 1 TO RECORD-COUNT.                                       IC1034.2 114
   000269         027200     IF RECORD-COUNT GREATER 50                                   IC1034.2 114
   000270      1  027300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC1034.2 40 113
   000271      1  027400         MOVE SPACE TO DUMMY-RECORD                               IC1034.2 IMP 40
   000272      1  027500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC1034.2 40
   000273      1  027600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC1034.2 94 40 279
   000274      1  027700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC1034.2 99 40 279
   000275      1  027800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC1034.2 186 40 279
   000276      1  027900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC1034.2 113 40
   000277      1  028000         MOVE ZERO TO RECORD-COUNT.                               IC1034.2 IMP 114
   000278         028100     PERFORM WRT-LN.                                              IC1034.2 279
   000279         028200 WRT-LN.                                                          IC1034.2
   000280         028300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC1034.2 40
   000281         028400     MOVE SPACE TO DUMMY-RECORD.                                  IC1034.2 IMP 40
   000282         028500 BLANK-LINE-PRINT.                                                IC1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     PERFORM WRT-LN.                                              IC1034.2 279
   000284         028700 FAIL-ROUTINE.                                                    IC1034.2
   000285         028800     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC1034.2 69 IMP 292
   000286         028900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC1034.2 83 IMP 292
   000287         029000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC1034.2 115 185
   000288         029100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC1034.2 180
   000289         029200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1034.2 177 40 267
   000290         029300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC1034.2 IMP 185
   000291         029400     GO TO  FAIL-ROUTINE-EX.                                      IC1034.2 297
   000292         029500 FAIL-ROUTINE-WRITE.                                              IC1034.2
   000293         029600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC1034.2 65 39 267
   000294         029700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC1034.2 115 93
   000295         029800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC1034.2 80 39 267
   000296         029900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC1034.2 IMP 93
   000297         030000 FAIL-ROUTINE-EX. EXIT.                                           IC1034.2
   000298         030100 BAIL-OUT.                                                        IC1034.2
   000299         030200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC1034.2 70 IMP 301
   000300         030300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC1034.2 84 IMP 306
   000301         030400 BAIL-OUT-WRITE.                                                  IC1034.2
   000302         030500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC1034.2 84 184 70 182
   000303         030600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC1034.2 115 185
   000304         030700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1034.2 177 40 267
   000305         030800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC1034.2 IMP 185
   000306         030900 BAIL-OUT-EX. EXIT.                                               IC1034.2
   000307         031000 CCVS1-EXIT.                                                      IC1034.2
   000308         031100     EXIT.                                                        IC1034.2
   000309         031200 SECT-IC103-0001 SECTION.                                         IC1034.2
   000310         031300*        THE TESTS IN THIS SECTION CALL A SUBPROGRAM WHICH        IC1034.2
   000311         031400*    HAS FOUR EXIT PROGRAM STATEMENTS.  A DIFFERENT EXIT IS       IC1034.2
   000312         031500*    TAKEN FOR EACH CALL TO THE SUBPROGRAM.                       IC1034.2
   000313         031600 EXIT-INIT.                                                       IC1034.2
   000314         031700     MOVE "MULTIPLE EXIT PROGRM" TO FEATURE.                      IC1034.2 55
   000315         031800 EXIT-INIT-001.                                                   IC1034.2
   000316         031900     MOVE 0 TO MAIN-DN2.                                          IC1034.2 43
   000317         032000     MOVE 1 TO MAIN-DN1.                                          IC1034.2 42
   000318         032100 EXIT-TEST-001.                                                   IC1034.2
   000319         032200     CALL "IC105A" USING MAIN-DN1 MAIN-DN2.                       IC1034.2 EXT 42 43
   000320         032300     IF MAIN-DN2 EQUAL TO 1                                       IC1034.2 43
   000321      1  032400         PERFORM PASS                                             IC1034.2 209
   000322      1  032500         GO TO EXIT-WRITE-001.                                    IC1034.2 328
   000323         032600 EXIT-FAIL-001.                                                   IC1034.2
   000324         032700     MOVE MAIN-DN1 TO CORRECT-18V0.                               IC1034.2 42 90
   000325         032800     MOVE MAIN-DN2 TO COMPUTED-18V0.                              IC1034.2 43 77
   000326         032900     MOVE "FIRST EXIT FROM SUBPROGRAM" TO RE-MARK.                IC1034.2 64
   000327         033000     PERFORM FAIL.                                                IC1034.2 210
   000328         033100 EXIT-WRITE-001.                                                  IC1034.2
   000329         033200     MOVE "EXIT-TEST-01" TO PAR-NAME.                             IC1034.2 59
   000330         033300     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000331         033400 EXIT-INIT-002.                                                   IC1034.2
   000332         033500     MOVE 0 TO MAIN-DN2.                                          IC1034.2 43
   000333         033600     MOVE 2 TO MAIN-DN1.                                          IC1034.2 42
   000334         033700 EXIT-TEST-002.                                                   IC1034.2
   000335         033800     CALL "IC105A" USING MAIN-DN1 MAIN-DN2.                       IC1034.2 EXT 42 43
   000336         033900     IF MAIN-DN2 EQUAL TO 2                                       IC1034.2 43
   000337      1  034000          PERFORM PASS                                            IC1034.2 209
   000338      1  034100          GO TO EXIT-WRITE-002.                                   IC1034.2 344
   000339         034200 EXIT-FAIL-002.                                                   IC1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE MAIN-DN1 TO CORRECT-18V0.                               IC1034.2 42 90
   000341         034400     MOVE MAIN-DN2 TO COMPUTED-18V0.                              IC1034.2 43 77
   000342         034500     MOVE "SECOND EXIT FROM SUBPROGRAM" TO RE-MARK.               IC1034.2 64
   000343         034600     PERFORM FAIL.                                                IC1034.2 210
   000344         034700 EXIT-WRITE-002.                                                  IC1034.2
   000345         034800     MOVE "EXIT-TEST-02" TO PAR-NAME.                             IC1034.2 59
   000346         034900     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000347         035000 EXIT-INIT-003.                                                   IC1034.2
   000348         035100     MOVE 0 TO MAIN-DN2.                                          IC1034.2 43
   000349         035200     MOVE 3 TO MAIN-DN1.                                          IC1034.2 42
   000350         035300 EXIT-TEST-003.                                                   IC1034.2
   000351         035400     CALL "IC105A" USING MAIN-DN1 MAIN-DN2.                       IC1034.2 EXT 42 43
   000352         035500     IF MAIN-DN2 NOT EQUAL TO 3                                   IC1034.2 43
   000353      1  035600         GO TO EXIT-FAIL-003.                                     IC1034.2 356
   000354         035700     PERFORM PASS.                                                IC1034.2 209
   000355         035800     GO TO EXIT-WRITE-003.                                        IC1034.2 361
   000356         035900 EXIT-FAIL-003.                                                   IC1034.2
   000357         036000     MOVE MAIN-DN1 TO CORRECT-18V0.                               IC1034.2 42 90
   000358         036100     MOVE MAIN-DN2 TO COMPUTED-18V0.                              IC1034.2 43 77
   000359         036200     MOVE "THIRD EXIT FROM SUBPROGRAM" TO RE-MARK.                IC1034.2 64
   000360         036300     PERFORM FAIL.                                                IC1034.2 210
   000361         036400 EXIT-WRITE-003.                                                  IC1034.2
   000362         036500     MOVE "EXIT-TEST-03" TO PAR-NAME.                             IC1034.2 59
   000363         036600     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000364         036700 EXIT-INIT-004.                                                   IC1034.2
   000365         036800     MOVE 0 TO MAIN-DN2.                                          IC1034.2 43
   000366         036900     MOVE 4 TO MAIN-DN1.                                          IC1034.2 42
   000367         037000 EXIT-TEST-004.                                                   IC1034.2
   000368         037100     CALL "IC105A" USING MAIN-DN1 MAIN-DN2.                       IC1034.2 EXT 42 43
   000369         037200     IF MAIN-DN2 NOT EQUAL TO 4                                   IC1034.2 43
   000370      1  037300         GO TO EXIT-FAIL-004.                                     IC1034.2 373
   000371         037400     PERFORM PASS.                                                IC1034.2 209
   000372         037500     GO TO EXIT-WRITE-004.                                        IC1034.2 378
   000373         037600 EXIT-FAIL-004.                                                   IC1034.2
   000374         037700     MOVE MAIN-DN1 TO CORRECT-18V0.                               IC1034.2 42 90
   000375         037800     MOVE MAIN-DN2 TO COMPUTED-18V0.                              IC1034.2 43 77
   000376         037900     MOVE "FOURTH EXIT FROM SUBPROGRAM" TO RE-MARK.               IC1034.2 64
   000377         038000     PERFORM FAIL.                                                IC1034.2 210
   000378         038100 EXIT-WRITE-004.                                                  IC1034.2
   000379         038200     MOVE "EXIT-TEST-04" TO PAR-NAME.                             IC1034.2 59
   000380         038300     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000381         038400     GO TO SECT-IC103-0002.                                       IC1034.2 398
   000382         038500 EXIT-DELETES.                                                    IC1034.2
   000383         038600*        IF THE SUBPROGRAM WITH MULTIPLE EXIT PROGRAM             IC1034.2
   000384         038700*    STATEMENTS CANNOT BE INCLUDED IN THE RUN UNIT                IC1034.2
   000385         038800*    DELETE PARAGRAPH EXIT-INIT-001 THRU EXIT-WRITE-004.          IC1034.2
   000386         038900     PERFORM DE-LETE.                                             IC1034.2 211
   000387         039000     MOVE "EXIT-TEST-01" TO PAR-NAME.                             IC1034.2 59
   000388         039100     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000389         039200     PERFORM DE-LETE.                                             IC1034.2 211
   000390         039300     MOVE "EXIT-TEST-02" TO PAR-NAME.                             IC1034.2 59
   000391         039400     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000392         039500     PERFORM DE-LETE.                                             IC1034.2 211
   000393         039600     MOVE "EXIT-TEST-03" TO PAR-NAME.                             IC1034.2 59
   000394         039700     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000395         039800     PERFORM DE-LETE.                                             IC1034.2 211
   000396         039900     MOVE "EXIT-TEST-04" TO PAR-NAME.                             IC1034.2 59
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000398         040100 SECT-IC103-0002 SECTION.                                         IC1034.2
   000399         040200*        THIS SECTION CALLS A SUBPROGRAM WITH TWO GROUP ITEMS     IC1034.2
   000400         040300*    AND ONE ELEMENTARY ITEM IN THE USING PHRASE. THE ITEM        IC1034.2
   000401         040400*    DESCRIPTIONS ARE DIFFERENT IN THE SUBPROGRAM FROM THE MAIN   IC1034.2
   000402         040500*    PROGRAM, BUT THE NUMBER OF CHARACTERS IS IDENTICAL.          IC1034.2
   000403         040600*    REFERENCE  X3.23-1974,  SECTION XII, 3.1 AND 3.2.            IC1034.2
   000404         040700 CALL-INIT-06.                                                    IC1034.2
   000405         040800     MOVE "CALL-TEST-06" TO PAR-NAME.                             IC1034.2 59
   000406         040900     MOVE 0 TO NUMER-FIELD  ELEM-77 NUM-ITEM.                     IC1034.2 48 44 51
   000407         041000     MOVE SPACE TO ALPHA-NUM-FIELD ALPHA-FIELD ALPHA-EDITED.      IC1034.2 IMP 46 49 52
   000408         041100     MOVE "CALL USING DN SERIES" TO FEATURE.                      IC1034.2 55
   000409         041200 CALL-TEST-06.                                                    IC1034.2
   000410         041300     CALL "IC104A" USING GROUP-01 ELEM-77 GROUP-02.               IC1034.2 EXT 45 44 50
   000411         041400     GO TO CALL-TEST-06-01.                                       IC1034.2 418
   000412         041500 CALL-DELETE-06.                                                  IC1034.2
   000413         041600     PERFORM DE-LETE.                                             IC1034.2 211
   000414         041700     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000415         041800     GO TO CCVS-EXIT.                                             IC1034.2 492
   000416         041900*       IF IC104 CANNOT BE INCLUDED IN THE RUN UNIT               IC1034.2
   000417         042000*    DELETE THE PARAGRAPH CALL-TEST-06.                           IC1034.2
   000418         042100 CALL-TEST-06-01.                                                 IC1034.2
   000419         042200     IF ALPHA-NUM-FIELD NOT EQUAL TO "IC104"                      IC1034.2 46
   000420      1  042300         GO TO CALL-FAIL-06-01.                                   IC1034.2 423
   000421         042400     PERFORM PASS.                                                IC1034.2 209
   000422         042500     GO TO CALL-WRITE-06-01.                                      IC1034.2 428
   000423         042600 CALL-FAIL-06-01.                                                 IC1034.2
   000424         042700     MOVE ALPHA-NUM-FIELD TO COMPUTED-A.                          IC1034.2 46 70
   000425         042800     MOVE "IC104" TO CORRECT-A.                                   IC1034.2 84
   000426         042900     PERFORM FAIL.                                                IC1034.2 210
   000427         043000     MOVE "ALPHANUMERIC PARAMETER" TO RE-MARK.                    IC1034.2 64
   000428         043100 CALL-WRITE-06-01.                                                IC1034.2
   000429         043200     ADD 1 TO REC-CT.                                             IC1034.2 106
   000430         043300     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000431         043400 CALL-TEST-06-02.                                                 IC1034.2
   000432         043500     IF NUMER-FIELD EQUAL TO 25                                   IC1034.2 48
   000433      1  043600         PERFORM PASS                                             IC1034.2 209
   000434      1  043700         GO TO CALL-WRITE-06-02.                                  IC1034.2 440
   000435         043800 CALL-FAIL-06-02.                                                 IC1034.2
   000436         043900     PERFORM FAIL.                                                IC1034.2 210
   000437         044000     MOVE NUMER-FIELD TO COMPUTED-18V0.                           IC1034.2 48 77
   000438         044100     MOVE 25 TO CORRECT-18V0.                                     IC1034.2 90
   000439         044200     MOVE "NUMERIC DISPLAY PARAMETER" TO RE-MARK.                 IC1034.2 64
   000440         044300 CALL-WRITE-06-02.                                                IC1034.2
   000441         044400     ADD 1 TO REC-CT.                                             IC1034.2 106
   000442         044500     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000443         044600 CALL-TEST-06-03.                                                 IC1034.2
   000444         044700     IF ALPHA-FIELD EQUAL TO "YES"                                IC1034.2 49
   000445      1  044800         PERFORM PASS                                             IC1034.2 209
   000446      1  044900         GO TO CALL-WRITE-06-03.                                  IC1034.2 452
   000447         045000 CALL-FAIL-06-03.                                                 IC1034.2
   000448         045100     PERFORM FAIL.                                                IC1034.2 210
   000449         045200     MOVE ALPHA-FIELD TO COMPUTED-A.                              IC1034.2 49 70
   000450         045300     MOVE "YES" TO CORRECT-A.                                     IC1034.2 84
   000451         045400     MOVE "ALPHABETIC PARAMETER" TO RE-MARK.                      IC1034.2 64
   000452         045500 CALL-WRITE-06-03.                                                IC1034.2
   000453         045600     ADD 1 TO REC-CT.                                             IC1034.2 106
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000455         045800 CALL-TEST-06-04.                                                 IC1034.2
   000456         045900     IF ELEM-77 EQUAL TO 0.7654                                   IC1034.2 44
   000457      1  046000         PERFORM PASS                                             IC1034.2 209
   000458      1  046100         GO TO CALL-WRITE-06-04.                                  IC1034.2 464
   000459         046200 CALL-FAIL-06-04.                                                 IC1034.2
   000460         046300     PERFORM FAIL.                                                IC1034.2 210
   000461         046400     MOVE ELEM-77 TO COMPUTED-4V14.                               IC1034.2 44 74
   000462         046500     MOVE 0.7654 TO CORRECT-4V14.                                 IC1034.2 87
   000463         046600     MOVE "COMPUTATIONAL PARAMETER" TO RE-MARK.                   IC1034.2 64
   000464         046700 CALL-WRITE-06-04.                                                IC1034.2
   000465         046800     ADD 1 TO REC-CT.                                             IC1034.2 106
   000466         046900     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000467         047000 CALL-TEST-06-05.                                                 IC1034.2
   000468         047100     IF NUM-ITEM EQUAL TO 25                                      IC1034.2 51
   000469      1  047200         PERFORM PASS                                             IC1034.2 209
   000470      1  047300         GO TO CALL-WRITE-06-05.                                  IC1034.2 476
   000471         047400 CALL-FAIL-06-05.                                                 IC1034.2
   000472         047500     PERFORM FAIL.                                                IC1034.2 210
   000473         047600     MOVE NUM-ITEM TO COMPUTED-18V0.                              IC1034.2 51 77
   000474         047700     MOVE 25 TO CORRECT-18V0.                                     IC1034.2 90
   000475         047800     MOVE "SIGNED NUMERIC PARAMETER" TO RE-MARK.                  IC1034.2 64
   000476         047900 CALL-WRITE-06-05.                                                IC1034.2
   000477         048000     ADD 1 TO REC-CT.                                             IC1034.2 106
   000478         048100     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000479         048200 CALL-TEST-06-06.                                                 IC1034.2
   000480         048300     IF ALPHA-EDITED EQUAL TO "AB C0D"                            IC1034.2 52
   000481      1  048400         PERFORM PASS                                             IC1034.2 209
   000482      1  048500         GO TO CALL-WRITE-06-06.                                  IC1034.2 488
   000483         048600 CALL-FAIL-06-06.                                                 IC1034.2
   000484         048700     PERFORM FAIL.                                                IC1034.2 210
   000485         048800     MOVE ALPHA-EDITED TO COMPUTED-A.                             IC1034.2 52 70
   000486         048900     MOVE "AB C0D" TO CORRECT-A.                                  IC1034.2 84
   000487         049000     MOVE "ALPHANUMERIC EDITED" TO RE-MARK.                       IC1034.2 64
   000488         049100 CALL-WRITE-06-06.                                                IC1034.2
   000489         049200     ADD 1 TO REC-CT.                                             IC1034.2 106
   000490         049300     PERFORM PRINT-DETAIL.                                        IC1034.2 213
   000491         049400     GO TO CCVS-EXIT.                                             IC1034.2 492
   000492         049500 CCVS-EXIT SECTION.                                               IC1034.2
   000493         049600 CCVS-999999.                                                     IC1034.2
   000494         049700     GO TO CLOSE-FILES.                                           IC1034.2 202
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       52   ALPHA-EDITED . . . . . . . . .  M407 480 485
       49   ALPHA-FIELD. . . . . . . . . .  M407 444 449
       46   ALPHA-NUM-FIELD. . . . . . . .  M407 419 424
      115   ANSI-REFERENCE . . . . . . . .  287 294 303
       94   CCVS-C-1 . . . . . . . . . . .  231 273
       99   CCVS-C-2 . . . . . . . . . . .  232 274
      149   CCVS-E-1 . . . . . . . . . . .  237
      154   CCVS-E-2 . . . . . . . . . . .  246 253 260 265
      157   CCVS-E-2-2 . . . . . . . . . .  M245
      162   CCVS-E-3 . . . . . . . . . . .  266
      171   CCVS-E-4 . . . . . . . . . . .  245
      172   CCVS-E-4-1 . . . . . . . . . .  M243
      174   CCVS-E-4-2 . . . . . . . . . .  M244
      116   CCVS-H-1 . . . . . . . . . . .  226
      121   CCVS-H-2A. . . . . . . . . . .  227
      130   CCVS-H-2B. . . . . . . . . . .  228
      142   CCVS-H-3 . . . . . . . . . . .  229
      192   CCVS-PGM-ID. . . . . . . . . .  198 198
       76   CM-18V0
       70   COMPUTED-A . . . . . . . . . .  71 73 74 75 76 299 302 M424 M449 M485
       71   COMPUTED-N
       69   COMPUTED-X . . . . . . . . . .  M221 285
       73   COMPUTED-0V18
       75   COMPUTED-14V4
       77   COMPUTED-18V0. . . . . . . . .  M325 M341 M358 M375 M437 M473
       74   COMPUTED-4V14. . . . . . . . .  M461
       93   COR-ANSI-REFERENCE . . . . . .  M294 M296
       84   CORRECT-A. . . . . . . . . . .  85 86 87 88 89 300 302 M425 M450 M486
       85   CORRECT-N
       83   CORRECT-X. . . . . . . . . . .  M222 286
       86   CORRECT-0V18
       88   CORRECT-14V4
       90   CORRECT-18V0 . . . . . . . . .  M324 M340 M357 M374 M438 M474
       87   CORRECT-4V14 . . . . . . . . .  M462
       89   CR-18V0
      107   DELETE-COUNTER . . . . . . . .  M211 240 256 258
       62   DOTVALUE . . . . . . . . . . .  M216
      113   DUMMY-HOLD . . . . . . . . . .  M270 276
       40   DUMMY-RECORD . . . . . . . . .  M226 M227 M228 M229 M231 M232 M233 M235 M237 M246 M253 M260 M265 M266 270 M271
                                            272 M273 M274 M275 M276 280 M281 M289 M304
       44   ELEM-77. . . . . . . . . . . .  M406 410 456 461
      160   ENDER-DESC . . . . . . . . . .  M248 M259 M264
      108   ERROR-COUNTER. . . . . . . . .  M210 239 249 252
      112   ERROR-HOLD . . . . . . . . . .  M239 M240 M240 M241 244
      158   ERROR-TOTAL. . . . . . . . . .  M250 M252 M257 M258 M262 M263
       55   FEATURE. . . . . . . . . . . .  M314 M408
       47   GROUP-LEV2
       45   GROUP-01 . . . . . . . . . . .  410
       50   GROUP-02 . . . . . . . . . . .  410
      186   HYPHEN-LINE. . . . . . . . . .  233 235 275
      152   ID-AGAIN . . . . . . . . . . .  M198
      185   INF-ANSI-REFERENCE . . . . . .  M287 M290 M303 M305
      180   INFO-TEXT. . . . . . . . . . .  M288
      109   INSPECT-COUNTER. . . . . . . .  M208 239 261 263
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page    13
0 Defined   Cross-reference of data names   References

0      42   MAIN-DN1 . . . . . . . . . . .  M317 319 324 M333 335 340 M349 351 357 M366 368 374
       43   MAIN-DN2 . . . . . . . . . . .  M316 319 320 325 M332 335 336 341 M348 351 352 358 M365 368 369 375
       51   NUM-ITEM . . . . . . . . . . .  M406 468 473
       48   NUMER-FIELD. . . . . . . . . .  M406 432 437
       57   P-OR-F . . . . . . . . . . . .  M208 M209 M210 M211 218 M221
       59   PAR-NAME . . . . . . . . . . .  M223 M329 M345 M362 M379 M387 M390 M393 M396 M405
       61   PARDOT-X . . . . . . . . . . .  M215
      110   PASS-COUNTER . . . . . . . . .  M209 241 243
       38   PRINT-FILE . . . . . . . . . .  34 197 203
       39   PRINT-REC. . . . . . . . . . .  M217 M293 M295
       64   RE-MARK. . . . . . . . . . . .  M212 M224 M326 M342 M359 M376 M427 M439 M451 M463 M475 M487
      106   REC-CT . . . . . . . . . . . .  214 216 223 M429 M441 M453 M465 M477 M489
      105   REC-SKL-SUB
      114   RECORD-COUNT . . . . . . . . .  M268 269 M277
       65   TEST-COMPUTED. . . . . . . . .  293
       80   TEST-CORRECT . . . . . . . . .  295
      133   TEST-ID. . . . . . . . . . . .  M198
       53   TEST-RESULTS . . . . . . . . .  M199 217
      111   TOTAL-ERROR
      182   XXCOMPUTED . . . . . . . . . .  M302
      184   XXCORRECT. . . . . . . . . . .  M302
      177   XXINFO . . . . . . . . . . . .  289 304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page    14
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

      298   BAIL-OUT . . . . . . . . . . .  P220
      306   BAIL-OUT-EX. . . . . . . . . .  E220 G300
      301   BAIL-OUT-WRITE . . . . . . . .  G299
      282   BLANK-LINE-PRINT
      412   CALL-DELETE-06
      423   CALL-FAIL-06-01. . . . . . . .  G420
      435   CALL-FAIL-06-02
      447   CALL-FAIL-06-03
      459   CALL-FAIL-06-04
      471   CALL-FAIL-06-05
      483   CALL-FAIL-06-06
      404   CALL-INIT-06
      409   CALL-TEST-06
      418   CALL-TEST-06-01. . . . . . . .  G411
      431   CALL-TEST-06-02
      443   CALL-TEST-06-03
      455   CALL-TEST-06-04
      467   CALL-TEST-06-05
      479   CALL-TEST-06-06
      428   CALL-WRITE-06-01 . . . . . . .  G422
      440   CALL-WRITE-06-02 . . . . . . .  G434
      452   CALL-WRITE-06-03 . . . . . . .  G446
      464   CALL-WRITE-06-04 . . . . . . .  G458
      476   CALL-WRITE-06-05 . . . . . . .  G470
      488   CALL-WRITE-06-06 . . . . . . .  G482
      492   CCVS-EXIT. . . . . . . . . . .  G415 G491
      493   CCVS-999999
      195   CCVS1
      307   CCVS1-EXIT . . . . . . . . . .  G201
      202   CLOSE-FILES. . . . . . . . . .  G494
      230   COLUMN-NAMES-ROUTINE . . . . .  E200
      211   DE-LETE. . . . . . . . . . . .  P386 P389 P392 P395 P413
      234   END-ROUTINE. . . . . . . . . .  P203
      238   END-ROUTINE-1
      247   END-ROUTINE-12
      255   END-ROUTINE-13 . . . . . . . .  E203
      236   END-RTN-EXIT
      382   EXIT-DELETES
      323   EXIT-FAIL-001
      339   EXIT-FAIL-002
      356   EXIT-FAIL-003. . . . . . . . .  G353
      373   EXIT-FAIL-004. . . . . . . . .  G370
      313   EXIT-INIT
      315   EXIT-INIT-001
      331   EXIT-INIT-002
      347   EXIT-INIT-003
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page    15
0 Defined   Cross-reference of procedures   References

0     364   EXIT-INIT-004
      318   EXIT-TEST-001
      334   EXIT-TEST-002
      350   EXIT-TEST-003
      367   EXIT-TEST-004
      328   EXIT-WRITE-001 . . . . . . . .  G322
      344   EXIT-WRITE-002 . . . . . . . .  G338
      361   EXIT-WRITE-003 . . . . . . . .  G355
      378   EXIT-WRITE-004 . . . . . . . .  G372
      210   FAIL . . . . . . . . . . . . .  P327 P343 P360 P377 P426 P436 P448 P460 P472 P484
      284   FAIL-ROUTINE . . . . . . . . .  P219
      297   FAIL-ROUTINE-EX. . . . . . . .  E219 G291
      292   FAIL-ROUTINE-WRITE . . . . . .  G285 G286
      225   HEAD-ROUTINE . . . . . . . . .  P200
      208   INSPT
      196   OPEN-FILES
      209   PASS . . . . . . . . . . . . .  P321 P337 P354 P371 P421 P433 P445 P457 P469 P481
      213   PRINT-DETAIL . . . . . . . . .  P330 P346 P363 P380 P388 P391 P394 P397 P414 P430 P442 P454 P466 P478 P490
      309   SECT-IC103-0001
      398   SECT-IC103-0002. . . . . . . .  G381
      206   TERMINATE-CALL
      204   TERMINATE-CCVS
      267   WRITE-LINE . . . . . . . . . .  P217 P218 P226 P227 P228 P229 P231 P232 P233 P235 P237 P246 P254 P260 P265 P266
                                            P289 P293 P295 P304
      279   WRT-LN . . . . . . . . . . . .  P273 P274 P275 P278 P283
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page    16
0 Defined   Cross-reference of programs     References

        3   IC103A
 EXTERNAL   IC104A . . . . . . . . . . . .  410
 EXTERNAL   IC105A . . . . . . . . . . . .  319 335 351 368
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC103A    Date 06/04/2022  Time 11:56:28   Page    17
0LineID  Message code  Message text

     38  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC103A:
 *    Source records = 494
 *    Data Division statements = 74
 *    Procedure Division statements = 257
 *    Generated COBOL statements = 0
 *    Program complexity factor = 264
0End of compilation 1,  program IC103A,  highest severity 0.
0Return code 0
