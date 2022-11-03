1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:33   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:33   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2284.2
   000002         000200 PROGRAM-ID.                                                      IC2284.2
   000003         000300     IC228A.                                                      IC2284.2
   000004         000500*                                                              *  IC2284.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2284.2
   000006         000700*                                                              *  IC2284.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2284.2
   000008         000900*                                                              *  IC2284.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2284.2
   000010         001100*                                                              *  IC2284.2
   000011         001300*                                                              *  IC2284.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2284.2
   000013         001500*                                                              *  IC2284.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2284.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2284.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2284.2
   000017         001900*                                                              *  IC2284.2
   000018         002100*                                                              *  IC2284.2
   000019         002200*    PROGRAM IC228A AND IC228A-1 WILL TEST THE NEW LANGUAGE    *  IC2284.2
   000020         002300*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2284.2
   000021         002400*    MODULE.                                                   *  IC2284.2
   000022         002500*    THE NEW LANGUAGE ELEMENT  TO BE TESTED WILL BE:           *  IC2284.2
   000023         002600*          THE "GLOBAL"       PHRASE IN WORKING-STORAGE.       *  IC2284.2
   000024         002700*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2284.2
   000025         002800*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2284.2
   000026         002900*    IDENTIFICATION DIVISION.                                  *  IC2284.2
   000027         003000*    PROGRAM-ID. IC228A.                                       *  IC2284.2
   000028         003100*              .                                               *  IC2284.2
   000029         003200*              .                                               *  IC2284.2
   000030         003300*              .                                               *  IC2284.2
   000031         003400*    IDENTIFICATION DIVISION.                                  *  IC2284.2
   000032         003500*    PROGRAM-ID. IC228A-1.                                     *  IC2284.2
   000033         003600*              .                                               *  IC2284.2
   000034         003700*              .                                               *  IC2284.2
   000035         003800*              .                                               *  IC2284.2
   000036         003900*    END PROGRAM IC228A-1.                                     *  IC2284.2
   000037         004000*    END PROGRAM IC228A.                                       *  IC2284.2
   000038         004200 ENVIRONMENT DIVISION.                                            IC2284.2
   000039         004300 CONFIGURATION SECTION.                                           IC2284.2
   000040         004400 SOURCE-COMPUTER.                                                 IC2284.2
   000041         004500     XXXXX082.                                                    IC2284.2
   000042         004600 OBJECT-COMPUTER.                                                 IC2284.2
   000043         004700     XXXXX083.                                                    IC2284.2
   000044         004800 INPUT-OUTPUT SECTION.                                            IC2284.2
   000045         004900 FILE-CONTROL.                                                    IC2284.2
   000046         005000     SELECT PRINT-FILE ASSIGN TO                                  IC2284.2 50
   000047         005100     XXXXX055.                                                    IC2284.2
   000048         005200 DATA DIVISION.                                                   IC2284.2
   000049         005300 FILE SECTION.                                                    IC2284.2
   000050         005400 FD  PRINT-FILE.                                                  IC2284.2

 ==000050==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000051         005500 01  PRINT-REC PICTURE X(120).                                    IC2284.2
   000052         005600 01  DUMMY-RECORD PICTURE X(120).                                 IC2284.2
   000053         005700 WORKING-STORAGE SECTION.                                         IC2284.2
   000054         005800 01  GLOBAL-DATA IS GLOBAL.                                       IC2284.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900   03        GLO-DATA-1          PIC X(2).                        IC2284.2
   000056         006000   03        GLO-DATA-2          PIC X(6).                        IC2284.2
   000057         006100           88  CHANGE-MADE-OK  VALUE "CHANGE".                    IC2284.2
   000058         006200   03        GLO-DATA-3          PIC 9(8).                        IC2284.2
   000059         006300   03        GLO-DATA-4          PIC 9(4).                        IC2284.2
   000060         006400 01  SUB                         PIC 9(4)  VALUE ZERO.            IC2284.2 IMP
   000061         006500*                                                                 IC2284.2
   000062         006600 01  TEST-RESULTS.                                                IC2284.2
   000063         006700     02 FILLER                   PIC X      VALUE SPACE.          IC2284.2 IMP
   000064         006800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2284.2 IMP
   000065         006900     02 FILLER                   PIC X      VALUE SPACE.          IC2284.2 IMP
   000066         007000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2284.2 IMP
   000067         007100     02 FILLER                   PIC X      VALUE SPACE.          IC2284.2 IMP
   000068         007200     02  PAR-NAME.                                                IC2284.2
   000069         007300       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2284.2 IMP
   000070         007400       03  PARDOT-X              PIC X      VALUE SPACE.          IC2284.2 IMP
   000071         007500       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2284.2 IMP
   000072         007600     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2284.2 IMP
   000073         007700     02 RE-MARK                  PIC X(61).                       IC2284.2
   000074         007800 01  TEST-COMPUTED.                                               IC2284.2
   000075         007900     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2284.2 IMP
   000076         008000     02 FILLER                   PIC X(17)  VALUE                 IC2284.2
   000077         008100            "       COMPUTED=".                                   IC2284.2
   000078         008200     02 COMPUTED-X.                                               IC2284.2
   000079         008300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2284.2 IMP
   000080         008400     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2284.2 79
   000081         008500                                 PIC -9(9).9(9).                  IC2284.2
   000082         008600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2284.2 79
   000083         008700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2284.2 79
   000084         008800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2284.2 79
   000085         008900     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2284.2 79
   000086         009000         04 COMPUTED-18V0                    PIC -9(18).          IC2284.2
   000087         009100         04 FILLER                           PIC X.               IC2284.2
   000088         009200     03 FILLER PIC X(50) VALUE SPACE.                             IC2284.2 IMP
   000089         009300 01  TEST-CORRECT.                                                IC2284.2
   000090         009400     02 FILLER PIC X(30) VALUE SPACE.                             IC2284.2 IMP
   000091         009500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2284.2
   000092         009600     02 CORRECT-X.                                                IC2284.2
   000093         009700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2284.2 IMP
   000094         009800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2284.2 93
   000095         009900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2284.2 93
   000096         010000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2284.2 93
   000097         010100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2284.2 93
   000098         010200     03      CR-18V0 REDEFINES CORRECT-A.                         IC2284.2 93
   000099         010300         04 CORRECT-18V0                     PIC -9(18).          IC2284.2
   000100         010400         04 FILLER                           PIC X.               IC2284.2
   000101         010500     03 FILLER PIC X(2) VALUE SPACE.                              IC2284.2 IMP
   000102         010600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2284.2 IMP
   000103         010700 01  CCVS-C-1.                                                    IC2284.2
   000104         010800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2284.2
   000105         010900-    "SS  PARAGRAPH-NAME                                          IC2284.2
   000106         011000-    "       REMARKS".                                            IC2284.2
   000107         011100     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2284.2 IMP
   000108         011200 01  CCVS-C-2.                                                    IC2284.2
   000109         011300     02 FILLER                     PIC X        VALUE SPACE.      IC2284.2 IMP
   000110         011400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2284.2
   000111         011500     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2284.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2284.2
   000113         011700     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2284.2 IMP
   000114         011800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2284.2 IMP
   000115         011900 01  REC-CT                        PIC 99       VALUE ZERO.       IC2284.2 IMP
   000116         012000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2284.2 IMP
   000117         012100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2284.2 IMP
   000118         012200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2284.2 IMP
   000119         012300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2284.2 IMP
   000120         012400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2284.2 IMP
   000121         012500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2284.2 IMP
   000122         012600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2284.2 IMP
   000123         012700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2284.2 IMP
   000124         012800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2284.2 IMP
   000125         012900 01  CCVS-H-1.                                                    IC2284.2
   000126         013000     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2284.2 IMP
   000127         013100     02  FILLER                    PIC X(42)    VALUE             IC2284.2
   000128         013200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2284.2
   000129         013300     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2284.2 IMP
   000130         013400 01  CCVS-H-2A.                                                   IC2284.2
   000131         013500   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2284.2 IMP
   000132         013600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2284.2
   000133         013700   02  FILLER                        PIC XXXX   VALUE             IC2284.2
   000134         013800     "4.2 ".                                                      IC2284.2
   000135         013900   02  FILLER                        PIC X(28)  VALUE             IC2284.2
   000136         014000            " COPY - NOT FOR DISTRIBUTION".                       IC2284.2
   000137         014100   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2284.2 IMP
   000138         014200                                                                  IC2284.2
   000139         014300 01  CCVS-H-2B.                                                   IC2284.2
   000140         014400   02  FILLER                        PIC X(15)  VALUE             IC2284.2
   000141         014500            "TEST RESULT OF ".                                    IC2284.2
   000142         014600   02  TEST-ID                       PIC X(9).                    IC2284.2
   000143         014700   02  FILLER                        PIC X(4)   VALUE             IC2284.2
   000144         014800            " IN ".                                               IC2284.2
   000145         014900   02  FILLER                        PIC X(12)  VALUE             IC2284.2
   000146         015000     " HIGH       ".                                              IC2284.2
   000147         015100   02  FILLER                        PIC X(22)  VALUE             IC2284.2
   000148         015200            " LEVEL VALIDATION FOR ".                             IC2284.2
   000149         015300   02  FILLER                        PIC X(58)  VALUE             IC2284.2
   000150         015400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2284.2
   000151         015500 01  CCVS-H-3.                                                    IC2284.2
   000152         015600     02  FILLER                      PIC X(34)  VALUE             IC2284.2
   000153         015700            " FOR OFFICIAL USE ONLY    ".                         IC2284.2
   000154         015800     02  FILLER                      PIC X(58)  VALUE             IC2284.2
   000155         015900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2284.2
   000156         016000     02  FILLER                      PIC X(28)  VALUE             IC2284.2
   000157         016100            "  COPYRIGHT   1985 ".                                IC2284.2
   000158         016200 01  CCVS-E-1.                                                    IC2284.2
   000159         016300     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2284.2 IMP
   000160         016400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2284.2
   000161         016500     02 ID-AGAIN                     PIC X(9).                    IC2284.2
   000162         016600     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2284.2 IMP
   000163         016700 01  CCVS-E-2.                                                    IC2284.2
   000164         016800     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2284.2 IMP
   000165         016900     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2284.2 IMP
   000166         017000     02 CCVS-E-2-2.                                               IC2284.2
   000167         017100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2284.2 IMP
   000168         017200         03 FILLER                   PIC X      VALUE SPACE.      IC2284.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300         03 ENDER-DESC               PIC X(44)  VALUE             IC2284.2
   000170         017400            "ERRORS ENCOUNTERED".                                 IC2284.2
   000171         017500 01  CCVS-E-3.                                                    IC2284.2
   000172         017600     02  FILLER                      PIC X(22)  VALUE             IC2284.2
   000173         017700            " FOR OFFICIAL USE ONLY".                             IC2284.2
   000174         017800     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2284.2 IMP
   000175         017900     02  FILLER                      PIC X(58)  VALUE             IC2284.2
   000176         018000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2284.2
   000177         018100     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2284.2 IMP
   000178         018200     02 FILLER                       PIC X(15)  VALUE             IC2284.2
   000179         018300             " COPYRIGHT 1985".                                   IC2284.2
   000180         018400 01  CCVS-E-4.                                                    IC2284.2
   000181         018500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2284.2 IMP
   000182         018600     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2284.2
   000183         018700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2284.2 IMP
   000184         018800     02 FILLER                       PIC X(40)  VALUE             IC2284.2
   000185         018900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2284.2
   000186         019000 01  XXINFO.                                                      IC2284.2
   000187         019100     02 FILLER                       PIC X(19)  VALUE             IC2284.2
   000188         019200            "*** INFORMATION ***".                                IC2284.2
   000189         019300     02 INFO-TEXT.                                                IC2284.2
   000190         019400       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2284.2 IMP
   000191         019500       04 XXCOMPUTED                 PIC X(20).                   IC2284.2
   000192         019600       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2284.2 IMP
   000193         019700       04 XXCORRECT                  PIC X(20).                   IC2284.2
   000194         019800     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2284.2
   000195         019900 01  HYPHEN-LINE.                                                 IC2284.2
   000196         020000     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2284.2 IMP
   000197         020100     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2284.2
   000198         020200-    "*****************************************".                 IC2284.2
   000199         020300     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2284.2
   000200         020400-    "******************************".                            IC2284.2
   000201         020500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2284.2
   000202         020600     "IC228A".                                                    IC2284.2
   000203         020700 PROCEDURE DIVISION.                                              IC2284.2
   000204         020800 CCVS1 SECTION.                                                   IC2284.2
   000205         020900 OPEN-FILES.                                                      IC2284.2
   000206         021000     OPEN     OUTPUT PRINT-FILE.                                  IC2284.2 50
   000207         021100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2284.2 201 142 201 161
   000208         021200     MOVE    SPACE TO TEST-RESULTS.                               IC2284.2 IMP 62
   000209         021300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2284.2 234 239
   000210         021400     GO TO CCVS1-EXIT.                                            IC2284.2 316
   000211         021500 CLOSE-FILES.                                                     IC2284.2
   000212         021600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2284.2 243 264 50
   000213         021700 TERMINATE-CCVS.                                                  IC2284.2
   000214         021800     EXIT PROGRAM.                                                IC2284.2
   000215         021900 TERMINATE-CALL.                                                  IC2284.2
   000216         022000     STOP     RUN.                                                IC2284.2
   000217         022100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2284.2 66 118
   000218         022200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2284.2 66 119
   000219         022300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2284.2 66 117
   000220         022400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2284.2 66 116
   000221         022500     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2284.2 73
   000222         022600 PRINT-DETAIL.                                                    IC2284.2
   000223         022700     IF REC-CT NOT EQUAL TO ZERO                                  IC2284.2 115 IMP
   000224      1  022800             MOVE "." TO PARDOT-X                                 IC2284.2 70
   000225      1  022900             MOVE REC-CT TO DOTVALUE.                             IC2284.2 115 71
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2284.2 62 51 276
   000227         023100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2284.2 66 276
   000228      1  023200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2284.2 293 306
   000229      1  023300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2284.2 307 315
   000230         023400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2284.2 IMP 66 IMP 78
   000231         023500     MOVE SPACE TO CORRECT-X.                                     IC2284.2 IMP 92
   000232         023600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2284.2 115 IMP IMP 68
   000233         023700     MOVE     SPACE TO RE-MARK.                                   IC2284.2 IMP 73
   000234         023800 HEAD-ROUTINE.                                                    IC2284.2
   000235         023900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2284.2 125 52 276
   000236         024000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2284.2 130 52 276
   000237         024100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2284.2 139 52 276
   000238         024200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2284.2 151 52 276
   000239         024300 COLUMN-NAMES-ROUTINE.                                            IC2284.2
   000240         024400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2284.2 103 52 276
   000241         024500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2284.2 108 52 276
   000242         024600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2284.2 195 52 276
   000243         024700 END-ROUTINE.                                                     IC2284.2
   000244         024800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2284.2 195 52 276
   000245         024900 END-RTN-EXIT.                                                    IC2284.2
   000246         025000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2284.2 158 52 276
   000247         025100 END-ROUTINE-1.                                                   IC2284.2
   000248         025200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2284.2 117 121 118
   000249         025300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2284.2 121 116 121
   000250         025400      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2284.2 119 121
   000251         025500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2284.2
   000252         025600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2284.2 119 181
   000253         025700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2284.2 121 183
   000254         025800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2284.2 180 166
   000255         025900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2284.2 163 52 276
   000256         026000  END-ROUTINE-12.                                                 IC2284.2
   000257         026100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2284.2 169
   000258         026200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2284.2 117 IMP
   000259      1  026300         MOVE "NO " TO ERROR-TOTAL                                IC2284.2 167
   000260         026400         ELSE                                                     IC2284.2
   000261      1  026500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2284.2 117 167
   000262         026600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2284.2 163 52
   000263         026700     PERFORM WRITE-LINE.                                          IC2284.2 276
   000264         026800 END-ROUTINE-13.                                                  IC2284.2
   000265         026900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2284.2 116 IMP
   000266      1  027000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2284.2 167
   000267      1  027100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2284.2 116 167
   000268         027200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2284.2 169
   000269         027300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2284.2 163 52 276
   000270         027400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2284.2 118 IMP
   000271      1  027500          MOVE "NO " TO ERROR-TOTAL                               IC2284.2 167
   000272      1  027600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2284.2 118 167
   000273         027700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2284.2 169
   000274         027800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2284.2 163 52 276
   000275         027900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2284.2 171 52 276
   000276         028000 WRITE-LINE.                                                      IC2284.2
   000277         028100     ADD 1 TO RECORD-COUNT.                                       IC2284.2 123
   000278         028200     IF RECORD-COUNT GREATER 50                                   IC2284.2 123
   000279      1  028300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2284.2 52 122
   000280      1  028400         MOVE SPACE TO DUMMY-RECORD                               IC2284.2 IMP 52
   000281      1  028500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2284.2 52
   000282      1  028600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2284.2 103 52 288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2284.2 108 52 288
   000284      1  028800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2284.2 195 52 288
   000285      1  028900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2284.2 122 52
   000286      1  029000         MOVE ZERO TO RECORD-COUNT.                               IC2284.2 IMP 123
   000287         029100     PERFORM WRT-LN.                                              IC2284.2 288
   000288         029200 WRT-LN.                                                          IC2284.2
   000289         029300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2284.2 52
   000290         029400     MOVE SPACE TO DUMMY-RECORD.                                  IC2284.2 IMP 52
   000291         029500 BLANK-LINE-PRINT.                                                IC2284.2
   000292         029600     PERFORM WRT-LN.                                              IC2284.2 288
   000293         029700 FAIL-ROUTINE.                                                    IC2284.2
   000294         029800     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2284.2 78 IMP 301
   000295         029900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2284.2 92 IMP 301
   000296         030000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2284.2 124 194
   000297         030100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2284.2 189
   000298         030200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2284.2 186 52 276
   000299         030300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2284.2 IMP 194
   000300         030400     GO TO  FAIL-ROUTINE-EX.                                      IC2284.2 306
   000301         030500 FAIL-ROUTINE-WRITE.                                              IC2284.2
   000302         030600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2284.2 74 51 276
   000303         030700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2284.2 124 102
   000304         030800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2284.2 89 51 276
   000305         030900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2284.2 IMP 102
   000306         031000 FAIL-ROUTINE-EX. EXIT.                                           IC2284.2
   000307         031100 BAIL-OUT.                                                        IC2284.2
   000308         031200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2284.2 79 IMP 310
   000309         031300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2284.2 93 IMP 315
   000310         031400 BAIL-OUT-WRITE.                                                  IC2284.2
   000311         031500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2284.2 93 193 79 191
   000312         031600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2284.2 124 194
   000313         031700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2284.2 186 52 276
   000314         031800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2284.2 IMP 194
   000315         031900 BAIL-OUT-EX. EXIT.                                               IC2284.2
   000316         032000 CCVS1-EXIT.                                                      IC2284.2
   000317         032100     EXIT.                                                        IC2284.2
   000318         032200 SECT-IC228A-001 SECTION.                                         IC2284.2
   000319         032300 GLO-INIT-01.                                                     IC2284.2
   000320         032400     MOVE   "X-20 4.3.2" TO ANSI-REFERENCE.                       IC2284.2 124
   000321         032500     MOVE   "GLOBAL CLAUSE" TO FEATURE.                           IC2284.2 64
   000322         032600     MOVE   "AA"      TO GLO-DATA-1.                              IC2284.2 55
   000323         032700     MOVE   "FIRST]"  TO GLO-DATA-2.                              IC2284.2 56
   000324         032800     MOVE    12345678 TO GLO-DATA-3.                              IC2284.2 58
   000325         032900     MOVE    1        TO GLO-DATA-4.                              IC2284.2 59
   000326         033000 GLO-TEST-01-01-0.                                                IC2284.2
   000327         033100     CALL   "IC228A-1"                                            IC2284.2 387
   000328         033200     END-CALL.                                                    IC2284.2
   000329         033300     GO TO   GLO-TEST-01-01-1.                                    IC2284.2 334
   000330         033400 GLO-DELETE-01-01.                                                IC2284.2
   000331         033500     PERFORM DE-LETE.                                             IC2284.2 220
   000332         033600     PERFORM PRINT-DETAIL.                                        IC2284.2 222
   000333         033700     GO TO   CCVS-EXIT.                                           IC2284.2 382
   000334         033800 GLO-TEST-01-01-1.                                                IC2284.2
   000335         033900     MOVE   "GLO-TEST-01-01-1" TO PAR-NAME.                       IC2284.2 68
   000336         034000     IF      GLO-DATA-1 = "ZZ"                                    IC2284.2 55
   000337      1  034100             PERFORM PASS                                         IC2284.2 218
   000338      1  034200             PERFORM PRINT-DETAIL                                 IC2284.2 222
   000339         034300     ELSE                                                         IC2284.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340      1  034400             MOVE    GLO-DATA-1  TO COMPUTED-X                    IC2284.2 55 78
   000341      1  034500             MOVE   "ZZ" TO CORRECT-X                             IC2284.2 92
   000342      1  034600             MOVE   "INCORRECT VALUE RETURNED" TO RE-MARK         IC2284.2 73
   000343      1  034700             PERFORM FAIL                                         IC2284.2 219
   000344      1  034800             PERFORM PRINT-DETAIL.                                IC2284.2 222
   000345         034900     ADD     1 TO REC-CT.                                         IC2284.2 115
   000346         035000 CALL-TEST-01-01-2.                                               IC2284.2
   000347         035100     MOVE   "CALL-TEST-01-01-2" TO PAR-NAME.                      IC2284.2 68
   000348         035200     IF      CHANGE-MADE-OK                                       IC2284.2 57
   000349      1  035300             PERFORM PASS                                         IC2284.2 218
   000350      1  035400             PERFORM PRINT-DETAIL                                 IC2284.2 222
   000351         035500     ELSE                                                         IC2284.2
   000352      1  035600             MOVE    GLO-DATA-2  TO COMPUTED-X                    IC2284.2 56 78
   000353      1  035700             MOVE   "CHANGE" TO CORRECT-X                         IC2284.2 92
   000354      1  035800             MOVE   "INCORRECT VALUE RETURNED" TO RE-MARK         IC2284.2 73
   000355      1  035900             PERFORM FAIL                                         IC2284.2 219
   000356      1  036000             PERFORM PRINT-DETAIL.                                IC2284.2 222
   000357         036100     ADD     1 TO REC-CT.                                         IC2284.2 115
   000358         036200 CALL-TEST-01-01-3.                                               IC2284.2
   000359         036300     MOVE   "CALL-TEST-01-01-3" TO PAR-NAME.                      IC2284.2 68
   000360         036400     IF      GLO-DATA-3 = 87654321                                IC2284.2 58
   000361      1  036500             PERFORM PASS                                         IC2284.2 218
   000362      1  036600             PERFORM PRINT-DETAIL                                 IC2284.2 222
   000363         036700     ELSE                                                         IC2284.2
   000364      1  036800             MOVE    GLO-DATA-3  TO COMPUTED-N                    IC2284.2 58 80
   000365      1  036900             MOVE    87654321 TO CORRECT-N                        IC2284.2 94
   000366      1  037000             MOVE   "INCORRECT VALUE RETURNED" TO RE-MARK         IC2284.2 73
   000367      1  037100             PERFORM FAIL                                         IC2284.2 219
   000368      1  037200             PERFORM PRINT-DETAIL.                                IC2284.2 222
   000369         037300     ADD     1 TO REC-CT.                                         IC2284.2 115
   000370         037400 CALL-TEST-01-01-4.                                               IC2284.2
   000371         037500     MOVE   "CALL-TEST-01-01-4" TO PAR-NAME.                      IC2284.2 68
   000372         037600     IF      GLO-DATA-4 = 11                                      IC2284.2 59
   000373      1  037700             PERFORM PASS                                         IC2284.2 218
   000374      1  037800             PERFORM PRINT-DETAIL                                 IC2284.2 222
   000375         037900     ELSE                                                         IC2284.2
   000376      1  038000             MOVE    GLO-DATA-4  TO COMPUTED-N                    IC2284.2 59 80
   000377      1  038100             MOVE    11   TO CORRECT-N                            IC2284.2 94
   000378      1  038200             MOVE   "INCORRECT VALUE RETURNED" TO RE-MARK         IC2284.2 73
   000379      1  038300             PERFORM FAIL                                         IC2284.2 219
   000380      1  038400             PERFORM PRINT-DETAIL.                                IC2284.2 222
   000381         038500*                                                                 IC2284.2
   000382         038600 CCVS-EXIT SECTION.                                               IC2284.2
   000383         038700 CCVS-999999.                                                     IC2284.2
   000384         038800     GO TO CLOSE-FILES.                                           IC2284.2 211
   000385   1     038900 IDENTIFICATION DIVISION.                                         IC2284.2
   000386   1     039000 PROGRAM-ID.                                                      IC2284.2
   000387   1     039100     IC228A-1.                                                    IC2284.2
   000388   1     039300*                                                              *  IC2284.2
   000389   1     039400*    VALIDATION FOR:-                                          *  IC2284.2
   000390   1     039500*                                                              *  IC2284.2
   000391   1     039600*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2284.2
   000392   1     039700*                                                              *  IC2284.2
   000393   1     039800*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2284.2
   000394   1     039900*                                                              *  IC2284.2
   000395   1     040100*                                                              *  IC2284.2
   000396   1     040200*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2284.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397   1     040300*                                                              *  IC2284.2
   000398   1     040400*        X-55  - SYSTEM PRINTER NAME.                          *  IC2284.2
   000399   1     040500*        X-82  - SOURCE COMPUTER NAME.                         *  IC2284.2
   000400   1     040600*        X-83  - OBJECT COMPUTER NAME.                         *  IC2284.2
   000401   1     040700*                                                              *  IC2284.2
   000402   1     040900*                                                              *  IC2284.2
   000403   1     041000*    PROGRAM IC228A AND IC228A-1 WILL TEST THE NEW LANGUAGE    *  IC2284.2
   000404   1     041100*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2284.2
   000405   1     041200*    MODULE.                                                   *  IC2284.2
   000406   1     041300*    THE NEW LANGUAGE ELEMENTS TO BE TESTED WILL BE:           *  IC2284.2
   000407   1     041400*           THE "GLOBAL" CLAUSE IN WORKING-STORAGE.          *    IC2284.2
   000408   1     041500*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2284.2
   000409   1     041600*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2284.2
   000410   1     041700*    IDENTIFICATION DIVISION.                                  *  IC2284.2
   000411   1     041800*    PROGRAM-ID. IC228A.                                       *  IC2284.2
   000412   1     041900*              .                                               *  IC2284.2
   000413   1     042000*              .                                               *  IC2284.2
   000414   1     042100*              .                                               *  IC2284.2
   000415   1     042200*    IDENTIFICATION DIVISION.                                  *  IC2284.2
   000416   1     042300*    PROGRAM-ID. IC228A-1.                                     *  IC2284.2
   000417   1     042400*              .                                               *  IC2284.2
   000418   1     042500*              .                                               *  IC2284.2
   000419   1     042600*              .                                               *  IC2284.2
   000420   1     042700*    END PROGRAM IC228A-1.                                     *  IC2284.2
   000421   1     042800*    END PROGRAM IC228A.                                       *  IC2284.2
   000422   1     043000 ENVIRONMENT DIVISION.                                            IC2284.2
   000423   1     043100*INPUT-OUTPUT SECTION.                                            IC2284.2
   000424   1     043200 DATA DIVISION.                                                   IC2284.2
   000425   1     043300*FILE SECTION.                                                    IC2284.2
   000426   1     043400 WORKING-STORAGE SECTION.                                         IC2284.2
   000427   1     043500 PROCEDURE DIVISION.                                              IC2284.2
   000428   1     043600 SECT-IC228A-1-001 SECTION.                                       IC2284.2
   000429   1     043700 GLO-TEST-001.                                                    IC2284.2
   000430   1     043800     MOVE   "ZZ"      TO GLO-DATA-1.                              IC2284.2 55
   000431   1     043900     MOVE   "CHANGE"  TO GLO-DATA-2.                              IC2284.2 56
   000432   1     044000     MOVE    87654321 TO GLO-DATA-3.                              IC2284.2 58
   000433   1     044100     ADD     10       TO GLO-DATA-4.                              IC2284.2 59
   000434   1     044200 GLO-EXIT-001.                                                    IC2284.2
   000435   1     044300     EXIT PROGRAM.                                                IC2284.2
   000436   1     044400 END PROGRAM IC228A-1.                                            IC2284.2 387
   000437         044500 END PROGRAM IC228A.                                              IC2284.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page    11
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      124   ANSI-REFERENCE . . . . . . . .  296 303 312 M320
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
       57   CHANGE-MADE-OK . . . . . . . .  348
       85   CM-18V0
       79   COMPUTED-A . . . . . . . . . .  80 82 83 84 85 308 311
       80   COMPUTED-N . . . . . . . . . .  M364 M376
       78   COMPUTED-X . . . . . . . . . .  M230 294 M340 M352
       82   COMPUTED-0V18
       84   COMPUTED-14V4
       86   COMPUTED-18V0
       83   COMPUTED-4V14
      102   COR-ANSI-REFERENCE . . . . . .  M303 M305
       93   CORRECT-A. . . . . . . . . . .  94 95 96 97 98 309 311
       94   CORRECT-N. . . . . . . . . . .  M365 M377
       92   CORRECT-X. . . . . . . . . . .  M231 295 M341 M353
       95   CORRECT-0V18
       97   CORRECT-14V4
       99   CORRECT-18V0
       96   CORRECT-4V14
       98   CR-18V0
      116   DELETE-COUNTER . . . . . . . .  M220 249 265 267
       71   DOTVALUE . . . . . . . . . . .  M225
      122   DUMMY-HOLD . . . . . . . . . .  M279 285
       52   DUMMY-RECORD . . . . . . . . .  M235 M236 M237 M238 M240 M241 M242 M244 M246 M255 M262 M269 M274 M275 279 M280
                                            281 M282 M283 M284 M285 289 M290 M298 M313
      169   ENDER-DESC . . . . . . . . . .  M257 M268 M273
      117   ERROR-COUNTER. . . . . . . . .  M219 248 258 261
      121   ERROR-HOLD . . . . . . . . . .  M248 M249 M249 M250 253
      167   ERROR-TOTAL. . . . . . . . . .  M259 M261 M266 M267 M271 M272
       64   FEATURE. . . . . . . . . . . .  M321
       55   GLO-DATA-1 . . . . . . . . . .  M322 336 340 M430
       56   GLO-DATA-2 . . . . . . . . . .  M323 352 M431
       58   GLO-DATA-3 . . . . . . . . . .  M324 360 364 M432
       59   GLO-DATA-4 . . . . . . . . . .  M325 372 376 M433
       54   GLOBAL-DATA
      195   HYPHEN-LINE. . . . . . . . . .  242 244 284
      161   ID-AGAIN . . . . . . . . . . .  M207
      194   INF-ANSI-REFERENCE . . . . . .  M296 M299 M312 M314
      189   INFO-TEXT. . . . . . . . . . .  M297
      118   INSPECT-COUNTER. . . . . . . .  M217 248 270 272
       66   P-OR-F . . . . . . . . . . . .  M217 M218 M219 M220 227 M230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page    12
0 Defined   Cross-reference of data names   References

0      68   PAR-NAME . . . . . . . . . . .  M232 M335 M347 M359 M371
       70   PARDOT-X . . . . . . . . . . .  M224
      119   PASS-COUNTER . . . . . . . . .  M218 250 252
       50   PRINT-FILE . . . . . . . . . .  46 206 212
       51   PRINT-REC. . . . . . . . . . .  M226 M302 M304
       73   RE-MARK. . . . . . . . . . . .  M221 M233 M342 M354 M366 M378
      115   REC-CT . . . . . . . . . . . .  223 225 232 M345 M357 M369
      114   REC-SKL-SUB
      123   RECORD-COUNT . . . . . . . . .  M277 278 M286
       60   SUB
       74   TEST-COMPUTED. . . . . . . . .  302
       89   TEST-CORRECT . . . . . . . . .  304
      142   TEST-ID. . . . . . . . . . . .  M207
       62   TEST-RESULTS . . . . . . . . .  M208 226
      120   TOTAL-ERROR
      191   XXCOMPUTED . . . . . . . . . .  M311
      193   XXCORRECT. . . . . . . . . . .  M311
      186   XXINFO . . . . . . . . . . . .  298 313
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page    13
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
      346   CALL-TEST-01-01-2
      358   CALL-TEST-01-01-3
      370   CALL-TEST-01-01-4
      382   CCVS-EXIT. . . . . . . . . . .  G333
      383   CCVS-999999
      204   CCVS1
      316   CCVS1-EXIT . . . . . . . . . .  G210
      211   CLOSE-FILES. . . . . . . . . .  G384
      239   COLUMN-NAMES-ROUTINE . . . . .  E209
      220   DE-LETE. . . . . . . . . . . .  P331
      243   END-ROUTINE. . . . . . . . . .  P212
      247   END-ROUTINE-1
      256   END-ROUTINE-12
      264   END-ROUTINE-13 . . . . . . . .  E212
      245   END-RTN-EXIT
      219   FAIL . . . . . . . . . . . . .  P343 P355 P367 P379
      293   FAIL-ROUTINE . . . . . . . . .  P228
      306   FAIL-ROUTINE-EX. . . . . . . .  E228 G300
      301   FAIL-ROUTINE-WRITE . . . . . .  G294 G295
      330   GLO-DELETE-01-01
      434   GLO-EXIT-001
      319   GLO-INIT-01
      429   GLO-TEST-001
      326   GLO-TEST-01-01-0
      334   GLO-TEST-01-01-1 . . . . . . .  G329
      234   HEAD-ROUTINE . . . . . . . . .  P209
      217   INSPT
      205   OPEN-FILES
      218   PASS . . . . . . . . . . . . .  P337 P349 P361 P373
      222   PRINT-DETAIL . . . . . . . . .  P332 P338 P344 P350 P356 P362 P368 P374 P380
      318   SECT-IC228A-001
      428   SECT-IC228A-1-001
      215   TERMINATE-CALL
      213   TERMINATE-CCVS
      276   WRITE-LINE . . . . . . . . . .  P226 P227 P235 P236 P237 P238 P240 P241 P242 P244 P246 P255 P263 P269 P274 P275
                                            P298 P302 P304 P313
      288   WRT-LN . . . . . . . . . . . .  P282 P283 P284 P287 P292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page    14
0 Defined   Cross-reference of programs     References

        3   IC228A . . . . . . . . . . . .  437
      387   IC228A-1 . . . . . . . . . . .  436 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC228A    Date 06/04/2022  Time 11:56:33   Page    15
0LineID  Message code  Message text

     50  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC228A:
 *    Source records = 437
 *    Data Division statements = 70
 *    Procedure Division statements = 183
 *    Generated COBOL statements = 0
 *    Program complexity factor = 190
0End of compilation 1,  program IC228A,  highest severity 0.
0Return code 0
