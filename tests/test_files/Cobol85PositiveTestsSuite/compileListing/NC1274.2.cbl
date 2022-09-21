1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:29   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:29   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 identification division.                                         NC1274.2
   000002         000200 program-id.                                                      NC1274.2
   000003         000300     nc127A.                                                      NC1274.2
   000004         000500*                                                              *  NC1274.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1274.2
   000006         000700*                                                              *  NC1274.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1274.2
   000008         000900*                                                              *  NC1274.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1274.2
   000010         001100*                                                              *  NC1274.2
   000011         001300*                                                              *  NC1274.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1274.2
   000013         001500*                                                              *  NC1274.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1274.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1274.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1274.2
   000017         001900*                                                              *  NC1274.2
   000018         002100*                                                                 NC1274.2
   000019         002200*   program nc127a is written using lower case letters            NC1274.2
   000020         002300*   throughout, with the exception of standard COBOL text         NC1274.2
   000021         002400*   which is copied into every CCVS8x program from a library      NC1274.2
   000022         002500*   and some alphanumeric literals.                               NC1274.2
   000023         002600*                                                                 NC1274.2
   000024         002700 environment division.                                            NC1274.2
   000025         002800 configuration section.                                           NC1274.2
   000026         002900 source-computer.                                                 NC1274.2
   000027         003000     XXXXX082.                                                    NC1274.2
   000028         003100 object-computer.                                                 NC1274.2
   000029         003200     XXXXX083.                                                    NC1274.2
   000030         003300 input-output section.                                            NC1274.2
   000031         003400 file-control.                                                    NC1274.2
   000032         003500     select print-file assign to                                  NC1274.2 36
   000033         003600     XXXXX055.                                                    NC1274.2
   000034         003700 data division.                                                   NC1274.2
   000035         003800 file section.                                                    NC1274.2
   000036         003900 FD  PRINT-FILE.                                                  NC1274.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000 01  print-rec picture x(120).                                    NC1274.2
   000038         004100 01  dummy-record picture x(120).                                 NC1274.2
   000039         004200 working-storage section.                                         NC1274.2
   000040         004300 01  alphabetic-lit-upper  pic x(9) value "ABCRSTXYZ".            NC1274.2
   000041         004400 01  alphabetic-lit-lower  pic x(9) value "abcrstxyz".            NC1274.2
   000042         004500 01  alpha-lit-upper-lower pic x(9) value "dEfJkLuVw".            NC1274.2
   000043         004600 01  TEST-RESULTS.                                                NC1274.2
   000044         004700     02 FILLER                   PIC X      VALUE SPACE.          NC1274.2 IMP
   000045         004800     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1274.2 IMP
   000046         004900     02 FILLER                   PIC X      VALUE SPACE.          NC1274.2 IMP
   000047         005000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1274.2 IMP
   000048         005100     02 FILLER                   PIC X      VALUE SPACE.          NC1274.2 IMP
   000049         005200     02  PAR-NAME.                                                NC1274.2
   000050         005300       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1274.2 IMP
   000051         005400       03  PARDOT-X              PIC X      VALUE SPACE.          NC1274.2 IMP
   000052         005500       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1274.2 IMP
   000053         005600     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1274.2 IMP
   000054         005700     02 RE-MARK                  PIC X(61).                       NC1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 01  TEST-COMPUTED.                                               NC1274.2
   000056         005900     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1274.2 IMP
   000057         006000     02 FILLER                   PIC X(17)  VALUE                 NC1274.2
   000058         006100            "       COMPUTED=".                                   NC1274.2
   000059         006200     02 COMPUTED-X.                                               NC1274.2
   000060         006300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1274.2 IMP
   000061         006400     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1274.2 60
   000062         006500                                 PIC -9(9).9(9).                  NC1274.2
   000063         006600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1274.2 60
   000064         006700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1274.2 60
   000065         006800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1274.2 60
   000066         006900     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1274.2 60
   000067         007000         04 COMPUTED-18V0                    PIC -9(18).          NC1274.2
   000068         007100         04 FILLER                           PIC X.               NC1274.2
   000069         007200     03 FILLER PIC X(50) VALUE SPACE.                             NC1274.2 IMP
   000070         007300 01  TEST-CORRECT.                                                NC1274.2
   000071         007400     02 FILLER PIC X(30) VALUE SPACE.                             NC1274.2 IMP
   000072         007500     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1274.2
   000073         007600     02 CORRECT-X.                                                NC1274.2
   000074         007700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1274.2 IMP
   000075         007800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1274.2 74
   000076         007900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1274.2 74
   000077         008000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1274.2 74
   000078         008100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1274.2 74
   000079         008200     03      CR-18V0 REDEFINES CORRECT-A.                         NC1274.2 74
   000080         008300         04 CORRECT-18V0                     PIC -9(18).          NC1274.2
   000081         008400         04 FILLER                           PIC X.               NC1274.2
   000082         008500     03 FILLER PIC X(2) VALUE SPACE.                              NC1274.2 IMP
   000083         008600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1274.2 IMP
   000084         008700 01  CCVS-C-1.                                                    NC1274.2
   000085         008800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1274.2
   000086         008900-    "SS  PARAGRAPH-NAME                                          NC1274.2
   000087         009000-    "       REMARKS".                                            NC1274.2
   000088         009100     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1274.2 IMP
   000089         009200 01  CCVS-C-2.                                                    NC1274.2
   000090         009300     02 FILLER                     PIC X        VALUE SPACE.      NC1274.2 IMP
   000091         009400     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1274.2
   000092         009500     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1274.2 IMP
   000093         009600     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1274.2
   000094         009700     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1274.2 IMP
   000095         009800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1274.2 IMP
   000096         009900 01  REC-CT                        PIC 99       VALUE ZERO.       NC1274.2 IMP
   000097         010000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1274.2 IMP
   000098         010100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1274.2 IMP
   000099         010200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1274.2 IMP
   000100         010300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1274.2 IMP
   000101         010400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1274.2 IMP
   000102         010500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1274.2 IMP
   000103         010600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1274.2 IMP
   000104         010700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1274.2 IMP
   000105         010800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1274.2 IMP
   000106         010900 01  CCVS-H-1.                                                    NC1274.2
   000107         011000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1274.2 IMP
   000108         011100     02  FILLER                    PIC X(42)    VALUE             NC1274.2
   000109         011200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1274.2
   000110         011300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1274.2 IMP
   000111         011400 01  CCVS-H-2A.                                                   NC1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1274.2 IMP
   000113         011600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1274.2
   000114         011700   02  FILLER                        PIC XXXX   VALUE             NC1274.2
   000115         011800     "4.2 ".                                                      NC1274.2
   000116         011900   02  FILLER                        PIC X(28)  VALUE             NC1274.2
   000117         012000            " COPY - NOT FOR DISTRIBUTION".                       NC1274.2
   000118         012100   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1274.2 IMP
   000119         012200                                                                  NC1274.2
   000120         012300 01  CCVS-H-2B.                                                   NC1274.2
   000121         012400   02  FILLER                        PIC X(15)  VALUE             NC1274.2
   000122         012500            "TEST RESULT OF ".                                    NC1274.2
   000123         012600   02  TEST-ID                       PIC X(9).                    NC1274.2
   000124         012700   02  FILLER                        PIC X(4)   VALUE             NC1274.2
   000125         012800            " IN ".                                               NC1274.2
   000126         012900   02  FILLER                        PIC X(12)  VALUE             NC1274.2
   000127         013000     " HIGH       ".                                              NC1274.2
   000128         013100   02  FILLER                        PIC X(22)  VALUE             NC1274.2
   000129         013200            " LEVEL VALIDATION FOR ".                             NC1274.2
   000130         013300   02  FILLER                        PIC X(58)  VALUE             NC1274.2
   000131         013400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1274.2
   000132         013500 01  CCVS-H-3.                                                    NC1274.2
   000133         013600     02  FILLER                      PIC X(34)  VALUE             NC1274.2
   000134         013700            " FOR OFFICIAL USE ONLY    ".                         NC1274.2
   000135         013800     02  FILLER                      PIC X(58)  VALUE             NC1274.2
   000136         013900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1274.2
   000137         014000     02  FILLER                      PIC X(28)  VALUE             NC1274.2
   000138         014100            "  COPYRIGHT   1985 ".                                NC1274.2
   000139         014200 01  CCVS-E-1.                                                    NC1274.2
   000140         014300     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1274.2 IMP
   000141         014400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1274.2
   000142         014500     02 ID-AGAIN                     PIC X(9).                    NC1274.2
   000143         014600     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1274.2 IMP
   000144         014700 01  CCVS-E-2.                                                    NC1274.2
   000145         014800     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1274.2 IMP
   000146         014900     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1274.2 IMP
   000147         015000     02 CCVS-E-2-2.                                               NC1274.2
   000148         015100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1274.2 IMP
   000149         015200         03 FILLER                   PIC X      VALUE SPACE.      NC1274.2 IMP
   000150         015300         03 ENDER-DESC               PIC X(44)  VALUE             NC1274.2
   000151         015400            "ERRORS ENCOUNTERED".                                 NC1274.2
   000152         015500 01  CCVS-E-3.                                                    NC1274.2
   000153         015600     02  FILLER                      PIC X(22)  VALUE             NC1274.2
   000154         015700            " FOR OFFICIAL USE ONLY".                             NC1274.2
   000155         015800     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1274.2 IMP
   000156         015900     02  FILLER                      PIC X(58)  VALUE             NC1274.2
   000157         016000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1274.2
   000158         016100     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1274.2 IMP
   000159         016200     02 FILLER                       PIC X(15)  VALUE             NC1274.2
   000160         016300             " COPYRIGHT 1985".                                   NC1274.2
   000161         016400 01  CCVS-E-4.                                                    NC1274.2
   000162         016500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1274.2 IMP
   000163         016600     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1274.2
   000164         016700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1274.2 IMP
   000165         016800     02 FILLER                       PIC X(40)  VALUE             NC1274.2
   000166         016900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1274.2
   000167         017000 01  XXINFO.                                                      NC1274.2
   000168         017100     02 FILLER                       PIC X(19)  VALUE             NC1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200            "*** INFORMATION ***".                                NC1274.2
   000170         017300     02 INFO-TEXT.                                                NC1274.2
   000171         017400       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1274.2 IMP
   000172         017500       04 XXCOMPUTED                 PIC X(20).                   NC1274.2
   000173         017600       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1274.2 IMP
   000174         017700       04 XXCORRECT                  PIC X(20).                   NC1274.2
   000175         017800     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1274.2
   000176         017900 01  HYPHEN-LINE.                                                 NC1274.2
   000177         018000     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1274.2 IMP
   000178         018100     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1274.2
   000179         018200-    "*****************************************".                 NC1274.2
   000180         018300     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1274.2
   000181         018400-    "******************************".                            NC1274.2
   000182         018500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1274.2
   000183         018600     "NC127A".                                                    NC1274.2
   000184         018700 PROCEDURE DIVISION.                                              NC1274.2
   000185         018800 CCVS1 SECTION.                                                   NC1274.2
   000186         018900 OPEN-FILES.                                                      NC1274.2
   000187         019000     OPEN     OUTPUT PRINT-FILE.                                  NC1274.2 36
   000188         019100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1274.2 182 123 182 142
   000189         019200     MOVE    SPACE TO TEST-RESULTS.                               NC1274.2 IMP 43
   000190         019300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1274.2 215 220
   000191         019400     GO TO CCVS1-EXIT.                                            NC1274.2 302
   000192         019500 CLOSE-FILES.                                                     NC1274.2
   000193         019600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1274.2 224 245 36
   000194         019700 TERMINATE-CCVS.                                                  NC1274.2
   000195         019800     EXIT PROGRAM.                                                NC1274.2
   000196         019900 TERMINATE-CALL.                                                  NC1274.2
   000197         020000     STOP     RUN.                                                NC1274.2
   000198         020100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1274.2 47 99
   000199         020200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1274.2 47 100
   000200         020300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1274.2 47 98
   000201         020400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1274.2 47 97
   000202         020500     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1274.2 54
   000203         020600 PRINT-DETAIL.                                                    NC1274.2
   000204         020700     IF REC-CT NOT EQUAL TO ZERO                                  NC1274.2 96 IMP
   000205      1  020800             MOVE "." TO PARDOT-X                                 NC1274.2 51
   000206      1  020900             MOVE REC-CT TO DOTVALUE.                             NC1274.2 96 52
   000207         021000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1274.2 43 37 257
   000208         021100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1274.2 47 257
   000209      1  021200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1274.2 278 292
   000210      1  021300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1274.2 293 301
   000211         021400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1274.2 IMP 47 IMP 59
   000212         021500     MOVE SPACE TO CORRECT-X.                                     NC1274.2 IMP 73
   000213         021600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1274.2 96 IMP IMP 49
   000214         021700     MOVE     SPACE TO RE-MARK.                                   NC1274.2 IMP 54
   000215         021800 HEAD-ROUTINE.                                                    NC1274.2
   000216         021900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1274.2 106 38 257
   000217         022000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1274.2 111 38 257
   000218         022100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1274.2 120 38 257
   000219         022200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1274.2 132 38 257
   000220         022300 COLUMN-NAMES-ROUTINE.                                            NC1274.2
   000221         022400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1274.2 84 38 257
   000222         022500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1274.2 89 38 257
   000223         022600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1274.2 176 38 257
   000224         022700 END-ROUTINE.                                                     NC1274.2
   000225         022800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1274.2 176 38 257
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 END-RTN-EXIT.                                                    NC1274.2
   000227         023000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1274.2 139 38 257
   000228         023100 END-ROUTINE-1.                                                   NC1274.2
   000229         023200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1274.2 98 102 99
   000230         023300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1274.2 102 97 102
   000231         023400      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1274.2 100 102
   000232         023500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1274.2
   000233         023600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1274.2 100 162
   000234         023700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1274.2 102 164
   000235         023800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1274.2 161 147
   000236         023900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1274.2 144 38 257
   000237         024000  END-ROUTINE-12.                                                 NC1274.2
   000238         024100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1274.2 150
   000239         024200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1274.2 98 IMP
   000240      1  024300         MOVE "NO " TO ERROR-TOTAL                                NC1274.2 148
   000241         024400         ELSE                                                     NC1274.2
   000242      1  024500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1274.2 98 148
   000243         024600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1274.2 144 38
   000244         024700     PERFORM WRITE-LINE.                                          NC1274.2 257
   000245         024800 END-ROUTINE-13.                                                  NC1274.2
   000246         024900     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1274.2 97 IMP
   000247      1  025000         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1274.2 148
   000248      1  025100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1274.2 97 148
   000249         025200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1274.2 150
   000250         025300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1274.2 144 38 257
   000251         025400      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1274.2 99 IMP
   000252      1  025500          MOVE "NO " TO ERROR-TOTAL                               NC1274.2 148
   000253      1  025600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1274.2 99 148
   000254         025700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1274.2 150
   000255         025800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1274.2 144 38 257
   000256         025900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1274.2 152 38 257
   000257         026000 WRITE-LINE.                                                      NC1274.2
   000258         026100     ADD 1 TO RECORD-COUNT.                                       NC1274.2 104
   000259         026200     IF RECORD-COUNT GREATER 42                                   NC1274.2 104
   000260      1  026300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1274.2 38 103
   000261      1  026400         MOVE SPACE TO DUMMY-RECORD                               NC1274.2 IMP 38
   000262      1  026500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1274.2 38
   000263      1  026600         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1274.2 106 38 273
   000264      1  026700         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1274.2 111 38 273
   000265      1  026800         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1274.2 120 38 273
   000266      1  026900         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1274.2 132 38 273
   000267      1  027000         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1274.2 84 38 273
   000268      1  027100         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1274.2 89 38 273
   000269      1  027200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1274.2 176 38 273
   000270      1  027300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1274.2 103 38
   000271      1  027400         MOVE ZERO TO RECORD-COUNT.                               NC1274.2 IMP 104
   000272         027500     PERFORM WRT-LN.                                              NC1274.2 273
   000273         027600 WRT-LN.                                                          NC1274.2
   000274         027700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1274.2 38
   000275         027800     MOVE SPACE TO DUMMY-RECORD.                                  NC1274.2 IMP 38
   000276         027900 BLANK-LINE-PRINT.                                                NC1274.2
   000277         028000     PERFORM WRT-LN.                                              NC1274.2 273
   000278         028100 FAIL-ROUTINE.                                                    NC1274.2
   000279         028200     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1274.2 59 IMP
   000280      1  028300            GO TO FAIL-ROUTINE-WRITE.                             NC1274.2 287
   000281         028400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1274.2 73 IMP 287
   000282         028500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1274.2 105 175
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1274.2 170
   000284         028700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1274.2 167 38 257
   000285         028800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1274.2 IMP 175
   000286         028900     GO TO  FAIL-ROUTINE-EX.                                      NC1274.2 292
   000287         029000 FAIL-ROUTINE-WRITE.                                              NC1274.2
   000288         029100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1274.2 55 37 257
   000289         029200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1274.2 105 83
   000290         029300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1274.2 70 37 257
   000291         029400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1274.2 IMP 83
   000292         029500 FAIL-ROUTINE-EX. EXIT.                                           NC1274.2
   000293         029600 BAIL-OUT.                                                        NC1274.2
   000294         029700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1274.2 60 IMP 296
   000295         029800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1274.2 74 IMP 301
   000296         029900 BAIL-OUT-WRITE.                                                  NC1274.2
   000297         030000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1274.2 74 174 60 172
   000298         030100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1274.2 105 175
   000299         030200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1274.2 167 38 257
   000300         030300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1274.2 IMP 175
   000301         030400 BAIL-OUT-EX. EXIT.                                               NC1274.2
   000302         030500 CCVS1-EXIT.                                                      NC1274.2
   000303         030600     EXIT.                                                        NC1274.2
   000304         030700 sect-nc127a-001 section.                                         NC1274.2
   000305         030800 low-init-gf-1.                                                   NC1274.2
   000306         030900     move   "III-4 NOTE-2" to ansi-reference.                     NC1274.2 105
   000307         031000 low-test-gf-1-1.                                                 NC1274.2
   000308         031100     if      alphabetic-lit-upper not = alphabetic-lit-lower      NC1274.2 40 41
   000309      1  031200             perform pass                                         NC1274.2 199
   000310      1  031300             go to   low-write-gf-1.                              NC1274.2 321
   000311         031400     go to   low-fail-gf-1.                                       NC1274.2 315
   000312         031500 low-delete-gf-1.                                                 NC1274.2
   000313         031600     perform de-lete.                                             NC1274.2 201
   000314         031700     go to   low-write-GF-1.                                      NC1274.2 321
   000315         031800 low-fail-gf-1.                                                   NC1274.2
   000316         031900     move    alphabetic-lit-upper to correct-x.                   NC1274.2 40 73
   000317         032000     move    alphabetic-lit-lower to computed-x.                  NC1274.2 41 59
   000318         032100     move   "upper and lower case should not be equal"            NC1274.2
   000319         032200          to re-mark.                                             NC1274.2 54
   000320         032300     perform fail.                                                NC1274.2 200
   000321         032400 low-write-gf-1.                                                  NC1274.2
   000322         032500     move   "lower case program" to feature.                      NC1274.2 45
   000323         032600     MOVE   "low-test-gf-1" to par-name.                          NC1274.2 49
   000324         032700     perform print-detail.                                        NC1274.2 203
   000325         032800 low-init-gf-2.                                                   NC1274.2
   000326         032900     move   "vi-67 6.4.1" to ansi-reference.                      NC1274.2 105
   000327         033000 low-test-gf-2.                                                   NC1274.2
   000328         033100     if      alpha-lit-upper-lower = "dEfJkLuVw"                  NC1274.2 42
   000329      1  033200             perform pass                                         NC1274.2 199
   000330      1  033300             go to   low-write-gf-2.                              NC1274.2 341
   000331         033400     go to   low-fail-gf-2.                                       NC1274.2 335
   000332         033500 low-delete-gf-2.                                                 NC1274.2
   000333         033600     perform de-lete.                                             NC1274.2 201
   000334         033700     go to   low-write-GF-2.                                      NC1274.2 341
   000335         033800 low-fail-gf-2.                                                   NC1274.2
   000336         033900     move    alpha-lit-upper-lower to correct-x.                  NC1274.2 42 73
   000337         034000     move    alpha-lit-upper-lower to computed-x.                 NC1274.2 42 59
   000338         034100     move   "identical literals should be equal"                  NC1274.2
   000339         034200          to re-mark.                                             NC1274.2 54
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     perform fail.                                                NC1274.2 200
   000341         034400 low-write-gf-2.                                                  NC1274.2
   000342         034500     MOVE   "low-test-gf-2" to par-name.                          NC1274.2 49
   000343         034600     perform print-detail.                                        NC1274.2 203
   000344         034700 CCVS-EXIT SECTION.                                               NC1274.2
   000345         034800 CCVS-999999.                                                     NC1274.2
   000346         034900     GO TO CLOSE-FILES.                                           NC1274.2 192
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page    10
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       42   ALPHA-LIT-UPPER-LOWER. . . . .  328 336 337
       41   ALPHABETIC-LIT-LOWER . . . . .  308 317
       40   ALPHABETIC-LIT-UPPER . . . . .  308 316
      105   ANSI-REFERENCE . . . . . . . .  282 289 298 M306 M326
       84   CCVS-C-1 . . . . . . . . . . .  221 267
       89   CCVS-C-2 . . . . . . . . . . .  222 268
      139   CCVS-E-1 . . . . . . . . . . .  227
      144   CCVS-E-2 . . . . . . . . . . .  236 243 250 255
      147   CCVS-E-2-2 . . . . . . . . . .  M235
      152   CCVS-E-3 . . . . . . . . . . .  256
      161   CCVS-E-4 . . . . . . . . . . .  235
      162   CCVS-E-4-1 . . . . . . . . . .  M233
      164   CCVS-E-4-2 . . . . . . . . . .  M234
      106   CCVS-H-1 . . . . . . . . . . .  216 263
      111   CCVS-H-2A. . . . . . . . . . .  217 264
      120   CCVS-H-2B. . . . . . . . . . .  218 265
      132   CCVS-H-3 . . . . . . . . . . .  219 266
      182   CCVS-PGM-ID. . . . . . . . . .  188 188
       66   CM-18V0
       60   COMPUTED-A . . . . . . . . . .  61 63 64 65 66 294 297
       61   COMPUTED-N
       59   COMPUTED-X . . . . . . . . . .  M211 279 M317 M337
       63   COMPUTED-0V18
       65   COMPUTED-14V4
       67   COMPUTED-18V0
       64   COMPUTED-4V14
       83   COR-ANSI-REFERENCE . . . . . .  M289 M291
       74   CORRECT-A. . . . . . . . . . .  75 76 77 78 79 295 297
       75   CORRECT-N
       73   CORRECT-X. . . . . . . . . . .  M212 281 M316 M336
       76   CORRECT-0V18
       78   CORRECT-14V4
       80   CORRECT-18V0
       77   CORRECT-4V14
       79   CR-18V0
       97   DELETE-COUNTER . . . . . . . .  M201 230 246 248
       52   DOTVALUE . . . . . . . . . . .  M206
      103   DUMMY-HOLD . . . . . . . . . .  M260 270
       38   DUMMY-RECORD . . . . . . . . .  M216 M217 M218 M219 M221 M222 M223 M225 M227 M236 M243 M250 M255 M256 260 M261
                                            262 M263 M264 M265 M266 M267 M268 M269 M270 274 M275 M284 M299
      150   ENDER-DESC . . . . . . . . . .  M238 M249 M254
       98   ERROR-COUNTER. . . . . . . . .  M200 229 239 242
      102   ERROR-HOLD . . . . . . . . . .  M229 M230 M230 M231 234
      148   ERROR-TOTAL. . . . . . . . . .  M240 M242 M247 M248 M252 M253
       45   FEATURE. . . . . . . . . . . .  M322
      176   HYPHEN-LINE. . . . . . . . . .  223 225 269
      142   ID-AGAIN . . . . . . . . . . .  M188
      175   INF-ANSI-REFERENCE . . . . . .  M282 M285 M298 M300
      170   INFO-TEXT. . . . . . . . . . .  M283
       99   INSPECT-COUNTER. . . . . . . .  M198 229 251 253
       47   P-OR-F . . . . . . . . . . . .  M198 M199 M200 M201 208 M211
       49   PAR-NAME . . . . . . . . . . .  M213 M323 M342
       51   PARDOT-X . . . . . . . . . . .  M205
      100   PASS-COUNTER . . . . . . . . .  M199 231 233
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page    11
0 Defined   Cross-reference of data names   References

0      36   PRINT-FILE . . . . . . . . . .  32 187 193
       37   PRINT-REC. . . . . . . . . . .  M207 M288 M290
       54   RE-MARK. . . . . . . . . . . .  M202 M214 M319 M339
       96   REC-CT . . . . . . . . . . . .  204 206 213
       95   REC-SKL-SUB
      104   RECORD-COUNT . . . . . . . . .  M258 259 M271
       55   TEST-COMPUTED. . . . . . . . .  288
       70   TEST-CORRECT . . . . . . . . .  290
      123   TEST-ID. . . . . . . . . . . .  M188
       43   TEST-RESULTS . . . . . . . . .  M189 207
      101   TOTAL-ERROR
      172   XXCOMPUTED . . . . . . . . . .  M297
      174   XXCORRECT. . . . . . . . . . .  M297
      167   XXINFO . . . . . . . . . . . .  284 299
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page    12
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

      293   BAIL-OUT . . . . . . . . . . .  P210
      301   BAIL-OUT-EX. . . . . . . . . .  E210 G295
      296   BAIL-OUT-WRITE . . . . . . . .  G294
      276   BLANK-LINE-PRINT
      344   CCVS-EXIT
      345   CCVS-999999
      185   CCVS1
      302   CCVS1-EXIT . . . . . . . . . .  G191
      192   CLOSE-FILES. . . . . . . . . .  G346
      220   COLUMN-NAMES-ROUTINE . . . . .  E190
      201   DE-LETE. . . . . . . . . . . .  P313 P333
      224   END-ROUTINE. . . . . . . . . .  P193
      228   END-ROUTINE-1
      237   END-ROUTINE-12
      245   END-ROUTINE-13 . . . . . . . .  E193
      226   END-RTN-EXIT
      200   FAIL . . . . . . . . . . . . .  P320 P340
      278   FAIL-ROUTINE . . . . . . . . .  P209
      292   FAIL-ROUTINE-EX. . . . . . . .  E209 G286
      287   FAIL-ROUTINE-WRITE . . . . . .  G280 G281
      215   HEAD-ROUTINE . . . . . . . . .  P190
      198   INSPT
      312   LOW-DELETE-GF-1
      332   LOW-DELETE-GF-2
      315   LOW-FAIL-GF-1. . . . . . . . .  G311
      335   LOW-FAIL-GF-2. . . . . . . . .  G331
      305   LOW-INIT-GF-1
      325   LOW-INIT-GF-2
      307   LOW-TEST-GF-1-1
      327   LOW-TEST-GF-2
      321   LOW-WRITE-GF-1 . . . . . . . .  G310 G314
      341   LOW-WRITE-GF-2 . . . . . . . .  G330 G334
      186   OPEN-FILES
      199   PASS . . . . . . . . . . . . .  P309 P329
      203   PRINT-DETAIL . . . . . . . . .  P324 P343
      304   SECT-NC127A-001
      196   TERMINATE-CALL
      194   TERMINATE-CCVS
      257   WRITE-LINE . . . . . . . . . .  P207 P208 P216 P217 P218 P219 P221 P222 P223 P225 P227 P236 P244 P250 P255 P256
                                            P284 P288 P290 P299
      273   WRT-LN . . . . . . . . . . . .  P263 P264 P265 P266 P267 P268 P269 P272 P277
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page    13
0 Defined   Cross-reference of programs     References

        3   NC127A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC127A    Date 06/04/2022  Time 11:57:29   Page    14
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC127A:
 *    Source records = 346
 *    Data Division statements = 66
 *    Procedure Division statements = 163
 *    Generated COBOL statements = 0
 *    Program complexity factor = 171
0End of compilation 1,  program NC127A,  highest severity 0.
0Return code 0
