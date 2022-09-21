1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:29   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:29   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2334.2
   000002         000200 PROGRAM-ID.                                                      IC2334.2
   000003         000300     IC233A.                                                      IC2334.2
   000004         000500*                                                              *  IC2334.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2334.2
   000006         000700*                                                              *  IC2334.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2334.2
   000008         000900*                                                              *  IC2334.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2334.2
   000010         001100*                                                              *  IC2334.2
   000011         001300*                                                              *  IC2334.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2334.2
   000013         001500*                                                              *  IC2334.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2334.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2334.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2334.2
   000017         001900*        X-18  - OPTIONAL SEQUENTIAL MASS STORAGE FILE.        *  IC2334.2
   000018         002100*                                                              *  IC2334.2
   000019         002200*    PROGRAMS IC233A AND IC233A-1 TEST THAT A "USE" PROCEDURE  *  IC2334.2
   000020         002300*    IN A CALLING PROGRAM IS INVOKED BY A QUALIFYING CONDITION *  IC2334.2
   000021         002400*    OCCURRING IN A CONTAINED PROGRAM.                         *  IC2334.2
   000022         002500*                                                              *  IC2334.2
   000023         002600*    BOTH PROGRAMS WILL BE COMPILED IN ONE INVOCATION OF THE   *  IC2334.2
   000024         002700*    COMPILER AS SHOWN BELOW:                                  *  IC2334.2
   000025         002800*    IDENTIFICATION DIVISION.                                  *  IC2334.2
   000026         002900*    PROGRAM-ID. IC233A.                                       *  IC2334.2
   000027         003000*              .                                               *  IC2334.2
   000028         003100*              .                                               *  IC2334.2
   000029         003200*              .                                               *  IC2334.2
   000030         003300*    IDENTIFICATION DIVISION.                                  *  IC2334.2
   000031         003400*    PROGRAM-ID. IC233A-1.                                     *  IC2334.2
   000032         003500*              .                                               *  IC2334.2
   000033         003600*              .                                               *  IC2334.2
   000034         003700*    END PROGRAM IC233A-1.                                     *  IC2334.2
   000035         003800*    END PROGRAM IC233A.                                       *  IC2334.2
   000036         004000 ENVIRONMENT DIVISION.                                            IC2334.2
   000037         004100 CONFIGURATION SECTION.                                           IC2334.2
   000038         004200 SOURCE-COMPUTER.                                                 IC2334.2
   000039         004300     XXXXX082.                                                    IC2334.2
   000040         004400 OBJECT-COMPUTER.                                                 IC2334.2
   000041         004500     XXXXX083.                                                    IC2334.2
   000042         004600 INPUT-OUTPUT SECTION.                                            IC2334.2
   000043         004700 FILE-CONTROL.                                                    IC2334.2
   000044         004800     SELECT PRINT-FILE ASSIGN TO                                  IC2334.2 50
   000045         004900     XXXXX055.                                                    IC2334.2
   000046         005000     SELECT OPTIONAL TEST-FILE ASSIGN TO                          IC2334.2 53
   000047         005100     XXXXX018.                                                    IC2334.2
   000048         005200 DATA DIVISION.                                                   IC2334.2
   000049         005300 FILE SECTION.                                                    IC2334.2
   000050         005400 FD  PRINT-FILE.                                                  IC2334.2

 ==000050==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000051         005500 01  PRINT-REC PICTURE X(120).                                    IC2334.2
   000052         005600 01  DUMMY-RECORD PICTURE X(120).                                 IC2334.2
   000053         005700 FD  TEST-FILE GLOBAL.                                            IC2334.2

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0==000053==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "TEST-FILE".

   000054         005800 01  TEST-REC PIC X(20).                                          IC2334.2
   000055         005900 WORKING-STORAGE SECTION.                                         IC2334.2
   000056         006000 01  DILFRAP                     PIC 9.                           IC2334.2
   000057         006100 01  TEST-RESULTS.                                                IC2334.2
   000058         006200     02 FILLER                   PIC X      VALUE SPACE.          IC2334.2 IMP
   000059         006300     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2334.2 IMP
   000060         006400     02 FILLER                   PIC X      VALUE SPACE.          IC2334.2 IMP
   000061         006500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2334.2 IMP
   000062         006600     02 FILLER                   PIC X      VALUE SPACE.          IC2334.2 IMP
   000063         006700     02  PAR-NAME.                                                IC2334.2
   000064         006800       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2334.2 IMP
   000065         006900       03  PARDOT-X              PIC X      VALUE SPACE.          IC2334.2 IMP
   000066         007000       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2334.2 IMP
   000067         007100     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2334.2 IMP
   000068         007200     02 RE-MARK                  PIC X(61).                       IC2334.2
   000069         007300 01  TEST-COMPUTED.                                               IC2334.2
   000070         007400     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2334.2 IMP
   000071         007500     02 FILLER                   PIC X(17)  VALUE                 IC2334.2
   000072         007600            "       COMPUTED=".                                   IC2334.2
   000073         007700     02 COMPUTED-X.                                               IC2334.2
   000074         007800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2334.2 IMP
   000075         007900     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2334.2 74
   000076         008000                                 PIC -9(9).9(9).                  IC2334.2
   000077         008100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2334.2 74
   000078         008200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2334.2 74
   000079         008300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2334.2 74
   000080         008400     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2334.2 74
   000081         008500         04 COMPUTED-18V0                    PIC -9(18).          IC2334.2
   000082         008600         04 FILLER                           PIC X.               IC2334.2
   000083         008700     03 FILLER PIC X(50) VALUE SPACE.                             IC2334.2 IMP
   000084         008800 01  TEST-CORRECT.                                                IC2334.2
   000085         008900     02 FILLER PIC X(30) VALUE SPACE.                             IC2334.2 IMP
   000086         009000     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2334.2
   000087         009100     02 CORRECT-X.                                                IC2334.2
   000088         009200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2334.2 IMP
   000089         009300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2334.2 88
   000090         009400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2334.2 88
   000091         009500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2334.2 88
   000092         009600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2334.2 88
   000093         009700     03      CR-18V0 REDEFINES CORRECT-A.                         IC2334.2 88
   000094         009800         04 CORRECT-18V0                     PIC -9(18).          IC2334.2
   000095         009900         04 FILLER                           PIC X.               IC2334.2
   000096         010000     03 FILLER PIC X(2) VALUE SPACE.                              IC2334.2 IMP
   000097         010100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2334.2 IMP
   000098         010200 01  CCVS-C-1.                                                    IC2334.2
   000099         010300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2334.2
   000100         010400-    "SS  PARAGRAPH-NAME                                          IC2334.2
   000101         010500-    "       REMARKS".                                            IC2334.2
   000102         010600     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2334.2 IMP
   000103         010700 01  CCVS-C-2.                                                    IC2334.2
   000104         010800     02 FILLER                     PIC X        VALUE SPACE.      IC2334.2 IMP
   000105         010900     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2334.2
   000106         011000     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2334.2 IMP
   000107         011100     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2334.2
   000108         011200     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2334.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000109         011300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2334.2 IMP
   000110         011400 01  REC-CT                        PIC 99       VALUE ZERO.       IC2334.2 IMP
   000111         011500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2334.2 IMP
   000112         011600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2334.2 IMP
   000113         011700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2334.2 IMP
   000114         011800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2334.2 IMP
   000115         011900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2334.2 IMP
   000116         012000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2334.2 IMP
   000117         012100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2334.2 IMP
   000118         012200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2334.2 IMP
   000119         012300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2334.2 IMP
   000120         012400 01  CCVS-H-1.                                                    IC2334.2
   000121         012500     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2334.2 IMP
   000122         012600     02  FILLER                    PIC X(42)    VALUE             IC2334.2
   000123         012700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2334.2
   000124         012800     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2334.2 IMP
   000125         012900 01  CCVS-H-2A.                                                   IC2334.2
   000126         013000   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2334.2 IMP
   000127         013100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2334.2
   000128         013200   02  FILLER                        PIC XXXX   VALUE             IC2334.2
   000129         013300     "4.2 ".                                                      IC2334.2
   000130         013400   02  FILLER                        PIC X(28)  VALUE             IC2334.2
   000131         013500            " COPY - NOT FOR DISTRIBUTION".                       IC2334.2
   000132         013600   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2334.2 IMP
   000133         013700                                                                  IC2334.2
   000134         013800 01  CCVS-H-2B.                                                   IC2334.2
   000135         013900   02  FILLER                        PIC X(15)  VALUE             IC2334.2
   000136         014000            "TEST RESULT OF ".                                    IC2334.2
   000137         014100   02  TEST-ID                       PIC X(9).                    IC2334.2
   000138         014200   02  FILLER                        PIC X(4)   VALUE             IC2334.2
   000139         014300            " IN ".                                               IC2334.2
   000140         014400   02  FILLER                        PIC X(12)  VALUE             IC2334.2
   000141         014500     " HIGH       ".                                              IC2334.2
   000142         014600   02  FILLER                        PIC X(22)  VALUE             IC2334.2
   000143         014700            " LEVEL VALIDATION FOR ".                             IC2334.2
   000144         014800   02  FILLER                        PIC X(58)  VALUE             IC2334.2
   000145         014900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2334.2
   000146         015000 01  CCVS-H-3.                                                    IC2334.2
   000147         015100     02  FILLER                      PIC X(34)  VALUE             IC2334.2
   000148         015200            " FOR OFFICIAL USE ONLY    ".                         IC2334.2
   000149         015300     02  FILLER                      PIC X(58)  VALUE             IC2334.2
   000150         015400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2334.2
   000151         015500     02  FILLER                      PIC X(28)  VALUE             IC2334.2
   000152         015600            "  COPYRIGHT   1985 ".                                IC2334.2
   000153         015700 01  CCVS-E-1.                                                    IC2334.2
   000154         015800     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2334.2 IMP
   000155         015900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2334.2
   000156         016000     02 ID-AGAIN                     PIC X(9).                    IC2334.2
   000157         016100     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2334.2 IMP
   000158         016200 01  CCVS-E-2.                                                    IC2334.2
   000159         016300     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2334.2 IMP
   000160         016400     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2334.2 IMP
   000161         016500     02 CCVS-E-2-2.                                               IC2334.2
   000162         016600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2334.2 IMP
   000163         016700         03 FILLER                   PIC X      VALUE SPACE.      IC2334.2 IMP
   000164         016800         03 ENDER-DESC               PIC X(44)  VALUE             IC2334.2
   000165         016900            "ERRORS ENCOUNTERED".                                 IC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000166         017000 01  CCVS-E-3.                                                    IC2334.2
   000167         017100     02  FILLER                      PIC X(22)  VALUE             IC2334.2
   000168         017200            " FOR OFFICIAL USE ONLY".                             IC2334.2
   000169         017300     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2334.2 IMP
   000170         017400     02  FILLER                      PIC X(58)  VALUE             IC2334.2
   000171         017500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2334.2
   000172         017600     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2334.2 IMP
   000173         017700     02 FILLER                       PIC X(15)  VALUE             IC2334.2
   000174         017800             " COPYRIGHT 1985".                                   IC2334.2
   000175         017900 01  CCVS-E-4.                                                    IC2334.2
   000176         018000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2334.2 IMP
   000177         018100     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2334.2
   000178         018200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2334.2 IMP
   000179         018300     02 FILLER                       PIC X(40)  VALUE             IC2334.2
   000180         018400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2334.2
   000181         018500 01  XXINFO.                                                      IC2334.2
   000182         018600     02 FILLER                       PIC X(19)  VALUE             IC2334.2
   000183         018700            "*** INFORMATION ***".                                IC2334.2
   000184         018800     02 INFO-TEXT.                                                IC2334.2
   000185         018900       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2334.2 IMP
   000186         019000       04 XXCOMPUTED                 PIC X(20).                   IC2334.2
   000187         019100       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2334.2 IMP
   000188         019200       04 XXCORRECT                  PIC X(20).                   IC2334.2
   000189         019300     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2334.2
   000190         019400 01  HYPHEN-LINE.                                                 IC2334.2
   000191         019500     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2334.2 IMP
   000192         019600     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2334.2
   000193         019700-    "*****************************************".                 IC2334.2
   000194         019800     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2334.2
   000195         019900-    "******************************".                            IC2334.2
   000196         020000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2334.2
   000197         020100     "IC233A".                                                    IC2334.2
   000198         020200 PROCEDURE DIVISION.                                              IC2334.2
   000199         020300 DECLARATIVES.                                                    IC2334.2
   000200         020400 SECT-IC233A-001 SECTION.                                         IC2334.2
   000201         020500     USE GLOBAL AFTER ERROR PROCEDURE ON INPUT.                   IC2334.2
   000202         020600 USE-TEST-2.                                                      IC2334.2
   000203         020700     PERFORM D1-PASS.                                             IC2334.2 207
   000204         020800     PERFORM D1-PRINT-DETAIL.                                     IC2334.2 208
   000205         020900     MOVE    1 TO DILFRAP.                                        IC2334.2 56
   000206         021000     GO TO EXIT-USE-TEST-2.                                       IC2334.2 259
   000207         021100 D1-PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.        IC2334.2 61 114
   000208         021200 D1-PRINT-DETAIL.                                                 IC2334.2
   000209         021300     IF REC-CT NOT EQUAL TO ZERO                                  IC2334.2 110 IMP
   000210      1  021400             MOVE "." TO PARDOT-X                                 IC2334.2 65
   000211      1  021500             MOVE REC-CT TO DOTVALUE.                             IC2334.2 110 66
   000212         021600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM D1-WRITE-LINE.   IC2334.2 57 51 220
   000213         021700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM D1-WRITE-LINE            IC2334.2 61 220
   000214      1  021800        PERFORM D1-FAIL-ROUTINE THRU D1-FAIL-ROUTINE-EX           IC2334.2 235 248
   000215      1  021900          ELSE PERFORM D1-BAIL-OUT THRU D1-BAIL-OUT-EX.           IC2334.2 249 258
   000216         022000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2334.2 IMP 61 IMP 73
   000217         022100     MOVE SPACE TO CORRECT-X.                                     IC2334.2 IMP 87
   000218         022200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2334.2 110 IMP IMP 63
   000219         022300     MOVE     SPACE TO RE-MARK.                                   IC2334.2 IMP 68
   000220         022400 D1-WRITE-LINE.                                                   IC2334.2
   000221         022500     ADD 1 TO RECORD-COUNT.                                       IC2334.2 118
   000222         022600     IF RECORD-COUNT GREATER 50                                   IC2334.2 118
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000223      1  022700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2334.2 52 117
   000224      1  022800         MOVE SPACE TO DUMMY-RECORD                               IC2334.2 IMP 52
   000225      1  022900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2334.2 52
   000226      1  023000         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM D1-WRT-LN          IC2334.2 98 52 232
   000227      1  023100         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM D1-WRT-LN 2 TIMES  IC2334.2 103 52 232
   000228      1  023200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM D1-WRT-LN       IC2334.2 190 52 232
   000229      1  023300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2334.2 117 52
   000230      1  023400         MOVE ZERO TO RECORD-COUNT.                               IC2334.2 IMP 118
   000231         023500     PERFORM D1-WRT-LN.                                           IC2334.2 232
   000232         023600 D1-WRT-LN.                                                       IC2334.2
   000233         023700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2334.2 52
   000234         023800     MOVE SPACE TO DUMMY-RECORD.                                  IC2334.2 IMP 52
   000235         023900 D1-FAIL-ROUTINE.                                                 IC2334.2
   000236         024000     IF COMPUTED-X NOT EQUAL TO SPACE GO TO D1-FAIL-ROUTINE-WRITE.IC2334.2 73 IMP 243
   000237         024100     IF CORRECT-X NOT EQUAL TO SPACE GO TO D1-FAIL-ROUTINE-WRITE. IC2334.2 87 IMP 243
   000238         024200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2334.2 119 189
   000239         024300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2334.2 184
   000240         024400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM D1-WRITE-LINE 2 TIMES.IC2334.2 181 52 220
   000241         024500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2334.2 IMP 189
   000242         024600     GO TO  D1-FAIL-ROUTINE-EX.                                   IC2334.2 248
   000243         024700 D1-FAIL-ROUTINE-WRITE.                                           IC2334.2
   000244         024800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM D1-WRITE-LINE      IC2334.2 69 51 220
   000245         024900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2334.2 119 97
   000246         025000     MOVE TEST-CORRECT TO PRINT-REC PERFORM D1-WRITE-LINE 2 TIMES.IC2334.2 84 51 220
   000247         025100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2334.2 IMP 97
   000248         025200 D1-FAIL-ROUTINE-EX. EXIT.                                        IC2334.2
   000249         025300 D1-BAIL-OUT.                                                     IC2334.2
   000250         025400     IF  COMPUTED-A NOT EQUAL TO SPACE GO TO D1-BAIL-OUT-WRITE.   IC2334.2 74 IMP 252
   000251         025500     IF  CORRECT-A EQUAL TO SPACE GO TO D1-BAIL-OUT-EX.           IC2334.2 88 IMP 258
   000252         025600 D1-BAIL-OUT-WRITE.                                               IC2334.2
   000253         025700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2334.2 88 188 74 186
   000254         025800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2334.2 119 189
   000255         025900     MOVE   XXINFO TO DUMMY-RECORD.                               IC2334.2 181 52
   000256         026000     PERFORM D1-WRITE-LINE 2 TIMES.                               IC2334.2 220
   000257         026100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2334.2 IMP 189
   000258         026200 D1-BAIL-OUT-EX. EXIT.                                            IC2334.2
   000259         026300 EXIT-USE-TEST-2.                                                 IC2334.2
   000260         026400     EXIT.                                                        IC2334.2
   000261         026500 END DECLARATIVES.                                                IC2334.2
   000262         026600 CCVS1 SECTION.                                                   IC2334.2
   000263         026700 OPEN-FILES.                                                      IC2334.2
   000264         026800     OPEN     OUTPUT PRINT-FILE.                                  IC2334.2 50
   000265         026900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2334.2 196 137 196 156
   000266         027000     MOVE    SPACE TO TEST-RESULTS.                               IC2334.2 IMP 57
   000267         027100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2334.2 292 297
   000268         027200     GO TO CCVS1-EXIT.                                            IC2334.2 374
   000269         027300 CLOSE-FILES.                                                     IC2334.2
   000270         027400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2334.2 301 322 50
   000271         027500 TERMINATE-CCVS.                                                  IC2334.2
   000272         027600     EXIT PROGRAM.                                                IC2334.2
   000273         027700 TERMINATE-CALL.                                                  IC2334.2
   000274         027800     STOP     RUN.                                                IC2334.2
   000275         027900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2334.2 61 113
   000276         028000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2334.2 61 114
   000277         028100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2334.2 61 112
   000278         028200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2334.2 61 111
   000279         028300     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2334.2 68
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000280         028400 PRINT-DETAIL.                                                    IC2334.2
   000281         028500     IF REC-CT NOT EQUAL TO ZERO                                  IC2334.2 110 IMP
   000282      1  028600             MOVE "." TO PARDOT-X                                 IC2334.2 65
   000283      1  028700             MOVE REC-CT TO DOTVALUE.                             IC2334.2 110 66
   000284         028800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2334.2 57 51 334
   000285         028900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2334.2 61 334
   000286      1  029000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2334.2 351 364
   000287      1  029100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2334.2 365 373
   000288         029200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2334.2 IMP 61 IMP 73
   000289         029300     MOVE SPACE TO CORRECT-X.                                     IC2334.2 IMP 87
   000290         029400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2334.2 110 IMP IMP 63
   000291         029500     MOVE     SPACE TO RE-MARK.                                   IC2334.2 IMP 68
   000292         029600 HEAD-ROUTINE.                                                    IC2334.2
   000293         029700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2334.2 120 52 334
   000294         029800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2334.2 125 52 334
   000295         029900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2334.2 134 52 334
   000296         030000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2334.2 146 52 334
   000297         030100 COLUMN-NAMES-ROUTINE.                                            IC2334.2
   000298         030200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2334.2 98 52 334
   000299         030300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2334.2 103 52 334
   000300         030400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2334.2 190 52 334
   000301         030500 END-ROUTINE.                                                     IC2334.2
   000302         030600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2334.2 190 52 334
   000303         030700 END-RTN-EXIT.                                                    IC2334.2
   000304         030800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2334.2 153 52 334
   000305         030900 END-ROUTINE-1.                                                   IC2334.2
   000306         031000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2334.2 112 116 113
   000307         031100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2334.2 116 111 116
   000308         031200      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2334.2 114 116
   000309         031300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2334.2
   000310         031400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2334.2 114 176
   000311         031500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2334.2 116 178
   000312         031600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2334.2 175 161
   000313         031700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2334.2 158 52 334
   000314         031800  END-ROUTINE-12.                                                 IC2334.2
   000315         031900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2334.2 164
   000316         032000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2334.2 112 IMP
   000317      1  032100         MOVE "NO " TO ERROR-TOTAL                                IC2334.2 162
   000318         032200         ELSE                                                     IC2334.2
   000319      1  032300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2334.2 112 162
   000320         032400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2334.2 158 52
   000321         032500     PERFORM WRITE-LINE.                                          IC2334.2 334
   000322         032600 END-ROUTINE-13.                                                  IC2334.2
   000323         032700     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2334.2 111 IMP
   000324      1  032800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2334.2 162
   000325      1  032900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2334.2 111 162
   000326         033000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2334.2 164
   000327         033100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2334.2 158 52 334
   000328         033200      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2334.2 113 IMP
   000329      1  033300          MOVE "NO " TO ERROR-TOTAL                               IC2334.2 162
   000330      1  033400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2334.2 113 162
   000331         033500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2334.2 164
   000332         033600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2334.2 158 52 334
   000333         033700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2334.2 166 52 334
   000334         033800 WRITE-LINE.                                                      IC2334.2
   000335         033900     ADD 1 TO RECORD-COUNT.                                       IC2334.2 118
   000336         034000     IF RECORD-COUNT GREATER 50                                   IC2334.2 118
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000337      1  034100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2334.2 52 117
   000338      1  034200         MOVE SPACE TO DUMMY-RECORD                               IC2334.2 IMP 52
   000339      1  034300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2334.2 52
   000340      1  034400         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2334.2 98 52 346
   000341      1  034500         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2334.2 103 52 346
   000342      1  034600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2334.2 190 52 346
   000343      1  034700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2334.2 117 52
   000344      1  034800         MOVE ZERO TO RECORD-COUNT.                               IC2334.2 IMP 118
   000345         034900     PERFORM WRT-LN.                                              IC2334.2 346
   000346         035000 WRT-LN.                                                          IC2334.2
   000347         035100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2334.2 52
   000348         035200     MOVE SPACE TO DUMMY-RECORD.                                  IC2334.2 IMP 52
   000349         035300 BLANK-LINE-PRINT.                                                IC2334.2
   000350         035400     PERFORM WRT-LN.                                              IC2334.2 346
   000351         035500 FAIL-ROUTINE.                                                    IC2334.2
   000352         035600     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2334.2 73 IMP 359
   000353         035700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2334.2 87 IMP 359
   000354         035800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2334.2 119 189
   000355         035900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2334.2 184
   000356         036000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2334.2 181 52 334
   000357         036100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2334.2 IMP 189
   000358         036200     GO TO  FAIL-ROUTINE-EX.                                      IC2334.2 364
   000359         036300 FAIL-ROUTINE-WRITE.                                              IC2334.2
   000360         036400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2334.2 69 51 334
   000361         036500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2334.2 119 97
   000362         036600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2334.2 84 51 334
   000363         036700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2334.2 IMP 97
   000364         036800 FAIL-ROUTINE-EX. EXIT.                                           IC2334.2
   000365         036900 BAIL-OUT.                                                        IC2334.2
   000366         037000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2334.2 74 IMP 368
   000367         037100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2334.2 88 IMP 373
   000368         037200 BAIL-OUT-WRITE.                                                  IC2334.2
   000369         037300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2334.2 88 188 74 186
   000370         037400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2334.2 119 189
   000371         037500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2334.2 181 52 334
   000372         037600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2334.2 IMP 189
   000373         037700 BAIL-OUT-EX. EXIT.                                               IC2334.2
   000374         037800 CCVS1-EXIT.                                                      IC2334.2
   000375         037900     EXIT.                                                        IC2334.2
   000376         038000 SECT-IC233A-1R-001 SECTION.                                      IC2334.2
   000377         038100 USE-INIT-1.                                                      IC2334.2
   000378         038200     MOVE   "USE-TEST-1" TO PAR-NAME.                             IC2334.2 63
   000379         038300     MOVE   "X-34 5.5.4 GR(1)B" TO ANSI-REFERENCE.                IC2334.2 119
   000380         038400     MOVE    ZERO TO DILFRAP.                                     IC2334.2 IMP 56
   000381         038500 USE-TEST-0.                                                      IC2334.2
   000382         038600     CALL   "IC233A-1".                                           IC2334.2 400
   000383         038700     IF      DILFRAP = 1                                          IC2334.2 56
   000384      1  038800             GO TO   CCVS-EXIT.                                   IC2334.2 394
   000385         038900 USE-FAIL-1.                                                      IC2334.2
   000386         039000     MOVE   "USE PROCEDURE NOT INVOKED" TO RE-MARK.               IC2334.2 68
   000387         039100     PERFORM FAIL.                                                IC2334.2 277
   000388         039200     GO TO   USE-WRITE-1.                                         IC2334.2 391
   000389         039300 USE-DELETE-1.                                                    IC2334.2
   000390         039400     PERFORM DE-LETE.                                             IC2334.2 278
   000391         039500 USE-WRITE-1.                                                     IC2334.2
   000392         039600     PERFORM PRINT-DETAIL.                                        IC2334.2 280
   000393         039700*                                                                 IC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000394         039800 CCVS-EXIT SECTION.                                               IC2334.2
   000395         039900 CCVS-999999.                                                     IC2334.2
   000396         040000     GO TO CLOSE-FILES.                                           IC2334.2 269
   000397         040100*                                                                 IC2334.2
   000398   1     040200 IDENTIFICATION DIVISION.                                         IC2334.2
   000399   1     040300 PROGRAM-ID.                                                      IC2334.2
   000400   1     040400     IC233A-1.                                                    IC2334.2
   000401   1     040600*                                                              *  IC2334.2
   000402   1     040700*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2334.2
   000403   1     040800*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2334.2
   000404   1     040900*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2334.2
   000405   1     041000*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2334.2
   000406   1     041100*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2334.2
   000407   1     041200*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2334.2
   000408   1     041300*                                                              *  IC2334.2
   000409   1     041400*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2334.2
   000410   1     041500*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2334.2
   000411   1     041600*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2334.2
   000412   1     041700*                                                              *  IC2334.2
   000413   1     041800*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2334.2
   000414   1     041900*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2334.2
   000415   1     042000*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2334.2
   000416   1     042100*                                                              *  IC2334.2
   000417   1     042200*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2334.2
   000418   1     042300*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2334.2
   000419   1     042400*                & INFORMATION TECHNOLOGY                      *  IC2334.2
   000420   1     042500*          TWO SKYLINE PLACE                                   *  IC2334.2
   000421   1     042600*          SUITE 1100                                          *  IC2334.2
   000422   1     042700*          5203 LEESBURG PIKE                                  *  IC2334.2
   000423   1     042800*          FALLS CHURCH                                        *  IC2334.2
   000424   1     042900*          VA 22041                                            *  IC2334.2
   000425   1     043000*          U.S.A.                                              *  IC2334.2
   000426   1     043100*                                                              *  IC2334.2
   000427   1     043200*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2334.2
   000428   1     043300*                                                              *  IC2334.2
   000429   1     043400*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2334.2
   000430   1     043500*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2334.2
   000431   1     043600*          21 RUE BARA                                         *  IC2334.2
   000432   1     043700*          F-92132 ISSY                                        *  IC2334.2
   000433   1     043800*          FRANCE                                              *  IC2334.2
   000434   1     043900*                                                              *  IC2334.2
   000435   1     044000*                                                              *  IC2334.2
   000436   1     044100*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2334.2
   000437   1     044200*               UND DATENVERARBEITUNG MBH)                     *  IC2334.2
   000438   1     044300*          SCHLOSS BIRLINGHOVEN                                *  IC2334.2
   000439   1     044400*          POSTFACH 12 40                                      *  IC2334.2
   000440   1     044500*          D-5205 ST. AUGUSTIN 1                               *  IC2334.2
   000441   1     044600*          GERMANY FR                                          *  IC2334.2
   000442   1     044700*                                                              *  IC2334.2
   000443   1     044800*                                                              *  IC2334.2
   000444   1     044900*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2334.2
   000445   1     045000*          OXFORD ROAD                                         *  IC2334.2
   000446   1     045100*          MANCHESTER                                          *  IC2334.2
   000447   1     045200*          M1 7ED                                              *  IC2334.2
   000448   1     045300*          UNITED KINGDOM                                      *  IC2334.2
   000449   1     045400*                                                              *  IC2334.2
   000450   1     045500*                                                              *  IC2334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000451   1     045600*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2334.2
   000452   1     045700*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2334.2
   000453   1     045800*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2334.2
   000454   1     045900*                                                              *  IC2334.2
   000455   1     046100*                                                              *  IC2334.2
   000456   1     046200*    VALIDATION FOR:-                                          *  IC2334.2
   000457   1     046300*                                                              *  IC2334.2
   000458   1     046400*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2334.2
   000459   1     046500*                                                              *  IC2334.2
   000460   1     046600*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2334.2
   000461   1     046700*                                                              *  IC2334.2
   000462   1     046900*                                                              *  IC2334.2
   000463   1     047000*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2334.2
   000464   1     047100*                                                              *  IC2334.2
   000465   1     047200*        X-55  - SYSTEM PRINTER NAME.                          *  IC2334.2
   000466   1     047300*        X-82  - SOURCE COMPUTER NAME.                         *  IC2334.2
   000467   1     047400*        X-83  - OBJECT COMPUTER NAME.                         *  IC2334.2
   000468   1     047500*        X-92  - TEST-FILE.                                    *  IC2334.2
   000469   1     047600*                                                              *  IC2334.2
   000470   1     047800*                                                              *  IC2334.2
   000471   1     047900*    PROGRAMS IC233A AND IC233A-1 TEST THAT A "USE" PROCEDURE  *  IC2334.2
   000472   1     048000*    IN A CALLING PROGRAM IS INVOKED BY A QUALIFYING CONDITION *  IC2334.2
   000473   1     048100*    OCCURRING IN A CONTAINED PROGRAM.                         *  IC2334.2
   000474   1     048200*                                                              *  IC2334.2
   000475   1     048300*    BOTH PROGRAMS WILL BE COMPILED IN ONE INVOCATION OF THE   *  IC2334.2
   000476   1     048400*    COMPILER AS SHOWN BELOW:                                  *  IC2334.2
   000477   1     048500*    IDENTIFICATION DIVISION.                                  *  IC2334.2
   000478   1     048600*    PROGRAM-ID. IC233A.                                       *  IC2334.2
   000479   1     048700*              .                                               *  IC2334.2
   000480   1     048800*              .                                               *  IC2334.2
   000481   1     048900*              .                                               *  IC2334.2
   000482   1     049000*    IDENTIFICATION DIVISION.                                  *  IC2334.2
   000483   1     049100*    PROGRAM-ID. IC233A-1.                                     *  IC2334.2
   000484   1     049200*              .                                               *  IC2334.2
   000485   1     049300*              .                                               *  IC2334.2
   000486   1     049400*    END PROGRAM IC233A-1.                                     *  IC2334.2
   000487   1     049500*    END PROGRAM IC233A.                                       *  IC2334.2
   000488   1     049700*ENVIRONMENT DIVISION.                                            IC2334.2
   000489   1     049800*INPUT-OUTPUT SECTION.                                            IC2334.2
   000490   1     049900*FILE-CONTROL.                                                    IC2334.2
   000491   1     050000*    SELECT TEST-FILE ASSIGN TO                                   IC2334.2
   000492   1     050100*    XXXXX018.                                                    IC2334.2
   000493   1     050200 DATA DIVISION.                                                   IC2334.2
   000494   1     050300 FILE SECTION.                                                    IC2334.2
   000495   1     050400 WORKING-STORAGE SECTION.                                         IC2334.2
   000496   1     050500 PROCEDURE DIVISION.                                              IC2334.2
   000497   1     050600 SECT-IC233A-1-001 SECTION.                                       IC2334.2
   000498   1     050700 USE-INIT-1.                                                      IC2334.2
   000499   1     050800     OPEN    INPUT TEST-FILE.                                     IC2334.2 53
   000500   1     050900     READ    TEST-FILE.                                           IC2334.2 53
   000501   1     051000 END-PROG.                                                        IC2334.2
   000502   1     051100     EXIT PROGRAM.                                                IC2334.2
   000503   1     051200 END PROGRAM IC233A-1.                                            IC2334.2 400
   000504         051300 END PROGRAM IC233A.                                              IC2334.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      119   ANSI-REFERENCE . . . . . . . .  238 245 254 354 361 370 M379
       98   CCVS-C-1 . . . . . . . . . . .  226 298 340
      103   CCVS-C-2 . . . . . . . . . . .  227 299 341
      153   CCVS-E-1 . . . . . . . . . . .  304
      158   CCVS-E-2 . . . . . . . . . . .  313 320 327 332
      161   CCVS-E-2-2 . . . . . . . . . .  M312
      166   CCVS-E-3 . . . . . . . . . . .  333
      175   CCVS-E-4 . . . . . . . . . . .  312
      176   CCVS-E-4-1 . . . . . . . . . .  M310
      178   CCVS-E-4-2 . . . . . . . . . .  M311
      120   CCVS-H-1 . . . . . . . . . . .  293
      125   CCVS-H-2A. . . . . . . . . . .  294
      134   CCVS-H-2B. . . . . . . . . . .  295
      146   CCVS-H-3 . . . . . . . . . . .  296
      196   CCVS-PGM-ID. . . . . . . . . .  265 265
       80   CM-18V0
       74   COMPUTED-A . . . . . . . . . .  75 77 78 79 80 250 253 366 369
       75   COMPUTED-N
       73   COMPUTED-X . . . . . . . . . .  M216 236 M288 352
       77   COMPUTED-0V18
       79   COMPUTED-14V4
       81   COMPUTED-18V0
       78   COMPUTED-4V14
       97   COR-ANSI-REFERENCE . . . . . .  M245 M247 M361 M363
       88   CORRECT-A. . . . . . . . . . .  89 90 91 92 93 251 253 367 369
       89   CORRECT-N
       87   CORRECT-X. . . . . . . . . . .  M217 237 M289 353
       90   CORRECT-0V18
       92   CORRECT-14V4
       94   CORRECT-18V0
       91   CORRECT-4V14
       93   CR-18V0
      111   DELETE-COUNTER . . . . . . . .  M278 307 323 325
       56   DILFRAP. . . . . . . . . . . .  M205 M380 383
       66   DOTVALUE . . . . . . . . . . .  M211 M283
      117   DUMMY-HOLD . . . . . . . . . .  M223 229 M337 343
       52   DUMMY-RECORD . . . . . . . . .  223 M224 225 M226 M227 M228 M229 233 M234 M240 M255 M293 M294 M295 M296 M298
                                            M299 M300 M302 M304 M313 M320 M327 M332 M333 337 M338 339 M340 M341 M342 M343
                                            347 M348 M356 M371
      164   ENDER-DESC . . . . . . . . . .  M315 M326 M331
      112   ERROR-COUNTER. . . . . . . . .  M277 306 316 319
      116   ERROR-HOLD . . . . . . . . . .  M306 M307 M307 M308 311
      162   ERROR-TOTAL. . . . . . . . . .  M317 M319 M324 M325 M329 M330
       59   FEATURE
      190   HYPHEN-LINE. . . . . . . . . .  228 300 302 342
      156   ID-AGAIN . . . . . . . . . . .  M265
      189   INF-ANSI-REFERENCE . . . . . .  M238 M241 M254 M257 M354 M357 M370 M372
      184   INFO-TEXT. . . . . . . . . . .  M239 M355
      113   INSPECT-COUNTER. . . . . . . .  M275 306 328 330
       61   P-OR-F . . . . . . . . . . . .  M207 213 M216 M275 M276 M277 M278 285 M288
       63   PAR-NAME . . . . . . . . . . .  M218 M290 M378
       65   PARDOT-X . . . . . . . . . . .  M210 M282
      114   PASS-COUNTER . . . . . . . . .  M207 M276 308 310
       50   PRINT-FILE . . . . . . . . . .  44 264 270
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page    13
0 Defined   Cross-reference of data names   References

0      51   PRINT-REC. . . . . . . . . . .  M212 M244 M246 M284 M360 M362
       68   RE-MARK. . . . . . . . . . . .  M219 M279 M291 M386
      110   REC-CT . . . . . . . . . . . .  209 211 218 281 283 290
      109   REC-SKL-SUB
      118   RECORD-COUNT . . . . . . . . .  M221 222 M230 M335 336 M344
       69   TEST-COMPUTED. . . . . . . . .  244 360
       84   TEST-CORRECT . . . . . . . . .  246 362
       53   TEST-FILE. . . . . . . . . . .  46 499 500
      137   TEST-ID. . . . . . . . . . . .  M265
       54   TEST-REC
       57   TEST-RESULTS . . . . . . . . .  212 M266 284
      115   TOTAL-ERROR
      186   XXCOMPUTED . . . . . . . . . .  M253 M369
      188   XXCORRECT. . . . . . . . . . .  M253 M369
      181   XXINFO . . . . . . . . . . . .  240 255 356 371
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page    14
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

      365   BAIL-OUT . . . . . . . . . . .  P287
      373   BAIL-OUT-EX. . . . . . . . . .  E287 G367
      368   BAIL-OUT-WRITE . . . . . . . .  G366
      349   BLANK-LINE-PRINT
      394   CCVS-EXIT. . . . . . . . . . .  G384
      395   CCVS-999999
      262   CCVS1
      374   CCVS1-EXIT . . . . . . . . . .  G268
      269   CLOSE-FILES. . . . . . . . . .  G396
      297   COLUMN-NAMES-ROUTINE . . . . .  E267
      278   DE-LETE. . . . . . . . . . . .  P390
      249   D1-BAIL-OUT. . . . . . . . . .  P215
      258   D1-BAIL-OUT-EX . . . . . . . .  E215 G251
      252   D1-BAIL-OUT-WRITE. . . . . . .  G250
      235   D1-FAIL-ROUTINE. . . . . . . .  P214
      248   D1-FAIL-ROUTINE-EX . . . . . .  E214 G242
      243   D1-FAIL-ROUTINE-WRITE. . . . .  G236 G237
      207   D1-PASS. . . . . . . . . . . .  P203
      208   D1-PRINT-DETAIL. . . . . . . .  P204
      220   D1-WRITE-LINE. . . . . . . . .  P212 P213 P240 P244 P246 P256
      232   D1-WRT-LN. . . . . . . . . . .  P226 P227 P228 P231
      501   END-PROG
      301   END-ROUTINE. . . . . . . . . .  P270
      305   END-ROUTINE-1
      314   END-ROUTINE-12
      322   END-ROUTINE-13 . . . . . . . .  E270
      303   END-RTN-EXIT
      259   EXIT-USE-TEST-2. . . . . . . .  G206
      277   FAIL . . . . . . . . . . . . .  P387
      351   FAIL-ROUTINE . . . . . . . . .  P286
      364   FAIL-ROUTINE-EX. . . . . . . .  E286 G358
      359   FAIL-ROUTINE-WRITE . . . . . .  G352 G353
      292   HEAD-ROUTINE . . . . . . . . .  P267
      275   INSPT
      263   OPEN-FILES
      276   PASS
      280   PRINT-DETAIL . . . . . . . . .  P392
      200   SECT-IC233A-001
      497   SECT-IC233A-1-001
      376   SECT-IC233A-1R-001
      273   TERMINATE-CALL
      271   TERMINATE-CCVS
      389   USE-DELETE-1
      385   USE-FAIL-1
      377   USE-INIT-1
      498   USE-INIT-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page    15
0 Defined   Cross-reference of procedures   References

0     381   USE-TEST-0
      202   USE-TEST-2
      391   USE-WRITE-1. . . . . . . . . .  G388
      334   WRITE-LINE . . . . . . . . . .  P284 P285 P293 P294 P295 P296 P298 P299 P300 P302 P304 P313 P321 P327 P332 P333
                                            P356 P360 P362 P371
      346   WRT-LN . . . . . . . . . . . .  P340 P341 P342 P345 P350
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page    16
0 Defined   Cross-reference of programs     References

        3   IC233A . . . . . . . . . . . .  504
      400   IC233A-1 . . . . . . . . . . .  503 382
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC233A    Date 06/04/2022  Time 11:56:29   Page    17
0LineID  Message code  Message text

     50  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     53  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "TEST-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program IC233A:
 *    Source records = 504
 *    Data Division statements = 65
 *    Procedure Division statements = 209
 *    Generated COBOL statements = 0
 *    Program complexity factor = 215
0End of compilation 1,  program IC233A,  highest severity 0.
0Return code 0
