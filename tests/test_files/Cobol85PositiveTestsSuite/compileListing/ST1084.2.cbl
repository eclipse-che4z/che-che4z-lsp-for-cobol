1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:36   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:36   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         ST1084.2
   000002         000200 PROGRAM-ID.                                                      ST1084.2
   000003         000300     ST108A.                                                      ST1084.2
   000004         000500*                                                              *  ST1084.2
   000005         000600*    VALIDATION FOR:-                                          *  ST1084.2
   000006         000700*                                                              *  ST1084.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".ST1084.2
   000008         000900*                                                              *  ST1084.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".ST1084.2
   000010         001100*                                                              *  ST1084.2
   000011         001300*                                                              *  ST1084.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  ST1084.2
   000013         001500*                                                              *  ST1084.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  ST1084.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  ST1084.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  ST1084.2
   000017         001900*                                                              *  ST1084.2
   000018         002100*    ST108 IS A COMPLETELY SELF-CONTAINED PROGRAM.  THE INPUT     ST1084.2
   000019         002200*    PROCEDURE BUILDS THE EIGHT-RECORD FILE SHOWN BELOW. THE      ST1084.2
   000020         002300*    OUTPUT PROCEDURE CHECKS THE SORTED FILE AND GENERATES THE    ST1084.2
   000021         002400*    REPORT.                                                      ST1084.2
   000022         002500*    SORT    SORT    SORT    SORT    SORT   SORT     SORT    SORT ST1084.2
   000023         002600*    KEY-1   KEY-2   KEY-3   KEY-4   KEY-5  KEY-6    KEY-7   KEY-8ST1084.2
   000024         002700*    S9(6)   A(5)    SV9(16) X(10)   A(20)  X(10)    999     S99  ST1084.2
   000025         002800*    USAGE   JUST            JUST                            USAGEST1084.2
   000026         002900*    COMP    RIGHT           RIGHT                           COMP ST1084.2
   000027         003000*                                                                 ST1084.2
   000028         003100*    +123456     BBB -.1234   BBBBBB A      AAAAAAAA 501     +99  ST1084.2
   000029         003200*    -054321       X -.1234   BBBBBB A      AAAAAAAA 501     +99  ST1084.2
   000030         003300*    -054321     BBB +.6      BBBBBB A      AAAAAAAA 501     +99  ST1084.2
   000031         003400*    -054321     BBB -.1234        X A      AAAAAAAA 501     +99  ST1084.2
   000032         003500*    -054321     BBB -.1234   BBBBBB Z      AAAAAAAA 501     +99  ST1084.2
   000033         003600*    -054321     BBB -.1234   BBBBBB A      Z        501     +99  ST1084.2
   000034         003700*    -054321     BBB -.1234   BBBBBB A      AAAAAAAA 418     +99  ST1084.2
   000035         003800*    -054321     BBB -.1234   BBBBBB A      AAAAAAAA 501     -14  ST1084.2
   000036         003900*                                                                 ST1084.2
   000037         004000*    THIS PROGRAM CHECKS THE COMPILER"S ABILITY TO HANDLE EIGHT   ST1084.2
   000038         004100*    ASCENDING KEYS IN ONE FILE.                                  ST1084.2
   000039         004200                                                                  ST1084.2
   000040         004300 ENVIRONMENT DIVISION.                                            ST1084.2
   000041         004400 CONFIGURATION SECTION.                                           ST1084.2
   000042         004500 SOURCE-COMPUTER.                                                 ST1084.2
   000043         004600     XXXXX082.                                                    ST1084.2
   000044         004700 OBJECT-COMPUTER.                                                 ST1084.2
   000045         004800     XXXXX083.                                                    ST1084.2
   000046         004900 INPUT-OUTPUT SECTION.                                            ST1084.2
   000047         005000 FILE-CONTROL.                                                    ST1084.2
   000048         005100     SELECT PRINT-FILE ASSIGN TO                                  ST1084.2 54
   000049         005200     XXXXX055.                                                    ST1084.2
   000050         005300     SELECT   SORTFILE-1H ASSIGN TO                               ST1084.2 57
   000051         005400     XXXXX027.                                                    ST1084.2
   000052         005500 DATA DIVISION.                                                   ST1084.2
   000053         005600 FILE SECTION.                                                    ST1084.2
   000054         005700 FD  PRINT-FILE.                                                  ST1084.2

 ==000054==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 01  PRINT-REC PICTURE X(120).                                    ST1084.2
   000056         005900 01  DUMMY-RECORD PICTURE X(120).                                 ST1084.2
   000057         006000 SD  SORTFILE-1H                                                  ST1084.2
   000058         006100     DATA RECORD IS SORTFILE-REC.                                 ST1084.2 *
   000059         006200 01  SORTFILE-REC.                                                ST1084.2
   000060         006300     02 SORTKEY-8       PICTURE S99 COMPUTATIONAL.                ST1084.2
   000061         006400     02 SORTKEY-1       PICTURE S9(6) COMPUTATIONAL.              ST1084.2
   000062         006500     02 SORTKEY-7       PICTURE 999.                              ST1084.2
   000063         006600     02 SORTKEY-3       PICTURE SV9(16).                          ST1084.2
   000064         006700     02 FILLER          PICTURE XX.                               ST1084.2
   000065         006800     02 SORTKEY-4       PICTURE X(10) JUSTIFIED RIGHT.            ST1084.2
   000066         006900     02 SORTKEY-6       PICTURE X(10).                            ST1084.2
   000067         007000     02 SORTKEY-2       PICTURE A(05) JUSTIFIED RIGHT.            ST1084.2
   000068         007100     02 SORTKEY-5       PICTURE A(20).                            ST1084.2
   000069         007200     02 FILLER          PICTURE XXX.                              ST1084.2
   000070         007300 WORKING-STORAGE SECTION.                                         ST1084.2
   000071         007400 77  UTIL-CTR           PICTURE S99999.                           ST1084.2
   000072         007500 77  SPAC-E             PICTURE X VALUE " ".                      ST1084.2
   000073         007600 01  TEST-RESULTS.                                                ST1084.2
   000074         007700     02 FILLER                   PIC X      VALUE SPACE.          ST1084.2 IMP
   000075         007800     02 FEATURE                  PIC X(20)  VALUE SPACE.          ST1084.2 IMP
   000076         007900     02 FILLER                   PIC X      VALUE SPACE.          ST1084.2 IMP
   000077         008000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          ST1084.2 IMP
   000078         008100     02 FILLER                   PIC X      VALUE SPACE.          ST1084.2 IMP
   000079         008200     02  PAR-NAME.                                                ST1084.2
   000080         008300       03 FILLER                 PIC X(19)  VALUE SPACE.          ST1084.2 IMP
   000081         008400       03  PARDOT-X              PIC X      VALUE SPACE.          ST1084.2 IMP
   000082         008500       03 DOTVALUE               PIC 99     VALUE ZERO.           ST1084.2 IMP
   000083         008600     02 FILLER                   PIC X(8)   VALUE SPACE.          ST1084.2 IMP
   000084         008700     02 RE-MARK                  PIC X(61).                       ST1084.2
   000085         008800 01  TEST-COMPUTED.                                               ST1084.2
   000086         008900     02 FILLER                   PIC X(30)  VALUE SPACE.          ST1084.2 IMP
   000087         009000     02 FILLER                   PIC X(17)  VALUE                 ST1084.2
   000088         009100            "       COMPUTED=".                                   ST1084.2
   000089         009200     02 COMPUTED-X.                                               ST1084.2
   000090         009300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          ST1084.2 IMP
   000091         009400     03 COMPUTED-N               REDEFINES COMPUTED-A             ST1084.2 90
   000092         009500                                 PIC -9(9).9(9).                  ST1084.2
   000093         009600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         ST1084.2 90
   000094         009700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     ST1084.2 90
   000095         009800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     ST1084.2 90
   000096         009900     03       CM-18V0 REDEFINES COMPUTED-A.                       ST1084.2 90
   000097         010000         04 COMPUTED-18V0                    PIC -9(18).          ST1084.2
   000098         010100         04 FILLER                           PIC X.               ST1084.2
   000099         010200     03 FILLER PIC X(50) VALUE SPACE.                             ST1084.2 IMP
   000100         010300 01  TEST-CORRECT.                                                ST1084.2
   000101         010400     02 FILLER PIC X(30) VALUE SPACE.                             ST1084.2 IMP
   000102         010500     02 FILLER PIC X(17) VALUE "       CORRECT =".                ST1084.2
   000103         010600     02 CORRECT-X.                                                ST1084.2
   000104         010700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         ST1084.2 IMP
   000105         010800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      ST1084.2 104
   000106         010900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         ST1084.2 104
   000107         011000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     ST1084.2 104
   000108         011100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     ST1084.2 104
   000109         011200     03      CR-18V0 REDEFINES CORRECT-A.                         ST1084.2 104
   000110         011300         04 CORRECT-18V0                     PIC -9(18).          ST1084.2
   000111         011400         04 FILLER                           PIC X.               ST1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     03 FILLER PIC X(2) VALUE SPACE.                              ST1084.2 IMP
   000113         011600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     ST1084.2 IMP
   000114         011700 01  CCVS-C-1.                                                    ST1084.2
   000115         011800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAST1084.2
   000116         011900-    "SS  PARAGRAPH-NAME                                          ST1084.2
   000117         012000-    "       REMARKS".                                            ST1084.2
   000118         012100     02 FILLER                     PIC X(20)    VALUE SPACE.      ST1084.2 IMP
   000119         012200 01  CCVS-C-2.                                                    ST1084.2
   000120         012300     02 FILLER                     PIC X        VALUE SPACE.      ST1084.2 IMP
   000121         012400     02 FILLER                     PIC X(6)     VALUE "TESTED".   ST1084.2
   000122         012500     02 FILLER                     PIC X(15)    VALUE SPACE.      ST1084.2 IMP
   000123         012600     02 FILLER                     PIC X(4)     VALUE "FAIL".     ST1084.2
   000124         012700     02 FILLER                     PIC X(94)    VALUE SPACE.      ST1084.2 IMP
   000125         012800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       ST1084.2 IMP
   000126         012900 01  REC-CT                        PIC 99       VALUE ZERO.       ST1084.2 IMP
   000127         013000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       ST1084.2 IMP
   000128         013100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       ST1084.2 IMP
   000129         013200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       ST1084.2 IMP
   000130         013300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       ST1084.2 IMP
   000131         013400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       ST1084.2 IMP
   000132         013500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       ST1084.2 IMP
   000133         013600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      ST1084.2 IMP
   000134         013700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       ST1084.2 IMP
   000135         013800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     ST1084.2 IMP
   000136         013900 01  CCVS-H-1.                                                    ST1084.2
   000137         014000     02  FILLER                    PIC X(39)    VALUE SPACES.     ST1084.2 IMP
   000138         014100     02  FILLER                    PIC X(42)    VALUE             ST1084.2
   000139         014200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 ST1084.2
   000140         014300     02  FILLER                    PIC X(39)    VALUE SPACES.     ST1084.2 IMP
   000141         014400 01  CCVS-H-2A.                                                   ST1084.2
   000142         014500   02  FILLER                        PIC X(40)  VALUE SPACE.      ST1084.2 IMP
   000143         014600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  ST1084.2
   000144         014700   02  FILLER                        PIC XXXX   VALUE             ST1084.2
   000145         014800     "4.2 ".                                                      ST1084.2
   000146         014900   02  FILLER                        PIC X(28)  VALUE             ST1084.2
   000147         015000            " COPY - NOT FOR DISTRIBUTION".                       ST1084.2
   000148         015100   02  FILLER                        PIC X(41)  VALUE SPACE.      ST1084.2 IMP
   000149         015200                                                                  ST1084.2
   000150         015300 01  CCVS-H-2B.                                                   ST1084.2
   000151         015400   02  FILLER                        PIC X(15)  VALUE             ST1084.2
   000152         015500            "TEST RESULT OF ".                                    ST1084.2
   000153         015600   02  TEST-ID                       PIC X(9).                    ST1084.2
   000154         015700   02  FILLER                        PIC X(4)   VALUE             ST1084.2
   000155         015800            " IN ".                                               ST1084.2
   000156         015900   02  FILLER                        PIC X(12)  VALUE             ST1084.2
   000157         016000     " HIGH       ".                                              ST1084.2
   000158         016100   02  FILLER                        PIC X(22)  VALUE             ST1084.2
   000159         016200            " LEVEL VALIDATION FOR ".                             ST1084.2
   000160         016300   02  FILLER                        PIC X(58)  VALUE             ST1084.2
   000161         016400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".ST1084.2
   000162         016500 01  CCVS-H-3.                                                    ST1084.2
   000163         016600     02  FILLER                      PIC X(34)  VALUE             ST1084.2
   000164         016700            " FOR OFFICIAL USE ONLY    ".                         ST1084.2
   000165         016800     02  FILLER                      PIC X(58)  VALUE             ST1084.2
   000166         016900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".ST1084.2
   000167         017000     02  FILLER                      PIC X(28)  VALUE             ST1084.2
   000168         017100            "  COPYRIGHT   1985 ".                                ST1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  CCVS-E-1.                                                    ST1084.2
   000170         017300     02 FILLER                       PIC X(52)  VALUE SPACE.      ST1084.2 IMP
   000171         017400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              ST1084.2
   000172         017500     02 ID-AGAIN                     PIC X(9).                    ST1084.2
   000173         017600     02 FILLER                       PIC X(45)  VALUE SPACES.     ST1084.2 IMP
   000174         017700 01  CCVS-E-2.                                                    ST1084.2
   000175         017800     02  FILLER                      PIC X(31)  VALUE SPACE.      ST1084.2 IMP
   000176         017900     02  FILLER                      PIC X(21)  VALUE SPACE.      ST1084.2 IMP
   000177         018000     02 CCVS-E-2-2.                                               ST1084.2
   000178         018100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      ST1084.2 IMP
   000179         018200         03 FILLER                   PIC X      VALUE SPACE.      ST1084.2 IMP
   000180         018300         03 ENDER-DESC               PIC X(44)  VALUE             ST1084.2
   000181         018400            "ERRORS ENCOUNTERED".                                 ST1084.2
   000182         018500 01  CCVS-E-3.                                                    ST1084.2
   000183         018600     02  FILLER                      PIC X(22)  VALUE             ST1084.2
   000184         018700            " FOR OFFICIAL USE ONLY".                             ST1084.2
   000185         018800     02  FILLER                      PIC X(12)  VALUE SPACE.      ST1084.2 IMP
   000186         018900     02  FILLER                      PIC X(58)  VALUE             ST1084.2
   000187         019000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".ST1084.2
   000188         019100     02  FILLER                      PIC X(13)  VALUE SPACE.      ST1084.2 IMP
   000189         019200     02 FILLER                       PIC X(15)  VALUE             ST1084.2
   000190         019300             " COPYRIGHT 1985".                                   ST1084.2
   000191         019400 01  CCVS-E-4.                                                    ST1084.2
   000192         019500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      ST1084.2 IMP
   000193         019600     02 FILLER                       PIC X(4)   VALUE " OF ".     ST1084.2
   000194         019700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      ST1084.2 IMP
   000195         019800     02 FILLER                       PIC X(40)  VALUE             ST1084.2
   000196         019900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       ST1084.2
   000197         020000 01  XXINFO.                                                      ST1084.2
   000198         020100     02 FILLER                       PIC X(19)  VALUE             ST1084.2
   000199         020200            "*** INFORMATION ***".                                ST1084.2
   000200         020300     02 INFO-TEXT.                                                ST1084.2
   000201         020400       04 FILLER                     PIC X(8)   VALUE SPACE.      ST1084.2 IMP
   000202         020500       04 XXCOMPUTED                 PIC X(20).                   ST1084.2
   000203         020600       04 FILLER                     PIC X(5)   VALUE SPACE.      ST1084.2 IMP
   000204         020700       04 XXCORRECT                  PIC X(20).                   ST1084.2
   000205         020800     02 INF-ANSI-REFERENCE           PIC X(48).                   ST1084.2
   000206         020900 01  HYPHEN-LINE.                                                 ST1084.2
   000207         021000     02 FILLER  PIC IS X VALUE IS SPACE.                          ST1084.2 IMP
   000208         021100     02 FILLER  PIC IS X(65)    VALUE IS "************************ST1084.2
   000209         021200-    "*****************************************".                 ST1084.2
   000210         021300     02 FILLER  PIC IS X(54)    VALUE IS "************************ST1084.2
   000211         021400-    "******************************".                            ST1084.2
   000212         021500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             ST1084.2
   000213         021600     "ST108A".                                                    ST1084.2
   000214         021700 PROCEDURE DIVISION.                                              ST1084.2
   000215         021800 SORT-PARA SECTION.                                               ST1084.2
   000216         021900 SORT-PARAGRAPH.                                                  ST1084.2
   000217         022000     SORT     SORTFILE-1H ON                                      ST1084.2 57
   000218         022100              ASCENDING KEY SORTKEY-1                             ST1084.2 61
   000219         022200              ASCENDING SORTKEY-2                                 ST1084.2 67
   000220         022300              ASCENDING SORTKEY-3                                 ST1084.2 63
   000221         022400              ASCENDING SORTKEY-4                                 ST1084.2 65
   000222         022500              ASCENDING SORTKEY-5                                 ST1084.2 68
   000223         022600              ASCENDING SORTKEY-6                                 ST1084.2 66
   000224         022700              ASCENDING SORTKEY-7                                 ST1084.2 62
   000225         022800              ASCENDING SORTKEY-8                                 ST1084.2 60
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900              INPUT PROCEDURE INPROC                              ST1084.2 229
   000227         023000              OUTPUT PROCEDURE OUTPROC THRU OUTPROC-EXIT.         ST1084.2 271 614
   000228         023100     STOP     RUN.                                                ST1084.2
   000229         023200 INPROC SECTION.                                                  ST1084.2
   000230         023300 BUILD-FILE.                                                      ST1084.2
   000231         023400     PERFORM  BUILD-RECORD.                                       ST1084.2 256
   000232         023500     MOVE     +123456             TO SORTKEY-1.                   ST1084.2 61
   000233         023600     PERFORM  RELEASE-RECORD.                                     ST1084.2 267
   000234         023700     PERFORM  BUILD-RECORD.                                       ST1084.2 256
   000235         023800     MOVE     "X"                 TO SORTKEY-2.                   ST1084.2 67
   000236         023900     PERFORM  RELEASE-RECORD.                                     ST1084.2 267
   000237         024000     PERFORM  BUILD-RECORD.                                       ST1084.2 256
   000238         024100     MOVE     +.6                 TO SORTKEY-3.                   ST1084.2 63
   000239         024200     PERFORM  RELEASE-RECORD.                                     ST1084.2 267
   000240         024300     PERFORM  BUILD-RECORD.                                       ST1084.2 256
   000241         024400     MOVE     "X"                 TO SORTKEY-4.                   ST1084.2 65
   000242         024500     PERFORM  RELEASE-RECORD.                                     ST1084.2 267
   000243         024600     PERFORM  BUILD-RECORD.                                       ST1084.2 256
   000244         024700     MOVE     "Z"                 TO SORTKEY-5.                   ST1084.2 68
   000245         024800     PERFORM  RELEASE-RECORD.                                     ST1084.2 267
   000246         024900     PERFORM  BUILD-RECORD.                                       ST1084.2 256
   000247         025000     MOVE     "Z"                 TO SORTKEY-6.                   ST1084.2 66
   000248         025100     PERFORM  RELEASE-RECORD.                                     ST1084.2 267
   000249         025200     PERFORM  BUILD-RECORD.                                       ST1084.2 256
   000250         025300     MOVE     +418                TO SORTKEY-7.                   ST1084.2 62
   000251         025400     PERFORM  RELEASE-RECORD.                                     ST1084.2 267
   000252         025500     PERFORM  BUILD-RECORD.                                       ST1084.2 256
   000253         025600     MOVE     -14                 TO SORTKEY-8.                   ST1084.2 60
   000254         025700     PERFORM  RELEASE-RECORD.                                     ST1084.2 267
   000255         025800     GO       TO BUILD-EXIT.                                      ST1084.2 269
   000256         025900 BUILD-RECORD.                                                    ST1084.2
   000257         026000     MOVE     -054321             TO SORTKEY-1.                   ST1084.2 61
   000258         026100     MOVE     "BBB"               TO SORTKEY-2.                   ST1084.2 67
   000259         026200     MOVE     -.1234567890123456  TO SORTKEY-3.                   ST1084.2 63
   000260         026300     MOVE     "BBBBBB"            TO SORTKEY-4.                   ST1084.2 65
   000261         026400     MOVE     "A"                 TO SORTKEY-5.                   ST1084.2 68
   000262         026500     MOVE     "AAAAAAAA"          TO SORTKEY-6.                   ST1084.2 66
   000263         026600     MOVE     -501                TO SORTKEY-7.                   ST1084.2 62
   000264         026700*       NOTE THIS ITEM IS INTENTIONALLY MOVED TO AN UNSIGNED      ST1084.2
   000265         026800*             FIELD.                                              ST1084.2
   000266         026900     MOVE     +99                 TO SORTKEY-8.                   ST1084.2 60
   000267         027000 RELEASE-RECORD.                                                  ST1084.2
   000268         027100     RELEASE  SORTFILE-REC.                                       ST1084.2 59
   000269         027200 BUILD-EXIT.                                                      ST1084.2
   000270         027300     EXIT.                                                        ST1084.2
   000271         027400 OUTPROC SECTION.                                                 ST1084.2
   000272         027500 OPEN-FILES.                                                      ST1084.2
   000273         027600     OPEN     OUTPUT PRINT-FILE.                                  ST1084.2 54
   000274         027700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   ST1084.2 212 153 212 172
   000275         027800     MOVE    SPACE TO TEST-RESULTS.                               ST1084.2 IMP 73
   000276         027900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             ST1084.2 525 530
   000277         028000     IF       SPAC-E IS LESS THAN "B"                             ST1084.2 72
   000278      1  028100              GO TO SPACE-IS-LESS-THAN-B.                         ST1084.2 384
   000279         028200 B-IS-LESS-THAN-SPACE SECTION.                                    ST1084.2
   000280         028300 SORT-INIT-A.                                                     ST1084.2
   000281         028400     MOVE     "SORT - 8 ASC. KEYS" TO FEATURE.                    ST1084.2 75
   000282         028500*        NOTE THE RECORDS SHOULD BE SORTED INTO THE FOLLOWING     ST1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600*             ORDER --- 8 7 6 5 4 3 1 2 --- THAT IS,              ST1084.2
   000284         028700*             THE 8TH RECORD SORTS UP TO THE 1ST POSITION,        ST1084.2
   000285         028800*             THE 7TH RECORD SORTS UP TO THE 2ND POSITION, ETC.   ST1084.2
   000286         028900 SORT-TEST-1.                                                     ST1084.2
   000287         029000     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000288         029100     IF       SORTKEY-7 EQUAL TO 418                              ST1084.2 62
   000289      1  029200              PERFORM PASS GO TO SORT-WRITE-1.                    ST1084.2 509 294
   000290         029300 SORT-FAIL-1.                                                     ST1084.2
   000291         029400     PERFORM  FAIL.                                               ST1084.2 510
   000292         029500     MOVE     SORTKEY-7 TO COMPUTED-N.                            ST1084.2 62 91
   000293         029600     MOVE     418 TO CORRECT-N.                                   ST1084.2 105
   000294         029700 SORT-WRITE-1.                                                    ST1084.2
   000295         029800     MOVE     "SORT-TEST-1 " TO PAR-NAME.                         ST1084.2 79
   000296         029900     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000297         030000 SORT-TEST-2.                                                     ST1084.2
   000298         030100     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000299         030200     IF       SORTKEY-8 EQUAL TO -14                              ST1084.2 60
   000300      1  030300              PERFORM PASS GO TO SORT-WRITE-2.                    ST1084.2 509 305
   000301         030400 SORT-FAIL-2.                                                     ST1084.2
   000302         030500     PERFORM  FAIL.                                               ST1084.2 510
   000303         030600     MOVE     SORTKEY-8 TO COMPUTED-N.                            ST1084.2 60 91
   000304         030700     MOVE     -14 TO CORRECT-N.                                   ST1084.2 105
   000305         030800 SORT-WRITE-2.                                                    ST1084.2
   000306         030900     MOVE     "SORT-TEST-2 " TO PAR-NAME.                         ST1084.2 79
   000307         031000     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000308         031100 SORT-TEST-3.                                                     ST1084.2
   000309         031200     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000310         031300     IF       SORTKEY-6 EQUAL TO "Z         "                     ST1084.2 66
   000311      1  031400              PERFORM PASS GO TO SORT-WRITE-3.                    ST1084.2 509 316
   000312         031500 SORT-FAIL-3.                                                     ST1084.2
   000313         031600     PERFORM  FAIL.                                               ST1084.2 510
   000314         031700     MOVE     SORTKEY-6 TO COMPUTED-A.                            ST1084.2 66 90
   000315         031800     MOVE     "Z         "           TO CORRECT-A.                ST1084.2 104
   000316         031900 SORT-WRITE-3.                                                    ST1084.2
   000317         032000     MOVE     "SORT-TEST-3 " TO PAR-NAME.                         ST1084.2 79
   000318         032100     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000319         032200 SORT-TEST-4.                                                     ST1084.2
   000320         032300     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000321         032400     IF       SORTKEY-5 EQUAL TO "Z                   "           ST1084.2 68
   000322      1  032500              PERFORM PASS GO TO SORT-WRITE-4.                    ST1084.2 509 327
   000323         032600 SORT-FAIL-4.                                                     ST1084.2
   000324         032700     PERFORM  FAIL.                                               ST1084.2 510
   000325         032800     MOVE     SORTKEY-5 TO COMPUTED-A.                            ST1084.2 68 90
   000326         032900     MOVE     "Z                   " TO CORRECT-A.                ST1084.2 104
   000327         033000 SORT-WRITE-4.                                                    ST1084.2
   000328         033100     MOVE     "SORT-TEST-4 " TO PAR-NAME.                         ST1084.2 79
   000329         033200     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000330         033300 SORT-TEST-5.                                                     ST1084.2
   000331         033400     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000332         033500     IF       SORTKEY-4 EQUAL TO "         X"                     ST1084.2 65
   000333      1  033600              PERFORM PASS GO TO SORT-WRITE-5.                    ST1084.2 509 338
   000334         033700 SORT-FAIL-5.                                                     ST1084.2
   000335         033800     PERFORM  FAIL.                                               ST1084.2 510
   000336         033900     MOVE     SORTKEY-4 TO COMPUTED-A.                            ST1084.2 65 90
   000337         034000     MOVE     "         X"           TO CORRECT-A.                ST1084.2 104
   000338         034100 SORT-WRITE-5.                                                    ST1084.2
   000339         034200     MOVE     "SORT-TEST-5 " TO PAR-NAME.                         ST1084.2 79
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000341         034400 SORT-TEST-6.                                                     ST1084.2
   000342         034500     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000343         034600     IF       SORTKEY-3 EQUAL TO +.6000000000000000               ST1084.2 63
   000344      1  034700              PERFORM PASS GO TO SORT-WRITE-6.                    ST1084.2 509 349
   000345         034800 SORT-FAIL-6.                                                     ST1084.2
   000346         034900     PERFORM  FAIL.                                               ST1084.2 510
   000347         035000     MOVE     SORTKEY-3 TO COMPUTED-0V18.                         ST1084.2 63 93
   000348         035100     MOVE     +.6000000000000000     TO CORRECT-0V18.             ST1084.2 106
   000349         035200 SORT-WRITE-6.                                                    ST1084.2
   000350         035300     MOVE     "SORT-TEST-6 " TO PAR-NAME.                         ST1084.2 79
   000351         035400     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000352         035500 SORT-TEST-7.                                                     ST1084.2
   000353         035600     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000354         035700     IF       SORTKEY-2 EQUAL TO "    X"                          ST1084.2 67
   000355      1  035800              PERFORM PASS GO TO SORT-WRITE-7.                    ST1084.2 509 360
   000356         035900 SORT-FAIL-7.                                                     ST1084.2
   000357         036000     PERFORM  FAIL.                                               ST1084.2 510
   000358         036100     MOVE     SORTKEY-2 TO COMPUTED-A.                            ST1084.2 67 90
   000359         036200     MOVE     "    X" TO CORRECT-A.                               ST1084.2 104
   000360         036300 SORT-WRITE-7.                                                    ST1084.2
   000361         036400     MOVE     "SORT-TEST-7 " TO PAR-NAME.                         ST1084.2 79
   000362         036500     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000363         036600 SORT-TEST-8.                                                     ST1084.2
   000364         036700     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000365         036800     IF       SORTKEY-1 EQUAL TO +123456                          ST1084.2 61
   000366      1  036900              PERFORM PASS GO TO SORT-WRITE-8.                    ST1084.2 509 371
   000367         037000 SORT-FAIL-8.                                                     ST1084.2
   000368         037100     PERFORM  FAIL.                                               ST1084.2 510
   000369         037200     MOVE     SORTKEY-1 TO COMPUTED-N.                            ST1084.2 61 91
   000370         037300     MOVE     +123456 TO CORRECT-N.                               ST1084.2 105
   000371         037400 SORT-WRITE-8.                                                    ST1084.2
   000372         037500     MOVE     "SORT-TEST-8 " TO PAR-NAME.                         ST1084.2 79
   000373         037600     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000374         037700 SORT-REMARK-A.                                                   ST1084.2
   000375         037800     MOVE     SPACE TO FEATURE.                                   ST1084.2 IMP 75
   000376         037900     MOVE     "THE COLLATING SEQUENCE" TO RE-MARK.                ST1084.2 84
   000377         038000     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000378         038100     MOVE     "RENDERS TESTS 9 THRU 16" TO RE-MARK.               ST1084.2 84
   000379         038200     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000380         038300     MOVE     "UNNECESSARY." TO RE-MARK.                          ST1084.2 84
   000381         038400     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000382         038500     MOVE     "SORT - 8 ASC. KEYS" TO FEATURE.                    ST1084.2 75
   000383         038600     GO       TO CONTINUE-TESTING.                                ST1084.2 485
   000384         038700 SPACE-IS-LESS-THAN-B SECTION.                                    ST1084.2
   000385         038800 SORT-REMARK-B.                                                   ST1084.2
   000386         038900     MOVE     "THE COLLATING SEQUENCE" TO RE-MARK.                ST1084.2 84
   000387         039000     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000388         039100     MOVE     "RENDERS TESTS 1 THRU 8" TO RE-MARK.                ST1084.2 84
   000389         039200     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000390         039300     MOVE     "UNNECESSARY." TO RE-MARK.                          ST1084.2 84
   000391         039400     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000392         039500     MOVE     "SORT - 8 ASC. KEYS" TO FEATURE.                    ST1084.2 75
   000393         039600*        NOTE THE RECORDS SHOULD BE SORTED INTO THE FOLLOWING     ST1084.2
   000394         039700*             ORDER --- 8 1 7 2 6 5 3 4 --- THAT IS,              ST1084.2
   000395         039800*             THE 1ST RECORD IS SORTED DOWN TO THE 8TH POSITION,  ST1084.2
   000396         039900*             THE 2ND RECORD SORTS UP TO THE 1ST POSITION, ETC.   ST1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 SORT-TEST-9.                                                     ST1084.2
   000398         040100     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000399         040200     IF       SORTKEY-2 EQUAL TO "    X"                          ST1084.2 67
   000400      1  040300              PERFORM PASS GO TO SORT-WRITE-9.                    ST1084.2 509 405
   000401         040400 SORT-FAIL-9.                                                     ST1084.2
   000402         040500     PERFORM  FAIL.                                               ST1084.2 510
   000403         040600     MOVE     SORTKEY-2 TO COMPUTED-A.                            ST1084.2 67 90
   000404         040700     MOVE     "    X" TO CORRECT-A.                               ST1084.2 104
   000405         040800 SORT-WRITE-9.                                                    ST1084.2
   000406         040900     MOVE     "SORT-TEST-9 " TO PAR-NAME.                         ST1084.2 79
   000407         041000     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000408         041100 SORT-TEST-10.                                                    ST1084.2
   000409         041200     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000410         041300     IF       SORTKEY-4 EQUAL TO "         X"                     ST1084.2 65
   000411      1  041400              PERFORM PASS GO TO SORT-WRITE-10.                   ST1084.2 509 416
   000412         041500 SORT-FAIL-10.                                                    ST1084.2
   000413         041600     PERFORM  FAIL.                                               ST1084.2 510
   000414         041700     MOVE     SORTKEY-4 TO COMPUTED-A.                            ST1084.2 65 90
   000415         041800     MOVE     "         X" TO CORRECT-A.                          ST1084.2 104
   000416         041900 SORT-WRITE-10.                                                   ST1084.2
   000417         042000     MOVE     "SORT-TEST-10" TO PAR-NAME.                         ST1084.2 79
   000418         042100     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000419         042200 SORT-TEST-11.                                                    ST1084.2
   000420         042300     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000421         042400     IF       SORTKEY-7 EQUAL TO 418                              ST1084.2 62
   000422      1  042500              PERFORM PASS GO TO SORT-WRITE-11.                   ST1084.2 509 427
   000423         042600 SORT-FAIL-11.                                                    ST1084.2
   000424         042700     PERFORM  FAIL.                                               ST1084.2 510
   000425         042800     MOVE     SORTKEY-7 TO COMPUTED-N                             ST1084.2 62 91
   000426         042900     MOVE     418 TO CORRECT-N.                                   ST1084.2 105
   000427         043000 SORT-WRITE-11.                                                   ST1084.2
   000428         043100     MOVE     "SORT-TEST-11" TO PAR-NAME.                         ST1084.2 79
   000429         043200     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000430         043300 SORT-TEST-12.                                                    ST1084.2
   000431         043400     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000432         043500     IF       SORTKEY-8 EQUAL TO -14                              ST1084.2 60
   000433      1  043600              PERFORM PASS GO TO SORT-WRITE-12.                   ST1084.2 509 438
   000434         043700 SORT-FAIL-12.                                                    ST1084.2
   000435         043800     PERFORM  FAIL.                                               ST1084.2 510
   000436         043900     MOVE     SORTKEY-8 TO COMPUTED-N.                            ST1084.2 60 91
   000437         044000     MOVE     -14 TO CORRECT-N.                                   ST1084.2 105
   000438         044100 SORT-WRITE-12.                                                   ST1084.2
   000439         044200     MOVE     "SORT-TEST-12" TO PAR-NAME.                         ST1084.2 79
   000440         044300     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000441         044400 SORT-TEST-13.                                                    ST1084.2
   000442         044500     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000443         044600     IF       SORTKEY-6 EQUAL TO "Z         "                     ST1084.2 66
   000444      1  044700              PERFORM PASS GO TO SORT-WRITE-13.                   ST1084.2 509 449
   000445         044800 SORT-FAIL-13.                                                    ST1084.2
   000446         044900     PERFORM  FAIL.                                               ST1084.2 510
   000447         045000     MOVE     SORTKEY-6 TO COMPUTED-A.                            ST1084.2 66 90
   000448         045100     MOVE     "Z         "           TO CORRECT-A.                ST1084.2 104
   000449         045200 SORT-WRITE-13.                                                   ST1084.2
   000450         045300     MOVE     "SORT-TEST-13" TO PAR-NAME.                         ST1084.2 79
   000451         045400     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000452         045500 SORT-TEST-14.                                                    ST1084.2
   000453         045600     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     IF       SORTKEY-5 EQUAL TO "Z                   "           ST1084.2 68
   000455      1  045800              PERFORM PASS GO TO SORT-WRITE-14.                   ST1084.2 509 460
   000456         045900 SORT-FAIL-14.                                                    ST1084.2
   000457         046000     PERFORM  FAIL.                                               ST1084.2 510
   000458         046100     MOVE     SORTKEY-5 TO COMPUTED-A.                            ST1084.2 68 90
   000459         046200     MOVE     "Z                   " TO CORRECT-A.                ST1084.2 104
   000460         046300 SORT-WRITE-14.                                                   ST1084.2
   000461         046400     MOVE     "SORT-TEST-14" TO PAR-NAME.                         ST1084.2 79
   000462         046500     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000463         046600 SORT-TEST-15.                                                    ST1084.2
   000464         046700     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000465         046800     IF       SORTKEY-3 EQUAL TO +.6000000000000000               ST1084.2 63
   000466      1  046900              PERFORM PASS GO TO SORT-WRITE-15.                   ST1084.2 509 471
   000467         047000 SORT-FAIL-15.                                                    ST1084.2
   000468         047100     PERFORM  FAIL.                                               ST1084.2 510
   000469         047200     MOVE     SORTKEY-3 TO COMPUTED-0V18.                         ST1084.2 63 93
   000470         047300     MOVE     +.6000000000000000     TO CORRECT-0V18.             ST1084.2 106
   000471         047400 SORT-WRITE-15.                                                   ST1084.2
   000472         047500     MOVE     "SORT-TEST-15" TO PAR-NAME.                         ST1084.2 79
   000473         047600     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000474         047700 SORT-TEST-16.                                                    ST1084.2
   000475         047800     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1084.2 57 496
   000476         047900     IF       SORTKEY-1 EQUAL TO +123456                          ST1084.2 61
   000477      1  048000              PERFORM PASS GO TO SORT-WRITE-16.                   ST1084.2 509 482
   000478         048100 SORT-FAIL-16.                                                    ST1084.2
   000479         048200     PERFORM  FAIL.                                               ST1084.2 510
   000480         048300     MOVE     SORTKEY-1 TO COMPUTED-N.                            ST1084.2 61 91
   000481         048400     MOVE     +123456 TO CORRECT-N.                               ST1084.2 105
   000482         048500 SORT-WRITE-16.                                                   ST1084.2
   000483         048600     MOVE     "SORT-TEST-16" TO PAR-NAME.                         ST1084.2 79
   000484         048700     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000485         048800 CONTINUE-TESTING SECTION.                                        ST1084.2
   000486         048900 SORT-TEST-17.                                                    ST1084.2
   000487         049000     RETURN   SORTFILE-1H AT END                                  ST1084.2 57
   000488      1  049100              PERFORM PASS GO TO SORT-WRITE-17.                   ST1084.2 509 492
   000489         049200 SORT-FAIL-17.                                                    ST1084.2
   000490         049300     MOVE     "END OF FILE NOT FOUND" TO RE-MARK.                 ST1084.2 84
   000491         049400     PERFORM  FAIL.                                               ST1084.2 510
   000492         049500 SORT-WRITE-17.                                                   ST1084.2
   000493         049600     MOVE     "SORT-TEST-17" TO PAR-NAME.                         ST1084.2 79
   000494         049700     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000495         049800     GO       TO OUTPROC-EXIT.                                    ST1084.2 614
   000496         049900 RETURN-ERROR.                                                    ST1084.2
   000497         050000     MOVE     "RETURN-ERROR" TO PAR-NAME.                         ST1084.2 79
   000498         050100     PERFORM  FAIL.                                               ST1084.2 510
   000499         050200     MOVE     "EOF PREMATURELY FOUND" TO RE-MARK.                 ST1084.2 84
   000500         050300     PERFORM  PRINT-DETAIL.                                       ST1084.2 513
   000501         050400     GO TO CCVS1-EXIT.                                            ST1084.2 612
   000502         050500 CLOSE-FILES.                                                     ST1084.2
   000503         050600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   ST1084.2 534 555 54
   000504         050700 TERMINATE-CCVS.                                                  ST1084.2
   000505         050800     EXIT PROGRAM.                                                ST1084.2
   000506         050900 TERMINATE-CALL.                                                  ST1084.2
   000507         051000     STOP     RUN.                                                ST1084.2
   000508         051100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         ST1084.2 77 129
   000509         051200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           ST1084.2 77 130
   000510         051300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          ST1084.2 77 128
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      ST1084.2 77 127
   000512         051500     MOVE "****TEST DELETED****" TO RE-MARK.                      ST1084.2 84
   000513         051600 PRINT-DETAIL.                                                    ST1084.2
   000514         051700     IF REC-CT NOT EQUAL TO ZERO                                  ST1084.2 126 IMP
   000515      1  051800             MOVE "." TO PARDOT-X                                 ST1084.2 81
   000516      1  051900             MOVE REC-CT TO DOTVALUE.                             ST1084.2 126 82
   000517         052000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      ST1084.2 73 55 567
   000518         052100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               ST1084.2 77 567
   000519      1  052200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 ST1084.2 588 602
   000520      1  052300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 ST1084.2 603 611
   000521         052400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              ST1084.2 IMP 77 IMP 89
   000522         052500     MOVE SPACE TO CORRECT-X.                                     ST1084.2 IMP 103
   000523         052600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         ST1084.2 126 IMP IMP 79
   000524         052700     MOVE     SPACE TO RE-MARK.                                   ST1084.2 IMP 84
   000525         052800 HEAD-ROUTINE.                                                    ST1084.2
   000526         052900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  ST1084.2 136 56 567
   000527         053000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  ST1084.2 141 56 567
   000528         053100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  ST1084.2 150 56 567
   000529         053200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  ST1084.2 162 56 567
   000530         053300 COLUMN-NAMES-ROUTINE.                                            ST1084.2
   000531         053400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           ST1084.2 114 56 567
   000532         053500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1084.2 119 56 567
   000533         053600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        ST1084.2 206 56 567
   000534         053700 END-ROUTINE.                                                     ST1084.2
   000535         053800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.ST1084.2 206 56 567
   000536         053900 END-RTN-EXIT.                                                    ST1084.2
   000537         054000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1084.2 169 56 567
   000538         054100 END-ROUTINE-1.                                                   ST1084.2
   000539         054200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      ST1084.2 128 132 129
   000540         054300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               ST1084.2 132 127 132
   000541         054400      ADD PASS-COUNTER TO ERROR-HOLD.                             ST1084.2 130 132
   000542         054500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   ST1084.2
   000543         054600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            ST1084.2 130 192
   000544         054700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              ST1084.2 132 194
   000545         054800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                ST1084.2 191 177
   000546         054900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           ST1084.2 174 56 567
   000547         055000  END-ROUTINE-12.                                                 ST1084.2
   000548         055100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        ST1084.2 180
   000549         055200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      ST1084.2 128 IMP
   000550      1  055300         MOVE "NO " TO ERROR-TOTAL                                ST1084.2 178
   000551         055400         ELSE                                                     ST1084.2
   000552      1  055500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       ST1084.2 128 178
   000553         055600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           ST1084.2 174 56
   000554         055700     PERFORM WRITE-LINE.                                          ST1084.2 567
   000555         055800 END-ROUTINE-13.                                                  ST1084.2
   000556         055900     IF DELETE-COUNTER IS EQUAL TO ZERO                           ST1084.2 127 IMP
   000557      1  056000         MOVE "NO " TO ERROR-TOTAL  ELSE                          ST1084.2 178
   000558      1  056100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      ST1084.2 127 178
   000559         056200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   ST1084.2 180
   000560         056300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           ST1084.2 174 56 567
   000561         056400      IF   INSPECT-COUNTER EQUAL TO ZERO                          ST1084.2 129 IMP
   000562      1  056500          MOVE "NO " TO ERROR-TOTAL                               ST1084.2 178
   000563      1  056600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   ST1084.2 129 178
   000564         056700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            ST1084.2 180
   000565         056800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          ST1084.2 174 56 567
   000566         056900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           ST1084.2 182 56 567
   000567         057000 WRITE-LINE.                                                      ST1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     ADD 1 TO RECORD-COUNT.                                       ST1084.2 134
   000569         057200     IF RECORD-COUNT GREATER 42                                   ST1084.2 134
   000570      1  057300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          ST1084.2 56 133
   000571      1  057400         MOVE SPACE TO DUMMY-RECORD                               ST1084.2 IMP 56
   000572      1  057500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  ST1084.2 56
   000573      1  057600         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    ST1084.2 136 56 583
   000574      1  057700         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    ST1084.2 141 56 583
   000575      1  057800         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    ST1084.2 150 56 583
   000576      1  057900         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    ST1084.2 162 56 583
   000577      1  058000         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            ST1084.2 114 56 583
   000578      1  058100         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            ST1084.2 119 56 583
   000579      1  058200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          ST1084.2 206 56 583
   000580      1  058300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          ST1084.2 133 56
   000581      1  058400         MOVE ZERO TO RECORD-COUNT.                               ST1084.2 IMP 134
   000582         058500     PERFORM WRT-LN.                                              ST1084.2 583
   000583         058600 WRT-LN.                                                          ST1084.2
   000584         058700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               ST1084.2 56
   000585         058800     MOVE SPACE TO DUMMY-RECORD.                                  ST1084.2 IMP 56
   000586         058900 BLANK-LINE-PRINT.                                                ST1084.2
   000587         059000     PERFORM WRT-LN.                                              ST1084.2 583
   000588         059100 FAIL-ROUTINE.                                                    ST1084.2
   000589         059200     IF     COMPUTED-X NOT EQUAL TO SPACE                         ST1084.2 89 IMP
   000590      1  059300            GO TO   FAIL-ROUTINE-WRITE.                           ST1084.2 597
   000591         059400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.ST1084.2 103 IMP 597
   000592         059500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 ST1084.2 135 205
   000593         059600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   ST1084.2 200
   000594         059700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1084.2 197 56 567
   000595         059800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         ST1084.2 IMP 205
   000596         059900     GO TO  FAIL-ROUTINE-EX.                                      ST1084.2 602
   000597         060000 FAIL-ROUTINE-WRITE.                                              ST1084.2
   000598         060100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         ST1084.2 85 55 567
   000599         060200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 ST1084.2 135 113
   000600         060300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. ST1084.2 100 55 567
   000601         060400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         ST1084.2 IMP 113
   000602         060500 FAIL-ROUTINE-EX. EXIT.                                           ST1084.2
   000603         060600 BAIL-OUT.                                                        ST1084.2
   000604         060700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   ST1084.2 90 IMP 606
   000605         060800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           ST1084.2 104 IMP 611
   000606         060900 BAIL-OUT-WRITE.                                                  ST1084.2
   000607         061000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  ST1084.2 104 204 90 202
   000608         061100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 ST1084.2 135 205
   000609         061200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1084.2 197 56 567
   000610         061300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         ST1084.2 IMP 205
   000611         061400 BAIL-OUT-EX. EXIT.                                               ST1084.2
   000612         061500 CCVS1-EXIT.                                                      ST1084.2
   000613         061600     EXIT.                                                        ST1084.2
   000614         061700 OUTPROC-EXIT SECTION.                                            ST1084.2
   000615         061800 EXIT-ONLY.                                                       ST1084.2
   000616         061900     PERFORM  CLOSE-FILES.                                        ST1084.2 502
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      135   ANSI-REFERENCE . . . . . . . .  592 599 608
      114   CCVS-C-1 . . . . . . . . . . .  531 577
      119   CCVS-C-2 . . . . . . . . . . .  532 578
      169   CCVS-E-1 . . . . . . . . . . .  537
      174   CCVS-E-2 . . . . . . . . . . .  546 553 560 565
      177   CCVS-E-2-2 . . . . . . . . . .  M545
      182   CCVS-E-3 . . . . . . . . . . .  566
      191   CCVS-E-4 . . . . . . . . . . .  545
      192   CCVS-E-4-1 . . . . . . . . . .  M543
      194   CCVS-E-4-2 . . . . . . . . . .  M544
      136   CCVS-H-1 . . . . . . . . . . .  526 573
      141   CCVS-H-2A. . . . . . . . . . .  527 574
      150   CCVS-H-2B. . . . . . . . . . .  528 575
      162   CCVS-H-3 . . . . . . . . . . .  529 576
      212   CCVS-PGM-ID. . . . . . . . . .  274 274
       96   CM-18V0
       90   COMPUTED-A . . . . . . . . . .  91 93 94 95 96 M314 M325 M336 M358 M403 M414 M447 M458 604 607
       91   COMPUTED-N . . . . . . . . . .  M292 M303 M369 M425 M436 M480
       89   COMPUTED-X . . . . . . . . . .  M521 589
       93   COMPUTED-0V18. . . . . . . . .  M347 M469
       95   COMPUTED-14V4
       97   COMPUTED-18V0
       94   COMPUTED-4V14
      113   COR-ANSI-REFERENCE . . . . . .  M599 M601
      104   CORRECT-A. . . . . . . . . . .  105 106 107 108 109 M315 M326 M337 M359 M404 M415 M448 M459 605 607
      105   CORRECT-N. . . . . . . . . . .  M293 M304 M370 M426 M437 M481
      103   CORRECT-X. . . . . . . . . . .  M522 591
      106   CORRECT-0V18 . . . . . . . . .  M348 M470
      108   CORRECT-14V4
      110   CORRECT-18V0
      107   CORRECT-4V14
      109   CR-18V0
      127   DELETE-COUNTER . . . . . . . .  M511 540 556 558
       82   DOTVALUE . . . . . . . . . . .  M516
      133   DUMMY-HOLD . . . . . . . . . .  M570 580
       56   DUMMY-RECORD . . . . . . . . .  M526 M527 M528 M529 M531 M532 M533 M535 M537 M546 M553 M560 M565 M566 570 M571
                                            572 M573 M574 M575 M576 M577 M578 M579 M580 584 M585 M594 M609
      180   ENDER-DESC . . . . . . . . . .  M548 M559 M564
      128   ERROR-COUNTER. . . . . . . . .  M510 539 549 552
      132   ERROR-HOLD . . . . . . . . . .  M539 M540 M540 M541 544
      178   ERROR-TOTAL. . . . . . . . . .  M550 M552 M557 M558 M562 M563
       75   FEATURE. . . . . . . . . . . .  M281 M375 M382 M392
      206   HYPHEN-LINE. . . . . . . . . .  533 535 579
      172   ID-AGAIN . . . . . . . . . . .  M274
      205   INF-ANSI-REFERENCE . . . . . .  M592 M595 M608 M610
      200   INFO-TEXT. . . . . . . . . . .  M593
      129   INSPECT-COUNTER. . . . . . . .  M508 539 561 563
       77   P-OR-F . . . . . . . . . . . .  M508 M509 M510 M511 518 M521
       79   PAR-NAME . . . . . . . . . . .  M295 M306 M317 M328 M339 M350 M361 M372 M406 M417 M428 M439 M450 M461 M472 M483
                                            M493 M497 M523
       81   PARDOT-X . . . . . . . . . . .  M515
      130   PASS-COUNTER . . . . . . . . .  M509 541 543
       54   PRINT-FILE . . . . . . . . . .  48 273 503
       55   PRINT-REC. . . . . . . . . . .  M517 M598 M600
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page    15
0 Defined   Cross-reference of data names   References

0      84   RE-MARK. . . . . . . . . . . .  M376 M378 M380 M386 M388 M390 M490 M499 M512 M524
      126   REC-CT . . . . . . . . . . . .  514 516 523
      125   REC-SKL-SUB
      134   RECORD-COUNT . . . . . . . . .  M568 569 M581
       59   SORTFILE-REC . . . . . . . . .  268
       57   SORTFILE-1H. . . . . . . . . .  50 217 287 298 309 320 331 342 353 364 398 409 420 431 442 453 464 475 487
       61   SORTKEY-1. . . . . . . . . . .  218 M232 M257 365 369 476 480
       67   SORTKEY-2. . . . . . . . . . .  219 M235 M258 354 358 399 403
       63   SORTKEY-3. . . . . . . . . . .  220 M238 M259 343 347 465 469
       65   SORTKEY-4. . . . . . . . . . .  221 M241 M260 332 336 410 414
       68   SORTKEY-5. . . . . . . . . . .  222 M244 M261 321 325 454 458
       66   SORTKEY-6. . . . . . . . . . .  223 M247 M262 310 314 443 447
       62   SORTKEY-7. . . . . . . . . . .  224 M250 M263 288 292 421 425
       60   SORTKEY-8. . . . . . . . . . .  225 M253 M266 299 303 432 436
       72   SPAC-E . . . . . . . . . . . .  277
       85   TEST-COMPUTED. . . . . . . . .  598
      100   TEST-CORRECT . . . . . . . . .  600
      153   TEST-ID. . . . . . . . . . . .  M274
       73   TEST-RESULTS . . . . . . . . .  M275 517
      131   TOTAL-ERROR
       71   UTIL-CTR
      202   XXCOMPUTED . . . . . . . . . .  M607
      204   XXCORRECT. . . . . . . . . . .  M607
      197   XXINFO . . . . . . . . . . . .  594 609
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page    16
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

      279   B-IS-LESS-THAN-SPACE
      603   BAIL-OUT . . . . . . . . . . .  P520
      611   BAIL-OUT-EX. . . . . . . . . .  E520 G605
      606   BAIL-OUT-WRITE . . . . . . . .  G604
      586   BLANK-LINE-PRINT
      269   BUILD-EXIT . . . . . . . . . .  G255
      230   BUILD-FILE
      256   BUILD-RECORD . . . . . . . . .  P231 P234 P237 P240 P243 P246 P249 P252
      612   CCVS1-EXIT . . . . . . . . . .  G501
      502   CLOSE-FILES. . . . . . . . . .  P616
      530   COLUMN-NAMES-ROUTINE . . . . .  E276
      485   CONTINUE-TESTING . . . . . . .  G383
      511   DE-LETE
      534   END-ROUTINE. . . . . . . . . .  P503
      538   END-ROUTINE-1
      547   END-ROUTINE-12
      555   END-ROUTINE-13 . . . . . . . .  E503
      536   END-RTN-EXIT
      615   EXIT-ONLY
      510   FAIL . . . . . . . . . . . . .  P291 P302 P313 P324 P335 P346 P357 P368 P402 P413 P424 P435 P446 P457 P468 P479
                                            P491 P498
      588   FAIL-ROUTINE . . . . . . . . .  P519
      602   FAIL-ROUTINE-EX. . . . . . . .  E519 G596
      597   FAIL-ROUTINE-WRITE . . . . . .  G590 G591
      525   HEAD-ROUTINE . . . . . . . . .  P276
      229   INPROC . . . . . . . . . . . .  P226
      508   INSPT
      272   OPEN-FILES
      271   OUTPROC. . . . . . . . . . . .  P227
      614   OUTPROC-EXIT . . . . . . . . .  E227 G495
      509   PASS . . . . . . . . . . . . .  P289 P300 P311 P322 P333 P344 P355 P366 P400 P411 P422 P433 P444 P455 P466 P477
                                            P488
      513   PRINT-DETAIL . . . . . . . . .  P296 P307 P318 P329 P340 P351 P362 P373 P377 P379 P381 P387 P389 P391 P407 P418
                                            P429 P440 P451 P462 P473 P484 P494 P500
      267   RELEASE-RECORD . . . . . . . .  P233 P236 P239 P242 P245 P248 P251 P254
      496   RETURN-ERROR . . . . . . . . .  G287 G298 G309 G320 G331 G342 G353 G364 G398 G409 G420 G431 G442 G453 G464 G475
      290   SORT-FAIL-1
      412   SORT-FAIL-10
      423   SORT-FAIL-11
      434   SORT-FAIL-12
      445   SORT-FAIL-13
      456   SORT-FAIL-14
      467   SORT-FAIL-15
      478   SORT-FAIL-16
      489   SORT-FAIL-17
      301   SORT-FAIL-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page    17
0 Defined   Cross-reference of procedures   References

0     312   SORT-FAIL-3
      323   SORT-FAIL-4
      334   SORT-FAIL-5
      345   SORT-FAIL-6
      356   SORT-FAIL-7
      367   SORT-FAIL-8
      401   SORT-FAIL-9
      280   SORT-INIT-A
      215   SORT-PARA
      216   SORT-PARAGRAPH
      374   SORT-REMARK-A
      385   SORT-REMARK-B
      286   SORT-TEST-1
      408   SORT-TEST-10
      419   SORT-TEST-11
      430   SORT-TEST-12
      441   SORT-TEST-13
      452   SORT-TEST-14
      463   SORT-TEST-15
      474   SORT-TEST-16
      486   SORT-TEST-17
      297   SORT-TEST-2
      308   SORT-TEST-3
      319   SORT-TEST-4
      330   SORT-TEST-5
      341   SORT-TEST-6
      352   SORT-TEST-7
      363   SORT-TEST-8
      397   SORT-TEST-9
      294   SORT-WRITE-1 . . . . . . . . .  G289
      416   SORT-WRITE-10. . . . . . . . .  G411
      427   SORT-WRITE-11. . . . . . . . .  G422
      438   SORT-WRITE-12. . . . . . . . .  G433
      449   SORT-WRITE-13. . . . . . . . .  G444
      460   SORT-WRITE-14. . . . . . . . .  G455
      471   SORT-WRITE-15. . . . . . . . .  G466
      482   SORT-WRITE-16. . . . . . . . .  G477
      492   SORT-WRITE-17. . . . . . . . .  G488
      305   SORT-WRITE-2 . . . . . . . . .  G300
      316   SORT-WRITE-3 . . . . . . . . .  G311
      327   SORT-WRITE-4 . . . . . . . . .  G322
      338   SORT-WRITE-5 . . . . . . . . .  G333
      349   SORT-WRITE-6 . . . . . . . . .  G344
      360   SORT-WRITE-7 . . . . . . . . .  G355
      371   SORT-WRITE-8 . . . . . . . . .  G366
      405   SORT-WRITE-9 . . . . . . . . .  G400
      384   SPACE-IS-LESS-THAN-B . . . . .  G278
      506   TERMINATE-CALL
      504   TERMINATE-CCVS
      567   WRITE-LINE . . . . . . . . . .  P517 P518 P526 P527 P528 P529 P531 P532 P533 P535 P537 P546 P554 P560 P565 P566
                                            P594 P598 P600 P609
      583   WRT-LN . . . . . . . . . . . .  P573 P574 P575 P576 P577 P578 P579 P582 P587
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page    18
0 Defined   Cross-reference of programs     References

        3   ST108A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST108A    Date 06/04/2022  Time 11:58:36   Page    19
0LineID  Message code  Message text

     54  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program ST108A:
 *    Source records = 616
 *    Data Division statements = 74
 *    Procedure Division statements = 364
 *    Generated COBOL statements = 0
 *    Program complexity factor = 371
0End of compilation 1,  program ST108A,  highest severity 0.
0Return code 0
