1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:06   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:06   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1394.2
   000002         000200 PROGRAM-ID.                                                      NC1394.2
   000003         000300     NC139A.                                                      NC1394.2
   000004         000500*                                                              *  NC1394.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1394.2
   000006         000700*                                                              *  NC1394.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1394.2
   000008         000900*                                                              *  NC1394.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1394.2
   000010         001100*                                                              *  NC1394.2
   000011         001300*                                                              *  NC1394.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1394.2
   000013         001500*                                                              *  NC1394.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1394.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1394.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1394.2
   000017         001900*                                                              *  NC1394.2
   000018         002100*                                                                 NC1394.2
   000019         002200*    PROGRAM NC139A TESTS THE USE OF NUMERIC LITERALS WITH        NC1394.2
   000020         002300*    RELATIVE INDEXING WHEN ACCESSING 2 AND 3 DIMENSIONAL         NC1394.2
   000021         002400*    TABLES.                                                      NC1394.2
   000022         002500*    THE USE OF INDEXES AND SUBSCRIPTS TOGETHER IS ALSO TESTED.   NC1394.2
   000023         002600*                                                                 NC1394.2
   000024         002700 ENVIRONMENT DIVISION.                                            NC1394.2
   000025         002800 CONFIGURATION SECTION.                                           NC1394.2
   000026         002900 SOURCE-COMPUTER.                                                 NC1394.2
   000027         003000     XXXXX082.                                                    NC1394.2
   000028         003100 OBJECT-COMPUTER.                                                 NC1394.2
   000029         003200     XXXXX083.                                                    NC1394.2
   000030         003300 INPUT-OUTPUT SECTION.                                            NC1394.2
   000031         003400 FILE-CONTROL.                                                    NC1394.2
   000032         003500     SELECT PRINT-FILE ASSIGN TO                                  NC1394.2 36
   000033         003600     XXXXX055.                                                    NC1394.2
   000034         003700 DATA DIVISION.                                                   NC1394.2
   000035         003800 FILE SECTION.                                                    NC1394.2
   000036         003900 FD  PRINT-FILE.                                                  NC1394.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000 01  PRINT-REC PICTURE X(120).                                    NC1394.2
   000038         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC1394.2
   000039         004200 WORKING-STORAGE SECTION.                                         NC1394.2
   000040         004300*         LITERALS AND INDEX-NAMES MAY BE MIXED IN A TABLE        NC1394.2
   000041         004400*    REFERENCE.  THE LITERALS MAY BE SIGNED BUT MUST BE POSITIVE. NC1394.2
   000042         004500*    RELATIVE INDEXING WITH BOTH POSITIVE AND NEGATIVE INTEGERS   NC1394.2
   000043         004600*    IS PERMITTED.                                                NC1394.2
   000044         004700 01  WS-2      PIC 9.                                             NC1394.2
   000045         004800 01  WS-PLUS-2 PIC S9.                                            NC1394.2
   000046         004900 01  WS-4      PIC 9.                                             NC1394.2
   000047         005000 01  WS-PLUS-4 PIC S9.                                            NC1394.2
   000048         005100 77  TEMP PIC XXX.                                                NC1394.2
   000049         005200 77  EXPECTED-VALUE  PIC XXX.                                     NC1394.2
   000050         005300*        TWO DIMENSIONAL TABLE, 6X4, WITH INDEXES.                NC1394.2
   000051         005400 01  GRP-TAB1.                                                    NC1394.2
   000052         005500     02  GRP-1  OCCURS 6 TIMES                                    NC1394.2
   000053         005600                INDEXED BY IN1.                                   NC1394.2
   000054         005700         03  ELEM1  PIC  XXX                                      NC1394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800                OCCURS 4 TIMES                                    NC1394.2
   000056         005900                INDEXED BY IN2.                                   NC1394.2
   000057         006000*       THREE DIMENSIONAL TABLE, 3X2X4, WITH INDEXES.             NC1394.2
   000058         006100 01  GRP-TAB2.                                                    NC1394.2
   000059         006200     02  GRP-2   OCCURS 3 TIMES                                   NC1394.2
   000060         006300                 INDEXED BY INDEX1.                               NC1394.2
   000061         006400         03  GRP-3  OCCURS 2 TIMES                                NC1394.2
   000062         006500                    INDEXED BY INDEX2.                            NC1394.2
   000063         006600             04  ELEM2 PIC XXX                                    NC1394.2
   000064         006700                       OCCURS 4 TIMES                             NC1394.2
   000065         006800                       INDEXED BY INDEX3.                         NC1394.2
   000066         006900 01  TABLE-VALUES.                                                NC1394.2
   000067         007000     02  VALUES-1   PIC  X(12)                                    NC1394.2
   000068         007100             VALUE "AAABBBCCCDDD".                                NC1394.2
   000069         007200     02  VALUES-2   PIC  X(12)                                    NC1394.2
   000070         007300             VALUE "EEEFFFGGGHHH".                                NC1394.2
   000071         007400     02  VALUES-3   PIC  X(12)                                    NC1394.2
   000072         007500             VALUE "IIIJJJKKKLLL".                                NC1394.2
   000073         007600     02  VALUES-4   PIC  X(12)                                    NC1394.2
   000074         007700             VALUE "MMMNNNOOOPPP".                                NC1394.2
   000075         007800     02  VALUES-5   PIC  X(12)                                    NC1394.2
   000076         007900             VALUE "QQQRRRSSSTTT".                                NC1394.2
   000077         008000     02  VALUES-6   PIC  X(12)                                    NC1394.2
   000078         008100             VALUE "UUUVVVWWWXXX".                                NC1394.2
   000079         008200 01  TEST-RESULTS.                                                NC1394.2
   000080         008300     02 FILLER                   PIC X      VALUE SPACE.          NC1394.2 IMP
   000081         008400     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1394.2 IMP
   000082         008500     02 FILLER                   PIC X      VALUE SPACE.          NC1394.2 IMP
   000083         008600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1394.2 IMP
   000084         008700     02 FILLER                   PIC X      VALUE SPACE.          NC1394.2 IMP
   000085         008800     02  PAR-NAME.                                                NC1394.2
   000086         008900       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1394.2 IMP
   000087         009000       03  PARDOT-X              PIC X      VALUE SPACE.          NC1394.2 IMP
   000088         009100       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1394.2 IMP
   000089         009200     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1394.2 IMP
   000090         009300     02 RE-MARK                  PIC X(61).                       NC1394.2
   000091         009400 01  TEST-COMPUTED.                                               NC1394.2
   000092         009500     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1394.2 IMP
   000093         009600     02 FILLER                   PIC X(17)  VALUE                 NC1394.2
   000094         009700            "       COMPUTED=".                                   NC1394.2
   000095         009800     02 COMPUTED-X.                                               NC1394.2
   000096         009900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1394.2 IMP
   000097         010000     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1394.2 96
   000098         010100                                 PIC -9(9).9(9).                  NC1394.2
   000099         010200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1394.2 96
   000100         010300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1394.2 96
   000101         010400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1394.2 96
   000102         010500     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1394.2 96
   000103         010600         04 COMPUTED-18V0                    PIC -9(18).          NC1394.2
   000104         010700         04 FILLER                           PIC X.               NC1394.2
   000105         010800     03 FILLER PIC X(50) VALUE SPACE.                             NC1394.2 IMP
   000106         010900 01  TEST-CORRECT.                                                NC1394.2
   000107         011000     02 FILLER PIC X(30) VALUE SPACE.                             NC1394.2 IMP
   000108         011100     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1394.2
   000109         011200     02 CORRECT-X.                                                NC1394.2
   000110         011300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1394.2 IMP
   000111         011400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1394.2 110
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1394.2 110
   000113         011600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1394.2 110
   000114         011700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1394.2 110
   000115         011800     03      CR-18V0 REDEFINES CORRECT-A.                         NC1394.2 110
   000116         011900         04 CORRECT-18V0                     PIC -9(18).          NC1394.2
   000117         012000         04 FILLER                           PIC X.               NC1394.2
   000118         012100     03 FILLER PIC X(2) VALUE SPACE.                              NC1394.2 IMP
   000119         012200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1394.2 IMP
   000120         012300 01  CCVS-C-1.                                                    NC1394.2
   000121         012400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1394.2
   000122         012500-    "SS  PARAGRAPH-NAME                                          NC1394.2
   000123         012600-    "       REMARKS".                                            NC1394.2
   000124         012700     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1394.2 IMP
   000125         012800 01  CCVS-C-2.                                                    NC1394.2
   000126         012900     02 FILLER                     PIC X        VALUE SPACE.      NC1394.2 IMP
   000127         013000     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1394.2
   000128         013100     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1394.2 IMP
   000129         013200     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1394.2
   000130         013300     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1394.2 IMP
   000131         013400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1394.2 IMP
   000132         013500 01  REC-CT                        PIC 99       VALUE ZERO.       NC1394.2 IMP
   000133         013600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1394.2 IMP
   000134         013700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1394.2 IMP
   000135         013800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1394.2 IMP
   000136         013900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1394.2 IMP
   000137         014000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1394.2 IMP
   000138         014100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1394.2 IMP
   000139         014200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1394.2 IMP
   000140         014300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1394.2 IMP
   000141         014400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1394.2 IMP
   000142         014500 01  CCVS-H-1.                                                    NC1394.2
   000143         014600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1394.2 IMP
   000144         014700     02  FILLER                    PIC X(42)    VALUE             NC1394.2
   000145         014800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1394.2
   000146         014900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1394.2 IMP
   000147         015000 01  CCVS-H-2A.                                                   NC1394.2
   000148         015100   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1394.2 IMP
   000149         015200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1394.2
   000150         015300   02  FILLER                        PIC XXXX   VALUE             NC1394.2
   000151         015400     "4.2 ".                                                      NC1394.2
   000152         015500   02  FILLER                        PIC X(28)  VALUE             NC1394.2
   000153         015600            " COPY - NOT FOR DISTRIBUTION".                       NC1394.2
   000154         015700   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1394.2 IMP
   000155         015800                                                                  NC1394.2
   000156         015900 01  CCVS-H-2B.                                                   NC1394.2
   000157         016000   02  FILLER                        PIC X(15)  VALUE             NC1394.2
   000158         016100            "TEST RESULT OF ".                                    NC1394.2
   000159         016200   02  TEST-ID                       PIC X(9).                    NC1394.2
   000160         016300   02  FILLER                        PIC X(4)   VALUE             NC1394.2
   000161         016400            " IN ".                                               NC1394.2
   000162         016500   02  FILLER                        PIC X(12)  VALUE             NC1394.2
   000163         016600     " HIGH       ".                                              NC1394.2
   000164         016700   02  FILLER                        PIC X(22)  VALUE             NC1394.2
   000165         016800            " LEVEL VALIDATION FOR ".                             NC1394.2
   000166         016900   02  FILLER                        PIC X(58)  VALUE             NC1394.2
   000167         017000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1394.2
   000168         017100 01  CCVS-H-3.                                                    NC1394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02  FILLER                      PIC X(34)  VALUE             NC1394.2
   000170         017300            " FOR OFFICIAL USE ONLY    ".                         NC1394.2
   000171         017400     02  FILLER                      PIC X(58)  VALUE             NC1394.2
   000172         017500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1394.2
   000173         017600     02  FILLER                      PIC X(28)  VALUE             NC1394.2
   000174         017700            "  COPYRIGHT   1985 ".                                NC1394.2
   000175         017800 01  CCVS-E-1.                                                    NC1394.2
   000176         017900     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1394.2 IMP
   000177         018000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1394.2
   000178         018100     02 ID-AGAIN                     PIC X(9).                    NC1394.2
   000179         018200     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1394.2 IMP
   000180         018300 01  CCVS-E-2.                                                    NC1394.2
   000181         018400     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1394.2 IMP
   000182         018500     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1394.2 IMP
   000183         018600     02 CCVS-E-2-2.                                               NC1394.2
   000184         018700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1394.2 IMP
   000185         018800         03 FILLER                   PIC X      VALUE SPACE.      NC1394.2 IMP
   000186         018900         03 ENDER-DESC               PIC X(44)  VALUE             NC1394.2
   000187         019000            "ERRORS ENCOUNTERED".                                 NC1394.2
   000188         019100 01  CCVS-E-3.                                                    NC1394.2
   000189         019200     02  FILLER                      PIC X(22)  VALUE             NC1394.2
   000190         019300            " FOR OFFICIAL USE ONLY".                             NC1394.2
   000191         019400     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1394.2 IMP
   000192         019500     02  FILLER                      PIC X(58)  VALUE             NC1394.2
   000193         019600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1394.2
   000194         019700     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1394.2 IMP
   000195         019800     02 FILLER                       PIC X(15)  VALUE             NC1394.2
   000196         019900             " COPYRIGHT 1985".                                   NC1394.2
   000197         020000 01  CCVS-E-4.                                                    NC1394.2
   000198         020100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1394.2 IMP
   000199         020200     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1394.2
   000200         020300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1394.2 IMP
   000201         020400     02 FILLER                       PIC X(40)  VALUE             NC1394.2
   000202         020500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1394.2
   000203         020600 01  XXINFO.                                                      NC1394.2
   000204         020700     02 FILLER                       PIC X(19)  VALUE             NC1394.2
   000205         020800            "*** INFORMATION ***".                                NC1394.2
   000206         020900     02 INFO-TEXT.                                                NC1394.2
   000207         021000       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1394.2 IMP
   000208         021100       04 XXCOMPUTED                 PIC X(20).                   NC1394.2
   000209         021200       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1394.2 IMP
   000210         021300       04 XXCORRECT                  PIC X(20).                   NC1394.2
   000211         021400     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1394.2
   000212         021500 01  HYPHEN-LINE.                                                 NC1394.2
   000213         021600     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1394.2 IMP
   000214         021700     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1394.2
   000215         021800-    "*****************************************".                 NC1394.2
   000216         021900     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1394.2
   000217         022000-    "******************************".                            NC1394.2
   000218         022100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1394.2
   000219         022200     "NC139A".                                                    NC1394.2
   000220         022300 PROCEDURE DIVISION.                                              NC1394.2
   000221         022400 CCVS1 SECTION.                                                   NC1394.2
   000222         022500 OPEN-FILES.                                                      NC1394.2
   000223         022600     OPEN     OUTPUT PRINT-FILE.                                  NC1394.2 36
   000224         022700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1394.2 218 159 218 178
   000225         022800     MOVE    SPACE TO TEST-RESULTS.                               NC1394.2 IMP 79
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1394.2 251 256
   000227         023000     GO TO CCVS1-EXIT.                                            NC1394.2 338
   000228         023100 CLOSE-FILES.                                                     NC1394.2
   000229         023200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1394.2 260 281 36
   000230         023300 TERMINATE-CCVS.                                                  NC1394.2
   000231         023400     EXIT PROGRAM.                                                NC1394.2
   000232         023500 TERMINATE-CALL.                                                  NC1394.2
   000233         023600     STOP     RUN.                                                NC1394.2
   000234         023700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1394.2 83 135
   000235         023800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1394.2 83 136
   000236         023900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1394.2 83 134
   000237         024000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1394.2 83 133
   000238         024100     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1394.2 90
   000239         024200 PRINT-DETAIL.                                                    NC1394.2
   000240         024300     IF REC-CT NOT EQUAL TO ZERO                                  NC1394.2 132 IMP
   000241      1  024400             MOVE "." TO PARDOT-X                                 NC1394.2 87
   000242      1  024500             MOVE REC-CT TO DOTVALUE.                             NC1394.2 132 88
   000243         024600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1394.2 79 37 293
   000244         024700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1394.2 83 293
   000245      1  024800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1394.2 314 328
   000246      1  024900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1394.2 329 337
   000247         025000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1394.2 IMP 83 IMP 95
   000248         025100     MOVE SPACE TO CORRECT-X.                                     NC1394.2 IMP 109
   000249         025200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1394.2 132 IMP IMP 85
   000250         025300     MOVE     SPACE TO RE-MARK.                                   NC1394.2 IMP 90
   000251         025400 HEAD-ROUTINE.                                                    NC1394.2
   000252         025500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1394.2 142 38 293
   000253         025600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1394.2 147 38 293
   000254         025700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1394.2 156 38 293
   000255         025800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1394.2 168 38 293
   000256         025900 COLUMN-NAMES-ROUTINE.                                            NC1394.2
   000257         026000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1394.2 120 38 293
   000258         026100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1394.2 125 38 293
   000259         026200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1394.2 212 38 293
   000260         026300 END-ROUTINE.                                                     NC1394.2
   000261         026400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1394.2 212 38 293
   000262         026500 END-RTN-EXIT.                                                    NC1394.2
   000263         026600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1394.2 175 38 293
   000264         026700 END-ROUTINE-1.                                                   NC1394.2
   000265         026800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1394.2 134 138 135
   000266         026900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1394.2 138 133 138
   000267         027000      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1394.2 136 138
   000268         027100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1394.2
   000269         027200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1394.2 136 198
   000270         027300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1394.2 138 200
   000271         027400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1394.2 197 183
   000272         027500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1394.2 180 38 293
   000273         027600  END-ROUTINE-12.                                                 NC1394.2
   000274         027700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1394.2 186
   000275         027800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1394.2 134 IMP
   000276      1  027900         MOVE "NO " TO ERROR-TOTAL                                NC1394.2 184
   000277         028000         ELSE                                                     NC1394.2
   000278      1  028100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1394.2 134 184
   000279         028200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1394.2 180 38
   000280         028300     PERFORM WRITE-LINE.                                          NC1394.2 293
   000281         028400 END-ROUTINE-13.                                                  NC1394.2
   000282         028500     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1394.2 133 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028600         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1394.2 184
   000284      1  028700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1394.2 133 184
   000285         028800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1394.2 186
   000286         028900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1394.2 180 38 293
   000287         029000      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1394.2 135 IMP
   000288      1  029100          MOVE "NO " TO ERROR-TOTAL                               NC1394.2 184
   000289      1  029200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1394.2 135 184
   000290         029300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1394.2 186
   000291         029400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1394.2 180 38 293
   000292         029500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1394.2 188 38 293
   000293         029600 WRITE-LINE.                                                      NC1394.2
   000294         029700     ADD 1 TO RECORD-COUNT.                                       NC1394.2 140
   000295         029800     IF RECORD-COUNT GREATER 42                                   NC1394.2 140
   000296      1  029900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1394.2 38 139
   000297      1  030000         MOVE SPACE TO DUMMY-RECORD                               NC1394.2 IMP 38
   000298      1  030100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1394.2 38
   000299      1  030200         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1394.2 142 38 309
   000300      1  030300         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1394.2 147 38 309
   000301      1  030400         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1394.2 156 38 309
   000302      1  030500         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1394.2 168 38 309
   000303      1  030600         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1394.2 120 38 309
   000304      1  030700         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1394.2 125 38 309
   000305      1  030800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1394.2 212 38 309
   000306      1  030900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1394.2 139 38
   000307      1  031000         MOVE ZERO TO RECORD-COUNT.                               NC1394.2 IMP 140
   000308         031100     PERFORM WRT-LN.                                              NC1394.2 309
   000309         031200 WRT-LN.                                                          NC1394.2
   000310         031300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1394.2 38
   000311         031400     MOVE SPACE TO DUMMY-RECORD.                                  NC1394.2 IMP 38
   000312         031500 BLANK-LINE-PRINT.                                                NC1394.2
   000313         031600     PERFORM WRT-LN.                                              NC1394.2 309
   000314         031700 FAIL-ROUTINE.                                                    NC1394.2
   000315         031800     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1394.2 95 IMP
   000316      1  031900            GO TO FAIL-ROUTINE-WRITE.                             NC1394.2 323
   000317         032000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1394.2 109 IMP 323
   000318         032100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1394.2 141 211
   000319         032200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1394.2 206
   000320         032300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1394.2 203 38 293
   000321         032400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1394.2 IMP 211
   000322         032500     GO TO  FAIL-ROUTINE-EX.                                      NC1394.2 328
   000323         032600 FAIL-ROUTINE-WRITE.                                              NC1394.2
   000324         032700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1394.2 91 37 293
   000325         032800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1394.2 141 119
   000326         032900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1394.2 106 37 293
   000327         033000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1394.2 IMP 119
   000328         033100 FAIL-ROUTINE-EX. EXIT.                                           NC1394.2
   000329         033200 BAIL-OUT.                                                        NC1394.2
   000330         033300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1394.2 96 IMP 332
   000331         033400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1394.2 110 IMP 337
   000332         033500 BAIL-OUT-WRITE.                                                  NC1394.2
   000333         033600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1394.2 110 210 96 208
   000334         033700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1394.2 141 211
   000335         033800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1394.2 203 38 293
   000336         033900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1394.2 IMP 211
   000337         034000 BAIL-OUT-EX. EXIT.                                               NC1394.2
   000338         034100 CCVS1-EXIT.                                                      NC1394.2
   000339         034200     EXIT.                                                        NC1394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400*        STATEMENT DELETION INSTRUCTIONS                          NC1394.2
   000341         034500*         IF THE COMPILER REJECTS ANY OF THE TABLE REFERENCES IN  NC1394.2
   000342         034600*    THIS ROUTINE, DELETE THAT LINE OF CODE BY PLACING AN * IN    NC1394.2
   000343         034700*    COLUMN 7.  LEAVE THE PERFORM...THRU STATEMENT.  THE TEST     NC1394.2
   000344         034800*    ELEMENT DELETED APPEARS AS A FAILURE ON THE OUTPUT REPORT.   NC1394.2
   000345         035000 SECT-NC139A-001 SECTION.                                         NC1394.2
   000346         035100 NC139A-001.                                                      NC1394.2
   000347         035200     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC1394.2 141
   000348         035300*        THIS SECTION STORES AAA THRU XXX IN THE TWO TABLES       NC1394.2
   000349         035400*    REFERENCED IN THE TESTS.                                     NC1394.2
   000350         035500 BUILD-TABLE.                                                     NC1394.2
   000351         035600     SET IN1 TO 1.                                                NC1394.2 53
   000352         035700     MOVE VALUES-1 TO GRP-1 (IN1).                                NC1394.2 67 52 53
   000353         035800     MOVE VALUES-2 TO GRP-1 (IN1 + 1).                            NC1394.2 69 52 53
   000354         035900     MOVE VALUES-3 TO GRP-1 (IN1 + 2).                            NC1394.2 71 52 53
   000355         036000     MOVE VALUES-4 TO GRP-1 (IN1 + 3).                            NC1394.2 73 52 53
   000356         036100     MOVE VALUES-5 TO GRP-1 (IN1 + 4).                            NC1394.2 75 52 53
   000357         036200     MOVE VALUES-6 TO GRP-1 (IN1 + 5).                            NC1394.2 77 52 53
   000358         036300     MOVE GRP-TAB1 TO GRP-TAB2.                                   NC1394.2 51 58
   000359         036400 SECT-TH110-0002 SECTION.                                         NC1394.2
   000360         036500*       THIS SECTION CONTAINS THE TESTS WHICH VALIDATE            NC1394.2
   000361         036600*    THE HANDLING OF LITERALS MIXED WITH INDEX-NAMES              NC1394.2
   000362         036700*    IN REFERENCING TWO AND THREE DIMENSIONAL TABLES.             NC1394.2
   000363         036800 IND-INIT-001.                                                    NC1394.2
   000364         036900*        THIS TEST MIXES UNSIGNED LITERALS WITH INDEX-NAMES.      NC1394.2
   000365         037000     SET IN1  IN2  TO 1.                                          NC1394.2 53 56
   000366         037100     SET INDEX1  INDEX2  INDEX3  TO 1.                            NC1394.2 60 62 65
   000367         037200     MOVE "AAA" TO EXPECTED-VALUE.                                NC1394.2 49
   000368         037300     MOVE SPACE TO TEMP.                                          NC1394.2 IMP 48
   000369         037400     MOVE ZERO TO REC-CT.                                         NC1394.2 IMP 132
   000370         037500     MOVE "IND-TEST-001" TO PAR-NAME.                             NC1394.2 85
   000371         037600     MOVE "INDEXES AND LITERALS" TO FEATURE.                      NC1394.2 81
   000372         037700 IND-TEST-001-01.                                                 NC1394.2
   000373         037800     MOVE ELEM1 (IN1, 1) TO TEMP.                                 NC1394.2 54 53 48
   000374         037900     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000375         038000 IND-TEST-001-02.                                                 NC1394.2
   000376         038100     MOVE ELEM1(1 IN2) TO TEMP.                                   NC1394.2 54 56 48
   000377         038200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000378         038300 IND-TEST-001-03.                                                 NC1394.2
   000379         038400     MOVE ELEM1(1, IN2) TO TEMP.                                  NC1394.2 54 56 48
   000380         038500     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000381         038600 IND-TEST-001-04.                                                 NC1394.2
   000382         038700     MOVE ELEM2 (1 INDEX2 1)  TO TEMP.                            NC1394.2 63 62 48
   000383         038800     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000384         038900 IND-TEST-001-05.                                                 NC1394.2
   000385         039000     MOVE ELEM2(INDEX1 INDEX2 1) TO TEMP.                         NC1394.2 63 60 62 48
   000386         039100     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000387         039200 IND-TEST-001-06.                                                 NC1394.2
   000388         039300     MOVE ELEM2 (INDEX1, 1  INDEX3) TO TEMP.                      NC1394.2 63 60 65 48
   000389         039400     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000390         039500 IND-TEST-001-07.                                                 NC1394.2
   000391         039600     MOVE ELEM2 (1 1 INDEX3) TO TEMP.                             NC1394.2 63 65 48
   000392         039700     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000393         039800     GO TO IND-INIT-002.                                          NC1394.2 397
   000394         039900 IND-DELETE-001.                                                  NC1394.2
   000395         040000     PERFORM DE-LETE.                                             NC1394.2 237
   000396         040100     PERFORM SYNTAX-CHECK-WRITE.                                  NC1394.2 607
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040200 IND-INIT-002.                                                    NC1394.2
   000398         040300*       THIS TEST MIXES SIGNED LITERALS WITH INDEX-NAMES.         NC1394.2
   000399         040400     MOVE ZERO TO REC-CT.                                         NC1394.2 IMP 132
   000400         040500     MOVE SPACE TO TEMP.                                          NC1394.2 IMP 48
   000401         040600     MOVE "GGG" TO EXPECTED-VALUE.                                NC1394.2 49
   000402         040700     MOVE "IND-TEST-002" TO PAR-NAME.                             NC1394.2 85
   000403         040800     SET INDEX1 TO 1.                                             NC1394.2 60
   000404         040900     SET IN1 INDEX2 TO 2.                                         NC1394.2 53 62
   000405         041000     SET IN2 INDEX3 TO 3.                                         NC1394.2 56 65
   000406         041100 IND-TEST-002-01.                                                 NC1394.2
   000407         041200     MOVE ELEM1(IN1, +3) TO TEMP.                                 NC1394.2 54 53 48
   000408         041300     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000409         041400 IND-TEST-002-02.                                                 NC1394.2
   000410         041500     MOVE ELEM1(+2, IN2) TO TEMP.                                 NC1394.2 54 56 48
   000411         041600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000412         041700 IND-TEST-002-03.                                                 NC1394.2
   000413         041800     IF ELEM1 (+2 IN2) EQUAL TO "GGG"                             NC1394.2 54 56
   000414      1  041900         MOVE "GGG" TO TEMP.                                      NC1394.2 48
   000415         042000     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000416         042100 IND-TEST-002-04.                                                 NC1394.2
   000417         042200     IF ELEM1 (IN1  +3) IS EQUAL TO EXPECTED-VALUE                NC1394.2 54 53 49
   000418      1  042300          MOVE "GGG" TO TEMP.                                     NC1394.2 48
   000419         042400     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000420         042500 IND-TEST-002-05.                                                 NC1394.2
   000421         042600     MOVE ELEM2(+1, INDEX2, +3)  TO TEMP.                         NC1394.2 63 62 48
   000422         042700     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000423         042800 IND-TEST-002-06.                                                 NC1394.2
   000424         042900     MOVE ELEM2(+1 INDEX2 +3) TO TEMP.                            NC1394.2 63 62 48
   000425         043000     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000426         043100 IND-TEST-002-07.                                                 NC1394.2
   000427         043200     MOVE ELEM2 (INDEX1  +2, +3) TO TEMP.                         NC1394.2 63 60 48
   000428         043300     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000429         043400 IND-TEST-002-08.                                                 NC1394.2
   000430         043500     MOVE ELEM2 (INDEX1  INDEX2  +3)  TO  TEMP.                   NC1394.2 63 60 62 48
   000431         043600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000432         043700     GO TO IND-INIT-003.                                          NC1394.2 436
   000433         043800 IND-DELETE-002.                                                  NC1394.2
   000434         043900     PERFORM DE-LETE.                                             NC1394.2 237
   000435         044000     PERFORM SYNTAX-CHECK-WRITE.                                  NC1394.2 607
   000436         044100 IND-INIT-003.                                                    NC1394.2
   000437         044200*       THIS TEST MIXES UNSIGNED LITERALS WITH RELATIVE INDEXING. NC1394.2
   000438         044300     MOVE ZERO TO REC-CT.                                         NC1394.2 IMP 132
   000439         044400     MOVE SPACE TO TEMP.                                          NC1394.2 IMP 48
   000440         044500     MOVE "SSS" TO EXPECTED-VALUE.                                NC1394.2 49
   000441         044600     MOVE "IND-TEST-003" TO PAR-NAME.                             NC1394.2 85
   000442         044700     SET IN1 TO 6.                                                NC1394.2 53
   000443         044800     SET INDEX3 TO 4.                                             NC1394.2 65
   000444         044900     SET INDEX2 TO 1.                                             NC1394.2 62
   000445         045000     SET IN2 INDEX1 TO 2.                                         NC1394.2 56 60
   000446         045100 IND-TEST-003-01.                                                 NC1394.2
   000447         045200     MOVE ELEM1(IN1 - 1, 3) TO TEMP.                              NC1394.2 54 53 48
   000448         045300     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000449         045400 IND-TEST-003-02.                                                 NC1394.2
   000450         045500     MOVE ELEM1 ( 5, IN2 + 1) TO TEMP.                            NC1394.2 54 56 48
   000451         045600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000452         045700 IND-TEST-003-03.                                                 NC1394.2
   000453         045800     MOVE ELEM1(IN1 - 1 3) TO TEMP.                               NC1394.2 54 53 48
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045900     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000455         046000 IND-TEST-003-04.                                                 NC1394.2
   000456         046100     MOVE ELEM1 (5 IN2 + 1) TO TEMP.                              NC1394.2 54 56 48
   000457         046200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000458         046300 IND-TEST-003-05.                                                 NC1394.2
   000459         046400     MOVE ELEM2 (3, INDEX2, INDEX3 - 1) TO TEMP.                  NC1394.2 63 62 65 48
   000460         046500     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000461         046600 IND-TEST-003-06.                                                 NC1394.2
   000462         046700     MOVE ELEM2 (3 INDEX2 INDEX3 - 1) TO TEMP.                    NC1394.2 63 62 65 48
   000463         046800     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000464         046900 IND-TEST-003-07.                                                 NC1394.2
   000465         047000     MOVE ELEM2(INDEX1 + 1, 1, 3) TO TEMP.                        NC1394.2 63 60 48
   000466         047100     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000467         047200 IND-TEST-003-08.                                                 NC1394.2
   000468         047300     IF ELEM2(INDEX1 + 1 1 3) IS EQUAL TO "SSS"                   NC1394.2 63 60
   000469      1  047400              MOVE "SSS" TO TEMP.                                 NC1394.2 48
   000470         047500     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000471         047600 IND-TEST-003-09.                                                 NC1394.2
   000472         047700     MOVE ELEM2 (INDEX1 + 1 INDEX2 3) TO TEMP.                    NC1394.2 63 60 62 48
   000473         047800     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000474         047900 IND-TEST-003-10.                                                 NC1394.2
   000475         048000     MOVE ELEM2 (3 1 INDEX3 - 1) TO TEMP.                         NC1394.2 63 65 48
   000476         048100     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000477         048200 IND-TEST-003-11.                                                 NC1394.2
   000478         048300     MOVE ELEM2(INDEX1 + 1 1 INDEX3 - 1) TO TEMP.                 NC1394.2 63 60 65 48
   000479         048400     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000480         048500     GO TO IND-INIT-004.                                          NC1394.2 484
   000481         048600 IND-DELETE-003.                                                  NC1394.2
   000482         048700     PERFORM DE-LETE.                                             NC1394.2 237
   000483         048800     PERFORM SYNTAX-CHECK-WRITE.                                  NC1394.2 607
   000484         048900 IND-INIT-004.                                                    NC1394.2
   000485         049000*        THIS TEST MIXES SIGNED LITERALS WITH RELATIVE INDEXING.  NC1394.2
   000486         049100     MOVE ZERO TO REC-CT.                                         NC1394.2 IMP 132
   000487         049200     MOVE SPACE TO TEMP.                                          NC1394.2 IMP 48
   000488         049300     MOVE "VVV" TO EXPECTED-VALUE.                                NC1394.2 49
   000489         049400     MOVE "IND-TEST-004" TO PAR-NAME.                             NC1394.2 85
   000490         049500     SET IN1 TO 2.                                                NC1394.2 53
   000491         049600     SET IN2 TO 4.                                                NC1394.2 56
   000492         049700     SET INDEX1 TO 2.                                             NC1394.2 60
   000493         049800     SET INDEX2 TO 1.                                             NC1394.2 62
   000494         049900     SET INDEX3 TO 4.                                             NC1394.2 65
   000495         050000 IND-TEST-004-01.                                                 NC1394.2
   000496         050100     MOVE ELEM1(IN1 + 4, +2) TO TEMP.                             NC1394.2 54 53 48
   000497         050200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000498         050300 IND-TEST-004-02.                                                 NC1394.2
   000499         050400     MOVE ELEM1 (IN1 + 4 +2) TO TEMP.                             NC1394.2 54 53 48
   000500         050500     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000501         050600 IND-TEST-004-03.                                                 NC1394.2
   000502         050700     MOVE ELEM1 (+6, IN2 - 2) TO TEMP.                            NC1394.2 54 56 48
   000503         050800     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000504         050900 IND-TEST-004-04.                                                 NC1394.2
   000505         051000     IF ELEM1(+6 IN2 - 2) IS EQUAL TO "VVV"                       NC1394.2 54 56
   000506      1  051100              MOVE "VVV" TO TEMP.                                 NC1394.2 48
   000507         051200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000508         051300 IND-TEST-004-05.                                                 NC1394.2
   000509         051400     IF ELEM2 (INDEX1 + 1, +2, INDEX3 - 2)                        NC1394.2 63 60 65
   000510         051500         IS EQUAL TO EXPECTED-VALUE                               NC1394.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  051600              MOVE "VVV" TO TEMP.                                 NC1394.2 48
   000512         051700     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000513         051800 IND-TEST-004-06.                                                 NC1394.2
   000514         051900     MOVE ELEM2(INDEX1 + 1 +2 INDEX3 - 2)   TO  TEMP.             NC1394.2 63 60 65 48
   000515         052000     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000516         052100 IND-TEST-004-07.                                                 NC1394.2
   000517         052200     MOVE ELEM2 (+3 +2 INDEX3 - 2)  TO TEMP.                      NC1394.2 63 65 48
   000518         052300     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000519         052400 IND-TEST-004-08.                                                 NC1394.2
   000520         052500     MOVE ELEM2 (INDEX1 + 1 +2 +2) TO TEMP.                       NC1394.2 63 60 48
   000521         052600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000522         052700 IND-TEST-004-09.                                                 NC1394.2
   000523         052800     MOVE ELEM2(INDEX1 + 1, INDEX2 + 1, +2) TO TEMP.              NC1394.2 63 60 62 48
   000524         052900     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000525         053000 IND-TEST-004-10.                                                 NC1394.2
   000526         053100     MOVE ELEM2 (+3 INDEX2 + 1 +2) TO TEMP.                       NC1394.2 63 62 48
   000527         053200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000528         053300     GO TO IND-INIT-005.                                          NC1394.2 532
   000529         053400 IND-DELETE-004.                                                  NC1394.2
   000530         053500     PERFORM DE-LETE.                                             NC1394.2 237
   000531         053600     PERFORM SYNTAX-CHECK-WRITE.                                  NC1394.2 607
   000532         053700 IND-INIT-005.                                                    NC1394.2
   000533         053800*        THIS TEST MIXES SIGNED AND UNSIGNED LITERALS             NC1394.2
   000534         053900*    WITH RELATIVE INDEXING.                                      NC1394.2
   000535         054000     MOVE ZERO TO REC-CT.                                         NC1394.2 IMP 132
   000536         054100     MOVE SPACE TO TEMP.                                          NC1394.2 IMP 48
   000537         054200     MOVE "PPP" TO EXPECTED-VALUE.                                NC1394.2 49
   000538         054300     MOVE "IND-TEST-005" TO PAR-NAME.                             NC1394.2 85
   000539         054400     SET INDEX1 TO 3.                                             NC1394.2 60
   000540         054500     SET INDEX2 TO 1.                                             NC1394.2 62
   000541         054600     SET INDEX3 TO 2.                                             NC1394.2 65
   000542         054700 IND-TEST-005-01.                                                 NC1394.2
   000543         054800     MOVE ELEM2 (+2, INDEX2 + 1, 4)  TO  TEMP.                    NC1394.2 63 62 48
   000544         054900     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000545         055000 IND-TEST-005-02.                                                 NC1394.2
   000546         055100     MOVE ELEM2(+2 INDEX2 + 1 4) TO TEMP.                         NC1394.2 63 62 48
   000547         055200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000548         055300 IND-TEST-005-03.                                                 NC1394.2
   000549         055400     MOVE ELEM2 (2 +2 INDEX3 + 2) TO TEMP.                        NC1394.2 63 65 48
   000550         055500     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000551         055600 IND-TEST-005-04.                                                 NC1394.2
   000552         055700     IF ELEM2 (INDEX1 - 1, 2  +4) IS EQUAL TO EXPECTED-VALUE      NC1394.2 63 60 49
   000553      1  055800              MOVE "PPP" TO TEMP.                                 NC1394.2 48
   000554         055900     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000555         056000 IND-TEST-005-05.                                                 NC1394.2
   000556         056100     MOVE ELEM2(+2 2 INDEX3 + 2) TO TEMP.                         NC1394.2 63 65 48
   000557         056200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000558         056300     GO TO CCVS-EXIT.                                             NC1394.2 610
   000559         056400 IND-DELETE-005.                                                  NC1394.2
   000560         056500     PERFORM DE-LETE.                                             NC1394.2 237
   000561         056600     PERFORM SYNTAX-CHECK-WRITE.                                  NC1394.2 607
   000562         056700 IND-INIT-006.                                                    NC1394.2
   000563         056800     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC1394.2 141
   000564         056900*        THIS TEST MIXES DATA-NAMES WITH RELATIVE INDEXING.       NC1394.2
   000565         057000     MOVE ZERO TO REC-CT.                                         NC1394.2 IMP 132
   000566         057100     MOVE SPACE TO TEMP.                                          NC1394.2 IMP 48
   000567         057200     MOVE "PPP" TO EXPECTED-VALUE.                                NC1394.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057300     MOVE "IND-TEST-006" TO PAR-NAME.                             NC1394.2 85
   000569         057400     SET INDEX1 TO 3.                                             NC1394.2 60
   000570         057500     SET INDEX2 TO 1.                                             NC1394.2 62
   000571         057600     SET INDEX3 TO 2.                                             NC1394.2 65
   000572         057700     MOVE    2 TO WS-2.                                           NC1394.2 44
   000573         057800     MOVE   +2 TO WS-PLUS-2.                                      NC1394.2 45
   000574         057900     MOVE    4 TO WS-4.                                           NC1394.2 46
   000575         058000     MOVE   +4 TO WS-PLUS-4.                                      NC1394.2 47
   000576         058100 IND-TEST-006-01.                                                 NC1394.2
   000577         058200     MOVE ELEM2 (WS-PLUS-2, INDEX2 + 1,  WS-4)  TO  TEMP.         NC1394.2 63 45 62 46 48
   000578         058300     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000579         058400 IND-TEST-006-02.                                                 NC1394.2
   000580         058500     MOVE ELEM2(WS-PLUS-2 INDEX2 + 1  WS-4) TO TEMP.              NC1394.2 63 45 62 46 48
   000581         058600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000582         058700 IND-TEST-006-03.                                                 NC1394.2
   000583         058800     MOVE ELEM2 ( WS-2 WS-PLUS-2 INDEX3 + 2) TO TEMP.             NC1394.2 63 44 45 65 48
   000584         058900     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000585         059000 IND-TEST-006-04.                                                 NC1394.2
   000586         059100     IF ELEM2 (INDEX1 - 1,  WS-2   WS-PLUS-4) = EXPECTED-VALUE    NC1394.2 63 60 44 47 49
   000587      1  059200              MOVE "PPP" TO TEMP.                                 NC1394.2 48
   000588         059300     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000589         059400 IND-TEST-006-05.                                                 NC1394.2
   000590         059500     MOVE ELEM2(WS-PLUS-2  WS-2 INDEX3 + 2) TO TEMP.              NC1394.2 63 45 44 65 48
   000591         059600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1394.2 598 607
   000592         059700     GO TO CCVS-EXIT.                                             NC1394.2 610
   000593         059800 IND-DELETE-006.                                                  NC1394.2
   000594         059900     PERFORM DE-LETE.                                             NC1394.2 237
   000595         060000     PERFORM SYNTAX-CHECK-WRITE.                                  NC1394.2 607
   000596         060100     GO TO CCVS-EXIT.                                             NC1394.2 610
   000597         060200 SECT-TH110-0003 SECTION.                                         NC1394.2
   000598         060300 SYNTAX-CHECK.                                                    NC1394.2
   000599         060400     ADD 1 TO REC-CT.                                             NC1394.2 132
   000600         060500     IF TEMP IS EQUAL TO EXPECTED-VALUE                           NC1394.2 48 49
   000601      1  060600              PERFORM PASS                                        NC1394.2 235
   000602      1  060700              GO TO SYNTAX-CHECK-WRITE.                           NC1394.2 607
   000603         060800 SYNTAX-FAIL.                                                     NC1394.2
   000604         060900     PERFORM FAIL.                                                NC1394.2 236
   000605         061000     MOVE TEMP TO COMPUTED-A.                                     NC1394.2 48 96
   000606         061100     MOVE EXPECTED-VALUE TO CORRECT-A.                            NC1394.2 49 110
   000607         061200 SYNTAX-CHECK-WRITE.                                              NC1394.2
   000608         061300     PERFORM PRINT-DETAIL.                                        NC1394.2 239
   000609         061400     MOVE SPACE TO TEMP.                                          NC1394.2 IMP 48
   000610         061500 CCVS-EXIT SECTION.                                               NC1394.2
   000611         061600 CCVS-999999.                                                     NC1394.2
   000612         061700     GO TO CLOSE-FILES.                                           NC1394.2 228
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      141   ANSI-REFERENCE . . . . . . . .  318 325 334 M347 M563
      120   CCVS-C-1 . . . . . . . . . . .  257 303
      125   CCVS-C-2 . . . . . . . . . . .  258 304
      175   CCVS-E-1 . . . . . . . . . . .  263
      180   CCVS-E-2 . . . . . . . . . . .  272 279 286 291
      183   CCVS-E-2-2 . . . . . . . . . .  M271
      188   CCVS-E-3 . . . . . . . . . . .  292
      197   CCVS-E-4 . . . . . . . . . . .  271
      198   CCVS-E-4-1 . . . . . . . . . .  M269
      200   CCVS-E-4-2 . . . . . . . . . .  M270
      142   CCVS-H-1 . . . . . . . . . . .  252 299
      147   CCVS-H-2A. . . . . . . . . . .  253 300
      156   CCVS-H-2B. . . . . . . . . . .  254 301
      168   CCVS-H-3 . . . . . . . . . . .  255 302
      218   CCVS-PGM-ID. . . . . . . . . .  224 224
      102   CM-18V0
       96   COMPUTED-A . . . . . . . . . .  97 99 100 101 102 330 333 M605
       97   COMPUTED-N
       95   COMPUTED-X . . . . . . . . . .  M247 315
       99   COMPUTED-0V18
      101   COMPUTED-14V4
      103   COMPUTED-18V0
      100   COMPUTED-4V14
      119   COR-ANSI-REFERENCE . . . . . .  M325 M327
      110   CORRECT-A. . . . . . . . . . .  111 112 113 114 115 331 333 M606
      111   CORRECT-N
      109   CORRECT-X. . . . . . . . . . .  M248 317
      112   CORRECT-0V18
      114   CORRECT-14V4
      116   CORRECT-18V0
      113   CORRECT-4V14
      115   CR-18V0
      133   DELETE-COUNTER . . . . . . . .  M237 266 282 284
       88   DOTVALUE . . . . . . . . . . .  M242
      139   DUMMY-HOLD . . . . . . . . . .  M296 306
       38   DUMMY-RECORD . . . . . . . . .  M252 M253 M254 M255 M257 M258 M259 M261 M263 M272 M279 M286 M291 M292 296 M297
                                            298 M299 M300 M301 M302 M303 M304 M305 M306 310 M311 M320 M335
       54   ELEM1. . . . . . . . . . . . .  373 376 379 407 410 413 417 447 450 453 456 496 499 502 505
       63   ELEM2. . . . . . . . . . . . .  382 385 388 391 421 424 427 430 459 462 465 468 472 475 478 509 514 517 520 523
                                            526 543 546 549 552 556 577 580 583 586 590
      186   ENDER-DESC . . . . . . . . . .  M274 M285 M290
      134   ERROR-COUNTER. . . . . . . . .  M236 265 275 278
      138   ERROR-HOLD . . . . . . . . . .  M265 M266 M266 M267 270
      184   ERROR-TOTAL. . . . . . . . . .  M276 M278 M283 M284 M288 M289
       49   EXPECTED-VALUE . . . . . . . .  M367 M401 417 M440 M488 510 M537 552 M567 586 600 606
       81   FEATURE. . . . . . . . . . . .  M371
       51   GRP-TAB1 . . . . . . . . . . .  358
       58   GRP-TAB2 . . . . . . . . . . .  M358
       52   GRP-1. . . . . . . . . . . . .  M352 M353 M354 M355 M356 M357
       59   GRP-2
       61   GRP-3
      212   HYPHEN-LINE. . . . . . . . . .  259 261 305
      178   ID-AGAIN . . . . . . . . . . .  M224
       60   INDEX1 . . . . . . . . . . . .  M366 385 388 M403 427 430 M445 465 468 472 478 M492 509 514 520 523 M539 552
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page    15
0 Defined   Cross-reference of data names   References

0                                           M569 586
       62   INDEX2 . . . . . . . . . . . .  M366 382 385 M404 421 424 430 M444 459 462 472 M493 523 526 M540 543 546 M570
                                            577 580
       65   INDEX3 . . . . . . . . . . . .  M366 388 391 M405 M443 459 462 475 478 M494 509 514 517 M541 549 556 M571 583
                                            590
      211   INF-ANSI-REFERENCE . . . . . .  M318 M321 M334 M336
      206   INFO-TEXT. . . . . . . . . . .  M319
      135   INSPECT-COUNTER. . . . . . . .  M234 265 287 289
       53   IN1. . . . . . . . . . . . . .  M351 352 353 354 355 356 357 M365 373 M404 407 417 M442 447 453 M490 496 499
       56   IN2. . . . . . . . . . . . . .  M365 376 379 M405 410 413 M445 450 456 M491 502 505
       83   P-OR-F . . . . . . . . . . . .  M234 M235 M236 M237 244 M247
       85   PAR-NAME . . . . . . . . . . .  M249 M370 M402 M441 M489 M538 M568
       87   PARDOT-X . . . . . . . . . . .  M241
      136   PASS-COUNTER . . . . . . . . .  M235 267 269
       36   PRINT-FILE . . . . . . . . . .  32 223 229
       37   PRINT-REC. . . . . . . . . . .  M243 M324 M326
       90   RE-MARK. . . . . . . . . . . .  M238 M250
      132   REC-CT . . . . . . . . . . . .  240 242 249 M369 M399 M438 M486 M535 M565 M599
      131   REC-SKL-SUB
      140   RECORD-COUNT . . . . . . . . .  M294 295 M307
       66   TABLE-VALUES
       48   TEMP . . . . . . . . . . . . .  M368 M373 M376 M379 M382 M385 M388 M391 M400 M407 M410 M414 M418 M421 M424 M427
                                            M430 M439 M447 M450 M453 M456 M459 M462 M465 M469 M472 M475 M478 M487 M496 M499
                                            M502 M506 M511 M514 M517 M520 M523 M526 M536 M543 M546 M549 M553 M556 M566 M577
                                            M580 M583 M587 M590 600 605 M609
       91   TEST-COMPUTED. . . . . . . . .  324
      106   TEST-CORRECT . . . . . . . . .  326
      159   TEST-ID. . . . . . . . . . . .  M224
       79   TEST-RESULTS . . . . . . . . .  M225 243
      137   TOTAL-ERROR
       67   VALUES-1 . . . . . . . . . . .  352
       69   VALUES-2 . . . . . . . . . . .  353
       71   VALUES-3 . . . . . . . . . . .  354
       73   VALUES-4 . . . . . . . . . . .  355
       75   VALUES-5 . . . . . . . . . . .  356
       77   VALUES-6 . . . . . . . . . . .  357
       45   WS-PLUS-2. . . . . . . . . . .  M573 577 580 583 590
       47   WS-PLUS-4. . . . . . . . . . .  M575 586
       44   WS-2 . . . . . . . . . . . . .  M572 583 586 590
       46   WS-4 . . . . . . . . . . . . .  M574 577 580
      208   XXCOMPUTED . . . . . . . . . .  M333
      210   XXCORRECT. . . . . . . . . . .  M333
      203   XXINFO . . . . . . . . . . . .  320 335
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page    16
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

      329   BAIL-OUT . . . . . . . . . . .  P246
      337   BAIL-OUT-EX. . . . . . . . . .  E246 G331
      332   BAIL-OUT-WRITE . . . . . . . .  G330
      312   BLANK-LINE-PRINT
      350   BUILD-TABLE
      610   CCVS-EXIT. . . . . . . . . . .  G558 G592 G596
      611   CCVS-999999
      221   CCVS1
      338   CCVS1-EXIT . . . . . . . . . .  G227
      228   CLOSE-FILES. . . . . . . . . .  G612
      256   COLUMN-NAMES-ROUTINE . . . . .  E226
      237   DE-LETE. . . . . . . . . . . .  P395 P434 P482 P530 P560 P594
      260   END-ROUTINE. . . . . . . . . .  P229
      264   END-ROUTINE-1
      273   END-ROUTINE-12
      281   END-ROUTINE-13 . . . . . . . .  E229
      262   END-RTN-EXIT
      236   FAIL . . . . . . . . . . . . .  P604
      314   FAIL-ROUTINE . . . . . . . . .  P245
      328   FAIL-ROUTINE-EX. . . . . . . .  E245 G322
      323   FAIL-ROUTINE-WRITE . . . . . .  G316 G317
      251   HEAD-ROUTINE . . . . . . . . .  P226
      394   IND-DELETE-001
      433   IND-DELETE-002
      481   IND-DELETE-003
      529   IND-DELETE-004
      559   IND-DELETE-005
      593   IND-DELETE-006
      363   IND-INIT-001
      397   IND-INIT-002 . . . . . . . . .  G393
      436   IND-INIT-003 . . . . . . . . .  G432
      484   IND-INIT-004 . . . . . . . . .  G480
      532   IND-INIT-005 . . . . . . . . .  G528
      562   IND-INIT-006
      372   IND-TEST-001-01
      375   IND-TEST-001-02
      378   IND-TEST-001-03
      381   IND-TEST-001-04
      384   IND-TEST-001-05
      387   IND-TEST-001-06
      390   IND-TEST-001-07
      406   IND-TEST-002-01
      409   IND-TEST-002-02
      412   IND-TEST-002-03
      416   IND-TEST-002-04
      420   IND-TEST-002-05
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page    17
0 Defined   Cross-reference of procedures   References

0     423   IND-TEST-002-06
      426   IND-TEST-002-07
      429   IND-TEST-002-08
      446   IND-TEST-003-01
      449   IND-TEST-003-02
      452   IND-TEST-003-03
      455   IND-TEST-003-04
      458   IND-TEST-003-05
      461   IND-TEST-003-06
      464   IND-TEST-003-07
      467   IND-TEST-003-08
      471   IND-TEST-003-09
      474   IND-TEST-003-10
      477   IND-TEST-003-11
      495   IND-TEST-004-01
      498   IND-TEST-004-02
      501   IND-TEST-004-03
      504   IND-TEST-004-04
      508   IND-TEST-004-05
      513   IND-TEST-004-06
      516   IND-TEST-004-07
      519   IND-TEST-004-08
      522   IND-TEST-004-09
      525   IND-TEST-004-10
      542   IND-TEST-005-01
      545   IND-TEST-005-02
      548   IND-TEST-005-03
      551   IND-TEST-005-04
      555   IND-TEST-005-05
      576   IND-TEST-006-01
      579   IND-TEST-006-02
      582   IND-TEST-006-03
      585   IND-TEST-006-04
      589   IND-TEST-006-05
      234   INSPT
      346   NC139A-001
      222   OPEN-FILES
      235   PASS . . . . . . . . . . . . .  P601
      239   PRINT-DETAIL . . . . . . . . .  P608
      345   SECT-NC139A-001
      359   SECT-TH110-0002
      597   SECT-TH110-0003
      598   SYNTAX-CHECK . . . . . . . . .  P374 P377 P380 P383 P386 P389 P392 P408 P411 P415 P419 P422 P425 P428 P431 P448
                                            P451 P454 P457 P460 P463 P466 P470 P473 P476 P479 P497 P500 P503 P507 P512 P515
                                            P518 P521 P524 P527 P544 P547 P550 P554 P557 P578 P581 P584 P588 P591
      607   SYNTAX-CHECK-WRITE . . . . . .  E374 E377 E380 E383 E386 E389 E392 P396 E408 E411 E415 E419 E422 E425 E428 E431
                                            P435 E448 E451 E454 E457 E460 E463 E466 E470 E473 E476 E479 P483 E497 E500 E503
                                            E507 E512 E515 E518 E521 E524 E527 P531 E544 E547 E550 E554 E557 P561 E578 E581
                                            E584 E588 E591 P595 G602
      603   SYNTAX-FAIL
      232   TERMINATE-CALL
      230   TERMINATE-CCVS
      293   WRITE-LINE . . . . . . . . . .  P243 P244 P252 P253 P254 P255 P257 P258 P259 P261 P263 P272 P280 P286 P291 P292
                                            P320 P324 P326 P335
      309   WRT-LN . . . . . . . . . . . .  P299 P300 P301 P302 P303 P304 P305 P308 P313
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page    18
0 Defined   Cross-reference of programs     References

        3   NC139A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC139A    Date 06/04/2022  Time 11:59:06   Page    19
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC139A:
 *    Source records = 612
 *    Data Division statements = 83
 *    Procedure Division statements = 322
 *    Generated COBOL statements = 0
 *    Program complexity factor = 331
0End of compilation 1,  program NC139A,  highest severity 0.
0Return code 0
