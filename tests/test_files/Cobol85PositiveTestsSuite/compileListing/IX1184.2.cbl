1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:18   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:18   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1184.2
   000002         000200 PROGRAM-ID.                                                      IX1184.2
   000003         000300     IX118A.                                                      IX1184.2
   000004         000500*                                                              *  IX1184.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1184.2
   000006         000700*                                                              *  IX1184.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1184.2
   000008         000900*                                                              *  IX1184.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1184.2
   000010         001100*                                                              *  IX1184.2
   000011         001300*                                                                 IX1184.2
   000012         001400*    THIS ROUTINE USES THE MASS STORAGE FILE IX-FS3 CREATED IN    IX1184.2
   000013         001500*    IX113A.                                                      IX1184.2
   000014         001600*    THE FILE IS OPENED I-O AND THE STATUS CHECKED (00 EXPECTED), IX1184.2
   000015         001700*    CLOSED AND THE STATUS CHECKED (00 EXPECTED) THEN THE FILE IS IX1184.2
   000016         001800*    OPENED TWICE, AT WHICH POINT THE DECLARATIVES                IX1184.2
   000017         001900*    SECTION SHOULD BE ACTIONED AND THE FILE STATUS SHOULD BE 41  IX1184.2
   000018         002000*    STANDARD REF. IX-5 1.3.4 (5) A                               IX1184.2
   000019         002100*                                                                 IX1184.2
   000020         002200*    X-CARDS USED IN THIS PROGRAM:                                IX1184.2
   000021         002300*                                                                 IX1184.2
   000022         002400*                 XXXXX024                                        IX1184.2
   000023         002500*                 XXXXX055.                                       IX1184.2
   000024         002600*         P       XXXXX062.                                       IX1184.2
   000025         002700*                 XXXXX082.                                       IX1184.2
   000026         002800*                 XXXXX083.                                       IX1184.2
   000027         002900*         C       XXXXX084                                        IX1184.2
   000028         003000*                                                                 IX1184.2
   000029         003100*                                                                 IX1184.2
   000030         003200 ENVIRONMENT DIVISION.                                            IX1184.2
   000031         003300 CONFIGURATION SECTION.                                           IX1184.2
   000032         003400 SOURCE-COMPUTER.                                                 IX1184.2
   000033         003500     XXXXX082.                                                    IX1184.2
   000034         003600 OBJECT-COMPUTER.                                                 IX1184.2
   000035         003700     XXXXX083.                                                    IX1184.2
   000036         003800 INPUT-OUTPUT SECTION.                                            IX1184.2
   000037         003900 FILE-CONTROL.                                                    IX1184.2
   000038         004000     SELECT RAW-DATA   ASSIGN TO                                  IX1184.2 58
   000039         004100     XXXXX062                                                     IX1184.2
   000040         004200            ORGANIZATION IS INDEXED                               IX1184.2
   000041         004300            ACCESS MODE IS RANDOM                                 IX1184.2
   000042         004400            RECORD KEY IS RAW-DATA-KEY.                           IX1184.2 61
   000043         004500*                                                                 IX1184.2
   000044         004600     SELECT PRINT-FILE ASSIGN TO                                  IX1184.2 74
   000045         004700     XXXXX055.                                                    IX1184.2
   000046         004800*                                                                 IX1184.2
   000047         004900     SELECT IX-FS3 ASSIGN                                         IX1184.2 80
   000048         005000     XXXXX024                                                     IX1184.2
   000049         005100     ORGANIZATION IS INDEXED                                      IX1184.2
   000050         005200     ACCESS MODE IS SEQUENTIAL                                    IX1184.2
   000051         005300     RECORD KEY IS IX-FS3-KEY                                     IX1184.2 90
   000052         005400     FILE STATUS IS IX-FS3-STATUS.                                IX1184.2 123
   000053         005500                                                                  IX1184.2
   000054         005600 DATA DIVISION.                                                   IX1184.2
   000055         005700                                                                  IX1184.2
   000056         005800 FILE SECTION.                                                    IX1184.2
   000057         005900                                                                  IX1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000 FD  RAW-DATA.                                                    IX1184.2
   000059         006100                                                                  IX1184.2
   000060         006200 01  RAW-DATA-SATZ.                                               IX1184.2
   000061         006300     05  RAW-DATA-KEY        PIC X(6).                            IX1184.2
   000062         006400     05  C-DATE              PIC 9(6).                            IX1184.2
   000063         006500     05  C-TIME              PIC 9(8).                            IX1184.2
   000064         006600     05  C-NO-OF-TESTS       PIC 99.                              IX1184.2
   000065         006700     05  C-OK                PIC 999.                             IX1184.2
   000066         006800     05  C-ALL               PIC 999.                             IX1184.2
   000067         006900     05  C-FAIL              PIC 999.                             IX1184.2
   000068         007000     05  C-DELETED           PIC 999.                             IX1184.2
   000069         007100     05  C-INSPECT           PIC 999.                             IX1184.2
   000070         007200     05  C-NOTE              PIC X(13).                           IX1184.2
   000071         007300     05  C-INDENT            PIC X.                               IX1184.2
   000072         007400     05  C-ABORT             PIC X(8).                            IX1184.2
   000073         007500                                                                  IX1184.2
   000074         007600 FD  PRINT-FILE.                                                  IX1184.2

 ==000074==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000075         007700                                                                  IX1184.2
   000076         007800 01  PRINT-REC               PIC X(120).                          IX1184.2
   000077         007900                                                                  IX1184.2
   000078         008000 01  DUMMY-RECORD            PIC X(120).                          IX1184.2
   000079         008100                                                                  IX1184.2
   000080         008200 FD  IX-FS3                                                       IX1184.2

 ==000080==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000080==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000081         008300        DATA RECORDS IX-FS3R1-F-G-240                             IX1184.2 *
   000082         008400        LABEL RECORD STANDARD                                     IX1184.2
   000083         008500        RECORD 240                                                IX1184.2
   000084         008600        BLOCK CONTAINS 2 RECORDS.                                 IX1184.2
   000085         008700                                                                  IX1184.2
   000086         008800 01  IX-FS3R1-F-G-240.                                            IX1184.2
   000087         008900     05  IX-FS3-REC-120      PIC X(120).                          IX1184.2
   000088         009000     05  IX-FS3-REC-120-240.                                      IX1184.2
   000089         009100         10  FILLER          PIC X(8).                            IX1184.2
   000090         009200         10  IX-FS3-KEY      PIC X(29).                           IX1184.2
   000091         009300         10  FILLER          PIC X(9).                            IX1184.2
   000092         009400         10  IX-FS3-ALTER-KEY  PIC X(29).                         IX1184.2
   000093         009500         10  FILLER            PIC X(45).                         IX1184.2
   000094         009600                                                                  IX1184.2
   000095         009700                                                                  IX1184.2
   000096         009800 WORKING-STORAGE SECTION.                                         IX1184.2
   000097         009900                                                                  IX1184.2
   000098         010000 01  GRP-0101.                                                    IX1184.2
   000099         010100     05  FILLER              PIC X(10) VALUE "RECORD-KEY".        IX1184.2
   000100         010200     05  GRP-0101-KEY        PIC 9(9)  VALUE ZERO.                IX1184.2 IMP
   000101         010300     05  FILLER              PIC X(10) VALUE "END-OF-KEY".        IX1184.2
   000102         010400                                                                  IX1184.2
   000103         010500 01  GRP-0102.                                                    IX1184.2
   000104         010600     05  FILLER              PIC X(10) VALUE "ALTERN-KEY".        IX1184.2
   000105         010700     05  GRP-0102-KEY        PIC 9(9)  VALUE ZERO.                IX1184.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000106         010800     05  FILLER              PIC X(10) VALUE "END-AL-KEY".        IX1184.2
   000107         010900                                                                  IX1184.2
   000108         011000 01  WRK-CS-09V00            PIC S9(9) COMP VALUE ZERO.           IX1184.2 IMP
   000109         011100                                                                  IX1184.2
   000110         011200 01  EOF-FLAG                PIC 9 VALUE ZERO.                    IX1184.2 IMP
   000111         011300                                                                  IX1184.2
   000112         011400 01  RECORDS-IN-ERROR        PIC S9(5) COMP VALUE ZERO.           IX1184.2 IMP
   000113         011500                                                                  IX1184.2
   000114         011600 01  ERROR-FLAG              PIC 9 VALUE ZERO.                    IX1184.2 IMP
   000115         011700                                                                  IX1184.2
   000116         011800 01  PERM-ERRORS             PIC S9(5) COMP VALUE ZERO.           IX1184.2 IMP
   000117         011900                                                                  IX1184.2
   000118         012000 01  STATUS-TEST-00          PIC 9 VALUE ZERO.                    IX1184.2 IMP
   000119         012100                                                                  IX1184.2
   000120         012200 01  STATUS-TEST-10          PIC 9 VALUE ZERO.                    IX1184.2 IMP
   000121         012300 01  STATUS-TEST-READ        PIC 9 VALUE ZERO.                    IX1184.2 IMP
   000122         012400                                                                  IX1184.2
   000123         012500 01  IX-FS3-STATUS.                                               IX1184.2
   000124         012600     05  IX-FS3-STAT1        PIC X.                               IX1184.2
   000125         012700     05  IX-FS3-STAT2        PIC X.                               IX1184.2
   000126         012800                                                                  IX1184.2
   000127         012900 01  COUNT-OF-RECS           PIC 9(5).                            IX1184.2
   000128         013000                                                                  IX1184.2
   000129         013100 01  COUNT-OF-RECORDS REDEFINES COUNT-OF-RECS  PIC 9(5).          IX1184.2 127
   000130         013200                                                                  IX1184.2
   000131         013300 01  FILE-RECORD-INFORMATION-REC.                                 IX1184.2
   000132         013400     05  FILE-RECORD-INFO-SKELETON.                               IX1184.2
   000133         013500         10  FILLER          PIC X(48) VALUE                      IX1184.2
   000134         013600              "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00". IX1184.2
   000135         013700         10  FILLER          PIC X(46) VALUE                      IX1184.2
   000136         013800                ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000". IX1184.2
   000137         013900         10  FILLER          PIC X(26) VALUE                      IX1184.2
   000138         014000                                    ",LFIL=000000,ORG=  ,LBLR= ". IX1184.2
   000139         014100         10  FILLER          PIC X(37) VALUE                      IX1184.2
   000140         014200                         ",RECKEY=                             ". IX1184.2
   000141         014300         10  FILLER          PIC X(38) VALUE                      IX1184.2
   000142         014400                        ",ALTKEY1=                             ". IX1184.2
   000143         014500         10  FILLER          PIC X(38) VALUE                      IX1184.2
   000144         014600                        ",ALTKEY2=                             ". IX1184.2
   000145         014700         10  FILLER          PIC X(7) VALUE SPACE.                IX1184.2 IMP
   000146         014800     05  FILE-RECORD-INFO             OCCURS 10.                  IX1184.2
   000147         014900         10  FILE-RECORD-INFO-P1-120.                             IX1184.2
   000148         015000             15  FILLER      PIC X(5).                            IX1184.2
   000149         015100             15  XFILE-NAME  PIC X(6).                            IX1184.2
   000150         015200             15  FILLER      PIC X(8).                            IX1184.2
   000151         015300             15  XRECORD-NAME  PIC X(6).                          IX1184.2
   000152         015400             15  FILLER        PIC X(1).                          IX1184.2
   000153         015500             15  REELUNIT-NUMBER  PIC 9(1).                       IX1184.2
   000154         015600             15  FILLER           PIC X(7).                       IX1184.2
   000155         015700             15  XRECORD-NUMBER   PIC 9(6).                       IX1184.2
   000156         015800             15  FILLER           PIC X(6).                       IX1184.2
   000157         015900             15  UPDATE-NUMBER    PIC 9(2).                       IX1184.2
   000158         016000             15  FILLER           PIC X(5).                       IX1184.2
   000159         016100             15  ODO-NUMBER       PIC 9(4).                       IX1184.2
   000160         016200             15  FILLER           PIC X(5).                       IX1184.2
   000161         016300             15  XPROGRAM-NAME    PIC X(5).                       IX1184.2
   000162         016400             15  FILLER           PIC X(7).                       IX1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000163         016500             15  XRECORD-LENGTH   PIC 9(6).                       IX1184.2
   000164         016600             15  FILLER           PIC X(7).                       IX1184.2
   000165         016700             15  CHARS-OR-RECORDS  PIC X(2).                      IX1184.2
   000166         016800             15  FILLER            PIC X(1).                      IX1184.2
   000167         016900             15  XBLOCK-SIZE       PIC 9(4).                      IX1184.2
   000168         017000             15  FILLER            PIC X(6).                      IX1184.2
   000169         017100             15  RECORDS-IN-FILE   PIC 9(6).                      IX1184.2
   000170         017200             15  FILLER            PIC X(5).                      IX1184.2
   000171         017300             15  XFILE-ORGANIZATION  PIC X(2).                    IX1184.2
   000172         017400             15  FILLER              PIC X(6).                    IX1184.2
   000173         017500             15  XLABEL-TYPE         PIC X(1).                    IX1184.2
   000174         017600         10  FILE-RECORD-INFO-P121-240.                           IX1184.2
   000175         017700             15  FILLER              PIC X(8).                    IX1184.2
   000176         017800             15  XRECORD-KEY         PIC X(29).                   IX1184.2
   000177         017900             15  FILLER              PIC X(9).                    IX1184.2
   000178         018000             15  ALTERNATE-KEY1      PIC X(29).                   IX1184.2
   000179         018100             15  FILLER              PIC X(9).                    IX1184.2
   000180         018200             15  ALTERNATE-KEY2      PIC X(29).                   IX1184.2
   000181         018300             15  FILLER              PIC X(7).                    IX1184.2
   000182         018400                                                                  IX1184.2
   000183         018500 01  TEST-RESULTS.                                                IX1184.2
   000184         018600     02 FILLER                   PIC X      VALUE SPACE.          IX1184.2 IMP
   000185         018700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1184.2 IMP
   000186         018800     02 FILLER                   PIC X      VALUE SPACE.          IX1184.2 IMP
   000187         018900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1184.2 IMP
   000188         019000     02 FILLER                   PIC X      VALUE SPACE.          IX1184.2 IMP
   000189         019100     02  PAR-NAME.                                                IX1184.2
   000190         019200       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1184.2 IMP
   000191         019300       03  PARDOT-X              PIC X      VALUE SPACE.          IX1184.2 IMP
   000192         019400       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1184.2 IMP
   000193         019500     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1184.2 IMP
   000194         019600     02 RE-MARK                  PIC X(61).                       IX1184.2
   000195         019700 01  TEST-COMPUTED.                                               IX1184.2
   000196         019800     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1184.2 IMP
   000197         019900     02 FILLER                   PIC X(17)  VALUE                 IX1184.2
   000198         020000            "       COMPUTED=".                                   IX1184.2
   000199         020100     02 COMPUTED-X.                                               IX1184.2
   000200         020200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1184.2 IMP
   000201         020300     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1184.2 200
   000202         020400                                 PIC -9(9).9(9).                  IX1184.2
   000203         020500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1184.2 200
   000204         020600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1184.2 200
   000205         020700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1184.2 200
   000206         020800     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1184.2 200
   000207         020900         04 COMPUTED-18V0                    PIC -9(18).          IX1184.2
   000208         021000         04 FILLER                           PIC X.               IX1184.2
   000209         021100     03 FILLER PIC X(50) VALUE SPACE.                             IX1184.2 IMP
   000210         021200 01  TEST-CORRECT.                                                IX1184.2
   000211         021300     02 FILLER PIC X(30) VALUE SPACE.                             IX1184.2 IMP
   000212         021400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1184.2
   000213         021500     02 CORRECT-X.                                                IX1184.2
   000214         021600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1184.2 IMP
   000215         021700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1184.2 214
   000216         021800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1184.2 214
   000217         021900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1184.2 214
   000218         022000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1184.2 214
   000219         022100     03      CR-18V0 REDEFINES CORRECT-A.                         IX1184.2 214
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000220         022200         04 CORRECT-18V0                     PIC -9(18).          IX1184.2
   000221         022300         04 FILLER                           PIC X.               IX1184.2
   000222         022400     03 FILLER PIC X(2) VALUE SPACE.                              IX1184.2 IMP
   000223         022500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1184.2 IMP
   000224         022600 01  CCVS-C-1.                                                    IX1184.2
   000225         022700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1184.2
   000226         022800-    "SS  PARAGRAPH-NAME                                          IX1184.2
   000227         022900-    "       REMARKS".                                            IX1184.2
   000228         023000     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1184.2 IMP
   000229         023100 01  CCVS-C-2.                                                    IX1184.2
   000230         023200     02 FILLER                     PIC X        VALUE SPACE.      IX1184.2 IMP
   000231         023300     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1184.2
   000232         023400     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1184.2 IMP
   000233         023500     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1184.2
   000234         023600     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1184.2 IMP
   000235         023700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1184.2 IMP
   000236         023800 01  REC-CT                        PIC 99       VALUE ZERO.       IX1184.2 IMP
   000237         023900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1184.2 IMP
   000238         024000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1184.2 IMP
   000239         024100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1184.2 IMP
   000240         024200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1184.2 IMP
   000241         024300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1184.2 IMP
   000242         024400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1184.2 IMP
   000243         024500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1184.2 IMP
   000244         024600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1184.2 IMP
   000245         024700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1184.2 IMP
   000246         024800 01  CCVS-H-1.                                                    IX1184.2
   000247         024900     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1184.2 IMP
   000248         025000     02  FILLER                    PIC X(42)    VALUE             IX1184.2
   000249         025100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1184.2
   000250         025200     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1184.2 IMP
   000251         025300 01  CCVS-H-2A.                                                   IX1184.2
   000252         025400   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1184.2 IMP
   000253         025500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1184.2
   000254         025600   02  FILLER                        PIC XXXX   VALUE             IX1184.2
   000255         025700     "4.2 ".                                                      IX1184.2
   000256         025800   02  FILLER                        PIC X(28)  VALUE             IX1184.2
   000257         025900            " COPY - NOT FOR DISTRIBUTION".                       IX1184.2
   000258         026000   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1184.2 IMP
   000259         026100                                                                  IX1184.2
   000260         026200 01  CCVS-H-2B.                                                   IX1184.2
   000261         026300   02  FILLER                        PIC X(15)  VALUE             IX1184.2
   000262         026400            "TEST RESULT OF ".                                    IX1184.2
   000263         026500   02  TEST-ID                       PIC X(9).                    IX1184.2
   000264         026600   02  FILLER                        PIC X(4)   VALUE             IX1184.2
   000265         026700            " IN ".                                               IX1184.2
   000266         026800   02  FILLER                        PIC X(12)  VALUE             IX1184.2
   000267         026900     " HIGH       ".                                              IX1184.2
   000268         027000   02  FILLER                        PIC X(22)  VALUE             IX1184.2
   000269         027100            " LEVEL VALIDATION FOR ".                             IX1184.2
   000270         027200   02  FILLER                        PIC X(58)  VALUE             IX1184.2
   000271         027300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1184.2
   000272         027400 01  CCVS-H-3.                                                    IX1184.2
   000273         027500     02  FILLER                      PIC X(34)  VALUE             IX1184.2
   000274         027600            " FOR OFFICIAL USE ONLY    ".                         IX1184.2
   000275         027700     02  FILLER                      PIC X(58)  VALUE             IX1184.2
   000276         027800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000277         027900     02  FILLER                      PIC X(28)  VALUE             IX1184.2
   000278         028000            "  COPYRIGHT   1985 ".                                IX1184.2
   000279         028100 01  CCVS-E-1.                                                    IX1184.2
   000280         028200     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1184.2 IMP
   000281         028300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1184.2
   000282         028400     02 ID-AGAIN                     PIC X(9).                    IX1184.2
   000283         028500     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1184.2 IMP
   000284         028600 01  CCVS-E-2.                                                    IX1184.2
   000285         028700     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1184.2 IMP
   000286         028800     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1184.2 IMP
   000287         028900     02 CCVS-E-2-2.                                               IX1184.2
   000288         029000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1184.2 IMP
   000289         029100         03 FILLER                   PIC X      VALUE SPACE.      IX1184.2 IMP
   000290         029200         03 ENDER-DESC               PIC X(44)  VALUE             IX1184.2
   000291         029300            "ERRORS ENCOUNTERED".                                 IX1184.2
   000292         029400 01  CCVS-E-3.                                                    IX1184.2
   000293         029500     02  FILLER                      PIC X(22)  VALUE             IX1184.2
   000294         029600            " FOR OFFICIAL USE ONLY".                             IX1184.2
   000295         029700     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1184.2 IMP
   000296         029800     02  FILLER                      PIC X(58)  VALUE             IX1184.2
   000297         029900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1184.2
   000298         030000     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1184.2 IMP
   000299         030100     02 FILLER                       PIC X(15)  VALUE             IX1184.2
   000300         030200             " COPYRIGHT 1985".                                   IX1184.2
   000301         030300 01  CCVS-E-4.                                                    IX1184.2
   000302         030400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1184.2 IMP
   000303         030500     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1184.2
   000304         030600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1184.2 IMP
   000305         030700     02 FILLER                       PIC X(40)  VALUE             IX1184.2
   000306         030800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1184.2
   000307         030900 01  XXINFO.                                                      IX1184.2
   000308         031000     02 FILLER                       PIC X(19)  VALUE             IX1184.2
   000309         031100            "*** INFORMATION ***".                                IX1184.2
   000310         031200     02 INFO-TEXT.                                                IX1184.2
   000311         031300       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1184.2 IMP
   000312         031400       04 XXCOMPUTED                 PIC X(20).                   IX1184.2
   000313         031500       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1184.2 IMP
   000314         031600       04 XXCORRECT                  PIC X(20).                   IX1184.2
   000315         031700     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1184.2
   000316         031800 01  HYPHEN-LINE.                                                 IX1184.2
   000317         031900     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1184.2 IMP
   000318         032000     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1184.2
   000319         032100-    "*****************************************".                 IX1184.2
   000320         032200     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1184.2
   000321         032300-    "******************************".                            IX1184.2
   000322         032400 01  TEST-NO                         PIC 99.                      IX1184.2
   000323         032500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1184.2
   000324         032600     "IX118A".                                                    IX1184.2
   000325         032700 PROCEDURE DIVISION.                                              IX1184.2
   000326         032800 DECLARATIVES.                                                    IX1184.2
   000327         032900                                                                  IX1184.2
   000328         033000 SECT-IX105-0002 SECTION.                                         IX1184.2
   000329         033100     USE AFTER EXCEPTION PROCEDURE ON IX-FS3.                     IX1184.2 80
   000330         033200 INPUT-PROCESS.                                                   IX1184.2
   000331         033300     IF TEST-NO = 5                                               IX1184.2 322
   000332      1  033400        GO TO D-C-TEST-GF-01-1.                                   IX1184.2 340
   000333         033500     IF STATUS-TEST-10 EQUAL TO 1                                 IX1184.2 120
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000334      1  033600        IF  IX-FS3-STAT1 EQUAL TO "1"                             IX1184.2 124
   000335      2  033700            MOVE 1 TO EOF-FLAG                                    IX1184.2 110
   000336      1  033800        ELSE                                                      IX1184.2
   000337      2  033900           IF  IX-FS3-STAT1 GREATER THAN "1"                      IX1184.2 124
   000338      3  034000           MOVE 1 TO PERM-ERRORS.                                 IX1184.2 116
   000339         034100     GO TO DECL-EXIT.                                             IX1184.2 467
   000340         034200 D-C-TEST-GF-01-1.                                                IX1184.2
   000341         034300     IF IX-FS3-STATUS EQUAL TO "41"                               IX1184.2 123
   000342      1  034400         GO TO D-C-PASS-GF-01-0.                                  IX1184.2 349
   000343         034500 D-C-FAIL-GF-01-0.                                                IX1184.2
   000344         034600     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1184.2 123 200
   000345         034700     MOVE "41" TO CORRECT-X.                                      IX1184.2 213
   000346         034800     MOVE "IX-5, 1.3.4, (5) A" TO RE-MARK.                        IX1184.2 194
   000347         034900     PERFORM D-FAIL.                                              IX1184.2 373
   000348         035000     GO TO D-C-WRITE-GF-01-0.                                     IX1184.2 351
   000349         035100 D-C-PASS-GF-01-0.                                                IX1184.2
   000350         035200     PERFORM D-PASS.                                              IX1184.2 372
   000351         035300 D-C-WRITE-GF-01-0.                                               IX1184.2
   000352         035400     PERFORM D-PRINT-DETAIL.                                      IX1184.2 374
   000353         035500 D-CLOSE-FILES.                                                   IX1184.2
   000354         035600     OPEN I-O RAW-DATA.                                           IX1184.2 58
   000355         035700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1184.2 323 61
   000356         035800     READ RAW-DATA INVALID KEY GO TO D-END-E-2.                   IX1184.2 58 364
   000357         035900     MOVE "OK.     " TO C-ABORT.                                  IX1184.2 72
   000358         036000     MOVE PASS-COUNTER TO C-OK.                                   IX1184.2 240 65
   000359         036100     MOVE ERROR-HOLD   TO C-ALL.                                  IX1184.2 242 66
   000360         036200     MOVE ERROR-COUNTER TO C-FAIL.                                IX1184.2 238 67
   000361         036300     MOVE DELETE-COUNTER TO C-DELETED.                            IX1184.2 237 68
   000362         036400     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1184.2 239 69
   000363         036500     REWRITE RAW-DATA-SATZ INVALID KEY GO TO D-END-E-2.           IX1184.2 60 364
   000364         036600 D-END-E-2.                                                       IX1184.2
   000365         036700     CLOSE RAW-DATA.                                              IX1184.2 58
   000366         036800     PERFORM D-END-ROUTINE THRU D-END-ROUTINE-13.                 IX1184.2 389 411
   000367         036900     CLOSE PRINT-FILE.                                            IX1184.2 74
   000368         037000 D-TERMINATE-CCVS.                                                IX1184.2
   000369         037100     EXIT PROGRAM.                                                IX1184.2
   000370         037200 D-TERMINATE-CALL.                                                IX1184.2
   000371         037300     STOP     RUN.                                                IX1184.2
   000372         037400 D-PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.         IX1184.2 187 240
   000373         037500 D-FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.        IX1184.2 187 238
   000374         037600 D-PRINT-DETAIL.                                                  IX1184.2
   000375         037700     IF   REC-CT NOT EQUAL TO ZERO                                IX1184.2 236 IMP
   000376      1  037800          MOVE "." TO PARDOT-X                                    IX1184.2 191
   000377      1  037900          MOVE REC-CT TO DOTVALUE.                                IX1184.2 236 192
   000378         038000     MOVE TEST-RESULTS TO PRINT-REC.                              IX1184.2 183 76
   000379         038100     PERFORM D-WRITE-LINE.                                        IX1184.2 424
   000380         038200     IF   P-OR-F EQUAL TO "FAIL*"                                 IX1184.2 187
   000381      1  038300          PERFORM D-WRITE-LINE                                    IX1184.2 424
   000382      1  038400          PERFORM D-FAIL-ROUTINE THRU D-FAIL-ROUTINE-EX           IX1184.2 443 457
   000383         038500     ELSE                                                         IX1184.2
   000384      1  038600          PERFORM D-BAIL-OUT THRU D-BAIL-OUT-EX.                  IX1184.2 458 466
   000385         038700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1184.2 IMP 187 IMP 199
   000386         038800     MOVE SPACE TO CORRECT-X.                                     IX1184.2 IMP 213
   000387         038900     IF   REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.           IX1184.2 236 IMP IMP 189
   000388         039000     MOVE SPACE TO RE-MARK.                                       IX1184.2 IMP 194
   000389         039100 D-END-ROUTINE.                                                   IX1184.2
   000390         039200     MOVE HYPHEN-LINE TO DUMMY-RECORD.                            IX1184.2 316 78
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000391         039300     PERFORM D-WRITE-LINE 5 TIMES.                                IX1184.2 424
   000392         039400 D-END-RTN-EXIT.                                                  IX1184.2
   000393         039500     MOVE CCVS-E-1 TO DUMMY-RECORD.                               IX1184.2 279 78
   000394         039600     PERFORM D-WRITE-LINE 2 TIMES.                                IX1184.2 424
   000395         039700 D-END-ROUTINE-1.                                                 IX1184.2
   000396         039800     ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO       IX1184.2 238 242 239
   000397         039900     ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.                IX1184.2 242 237 242
   000398         040000     ADD PASS-COUNTER TO ERROR-HOLD.                              IX1184.2 240 242
   000399         040100     MOVE PASS-COUNTER TO CCVS-E-4-1.                             IX1184.2 240 302
   000400         040200     MOVE ERROR-HOLD TO CCVS-E-4-2.                               IX1184.2 242 304
   000401         040300     MOVE CCVS-E-4 TO CCVS-E-2-2.                                 IX1184.2 301 287
   000402         040400     MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM D-WRITE-LINE.          IX1184.2 284 78 424
   000403         040500  D-END-ROUTINE-12.                                               IX1184.2
   000404         040600     MOVE "TEST(S) FAILED" TO ENDER-DESC.                         IX1184.2 290
   000405         040700     IF  ERROR-COUNTER IS EQUAL TO ZERO                           IX1184.2 238 IMP
   000406      1  040800         MOVE "NO " TO ERROR-TOTAL                                IX1184.2 288
   000407         040900     ELSE                                                         IX1184.2
   000408      1  041000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1184.2 238 288
   000409         041100     MOVE    CCVS-E-2 TO DUMMY-RECORD.                            IX1184.2 284 78
   000410         041200     PERFORM D-WRITE-LINE.                                        IX1184.2 424
   000411         041300 D-END-ROUTINE-13.                                                IX1184.2
   000412         041400     IF  DELETE-COUNTER IS EQUAL TO ZERO                          IX1184.2 237 IMP
   000413      1  041500         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1184.2 288
   000414      1  041600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1184.2 237 288
   000415         041700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1184.2 290
   000416         041800     MOVE CCVS-E-2 TO DUMMY-RECORD.                               IX1184.2 284 78
   000417         041900     PERFORM D-WRITE-LINE.                                        IX1184.2 424
   000418         042000     IF   INSPECT-COUNTER EQUAL TO ZERO                           IX1184.2 239 IMP
   000419      1  042100          MOVE "NO " TO ERROR-TOTAL                               IX1184.2 288
   000420      1  042200     ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                    IX1184.2 239 288
   000421         042300     MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.             IX1184.2 290
   000422         042400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1184.2 284 78 424
   000423         042500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1184.2 292 78 424
   000424         042600 D-WRITE-LINE.                                                    IX1184.2
   000425         042700     ADD 1 TO RECORD-COUNT.                                       IX1184.2 244
   000426         042800     IF RECORD-COUNT GREATER 42                                   IX1184.2 244
   000427      1  042900        MOVE DUMMY-RECORD TO DUMMY-HOLD                           IX1184.2 78 243
   000428      1  043000        MOVE SPACE TO DUMMY-RECORD                                IX1184.2 IMP 78
   000429      1  043100        WRITE DUMMY-RECORD AFTER ADVANCING PAGE                   IX1184.2 78
   000430      1  043200        MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1184.2 246 78 440
   000431      1  043300        MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1184.2 251 78 440
   000432      1  043400        MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1184.2 260 78 440
   000433      1  043500        MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1184.2 272 78 440
   000434      1  043600        MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1184.2 224 78 440
   000435      1  043700        MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1184.2 229 78 440
   000436      1  043800        MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM D-WRT-LN         IX1184.2 316 78 440
   000437      1  043900        MOVE DUMMY-HOLD TO DUMMY-RECORD                           IX1184.2 243 78
   000438      1  044000        MOVE ZERO TO RECORD-COUNT.                                IX1184.2 IMP 244
   000439         044100     PERFORM D-WRT-LN.                                            IX1184.2 440
   000440         044200 D-WRT-LN.                                                        IX1184.2
   000441         044300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1184.2 78
   000442         044400     MOVE SPACE TO DUMMY-RECORD.                                  IX1184.2 IMP 78
   000443         044500 D-FAIL-ROUTINE.                                                  IX1184.2
   000444         044600     IF   COMPUTED-X NOT EQUAL TO SPACE                           IX1184.2 199 IMP
   000445      1  044700          GO TO D-FAIL-ROUTINE-WRITE.                             IX1184.2 452
   000446         044800     IF   CORRECT-X NOT EQUAL TO SPACE GO TO D-FAIL-ROUTINE-WRITE.IX1184.2 213 IMP 452
   000447         044900     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1184.2 245 315
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448         045000     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    IX1184.2 310
   000449         045100     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1184.2 307 78 424
   000450         045200     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1184.2 IMP 315
   000451         045300     GO TO D-FAIL-ROUTINE-EX.                                     IX1184.2 457
   000452         045400 D-FAIL-ROUTINE-WRITE.                                            IX1184.2
   000453         045500     MOVE TEST-COMPUTED TO PRINT-REC PERFORM D-WRITE-LINE         IX1184.2 195 76 424
   000454         045600     MOVE ANSI-REFERENCE TO COR-ANSI-REFERENCE.                   IX1184.2 245 223
   000455         045700     MOVE TEST-CORRECT TO PRINT-REC PERFORM D-WRITE-LINE 2 TIMES. IX1184.2 210 76 424
   000456         045800     MOVE SPACES TO COR-ANSI-REFERENCE.                           IX1184.2 IMP 223
   000457         045900 D-FAIL-ROUTINE-EX. EXIT.                                         IX1184.2
   000458         046000 D-BAIL-OUT.                                                      IX1184.2
   000459         046100     IF  COMPUTED-A NOT EQUAL TO SPACE GO TO D-BAIL-OUT-WRITE.    IX1184.2 200 IMP 461
   000460         046200     IF  CORRECT-A EQUAL TO SPACE GO TO D-BAIL-OUT-EX.            IX1184.2 214 IMP 466
   000461         046300 D-BAIL-OUT-WRITE.                                                IX1184.2
   000462         046400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1184.2 214 314 200 312
   000463         046500     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1184.2 245 315
   000464         046600     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1184.2 307 78 424
   000465         046700     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1184.2 IMP 315
   000466         046800 D-BAIL-OUT-EX. EXIT.                                             IX1184.2
   000467         046900 DECL-EXIT.  EXIT.                                                IX1184.2
   000468         047000 END DECLARATIVES.                                                IX1184.2
   000469         047100                                                                  IX1184.2
   000470         047200                                                                  IX1184.2
   000471         047300 CCVS1 SECTION.                                                   IX1184.2
   000472         047400 OPEN-FILES.                                                      IX1184.2
   000473         047500     OPEN I-O RAW-DATA.                                           IX1184.2 58
   000474         047600     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1184.2 323 61
   000475         047700     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1184.2 58 481
   000476         047800     MOVE "ABORTED " TO C-ABORT.                                  IX1184.2 72
   000477         047900     ADD 1 TO C-NO-OF-TESTS.                                      IX1184.2 64
   000478         048000     ACCEPT C-DATE  FROM DATE.                                    IX1184.2 62
   000479         048100     ACCEPT C-TIME  FROM TIME.                                    IX1184.2 63
   000480         048200     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1184.2 60 481
   000481         048300 END-E-1.                                                         IX1184.2
   000482         048400     CLOSE RAW-DATA.                                              IX1184.2 58
   000483         048500     OPEN    OUTPUT PRINT-FILE.                                   IX1184.2 74
   000484         048600     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1184.2 323 263 323 282
   000485         048700     MOVE    SPACE TO TEST-RESULTS.                               IX1184.2 IMP 183
   000486         048800     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1184.2 530 535
   000487         048900     MOVE    ZERO TO REC-SKL-SUB.                                 IX1184.2 IMP 235
   000488         049000     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1184.2 489
   000489         049100 CCVS-INIT-FILE.                                                  IX1184.2
   000490         049200     ADD     1 TO REC-SKL-SUB.                                    IX1184.2 235
   000491         049300     MOVE    FILE-RECORD-INFO-SKELETON                            IX1184.2 132
   000492         049400          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1184.2 146 235
   000493         049500 CCVS-INIT-EXIT.                                                  IX1184.2
   000494         049600     GO TO CCVS1-EXIT.                                            IX1184.2 617
   000495         049700 CLOSE-FILES.                                                     IX1184.2
   000496         049800     OPEN I-O RAW-DATA.                                           IX1184.2 58
   000497         049900     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1184.2 323 61
   000498         050000     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1184.2 58 506
   000499         050100     MOVE "OK.     " TO C-ABORT.                                  IX1184.2 72
   000500         050200     MOVE PASS-COUNTER TO C-OK.                                   IX1184.2 240 65
   000501         050300     MOVE ERROR-HOLD   TO C-ALL.                                  IX1184.2 242 66
   000502         050400     MOVE ERROR-COUNTER TO C-FAIL.                                IX1184.2 238 67
   000503         050500     MOVE DELETE-COUNTER TO C-DELETED.                            IX1184.2 237 68
   000504         050600     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1184.2 239 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000505         050700     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1184.2 60 506
   000506         050800 END-E-2.                                                         IX1184.2
   000507         050900     CLOSE RAW-DATA.                                              IX1184.2 58
   000508         051000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1184.2 539 560 74
   000509         051100 TERMINATE-CCVS.                                                  IX1184.2
   000510         051200     EXIT PROGRAM.                                                IX1184.2
   000511         051300 TERMINATE-CALL.                                                  IX1184.2
   000512         051400     STOP     RUN.                                                IX1184.2
   000513         051500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1184.2 187 239
   000514         051600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1184.2 187 240
   000515         051700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1184.2 187 238
   000516         051800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1184.2 187 237
   000517         051900     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1184.2 194
   000518         052000 PRINT-DETAIL.                                                    IX1184.2
   000519         052100     IF REC-CT NOT EQUAL TO ZERO                                  IX1184.2 236 IMP
   000520      1  052200             MOVE "." TO PARDOT-X                                 IX1184.2 191
   000521      1  052300             MOVE REC-CT TO DOTVALUE.                             IX1184.2 236 192
   000522         052400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1184.2 183 76 572
   000523         052500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1184.2 187 572
   000524      1  052600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1184.2 593 607
   000525      1  052700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1184.2 608 616
   000526         052800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1184.2 IMP 187 IMP 199
   000527         052900     MOVE SPACE TO CORRECT-X.                                     IX1184.2 IMP 213
   000528         053000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1184.2 236 IMP IMP 189
   000529         053100     MOVE     SPACE TO RE-MARK.                                   IX1184.2 IMP 194
   000530         053200 HEAD-ROUTINE.                                                    IX1184.2
   000531         053300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1184.2 246 78 572
   000532         053400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1184.2 251 78 572
   000533         053500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1184.2 260 78 572
   000534         053600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1184.2 272 78 572
   000535         053700 COLUMN-NAMES-ROUTINE.                                            IX1184.2
   000536         053800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1184.2 224 78 572
   000537         053900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1184.2 229 78 572
   000538         054000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1184.2 316 78 572
   000539         054100 END-ROUTINE.                                                     IX1184.2
   000540         054200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1184.2 316 78 572
   000541         054300 END-RTN-EXIT.                                                    IX1184.2
   000542         054400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1184.2 279 78 572
   000543         054500 END-ROUTINE-1.                                                   IX1184.2
   000544         054600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1184.2 238 242 239
   000545         054700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1184.2 242 237 242
   000546         054800      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1184.2 240 242
   000547         054900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1184.2
   000548         055000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1184.2 240 302
   000549         055100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1184.2 242 304
   000550         055200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1184.2 301 287
   000551         055300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1184.2 284 78 572
   000552         055400  END-ROUTINE-12.                                                 IX1184.2
   000553         055500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1184.2 290
   000554         055600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1184.2 238 IMP
   000555      1  055700         MOVE "NO " TO ERROR-TOTAL                                IX1184.2 288
   000556         055800         ELSE                                                     IX1184.2
   000557      1  055900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1184.2 238 288
   000558         056000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1184.2 284 78
   000559         056100     PERFORM WRITE-LINE.                                          IX1184.2 572
   000560         056200 END-ROUTINE-13.                                                  IX1184.2
   000561         056300     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1184.2 237 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000562      1  056400         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1184.2 288
   000563      1  056500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1184.2 237 288
   000564         056600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1184.2 290
   000565         056700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1184.2 284 78 572
   000566         056800      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1184.2 239 IMP
   000567      1  056900          MOVE "NO " TO ERROR-TOTAL                               IX1184.2 288
   000568      1  057000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1184.2 239 288
   000569         057100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1184.2 290
   000570         057200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1184.2 284 78 572
   000571         057300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1184.2 292 78 572
   000572         057400 WRITE-LINE.                                                      IX1184.2
   000573         057500     ADD 1 TO RECORD-COUNT.                                       IX1184.2 244
   000574         057600     IF RECORD-COUNT GREATER 42                                   IX1184.2 244
   000575      1  057700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1184.2 78 243
   000576      1  057800         MOVE SPACE TO DUMMY-RECORD                               IX1184.2 IMP 78
   000577      1  057900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1184.2 78
   000578      1  058000         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1184.2 246 78 588
   000579      1  058100         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1184.2 251 78 588
   000580      1  058200         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1184.2 260 78 588
   000581      1  058300         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1184.2 272 78 588
   000582      1  058400         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1184.2 224 78 588
   000583      1  058500         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1184.2 229 78 588
   000584      1  058600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1184.2 316 78 588
   000585      1  058700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1184.2 243 78
   000586      1  058800         MOVE ZERO TO RECORD-COUNT.                               IX1184.2 IMP 244
   000587         058900     PERFORM WRT-LN.                                              IX1184.2 588
   000588         059000 WRT-LN.                                                          IX1184.2
   000589         059100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1184.2 78
   000590         059200     MOVE SPACE TO DUMMY-RECORD.                                  IX1184.2 IMP 78
   000591         059300 BLANK-LINE-PRINT.                                                IX1184.2
   000592         059400     PERFORM WRT-LN.                                              IX1184.2 588
   000593         059500 FAIL-ROUTINE.                                                    IX1184.2
   000594         059600     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1184.2 199 IMP
   000595      1  059700            GO TO   FAIL-ROUTINE-WRITE.                           IX1184.2 602
   000596         059800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1184.2 213 IMP 602
   000597         059900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1184.2 245 315
   000598         060000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1184.2 310
   000599         060100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1184.2 307 78 572
   000600         060200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1184.2 IMP 315
   000601         060300     GO TO  FAIL-ROUTINE-EX.                                      IX1184.2 607
   000602         060400 FAIL-ROUTINE-WRITE.                                              IX1184.2
   000603         060500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1184.2 195 76 572
   000604         060600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1184.2 245 223
   000605         060700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1184.2 210 76 572
   000606         060800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1184.2 IMP 223
   000607         060900 FAIL-ROUTINE-EX. EXIT.                                           IX1184.2
   000608         061000 BAIL-OUT.                                                        IX1184.2
   000609         061100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1184.2 200 IMP 611
   000610         061200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1184.2 214 IMP 616
   000611         061300 BAIL-OUT-WRITE.                                                  IX1184.2
   000612         061400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1184.2 214 314 200 312
   000613         061500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1184.2 245 315
   000614         061600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1184.2 307 78 572
   000615         061700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1184.2 IMP 315
   000616         061800 BAIL-OUT-EX. EXIT.                                               IX1184.2
   000617         061900 CCVS1-EXIT.                                                      IX1184.2
   000618         062000     EXIT.                                                        IX1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000619         062100                                                                  IX1184.2
   000620         062200 SECT-IX118A-0003 SECTION.                                        IX1184.2
   000621         062300 SEQ-INIT-010.                                                    IX1184.2
   000622         062400     MOVE ZERO TO TEST-NO.                                        IX1184.2 IMP 322
   000623         062500     MOVE "IX-FS3" TO XFILE-NAME (1).                             IX1184.2 149
   000624         062600     MOVE "R1-F-G" TO XRECORD-NAME (1).                           IX1184.2 151
   000625         062700     MOVE CCVS-PGM-ID TO XPROGRAM-NAME (1).                       IX1184.2 323 161
   000626         062800     MOVE 000240 TO XRECORD-LENGTH (1).                           IX1184.2 163
   000627         062900     MOVE "RC" TO CHARS-OR-RECORDS (1).                           IX1184.2 165
   000628         063000     MOVE 0002 TO XBLOCK-SIZE (1).                                IX1184.2 167
   000629         063100     MOVE 000050 TO RECORDS-IN-FILE (1).                          IX1184.2 169
   000630         063200     MOVE "IX" TO XFILE-ORGANIZATION (1).                         IX1184.2 171
   000631         063300     MOVE "S" TO XLABEL-TYPE (1).                                 IX1184.2 173
   000632         063400     MOVE 000001 TO XRECORD-NUMBER (1).                           IX1184.2 155
   000633         063500     MOVE 0 TO COUNT-OF-RECS.                                     IX1184.2 127
   000634         063600                                                                  IX1184.2
   000635         063800*   TEST  1                                                      *IX1184.2
   000636         063900*         OPEN OUTPUT ...                 00 EXPECTED            *IX1184.2
   000637         064000*         IX-3, 1.3.4 (1) A                                      *IX1184.2
   000638         064100*    STATUS 00 CHECK ON OUTPUT FILE IX-FS3                       *IX1184.2
   000639         064200*    THE OUTPUT STATEMENT IS SUCCESSFULLY EXECUTED               *IX1184.2
   000640         064400 OPN-INIT-GF-01-0.                                                IX1184.2
   000641         064500     MOVE 1 TO STATUS-TEST-00.                                    IX1184.2 118
   000642         064600     MOVE SPACES TO IX-FS3-STATUS.                                IX1184.2 IMP 123
   000643         064700     MOVE "OPEN I-O   : 00 EXP." TO FEATURE.                      IX1184.2 185
   000644         064800     MOVE "OPN-TEST-GF-01-0" TO PAR-NAME.                         IX1184.2 189
   000645         064900     OPEN                                                         IX1184.2
   000646         065000        I-O    IX-FS3.                                            IX1184.2 80
   000647         065100     IF IX-FS3-STATUS EQUAL TO "00"                               IX1184.2 123
   000648      1  065200         GO TO OPN-PASS-GF-01-0.                                  IX1184.2 655
   000649         065300 OPN-FAIL-GF-01-0.                                                IX1184.2
   000650         065400     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1184.2 194
   000651         065500     PERFORM FAIL.                                                IX1184.2 515
   000652         065600     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1184.2 123 200
   000653         065700     MOVE "00" TO CORRECT-X.                                      IX1184.2 213
   000654         065800     GO TO OPN-WRITE-GF-01-0.                                     IX1184.2 657
   000655         065900 OPN-PASS-GF-01-0.                                                IX1184.2
   000656         066000     PERFORM PASS.                                                IX1184.2 514
   000657         066100 OPN-WRITE-GF-01-0.                                               IX1184.2
   000658         066200     PERFORM PRINT-DETAIL.                                        IX1184.2 518
   000659         066400*   TEST  4                                                      *IX1184.2
   000660         066500*         CLOSE I-O                       00 EXPECTED            *IX1184.2
   000661         066600*         IX-3, 1.3.4 (1) A                                      *IX1184.2
   000662         066800 CLO-INIT-GF-01-0.                                                IX1184.2
   000663         066900     MOVE SPACES TO IX-FS3-STATUS.                                IX1184.2 IMP 123
   000664         067000     MOVE "CLOSE I-O   :00 EXP." TO FEATURE.                      IX1184.2 185
   000665         067100     MOVE "CLO-TEST-GF-01-0" TO PAR-NAME.                         IX1184.2 189
   000666         067200 CLO-TEST-GF-01-0.                                                IX1184.2
   000667         067300     CLOSE IX-FS3.                                                IX1184.2 80
   000668         067400     IF IX-FS3-STATUS = "00"                                      IX1184.2 123
   000669      1  067500         GO TO CLO-PASS-GF-01-0.                                  IX1184.2 676
   000670         067600 CLO-FAIL-GF-01-0.                                                IX1184.2
   000671         067700     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1184.2 194
   000672         067800     PERFORM FAIL.                                                IX1184.2 515
   000673         067900     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1184.2 123 200
   000674         068000     MOVE "00" TO CORRECT-X.                                      IX1184.2 213
   000675         068100     GO TO CLO-WRITE-GF-01-0.                                     IX1184.2 678
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000676         068200 CLO-PASS-GF-01-0.                                                IX1184.2
   000677         068300     PERFORM PASS.                                                IX1184.2 514
   000678         068400 CLO-WRITE-GF-01-0.                                               IX1184.2
   000679         068500     PERFORM PRINT-DETAIL.                                        IX1184.2 518
   000680         068600                                                                  IX1184.2
   000681         068800*    A INDEXED FILE WITH 50 RECORDS HAS BEEN CREATED.            *IX1184.2
   000682         069000                                                                  IX1184.2
   000683         069200*   TEST  5                                                      *IX1184.2
   000684         069300*         OPEN FOR A FILE ALREADY IN  OPEN MODE                  *IX1184.2
   000685         069400*         FILE STATUS 41 EXPECTED IX-5, 1.3.4 (5) A              *IX1184.2
   000686         069600 OPN-TEST-GF-02-0.                                                IX1184.2
   000687         069700     MOVE  5 TO TEST-NO.                                          IX1184.2 322
   000688         069800     MOVE SPACES TO IX-FS3-STATUS.                                IX1184.2 IMP 123
   000689         069900     MOVE "OPEN         41 EXP." TO FEATURE                       IX1184.2 185
   000690         070000     MOVE "OPN-TEST-GF-02-0" TO PAR-NAME.                         IX1184.2 189
   000691         070100     OPEN INPUT IX-FS3.                                           IX1184.2 80
   000692         070200     OPEN INPUT IX-FS3.                                           IX1184.2 80
   000693         070300 OPN-TEST-GF-02-1.                                                IX1184.2
   000694         070400     IF IX-FS3-STATUS EQUAL TO "41"                               IX1184.2 123
   000695      1  070500        MOVE "SHOULD HAVE EXECUTED DECLARATIVES IX-3,1.3.4(4)"    IX1184.2
   000696      1  070600          TO RE-MARK                                              IX1184.2 194
   000697      1  070700        GO TO OPN-WRITE-GF-02-0.                                  IX1184.2 700
   000698         070800 OPN-FAIL-GF-02-0.                                                IX1184.2
   000699         070900     MOVE "IX-5, 1.3.4, (5) A" TO RE-MARK.                        IX1184.2 194
   000700         071000 OPN-WRITE-GF-02-0.                                               IX1184.2
   000701         071100     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1184.2 123 200
   000702         071200     MOVE "41" TO CORRECT-X.                                      IX1184.2 213
   000703         071300     PERFORM FAIL.                                                IX1184.2 515
   000704         071400     PERFORM PRINT-DETAIL.                                        IX1184.2 518
   000705         071500     CLOSE IX-FS3.                                                IX1184.2 80
   000706         071600                                                                  IX1184.2
   000707         071700 TERMINATE-ROUTINE.                                               IX1184.2
   000708         071800     EXIT.                                                        IX1184.2
   000709         071900                                                                  IX1184.2
   000710         072000 CCVS-EXIT SECTION.                                               IX1184.2
   000711         072100 CCVS-999999.                                                     IX1184.2
   000712         072200     GO TO CLOSE-FILES.                                           IX1184.2 495
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      178   ALTERNATE-KEY1
      180   ALTERNATE-KEY2
      245   ANSI-REFERENCE . . . . . . . .  447 454 463 597 604 613
       72   C-ABORT. . . . . . . . . . . .  M357 M476 M499
       66   C-ALL. . . . . . . . . . . . .  M359 M501
       62   C-DATE . . . . . . . . . . . .  M478
       68   C-DELETED. . . . . . . . . . .  M361 M503
       67   C-FAIL . . . . . . . . . . . .  M360 M502
       71   C-INDENT
       69   C-INSPECT. . . . . . . . . . .  M362 M504
       64   C-NO-OF-TESTS. . . . . . . . .  M477
       70   C-NOTE
       65   C-OK . . . . . . . . . . . . .  M358 M500
       63   C-TIME . . . . . . . . . . . .  M479
      224   CCVS-C-1 . . . . . . . . . . .  434 536 582
      229   CCVS-C-2 . . . . . . . . . . .  435 537 583
      279   CCVS-E-1 . . . . . . . . . . .  393 542
      284   CCVS-E-2 . . . . . . . . . . .  402 409 416 422 551 558 565 570
      287   CCVS-E-2-2 . . . . . . . . . .  M401 M550
      292   CCVS-E-3 . . . . . . . . . . .  423 571
      301   CCVS-E-4 . . . . . . . . . . .  401 550
      302   CCVS-E-4-1 . . . . . . . . . .  M399 M548
      304   CCVS-E-4-2 . . . . . . . . . .  M400 M549
      246   CCVS-H-1 . . . . . . . . . . .  430 531 578
      251   CCVS-H-2A. . . . . . . . . . .  431 532 579
      260   CCVS-H-2B. . . . . . . . . . .  432 533 580
      272   CCVS-H-3 . . . . . . . . . . .  433 534 581
      323   CCVS-PGM-ID. . . . . . . . . .  355 474 484 484 497 625
      165   CHARS-OR-RECORDS . . . . . . .  M627
      206   CM-18V0
      200   COMPUTED-A . . . . . . . . . .  201 203 204 205 206 M344 459 462 609 612 M652 M673 M701
      201   COMPUTED-N
      199   COMPUTED-X . . . . . . . . . .  M385 444 M526 594
      203   COMPUTED-0V18
      205   COMPUTED-14V4
      207   COMPUTED-18V0
      204   COMPUTED-4V14
      223   COR-ANSI-REFERENCE . . . . . .  M454 M456 M604 M606
      214   CORRECT-A. . . . . . . . . . .  215 216 217 218 219 460 462 610 612
      215   CORRECT-N
      213   CORRECT-X. . . . . . . . . . .  M345 M386 446 M527 596 M653 M674 M702
      216   CORRECT-0V18
      218   CORRECT-14V4
      220   CORRECT-18V0
      217   CORRECT-4V14
      129   COUNT-OF-RECORDS
      127   COUNT-OF-RECS. . . . . . . . .  129 M633
      219   CR-18V0
      237   DELETE-COUNTER . . . . . . . .  361 397 412 414 503 M516 545 561 563
      192   DOTVALUE . . . . . . . . . . .  M377 M521
      243   DUMMY-HOLD . . . . . . . . . .  M427 437 M575 585
       78   DUMMY-RECORD . . . . . . . . .  M390 M393 M402 M409 M416 M422 M423 427 M428 429 M430 M431 M432 M433 M434 M435
                                            M436 M437 441 M442 M449 M464 M531 M532 M533 M534 M536 M537 M538 M540 M542 M551
                                            M558 M565 M570 M571 575 M576 577 M578 M579 M580 M581 M582 M583 M584 M585 589
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    17
0 Defined   Cross-reference of data names   References

0                                           M590 M599 M614
      290   ENDER-DESC . . . . . . . . . .  M404 M415 M421 M553 M564 M569
      110   EOF-FLAG . . . . . . . . . . .  M335
      238   ERROR-COUNTER. . . . . . . . .  360 M373 396 405 408 502 M515 544 554 557
      114   ERROR-FLAG
      242   ERROR-HOLD . . . . . . . . . .  359 M396 M397 M397 M398 400 501 M544 M545 M545 M546 549
      288   ERROR-TOTAL. . . . . . . . . .  M406 M408 M413 M414 M419 M420 M555 M557 M562 M563 M567 M568
      185   FEATURE. . . . . . . . . . . .  M643 M664 M689
      146   FILE-RECORD-INFO . . . . . . .  M492
      147   FILE-RECORD-INFO-P1-120
      174   FILE-RECORD-INFO-P121-240
      132   FILE-RECORD-INFO-SKELETON. . .  491
      131   FILE-RECORD-INFORMATION-REC
       98   GRP-0101
      100   GRP-0101-KEY
      103   GRP-0102
      105   GRP-0102-KEY
      316   HYPHEN-LINE. . . . . . . . . .  390 436 538 540 584
      282   ID-AGAIN . . . . . . . . . . .  M484
      315   INF-ANSI-REFERENCE . . . . . .  M447 M450 M463 M465 M597 M600 M613 M615
      310   INFO-TEXT. . . . . . . . . . .  M448 M598
      239   INSPECT-COUNTER. . . . . . . .  362 396 418 420 504 M513 544 566 568
       80   IX-FS3 . . . . . . . . . . . .  47 329 646 667 691 692 705
       92   IX-FS3-ALTER-KEY
       90   IX-FS3-KEY . . . . . . . . . .  51
       87   IX-FS3-REC-120
       88   IX-FS3-REC-120-240
      123   IX-FS3-STATUS. . . . . . . . .  52 341 344 M642 647 652 M663 668 673 M688 694 701
      124   IX-FS3-STAT1 . . . . . . . . .  334 337
      125   IX-FS3-STAT2
       86   IX-FS3R1-F-G-240
      159   ODO-NUMBER
      187   P-OR-F . . . . . . . . . . . .  M372 M373 380 M385 M513 M514 M515 M516 523 M526
      189   PAR-NAME . . . . . . . . . . .  M387 M528 M644 M665 M690
      191   PARDOT-X . . . . . . . . . . .  M376 M520
      240   PASS-COUNTER . . . . . . . . .  358 M372 398 399 500 M514 546 548
      116   PERM-ERRORS. . . . . . . . . .  M338
       74   PRINT-FILE . . . . . . . . . .  44 367 483 508
       76   PRINT-REC. . . . . . . . . . .  M378 M453 M455 M522 M603 M605
       58   RAW-DATA . . . . . . . . . . .  38 354 356 365 473 475 482 496 498 507
       61   RAW-DATA-KEY . . . . . . . . .  42 M355 M474 M497
       60   RAW-DATA-SATZ. . . . . . . . .  363 480 505
      194   RE-MARK. . . . . . . . . . . .  M346 M388 M517 M529 M650 M671 M696 M699
      236   REC-CT . . . . . . . . . . . .  375 377 387 519 521 528
      235   REC-SKL-SUB. . . . . . . . . .  M487 M490 492
      244   RECORD-COUNT . . . . . . . . .  M425 426 M438 M573 574 M586
      112   RECORDS-IN-ERROR
      169   RECORDS-IN-FILE. . . . . . . .  M629
      153   REELUNIT-NUMBER
      121   STATUS-TEST-READ
      118   STATUS-TEST-00 . . . . . . . .  M641
      120   STATUS-TEST-10 . . . . . . . .  333
      195   TEST-COMPUTED. . . . . . . . .  453 603
      210   TEST-CORRECT . . . . . . . . .  455 605
      263   TEST-ID. . . . . . . . . . . .  M484
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    18
0 Defined   Cross-reference of data names   References

0     322   TEST-NO. . . . . . . . . . . .  331 M622 M687
      183   TEST-RESULTS . . . . . . . . .  378 M485 522
      241   TOTAL-ERROR
      157   UPDATE-NUMBER
      108   WRK-CS-09V00
      167   XBLOCK-SIZE. . . . . . . . . .  M628
      149   XFILE-NAME . . . . . . . . . .  M623
      171   XFILE-ORGANIZATION . . . . . .  M630
      173   XLABEL-TYPE. . . . . . . . . .  M631
      161   XPROGRAM-NAME. . . . . . . . .  M625
      176   XRECORD-KEY
      163   XRECORD-LENGTH . . . . . . . .  M626
      151   XRECORD-NAME . . . . . . . . .  M624
      155   XRECORD-NUMBER . . . . . . . .  M632
      312   XXCOMPUTED . . . . . . . . . .  M462 M612
      314   XXCORRECT. . . . . . . . . . .  M462 M612
      307   XXINFO . . . . . . . . . . . .  449 464 599 614
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    19
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

      608   BAIL-OUT . . . . . . . . . . .  P525
      616   BAIL-OUT-EX. . . . . . . . . .  E525 G610
      611   BAIL-OUT-WRITE . . . . . . . .  G609
      591   BLANK-LINE-PRINT
      710   CCVS-EXIT
      493   CCVS-INIT-EXIT
      489   CCVS-INIT-FILE . . . . . . . .  P488
      711   CCVS-999999
      471   CCVS1
      617   CCVS1-EXIT . . . . . . . . . .  G494
      670   CLO-FAIL-GF-01-0
      662   CLO-INIT-GF-01-0
      676   CLO-PASS-GF-01-0 . . . . . . .  G669
      666   CLO-TEST-GF-01-0
      678   CLO-WRITE-GF-01-0. . . . . . .  G675
      495   CLOSE-FILES. . . . . . . . . .  G712
      535   COLUMN-NAMES-ROUTINE . . . . .  E486
      458   D-BAIL-OUT . . . . . . . . . .  P384
      466   D-BAIL-OUT-EX. . . . . . . . .  E384 G460
      461   D-BAIL-OUT-WRITE . . . . . . .  G459
      343   D-C-FAIL-GF-01-0
      349   D-C-PASS-GF-01-0 . . . . . . .  G342
      340   D-C-TEST-GF-01-1 . . . . . . .  G332
      351   D-C-WRITE-GF-01-0. . . . . . .  G348
      353   D-CLOSE-FILES
      364   D-END-E-2. . . . . . . . . . .  G356 G363
      389   D-END-ROUTINE. . . . . . . . .  P366
      395   D-END-ROUTINE-1
      403   D-END-ROUTINE-12
      411   D-END-ROUTINE-13 . . . . . . .  E366
      392   D-END-RTN-EXIT
      373   D-FAIL . . . . . . . . . . . .  P347
      443   D-FAIL-ROUTINE . . . . . . . .  P382
      457   D-FAIL-ROUTINE-EX. . . . . . .  E382 G451
      452   D-FAIL-ROUTINE-WRITE . . . . .  G445 G446
      372   D-PASS . . . . . . . . . . . .  P350
      374   D-PRINT-DETAIL . . . . . . . .  P352
      370   D-TERMINATE-CALL
      368   D-TERMINATE-CCVS
      424   D-WRITE-LINE . . . . . . . . .  P379 P381 P391 P394 P402 P410 P417 P422 P423 P449 P453 P455 P464
      440   D-WRT-LN . . . . . . . . . . .  P430 P431 P432 P433 P434 P435 P436 P439
      516   DE-LETE
      467   DECL-EXIT. . . . . . . . . . .  G339
      481   END-E-1. . . . . . . . . . . .  G475 G480
      506   END-E-2. . . . . . . . . . . .  G498 G505
      539   END-ROUTINE. . . . . . . . . .  P508
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    20
0 Defined   Cross-reference of procedures   References

0     543   END-ROUTINE-1
      552   END-ROUTINE-12
      560   END-ROUTINE-13 . . . . . . . .  E508
      541   END-RTN-EXIT
      515   FAIL . . . . . . . . . . . . .  P651 P672 P703
      593   FAIL-ROUTINE . . . . . . . . .  P524
      607   FAIL-ROUTINE-EX. . . . . . . .  E524 G601
      602   FAIL-ROUTINE-WRITE . . . . . .  G595 G596
      530   HEAD-ROUTINE . . . . . . . . .  P486
      330   INPUT-PROCESS
      513   INSPT
      472   OPEN-FILES
      649   OPN-FAIL-GF-01-0
      698   OPN-FAIL-GF-02-0
      640   OPN-INIT-GF-01-0
      655   OPN-PASS-GF-01-0 . . . . . . .  G648
      686   OPN-TEST-GF-02-0
      693   OPN-TEST-GF-02-1
      657   OPN-WRITE-GF-01-0. . . . . . .  G654
      700   OPN-WRITE-GF-02-0. . . . . . .  G697
      514   PASS . . . . . . . . . . . . .  P656 P677
      518   PRINT-DETAIL . . . . . . . . .  P658 P679 P704
      328   SECT-IX105-0002
      620   SECT-IX118A-0003
      621   SEQ-INIT-010
      511   TERMINATE-CALL
      509   TERMINATE-CCVS
      707   TERMINATE-ROUTINE
      572   WRITE-LINE . . . . . . . . . .  P522 P523 P531 P532 P533 P534 P536 P537 P538 P540 P542 P551 P559 P565 P570 P571
                                            P599 P603 P605 P614
      588   WRT-LN . . . . . . . . . . . .  P578 P579 P580 P581 P582 P583 P584 P587 P592
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    21
0 Defined   Cross-reference of programs     References

        3   IX118A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX118A    Date 06/04/2022  Time 12:00:18   Page    22
0LineID  Message code  Message text

     74  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     80  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     80  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX118A:
 *    Source records = 712
 *    Data Division statements = 120
 *    Procedure Division statements = 359
 *    Generated COBOL statements = 0
 *    Program complexity factor = 367
0End of compilation 1,  program IX118A,  highest severity 0.
0Return code 0
