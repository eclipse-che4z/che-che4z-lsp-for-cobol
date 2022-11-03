1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:30   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:30   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2444.2
   000002         000200 PROGRAM-ID.                                                      NC2444.2
   000003         000300     NC244A.                                                      NC2444.2
   000004         000500*                                                              *  NC2444.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2444.2
   000006         000700*                                                              *  NC2444.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2444.2
   000008         000900*                                                              *  NC2444.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2444.2
   000010         001100*                                                              *  NC2444.2
   000011         001300*                                                              *  NC2444.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2444.2
   000013         001500*                                                              *  NC2444.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2444.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2444.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2444.2
   000017         001900*                                                              *  NC2444.2
   000018         002100*                                                              *  NC2444.2
   000019         002200*    PROGRAM NCC244A TESTS THE CONSTRUCTION  AND ACCESS OF A   *  NC2444.2
   000020         002300*    TWO-DIMENSIONAL TABLE WHICH HAS MULTIPLE INDICES.         *  NC2444.2
   000021         002400*    RELATIVE INDEXING AND FORMATS 1 AND 2 OF THE "SET"        *  NC2444.2
   000022         002500*    STATEMENT ARE USED.                                       *  NC2444.2
   000023         002600*                                                              *  NC2444.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2444.2
   000025         002900 CONFIGURATION SECTION.                                           NC2444.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2444.2
   000027         003100     XXXXX082.                                                    NC2444.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2444.2
   000029         003300     XXXXX083.                                                    NC2444.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2444.2
   000031         003500 FILE-CONTROL.                                                    NC2444.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2444.2 36
   000033         003700     XXXXX055.                                                    NC2444.2
   000034         003800 DATA DIVISION.                                                   NC2444.2
   000035         003900 FILE SECTION.                                                    NC2444.2
   000036         004000 FD  PRINT-FILE.                                                  NC2444.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2444.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2444.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2444.2
   000040         004400 77  SUB-COMP1    PICTURE S9     VALUE 3    COMPUTATIONAL.        NC2444.2
   000041         004500 77  SUB-COMP2    PICTURE S9(10) VALUE 1    COMPUTATIONAL.        NC2444.2
   000042         004600 77  SUB-COMP3    PICTURE S9(18) VALUE 49   COMPUTATIONAL.        NC2444.2
   000043         004700 77  SUB-COMP4    PICTURE 9      VALUE 3    COMPUTATIONAL.        NC2444.2
   000044         004800 77  SUB-COMP5    PICTURE 9(10)  VALUE 1    COMPUTATIONAL.        NC2444.2
   000045         004900 77  SUB-COMP6    PICTURE 9(18)  VALUE 9    COMPUTATIONAL.        NC2444.2
   000046         005000 77  SUB-7        PICTURE 99  VALUE 20.                           NC2444.2
   000047         005100 77  SUB-8        PICTURE 99 VALUE 01.                            NC2444.2
   000048         005200 77  SUB-9        PICTURE 99  VALUE 10.                           NC2444.2
   000049         005300 77  IN-SERT     PICTURE AA  VALUE "AA".                          NC2444.2
   000050         005400 77  ENTRY-HOLD  PICTURE XX  VALUE SPACES.                        NC2444.2 IMP
   000051         005500 01  IDX-HOLD.                                                    NC2444.2
   000052         005600     02  IDX-3HOLD PICTURE 9(6)  VALUE 0.                         NC2444.2
   000053         005700     02  FILLER    PICTURE X(8)  VALUE SPACES.                    NC2444.2 IMP
   000054         005800     02  IDX-14HOLD PICTURE 9(6) VALUE 0.                         NC2444.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 01  TWO-DIMENSION-TABLE.                                         NC2444.2
   000056         006000     02  GRP-ENTRY OCCURS 50 INDEXED IDX-1 IDX-2 IDX-3 IDX-4      NC2444.2
   000057         006100         IDX-5.                                                   NC2444.2
   000058         006200         03  ENTRY-1  PICTURE 99.                                 NC2444.2
   000059         006300         03  ELEM-ENTRY OCCURS 10 TIMES INDEXED BY IDX-6 IDX-7    NC2444.2
   000060         006400             IDX-8 IDX-9 IDX-10 IDX-11 IDX-12 IDX-13 IDX-14       NC2444.2
   000061         006500             IDX-15.                                              NC2444.2
   000062         006600             04  ENTRY-2 PICTURE XX.                              NC2444.2
   000063         006700 01  TEST-RESULTS.                                                NC2444.2
   000064         006800     02 FILLER                   PIC X      VALUE SPACE.          NC2444.2 IMP
   000065         006900     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2444.2 IMP
   000066         007000     02 FILLER                   PIC X      VALUE SPACE.          NC2444.2 IMP
   000067         007100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2444.2 IMP
   000068         007200     02 FILLER                   PIC X      VALUE SPACE.          NC2444.2 IMP
   000069         007300     02  PAR-NAME.                                                NC2444.2
   000070         007400       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2444.2 IMP
   000071         007500       03  PARDOT-X              PIC X      VALUE SPACE.          NC2444.2 IMP
   000072         007600       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2444.2 IMP
   000073         007700     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2444.2 IMP
   000074         007800     02 RE-MARK                  PIC X(61).                       NC2444.2
   000075         007900 01  TEST-COMPUTED.                                               NC2444.2
   000076         008000     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2444.2 IMP
   000077         008100     02 FILLER                   PIC X(17)  VALUE                 NC2444.2
   000078         008200            "       COMPUTED=".                                   NC2444.2
   000079         008300     02 COMPUTED-X.                                               NC2444.2
   000080         008400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2444.2 IMP
   000081         008500     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2444.2 80
   000082         008600                                 PIC -9(9).9(9).                  NC2444.2
   000083         008700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2444.2 80
   000084         008800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2444.2 80
   000085         008900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2444.2 80
   000086         009000     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2444.2 80
   000087         009100         04 COMPUTED-18V0                    PIC -9(18).          NC2444.2
   000088         009200         04 FILLER                           PIC X.               NC2444.2
   000089         009300     03 FILLER PIC X(50) VALUE SPACE.                             NC2444.2 IMP
   000090         009400 01  TEST-CORRECT.                                                NC2444.2
   000091         009500     02 FILLER PIC X(30) VALUE SPACE.                             NC2444.2 IMP
   000092         009600     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2444.2
   000093         009700     02 CORRECT-X.                                                NC2444.2
   000094         009800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2444.2 IMP
   000095         009900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2444.2 94
   000096         010000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2444.2 94
   000097         010100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2444.2 94
   000098         010200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2444.2 94
   000099         010300     03      CR-18V0 REDEFINES CORRECT-A.                         NC2444.2 94
   000100         010400         04 CORRECT-18V0                     PIC -9(18).          NC2444.2
   000101         010500         04 FILLER                           PIC X.               NC2444.2
   000102         010600     03 FILLER PIC X(2) VALUE SPACE.                              NC2444.2 IMP
   000103         010700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2444.2 IMP
   000104         010800 01  CCVS-C-1.                                                    NC2444.2
   000105         010900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2444.2
   000106         011000-    "SS  PARAGRAPH-NAME                                          NC2444.2
   000107         011100-    "       REMARKS".                                            NC2444.2
   000108         011200     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2444.2 IMP
   000109         011300 01  CCVS-C-2.                                                    NC2444.2
   000110         011400     02 FILLER                     PIC X        VALUE SPACE.      NC2444.2 IMP
   000111         011500     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2444.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2444.2 IMP
   000113         011700     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2444.2
   000114         011800     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2444.2 IMP
   000115         011900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2444.2 IMP
   000116         012000 01  REC-CT                        PIC 99       VALUE ZERO.       NC2444.2 IMP
   000117         012100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2444.2 IMP
   000118         012200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2444.2 IMP
   000119         012300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2444.2 IMP
   000120         012400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2444.2 IMP
   000121         012500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2444.2 IMP
   000122         012600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2444.2 IMP
   000123         012700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2444.2 IMP
   000124         012800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2444.2 IMP
   000125         012900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2444.2 IMP
   000126         013000 01  CCVS-H-1.                                                    NC2444.2
   000127         013100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2444.2 IMP
   000128         013200     02  FILLER                    PIC X(42)    VALUE             NC2444.2
   000129         013300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2444.2
   000130         013400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2444.2 IMP
   000131         013500 01  CCVS-H-2A.                                                   NC2444.2
   000132         013600   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2444.2 IMP
   000133         013700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2444.2
   000134         013800   02  FILLER                        PIC XXXX   VALUE             NC2444.2
   000135         013900     "4.2 ".                                                      NC2444.2
   000136         014000   02  FILLER                        PIC X(28)  VALUE             NC2444.2
   000137         014100            " COPY - NOT FOR DISTRIBUTION".                       NC2444.2
   000138         014200   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2444.2 IMP
   000139         014300                                                                  NC2444.2
   000140         014400 01  CCVS-H-2B.                                                   NC2444.2
   000141         014500   02  FILLER                        PIC X(15)  VALUE             NC2444.2
   000142         014600            "TEST RESULT OF ".                                    NC2444.2
   000143         014700   02  TEST-ID                       PIC X(9).                    NC2444.2
   000144         014800   02  FILLER                        PIC X(4)   VALUE             NC2444.2
   000145         014900            " IN ".                                               NC2444.2
   000146         015000   02  FILLER                        PIC X(12)  VALUE             NC2444.2
   000147         015100     " HIGH       ".                                              NC2444.2
   000148         015200   02  FILLER                        PIC X(22)  VALUE             NC2444.2
   000149         015300            " LEVEL VALIDATION FOR ".                             NC2444.2
   000150         015400   02  FILLER                        PIC X(58)  VALUE             NC2444.2
   000151         015500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2444.2
   000152         015600 01  CCVS-H-3.                                                    NC2444.2
   000153         015700     02  FILLER                      PIC X(34)  VALUE             NC2444.2
   000154         015800            " FOR OFFICIAL USE ONLY    ".                         NC2444.2
   000155         015900     02  FILLER                      PIC X(58)  VALUE             NC2444.2
   000156         016000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2444.2
   000157         016100     02  FILLER                      PIC X(28)  VALUE             NC2444.2
   000158         016200            "  COPYRIGHT   1985 ".                                NC2444.2
   000159         016300 01  CCVS-E-1.                                                    NC2444.2
   000160         016400     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2444.2 IMP
   000161         016500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2444.2
   000162         016600     02 ID-AGAIN                     PIC X(9).                    NC2444.2
   000163         016700     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2444.2 IMP
   000164         016800 01  CCVS-E-2.                                                    NC2444.2
   000165         016900     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2444.2 IMP
   000166         017000     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2444.2 IMP
   000167         017100     02 CCVS-E-2-2.                                               NC2444.2
   000168         017200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2444.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300         03 FILLER                   PIC X      VALUE SPACE.      NC2444.2 IMP
   000170         017400         03 ENDER-DESC               PIC X(44)  VALUE             NC2444.2
   000171         017500            "ERRORS ENCOUNTERED".                                 NC2444.2
   000172         017600 01  CCVS-E-3.                                                    NC2444.2
   000173         017700     02  FILLER                      PIC X(22)  VALUE             NC2444.2
   000174         017800            " FOR OFFICIAL USE ONLY".                             NC2444.2
   000175         017900     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2444.2 IMP
   000176         018000     02  FILLER                      PIC X(58)  VALUE             NC2444.2
   000177         018100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2444.2
   000178         018200     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2444.2 IMP
   000179         018300     02 FILLER                       PIC X(15)  VALUE             NC2444.2
   000180         018400             " COPYRIGHT 1985".                                   NC2444.2
   000181         018500 01  CCVS-E-4.                                                    NC2444.2
   000182         018600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2444.2 IMP
   000183         018700     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2444.2
   000184         018800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2444.2 IMP
   000185         018900     02 FILLER                       PIC X(40)  VALUE             NC2444.2
   000186         019000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2444.2
   000187         019100 01  XXINFO.                                                      NC2444.2
   000188         019200     02 FILLER                       PIC X(19)  VALUE             NC2444.2
   000189         019300            "*** INFORMATION ***".                                NC2444.2
   000190         019400     02 INFO-TEXT.                                                NC2444.2
   000191         019500       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2444.2 IMP
   000192         019600       04 XXCOMPUTED                 PIC X(20).                   NC2444.2
   000193         019700       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2444.2 IMP
   000194         019800       04 XXCORRECT                  PIC X(20).                   NC2444.2
   000195         019900     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2444.2
   000196         020000 01  HYPHEN-LINE.                                                 NC2444.2
   000197         020100     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2444.2 IMP
   000198         020200     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2444.2
   000199         020300-    "*****************************************".                 NC2444.2
   000200         020400     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2444.2
   000201         020500-    "******************************".                            NC2444.2
   000202         020600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2444.2
   000203         020700     "NC244A".                                                    NC2444.2
   000204         020800 PROCEDURE DIVISION.                                              NC2444.2
   000205         020900 CCVS1 SECTION.                                                   NC2444.2
   000206         021000 OPEN-FILES.                                                      NC2444.2
   000207         021100     OPEN     OUTPUT PRINT-FILE.                                  NC2444.2 36
   000208         021200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2444.2 202 143 202 162
   000209         021300     MOVE    SPACE TO TEST-RESULTS.                               NC2444.2 IMP 63
   000210         021400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2444.2 235 240
   000211         021500     GO TO CCVS1-EXIT.                                            NC2444.2 317
   000212         021600 CLOSE-FILES.                                                     NC2444.2
   000213         021700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2444.2 244 265 36
   000214         021800 TERMINATE-CCVS.                                                  NC2444.2
   000215         021900     EXIT PROGRAM.                                                NC2444.2
   000216         022000 TERMINATE-CALL.                                                  NC2444.2
   000217         022100     STOP     RUN.                                                NC2444.2
   000218         022200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2444.2 67 119
   000219         022300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2444.2 67 120
   000220         022400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2444.2 67 118
   000221         022500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2444.2 67 117
   000222         022600     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2444.2 74
   000223         022700 PRINT-DETAIL.                                                    NC2444.2
   000224         022800     IF REC-CT NOT EQUAL TO ZERO                                  NC2444.2 116 IMP
   000225      1  022900             MOVE "." TO PARDOT-X                                 NC2444.2 71
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  023000             MOVE REC-CT TO DOTVALUE.                             NC2444.2 116 72
   000227         023100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2444.2 63 37 277
   000228         023200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2444.2 67 277
   000229      1  023300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2444.2 294 307
   000230      1  023400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2444.2 308 316
   000231         023500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2444.2 IMP 67 IMP 79
   000232         023600     MOVE SPACE TO CORRECT-X.                                     NC2444.2 IMP 93
   000233         023700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2444.2 116 IMP IMP 69
   000234         023800     MOVE     SPACE TO RE-MARK.                                   NC2444.2 IMP 74
   000235         023900 HEAD-ROUTINE.                                                    NC2444.2
   000236         024000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2444.2 126 38 277
   000237         024100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2444.2 131 38 277
   000238         024200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2444.2 140 38 277
   000239         024300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2444.2 152 38 277
   000240         024400 COLUMN-NAMES-ROUTINE.                                            NC2444.2
   000241         024500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2444.2 104 38 277
   000242         024600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2444.2 109 38 277
   000243         024700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2444.2 196 38 277
   000244         024800 END-ROUTINE.                                                     NC2444.2
   000245         024900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2444.2 196 38 277
   000246         025000 END-RTN-EXIT.                                                    NC2444.2
   000247         025100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2444.2 159 38 277
   000248         025200 END-ROUTINE-1.                                                   NC2444.2
   000249         025300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2444.2 118 122 119
   000250         025400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2444.2 122 117 122
   000251         025500      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2444.2 120 122
   000252         025600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2444.2
   000253         025700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2444.2 120 182
   000254         025800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2444.2 122 184
   000255         025900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2444.2 181 167
   000256         026000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2444.2 164 38 277
   000257         026100  END-ROUTINE-12.                                                 NC2444.2
   000258         026200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2444.2 170
   000259         026300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2444.2 118 IMP
   000260      1  026400         MOVE "NO " TO ERROR-TOTAL                                NC2444.2 168
   000261         026500         ELSE                                                     NC2444.2
   000262      1  026600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2444.2 118 168
   000263         026700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2444.2 164 38
   000264         026800     PERFORM WRITE-LINE.                                          NC2444.2 277
   000265         026900 END-ROUTINE-13.                                                  NC2444.2
   000266         027000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2444.2 117 IMP
   000267      1  027100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2444.2 168
   000268      1  027200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2444.2 117 168
   000269         027300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2444.2 170
   000270         027400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2444.2 164 38 277
   000271         027500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2444.2 119 IMP
   000272      1  027600          MOVE "NO " TO ERROR-TOTAL                               NC2444.2 168
   000273      1  027700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2444.2 119 168
   000274         027800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2444.2 170
   000275         027900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2444.2 164 38 277
   000276         028000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2444.2 172 38 277
   000277         028100 WRITE-LINE.                                                      NC2444.2
   000278         028200     ADD 1 TO RECORD-COUNT.                                       NC2444.2 124
   000279         028300     IF RECORD-COUNT GREATER 50                                   NC2444.2 124
   000280      1  028400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2444.2 38 123
   000281      1  028500         MOVE SPACE TO DUMMY-RECORD                               NC2444.2 IMP 38
   000282      1  028600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2444.2 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2444.2 104 38 289
   000284      1  028800         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2444.2 109 38 289
   000285      1  028900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2444.2 196 38 289
   000286      1  029000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2444.2 123 38
   000287      1  029100         MOVE ZERO TO RECORD-COUNT.                               NC2444.2 IMP 124
   000288         029200     PERFORM WRT-LN.                                              NC2444.2 289
   000289         029300 WRT-LN.                                                          NC2444.2
   000290         029400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2444.2 38
   000291         029500     MOVE SPACE TO DUMMY-RECORD.                                  NC2444.2 IMP 38
   000292         029600 BLANK-LINE-PRINT.                                                NC2444.2
   000293         029700     PERFORM WRT-LN.                                              NC2444.2 289
   000294         029800 FAIL-ROUTINE.                                                    NC2444.2
   000295         029900     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2444.2 79 IMP 302
   000296         030000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2444.2 93 IMP 302
   000297         030100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2444.2 125 195
   000298         030200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2444.2 190
   000299         030300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2444.2 187 38 277
   000300         030400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2444.2 IMP 195
   000301         030500     GO TO  FAIL-ROUTINE-EX.                                      NC2444.2 307
   000302         030600 FAIL-ROUTINE-WRITE.                                              NC2444.2
   000303         030700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2444.2 75 37 277
   000304         030800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2444.2 125 103
   000305         030900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2444.2 90 37 277
   000306         031000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2444.2 IMP 103
   000307         031100 FAIL-ROUTINE-EX. EXIT.                                           NC2444.2
   000308         031200 BAIL-OUT.                                                        NC2444.2
   000309         031300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2444.2 80 IMP 311
   000310         031400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2444.2 94 IMP 316
   000311         031500 BAIL-OUT-WRITE.                                                  NC2444.2
   000312         031600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2444.2 94 194 80 192
   000313         031700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2444.2 125 195
   000314         031800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2444.2 187 38 277
   000315         031900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2444.2 IMP 195
   000316         032000 BAIL-OUT-EX. EXIT.                                               NC2444.2
   000317         032100 CCVS1-EXIT.                                                      NC2444.2
   000318         032200     EXIT.                                                        NC2444.2
   000319         032300 SECT-NC244A-001 SECTION.                                         NC2444.2
   000320         032400 TH-18-001.                                                       NC2444.2
   000321         032500 BUILD-2DEM-TABLE.                                                NC2444.2

 ==000321==> IGYPS2015-I The paragraph or section prior to paragraph or section "BUILD-2DEM-TABLE"
                         did not contain any statements.

   000322         032600     SET IDX-1  IDX-2  IDX-3  IDX-4  IDX-5  IDX-6  IDX-7  IDX-8   NC2444.2 56 56 56 56 57 59 59 60
   000323         032700         IDX-9  IDX-10 TO 01.                                     NC2444.2 60 60
   000324         032800     SET IDX-11  IDX-12  IDX-13  IDX-14  IDX-15 TO 01.            NC2444.2 60 60 60 60 61
   000325         032900 BUILD-LEVEL-1.                                                   NC2444.2
   000326         033000     SET ENTRY-1 (IDX-5) TO IDX-5.                                NC2444.2 58 57 57
   000327         033100     IF IDX-5 EQUAL TO 6 MOVE "BB" TO IN-SERT GO TO BUILD-ENTRY.  NC2444.2 57 49 336
   000328         033200     IF IDX-5 EQUAL TO 11 MOVE "CC" TO IN-SERT GO TO BUILD-ENTRY. NC2444.2 57 49 336
   000329         033300     IF IDX-5 EQUAL TO 16 MOVE "DD" TO IN-SERT GO TO BUILD-ENTRY. NC2444.2 57 49 336
   000330         033400     IF IDX-5 EQUAL TO 21 MOVE "EE" TO IN-SERT GO TO BUILD-ENTRY. NC2444.2 57 49 336
   000331         033500     IF IDX-5 EQUAL TO 26 MOVE "FF" TO IN-SERT GO TO BUILD-ENTRY. NC2444.2 57 49 336
   000332         033600     IF IDX-5 EQUAL TO 31 MOVE "GG" TO IN-SERT GO TO BUILD-ENTRY. NC2444.2 57 49 336
   000333         033700     IF IDX-5 EQUAL TO 36 MOVE "HH" TO IN-SERT GO TO BUILD-ENTRY. NC2444.2 57 49 336
   000334         033800     IF IDX-5 EQUAL TO 41 MOVE "II" TO IN-SERT GO TO BUILD-ENTRY. NC2444.2 57 49 336
   000335         033900     IF IDX-5 EQUAL TO 46 MOVE "JJ" TO IN-SERT.                   NC2444.2 57 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000336         034000 BUILD-ENTRY.                                                     NC2444.2
   000337         034100     MOVE IN-SERT TO ENTRY-2 (IDX-5, IDX-15).                     NC2444.2 49 62 57 61
   000338         034200     IF IDX-15 EQUAL TO 10 AND IDX-5 EQUAL TO 50                  NC2444.2 61 57
   000339      1  034300         GO TO BUILD-EXIT.                                        NC2444.2 346
   000340         034400     IF IDX-15 EQUAL TO 10                                        NC2444.2 61
   000341      1  034500         SET IDX-15 TO 01                                         NC2444.2 61
   000342      1  034600         SET IDX-5 UP BY 1                                        NC2444.2 57
   000343      1  034700         GO TO BUILD-LEVEL-1.                                     NC2444.2 325
   000344         034800     SET IDX-15 UP BY 01.                                         NC2444.2 61
   000345         034900     GO TO BUILD-ENTRY.                                           NC2444.2 336
   000346         035000 BUILD-EXIT.                                                      NC2444.2
   000347         035100     EXIT.                                                        NC2444.2
   000348         035200 TABLE-CHECKING SECTION.                                          NC2444.2
   000349         035300*                                                                 NC2444.2
   000350         035400 IDX-INIT-F1-1.                                                   NC2444.2
   000351         035500     MOVE "IDX-TEST-F1-1" TO PAR-NAME.                            NC2444.2 69
   000352         035600     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2444.2 125
   000353         035700     MOVE "RELATIVE INDEXING   " TO FEATURE.                      NC2444.2 65
   000354         035800 IDX-TEST-F1-1.                                                   NC2444.2
   000355         035900     SET IDX-4  IDX-14 TO SUB-COMP2.                              NC2444.2 56 60 41
   000356         036000     IF ENTRY-2 (IDX-4 + 49, IDX-14 + 9) EQUAL TO "JJ"            NC2444.2 62 56 60
   000357      1  036100         PERFORM PASS                                             NC2444.2 219
   000358      1  036200         GO TO IDX-WRITE-F1-1                                     NC2444.2 368
   000359         036300     ELSE                                                         NC2444.2
   000360      1  036400         GO TO IDX-FAIL-F1-1.                                     NC2444.2 364
   000361         036500 IDX-DELETE-F1-1.                                                 NC2444.2
   000362         036600     PERFORM DE-LETE.                                             NC2444.2 221
   000363         036700     GO TO IDX-WRITE-F1-1.                                        NC2444.2 368
   000364         036800 IDX-FAIL-F1-1.                                                   NC2444.2
   000365         036900     MOVE ENTRY-2 (IDX-4 + 49, IDX-14 + 9) TO COMPUTED-A.         NC2444.2 62 56 60 80
   000366         037000     MOVE "JJ" TO CORRECT-A.                                      NC2444.2 94
   000367         037100     PERFORM FAIL.                                                NC2444.2 220
   000368         037200 IDX-WRITE-F1-1.                                                  NC2444.2
   000369         037300     PERFORM PRINT-DETAIL.                                        NC2444.2 223
   000370         037400*                                                                 NC2444.2
   000371         037500 IDX-INIT-F2-2.                                                   NC2444.2
   000372         037600     MOVE "IDX-TEST-F2-2" TO PAR-NAME.                            NC2444.2 69
   000373         037700     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2444.2 125
   000374         037800     MOVE "SET DN BY COMP ITEM " TO FEATURE.                      NC2444.2 65
   000375         037900 IDX-TEST-F2-2.                                                   NC2444.2
   000376         038000     SET IDX-3 TO SUB-COMP3.                                      NC2444.2 56 42
   000377         038100     SET IDX-3 DOWN BY SUB-7.                                     NC2444.2 56 46
   000378         038200     IF ENTRY-1 (IDX-3) EQUAL TO 29                               NC2444.2 58 56
   000379      1  038300         PERFORM PASS                                             NC2444.2 219
   000380      1  038400         GO TO IDX-WRITE-F2-2                                     NC2444.2 390
   000381         038500     ELSE                                                         NC2444.2
   000382      1  038600         GO TO IDX-FAIL-F2-2.                                     NC2444.2 386
   000383         038700 IDX-DELETE-F2-2.                                                 NC2444.2
   000384         038800     PERFORM DE-LETE.                                             NC2444.2 221
   000385         038900     GO TO IDX-WRITE-F2-2.                                        NC2444.2 390
   000386         039000 IDX-FAIL-F2-2.                                                   NC2444.2
   000387         039100     MOVE ENTRY-1 (IDX-3) TO COMPUTED-N.                          NC2444.2 58 56 81
   000388         039200     MOVE 29 TO CORRECT-N.                                        NC2444.2 95
   000389         039300     PERFORM FAIL.                                                NC2444.2 220
   000390         039400 IDX-WRITE-F2-2.                                                  NC2444.2
   000391         039500     PERFORM PRINT-DETAIL.                                        NC2444.2 223
   000392         039600*                                                                 NC2444.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393         039700 IDX-INIT-F2-3.                                                   NC2444.2
   000394         039800     MOVE "IDX-TEST-F2-3" TO PAR-NAME.                            NC2444.2 69
   000395         039900     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2444.2 125
   000396         040000     MOVE "SET UP BY COMP ITEM " TO FEATURE.                      NC2444.2 65
   000397         040100 IDX-TEST-F2-3.                                                   NC2444.2
   000398         040200     SET IDX-2 TO SUB-COMP6.                                      NC2444.2 56 45
   000399         040300     SET IDX-2 UP BY SUB-COMP1.                                   NC2444.2 56 40
   000400         040400     IF ENTRY-1 (IDX-2) EQUAL TO 12                               NC2444.2 58 56
   000401      1  040500         PERFORM PASS                                             NC2444.2 219
   000402      1  040600         GO TO IDX-WRITE-F2-3                                     NC2444.2 412
   000403         040700     ELSE                                                         NC2444.2
   000404      1  040800         GO TO IDX-FAIL-F2-3.                                     NC2444.2 408
   000405         040900 IDX-DELETE-F2-3.                                                 NC2444.2
   000406         041000     PERFORM DE-LETE.                                             NC2444.2 221
   000407         041100     GO TO IDX-WRITE-F2-3.                                        NC2444.2 412
   000408         041200 IDX-FAIL-F2-3.                                                   NC2444.2
   000409         041300     MOVE ENTRY-1 (IDX-2) TO COMPUTED-N.                          NC2444.2 58 56 81
   000410         041400     MOVE 12 TO CORRECT-N.                                        NC2444.2 95
   000411         041500     PERFORM FAIL.                                                NC2444.2 220
   000412         041600 IDX-WRITE-F2-3.                                                  NC2444.2
   000413         041700     PERFORM PRINT-DETAIL.                                        NC2444.2 223
   000414         041800*                                                                 NC2444.2
   000415         041900 IDX-INIT-F2-4.                                                   NC2444.2
   000416         042000     MOVE "IDX-TEST-F2-4" TO PAR-NAME.                            NC2444.2 69
   000417         042100     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2444.2 125
   000418         042200     MOVE "MULT OPERND SET STMT" TO FEATURE.                      NC2444.2 65
   000419         042300     GO TO IDX-TEST-F2-4.                                         NC2444.2 425
   000420         042400 TEST-4.                                                          NC2444.2
   000421         042500     SET IDX-1  IDX-6 DOWN BY SUB-COMP5.                          NC2444.2 56 59 44
   000422         042600     MOVE ENTRY-2 (IDX-1, IDX-6) TO ENTRY-HOLD.                   NC2444.2 62 56 59 50
   000423         042700 TEST-4EXIT.                                                      NC2444.2
   000424         042800     EXIT.                                                        NC2444.2
   000425         042900 IDX-TEST-F2-4.                                                   NC2444.2
   000426         043000     SET IDX-1 TO SUB-COMP3.                                      NC2444.2 56 42
   000427         043100     SET IDX-6 TO SUB-9.                                          NC2444.2 59 48
   000428         043200     PERFORM TEST-4 THRU TEST-4EXIT UNTIL                         NC2444.2 420 423
   000429         043300                ENTRY-2 (IDX-1, IDX-6) EQUAL TO "II".             NC2444.2 62 56 59
   000430         043400     IF ENTRY-HOLD EQUAL TO "II"                                  NC2444.2 50
   000431      1  043500         PERFORM PASS                                             NC2444.2 219
   000432      1  043600         GO TO IDX-WRITE-F2-4                                     NC2444.2 441
   000433         043700     ELSE                                                         NC2444.2
   000434      1  043800         GO TO IDX-FAIL-F2-4.                                     NC2444.2 438
   000435         043900 IDX-DELETE-F2-4.                                                 NC2444.2
   000436         044000     PERFORM DE-LETE.                                             NC2444.2 221
   000437         044100     GO TO IDX-WRITE-F2-4.                                        NC2444.2 441
   000438         044200 IDX-FAIL-F2-4.                                                   NC2444.2
   000439         044300     MOVE ENTRY-HOLD TO COMPUTED-A.                               NC2444.2 50 80
   000440         044400     MOVE "II" TO CORRECT-A.                                      NC2444.2 94
   000441         044500 IDX-WRITE-F2-4.                                                  NC2444.2
   000442         044600     PERFORM PRINT-DETAIL.                                        NC2444.2 223
   000443         044700*                                                                 NC2444.2
   000444         044800 IDX-INIT-F2-5.                                                   NC2444.2
   000445         044900     MOVE "IDX-TEST-F2-5" TO PAR-NAME.                            NC2444.2 69
   000446         045000     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2444.2 125
   000447         045100     MOVE "PFM VARYNG COMP ITEM" TO FEATURE.                      NC2444.2 65
   000448         045200     MOVE SPACES TO ENTRY-HOLD.                                   NC2444.2 IMP 50
   000449         045300     GO TO IDX-TEST-F2-5.                                         NC2444.2 454
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045400 TEST-5.                                                          NC2444.2
   000451         045500     SET IDX-3 TO SUB-COMP2.                                      NC2444.2 56 41
   000452         045600     SET IDX-14 TO SUB-COMP5.                                     NC2444.2 60 44
   000453         045700     MOVE ENTRY-2 (IDX-3, IDX-14) TO ENTRY-HOLD.                  NC2444.2 62 56 60 50
   000454         045800 IDX-TEST-F2-5.                                                   NC2444.2
   000455         045900     SET IDX-3, IDX-14 TO 01.                                     NC2444.2 56 60
   000456         046000     PERFORM TEST-5                                               NC2444.2 450
   000457         046100             VARYING SUB-COMP5 FROM 1 BY SUB-8                    NC2444.2 44 47
   000458         046200             UNTIL ENTRY-2 (IDX-3, IDX-14) EQUAL TO "JJ"          NC2444.2 62 56 60
   000459         046300                OR IDX-14 EQUAL TO 10                             NC2444.2 60
   000460         046400             AFTER SUB-COMP2 FROM 1 BY 1                          NC2444.2 41
   000461         046500             UNTIL ENTRY-1 (IDX-3) EQUAL TO 46.                   NC2444.2 58 56
   000462         046600     IF ENTRY-HOLD EQUAL TO "JJ"                                  NC2444.2 50
   000463      1  046700         PERFORM PASS                                             NC2444.2 219
   000464      1  046800         GO TO IDX-WRITE-F2-5                                     NC2444.2 481
   000465         046900     ELSE                                                         NC2444.2
   000466      1  047000         GO TO IDX-FAIL-F2-5.                                     NC2444.2 477
   000467         047100 IDX-DELETE-F2-5.                                                 NC2444.2
   000468         047200     PERFORM DE-LETE.                                             NC2444.2 221
   000469         047300     MOVE "IDX-TEST-F2-5" TO PAR-NAME.                            NC2444.2 69
   000470         047400     MOVE  "PFM VARYING COMP ITEM" TO FEATURE.                    NC2444.2 65
   000471         047500     PERFORM PRINT-DETAIL.                                        NC2444.2 223
   000472         047600*    NOTE IF THIS TEST IS DELETED TEST-6 WILL ALSO BE DELETED.    NC2444.2
   000473         047700     PERFORM DE-LETE.                                             NC2444.2 221
   000474         047800     MOVE "IDX-TEST-F2-6" TO PAR-NAME.                            NC2444.2 69
   000475         047900     PERFORM PRINT-DETAIL.                                        NC2444.2 223
   000476         048000     GO TO CLOSE-FILES.                                           NC2444.2 212
   000477         048100 IDX-FAIL-F2-5.                                                   NC2444.2
   000478         048200     MOVE "JJ" TO CORRECT-A.                                      NC2444.2 94
   000479         048300     MOVE ENTRY-HOLD TO COMPUTED-A.                               NC2444.2 50 80
   000480         048400     PERFORM FAIL.                                                NC2444.2 220
   000481         048500 IDX-WRITE-F2-5.                                                  NC2444.2
   000482         048600     PERFORM PRINT-DETAIL.                                        NC2444.2 223
   000483         048700*                                                                 NC2444.2
   000484         048800 IDX-INIT-F2-6.                                                   NC2444.2
   000485         048900     MOVE "IDX-TEST-F2-6" TO PAR-NAME.                            NC2444.2 69
   000486         049000     MOVE "VI-126 6.22.2" TO ANSI-REFERENCE.                      NC2444.2 125
   000487         049100 IDX-TEST-F2-6.                                                   NC2444.2
   000488         049200     IF IDX-3 EQUAL TO 46 AND IDX-14 EQUAL TO 01                  NC2444.2 56 60
   000489      1  049300         PERFORM PASS                                             NC2444.2 219
   000490      1  049400         GO TO IDX-WRITE-F2-6                                     NC2444.2 503
   000491         049500     ELSE                                                         NC2444.2
   000492      1  049600         GO TO IDX-FAIL-F2-6.                                     NC2444.2 496
   000493         049700 IDX-DELETE-F2-6.                                                 NC2444.2
   000494         049800     PERFORM DE-LETE.                                             NC2444.2 221
   000495         049900     GO TO IDX-WRITE-F2-6.                                        NC2444.2 503
   000496         050000 IDX-FAIL-F2-6.                                                   NC2444.2
   000497         050100     SET IDX-3HOLD TO IDX-3.                                      NC2444.2 52 56
   000498         050200     SET IDX-14HOLD TO IDX-14.                                    NC2444.2 54 60
   000499         050300     MOVE IDX-HOLD TO COMPUTED-A.                                 NC2444.2 51 80
   000500         050400     PERFORM FAIL.                                                NC2444.2 220
   000501         050500     MOVE "000046        000001" TO CORRECT-A.                    NC2444.2 94
   000502         050600     MOVE "COMPARE INDEXES OF TEST-5" TO RE-MARK.                 NC2444.2 74
   000503         050700 IDX-WRITE-F2-6.                                                  NC2444.2
   000504         050800     PERFORM PRINT-DETAIL.                                        NC2444.2 223
   000505         050900 CCVS-EXIT SECTION.                                               NC2444.2
   000506         051000 CCVS-999999.                                                     NC2444.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051100     GO TO CLOSE-FILES.                                           NC2444.2 212
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page    13
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      125   ANSI-REFERENCE . . . . . . . .  297 304 313 M352 M373 M395 M417 M446 M486
      104   CCVS-C-1 . . . . . . . . . . .  241 283
      109   CCVS-C-2 . . . . . . . . . . .  242 284
      159   CCVS-E-1 . . . . . . . . . . .  247
      164   CCVS-E-2 . . . . . . . . . . .  256 263 270 275
      167   CCVS-E-2-2 . . . . . . . . . .  M255
      172   CCVS-E-3 . . . . . . . . . . .  276
      181   CCVS-E-4 . . . . . . . . . . .  255
      182   CCVS-E-4-1 . . . . . . . . . .  M253
      184   CCVS-E-4-2 . . . . . . . . . .  M254
      126   CCVS-H-1 . . . . . . . . . . .  236
      131   CCVS-H-2A. . . . . . . . . . .  237
      140   CCVS-H-2B. . . . . . . . . . .  238
      152   CCVS-H-3 . . . . . . . . . . .  239
      202   CCVS-PGM-ID. . . . . . . . . .  208 208
       86   CM-18V0
       80   COMPUTED-A . . . . . . . . . .  81 83 84 85 86 309 312 M365 M439 M479 M499
       81   COMPUTED-N . . . . . . . . . .  M387 M409
       79   COMPUTED-X . . . . . . . . . .  M231 295
       83   COMPUTED-0V18
       85   COMPUTED-14V4
       87   COMPUTED-18V0
       84   COMPUTED-4V14
      103   COR-ANSI-REFERENCE . . . . . .  M304 M306
       94   CORRECT-A. . . . . . . . . . .  95 96 97 98 99 310 312 M366 M440 M478 M501
       95   CORRECT-N. . . . . . . . . . .  M388 M410
       93   CORRECT-X. . . . . . . . . . .  M232 296
       96   CORRECT-0V18
       98   CORRECT-14V4
      100   CORRECT-18V0
       97   CORRECT-4V14
       99   CR-18V0
      117   DELETE-COUNTER . . . . . . . .  M221 250 266 268
       72   DOTVALUE . . . . . . . . . . .  M226
      123   DUMMY-HOLD . . . . . . . . . .  M280 286
       38   DUMMY-RECORD . . . . . . . . .  M236 M237 M238 M239 M241 M242 M243 M245 M247 M256 M263 M270 M275 M276 280 M281
                                            282 M283 M284 M285 M286 290 M291 M299 M314
       59   ELEM-ENTRY
      170   ENDER-DESC . . . . . . . . . .  M258 M269 M274
       50   ENTRY-HOLD . . . . . . . . . .  M422 430 439 M448 M453 462 479
       58   ENTRY-1. . . . . . . . . . . .  M326 378 387 400 409 461
       62   ENTRY-2. . . . . . . . . . . .  M337 356 365 422 429 453 458
      118   ERROR-COUNTER. . . . . . . . .  M220 249 259 262
      122   ERROR-HOLD . . . . . . . . . .  M249 M250 M250 M251 254
      168   ERROR-TOTAL. . . . . . . . . .  M260 M262 M267 M268 M272 M273
       65   FEATURE. . . . . . . . . . . .  M353 M374 M396 M418 M447 M470
       56   GRP-ENTRY
      196   HYPHEN-LINE. . . . . . . . . .  243 245 285
      162   ID-AGAIN . . . . . . . . . . .  M208
       51   IDX-HOLD . . . . . . . . . . .  499
       56   IDX-1. . . . . . . . . . . . .  M322 M421 422 M426 429
       60   IDX-10 . . . . . . . . . . . .  M323
       60   IDX-11 . . . . . . . . . . . .  M324
       60   IDX-12 . . . . . . . . . . . .  M324
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page    14
0 Defined   Cross-reference of data names   References

0      60   IDX-13 . . . . . . . . . . . .  M324
       60   IDX-14 . . . . . . . . . . . .  M324 M355 356 365 M452 453 M455 458 459 488 498
       54   IDX-14HOLD . . . . . . . . . .  M498
       61   IDX-15 . . . . . . . . . . . .  M324 337 338 340 M341 M344
       56   IDX-2. . . . . . . . . . . . .  M322 M398 M399 400 409
       56   IDX-3. . . . . . . . . . . . .  M322 M376 M377 378 387 M451 453 M455 458 461 488 497
       52   IDX-3HOLD. . . . . . . . . . .  M497
       56   IDX-4. . . . . . . . . . . . .  M322 M355 356 365
       57   IDX-5. . . . . . . . . . . . .  M322 326 326 327 328 329 330 331 332 333 334 335 337 338 M342
       59   IDX-6. . . . . . . . . . . . .  M322 M421 422 M427 429
       59   IDX-7. . . . . . . . . . . . .  M322
       60   IDX-8. . . . . . . . . . . . .  M322
       60   IDX-9. . . . . . . . . . . . .  M323
       49   IN-SERT. . . . . . . . . . . .  M327 M328 M329 M330 M331 M332 M333 M334 M335 337
      195   INF-ANSI-REFERENCE . . . . . .  M297 M300 M313 M315
      190   INFO-TEXT. . . . . . . . . . .  M298
      119   INSPECT-COUNTER. . . . . . . .  M218 249 271 273
       67   P-OR-F . . . . . . . . . . . .  M218 M219 M220 M221 228 M231
       69   PAR-NAME . . . . . . . . . . .  M233 M351 M372 M394 M416 M445 M469 M474 M485
       71   PARDOT-X . . . . . . . . . . .  M225
      120   PASS-COUNTER . . . . . . . . .  M219 251 253
       36   PRINT-FILE . . . . . . . . . .  32 207 213
       37   PRINT-REC. . . . . . . . . . .  M227 M303 M305
       74   RE-MARK. . . . . . . . . . . .  M222 M234 M502
      116   REC-CT . . . . . . . . . . . .  224 226 233
      115   REC-SKL-SUB
      124   RECORD-COUNT . . . . . . . . .  M278 279 M287
       40   SUB-COMP1. . . . . . . . . . .  399
       41   SUB-COMP2. . . . . . . . . . .  355 451 M460
       42   SUB-COMP3. . . . . . . . . . .  376 426
       43   SUB-COMP4
       44   SUB-COMP5. . . . . . . . . . .  421 452 M457
       45   SUB-COMP6. . . . . . . . . . .  398
       46   SUB-7. . . . . . . . . . . . .  377
       47   SUB-8. . . . . . . . . . . . .  457
       48   SUB-9. . . . . . . . . . . . .  427
       75   TEST-COMPUTED. . . . . . . . .  303
       90   TEST-CORRECT . . . . . . . . .  305
      143   TEST-ID. . . . . . . . . . . .  M208
       63   TEST-RESULTS . . . . . . . . .  M209 227
      121   TOTAL-ERROR
       55   TWO-DIMENSION-TABLE
      192   XXCOMPUTED . . . . . . . . . .  M312
      194   XXCORRECT. . . . . . . . . . .  M312
      187   XXINFO . . . . . . . . . . . .  299 314
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page    15
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

      308   BAIL-OUT . . . . . . . . . . .  P230
      316   BAIL-OUT-EX. . . . . . . . . .  E230 G310
      311   BAIL-OUT-WRITE . . . . . . . .  G309
      292   BLANK-LINE-PRINT
      336   BUILD-ENTRY. . . . . . . . . .  G327 G328 G329 G330 G331 G332 G333 G334 G345
      346   BUILD-EXIT . . . . . . . . . .  G339
      325   BUILD-LEVEL-1. . . . . . . . .  G343
      321   BUILD-2DEM-TABLE
      505   CCVS-EXIT
      506   CCVS-999999
      205   CCVS1
      317   CCVS1-EXIT . . . . . . . . . .  G211
      212   CLOSE-FILES. . . . . . . . . .  G476 G507
      240   COLUMN-NAMES-ROUTINE . . . . .  E210
      221   DE-LETE. . . . . . . . . . . .  P362 P384 P406 P436 P468 P473 P494
      244   END-ROUTINE. . . . . . . . . .  P213
      248   END-ROUTINE-1
      257   END-ROUTINE-12
      265   END-ROUTINE-13 . . . . . . . .  E213
      246   END-RTN-EXIT
      220   FAIL . . . . . . . . . . . . .  P367 P389 P411 P480 P500
      294   FAIL-ROUTINE . . . . . . . . .  P229
      307   FAIL-ROUTINE-EX. . . . . . . .  E229 G301
      302   FAIL-ROUTINE-WRITE . . . . . .  G295 G296
      235   HEAD-ROUTINE . . . . . . . . .  P210
      361   IDX-DELETE-F1-1
      383   IDX-DELETE-F2-2
      405   IDX-DELETE-F2-3
      435   IDX-DELETE-F2-4
      467   IDX-DELETE-F2-5
      493   IDX-DELETE-F2-6
      364   IDX-FAIL-F1-1. . . . . . . . .  G360
      386   IDX-FAIL-F2-2. . . . . . . . .  G382
      408   IDX-FAIL-F2-3. . . . . . . . .  G404
      438   IDX-FAIL-F2-4. . . . . . . . .  G434
      477   IDX-FAIL-F2-5. . . . . . . . .  G466
      496   IDX-FAIL-F2-6. . . . . . . . .  G492
      350   IDX-INIT-F1-1
      371   IDX-INIT-F2-2
      393   IDX-INIT-F2-3
      415   IDX-INIT-F2-4
      444   IDX-INIT-F2-5
      484   IDX-INIT-F2-6
      354   IDX-TEST-F1-1
      375   IDX-TEST-F2-2
      397   IDX-TEST-F2-3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page    16
0 Defined   Cross-reference of procedures   References

0     425   IDX-TEST-F2-4. . . . . . . . .  G419
      454   IDX-TEST-F2-5. . . . . . . . .  G449
      487   IDX-TEST-F2-6
      368   IDX-WRITE-F1-1 . . . . . . . .  G358 G363
      390   IDX-WRITE-F2-2 . . . . . . . .  G380 G385
      412   IDX-WRITE-F2-3 . . . . . . . .  G402 G407
      441   IDX-WRITE-F2-4 . . . . . . . .  G432 G437
      481   IDX-WRITE-F2-5 . . . . . . . .  G464
      503   IDX-WRITE-F2-6 . . . . . . . .  G490 G495
      218   INSPT
      206   OPEN-FILES
      219   PASS . . . . . . . . . . . . .  P357 P379 P401 P431 P463 P489
      223   PRINT-DETAIL . . . . . . . . .  P369 P391 P413 P442 P471 P475 P482 P504
      319   SECT-NC244A-001
      348   TABLE-CHECKING
      216   TERMINATE-CALL
      214   TERMINATE-CCVS
      420   TEST-4 . . . . . . . . . . . .  P428
      423   TEST-4EXIT . . . . . . . . . .  E428
      450   TEST-5 . . . . . . . . . . . .  P456
      320   TH-18-001
      277   WRITE-LINE . . . . . . . . . .  P227 P228 P236 P237 P238 P239 P241 P242 P243 P245 P247 P256 P264 P270 P275 P276
                                            P299 P303 P305 P314
      289   WRT-LN . . . . . . . . . . . .  P283 P284 P285 P288 P293
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page    17
0 Defined   Cross-reference of programs     References

        3   NC244A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC244A    Date 06/04/2022  Time 11:57:30   Page    18
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    321  IGYPS2015-I   The paragraph or section prior to paragraph or section "BUILD-2DEM-TABLE" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC244A:
 *    Source records = 507
 *    Data Division statements = 82
 *    Procedure Division statements = 271
 *    Generated COBOL statements = 0
 *    Program complexity factor = 282
0End of compilation 1,  program NC244A,  highest severity 0.
0Return code 0
