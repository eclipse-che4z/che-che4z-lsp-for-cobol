1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:38   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:38   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1194.2
   000002         000200 PROGRAM-ID.                                                      IX1194.2
   000003         000300     IX119A.                                                      IX1194.2
   000004         000500*                                                              *  IX1194.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1194.2
   000006         000700*                                                              *  IX1194.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1194.2
   000008         000900*                                                              *  IX1194.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1194.2
   000010         001100*                                                              *  IX1194.2
   000011         001300*                                                                 IX1194.2
   000012         001400*    THIS ROUTINE USES THE MASS STORAGE FILE IX-FS3 CREATED IN    IX1194.2
   000013         001500*    IX113A.                                                      IX1194.2
   000014         001600*    THE FILE IS OPENED I-O AND THE STATUS CHECKED (00 EXPECTED), IX1194.2
   000015         001700*    THEN AN ATTEMPT IS MADE TO REWRITE A RECORD WITH THE WRONG   IX1194.2
   000016         001800*    PRIME RECORD KEY (STATUS 21 EXPECTED).  THEN AN ATTEMPT      IX1194.2
   000017         001900*    IS MADE TO DELETE A RECORD, AT WHICH POINT THE DECLARATIVES  IX1194.2
   000018         002000*    SHOULD BE ACTIONED AND THE FILE STATUS SHOULD BE 43 .        IX1194.2
   000019         002100*                                                                 IX1194.2
   000020         002200*    STANDARD REFERENCE IX-5, 1.3.4 (3) A                         IX1194.2
   000021         002300*    STANDARD REFERENCE IX-5, 1.3.4 (5) C                         IX1194.2
   000022         002400*                                                                 IX1194.2
   000023         002500*    X-CARDS USED IN THIS PROGRAM:                                IX1194.2
   000024         002600*                                                                 IX1194.2
   000025         002700*                 XXXXX024                                        IX1194.2
   000026         002800*                 XXXXX055.                                       IX1194.2
   000027         002900*         P       XXXXX062.                                       IX1194.2
   000028         003000*                 XXXXX082.                                       IX1194.2
   000029         003100*                 XXXXX083.                                       IX1194.2
   000030         003200*         C       XXXXX084                                        IX1194.2
   000031         003300*                                                                 IX1194.2
   000032         003400*                                                                 IX1194.2
   000033         003500 ENVIRONMENT DIVISION.                                            IX1194.2
   000034         003600 CONFIGURATION SECTION.                                           IX1194.2
   000035         003700 SOURCE-COMPUTER.                                                 IX1194.2
   000036         003800     XXXXX082.                                                    IX1194.2
   000037         003900 OBJECT-COMPUTER.                                                 IX1194.2
   000038         004000     XXXXX083.                                                    IX1194.2
   000039         004100 INPUT-OUTPUT SECTION.                                            IX1194.2
   000040         004200 FILE-CONTROL.                                                    IX1194.2
   000041         004300     SELECT RAW-DATA   ASSIGN TO                                  IX1194.2 61
   000042         004400     XXXXX062                                                     IX1194.2
   000043         004500            ORGANIZATION IS INDEXED                               IX1194.2
   000044         004600            ACCESS MODE IS RANDOM                                 IX1194.2
   000045         004700            RECORD KEY IS RAW-DATA-KEY.                           IX1194.2 64
   000046         004800*                                                                 IX1194.2
   000047         004900     SELECT PRINT-FILE ASSIGN TO                                  IX1194.2 77
   000048         005000     XXXXX055.                                                    IX1194.2
   000049         005100*                                                                 IX1194.2
   000050         005200     SELECT IX-FS3 ASSIGN                                         IX1194.2 83
   000051         005300     XXXXX024                                                     IX1194.2
   000052         005400     ORGANIZATION IS INDEXED                                      IX1194.2
   000053         005500     ACCESS MODE IS SEQUENTIAL                                    IX1194.2
   000054         005600     RECORD KEY IS IX-FS3-KEY                                     IX1194.2 93
   000055         005700     FILE STATUS IS IX-FS3-STATUS.                                IX1194.2 126
   000056         005800                                                                  IX1194.2
   000057         005900 DATA DIVISION.                                                   IX1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000                                                                  IX1194.2
   000059         006100 FILE SECTION.                                                    IX1194.2
   000060         006200                                                                  IX1194.2
   000061         006300 FD  RAW-DATA.                                                    IX1194.2
   000062         006400                                                                  IX1194.2
   000063         006500 01  RAW-DATA-SATZ.                                               IX1194.2
   000064         006600     05  RAW-DATA-KEY        PIC X(6).                            IX1194.2
   000065         006700     05  C-DATE              PIC 9(6).                            IX1194.2
   000066         006800     05  C-TIME              PIC 9(8).                            IX1194.2
   000067         006900     05  C-NO-OF-TESTS       PIC 99.                              IX1194.2
   000068         007000     05  C-OK                PIC 999.                             IX1194.2
   000069         007100     05  C-ALL               PIC 999.                             IX1194.2
   000070         007200     05  C-FAIL              PIC 999.                             IX1194.2
   000071         007300     05  C-DELETED           PIC 999.                             IX1194.2
   000072         007400     05  C-INSPECT           PIC 999.                             IX1194.2
   000073         007500     05  C-NOTE              PIC X(13).                           IX1194.2
   000074         007600     05  C-INDENT            PIC X.                               IX1194.2
   000075         007700     05  C-ABORT             PIC X(8).                            IX1194.2
   000076         007800                                                                  IX1194.2
   000077         007900 FD  PRINT-FILE.                                                  IX1194.2

 ==000077==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000078         008000                                                                  IX1194.2
   000079         008100 01  PRINT-REC               PIC X(120).                          IX1194.2
   000080         008200                                                                  IX1194.2
   000081         008300 01  DUMMY-RECORD            PIC X(120).                          IX1194.2
   000082         008400                                                                  IX1194.2
   000083         008500 FD  IX-FS3                                                       IX1194.2

 ==000083==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000083==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000084         008600        DATA RECORDS IX-FS3R1-F-G-240                             IX1194.2 *
   000085         008700        LABEL RECORD STANDARD                                     IX1194.2
   000086         008800        RECORD 240                                                IX1194.2
   000087         008900        BLOCK CONTAINS 2 RECORDS.                                 IX1194.2
   000088         009000                                                                  IX1194.2
   000089         009100 01  IX-FS3R1-F-G-240.                                            IX1194.2
   000090         009200     05  IX-FS3-REC-120      PIC X(120).                          IX1194.2
   000091         009300     05  IX-FS3-REC-120-240.                                      IX1194.2
   000092         009400         10  FILLER          PIC X(8).                            IX1194.2
   000093         009500         10  IX-FS3-KEY      PIC X(29).                           IX1194.2
   000094         009600         10  FILLER          PIC X(9).                            IX1194.2
   000095         009700         10  IX-FS3-ALTER-KEY  PIC X(29).                         IX1194.2
   000096         009800         10  FILLER            PIC X(45).                         IX1194.2
   000097         009900                                                                  IX1194.2
   000098         010000                                                                  IX1194.2
   000099         010100 WORKING-STORAGE SECTION.                                         IX1194.2
   000100         010200                                                                  IX1194.2
   000101         010300 01  GRP-0101.                                                    IX1194.2
   000102         010400     05  FILLER              PIC X(10) VALUE "RECORD-KEY".        IX1194.2
   000103         010500     05  GRP-0101-KEY        PIC 9(9)  VALUE ZERO.                IX1194.2 IMP
   000104         010600     05  FILLER              PIC X(10) VALUE "END-OF-KEY".        IX1194.2
   000105         010700                                                                  IX1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000106         010800 01  GRP-0102.                                                    IX1194.2
   000107         010900     05  FILLER              PIC X(10) VALUE "ALTERN-KEY".        IX1194.2
   000108         011000     05  GRP-0102-KEY        PIC 9(9)  VALUE ZERO.                IX1194.2 IMP
   000109         011100     05  FILLER              PIC X(10) VALUE "END-AL-KEY".        IX1194.2
   000110         011200                                                                  IX1194.2
   000111         011300 01  WRK-CS-09V00            PIC S9(9) COMP VALUE ZERO.           IX1194.2 IMP
   000112         011400                                                                  IX1194.2
   000113         011500 01  EOF-FLAG                PIC 9 VALUE ZERO.                    IX1194.2 IMP
   000114         011600                                                                  IX1194.2
   000115         011700 01  RECORDS-IN-ERROR        PIC S9(5) COMP VALUE ZERO.           IX1194.2 IMP
   000116         011800                                                                  IX1194.2
   000117         011900 01  ERROR-FLAG              PIC 9 VALUE ZERO.                    IX1194.2 IMP
   000118         012000                                                                  IX1194.2
   000119         012100 01  PERM-ERRORS             PIC S9(5) COMP VALUE ZERO.           IX1194.2 IMP
   000120         012200                                                                  IX1194.2
   000121         012300 01  STATUS-TEST-00          PIC 9 VALUE ZERO.                    IX1194.2 IMP
   000122         012400                                                                  IX1194.2
   000123         012500 01  STATUS-TEST-10          PIC 9 VALUE ZERO.                    IX1194.2 IMP
   000124         012600 01  STATUS-TEST-READ        PIC 9 VALUE ZERO.                    IX1194.2 IMP
   000125         012700                                                                  IX1194.2
   000126         012800 01  IX-FS3-STATUS.                                               IX1194.2
   000127         012900     05  IX-FS3-STAT1        PIC X.                               IX1194.2
   000128         013000     05  IX-FS3-STAT2        PIC X.                               IX1194.2
   000129         013100                                                                  IX1194.2
   000130         013200 01  COUNT-OF-RECS           PIC 9(5).                            IX1194.2
   000131         013300                                                                  IX1194.2
   000132         013400 01  COUNT-OF-RECORDS REDEFINES COUNT-OF-RECS  PIC 9(5).          IX1194.2 130
   000133         013500                                                                  IX1194.2
   000134         013600 01  FILE-RECORD-INFORMATION-REC.                                 IX1194.2
   000135         013700     05  FILE-RECORD-INFO-SKELETON.                               IX1194.2
   000136         013800         10  FILLER          PIC X(48) VALUE                      IX1194.2
   000137         013900              "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00". IX1194.2
   000138         014000         10  FILLER          PIC X(46) VALUE                      IX1194.2
   000139         014100                ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000". IX1194.2
   000140         014200         10  FILLER          PIC X(26) VALUE                      IX1194.2
   000141         014300                                    ",LFIL=000000,ORG=  ,LBLR= ". IX1194.2
   000142         014400         10  FILLER          PIC X(37) VALUE                      IX1194.2
   000143         014500                         ",RECKEY=                             ". IX1194.2
   000144         014600         10  FILLER          PIC X(38) VALUE                      IX1194.2
   000145         014700                        ",ALTKEY1=                             ". IX1194.2
   000146         014800         10  FILLER          PIC X(38) VALUE                      IX1194.2
   000147         014900                        ",ALTKEY2=                             ". IX1194.2
   000148         015000         10  FILLER          PIC X(7) VALUE SPACE.                IX1194.2 IMP
   000149         015100     05  FILE-RECORD-INFO             OCCURS 10.                  IX1194.2
   000150         015200         10  FILE-RECORD-INFO-P1-120.                             IX1194.2
   000151         015300             15  FILLER      PIC X(5).                            IX1194.2
   000152         015400             15  XFILE-NAME  PIC X(6).                            IX1194.2
   000153         015500             15  FILLER      PIC X(8).                            IX1194.2
   000154         015600             15  XRECORD-NAME  PIC X(6).                          IX1194.2
   000155         015700             15  FILLER        PIC X(1).                          IX1194.2
   000156         015800             15  REELUNIT-NUMBER  PIC 9(1).                       IX1194.2
   000157         015900             15  FILLER           PIC X(7).                       IX1194.2
   000158         016000             15  XRECORD-NUMBER   PIC 9(6).                       IX1194.2
   000159         016100             15  FILLER           PIC X(6).                       IX1194.2
   000160         016200             15  UPDATE-NUMBER    PIC 9(2).                       IX1194.2
   000161         016300             15  FILLER           PIC X(5).                       IX1194.2
   000162         016400             15  ODO-NUMBER       PIC 9(4).                       IX1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000163         016500             15  FILLER           PIC X(5).                       IX1194.2
   000164         016600             15  XPROGRAM-NAME    PIC X(5).                       IX1194.2
   000165         016700             15  FILLER           PIC X(7).                       IX1194.2
   000166         016800             15  XRECORD-LENGTH   PIC 9(6).                       IX1194.2
   000167         016900             15  FILLER           PIC X(7).                       IX1194.2
   000168         017000             15  CHARS-OR-RECORDS  PIC X(2).                      IX1194.2
   000169         017100             15  FILLER            PIC X(1).                      IX1194.2
   000170         017200             15  XBLOCK-SIZE       PIC 9(4).                      IX1194.2
   000171         017300             15  FILLER            PIC X(6).                      IX1194.2
   000172         017400             15  RECORDS-IN-FILE   PIC 9(6).                      IX1194.2
   000173         017500             15  FILLER            PIC X(5).                      IX1194.2
   000174         017600             15  XFILE-ORGANIZATION  PIC X(2).                    IX1194.2
   000175         017700             15  FILLER              PIC X(6).                    IX1194.2
   000176         017800             15  XLABEL-TYPE         PIC X(1).                    IX1194.2
   000177         017900         10  FILE-RECORD-INFO-P121-240.                           IX1194.2
   000178         018000             15  FILLER              PIC X(8).                    IX1194.2
   000179         018100             15  XRECORD-KEY         PIC X(29).                   IX1194.2
   000180         018200             15  FILLER              PIC X(9).                    IX1194.2
   000181         018300             15  ALTERNATE-KEY1      PIC X(29).                   IX1194.2
   000182         018400             15  FILLER              PIC X(9).                    IX1194.2
   000183         018500             15  ALTERNATE-KEY2      PIC X(29).                   IX1194.2
   000184         018600             15  FILLER              PIC X(7).                    IX1194.2
   000185         018700                                                                  IX1194.2
   000186         018800 01  TEST-RESULTS.                                                IX1194.2
   000187         018900     02 FILLER                   PIC X      VALUE SPACE.          IX1194.2 IMP
   000188         019000     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1194.2 IMP
   000189         019100     02 FILLER                   PIC X      VALUE SPACE.          IX1194.2 IMP
   000190         019200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1194.2 IMP
   000191         019300     02 FILLER                   PIC X      VALUE SPACE.          IX1194.2 IMP
   000192         019400     02  PAR-NAME.                                                IX1194.2
   000193         019500       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1194.2 IMP
   000194         019600       03  PARDOT-X              PIC X      VALUE SPACE.          IX1194.2 IMP
   000195         019700       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1194.2 IMP
   000196         019800     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1194.2 IMP
   000197         019900     02 RE-MARK                  PIC X(61).                       IX1194.2
   000198         020000 01  TEST-COMPUTED.                                               IX1194.2
   000199         020100     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1194.2 IMP
   000200         020200     02 FILLER                   PIC X(17)  VALUE                 IX1194.2
   000201         020300            "       COMPUTED=".                                   IX1194.2
   000202         020400     02 COMPUTED-X.                                               IX1194.2
   000203         020500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1194.2 IMP
   000204         020600     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1194.2 203
   000205         020700                                 PIC -9(9).9(9).                  IX1194.2
   000206         020800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1194.2 203
   000207         020900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1194.2 203
   000208         021000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1194.2 203
   000209         021100     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1194.2 203
   000210         021200         04 COMPUTED-18V0                    PIC -9(18).          IX1194.2
   000211         021300         04 FILLER                           PIC X.               IX1194.2
   000212         021400     03 FILLER PIC X(50) VALUE SPACE.                             IX1194.2 IMP
   000213         021500 01  TEST-CORRECT.                                                IX1194.2
   000214         021600     02 FILLER PIC X(30) VALUE SPACE.                             IX1194.2 IMP
   000215         021700     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1194.2
   000216         021800     02 CORRECT-X.                                                IX1194.2
   000217         021900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1194.2 IMP
   000218         022000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1194.2 217
   000219         022100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1194.2 217
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000220         022200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1194.2 217
   000221         022300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1194.2 217
   000222         022400     03      CR-18V0 REDEFINES CORRECT-A.                         IX1194.2 217
   000223         022500         04 CORRECT-18V0                     PIC -9(18).          IX1194.2
   000224         022600         04 FILLER                           PIC X.               IX1194.2
   000225         022700     03 FILLER PIC X(2) VALUE SPACE.                              IX1194.2 IMP
   000226         022800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1194.2 IMP
   000227         022900 01  CCVS-C-1.                                                    IX1194.2
   000228         023000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1194.2
   000229         023100-    "SS  PARAGRAPH-NAME                                          IX1194.2
   000230         023200-    "       REMARKS".                                            IX1194.2
   000231         023300     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1194.2 IMP
   000232         023400 01  CCVS-C-2.                                                    IX1194.2
   000233         023500     02 FILLER                     PIC X        VALUE SPACE.      IX1194.2 IMP
   000234         023600     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1194.2
   000235         023700     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1194.2 IMP
   000236         023800     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1194.2
   000237         023900     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1194.2 IMP
   000238         024000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1194.2 IMP
   000239         024100 01  REC-CT                        PIC 99       VALUE ZERO.       IX1194.2 IMP
   000240         024200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1194.2 IMP
   000241         024300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1194.2 IMP
   000242         024400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1194.2 IMP
   000243         024500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1194.2 IMP
   000244         024600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1194.2 IMP
   000245         024700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1194.2 IMP
   000246         024800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1194.2 IMP
   000247         024900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1194.2 IMP
   000248         025000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1194.2 IMP
   000249         025100 01  CCVS-H-1.                                                    IX1194.2
   000250         025200     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1194.2 IMP
   000251         025300     02  FILLER                    PIC X(42)    VALUE             IX1194.2
   000252         025400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1194.2
   000253         025500     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1194.2 IMP
   000254         025600 01  CCVS-H-2A.                                                   IX1194.2
   000255         025700   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1194.2 IMP
   000256         025800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1194.2
   000257         025900   02  FILLER                        PIC XXXX   VALUE             IX1194.2
   000258         026000     "4.2 ".                                                      IX1194.2
   000259         026100   02  FILLER                        PIC X(28)  VALUE             IX1194.2
   000260         026200            " COPY - NOT FOR DISTRIBUTION".                       IX1194.2
   000261         026300   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1194.2 IMP
   000262         026400                                                                  IX1194.2
   000263         026500 01  CCVS-H-2B.                                                   IX1194.2
   000264         026600   02  FILLER                        PIC X(15)  VALUE             IX1194.2
   000265         026700            "TEST RESULT OF ".                                    IX1194.2
   000266         026800   02  TEST-ID                       PIC X(9).                    IX1194.2
   000267         026900   02  FILLER                        PIC X(4)   VALUE             IX1194.2
   000268         027000            " IN ".                                               IX1194.2
   000269         027100   02  FILLER                        PIC X(12)  VALUE             IX1194.2
   000270         027200     " HIGH       ".                                              IX1194.2
   000271         027300   02  FILLER                        PIC X(22)  VALUE             IX1194.2
   000272         027400            " LEVEL VALIDATION FOR ".                             IX1194.2
   000273         027500   02  FILLER                        PIC X(58)  VALUE             IX1194.2
   000274         027600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1194.2
   000275         027700 01  CCVS-H-3.                                                    IX1194.2
   000276         027800     02  FILLER                      PIC X(34)  VALUE             IX1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000277         027900            " FOR OFFICIAL USE ONLY    ".                         IX1194.2
   000278         028000     02  FILLER                      PIC X(58)  VALUE             IX1194.2
   000279         028100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1194.2
   000280         028200     02  FILLER                      PIC X(28)  VALUE             IX1194.2
   000281         028300            "  COPYRIGHT   1985 ".                                IX1194.2
   000282         028400 01  CCVS-E-1.                                                    IX1194.2
   000283         028500     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1194.2 IMP
   000284         028600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1194.2
   000285         028700     02 ID-AGAIN                     PIC X(9).                    IX1194.2
   000286         028800     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1194.2 IMP
   000287         028900 01  CCVS-E-2.                                                    IX1194.2
   000288         029000     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1194.2 IMP
   000289         029100     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1194.2 IMP
   000290         029200     02 CCVS-E-2-2.                                               IX1194.2
   000291         029300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1194.2 IMP
   000292         029400         03 FILLER                   PIC X      VALUE SPACE.      IX1194.2 IMP
   000293         029500         03 ENDER-DESC               PIC X(44)  VALUE             IX1194.2
   000294         029600            "ERRORS ENCOUNTERED".                                 IX1194.2
   000295         029700 01  CCVS-E-3.                                                    IX1194.2
   000296         029800     02  FILLER                      PIC X(22)  VALUE             IX1194.2
   000297         029900            " FOR OFFICIAL USE ONLY".                             IX1194.2
   000298         030000     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1194.2 IMP
   000299         030100     02  FILLER                      PIC X(58)  VALUE             IX1194.2
   000300         030200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1194.2
   000301         030300     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1194.2 IMP
   000302         030400     02 FILLER                       PIC X(15)  VALUE             IX1194.2
   000303         030500             " COPYRIGHT 1985".                                   IX1194.2
   000304         030600 01  CCVS-E-4.                                                    IX1194.2
   000305         030700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1194.2 IMP
   000306         030800     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1194.2
   000307         030900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1194.2 IMP
   000308         031000     02 FILLER                       PIC X(40)  VALUE             IX1194.2
   000309         031100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1194.2
   000310         031200 01  XXINFO.                                                      IX1194.2
   000311         031300     02 FILLER                       PIC X(19)  VALUE             IX1194.2
   000312         031400            "*** INFORMATION ***".                                IX1194.2
   000313         031500     02 INFO-TEXT.                                                IX1194.2
   000314         031600       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1194.2 IMP
   000315         031700       04 XXCOMPUTED                 PIC X(20).                   IX1194.2
   000316         031800       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1194.2 IMP
   000317         031900       04 XXCORRECT                  PIC X(20).                   IX1194.2
   000318         032000     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1194.2
   000319         032100 01  HYPHEN-LINE.                                                 IX1194.2
   000320         032200     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1194.2 IMP
   000321         032300     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1194.2
   000322         032400-    "*****************************************".                 IX1194.2
   000323         032500     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1194.2
   000324         032600-    "******************************".                            IX1194.2
   000325         032700 01  TEST-NO                         PIC 99.                      IX1194.2
   000326         032800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1194.2
   000327         032900     "IX119A".                                                    IX1194.2
   000328         033000 PROCEDURE DIVISION.                                              IX1194.2
   000329         033100 DECLARATIVES.                                                    IX1194.2
   000330         033200                                                                  IX1194.2
   000331         033300 SECT-IX105-0002 SECTION.                                         IX1194.2
   000332         033400     USE AFTER EXCEPTION PROCEDURE ON IX-FS3.                     IX1194.2 83
   000333         033500 INPUT-PROCESS.                                                   IX1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000334         033600     IF TEST-NO = 5                                               IX1194.2 325
   000335      1  033700        GO TO D-C-TEST-GF-01-1.                                   IX1194.2 343
   000336         033800     IF STATUS-TEST-10 EQUAL TO 1                                 IX1194.2 123
   000337      1  033900        IF  IX-FS3-STAT1 EQUAL TO "1"                             IX1194.2 127
   000338      2  034000            MOVE 1 TO EOF-FLAG                                    IX1194.2 113
   000339      1  034100        ELSE                                                      IX1194.2
   000340      2  034200           IF  IX-FS3-STAT1 GREATER THAN "1"                      IX1194.2 127
   000341      3  034300           MOVE 1 TO PERM-ERRORS.                                 IX1194.2 119
   000342         034400     GO TO DECL-EXIT.                                             IX1194.2 471
   000343         034500 D-C-TEST-GF-01-1.                                                IX1194.2
   000344         034600     IF IX-FS3-STATUS EQUAL TO "43"                               IX1194.2 126
   000345      1  034700         GO TO D-C-PASS-GF-01-0.                                  IX1194.2 352
   000346         034800 D-C-FAIL-GF-01-0.                                                IX1194.2
   000347         034900     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1194.2 126 203
   000348         035000     MOVE "43" TO CORRECT-X.                                      IX1194.2 216
   000349         035100     MOVE "IX-5, 1.3.4, (5) C" TO RE-MARK.                        IX1194.2 197
   000350         035200     PERFORM D-FAIL.                                              IX1194.2 377
   000351         035300     GO TO D-C-WRITE-GF-01-0.                                     IX1194.2 354
   000352         035400 D-C-PASS-GF-01-0.                                                IX1194.2
   000353         035500     PERFORM D-PASS.                                              IX1194.2 376
   000354         035600 D-C-WRITE-GF-01-0.                                               IX1194.2
   000355         035700     PERFORM D-PRINT-DETAIL.                                      IX1194.2 378
   000356         035800 D-CLOSE-FILES.                                                   IX1194.2
   000357         035900     CLOSE IX-FS3.                                                IX1194.2 83
   000358         036000     OPEN I-O RAW-DATA.                                           IX1194.2 61
   000359         036100     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1194.2 326 64
   000360         036200     READ RAW-DATA INVALID KEY GO TO D-END-E-2.                   IX1194.2 61 368
   000361         036300     MOVE "OK.     " TO C-ABORT.                                  IX1194.2 75
   000362         036400     MOVE PASS-COUNTER TO C-OK.                                   IX1194.2 243 68
   000363         036500     MOVE ERROR-HOLD   TO C-ALL.                                  IX1194.2 245 69
   000364         036600     MOVE ERROR-COUNTER TO C-FAIL.                                IX1194.2 241 70
   000365         036700     MOVE DELETE-COUNTER TO C-DELETED.                            IX1194.2 240 71
   000366         036800     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1194.2 242 72
   000367         036900     REWRITE RAW-DATA-SATZ INVALID KEY GO TO D-END-E-2.           IX1194.2 63 368
   000368         037000 D-END-E-2.                                                       IX1194.2
   000369         037100     CLOSE RAW-DATA.                                              IX1194.2 61
   000370         037200     PERFORM D-END-ROUTINE THRU D-END-ROUTINE-13.                 IX1194.2 393 415
   000371         037300     CLOSE PRINT-FILE.                                            IX1194.2 77
   000372         037400 D-TERMINATE-CCVS.                                                IX1194.2
   000373         037500     EXIT PROGRAM.                                                IX1194.2
   000374         037600 D-TERMINATE-CALL.                                                IX1194.2
   000375         037700     STOP     RUN.                                                IX1194.2
   000376         037800 D-PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.         IX1194.2 190 243
   000377         037900 D-FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.        IX1194.2 190 241
   000378         038000 D-PRINT-DETAIL.                                                  IX1194.2
   000379         038100     IF   REC-CT NOT EQUAL TO ZERO                                IX1194.2 239 IMP
   000380      1  038200          MOVE "." TO PARDOT-X                                    IX1194.2 194
   000381      1  038300          MOVE REC-CT TO DOTVALUE.                                IX1194.2 239 195
   000382         038400     MOVE TEST-RESULTS TO PRINT-REC.                              IX1194.2 186 79
   000383         038500     PERFORM D-WRITE-LINE.                                        IX1194.2 428
   000384         038600     IF   P-OR-F EQUAL TO "FAIL*"                                 IX1194.2 190
   000385      1  038700          PERFORM D-WRITE-LINE                                    IX1194.2 428
   000386      1  038800          PERFORM D-FAIL-ROUTINE THRU D-FAIL-ROUTINE-EX           IX1194.2 447 461
   000387         038900     ELSE                                                         IX1194.2
   000388      1  039000          PERFORM D-BAIL-OUT THRU D-BAIL-OUT-EX.                  IX1194.2 462 470
   000389         039100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1194.2 IMP 190 IMP 202
   000390         039200     MOVE SPACE TO CORRECT-X.                                     IX1194.2 IMP 216
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000391         039300     IF   REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.           IX1194.2 239 IMP IMP 192
   000392         039400     MOVE SPACE TO RE-MARK.                                       IX1194.2 IMP 197
   000393         039500 D-END-ROUTINE.                                                   IX1194.2
   000394         039600     MOVE HYPHEN-LINE TO DUMMY-RECORD.                            IX1194.2 319 81
   000395         039700     PERFORM D-WRITE-LINE 5 TIMES.                                IX1194.2 428
   000396         039800 D-END-RTN-EXIT.                                                  IX1194.2
   000397         039900     MOVE CCVS-E-1 TO DUMMY-RECORD.                               IX1194.2 282 81
   000398         040000     PERFORM D-WRITE-LINE 2 TIMES.                                IX1194.2 428
   000399         040100 D-END-ROUTINE-1.                                                 IX1194.2
   000400         040200     ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO       IX1194.2 241 245 242
   000401         040300     ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.                IX1194.2 245 240 245
   000402         040400     ADD PASS-COUNTER TO ERROR-HOLD.                              IX1194.2 243 245
   000403         040500     MOVE PASS-COUNTER TO CCVS-E-4-1.                             IX1194.2 243 305
   000404         040600     MOVE ERROR-HOLD TO CCVS-E-4-2.                               IX1194.2 245 307
   000405         040700     MOVE CCVS-E-4 TO CCVS-E-2-2.                                 IX1194.2 304 290
   000406         040800     MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM D-WRITE-LINE.          IX1194.2 287 81 428
   000407         040900  D-END-ROUTINE-12.                                               IX1194.2
   000408         041000     MOVE "TEST(S) FAILED" TO ENDER-DESC.                         IX1194.2 293
   000409         041100     IF  ERROR-COUNTER IS EQUAL TO ZERO                           IX1194.2 241 IMP
   000410      1  041200         MOVE "NO " TO ERROR-TOTAL                                IX1194.2 291
   000411         041300     ELSE                                                         IX1194.2
   000412      1  041400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1194.2 241 291
   000413         041500     MOVE    CCVS-E-2 TO DUMMY-RECORD.                            IX1194.2 287 81
   000414         041600     PERFORM D-WRITE-LINE.                                        IX1194.2 428
   000415         041700 D-END-ROUTINE-13.                                                IX1194.2
   000416         041800     IF  DELETE-COUNTER IS EQUAL TO ZERO                          IX1194.2 240 IMP
   000417      1  041900         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1194.2 291
   000418      1  042000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1194.2 240 291
   000419         042100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1194.2 293
   000420         042200     MOVE CCVS-E-2 TO DUMMY-RECORD.                               IX1194.2 287 81
   000421         042300     PERFORM D-WRITE-LINE.                                        IX1194.2 428
   000422         042400     IF   INSPECT-COUNTER EQUAL TO ZERO                           IX1194.2 242 IMP
   000423      1  042500          MOVE "NO " TO ERROR-TOTAL                               IX1194.2 291
   000424      1  042600     ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                    IX1194.2 242 291
   000425         042700     MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.             IX1194.2 293
   000426         042800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1194.2 287 81 428
   000427         042900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1194.2 295 81 428
   000428         043000 D-WRITE-LINE.                                                    IX1194.2
   000429         043100     ADD 1 TO RECORD-COUNT.                                       IX1194.2 247
   000430         043200     IF RECORD-COUNT GREATER 42                                   IX1194.2 247
   000431      1  043300        MOVE DUMMY-RECORD TO DUMMY-HOLD                           IX1194.2 81 246
   000432      1  043400        MOVE SPACE TO DUMMY-RECORD                                IX1194.2 IMP 81
   000433      1  043500        WRITE DUMMY-RECORD AFTER ADVANCING PAGE                   IX1194.2 81
   000434      1  043600        MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1194.2 249 81 444
   000435      1  043700        MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1194.2 254 81 444
   000436      1  043800        MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1194.2 263 81 444
   000437      1  043900        MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1194.2 275 81 444
   000438      1  044000        MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1194.2 227 81 444
   000439      1  044100        MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1194.2 232 81 444
   000440      1  044200        MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM D-WRT-LN         IX1194.2 319 81 444
   000441      1  044300        MOVE DUMMY-HOLD TO DUMMY-RECORD                           IX1194.2 246 81
   000442      1  044400        MOVE ZERO TO RECORD-COUNT.                                IX1194.2 IMP 247
   000443         044500     PERFORM D-WRT-LN.                                            IX1194.2 444
   000444         044600 D-WRT-LN.                                                        IX1194.2
   000445         044700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1194.2 81
   000446         044800     MOVE SPACE TO DUMMY-RECORD.                                  IX1194.2 IMP 81
   000447         044900 D-FAIL-ROUTINE.                                                  IX1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448         045000     IF   COMPUTED-X NOT EQUAL TO SPACE                           IX1194.2 202 IMP
   000449      1  045100          GO TO D-FAIL-ROUTINE-WRITE.                             IX1194.2 456
   000450         045200     IF   CORRECT-X NOT EQUAL TO SPACE GO TO D-FAIL-ROUTINE-WRITE.IX1194.2 216 IMP 456
   000451         045300     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1194.2 248 318
   000452         045400     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    IX1194.2 313
   000453         045500     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1194.2 310 81 428
   000454         045600     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1194.2 IMP 318
   000455         045700     GO TO D-FAIL-ROUTINE-EX.                                     IX1194.2 461
   000456         045800 D-FAIL-ROUTINE-WRITE.                                            IX1194.2
   000457         045900     MOVE TEST-COMPUTED TO PRINT-REC PERFORM D-WRITE-LINE         IX1194.2 198 79 428
   000458         046000     MOVE ANSI-REFERENCE TO COR-ANSI-REFERENCE.                   IX1194.2 248 226
   000459         046100     MOVE TEST-CORRECT TO PRINT-REC PERFORM D-WRITE-LINE 2 TIMES. IX1194.2 213 79 428
   000460         046200     MOVE SPACES TO COR-ANSI-REFERENCE.                           IX1194.2 IMP 226
   000461         046300 D-FAIL-ROUTINE-EX. EXIT.                                         IX1194.2
   000462         046400 D-BAIL-OUT.                                                      IX1194.2
   000463         046500     IF  COMPUTED-A NOT EQUAL TO SPACE GO TO D-BAIL-OUT-WRITE.    IX1194.2 203 IMP 465
   000464         046600     IF  CORRECT-A EQUAL TO SPACE GO TO D-BAIL-OUT-EX.            IX1194.2 217 IMP 470
   000465         046700 D-BAIL-OUT-WRITE.                                                IX1194.2
   000466         046800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1194.2 217 317 203 315
   000467         046900     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1194.2 248 318
   000468         047000     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1194.2 310 81 428
   000469         047100     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1194.2 IMP 318
   000470         047200 D-BAIL-OUT-EX. EXIT.                                             IX1194.2
   000471         047300 DECL-EXIT.  EXIT.                                                IX1194.2
   000472         047400 END DECLARATIVES.                                                IX1194.2
   000473         047500                                                                  IX1194.2
   000474         047600                                                                  IX1194.2
   000475         047700 CCVS1 SECTION.                                                   IX1194.2
   000476         047800 OPEN-FILES.                                                      IX1194.2
   000477         047900     OPEN I-O RAW-DATA.                                           IX1194.2 61
   000478         048000     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1194.2 326 64
   000479         048100     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1194.2 61 485
   000480         048200     MOVE "ABORTED " TO C-ABORT.                                  IX1194.2 75
   000481         048300     ADD 1 TO C-NO-OF-TESTS.                                      IX1194.2 67
   000482         048400     ACCEPT C-DATE  FROM DATE.                                    IX1194.2 65
   000483         048500     ACCEPT C-TIME  FROM TIME.                                    IX1194.2 66
   000484         048600     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1194.2 63 485
   000485         048700 END-E-1.                                                         IX1194.2
   000486         048800     CLOSE RAW-DATA.                                              IX1194.2 61
   000487         048900     OPEN    OUTPUT PRINT-FILE.                                   IX1194.2 77
   000488         049000     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1194.2 326 266 326 285
   000489         049100     MOVE    SPACE TO TEST-RESULTS.                               IX1194.2 IMP 186
   000490         049200     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1194.2 534 539
   000491         049300     MOVE    ZERO TO REC-SKL-SUB.                                 IX1194.2 IMP 238
   000492         049400     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1194.2 493
   000493         049500 CCVS-INIT-FILE.                                                  IX1194.2
   000494         049600     ADD     1 TO REC-SKL-SUB.                                    IX1194.2 238
   000495         049700     MOVE    FILE-RECORD-INFO-SKELETON                            IX1194.2 135
   000496         049800          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1194.2 149 238
   000497         049900 CCVS-INIT-EXIT.                                                  IX1194.2
   000498         050000     GO TO CCVS1-EXIT.                                            IX1194.2 621
   000499         050100 CLOSE-FILES.                                                     IX1194.2
   000500         050200     OPEN I-O RAW-DATA.                                           IX1194.2 61
   000501         050300     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1194.2 326 64
   000502         050400     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1194.2 61 510
   000503         050500     MOVE "OK.     " TO C-ABORT.                                  IX1194.2 75
   000504         050600     MOVE PASS-COUNTER TO C-OK.                                   IX1194.2 243 68
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000505         050700     MOVE ERROR-HOLD   TO C-ALL.                                  IX1194.2 245 69
   000506         050800     MOVE ERROR-COUNTER TO C-FAIL.                                IX1194.2 241 70
   000507         050900     MOVE DELETE-COUNTER TO C-DELETED.                            IX1194.2 240 71
   000508         051000     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1194.2 242 72
   000509         051100     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1194.2 63 510
   000510         051200 END-E-2.                                                         IX1194.2
   000511         051300     CLOSE RAW-DATA.                                              IX1194.2 61
   000512         051400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1194.2 543 564 77
   000513         051500 TERMINATE-CCVS.                                                  IX1194.2
   000514         051600     EXIT PROGRAM.                                                IX1194.2
   000515         051700 TERMINATE-CALL.                                                  IX1194.2
   000516         051800     STOP     RUN.                                                IX1194.2
   000517         051900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1194.2 190 242
   000518         052000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1194.2 190 243
   000519         052100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1194.2 190 241
   000520         052200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1194.2 190 240
   000521         052300     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1194.2 197
   000522         052400 PRINT-DETAIL.                                                    IX1194.2
   000523         052500     IF REC-CT NOT EQUAL TO ZERO                                  IX1194.2 239 IMP
   000524      1  052600             MOVE "." TO PARDOT-X                                 IX1194.2 194
   000525      1  052700             MOVE REC-CT TO DOTVALUE.                             IX1194.2 239 195
   000526         052800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1194.2 186 79 576
   000527         052900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1194.2 190 576
   000528      1  053000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1194.2 597 611
   000529      1  053100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1194.2 612 620
   000530         053200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1194.2 IMP 190 IMP 202
   000531         053300     MOVE SPACE TO CORRECT-X.                                     IX1194.2 IMP 216
   000532         053400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1194.2 239 IMP IMP 192
   000533         053500     MOVE     SPACE TO RE-MARK.                                   IX1194.2 IMP 197
   000534         053600 HEAD-ROUTINE.                                                    IX1194.2
   000535         053700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1194.2 249 81 576
   000536         053800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1194.2 254 81 576
   000537         053900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1194.2 263 81 576
   000538         054000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1194.2 275 81 576
   000539         054100 COLUMN-NAMES-ROUTINE.                                            IX1194.2
   000540         054200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1194.2 227 81 576
   000541         054300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1194.2 232 81 576
   000542         054400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1194.2 319 81 576
   000543         054500 END-ROUTINE.                                                     IX1194.2
   000544         054600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1194.2 319 81 576
   000545         054700 END-RTN-EXIT.                                                    IX1194.2
   000546         054800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1194.2 282 81 576
   000547         054900 END-ROUTINE-1.                                                   IX1194.2
   000548         055000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1194.2 241 245 242
   000549         055100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1194.2 245 240 245
   000550         055200      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1194.2 243 245
   000551         055300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1194.2
   000552         055400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1194.2 243 305
   000553         055500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1194.2 245 307
   000554         055600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1194.2 304 290
   000555         055700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1194.2 287 81 576
   000556         055800  END-ROUTINE-12.                                                 IX1194.2
   000557         055900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1194.2 293
   000558         056000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1194.2 241 IMP
   000559      1  056100         MOVE "NO " TO ERROR-TOTAL                                IX1194.2 291
   000560         056200         ELSE                                                     IX1194.2
   000561      1  056300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1194.2 241 291
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000562         056400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1194.2 287 81
   000563         056500     PERFORM WRITE-LINE.                                          IX1194.2 576
   000564         056600 END-ROUTINE-13.                                                  IX1194.2
   000565         056700     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1194.2 240 IMP
   000566      1  056800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1194.2 291
   000567      1  056900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1194.2 240 291
   000568         057000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1194.2 293
   000569         057100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1194.2 287 81 576
   000570         057200      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1194.2 242 IMP
   000571      1  057300          MOVE "NO " TO ERROR-TOTAL                               IX1194.2 291
   000572      1  057400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1194.2 242 291
   000573         057500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1194.2 293
   000574         057600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1194.2 287 81 576
   000575         057700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1194.2 295 81 576
   000576         057800 WRITE-LINE.                                                      IX1194.2
   000577         057900     ADD 1 TO RECORD-COUNT.                                       IX1194.2 247
   000578         058000     IF RECORD-COUNT GREATER 42                                   IX1194.2 247
   000579      1  058100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1194.2 81 246
   000580      1  058200         MOVE SPACE TO DUMMY-RECORD                               IX1194.2 IMP 81
   000581      1  058300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1194.2 81
   000582      1  058400         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1194.2 249 81 592
   000583      1  058500         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1194.2 254 81 592
   000584      1  058600         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1194.2 263 81 592
   000585      1  058700         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1194.2 275 81 592
   000586      1  058800         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1194.2 227 81 592
   000587      1  058900         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1194.2 232 81 592
   000588      1  059000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1194.2 319 81 592
   000589      1  059100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1194.2 246 81
   000590      1  059200         MOVE ZERO TO RECORD-COUNT.                               IX1194.2 IMP 247
   000591         059300     PERFORM WRT-LN.                                              IX1194.2 592
   000592         059400 WRT-LN.                                                          IX1194.2
   000593         059500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1194.2 81
   000594         059600     MOVE SPACE TO DUMMY-RECORD.                                  IX1194.2 IMP 81
   000595         059700 BLANK-LINE-PRINT.                                                IX1194.2
   000596         059800     PERFORM WRT-LN.                                              IX1194.2 592
   000597         059900 FAIL-ROUTINE.                                                    IX1194.2
   000598         060000     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1194.2 202 IMP
   000599      1  060100            GO TO   FAIL-ROUTINE-WRITE.                           IX1194.2 606
   000600         060200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1194.2 216 IMP 606
   000601         060300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1194.2 248 318
   000602         060400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1194.2 313
   000603         060500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1194.2 310 81 576
   000604         060600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1194.2 IMP 318
   000605         060700     GO TO  FAIL-ROUTINE-EX.                                      IX1194.2 611
   000606         060800 FAIL-ROUTINE-WRITE.                                              IX1194.2
   000607         060900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1194.2 198 79 576
   000608         061000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1194.2 248 226
   000609         061100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1194.2 213 79 576
   000610         061200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1194.2 IMP 226
   000611         061300 FAIL-ROUTINE-EX. EXIT.                                           IX1194.2
   000612         061400 BAIL-OUT.                                                        IX1194.2
   000613         061500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1194.2 203 IMP 615
   000614         061600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1194.2 217 IMP 620
   000615         061700 BAIL-OUT-WRITE.                                                  IX1194.2
   000616         061800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1194.2 217 317 203 315
   000617         061900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1194.2 248 318
   000618         062000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1194.2 310 81 576
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000619         062100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1194.2 IMP 318
   000620         062200 BAIL-OUT-EX. EXIT.                                               IX1194.2
   000621         062300 CCVS1-EXIT.                                                      IX1194.2
   000622         062400     EXIT.                                                        IX1194.2
   000623         062500                                                                  IX1194.2
   000624         062600 SECT-IX119A-0003 SECTION.                                        IX1194.2
   000625         062700 SEQ-INIT-010.                                                    IX1194.2
   000626         062800     MOVE ZERO TO TEST-NO.                                        IX1194.2 IMP 325
   000627         062900     MOVE "IX-FS3" TO XFILE-NAME (1).                             IX1194.2 152
   000628         063000     MOVE "R1-F-G" TO XRECORD-NAME (1).                           IX1194.2 154
   000629         063100     MOVE CCVS-PGM-ID TO XPROGRAM-NAME (1).                       IX1194.2 326 164
   000630         063200     MOVE 000240 TO XRECORD-LENGTH (1).                           IX1194.2 166
   000631         063300     MOVE "RC" TO CHARS-OR-RECORDS (1).                           IX1194.2 168
   000632         063400     MOVE 0002 TO XBLOCK-SIZE (1).                                IX1194.2 170
   000633         063500     MOVE 000050 TO RECORDS-IN-FILE (1).                          IX1194.2 172
   000634         063600     MOVE "IX" TO XFILE-ORGANIZATION (1).                         IX1194.2 174
   000635         063700     MOVE "S" TO XLABEL-TYPE (1).                                 IX1194.2 176
   000636         063800     MOVE 000001 TO XRECORD-NUMBER (1).                           IX1194.2 158
   000637         063900     MOVE 0 TO COUNT-OF-RECS.                                     IX1194.2 130
   000638         064000                                                                  IX1194.2
   000639         064200*   TEST  1                                                      *IX1194.2
   000640         064300*         OPEN OUTPUT ...                 00 EXPECTED            *IX1194.2
   000641         064400*         IX-3, 1.3.4 (1) A                                      *IX1194.2
   000642         064500*    STATUS 00 CHECK ON OUTPUT FILE IX-FS3                       *IX1194.2
   000643         064600*    THE OUTPUT STATEMENT IS SUCCESSFULLY EXECUTED               *IX1194.2
   000644         064800 OPN-INIT-GF-01-0.                                                IX1194.2
   000645         064900     MOVE 1 TO STATUS-TEST-00.                                    IX1194.2 121
   000646         065000     MOVE SPACES TO IX-FS3-STATUS.                                IX1194.2 IMP 126
   000647         065100     MOVE "OPEN I-O   : 00 EXP." TO FEATURE.                      IX1194.2 188
   000648         065200     MOVE "OPN-TEST-GF-01-0" TO PAR-NAME.                         IX1194.2 192
   000649         065300     OPEN                                                         IX1194.2
   000650         065400        I-O    IX-FS3.                                            IX1194.2 83
   000651         065500     IF IX-FS3-STATUS EQUAL TO "00"                               IX1194.2 126
   000652      1  065600         GO TO OPN-PASS-GF-01-0.                                  IX1194.2 659
   000653         065700 OPN-FAIL-GF-01-0.                                                IX1194.2
   000654         065800     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1194.2 197
   000655         065900     PERFORM FAIL.                                                IX1194.2 519
   000656         066000     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1194.2 126 203
   000657         066100     MOVE "00" TO CORRECT-X.                                      IX1194.2 216
   000658         066200     GO TO OPN-WRITE-GF-01-0.                                     IX1194.2 661
   000659         066300 OPN-PASS-GF-01-0.                                                IX1194.2
   000660         066400     PERFORM PASS.                                                IX1194.2 518
   000661         066500 OPN-WRITE-GF-01-0.                                               IX1194.2
   000662         066600     PERFORM PRINT-DETAIL.                                        IX1194.2 522
   000663         066800*   TEST  4                                                      *IX1194.2
   000664         066900*      REWRITE  PRIME RECORD SHOULD BE CHANGED 21 OR 22 EXPECTED  IX1194.2
   000665         067000*         IX-3, 1.3.4 (3) A                                      *IX1194.2
   000666         067200 RWR-INIT-GF-01-0.                                                IX1194.2
   000667         067300     MOVE SPACES TO IX-FS3-STATUS.                                IX1194.2 IMP 126
   000668         067400     MOVE 0 TO STATUS-TEST-00.                                    IX1194.2 121
   000669         067500     MOVE "REWRITE: 21/22  EXP." TO FEATURE.                      IX1194.2 188
   000670         067600     MOVE "RWR-TEST-GF-01-0" TO PAR-NAME.                         IX1194.2 192
   000671         067700     READ IX-FS3 AT END MOVE 0 TO IX-FS3-KEY.                     IX1194.2 83 93
   000672         067800     MOVE 9 TO XRECORD-NUMBER (1).                                IX1194.2 158
   000673         067900 RWR-TEST-GF-01-0.                                                IX1194.2
   000674         068000     MOVE XRECORD-NUMBER (1) TO GRP-0101-KEY, COUNT-OF-RECS.      IX1194.2 158 103 130
   000675         068100     MOVE GRP-0101 TO XRECORD-KEY (1).                            IX1194.2 101 179
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000676         068200     MOVE GRP-0102 TO ALTERNATE-KEY1 (1).                         IX1194.2 106 181
   000677         068300     MOVE FILE-RECORD-INFO (1) TO IX-FS3R1-F-G-240.               IX1194.2 149 89
   000678         068400     REWRITE IX-FS3R1-F-G-240 INVALID KEY GO TO RWR-TEST-GF-01-1. IX1194.2 89 679
   000679         068500 RWR-TEST-GF-01-1.                                                IX1194.2
   000680         068600     IF IX-FS3-STATUS = "21"                                      IX1194.2 126
   000681      1  068700        GO TO RWR-PASS-GF-01-0.                                   IX1194.2 690
   000682         068800     IF IX-FS3-STATUS = "22"                                      IX1194.2 126
   000683      1  068900        GO TO RWR-PASS-GF-01-0.                                   IX1194.2 690
   000684         069000 RWR-FAIL-GF-01-0.                                                IX1194.2
   000685         069100     MOVE "IX-3, 1.3.4, (3) A. " TO RE-MARK.                      IX1194.2 197
   000686         069200     PERFORM FAIL.                                                IX1194.2 519
   000687         069300     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1194.2 126 203
   000688         069400     MOVE "21" TO CORRECT-X.                                      IX1194.2 216
   000689         069500     GO TO RWR-WRITE-GF-01-0.                                     IX1194.2 692
   000690         069600 RWR-PASS-GF-01-0.                                                IX1194.2
   000691         069700     PERFORM PASS.                                                IX1194.2 518
   000692         069800 RWR-WRITE-GF-01-0.                                               IX1194.2
   000693         069900     PERFORM PRINT-DETAIL.                                        IX1194.2 522
   000694         070000                                                                  IX1194.2
   000695         070200*   TEST  5                                                      *IX1194.2
   000696         070300*         DELETE....  STATUS 43 EXPECTED                          IX1194.2
   000697         070400*         IX-5, 1.3.4 (5) C                                       IX1194.2
   000698         070600 DEL-TEST-GF-01-0.                                                IX1194.2
   000699         070700     MOVE  5 TO TEST-NO.                                          IX1194.2 325
   000700         070800     MOVE SPACES TO IX-FS3-STATUS.                                IX1194.2 IMP 126
   000701         070900     MOVE "DELETE       43 EXP." TO FEATURE                       IX1194.2 188
   000702         071000     MOVE "DEL-TEST-GF-01-0" TO PAR-NAME.                         IX1194.2 192
   000703         071100     DELETE IX-FS3 RECORD.                                        IX1194.2 83
   000704         071200 DEL-TEST-GF-01-1.                                                IX1194.2
   000705         071300     IF IX-FS3-STATUS EQUAL TO "43"                               IX1194.2 126
   000706      1  071400        MOVE "SHOULD HAVE EXECUTED DECLARATIVES IX-3,1.3.4(4)"    IX1194.2
   000707      1  071500          TO RE-MARK                                              IX1194.2 197
   000708      1  071600        GO TO DEL-WRITE-GF-01-0.                                  IX1194.2 711
   000709         071700 DEL-FAIL-GF-01-0.                                                IX1194.2
   000710         071800     MOVE "IX-5, 1.3.4, (5) C" TO RE-MARK.                        IX1194.2 197
   000711         071900 DEL-WRITE-GF-01-0.                                               IX1194.2
   000712         072000     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1194.2 126 203
   000713         072100     MOVE "43" TO CORRECT-X.                                      IX1194.2 216
   000714         072200     PERFORM FAIL.                                                IX1194.2 519
   000715         072300     PERFORM PRINT-DETAIL.                                        IX1194.2 522
   000716         072400     CLOSE IX-FS3.                                                IX1194.2 83
   000717         072500                                                                  IX1194.2
   000718         072600 TERMINATE-ROUTINE.                                               IX1194.2
   000719         072700     EXIT.                                                        IX1194.2
   000720         072800                                                                  IX1194.2
   000721         072900 CCVS-EXIT SECTION.                                               IX1194.2
   000722         073000 CCVS-999999.                                                     IX1194.2
   000723         073100     GO TO CLOSE-FILES.                                           IX1194.2 499
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      181   ALTERNATE-KEY1 . . . . . . . .  M676
      183   ALTERNATE-KEY2
      248   ANSI-REFERENCE . . . . . . . .  451 458 467 601 608 617
       75   C-ABORT. . . . . . . . . . . .  M361 M480 M503
       69   C-ALL. . . . . . . . . . . . .  M363 M505
       65   C-DATE . . . . . . . . . . . .  M482
       71   C-DELETED. . . . . . . . . . .  M365 M507
       70   C-FAIL . . . . . . . . . . . .  M364 M506
       74   C-INDENT
       72   C-INSPECT. . . . . . . . . . .  M366 M508
       67   C-NO-OF-TESTS. . . . . . . . .  M481
       73   C-NOTE
       68   C-OK . . . . . . . . . . . . .  M362 M504
       66   C-TIME . . . . . . . . . . . .  M483
      227   CCVS-C-1 . . . . . . . . . . .  438 540 586
      232   CCVS-C-2 . . . . . . . . . . .  439 541 587
      282   CCVS-E-1 . . . . . . . . . . .  397 546
      287   CCVS-E-2 . . . . . . . . . . .  406 413 420 426 555 562 569 574
      290   CCVS-E-2-2 . . . . . . . . . .  M405 M554
      295   CCVS-E-3 . . . . . . . . . . .  427 575
      304   CCVS-E-4 . . . . . . . . . . .  405 554
      305   CCVS-E-4-1 . . . . . . . . . .  M403 M552
      307   CCVS-E-4-2 . . . . . . . . . .  M404 M553
      249   CCVS-H-1 . . . . . . . . . . .  434 535 582
      254   CCVS-H-2A. . . . . . . . . . .  435 536 583
      263   CCVS-H-2B. . . . . . . . . . .  436 537 584
      275   CCVS-H-3 . . . . . . . . . . .  437 538 585
      326   CCVS-PGM-ID. . . . . . . . . .  359 478 488 488 501 629
      168   CHARS-OR-RECORDS . . . . . . .  M631
      209   CM-18V0
      203   COMPUTED-A . . . . . . . . . .  204 206 207 208 209 M347 463 466 613 616 M656 M687 M712
      204   COMPUTED-N
      202   COMPUTED-X . . . . . . . . . .  M389 448 M530 598
      206   COMPUTED-0V18
      208   COMPUTED-14V4
      210   COMPUTED-18V0
      207   COMPUTED-4V14
      226   COR-ANSI-REFERENCE . . . . . .  M458 M460 M608 M610
      217   CORRECT-A. . . . . . . . . . .  218 219 220 221 222 464 466 614 616
      218   CORRECT-N
      216   CORRECT-X. . . . . . . . . . .  M348 M390 450 M531 600 M657 M688 M713
      219   CORRECT-0V18
      221   CORRECT-14V4
      223   CORRECT-18V0
      220   CORRECT-4V14
      132   COUNT-OF-RECORDS
      130   COUNT-OF-RECS. . . . . . . . .  132 M637 M674
      222   CR-18V0
      240   DELETE-COUNTER . . . . . . . .  365 401 416 418 507 M520 549 565 567
      195   DOTVALUE . . . . . . . . . . .  M381 M525
      246   DUMMY-HOLD . . . . . . . . . .  M431 441 M579 589
       81   DUMMY-RECORD . . . . . . . . .  M394 M397 M406 M413 M420 M426 M427 431 M432 433 M434 M435 M436 M437 M438 M439
                                            M440 M441 445 M446 M453 M468 M535 M536 M537 M538 M540 M541 M542 M544 M546 M555
                                            M562 M569 M574 M575 579 M580 581 M582 M583 M584 M585 M586 M587 M588 M589 593
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    17
0 Defined   Cross-reference of data names   References

0                                           M594 M603 M618
      293   ENDER-DESC . . . . . . . . . .  M408 M419 M425 M557 M568 M573
      113   EOF-FLAG . . . . . . . . . . .  M338
      241   ERROR-COUNTER. . . . . . . . .  364 M377 400 409 412 506 M519 548 558 561
      117   ERROR-FLAG
      245   ERROR-HOLD . . . . . . . . . .  363 M400 M401 M401 M402 404 505 M548 M549 M549 M550 553
      291   ERROR-TOTAL. . . . . . . . . .  M410 M412 M417 M418 M423 M424 M559 M561 M566 M567 M571 M572
      188   FEATURE. . . . . . . . . . . .  M647 M669 M701
      149   FILE-RECORD-INFO . . . . . . .  M496 677
      150   FILE-RECORD-INFO-P1-120
      177   FILE-RECORD-INFO-P121-240
      135   FILE-RECORD-INFO-SKELETON. . .  495
      134   FILE-RECORD-INFORMATION-REC
      101   GRP-0101 . . . . . . . . . . .  675
      103   GRP-0101-KEY . . . . . . . . .  M674
      106   GRP-0102 . . . . . . . . . . .  676
      108   GRP-0102-KEY
      319   HYPHEN-LINE. . . . . . . . . .  394 440 542 544 588
      285   ID-AGAIN . . . . . . . . . . .  M488
      318   INF-ANSI-REFERENCE . . . . . .  M451 M454 M467 M469 M601 M604 M617 M619
      313   INFO-TEXT. . . . . . . . . . .  M452 M602
      242   INSPECT-COUNTER. . . . . . . .  366 400 422 424 508 M517 548 570 572
       83   IX-FS3 . . . . . . . . . . . .  50 332 357 650 671 M703 716
       95   IX-FS3-ALTER-KEY
       93   IX-FS3-KEY . . . . . . . . . .  54 M671
       90   IX-FS3-REC-120
       91   IX-FS3-REC-120-240
      126   IX-FS3-STATUS. . . . . . . . .  55 344 347 M646 651 656 M667 680 682 687 M700 705 712
      127   IX-FS3-STAT1 . . . . . . . . .  337 340
      128   IX-FS3-STAT2
       89   IX-FS3R1-F-G-240 . . . . . . .  M677 678
      162   ODO-NUMBER
      190   P-OR-F . . . . . . . . . . . .  M376 M377 384 M389 M517 M518 M519 M520 527 M530
      192   PAR-NAME . . . . . . . . . . .  M391 M532 M648 M670 M702
      194   PARDOT-X . . . . . . . . . . .  M380 M524
      243   PASS-COUNTER . . . . . . . . .  362 M376 402 403 504 M518 550 552
      119   PERM-ERRORS. . . . . . . . . .  M341
       77   PRINT-FILE . . . . . . . . . .  47 371 487 512
       79   PRINT-REC. . . . . . . . . . .  M382 M457 M459 M526 M607 M609
       61   RAW-DATA . . . . . . . . . . .  41 358 360 369 477 479 486 500 502 511
       64   RAW-DATA-KEY . . . . . . . . .  45 M359 M478 M501
       63   RAW-DATA-SATZ. . . . . . . . .  367 484 509
      197   RE-MARK. . . . . . . . . . . .  M349 M392 M521 M533 M654 M685 M707 M710
      239   REC-CT . . . . . . . . . . . .  379 381 391 523 525 532
      238   REC-SKL-SUB. . . . . . . . . .  M491 M494 496
      247   RECORD-COUNT . . . . . . . . .  M429 430 M442 M577 578 M590
      115   RECORDS-IN-ERROR
      172   RECORDS-IN-FILE. . . . . . . .  M633
      156   REELUNIT-NUMBER
      124   STATUS-TEST-READ
      121   STATUS-TEST-00 . . . . . . . .  M645 M668
      123   STATUS-TEST-10 . . . . . . . .  336
      198   TEST-COMPUTED. . . . . . . . .  457 607
      213   TEST-CORRECT . . . . . . . . .  459 609
      266   TEST-ID. . . . . . . . . . . .  M488
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    18
0 Defined   Cross-reference of data names   References

0     325   TEST-NO. . . . . . . . . . . .  334 M626 M699
      186   TEST-RESULTS . . . . . . . . .  382 M489 526
      244   TOTAL-ERROR
      160   UPDATE-NUMBER
      111   WRK-CS-09V00
      170   XBLOCK-SIZE. . . . . . . . . .  M632
      152   XFILE-NAME . . . . . . . . . .  M627
      174   XFILE-ORGANIZATION . . . . . .  M634
      176   XLABEL-TYPE. . . . . . . . . .  M635
      164   XPROGRAM-NAME. . . . . . . . .  M629
      179   XRECORD-KEY. . . . . . . . . .  M675
      166   XRECORD-LENGTH . . . . . . . .  M630
      154   XRECORD-NAME . . . . . . . . .  M628
      158   XRECORD-NUMBER . . . . . . . .  M636 M672 674
      315   XXCOMPUTED . . . . . . . . . .  M466 M616
      317   XXCORRECT. . . . . . . . . . .  M466 M616
      310   XXINFO . . . . . . . . . . . .  453 468 603 618
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    19
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

      612   BAIL-OUT . . . . . . . . . . .  P529
      620   BAIL-OUT-EX. . . . . . . . . .  E529 G614
      615   BAIL-OUT-WRITE . . . . . . . .  G613
      595   BLANK-LINE-PRINT
      721   CCVS-EXIT
      497   CCVS-INIT-EXIT
      493   CCVS-INIT-FILE . . . . . . . .  P492
      722   CCVS-999999
      475   CCVS1
      621   CCVS1-EXIT . . . . . . . . . .  G498
      499   CLOSE-FILES. . . . . . . . . .  G723
      539   COLUMN-NAMES-ROUTINE . . . . .  E490
      462   D-BAIL-OUT . . . . . . . . . .  P388
      470   D-BAIL-OUT-EX. . . . . . . . .  E388 G464
      465   D-BAIL-OUT-WRITE . . . . . . .  G463
      346   D-C-FAIL-GF-01-0
      352   D-C-PASS-GF-01-0 . . . . . . .  G345
      343   D-C-TEST-GF-01-1 . . . . . . .  G335
      354   D-C-WRITE-GF-01-0. . . . . . .  G351
      356   D-CLOSE-FILES
      368   D-END-E-2. . . . . . . . . . .  G360 G367
      393   D-END-ROUTINE. . . . . . . . .  P370
      399   D-END-ROUTINE-1
      407   D-END-ROUTINE-12
      415   D-END-ROUTINE-13 . . . . . . .  E370
      396   D-END-RTN-EXIT
      377   D-FAIL . . . . . . . . . . . .  P350
      447   D-FAIL-ROUTINE . . . . . . . .  P386
      461   D-FAIL-ROUTINE-EX. . . . . . .  E386 G455
      456   D-FAIL-ROUTINE-WRITE . . . . .  G449 G450
      376   D-PASS . . . . . . . . . . . .  P353
      378   D-PRINT-DETAIL . . . . . . . .  P355
      374   D-TERMINATE-CALL
      372   D-TERMINATE-CCVS
      428   D-WRITE-LINE . . . . . . . . .  P383 P385 P395 P398 P406 P414 P421 P426 P427 P453 P457 P459 P468
      444   D-WRT-LN . . . . . . . . . . .  P434 P435 P436 P437 P438 P439 P440 P443
      520   DE-LETE
      471   DECL-EXIT. . . . . . . . . . .  G342
      709   DEL-FAIL-GF-01-0
      698   DEL-TEST-GF-01-0
      704   DEL-TEST-GF-01-1
      711   DEL-WRITE-GF-01-0. . . . . . .  G708
      485   END-E-1. . . . . . . . . . . .  G479 G484
      510   END-E-2. . . . . . . . . . . .  G502 G509
      543   END-ROUTINE. . . . . . . . . .  P512
      547   END-ROUTINE-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    20
0 Defined   Cross-reference of procedures   References

0     556   END-ROUTINE-12
      564   END-ROUTINE-13 . . . . . . . .  E512
      545   END-RTN-EXIT
      519   FAIL . . . . . . . . . . . . .  P655 P686 P714
      597   FAIL-ROUTINE . . . . . . . . .  P528
      611   FAIL-ROUTINE-EX. . . . . . . .  E528 G605
      606   FAIL-ROUTINE-WRITE . . . . . .  G599 G600
      534   HEAD-ROUTINE . . . . . . . . .  P490
      333   INPUT-PROCESS
      517   INSPT
      476   OPEN-FILES
      653   OPN-FAIL-GF-01-0
      644   OPN-INIT-GF-01-0
      659   OPN-PASS-GF-01-0 . . . . . . .  G652
      661   OPN-WRITE-GF-01-0. . . . . . .  G658
      518   PASS . . . . . . . . . . . . .  P660 P691
      522   PRINT-DETAIL . . . . . . . . .  P662 P693 P715
      684   RWR-FAIL-GF-01-0
      666   RWR-INIT-GF-01-0
      690   RWR-PASS-GF-01-0 . . . . . . .  G681 G683
      673   RWR-TEST-GF-01-0
      679   RWR-TEST-GF-01-1 . . . . . . .  G678
      692   RWR-WRITE-GF-01-0. . . . . . .  G689
      331   SECT-IX105-0002
      624   SECT-IX119A-0003
      625   SEQ-INIT-010
      515   TERMINATE-CALL
      513   TERMINATE-CCVS
      718   TERMINATE-ROUTINE
      576   WRITE-LINE . . . . . . . . . .  P526 P527 P535 P536 P537 P538 P540 P541 P542 P544 P546 P555 P563 P569 P574 P575
                                            P603 P607 P609 P618
      592   WRT-LN . . . . . . . . . . . .  P582 P583 P584 P585 P586 P587 P588 P591 P596
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    21
0 Defined   Cross-reference of programs     References

        3   IX119A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX119A    Date 06/04/2022  Time 11:57:38   Page    22
0LineID  Message code  Message text

     77  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     83  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     83  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX119A:
 *    Source records = 723
 *    Data Division statements = 120
 *    Procedure Division statements = 370
 *    Generated COBOL statements = 0
 *    Program complexity factor = 379
0End of compilation 1,  program IX119A,  highest severity 0.
0Return code 0
