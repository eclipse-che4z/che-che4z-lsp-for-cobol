1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:31   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:31   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2254.2
   000002         000200 PROGRAM-ID.                                                      IC2254.2
   000003         000300     IC225A.                                                      IC2254.2
   000004         000500*                                                              *  IC2254.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2254.2
   000006         000700*                                                              *  IC2254.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2254.2
   000008         000900*                                                              *  IC2254.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2254.2
   000010         001100*                                                              *  IC2254.2
   000011         001300*                                                              *  IC2254.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2254.2
   000013         001500*                                                              *  IC2254.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2254.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2254.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2254.2
   000017         001900*                                                              *  IC2254.2
   000018         002100*                                                              *  IC2254.2
   000019         002200*    PROGRAM IC225A AND IC225A-1 WILL TEST THE NEW LANGUAGE    *  IC2254.2
   000020         002300*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2254.2
   000021         002400*    MODULE.                                                   *  IC2254.2
   000022         002500*    THE NEW LANGUAGE ELEMENTS TO BE TESTED WILL BE:           *  IC2254.2
   000023         002600*          "BY REFERENCE"     PHRASE                           *  IC2254.2
   000024         002700*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2254.2
   000025         002800*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2254.2
   000026         002900*    IDENTIFICATION DIVISION.                                  *  IC2254.2
   000027         003000*    PROGRAM-ID. IC225A.                                       *  IC2254.2
   000028         003100*              .                                               *  IC2254.2
   000029         003200*              .                                               *  IC2254.2
   000030         003300*              .                                               *  IC2254.2
   000031         003400*    END PROGRAM IC225A.                                       *  IC2254.2
   000032         003500*    PROGRAM-ID. IC225A-1.                                     *  IC2254.2
   000033         003600*              .                                               *  IC2254.2
   000034         003700*              .                                               *  IC2254.2
   000035         003800*              .                                               *  IC2254.2
   000036         004000 ENVIRONMENT DIVISION.                                            IC2254.2
   000037         004100 CONFIGURATION SECTION.                                           IC2254.2
   000038         004200 SOURCE-COMPUTER.                                                 IC2254.2
   000039         004300     XXXXX082.                                                    IC2254.2
   000040         004400 OBJECT-COMPUTER.                                                 IC2254.2
   000041         004500     XXXXX083.                                                    IC2254.2
   000042         004600 INPUT-OUTPUT SECTION.                                            IC2254.2
   000043         004700 FILE-CONTROL.                                                    IC2254.2
   000044         004800     SELECT PRINT-FILE ASSIGN TO                                  IC2254.2 48
   000045         004900     XXXXX055.                                                    IC2254.2
   000046         005000 DATA DIVISION.                                                   IC2254.2
   000047         005100 FILE SECTION.                                                    IC2254.2
   000048         005200 FD  PRINT-FILE.                                                  IC2254.2

 ==000048==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000049         005300 01  PRINT-REC PICTURE X(120).                                    IC2254.2
   000050         005400 01  DUMMY-RECORD PICTURE X(120).                                 IC2254.2
   000051         005500 WORKING-STORAGE SECTION.                                         IC2254.2
   000052         005600 77  DN1 PICTURE S99  VALUE ZERO.                                 IC2254.2 IMP
   000053         005700 77  DN3 PICTURE S99.                                             IC2254.2
   000054         005800 77  ID1 PICTURE X(8) VALUE "IC225A-1".                           IC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  ID2 PICTURE X(8).                                            IC2254.2
   000056         006000 77  DN2 PICTURE S99                                              IC2254.2
   000057         006100         USAGE COMPUTATIONAL, VALUE ZERO.                         IC2254.2 IMP
   000058         006200 77  DN4 PICTURE S99                                              IC2254.2
   000059         006300         USAGE IS COMPUTATIONAL.                                  IC2254.2
   000060         006400 77  CALL-COUNT PIC S99.                                          IC2254.2
   000061         006500 77  FAIL-FLAG PIC 9.                                             IC2254.2
   000062         006600 01  TEST-RESULTS.                                                IC2254.2
   000063         006700     02 FILLER                   PIC X      VALUE SPACE.          IC2254.2 IMP
   000064         006800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2254.2 IMP
   000065         006900     02 FILLER                   PIC X      VALUE SPACE.          IC2254.2 IMP
   000066         007000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2254.2 IMP
   000067         007100     02 FILLER                   PIC X      VALUE SPACE.          IC2254.2 IMP
   000068         007200     02  PAR-NAME.                                                IC2254.2
   000069         007300       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2254.2 IMP
   000070         007400       03  PARDOT-X              PIC X      VALUE SPACE.          IC2254.2 IMP
   000071         007500       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2254.2 IMP
   000072         007600     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2254.2 IMP
   000073         007700     02 RE-MARK                  PIC X(61).                       IC2254.2
   000074         007800 01  TEST-COMPUTED.                                               IC2254.2
   000075         007900     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2254.2 IMP
   000076         008000     02 FILLER                   PIC X(17)  VALUE                 IC2254.2
   000077         008100            "       COMPUTED=".                                   IC2254.2
   000078         008200     02 COMPUTED-X.                                               IC2254.2
   000079         008300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2254.2 IMP
   000080         008400     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2254.2 79
   000081         008500                                 PIC -9(9).9(9).                  IC2254.2
   000082         008600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2254.2 79
   000083         008700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2254.2 79
   000084         008800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2254.2 79
   000085         008900     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2254.2 79
   000086         009000         04 COMPUTED-18V0                    PIC -9(18).          IC2254.2
   000087         009100         04 FILLER                           PIC X.               IC2254.2
   000088         009200     03 FILLER PIC X(50) VALUE SPACE.                             IC2254.2 IMP
   000089         009300 01  TEST-CORRECT.                                                IC2254.2
   000090         009400     02 FILLER PIC X(30) VALUE SPACE.                             IC2254.2 IMP
   000091         009500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2254.2
   000092         009600     02 CORRECT-X.                                                IC2254.2
   000093         009700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2254.2 IMP
   000094         009800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2254.2 93
   000095         009900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2254.2 93
   000096         010000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2254.2 93
   000097         010100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2254.2 93
   000098         010200     03      CR-18V0 REDEFINES CORRECT-A.                         IC2254.2 93
   000099         010300         04 CORRECT-18V0                     PIC -9(18).          IC2254.2
   000100         010400         04 FILLER                           PIC X.               IC2254.2
   000101         010500     03 FILLER PIC X(2) VALUE SPACE.                              IC2254.2 IMP
   000102         010600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2254.2 IMP
   000103         010700 01  CCVS-C-1.                                                    IC2254.2
   000104         010800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2254.2
   000105         010900-    "SS  PARAGRAPH-NAME                                          IC2254.2
   000106         011000-    "       REMARKS".                                            IC2254.2
   000107         011100     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2254.2 IMP
   000108         011200 01  CCVS-C-2.                                                    IC2254.2
   000109         011300     02 FILLER                     PIC X        VALUE SPACE.      IC2254.2 IMP
   000110         011400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2254.2
   000111         011500     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2254.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2254.2
   000113         011700     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2254.2 IMP
   000114         011800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2254.2 IMP
   000115         011900 01  REC-CT                        PIC 99       VALUE ZERO.       IC2254.2 IMP
   000116         012000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2254.2 IMP
   000117         012100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2254.2 IMP
   000118         012200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2254.2 IMP
   000119         012300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2254.2 IMP
   000120         012400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2254.2 IMP
   000121         012500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2254.2 IMP
   000122         012600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2254.2 IMP
   000123         012700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2254.2 IMP
   000124         012800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2254.2 IMP
   000125         012900 01  CCVS-H-1.                                                    IC2254.2
   000126         013000     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2254.2 IMP
   000127         013100     02  FILLER                    PIC X(42)    VALUE             IC2254.2
   000128         013200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2254.2
   000129         013300     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2254.2 IMP
   000130         013400 01  CCVS-H-2A.                                                   IC2254.2
   000131         013500   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2254.2 IMP
   000132         013600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2254.2
   000133         013700   02  FILLER                        PIC XXXX   VALUE             IC2254.2
   000134         013800     "4.2 ".                                                      IC2254.2
   000135         013900   02  FILLER                        PIC X(28)  VALUE             IC2254.2
   000136         014000            " COPY - NOT FOR DISTRIBUTION".                       IC2254.2
   000137         014100   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2254.2 IMP
   000138         014200                                                                  IC2254.2
   000139         014300 01  CCVS-H-2B.                                                   IC2254.2
   000140         014400   02  FILLER                        PIC X(15)  VALUE             IC2254.2
   000141         014500            "TEST RESULT OF ".                                    IC2254.2
   000142         014600   02  TEST-ID                       PIC X(9).                    IC2254.2
   000143         014700   02  FILLER                        PIC X(4)   VALUE             IC2254.2
   000144         014800            " IN ".                                               IC2254.2
   000145         014900   02  FILLER                        PIC X(12)  VALUE             IC2254.2
   000146         015000     " HIGH       ".                                              IC2254.2
   000147         015100   02  FILLER                        PIC X(22)  VALUE             IC2254.2
   000148         015200            " LEVEL VALIDATION FOR ".                             IC2254.2
   000149         015300   02  FILLER                        PIC X(58)  VALUE             IC2254.2
   000150         015400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2254.2
   000151         015500 01  CCVS-H-3.                                                    IC2254.2
   000152         015600     02  FILLER                      PIC X(34)  VALUE             IC2254.2
   000153         015700            " FOR OFFICIAL USE ONLY    ".                         IC2254.2
   000154         015800     02  FILLER                      PIC X(58)  VALUE             IC2254.2
   000155         015900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2254.2
   000156         016000     02  FILLER                      PIC X(28)  VALUE             IC2254.2
   000157         016100            "  COPYRIGHT   1985 ".                                IC2254.2
   000158         016200 01  CCVS-E-1.                                                    IC2254.2
   000159         016300     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2254.2 IMP
   000160         016400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2254.2
   000161         016500     02 ID-AGAIN                     PIC X(9).                    IC2254.2
   000162         016600     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2254.2 IMP
   000163         016700 01  CCVS-E-2.                                                    IC2254.2
   000164         016800     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2254.2 IMP
   000165         016900     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2254.2 IMP
   000166         017000     02 CCVS-E-2-2.                                               IC2254.2
   000167         017100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2254.2 IMP
   000168         017200         03 FILLER                   PIC X      VALUE SPACE.      IC2254.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300         03 ENDER-DESC               PIC X(44)  VALUE             IC2254.2
   000170         017400            "ERRORS ENCOUNTERED".                                 IC2254.2
   000171         017500 01  CCVS-E-3.                                                    IC2254.2
   000172         017600     02  FILLER                      PIC X(22)  VALUE             IC2254.2
   000173         017700            " FOR OFFICIAL USE ONLY".                             IC2254.2
   000174         017800     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2254.2 IMP
   000175         017900     02  FILLER                      PIC X(58)  VALUE             IC2254.2
   000176         018000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2254.2
   000177         018100     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2254.2 IMP
   000178         018200     02 FILLER                       PIC X(15)  VALUE             IC2254.2
   000179         018300             " COPYRIGHT 1985".                                   IC2254.2
   000180         018400 01  CCVS-E-4.                                                    IC2254.2
   000181         018500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2254.2 IMP
   000182         018600     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2254.2
   000183         018700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2254.2 IMP
   000184         018800     02 FILLER                       PIC X(40)  VALUE             IC2254.2
   000185         018900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2254.2
   000186         019000 01  XXINFO.                                                      IC2254.2
   000187         019100     02 FILLER                       PIC X(19)  VALUE             IC2254.2
   000188         019200            "*** INFORMATION ***".                                IC2254.2
   000189         019300     02 INFO-TEXT.                                                IC2254.2
   000190         019400       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2254.2 IMP
   000191         019500       04 XXCOMPUTED                 PIC X(20).                   IC2254.2
   000192         019600       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2254.2 IMP
   000193         019700       04 XXCORRECT                  PIC X(20).                   IC2254.2
   000194         019800     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2254.2
   000195         019900 01  HYPHEN-LINE.                                                 IC2254.2
   000196         020000     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2254.2 IMP
   000197         020100     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2254.2
   000198         020200-    "*****************************************".                 IC2254.2
   000199         020300     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2254.2
   000200         020400-    "******************************".                            IC2254.2
   000201         020500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2254.2
   000202         020600     "IC225A".                                                    IC2254.2
   000203         020700 PROCEDURE DIVISION.                                              IC2254.2
   000204         020800 CCVS1 SECTION.                                                   IC2254.2
   000205         020900 OPEN-FILES.                                                      IC2254.2
   000206         021000     OPEN     OUTPUT PRINT-FILE.                                  IC2254.2 48
   000207         021100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2254.2 201 142 201 161
   000208         021200     MOVE    SPACE TO TEST-RESULTS.                               IC2254.2 IMP 62
   000209         021300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2254.2 234 239
   000210         021400     GO TO CCVS1-EXIT.                                            IC2254.2 316
   000211         021500 CLOSE-FILES.                                                     IC2254.2
   000212         021600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2254.2 243 264 48
   000213         021700 TERMINATE-CCVS.                                                  IC2254.2
   000214         021800     EXIT PROGRAM.                                                IC2254.2
   000215         021900 TERMINATE-CALL.                                                  IC2254.2
   000216         022000     STOP     RUN.                                                IC2254.2
   000217         022100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2254.2 66 118
   000218         022200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2254.2 66 119
   000219         022300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2254.2 66 117
   000220         022400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2254.2 66 116
   000221         022500     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2254.2 73
   000222         022600 PRINT-DETAIL.                                                    IC2254.2
   000223         022700     IF REC-CT NOT EQUAL TO ZERO                                  IC2254.2 115 IMP
   000224      1  022800             MOVE "." TO PARDOT-X                                 IC2254.2 70
   000225      1  022900             MOVE REC-CT TO DOTVALUE.                             IC2254.2 115 71
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2254.2 62 49 276
   000227         023100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2254.2 66 276
   000228      1  023200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2254.2 293 306
   000229      1  023300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2254.2 307 315
   000230         023400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2254.2 IMP 66 IMP 78
   000231         023500     MOVE SPACE TO CORRECT-X.                                     IC2254.2 IMP 92
   000232         023600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2254.2 115 IMP IMP 68
   000233         023700     MOVE     SPACE TO RE-MARK.                                   IC2254.2 IMP 73
   000234         023800 HEAD-ROUTINE.                                                    IC2254.2
   000235         023900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2254.2 125 50 276
   000236         024000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2254.2 130 50 276
   000237         024100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2254.2 139 50 276
   000238         024200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2254.2 151 50 276
   000239         024300 COLUMN-NAMES-ROUTINE.                                            IC2254.2
   000240         024400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2254.2 103 50 276
   000241         024500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2254.2 108 50 276
   000242         024600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2254.2 195 50 276
   000243         024700 END-ROUTINE.                                                     IC2254.2
   000244         024800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2254.2 195 50 276
   000245         024900 END-RTN-EXIT.                                                    IC2254.2
   000246         025000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2254.2 158 50 276
   000247         025100 END-ROUTINE-1.                                                   IC2254.2
   000248         025200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2254.2 117 121 118
   000249         025300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2254.2 121 116 121
   000250         025400      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2254.2 119 121
   000251         025500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2254.2
   000252         025600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2254.2 119 181
   000253         025700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2254.2 121 183
   000254         025800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2254.2 180 166
   000255         025900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2254.2 163 50 276
   000256         026000  END-ROUTINE-12.                                                 IC2254.2
   000257         026100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2254.2 169
   000258         026200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2254.2 117 IMP
   000259      1  026300         MOVE "NO " TO ERROR-TOTAL                                IC2254.2 167
   000260         026400         ELSE                                                     IC2254.2
   000261      1  026500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2254.2 117 167
   000262         026600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2254.2 163 50
   000263         026700     PERFORM WRITE-LINE.                                          IC2254.2 276
   000264         026800 END-ROUTINE-13.                                                  IC2254.2
   000265         026900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2254.2 116 IMP
   000266      1  027000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2254.2 167
   000267      1  027100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2254.2 116 167
   000268         027200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2254.2 169
   000269         027300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2254.2 163 50 276
   000270         027400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2254.2 118 IMP
   000271      1  027500          MOVE "NO " TO ERROR-TOTAL                               IC2254.2 167
   000272      1  027600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2254.2 118 167
   000273         027700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2254.2 169
   000274         027800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2254.2 163 50 276
   000275         027900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2254.2 171 50 276
   000276         028000 WRITE-LINE.                                                      IC2254.2
   000277         028100     ADD 1 TO RECORD-COUNT.                                       IC2254.2 123
   000278         028200     IF RECORD-COUNT GREATER 50                                   IC2254.2 123
   000279      1  028300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2254.2 50 122
   000280      1  028400         MOVE SPACE TO DUMMY-RECORD                               IC2254.2 IMP 50
   000281      1  028500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2254.2 50
   000282      1  028600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2254.2 103 50 288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2254.2 108 50 288
   000284      1  028800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2254.2 195 50 288
   000285      1  028900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2254.2 122 50
   000286      1  029000         MOVE ZERO TO RECORD-COUNT.                               IC2254.2 IMP 123
   000287         029100     PERFORM WRT-LN.                                              IC2254.2 288
   000288         029200 WRT-LN.                                                          IC2254.2
   000289         029300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2254.2 50
   000290         029400     MOVE SPACE TO DUMMY-RECORD.                                  IC2254.2 IMP 50
   000291         029500 BLANK-LINE-PRINT.                                                IC2254.2
   000292         029600     PERFORM WRT-LN.                                              IC2254.2 288
   000293         029700 FAIL-ROUTINE.                                                    IC2254.2
   000294         029800     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2254.2 78 IMP 301
   000295         029900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2254.2 92 IMP 301
   000296         030000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2254.2 124 194
   000297         030100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2254.2 189
   000298         030200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2254.2 186 50 276
   000299         030300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2254.2 IMP 194
   000300         030400     GO TO  FAIL-ROUTINE-EX.                                      IC2254.2 306
   000301         030500 FAIL-ROUTINE-WRITE.                                              IC2254.2
   000302         030600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2254.2 74 49 276
   000303         030700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2254.2 124 102
   000304         030800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2254.2 89 49 276
   000305         030900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2254.2 IMP 102
   000306         031000 FAIL-ROUTINE-EX. EXIT.                                           IC2254.2
   000307         031100 BAIL-OUT.                                                        IC2254.2
   000308         031200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2254.2 79 IMP 310
   000309         031300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2254.2 93 IMP 315
   000310         031400 BAIL-OUT-WRITE.                                                  IC2254.2
   000311         031500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2254.2 93 193 79 191
   000312         031600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2254.2 124 194
   000313         031700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2254.2 186 50 276
   000314         031800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2254.2 IMP 194
   000315         031900 BAIL-OUT-EX. EXIT.                                               IC2254.2
   000316         032000 CCVS1-EXIT.                                                      IC2254.2
   000317         032100     EXIT.                                                        IC2254.2
   000318         032200 SECT-IC225A-001 SECTION.                                         IC2254.2
   000319         032300 CALL-TEST-01.                                                    IC2254.2
   000320         032400     MOVE   "X-27 5.2.2" TO ANSI-REFERENCE.                       IC2254.2 124
   000321         032500     MOVE   "CALL-TEST-01" TO PAR-NAME.                           IC2254.2 68
   000322         032600     MOVE     "LEV 2 CALL STATEMENT" TO FEATURE.                  IC2254.2 64
   000323         032700     MOVE 0 TO CALL-COUNT.                                        IC2254.2 60
   000324         032800*        THIS TEST HAS CALL STATEMENTS WITH AN IDENTIFIER         IC2254.2
   000325         032900*    CONTAINING THE NAME OF THE SUBPROGRAM TO BE CALLED.          IC2254.2
   000326         033000*        CALL-TEST-01 CONTAINS THE BASIC LEVEL 2 CALL STATEMENT.  IC2254.2
   000327         033100*    IF IT CANNOT BE COMPILED AND EXECUTED CORRECTLY, THERE IS    IC2254.2
   000328         033200*    NO USE IN RUNNING THE LEVEL 2 IPC ROUTINES.                  IC2254.2
   000329         033300 CALL-INIT-01-01.                                                 IC2254.2
   000330         033400     MOVE    1    TO REC-CT.                                      IC2254.2 115
   000331         033500     MOVE    ZERO TO DN3, DN4.                                    IC2254.2 IMP 53 58
   000332         033600 CALL-TEST-01-01-0.                                               IC2254.2
   000333         033700     CALL   "IC225A-1" USING BY REFERENCE DN1, DN2,               IC2254.2 EXT 52 56

 ==000333==> IGYPG0020-W Name "IC225A-1" was processed as "IC225A01".

   000334         033800                                CONTENT   DN3, DN4                IC2254.2 53 58
   000335         033900     END-CALL.                                                    IC2254.2
   000336         034000     GO TO   CALL-TEST-01-01-1.                                   IC2254.2 341
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000337         034100 CALL-DELETE-01-01.                                               IC2254.2
   000338         034200     PERFORM DE-LETE.                                             IC2254.2 220
   000339         034300     PERFORM PRINT-DETAIL.                                        IC2254.2 222
   000340         034400     GO TO   CALL-INIT-01-02.                                     IC2254.2 389
   000341         034500 CALL-TEST-01-01-1.                                               IC2254.2
   000342         034600     MOVE   "CALL-TEST-01-01-1" TO PAR-NAME.                      IC2254.2 68
   000343         034700     IF      DN1 = ZERO                                           IC2254.2 52 IMP
   000344      1  034800             PERFORM PASS                                         IC2254.2 218
   000345      1  034900             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000346         035000     ELSE                                                         IC2254.2
   000347      1  035100             MOVE    DN1  TO COMPUTED-N                           IC2254.2 52 80
   000348      1  035200             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000349      1  035300             MOVE   "INCORRECT DN1 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000350      1  035400             PERFORM FAIL                                         IC2254.2 219
   000351      1  035500             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000352         035600     ADD     1 TO REC-CT.                                         IC2254.2 115
   000353         035700 CALL-TEST-01-01-2.                                               IC2254.2
   000354         035800     MOVE   "CALL-TEST-01-01-2" TO PAR-NAME.                      IC2254.2 68
   000355         035900     IF      DN2 = ZERO                                           IC2254.2 56 IMP
   000356      1  036000             PERFORM PASS                                         IC2254.2 218
   000357      1  036100             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000358         036200     ELSE                                                         IC2254.2
   000359      1  036300             MOVE    DN2  TO COMPUTED-N                           IC2254.2 56 80
   000360      1  036400             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000361      1  036500             MOVE   "VALUE OF DN2 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000362      1  036600             PERFORM FAIL                                         IC2254.2 219
   000363      1  036700             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000364         036800     ADD     1 TO REC-CT.                                         IC2254.2 115
   000365         036900 CALL-TEST-01-01-3.                                               IC2254.2
   000366         037000     MOVE   "CALL-TEST-01-01-3" TO PAR-NAME.                      IC2254.2 68
   000367         037100     IF      DN3 = ZERO                                           IC2254.2 53 IMP
   000368      1  037200             PERFORM PASS                                         IC2254.2 218
   000369      1  037300             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000370         037400     ELSE                                                         IC2254.2
   000371      1  037500             MOVE    DN3  TO COMPUTED-N                           IC2254.2 53 80
   000372      1  037600             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000373      1  037700             MOVE   "INCORRECT DN3 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000374      1  037800             PERFORM FAIL                                         IC2254.2 219
   000375      1  037900             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000376         038000     ADD     1 TO REC-CT.                                         IC2254.2 115
   000377         038100 CALL-TEST-01-01-4.                                               IC2254.2
   000378         038200     MOVE   "CALL-TEST-01-01-4" TO PAR-NAME.                      IC2254.2 68
   000379         038300     IF      DN4 = ZERO                                           IC2254.2 58 IMP
   000380      1  038400             PERFORM PASS                                         IC2254.2 218
   000381      1  038500             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000382         038600     ELSE                                                         IC2254.2
   000383      1  038700             MOVE    DN4  TO COMPUTED-N                           IC2254.2 58 80
   000384      1  038800             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000385      1  038900             MOVE   "VALUE OF DN4 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000386      1  039000             PERFORM FAIL                                         IC2254.2 219
   000387      1  039100             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000388         039200*                                                                 IC2254.2
   000389         039300 CALL-INIT-01-02.                                                 IC2254.2
   000390         039400     MOVE    1    TO REC-CT.                                      IC2254.2 115
   000391         039500     MOVE    2    TO DN1, DN2, DN3                                IC2254.2 52 56 53
   000392         039600     MOVE   42    TO DN4.                                         IC2254.2 58
   000393         039700 CALL-TEST-01-02-0.                                               IC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000394         039800     CALL   "IC225A-1" USING BY CONTENT   DN1 DN2                 IC2254.2 EXT 52 56

 ==000394==> IGYPG0020-W Name "IC225A-1" was processed as "IC225A01".

   000395         039900                                REFERENCE DN3                     IC2254.2 53
   000396         040000                                CONTENT   DN4                     IC2254.2 58
   000397         040100     END-CALL.                                                    IC2254.2
   000398         040200     GO TO   CALL-TEST-01-02-1.                                   IC2254.2 403
   000399         040300 CALL-DELETE-01-02.                                               IC2254.2
   000400         040400     PERFORM DE-LETE.                                             IC2254.2 220
   000401         040500     PERFORM PRINT-DETAIL.                                        IC2254.2 222
   000402         040600     GO TO   CALL-INIT-01-03.                                     IC2254.2 451
   000403         040700 CALL-TEST-01-02-1.                                               IC2254.2
   000404         040800     MOVE   "CALL-TEST-01-02-1" TO PAR-NAME.                      IC2254.2 68
   000405         040900     IF      DN1 = 2                                              IC2254.2 52
   000406      1  041000             PERFORM PASS                                         IC2254.2 218
   000407      1  041100             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000408         041200     ELSE                                                         IC2254.2
   000409      1  041300             MOVE    DN1  TO COMPUTED-N                           IC2254.2 52 80
   000410      1  041400             MOVE    2    TO CORRECT-N                            IC2254.2 94
   000411      1  041500             MOVE   "INCORRECT DN1 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000412      1  041600             PERFORM FAIL                                         IC2254.2 219
   000413      1  041700             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000414         041800     ADD     1 TO REC-CT.                                         IC2254.2 115
   000415         041900 CALL-TEST-01-02-2.                                               IC2254.2
   000416         042000     MOVE   "CALL-TEST-01-02-2" TO PAR-NAME.                      IC2254.2 68
   000417         042100     IF      DN2 = 2                                              IC2254.2 56
   000418      1  042200             PERFORM PASS                                         IC2254.2 218
   000419      1  042300             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000420         042400     ELSE                                                         IC2254.2
   000421      1  042500             MOVE    DN2  TO COMPUTED-N                           IC2254.2 56 80
   000422      1  042600             MOVE    2    TO CORRECT-N                            IC2254.2 94
   000423      1  042700             MOVE   "VALUE OF DN2 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000424      1  042800             PERFORM FAIL                                         IC2254.2 219
   000425      1  042900             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000426         043000     ADD     1 TO REC-CT.                                         IC2254.2 115
   000427         043100 CALL-TEST-01-02-3.                                               IC2254.2
   000428         043200     MOVE   "CALL-TEST-01-02-3" TO PAR-NAME.                      IC2254.2 68
   000429         043300     IF      DN3 = 3                                              IC2254.2 53
   000430      1  043400             PERFORM PASS                                         IC2254.2 218
   000431      1  043500             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000432         043600     ELSE                                                         IC2254.2
   000433      1  043700             MOVE    DN3  TO COMPUTED-N                           IC2254.2 53 80
   000434      1  043800             MOVE    3    TO CORRECT-N                            IC2254.2 94
   000435      1  043900             MOVE   "INCORRECT DN3 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000436      1  044000             PERFORM FAIL                                         IC2254.2 219
   000437      1  044100             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000438         044200     ADD     1 TO REC-CT.                                         IC2254.2 115
   000439         044300 CALL-TEST-01-02-4.                                               IC2254.2
   000440         044400     MOVE   "CALL-TEST-01-02-4" TO PAR-NAME.                      IC2254.2 68
   000441         044500     IF      DN4 = 42                                             IC2254.2 58
   000442      1  044600             PERFORM PASS                                         IC2254.2 218
   000443      1  044700             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000444         044800     ELSE                                                         IC2254.2
   000445      1  044900             MOVE    DN4  TO COMPUTED-N                           IC2254.2 58 80
   000446      1  045000             MOVE    42   TO CORRECT-N                            IC2254.2 94
   000447      1  045100             MOVE   "VALUE OF DN4 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448      1  045200             PERFORM FAIL                                         IC2254.2 219
   000449      1  045300             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000450         045400*                                                                 IC2254.2
   000451         045500 CALL-INIT-01-03.                                                 IC2254.2
   000452         045600     MOVE    1    TO REC-CT.                                      IC2254.2 115
   000453         045700     MOVE    3    TO DN1, DN2, DN3                                IC2254.2 52 56 53
   000454         045800     MOVE   71    TO DN4.                                         IC2254.2 58
   000455         045900 CALL-TEST-01-03-0.                                               IC2254.2
   000456         046000     CALL   "IC225A-1" USING BY CONTENT   DN1                     IC2254.2 EXT 52

 ==000456==> IGYPG0020-W Name "IC225A-1" was processed as "IC225A01".

   000457         046100                                REFERENCE DN2                     IC2254.2 56
   000458         046200                                CONTENT   DN3                     IC2254.2 53
   000459         046300                                REFERENCE DN4                     IC2254.2 58
   000460         046400     END-CALL.                                                    IC2254.2
   000461         046500     GO TO   CALL-TEST-01-03-1.                                   IC2254.2 466
   000462         046600 CALL-DELETE-01-03.                                               IC2254.2
   000463         046700     PERFORM DE-LETE.                                             IC2254.2 220
   000464         046800     PERFORM PRINT-DETAIL.                                        IC2254.2 222
   000465         046900     GO TO   CALL-TEST-02.                                        IC2254.2 514
   000466         047000 CALL-TEST-01-03-1.                                               IC2254.2
   000467         047100     MOVE   "CALL-TEST-01-03-1" TO PAR-NAME.                      IC2254.2 68
   000468         047200     IF      DN1 = 3                                              IC2254.2 52
   000469      1  047300             PERFORM PASS                                         IC2254.2 218
   000470      1  047400             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000471         047500     ELSE                                                         IC2254.2
   000472      1  047600             MOVE    DN1  TO COMPUTED-N                           IC2254.2 52 80
   000473      1  047700             MOVE    3    TO CORRECT-N                            IC2254.2 94
   000474      1  047800             MOVE   "VALUE OF DN1 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000475      1  047900             PERFORM FAIL                                         IC2254.2 219
   000476      1  048000             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000477         048100     ADD     1 TO REC-CT.                                         IC2254.2 115
   000478         048200 CALL-TEST-01-03-2.                                               IC2254.2
   000479         048300     MOVE   "CALL-TEST-01-03-2" TO PAR-NAME.                      IC2254.2 68
   000480         048400     IF      DN2 = 3                                              IC2254.2 56
   000481      1  048500             PERFORM PASS                                         IC2254.2 218
   000482      1  048600             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000483         048700     ELSE                                                         IC2254.2
   000484      1  048800             MOVE    DN2  TO COMPUTED-N                           IC2254.2 56 80
   000485      1  048900             MOVE    3    TO CORRECT-N                            IC2254.2 94
   000486      1  049000             MOVE   "INCORRECT DN2 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000487      1  049100             PERFORM FAIL                                         IC2254.2 219
   000488      1  049200             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000489         049300     ADD     1 TO REC-CT.                                         IC2254.2 115
   000490         049400 CALL-TEST-01-03-3.                                               IC2254.2
   000491         049500     MOVE   "CALL-TEST-01-03-3" TO PAR-NAME.                      IC2254.2 68
   000492         049600     IF      DN3 = 3                                              IC2254.2 53
   000493      1  049700             PERFORM PASS                                         IC2254.2 218
   000494      1  049800             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000495         049900     ELSE                                                         IC2254.2
   000496      1  050000             MOVE    DN3  TO COMPUTED-N                           IC2254.2 53 80
   000497      1  050100             MOVE    3    TO CORRECT-N                            IC2254.2 94
   000498      1  050200             MOVE   "VALUE OF DN3 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000499      1  050300             PERFORM FAIL                                         IC2254.2 219
   000500      1  050400             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000501         050500     ADD     1 TO REC-CT.                                         IC2254.2 115
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000502         050600 CALL-TEST-01-03-4.                                               IC2254.2
   000503         050700     MOVE   "CALL-TEST-01-03-4" TO PAR-NAME.                      IC2254.2 68
   000504         050800     IF      DN4 = 3                                              IC2254.2 58
   000505      1  050900             PERFORM PASS                                         IC2254.2 218
   000506      1  051000             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000507         051100     ELSE                                                         IC2254.2
   000508      1  051200             MOVE    DN4  TO COMPUTED-N                           IC2254.2 58 80
   000509      1  051300             MOVE    3    TO CORRECT-N                            IC2254.2 94
   000510      1  051400             MOVE   "INCORRECT DN4 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000511      1  051500             PERFORM FAIL                                         IC2254.2 219
   000512      1  051600             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000513         051700*                                                                 IC2254.2
   000514         051800 CALL-TEST-02.                                                    IC2254.2
   000515         051900     MOVE   "DATA-NAME USED TWICE" TO FEATURE.                    IC2254.2 64
   000516         052000*            THIS TEST USES A DATA-NAME MORE THAN ONCE IN         IC2254.2
   000517         052100*            A USING PHRASE OF A CALL STATEMENT.                  IC2254.2
   000518         052200 CALL-INIT-02-01.                                                 IC2254.2
   000519         052300     MOVE    1 TO REC-CT.                                         IC2254.2 115
   000520         052400     MOVE    1 TO DN1.                                            IC2254.2 52
   000521         052500     MOVE    0 TO DN2, DN3, DN4.                                  IC2254.2 56 53 58
   000522         052600 CALL-TEST-02-01-0.                                               IC2254.2
   000523         052700     CALL   "IC225A-1" USING REFERENCE DN1,                       IC2254.2 EXT 52

 ==000523==> IGYPG0020-W Name "IC225A-1" was processed as "IC225A01".

   000524         052800                             CONTENT   DN2,                       IC2254.2 56
   000525         052900                             REFERENCE DN1, DN4,                  IC2254.2 52 58
   000526         053000     END-CALL.                                                    IC2254.2
   000527         053100     GO TO   CALL-TEST-02-01-1.                                   IC2254.2 532
   000528         053200 CALL-DELETE-02-01.                                               IC2254.2
   000529         053300     PERFORM DE-LETE.                                             IC2254.2 220
   000530         053400     PERFORM PRINT-DETAIL.                                        IC2254.2 222
   000531         053500     GO TO   CALL-INIT-02-02.                                     IC2254.2 580
   000532         053600 CALL-TEST-02-01-1.                                               IC2254.2
   000533         053700     MOVE   "CALL-TEST-02-01-1" TO PAR-NAME.                      IC2254.2 68
   000534         053800     IF      DN1 = 2                                              IC2254.2 52
   000535      1  053900             PERFORM PASS                                         IC2254.2 218
   000536      1  054000             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000537         054100     ELSE                                                         IC2254.2
   000538      1  054200             MOVE    DN1  TO COMPUTED-N                           IC2254.2 52 80
   000539      1  054300             MOVE    2    TO CORRECT-N                            IC2254.2 94
   000540      1  054400             MOVE   "INCORRECT DN1 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000541      1  054500             PERFORM FAIL                                         IC2254.2 219
   000542      1  054600             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000543         054700     ADD     1 TO REC-CT.                                         IC2254.2 115
   000544         054800 CALL-TEST-02-01-2.                                               IC2254.2
   000545         054900     MOVE   "CALL-TEST-02-01-2" TO PAR-NAME.                      IC2254.2 68
   000546         055000     IF      DN2 = 0                                              IC2254.2 56
   000547      1  055100             PERFORM PASS                                         IC2254.2 218
   000548      1  055200             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000549         055300     ELSE                                                         IC2254.2
   000550      1  055400             MOVE    DN2  TO COMPUTED-N                           IC2254.2 56 80
   000551      1  055500             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000552      1  055600             MOVE   "VALUE OF DN2 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000553      1  055700             PERFORM FAIL                                         IC2254.2 219
   000554      1  055800             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000555         055900     ADD     1 TO REC-CT.                                         IC2254.2 115
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000556         056000 CALL-TEST-02-01-3.                                               IC2254.2
   000557         056100     MOVE   "CALL-TEST-02-01-3" TO PAR-NAME.                      IC2254.2 68
   000558         056200     IF      DN3 = 0                                              IC2254.2 53
   000559      1  056300             PERFORM PASS                                         IC2254.2 218
   000560      1  056400             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000561         056500     ELSE                                                         IC2254.2
   000562      1  056600             MOVE    DN3  TO COMPUTED-N                           IC2254.2 53 80
   000563      1  056700             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000564      1  056800             MOVE   "VALUE OF DN3 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000565      1  056900             PERFORM FAIL                                         IC2254.2 219
   000566      1  057000             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000567         057100     ADD     1 TO REC-CT.                                         IC2254.2 115
   000568         057200 CALL-TEST-02-01-4.                                               IC2254.2
   000569         057300     MOVE   "CALL-TEST-02-01-4" TO PAR-NAME.                      IC2254.2 68
   000570         057400     IF      DN4 = 4                                              IC2254.2 58
   000571      1  057500             PERFORM PASS                                         IC2254.2 218
   000572      1  057600             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000573         057700     ELSE                                                         IC2254.2
   000574      1  057800             MOVE    DN4  TO COMPUTED-N                           IC2254.2 58 80
   000575      1  057900             MOVE    4    TO CORRECT-N                            IC2254.2 94
   000576      1  058000             MOVE   "INCORRECT DN4 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000577      1  058100             PERFORM FAIL                                         IC2254.2 219
   000578      1  058200             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000579         058300*                                                                 IC2254.2
   000580         058400 CALL-INIT-02-02.                                                 IC2254.2
   000581         058500     MOVE 1 TO REC-CT.                                            IC2254.2 115
   000582         058600     MOVE 0 TO DN4, DN3, DN2, DN1.                                IC2254.2 58 53 56 52
   000583         058700 CALL-TEST-02-02-0.                                               IC2254.2
   000584         058800     CALL ID1 USING BY REFERENCE DN1                              IC2254.2 54 52
   000585         058900                       CONTENT   DN2 DN3 DN2                      IC2254.2 56 53 56
   000586         059000     END-CALL.                                                    IC2254.2
   000587         059100     GO TO   CALL-TEST-02-02-1.                                   IC2254.2 592
   000588         059200 CALL-DELETE-02-02.                                               IC2254.2
   000589         059300     PERFORM DE-LETE.                                             IC2254.2 220
   000590         059400     PERFORM PRINT-DETAIL.                                        IC2254.2 222
   000591         059500     GO TO   CALL-INIT-02-03.                                     IC2254.2 640
   000592         059600 CALL-TEST-02-02-1.                                               IC2254.2
   000593         059700     MOVE   "CALL-TEST-02-02-1" TO PAR-NAME.                      IC2254.2 68
   000594         059800     IF      DN1 = 0                                              IC2254.2 52
   000595      1  059900             PERFORM PASS                                         IC2254.2 218
   000596      1  060000             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000597         060100     ELSE                                                         IC2254.2
   000598      1  060200             MOVE    DN1  TO COMPUTED-N                           IC2254.2 52 80
   000599      1  060300             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000600      1  060400             MOVE   "INCORRECT DN1 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000601      1  060500             PERFORM FAIL                                         IC2254.2 219
   000602      1  060600             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000603         060700     ADD     1 TO REC-CT.                                         IC2254.2 115
   000604         060800 CALL-TEST-02-02-2.                                               IC2254.2
   000605         060900     MOVE   "CALL-TEST-02-02-2" TO PAR-NAME.                      IC2254.2 68
   000606         061000     IF      DN2 = 0                                              IC2254.2 56
   000607      1  061100             PERFORM PASS                                         IC2254.2 218
   000608      1  061200             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000609         061300     ELSE                                                         IC2254.2
   000610      1  061400             MOVE    DN2  TO COMPUTED-N                           IC2254.2 56 80
   000611      1  061500             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000612      1  061600             MOVE   "VALUE OF DN2 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000613      1  061700             PERFORM FAIL                                         IC2254.2 219
   000614      1  061800             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000615         061900     ADD     1 TO REC-CT.                                         IC2254.2 115
   000616         062000 CALL-TEST-02-02-3.                                               IC2254.2
   000617         062100     MOVE   "CALL-TEST-02-02-3" TO PAR-NAME.                      IC2254.2 68
   000618         062200     IF      DN3 = 0                                              IC2254.2 53
   000619      1  062300             PERFORM PASS                                         IC2254.2 218
   000620      1  062400             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000621         062500     ELSE                                                         IC2254.2
   000622      1  062600             MOVE    DN3  TO COMPUTED-N                           IC2254.2 53 80
   000623      1  062700             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000624      1  062800             MOVE   "VALUE OF DN3 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000625      1  062900             PERFORM FAIL                                         IC2254.2 219
   000626      1  063000             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000627         063100     ADD     1 TO REC-CT.                                         IC2254.2 115
   000628         063200 CALL-TEST-02-02-4.                                               IC2254.2
   000629         063300     MOVE   "CALL-TEST-02-02-4" TO PAR-NAME.                      IC2254.2 68
   000630         063400     IF      DN4 = ZERO                                           IC2254.2 58 IMP
   000631      1  063500             PERFORM PASS                                         IC2254.2 218
   000632      1  063600             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000633         063700     ELSE                                                         IC2254.2
   000634      1  063800             MOVE    DN4  TO COMPUTED-N                           IC2254.2 58 80
   000635      1  063900             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000636      1  064000             MOVE   "VALUE OF DN4 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000637      1  064100             PERFORM FAIL                                         IC2254.2 219
   000638      1  064200             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000639         064300*                                                                 IC2254.2
   000640         064400 CALL-INIT-02-03.                                                 IC2254.2
   000641         064500     MOVE 1 TO REC-CT.                                            IC2254.2 115
   000642         064600     MOVE 0 TO DN4, DN3.                                          IC2254.2 58 53
   000643         064700     MOVE 10 TO DN2.                                              IC2254.2 56
   000644         064800     MOVE 25 TO DN1.                                              IC2254.2 52
   000645         064900 CALL-TEST-02-03-0.                                               IC2254.2
   000646         065000     CALL ID1 USING CONTENT   DN1                                 IC2254.2 54 52
   000647         065100                    REFERENCE DN2 DN1                             IC2254.2 56 52
   000648         065200                    REFERENCE DN2                                 IC2254.2 56
   000649         065300     END-CALL.                                                    IC2254.2
   000650         065400     GO TO   CALL-TEST-02-03-1.                                   IC2254.2 655
   000651         065500 CALL-DELETE-02-03.                                               IC2254.2
   000652         065600     PERFORM DE-LETE.                                             IC2254.2 220
   000653         065700     PERFORM PRINT-DETAIL.                                        IC2254.2 222
   000654         065800     GO TO   CALL-INIT-03-01.                                     IC2254.2 709
   000655         065900 CALL-TEST-02-03-1.                                               IC2254.2
   000656         066000     MOVE   "CALL-TEST-02-03-1" TO PAR-NAME.                      IC2254.2 68
   000657         066100     IF      DN1 = 26                                             IC2254.2 52
   000658      1  066200             PERFORM PASS                                         IC2254.2 218
   000659      1  066300             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000660         066400     ELSE                                                         IC2254.2
   000661      1  066500             MOVE    DN1  TO COMPUTED-N                           IC2254.2 52 80
   000662      1  066600             MOVE    26   TO CORRECT-N                            IC2254.2 94
   000663      1  066700             MOVE   "INCORRECT VALUE RETURNED     " TO RE-MARK    IC2254.2 73
   000664      1  066800             PERFORM FAIL                                         IC2254.2 219
   000665      1  066900             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000666         067000     ADD     1 TO REC-CT.                                         IC2254.2 115
   000667         067100 CALL-TEST-02-03-2.                                               IC2254.2
   000668         067200     MOVE   "CALL-TEST-02-03-2" TO PAR-NAME.                      IC2254.2 68
   000669         067300     IF      DN2 = 6                                              IC2254.2 56
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000670      1  067400             PERFORM PASS                                         IC2254.2 218
   000671      1  067500             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000672         067600     ELSE                                                         IC2254.2
   000673      1  067700             MOVE    DN2  TO COMPUTED-N                           IC2254.2 56 80
   000674      1  067800             MOVE    6    TO CORRECT-N                            IC2254.2 94
   000675      1  067900             MOVE   "INCORRECT DN2 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000676      1  068000             PERFORM FAIL                                         IC2254.2 219
   000677      1  068100             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000678         068200     ADD     1 TO REC-CT.                                         IC2254.2 115
   000679         068300 CALL-TEST-02-03-3.                                               IC2254.2
   000680         068400     MOVE   "CALL-TEST-02-03-3" TO PAR-NAME.                      IC2254.2 68
   000681         068500     IF      DN3 = 0                                              IC2254.2 53
   000682      1  068600             PERFORM PASS                                         IC2254.2 218
   000683      1  068700             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000684         068800     ELSE                                                         IC2254.2
   000685      1  068900             MOVE    DN3  TO COMPUTED-N                           IC2254.2 53 80
   000686      1  069000             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000687      1  069100             MOVE   "VALUE OF DN3 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000688      1  069200             PERFORM FAIL                                         IC2254.2 219
   000689      1  069300             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000690         069400     ADD     1 TO REC-CT.                                         IC2254.2 115
   000691         069500 CALL-TEST-02-03-4.                                               IC2254.2
   000692         069600     MOVE   "CALL-TEST-02-03-4" TO PAR-NAME.                      IC2254.2 68
   000693         069700     IF      DN4 = ZERO                                           IC2254.2 58 IMP
   000694      1  069800             PERFORM PASS                                         IC2254.2 218
   000695      1  069900             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000696         070000     ELSE                                                         IC2254.2
   000697      1  070100             MOVE    DN4  TO COMPUTED-N                           IC2254.2 58 80
   000698      1  070200             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000699      1  070300             MOVE   "VALUE OF DN4 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000700      1  070400             PERFORM FAIL                                         IC2254.2 219
   000701      1  070500             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000702         070600*                                                                 IC2254.2
   000703         070700 CALL-TEST-03.                                                    IC2254.2
   000704         070800*    THIS TEST USES THE ON OVERFLOW PHRASE IN THE CALL            IC2254.2
   000705         070900*    STATEMENT.  THIS IS A SYNTACTICAL CHECK ONLY, THE            IC2254.2
   000706         071000*    ON OVERFLOW CONDITION SHOULD NEVER OCCUR.                    IC2254.2
   000707         071100     MOVE "CALL-TEST-03" TO PAR-NAME.                             IC2254.2 68
   000708         071200     MOVE "ON OVERFLOW PHRASE" TO FEATURE.                        IC2254.2 64
   000709         071300 CALL-INIT-03-01.                                                 IC2254.2
   000710         071400     MOVE    1  TO REC-CT.                                        IC2254.2 115
   000711         071500     MOVE    6  TO CALL-COUNT.                                    IC2254.2 60
   000712         071600     MOVE    20 TO DN1.                                           IC2254.2 52
   000713         071700     MOVE 30 TO DN2.                                              IC2254.2 56
   000714         071800     MOVE ZERO TO DN3, DN4.                                       IC2254.2 IMP 53 58
   000715         071900 CALL-TEST-03-01-0.                                               IC2254.2
   000716         072000     MOVE   "CALL-TEST-03-01-0" TO PAR-NAME.                      IC2254.2 68
   000717         072100     CALL "IC225A-1" USING BY CONTENT   DN1, DN2,                 IC2254.2 EXT 52 56

 ==000717==> IGYPG0020-W Name "IC225A-1" was processed as "IC225A01".

   000718         072200                              REFERENCE DN3, DN4;                 IC2254.2 53 58
   000719      1  072300         ON OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK  IC2254.2 73
   000720      1  072400                     PERFORM FAIL                                 IC2254.2 219
   000721      1  072500                     PERFORM PRINT-DETAIL.                        IC2254.2 222
   000722         072600     GO TO   CALL-TEST-03-01-1.                                   IC2254.2 727
   000723         072700 CALL-DELETE-03-01.                                               IC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000724         072800     PERFORM DE-LETE.                                             IC2254.2 220
   000725         072900     PERFORM PRINT-DETAIL.                                        IC2254.2 222
   000726         073000     GO TO   CALL-INIT-03-02.                                     IC2254.2 775
   000727         073100 CALL-TEST-03-01-1.                                               IC2254.2
   000728         073200     MOVE   "CALL-TEST-03-01-1" TO PAR-NAME.                      IC2254.2 68
   000729         073300     IF      DN1 = 20                                             IC2254.2 52
   000730      1  073400             PERFORM PASS                                         IC2254.2 218
   000731      1  073500             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000732         073600     ELSE                                                         IC2254.2
   000733      1  073700             MOVE    DN1  TO COMPUTED-N                           IC2254.2 52 80
   000734      1  073800             MOVE    20   TO CORRECT-N                            IC2254.2 94
   000735      1  073900             MOVE   "VALUE OF DN1 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000736      1  074000             PERFORM FAIL                                         IC2254.2 219
   000737      1  074100             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000738         074200     ADD     1 TO REC-CT.                                         IC2254.2 115
   000739         074300 CALL-TEST-03-01-2.                                               IC2254.2
   000740         074400     MOVE   "CALL-TEST-03-01-2" TO PAR-NAME.                      IC2254.2 68
   000741         074500     IF      DN2 = 30                                             IC2254.2 56
   000742      1  074600             PERFORM PASS                                         IC2254.2 218
   000743      1  074700             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000744         074800     ELSE                                                         IC2254.2
   000745      1  074900             MOVE    DN2  TO COMPUTED-N                           IC2254.2 56 80
   000746      1  075000             MOVE    30   TO CORRECT-N                            IC2254.2 94
   000747      1  075100             MOVE   "VALUE OF DN2 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000748      1  075200             PERFORM FAIL                                         IC2254.2 219
   000749      1  075300             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000750         075400     ADD     1 TO REC-CT.                                         IC2254.2 115
   000751         075500 CALL-TEST-03-01-3.                                               IC2254.2
   000752         075600     MOVE   "CALL-TEST-03-01-3" TO PAR-NAME.                      IC2254.2 68
   000753         075700     IF      DN3 = 21                                             IC2254.2 53
   000754      1  075800             PERFORM PASS                                         IC2254.2 218
   000755      1  075900             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000756         076000     ELSE                                                         IC2254.2
   000757      1  076100             MOVE    DN3  TO COMPUTED-N                           IC2254.2 53 80
   000758      1  076200             MOVE    21   TO CORRECT-N                            IC2254.2 94
   000759      1  076300             MOVE   "INCORRECT DN3 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000760      1  076400             PERFORM FAIL                                         IC2254.2 219
   000761      1  076500             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000762         076600     ADD     1 TO REC-CT.                                         IC2254.2 115
   000763         076700 CALL-TEST-03-01-4.                                               IC2254.2
   000764         076800     MOVE   "CALL-TEST-03-01-4" TO PAR-NAME.                      IC2254.2 68
   000765         076900     IF      DN4 = 7                                              IC2254.2 58
   000766      1  077000             PERFORM PASS                                         IC2254.2 218
   000767      1  077100             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000768         077200     ELSE                                                         IC2254.2
   000769      1  077300             MOVE    DN4  TO COMPUTED-N                           IC2254.2 58 80
   000770      1  077400             MOVE    7    TO CORRECT-N                            IC2254.2 94
   000771      1  077500             MOVE   "INCORRECT DN4 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000772      1  077600             PERFORM FAIL                                         IC2254.2 219
   000773      1  077700             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000774         077800*                                                                 IC2254.2
   000775         077900 CALL-INIT-03-02.                                                 IC2254.2
   000776         078000     MOVE   "CALL-TEST-03-02-0" TO PAR-NAME.                      IC2254.2 68
   000777         078100     MOVE    0 TO DN3, DN4.                                       IC2254.2 53 58
   000778         078200     MOVE    1 TO REC-CT.                                         IC2254.2 115
   000779         078300 CALL-TEST-03-02-0.                                               IC2254.2
   000780         078400     CALL "IC225A-1" USING REFERENCE DN1,                         IC2254.2 EXT 52
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0
 ==000780==> IGYPG0020-W Name "IC225A-1" was processed as "IC225A01".

   000781         078500                           CONTENT   DN2,                         IC2254.2 56
   000782         078600                           REFERENCE DN3,                         IC2254.2 53
   000783         078700                           CONTENT   DN4,                         IC2254.2 58
   000784      1  078800         OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK     IC2254.2 73
   000785      1  078900                     PERFORM FAIL                                 IC2254.2 219
   000786      1  079000                     PERFORM PRINT-DETAIL.                        IC2254.2 222
   000787         079100     GO TO   CALL-TEST-03-02-1.                                   IC2254.2 792
   000788         079200 CALL-DELETE-03-02.                                               IC2254.2
   000789         079300     PERFORM DE-LETE.                                             IC2254.2 220
   000790         079400     PERFORM PRINT-DETAIL.                                        IC2254.2 222
   000791         079500     GO TO   CALL-INIT-03-03.                                     IC2254.2 840
   000792         079600 CALL-TEST-03-02-1.                                               IC2254.2
   000793         079700     MOVE   "CALL-TEST-03-02-1" TO PAR-NAME.                      IC2254.2 68
   000794         079800     IF      DN1 = 20                                             IC2254.2 52
   000795      1  079900             PERFORM PASS                                         IC2254.2 218
   000796      1  080000             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000797         080100     ELSE                                                         IC2254.2
   000798      1  080200             MOVE    DN1  TO COMPUTED-N                           IC2254.2 52 80
   000799      1  080300             MOVE    20   TO CORRECT-N                            IC2254.2 94
   000800      1  080400             MOVE   "VALUE OF DN1 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000801      1  080500             PERFORM FAIL                                         IC2254.2 219
   000802      1  080600             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000803         080700     ADD     1 TO REC-CT.                                         IC2254.2 115
   000804         080800 CALL-TEST-03-02-2.                                               IC2254.2
   000805         080900     MOVE   "CALL-TEST-03-02-2" TO PAR-NAME.                      IC2254.2 68
   000806         081000     IF      DN2 = 30                                             IC2254.2 56
   000807      1  081100             PERFORM PASS                                         IC2254.2 218
   000808      1  081200             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000809         081300     ELSE                                                         IC2254.2
   000810      1  081400             MOVE    DN2  TO COMPUTED-N                           IC2254.2 56 80
   000811      1  081500             MOVE    30   TO CORRECT-N                            IC2254.2 94
   000812      1  081600             MOVE   "VALUE OF DN2 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000813      1  081700             PERFORM FAIL                                         IC2254.2 219
   000814      1  081800             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000815         081900     ADD     1 TO REC-CT.                                         IC2254.2 115
   000816         082000 CALL-TEST-03-02-3.                                               IC2254.2
   000817         082100     MOVE   "CALL-TEST-03-02-3" TO PAR-NAME.                      IC2254.2 68
   000818         082200     IF      DN3 = 21                                             IC2254.2 53
   000819      1  082300             PERFORM PASS                                         IC2254.2 218
   000820      1  082400             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000821         082500     ELSE                                                         IC2254.2
   000822      1  082600             MOVE    DN3  TO COMPUTED-N                           IC2254.2 53 80
   000823      1  082700             MOVE    21   TO CORRECT-N                            IC2254.2 94
   000824      1  082800             MOVE   "INCORRECT DN3 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000825      1  082900             PERFORM FAIL                                         IC2254.2 219
   000826      1  083000             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000827         083100     ADD     1 TO REC-CT.                                         IC2254.2 115
   000828         083200 CALL-TEST-03-02-4.                                               IC2254.2
   000829         083300     MOVE   "CALL-TEST-03-02-4" TO PAR-NAME.                      IC2254.2 68
   000830         083400     IF      DN4 = 0                                              IC2254.2 58
   000831      1  083500             PERFORM PASS                                         IC2254.2 218
   000832      1  083600             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000833         083700     ELSE                                                         IC2254.2
   000834      1  083800             MOVE    DN4  TO COMPUTED-N                           IC2254.2 58 80
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000835      1  083900             MOVE    ZERO TO CORRECT-N                            IC2254.2 IMP 94
   000836      1  084000             MOVE   "VALUE OF DN4 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000837      1  084100             PERFORM FAIL                                         IC2254.2 219
   000838      1  084200             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000839         084300*                                                                 IC2254.2
   000840         084400 CALL-INIT-03-03.                                                 IC2254.2
   000841         084500     MOVE   "CALL-TEST-03-03-0" TO PAR-NAME.                      IC2254.2 68
   000842         084600     MOVE    0 TO DN3, DN4.                                       IC2254.2 53 58
   000843         084700     MOVE    1 TO REC-CT.                                         IC2254.2 115
   000844         084800 CALL-TEST-03-03-0.                                               IC2254.2
   000845         084900     CALL ID1 USING BY CONTENT DN1                                IC2254.2 54 52
   000846         085000                       REFERENCE DN2 DN3 DN4                      IC2254.2 56 53 58
   000847      1  085100         ON OVERFLOW MOVE "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK  IC2254.2 73
   000848      1  085200             PERFORM FAIL                                         IC2254.2 219
   000849      1  085300             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000850         085400     GO TO   CALL-TEST-03-03-1.                                   IC2254.2 855
   000851         085500 CALL-DELETE-03-03.                                               IC2254.2
   000852         085600     PERFORM DE-LETE.                                             IC2254.2 220
   000853         085700     PERFORM PRINT-DETAIL.                                        IC2254.2 222
   000854         085800     GO TO   CALL-INIT-03-03.                                     IC2254.2 840
   000855         085900 CALL-TEST-03-03-1.                                               IC2254.2
   000856         086000     MOVE   "CALL-TEST-03-03-1" TO PAR-NAME.                      IC2254.2 68
   000857         086100     IF      DN1 = 20                                             IC2254.2 52
   000858      1  086200             PERFORM PASS                                         IC2254.2 218
   000859      1  086300             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000860         086400     ELSE                                                         IC2254.2
   000861      1  086500             MOVE    DN1  TO COMPUTED-N                           IC2254.2 52 80
   000862      1  086600             MOVE    20   TO CORRECT-N                            IC2254.2 94
   000863      1  086700             MOVE   "VALUE OF DN1 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000864      1  086800             PERFORM FAIL                                         IC2254.2 219
   000865      1  086900             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000866         087000     ADD     1 TO REC-CT.                                         IC2254.2 115
   000867         087100 CALL-TEST-03-03-2.                                               IC2254.2
   000868         087200     MOVE   "CALL-TEST-03-03-2" TO PAR-NAME.                      IC2254.2 68
   000869         087300     IF      DN2 = 30                                             IC2254.2 56
   000870      1  087400             PERFORM PASS                                         IC2254.2 218
   000871      1  087500             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000872         087600     ELSE                                                         IC2254.2
   000873      1  087700             MOVE    DN2  TO COMPUTED-N                           IC2254.2 56 80
   000874      1  087800             MOVE    30   TO CORRECT-N                            IC2254.2 94
   000875      1  087900             MOVE   "VALUE OF DN2 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000876      1  088000             PERFORM FAIL                                         IC2254.2 219
   000877      1  088100             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000878         088200     ADD     1 TO REC-CT.                                         IC2254.2 115
   000879         088300 CALL-TEST-03-03-3.                                               IC2254.2
   000880         088400     MOVE   "CALL-TEST-03-03-3" TO PAR-NAME.                      IC2254.2 68
   000881         088500     IF      DN3 = 21                                             IC2254.2 53
   000882      1  088600             PERFORM PASS                                         IC2254.2 218
   000883      1  088700             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000884         088800     ELSE                                                         IC2254.2
   000885      1  088900             MOVE    DN3  TO COMPUTED-N                           IC2254.2 53 80
   000886      1  089000             MOVE    21   TO CORRECT-N                            IC2254.2 94
   000887      1  089100             MOVE   "INCORRECT DN3 VALUE RETURNED" TO RE-MARK     IC2254.2 73
   000888      1  089200             PERFORM FAIL                                         IC2254.2 219
   000889      1  089300             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000890         089400     ADD     1 TO REC-CT.                                         IC2254.2 115
   000891         089500 CALL-TEST-03-03-4.                                               IC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000892         089600     MOVE   "CALL-TEST-03-03-4" TO PAR-NAME.                      IC2254.2 68
   000893         089700     IF      DN4 = 9                                              IC2254.2 58
   000894      1  089800             PERFORM PASS                                         IC2254.2 218
   000895      1  089900             PERFORM PRINT-DETAIL                                 IC2254.2 222
   000896         090000     ELSE                                                         IC2254.2
   000897      1  090100             MOVE    DN4  TO COMPUTED-N                           IC2254.2 58 80
   000898      1  090200             MOVE    9    TO CORRECT-N                            IC2254.2 94
   000899      1  090300             MOVE   "VALUE OF DN4 HAS BEEN CHANGED" TO RE-MARK    IC2254.2 73
   000900      1  090400             PERFORM FAIL                                         IC2254.2 219
   000901      1  090500             PERFORM PRINT-DETAIL.                                IC2254.2 222
   000902         090600*                                                                 IC2254.2
   000903         090700     GO TO EXIT-IC225A.                                           IC2254.2 911
   000904         090800*                                                                 IC2254.2
   000905         090900 CALL-DELETE-03.                                                  IC2254.2
   000906         091000*        IF THE ON OVERFLOW PHRASE IS NOT RECOGNIZED, DELETE ALL  IC2254.2
   000907         091100*    OF THE ABOVE CALL-TEST-03 PARAGRAPHS, STARTING WITH          IC2254.2
   000908         091200*    CALL-TEST-03-01.                                             IC2254.2
   000909         091300     PERFORM DE-LETE.                                             IC2254.2 220
   000910         091400     PERFORM PRINT-DETAIL.                                        IC2254.2 222
   000911         091500 EXIT-IC225A.                                                     IC2254.2
   000912         091600     GO TO CCVS-EXIT.                                             IC2254.2 925
   000913         091700 SECT-IC225A-002 SECTION.                                         IC2254.2
   000914         091800 CHECK-TEST-03.                                                   IC2254.2
   000915         091900     MOVE ZERO TO FAIL-FLAG.                                      IC2254.2 IMP 61
   000916         092000     ADD 1 TO CALL-COUNT.                                         IC2254.2 60
   000917         092100     IF DN4 NOT EQUAL TO CALL-COUNT                               IC2254.2 58 60
   000918      1  092200         ADD 1 TO FAIL-FLAG.                                      IC2254.2 61
   000919         092300     IF DN3 NOT EQUAL TO 21                                       IC2254.2 53
   000920      1  092400         ADD 1 TO FAIL-FLAG.                                      IC2254.2 61
   000921         092500     IF DN2 NOT EQUAL TO 30                                       IC2254.2 56
   000922      1  092600         ADD 1 TO FAIL-FLAG.                                      IC2254.2 61
   000923         092700     IF DN1 NOT EQUAL TO 20                                       IC2254.2 52
   000924      1  092800         ADD 1 TO FAIL-FLAG.                                      IC2254.2 61
   000925         092900 CCVS-EXIT SECTION.                                               IC2254.2
   000926         093000 CCVS-999999.                                                     IC2254.2
   000927         093100     GO TO CLOSE-FILES.                                           IC2254.2 211
   000928         093200 END PROGRAM IC225A.                                              IC2254.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    20
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      124   ANSI-REFERENCE . . . . . . . .  296 303 312 M320
       60   CALL-COUNT . . . . . . . . . .  M323 M711 M916 917
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
       80   COMPUTED-N . . . . . . . . . .  M347 M359 M371 M383 M409 M421 M433 M445 M472 M484 M496 M508 M538 M550 M562 M574
                                            M598 M610 M622 M634 M661 M673 M685 M697 M733 M745 M757 M769 M798 M810 M822 M834
                                            M861 M873 M885 M897
       78   COMPUTED-X . . . . . . . . . .  M230 294
       82   COMPUTED-0V18
       84   COMPUTED-14V4
       86   COMPUTED-18V0
       83   COMPUTED-4V14
      102   COR-ANSI-REFERENCE . . . . . .  M303 M305
       93   CORRECT-A. . . . . . . . . . .  94 95 96 97 98 309 311
       94   CORRECT-N. . . . . . . . . . .  M348 M360 M372 M384 M410 M422 M434 M446 M473 M485 M497 M509 M539 M551 M563 M575
                                            M599 M611 M623 M635 M662 M674 M686 M698 M734 M746 M758 M770 M799 M811 M823 M835
                                            M862 M874 M886 M898
       92   CORRECT-X. . . . . . . . . . .  M231 295
       95   CORRECT-0V18
       97   CORRECT-14V4
       99   CORRECT-18V0
       96   CORRECT-4V14
       98   CR-18V0
      116   DELETE-COUNTER . . . . . . . .  M220 249 265 267
       52   DN1. . . . . . . . . . . . . .  333 343 347 M391 394 405 409 M453 456 468 472 M520 523 525 534 538 M582 584 594
                                            598 M644 646 647 657 661 M712 717 729 733 780 794 798 845 857 861 923
       56   DN2. . . . . . . . . . . . . .  333 355 359 M391 394 417 421 M453 457 480 484 M521 524 546 550 M582 585 585 606
                                            610 M643 647 648 669 673 M713 717 741 745 781 806 810 846 869 873 921
       53   DN3. . . . . . . . . . . . . .  M331 334 367 371 M391 395 429 433 M453 458 492 496 M521 558 562 M582 585 618
                                            622 M642 681 685 M714 718 753 757 M777 782 818 822 M842 846 881 885 919
       58   DN4. . . . . . . . . . . . . .  M331 334 379 383 M392 396 441 445 M454 459 504 508 M521 525 570 574 M582 630
                                            634 M642 693 697 M714 718 765 769 M777 783 830 834 M842 846 893 897 917
       71   DOTVALUE . . . . . . . . . . .  M225
      122   DUMMY-HOLD . . . . . . . . . .  M279 285
       50   DUMMY-RECORD . . . . . . . . .  M235 M236 M237 M238 M240 M241 M242 M244 M246 M255 M262 M269 M274 M275 279 M280
                                            281 M282 M283 M284 M285 289 M290 M298 M313
      169   ENDER-DESC . . . . . . . . . .  M257 M268 M273
      117   ERROR-COUNTER. . . . . . . . .  M219 248 258 261
      121   ERROR-HOLD . . . . . . . . . .  M248 M249 M249 M250 253
      167   ERROR-TOTAL. . . . . . . . . .  M259 M261 M266 M267 M271 M272
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    21
0 Defined   Cross-reference of data names   References

0      61   FAIL-FLAG. . . . . . . . . . .  M915 M918 M920 M922 M924
       64   FEATURE. . . . . . . . . . . .  M322 M515 M708
      195   HYPHEN-LINE. . . . . . . . . .  242 244 284
      161   ID-AGAIN . . . . . . . . . . .  M207
       54   ID1. . . . . . . . . . . . . .  584 646 845
       55   ID2
      194   INF-ANSI-REFERENCE . . . . . .  M296 M299 M312 M314
      189   INFO-TEXT. . . . . . . . . . .  M297
      118   INSPECT-COUNTER. . . . . . . .  M217 248 270 272
       66   P-OR-F . . . . . . . . . . . .  M217 M218 M219 M220 227 M230
       68   PAR-NAME . . . . . . . . . . .  M232 M321 M342 M354 M366 M378 M404 M416 M428 M440 M467 M479 M491 M503 M533 M545
                                            M557 M569 M593 M605 M617 M629 M656 M668 M680 M692 M707 M716 M728 M740 M752 M764
                                            M776 M793 M805 M817 M829 M841 M856 M868 M880 M892
       70   PARDOT-X . . . . . . . . . . .  M224
      119   PASS-COUNTER . . . . . . . . .  M218 250 252
       48   PRINT-FILE . . . . . . . . . .  44 206 212
       49   PRINT-REC. . . . . . . . . . .  M226 M302 M304
       73   RE-MARK. . . . . . . . . . . .  M221 M233 M349 M361 M373 M385 M411 M423 M435 M447 M474 M486 M498 M510 M540 M552
                                            M564 M576 M600 M612 M624 M636 M663 M675 M687 M699 M719 M735 M747 M759 M771 M784
                                            M800 M812 M824 M836 M847 M863 M875 M887 M899
      115   REC-CT . . . . . . . . . . . .  223 225 232 M330 M352 M364 M376 M390 M414 M426 M438 M452 M477 M489 M501 M519
                                            M543 M555 M567 M581 M603 M615 M627 M641 M666 M678 M690 M710 M738 M750 M762 M778
                                            M803 M815 M827 M843 M866 M878 M890
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    22
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
      337   CALL-DELETE-01-01
      399   CALL-DELETE-01-02
      462   CALL-DELETE-01-03
      528   CALL-DELETE-02-01
      588   CALL-DELETE-02-02
      651   CALL-DELETE-02-03
      905   CALL-DELETE-03
      723   CALL-DELETE-03-01
      788   CALL-DELETE-03-02
      851   CALL-DELETE-03-03
      329   CALL-INIT-01-01
      389   CALL-INIT-01-02. . . . . . . .  G340
      451   CALL-INIT-01-03. . . . . . . .  G402
      518   CALL-INIT-02-01
      580   CALL-INIT-02-02. . . . . . . .  G531
      640   CALL-INIT-02-03. . . . . . . .  G591
      709   CALL-INIT-03-01. . . . . . . .  G654
      775   CALL-INIT-03-02. . . . . . . .  G726
      840   CALL-INIT-03-03. . . . . . . .  G791 G854
      319   CALL-TEST-01
      332   CALL-TEST-01-01-0
      341   CALL-TEST-01-01-1. . . . . . .  G336
      353   CALL-TEST-01-01-2
      365   CALL-TEST-01-01-3
      377   CALL-TEST-01-01-4
      393   CALL-TEST-01-02-0
      403   CALL-TEST-01-02-1. . . . . . .  G398
      415   CALL-TEST-01-02-2
      427   CALL-TEST-01-02-3
      439   CALL-TEST-01-02-4
      455   CALL-TEST-01-03-0
      466   CALL-TEST-01-03-1. . . . . . .  G461
      478   CALL-TEST-01-03-2
      490   CALL-TEST-01-03-3
      502   CALL-TEST-01-03-4
      514   CALL-TEST-02 . . . . . . . . .  G465
      522   CALL-TEST-02-01-0
      532   CALL-TEST-02-01-1. . . . . . .  G527
      544   CALL-TEST-02-01-2
      556   CALL-TEST-02-01-3
      568   CALL-TEST-02-01-4
      583   CALL-TEST-02-02-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    23
0 Defined   Cross-reference of procedures   References

0     592   CALL-TEST-02-02-1. . . . . . .  G587
      604   CALL-TEST-02-02-2
      616   CALL-TEST-02-02-3
      628   CALL-TEST-02-02-4
      645   CALL-TEST-02-03-0
      655   CALL-TEST-02-03-1. . . . . . .  G650
      667   CALL-TEST-02-03-2
      679   CALL-TEST-02-03-3
      691   CALL-TEST-02-03-4
      703   CALL-TEST-03
      715   CALL-TEST-03-01-0
      727   CALL-TEST-03-01-1. . . . . . .  G722
      739   CALL-TEST-03-01-2
      751   CALL-TEST-03-01-3
      763   CALL-TEST-03-01-4
      779   CALL-TEST-03-02-0
      792   CALL-TEST-03-02-1. . . . . . .  G787
      804   CALL-TEST-03-02-2
      816   CALL-TEST-03-02-3
      828   CALL-TEST-03-02-4
      844   CALL-TEST-03-03-0
      855   CALL-TEST-03-03-1. . . . . . .  G850
      867   CALL-TEST-03-03-2
      879   CALL-TEST-03-03-3
      891   CALL-TEST-03-03-4
      925   CCVS-EXIT. . . . . . . . . . .  G912
      926   CCVS-999999
      204   CCVS1
      316   CCVS1-EXIT . . . . . . . . . .  G210
      914   CHECK-TEST-03
      211   CLOSE-FILES. . . . . . . . . .  G927
      239   COLUMN-NAMES-ROUTINE . . . . .  E209
      220   DE-LETE. . . . . . . . . . . .  P338 P400 P463 P529 P589 P652 P724 P789 P852 P909
      243   END-ROUTINE. . . . . . . . . .  P212
      247   END-ROUTINE-1
      256   END-ROUTINE-12
      264   END-ROUTINE-13 . . . . . . . .  E212
      245   END-RTN-EXIT
      911   EXIT-IC225A. . . . . . . . . .  G903
      219   FAIL . . . . . . . . . . . . .  P350 P362 P374 P386 P412 P424 P436 P448 P475 P487 P499 P511 P541 P553 P565 P577
                                            P601 P613 P625 P637 P664 P676 P688 P700 P720 P736 P748 P760 P772 P785 P801 P813
                                            P825 P837 P848 P864 P876 P888 P900
      293   FAIL-ROUTINE . . . . . . . . .  P228
      306   FAIL-ROUTINE-EX. . . . . . . .  E228 G300
      301   FAIL-ROUTINE-WRITE . . . . . .  G294 G295
      234   HEAD-ROUTINE . . . . . . . . .  P209
      217   INSPT
      205   OPEN-FILES
      218   PASS . . . . . . . . . . . . .  P344 P356 P368 P380 P406 P418 P430 P442 P469 P481 P493 P505 P535 P547 P559 P571
                                            P595 P607 P619 P631 P658 P670 P682 P694 P730 P742 P754 P766 P795 P807 P819 P831
                                            P858 P870 P882 P894
      222   PRINT-DETAIL . . . . . . . . .  P339 P345 P351 P357 P363 P369 P375 P381 P387 P401 P407 P413 P419 P425 P431 P437
                                            P443 P449 P464 P470 P476 P482 P488 P494 P500 P506 P512 P530 P536 P542 P548 P554
                                            P560 P566 P572 P578 P590 P596 P602 P608 P614 P620 P626 P632 P638 P653 P659 P665
                                            P671 P677 P683 P689 P695 P701 P721 P725 P731 P737 P743 P749 P755 P761 P767 P773
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    24
0 Defined   Cross-reference of procedures   References

0                                           P786 P790 P796 P802 P808 P814 P820 P826 P832 P838 P849 P853 P859 P865 P871 P877
                                            P883 P889 P895 P901 P910
      318   SECT-IC225A-001
      913   SECT-IC225A-002
      215   TERMINATE-CALL
      213   TERMINATE-CCVS
      276   WRITE-LINE . . . . . . . . . .  P226 P227 P235 P236 P237 P238 P240 P241 P242 P244 P246 P255 P263 P269 P274 P275
                                            P298 P302 P304 P313
      288   WRT-LN . . . . . . . . . . . .  P282 P283 P284 P287 P292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    25
0 Defined   Cross-reference of programs     References

        3   IC225A . . . . . . . . . . . .  928
 EXTERNAL   IC225A-1 . . . . . . . . . . .  333 394 456 523 717 780
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A    Date 06/04/2022  Time 11:59:31   Page    26
0LineID  Message code  Message text

     48  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    333  IGYPG0020-W   Name "IC225A-1" was processed as "IC225A01".

                       Same message on line:    394    456    523    717    780
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       7           1              6
-* Statistics for COBOL program IC225A:
 *    Source records = 928
 *    Data Division statements = 71
 *    Procedure Division statements = 583
 *    Generated COBOL statements = 0
 *    Program complexity factor = 591
0End of compilation 1,  program IC225A,  highest severity 4.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A01  Date 06/04/2022  Time 11:59:31   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000929         093300 IDENTIFICATION DIVISION.                                         IC2254.2
   000930         093400 PROGRAM-ID.                                                      IC2254.2
   000931         093500     IC225A-1.                                                    IC2254.2

 ==000931==> IGYDS0020-W Name "IC225A-1" was processed as "IC225A01".

   000932         093700*                                                              *  IC2254.2
   000933         093800*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2254.2
   000934         093900*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2254.2
   000935         094000*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2254.2
   000936         094100*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2254.2
   000937         094200*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2254.2
   000938         094300*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2254.2
   000939         094400*                                                              *  IC2254.2
   000940         094500*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2254.2
   000941         094600*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2254.2
   000942         094700*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2254.2
   000943         094800*                                                              *  IC2254.2
   000944         094900*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2254.2
   000945         095000*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2254.2
   000946         095100*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2254.2
   000947         095200*                                                              *  IC2254.2
   000948         095300*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2254.2
   000949         095400*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2254.2
   000950         095500*                & INFORMATION TECHNOLOGY                      *  IC2254.2
   000951         095600*          TWO SKYLINE PLACE                                   *  IC2254.2
   000952         095700*          SUITE 1100                                          *  IC2254.2
   000953         095800*          5203 LEESBURG PIKE                                  *  IC2254.2
   000954         095900*          FALLS CHURCH                                        *  IC2254.2
   000955         096000*          VA 22041                                            *  IC2254.2
   000956         096100*          U.S.A.                                              *  IC2254.2
   000957         096200*                                                              *  IC2254.2
   000958         096300*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2254.2
   000959         096400*                                                              *  IC2254.2
   000960         096500*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2254.2
   000961         096600*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2254.2
   000962         096700*          21 RUE BARA                                         *  IC2254.2
   000963         096800*          F-92132 ISSY                                        *  IC2254.2
   000964         096900*          FRANCE                                              *  IC2254.2
   000965         097000*                                                              *  IC2254.2
   000966         097100*                                                              *  IC2254.2
   000967         097200*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2254.2
   000968         097300*               UND DATENVERARBEITUNG MBH)                     *  IC2254.2
   000969         097400*          SCHLOSS BIRLINGHOVEN                                *  IC2254.2
   000970         097500*          POSTFACH 12 40                                      *  IC2254.2
   000971         097600*          D-5205 ST. AUGUSTIN 1                               *  IC2254.2
   000972         097700*          GERMANY FR                                          *  IC2254.2
   000973         097800*                                                              *  IC2254.2
   000974         097900*                                                              *  IC2254.2
   000975         098000*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2254.2
   000976         098100*          OXFORD ROAD                                         *  IC2254.2
   000977         098200*          MANCHESTER                                          *  IC2254.2
   000978         098300*          M1 7ED                                              *  IC2254.2
   000979         098400*          UNITED KINGDOM                                      *  IC2254.2
   000980         098500*                                                              *  IC2254.2
   000981         098600*                                                              *  IC2254.2
   000982         098700*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A01  Date 06/04/2022  Time 11:59:31   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000983         098800*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2254.2
   000984         098900*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2254.2
   000985         099000*                                                              *  IC2254.2
   000986         099200*                                                              *  IC2254.2
   000987         099300*    VALIDATION FOR:-                                          *  IC2254.2
   000988         099400*                                                              *  IC2254.2
   000989         099500*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2254.2
   000990         099600*                                                              *  IC2254.2
   000991         099700*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2254.2
   000992         099800*                                                              *  IC2254.2
   000993         100000*                                                              *  IC2254.2
   000994         100100*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2254.2
   000995         100200*                                                              *  IC2254.2
   000996         100300*        X-55  - SYSTEM PRINTER NAME.                          *  IC2254.2
   000997         100400*        X-82  - SOURCE COMPUTER NAME.                         *  IC2254.2
   000998         100500*        X-83  - OBJECT COMPUTER NAME.                         *  IC2254.2
   000999         100600*                                                              *  IC2254.2
   001000         100800*                                                              *  IC2254.2
   001001         100900*    PROGRAM IC225A AND IC225A-1 WILL TEST THE NEW LANGUAGE    *  IC2254.2
   001002         101000*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2254.2
   001003         101100*    MODULE.                                                   *  IC2254.2
   001004         101200*    THE NEW LANGUAGE ELEMENTS TO BE TESTED WILL BE:           *  IC2254.2
   001005         101300*          "BY REFERENCE"     PHRASE                           *  IC2254.2
   001006         101400*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2254.2
   001007         101500*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2254.2
   001008         101600*    IDENTIFICATION DIVISION.                                  *  IC2254.2
   001009         101700*    PROGRAM-ID. IC225A.                                       *  IC2254.2
   001010         101800*              .                                               *  IC2254.2
   001011         101900*              .                                               *  IC2254.2
   001012         102000*              .                                               *  IC2254.2
   001013         102100*    END PROGRAM IC225A.                                       *  IC2254.2
   001014         102200*    PROGRAM-ID. IC225A-1.                                     *  IC2254.2
   001015         102300*              .                                               *  IC2254.2
   001016         102400*              .                                               *  IC2254.2
   001017         102500*              .                                               *  IC2254.2
   001018         102700 ENVIRONMENT DIVISION.                                            IC2254.2
   001019         102800 CONFIGURATION SECTION.                                           IC2254.2
   001020         102900 SOURCE-COMPUTER.                                                 IC2254.2
   001021         103000     XXXXX082.                                                    IC2254.2
   001022         103100 OBJECT-COMPUTER.                                                 IC2254.2
   001023         103200     XXXXX083.                                                    IC2254.2
   001024         103300*INPUT-OUTPUT SECTION.                                            IC2254.2
   001025         103400 DATA DIVISION.                                                   IC2254.2
   001026         103500 FILE SECTION.                                                    IC2254.2
   001027         103600 WORKING-STORAGE SECTION.                                         IC2254.2
   001028         103700 77  WS1 PICTURE S999.                                            IC2254.2
   001029         103800 77  WS2 PICTURE S999                                             IC2254.2
   001030         103900         USAGE COMPUTATIONAL, VALUE ZERO.                         IC2254.2 IMP
   001031         104000 LINKAGE SECTION.                                                 IC2254.2
   001032         104100 77  DN1 PICTURE S99.                                             IC2254.2
   001033         104200 77  DN2 PICTURE S99 USAGE COMPUTATIONAL.                         IC2254.2
   001034         104300 77  DN3 PICTURE S99.                                             IC2254.2
   001035         104400 77  DN4 PICTURE S99 USAGE COMPUTATIONAL.                         IC2254.2
   001036         104500 PROCEDURE DIVISION USING DN1, DN2, DN3, DN4.                     IC2254.2 1032 1033 1034 1035
   001037         104600 SECT-IC225A-1-001 SECTION.                                       IC2254.2
   001038         104700 CALL-TEST-001.                                                   IC2254.2
   001039         104800     MOVE DN1 TO WS1.                                             IC2254.2 1032 1028
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A01  Date 06/04/2022  Time 11:59:31   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001040         104900     ADD 1 TO WS1.                                                IC2254.2 1028
   001041         105000     ADD 1 TO WS2.                                                IC2254.2 1029
   001042         105100     MOVE WS1 TO DN3.                                             IC2254.2 1028 1034
   001043         105200     MOVE WS2 TO DN4.                                             IC2254.2 1029 1035
   001044         105300 CALL-EXIT-001.                                                   IC2254.2
   001045         105400     EXIT PROGRAM.                                                IC2254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A01  Date 06/04/2022  Time 11:59:31   Page    30
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

     1032   DN1. . . . . . . . . . . . . .  1036 1039
     1033   DN2. . . . . . . . . . . . . .  1036
     1034   DN3. . . . . . . . . . . . . .  1036 M1042
     1035   DN4. . . . . . . . . . . . . .  1036 M1043
     1028   WS1. . . . . . . . . . . . . .  M1039 M1040 1042
     1029   WS2. . . . . . . . . . . . . .  M1041 1043
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A01  Date 06/04/2022  Time 11:59:31   Page    31
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

     1044   CALL-EXIT-001
     1038   CALL-TEST-001
     1037   SECT-IC225A-1-001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A01  Date 06/04/2022  Time 11:59:31   Page    32
0 Defined   Cross-reference of programs     References

      931   IC225A01
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC225A01  Date 06/04/2022  Time 11:59:31   Page    33
0LineID  Message code  Message text

    931  IGYDS0020-W   Name "IC225A-1" was processed as "IC225A01".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1                          1
-* Statistics for COBOL program IC225A01:
 *    Source records = 117
 *    Data Division statements = 6
 *    Procedure Division statements = 6
 *    Generated COBOL statements = 0
 *    Program complexity factor = 6
0End of compilation 2,  program IC225A01,  highest severity 4.
0Return code 4
