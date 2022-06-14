1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:56   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:56   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2144.2
   000002         000200 PROGRAM-ID.                                                      NC2144.2
   000003         000300     NC214M.                                                      NC2144.2
   000004         000500*                                                              *  NC2144.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2144.2
   000006         000700*                                                              *  NC2144.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2144.2
   000008         000900*                                                              *  NC2144.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2144.2
   000010         001100*                                                              *  NC2144.2
   000011         001300*                                                              *  NC2144.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2144.2
   000013         001500*                                                              *  NC2144.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2144.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2144.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2144.2
   000017         001900*                                                              *  NC2144.2
   000018         002100*                                                              *  NC2144.2
   000019         002200*    PROGRAM NC214M TESTS FORMAT 2 OF THE "ACCEPT" STATEMENT.  *  NC2144.2
   000020         002300*                                                              *  NC2144.2
   000021         002500 ENVIRONMENT DIVISION.                                            NC2144.2
   000022         002600 CONFIGURATION SECTION.                                           NC2144.2
   000023         002700 SOURCE-COMPUTER.                                                 NC2144.2
   000024         002800     XXXXX082.                                                    NC2144.2
   000025         002900 OBJECT-COMPUTER.                                                 NC2144.2
   000026         003000     XXXXX083                                                     NC2144.2
   000027         003100     PROGRAM COLLATING SEQUENCE IS N-A-T-I-V-E.                   NC2144.2 35
   000028         003200 SPECIAL-NAMES.                                                   NC2144.2
   000029         003300*                                                                 NC2144.2
   000030         003400*                                                                 NC2144.2
   000031         003500*    THE FOLLOWING IS THE ALPHABET FOR THE PROGRAM COLLATING      NC2144.2
   000032         003600*    SEQUENCE CLAUSE.                                             NC2144.2
   000033         003700*                                                                 NC2144.2
   000034         003800     ALPHABET                                                     NC2144.2
   000035         003900     N-A-T-I-V-E IS NATIVE                                        NC2144.2
   000036         004000*                                                                 NC2144.2
   000037         004100*                                                                 NC2144.2
   000038         004200*                                                                 NC2144.2
   000039         004300*                                                                 NC2144.2
   000040         004400     ALPHABET                                                     NC2144.2
   000041         004500     THE-ONE-CHARACTER-ALPHABET IS "Q" ALSO LOW-VALUE             NC2144.2 IMP
   000042         004600                                       ALSO HIGH-VALUE            NC2144.2 IMP
   000043         004700                                       ALSO QUOTE                 NC2144.2 IMP
   000044         004800                                       ALSO SPACES.               NC2144.2 IMP
   000045         004900*                                                                 NC2144.2
   000046         005000*                                                                 NC2144.2
   000047         005100*    COLLATING-AND-ALPHABET-TEST-9     *****     TEST OF SYNTAX   NC2144.2
   000048         005200*    ON THE PROGRAM COLLATING SEQUENCE CLAUSE AND ALPHABET-NAME   NC2144.2
   000049         005300*    CLAUSES.                                                     NC2144.2
   000050         005400*                                                                 NC2144.2
   000051         005500*                                                                 NC2144.2
   000052         005600 INPUT-OUTPUT SECTION.                                            NC2144.2
   000053         005700 FILE-CONTROL.                                                    NC2144.2
   000054         005800     SELECT PRINT-FILE ASSIGN TO                                  NC2144.2 58
   000055         005900     XXXXX055.                                                    NC2144.2
   000056         006000 DATA DIVISION.                                                   NC2144.2
   000057         006100 FILE SECTION.                                                    NC2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200 FD  PRINT-FILE.                                                  NC2144.2

 ==000058==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000059         006300 01  PRINT-REC PICTURE X(120).                                    NC2144.2
   000060         006400 01  DUMMY-RECORD PICTURE X(120).                                 NC2144.2
   000061         006500 WORKING-STORAGE SECTION.                                         NC2144.2
   000062         006600 01  WRK-DU-6V0-1 PIC 9(6) VALUE ZERO.                            NC2144.2 IMP
   000063         006700 01  WRK-DU-5V0-1 PIC 9(5) VALUE ZERO.                            NC2144.2 IMP
   000064         006800 01  WRK-DU-8V0-1 PIC 9(8) VALUE ZERO.                            NC2144.2 IMP
   000065         006900 01  WRK-XN-120-1 PIC X(120) VALUE                                NC2144.2
   000066         007000     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""NC2144.2
   000067         007100-    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""NC2144.2
   000068         007200-    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""NC2144.2
   000069         007300-    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""NC2144.2
   000070         007400-    "".                                                          NC2144.2
   000071         007500 01  WRK-DU-2V1-1 PIC 99V9 VALUE ZERO.                            NC2144.2 IMP
   000072         007600 01  WRK-DU-0V1-1 PIC V9 VALUE .1.                                NC2144.2
   000073         007700 01  WRK-DU-2V1-2 PIC 99V9 VALUE 0.1.                             NC2144.2
   000074         007800 01  WRK-DU-2V1-3  PIC 99V9  VALUE  11.1.                         NC2144.2
   000075         007900 01  WRK-DU-1V0-1 PIC 9 VALUE 9.                                  NC2144.2
   000076         008000 01  WRK-DU-1V0-2 PIC 9 VALUE 2.                                  NC2144.2
   000077         008100 01  WRK-DU-1V0-3 PIC 9 VALUE 3.                                  NC2144.2
   000078         008200 01  WRK-DU-1V0-4 PIC 9 VALUE ZERO.                               NC2144.2 IMP
   000079         008300 01  WRK-DU-2V0-1 PIC 99 VALUE 10.                                NC2144.2
   000080         008400 01  WRK-DU-2V0-2 PIC 99 VALUE 11.                                NC2144.2
   000081         008500 01  WRK-DU-2V0-3 PIC 99 VALUE 12.                                NC2144.2
   000082         008600 01  COUNT-DU-6V0  PIC 9(6).                                      NC2144.2
   000083         008700 01  TEST-RESULTS.                                                NC2144.2
   000084         008800     02 FILLER                   PIC X      VALUE SPACE.          NC2144.2 IMP
   000085         008900     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2144.2 IMP
   000086         009000     02 FILLER                   PIC X      VALUE SPACE.          NC2144.2 IMP
   000087         009100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2144.2 IMP
   000088         009200     02 FILLER                   PIC X      VALUE SPACE.          NC2144.2 IMP
   000089         009300     02  PAR-NAME.                                                NC2144.2
   000090         009400       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2144.2 IMP
   000091         009500       03  PARDOT-X              PIC X      VALUE SPACE.          NC2144.2 IMP
   000092         009600       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2144.2 IMP
   000093         009700     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2144.2 IMP
   000094         009800     02 RE-MARK                  PIC X(61).                       NC2144.2
   000095         009900 01  TEST-COMPUTED.                                               NC2144.2
   000096         010000     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2144.2 IMP
   000097         010100     02 FILLER                   PIC X(17)  VALUE                 NC2144.2
   000098         010200            "       COMPUTED=".                                   NC2144.2
   000099         010300     02 COMPUTED-X.                                               NC2144.2
   000100         010400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2144.2 IMP
   000101         010500     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2144.2 100
   000102         010600                                 PIC -9(9).9(9).                  NC2144.2
   000103         010700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2144.2 100
   000104         010800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2144.2 100
   000105         010900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2144.2 100
   000106         011000     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2144.2 100
   000107         011100         04 COMPUTED-18V0                    PIC -9(18).          NC2144.2
   000108         011200         04 FILLER                           PIC X.               NC2144.2
   000109         011300     03 FILLER PIC X(50) VALUE SPACE.                             NC2144.2 IMP
   000110         011400 01  TEST-CORRECT.                                                NC2144.2
   000111         011500     02 FILLER PIC X(30) VALUE SPACE.                             NC2144.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2144.2
   000113         011700     02 CORRECT-X.                                                NC2144.2
   000114         011800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2144.2 IMP
   000115         011900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2144.2 114
   000116         012000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2144.2 114
   000117         012100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2144.2 114
   000118         012200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2144.2 114
   000119         012300     03      CR-18V0 REDEFINES CORRECT-A.                         NC2144.2 114
   000120         012400         04 CORRECT-18V0                     PIC -9(18).          NC2144.2
   000121         012500         04 FILLER                           PIC X.               NC2144.2
   000122         012600     03 FILLER PIC X(2) VALUE SPACE.                              NC2144.2 IMP
   000123         012700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2144.2 IMP
   000124         012800 01  CCVS-C-1.                                                    NC2144.2
   000125         012900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2144.2
   000126         013000-    "SS  PARAGRAPH-NAME                                          NC2144.2
   000127         013100-    "       REMARKS".                                            NC2144.2
   000128         013200     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2144.2 IMP
   000129         013300 01  CCVS-C-2.                                                    NC2144.2
   000130         013400     02 FILLER                     PIC X        VALUE SPACE.      NC2144.2 IMP
   000131         013500     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2144.2
   000132         013600     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2144.2 IMP
   000133         013700     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2144.2
   000134         013800     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2144.2 IMP
   000135         013900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2144.2 IMP
   000136         014000 01  REC-CT                        PIC 99       VALUE ZERO.       NC2144.2 IMP
   000137         014100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2144.2 IMP
   000138         014200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2144.2 IMP
   000139         014300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2144.2 IMP
   000140         014400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2144.2 IMP
   000141         014500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2144.2 IMP
   000142         014600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2144.2 IMP
   000143         014700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2144.2 IMP
   000144         014800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2144.2 IMP
   000145         014900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2144.2 IMP
   000146         015000 01  CCVS-H-1.                                                    NC2144.2
   000147         015100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2144.2 IMP
   000148         015200     02  FILLER                    PIC X(42)    VALUE             NC2144.2
   000149         015300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2144.2
   000150         015400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2144.2 IMP
   000151         015500 01  CCVS-H-2A.                                                   NC2144.2
   000152         015600   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2144.2 IMP
   000153         015700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2144.2
   000154         015800   02  FILLER                        PIC XXXX   VALUE             NC2144.2
   000155         015900     "4.2 ".                                                      NC2144.2
   000156         016000   02  FILLER                        PIC X(28)  VALUE             NC2144.2
   000157         016100            " COPY - NOT FOR DISTRIBUTION".                       NC2144.2
   000158         016200   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2144.2 IMP
   000159         016300                                                                  NC2144.2
   000160         016400 01  CCVS-H-2B.                                                   NC2144.2
   000161         016500   02  FILLER                        PIC X(15)  VALUE             NC2144.2
   000162         016600            "TEST RESULT OF ".                                    NC2144.2
   000163         016700   02  TEST-ID                       PIC X(9).                    NC2144.2
   000164         016800   02  FILLER                        PIC X(4)   VALUE             NC2144.2
   000165         016900            " IN ".                                               NC2144.2
   000166         017000   02  FILLER                        PIC X(12)  VALUE             NC2144.2
   000167         017100     " HIGH       ".                                              NC2144.2
   000168         017200   02  FILLER                        PIC X(22)  VALUE             NC2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300            " LEVEL VALIDATION FOR ".                             NC2144.2
   000170         017400   02  FILLER                        PIC X(58)  VALUE             NC2144.2
   000171         017500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2144.2
   000172         017600 01  CCVS-H-3.                                                    NC2144.2
   000173         017700     02  FILLER                      PIC X(34)  VALUE             NC2144.2
   000174         017800            " FOR OFFICIAL USE ONLY    ".                         NC2144.2
   000175         017900     02  FILLER                      PIC X(58)  VALUE             NC2144.2
   000176         018000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2144.2
   000177         018100     02  FILLER                      PIC X(28)  VALUE             NC2144.2
   000178         018200            "  COPYRIGHT   1985 ".                                NC2144.2
   000179         018300 01  CCVS-E-1.                                                    NC2144.2
   000180         018400     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2144.2 IMP
   000181         018500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2144.2
   000182         018600     02 ID-AGAIN                     PIC X(9).                    NC2144.2
   000183         018700     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2144.2 IMP
   000184         018800 01  CCVS-E-2.                                                    NC2144.2
   000185         018900     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2144.2 IMP
   000186         019000     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2144.2 IMP
   000187         019100     02 CCVS-E-2-2.                                               NC2144.2
   000188         019200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2144.2 IMP
   000189         019300         03 FILLER                   PIC X      VALUE SPACE.      NC2144.2 IMP
   000190         019400         03 ENDER-DESC               PIC X(44)  VALUE             NC2144.2
   000191         019500            "ERRORS ENCOUNTERED".                                 NC2144.2
   000192         019600 01  CCVS-E-3.                                                    NC2144.2
   000193         019700     02  FILLER                      PIC X(22)  VALUE             NC2144.2
   000194         019800            " FOR OFFICIAL USE ONLY".                             NC2144.2
   000195         019900     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2144.2 IMP
   000196         020000     02  FILLER                      PIC X(58)  VALUE             NC2144.2
   000197         020100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2144.2
   000198         020200     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2144.2 IMP
   000199         020300     02 FILLER                       PIC X(15)  VALUE             NC2144.2
   000200         020400             " COPYRIGHT 1985".                                   NC2144.2
   000201         020500 01  CCVS-E-4.                                                    NC2144.2
   000202         020600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2144.2 IMP
   000203         020700     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2144.2
   000204         020800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2144.2 IMP
   000205         020900     02 FILLER                       PIC X(40)  VALUE             NC2144.2
   000206         021000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2144.2
   000207         021100 01  XXINFO.                                                      NC2144.2
   000208         021200     02 FILLER                       PIC X(19)  VALUE             NC2144.2
   000209         021300            "*** INFORMATION ***".                                NC2144.2
   000210         021400     02 INFO-TEXT.                                                NC2144.2
   000211         021500       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2144.2 IMP
   000212         021600       04 XXCOMPUTED                 PIC X(20).                   NC2144.2
   000213         021700       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2144.2 IMP
   000214         021800       04 XXCORRECT                  PIC X(20).                   NC2144.2
   000215         021900     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2144.2
   000216         022000 01  HYPHEN-LINE.                                                 NC2144.2
   000217         022100     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2144.2 IMP
   000218         022200     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2144.2
   000219         022300-    "*****************************************".                 NC2144.2
   000220         022400     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2144.2
   000221         022500-    "******************************".                            NC2144.2
   000222         022600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2144.2
   000223         022700     "NC214M".                                                    NC2144.2
   000224         022800 PROCEDURE DIVISION.                                              NC2144.2
   000225         022900 CCVS1 SECTION.                                                   NC2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 OPEN-FILES.                                                      NC2144.2
   000227         023100     OPEN     OUTPUT PRINT-FILE.                                  NC2144.2 58
   000228         023200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2144.2 222 163 222 182
   000229         023300     MOVE    SPACE TO TEST-RESULTS.                               NC2144.2 IMP 83
   000230         023400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2144.2 255 260
   000231         023500     GO TO CCVS1-EXIT.                                            NC2144.2 337
   000232         023600 CLOSE-FILES.                                                     NC2144.2
   000233         023700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2144.2 264 285 58
   000234         023800 TERMINATE-CCVS.                                                  NC2144.2
   000235         023900     EXIT PROGRAM.                                                NC2144.2
   000236         024000 TERMINATE-CALL.                                                  NC2144.2
   000237         024100     STOP     RUN.                                                NC2144.2
   000238         024200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2144.2 87 139
   000239         024300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2144.2 87 140
   000240         024400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2144.2 87 138
   000241         024500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2144.2 87 137
   000242         024600     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2144.2 94
   000243         024700 PRINT-DETAIL.                                                    NC2144.2
   000244         024800     IF REC-CT NOT EQUAL TO ZERO                                  NC2144.2 136 IMP
   000245      1  024900             MOVE "." TO PARDOT-X                                 NC2144.2 91
   000246      1  025000             MOVE REC-CT TO DOTVALUE.                             NC2144.2 136 92
   000247         025100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2144.2 83 59 297
   000248         025200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2144.2 87 297
   000249      1  025300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2144.2 314 327
   000250      1  025400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2144.2 328 336
   000251         025500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2144.2 IMP 87 IMP 99
   000252         025600     MOVE SPACE TO CORRECT-X.                                     NC2144.2 IMP 113
   000253         025700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2144.2 136 IMP IMP 89
   000254         025800     MOVE     SPACE TO RE-MARK.                                   NC2144.2 IMP 94
   000255         025900 HEAD-ROUTINE.                                                    NC2144.2
   000256         026000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2144.2 146 60 297
   000257         026100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2144.2 151 60 297
   000258         026200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2144.2 160 60 297
   000259         026300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2144.2 172 60 297
   000260         026400 COLUMN-NAMES-ROUTINE.                                            NC2144.2
   000261         026500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2144.2 124 60 297
   000262         026600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2144.2 129 60 297
   000263         026700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2144.2 216 60 297
   000264         026800 END-ROUTINE.                                                     NC2144.2
   000265         026900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2144.2 216 60 297
   000266         027000 END-RTN-EXIT.                                                    NC2144.2
   000267         027100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2144.2 179 60 297
   000268         027200 END-ROUTINE-1.                                                   NC2144.2
   000269         027300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2144.2 138 142 139
   000270         027400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2144.2 142 137 142
   000271         027500      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2144.2 140 142
   000272         027600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2144.2
   000273         027700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2144.2 140 202
   000274         027800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2144.2 142 204
   000275         027900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2144.2 201 187
   000276         028000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2144.2 184 60 297
   000277         028100  END-ROUTINE-12.                                                 NC2144.2
   000278         028200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2144.2 190
   000279         028300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2144.2 138 IMP
   000280      1  028400         MOVE "NO " TO ERROR-TOTAL                                NC2144.2 188
   000281         028500         ELSE                                                     NC2144.2
   000282      1  028600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2144.2 138 188
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2144.2 184 60
   000284         028800     PERFORM WRITE-LINE.                                          NC2144.2 297
   000285         028900 END-ROUTINE-13.                                                  NC2144.2
   000286         029000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2144.2 137 IMP
   000287      1  029100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2144.2 188
   000288      1  029200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2144.2 137 188
   000289         029300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2144.2 190
   000290         029400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2144.2 184 60 297
   000291         029500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2144.2 139 IMP
   000292      1  029600          MOVE "NO " TO ERROR-TOTAL                               NC2144.2 188
   000293      1  029700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2144.2 139 188
   000294         029800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2144.2 190
   000295         029900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2144.2 184 60 297
   000296         030000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2144.2 192 60 297
   000297         030100 WRITE-LINE.                                                      NC2144.2
   000298         030200     ADD 1 TO RECORD-COUNT.                                       NC2144.2 144
   000299         030300     IF RECORD-COUNT GREATER 50                                   NC2144.2 144
   000300      1  030400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2144.2 60 143
   000301      1  030500         MOVE SPACE TO DUMMY-RECORD                               NC2144.2 IMP 60
   000302      1  030600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2144.2 60
   000303      1  030700         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2144.2 124 60 309
   000304      1  030800         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2144.2 129 60 309
   000305      1  030900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2144.2 216 60 309
   000306      1  031000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2144.2 143 60
   000307      1  031100         MOVE ZERO TO RECORD-COUNT.                               NC2144.2 IMP 144
   000308         031200     PERFORM WRT-LN.                                              NC2144.2 309
   000309         031300 WRT-LN.                                                          NC2144.2
   000310         031400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2144.2 60
   000311         031500     MOVE SPACE TO DUMMY-RECORD.                                  NC2144.2 IMP 60
   000312         031600 BLANK-LINE-PRINT.                                                NC2144.2
   000313         031700     PERFORM WRT-LN.                                              NC2144.2 309
   000314         031800 FAIL-ROUTINE.                                                    NC2144.2
   000315         031900     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2144.2 99 IMP 322
   000316         032000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2144.2 113 IMP 322
   000317         032100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2144.2 145 215
   000318         032200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2144.2 210
   000319         032300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2144.2 207 60 297
   000320         032400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2144.2 IMP 215
   000321         032500     GO TO  FAIL-ROUTINE-EX.                                      NC2144.2 327
   000322         032600 FAIL-ROUTINE-WRITE.                                              NC2144.2
   000323         032700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2144.2 95 59 297
   000324         032800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2144.2 145 123
   000325         032900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2144.2 110 59 297
   000326         033000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2144.2 IMP 123
   000327         033100 FAIL-ROUTINE-EX. EXIT.                                           NC2144.2
   000328         033200 BAIL-OUT.                                                        NC2144.2
   000329         033300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2144.2 100 IMP 331
   000330         033400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2144.2 114 IMP 336
   000331         033500 BAIL-OUT-WRITE.                                                  NC2144.2
   000332         033600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2144.2 114 214 100 212
   000333         033700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2144.2 145 215
   000334         033800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2144.2 207 60 297
   000335         033900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2144.2 IMP 215
   000336         034000 BAIL-OUT-EX. EXIT.                                               NC2144.2
   000337         034100 CCVS1-EXIT.                                                      NC2144.2
   000338         034200     EXIT.                                                        NC2144.2
   000339         034300 SECT-NC214M-001 SECTION.                                         NC2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400 ACC-INIT-F2-1.                                                   NC2144.2
   000341         034500*    ===---> TEST THE ACCEPT FROM DATE STATEMENT <---===          NC2144.2
   000342         034600     MOVE "ACC-TEST-F2-1" TO PAR-NAME.                            NC2144.2 89
   000343         034700     MOVE "VI-72 6.5.4 GR7" TO ANSI-REFERENCE.                    NC2144.2 145
   000344         034800     MOVE "ACCEPT DATE" TO FEATURE.                               NC2144.2 85
   000345         034900 ACC-TEST-F2-1.                                                   NC2144.2
   000346         035000     ACCEPT WRK-DU-6V0-1 FROM DATE.                               NC2144.2 62
   000347         035100     MOVE WRK-DU-6V0-1 TO COMPUTED-N.                             NC2144.2 62 101
   000348         035200     MOVE "DATE YYMMDD FORMAT" TO CORRECT-A.                      NC2144.2 114
   000349         035300     MOVE "CHECK VISUALLY" TO RE-MARK.                            NC2144.2 94
   000350         035400     GO TO ACC-WRITE-F2-1.                                        NC2144.2 353
   000351         035500 ACC-DELETE-F2-1.                                                 NC2144.2
   000352         035600     PERFORM DE-LETE.                                             NC2144.2 241
   000353         035700 ACC-WRITE-F2-1.                                                  NC2144.2
   000354         035800     PERFORM PRINT-DETAIL.                                        NC2144.2 243
   000355         035900*                                                                 NC2144.2
   000356         036000 ACC-INIT-F2-2.                                                   NC2144.2
   000357         036100*    ===---> TEST THE ACCEPT FROM DAY STATEMENT <---===           NC2144.2
   000358         036200     MOVE "ACC-TEST-F2-2" TO PAR-NAME.                            NC2144.2 89
   000359         036300     MOVE "VI-72 6.5.4 GR8" TO ANSI-REFERENCE.                    NC2144.2 145
   000360         036400     MOVE "ACCEPT DAY" TO FEATURE.                                NC2144.2 85
   000361         036500 ACC-TEST-F2-2.                                                   NC2144.2
   000362         036600     ACCEPT WRK-DU-5V0-1 FROM DAY.                                NC2144.2 63
   000363         036700     MOVE WRK-DU-5V0-1 TO COMPUTED-N.                             NC2144.2 63 101
   000364         036800     MOVE "DAY YYDDD FORMAT" TO CORRECT-A.                        NC2144.2 114
   000365         036900     MOVE "CHECK VISUALLY" TO RE-MARK.                            NC2144.2 94
   000366         037000     GO TO ACC-WRITE-F2-2.                                        NC2144.2 369
   000367         037100 ACC-DELETE-F2-2.                                                 NC2144.2
   000368         037200     PERFORM DE-LETE.                                             NC2144.2 241
   000369         037300 ACC-WRITE-F2-2.                                                  NC2144.2
   000370         037400     PERFORM PRINT-DETAIL.                                        NC2144.2 243
   000371         037500*                                                                 NC2144.2
   000372         037600 ACC-INIT-F2-3.                                                   NC2144.2
   000373         037700*    ===---> TEST THE ACCEPT FROM TIME STATEMENT <---===          NC2144.2
   000374         037800     MOVE "ACC-TEST-F2-3" TO PAR-NAME.                            NC2144.2 89
   000375         037900     MOVE "VI-72 6.5.4 GR9" TO ANSI-REFERENCE.                    NC2144.2 145
   000376         038000     MOVE "ACCEPT TIME" TO FEATURE.                               NC2144.2 85
   000377         038100 ACC-TEST-F2-3.                                                   NC2144.2
   000378         038200     ACCEPT WRK-DU-8V0-1 FROM TIME.                               NC2144.2 64
   000379         038300     MOVE WRK-DU-8V0-1 TO COMPUTED-N.                             NC2144.2 64 101
   000380         038400     MOVE "HHMMSSFF FORMAT" TO CORRECT-A.                         NC2144.2 114
   000381         038500     MOVE "CHECK VISUALLY" TO RE-MARK.                            NC2144.2 94
   000382         038600     GO TO ACC-WRITE-F2-3.                                        NC2144.2 385
   000383         038700 ACC-DELETE-F2-3.                                                 NC2144.2
   000384         038800     PERFORM DE-LETE.                                             NC2144.2 241
   000385         038900 ACC-WRITE-F2-3.                                                  NC2144.2
   000386         039000     PERFORM PRINT-DETAIL.                                        NC2144.2 243
   000387         039100*                                                                 NC2144.2
   000388         039200 ACC-INIT-F2-4.                                                   NC2144.2
   000389         039300*    ===---> TEST THE ACCEPT FROM DAY-OF-WEEK STATEMENT <---===   NC2144.2
   000390         039400     MOVE "ACC-TEST-F2-4" TO PAR-NAME.                            NC2144.2 89
   000391         039500     MOVE "VI-72 6.5.4 GR10" TO ANSI-REFERENCE.                   NC2144.2 145
   000392         039600     MOVE "ACCEPT DAY-OF-WEEK" TO FEATURE.                        NC2144.2 85
   000393         039700 ACC-TEST-F2-4.                                                   NC2144.2
   000394         039800     ACCEPT WRK-DU-1V0-1 FROM DAY-OF-WEEK.                        NC2144.2 75
   000395         039900     MOVE WRK-DU-1V0-1 TO COMPUTED-N.                             NC2144.2 75 101
   000396         040000     MOVE "SINGLE DIGIT INTEGER REPRESENTING DAY" TO CORRECT-A.   NC2144.2 114
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     MOVE "CHECK VISUALLY" TO RE-MARK.                            NC2144.2 94
   000398         040200     GO TO ACC-WRITE-F2-4.                                        NC2144.2 401
   000399         040300 ACC-DELETE-F2-4.                                                 NC2144.2
   000400         040400     PERFORM DE-LETE.                                             NC2144.2 241
   000401         040500 ACC-WRITE-F2-4.                                                  NC2144.2
   000402         040600     PERFORM PRINT-DETAIL.                                        NC2144.2 243
   000403         040700 CCVS-EXIT SECTION.                                               NC2144.2
   000404         040800 CCVS-999999.                                                     NC2144.2
   000405         040900     GO TO CLOSE-FILES.                                           NC2144.2 232
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page    11
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      145   ANSI-REFERENCE . . . . . . . .  317 324 333 M343 M359 M375 M391
      124   CCVS-C-1 . . . . . . . . . . .  261 303
      129   CCVS-C-2 . . . . . . . . . . .  262 304
      179   CCVS-E-1 . . . . . . . . . . .  267
      184   CCVS-E-2 . . . . . . . . . . .  276 283 290 295
      187   CCVS-E-2-2 . . . . . . . . . .  M275
      192   CCVS-E-3 . . . . . . . . . . .  296
      201   CCVS-E-4 . . . . . . . . . . .  275
      202   CCVS-E-4-1 . . . . . . . . . .  M273
      204   CCVS-E-4-2 . . . . . . . . . .  M274
      146   CCVS-H-1 . . . . . . . . . . .  256
      151   CCVS-H-2A. . . . . . . . . . .  257
      160   CCVS-H-2B. . . . . . . . . . .  258
      172   CCVS-H-3 . . . . . . . . . . .  259
      222   CCVS-PGM-ID. . . . . . . . . .  228 228
      106   CM-18V0
      100   COMPUTED-A . . . . . . . . . .  101 103 104 105 106 329 332
      101   COMPUTED-N . . . . . . . . . .  M347 M363 M379 M395
       99   COMPUTED-X . . . . . . . . . .  M251 315
      103   COMPUTED-0V18
      105   COMPUTED-14V4
      107   COMPUTED-18V0
      104   COMPUTED-4V14
      123   COR-ANSI-REFERENCE . . . . . .  M324 M326
      114   CORRECT-A. . . . . . . . . . .  115 116 117 118 119 330 332 M348 M364 M380 M396
      115   CORRECT-N
      113   CORRECT-X. . . . . . . . . . .  M252 316
      116   CORRECT-0V18
      118   CORRECT-14V4
      120   CORRECT-18V0
      117   CORRECT-4V14
       82   COUNT-DU-6V0
      119   CR-18V0
      137   DELETE-COUNTER . . . . . . . .  M241 270 286 288
       92   DOTVALUE . . . . . . . . . . .  M246
      143   DUMMY-HOLD . . . . . . . . . .  M300 306
       60   DUMMY-RECORD . . . . . . . . .  M256 M257 M258 M259 M261 M262 M263 M265 M267 M276 M283 M290 M295 M296 300 M301
                                            302 M303 M304 M305 M306 310 M311 M319 M334
      190   ENDER-DESC . . . . . . . . . .  M278 M289 M294
      138   ERROR-COUNTER. . . . . . . . .  M240 269 279 282
      142   ERROR-HOLD . . . . . . . . . .  M269 M270 M270 M271 274
      188   ERROR-TOTAL. . . . . . . . . .  M280 M282 M287 M288 M292 M293
       85   FEATURE. . . . . . . . . . . .  M344 M360 M376 M392
      216   HYPHEN-LINE. . . . . . . . . .  263 265 305
      182   ID-AGAIN . . . . . . . . . . .  M228
      215   INF-ANSI-REFERENCE . . . . . .  M317 M320 M333 M335
      210   INFO-TEXT. . . . . . . . . . .  M318
      139   INSPECT-COUNTER. . . . . . . .  M238 269 291 293
       35   N-A-T-I-V-E. . . . . . . . . .  27
       87   P-OR-F . . . . . . . . . . . .  M238 M239 M240 M241 248 M251
       89   PAR-NAME . . . . . . . . . . .  M253 M342 M358 M374 M390
       91   PARDOT-X . . . . . . . . . . .  M245
      140   PASS-COUNTER . . . . . . . . .  M239 271 273
       58   PRINT-FILE . . . . . . . . . .  54 227 233
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page    12
0 Defined   Cross-reference of data names   References

0      59   PRINT-REC. . . . . . . . . . .  M247 M323 M325
       94   RE-MARK. . . . . . . . . . . .  M242 M254 M349 M365 M381 M397
      136   REC-CT . . . . . . . . . . . .  244 246 253
      135   REC-SKL-SUB
      144   RECORD-COUNT . . . . . . . . .  M298 299 M307
       95   TEST-COMPUTED. . . . . . . . .  323
      110   TEST-CORRECT . . . . . . . . .  325
      163   TEST-ID. . . . . . . . . . . .  M228
       83   TEST-RESULTS . . . . . . . . .  M229 247
       41   THE-ONE-CHARACTER-ALPHABET
      141   TOTAL-ERROR
       72   WRK-DU-0V1-1
       75   WRK-DU-1V0-1 . . . . . . . . .  M394 395
       76   WRK-DU-1V0-2
       77   WRK-DU-1V0-3
       78   WRK-DU-1V0-4
       79   WRK-DU-2V0-1
       80   WRK-DU-2V0-2
       81   WRK-DU-2V0-3
       71   WRK-DU-2V1-1
       73   WRK-DU-2V1-2
       74   WRK-DU-2V1-3
       63   WRK-DU-5V0-1 . . . . . . . . .  M362 363
       62   WRK-DU-6V0-1 . . . . . . . . .  M346 347
       64   WRK-DU-8V0-1 . . . . . . . . .  M378 379
       65   WRK-XN-120-1
      212   XXCOMPUTED . . . . . . . . . .  M332
      214   XXCORRECT. . . . . . . . . . .  M332
      207   XXINFO . . . . . . . . . . . .  319 334
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page    13
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

      351   ACC-DELETE-F2-1
      367   ACC-DELETE-F2-2
      383   ACC-DELETE-F2-3
      399   ACC-DELETE-F2-4
      340   ACC-INIT-F2-1
      356   ACC-INIT-F2-2
      372   ACC-INIT-F2-3
      388   ACC-INIT-F2-4
      345   ACC-TEST-F2-1
      361   ACC-TEST-F2-2
      377   ACC-TEST-F2-3
      393   ACC-TEST-F2-4
      353   ACC-WRITE-F2-1 . . . . . . . .  G350
      369   ACC-WRITE-F2-2 . . . . . . . .  G366
      385   ACC-WRITE-F2-3 . . . . . . . .  G382
      401   ACC-WRITE-F2-4 . . . . . . . .  G398
      328   BAIL-OUT . . . . . . . . . . .  P250
      336   BAIL-OUT-EX. . . . . . . . . .  E250 G330
      331   BAIL-OUT-WRITE . . . . . . . .  G329
      312   BLANK-LINE-PRINT
      403   CCVS-EXIT
      404   CCVS-999999
      225   CCVS1
      337   CCVS1-EXIT . . . . . . . . . .  G231
      232   CLOSE-FILES. . . . . . . . . .  G405
      260   COLUMN-NAMES-ROUTINE . . . . .  E230
      241   DE-LETE. . . . . . . . . . . .  P352 P368 P384 P400
      264   END-ROUTINE. . . . . . . . . .  P233
      268   END-ROUTINE-1
      277   END-ROUTINE-12
      285   END-ROUTINE-13 . . . . . . . .  E233
      266   END-RTN-EXIT
      240   FAIL
      314   FAIL-ROUTINE . . . . . . . . .  P249
      327   FAIL-ROUTINE-EX. . . . . . . .  E249 G321
      322   FAIL-ROUTINE-WRITE . . . . . .  G315 G316
      255   HEAD-ROUTINE . . . . . . . . .  P230
      238   INSPT
      226   OPEN-FILES
      239   PASS
      243   PRINT-DETAIL . . . . . . . . .  P354 P370 P386 P402
      339   SECT-NC214M-001
      236   TERMINATE-CALL
      234   TERMINATE-CCVS
      297   WRITE-LINE . . . . . . . . . .  P247 P248 P256 P257 P258 P259 P261 P262 P263 P265 P267 P276 P284 P290 P295 P296
                                            P319 P323 P325 P334
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page    14
0 Defined   Cross-reference of procedures   References

0     309   WRT-LN . . . . . . . . . . . .  P303 P304 P305 P308 P313
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page    15
0 Defined   Cross-reference of programs     References

        3   NC214M
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC214M    Date 06/04/2022  Time 11:59:56   Page    16
0LineID  Message code  Message text

     58  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC214M:
 *    Source records = 405
 *    Data Division statements = 79
 *    Procedure Division statements = 168
 *    Generated COBOL statements = 0
 *    Program complexity factor = 176
0End of compilation 1,  program NC214M,  highest severity 0.
0Return code 0
