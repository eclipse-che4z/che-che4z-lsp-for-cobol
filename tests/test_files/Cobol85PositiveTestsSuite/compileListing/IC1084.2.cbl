1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:20   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:20   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1084.2
   000002         000200 PROGRAM-ID.                                                      IC1084.2
   000003         000300     IC108A.                                                      IC1084.2
   000004         000500*                                                              *  IC1084.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1084.2
   000006         000700*                                                              *  IC1084.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1084.2
   000008         000900*                                                              *  IC1084.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1084.2
   000010         001100*                                                              *  IC1084.2
   000011         001300*                                                              *  IC1084.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1084.2
   000013         001500*                                                              *  IC1084.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1084.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1084.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1084.2
   000017         001900*                                                              *  IC1084.2
   000018         002100*        THE PROGRAM IC108 IS THE MAIN PROGRAM WHICH STARTS       IC1084.2
   000019         002200*    A SEQUENCE OF CALLS TO THE SUBPROGRAMS IC109A,IC110A AND     IC1084.2
   000020         002300*    IC111A.  PARAMETERS ARE SET IN EACH OF THESE SUBPROGRAMS     IC1084.2
   000021         002400*    AND CHECKED WHEN CONTROL IS RETURNED TO THE MAIN PROGRAM.    IC1084.2
   000022         002500 ENVIRONMENT DIVISION.                                            IC1084.2
   000023         002600 CONFIGURATION SECTION.                                           IC1084.2
   000024         002700 SOURCE-COMPUTER.                                                 IC1084.2
   000025         002800     XXXXX082.                                                    IC1084.2
   000026         002900 OBJECT-COMPUTER.                                                 IC1084.2
   000027         003000     XXXXX083.                                                    IC1084.2
   000028         003100 INPUT-OUTPUT SECTION.                                            IC1084.2
   000029         003200 FILE-CONTROL.                                                    IC1084.2
   000030         003300     SELECT PRINT-FILE ASSIGN TO                                  IC1084.2 34
   000031         003400     XXXXX055.                                                    IC1084.2
   000032         003500 DATA DIVISION.                                                   IC1084.2
   000033         003600 FILE SECTION.                                                    IC1084.2
   000034         003700 FD  PRINT-FILE.                                                  IC1084.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003800 01  PRINT-REC PICTURE X(120).                                    IC1084.2
   000036         003900 01  DUMMY-RECORD PICTURE X(120).                                 IC1084.2
   000037         004000 WORKING-STORAGE SECTION.                                         IC1084.2
   000038         004100 01  GRP-01.                                                      IC1084.2
   000039         004200     02  SUB-CALLED.                                              IC1084.2
   000040         004300         03  DN1 PICTURE X(6).                                    IC1084.2
   000041         004400         03  DN2 PICTURE X(6).                                    IC1084.2
   000042         004500         03  DN3 PICTURE X(6).                                    IC1084.2
   000043         004600     02  TIMES-CALLED.                                            IC1084.2
   000044         004700         03  DN4 PICTURE S999    VALUE ZERO.                      IC1084.2 IMP
   000045         004800         03  DN5 PICTURE S999    VALUE ZERO.                      IC1084.2 IMP
   000046         004900         03  DN6 PICTURE S999    VALUE ZERO.                      IC1084.2 IMP
   000047         005000     02  SPECIAL-FLAGS.                                           IC1084.2
   000048         005100         03  DN7 PICTURE X.                                       IC1084.2
   000049         005200         03  DN8 PICTURE X.                                       IC1084.2
   000050         005300         03  DN9 PICTURE X.                                       IC1084.2
   000051         005400 01  TEST-RESULTS.                                                IC1084.2
   000052         005500     02 FILLER                   PIC X      VALUE SPACE.          IC1084.2 IMP
   000053         005600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC1084.2 IMP
   000054         005700     02 FILLER                   PIC X      VALUE SPACE.          IC1084.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC1084.2 IMP
   000056         005900     02 FILLER                   PIC X      VALUE SPACE.          IC1084.2 IMP
   000057         006000     02  PAR-NAME.                                                IC1084.2
   000058         006100       03 FILLER                 PIC X(19)  VALUE SPACE.          IC1084.2 IMP
   000059         006200       03  PARDOT-X              PIC X      VALUE SPACE.          IC1084.2 IMP
   000060         006300       03 DOTVALUE               PIC 99     VALUE ZERO.           IC1084.2 IMP
   000061         006400     02 FILLER                   PIC X(8)   VALUE SPACE.          IC1084.2 IMP
   000062         006500     02 RE-MARK                  PIC X(61).                       IC1084.2
   000063         006600 01  TEST-COMPUTED.                                               IC1084.2
   000064         006700     02 FILLER                   PIC X(30)  VALUE SPACE.          IC1084.2 IMP
   000065         006800     02 FILLER                   PIC X(17)  VALUE                 IC1084.2
   000066         006900            "       COMPUTED=".                                   IC1084.2
   000067         007000     02 COMPUTED-X.                                               IC1084.2
   000068         007100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC1084.2 IMP
   000069         007200     03 COMPUTED-N               REDEFINES COMPUTED-A             IC1084.2 68
   000070         007300                                 PIC -9(9).9(9).                  IC1084.2
   000071         007400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC1084.2 68
   000072         007500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC1084.2 68
   000073         007600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC1084.2 68
   000074         007700     03       CM-18V0 REDEFINES COMPUTED-A.                       IC1084.2 68
   000075         007800         04 COMPUTED-18V0                    PIC -9(18).          IC1084.2
   000076         007900         04 FILLER                           PIC X.               IC1084.2
   000077         008000     03 FILLER PIC X(50) VALUE SPACE.                             IC1084.2 IMP
   000078         008100 01  TEST-CORRECT.                                                IC1084.2
   000079         008200     02 FILLER PIC X(30) VALUE SPACE.                             IC1084.2 IMP
   000080         008300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC1084.2
   000081         008400     02 CORRECT-X.                                                IC1084.2
   000082         008500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC1084.2 IMP
   000083         008600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC1084.2 82
   000084         008700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC1084.2 82
   000085         008800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC1084.2 82
   000086         008900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC1084.2 82
   000087         009000     03      CR-18V0 REDEFINES CORRECT-A.                         IC1084.2 82
   000088         009100         04 CORRECT-18V0                     PIC -9(18).          IC1084.2
   000089         009200         04 FILLER                           PIC X.               IC1084.2
   000090         009300     03 FILLER PIC X(2) VALUE SPACE.                              IC1084.2 IMP
   000091         009400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC1084.2 IMP
   000092         009500 01  CCVS-C-1.                                                    IC1084.2
   000093         009600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC1084.2
   000094         009700-    "SS  PARAGRAPH-NAME                                          IC1084.2
   000095         009800-    "       REMARKS".                                            IC1084.2
   000096         009900     02 FILLER                     PIC X(20)    VALUE SPACE.      IC1084.2 IMP
   000097         010000 01  CCVS-C-2.                                                    IC1084.2
   000098         010100     02 FILLER                     PIC X        VALUE SPACE.      IC1084.2 IMP
   000099         010200     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC1084.2
   000100         010300     02 FILLER                     PIC X(15)    VALUE SPACE.      IC1084.2 IMP
   000101         010400     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC1084.2
   000102         010500     02 FILLER                     PIC X(94)    VALUE SPACE.      IC1084.2 IMP
   000103         010600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC1084.2 IMP
   000104         010700 01  REC-CT                        PIC 99       VALUE ZERO.       IC1084.2 IMP
   000105         010800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC1084.2 IMP
   000106         010900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC1084.2 IMP
   000107         011000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC1084.2 IMP
   000108         011100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC1084.2 IMP
   000109         011200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC1084.2 IMP
   000110         011300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC1084.2 IMP
   000111         011400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC1084.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC1084.2 IMP
   000113         011600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC1084.2 IMP
   000114         011700 01  CCVS-H-1.                                                    IC1084.2
   000115         011800     02  FILLER                    PIC X(39)    VALUE SPACES.     IC1084.2 IMP
   000116         011900     02  FILLER                    PIC X(42)    VALUE             IC1084.2
   000117         012000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC1084.2
   000118         012100     02  FILLER                    PIC X(39)    VALUE SPACES.     IC1084.2 IMP
   000119         012200 01  CCVS-H-2A.                                                   IC1084.2
   000120         012300   02  FILLER                        PIC X(40)  VALUE SPACE.      IC1084.2 IMP
   000121         012400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC1084.2
   000122         012500   02  FILLER                        PIC XXXX   VALUE             IC1084.2
   000123         012600     "4.2 ".                                                      IC1084.2
   000124         012700   02  FILLER                        PIC X(28)  VALUE             IC1084.2
   000125         012800            " COPY - NOT FOR DISTRIBUTION".                       IC1084.2
   000126         012900   02  FILLER                        PIC X(41)  VALUE SPACE.      IC1084.2 IMP
   000127         013000                                                                  IC1084.2
   000128         013100 01  CCVS-H-2B.                                                   IC1084.2
   000129         013200   02  FILLER                        PIC X(15)  VALUE             IC1084.2
   000130         013300            "TEST RESULT OF ".                                    IC1084.2
   000131         013400   02  TEST-ID                       PIC X(9).                    IC1084.2
   000132         013500   02  FILLER                        PIC X(4)   VALUE             IC1084.2
   000133         013600            " IN ".                                               IC1084.2
   000134         013700   02  FILLER                        PIC X(12)  VALUE             IC1084.2
   000135         013800     " HIGH       ".                                              IC1084.2
   000136         013900   02  FILLER                        PIC X(22)  VALUE             IC1084.2
   000137         014000            " LEVEL VALIDATION FOR ".                             IC1084.2
   000138         014100   02  FILLER                        PIC X(58)  VALUE             IC1084.2
   000139         014200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1084.2
   000140         014300 01  CCVS-H-3.                                                    IC1084.2
   000141         014400     02  FILLER                      PIC X(34)  VALUE             IC1084.2
   000142         014500            " FOR OFFICIAL USE ONLY    ".                         IC1084.2
   000143         014600     02  FILLER                      PIC X(58)  VALUE             IC1084.2
   000144         014700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1084.2
   000145         014800     02  FILLER                      PIC X(28)  VALUE             IC1084.2
   000146         014900            "  COPYRIGHT   1985 ".                                IC1084.2
   000147         015000 01  CCVS-E-1.                                                    IC1084.2
   000148         015100     02 FILLER                       PIC X(52)  VALUE SPACE.      IC1084.2 IMP
   000149         015200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC1084.2
   000150         015300     02 ID-AGAIN                     PIC X(9).                    IC1084.2
   000151         015400     02 FILLER                       PIC X(45)  VALUE SPACES.     IC1084.2 IMP
   000152         015500 01  CCVS-E-2.                                                    IC1084.2
   000153         015600     02  FILLER                      PIC X(31)  VALUE SPACE.      IC1084.2 IMP
   000154         015700     02  FILLER                      PIC X(21)  VALUE SPACE.      IC1084.2 IMP
   000155         015800     02 CCVS-E-2-2.                                               IC1084.2
   000156         015900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC1084.2 IMP
   000157         016000         03 FILLER                   PIC X      VALUE SPACE.      IC1084.2 IMP
   000158         016100         03 ENDER-DESC               PIC X(44)  VALUE             IC1084.2
   000159         016200            "ERRORS ENCOUNTERED".                                 IC1084.2
   000160         016300 01  CCVS-E-3.                                                    IC1084.2
   000161         016400     02  FILLER                      PIC X(22)  VALUE             IC1084.2
   000162         016500            " FOR OFFICIAL USE ONLY".                             IC1084.2
   000163         016600     02  FILLER                      PIC X(12)  VALUE SPACE.      IC1084.2 IMP
   000164         016700     02  FILLER                      PIC X(58)  VALUE             IC1084.2
   000165         016800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1084.2
   000166         016900     02  FILLER                      PIC X(13)  VALUE SPACE.      IC1084.2 IMP
   000167         017000     02 FILLER                       PIC X(15)  VALUE             IC1084.2
   000168         017100             " COPYRIGHT 1985".                                   IC1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  CCVS-E-4.                                                    IC1084.2
   000170         017300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC1084.2 IMP
   000171         017400     02 FILLER                       PIC X(4)   VALUE " OF ".     IC1084.2
   000172         017500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC1084.2 IMP
   000173         017600     02 FILLER                       PIC X(40)  VALUE             IC1084.2
   000174         017700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC1084.2
   000175         017800 01  XXINFO.                                                      IC1084.2
   000176         017900     02 FILLER                       PIC X(19)  VALUE             IC1084.2
   000177         018000            "*** INFORMATION ***".                                IC1084.2
   000178         018100     02 INFO-TEXT.                                                IC1084.2
   000179         018200       04 FILLER                     PIC X(8)   VALUE SPACE.      IC1084.2 IMP
   000180         018300       04 XXCOMPUTED                 PIC X(20).                   IC1084.2
   000181         018400       04 FILLER                     PIC X(5)   VALUE SPACE.      IC1084.2 IMP
   000182         018500       04 XXCORRECT                  PIC X(20).                   IC1084.2
   000183         018600     02 INF-ANSI-REFERENCE           PIC X(48).                   IC1084.2
   000184         018700 01  HYPHEN-LINE.                                                 IC1084.2
   000185         018800     02 FILLER  PIC IS X VALUE IS SPACE.                          IC1084.2 IMP
   000186         018900     02 FILLER  PIC IS X(65)    VALUE IS "************************IC1084.2
   000187         019000-    "*****************************************".                 IC1084.2
   000188         019100     02 FILLER  PIC IS X(54)    VALUE IS "************************IC1084.2
   000189         019200-    "******************************".                            IC1084.2
   000190         019300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC1084.2
   000191         019400     "IC108A".                                                    IC1084.2
   000192         019500 PROCEDURE DIVISION.                                              IC1084.2
   000193         019600 CCVS1 SECTION.                                                   IC1084.2
   000194         019700 OPEN-FILES.                                                      IC1084.2
   000195         019800     OPEN     OUTPUT PRINT-FILE.                                  IC1084.2 34
   000196         019900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC1084.2 190 131 190 150
   000197         020000     MOVE    SPACE TO TEST-RESULTS.                               IC1084.2 IMP 51
   000198         020100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC1084.2 223 228
   000199         020200     GO TO CCVS1-EXIT.                                            IC1084.2 305
   000200         020300 CLOSE-FILES.                                                     IC1084.2
   000201         020400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC1084.2 232 253 34
   000202         020500 TERMINATE-CCVS.                                                  IC1084.2
   000203         020600     EXIT PROGRAM.                                                IC1084.2
   000204         020700 TERMINATE-CALL.                                                  IC1084.2
   000205         020800     STOP     RUN.                                                IC1084.2
   000206         020900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC1084.2 55 107
   000207         021000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC1084.2 55 108
   000208         021100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC1084.2 55 106
   000209         021200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC1084.2 55 105
   000210         021300     MOVE "****TEST DELETED****" TO RE-MARK.                      IC1084.2 62
   000211         021400 PRINT-DETAIL.                                                    IC1084.2
   000212         021500     IF REC-CT NOT EQUAL TO ZERO                                  IC1084.2 104 IMP
   000213      1  021600             MOVE "." TO PARDOT-X                                 IC1084.2 59
   000214      1  021700             MOVE REC-CT TO DOTVALUE.                             IC1084.2 104 60
   000215         021800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC1084.2 51 35 265
   000216         021900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC1084.2 55 265
   000217      1  022000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC1084.2 282 295
   000218      1  022100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC1084.2 296 304
   000219         022200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC1084.2 IMP 55 IMP 67
   000220         022300     MOVE SPACE TO CORRECT-X.                                     IC1084.2 IMP 81
   000221         022400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC1084.2 104 IMP IMP 57
   000222         022500     MOVE     SPACE TO RE-MARK.                                   IC1084.2 IMP 62
   000223         022600 HEAD-ROUTINE.                                                    IC1084.2
   000224         022700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC1084.2 114 36 265
   000225         022800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC1084.2 119 36 265
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC1084.2 128 36 265
   000227         023000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC1084.2 140 36 265
   000228         023100 COLUMN-NAMES-ROUTINE.                                            IC1084.2
   000229         023200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1084.2 92 36 265
   000230         023300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1084.2 97 36 265
   000231         023400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC1084.2 184 36 265
   000232         023500 END-ROUTINE.                                                     IC1084.2
   000233         023600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC1084.2 184 36 265
   000234         023700 END-RTN-EXIT.                                                    IC1084.2
   000235         023800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1084.2 147 36 265
   000236         023900 END-ROUTINE-1.                                                   IC1084.2
   000237         024000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC1084.2 106 110 107
   000238         024100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC1084.2 110 105 110
   000239         024200      ADD PASS-COUNTER TO ERROR-HOLD.                             IC1084.2 108 110
   000240         024300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC1084.2
   000241         024400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC1084.2 108 170
   000242         024500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC1084.2 110 172
   000243         024600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC1084.2 169 155
   000244         024700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC1084.2 152 36 265
   000245         024800  END-ROUTINE-12.                                                 IC1084.2
   000246         024900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC1084.2 158
   000247         025000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC1084.2 106 IMP
   000248      1  025100         MOVE "NO " TO ERROR-TOTAL                                IC1084.2 156
   000249         025200         ELSE                                                     IC1084.2
   000250      1  025300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC1084.2 106 156
   000251         025400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC1084.2 152 36
   000252         025500     PERFORM WRITE-LINE.                                          IC1084.2 265
   000253         025600 END-ROUTINE-13.                                                  IC1084.2
   000254         025700     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC1084.2 105 IMP
   000255      1  025800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC1084.2 156
   000256      1  025900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC1084.2 105 156
   000257         026000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC1084.2 158
   000258         026100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1084.2 152 36 265
   000259         026200      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC1084.2 107 IMP
   000260      1  026300          MOVE "NO " TO ERROR-TOTAL                               IC1084.2 156
   000261      1  026400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC1084.2 107 156
   000262         026500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC1084.2 158
   000263         026600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC1084.2 152 36 265
   000264         026700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1084.2 160 36 265
   000265         026800 WRITE-LINE.                                                      IC1084.2
   000266         026900     ADD 1 TO RECORD-COUNT.                                       IC1084.2 112
   000267         027000     IF RECORD-COUNT GREATER 50                                   IC1084.2 112
   000268      1  027100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC1084.2 36 111
   000269      1  027200         MOVE SPACE TO DUMMY-RECORD                               IC1084.2 IMP 36
   000270      1  027300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC1084.2 36
   000271      1  027400         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC1084.2 92 36 277
   000272      1  027500         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC1084.2 97 36 277
   000273      1  027600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC1084.2 184 36 277
   000274      1  027700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC1084.2 111 36
   000275      1  027800         MOVE ZERO TO RECORD-COUNT.                               IC1084.2 IMP 112
   000276         027900     PERFORM WRT-LN.                                              IC1084.2 277
   000277         028000 WRT-LN.                                                          IC1084.2
   000278         028100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC1084.2 36
   000279         028200     MOVE SPACE TO DUMMY-RECORD.                                  IC1084.2 IMP 36
   000280         028300 BLANK-LINE-PRINT.                                                IC1084.2
   000281         028400     PERFORM WRT-LN.                                              IC1084.2 277
   000282         028500 FAIL-ROUTINE.                                                    IC1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC1084.2 67 IMP 290
   000284         028700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC1084.2 81 IMP 290
   000285         028800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC1084.2 113 183
   000286         028900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC1084.2 178
   000287         029000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1084.2 175 36 265
   000288         029100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC1084.2 IMP 183
   000289         029200     GO TO  FAIL-ROUTINE-EX.                                      IC1084.2 295
   000290         029300 FAIL-ROUTINE-WRITE.                                              IC1084.2
   000291         029400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC1084.2 63 35 265
   000292         029500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC1084.2 113 91
   000293         029600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC1084.2 78 35 265
   000294         029700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC1084.2 IMP 91
   000295         029800 FAIL-ROUTINE-EX. EXIT.                                           IC1084.2
   000296         029900 BAIL-OUT.                                                        IC1084.2
   000297         030000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC1084.2 68 IMP 299
   000298         030100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC1084.2 82 IMP 304
   000299         030200 BAIL-OUT-WRITE.                                                  IC1084.2
   000300         030300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC1084.2 82 182 68 180
   000301         030400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC1084.2 113 183
   000302         030500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1084.2 175 36 265
   000303         030600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC1084.2 IMP 183
   000304         030700 BAIL-OUT-EX. EXIT.                                               IC1084.2
   000305         030800 CCVS1-EXIT.                                                      IC1084.2
   000306         030900     EXIT.                                                        IC1084.2
   000307         031000 SECTION-IC108-0001 SECTION.                                      IC1084.2
   000308         031100 CALL-PARAGRAPH.                                                  IC1084.2
   000309         031200*        THE CALL IN THIS PARAGRAPH STARTS THE SEQUENCE           IC1084.2
   000310         031300*    OF CALLS TO THE SUBPROGRAMS.                                 IC1084.2
   000311         031400     MOVE SPACE TO SUB-CALLED.                                    IC1084.2 IMP 39
   000312         031500     MOVE SPACE TO SPECIAL-FLAGS.                                 IC1084.2 IMP 47
   000313         031600     CALL "IC109A" USING GRP-01.                                  IC1084.2 EXT 38
   000314         031700 CALL-TEST-07.                                                    IC1084.2
   000315         031800*        THIS TEST VERIFIES THAT EACH SUBPROGRAM WAS CALLED       IC1084.2
   000316         031900*    BY CHECKING THE PARAMETER FIELDS SET IN EACH SUBPROGRAM.     IC1084.2
   000317         032000     MOVE "SUBPROGRAM CALLS" TO FEATURE.                          IC1084.2 53
   000318         032100     MOVE "CALL-TEST-07" TO PAR-NAME.                             IC1084.2 57
   000319         032200 CALL-TEST-07-01.                                                 IC1084.2
   000320         032300     MOVE 1 TO REC-CT.                                            IC1084.2 104
   000321         032400     IF DN1 IS EQUAL TO "IC109A"                                  IC1084.2 40
   000322      1  032500         PERFORM PASS                                             IC1084.2 207
   000323      1  032600         GO TO CALL-WRITE-07-01.                                  IC1084.2 329
   000324         032700 CALL-FAIL-07-01.                                                 IC1084.2
   000325         032800     PERFORM FAIL.                                                IC1084.2 208
   000326         032900     MOVE DN1 TO COMPUTED-A.                                      IC1084.2 40 68
   000327         033000     MOVE "IC109A" TO CORRECT-A.                                  IC1084.2 82
   000328         033100     MOVE "SUBPROGRAM IC109A ERROR" TO RE-MARK.                   IC1084.2 62
   000329         033200 CALL-WRITE-07-01.                                                IC1084.2
   000330         033300     PERFORM PRINT-DETAIL.                                        IC1084.2 211
   000331         033400 CALL-TEST-07-02.                                                 IC1084.2
   000332         033500     ADD 1 TO REC-CT.                                             IC1084.2 104
   000333         033600     IF DN2 IS EQUAL TO "IC110A"                                  IC1084.2 41
   000334      1  033700         PERFORM PASS                                             IC1084.2 207
   000335      1  033800         GO TO CALL-WRITE-07-02.                                  IC1084.2 341
   000336         033900 CALL-FAIL-07-02.                                                 IC1084.2
   000337         034000     PERFORM FAIL.                                                IC1084.2 208
   000338         034100     MOVE DN2 TO COMPUTED-A.                                      IC1084.2 41 68
   000339         034200     MOVE "IC110A" TO CORRECT-A.                                  IC1084.2 82
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE "SUBPROGRAM IC110A ERROR" TO RE-MARK.                   IC1084.2 62
   000341         034400 CALL-WRITE-07-02.                                                IC1084.2
   000342         034500     PERFORM PRINT-DETAIL.                                        IC1084.2 211
   000343         034600 CALL-TEST-07-03.                                                 IC1084.2
   000344         034700     ADD 1 TO REC-CT.                                             IC1084.2 104
   000345         034800     IF DN3 EQUAL TO "IC111A"                                     IC1084.2 42
   000346      1  034900         PERFORM PASS                                             IC1084.2 207
   000347      1  035000         GO TO CALL-WRITE-07-03.                                  IC1084.2 353
   000348         035100 CALL-FAIL-07-03.                                                 IC1084.2
   000349         035200     PERFORM FAIL.                                                IC1084.2 208
   000350         035300     MOVE DN3 TO COMPUTED-A.                                      IC1084.2 42 68
   000351         035400     MOVE "IC111A" TO CORRECT-A.                                  IC1084.2 82
   000352         035500     MOVE "SUBPROGRAM IC111A ERROR" TO RE-MARK.                   IC1084.2 62
   000353         035600 CALL-WRITE-07-03.                                                IC1084.2
   000354         035700     PERFORM PRINT-DETAIL.                                        IC1084.2 211
   000355         035800 CALL-TEST-08.                                                    IC1084.2
   000356         035900*        THIS TEST VERIFIES THAT EACH OF THE SUBPROGRAMS          IC1084.2
   000357         036000*    WERE CALLED ONLY ONCE.                                       IC1084.2
   000358         036100     MOVE "CALL-TEST-08" TO PAR-NAME.                             IC1084.2 57
   000359         036200     MOVE "SUBPRGMS CALLED ONCE" TO FEATURE.                      IC1084.2 53
   000360         036300 CALL-TEST-08-01.                                                 IC1084.2
   000361         036400     MOVE 1 TO REC-CT.                                            IC1084.2 104
   000362         036500     IF DN4 EQUAL TO 1                                            IC1084.2 44
   000363      1  036600         PERFORM PASS                                             IC1084.2 207
   000364      1  036700         GO TO CALL-WRITE-08-01.                                  IC1084.2 370
   000365         036800 CALL-FAIL-08-01.                                                 IC1084.2
   000366         036900     PERFORM FAIL.                                                IC1084.2 208
   000367         037000     MOVE DN4 TO COMPUTED-18V0.                                   IC1084.2 44 75
   000368         037100     MOVE 1 TO CORRECT-18V0.                                      IC1084.2 88
   000369         037200     MOVE "IC109A CALLED N TIMES" TO RE-MARK.                     IC1084.2 62
   000370         037300 CALL-WRITE-08-01.                                                IC1084.2
   000371         037400     PERFORM PRINT-DETAIL.                                        IC1084.2 211
   000372         037500 CALL-TEST-08-02.                                                 IC1084.2
   000373         037600     ADD 1 TO REC-CT.                                             IC1084.2 104
   000374         037700     IF DN5 EQUAL TO 1                                            IC1084.2 45
   000375      1  037800         PERFORM PASS                                             IC1084.2 207
   000376      1  037900         GO TO CALL-WRITE-08-02.                                  IC1084.2 382
   000377         038000 CALL-FAIL-08-02.                                                 IC1084.2
   000378         038100     PERFORM FAIL.                                                IC1084.2 208
   000379         038200     MOVE DN5 TO COMPUTED-18V0.                                   IC1084.2 45 75
   000380         038300     MOVE 1 TO CORRECT-18V0.                                      IC1084.2 88
   000381         038400     MOVE "IC110A CALLED N TIMES" TO RE-MARK.                     IC1084.2 62
   000382         038500 CALL-WRITE-08-02.                                                IC1084.2
   000383         038600     PERFORM PRINT-DETAIL.                                        IC1084.2 211
   000384         038700 CALL-TEST-08-03.                                                 IC1084.2
   000385         038800     ADD 1 TO REC-CT.                                             IC1084.2 104
   000386         038900     IF DN6 EQUAL TO 1                                            IC1084.2 46
   000387      1  039000         PERFORM PASS                                             IC1084.2 207
   000388      1  039100         GO TO CALL-WRITE-08-03.                                  IC1084.2 394
   000389         039200 CALL-FAIL-08-03.                                                 IC1084.2
   000390         039300     PERFORM FAIL.                                                IC1084.2 208
   000391         039400     MOVE DN6 TO COMPUTED-18V0.                                   IC1084.2 46 75
   000392         039500     MOVE 1 TO CORRECT-18V0.                                      IC1084.2 88
   000393         039600     MOVE "IC111A CALLED N TIMES" TO RE-MARK.                     IC1084.2 62
   000394         039700 CALL-WRITE-08-03.                                                IC1084.2
   000395         039800     PERFORM PRINT-DETAIL.                                        IC1084.2 211
   000396         039900 LINK-TEST-07.                                                    IC1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000*        THIS TEST VERIFIES THAT USING PHRASE OPERANDS            IC1084.2
   000398         040100*    WHICH WERE DEFINED IN SUBPROGRAM WORKING-STORAGE             IC1084.2
   000399         040200*    SECTIONS WERE PROCESSED CORRECTLY.                           IC1084.2
   000400         040300     MOVE "LINK-TEST-07" TO PAR-NAME.                             IC1084.2 57
   000401         040400     MOVE "USING OPERANDS" TO FEATURE.                            IC1084.2 53
   000402         040500 LINK-TEST-07-01.                                                 IC1084.2
   000403         040600     MOVE 1 TO REC-CT.                                            IC1084.2 104
   000404         040700     IF DN7 EQUAL TO "A"                                          IC1084.2 48
   000405      1  040800         PERFORM PASS                                             IC1084.2 207
   000406      1  040900         GO TO LINK-WRITE-07-01.                                  IC1084.2 412
   000407         041000 LINK-FAIL-07-01.                                                 IC1084.2
   000408         041100     PERFORM FAIL.                                                IC1084.2 208
   000409         041200     MOVE DN7 TO COMPUTED-A.                                      IC1084.2 48 68
   000410         041300     MOVE "A" TO CORRECT-A.                                       IC1084.2 82
   000411         041400     MOVE "IC109A WK-STORAGE OPERAND" TO RE-MARK.                 IC1084.2 62
   000412         041500 LINK-WRITE-07-01.                                                IC1084.2
   000413         041600     PERFORM PRINT-DETAIL.                                        IC1084.2 211
   000414         041700 LINK-TEST-07-02.                                                 IC1084.2
   000415         041800     ADD 1 TO REC-CT.                                             IC1084.2 104
   000416         041900     IF DN8 EQUAL TO "A"                                          IC1084.2 49
   000417      1  042000         PERFORM PASS                                             IC1084.2 207
   000418      1  042100         GO TO LINK-WRITE-07-02.                                  IC1084.2 424
   000419         042200 LINK-FAIL-07-02.                                                 IC1084.2
   000420         042300     PERFORM FAIL.                                                IC1084.2 208
   000421         042400     MOVE DN8 TO COMPUTED-A.                                      IC1084.2 49 68
   000422         042500     MOVE "A" TO CORRECT-A.                                       IC1084.2 82
   000423         042600     MOVE "IC110A WK-STORAGE OPERAND" TO RE-MARK.                 IC1084.2 62
   000424         042700 LINK-WRITE-07-02.                                                IC1084.2
   000425         042800     PERFORM PRINT-DETAIL.                                        IC1084.2 211
   000426         042900 LINK-TEST-07-03.                                                 IC1084.2
   000427         043000     ADD 1 TO REC-CT.                                             IC1084.2 104
   000428         043100     IF DN9 EQUAL TO "B"                                          IC1084.2 50
   000429      1  043200         PERFORM PASS                                             IC1084.2 207
   000430      1  043300         GO TO LINK-WRITE-07-03.                                  IC1084.2 436
   000431         043400 LINK-FAIL-07-03.                                                 IC1084.2
   000432         043500     PERFORM FAIL.                                                IC1084.2 208
   000433         043600     MOVE DN9 TO COMPUTED-A.                                      IC1084.2 50 68
   000434         043700     MOVE "B" TO CORRECT-A.                                       IC1084.2 82
   000435         043800     MOVE "IC111A WK-STORAGE OPERAND" TO RE-MARK.                 IC1084.2 62
   000436         043900 LINK-WRITE-07-03.                                                IC1084.2
   000437         044000     PERFORM PRINT-DETAIL.                                        IC1084.2 211
   000438         044100     GO TO CCVS-EXIT.                                             IC1084.2 439
   000439         044200 CCVS-EXIT SECTION.                                               IC1084.2
   000440         044300 CCVS-999999.                                                     IC1084.2
   000441         044400     GO TO CLOSE-FILES.                                           IC1084.2 200
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page    11
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      113   ANSI-REFERENCE . . . . . . . .  285 292 301
       92   CCVS-C-1 . . . . . . . . . . .  229 271
       97   CCVS-C-2 . . . . . . . . . . .  230 272
      147   CCVS-E-1 . . . . . . . . . . .  235
      152   CCVS-E-2 . . . . . . . . . . .  244 251 258 263
      155   CCVS-E-2-2 . . . . . . . . . .  M243
      160   CCVS-E-3 . . . . . . . . . . .  264
      169   CCVS-E-4 . . . . . . . . . . .  243
      170   CCVS-E-4-1 . . . . . . . . . .  M241
      172   CCVS-E-4-2 . . . . . . . . . .  M242
      114   CCVS-H-1 . . . . . . . . . . .  224
      119   CCVS-H-2A. . . . . . . . . . .  225
      128   CCVS-H-2B. . . . . . . . . . .  226
      140   CCVS-H-3 . . . . . . . . . . .  227
      190   CCVS-PGM-ID. . . . . . . . . .  196 196
       74   CM-18V0
       68   COMPUTED-A . . . . . . . . . .  69 71 72 73 74 297 300 M326 M338 M350 M409 M421 M433
       69   COMPUTED-N
       67   COMPUTED-X . . . . . . . . . .  M219 283
       71   COMPUTED-0V18
       73   COMPUTED-14V4
       75   COMPUTED-18V0. . . . . . . . .  M367 M379 M391
       72   COMPUTED-4V14
       91   COR-ANSI-REFERENCE . . . . . .  M292 M294
       82   CORRECT-A. . . . . . . . . . .  83 84 85 86 87 298 300 M327 M339 M351 M410 M422 M434
       83   CORRECT-N
       81   CORRECT-X. . . . . . . . . . .  M220 284
       84   CORRECT-0V18
       86   CORRECT-14V4
       88   CORRECT-18V0 . . . . . . . . .  M368 M380 M392
       85   CORRECT-4V14
       87   CR-18V0
      105   DELETE-COUNTER . . . . . . . .  M209 238 254 256
       40   DN1. . . . . . . . . . . . . .  321 326
       41   DN2. . . . . . . . . . . . . .  333 338
       42   DN3. . . . . . . . . . . . . .  345 350
       44   DN4. . . . . . . . . . . . . .  362 367
       45   DN5. . . . . . . . . . . . . .  374 379
       46   DN6. . . . . . . . . . . . . .  386 391
       48   DN7. . . . . . . . . . . . . .  404 409
       49   DN8. . . . . . . . . . . . . .  416 421
       50   DN9. . . . . . . . . . . . . .  428 433
       60   DOTVALUE . . . . . . . . . . .  M214
      111   DUMMY-HOLD . . . . . . . . . .  M268 274
       36   DUMMY-RECORD . . . . . . . . .  M224 M225 M226 M227 M229 M230 M231 M233 M235 M244 M251 M258 M263 M264 268 M269
                                            270 M271 M272 M273 M274 278 M279 M287 M302
      158   ENDER-DESC . . . . . . . . . .  M246 M257 M262
      106   ERROR-COUNTER. . . . . . . . .  M208 237 247 250
      110   ERROR-HOLD . . . . . . . . . .  M237 M238 M238 M239 242
      156   ERROR-TOTAL. . . . . . . . . .  M248 M250 M255 M256 M260 M261
       53   FEATURE. . . . . . . . . . . .  M317 M359 M401
       38   GRP-01 . . . . . . . . . . . .  313
      184   HYPHEN-LINE. . . . . . . . . .  231 233 273
      150   ID-AGAIN . . . . . . . . . . .  M196
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page    12
0 Defined   Cross-reference of data names   References

0     183   INF-ANSI-REFERENCE . . . . . .  M285 M288 M301 M303
      178   INFO-TEXT. . . . . . . . . . .  M286
      107   INSPECT-COUNTER. . . . . . . .  M206 237 259 261
       55   P-OR-F . . . . . . . . . . . .  M206 M207 M208 M209 216 M219
       57   PAR-NAME . . . . . . . . . . .  M221 M318 M358 M400
       59   PARDOT-X . . . . . . . . . . .  M213
      108   PASS-COUNTER . . . . . . . . .  M207 239 241
       34   PRINT-FILE . . . . . . . . . .  30 195 201
       35   PRINT-REC. . . . . . . . . . .  M215 M291 M293
       62   RE-MARK. . . . . . . . . . . .  M210 M222 M328 M340 M352 M369 M381 M393 M411 M423 M435
      104   REC-CT . . . . . . . . . . . .  212 214 221 M320 M332 M344 M361 M373 M385 M403 M415 M427
      103   REC-SKL-SUB
      112   RECORD-COUNT . . . . . . . . .  M266 267 M275
       47   SPECIAL-FLAGS. . . . . . . . .  M312
       39   SUB-CALLED . . . . . . . . . .  M311
       63   TEST-COMPUTED. . . . . . . . .  291
       78   TEST-CORRECT . . . . . . . . .  293
      131   TEST-ID. . . . . . . . . . . .  M196
       51   TEST-RESULTS . . . . . . . . .  M197 215
       43   TIMES-CALLED
      109   TOTAL-ERROR
      180   XXCOMPUTED . . . . . . . . . .  M300
      182   XXCORRECT. . . . . . . . . . .  M300
      175   XXINFO . . . . . . . . . . . .  287 302
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page    13
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

      296   BAIL-OUT . . . . . . . . . . .  P218
      304   BAIL-OUT-EX. . . . . . . . . .  E218 G298
      299   BAIL-OUT-WRITE . . . . . . . .  G297
      280   BLANK-LINE-PRINT
      324   CALL-FAIL-07-01
      336   CALL-FAIL-07-02
      348   CALL-FAIL-07-03
      365   CALL-FAIL-08-01
      377   CALL-FAIL-08-02
      389   CALL-FAIL-08-03
      308   CALL-PARAGRAPH
      314   CALL-TEST-07
      319   CALL-TEST-07-01
      331   CALL-TEST-07-02
      343   CALL-TEST-07-03
      355   CALL-TEST-08
      360   CALL-TEST-08-01
      372   CALL-TEST-08-02
      384   CALL-TEST-08-03
      329   CALL-WRITE-07-01 . . . . . . .  G323
      341   CALL-WRITE-07-02 . . . . . . .  G335
      353   CALL-WRITE-07-03 . . . . . . .  G347
      370   CALL-WRITE-08-01 . . . . . . .  G364
      382   CALL-WRITE-08-02 . . . . . . .  G376
      394   CALL-WRITE-08-03 . . . . . . .  G388
      439   CCVS-EXIT. . . . . . . . . . .  G438
      440   CCVS-999999
      193   CCVS1
      305   CCVS1-EXIT . . . . . . . . . .  G199
      200   CLOSE-FILES. . . . . . . . . .  G441
      228   COLUMN-NAMES-ROUTINE . . . . .  E198
      209   DE-LETE
      232   END-ROUTINE. . . . . . . . . .  P201
      236   END-ROUTINE-1
      245   END-ROUTINE-12
      253   END-ROUTINE-13 . . . . . . . .  E201
      234   END-RTN-EXIT
      208   FAIL . . . . . . . . . . . . .  P325 P337 P349 P366 P378 P390 P408 P420 P432
      282   FAIL-ROUTINE . . . . . . . . .  P217
      295   FAIL-ROUTINE-EX. . . . . . . .  E217 G289
      290   FAIL-ROUTINE-WRITE . . . . . .  G283 G284
      223   HEAD-ROUTINE . . . . . . . . .  P198
      206   INSPT
      407   LINK-FAIL-07-01
      419   LINK-FAIL-07-02
      431   LINK-FAIL-07-03
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page    14
0 Defined   Cross-reference of procedures   References

0     396   LINK-TEST-07
      402   LINK-TEST-07-01
      414   LINK-TEST-07-02
      426   LINK-TEST-07-03
      412   LINK-WRITE-07-01 . . . . . . .  G406
      424   LINK-WRITE-07-02 . . . . . . .  G418
      436   LINK-WRITE-07-03 . . . . . . .  G430
      194   OPEN-FILES
      207   PASS . . . . . . . . . . . . .  P322 P334 P346 P363 P375 P387 P405 P417 P429
      211   PRINT-DETAIL . . . . . . . . .  P330 P342 P354 P371 P383 P395 P413 P425 P437
      307   SECTION-IC108-0001
      204   TERMINATE-CALL
      202   TERMINATE-CCVS
      265   WRITE-LINE . . . . . . . . . .  P215 P216 P224 P225 P226 P227 P229 P230 P231 P233 P235 P244 P252 P258 P263 P264
                                            P287 P291 P293 P302
      277   WRT-LN . . . . . . . . . . . .  P271 P272 P273 P276 P281
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page    15
0 Defined   Cross-reference of programs     References

        3   IC108A
 EXTERNAL   IC109A . . . . . . . . . . . .  313
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC108A    Date 06/04/2022  Time 11:58:20   Page    16
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC108A:
 *    Source records = 441
 *    Data Division statements = 76
 *    Procedure Division statements = 219
 *    Generated COBOL statements = 0
 *    Program complexity factor = 227
0End of compilation 1,  program IC108A,  highest severity 0.
0Return code 0
