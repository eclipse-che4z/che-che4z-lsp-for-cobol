1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:16   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:16   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1354.2
   000002         000200 PROGRAM-ID.                                                      NC1354.2
   000003         000300     NC135A.                                                      NC1354.2
   000004         000500*                                                              *  NC1354.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1354.2
   000006         000700*                                                              *  NC1354.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1354.2
   000008         000900*                                                              *  NC1354.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1354.2
   000010         001100*                                                              *  NC1354.2
   000011         001300*                                                              *  NC1354.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1354.2
   000013         001500*                                                              *  NC1354.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1354.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1354.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1354.2
   000017         001900*                                                              *  NC1354.2
   000018         002100*                                                                 NC1354.2
   000019         002200*     PROGRAM NC135A TESTS THE USE OF INDEX-NAMES TO REFERENCE    NC1354.2
   000020         002300*     3 DIMENSIONAL TABLE WHICH HAS BEEN REDEFINED.               NC1354.2
   000021         002400*     FORMAT 2 OF THE SET STATEMENT AND RELATIVE INDEXING ARE     NC1354.2
   000022         002500*     ALSO TESTED.                                                NC1354.2
   000023         002600*                                                                 NC1354.2
   000024         002700 ENVIRONMENT DIVISION.                                            NC1354.2
   000025         002800 CONFIGURATION SECTION.                                           NC1354.2
   000026         002900 SOURCE-COMPUTER.                                                 NC1354.2
   000027         003000     XXXXX082.                                                    NC1354.2
   000028         003100 OBJECT-COMPUTER.                                                 NC1354.2
   000029         003200     XXXXX083.                                                    NC1354.2
   000030         003300 INPUT-OUTPUT SECTION.                                            NC1354.2
   000031         003400 FILE-CONTROL.                                                    NC1354.2
   000032         003500     SELECT PRINT-FILE ASSIGN TO                                  NC1354.2 36
   000033         003600     XXXXX055.                                                    NC1354.2
   000034         003700 DATA DIVISION.                                                   NC1354.2
   000035         003800 FILE SECTION.                                                    NC1354.2
   000036         003900 FD  PRINT-FILE.                                                  NC1354.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000 01  PRINT-REC PICTURE X(120).                                    NC1354.2
   000038         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC1354.2
   000039         004200 WORKING-STORAGE SECTION.                                         NC1354.2
   000040         004300 77  ONE PICTURE 999 VALUE IS 001.                                NC1354.2
   000041         004400 77  CTR-1 PICTURE 999 VALUE IS ZERO.                             NC1354.2 IMP
   000042         004500 77  W-3 PICTURE 999 VALUE ZERO.                                  NC1354.2 IMP
   000043         004600 01  IDEN-1 PICTURE 99 VALUE 03.                                  NC1354.2
   000044         004700 01  TABLE-9.                                                     NC1354.2
   000045         004800     02 TABLE-8 OCCURS 10 TIMES INDEXED BY INXEX1.                NC1354.2
   000046         004900     03 TABLE-7 OCCURS 10 TIMES INDEXED BY INXEX2.                NC1354.2
   000047         005000     04 TABLE-1 PICTURE 999 OCCURS 3 TIMES INDEXED BY INXEX3.     NC1354.2
   000048         005100 01  TABLE-6 REDEFINES TABLE-9.                                   NC1354.2 44
   000049         005200     02 TABLE-5 OCCURS 10 TIMES.                                  NC1354.2
   000050         005300     03 TABLE-4 OCCURS 10 TIMES.                                  NC1354.2
   000051         005400     04 TABLE-2 PICTURE 999 OCCURS 3 TIMES.                       NC1354.2
   000052         005500 01  NUMBER-LIST.                                                 NC1354.2
   000053         005600     02  FILLER PICTURE IS X VALUE IS SPACE.                      NC1354.2 IMP
   000054         005700     02 LINE-1 OCCURS 20 TIMES.                                   NC1354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800       03 BLANKSPACE PICTURE IS XX.                               NC1354.2
   000056         005900       03 PRINT-ELE PICTURE IS 999.                               NC1354.2
   000057         006000 01  DATA-NAMES USAGE IS INDEX.                                   NC1354.2
   000058         006100     02 KEY-1.                                                    NC1354.2
   000059         006200     02 KEY-2.                                                    NC1354.2
   000060         006300     02 KEY-3.                                                    NC1354.2
   000061         006400 01  TEST-RESULTS.                                                NC1354.2
   000062         006500     02 FILLER                   PIC X      VALUE SPACE.          NC1354.2 IMP
   000063         006600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1354.2 IMP
   000064         006700     02 FILLER                   PIC X      VALUE SPACE.          NC1354.2 IMP
   000065         006800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1354.2 IMP
   000066         006900     02 FILLER                   PIC X      VALUE SPACE.          NC1354.2 IMP
   000067         007000     02  PAR-NAME.                                                NC1354.2
   000068         007100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1354.2 IMP
   000069         007200       03  PARDOT-X              PIC X      VALUE SPACE.          NC1354.2 IMP
   000070         007300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1354.2 IMP
   000071         007400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1354.2 IMP
   000072         007500     02 RE-MARK                  PIC X(61).                       NC1354.2
   000073         007600 01  TEST-COMPUTED.                                               NC1354.2
   000074         007700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1354.2 IMP
   000075         007800     02 FILLER                   PIC X(17)  VALUE                 NC1354.2
   000076         007900            "       COMPUTED=".                                   NC1354.2
   000077         008000     02 COMPUTED-X.                                               NC1354.2
   000078         008100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1354.2 IMP
   000079         008200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1354.2 78
   000080         008300                                 PIC -9(9).9(9).                  NC1354.2
   000081         008400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1354.2 78
   000082         008500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1354.2 78
   000083         008600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1354.2 78
   000084         008700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1354.2 78
   000085         008800         04 COMPUTED-18V0                    PIC -9(18).          NC1354.2
   000086         008900         04 FILLER                           PIC X.               NC1354.2
   000087         009000     03 FILLER PIC X(50) VALUE SPACE.                             NC1354.2 IMP
   000088         009100 01  TEST-CORRECT.                                                NC1354.2
   000089         009200     02 FILLER PIC X(30) VALUE SPACE.                             NC1354.2 IMP
   000090         009300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1354.2
   000091         009400     02 CORRECT-X.                                                NC1354.2
   000092         009500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1354.2 IMP
   000093         009600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1354.2 92
   000094         009700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1354.2 92
   000095         009800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1354.2 92
   000096         009900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1354.2 92
   000097         010000     03      CR-18V0 REDEFINES CORRECT-A.                         NC1354.2 92
   000098         010100         04 CORRECT-18V0                     PIC -9(18).          NC1354.2
   000099         010200         04 FILLER                           PIC X.               NC1354.2
   000100         010300     03 FILLER PIC X(2) VALUE SPACE.                              NC1354.2 IMP
   000101         010400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1354.2 IMP
   000102         010500 01  CCVS-C-1.                                                    NC1354.2
   000103         010600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1354.2
   000104         010700-    "SS  PARAGRAPH-NAME                                          NC1354.2
   000105         010800-    "       REMARKS".                                            NC1354.2
   000106         010900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1354.2 IMP
   000107         011000 01  CCVS-C-2.                                                    NC1354.2
   000108         011100     02 FILLER                     PIC X        VALUE SPACE.      NC1354.2 IMP
   000109         011200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1354.2
   000110         011300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1354.2 IMP
   000111         011400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1354.2 IMP
   000113         011600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1354.2 IMP
   000114         011700 01  REC-CT                        PIC 99       VALUE ZERO.       NC1354.2 IMP
   000115         011800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1354.2 IMP
   000116         011900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1354.2 IMP
   000117         012000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1354.2 IMP
   000118         012100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1354.2 IMP
   000119         012200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1354.2 IMP
   000120         012300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1354.2 IMP
   000121         012400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1354.2 IMP
   000122         012500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1354.2 IMP
   000123         012600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1354.2 IMP
   000124         012700 01  CCVS-H-1.                                                    NC1354.2
   000125         012800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1354.2 IMP
   000126         012900     02  FILLER                    PIC X(42)    VALUE             NC1354.2
   000127         013000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1354.2
   000128         013100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1354.2 IMP
   000129         013200 01  CCVS-H-2A.                                                   NC1354.2
   000130         013300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1354.2 IMP
   000131         013400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1354.2
   000132         013500   02  FILLER                        PIC XXXX   VALUE             NC1354.2
   000133         013600     "4.2 ".                                                      NC1354.2
   000134         013700   02  FILLER                        PIC X(28)  VALUE             NC1354.2
   000135         013800            " COPY - NOT FOR DISTRIBUTION".                       NC1354.2
   000136         013900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1354.2 IMP
   000137         014000                                                                  NC1354.2
   000138         014100 01  CCVS-H-2B.                                                   NC1354.2
   000139         014200   02  FILLER                        PIC X(15)  VALUE             NC1354.2
   000140         014300            "TEST RESULT OF ".                                    NC1354.2
   000141         014400   02  TEST-ID                       PIC X(9).                    NC1354.2
   000142         014500   02  FILLER                        PIC X(4)   VALUE             NC1354.2
   000143         014600            " IN ".                                               NC1354.2
   000144         014700   02  FILLER                        PIC X(12)  VALUE             NC1354.2
   000145         014800     " HIGH       ".                                              NC1354.2
   000146         014900   02  FILLER                        PIC X(22)  VALUE             NC1354.2
   000147         015000            " LEVEL VALIDATION FOR ".                             NC1354.2
   000148         015100   02  FILLER                        PIC X(58)  VALUE             NC1354.2
   000149         015200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1354.2
   000150         015300 01  CCVS-H-3.                                                    NC1354.2
   000151         015400     02  FILLER                      PIC X(34)  VALUE             NC1354.2
   000152         015500            " FOR OFFICIAL USE ONLY    ".                         NC1354.2
   000153         015600     02  FILLER                      PIC X(58)  VALUE             NC1354.2
   000154         015700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1354.2
   000155         015800     02  FILLER                      PIC X(28)  VALUE             NC1354.2
   000156         015900            "  COPYRIGHT   1985 ".                                NC1354.2
   000157         016000 01  CCVS-E-1.                                                    NC1354.2
   000158         016100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1354.2 IMP
   000159         016200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1354.2
   000160         016300     02 ID-AGAIN                     PIC X(9).                    NC1354.2
   000161         016400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1354.2 IMP
   000162         016500 01  CCVS-E-2.                                                    NC1354.2
   000163         016600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1354.2 IMP
   000164         016700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1354.2 IMP
   000165         016800     02 CCVS-E-2-2.                                               NC1354.2
   000166         016900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1354.2 IMP
   000167         017000         03 FILLER                   PIC X      VALUE SPACE.      NC1354.2 IMP
   000168         017100         03 ENDER-DESC               PIC X(44)  VALUE             NC1354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200            "ERRORS ENCOUNTERED".                                 NC1354.2
   000170         017300 01  CCVS-E-3.                                                    NC1354.2
   000171         017400     02  FILLER                      PIC X(22)  VALUE             NC1354.2
   000172         017500            " FOR OFFICIAL USE ONLY".                             NC1354.2
   000173         017600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1354.2 IMP
   000174         017700     02  FILLER                      PIC X(58)  VALUE             NC1354.2
   000175         017800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1354.2
   000176         017900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1354.2 IMP
   000177         018000     02 FILLER                       PIC X(15)  VALUE             NC1354.2
   000178         018100             " COPYRIGHT 1985".                                   NC1354.2
   000179         018200 01  CCVS-E-4.                                                    NC1354.2
   000180         018300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1354.2 IMP
   000181         018400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1354.2
   000182         018500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1354.2 IMP
   000183         018600     02 FILLER                       PIC X(40)  VALUE             NC1354.2
   000184         018700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1354.2
   000185         018800 01  XXINFO.                                                      NC1354.2
   000186         018900     02 FILLER                       PIC X(19)  VALUE             NC1354.2
   000187         019000            "*** INFORMATION ***".                                NC1354.2
   000188         019100     02 INFO-TEXT.                                                NC1354.2
   000189         019200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1354.2 IMP
   000190         019300       04 XXCOMPUTED                 PIC X(20).                   NC1354.2
   000191         019400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1354.2 IMP
   000192         019500       04 XXCORRECT                  PIC X(20).                   NC1354.2
   000193         019600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1354.2
   000194         019700 01  HYPHEN-LINE.                                                 NC1354.2
   000195         019800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1354.2 IMP
   000196         019900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1354.2
   000197         020000-    "*****************************************".                 NC1354.2
   000198         020100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1354.2
   000199         020200-    "******************************".                            NC1354.2
   000200         020300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1354.2
   000201         020400     "NC135A".                                                    NC1354.2
   000202         020500 PROCEDURE DIVISION.                                              NC1354.2
   000203         020600 CCVS1 SECTION.                                                   NC1354.2
   000204         020700 OPEN-FILES.                                                      NC1354.2
   000205         020800     OPEN     OUTPUT PRINT-FILE.                                  NC1354.2 36
   000206         020900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1354.2 200 141 200 160
   000207         021000     MOVE    SPACE TO TEST-RESULTS.                               NC1354.2 IMP 61
   000208         021100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1354.2 233 238
   000209         021200     GO TO CCVS1-EXIT.                                            NC1354.2 320
   000210         021300 CLOSE-FILES.                                                     NC1354.2
   000211         021400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1354.2 242 263 36
   000212         021500 TERMINATE-CCVS.                                                  NC1354.2
   000213         021600     EXIT PROGRAM.                                                NC1354.2
   000214         021700 TERMINATE-CALL.                                                  NC1354.2
   000215         021800     STOP     RUN.                                                NC1354.2
   000216         021900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1354.2 65 117
   000217         022000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1354.2 65 118
   000218         022100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1354.2 65 116
   000219         022200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1354.2 65 115
   000220         022300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1354.2 72
   000221         022400 PRINT-DETAIL.                                                    NC1354.2
   000222         022500     IF REC-CT NOT EQUAL TO ZERO                                  NC1354.2 114 IMP
   000223      1  022600             MOVE "." TO PARDOT-X                                 NC1354.2 69
   000224      1  022700             MOVE REC-CT TO DOTVALUE.                             NC1354.2 114 70
   000225         022800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1354.2 61 37 275
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1354.2 65 275
   000227      1  023000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1354.2 296 310
   000228      1  023100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1354.2 311 319
   000229         023200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1354.2 IMP 65 IMP 77
   000230         023300     MOVE SPACE TO CORRECT-X.                                     NC1354.2 IMP 91
   000231         023400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1354.2 114 IMP IMP 67
   000232         023500     MOVE     SPACE TO RE-MARK.                                   NC1354.2 IMP 72
   000233         023600 HEAD-ROUTINE.                                                    NC1354.2
   000234         023700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1354.2 124 38 275
   000235         023800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1354.2 129 38 275
   000236         023900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1354.2 138 38 275
   000237         024000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1354.2 150 38 275
   000238         024100 COLUMN-NAMES-ROUTINE.                                            NC1354.2
   000239         024200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1354.2 102 38 275
   000240         024300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1354.2 107 38 275
   000241         024400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1354.2 194 38 275
   000242         024500 END-ROUTINE.                                                     NC1354.2
   000243         024600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1354.2 194 38 275
   000244         024700 END-RTN-EXIT.                                                    NC1354.2
   000245         024800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1354.2 157 38 275
   000246         024900 END-ROUTINE-1.                                                   NC1354.2
   000247         025000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1354.2 116 120 117
   000248         025100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1354.2 120 115 120
   000249         025200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1354.2 118 120
   000250         025300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1354.2
   000251         025400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1354.2 118 180
   000252         025500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1354.2 120 182
   000253         025600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1354.2 179 165
   000254         025700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1354.2 162 38 275
   000255         025800  END-ROUTINE-12.                                                 NC1354.2
   000256         025900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1354.2 168
   000257         026000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1354.2 116 IMP
   000258      1  026100         MOVE "NO " TO ERROR-TOTAL                                NC1354.2 166
   000259         026200         ELSE                                                     NC1354.2
   000260      1  026300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1354.2 116 166
   000261         026400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1354.2 162 38
   000262         026500     PERFORM WRITE-LINE.                                          NC1354.2 275
   000263         026600 END-ROUTINE-13.                                                  NC1354.2
   000264         026700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1354.2 115 IMP
   000265      1  026800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1354.2 166
   000266      1  026900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1354.2 115 166
   000267         027000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1354.2 168
   000268         027100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1354.2 162 38 275
   000269         027200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1354.2 117 IMP
   000270      1  027300          MOVE "NO " TO ERROR-TOTAL                               NC1354.2 166
   000271      1  027400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1354.2 117 166
   000272         027500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1354.2 168
   000273         027600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1354.2 162 38 275
   000274         027700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1354.2 170 38 275
   000275         027800 WRITE-LINE.                                                      NC1354.2
   000276         027900     ADD 1 TO RECORD-COUNT.                                       NC1354.2 122
   000277         028000     IF RECORD-COUNT GREATER 42                                   NC1354.2 122
   000278      1  028100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1354.2 38 121
   000279      1  028200         MOVE SPACE TO DUMMY-RECORD                               NC1354.2 IMP 38
   000280      1  028300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1354.2 38
   000281      1  028400         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1354.2 124 38 291
   000282      1  028500         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1354.2 129 38 291
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028600         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1354.2 138 38 291
   000284      1  028700         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1354.2 150 38 291
   000285      1  028800         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1354.2 102 38 291
   000286      1  028900         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1354.2 107 38 291
   000287      1  029000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1354.2 194 38 291
   000288      1  029100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1354.2 121 38
   000289      1  029200         MOVE ZERO TO RECORD-COUNT.                               NC1354.2 IMP 122
   000290         029300     PERFORM WRT-LN.                                              NC1354.2 291
   000291         029400 WRT-LN.                                                          NC1354.2
   000292         029500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1354.2 38
   000293         029600     MOVE SPACE TO DUMMY-RECORD.                                  NC1354.2 IMP 38
   000294         029700 BLANK-LINE-PRINT.                                                NC1354.2
   000295         029800     PERFORM WRT-LN.                                              NC1354.2 291
   000296         029900 FAIL-ROUTINE.                                                    NC1354.2
   000297         030000     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1354.2 77 IMP
   000298      1  030100            GO TO FAIL-ROUTINE-WRITE.                             NC1354.2 305
   000299         030200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1354.2 91 IMP 305
   000300         030300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1354.2 123 193
   000301         030400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1354.2 188
   000302         030500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1354.2 185 38 275
   000303         030600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1354.2 IMP 193
   000304         030700     GO TO  FAIL-ROUTINE-EX.                                      NC1354.2 310
   000305         030800 FAIL-ROUTINE-WRITE.                                              NC1354.2
   000306         030900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1354.2 73 37 275
   000307         031000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1354.2 123 101
   000308         031100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1354.2 88 37 275
   000309         031200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1354.2 IMP 101
   000310         031300 FAIL-ROUTINE-EX. EXIT.                                           NC1354.2
   000311         031400 BAIL-OUT.                                                        NC1354.2
   000312         031500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1354.2 78 IMP 314
   000313         031600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1354.2 92 IMP 319
   000314         031700 BAIL-OUT-WRITE.                                                  NC1354.2
   000315         031800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1354.2 92 192 78 190
   000316         031900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1354.2 123 193
   000317         032000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1354.2 185 38 275
   000318         032100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1354.2 IMP 193
   000319         032200 BAIL-OUT-EX. EXIT.                                               NC1354.2
   000320         032300 CCVS1-EXIT.                                                      NC1354.2
   000321         032400     EXIT.                                                        NC1354.2
   000322         032500 SECT-NC135A-001 SECTION.                                         NC1354.2
   000323         032600 PARAGRAPH-NAME-4.                                                NC1354.2
   000324         032700     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC1354.2 123
   000325         032800     SET INXEX1  INXEX2 INXEX3 TO 001.                            NC1354.2 45 46 47
   000326         032900     MOVE 001 TO W-3.                                             NC1354.2 42
   000327         033000 PARAGRAPH-NAME-5.                                                NC1354.2
   000328         033100     MOVE W-3 TO TABLE-1 (INXEX1  INXEX2  INXEX3).                NC1354.2 42 47 45 46 47
   000329         033200     ADD 01 TO W-3.                                               NC1354.2 42
   000330         033300     IF       INXEX3 EQUAL TO 3                                   NC1354.2 47
   000331      1  033400              GO TO PARAGRAPH-NAME-6.                             NC1354.2 334
   000332         033500     SET INXEX3 UP BY 1.                                          NC1354.2 47
   000333         033600     GO TO PARAGRAPH-NAME-5.                                      NC1354.2 327
   000334         033700 PARAGRAPH-NAME-6.                                                NC1354.2
   000335         033800     SET     INXEX3 TO 1                                          NC1354.2 47
   000336         033900     IF       INXEX2 EQUAL TO 10                                  NC1354.2 46
   000337      1  034000                  GO TO PARAGRAPH-NAME-7.                         NC1354.2 340
   000338         034100     SET INXEX2 UP BY 001.                                        NC1354.2 46
   000339         034200     GO TO PARAGRAPH-NAME-5.                                      NC1354.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300 PARAGRAPH-NAME-7.                                                NC1354.2
   000341         034400     SET     INXEX2 TO 1                                          NC1354.2 46
   000342         034500     IF       INXEX1 EQUAL TO 10                                  NC1354.2 45
   000343      1  034600               GO TO PARAGRAPH-NAME-8.                            NC1354.2 348
   000344         034700     SET INXEX1 UP BY 001.                                        NC1354.2 45
   000345         034800     GO TO PARAGRAPH-NAME-5.                                      NC1354.2 327
   000346         034900*    THIS SECTION GENERATES VALUES FOR A 10X10X3 TABLE            NC1354.2
   000347         035000*    AND THE TABLE IS USED IN THE TESTS IN THIS ROUTINE.          NC1354.2
   000348         035100 PARAGRAPH-NAME-8.                                                NC1354.2
   000349         035200     EXIT.                                                        NC1354.2
   000350         035300 SECTION-NAME-2 SECTION.                                          NC1354.2
   000351         035400 PARAGRAPH-NAME-9.                                                NC1354.2
   000352         035500*                                                                 NC1354.2
   000353         035600     MOVE SPACE TO COMPUTED-A  CORRECT-A.                         NC1354.2 IMP 78 92
   000354         035700     MOVE "INDEXING" TO FEATURE.                                  NC1354.2 63
   000355         035800     SET INXEX1 INXEX2 INXEX3 TO  01.                             NC1354.2 45 46 47
   000356         035900 INDEX-TEST-1.                                                    NC1354.2
   000357         036000     IF TABLE-1 (INXEX1  INXEX2  INXEX3) EQUAL TO  001            NC1354.2 47 45 46 47
   000358      1  036100     PERFORM PASS                                                 NC1354.2 217
   000359      1  036200     GO TO WRITE-1.                                               NC1354.2 366
   000360         036300     MOVE TABLE-1 (INXEX1  INXEX2  INXEX3) TO COMPUTED-A.         NC1354.2 47 45 46 47 78
   000361         036400     MOVE 001 TO CORRECT-A.                                       NC1354.2 92
   000362         036500     PERFORM FAIL.                                                NC1354.2 218
   000363         036600     GO TO WRITE-1.                                               NC1354.2 366
   000364         036700 DELETE-1.                                                        NC1354.2
   000365         036800     PERFORM DE-LETE.                                             NC1354.2 219
   000366         036900 WRITE-1.                                                         NC1354.2
   000367         037000     MOVE "INDEX-TEST-1" TO PAR-NAME.                             NC1354.2 67
   000368         037100     PERFORM PRINT-DETAIL.                                        NC1354.2 221
   000369         037200 INDEX-TEST-2.                                                    NC1354.2
   000370         037300     SET INXEX1 INXEX2 INXEX3 TO 01.                              NC1354.2 45 46 47
   000371         037400     IF TABLE-1 (INXEX1  INXEX2 + 1  INXEX3 + 1) EQUAL TO 005     NC1354.2 47 45 46 47
   000372      1  037500     PERFORM PASS                                                 NC1354.2 217
   000373      1  037600     GO TO WRITE-2.                                               NC1354.2 381
   000374         037700     MOVE TABLE-1 (INXEX1  INXEX2 + 1  INXEX3 + 1) TO             NC1354.2 47 45 46 47
   000375         037800         COMPUTED-A.                                              NC1354.2 78
   000376         037900     MOVE "005" TO CORRECT-A.                                     NC1354.2 92
   000377         038000     PERFORM FAIL.                                                NC1354.2 218
   000378         038100     GO TO WRITE-2.                                               NC1354.2 381
   000379         038200 DELETE-2.                                                        NC1354.2
   000380         038300     PERFORM DE-LETE.                                             NC1354.2 219
   000381         038400 WRITE-2.                                                         NC1354.2
   000382         038500     MOVE "INDEX-TEST-2" TO PAR-NAME.                             NC1354.2 67
   000383         038600     PERFORM PRINT-DETAIL.                                        NC1354.2 221
   000384         038700 INDEX-TEST-3.                                                    NC1354.2
   000385         038800     SET INXEX1 INXEX2 TO  10.                                    NC1354.2 45 46
   000386         038900     SET INXEX3 TO  03.                                           NC1354.2 47
   000387         039000     IF TABLE-1 (INXEX1  INXEX2  INXEX3 - 1) EQUAL TO 299         NC1354.2 47 45 46 47
   000388      1  039100     PERFORM PASS                                                 NC1354.2 217
   000389      1  039200     GO TO WRITE-3.                                               NC1354.2 396
   000390         039300     MOVE TABLE-1 (INXEX1  INXEX2  INXEX3 - 1) TO COMPUTED-A.     NC1354.2 47 45 46 47 78
   000391         039400     MOVE "299" TO CORRECT-A.                                     NC1354.2 92
   000392         039500     PERFORM FAIL.                                                NC1354.2 218
   000393         039600     GO TO WRITE-3.                                               NC1354.2 396
   000394         039700 DELETE-3.                                                        NC1354.2
   000395         039800     PERFORM DE-LETE.                                             NC1354.2 219
   000396         039900 WRITE-3.                                                         NC1354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     MOVE "INDEX-TEST-3" TO PAR-NAME.                             NC1354.2 67
   000398         040100     PERFORM PRINT-DETAIL.                                        NC1354.2 221
   000399         040200 INDEX-TEST-4.                                                    NC1354.2
   000400         040300     SET INXEX1 INXEX2 TO 10.                                     NC1354.2 45 46
   000401         040400     SET INXEX3 TO 03.                                            NC1354.2 47
   000402         040500     IF TABLE-1 (INXEX1 - 5  INXEX2 - 7  INXEX3) EQUAL TO 129     NC1354.2 47 45 46 47
   000403      1  040600     PERFORM PASS                                                 NC1354.2 217
   000404      1  040700     GO TO WRITE-4.                                               NC1354.2 412
   000405         040800     MOVE TABLE-1 (INXEX1 - 5  INXEX2 - 7  INXEX3) TO             NC1354.2 47 45 46 47
   000406         040900         COMPUTED-A.                                              NC1354.2 78
   000407         041000     MOVE "129" TO CORRECT-A.                                     NC1354.2 92
   000408         041100     PERFORM FAIL.                                                NC1354.2 218
   000409         041200     GO TO WRITE-4.                                               NC1354.2 412
   000410         041300 DELETE-4.                                                        NC1354.2
   000411         041400     PERFORM DE-LETE.                                             NC1354.2 219
   000412         041500 WRITE-4.                                                         NC1354.2
   000413         041600     MOVE "INDEX-TEST-4" TO PAR-NAME.                             NC1354.2 67
   000414         041700     PERFORM PRINT-DETAIL.                                        NC1354.2 221
   000415         041800 INDEX-TEST-5.                                                    NC1354.2
   000416         041900     SET INXEX1 TO 10.                                            NC1354.2 45
   000417         042000     SET KEY-1 TO INXEX1.                                         NC1354.2 58 45
   000418         042100     SET INXEX1 TO 05.                                            NC1354.2 45
   000419         042200     SET INXEX2 TO 10.                                            NC1354.2 46
   000420         042300     SET INXEX3 TO 03.                                            NC1354.2 47
   000421         042400     SET INXEX1 TO KEY-1.                                         NC1354.2 45 58
   000422         042500     IF TABLE-1  (INXEX1  INXEX2  INXEX3) EQUAL TO 300            NC1354.2 47 45 46 47
   000423      1  042600         PERFORM PASS                                             NC1354.2 217
   000424      1  042700         GO TO WRITE-5.                                           NC1354.2 431
   000425         042800     MOVE TABLE-1 (INXEX1  INXEX2  INXEX3) TO COMPUTED-A.         NC1354.2 47 45 46 47 78
   000426         042900     MOVE "300" TO CORRECT-A.                                     NC1354.2 92
   000427         043000     PERFORM FAIL.                                                NC1354.2 218
   000428         043100     GO TO WRITE-5.                                               NC1354.2 431
   000429         043200 DELETE-5.                                                        NC1354.2
   000430         043300     PERFORM DE-LETE.                                             NC1354.2 219
   000431         043400 WRITE-5.                                                         NC1354.2
   000432         043500     MOVE "INDEX-TEST-5" TO PAR-NAME.                             NC1354.2 67
   000433         043600     PERFORM PRINT-DETAIL.                                        NC1354.2 221
   000434         043700 INDEX-TEST-6.                                                    NC1354.2
   000435         043800     SET INXEX1 INXEX2 TO 10.                                     NC1354.2 45 46
   000436         043900     SET INXEX3 TO 03.                                            NC1354.2 47
   000437         044000     SET INXEX1 DOWN BY 01.                                       NC1354.2 45
   000438         044100     SET  INXEX2 DOWN BY  IDEN-1.                                 NC1354.2 46 43
   000439         044200*    NOTE IDEN-1 IS EQUAL TO 03.                                  NC1354.2
   000440         044300     SET INXEX3 DOWN BY 2.                                        NC1354.2 47
   000441         044400     IF TABLE-1  (INXEX1  INXEX2  INXEX3) EQUAL TO 259            NC1354.2 47 45 46 47
   000442      1  044500         PERFORM PASS                                             NC1354.2 217
   000443      1  044600         GO TO WRITE-6.                                           NC1354.2 450
   000444         044700     MOVE TABLE-1 (INXEX1  INXEX2  INXEX3) TO COMPUTED-A.         NC1354.2 47 45 46 47 78
   000445         044800     MOVE "259" TO CORRECT-A.                                     NC1354.2 92
   000446         044900     PERFORM FAIL.                                                NC1354.2 218
   000447         045000     GO TO WRITE-6.                                               NC1354.2 450
   000448         045100 DELETE-6.                                                        NC1354.2
   000449         045200     PERFORM DE-LETE.                                             NC1354.2 219
   000450         045300 WRITE-6.                                                         NC1354.2
   000451         045400     MOVE "INDEX-TEST-6" TO PAR-NAME.                             NC1354.2 67
   000452         045500     PERFORM PRINT-DETAIL.                                        NC1354.2 221
   000453         045600 INDEX-TEST-7.                                                    NC1354.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     SET INXEX1 TO ONE.                                           NC1354.2 45 40
   000455         045800     SET INXEX2 INXEX3 TO INXEX1.                                 NC1354.2 46 47 45
   000456         045900     IF TABLE-1  (INXEX1  INXEX2  INXEX3) EQUAL TO 001            NC1354.2 47 45 46 47
   000457      1  046000         PERFORM PASS                                             NC1354.2 217
   000458      1  046100         GO TO WRITE-7.                                           NC1354.2 465
   000459         046200     MOVE TABLE-1 (INXEX1  INXEX2  INXEX3) TO COMPUTED-A.         NC1354.2 47 45 46 47 78
   000460         046300     MOVE "001" TO CORRECT-A.                                     NC1354.2 92
   000461         046400     PERFORM FAIL.                                                NC1354.2 218
   000462         046500     GO TO WRITE-7.                                               NC1354.2 465
   000463         046600 DELETE-7.                                                        NC1354.2
   000464         046700     PERFORM DE-LETE.                                             NC1354.2 219
   000465         046800 WRITE-7.                                                         NC1354.2
   000466         046900     MOVE "INDEX-TEST-7" TO PAR-NAME.                             NC1354.2 67
   000467         047000     PERFORM PRINT-DETAIL.                                        NC1354.2 221
   000468         047100 SECTION-NAME-3 SECTION.                                          NC1354.2
   000469         047200 PARAGRAPH-NAME-10.                                               NC1354.2
   000470         047300     PERFORM BLANK-LINE-PRINT 2 TIMES.                            NC1354.2 294
   000471         047400     PERFORM INSPT.                                               NC1354.2 216
   000472         047500     MOVE SPACES TO PRINT-REC.                                    NC1354.2 IMP 37
   000473         047600     WRITE PRINT-REC.                                             NC1354.2 37
   000474         047700     MOVE "NOTE THIS SECTION WRITES A 20X15 TABLE OF THREE-DIGIT  NC1354.2
   000475         047800-       "NUMBERS 001 TO 300 --- THERE SHOULD BE TWO" TO PRINT-REC.NC1354.2 37
   000476         047900     WRITE PRINT-REC.                                             NC1354.2 37
   000477         048000     MOVE SPACES TO PRINT-REC.                                    NC1354.2 IMP 37
   000478         048100     MOVE "SPACES BETWEEN EACH NUMBER ON A LINE --- THE NUMBERS   NC1354.2
   000479         048200-      "001 THRU 020 SHOULD FORM THE FIRST LINE ---" TO PRINT-REC.NC1354.2 37
   000480         048300     WRITE PRINT-REC.                                             NC1354.2 37
   000481         048400     MOVE SPACES TO PRINT-REC.                                    NC1354.2 IMP 37
   000482         048500     MOVE "THE VALUES IN THIS TABLE WERE GENERATED IN             NC1354.2
   000483         048600-       "SECTION-NAME-1 SECTION." TO PRINT-REC.                   NC1354.2 37
   000484         048700     WRITE PRINT-REC.                                             NC1354.2 37
   000485         048800     MOVE SPACES TO PRINT-REC.                                    NC1354.2 IMP 37
   000486         048900     SET INXEX1  INXEX2 INXEX3 TO ONE.                            NC1354.2 45 46 47 40
   000487         049000     MOVE 01 TO CTR-1.                                            NC1354.2 41
   000488         049100 PARAGRAPH-NAME-11.                                               NC1354.2
   000489         049200     MOVE TABLE-1 (INXEX1  INXEX2  INXEX3)  TO                    NC1354.2 47 45 46 47
   000490         049300     PRINT-ELE (CTR-1)                                            NC1354.2 56 41
   000491         049400     MOVE SPACE TO BLANKSPACE (CTR-1).                            NC1354.2 IMP 55 41
   000492         049500     ADD 1 TO CTR-1                                               NC1354.2 41
   000493         049600     IF CTR-1 EQUAL TO 21 PERFORM PARAGRAPH-NAME-15.              NC1354.2 41 509
   000494         049700     IF       INXEX3 EQUAL TO 3 GO TO PARAGRAPH-NAME-12.          NC1354.2 47 497
   000495         049800     SET INXEX3 UP BY   1.                                        NC1354.2 47
   000496         049900     GO TO    PARAGRAPH-NAME-11.                                  NC1354.2 488
   000497         050000 PARAGRAPH-NAME-12.                                               NC1354.2
   000498         050100     SET INXEX3 TO 1.                                             NC1354.2 47
   000499         050200     IF       INXEX2 EQUAL TO 10 GO TO PARAGRAPH-NAME-13.         NC1354.2 46 502
   000500         050300     SET INXEX2 UP BY 1.                                          NC1354.2 46
   000501         050400     GO TO    PARAGRAPH-NAME-11.                                  NC1354.2 488
   000502         050500 PARAGRAPH-NAME-13.                                               NC1354.2
   000503         050600     SET INXEX2 TO 1.                                             NC1354.2 46
   000504         050700     IF       INXEX1 EQUAL TO 10 GO TO PARAGRAPH-NAME-14.         NC1354.2 45 507
   000505         050800     SET INXEX1 UP BY 1.                                          NC1354.2 45
   000506         050900     GO TO    PARAGRAPH-NAME-11.                                  NC1354.2 488
   000507         051000 PARAGRAPH-NAME-14.                                               NC1354.2
   000508         051100     GO TO PARAGRAPH-NAME-16.                                     NC1354.2 514
   000509         051200 PARAGRAPH-NAME-15.                                               NC1354.2
   000510         051300     MOVE SPACE TO PRINT-REC.                                     NC1354.2 IMP 37
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE NUMBER-LIST TO PRINT-REC.                               NC1354.2 52 37
   000512         051500     WRITE PRINT-REC AFTER 1.                                     NC1354.2 37
   000513         051600     MOVE 01 TO CTR-1.                                            NC1354.2 41
   000514         051700 PARAGRAPH-NAME-16.                                               NC1354.2
   000515         051800     EXIT.                                                        NC1354.2
   000516         051900 CCVS-EXIT SECTION.                                               NC1354.2
   000517         052000 CCVS-999999.                                                     NC1354.2
   000518         052100     GO TO CLOSE-FILES.                                           NC1354.2 210
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page    13
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      123   ANSI-REFERENCE . . . . . . . .  300 307 316 M324
       55   BLANKSPACE . . . . . . . . . .  M491
      102   CCVS-C-1 . . . . . . . . . . .  239 285
      107   CCVS-C-2 . . . . . . . . . . .  240 286
      157   CCVS-E-1 . . . . . . . . . . .  245
      162   CCVS-E-2 . . . . . . . . . . .  254 261 268 273
      165   CCVS-E-2-2 . . . . . . . . . .  M253
      170   CCVS-E-3 . . . . . . . . . . .  274
      179   CCVS-E-4 . . . . . . . . . . .  253
      180   CCVS-E-4-1 . . . . . . . . . .  M251
      182   CCVS-E-4-2 . . . . . . . . . .  M252
      124   CCVS-H-1 . . . . . . . . . . .  234 281
      129   CCVS-H-2A. . . . . . . . . . .  235 282
      138   CCVS-H-2B. . . . . . . . . . .  236 283
      150   CCVS-H-3 . . . . . . . . . . .  237 284
      200   CCVS-PGM-ID. . . . . . . . . .  206 206
       84   CM-18V0
       78   COMPUTED-A . . . . . . . . . .  79 81 82 83 84 312 315 M353 M360 M375 M390 M406 M425 M444 M459
       79   COMPUTED-N
       77   COMPUTED-X . . . . . . . . . .  M229 297
       81   COMPUTED-0V18
       83   COMPUTED-14V4
       85   COMPUTED-18V0
       82   COMPUTED-4V14
      101   COR-ANSI-REFERENCE . . . . . .  M307 M309
       92   CORRECT-A. . . . . . . . . . .  93 94 95 96 97 313 315 M353 M361 M376 M391 M407 M426 M445 M460
       93   CORRECT-N
       91   CORRECT-X. . . . . . . . . . .  M230 299
       94   CORRECT-0V18
       96   CORRECT-14V4
       98   CORRECT-18V0
       95   CORRECT-4V14
       97   CR-18V0
       41   CTR-1. . . . . . . . . . . . .  M487 490 491 M492 493 M513
       57   DATA-NAMES
      115   DELETE-COUNTER . . . . . . . .  M219 248 264 266
       70   DOTVALUE . . . . . . . . . . .  M224
      121   DUMMY-HOLD . . . . . . . . . .  M278 288
       38   DUMMY-RECORD . . . . . . . . .  M234 M235 M236 M237 M239 M240 M241 M243 M245 M254 M261 M268 M273 M274 278 M279
                                            280 M281 M282 M283 M284 M285 M286 M287 M288 292 M293 M302 M317
      168   ENDER-DESC . . . . . . . . . .  M256 M267 M272
      116   ERROR-COUNTER. . . . . . . . .  M218 247 257 260
      120   ERROR-HOLD . . . . . . . . . .  M247 M248 M248 M249 252
      166   ERROR-TOTAL. . . . . . . . . .  M258 M260 M265 M266 M270 M271
       63   FEATURE. . . . . . . . . . . .  M354
      194   HYPHEN-LINE. . . . . . . . . .  241 243 287
      160   ID-AGAIN . . . . . . . . . . .  M206
       43   IDEN-1 . . . . . . . . . . . .  438
      193   INF-ANSI-REFERENCE . . . . . .  M300 M303 M316 M318
      188   INFO-TEXT. . . . . . . . . . .  M301
      117   INSPECT-COUNTER. . . . . . . .  M216 247 269 271
       45   INXEX1 . . . . . . . . . . . .  M325 328 342 M344 M355 357 360 M370 371 374 M385 387 390 M400 402 405 M416 417
                                            M418 M421 422 425 M435 M437 441 444 M454 455 456 459 M486 489 504 M505
       46   INXEX2 . . . . . . . . . . . .  M325 328 336 M338 M341 M355 357 360 M370 371 374 M385 387 390 M400 402 405 M419
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page    14
0 Defined   Cross-reference of data names   References

0                                           422 425 M435 M438 441 444 M455 456 459 M486 489 499 M500 M503
       47   INXEX3 . . . . . . . . . . . .  M325 328 330 M332 M335 M355 357 360 M370 371 374 M386 387 390 M401 402 405 M420
                                            422 425 M436 M440 441 444 M455 456 459 M486 489 494 M495 M498
       58   KEY-1. . . . . . . . . . . . .  M417 421
       59   KEY-2
       60   KEY-3
       54   LINE-1
       52   NUMBER-LIST. . . . . . . . . .  511
       40   ONE. . . . . . . . . . . . . .  454 486
       65   P-OR-F . . . . . . . . . . . .  M216 M217 M218 M219 226 M229
       67   PAR-NAME . . . . . . . . . . .  M231 M367 M382 M397 M413 M432 M451 M466
       69   PARDOT-X . . . . . . . . . . .  M223
      118   PASS-COUNTER . . . . . . . . .  M217 249 251
       56   PRINT-ELE. . . . . . . . . . .  M490
       36   PRINT-FILE . . . . . . . . . .  32 205 211
       37   PRINT-REC. . . . . . . . . . .  M225 M306 M308 M472 473 M475 476 M477 M479 480 M481 M483 484 M485 M510 M511 512
       72   RE-MARK. . . . . . . . . . . .  M220 M232
      114   REC-CT . . . . . . . . . . . .  222 224 231
      113   REC-SKL-SUB
      122   RECORD-COUNT . . . . . . . . .  M276 277 M289
       47   TABLE-1. . . . . . . . . . . .  M328 357 360 371 374 387 390 402 405 422 425 441 444 456 459 489
       51   TABLE-2
       50   TABLE-4
       49   TABLE-5
       48   TABLE-6
       46   TABLE-7
       45   TABLE-8
       44   TABLE-9. . . . . . . . . . . .  48
       73   TEST-COMPUTED. . . . . . . . .  306
       88   TEST-CORRECT . . . . . . . . .  308
      141   TEST-ID. . . . . . . . . . . .  M206
       61   TEST-RESULTS . . . . . . . . .  M207 225
      119   TOTAL-ERROR
       42   W-3. . . . . . . . . . . . . .  M326 328 M329
      190   XXCOMPUTED . . . . . . . . . .  M315
      192   XXCORRECT. . . . . . . . . . .  M315
      185   XXINFO . . . . . . . . . . . .  302 317
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page    15
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

      311   BAIL-OUT . . . . . . . . . . .  P228
      319   BAIL-OUT-EX. . . . . . . . . .  E228 G313
      314   BAIL-OUT-WRITE . . . . . . . .  G312
      294   BLANK-LINE-PRINT . . . . . . .  P470
      516   CCVS-EXIT
      517   CCVS-999999
      203   CCVS1
      320   CCVS1-EXIT . . . . . . . . . .  G209
      210   CLOSE-FILES. . . . . . . . . .  G518
      238   COLUMN-NAMES-ROUTINE . . . . .  E208
      219   DE-LETE. . . . . . . . . . . .  P365 P380 P395 P411 P430 P449 P464
      364   DELETE-1
      379   DELETE-2
      394   DELETE-3
      410   DELETE-4
      429   DELETE-5
      448   DELETE-6
      463   DELETE-7
      242   END-ROUTINE. . . . . . . . . .  P211
      246   END-ROUTINE-1
      255   END-ROUTINE-12
      263   END-ROUTINE-13 . . . . . . . .  E211
      244   END-RTN-EXIT
      218   FAIL . . . . . . . . . . . . .  P362 P377 P392 P408 P427 P446 P461
      296   FAIL-ROUTINE . . . . . . . . .  P227
      310   FAIL-ROUTINE-EX. . . . . . . .  E227 G304
      305   FAIL-ROUTINE-WRITE . . . . . .  G298 G299
      233   HEAD-ROUTINE . . . . . . . . .  P208
      356   INDEX-TEST-1
      369   INDEX-TEST-2
      384   INDEX-TEST-3
      399   INDEX-TEST-4
      415   INDEX-TEST-5
      434   INDEX-TEST-6
      453   INDEX-TEST-7
      216   INSPT. . . . . . . . . . . . .  P471
      204   OPEN-FILES
      469   PARAGRAPH-NAME-10
      488   PARAGRAPH-NAME-11. . . . . . .  G496 G501 G506
      497   PARAGRAPH-NAME-12. . . . . . .  G494
      502   PARAGRAPH-NAME-13. . . . . . .  G499
      507   PARAGRAPH-NAME-14. . . . . . .  G504
      509   PARAGRAPH-NAME-15. . . . . . .  P493
      514   PARAGRAPH-NAME-16. . . . . . .  G508
      323   PARAGRAPH-NAME-4
      327   PARAGRAPH-NAME-5 . . . . . . .  G333 G339 G345
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page    16
0 Defined   Cross-reference of procedures   References

0     334   PARAGRAPH-NAME-6 . . . . . . .  G331
      340   PARAGRAPH-NAME-7 . . . . . . .  G337
      348   PARAGRAPH-NAME-8 . . . . . . .  G343
      351   PARAGRAPH-NAME-9
      217   PASS . . . . . . . . . . . . .  P358 P372 P388 P403 P423 P442 P457
      221   PRINT-DETAIL . . . . . . . . .  P368 P383 P398 P414 P433 P452 P467
      322   SECT-NC135A-001
      350   SECTION-NAME-2
      468   SECTION-NAME-3
      214   TERMINATE-CALL
      212   TERMINATE-CCVS
      275   WRITE-LINE . . . . . . . . . .  P225 P226 P234 P235 P236 P237 P239 P240 P241 P243 P245 P254 P262 P268 P273 P274
                                            P302 P306 P308 P317
      366   WRITE-1. . . . . . . . . . . .  G359 G363
      381   WRITE-2. . . . . . . . . . . .  G373 G378
      396   WRITE-3. . . . . . . . . . . .  G389 G393
      412   WRITE-4. . . . . . . . . . . .  G404 G409
      431   WRITE-5. . . . . . . . . . . .  G424 G428
      450   WRITE-6. . . . . . . . . . . .  G443 G447
      465   WRITE-7. . . . . . . . . . . .  G458 G462
      291   WRT-LN . . . . . . . . . . . .  P281 P282 P283 P284 P285 P286 P287 P290 P295
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page    17
0 Defined   Cross-reference of programs     References

        3   NC135A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC135A    Date 06/04/2022  Time 11:59:16   Page    18
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC135A:
 *    Source records = 518
 *    Data Division statements = 83
 *    Procedure Division statements = 287
 *    Generated COBOL statements = 0
 *    Program complexity factor = 295
0End of compilation 1,  program NC135A,  highest severity 0.
0Return code 0
