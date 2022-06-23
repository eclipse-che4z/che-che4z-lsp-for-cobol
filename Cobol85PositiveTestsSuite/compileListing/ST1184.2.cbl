1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:22   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:22   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         ST1184.2
   000002         000200 PROGRAM-ID.                                                      ST1184.2
   000003         000300     ST118A.                                                      ST1184.2
   000004         000500*                                                              *  ST1184.2
   000005         000600*    VALIDATION FOR:-                                          *  ST1184.2
   000006         000700*                                                              *  ST1184.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".ST1184.2
   000008         000900*                                                              *  ST1184.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".ST1184.2
   000010         001100*                                                              *  ST1184.2
   000011         001300*                                                              *  ST1184.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  ST1184.2
   000013         001500*                                                              *  ST1184.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  ST1184.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  ST1184.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  ST1184.2
   000017         001900*                                                              *  ST1184.2
   000018         002100*    ST118 IS A COMPLETELY SELF-CONTAINED PROGRAM.  THE INPUT     ST1184.2
   000019         002200*    PROCEDURE BUILDS THE EIGHT-RECORD FILE SHOWN BELOW. THE      ST1184.2
   000020         002300*    OUTPUT PROCEDURE CHECKS THE SORTED FILE AND GENERATES THE    ST1184.2
   000021         002400*    REPORT.                                                      ST1184.2
   000022         002500*    SORT    SORT    SORT    SORT    SORT   SORT     SORT    SORT ST1184.2
   000023         002600*    KEY-1   KEY-2   KEY-3   KEY-4   KEY-5  KEY-6    KEY-7   KEY-8ST1184.2
   000024         002700*    S9(6)   A(5)    SV9(16) X(10)   A(20)  X(10)    999     S99  ST1184.2
   000025         002800*    SIGN    JUST    SIGN    JUST                           SIGN  ST1184.2
   000026         002900*    LEADING RIGHT   TRAILIN RIGHT                          TRAIL ST1184.2
   000027         003000*    SEPARAT         SEPARAT                                      ST1184.2
   000028         003100*                                                                 ST1184.2
   000029         003200*    +123456     BBB -.1234   BBBBBB A      AAAAAAAA 501     +99  ST1184.2
   000030         003300*    -054321       X -.1234   BBBBBB A      AAAAAAAA 501     +99  ST1184.2
   000031         003400*    -054321     BBB +.6      BBBBBB A      AAAAAAAA 501     +99  ST1184.2
   000032         003500*    -054321     BBB -.1234        X A      AAAAAAAA 501     +99  ST1184.2
   000033         003600*    -054321     BBB -.1234   BBBBBB Z      AAAAAAAA 501     +99  ST1184.2
   000034         003700*    -054321     BBB -.1234   BBBBBB A      Z        501     +99  ST1184.2
   000035         003800*    -054321     BBB -.1234   BBBBBB A      AAAAAAAA 418     +99  ST1184.2
   000036         003900*    -054321     BBB -.1234   BBBBBB A      AAAAAAAA 501     -14  ST1184.2
   000037         004000*                                                                 ST1184.2
   000038         004100*    THIS PROGRAM CHECKS THE COMPILER"S ABILITY TO HANDLE EIGHT   ST1184.2
   000039         004200*    ASCENDING KEYS IN ONE FILE.                                  ST1184.2
   000040         004300*                                                                 ST1184.2
   000041         004400*    ASCENDING KEYS IN ONE FILE.  EACH OF THE KEYS IDENTIFIED     ST1184.2
   000042         004500*    IN THE SORT STATEMENT ARE ELEMENTARY DATA ITEMS AND USE      ST1184.2
   000043         004600*    VARIOUS COMBINATIONS OF PICTURE CHARACTER-STRING SYMBOLS AND ST1184.2
   000044         004700*    CLAUSES FOR DESCRIBING THE GENERAL CHARACTERISTICS OF THE    ST1184.2
   000045         004800*    DATA ITEM.                                                   ST1184.2
   000046         004900*    THIS PROGRAM IS A REWRITE OF ST108.  THE PURPOSE OF THIS     ST1184.2
   000047         005000*    PROGRAM IS TO VERIFY THAT RECORDS ARE PROPERLY SORTED WHEN   ST1184.2
   000048         005100*    THE SORT KEYS OF THE SORT STATEMENT USE DATA DEFINITIONS     ST1184.2
   000049         005200*    WHICH INCLUDE THE SIGN CLAUSE.                               ST1184.2
   000050         005300 ENVIRONMENT DIVISION.                                            ST1184.2
   000051         005400 CONFIGURATION SECTION.                                           ST1184.2
   000052         005500 SOURCE-COMPUTER.                                                 ST1184.2
   000053         005600     XXXXX082.                                                    ST1184.2
   000054         005700 OBJECT-COMPUTER.                                                 ST1184.2
   000055         005800     XXXXX083.                                                    ST1184.2
   000056         005900 INPUT-OUTPUT SECTION.                                            ST1184.2
   000057         006000 FILE-CONTROL.                                                    ST1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100     SELECT PRINT-FILE ASSIGN TO                                  ST1184.2 64
   000059         006200     XXXXX055.                                                    ST1184.2
   000060         006300     SELECT   SORTFILE-1H ASSIGN TO                               ST1184.2 67
   000061         006400     XXXXX027.                                                    ST1184.2
   000062         006500 DATA DIVISION.                                                   ST1184.2
   000063         006600 FILE SECTION.                                                    ST1184.2
   000064         006700 FD  PRINT-FILE.                                                  ST1184.2

 ==000064==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000065         006800 01  PRINT-REC PICTURE X(120).                                    ST1184.2
   000066         006900 01  DUMMY-RECORD PICTURE X(120).                                 ST1184.2
   000067         007000 SD  SORTFILE-1H                                                  ST1184.2
   000068         007100     DATA RECORD IS SORTFILE-REC.                                 ST1184.2 *
   000069         007200 01  SORTFILE-REC.                                                ST1184.2
   000070         007300     02 SORTKEY-8       PICTURE S99 SIGN IS TRAILING.             ST1184.2
   000071         007400     02 SORTKEY-1       PICTURE S9(6)  SIGN IS LEADING SEPARATE.  ST1184.2
   000072         007500     02 SORTKEY-7       PICTURE 999.                              ST1184.2
   000073         007600     02 SORTKEY-3   PICTURE SV9(16)  SIGN IS TRAILING SEPARATE.   ST1184.2
   000074         007700     02 FILLER          PICTURE XX.                               ST1184.2
   000075         007800     02 SORTKEY-4       PICTURE X(10) JUSTIFIED RIGHT.            ST1184.2
   000076         007900     02 SORTKEY-6       PICTURE X(10).                            ST1184.2
   000077         008000     02 SORTKEY-2       PICTURE A(05) JUSTIFIED RIGHT.            ST1184.2
   000078         008100     02 SORTKEY-5       PICTURE A(20).                            ST1184.2
   000079         008200     02 FILLER          PICTURE XXX.                              ST1184.2
   000080         008300 WORKING-STORAGE SECTION.                                         ST1184.2
   000081         008400 77  UTIL-CTR           PICTURE S99999.                           ST1184.2
   000082         008500 77  SPAC-E             PICTURE X VALUE " ".                      ST1184.2
   000083         008600 01  TEST-RESULTS.                                                ST1184.2
   000084         008700     02 FILLER                   PIC X      VALUE SPACE.          ST1184.2 IMP
   000085         008800     02 FEATURE                  PIC X(20)  VALUE SPACE.          ST1184.2 IMP
   000086         008900     02 FILLER                   PIC X      VALUE SPACE.          ST1184.2 IMP
   000087         009000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          ST1184.2 IMP
   000088         009100     02 FILLER                   PIC X      VALUE SPACE.          ST1184.2 IMP
   000089         009200     02  PAR-NAME.                                                ST1184.2
   000090         009300       03 FILLER                 PIC X(19)  VALUE SPACE.          ST1184.2 IMP
   000091         009400       03  PARDOT-X              PIC X      VALUE SPACE.          ST1184.2 IMP
   000092         009500       03 DOTVALUE               PIC 99     VALUE ZERO.           ST1184.2 IMP
   000093         009600     02 FILLER                   PIC X(8)   VALUE SPACE.          ST1184.2 IMP
   000094         009700     02 RE-MARK                  PIC X(61).                       ST1184.2
   000095         009800 01  TEST-COMPUTED.                                               ST1184.2
   000096         009900     02 FILLER                   PIC X(30)  VALUE SPACE.          ST1184.2 IMP
   000097         010000     02 FILLER                   PIC X(17)  VALUE                 ST1184.2
   000098         010100            "       COMPUTED=".                                   ST1184.2
   000099         010200     02 COMPUTED-X.                                               ST1184.2
   000100         010300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          ST1184.2 IMP
   000101         010400     03 COMPUTED-N               REDEFINES COMPUTED-A             ST1184.2 100
   000102         010500                                 PIC -9(9).9(9).                  ST1184.2
   000103         010600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         ST1184.2 100
   000104         010700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     ST1184.2 100
   000105         010800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     ST1184.2 100
   000106         010900     03       CM-18V0 REDEFINES COMPUTED-A.                       ST1184.2 100
   000107         011000         04 COMPUTED-18V0                    PIC -9(18).          ST1184.2
   000108         011100         04 FILLER                           PIC X.               ST1184.2
   000109         011200     03 FILLER PIC X(50) VALUE SPACE.                             ST1184.2 IMP
   000110         011300 01  TEST-CORRECT.                                                ST1184.2
   000111         011400     02 FILLER PIC X(30) VALUE SPACE.                             ST1184.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 FILLER PIC X(17) VALUE "       CORRECT =".                ST1184.2
   000113         011600     02 CORRECT-X.                                                ST1184.2
   000114         011700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         ST1184.2 IMP
   000115         011800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      ST1184.2 114
   000116         011900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         ST1184.2 114
   000117         012000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     ST1184.2 114
   000118         012100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     ST1184.2 114
   000119         012200     03      CR-18V0 REDEFINES CORRECT-A.                         ST1184.2 114
   000120         012300         04 CORRECT-18V0                     PIC -9(18).          ST1184.2
   000121         012400         04 FILLER                           PIC X.               ST1184.2
   000122         012500     03 FILLER PIC X(2) VALUE SPACE.                              ST1184.2 IMP
   000123         012600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     ST1184.2 IMP
   000124         012700 01  CCVS-C-1.                                                    ST1184.2
   000125         012800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAST1184.2
   000126         012900-    "SS  PARAGRAPH-NAME                                          ST1184.2
   000127         013000-    "       REMARKS".                                            ST1184.2
   000128         013100     02 FILLER                     PIC X(20)    VALUE SPACE.      ST1184.2 IMP
   000129         013200 01  CCVS-C-2.                                                    ST1184.2
   000130         013300     02 FILLER                     PIC X        VALUE SPACE.      ST1184.2 IMP
   000131         013400     02 FILLER                     PIC X(6)     VALUE "TESTED".   ST1184.2
   000132         013500     02 FILLER                     PIC X(15)    VALUE SPACE.      ST1184.2 IMP
   000133         013600     02 FILLER                     PIC X(4)     VALUE "FAIL".     ST1184.2
   000134         013700     02 FILLER                     PIC X(94)    VALUE SPACE.      ST1184.2 IMP
   000135         013800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       ST1184.2 IMP
   000136         013900 01  REC-CT                        PIC 99       VALUE ZERO.       ST1184.2 IMP
   000137         014000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       ST1184.2 IMP
   000138         014100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       ST1184.2 IMP
   000139         014200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       ST1184.2 IMP
   000140         014300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       ST1184.2 IMP
   000141         014400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       ST1184.2 IMP
   000142         014500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       ST1184.2 IMP
   000143         014600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      ST1184.2 IMP
   000144         014700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       ST1184.2 IMP
   000145         014800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     ST1184.2 IMP
   000146         014900 01  CCVS-H-1.                                                    ST1184.2
   000147         015000     02  FILLER                    PIC X(39)    VALUE SPACES.     ST1184.2 IMP
   000148         015100     02  FILLER                    PIC X(42)    VALUE             ST1184.2
   000149         015200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 ST1184.2
   000150         015300     02  FILLER                    PIC X(39)    VALUE SPACES.     ST1184.2 IMP
   000151         015400 01  CCVS-H-2A.                                                   ST1184.2
   000152         015500   02  FILLER                        PIC X(40)  VALUE SPACE.      ST1184.2 IMP
   000153         015600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  ST1184.2
   000154         015700   02  FILLER                        PIC XXXX   VALUE             ST1184.2
   000155         015800     "4.2 ".                                                      ST1184.2
   000156         015900   02  FILLER                        PIC X(28)  VALUE             ST1184.2
   000157         016000            " COPY - NOT FOR DISTRIBUTION".                       ST1184.2
   000158         016100   02  FILLER                        PIC X(41)  VALUE SPACE.      ST1184.2 IMP
   000159         016200                                                                  ST1184.2
   000160         016300 01  CCVS-H-2B.                                                   ST1184.2
   000161         016400   02  FILLER                        PIC X(15)  VALUE             ST1184.2
   000162         016500            "TEST RESULT OF ".                                    ST1184.2
   000163         016600   02  TEST-ID                       PIC X(9).                    ST1184.2
   000164         016700   02  FILLER                        PIC X(4)   VALUE             ST1184.2
   000165         016800            " IN ".                                               ST1184.2
   000166         016900   02  FILLER                        PIC X(12)  VALUE             ST1184.2
   000167         017000     " HIGH       ".                                              ST1184.2
   000168         017100   02  FILLER                        PIC X(22)  VALUE             ST1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200            " LEVEL VALIDATION FOR ".                             ST1184.2
   000170         017300   02  FILLER                        PIC X(58)  VALUE             ST1184.2
   000171         017400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".ST1184.2
   000172         017500 01  CCVS-H-3.                                                    ST1184.2
   000173         017600     02  FILLER                      PIC X(34)  VALUE             ST1184.2
   000174         017700            " FOR OFFICIAL USE ONLY    ".                         ST1184.2
   000175         017800     02  FILLER                      PIC X(58)  VALUE             ST1184.2
   000176         017900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".ST1184.2
   000177         018000     02  FILLER                      PIC X(28)  VALUE             ST1184.2
   000178         018100            "  COPYRIGHT   1985 ".                                ST1184.2
   000179         018200 01  CCVS-E-1.                                                    ST1184.2
   000180         018300     02 FILLER                       PIC X(52)  VALUE SPACE.      ST1184.2 IMP
   000181         018400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              ST1184.2
   000182         018500     02 ID-AGAIN                     PIC X(9).                    ST1184.2
   000183         018600     02 FILLER                       PIC X(45)  VALUE SPACES.     ST1184.2 IMP
   000184         018700 01  CCVS-E-2.                                                    ST1184.2
   000185         018800     02  FILLER                      PIC X(31)  VALUE SPACE.      ST1184.2 IMP
   000186         018900     02  FILLER                      PIC X(21)  VALUE SPACE.      ST1184.2 IMP
   000187         019000     02 CCVS-E-2-2.                                               ST1184.2
   000188         019100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      ST1184.2 IMP
   000189         019200         03 FILLER                   PIC X      VALUE SPACE.      ST1184.2 IMP
   000190         019300         03 ENDER-DESC               PIC X(44)  VALUE             ST1184.2
   000191         019400            "ERRORS ENCOUNTERED".                                 ST1184.2
   000192         019500 01  CCVS-E-3.                                                    ST1184.2
   000193         019600     02  FILLER                      PIC X(22)  VALUE             ST1184.2
   000194         019700            " FOR OFFICIAL USE ONLY".                             ST1184.2
   000195         019800     02  FILLER                      PIC X(12)  VALUE SPACE.      ST1184.2 IMP
   000196         019900     02  FILLER                      PIC X(58)  VALUE             ST1184.2
   000197         020000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".ST1184.2
   000198         020100     02  FILLER                      PIC X(13)  VALUE SPACE.      ST1184.2 IMP
   000199         020200     02 FILLER                       PIC X(15)  VALUE             ST1184.2
   000200         020300             " COPYRIGHT 1985".                                   ST1184.2
   000201         020400 01  CCVS-E-4.                                                    ST1184.2
   000202         020500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      ST1184.2 IMP
   000203         020600     02 FILLER                       PIC X(4)   VALUE " OF ".     ST1184.2
   000204         020700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      ST1184.2 IMP
   000205         020800     02 FILLER                       PIC X(40)  VALUE             ST1184.2
   000206         020900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       ST1184.2
   000207         021000 01  XXINFO.                                                      ST1184.2
   000208         021100     02 FILLER                       PIC X(19)  VALUE             ST1184.2
   000209         021200            "*** INFORMATION ***".                                ST1184.2
   000210         021300     02 INFO-TEXT.                                                ST1184.2
   000211         021400       04 FILLER                     PIC X(8)   VALUE SPACE.      ST1184.2 IMP
   000212         021500       04 XXCOMPUTED                 PIC X(20).                   ST1184.2
   000213         021600       04 FILLER                     PIC X(5)   VALUE SPACE.      ST1184.2 IMP
   000214         021700       04 XXCORRECT                  PIC X(20).                   ST1184.2
   000215         021800     02 INF-ANSI-REFERENCE           PIC X(48).                   ST1184.2
   000216         021900 01  HYPHEN-LINE.                                                 ST1184.2
   000217         022000     02 FILLER  PIC IS X VALUE IS SPACE.                          ST1184.2 IMP
   000218         022100     02 FILLER  PIC IS X(65)    VALUE IS "************************ST1184.2
   000219         022200-    "*****************************************".                 ST1184.2
   000220         022300     02 FILLER  PIC IS X(54)    VALUE IS "************************ST1184.2
   000221         022400-    "******************************".                            ST1184.2
   000222         022500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             ST1184.2
   000223         022600     "ST118A".                                                    ST1184.2
   000224         022700 PROCEDURE DIVISION.                                              ST1184.2
   000225         022800 SORT-PARA SECTION.                                               ST1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 SORT-PARAGRAPH.                                                  ST1184.2
   000227         023000     SORT     SORTFILE-1H ON                                      ST1184.2 67
   000228         023100              ASCENDING KEY SORTKEY-1                             ST1184.2 71
   000229         023200              ASCENDING SORTKEY-2                                 ST1184.2 77
   000230         023300              ASCENDING SORTKEY-3                                 ST1184.2 73
   000231         023400              ASCENDING SORTKEY-4                                 ST1184.2 75
   000232         023500              ASCENDING SORTKEY-5                                 ST1184.2 78
   000233         023600              ASCENDING SORTKEY-6                                 ST1184.2 76
   000234         023700              ASCENDING SORTKEY-7                                 ST1184.2 72
   000235         023800              ASCENDING SORTKEY-8                                 ST1184.2 70
   000236         023900              INPUT PROCEDURE INPROC                              ST1184.2 239
   000237         024000              OUTPUT PROCEDURE OUTPROC THRU OUTPROC-EXIT.         ST1184.2 281 624
   000238         024100     STOP     RUN.                                                ST1184.2
   000239         024200 INPROC SECTION.                                                  ST1184.2
   000240         024300 BUILD-FILE.                                                      ST1184.2
   000241         024400     PERFORM  BUILD-RECORD.                                       ST1184.2 266
   000242         024500     MOVE     +123456             TO SORTKEY-1.                   ST1184.2 71
   000243         024600     PERFORM  RELEASE-RECORD.                                     ST1184.2 277
   000244         024700     PERFORM  BUILD-RECORD.                                       ST1184.2 266
   000245         024800     MOVE     "X"                 TO SORTKEY-2.                   ST1184.2 77
   000246         024900     PERFORM  RELEASE-RECORD.                                     ST1184.2 277
   000247         025000     PERFORM  BUILD-RECORD.                                       ST1184.2 266
   000248         025100     MOVE     +.6                 TO SORTKEY-3.                   ST1184.2 73
   000249         025200     PERFORM  RELEASE-RECORD.                                     ST1184.2 277
   000250         025300     PERFORM  BUILD-RECORD.                                       ST1184.2 266
   000251         025400     MOVE     "X"                 TO SORTKEY-4.                   ST1184.2 75
   000252         025500     PERFORM  RELEASE-RECORD.                                     ST1184.2 277
   000253         025600     PERFORM  BUILD-RECORD.                                       ST1184.2 266
   000254         025700     MOVE     "Z"                 TO SORTKEY-5.                   ST1184.2 78
   000255         025800     PERFORM  RELEASE-RECORD.                                     ST1184.2 277
   000256         025900     PERFORM  BUILD-RECORD.                                       ST1184.2 266
   000257         026000     MOVE     "Z"                 TO SORTKEY-6.                   ST1184.2 76
   000258         026100     PERFORM  RELEASE-RECORD.                                     ST1184.2 277
   000259         026200     PERFORM  BUILD-RECORD.                                       ST1184.2 266
   000260         026300     MOVE     +418                TO SORTKEY-7.                   ST1184.2 72
   000261         026400     PERFORM  RELEASE-RECORD.                                     ST1184.2 277
   000262         026500     PERFORM  BUILD-RECORD.                                       ST1184.2 266
   000263         026600     MOVE     -14                 TO SORTKEY-8.                   ST1184.2 70
   000264         026700     PERFORM  RELEASE-RECORD.                                     ST1184.2 277
   000265         026800     GO       TO BUILD-EXIT.                                      ST1184.2 279
   000266         026900 BUILD-RECORD.                                                    ST1184.2
   000267         027000     MOVE     -054321             TO SORTKEY-1.                   ST1184.2 71
   000268         027100     MOVE     "BBB"               TO SORTKEY-2.                   ST1184.2 77
   000269         027200     MOVE     -.1234567890123456  TO SORTKEY-3.                   ST1184.2 73
   000270         027300     MOVE     "BBBBBB"            TO SORTKEY-4.                   ST1184.2 75
   000271         027400     MOVE     "A"                 TO SORTKEY-5.                   ST1184.2 78
   000272         027500     MOVE     "AAAAAAAA"          TO SORTKEY-6.                   ST1184.2 76
   000273         027600     MOVE     -501                TO SORTKEY-7.                   ST1184.2 72
   000274         027700*       NOTE THIS ITEM IS INTENTIONALLY MOVED TO AN UNSIGNED      ST1184.2
   000275         027800*             FIELD.                                              ST1184.2
   000276         027900     MOVE     +99                 TO SORTKEY-8.                   ST1184.2 70
   000277         028000 RELEASE-RECORD.                                                  ST1184.2
   000278         028100     RELEASE  SORTFILE-REC.                                       ST1184.2 69
   000279         028200 BUILD-EXIT.                                                      ST1184.2
   000280         028300     EXIT.                                                        ST1184.2
   000281         028400 OUTPROC SECTION.                                                 ST1184.2
   000282         028500 OPEN-FILES.                                                      ST1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     OPEN     OUTPUT PRINT-FILE.                                  ST1184.2 64
   000284         028700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   ST1184.2 222 163 222 182
   000285         028800     MOVE    SPACE TO TEST-RESULTS.                               ST1184.2 IMP 83
   000286         028900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             ST1184.2 535 540
   000287         029000     IF       SPAC-E IS LESS THAN "B"                             ST1184.2 82
   000288      1  029100              GO TO SPACE-IS-LESS-THAN-B.                         ST1184.2 394
   000289         029200 B-IS-LESS-THAN-SPACE SECTION.                                    ST1184.2
   000290         029300 SORT-INIT-A.                                                     ST1184.2
   000291         029400     MOVE     "SORT - 8 ASC. KEYS" TO FEATURE.                    ST1184.2 85
   000292         029500*        NOTE THE RECORDS SHOULD BE SORTED INTO THE FOLLOWING     ST1184.2
   000293         029600*             ORDER --- 8 7 6 5 4 3 1 2 --- THAT IS,              ST1184.2
   000294         029700*             THE 8TH RECORD SORTS UP TO THE 1ST POSITION,        ST1184.2
   000295         029800*             THE 7TH RECORD SORTS UP TO THE 2ND POSITION, ETC.   ST1184.2
   000296         029900 SORT-TEST-1.                                                     ST1184.2
   000297         030000     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000298         030100     IF       SORTKEY-7 EQUAL TO 418                              ST1184.2 72
   000299      1  030200              PERFORM PASS GO TO SORT-WRITE-1.                    ST1184.2 519 304
   000300         030300 SORT-FAIL-1.                                                     ST1184.2
   000301         030400     PERFORM  FAIL.                                               ST1184.2 520
   000302         030500     MOVE     SORTKEY-7 TO COMPUTED-N.                            ST1184.2 72 101
   000303         030600     MOVE     418 TO CORRECT-N.                                   ST1184.2 115
   000304         030700 SORT-WRITE-1.                                                    ST1184.2
   000305         030800     MOVE     "SORT-TEST-1 " TO PAR-NAME.                         ST1184.2 89
   000306         030900     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000307         031000 SORT-TEST-2.                                                     ST1184.2
   000308         031100     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000309         031200     IF       SORTKEY-8 EQUAL TO -14                              ST1184.2 70
   000310      1  031300              PERFORM PASS GO TO SORT-WRITE-2.                    ST1184.2 519 315
   000311         031400 SORT-FAIL-2.                                                     ST1184.2
   000312         031500     PERFORM  FAIL.                                               ST1184.2 520
   000313         031600     MOVE     SORTKEY-8 TO COMPUTED-N.                            ST1184.2 70 101
   000314         031700     MOVE     -14 TO CORRECT-N.                                   ST1184.2 115
   000315         031800 SORT-WRITE-2.                                                    ST1184.2
   000316         031900     MOVE     "SORT-TEST-2 " TO PAR-NAME.                         ST1184.2 89
   000317         032000     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000318         032100 SORT-TEST-3.                                                     ST1184.2
   000319         032200     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000320         032300     IF       SORTKEY-6 EQUAL TO "Z         "                     ST1184.2 76
   000321      1  032400              PERFORM PASS GO TO SORT-WRITE-3.                    ST1184.2 519 326
   000322         032500 SORT-FAIL-3.                                                     ST1184.2
   000323         032600     PERFORM  FAIL.                                               ST1184.2 520
   000324         032700     MOVE     SORTKEY-6 TO COMPUTED-A.                            ST1184.2 76 100
   000325         032800     MOVE     "Z         "           TO CORRECT-A.                ST1184.2 114
   000326         032900 SORT-WRITE-3.                                                    ST1184.2
   000327         033000     MOVE     "SORT-TEST-3 " TO PAR-NAME.                         ST1184.2 89
   000328         033100     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000329         033200 SORT-TEST-4.                                                     ST1184.2
   000330         033300     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000331         033400     IF       SORTKEY-5 EQUAL TO "Z                   "           ST1184.2 78
   000332      1  033500              PERFORM PASS GO TO SORT-WRITE-4.                    ST1184.2 519 337
   000333         033600 SORT-FAIL-4.                                                     ST1184.2
   000334         033700     PERFORM  FAIL.                                               ST1184.2 520
   000335         033800     MOVE     SORTKEY-5 TO COMPUTED-A.                            ST1184.2 78 100
   000336         033900     MOVE     "Z                   " TO CORRECT-A.                ST1184.2 114
   000337         034000 SORT-WRITE-4.                                                    ST1184.2
   000338         034100     MOVE     "SORT-TEST-4 " TO PAR-NAME.                         ST1184.2 89
   000339         034200     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300 SORT-TEST-5.                                                     ST1184.2
   000341         034400     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000342         034500     IF       SORTKEY-4 EQUAL TO "         X"                     ST1184.2 75
   000343      1  034600              PERFORM PASS GO TO SORT-WRITE-5.                    ST1184.2 519 348
   000344         034700 SORT-FAIL-5.                                                     ST1184.2
   000345         034800     PERFORM  FAIL.                                               ST1184.2 520
   000346         034900     MOVE     SORTKEY-4 TO COMPUTED-A.                            ST1184.2 75 100
   000347         035000     MOVE     "         X"           TO CORRECT-A.                ST1184.2 114
   000348         035100 SORT-WRITE-5.                                                    ST1184.2
   000349         035200     MOVE     "SORT-TEST-5 " TO PAR-NAME.                         ST1184.2 89
   000350         035300     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000351         035400 SORT-TEST-6.                                                     ST1184.2
   000352         035500     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000353         035600     IF       SORTKEY-3 EQUAL TO +.6000000000000000               ST1184.2 73
   000354      1  035700              PERFORM PASS GO TO SORT-WRITE-6.                    ST1184.2 519 359
   000355         035800 SORT-FAIL-6.                                                     ST1184.2
   000356         035900     PERFORM  FAIL.                                               ST1184.2 520
   000357         036000     MOVE     SORTKEY-3 TO COMPUTED-0V18.                         ST1184.2 73 103
   000358         036100     MOVE     +.6000000000000000     TO CORRECT-0V18.             ST1184.2 116
   000359         036200 SORT-WRITE-6.                                                    ST1184.2
   000360         036300     MOVE     "SORT-TEST-6 " TO PAR-NAME.                         ST1184.2 89
   000361         036400     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000362         036500 SORT-TEST-7.                                                     ST1184.2
   000363         036600     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000364         036700     IF       SORTKEY-2 EQUAL TO "    X"                          ST1184.2 77
   000365      1  036800              PERFORM PASS GO TO SORT-WRITE-7.                    ST1184.2 519 370
   000366         036900 SORT-FAIL-7.                                                     ST1184.2
   000367         037000     PERFORM  FAIL.                                               ST1184.2 520
   000368         037100     MOVE     SORTKEY-2 TO COMPUTED-A.                            ST1184.2 77 100
   000369         037200     MOVE     "    X" TO CORRECT-A.                               ST1184.2 114
   000370         037300 SORT-WRITE-7.                                                    ST1184.2
   000371         037400     MOVE     "SORT-TEST-7 " TO PAR-NAME.                         ST1184.2 89
   000372         037500     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000373         037600 SORT-TEST-8.                                                     ST1184.2
   000374         037700     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000375         037800     IF       SORTKEY-1 EQUAL TO +123456                          ST1184.2 71
   000376      1  037900              PERFORM PASS GO TO SORT-WRITE-8.                    ST1184.2 519 381
   000377         038000 SORT-FAIL-8.                                                     ST1184.2
   000378         038100     PERFORM  FAIL.                                               ST1184.2 520
   000379         038200     MOVE     SORTKEY-1 TO COMPUTED-N.                            ST1184.2 71 101
   000380         038300     MOVE     +123456 TO CORRECT-N.                               ST1184.2 115
   000381         038400 SORT-WRITE-8.                                                    ST1184.2
   000382         038500     MOVE     "SORT-TEST-8 " TO PAR-NAME.                         ST1184.2 89
   000383         038600     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000384         038700 SORT-REMARK-A.                                                   ST1184.2
   000385         038800     MOVE     SPACE TO FEATURE.                                   ST1184.2 IMP 85
   000386         038900     MOVE     "THE COLLATING SEQUENCE" TO RE-MARK.                ST1184.2 94
   000387         039000     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000388         039100     MOVE     "RENDERS TESTS 9 THRU 16" TO RE-MARK.               ST1184.2 94
   000389         039200     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000390         039300     MOVE     "UNNECESSARY." TO RE-MARK.                          ST1184.2 94
   000391         039400     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000392         039500     MOVE     "SORT - 8 ASC. KEYS" TO FEATURE.                    ST1184.2 85
   000393         039600     GO       TO CONTINUE-TESTING.                                ST1184.2 495
   000394         039700 SPACE-IS-LESS-THAN-B SECTION.                                    ST1184.2
   000395         039800 SORT-REMARK-B.                                                   ST1184.2
   000396         039900     MOVE     "THE COLLATING SEQUENCE" TO RE-MARK.                ST1184.2 94
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000398         040100     MOVE     "RENDERS TESTS 1 THRU 8" TO RE-MARK.                ST1184.2 94
   000399         040200     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000400         040300     MOVE     "UNNECESSARY." TO RE-MARK.                          ST1184.2 94
   000401         040400     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000402         040500     MOVE     "SORT - 8 ASC. KEYS" TO FEATURE.                    ST1184.2 85
   000403         040600*        NOTE THE RECORDS SHOULD BE SORTED INTO THE FOLLOWING     ST1184.2
   000404         040700*             ORDER --- 8 1 7 2 6 5 3 4 --- THAT IS,              ST1184.2
   000405         040800*             THE 1ST RECORD IS SORTED DOWN TO THE 8TH POSITION,  ST1184.2
   000406         040900*             THE 2ND RECORD SORTS UP TO THE 1ST POSITION, ETC.   ST1184.2
   000407         041000 SORT-TEST-9.                                                     ST1184.2
   000408         041100     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000409         041200     IF       SORTKEY-2 EQUAL TO "    X"                          ST1184.2 77
   000410      1  041300              PERFORM PASS GO TO SORT-WRITE-9.                    ST1184.2 519 415
   000411         041400 SORT-FAIL-9.                                                     ST1184.2
   000412         041500     PERFORM  FAIL.                                               ST1184.2 520
   000413         041600     MOVE     SORTKEY-2 TO COMPUTED-A.                            ST1184.2 77 100
   000414         041700     MOVE     "    X" TO CORRECT-A.                               ST1184.2 114
   000415         041800 SORT-WRITE-9.                                                    ST1184.2
   000416         041900     MOVE     "SORT-TEST-9 " TO PAR-NAME.                         ST1184.2 89
   000417         042000     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000418         042100 SORT-TEST-10.                                                    ST1184.2
   000419         042200     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000420         042300     IF       SORTKEY-4 EQUAL TO "         X"                     ST1184.2 75
   000421      1  042400              PERFORM PASS GO TO SORT-WRITE-10.                   ST1184.2 519 426
   000422         042500 SORT-FAIL-10.                                                    ST1184.2
   000423         042600     PERFORM  FAIL.                                               ST1184.2 520
   000424         042700     MOVE     SORTKEY-4 TO COMPUTED-A.                            ST1184.2 75 100
   000425         042800     MOVE     "         X" TO CORRECT-A.                          ST1184.2 114
   000426         042900 SORT-WRITE-10.                                                   ST1184.2
   000427         043000     MOVE     "SORT-TEST-10" TO PAR-NAME.                         ST1184.2 89
   000428         043100     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000429         043200 SORT-TEST-11.                                                    ST1184.2
   000430         043300     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000431         043400     IF       SORTKEY-7 EQUAL TO 418                              ST1184.2 72
   000432      1  043500              PERFORM PASS GO TO SORT-WRITE-11.                   ST1184.2 519 437
   000433         043600 SORT-FAIL-11.                                                    ST1184.2
   000434         043700     PERFORM  FAIL.                                               ST1184.2 520
   000435         043800     MOVE     SORTKEY-7 TO COMPUTED-N                             ST1184.2 72 101
   000436         043900     MOVE     418 TO CORRECT-N.                                   ST1184.2 115
   000437         044000 SORT-WRITE-11.                                                   ST1184.2
   000438         044100     MOVE     "SORT-TEST-11" TO PAR-NAME.                         ST1184.2 89
   000439         044200     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000440         044300 SORT-TEST-12.                                                    ST1184.2
   000441         044400     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000442         044500     IF       SORTKEY-8 EQUAL TO -14                              ST1184.2 70
   000443      1  044600              PERFORM PASS GO TO SORT-WRITE-12.                   ST1184.2 519 448
   000444         044700 SORT-FAIL-12.                                                    ST1184.2
   000445         044800     PERFORM  FAIL.                                               ST1184.2 520
   000446         044900     MOVE     SORTKEY-8 TO COMPUTED-N.                            ST1184.2 70 101
   000447         045000     MOVE     -14 TO CORRECT-N.                                   ST1184.2 115
   000448         045100 SORT-WRITE-12.                                                   ST1184.2
   000449         045200     MOVE     "SORT-TEST-12" TO PAR-NAME.                         ST1184.2 89
   000450         045300     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000451         045400 SORT-TEST-13.                                                    ST1184.2
   000452         045500     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000453         045600     IF       SORTKEY-6 EQUAL TO "Z         "                     ST1184.2 76
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  045700              PERFORM PASS GO TO SORT-WRITE-13.                   ST1184.2 519 459
   000455         045800 SORT-FAIL-13.                                                    ST1184.2
   000456         045900     PERFORM  FAIL.                                               ST1184.2 520
   000457         046000     MOVE     SORTKEY-6 TO COMPUTED-A.                            ST1184.2 76 100
   000458         046100     MOVE     "Z         "           TO CORRECT-A.                ST1184.2 114
   000459         046200 SORT-WRITE-13.                                                   ST1184.2
   000460         046300     MOVE     "SORT-TEST-13" TO PAR-NAME.                         ST1184.2 89
   000461         046400     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000462         046500 SORT-TEST-14.                                                    ST1184.2
   000463         046600     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000464         046700     IF       SORTKEY-5 EQUAL TO "Z                   "           ST1184.2 78
   000465      1  046800              PERFORM PASS GO TO SORT-WRITE-14.                   ST1184.2 519 470
   000466         046900 SORT-FAIL-14.                                                    ST1184.2
   000467         047000     PERFORM  FAIL.                                               ST1184.2 520
   000468         047100     MOVE     SORTKEY-5 TO COMPUTED-A.                            ST1184.2 78 100
   000469         047200     MOVE     "Z                   " TO CORRECT-A.                ST1184.2 114
   000470         047300 SORT-WRITE-14.                                                   ST1184.2
   000471         047400     MOVE     "SORT-TEST-14" TO PAR-NAME.                         ST1184.2 89
   000472         047500     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000473         047600 SORT-TEST-15.                                                    ST1184.2
   000474         047700     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000475         047800     IF       SORTKEY-3 EQUAL TO +.6000000000000000               ST1184.2 73
   000476      1  047900              PERFORM PASS GO TO SORT-WRITE-15.                   ST1184.2 519 481
   000477         048000 SORT-FAIL-15.                                                    ST1184.2
   000478         048100     PERFORM  FAIL.                                               ST1184.2 520
   000479         048200     MOVE     SORTKEY-3 TO COMPUTED-0V18.                         ST1184.2 73 103
   000480         048300     MOVE     +.6000000000000000     TO CORRECT-0V18.             ST1184.2 116
   000481         048400 SORT-WRITE-15.                                                   ST1184.2
   000482         048500     MOVE     "SORT-TEST-15" TO PAR-NAME.                         ST1184.2 89
   000483         048600     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000484         048700 SORT-TEST-16.                                                    ST1184.2
   000485         048800     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1184.2 67 506
   000486         048900     IF       SORTKEY-1 EQUAL TO +123456                          ST1184.2 71
   000487      1  049000              PERFORM PASS GO TO SORT-WRITE-16.                   ST1184.2 519 492
   000488         049100 SORT-FAIL-16.                                                    ST1184.2
   000489         049200     PERFORM  FAIL.                                               ST1184.2 520
   000490         049300     MOVE     SORTKEY-1 TO COMPUTED-N.                            ST1184.2 71 101
   000491         049400     MOVE     +123456 TO CORRECT-N.                               ST1184.2 115
   000492         049500 SORT-WRITE-16.                                                   ST1184.2
   000493         049600     MOVE     "SORT-TEST-16" TO PAR-NAME.                         ST1184.2 89
   000494         049700     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000495         049800 CONTINUE-TESTING SECTION.                                        ST1184.2
   000496         049900 SORT-TEST-17.                                                    ST1184.2
   000497         050000     RETURN   SORTFILE-1H AT END                                  ST1184.2 67
   000498      1  050100              PERFORM PASS GO TO SORT-WRITE-17.                   ST1184.2 519 502
   000499         050200 SORT-FAIL-17.                                                    ST1184.2
   000500         050300     MOVE     "END OF FILE NOT FOUND" TO RE-MARK.                 ST1184.2 94
   000501         050400     PERFORM  FAIL.                                               ST1184.2 520
   000502         050500 SORT-WRITE-17.                                                   ST1184.2
   000503         050600     MOVE     "SORT-TEST-17" TO PAR-NAME.                         ST1184.2 89
   000504         050700     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
   000505         050800     GO       TO OUTPROC-EXIT.                                    ST1184.2 624
   000506         050900 RETURN-ERROR.                                                    ST1184.2
   000507         051000     MOVE     "RETURN-ERROR" TO PAR-NAME.                         ST1184.2 89
   000508         051100     PERFORM  FAIL.                                               ST1184.2 520
   000509         051200     MOVE     "EOF PREMATURELY FOUND" TO RE-MARK.                 ST1184.2 94
   000510         051300     PERFORM  PRINT-DETAIL.                                       ST1184.2 523
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     GO TO CCVS1-EXIT.                                            ST1184.2 622
   000512         051500 CLOSE-FILES.                                                     ST1184.2
   000513         051600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   ST1184.2 544 565 64
   000514         051700 TERMINATE-CCVS.                                                  ST1184.2
   000515         051800     EXIT PROGRAM.                                                ST1184.2
   000516         051900 TERMINATE-CALL.                                                  ST1184.2
   000517         052000     STOP     RUN.                                                ST1184.2
   000518         052100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         ST1184.2 87 139
   000519         052200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           ST1184.2 87 140
   000520         052300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          ST1184.2 87 138
   000521         052400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      ST1184.2 87 137
   000522         052500     MOVE "****TEST DELETED****" TO RE-MARK.                      ST1184.2 94
   000523         052600 PRINT-DETAIL.                                                    ST1184.2
   000524         052700     IF REC-CT NOT EQUAL TO ZERO                                  ST1184.2 136 IMP
   000525      1  052800             MOVE "." TO PARDOT-X                                 ST1184.2 91
   000526      1  052900             MOVE REC-CT TO DOTVALUE.                             ST1184.2 136 92
   000527         053000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      ST1184.2 83 65 577
   000528         053100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               ST1184.2 87 577
   000529      1  053200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 ST1184.2 598 612
   000530      1  053300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 ST1184.2 613 621
   000531         053400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              ST1184.2 IMP 87 IMP 99
   000532         053500     MOVE SPACE TO CORRECT-X.                                     ST1184.2 IMP 113
   000533         053600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         ST1184.2 136 IMP IMP 89
   000534         053700     MOVE     SPACE TO RE-MARK.                                   ST1184.2 IMP 94
   000535         053800 HEAD-ROUTINE.                                                    ST1184.2
   000536         053900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  ST1184.2 146 66 577
   000537         054000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  ST1184.2 151 66 577
   000538         054100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  ST1184.2 160 66 577
   000539         054200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  ST1184.2 172 66 577
   000540         054300 COLUMN-NAMES-ROUTINE.                                            ST1184.2
   000541         054400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           ST1184.2 124 66 577
   000542         054500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1184.2 129 66 577
   000543         054600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        ST1184.2 216 66 577
   000544         054700 END-ROUTINE.                                                     ST1184.2
   000545         054800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.ST1184.2 216 66 577
   000546         054900 END-RTN-EXIT.                                                    ST1184.2
   000547         055000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1184.2 179 66 577
   000548         055100 END-ROUTINE-1.                                                   ST1184.2
   000549         055200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      ST1184.2 138 142 139
   000550         055300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               ST1184.2 142 137 142
   000551         055400      ADD PASS-COUNTER TO ERROR-HOLD.                             ST1184.2 140 142
   000552         055500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   ST1184.2
   000553         055600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            ST1184.2 140 202
   000554         055700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              ST1184.2 142 204
   000555         055800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                ST1184.2 201 187
   000556         055900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           ST1184.2 184 66 577
   000557         056000  END-ROUTINE-12.                                                 ST1184.2
   000558         056100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        ST1184.2 190
   000559         056200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      ST1184.2 138 IMP
   000560      1  056300         MOVE "NO " TO ERROR-TOTAL                                ST1184.2 188
   000561         056400         ELSE                                                     ST1184.2
   000562      1  056500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       ST1184.2 138 188
   000563         056600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           ST1184.2 184 66
   000564         056700     PERFORM WRITE-LINE.                                          ST1184.2 577
   000565         056800 END-ROUTINE-13.                                                  ST1184.2
   000566         056900     IF DELETE-COUNTER IS EQUAL TO ZERO                           ST1184.2 137 IMP
   000567      1  057000         MOVE "NO " TO ERROR-TOTAL  ELSE                          ST1184.2 188
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  057100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      ST1184.2 137 188
   000569         057200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   ST1184.2 190
   000570         057300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           ST1184.2 184 66 577
   000571         057400      IF   INSPECT-COUNTER EQUAL TO ZERO                          ST1184.2 139 IMP
   000572      1  057500          MOVE "NO " TO ERROR-TOTAL                               ST1184.2 188
   000573      1  057600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   ST1184.2 139 188
   000574         057700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            ST1184.2 190
   000575         057800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          ST1184.2 184 66 577
   000576         057900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           ST1184.2 192 66 577
   000577         058000 WRITE-LINE.                                                      ST1184.2
   000578         058100     ADD 1 TO RECORD-COUNT.                                       ST1184.2 144
   000579         058200     IF RECORD-COUNT GREATER 42                                   ST1184.2 144
   000580      1  058300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          ST1184.2 66 143
   000581      1  058400         MOVE SPACE TO DUMMY-RECORD                               ST1184.2 IMP 66
   000582      1  058500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  ST1184.2 66
   000583      1  058600         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    ST1184.2 146 66 593
   000584      1  058700         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    ST1184.2 151 66 593
   000585      1  058800         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    ST1184.2 160 66 593
   000586      1  058900         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    ST1184.2 172 66 593
   000587      1  059000         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            ST1184.2 124 66 593
   000588      1  059100         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            ST1184.2 129 66 593
   000589      1  059200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          ST1184.2 216 66 593
   000590      1  059300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          ST1184.2 143 66
   000591      1  059400         MOVE ZERO TO RECORD-COUNT.                               ST1184.2 IMP 144
   000592         059500     PERFORM WRT-LN.                                              ST1184.2 593
   000593         059600 WRT-LN.                                                          ST1184.2
   000594         059700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               ST1184.2 66
   000595         059800     MOVE SPACE TO DUMMY-RECORD.                                  ST1184.2 IMP 66
   000596         059900 BLANK-LINE-PRINT.                                                ST1184.2
   000597         060000     PERFORM WRT-LN.                                              ST1184.2 593
   000598         060100 FAIL-ROUTINE.                                                    ST1184.2
   000599         060200     IF     COMPUTED-X NOT EQUAL TO SPACE                         ST1184.2 99 IMP
   000600      1  060300            GO TO   FAIL-ROUTINE-WRITE.                           ST1184.2 607
   000601         060400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.ST1184.2 113 IMP 607
   000602         060500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 ST1184.2 145 215
   000603         060600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   ST1184.2 210
   000604         060700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1184.2 207 66 577
   000605         060800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         ST1184.2 IMP 215
   000606         060900     GO TO  FAIL-ROUTINE-EX.                                      ST1184.2 612
   000607         061000 FAIL-ROUTINE-WRITE.                                              ST1184.2
   000608         061100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         ST1184.2 95 65 577
   000609         061200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 ST1184.2 145 123
   000610         061300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. ST1184.2 110 65 577
   000611         061400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         ST1184.2 IMP 123
   000612         061500 FAIL-ROUTINE-EX. EXIT.                                           ST1184.2
   000613         061600 BAIL-OUT.                                                        ST1184.2
   000614         061700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   ST1184.2 100 IMP 616
   000615         061800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           ST1184.2 114 IMP 621
   000616         061900 BAIL-OUT-WRITE.                                                  ST1184.2
   000617         062000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  ST1184.2 114 214 100 212
   000618         062100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 ST1184.2 145 215
   000619         062200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1184.2 207 66 577
   000620         062300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         ST1184.2 IMP 215
   000621         062400 BAIL-OUT-EX. EXIT.                                               ST1184.2
   000622         062500 CCVS1-EXIT.                                                      ST1184.2
   000623         062600     EXIT.                                                        ST1184.2
   000624         062700 OUTPROC-EXIT SECTION.                                            ST1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800 EXIT-ONLY.                                                       ST1184.2
   000626         062900     PERFORM  CLOSE-FILES.                                        ST1184.2 512
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      145   ANSI-REFERENCE . . . . . . . .  602 609 618
      124   CCVS-C-1 . . . . . . . . . . .  541 587
      129   CCVS-C-2 . . . . . . . . . . .  542 588
      179   CCVS-E-1 . . . . . . . . . . .  547
      184   CCVS-E-2 . . . . . . . . . . .  556 563 570 575
      187   CCVS-E-2-2 . . . . . . . . . .  M555
      192   CCVS-E-3 . . . . . . . . . . .  576
      201   CCVS-E-4 . . . . . . . . . . .  555
      202   CCVS-E-4-1 . . . . . . . . . .  M553
      204   CCVS-E-4-2 . . . . . . . . . .  M554
      146   CCVS-H-1 . . . . . . . . . . .  536 583
      151   CCVS-H-2A. . . . . . . . . . .  537 584
      160   CCVS-H-2B. . . . . . . . . . .  538 585
      172   CCVS-H-3 . . . . . . . . . . .  539 586
      222   CCVS-PGM-ID. . . . . . . . . .  284 284
      106   CM-18V0
      100   COMPUTED-A . . . . . . . . . .  101 103 104 105 106 M324 M335 M346 M368 M413 M424 M457 M468 614 617
      101   COMPUTED-N . . . . . . . . . .  M302 M313 M379 M435 M446 M490
       99   COMPUTED-X . . . . . . . . . .  M531 599
      103   COMPUTED-0V18. . . . . . . . .  M357 M479
      105   COMPUTED-14V4
      107   COMPUTED-18V0
      104   COMPUTED-4V14
      123   COR-ANSI-REFERENCE . . . . . .  M609 M611
      114   CORRECT-A. . . . . . . . . . .  115 116 117 118 119 M325 M336 M347 M369 M414 M425 M458 M469 615 617
      115   CORRECT-N. . . . . . . . . . .  M303 M314 M380 M436 M447 M491
      113   CORRECT-X. . . . . . . . . . .  M532 601
      116   CORRECT-0V18 . . . . . . . . .  M358 M480
      118   CORRECT-14V4
      120   CORRECT-18V0
      117   CORRECT-4V14
      119   CR-18V0
      137   DELETE-COUNTER . . . . . . . .  M521 550 566 568
       92   DOTVALUE . . . . . . . . . . .  M526
      143   DUMMY-HOLD . . . . . . . . . .  M580 590
       66   DUMMY-RECORD . . . . . . . . .  M536 M537 M538 M539 M541 M542 M543 M545 M547 M556 M563 M570 M575 M576 580 M581
                                            582 M583 M584 M585 M586 M587 M588 M589 M590 594 M595 M604 M619
      190   ENDER-DESC . . . . . . . . . .  M558 M569 M574
      138   ERROR-COUNTER. . . . . . . . .  M520 549 559 562
      142   ERROR-HOLD . . . . . . . . . .  M549 M550 M550 M551 554
      188   ERROR-TOTAL. . . . . . . . . .  M560 M562 M567 M568 M572 M573
       85   FEATURE. . . . . . . . . . . .  M291 M385 M392 M402
      216   HYPHEN-LINE. . . . . . . . . .  543 545 589
      182   ID-AGAIN . . . . . . . . . . .  M284
      215   INF-ANSI-REFERENCE . . . . . .  M602 M605 M618 M620
      210   INFO-TEXT. . . . . . . . . . .  M603
      139   INSPECT-COUNTER. . . . . . . .  M518 549 571 573
       87   P-OR-F . . . . . . . . . . . .  M518 M519 M520 M521 528 M531
       89   PAR-NAME . . . . . . . . . . .  M305 M316 M327 M338 M349 M360 M371 M382 M416 M427 M438 M449 M460 M471 M482 M493
                                            M503 M507 M533
       91   PARDOT-X . . . . . . . . . . .  M525
      140   PASS-COUNTER . . . . . . . . .  M519 551 553
       64   PRINT-FILE . . . . . . . . . .  58 283 513
       65   PRINT-REC. . . . . . . . . . .  M527 M608 M610
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    16
0 Defined   Cross-reference of data names   References

0      94   RE-MARK. . . . . . . . . . . .  M386 M388 M390 M396 M398 M400 M500 M509 M522 M534
      136   REC-CT . . . . . . . . . . . .  524 526 533
      135   REC-SKL-SUB
      144   RECORD-COUNT . . . . . . . . .  M578 579 M591
       69   SORTFILE-REC . . . . . . . . .  278
       67   SORTFILE-1H. . . . . . . . . .  60 227 297 308 319 330 341 352 363 374 408 419 430 441 452 463 474 485 497
       71   SORTKEY-1. . . . . . . . . . .  228 M242 M267 375 379 486 490
       77   SORTKEY-2. . . . . . . . . . .  229 M245 M268 364 368 409 413
       73   SORTKEY-3. . . . . . . . . . .  230 M248 M269 353 357 475 479
       75   SORTKEY-4. . . . . . . . . . .  231 M251 M270 342 346 420 424
       78   SORTKEY-5. . . . . . . . . . .  232 M254 M271 331 335 464 468
       76   SORTKEY-6. . . . . . . . . . .  233 M257 M272 320 324 453 457
       72   SORTKEY-7. . . . . . . . . . .  234 M260 M273 298 302 431 435
       70   SORTKEY-8. . . . . . . . . . .  235 M263 M276 309 313 442 446
       82   SPAC-E . . . . . . . . . . . .  287
       95   TEST-COMPUTED. . . . . . . . .  608
      110   TEST-CORRECT . . . . . . . . .  610
      163   TEST-ID. . . . . . . . . . . .  M284
       83   TEST-RESULTS . . . . . . . . .  M285 527
      141   TOTAL-ERROR
       81   UTIL-CTR
      212   XXCOMPUTED . . . . . . . . . .  M617
      214   XXCORRECT. . . . . . . . . . .  M617
      207   XXINFO . . . . . . . . . . . .  604 619
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    17
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

      289   B-IS-LESS-THAN-SPACE
      613   BAIL-OUT . . . . . . . . . . .  P530
      621   BAIL-OUT-EX. . . . . . . . . .  E530 G615
      616   BAIL-OUT-WRITE . . . . . . . .  G614
      596   BLANK-LINE-PRINT
      279   BUILD-EXIT . . . . . . . . . .  G265
      240   BUILD-FILE
      266   BUILD-RECORD . . . . . . . . .  P241 P244 P247 P250 P253 P256 P259 P262
      622   CCVS1-EXIT . . . . . . . . . .  G511
      512   CLOSE-FILES. . . . . . . . . .  P626
      540   COLUMN-NAMES-ROUTINE . . . . .  E286
      495   CONTINUE-TESTING . . . . . . .  G393
      521   DE-LETE
      544   END-ROUTINE. . . . . . . . . .  P513
      548   END-ROUTINE-1
      557   END-ROUTINE-12
      565   END-ROUTINE-13 . . . . . . . .  E513
      546   END-RTN-EXIT
      625   EXIT-ONLY
      520   FAIL . . . . . . . . . . . . .  P301 P312 P323 P334 P345 P356 P367 P378 P412 P423 P434 P445 P456 P467 P478 P489
                                            P501 P508
      598   FAIL-ROUTINE . . . . . . . . .  P529
      612   FAIL-ROUTINE-EX. . . . . . . .  E529 G606
      607   FAIL-ROUTINE-WRITE . . . . . .  G600 G601
      535   HEAD-ROUTINE . . . . . . . . .  P286
      239   INPROC . . . . . . . . . . . .  P236
      518   INSPT
      282   OPEN-FILES
      281   OUTPROC. . . . . . . . . . . .  P237
      624   OUTPROC-EXIT . . . . . . . . .  E237 G505
      519   PASS . . . . . . . . . . . . .  P299 P310 P321 P332 P343 P354 P365 P376 P410 P421 P432 P443 P454 P465 P476 P487
                                            P498
      523   PRINT-DETAIL . . . . . . . . .  P306 P317 P328 P339 P350 P361 P372 P383 P387 P389 P391 P397 P399 P401 P417 P428
                                            P439 P450 P461 P472 P483 P494 P504 P510
      277   RELEASE-RECORD . . . . . . . .  P243 P246 P249 P252 P255 P258 P261 P264
      506   RETURN-ERROR . . . . . . . . .  G297 G308 G319 G330 G341 G352 G363 G374 G408 G419 G430 G441 G452 G463 G474 G485
      300   SORT-FAIL-1
      422   SORT-FAIL-10
      433   SORT-FAIL-11
      444   SORT-FAIL-12
      455   SORT-FAIL-13
      466   SORT-FAIL-14
      477   SORT-FAIL-15
      488   SORT-FAIL-16
      499   SORT-FAIL-17
      311   SORT-FAIL-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    18
0 Defined   Cross-reference of procedures   References

0     322   SORT-FAIL-3
      333   SORT-FAIL-4
      344   SORT-FAIL-5
      355   SORT-FAIL-6
      366   SORT-FAIL-7
      377   SORT-FAIL-8
      411   SORT-FAIL-9
      290   SORT-INIT-A
      225   SORT-PARA
      226   SORT-PARAGRAPH
      384   SORT-REMARK-A
      395   SORT-REMARK-B
      296   SORT-TEST-1
      418   SORT-TEST-10
      429   SORT-TEST-11
      440   SORT-TEST-12
      451   SORT-TEST-13
      462   SORT-TEST-14
      473   SORT-TEST-15
      484   SORT-TEST-16
      496   SORT-TEST-17
      307   SORT-TEST-2
      318   SORT-TEST-3
      329   SORT-TEST-4
      340   SORT-TEST-5
      351   SORT-TEST-6
      362   SORT-TEST-7
      373   SORT-TEST-8
      407   SORT-TEST-9
      304   SORT-WRITE-1 . . . . . . . . .  G299
      426   SORT-WRITE-10. . . . . . . . .  G421
      437   SORT-WRITE-11. . . . . . . . .  G432
      448   SORT-WRITE-12. . . . . . . . .  G443
      459   SORT-WRITE-13. . . . . . . . .  G454
      470   SORT-WRITE-14. . . . . . . . .  G465
      481   SORT-WRITE-15. . . . . . . . .  G476
      492   SORT-WRITE-16. . . . . . . . .  G487
      502   SORT-WRITE-17. . . . . . . . .  G498
      315   SORT-WRITE-2 . . . . . . . . .  G310
      326   SORT-WRITE-3 . . . . . . . . .  G321
      337   SORT-WRITE-4 . . . . . . . . .  G332
      348   SORT-WRITE-5 . . . . . . . . .  G343
      359   SORT-WRITE-6 . . . . . . . . .  G354
      370   SORT-WRITE-7 . . . . . . . . .  G365
      381   SORT-WRITE-8 . . . . . . . . .  G376
      415   SORT-WRITE-9 . . . . . . . . .  G410
      394   SPACE-IS-LESS-THAN-B . . . . .  G288
      516   TERMINATE-CALL
      514   TERMINATE-CCVS
      577   WRITE-LINE . . . . . . . . . .  P527 P528 P536 P537 P538 P539 P541 P542 P543 P545 P547 P556 P564 P570 P575 P576
                                            P604 P608 P610 P619
      593   WRT-LN . . . . . . . . . . . .  P583 P584 P585 P586 P587 P588 P589 P592 P597
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    19
0 Defined   Cross-reference of programs     References

        3   ST118A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST118A    Date 06/04/2022  Time 11:59:22   Page    20
0LineID  Message code  Message text

     64  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program ST118A:
 *    Source records = 626
 *    Data Division statements = 74
 *    Procedure Division statements = 364
 *    Generated COBOL statements = 0
 *    Program complexity factor = 371
0End of compilation 1,  program ST118A,  highest severity 0.
0Return code 0
