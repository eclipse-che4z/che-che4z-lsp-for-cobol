1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:17   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:17   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         OBIC34.2
   000002         000200 PROGRAM-ID.                                                      OBIC34.2
   000003         000300     OBIC3A.                                                      OBIC34.2
   000004         000500*                                                              *  OBIC34.2
   000005         000600*    VALIDATION FOR:-                                          *  OBIC34.2
   000006         000700*                                                              *  OBIC34.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBIC34.2
   000008         000900*                                                              *  OBIC34.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".OBIC34.2
   000010         001100*                                                              *  OBIC34.2
   000011         001300*                                                              *  OBIC34.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  OBIC34.2
   000013         001500*                                                              *  OBIC34.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  OBIC34.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  OBIC34.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  OBIC34.2
   000017         001900*                                                              *  OBIC34.2
   000018         002100*                                                                 OBIC34.2
   000019         002200*        THE SUBPROGRAM IC220 PRINTS THE RESULTS FOR THE TESTING  OBIC34.2
   000020         002300*    OF A SEGMENTED LEVEL 1 SORT PROGRAM AS A SUBPROGRAM.  IT IS  OBIC34.2
   000021         002400*    CALLED BY THE MAIN PROGRAM IC218 AND THE SUBPROGRAM IC219.   OBIC34.2
   000022         002500*    THE LINKAGE VARIABLE PRINT-FLAG INDICATES WHETHER THE        OBIC34.2
   000023         002600*    HEADING (FLAG=1), FOOTING (FLAG=3), OR A REPORT LINE (FLAG=2)OBIC34.2
   000024         002700*    SHOULD BE PRINTED.                                           OBIC34.2
   000025         002800*                                                                 OBIC34.2
   000026         003000 ENVIRONMENT DIVISION.                                            OBIC34.2
   000027         003100 CONFIGURATION SECTION.                                           OBIC34.2
   000028         003200 SOURCE-COMPUTER.                                                 OBIC34.2
   000029         003300     XXXXX082.                                                    OBIC34.2
   000030         003400 OBJECT-COMPUTER.                                                 OBIC34.2
   000031         003500     XXXXX083.                                                    OBIC34.2
   000032         003600 INPUT-OUTPUT SECTION.                                            OBIC34.2
   000033         003700 FILE-CONTROL.                                                    OBIC34.2
   000034         003800     SELECT PRINT-FILE ASSIGN TO                                  OBIC34.2 38
   000035         003900     XXXXX055.                                                    OBIC34.2
   000036         004000 DATA DIVISION.                                                   OBIC34.2
   000037         004100 FILE SECTION.                                                    OBIC34.2
   000038         004200 FD  PRINT-FILE.                                                  OBIC34.2

 ==000038==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000039         004300 01  PRINT-REC PICTURE X(120).                                    OBIC34.2
   000040         004400 01  DUMMY-RECORD PICTURE X(120).                                 OBIC34.2
   000041         004500 WORKING-STORAGE SECTION.                                         OBIC34.2
   000042         004600 01  TEST-RESULTS.                                                OBIC34.2
   000043         004700     02 FILLER                   PIC X      VALUE SPACE.          OBIC34.2 IMP
   000044         004800     02 FEATURE                  PIC X(20)  VALUE SPACE.          OBIC34.2 IMP
   000045         004900     02 FILLER                   PIC X      VALUE SPACE.          OBIC34.2 IMP
   000046         005000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          OBIC34.2 IMP
   000047         005100     02 FILLER                   PIC X      VALUE SPACE.          OBIC34.2 IMP
   000048         005200     02  PAR-NAME.                                                OBIC34.2
   000049         005300       03 FILLER                 PIC X(19)  VALUE SPACE.          OBIC34.2 IMP
   000050         005400       03  PARDOT-X              PIC X      VALUE SPACE.          OBIC34.2 IMP
   000051         005500       03 DOTVALUE               PIC 99     VALUE ZERO.           OBIC34.2 IMP
   000052         005600     02 FILLER                   PIC X(8)   VALUE SPACE.          OBIC34.2 IMP
   000053         005700     02 RE-MARK                  PIC X(61).                       OBIC34.2
   000054         005800 01  TEST-COMPUTED.                                               OBIC34.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02 FILLER                   PIC X(30)  VALUE SPACE.          OBIC34.2 IMP
   000056         006000     02 FILLER                   PIC X(17)  VALUE                 OBIC34.2
   000057         006100            "       COMPUTED=".                                   OBIC34.2
   000058         006200     02 COMPUTED-X.                                               OBIC34.2
   000059         006300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          OBIC34.2 IMP
   000060         006400     03 COMPUTED-N               REDEFINES COMPUTED-A             OBIC34.2 59
   000061         006500                                 PIC -9(9).9(9).                  OBIC34.2
   000062         006600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         OBIC34.2 59
   000063         006700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     OBIC34.2 59
   000064         006800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     OBIC34.2 59
   000065         006900     03       CM-18V0 REDEFINES COMPUTED-A.                       OBIC34.2 59
   000066         007000         04 COMPUTED-18V0                    PIC -9(18).          OBIC34.2
   000067         007100         04 FILLER                           PIC X.               OBIC34.2
   000068         007200     03 FILLER PIC X(50) VALUE SPACE.                             OBIC34.2 IMP
   000069         007300 01  TEST-CORRECT.                                                OBIC34.2
   000070         007400     02 FILLER PIC X(30) VALUE SPACE.                             OBIC34.2 IMP
   000071         007500     02 FILLER PIC X(17) VALUE "       CORRECT =".                OBIC34.2
   000072         007600     02 CORRECT-X.                                                OBIC34.2
   000073         007700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         OBIC34.2 IMP
   000074         007800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      OBIC34.2 73
   000075         007900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         OBIC34.2 73
   000076         008000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     OBIC34.2 73
   000077         008100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     OBIC34.2 73
   000078         008200     03      CR-18V0 REDEFINES CORRECT-A.                         OBIC34.2 73
   000079         008300         04 CORRECT-18V0                     PIC -9(18).          OBIC34.2
   000080         008400         04 FILLER                           PIC X.               OBIC34.2
   000081         008500     03 FILLER PIC X(2) VALUE SPACE.                              OBIC34.2 IMP
   000082         008600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     OBIC34.2 IMP
   000083         008700 01  CCVS-C-1.                                                    OBIC34.2
   000084         008800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAOBIC34.2
   000085         008900-    "SS  PARAGRAPH-NAME                                          OBIC34.2
   000086         009000-    "       REMARKS".                                            OBIC34.2
   000087         009100     02 FILLER                     PIC X(20)    VALUE SPACE.      OBIC34.2 IMP
   000088         009200 01  CCVS-C-2.                                                    OBIC34.2
   000089         009300     02 FILLER                     PIC X        VALUE SPACE.      OBIC34.2 IMP
   000090         009400     02 FILLER                     PIC X(6)     VALUE "TESTED".   OBIC34.2
   000091         009500     02 FILLER                     PIC X(15)    VALUE SPACE.      OBIC34.2 IMP
   000092         009600     02 FILLER                     PIC X(4)     VALUE "FAIL".     OBIC34.2
   000093         009700     02 FILLER                     PIC X(94)    VALUE SPACE.      OBIC34.2 IMP
   000094         009800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       OBIC34.2 IMP
   000095         009900 01  REC-CT                        PIC 99       VALUE ZERO.       OBIC34.2 IMP
   000096         010000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       OBIC34.2 IMP
   000097         010100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       OBIC34.2 IMP
   000098         010200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       OBIC34.2 IMP
   000099         010300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       OBIC34.2 IMP
   000100         010400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       OBIC34.2 IMP
   000101         010500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       OBIC34.2 IMP
   000102         010600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      OBIC34.2 IMP
   000103         010700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       OBIC34.2 IMP
   000104         010800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     OBIC34.2 IMP
   000105         010900 01  CCVS-H-1.                                                    OBIC34.2
   000106         011000     02  FILLER                    PIC X(39)    VALUE SPACES.     OBIC34.2 IMP
   000107         011100     02  FILLER                    PIC X(42)    VALUE             OBIC34.2
   000108         011200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 OBIC34.2
   000109         011300     02  FILLER                    PIC X(39)    VALUE SPACES.     OBIC34.2 IMP
   000110         011400 01  CCVS-H-2A.                                                   OBIC34.2
   000111         011500   02  FILLER                        PIC X(40)  VALUE SPACE.      OBIC34.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  OBIC34.2
   000113         011700   02  FILLER                        PIC XXXX   VALUE             OBIC34.2
   000114         011800     "4.2 ".                                                      OBIC34.2
   000115         011900   02  FILLER                        PIC X(28)  VALUE             OBIC34.2
   000116         012000            " COPY - NOT FOR DISTRIBUTION".                       OBIC34.2
   000117         012100   02  FILLER                        PIC X(41)  VALUE SPACE.      OBIC34.2 IMP
   000118         012200                                                                  OBIC34.2
   000119         012300 01  CCVS-H-2B.                                                   OBIC34.2
   000120         012400   02  FILLER                        PIC X(15)  VALUE             OBIC34.2
   000121         012500            "TEST RESULT OF ".                                    OBIC34.2
   000122         012600   02  TEST-ID                       PIC X(9).                    OBIC34.2
   000123         012700   02  FILLER                        PIC X(4)   VALUE             OBIC34.2
   000124         012800            " IN ".                                               OBIC34.2
   000125         012900   02  FILLER                        PIC X(12)  VALUE             OBIC34.2
   000126         013000     " HIGH       ".                                              OBIC34.2
   000127         013100   02  FILLER                        PIC X(22)  VALUE             OBIC34.2
   000128         013200            " LEVEL VALIDATION FOR ".                             OBIC34.2
   000129         013300   02  FILLER                        PIC X(58)  VALUE             OBIC34.2
   000130         013400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBIC34.2
   000131         013500 01  CCVS-H-3.                                                    OBIC34.2
   000132         013600     02  FILLER                      PIC X(34)  VALUE             OBIC34.2
   000133         013700            " FOR OFFICIAL USE ONLY    ".                         OBIC34.2
   000134         013800     02  FILLER                      PIC X(58)  VALUE             OBIC34.2
   000135         013900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".OBIC34.2
   000136         014000     02  FILLER                      PIC X(28)  VALUE             OBIC34.2
   000137         014100            "  COPYRIGHT   1985 ".                                OBIC34.2
   000138         014200 01  CCVS-E-1.                                                    OBIC34.2
   000139         014300     02 FILLER                       PIC X(52)  VALUE SPACE.      OBIC34.2 IMP
   000140         014400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              OBIC34.2
   000141         014500     02 ID-AGAIN                     PIC X(9).                    OBIC34.2
   000142         014600     02 FILLER                       PIC X(45)  VALUE SPACES.     OBIC34.2 IMP
   000143         014700 01  CCVS-E-2.                                                    OBIC34.2
   000144         014800     02  FILLER                      PIC X(31)  VALUE SPACE.      OBIC34.2 IMP
   000145         014900     02  FILLER                      PIC X(21)  VALUE SPACE.      OBIC34.2 IMP
   000146         015000     02 CCVS-E-2-2.                                               OBIC34.2
   000147         015100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      OBIC34.2 IMP
   000148         015200         03 FILLER                   PIC X      VALUE SPACE.      OBIC34.2 IMP
   000149         015300         03 ENDER-DESC               PIC X(44)  VALUE             OBIC34.2
   000150         015400            "ERRORS ENCOUNTERED".                                 OBIC34.2
   000151         015500 01  CCVS-E-3.                                                    OBIC34.2
   000152         015600     02  FILLER                      PIC X(22)  VALUE             OBIC34.2
   000153         015700            " FOR OFFICIAL USE ONLY".                             OBIC34.2
   000154         015800     02  FILLER                      PIC X(12)  VALUE SPACE.      OBIC34.2 IMP
   000155         015900     02  FILLER                      PIC X(58)  VALUE             OBIC34.2
   000156         016000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBIC34.2
   000157         016100     02  FILLER                      PIC X(13)  VALUE SPACE.      OBIC34.2 IMP
   000158         016200     02 FILLER                       PIC X(15)  VALUE             OBIC34.2
   000159         016300             " COPYRIGHT 1985".                                   OBIC34.2
   000160         016400 01  CCVS-E-4.                                                    OBIC34.2
   000161         016500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      OBIC34.2 IMP
   000162         016600     02 FILLER                       PIC X(4)   VALUE " OF ".     OBIC34.2
   000163         016700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      OBIC34.2 IMP
   000164         016800     02 FILLER                       PIC X(40)  VALUE             OBIC34.2
   000165         016900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       OBIC34.2
   000166         017000 01  XXINFO.                                                      OBIC34.2
   000167         017100     02 FILLER                       PIC X(19)  VALUE             OBIC34.2
   000168         017200            "*** INFORMATION ***".                                OBIC34.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02 INFO-TEXT.                                                OBIC34.2
   000170         017400       04 FILLER                     PIC X(8)   VALUE SPACE.      OBIC34.2 IMP
   000171         017500       04 XXCOMPUTED                 PIC X(20).                   OBIC34.2
   000172         017600       04 FILLER                     PIC X(5)   VALUE SPACE.      OBIC34.2 IMP
   000173         017700       04 XXCORRECT                  PIC X(20).                   OBIC34.2
   000174         017800     02 INF-ANSI-REFERENCE           PIC X(48).                   OBIC34.2
   000175         017900 01  HYPHEN-LINE.                                                 OBIC34.2
   000176         018000     02 FILLER  PIC IS X VALUE IS SPACE.                          OBIC34.2 IMP
   000177         018100     02 FILLER  PIC IS X(65)    VALUE IS "************************OBIC34.2
   000178         018200-    "*****************************************".                 OBIC34.2
   000179         018300     02 FILLER  PIC IS X(54)    VALUE IS "************************OBIC34.2
   000180         018400-    "******************************".                            OBIC34.2
   000181         018500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             OBIC34.2
   000182         018600     "OBIC3A".                                                    OBIC34.2
   000183         018700 LINKAGE SECTION.                                                 OBIC34.2
   000184         018800 01  PRINT-LINE-VALUES.                                           OBIC34.2
   000185         018900     02  PASS-OR-FAIL        PICTURE X(5).                        OBIC34.2
   000186         019000     02  R-COUNT             PICTURE 99.                          OBIC34.2
   000187         019100     02  FEATURE-TESTED      PICTURE X(20).                       OBIC34.2
   000188         019200     02  COMPUTED-SORT-KEY   PICTURE X(20).                       OBIC34.2
   000189         019300     02  CORRECT-SORT-KEY    PICTURE X(20).                       OBIC34.2
   000190         019400     02  PARAGRAPH-NAME      PICTURE X(12).                       OBIC34.2
   000191         019500 01  PRINT-FLAG              PICTURE 9.                           OBIC34.2
   000192         019600 PROCEDURE DIVISION USING PRINT-LINE-VALUES  PRINT-FLAG.          OBIC34.2 184 191
   000193         019700 SECT-IC220-0001 SECTION.                                         OBIC34.2
   000194         019800 BOILER-PLATE.                                                    OBIC34.2
   000195         019900     GO TO CCVS1-EXIT.                                            OBIC34.2 301
   000196         020000 CLOSE-FILES.                                                     OBIC34.2
   000197         020100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   OBIC34.2 228 249 38
   000198         020200 TERMINATE-CCVS.                                                  OBIC34.2
   000199         020300     EXIT PROGRAM.                                                OBIC34.2
   000200         020400 TERMINATE-CALL.                                                  OBIC34.2
   000201         020500     STOP     RUN.                                                OBIC34.2
   000202         020600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         OBIC34.2 46 98
   000203         020700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           OBIC34.2 46 99
   000204         020800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          OBIC34.2 46 97
   000205         020900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      OBIC34.2 46 96
   000206         021000     MOVE "****TEST DELETED****" TO RE-MARK.                      OBIC34.2 53
   000207         021100 PRINT-DETAIL.                                                    OBIC34.2
   000208         021200     IF REC-CT NOT EQUAL TO ZERO                                  OBIC34.2 95 IMP
   000209      1  021300             MOVE "." TO PARDOT-X                                 OBIC34.2 50
   000210      1  021400             MOVE REC-CT TO DOTVALUE.                             OBIC34.2 95 51
   000211         021500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      OBIC34.2 42 39 261
   000212         021600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               OBIC34.2 46 261
   000213      1  021700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 OBIC34.2 278 291
   000214      1  021800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 OBIC34.2 292 300
   000215         021900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              OBIC34.2 IMP 46 IMP 58
   000216         022000     MOVE SPACE TO CORRECT-X.                                     OBIC34.2 IMP 72
   000217         022100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         OBIC34.2 95 IMP IMP 48
   000218         022200     MOVE     SPACE TO RE-MARK.                                   OBIC34.2 IMP 53
   000219         022300 HEAD-ROUTINE.                                                    OBIC34.2
   000220         022400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  OBIC34.2 105 40 261
   000221         022500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  OBIC34.2 110 40 261
   000222         022600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  OBIC34.2 119 40 261
   000223         022700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  OBIC34.2 131 40 261
   000224         022800 COLUMN-NAMES-ROUTINE.                                            OBIC34.2
   000225         022900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBIC34.2 83 40 261
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBIC34.2 88 40 261
   000227         023100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        OBIC34.2 175 40 261
   000228         023200 END-ROUTINE.                                                     OBIC34.2
   000229         023300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.OBIC34.2 175 40 261
   000230         023400 END-RTN-EXIT.                                                    OBIC34.2
   000231         023500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBIC34.2 138 40 261
   000232         023600 END-ROUTINE-1.                                                   OBIC34.2
   000233         023700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      OBIC34.2 97 101 98
   000234         023800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               OBIC34.2 101 96 101
   000235         023900      ADD PASS-COUNTER TO ERROR-HOLD.                             OBIC34.2 99 101
   000236         024000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   OBIC34.2
   000237         024100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            OBIC34.2 99 161
   000238         024200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              OBIC34.2 101 163
   000239         024300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                OBIC34.2 160 146
   000240         024400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           OBIC34.2 143 40 261
   000241         024500  END-ROUTINE-12.                                                 OBIC34.2
   000242         024600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        OBIC34.2 149
   000243         024700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      OBIC34.2 97 IMP
   000244      1  024800         MOVE "NO " TO ERROR-TOTAL                                OBIC34.2 147
   000245         024900         ELSE                                                     OBIC34.2
   000246      1  025000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       OBIC34.2 97 147
   000247         025100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           OBIC34.2 143 40
   000248         025200     PERFORM WRITE-LINE.                                          OBIC34.2 261
   000249         025300 END-ROUTINE-13.                                                  OBIC34.2
   000250         025400     IF DELETE-COUNTER IS EQUAL TO ZERO                           OBIC34.2 96 IMP
   000251      1  025500         MOVE "NO " TO ERROR-TOTAL  ELSE                          OBIC34.2 147
   000252      1  025600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      OBIC34.2 96 147
   000253         025700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   OBIC34.2 149
   000254         025800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBIC34.2 143 40 261
   000255         025900      IF   INSPECT-COUNTER EQUAL TO ZERO                          OBIC34.2 98 IMP
   000256      1  026000          MOVE "NO " TO ERROR-TOTAL                               OBIC34.2 147
   000257      1  026100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   OBIC34.2 98 147
   000258         026200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            OBIC34.2 149
   000259         026300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          OBIC34.2 143 40 261
   000260         026400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBIC34.2 151 40 261
   000261         026500 WRITE-LINE.                                                      OBIC34.2
   000262         026600     ADD 1 TO RECORD-COUNT.                                       OBIC34.2 103
   000263         026700     IF RECORD-COUNT GREATER 50                                   OBIC34.2 103
   000264      1  026800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          OBIC34.2 40 102
   000265      1  026900         MOVE SPACE TO DUMMY-RECORD                               OBIC34.2 IMP 40
   000266      1  027000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  OBIC34.2 40
   000267      1  027100         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             OBIC34.2 83 40 273
   000268      1  027200         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     OBIC34.2 88 40 273
   000269      1  027300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          OBIC34.2 175 40 273
   000270      1  027400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          OBIC34.2 102 40
   000271      1  027500         MOVE ZERO TO RECORD-COUNT.                               OBIC34.2 IMP 103
   000272         027600     PERFORM WRT-LN.                                              OBIC34.2 273
   000273         027700 WRT-LN.                                                          OBIC34.2
   000274         027800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               OBIC34.2 40
   000275         027900     MOVE SPACE TO DUMMY-RECORD.                                  OBIC34.2 IMP 40
   000276         028000 BLANK-LINE-PRINT.                                                OBIC34.2
   000277         028100     PERFORM WRT-LN.                                              OBIC34.2 273
   000278         028200 FAIL-ROUTINE.                                                    OBIC34.2
   000279         028300     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. OBIC34.2 58 IMP 286
   000280         028400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.OBIC34.2 72 IMP 286
   000281         028500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 OBIC34.2 104 174
   000282         028600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   OBIC34.2 169
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBIC34.2 166 40 261
   000284         028800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         OBIC34.2 IMP 174
   000285         028900     GO TO  FAIL-ROUTINE-EX.                                      OBIC34.2 291
   000286         029000 FAIL-ROUTINE-WRITE.                                              OBIC34.2
   000287         029100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         OBIC34.2 54 39 261
   000288         029200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 OBIC34.2 104 82
   000289         029300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. OBIC34.2 69 39 261
   000290         029400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         OBIC34.2 IMP 82
   000291         029500 FAIL-ROUTINE-EX. EXIT.                                           OBIC34.2
   000292         029600 BAIL-OUT.                                                        OBIC34.2
   000293         029700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   OBIC34.2 59 IMP 295
   000294         029800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           OBIC34.2 73 IMP 300
   000295         029900 BAIL-OUT-WRITE.                                                  OBIC34.2
   000296         030000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  OBIC34.2 73 173 59 171
   000297         030100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 OBIC34.2 104 174
   000298         030200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBIC34.2 166 40 261
   000299         030300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         OBIC34.2 IMP 174
   000300         030400 BAIL-OUT-EX. EXIT.                                               OBIC34.2
   000301         030500 CCVS1-EXIT.                                                      OBIC34.2
   000302         030600     EXIT.                                                        OBIC34.2
   000303         030700 SECT-IC220-0002 SECTION.                                         OBIC34.2
   000304         030800 BRANCH-STATEMENT.                                                OBIC34.2
   000305         030900     GO TO PRINT-HEADING  PROCESS-LINE  PRINT-FOOTING             OBIC34.2 310 321 318
   000306         031000         DEPENDING ON PRINT-FLAG.                                 OBIC34.2 191
   000307         031100     MOVE "ERROR IN PRINT-FLAG" TO DUMMY-RECORD.                  OBIC34.2 40
   000308         031200     PERFORM WRITE-LINE.                                          OBIC34.2 261
   000309         031300     GO TO IC220-EXIT.                                            OBIC34.2 331
   000310         031400 PRINT-HEADING.                                                   OBIC34.2
   000311         031500     MOVE 0 TO R-COUNT.                                           OBIC34.2 186
   000312         031600 OPEN-FILES.                                                      OBIC34.2
   000313         031700     OPEN     OUTPUT PRINT-FILE.                                  OBIC34.2 38
   000314         031800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   OBIC34.2 181 122 181 141
   000315         031900     MOVE    SPACE TO TEST-RESULTS.                               OBIC34.2 IMP 42
   000316         032000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             OBIC34.2 219 224
   000317         032100     GO TO IC220-EXIT.                                            OBIC34.2 331
   000318         032200 PRINT-FOOTING.                                                   OBIC34.2
   000319         032300     PERFORM CLOSE-FILES.                                         OBIC34.2 196
   000320         032400     GO TO IC220-EXIT.                                            OBIC34.2 331
   000321         032500 PROCESS-LINE.                                                    OBIC34.2
   000322         032600     IF PASS-OR-FAIL EQUAL TO "PASS "                             OBIC34.2 185
   000323      1  032700         PERFORM PASS                                             OBIC34.2 203
   000324      1  032800             ELSE PERFORM FAIL                                    OBIC34.2 204
   000325      1  032900                  MOVE COMPUTED-SORT-KEY TO COMPUTED-A            OBIC34.2 188 59
   000326      1  033000                  MOVE CORRECT-SORT-KEY TO CORRECT-A.             OBIC34.2 189 73
   000327         033100     MOVE R-COUNT TO REC-CT.                                      OBIC34.2 186 95
   000328         033200     MOVE FEATURE-TESTED TO FEATURE.                              OBIC34.2 187 44
   000329         033300     MOVE PARAGRAPH-NAME TO PAR-NAME.                             OBIC34.2 190 48
   000330         033400     PERFORM PRINT-DETAIL.                                        OBIC34.2 207
   000331         033500 IC220-EXIT.                                                      OBIC34.2
   000332         033600     EXIT PROGRAM.                                                OBIC34.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page     9
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      104   ANSI-REFERENCE . . . . . . . .  281 288 297
       83   CCVS-C-1 . . . . . . . . . . .  225 267
       88   CCVS-C-2 . . . . . . . . . . .  226 268
      138   CCVS-E-1 . . . . . . . . . . .  231
      143   CCVS-E-2 . . . . . . . . . . .  240 247 254 259
      146   CCVS-E-2-2 . . . . . . . . . .  M239
      151   CCVS-E-3 . . . . . . . . . . .  260
      160   CCVS-E-4 . . . . . . . . . . .  239
      161   CCVS-E-4-1 . . . . . . . . . .  M237
      163   CCVS-E-4-2 . . . . . . . . . .  M238
      105   CCVS-H-1 . . . . . . . . . . .  220
      110   CCVS-H-2A. . . . . . . . . . .  221
      119   CCVS-H-2B. . . . . . . . . . .  222
      131   CCVS-H-3 . . . . . . . . . . .  223
      181   CCVS-PGM-ID. . . . . . . . . .  314 314
       65   CM-18V0
       59   COMPUTED-A . . . . . . . . . .  60 62 63 64 65 293 296 M325
       60   COMPUTED-N
      188   COMPUTED-SORT-KEY. . . . . . .  325
       58   COMPUTED-X . . . . . . . . . .  M215 279
       62   COMPUTED-0V18
       64   COMPUTED-14V4
       66   COMPUTED-18V0
       63   COMPUTED-4V14
       82   COR-ANSI-REFERENCE . . . . . .  M288 M290
       73   CORRECT-A. . . . . . . . . . .  74 75 76 77 78 294 296 M326
       74   CORRECT-N
      189   CORRECT-SORT-KEY . . . . . . .  326
       72   CORRECT-X. . . . . . . . . . .  M216 280
       75   CORRECT-0V18
       77   CORRECT-14V4
       79   CORRECT-18V0
       76   CORRECT-4V14
       78   CR-18V0
       96   DELETE-COUNTER . . . . . . . .  M205 234 250 252
       51   DOTVALUE . . . . . . . . . . .  M210
      102   DUMMY-HOLD . . . . . . . . . .  M264 270
       40   DUMMY-RECORD . . . . . . . . .  M220 M221 M222 M223 M225 M226 M227 M229 M231 M240 M247 M254 M259 M260 264 M265
                                            266 M267 M268 M269 M270 274 M275 M283 M298 M307
      149   ENDER-DESC . . . . . . . . . .  M242 M253 M258
       97   ERROR-COUNTER. . . . . . . . .  M204 233 243 246
      101   ERROR-HOLD . . . . . . . . . .  M233 M234 M234 M235 238
      147   ERROR-TOTAL. . . . . . . . . .  M244 M246 M251 M252 M256 M257
       44   FEATURE. . . . . . . . . . . .  M328
      187   FEATURE-TESTED . . . . . . . .  328
      175   HYPHEN-LINE. . . . . . . . . .  227 229 269
      141   ID-AGAIN . . . . . . . . . . .  M314
      174   INF-ANSI-REFERENCE . . . . . .  M281 M284 M297 M299
      169   INFO-TEXT. . . . . . . . . . .  M282
       98   INSPECT-COUNTER. . . . . . . .  M202 233 255 257
       46   P-OR-F . . . . . . . . . . . .  M202 M203 M204 M205 212 M215
       48   PAR-NAME . . . . . . . . . . .  M217 M329
      190   PARAGRAPH-NAME . . . . . . . .  329
       50   PARDOT-X . . . . . . . . . . .  M209
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page    10
0 Defined   Cross-reference of data names   References

0      99   PASS-COUNTER . . . . . . . . .  M203 235 237
      185   PASS-OR-FAIL . . . . . . . . .  322
       38   PRINT-FILE . . . . . . . . . .  34 197 313
      191   PRINT-FLAG . . . . . . . . . .  192 306
      184   PRINT-LINE-VALUES. . . . . . .  192
       39   PRINT-REC. . . . . . . . . . .  M211 M287 M289
      186   R-COUNT. . . . . . . . . . . .  M311 327
       53   RE-MARK. . . . . . . . . . . .  M206 M218
       95   REC-CT . . . . . . . . . . . .  208 210 217 M327
       94   REC-SKL-SUB
      103   RECORD-COUNT . . . . . . . . .  M262 263 M271
       54   TEST-COMPUTED. . . . . . . . .  287
       69   TEST-CORRECT . . . . . . . . .  289
      122   TEST-ID. . . . . . . . . . . .  M314
       42   TEST-RESULTS . . . . . . . . .  211 M315
      100   TOTAL-ERROR
      171   XXCOMPUTED . . . . . . . . . .  M296
      173   XXCORRECT. . . . . . . . . . .  M296
      166   XXINFO . . . . . . . . . . . .  283 298
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page    11
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

      292   BAIL-OUT . . . . . . . . . . .  P214
      300   BAIL-OUT-EX. . . . . . . . . .  E214 G294
      295   BAIL-OUT-WRITE . . . . . . . .  G293
      276   BLANK-LINE-PRINT
      194   BOILER-PLATE
      304   BRANCH-STATEMENT
      301   CCVS1-EXIT . . . . . . . . . .  G195
      196   CLOSE-FILES. . . . . . . . . .  P319
      224   COLUMN-NAMES-ROUTINE . . . . .  E316
      205   DE-LETE
      228   END-ROUTINE. . . . . . . . . .  P197
      232   END-ROUTINE-1
      241   END-ROUTINE-12
      249   END-ROUTINE-13 . . . . . . . .  E197
      230   END-RTN-EXIT
      204   FAIL . . . . . . . . . . . . .  P324
      278   FAIL-ROUTINE . . . . . . . . .  P213
      291   FAIL-ROUTINE-EX. . . . . . . .  E213 G285
      286   FAIL-ROUTINE-WRITE . . . . . .  G279 G280
      219   HEAD-ROUTINE . . . . . . . . .  P316
      331   IC220-EXIT . . . . . . . . . .  G309 G317 G320
      202   INSPT
      312   OPEN-FILES
      203   PASS . . . . . . . . . . . . .  P323
      207   PRINT-DETAIL . . . . . . . . .  P330
      318   PRINT-FOOTING. . . . . . . . .  D305
      310   PRINT-HEADING. . . . . . . . .  D305
      321   PROCESS-LINE . . . . . . . . .  D305
      193   SECT-IC220-0001
      303   SECT-IC220-0002
      200   TERMINATE-CALL
      198   TERMINATE-CCVS
      261   WRITE-LINE . . . . . . . . . .  P211 P212 P220 P221 P222 P223 P225 P226 P227 P229 P231 P240 P248 P254 P259 P260
                                            P283 P287 P289 P298 P308
      273   WRT-LN . . . . . . . . . . . .  P267 P268 P269 P272 P277
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page    12
0 Defined   Cross-reference of programs     References

        3   OBIC3A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC3A    Date 06/04/2022  Time 11:58:17   Page    13
0LineID  Message code  Message text

     38  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program OBIC3A:
 *    Source records = 332
 *    Data Division statements = 71
 *    Procedure Division statements = 145
 *    Generated COBOL statements = 0
 *    Program complexity factor = 152
0End of compilation 1,  program OBIC3A,  highest severity 0.
0Return code 0
