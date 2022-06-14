1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:33   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:33   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1164.2
   000002         000200 PROGRAM-ID.                                                      NC1164.2
   000003         000300     NC116A.                                                      NC1164.2
   000004         000500*                                                              *  NC1164.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1164.2
   000006         000700*                                                              *  NC1164.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1164.2
   000008         000900*                                                              *  NC1164.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1164.2
   000010         001100*                                                              *  NC1164.2
   000011         001300*                                                              *  NC1164.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1164.2
   000013         001500*                                                              *  NC1164.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1164.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1164.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1164.2
   000017         001900*                                                              *  NC1164.2
   000018         002100*                                                                 NC1164.2
   000019         002200*    PROGRAM NC116A TESTS THE USE OF THE SIGN CLAUSE              NC1164.2
   000020         002300*    USING THE "IF" AND "MOVE" STATEMENTS.  ALL COMBINATIONS      NC1164.2
   000021         002400*    OF THE SIGN CLAUSE PHRASES ARE TESTED USING DATA ITEMS OF    NC1164.2
   000022         002500*    VARIOUS LENGTHS.                                             NC1164.2
   000023         002600*                                                                 NC1164.2
   000024         002700 ENVIRONMENT DIVISION.                                            NC1164.2
   000025         002800 CONFIGURATION SECTION.                                           NC1164.2
   000026         002900 SOURCE-COMPUTER.                                                 NC1164.2
   000027         003000     XXXXX082.                                                    NC1164.2
   000028         003100 OBJECT-COMPUTER.                                                 NC1164.2
   000029         003200     XXXXX083.                                                    NC1164.2
   000030         003300 INPUT-OUTPUT SECTION.                                            NC1164.2
   000031         003400 FILE-CONTROL.                                                    NC1164.2
   000032         003500     SELECT PRINT-FILE ASSIGN TO                                  NC1164.2 36
   000033         003600     XXXXX055.                                                    NC1164.2
   000034         003700 DATA DIVISION.                                                   NC1164.2
   000035         003800 FILE SECTION.                                                    NC1164.2
   000036         003900 FD  PRINT-FILE.                                                  NC1164.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000 01  PRINT-REC PICTURE X(120).                                    NC1164.2
   000038         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC1164.2
   000039         004200 WORKING-STORAGE SECTION.                                         NC1164.2
   000040         004300*=======================                                          NC1164.2
   000041         004400 01  TEST-17-DATA  SIGN TRAILING.                                 NC1164.2
   000042         004500   03  TEST-17-A          PIC S9(4).                              NC1164.2
   000043         004600   03  TEST-17-B          PIC S9(4).                              NC1164.2
   000044         004700   03  TEST-17-GROUP SIGN LEADING SEPARATE.                       NC1164.2
   000045         004800     05  TEST-17-C        PIC S9(4).                              NC1164.2
   000046         004900     05  FILLER           REDEFINES TEST-17-C.                    NC1164.2 45
   000047         005000       07  TEST-17-C-SIGN PIC X.                                  NC1164.2
   000048         005100       07  FILLER         PIC X(4).                               NC1164.2
   000049         005200                                                                  NC1164.2
   000050         005300 01  TEST-18-DATA  SIGN TRAILING.                                 NC1164.2
   000051         005400   03  TEST-18-A          PIC S9(4).                              NC1164.2
   000052         005500   03  TEST-18-B          PIC S9(4)  SIGN LEADING SEPARATE.       NC1164.2
   000053         005600   03  TEST-18-BX         REDEFINES TEST-18-B.                    NC1164.2 52
   000054         005700     05  TEST-18-B-SIGN   PIC X.                                  NC1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     05  FILLER           PIC X(4).                               NC1164.2
   000056         005900   03  TEST-18-C          PIC S9(4).                              NC1164.2
   000057         006000 01  DS-LS-5  PICTURE S99999                                      NC1164.2
   000058         006100         SIGN IS LEADING SEPARATE CHARACTER                       NC1164.2
   000059         006200         VALUE +91275.                                            NC1164.2
   000060         006300 01  GRP-001 REDEFINES DS-LS-5.                                   NC1164.2 57
   000061         006400     02  TEST1-AN-1 PICTURE X.                                    NC1164.2
   000062         006500     02  TEST1-AN-5 PICTURE X(5).                                 NC1164.2
   000063         006600 01  DS-LS-4 PICTURE S9999                                        NC1164.2
   000064         006700         SIGN IS LEADING SEPARATE CHARACTER                       NC1164.2
   000065         006800         VALUE -9127.                                             NC1164.2
   000066         006900 01  GRP-002 REDEFINES DS-LS-4.                                   NC1164.2 63
   000067         007000     02  TEST1N-AN-1 PICTURE X.                                   NC1164.2
   000068         007100     02  TEST1N-AN-4 PICTURE X(4).                                NC1164.2
   000069         007200 01  DS-TS-5  PICTURE S99999                                      NC1164.2
   000070         007300         SIGN IS TRAILING SEPARATE CHARACTER                      NC1164.2
   000071         007400         VALUE +80361.                                            NC1164.2
   000072         007500 01  GRP-003 REDEFINES DS-TS-5.                                   NC1164.2 69
   000073         007600     02  TEST2-AN-5 PICTURE X(5).                                 NC1164.2
   000074         007700     02  TEST2-AN-1 PICTURE X.                                    NC1164.2
   000075         007800 01  DS-TS-4 PICTURE S9999                                        NC1164.2
   000076         007900         SIGN IS TRAILING SEPARATE CHARACTER                      NC1164.2
   000077         008000         VALUE -8036.                                             NC1164.2
   000078         008100 01  GRP-004 REDEFINES DS-TS-4.                                   NC1164.2 75
   000079         008200     02  TEST2N-AN-4 PICTURE X(4).                                NC1164.2
   000080         008300     02  TEST2N-AN-1 PICTURE X.                                   NC1164.2
   000081         008400 01  DS-L-5  PICTURE S99999  VALUE +91275                         NC1164.2
   000082         008500         SIGN IS LEADING.                                         NC1164.2
   000083         008600 01  GRP-005 REDEFINES DS-L-5.                                    NC1164.2 81
   000084         008700     02  TEST3-AN-1  PICTURE X.                                   NC1164.2
   000085         008800     02  TEST3-AN-4  PICTURE X(4).                                NC1164.2
   000086         008900 01  DS-L-4  PICTURE S9999   VALUE -9127                          NC1164.2
   000087         009000         SIGN IS LEADING.                                         NC1164.2
   000088         009100 01  GRP-006 REDEFINES DS-L-4.                                    NC1164.2 86
   000089         009200     02  TEST3N-AN-1 PICTURE X.                                   NC1164.2
   000090         009300     02  TEST3N-AN-3 PICTURE XXX.                                 NC1164.2
   000091         009400 01  DS-T-5  PICTURE S99999  VALUE +83621                         NC1164.2
   000092         009500         SIGN IS TRAILING.                                        NC1164.2
   000093         009600 01  GRP-007 REDEFINES DS-T-5.                                    NC1164.2 91
   000094         009700     02  TEST4-AN-4  PICTURE X(4).                                NC1164.2
   000095         009800     02  TEST4-AN-1  PICTURE X.                                   NC1164.2
   000096         009900 01  DS-T-4  PICTURE S9999   VALUE -3621                          NC1164.2
   000097         010000         SIGN IS TRAILING.                                        NC1164.2
   000098         010100 01  GRP-008 REDEFINES DS-T-4.                                    NC1164.2 96
   000099         010200     02  TEST4N-AN-3 PICTURE XXX.                                 NC1164.2
   000100         010300     02  TEST4N-AN-1 PICTURE X.                                   NC1164.2
   000101         010400 01  DU-005  PICTURE 9(5) VALUE ZERO.                             NC1164.2 IMP
   000102         010500 01  DS-005  PICTURE S9(5) VALUE 0.                               NC1164.2
   000103         010600 01  CU-005  PICTURE 9(5)  USAGE COMPUTATIONAL  VALUE 0.          NC1164.2
   000104         010700 01  CS-005  PICTURE S9(5)  USAGE COMPUTATIONAL  VALUE 0.         NC1164.2
   000105         010800 01  WRK-DS-LS-5 PICTURE S99999   VALUE ZERO                      NC1164.2 IMP
   000106         010900         SIGN LEADING SEPARATE.                                   NC1164.2
   000107         011000 01  GRP-09 REDEFINES WRK-DS-LS-5 PICTURE X(6).                   NC1164.2 105
   000108         011100 01  WRK-DS-TS-5 PICTURE S99999  VALUE ZERO                       NC1164.2 IMP
   000109         011200         SIGN TRAILING SEPARATE.                                  NC1164.2
   000110         011300 01  GRP-10 REDEFINES WRK-DS-TS-5 PICTURE X(6).                   NC1164.2 108
   000111         011400 01  WRK-DS-L-5 PICTURE S99999   VALUE ZERO                       NC1164.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500         SIGN LEADING.                                            NC1164.2
   000113         011600 01  WRK-DS-T-5 PICTURE S99999   VALUE ZERO                       NC1164.2 IMP
   000114         011700         SIGN TRAILING.                                           NC1164.2
   000115         011800 01  AN-006  PICTURE X(6) VALUE SPACE.                            NC1164.2 IMP
   000116         011900 01  DS-L-00008         PIC S9(8) SIGN LEADING VALUE +01234567.   NC1164.2
   000117         012000 01  AN-00008-X-1 REDEFINES DS-L-00008      PIC X(8).             NC1164.2 116
   000118         012100 01  DS-T-00008         PIC S9(8) SIGN TRAILING VALUE -01234567.  NC1164.2
   000119         012200 01  AN-00008-X-2 REDEFINES DS-T-00008      PIC X(8).             NC1164.2 118
   000120         012300 01  DS-T-00008-1       PIC S9(8) SIGN TRAILING VALUE +01234567.  NC1164.2
   000121         012400 01  AN-00008-X-5 REDEFINES DS-T-00008-1     PIC X(8).            NC1164.2 120
   000122         012500 01  DS-LS-00008        PIC S9(8)                                 NC1164.2
   000123         012600                        SIGN IS LEADING SEPARATE CHARACTER        NC1164.2
   000124         012700                        VALUE -07654321.                          NC1164.2
   000125         012800 01  AN-00009-X-3 REDEFINES DS-LS-00008     PIC X(9).             NC1164.2 122
   000126         012900 01  DS-LS-00008-1      PIC S9(8)                                 NC1164.2
   000127         013000                        SIGN IS LEADING SEPARATE CHARACTER        NC1164.2
   000128         013100                        VALUE +07654321.                          NC1164.2
   000129         013200 01  AN-00009-X-6 REDEFINES DS-LS-00008-1   PIC X(9).             NC1164.2 126
   000130         013300 01  DS-TS-00008        PIC S9(8)                                 NC1164.2
   000131         013400                        SIGN TRAILING SEPARATE                    NC1164.2
   000132         013500                        VALUE +07654321.                          NC1164.2
   000133         013600 01  AN-00009-X-4 REDEFINES DS-TS-00008     PIC X(9).             NC1164.2 130
   000134         013700 01  CS-00007-1         PIC S9(7) COMPUTATIONAL VALUE +1234567.   NC1164.2
   000135         013800 01  CU-00007-1         PIC  9(7) COMPUTATIONAL VALUE  1234567.   NC1164.2
   000136         013900 01  DS-00007-1         PIC S9(7) DISPLAY       VALUE +1234567.   NC1164.2
   000137         014000 01  DU-00007-1         PIC  9(7) DISPLAY       VALUE  1234567.   NC1164.2
   000138         014100 01  CS-00007-2         PIC S9(7) COMPUTATIONAL VALUE -1234567.   NC1164.2
   000139         014200 01  CU-00007-2        PIC  9(7) COMPUTATIONAL VALUE  1234567.    NC1164.2
   000140         014300 01  DS-00007-2         PIC S9(7) DISPLAY       VALUE -1234567.   NC1164.2
   000141         014400 01  DU-00007-2         PIC  9(7) DISPLAY       VALUE  1234567.   NC1164.2
   000142         014500 01  CS-00007-3         PIC S9(7) COMPUTATIONAL VALUE -7654321.   NC1164.2
   000143         014600 01  CU-00007-3         PIC  9(7) COMPUTATIONAL VALUE  7654321.   NC1164.2
   000144         014700 01  DS-00007-3         PIC S9(7) DISPLAY       VALUE -7654321.   NC1164.2
   000145         014800 01  DU-00007-3         PIC  9(7) DISPLAY       VALUE  7654321.   NC1164.2
   000146         014900 01  CS-00007-4         PIC S9(7) COMPUTATIONAL VALUE +7654321.   NC1164.2
   000147         015000 01  CU-00007-4         PIC  9(7) COMPUTATIONAL VALUE  7654321.   NC1164.2
   000148         015100 01  DS-00007-4         PIC S9(7) DISPLAY       VALUE +7654321.   NC1164.2
   000149         015200 01  DU-00007-4         PIC  9(7) DISPLAY       VALUE  7654321.   NC1164.2
   000150         015300 01  TEST-RESULTS.                                                NC1164.2
   000151         015400     02 FILLER                   PIC X      VALUE SPACE.          NC1164.2 IMP
   000152         015500     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1164.2 IMP
   000153         015600     02 FILLER                   PIC X      VALUE SPACE.          NC1164.2 IMP
   000154         015700     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1164.2 IMP
   000155         015800     02 FILLER                   PIC X      VALUE SPACE.          NC1164.2 IMP
   000156         015900     02  PAR-NAME.                                                NC1164.2
   000157         016000       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1164.2 IMP
   000158         016100       03  PARDOT-X              PIC X      VALUE SPACE.          NC1164.2 IMP
   000159         016200       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1164.2 IMP
   000160         016300     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1164.2 IMP
   000161         016400     02 RE-MARK                  PIC X(61).                       NC1164.2
   000162         016500 01  TEST-COMPUTED.                                               NC1164.2
   000163         016600     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1164.2 IMP
   000164         016700     02 FILLER                   PIC X(17)  VALUE                 NC1164.2
   000165         016800            "       COMPUTED=".                                   NC1164.2
   000166         016900     02 COMPUTED-X.                                               NC1164.2
   000167         017000     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1164.2 IMP
   000168         017100     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1164.2 167
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200                                 PIC -9(9).9(9).                  NC1164.2
   000170         017300     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1164.2 167
   000171         017400     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1164.2 167
   000172         017500     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1164.2 167
   000173         017600     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1164.2 167
   000174         017700         04 COMPUTED-18V0                    PIC -9(18).          NC1164.2
   000175         017800         04 FILLER                           PIC X.               NC1164.2
   000176         017900     03 FILLER PIC X(50) VALUE SPACE.                             NC1164.2 IMP
   000177         018000 01  TEST-CORRECT.                                                NC1164.2
   000178         018100     02 FILLER PIC X(30) VALUE SPACE.                             NC1164.2 IMP
   000179         018200     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1164.2
   000180         018300     02 CORRECT-X.                                                NC1164.2
   000181         018400     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1164.2 IMP
   000182         018500     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1164.2 181
   000183         018600     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1164.2 181
   000184         018700     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1164.2 181
   000185         018800     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1164.2 181
   000186         018900     03      CR-18V0 REDEFINES CORRECT-A.                         NC1164.2 181
   000187         019000         04 CORRECT-18V0                     PIC -9(18).          NC1164.2
   000188         019100         04 FILLER                           PIC X.               NC1164.2
   000189         019200     03 FILLER PIC X(2) VALUE SPACE.                              NC1164.2 IMP
   000190         019300     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1164.2 IMP
   000191         019400 01  CCVS-C-1.                                                    NC1164.2
   000192         019500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1164.2
   000193         019600-    "SS  PARAGRAPH-NAME                                          NC1164.2
   000194         019700-    "       REMARKS".                                            NC1164.2
   000195         019800     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1164.2 IMP
   000196         019900 01  CCVS-C-2.                                                    NC1164.2
   000197         020000     02 FILLER                     PIC X        VALUE SPACE.      NC1164.2 IMP
   000198         020100     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1164.2
   000199         020200     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1164.2 IMP
   000200         020300     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1164.2
   000201         020400     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1164.2 IMP
   000202         020500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1164.2 IMP
   000203         020600 01  REC-CT                        PIC 99       VALUE ZERO.       NC1164.2 IMP
   000204         020700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1164.2 IMP
   000205         020800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1164.2 IMP
   000206         020900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1164.2 IMP
   000207         021000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1164.2 IMP
   000208         021100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1164.2 IMP
   000209         021200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1164.2 IMP
   000210         021300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1164.2 IMP
   000211         021400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1164.2 IMP
   000212         021500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1164.2 IMP
   000213         021600 01  CCVS-H-1.                                                    NC1164.2
   000214         021700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1164.2 IMP
   000215         021800     02  FILLER                    PIC X(42)    VALUE             NC1164.2
   000216         021900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1164.2
   000217         022000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1164.2 IMP
   000218         022100 01  CCVS-H-2A.                                                   NC1164.2
   000219         022200   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1164.2 IMP
   000220         022300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1164.2
   000221         022400   02  FILLER                        PIC XXXX   VALUE             NC1164.2
   000222         022500     "4.2 ".                                                      NC1164.2
   000223         022600   02  FILLER                        PIC X(28)  VALUE             NC1164.2
   000224         022700            " COPY - NOT FOR DISTRIBUTION".                       NC1164.2
   000225         022800   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1164.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900                                                                  NC1164.2
   000227         023000 01  CCVS-H-2B.                                                   NC1164.2
   000228         023100   02  FILLER                        PIC X(15)  VALUE             NC1164.2
   000229         023200            "TEST RESULT OF ".                                    NC1164.2
   000230         023300   02  TEST-ID                       PIC X(9).                    NC1164.2
   000231         023400   02  FILLER                        PIC X(4)   VALUE             NC1164.2
   000232         023500            " IN ".                                               NC1164.2
   000233         023600   02  FILLER                        PIC X(12)  VALUE             NC1164.2
   000234         023700     " HIGH       ".                                              NC1164.2
   000235         023800   02  FILLER                        PIC X(22)  VALUE             NC1164.2
   000236         023900            " LEVEL VALIDATION FOR ".                             NC1164.2
   000237         024000   02  FILLER                        PIC X(58)  VALUE             NC1164.2
   000238         024100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1164.2
   000239         024200 01  CCVS-H-3.                                                    NC1164.2
   000240         024300     02  FILLER                      PIC X(34)  VALUE             NC1164.2
   000241         024400            " FOR OFFICIAL USE ONLY    ".                         NC1164.2
   000242         024500     02  FILLER                      PIC X(58)  VALUE             NC1164.2
   000243         024600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1164.2
   000244         024700     02  FILLER                      PIC X(28)  VALUE             NC1164.2
   000245         024800            "  COPYRIGHT   1985 ".                                NC1164.2
   000246         024900 01  CCVS-E-1.                                                    NC1164.2
   000247         025000     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1164.2 IMP
   000248         025100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1164.2
   000249         025200     02 ID-AGAIN                     PIC X(9).                    NC1164.2
   000250         025300     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1164.2 IMP
   000251         025400 01  CCVS-E-2.                                                    NC1164.2
   000252         025500     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1164.2 IMP
   000253         025600     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1164.2 IMP
   000254         025700     02 CCVS-E-2-2.                                               NC1164.2
   000255         025800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1164.2 IMP
   000256         025900         03 FILLER                   PIC X      VALUE SPACE.      NC1164.2 IMP
   000257         026000         03 ENDER-DESC               PIC X(44)  VALUE             NC1164.2
   000258         026100            "ERRORS ENCOUNTERED".                                 NC1164.2
   000259         026200 01  CCVS-E-3.                                                    NC1164.2
   000260         026300     02  FILLER                      PIC X(22)  VALUE             NC1164.2
   000261         026400            " FOR OFFICIAL USE ONLY".                             NC1164.2
   000262         026500     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1164.2 IMP
   000263         026600     02  FILLER                      PIC X(58)  VALUE             NC1164.2
   000264         026700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1164.2
   000265         026800     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1164.2 IMP
   000266         026900     02 FILLER                       PIC X(15)  VALUE             NC1164.2
   000267         027000             " COPYRIGHT 1985".                                   NC1164.2
   000268         027100 01  CCVS-E-4.                                                    NC1164.2
   000269         027200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1164.2 IMP
   000270         027300     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1164.2
   000271         027400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1164.2 IMP
   000272         027500     02 FILLER                       PIC X(40)  VALUE             NC1164.2
   000273         027600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1164.2
   000274         027700 01  XXINFO.                                                      NC1164.2
   000275         027800     02 FILLER                       PIC X(19)  VALUE             NC1164.2
   000276         027900            "*** INFORMATION ***".                                NC1164.2
   000277         028000     02 INFO-TEXT.                                                NC1164.2
   000278         028100       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1164.2 IMP
   000279         028200       04 XXCOMPUTED                 PIC X(20).                   NC1164.2
   000280         028300       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1164.2 IMP
   000281         028400       04 XXCORRECT                  PIC X(20).                   NC1164.2
   000282         028500     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600 01  HYPHEN-LINE.                                                 NC1164.2
   000284         028700     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1164.2 IMP
   000285         028800     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1164.2
   000286         028900-    "*****************************************".                 NC1164.2
   000287         029000     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1164.2
   000288         029100-    "******************************".                            NC1164.2
   000289         029200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1164.2
   000290         029300     "NC116A".                                                    NC1164.2
   000291         029400 PROCEDURE DIVISION.                                              NC1164.2
   000292         029500 CCVS1 SECTION.                                                   NC1164.2
   000293         029600 OPEN-FILES.                                                      NC1164.2
   000294         029700     OPEN     OUTPUT PRINT-FILE.                                  NC1164.2 36
   000295         029800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1164.2 289 230 289 249
   000296         029900     MOVE    SPACE TO TEST-RESULTS.                               NC1164.2 IMP 150
   000297         030000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1164.2 322 327
   000298         030100     GO TO CCVS1-EXIT.                                            NC1164.2 409
   000299         030200 CLOSE-FILES.                                                     NC1164.2
   000300         030300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1164.2 331 352 36
   000301         030400 TERMINATE-CCVS.                                                  NC1164.2
   000302         030500     EXIT PROGRAM.                                                NC1164.2
   000303         030600 TERMINATE-CALL.                                                  NC1164.2
   000304         030700     STOP     RUN.                                                NC1164.2
   000305         030800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1164.2 154 206
   000306         030900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1164.2 154 207
   000307         031000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1164.2 154 205
   000308         031100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1164.2 154 204
   000309         031200     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1164.2 161
   000310         031300 PRINT-DETAIL.                                                    NC1164.2
   000311         031400     IF REC-CT NOT EQUAL TO ZERO                                  NC1164.2 203 IMP
   000312      1  031500             MOVE "." TO PARDOT-X                                 NC1164.2 158
   000313      1  031600             MOVE REC-CT TO DOTVALUE.                             NC1164.2 203 159
   000314         031700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1164.2 150 37 364
   000315         031800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1164.2 154 364
   000316      1  031900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1164.2 385 399
   000317      1  032000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1164.2 400 408
   000318         032100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1164.2 IMP 154 IMP 166
   000319         032200     MOVE SPACE TO CORRECT-X.                                     NC1164.2 IMP 180
   000320         032300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1164.2 203 IMP IMP 156
   000321         032400     MOVE     SPACE TO RE-MARK.                                   NC1164.2 IMP 161
   000322         032500 HEAD-ROUTINE.                                                    NC1164.2
   000323         032600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1164.2 213 38 364
   000324         032700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1164.2 218 38 364
   000325         032800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1164.2 227 38 364
   000326         032900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1164.2 239 38 364
   000327         033000 COLUMN-NAMES-ROUTINE.                                            NC1164.2
   000328         033100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1164.2 191 38 364
   000329         033200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1164.2 196 38 364
   000330         033300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1164.2 283 38 364
   000331         033400 END-ROUTINE.                                                     NC1164.2
   000332         033500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1164.2 283 38 364
   000333         033600 END-RTN-EXIT.                                                    NC1164.2
   000334         033700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1164.2 246 38 364
   000335         033800 END-ROUTINE-1.                                                   NC1164.2
   000336         033900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1164.2 205 209 206
   000337         034000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1164.2 209 204 209
   000338         034100      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1164.2 207 209
   000339         034200*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1164.2 207 269
   000341         034400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1164.2 209 271
   000342         034500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1164.2 268 254
   000343         034600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1164.2 251 38 364
   000344         034700  END-ROUTINE-12.                                                 NC1164.2
   000345         034800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1164.2 257
   000346         034900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1164.2 205 IMP
   000347      1  035000         MOVE "NO " TO ERROR-TOTAL                                NC1164.2 255
   000348         035100         ELSE                                                     NC1164.2
   000349      1  035200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1164.2 205 255
   000350         035300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1164.2 251 38
   000351         035400     PERFORM WRITE-LINE.                                          NC1164.2 364
   000352         035500 END-ROUTINE-13.                                                  NC1164.2
   000353         035600     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1164.2 204 IMP
   000354      1  035700         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1164.2 255
   000355      1  035800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1164.2 204 255
   000356         035900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1164.2 257
   000357         036000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1164.2 251 38 364
   000358         036100      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1164.2 206 IMP
   000359      1  036200          MOVE "NO " TO ERROR-TOTAL                               NC1164.2 255
   000360      1  036300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1164.2 206 255
   000361         036400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1164.2 257
   000362         036500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1164.2 251 38 364
   000363         036600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1164.2 259 38 364
   000364         036700 WRITE-LINE.                                                      NC1164.2
   000365         036800     ADD 1 TO RECORD-COUNT.                                       NC1164.2 211
   000366         036900     IF RECORD-COUNT GREATER 42                                   NC1164.2 211
   000367      1  037000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1164.2 38 210
   000368      1  037100         MOVE SPACE TO DUMMY-RECORD                               NC1164.2 IMP 38
   000369      1  037200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1164.2 38
   000370      1  037300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1164.2 213 38 380
   000371      1  037400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1164.2 218 38 380
   000372      1  037500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1164.2 227 38 380
   000373      1  037600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1164.2 239 38 380
   000374      1  037700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1164.2 191 38 380
   000375      1  037800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1164.2 196 38 380
   000376      1  037900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1164.2 283 38 380
   000377      1  038000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1164.2 210 38
   000378      1  038100         MOVE ZERO TO RECORD-COUNT.                               NC1164.2 IMP 211
   000379         038200     PERFORM WRT-LN.                                              NC1164.2 380
   000380         038300 WRT-LN.                                                          NC1164.2
   000381         038400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1164.2 38
   000382         038500     MOVE SPACE TO DUMMY-RECORD.                                  NC1164.2 IMP 38
   000383         038600 BLANK-LINE-PRINT.                                                NC1164.2
   000384         038700     PERFORM WRT-LN.                                              NC1164.2 380
   000385         038800 FAIL-ROUTINE.                                                    NC1164.2
   000386         038900     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1164.2 166 IMP
   000387      1  039000            GO TO FAIL-ROUTINE-WRITE.                             NC1164.2 394
   000388         039100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1164.2 180 IMP 394
   000389         039200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1164.2 212 282
   000390         039300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1164.2 277
   000391         039400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1164.2 274 38 364
   000392         039500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1164.2 IMP 282
   000393         039600     GO TO  FAIL-ROUTINE-EX.                                      NC1164.2 399
   000394         039700 FAIL-ROUTINE-WRITE.                                              NC1164.2
   000395         039800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1164.2 162 37 364
   000396         039900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1164.2 212 190
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1164.2 177 37 364
   000398         040100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1164.2 IMP 190
   000399         040200 FAIL-ROUTINE-EX. EXIT.                                           NC1164.2
   000400         040300 BAIL-OUT.                                                        NC1164.2
   000401         040400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1164.2 167 IMP 403
   000402         040500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1164.2 181 IMP 408
   000403         040600 BAIL-OUT-WRITE.                                                  NC1164.2
   000404         040700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1164.2 181 281 167 279
   000405         040800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1164.2 212 282
   000406         040900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1164.2 274 38 364
   000407         041000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1164.2 IMP 282
   000408         041100 BAIL-OUT-EX. EXIT.                                               NC1164.2
   000409         041200 CCVS1-EXIT.                                                      NC1164.2
   000410         041300     EXIT.                                                        NC1164.2
   000411         041400 SECT-NC116A-001 SECTION.                                         NC1164.2
   000412         041500 SIG-INIT-GF-1.                                                   NC1164.2
   000413         041600     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000414         041700     MOVE "SIG-TEST-GF-1" TO PAR-NAME.                            NC1164.2 156
   000415         041800     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000416         041900     MOVE "SIGN LEADING SEPARATE" TO FEATURE.                     NC1164.2 152
   000417         042000     MOVE "LEADING SIGN EQUAL PLUS" TO RE-MARK.                   NC1164.2 161
   000418         042100 SIG-TEST-GF-1-1.                                                 NC1164.2
   000419         042200*        THIS TEST CHECKS THE SIGN AND THE NUMERIC CHARACTERS     NC1164.2
   000420         042300*    OF AN ITEM DEFINED AS SIGN IS LEADING SEPARATE CHARACTER.    NC1164.2
   000421         042400     IF TEST1-AN-1 EQUAL TO "+"                                   NC1164.2 61
   000422      1  042500         PERFORM PASS                                             NC1164.2 306
   000423      1  042600         GO TO SIG-WRTE-GF-1-1.                                   NC1164.2 433
   000424         042700     GO TO SIG-FAIL-GF-1-1.                                       NC1164.2 429
   000425         042800 SIG-DELETE-GF-1-1.                                               NC1164.2
   000426         042900     PERFORM DE-LETE.                                             NC1164.2 308
   000427         043000     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000428         043100     GO TO   SIG-INIT-GF-2.                                       NC1164.2 473
   000429         043200 SIG-FAIL-GF-1-1.                                                 NC1164.2
   000430         043300     PERFORM FAIL.                                                NC1164.2 307
   000431         043400     MOVE "+" TO CORRECT-A.                                       NC1164.2 181
   000432         043500     MOVE TEST1-AN-1 TO COMPUTED-A.                               NC1164.2 61 167
   000433         043600 SIG-WRTE-GF-1-1.                                                 NC1164.2
   000434         043700     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000435         043800 SIG-TEST-GF-1-2.                                                 NC1164.2
   000436         043900     IF TEST1-AN-5 EQUAL TO "91275"                               NC1164.2 62
   000437      1  044000         PERFORM PASS                                             NC1164.2 306
   000438      1  044100         GO TO SIG-WRTE-GF-1-2.                                   NC1164.2 444
   000439         044200 SIG-FAIL-GF-1-2.                                                 NC1164.2
   000440         044300     PERFORM FAIL.                                                NC1164.2 307
   000441         044400     MOVE "NUMERIC CHARACTERS" TO RE-MARK.                        NC1164.2 161
   000442         044500     MOVE "91275" TO CORRECT-A.                                   NC1164.2 181
   000443         044600     MOVE TEST1-AN-5 TO COMPUTED-A.                               NC1164.2 62 167
   000444         044700 SIG-WRTE-GF-1-2.                                                 NC1164.2
   000445         044800     MOVE 2 TO REC-CT.                                            NC1164.2 203
   000446         044900     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000447         045000 SIG-TEST-GF-1-3.                                                 NC1164.2
   000448         045100     IF TEST1N-AN-1 NOT EQUAL TO  "-"                             NC1164.2 67
   000449      1  045200         GO TO SIG-FAIL-GF-1-3.                                   NC1164.2 452
   000450         045300     PERFORM PASS.                                                NC1164.2 306
   000451         045400     GO TO SIG-WRTE-GF-1-3.                                       NC1164.2 456
   000452         045500 SIG-FAIL-GF-1-3.                                                 NC1164.2
   000453         045600     PERFORM FAIL.                                                NC1164.2 307
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     MOVE "-" TO CORRECT-A.                                       NC1164.2 181
   000455         045800     MOVE TEST1N-AN-1 TO COMPUTED-A.                              NC1164.2 67 167
   000456         045900 SIG-WRTE-GF-1-3.                                                 NC1164.2
   000457         046000     MOVE 3 TO REC-CT.                                            NC1164.2 203
   000458         046100     MOVE "LEADING SIGN EQUAL MINUS" TO RE-MARK.                  NC1164.2 161
   000459         046200     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000460         046300 SIG-TEST-GF-1-4.                                                 NC1164.2
   000461         046400     IF TEST1N-AN-4 NOT EQUAL TO "9127"                           NC1164.2 68
   000462      1  046500         GO TO SIG-FAIL-GF-1-4.                                   NC1164.2 465
   000463         046600     PERFORM PASS.                                                NC1164.2 306
   000464         046700     GO TO SIG-WRTE-GF-1-4.                                       NC1164.2 470
   000465         046800 SIG-FAIL-GF-1-4.                                                 NC1164.2
   000466         046900     PERFORM FAIL.                                                NC1164.2 307
   000467         047000     MOVE "NUMERIC CHARACTERS" TO RE-MARK.                        NC1164.2 161
   000468         047100     MOVE "9127" TO CORRECT-A.                                    NC1164.2 181
   000469         047200     MOVE TEST1N-AN-4 TO COMPUTED-A.                              NC1164.2 68 167
   000470         047300 SIG-WRTE-GF-1-4.                                                 NC1164.2
   000471         047400     MOVE 4 TO REC-CT.                                            NC1164.2 203
   000472         047500     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000473         047600 SIG-INIT-GF-2.                                                   NC1164.2
   000474         047700     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000475         047800     MOVE "SIG-TEST-GF-2" TO PAR-NAME.                            NC1164.2 156
   000476         047900     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000477         048000     MOVE "SIGN TRLNG SEPARATE" TO FEATURE.                       NC1164.2 152
   000478         048100     MOVE "TRAILING SIGN EQUAL PLUS" TO RE-MARK.                  NC1164.2 161
   000479         048200*        THIS TEST CHECKS THE SIGN AND THE NUMERIC CHARACTERS     NC1164.2
   000480         048300*    OF AN ITEM DEFINED AS SIGN IS TRAILING SEPARATE CHARACTER.   NC1164.2
   000481         048400 SIG-TEST-GF-2-1.                                                 NC1164.2
   000482         048500     IF TEST2-AN-1 EQUAL TO "+"                                   NC1164.2 74
   000483      1  048600         PERFORM PASS                                             NC1164.2 306
   000484      1  048700         GO TO SIG-WRTE-GF-2-1.                                   NC1164.2 494
   000485         048800     GO TO SIG-FAIL-GF-2-1.                                       NC1164.2 490
   000486         048900 SIG-DELETE-GF-2-1.                                               NC1164.2
   000487         049000     PERFORM DE-LETE.                                             NC1164.2 308
   000488         049100     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000489         049200     GO TO   SIG-INIT-GF-3.                                       NC1164.2 535
   000490         049300 SIG-FAIL-GF-2-1.                                                 NC1164.2
   000491         049400     PERFORM FAIL.                                                NC1164.2 307
   000492         049500     MOVE "+" TO CORRECT-A.                                       NC1164.2 181
   000493         049600     MOVE TEST2-AN-1 TO COMPUTED-A.                               NC1164.2 74 167
   000494         049700 SIG-WRTE-GF-2-1.                                                 NC1164.2
   000495         049800     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000496         049900 SIGNTEST-GF-2-2.                                                 NC1164.2
   000497         050000     IF TEST2-AN-5 EQUAL TO "80361"                               NC1164.2 73
   000498      1  050100         PERFORM PASS                                             NC1164.2 306
   000499      1  050200         GO TO SIG-WRTE-GF-2-2.                                   NC1164.2 506
   000500         050300     GO TO SIG-FAIL-GF-2-2.                                       NC1164.2 501
   000501         050400 SIG-FAIL-GF-2-2.                                                 NC1164.2
   000502         050500     PERFORM FAIL.                                                NC1164.2 307
   000503         050600     MOVE "80361" TO CORRECT-A.                                   NC1164.2 181
   000504         050700     MOVE TEST2-AN-5 TO COMPUTED-A.                               NC1164.2 73 167
   000505         050800     MOVE "NUMERIC CHARACTERS" TO RE-MARK.                        NC1164.2 161
   000506         050900 SIG-WRTE-GF-2-2.                                                 NC1164.2
   000507         051000     MOVE 2 TO REC-CT.                                            NC1164.2 203
   000508         051100     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000509         051200 SIG-TEST-GF-2-3.                                                 NC1164.2
   000510         051300     IF TEST2N-AN-1 NOT EQUAL TO "-"                              NC1164.2 80
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  051400         GO TO SIG-FAIL-GF-2-3.                                   NC1164.2 514
   000512         051500     PERFORM PASS.                                                NC1164.2 306
   000513         051600     GO TO SIG-WRTE-GF-2-3.                                       NC1164.2 518
   000514         051700 SIG-FAIL-GF-2-3.                                                 NC1164.2
   000515         051800     PERFORM FAIL.                                                NC1164.2 307
   000516         051900     MOVE "-" TO CORRECT-A.                                       NC1164.2 181
   000517         052000     MOVE TEST2N-AN-1 TO COMPUTED-A.                              NC1164.2 80 167
   000518         052100 SIG-WRTE-GF-2-3.                                                 NC1164.2
   000519         052200     MOVE 3 TO REC-CT.                                            NC1164.2 203
   000520         052300     MOVE "TRAILING SIGN EQUAL MINUS" TO RE-MARK.                 NC1164.2 161
   000521         052400     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000522         052500 SIG-TEST-GF-2-4.                                                 NC1164.2
   000523         052600     IF TEST2N-AN-4 NOT EQUAL TO "8036"                           NC1164.2 79
   000524      1  052700         GO TO SIG-FAIL-GF-2-4.                                   NC1164.2 527
   000525         052800     PERFORM PASS.                                                NC1164.2 306
   000526         052900     GO TO SIG-WRTE-GF-2-4.                                       NC1164.2 532
   000527         053000 SIG-FAIL-GF-2-4.                                                 NC1164.2
   000528         053100     PERFORM FAIL.                                                NC1164.2 307
   000529         053200     MOVE "8036" TO CORRECT-A.                                    NC1164.2 181
   000530         053300     MOVE TEST2N-AN-4 TO COMPUTED-A.                              NC1164.2 79 167
   000531         053400     MOVE "NUMERIC CHARACTERS" TO RE-MARK.                        NC1164.2 161
   000532         053500 SIG-WRTE-GF-2-4.                                                 NC1164.2
   000533         053600     MOVE 4 TO REC-CT.                                            NC1164.2 203
   000534         053700     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000535         053800 SIG-INIT-GF-3.                                                   NC1164.2
   000536         053900     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000537         054000     MOVE "SIG-TEST-GF-3" TO PAR-NAME.                            NC1164.2 156
   000538         054100     MOVE "SIGN LEADING" TO FEATURE.                              NC1164.2 152
   000539         054200     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000540         054300     MOVE "POSITIVE NUMERIC ITEM" TO RE-MARK.                     NC1164.2 161
   000541         054400*        THIS TEST CHECKS ALL BUT THE LEADING CHARACTER OF AN     NC1164.2
   000542         054500*    ITEM DEFINED AS SIGN IS LEADING. (NOT SEPARATE CHAR.)        NC1164.2
   000543         054600 SIG-TEST-GF-3-1.                                                 NC1164.2
   000544         054700     IF TEST3-AN-4 EQUAL TO "1275"                                NC1164.2 85
   000545      1  054800         PERFORM PASS                                             NC1164.2 306
   000546      1  054900         GO TO SIG-WRTE-GF-3-1.                                   NC1164.2 556
   000547         055000     GO TO SIG-FAIL-GF-3-1.                                       NC1164.2 552
   000548         055100 SIG-DELETE-GF-3-1.                                               NC1164.2
   000549         055200     PERFORM DE-LETE.                                             NC1164.2 308
   000550         055300     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000551         055400     GO TO   SIG-INIT-GF-4.                                       NC1164.2 573
   000552         055500 SIG-FAIL-GF-3-1.                                                 NC1164.2
   000553         055600     PERFORM FAIL.                                                NC1164.2 307
   000554         055700     MOVE "1275" TO CORRECT-A.                                    NC1164.2 181
   000555         055800     MOVE TEST3-AN-4 TO COMPUTED-A.                               NC1164.2 85 167
   000556         055900 SIG-WRTE-GF-3-1.                                                 NC1164.2
   000557         056000     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000558         056100 SIG-TEST-GF-3-2.                                                 NC1164.2
   000559         056200     IF TEST3N-AN-3 NOT EQUAL TO "127"                            NC1164.2 90
   000560      1  056300         GO TO SIG-FAIL-GF-3-2.                                   NC1164.2 565
   000561         056400     PERFORM PASS.                                                NC1164.2 306
   000562         056500     GO TO SIG-WRTE-GF-3-2.                                       NC1164.2 569
   000563         056600 SIG-DELETE-GF-3-2.                                               NC1164.2
   000564         056700     PERFORM DE-LETE.                                             NC1164.2 308
   000565         056800 SIG-FAIL-GF-3-2.                                                 NC1164.2
   000566         056900     PERFORM FAIL.                                                NC1164.2 307
   000567         057000     MOVE "127" TO CORRECT-A.                                     NC1164.2 181
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE TEST3N-AN-3 TO COMPUTED-A.                              NC1164.2 90 167
   000569         057200 SIG-WRTE-GF-3-2.                                                 NC1164.2
   000570         057300     MOVE 2 TO REC-CT.                                            NC1164.2 203
   000571         057400     MOVE "NEGATIVE NUMERIC ITEM" TO RE-MARK.                     NC1164.2 161
   000572         057500     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000573         057600 SIG-INIT-GF-4.                                                   NC1164.2
   000574         057700     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000575         057800     MOVE "SIG-TEST-GF-4" TO PAR-NAME.                            NC1164.2 156
   000576         057900     MOVE "SIGN TRAILING" TO FEATURE.                             NC1164.2 152
   000577         058000     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000578         058100     MOVE "POSITIVE NUMERIC ITEM" TO RE-MARK.                     NC1164.2 161
   000579         058200*        THIS TEST CHECKS ALL BUT THE TRAILING CHARACTER OF AN    NC1164.2
   000580         058300*    ITEM DEFINED AS SIGN IS TRAILING. (NOT SEPARATE CHAR.)       NC1164.2
   000581         058400 SIG-TEST-GF-4-1.                                                 NC1164.2
   000582         058500     IF TEST4-AN-4 EQUAL TO "8362"                                NC1164.2 94
   000583      1  058600         PERFORM PASS                                             NC1164.2 306
   000584      1  058700         GO TO SIG-WRTE-GF-4-1.                                   NC1164.2 594
   000585         058800     GO TO SIG-FAIL-GF-4-1.                                       NC1164.2 590
   000586         058900 SIG-DELETE-GF-4-1.                                               NC1164.2
   000587         059000     PERFORM DE-LETE.                                             NC1164.2 308
   000588         059100     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000589         059200     GO TO   SIG-INIT-GF-5.                                       NC1164.2 611
   000590         059300 SIG-FAIL-GF-4-1.                                                 NC1164.2
   000591         059400     PERFORM FAIL.                                                NC1164.2 307
   000592         059500     MOVE "8362" TO CORRECT-A.                                    NC1164.2 181
   000593         059600     MOVE TEST4-AN-4 TO COMPUTED-A.                               NC1164.2 94 167
   000594         059700 SIG-WRTE-GF-4-1.                                                 NC1164.2
   000595         059800     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000596         059900 SIG-TEST-GF-4-2.                                                 NC1164.2
   000597         060000     IF TEST4N-AN-3 NOT EQUAL TO "362"                            NC1164.2 99
   000598      1  060100         GO TO SIG-FAIL-GF-4-2.                                   NC1164.2 603
   000599         060200     PERFORM PASS.                                                NC1164.2 306
   000600         060300     GO TO SIG-WRTE-GF-4-2.                                       NC1164.2 607
   000601         060400 SIG-DELETE-GF-4-2.                                               NC1164.2
   000602         060500     PERFORM DE-LETE.                                             NC1164.2 308
   000603         060600 SIG-FAIL-GF-4-2.                                                 NC1164.2
   000604         060700     PERFORM FAIL.                                                NC1164.2 307
   000605         060800     MOVE "362" TO CORRECT-A.                                     NC1164.2 181
   000606         060900     MOVE TEST4N-AN-3 TO COMPUTED-A.                              NC1164.2 99 167
   000607         061000 SIG-WRTE-GF-4-2.                                                 NC1164.2
   000608         061100     MOVE 2 TO REC-CT.                                            NC1164.2 203
   000609         061200     MOVE "NEGATIVE NUMERIC ITEM" TO RE-MARK.                     NC1164.2 161
   000610         061300     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000611         061400 SIG-INIT-GF-5.                                                   NC1164.2
   000612         061500     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000613         061600     MOVE "SIG-TEST-GF-5" TO PAR-NAME.                            NC1164.2 156
   000614         061700     MOVE "COMPARE SIGNED ITEMS" TO FEATURE.                      NC1164.2 152
   000615         061800     MOVE "LEADING SIGN" TO RE-MARK.                              NC1164.2 161
   000616         061900     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000617         062000*        THIS SERIES OF TESTS COMPARE A SIGNED DISPLAY ITEM WITH  NC1164.2
   000618         062100*    LEADING SIGN TO FOUR SIGNED AND UNSIGNED COMPUTATIONAL AND   NC1164.2
   000619         062200*    DISPLAY ITEMS.                                               NC1164.2
   000620         062300 SIG-TEST-GF-5-1.                                                 NC1164.2
   000621         062400     IF DS-L-00008 EQUAL TO CS-00007-1                            NC1164.2 116 134
   000622      1  062500              PERFORM PASS                                        NC1164.2 306
   000623      1  062600              GO TO SIG-WRITE-GF-5-1.                             NC1164.2 633
   000624         062700     GO TO SIG-FAIL-GF-5-1.                                       NC1164.2 629
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800 SIG-DELETE-GF-5-1.                                               NC1164.2
   000626         062900     PERFORM DE-LETE.                                             NC1164.2 308
   000627         063000     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000628         063100     GO TO   SIG-INIT-GF-6.                                       NC1164.2 668
   000629         063200 SIG-FAIL-GF-5-1.                                                 NC1164.2
   000630         063300     PERFORM FAIL.                                                NC1164.2 307
   000631         063400     MOVE AN-00008-X-1 TO COMPUTED-A.                             NC1164.2 117 167
   000632         063500     MOVE CS-00007-1 TO CORRECT-18V0.                             NC1164.2 134 187
   000633         063600 SIG-WRITE-GF-5-1.                                                NC1164.2
   000634         063700     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000635         063800 SIG-TEST-GF-5-2.                                                 NC1164.2
   000636         063900     MOVE 2 TO REC-CT.                                            NC1164.2 203
   000637         064000     IF DS-L-00008 EQUAL TO CU-00007-1                            NC1164.2 116 135
   000638      1  064100              PERFORM PASS                                        NC1164.2 306
   000639      1  064200              GO TO SIG-WRITE-GF-5-2.                             NC1164.2 644
   000640         064300 SIG-FAIL-GF-5-2.                                                 NC1164.2
   000641         064400     PERFORM FAIL.                                                NC1164.2 307
   000642         064500     MOVE AN-00008-X-1 TO COMPUTED-A.                             NC1164.2 117 167
   000643         064600     MOVE CU-00007-1 TO CORRECT-18V0.                             NC1164.2 135 187
   000644         064700 SIG-WRITE-GF-5-2.                                                NC1164.2
   000645         064800     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000646         064900 SIG-TEST-GF-5-3.                                                 NC1164.2
   000647         065000     MOVE 3 TO REC-CT.                                            NC1164.2 203
   000648         065100     IF DS-L-00008 EQUAL TO DS-00007-1                            NC1164.2 116 136
   000649      1  065200              PERFORM PASS                                        NC1164.2 306
   000650      1  065300              GO TO SIG-WRITE-GF-5-3.                             NC1164.2 655
   000651         065400 SIG-FAIL-GF-5-3.                                                 NC1164.2
   000652         065500     PERFORM FAIL.                                                NC1164.2 307
   000653         065600     MOVE AN-00008-X-1 TO COMPUTED-A.                             NC1164.2 117 167
   000654         065700     MOVE DS-00007-1 TO CORRECT-18V0.                             NC1164.2 136 187
   000655         065800 SIG-WRITE-GF-5-3.                                                NC1164.2
   000656         065900     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000657         066000 SIG-TEST-GF-5-4.                                                 NC1164.2
   000658         066100     MOVE 4 TO REC-CT.                                            NC1164.2 203
   000659         066200     IF DS-L-00008 EQUAL TO DU-00007-1                            NC1164.2 116 137
   000660      1  066300              PERFORM PASS                                        NC1164.2 306
   000661      1  066400              GO TO SIG-WRITE-GF-5-4.                             NC1164.2 666
   000662         066500 SIG-FAIL-GF-5-4.                                                 NC1164.2
   000663         066600     PERFORM FAIL.                                                NC1164.2 307
   000664         066700     MOVE AN-00008-X-1 TO COMPUTED-A.                             NC1164.2 117 167
   000665         066800     MOVE DU-00007-1 TO CORRECT-18V0.                             NC1164.2 137 187
   000666         066900 SIG-WRITE-GF-5-4.                                                NC1164.2
   000667         067000     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000668         067100 SIG-INIT-GF-6.                                                   NC1164.2
   000669         067200     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000670         067300     MOVE "SIG-TEST-GF-6" TO PAR-NAME.                            NC1164.2 156
   000671         067400     MOVE "COMPARE SIGNED ITEMS" TO FEATURE.                      NC1164.2 152
   000672         067500     MOVE "TRAILING SIGN" TO RE-MARK.                             NC1164.2 161
   000673         067600*        THIS SERIES OF TESTS COMPARE A SIGNED DISPLAY ITEM WITH  NC1164.2
   000674         067700*    TRAILING SIGN TO FOUR SIGNED AND UNSIGNED COMPUTATIONAL AND  NC1164.2
   000675         067800*    DISPLAY ITEMS.                                               NC1164.2
   000676         067900 SIG-TEST-GF-6-1.                                                 NC1164.2
   000677         068000     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000678         068100     IF DS-T-00008 EQUAL TO CS-00007-2                            NC1164.2 118 138
   000679      1  068200              PERFORM PASS                                        NC1164.2 306
   000680      1  068300              GO TO SIG-WRITE-GF-6-1.                             NC1164.2 690
   000681         068400     GO TO SIG-FAIL-GF-6-1.                                       NC1164.2 686
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500 SIG-DELETE-GF-6-1.                                               NC1164.2
   000683         068600     PERFORM DE-LETE.                                             NC1164.2 308
   000684         068700     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000685         068800     GO TO   SIG-INIT-GF-7.                                       NC1164.2 725
   000686         068900 SIG-FAIL-GF-6-1.                                                 NC1164.2
   000687         069000     PERFORM FAIL.                                                NC1164.2 307
   000688         069100     MOVE AN-00008-X-2 TO COMPUTED-A.                             NC1164.2 119 167
   000689         069200     MOVE CS-00007-2 TO CORRECT-18V0.                             NC1164.2 138 187
   000690         069300 SIG-WRITE-GF-6-1.                                                NC1164.2
   000691         069400     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000692         069500 SIG-TEST-GF-6-2.                                                 NC1164.2
   000693         069600     MOVE 2 TO REC-CT.                                            NC1164.2 203
   000694         069700     IF DS-T-00008-1 EQUAL TO CU-00007-2                          NC1164.2 120 139
   000695      1  069800              PERFORM PASS                                        NC1164.2 306
   000696      1  069900              GO TO SIG-WRITE-GF-6-2.                             NC1164.2 701
   000697         070000 SIG-FAIL-GF-6-2.                                                 NC1164.2
   000698         070100     PERFORM FAIL.                                                NC1164.2 307
   000699         070200     MOVE AN-00008-X-5 TO COMPUTED-A.                             NC1164.2 121 167
   000700         070300     MOVE CU-00007-2 TO CORRECT-18V0.                             NC1164.2 139 187
   000701         070400 SIG-WRITE-GF-6-2.                                                NC1164.2
   000702         070500     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000703         070600 SIG-TEST-GF-6-3.                                                 NC1164.2
   000704         070700     MOVE 3 TO REC-CT.                                            NC1164.2 203
   000705         070800     IF DS-T-00008 EQUAL TO DS-00007-2                            NC1164.2 118 140
   000706      1  070900              PERFORM PASS                                        NC1164.2 306
   000707      1  071000              GO TO SIG-WRITE-GF-6-3.                             NC1164.2 712
   000708         071100 SIG-FAIL-GF-6-3.                                                 NC1164.2
   000709         071200     PERFORM FAIL.                                                NC1164.2 307
   000710         071300     MOVE AN-00008-X-2 TO COMPUTED-A.                             NC1164.2 119 167
   000711         071400     MOVE DS-00007-2 TO CORRECT-18V0.                             NC1164.2 140 187
   000712         071500 SIG-WRITE-GF-6-3.                                                NC1164.2
   000713         071600     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000714         071700 SIG-TEST-GF-6-4.                                                 NC1164.2
   000715         071800     MOVE 4 TO REC-CT.                                            NC1164.2 203
   000716         071900     IF DS-T-00008-1 EQUAL TO DU-00007-2                          NC1164.2 120 141
   000717      1  072000              PERFORM PASS                                        NC1164.2 306
   000718      1  072100              GO TO SIG-WRITE-GF-6-4.                             NC1164.2 723
   000719         072200 SIG-FAIL-GF-6-4.                                                 NC1164.2
   000720         072300     PERFORM FAIL.                                                NC1164.2 307
   000721         072400     MOVE AN-00008-X-5 TO COMPUTED-A.                             NC1164.2 121 167
   000722         072500     MOVE DU-00007-2  TO CORRECT-18V0.                            NC1164.2 141 187
   000723         072600 SIG-WRITE-GF-6-4.                                                NC1164.2
   000724         072700     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000725         072800 SIG-INIT-GF-7.                                                   NC1164.2
   000726         072900     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000727         073000     MOVE "SIG-TEST-GF-7" TO PAR-NAME.                            NC1164.2 156
   000728         073100     MOVE "COMPARE SIGNED ITEMS" TO FEATURE.                      NC1164.2 152
   000729         073200     MOVE "LEADING SIGN SEPARATE CHARACTER" TO RE-MARK.           NC1164.2 161
   000730         073300*        THIS SERIES OF TESTS COMPARE A SIGNED DISPLAY ITEM WITH  NC1164.2
   000731         073400*    LEADING SIGN AND SEPARATE CHARACTER TO FOUR SIGNED AND       NC1164.2
   000732         073500*    UNSIGNED COMPUTATIONAL AND DISPLAY ITEMS.                    NC1164.2
   000733         073600 SIG-TEST-GF-7-1.                                                 NC1164.2
   000734         073700     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000735         073800     IF DS-LS-00008 EQUAL TO CS-00007-3                           NC1164.2 122 142
   000736      1  073900              PERFORM PASS                                        NC1164.2 306
   000737      1  074000         GO TO SIG-WRITE-GF-7-1.                                  NC1164.2 747
   000738         074100     GO TO SIG-FAIL-GF-7-1.                                       NC1164.2 743
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200 SIG-DELETE-GF-7-1.                                               NC1164.2
   000740         074300     PERFORM DE-LETE.                                             NC1164.2 308
   000741         074400     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000742         074500     GO TO   SIG-INIT-GF-8.                                       NC1164.2 782
   000743         074600 SIG-FAIL-GF-7-1.                                                 NC1164.2
   000744         074700     PERFORM FAIL.                                                NC1164.2 307
   000745         074800     MOVE AN-00009-X-3 TO COMPUTED-A.                             NC1164.2 125 167
   000746         074900     MOVE CS-00007-3 TO CORRECT-18V0.                             NC1164.2 142 187
   000747         075000 SIG-WRITE-GF-7-1.                                                NC1164.2
   000748         075100     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000749         075200 SIG-TEST-GF-7-2.                                                 NC1164.2
   000750         075300     MOVE 2 TO REC-CT.                                            NC1164.2 203
   000751         075400     IF DS-LS-00008-1 EQUAL TO CU-00007-3                         NC1164.2 126 143
   000752      1  075500              PERFORM PASS                                        NC1164.2 306
   000753      1  075600              GO TO SIG-WRITE-GF-7-2.                             NC1164.2 758
   000754         075700 SIG-FAIL-GF-7-2.                                                 NC1164.2
   000755         075800     PERFORM FAIL.                                                NC1164.2 307
   000756         075900     MOVE AN-00009-X-6 TO COMPUTED-A.                             NC1164.2 129 167
   000757         076000     MOVE CU-00007-3 TO CORRECT-18V0.                             NC1164.2 143 187
   000758         076100 SIG-WRITE-GF-7-2.                                                NC1164.2
   000759         076200     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000760         076300 SIG-TEST-GF-7-3.                                                 NC1164.2
   000761         076400     MOVE 3 TO REC-CT.                                            NC1164.2 203
   000762         076500     IF DS-LS-00008 EQUAL TO DS-00007-3                           NC1164.2 122 144
   000763      1  076600              PERFORM PASS.                                       NC1164.2 306
   000764         076700              GO TO SIG-WRITE-GF-7-3.                             NC1164.2 769
   000765         076800 SIG-FAIL-GF-7-3.                                                 NC1164.2
   000766         076900     PERFORM FAIL.                                                NC1164.2 307
   000767         077000     MOVE AN-00009-X-3 TO COMPUTED-A.                             NC1164.2 125 167
   000768         077100     MOVE DS-00007-3 TO CORRECT-18V0.                             NC1164.2 144 187
   000769         077200 SIG-WRITE-GF-7-3.                                                NC1164.2
   000770         077300     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000771         077400 SIG-TEST-GF-7-4.                                                 NC1164.2
   000772         077500     MOVE 4 TO REC-CT.                                            NC1164.2 203
   000773         077600     IF DS-LS-00008-1 EQUAL TO DU-00007-3                         NC1164.2 126 145
   000774      1  077700              PERFORM PASS                                        NC1164.2 306
   000775      1  077800              GO TO SIG-WRITE-GF-7-4.                             NC1164.2 780
   000776         077900 SIG-FAIL-GF-7-4.                                                 NC1164.2
   000777         078000     PERFORM FAIL.                                                NC1164.2 307
   000778         078100     MOVE AN-00009-X-6 TO COMPUTED-A.                             NC1164.2 129 167
   000779         078200     MOVE DU-00007-3 TO CORRECT-18V0.                             NC1164.2 145 187
   000780         078300 SIG-WRITE-GF-7-4.                                                NC1164.2
   000781         078400     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000782         078500 SIG-INIT-GF-8.                                                   NC1164.2
   000783         078600     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000784         078700     MOVE "SIG-TEST-GF-8" TO PAR-NAME.                            NC1164.2 156
   000785         078800     MOVE "COMPARE SIGN ITEMS" TO FEATURE.                        NC1164.2 152
   000786         078900     MOVE "TRAILING SIGN SEPARATE CHARACTR" TO RE-MARK.           NC1164.2 161
   000787         079000*        THIS SERIES OF TESTS COMPARE A SIGNED DISPLAY ITEM WITH  NC1164.2
   000788         079100*    TRAILING SIGN AND SEPARATE CHARACTER TO FOUR SIGNED AND      NC1164.2
   000789         079200*    UNSIGNED COMPUTATIONAL AND DISPLAY ITEMS.                    NC1164.2
   000790         079300 SIG-TEST-GF-8-1.                                                 NC1164.2
   000791         079400     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000792         079500     IF DS-TS-00008 EQUAL TO CS-00007-4                           NC1164.2 130 146
   000793      1  079600              PERFORM PASS                                        NC1164.2 306
   000794      1  079700              GO TO SIG-WRITE-GF-8-1.                             NC1164.2 804
   000795         079800     GO TO SIG-FAIL-GF-8-1.                                       NC1164.2 800
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900 SIG-DELETE-GF-8-1.                                               NC1164.2
   000797         080000     PERFORM DE-LETE.                                             NC1164.2 308
   000798         080100     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000799         080200     GO TO   SIG-INIT-GF-9.                                       NC1164.2 839
   000800         080300 SIG-FAIL-GF-8-1.                                                 NC1164.2
   000801         080400     PERFORM FAIL.                                                NC1164.2 307
   000802         080500     MOVE AN-00009-X-4 TO COMPUTED-A.                             NC1164.2 133 167
   000803         080600     MOVE CS-00007-4 TO CORRECT-18V0.                             NC1164.2 146 187
   000804         080700 SIG-WRITE-GF-8-1.                                                NC1164.2
   000805         080800     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000806         080900 SIG-TEST-GF-8-2.                                                 NC1164.2
   000807         081000     MOVE 2 TO REC-CT.                                            NC1164.2 203
   000808         081100     IF DS-TS-00008 EQUAL TO CU-00007-4                           NC1164.2 130 147
   000809      1  081200              PERFORM PASS                                        NC1164.2 306
   000810      1  081300              GO TO SIG-WRITE-GF-8-2.                             NC1164.2 815
   000811         081400 SIG-FAIL-GF-8-2.                                                 NC1164.2
   000812         081500     PERFORM FAIL.                                                NC1164.2 307
   000813         081600     MOVE AN-00009-X-4 TO COMPUTED-A.                             NC1164.2 133 167
   000814         081700     MOVE CU-00007-4 TO CORRECT-18V0.                             NC1164.2 147 187
   000815         081800 SIG-WRITE-GF-8-2.                                                NC1164.2
   000816         081900     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000817         082000 SIG-TEST-GF-8-3.                                                 NC1164.2
   000818         082100     MOVE 3 TO REC-CT.                                            NC1164.2 203
   000819         082200     IF DS-TS-00008 EQUAL TO DS-00007-4                           NC1164.2 130 148
   000820      1  082300              PERFORM PASS                                        NC1164.2 306
   000821      1  082400              GO TO SIG-WRITE-GF-8-3.                             NC1164.2 826
   000822         082500 SIG-FAIL-GF-8-3.                                                 NC1164.2
   000823         082600     PERFORM FAIL.                                                NC1164.2 307
   000824         082700     MOVE AN-00009-X-4 TO COMPUTED-A.                             NC1164.2 133 167
   000825         082800     MOVE DS-00007-4 TO CORRECT-18V0.                             NC1164.2 148 187
   000826         082900 SIG-WRITE-GF-8-3.                                                NC1164.2
   000827         083000     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000828         083100 SIG-TEST-GF-8-4.                                                 NC1164.2
   000829         083200     MOVE 4 TO REC-CT.                                            NC1164.2 203
   000830         083300     IF DS-TS-00008 EQUAL TO DU-00007-4                           NC1164.2 130 149
   000831      1  083400              PERFORM PASS                                        NC1164.2 306
   000832      1  083500              GO TO SIG-WRITE-GF-8-4.                             NC1164.2 837
   000833         083600 SIG-FAIL-GF-8-4.                                                 NC1164.2
   000834         083700     PERFORM FAIL.                                                NC1164.2 307
   000835         083800     MOVE AN-00009-X-4 TO COMPUTED-A.                             NC1164.2 133 167
   000836         083900     MOVE DU-00007-4 TO CORRECT-18V0.                             NC1164.2 149 187
   000837         084000 SIG-WRITE-GF-8-4.                                                NC1164.2
   000838         084100     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000839         084200 SIG-INIT-GF-9.                                                   NC1164.2
   000840         084300     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000841         084400     MOVE "SIG-TEST-GF-9" TO PAR-NAME.                            NC1164.2 156
   000842         084500     MOVE "SENDING ITEM DS-LS" TO FEATURE.                        NC1164.2 152
   000843         084600     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000844         084700*        THIS TEST MOVES A NUMERIC ITEM WITH SIGN IS LEADING      NC1164.2
   000845         084800*    SEPARATE CHARACTER TO UNSIGNED DISPLAY, SIGNED DISPLAY,      NC1164.2
   000846         084900*    UNSIGNED COMPUTATIONAL AND SIGNED COMPUTATIONAL ITEMS.       NC1164.2
   000847         085000 SIG-TEST-GF-9-1.                                                 NC1164.2
   000848         085100     MOVE DS-LS-5 TO DU-005.                                      NC1164.2 57 101
   000849         085200     IF DU-005 EQUAL TO 91275                                     NC1164.2 101
   000850      1  085300         PERFORM PASS                                             NC1164.2 306
   000851      1  085400         GO TO SIG-WRTE-GF-9-1.                                   NC1164.2 862
   000852         085500     GO TO SIG-FAIL-GF-9-1.                                       NC1164.2 857
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600 SIG-DELETE-GF-9-1.                                               NC1164.2
   000854         085700     PERFORM DE-LETE.                                             NC1164.2 308
   000855         085800     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000856         085900     GO TO   SIG-INIT-GF-10.                                      NC1164.2 903
   000857         086000 SIG-FAIL-GF-9-1.                                                 NC1164.2
   000858         086100     PERFORM FAIL.                                                NC1164.2 307
   000859         086200     MOVE DU-005 TO COMPUTED-18V0.                                NC1164.2 101 174
   000860         086300     MOVE 91275 TO CORRECT-18V0.                                  NC1164.2 187
   000861         086400     MOVE "MOVE DS-LS-5 TO DU-005" TO RE-MARK.                    NC1164.2 161
   000862         086500 SIG-WRTE-GF-9-1.                                                 NC1164.2
   000863         086600     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000864         086700 SIG-TEST-GF-9-2.                                                 NC1164.2
   000865         086800     MOVE DS-LS-5 TO DS-005.                                      NC1164.2 57 102
   000866         086900     IF DS-005 EQUAL TO +91275                                    NC1164.2 102
   000867      1  087000         PERFORM PASS                                             NC1164.2 306
   000868      1  087100         GO TO SIG-WRTE-GF-9-2.                                   NC1164.2 874
   000869         087200 SIG-FAIL-GF-9-2.                                                 NC1164.2
   000870         087300     PERFORM FAIL.                                                NC1164.2 307
   000871         087400     MOVE DS-005 TO COMPUTED-18V0.                                NC1164.2 102 174
   000872         087500     MOVE +91275 TO CORRECT-18V0.                                 NC1164.2 187
   000873         087600     MOVE "MOVE DS-LS-5 TO DS-005" TO RE-MARK.                    NC1164.2 161
   000874         087700 SIG-WRTE-GF-9-2.                                                 NC1164.2
   000875         087800     MOVE 2 TO REC-CT.                                            NC1164.2 203
   000876         087900     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000877         088000 SIG-TEST-GF-9-3.                                                 NC1164.2
   000878         088100     MOVE DS-LS-5 TO CU-005.                                      NC1164.2 57 103
   000879         088200     IF CU-005 EQUAL TO 91275                                     NC1164.2 103
   000880      1  088300         PERFORM PASS                                             NC1164.2 306
   000881      1  088400         GO TO SIG-WRTE-GF-9-3.                                   NC1164.2 887
   000882         088500 SIG-FAIL-GF-9-3.                                                 NC1164.2
   000883         088600     PERFORM FAIL.                                                NC1164.2 307
   000884         088700     MOVE CU-005 TO COMPUTED-18V0.                                NC1164.2 103 174
   000885         088800     MOVE 91275 TO CORRECT-18V0.                                  NC1164.2 187
   000886         088900     MOVE "MOVE DS-LS-5 TO CU-005" TO RE-MARK.                    NC1164.2 161
   000887         089000 SIG-WRTE-GF-9-3.                                                 NC1164.2
   000888         089100     MOVE 3 TO REC-CT.                                            NC1164.2 203
   000889         089200     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000890         089300 SIG-TEST-GF-9-4.                                                 NC1164.2
   000891         089400     MOVE DS-LS-5 TO CS-005.                                      NC1164.2 57 104
   000892         089500     IF CS-005 EQUAL TO +91275                                    NC1164.2 104
   000893      1  089600         PERFORM PASS                                             NC1164.2 306
   000894      1  089700         GO TO SIG-WRTE-GF-9-4.                                   NC1164.2 900
   000895         089800 SIG-FAIL-GF-9-4.                                                 NC1164.2
   000896         089900     PERFORM FAIL.                                                NC1164.2 307
   000897         090000     MOVE CS-005 TO COMPUTED-18V0.                                NC1164.2 104 174
   000898         090100     MOVE +91275 TO CORRECT-18V0.                                 NC1164.2 187
   000899         090200     MOVE "MOVE DS-LS-5 TO CS-005" TO RE-MARK.                    NC1164.2 161
   000900         090300 SIG-WRTE-GF-9-4.                                                 NC1164.2
   000901         090400     MOVE 4 TO REC-CT.                                            NC1164.2 203
   000902         090500     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000903         090600 SIG-INIT-GF-10.                                                  NC1164.2
   000904         090700     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000905         090800     MOVE "SIG-TEST-GF-10" TO PAR-NAME.                           NC1164.2 156
   000906         090900     MOVE "SENDING ITEM DS-TS-4" TO FEATURE.                      NC1164.2 152
   000907         091000*        THIS TEST MOVES A NUMERIC ITEM WITH SIGN IS TRAILING     NC1164.2
   000908         091100*    SEPARATE CHARACTER TO UNSIGNED DISPLAY, SIGNED DISPLAY,      NC1164.2
   000909         091200*    UNSIGNED COMPUTATIONAL AND SIGNED COMPUTATIONAL ITEMS.       NC1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300 SIG-TEST-GF-10-1.                                                NC1164.2
   000911         091400     MOVE DS-TS-4 TO DU-005.                                      NC1164.2 75 101
   000912         091500     IF DU-005 NOT EQUAL TO 08036                                 NC1164.2 101
   000913      1  091600         GO TO SIG-FAIL-GF-10-1.                                  NC1164.2 920
   000914         091700     PERFORM PASS.                                                NC1164.2 306
   000915         091800     GO TO SIG-WRTE-GF-10-1.                                      NC1164.2 925
   000916         091900 SIG-DELETE-GF-10-1.                                              NC1164.2
   000917         092000     PERFORM DE-LETE.                                             NC1164.2 308
   000918         092100     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000919         092200     GO TO   SIG-INIT-GF-11.                                      NC1164.2 970
   000920         092300 SIG-FAIL-GF-10-1.                                                NC1164.2
   000921         092400     PERFORM FAIL.                                                NC1164.2 307
   000922         092500     MOVE DU-005 TO COMPUTED-18V0.                                NC1164.2 101 174
   000923         092600     MOVE 08036 TO CORRECT-18V0.                                  NC1164.2 187
   000924         092700     MOVE "MOVE DS-TS-4 TO DU-005" TO RE-MARK.                    NC1164.2 161
   000925         092800 SIG-WRTE-GF-10-1.                                                NC1164.2
   000926         092900     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000927         093000     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000928         093100 SIG-TEST-GF-10-2.                                                NC1164.2
   000929         093200     MOVE DS-TS-4 TO DS-005.                                      NC1164.2 75 102
   000930         093300     IF DS-005 NOT EQUAL TO -08036                                NC1164.2 102
   000931      1  093400         GO TO SIG-FAIL-GF-10-2.                                  NC1164.2 934
   000932         093500     PERFORM PASS.                                                NC1164.2 306
   000933         093600     GO TO SIG-WRTE-GF-10-2.                                      NC1164.2 939
   000934         093700 SIG-FAIL-GF-10-2.                                                NC1164.2
   000935         093800     PERFORM FAIL.                                                NC1164.2 307
   000936         093900     MOVE DS-005 TO COMPUTED-18V0.                                NC1164.2 102 174
   000937         094000     MOVE -08036 TO CORRECT-18V0.                                 NC1164.2 187
   000938         094100     MOVE "MOVE DS-TS-4 TO DS-005" TO RE-MARK.                    NC1164.2 161
   000939         094200 SIG-WRTE-GF-10-2.                                                NC1164.2
   000940         094300     MOVE 2 TO REC-CT.                                            NC1164.2 203
   000941         094400     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000942         094500 SIG-TEST-GF-10-3.                                                NC1164.2
   000943         094600     MOVE DS-TS-4 TO CU-005.                                      NC1164.2 75 103
   000944         094700     IF CU-005 NOT EQUAL TO 08036                                 NC1164.2 103
   000945      1  094800         GO TO SIG-FAIL-GF-10-3.                                  NC1164.2 948
   000946         094900     PERFORM PASS.                                                NC1164.2 306
   000947         095000     GO TO SIG-WRTE-GF-10-3.                                      NC1164.2 953
   000948         095100 SIG-FAIL-GF-10-3.                                                NC1164.2
   000949         095200     PERFORM FAIL.                                                NC1164.2 307
   000950         095300     MOVE CU-005 TO COMPUTED-18V0.                                NC1164.2 103 174
   000951         095400     MOVE 08036 TO CORRECT-18V0.                                  NC1164.2 187
   000952         095500     MOVE "MOVE DS-TS-4 TO CU-005" TO RE-MARK.                    NC1164.2 161
   000953         095600 SIG-WRTE-GF-10-3.                                                NC1164.2
   000954         095700     MOVE 3 TO REC-CT.                                            NC1164.2 203
   000955         095800     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000956         095900 SIG-TEST-GF-10-4.                                                NC1164.2
   000957         096000     MOVE DS-TS-4 TO CS-005.                                      NC1164.2 75 104
   000958         096100     IF CS-005 NOT EQUAL TO -08036                                NC1164.2 104
   000959      1  096200         GO TO SIG-FAIL-GF-10-4.                                  NC1164.2 962
   000960         096300     PERFORM PASS.                                                NC1164.2 306
   000961         096400     GO TO SIG-WRTE-GF-10-4.                                      NC1164.2 967
   000962         096500 SIG-FAIL-GF-10-4.                                                NC1164.2
   000963         096600     PERFORM FAIL.                                                NC1164.2 307
   000964         096700     MOVE CS-005 TO COMPUTED-18V0.                                NC1164.2 104 174
   000965         096800     MOVE -08036 TO CORRECT-18V0.                                 NC1164.2 187
   000966         096900     MOVE "MOVE DS-TS-4 TO CS-005" TO RE-MARK.                    NC1164.2 161
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000 SIG-WRTE-GF-10-4.                                                NC1164.2
   000968         097100     MOVE 4 TO REC-CT.                                            NC1164.2 203
   000969         097200     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000970         097300 SIG-INIT-GF-11.                                                  NC1164.2
   000971         097400     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   000972         097500     MOVE "SIG-TEST-GF-11" TO PAR-NAME.                           NC1164.2 156
   000973         097600     MOVE "SIGN SEPARATE ITEMS" TO FEATURE.                       NC1164.2 152
   000974         097700*        THIS TEST CONTAINS MOVE STATEMENTS WHERE BOTH THE        NC1164.2
   000975         097800*    SENDING AND RECEIVING ITEM HAVE SEPARATE SIGN CHARACTERS.    NC1164.2
   000976         097900 SIG-TEST-GF-11-1.                                                NC1164.2
   000977         098000     MOVE DS-LS-4 TO WRK-DS-LS-5.                                 NC1164.2 63 105
   000978         098100     IF GRP-09 EQUAL TO "-09127"                                  NC1164.2 107
   000979      1  098200         PERFORM PASS                                             NC1164.2 306
   000980      1  098300         GO TO SIG-WRTE-GF-11-1.                                  NC1164.2 991
   000981         098400     GO TO SIG-FAIL-GF-11-1.                                      NC1164.2 986
   000982         098500 SIG-DELETE-GF-11-1.                                              NC1164.2
   000983         098600     PERFORM DE-LETE.                                             NC1164.2 308
   000984         098700     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000985         098800     GO TO   SIG-INIT-GF-12.                                      NC1164.2 1035
   000986         098900 SIG-FAIL-GF-11-1.                                                NC1164.2
   000987         099000     PERFORM FAIL.                                                NC1164.2 307
   000988         099100     MOVE GRP-09 TO COMPUTED-A.                                   NC1164.2 107 167
   000989         099200     MOVE "-09127" TO CORRECT-A.                                  NC1164.2 181
   000990         099300     MOVE "MOVE DS-LS-4 TO WRK-DS-LS-5" TO RE-MARK.               NC1164.2 161
   000991         099400 SIG-WRTE-GF-11-1.                                                NC1164.2
   000992         099500     MOVE 1 TO REC-CT.                                            NC1164.2 203
   000993         099600     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   000994         099700 SIG-TEST-GF-11-2.                                                NC1164.2
   000995         099800     MOVE DS-LS-4 TO WRK-DS-TS-5.                                 NC1164.2 63 108
   000996         099900     IF GRP-10 NOT EQUAL TO "09127-"                              NC1164.2 110
   000997      1  100000         GO TO SIG-FAIL-GF-11-2.                                  NC1164.2 1000
   000998         100100     PERFORM PASS.                                                NC1164.2 306
   000999         100200     GO TO SIG-WRTE-GF-11-2.                                      NC1164.2 1005
   001000         100300 SIG-FAIL-GF-11-2.                                                NC1164.2
   001001         100400     PERFORM FAIL.                                                NC1164.2 307
   001002         100500     MOVE GRP-10 TO COMPUTED-A.                                   NC1164.2 110 167
   001003         100600     MOVE "09127-" TO CORRECT-A.                                  NC1164.2 181
   001004         100700     MOVE "MOVE DS-LS-4 TO WRK-DS-TS-S" TO RE-MARK.               NC1164.2 161
   001005         100800 SIG-WRTE-GF-11-2.                                                NC1164.2
   001006         100900     MOVE 2 TO REC-CT.                                            NC1164.2 203
   001007         101000     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001008         101100 SIG-TEST-GF-11-3.                                                NC1164.2
   001009         101200     MOVE DS-TS-5 TO WRK-DS-LS-5.                                 NC1164.2 69 105
   001010         101300     IF GRP-09 EQUAL TO "+80361"                                  NC1164.2 107
   001011      1  101400         PERFORM PASS                                             NC1164.2 306
   001012      1  101500         GO TO SIG-WRTE-GF-11-3.                                  NC1164.2 1018
   001013         101600 SIG-FAIL-GF-11-3.                                                NC1164.2
   001014         101700     PERFORM FAIL.                                                NC1164.2 307
   001015         101800     MOVE GRP-09 TO COMPUTED-A.                                   NC1164.2 107 167
   001016         101900     MOVE "+80361" TO CORRECT-A.                                  NC1164.2 181
   001017         102000     MOVE "MOVE DS-TS-5 TO WRK-DS-LS-5" TO RE-MARK.               NC1164.2 161
   001018         102100 SIG-WRTE-GF-11-3.                                                NC1164.2
   001019         102200     MOVE 3 TO REC-CT.                                            NC1164.2 203
   001020         102300     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001021         102400 SIG-TEST-GF-11-4.                                                NC1164.2
   001022         102500     MOVE DS-TS-5 TO WRK-DS-TS-5.                                 NC1164.2 69 108
   001023         102600     IF GRP-10 NOT EQUAL TO "80361+"                              NC1164.2 110
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024      1  102700         GO TO SIG-FAIL-GF-11-4.                                  NC1164.2 1027
   001025         102800     PERFORM PASS.                                                NC1164.2 306
   001026         102900     GO TO SIG-WRTE-GF-11-4.                                      NC1164.2 1032
   001027         103000 SIG-FAIL-GF-11-4.                                                NC1164.2
   001028         103100     PERFORM FAIL.                                                NC1164.2 307
   001029         103200     MOVE GRP-10 TO COMPUTED-A.                                   NC1164.2 110 167
   001030         103300     MOVE "80361+" TO CORRECT-A.                                  NC1164.2 181
   001031         103400     MOVE "MOVE DS-TS-5 TO WRK-DS-TS-5" TO RE-MARK.               NC1164.2 161
   001032         103500 SIG-WRTE-GF-11-4.                                                NC1164.2
   001033         103600     MOVE 4 TO REC-CT.                                            NC1164.2 203
   001034         103700     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001035         103800 SIG-INIT-GF-12.                                                  NC1164.2
   001036         103900     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   001037         104000     MOVE "SIG-TEST-GF-12" TO PAR-NAME.                           NC1164.2 156
   001038         104100     MOVE "SIGN CLAUSE ITEMS" TO FEATURE.                         NC1164.2 152
   001039         104200*        THIS TEST CONTAINS MOVE STATEMENTS WITH A SIGN IS        NC1164.2
   001040         104300*    SEPARATE SENDING ITEM AND SIGN CLAUSE RECEIVING ITEMS,       NC1164.2
   001041         104400*    BUT RECEIVING ITEMS SIGNS ARE NOT SEPARATE.                  NC1164.2
   001042         104500 SIG-TEST-GF-12-1.                                                NC1164.2
   001043         104600     MOVE DS-LS-5 TO WRK-DS-L-5.                                  NC1164.2 57 111
   001044         104700     IF WRK-DS-L-5 NOT EQUAL TO +91275                            NC1164.2 111
   001045      1  104800         GO TO SIG-FAIL-GF-12-1.                                  NC1164.2 1052
   001046         104900     PERFORM PASS.                                                NC1164.2 306
   001047         105000     GO TO SIG-WRTE-GF-12-1.                                      NC1164.2 1057
   001048         105100 SIG-DELETE-GF-12-1.                                              NC1164.2
   001049         105200     PERFORM DE-LETE.                                             NC1164.2 308
   001050         105300     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001051         105400     GO TO   SIG-INIT-GF-13.                                      NC1164.2 1102
   001052         105500 SIG-FAIL-GF-12-1.                                                NC1164.2
   001053         105600     PERFORM FAIL.                                                NC1164.2 307
   001054         105700     MOVE WRK-DS-L-5 TO COMPUTED-18V0.                            NC1164.2 111 174
   001055         105800     MOVE "+91275" TO CORRECT-A.                                  NC1164.2 181
   001056         105900     MOVE "MOVE DS-LS-5 TO WRK-DS-L-5" TO RE-MARK.                NC1164.2 161
   001057         106000 SIG-WRTE-GF-12-1.                                                NC1164.2
   001058         106100     MOVE 1 TO REC-CT.                                            NC1164.2 203
   001059         106200     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001060         106300 SIG-TEST-GF-12-2.                                                NC1164.2
   001061         106400     MOVE DS-LS-5 TO WRK-DS-T-5.                                  NC1164.2 57 113
   001062         106500     IF WRK-DS-T-5 NOT EQUAL TO +91275                            NC1164.2 113
   001063      1  106600         GO TO SIG-FAIL-GF-12-2.                                  NC1164.2 1066
   001064         106700     PERFORM PASS.                                                NC1164.2 306
   001065         106800     GO TO SIG-WRTE-GF-12-2.                                      NC1164.2 1071
   001066         106900 SIG-FAIL-GF-12-2.                                                NC1164.2
   001067         107000     PERFORM FAIL.                                                NC1164.2 307
   001068         107100     MOVE "+91275" TO CORRECT-A.                                  NC1164.2 181
   001069         107200     MOVE WRK-DS-T-5 TO COMPUTED-18V0.                            NC1164.2 113 174
   001070         107300     MOVE "MOVE DS-LS-5 TO WRK-DS-T-5" TO RE-MARK.                NC1164.2 161
   001071         107400 SIG-WRTE-GF-12-2.                                                NC1164.2
   001072         107500     MOVE 2 TO REC-CT.                                            NC1164.2 203
   001073         107600     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001074         107700 SIG-TEST-GF-12-3.                                                NC1164.2
   001075         107800     MOVE DS-TS-5 TO WRK-DS-L-5.                                  NC1164.2 69 111
   001076         107900     IF WRK-DS-L-5 NOT EQUAL TO +80361                            NC1164.2 111
   001077      1  108000         GO TO SIG-FAIL-GF-12-3.                                  NC1164.2 1080
   001078         108100     PERFORM PASS.                                                NC1164.2 306
   001079         108200     GO TO SIG-WRITE-GF-12-3.                                     NC1164.2 1085
   001080         108300 SIG-FAIL-GF-12-3.                                                NC1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400     PERFORM FAIL.                                                NC1164.2 307
   001082         108500     MOVE "+80361" TO CORRECT-A.                                  NC1164.2 181
   001083         108600     MOVE WRK-DS-L-5 TO COMPUTED-18V0.                            NC1164.2 111 174
   001084         108700     MOVE "MOVE DS-TS-5 TO WRK-DS-L-5" TO RE-MARK.                NC1164.2 161
   001085         108800 SIG-WRITE-GF-12-3.                                               NC1164.2
   001086         108900     MOVE 3 TO REC-CT.                                            NC1164.2 203
   001087         109000     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001088         109100 SIG-TEST-GF-12-4.                                                NC1164.2
   001089         109200     MOVE DS-TS-5 TO WRK-DS-T-5.                                  NC1164.2 69 113
   001090         109300     IF WRK-DS-T-5 NOT EQUAL TO +80361                            NC1164.2 113
   001091      1  109400         GO TO SIG-FAIL-GF-12-4.                                  NC1164.2 1094
   001092         109500     PERFORM PASS.                                                NC1164.2 306
   001093         109600     GO TO SIG-WRITE-GF-12-4.                                     NC1164.2 1099
   001094         109700 SIG-FAIL-GF-12-4.                                                NC1164.2
   001095         109800     PERFORM FAIL.                                                NC1164.2 307
   001096         109900     MOVE "+80361" TO CORRECT-A.                                  NC1164.2 181
   001097         110000     MOVE WRK-DS-T-5 TO COMPUTED-18V0.                            NC1164.2 113 174
   001098         110100     MOVE "MOVE DS-TS-5 TO WRK-DS-T-5" TO RE-MARK.                NC1164.2 161
   001099         110200 SIG-WRITE-GF-12-4.                                               NC1164.2
   001100         110300     MOVE 4 TO REC-CT.                                            NC1164.2 203
   001101         110400     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001102         110500 SIG-INIT-GF-13.                                                  NC1164.2
   001103         110600     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   001104         110700     MOVE "SIG-TEST-GF-13" TO PAR-NAME.                           NC1164.2 156
   001105         110800*        THIS TEST CONTAINS MOVE STATEMENTS WITH A SIGN IS        NC1164.2
   001106         110900*    SEPARATE RECEIVING ITEM AND SENDING ITEMS WITH A SIGN        NC1164.2
   001107         111000*    CLAUSE BUT THE SIGN IS NOT SEPARATE.                         NC1164.2
   001108         111100     MOVE ZERO TO WRK-DS-LS-5.                                    NC1164.2 IMP 105
   001109         111200     MOVE ZERO TO WRK-DS-TS-5.                                    NC1164.2 IMP 108
   001110         111300 SIG-TEST-GF-13-1.                                                NC1164.2
   001111         111400     MOVE DS-L-5 TO WRK-DS-LS-5.                                  NC1164.2 81 105
   001112         111500     IF GRP-09 EQUAL TO "+91275"                                  NC1164.2 107
   001113      1  111600         PERFORM PASS                                             NC1164.2 306
   001114      1  111700         GO TO SIG-WRITE-GF-13-1.                                 NC1164.2 1125
   001115         111800     GO TO SIG-FAIL-GF-13-1.                                      NC1164.2 1120
   001116         111900 SIG-DELETE-GF-13-1.                                              NC1164.2
   001117         112000     PERFORM DE-LETE.                                             NC1164.2 308
   001118         112100     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001119         112200     GO TO   SIG-INIT-GF-14.                                      NC1164.2 1167
   001120         112300 SIG-FAIL-GF-13-1.                                                NC1164.2
   001121         112400     PERFORM FAIL.                                                NC1164.2 307
   001122         112500     MOVE GRP-09 TO COMPUTED-A.                                   NC1164.2 107 167
   001123         112600     MOVE "+91275" TO CORRECT-A.                                  NC1164.2 181
   001124         112700     MOVE "MOVE DS-L-5 TO WRK-DS-LS-5" TO RE-MARK.                NC1164.2 161
   001125         112800 SIG-WRITE-GF-13-1.                                               NC1164.2
   001126         112900     MOVE 1 TO REC-CT.                                            NC1164.2 203
   001127         113000     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001128         113100 SIG-TEST-GF-13-2.                                                NC1164.2
   001129         113200     MOVE DS-T-4 TO WRK-DS-LS-5.                                  NC1164.2 96 105
   001130         113300     IF GRP-09 EQUAL TO "-03621"                                  NC1164.2 107
   001131      1  113400         PERFORM PASS                                             NC1164.2 306
   001132      1  113500         GO TO SIG-WRITE-GF-13-2.                                 NC1164.2 1138
   001133         113600 SIG-FAIL-GF-13-2.                                                NC1164.2
   001134         113700     PERFORM FAIL.                                                NC1164.2 307
   001135         113800     MOVE GRP-09 TO COMPUTED-A.                                   NC1164.2 107 167
   001136         113900     MOVE "-03621" TO CORRECT-A.                                  NC1164.2 181
   001137         114000     MOVE "MOVE DS-T-4 TO WRK-DS-LS-5" TO RE-MARK.                NC1164.2 161
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100 SIG-WRITE-GF-13-2.                                               NC1164.2
   001139         114200     MOVE 2 TO REC-CT.                                            NC1164.2 203
   001140         114300     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001141         114400 SIG-TEST-GF-13-3.                                                NC1164.2
   001142         114500     MOVE DS-L-5 TO WRK-DS-TS-5.                                  NC1164.2 81 108
   001143         114600     IF GRP-10 EQUAL TO "91275+"                                  NC1164.2 110
   001144      1  114700         PERFORM PASS                                             NC1164.2 306
   001145      1  114800         GO TO SIG-WRITE-GF-13-3.                                 NC1164.2 1151
   001146         114900 SIG-FAIL-GF-13-3.                                                NC1164.2
   001147         115000     PERFORM FAIL.                                                NC1164.2 307
   001148         115100     MOVE GRP-10 TO COMPUTED-A.                                   NC1164.2 110 167
   001149         115200     MOVE "91275+" TO CORRECT-A.                                  NC1164.2 181
   001150         115300     MOVE "MOVE DS-L-5 TO WRK-DS-TS-5" TO RE-MARK.                NC1164.2 161
   001151         115400 SIG-WRITE-GF-13-3.                                               NC1164.2
   001152         115500     MOVE 3 TO REC-CT.                                            NC1164.2 203
   001153         115600     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001154         115700 SIG-TEST-GF-13-4.                                                NC1164.2
   001155         115800     MOVE DS-T-4 TO WRK-DS-TS-5.                                  NC1164.2 96 108
   001156         115900     IF GRP-10 EQUAL TO "03621-"                                  NC1164.2 110
   001157      1  116000         PERFORM PASS                                             NC1164.2 306
   001158      1  116100         GO TO SIG-WRITE-GF-13-4.                                 NC1164.2 1164
   001159         116200 SIG-FAIL-GF-13-4.                                                NC1164.2
   001160         116300     PERFORM FAIL.                                                NC1164.2 307
   001161         116400     MOVE GRP-10 TO COMPUTED-A.                                   NC1164.2 110 167
   001162         116500     MOVE "03621-" TO CORRECT-A.                                  NC1164.2 181
   001163         116600     MOVE "MOVE DS-T-4 TO WRK-DS-TS-5" TO RE-MARK.                NC1164.2 161
   001164         116700 SIG-WRITE-GF-13-4.                                               NC1164.2
   001165         116800     MOVE 4 TO REC-CT.                                            NC1164.2 203
   001166         116900     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001167         117000 SIG-INIT-GF-14.                                                  NC1164.2
   001168         117100     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   001169         117200     MOVE "SIG-TEST-GF-14" TO PAR-NAME.                           NC1164.2 156
   001170         117300     MOVE "SIGNED NUM. TO ALPHA" TO FEATURE.                      NC1164.2 152
   001171         117400*        THIS TEST CONTAINS MOVE STATEMENTS WITH A SIGNED         NC1164.2
   001172         117500*    NUMERIC SENDING ITEM AND ALPHANUMERIC RECEIVING ITEM.        NC1164.2
   001173         117600*    THE OPERATIONAL SIGN SHOULD NOT BE MOVED AND SPACE           NC1164.2
   001174         117700*    FILLING ON THE RIGHT SHOULD OCCUR.                           NC1164.2
   001175         117800 SIG-TEST-GF-14-1.                                                NC1164.2
   001176         117900     MOVE DS-LS-5 TO AN-006.                                      NC1164.2 57 115
   001177         118000     IF AN-006 EQUAL TO "91275 "                                  NC1164.2 115
   001178      1  118100         PERFORM PASS                                             NC1164.2 306
   001179      1  118200         GO TO SIG-WRITE-GF-14-1.                                 NC1164.2 1190
   001180         118300     GO TO SIG-FAIL-GF-14-1.                                      NC1164.2 1185
   001181         118400 SIG-DELETE-GF-14-1.                                              NC1164.2
   001182         118500     PERFORM DE-LETE.                                             NC1164.2 308
   001183         118600     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001184         118700     GO TO   SIG-INIT-GF-15.                                      NC1164.2 1237
   001185         118800 SIG-FAIL-GF-14-1.                                                NC1164.2
   001186         118900     PERFORM FAIL.                                                NC1164.2 307
   001187         119000     MOVE AN-006 TO COMPUTED-A.                                   NC1164.2 115 167
   001188         119100     MOVE "91275 " TO CORRECT-A.                                  NC1164.2 181
   001189         119200     MOVE "MOVE DS-LS-5 TO AN-006" TO RE-MARK.                    NC1164.2 161
   001190         119300 SIG-WRITE-GF-14-1.                                               NC1164.2
   001191         119400     MOVE 1 TO REC-CT.                                            NC1164.2 203
   001192         119500     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001193         119600 SIG-TEST-GF-14-2.                                                NC1164.2
   001194         119700     MOVE SPACE TO AN-006.                                        NC1164.2 IMP 115
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800     MOVE DS-TS-4 TO AN-006.                                      NC1164.2 75 115
   001196         119900     IF AN-006 NOT EQUAL TO "8036  "                              NC1164.2 115
   001197      1  120000         GO TO SIG-FAIL-GF-14-2.                                  NC1164.2 1200
   001198         120100     PERFORM PASS.                                                NC1164.2 306
   001199         120200     GO TO SIG-WRITE-GF-14-2.                                     NC1164.2 1205
   001200         120300 SIG-FAIL-GF-14-2.                                                NC1164.2
   001201         120400     PERFORM FAIL.                                                NC1164.2 307
   001202         120500     MOVE AN-006 TO COMPUTED-A.                                   NC1164.2 115 167
   001203         120600     MOVE "8036  " TO CORRECT-A.                                  NC1164.2 181
   001204         120700     MOVE "MOVE DS-TS-4 TO AN-006" TO RE-MARK.                    NC1164.2 161
   001205         120800 SIG-WRITE-GF-14-2.                                               NC1164.2
   001206         120900     MOVE 2 TO REC-CT.                                            NC1164.2 203
   001207         121000     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001208         121100 SIG-TEST-GF-14-3.                                                NC1164.2
   001209         121200     MOVE SPACE TO AN-006.                                        NC1164.2 IMP 115
   001210         121300     MOVE DS-L-4 TO AN-006.                                       NC1164.2 86 115
   001211         121400     IF AN-006 EQUAL TO "9127  "                                  NC1164.2 115
   001212      1  121500         PERFORM PASS                                             NC1164.2 306
   001213      1  121600         GO TO SIG-WRITE-GF-14-3.                                 NC1164.2 1219
   001214         121700 SIG-FAIL-GF-14-3.                                                NC1164.2
   001215         121800     PERFORM FAIL.                                                NC1164.2 307
   001216         121900     MOVE AN-006 TO COMPUTED-A.                                   NC1164.2 115 167
   001217         122000     MOVE "9127  " TO CORRECT-A.                                  NC1164.2 181
   001218         122100     MOVE "MOVE DS-L-4 TO AN-006" TO RE-MARK.                     NC1164.2 161
   001219         122200 SIG-WRITE-GF-14-3.                                               NC1164.2
   001220         122300     MOVE 3 TO REC-CT.                                            NC1164.2 203
   001221         122400     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001222         122500 SIG-TEST-GF-14-4.                                                NC1164.2
   001223         122600     MOVE SPACE TO AN-006.                                        NC1164.2 IMP 115
   001224         122700     MOVE DS-T-5 TO AN-006.                                       NC1164.2 91 115
   001225         122800     IF AN-006 NOT EQUAL TO "83621 "                              NC1164.2 115
   001226      1  122900         GO TO SIG-FAIL-GF-14-4.                                  NC1164.2 1229
   001227         123000     PERFORM PASS.                                                NC1164.2 306
   001228         123100     GO TO SIG-WRITE-GF-14-4.                                     NC1164.2 1234
   001229         123200 SIG-FAIL-GF-14-4.                                                NC1164.2
   001230         123300     PERFORM FAIL.                                                NC1164.2 307
   001231         123400     MOVE AN-006 TO COMPUTED-A.                                   NC1164.2 115 167
   001232         123500     MOVE "83621 " TO CORRECT-A.                                  NC1164.2 181
   001233         123600     MOVE "MOVE DS-T-5 TO AN-006" TO RE-MARK.                     NC1164.2 161
   001234         123700 SIG-WRITE-GF-14-4.                                               NC1164.2
   001235         123800     MOVE 4 TO REC-CT.                                            NC1164.2 203
   001236         123900     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001237         124000 SIG-INIT-GF-15.                                                  NC1164.2
   001238         124100     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   001239         124200     MOVE "SIG-TEST-GF-15" TO PAR-NAME.                           NC1164.2 156
   001240         124300     MOVE 15759 TO DU-005 CU-005.                                 NC1164.2 101 103
   001241         124400     MOVE -15759 TO DS-005 CS-005.                                NC1164.2 102 104
   001242         124500*        THIS TEST MOVES SIGNED AND UNSIGNED DISPLAY ITEMS,       NC1164.2
   001243         124600*    SIGNED AND UNSIGNED COMPUTATIONAL ITEMS, AND SIGNED AND      NC1164.2
   001244         124700*    UNSIGNED NUMERIC LITERALS TO A NUMERIC ITEM WITH SIGN        NC1164.2
   001245         124800*    LEADING SEPARATE.                                            NC1164.2
   001246         124900     MOVE "RECEIVING ITEM DS-LS" TO FEATURE.                      NC1164.2 152
   001247         125000 SIG-TEST-GF-15-1.                                                NC1164.2
   001248         125100     MOVE SPACE TO GRP-09.                                        NC1164.2 IMP 107
   001249         125200     MOVE DU-005 TO WRK-DS-LS-5.                                  NC1164.2 101 105
   001250         125300     IF GRP-09 EQUAL TO "+15759"                                  NC1164.2 107
   001251      1  125400         PERFORM PASS                                             NC1164.2 306
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252      1  125500         GO TO SIG-WRITE-GF-15-1.                                 NC1164.2 1263
   001253         125600     GO TO SIG-FAIL-GF-15-1.                                      NC1164.2 1258
   001254         125700 SIG-DELETE-GF-15-1.                                              NC1164.2
   001255         125800     PERFORM DE-LETE.                                             NC1164.2 308
   001256         125900     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001257         126000     GO TO   SIG-INIT-GF-16.                                      NC1164.2 1339
   001258         126100 SIG-FAIL-GF-15-1.                                                NC1164.2
   001259         126200     PERFORM FAIL.                                                NC1164.2 307
   001260         126300     MOVE GRP-09 TO COMPUTED-A.                                   NC1164.2 107 167
   001261         126400     MOVE "+15759" TO CORRECT-A.                                  NC1164.2 181
   001262         126500     MOVE "MOVE DU-005 TO WRK-DS-LS-5" TO RE-MARK.                NC1164.2 161
   001263         126600 SIG-WRITE-GF-15-1.                                               NC1164.2
   001264         126700     MOVE 1 TO REC-CT.                                            NC1164.2 203
   001265         126800     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001266         126900 SIG-TEST-GF-15-2.                                                NC1164.2
   001267         127000     MOVE SPACE TO GRP-09.                                        NC1164.2 IMP 107
   001268         127100     MOVE CU-005 TO WRK-DS-LS-5.                                  NC1164.2 103 105
   001269         127200     IF GRP-09 NOT EQUAL TO "+15759"                              NC1164.2 107
   001270      1  127300         GO TO SIG-FAIL-GF-15-2.                                  NC1164.2 1273
   001271         127400     PERFORM PASS                                                 NC1164.2 306
   001272         127500     GO TO SIG-WRITE-GF-15-2.                                     NC1164.2 1278
   001273         127600 SIG-FAIL-GF-15-2.                                                NC1164.2
   001274         127700     PERFORM FAIL.                                                NC1164.2 307
   001275         127800     MOVE GRP-09 TO COMPUTED-A.                                   NC1164.2 107 167
   001276         127900     MOVE "+15759" TO CORRECT-A.                                  NC1164.2 181
   001277         128000     MOVE "MOVE CU-005 TO WRK-DS-LS-5" TO RE-MARK.                NC1164.2 161
   001278         128100 SIG-WRITE-GF-15-2.                                               NC1164.2
   001279         128200     MOVE 2 TO REC-CT.                                            NC1164.2 203
   001280         128300     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001281         128400 SIG-TEST-GF-15-3.                                                NC1164.2
   001282         128500     MOVE SPACE TO GRP-09.                                        NC1164.2 IMP 107
   001283         128600     MOVE DS-005 TO WRK-DS-LS-5.                                  NC1164.2 102 105
   001284         128700     IF GRP-09 EQUAL TO "-15759"                                  NC1164.2 107
   001285      1  128800         PERFORM PASS                                             NC1164.2 306
   001286      1  128900         GO TO SIG-WRITE-GF-15-3.                                 NC1164.2 1292
   001287         129000 SIG-FAIL-GF-15-3.                                                NC1164.2
   001288         129100     PERFORM FAIL.                                                NC1164.2 307
   001289         129200     MOVE GRP-09 TO COMPUTED-A.                                   NC1164.2 107 167
   001290         129300     MOVE "-15759" TO CORRECT-A.                                  NC1164.2 181
   001291         129400     MOVE "MOVE DS-005 TO WRK-DS-LS-5" TO RE-MARK.                NC1164.2 161
   001292         129500 SIG-WRITE-GF-15-3.                                               NC1164.2
   001293         129600     MOVE 3 TO REC-CT.                                            NC1164.2 203
   001294         129700     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001295         129800 SIG-TEST-GF-15-4.                                                NC1164.2
   001296         129900     MOVE SPACE TO GRP-09.                                        NC1164.2 IMP 107
   001297         130000     MOVE CS-005 TO WRK-DS-LS-5.                                  NC1164.2 104 105
   001298         130100     IF GRP-09 NOT EQUAL TO "-15759"                              NC1164.2 107
   001299      1  130200         GO TO SIG-FAIL-GF-15-4.                                  NC1164.2 1302
   001300         130300     PERFORM PASS.                                                NC1164.2 306
   001301         130400     GO TO SIG-WRITE-GF-15-4.                                     NC1164.2 1307
   001302         130500 SIG-FAIL-GF-15-4.                                                NC1164.2
   001303         130600     PERFORM FAIL.                                                NC1164.2 307
   001304         130700     MOVE GRP-09 TO COMPUTED-A.                                   NC1164.2 107 167
   001305         130800     MOVE "-15759" TO CORRECT-A.                                  NC1164.2 181
   001306         130900     MOVE "MOVE CS-005 TO WRK-DS-LS-5" TO RE-MARK.                NC1164.2 161
   001307         131000 SIG-WRITE-GF-15-4.                                               NC1164.2
   001308         131100     MOVE 4 TO REC-CT.                                            NC1164.2 203
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131200     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001310         131300 SIG-TEST-GF-15-5.                                                NC1164.2
   001311         131400     MOVE SPACE TO GRP-09.                                        NC1164.2 IMP 107
   001312         131500     MOVE 15759 TO WRK-DS-LS-5.                                   NC1164.2 105
   001313         131600     IF GRP-09 EQUAL TO "+15759"                                  NC1164.2 107
   001314      1  131700         PERFORM PASS                                             NC1164.2 306
   001315      1  131800         GO TO SIG-WRITE-GF-15-5.                                 NC1164.2 1321
   001316         131900 SIG-FAIL-GF-15-5.                                                NC1164.2
   001317         132000     PERFORM FAIL.                                                NC1164.2 307
   001318         132100     MOVE "+15759" TO CORRECT-A.                                  NC1164.2 181
   001319         132200     MOVE GRP-09 TO COMPUTED-A.                                   NC1164.2 107 167
   001320         132300     MOVE "MOVE 15759 TO WRK-DS-LS-5" TO RE-MARK.                 NC1164.2 161
   001321         132400 SIG-WRITE-GF-15-5.                                               NC1164.2
   001322         132500     MOVE 5 TO REC-CT.                                            NC1164.2 203
   001323         132600     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001324         132700 SIG-TEST-GF-15-6.                                                NC1164.2
   001325         132800     MOVE SPACE TO GRP-09.                                        NC1164.2 IMP 107
   001326         132900     MOVE -15759 TO WRK-DS-LS-5.                                  NC1164.2 105
   001327         133000     IF GRP-09 NOT EQUAL TO "-15759"                              NC1164.2 107
   001328      1  133100         GO TO SIG-FAIL-GF-15-6.                                  NC1164.2 1331
   001329         133200     PERFORM PASS.                                                NC1164.2 306
   001330         133300     GO TO SIG-WRITE-GF-15-6.                                     NC1164.2 1336
   001331         133400 SIG-FAIL-GF-15-6.                                                NC1164.2
   001332         133500     PERFORM FAIL.                                                NC1164.2 307
   001333         133600     MOVE GRP-09 TO COMPUTED-A.                                   NC1164.2 107 167
   001334         133700     MOVE "-15759" TO CORRECT-A.                                  NC1164.2 181
   001335         133800     MOVE "MOVE -15759 TO WRK-DS-LS-5" TO RE-MARK.                NC1164.2 161
   001336         133900 SIG-WRITE-GF-15-6.                                               NC1164.2
   001337         134000     MOVE 6 TO REC-CT.                                            NC1164.2 203
   001338         134100     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001339         134200 SIG-INIT-GF-16.                                                  NC1164.2
   001340         134300     MOVE "VI-42 5.12.4"  TO ANSI-REFERENCE.                      NC1164.2 212
   001341         134400     MOVE "SIG-TEST-GF-16" TO PAR-NAME.                           NC1164.2 156
   001342         134500     MOVE "RECEIVING ITEM DS-TS" TO FEATURE.                      NC1164.2 152
   001343         134600*        THIS TEST MOVES SIGNED AND UNSIGNED DISPLAY ITEMS,       NC1164.2
   001344         134700*    SIGNED AND UNSIGNED COMPUTATIONAL ITEMS, AND SIGNED AND      NC1164.2
   001345         134800*    UNSIGNED NUMERIC LITERALS TO A NUMERIC ITEM WITH SIGN        NC1164.2
   001346         134900*    TRAILING SEPARATE CLAUSE.                                    NC1164.2
   001347         135000     MOVE SPACE TO GRP-10.                                        NC1164.2 IMP 110
   001348         135100     MOVE DU-005 TO WRK-DS-TS-5.                                  NC1164.2 101 108
   001349         135200 SIG-TEST-GF-16-1.                                                NC1164.2
   001350         135300     IF GRP-10 EQUAL TO "15759+"                                  NC1164.2 110
   001351      1  135400         PERFORM PASS                                             NC1164.2 306
   001352      1  135500         GO TO SIG-WRITE-GF-16-1.                                 NC1164.2 1363
   001353         135600     GO TO SIG-FAIL-GF-16-1.                                      NC1164.2 1358
   001354         135700 SIG-DELETE-GF-16-1.                                              NC1164.2
   001355         135800     PERFORM DE-LETE.                                             NC1164.2 308
   001356         135900     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001357         136000     GO TO   SIG-INIT-GF-17.                                      NC1164.2 1440
   001358         136100 SIG-FAIL-GF-16-1.                                                NC1164.2
   001359         136200     PERFORM FAIL.                                                NC1164.2 307
   001360         136300     MOVE GRP-10 TO COMPUTED-A.                                   NC1164.2 110 167
   001361         136400     MOVE "15759+" TO CORRECT-A.                                  NC1164.2 181
   001362         136500     MOVE "MOVE DU-005 TO WRK-DS-TS-5" TO RE-MARK.                NC1164.2 161
   001363         136600 SIG-WRITE-GF-16-1.                                               NC1164.2
   001364         136700     MOVE 1 TO REC-CT.                                            NC1164.2 203
   001365         136800     PERFORM PRINT-DETAIL.                                        NC1164.2 310
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         136900 SIG-TEST-GF-16-2.                                                NC1164.2
   001367         137000     MOVE SPACE TO GRP-10.                                        NC1164.2 IMP 110
   001368         137100     MOVE CU-005 TO WRK-DS-TS-5.                                  NC1164.2 103 108
   001369         137200     IF GRP-10 NOT EQUAL TO "15759+"                              NC1164.2 110
   001370      1  137300         GO TO SIG-FAIL-GF-16-2.                                  NC1164.2 1373
   001371         137400     PERFORM PASS.                                                NC1164.2 306
   001372         137500     GO TO SIG-WRITE-GF-16-2.                                     NC1164.2 1378
   001373         137600 SIG-FAIL-GF-16-2.                                                NC1164.2
   001374         137700     PERFORM FAIL.                                                NC1164.2 307
   001375         137800     MOVE GRP-10 TO COMPUTED-A.                                   NC1164.2 110 167
   001376         137900     MOVE "15759+" TO CORRECT-A.                                  NC1164.2 181
   001377         138000     MOVE "MOVE CU-005 TO WRK-DS-TS-5" TO RE-MARK.                NC1164.2 161
   001378         138100 SIG-WRITE-GF-16-2.                                               NC1164.2
   001379         138200     MOVE 2 TO REC-CT.                                            NC1164.2 203
   001380         138300     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001381         138400 SIG-TEST-GF-16-3.                                                NC1164.2
   001382         138500     MOVE SPACE TO GRP-10.                                        NC1164.2 IMP 110
   001383         138600     MOVE DS-005 TO WRK-DS-TS-5.                                  NC1164.2 102 108
   001384         138700     IF GRP-10 EQUAL TO "15759-"                                  NC1164.2 110
   001385      1  138800         PERFORM PASS                                             NC1164.2 306
   001386      1  138900         GO TO SIG-WRITE-GF-16-3.                                 NC1164.2 1392
   001387         139000 SIG-FAIL-GF-16-3.                                                NC1164.2
   001388         139100     PERFORM FAIL.                                                NC1164.2 307
   001389         139200     MOVE GRP-10 TO COMPUTED-A.                                   NC1164.2 110 167
   001390         139300     MOVE "15759-" TO CORRECT-A.                                  NC1164.2 181
   001391         139400     MOVE "MOVE DS-005 TO WRK-DS-TS-5" TO RE-MARK.                NC1164.2 161
   001392         139500 SIG-WRITE-GF-16-3.                                               NC1164.2
   001393         139600     MOVE 3 TO REC-CT.                                            NC1164.2 203
   001394         139700     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001395         139800 SIG-TEST-GF-16-4.                                                NC1164.2
   001396         139900     MOVE SPACE TO GRP-10.                                        NC1164.2 IMP 110
   001397         140000     MOVE CS-005 TO WRK-DS-TS-5.                                  NC1164.2 104 108
   001398         140100     IF GRP-10 NOT EQUAL TO "15759-"                              NC1164.2 110
   001399      1  140200         GO TO SIG-FAIL-GF-16-4.                                  NC1164.2 1402
   001400         140300     PERFORM PASS.                                                NC1164.2 306
   001401         140400     GO TO SIG-WRITE-GF-16-4.                                     NC1164.2 1407
   001402         140500 SIG-FAIL-GF-16-4.                                                NC1164.2
   001403         140600     PERFORM FAIL.                                                NC1164.2 307
   001404         140700     MOVE GRP-10 TO COMPUTED-A.                                   NC1164.2 110 167
   001405         140800     MOVE "15759-" TO CORRECT-A.                                  NC1164.2 181
   001406         140900     MOVE "MOVE CS-005 TO WRK-DS-TS-5" TO RE-MARK.                NC1164.2 161
   001407         141000 SIG-WRITE-GF-16-4.                                               NC1164.2
   001408         141100     MOVE 4 TO REC-CT.                                            NC1164.2 203
   001409         141200     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001410         141300 SIG-TEST-GF-16-5.                                                NC1164.2
   001411         141400     MOVE SPACE TO GRP-10.                                        NC1164.2 IMP 110
   001412         141500     MOVE 15759 TO WRK-DS-TS-5.                                   NC1164.2 108
   001413         141600     IF GRP-10 EQUAL TO "15759+"                                  NC1164.2 110
   001414      1  141700         PERFORM PASS                                             NC1164.2 306
   001415      1  141800         GO TO SIG-WRITE-GF-16-5.                                 NC1164.2 1421
   001416         141900 SIG-FAIL-GF-16-5.                                                NC1164.2
   001417         142000     PERFORM FAIL.                                                NC1164.2 307
   001418         142100     MOVE GRP-10 TO COMPUTED-A.                                   NC1164.2 110 167
   001419         142200     MOVE "15759+" TO CORRECT-A.                                  NC1164.2 181
   001420         142300     MOVE "MOVE 15759 TO WRK-DS-TS-5" TO RE-MARK.                 NC1164.2 161
   001421         142400 SIG-WRITE-GF-16-5.                                               NC1164.2
   001422         142500     MOVE 5 TO REC-CT.                                            NC1164.2 203
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142600     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001424         142700 SIG-TEST-GF-16-6.                                                NC1164.2
   001425         142800     MOVE SPACE TO GRP-10.                                        NC1164.2 IMP 110
   001426         142900     MOVE -15759 TO WRK-DS-TS-5.                                  NC1164.2 108
   001427         143000     IF GRP-10 NOT EQUAL TO "15759-"                              NC1164.2 110
   001428      1  143100        GO TO SIG-FAIL-GF-16-6.                                   NC1164.2 1431
   001429         143200     PERFORM PASS.                                                NC1164.2 306
   001430         143300     GO TO SIG-WRITE-GF-16-6.                                     NC1164.2 1436
   001431         143400 SIG-FAIL-GF-16-6.                                                NC1164.2
   001432         143500     PERFORM FAIL.                                                NC1164.2 307
   001433         143600     MOVE GRP-10 TO COMPUTED-A.                                   NC1164.2 110 167
   001434         143700     MOVE "15759-" TO CORRECT-A.                                  NC1164.2 181
   001435         143800     MOVE "MOVE -15759 TO WRK-DS-TS-5" TO RE-MARK.                NC1164.2 161
   001436         143900 SIG-WRITE-GF-16-6.                                               NC1164.2
   001437         144000     MOVE 6 TO REC-CT.                                            NC1164.2 203
   001438         144100     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001439         144200*                                                                 NC1164.2
   001440         144300 SIG-INIT-GF-17.                                                  NC1164.2
   001441         144400     MOVE   "VI-42 5.12.4 GR2"  TO ANSI-REFERENCE.                NC1164.2 212
   001442         144500     MOVE   "SIG-TEST-GF-17" TO PAR-NAME.                         NC1164.2 156
   001443         144600     MOVE   "PRECEDENCE OF SUBORDINATE SIGN CLAUSE" TO FEATURE.   NC1164.2 152
   001444         144700     MOVE    1234 TO TEST-17-C.                                   NC1164.2 45
   001445         144800     MOVE    0 TO REC-CT.                                         NC1164.2 203
   001446         144900 SIG-TEST-GF-17.                                                  NC1164.2
   001447         145000     IF      TEST-17-C-SIGN = "+"                                 NC1164.2 47
   001448      1  145100             PERFORM PASS                                         NC1164.2 306
   001449      1  145200             GO TO   SIG-WRITE-GF-17                              NC1164.2 1460
   001450         145300     ELSE                                                         NC1164.2
   001451      1  145400             GO TO   SIG-FAIL-GF-17.                              NC1164.2 1455
   001452         145500 SIG-DELETE-GF-17.                                                NC1164.2
   001453         145600     PERFORM DE-LETE.                                             NC1164.2 308
   001454         145700     GO TO   SIG-WRITE-GF-17.                                     NC1164.2 1460
   001455         145800 SIG-FAIL-GF-17.                                                  NC1164.2
   001456         145900     PERFORM FAIL.                                                NC1164.2 307
   001457         146000     MOVE   "POSITIVE SIGN EXPECTED" TO RE-MARK.                  NC1164.2 161
   001458         146100     MOVE   "+"             TO CORRECT-X.                         NC1164.2 180
   001459         146200     MOVE    TEST-17-C-SIGN TO COMPUTED-X.                        NC1164.2 47 166
   001460         146300 SIG-WRITE-GF-17.                                                 NC1164.2
   001461         146400     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001462         146500*                                                                 NC1164.2
   001463         146600 SIG-INIT-GF-18.                                                  NC1164.2
   001464         146700     MOVE   "VI-42 5.12.4 GR3"  TO ANSI-REFERENCE.                NC1164.2 212
   001465         146800     MOVE   "SIG-TEST-GF-18" TO PAR-NAME.                         NC1164.2 156
   001466         146900     MOVE   "PRECEDENCE OF SUBORDINATE SIGN CLAUSE" TO FEATURE.   NC1164.2 152
   001467         147000     MOVE    1234 TO TEST-18-B.                                   NC1164.2 52
   001468         147100     MOVE    0 TO REC-CT.                                         NC1164.2 203
   001469         147200 SIG-TEST-GF-18.                                                  NC1164.2
   001470         147300     IF      TEST-18-B-SIGN = "+"                                 NC1164.2 54
   001471      1  147400             PERFORM PASS                                         NC1164.2 306
   001472      1  147500             GO TO   SIG-WRITE-GF-18                              NC1164.2 1483
   001473         147600     ELSE                                                         NC1164.2
   001474      1  147700             GO TO   SIG-FAIL-GF-18.                              NC1164.2 1478
   001475         147800 SIG-DELETE-GF-18.                                                NC1164.2
   001476         147900     PERFORM DE-LETE.                                             NC1164.2 308
   001477         148000     GO TO   SIG-WRITE-GF-18.                                     NC1164.2 1483
   001478         148100 SIG-FAIL-GF-18.                                                  NC1164.2
   001479         148200     PERFORM FAIL.                                                NC1164.2 307
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148300     MOVE   "POSITIVE SIGN EXPECTED" TO RE-MARK.                  NC1164.2 161
   001481         148400     MOVE   "+"             TO CORRECT-X.                         NC1164.2 180
   001482         148500     MOVE    TEST-18-B-SIGN TO COMPUTED-X.                        NC1164.2 54 166
   001483         148600 SIG-WRITE-GF-18.                                                 NC1164.2
   001484         148700     PERFORM PRINT-DETAIL.                                        NC1164.2 310
   001485         148800*                                                                 NC1164.2
   001486         148900 TERMINATE-ROUTINE.                                               NC1164.2
   001487         149000     EXIT.                                                        NC1164.2
   001488         149100 CCVS-EXIT SECTION.                                               NC1164.2
   001489         149200 CCVS-999999.                                                     NC1164.2
   001490         149300     GO TO CLOSE-FILES.                                           NC1164.2 299
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    30
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      117   AN-00008-X-1 . . . . . . . . .  631 642 653 664
      119   AN-00008-X-2 . . . . . . . . .  688 710
      121   AN-00008-X-5 . . . . . . . . .  699 721
      125   AN-00009-X-3 . . . . . . . . .  745 767
      133   AN-00009-X-4 . . . . . . . . .  802 813 824 835
      129   AN-00009-X-6 . . . . . . . . .  756 778
      115   AN-006 . . . . . . . . . . . .  M1176 1177 1187 M1194 M1195 1196 1202 M1209 M1210 1211 1216 M1223 M1224 1225
                                            1231
      212   ANSI-REFERENCE . . . . . . . .  389 396 405 M413 M474 M536 M574 M612 M669 M726 M783 M840 M904 M971 M1036 M1103
                                            M1168 M1238 M1340 M1441 M1464
      191   CCVS-C-1 . . . . . . . . . . .  328 374
      196   CCVS-C-2 . . . . . . . . . . .  329 375
      246   CCVS-E-1 . . . . . . . . . . .  334
      251   CCVS-E-2 . . . . . . . . . . .  343 350 357 362
      254   CCVS-E-2-2 . . . . . . . . . .  M342
      259   CCVS-E-3 . . . . . . . . . . .  363
      268   CCVS-E-4 . . . . . . . . . . .  342
      269   CCVS-E-4-1 . . . . . . . . . .  M340
      271   CCVS-E-4-2 . . . . . . . . . .  M341
      213   CCVS-H-1 . . . . . . . . . . .  323 370
      218   CCVS-H-2A. . . . . . . . . . .  324 371
      227   CCVS-H-2B. . . . . . . . . . .  325 372
      239   CCVS-H-3 . . . . . . . . . . .  326 373
      289   CCVS-PGM-ID. . . . . . . . . .  295 295
      173   CM-18V0
      167   COMPUTED-A . . . . . . . . . .  168 170 171 172 173 401 404 M432 M443 M455 M469 M493 M504 M517 M530 M555 M568
                                            M593 M606 M631 M642 M653 M664 M688 M699 M710 M721 M745 M756 M767 M778 M802 M813
                                            M824 M835 M988 M1002 M1015 M1029 M1122 M1135 M1148 M1161 M1187 M1202 M1216 M1231
                                            M1260 M1275 M1289 M1304 M1319 M1333 M1360 M1375 M1389 M1404 M1418 M1433
      168   COMPUTED-N
      166   COMPUTED-X . . . . . . . . . .  M318 386 M1459 M1482
      170   COMPUTED-0V18
      172   COMPUTED-14V4
      174   COMPUTED-18V0. . . . . . . . .  M859 M871 M884 M897 M922 M936 M950 M964 M1054 M1069 M1083 M1097
      171   COMPUTED-4V14
      190   COR-ANSI-REFERENCE . . . . . .  M396 M398
      181   CORRECT-A. . . . . . . . . . .  182 183 184 185 186 402 404 M431 M442 M454 M468 M492 M503 M516 M529 M554 M567
                                            M592 M605 M989 M1003 M1016 M1030 M1055 M1068 M1082 M1096 M1123 M1136 M1149 M1162
                                            M1188 M1203 M1217 M1232 M1261 M1276 M1290 M1305 M1318 M1334 M1361 M1376 M1390
                                            M1405 M1419 M1434
      182   CORRECT-N
      180   CORRECT-X. . . . . . . . . . .  M319 388 M1458 M1481
      183   CORRECT-0V18
      185   CORRECT-14V4
      187   CORRECT-18V0 . . . . . . . . .  M632 M643 M654 M665 M689 M700 M711 M722 M746 M757 M768 M779 M803 M814 M825 M836
                                            M860 M872 M885 M898 M923 M937 M951 M965
      184   CORRECT-4V14
      186   CR-18V0
      134   CS-00007-1 . . . . . . . . . .  621 632
      138   CS-00007-2 . . . . . . . . . .  678 689
      142   CS-00007-3 . . . . . . . . . .  735 746
      146   CS-00007-4 . . . . . . . . . .  792 803
      104   CS-005 . . . . . . . . . . . .  M891 892 897 M957 958 964 M1241 1297 1397
      135   CU-00007-1 . . . . . . . . . .  637 643
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    31
0 Defined   Cross-reference of data names   References

0     139   CU-00007-2 . . . . . . . . . .  694 700
      143   CU-00007-3 . . . . . . . . . .  751 757
      147   CU-00007-4 . . . . . . . . . .  808 814
      103   CU-005 . . . . . . . . . . . .  M878 879 884 M943 944 950 M1240 1268 1368
      204   DELETE-COUNTER . . . . . . . .  M308 337 353 355
      159   DOTVALUE . . . . . . . . . . .  M313
      116   DS-L-00008 . . . . . . . . . .  117 621 637 648 659
       86   DS-L-4 . . . . . . . . . . . .  88 1210
       81   DS-L-5 . . . . . . . . . . . .  83 1111 1142
      122   DS-LS-00008. . . . . . . . . .  125 735 762
      126   DS-LS-00008-1. . . . . . . . .  129 751 773
       63   DS-LS-4. . . . . . . . . . . .  66 977 995
       57   DS-LS-5. . . . . . . . . . . .  60 848 865 878 891 1043 1061 1176
      118   DS-T-00008 . . . . . . . . . .  119 678 705
      120   DS-T-00008-1 . . . . . . . . .  121 694 716
       96   DS-T-4 . . . . . . . . . . . .  98 1129 1155
       91   DS-T-5 . . . . . . . . . . . .  93 1224
      130   DS-TS-00008. . . . . . . . . .  133 792 808 819 830
       75   DS-TS-4. . . . . . . . . . . .  78 911 929 943 957 1195
       69   DS-TS-5. . . . . . . . . . . .  72 1009 1022 1075 1089
      136   DS-00007-1 . . . . . . . . . .  648 654
      140   DS-00007-2 . . . . . . . . . .  705 711
      144   DS-00007-3 . . . . . . . . . .  762 768
      148   DS-00007-4 . . . . . . . . . .  819 825
      102   DS-005 . . . . . . . . . . . .  M865 866 871 M929 930 936 M1241 1283 1383
      137   DU-00007-1 . . . . . . . . . .  659 665
      141   DU-00007-2 . . . . . . . . . .  716 722
      145   DU-00007-3 . . . . . . . . . .  773 779
      149   DU-00007-4 . . . . . . . . . .  830 836
      101   DU-005 . . . . . . . . . . . .  M848 849 859 M911 912 922 M1240 1249 1348
      210   DUMMY-HOLD . . . . . . . . . .  M367 377
       38   DUMMY-RECORD . . . . . . . . .  M323 M324 M325 M326 M328 M329 M330 M332 M334 M343 M350 M357 M362 M363 367 M368
                                            369 M370 M371 M372 M373 M374 M375 M376 M377 381 M382 M391 M406
      257   ENDER-DESC . . . . . . . . . .  M345 M356 M361
      205   ERROR-COUNTER. . . . . . . . .  M307 336 346 349
      209   ERROR-HOLD . . . . . . . . . .  M336 M337 M337 M338 341
      255   ERROR-TOTAL. . . . . . . . . .  M347 M349 M354 M355 M359 M360
      152   FEATURE. . . . . . . . . . . .  M416 M477 M538 M576 M614 M671 M728 M785 M842 M906 M973 M1038 M1170 M1246 M1342
                                            M1443 M1466
       60   GRP-001
       66   GRP-002
       72   GRP-003
       78   GRP-004
       83   GRP-005
       88   GRP-006
       93   GRP-007
       98   GRP-008
      107   GRP-09 . . . . . . . . . . . .  978 988 1010 1015 1112 1122 1130 1135 M1248 1250 1260 M1267 1269 1275 M1282 1284
                                            1289 M1296 1298 1304 M1311 1313 1319 M1325 1327 1333
      110   GRP-10 . . . . . . . . . . . .  996 1002 1023 1029 1143 1148 1156 1161 M1347 1350 1360 M1367 1369 1375 M1382
                                            1384 1389 M1396 1398 1404 M1411 1413 1418 M1425 1427 1433
      283   HYPHEN-LINE. . . . . . . . . .  330 332 376
      249   ID-AGAIN . . . . . . . . . . .  M295
      282   INF-ANSI-REFERENCE . . . . . .  M389 M392 M405 M407
      277   INFO-TEXT. . . . . . . . . . .  M390
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    32
0 Defined   Cross-reference of data names   References

0     206   INSPECT-COUNTER. . . . . . . .  M305 336 358 360
      154   P-OR-F . . . . . . . . . . . .  M305 M306 M307 M308 315 M318
      156   PAR-NAME . . . . . . . . . . .  M320 M414 M475 M537 M575 M613 M670 M727 M784 M841 M905 M972 M1037 M1104 M1169
                                            M1239 M1341 M1442 M1465
      158   PARDOT-X . . . . . . . . . . .  M312
      207   PASS-COUNTER . . . . . . . . .  M306 338 340
       36   PRINT-FILE . . . . . . . . . .  32 294 300
       37   PRINT-REC. . . . . . . . . . .  M314 M395 M397
      161   RE-MARK. . . . . . . . . . . .  M309 M321 M417 M441 M458 M467 M478 M505 M520 M531 M540 M571 M578 M609 M615 M672
                                            M729 M786 M861 M873 M886 M899 M924 M938 M952 M966 M990 M1004 M1017 M1031 M1056
                                            M1070 M1084 M1098 M1124 M1137 M1150 M1163 M1189 M1204 M1218 M1233 M1262 M1277
                                            M1291 M1306 M1320 M1335 M1362 M1377 M1391 M1406 M1420 M1435 M1457 M1480
      203   REC-CT . . . . . . . . . . . .  311 313 320 M415 M445 M457 M471 M476 M507 M519 M533 M539 M570 M577 M608 M616
                                            M636 M647 M658 M677 M693 M704 M715 M734 M750 M761 M772 M791 M807 M818 M829 M843
                                            M875 M888 M901 M926 M940 M954 M968 M992 M1006 M1019 M1033 M1058 M1072 M1086 M1100
                                            M1126 M1139 M1152 M1165 M1191 M1206 M1220 M1235 M1264 M1279 M1293 M1308 M1322
                                            M1337 M1364 M1379 M1393 M1408 M1422 M1437 M1445 M1468
      202   REC-SKL-SUB
      211   RECORD-COUNT . . . . . . . . .  M365 366 M378
      162   TEST-COMPUTED. . . . . . . . .  395
      177   TEST-CORRECT . . . . . . . . .  397
      230   TEST-ID. . . . . . . . . . . .  M295
      150   TEST-RESULTS . . . . . . . . .  M296 314
       42   TEST-17-A
       43   TEST-17-B
       45   TEST-17-C. . . . . . . . . . .  46 M1444
       47   TEST-17-C-SIGN . . . . . . . .  1447 1459
       41   TEST-17-DATA
       44   TEST-17-GROUP
       51   TEST-18-A
       52   TEST-18-B. . . . . . . . . . .  53 M1467
       54   TEST-18-B-SIGN . . . . . . . .  1470 1482
       53   TEST-18-BX
       56   TEST-18-C
       50   TEST-18-DATA
       61   TEST1-AN-1 . . . . . . . . . .  421 432
       62   TEST1-AN-5 . . . . . . . . . .  436 443
       67   TEST1N-AN-1. . . . . . . . . .  448 455
       68   TEST1N-AN-4. . . . . . . . . .  461 469
       74   TEST2-AN-1 . . . . . . . . . .  482 493
       73   TEST2-AN-5 . . . . . . . . . .  497 504
       80   TEST2N-AN-1. . . . . . . . . .  510 517
       79   TEST2N-AN-4. . . . . . . . . .  523 530
       84   TEST3-AN-1
       85   TEST3-AN-4 . . . . . . . . . .  544 555
       89   TEST3N-AN-1
       90   TEST3N-AN-3. . . . . . . . . .  559 568
       95   TEST4-AN-1
       94   TEST4-AN-4 . . . . . . . . . .  582 593
      100   TEST4N-AN-1
       99   TEST4N-AN-3. . . . . . . . . .  597 606
      208   TOTAL-ERROR
      111   WRK-DS-L-5 . . . . . . . . . .  M1043 1044 1054 M1075 1076 1083
      105   WRK-DS-LS-5. . . . . . . . . .  107 M977 M1009 M1108 M1111 M1129 M1249 M1268 M1283 M1297 M1312 M1326
      113   WRK-DS-T-5 . . . . . . . . . .  M1061 1062 1069 M1089 1090 1097
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    33
0 Defined   Cross-reference of data names   References

0     108   WRK-DS-TS-5. . . . . . . . . .  110 M995 M1022 M1109 M1142 M1155 M1348 M1368 M1383 M1397 M1412 M1426
      279   XXCOMPUTED . . . . . . . . . .  M404
      281   XXCORRECT. . . . . . . . . . .  M404
      274   XXINFO . . . . . . . . . . . .  391 406
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    34
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

      400   BAIL-OUT . . . . . . . . . . .  P317
      408   BAIL-OUT-EX. . . . . . . . . .  E317 G402
      403   BAIL-OUT-WRITE . . . . . . . .  G401
      383   BLANK-LINE-PRINT
     1488   CCVS-EXIT
     1489   CCVS-999999
      292   CCVS1
      409   CCVS1-EXIT . . . . . . . . . .  G298
      299   CLOSE-FILES. . . . . . . . . .  G1490
      327   COLUMN-NAMES-ROUTINE . . . . .  E297
      308   DE-LETE. . . . . . . . . . . .  P426 P487 P549 P564 P587 P602 P626 P683 P740 P797 P854 P917 P983 P1049 P1117
                                            P1182 P1255 P1355 P1453 P1476
      331   END-ROUTINE. . . . . . . . . .  P300
      335   END-ROUTINE-1
      344   END-ROUTINE-12
      352   END-ROUTINE-13 . . . . . . . .  E300
      333   END-RTN-EXIT
      307   FAIL . . . . . . . . . . . . .  P430 P440 P453 P466 P491 P502 P515 P528 P553 P566 P591 P604 P630 P641 P652 P663
                                            P687 P698 P709 P720 P744 P755 P766 P777 P801 P812 P823 P834 P858 P870 P883 P896
                                            P921 P935 P949 P963 P987 P1001 P1014 P1028 P1053 P1067 P1081 P1095 P1121 P1134
                                            P1147 P1160 P1186 P1201 P1215 P1230 P1259 P1274 P1288 P1303 P1317 P1332 P1359
                                            P1374 P1388 P1403 P1417 P1432 P1456 P1479
      385   FAIL-ROUTINE . . . . . . . . .  P316
      399   FAIL-ROUTINE-EX. . . . . . . .  E316 G393
      394   FAIL-ROUTINE-WRITE . . . . . .  G387 G388
      322   HEAD-ROUTINE . . . . . . . . .  P297
      305   INSPT
      293   OPEN-FILES
      306   PASS . . . . . . . . . . . . .  P422 P437 P450 P463 P483 P498 P512 P525 P545 P561 P583 P599 P622 P638 P649 P660
                                            P679 P695 P706 P717 P736 P752 P763 P774 P793 P809 P820 P831 P850 P867 P880 P893
                                            P914 P932 P946 P960 P979 P998 P1011 P1025 P1046 P1064 P1078 P1092 P1113 P1131
                                            P1144 P1157 P1178 P1198 P1212 P1227 P1251 P1271 P1285 P1300 P1314 P1329 P1351
                                            P1371 P1385 P1400 P1414 P1429 P1448 P1471
      310   PRINT-DETAIL . . . . . . . . .  P427 P434 P446 P459 P472 P488 P495 P508 P521 P534 P550 P557 P572 P588 P595 P610
                                            P627 P634 P645 P656 P667 P684 P691 P702 P713 P724 P741 P748 P759 P770 P781 P798
                                            P805 P816 P827 P838 P855 P863 P876 P889 P902 P918 P927 P941 P955 P969 P984 P993
                                            P1007 P1020 P1034 P1050 P1059 P1073 P1087 P1101 P1118 P1127 P1140 P1153 P1166
                                            P1183 P1192 P1207 P1221 P1236 P1256 P1265 P1280 P1294 P1309 P1323 P1338 P1356
                                            P1365 P1380 P1394 P1409 P1423 P1438 P1461 P1484
      411   SECT-NC116A-001
      425   SIG-DELETE-GF-1-1
      916   SIG-DELETE-GF-10-1
      982   SIG-DELETE-GF-11-1
     1048   SIG-DELETE-GF-12-1
     1116   SIG-DELETE-GF-13-1
     1181   SIG-DELETE-GF-14-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    35
0 Defined   Cross-reference of procedures   References

0    1254   SIG-DELETE-GF-15-1
     1354   SIG-DELETE-GF-16-1
     1452   SIG-DELETE-GF-17
     1475   SIG-DELETE-GF-18
      486   SIG-DELETE-GF-2-1
      548   SIG-DELETE-GF-3-1
      563   SIG-DELETE-GF-3-2
      586   SIG-DELETE-GF-4-1
      601   SIG-DELETE-GF-4-2
      625   SIG-DELETE-GF-5-1
      682   SIG-DELETE-GF-6-1
      739   SIG-DELETE-GF-7-1
      796   SIG-DELETE-GF-8-1
      853   SIG-DELETE-GF-9-1
      429   SIG-FAIL-GF-1-1. . . . . . . .  G424
      439   SIG-FAIL-GF-1-2
      452   SIG-FAIL-GF-1-3. . . . . . . .  G449
      465   SIG-FAIL-GF-1-4. . . . . . . .  G462
      920   SIG-FAIL-GF-10-1 . . . . . . .  G913
      934   SIG-FAIL-GF-10-2 . . . . . . .  G931
      948   SIG-FAIL-GF-10-3 . . . . . . .  G945
      962   SIG-FAIL-GF-10-4 . . . . . . .  G959
      986   SIG-FAIL-GF-11-1 . . . . . . .  G981
     1000   SIG-FAIL-GF-11-2 . . . . . . .  G997
     1013   SIG-FAIL-GF-11-3
     1027   SIG-FAIL-GF-11-4 . . . . . . .  G1024
     1052   SIG-FAIL-GF-12-1 . . . . . . .  G1045
     1066   SIG-FAIL-GF-12-2 . . . . . . .  G1063
     1080   SIG-FAIL-GF-12-3 . . . . . . .  G1077
     1094   SIG-FAIL-GF-12-4 . . . . . . .  G1091
     1120   SIG-FAIL-GF-13-1 . . . . . . .  G1115
     1133   SIG-FAIL-GF-13-2
     1146   SIG-FAIL-GF-13-3
     1159   SIG-FAIL-GF-13-4
     1185   SIG-FAIL-GF-14-1 . . . . . . .  G1180
     1200   SIG-FAIL-GF-14-2 . . . . . . .  G1197
     1214   SIG-FAIL-GF-14-3
     1229   SIG-FAIL-GF-14-4 . . . . . . .  G1226
     1258   SIG-FAIL-GF-15-1 . . . . . . .  G1253
     1273   SIG-FAIL-GF-15-2 . . . . . . .  G1270
     1287   SIG-FAIL-GF-15-3
     1302   SIG-FAIL-GF-15-4 . . . . . . .  G1299
     1316   SIG-FAIL-GF-15-5
     1331   SIG-FAIL-GF-15-6 . . . . . . .  G1328
     1358   SIG-FAIL-GF-16-1 . . . . . . .  G1353
     1373   SIG-FAIL-GF-16-2 . . . . . . .  G1370
     1387   SIG-FAIL-GF-16-3
     1402   SIG-FAIL-GF-16-4 . . . . . . .  G1399
     1416   SIG-FAIL-GF-16-5
     1431   SIG-FAIL-GF-16-6 . . . . . . .  G1428
     1455   SIG-FAIL-GF-17 . . . . . . . .  G1451
     1478   SIG-FAIL-GF-18 . . . . . . . .  G1474
      490   SIG-FAIL-GF-2-1. . . . . . . .  G485
      501   SIG-FAIL-GF-2-2. . . . . . . .  G500
      514   SIG-FAIL-GF-2-3. . . . . . . .  G511
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    36
0 Defined   Cross-reference of procedures   References

0     527   SIG-FAIL-GF-2-4. . . . . . . .  G524
      552   SIG-FAIL-GF-3-1. . . . . . . .  G547
      565   SIG-FAIL-GF-3-2. . . . . . . .  G560
      590   SIG-FAIL-GF-4-1. . . . . . . .  G585
      603   SIG-FAIL-GF-4-2. . . . . . . .  G598
      629   SIG-FAIL-GF-5-1. . . . . . . .  G624
      640   SIG-FAIL-GF-5-2
      651   SIG-FAIL-GF-5-3
      662   SIG-FAIL-GF-5-4
      686   SIG-FAIL-GF-6-1. . . . . . . .  G681
      697   SIG-FAIL-GF-6-2
      708   SIG-FAIL-GF-6-3
      719   SIG-FAIL-GF-6-4
      743   SIG-FAIL-GF-7-1. . . . . . . .  G738
      754   SIG-FAIL-GF-7-2
      765   SIG-FAIL-GF-7-3
      776   SIG-FAIL-GF-7-4
      800   SIG-FAIL-GF-8-1. . . . . . . .  G795
      811   SIG-FAIL-GF-8-2
      822   SIG-FAIL-GF-8-3
      833   SIG-FAIL-GF-8-4
      857   SIG-FAIL-GF-9-1. . . . . . . .  G852
      869   SIG-FAIL-GF-9-2
      882   SIG-FAIL-GF-9-3
      895   SIG-FAIL-GF-9-4
      412   SIG-INIT-GF-1
      903   SIG-INIT-GF-10 . . . . . . . .  G856
      970   SIG-INIT-GF-11 . . . . . . . .  G919
     1035   SIG-INIT-GF-12 . . . . . . . .  G985
     1102   SIG-INIT-GF-13 . . . . . . . .  G1051
     1167   SIG-INIT-GF-14 . . . . . . . .  G1119
     1237   SIG-INIT-GF-15 . . . . . . . .  G1184
     1339   SIG-INIT-GF-16 . . . . . . . .  G1257
     1440   SIG-INIT-GF-17 . . . . . . . .  G1357
     1463   SIG-INIT-GF-18
      473   SIG-INIT-GF-2. . . . . . . . .  G428
      535   SIG-INIT-GF-3. . . . . . . . .  G489
      573   SIG-INIT-GF-4. . . . . . . . .  G551
      611   SIG-INIT-GF-5. . . . . . . . .  G589
      668   SIG-INIT-GF-6. . . . . . . . .  G628
      725   SIG-INIT-GF-7. . . . . . . . .  G685
      782   SIG-INIT-GF-8. . . . . . . . .  G742
      839   SIG-INIT-GF-9. . . . . . . . .  G799
      418   SIG-TEST-GF-1-1
      435   SIG-TEST-GF-1-2
      447   SIG-TEST-GF-1-3
      460   SIG-TEST-GF-1-4
      910   SIG-TEST-GF-10-1
      928   SIG-TEST-GF-10-2
      942   SIG-TEST-GF-10-3
      956   SIG-TEST-GF-10-4
      976   SIG-TEST-GF-11-1
      994   SIG-TEST-GF-11-2
     1008   SIG-TEST-GF-11-3
     1021   SIG-TEST-GF-11-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    37
0 Defined   Cross-reference of procedures   References

0    1042   SIG-TEST-GF-12-1
     1060   SIG-TEST-GF-12-2
     1074   SIG-TEST-GF-12-3
     1088   SIG-TEST-GF-12-4
     1110   SIG-TEST-GF-13-1
     1128   SIG-TEST-GF-13-2
     1141   SIG-TEST-GF-13-3
     1154   SIG-TEST-GF-13-4
     1175   SIG-TEST-GF-14-1
     1193   SIG-TEST-GF-14-2
     1208   SIG-TEST-GF-14-3
     1222   SIG-TEST-GF-14-4
     1247   SIG-TEST-GF-15-1
     1266   SIG-TEST-GF-15-2
     1281   SIG-TEST-GF-15-3
     1295   SIG-TEST-GF-15-4
     1310   SIG-TEST-GF-15-5
     1324   SIG-TEST-GF-15-6
     1349   SIG-TEST-GF-16-1
     1366   SIG-TEST-GF-16-2
     1381   SIG-TEST-GF-16-3
     1395   SIG-TEST-GF-16-4
     1410   SIG-TEST-GF-16-5
     1424   SIG-TEST-GF-16-6
     1446   SIG-TEST-GF-17
     1469   SIG-TEST-GF-18
      481   SIG-TEST-GF-2-1
      509   SIG-TEST-GF-2-3
      522   SIG-TEST-GF-2-4
      543   SIG-TEST-GF-3-1
      558   SIG-TEST-GF-3-2
      581   SIG-TEST-GF-4-1
      596   SIG-TEST-GF-4-2
      620   SIG-TEST-GF-5-1
      635   SIG-TEST-GF-5-2
      646   SIG-TEST-GF-5-3
      657   SIG-TEST-GF-5-4
      676   SIG-TEST-GF-6-1
      692   SIG-TEST-GF-6-2
      703   SIG-TEST-GF-6-3
      714   SIG-TEST-GF-6-4
      733   SIG-TEST-GF-7-1
      749   SIG-TEST-GF-7-2
      760   SIG-TEST-GF-7-3
      771   SIG-TEST-GF-7-4
      790   SIG-TEST-GF-8-1
      806   SIG-TEST-GF-8-2
      817   SIG-TEST-GF-8-3
      828   SIG-TEST-GF-8-4
      847   SIG-TEST-GF-9-1
      864   SIG-TEST-GF-9-2
      877   SIG-TEST-GF-9-3
      890   SIG-TEST-GF-9-4
     1085   SIG-WRITE-GF-12-3. . . . . . .  G1079
     1099   SIG-WRITE-GF-12-4. . . . . . .  G1093
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    38
0 Defined   Cross-reference of procedures   References

0    1125   SIG-WRITE-GF-13-1. . . . . . .  G1114
     1138   SIG-WRITE-GF-13-2. . . . . . .  G1132
     1151   SIG-WRITE-GF-13-3. . . . . . .  G1145
     1164   SIG-WRITE-GF-13-4. . . . . . .  G1158
     1190   SIG-WRITE-GF-14-1. . . . . . .  G1179
     1205   SIG-WRITE-GF-14-2. . . . . . .  G1199
     1219   SIG-WRITE-GF-14-3. . . . . . .  G1213
     1234   SIG-WRITE-GF-14-4. . . . . . .  G1228
     1263   SIG-WRITE-GF-15-1. . . . . . .  G1252
     1278   SIG-WRITE-GF-15-2. . . . . . .  G1272
     1292   SIG-WRITE-GF-15-3. . . . . . .  G1286
     1307   SIG-WRITE-GF-15-4. . . . . . .  G1301
     1321   SIG-WRITE-GF-15-5. . . . . . .  G1315
     1336   SIG-WRITE-GF-15-6. . . . . . .  G1330
     1363   SIG-WRITE-GF-16-1. . . . . . .  G1352
     1378   SIG-WRITE-GF-16-2. . . . . . .  G1372
     1392   SIG-WRITE-GF-16-3. . . . . . .  G1386
     1407   SIG-WRITE-GF-16-4. . . . . . .  G1401
     1421   SIG-WRITE-GF-16-5. . . . . . .  G1415
     1436   SIG-WRITE-GF-16-6. . . . . . .  G1430
     1460   SIG-WRITE-GF-17. . . . . . . .  G1449 G1454
     1483   SIG-WRITE-GF-18. . . . . . . .  G1472 G1477
      633   SIG-WRITE-GF-5-1 . . . . . . .  G623
      644   SIG-WRITE-GF-5-2 . . . . . . .  G639
      655   SIG-WRITE-GF-5-3 . . . . . . .  G650
      666   SIG-WRITE-GF-5-4 . . . . . . .  G661
      690   SIG-WRITE-GF-6-1 . . . . . . .  G680
      701   SIG-WRITE-GF-6-2 . . . . . . .  G696
      712   SIG-WRITE-GF-6-3 . . . . . . .  G707
      723   SIG-WRITE-GF-6-4 . . . . . . .  G718
      747   SIG-WRITE-GF-7-1 . . . . . . .  G737
      758   SIG-WRITE-GF-7-2 . . . . . . .  G753
      769   SIG-WRITE-GF-7-3 . . . . . . .  G764
      780   SIG-WRITE-GF-7-4 . . . . . . .  G775
      804   SIG-WRITE-GF-8-1 . . . . . . .  G794
      815   SIG-WRITE-GF-8-2 . . . . . . .  G810
      826   SIG-WRITE-GF-8-3 . . . . . . .  G821
      837   SIG-WRITE-GF-8-4 . . . . . . .  G832
      433   SIG-WRTE-GF-1-1. . . . . . . .  G423
      444   SIG-WRTE-GF-1-2. . . . . . . .  G438
      456   SIG-WRTE-GF-1-3. . . . . . . .  G451
      470   SIG-WRTE-GF-1-4. . . . . . . .  G464
      925   SIG-WRTE-GF-10-1 . . . . . . .  G915
      939   SIG-WRTE-GF-10-2 . . . . . . .  G933
      953   SIG-WRTE-GF-10-3 . . . . . . .  G947
      967   SIG-WRTE-GF-10-4 . . . . . . .  G961
      991   SIG-WRTE-GF-11-1 . . . . . . .  G980
     1005   SIG-WRTE-GF-11-2 . . . . . . .  G999
     1018   SIG-WRTE-GF-11-3 . . . . . . .  G1012
     1032   SIG-WRTE-GF-11-4 . . . . . . .  G1026
     1057   SIG-WRTE-GF-12-1 . . . . . . .  G1047
     1071   SIG-WRTE-GF-12-2 . . . . . . .  G1065
      494   SIG-WRTE-GF-2-1. . . . . . . .  G484
      506   SIG-WRTE-GF-2-2. . . . . . . .  G499
      518   SIG-WRTE-GF-2-3. . . . . . . .  G513
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    39
0 Defined   Cross-reference of procedures   References

0     532   SIG-WRTE-GF-2-4. . . . . . . .  G526
      556   SIG-WRTE-GF-3-1. . . . . . . .  G546
      569   SIG-WRTE-GF-3-2. . . . . . . .  G562
      594   SIG-WRTE-GF-4-1. . . . . . . .  G584
      607   SIG-WRTE-GF-4-2. . . . . . . .  G600
      862   SIG-WRTE-GF-9-1. . . . . . . .  G851
      874   SIG-WRTE-GF-9-2. . . . . . . .  G868
      887   SIG-WRTE-GF-9-3. . . . . . . .  G881
      900   SIG-WRTE-GF-9-4. . . . . . . .  G894
      496   SIGNTEST-GF-2-2
      303   TERMINATE-CALL
      301   TERMINATE-CCVS
     1486   TERMINATE-ROUTINE
      364   WRITE-LINE . . . . . . . . . .  P314 P315 P323 P324 P325 P326 P328 P329 P330 P332 P334 P343 P351 P357 P362 P363
                                            P391 P395 P397 P406
      380   WRT-LN . . . . . . . . . . . .  P370 P371 P372 P373 P374 P375 P376 P379 P384
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    40
0 Defined   Cross-reference of programs     References

        3   NC116A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC116A    Date 06/04/2022  Time 12:00:33   Page    41
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC116A:
 *    Source records = 1490
 *    Data Division statements = 146
 *    Procedure Division statements = 924
 *    Generated COBOL statements = 0
 *    Program complexity factor = 944
0End of compilation 1,  program NC116A,  highest severity 0.
0Return code 0
