1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:54   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:54   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2244.2
   000002         000200 PROGRAM-ID.                                                      IC2244.2
   000003         000300     IC224A.                                                      IC2244.2
   000004         000500*                                                              *  IC2244.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2244.2
   000006         000700*                                                              *  IC2244.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2244.2
   000008         000900*                                                              *  IC2244.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2244.2
   000010         001100*                                                              *  IC2244.2
   000011         001300*                                                              *  IC2244.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2244.2
   000013         001500*                                                              *  IC2244.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2244.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2244.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2244.2
   000017         001900*                                                              *  IC2244.2
   000018         002100*                                                              *  IC2244.2
   000019         002200*    PROGRAM IC224A AND IC224A-1 WILL TEST THE NEW LANGUAGE    *  IC2244.2
   000020         002300*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2244.2
   000021         002400*    MODULE.                                                   *  IC2244.2
   000022         002500*    THE NEW LANGUAGE ELEMENTS TO BE TESTED WILL BE:           *  IC2244.2
   000023         002600*          "BY CONTENT"       PHRASE                           *  IC2244.2
   000024         002700*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2244.2
   000025         002800*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2244.2
   000026         002900*    IDENTIFICATION DIVISION.                                  *  IC2244.2
   000027         003000*    PROGRAM-ID. IC224A.                                       *  IC2244.2
   000028         003100*              .                                               *  IC2244.2
   000029         003200*              .                                               *  IC2244.2
   000030         003300*              .                                               *  IC2244.2
   000031         003400*    END PROGRAM IC224A.                                       *  IC2244.2
   000032         003500*    PROGRAM-ID. IC224A-1.                                     *  IC2244.2
   000033         003600*              .                                               *  IC2244.2
   000034         003700*              .                                               *  IC2244.2
   000035         003800*              .                                               *  IC2244.2
   000036         004000 ENVIRONMENT DIVISION.                                            IC2244.2
   000037         004100 CONFIGURATION SECTION.                                           IC2244.2
   000038         004200 SOURCE-COMPUTER.                                                 IC2244.2
   000039         004300     XXXXX082.                                                    IC2244.2
   000040         004400 OBJECT-COMPUTER.                                                 IC2244.2
   000041         004500     XXXXX083.                                                    IC2244.2
   000042         004600 INPUT-OUTPUT SECTION.                                            IC2244.2
   000043         004700 FILE-CONTROL.                                                    IC2244.2
   000044         004800     SELECT PRINT-FILE ASSIGN TO                                  IC2244.2 48
   000045         004900     XXXXX055.                                                    IC2244.2
   000046         005000 DATA DIVISION.                                                   IC2244.2
   000047         005100 FILE SECTION.                                                    IC2244.2
   000048         005200 FD  PRINT-FILE.                                                  IC2244.2

 ==000048==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000049         005300 01  PRINT-REC PICTURE X(120).                                    IC2244.2
   000050         005400 01  DUMMY-RECORD PICTURE X(120).                                 IC2244.2
   000051         005500 WORKING-STORAGE SECTION.                                         IC2244.2
   000052         005600 77  DN1 PICTURE S99  VALUE ZERO.                                 IC2244.2 IMP
   000053         005700 77  DN3 PICTURE S99.                                             IC2244.2
   000054         005800 77  ID1 PICTURE X(8) VALUE "IC224A-1".                           IC2244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  ID2 PICTURE X(8).                                            IC2244.2
   000056         006000 77  DN2 PICTURE S99                                              IC2244.2
   000057         006100         USAGE COMPUTATIONAL, VALUE ZERO.                         IC2244.2 IMP
   000058         006200 77  DN4 PICTURE S99                                              IC2244.2
   000059         006300         USAGE IS COMPUTATIONAL.                                  IC2244.2
   000060         006400 77  SAVE-DN1 PICTURE S99.                                        IC2244.2
   000061         006500 77  SAVE-DN3 PICTURE S99.                                        IC2244.2
   000062         006600 77  SAVE-DN2 PICTURE S99                                         IC2244.2
   000063         006700         USAGE COMPUTATIONAL.                                     IC2244.2
   000064         006800 77  SAVE-DN4 PICTURE S99                                         IC2244.2
   000065         006900         USAGE IS COMPUTATIONAL.                                  IC2244.2
   000066         007000 77  CALL-COUNT PIC S99.                                          IC2244.2
   000067         007100 77  FAIL-FLAG PIC 9.                                             IC2244.2
   000068         007200 01  TEST-RESULTS.                                                IC2244.2
   000069         007300     02 FILLER                   PIC X      VALUE SPACE.          IC2244.2 IMP
   000070         007400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2244.2 IMP
   000071         007500     02 FILLER                   PIC X      VALUE SPACE.          IC2244.2 IMP
   000072         007600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2244.2 IMP
   000073         007700     02 FILLER                   PIC X      VALUE SPACE.          IC2244.2 IMP
   000074         007800     02  PAR-NAME.                                                IC2244.2
   000075         007900       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2244.2 IMP
   000076         008000       03  PARDOT-X              PIC X      VALUE SPACE.          IC2244.2 IMP
   000077         008100       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2244.2 IMP
   000078         008200     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2244.2 IMP
   000079         008300     02 RE-MARK                  PIC X(61).                       IC2244.2
   000080         008400 01  TEST-COMPUTED.                                               IC2244.2
   000081         008500     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2244.2 IMP
   000082         008600     02 FILLER                   PIC X(17)  VALUE                 IC2244.2
   000083         008700            "       COMPUTED=".                                   IC2244.2
   000084         008800     02 COMPUTED-X.                                               IC2244.2
   000085         008900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2244.2 IMP
   000086         009000     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2244.2 85
   000087         009100                                 PIC -9(9).9(9).                  IC2244.2
   000088         009200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2244.2 85
   000089         009300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2244.2 85
   000090         009400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2244.2 85
   000091         009500     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2244.2 85
   000092         009600         04 COMPUTED-18V0                    PIC -9(18).          IC2244.2
   000093         009700         04 FILLER                           PIC X.               IC2244.2
   000094         009800     03 FILLER PIC X(50) VALUE SPACE.                             IC2244.2 IMP
   000095         009900 01  TEST-CORRECT.                                                IC2244.2
   000096         010000     02 FILLER PIC X(30) VALUE SPACE.                             IC2244.2 IMP
   000097         010100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2244.2
   000098         010200     02 CORRECT-X.                                                IC2244.2
   000099         010300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2244.2 IMP
   000100         010400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2244.2 99
   000101         010500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2244.2 99
   000102         010600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2244.2 99
   000103         010700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2244.2 99
   000104         010800     03      CR-18V0 REDEFINES CORRECT-A.                         IC2244.2 99
   000105         010900         04 CORRECT-18V0                     PIC -9(18).          IC2244.2
   000106         011000         04 FILLER                           PIC X.               IC2244.2
   000107         011100     03 FILLER PIC X(2) VALUE SPACE.                              IC2244.2 IMP
   000108         011200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2244.2 IMP
   000109         011300 01  CCVS-C-1.                                                    IC2244.2
   000110         011400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2244.2
   000111         011500-    "SS  PARAGRAPH-NAME                                          IC2244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600-    "       REMARKS".                                            IC2244.2
   000113         011700     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2244.2 IMP
   000114         011800 01  CCVS-C-2.                                                    IC2244.2
   000115         011900     02 FILLER                     PIC X        VALUE SPACE.      IC2244.2 IMP
   000116         012000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2244.2
   000117         012100     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2244.2 IMP
   000118         012200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2244.2
   000119         012300     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2244.2 IMP
   000120         012400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2244.2 IMP
   000121         012500 01  REC-CT                        PIC 99       VALUE ZERO.       IC2244.2 IMP
   000122         012600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2244.2 IMP
   000123         012700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2244.2 IMP
   000124         012800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2244.2 IMP
   000125         012900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2244.2 IMP
   000126         013000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2244.2 IMP
   000127         013100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2244.2 IMP
   000128         013200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2244.2 IMP
   000129         013300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2244.2 IMP
   000130         013400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2244.2 IMP
   000131         013500 01  CCVS-H-1.                                                    IC2244.2
   000132         013600     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2244.2 IMP
   000133         013700     02  FILLER                    PIC X(42)    VALUE             IC2244.2
   000134         013800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2244.2
   000135         013900     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2244.2 IMP
   000136         014000 01  CCVS-H-2A.                                                   IC2244.2
   000137         014100   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2244.2 IMP
   000138         014200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2244.2
   000139         014300   02  FILLER                        PIC XXXX   VALUE             IC2244.2
   000140         014400     "4.2 ".                                                      IC2244.2
   000141         014500   02  FILLER                        PIC X(28)  VALUE             IC2244.2
   000142         014600            " COPY - NOT FOR DISTRIBUTION".                       IC2244.2
   000143         014700   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2244.2 IMP
   000144         014800                                                                  IC2244.2
   000145         014900 01  CCVS-H-2B.                                                   IC2244.2
   000146         015000   02  FILLER                        PIC X(15)  VALUE             IC2244.2
   000147         015100            "TEST RESULT OF ".                                    IC2244.2
   000148         015200   02  TEST-ID                       PIC X(9).                    IC2244.2
   000149         015300   02  FILLER                        PIC X(4)   VALUE             IC2244.2
   000150         015400            " IN ".                                               IC2244.2
   000151         015500   02  FILLER                        PIC X(12)  VALUE             IC2244.2
   000152         015600     " HIGH       ".                                              IC2244.2
   000153         015700   02  FILLER                        PIC X(22)  VALUE             IC2244.2
   000154         015800            " LEVEL VALIDATION FOR ".                             IC2244.2
   000155         015900   02  FILLER                        PIC X(58)  VALUE             IC2244.2
   000156         016000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2244.2
   000157         016100 01  CCVS-H-3.                                                    IC2244.2
   000158         016200     02  FILLER                      PIC X(34)  VALUE             IC2244.2
   000159         016300            " FOR OFFICIAL USE ONLY    ".                         IC2244.2
   000160         016400     02  FILLER                      PIC X(58)  VALUE             IC2244.2
   000161         016500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2244.2
   000162         016600     02  FILLER                      PIC X(28)  VALUE             IC2244.2
   000163         016700            "  COPYRIGHT   1985 ".                                IC2244.2
   000164         016800 01  CCVS-E-1.                                                    IC2244.2
   000165         016900     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2244.2 IMP
   000166         017000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2244.2
   000167         017100     02 ID-AGAIN                     PIC X(9).                    IC2244.2
   000168         017200     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2244.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  CCVS-E-2.                                                    IC2244.2
   000170         017400     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2244.2 IMP
   000171         017500     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2244.2 IMP
   000172         017600     02 CCVS-E-2-2.                                               IC2244.2
   000173         017700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2244.2 IMP
   000174         017800         03 FILLER                   PIC X      VALUE SPACE.      IC2244.2 IMP
   000175         017900         03 ENDER-DESC               PIC X(44)  VALUE             IC2244.2
   000176         018000            "ERRORS ENCOUNTERED".                                 IC2244.2
   000177         018100 01  CCVS-E-3.                                                    IC2244.2
   000178         018200     02  FILLER                      PIC X(22)  VALUE             IC2244.2
   000179         018300            " FOR OFFICIAL USE ONLY".                             IC2244.2
   000180         018400     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2244.2 IMP
   000181         018500     02  FILLER                      PIC X(58)  VALUE             IC2244.2
   000182         018600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2244.2
   000183         018700     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2244.2 IMP
   000184         018800     02 FILLER                       PIC X(15)  VALUE             IC2244.2
   000185         018900             " COPYRIGHT 1985".                                   IC2244.2
   000186         019000 01  CCVS-E-4.                                                    IC2244.2
   000187         019100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2244.2 IMP
   000188         019200     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2244.2
   000189         019300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2244.2 IMP
   000190         019400     02 FILLER                       PIC X(40)  VALUE             IC2244.2
   000191         019500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2244.2
   000192         019600 01  XXINFO.                                                      IC2244.2
   000193         019700     02 FILLER                       PIC X(19)  VALUE             IC2244.2
   000194         019800            "*** INFORMATION ***".                                IC2244.2
   000195         019900     02 INFO-TEXT.                                                IC2244.2
   000196         020000       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2244.2 IMP
   000197         020100       04 XXCOMPUTED                 PIC X(20).                   IC2244.2
   000198         020200       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2244.2 IMP
   000199         020300       04 XXCORRECT                  PIC X(20).                   IC2244.2
   000200         020400     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2244.2
   000201         020500 01  HYPHEN-LINE.                                                 IC2244.2
   000202         020600     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2244.2 IMP
   000203         020700     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2244.2
   000204         020800-    "*****************************************".                 IC2244.2
   000205         020900     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2244.2
   000206         021000-    "******************************".                            IC2244.2
   000207         021100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2244.2
   000208         021200     "IC224A".                                                    IC2244.2
   000209         021300 PROCEDURE DIVISION.                                              IC2244.2
   000210         021400 CCVS1 SECTION.                                                   IC2244.2
   000211         021500 OPEN-FILES.                                                      IC2244.2
   000212         021600     OPEN     OUTPUT PRINT-FILE.                                  IC2244.2 48
   000213         021700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2244.2 207 148 207 167
   000214         021800     MOVE    SPACE TO TEST-RESULTS.                               IC2244.2 IMP 68
   000215         021900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2244.2 240 245
   000216         022000     GO TO CCVS1-EXIT.                                            IC2244.2 322
   000217         022100 CLOSE-FILES.                                                     IC2244.2
   000218         022200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2244.2 249 270 48
   000219         022300 TERMINATE-CCVS.                                                  IC2244.2
   000220         022400     EXIT PROGRAM.                                                IC2244.2
   000221         022500 TERMINATE-CALL.                                                  IC2244.2
   000222         022600     STOP     RUN.                                                IC2244.2
   000223         022700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2244.2 72 124
   000224         022800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2244.2 72 125
   000225         022900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2244.2 72 123
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2244.2 72 122
   000227         023100     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2244.2 79
   000228         023200 PRINT-DETAIL.                                                    IC2244.2
   000229         023300     IF REC-CT NOT EQUAL TO ZERO                                  IC2244.2 121 IMP
   000230      1  023400             MOVE "." TO PARDOT-X                                 IC2244.2 76
   000231      1  023500             MOVE REC-CT TO DOTVALUE.                             IC2244.2 121 77
   000232         023600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2244.2 68 49 282
   000233         023700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2244.2 72 282
   000234      1  023800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2244.2 299 312
   000235      1  023900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2244.2 313 321
   000236         024000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2244.2 IMP 72 IMP 84
   000237         024100     MOVE SPACE TO CORRECT-X.                                     IC2244.2 IMP 98
   000238         024200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2244.2 121 IMP IMP 74
   000239         024300     MOVE     SPACE TO RE-MARK.                                   IC2244.2 IMP 79
   000240         024400 HEAD-ROUTINE.                                                    IC2244.2
   000241         024500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2244.2 131 50 282
   000242         024600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2244.2 136 50 282
   000243         024700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2244.2 145 50 282
   000244         024800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2244.2 157 50 282
   000245         024900 COLUMN-NAMES-ROUTINE.                                            IC2244.2
   000246         025000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2244.2 109 50 282
   000247         025100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2244.2 114 50 282
   000248         025200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2244.2 201 50 282
   000249         025300 END-ROUTINE.                                                     IC2244.2
   000250         025400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2244.2 201 50 282
   000251         025500 END-RTN-EXIT.                                                    IC2244.2
   000252         025600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2244.2 164 50 282
   000253         025700 END-ROUTINE-1.                                                   IC2244.2
   000254         025800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2244.2 123 127 124
   000255         025900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2244.2 127 122 127
   000256         026000      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2244.2 125 127
   000257         026100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2244.2
   000258         026200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2244.2 125 187
   000259         026300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2244.2 127 189
   000260         026400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2244.2 186 172
   000261         026500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2244.2 169 50 282
   000262         026600  END-ROUTINE-12.                                                 IC2244.2
   000263         026700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2244.2 175
   000264         026800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2244.2 123 IMP
   000265      1  026900         MOVE "NO " TO ERROR-TOTAL                                IC2244.2 173
   000266         027000         ELSE                                                     IC2244.2
   000267      1  027100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2244.2 123 173
   000268         027200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2244.2 169 50
   000269         027300     PERFORM WRITE-LINE.                                          IC2244.2 282
   000270         027400 END-ROUTINE-13.                                                  IC2244.2
   000271         027500     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2244.2 122 IMP
   000272      1  027600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2244.2 173
   000273      1  027700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2244.2 122 173
   000274         027800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2244.2 175
   000275         027900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2244.2 169 50 282
   000276         028000      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2244.2 124 IMP
   000277      1  028100          MOVE "NO " TO ERROR-TOTAL                               IC2244.2 173
   000278      1  028200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2244.2 124 173
   000279         028300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2244.2 175
   000280         028400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2244.2 169 50 282
   000281         028500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2244.2 177 50 282
   000282         028600 WRITE-LINE.                                                      IC2244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     ADD 1 TO RECORD-COUNT.                                       IC2244.2 129
   000284         028800     IF RECORD-COUNT GREATER 50                                   IC2244.2 129
   000285      1  028900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2244.2 50 128
   000286      1  029000         MOVE SPACE TO DUMMY-RECORD                               IC2244.2 IMP 50
   000287      1  029100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2244.2 50
   000288      1  029200         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2244.2 109 50 294
   000289      1  029300         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2244.2 114 50 294
   000290      1  029400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2244.2 201 50 294
   000291      1  029500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2244.2 128 50
   000292      1  029600         MOVE ZERO TO RECORD-COUNT.                               IC2244.2 IMP 129
   000293         029700     PERFORM WRT-LN.                                              IC2244.2 294
   000294         029800 WRT-LN.                                                          IC2244.2
   000295         029900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2244.2 50
   000296         030000     MOVE SPACE TO DUMMY-RECORD.                                  IC2244.2 IMP 50
   000297         030100 BLANK-LINE-PRINT.                                                IC2244.2
   000298         030200     PERFORM WRT-LN.                                              IC2244.2 294
   000299         030300 FAIL-ROUTINE.                                                    IC2244.2
   000300         030400     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2244.2 84 IMP 307
   000301         030500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2244.2 98 IMP 307
   000302         030600     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IC2244.2 130 200
   000303         030700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2244.2 195
   000304         030800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2244.2 192 50 282
   000305         030900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2244.2 IMP 200
   000306         031000     GO TO  FAIL-ROUTINE-EX.                                      IC2244.2 312
   000307         031100 FAIL-ROUTINE-WRITE.                                              IC2244.2
   000308         031200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2244.2 80 49 282
   000309         031300     MOVE ANSI-REFERENCE TO COR-ANSI-REFERENCE.                   IC2244.2 130 108
   000310         031400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2244.2 95 49 282
   000311         031500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2244.2 IMP 108
   000312         031600 FAIL-ROUTINE-EX. EXIT.                                           IC2244.2
   000313         031700 BAIL-OUT.                                                        IC2244.2
   000314         031800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2244.2 85 IMP 316
   000315         031900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2244.2 99 IMP 321
   000316         032000 BAIL-OUT-WRITE.                                                  IC2244.2
   000317         032100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2244.2 99 199 85 197
   000318         032200     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IC2244.2 130 200
   000319         032300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2244.2 192 50 282
   000320         032400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2244.2 IMP 200
   000321         032500 BAIL-OUT-EX. EXIT.                                               IC2244.2
   000322         032600 CCVS1-EXIT.                                                      IC2244.2
   000323         032700     EXIT.                                                        IC2244.2
   000324         032800 SECT-IC224A-001 SECTION.                                         IC2244.2
   000325         032900 CALL-TEST-01.                                                    IC2244.2
   000326         033000     MOVE "CALL-TEST-01" TO PAR-NAME.                             IC2244.2 74
   000327         033100     MOVE     "LEV 2 CALL STATEMENT" TO FEATURE.                  IC2244.2 70
   000328         033200     MOVE 0 TO CALL-COUNT.                                        IC2244.2 66
   000329         033300*        THIS TEST HAS CALL STATEMENTS WITH AN IDENTIFIER         IC2244.2
   000330         033400*    CONTAINING THE NAME OF THE SUBPROGRAM TO BE CALLED.          IC2244.2
   000331         033500*        CALL-TEST-01 CONTAINS THE BASIC LEVEL 2 CALL STATEMENT.  IC2244.2
   000332         033600*    IF IT CANNOT BE COMPILED AND EXECUTED CORRECTLY, THERE IS    IC2244.2
   000333         033700*    NO USE IN RUNNING THE LEVEL 2 IPC ROUTINES.                  IC2244.2
   000334         033800 CALL-TEST-01-01.                                                 IC2244.2
   000335         033900     MOVE ZERO TO DN3, DN4.                                       IC2244.2 IMP 53 58
   000336         034000     MOVE  "CALL-TEST-01-01" TO PAR-NAME.                         IC2244.2 74
   000337         034100     MOVE  DN1 TO SAVE-DN1.                                       IC2244.2 52 60
   000338         034200     MOVE  DN2 TO SAVE-DN2.                                       IC2244.2 56 62
   000339         034300     MOVE  DN3 TO SAVE-DN3.                                       IC2244.2 53 61
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     MOVE  DN4 TO SAVE-DN4.                                       IC2244.2 58 64
   000341         034500     CALL "IC224A-1" USING BY CONTENT DN1, DN2, DN3, DN4          IC2244.2 EXT 52 56 53 58

 ==000341==> IGYPG0020-W Name "IC224A-1" was processed as "IC224A01".

   000342         034600     END-CALL.                                                    IC2244.2
   000343         034700     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000344         034800 CALL-TEST-01-02.                                                 IC2244.2
   000345         034900     ADD 1 TO REC-CT.                                             IC2244.2 121
   000346         035000     MOVE ZERO TO DN3, DN4.                                       IC2244.2 IMP 53 58
   000347         035100     MOVE  "CALL-TEST-01-02" TO PAR-NAME.                         IC2244.2 74
   000348         035200     MOVE  DN1 TO SAVE-DN1.                                       IC2244.2 52 60
   000349         035300     MOVE  DN2 TO SAVE-DN2.                                       IC2244.2 56 62
   000350         035400     MOVE  DN3 TO SAVE-DN3.                                       IC2244.2 53 61
   000351         035500     MOVE  DN4 TO SAVE-DN4.                                       IC2244.2 58 64
   000352         035600     CALL ID1 USING CONTENT DN1, DN2, DN3, DN4                    IC2244.2 54 52 56 53 58
   000353         035700     END-CALL.                                                    IC2244.2
   000354         035800     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000355         035900 CALL-TEST-01-03.                                                 IC2244.2
   000356         036000     MOVE ID1 TO ID2.                                             IC2244.2 54 55
   000357         036100     MOVE ZERO TO DN3, DN4.                                       IC2244.2 IMP 53 58
   000358         036200     MOVE  "CALL-TEST-01-03" TO PAR-NAME.                         IC2244.2 74
   000359         036300     MOVE  DN1 TO SAVE-DN1.                                       IC2244.2 52 60
   000360         036400     MOVE  DN2 TO SAVE-DN2.                                       IC2244.2 56 62
   000361         036500     MOVE  DN3 TO SAVE-DN3.                                       IC2244.2 53 61
   000362         036600     MOVE  DN4 TO SAVE-DN4.                                       IC2244.2 58 64
   000363         036700     CALL ID2 USING CONTENT DN1 DN2 DN3 DN4                       IC2244.2 55 52 56 53 58
   000364         036800     END-CALL.                                                    IC2244.2
   000365         036900     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000366         037000 CALL-TEST-01-04.                                                 IC2244.2
   000367         037100     MOVE "IC224A-1" TO ID2.                                      IC2244.2 55
   000368         037200     MOVE ZERO TO DN3, DN4.                                       IC2244.2 IMP 53 58
   000369         037300     MOVE  "CALL-TEST-01-03" TO PAR-NAME.                         IC2244.2 74
   000370         037400     MOVE  DN1 TO SAVE-DN1.                                       IC2244.2 52 60
   000371         037500     MOVE  DN2 TO SAVE-DN2.                                       IC2244.2 56 62
   000372         037600     MOVE  DN3 TO SAVE-DN3.                                       IC2244.2 53 61
   000373         037700     MOVE  DN4 TO SAVE-DN4.                                       IC2244.2 58 64
   000374         037800     CALL ID2 USING CONTENT DN1, DN2, DN3, DN4                    IC2244.2 55 52 56 53 58
   000375         037900     END-CALL.                                                    IC2244.2
   000376         038000     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000377         038100 CALL-TEST-02.                                                    IC2244.2
   000378         038200     MOVE "CALL-TEST-02" TO PAR-NAME.                             IC2244.2 74
   000379         038300     MOVE "DATA-NAME USED TWICE" TO FEATURE.                      IC2244.2 70
   000380         038400*        THIS TEST USES A DATA-NAME MORE THAN ONCE IN             IC2244.2
   000381         038500*    A USING PHRASE OF A CALL STATEMENT.                          IC2244.2
   000382         038600 CALL-INIT-02-01.                                                 IC2244.2
   000383         038700     MOVE    1 TO DN1.                                            IC2244.2 52
   000384         038800     MOVE    0 TO DN2, DN3, DN4.                                  IC2244.2 56 53 58
   000385         038900     MOVE   "CALL-TEST-02-01" TO PAR-NAME.                        IC2244.2 74
   000386         039000     MOVE    DN1 TO SAVE-DN1.                                     IC2244.2 52 60
   000387         039100     MOVE    DN2 TO SAVE-DN2.                                     IC2244.2 56 62
   000388         039200     MOVE    DN3 TO SAVE-DN3.                                     IC2244.2 53 61
   000389         039300     MOVE    DN4 TO SAVE-DN4.                                     IC2244.2 58 64
   000390         039400     GO TO   CALL-TEST-02-01.                                     IC2244.2 395
   000391         039500 CALL-DELETE-02-01.                                               IC2244.2
   000392         039600     PERFORM DE-LETE.                                             IC2244.2 226
   000393         039700     PERFORM PRINT-DETAIL.                                        IC2244.2 228
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000394         039800     GO TO   CALL-INIT-02-02.                                     IC2244.2 399
   000395         039900 CALL-TEST-02-01.                                                 IC2244.2
   000396         040000     CALL   "IC224A-1" USING CONTENT DN1, DN2, DN1, DN4           IC2244.2 EXT 52 56 52 58

 ==000396==> IGYPG0020-W Name "IC224A-1" was processed as "IC224A01".

   000397         040100     END-CALL.                                                    IC2244.2
   000398         040200     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000399         040300 CALL-INIT-02-02.                                                 IC2244.2
   000400         040400     MOVE    0 TO DN1, DN2, DN3, DN4.                             IC2244.2 52 56 53 58
   000401         040500     MOVE   "CALL-TEST-02-02" TO PAR-NAME.                        IC2244.2 74
   000402         040600     MOVE    DN1 TO SAVE-DN1.                                     IC2244.2 52 60
   000403         040700     MOVE    DN2 TO SAVE-DN2.                                     IC2244.2 56 62
   000404         040800     MOVE    DN3 TO SAVE-DN3.                                     IC2244.2 53 61
   000405         040900     MOVE    DN4 TO SAVE-DN4.                                     IC2244.2 58 64
   000406         041000     GO TO   CALL-TEST-02-02.                                     IC2244.2 411
   000407         041100 CALL-DELETE-02-02.                                               IC2244.2
   000408         041200     PERFORM DE-LETE.                                             IC2244.2 226
   000409         041300     PERFORM PRINT-DETAIL.                                        IC2244.2 228
   000410         041400     GO TO   CALL-INIT-02-03.                                     IC2244.2 415
   000411         041500 CALL-TEST-02-02.                                                 IC2244.2
   000412         041600     CALL   "IC224A-1" USING CONTENT DN1, DN2, DN3, DN2           IC2244.2 EXT 52 56 53 56

 ==000412==> IGYPG0020-W Name "IC224A-1" was processed as "IC224A01".

   000413         041700     END-CALL.                                                    IC2244.2
   000414         041800     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000415         041900 CALL-INIT-02-03.                                                 IC2244.2
   000416         042000     MOVE    0 TO DN4, DN3.                                       IC2244.2 58 53
   000417         042100     MOVE    10 TO DN2.                                           IC2244.2 56
   000418         042200     MOVE    25 TO DN1.                                           IC2244.2 52
   000419         042300     MOVE   "CALL-TEST-02-03" TO PAR-NAME.                        IC2244.2 74
   000420         042400     MOVE    DN1 TO SAVE-DN1.                                     IC2244.2 52 60
   000421         042500     MOVE    DN2 TO SAVE-DN2.                                     IC2244.2 56 62
   000422         042600     MOVE    DN3 TO SAVE-DN3.                                     IC2244.2 53 61
   000423         042700     MOVE    DN4 TO SAVE-DN4.                                     IC2244.2 58 64
   000424         042800     GO TO   CALL-TEST-02-03.                                     IC2244.2 429
   000425         042900 CALL-DELETE-02-03.                                               IC2244.2
   000426         043000     PERFORM DE-LETE.                                             IC2244.2 226
   000427         043100     PERFORM PRINT-DETAIL.                                        IC2244.2 228
   000428         043200     GO TO   CALL-TEST-03.                                        IC2244.2 433
   000429         043300 CALL-TEST-02-03.                                                 IC2244.2
   000430         043400     CALL ID1 USING CONTENT DN1 DN2 DN1 DN2                       IC2244.2 54 52 56 52 56
   000431         043500     END-CALL.                                                    IC2244.2
   000432         043600     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000433         043700 CALL-TEST-03.                                                    IC2244.2
   000434         043800*        THIS TEST USES THE ON OVERFLOW PHRASE IN THE CALL        IC2244.2
   000435         043900*    STATEMENT.  THIS IS A SYNTACTICAL CHECK ONLY, THE ON         IC2244.2
   000436         044000*    OVERFLOW CONDITION SHOULD NEVER OCCUR.                       IC2244.2
   000437         044100     MOVE "ON OVERFLOW PHRASE" TO FEATURE.                        IC2244.2 70
   000438         044200 CALL-INIT-03-01.                                                 IC2244.2
   000439         044300     MOVE    20 TO DN1.                                           IC2244.2 52
   000440         044400     MOVE    30 TO DN2.                                           IC2244.2 56
   000441         044500     MOVE    ZERO TO DN3, DN4.                                    IC2244.2 IMP 53 58
   000442         044600     MOVE   "CALL-TEST-03-01" TO PAR-NAME.                        IC2244.2 74
   000443         044700     MOVE    DN1 TO SAVE-DN1.                                     IC2244.2 52 60
   000444         044800     MOVE    DN2 TO SAVE-DN2.                                     IC2244.2 56 62
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000445         044900     MOVE    DN3 TO SAVE-DN3.                                     IC2244.2 53 61
   000446         045000     MOVE    DN4 TO SAVE-DN4.                                     IC2244.2 58 64
   000447         045100     GO TO   CALL-TEST-03-01.                                     IC2244.2 452
   000448         045200 CALL-DELETE-03-01.                                               IC2244.2
   000449         045300     PERFORM DE-LETE.                                             IC2244.2 226
   000450         045400     PERFORM PRINT-DETAIL.                                        IC2244.2 228
   000451         045500     GO TO   CALL-INIT-03-02.                                     IC2244.2 459
   000452         045600 CALL-TEST-03-01.                                                 IC2244.2
   000453         045700     CALL "IC224A-1" USING CONTENT DN1, DN2, DN3, DN4;            IC2244.2 EXT 52 56 53 58

 ==000453==> IGYPG0020-W Name "IC224A-1" was processed as "IC224A01".

   000454      1  045800         ON OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK  IC2244.2 79
   000455      1  045900                     PERFORM FAIL PERFORM PRINT-DETAIL            IC2244.2 225 228
   000456         046000     END-CALL.                                                    IC2244.2
   000457         046100     MOVE   "CALL-TEST-03-01" TO PAR-NAME.                        IC2244.2 74
   000458         046200     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000459         046300 CALL-INIT-03-02.                                                 IC2244.2
   000460         046400     MOVE    ZERO TO DN3, DN4.                                    IC2244.2 IMP 53 58
   000461         046500     MOVE   "CALL-TEST-03-02" TO PAR-NAME.                        IC2244.2 74
   000462         046600     MOVE    DN1 TO SAVE-DN1.                                     IC2244.2 52 60
   000463         046700     MOVE    DN2 TO SAVE-DN2.                                     IC2244.2 56 62
   000464         046800     MOVE    DN3 TO SAVE-DN3.                                     IC2244.2 53 61
   000465         046900     MOVE    DN4 TO SAVE-DN4.                                     IC2244.2 58 64
   000466         047000     GO TO   CALL-TEST-03-02.                                     IC2244.2 471
   000467         047100 CALL-DELETE-03-02.                                               IC2244.2
   000468         047200     PERFORM DE-LETE.                                             IC2244.2 226
   000469         047300     PERFORM PRINT-DETAIL.                                        IC2244.2 228
   000470         047400     GO TO   CALL-INIT-03-03.                                     IC2244.2 477
   000471         047500 CALL-TEST-03-02.                                                 IC2244.2
   000472         047600     CALL "IC224A-1" USING CONTENT DN1, DN2, DN3, DN4;            IC2244.2 EXT 52 56 53 58

 ==000472==> IGYPG0020-W Name "IC224A-1" was processed as "IC224A01".

   000473      1  047700         OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK     IC2244.2 79
   000474      1  047800                   PERFORM FAIL PERFORM PRINT-DETAIL              IC2244.2 225 228
   000475         047900     END-CALL.                                                    IC2244.2
   000476         048000     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000477         048100 CALL-INIT-03-03.                                                 IC2244.2
   000478         048200     MOVE    ZERO TO DN3, DN4.                                    IC2244.2 IMP 53 58
   000479         048300     MOVE   "CALL-TEST-03-03" TO PAR-NAME.                        IC2244.2 74
   000480         048400     MOVE    DN1 TO SAVE-DN1.                                     IC2244.2 52 60
   000481         048500     MOVE    DN2 TO SAVE-DN2.                                     IC2244.2 56 62
   000482         048600     MOVE    DN3 TO SAVE-DN3.                                     IC2244.2 53 61
   000483         048700     MOVE    DN4 TO SAVE-DN4.                                     IC2244.2 58 64
   000484         048800     GO TO   CALL-TEST-03-03.                                     IC2244.2 489
   000485         048900 CALL-DELETE-03-03.                                               IC2244.2
   000486         049000     PERFORM DE-LETE.                                             IC2244.2 226
   000487         049100     PERFORM PRINT-DETAIL.                                        IC2244.2 228
   000488         049200     GO TO   CALL-INIT-03-04.                                     IC2244.2 495
   000489         049300 CALL-TEST-03-03.                                                 IC2244.2
   000490         049400     CALL ID1 USING CONTENT DN1 DN2 DN3 DN4                       IC2244.2 54 52 56 53 58
   000491      1  049500         ON OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK  IC2244.2 79
   000492      1  049600                     PERFORM FAIL  PERFORM PRINT-DETAIL           IC2244.2 225 228
   000493         049700     END-CALL.                                                    IC2244.2
   000494         049800     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000495         049900 CALL-INIT-03-04.                                                 IC2244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000496         050000     MOVE ZERO TO DN3, DN4.                                       IC2244.2 IMP 53 58
   000497         050100     MOVE   "CALL-TEST-03-04" TO PAR-NAME.                        IC2244.2 74
   000498         050200     MOVE    DN1 TO SAVE-DN1.                                     IC2244.2 52 60
   000499         050300     MOVE    DN2 TO SAVE-DN2.                                     IC2244.2 56 62
   000500         050400     MOVE    DN3 TO SAVE-DN3.                                     IC2244.2 53 61
   000501         050500     MOVE    DN4 TO SAVE-DN4.                                     IC2244.2 58 64
   000502         050600     GO TO   CALL-TEST-03-04.                                     IC2244.2 507
   000503         050700 CALL-DELETE-03-04.                                               IC2244.2
   000504         050800     PERFORM DE-LETE.                                             IC2244.2 226
   000505         050900     PERFORM PRINT-DETAIL.                                        IC2244.2 228
   000506         051000     GO TO   EXIT-IC224A.                                         IC2244.2 520
   000507         051100 CALL-TEST-03-04.                                                 IC2244.2
   000508         051200     CALL ID1 USING CONTENT DN1 DN2 DN3 DN4;                      IC2244.2 54 52 56 53 58
   000509      1  051300         OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK,    IC2244.2 79
   000510      1  051400                  PERFORM FAIL  PERFORM PRINT-DETAIL              IC2244.2 225 228
   000511         051500     END-CALL.                                                    IC2244.2
   000512         051600     PERFORM CHECK-TEST-01.                                       IC2244.2 525
   000513         051700     GO TO   EXIT-IC224A.                                         IC2244.2 520
   000514         051800 CALL-DELETE-03.                                                  IC2244.2
   000515         051900*        IF THE ON OVERFLOW PHRASE IS NOT RECOGNIZED, DELETE ALL  IC2244.2
   000516         052000*    OF THE ABOVE CALL-TEST-03 PARAGRAPHS, STARTING WITH          IC2244.2
   000517         052100*    CALL-TEST-03-01.                                             IC2244.2
   000518         052200     PERFORM DE-LETE.                                             IC2244.2 226
   000519         052300     PERFORM PRINT-DETAIL.                                        IC2244.2 228
   000520         052400 EXIT-IC224A.                                                     IC2244.2
   000521         052500     GO TO   CCVS-EXIT.                                           IC2244.2 568
   000522         052600*                                                                 IC2244.2
   000523         052700 SECT-IC224A-CHECK-01.                                            IC2244.2
   000524         052800*=====================                                            IC2244.2
   000525         052900 CHECK-TEST-01.                                                   IC2244.2

 ==000525==> IGYPS2015-I The paragraph or section prior to paragraph or section "CHECK-TEST-01"
                         did not contain any statements.

   000526         053000     MOVE    1 TO REC-CT.                                         IC2244.2 121
   000527         053100     IF      DN1 = SAVE-DN1                                       IC2244.2 52 60
   000528      1  053200             PERFORM PASS                                         IC2244.2 224
   000529      1  053300             PERFORM PRINT-DETAIL                                 IC2244.2 228
   000530         053400     ELSE                                                         IC2244.2
   000531      1  053500             MOVE    SAVE-DN1 TO CORRECT-N                        IC2244.2 60 100
   000532      1  053600             MOVE    DN1      TO COMPUTED-N                       IC2244.2 52 86
   000533      1  053700             MOVE   "VALUE OF DN1 HAS CHANGED" TO RE-MARK         IC2244.2 79
   000534      1  053800             PERFORM FAIL                                         IC2244.2 225
   000535      1  053900             PERFORM PRINT-DETAIL.                                IC2244.2 228
   000536         054000     ADD     1 TO REC-CT.                                         IC2244.2 121
   000537         054100     IF      DN2 = SAVE-DN2                                       IC2244.2 56 62
   000538      1  054200             PERFORM PASS                                         IC2244.2 224
   000539      1  054300             PERFORM PRINT-DETAIL                                 IC2244.2 228
   000540         054400     ELSE                                                         IC2244.2
   000541      1  054500             MOVE    SAVE-DN2 TO CORRECT-N                        IC2244.2 62 100
   000542      1  054600             MOVE    DN2      TO COMPUTED-N                       IC2244.2 56 86
   000543      1  054700             MOVE   "VALUE OF DN2 HAS CHANGED" TO RE-MARK         IC2244.2 79
   000544      1  054800             PERFORM FAIL                                         IC2244.2 225
   000545      1  054900             PERFORM PRINT-DETAIL.                                IC2244.2 228
   000546         055000     ADD     1 TO REC-CT.                                         IC2244.2 121
   000547         055100     IF      DN3 = SAVE-DN3                                       IC2244.2 53 61
   000548      1  055200             PERFORM PASS                                         IC2244.2 224
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000549      1  055300             PERFORM PRINT-DETAIL                                 IC2244.2 228
   000550         055400     ELSE                                                         IC2244.2
   000551      1  055500             MOVE    SAVE-DN3 TO CORRECT-N                        IC2244.2 61 100
   000552      1  055600             MOVE    DN3      TO COMPUTED-N                       IC2244.2 53 86
   000553      1  055700             MOVE   "VALUE OF DN3 HAS CHANGED" TO RE-MARK         IC2244.2 79
   000554      1  055800             PERFORM FAIL                                         IC2244.2 225
   000555      1  055900             PERFORM PRINT-DETAIL.                                IC2244.2 228
   000556         056000     ADD     1 TO REC-CT.                                         IC2244.2 121
   000557         056100     IF      DN4 = SAVE-DN4                                       IC2244.2 58 64
   000558      1  056200             PERFORM PASS                                         IC2244.2 224
   000559      1  056300             PERFORM PRINT-DETAIL                                 IC2244.2 228
   000560         056400     ELSE                                                         IC2244.2
   000561      1  056500             MOVE    SAVE-DN4 TO CORRECT-N                        IC2244.2 64 100
   000562      1  056600             MOVE    DN4      TO COMPUTED-N                       IC2244.2 58 86
   000563      1  056700             MOVE   "VALUE OF DN4 HAS CHANGED" TO RE-MARK         IC2244.2 79
   000564      1  056800             PERFORM FAIL                                         IC2244.2 225
   000565      1  056900             PERFORM PRINT-DETAIL.                                IC2244.2 228
   000566         057000*                                                                 IC2244.2
   000567         057100*                                                                 IC2244.2
   000568         057200 CCVS-EXIT SECTION.                                               IC2244.2
   000569         057300 CCVS-999999.                                                     IC2244.2
   000570         057400     GO TO CLOSE-FILES.                                           IC2244.2 217
   000571         057500 END PROGRAM IC224A.                                              IC2244.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      130   ANSI-REFERENCE . . . . . . . .  302 309 318
       66   CALL-COUNT . . . . . . . . . .  M328
      109   CCVS-C-1 . . . . . . . . . . .  246 288
      114   CCVS-C-2 . . . . . . . . . . .  247 289
      164   CCVS-E-1 . . . . . . . . . . .  252
      169   CCVS-E-2 . . . . . . . . . . .  261 268 275 280
      172   CCVS-E-2-2 . . . . . . . . . .  M260
      177   CCVS-E-3 . . . . . . . . . . .  281
      186   CCVS-E-4 . . . . . . . . . . .  260
      187   CCVS-E-4-1 . . . . . . . . . .  M258
      189   CCVS-E-4-2 . . . . . . . . . .  M259
      131   CCVS-H-1 . . . . . . . . . . .  241
      136   CCVS-H-2A. . . . . . . . . . .  242
      145   CCVS-H-2B. . . . . . . . . . .  243
      157   CCVS-H-3 . . . . . . . . . . .  244
      207   CCVS-PGM-ID. . . . . . . . . .  213 213
       91   CM-18V0
       85   COMPUTED-A . . . . . . . . . .  86 88 89 90 91 314 317
       86   COMPUTED-N . . . . . . . . . .  M532 M542 M552 M562
       84   COMPUTED-X . . . . . . . . . .  M236 300
       88   COMPUTED-0V18
       90   COMPUTED-14V4
       92   COMPUTED-18V0
       89   COMPUTED-4V14
      108   COR-ANSI-REFERENCE . . . . . .  M309 M311
       99   CORRECT-A. . . . . . . . . . .  100 101 102 103 104 315 317
      100   CORRECT-N. . . . . . . . . . .  M531 M541 M551 M561
       98   CORRECT-X. . . . . . . . . . .  M237 301
      101   CORRECT-0V18
      103   CORRECT-14V4
      105   CORRECT-18V0
      102   CORRECT-4V14
      104   CR-18V0
      122   DELETE-COUNTER . . . . . . . .  M226 255 271 273
       52   DN1. . . . . . . . . . . . . .  337 341 348 352 359 363 370 374 M383 386 396 396 M400 402 412 M418 420 430 430
                                            M439 443 453 462 472 480 490 498 508 527 532
       56   DN2. . . . . . . . . . . . . .  338 341 349 352 360 363 371 374 M384 387 396 M400 403 412 412 M417 421 430 430
                                            M440 444 453 463 472 481 490 499 508 537 542
       53   DN3. . . . . . . . . . . . . .  M335 339 341 M346 350 352 M357 361 363 M368 372 374 M384 388 M400 404 412 M416
                                            422 M441 445 453 M460 464 472 M478 482 490 M496 500 508 547 552
       58   DN4. . . . . . . . . . . . . .  M335 340 341 M346 351 352 M357 362 363 M368 373 374 M384 389 396 M400 405 M416
                                            423 M441 446 453 M460 465 472 M478 483 490 M496 501 508 557 562
       77   DOTVALUE . . . . . . . . . . .  M231
      128   DUMMY-HOLD . . . . . . . . . .  M285 291
       50   DUMMY-RECORD . . . . . . . . .  M241 M242 M243 M244 M246 M247 M248 M250 M252 M261 M268 M275 M280 M281 285 M286
                                            287 M288 M289 M290 M291 295 M296 M304 M319
      175   ENDER-DESC . . . . . . . . . .  M263 M274 M279
      123   ERROR-COUNTER. . . . . . . . .  M225 254 264 267
      127   ERROR-HOLD . . . . . . . . . .  M254 M255 M255 M256 259
      173   ERROR-TOTAL. . . . . . . . . .  M265 M267 M272 M273 M277 M278
       67   FAIL-FLAG
       70   FEATURE. . . . . . . . . . . .  M327 M379 M437
      201   HYPHEN-LINE. . . . . . . . . .  248 250 290
      167   ID-AGAIN . . . . . . . . . . .  M213
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page    15
0 Defined   Cross-reference of data names   References

0      54   ID1. . . . . . . . . . . . . .  352 356 430 490 508
       55   ID2. . . . . . . . . . . . . .  M356 363 M367 374
      200   INF-ANSI-REFERENCE . . . . . .  M302 M305 M318 M320
      195   INFO-TEXT. . . . . . . . . . .  M303
      124   INSPECT-COUNTER. . . . . . . .  M223 254 276 278
       72   P-OR-F . . . . . . . . . . . .  M223 M224 M225 M226 233 M236
       74   PAR-NAME . . . . . . . . . . .  M238 M326 M336 M347 M358 M369 M378 M385 M401 M419 M442 M457 M461 M479 M497
       76   PARDOT-X . . . . . . . . . . .  M230
      125   PASS-COUNTER . . . . . . . . .  M224 256 258
       48   PRINT-FILE . . . . . . . . . .  44 212 218
       49   PRINT-REC. . . . . . . . . . .  M232 M308 M310
       79   RE-MARK. . . . . . . . . . . .  M227 M239 M454 M473 M491 M509 M533 M543 M553 M563
      121   REC-CT . . . . . . . . . . . .  229 231 238 M345 M526 M536 M546 M556
      120   REC-SKL-SUB
      129   RECORD-COUNT . . . . . . . . .  M283 284 M292
       60   SAVE-DN1 . . . . . . . . . . .  M337 M348 M359 M370 M386 M402 M420 M443 M462 M480 M498 527 531
       62   SAVE-DN2 . . . . . . . . . . .  M338 M349 M360 M371 M387 M403 M421 M444 M463 M481 M499 537 541
       61   SAVE-DN3 . . . . . . . . . . .  M339 M350 M361 M372 M388 M404 M422 M445 M464 M482 M500 547 551
       64   SAVE-DN4 . . . . . . . . . . .  M340 M351 M362 M373 M389 M405 M423 M446 M465 M483 M501 557 561
       80   TEST-COMPUTED. . . . . . . . .  308
       95   TEST-CORRECT . . . . . . . . .  310
      148   TEST-ID. . . . . . . . . . . .  M213
       68   TEST-RESULTS . . . . . . . . .  M214 232
      126   TOTAL-ERROR
      197   XXCOMPUTED . . . . . . . . . .  M317
      199   XXCORRECT. . . . . . . . . . .  M317
      192   XXINFO . . . . . . . . . . . .  304 319
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page    16
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

      313   BAIL-OUT . . . . . . . . . . .  P235
      321   BAIL-OUT-EX. . . . . . . . . .  E235 G315
      316   BAIL-OUT-WRITE . . . . . . . .  G314
      297   BLANK-LINE-PRINT
      391   CALL-DELETE-02-01
      407   CALL-DELETE-02-02
      425   CALL-DELETE-02-03
      514   CALL-DELETE-03
      448   CALL-DELETE-03-01
      467   CALL-DELETE-03-02
      485   CALL-DELETE-03-03
      503   CALL-DELETE-03-04
      382   CALL-INIT-02-01
      399   CALL-INIT-02-02. . . . . . . .  G394
      415   CALL-INIT-02-03. . . . . . . .  G410
      438   CALL-INIT-03-01
      459   CALL-INIT-03-02. . . . . . . .  G451
      477   CALL-INIT-03-03. . . . . . . .  G470
      495   CALL-INIT-03-04. . . . . . . .  G488
      325   CALL-TEST-01
      334   CALL-TEST-01-01
      344   CALL-TEST-01-02
      355   CALL-TEST-01-03
      366   CALL-TEST-01-04
      377   CALL-TEST-02
      395   CALL-TEST-02-01. . . . . . . .  G390
      411   CALL-TEST-02-02. . . . . . . .  G406
      429   CALL-TEST-02-03. . . . . . . .  G424
      433   CALL-TEST-03 . . . . . . . . .  G428
      452   CALL-TEST-03-01. . . . . . . .  G447
      471   CALL-TEST-03-02. . . . . . . .  G466
      489   CALL-TEST-03-03. . . . . . . .  G484
      507   CALL-TEST-03-04. . . . . . . .  G502
      568   CCVS-EXIT. . . . . . . . . . .  G521
      569   CCVS-999999
      210   CCVS1
      322   CCVS1-EXIT . . . . . . . . . .  G216
      525   CHECK-TEST-01. . . . . . . . .  P343 P354 P365 P376 P398 P414 P432 P458 P476 P494 P512
      217   CLOSE-FILES. . . . . . . . . .  G570
      245   COLUMN-NAMES-ROUTINE . . . . .  E215
      226   DE-LETE. . . . . . . . . . . .  P392 P408 P426 P449 P468 P486 P504 P518
      249   END-ROUTINE. . . . . . . . . .  P218
      253   END-ROUTINE-1
      262   END-ROUTINE-12
      270   END-ROUTINE-13 . . . . . . . .  E218
      251   END-RTN-EXIT
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page    17
0 Defined   Cross-reference of procedures   References

0     520   EXIT-IC224A. . . . . . . . . .  G506 G513
      225   FAIL . . . . . . . . . . . . .  P455 P474 P492 P510 P534 P544 P554 P564
      299   FAIL-ROUTINE . . . . . . . . .  P234
      312   FAIL-ROUTINE-EX. . . . . . . .  E234 G306
      307   FAIL-ROUTINE-WRITE . . . . . .  G300 G301
      240   HEAD-ROUTINE . . . . . . . . .  P215
      223   INSPT
      211   OPEN-FILES
      224   PASS . . . . . . . . . . . . .  P528 P538 P548 P558
      228   PRINT-DETAIL . . . . . . . . .  P393 P409 P427 P450 P455 P469 P474 P487 P492 P505 P510 P519 P529 P535 P539 P545
                                            P549 P555 P559 P565
      523   SECT-IC224A-CHECK-01
      324   SECT-IC224A-001
      221   TERMINATE-CALL
      219   TERMINATE-CCVS
      282   WRITE-LINE . . . . . . . . . .  P232 P233 P241 P242 P243 P244 P246 P247 P248 P250 P252 P261 P269 P275 P280 P281
                                            P304 P308 P310 P319
      294   WRT-LN . . . . . . . . . . . .  P288 P289 P290 P293 P298
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page    18
0 Defined   Cross-reference of programs     References

        3   IC224A . . . . . . . . . . . .  571
 EXTERNAL   IC224A-1 . . . . . . . . . . .  341 396 412 453 472
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A    Date 06/04/2022  Time 11:57:54   Page    19
0LineID  Message code  Message text

     48  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    341  IGYPG0020-W   Name "IC224A-1" was processed as "IC224A01".

                       Same message on line:    396    412    453    472

    525  IGYPS2015-I   The paragraph or section prior to paragraph or section "CHECK-TEST-01" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       7           2              5
-* Statistics for COBOL program IC224A:
 *    Source records = 571
 *    Data Division statements = 75
 *    Procedure Division statements = 311
 *    Generated COBOL statements = 0
 *    Program complexity factor = 319
0End of compilation 1,  program IC224A,  highest severity 4.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A01  Date 06/04/2022  Time 11:57:54   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000572         057600 IDENTIFICATION DIVISION.                                         IC2244.2
   000573         057700 PROGRAM-ID.                                                      IC2244.2
   000574         057800     IC224A-1.                                                    IC2244.2

 ==000574==> IGYDS0020-W Name "IC224A-1" was processed as "IC224A01".

   000575         058000*                                                              *  IC2244.2
   000576         058100*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2244.2
   000577         058200*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2244.2
   000578         058300*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2244.2
   000579         058400*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2244.2
   000580         058500*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2244.2
   000581         058600*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2244.2
   000582         058700*                                                              *  IC2244.2
   000583         058800*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2244.2
   000584         058900*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2244.2
   000585         059000*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2244.2
   000586         059100*                                                              *  IC2244.2
   000587         059200*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2244.2
   000588         059300*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2244.2
   000589         059400*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2244.2
   000590         059500*                                                              *  IC2244.2
   000591         059600*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2244.2
   000592         059700*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2244.2
   000593         059800*                & INFORMATION TECHNOLOGY                      *  IC2244.2
   000594         059900*          TWO SKYLINE PLACE                                   *  IC2244.2
   000595         060000*          SUITE 1100                                          *  IC2244.2
   000596         060100*          5203 LEESBURG PIKE                                  *  IC2244.2
   000597         060200*          FALLS CHURCH                                        *  IC2244.2
   000598         060300*          VA 22041                                            *  IC2244.2
   000599         060400*          U.S.A.                                              *  IC2244.2
   000600         060500*                                                              *  IC2244.2
   000601         060600*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2244.2
   000602         060700*                                                              *  IC2244.2
   000603         060800*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2244.2
   000604         060900*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2244.2
   000605         061000*          21 RUE BARA                                         *  IC2244.2
   000606         061100*          F-92132 ISSY                                        *  IC2244.2
   000607         061200*          FRANCE                                              *  IC2244.2
   000608         061300*                                                              *  IC2244.2
   000609         061400*                                                              *  IC2244.2
   000610         061500*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2244.2
   000611         061600*               UND DATENVERARBEITUNG MBH)                     *  IC2244.2
   000612         061700*          SCHLOSS BIRLINGHOVEN                                *  IC2244.2
   000613         061800*          POSTFACH 12 40                                      *  IC2244.2
   000614         061900*          D-5205 ST. AUGUSTIN 1                               *  IC2244.2
   000615         062000*          GERMANY FR                                          *  IC2244.2
   000616         062100*                                                              *  IC2244.2
   000617         062200*                                                              *  IC2244.2
   000618         062300*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2244.2
   000619         062400*          OXFORD ROAD                                         *  IC2244.2
   000620         062500*          MANCHESTER                                          *  IC2244.2
   000621         062600*          M1 7ED                                              *  IC2244.2
   000622         062700*          UNITED KINGDOM                                      *  IC2244.2
   000623         062800*                                                              *  IC2244.2
   000624         062900*                                                              *  IC2244.2
   000625         063000*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A01  Date 06/04/2022  Time 11:57:54   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000626         063100*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2244.2
   000627         063200*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2244.2
   000628         063300*                                                              *  IC2244.2
   000629         063500*                                                              *  IC2244.2
   000630         063600*    VALIDATION FOR:-                                          *  IC2244.2
   000631         063700*                                                              *  IC2244.2
   000632         063800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2244.2
   000633         063900*                                                              *  IC2244.2
   000634         064000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2244.2
   000635         064100*                                                              *  IC2244.2
   000636         064300*                                                              *  IC2244.2
   000637         064400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2244.2
   000638         064500*                                                              *  IC2244.2
   000639         064600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2244.2
   000640         064700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2244.2
   000641         064800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2244.2
   000642         064900*                                                              *  IC2244.2
   000643         065100*                                                              *  IC2244.2
   000644         065200*    PROGRAM IC224A AND IC224A-1 WILL TEST THE NEW LANGUAGE    *  IC2244.2
   000645         065300*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2244.2
   000646         065400*    MODULE.                                                   *  IC2244.2
   000647         065500*    THE NEW LANGUAGE ELEMENTS TO BE TESTED WILL BE:           *  IC2244.2
   000648         065600*          "BY CONTENT"       PHRASE                           *  IC2244.2
   000649         065700*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2244.2
   000650         065800*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2244.2
   000651         065900*    IDENTIFICATION DIVISION.                                  *  IC2244.2
   000652         066000*    PROGRAM-ID. IC224A.                                       *  IC2244.2
   000653         066100*              .                                               *  IC2244.2
   000654         066200*              .                                               *  IC2244.2
   000655         066300*              .                                               *  IC2244.2
   000656         066400*    END PROGRAM IC224A.                                       *  IC2244.2
   000657         066500*    PROGRAM-ID. IC224A-1.                                     *  IC2244.2
   000658         066600*              .                                               *  IC2244.2
   000659         066700*              .                                               *  IC2244.2
   000660         066800*              .                                               *  IC2244.2
   000661         067000 ENVIRONMENT DIVISION.                                            IC2244.2
   000662         067100 CONFIGURATION SECTION.                                           IC2244.2
   000663         067200 SOURCE-COMPUTER.                                                 IC2244.2
   000664         067300     XXXXX082.                                                    IC2244.2
   000665         067400 OBJECT-COMPUTER.                                                 IC2244.2
   000666         067500     XXXXX083.                                                    IC2244.2
   000667         067600 INPUT-OUTPUT SECTION.                                            IC2244.2
   000668         067700 FILE-CONTROL.                                                    IC2244.2
   000669         067800     SELECT PRINT-FILE ASSIGN TO                                  IC2244.2 673
   000670         067900     XXXXX055.                                                    IC2244.2
   000671         068000 DATA DIVISION.                                                   IC2244.2
   000672         068100 FILE SECTION.                                                    IC2244.2
   000673         068200 FD  PRINT-FILE.                                                  IC2244.2

 ==000673==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000674         068300 01  PRINT-REC PICTURE X(120).                                    IC2244.2
   000675         068400 01  DUMMY-RECORD PICTURE X(120).                                 IC2244.2
   000676         068500 WORKING-STORAGE SECTION.                                         IC2244.2
   000677         068600 77  WS1 PICTURE S999.                                            IC2244.2
   000678         068700 77  WS2 PICTURE S999                                             IC2244.2
   000679         068800         USAGE COMPUTATIONAL, VALUE ZERO.                         IC2244.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A01  Date 06/04/2022  Time 11:57:54   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000680         068900 LINKAGE SECTION.                                                 IC2244.2
   000681         069000 77  DN1 PICTURE S99.                                             IC2244.2
   000682         069100 77  DN2 PICTURE S99 USAGE COMPUTATIONAL.                         IC2244.2
   000683         069200 77  DN3 PICTURE S99.                                             IC2244.2
   000684         069300 77  DN4 PICTURE S99 USAGE COMPUTATIONAL.                         IC2244.2
   000685         069400 PROCEDURE DIVISION USING DN1, DN2, DN3, DN4.                     IC2244.2 681 682 683 684
   000686         069500 SECT-IC224A-1-001 SECTION.                                       IC2244.2
   000687         069600 CALL-TEST-001.                                                   IC2244.2
   000688         069700     MOVE DN1 TO WS1.                                             IC2244.2 681 677
   000689         069800     ADD 1 TO WS1.                                                IC2244.2 677
   000690         069900     ADD 1 TO WS2.                                                IC2244.2 678
   000691         070000     MOVE WS1 TO DN3.                                             IC2244.2 677 683
   000692         070100     MOVE WS2 TO DN4.                                             IC2244.2 678 684
   000693         070200 CALL-EXIT-001.                                                   IC2244.2
   000694         070300     EXIT PROGRAM.                                                IC2244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A01  Date 06/04/2022  Time 11:57:54   Page    23
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      681   DN1. . . . . . . . . . . . . .  685 688
      682   DN2. . . . . . . . . . . . . .  685
      683   DN3. . . . . . . . . . . . . .  685 M691
      684   DN4. . . . . . . . . . . . . .  685 M692
      675   DUMMY-RECORD
      673   PRINT-FILE . . . . . . . . . .  669
      674   PRINT-REC
      677   WS1. . . . . . . . . . . . . .  M688 M689 691
      678   WS2. . . . . . . . . . . . . .  M690 692
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A01  Date 06/04/2022  Time 11:57:54   Page    24
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

      693   CALL-EXIT-001
      687   CALL-TEST-001
      686   SECT-IC224A-1-001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A01  Date 06/04/2022  Time 11:57:54   Page    25
0 Defined   Cross-reference of programs     References

      574   IC224A01
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC224A01  Date 06/04/2022  Time 11:57:54   Page    26
0LineID  Message code  Message text

    574  IGYDS0020-W   Name "IC224A-1" was processed as "IC224A01".

    673  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program IC224A01:
 *    Source records = 123
 *    Data Division statements = 8
 *    Procedure Division statements = 6
 *    Generated COBOL statements = 0
 *    Program complexity factor = 6
0End of compilation 2,  program IC224A01,  highest severity 4.
0Return code 4
