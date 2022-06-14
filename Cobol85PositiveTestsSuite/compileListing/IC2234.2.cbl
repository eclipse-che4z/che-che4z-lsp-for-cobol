1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:52   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:52   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2234.2
   000002         000200 PROGRAM-ID.                                                      IC2234.2
   000003         000300     IC223A.                                                      IC2234.2
   000004         000500*                                                              *  IC2234.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2234.2
   000006         000700*                                                              *  IC2234.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2234.2
   000008         000900*                                                              *  IC2234.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2234.2
   000010         001100*                                                              *  IC2234.2
   000011         001300*                                                              *  IC2234.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2234.2
   000013         001500*                                                              *  IC2234.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2234.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2234.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2234.2
   000017         001900*                                                              *  IC2234.2
   000018         002100*                                                              *  IC2234.2
   000019         002200*    PROGRAM IC223A AND IC223A-1 WILL TEST THE NEW LANGUAGE    *  IC2234.2
   000020         002300*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2234.2
   000021         002400*    MODULE.                                                   *  IC2234.2
   000022         002500*    THE NEW LANGUAGE ELEMENTS TO BE TESTED WILL BE:           *  IC2234.2
   000023         002600*          "BY REFERENCE"     PHRASE                           *  IC2234.2
   000024         002700*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2234.2
   000025         002800*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2234.2
   000026         002900*    IDENTIFICATION DIVISION.                                  *  IC2234.2
   000027         003000*    PROGRAM-ID. IC223A.                                       *  IC2234.2
   000028         003100*              .                                               *  IC2234.2
   000029         003200*              .                                               *  IC2234.2
   000030         003300*              .                                               *  IC2234.2
   000031         003400*    END PROGRAM IC223A.                                       *  IC2234.2
   000032         003500*    PROGRAM-ID. IC223A-1.                                     *  IC2234.2
   000033         003600*              .                                               *  IC2234.2
   000034         003700*              .                                               *  IC2234.2
   000035         003800*              .                                               *  IC2234.2
   000036         004000 ENVIRONMENT DIVISION.                                            IC2234.2
   000037         004100 CONFIGURATION SECTION.                                           IC2234.2
   000038         004200 SOURCE-COMPUTER.                                                 IC2234.2
   000039         004300     XXXXX082.                                                    IC2234.2
   000040         004400 OBJECT-COMPUTER.                                                 IC2234.2
   000041         004500     XXXXX083.                                                    IC2234.2
   000042         004600 INPUT-OUTPUT SECTION.                                            IC2234.2
   000043         004700 FILE-CONTROL.                                                    IC2234.2
   000044         004800     SELECT PRINT-FILE ASSIGN TO                                  IC2234.2 48
   000045         004900     XXXXX055.                                                    IC2234.2
   000046         005000 DATA DIVISION.                                                   IC2234.2
   000047         005100 FILE SECTION.                                                    IC2234.2
   000048         005200 FD  PRINT-FILE.                                                  IC2234.2

 ==000048==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000049         005300 01  PRINT-REC PICTURE X(120).                                    IC2234.2
   000050         005400 01  DUMMY-RECORD PICTURE X(120).                                 IC2234.2
   000051         005500 WORKING-STORAGE SECTION.                                         IC2234.2
   000052         005600 77  DN1 PICTURE S99  VALUE ZERO.                                 IC2234.2 IMP
   000053         005700 77  DN3 PICTURE S99.                                             IC2234.2
   000054         005800 77  ID1 PICTURE X(8) VALUE "IC223A-1".                           IC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  ID2 PICTURE X(8).                                            IC2234.2
   000056         006000 77  DN2 PICTURE S99                                              IC2234.2
   000057         006100         USAGE COMPUTATIONAL, VALUE ZERO.                         IC2234.2 IMP
   000058         006200 77  DN4 PICTURE S99                                              IC2234.2
   000059         006300         USAGE IS COMPUTATIONAL.                                  IC2234.2
   000060         006400 77  CALL-COUNT PIC S99.                                          IC2234.2
   000061         006500 77  FAIL-FLAG PIC 9.                                             IC2234.2
   000062         006600 01  TEST-RESULTS.                                                IC2234.2
   000063         006700     02 FILLER                   PIC X      VALUE SPACE.          IC2234.2 IMP
   000064         006800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2234.2 IMP
   000065         006900     02 FILLER                   PIC X      VALUE SPACE.          IC2234.2 IMP
   000066         007000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2234.2 IMP
   000067         007100     02 FILLER                   PIC X      VALUE SPACE.          IC2234.2 IMP
   000068         007200     02  PAR-NAME.                                                IC2234.2
   000069         007300       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2234.2 IMP
   000070         007400       03  PARDOT-X              PIC X      VALUE SPACE.          IC2234.2 IMP
   000071         007500       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2234.2 IMP
   000072         007600     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2234.2 IMP
   000073         007700     02 RE-MARK                  PIC X(61).                       IC2234.2
   000074         007800 01  TEST-COMPUTED.                                               IC2234.2
   000075         007900     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2234.2 IMP
   000076         008000     02 FILLER                   PIC X(17)  VALUE                 IC2234.2
   000077         008100            "       COMPUTED=".                                   IC2234.2
   000078         008200     02 COMPUTED-X.                                               IC2234.2
   000079         008300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2234.2 IMP
   000080         008400     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2234.2 79
   000081         008500                                 PIC -9(9).9(9).                  IC2234.2
   000082         008600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2234.2 79
   000083         008700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2234.2 79
   000084         008800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2234.2 79
   000085         008900     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2234.2 79
   000086         009000         04 COMPUTED-18V0                    PIC -9(18).          IC2234.2
   000087         009100         04 FILLER                           PIC X.               IC2234.2
   000088         009200     03 FILLER PIC X(50) VALUE SPACE.                             IC2234.2 IMP
   000089         009300 01  TEST-CORRECT.                                                IC2234.2
   000090         009400     02 FILLER PIC X(30) VALUE SPACE.                             IC2234.2 IMP
   000091         009500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2234.2
   000092         009600     02 CORRECT-X.                                                IC2234.2
   000093         009700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2234.2 IMP
   000094         009800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2234.2 93
   000095         009900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2234.2 93
   000096         010000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2234.2 93
   000097         010100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2234.2 93
   000098         010200     03      CR-18V0 REDEFINES CORRECT-A.                         IC2234.2 93
   000099         010300         04 CORRECT-18V0                     PIC -9(18).          IC2234.2
   000100         010400         04 FILLER                           PIC X.               IC2234.2
   000101         010500     03 FILLER PIC X(2) VALUE SPACE.                              IC2234.2 IMP
   000102         010600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2234.2 IMP
   000103         010700 01  CCVS-C-1.                                                    IC2234.2
   000104         010800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2234.2
   000105         010900-    "SS  PARAGRAPH-NAME                                          IC2234.2
   000106         011000-    "       REMARKS".                                            IC2234.2
   000107         011100     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2234.2 IMP
   000108         011200 01  CCVS-C-2.                                                    IC2234.2
   000109         011300     02 FILLER                     PIC X        VALUE SPACE.      IC2234.2 IMP
   000110         011400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2234.2
   000111         011500     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2234.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2234.2
   000113         011700     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2234.2 IMP
   000114         011800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2234.2 IMP
   000115         011900 01  REC-CT                        PIC 99       VALUE ZERO.       IC2234.2 IMP
   000116         012000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2234.2 IMP
   000117         012100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2234.2 IMP
   000118         012200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2234.2 IMP
   000119         012300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2234.2 IMP
   000120         012400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2234.2 IMP
   000121         012500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2234.2 IMP
   000122         012600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2234.2 IMP
   000123         012700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2234.2 IMP
   000124         012800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2234.2 IMP
   000125         012900 01  CCVS-H-1.                                                    IC2234.2
   000126         013000     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2234.2 IMP
   000127         013100     02  FILLER                    PIC X(42)    VALUE             IC2234.2
   000128         013200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2234.2
   000129         013300     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2234.2 IMP
   000130         013400 01  CCVS-H-2A.                                                   IC2234.2
   000131         013500   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2234.2 IMP
   000132         013600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2234.2
   000133         013700   02  FILLER                        PIC XXXX   VALUE             IC2234.2
   000134         013800     "4.2 ".                                                      IC2234.2
   000135         013900   02  FILLER                        PIC X(28)  VALUE             IC2234.2
   000136         014000            " COPY - NOT FOR DISTRIBUTION".                       IC2234.2
   000137         014100   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2234.2 IMP
   000138         014200                                                                  IC2234.2
   000139         014300 01  CCVS-H-2B.                                                   IC2234.2
   000140         014400   02  FILLER                        PIC X(15)  VALUE             IC2234.2
   000141         014500            "TEST RESULT OF ".                                    IC2234.2
   000142         014600   02  TEST-ID                       PIC X(9).                    IC2234.2
   000143         014700   02  FILLER                        PIC X(4)   VALUE             IC2234.2
   000144         014800            " IN ".                                               IC2234.2
   000145         014900   02  FILLER                        PIC X(12)  VALUE             IC2234.2
   000146         015000     " HIGH       ".                                              IC2234.2
   000147         015100   02  FILLER                        PIC X(22)  VALUE             IC2234.2
   000148         015200            " LEVEL VALIDATION FOR ".                             IC2234.2
   000149         015300   02  FILLER                        PIC X(58)  VALUE             IC2234.2
   000150         015400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2234.2
   000151         015500 01  CCVS-H-3.                                                    IC2234.2
   000152         015600     02  FILLER                      PIC X(34)  VALUE             IC2234.2
   000153         015700            " FOR OFFICIAL USE ONLY    ".                         IC2234.2
   000154         015800     02  FILLER                      PIC X(58)  VALUE             IC2234.2
   000155         015900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2234.2
   000156         016000     02  FILLER                      PIC X(28)  VALUE             IC2234.2
   000157         016100            "  COPYRIGHT   1985 ".                                IC2234.2
   000158         016200 01  CCVS-E-1.                                                    IC2234.2
   000159         016300     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2234.2 IMP
   000160         016400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2234.2
   000161         016500     02 ID-AGAIN                     PIC X(9).                    IC2234.2
   000162         016600     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2234.2 IMP
   000163         016700 01  CCVS-E-2.                                                    IC2234.2
   000164         016800     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2234.2 IMP
   000165         016900     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2234.2 IMP
   000166         017000     02 CCVS-E-2-2.                                               IC2234.2
   000167         017100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2234.2 IMP
   000168         017200         03 FILLER                   PIC X      VALUE SPACE.      IC2234.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300         03 ENDER-DESC               PIC X(44)  VALUE             IC2234.2
   000170         017400            "ERRORS ENCOUNTERED".                                 IC2234.2
   000171         017500 01  CCVS-E-3.                                                    IC2234.2
   000172         017600     02  FILLER                      PIC X(22)  VALUE             IC2234.2
   000173         017700            " FOR OFFICIAL USE ONLY".                             IC2234.2
   000174         017800     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2234.2 IMP
   000175         017900     02  FILLER                      PIC X(58)  VALUE             IC2234.2
   000176         018000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2234.2
   000177         018100     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2234.2 IMP
   000178         018200     02 FILLER                       PIC X(15)  VALUE             IC2234.2
   000179         018300             " COPYRIGHT 1985".                                   IC2234.2
   000180         018400 01  CCVS-E-4.                                                    IC2234.2
   000181         018500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2234.2 IMP
   000182         018600     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2234.2
   000183         018700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2234.2 IMP
   000184         018800     02 FILLER                       PIC X(40)  VALUE             IC2234.2
   000185         018900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2234.2
   000186         019000 01  XXINFO.                                                      IC2234.2
   000187         019100     02 FILLER                       PIC X(19)  VALUE             IC2234.2
   000188         019200            "*** INFORMATION ***".                                IC2234.2
   000189         019300     02 INFO-TEXT.                                                IC2234.2
   000190         019400       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2234.2 IMP
   000191         019500       04 XXCOMPUTED                 PIC X(20).                   IC2234.2
   000192         019600       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2234.2 IMP
   000193         019700       04 XXCORRECT                  PIC X(20).                   IC2234.2
   000194         019800     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2234.2
   000195         019900 01  HYPHEN-LINE.                                                 IC2234.2
   000196         020000     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2234.2 IMP
   000197         020100     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2234.2
   000198         020200-    "*****************************************".                 IC2234.2
   000199         020300     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2234.2
   000200         020400-    "******************************".                            IC2234.2
   000201         020500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2234.2
   000202         020600     "IC223A".                                                    IC2234.2
   000203         020700 PROCEDURE DIVISION.                                              IC2234.2
   000204         020800 CCVS1 SECTION.                                                   IC2234.2
   000205         020900 OPEN-FILES.                                                      IC2234.2
   000206         021000     OPEN     OUTPUT PRINT-FILE.                                  IC2234.2 48
   000207         021100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2234.2 201 142 201 161
   000208         021200     MOVE    SPACE TO TEST-RESULTS.                               IC2234.2 IMP 62
   000209         021300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2234.2 234 239
   000210         021400     GO TO CCVS1-EXIT.                                            IC2234.2 316
   000211         021500 CLOSE-FILES.                                                     IC2234.2
   000212         021600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2234.2 243 264 48
   000213         021700 TERMINATE-CCVS.                                                  IC2234.2
   000214         021800     EXIT PROGRAM.                                                IC2234.2
   000215         021900 TERMINATE-CALL.                                                  IC2234.2
   000216         022000     STOP     RUN.                                                IC2234.2
   000217         022100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2234.2 66 118
   000218         022200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2234.2 66 119
   000219         022300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2234.2 66 117
   000220         022400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2234.2 66 116
   000221         022500     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2234.2 73
   000222         022600 PRINT-DETAIL.                                                    IC2234.2
   000223         022700     IF REC-CT NOT EQUAL TO ZERO                                  IC2234.2 115 IMP
   000224      1  022800             MOVE "." TO PARDOT-X                                 IC2234.2 70
   000225      1  022900             MOVE REC-CT TO DOTVALUE.                             IC2234.2 115 71
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2234.2 62 49 276
   000227         023100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2234.2 66 276
   000228      1  023200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2234.2 293 306
   000229      1  023300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2234.2 307 315
   000230         023400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2234.2 IMP 66 IMP 78
   000231         023500     MOVE SPACE TO CORRECT-X.                                     IC2234.2 IMP 92
   000232         023600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2234.2 115 IMP IMP 68
   000233         023700     MOVE     SPACE TO RE-MARK.                                   IC2234.2 IMP 73
   000234         023800 HEAD-ROUTINE.                                                    IC2234.2
   000235         023900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2234.2 125 50 276
   000236         024000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2234.2 130 50 276
   000237         024100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2234.2 139 50 276
   000238         024200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2234.2 151 50 276
   000239         024300 COLUMN-NAMES-ROUTINE.                                            IC2234.2
   000240         024400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2234.2 103 50 276
   000241         024500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2234.2 108 50 276
   000242         024600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2234.2 195 50 276
   000243         024700 END-ROUTINE.                                                     IC2234.2
   000244         024800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2234.2 195 50 276
   000245         024900 END-RTN-EXIT.                                                    IC2234.2
   000246         025000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2234.2 158 50 276
   000247         025100 END-ROUTINE-1.                                                   IC2234.2
   000248         025200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2234.2 117 121 118
   000249         025300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2234.2 121 116 121
   000250         025400      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2234.2 119 121
   000251         025500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2234.2
   000252         025600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2234.2 119 181
   000253         025700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2234.2 121 183
   000254         025800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2234.2 180 166
   000255         025900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2234.2 163 50 276
   000256         026000  END-ROUTINE-12.                                                 IC2234.2
   000257         026100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2234.2 169
   000258         026200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2234.2 117 IMP
   000259      1  026300         MOVE "NO " TO ERROR-TOTAL                                IC2234.2 167
   000260         026400         ELSE                                                     IC2234.2
   000261      1  026500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2234.2 117 167
   000262         026600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2234.2 163 50
   000263         026700     PERFORM WRITE-LINE.                                          IC2234.2 276
   000264         026800 END-ROUTINE-13.                                                  IC2234.2
   000265         026900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2234.2 116 IMP
   000266      1  027000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2234.2 167
   000267      1  027100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2234.2 116 167
   000268         027200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2234.2 169
   000269         027300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2234.2 163 50 276
   000270         027400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2234.2 118 IMP
   000271      1  027500          MOVE "NO " TO ERROR-TOTAL                               IC2234.2 167
   000272      1  027600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2234.2 118 167
   000273         027700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2234.2 169
   000274         027800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2234.2 163 50 276
   000275         027900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2234.2 171 50 276
   000276         028000 WRITE-LINE.                                                      IC2234.2
   000277         028100     ADD 1 TO RECORD-COUNT.                                       IC2234.2 123
   000278         028200     IF RECORD-COUNT GREATER 50                                   IC2234.2 123
   000279      1  028300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2234.2 50 122
   000280      1  028400         MOVE SPACE TO DUMMY-RECORD                               IC2234.2 IMP 50
   000281      1  028500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2234.2 50
   000282      1  028600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2234.2 103 50 288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2234.2 108 50 288
   000284      1  028800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2234.2 195 50 288
   000285      1  028900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2234.2 122 50
   000286      1  029000         MOVE ZERO TO RECORD-COUNT.                               IC2234.2 IMP 123
   000287         029100     PERFORM WRT-LN.                                              IC2234.2 288
   000288         029200 WRT-LN.                                                          IC2234.2
   000289         029300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2234.2 50
   000290         029400     MOVE SPACE TO DUMMY-RECORD.                                  IC2234.2 IMP 50
   000291         029500 BLANK-LINE-PRINT.                                                IC2234.2
   000292         029600     PERFORM WRT-LN.                                              IC2234.2 288
   000293         029700 FAIL-ROUTINE.                                                    IC2234.2
   000294         029800     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2234.2 78 IMP 301
   000295         029900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2234.2 92 IMP 301
   000296         030000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2234.2 124 194
   000297         030100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2234.2 189
   000298         030200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2234.2 186 50 276
   000299         030300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2234.2 IMP 194
   000300         030400     GO TO  FAIL-ROUTINE-EX.                                      IC2234.2 306
   000301         030500 FAIL-ROUTINE-WRITE.                                              IC2234.2
   000302         030600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2234.2 74 49 276
   000303         030700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2234.2 124 102
   000304         030800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2234.2 89 49 276
   000305         030900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2234.2 IMP 102
   000306         031000 FAIL-ROUTINE-EX. EXIT.                                           IC2234.2
   000307         031100 BAIL-OUT.                                                        IC2234.2
   000308         031200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2234.2 79 IMP 310
   000309         031300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2234.2 93 IMP 315
   000310         031400 BAIL-OUT-WRITE.                                                  IC2234.2
   000311         031500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2234.2 93 193 79 191
   000312         031600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2234.2 124 194
   000313         031700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2234.2 186 50 276
   000314         031800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2234.2 IMP 194
   000315         031900 BAIL-OUT-EX. EXIT.                                               IC2234.2
   000316         032000 CCVS1-EXIT.                                                      IC2234.2
   000317         032100     EXIT.                                                        IC2234.2
   000318         032200 SECT-IC223A-001 SECTION.                                         IC2234.2
   000319         032300 CALL-TEST-01.                                                    IC2234.2
   000320         032400     MOVE "CALL-TEST-01" TO PAR-NAME.                             IC2234.2 68
   000321         032500     MOVE     "LEV 2 CALL STATEMENT" TO FEATURE.                  IC2234.2 64
   000322         032600     MOVE 0 TO CALL-COUNT.                                        IC2234.2 60
   000323         032700*        THIS TEST HAS CALL STATEMENTS WITH AN IDENTIFIER         IC2234.2
   000324         032800*    CONTAINING THE NAME OF THE SUBPROGRAM TO BE CALLED.          IC2234.2
   000325         032900*        CALL-TEST-01 CONTAINS THE BASIC LEVEL 2 CALL STATEMENT.  IC2234.2
   000326         033000*    IF IT CANNOT BE COMPILED AND EXECUTED CORRECTLY, THERE IS    IC2234.2
   000327         033100*    NO USE IN RUNNING THE LEVEL 2 IPC ROUTINES.                  IC2234.2
   000328         033200 CALL-TEST-01-01.                                                 IC2234.2
   000329         033300     MOVE 1 TO REC-CT.                                            IC2234.2 115
   000330         033400     MOVE ZERO TO DN3, DN4.                                       IC2234.2 IMP 53 58
   000331         033500     CALL "IC223A-1" USING BY REFERENCE DN1, DN2, DN3, DN4        IC2234.2 EXT 52 56 53 58

 ==000331==> IGYPG0020-W Name "IC223A-1" was processed as "IC223A01".

   000332         033600     END-CALL                                                     IC2234.2
   000333         033700     PERFORM CHECK-TEST-01.                                       IC2234.2 613
   000334         033800     IF FAIL-FLAG EQUAL TO ZERO                                   IC2234.2 61 IMP
   000335      1  033900         PERFORM PASS                                             IC2234.2 218
   000336      1  034000         GO TO CALL-WRITE-01-01.                                  IC2234.2 341
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000337         034100 CALL-FAIL-01-01.                                                 IC2234.2
   000338         034200     PERFORM FAIL.                                                IC2234.2 219
   000339         034300     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2234.2 61 86
   000340         034400     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2234.2 73
   000341         034500 CALL-WRITE-01-01.                                                IC2234.2
   000342         034600     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000343         034700 CALL-TEST-01-02.                                                 IC2234.2
   000344         034800     ADD 1 TO REC-CT.                                             IC2234.2 115
   000345         034900     MOVE ZERO TO DN3, DN4.                                       IC2234.2 IMP 53 58
   000346         035000     CALL ID1 USING BY REFERENCE DN1, DN2, DN3, DN4               IC2234.2 54 52 56 53 58
   000347         035100     END-CALL                                                     IC2234.2
   000348         035200     PERFORM CHECK-TEST-01.                                       IC2234.2 613
   000349         035300     IF FAIL-FLAG EQUAL TO ZERO                                   IC2234.2 61 IMP
   000350      1  035400         PERFORM PASS                                             IC2234.2 218
   000351      1  035500         GO TO CALL-WRITE-01-02.                                  IC2234.2 356
   000352         035600 CALL-FAIL-01-02.                                                 IC2234.2
   000353         035700     PERFORM FAIL.                                                IC2234.2 219
   000354         035800     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2234.2 61 86
   000355         035900     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2234.2 73
   000356         036000 CALL-WRITE-01-02.                                                IC2234.2
   000357         036100     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000358         036200 CALL-TEST-01-03.                                                 IC2234.2
   000359         036300     ADD 1 TO REC-CT.                                             IC2234.2 115
   000360         036400     MOVE ID1 TO ID2.                                             IC2234.2 54 55
   000361         036500     MOVE ZERO TO DN3, DN4.                                       IC2234.2 IMP 53 58
   000362         036600     CALL ID2 USING REFERENCE DN1 DN2 DN3 DN4                     IC2234.2 55 52 56 53 58
   000363         036700     END-CALL.                                                    IC2234.2
   000364         036800     PERFORM CHECK-TEST-01.                                       IC2234.2 613
   000365         036900     IF FAIL-FLAG EQUAL TO ZERO                                   IC2234.2 61 IMP
   000366      1  037000         PERFORM PASS                                             IC2234.2 218
   000367      1  037100         GO TO CALL-WRITE-01-03.                                  IC2234.2 372
   000368         037200 CALL-FAIL-01-03.                                                 IC2234.2
   000369         037300     PERFORM FAIL.                                                IC2234.2 219
   000370         037400     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2234.2 61 86
   000371         037500     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2234.2 73
   000372         037600 CALL-WRITE-01-03.                                                IC2234.2
   000373         037700     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000374         037800 CALL-TEST-01-04.                                                 IC2234.2
   000375         037900     ADD 1 TO REC-CT.                                             IC2234.2 115
   000376         038000     MOVE "IC223A-1" TO ID2.                                      IC2234.2 55
   000377         038100     MOVE ZERO TO DN3, DN4.                                       IC2234.2 IMP 53 58
   000378         038200     CALL ID2 USING REFERENCE DN1, DN2, DN3, DN4                  IC2234.2 55 52 56 53 58
   000379         038300     END-CALL.                                                    IC2234.2
   000380         038400     PERFORM CHECK-TEST-01.                                       IC2234.2 613
   000381         038500     IF FAIL-FLAG EQUAL TO ZERO                                   IC2234.2 61 IMP
   000382      1  038600         PERFORM PASS                                             IC2234.2 218
   000383      1  038700         GO TO CALL-WRITE-01-04.                                  IC2234.2 388
   000384         038800 CALL-FAIL-01-04.                                                 IC2234.2
   000385         038900     PERFORM FAIL.                                                IC2234.2 219
   000386         039000     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2234.2 61 86
   000387         039100     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2234.2 73
   000388         039200 CALL-WRITE-01-04.                                                IC2234.2
   000389         039300     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000390         039400 CALL-TEST-02.                                                    IC2234.2
   000391         039500     MOVE "CALL-TEST-02" TO PAR-NAME.                             IC2234.2 68
   000392         039600     MOVE "DATA-NAME USED TWICE" TO FEATURE.                      IC2234.2 64
   000393         039700*        THIS TEST USES A DATA-NAME MORE THAN ONCE IN             IC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000394         039800*    A USING PHRASE OF A CALL STATEMENT.                          IC2234.2
   000395         039900 CALL-TEST-02-01.                                                 IC2234.2
   000396         040000     MOVE 1 TO REC-CT.                                            IC2234.2 115
   000397         040100     MOVE 1 TO DN1.                                               IC2234.2 52
   000398         040200     MOVE 0 TO DN2, DN3, DN4.                                     IC2234.2 56 53 58
   000399         040300     CALL "IC223A-1" USING REFERENCE DN1, DN2, DN1, DN4           IC2234.2 EXT 52 56 52 58

 ==000399==> IGYPG0020-W Name "IC223A-1" was processed as "IC223A01".

   000400         040400     END-CALL.                                                    IC2234.2
   000401         040500     IF DN1 NOT EQUAL TO 2                                        IC2234.2 52
   000402      1  040600         GO TO CALL-FAIL-02-01-1.                                 IC2234.2 416
   000403         040700     IF DN2 NOT EQUAL TO 0                                        IC2234.2 56
   000404      1  040800         GO TO CALL-FAIL-02-01-2.                                 IC2234.2 421
   000405         040900     IF DN3 NOT EQUAL TO 0                                        IC2234.2 53
   000406      1  041000         GO TO CALL-FAIL-02-01-3.                                 IC2234.2 426
   000407         041100     IF DN4 NOT EQUAL TO 5                                        IC2234.2 58
   000408      1  041200         GO TO CALL-FAIL-02-01-4.                                 IC2234.2 431
   000409         041300     GO TO CALL-PASS-02-01.                                       IC2234.2 413
   000410         041400 CALL-DELETE-02-01.                                               IC2234.2
   000411         041500     PERFORM DE-LETE.                                             IC2234.2 220
   000412         041600     GO TO CALL-WRITE-02-01.                                      IC2234.2 437
   000413         041700 CALL-PASS-02-01.                                                 IC2234.2
   000414         041800     PERFORM PASS.                                                IC2234.2 218
   000415         041900     GO TO CALL-WRITE-02-01.                                      IC2234.2 437
   000416         042000 CALL-FAIL-02-01-1.                                               IC2234.2
   000417         042100     MOVE DN1 TO COMPUTED-18V0.                                   IC2234.2 52 86
   000418         042200     MOVE 2 TO CORRECT-18V0.                                      IC2234.2 99
   000419         042300     MOVE "ERROR IN DN1 VALUE RETURNED" TO RE-MARK.               IC2234.2 73
   000420         042400     GO TO CALL-FAIL-02-01.                                       IC2234.2 435
   000421         042500 CALL-FAIL-02-01-2.                                               IC2234.2
   000422         042600     MOVE DN2 TO COMPUTED-18V0.                                   IC2234.2 56 86
   000423         042700     MOVE 0 TO CORRECT-18V0.                                      IC2234.2 99
   000424         042800     MOVE "ERROR IN DN2 VALUE RETURNED" TO RE-MARK.               IC2234.2 73
   000425         042900     GO TO CALL-FAIL-02-01.                                       IC2234.2 435
   000426         043000 CALL-FAIL-02-01-3.                                               IC2234.2
   000427         043100     MOVE DN3 TO COMPUTED-18V0.                                   IC2234.2 53 86
   000428         043200     MOVE ZERO TO CORRECT-18V0.                                   IC2234.2 IMP 99
   000429         043300     MOVE "DN3 VALUE CHANGED BY CALL" TO RE-MARK.                 IC2234.2 73
   000430         043400     GO TO CALL-FAIL-02-01.                                       IC2234.2 435
   000431         043500 CALL-FAIL-02-01-4.                                               IC2234.2
   000432         043600     MOVE DN4 TO COMPUTED-18V0.                                   IC2234.2 58 86
   000433         043700     MOVE 5 TO CORRECT-18V0.                                      IC2234.2 99
   000434         043800     MOVE "ERROR IN DN4 VALUE RETURNED" TO RE-MARK.               IC2234.2 73
   000435         043900 CALL-FAIL-02-01.                                                 IC2234.2
   000436         044000     PERFORM FAIL.                                                IC2234.2 219
   000437         044100 CALL-WRITE-02-01.                                                IC2234.2
   000438         044200     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000439         044300 CALL-TEST-02-02.                                                 IC2234.2
   000440         044400     ADD 1 TO REC-CT.                                             IC2234.2 115
   000441         044500     MOVE 0 TO DN4, DN3, DN2, DN1.                                IC2234.2 58 53 56 52
   000442         044600     CALL ID1 USING REFERENCE DN1 DN2 DN3 DN2                     IC2234.2 54 52 56 53 56
   000443         044700     END-CALL.                                                    IC2234.2
   000444         044800     IF DN1 NOT EQUAL TO 0                                        IC2234.2 52
   000445      1  044900         GO TO CALL-FAIL-02-02-1.                                 IC2234.2 459
   000446         045000     IF DN2 NOT EQUAL TO 6                                        IC2234.2 56
   000447      1  045100         GO TO CALL-FAIL-02-02-2.                                 IC2234.2 464
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448         045200     IF DN3 NOT EQUAL TO 1                                        IC2234.2 53
   000449      1  045300         GO TO CALL-FAIL-02-02-3.                                 IC2234.2 469
   000450         045400     IF DN4 NOT EQUAL TO 0                                        IC2234.2 58
   000451      1  045500         GO TO CALL-FAIL-02-02-4.                                 IC2234.2 474
   000452         045600     GO TO CALL-PASS-02-02.                                       IC2234.2 456
   000453         045700 CALL-DELETE-02-02.                                               IC2234.2
   000454         045800     PERFORM DE-LETE.                                             IC2234.2 220
   000455         045900     GO TO CALL-WRITE-02-02.                                      IC2234.2 480
   000456         046000 CALL-PASS-02-02.                                                 IC2234.2
   000457         046100     PERFORM PASS.                                                IC2234.2 218
   000458         046200     GO TO CALL-WRITE-02-02.                                      IC2234.2 480
   000459         046300 CALL-FAIL-02-02-1.                                               IC2234.2
   000460         046400     MOVE DN1 TO COMPUTED-18V0.                                   IC2234.2 52 86
   000461         046500     MOVE ZERO TO CORRECT-18V0.                                   IC2234.2 IMP 99
   000462         046600     MOVE "ERROR IN DN1 VALUE RETURNED" TO RE-MARK.               IC2234.2 73
   000463         046700     GO TO CALL-FAIL-02-02.                                       IC2234.2 478
   000464         046800 CALL-FAIL-02-02-2.                                               IC2234.2
   000465         046900     MOVE DN2 TO COMPUTED-18V0.                                   IC2234.2 56 86
   000466         047000     MOVE 6 TO CORRECT-18V0.                                      IC2234.2 99
   000467         047100     MOVE "ERROR IN DN2 VALUE RETURNED" TO RE-MARK.               IC2234.2 73
   000468         047200     GO TO CALL-FAIL-02-02.                                       IC2234.2 478
   000469         047300 CALL-FAIL-02-02-3.                                               IC2234.2
   000470         047400     MOVE DN3 TO COMPUTED-18V0.                                   IC2234.2 53 86
   000471         047500     MOVE 1 TO CORRECT-18V0.                                      IC2234.2 99
   000472         047600     MOVE "ERROR IN DN3 VALUE RETURNED" TO RE-MARK.               IC2234.2 73
   000473         047700     GO TO CALL-FAIL-02-02.                                       IC2234.2 478
   000474         047800 CALL-FAIL-02-02-4.                                               IC2234.2
   000475         047900     MOVE DN4 TO COMPUTED-18V0.                                   IC2234.2 58 86
   000476         048000     MOVE 0 TO CORRECT-18V0.                                      IC2234.2 99
   000477         048100     MOVE "DN4 VALUE CHANGED BY CALL" TO RE-MARK.                 IC2234.2 73
   000478         048200 CALL-FAIL-02-02.                                                 IC2234.2
   000479         048300     PERFORM FAIL.                                                IC2234.2 219
   000480         048400 CALL-WRITE-02-02.                                                IC2234.2
   000481         048500     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000482         048600 CALL-TEST-02-03.                                                 IC2234.2
   000483         048700     ADD 1 TO REC-CT.                                             IC2234.2 115
   000484         048800     MOVE 0 TO DN4, DN3.                                          IC2234.2 58 53
   000485         048900     MOVE 10 TO DN2.                                              IC2234.2 56
   000486         049000     MOVE 25 TO DN1.                                              IC2234.2 52
   000487         049100     CALL ID1 USING REFERENCE DN1 DN2 DN1 DN2                     IC2234.2 54 52 56 52 56
   000488         049200     END-CALL.                                                    IC2234.2
   000489         049300     IF DN1 EQUAL TO 26                                           IC2234.2 52
   000490      1  049400         GO TO CHECK-02-03-2.                                     IC2234.2 500
   000491         049500     GO TO CALL-FAIL-02-03-1.                                     IC2234.2 495
   000492         049600 CALL-DELETE-02-03.                                               IC2234.2
   000493         049700     PERFORM DE-LETE.                                             IC2234.2 220
   000494         049800     GO TO CALL-WRITE-02-03.                                      IC2234.2 528
   000495         049900 CALL-FAIL-02-03-1.                                               IC2234.2
   000496         050000     MOVE DN1 TO COMPUTED-18V0.                                   IC2234.2 52 86
   000497         050100     MOVE 26 TO CORRECT-18V0.                                     IC2234.2 99
   000498         050200     MOVE "ERROR IN DN1 VALUE RETURNED" TO RE-MARK.               IC2234.2 73
   000499         050300     GO TO CALL-FAIL-02-03.                                       IC2234.2 523
   000500         050400 CHECK-02-03-2.                                                   IC2234.2
   000501         050500     IF DN2 EQUAL TO 7                                            IC2234.2 56
   000502      1  050600         GO TO CHECK-02-03-3.                                     IC2234.2 508
   000503         050700 CALL-FAIL-02-03-2.                                               IC2234.2
   000504         050800     MOVE DN2 TO COMPUTED-18V0.                                   IC2234.2 56 86
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000505         050900     MOVE 7 TO CORRECT-18V0.                                      IC2234.2 99
   000506         051000     MOVE "ERROR IN DN2 VALUE RETURNED" TO RE-MARK.               IC2234.2 73
   000507         051100     GO TO CALL-FAIL-02-03.                                       IC2234.2 523
   000508         051200 CHECK-02-03-3.                                                   IC2234.2
   000509         051300     IF DN3 EQUAL TO 0                                            IC2234.2 53
   000510      1  051400         GO TO CHECK-02-03-4.                                     IC2234.2 516
   000511         051500 CALL-FAIL-02-03-3.                                               IC2234.2
   000512         051600     MOVE DN3 TO COMPUTED-18V0.                                   IC2234.2 53 86
   000513         051700     MOVE 0 TO CORRECT-18V0.                                      IC2234.2 99
   000514         051800     MOVE "DN3 VALUE CHANGED BY CALL" TO RE-MARK.                 IC2234.2 73
   000515         051900     GO TO CALL-FAIL-02-03.                                       IC2234.2 523
   000516         052000 CHECK-02-03-4.                                                   IC2234.2
   000517         052100     IF DN4 EQUAL TO 0                                            IC2234.2 58
   000518      1  052200         GO TO CALL-PASS-02-03.                                   IC2234.2 526
   000519         052300 CALL-FAIL-02-03-4.                                               IC2234.2
   000520         052400     MOVE DN4 TO COMPUTED-18V0.                                   IC2234.2 58 86
   000521         052500     MOVE 0 TO CORRECT-18V0.                                      IC2234.2 99
   000522         052600     MOVE "DN4 VALUE CHANGED BY CALL" TO RE-MARK.                 IC2234.2 73
   000523         052700 CALL-FAIL-02-03.                                                 IC2234.2
   000524         052800     PERFORM FAIL.                                                IC2234.2 219
   000525         052900     GO TO CALL-WRITE-02-03.                                      IC2234.2 528
   000526         053000 CALL-PASS-02-03.                                                 IC2234.2
   000527         053100     PERFORM PASS.                                                IC2234.2 218
   000528         053200 CALL-WRITE-02-03.                                                IC2234.2
   000529         053300     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000530         053400 CALL-TEST-03.                                                    IC2234.2
   000531         053500*        THIS TEST USES THE ON OVERFLOW PHRASE IN THE CALL        IC2234.2
   000532         053600*    STATEMENT.  THIS IS A SYNTACTICAL CHECK ONLY, THE ON         IC2234.2
   000533         053700*    OVERFLOW CONDITION SHOULD NEVER OCCUR.                       IC2234.2
   000534         053800     MOVE "CALL-TEST-03" TO PAR-NAME.                             IC2234.2 68
   000535         053900     MOVE "ON OVERFLOW PHRASE" TO FEATURE.                        IC2234.2 64
   000536         054000 CALL-TEST-03-01.                                                 IC2234.2
   000537         054100     MOVE 7 TO CALL-COUNT.                                        IC2234.2 60
   000538         054200     MOVE 20 TO DN1.                                              IC2234.2 52
   000539         054300     MOVE 30 TO DN2.                                              IC2234.2 56
   000540         054400     MOVE ZERO TO DN3, DN4.                                       IC2234.2 IMP 53 58
   000541         054500     CALL "IC223A-1" USING REFERENCE DN1, DN2, DN3, DN4;          IC2234.2 EXT 52 56 53 58

 ==000541==> IGYPG0020-W Name "IC223A-1" was processed as "IC223A01".

   000542      1  054600         ON OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK  IC2234.2 73
   000543      1  054700                     GO TO CALL-FAIL-03-01                        IC2234.2 551
   000544         054800     END-CALL.                                                    IC2234.2
   000545         054900     PERFORM CHECK-TEST-03.                                       IC2234.2 625
   000546         055000     IF FAIL-FLAG EQUAL TO ZERO                                   IC2234.2 61 IMP
   000547      1  055100         PERFORM PASS                                             IC2234.2 218
   000548      1  055200         GO TO CALL-WRITE-03-01.                                  IC2234.2 553
   000549         055300     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2234.2 61 86
   000550         055400     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2234.2 73
   000551         055500 CALL-FAIL-03-01.                                                 IC2234.2
   000552         055600     PERFORM FAIL.                                                IC2234.2 219
   000553         055700 CALL-WRITE-03-01.                                                IC2234.2
   000554         055800     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000555         055900 CALL-TEST-03-02.                                                 IC2234.2
   000556         056000     MOVE ZERO TO DN3, DN4.                                       IC2234.2 IMP 53 58
   000557         056100     CALL "IC223A-1" USING REFERENCE DN1, DN2, DN3, DN4;          IC2234.2 EXT 52 56 53 58

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0==000557==> IGYPG0020-W Name "IC223A-1" was processed as "IC223A01".

   000558      1  056200         OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK     IC2234.2 73
   000559      1  056300                  GO TO CALL-FAIL-03-02                           IC2234.2 567
   000560         056400     END-CALL.                                                    IC2234.2
   000561         056500     PERFORM CHECK-TEST-03.                                       IC2234.2 625
   000562         056600     IF FAIL-FLAG EQUAL TO ZERO                                   IC2234.2 61 IMP
   000563      1  056700         PERFORM PASS                                             IC2234.2 218
   000564      1  056800         GO TO CALL-WRITE-03-02.                                  IC2234.2 569
   000565         056900     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2234.2 61 86
   000566         057000     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2234.2 73
   000567         057100 CALL-FAIL-03-02.                                                 IC2234.2
   000568         057200     PERFORM FAIL.                                                IC2234.2 219
   000569         057300 CALL-WRITE-03-02.                                                IC2234.2
   000570         057400     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000571         057500 CALL-TEST-03-03.                                                 IC2234.2
   000572         057600     MOVE ZERO TO DN3, DN4.                                       IC2234.2 IMP 53 58
   000573         057700     CALL ID1 USING REFERENCE DN1 DN2 DN3 DN4                     IC2234.2 54 52 56 53 58
   000574      1  057800         ON OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK  IC2234.2 73
   000575      1  057900                     GO TO CALL-FAIL-03-03                        IC2234.2 583
   000576         058000     END-CALL.                                                    IC2234.2
   000577         058100     PERFORM   CHECK-TEST-03.                                     IC2234.2 625
   000578         058200     IF FAIL-FLAG EQUAL TO ZERO                                   IC2234.2 61 IMP
   000579      1  058300         PERFORM PASS                                             IC2234.2 218
   000580      1  058400         GO TO CALL-WRITE-03-03.                                  IC2234.2 585
   000581         058500     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2234.2 61 86
   000582         058600     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2234.2 73
   000583         058700 CALL-FAIL-03-03.                                                 IC2234.2
   000584         058800     PERFORM FAIL.                                                IC2234.2 219
   000585         058900 CALL-WRITE-03-03.                                                IC2234.2
   000586         059000     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000587         059100 CALL-TEST-03-04.                                                 IC2234.2
   000588         059200     MOVE ZERO TO DN3, DN4.                                       IC2234.2 IMP 53 58
   000589         059300     CALL ID1 USING REFERENCE DN1 DN2 DN3 DN4;                    IC2234.2 54 52 56 53 58
   000590      1  059400         OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK,    IC2234.2 73
   000591      1  059500                  GO TO CALL-FAIL-03-04                           IC2234.2 599
   000592         059600     END-CALL.                                                    IC2234.2
   000593         059700     PERFORM CHECK-TEST-03.                                       IC2234.2 625
   000594         059800     IF FAIL-FLAG EQUAL TO ZERO                                   IC2234.2 61 IMP
   000595      1  059900         PERFORM PASS                                             IC2234.2 218
   000596      1  060000         GO TO CALL-WRITE-03-04.                                  IC2234.2 601
   000597         060100     MOVE FAIL-FLAG TO COMPUTED-18V0.                             IC2234.2 61 86
   000598         060200     MOVE "NO. OF WRONG VALUES RETURNED" TO RE-MARK.              IC2234.2 73
   000599         060300 CALL-FAIL-03-04.                                                 IC2234.2
   000600         060400     PERFORM FAIL.                                                IC2234.2 219
   000601         060500 CALL-WRITE-03-04.                                                IC2234.2
   000602         060600     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000603         060700     GO TO EXIT-IC223A.                                           IC2234.2 610
   000604         060800 CALL-DELETE-03.                                                  IC2234.2
   000605         060900*        IF THE ON OVERFLOW PHRASE IS NOT RECOGNIZED, DELETE ALL  IC2234.2
   000606         061000*    OF THE ABOVE CALL-TEST-03 PARAGRAPHS, STARTING WITH          IC2234.2
   000607         061100*    CALL-TEST-03-01.                                             IC2234.2
   000608         061200     PERFORM DE-LETE.                                             IC2234.2 220
   000609         061300     PERFORM PRINT-DETAIL.                                        IC2234.2 222
   000610         061400 EXIT-IC223A.                                                     IC2234.2
   000611         061500     GO TO CCVS-EXIT.                                             IC2234.2 636
   000612         061600 SECT-IC223A-002 SECTION.                                         IC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000613         061700 CHECK-TEST-01.                                                   IC2234.2
   000614         061800     MOVE ZERO TO FAIL-FLAG.                                      IC2234.2 IMP 61
   000615         061900     ADD 1 TO CALL-COUNT.                                         IC2234.2 60
   000616         062000     IF DN1 EQUAL TO ZERO                                         IC2234.2 52 IMP
   000617      1  062100             NEXT SENTENCE                                        IC2234.2
   000618      1  062200         ELSE ADD 1 TO FAIL-FLAG.                                 IC2234.2 61
   000619         062300     IF DN2 NOT EQUAL TO ZERO                                     IC2234.2 56 IMP
   000620      1  062400         ADD 1 TO FAIL-FLAG.                                      IC2234.2 61
   000621         062500     IF DN3 NOT EQUAL TO 1                                        IC2234.2 53
   000622      1  062600         ADD 1 TO FAIL-FLAG.                                      IC2234.2 61
   000623         062700     IF DN4 NOT EQUAL TO CALL-COUNT                               IC2234.2 58 60
   000624      1  062800         ADD 1 TO FAIL-FLAG.                                      IC2234.2 61
   000625         062900 CHECK-TEST-03.                                                   IC2234.2
   000626         063000     MOVE ZERO TO FAIL-FLAG.                                      IC2234.2 IMP 61
   000627         063100     ADD 1 TO CALL-COUNT.                                         IC2234.2 60
   000628         063200     IF DN4 NOT EQUAL TO CALL-COUNT                               IC2234.2 58 60
   000629      1  063300         ADD 1 TO FAIL-FLAG.                                      IC2234.2 61
   000630         063400     IF DN3 NOT EQUAL TO 21                                       IC2234.2 53
   000631      1  063500         ADD 1 TO FAIL-FLAG.                                      IC2234.2 61
   000632         063600     IF DN2 NOT EQUAL TO 30                                       IC2234.2 56
   000633      1  063700         ADD 1 TO FAIL-FLAG.                                      IC2234.2 61
   000634         063800     IF DN1 NOT EQUAL TO 20                                       IC2234.2 52
   000635      1  063900         ADD 1 TO FAIL-FLAG.                                      IC2234.2 61
   000636         064000 CCVS-EXIT SECTION.                                               IC2234.2
   000637         064100 CCVS-999999.                                                     IC2234.2
   000638         064200     GO TO CLOSE-FILES.                                           IC2234.2 211
   000639         064300 END PROGRAM IC223A.                                              IC2234.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      124   ANSI-REFERENCE . . . . . . . .  296 303 312
       60   CALL-COUNT . . . . . . . . . .  M322 M537 M615 623 M627 628
      103   CCVS-C-1 . . . . . . . . . . .  240 282
      108   CCVS-C-2 . . . . . . . . . . .  241 283
      158   CCVS-E-1 . . . . . . . . . . .  246
      163   CCVS-E-2 . . . . . . . . . . .  255 262 269 274
      166   CCVS-E-2-2 . . . . . . . . . .  M254
      171   CCVS-E-3 . . . . . . . . . . .  275
      180   CCVS-E-4 . . . . . . . . . . .  254
      181   CCVS-E-4-1 . . . . . . . . . .  M252
      183   CCVS-E-4-2 . . . . . . . . . .  M253
      125   CCVS-H-1 . . . . . . . . . . .  235
      130   CCVS-H-2A. . . . . . . . . . .  236
      139   CCVS-H-2B. . . . . . . . . . .  237
      151   CCVS-H-3 . . . . . . . . . . .  238
      201   CCVS-PGM-ID. . . . . . . . . .  207 207
       85   CM-18V0
       79   COMPUTED-A . . . . . . . . . .  80 82 83 84 85 308 311
       80   COMPUTED-N
       78   COMPUTED-X . . . . . . . . . .  M230 294
       82   COMPUTED-0V18
       84   COMPUTED-14V4
       86   COMPUTED-18V0. . . . . . . . .  M339 M354 M370 M386 M417 M422 M427 M432 M460 M465 M470 M475 M496 M504 M512 M520
                                            M549 M565 M581 M597
       83   COMPUTED-4V14
      102   COR-ANSI-REFERENCE . . . . . .  M303 M305
       93   CORRECT-A. . . . . . . . . . .  94 95 96 97 98 309 311
       94   CORRECT-N
       92   CORRECT-X. . . . . . . . . . .  M231 295
       95   CORRECT-0V18
       97   CORRECT-14V4
       99   CORRECT-18V0 . . . . . . . . .  M418 M423 M428 M433 M461 M466 M471 M476 M497 M505 M513 M521
       96   CORRECT-4V14
       98   CR-18V0
      116   DELETE-COUNTER . . . . . . . .  M220 249 265 267
       52   DN1. . . . . . . . . . . . . .  331 346 362 378 M397 399 399 401 417 M441 442 444 460 M486 487 487 489 496 M538
                                            541 557 573 589 616 634
       56   DN2. . . . . . . . . . . . . .  331 346 362 378 M398 399 403 422 M441 442 442 446 465 M485 487 487 501 504 M539
                                            541 557 573 589 619 632
       53   DN3. . . . . . . . . . . . . .  M330 331 M345 346 M361 362 M377 378 M398 405 427 M441 442 448 470 M484 509 512
                                            M540 541 M556 557 M572 573 M588 589 621 630
       58   DN4. . . . . . . . . . . . . .  M330 331 M345 346 M361 362 M377 378 M398 399 407 432 M441 450 475 M484 517 520
                                            M540 541 M556 557 M572 573 M588 589 623 628
       71   DOTVALUE . . . . . . . . . . .  M225
      122   DUMMY-HOLD . . . . . . . . . .  M279 285
       50   DUMMY-RECORD . . . . . . . . .  M235 M236 M237 M238 M240 M241 M242 M244 M246 M255 M262 M269 M274 M275 279 M280
                                            281 M282 M283 M284 M285 289 M290 M298 M313
      169   ENDER-DESC . . . . . . . . . .  M257 M268 M273
      117   ERROR-COUNTER. . . . . . . . .  M219 248 258 261
      121   ERROR-HOLD . . . . . . . . . .  M248 M249 M249 M250 253
      167   ERROR-TOTAL. . . . . . . . . .  M259 M261 M266 M267 M271 M272
       61   FAIL-FLAG. . . . . . . . . . .  334 339 349 354 365 370 381 386 546 549 562 565 578 581 594 597 M614 M618 M620
                                            M622 M624 M626 M629 M631 M633 M635
       64   FEATURE. . . . . . . . . . . .  M321 M392 M535
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    16
0 Defined   Cross-reference of data names   References

0     195   HYPHEN-LINE. . . . . . . . . .  242 244 284
      161   ID-AGAIN . . . . . . . . . . .  M207
       54   ID1. . . . . . . . . . . . . .  346 360 442 487 573 589
       55   ID2. . . . . . . . . . . . . .  M360 362 M376 378
      194   INF-ANSI-REFERENCE . . . . . .  M296 M299 M312 M314
      189   INFO-TEXT. . . . . . . . . . .  M297
      118   INSPECT-COUNTER. . . . . . . .  M217 248 270 272
       66   P-OR-F . . . . . . . . . . . .  M217 M218 M219 M220 227 M230
       68   PAR-NAME . . . . . . . . . . .  M232 M320 M391 M534
       70   PARDOT-X . . . . . . . . . . .  M224
      119   PASS-COUNTER . . . . . . . . .  M218 250 252
       48   PRINT-FILE . . . . . . . . . .  44 206 212
       49   PRINT-REC. . . . . . . . . . .  M226 M302 M304
       73   RE-MARK. . . . . . . . . . . .  M221 M233 M340 M355 M371 M387 M419 M424 M429 M434 M462 M467 M472 M477 M498 M506
                                            M514 M522 M542 M550 M558 M566 M574 M582 M590 M598
      115   REC-CT . . . . . . . . . . . .  223 225 232 M329 M344 M359 M375 M396 M440 M483
      114   REC-SKL-SUB
      123   RECORD-COUNT . . . . . . . . .  M277 278 M286
       74   TEST-COMPUTED. . . . . . . . .  302
       89   TEST-CORRECT . . . . . . . . .  304
      142   TEST-ID. . . . . . . . . . . .  M207
       62   TEST-RESULTS . . . . . . . . .  M208 226
      120   TOTAL-ERROR
      191   XXCOMPUTED . . . . . . . . . .  M311
      193   XXCORRECT. . . . . . . . . . .  M311
      186   XXINFO . . . . . . . . . . . .  298 313
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    17
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

      307   BAIL-OUT . . . . . . . . . . .  P229
      315   BAIL-OUT-EX. . . . . . . . . .  E229 G309
      310   BAIL-OUT-WRITE . . . . . . . .  G308
      291   BLANK-LINE-PRINT
      410   CALL-DELETE-02-01
      453   CALL-DELETE-02-02
      492   CALL-DELETE-02-03
      604   CALL-DELETE-03
      337   CALL-FAIL-01-01
      352   CALL-FAIL-01-02
      368   CALL-FAIL-01-03
      384   CALL-FAIL-01-04
      435   CALL-FAIL-02-01. . . . . . . .  G420 G425 G430
      416   CALL-FAIL-02-01-1. . . . . . .  G402
      421   CALL-FAIL-02-01-2. . . . . . .  G404
      426   CALL-FAIL-02-01-3. . . . . . .  G406
      431   CALL-FAIL-02-01-4. . . . . . .  G408
      478   CALL-FAIL-02-02. . . . . . . .  G463 G468 G473
      459   CALL-FAIL-02-02-1. . . . . . .  G445
      464   CALL-FAIL-02-02-2. . . . . . .  G447
      469   CALL-FAIL-02-02-3. . . . . . .  G449
      474   CALL-FAIL-02-02-4. . . . . . .  G451
      523   CALL-FAIL-02-03. . . . . . . .  G499 G507 G515
      495   CALL-FAIL-02-03-1. . . . . . .  G491
      503   CALL-FAIL-02-03-2
      511   CALL-FAIL-02-03-3
      519   CALL-FAIL-02-03-4
      551   CALL-FAIL-03-01. . . . . . . .  G543
      567   CALL-FAIL-03-02. . . . . . . .  G559
      583   CALL-FAIL-03-03. . . . . . . .  G575
      599   CALL-FAIL-03-04. . . . . . . .  G591
      413   CALL-PASS-02-01. . . . . . . .  G409
      456   CALL-PASS-02-02. . . . . . . .  G452
      526   CALL-PASS-02-03. . . . . . . .  G518
      319   CALL-TEST-01
      328   CALL-TEST-01-01
      343   CALL-TEST-01-02
      358   CALL-TEST-01-03
      374   CALL-TEST-01-04
      390   CALL-TEST-02
      395   CALL-TEST-02-01
      439   CALL-TEST-02-02
      482   CALL-TEST-02-03
      530   CALL-TEST-03
      536   CALL-TEST-03-01
      555   CALL-TEST-03-02
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    18
0 Defined   Cross-reference of procedures   References

0     571   CALL-TEST-03-03
      587   CALL-TEST-03-04
      341   CALL-WRITE-01-01 . . . . . . .  G336
      356   CALL-WRITE-01-02 . . . . . . .  G351
      372   CALL-WRITE-01-03 . . . . . . .  G367
      388   CALL-WRITE-01-04 . . . . . . .  G383
      437   CALL-WRITE-02-01 . . . . . . .  G412 G415
      480   CALL-WRITE-02-02 . . . . . . .  G455 G458
      528   CALL-WRITE-02-03 . . . . . . .  G494 G525
      553   CALL-WRITE-03-01 . . . . . . .  G548
      569   CALL-WRITE-03-02 . . . . . . .  G564
      585   CALL-WRITE-03-03 . . . . . . .  G580
      601   CALL-WRITE-03-04 . . . . . . .  G596
      636   CCVS-EXIT. . . . . . . . . . .  G611
      637   CCVS-999999
      204   CCVS1
      316   CCVS1-EXIT . . . . . . . . . .  G210
      613   CHECK-TEST-01. . . . . . . . .  P333 P348 P364 P380
      625   CHECK-TEST-03. . . . . . . . .  P545 P561 P577 P593
      500   CHECK-02-03-2. . . . . . . . .  G490
      508   CHECK-02-03-3. . . . . . . . .  G502
      516   CHECK-02-03-4. . . . . . . . .  G510
      211   CLOSE-FILES. . . . . . . . . .  G638
      239   COLUMN-NAMES-ROUTINE . . . . .  E209
      220   DE-LETE. . . . . . . . . . . .  P411 P454 P493 P608
      243   END-ROUTINE. . . . . . . . . .  P212
      247   END-ROUTINE-1
      256   END-ROUTINE-12
      264   END-ROUTINE-13 . . . . . . . .  E212
      245   END-RTN-EXIT
      610   EXIT-IC223A. . . . . . . . . .  G603
      219   FAIL . . . . . . . . . . . . .  P338 P353 P369 P385 P436 P479 P524 P552 P568 P584 P600
      293   FAIL-ROUTINE . . . . . . . . .  P228
      306   FAIL-ROUTINE-EX. . . . . . . .  E228 G300
      301   FAIL-ROUTINE-WRITE . . . . . .  G294 G295
      234   HEAD-ROUTINE . . . . . . . . .  P209
      217   INSPT
      205   OPEN-FILES
      218   PASS . . . . . . . . . . . . .  P335 P350 P366 P382 P414 P457 P527 P547 P563 P579 P595
      222   PRINT-DETAIL . . . . . . . . .  P342 P357 P373 P389 P438 P481 P529 P554 P570 P586 P602 P609
      318   SECT-IC223A-001
      612   SECT-IC223A-002
      215   TERMINATE-CALL
      213   TERMINATE-CCVS
      276   WRITE-LINE . . . . . . . . . .  P226 P227 P235 P236 P237 P238 P240 P241 P242 P244 P246 P255 P263 P269 P274 P275
                                            P298 P302 P304 P313
      288   WRT-LN . . . . . . . . . . . .  P282 P283 P284 P287 P292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    19
0 Defined   Cross-reference of programs     References

        3   IC223A . . . . . . . . . . . .  639
 EXTERNAL   IC223A-1 . . . . . . . . . . .  331 399 541 557
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A    Date 06/04/2022  Time 11:59:52   Page    20
0LineID  Message code  Message text

     48  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    331  IGYPG0020-W   Name "IC223A-1" was processed as "IC223A01".

                       Same message on line:    399    541    557
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       5           1              4
-* Statistics for COBOL program IC223A:
 *    Source records = 639
 *    Data Division statements = 71
 *    Procedure Division statements = 358
 *    Generated COBOL statements = 0
 *    Program complexity factor = 366
0End of compilation 1,  program IC223A,  highest severity 4.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A01  Date 06/04/2022  Time 11:59:52   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000640         064400 IDENTIFICATION DIVISION.                                         IC2234.2
   000641         064500 PROGRAM-ID.                                                      IC2234.2
   000642         064600     IC223A-1.                                                    IC2234.2

 ==000642==> IGYDS0020-W Name "IC223A-1" was processed as "IC223A01".

   000643         064800*                                                              *  IC2234.2
   000644         064900*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2234.2
   000645         065000*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2234.2
   000646         065100*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2234.2
   000647         065200*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2234.2
   000648         065300*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2234.2
   000649         065400*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2234.2
   000650         065500*                                                              *  IC2234.2
   000651         065600*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2234.2
   000652         065700*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2234.2
   000653         065800*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2234.2
   000654         065900*                                                              *  IC2234.2
   000655         066000*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2234.2
   000656         066100*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2234.2
   000657         066200*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2234.2
   000658         066300*                                                              *  IC2234.2
   000659         066400*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2234.2
   000660         066500*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2234.2
   000661         066600*                & INFORMATION TECHNOLOGY                      *  IC2234.2
   000662         066700*          TWO SKYLINE PLACE                                   *  IC2234.2
   000663         066800*          SUITE 1100                                          *  IC2234.2
   000664         066900*          5203 LEESBURG PIKE                                  *  IC2234.2
   000665         067000*          FALLS CHURCH                                        *  IC2234.2
   000666         067100*          VA 22041                                            *  IC2234.2
   000667         067200*          U.S.A.                                              *  IC2234.2
   000668         067300*                                                              *  IC2234.2
   000669         067400*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2234.2
   000670         067500*                                                              *  IC2234.2
   000671         067600*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2234.2
   000672         067700*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2234.2
   000673         067800*          21 RUE BARA                                         *  IC2234.2
   000674         067900*          F-92132 ISSY                                        *  IC2234.2
   000675         068000*          FRANCE                                              *  IC2234.2
   000676         068100*                                                              *  IC2234.2
   000677         068200*                                                              *  IC2234.2
   000678         068300*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2234.2
   000679         068400*               UND DATENVERARBEITUNG MBH)                     *  IC2234.2
   000680         068500*          SCHLOSS BIRLINGHOVEN                                *  IC2234.2
   000681         068600*          POSTFACH 12 40                                      *  IC2234.2
   000682         068700*          D-5205 ST. AUGUSTIN 1                               *  IC2234.2
   000683         068800*          GERMANY FR                                          *  IC2234.2
   000684         068900*                                                              *  IC2234.2
   000685         069000*                                                              *  IC2234.2
   000686         069100*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2234.2
   000687         069200*          OXFORD ROAD                                         *  IC2234.2
   000688         069300*          MANCHESTER                                          *  IC2234.2
   000689         069400*          M1 7ED                                              *  IC2234.2
   000690         069500*          UNITED KINGDOM                                      *  IC2234.2
   000691         069600*                                                              *  IC2234.2
   000692         069700*                                                              *  IC2234.2
   000693         069800*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A01  Date 06/04/2022  Time 11:59:52   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000694         069900*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2234.2
   000695         070000*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2234.2
   000696         070100*                                                              *  IC2234.2
   000697         070300*                                                              *  IC2234.2
   000698         070400*    VALIDATION FOR:-                                          *  IC2234.2
   000699         070500*                                                              *  IC2234.2
   000700         070600*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2234.2
   000701         070700*                                                              *  IC2234.2
   000702         070800*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2234.2
   000703         070900*                                                              *  IC2234.2
   000704         071100*                                                              *  IC2234.2
   000705         071200*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2234.2
   000706         071300*                                                              *  IC2234.2
   000707         071400*        X-55  - SYSTEM PRINTER NAME.                          *  IC2234.2
   000708         071500*        X-82  - SOURCE COMPUTER NAME.                         *  IC2234.2
   000709         071600*        X-83  - OBJECT COMPUTER NAME.                         *  IC2234.2
   000710         071700*                                                              *  IC2234.2
   000711         071900*                                                              *  IC2234.2
   000712         072000*    PROGRAM IC223A AND IC223A-1 WILL TEST THE NEW LANGUAGE    *  IC2234.2
   000713         072100*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2234.2
   000714         072200*    MODULE.                                                   *  IC2234.2
   000715         072300*    THE NEW LANGUAGE ELEMENTS TO BE TESTED WILL BE:           *  IC2234.2
   000716         072400*          "BY REFERENCE"     PHRASE                           *  IC2234.2
   000717         072500*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2234.2
   000718         072600*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2234.2
   000719         072700*    IDENTIFICATION DIVISION.                                  *  IC2234.2
   000720         072800*    PROGRAM-ID. IC223A.                                       *  IC2234.2
   000721         072900*              .                                               *  IC2234.2
   000722         073000*              .                                               *  IC2234.2
   000723         073100*              .                                               *  IC2234.2
   000724         073200*    END PROGRAM IC223A.                                       *  IC2234.2
   000725         073300*    PROGRAM-ID. IC223A-1.                                     *  IC2234.2
   000726         073400*              .                                               *  IC2234.2
   000727         073500*              .                                               *  IC2234.2
   000728         073600*              .                                               *  IC2234.2
   000729         073800 ENVIRONMENT DIVISION.                                            IC2234.2
   000730         073900 CONFIGURATION SECTION.                                           IC2234.2
   000731         074000 SOURCE-COMPUTER.                                                 IC2234.2
   000732         074100     XXXXX082.                                                    IC2234.2
   000733         074200 OBJECT-COMPUTER.                                                 IC2234.2
   000734         074300     XXXXX083.                                                    IC2234.2
   000735         074400 INPUT-OUTPUT SECTION.                                            IC2234.2
   000736         074500 FILE-CONTROL.                                                    IC2234.2
   000737         074600     SELECT PRINT-FILE ASSIGN TO                                  IC2234.2 741
   000738         074700     XXXXX055.                                                    IC2234.2
   000739         074800 DATA DIVISION.                                                   IC2234.2
   000740         074900 FILE SECTION.                                                    IC2234.2
   000741         075000 FD  PRINT-FILE.                                                  IC2234.2

 ==000741==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000742         075100 01  PRINT-REC PICTURE X(120).                                    IC2234.2
   000743         075200 01  DUMMY-RECORD PICTURE X(120).                                 IC2234.2
   000744         075300 WORKING-STORAGE SECTION.                                         IC2234.2
   000745         075400 77  WS1 PICTURE S999.                                            IC2234.2
   000746         075500 77  WS2 PICTURE S999                                             IC2234.2
   000747         075600         USAGE COMPUTATIONAL, VALUE ZERO.                         IC2234.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A01  Date 06/04/2022  Time 11:59:52   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000748         075700 LINKAGE SECTION.                                                 IC2234.2
   000749         075800 77  DN1 PICTURE S99.                                             IC2234.2
   000750         075900 77  DN2 PICTURE S99 USAGE COMPUTATIONAL.                         IC2234.2
   000751         076000 77  DN3 PICTURE S99.                                             IC2234.2
   000752         076100 77  DN4 PICTURE S99 USAGE COMPUTATIONAL.                         IC2234.2
   000753         076200 PROCEDURE DIVISION USING DN1, DN2, DN3, DN4.                     IC2234.2 749 750 751 752
   000754         076300 SECT-IC223A-1-001 SECTION.                                       IC2234.2
   000755         076400 CALL-TEST-001.                                                   IC2234.2
   000756         076500     MOVE DN1 TO WS1.                                             IC2234.2 749 745
   000757         076600     ADD 1 TO WS1.                                                IC2234.2 745
   000758         076700     ADD 1 TO WS2.                                                IC2234.2 746
   000759         076800     MOVE WS1 TO DN3.                                             IC2234.2 745 751
   000760         076900     MOVE WS2 TO DN4.                                             IC2234.2 746 752
   000761         077000 CALL-EXIT-001.                                                   IC2234.2
   000762         077100     EXIT PROGRAM.                                                IC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A01  Date 06/04/2022  Time 11:59:52   Page    24
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      749   DN1. . . . . . . . . . . . . .  753 756
      750   DN2. . . . . . . . . . . . . .  753
      751   DN3. . . . . . . . . . . . . .  753 M759
      752   DN4. . . . . . . . . . . . . .  753 M760
      743   DUMMY-RECORD
      741   PRINT-FILE . . . . . . . . . .  737
      742   PRINT-REC
      745   WS1. . . . . . . . . . . . . .  M756 M757 759
      746   WS2. . . . . . . . . . . . . .  M758 760
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A01  Date 06/04/2022  Time 11:59:52   Page    25
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

      761   CALL-EXIT-001
      755   CALL-TEST-001
      754   SECT-IC223A-1-001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A01  Date 06/04/2022  Time 11:59:52   Page    26
0 Defined   Cross-reference of programs     References

      642   IC223A01
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC223A01  Date 06/04/2022  Time 11:59:52   Page    27
0LineID  Message code  Message text

    642  IGYDS0020-W   Name "IC223A-1" was processed as "IC223A01".

    741  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program IC223A01:
 *    Source records = 123
 *    Data Division statements = 8
 *    Procedure Division statements = 6
 *    Generated COBOL statements = 0
 *    Program complexity factor = 6
0End of compilation 2,  program IC223A01,  highest severity 4.
0Return code 4
