1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:59   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:59   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:59   Page     3
0LineID  Message code  Library phase message text

         IGYLI0090-W   2 sequence errors were found in this program.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1                          1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         SM1074.2
   000002         000200 PROGRAM-ID.                                                      SM1074.2
   000003         000300     SM107A.                                                      SM1074.2
   000004         000500*                                                              *  SM1074.2
   000005         000600*    VALIDATION FOR:-                                          *  SM1074.2
   000006         000700*                                                              *  SM1074.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".SM1074.2
   000008         000900*                                                              *  SM1074.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".SM1074.2
   000010         001100*                                                              *  SM1074.2
   000011         001300*                                                              *  SM1074.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  SM1074.2
   000013         001500*                                                              *  SM1074.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  SM1074.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  SM1074.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  SM1074.2
   000017         001900*                                                              *  SM1074.2
   000018         002100*                                                              *  SM1074.2
   000019         002200*    PROGRAM SM107A TESTS THE CAPABILITY TO COPY 1599 RECORDS  *  SM1074.2
   000020         002300*    BY A SINGLE "COPY" STATEMENT IN THE PROCEDURE DIVISION.   *  SM1074.2
   000021         002400*                                                              *  SM1074.2
   000022         002600 ENVIRONMENT DIVISION.                                            SM1074.2
   000023         002700 CONFIGURATION SECTION.                                           SM1074.2
   000024         002800 SOURCE-COMPUTER.                                                 SM1074.2
   000025         002900     XXXXX082.                                                    SM1074.2
   000026         003000 OBJECT-COMPUTER.                                                 SM1074.2
   000027         003100     XXXXX083.                                                    SM1074.2
   000028         003200 INPUT-OUTPUT SECTION.                                            SM1074.2
   000029         003300 FILE-CONTROL.                                                    SM1074.2
   000030         003400     SELECT PRINT-FILE ASSIGN TO                                  SM1074.2 34
   000031         003500     XXXXX055.                                                    SM1074.2
   000032         003600 DATA DIVISION.                                                   SM1074.2
   000033         003700 FILE SECTION.                                                    SM1074.2
   000034         003800 FD  PRINT-FILE.                                                  SM1074.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003900 01  PRINT-REC PICTURE X(120).                                    SM1074.2
   000036         004000 01  DUMMY-RECORD PICTURE X(120).                                 SM1074.2
   000037         004100 WORKING-STORAGE SECTION.                                         SM1074.2
   000038         004200 01  TEST-RESULTS.                                                SM1074.2
   000039         004300     02 FILLER                   PIC X      VALUE SPACE.          SM1074.2 IMP
   000040         004400     02 FEATURE                  PIC X(20)  VALUE SPACE.          SM1074.2 IMP
   000041         004500     02 FILLER                   PIC X      VALUE SPACE.          SM1074.2 IMP
   000042         004600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          SM1074.2 IMP
   000043         004700     02 FILLER                   PIC X      VALUE SPACE.          SM1074.2 IMP
   000044         004800     02  PAR-NAME.                                                SM1074.2
   000045         004900       03 FILLER                 PIC X(19)  VALUE SPACE.          SM1074.2 IMP
   000046         005000       03  PARDOT-X              PIC X      VALUE SPACE.          SM1074.2 IMP
   000047         005100       03 DOTVALUE               PIC 99     VALUE ZERO.           SM1074.2 IMP
   000048         005200     02 FILLER                   PIC X(8)   VALUE SPACE.          SM1074.2 IMP
   000049         005300     02 RE-MARK                  PIC X(61).                       SM1074.2
   000050         005400 01  TEST-COMPUTED.                                               SM1074.2
   000051         005500     02 FILLER                   PIC X(30)  VALUE SPACE.          SM1074.2 IMP
   000052         005600     02 FILLER                   PIC X(17)  VALUE                 SM1074.2
   000053         005700            "       COMPUTED=".                                   SM1074.2
   000054         005800     02 COMPUTED-X.                                               SM1074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          SM1074.2 IMP
   000056         006000     03 COMPUTED-N               REDEFINES COMPUTED-A             SM1074.2 55
   000057         006100                                 PIC -9(9).9(9).                  SM1074.2
   000058         006200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         SM1074.2 55
   000059         006300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     SM1074.2 55
   000060         006400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     SM1074.2 55
   000061         006500     03       CM-18V0 REDEFINES COMPUTED-A.                       SM1074.2 55
   000062         006600         04 COMPUTED-18V0                    PIC -9(18).          SM1074.2
   000063         006700         04 FILLER                           PIC X.               SM1074.2
   000064         006800     03 FILLER PIC X(50) VALUE SPACE.                             SM1074.2 IMP
   000065         006900 01  TEST-CORRECT.                                                SM1074.2
   000066         007000     02 FILLER PIC X(30) VALUE SPACE.                             SM1074.2 IMP
   000067         007100     02 FILLER PIC X(17) VALUE "       CORRECT =".                SM1074.2
   000068         007200     02 CORRECT-X.                                                SM1074.2
   000069         007300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         SM1074.2 IMP
   000070         007400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      SM1074.2 69
   000071         007500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         SM1074.2 69
   000072         007600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     SM1074.2 69
   000073         007700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     SM1074.2 69
   000074         007800     03      CR-18V0 REDEFINES CORRECT-A.                         SM1074.2 69
   000075         007900         04 CORRECT-18V0                     PIC -9(18).          SM1074.2
   000076         008000         04 FILLER                           PIC X.               SM1074.2
   000077         008100     03 FILLER PIC X(2) VALUE SPACE.                              SM1074.2 IMP
   000078         008200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     SM1074.2 IMP
   000079         008300 01  CCVS-C-1.                                                    SM1074.2
   000080         008400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PASM1074.2
   000081         008500-    "SS  PARAGRAPH-NAME                                          SM1074.2
   000082         008600-    "       REMARKS".                                            SM1074.2
   000083         008700     02 FILLER                     PIC X(20)    VALUE SPACE.      SM1074.2 IMP
   000084         008800 01  CCVS-C-2.                                                    SM1074.2
   000085         008900     02 FILLER                     PIC X        VALUE SPACE.      SM1074.2 IMP
   000086         009000     02 FILLER                     PIC X(6)     VALUE "TESTED".   SM1074.2
   000087         009100     02 FILLER                     PIC X(15)    VALUE SPACE.      SM1074.2 IMP
   000088         009200     02 FILLER                     PIC X(4)     VALUE "FAIL".     SM1074.2
   000089         009300     02 FILLER                     PIC X(94)    VALUE SPACE.      SM1074.2 IMP
   000090         009400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       SM1074.2 IMP
   000091         009500 01  REC-CT                        PIC 99       VALUE ZERO.       SM1074.2 IMP
   000092         009600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       SM1074.2 IMP
   000093         009700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       SM1074.2 IMP
   000094         009800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       SM1074.2 IMP
   000095         009900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       SM1074.2 IMP
   000096         010000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       SM1074.2 IMP
   000097         010100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       SM1074.2 IMP
   000098         010200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      SM1074.2 IMP
   000099         010300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       SM1074.2 IMP
   000100         010400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     SM1074.2 IMP
   000101         010500 01  CCVS-H-1.                                                    SM1074.2
   000102         010600     02  FILLER                    PIC X(39)    VALUE SPACES.     SM1074.2 IMP
   000103         010700     02  FILLER                    PIC X(42)    VALUE             SM1074.2
   000104         010800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 SM1074.2
   000105         010900     02  FILLER                    PIC X(39)    VALUE SPACES.     SM1074.2 IMP
   000106         011000 01  CCVS-H-2A.                                                   SM1074.2
   000107         011100   02  FILLER                        PIC X(40)  VALUE SPACE.      SM1074.2 IMP
   000108         011200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  SM1074.2
   000109         011300   02  FILLER                        PIC XXXX   VALUE             SM1074.2
   000110         011400     "4.2 ".                                                      SM1074.2
   000111         011500   02  FILLER                        PIC X(28)  VALUE             SM1074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600            " COPY - NOT FOR DISTRIBUTION".                       SM1074.2
   000113         011700   02  FILLER                        PIC X(41)  VALUE SPACE.      SM1074.2 IMP
   000114         011800                                                                  SM1074.2
   000115         011900 01  CCVS-H-2B.                                                   SM1074.2
   000116         012000   02  FILLER                        PIC X(15)  VALUE             SM1074.2
   000117         012100            "TEST RESULT OF ".                                    SM1074.2
   000118         012200   02  TEST-ID                       PIC X(9).                    SM1074.2
   000119         012300   02  FILLER                        PIC X(4)   VALUE             SM1074.2
   000120         012400            " IN ".                                               SM1074.2
   000121         012500   02  FILLER                        PIC X(12)  VALUE             SM1074.2
   000122         012600     " HIGH       ".                                              SM1074.2
   000123         012700   02  FILLER                        PIC X(22)  VALUE             SM1074.2
   000124         012800            " LEVEL VALIDATION FOR ".                             SM1074.2
   000125         012900   02  FILLER                        PIC X(58)  VALUE             SM1074.2
   000126         013000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".SM1074.2
   000127         013100 01  CCVS-H-3.                                                    SM1074.2
   000128         013200     02  FILLER                      PIC X(34)  VALUE             SM1074.2
   000129         013300            " FOR OFFICIAL USE ONLY    ".                         SM1074.2
   000130         013400     02  FILLER                      PIC X(58)  VALUE             SM1074.2
   000131         013500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".SM1074.2
   000132         013600     02  FILLER                      PIC X(28)  VALUE             SM1074.2
   000133         013700            "  COPYRIGHT   1985 ".                                SM1074.2
   000134         013800 01  CCVS-E-1.                                                    SM1074.2
   000135         013900     02 FILLER                       PIC X(52)  VALUE SPACE.      SM1074.2 IMP
   000136         014000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              SM1074.2
   000137         014100     02 ID-AGAIN                     PIC X(9).                    SM1074.2
   000138         014200     02 FILLER                       PIC X(45)  VALUE SPACES.     SM1074.2 IMP
   000139         014300 01  CCVS-E-2.                                                    SM1074.2
   000140         014400     02  FILLER                      PIC X(31)  VALUE SPACE.      SM1074.2 IMP
   000141         014500     02  FILLER                      PIC X(21)  VALUE SPACE.      SM1074.2 IMP
   000142         014600     02 CCVS-E-2-2.                                               SM1074.2
   000143         014700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      SM1074.2 IMP
   000144         014800         03 FILLER                   PIC X      VALUE SPACE.      SM1074.2 IMP
   000145         014900         03 ENDER-DESC               PIC X(44)  VALUE             SM1074.2
   000146         015000            "ERRORS ENCOUNTERED".                                 SM1074.2
   000147         015100 01  CCVS-E-3.                                                    SM1074.2
   000148         015200     02  FILLER                      PIC X(22)  VALUE             SM1074.2
   000149         015300            " FOR OFFICIAL USE ONLY".                             SM1074.2
   000150         015400     02  FILLER                      PIC X(12)  VALUE SPACE.      SM1074.2 IMP
   000151         015500     02  FILLER                      PIC X(58)  VALUE             SM1074.2
   000152         015600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".SM1074.2
   000153         015700     02  FILLER                      PIC X(13)  VALUE SPACE.      SM1074.2 IMP
   000154         015800     02 FILLER                       PIC X(15)  VALUE             SM1074.2
   000155         015900             " COPYRIGHT 1985".                                   SM1074.2
   000156         016000 01  CCVS-E-4.                                                    SM1074.2
   000157         016100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      SM1074.2 IMP
   000158         016200     02 FILLER                       PIC X(4)   VALUE " OF ".     SM1074.2
   000159         016300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      SM1074.2 IMP
   000160         016400     02 FILLER                       PIC X(40)  VALUE             SM1074.2
   000161         016500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       SM1074.2
   000162         016600 01  XXINFO.                                                      SM1074.2
   000163         016700     02 FILLER                       PIC X(19)  VALUE             SM1074.2
   000164         016800            "*** INFORMATION ***".                                SM1074.2
   000165         016900     02 INFO-TEXT.                                                SM1074.2
   000166         017000       04 FILLER                     PIC X(8)   VALUE SPACE.      SM1074.2 IMP
   000167         017100       04 XXCOMPUTED                 PIC X(20).                   SM1074.2
   000168         017200       04 FILLER                     PIC X(5)   VALUE SPACE.      SM1074.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300       04 XXCORRECT                  PIC X(20).                   SM1074.2
   000170         017400     02 INF-ANSI-REFERENCE           PIC X(48).                   SM1074.2
   000171         017500 01  HYPHEN-LINE.                                                 SM1074.2
   000172         017600     02 FILLER  PIC IS X VALUE IS SPACE.                          SM1074.2 IMP
   000173         017700     02 FILLER  PIC IS X(65)    VALUE IS "************************SM1074.2
   000174         017800-    "*****************************************".                 SM1074.2
   000175         017900     02 FILLER  PIC IS X(54)    VALUE IS "************************SM1074.2
   000176         018000-    "******************************".                            SM1074.2
   000177         018100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             SM1074.2
   000178         018200     "SM107A".                                                    SM1074.2
   000179         018300 PROCEDURE DIVISION.                                              SM1074.2
   000180         018400 CCVS1 SECTION.                                                   SM1074.2
   000181         018500 OPEN-FILES.                                                      SM1074.2
   000182         018600     OPEN     OUTPUT PRINT-FILE.                                  SM1074.2 34
   000183         018700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   SM1074.2 177 118 177 137
   000184         018800     MOVE    SPACE TO TEST-RESULTS.                               SM1074.2 IMP 38
   000185         018900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             SM1074.2 210 215
   000186         019000     GO TO CCVS1-EXIT.                                            SM1074.2 292
   000187         019100 CLOSE-FILES.                                                     SM1074.2
   000188         019200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   SM1074.2 219 240 34
   000189         019300 TERMINATE-CCVS.                                                  SM1074.2
   000190         019400     EXIT PROGRAM.                                                SM1074.2
   000191         019500 TERMINATE-CALL.                                                  SM1074.2
   000192         019600     STOP     RUN.                                                SM1074.2
   000193         019700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         SM1074.2 42 94
   000194         019800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           SM1074.2 42 95
   000195         019900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          SM1074.2 42 93
   000196         020000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      SM1074.2 42 92
   000197         020100     MOVE "****TEST DELETED****" TO RE-MARK.                      SM1074.2 49
   000198         020200 PRINT-DETAIL.                                                    SM1074.2
   000199         020300     IF REC-CT NOT EQUAL TO ZERO                                  SM1074.2 91 IMP
   000200      1  020400             MOVE "." TO PARDOT-X                                 SM1074.2 46
   000201      1  020500             MOVE REC-CT TO DOTVALUE.                             SM1074.2 91 47
   000202         020600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      SM1074.2 38 35 252
   000203         020700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               SM1074.2 42 252
   000204      1  020800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 SM1074.2 269 282
   000205      1  020900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 SM1074.2 283 291
   000206         021000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              SM1074.2 IMP 42 IMP 54
   000207         021100     MOVE SPACE TO CORRECT-X.                                     SM1074.2 IMP 68
   000208         021200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         SM1074.2 91 IMP IMP 44
   000209         021300     MOVE     SPACE TO RE-MARK.                                   SM1074.2 IMP 49
   000210         021400 HEAD-ROUTINE.                                                    SM1074.2
   000211         021500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  SM1074.2 101 36 252
   000212         021600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  SM1074.2 106 36 252
   000213         021700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  SM1074.2 115 36 252
   000214         021800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  SM1074.2 127 36 252
   000215         021900 COLUMN-NAMES-ROUTINE.                                            SM1074.2
   000216         022000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           SM1074.2 79 36 252
   000217         022100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   SM1074.2 84 36 252
   000218         022200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        SM1074.2 171 36 252
   000219         022300 END-ROUTINE.                                                     SM1074.2
   000220         022400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.SM1074.2 171 36 252
   000221         022500 END-RTN-EXIT.                                                    SM1074.2
   000222         022600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   SM1074.2 134 36 252
   000223         022700 END-ROUTINE-1.                                                   SM1074.2
   000224         022800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      SM1074.2 93 97 94
   000225         022900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               SM1074.2 97 92 97
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000      ADD PASS-COUNTER TO ERROR-HOLD.                             SM1074.2 95 97
   000227         023100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   SM1074.2
   000228         023200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            SM1074.2 95 157
   000229         023300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              SM1074.2 97 159
   000230         023400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                SM1074.2 156 142
   000231         023500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           SM1074.2 139 36 252
   000232         023600  END-ROUTINE-12.                                                 SM1074.2
   000233         023700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        SM1074.2 145
   000234         023800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      SM1074.2 93 IMP
   000235      1  023900         MOVE "NO " TO ERROR-TOTAL                                SM1074.2 143
   000236         024000         ELSE                                                     SM1074.2
   000237      1  024100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       SM1074.2 93 143
   000238         024200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           SM1074.2 139 36
   000239         024300     PERFORM WRITE-LINE.                                          SM1074.2 252
   000240         024400 END-ROUTINE-13.                                                  SM1074.2
   000241         024500     IF DELETE-COUNTER IS EQUAL TO ZERO                           SM1074.2 92 IMP
   000242      1  024600         MOVE "NO " TO ERROR-TOTAL  ELSE                          SM1074.2 143
   000243      1  024700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      SM1074.2 92 143
   000244         024800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   SM1074.2 145
   000245         024900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           SM1074.2 139 36 252
   000246         025000      IF   INSPECT-COUNTER EQUAL TO ZERO                          SM1074.2 94 IMP
   000247      1  025100          MOVE "NO " TO ERROR-TOTAL                               SM1074.2 143
   000248      1  025200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   SM1074.2 94 143
   000249         025300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            SM1074.2 145
   000250         025400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          SM1074.2 139 36 252
   000251         025500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           SM1074.2 147 36 252
   000252         025600 WRITE-LINE.                                                      SM1074.2
   000253         025700     ADD 1 TO RECORD-COUNT.                                       SM1074.2 99
   000254         025800     IF RECORD-COUNT GREATER 50                                   SM1074.2 99
   000255      1  025900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          SM1074.2 36 98
   000256      1  026000         MOVE SPACE TO DUMMY-RECORD                               SM1074.2 IMP 36
   000257      1  026100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  SM1074.2 36
   000258      1  026200         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             SM1074.2 79 36 264
   000259      1  026300         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     SM1074.2 84 36 264
   000260      1  026400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          SM1074.2 171 36 264
   000261      1  026500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          SM1074.2 98 36
   000262      1  026600         MOVE ZERO TO RECORD-COUNT.                               SM1074.2 IMP 99
   000263         026700     PERFORM WRT-LN.                                              SM1074.2 264
   000264         026800 WRT-LN.                                                          SM1074.2
   000265         026900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               SM1074.2 36
   000266         027000     MOVE SPACE TO DUMMY-RECORD.                                  SM1074.2 IMP 36
   000267         027100 BLANK-LINE-PRINT.                                                SM1074.2
   000268         027200     PERFORM WRT-LN.                                              SM1074.2 264
   000269         027300 FAIL-ROUTINE.                                                    SM1074.2
   000270         027400     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. SM1074.2 54 IMP 277
   000271         027500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.SM1074.2 68 IMP 277
   000272         027600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 SM1074.2 100 170
   000273         027700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   SM1074.2 165
   000274         027800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   SM1074.2 162 36 252
   000275         027900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         SM1074.2 IMP 170
   000276         028000     GO TO  FAIL-ROUTINE-EX.                                      SM1074.2 282
   000277         028100 FAIL-ROUTINE-WRITE.                                              SM1074.2
   000278         028200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         SM1074.2 50 35 252
   000279         028300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 SM1074.2 100 78
   000280         028400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. SM1074.2 65 35 252
   000281         028500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         SM1074.2 IMP 78
   000282         028600 FAIL-ROUTINE-EX. EXIT.                                           SM1074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700 BAIL-OUT.                                                        SM1074.2
   000284         028800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   SM1074.2 55 IMP 286
   000285         028900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           SM1074.2 69 IMP 291
   000286         029000 BAIL-OUT-WRITE.                                                  SM1074.2
   000287         029100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  SM1074.2 69 169 55 167
   000288         029200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 SM1074.2 100 170
   000289         029300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   SM1074.2 162 36 252
   000290         029400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         SM1074.2 IMP 170
   000291         029500 BAIL-OUT-EX. EXIT.                                               SM1074.2
   000292         029600 CCVS1-EXIT.                                                      SM1074.2
   000293         029700     EXIT.                                                        SM1074.2
   000294         029800 WARNING-MSG.                                                     SM1074.2
   000295         029900     MOVE " IF NO OTHER REPORT LINES APPEAR BELOW, ""COPY K7SEA"" SM1074.2
   000296         030000-         "FAILED." TO PRINT-REC.                                 SM1074.2 35
   000297         030100     PERFORM WRITE-LINE.                                          SM1074.2 252
   000298         030200*                                                                 SM1074.2
   000299         030400*                                                                 SM1074.2
   000300         030500*COPY  K7SEA                                                      SM1074.2
   000301         030600*                                                                 SM1074.2
   000302         030800  COPY  K7SEA.                                                    SM1074.2
   000303C*       000100 COPY-TEST-1.                                                     K7SEA4.2
   000304C        000200     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000305C        000300     MOVE     "COPY-TEST-1  " TO PAR-NAME.                        K7SEA4.2 44
   000306C        000400     PERFORM  PASS.                                               K7SEA4.2 194
   000307C        000500     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000308C        000600     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000309C        000700     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000310C        000800     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000311C        000900 COPY-TEST-2.                                                     K7SEA4.2
   000312C        001000     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000313C        001100     MOVE     "COPY-TEST-2  " TO PAR-NAME.                        K7SEA4.2 44
   000314C        001200     PERFORM  PASS.                                               K7SEA4.2 194
   000315C        001300     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000316C        001400     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000317C        001500     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000318C        001600     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000319C        001700 COPY-TEST-3.                                                     K7SEA4.2
   000320C        001800     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000321C        001900     MOVE     "COPY-TEST-3  " TO PAR-NAME.                        K7SEA4.2 44
   000322C        002000     PERFORM  PASS.                                               K7SEA4.2 194
   000323C        002100     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000324C        002200     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000325C        002300     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000326C        002400     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000327C        002500 COPY-TEST-4.                                                     K7SEA4.2
   000328C        002600     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000329C        002700     MOVE     "COPY-TEST-4  " TO PAR-NAME.                        K7SEA4.2 44
   000330C        002800     PERFORM  PASS.                                               K7SEA4.2 194
   000331C        002900     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000332C        003000     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000333C        003100     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000334C        003200     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000335C        003300 COPY-TEST-5.                                                     K7SEA4.2
   000336C        003400     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000337C        003500     MOVE     "COPY-TEST-5  " TO PAR-NAME.                        K7SEA4.2 44
   000338C        003600     PERFORM  PASS.                                               K7SEA4.2 194
   000339C        003700     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340C        003800     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000341C        003900     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000342C        004000     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000343C        004100 COPY-TEST-6.                                                     K7SEA4.2
   000344C        004200     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000345C        004300     MOVE     "COPY-TEST-6  " TO PAR-NAME.                        K7SEA4.2 44
   000346C        004400     PERFORM  PASS.                                               K7SEA4.2 194
   000347C        004500     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000348C        004600     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000349C        004700     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000350C        004800     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000351C        004900 COPY-TEST-7.                                                     K7SEA4.2
   000352C        005000     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000353C        005100     MOVE     "COPY-TEST-7  " TO PAR-NAME.                        K7SEA4.2 44
   000354C        005200     PERFORM  PASS.                                               K7SEA4.2 194
   000355C        005300     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000356C        005400     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000357C        005500     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000358C        005600     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000359C        005700 COPY-TEST-8.                                                     K7SEA4.2
   000360C        005800     MOVE     "COPY-TEST-8  " TO PAR-NAME.                        K7SEA4.2 44
   000361C        005900     PERFORM  PASS.                                               K7SEA4.2 194
   000362C        006000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000363C        006100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000364C        006200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000365C        006300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000366C        006400 COPY-TEST-9.                                                     K7SEA4.2
   000367C        006500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000368C        006600     MOVE     "COPY-TEST-9  " TO PAR-NAME.                        K7SEA4.2 44
   000369C        006700     PERFORM  PASS.                                               K7SEA4.2 194
   000370C        006800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000371C        006900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000372C        007000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000373C        007100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000374C        007200 COPY-TEST-10.                                                    K7SEA4.2
   000375C        007300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000376C        007400     MOVE     "COPY-TEST-10 " TO PAR-NAME.                        K7SEA4.2 44
   000377C        007500     PERFORM  PASS.                                               K7SEA4.2 194
   000378C        007600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000379C        007700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000380C        007800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000381C        007900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000382C        008000 COPY-TEST-11.                                                    K7SEA4.2
   000383C        008100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000384C        008200     MOVE     "COPY-TEST-11 " TO PAR-NAME.                        K7SEA4.2 44
   000385C        008300     PERFORM  PASS.                                               K7SEA4.2 194
   000386C        008400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000387C        008500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000388C        008600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000389C        008700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000390C        008800 COPY-TEST-12.                                                    K7SEA4.2
   000391C        008900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000392C        009000     MOVE     "COPY-TEST-12 " TO PAR-NAME.                        K7SEA4.2 44
   000393C        009100     PERFORM  PASS.                                               K7SEA4.2 194
   000394C        009200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000395C        009300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000396C        009400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397C        009500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000398C        009600 COPY-TEST-13.                                                    K7SEA4.2
   000399C        009700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000400C        009800     MOVE     "COPY-TEST-13 " TO PAR-NAME.                        K7SEA4.2 44
   000401C        009900     PERFORM  PASS.                                               K7SEA4.2 194
   000402C        010000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000403C        010100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000404C        010200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000405C        010300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000406C        010400 COPY-TEST-14.                                                    K7SEA4.2
   000407C        010500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000408C        010600     MOVE     "COPY-TEST-14 " TO PAR-NAME.                        K7SEA4.2 44
   000409C        010700     PERFORM  PASS.                                               K7SEA4.2 194
   000410C        010800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000411C        010900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000412C        011000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000413C        011100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000414C        011200 COPY-TEST-15.                                                    K7SEA4.2
   000415C        011300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000416C        011400     MOVE     "COPY-TEST-15 " TO PAR-NAME.                        K7SEA4.2 44
   000417C        011500     PERFORM  PASS.                                               K7SEA4.2 194
   000418C        011600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000419C        011700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000420C        011800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000421C        011900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000422C        012000 COPY-TEST-16.                                                    K7SEA4.2
   000423C        012100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000424C        012200     MOVE     "COPY-TEST-16 " TO PAR-NAME.                        K7SEA4.2 44
   000425C        012300     PERFORM  PASS.                                               K7SEA4.2 194
   000426C        012400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000427C        012500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000428C        012600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000429C        012700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000430C        012800 COPY-TEST-17.                                                    K7SEA4.2
   000431C        012900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000432C        013000     MOVE     "COPY-TEST-17 " TO PAR-NAME.                        K7SEA4.2 44
   000433C        013100     PERFORM  PASS.                                               K7SEA4.2 194
   000434C        013200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000435C        013300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000436C        013400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000437C        013500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000438C        013600 COPY-TEST-18.                                                    K7SEA4.2
   000439C        013700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000440C        013800     MOVE     "COPY-TEST-18 " TO PAR-NAME.                        K7SEA4.2 44
   000441C        013900     PERFORM  PASS.                                               K7SEA4.2 194
   000442C        014000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000443C        014100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000444C        014200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000445C        014300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000446C        014400 COPY-TEST-19.                                                    K7SEA4.2
   000447C        014500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000448C        014600     MOVE     "COPY-TEST-19 " TO PAR-NAME.                        K7SEA4.2 44
   000449C        014700     PERFORM  PASS.                                               K7SEA4.2 194
   000450C        014800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000451C        014900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000452C        015000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000453C        015100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454C        015200 COPY-TEST-20.                                                    K7SEA4.2
   000455C        015300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000456C        015400     MOVE     "COPY-TEST-20 " TO PAR-NAME.                        K7SEA4.2 44
   000457C        015500     PERFORM  PASS.                                               K7SEA4.2 194
   000458C        015600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000459C        015700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000460C        015800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000461C        015900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000462C        016000 COPY-TEST-21.                                                    K7SEA4.2
   000463C        016100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000464C        016200     MOVE     "COPY-TEST-21 " TO PAR-NAME.                        K7SEA4.2 44
   000465C        016300     PERFORM  PASS.                                               K7SEA4.2 194
   000466C        016400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000467C        016500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000468C        016600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000469C        016700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000470C        016800 COPY-TEST-2I.                                                    K7SEA4.2
   000471C        016900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000472C        017000     MOVE     "COPY-TEST-22 " TO PAR-NAME.                        K7SEA4.2 44
   000473C        017100     PERFORM  PASS.                                               K7SEA4.2 194
   000474C        017200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000475C        017300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000476C        017400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000477C        017500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000478C        017600 COPY-TEST-23.                                                    K7SEA4.2
   000479C        017700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000480C        017800     MOVE     "COPY-TEST-23 " TO PAR-NAME.                        K7SEA4.2 44
   000481C        017900     PERFORM  PASS.                                               K7SEA4.2 194
   000482C        018000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000483C        018100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000484C        018200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000485C        018300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000486C        018400 COPY-TEST-24.                                                    K7SEA4.2
   000487C        018500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000488C        018600     MOVE     "COPY-TEST-24 " TO PAR-NAME.                        K7SEA4.2 44
   000489C        018700     PERFORM  PASS.                                               K7SEA4.2 194
   000490C        018800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000491C        018900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000492C        019000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000493C        019100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000494C        019200 COPY-TEST-25.                                                    K7SEA4.2
   000495C        019300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000496C        019400     MOVE     "COPY-TEST-25 " TO PAR-NAME.                        K7SEA4.2 44
   000497C        019500     PERFORM  PASS.                                               K7SEA4.2 194
   000498C        019600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000499C        019700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000500C        019800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000501C        019900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000502C        020000 COPY-TEST-26.                                                    K7SEA4.2
   000503C        020100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000504C        020200     MOVE     "COPY-TEST-26 " TO PAR-NAME.                        K7SEA4.2 44
   000505C        020300     PERFORM  PASS.                                               K7SEA4.2 194
   000506C        020400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000507C        020500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000508C        020600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000509C        020700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000510C        020800 COPY-TEST-27.                                                    K7SEA4.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511C        020900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000512C        021000     MOVE     "COPY-TEST-27 " TO PAR-NAME.                        K7SEA4.2 44
   000513C        021100     PERFORM  PASS.                                               K7SEA4.2 194
   000514C        021200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000515C        021300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000516C        021400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000517C        021500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000518C        021600 COPY-TEST-28.                                                    K7SEA4.2
   000519C        021700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000520C        021800     MOVE     "COPY-TEST-28 " TO PAR-NAME.                        K7SEA4.2 44
   000521C        021900     PERFORM  PASS.                                               K7SEA4.2 194
   000522C        022000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000523C        022100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000524C        022200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000525C        022300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000526C        022400 COPY-TEST-29.                                                    K7SEA4.2
   000527C        022500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000528C        022600     MOVE     "COPY-TEST-29 " TO PAR-NAME.                        K7SEA4.2 44
   000529C        022700     PERFORM  PASS.                                               K7SEA4.2 194
   000530C        022800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000531C        022900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000532C        023000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000533C        023100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000534C        023200 COPY-TEST-30.                                                    K7SEA4.2
   000535C        023300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000536C        023400     MOVE     "COPY-TEST-30 " TO PAR-NAME.                        K7SEA4.2 44
   000537C        023500     PERFORM  PASS.                                               K7SEA4.2 194
   000538C        023600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000539C        023700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000540C        023800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000541C        023900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000542C        024000 COPY-TEST-31.                                                    K7SEA4.2
   000543C        024100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000544C        024200     MOVE     "COPY-TEST-31 " TO PAR-NAME.                        K7SEA4.2 44
   000545C        024300     PERFORM  PASS.                                               K7SEA4.2 194
   000546C        024400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000547C        024500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000548C        024600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000549C        024700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000550C        024800 COPY-TEST-32.                                                    K7SEA4.2
   000551C        024900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000552C        025000     MOVE     "COPY-TEST-32 " TO PAR-NAME.                        K7SEA4.2 44
   000553C        025100     PERFORM  PASS.                                               K7SEA4.2 194
   000554C        025200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000555C        025300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000556C        025400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000557C        025500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000558C        025600 COPY-TEST-33.                                                    K7SEA4.2
   000559C        025700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000560C        025800     MOVE     "COPY-TEST-33 " TO PAR-NAME.                        K7SEA4.2 44
   000561C        025900     PERFORM  PASS.                                               K7SEA4.2 194
   000562C        026000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000563C        026100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000564C        026200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000565C        026300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000566C        026400 COPY-TEST-34.                                                    K7SEA4.2
   000567C        026500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568C        026600     MOVE     "COPY-TEST-34 " TO PAR-NAME.                        K7SEA4.2 44
   000569C        026700     PERFORM  PASS.                                               K7SEA4.2 194
   000570C        026800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000571C        026900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000572C        027000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000573C        027100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000574C        027200 COPY-TEST-35.                                                    K7SEA4.2
   000575C        027300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000576C        027400     MOVE     "COPY-TEST-35 " TO PAR-NAME.                        K7SEA4.2 44
   000577C        027500     PERFORM  PASS.                                               K7SEA4.2 194
   000578C        027600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000579C        027700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000580C        027800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000581C        027900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000582C        028000 COPY-TEST-36.                                                    K7SEA4.2
   000583C        028100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000584C        028200     MOVE     "COPY-TEST-36 " TO PAR-NAME.                        K7SEA4.2 44
   000585C        028300     PERFORM  PASS.                                               K7SEA4.2 194
   000586C        028400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000587C        028500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000588C        028600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000589C        028700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000590C        028800 COPY-TEST-37.                                                    K7SEA4.2
   000591C        028900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000592C        029000     MOVE     "COPY-TEST-37 " TO PAR-NAME.                        K7SEA4.2 44
   000593C        029100     PERFORM  PASS.                                               K7SEA4.2 194
   000594C        029200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000595C        029300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000596C        029400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000597C        029500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000598C        029600 COPY-TEST-38.                                                    K7SEA4.2
   000599C        029700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000600C        029800     MOVE     "COPY-TEST-38 " TO PAR-NAME.                        K7SEA4.2 44
   000601C        029900     PERFORM  PASS.                                               K7SEA4.2 194
   000602C        030000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000603C        030100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000604C        030200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000605C        030300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000606C        030400 COPY-TEST-39.                                                    K7SEA4.2
   000607C        030500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000608C        030600     MOVE     "COPY-TEST-39 " TO PAR-NAME.                        K7SEA4.2 44
   000609C        030700     PERFORM  PASS.                                               K7SEA4.2 194
   000610C        030800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000611C        030900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000612C        031000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000613C        031100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000614C        031200 COPY-TEST-40.                                                    K7SEA4.2
   000615C        031300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000616C        031400     MOVE     "COPY-TEST-40 " TO PAR-NAME.                        K7SEA4.2 44
   000617C        031500     PERFORM  PASS.                                               K7SEA4.2 194
   000618C        031600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000619C        031700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000620C        031800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000621C        031900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000622C        032000 COPY-TEST-41.                                                    K7SEA4.2
   000623C        032100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000624C        032200     MOVE     "COPY-TEST-41 " TO PAR-NAME.                        K7SEA4.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625C        032300     PERFORM  PASS.                                               K7SEA4.2 194
   000626C        032400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000627C        032500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000628C        032600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000629C        032700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000630C        032800 COPY-TEST-42.                                                    K7SEA4.2
   000631C        032900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000632C        033000     MOVE     "COPY-TEST-42 " TO PAR-NAME.                        K7SEA4.2 44
   000633C        033100     PERFORM  PASS.                                               K7SEA4.2 194
   000634C        033200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000635C        033300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000636C        033400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000637C        033500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000638C        033600 COPY-TEST-43.                                                    K7SEA4.2
   000639C        033700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000640C        033800     MOVE     "COPY-TEST-43 " TO PAR-NAME.                        K7SEA4.2 44
   000641C        033900     PERFORM  PASS.                                               K7SEA4.2 194
   000642C        034000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000643C        034100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000644C        034200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000645C        034300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000646C        034400 COPY-TEST-44.                                                    K7SEA4.2
   000647C        034500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000648C        034600     MOVE     "COPY-TEST-44 " TO PAR-NAME.                        K7SEA4.2 44
   000649C        034700     PERFORM  PASS.                                               K7SEA4.2 194
   000650C        034800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000651C        034900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000652C        035000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000653C        035100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000654C        035200 COPY-TEST-45.                                                    K7SEA4.2
   000655C        035300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000656C        035400     MOVE     "COPY-TEST-45 " TO PAR-NAME.                        K7SEA4.2 44
   000657C        035500     PERFORM  PASS.                                               K7SEA4.2 194
   000658C        035600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000659C        035700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000660C        035800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000661C        035900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000662C        036000 COPY-TEST-46.                                                    K7SEA4.2
   000663C        036100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000664C        036200     MOVE     "COPY-TEST-46 " TO PAR-NAME.                        K7SEA4.2 44
   000665C        036300     PERFORM  PASS.                                               K7SEA4.2 194
   000666C        036400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000667C        036500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000668C        036600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000669C        036700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000670C        036800 COPY-TEST-47.                                                    K7SEA4.2
   000671C        036900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000672C        037000     MOVE     "COPY-TEST-47 " TO PAR-NAME.                        K7SEA4.2 44
   000673C        037100     PERFORM  PASS.                                               K7SEA4.2 194
   000674C        037200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000675C        037300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000676C        037400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000677C        037500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000678C        037600 COPY-TEST-48.                                                    K7SEA4.2
   000679C        037700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000680C        037800     MOVE     "COPY-TEST-48 " TO PAR-NAME.                        K7SEA4.2 44
   000681C        037900     PERFORM  PASS.                                               K7SEA4.2 194
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682C        038000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000683C        038100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000684C        038200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000685C        038300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000686C        038400 COPY-TEST-49.                                                    K7SEA4.2
   000687C        038500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000688C        038600     MOVE     "COPY-TEST-49 " TO PAR-NAME.                        K7SEA4.2 44
   000689C        038700     PERFORM  PASS.                                               K7SEA4.2 194
   000690C        038800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000691C        038900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000692C        039000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000693C        039100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000694C        039200 COPY-TEST-50.                                                    K7SEA4.2
   000695C        039300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000696C        039400     MOVE     "COPY-TEST-50 " TO PAR-NAME.                        K7SEA4.2 44
   000697C        039500     PERFORM  PASS.                                               K7SEA4.2 194
   000698C        039600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000699C        039700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000700C        039800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000701C        039900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000702C        040000 COPY-TEST-51.                                                    K7SEA4.2
   000703C        040100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000704C        040200     MOVE     "COPY-TEST-51 " TO PAR-NAME.                        K7SEA4.2 44
   000705C        040300     PERFORM  PASS.                                               K7SEA4.2 194
   000706C        040400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000707C        040500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000708C        040600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000709C        040700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000710C        040800 COPY-TEST-52.                                                    K7SEA4.2
   000711C        040900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000712C        041000     MOVE     "COPY-TEST-52 " TO PAR-NAME.                        K7SEA4.2 44
   000713C        041100     PERFORM  PASS.                                               K7SEA4.2 194
   000714C        041200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000715C        041300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000716C        041400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000717C        041500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000718C        041600 COPY-TEST-53.                                                    K7SEA4.2
   000719C        041700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000720C        041800     MOVE     "COPY-TEST-53 " TO PAR-NAME.                        K7SEA4.2 44
   000721C        041900     PERFORM  PASS.                                               K7SEA4.2 194
   000722C        042000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000723C        042100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000724C        042200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000725C        042300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000726C        042400 COPY-TEST-54.                                                    K7SEA4.2
   000727C        042500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000728C        042600     MOVE     "COPY-TEST-54 " TO PAR-NAME.                        K7SEA4.2 44
   000729C        042700     PERFORM  PASS.                                               K7SEA4.2 194
   000730C        042800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000731C        042900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000732C        043000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000733C        043100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000734C        043200 COPY-TEST-55.                                                    K7SEA4.2
   000735C        043300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000736C        043400     MOVE     "COPY-TEST-55 " TO PAR-NAME.                        K7SEA4.2 44
   000737C        043500     PERFORM  PASS.                                               K7SEA4.2 194
   000738C        043600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739C        043700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000740C        043800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000741C        043900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000742C        044000 COPY-TEST-56.                                                    K7SEA4.2
   000743C        044100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000744C        044200     MOVE     "COPY-TEST-56 " TO PAR-NAME.                        K7SEA4.2 44
   000745C        044300     PERFORM  PASS.                                               K7SEA4.2 194
   000746C        044400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000747C        044500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000748C        044600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000749C        044700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000750C        044800 COPY-TEST-57.                                                    K7SEA4.2
   000751C        044900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000752C        045000     MOVE     "COPY-TEST-57 " TO PAR-NAME.                        K7SEA4.2 44
   000753C        045100     PERFORM  PASS.                                               K7SEA4.2 194
   000754C        045200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000755C        045300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000756C        045400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000757C        045500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000758C        045600 COPY-TEST-58.                                                    K7SEA4.2
   000759C        045700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000760C        045800     MOVE     "COPY-TEST-58 " TO PAR-NAME.                        K7SEA4.2 44
   000761C        045900     PERFORM  PASS.                                               K7SEA4.2 194
   000762C        046000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000763C        046100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000764C        046200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000765C        046300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000766C        046400 COPY-TEST-59.                                                    K7SEA4.2
   000767C        046500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000768C        046600     MOVE     "COPY-TEST-59 " TO PAR-NAME.                        K7SEA4.2 44
   000769C        046700     PERFORM  PASS.                                               K7SEA4.2 194
   000770C        046800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000771C        046900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000772C        047000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000773C        047100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000774C        047200 COPY-TEST-60.                                                    K7SEA4.2
   000775C        047300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000776C        047400     MOVE     "COPY-TEST-60 " TO PAR-NAME.                        K7SEA4.2 44
   000777C        047500     PERFORM  PASS.                                               K7SEA4.2 194
   000778C        047600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000779C        047700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000780C        047800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000781C        047900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000782C        048000 COPY-TEST-61.                                                    K7SEA4.2
   000783C        048100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000784C        048200     MOVE     "COPY-TEST-61 " TO PAR-NAME.                        K7SEA4.2 44
   000785C        048300     PERFORM  PASS.                                               K7SEA4.2 194
   000786C        048400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000787C        048500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000788C        048600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000789C        048700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000790C        048800 COPY-TEST-62.                                                    K7SEA4.2
   000791C        048900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000792C        049000     MOVE     "COPY-TEST-62 " TO PAR-NAME.                        K7SEA4.2 44
   000793C        049100     PERFORM  PASS.                                               K7SEA4.2 194
   000794C        049200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000795C        049300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796C        049400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000797C        049500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000798C        049600 COPY-TEST-63.                                                    K7SEA4.2
   000799C        049700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000800C        049800     MOVE     "COPY-TEST-63 " TO PAR-NAME.                        K7SEA4.2 44
   000801C        049900     PERFORM  PASS.                                               K7SEA4.2 194
   000802C        050000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000803C        050100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000804C        050200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000805C        050300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000806C        050400 COPY-TEST-64.                                                    K7SEA4.2
   000807C        050500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000808C        050600     MOVE     "COPY-TEST-64 " TO PAR-NAME.                        K7SEA4.2 44
   000809C        050700     PERFORM  PASS.                                               K7SEA4.2 194
   000810C        050800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000811C        050900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000812C        051000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000813C        051100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000814C        051200 COPY-TEST-65.                                                    K7SEA4.2
   000815C        051300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000816C        051400     MOVE     "COPY-TEST-65 " TO PAR-NAME.                        K7SEA4.2 44
   000817C        051500     PERFORM  PASS.                                               K7SEA4.2 194
   000818C        051600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000819C        051700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000820C        051800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000821C        051900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000822C        052000 COPY-TEST-66.                                                    K7SEA4.2
   000823C        052100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000824C        052200     MOVE     "COPY-TEST-66 " TO PAR-NAME.                        K7SEA4.2 44
   000825C        052300     PERFORM  PASS.                                               K7SEA4.2 194
   000826C        052400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000827C        052500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000828C        052600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000829C        052700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000830C        052800 COPY-TEST-67.                                                    K7SEA4.2
   000831C        052900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000832C        053000     MOVE     "COPY-TEST-67 " TO PAR-NAME.                        K7SEA4.2 44
   000833C        053100     PERFORM  PASS.                                               K7SEA4.2 194
   000834C        053200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000835C        053300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000836C        053400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000837C        053500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000838C        053600 COPY-TEST-68.                                                    K7SEA4.2
   000839C        053700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000840C        053800     MOVE     "COPY-TEST-68 " TO PAR-NAME.                        K7SEA4.2 44
   000841C        053900     PERFORM  PASS.                                               K7SEA4.2 194
   000842C        054000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000843C        054100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000844C        054200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000845C        054300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000846C        054400 COPY-TEST-69.                                                    K7SEA4.2
   000847C        054500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000848C        054600     MOVE     "COPY-TEST-69 " TO PAR-NAME.                        K7SEA4.2 44
   000849C        054700     PERFORM  PASS.                                               K7SEA4.2 194
   000850C        054800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000851C        054900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000852C        055000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853C        055100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000854C        055200 COPY-TEST-70.                                                    K7SEA4.2
   000855C        055300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000856C        055400     MOVE     "COPY-TEST-70 " TO PAR-NAME.                        K7SEA4.2 44
   000857C        055500     PERFORM  PASS.                                               K7SEA4.2 194
   000858C        055600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000859C        055700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000860C        055800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000861C        055900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000862C        056000 COPY-TEST-71.                                                    K7SEA4.2
   000863C        056100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000864C        056200     MOVE     "COPY-TEST-71 " TO PAR-NAME.                        K7SEA4.2 44
   000865C        056300     PERFORM  PASS.                                               K7SEA4.2 194
   000866C        056400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000867C        056500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000868C        056600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000869C        056700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000870C        056800 COPY-TEST-72.                                                    K7SEA4.2
   000871C        056900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000872C        057000     MOVE     "COPY-TEST-72 " TO PAR-NAME.                        K7SEA4.2 44
   000873C        057100     PERFORM  PASS.                                               K7SEA4.2 194
   000874C        057200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000875C        057300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000876C        057400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000877C        057500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000878C        057600 COPY-TEST-73.                                                    K7SEA4.2
   000879C        057700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000880C        057800     MOVE     "COPY-TEST-73 " TO PAR-NAME.                        K7SEA4.2 44
   000881C        057900     PERFORM  PASS.                                               K7SEA4.2 194
   000882C        058000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000883C        058100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000884C        058200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000885C        058300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000886C        058400 COPY-TEST-74.                                                    K7SEA4.2
   000887C        058500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000888C        058600     MOVE     "COPY-TEST-74 " TO PAR-NAME.                        K7SEA4.2 44
   000889C        058700     PERFORM  PASS.                                               K7SEA4.2 194
   000890C        058800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000891C        058900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000892C        059000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000893C        059100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000894C        059200 COPY-TEST-75.                                                    K7SEA4.2
   000895C        059300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000896C        059400     MOVE     "COPY-TEST-75 " TO PAR-NAME.                        K7SEA4.2 44
   000897C        059500     PERFORM  PASS.                                               K7SEA4.2 194
   000898C        059600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000899C        059700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000900C        059800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000901C        059900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000902C        060000 COPY-TEST-76.                                                    K7SEA4.2
   000903C        060100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000904C        060200     MOVE     "COPY-TEST-76 " TO PAR-NAME.                        K7SEA4.2 44
   000905C        060300     PERFORM  PASS.                                               K7SEA4.2 194
   000906C        060400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000907C        060500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000908C        060600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000909C        060700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910C        060800 COPY-TEST-77.                                                    K7SEA4.2
   000911C        060900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000912C        061000     MOVE     "COPY-TEST-77 " TO PAR-NAME.                        K7SEA4.2 44
   000913C        061100     PERFORM  PASS.                                               K7SEA4.2 194
   000914C        061200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000915C        061300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000916C        061400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000917C        061500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000918C        061600 COPY-TEST-78.                                                    K7SEA4.2
   000919C        061700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000920C        061800     MOVE     "COPY-TEST-78 " TO PAR-NAME.                        K7SEA4.2 44
   000921C        061900     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000922C        062000     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000923C        062100     PERFORM  PASS.                                               K7SEA4.2 194
   000924C        062200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000925C        062300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000926C        062400 COPY-TEST-79.                                                    K7SEA4.2
   000927C        062500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000928C        062600     MOVE     "COPY-TEST-79 " TO PAR-NAME.                        K7SEA4.2 44
   000929C        062700     PERFORM  PASS.                                               K7SEA4.2 194
   000930C        062800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000931C        062900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000932C        063000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000933C        063100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000934C        063200 COPY-TEST-80.                                                    K7SEA4.2
   000935C        063300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000936C        063400     MOVE     "COPY-TEST-80 " TO PAR-NAME.                        K7SEA4.2 44
   000937C        063500     PERFORM  PASS.                                               K7SEA4.2 194
   000938C        063600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000939C        063700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000940C        063800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000941C        063900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000942C        064000 COPY-TEST-81.                                                    K7SEA4.2
   000943C        064100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000944C        064200     MOVE     "COPY-TEST-81 " TO PAR-NAME.                        K7SEA4.2 44
   000945C        064300     PERFORM  PASS.                                               K7SEA4.2 194
   000946C        064400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000947C        064500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000948C        064600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000949C        064700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000950C        064800 COPY-TEST-82.                                                    K7SEA4.2
   000951C        064900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000952C        065000     MOVE     "COPY-TEST-82 " TO PAR-NAME.                        K7SEA4.2 44
   000953C        065100     PERFORM  PASS.                                               K7SEA4.2 194
   000954C        065200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000955C        065300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000956C        065400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000957C        065500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000958C        065600 COPY-TEST-83.                                                    K7SEA4.2
   000959C        065700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000960C        065800     MOVE     "COPY-TEST-83 " TO PAR-NAME.                        K7SEA4.2 44
   000961C        065900     PERFORM  PASS.                                               K7SEA4.2 194
   000962C        066000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000963C        066100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000964C        066200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000965C        066300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000966C        066400 COPY-TEST-84.                                                    K7SEA4.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967C        066500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000968C        066600     MOVE     "COPY-TEST-84 " TO PAR-NAME.                        K7SEA4.2 44
   000969C        066700     PERFORM  PASS.                                               K7SEA4.2 194
   000970C        066800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000971C        066900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000972C        067000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000973C        067100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000974C        067200 COPY-TEST-85.                                                    K7SEA4.2
   000975C        067300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000976C        067400     MOVE     "COPY-TEST-85 " TO PAR-NAME.                        K7SEA4.2 44
   000977C        067500     PERFORM  PASS.                                               K7SEA4.2 194
   000978C        067600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000979C        067700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000980C        067800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000981C        067900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000982C        068000 COPY-TEST-86.                                                    K7SEA4.2
   000983C        068100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000984C        068200     MOVE     "COPY-TEST-86 " TO PAR-NAME.                        K7SEA4.2 44
   000985C        068300     PERFORM  PASS.                                               K7SEA4.2 194
   000986C        068400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000987C        068500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000988C        068600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000989C        068700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000990C        068800 COPY-TEST-87.                                                    K7SEA4.2
   000991C        068900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   000992C        069000     MOVE     "COPY-TEST-87 " TO PAR-NAME.                        K7SEA4.2 44
   000993C        069100     PERFORM  PASS.                                               K7SEA4.2 194
   000994C        069200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   000995C        069300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   000996C        069400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   000997C        069500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   000998C        069600 COPY-TEST-88.                                                    K7SEA4.2
   000999C        069700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001000C        069800     MOVE     "COPY-TEST-88 " TO PAR-NAME.                        K7SEA4.2 44
   001001C        069900     PERFORM  PASS.                                               K7SEA4.2 194
   001002C        070000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001003C        070100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001004C        070200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001005C        070300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001006C        070400 COPY-TEST-89.                                                    K7SEA4.2
   001007C        070500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001008C        070600     MOVE     "COPY-TEST-89 " TO PAR-NAME.                        K7SEA4.2 44
   001009C        070700     PERFORM  PASS.                                               K7SEA4.2 194
   001010C        070800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001011C        070900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001012C        071000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001013C        071100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001014C        071200 COPY-TEST-90.                                                    K7SEA4.2
   001015C        071300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001016C        071400     MOVE     "COPY-TEST-90 " TO PAR-NAME.                        K7SEA4.2 44
   001017C        071500     PERFORM  PASS.                                               K7SEA4.2 194
   001018C        071600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001019C        071700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001020C        071800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001021C        071900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001022C        072000 COPY-TEST-91.                                                    K7SEA4.2
   001023C        072100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024C        072200     MOVE     "COPY-TEST-91 " TO PAR-NAME.                        K7SEA4.2 44
   001025C        072300     PERFORM  PASS.                                               K7SEA4.2 194
   001026C        072400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001027C        072500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001028C        072600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001029C        072700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001030C        072800 COPY-TEST-92.                                                    K7SEA4.2
   001031C        072900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001032C        073000     MOVE     "COPY-TEST-92 " TO PAR-NAME.                        K7SEA4.2 44
   001033C        073100     PERFORM  PASS.                                               K7SEA4.2 194
   001034C        073200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001035C        073300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001036C        073400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001037C        073500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001038C        073600 COPY-TEST-93.                                                    K7SEA4.2
   001039C        073700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001040C        073800     MOVE     "COPY-TEST-93 " TO PAR-NAME.                        K7SEA4.2 44
   001041C        073900     PERFORM  PASS.                                               K7SEA4.2 194
   001042C        074000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001043C        074100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001044C        074200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001045C        074300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001046C        074400 COPY-TEST-94.                                                    K7SEA4.2
   001047C        074500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001048C        074600     MOVE     "COPY-TEST-94 " TO PAR-NAME.                        K7SEA4.2 44
   001049C        074700     PERFORM  PASS.                                               K7SEA4.2 194
   001050C        074800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001051C        074900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001052C        075000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001053C        075100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001054C        075200 COPY-TEST-95.                                                    K7SEA4.2
   001055C        075300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001056C        075400     MOVE     "COPY-TEST-95 " TO PAR-NAME.                        K7SEA4.2 44
   001057C        075500     PERFORM  PASS.                                               K7SEA4.2 194
   001058C        075600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001059C        075700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001060C        075800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001061C        075900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001062C        076000 COPY-TEST-96.                                                    K7SEA4.2
   001063C        076100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001064C        076200     MOVE     "COPY-TEST-96 " TO PAR-NAME.                        K7SEA4.2 44
   001065C        076300     PERFORM  PASS.                                               K7SEA4.2 194
   001066C        076400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001067C        076500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001068C        076600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001069C        076700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001070C        076800 COPY-TEST-97.                                                    K7SEA4.2
   001071C        076900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001072C        077000     MOVE     "COPY-TEST-97 " TO PAR-NAME.                        K7SEA4.2 44
   001073C        077100     PERFORM  PASS.                                               K7SEA4.2 194
   001074C        077200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001075C        077300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001076C        077400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001077C        077500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001078C        077600 COPY-TEST-98.                                                    K7SEA4.2
   001079C        077700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001080C        077800     MOVE     "COPY-TEST-98 " TO PAR-NAME.                        K7SEA4.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081C        077900     PERFORM  PASS.                                               K7SEA4.2 194
   001082C        078000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001083C        078100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001084C        078200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001085C        078300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001086C        078400 COPY-TEST-99.                                                    K7SEA4.2
   001087C        078500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001088C        078600     MOVE     "COPY-TEST-99 " TO PAR-NAME.                        K7SEA4.2 44
   001089C        078700     PERFORM  PASS.                                               K7SEA4.2 194
   001090C        078800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001091C        078900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001092C        079000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001093C        079100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001094C        079200 COPY-TEST-100.                                                   K7SEA4.2
   001095C        079300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001096C        079400     MOVE     "COPY-TEST-100" TO PAR-NAME.                        K7SEA4.2 44
   001097C        079500     PERFORM  PASS.                                               K7SEA4.2 194
   001098C        079600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001099C        079700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001100C        079800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001101C        079900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001102C        080000 COPY-TEST-101.                                                   K7SEA4.2
   001103C        080100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001104C        080200     MOVE     "COPY-TEST-101" TO PAR-NAME.                        K7SEA4.2 44
   001105C        080300     PERFORM  PASS.                                               K7SEA4.2 194
   001106C        080400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001107C        080500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001108C        080600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001109C        080700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001110C        080800 COPY-TEST-102.                                                   K7SEA4.2
   001111C        080900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001112C        081000     MOVE     "COPY-TEST-102" TO PAR-NAME.                        K7SEA4.2 44
   001113C        081100     PERFORM  PASS.                                               K7SEA4.2 194
   001114C        081200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001115C        081300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001116C        081400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001117C        081500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001118C        081600 COPY-TEST-103.                                                   K7SEA4.2
   001119C        081700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001120C        081800     MOVE     "COPY-TEST-103" TO PAR-NAME.                        K7SEA4.2 44
   001121C        081900     PERFORM  PASS.                                               K7SEA4.2 194
   001122C        082000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001123C        082100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001124C        082200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001125C        082300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001126C        082400 COPY-TEST-104.                                                   K7SEA4.2
   001127C        082500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001128C        082600     MOVE     "COPY-TEST-104" TO PAR-NAME.                        K7SEA4.2 44
   001129C        082700     PERFORM  PASS.                                               K7SEA4.2 194
   001130C        082800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001131C        082900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001132C        083000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001133C        083100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001134C        083200 COPY-TEST-105.                                                   K7SEA4.2
   001135C        083300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001136C        083400     MOVE     "COPY-TEST-105" TO PAR-NAME.                        K7SEA4.2 44
   001137C        083500     PERFORM  PASS.                                               K7SEA4.2 194
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138C        083600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001139C        083700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001140C        083800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001141C        083900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001142C        084000 COPY-TEST-106.                                                   K7SEA4.2
   001143C        084100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001144C        084200     MOVE     "COPY-TEST-106" TO PAR-NAME.                        K7SEA4.2 44
   001145C        084300     PERFORM  PASS.                                               K7SEA4.2 194
   001146C        084400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001147C        084500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001148C        084600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001149C        084700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001150C        084800 COPY-TEST-107.                                                   K7SEA4.2
   001151C        084900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001152C        085000     MOVE     "COPY-TEST-107" TO PAR-NAME.                        K7SEA4.2 44
   001153C        085100     PERFORM  PASS.                                               K7SEA4.2 194
   001154C        085200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001155C        085300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001156C        085400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001157C        085500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001158C        085600 COPY-TEST-108.                                                   K7SEA4.2
   001159C        085700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001160C        085800     MOVE     "COPY-TEST-108" TO PAR-NAME.                        K7SEA4.2 44
   001161C        085900     PERFORM  PASS.                                               K7SEA4.2 194
   001162C        086000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001163C        086100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001164C        086200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001165C        086300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001166C        086400 COPY-TEST-109.                                                   K7SEA4.2
   001167C        086500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001168C        086600     MOVE     "COPY-TEST-109" TO PAR-NAME.                        K7SEA4.2 44
   001169C        086700     PERFORM  PASS.                                               K7SEA4.2 194
   001170C        086800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001171C        086900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001172C        087000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001173C        087100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001174C        087200 COPY-TEST-110.                                                   K7SEA4.2
   001175C        087300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001176C        087400     MOVE     "COPY-TEST-110" TO PAR-NAME.                        K7SEA4.2 44
   001177C        087500     PERFORM  PASS.                                               K7SEA4.2 194
   001178C        087600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001179C        087700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001180C        087800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001181C        087900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001182C        088000 COPY-TEST-111.                                                   K7SEA4.2
   001183C        088100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001184C        088200     MOVE     "COPY-TEST-111" TO PAR-NAME.                        K7SEA4.2 44
   001185C        088300     PERFORM  PASS.                                               K7SEA4.2 194
   001186C        088400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001187C        088500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001188C        088600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001189C        088700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001190C        088800 COPY-TEST-112.                                                   K7SEA4.2
   001191C        088900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001192C        089000     MOVE     "COPY-TEST-112" TO PAR-NAME.                        K7SEA4.2 44
   001193C        089100     PERFORM  PASS.                                               K7SEA4.2 194
   001194C        089200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195C        089300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001196C        089400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001197C        089500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001198C        089600 COPY-TEST-113.                                                   K7SEA4.2
   001199C        089700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001200C        089800     MOVE     "COPY-TEST-113" TO PAR-NAME.                        K7SEA4.2 44
   001201C        089900     PERFORM  PASS.                                               K7SEA4.2 194
   001202C        090000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001203C        090100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001204C        090200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001205C        090300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001206C        090400 COPY-TEST-114.                                                   K7SEA4.2
   001207C        090500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001208C        090600     MOVE     "COPY-TEST-114" TO PAR-NAME.                        K7SEA4.2 44
   001209C        090700     PERFORM  PASS.                                               K7SEA4.2 194
   001210C        090800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001211C        090900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001212C        091000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001213C        091100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001214C        091200 COPY-TEST-115.                                                   K7SEA4.2
   001215C        091300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001216C        091400     MOVE     "COPY-TEST-115" TO PAR-NAME.                        K7SEA4.2 44
   001217C        091500     PERFORM  PASS.                                               K7SEA4.2 194
   001218C        091600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001219C        091700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001220C        091800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001221C        091900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001222C        092000 COPY-TEST-116.                                                   K7SEA4.2
   001223C        092100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001224C        092200     MOVE     "COPY-TEST-116" TO PAR-NAME.                        K7SEA4.2 44
   001225C        092300     PERFORM  PASS.                                               K7SEA4.2 194
   001226C        092400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001227C        092500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001228C        092600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001229C        092700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001230C        092800 COPY-TEST-117.                                                   K7SEA4.2
   001231C        092900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001232C        093000     MOVE     "COPY-TEST-117" TO PAR-NAME.                        K7SEA4.2 44
   001233C        093100     PERFORM  PASS.                                               K7SEA4.2 194
   001234C        093200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001235C        093300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001236C        093400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001237C        093500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001238C        093600 COPY-TEST-118.                                                   K7SEA4.2
   001239C        093700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001240C        093800     MOVE     "COPY-TEST-118" TO PAR-NAME.                        K7SEA4.2 44
   001241C        093900     PERFORM  PASS.                                               K7SEA4.2 194
   001242C        094000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001243C        094100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001244C        094200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001245C        094300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001246C        094400 COPY-TEST-119.                                                   K7SEA4.2
   001247C        094500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001248C        094600     MOVE     "COPY-TEST-119" TO PAR-NAME.                        K7SEA4.2 44
   001249C        094700     PERFORM  PASS.                                               K7SEA4.2 194
   001250C        094800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001251C        094900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252C        095000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001253C        095100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001254C        095200 COPY-TEST-120.                                                   K7SEA4.2
   001255C        095300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001256C        095400     MOVE     "COPY-TEST-120" TO PAR-NAME.                        K7SEA4.2 44
   001257C        095500     PERFORM  PASS.                                               K7SEA4.2 194
   001258C        095600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001259C        095700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001260C        095800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001261C        095900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001262C        096000 COPY-TEST-121.                                                   K7SEA4.2
   001263C        096100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001264C        096200     MOVE     "COPY-TEST-121" TO PAR-NAME.                        K7SEA4.2 44
   001265C        096300     PERFORM  PASS.                                               K7SEA4.2 194
   001266C        096400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001267C        096500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001268C        096600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001269C        096700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001270C        096800 COPY-TEST-122.                                                   K7SEA4.2
   001271C        096900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001272C        097000     MOVE     "COPY-TEST-122" TO PAR-NAME.                        K7SEA4.2 44
   001273C        097100     PERFORM  PASS.                                               K7SEA4.2 194
   001274C        097200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001275C        097300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001276C        097400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001277C        097500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001278C        097600 COPY-TEST-123.                                                   K7SEA4.2
   001279C        097700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001280C        097800     MOVE     "COPY-TEST-123" TO PAR-NAME.                        K7SEA4.2 44
   001281C        097900     PERFORM  PASS.                                               K7SEA4.2 194
   001282C        098000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001283C        098100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001284C        098200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001285C        098300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001286C        098400 COPY-TEST-124.                                                   K7SEA4.2
   001287C        098500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001288C        098600     MOVE     "COPY-TEST-124" TO PAR-NAME.                        K7SEA4.2 44
   001289C        098700     PERFORM  PASS.                                               K7SEA4.2 194
   001290C        098800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001291C        098900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001292C        099000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001293C        099100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001294C        099200 COPY-TEST-125.                                                   K7SEA4.2
   001295C        099300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001296C        099400     MOVE     "COPY-TEST-125" TO PAR-NAME.                        K7SEA4.2 44
   001297C        099500     PERFORM  PASS.                                               K7SEA4.2 194
   001298C        099600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001299C        099700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001300C        099800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001301C        099900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001302C        100000 COPY-TEST-126.                                                   K7SEA4.2
   001303C        100100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001304C        100200     MOVE     "COPY-TEST-126" TO PAR-NAME.                        K7SEA4.2 44
   001305C        100300     PERFORM  PASS.                                               K7SEA4.2 194
   001306C        100400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001307C        100500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001308C        100600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309C        100700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001310C        100800 COPY-TEST-127.                                                   K7SEA4.2
   001311C        100900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001312C        101000     MOVE     "COPY-TEST-127" TO PAR-NAME.                        K7SEA4.2 44
   001313C        101100     PERFORM  PASS.                                               K7SEA4.2 194
   001314C        101200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001315C        101300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001316C        101400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001317C        101500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001318C        101600 COPY-TEST-128.                                                   K7SEA4.2
   001319C        101700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001320C        101800     MOVE     "COPY-TEST-128" TO PAR-NAME.                        K7SEA4.2 44
   001321C        101900     PERFORM  PASS.                                               K7SEA4.2 194
   001322C        102000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001323C        102100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001324C        102200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001325C        102300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001326C        102400 COPY-TEST-129.                                                   K7SEA4.2
   001327C        102500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001328C        102600     MOVE     "COPY-TEST-129" TO PAR-NAME.                        K7SEA4.2 44
   001329C        102700     PERFORM  PASS.                                               K7SEA4.2 194
   001330C        102800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001331C        102900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001332C        103000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001333C        103100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001334C        103200 COPY-TEST-130.                                                   K7SEA4.2
   001335C        103300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001336C        103400     MOVE     "COPY-TEST-130" TO PAR-NAME.                        K7SEA4.2 44
   001337C        103500     PERFORM  PASS.                                               K7SEA4.2 194
   001338C        103600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001339C        103700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001340C        103800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001341C        103900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001342C        104000 COPY-TEST-131.                                                   K7SEA4.2
   001343C        104100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001344C        104200     MOVE     "COPY-TEST-131" TO PAR-NAME.                        K7SEA4.2 44
   001345C        104300     PERFORM  PASS.                                               K7SEA4.2 194
   001346C        104400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001347C        104500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001348C        104600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001349C        104700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001350C        104800 COPY-TEST-132.                                                   K7SEA4.2
   001351C        104900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001352C        105000     MOVE     "COPY-TEST-132" TO PAR-NAME.                        K7SEA4.2 44
   001353C        105100     PERFORM  PASS.                                               K7SEA4.2 194
   001354C        105200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001355C        105300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001356C        105400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001357C        105500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001358C        105600 COPY-TEST-133.                                                   K7SEA4.2
   001359C        105700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001360C        105800     MOVE     "COPY-TEST-133" TO PAR-NAME.                        K7SEA4.2 44
   001361C        105900     PERFORM  PASS.                                               K7SEA4.2 194
   001362C        106000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001363C        106100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001364C        106200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001365C        106300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366C        106400 COPY-TEST-134.                                                   K7SEA4.2
   001367C        106500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001368C        106600     MOVE     "COPY-TEST-134" TO PAR-NAME.                        K7SEA4.2 44
   001369C        106700     PERFORM  PASS.                                               K7SEA4.2 194
   001370C        106800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001371C        106900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001372C        107000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001373C        107100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001374C        107200 COPY-TEST-135.                                                   K7SEA4.2
   001375C        107300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001376C        107400     MOVE     "COPY-TEST-135" TO PAR-NAME.                        K7SEA4.2 44
   001377C        107500     PERFORM  PASS.                                               K7SEA4.2 194
   001378C        107600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001379C        107700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001380C        107800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001381C        107900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001382C        108000 COPY-TEST-136.                                                   K7SEA4.2
   001383C        108100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001384C        108200     MOVE     "COPY-TEST-136" TO PAR-NAME.                        K7SEA4.2 44
   001385C        108300     PERFORM  PASS.                                               K7SEA4.2 194
   001386C        108400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001387C        108500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001388C        108600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001389C        108700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001390C        108800 COPY-TEST-137.                                                   K7SEA4.2
   001391C        108900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001392C        109000     MOVE     "COPY-TEST-137" TO PAR-NAME.                        K7SEA4.2 44
   001393C        109100     PERFORM  PASS.                                               K7SEA4.2 194
   001394C        109200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001395C        109300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001396C        109400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001397C        109500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001398C        109600 COPY-TEST-138.                                                   K7SEA4.2
   001399C        109700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001400C        109800     MOVE     "COPY-TEST-138" TO PAR-NAME.                        K7SEA4.2 44
   001401C        109900     PERFORM  PASS.                                               K7SEA4.2 194
   001402C        110000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001403C        110100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001404C        110200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001405C        110300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001406C        110400 COPY-TEST-139.                                                   K7SEA4.2
   001407C        110500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001408C        110600     MOVE     "COPY-TEST-139" TO PAR-NAME.                        K7SEA4.2 44
   001409C        110700     PERFORM  PASS.                                               K7SEA4.2 194
   001410C        110800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001411C        110900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001412C        111000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001413C        111100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001414C        111200 COPY-TEST-140.                                                   K7SEA4.2
   001415C        111300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001416C        111400     MOVE     "COPY-TEST-140" TO PAR-NAME.                        K7SEA4.2 44
   001417C        111500     PERFORM  PASS.                                               K7SEA4.2 194
   001418C        111600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001419C        111700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001420C        111800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001421C        111900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001422C        112000 COPY-TEST-141.                                                   K7SEA4.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423C        112100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001424C        112200     MOVE     "COPY-TEST-141" TO PAR-NAME.                        K7SEA4.2 44
   001425C        112300     PERFORM  PASS.                                               K7SEA4.2 194
   001426C        112400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001427C        112500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001428C        112600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001429C        112700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001430C        112800 COPY-TEST-142.                                                   K7SEA4.2
   001431C        112900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001432C        113000     MOVE     "COPY-TEST-142" TO PAR-NAME.                        K7SEA4.2 44
   001433C        113100     PERFORM  PASS.                                               K7SEA4.2 194
   001434C        113200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001435C        113300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001436C        113400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001437C        113500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001438C        113600 COPY-TEST-143.                                                   K7SEA4.2
   001439C        113700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001440C        113800     MOVE     "COPY-TEST-143" TO PAR-NAME.                        K7SEA4.2 44
   001441C        113900     PERFORM  PASS.                                               K7SEA4.2 194
   001442C        114000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001443C        114100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001444C        114200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001445C        114300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001446C        114400 COPY-TEST-144.                                                   K7SEA4.2
   001447C        114500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001448C        114600     MOVE     "COPY-TEST-144" TO PAR-NAME.                        K7SEA4.2 44
   001449C        114700     PERFORM  PASS.                                               K7SEA4.2 194
   001450C        114800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001451C        114900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001452C        115000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001453C        115100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001454C        115200 COPY-TEST-145.                                                   K7SEA4.2
   001455C        115300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001456C        115400     MOVE     "COPY-TEST-145" TO PAR-NAME.                        K7SEA4.2 44
   001457C        115500     PERFORM  PASS.                                               K7SEA4.2 194
   001458C        115600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001459C        115700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001460C        115800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001461C        115900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001462C        116000 COPY-TEST-146.                                                   K7SEA4.2
   001463C        116100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001464C        116200     MOVE     "COPY-TEST-146" TO PAR-NAME.                        K7SEA4.2 44
   001465C        116300     PERFORM  PASS.                                               K7SEA4.2 194
   001466C        116400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001467C        116500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001468C        116600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001469C        116700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001470C        116800 COPY-TEST-147.                                                   K7SEA4.2
   001471C        116900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001472C        117000     MOVE     "COPY-TEST-147" TO PAR-NAME.                        K7SEA4.2 44
   001473C        117100     PERFORM  PASS.                                               K7SEA4.2 194
   001474C        117200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001475C        117300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001476C        117400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001477C        117500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001478C        117600 COPY-TEST-148.                                                   K7SEA4.2
   001479C        117700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480C        117800     MOVE     "COPY-TEST-148" TO PAR-NAME.                        K7SEA4.2 44
   001481C        117900     PERFORM  PASS.                                               K7SEA4.2 194
   001482C        118000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001483C        118100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001484C        118200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001485C        118300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001486C        118400 COPY-TEST-149.                                                   K7SEA4.2
   001487C        118500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001488C        118600     MOVE     "COPY-TEST-149" TO PAR-NAME.                        K7SEA4.2 44
   001489C        118700     PERFORM  PASS.                                               K7SEA4.2 194
   001490C        118800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001491C        118900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001492C        119000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001493C        119100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001494C        119200 COPY-TEST-150.                                                   K7SEA4.2
   001495C        119300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001496C        119400     MOVE     "COPY-TEST-150" TO PAR-NAME.                        K7SEA4.2 44
   001497C        119500     PERFORM  PASS.                                               K7SEA4.2 194
   001498C        119600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001499C        119700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001500C        119800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001501C        119900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001502C        120000 COPY-TEST-151.                                                   K7SEA4.2
   001503C        120100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001504C        120200     MOVE     "COPY-TEST-151" TO PAR-NAME.                        K7SEA4.2 44
   001505C        120300     PERFORM  PASS.                                               K7SEA4.2 194
   001506C        120400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001507C        120500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001508C        120600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001509C        120700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001510C        120800 COPY-TEST-152.                                                   K7SEA4.2
   001511C        120900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001512C        121000     MOVE     "COPY-TEST-152" TO PAR-NAME.                        K7SEA4.2 44
   001513C        121100     PERFORM  PASS.                                               K7SEA4.2 194
   001514C        121200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001515C        121300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001516C        121400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001517C        121500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001518C        121600 COPY-TEST-153.                                                   K7SEA4.2
   001519C        121700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001520C        121800     MOVE     "COPY-TEST-153" TO PAR-NAME.                        K7SEA4.2 44
   001521C        121900     PERFORM  PASS.                                               K7SEA4.2 194
   001522C        122000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001523C        122100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001524C        122200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001525C        122300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001526C        122400 COPY-TEST-154.                                                   K7SEA4.2
   001527C        122500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001528C        122600     MOVE     "COPY-TEST-154" TO PAR-NAME.                        K7SEA4.2 44
   001529C        122700     PERFORM  PASS.                                               K7SEA4.2 194
   001530C        122800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001531C        122900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001532C        123000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001533C        123100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001534C        123200 COPY-TEST-155.                                                   K7SEA4.2
   001535C        123300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001536C        123400     MOVE     "COPY-TEST-155" TO PAR-NAME.                        K7SEA4.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537C        123500     PERFORM  PASS.                                               K7SEA4.2 194
   001538C        123600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001539C        123700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001540C        123800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001541C        123900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001542C        124000 COPY-TEST-156.                                                   K7SEA4.2
   001543C        124100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001544C        124200     MOVE     "COPY-TEST-156" TO PAR-NAME.                        K7SEA4.2 44
   001545C        124300     PERFORM  PASS.                                               K7SEA4.2 194
   001546C        124400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001547C        124500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001548C        124600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001549C        124700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001550C        124800 COPY-TEST-157.                                                   K7SEA4.2
   001551C        124900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001552C        125000     MOVE     "COPY-TEST-157" TO PAR-NAME.                        K7SEA4.2 44
   001553C        125100     PERFORM  PASS.                                               K7SEA4.2 194
   001554C        125200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001555C        125300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001556C        125400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001557C        125500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001558C        125600 COPY-TEST-158.                                                   K7SEA4.2
   001559C        125700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001560C        125800     MOVE     "COPY-TEST-158" TO PAR-NAME.                        K7SEA4.2 44
   001561C        125900     PERFORM  PASS.                                               K7SEA4.2 194
   001562C        126000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001563C        126100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001564C        126200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001565C        126300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001566C        126400 COPY-TEST-159.                                                   K7SEA4.2
   001567C        126500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001568C        126600     MOVE     "COPY-TEST-159" TO PAR-NAME.                        K7SEA4.2 44
   001569C        126700     PERFORM  PASS.                                               K7SEA4.2 194
   001570C        126800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001571C        126900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001572C        127000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001573C        127100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001574C        127200 COPY-TEST-160.                                                   K7SEA4.2
   001575C        127300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001576C        127400     MOVE     "COPY-TEST-160" TO PAR-NAME.                        K7SEA4.2 44
   001577C        127500     PERFORM  PASS.                                               K7SEA4.2 194
   001578C        127600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001579C        127700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001580C        127800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001581C        127900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001582C        128000 COPY-TEST-161.                                                   K7SEA4.2
   001583C        128100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001584C        128200     MOVE     "COPY-TEST-161" TO PAR-NAME.                        K7SEA4.2 44
   001585C        128300     PERFORM  PASS.                                               K7SEA4.2 194
   001586C        128400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001587C        128500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001588C        128600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001589C        128700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001590C        128800 COPY-TEST-162.                                                   K7SEA4.2
   001591C        128900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001592C        129000     MOVE     "COPY-TEST-162" TO PAR-NAME.                        K7SEA4.2 44
   001593C        129100     PERFORM  PASS.                                               K7SEA4.2 194
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594C        129200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001595C        129300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001596C        129400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001597C        129500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001598C        129600 COPY-TEST-163.                                                   K7SEA4.2
   001599C        129700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001600C        129800     MOVE     "COPY-TEST-163" TO PAR-NAME.                        K7SEA4.2 44
   001601C        129900     PERFORM  PASS.                                               K7SEA4.2 194
   001602C        130000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001603C        130100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001604C        130200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001605C        130300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001606C        130400 COPY-TEST-164.                                                   K7SEA4.2
   001607C        130500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001608C        130600     MOVE     "COPY-TEST-164" TO PAR-NAME.                        K7SEA4.2 44
   001609C        130700     PERFORM  PASS.                                               K7SEA4.2 194
   001610C        130800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001611C        130900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001612C        131000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001613C        131100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001614C        131200 COPY-TEST-165.                                                   K7SEA4.2
   001615C        131300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001616C        131400     MOVE     "COPY-TEST-165" TO PAR-NAME.                        K7SEA4.2 44
   001617C        131500     PERFORM  PASS.                                               K7SEA4.2 194
   001618C        131600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001619C        131700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001620C        131800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001621C        131900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001622C        132000 COPY-TEST-166.                                                   K7SEA4.2
   001623C        132100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001624C        132200     MOVE     "COPY-TEST-166" TO PAR-NAME.                        K7SEA4.2 44
   001625C        132300     PERFORM  PASS.                                               K7SEA4.2 194
   001626C        132400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001627C        132500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001628C        132600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001629C        132700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001630C        132800 COPY-TEST-167.                                                   K7SEA4.2
   001631C        132900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001632C        133000     MOVE     "COPY-TEST-167" TO PAR-NAME.                        K7SEA4.2 44
   001633C        133100     PERFORM  PASS.                                               K7SEA4.2 194
   001634C        133200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001635C        133300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001636C        133400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001637C        133500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001638C        133600 COPY-TEST-168.                                                   K7SEA4.2
   001639C        133700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001640C        133800     MOVE     "COPY-TEST-168" TO PAR-NAME.                        K7SEA4.2 44
   001641C        133900     PERFORM  PASS.                                               K7SEA4.2 194
   001642C        134000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001643C        134100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001644C        134200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001645C        134300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001646C        134400 COPY-TEST-169.                                                   K7SEA4.2
   001647C        134500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001648C        134600     MOVE     "COPY-TEST-169" TO PAR-NAME.                        K7SEA4.2 44
   001649C        134700     PERFORM  PASS.                                               K7SEA4.2 194
   001650C        134800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651C        134900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001652C        135000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001653C        135100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001654C        135200 COPY-TEST-170.                                                   K7SEA4.2
   001655C        135300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001656C        135400     MOVE     "COPY-TEST-170" TO PAR-NAME.                        K7SEA4.2 44
   001657C        135500     PERFORM  PASS.                                               K7SEA4.2 194
   001658C        135600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001659C        135700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001660C        135800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001661C        135900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001662C        136000 COPY-TEST-171.                                                   K7SEA4.2
   001663C        136100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001664C        136200     MOVE     "COPY-TEST-171" TO PAR-NAME.                        K7SEA4.2 44
   001665C        136300     PERFORM  PASS.                                               K7SEA4.2 194
   001666C        136400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001667C        136500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001668C        136600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001669C        136700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001670C        136800 COPY-TEST-172.                                                   K7SEA4.2
   001671C        136900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001672C        137000     MOVE     "COPY-TEST-172" TO PAR-NAME.                        K7SEA4.2 44
   001673C        137100     PERFORM  PASS.                                               K7SEA4.2 194
   001674C        137200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001675C        137300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001676C        137400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001677C        137500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001678C        137600 COPY-TEST-173.                                                   K7SEA4.2
   001679C        137700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001680C        137800     MOVE     "COPY-TEST-173" TO PAR-NAME.                        K7SEA4.2 44
   001681C        137900     PERFORM  PASS.                                               K7SEA4.2 194
   001682C        138000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001683C        138100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001684C        138200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001685C        138300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001686C        138400 COPY-TEST-174.                                                   K7SEA4.2
   001687C        138500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001688C        138600     MOVE     "COPY-TEST-174" TO PAR-NAME.                        K7SEA4.2 44
   001689C        138700     PERFORM  PASS.                                               K7SEA4.2 194
   001690C        138800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001691C        138900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001692C        139000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001693C        139100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001694C        139200 COPY-TEST-175.                                                   K7SEA4.2
   001695C        139300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001696C        139400     MOVE     "COPY-TEST-175" TO PAR-NAME.                        K7SEA4.2 44
   001697C        139500     PERFORM  PASS.                                               K7SEA4.2 194
   001698C        139600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001699C        139700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001700C        139800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001701C        139900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001702C        140000 COPY-TEST-176.                                                   K7SEA4.2
   001703C        140100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001704C        140200     MOVE     "COPY-TEST-176" TO PAR-NAME.                        K7SEA4.2 44
   001705C        140300     PERFORM  PASS.                                               K7SEA4.2 194
   001706C        140400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001707C        140500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708C        140600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001709C        140700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001710C        140800 COPY-TEST-177.                                                   K7SEA4.2
   001711C        140900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001712C        141000     MOVE     "COPY-TEST-177" TO PAR-NAME.                        K7SEA4.2 44
   001713C        141100     PERFORM  PASS.                                               K7SEA4.2 194
   001714C        141200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001715C        141300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001716C        141400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001717C        141500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001718C        141600 COPY-TEST-178.                                                   K7SEA4.2
   001719C        141700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001720C        141800     MOVE     "COPY-TEST-178" TO PAR-NAME.                        K7SEA4.2 44
   001721C        141900     PERFORM  PASS.                                               K7SEA4.2 194
   001722C        142000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001723C        142100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001724C        142200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001725C        142300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001726C        142400 COPY-TEST-179.                                                   K7SEA4.2
   001727C        142500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001728C        142600     MOVE     "COPY-TEST-179" TO PAR-NAME.                        K7SEA4.2 44
   001729C        142700     PERFORM  PASS.                                               K7SEA4.2 194
   001730C        142800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001731C        142900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001732C        143000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001733C        143100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001734C        143200 COPY-TEST-180.                                                   K7SEA4.2
   001735C        143300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001736C        143400     MOVE     "COPY-TEST-180" TO PAR-NAME.                        K7SEA4.2 44
   001737C        143500     PERFORM  PASS.                                               K7SEA4.2 194
   001738C        143600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001739C        143700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001740C        143800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001741C        143900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001742C        144000 COPY-TEST-181.                                                   K7SEA4.2
   001743C        144100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001744C        144200     MOVE     "COPY-TEST-181" TO PAR-NAME.                        K7SEA4.2 44
   001745C        144300     PERFORM  PASS.                                               K7SEA4.2 194
   001746C        144400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001747C        144500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001748C        144600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001749C        144700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001750C        144800 COPY-TEST-182.                                                   K7SEA4.2
   001751C        144900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001752C        145000     MOVE     "COPY-TEST-182" TO PAR-NAME.                        K7SEA4.2 44
   001753C        145100     PERFORM  PASS.                                               K7SEA4.2 194
   001754C        145200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001755C        145300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001756C        145400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001757C        145500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001758C        145600 COPY-TEST-183.                                                   K7SEA4.2
   001759C        145700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001760C        145800     MOVE     "COPY-TEST-183" TO PAR-NAME.                        K7SEA4.2 44
   001761C        145900     PERFORM  PASS.                                               K7SEA4.2 194
   001762C        146000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001763C        146100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001764C        146200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765C        146300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001766C        146400 COPY-TEST-184.                                                   K7SEA4.2
   001767C        146500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001768C        146600     MOVE     "COPY-TEST-184" TO PAR-NAME.                        K7SEA4.2 44
   001769C        146700     PERFORM  PASS.                                               K7SEA4.2 194
   001770C        146800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001771C        146900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001772C        147000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001773C        147100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001774C        147200 COPY-TEST-185.                                                   K7SEA4.2
   001775C        147300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001776C        147400     MOVE     "COPY-TEST-185" TO PAR-NAME.                        K7SEA4.2 44
   001777C        147500     PERFORM  PASS.                                               K7SEA4.2 194
   001778C        147600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001779C        147700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001780C        147800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001781C        147900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001782C        148000 COPY-TEST-186.                                                   K7SEA4.2
   001783C        148100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001784C        148200     MOVE     "COPY-TEST-186" TO PAR-NAME.                        K7SEA4.2 44
   001785C        148300     PERFORM  PASS.                                               K7SEA4.2 194
   001786C        148400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001787C        148500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001788C        148600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001789C        148700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001790C        148800 COPY-TEST-187.                                                   K7SEA4.2
   001791C        148900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001792C        149000     MOVE     "COPY-TEST-187" TO PAR-NAME.                        K7SEA4.2 44
   001793C        149100     PERFORM  PASS.                                               K7SEA4.2 194
   001794C        149200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001795C        149300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001796C        149400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001797C        149500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001798C        149600 COPY-TEST-188.                                                   K7SEA4.2
   001799C        149700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001800C        149800     MOVE     "COPY-TEST-188" TO PAR-NAME.                        K7SEA4.2 44
   001801C        149900     PERFORM  PASS.                                               K7SEA4.2 194
   001802C        150000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001803C        150100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001804C        150200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001805C        150300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001806C        150400 COPY-TEST-189.                                                   K7SEA4.2
   001807C        150500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001808C        150600     MOVE     "COPY-TEST-189" TO PAR-NAME.                        K7SEA4.2 44
   001809C        150700     PERFORM  PASS.                                               K7SEA4.2 194
   001810C        150800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001811C        150900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001812C        151000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001813C        151100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001814C        151200 COPY-TEST-190.                                                   K7SEA4.2
   001815C        151300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001816C        151400     MOVE     "COPY-TEST-190" TO PAR-NAME.                        K7SEA4.2 44
   001817C        151500     PERFORM  PASS.                                               K7SEA4.2 194
   001818C        151600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001819C        151700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001820C        151800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001821C        151900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822C        152000 COPY-TEST-191.                                                   K7SEA4.2
   001823C        152100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001824C        152200     MOVE     "COPY-TEST-191" TO PAR-NAME.                        K7SEA4.2 44
   001825C        152300     PERFORM  PASS.                                               K7SEA4.2 194
   001826C        152400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001827C        152500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001828C        152600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001829C        152700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001830C        152800 COPY-TEST-192.                                                   K7SEA4.2
   001831C        152900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001832C        153000     MOVE     "COPY-TEST-192" TO PAR-NAME.                        K7SEA4.2 44
   001833C        153100     PERFORM  PASS.                                               K7SEA4.2 194
   001834C        153200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001835C        153300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001836C        153400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001837C        153500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001838C        153600 COPY-TEST-193.                                                   K7SEA4.2
   001839C        153700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001840C        153800     MOVE     "COPY-TEST-193" TO PAR-NAME.                        K7SEA4.2 44
   001841C        153900     PERFORM  PASS.                                               K7SEA4.2 194
   001842C        154000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001843C        154100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001844C        154200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001845C        154300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001846C        154400 COPY-TEST-194.                                                   K7SEA4.2
   001847C        154500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001848C        154600     MOVE     "COPY-TEST-194" TO PAR-NAME.                        K7SEA4.2 44
   001849C        154700     PERFORM  PASS.                                               K7SEA4.2 194
   001850C        154800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001851C        154900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001852C        155000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001853C        155100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001854C        155200 COPY-TEST-195.                                                   K7SEA4.2
   001855C        155300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001856C        155400     MOVE     "COPY-TEST-195" TO PAR-NAME.                        K7SEA4.2 44
   001857C        155500     PERFORM  PASS.                                               K7SEA4.2 194
   001858C        155600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001859C        155700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001860C        155800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001861C        155900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001862C        156000 COPY-TEST-196.                                                   K7SEA4.2
   001863C        156100     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001864C        156200     MOVE     "COPY-TEST-196" TO PAR-NAME.                        K7SEA4.2 44
   001865C        156300     PERFORM  PASS.                                               K7SEA4.2 194
   001866C        156400     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001867C        156500     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001868C        156600     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001869C        156700     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001870C        156800 COPY-TEST-197.                                                   K7SEA4.2
   001871C        156900     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001872C        157000     MOVE     "COPY-TEST-197" TO PAR-NAME.                        K7SEA4.2 44
   001873C        157100     PERFORM  PASS.                                               K7SEA4.2 194
   001874C        157200     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001875C        157300     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001876C        157400     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001877C        157500     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001878C        157600 COPY-TEST-198.                                                   K7SEA4.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879C        157700     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001880C        157800     MOVE     "COPY-TEST-198" TO PAR-NAME.                        K7SEA4.2 44
   001881C        157900     PERFORM  PASS.                                               K7SEA4.2 194
   001882C        158000     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001883C        158100     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001884C        158200     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001885C        158300     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001886C        158400 COPY-TEST-199.                                                   K7SEA4.2
   001887C        158500     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001888C        158600     MOVE     "COPY-TEST-199" TO PAR-NAME.                        K7SEA4.2 44
   001889C        158700     PERFORM  PASS.                                               K7SEA4.2 194
   001890C        158800     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001891C        158900     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001892C        159000     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001893C        159100     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001894C        159200 COPY-TEST-200.                                                   K7SEA4.2
   001895C        159300     MOVE     "1600-CARD LIBRARY" TO FEATURE.                     K7SEA4.2 40
   001896C        159400     MOVE     "COPY-TEST-200" TO PAR-NAME.                        K7SEA4.2 44
   001897C        159500     PERFORM  PASS.                                               K7SEA4.2 194
   001898C        159600     MOVE     SPACE TO COMPUTED-A.                                K7SEA4.2 IMP 55
   001899C        159700     MOVE     SPACE TO CORRECT-A.                                 K7SEA4.2 IMP 69
   001900C        159800     MOVE     SPACE TO RE-MARK.                                   K7SEA4.2 IMP 49
   001901C        159900     PERFORM  PRINT-DETAIL.                                       K7SEA4.2 198
   001902**       031000 CCVS-EXIT SECTION.                                               SM1074.2
   001903         031100 CCVS-999999.                                                     SM1074.2
   001904         031200     GO TO CLOSE-FILES.                                           SM1074.2 187
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    38
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      100   ANSI-REFERENCE . . . . . . . .  272 279 288
       79   CCVS-C-1 . . . . . . . . . . .  216 258
       84   CCVS-C-2 . . . . . . . . . . .  217 259
      134   CCVS-E-1 . . . . . . . . . . .  222
      139   CCVS-E-2 . . . . . . . . . . .  231 238 245 250
      142   CCVS-E-2-2 . . . . . . . . . .  M230
      147   CCVS-E-3 . . . . . . . . . . .  251
      156   CCVS-E-4 . . . . . . . . . . .  230
      157   CCVS-E-4-1 . . . . . . . . . .  M228
      159   CCVS-E-4-2 . . . . . . . . . .  M229
      101   CCVS-H-1 . . . . . . . . . . .  211
      106   CCVS-H-2A. . . . . . . . . . .  212
      115   CCVS-H-2B. . . . . . . . . . .  213
      127   CCVS-H-3 . . . . . . . . . . .  214
      177   CCVS-PGM-ID. . . . . . . . . .  183 183
       61   CM-18V0
       55   COMPUTED-A . . . . . . . . . .  56 58 59 60 61 284 287 M307 M315 M323 M331 M339 M347 M355 M362 M370 M378 M386
                                            M394 M402 M410 M418 M426 M434 M442 M450 M458 M466 M474 M482 M490 M498 M506 M514
                                            M522 M530 M538 M546 M554 M562 M570 M578 M586 M594 M602 M610 M618 M626 M634 M642
                                            M650 M658 M666 M674 M682 M690 M698 M706 M714 M722 M730 M738 M746 M754 M762 M770
                                            M778 M786 M794 M802 M810 M818 M826 M834 M842 M850 M858 M866 M874 M882 M890 M898
                                            M906 M914 M921 M930 M938 M946 M954 M962 M970 M978 M986 M994 M1002 M1010 M1018
                                            M1026 M1034 M1042 M1050 M1058 M1066 M1074 M1082 M1090 M1098 M1106 M1114 M1122
                                            M1130 M1138 M1146 M1154 M1162 M1170 M1178 M1186 M1194 M1202 M1210 M1218 M1226
                                            M1234 M1242 M1250 M1258 M1266 M1274 M1282 M1290 M1298 M1306 M1314 M1322 M1330
                                            M1338 M1346 M1354 M1362 M1370 M1378 M1386 M1394 M1402 M1410 M1418 M1426 M1434
                                            M1442 M1450 M1458 M1466 M1474 M1482 M1490 M1498 M1506 M1514 M1522 M1530 M1538
                                            M1546 M1554 M1562 M1570 M1578 M1586 M1594 M1602 M1610 M1618 M1626 M1634 M1642
                                            M1650 M1658 M1666 M1674 M1682 M1690 M1698 M1706 M1714 M1722 M1730 M1738 M1746
                                            M1754 M1762 M1770 M1778 M1786 M1794 M1802 M1810 M1818 M1826 M1834 M1842 M1850
                                            M1858 M1866 M1874 M1882 M1890 M1898
       56   COMPUTED-N
       54   COMPUTED-X . . . . . . . . . .  M206 270
       58   COMPUTED-0V18
       60   COMPUTED-14V4
       62   COMPUTED-18V0
       59   COMPUTED-4V14
       78   COR-ANSI-REFERENCE . . . . . .  M279 M281
       69   CORRECT-A. . . . . . . . . . .  70 71 72 73 74 285 287 M308 M316 M324 M332 M340 M348 M356 M363 M371 M379 M387
                                            M395 M403 M411 M419 M427 M435 M443 M451 M459 M467 M475 M483 M491 M499 M507 M515
                                            M523 M531 M539 M547 M555 M563 M571 M579 M587 M595 M603 M611 M619 M627 M635 M643
                                            M651 M659 M667 M675 M683 M691 M699 M707 M715 M723 M731 M739 M747 M755 M763 M771
                                            M779 M787 M795 M803 M811 M819 M827 M835 M843 M851 M859 M867 M875 M883 M891 M899
                                            M907 M915 M922 M931 M939 M947 M955 M963 M971 M979 M987 M995 M1003 M1011 M1019
                                            M1027 M1035 M1043 M1051 M1059 M1067 M1075 M1083 M1091 M1099 M1107 M1115 M1123
                                            M1131 M1139 M1147 M1155 M1163 M1171 M1179 M1187 M1195 M1203 M1211 M1219 M1227
                                            M1235 M1243 M1251 M1259 M1267 M1275 M1283 M1291 M1299 M1307 M1315 M1323 M1331
                                            M1339 M1347 M1355 M1363 M1371 M1379 M1387 M1395 M1403 M1411 M1419 M1427 M1435
                                            M1443 M1451 M1459 M1467 M1475 M1483 M1491 M1499 M1507 M1515 M1523 M1531 M1539
                                            M1547 M1555 M1563 M1571 M1579 M1587 M1595 M1603 M1611 M1619 M1627 M1635 M1643
                                            M1651 M1659 M1667 M1675 M1683 M1691 M1699 M1707 M1715 M1723 M1731 M1739 M1747
                                            M1755 M1763 M1771 M1779 M1787 M1795 M1803 M1811 M1819 M1827 M1835 M1843 M1851
                                            M1859 M1867 M1875 M1883 M1891 M1899
       70   CORRECT-N
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    39
0 Defined   Cross-reference of data names   References

0      68   CORRECT-X. . . . . . . . . . .  M207 271
       71   CORRECT-0V18
       73   CORRECT-14V4
       75   CORRECT-18V0
       72   CORRECT-4V14
       74   CR-18V0
       92   DELETE-COUNTER . . . . . . . .  M196 225 241 243
       47   DOTVALUE . . . . . . . . . . .  M201
       98   DUMMY-HOLD . . . . . . . . . .  M255 261
       36   DUMMY-RECORD . . . . . . . . .  M211 M212 M213 M214 M216 M217 M218 M220 M222 M231 M238 M245 M250 M251 255 M256
                                            257 M258 M259 M260 M261 265 M266 M274 M289
      145   ENDER-DESC . . . . . . . . . .  M233 M244 M249
       93   ERROR-COUNTER. . . . . . . . .  M195 224 234 237
       97   ERROR-HOLD . . . . . . . . . .  M224 M225 M225 M226 229
      143   ERROR-TOTAL. . . . . . . . . .  M235 M237 M242 M243 M247 M248
       40   FEATURE. . . . . . . . . . . .  M304 M312 M320 M328 M336 M344 M352 M367 M375 M383 M391 M399 M407 M415 M423 M431
                                            M439 M447 M455 M463 M471 M479 M487 M495 M503 M511 M519 M527 M535 M543 M551 M559
                                            M567 M575 M583 M591 M599 M607 M615 M623 M631 M639 M647 M655 M663 M671 M679 M687
                                            M695 M703 M711 M719 M727 M735 M743 M751 M759 M767 M775 M783 M791 M799 M807 M815
                                            M823 M831 M839 M847 M855 M863 M871 M879 M887 M895 M903 M911 M919 M927 M935 M943
                                            M951 M959 M967 M975 M983 M991 M999 M1007 M1015 M1023 M1031 M1039 M1047 M1055
                                            M1063 M1071 M1079 M1087 M1095 M1103 M1111 M1119 M1127 M1135 M1143 M1151 M1159
                                            M1167 M1175 M1183 M1191 M1199 M1207 M1215 M1223 M1231 M1239 M1247 M1255 M1263
                                            M1271 M1279 M1287 M1295 M1303 M1311 M1319 M1327 M1335 M1343 M1351 M1359 M1367
                                            M1375 M1383 M1391 M1399 M1407 M1415 M1423 M1431 M1439 M1447 M1455 M1463 M1471
                                            M1479 M1487 M1495 M1503 M1511 M1519 M1527 M1535 M1543 M1551 M1559 M1567 M1575
                                            M1583 M1591 M1599 M1607 M1615 M1623 M1631 M1639 M1647 M1655 M1663 M1671 M1679
                                            M1687 M1695 M1703 M1711 M1719 M1727 M1735 M1743 M1751 M1759 M1767 M1775 M1783
                                            M1791 M1799 M1807 M1815 M1823 M1831 M1839 M1847 M1855 M1863 M1871 M1879 M1887
                                            M1895
      171   HYPHEN-LINE. . . . . . . . . .  218 220 260
      137   ID-AGAIN . . . . . . . . . . .  M183
      170   INF-ANSI-REFERENCE . . . . . .  M272 M275 M288 M290
      165   INFO-TEXT. . . . . . . . . . .  M273
       94   INSPECT-COUNTER. . . . . . . .  M193 224 246 248
       42   P-OR-F . . . . . . . . . . . .  M193 M194 M195 M196 203 M206
       44   PAR-NAME . . . . . . . . . . .  M208 M305 M313 M321 M329 M337 M345 M353 M360 M368 M376 M384 M392 M400 M408 M416
                                            M424 M432 M440 M448 M456 M464 M472 M480 M488 M496 M504 M512 M520 M528 M536 M544
                                            M552 M560 M568 M576 M584 M592 M600 M608 M616 M624 M632 M640 M648 M656 M664 M672
                                            M680 M688 M696 M704 M712 M720 M728 M736 M744 M752 M760 M768 M776 M784 M792 M800
                                            M808 M816 M824 M832 M840 M848 M856 M864 M872 M880 M888 M896 M904 M912 M920 M928
                                            M936 M944 M952 M960 M968 M976 M984 M992 M1000 M1008 M1016 M1024 M1032 M1040 M1048
                                            M1056 M1064 M1072 M1080 M1088 M1096 M1104 M1112 M1120 M1128 M1136 M1144 M1152
                                            M1160 M1168 M1176 M1184 M1192 M1200 M1208 M1216 M1224 M1232 M1240 M1248 M1256
                                            M1264 M1272 M1280 M1288 M1296 M1304 M1312 M1320 M1328 M1336 M1344 M1352 M1360
                                            M1368 M1376 M1384 M1392 M1400 M1408 M1416 M1424 M1432 M1440 M1448 M1456 M1464
                                            M1472 M1480 M1488 M1496 M1504 M1512 M1520 M1528 M1536 M1544 M1552 M1560 M1568
                                            M1576 M1584 M1592 M1600 M1608 M1616 M1624 M1632 M1640 M1648 M1656 M1664 M1672
                                            M1680 M1688 M1696 M1704 M1712 M1720 M1728 M1736 M1744 M1752 M1760 M1768 M1776
                                            M1784 M1792 M1800 M1808 M1816 M1824 M1832 M1840 M1848 M1856 M1864 M1872 M1880
                                            M1888 M1896
       46   PARDOT-X . . . . . . . . . . .  M200
       95   PASS-COUNTER . . . . . . . . .  M194 226 228
       34   PRINT-FILE . . . . . . . . . .  30 182 188
       35   PRINT-REC. . . . . . . . . . .  M202 M278 M280 M296
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    40
0 Defined   Cross-reference of data names   References

0      49   RE-MARK. . . . . . . . . . . .  M197 M209 M309 M317 M325 M333 M341 M349 M357 M364 M372 M380 M388 M396 M404 M412
                                            M420 M428 M436 M444 M452 M460 M468 M476 M484 M492 M500 M508 M516 M524 M532 M540
                                            M548 M556 M564 M572 M580 M588 M596 M604 M612 M620 M628 M636 M644 M652 M660 M668
                                            M676 M684 M692 M700 M708 M716 M724 M732 M740 M748 M756 M764 M772 M780 M788 M796
                                            M804 M812 M820 M828 M836 M844 M852 M860 M868 M876 M884 M892 M900 M908 M916 M924
                                            M932 M940 M948 M956 M964 M972 M980 M988 M996 M1004 M1012 M1020 M1028 M1036 M1044
                                            M1052 M1060 M1068 M1076 M1084 M1092 M1100 M1108 M1116 M1124 M1132 M1140 M1148
                                            M1156 M1164 M1172 M1180 M1188 M1196 M1204 M1212 M1220 M1228 M1236 M1244 M1252
                                            M1260 M1268 M1276 M1284 M1292 M1300 M1308 M1316 M1324 M1332 M1340 M1348 M1356
                                            M1364 M1372 M1380 M1388 M1396 M1404 M1412 M1420 M1428 M1436 M1444 M1452 M1460
                                            M1468 M1476 M1484 M1492 M1500 M1508 M1516 M1524 M1532 M1540 M1548 M1556 M1564
                                            M1572 M1580 M1588 M1596 M1604 M1612 M1620 M1628 M1636 M1644 M1652 M1660 M1668
                                            M1676 M1684 M1692 M1700 M1708 M1716 M1724 M1732 M1740 M1748 M1756 M1764 M1772
                                            M1780 M1788 M1796 M1804 M1812 M1820 M1828 M1836 M1844 M1852 M1860 M1868 M1876
                                            M1884 M1892 M1900
       91   REC-CT . . . . . . . . . . . .  199 201 208
       90   REC-SKL-SUB
       99   RECORD-COUNT . . . . . . . . .  M253 254 M262
       50   TEST-COMPUTED. . . . . . . . .  278
       65   TEST-CORRECT . . . . . . . . .  280
      118   TEST-ID. . . . . . . . . . . .  M183
       38   TEST-RESULTS . . . . . . . . .  M184 202
       96   TOTAL-ERROR
      167   XXCOMPUTED . . . . . . . . . .  M287
      169   XXCORRECT. . . . . . . . . . .  M287
      162   XXINFO . . . . . . . . . . . .  274 289
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    41
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

      283   BAIL-OUT . . . . . . . . . . .  P205
      291   BAIL-OUT-EX. . . . . . . . . .  E205 G285
      286   BAIL-OUT-WRITE . . . . . . . .  G284
      267   BLANK-LINE-PRINT
     1902   CCVS-EXIT
     1903   CCVS-999999
      180   CCVS1
      292   CCVS1-EXIT . . . . . . . . . .  G186
      187   CLOSE-FILES. . . . . . . . . .  G1904
      215   COLUMN-NAMES-ROUTINE . . . . .  E185
      303   COPY-TEST-1
      374   COPY-TEST-10
     1094   COPY-TEST-100
     1102   COPY-TEST-101
     1110   COPY-TEST-102
     1118   COPY-TEST-103
     1126   COPY-TEST-104
     1134   COPY-TEST-105
     1142   COPY-TEST-106
     1150   COPY-TEST-107
     1158   COPY-TEST-108
     1166   COPY-TEST-109
      382   COPY-TEST-11
     1174   COPY-TEST-110
     1182   COPY-TEST-111
     1190   COPY-TEST-112
     1198   COPY-TEST-113
     1206   COPY-TEST-114
     1214   COPY-TEST-115
     1222   COPY-TEST-116
     1230   COPY-TEST-117
     1238   COPY-TEST-118
     1246   COPY-TEST-119
      390   COPY-TEST-12
     1254   COPY-TEST-120
     1262   COPY-TEST-121
     1270   COPY-TEST-122
     1278   COPY-TEST-123
     1286   COPY-TEST-124
     1294   COPY-TEST-125
     1302   COPY-TEST-126
     1310   COPY-TEST-127
     1318   COPY-TEST-128
     1326   COPY-TEST-129
      398   COPY-TEST-13
     1334   COPY-TEST-130
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    42
0 Defined   Cross-reference of procedures   References

0    1342   COPY-TEST-131
     1350   COPY-TEST-132
     1358   COPY-TEST-133
     1366   COPY-TEST-134
     1374   COPY-TEST-135
     1382   COPY-TEST-136
     1390   COPY-TEST-137
     1398   COPY-TEST-138
     1406   COPY-TEST-139
      406   COPY-TEST-14
     1414   COPY-TEST-140
     1422   COPY-TEST-141
     1430   COPY-TEST-142
     1438   COPY-TEST-143
     1446   COPY-TEST-144
     1454   COPY-TEST-145
     1462   COPY-TEST-146
     1470   COPY-TEST-147
     1478   COPY-TEST-148
     1486   COPY-TEST-149
      414   COPY-TEST-15
     1494   COPY-TEST-150
     1502   COPY-TEST-151
     1510   COPY-TEST-152
     1518   COPY-TEST-153
     1526   COPY-TEST-154
     1534   COPY-TEST-155
     1542   COPY-TEST-156
     1550   COPY-TEST-157
     1558   COPY-TEST-158
     1566   COPY-TEST-159
      422   COPY-TEST-16
     1574   COPY-TEST-160
     1582   COPY-TEST-161
     1590   COPY-TEST-162
     1598   COPY-TEST-163
     1606   COPY-TEST-164
     1614   COPY-TEST-165
     1622   COPY-TEST-166
     1630   COPY-TEST-167
     1638   COPY-TEST-168
     1646   COPY-TEST-169
      430   COPY-TEST-17
     1654   COPY-TEST-170
     1662   COPY-TEST-171
     1670   COPY-TEST-172
     1678   COPY-TEST-173
     1686   COPY-TEST-174
     1694   COPY-TEST-175
     1702   COPY-TEST-176
     1710   COPY-TEST-177
     1718   COPY-TEST-178
     1726   COPY-TEST-179
      438   COPY-TEST-18
     1734   COPY-TEST-180
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    43
0 Defined   Cross-reference of procedures   References

0    1742   COPY-TEST-181
     1750   COPY-TEST-182
     1758   COPY-TEST-183
     1766   COPY-TEST-184
     1774   COPY-TEST-185
     1782   COPY-TEST-186
     1790   COPY-TEST-187
     1798   COPY-TEST-188
     1806   COPY-TEST-189
      446   COPY-TEST-19
     1814   COPY-TEST-190
     1822   COPY-TEST-191
     1830   COPY-TEST-192
     1838   COPY-TEST-193
     1846   COPY-TEST-194
     1854   COPY-TEST-195
     1862   COPY-TEST-196
     1870   COPY-TEST-197
     1878   COPY-TEST-198
     1886   COPY-TEST-199
      311   COPY-TEST-2
      470   COPY-TEST-2I
      454   COPY-TEST-20
     1894   COPY-TEST-200
      462   COPY-TEST-21
      478   COPY-TEST-23
      486   COPY-TEST-24
      494   COPY-TEST-25
      502   COPY-TEST-26
      510   COPY-TEST-27
      518   COPY-TEST-28
      526   COPY-TEST-29
      319   COPY-TEST-3
      534   COPY-TEST-30
      542   COPY-TEST-31
      550   COPY-TEST-32
      558   COPY-TEST-33
      566   COPY-TEST-34
      574   COPY-TEST-35
      582   COPY-TEST-36
      590   COPY-TEST-37
      598   COPY-TEST-38
      606   COPY-TEST-39
      327   COPY-TEST-4
      614   COPY-TEST-40
      622   COPY-TEST-41
      630   COPY-TEST-42
      638   COPY-TEST-43
      646   COPY-TEST-44
      654   COPY-TEST-45
      662   COPY-TEST-46
      670   COPY-TEST-47
      678   COPY-TEST-48
      686   COPY-TEST-49
      335   COPY-TEST-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    44
0 Defined   Cross-reference of procedures   References

0     694   COPY-TEST-50
      702   COPY-TEST-51
      710   COPY-TEST-52
      718   COPY-TEST-53
      726   COPY-TEST-54
      734   COPY-TEST-55
      742   COPY-TEST-56
      750   COPY-TEST-57
      758   COPY-TEST-58
      766   COPY-TEST-59
      343   COPY-TEST-6
      774   COPY-TEST-60
      782   COPY-TEST-61
      790   COPY-TEST-62
      798   COPY-TEST-63
      806   COPY-TEST-64
      814   COPY-TEST-65
      822   COPY-TEST-66
      830   COPY-TEST-67
      838   COPY-TEST-68
      846   COPY-TEST-69
      351   COPY-TEST-7
      854   COPY-TEST-70
      862   COPY-TEST-71
      870   COPY-TEST-72
      878   COPY-TEST-73
      886   COPY-TEST-74
      894   COPY-TEST-75
      902   COPY-TEST-76
      910   COPY-TEST-77
      918   COPY-TEST-78
      926   COPY-TEST-79
      359   COPY-TEST-8
      934   COPY-TEST-80
      942   COPY-TEST-81
      950   COPY-TEST-82
      958   COPY-TEST-83
      966   COPY-TEST-84
      974   COPY-TEST-85
      982   COPY-TEST-86
      990   COPY-TEST-87
      998   COPY-TEST-88
     1006   COPY-TEST-89
      366   COPY-TEST-9
     1014   COPY-TEST-90
     1022   COPY-TEST-91
     1030   COPY-TEST-92
     1038   COPY-TEST-93
     1046   COPY-TEST-94
     1054   COPY-TEST-95
     1062   COPY-TEST-96
     1070   COPY-TEST-97
     1078   COPY-TEST-98
     1086   COPY-TEST-99
      196   DE-LETE
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    45
0 Defined   Cross-reference of procedures   References

0     219   END-ROUTINE. . . . . . . . . .  P188
      223   END-ROUTINE-1
      232   END-ROUTINE-12
      240   END-ROUTINE-13 . . . . . . . .  E188
      221   END-RTN-EXIT
      195   FAIL
      269   FAIL-ROUTINE . . . . . . . . .  P204
      282   FAIL-ROUTINE-EX. . . . . . . .  E204 G276
      277   FAIL-ROUTINE-WRITE . . . . . .  G270 G271
      210   HEAD-ROUTINE . . . . . . . . .  P185
      193   INSPT
      181   OPEN-FILES
      194   PASS . . . . . . . . . . . . .  P306 P314 P322 P330 P338 P346 P354 P361 P369 P377 P385 P393 P401 P409 P417 P425
                                            P433 P441 P449 P457 P465 P473 P481 P489 P497 P505 P513 P521 P529 P537 P545 P553
                                            P561 P569 P577 P585 P593 P601 P609 P617 P625 P633 P641 P649 P657 P665 P673 P681
                                            P689 P697 P705 P713 P721 P729 P737 P745 P753 P761 P769 P777 P785 P793 P801 P809
                                            P817 P825 P833 P841 P849 P857 P865 P873 P881 P889 P897 P905 P913 P923 P929 P937
                                            P945 P953 P961 P969 P977 P985 P993 P1001 P1009 P1017 P1025 P1033 P1041 P1049
                                            P1057 P1065 P1073 P1081 P1089 P1097 P1105 P1113 P1121 P1129 P1137 P1145 P1153
                                            P1161 P1169 P1177 P1185 P1193 P1201 P1209 P1217 P1225 P1233 P1241 P1249 P1257
                                            P1265 P1273 P1281 P1289 P1297 P1305 P1313 P1321 P1329 P1337 P1345 P1353 P1361
                                            P1369 P1377 P1385 P1393 P1401 P1409 P1417 P1425 P1433 P1441 P1449 P1457 P1465
                                            P1473 P1481 P1489 P1497 P1505 P1513 P1521 P1529 P1537 P1545 P1553 P1561 P1569
                                            P1577 P1585 P1593 P1601 P1609 P1617 P1625 P1633 P1641 P1649 P1657 P1665 P1673
                                            P1681 P1689 P1697 P1705 P1713 P1721 P1729 P1737 P1745 P1753 P1761 P1769 P1777
                                            P1785 P1793 P1801 P1809 P1817 P1825 P1833 P1841 P1849 P1857 P1865 P1873 P1881
                                            P1889 P1897
      198   PRINT-DETAIL . . . . . . . . .  P310 P318 P326 P334 P342 P350 P358 P365 P373 P381 P389 P397 P405 P413 P421 P429
                                            P437 P445 P453 P461 P469 P477 P485 P493 P501 P509 P517 P525 P533 P541 P549 P557
                                            P565 P573 P581 P589 P597 P605 P613 P621 P629 P637 P645 P653 P661 P669 P677 P685
                                            P693 P701 P709 P717 P725 P733 P741 P749 P757 P765 P773 P781 P789 P797 P805 P813
                                            P821 P829 P837 P845 P853 P861 P869 P877 P885 P893 P901 P909 P917 P925 P933 P941
                                            P949 P957 P965 P973 P981 P989 P997 P1005 P1013 P1021 P1029 P1037 P1045 P1053
                                            P1061 P1069 P1077 P1085 P1093 P1101 P1109 P1117 P1125 P1133 P1141 P1149 P1157
                                            P1165 P1173 P1181 P1189 P1197 P1205 P1213 P1221 P1229 P1237 P1245 P1253 P1261
                                            P1269 P1277 P1285 P1293 P1301 P1309 P1317 P1325 P1333 P1341 P1349 P1357 P1365
                                            P1373 P1381 P1389 P1397 P1405 P1413 P1421 P1429 P1437 P1445 P1453 P1461 P1469
                                            P1477 P1485 P1493 P1501 P1509 P1517 P1525 P1533 P1541 P1549 P1557 P1565 P1573
                                            P1581 P1589 P1597 P1605 P1613 P1621 P1629 P1637 P1645 P1653 P1661 P1669 P1677
                                            P1685 P1693 P1701 P1709 P1717 P1725 P1733 P1741 P1749 P1757 P1765 P1773 P1781
                                            P1789 P1797 P1805 P1813 P1821 P1829 P1837 P1845 P1853 P1861 P1869 P1877 P1885
                                            P1893 P1901
      191   TERMINATE-CALL
      189   TERMINATE-CCVS
      294   WARNING-MSG
      252   WRITE-LINE . . . . . . . . . .  P202 P203 P211 P212 P213 P214 P216 P217 P218 P220 P222 P231 P239 P245 P250 P251
                                            P274 P278 P280 P289 P297
      264   WRT-LN . . . . . . . . . . . .  P258 P259 P260 P263 P268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    46
0 Defined   Cross-reference of programs     References

        3   SM107A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    47
0
          COPY/BASIS cross-reference of text-names, library names and dataset information

  Text-name Library   File name                                    Concat   ISPF statistics
  (Member)  (DDNAME)  (Dataset name)                               Level    Created         Changed

  K7SEA     SYSLIB    AP891843.PUBLIC.CPY                            0

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM107A    Date 06/04/2022  Time 11:56:59   Page    48
0LineID  Message code  Message text

         IGYSC0205-W   Warning message(s) were issued during library phase processing.  Refer to the beginning of the listing.

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program SM107A:
 *    Source records = 1904
 *    Data Division statements = 63
 *    Procedure Division statements = 1529
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1536
0End of compilation 1,  program SM107A,  highest severity 4.
0Return code 4
