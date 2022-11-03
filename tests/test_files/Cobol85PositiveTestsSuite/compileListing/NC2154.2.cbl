1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:53   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:53   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2154.2
   000002         000200 PROGRAM-ID.                                                      NC2154.2
   000003         000300     NC215A.                                                      NC2154.2
   000004         000500*                                                              *  NC2154.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2154.2
   000006         000700*                                                              *  NC2154.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2154.2
   000008         000900*                                                              *  NC2154.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2154.2
   000010         001100*                                                              *  NC2154.2
   000011         001300*                                                              *  NC2154.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2154.2
   000013         001500*                                                              *  NC2154.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2154.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2154.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2154.2
   000017         001900*                                                              *  NC2154.2
   000018         002100*                                                                 NC2154.2
   000019         002200*                                                              *  NC2154.2
   000020         002300*    PROGRAM NC215A TESTS THE LITERAL PHRASE OF THE "ALPHABET" *  NC2154.2
   000021         002400*    CLAUSE OF THE "SPECIAL-NAMES" PARAGRAPH AND THE           *  NC2154.2
   000022         002500*    "PROGRAM COLLATING SEQUENCE" OF THE "OBJECT COMPUTER      *  NC2154.2
   000023         002600*    PARAGRAPH.                                                *  NC2154.2
   000024         002700*                                                              *  NC2154.2
   000025         002900 ENVIRONMENT DIVISION.                                            NC2154.2
   000026         003000 CONFIGURATION SECTION.                                           NC2154.2
   000027         003100 SOURCE-COMPUTER.                                                 NC2154.2
   000028         003200     XXXXX082.                                                    NC2154.2
   000029         003300 OBJECT-COMPUTER.                                                 NC2154.2
   000030         003400     XXXXX083                                                     NC2154.2
   000031         003500     PROGRAM COLLATING SEQUENCE IS THE-WILD-ONE.                  NC2154.2 34
   000032         003600 SPECIAL-NAMES.                                                   NC2154.2
   000033         003700     ALPHABET                                                     NC2154.2
   000034         003800     THE-WILD-ONE IS "A" THRU "H" "I" ALSO "J", ALSO "K", ALSO    NC2154.2
   000035         003900     "L" ALSO "M" ALSO "N" "O" THROUGH "Z" "0" THRU "9",          NC2154.2
   000036         004000*                                                                 NC2154.2
   000037         004100*                                                                 NC2154.2
   000038         004200*ALPHABET-TEST-10     *****     THE WHOLE ALPHABET IS ONE LITERAL NC2154.2
   000039         004300*    WITH ALL 51 CHARACTERS IN THE COBOL CHARACTER SET.  TEST-10  NC2154.2
   000040         004400*    IS ONLY A SYNTAX CHECK ON                                    NC2154.2
   000041         004500*            ALPHABET-NAME IS LITERAL.                            NC2154.2
   000042         004600*                                                                 NC2154.2
   000043         004700*                                                                 NC2154.2
   000044         004800     ALPHABET                                                     NC2154.2
   000045         004900     THE-BIG-OL-LITERAL-ALPHABET IS "A+0B-1C*2D/3E=4Fl5G,6H;7I.8J"NC2154.2
   000046         005000-    ""9K(L)M>N<O PQRSTUVWXYZ".                                   NC2154.2
   000047         005100*                                                                 NC2154.2
   000048         005200*                                                                 NC2154.2
   000049         005300 INPUT-OUTPUT SECTION.                                            NC2154.2
   000050         005400 FILE-CONTROL.                                                    NC2154.2
   000051         005500     SELECT PRINT-FILE ASSIGN TO                                  NC2154.2 55
   000052         005600     XXXXX055.                                                    NC2154.2
   000053         005700 DATA DIVISION.                                                   NC2154.2
   000054         005800 FILE SECTION.                                                    NC2154.2
   000055         005900 FD  PRINT-FILE.                                                  NC2154.2

 ==000055==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0
   000056         006000 01  PRINT-REC PICTURE X(120).                                    NC2154.2
   000057         006100 01  DUMMY-RECORD PICTURE X(120).                                 NC2154.2
   000058         006200 WORKING-STORAGE SECTION.                                         NC2154.2
   000059         006300 01  A-AN-1 PIC A VALUE "A".                                      NC2154.2
   000060         006400 01  B-AN-1 PIC A VALUE "B".                                      NC2154.2
   000061         006500 01  H-AN-1 PIC A VALUE "H".                                      NC2154.2
   000062         006600 01  I-AN-1 PIC A VALUE "I".                                      NC2154.2
   000063         006700 01  J-AN-1 PIC A VALUE "J".                                      NC2154.2
   000064         006800 01  K-AN-1 PIC A VALUE "K".                                      NC2154.2
   000065         006900 01  L-AN-1 PIC A VALUE "L".                                      NC2154.2
   000066         007000 01  M-AN-1 PIC A VALUE "M".                                      NC2154.2
   000067         007100 01  N-AN-1 PIC A VALUE "N".                                      NC2154.2
   000068         007200 01  O-AN-1 PIC A VALUE "O".                                      NC2154.2
   000069         007300 01  ZERO-DU-9V0-1 PIC 9 VALUE ZERO.                              NC2154.2 IMP
   000070         007400 01  NINE-DU-9V0-1 PIC 9 VALUE 9.                                 NC2154.2
   000071         007500 01  TEST-RESULTS.                                                NC2154.2
   000072         007600     02 FILLER                   PIC X      VALUE SPACE.          NC2154.2 IMP
   000073         007700     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2154.2 IMP
   000074         007800     02 FILLER                   PIC X      VALUE SPACE.          NC2154.2 IMP
   000075         007900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2154.2 IMP
   000076         008000     02 FILLER                   PIC X      VALUE SPACE.          NC2154.2 IMP
   000077         008100     02  PAR-NAME.                                                NC2154.2
   000078         008200       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2154.2 IMP
   000079         008300       03  PARDOT-X              PIC X      VALUE SPACE.          NC2154.2 IMP
   000080         008400       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2154.2 IMP
   000081         008500     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2154.2 IMP
   000082         008600     02 RE-MARK                  PIC X(61).                       NC2154.2
   000083         008700 01  TEST-COMPUTED.                                               NC2154.2
   000084         008800     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2154.2 IMP
   000085         008900     02 FILLER                   PIC X(17)  VALUE                 NC2154.2
   000086         009000            "       COMPUTED=".                                   NC2154.2
   000087         009100     02 COMPUTED-X.                                               NC2154.2
   000088         009200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2154.2 IMP
   000089         009300     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2154.2 88
   000090         009400                                 PIC -9(9).9(9).                  NC2154.2
   000091         009500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2154.2 88
   000092         009600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2154.2 88
   000093         009700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2154.2 88
   000094         009800     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2154.2 88
   000095         009900         04 COMPUTED-18V0                    PIC -9(18).          NC2154.2
   000096         010000         04 FILLER                           PIC X.               NC2154.2
   000097         010100     03 FILLER PIC X(50) VALUE SPACE.                             NC2154.2 IMP
   000098         010200 01  TEST-CORRECT.                                                NC2154.2
   000099         010300     02 FILLER PIC X(30) VALUE SPACE.                             NC2154.2 IMP
   000100         010400     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2154.2
   000101         010500     02 CORRECT-X.                                                NC2154.2
   000102         010600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2154.2 IMP
   000103         010700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2154.2 102
   000104         010800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2154.2 102
   000105         010900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2154.2 102
   000106         011000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2154.2 102
   000107         011100     03      CR-18V0 REDEFINES CORRECT-A.                         NC2154.2 102
   000108         011200         04 CORRECT-18V0                     PIC -9(18).          NC2154.2
   000109         011300         04 FILLER                           PIC X.               NC2154.2
   000110         011400     03 FILLER PIC X(2) VALUE SPACE.                              NC2154.2 IMP
   000111         011500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2154.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  CCVS-C-1.                                                    NC2154.2
   000113         011700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2154.2
   000114         011800-    "SS  PARAGRAPH-NAME                                          NC2154.2
   000115         011900-    "       REMARKS".                                            NC2154.2
   000116         012000     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2154.2 IMP
   000117         012100 01  CCVS-C-2.                                                    NC2154.2
   000118         012200     02 FILLER                     PIC X        VALUE SPACE.      NC2154.2 IMP
   000119         012300     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2154.2
   000120         012400     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2154.2 IMP
   000121         012500     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2154.2
   000122         012600     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2154.2 IMP
   000123         012700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2154.2 IMP
   000124         012800 01  REC-CT                        PIC 99       VALUE ZERO.       NC2154.2 IMP
   000125         012900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2154.2 IMP
   000126         013000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2154.2 IMP
   000127         013100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2154.2 IMP
   000128         013200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2154.2 IMP
   000129         013300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2154.2 IMP
   000130         013400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2154.2 IMP
   000131         013500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2154.2 IMP
   000132         013600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2154.2 IMP
   000133         013700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2154.2 IMP
   000134         013800 01  CCVS-H-1.                                                    NC2154.2
   000135         013900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2154.2 IMP
   000136         014000     02  FILLER                    PIC X(42)    VALUE             NC2154.2
   000137         014100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2154.2
   000138         014200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2154.2 IMP
   000139         014300 01  CCVS-H-2A.                                                   NC2154.2
   000140         014400   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2154.2 IMP
   000141         014500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2154.2
   000142         014600   02  FILLER                        PIC XXXX   VALUE             NC2154.2
   000143         014700     "4.2 ".                                                      NC2154.2
   000144         014800   02  FILLER                        PIC X(28)  VALUE             NC2154.2
   000145         014900            " COPY - NOT FOR DISTRIBUTION".                       NC2154.2
   000146         015000   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2154.2 IMP
   000147         015100                                                                  NC2154.2
   000148         015200 01  CCVS-H-2B.                                                   NC2154.2
   000149         015300   02  FILLER                        PIC X(15)  VALUE             NC2154.2
   000150         015400            "TEST RESULT OF ".                                    NC2154.2
   000151         015500   02  TEST-ID                       PIC X(9).                    NC2154.2
   000152         015600   02  FILLER                        PIC X(4)   VALUE             NC2154.2
   000153         015700            " IN ".                                               NC2154.2
   000154         015800   02  FILLER                        PIC X(12)  VALUE             NC2154.2
   000155         015900     " HIGH       ".                                              NC2154.2
   000156         016000   02  FILLER                        PIC X(22)  VALUE             NC2154.2
   000157         016100            " LEVEL VALIDATION FOR ".                             NC2154.2
   000158         016200   02  FILLER                        PIC X(58)  VALUE             NC2154.2
   000159         016300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2154.2
   000160         016400 01  CCVS-H-3.                                                    NC2154.2
   000161         016500     02  FILLER                      PIC X(34)  VALUE             NC2154.2
   000162         016600            " FOR OFFICIAL USE ONLY    ".                         NC2154.2
   000163         016700     02  FILLER                      PIC X(58)  VALUE             NC2154.2
   000164         016800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2154.2
   000165         016900     02  FILLER                      PIC X(28)  VALUE             NC2154.2
   000166         017000            "  COPYRIGHT   1985 ".                                NC2154.2
   000167         017100 01  CCVS-E-1.                                                    NC2154.2
   000168         017200     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2154.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2154.2
   000170         017400     02 ID-AGAIN                     PIC X(9).                    NC2154.2
   000171         017500     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2154.2 IMP
   000172         017600 01  CCVS-E-2.                                                    NC2154.2
   000173         017700     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2154.2 IMP
   000174         017800     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2154.2 IMP
   000175         017900     02 CCVS-E-2-2.                                               NC2154.2
   000176         018000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2154.2 IMP
   000177         018100         03 FILLER                   PIC X      VALUE SPACE.      NC2154.2 IMP
   000178         018200         03 ENDER-DESC               PIC X(44)  VALUE             NC2154.2
   000179         018300            "ERRORS ENCOUNTERED".                                 NC2154.2
   000180         018400 01  CCVS-E-3.                                                    NC2154.2
   000181         018500     02  FILLER                      PIC X(22)  VALUE             NC2154.2
   000182         018600            " FOR OFFICIAL USE ONLY".                             NC2154.2
   000183         018700     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2154.2 IMP
   000184         018800     02  FILLER                      PIC X(58)  VALUE             NC2154.2
   000185         018900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2154.2
   000186         019000     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2154.2 IMP
   000187         019100     02 FILLER                       PIC X(15)  VALUE             NC2154.2
   000188         019200             " COPYRIGHT 1985".                                   NC2154.2
   000189         019300 01  CCVS-E-4.                                                    NC2154.2
   000190         019400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2154.2 IMP
   000191         019500     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2154.2
   000192         019600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2154.2 IMP
   000193         019700     02 FILLER                       PIC X(40)  VALUE             NC2154.2
   000194         019800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2154.2
   000195         019900 01  XXINFO.                                                      NC2154.2
   000196         020000     02 FILLER                       PIC X(19)  VALUE             NC2154.2
   000197         020100            "*** INFORMATION ***".                                NC2154.2
   000198         020200     02 INFO-TEXT.                                                NC2154.2
   000199         020300       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2154.2 IMP
   000200         020400       04 XXCOMPUTED                 PIC X(20).                   NC2154.2
   000201         020500       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2154.2 IMP
   000202         020600       04 XXCORRECT                  PIC X(20).                   NC2154.2
   000203         020700     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2154.2
   000204         020800 01  HYPHEN-LINE.                                                 NC2154.2
   000205         020900     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2154.2 IMP
   000206         021000     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2154.2
   000207         021100-    "*****************************************".                 NC2154.2
   000208         021200     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2154.2
   000209         021300-    "******************************".                            NC2154.2
   000210         021400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2154.2
   000211         021500     "NC215A".                                                    NC2154.2
   000212         021600 PROCEDURE DIVISION.                                              NC2154.2
   000213         021700 CCVS1 SECTION.                                                   NC2154.2
   000214         021800 OPEN-FILES.                                                      NC2154.2
   000215         021900     OPEN     OUTPUT PRINT-FILE.                                  NC2154.2 55
   000216         022000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2154.2 210 151 210 170
   000217         022100     MOVE    SPACE TO TEST-RESULTS.                               NC2154.2 IMP 71
   000218         022200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2154.2 243 248
   000219         022300     GO TO CCVS1-EXIT.                                            NC2154.2 325
   000220         022400 CLOSE-FILES.                                                     NC2154.2
   000221         022500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2154.2 252 273 55
   000222         022600 TERMINATE-CCVS.                                                  NC2154.2
   000223         022700     EXIT PROGRAM.                                                NC2154.2
   000224         022800 TERMINATE-CALL.                                                  NC2154.2
   000225         022900     STOP     RUN.                                                NC2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2154.2 75 127
   000227         023100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2154.2 75 128
   000228         023200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2154.2 75 126
   000229         023300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2154.2 75 125
   000230         023400     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2154.2 82
   000231         023500 PRINT-DETAIL.                                                    NC2154.2
   000232         023600     IF REC-CT NOT EQUAL TO ZERO                                  NC2154.2 124 IMP
   000233      1  023700             MOVE "." TO PARDOT-X                                 NC2154.2 79
   000234      1  023800             MOVE REC-CT TO DOTVALUE.                             NC2154.2 124 80
   000235         023900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2154.2 71 56 285
   000236         024000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2154.2 75 285
   000237      1  024100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2154.2 302 315
   000238      1  024200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2154.2 316 324
   000239         024300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2154.2 IMP 75 IMP 87
   000240         024400     MOVE SPACE TO CORRECT-X.                                     NC2154.2 IMP 101
   000241         024500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2154.2 124 IMP IMP 77
   000242         024600     MOVE     SPACE TO RE-MARK.                                   NC2154.2 IMP 82
   000243         024700 HEAD-ROUTINE.                                                    NC2154.2
   000244         024800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2154.2 134 57 285
   000245         024900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2154.2 139 57 285
   000246         025000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2154.2 148 57 285
   000247         025100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2154.2 160 57 285
   000248         025200 COLUMN-NAMES-ROUTINE.                                            NC2154.2
   000249         025300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2154.2 112 57 285
   000250         025400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2154.2 117 57 285
   000251         025500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2154.2 204 57 285
   000252         025600 END-ROUTINE.                                                     NC2154.2
   000253         025700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2154.2 204 57 285
   000254         025800 END-RTN-EXIT.                                                    NC2154.2
   000255         025900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2154.2 167 57 285
   000256         026000 END-ROUTINE-1.                                                   NC2154.2
   000257         026100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2154.2 126 130 127
   000258         026200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2154.2 130 125 130
   000259         026300      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2154.2 128 130
   000260         026400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2154.2
   000261         026500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2154.2 128 190
   000262         026600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2154.2 130 192
   000263         026700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2154.2 189 175
   000264         026800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2154.2 172 57 285
   000265         026900  END-ROUTINE-12.                                                 NC2154.2
   000266         027000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2154.2 178
   000267         027100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2154.2 126 IMP
   000268      1  027200         MOVE "NO " TO ERROR-TOTAL                                NC2154.2 176
   000269         027300         ELSE                                                     NC2154.2
   000270      1  027400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2154.2 126 176
   000271         027500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2154.2 172 57
   000272         027600     PERFORM WRITE-LINE.                                          NC2154.2 285
   000273         027700 END-ROUTINE-13.                                                  NC2154.2
   000274         027800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2154.2 125 IMP
   000275      1  027900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2154.2 176
   000276      1  028000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2154.2 125 176
   000277         028100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2154.2 178
   000278         028200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2154.2 172 57 285
   000279         028300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2154.2 127 IMP
   000280      1  028400          MOVE "NO " TO ERROR-TOTAL                               NC2154.2 176
   000281      1  028500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2154.2 127 176
   000282         028600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2154.2 178
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2154.2 172 57 285
   000284         028800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2154.2 180 57 285
   000285         028900 WRITE-LINE.                                                      NC2154.2
   000286         029000     ADD 1 TO RECORD-COUNT.                                       NC2154.2 132
   000287         029100     IF RECORD-COUNT GREATER 50                                   NC2154.2 132
   000288      1  029200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2154.2 57 131
   000289      1  029300         MOVE SPACE TO DUMMY-RECORD                               NC2154.2 IMP 57
   000290      1  029400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2154.2 57
   000291      1  029500         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2154.2 112 57 297
   000292      1  029600         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2154.2 117 57 297
   000293      1  029700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2154.2 204 57 297
   000294      1  029800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2154.2 131 57
   000295      1  029900         MOVE ZERO TO RECORD-COUNT.                               NC2154.2 IMP 132
   000296         030000     PERFORM WRT-LN.                                              NC2154.2 297
   000297         030100 WRT-LN.                                                          NC2154.2
   000298         030200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2154.2 57
   000299         030300     MOVE SPACE TO DUMMY-RECORD.                                  NC2154.2 IMP 57
   000300         030400 BLANK-LINE-PRINT.                                                NC2154.2
   000301         030500     PERFORM WRT-LN.                                              NC2154.2 297
   000302         030600 FAIL-ROUTINE.                                                    NC2154.2
   000303         030700     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2154.2 87 IMP 310
   000304         030800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2154.2 101 IMP 310
   000305         030900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2154.2 133 203
   000306         031000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2154.2 198
   000307         031100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2154.2 195 57 285
   000308         031200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2154.2 IMP 203
   000309         031300     GO TO  FAIL-ROUTINE-EX.                                      NC2154.2 315
   000310         031400 FAIL-ROUTINE-WRITE.                                              NC2154.2
   000311         031500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2154.2 83 56 285
   000312         031600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2154.2 133 111
   000313         031700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2154.2 98 56 285
   000314         031800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2154.2 IMP 111
   000315         031900 FAIL-ROUTINE-EX. EXIT.                                           NC2154.2
   000316         032000 BAIL-OUT.                                                        NC2154.2
   000317         032100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2154.2 88 IMP 319
   000318         032200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2154.2 102 IMP 324
   000319         032300 BAIL-OUT-WRITE.                                                  NC2154.2
   000320         032400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2154.2 102 202 88 200
   000321         032500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2154.2 133 203
   000322         032600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2154.2 195 57 285
   000323         032700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2154.2 IMP 203
   000324         032800 BAIL-OUT-EX. EXIT.                                               NC2154.2
   000325         032900 CCVS1-EXIT.                                                      NC2154.2
   000326         033000     EXIT.                                                        NC2154.2
   000327         033100 SECT-NC215A-001 SECTION.                                         NC2154.2
   000328         033200 SEQ-INIT-GF-1.                                                   NC2154.2
   000329         033300     MOVE      "SEQ-TEST-GF-1" TO PAR-NAME.                       NC2154.2 77
   000330         033400     MOVE "VI-15 4.5.4 GR4(D)" TO ANSI-REFERENCE.                 NC2154.2 133
   000331         033500     MOVE      "A = LOW-VALUE" TO FEATURE.                        NC2154.2 73
   000332         033600     MOVE                  "A" TO A-AN-1.                         NC2154.2 59
   000333         033700 SEQ-TEST-GF-1.                                                   NC2154.2
   000334         033800     IF      A-AN-1 EQUAL TO LOW-VALUE PERFORM PASS               NC2154.2 59 IMP 227
   000335         033900         ELSE                                                     NC2154.2
   000336      1  034000         GO TO SEQ-FAIL-GF-1.                                     NC2154.2 341
   000337         034100     GO TO SEQ-WRITE-GF-1.                                        NC2154.2 344
   000338         034200 SEQ-DELETE-GF-1.                                                 NC2154.2
   000339         034300     PERFORM DE-LETE.                                             NC2154.2 229
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     GO TO SEQ-WRITE-GF-1.                                        NC2154.2 344
   000341         034500 SEQ-FAIL-GF-1.                                                   NC2154.2
   000342         034600     MOVE "A NOT = LOW-VALUE" TO COMPUTED-A.                      NC2154.2 88
   000343         034700     PERFORM FAIL.                                                NC2154.2 228
   000344         034800 SEQ-WRITE-GF-1.                                                  NC2154.2
   000345         034900     PERFORM PRINT-DETAIL.                                        NC2154.2 231
   000346         035000*                                                                 NC2154.2
   000347         035100 SEQ-INIT-GF-2.                                                   NC2154.2
   000348         035200     MOVE      "SEQ-TEST-GF-2" TO PAR-NAME.                       NC2154.2 77
   000349         035300     MOVE "VI-15 4.5.4 GR4(D)" TO ANSI-REFERENCE.                 NC2154.2 133
   000350         035400     MOVE   "H I J B SEQUENCE" TO FEATURE.                        NC2154.2 73
   000351         035500     MOVE                  "H" TO H-AN-1.                         NC2154.2 61
   000352         035600     MOVE                  "I" TO I-AN-1.                         NC2154.2 62
   000353         035700     MOVE                  "J" TO J-AN-1.                         NC2154.2 63
   000354         035800     MOVE                  "B" TO B-AN-1.                         NC2154.2 60
   000355         035900 SEQ-TEST-GF-2.                                                   NC2154.2
   000356         036000     IF H-AN-1 < I-AN-1 AND J-AN-1 > B-AN-1 PERFORM PASS          NC2154.2 61 62 63 60 227
   000357         036100         ELSE                                                     NC2154.2
   000358      1  036200         GO TO SEQ-FAIL-GF-2.                                     NC2154.2 363
   000359         036300     GO TO SEQ-WRITE-GF-2.                                        NC2154.2 366
   000360         036400 SEQ-DELETE-GF-2.                                                 NC2154.2
   000361         036500     PERFORM DE-LETE.                                             NC2154.2 229
   000362         036600     GO TO SEQ-WRITE-GF-2.                                        NC2154.2 366
   000363         036700 SEQ-FAIL-GF-2.                                                   NC2154.2
   000364         036800     MOVE "H I J B NOT SEQUENCED" TO COMPUTED-A.                  NC2154.2 88
   000365         036900     PERFORM FAIL.                                                NC2154.2 228
   000366         037000 SEQ-WRITE-GF-2.                                                  NC2154.2
   000367         037100     PERFORM PRINT-DETAIL.                                        NC2154.2 231
   000368         037200*                                                                 NC2154.2
   000369         037300 SEQ-INIT-GF-3.                                                   NC2154.2
   000370         037400     MOVE      "SEQ-TEST-GF-3" TO PAR-NAME.                       NC2154.2 77
   000371         037500     MOVE "VI-15 4.5.4 GR4(D)" TO ANSI-REFERENCE.                 NC2154.2 133
   000372         037600     MOVE  "I J K L M N EQUAL" TO FEATURE.                        NC2154.2 73
   000373         037700     MOVE                  "I" TO I-AN-1.                         NC2154.2 62
   000374         037800     MOVE                  "J" TO J-AN-1.                         NC2154.2 63
   000375         037900     MOVE                  "K" TO K-AN-1.                         NC2154.2 64
   000376         038000     MOVE                  "L" TO L-AN-1.                         NC2154.2 65
   000377         038100     MOVE                  "M" TO M-AN-1.                         NC2154.2 66
   000378         038200     MOVE                  "N" TO N-AN-1.                         NC2154.2 67
   000379         038300 SEQ-TEST-GF-3.                                                   NC2154.2
   000380         038400     IF I-AN-1 = J-AN-1 AND K-AN-1 AND L-AN-1 AND M-AN-1          NC2154.2 62 63 64 65 66
   000381      1  038500         AND N-AN-1 PERFORM PASS                                  NC2154.2 67 227
   000382         038600     ELSE                                                         NC2154.2
   000383      1  038700         GO TO SEQ-FAIL-GF-3.                                     NC2154.2 388
   000384         038800     GO TO SEQ-WRITE-GF-3.                                        NC2154.2 391
   000385         038900 SEQ-DELETE-GF-3.                                                 NC2154.2
   000386         039000     PERFORM DE-LETE.                                             NC2154.2 229
   000387         039100     GO TO SEQ-WRITE-GF-3.                                        NC2154.2 391
   000388         039200 SEQ-FAIL-GF-3.                                                   NC2154.2
   000389         039300     MOVE    "I J K L M N NOT =" TO COMPUTED-A.                   NC2154.2 88
   000390         039400     PERFORM FAIL.                                                NC2154.2 228
   000391         039500 SEQ-WRITE-GF-3.                                                  NC2154.2
   000392         039600     PERFORM PRINT-DETAIL.                                        NC2154.2 231
   000393         039700*                                                                 NC2154.2
   000394         039800 SEQ-INIT-GF-4.                                                   NC2154.2
   000395         039900     MOVE      "SEQ-TEST-GF-4" TO PAR-NAME.                       NC2154.2 77
   000396         040000     MOVE "VI-15 4.5.4 GR4(D)" TO ANSI-REFERENCE.                 NC2154.2 133
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     MOVE         "O > THAN N" TO FEATURE.                        NC2154.2 73
   000398         040200     MOVE                  "O" TO O-AN-1.                         NC2154.2 68
   000399         040300     MOVE                  "N" TO N-AN-1.                         NC2154.2 67
   000400         040400 SEQ-TEST-GF-4.                                                   NC2154.2
   000401         040500     IF O-AN-1 > N-AN-1 PERFORM PASS                              NC2154.2 68 67 227
   000402         040600         ELSE                                                     NC2154.2
   000403      1  040700         GO TO SEQ-FAIL-GF-4.                                     NC2154.2 408
   000404         040800     GO TO SEQ-WRITE-GF-4.                                        NC2154.2 411
   000405         040900 SEQ-DELETE-GF-4.                                                 NC2154.2
   000406         041000     PERFORM DE-LETE.                                             NC2154.2 229
   000407         041100     GO TO SEQ-WRITE-GF-4.                                        NC2154.2 411
   000408         041200 SEQ-FAIL-GF-4.                                                   NC2154.2
   000409         041300     MOVE "O NOT > THAN N" TO COMPUTED-A.                         NC2154.2 88
   000410         041400     PERFORM FAIL.                                                NC2154.2 228
   000411         041500 SEQ-WRITE-GF-4.                                                  NC2154.2
   000412         041600     PERFORM PRINT-DETAIL.                                        NC2154.2 231
   000413         041700*                                                                 NC2154.2
   000414         041800 SEQ-INIT-GF-5.                                                   NC2154.2
   000415         041900     MOVE      "SEQ-TEST-GF-5" TO PAR-NAME.                       NC2154.2 77
   000416         042000     MOVE "VI-15 4.5.4 GR4(D)" TO ANSI-REFERENCE.                 NC2154.2 133
   000417         042100     MOVE      "A < THAN ZERO" TO FEATURE.                        NC2154.2 73
   000418         042200     MOVE                  "A" TO A-AN-1.                         NC2154.2 59
   000419         042300     MOVE                 ZERO TO ZERO-DU-9V0-1.                  NC2154.2 IMP 69
   000420         042400 SEQ-TEST-GF-5.                                                   NC2154.2
   000421         042500     IF A-AN-1 < ZERO-DU-9V0-1 PERFORM PASS                       NC2154.2 59 69 227
   000422         042600         ELSE                                                     NC2154.2
   000423      1  042700         GO TO SEQ-FAIL-GF-5.                                     NC2154.2 428
   000424         042800     GO      TO SEQ-WRITE-GF-5.                                   NC2154.2 431
   000425         042900 SEQ-DELETE-GF-5.                                                 NC2154.2
   000426         043000     PERFORM DE-LETE.                                             NC2154.2 229
   000427         043100     GO TO SEQ-WRITE-GF-5.                                        NC2154.2 431
   000428         043200 SEQ-FAIL-GF-5.                                                   NC2154.2
   000429         043300     MOVE "A FOUND > THAN ZERO" TO COMPUTED-A.                    NC2154.2 88
   000430         043400     PERFORM FAIL.                                                NC2154.2 228
   000431         043500 SEQ-WRITE-GF-5.                                                  NC2154.2
   000432         043600     PERFORM PRINT-DETAIL.                                        NC2154.2 231
   000433         043700*                                                                 NC2154.2
   000434         043800 SEQ-INIT-GF-6.                                                   NC2154.2
   000435         043900     MOVE      "SEQ-TEST-GF-6" TO PAR-NAME.                       NC2154.2 77
   000436         044000     MOVE "VI-15 4.5.4 GR4(D)" TO ANSI-REFERENCE.                 NC2154.2 133
   000437         044100     MOVE  "NINE < THAN SPACE" TO FEATURE.                        NC2154.2 73
   000438         044200     MOVE                    9 TO NINE-DU-9V0-1.                  NC2154.2 70
   000439         044300 SEQ-TEST-GF-6.                                                   NC2154.2
   000440         044400     IF NINE-DU-9V0-1 < SPACE PERFORM PASS                        NC2154.2 70 IMP 227
   000441         044500         ELSE                                                     NC2154.2
   000442      1  044600         GO TO SEQ-FAIL-GF-6.                                     NC2154.2 447
   000443         044700     GO TO SEQ-WRITE-GF-6.                                        NC2154.2 450
   000444         044800 SEQ-DELETE-GF-6.                                                 NC2154.2
   000445         044900     PERFORM DE-LETE.                                             NC2154.2 229
   000446         045000     GO TO SEQ-WRITE-GF-6.                                        NC2154.2 450
   000447         045100 SEQ-FAIL-GF-6.                                                   NC2154.2
   000448         045200     MOVE "9 FOUND > THAN SPACE" TO COMPUTED-A.                   NC2154.2 88
   000449         045300     PERFORM FAIL.                                                NC2154.2 228
   000450         045400 SEQ-WRITE-GF-6.                                                  NC2154.2
   000451         045500     PERFORM PRINT-DETAIL.                                        NC2154.2 231
   000452         045600*                                                                 NC2154.2
   000453         045700 SEQ-INIT-GF-7.                                                   NC2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     MOVE      "SEQ-TEST-GF-7" TO PAR-NAME.                       NC2154.2 77
   000455         045900     MOVE "VI-15 4.5.4 GR4(D)" TO ANSI-REFERENCE.                 NC2154.2 133
   000456         046000     MOVE  "NINE < THAN QUOTE" TO FEATURE.                        NC2154.2 73
   000457         046100     MOVE                    9 TO NINE-DU-9V0-1.                  NC2154.2 70
   000458         046200 SEQ-TEST-GF-7.                                                   NC2154.2
   000459         046300     IF NINE-DU-9V0-1 < QUOTE PERFORM PASS                        NC2154.2 70 IMP 227
   000460         046400         ELSE                                                     NC2154.2
   000461      1  046500         GO TO SEQ-FAIL-GF-7.                                     NC2154.2 466
   000462         046600     GO TO SEQ-WRITE-GF-7.                                        NC2154.2 469
   000463         046700 SEQ-DELETE-GF-7.                                                 NC2154.2
   000464         046800     PERFORM DE-LETE.                                             NC2154.2 229
   000465         046900     GO TO SEQ-WRITE-GF-7.                                        NC2154.2 469
   000466         047000 SEQ-FAIL-GF-7.                                                   NC2154.2
   000467         047100     MOVE "NINE FOUND >  QUOTE" TO COMPUTED-A.                    NC2154.2 88
   000468         047200     PERFORM FAIL.                                                NC2154.2 228
   000469         047300 SEQ-WRITE-GF-7.                                                  NC2154.2
   000470         047400     PERFORM PRINT-DETAIL.                                        NC2154.2 231
   000471         047500*                                                                 NC2154.2
   000472         047600 ALPHABET-TEST-10.                                                NC2154.2
   000473         047700     PERFORM END-ROUTINE.                                         NC2154.2 252
   000474         047800     MOVE    " ALPHABET-NAME     *****     CHECK THE ALPHABET-NAMENC2154.2
   000475         047900-    " IN THE SPECIAL-NAMES PARAGRAPH" TO TEST-RESULTS.           NC2154.2 71
   000476         048000     PERFORM PRINT-DETAIL.                                        NC2154.2 231
   000477         048100 CCVS-EXIT SECTION.                                               NC2154.2
   000478         048200 CCVS-999999.                                                     NC2154.2
   000479         048300     GO TO CLOSE-FILES.                                           NC2154.2 220
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       59   A-AN-1 . . . . . . . . . . . .  M332 334 M418 421
      133   ANSI-REFERENCE . . . . . . . .  305 312 321 M330 M349 M371 M396 M416 M436 M455
       60   B-AN-1 . . . . . . . . . . . .  M354 356
      112   CCVS-C-1 . . . . . . . . . . .  249 291
      117   CCVS-C-2 . . . . . . . . . . .  250 292
      167   CCVS-E-1 . . . . . . . . . . .  255
      172   CCVS-E-2 . . . . . . . . . . .  264 271 278 283
      175   CCVS-E-2-2 . . . . . . . . . .  M263
      180   CCVS-E-3 . . . . . . . . . . .  284
      189   CCVS-E-4 . . . . . . . . . . .  263
      190   CCVS-E-4-1 . . . . . . . . . .  M261
      192   CCVS-E-4-2 . . . . . . . . . .  M262
      134   CCVS-H-1 . . . . . . . . . . .  244
      139   CCVS-H-2A. . . . . . . . . . .  245
      148   CCVS-H-2B. . . . . . . . . . .  246
      160   CCVS-H-3 . . . . . . . . . . .  247
      210   CCVS-PGM-ID. . . . . . . . . .  216 216
       94   CM-18V0
       88   COMPUTED-A . . . . . . . . . .  89 91 92 93 94 317 320 M342 M364 M389 M409 M429 M448 M467
       89   COMPUTED-N
       87   COMPUTED-X . . . . . . . . . .  M239 303
       91   COMPUTED-0V18
       93   COMPUTED-14V4
       95   COMPUTED-18V0
       92   COMPUTED-4V14
      111   COR-ANSI-REFERENCE . . . . . .  M312 M314
      102   CORRECT-A. . . . . . . . . . .  103 104 105 106 107 318 320
      103   CORRECT-N
      101   CORRECT-X. . . . . . . . . . .  M240 304
      104   CORRECT-0V18
      106   CORRECT-14V4
      108   CORRECT-18V0
      105   CORRECT-4V14
      107   CR-18V0
      125   DELETE-COUNTER . . . . . . . .  M229 258 274 276
       80   DOTVALUE . . . . . . . . . . .  M234
      131   DUMMY-HOLD . . . . . . . . . .  M288 294
       57   DUMMY-RECORD . . . . . . . . .  M244 M245 M246 M247 M249 M250 M251 M253 M255 M264 M271 M278 M283 M284 288 M289
                                            290 M291 M292 M293 M294 298 M299 M307 M322
      178   ENDER-DESC . . . . . . . . . .  M266 M277 M282
      126   ERROR-COUNTER. . . . . . . . .  M228 257 267 270
      130   ERROR-HOLD . . . . . . . . . .  M257 M258 M258 M259 262
      176   ERROR-TOTAL. . . . . . . . . .  M268 M270 M275 M276 M280 M281
       73   FEATURE. . . . . . . . . . . .  M331 M350 M372 M397 M417 M437 M456
       61   H-AN-1 . . . . . . . . . . . .  M351 356
      204   HYPHEN-LINE. . . . . . . . . .  251 253 293
       62   I-AN-1 . . . . . . . . . . . .  M352 356 M373 380
      170   ID-AGAIN . . . . . . . . . . .  M216
      203   INF-ANSI-REFERENCE . . . . . .  M305 M308 M321 M323
      198   INFO-TEXT. . . . . . . . . . .  M306
      127   INSPECT-COUNTER. . . . . . . .  M226 257 279 281
       63   J-AN-1 . . . . . . . . . . . .  M353 356 M374 380
       64   K-AN-1 . . . . . . . . . . . .  M375 380
       65   L-AN-1 . . . . . . . . . . . .  M376 380
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page    13
0 Defined   Cross-reference of data names   References

0      66   M-AN-1 . . . . . . . . . . . .  M377 380
       67   N-AN-1 . . . . . . . . . . . .  M378 381 M399 401
       70   NINE-DU-9V0-1. . . . . . . . .  M438 440 M457 459
       68   O-AN-1 . . . . . . . . . . . .  M398 401
       75   P-OR-F . . . . . . . . . . . .  M226 M227 M228 M229 236 M239
       77   PAR-NAME . . . . . . . . . . .  M241 M329 M348 M370 M395 M415 M435 M454
       79   PARDOT-X . . . . . . . . . . .  M233
      128   PASS-COUNTER . . . . . . . . .  M227 259 261
       55   PRINT-FILE . . . . . . . . . .  51 215 221
       56   PRINT-REC. . . . . . . . . . .  M235 M311 M313
       82   RE-MARK. . . . . . . . . . . .  M230 M242
      124   REC-CT . . . . . . . . . . . .  232 234 241
      123   REC-SKL-SUB
      132   RECORD-COUNT . . . . . . . . .  M286 287 M295
       83   TEST-COMPUTED. . . . . . . . .  311
       98   TEST-CORRECT . . . . . . . . .  313
      151   TEST-ID. . . . . . . . . . . .  M216
       71   TEST-RESULTS . . . . . . . . .  M217 235 M475
       45   THE-BIG-OL-LITERAL-ALPHABET
       34   THE-WILD-ONE . . . . . . . . .  31
      129   TOTAL-ERROR
      200   XXCOMPUTED . . . . . . . . . .  M320
      202   XXCORRECT. . . . . . . . . . .  M320
      195   XXINFO . . . . . . . . . . . .  307 322
       69   ZERO-DU-9V0-1. . . . . . . . .  M419 421
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page    14
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

      472   ALPHABET-TEST-10
      316   BAIL-OUT . . . . . . . . . . .  P238
      324   BAIL-OUT-EX. . . . . . . . . .  E238 G318
      319   BAIL-OUT-WRITE . . . . . . . .  G317
      300   BLANK-LINE-PRINT
      477   CCVS-EXIT
      478   CCVS-999999
      213   CCVS1
      325   CCVS1-EXIT . . . . . . . . . .  G219
      220   CLOSE-FILES. . . . . . . . . .  G479
      248   COLUMN-NAMES-ROUTINE . . . . .  E218
      229   DE-LETE. . . . . . . . . . . .  P339 P361 P386 P406 P426 P445 P464
      252   END-ROUTINE. . . . . . . . . .  P221 P473
      256   END-ROUTINE-1
      265   END-ROUTINE-12
      273   END-ROUTINE-13 . . . . . . . .  E221
      254   END-RTN-EXIT
      228   FAIL . . . . . . . . . . . . .  P343 P365 P390 P410 P430 P449 P468
      302   FAIL-ROUTINE . . . . . . . . .  P237
      315   FAIL-ROUTINE-EX. . . . . . . .  E237 G309
      310   FAIL-ROUTINE-WRITE . . . . . .  G303 G304
      243   HEAD-ROUTINE . . . . . . . . .  P218
      226   INSPT
      214   OPEN-FILES
      227   PASS . . . . . . . . . . . . .  P334 P356 P381 P401 P421 P440 P459
      231   PRINT-DETAIL . . . . . . . . .  P345 P367 P392 P412 P432 P451 P470 P476
      327   SECT-NC215A-001
      338   SEQ-DELETE-GF-1
      360   SEQ-DELETE-GF-2
      385   SEQ-DELETE-GF-3
      405   SEQ-DELETE-GF-4
      425   SEQ-DELETE-GF-5
      444   SEQ-DELETE-GF-6
      463   SEQ-DELETE-GF-7
      341   SEQ-FAIL-GF-1. . . . . . . . .  G336
      363   SEQ-FAIL-GF-2. . . . . . . . .  G358
      388   SEQ-FAIL-GF-3. . . . . . . . .  G383
      408   SEQ-FAIL-GF-4. . . . . . . . .  G403
      428   SEQ-FAIL-GF-5. . . . . . . . .  G423
      447   SEQ-FAIL-GF-6. . . . . . . . .  G442
      466   SEQ-FAIL-GF-7. . . . . . . . .  G461
      328   SEQ-INIT-GF-1
      347   SEQ-INIT-GF-2
      369   SEQ-INIT-GF-3
      394   SEQ-INIT-GF-4
      414   SEQ-INIT-GF-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page    15
0 Defined   Cross-reference of procedures   References

0     434   SEQ-INIT-GF-6
      453   SEQ-INIT-GF-7
      333   SEQ-TEST-GF-1
      355   SEQ-TEST-GF-2
      379   SEQ-TEST-GF-3
      400   SEQ-TEST-GF-4
      420   SEQ-TEST-GF-5
      439   SEQ-TEST-GF-6
      458   SEQ-TEST-GF-7
      344   SEQ-WRITE-GF-1 . . . . . . . .  G337 G340
      366   SEQ-WRITE-GF-2 . . . . . . . .  G359 G362
      391   SEQ-WRITE-GF-3 . . . . . . . .  G384 G387
      411   SEQ-WRITE-GF-4 . . . . . . . .  G404 G407
      431   SEQ-WRITE-GF-5 . . . . . . . .  G424 G427
      450   SEQ-WRITE-GF-6 . . . . . . . .  G443 G446
      469   SEQ-WRITE-GF-7 . . . . . . . .  G462 G465
      224   TERMINATE-CALL
      222   TERMINATE-CCVS
      285   WRITE-LINE . . . . . . . . . .  P235 P236 P244 P245 P246 P247 P249 P250 P251 P253 P255 P264 P272 P278 P283 P284
                                            P307 P311 P313 P322
      297   WRT-LN . . . . . . . . . . . .  P291 P292 P293 P296 P301
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page    16
0 Defined   Cross-reference of programs     References

        3   NC215A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC215A    Date 06/04/2022  Time 11:57:53   Page    17
0LineID  Message code  Message text

     55  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC215A:
 *    Source records = 479
 *    Data Division statements = 75
 *    Procedure Division statements = 232
 *    Generated COBOL statements = 0
 *    Program complexity factor = 243
0End of compilation 1,  program NC215A,  highest severity 0.
0Return code 0
