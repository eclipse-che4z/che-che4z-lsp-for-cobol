1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:16   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:16   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         ST1274.2
   000002         000200 PROGRAM-ID.                                                      ST1274.2
   000003         000300     ST127A.                                                      ST1274.2
   000004         000500*                                                              *  ST1274.2
   000005         000600*    VALIDATION FOR:-                                          *  ST1274.2
   000006         000700*                                                              *  ST1274.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".ST1274.2
   000008         000900*                                                              *  ST1274.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".ST1274.2
   000010         001100*                                                              *  ST1274.2
   000011         001300*                                                              *  ST1274.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  ST1274.2
   000013         001500*                                                              *  ST1274.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  ST1274.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  ST1274.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  ST1274.2
   000017         001900*        X-27  - SORT-FILE-NAME-1                              *  ST1274.2
   000018         002000*                                                              *  ST1274.2
   000019         002200*    ST127A IS A COMPLETELY SELF-CONTAINED PROGRAM.  THE INPUT    ST1274.2
   000020         002300*    PROCEDURE BUILDS THE 17-RECORD FILE SHOWN BELOW. THE         ST1274.2
   000021         002400*    OUTPUT PROCEDURE CHECKS THE SORTED FILE AND GENERATES THE    ST1274.2
   000022         002500*    REPORT.                                                      ST1274.2
   000023         002600*    SORT    SORT   SORT    SORT   SORT   SORT   SORT  SORT  LAST ST1274.2
   000024         002700*    KEY-1   KEY-2  KEY-3   KEY-4  KEY-5  KEY-6  KEY-7 KEY-8 CHAR ST1274.2
   000025         002800*    S9(6)   A(5)   SV9(16) X(10)  A(20)  X(10)  999   S99   PIC XST1274.2
   000026         002900*    USAGE   JUST           JUST                       USAGE      ST1274.2
   000027         003000*    COMP    RIGHT          RIGHT                      COMP       ST1274.2
   000028         003100*                                                                 ST1274.2
   000029         003200*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  501  +99     1  ST1274.2
   000030         003300*    +123456  BBB  -.1234  BBBBBB A     AAAAAAAA  501  +99        ST1274.2
   000031         003400*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  501  +99     2  ST1274.2
   000032         003500*    -054321    X  -.1234  BBBBBB A     AAAAAAAA  501  +99        ST1274.2
   000033         003600*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  501  +99     3  ST1274.2
   000034         003700*    -054321  BBB  +.6     BBBBBB A     AAAAAAAA  501  +99        ST1274.2
   000035         003800*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  501  +99     4  ST1274.2
   000036         003900*    -054321  BBB  -.1234       X A     AAAAAAAA  501  +99        ST1274.2
   000037         004000*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  501  +99     5  ST1274.2
   000038         004100*    -054321  BBB  -.1234  BBBBBB Z     AAAAAAAA  501  +99        ST1274.2
   000039         004200*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  501  +99     6  ST1274.2
   000040         004300*    -054321  BBB  -.1234  BBBBBB A     Z         501  +99        ST1274.2
   000041         004400*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  501  +99     7  ST1274.2
   000042         004500*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  418  +99        ST1274.2
   000043         004600*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  501  +99     8  ST1274.2
   000044         004700*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  501  -14        ST1274.2
   000045         004800*    -054321  BBB  -.1234  BBBBBB A     AAAAAAAA  501  +99     9  ST1274.2
   000046         004900*                                                                 ST1274.2
   000047         005000*    THIS PROGRAM TESTS THE USE OF THE "DUPLICATES" PHRASE OF     ST1274.2
   000048         005100*    THE  "SORT" STATEMENT.  THE ORDER OF RECORDS HAVING          ST1274.2
   000049         005200*    DUPLICATE KEYS AFTER THE EXECUTION OF A "SORT" STATEMENT     ST1274.2
   000050         005300*    MUST BE THE SAME AS THE ORDER OF THOSE RECORDS ON INPUT      ST1274.2
   000051         005400*    TO THE "SORT" STATEMENT.                                     ST1274.2
   000052         005500                                                                  ST1274.2
   000053         005600 ENVIRONMENT DIVISION.                                            ST1274.2
   000054         005700 CONFIGURATION SECTION.                                           ST1274.2
   000055         005800 SOURCE-COMPUTER.                                                 ST1274.2
   000056         005900     XXXXX082.                                                    ST1274.2
   000057         006000 OBJECT-COMPUTER.                                                 ST1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100     XXXXX083.                                                    ST1274.2
   000059         006200 INPUT-OUTPUT SECTION.                                            ST1274.2
   000060         006300 FILE-CONTROL.                                                    ST1274.2
   000061         006400     SELECT PRINT-FILE ASSIGN TO                                  ST1274.2 67
   000062         006500     XXXXX055.                                                    ST1274.2
   000063         006600     SELECT   SORTFILE-1H ASSIGN TO                               ST1274.2 70
   000064         006700     XXXXX027.                                                    ST1274.2
   000065         006800 DATA DIVISION.                                                   ST1274.2
   000066         006900 FILE SECTION.                                                    ST1274.2
   000067         007000 FD  PRINT-FILE.                                                  ST1274.2

 ==000067==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000068         007100 01  PRINT-REC PICTURE X(120).                                    ST1274.2
   000069         007200 01  DUMMY-RECORD PICTURE X(120).                                 ST1274.2
   000070         007300 SD  SORTFILE-1H                                                  ST1274.2
   000071         007400     DATA RECORD IS SORTFILE-REC.                                 ST1274.2 *
   000072         007500 01  SORTFILE-REC.                                                ST1274.2
   000073         007600   05 SORT-1.                                                     ST1274.2
   000074         007700     10 SORTKEY-8       PICTURE S99 COMPUTATIONAL.                ST1274.2
   000075         007800     10 SORTKEY-1       PICTURE S9(6) COMPUTATIONAL.              ST1274.2
   000076         007900     10 SORTKEY-7       PICTURE 999.                              ST1274.2
   000077         008000     10 SORTKEY-3       PICTURE SV9(16).                          ST1274.2
   000078         008100     10 FILLER          PICTURE XX.                               ST1274.2
   000079         008200     10 SORTKEY-4       PICTURE X(10) JUSTIFIED RIGHT.            ST1274.2
   000080         008300     10 SORTKEY-6       PICTURE X(10).                            ST1274.2
   000081         008400     10 SORTKEY-2       PICTURE A(05) JUSTIFIED RIGHT.            ST1274.2
   000082         008500     10 SORTKEY-5       PICTURE A(20).                            ST1274.2
   000083         008600     10 FILLER          PICTURE XXX.                              ST1274.2
   000084         008700  05    SORT-IDENTIFIER PICTURE X.                                ST1274.2
   000085         008800 WORKING-STORAGE SECTION.                                         ST1274.2
   000086         008900 77  WS-IDENTIFIER      PIC 9.                                    ST1274.2
   000087         009000 01  WS-SORTFILE-REC.                                             ST1274.2
   000088         009100     02 WS-8            PICTURE S99 COMPUTATIONAL.                ST1274.2
   000089         009200     02 WS-1            PICTURE S9(6) COMPUTATIONAL.              ST1274.2
   000090         009300     02 WS-7            PICTURE 999.                              ST1274.2
   000091         009400     02 WS-3            PICTURE SV9(16).                          ST1274.2
   000092         009500     02 FILLER          PICTURE XX.                               ST1274.2
   000093         009600     02 WS-4            PICTURE X(10) JUSTIFIED RIGHT.            ST1274.2
   000094         009700     02 WS-6            PICTURE X(10).                            ST1274.2
   000095         009800     02 WS-2            PICTURE A(05) JUSTIFIED RIGHT.            ST1274.2
   000096         009900     02 WS-5            PICTURE A(20).                            ST1274.2
   000097         010000     02 FILLER          PICTURE XXX.                              ST1274.2
   000098         010100 77  UTIL-CTR           PICTURE S99999.                           ST1274.2
   000099         010200 77  SPAC-E             PICTURE X VALUE " ".                      ST1274.2
   000100         010300 01  TEST-RESULTS.                                                ST1274.2
   000101         010400     02 FILLER                   PIC X      VALUE SPACE.          ST1274.2 IMP
   000102         010500     02 FEATURE                  PIC X(20)  VALUE SPACE.          ST1274.2 IMP
   000103         010600     02 FILLER                   PIC X      VALUE SPACE.          ST1274.2 IMP
   000104         010700     02 P-OR-F                   PIC X(5)   VALUE SPACE.          ST1274.2 IMP
   000105         010800     02 FILLER                   PIC X      VALUE SPACE.          ST1274.2 IMP
   000106         010900     02  PAR-NAME.                                                ST1274.2
   000107         011000       03 FILLER                 PIC X(19)  VALUE SPACE.          ST1274.2 IMP
   000108         011100       03  PARDOT-X              PIC X      VALUE SPACE.          ST1274.2 IMP
   000109         011200       03 DOTVALUE               PIC 99     VALUE ZERO.           ST1274.2 IMP
   000110         011300     02 FILLER                   PIC X(8)   VALUE SPACE.          ST1274.2 IMP
   000111         011400     02 RE-MARK                  PIC X(61).                       ST1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  TEST-COMPUTED.                                               ST1274.2
   000113         011600     02 FILLER                   PIC X(30)  VALUE SPACE.          ST1274.2 IMP
   000114         011700     02 FILLER                   PIC X(17)  VALUE                 ST1274.2
   000115         011800            "       COMPUTED=".                                   ST1274.2
   000116         011900     02 COMPUTED-X.                                               ST1274.2
   000117         012000     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          ST1274.2 IMP
   000118         012100     03 COMPUTED-N               REDEFINES COMPUTED-A             ST1274.2 117
   000119         012200                                 PIC -9(9).9(9).                  ST1274.2
   000120         012300     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         ST1274.2 117
   000121         012400     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     ST1274.2 117
   000122         012500     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     ST1274.2 117
   000123         012600     03       CM-18V0 REDEFINES COMPUTED-A.                       ST1274.2 117
   000124         012700         04 COMPUTED-18V0                    PIC -9(18).          ST1274.2
   000125         012800         04 FILLER                           PIC X.               ST1274.2
   000126         012900     03 FILLER PIC X(50) VALUE SPACE.                             ST1274.2 IMP
   000127         013000 01  TEST-CORRECT.                                                ST1274.2
   000128         013100     02 FILLER PIC X(30) VALUE SPACE.                             ST1274.2 IMP
   000129         013200     02 FILLER PIC X(17) VALUE "       CORRECT =".                ST1274.2
   000130         013300     02 CORRECT-X.                                                ST1274.2
   000131         013400     03 CORRECT-A                  PIC X(20) VALUE SPACE.         ST1274.2 IMP
   000132         013500     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      ST1274.2 131
   000133         013600     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         ST1274.2 131
   000134         013700     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     ST1274.2 131
   000135         013800     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     ST1274.2 131
   000136         013900     03      CR-18V0 REDEFINES CORRECT-A.                         ST1274.2 131
   000137         014000         04 CORRECT-18V0                     PIC -9(18).          ST1274.2
   000138         014100         04 FILLER                           PIC X.               ST1274.2
   000139         014200     03 FILLER PIC X(2) VALUE SPACE.                              ST1274.2 IMP
   000140         014300     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     ST1274.2 IMP
   000141         014400 01  CCVS-C-1.                                                    ST1274.2
   000142         014500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAST1274.2
   000143         014600-    "SS  PARAGRAPH-NAME                                          ST1274.2
   000144         014700-    "       REMARKS".                                            ST1274.2
   000145         014800     02 FILLER                     PIC X(20)    VALUE SPACE.      ST1274.2 IMP
   000146         014900 01  CCVS-C-2.                                                    ST1274.2
   000147         015000     02 FILLER                     PIC X        VALUE SPACE.      ST1274.2 IMP
   000148         015100     02 FILLER                     PIC X(6)     VALUE "TESTED".   ST1274.2
   000149         015200     02 FILLER                     PIC X(15)    VALUE SPACE.      ST1274.2 IMP
   000150         015300     02 FILLER                     PIC X(4)     VALUE "FAIL".     ST1274.2
   000151         015400     02 FILLER                     PIC X(94)    VALUE SPACE.      ST1274.2 IMP
   000152         015500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       ST1274.2 IMP
   000153         015600 01  REC-CT                        PIC 99       VALUE ZERO.       ST1274.2 IMP
   000154         015700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       ST1274.2 IMP
   000155         015800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       ST1274.2 IMP
   000156         015900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       ST1274.2 IMP
   000157         016000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       ST1274.2 IMP
   000158         016100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       ST1274.2 IMP
   000159         016200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       ST1274.2 IMP
   000160         016300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      ST1274.2 IMP
   000161         016400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       ST1274.2 IMP
   000162         016500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     ST1274.2 IMP
   000163         016600 01  CCVS-H-1.                                                    ST1274.2
   000164         016700     02  FILLER                    PIC X(39)    VALUE SPACES.     ST1274.2 IMP
   000165         016800     02  FILLER                    PIC X(42)    VALUE             ST1274.2
   000166         016900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 ST1274.2
   000167         017000     02  FILLER                    PIC X(39)    VALUE SPACES.     ST1274.2 IMP
   000168         017100 01  CCVS-H-2A.                                                   ST1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200   02  FILLER                        PIC X(40)  VALUE SPACE.      ST1274.2 IMP
   000170         017300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  ST1274.2
   000171         017400   02  FILLER                        PIC XXXX   VALUE             ST1274.2
   000172         017500     "4.2 ".                                                      ST1274.2
   000173         017600   02  FILLER                        PIC X(28)  VALUE             ST1274.2
   000174         017700            " COPY - NOT FOR DISTRIBUTION".                       ST1274.2
   000175         017800   02  FILLER                        PIC X(41)  VALUE SPACE.      ST1274.2 IMP
   000176         017900                                                                  ST1274.2
   000177         018000 01  CCVS-H-2B.                                                   ST1274.2
   000178         018100   02  FILLER                        PIC X(15)  VALUE             ST1274.2
   000179         018200            "TEST RESULT OF ".                                    ST1274.2
   000180         018300   02  TEST-ID                       PIC X(9).                    ST1274.2
   000181         018400   02  FILLER                        PIC X(4)   VALUE             ST1274.2
   000182         018500            " IN ".                                               ST1274.2
   000183         018600   02  FILLER                        PIC X(12)  VALUE             ST1274.2
   000184         018700     " HIGH       ".                                              ST1274.2
   000185         018800   02  FILLER                        PIC X(22)  VALUE             ST1274.2
   000186         018900            " LEVEL VALIDATION FOR ".                             ST1274.2
   000187         019000   02  FILLER                        PIC X(58)  VALUE             ST1274.2
   000188         019100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".ST1274.2
   000189         019200 01  CCVS-H-3.                                                    ST1274.2
   000190         019300     02  FILLER                      PIC X(34)  VALUE             ST1274.2
   000191         019400            " FOR OFFICIAL USE ONLY    ".                         ST1274.2
   000192         019500     02  FILLER                      PIC X(58)  VALUE             ST1274.2
   000193         019600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".ST1274.2
   000194         019700     02  FILLER                      PIC X(28)  VALUE             ST1274.2
   000195         019800            "  COPYRIGHT   1985 ".                                ST1274.2
   000196         019900 01  CCVS-E-1.                                                    ST1274.2
   000197         020000     02 FILLER                       PIC X(52)  VALUE SPACE.      ST1274.2 IMP
   000198         020100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              ST1274.2
   000199         020200     02 ID-AGAIN                     PIC X(9).                    ST1274.2
   000200         020300     02 FILLER                       PIC X(45)  VALUE SPACES.     ST1274.2 IMP
   000201         020400 01  CCVS-E-2.                                                    ST1274.2
   000202         020500     02  FILLER                      PIC X(31)  VALUE SPACE.      ST1274.2 IMP
   000203         020600     02  FILLER                      PIC X(21)  VALUE SPACE.      ST1274.2 IMP
   000204         020700     02 CCVS-E-2-2.                                               ST1274.2
   000205         020800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      ST1274.2 IMP
   000206         020900         03 FILLER                   PIC X      VALUE SPACE.      ST1274.2 IMP
   000207         021000         03 ENDER-DESC               PIC X(44)  VALUE             ST1274.2
   000208         021100            "ERRORS ENCOUNTERED".                                 ST1274.2
   000209         021200 01  CCVS-E-3.                                                    ST1274.2
   000210         021300     02  FILLER                      PIC X(22)  VALUE             ST1274.2
   000211         021400            " FOR OFFICIAL USE ONLY".                             ST1274.2
   000212         021500     02  FILLER                      PIC X(12)  VALUE SPACE.      ST1274.2 IMP
   000213         021600     02  FILLER                      PIC X(58)  VALUE             ST1274.2
   000214         021700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".ST1274.2
   000215         021800     02  FILLER                      PIC X(13)  VALUE SPACE.      ST1274.2 IMP
   000216         021900     02 FILLER                       PIC X(15)  VALUE             ST1274.2
   000217         022000             " COPYRIGHT 1985".                                   ST1274.2
   000218         022100 01  CCVS-E-4.                                                    ST1274.2
   000219         022200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      ST1274.2 IMP
   000220         022300     02 FILLER                       PIC X(4)   VALUE " OF ".     ST1274.2
   000221         022400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      ST1274.2 IMP
   000222         022500     02 FILLER                       PIC X(40)  VALUE             ST1274.2
   000223         022600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       ST1274.2
   000224         022700 01  XXINFO.                                                      ST1274.2
   000225         022800     02 FILLER                       PIC X(19)  VALUE             ST1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900            "*** INFORMATION ***".                                ST1274.2
   000227         023000     02 INFO-TEXT.                                                ST1274.2
   000228         023100       04 FILLER                     PIC X(8)   VALUE SPACE.      ST1274.2 IMP
   000229         023200       04 XXCOMPUTED                 PIC X(20).                   ST1274.2
   000230         023300       04 FILLER                     PIC X(5)   VALUE SPACE.      ST1274.2 IMP
   000231         023400       04 XXCORRECT                  PIC X(20).                   ST1274.2
   000232         023500     02 INF-ANSI-REFERENCE           PIC X(48).                   ST1274.2
   000233         023600 01  HYPHEN-LINE.                                                 ST1274.2
   000234         023700     02 FILLER  PIC IS X VALUE IS SPACE.                          ST1274.2 IMP
   000235         023800     02 FILLER  PIC IS X(65)    VALUE IS "************************ST1274.2
   000236         023900-    "*****************************************".                 ST1274.2
   000237         024000     02 FILLER  PIC IS X(54)    VALUE IS "************************ST1274.2
   000238         024100-    "******************************".                            ST1274.2
   000239         024200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             ST1274.2
   000240         024300     "ST127A".                                                    ST1274.2
   000241         024400 PROCEDURE DIVISION.                                              ST1274.2
   000242         024500 SORT-PARA SECTION.                                               ST1274.2
   000243         024600 SORT-PARAGRAPH.                                                  ST1274.2
   000244         024700     MOVE    "XI-18 4.4.4 GR(3)b" TO ANSI-REFERENCE.              ST1274.2 162
   000245         024800     SORT     SORTFILE-1H ON                                      ST1274.2 70
   000246         024900              ASCENDING KEY SORTKEY-1                             ST1274.2 75
   000247         025000              ASCENDING SORTKEY-2                                 ST1274.2 81
   000248         025100              ASCENDING SORTKEY-3                                 ST1274.2 77
   000249         025200              ASCENDING SORTKEY-4                                 ST1274.2 79
   000250         025300              ASCENDING SORTKEY-5                                 ST1274.2 82
   000251         025400              ASCENDING SORTKEY-6                                 ST1274.2 80
   000252         025500              ASCENDING SORTKEY-7                                 ST1274.2 76
   000253         025600              ASCENDING SORTKEY-8                                 ST1274.2 74
   000254         025700              WITH DUPLICATES IN ORDER                            ST1274.2
   000255         025800              INPUT PROCEDURE INPROC                              ST1274.2 258
   000256         025900              OUTPUT PROCEDURE OUTPROC THRU OUTPROC-EXIT.         ST1274.2 338 686
   000257         026000     STOP     RUN.                                                ST1274.2
   000258         026100 INPROC SECTION.                                                  ST1274.2
   000259         026200 BUILD-FILE.                                                      ST1274.2
   000260         026300     MOVE     ZERO TO WS-IDENTIFIER.                              ST1274.2 IMP 86
   000261         026400     PERFORM  BUILD-RECORD.                                       ST1274.2 322
   000262         026500     MOVE     SORT-1              TO WS-SORTFILE-REC.             ST1274.2 73 87
   000263         026600     ADD      1 TO WS-IDENTIFIER.                                 ST1274.2 86
   000264         026700     MOVE     WS-IDENTIFIER       TO SORT-IDENTIFIER.             ST1274.2 86 84
   000265         026800     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000266         026900     MOVE     +123456             TO SORTKEY-1.                   ST1274.2 75
   000267         027000     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000268         027100     MOVE     WS-SORTFILE-REC     TO SORTFILE-REC.                ST1274.2 87 72
   000269         027200     ADD      1 TO WS-IDENTIFIER.                                 ST1274.2 86
   000270         027300     MOVE     WS-IDENTIFIER       TO SORT-IDENTIFIER.             ST1274.2 86 84
   000271         027400     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000272         027500     PERFORM  BUILD-RECORD.                                       ST1274.2 322
   000273         027600     MOVE     "X"                 TO SORTKEY-2.                   ST1274.2 81
   000274         027700     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000275         027800     MOVE     WS-SORTFILE-REC     TO SORTFILE-REC.                ST1274.2 87 72
   000276         027900     ADD      1 TO WS-IDENTIFIER.                                 ST1274.2 86
   000277         028000     MOVE     WS-IDENTIFIER       TO SORT-IDENTIFIER.             ST1274.2 86 84
   000278         028100     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000279         028200     PERFORM  BUILD-RECORD.                                       ST1274.2 322
   000280         028300     MOVE     +.6                 TO SORTKEY-3.                   ST1274.2 77
   000281         028400     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000282         028500     MOVE     WS-SORTFILE-REC     TO SORTFILE-REC.                ST1274.2 87 72
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     ADD      1 TO WS-IDENTIFIER.                                 ST1274.2 86
   000284         028700     MOVE     WS-IDENTIFIER       TO SORT-IDENTIFIER.             ST1274.2 86 84
   000285         028800     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000286         028900     PERFORM  BUILD-RECORD.                                       ST1274.2 322
   000287         029000     MOVE     "X"                 TO SORTKEY-4.                   ST1274.2 79
   000288         029100     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000289         029200     MOVE     WS-SORTFILE-REC     TO SORTFILE-REC.                ST1274.2 87 72
   000290         029300     ADD      1 TO WS-IDENTIFIER.                                 ST1274.2 86
   000291         029400     MOVE     WS-IDENTIFIER       TO SORT-IDENTIFIER.             ST1274.2 86 84
   000292         029500     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000293         029600     PERFORM  BUILD-RECORD.                                       ST1274.2 322
   000294         029700     MOVE     "Z"                 TO SORTKEY-5.                   ST1274.2 82
   000295         029800     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000296         029900     MOVE     WS-SORTFILE-REC     TO SORTFILE-REC.                ST1274.2 87 72
   000297         030000     ADD      1 TO WS-IDENTIFIER.                                 ST1274.2 86
   000298         030100     MOVE     WS-IDENTIFIER       TO SORT-IDENTIFIER.             ST1274.2 86 84
   000299         030200     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000300         030300     PERFORM  BUILD-RECORD.                                       ST1274.2 322
   000301         030400     MOVE     "Z"                 TO SORTKEY-6.                   ST1274.2 80
   000302         030500     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000303         030600     MOVE     WS-SORTFILE-REC     TO SORTFILE-REC.                ST1274.2 87 72
   000304         030700     ADD      1 TO WS-IDENTIFIER.                                 ST1274.2 86
   000305         030800     MOVE     WS-IDENTIFIER       TO SORT-IDENTIFIER.             ST1274.2 86 84
   000306         030900     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000307         031000     PERFORM  BUILD-RECORD.                                       ST1274.2 322
   000308         031100     MOVE     +418                TO SORTKEY-7.                   ST1274.2 76
   000309         031200     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000310         031300     MOVE     WS-SORTFILE-REC     TO SORTFILE-REC.                ST1274.2 87 72
   000311         031400     ADD      1 TO WS-IDENTIFIER.                                 ST1274.2 86
   000312         031500     MOVE     WS-IDENTIFIER       TO SORT-IDENTIFIER.             ST1274.2 86 84
   000313         031600     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000314         031700     PERFORM  BUILD-RECORD.                                       ST1274.2 322
   000315         031800     MOVE     -14                 TO SORTKEY-8.                   ST1274.2 74
   000316         031900     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000317         032000     MOVE     WS-SORTFILE-REC     TO SORTFILE-REC.                ST1274.2 87 72
   000318         032100     ADD      1 TO WS-IDENTIFIER.                                 ST1274.2 86
   000319         032200     MOVE     WS-IDENTIFIER       TO SORT-IDENTIFIER.             ST1274.2 86 84
   000320         032300     PERFORM  RELEASE-RECORD.                                     ST1274.2 334
   000321         032400     GO       TO BUILD-EXIT.                                      ST1274.2 336
   000322         032500 BUILD-RECORD.                                                    ST1274.2
   000323         032600     MOVE     -054321             TO SORTKEY-1.                   ST1274.2 75
   000324         032700     MOVE     "BBB"               TO SORTKEY-2.                   ST1274.2 81
   000325         032800     MOVE     -.1234567890123456  TO SORTKEY-3.                   ST1274.2 77
   000326         032900     MOVE     "BBBBBB"            TO SORTKEY-4.                   ST1274.2 79
   000327         033000     MOVE     "A"                 TO SORTKEY-5.                   ST1274.2 82
   000328         033100     MOVE     "AAAAAAAA"          TO SORTKEY-6.                   ST1274.2 80
   000329         033200     MOVE     -501                TO SORTKEY-7.                   ST1274.2 76
   000330         033300*       NOTE THIS ITEM IS INTENTIONALLY MOVED TO AN UNSIGNED      ST1274.2
   000331         033400*             FIELD.                                              ST1274.2
   000332         033500     MOVE     +99                 TO SORTKEY-8.                   ST1274.2 74
   000333         033600     MOVE      SPACE              TO SORT-IDENTIFIER.             ST1274.2 IMP 84
   000334         033700 RELEASE-RECORD.                                                  ST1274.2
   000335         033800     RELEASE  SORTFILE-REC.                                       ST1274.2 72
   000336         033900 BUILD-EXIT.                                                      ST1274.2
   000337         034000     EXIT.                                                        ST1274.2
   000338         034100 OUTPROC SECTION.                                                 ST1274.2
   000339         034200 OPEN-FILES.                                                      ST1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     OPEN     OUTPUT PRINT-FILE.                                  ST1274.2 67
   000341         034400     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   ST1274.2 239 180 239 199
   000342         034500     MOVE    SPACE TO TEST-RESULTS.                               ST1274.2 IMP 100
   000343         034600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             ST1274.2 596 601
   000344         034700     IF       SPAC-E IS LESS THAN "B"                             ST1274.2 99
   000345      1  034800              GO TO SPACE-IS-LESS-THAN-B.                         ST1274.2 451
   000346         034900 B-IS-LESS-THAN-SPACE SECTION.                                    ST1274.2
   000347         035000 SORT-INIT-A.                                                     ST1274.2
   000348         035100     MOVE     "SORT - 8 ASC. KEYS" TO FEATURE.                    ST1274.2 102
   000349         035200*        NOTE THE RECORDS SHOULD BE SORTED INTO THE FOLLOWING     ST1274.2
   000350         035300*             ORDER --- 8 7 6 5 4 3 1 2 --- THAT IS,              ST1274.2
   000351         035400*             THE 8TH RECORD SORTS UP TO THE 1ST POSITION,        ST1274.2
   000352         035500*             THE 7TH RECORD SORTS UP TO THE 2ND POSITION, ETC.   ST1274.2
   000353         035600 SORT-TEST-1.                                                     ST1274.2
   000354         035700     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000355         035800     IF       SORTKEY-7 EQUAL TO 418                              ST1274.2 76
   000356      1  035900              PERFORM PASS GO TO SORT-WRITE-1.                    ST1274.2 580 361
   000357         036000 SORT-FAIL-1.                                                     ST1274.2
   000358         036100     PERFORM  FAIL.                                               ST1274.2 581
   000359         036200     MOVE     SORTKEY-7 TO COMPUTED-N.                            ST1274.2 76 118
   000360         036300     MOVE     418 TO CORRECT-N.                                   ST1274.2 132
   000361         036400 SORT-WRITE-1.                                                    ST1274.2
   000362         036500     MOVE     "SORT-TEST-1 " TO PAR-NAME.                         ST1274.2 106
   000363         036600     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000364         036700 SORT-TEST-2.                                                     ST1274.2
   000365         036800     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000366         036900     IF       SORTKEY-8 EQUAL TO -14                              ST1274.2 74
   000367      1  037000              PERFORM PASS GO TO SORT-WRITE-2.                    ST1274.2 580 372
   000368         037100 SORT-FAIL-2.                                                     ST1274.2
   000369         037200     PERFORM  FAIL.                                               ST1274.2 581
   000370         037300     MOVE     SORTKEY-8 TO COMPUTED-N.                            ST1274.2 74 118
   000371         037400     MOVE     -14 TO CORRECT-N.                                   ST1274.2 132
   000372         037500 SORT-WRITE-2.                                                    ST1274.2
   000373         037600     MOVE     "SORT-TEST-2 " TO PAR-NAME.                         ST1274.2 106
   000374         037700     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000375         037800 SORT-TEST-3.                                                     ST1274.2
   000376         037900     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000377         038000     IF       SORTKEY-6 EQUAL TO "Z         "                     ST1274.2 80
   000378      1  038100              PERFORM PASS GO TO SORT-WRITE-3.                    ST1274.2 580 383
   000379         038200 SORT-FAIL-3.                                                     ST1274.2
   000380         038300     PERFORM  FAIL.                                               ST1274.2 581
   000381         038400     MOVE     SORTKEY-6 TO COMPUTED-A.                            ST1274.2 80 117
   000382         038500     MOVE     "Z         "           TO CORRECT-A.                ST1274.2 131
   000383         038600 SORT-WRITE-3.                                                    ST1274.2
   000384         038700     MOVE     "SORT-TEST-3 " TO PAR-NAME.                         ST1274.2 106
   000385         038800     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000386         038900 SORT-TEST-4.                                                     ST1274.2
   000387         039000     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000388         039100     IF       SORTKEY-5 EQUAL TO "Z                   "           ST1274.2 82
   000389      1  039200              PERFORM PASS GO TO SORT-WRITE-4.                    ST1274.2 580 394
   000390         039300 SORT-FAIL-4.                                                     ST1274.2
   000391         039400     PERFORM  FAIL.                                               ST1274.2 581
   000392         039500     MOVE     SORTKEY-5 TO COMPUTED-A.                            ST1274.2 82 117
   000393         039600     MOVE     "Z                   " TO CORRECT-A.                ST1274.2 131
   000394         039700 SORT-WRITE-4.                                                    ST1274.2
   000395         039800     MOVE     "SORT-TEST-4 " TO PAR-NAME.                         ST1274.2 106
   000396         039900     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 SORT-TEST-5.                                                     ST1274.2
   000398         040100     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000399         040200     IF       SORTKEY-4 EQUAL TO "         X"                     ST1274.2 79
   000400      1  040300              PERFORM PASS GO TO SORT-WRITE-5.                    ST1274.2 580 405
   000401         040400 SORT-FAIL-5.                                                     ST1274.2
   000402         040500     PERFORM  FAIL.                                               ST1274.2 581
   000403         040600     MOVE     SORTKEY-4 TO COMPUTED-A.                            ST1274.2 79 117
   000404         040700     MOVE     "         X"           TO CORRECT-A.                ST1274.2 131
   000405         040800 SORT-WRITE-5.                                                    ST1274.2
   000406         040900     MOVE     "SORT-TEST-5 " TO PAR-NAME.                         ST1274.2 106
   000407         041000     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000408         041100 SORT-TEST-6.                                                     ST1274.2
   000409         041200     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000410         041300     IF       SORTKEY-3 EQUAL TO +.6000000000000000               ST1274.2 77
   000411      1  041400              PERFORM PASS GO TO SORT-WRITE-6.                    ST1274.2 580 416
   000412         041500 SORT-FAIL-6.                                                     ST1274.2
   000413         041600     PERFORM  FAIL.                                               ST1274.2 581
   000414         041700     MOVE     SORTKEY-3 TO COMPUTED-0V18.                         ST1274.2 77 120
   000415         041800     MOVE     +.6000000000000000     TO CORRECT-0V18.             ST1274.2 133
   000416         041900 SORT-WRITE-6.                                                    ST1274.2
   000417         042000     MOVE     "SORT-TEST-6 " TO PAR-NAME.                         ST1274.2 106
   000418         042100     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000419         042200 SORT-TEST-7.                                                     ST1274.2
   000420         042300     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000421         042400     IF       SORTKEY-2 EQUAL TO "    X"                          ST1274.2 81
   000422      1  042500              PERFORM PASS GO TO SORT-WRITE-7.                    ST1274.2 580 427
   000423         042600 SORT-FAIL-7.                                                     ST1274.2
   000424         042700     PERFORM  FAIL.                                               ST1274.2 581
   000425         042800     MOVE     SORTKEY-2 TO COMPUTED-A.                            ST1274.2 81 117
   000426         042900     MOVE     "    X" TO CORRECT-A.                               ST1274.2 131
   000427         043000 SORT-WRITE-7.                                                    ST1274.2
   000428         043100     MOVE     "SORT-TEST-7 " TO PAR-NAME.                         ST1274.2 106
   000429         043200     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000430         043300 SORT-TEST-8.                                                     ST1274.2
   000431         043400     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000432         043500     IF       SORTKEY-1 EQUAL TO +123456                          ST1274.2 75
   000433      1  043600              PERFORM PASS GO TO SORT-WRITE-8.                    ST1274.2 580 438
   000434         043700 SORT-FAIL-8.                                                     ST1274.2
   000435         043800     PERFORM  FAIL.                                               ST1274.2 581
   000436         043900     MOVE     SORTKEY-1 TO COMPUTED-N.                            ST1274.2 75 118
   000437         044000     MOVE     +123456 TO CORRECT-N.                               ST1274.2 132
   000438         044100 SORT-WRITE-8.                                                    ST1274.2
   000439         044200     MOVE     "SORT-TEST-8 " TO PAR-NAME.                         ST1274.2 106
   000440         044300     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000441         044400 SORT-REMARK-A.                                                   ST1274.2
   000442         044500     MOVE     SPACE TO FEATURE.                                   ST1274.2 IMP 102
   000443         044600     MOVE     "THE COLLATING SEQUENCE" TO RE-MARK.                ST1274.2 111
   000444         044700     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000445         044800     MOVE     "RENDERS TESTS 9 THRU 16" TO RE-MARK.               ST1274.2 111
   000446         044900     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000447         045000     MOVE     "UNNECESSARY." TO RE-MARK.                          ST1274.2 111
   000448         045100     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000449         045200     MOVE     "SORT - 8 ASC. KEYS" TO FEATURE.                    ST1274.2 102
   000450         045300     GO       TO CONTINUE-TESTING.                                ST1274.2 556
   000451         045400 SPACE-IS-LESS-THAN-B SECTION.                                    ST1274.2
   000452         045500 SORT-REMARK-B.                                                   ST1274.2
   000453         045600     MOVE     "THE COLLATING SEQUENCE" TO RE-MARK.                ST1274.2 111
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000455         045800     MOVE     "RENDERS TESTS 1 THRU 8" TO RE-MARK.                ST1274.2 111
   000456         045900     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000457         046000     MOVE     "UNNECESSARY." TO RE-MARK.                          ST1274.2 111
   000458         046100     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000459         046200     MOVE     "SORT - 8 ASC. KEYS" TO FEATURE.                    ST1274.2 102
   000460         046300*        NOTE THE RECORDS SHOULD BE SORTED INTO THE FOLLOWING     ST1274.2
   000461         046400*             ORDER --- 8 1 7 2 6 5 3 4 --- THAT IS,              ST1274.2
   000462         046500*             THE 1ST RECORD IS SORTED DOWN TO THE 8TH POSITION,  ST1274.2
   000463         046600*             THE 2ND RECORD SORTS UP TO THE 1ST POSITION, ETC.   ST1274.2
   000464         046700 SORT-TEST-9.                                                     ST1274.2
   000465         046800     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000466         046900     IF       SORTKEY-2 EQUAL TO "    X"                          ST1274.2 81
   000467      1  047000              PERFORM PASS GO TO SORT-WRITE-9.                    ST1274.2 580 472
   000468         047100 SORT-FAIL-9.                                                     ST1274.2
   000469         047200     PERFORM  FAIL.                                               ST1274.2 581
   000470         047300     MOVE     SORTKEY-2 TO COMPUTED-A.                            ST1274.2 81 117
   000471         047400     MOVE     "    X" TO CORRECT-A.                               ST1274.2 131
   000472         047500 SORT-WRITE-9.                                                    ST1274.2
   000473         047600     MOVE     "SORT-TEST-9 " TO PAR-NAME.                         ST1274.2 106
   000474         047700     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000475         047800*                                                                 ST1274.2
   000476         047900*    PERFORM  RETURN-DUPLICATE-RECORDS.                           ST1274.2
   000477         048000*                                                                 ST1274.2
   000478         048100 SORT-TEST-10.                                                    ST1274.2
   000479         048200     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000480         048300     IF       SORTKEY-4 EQUAL TO "         X"                     ST1274.2 79
   000481      1  048400              PERFORM PASS GO TO SORT-WRITE-10.                   ST1274.2 580 486
   000482         048500 SORT-FAIL-10.                                                    ST1274.2
   000483         048600     PERFORM  FAIL.                                               ST1274.2 581
   000484         048700     MOVE     SORTKEY-4 TO COMPUTED-A.                            ST1274.2 79 117
   000485         048800     MOVE     "         X" TO CORRECT-A.                          ST1274.2 131
   000486         048900 SORT-WRITE-10.                                                   ST1274.2
   000487         049000     MOVE     "SORT-TEST-10" TO PAR-NAME.                         ST1274.2 106
   000488         049100     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000489         049200 SORT-TEST-11.                                                    ST1274.2
   000490         049300     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000491         049400     IF       SORTKEY-7 EQUAL TO 418                              ST1274.2 76
   000492      1  049500              PERFORM PASS GO TO SORT-WRITE-11.                   ST1274.2 580 497
   000493         049600 SORT-FAIL-11.                                                    ST1274.2
   000494         049700     PERFORM  FAIL.                                               ST1274.2 581
   000495         049800     MOVE     SORTKEY-7 TO COMPUTED-N                             ST1274.2 76 118
   000496         049900     MOVE     418 TO CORRECT-N.                                   ST1274.2 132
   000497         050000 SORT-WRITE-11.                                                   ST1274.2
   000498         050100     MOVE     "SORT-TEST-11" TO PAR-NAME.                         ST1274.2 106
   000499         050200     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000500         050300 SORT-TEST-12.                                                    ST1274.2
   000501         050400     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000502         050500     IF       SORTKEY-8 EQUAL TO -14                              ST1274.2 74
   000503      1  050600              PERFORM PASS GO TO SORT-WRITE-12.                   ST1274.2 580 508
   000504         050700 SORT-FAIL-12.                                                    ST1274.2
   000505         050800     PERFORM  FAIL.                                               ST1274.2 581
   000506         050900     MOVE     SORTKEY-8 TO COMPUTED-N.                            ST1274.2 74 118
   000507         051000     MOVE     -14 TO CORRECT-N.                                   ST1274.2 132
   000508         051100 SORT-WRITE-12.                                                   ST1274.2
   000509         051200     MOVE     "SORT-TEST-12" TO PAR-NAME.                         ST1274.2 106
   000510         051300     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     PERFORM  RETURN-DUPLICATE-RECORDS.                           ST1274.2 690
   000512         051500 SORT-TEST-13.                                                    ST1274.2
   000513         051600     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000514         051700     IF       SORTKEY-6 EQUAL TO "Z         "                     ST1274.2 80
   000515      1  051800              PERFORM PASS GO TO SORT-WRITE-13.                   ST1274.2 580 520
   000516         051900 SORT-FAIL-13.                                                    ST1274.2
   000517         052000     PERFORM  FAIL.                                               ST1274.2 581
   000518         052100     MOVE     SORTKEY-6 TO COMPUTED-A.                            ST1274.2 80 117
   000519         052200     MOVE     "Z         "           TO CORRECT-A.                ST1274.2 131
   000520         052300 SORT-WRITE-13.                                                   ST1274.2
   000521         052400     MOVE     "SORT-TEST-13" TO PAR-NAME.                         ST1274.2 106
   000522         052500     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000523         052600 SORT-TEST-14.                                                    ST1274.2
   000524         052700     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000525         052800     IF       SORTKEY-5 EQUAL TO "Z                   "           ST1274.2 82
   000526      1  052900              PERFORM PASS GO TO SORT-WRITE-14.                   ST1274.2 580 531
   000527         053000 SORT-FAIL-14.                                                    ST1274.2
   000528         053100     PERFORM  FAIL.                                               ST1274.2 581
   000529         053200     MOVE     SORTKEY-5 TO COMPUTED-A.                            ST1274.2 82 117
   000530         053300     MOVE     "Z                   " TO CORRECT-A.                ST1274.2 131
   000531         053400 SORT-WRITE-14.                                                   ST1274.2
   000532         053500     MOVE     "SORT-TEST-14" TO PAR-NAME.                         ST1274.2 106
   000533         053600     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000534         053700 SORT-TEST-15.                                                    ST1274.2
   000535         053800     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000536         053900     IF       SORTKEY-3 EQUAL TO +.6000000000000000               ST1274.2 77
   000537      1  054000              PERFORM PASS GO TO SORT-WRITE-15.                   ST1274.2 580 542
   000538         054100 SORT-FAIL-15.                                                    ST1274.2
   000539         054200     PERFORM  FAIL.                                               ST1274.2 581
   000540         054300     MOVE     SORTKEY-3 TO COMPUTED-0V18.                         ST1274.2 77 120
   000541         054400     MOVE     +.6000000000000000     TO CORRECT-0V18.             ST1274.2 133
   000542         054500 SORT-WRITE-15.                                                   ST1274.2
   000543         054600     MOVE     "SORT-TEST-15" TO PAR-NAME.                         ST1274.2 106
   000544         054700     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000545         054800 SORT-TEST-16.                                                    ST1274.2
   000546         054900     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000547         055000     IF       SORTKEY-1 EQUAL TO +123456                          ST1274.2 75
   000548      1  055100              PERFORM PASS GO TO SORT-WRITE-16.                   ST1274.2 580 553
   000549         055200 SORT-FAIL-16.                                                    ST1274.2
   000550         055300     PERFORM  FAIL.                                               ST1274.2 581
   000551         055400     MOVE     SORTKEY-1 TO COMPUTED-N.                            ST1274.2 75 118
   000552         055500     MOVE     +123456 TO CORRECT-N.                               ST1274.2 132
   000553         055600 SORT-WRITE-16.                                                   ST1274.2
   000554         055700     MOVE     "SORT-TEST-16" TO PAR-NAME.                         ST1274.2 106
   000555         055800     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000556         055900 CONTINUE-TESTING SECTION.                                        ST1274.2
   000557         056000 SORT-TEST-17.                                                    ST1274.2
   000558         056100     RETURN   SORTFILE-1H AT END                                  ST1274.2 70
   000559      1  056200              PERFORM PASS GO TO SORT-WRITE-17.                   ST1274.2 580 563
   000560         056300 SORT-FAIL-17.                                                    ST1274.2
   000561         056400     MOVE     "END OF FILE NOT FOUND" TO RE-MARK.                 ST1274.2 111
   000562         056500     PERFORM  FAIL.                                               ST1274.2 581
   000563         056600 SORT-WRITE-17.                                                   ST1274.2
   000564         056700     MOVE     "SORT-TEST-17" TO PAR-NAME.                         ST1274.2 106
   000565         056800     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000566         056900     GO       TO OUTPROC-EXIT.                                    ST1274.2 686
   000567         057000 RETURN-ERROR.                                                    ST1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE     "RETURN-ERROR" TO PAR-NAME.                         ST1274.2 106
   000569         057200     PERFORM  FAIL.                                               ST1274.2 581
   000570         057300     MOVE     "EOF PREMATURELY FOUND" TO RE-MARK.                 ST1274.2 111
   000571         057400     PERFORM  PRINT-DETAIL.                                       ST1274.2 584
   000572         057500     GO TO CCVS1-EXIT.                                            ST1274.2 683
   000573         057600 CLOSE-FILES.                                                     ST1274.2
   000574         057700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   ST1274.2 605 626 67
   000575         057800 TERMINATE-CCVS.                                                  ST1274.2
   000576         057900     EXIT PROGRAM.                                                ST1274.2
   000577         058000 TERMINATE-CALL.                                                  ST1274.2
   000578         058100     STOP     RUN.                                                ST1274.2
   000579         058200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         ST1274.2 104 156
   000580         058300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           ST1274.2 104 157
   000581         058400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          ST1274.2 104 155
   000582         058500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      ST1274.2 104 154
   000583         058600     MOVE "****TEST DELETED****" TO RE-MARK.                      ST1274.2 111
   000584         058700 PRINT-DETAIL.                                                    ST1274.2
   000585         058800     IF REC-CT NOT EQUAL TO ZERO                                  ST1274.2 153 IMP
   000586      1  058900             MOVE "." TO PARDOT-X                                 ST1274.2 108
   000587      1  059000             MOVE REC-CT TO DOTVALUE.                             ST1274.2 153 109
   000588         059100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      ST1274.2 100 68 638
   000589         059200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               ST1274.2 104 638
   000590      1  059300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 ST1274.2 659 673
   000591      1  059400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 ST1274.2 674 682
   000592         059500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              ST1274.2 IMP 104 IMP 116
   000593         059600     MOVE SPACE TO CORRECT-X.                                     ST1274.2 IMP 130
   000594         059700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         ST1274.2 153 IMP IMP 106
   000595         059800     MOVE     SPACE TO RE-MARK.                                   ST1274.2 IMP 111
   000596         059900 HEAD-ROUTINE.                                                    ST1274.2
   000597         060000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  ST1274.2 163 69 638
   000598         060100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  ST1274.2 168 69 638
   000599         060200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  ST1274.2 177 69 638
   000600         060300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  ST1274.2 189 69 638
   000601         060400 COLUMN-NAMES-ROUTINE.                                            ST1274.2
   000602         060500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           ST1274.2 141 69 638
   000603         060600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1274.2 146 69 638
   000604         060700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        ST1274.2 233 69 638
   000605         060800 END-ROUTINE.                                                     ST1274.2
   000606         060900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.ST1274.2 233 69 638
   000607         061000 END-RTN-EXIT.                                                    ST1274.2
   000608         061100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1274.2 196 69 638
   000609         061200 END-ROUTINE-1.                                                   ST1274.2
   000610         061300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      ST1274.2 155 159 156
   000611         061400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               ST1274.2 159 154 159
   000612         061500      ADD PASS-COUNTER TO ERROR-HOLD.                             ST1274.2 157 159
   000613         061600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   ST1274.2
   000614         061700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            ST1274.2 157 219
   000615         061800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              ST1274.2 159 221
   000616         061900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                ST1274.2 218 204
   000617         062000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           ST1274.2 201 69 638
   000618         062100  END-ROUTINE-12.                                                 ST1274.2
   000619         062200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        ST1274.2 207
   000620         062300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      ST1274.2 155 IMP
   000621      1  062400         MOVE "NO " TO ERROR-TOTAL                                ST1274.2 205
   000622         062500         ELSE                                                     ST1274.2
   000623      1  062600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       ST1274.2 155 205
   000624         062700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           ST1274.2 201 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     PERFORM WRITE-LINE.                                          ST1274.2 638
   000626         062900 END-ROUTINE-13.                                                  ST1274.2
   000627         063000     IF DELETE-COUNTER IS EQUAL TO ZERO                           ST1274.2 154 IMP
   000628      1  063100         MOVE "NO " TO ERROR-TOTAL  ELSE                          ST1274.2 205
   000629      1  063200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      ST1274.2 154 205
   000630         063300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   ST1274.2 207
   000631         063400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           ST1274.2 201 69 638
   000632         063500      IF   INSPECT-COUNTER EQUAL TO ZERO                          ST1274.2 156 IMP
   000633      1  063600          MOVE "NO " TO ERROR-TOTAL                               ST1274.2 205
   000634      1  063700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   ST1274.2 156 205
   000635         063800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            ST1274.2 207
   000636         063900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          ST1274.2 201 69 638
   000637         064000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           ST1274.2 209 69 638
   000638         064100 WRITE-LINE.                                                      ST1274.2
   000639         064200     ADD 1 TO RECORD-COUNT.                                       ST1274.2 161
   000640         064300     IF RECORD-COUNT GREATER 42                                   ST1274.2 161
   000641      1  064400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          ST1274.2 69 160
   000642      1  064500         MOVE SPACE TO DUMMY-RECORD                               ST1274.2 IMP 69
   000643      1  064600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  ST1274.2 69
   000644      1  064700         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    ST1274.2 163 69 654
   000645      1  064800         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    ST1274.2 168 69 654
   000646      1  064900         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    ST1274.2 177 69 654
   000647      1  065000         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    ST1274.2 189 69 654
   000648      1  065100         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            ST1274.2 141 69 654
   000649      1  065200         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            ST1274.2 146 69 654
   000650      1  065300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          ST1274.2 233 69 654
   000651      1  065400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          ST1274.2 160 69
   000652      1  065500         MOVE ZERO TO RECORD-COUNT.                               ST1274.2 IMP 161
   000653         065600     PERFORM WRT-LN.                                              ST1274.2 654
   000654         065700 WRT-LN.                                                          ST1274.2
   000655         065800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               ST1274.2 69
   000656         065900     MOVE SPACE TO DUMMY-RECORD.                                  ST1274.2 IMP 69
   000657         066000 BLANK-LINE-PRINT.                                                ST1274.2
   000658         066100     PERFORM WRT-LN.                                              ST1274.2 654
   000659         066200 FAIL-ROUTINE.                                                    ST1274.2
   000660         066300     IF     COMPUTED-X NOT EQUAL TO SPACE                         ST1274.2 116 IMP
   000661      1  066400            GO TO   FAIL-ROUTINE-WRITE.                           ST1274.2 668
   000662         066500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.ST1274.2 130 IMP 668
   000663         066600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 ST1274.2 162 232
   000664         066700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   ST1274.2 227
   000665         066800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1274.2 224 69 638
   000666         066900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         ST1274.2 IMP 232
   000667         067000     GO TO  FAIL-ROUTINE-EX.                                      ST1274.2 673
   000668         067100 FAIL-ROUTINE-WRITE.                                              ST1274.2
   000669         067200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         ST1274.2 112 68 638
   000670         067300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 ST1274.2 162 140
   000671         067400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. ST1274.2 127 68 638
   000672         067500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         ST1274.2 IMP 140
   000673         067600 FAIL-ROUTINE-EX. EXIT.                                           ST1274.2
   000674         067700 BAIL-OUT.                                                        ST1274.2
   000675         067800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   ST1274.2 117 IMP 677
   000676         067900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           ST1274.2 131 IMP 682
   000677         068000 BAIL-OUT-WRITE.                                                  ST1274.2
   000678         068100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  ST1274.2 131 231 117 229
   000679         068200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 ST1274.2 162 232
   000680         068300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   ST1274.2 224 69 638
   000681         068400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         ST1274.2 IMP 232
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500 BAIL-OUT-EX. EXIT.                                               ST1274.2
   000683         068600 CCVS1-EXIT.                                                      ST1274.2
   000684         068700     EXIT.                                                        ST1274.2
   000685         068800*                                                                 ST1274.2
   000686         068900 OUTPROC-EXIT SECTION.                                            ST1274.2
   000687         069000 EXIT-ONLY.                                                       ST1274.2
   000688         069100     PERFORM  CLOSE-FILES.                                        ST1274.2 573
   000689         069200*                                                                 ST1274.2
   000690         069300 RETURN-DUPLICATE-RECORDS SECTION.                                ST1274.2
   000691         069400*================================                                 ST1274.2
   000692         069500 SORT-INIT-18.                                                    ST1274.2
   000693         069600     MOVE     "DUPLICATE KEYS" TO FEATURE.                        ST1274.2 102
   000694         069700*        NOTE THE RECORDS SHOULD BE SORTED INTO THE FOLLOWING     ST1274.2
   000695         069800*             ORDER OF THE LAST CHARACTER OF THE RECORD:          ST1274.2
   000696         069900*             ---- 1 2 3 4 5 6 7 8 9 ---                          ST1274.2
   000697         070000 SORT-TEST-18-1.                                                  ST1274.2
   000698         070100     MOVE    "SORT-TEST-18-1" TO PAR-NAME.                        ST1274.2 106
   000699         070200     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000700         070300     IF       SORT-1 = WS-SORTFILE-REC                            ST1274.2 73 87
   000701      1  070400              PERFORM PASS                                        ST1274.2 580
   000702      1  070500              PERFORM PRINT-DETAIL                                ST1274.2 584
   000703      1  070600              GO TO   SORT-TEST-18-2.                             ST1274.2 707
   000704         070700 SORT-FAIL-18-1.                                                  ST1274.2
   000705         070800     PERFORM  FAIL.                                               ST1274.2 581
   000706         070900     PERFORM  CHECK-KEYS.                                         ST1274.2 900
   000707         071000 SORT-TEST-18-2.                                                  ST1274.2
   000708         071100     MOVE    "SORT-TEST-18-2" TO PAR-NAME.                        ST1274.2 106
   000709         071200     IF       SORT-IDENTIFIER = "1"                               ST1274.2 84
   000710      1  071300              PERFORM PASS                                        ST1274.2 580
   000711      1  071400              PERFORM PRINT-DETAIL                                ST1274.2 584
   000712      1  071500              GO TO   SORT-TEST-19-1.                             ST1274.2 719
   000713         071600 SORT-FAIL-18-2.                                                  ST1274.2
   000714         071700     PERFORM  FAIL.                                               ST1274.2 581
   000715         071800     MOVE     SORT-IDENTIFIER TO COMPUTED-X.                      ST1274.2 84 116
   000716         071900     MOVE    "1" TO CORRECT-X.                                    ST1274.2 130
   000717         072000     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000718         072100*                                                                 ST1274.2
   000719         072200 SORT-TEST-19-1.                                                  ST1274.2
   000720         072300     MOVE    "SORT-TEST-19-1" TO PAR-NAME.                        ST1274.2 106
   000721         072400     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000722         072500     IF       SORT-1 = WS-SORTFILE-REC                            ST1274.2 73 87
   000723      1  072600              PERFORM PASS                                        ST1274.2 580
   000724      1  072700              PERFORM PRINT-DETAIL                                ST1274.2 584
   000725      1  072800              GO TO   SORT-TEST-19-2.                             ST1274.2 729
   000726         072900 SORT-FAIL-19-1.                                                  ST1274.2
   000727         073000     PERFORM  FAIL.                                               ST1274.2 581
   000728         073100     PERFORM  CHECK-KEYS.                                         ST1274.2 900
   000729         073200 SORT-TEST-19-2.                                                  ST1274.2
   000730         073300     MOVE    "SORT-TEST-19-2" TO PAR-NAME.                        ST1274.2 106
   000731         073400     IF       SORT-IDENTIFIER = "2"                               ST1274.2 84
   000732      1  073500              PERFORM PASS                                        ST1274.2 580
   000733      1  073600              PERFORM PRINT-DETAIL                                ST1274.2 584
   000734      1  073700              GO TO   SORT-TEST-20-1.                             ST1274.2 741
   000735         073800 SORT-FAIL-19-2.                                                  ST1274.2
   000736         073900     PERFORM  FAIL.                                               ST1274.2 581
   000737         074000     MOVE     SORT-IDENTIFIER TO COMPUTED-X.                      ST1274.2 84 116
   000738         074100     MOVE    "2" TO CORRECT-X.                                    ST1274.2 130
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000740         074300*                                                                 ST1274.2
   000741         074400 SORT-TEST-20-1.                                                  ST1274.2
   000742         074500     MOVE    "SORT-TEST-20-1" TO PAR-NAME.                        ST1274.2 106
   000743         074600     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000744         074700     IF       SORT-1 = WS-SORTFILE-REC                            ST1274.2 73 87
   000745      1  074800              PERFORM PASS                                        ST1274.2 580
   000746      1  074900              PERFORM PRINT-DETAIL                                ST1274.2 584
   000747      1  075000              GO TO   SORT-TEST-20-2.                             ST1274.2 751
   000748         075100 SORT-FAIL-20-1.                                                  ST1274.2
   000749         075200     PERFORM  FAIL.                                               ST1274.2 581
   000750         075300     PERFORM  CHECK-KEYS.                                         ST1274.2 900
   000751         075400 SORT-TEST-20-2.                                                  ST1274.2
   000752         075500     MOVE    "SORT-TEST-20-2" TO PAR-NAME.                        ST1274.2 106
   000753         075600     IF       SORT-IDENTIFIER = "3"                               ST1274.2 84
   000754      1  075700              PERFORM PASS                                        ST1274.2 580
   000755      1  075800              PERFORM PRINT-DETAIL                                ST1274.2 584
   000756      1  075900              GO TO   SORT-TEST-21-1.                             ST1274.2 763
   000757         076000 SORT-FAIL-20-2.                                                  ST1274.2
   000758         076100     PERFORM  FAIL.                                               ST1274.2 581
   000759         076200     MOVE     SORT-IDENTIFIER TO COMPUTED-X.                      ST1274.2 84 116
   000760         076300     MOVE    "3" TO CORRECT-X.                                    ST1274.2 130
   000761         076400     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000762         076500*                                                                 ST1274.2
   000763         076600 SORT-TEST-21-1.                                                  ST1274.2
   000764         076700     MOVE    "SORT-TEST-21-1" TO PAR-NAME.                        ST1274.2 106
   000765         076800     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000766         076900     IF       SORT-1 = WS-SORTFILE-REC                            ST1274.2 73 87
   000767      1  077000              PERFORM PASS                                        ST1274.2 580
   000768      1  077100              PERFORM PRINT-DETAIL                                ST1274.2 584
   000769      1  077200              GO TO   SORT-TEST-21-2.                             ST1274.2 773
   000770         077300 SORT-FAIL-21-1.                                                  ST1274.2
   000771         077400     PERFORM  FAIL.                                               ST1274.2 581
   000772         077500     PERFORM  CHECK-KEYS.                                         ST1274.2 900
   000773         077600 SORT-TEST-21-2.                                                  ST1274.2
   000774         077700     MOVE    "SORT-TEST-21-2" TO PAR-NAME.                        ST1274.2 106
   000775         077800     IF       SORT-IDENTIFIER = "4"                               ST1274.2 84
   000776      1  077900              PERFORM PASS                                        ST1274.2 580
   000777      1  078000              PERFORM PRINT-DETAIL                                ST1274.2 584
   000778      1  078100              GO TO   SORT-TEST-22-1.                             ST1274.2 785
   000779         078200 SORT-FAIL-21-2.                                                  ST1274.2
   000780         078300     PERFORM  FAIL.                                               ST1274.2 581
   000781         078400     MOVE     SORT-IDENTIFIER TO COMPUTED-X.                      ST1274.2 84 116
   000782         078500     MOVE    "4" TO CORRECT-X.                                    ST1274.2 130
   000783         078600     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000784         078700*                                                                 ST1274.2
   000785         078800 SORT-TEST-22-1.                                                  ST1274.2
   000786         078900     MOVE    "SORT-TEST-22-1" TO PAR-NAME.                        ST1274.2 106
   000787         079000     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000788         079100     IF       SORT-1 = WS-SORTFILE-REC                            ST1274.2 73 87
   000789      1  079200              PERFORM PASS                                        ST1274.2 580
   000790      1  079300              PERFORM PRINT-DETAIL                                ST1274.2 584
   000791      1  079400              GO TO   SORT-TEST-22-2.                             ST1274.2 795
   000792         079500 SORT-FAIL-22-1.                                                  ST1274.2
   000793         079600     PERFORM  FAIL.                                               ST1274.2 581
   000794         079700     PERFORM  CHECK-KEYS.                                         ST1274.2 900
   000795         079800 SORT-TEST-22-2.                                                  ST1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900     MOVE    "SORT-TEST-22-2" TO PAR-NAME.                        ST1274.2 106
   000797         080000     IF       SORT-IDENTIFIER = "5"                               ST1274.2 84
   000798      1  080100              PERFORM PASS                                        ST1274.2 580
   000799      1  080200              PERFORM PRINT-DETAIL                                ST1274.2 584
   000800      1  080300              GO TO   SORT-TEST-23-1.                             ST1274.2 807
   000801         080400 SORT-FAIL-22-2.                                                  ST1274.2
   000802         080500     PERFORM  FAIL.                                               ST1274.2 581
   000803         080600     MOVE     SORT-IDENTIFIER TO COMPUTED-X.                      ST1274.2 84 116
   000804         080700     MOVE    "5" TO CORRECT-X.                                    ST1274.2 130
   000805         080800     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000806         080900*                                                                 ST1274.2
   000807         081000 SORT-TEST-23-1.                                                  ST1274.2
   000808         081100     MOVE    "SORT-TEST-23-1" TO PAR-NAME.                        ST1274.2 106
   000809         081200     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000810         081300     IF       SORT-1 = WS-SORTFILE-REC                            ST1274.2 73 87
   000811      1  081400              PERFORM PASS                                        ST1274.2 580
   000812      1  081500              PERFORM PRINT-DETAIL                                ST1274.2 584
   000813      1  081600              GO TO   SORT-TEST-23-2.                             ST1274.2 817
   000814         081700 SORT-FAIL-23-1.                                                  ST1274.2
   000815         081800     PERFORM  FAIL.                                               ST1274.2 581
   000816         081900     PERFORM  CHECK-KEYS.                                         ST1274.2 900
   000817         082000 SORT-TEST-23-2.                                                  ST1274.2
   000818         082100     MOVE    "SORT-TEST-23-2" TO PAR-NAME.                        ST1274.2 106
   000819         082200     IF       SORT-IDENTIFIER = "6"                               ST1274.2 84
   000820      1  082300              PERFORM PASS                                        ST1274.2 580
   000821      1  082400              PERFORM PRINT-DETAIL                                ST1274.2 584
   000822      1  082500              GO TO   SORT-TEST-24-1.                             ST1274.2 829
   000823         082600 SORT-FAIL-23-2.                                                  ST1274.2
   000824         082700     PERFORM  FAIL.                                               ST1274.2 581
   000825         082800     MOVE     SORT-IDENTIFIER TO COMPUTED-X.                      ST1274.2 84 116
   000826         082900     MOVE    "6" TO CORRECT-X.                                    ST1274.2 130
   000827         083000     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000828         083100*                                                                 ST1274.2
   000829         083200 SORT-TEST-24-1.                                                  ST1274.2
   000830         083300     MOVE    "SORT-TEST-24-1" TO PAR-NAME.                        ST1274.2 106
   000831         083400     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000832         083500     IF       SORT-1 = WS-SORTFILE-REC                            ST1274.2 73 87
   000833      1  083600              PERFORM PASS                                        ST1274.2 580
   000834      1  083700              PERFORM PRINT-DETAIL                                ST1274.2 584
   000835      1  083800              GO TO   SORT-TEST-24-2.                             ST1274.2 839
   000836         083900 SORT-FAIL-24-1.                                                  ST1274.2
   000837         084000     PERFORM  FAIL.                                               ST1274.2 581
   000838         084100     PERFORM  CHECK-KEYS.                                         ST1274.2 900
   000839         084200 SORT-TEST-24-2.                                                  ST1274.2
   000840         084300     MOVE    "SORT-TEST-24-2" TO PAR-NAME.                        ST1274.2 106
   000841         084400     IF       SORT-IDENTIFIER = "7"                               ST1274.2 84
   000842      1  084500              PERFORM PASS                                        ST1274.2 580
   000843      1  084600              PERFORM PRINT-DETAIL                                ST1274.2 584
   000844      1  084700              GO TO   SORT-TEST-25-1.                             ST1274.2 851
   000845         084800 SORT-FAIL-24-2.                                                  ST1274.2
   000846         084900     PERFORM  FAIL.                                               ST1274.2 581
   000847         085000     MOVE     SORT-IDENTIFIER TO COMPUTED-X.                      ST1274.2 84 116
   000848         085100     MOVE    "7" TO CORRECT-X.                                    ST1274.2 130
   000849         085200     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000850         085300*                                                                 ST1274.2
   000851         085400 SORT-TEST-25-1.                                                  ST1274.2
   000852         085500     MOVE    "SORT-TEST-25-1" TO PAR-NAME.                        ST1274.2 106
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000854         085700     IF       SORT-1 = WS-SORTFILE-REC                            ST1274.2 73 87
   000855      1  085800              PERFORM PASS                                        ST1274.2 580
   000856      1  085900              PERFORM PRINT-DETAIL                                ST1274.2 584
   000857      1  086000              GO TO   SORT-TEST-25-2.                             ST1274.2 861
   000858         086100 SORT-FAIL-25-1.                                                  ST1274.2
   000859         086200     PERFORM  FAIL.                                               ST1274.2 581
   000860         086300     PERFORM  CHECK-KEYS.                                         ST1274.2 900
   000861         086400 SORT-TEST-25-2.                                                  ST1274.2
   000862         086500     MOVE    "SORT-TEST-25-2" TO PAR-NAME.                        ST1274.2 106
   000863         086600     IF       SORT-IDENTIFIER = "8"                               ST1274.2 84
   000864      1  086700              PERFORM PASS                                        ST1274.2 580
   000865      1  086800              PERFORM PRINT-DETAIL                                ST1274.2 584
   000866      1  086900              GO TO   SORT-TEST-26-1.                             ST1274.2 873
   000867         087000 SORT-FAIL-25-2.                                                  ST1274.2
   000868         087100     PERFORM  FAIL.                                               ST1274.2 581
   000869         087200     MOVE     SORT-IDENTIFIER TO COMPUTED-X.                      ST1274.2 84 116
   000870         087300     MOVE    "8" TO CORRECT-X.                                    ST1274.2 130
   000871         087400     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000872         087500*                                                                 ST1274.2
   000873         087600 SORT-TEST-26-1.                                                  ST1274.2
   000874         087700     MOVE    "SORT-TEST-26-1" TO PAR-NAME.                        ST1274.2 106
   000875         087800     RETURN   SORTFILE-1H AT END GO TO RETURN-ERROR.              ST1274.2 70 567
   000876         087900     IF       SORT-1 = WS-SORTFILE-REC                            ST1274.2 73 87
   000877      1  088000              PERFORM PASS                                        ST1274.2 580
   000878      1  088100              PERFORM PRINT-DETAIL                                ST1274.2 584
   000879      1  088200              GO TO   SORT-TEST-26-2.                             ST1274.2 883
   000880         088300 SORT-FAIL-26-1.                                                  ST1274.2
   000881         088400     PERFORM  FAIL.                                               ST1274.2 581
   000882         088500     PERFORM  CHECK-KEYS.                                         ST1274.2 900
   000883         088600 SORT-TEST-26-2.                                                  ST1274.2
   000884         088700     MOVE    "SORT-TEST-26-2" TO PAR-NAME.                        ST1274.2 106
   000885         088800     IF       SORT-IDENTIFIER = "9"                               ST1274.2 84
   000886      1  088900              PERFORM PASS                                        ST1274.2 580
   000887      1  089000              PERFORM PRINT-DETAIL                                ST1274.2 584
   000888      1  089100              GO TO   DUPLICATE-RECORD-EXIT.                      ST1274.2 896
   000889         089200 SORT-FAIL-26-2.                                                  ST1274.2
   000890         089300     PERFORM  FAIL.                                               ST1274.2 581
   000891         089400     MOVE     SORT-IDENTIFIER TO COMPUTED-X.                      ST1274.2 84 116
   000892         089500     MOVE    "9" TO CORRECT-X.                                    ST1274.2 130
   000893         089600     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000894         089700                                                                  ST1274.2
   000895         089800*                                                                 ST1274.2
   000896         089900 DUPLICATE-RECORD-EXIT.                                           ST1274.2
   000897         090000     EXIT.                                                        ST1274.2
   000898         090100*                                                                 ST1274.2
   000899         090200*                                                                 ST1274.2
   000900         090300 CHECK-KEYS SECTION.                                              ST1274.2
   000901         090400*==================                                               ST1274.2
   000902         090500 CHK-TEST-1.                                                      ST1274.2
   000903         090600     MOVE    "CHK-TEST-1" TO PAR-NAME.                            ST1274.2 106
   000904         090700     IF       SORTKEY-1 = WS-1                                    ST1274.2 75 89
   000905      1  090800              PERFORM PASS                                        ST1274.2 580
   000906      1  090900              PERFORM PRINT-DETAIL                                ST1274.2 584
   000907      1  091000              GO TO   CHK-TEST-2.                                 ST1274.2 914
   000908         091100 CHK-FAIL-1.                                                      ST1274.2
   000909         091200     PERFORM  FAIL.                                               ST1274.2 581
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     MOVE     SORTKEY-1 TO COMPUTED-N.                            ST1274.2 75 118
   000911         091400     MOVE     WS-1      TO CORRECT-N.                             ST1274.2 89 132
   000912         091500     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000913         091600*                                                                 ST1274.2
   000914         091700 CHK-TEST-2.                                                      ST1274.2
   000915         091800     MOVE    "CHK-TEST-2" TO PAR-NAME.                            ST1274.2 106
   000916         091900     IF       SORTKEY-2 = WS-2                                    ST1274.2 81 95
   000917      1  092000              PERFORM PASS                                        ST1274.2 580
   000918      1  092100              PERFORM PRINT-DETAIL                                ST1274.2 584
   000919      1  092200              GO TO   CHK-TEST-3.                                 ST1274.2 926
   000920         092300 CHK-FAIL-2.                                                      ST1274.2
   000921         092400     PERFORM  FAIL.                                               ST1274.2 581
   000922         092500     MOVE     SORTKEY-1 TO COMPUTED-N.                            ST1274.2 75 118
   000923         092600     MOVE     WS-1      TO CORRECT-N.                             ST1274.2 89 132
   000924         092700     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000925         092800*                                                                 ST1274.2
   000926         092900 CHK-TEST-3.                                                      ST1274.2
   000927         093000     MOVE    "CHK-TEST-3" TO PAR-NAME.                            ST1274.2 106
   000928         093100     IF       SORTKEY-3 = WS-3                                    ST1274.2 77 91
   000929      1  093200              PERFORM PASS                                        ST1274.2 580
   000930      1  093300              PERFORM PRINT-DETAIL                                ST1274.2 584
   000931      1  093400              GO TO   CHK-TEST-4.                                 ST1274.2 938
   000932         093500 CHK-FAIL-3.                                                      ST1274.2
   000933         093600     PERFORM  FAIL.                                               ST1274.2 581
   000934         093700     MOVE     SORTKEY-3 TO COMPUTED-X.                            ST1274.2 77 116
   000935         093800     MOVE     WS-1      TO CORRECT-X.                             ST1274.2 89 130
   000936         093900     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000937         094000*                                                                 ST1274.2
   000938         094100 CHK-TEST-4.                                                      ST1274.2
   000939         094200     MOVE    "CHK-TEST-4" TO PAR-NAME.                            ST1274.2 106
   000940         094300     IF       SORTKEY-4 = WS-4                                    ST1274.2 79 93
   000941      1  094400              PERFORM PASS                                        ST1274.2 580
   000942      1  094500              PERFORM PRINT-DETAIL                                ST1274.2 584
   000943      1  094600              GO TO   CHK-TEST-5.                                 ST1274.2 950
   000944         094700 CHK-FAIL-4.                                                      ST1274.2
   000945         094800     PERFORM  FAIL.                                               ST1274.2 581
   000946         094900     MOVE     SORTKEY-4 TO COMPUTED-X.                            ST1274.2 79 116
   000947         095000     MOVE     WS-4      TO CORRECT-X.                             ST1274.2 93 130
   000948         095100     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000949         095200                                                                  ST1274.2
   000950         095300 CHK-TEST-5.                                                      ST1274.2
   000951         095400     MOVE    "CHK-TEST-5" TO PAR-NAME.                            ST1274.2 106
   000952         095500     IF       SORTKEY-5 = WS-5                                    ST1274.2 82 96
   000953      1  095600              PERFORM PASS                                        ST1274.2 580
   000954      1  095700              PERFORM PRINT-DETAIL                                ST1274.2 584
   000955      1  095800              GO TO   CHK-TEST-6.                                 ST1274.2 962
   000956         095900 CHK-FAIL-5.                                                      ST1274.2
   000957         096000     PERFORM  FAIL.                                               ST1274.2 581
   000958         096100     MOVE     SORTKEY-5 TO COMPUTED-X.                            ST1274.2 82 116
   000959         096200     MOVE     WS-5      TO CORRECT-X.                             ST1274.2 96 130
   000960         096300     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000961         096400*                                                                 ST1274.2
   000962         096500 CHK-TEST-6.                                                      ST1274.2
   000963         096600     MOVE    "CHK-TEST-6" TO PAR-NAME.                            ST1274.2 106
   000964         096700     IF       SORTKEY-6 = WS-6                                    ST1274.2 80 94
   000965      1  096800              PERFORM PASS                                        ST1274.2 580
   000966      1  096900              PERFORM PRINT-DETAIL                                ST1274.2 584
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967      1  097000              GO TO   CHK-TEST-7.                                 ST1274.2 974
   000968         097100 CHK-FAIL-6.                                                      ST1274.2
   000969         097200     PERFORM  FAIL.                                               ST1274.2 581
   000970         097300     MOVE     SORTKEY-6 TO COMPUTED-X.                            ST1274.2 80 116
   000971         097400     MOVE     WS-6      TO CORRECT-X.                             ST1274.2 94 130
   000972         097500     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000973         097600*                                                                 ST1274.2
   000974         097700 CHK-TEST-7.                                                      ST1274.2
   000975         097800     MOVE    "CHK-TEST-7" TO PAR-NAME.                            ST1274.2 106
   000976         097900     IF       SORTKEY-7 = WS-7                                    ST1274.2 76 90
   000977      1  098000              PERFORM PASS                                        ST1274.2 580
   000978      1  098100              PERFORM PRINT-DETAIL                                ST1274.2 584
   000979      1  098200              GO TO   CHK-TEST-8.                                 ST1274.2 986
   000980         098300 CHK-FAIL-7.                                                      ST1274.2
   000981         098400     PERFORM  FAIL.                                               ST1274.2 581
   000982         098500     MOVE     SORTKEY-7 TO COMPUTED-X.                            ST1274.2 76 116
   000983         098600     MOVE     WS-7      TO CORRECT-X.                             ST1274.2 90 130
   000984         098700     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000985         098800*                                                                 ST1274.2
   000986         098900 CHK-TEST-8.                                                      ST1274.2
   000987         099000     MOVE    "CHK-TEST-8" TO PAR-NAME.                            ST1274.2 106
   000988         099100     IF       SORTKEY-8 = WS-8                                    ST1274.2 74 88
   000989      1  099200              PERFORM PASS                                        ST1274.2 580
   000990      1  099300              PERFORM PRINT-DETAIL                                ST1274.2 584
   000991      1  099400              GO TO   CHECK-KEYS-EXIT.                            ST1274.2 997
   000992         099500 CHK-FAIL-8.                                                      ST1274.2
   000993         099600     PERFORM  FAIL.                                               ST1274.2 581
   000994         099700     MOVE     SORTKEY-8 TO COMPUTED-N.                            ST1274.2 74 118
   000995         099800     MOVE     WS-8      TO CORRECT-N.                             ST1274.2 88 132
   000996         099900     PERFORM PRINT-DETAIL.                                        ST1274.2 584
   000997         100000 CHECK-KEYS-EXIT.                                                 ST1274.2
   000998         100100     EXIT.                                                        ST1274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    21
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      162   ANSI-REFERENCE . . . . . . . .  M244 663 670 679
      141   CCVS-C-1 . . . . . . . . . . .  602 648
      146   CCVS-C-2 . . . . . . . . . . .  603 649
      196   CCVS-E-1 . . . . . . . . . . .  608
      201   CCVS-E-2 . . . . . . . . . . .  617 624 631 636
      204   CCVS-E-2-2 . . . . . . . . . .  M616
      209   CCVS-E-3 . . . . . . . . . . .  637
      218   CCVS-E-4 . . . . . . . . . . .  616
      219   CCVS-E-4-1 . . . . . . . . . .  M614
      221   CCVS-E-4-2 . . . . . . . . . .  M615
      163   CCVS-H-1 . . . . . . . . . . .  597 644
      168   CCVS-H-2A. . . . . . . . . . .  598 645
      177   CCVS-H-2B. . . . . . . . . . .  599 646
      189   CCVS-H-3 . . . . . . . . . . .  600 647
      239   CCVS-PGM-ID. . . . . . . . . .  341 341
      123   CM-18V0
      117   COMPUTED-A . . . . . . . . . .  118 120 121 122 123 M381 M392 M403 M425 M470 M484 M518 M529 675 678
      118   COMPUTED-N . . . . . . . . . .  M359 M370 M436 M495 M506 M551 M910 M922 M994
      116   COMPUTED-X . . . . . . . . . .  M592 660 M715 M737 M759 M781 M803 M825 M847 M869 M891 M934 M946 M958 M970 M982
      120   COMPUTED-0V18. . . . . . . . .  M414 M540
      122   COMPUTED-14V4
      124   COMPUTED-18V0
      121   COMPUTED-4V14
      140   COR-ANSI-REFERENCE . . . . . .  M670 M672
      131   CORRECT-A. . . . . . . . . . .  132 133 134 135 136 M382 M393 M404 M426 M471 M485 M519 M530 676 678
      132   CORRECT-N. . . . . . . . . . .  M360 M371 M437 M496 M507 M552 M911 M923 M995
      130   CORRECT-X. . . . . . . . . . .  M593 662 M716 M738 M760 M782 M804 M826 M848 M870 M892 M935 M947 M959 M971 M983
      133   CORRECT-0V18 . . . . . . . . .  M415 M541
      135   CORRECT-14V4
      137   CORRECT-18V0
      134   CORRECT-4V14
      136   CR-18V0
      154   DELETE-COUNTER . . . . . . . .  M582 611 627 629
      109   DOTVALUE . . . . . . . . . . .  M587
      160   DUMMY-HOLD . . . . . . . . . .  M641 651
       69   DUMMY-RECORD . . . . . . . . .  M597 M598 M599 M600 M602 M603 M604 M606 M608 M617 M624 M631 M636 M637 641 M642
                                            643 M644 M645 M646 M647 M648 M649 M650 M651 655 M656 M665 M680
      207   ENDER-DESC . . . . . . . . . .  M619 M630 M635
      155   ERROR-COUNTER. . . . . . . . .  M581 610 620 623
      159   ERROR-HOLD . . . . . . . . . .  M610 M611 M611 M612 615
      205   ERROR-TOTAL. . . . . . . . . .  M621 M623 M628 M629 M633 M634
      102   FEATURE. . . . . . . . . . . .  M348 M442 M449 M459 M693
      233   HYPHEN-LINE. . . . . . . . . .  604 606 650
      199   ID-AGAIN . . . . . . . . . . .  M341
      232   INF-ANSI-REFERENCE . . . . . .  M663 M666 M679 M681
      227   INFO-TEXT. . . . . . . . . . .  M664
      156   INSPECT-COUNTER. . . . . . . .  M579 610 632 634
      104   P-OR-F . . . . . . . . . . . .  M579 M580 M581 M582 589 M592
      106   PAR-NAME . . . . . . . . . . .  M362 M373 M384 M395 M406 M417 M428 M439 M473 M487 M498 M509 M521 M532 M543 M554
                                            M564 M568 M594 M698 M708 M720 M730 M742 M752 M764 M774 M786 M796 M808 M818 M830
                                            M840 M852 M862 M874 M884 M903 M915 M927 M939 M951 M963 M975 M987
      108   PARDOT-X . . . . . . . . . . .  M586
      157   PASS-COUNTER . . . . . . . . .  M580 612 614
       67   PRINT-FILE . . . . . . . . . .  61 340 574
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    22
0 Defined   Cross-reference of data names   References

0      68   PRINT-REC. . . . . . . . . . .  M588 M669 M671
      111   RE-MARK. . . . . . . . . . . .  M443 M445 M447 M453 M455 M457 M561 M570 M583 M595
      153   REC-CT . . . . . . . . . . . .  585 587 594
      152   REC-SKL-SUB
      161   RECORD-COUNT . . . . . . . . .  M639 640 M652
       84   SORT-IDENTIFIER. . . . . . . .  M264 M270 M277 M284 M291 M298 M305 M312 M319 M333 709 715 731 737 753 759 775
                                            781 797 803 819 825 841 847 863 869 885 891
       73   SORT-1 . . . . . . . . . . . .  262 700 722 744 766 788 810 832 854 876
       72   SORTFILE-REC . . . . . . . . .  M268 M275 M282 M289 M296 M303 M310 M317 335
       70   SORTFILE-1H. . . . . . . . . .  63 245 354 365 376 387 398 409 420 431 465 479 490 501 513 524 535 546 558 699
                                            721 743 765 787 809 831 853 875
       75   SORTKEY-1. . . . . . . . . . .  246 M266 M323 432 436 547 551 904 910 922
       81   SORTKEY-2. . . . . . . . . . .  247 M273 M324 421 425 466 470 916
       77   SORTKEY-3. . . . . . . . . . .  248 M280 M325 410 414 536 540 928 934
       79   SORTKEY-4. . . . . . . . . . .  249 M287 M326 399 403 480 484 940 946
       82   SORTKEY-5. . . . . . . . . . .  250 M294 M327 388 392 525 529 952 958
       80   SORTKEY-6. . . . . . . . . . .  251 M301 M328 377 381 514 518 964 970
       76   SORTKEY-7. . . . . . . . . . .  252 M308 M329 355 359 491 495 976 982
       74   SORTKEY-8. . . . . . . . . . .  253 M315 M332 366 370 502 506 988 994
       99   SPAC-E . . . . . . . . . . . .  344
      112   TEST-COMPUTED. . . . . . . . .  669
      127   TEST-CORRECT . . . . . . . . .  671
      180   TEST-ID. . . . . . . . . . . .  M341
      100   TEST-RESULTS . . . . . . . . .  M342 588
      158   TOTAL-ERROR
       98   UTIL-CTR
       86   WS-IDENTIFIER. . . . . . . . .  M260 M263 264 M269 270 M276 277 M283 284 M290 291 M297 298 M304 305 M311 312
                                            M318 319
       87   WS-SORTFILE-REC. . . . . . . .  M262 268 275 282 289 296 303 310 317 700 722 744 766 788 810 832 854 876
       89   WS-1 . . . . . . . . . . . . .  904 911 923 935
       95   WS-2 . . . . . . . . . . . . .  916
       91   WS-3 . . . . . . . . . . . . .  928
       93   WS-4 . . . . . . . . . . . . .  940 947
       96   WS-5 . . . . . . . . . . . . .  952 959
       94   WS-6 . . . . . . . . . . . . .  964 971
       90   WS-7 . . . . . . . . . . . . .  976 983
       88   WS-8 . . . . . . . . . . . . .  988 995
      229   XXCOMPUTED . . . . . . . . . .  M678
      231   XXCORRECT. . . . . . . . . . .  M678
      224   XXINFO . . . . . . . . . . . .  665 680
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    23
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

      346   B-IS-LESS-THAN-SPACE
      674   BAIL-OUT . . . . . . . . . . .  P591
      682   BAIL-OUT-EX. . . . . . . . . .  E591 G676
      677   BAIL-OUT-WRITE . . . . . . . .  G675
      657   BLANK-LINE-PRINT
      336   BUILD-EXIT . . . . . . . . . .  G321
      259   BUILD-FILE
      322   BUILD-RECORD . . . . . . . . .  P261 P272 P279 P286 P293 P300 P307 P314
      683   CCVS1-EXIT . . . . . . . . . .  G572
      900   CHECK-KEYS . . . . . . . . . .  P706 P728 P750 P772 P794 P816 P838 P860 P882
      997   CHECK-KEYS-EXIT. . . . . . . .  G991
      908   CHK-FAIL-1
      920   CHK-FAIL-2
      932   CHK-FAIL-3
      944   CHK-FAIL-4
      956   CHK-FAIL-5
      968   CHK-FAIL-6
      980   CHK-FAIL-7
      992   CHK-FAIL-8
      902   CHK-TEST-1
      914   CHK-TEST-2 . . . . . . . . . .  G907
      926   CHK-TEST-3 . . . . . . . . . .  G919
      938   CHK-TEST-4 . . . . . . . . . .  G931
      950   CHK-TEST-5 . . . . . . . . . .  G943
      962   CHK-TEST-6 . . . . . . . . . .  G955
      974   CHK-TEST-7 . . . . . . . . . .  G967
      986   CHK-TEST-8 . . . . . . . . . .  G979
      573   CLOSE-FILES. . . . . . . . . .  P688
      601   COLUMN-NAMES-ROUTINE . . . . .  E343
      556   CONTINUE-TESTING . . . . . . .  G450
      582   DE-LETE
      896   DUPLICATE-RECORD-EXIT. . . . .  G888
      605   END-ROUTINE. . . . . . . . . .  P574
      609   END-ROUTINE-1
      618   END-ROUTINE-12
      626   END-ROUTINE-13 . . . . . . . .  E574
      607   END-RTN-EXIT
      687   EXIT-ONLY
      581   FAIL . . . . . . . . . . . . .  P358 P369 P380 P391 P402 P413 P424 P435 P469 P483 P494 P505 P517 P528 P539 P550
                                            P562 P569 P705 P714 P727 P736 P749 P758 P771 P780 P793 P802 P815 P824 P837 P846
                                            P859 P868 P881 P890 P909 P921 P933 P945 P957 P969 P981 P993
      659   FAIL-ROUTINE . . . . . . . . .  P590
      673   FAIL-ROUTINE-EX. . . . . . . .  E590 G667
      668   FAIL-ROUTINE-WRITE . . . . . .  G661 G662
      596   HEAD-ROUTINE . . . . . . . . .  P343
      258   INPROC . . . . . . . . . . . .  P255
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    24
0 Defined   Cross-reference of procedures   References

0     579   INSPT
      339   OPEN-FILES
      338   OUTPROC. . . . . . . . . . . .  P256
      686   OUTPROC-EXIT . . . . . . . . .  E256 G566
      580   PASS . . . . . . . . . . . . .  P356 P367 P378 P389 P400 P411 P422 P433 P467 P481 P492 P503 P515 P526 P537 P548
                                            P559 P701 P710 P723 P732 P745 P754 P767 P776 P789 P798 P811 P820 P833 P842 P855
                                            P864 P877 P886 P905 P917 P929 P941 P953 P965 P977 P989
      584   PRINT-DETAIL . . . . . . . . .  P363 P374 P385 P396 P407 P418 P429 P440 P444 P446 P448 P454 P456 P458 P474 P488
                                            P499 P510 P522 P533 P544 P555 P565 P571 P702 P711 P717 P724 P733 P739 P746 P755
                                            P761 P768 P777 P783 P790 P799 P805 P812 P821 P827 P834 P843 P849 P856 P865 P871
                                            P878 P887 P893 P906 P912 P918 P924 P930 P936 P942 P948 P954 P960 P966 P972 P978
                                            P984 P990 P996
      334   RELEASE-RECORD . . . . . . . .  P265 P267 P271 P274 P278 P281 P285 P288 P292 P295 P299 P302 P306 P309 P313 P316
                                            P320
      690   RETURN-DUPLICATE-RECORDS . . .  P511
      567   RETURN-ERROR . . . . . . . . .  G354 G365 G376 G387 G398 G409 G420 G431 G465 G479 G490 G501 G513 G524 G535 G546
                                            G699 G721 G743 G765 G787 G809 G831 G853 G875
      357   SORT-FAIL-1
      482   SORT-FAIL-10
      493   SORT-FAIL-11
      504   SORT-FAIL-12
      516   SORT-FAIL-13
      527   SORT-FAIL-14
      538   SORT-FAIL-15
      549   SORT-FAIL-16
      560   SORT-FAIL-17
      704   SORT-FAIL-18-1
      713   SORT-FAIL-18-2
      726   SORT-FAIL-19-1
      735   SORT-FAIL-19-2
      368   SORT-FAIL-2
      748   SORT-FAIL-20-1
      757   SORT-FAIL-20-2
      770   SORT-FAIL-21-1
      779   SORT-FAIL-21-2
      792   SORT-FAIL-22-1
      801   SORT-FAIL-22-2
      814   SORT-FAIL-23-1
      823   SORT-FAIL-23-2
      836   SORT-FAIL-24-1
      845   SORT-FAIL-24-2
      858   SORT-FAIL-25-1
      867   SORT-FAIL-25-2
      880   SORT-FAIL-26-1
      889   SORT-FAIL-26-2
      379   SORT-FAIL-3
      390   SORT-FAIL-4
      401   SORT-FAIL-5
      412   SORT-FAIL-6
      423   SORT-FAIL-7
      434   SORT-FAIL-8
      468   SORT-FAIL-9
      347   SORT-INIT-A
      692   SORT-INIT-18
      242   SORT-PARA
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    25
0 Defined   Cross-reference of procedures   References

0     243   SORT-PARAGRAPH
      441   SORT-REMARK-A
      452   SORT-REMARK-B
      353   SORT-TEST-1
      478   SORT-TEST-10
      489   SORT-TEST-11
      500   SORT-TEST-12
      512   SORT-TEST-13
      523   SORT-TEST-14
      534   SORT-TEST-15
      545   SORT-TEST-16
      557   SORT-TEST-17
      697   SORT-TEST-18-1
      707   SORT-TEST-18-2 . . . . . . . .  G703
      719   SORT-TEST-19-1 . . . . . . . .  G712
      729   SORT-TEST-19-2 . . . . . . . .  G725
      364   SORT-TEST-2
      741   SORT-TEST-20-1 . . . . . . . .  G734
      751   SORT-TEST-20-2 . . . . . . . .  G747
      763   SORT-TEST-21-1 . . . . . . . .  G756
      773   SORT-TEST-21-2 . . . . . . . .  G769
      785   SORT-TEST-22-1 . . . . . . . .  G778
      795   SORT-TEST-22-2 . . . . . . . .  G791
      807   SORT-TEST-23-1 . . . . . . . .  G800
      817   SORT-TEST-23-2 . . . . . . . .  G813
      829   SORT-TEST-24-1 . . . . . . . .  G822
      839   SORT-TEST-24-2 . . . . . . . .  G835
      851   SORT-TEST-25-1 . . . . . . . .  G844
      861   SORT-TEST-25-2 . . . . . . . .  G857
      873   SORT-TEST-26-1 . . . . . . . .  G866
      883   SORT-TEST-26-2 . . . . . . . .  G879
      375   SORT-TEST-3
      386   SORT-TEST-4
      397   SORT-TEST-5
      408   SORT-TEST-6
      419   SORT-TEST-7
      430   SORT-TEST-8
      464   SORT-TEST-9
      361   SORT-WRITE-1 . . . . . . . . .  G356
      486   SORT-WRITE-10. . . . . . . . .  G481
      497   SORT-WRITE-11. . . . . . . . .  G492
      508   SORT-WRITE-12. . . . . . . . .  G503
      520   SORT-WRITE-13. . . . . . . . .  G515
      531   SORT-WRITE-14. . . . . . . . .  G526
      542   SORT-WRITE-15. . . . . . . . .  G537
      553   SORT-WRITE-16. . . . . . . . .  G548
      563   SORT-WRITE-17. . . . . . . . .  G559
      372   SORT-WRITE-2 . . . . . . . . .  G367
      383   SORT-WRITE-3 . . . . . . . . .  G378
      394   SORT-WRITE-4 . . . . . . . . .  G389
      405   SORT-WRITE-5 . . . . . . . . .  G400
      416   SORT-WRITE-6 . . . . . . . . .  G411
      427   SORT-WRITE-7 . . . . . . . . .  G422
      438   SORT-WRITE-8 . . . . . . . . .  G433
      472   SORT-WRITE-9 . . . . . . . . .  G467
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    26
0 Defined   Cross-reference of procedures   References

0     451   SPACE-IS-LESS-THAN-B . . . . .  G345
      577   TERMINATE-CALL
      575   TERMINATE-CCVS
      638   WRITE-LINE . . . . . . . . . .  P588 P589 P597 P598 P599 P600 P602 P603 P604 P606 P608 P617 P625 P631 P636 P637
                                            P665 P669 P671 P680
      654   WRT-LN . . . . . . . . . . . .  P644 P645 P646 P647 P648 P649 P650 P653 P658
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    27
0 Defined   Cross-reference of programs     References

        3   ST127A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST127A    Date 06/04/2022  Time 11:57:16   Page    28
0LineID  Message code  Message text

     67  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program ST127A:
 *    Source records = 998
 *    Data Division statements = 86
 *    Procedure Division statements = 641
 *    Generated COBOL statements = 0
 *    Program complexity factor = 648
0End of compilation 1,  program ST127A,  highest severity 0.
0Return code 0
