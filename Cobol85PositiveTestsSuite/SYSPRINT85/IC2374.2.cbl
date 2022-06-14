1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:26   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:26   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2374.2
   000002         000200 PROGRAM-ID.                                                      IC2374.2
   000003         000300     IC237A.                                                      IC2374.2
   000004         000500*                                                              *  IC2374.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2374.2
   000006         000700*                                                              *  IC2374.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2374.2
   000008         000900*                                                              *  IC2374.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2374.2
   000010         001100*                                                              *  IC2374.2
   000011         001300*                                                              *  IC2374.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2374.2
   000013         001500*                                                              *  IC2374.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2374.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2374.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2374.2
   000017         001900*                                                              *  IC2374.2
   000018         002100*                                                              *  IC2374.2
   000019         002200*    PROGRAMS IC237A AND IC237A-1 TEST THE ACCESSING OF A      *  IC2374.2
   000020         002300*    LINKAGE SECTION ITEM.                                     *  IC2374.2
   000021         002400*                                                              *  IC2374.2
   000022         002600 ENVIRONMENT DIVISION.                                            IC2374.2
   000023         002700 CONFIGURATION SECTION.                                           IC2374.2
   000024         002800 SOURCE-COMPUTER.                                                 IC2374.2
   000025         002900     XXXXX082.                                                    IC2374.2
   000026         003000 OBJECT-COMPUTER.                                                 IC2374.2
   000027         003100     XXXXX083.                                                    IC2374.2
   000028         003200 INPUT-OUTPUT SECTION.                                            IC2374.2
   000029         003300 FILE-CONTROL.                                                    IC2374.2
   000030         003400     SELECT PRINT-FILE ASSIGN TO                                  IC2374.2 34
   000031         003500     XXXXX055.                                                    IC2374.2
   000032         003600 DATA DIVISION.                                                   IC2374.2
   000033         003700 FILE SECTION.                                                    IC2374.2
   000034         003800 FD  PRINT-FILE.                                                  IC2374.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003900 01  PRINT-REC PICTURE X(120).                                    IC2374.2
   000036         004000 01  DUMMY-RECORD PICTURE X(120).                                 IC2374.2
   000037         004100 WORKING-STORAGE SECTION.                                         IC2374.2
   000038         004200 01  WS-A                        PIC 9 VALUE ZERO.                IC2374.2 IMP
   000039         004300 01  WS-B                        PIC 9 VALUE ZERO.                IC2374.2 IMP
   000040         004400 01  WS-C                        PIC 9 VALUE ZERO.                IC2374.2 IMP
   000041         004500*                                                                 IC2374.2
   000042         004600 01  TEST-RESULTS.                                                IC2374.2
   000043         004700     02 FILLER                   PIC X      VALUE SPACE.          IC2374.2 IMP
   000044         004800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2374.2 IMP
   000045         004900     02 FILLER                   PIC X      VALUE SPACE.          IC2374.2 IMP
   000046         005000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2374.2 IMP
   000047         005100     02 FILLER                   PIC X      VALUE SPACE.          IC2374.2 IMP
   000048         005200     02  PAR-NAME.                                                IC2374.2
   000049         005300       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2374.2 IMP
   000050         005400       03  PARDOT-X              PIC X      VALUE SPACE.          IC2374.2 IMP
   000051         005500       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2374.2 IMP
   000052         005600     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2374.2 IMP
   000053         005700     02 RE-MARK                  PIC X(61).                       IC2374.2
   000054         005800 01  TEST-COMPUTED.                                               IC2374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2374.2 IMP
   000056         006000     02 FILLER                   PIC X(17)  VALUE                 IC2374.2
   000057         006100            "       COMPUTED=".                                   IC2374.2
   000058         006200     02 COMPUTED-X.                                               IC2374.2
   000059         006300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2374.2 IMP
   000060         006400     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2374.2 59
   000061         006500                                 PIC -9(9).9(9).                  IC2374.2
   000062         006600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2374.2 59
   000063         006700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2374.2 59
   000064         006800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2374.2 59
   000065         006900     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2374.2 59
   000066         007000         04 COMPUTED-18V0                    PIC -9(18).          IC2374.2
   000067         007100         04 FILLER                           PIC X.               IC2374.2
   000068         007200     03 FILLER PIC X(50) VALUE SPACE.                             IC2374.2 IMP
   000069         007300 01  TEST-CORRECT.                                                IC2374.2
   000070         007400     02 FILLER PIC X(30) VALUE SPACE.                             IC2374.2 IMP
   000071         007500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2374.2
   000072         007600     02 CORRECT-X.                                                IC2374.2
   000073         007700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2374.2 IMP
   000074         007800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2374.2 73
   000075         007900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2374.2 73
   000076         008000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2374.2 73
   000077         008100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2374.2 73
   000078         008200     03      CR-18V0 REDEFINES CORRECT-A.                         IC2374.2 73
   000079         008300         04 CORRECT-18V0                     PIC -9(18).          IC2374.2
   000080         008400         04 FILLER                           PIC X.               IC2374.2
   000081         008500     03 FILLER PIC X(2) VALUE SPACE.                              IC2374.2 IMP
   000082         008600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2374.2 IMP
   000083         008700 01  CCVS-C-1.                                                    IC2374.2
   000084         008800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2374.2
   000085         008900-    "SS  PARAGRAPH-NAME                                          IC2374.2
   000086         009000-    "       REMARKS".                                            IC2374.2
   000087         009100     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2374.2 IMP
   000088         009200 01  CCVS-C-2.                                                    IC2374.2
   000089         009300     02 FILLER                     PIC X        VALUE SPACE.      IC2374.2 IMP
   000090         009400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2374.2
   000091         009500     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2374.2 IMP
   000092         009600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2374.2
   000093         009700     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2374.2 IMP
   000094         009800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2374.2 IMP
   000095         009900 01  REC-CT                        PIC 99       VALUE ZERO.       IC2374.2 IMP
   000096         010000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2374.2 IMP
   000097         010100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2374.2 IMP
   000098         010200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2374.2 IMP
   000099         010300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2374.2 IMP
   000100         010400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2374.2 IMP
   000101         010500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2374.2 IMP
   000102         010600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2374.2 IMP
   000103         010700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2374.2 IMP
   000104         010800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2374.2 IMP
   000105         010900 01  CCVS-H-1.                                                    IC2374.2
   000106         011000     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2374.2 IMP
   000107         011100     02  FILLER                    PIC X(42)    VALUE             IC2374.2
   000108         011200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2374.2
   000109         011300     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2374.2 IMP
   000110         011400 01  CCVS-H-2A.                                                   IC2374.2
   000111         011500   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2374.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2374.2
   000113         011700   02  FILLER                        PIC XXXX   VALUE             IC2374.2
   000114         011800     "4.2 ".                                                      IC2374.2
   000115         011900   02  FILLER                        PIC X(28)  VALUE             IC2374.2
   000116         012000            " COPY - NOT FOR DISTRIBUTION".                       IC2374.2
   000117         012100   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2374.2 IMP
   000118         012200                                                                  IC2374.2
   000119         012300 01  CCVS-H-2B.                                                   IC2374.2
   000120         012400   02  FILLER                        PIC X(15)  VALUE             IC2374.2
   000121         012500            "TEST RESULT OF ".                                    IC2374.2
   000122         012600   02  TEST-ID                       PIC X(9).                    IC2374.2
   000123         012700   02  FILLER                        PIC X(4)   VALUE             IC2374.2
   000124         012800            " IN ".                                               IC2374.2
   000125         012900   02  FILLER                        PIC X(12)  VALUE             IC2374.2
   000126         013000     " HIGH       ".                                              IC2374.2
   000127         013100   02  FILLER                        PIC X(22)  VALUE             IC2374.2
   000128         013200            " LEVEL VALIDATION FOR ".                             IC2374.2
   000129         013300   02  FILLER                        PIC X(58)  VALUE             IC2374.2
   000130         013400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2374.2
   000131         013500 01  CCVS-H-3.                                                    IC2374.2
   000132         013600     02  FILLER                      PIC X(34)  VALUE             IC2374.2
   000133         013700            " FOR OFFICIAL USE ONLY    ".                         IC2374.2
   000134         013800     02  FILLER                      PIC X(58)  VALUE             IC2374.2
   000135         013900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2374.2
   000136         014000     02  FILLER                      PIC X(28)  VALUE             IC2374.2
   000137         014100            "  COPYRIGHT   1985 ".                                IC2374.2
   000138         014200 01  CCVS-E-1.                                                    IC2374.2
   000139         014300     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2374.2 IMP
   000140         014400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2374.2
   000141         014500     02 ID-AGAIN                     PIC X(9).                    IC2374.2
   000142         014600     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2374.2 IMP
   000143         014700 01  CCVS-E-2.                                                    IC2374.2
   000144         014800     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2374.2 IMP
   000145         014900     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2374.2 IMP
   000146         015000     02 CCVS-E-2-2.                                               IC2374.2
   000147         015100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2374.2 IMP
   000148         015200         03 FILLER                   PIC X      VALUE SPACE.      IC2374.2 IMP
   000149         015300         03 ENDER-DESC               PIC X(44)  VALUE             IC2374.2
   000150         015400            "ERRORS ENCOUNTERED".                                 IC2374.2
   000151         015500 01  CCVS-E-3.                                                    IC2374.2
   000152         015600     02  FILLER                      PIC X(22)  VALUE             IC2374.2
   000153         015700            " FOR OFFICIAL USE ONLY".                             IC2374.2
   000154         015800     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2374.2 IMP
   000155         015900     02  FILLER                      PIC X(58)  VALUE             IC2374.2
   000156         016000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2374.2
   000157         016100     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2374.2 IMP
   000158         016200     02 FILLER                       PIC X(15)  VALUE             IC2374.2
   000159         016300             " COPYRIGHT 1985".                                   IC2374.2
   000160         016400 01  CCVS-E-4.                                                    IC2374.2
   000161         016500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2374.2 IMP
   000162         016600     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2374.2
   000163         016700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2374.2 IMP
   000164         016800     02 FILLER                       PIC X(40)  VALUE             IC2374.2
   000165         016900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2374.2
   000166         017000 01  XXINFO.                                                      IC2374.2
   000167         017100     02 FILLER                       PIC X(19)  VALUE             IC2374.2
   000168         017200            "*** INFORMATION ***".                                IC2374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02 INFO-TEXT.                                                IC2374.2
   000170         017400       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2374.2 IMP
   000171         017500       04 XXCOMPUTED                 PIC X(20).                   IC2374.2
   000172         017600       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2374.2 IMP
   000173         017700       04 XXCORRECT                  PIC X(20).                   IC2374.2
   000174         017800     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2374.2
   000175         017900 01  HYPHEN-LINE.                                                 IC2374.2
   000176         018000     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2374.2 IMP
   000177         018100     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2374.2
   000178         018200-    "*****************************************".                 IC2374.2
   000179         018300     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2374.2
   000180         018400-    "******************************".                            IC2374.2
   000181         018500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2374.2
   000182         018600     "IC237A".                                                    IC2374.2
   000183         018700 PROCEDURE DIVISION.                                              IC2374.2
   000184         018800 CCVS1 SECTION.                                                   IC2374.2
   000185         018900 OPEN-FILES.                                                      IC2374.2
   000186         019000     OPEN     OUTPUT PRINT-FILE.                                  IC2374.2 34
   000187         019100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2374.2 181 122 181 141
   000188         019200     MOVE    SPACE TO TEST-RESULTS.                               IC2374.2 IMP 42
   000189         019300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2374.2 214 219
   000190         019400     GO TO CCVS1-EXIT.                                            IC2374.2 296
   000191         019500 CLOSE-FILES.                                                     IC2374.2
   000192         019600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2374.2 223 244 34
   000193         019700 TERMINATE-CCVS.                                                  IC2374.2
   000194         019800     EXIT PROGRAM.                                                IC2374.2
   000195         019900 TERMINATE-CALL.                                                  IC2374.2
   000196         020000     STOP     RUN.                                                IC2374.2
   000197         020100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2374.2 46 98
   000198         020200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2374.2 46 99
   000199         020300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2374.2 46 97
   000200         020400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2374.2 46 96
   000201         020500     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2374.2 53
   000202         020600 PRINT-DETAIL.                                                    IC2374.2
   000203         020700     IF REC-CT NOT EQUAL TO ZERO                                  IC2374.2 95 IMP
   000204      1  020800             MOVE "." TO PARDOT-X                                 IC2374.2 50
   000205      1  020900             MOVE REC-CT TO DOTVALUE.                             IC2374.2 95 51
   000206         021000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2374.2 42 35 256
   000207         021100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2374.2 46 256
   000208      1  021200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2374.2 273 286
   000209      1  021300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2374.2 287 295
   000210         021400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2374.2 IMP 46 IMP 58
   000211         021500     MOVE SPACE TO CORRECT-X.                                     IC2374.2 IMP 72
   000212         021600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2374.2 95 IMP IMP 48
   000213         021700     MOVE     SPACE TO RE-MARK.                                   IC2374.2 IMP 53
   000214         021800 HEAD-ROUTINE.                                                    IC2374.2
   000215         021900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2374.2 105 36 256
   000216         022000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2374.2 110 36 256
   000217         022100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2374.2 119 36 256
   000218         022200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2374.2 131 36 256
   000219         022300 COLUMN-NAMES-ROUTINE.                                            IC2374.2
   000220         022400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2374.2 83 36 256
   000221         022500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2374.2 88 36 256
   000222         022600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2374.2 175 36 256
   000223         022700 END-ROUTINE.                                                     IC2374.2
   000224         022800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2374.2 175 36 256
   000225         022900 END-RTN-EXIT.                                                    IC2374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2374.2 138 36 256
   000227         023100 END-ROUTINE-1.                                                   IC2374.2
   000228         023200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2374.2 97 101 98
   000229         023300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2374.2 101 96 101
   000230         023400      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2374.2 99 101
   000231         023500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2374.2
   000232         023600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2374.2 99 161
   000233         023700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2374.2 101 163
   000234         023800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2374.2 160 146
   000235         023900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2374.2 143 36 256
   000236         024000  END-ROUTINE-12.                                                 IC2374.2
   000237         024100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2374.2 149
   000238         024200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2374.2 97 IMP
   000239      1  024300         MOVE "NO " TO ERROR-TOTAL                                IC2374.2 147
   000240         024400         ELSE                                                     IC2374.2
   000241      1  024500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2374.2 97 147
   000242         024600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2374.2 143 36
   000243         024700     PERFORM WRITE-LINE.                                          IC2374.2 256
   000244         024800 END-ROUTINE-13.                                                  IC2374.2
   000245         024900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2374.2 96 IMP
   000246      1  025000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2374.2 147
   000247      1  025100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2374.2 96 147
   000248         025200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2374.2 149
   000249         025300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2374.2 143 36 256
   000250         025400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2374.2 98 IMP
   000251      1  025500          MOVE "NO " TO ERROR-TOTAL                               IC2374.2 147
   000252      1  025600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2374.2 98 147
   000253         025700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2374.2 149
   000254         025800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2374.2 143 36 256
   000255         025900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2374.2 151 36 256
   000256         026000 WRITE-LINE.                                                      IC2374.2
   000257         026100     ADD 1 TO RECORD-COUNT.                                       IC2374.2 103
   000258         026200     IF RECORD-COUNT GREATER 50                                   IC2374.2 103
   000259      1  026300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2374.2 36 102
   000260      1  026400         MOVE SPACE TO DUMMY-RECORD                               IC2374.2 IMP 36
   000261      1  026500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2374.2 36
   000262      1  026600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2374.2 83 36 268
   000263      1  026700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2374.2 88 36 268
   000264      1  026800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2374.2 175 36 268
   000265      1  026900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2374.2 102 36
   000266      1  027000         MOVE ZERO TO RECORD-COUNT.                               IC2374.2 IMP 103
   000267         027100     PERFORM WRT-LN.                                              IC2374.2 268
   000268         027200 WRT-LN.                                                          IC2374.2
   000269         027300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2374.2 36
   000270         027400     MOVE SPACE TO DUMMY-RECORD.                                  IC2374.2 IMP 36
   000271         027500 BLANK-LINE-PRINT.                                                IC2374.2
   000272         027600     PERFORM WRT-LN.                                              IC2374.2 268
   000273         027700 FAIL-ROUTINE.                                                    IC2374.2
   000274         027800     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2374.2 58 IMP 281
   000275         027900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2374.2 72 IMP 281
   000276         028000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2374.2 104 174
   000277         028100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2374.2 169
   000278         028200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2374.2 166 36 256
   000279         028300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2374.2 IMP 174
   000280         028400     GO TO  FAIL-ROUTINE-EX.                                      IC2374.2 286
   000281         028500 FAIL-ROUTINE-WRITE.                                              IC2374.2
   000282         028600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2374.2 54 35 256
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2374.2 104 82
   000284         028800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2374.2 69 35 256
   000285         028900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2374.2 IMP 82
   000286         029000 FAIL-ROUTINE-EX. EXIT.                                           IC2374.2
   000287         029100 BAIL-OUT.                                                        IC2374.2
   000288         029200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2374.2 59 IMP 290
   000289         029300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2374.2 73 IMP 295
   000290         029400 BAIL-OUT-WRITE.                                                  IC2374.2
   000291         029500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2374.2 73 173 59 171
   000292         029600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2374.2 104 174
   000293         029700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2374.2 166 36 256
   000294         029800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2374.2 IMP 174
   000295         029900 BAIL-OUT-EX. EXIT.                                               IC2374.2
   000296         030000 CCVS1-EXIT.                                                      IC2374.2
   000297         030100     EXIT.                                                        IC2374.2
   000298         030200 SECT-IC237A-001 SECTION.                                         IC2374.2
   000299         030300*                                                                 IC2374.2
   000300         030400 CALL-INIT-1.                                                     IC2374.2
   000301         030500     MOVE   "CALL-TEST-1" TO PAR-NAME.                            IC2374.2 48
   000302         030600     MOVE    1 TO WS-A.                                           IC2374.2 38
   000303         030700     MOVE    3 TO WS-B.                                           IC2374.2 39
   000304         030800     MOVE    5 TO WS-C.                                           IC2374.2 40
   000305         030900 CALL-TEST-0.                                                     IC2374.2
   000306         031000     CALL   "IC237A-1" USING WS-A WS-B WS-C.                      IC2374.2 EXT 38 39 40

 ==000306==> IGYPG0020-W Name "IC237A-1" was processed as "IC237A01".

   000307         031100 CALL-TEST-1.                                                     IC2374.2
   000308         031200     IF      WS-C = WS-A                                          IC2374.2 40 38
   000309      1  031300             PERFORM PASS                                         IC2374.2 198
   000310      1  031400             PERFORM PRINT-DETAIL                                 IC2374.2 202
   000311         031500     ELSE                                                         IC2374.2
   000312      1  031600             MOVE    1 TO CORRECT-N                               IC2374.2 74
   000313      1  031700             MOVE    WS-A TO COMPUTED-N                           IC2374.2 38 60
   000314      1  031800             MOVE   "WRONG VALUE RETURNED FROM CALL TO IC237A-1"  IC2374.2
   000315      1  031900                  TO RE-MARK                                      IC2374.2 53
   000316      1  032000             PERFORM FAIL                                         IC2374.2 199
   000317      1  032100             PERFORM PRINT-DETAIL.                                IC2374.2 202
   000318         032200*                                                                 IC2374.2
   000319         032300 CCVS-EXIT SECTION.                                               IC2374.2
   000320         032400 CCVS-999999.                                                     IC2374.2
   000321         032500     GO TO CLOSE-FILES.                                           IC2374.2 191
   000322         032600 END PROGRAM IC237A.                                              IC2374.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page     9
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      104   ANSI-REFERENCE . . . . . . . .  276 283 292
       83   CCVS-C-1 . . . . . . . . . . .  220 262
       88   CCVS-C-2 . . . . . . . . . . .  221 263
      138   CCVS-E-1 . . . . . . . . . . .  226
      143   CCVS-E-2 . . . . . . . . . . .  235 242 249 254
      146   CCVS-E-2-2 . . . . . . . . . .  M234
      151   CCVS-E-3 . . . . . . . . . . .  255
      160   CCVS-E-4 . . . . . . . . . . .  234
      161   CCVS-E-4-1 . . . . . . . . . .  M232
      163   CCVS-E-4-2 . . . . . . . . . .  M233
      105   CCVS-H-1 . . . . . . . . . . .  215
      110   CCVS-H-2A. . . . . . . . . . .  216
      119   CCVS-H-2B. . . . . . . . . . .  217
      131   CCVS-H-3 . . . . . . . . . . .  218
      181   CCVS-PGM-ID. . . . . . . . . .  187 187
       65   CM-18V0
       59   COMPUTED-A . . . . . . . . . .  60 62 63 64 65 288 291
       60   COMPUTED-N . . . . . . . . . .  M313
       58   COMPUTED-X . . . . . . . . . .  M210 274
       62   COMPUTED-0V18
       64   COMPUTED-14V4
       66   COMPUTED-18V0
       63   COMPUTED-4V14
       82   COR-ANSI-REFERENCE . . . . . .  M283 M285
       73   CORRECT-A. . . . . . . . . . .  74 75 76 77 78 289 291
       74   CORRECT-N. . . . . . . . . . .  M312
       72   CORRECT-X. . . . . . . . . . .  M211 275
       75   CORRECT-0V18
       77   CORRECT-14V4
       79   CORRECT-18V0
       76   CORRECT-4V14
       78   CR-18V0
       96   DELETE-COUNTER . . . . . . . .  M200 229 245 247
       51   DOTVALUE . . . . . . . . . . .  M205
      102   DUMMY-HOLD . . . . . . . . . .  M259 265
       36   DUMMY-RECORD . . . . . . . . .  M215 M216 M217 M218 M220 M221 M222 M224 M226 M235 M242 M249 M254 M255 259 M260
                                            261 M262 M263 M264 M265 269 M270 M278 M293
      149   ENDER-DESC . . . . . . . . . .  M237 M248 M253
       97   ERROR-COUNTER. . . . . . . . .  M199 228 238 241
      101   ERROR-HOLD . . . . . . . . . .  M228 M229 M229 M230 233
      147   ERROR-TOTAL. . . . . . . . . .  M239 M241 M246 M247 M251 M252
       44   FEATURE
      175   HYPHEN-LINE. . . . . . . . . .  222 224 264
      141   ID-AGAIN . . . . . . . . . . .  M187
      174   INF-ANSI-REFERENCE . . . . . .  M276 M279 M292 M294
      169   INFO-TEXT. . . . . . . . . . .  M277
       98   INSPECT-COUNTER. . . . . . . .  M197 228 250 252
       46   P-OR-F . . . . . . . . . . . .  M197 M198 M199 M200 207 M210
       48   PAR-NAME . . . . . . . . . . .  M212 M301
       50   PARDOT-X . . . . . . . . . . .  M204
       99   PASS-COUNTER . . . . . . . . .  M198 230 232
       34   PRINT-FILE . . . . . . . . . .  30 186 192
       35   PRINT-REC. . . . . . . . . . .  M206 M282 M284
       53   RE-MARK. . . . . . . . . . . .  M201 M213 M315
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page    10
0 Defined   Cross-reference of data names   References

0      95   REC-CT . . . . . . . . . . . .  203 205 212
       94   REC-SKL-SUB
      103   RECORD-COUNT . . . . . . . . .  M257 258 M266
       54   TEST-COMPUTED. . . . . . . . .  282
       69   TEST-CORRECT . . . . . . . . .  284
      122   TEST-ID. . . . . . . . . . . .  M187
       42   TEST-RESULTS . . . . . . . . .  M188 206
      100   TOTAL-ERROR
       38   WS-A . . . . . . . . . . . . .  M302 306 308 313
       39   WS-B . . . . . . . . . . . . .  M303 306
       40   WS-C . . . . . . . . . . . . .  M304 306 308
      171   XXCOMPUTED . . . . . . . . . .  M291
      173   XXCORRECT. . . . . . . . . . .  M291
      166   XXINFO . . . . . . . . . . . .  278 293
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page    11
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

      287   BAIL-OUT . . . . . . . . . . .  P209
      295   BAIL-OUT-EX. . . . . . . . . .  E209 G289
      290   BAIL-OUT-WRITE . . . . . . . .  G288
      271   BLANK-LINE-PRINT
      300   CALL-INIT-1
      305   CALL-TEST-0
      307   CALL-TEST-1
      319   CCVS-EXIT
      320   CCVS-999999
      184   CCVS1
      296   CCVS1-EXIT . . . . . . . . . .  G190
      191   CLOSE-FILES. . . . . . . . . .  G321
      219   COLUMN-NAMES-ROUTINE . . . . .  E189
      200   DE-LETE
      223   END-ROUTINE. . . . . . . . . .  P192
      227   END-ROUTINE-1
      236   END-ROUTINE-12
      244   END-ROUTINE-13 . . . . . . . .  E192
      225   END-RTN-EXIT
      199   FAIL . . . . . . . . . . . . .  P316
      273   FAIL-ROUTINE . . . . . . . . .  P208
      286   FAIL-ROUTINE-EX. . . . . . . .  E208 G280
      281   FAIL-ROUTINE-WRITE . . . . . .  G274 G275
      214   HEAD-ROUTINE . . . . . . . . .  P189
      197   INSPT
      185   OPEN-FILES
      198   PASS . . . . . . . . . . . . .  P309
      202   PRINT-DETAIL . . . . . . . . .  P310 P317
      298   SECT-IC237A-001
      195   TERMINATE-CALL
      193   TERMINATE-CCVS
      256   WRITE-LINE . . . . . . . . . .  P206 P207 P215 P216 P217 P218 P220 P221 P222 P224 P226 P235 P243 P249 P254 P255
                                            P278 P282 P284 P293
      268   WRT-LN . . . . . . . . . . . .  P262 P263 P264 P267 P272
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page    12
0 Defined   Cross-reference of programs     References

        3   IC237A . . . . . . . . . . . .  322
 EXTERNAL   IC237A-1 . . . . . . . . . . .  306
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A    Date 06/04/2022  Time 11:56:26   Page    13
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    306  IGYPG0020-W   Name "IC237A-1" was processed as "IC237A01".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program IC237A:
 *    Source records = 322
 *    Data Division statements = 66
 *    Procedure Division statements = 141
 *    Generated COBOL statements = 0
 *    Program complexity factor = 148
0End of compilation 1,  program IC237A,  highest severity 4.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A01  Date 06/04/2022  Time 11:56:26   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000323         032700 IDENTIFICATION DIVISION.                                         IC2374.2
   000324         032800 PROGRAM-ID.                                                      IC2374.2
   000325         032900     IC237A-1.                                                    IC2374.2

 ==000325==> IGYDS0020-W Name "IC237A-1" was processed as "IC237A01".

   000326         033100*                                                              *  IC2374.2
   000327         033200*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2374.2
   000328         033300*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2374.2
   000329         033400*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2374.2
   000330         033500*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2374.2
   000331         033600*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2374.2
   000332         033700*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2374.2
   000333         033800*                                                              *  IC2374.2
   000334         033900*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2374.2
   000335         034000*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2374.2
   000336         034100*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2374.2
   000337         034200*                                                              *  IC2374.2
   000338         034300*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2374.2
   000339         034400*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2374.2
   000340         034500*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2374.2
   000341         034600*                                                              *  IC2374.2
   000342         034700*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2374.2
   000343         034800*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2374.2
   000344         034900*                & INFORMATION TECHNOLOGY                      *  IC2374.2
   000345         035000*          TWO SKYLINE PLACE                                   *  IC2374.2
   000346         035100*          SUITE 1100                                          *  IC2374.2
   000347         035200*          5203 LEESBURG PIKE                                  *  IC2374.2
   000348         035300*          FALLS CHURCH                                        *  IC2374.2
   000349         035400*          VA 22041                                            *  IC2374.2
   000350         035500*          U.S.A.                                              *  IC2374.2
   000351         035600*                                                              *  IC2374.2
   000352         035700*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2374.2
   000353         035800*                                                              *  IC2374.2
   000354         035900*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2374.2
   000355         036000*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2374.2
   000356         036100*          21 RUE BARA                                         *  IC2374.2
   000357         036200*          F-92132 ISSY                                        *  IC2374.2
   000358         036300*          FRANCE                                              *  IC2374.2
   000359         036400*                                                              *  IC2374.2
   000360         036500*                                                              *  IC2374.2
   000361         036600*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2374.2
   000362         036700*               UND DATENVERARBEITUNG MBH)                     *  IC2374.2
   000363         036800*          SCHLOSS BIRLINGHOVEN                                *  IC2374.2
   000364         036900*          POSTFACH 12 40                                      *  IC2374.2
   000365         037000*          D-5205 ST. AUGUSTIN 1                               *  IC2374.2
   000366         037100*          GERMANY FR                                          *  IC2374.2
   000367         037200*                                                              *  IC2374.2
   000368         037300*                                                              *  IC2374.2
   000369         037400*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2374.2
   000370         037500*          OXFORD ROAD                                         *  IC2374.2
   000371         037600*          MANCHESTER                                          *  IC2374.2
   000372         037700*          M1 7ED                                              *  IC2374.2
   000373         037800*          UNITED KINGDOM                                      *  IC2374.2
   000374         037900*                                                              *  IC2374.2
   000375         038000*                                                              *  IC2374.2
   000376         038100*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A01  Date 06/04/2022  Time 11:56:26   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000377         038200*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2374.2
   000378         038300*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2374.2
   000379         038400*                                                              *  IC2374.2
   000380         038600*                                                              *  IC2374.2
   000381         038700*    VALIDATION FOR:-                                          *  IC2374.2
   000382         038800*                                                              *  IC2374.2
   000383         038900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2374.2
   000384         039000*                                                              *  IC2374.2
   000385         039100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2374.2
   000386         039200*                                                              *  IC2374.2
   000387         039400*                                                              *  IC2374.2
   000388         039500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2374.2
   000389         039600*                                                              *  IC2374.2
   000390         039700*        X-55  - SYSTEM PRINTER NAME.                          *  IC2374.2
   000391         039800*        X-82  - SOURCE COMPUTER NAME.                         *  IC2374.2
   000392         039900*        X-83  - OBJECT COMPUTER NAME.                         *  IC2374.2
   000393         040000*                                                              *  IC2374.2
   000394         040200 ENVIRONMENT DIVISION.                                            IC2374.2
   000395         040300 CONFIGURATION SECTION.                                           IC2374.2
   000396         040400 SOURCE-COMPUTER.                                                 IC2374.2
   000397         040500     XXXXX082.                                                    IC2374.2
   000398         040600 OBJECT-COMPUTER.                                                 IC2374.2
   000399         040700     XXXXX083.                                                    IC2374.2
   000400         040800 INPUT-OUTPUT SECTION.                                            IC2374.2
   000401         040900 FILE-CONTROL.                                                    IC2374.2
   000402         041000     SELECT PRINT-FILE ASSIGN TO                                  IC2374.2 406
   000403         041100     XXXXX055.                                                    IC2374.2
   000404         041200 DATA DIVISION.                                                   IC2374.2
   000405         041300 FILE SECTION.                                                    IC2374.2
   000406         041400 FD  PRINT-FILE.                                                  IC2374.2

 ==000406==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000407         041500 01  PRINT-REC PICTURE X(120).                                    IC2374.2
   000408         041600 01  DUMMY-RECORD PICTURE X(120).                                 IC2374.2
   000409         041700 WORKING-STORAGE SECTION.                                         IC2374.2
   000410         041800*                                                                 IC2374.2
   000411         041900 LINKAGE SECTION.                                                 IC2374.2
   000412         042000 01  L-A                   PIC 9.                                 IC2374.2
   000413         042100 01  L-A1 REDEFINES L-A    PIC 9.                                 IC2374.2 412
   000414         042200 01  L-B                   PIC 9.                                 IC2374.2
   000415         042300 01  L-C                   PIC 9.                                 IC2374.2
   000416         042400 PROCEDURE DIVISION USING L-A L-B L-C.                            IC2374.2 412 414 415
   000417         042500*                                                                 IC2374.2
   000418         042600 SECT-IC237A-1-001 SECTION.                                       IC2374.2
   000419         042700*                                                                 IC2374.2
   000420         042800 CALLED-FROM-NC121A-FUNCTION.                                     IC2374.2
   000421         042900     MOVE    L-A1 TO L-C.                                         IC2374.2 413 415
   000422         043000 IC237A-EXIT.                                                     IC2374.2
   000423         043100     EXIT PROGRAM.                                                IC2374.2
   000424         043200 END-OF-PROGRAM.                                                  IC2374.2
   000425         043300 END PROGRAM IC237A-1.                                            IC2374.2 325

 ==000425==> IGYSC0020-W Name "IC237A-1" was processed as "IC237A01".

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A01  Date 06/04/2022  Time 11:56:26   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      408   DUMMY-RECORD
      412   L-A. . . . . . . . . . . . . .  413 416
      413   L-A1 . . . . . . . . . . . . .  421
      414   L-B. . . . . . . . . . . . . .  416
      415   L-C. . . . . . . . . . . . . .  416 M421
      406   PRINT-FILE . . . . . . . . . .  402
      407   PRINT-REC
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A01  Date 06/04/2022  Time 11:56:26   Page    17
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

      420   CALLED-FROM-NC121A-FUNCTION
      424   END-OF-PROGRAM
      422   IC237A-EXIT
      418   SECT-IC237A-1-001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A01  Date 06/04/2022  Time 11:56:26   Page    18
0 Defined   Cross-reference of programs     References

      325   IC237A01 . . . . . . . . . . .  425
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC237A01  Date 06/04/2022  Time 11:56:26   Page    19
0LineID  Message code  Message text

    325  IGYDS0020-W   Name "IC237A-1" was processed as "IC237A01".

                       Same message on line:    425

    406  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           1              2
-* Statistics for COBOL program IC237A01:
 *    Source records = 103
 *    Data Division statements = 6
 *    Procedure Division statements = 2
 *    Generated COBOL statements = 0
 *    Program complexity factor = 2
0End of compilation 2,  program IC237A01,  highest severity 4.
0Return code 4
