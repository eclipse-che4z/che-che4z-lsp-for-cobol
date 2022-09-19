1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:56   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:56   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2094.2
   000002         000200 PROGRAM-ID.                                                      NC2094.2
   000003         000300     NC209A.                                                      NC2094.2
   000004         000400*                                                              *  NC2094.2
   000005         000600*                                                              *  NC2094.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2094.2
   000007         000800*                                                              *  NC2094.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2094.2
   000009         001000*                                                              *  NC2094.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2094.2
   000011         001200*                                                              *  NC2094.2
   000012         001400*                                                              *  NC2094.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2094.2
   000014         001600*                                                              *  NC2094.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2094.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2094.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2094.2
   000018         002000*                                                              *  NC2094.2
   000019         002200*    PROGRAM NC209A TESTS FORMAT 2 OF THE "MOVE" STATEMENT,    *  NC2094.2
   000020         002300*    USING QUALIFIED AND SUBSCRIPTED IDENTIFIERS.              *  NC2094.2
   000021         002400*                                                              *  NC2094.2
   000022         002600 ENVIRONMENT DIVISION.                                            NC2094.2
   000023         002700 CONFIGURATION SECTION.                                           NC2094.2
   000024         002800 SOURCE-COMPUTER.                                                 NC2094.2
   000025         002900     XXXXX082.                                                    NC2094.2
   000026         003000 OBJECT-COMPUTER.                                                 NC2094.2
   000027         003100     XXXXX083.                                                    NC2094.2
   000028         003200 INPUT-OUTPUT SECTION.                                            NC2094.2
   000029         003300 FILE-CONTROL.                                                    NC2094.2
   000030         003400     SELECT PRINT-FILE ASSIGN TO                                  NC2094.2 34
   000031         003500     XXXXX055.                                                    NC2094.2
   000032         003600 DATA DIVISION.                                                   NC2094.2
   000033         003700 FILE SECTION.                                                    NC2094.2
   000034         003800 FD  PRINT-FILE.                                                  NC2094.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003900 01  PRINT-REC PICTURE X(120).                                    NC2094.2
   000036         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC2094.2
   000037         004100 WORKING-STORAGE SECTION.                                         NC2094.2
   000038         004200 01  A-LEVEL.                                                     NC2094.2
   000039         004300     02 B-LEVEL.                                                  NC2094.2
   000040         004400         03 C-LEVEL.                                              NC2094.2
   000041         004500             04 D-LEVEL.                                          NC2094.2
   000042         004600                 05 TOM           PICTURE XXX  VALUE "TOM".       NC2094.2
   000043         004700                 05 DICK          PICTURE XXXX VALUE "DICK".      NC2094.2
   000044         004800             04 DD-LEVEL.                                         NC2094.2
   000045         004900                 05 HARRY         PICTURE X(5) VALUE "HARRY".     NC2094.2
   000046         005000             04 DDD-LEVEL.                                        NC2094.2
   000047         005100                 05 JOE           PICTURE XXX  VALUE "JOE".       NC2094.2
   000048         005200     02 AL                        PICTURE XX   VALUE "AL".        NC2094.2
   000049         005300     02 BB-LEVEL.                                                 NC2094.2
   000050         005400             04 BOB               PICTURE XXX  VALUE "BOB".       NC2094.2
   000051         005500 01  A-GROUP.                                                     NC2094.2
   000052         005600     02 B-GROUP.                                                  NC2094.2
   000053         005700         10 C-LEVEL.                                              NC2094.2
   000054         005800             12 D-LEVEL.                                          NC2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900                 13 TOM           PICTURE XXX  VALUE "ZZZ".       NC2094.2
   000056         006000                 13 DICK          PICTURE XXXX VALUE "ZZZZ".      NC2094.2
   000057         006100             12 DD-LEVEL-FALSE.                                   NC2094.2
   000058         006200                 13 HARRY         PICTURE X(5) VALUE "ZZZZZ".     NC2094.2
   000059         006300             12 DDD-LEVEL.                                        NC2094.2
   000060         006400                 13 JOE           PICTURE XXX  VALUE "ZZZ".       NC2094.2
   000061         006500 01  A-BUNCH.                                                     NC2094.2
   000062         006600     49 TOM   PICTURE XXX  VALUE "YYY".                           NC2094.2
   000063         006700     49 DICK  PICTURE XXXX VALUE "YYYY".                          NC2094.2
   000064         006800     49 HARRY PICTURE X(5) VALUE "YYYYY".                         NC2094.2
   000065         006900     49 JOE   PICTURE XXX  VALUE "YYY".                           NC2094.2
   000066         007000     49 AL    PICTURE XX   VALUE "YY".                            NC2094.2
   000067         007100     49 BOB   PICTURE XXX  VALUE "YYY".                           NC2094.2
   000068         007200 01  A-SET.                                                       NC2094.2
   000069         007300     02 B-SET.                                                    NC2094.2
   000070         007400             04 D-LEVEL.                                          NC2094.2
   000071         007500                 05 TOM           PICTURE XXX  VALUE "WWW".       NC2094.2
   000072         007600                 05 DICK          PICTURE XXXX VALUE "WWWW".      NC2094.2
   000073         007700             04 HARRY             PICTURE X(5) VALUE "WWWWW".     NC2094.2
   000074         007800             04 BOB               PICTURE XXX  VALUE "WWW".       NC2094.2
   000075         007900 01  C-STACK.                                                     NC2094.2
   000076         008000     04 D-LEVEL.                                                  NC2094.2
   000077         008100         05 TOM         PICTURE XXX  VALUE "VVV".                 NC2094.2
   000078         008200     04 DD-LEVEL.                                                 NC2094.2
   000079         008300         05 DICK        PICTURE XXXX VALUE "VVVV".                NC2094.2
   000080         008400         05 HARRY       PICTURE X(5) VALUE "VVVVV".               NC2094.2
   000081         008500 01  A-GLOB.                                                      NC2094.2
   000082         008600     02 B-LEVEL.                                                  NC2094.2
   000083         008700         03 C-LEVEL.                                              NC2094.2
   000084         008800             04 D-LEVEL.                                          NC2094.2
   000085         008900                 05 TOM           PICTURE XXX  VALUE "UUU".       NC2094.2
   000086         009000                 05 DICK          PICTURE XXXX VALUE "UUUU".      NC2094.2
   000087         009100             04  DD-LEVEL.                                        NC2094.2
   000088         009200                 05 HARRY-A       PICTURE XX   VALUE "UU".        NC2094.2
   000089         009300                 05 HARRY-B       PICTURE XXX  VALUE "UUU".       NC2094.2
   000090         009400             04 DDD-LEVEL.                                        NC2094.2
   000091         009500                 05 JOE           PICTURE XXX  VALUE "UUU".       NC2094.2
   000092         009600     02 AL                        PICTURE XX   VALUE "UU".        NC2094.2
   000093         009700     02 BB-LEVEL-FALSE.                                           NC2094.2
   000094         009800             04 BOB               PICTURE XXX  VALUE "UUU".       NC2094.2
   000095         009900      66         AL-BOB RENAMES AL OF A-GLOB THRU BOB OF A-GLOB.  NC2094.2 92 81 94 81
   000096         010000     66 HARRY RENAMES HARRY-A THRU HARRY-B.                       NC2094.2 88 89
   000097         010100 01  A-COLLECTION.                                                NC2094.2
   000098         010200     02 B-COLLECTION.                                             NC2094.2
   000099         010300         03 C-COLLECTION.                                         NC2094.2
   000100         010400             04 D-LEVEL.                                          NC2094.2
   000101         010500                 05 TOM OCCURS 3 TIMES      PICTURE X.            NC2094.2
   000102         010600                 05 DICK.                                         NC2094.2
   000103         010700                     06 RICHARD OCCURS 2    PICTURE XX.           NC2094.2
   000104         010800             04 DD-LEVEL-FALSE              PICTURE 9(5).         NC2094.2
   000105         010900             04 DD-LEVEL REDEFINES DD-LEVEL-FALSE.                NC2094.2 104
   000106         011000                 05 HARRY                   PICTURE X(5).         NC2094.2
   000107         011100             04 DDD-LEVEL.                                        NC2094.2
   000108         011200                 05 JOE                     PICTURE XXX.          NC2094.2
   000109         011300                 05 JOSEPH REDEFINES JOE    PICTURE 999.          NC2094.2 108
   000110         011400 01  WORK-AREA.                                                   NC2094.2
   000111         011500     02 WORK-TOM PICTURE XXX.                                     NC2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER PICTURE XXXX.                                      NC2094.2
   000113         011700 01  A-COVEY.                                                     NC2094.2
   000114         011800     02 FILLER                    PICTURE X(45).                  NC2094.2
   000115         011900     02 B-COVEY.                                                  NC2094.2
   000116         012000         03 TOMMY                 PICTURE XXX  VALUE "SSS".       NC2094.2
   000117         012100         03 DICKY                 PICTURE XXXX VALUE "SSSS".      NC2094.2
   000118         012200         03 JOEY                  PICTURE XXX  VALUE "SSS".       NC2094.2
   000119         012300         03 HAROLD                PICTURE X(5) VALUE "SSSSS".     NC2094.2
   000120         012400 01  A-FLOCK REDEFINES A-COVEY.                                   NC2094.2 113
   000121         012500     02 B-FLOCK OCCURS 4 TIMES.                                   NC2094.2
   000122         012600         03 C-FLOCK.                                              NC2094.2
   000123         012700             04 D-LEVEL.                                          NC2094.2
   000124         012800                 05 TOM           PICTURE XXX.                    NC2094.2
   000125         012900                 05 DICK          PICTURE XXXX.                   NC2094.2
   000126         013000             04 DDD-LEVEL.                                        NC2094.2
   000127         013100                 05 JOE           PICTURE XXX.                    NC2094.2
   000128         013200             04 DD-LEVEL.                                         NC2094.2
   000129         013300                 05 HARRY         PICTURE X(5).                   NC2094.2
   000130         013400 01  A-CROWD.                                                     NC2094.2
   000131         013500     02 BB-CROWD.                                                 NC2094.2
   000132         013600         03 BOBBY       PICTURE XXX VALUE "RRR".                  NC2094.2
   000133         013700         03 FILLER      PICTURE X(15).                            NC2094.2
   000134         013800     02 BB-MOB REDEFINES BB-CROWD OCCURS 6 TIMES.                 NC2094.2 131
   000135         013900         03 BOB         PICTURE XXX.                              NC2094.2
   000136         014000 01  TEST-RESULTS.                                                NC2094.2
   000137         014100     02 FILLER                   PIC X      VALUE SPACE.          NC2094.2 IMP
   000138         014200     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2094.2 IMP
   000139         014300     02 FILLER                   PIC X      VALUE SPACE.          NC2094.2 IMP
   000140         014400     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2094.2 IMP
   000141         014500     02 FILLER                   PIC X      VALUE SPACE.          NC2094.2 IMP
   000142         014600     02  PAR-NAME.                                                NC2094.2
   000143         014700       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2094.2 IMP
   000144         014800       03  PARDOT-X              PIC X      VALUE SPACE.          NC2094.2 IMP
   000145         014900       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2094.2 IMP
   000146         015000     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2094.2 IMP
   000147         015100     02 RE-MARK                  PIC X(61).                       NC2094.2
   000148         015200 01  TEST-COMPUTED.                                               NC2094.2
   000149         015300     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2094.2 IMP
   000150         015400     02 FILLER                   PIC X(17)  VALUE                 NC2094.2
   000151         015500            "       COMPUTED=".                                   NC2094.2
   000152         015600     02 COMPUTED-X.                                               NC2094.2
   000153         015700     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2094.2 IMP
   000154         015800     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2094.2 153
   000155         015900                                 PIC -9(9).9(9).                  NC2094.2
   000156         016000     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2094.2 153
   000157         016100     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2094.2 153
   000158         016200     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2094.2 153
   000159         016300     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2094.2 153
   000160         016400         04 COMPUTED-18V0                    PIC -9(18).          NC2094.2
   000161         016500         04 FILLER                           PIC X.               NC2094.2
   000162         016600     03 FILLER PIC X(50) VALUE SPACE.                             NC2094.2 IMP
   000163         016700 01  TEST-CORRECT.                                                NC2094.2
   000164         016800     02 FILLER PIC X(30) VALUE SPACE.                             NC2094.2 IMP
   000165         016900     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2094.2
   000166         017000     02 CORRECT-X.                                                NC2094.2
   000167         017100     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2094.2 IMP
   000168         017200     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2094.2 167
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2094.2 167
   000170         017400     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2094.2 167
   000171         017500     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2094.2 167
   000172         017600     03      CR-18V0 REDEFINES CORRECT-A.                         NC2094.2 167
   000173         017700         04 CORRECT-18V0                     PIC -9(18).          NC2094.2
   000174         017800         04 FILLER                           PIC X.               NC2094.2
   000175         017900     03 FILLER PIC X(2) VALUE SPACE.                              NC2094.2 IMP
   000176         018000     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2094.2 IMP
   000177         018100 01  CCVS-C-1.                                                    NC2094.2
   000178         018200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2094.2
   000179         018300-    "SS  PARAGRAPH-NAME                                          NC2094.2
   000180         018400-    "       REMARKS".                                            NC2094.2
   000181         018500     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2094.2 IMP
   000182         018600 01  CCVS-C-2.                                                    NC2094.2
   000183         018700     02 FILLER                     PIC X        VALUE SPACE.      NC2094.2 IMP
   000184         018800     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2094.2
   000185         018900     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2094.2 IMP
   000186         019000     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2094.2
   000187         019100     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2094.2 IMP
   000188         019200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2094.2 IMP
   000189         019300 01  REC-CT                        PIC 99       VALUE ZERO.       NC2094.2 IMP
   000190         019400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2094.2 IMP
   000191         019500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2094.2 IMP
   000192         019600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2094.2 IMP
   000193         019700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2094.2 IMP
   000194         019800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2094.2 IMP
   000195         019900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2094.2 IMP
   000196         020000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2094.2 IMP
   000197         020100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2094.2 IMP
   000198         020200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2094.2 IMP
   000199         020300 01  CCVS-H-1.                                                    NC2094.2
   000200         020400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2094.2 IMP
   000201         020500     02  FILLER                    PIC X(42)    VALUE             NC2094.2
   000202         020600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2094.2
   000203         020700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2094.2 IMP
   000204         020800 01  CCVS-H-2A.                                                   NC2094.2
   000205         020900   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2094.2 IMP
   000206         021000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2094.2
   000207         021100   02  FILLER                        PIC XXXX   VALUE             NC2094.2
   000208         021200     "4.2 ".                                                      NC2094.2
   000209         021300   02  FILLER                        PIC X(28)  VALUE             NC2094.2
   000210         021400            " COPY - NOT FOR DISTRIBUTION".                       NC2094.2
   000211         021500   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2094.2 IMP
   000212         021600                                                                  NC2094.2
   000213         021700 01  CCVS-H-2B.                                                   NC2094.2
   000214         021800   02  FILLER                        PIC X(15)  VALUE             NC2094.2
   000215         021900            "TEST RESULT OF ".                                    NC2094.2
   000216         022000   02  TEST-ID                       PIC X(9).                    NC2094.2
   000217         022100   02  FILLER                        PIC X(4)   VALUE             NC2094.2
   000218         022200            " IN ".                                               NC2094.2
   000219         022300   02  FILLER                        PIC X(12)  VALUE             NC2094.2
   000220         022400     " HIGH       ".                                              NC2094.2
   000221         022500   02  FILLER                        PIC X(22)  VALUE             NC2094.2
   000222         022600            " LEVEL VALIDATION FOR ".                             NC2094.2
   000223         022700   02  FILLER                        PIC X(58)  VALUE             NC2094.2
   000224         022800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2094.2
   000225         022900 01  CCVS-H-3.                                                    NC2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02  FILLER                      PIC X(34)  VALUE             NC2094.2
   000227         023100            " FOR OFFICIAL USE ONLY    ".                         NC2094.2
   000228         023200     02  FILLER                      PIC X(58)  VALUE             NC2094.2
   000229         023300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2094.2
   000230         023400     02  FILLER                      PIC X(28)  VALUE             NC2094.2
   000231         023500            "  COPYRIGHT   1985 ".                                NC2094.2
   000232         023600 01  CCVS-E-1.                                                    NC2094.2
   000233         023700     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2094.2 IMP
   000234         023800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2094.2
   000235         023900     02 ID-AGAIN                     PIC X(9).                    NC2094.2
   000236         024000     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2094.2 IMP
   000237         024100 01  CCVS-E-2.                                                    NC2094.2
   000238         024200     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2094.2 IMP
   000239         024300     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2094.2 IMP
   000240         024400     02 CCVS-E-2-2.                                               NC2094.2
   000241         024500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2094.2 IMP
   000242         024600         03 FILLER                   PIC X      VALUE SPACE.      NC2094.2 IMP
   000243         024700         03 ENDER-DESC               PIC X(44)  VALUE             NC2094.2
   000244         024800            "ERRORS ENCOUNTERED".                                 NC2094.2
   000245         024900 01  CCVS-E-3.                                                    NC2094.2
   000246         025000     02  FILLER                      PIC X(22)  VALUE             NC2094.2
   000247         025100            " FOR OFFICIAL USE ONLY".                             NC2094.2
   000248         025200     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2094.2 IMP
   000249         025300     02  FILLER                      PIC X(58)  VALUE             NC2094.2
   000250         025400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2094.2
   000251         025500     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2094.2 IMP
   000252         025600     02 FILLER                       PIC X(15)  VALUE             NC2094.2
   000253         025700             " COPYRIGHT 1985".                                   NC2094.2
   000254         025800 01  CCVS-E-4.                                                    NC2094.2
   000255         025900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2094.2 IMP
   000256         026000     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2094.2
   000257         026100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2094.2 IMP
   000258         026200     02 FILLER                       PIC X(40)  VALUE             NC2094.2
   000259         026300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2094.2
   000260         026400 01  XXINFO.                                                      NC2094.2
   000261         026500     02 FILLER                       PIC X(19)  VALUE             NC2094.2
   000262         026600            "*** INFORMATION ***".                                NC2094.2
   000263         026700     02 INFO-TEXT.                                                NC2094.2
   000264         026800       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2094.2 IMP
   000265         026900       04 XXCOMPUTED                 PIC X(20).                   NC2094.2
   000266         027000       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2094.2 IMP
   000267         027100       04 XXCORRECT                  PIC X(20).                   NC2094.2
   000268         027200     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2094.2
   000269         027300 01  HYPHEN-LINE.                                                 NC2094.2
   000270         027400     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2094.2 IMP
   000271         027500     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2094.2
   000272         027600-    "*****************************************".                 NC2094.2
   000273         027700     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2094.2
   000274         027800-    "******************************".                            NC2094.2
   000275         027900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2094.2
   000276         028000     "NC209A".                                                    NC2094.2
   000277         028100 PROCEDURE DIVISION.                                              NC2094.2
   000278         028200 CCVS1 SECTION.                                                   NC2094.2
   000279         028300 OPEN-FILES.                                                      NC2094.2
   000280         028400     OPEN     OUTPUT PRINT-FILE.                                  NC2094.2 34
   000281         028500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2094.2 275 216 275 235
   000282         028600     MOVE    SPACE TO TEST-RESULTS.                               NC2094.2 IMP 136
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2094.2 308 313
   000284         028800     GO TO CCVS1-EXIT.                                            NC2094.2 390
   000285         028900 CLOSE-FILES.                                                     NC2094.2
   000286         029000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2094.2 317 338 34
   000287         029100 TERMINATE-CCVS.                                                  NC2094.2
   000288         029200     EXIT PROGRAM.                                                NC2094.2
   000289         029300 TERMINATE-CALL.                                                  NC2094.2
   000290         029400     STOP     RUN.                                                NC2094.2
   000291         029500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2094.2 140 192
   000292         029600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2094.2 140 193
   000293         029700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2094.2 140 191
   000294         029800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2094.2 140 190
   000295         029900     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2094.2 147
   000296         030000 PRINT-DETAIL.                                                    NC2094.2
   000297         030100     IF REC-CT NOT EQUAL TO ZERO                                  NC2094.2 189 IMP
   000298      1  030200             MOVE "." TO PARDOT-X                                 NC2094.2 144
   000299      1  030300             MOVE REC-CT TO DOTVALUE.                             NC2094.2 189 145
   000300         030400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2094.2 136 35 350
   000301         030500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2094.2 140 350
   000302      1  030600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2094.2 367 380
   000303      1  030700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2094.2 381 389
   000304         030800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2094.2 IMP 140 IMP 152
   000305         030900     MOVE SPACE TO CORRECT-X.                                     NC2094.2 IMP 166
   000306         031000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2094.2 189 IMP IMP 142
   000307         031100     MOVE     SPACE TO RE-MARK.                                   NC2094.2 IMP 147
   000308         031200 HEAD-ROUTINE.                                                    NC2094.2
   000309         031300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2094.2 199 36 350
   000310         031400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2094.2 204 36 350
   000311         031500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2094.2 213 36 350
   000312         031600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2094.2 225 36 350
   000313         031700 COLUMN-NAMES-ROUTINE.                                            NC2094.2
   000314         031800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2094.2 177 36 350
   000315         031900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2094.2 182 36 350
   000316         032000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2094.2 269 36 350
   000317         032100 END-ROUTINE.                                                     NC2094.2
   000318         032200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2094.2 269 36 350
   000319         032300 END-RTN-EXIT.                                                    NC2094.2
   000320         032400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2094.2 232 36 350
   000321         032500 END-ROUTINE-1.                                                   NC2094.2
   000322         032600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2094.2 191 195 192
   000323         032700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2094.2 195 190 195
   000324         032800      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2094.2 193 195
   000325         032900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2094.2
   000326         033000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2094.2 193 255
   000327         033100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2094.2 195 257
   000328         033200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2094.2 254 240
   000329         033300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2094.2 237 36 350
   000330         033400  END-ROUTINE-12.                                                 NC2094.2
   000331         033500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2094.2 243
   000332         033600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2094.2 191 IMP
   000333      1  033700         MOVE "NO " TO ERROR-TOTAL                                NC2094.2 241
   000334         033800         ELSE                                                     NC2094.2
   000335      1  033900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2094.2 191 241
   000336         034000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2094.2 237 36
   000337         034100     PERFORM WRITE-LINE.                                          NC2094.2 350
   000338         034200 END-ROUTINE-13.                                                  NC2094.2
   000339         034300     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2094.2 190 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340      1  034400         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2094.2 241
   000341      1  034500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2094.2 190 241
   000342         034600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2094.2 243
   000343         034700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2094.2 237 36 350
   000344         034800      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2094.2 192 IMP
   000345      1  034900          MOVE "NO " TO ERROR-TOTAL                               NC2094.2 241
   000346      1  035000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2094.2 192 241
   000347         035100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2094.2 243
   000348         035200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2094.2 237 36 350
   000349         035300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2094.2 245 36 350
   000350         035400 WRITE-LINE.                                                      NC2094.2
   000351         035500     ADD 1 TO RECORD-COUNT.                                       NC2094.2 197
   000352         035600     IF RECORD-COUNT GREATER 50                                   NC2094.2 197
   000353      1  035700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2094.2 36 196
   000354      1  035800         MOVE SPACE TO DUMMY-RECORD                               NC2094.2 IMP 36
   000355      1  035900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2094.2 36
   000356      1  036000         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2094.2 177 36 362
   000357      1  036100         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2094.2 182 36 362
   000358      1  036200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2094.2 269 36 362
   000359      1  036300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2094.2 196 36
   000360      1  036400         MOVE ZERO TO RECORD-COUNT.                               NC2094.2 IMP 197
   000361         036500     PERFORM WRT-LN.                                              NC2094.2 362
   000362         036600 WRT-LN.                                                          NC2094.2
   000363         036700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2094.2 36
   000364         036800     MOVE SPACE TO DUMMY-RECORD.                                  NC2094.2 IMP 36
   000365         036900 BLANK-LINE-PRINT.                                                NC2094.2
   000366         037000     PERFORM WRT-LN.                                              NC2094.2 362
   000367         037100 FAIL-ROUTINE.                                                    NC2094.2
   000368         037200     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2094.2 152 IMP 375
   000369         037300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2094.2 166 IMP 375
   000370         037400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2094.2 198 268
   000371         037500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2094.2 263
   000372         037600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2094.2 260 36 350
   000373         037700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2094.2 IMP 268
   000374         037800     GO TO  FAIL-ROUTINE-EX.                                      NC2094.2 380
   000375         037900 FAIL-ROUTINE-WRITE.                                              NC2094.2
   000376         038000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2094.2 148 35 350
   000377         038100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2094.2 198 176
   000378         038200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2094.2 163 35 350
   000379         038300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2094.2 IMP 176
   000380         038400 FAIL-ROUTINE-EX. EXIT.                                           NC2094.2
   000381         038500 BAIL-OUT.                                                        NC2094.2
   000382         038600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2094.2 153 IMP 384
   000383         038700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2094.2 167 IMP 389
   000384         038800 BAIL-OUT-WRITE.                                                  NC2094.2
   000385         038900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2094.2 167 267 153 265
   000386         039000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2094.2 198 268
   000387         039100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2094.2 260 36 350
   000388         039200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2094.2 IMP 268
   000389         039300 BAIL-OUT-EX. EXIT.                                               NC2094.2
   000390         039400 CCVS1-EXIT.                                                      NC2094.2
   000391         039500     EXIT.                                                        NC2094.2
   000392         039600 SECT-NC209A-001 SECTION.                                         NC2094.2
   000393         039700 NC-209A-001.                                                     NC2094.2
   000394         039800 MOV-INIT-F2-1.                                                   NC2094.2

 ==000394==> IGYPS2015-I The paragraph or section prior to paragraph or section "MOV-INIT-F2-1"
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0                        did not contain any statements.

   000395         039900     MOVE     "MOV-TEST-F2-1" TO PAR-NAME.                        NC2094.2 142
   000396         040000     MOVE     "VI-102 6.18.4 GR1" TO ANSI-REFERENCE.              NC2094.2 198
   000397         040100     MOVE     "MOVE CORRESPONDING -" TO FEATURE.                  NC2094.2 138
   000398         040200     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000399         040300     MOVE     "  DIFFERENT LEVELS  " TO FEATURE.                  NC2094.2 138
   000400         040400     MOVE     CORRESPONDING B-LEVEL OF A-LEVEL TO B-GROUP.        NC2094.2 39 38 52
   000401         040500     MOVE     1 TO REC-CT.                                        NC2094.2 189
   000402         040600*    TOM DICK AND JOE SHOULD BE MOVED.                            NC2094.2
   000403         040700*                                                                 NC2094.2
   000404         040800 MOV-TEST-F2-1-1.                                                 NC2094.2
   000405         040900     IF       TOM       OF A-GROUP          EQUAL TO "TOM"        NC2094.2 55 51
   000406      1  041000              PERFORM PASS                                        NC2094.2 292
   000407      1  041100              GO TO MOV-WRITE-F2-1-1.                             NC2094.2 416
   000408         041200     GO TO MOV-FAIL-F2-1-1.                                       NC2094.2 412
   000409         041300 MOV-DELETE-F2-1-1.                                               NC2094.2
   000410         041400     PERFORM  DE-LETE.                                            NC2094.2 294
   000411         041500     GO TO MOV-WRITE-F2-1-1.                                      NC2094.2 416
   000412         041600 MOV-FAIL-F2-1-1.                                                 NC2094.2
   000413         041700     PERFORM  FAIL.                                               NC2094.2 293
   000414         041800     MOVE     TOM     OF A-GROUP      TO COMPUTED-A.              NC2094.2 55 51 153
   000415         041900     MOVE     "TOM"   TO CORRECT-A.                               NC2094.2 167
   000416         042000 MOV-WRITE-F2-1-1.                                                NC2094.2
   000417         042100     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000418         042200*                                                                 NC2094.2
   000419         042300 MOV-TEST-F2-1-2.                                                 NC2094.2
   000420         042400     ADD      1 TO REC-CT.                                        NC2094.2 189
   000421         042500     IF       DICK      OF A-GROUP          EQUAL TO "DICK"       NC2094.2 56 51
   000422      1  042600              PERFORM PASS                                        NC2094.2 292
   000423      1  042700              GO TO MOV-WRITE-F2-1-2.                             NC2094.2 432
   000424         042800     GO       TO MOV-FAIL-F2-1-2.                                 NC2094.2 428
   000425         042900 MOV-DELETE-F2-1-2.                                               NC2094.2
   000426         043000     PERFORM  DE-LETE.                                            NC2094.2 294
   000427         043100     GO       TO MOV-WRITE-F2-1-2.                                NC2094.2 432
   000428         043200 MOV-FAIL-F2-1-2.                                                 NC2094.2
   000429         043300     PERFORM  FAIL.                                               NC2094.2 293
   000430         043400     MOVE     DICK    OF A-GROUP      TO COMPUTED-A.              NC2094.2 56 51 153
   000431         043500     MOVE     "DICK"  TO CORRECT-A.                               NC2094.2 167
   000432         043600 MOV-WRITE-F2-1-2.                                                NC2094.2
   000433         043700     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000434         043800*                                                                 NC2094.2
   000435         043900 MOV-TEST-F2-1-3.                                                 NC2094.2
   000436         044000     ADD      1 TO REC-CT.                                        NC2094.2 189
   000437         044100     IF       HARRY     OF A-GROUP          EQUAL TO "ZZZZZ"      NC2094.2 58 51
   000438      1  044200              PERFORM PASS                                        NC2094.2 292
   000439      1  044300              GO TO MOV-WRITE-F2-1-3.                             NC2094.2 448
   000440         044400     GO       TO MOV-FAIL-F2-1-3.                                 NC2094.2 444
   000441         044500 MOV-DELETE-F2-1-3.                                               NC2094.2
   000442         044600     PERFORM  DE-LETE.                                            NC2094.2 294
   000443         044700     GO       TO MOV-WRITE-F2-1-3.                                NC2094.2 448
   000444         044800 MOV-FAIL-F2-1-3.                                                 NC2094.2
   000445         044900     PERFORM  FAIL.                                               NC2094.2 293
   000446         045000     MOVE     HARRY   OF A-GROUP      TO COMPUTED-A.              NC2094.2 58 51 153
   000447         045100     MOVE     "ZZZZZ" TO CORRECT-A.                               NC2094.2 167
   000448         045200 MOV-WRITE-F2-1-3.                                                NC2094.2
   000449         045300     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045400*                                                                 NC2094.2
   000451         045500 MOV-TEST-F2-1-4.                                                 NC2094.2
   000452         045600     ADD 1 TO REC-CT.                                             NC2094.2 189
   000453         045700     IF       JOE       OF A-GROUP          EQUAL TO "JOE"        NC2094.2 60 51
   000454      1  045800              PERFORM PASS                                        NC2094.2 292
   000455      1  045900              GO TO MOV-WRITE-F2-1-4.                             NC2094.2 464
   000456         046000     GO       TO MOV-FAIL-F2-1-4.                                 NC2094.2 460
   000457         046100 MOV-DELETE-F2-1-4.                                               NC2094.2
   000458         046200     PERFORM  DE-LETE.                                            NC2094.2 294
   000459         046300     GO       TO MOV-WRITE-F2-1-4.                                NC2094.2 464
   000460         046400 MOV-FAIL-F2-1-4.                                                 NC2094.2
   000461         046500     PERFORM  FAIL.                                               NC2094.2 293
   000462         046600     MOVE     JOE     OF A-GROUP      TO COMPUTED-A.              NC2094.2 60 51 153
   000463         046700     MOVE     "JOE"   TO CORRECT-A.                               NC2094.2 167
   000464         046800 MOV-WRITE-F2-1-4.                                                NC2094.2
   000465         046900     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000466         047000*                                                                 NC2094.2
   000467         047100 MOV-INIT-F2-2.                                                   NC2094.2
   000468         047200     MOVE     "MOV-TEST-F2-2" TO PAR-NAME.                        NC2094.2 142
   000469         047300     MOVE     "VI-102 6.18.4 GR1" TO ANSI-REFERENCE.              NC2094.2 198
   000470         047400     MOVE     CORRESPONDING A-LEVEL TO A-BUNCH.                   NC2094.2 38 61
   000471         047500     MOVE     1 TO REC-CT.                                        NC2094.2 189
   000472         047600*        NOTE AL SHOULD BE MOVED.                                 NC2094.2
   000473         047700 MOV-TEST-F2-2-1.                                                 NC2094.2
   000474         047800     IF       TOM       OF A-BUNCH          EQUAL TO "YYY"        NC2094.2 62 61
   000475      1  047900              PERFORM PASS                                        NC2094.2 292
   000476      1  048000              GO TO MOV-WRITE-F2-2-1.                             NC2094.2 485
   000477         048100     GO       TO MOV-FAIL-F2-2-1.                                 NC2094.2 481
   000478         048200 MOV-DELETE-F2-2-1.                                               NC2094.2
   000479         048300     PERFORM  DE-LETE.                                            NC2094.2 294
   000480         048400     GO       TO MOV-WRITE-F2-2-1.                                NC2094.2 485
   000481         048500 MOV-FAIL-F2-2-1.                                                 NC2094.2
   000482         048600     PERFORM  FAIL.                                               NC2094.2 293
   000483         048700     MOVE     TOM     OF A-BUNCH      TO COMPUTED-A.              NC2094.2 62 61 153
   000484         048800     MOVE     "YYY"   TO CORRECT-A.                               NC2094.2 167
   000485         048900 MOV-WRITE-F2-2-1.                                                NC2094.2
   000486         049000     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000487         049100*                                                                 NC2094.2
   000488         049200 MOV-TEST-F2-2-2.                                                 NC2094.2
   000489         049300     ADD 1 TO REC-CT.                                             NC2094.2 189
   000490         049400     IF       DICK      OF A-BUNCH          EQUAL TO "YYYY"       NC2094.2 63 61
   000491      1  049500              PERFORM PASS                                        NC2094.2 292
   000492      1  049600              GO TO MOV-WRITE-F2-2-2.                             NC2094.2 501
   000493         049700     GO       TO MOV-FAIL-F2-2-2.                                 NC2094.2 497
   000494         049800 MOV-DELETE-F2-2-2.                                               NC2094.2
   000495         049900     PERFORM  DE-LETE.                                            NC2094.2 294
   000496         050000     GO       TO MOV-WRITE-F2-2-2.                                NC2094.2 501
   000497         050100 MOV-FAIL-F2-2-2.                                                 NC2094.2
   000498         050200     PERFORM  FAIL.                                               NC2094.2 293
   000499         050300     MOVE     DICK    OF A-BUNCH      TO COMPUTED-A.              NC2094.2 63 61 153
   000500         050400     MOVE     "YYYY"  TO CORRECT-A.                               NC2094.2 167
   000501         050500 MOV-WRITE-F2-2-2.                                                NC2094.2
   000502         050600     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000503         050700*                                                                 NC2094.2
   000504         050800 MOV-TEST-F2-2-3.                                                 NC2094.2
   000505         050900     ADD 1 TO REC-CT.                                             NC2094.2 189
   000506         051000     IF       HARRY     OF A-BUNCH          EQUAL TO "YYYYY"      NC2094.2 64 61
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507      1  051100              PERFORM PASS                                        NC2094.2 292
   000508      1  051200              GO TO MOV-WRITE-F2-2-3.                             NC2094.2 517
   000509         051300     GO       TO MOV-FAIL-F2-2-3.                                 NC2094.2 513
   000510         051400 MOV-DELETE-F2-2-3.                                               NC2094.2
   000511         051500     PERFORM  DE-LETE.                                            NC2094.2 294
   000512         051600     GO       TO MOV-WRITE-F2-2-3.                                NC2094.2 517
   000513         051700 MOV-FAIL-F2-2-3.                                                 NC2094.2
   000514         051800     PERFORM  FAIL.                                               NC2094.2 293
   000515         051900     MOVE     HARRY   OF A-BUNCH      TO COMPUTED-A.              NC2094.2 64 61 153
   000516         052000     MOVE     "YYYYY" TO CORRECT-A.                               NC2094.2 167
   000517         052100 MOV-WRITE-F2-2-3.                                                NC2094.2
   000518         052200     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000519         052300*                                                                 NC2094.2
   000520         052400 MOV-TEST-F2-2-4.                                                 NC2094.2
   000521         052500     ADD 1 TO REC-CT.                                             NC2094.2 189
   000522         052600     IF       JOE       OF A-BUNCH          EQUAL TO "YYY"        NC2094.2 65 61
   000523      1  052700              PERFORM PASS                                        NC2094.2 292
   000524      1  052800              GO TO MOV-WRITE-F2-2-4.                             NC2094.2 533
   000525         052900     GO       TO MOV-FAIL-F2-2-4.                                 NC2094.2 529
   000526         053000 MOV-DELETE-F2-2-4.                                               NC2094.2
   000527         053100     PERFORM  DE-LETE.                                            NC2094.2 294
   000528         053200     GO       TO MOV-WRITE-F2-2-4.                                NC2094.2 533
   000529         053300 MOV-FAIL-F2-2-4.                                                 NC2094.2
   000530         053400     PERFORM  FAIL.                                               NC2094.2 293
   000531         053500     MOVE     JOE     OF A-BUNCH      TO COMPUTED-A.              NC2094.2 65 61 153
   000532         053600     MOVE     "YYY"   TO CORRECT-A.                               NC2094.2 167
   000533         053700 MOV-WRITE-F2-2-4.                                                NC2094.2
   000534         053800     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000535         053900*                                                                 NC2094.2
   000536         054000 MOV-TEST-F2-2-5.                                                 NC2094.2
   000537         054100     ADD 1 TO REC-CT.                                             NC2094.2 189
   000538         054200     IF       AL        OF A-BUNCH          EQUAL TO "AL"         NC2094.2 66 61
   000539      1  054300              PERFORM PASS                                        NC2094.2 292
   000540      1  054400              GO TO MOV-WRITE-F2-2-5.                             NC2094.2 549
   000541         054500     GO       TO MOV-FAIL-F2-2-5.                                 NC2094.2 545
   000542         054600 MOV-DELETE-F2-2-5.                                               NC2094.2
   000543         054700     PERFORM  DE-LETE.                                            NC2094.2 294
   000544         054800     GO       TO MOV-WRITE-F2-2-5.                                NC2094.2 549
   000545         054900 MOV-FAIL-F2-2-5.                                                 NC2094.2
   000546         055000     PERFORM  FAIL.                                               NC2094.2 293
   000547         055100     MOVE     AL      OF A-BUNCH      TO COMPUTED-A.              NC2094.2 66 61 153
   000548         055200     MOVE     "AL"    TO CORRECT-A.                               NC2094.2 167
   000549         055300 MOV-WRITE-F2-2-5.                                                NC2094.2
   000550         055400     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000551         055500*                                                                 NC2094.2
   000552         055600 MOV-TEST-F2-2-6.                                                 NC2094.2
   000553         055700     ADD 1 TO REC-CT.                                             NC2094.2 189
   000554         055800     IF       BOB       OF A-BUNCH          EQUAL TO "YYY"        NC2094.2 67 61
   000555      1  055900              PERFORM PASS                                        NC2094.2 292
   000556      1  056000              GO TO MOV-WRITE-F2-2-6.                             NC2094.2 565
   000557         056100     GO       TO MOV-FAIL-F2-2-6.                                 NC2094.2 561
   000558         056200 MOV-DELETE-F2-2-6.                                               NC2094.2
   000559         056300     PERFORM  DE-LETE.                                            NC2094.2 294
   000560         056400     GO       TO MOV-WRITE-F2-2-6.                                NC2094.2 565
   000561         056500 MOV-FAIL-F2-2-6.                                                 NC2094.2
   000562         056600     PERFORM  FAIL.                                               NC2094.2 293
   000563         056700     MOVE     BOB     OF A-BUNCH      TO COMPUTED-A.              NC2094.2 67 61 153
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564         056800     MOVE     "YYY"   TO CORRECT-A.                               NC2094.2 167
   000565         056900 MOV-WRITE-F2-2-6.                                                NC2094.2
   000566         057000     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000567         057100*                                                                 NC2094.2
   000568         057200 MOV-INIT-F2-3.                                                   NC2094.2
   000569         057300     MOVE     "MOV-TEST-F2-3" TO PAR-NAME.                        NC2094.2 142
   000570         057400     MOVE     "VI-102 6.18.4 GR1" TO ANSI-REFERENCE.              NC2094.2 198
   000571         057500     MOVE     CORR B-LEVEL OF A-LEVEL TO B-SET.                   NC2094.2 39 38 69

 ==000571==> IGYPS2016-W No "CORRESPONDING" operands were found.  The statement had no effect.

   000572         057600     MOVE     1 TO REC-CT.                                        NC2094.2 189
   000573         057700*        NOTE CORR IS A LEGAL ABBREVIATION.                       NC2094.2
   000574         057800*        NOTE NO MOVES SHOULD TAKE PLACE.                         NC2094.2
   000575         057900*                                                                 NC2094.2
   000576         058000 MOV-TEST-F2-3-1.                                                 NC2094.2
   000577         058100     ADD 1 TO REC-CT.                                             NC2094.2 189
   000578         058200     IF       TOM       OF A-SET            EQUAL TO "WWW"        NC2094.2 71 68
   000579      1  058300              PERFORM PASS                                        NC2094.2 292
   000580      1  058400              GO TO MOV-WRITE-F2-3-1.                             NC2094.2 589
   000581         058500     GO       TO MOV-FAIL-F2-3-1.                                 NC2094.2 585
   000582         058600 MOV-DELETE-F2-3-1.                                               NC2094.2
   000583         058700     PERFORM  DE-LETE.                                            NC2094.2 294
   000584         058800     GO       TO MOV-WRITE-F2-3-1.                                NC2094.2 589
   000585         058900 MOV-FAIL-F2-3-1.                                                 NC2094.2
   000586         059000     PERFORM  FAIL.                                               NC2094.2 293
   000587         059100     MOVE     TOM     OF A-SET        TO COMPUTED-A.              NC2094.2 71 68 153
   000588         059200     MOVE     "WWW"   TO CORRECT-A.                               NC2094.2 167
   000589         059300 MOV-WRITE-F2-3-1.                                                NC2094.2
   000590         059400     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000591         059500*                                                                 NC2094.2
   000592         059600 MOV-TEST-F2-3-2.                                                 NC2094.2
   000593         059700     ADD 1 TO REC-CT.                                             NC2094.2 189
   000594         059800     IF       DICK      OF A-SET            EQUAL TO "WWWW"       NC2094.2 72 68
   000595      1  059900              PERFORM PASS                                        NC2094.2 292
   000596      1  060000              GO TO MOV-WRITE-F2-3-2.                             NC2094.2 605
   000597         060100     GO       TO MOV-FAIL-F2-3-2.                                 NC2094.2 601
   000598         060200 MOV-DELETE-F2-3-2.                                               NC2094.2
   000599         060300     PERFORM  DE-LETE.                                            NC2094.2 294
   000600         060400     GO       TO MOV-WRITE-F2-3-2.                                NC2094.2 605
   000601         060500 MOV-FAIL-F2-3-2.                                                 NC2094.2
   000602         060600     PERFORM  FAIL.                                               NC2094.2 293
   000603         060700     MOVE     DICK    OF A-SET        TO COMPUTED-A.              NC2094.2 72 68 153
   000604         060800     MOVE     "WWWW"  TO CORRECT-A.                               NC2094.2 167
   000605         060900 MOV-WRITE-F2-3-2.                                                NC2094.2
   000606         061000     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000607         061100*                                                                 NC2094.2
   000608         061200 MOV-TEST-F2-3-3.                                                 NC2094.2
   000609         061300     ADD 1 TO REC-CT.                                             NC2094.2 189
   000610         061400     IF       HARRY     OF A-SET            EQUAL TO "WWWWW"      NC2094.2 73 68
   000611      1  061500              PERFORM PASS                                        NC2094.2 292
   000612      1  061600              GO TO MOV-WRITE-F2-3-3.                             NC2094.2 621
   000613         061700     GO       TO MOV-FAIL-F2-3-3.                                 NC2094.2 617
   000614         061800 MOV-DELETE-F2-3-3.                                               NC2094.2
   000615         061900     PERFORM  DE-LETE.                                            NC2094.2 294
   000616         062000     GO       TO MOV-WRITE-F2-3-3.                                NC2094.2 621
   000617         062100 MOV-FAIL-F2-3-3.                                                 NC2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000618         062200     PERFORM  FAIL.                                               NC2094.2 293
   000619         062300     MOVE     HARRY   OF A-SET        TO COMPUTED-A.              NC2094.2 73 68 153
   000620         062400     MOVE     "WWWWW" TO CORRECT-A.                               NC2094.2 167
   000621         062500 MOV-WRITE-F2-3-3.                                                NC2094.2
   000622         062600     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000623         062700*                                                                 NC2094.2
   000624         062800 MOV-TEST-F2-3-4.                                                 NC2094.2
   000625         062900     ADD 1 TO REC-CT.                                             NC2094.2 189
   000626         063000     IF       BOB       OF A-SET            EQUAL TO "WWW"        NC2094.2 74 68
   000627      1  063100              PERFORM PASS                                        NC2094.2 292
   000628      1  063200              GO TO MOV-WRITE-F2-3-4.                             NC2094.2 637
   000629         063300     GO       TO MOV-FAIL-F2-3-4.                                 NC2094.2 633
   000630         063400 MOV-DELETE-F2-3-4.                                               NC2094.2
   000631         063500     PERFORM  DE-LETE.                                            NC2094.2 294
   000632         063600     GO       TO MOV-WRITE-F2-3-4.                                NC2094.2 637
   000633         063700 MOV-FAIL-F2-3-4.                                                 NC2094.2
   000634         063800     PERFORM  FAIL.                                               NC2094.2 293
   000635         063900     MOVE     BOB     OF A-SET        TO COMPUTED-A.              NC2094.2 74 68 153
   000636         064000     MOVE     "WWW"   TO CORRECT-A.                               NC2094.2 167
   000637         064100 MOV-WRITE-F2-3-4.                                                NC2094.2
   000638         064200     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000639         064300*                                                                 NC2094.2
   000640         064400 MOV-INIT-F2-4.                                                   NC2094.2
   000641         064500     MOVE     "MOV-TEST-F2-4" TO PAR-NAME.                        NC2094.2 142
   000642         064600     MOVE     "VI-102 6.18.4 GR1" TO ANSI-REFERENCE.              NC2094.2 198
   000643         064700     MOVE     CORRESPONDING C-LEVEL OF A-LEVEL TO C-STACK.        NC2094.2 40 38 75
   000644         064800     MOVE     1 TO REC-CT.                                        NC2094.2 189
   000645         064900*        NOTE TOM AND HARRY SHOULD BE MOVED.                      NC2094.2
   000646         065000 MOV-TEST-F2-4-1.                                                 NC2094.2
   000647         065100     IF       TOM       OF C-STACK          EQUAL TO "TOM"        NC2094.2 77 75
   000648      1  065200              PERFORM PASS                                        NC2094.2 292
   000649      1  065300              GO TO MOV-WRITE-F2-4-1.                             NC2094.2 658
   000650         065400     GO       TO MOV-FAIL-F2-4-1.                                 NC2094.2 654
   000651         065500 MOV-DELETE-F2-4-1.                                               NC2094.2
   000652         065600     PERFORM  DE-LETE.                                            NC2094.2 294
   000653         065700     GO       TO MOV-WRITE-F2-4-1.                                NC2094.2 658
   000654         065800 MOV-FAIL-F2-4-1.                                                 NC2094.2
   000655         065900     PERFORM  FAIL.                                               NC2094.2 293
   000656         066000     MOVE     TOM     OF C-STACK      TO COMPUTED-A.              NC2094.2 77 75 153
   000657         066100     MOVE     "TOM"   TO CORRECT-A.                               NC2094.2 167
   000658         066200 MOV-WRITE-F2-4-1.                                                NC2094.2
   000659         066300     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000660         066400*                                                                 NC2094.2
   000661         066500 MOV-TEST-F2-4-2.                                                 NC2094.2
   000662         066600     ADD 1 TO REC-CT.                                             NC2094.2 189
   000663         066700     IF       DICK      OF C-STACK          EQUAL TO "VVVV"       NC2094.2 79 75
   000664      1  066800              PERFORM PASS                                        NC2094.2 292
   000665      1  066900              GO TO MOV-WRITE-F2-4-2.                             NC2094.2 674
   000666         067000     GO       TO MOV-FAIL-F2-4-2.                                 NC2094.2 670
   000667         067100 MOV-DELETE-F2-4-2.                                               NC2094.2
   000668         067200     PERFORM  DE-LETE.                                            NC2094.2 294
   000669         067300     GO       TO MOV-WRITE-F2-4-2.                                NC2094.2 674
   000670         067400 MOV-FAIL-F2-4-2.                                                 NC2094.2
   000671         067500     PERFORM  FAIL.                                               NC2094.2 293
   000672         067600     MOVE     DICK    OF C-STACK      TO COMPUTED-A.              NC2094.2 79 75 153
   000673         067700     MOVE     "VVVV"  TO CORRECT-A.                               NC2094.2 167
   000674         067800 MOV-WRITE-F2-4-2.                                                NC2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000675         067900     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000676         068000*                                                                 NC2094.2
   000677         068100 MOV-TEST-F2-4-3.                                                 NC2094.2
   000678         068200     ADD 1 TO REC-CT.                                             NC2094.2 189
   000679         068300     IF       HARRY     OF C-STACK          EQUAL TO "HARRY"      NC2094.2 80 75
   000680      1  068400              PERFORM PASS                                        NC2094.2 292
   000681      1  068500              GO TO MOV-WRITE-F2-4-3.                             NC2094.2 690
   000682         068600     GO       TO MOV-FAIL-F2-4-3.                                 NC2094.2 686
   000683         068700 MOV-DELETE-F2-4-3.                                               NC2094.2
   000684         068800     PERFORM  DE-LETE.                                            NC2094.2 294
   000685         068900     GO       TO MOV-WRITE-F2-4-3.                                NC2094.2 690
   000686         069000 MOV-FAIL-F2-4-3.                                                 NC2094.2
   000687         069100     PERFORM  FAIL.                                               NC2094.2 293
   000688         069200     MOVE     HARRY   OF C-STACK      TO COMPUTED-A.              NC2094.2 80 75 153
   000689         069300     MOVE     "HARRY" TO CORRECT-A.                               NC2094.2 167
   000690         069400 MOV-WRITE-F2-4-3.                                                NC2094.2
   000691         069500     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000692         069600*                                                                 NC2094.2
   000693         069700 MOV-INIT-F2-5.                                                   NC2094.2
   000694         069800     MOVE     "MOV-TEST-F2-5" TO PAR-NAME.                        NC2094.2 142
   000695         069900     MOVE     "VI-102 6.18.4 GR1" TO ANSI-REFERENCE.              NC2094.2 198
   000696         070000     MOVE     "  WITH RENAMES      " TO FEATURE.                  NC2094.2 138
   000697         070100     MOVE     CORRESPONDING A-LEVEL TO A-GLOB.                    NC2094.2 38 81
   000698         070200     MOVE     1 TO REC-CT.                                        NC2094.2 189
   000699         070300*        NOTE TOM, DICK, JOE, AND AL SHOULD BE MOVED.             NC2094.2
   000700         070400*                                                                 NC2094.2
   000701         070500 MOV-TEST-F2-5-1.                                                 NC2094.2
   000702         070600     IF       TOM       OF A-GLOB           EQUAL TO "TOM"        NC2094.2 85 81
   000703      1  070700              PERFORM PASS                                        NC2094.2 292
   000704      1  070800              GO TO MOV-WRITE-F2-5-1.                             NC2094.2 713
   000705         070900     GO       TO MOV-FAIL-F2-5-1.                                 NC2094.2 709
   000706         071000 MOV-DELETE-F2-5-1.                                               NC2094.2
   000707         071100     PERFORM  DE-LETE.                                            NC2094.2 294
   000708         071200     GO       TO MOV-WRITE-F2-5-1.                                NC2094.2 713
   000709         071300 MOV-FAIL-F2-5-1.                                                 NC2094.2
   000710         071400     PERFORM  FAIL.                                               NC2094.2 293
   000711         071500     MOVE     TOM     OF A-GLOB       TO COMPUTED-A.              NC2094.2 85 81 153
   000712         071600     MOVE     "TOM"   TO CORRECT-A.                               NC2094.2 167
   000713         071700 MOV-WRITE-F2-5-1.                                                NC2094.2
   000714         071800     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000715         071900*                                                                 NC2094.2
   000716         072000 MOV-TEST-F2-5-2.                                                 NC2094.2
   000717         072100     ADD 1 TO REC-CT.                                             NC2094.2 189
   000718         072200     IF       DICK      OF A-GLOB           EQUAL TO "DICK"       NC2094.2 86 81
   000719      1  072300              PERFORM PASS                                        NC2094.2 292
   000720      1  072400              GO TO MOV-WRITE-F2-5-2.                             NC2094.2 729
   000721         072500     GO       TO MOV-FAIL-F2-5-2.                                 NC2094.2 725
   000722         072600 MOV-DELETE-F2-5-2.                                               NC2094.2
   000723         072700     PERFORM  DE-LETE.                                            NC2094.2 294
   000724         072800     GO       TO MOV-WRITE-F2-5-2.                                NC2094.2 729
   000725         072900 MOV-FAIL-F2-5-2.                                                 NC2094.2
   000726         073000     PERFORM  FAIL.                                               NC2094.2 293
   000727         073100     MOVE     DICK    OF A-GLOB       TO COMPUTED-A.              NC2094.2 86 81 153
   000728         073200     MOVE     "DICK"  TO CORRECT-A.                               NC2094.2 167
   000729         073300 MOV-WRITE-F2-5-2.                                                NC2094.2
   000730         073400     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000731         073500*                                                                 NC2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000732         073600 MOV-TEST-F2-5-3.                                                 NC2094.2
   000733         073700     ADD 1 TO REC-CT.                                             NC2094.2 189
   000734         073800     IF       HARRY     OF A-GLOB           EQUAL TO "UUUUU"      NC2094.2 96 81
   000735      1  073900              PERFORM PASS                                        NC2094.2 292
   000736      1  074000              GO TO MOV-WRITE-F2-5-3.                             NC2094.2 745
   000737         074100     GO       TO MOV-FAIL-F2-5-3.                                 NC2094.2 741
   000738         074200 MOV-DELETE-F2-5-3.                                               NC2094.2
   000739         074300     PERFORM  DE-LETE.                                            NC2094.2 294
   000740         074400     GO       TO MOV-WRITE-F2-5-3.                                NC2094.2 745
   000741         074500 MOV-FAIL-F2-5-3.                                                 NC2094.2
   000742         074600     PERFORM  FAIL.                                               NC2094.2 293
   000743         074700     MOVE     HARRY   OF A-GLOB       TO COMPUTED-A.              NC2094.2 96 81 153
   000744         074800     MOVE     "UUUUU" TO CORRECT-A.                               NC2094.2 167
   000745         074900 MOV-WRITE-F2-5-3.                                                NC2094.2
   000746         075000     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000747         075100*                                                                 NC2094.2
   000748         075200 MOV-TEST-F2-5-4.                                                 NC2094.2
   000749         075300     ADD 1 TO REC-CT.                                             NC2094.2 189
   000750         075400     IF       JOE       OF A-GLOB           EQUAL TO "JOE"        NC2094.2 91 81
   000751      1  075500              PERFORM PASS                                        NC2094.2 292
   000752      1  075600              GO TO MOV-WRITE-F2-5-4.                             NC2094.2 761
   000753         075700     GO       TO MOV-FAIL-F2-5-4.                                 NC2094.2 757
   000754         075800 MOV-DELETE-F2-5-4.                                               NC2094.2
   000755         075900     PERFORM  DE-LETE.                                            NC2094.2 294
   000756         076000     GO       TO MOV-WRITE-F2-5-4.                                NC2094.2 761
   000757         076100 MOV-FAIL-F2-5-4.                                                 NC2094.2
   000758         076200     PERFORM  FAIL.                                               NC2094.2 293
   000759         076300     MOVE     JOE     OF A-GLOB       TO COMPUTED-A.              NC2094.2 91 81 153
   000760         076400     MOVE     "JOE"   TO CORRECT-A.                               NC2094.2 167
   000761         076500 MOV-WRITE-F2-5-4.                                                NC2094.2
   000762         076600     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000763         076700*                                                                 NC2094.2
   000764         076800 MOV-TEST-F2-5-5.                                                 NC2094.2
   000765         076900     ADD 1 TO REC-CT.                                             NC2094.2 189
   000766         077000     IF       AL        OF A-GLOB           EQUAL TO "AL"         NC2094.2 92 81
   000767      1  077100              PERFORM PASS                                        NC2094.2 292
   000768      1  077200              GO TO MOV-WRITE-F2-5-5.                             NC2094.2 777
   000769         077300     GO       TO MOV-FAIL-F2-5-5.                                 NC2094.2 773
   000770         077400 MOV-DELETE-F2-5-5.                                               NC2094.2
   000771         077500     PERFORM  DE-LETE.                                            NC2094.2 294
   000772         077600     GO       TO MOV-WRITE-F2-5-5.                                NC2094.2 777
   000773         077700 MOV-FAIL-F2-5-5.                                                 NC2094.2
   000774         077800     PERFORM  FAIL.                                               NC2094.2 293
   000775         077900     MOVE     AL      OF A-GLOB       TO COMPUTED-A.              NC2094.2 92 81 153
   000776         078000     MOVE     "AL"    TO CORRECT-A.                               NC2094.2 167
   000777         078100 MOV-WRITE-F2-5-5.                                                NC2094.2
   000778         078200     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000779         078300*                                                                 NC2094.2
   000780         078400 MOV-TEST-F2-5-6.                                                 NC2094.2
   000781         078500     ADD 1 TO REC-CT.                                             NC2094.2 189
   000782         078600     IF       BOB       OF A-GLOB           EQUAL TO "UUU"        NC2094.2 94 81
   000783      1  078700              PERFORM PASS                                        NC2094.2 292
   000784      1  078800              GO TO MOV-WRITE-F2-5-6.                             NC2094.2 793
   000785         078900     GO       TO MOV-FAIL-F2-5-6.                                 NC2094.2 789
   000786         079000 MOV-DELETE-F2-5-6.                                               NC2094.2
   000787         079100     PERFORM  DE-LETE.                                            NC2094.2 294
   000788         079200     GO       TO MOV-WRITE-F2-5-6.                                NC2094.2 793
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000789         079300 MOV-FAIL-F2-5-6.                                                 NC2094.2
   000790         079400     PERFORM  FAIL.                                               NC2094.2 293
   000791         079500     MOVE     BOB     OF A-GLOB       TO COMPUTED-A.              NC2094.2 94 81 153
   000792         079600     MOVE     "UUU"   TO CORRECT-A.                               NC2094.2 167
   000793         079700 MOV-WRITE-F2-5-6.                                                NC2094.2
   000794         079800     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000795         079900*                                                                 NC2094.2
   000796         080000 MOV-INIT-F2-6.                                                   NC2094.2
   000797         080100     MOVE     "MOV-TEST-F2-6" TO PAR-NAME.                        NC2094.2 142
   000798         080200     MOVE     "VI-102 6.18.4 GR1" TO ANSI-REFERENCE.              NC2094.2 198
   000799         080300     MOVE     "  WITH REDEF, OCCURS" TO FEATURE.                  NC2094.2 138
   000800         080400     MOVE     D-LEVEL IN C-COLLECTION TO WORK-AREA.               NC2094.2 100 99 110
   000801         080500     MOVE     "TTTTTTTTTTTTTTT" TO C-COLLECTION                   NC2094.2 99
   000802         080600     MOVE     1 TO REC-CT.                                        NC2094.2 189
   000803         080700     MOVE     CORRESPONDING C-LEVEL IN A-LEVEL TO C-COLLECTION.   NC2094.2 40 38 99

 ==000803==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "TOM" within
                         "C-COLLECTION" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "TOM" was ignored.

 ==000803==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "DD-LEVEL" within
                         "C-COLLECTION" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "DD-LEVEL" was ignored.

   000804         080800*        NOTE DICK AND JOE SHOULD BE MOVED.                       NC2094.2
   000805         080900*                                                                 NC2094.2
   000806         081000 MOV-TEST-F2-6-1.                                                 NC2094.2
   000807         081100     MOVE     D-LEVEL IN C-COLLECTION TO WORK-AREA.               NC2094.2 100 99 110
   000808         081200     IF       WORK-TOM EQUAL TO "TTT"                             NC2094.2 111
   000809      1  081300              PERFORM PASS                                        NC2094.2 292
   000810      1  081400              GO TO MOV-WRITE-F2-6-1.                             NC2094.2 819
   000811         081500     GO       TO MOV-FAIL-F2-6-1.                                 NC2094.2 815
   000812         081600 MOV-DELETE-F2-6-1.                                               NC2094.2
   000813         081700     PERFORM  DE-LETE.                                            NC2094.2 294
   000814         081800     GO       TO MOV-WRITE-F2-6-1.                                NC2094.2 819
   000815         081900 MOV-FAIL-F2-6-1.                                                 NC2094.2
   000816         082000     PERFORM  FAIL.                                               NC2094.2 293
   000817         082100     MOVE     D-LEVEL OF A-COLLECTION TO COMPUTED-A.              NC2094.2 100 97 153
   000818         082200     MOVE     "TTT"   TO CORRECT-A.                               NC2094.2 167
   000819         082300 MOV-WRITE-F2-6-1.                                                NC2094.2
   000820         082400     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000821         082500*                                                                 NC2094.2
   000822         082600 MOV-TEST-F2-6-2.                                                 NC2094.2
   000823         082700     ADD 1 TO REC-CT.                                             NC2094.2 189
   000824         082800     IF       DICK OF A-COLLECTION EQUAL TO "DICK"                NC2094.2 102 97
   000825      1  082900              PERFORM PASS                                        NC2094.2 292
   000826      1  083000              GO TO MOV-WRITE-F2-6-2.                             NC2094.2 835
   000827         083100     GO       TO MOV-FAIL-F2-6-2.                                 NC2094.2 831
   000828         083200 MOV-DELETE-F2-6-2.                                               NC2094.2
   000829         083300     PERFORM  DE-LETE.                                            NC2094.2 294
   000830         083400     GO       TO MOV-WRITE-F2-6-2.                                NC2094.2 835
   000831         083500 MOV-FAIL-F2-6-2.                                                 NC2094.2
   000832         083600     PERFORM  FAIL.                                               NC2094.2 293
   000833         083700     MOVE     DICK    OF A-COLLECTION TO COMPUTED-A.              NC2094.2 102 97 153
   000834         083800     MOVE     "DICK"  TO CORRECT-A.                               NC2094.2 167
   000835         083900 MOV-WRITE-F2-6-2.                                                NC2094.2
   000836         084000     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000837         084100*                                                                 NC2094.2
   000838         084200 MOV-TEST-F2-6-3.                                                 NC2094.2
   000839         084300     ADD 1 TO REC-CT.                                             NC2094.2 189
   000840         084400     IF       HARRY OF A-COLLECTION EQUAL TO "TTTTT"              NC2094.2 106 97
   000841      1  084500              PERFORM PASS                                        NC2094.2 292
   000842      1  084600              GO TO MOV-WRITE-F2-6-3.                             NC2094.2 851
   000843         084700     GO       TO MOV-FAIL-F2-6-3.                                 NC2094.2 847
   000844         084800 MOV-DELETE-F2-6-3.                                               NC2094.2
   000845         084900     PERFORM  DE-LETE.                                            NC2094.2 294
   000846         085000     GO       TO MOV-WRITE-F2-6-3.                                NC2094.2 851
   000847         085100 MOV-FAIL-F2-6-3.                                                 NC2094.2
   000848         085200     PERFORM  FAIL.                                               NC2094.2 293
   000849         085300     MOVE     HARRY   OF A-COLLECTION TO COMPUTED-A.              NC2094.2 106 97 153
   000850         085400     MOVE     "TTTTT" TO CORRECT-A.                               NC2094.2 167
   000851         085500 MOV-WRITE-F2-6-3.                                                NC2094.2
   000852         085600     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000853         085700*                                                                 NC2094.2
   000854         085800 MOV-TEST-F2-6-4.                                                 NC2094.2
   000855         085900     ADD 1 TO REC-CT.                                             NC2094.2 189
   000856         086000     IF       JOE       OF A-COLLECTION     EQUAL TO "JOE"        NC2094.2 108 97
   000857      1  086100              PERFORM PASS                                        NC2094.2 292
   000858      1  086200              GO TO MOV-WRITE-F2-6-4.                             NC2094.2 867
   000859         086300     GO       TO MOV-FAIL-F2-6-4.                                 NC2094.2 863
   000860         086400 MOV-DELETE-F2-6-4.                                               NC2094.2
   000861         086500     PERFORM  DE-LETE.                                            NC2094.2 294
   000862         086600     GO       TO MOV-WRITE-F2-6-4.                                NC2094.2 867
   000863         086700 MOV-FAIL-F2-6-4.                                                 NC2094.2
   000864         086800     PERFORM  FAIL.                                               NC2094.2 293
   000865         086900     MOVE     JOE     OF A-COLLECTION TO COMPUTED-A.              NC2094.2 108 97 153
   000866         087000     MOVE     "JOE"   TO CORRECT-A.                               NC2094.2 167
   000867         087100 MOV-WRITE-F2-6-4.                                                NC2094.2
   000868         087200     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000869         087300*                                                                 NC2094.2
   000870         087400 MOV-INIT-F2-7.                                                   NC2094.2
   000871         087500     MOVE     "MOV-TEST-F2-7" TO PAR-NAME.                        NC2094.2 142
   000872         087600     MOVE     "VI-102 6.18.4 GR1" TO ANSI-REFERENCE.              NC2094.2 198
   000873         087700     MOVE     CORRESPONDING C-LEVEL IN A-LEVEL TO C-FLOCK (4).    NC2094.2 40 38 122
   000874         087800     MOVE     1 TO REC-CT.                                        NC2094.2 189
   000875         087900*        NOTE TOM, DICK, HARRY, AND JOE SHOULD BE MOVED.          NC2094.2
   000876         088000 MOV-TEST-F2-7-1.                                                 NC2094.2
   000877         088100     IF       TOMMY     OF A-COVEY          EQUAL TO "TOM"        NC2094.2 116 113
   000878      1  088200              PERFORM PASS                                        NC2094.2 292
   000879      1  088300              GO TO MOV-WRITE-F2-7-1.                             NC2094.2 888
   000880         088400     GO       TO MOV-FAIL-F2-7-1.                                 NC2094.2 884
   000881         088500 MOV-DELETE-F2-7-1.                                               NC2094.2
   000882         088600     PERFORM  DE-LETE.                                            NC2094.2 294
   000883         088700     GO       TO MOV-WRITE-F2-7-1.                                NC2094.2 888
   000884         088800 MOV-FAIL-F2-7-1.                                                 NC2094.2
   000885         088900     PERFORM  FAIL.                                               NC2094.2 293
   000886         089000     MOVE     TOMMY   OF A-COVEY      TO COMPUTED-A.              NC2094.2 116 113 153
   000887         089100     MOVE     "TOM"   TO CORRECT-A.                               NC2094.2 167
   000888         089200 MOV-WRITE-F2-7-1.                                                NC2094.2
   000889         089300     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000890         089400*                                                                 NC2094.2
   000891         089500 MOV-TEST-F2-7-2.                                                 NC2094.2
   000892         089600     ADD 1 TO REC-CT.                                             NC2094.2 189
   000893         089700     IF       DICKY     OF A-COVEY          EQUAL TO "DICK"       NC2094.2 117 113
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000894      1  089800              PERFORM PASS                                        NC2094.2 292
   000895      1  089900              GO TO MOV-WRITE-F2-7-2.                             NC2094.2 904
   000896         090000     GO       TO MOV-FAIL-F2-7-2.                                 NC2094.2 900
   000897         090100 MOV-DELETE-F2-7-2.                                               NC2094.2
   000898         090200     PERFORM  DE-LETE.                                            NC2094.2 294
   000899         090300     GO       TO MOV-WRITE-F2-7-2.                                NC2094.2 904
   000900         090400 MOV-FAIL-F2-7-2.                                                 NC2094.2
   000901         090500     PERFORM  FAIL.                                               NC2094.2 293
   000902         090600     MOVE     DICKY   OF A-COVEY      TO COMPUTED-A.              NC2094.2 117 113 153
   000903         090700     MOVE     "DICK"  TO CORRECT-A.                               NC2094.2 167
   000904         090800 MOV-WRITE-F2-7-2.                                                NC2094.2
   000905         090900     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000906         091000*                                                                 NC2094.2
   000907         091100 MOV-TEST-F2-7-3.                                                 NC2094.2
   000908         091200     ADD 1 TO REC-CT.                                             NC2094.2 189
   000909         091300     IF       JOEY      OF A-COVEY          EQUAL TO "JOE"        NC2094.2 118 113
   000910      1  091400              PERFORM PASS                                        NC2094.2 292
   000911      1  091500              GO TO MOV-WRITE-F2-7-3.                             NC2094.2 920
   000912         091600     GO       TO MOV-FAIL-F2-7-3.                                 NC2094.2 916
   000913         091700 MOV-DELETE-F2-7-3.                                               NC2094.2
   000914         091800     PERFORM  DE-LETE.                                            NC2094.2 294
   000915         091900     GO       TO MOV-WRITE-F2-7-3.                                NC2094.2 920
   000916         092000 MOV-FAIL-F2-7-3.                                                 NC2094.2
   000917         092100     PERFORM  FAIL.                                               NC2094.2 293
   000918         092200     MOVE     JOEY    OF A-COVEY      TO COMPUTED-A.              NC2094.2 118 113 153
   000919         092300     MOVE     "JOE"   TO CORRECT-A.                               NC2094.2 167
   000920         092400 MOV-WRITE-F2-7-3.                                                NC2094.2
   000921         092500     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000922         092600*                                                                 NC2094.2
   000923         092700 MOV-TEST-F2-7-4.                                                 NC2094.2
   000924         092800     ADD 1 TO REC-CT.                                             NC2094.2 189
   000925         092900     IF       HAROLD    OF A-COVEY          EQUAL TO "HARRY"      NC2094.2 119 113
   000926      1  093000              PERFORM PASS                                        NC2094.2 292
   000927      1  093100              GO TO MOV-WRITE-F2-7-4.                             NC2094.2 936
   000928         093200     GO       TO MOV-FAIL-F2-7-4.                                 NC2094.2 932
   000929         093300 MOV-DELETE-F2-7-4.                                               NC2094.2
   000930         093400     PERFORM  DE-LETE.                                            NC2094.2 294
   000931         093500     GO       TO MOV-WRITE-F2-7-4.                                NC2094.2 936
   000932         093600 MOV-FAIL-F2-7-4.                                                 NC2094.2
   000933         093700     PERFORM  FAIL.                                               NC2094.2 293
   000934         093800     MOVE     HAROLD  OF A-COVEY      TO COMPUTED-A.              NC2094.2 119 113 153
   000935         093900     MOVE     "HARRY" TO CORRECT-A.                               NC2094.2 167
   000936         094000 MOV-WRITE-F2-7-4.                                                NC2094.2
   000937         094100     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000938         094200*                                                                 NC2094.2
   000939         094300 MOV-INIT-F2-8.                                                   NC2094.2
   000940         094400     MOVE     "MOV-TEST-F2-8" TO PAR-NAME.                        NC2094.2 142
   000941         094500     MOVE     CORRESPONDING BB-LEVEL TO BB-MOB (1).               NC2094.2 49 134
   000942         094600     MOVE     "VI-102 6.18.4 GR1" TO ANSI-REFERENCE.              NC2094.2 198
   000943         094700     MOVE     0 TO REC-CT.                                        NC2094.2 189
   000944         094800*        NOTE BOB SHOULD BE MOVED.                                NC2094.2
   000945         094900 MOV-TEST-F2-8.                                                   NC2094.2
   000946         095000     IF       BOBBY     OF A-CROWD          EQUAL TO "BOB"        NC2094.2 132 130
   000947      1  095100              PERFORM PASS                                        NC2094.2 292
   000948      1  095200              GO TO MOV-WRITE-F2-8.                               NC2094.2 957
   000949         095300     GO       TO MOV-FAIL-F2-8.                                   NC2094.2 953
   000950         095400 MOV-DELETE-F2-8.                                                 NC2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000951         095500     PERFORM  DE-LETE.                                            NC2094.2 294
   000952         095600     GO       TO MOV-WRITE-F2-8.                                  NC2094.2 957
   000953         095700 MOV-FAIL-F2-8.                                                   NC2094.2
   000954         095800     PERFORM  FAIL.                                               NC2094.2 293
   000955         095900     MOVE     BOBBY   OF A-CROWD      TO COMPUTED-A.              NC2094.2 132 130 153
   000956         096000     MOVE     "BOB"   TO CORRECT-A.                               NC2094.2 167
   000957         096100 MOV-WRITE-F2-8.                                                  NC2094.2
   000958         096200     PERFORM  PRINT-DETAIL.                                       NC2094.2 296
   000959         096300*                                                                 NC2094.2
   000960         096400 CCVS-EXIT SECTION.                                               NC2094.2
   000961         096500 CCVS-999999.                                                     NC2094.2
   000962         096600     GO TO CLOSE-FILES.                                           NC2094.2 285
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    21
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       61   A-BUNCH. . . . . . . . . . . .  M470 474 483 490 499 506 515 522 531 538 547 554 563
       97   A-COLLECTION . . . . . . . . .  817 824 833 840 849 856 865
      113   A-COVEY. . . . . . . . . . . .  120 877 886 893 902 909 918 925 934
      130   A-CROWD. . . . . . . . . . . .  946 955
      120   A-FLOCK
       81   A-GLOB . . . . . . . . . . . .  95 95 M697 702 711 718 727 734 743 750 759 766 775 782 791
       51   A-GROUP. . . . . . . . . . . .  405 414 421 430 437 446 453 462
       38   A-LEVEL. . . . . . . . . . . .  400 470 571 643 697 803 873
       68   A-SET. . . . . . . . . . . . .  578 587 594 603 610 619 626 635
       48   AL . . . . . . . . . . . . . .  470 697
       66   AL . . . . . . . . . . . . . .  M470 538 547
       92   AL . . . . . . . . . . . . . .  95 M697 766 775
       95   AL-BOB
      198   ANSI-REFERENCE . . . . . . . .  370 377 386 M396 M469 M570 M642 M695 M798 M872 M942
       98   B-COLLECTION
      115   B-COVEY
      121   B-FLOCK
       52   B-GROUP. . . . . . . . . . . .  M400
       39   B-LEVEL. . . . . . . . . . . .  400 571
       82   B-LEVEL
       69   B-SET. . . . . . . . . . . . .  M571
      131   BB-CROWD . . . . . . . . . . .  134
       49   BB-LEVEL . . . . . . . . . . .  941
       93   BB-LEVEL-FALSE
      134   BB-MOB . . . . . . . . . . . .  M941
       50   BOB. . . . . . . . . . . . . .  941
       67   BOB. . . . . . . . . . . . . .  554 563
       74   BOB. . . . . . . . . . . . . .  626 635
       94   BOB. . . . . . . . . . . . . .  95 782 791
      135   BOB. . . . . . . . . . . . . .  M941
      132   BOBBY. . . . . . . . . . . . .  946 955
       99   C-COLLECTION . . . . . . . . .  800 M801 M803 807
      122   C-FLOCK. . . . . . . . . . . .  M873
       40   C-LEVEL. . . . . . . . . . . .  643 803 873
       53   C-LEVEL
       83   C-LEVEL
       75   C-STACK. . . . . . . . . . . .  M643 647 656 663 672 679 688
      177   CCVS-C-1 . . . . . . . . . . .  314 356
      182   CCVS-C-2 . . . . . . . . . . .  315 357
      232   CCVS-E-1 . . . . . . . . . . .  320
      237   CCVS-E-2 . . . . . . . . . . .  329 336 343 348
      240   CCVS-E-2-2 . . . . . . . . . .  M328
      245   CCVS-E-3 . . . . . . . . . . .  349
      254   CCVS-E-4 . . . . . . . . . . .  328
      255   CCVS-E-4-1 . . . . . . . . . .  M326
      257   CCVS-E-4-2 . . . . . . . . . .  M327
      199   CCVS-H-1 . . . . . . . . . . .  309
      204   CCVS-H-2A. . . . . . . . . . .  310
      213   CCVS-H-2B. . . . . . . . . . .  311
      225   CCVS-H-3 . . . . . . . . . . .  312
      275   CCVS-PGM-ID. . . . . . . . . .  281 281
      159   CM-18V0
      153   COMPUTED-A . . . . . . . . . .  154 156 157 158 159 382 385 M414 M430 M446 M462 M483 M499 M515 M531 M547 M563
                                            M587 M603 M619 M635 M656 M672 M688 M711 M727 M743 M759 M775 M791 M817 M833 M849
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    22
0 Defined   Cross-reference of data names   References

0                                           M865 M886 M902 M918 M934 M955
      154   COMPUTED-N
      152   COMPUTED-X . . . . . . . . . .  M304 368
      156   COMPUTED-0V18
      158   COMPUTED-14V4
      160   COMPUTED-18V0
      157   COMPUTED-4V14
      176   COR-ANSI-REFERENCE . . . . . .  M377 M379
      167   CORRECT-A. . . . . . . . . . .  168 169 170 171 172 383 385 M415 M431 M447 M463 M484 M500 M516 M532 M548 M564
                                            M588 M604 M620 M636 M657 M673 M689 M712 M728 M744 M760 M776 M792 M818 M834 M850
                                            M866 M887 M903 M919 M935 M956
      168   CORRECT-N
      166   CORRECT-X. . . . . . . . . . .  M305 369
      169   CORRECT-0V18
      171   CORRECT-14V4
      173   CORRECT-18V0
      170   CORRECT-4V14
      172   CR-18V0
       41   D-LEVEL
       54   D-LEVEL
       70   D-LEVEL
       76   D-LEVEL
       84   D-LEVEL
      100   D-LEVEL. . . . . . . . . . . .  800 807 817
      123   D-LEVEL
       44   DD-LEVEL
       78   DD-LEVEL
       87   DD-LEVEL
      105   DD-LEVEL
      128   DD-LEVEL
       57   DD-LEVEL-FALSE
      104   DD-LEVEL-FALSE . . . . . . . .  105
       46   DDD-LEVEL
       59   DDD-LEVEL
       90   DDD-LEVEL
      107   DDD-LEVEL
      126   DDD-LEVEL
      190   DELETE-COUNTER . . . . . . . .  M294 323 339 341
       43   DICK . . . . . . . . . . . . .  400 697 803 873
       56   DICK . . . . . . . . . . . . .  M400 421 430
       63   DICK . . . . . . . . . . . . .  490 499
       72   DICK . . . . . . . . . . . . .  594 603
       79   DICK . . . . . . . . . . . . .  663 672
       86   DICK . . . . . . . . . . . . .  M697 718 727
      102   DICK . . . . . . . . . . . . .  M803 824 833
      125   DICK . . . . . . . . . . . . .  M873
      117   DICKY. . . . . . . . . . . . .  893 902
      145   DOTVALUE . . . . . . . . . . .  M299
      196   DUMMY-HOLD . . . . . . . . . .  M353 359
       36   DUMMY-RECORD . . . . . . . . .  M309 M310 M311 M312 M314 M315 M316 M318 M320 M329 M336 M343 M348 M349 353 M354
                                            355 M356 M357 M358 M359 363 M364 M372 M387
      243   ENDER-DESC . . . . . . . . . .  M331 M342 M347
      191   ERROR-COUNTER. . . . . . . . .  M293 322 332 335
      195   ERROR-HOLD . . . . . . . . . .  M322 M323 M323 M324 327
      241   ERROR-TOTAL. . . . . . . . . .  M333 M335 M340 M341 M345 M346
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    23
0 Defined   Cross-reference of data names   References

0     138   FEATURE. . . . . . . . . . . .  M397 M399 M696 M799
      119   HAROLD . . . . . . . . . . . .  925 934
       45   HARRY. . . . . . . . . . . . .  643 873
       58   HARRY. . . . . . . . . . . . .  437 446
       64   HARRY. . . . . . . . . . . . .  506 515
       73   HARRY. . . . . . . . . . . . .  610 619
       80   HARRY. . . . . . . . . . . . .  M643 679 688
       96   HARRY. . . . . . . . . . . . .  734 743
      106   HARRY. . . . . . . . . . . . .  840 849
      129   HARRY. . . . . . . . . . . . .  M873
       88   HARRY-A. . . . . . . . . . . .  96
       89   HARRY-B. . . . . . . . . . . .  96
      269   HYPHEN-LINE. . . . . . . . . .  316 318 358
      235   ID-AGAIN . . . . . . . . . . .  M281
      268   INF-ANSI-REFERENCE . . . . . .  M370 M373 M386 M388
      263   INFO-TEXT. . . . . . . . . . .  M371
      192   INSPECT-COUNTER. . . . . . . .  M291 322 344 346
       47   JOE. . . . . . . . . . . . . .  400 697 803 873
       60   JOE. . . . . . . . . . . . . .  M400 453 462
       65   JOE. . . . . . . . . . . . . .  522 531
       91   JOE. . . . . . . . . . . . . .  M697 750 759
      108   JOE. . . . . . . . . . . . . .  109 M803 856 865
      127   JOE. . . . . . . . . . . . . .  M873
      118   JOEY . . . . . . . . . . . . .  909 918
      109   JOSEPH
      140   P-OR-F . . . . . . . . . . . .  M291 M292 M293 M294 301 M304
      142   PAR-NAME . . . . . . . . . . .  M306 M395 M468 M569 M641 M694 M797 M871 M940
      144   PARDOT-X . . . . . . . . . . .  M298
      193   PASS-COUNTER . . . . . . . . .  M292 324 326
       34   PRINT-FILE . . . . . . . . . .  30 280 286
       35   PRINT-REC. . . . . . . . . . .  M300 M376 M378
      147   RE-MARK. . . . . . . . . . . .  M295 M307
      189   REC-CT . . . . . . . . . . . .  297 299 306 M401 M420 M436 M452 M471 M489 M505 M521 M537 M553 M572 M577 M593
                                            M609 M625 M644 M662 M678 M698 M717 M733 M749 M765 M781 M802 M823 M839 M855 M874
                                            M892 M908 M924 M943
      188   REC-SKL-SUB
      197   RECORD-COUNT . . . . . . . . .  M351 352 M360
      103   RICHARD
      148   TEST-COMPUTED. . . . . . . . .  376
      163   TEST-CORRECT . . . . . . . . .  378
      216   TEST-ID. . . . . . . . . . . .  M281
      136   TEST-RESULTS . . . . . . . . .  M282 300
       42   TOM. . . . . . . . . . . . . .  400 643 697 873
       55   TOM. . . . . . . . . . . . . .  M400 405 414
       62   TOM. . . . . . . . . . . . . .  474 483
       71   TOM. . . . . . . . . . . . . .  578 587
       77   TOM. . . . . . . . . . . . . .  M643 647 656
       85   TOM. . . . . . . . . . . . . .  M697 702 711
      101   TOM
      124   TOM. . . . . . . . . . . . . .  M873
      116   TOMMY. . . . . . . . . . . . .  877 886
      194   TOTAL-ERROR
      110   WORK-AREA. . . . . . . . . . .  M800 M807
      111   WORK-TOM . . . . . . . . . . .  808
      265   XXCOMPUTED . . . . . . . . . .  M385
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    24
0 Defined   Cross-reference of data names   References

0     267   XXCORRECT. . . . . . . . . . .  M385
      260   XXINFO . . . . . . . . . . . .  372 387
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    25
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

      381   BAIL-OUT . . . . . . . . . . .  P303
      389   BAIL-OUT-EX. . . . . . . . . .  E303 G383
      384   BAIL-OUT-WRITE . . . . . . . .  G382
      365   BLANK-LINE-PRINT
      960   CCVS-EXIT
      961   CCVS-999999
      278   CCVS1
      390   CCVS1-EXIT . . . . . . . . . .  G284
      285   CLOSE-FILES. . . . . . . . . .  G962
      313   COLUMN-NAMES-ROUTINE . . . . .  E283
      294   DE-LETE. . . . . . . . . . . .  P410 P426 P442 P458 P479 P495 P511 P527 P543 P559 P583 P599 P615 P631 P652 P668
                                            P684 P707 P723 P739 P755 P771 P787 P813 P829 P845 P861 P882 P898 P914 P930 P951
      317   END-ROUTINE. . . . . . . . . .  P286
      321   END-ROUTINE-1
      330   END-ROUTINE-12
      338   END-ROUTINE-13 . . . . . . . .  E286
      319   END-RTN-EXIT
      293   FAIL . . . . . . . . . . . . .  P413 P429 P445 P461 P482 P498 P514 P530 P546 P562 P586 P602 P618 P634 P655 P671
                                            P687 P710 P726 P742 P758 P774 P790 P816 P832 P848 P864 P885 P901 P917 P933 P954
      367   FAIL-ROUTINE . . . . . . . . .  P302
      380   FAIL-ROUTINE-EX. . . . . . . .  E302 G374
      375   FAIL-ROUTINE-WRITE . . . . . .  G368 G369
      308   HEAD-ROUTINE . . . . . . . . .  P283
      291   INSPT
      409   MOV-DELETE-F2-1-1
      425   MOV-DELETE-F2-1-2
      441   MOV-DELETE-F2-1-3
      457   MOV-DELETE-F2-1-4
      478   MOV-DELETE-F2-2-1
      494   MOV-DELETE-F2-2-2
      510   MOV-DELETE-F2-2-3
      526   MOV-DELETE-F2-2-4
      542   MOV-DELETE-F2-2-5
      558   MOV-DELETE-F2-2-6
      582   MOV-DELETE-F2-3-1
      598   MOV-DELETE-F2-3-2
      614   MOV-DELETE-F2-3-3
      630   MOV-DELETE-F2-3-4
      651   MOV-DELETE-F2-4-1
      667   MOV-DELETE-F2-4-2
      683   MOV-DELETE-F2-4-3
      706   MOV-DELETE-F2-5-1
      722   MOV-DELETE-F2-5-2
      738   MOV-DELETE-F2-5-3
      754   MOV-DELETE-F2-5-4
      770   MOV-DELETE-F2-5-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    26
0 Defined   Cross-reference of procedures   References

0     786   MOV-DELETE-F2-5-6
      812   MOV-DELETE-F2-6-1
      828   MOV-DELETE-F2-6-2
      844   MOV-DELETE-F2-6-3
      860   MOV-DELETE-F2-6-4
      881   MOV-DELETE-F2-7-1
      897   MOV-DELETE-F2-7-2
      913   MOV-DELETE-F2-7-3
      929   MOV-DELETE-F2-7-4
      950   MOV-DELETE-F2-8
      412   MOV-FAIL-F2-1-1. . . . . . . .  G408
      428   MOV-FAIL-F2-1-2. . . . . . . .  G424
      444   MOV-FAIL-F2-1-3. . . . . . . .  G440
      460   MOV-FAIL-F2-1-4. . . . . . . .  G456
      481   MOV-FAIL-F2-2-1. . . . . . . .  G477
      497   MOV-FAIL-F2-2-2. . . . . . . .  G493
      513   MOV-FAIL-F2-2-3. . . . . . . .  G509
      529   MOV-FAIL-F2-2-4. . . . . . . .  G525
      545   MOV-FAIL-F2-2-5. . . . . . . .  G541
      561   MOV-FAIL-F2-2-6. . . . . . . .  G557
      585   MOV-FAIL-F2-3-1. . . . . . . .  G581
      601   MOV-FAIL-F2-3-2. . . . . . . .  G597
      617   MOV-FAIL-F2-3-3. . . . . . . .  G613
      633   MOV-FAIL-F2-3-4. . . . . . . .  G629
      654   MOV-FAIL-F2-4-1. . . . . . . .  G650
      670   MOV-FAIL-F2-4-2. . . . . . . .  G666
      686   MOV-FAIL-F2-4-3. . . . . . . .  G682
      709   MOV-FAIL-F2-5-1. . . . . . . .  G705
      725   MOV-FAIL-F2-5-2. . . . . . . .  G721
      741   MOV-FAIL-F2-5-3. . . . . . . .  G737
      757   MOV-FAIL-F2-5-4. . . . . . . .  G753
      773   MOV-FAIL-F2-5-5. . . . . . . .  G769
      789   MOV-FAIL-F2-5-6. . . . . . . .  G785
      815   MOV-FAIL-F2-6-1. . . . . . . .  G811
      831   MOV-FAIL-F2-6-2. . . . . . . .  G827
      847   MOV-FAIL-F2-6-3. . . . . . . .  G843
      863   MOV-FAIL-F2-6-4. . . . . . . .  G859
      884   MOV-FAIL-F2-7-1. . . . . . . .  G880
      900   MOV-FAIL-F2-7-2. . . . . . . .  G896
      916   MOV-FAIL-F2-7-3. . . . . . . .  G912
      932   MOV-FAIL-F2-7-4. . . . . . . .  G928
      953   MOV-FAIL-F2-8. . . . . . . . .  G949
      394   MOV-INIT-F2-1
      467   MOV-INIT-F2-2
      568   MOV-INIT-F2-3
      640   MOV-INIT-F2-4
      693   MOV-INIT-F2-5
      796   MOV-INIT-F2-6
      870   MOV-INIT-F2-7
      939   MOV-INIT-F2-8
      404   MOV-TEST-F2-1-1
      419   MOV-TEST-F2-1-2
      435   MOV-TEST-F2-1-3
      451   MOV-TEST-F2-1-4
      473   MOV-TEST-F2-2-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    27
0 Defined   Cross-reference of procedures   References

0     488   MOV-TEST-F2-2-2
      504   MOV-TEST-F2-2-3
      520   MOV-TEST-F2-2-4
      536   MOV-TEST-F2-2-5
      552   MOV-TEST-F2-2-6
      576   MOV-TEST-F2-3-1
      592   MOV-TEST-F2-3-2
      608   MOV-TEST-F2-3-3
      624   MOV-TEST-F2-3-4
      646   MOV-TEST-F2-4-1
      661   MOV-TEST-F2-4-2
      677   MOV-TEST-F2-4-3
      701   MOV-TEST-F2-5-1
      716   MOV-TEST-F2-5-2
      732   MOV-TEST-F2-5-3
      748   MOV-TEST-F2-5-4
      764   MOV-TEST-F2-5-5
      780   MOV-TEST-F2-5-6
      806   MOV-TEST-F2-6-1
      822   MOV-TEST-F2-6-2
      838   MOV-TEST-F2-6-3
      854   MOV-TEST-F2-6-4
      876   MOV-TEST-F2-7-1
      891   MOV-TEST-F2-7-2
      907   MOV-TEST-F2-7-3
      923   MOV-TEST-F2-7-4
      945   MOV-TEST-F2-8
      416   MOV-WRITE-F2-1-1 . . . . . . .  G407 G411
      432   MOV-WRITE-F2-1-2 . . . . . . .  G423 G427
      448   MOV-WRITE-F2-1-3 . . . . . . .  G439 G443
      464   MOV-WRITE-F2-1-4 . . . . . . .  G455 G459
      485   MOV-WRITE-F2-2-1 . . . . . . .  G476 G480
      501   MOV-WRITE-F2-2-2 . . . . . . .  G492 G496
      517   MOV-WRITE-F2-2-3 . . . . . . .  G508 G512
      533   MOV-WRITE-F2-2-4 . . . . . . .  G524 G528
      549   MOV-WRITE-F2-2-5 . . . . . . .  G540 G544
      565   MOV-WRITE-F2-2-6 . . . . . . .  G556 G560
      589   MOV-WRITE-F2-3-1 . . . . . . .  G580 G584
      605   MOV-WRITE-F2-3-2 . . . . . . .  G596 G600
      621   MOV-WRITE-F2-3-3 . . . . . . .  G612 G616
      637   MOV-WRITE-F2-3-4 . . . . . . .  G628 G632
      658   MOV-WRITE-F2-4-1 . . . . . . .  G649 G653
      674   MOV-WRITE-F2-4-2 . . . . . . .  G665 G669
      690   MOV-WRITE-F2-4-3 . . . . . . .  G681 G685
      713   MOV-WRITE-F2-5-1 . . . . . . .  G704 G708
      729   MOV-WRITE-F2-5-2 . . . . . . .  G720 G724
      745   MOV-WRITE-F2-5-3 . . . . . . .  G736 G740
      761   MOV-WRITE-F2-5-4 . . . . . . .  G752 G756
      777   MOV-WRITE-F2-5-5 . . . . . . .  G768 G772
      793   MOV-WRITE-F2-5-6 . . . . . . .  G784 G788
      819   MOV-WRITE-F2-6-1 . . . . . . .  G810 G814
      835   MOV-WRITE-F2-6-2 . . . . . . .  G826 G830
      851   MOV-WRITE-F2-6-3 . . . . . . .  G842 G846
      867   MOV-WRITE-F2-6-4 . . . . . . .  G858 G862
      888   MOV-WRITE-F2-7-1 . . . . . . .  G879 G883
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    28
0 Defined   Cross-reference of procedures   References

0     904   MOV-WRITE-F2-7-2 . . . . . . .  G895 G899
      920   MOV-WRITE-F2-7-3 . . . . . . .  G911 G915
      936   MOV-WRITE-F2-7-4 . . . . . . .  G927 G931
      957   MOV-WRITE-F2-8 . . . . . . . .  G948 G952
      393   NC-209A-001
      279   OPEN-FILES
      292   PASS . . . . . . . . . . . . .  P406 P422 P438 P454 P475 P491 P507 P523 P539 P555 P579 P595 P611 P627 P648 P664
                                            P680 P703 P719 P735 P751 P767 P783 P809 P825 P841 P857 P878 P894 P910 P926 P947
      296   PRINT-DETAIL . . . . . . . . .  P398 P417 P433 P449 P465 P486 P502 P518 P534 P550 P566 P590 P606 P622 P638 P659
                                            P675 P691 P714 P730 P746 P762 P778 P794 P820 P836 P852 P868 P889 P905 P921 P937
                                            P958
      392   SECT-NC209A-001
      289   TERMINATE-CALL
      287   TERMINATE-CCVS
      350   WRITE-LINE . . . . . . . . . .  P300 P301 P309 P310 P311 P312 P314 P315 P316 P318 P320 P329 P337 P343 P348 P349
                                            P372 P376 P378 P387
      362   WRT-LN . . . . . . . . . . . .  P356 P357 P358 P361 P366
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    29
0 Defined   Cross-reference of programs     References

        3   NC209A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC209A    Date 06/04/2022  Time 11:58:56   Page    30
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    394  IGYPS2015-I   The paragraph or section prior to paragraph or section "MOV-INIT-F2-1" did not contain any statements.

    571  IGYPS2016-W   No "CORRESPONDING" operands were found.  The statement had no effect.

    803  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "TOM" within "C-COLLECTION" did not qualify according to
                       the rules for the "CORRESPONDING" phrase.  Subordinate item "TOM" was ignored.

    803  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "DD-LEVEL" within "C-COLLECTION" did not qualify according
                       to the rules for the "CORRESPONDING" phrase.  Subordinate item "DD-LEVEL" was ignored.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       5           2              3
-* Statistics for COBOL program NC209A:
 *    Source records = 962
 *    Data Division statements = 158
 *    Procedure Division statements = 513
 *    Generated COBOL statements = 0
 *    Program complexity factor = 531
0End of compilation 1,  program NC209A,  highest severity 4.
0Return code 4
