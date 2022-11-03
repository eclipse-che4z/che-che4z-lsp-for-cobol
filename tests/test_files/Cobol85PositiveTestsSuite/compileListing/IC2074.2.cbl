1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:26   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:26   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2074.2
   000002         000200 PROGRAM-ID.                                                      IC2074.2
   000003         000300     IC207A.                                                      IC2074.2
   000004         000500*                                                              *  IC2074.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2074.2
   000006         000700*                                                              *  IC2074.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2074.2
   000008         000900*                                                              *  IC2074.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2074.2
   000010         001100*                                                              *  IC2074.2
   000011         001300*                                                              *  IC2074.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2074.2
   000013         001500*                                                              *  IC2074.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2074.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2074.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2074.2
   000017         001900*                                                              *  IC2074.2
   000018         002100*        THE PROGRAM IC207 DEFINES A VARIABLE LENGTH TABLE.       IC2074.2
   000019         002200*    THE TABLE AND THE VARIABLE CONTAINING THE TABLE LENGTH       IC2074.2
   000020         002300*    ARE OPERANDS IN A CALL STATEMENT USING PHRASE.  ALSO AN      IC2074.2
   000021         002400*    INDEX IS DEFINED FOR THE TABLE AND AN INDEX DATA ITEM        IC2074.2
   000022         002500*    IS USED TO PASS AN INDEX VALUE FOR A TABLE REFERENCE         IC2074.2
   000023         002600*    TO AND FROM THE SUBPROGRAM IC208.                            IC2074.2
   000024         002800 ENVIRONMENT DIVISION.                                            IC2074.2
   000025         002900 CONFIGURATION SECTION.                                           IC2074.2
   000026         003000 SOURCE-COMPUTER.                                                 IC2074.2
   000027         003100     XXXXX082.                                                    IC2074.2
   000028         003200 OBJECT-COMPUTER.                                                 IC2074.2
   000029         003300     XXXXX083.                                                    IC2074.2
   000030         003400 INPUT-OUTPUT SECTION.                                            IC2074.2
   000031         003500 FILE-CONTROL.                                                    IC2074.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  IC2074.2 36
   000033         003700     XXXXX055.                                                    IC2074.2
   000034         003800 DATA DIVISION.                                                   IC2074.2
   000035         003900 FILE SECTION.                                                    IC2074.2
   000036         004000 FD  PRINT-FILE.                                                  IC2074.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    IC2074.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 IC2074.2
   000039         004300 WORKING-STORAGE SECTION.                                         IC2074.2
   000040         004400 77  INDEX-1 USAGE IS INDEX.                                      IC2074.2
   000041         004500 77  DN3 PICTURE 99  VALUE 15.                                    IC2074.2
   000042         004600 77  ID1 PICTURE X(6) VALUE "IC208A".                             IC2074.2
   000043         004700 77  DN4 PICTURE X.                                               IC2074.2
   000044         004800 77  DN5 PICTURE X(15).                                           IC2074.2
   000045         004900 01  TABLE-01.                                                    IC2074.2
   000046         005000     02  DN1 PICTURE X                                            IC2074.2
   000047         005100             OCCURS 1 TO 15 TIMES                                 IC2074.2
   000048         005200             DEPENDING ON DN3                                     IC2074.2 41
   000049         005300             INDEXED BY IN1.                                      IC2074.2
   000050         005400 01  TABLE-02.                                                    IC2074.2
   000051         005500     02  DN2   PICTURE X     OCCURS 8 TIMES.                      IC2074.2
   000052         005600 01  TEST-RESULTS.                                                IC2074.2
   000053         005700     02 FILLER                   PIC X      VALUE SPACE.          IC2074.2 IMP
   000054         005800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2074.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02 FILLER                   PIC X      VALUE SPACE.          IC2074.2 IMP
   000056         006000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2074.2 IMP
   000057         006100     02 FILLER                   PIC X      VALUE SPACE.          IC2074.2 IMP
   000058         006200     02  PAR-NAME.                                                IC2074.2
   000059         006300       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2074.2 IMP
   000060         006400       03  PARDOT-X              PIC X      VALUE SPACE.          IC2074.2 IMP
   000061         006500       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2074.2 IMP
   000062         006600     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2074.2 IMP
   000063         006700     02 RE-MARK                  PIC X(61).                       IC2074.2
   000064         006800 01  TEST-COMPUTED.                                               IC2074.2
   000065         006900     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2074.2 IMP
   000066         007000     02 FILLER                   PIC X(17)  VALUE                 IC2074.2
   000067         007100            "       COMPUTED=".                                   IC2074.2
   000068         007200     02 COMPUTED-X.                                               IC2074.2
   000069         007300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2074.2 IMP
   000070         007400     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2074.2 69
   000071         007500                                 PIC -9(9).9(9).                  IC2074.2
   000072         007600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2074.2 69
   000073         007700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2074.2 69
   000074         007800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2074.2 69
   000075         007900     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2074.2 69
   000076         008000         04 COMPUTED-18V0                    PIC -9(18).          IC2074.2
   000077         008100         04 FILLER                           PIC X.               IC2074.2
   000078         008200     03 FILLER PIC X(50) VALUE SPACE.                             IC2074.2 IMP
   000079         008300 01  TEST-CORRECT.                                                IC2074.2
   000080         008400     02 FILLER PIC X(30) VALUE SPACE.                             IC2074.2 IMP
   000081         008500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2074.2
   000082         008600     02 CORRECT-X.                                                IC2074.2
   000083         008700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2074.2 IMP
   000084         008800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2074.2 83
   000085         008900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2074.2 83
   000086         009000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2074.2 83
   000087         009100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2074.2 83
   000088         009200     03      CR-18V0 REDEFINES CORRECT-A.                         IC2074.2 83
   000089         009300         04 CORRECT-18V0                     PIC -9(18).          IC2074.2
   000090         009400         04 FILLER                           PIC X.               IC2074.2
   000091         009500     03 FILLER PIC X(2) VALUE SPACE.                              IC2074.2 IMP
   000092         009600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2074.2 IMP
   000093         009700 01  CCVS-C-1.                                                    IC2074.2
   000094         009800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2074.2
   000095         009900-    "SS  PARAGRAPH-NAME                                          IC2074.2
   000096         010000-    "       REMARKS".                                            IC2074.2
   000097         010100     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2074.2 IMP
   000098         010200 01  CCVS-C-2.                                                    IC2074.2
   000099         010300     02 FILLER                     PIC X        VALUE SPACE.      IC2074.2 IMP
   000100         010400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2074.2
   000101         010500     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2074.2 IMP
   000102         010600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2074.2
   000103         010700     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2074.2 IMP
   000104         010800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2074.2 IMP
   000105         010900 01  REC-CT                        PIC 99       VALUE ZERO.       IC2074.2 IMP
   000106         011000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2074.2 IMP
   000107         011100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2074.2 IMP
   000108         011200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2074.2 IMP
   000109         011300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2074.2 IMP
   000110         011400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2074.2 IMP
   000111         011500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2074.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2074.2 IMP
   000113         011700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2074.2 IMP
   000114         011800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2074.2 IMP
   000115         011900 01  CCVS-H-1.                                                    IC2074.2
   000116         012000     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2074.2 IMP
   000117         012100     02  FILLER                    PIC X(42)    VALUE             IC2074.2
   000118         012200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2074.2
   000119         012300     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2074.2 IMP
   000120         012400 01  CCVS-H-2A.                                                   IC2074.2
   000121         012500   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2074.2 IMP
   000122         012600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2074.2
   000123         012700   02  FILLER                        PIC XXXX   VALUE             IC2074.2
   000124         012800     "4.2 ".                                                      IC2074.2
   000125         012900   02  FILLER                        PIC X(28)  VALUE             IC2074.2
   000126         013000            " COPY - NOT FOR DISTRIBUTION".                       IC2074.2
   000127         013100   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2074.2 IMP
   000128         013200                                                                  IC2074.2
   000129         013300 01  CCVS-H-2B.                                                   IC2074.2
   000130         013400   02  FILLER                        PIC X(15)  VALUE             IC2074.2
   000131         013500            "TEST RESULT OF ".                                    IC2074.2
   000132         013600   02  TEST-ID                       PIC X(9).                    IC2074.2
   000133         013700   02  FILLER                        PIC X(4)   VALUE             IC2074.2
   000134         013800            " IN ".                                               IC2074.2
   000135         013900   02  FILLER                        PIC X(12)  VALUE             IC2074.2
   000136         014000     " HIGH       ".                                              IC2074.2
   000137         014100   02  FILLER                        PIC X(22)  VALUE             IC2074.2
   000138         014200            " LEVEL VALIDATION FOR ".                             IC2074.2
   000139         014300   02  FILLER                        PIC X(58)  VALUE             IC2074.2
   000140         014400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2074.2
   000141         014500 01  CCVS-H-3.                                                    IC2074.2
   000142         014600     02  FILLER                      PIC X(34)  VALUE             IC2074.2
   000143         014700            " FOR OFFICIAL USE ONLY    ".                         IC2074.2
   000144         014800     02  FILLER                      PIC X(58)  VALUE             IC2074.2
   000145         014900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2074.2
   000146         015000     02  FILLER                      PIC X(28)  VALUE             IC2074.2
   000147         015100            "  COPYRIGHT   1985 ".                                IC2074.2
   000148         015200 01  CCVS-E-1.                                                    IC2074.2
   000149         015300     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2074.2 IMP
   000150         015400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2074.2
   000151         015500     02 ID-AGAIN                     PIC X(9).                    IC2074.2
   000152         015600     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2074.2 IMP
   000153         015700 01  CCVS-E-2.                                                    IC2074.2
   000154         015800     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2074.2 IMP
   000155         015900     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2074.2 IMP
   000156         016000     02 CCVS-E-2-2.                                               IC2074.2
   000157         016100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2074.2 IMP
   000158         016200         03 FILLER                   PIC X      VALUE SPACE.      IC2074.2 IMP
   000159         016300         03 ENDER-DESC               PIC X(44)  VALUE             IC2074.2
   000160         016400            "ERRORS ENCOUNTERED".                                 IC2074.2
   000161         016500 01  CCVS-E-3.                                                    IC2074.2
   000162         016600     02  FILLER                      PIC X(22)  VALUE             IC2074.2
   000163         016700            " FOR OFFICIAL USE ONLY".                             IC2074.2
   000164         016800     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2074.2 IMP
   000165         016900     02  FILLER                      PIC X(58)  VALUE             IC2074.2
   000166         017000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2074.2
   000167         017100     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2074.2 IMP
   000168         017200     02 FILLER                       PIC X(15)  VALUE             IC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300             " COPYRIGHT 1985".                                   IC2074.2
   000170         017400 01  CCVS-E-4.                                                    IC2074.2
   000171         017500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2074.2 IMP
   000172         017600     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2074.2
   000173         017700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2074.2 IMP
   000174         017800     02 FILLER                       PIC X(40)  VALUE             IC2074.2
   000175         017900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2074.2
   000176         018000 01  XXINFO.                                                      IC2074.2
   000177         018100     02 FILLER                       PIC X(19)  VALUE             IC2074.2
   000178         018200            "*** INFORMATION ***".                                IC2074.2
   000179         018300     02 INFO-TEXT.                                                IC2074.2
   000180         018400       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2074.2 IMP
   000181         018500       04 XXCOMPUTED                 PIC X(20).                   IC2074.2
   000182         018600       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2074.2 IMP
   000183         018700       04 XXCORRECT                  PIC X(20).                   IC2074.2
   000184         018800     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2074.2
   000185         018900 01  HYPHEN-LINE.                                                 IC2074.2
   000186         019000     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2074.2 IMP
   000187         019100     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2074.2
   000188         019200-    "*****************************************".                 IC2074.2
   000189         019300     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2074.2
   000190         019400-    "******************************".                            IC2074.2
   000191         019500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2074.2
   000192         019600     "IC207A".                                                    IC2074.2
   000193         019700 PROCEDURE DIVISION.                                              IC2074.2
   000194         019800 CCVS1 SECTION.                                                   IC2074.2
   000195         019900 OPEN-FILES.                                                      IC2074.2
   000196         020000     OPEN     OUTPUT PRINT-FILE.                                  IC2074.2 36
   000197         020100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2074.2 191 132 191 151
   000198         020200     MOVE    SPACE TO TEST-RESULTS.                               IC2074.2 IMP 52
   000199         020300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2074.2 224 229
   000200         020400     GO TO CCVS1-EXIT.                                            IC2074.2 306
   000201         020500 CLOSE-FILES.                                                     IC2074.2
   000202         020600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2074.2 233 254 36
   000203         020700 TERMINATE-CCVS.                                                  IC2074.2
   000204         020800     EXIT PROGRAM.                                                IC2074.2
   000205         020900 TERMINATE-CALL.                                                  IC2074.2
   000206         021000     STOP     RUN.                                                IC2074.2
   000207         021100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2074.2 56 108
   000208         021200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2074.2 56 109
   000209         021300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2074.2 56 107
   000210         021400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2074.2 56 106
   000211         021500     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2074.2 63
   000212         021600 PRINT-DETAIL.                                                    IC2074.2
   000213         021700     IF REC-CT NOT EQUAL TO ZERO                                  IC2074.2 105 IMP
   000214      1  021800             MOVE "." TO PARDOT-X                                 IC2074.2 60
   000215      1  021900             MOVE REC-CT TO DOTVALUE.                             IC2074.2 105 61
   000216         022000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2074.2 52 37 266
   000217         022100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2074.2 56 266
   000218      1  022200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2074.2 283 296
   000219      1  022300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2074.2 297 305
   000220         022400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2074.2 IMP 56 IMP 68
   000221         022500     MOVE SPACE TO CORRECT-X.                                     IC2074.2 IMP 82
   000222         022600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2074.2 105 IMP IMP 58
   000223         022700     MOVE     SPACE TO RE-MARK.                                   IC2074.2 IMP 63
   000224         022800 HEAD-ROUTINE.                                                    IC2074.2
   000225         022900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2074.2 115 38 266
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2074.2 120 38 266
   000227         023100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2074.2 129 38 266
   000228         023200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2074.2 141 38 266
   000229         023300 COLUMN-NAMES-ROUTINE.                                            IC2074.2
   000230         023400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2074.2 93 38 266
   000231         023500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2074.2 98 38 266
   000232         023600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2074.2 185 38 266
   000233         023700 END-ROUTINE.                                                     IC2074.2
   000234         023800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2074.2 185 38 266
   000235         023900 END-RTN-EXIT.                                                    IC2074.2
   000236         024000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2074.2 148 38 266
   000237         024100 END-ROUTINE-1.                                                   IC2074.2
   000238         024200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2074.2 107 111 108
   000239         024300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2074.2 111 106 111
   000240         024400      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2074.2 109 111
   000241         024500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2074.2
   000242         024600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2074.2 109 171
   000243         024700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2074.2 111 173
   000244         024800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2074.2 170 156
   000245         024900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2074.2 153 38 266
   000246         025000  END-ROUTINE-12.                                                 IC2074.2
   000247         025100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2074.2 159
   000248         025200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2074.2 107 IMP
   000249      1  025300         MOVE "NO " TO ERROR-TOTAL                                IC2074.2 157
   000250         025400         ELSE                                                     IC2074.2
   000251      1  025500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2074.2 107 157
   000252         025600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2074.2 153 38
   000253         025700     PERFORM WRITE-LINE.                                          IC2074.2 266
   000254         025800 END-ROUTINE-13.                                                  IC2074.2
   000255         025900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2074.2 106 IMP
   000256      1  026000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2074.2 157
   000257      1  026100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2074.2 106 157
   000258         026200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2074.2 159
   000259         026300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2074.2 153 38 266
   000260         026400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2074.2 108 IMP
   000261      1  026500          MOVE "NO " TO ERROR-TOTAL                               IC2074.2 157
   000262      1  026600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2074.2 108 157
   000263         026700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2074.2 159
   000264         026800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2074.2 153 38 266
   000265         026900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2074.2 161 38 266
   000266         027000 WRITE-LINE.                                                      IC2074.2
   000267         027100     ADD 1 TO RECORD-COUNT.                                       IC2074.2 113
   000268         027200     IF RECORD-COUNT GREATER 50                                   IC2074.2 113
   000269      1  027300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2074.2 38 112
   000270      1  027400         MOVE SPACE TO DUMMY-RECORD                               IC2074.2 IMP 38
   000271      1  027500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2074.2 38
   000272      1  027600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2074.2 93 38 278
   000273      1  027700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2074.2 98 38 278
   000274      1  027800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2074.2 185 38 278
   000275      1  027900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2074.2 112 38
   000276      1  028000         MOVE ZERO TO RECORD-COUNT.                               IC2074.2 IMP 113
   000277         028100     PERFORM WRT-LN.                                              IC2074.2 278
   000278         028200 WRT-LN.                                                          IC2074.2
   000279         028300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2074.2 38
   000280         028400     MOVE SPACE TO DUMMY-RECORD.                                  IC2074.2 IMP 38
   000281         028500 BLANK-LINE-PRINT.                                                IC2074.2
   000282         028600     PERFORM WRT-LN.                                              IC2074.2 278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700 FAIL-ROUTINE.                                                    IC2074.2
   000284         028800     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2074.2 68 IMP 291
   000285         028900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2074.2 82 IMP 291
   000286         029000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2074.2 114 184
   000287         029100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2074.2 179
   000288         029200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2074.2 176 38 266
   000289         029300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2074.2 IMP 184
   000290         029400     GO TO  FAIL-ROUTINE-EX.                                      IC2074.2 296
   000291         029500 FAIL-ROUTINE-WRITE.                                              IC2074.2
   000292         029600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2074.2 64 37 266
   000293         029700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2074.2 114 92
   000294         029800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2074.2 79 37 266
   000295         029900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2074.2 IMP 92
   000296         030000 FAIL-ROUTINE-EX. EXIT.                                           IC2074.2
   000297         030100 BAIL-OUT.                                                        IC2074.2
   000298         030200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2074.2 69 IMP 300
   000299         030300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2074.2 83 IMP 305
   000300         030400 BAIL-OUT-WRITE.                                                  IC2074.2
   000301         030500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2074.2 83 183 69 181
   000302         030600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2074.2 114 184
   000303         030700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2074.2 176 38 266
   000304         030800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2074.2 IMP 184
   000305         030900 BAIL-OUT-EX. EXIT.                                               IC2074.2
   000306         031000 CCVS1-EXIT.                                                      IC2074.2
   000307         031100     EXIT.                                                        IC2074.2
   000308         031200 SECT-IC207-0001 SECTION.                                         IC2074.2
   000309         031300 INIT-PARAGRAPH.                                                  IC2074.2
   000310         031400     MOVE "ABCDEFGHIJKLMNO" TO TABLE-01.                          IC2074.2 45
   000311         031500     SET IN1 TO 3.                                                IC2074.2 49
   000312         031600     SET INDEX-1 TO IN1.                                          IC2074.2 40 49
   000313         031700     MOVE 3 TO DN3.                                               IC2074.2 41
   000314         031800     MOVE SPACE TO TABLE-02.                                      IC2074.2 IMP 50
   000315         031900     CALL ID1 USING TABLE-01, TABLE-02, INDEX-1, DN3.             IC2074.2 42 45 50 40 41
   000316         032000 LINK-TEST-01.                                                    IC2074.2
   000317         032100*            THIS TEST CHECKS THAT AN INDEX DATA ITEM WAS         IC2074.2
   000318         032200*        CORRECTLY PASSED TO A SUBPROGRAM.                        IC2074.2
   000319         032300     MOVE "LINK-TEST-01" TO PAR-NAME.                             IC2074.2 58
   000320         032400     MOVE "INDEX DATA ITEM" TO FEATURE.                           IC2074.2 54
   000321         032500     IF DN2 (1) IS EQUAL TO "C"                                   IC2074.2 51
   000322      1  032600         PERFORM PASS                                             IC2074.2 208
   000323      1  032700         GO TO LINK-WRITE-01.                                     IC2074.2 329
   000324         032800 LINK-FAIL-01.                                                    IC2074.2
   000325         032900     PERFORM FAIL.                                                IC2074.2 209
   000326         033000     MOVE DN2 (1) TO COMPUTED-A.                                  IC2074.2 51 69
   000327         033100     MOVE "C" TO CORRECT-A.                                       IC2074.2 83
   000328         033200     MOVE "VALUE OF DN2(1)" TO RE-MARK.                           IC2074.2 63
   000329         033300 LINK-WRITE-01.                                                   IC2074.2
   000330         033400     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000331         033500 LINK-TEST-02.                                                    IC2074.2
   000332         033600*        THIS TEST VERIFIES THAT THE VARIABLE LENGTH TABLE        IC2074.2
   000333         033700*    AND ITS LENGTH WERE PROCESSED CORRECTLY IN THE SUBPROGRAM.   IC2074.2
   000334         033800     MOVE 1 TO REC-CT.                                            IC2074.2 105
   000335         033900     MOVE "LINK-TEST-02" TO PAR-NAME.                             IC2074.2 58
   000336         034000     MOVE "VAR. LENGTH TABLE" TO FEATURE.                         IC2074.2 54
   000337         034100 LINK-TEST-02-01.                                                 IC2074.2
   000338         034200     IF DN2 (2) EQUAL TO "Z"                                      IC2074.2 51
   000339      1  034300         PERFORM PASS                                             IC2074.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340      1  034400         GO TO LINK-WRITE-02-01.                                  IC2074.2 346
   000341         034500 LINK-FAIL-02-01.                                                 IC2074.2
   000342         034600     PERFORM FAIL.                                                IC2074.2 209
   000343         034700     MOVE DN2 (2) TO COMPUTED-A.                                  IC2074.2 51 69
   000344         034800     MOVE "Z" TO CORRECT-A.                                       IC2074.2 83
   000345         034900     MOVE "VALUE OF DN2(2)" TO RE-MARK.                           IC2074.2 63
   000346         035000 LINK-WRITE-02-01.                                                IC2074.2
   000347         035100     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000348         035200 LINK-TEST-02-02.                                                 IC2074.2
   000349         035300     ADD 1 TO REC-CT.                                             IC2074.2 105
   000350         035400     IF DN2 (3) EQUAL TO "B"                                      IC2074.2 51
   000351      1  035500         PERFORM PASS                                             IC2074.2 208
   000352      1  035600         GO TO LINK-WRITE-02-02.                                  IC2074.2 358
   000353         035700 LINK-FAIL-02-02.                                                 IC2074.2
   000354         035800     PERFORM FAIL.                                                IC2074.2 209
   000355         035900     MOVE DN2 (3) TO COMPUTED-A.                                  IC2074.2 51 69
   000356         036000     MOVE "B" TO CORRECT-A.                                       IC2074.2 83
   000357         036100     MOVE "VALUE OF DN2(3)" TO RE-MARK.                           IC2074.2 63
   000358         036200 LINK-WRITE-02-02.                                                IC2074.2
   000359         036300     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000360         036400 LINK-TEST-02-03.                                                 IC2074.2
   000361         036500     ADD 1 TO REC-CT.                                             IC2074.2 105
   000362         036600     IF DN2 (4) EQUAL TO "X"                                      IC2074.2 51
   000363      1  036700         PERFORM PASS                                             IC2074.2 208
   000364      1  036800         GO TO LINK-WRITE-02-03.                                  IC2074.2 370
   000365         036900 LINK-FAIL-02-03.                                                 IC2074.2
   000366         037000     PERFORM FAIL.                                                IC2074.2 209
   000367         037100     MOVE DN2 (4) TO COMPUTED-A.                                  IC2074.2 51 69
   000368         037200     MOVE "X" TO CORRECT-A.                                       IC2074.2 83
   000369         037300     MOVE "VALUE OF DN2(4)" TO RE-MARK.                           IC2074.2 63
   000370         037400 LINK-WRITE-02-03.                                                IC2074.2
   000371         037500     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000372         037600 LINK-TEST-02-04.                                                 IC2074.2
   000373         037700     ADD 1 TO REC-CT.                                             IC2074.2 105
   000374         037800     IF DN2 (5) EQUAL TO "G"                                      IC2074.2 51
   000375      1  037900         PERFORM PASS                                             IC2074.2 208
   000376      1  038000         GO TO LINK-WRITE-02-04.                                  IC2074.2 382
   000377         038100 LINK-FAIL-02-04.                                                 IC2074.2
   000378         038200     PERFORM FAIL.                                                IC2074.2 209
   000379         038300     MOVE DN2 (5) TO COMPUTED-A.                                  IC2074.2 51 69
   000380         038400     MOVE "G" TO CORRECT-A.                                       IC2074.2 83
   000381         038500     MOVE "VALUE OF DN2(5)" TO RE-MARK.                           IC2074.2 63
   000382         038600 LINK-WRITE-02-04.                                                IC2074.2
   000383         038700     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000384         038800 LINK-TEST-03.                                                    IC2074.2
   000385         038900*        THIS TEST VERIFIES THAT THE CONDITION NAMES DEFINED      IC2074.2
   000386         039000*    IN THE LINKAGE SECTION OF THE SUBPROGRAM WERE PROCESSED      IC2074.2
   000387         039100*    CORRECTLY.                                                   IC2074.2
   000388         039200     MOVE "LINK-TEST-03" TO PAR-NAME.                             IC2074.2 58
   000389         039300     MOVE 1 TO REC-CT.                                            IC2074.2 105
   000390         039400     MOVE "CONDITION NAME" TO FEATURE.                            IC2074.2 54
   000391         039500 LINK-TEST-03-01.                                                 IC2074.2
   000392         039600     IF DN2 (6) EQUAL TO "A"                                      IC2074.2 51
   000393      1  039700         PERFORM PASS                                             IC2074.2 208
   000394      1  039800         GO TO LINK-WRITE-03-01.                                  IC2074.2 400
   000395         039900 LINK-FAIL-03-01.                                                 IC2074.2
   000396         040000     PERFORM FAIL.                                                IC2074.2 209
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     MOVE DN2 (6) TO COMPUTED-A.                                  IC2074.2 51 69
   000398         040200     MOVE "A" TO CORRECT-A.                                       IC2074.2 83
   000399         040300     MOVE "VALUE OF DN2(6)" TO RE-MARK.                           IC2074.2 63
   000400         040400 LINK-WRITE-03-01.                                                IC2074.2
   000401         040500     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000402         040600 LINK-TEST-03-02.                                                 IC2074.2
   000403         040700     ADD 1 TO REC-CT.                                             IC2074.2 105
   000404         040800     IF DN2 (7) EQUAL TO "V"                                      IC2074.2 51
   000405      1  040900         PERFORM PASS                                             IC2074.2 208
   000406      1  041000         GO TO LINK-WRITE-03-02.                                  IC2074.2 412
   000407         041100 LINK-FAIL-03-02.                                                 IC2074.2
   000408         041200     PERFORM FAIL.                                                IC2074.2 209
   000409         041300     MOVE DN2 (7) TO COMPUTED-A.                                  IC2074.2 51 69
   000410         041400     MOVE "V" TO CORRECT-A.                                       IC2074.2 83
   000411         041500     MOVE "VALUE OF DN2(7)" TO RE-MARK.                           IC2074.2 63
   000412         041600 LINK-WRITE-03-02.                                                IC2074.2
   000413         041700     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000414         041800 LINK-TEST-03-03.                                                 IC2074.2
   000415         041900     ADD 1 TO REC-CT.                                             IC2074.2 105
   000416         042000     IF DN2 (8) EQUAL TO "H"                                      IC2074.2 51
   000417      1  042100         PERFORM PASS                                             IC2074.2 208
   000418      1  042200         GO TO LINK-WRITE-03-03.                                  IC2074.2 424
   000419         042300 LINK-FAIL-03-03.                                                 IC2074.2
   000420         042400     PERFORM FAIL.                                                IC2074.2 209
   000421         042500     MOVE DN2 (8) TO COMPUTED-A.                                  IC2074.2 51 69
   000422         042600     MOVE "H" TO CORRECT-A.                                       IC2074.2 83
   000423         042700     MOVE "VALUE OF DN2(8)" TO RE-MARK.                           IC2074.2 63
   000424         042800 LINK-WRITE-03-03.                                                IC2074.2
   000425         042900     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000426         043000 LINK-TEST-04.                                                    IC2074.2
   000427         043100     MOVE "LINK-TEST-04" TO PAR-NAME.                             IC2074.2 58
   000428         043200     MOVE "CALL PARAMETERS" TO FEATURE.                           IC2074.2 54
   000429         043300     MOVE 1 TO REC-CT.                                            IC2074.2 105
   000430         043400*        CHECK THE INDEX DATA ITEM AND TABLE LENGTH WHICH         IC2074.2
   000431         043500*    WERE SET IN THE SUBPROGRAM AND RETURNED CORRECTLY            IC2074.2
   000432         043600*    TO THE CALLING PROGRAM.                                      IC2074.2
   000433         043700 LINK-TEST-04-01.                                                 IC2074.2
   000434         043800     SET IN1 TO INDEX-1.                                          IC2074.2 49 40
   000435         043900     MOVE DN1 (IN1) TO DN4.                                       IC2074.2 46 49 43
   000436         044000     IF DN4 EQUAL TO "B"                                          IC2074.2 43
   000437      1  044100         PERFORM PASS                                             IC2074.2 208
   000438      1  044200         GO TO LINK-WRITE-04-01.                                  IC2074.2 444
   000439         044300 LINK-FAIL-04-01.                                                 IC2074.2
   000440         044400     PERFORM FAIL.                                                IC2074.2 209
   000441         044500     MOVE DN4 TO COMPUTED-A.                                      IC2074.2 43 69
   000442         044600     MOVE "B" TO CORRECT-A.                                       IC2074.2 83
   000443         044700     MOVE "VALUE OF DN1(IN1)" TO RE-MARK.                         IC2074.2 63
   000444         044800 LINK-WRITE-04-01.                                                IC2074.2
   000445         044900     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000446         045000 LINK-TEST-04-02.                                                 IC2074.2
   000447         045100     SET IN1 TO 1.                                                IC2074.2 49
   000448         045200     SEARCH DN1 VARYING IN1                                       IC2074.2 46 49
   000449      1  045300         AT END PERFORM PASS                                      IC2074.2 208
   000450      1  045400                GO TO LINK-WRITE-04-02,                           IC2074.2 455
   000451         045500         WHEN DN1 (IN1) EQUAL TO "J"                              IC2074.2 46 49
   000452      1  045600             PERFORM FAIL                                         IC2074.2 209
   000453      1  045700             MOVE DN1 (IN1) TO COMPUTED-A                         IC2074.2 46 49 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  045800             MOVE "MATCH SHOULD NOT BE FOUND" TO RE-MARK.         IC2074.2 63
   000455         045900 LINK-WRITE-04-02.                                                IC2074.2
   000456         046000     ADD 1 TO REC-CT.                                             IC2074.2 105
   000457         046100     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000458         046200 LINK-TEST-04-03.                                                 IC2074.2
   000459         046300     ADD 1 TO REC-CT.                                             IC2074.2 105
   000460         046400     MOVE TABLE-01 TO DN5.                                        IC2074.2 45 44
   000461         046500     IF DN5 EQUAL TO "ABCDEFGHI      "                            IC2074.2 44
   000462      1  046600         PERFORM PASS                                             IC2074.2 208
   000463      1  046700         GO TO LINK-WRITE-04-03.                                  IC2074.2 469
   000464         046800 LINK-FAIL-04-03.                                                 IC2074.2
   000465         046900     PERFORM FAIL.                                                IC2074.2 209
   000466         047000     MOVE DN5 TO COMPUTED-A.                                      IC2074.2 44 69
   000467         047100     MOVE "ABCDEFGHI      " TO CORRECT-A.                         IC2074.2 83
   000468         047200     MOVE "CONTENTS OF TABLE-01" TO RE-MARK.                      IC2074.2 63
   000469         047300 LINK-WRITE-04-03.                                                IC2074.2
   000470         047400     PERFORM PRINT-DETAIL.                                        IC2074.2 212
   000471         047500 EXIT-IC207.                                                      IC2074.2
   000472         047600     GO TO CCVS-EXIT.                                             IC2074.2 473
   000473         047700 CCVS-EXIT SECTION.                                               IC2074.2
   000474         047800 CCVS-999999.                                                     IC2074.2
   000475         047900     GO TO CLOSE-FILES.                                           IC2074.2 201
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      114   ANSI-REFERENCE . . . . . . . .  286 293 302
       93   CCVS-C-1 . . . . . . . . . . .  230 272
       98   CCVS-C-2 . . . . . . . . . . .  231 273
      148   CCVS-E-1 . . . . . . . . . . .  236
      153   CCVS-E-2 . . . . . . . . . . .  245 252 259 264
      156   CCVS-E-2-2 . . . . . . . . . .  M244
      161   CCVS-E-3 . . . . . . . . . . .  265
      170   CCVS-E-4 . . . . . . . . . . .  244
      171   CCVS-E-4-1 . . . . . . . . . .  M242
      173   CCVS-E-4-2 . . . . . . . . . .  M243
      115   CCVS-H-1 . . . . . . . . . . .  225
      120   CCVS-H-2A. . . . . . . . . . .  226
      129   CCVS-H-2B. . . . . . . . . . .  227
      141   CCVS-H-3 . . . . . . . . . . .  228
      191   CCVS-PGM-ID. . . . . . . . . .  197 197
       75   CM-18V0
       69   COMPUTED-A . . . . . . . . . .  70 72 73 74 75 298 301 M326 M343 M355 M367 M379 M397 M409 M421 M441 M453 M466
       70   COMPUTED-N
       68   COMPUTED-X . . . . . . . . . .  M220 284
       72   COMPUTED-0V18
       74   COMPUTED-14V4
       76   COMPUTED-18V0
       73   COMPUTED-4V14
       92   COR-ANSI-REFERENCE . . . . . .  M293 M295
       83   CORRECT-A. . . . . . . . . . .  84 85 86 87 88 299 301 M327 M344 M356 M368 M380 M398 M410 M422 M442 M467
       84   CORRECT-N
       82   CORRECT-X. . . . . . . . . . .  M221 285
       85   CORRECT-0V18
       87   CORRECT-14V4
       89   CORRECT-18V0
       86   CORRECT-4V14
       88   CR-18V0
      106   DELETE-COUNTER . . . . . . . .  M210 239 255 257
       46   DN1. . . . . . . . . . . . . .  435 448 451 453
       51   DN2. . . . . . . . . . . . . .  321 326 338 343 350 355 362 367 374 379 392 397 404 409 416 421
       41   DN3. . . . . . . . . . . . . .  48 M313 315
       43   DN4. . . . . . . . . . . . . .  M435 436 441
       44   DN5. . . . . . . . . . . . . .  M460 461 466
       61   DOTVALUE . . . . . . . . . . .  M215
      112   DUMMY-HOLD . . . . . . . . . .  M269 275
       38   DUMMY-RECORD . . . . . . . . .  M225 M226 M227 M228 M230 M231 M232 M234 M236 M245 M252 M259 M264 M265 269 M270
                                            271 M272 M273 M274 M275 279 M280 M288 M303
      159   ENDER-DESC . . . . . . . . . .  M247 M258 M263
      107   ERROR-COUNTER. . . . . . . . .  M209 238 248 251
      111   ERROR-HOLD . . . . . . . . . .  M238 M239 M239 M240 243
      157   ERROR-TOTAL. . . . . . . . . .  M249 M251 M256 M257 M261 M262
       54   FEATURE. . . . . . . . . . . .  M320 M336 M390 M428
      185   HYPHEN-LINE. . . . . . . . . .  232 234 274
      151   ID-AGAIN . . . . . . . . . . .  M197
       42   ID1. . . . . . . . . . . . . .  315
       40   INDEX-1. . . . . . . . . . . .  M312 315 434
      184   INF-ANSI-REFERENCE . . . . . .  M286 M289 M302 M304
      179   INFO-TEXT. . . . . . . . . . .  M287
      108   INSPECT-COUNTER. . . . . . . .  M207 238 260 262
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page    13
0 Defined   Cross-reference of data names   References

0      49   IN1. . . . . . . . . . . . . .  M311 312 M434 435 M447 M448 451 453
       56   P-OR-F . . . . . . . . . . . .  M207 M208 M209 M210 217 M220
       58   PAR-NAME . . . . . . . . . . .  M222 M319 M335 M388 M427
       60   PARDOT-X . . . . . . . . . . .  M214
      109   PASS-COUNTER . . . . . . . . .  M208 240 242
       36   PRINT-FILE . . . . . . . . . .  32 196 202
       37   PRINT-REC. . . . . . . . . . .  M216 M292 M294
       63   RE-MARK. . . . . . . . . . . .  M211 M223 M328 M345 M357 M369 M381 M399 M411 M423 M443 M454 M468
      105   REC-CT . . . . . . . . . . . .  213 215 222 M334 M349 M361 M373 M389 M403 M415 M429 M456 M459
      104   REC-SKL-SUB
      113   RECORD-COUNT . . . . . . . . .  M267 268 M276
       45   TABLE-01 . . . . . . . . . . .  M310 315 460
       50   TABLE-02 . . . . . . . . . . .  M314 315
       64   TEST-COMPUTED. . . . . . . . .  292
       79   TEST-CORRECT . . . . . . . . .  294
      132   TEST-ID. . . . . . . . . . . .  M197
       52   TEST-RESULTS . . . . . . . . .  M198 216
      110   TOTAL-ERROR
      181   XXCOMPUTED . . . . . . . . . .  M301
      183   XXCORRECT. . . . . . . . . . .  M301
      176   XXINFO . . . . . . . . . . . .  288 303
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page    14
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

      297   BAIL-OUT . . . . . . . . . . .  P219
      305   BAIL-OUT-EX. . . . . . . . . .  E219 G299
      300   BAIL-OUT-WRITE . . . . . . . .  G298
      281   BLANK-LINE-PRINT
      473   CCVS-EXIT. . . . . . . . . . .  G472
      474   CCVS-999999
      194   CCVS1
      306   CCVS1-EXIT . . . . . . . . . .  G200
      201   CLOSE-FILES. . . . . . . . . .  G475
      229   COLUMN-NAMES-ROUTINE . . . . .  E199
      210   DE-LETE
      233   END-ROUTINE. . . . . . . . . .  P202
      237   END-ROUTINE-1
      246   END-ROUTINE-12
      254   END-ROUTINE-13 . . . . . . . .  E202
      235   END-RTN-EXIT
      471   EXIT-IC207
      209   FAIL . . . . . . . . . . . . .  P325 P342 P354 P366 P378 P396 P408 P420 P440 P452 P465
      283   FAIL-ROUTINE . . . . . . . . .  P218
      296   FAIL-ROUTINE-EX. . . . . . . .  E218 G290
      291   FAIL-ROUTINE-WRITE . . . . . .  G284 G285
      224   HEAD-ROUTINE . . . . . . . . .  P199
      309   INIT-PARAGRAPH
      207   INSPT
      324   LINK-FAIL-01
      341   LINK-FAIL-02-01
      353   LINK-FAIL-02-02
      365   LINK-FAIL-02-03
      377   LINK-FAIL-02-04
      395   LINK-FAIL-03-01
      407   LINK-FAIL-03-02
      419   LINK-FAIL-03-03
      439   LINK-FAIL-04-01
      464   LINK-FAIL-04-03
      316   LINK-TEST-01
      331   LINK-TEST-02
      337   LINK-TEST-02-01
      348   LINK-TEST-02-02
      360   LINK-TEST-02-03
      372   LINK-TEST-02-04
      384   LINK-TEST-03
      391   LINK-TEST-03-01
      402   LINK-TEST-03-02
      414   LINK-TEST-03-03
      426   LINK-TEST-04
      433   LINK-TEST-04-01
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page    15
0 Defined   Cross-reference of procedures   References

0     446   LINK-TEST-04-02
      458   LINK-TEST-04-03
      329   LINK-WRITE-01. . . . . . . . .  G323
      346   LINK-WRITE-02-01 . . . . . . .  G340
      358   LINK-WRITE-02-02 . . . . . . .  G352
      370   LINK-WRITE-02-03 . . . . . . .  G364
      382   LINK-WRITE-02-04 . . . . . . .  G376
      400   LINK-WRITE-03-01 . . . . . . .  G394
      412   LINK-WRITE-03-02 . . . . . . .  G406
      424   LINK-WRITE-03-03 . . . . . . .  G418
      444   LINK-WRITE-04-01 . . . . . . .  G438
      455   LINK-WRITE-04-02 . . . . . . .  G450
      469   LINK-WRITE-04-03 . . . . . . .  G463
      195   OPEN-FILES
      208   PASS . . . . . . . . . . . . .  P322 P339 P351 P363 P375 P393 P405 P417 P437 P449 P462
      212   PRINT-DETAIL . . . . . . . . .  P330 P347 P359 P371 P383 P401 P413 P425 P445 P457 P470
      308   SECT-IC207-0001
      205   TERMINATE-CALL
      203   TERMINATE-CCVS
      266   WRITE-LINE . . . . . . . . . .  P216 P217 P225 P226 P227 P228 P230 P231 P232 P234 P236 P245 P253 P259 P264 P265
                                            P288 P292 P294 P303
      278   WRT-LN . . . . . . . . . . . .  P272 P273 P274 P277 P282
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page    16
0 Defined   Cross-reference of programs     References

        3   IC207A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC207A    Date 06/04/2022  Time 11:58:26   Page    17
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC207A:
 *    Source records = 475
 *    Data Division statements = 72
 *    Procedure Division statements = 244
 *    Generated COBOL statements = 0
 *    Program complexity factor = 252
0End of compilation 1,  program IC207A,  highest severity 0.
0Return code 0
