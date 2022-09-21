1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:08   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:08   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1164.2
   000002         000200 PROGRAM-ID.                                                      IX1164.2
   000003         000300     IX116A.                                                      IX1164.2
   000004         000500*                                                              *  IX1164.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1164.2
   000006         000700*                                                              *  IX1164.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1164.2
   000008         000900*                                                              *  IX1164.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1164.2
   000010         001100*                                                              *  IX1164.2
   000011         001300*                                                                 IX1164.2
   000012         001400*    THIS ROUTINE USES THE MASS STORAGE FILE IX-FS3 CREATED IN    IX1164.2
   000013         001500*    IX113A.                                                      IX1164.2
   000014         001600*    THE FILE IS OPENED I-O AND THE STATUS CHECKED (00 EXPECTED), IX1164.2
   000015         001700*    CLOSED AND THE STATUS CHECKED (00 EXPECTED) THEN AN ATTEMPT  IX1164.2
   000016         001800*    IS MADE TO DELETE A RECORD, AT WHICH POINT THE DECLARATIVES  IX1164.2
   000017         001900*    SHOULD BE ACTIONED AND THE FILE STATUS SHOULD BE 49 .        IX1164.2
   000018         002000*                                                                 IX1164.2
   000019         002100*    STANDARD REFERENCE IX-5, 1.3.4 (5) H                         IX1164.2
   000020         002200*                                                                 IX1164.2
   000021         002300*    X-CARDS USED IN THIS PROGRAM:                                IX1164.2
   000022         002400*                                                                 IX1164.2
   000023         002500*                 XXXXX024                                        IX1164.2
   000024         002600*                 XXXXX055.                                       IX1164.2
   000025         002700*         P       XXXXX062.                                       IX1164.2
   000026         002800*                 XXXXX082.                                       IX1164.2
   000027         002900*                 XXXXX083.                                       IX1164.2
   000028         003000*         C       XXXXX084                                        IX1164.2
   000029         003100*                                                                 IX1164.2
   000030         003200*                                                                 IX1164.2
   000031         003300 ENVIRONMENT DIVISION.                                            IX1164.2
   000032         003400 CONFIGURATION SECTION.                                           IX1164.2
   000033         003500 SOURCE-COMPUTER.                                                 IX1164.2
   000034         003600     XXXXX082.                                                    IX1164.2
   000035         003700 OBJECT-COMPUTER.                                                 IX1164.2
   000036         003800     XXXXX083.                                                    IX1164.2
   000037         003900 INPUT-OUTPUT SECTION.                                            IX1164.2
   000038         004000 FILE-CONTROL.                                                    IX1164.2
   000039         004100     SELECT RAW-DATA   ASSIGN TO                                  IX1164.2 59
   000040         004200     XXXXX062                                                     IX1164.2
   000041         004300            ORGANIZATION IS INDEXED                               IX1164.2
   000042         004400            ACCESS MODE IS RANDOM                                 IX1164.2
   000043         004500            RECORD KEY IS RAW-DATA-KEY.                           IX1164.2 62
   000044         004600*                                                                 IX1164.2
   000045         004700     SELECT PRINT-FILE ASSIGN TO                                  IX1164.2 75
   000046         004800     XXXXX055.                                                    IX1164.2
   000047         004900*                                                                 IX1164.2
   000048         005000     SELECT IX-FS3 ASSIGN                                         IX1164.2 81
   000049         005100     XXXXX024                                                     IX1164.2
   000050         005200     ORGANIZATION IS INDEXED                                      IX1164.2
   000051         005300     ACCESS MODE IS SEQUENTIAL                                    IX1164.2
   000052         005400     RECORD KEY IS IX-FS3-KEY                                     IX1164.2 91
   000053         005500     FILE STATUS IS IX-FS3-STATUS.                                IX1164.2 124
   000054         005600                                                                  IX1164.2
   000055         005700 DATA DIVISION.                                                   IX1164.2
   000056         005800                                                                  IX1164.2
   000057         005900 FILE SECTION.                                                    IX1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000                                                                  IX1164.2
   000059         006100 FD  RAW-DATA.                                                    IX1164.2
   000060         006200                                                                  IX1164.2
   000061         006300 01  RAW-DATA-SATZ.                                               IX1164.2
   000062         006400     05  RAW-DATA-KEY        PIC X(6).                            IX1164.2
   000063         006500     05  C-DATE              PIC 9(6).                            IX1164.2
   000064         006600     05  C-TIME              PIC 9(8).                            IX1164.2
   000065         006700     05  C-NO-OF-TESTS       PIC 99.                              IX1164.2
   000066         006800     05  C-OK                PIC 999.                             IX1164.2
   000067         006900     05  C-ALL               PIC 999.                             IX1164.2
   000068         007000     05  C-FAIL              PIC 999.                             IX1164.2
   000069         007100     05  C-DELETED           PIC 999.                             IX1164.2
   000070         007200     05  C-INSPECT           PIC 999.                             IX1164.2
   000071         007300     05  C-NOTE              PIC X(13).                           IX1164.2
   000072         007400     05  C-INDENT            PIC X.                               IX1164.2
   000073         007500     05  C-ABORT             PIC X(8).                            IX1164.2
   000074         007600                                                                  IX1164.2
   000075         007700 FD  PRINT-FILE.                                                  IX1164.2

 ==000075==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000076         007800                                                                  IX1164.2
   000077         007900 01  PRINT-REC               PIC X(120).                          IX1164.2
   000078         008000                                                                  IX1164.2
   000079         008100 01  DUMMY-RECORD            PIC X(120).                          IX1164.2
   000080         008200                                                                  IX1164.2
   000081         008300 FD  IX-FS3                                                       IX1164.2

 ==000081==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000081==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000082         008400        DATA RECORDS IX-FS3R1-F-G-240                             IX1164.2 *
   000083         008500        LABEL RECORD STANDARD                                     IX1164.2
   000084         008600        RECORD 240                                                IX1164.2
   000085         008700        BLOCK CONTAINS 2 RECORDS.                                 IX1164.2
   000086         008800                                                                  IX1164.2
   000087         008900 01  IX-FS3R1-F-G-240.                                            IX1164.2
   000088         009000     05  IX-FS3-REC-120      PIC X(120).                          IX1164.2
   000089         009100     05  IX-FS3-REC-120-240.                                      IX1164.2
   000090         009200         10  FILLER          PIC X(8).                            IX1164.2
   000091         009300         10  IX-FS3-KEY      PIC X(29).                           IX1164.2
   000092         009400         10  FILLER          PIC X(9).                            IX1164.2
   000093         009500         10  IX-FS3-ALTER-KEY  PIC X(29).                         IX1164.2
   000094         009600         10  FILLER            PIC X(45).                         IX1164.2
   000095         009700                                                                  IX1164.2
   000096         009800                                                                  IX1164.2
   000097         009900 WORKING-STORAGE SECTION.                                         IX1164.2
   000098         010000                                                                  IX1164.2
   000099         010100 01  GRP-0101.                                                    IX1164.2
   000100         010200     05  FILLER              PIC X(10) VALUE "RECORD-KEY".        IX1164.2
   000101         010300     05  GRP-0101-KEY        PIC 9(9)  VALUE ZERO.                IX1164.2 IMP
   000102         010400     05  FILLER              PIC X(10) VALUE "END-OF-KEY".        IX1164.2
   000103         010500                                                                  IX1164.2
   000104         010600 01  GRP-0102.                                                    IX1164.2
   000105         010700     05  FILLER              PIC X(10) VALUE "ALTERN-KEY".        IX1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000106         010800     05  GRP-0102-KEY        PIC 9(9)  VALUE ZERO.                IX1164.2 IMP
   000107         010900     05  FILLER              PIC X(10) VALUE "END-AL-KEY".        IX1164.2
   000108         011000                                                                  IX1164.2
   000109         011100 01  WRK-CS-09V00            PIC S9(9) COMP VALUE ZERO.           IX1164.2 IMP
   000110         011200                                                                  IX1164.2
   000111         011300 01  EOF-FLAG                PIC 9 VALUE ZERO.                    IX1164.2 IMP
   000112         011400                                                                  IX1164.2
   000113         011500 01  RECORDS-IN-ERROR        PIC S9(5) COMP VALUE ZERO.           IX1164.2 IMP
   000114         011600                                                                  IX1164.2
   000115         011700 01  ERROR-FLAG              PIC 9 VALUE ZERO.                    IX1164.2 IMP
   000116         011800                                                                  IX1164.2
   000117         011900 01  PERM-ERRORS             PIC S9(5) COMP VALUE ZERO.           IX1164.2 IMP
   000118         012000                                                                  IX1164.2
   000119         012100 01  STATUS-TEST-00          PIC 9 VALUE ZERO.                    IX1164.2 IMP
   000120         012200                                                                  IX1164.2
   000121         012300 01  STATUS-TEST-10          PIC 9 VALUE ZERO.                    IX1164.2 IMP
   000122         012400 01  STATUS-TEST-READ        PIC 9 VALUE ZERO.                    IX1164.2 IMP
   000123         012500                                                                  IX1164.2
   000124         012600 01  IX-FS3-STATUS.                                               IX1164.2
   000125         012700     05  IX-FS3-STAT1        PIC X.                               IX1164.2
   000126         012800     05  IX-FS3-STAT2        PIC X.                               IX1164.2
   000127         012900                                                                  IX1164.2
   000128         013000 01  COUNT-OF-RECS           PIC 9(5).                            IX1164.2
   000129         013100                                                                  IX1164.2
   000130         013200 01  COUNT-OF-RECORDS REDEFINES COUNT-OF-RECS  PIC 9(5).          IX1164.2 128
   000131         013300                                                                  IX1164.2
   000132         013400 01  FILE-RECORD-INFORMATION-REC.                                 IX1164.2
   000133         013500     05  FILE-RECORD-INFO-SKELETON.                               IX1164.2
   000134         013600         10  FILLER          PIC X(48) VALUE                      IX1164.2
   000135         013700              "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00". IX1164.2
   000136         013800         10  FILLER          PIC X(46) VALUE                      IX1164.2
   000137         013900                ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000". IX1164.2
   000138         014000         10  FILLER          PIC X(26) VALUE                      IX1164.2
   000139         014100                                    ",LFIL=000000,ORG=  ,LBLR= ". IX1164.2
   000140         014200         10  FILLER          PIC X(37) VALUE                      IX1164.2
   000141         014300                         ",RECKEY=                             ". IX1164.2
   000142         014400         10  FILLER          PIC X(38) VALUE                      IX1164.2
   000143         014500                        ",ALTKEY1=                             ". IX1164.2
   000144         014600         10  FILLER          PIC X(38) VALUE                      IX1164.2
   000145         014700                        ",ALTKEY2=                             ". IX1164.2
   000146         014800         10  FILLER          PIC X(7) VALUE SPACE.                IX1164.2 IMP
   000147         014900     05  FILE-RECORD-INFO             OCCURS 10.                  IX1164.2
   000148         015000         10  FILE-RECORD-INFO-P1-120.                             IX1164.2
   000149         015100             15  FILLER      PIC X(5).                            IX1164.2
   000150         015200             15  XFILE-NAME  PIC X(6).                            IX1164.2
   000151         015300             15  FILLER      PIC X(8).                            IX1164.2
   000152         015400             15  XRECORD-NAME  PIC X(6).                          IX1164.2
   000153         015500             15  FILLER        PIC X(1).                          IX1164.2
   000154         015600             15  REELUNIT-NUMBER  PIC 9(1).                       IX1164.2
   000155         015700             15  FILLER           PIC X(7).                       IX1164.2
   000156         015800             15  XRECORD-NUMBER   PIC 9(6).                       IX1164.2
   000157         015900             15  FILLER           PIC X(6).                       IX1164.2
   000158         016000             15  UPDATE-NUMBER    PIC 9(2).                       IX1164.2
   000159         016100             15  FILLER           PIC X(5).                       IX1164.2
   000160         016200             15  ODO-NUMBER       PIC 9(4).                       IX1164.2
   000161         016300             15  FILLER           PIC X(5).                       IX1164.2
   000162         016400             15  XPROGRAM-NAME    PIC X(5).                       IX1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000163         016500             15  FILLER           PIC X(7).                       IX1164.2
   000164         016600             15  XRECORD-LENGTH   PIC 9(6).                       IX1164.2
   000165         016700             15  FILLER           PIC X(7).                       IX1164.2
   000166         016800             15  CHARS-OR-RECORDS  PIC X(2).                      IX1164.2
   000167         016900             15  FILLER            PIC X(1).                      IX1164.2
   000168         017000             15  XBLOCK-SIZE       PIC 9(4).                      IX1164.2
   000169         017100             15  FILLER            PIC X(6).                      IX1164.2
   000170         017200             15  RECORDS-IN-FILE   PIC 9(6).                      IX1164.2
   000171         017300             15  FILLER            PIC X(5).                      IX1164.2
   000172         017400             15  XFILE-ORGANIZATION  PIC X(2).                    IX1164.2
   000173         017500             15  FILLER              PIC X(6).                    IX1164.2
   000174         017600             15  XLABEL-TYPE         PIC X(1).                    IX1164.2
   000175         017700         10  FILE-RECORD-INFO-P121-240.                           IX1164.2
   000176         017800             15  FILLER              PIC X(8).                    IX1164.2
   000177         017900             15  XRECORD-KEY         PIC X(29).                   IX1164.2
   000178         018000             15  FILLER              PIC X(9).                    IX1164.2
   000179         018100             15  ALTERNATE-KEY1      PIC X(29).                   IX1164.2
   000180         018200             15  FILLER              PIC X(9).                    IX1164.2
   000181         018300             15  ALTERNATE-KEY2      PIC X(29).                   IX1164.2
   000182         018400             15  FILLER              PIC X(7).                    IX1164.2
   000183         018500                                                                  IX1164.2
   000184         018600 01  TEST-RESULTS.                                                IX1164.2
   000185         018700     02 FILLER                   PIC X      VALUE SPACE.          IX1164.2 IMP
   000186         018800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1164.2 IMP
   000187         018900     02 FILLER                   PIC X      VALUE SPACE.          IX1164.2 IMP
   000188         019000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1164.2 IMP
   000189         019100     02 FILLER                   PIC X      VALUE SPACE.          IX1164.2 IMP
   000190         019200     02  PAR-NAME.                                                IX1164.2
   000191         019300       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1164.2 IMP
   000192         019400       03  PARDOT-X              PIC X      VALUE SPACE.          IX1164.2 IMP
   000193         019500       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1164.2 IMP
   000194         019600     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1164.2 IMP
   000195         019700     02 RE-MARK                  PIC X(61).                       IX1164.2
   000196         019800 01  TEST-COMPUTED.                                               IX1164.2
   000197         019900     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1164.2 IMP
   000198         020000     02 FILLER                   PIC X(17)  VALUE                 IX1164.2
   000199         020100            "       COMPUTED=".                                   IX1164.2
   000200         020200     02 COMPUTED-X.                                               IX1164.2
   000201         020300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1164.2 IMP
   000202         020400     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1164.2 201
   000203         020500                                 PIC -9(9).9(9).                  IX1164.2
   000204         020600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1164.2 201
   000205         020700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1164.2 201
   000206         020800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1164.2 201
   000207         020900     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1164.2 201
   000208         021000         04 COMPUTED-18V0                    PIC -9(18).          IX1164.2
   000209         021100         04 FILLER                           PIC X.               IX1164.2
   000210         021200     03 FILLER PIC X(50) VALUE SPACE.                             IX1164.2 IMP
   000211         021300 01  TEST-CORRECT.                                                IX1164.2
   000212         021400     02 FILLER PIC X(30) VALUE SPACE.                             IX1164.2 IMP
   000213         021500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1164.2
   000214         021600     02 CORRECT-X.                                                IX1164.2
   000215         021700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1164.2 IMP
   000216         021800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1164.2 215
   000217         021900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1164.2 215
   000218         022000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1164.2 215
   000219         022100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1164.2 215
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000220         022200     03      CR-18V0 REDEFINES CORRECT-A.                         IX1164.2 215
   000221         022300         04 CORRECT-18V0                     PIC -9(18).          IX1164.2
   000222         022400         04 FILLER                           PIC X.               IX1164.2
   000223         022500     03 FILLER PIC X(2) VALUE SPACE.                              IX1164.2 IMP
   000224         022600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1164.2 IMP
   000225         022700 01  CCVS-C-1.                                                    IX1164.2
   000226         022800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1164.2
   000227         022900-    "SS  PARAGRAPH-NAME                                          IX1164.2
   000228         023000-    "       REMARKS".                                            IX1164.2
   000229         023100     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1164.2 IMP
   000230         023200 01  CCVS-C-2.                                                    IX1164.2
   000231         023300     02 FILLER                     PIC X        VALUE SPACE.      IX1164.2 IMP
   000232         023400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1164.2
   000233         023500     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1164.2 IMP
   000234         023600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1164.2
   000235         023700     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1164.2 IMP
   000236         023800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1164.2 IMP
   000237         023900 01  REC-CT                        PIC 99       VALUE ZERO.       IX1164.2 IMP
   000238         024000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1164.2 IMP
   000239         024100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1164.2 IMP
   000240         024200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1164.2 IMP
   000241         024300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1164.2 IMP
   000242         024400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1164.2 IMP
   000243         024500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1164.2 IMP
   000244         024600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1164.2 IMP
   000245         024700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1164.2 IMP
   000246         024800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1164.2 IMP
   000247         024900 01  CCVS-H-1.                                                    IX1164.2
   000248         025000     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1164.2 IMP
   000249         025100     02  FILLER                    PIC X(42)    VALUE             IX1164.2
   000250         025200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1164.2
   000251         025300     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1164.2 IMP
   000252         025400 01  CCVS-H-2A.                                                   IX1164.2
   000253         025500   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1164.2 IMP
   000254         025600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1164.2
   000255         025700   02  FILLER                        PIC XXXX   VALUE             IX1164.2
   000256         025800     "4.2 ".                                                      IX1164.2
   000257         025900   02  FILLER                        PIC X(28)  VALUE             IX1164.2
   000258         026000            " COPY - NOT FOR DISTRIBUTION".                       IX1164.2
   000259         026100   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1164.2 IMP
   000260         026200                                                                  IX1164.2
   000261         026300 01  CCVS-H-2B.                                                   IX1164.2
   000262         026400   02  FILLER                        PIC X(15)  VALUE             IX1164.2
   000263         026500            "TEST RESULT OF ".                                    IX1164.2
   000264         026600   02  TEST-ID                       PIC X(9).                    IX1164.2
   000265         026700   02  FILLER                        PIC X(4)   VALUE             IX1164.2
   000266         026800            " IN ".                                               IX1164.2
   000267         026900   02  FILLER                        PIC X(12)  VALUE             IX1164.2
   000268         027000     " HIGH       ".                                              IX1164.2
   000269         027100   02  FILLER                        PIC X(22)  VALUE             IX1164.2
   000270         027200            " LEVEL VALIDATION FOR ".                             IX1164.2
   000271         027300   02  FILLER                        PIC X(58)  VALUE             IX1164.2
   000272         027400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1164.2
   000273         027500 01  CCVS-H-3.                                                    IX1164.2
   000274         027600     02  FILLER                      PIC X(34)  VALUE             IX1164.2
   000275         027700            " FOR OFFICIAL USE ONLY    ".                         IX1164.2
   000276         027800     02  FILLER                      PIC X(58)  VALUE             IX1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000277         027900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1164.2
   000278         028000     02  FILLER                      PIC X(28)  VALUE             IX1164.2
   000279         028100            "  COPYRIGHT   1985 ".                                IX1164.2
   000280         028200 01  CCVS-E-1.                                                    IX1164.2
   000281         028300     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1164.2 IMP
   000282         028400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1164.2
   000283         028500     02 ID-AGAIN                     PIC X(9).                    IX1164.2
   000284         028600     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1164.2 IMP
   000285         028700 01  CCVS-E-2.                                                    IX1164.2
   000286         028800     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1164.2 IMP
   000287         028900     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1164.2 IMP
   000288         029000     02 CCVS-E-2-2.                                               IX1164.2
   000289         029100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1164.2 IMP
   000290         029200         03 FILLER                   PIC X      VALUE SPACE.      IX1164.2 IMP
   000291         029300         03 ENDER-DESC               PIC X(44)  VALUE             IX1164.2
   000292         029400            "ERRORS ENCOUNTERED".                                 IX1164.2
   000293         029500 01  CCVS-E-3.                                                    IX1164.2
   000294         029600     02  FILLER                      PIC X(22)  VALUE             IX1164.2
   000295         029700            " FOR OFFICIAL USE ONLY".                             IX1164.2
   000296         029800     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1164.2 IMP
   000297         029900     02  FILLER                      PIC X(58)  VALUE             IX1164.2
   000298         030000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1164.2
   000299         030100     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1164.2 IMP
   000300         030200     02 FILLER                       PIC X(15)  VALUE             IX1164.2
   000301         030300             " COPYRIGHT 1985".                                   IX1164.2
   000302         030400 01  CCVS-E-4.                                                    IX1164.2
   000303         030500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1164.2 IMP
   000304         030600     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1164.2
   000305         030700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1164.2 IMP
   000306         030800     02 FILLER                       PIC X(40)  VALUE             IX1164.2
   000307         030900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1164.2
   000308         031000 01  XXINFO.                                                      IX1164.2
   000309         031100     02 FILLER                       PIC X(19)  VALUE             IX1164.2
   000310         031200            "*** INFORMATION ***".                                IX1164.2
   000311         031300     02 INFO-TEXT.                                                IX1164.2
   000312         031400       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1164.2 IMP
   000313         031500       04 XXCOMPUTED                 PIC X(20).                   IX1164.2
   000314         031600       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1164.2 IMP
   000315         031700       04 XXCORRECT                  PIC X(20).                   IX1164.2
   000316         031800     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1164.2
   000317         031900 01  HYPHEN-LINE.                                                 IX1164.2
   000318         032000     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1164.2 IMP
   000319         032100     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1164.2
   000320         032200-    "*****************************************".                 IX1164.2
   000321         032300     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1164.2
   000322         032400-    "******************************".                            IX1164.2
   000323         032500 01  TEST-NO                         PIC 99.                      IX1164.2
   000324         032600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1164.2
   000325         032700     "IX116A".                                                    IX1164.2
   000326         032800 PROCEDURE DIVISION.                                              IX1164.2
   000327         032900 DECLARATIVES.                                                    IX1164.2
   000328         033000                                                                  IX1164.2
   000329         033100 SECT-IX105-0002 SECTION.                                         IX1164.2
   000330         033200     USE AFTER EXCEPTION PROCEDURE ON IX-FS3.                     IX1164.2 81
   000331         033300 INPUT-PROCESS.                                                   IX1164.2
   000332         033400     IF TEST-NO = 5                                               IX1164.2 323
   000333      1  033500        GO TO D-C-TEST-GF-01-1.                                   IX1164.2 341
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000334         033600     IF STATUS-TEST-10 EQUAL TO 1                                 IX1164.2 121
   000335      1  033700        IF  IX-FS3-STAT1 EQUAL TO "1"                             IX1164.2 125
   000336      2  033800            MOVE 1 TO EOF-FLAG                                    IX1164.2 111
   000337      1  033900        ELSE                                                      IX1164.2
   000338      2  034000           IF  IX-FS3-STAT1 GREATER THAN "1"                      IX1164.2 125
   000339      3  034100           MOVE 1 TO PERM-ERRORS.                                 IX1164.2 117
   000340         034200     GO TO DECL-EXIT.                                             IX1164.2 468
   000341         034300 D-C-TEST-GF-01-1.                                                IX1164.2
   000342         034400     IF IX-FS3-STATUS EQUAL TO "49"                               IX1164.2 124
   000343      1  034500         GO TO D-C-PASS-GF-01-0.                                  IX1164.2 350
   000344         034600 D-C-FAIL-GF-01-0.                                                IX1164.2
   000345         034700     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1164.2 124 201
   000346         034800     MOVE "49" TO CORRECT-X.                                      IX1164.2 214
   000347         034900     MOVE "IX-5, 1.3.4, (5) H" TO RE-MARK.                        IX1164.2 195
   000348         035000     PERFORM D-FAIL.                                              IX1164.2 374
   000349         035100     GO TO D-C-WRITE-GF-01-0.                                     IX1164.2 352
   000350         035200 D-C-PASS-GF-01-0.                                                IX1164.2
   000351         035300     PERFORM D-PASS.                                              IX1164.2 373
   000352         035400 D-C-WRITE-GF-01-0.                                               IX1164.2
   000353         035500     PERFORM D-PRINT-DETAIL.                                      IX1164.2 375
   000354         035600 D-CLOSE-FILES.                                                   IX1164.2
   000355         035700     OPEN I-O RAW-DATA.                                           IX1164.2 59
   000356         035800     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1164.2 324 62
   000357         035900     READ RAW-DATA INVALID KEY GO TO D-END-E-2.                   IX1164.2 59 365
   000358         036000     MOVE "OK.     " TO C-ABORT.                                  IX1164.2 73
   000359         036100     MOVE PASS-COUNTER TO C-OK.                                   IX1164.2 241 66
   000360         036200     MOVE ERROR-HOLD   TO C-ALL.                                  IX1164.2 243 67
   000361         036300     MOVE ERROR-COUNTER TO C-FAIL.                                IX1164.2 239 68
   000362         036400     MOVE DELETE-COUNTER TO C-DELETED.                            IX1164.2 238 69
   000363         036500     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1164.2 240 70
   000364         036600     REWRITE RAW-DATA-SATZ INVALID KEY GO TO D-END-E-2.           IX1164.2 61 365
   000365         036700 D-END-E-2.                                                       IX1164.2
   000366         036800     CLOSE RAW-DATA.                                              IX1164.2 59
   000367         036900     PERFORM D-END-ROUTINE THRU D-END-ROUTINE-13.                 IX1164.2 390 412
   000368         037000     CLOSE PRINT-FILE.                                            IX1164.2 75
   000369         037100 D-TERMINATE-CCVS.                                                IX1164.2
   000370         037200     EXIT PROGRAM.                                                IX1164.2
   000371         037300 D-TERMINATE-CALL.                                                IX1164.2
   000372         037400     STOP     RUN.                                                IX1164.2
   000373         037500 D-PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.         IX1164.2 188 241
   000374         037600 D-FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.        IX1164.2 188 239
   000375         037700 D-PRINT-DETAIL.                                                  IX1164.2
   000376         037800     IF   REC-CT NOT EQUAL TO ZERO                                IX1164.2 237 IMP
   000377      1  037900          MOVE "." TO PARDOT-X                                    IX1164.2 192
   000378      1  038000          MOVE REC-CT TO DOTVALUE.                                IX1164.2 237 193
   000379         038100     MOVE TEST-RESULTS TO PRINT-REC.                              IX1164.2 184 77
   000380         038200     PERFORM D-WRITE-LINE.                                        IX1164.2 425
   000381         038300     IF   P-OR-F EQUAL TO "FAIL*"                                 IX1164.2 188
   000382      1  038400          PERFORM D-WRITE-LINE                                    IX1164.2 425
   000383      1  038500          PERFORM D-FAIL-ROUTINE THRU D-FAIL-ROUTINE-EX           IX1164.2 444 458
   000384         038600     ELSE                                                         IX1164.2
   000385      1  038700          PERFORM D-BAIL-OUT THRU D-BAIL-OUT-EX.                  IX1164.2 459 467
   000386         038800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1164.2 IMP 188 IMP 200
   000387         038900     MOVE SPACE TO CORRECT-X.                                     IX1164.2 IMP 214
   000388         039000     IF   REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.           IX1164.2 237 IMP IMP 190
   000389         039100     MOVE SPACE TO RE-MARK.                                       IX1164.2 IMP 195
   000390         039200 D-END-ROUTINE.                                                   IX1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000391         039300     MOVE HYPHEN-LINE TO DUMMY-RECORD.                            IX1164.2 317 79
   000392         039400     PERFORM D-WRITE-LINE 5 TIMES.                                IX1164.2 425
   000393         039500 D-END-RTN-EXIT.                                                  IX1164.2
   000394         039600     MOVE CCVS-E-1 TO DUMMY-RECORD.                               IX1164.2 280 79
   000395         039700     PERFORM D-WRITE-LINE 2 TIMES.                                IX1164.2 425
   000396         039800 D-END-ROUTINE-1.                                                 IX1164.2
   000397         039900     ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO       IX1164.2 239 243 240
   000398         040000     ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.                IX1164.2 243 238 243
   000399         040100     ADD PASS-COUNTER TO ERROR-HOLD.                              IX1164.2 241 243
   000400         040200     MOVE PASS-COUNTER TO CCVS-E-4-1.                             IX1164.2 241 303
   000401         040300     MOVE ERROR-HOLD TO CCVS-E-4-2.                               IX1164.2 243 305
   000402         040400     MOVE CCVS-E-4 TO CCVS-E-2-2.                                 IX1164.2 302 288
   000403         040500     MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM D-WRITE-LINE.          IX1164.2 285 79 425
   000404         040600  D-END-ROUTINE-12.                                               IX1164.2
   000405         040700     MOVE "TEST(S) FAILED" TO ENDER-DESC.                         IX1164.2 291
   000406         040800     IF  ERROR-COUNTER IS EQUAL TO ZERO                           IX1164.2 239 IMP
   000407      1  040900         MOVE "NO " TO ERROR-TOTAL                                IX1164.2 289
   000408         041000     ELSE                                                         IX1164.2
   000409      1  041100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1164.2 239 289
   000410         041200     MOVE    CCVS-E-2 TO DUMMY-RECORD.                            IX1164.2 285 79
   000411         041300     PERFORM D-WRITE-LINE.                                        IX1164.2 425
   000412         041400 D-END-ROUTINE-13.                                                IX1164.2
   000413         041500     IF  DELETE-COUNTER IS EQUAL TO ZERO                          IX1164.2 238 IMP
   000414      1  041600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1164.2 289
   000415      1  041700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1164.2 238 289
   000416         041800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1164.2 291
   000417         041900     MOVE CCVS-E-2 TO DUMMY-RECORD.                               IX1164.2 285 79
   000418         042000     PERFORM D-WRITE-LINE.                                        IX1164.2 425
   000419         042100     IF   INSPECT-COUNTER EQUAL TO ZERO                           IX1164.2 240 IMP
   000420      1  042200          MOVE "NO " TO ERROR-TOTAL                               IX1164.2 289
   000421      1  042300     ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                    IX1164.2 240 289
   000422         042400     MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.             IX1164.2 291
   000423         042500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1164.2 285 79 425
   000424         042600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1164.2 293 79 425
   000425         042700 D-WRITE-LINE.                                                    IX1164.2
   000426         042800     ADD 1 TO RECORD-COUNT.                                       IX1164.2 245
   000427         042900     IF RECORD-COUNT GREATER 42                                   IX1164.2 245
   000428      1  043000        MOVE DUMMY-RECORD TO DUMMY-HOLD                           IX1164.2 79 244
   000429      1  043100        MOVE SPACE TO DUMMY-RECORD                                IX1164.2 IMP 79
   000430      1  043200        WRITE DUMMY-RECORD AFTER ADVANCING PAGE                   IX1164.2 79
   000431      1  043300        MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1164.2 247 79 441
   000432      1  043400        MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1164.2 252 79 441
   000433      1  043500        MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1164.2 261 79 441
   000434      1  043600        MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1164.2 273 79 441
   000435      1  043700        MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1164.2 225 79 441
   000436      1  043800        MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1164.2 230 79 441
   000437      1  043900        MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM D-WRT-LN         IX1164.2 317 79 441
   000438      1  044000        MOVE DUMMY-HOLD TO DUMMY-RECORD                           IX1164.2 244 79
   000439      1  044100        MOVE ZERO TO RECORD-COUNT.                                IX1164.2 IMP 245
   000440         044200     PERFORM D-WRT-LN.                                            IX1164.2 441
   000441         044300 D-WRT-LN.                                                        IX1164.2
   000442         044400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1164.2 79
   000443         044500     MOVE SPACE TO DUMMY-RECORD.                                  IX1164.2 IMP 79
   000444         044600 D-FAIL-ROUTINE.                                                  IX1164.2
   000445         044700     IF   COMPUTED-X NOT EQUAL TO SPACE                           IX1164.2 200 IMP
   000446      1  044800          GO TO D-FAIL-ROUTINE-WRITE.                             IX1164.2 453
   000447         044900     IF   CORRECT-X NOT EQUAL TO SPACE GO TO D-FAIL-ROUTINE-WRITE.IX1164.2 214 IMP 453
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448         045000     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1164.2 246 316
   000449         045100     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    IX1164.2 311
   000450         045200     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1164.2 308 79 425
   000451         045300     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1164.2 IMP 316
   000452         045400     GO TO D-FAIL-ROUTINE-EX.                                     IX1164.2 458
   000453         045500 D-FAIL-ROUTINE-WRITE.                                            IX1164.2
   000454         045600     MOVE TEST-COMPUTED TO PRINT-REC PERFORM D-WRITE-LINE         IX1164.2 196 77 425
   000455         045700     MOVE ANSI-REFERENCE TO COR-ANSI-REFERENCE.                   IX1164.2 246 224
   000456         045800     MOVE TEST-CORRECT TO PRINT-REC PERFORM D-WRITE-LINE 2 TIMES. IX1164.2 211 77 425
   000457         045900     MOVE SPACES TO COR-ANSI-REFERENCE.                           IX1164.2 IMP 224
   000458         046000 D-FAIL-ROUTINE-EX. EXIT.                                         IX1164.2
   000459         046100 D-BAIL-OUT.                                                      IX1164.2
   000460         046200     IF  COMPUTED-A NOT EQUAL TO SPACE GO TO D-BAIL-OUT-WRITE.    IX1164.2 201 IMP 462
   000461         046300     IF  CORRECT-A EQUAL TO SPACE GO TO D-BAIL-OUT-EX.            IX1164.2 215 IMP 467
   000462         046400 D-BAIL-OUT-WRITE.                                                IX1164.2
   000463         046500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1164.2 215 315 201 313
   000464         046600     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1164.2 246 316
   000465         046700     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1164.2 308 79 425
   000466         046800     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1164.2 IMP 316
   000467         046900 D-BAIL-OUT-EX. EXIT.                                             IX1164.2
   000468         047000 DECL-EXIT.  EXIT.                                                IX1164.2
   000469         047100 END DECLARATIVES.                                                IX1164.2
   000470         047200                                                                  IX1164.2
   000471         047300                                                                  IX1164.2
   000472         047400 CCVS1 SECTION.                                                   IX1164.2
   000473         047500 OPEN-FILES.                                                      IX1164.2
   000474         047600     OPEN I-O RAW-DATA.                                           IX1164.2 59
   000475         047700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1164.2 324 62
   000476         047800     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1164.2 59 482
   000477         047900     MOVE "ABORTED " TO C-ABORT.                                  IX1164.2 73
   000478         048000     ADD 1 TO C-NO-OF-TESTS.                                      IX1164.2 65
   000479         048100     ACCEPT C-DATE  FROM DATE.                                    IX1164.2 63
   000480         048200     ACCEPT C-TIME  FROM TIME.                                    IX1164.2 64
   000481         048300     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1164.2 61 482
   000482         048400 END-E-1.                                                         IX1164.2
   000483         048500     CLOSE RAW-DATA.                                              IX1164.2 59
   000484         048600     OPEN    OUTPUT PRINT-FILE.                                   IX1164.2 75
   000485         048700     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1164.2 324 264 324 283
   000486         048800     MOVE    SPACE TO TEST-RESULTS.                               IX1164.2 IMP 184
   000487         048900     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1164.2 531 536
   000488         049000     MOVE    ZERO TO REC-SKL-SUB.                                 IX1164.2 IMP 236
   000489         049100     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1164.2 490
   000490         049200 CCVS-INIT-FILE.                                                  IX1164.2
   000491         049300     ADD     1 TO REC-SKL-SUB.                                    IX1164.2 236
   000492         049400     MOVE    FILE-RECORD-INFO-SKELETON                            IX1164.2 133
   000493         049500          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1164.2 147 236
   000494         049600 CCVS-INIT-EXIT.                                                  IX1164.2
   000495         049700     GO TO CCVS1-EXIT.                                            IX1164.2 618
   000496         049800 CLOSE-FILES.                                                     IX1164.2
   000497         049900     OPEN I-O RAW-DATA.                                           IX1164.2 59
   000498         050000     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1164.2 324 62
   000499         050100     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1164.2 59 507
   000500         050200     MOVE "OK.     " TO C-ABORT.                                  IX1164.2 73
   000501         050300     MOVE PASS-COUNTER TO C-OK.                                   IX1164.2 241 66
   000502         050400     MOVE ERROR-HOLD   TO C-ALL.                                  IX1164.2 243 67
   000503         050500     MOVE ERROR-COUNTER TO C-FAIL.                                IX1164.2 239 68
   000504         050600     MOVE DELETE-COUNTER TO C-DELETED.                            IX1164.2 238 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000505         050700     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1164.2 240 70
   000506         050800     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1164.2 61 507
   000507         050900 END-E-2.                                                         IX1164.2
   000508         051000     CLOSE RAW-DATA.                                              IX1164.2 59
   000509         051100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1164.2 540 561 75
   000510         051200 TERMINATE-CCVS.                                                  IX1164.2
   000511         051300     EXIT PROGRAM.                                                IX1164.2
   000512         051400 TERMINATE-CALL.                                                  IX1164.2
   000513         051500     STOP     RUN.                                                IX1164.2
   000514         051600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1164.2 188 240
   000515         051700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1164.2 188 241
   000516         051800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1164.2 188 239
   000517         051900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1164.2 188 238
   000518         052000     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1164.2 195
   000519         052100 PRINT-DETAIL.                                                    IX1164.2
   000520         052200     IF REC-CT NOT EQUAL TO ZERO                                  IX1164.2 237 IMP
   000521      1  052300             MOVE "." TO PARDOT-X                                 IX1164.2 192
   000522      1  052400             MOVE REC-CT TO DOTVALUE.                             IX1164.2 237 193
   000523         052500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1164.2 184 77 573
   000524         052600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1164.2 188 573
   000525      1  052700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1164.2 594 608
   000526      1  052800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1164.2 609 617
   000527         052900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1164.2 IMP 188 IMP 200
   000528         053000     MOVE SPACE TO CORRECT-X.                                     IX1164.2 IMP 214
   000529         053100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1164.2 237 IMP IMP 190
   000530         053200     MOVE     SPACE TO RE-MARK.                                   IX1164.2 IMP 195
   000531         053300 HEAD-ROUTINE.                                                    IX1164.2
   000532         053400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1164.2 247 79 573
   000533         053500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1164.2 252 79 573
   000534         053600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1164.2 261 79 573
   000535         053700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1164.2 273 79 573
   000536         053800 COLUMN-NAMES-ROUTINE.                                            IX1164.2
   000537         053900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1164.2 225 79 573
   000538         054000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1164.2 230 79 573
   000539         054100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1164.2 317 79 573
   000540         054200 END-ROUTINE.                                                     IX1164.2
   000541         054300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1164.2 317 79 573
   000542         054400 END-RTN-EXIT.                                                    IX1164.2
   000543         054500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1164.2 280 79 573
   000544         054600 END-ROUTINE-1.                                                   IX1164.2
   000545         054700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1164.2 239 243 240
   000546         054800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1164.2 243 238 243
   000547         054900      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1164.2 241 243
   000548         055000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1164.2
   000549         055100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1164.2 241 303
   000550         055200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1164.2 243 305
   000551         055300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1164.2 302 288
   000552         055400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1164.2 285 79 573
   000553         055500  END-ROUTINE-12.                                                 IX1164.2
   000554         055600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1164.2 291
   000555         055700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1164.2 239 IMP
   000556      1  055800         MOVE "NO " TO ERROR-TOTAL                                IX1164.2 289
   000557         055900         ELSE                                                     IX1164.2
   000558      1  056000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1164.2 239 289
   000559         056100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1164.2 285 79
   000560         056200     PERFORM WRITE-LINE.                                          IX1164.2 573
   000561         056300 END-ROUTINE-13.                                                  IX1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000562         056400     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1164.2 238 IMP
   000563      1  056500         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1164.2 289
   000564      1  056600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1164.2 238 289
   000565         056700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1164.2 291
   000566         056800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1164.2 285 79 573
   000567         056900      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1164.2 240 IMP
   000568      1  057000          MOVE "NO " TO ERROR-TOTAL                               IX1164.2 289
   000569      1  057100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1164.2 240 289
   000570         057200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1164.2 291
   000571         057300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1164.2 285 79 573
   000572         057400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1164.2 293 79 573
   000573         057500 WRITE-LINE.                                                      IX1164.2
   000574         057600     ADD 1 TO RECORD-COUNT.                                       IX1164.2 245
   000575         057700     IF RECORD-COUNT GREATER 42                                   IX1164.2 245
   000576      1  057800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1164.2 79 244
   000577      1  057900         MOVE SPACE TO DUMMY-RECORD                               IX1164.2 IMP 79
   000578      1  058000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1164.2 79
   000579      1  058100         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1164.2 247 79 589
   000580      1  058200         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1164.2 252 79 589
   000581      1  058300         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1164.2 261 79 589
   000582      1  058400         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1164.2 273 79 589
   000583      1  058500         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1164.2 225 79 589
   000584      1  058600         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1164.2 230 79 589
   000585      1  058700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1164.2 317 79 589
   000586      1  058800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1164.2 244 79
   000587      1  058900         MOVE ZERO TO RECORD-COUNT.                               IX1164.2 IMP 245
   000588         059000     PERFORM WRT-LN.                                              IX1164.2 589
   000589         059100 WRT-LN.                                                          IX1164.2
   000590         059200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1164.2 79
   000591         059300     MOVE SPACE TO DUMMY-RECORD.                                  IX1164.2 IMP 79
   000592         059400 BLANK-LINE-PRINT.                                                IX1164.2
   000593         059500     PERFORM WRT-LN.                                              IX1164.2 589
   000594         059600 FAIL-ROUTINE.                                                    IX1164.2
   000595         059700     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1164.2 200 IMP
   000596      1  059800            GO TO   FAIL-ROUTINE-WRITE.                           IX1164.2 603
   000597         059900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1164.2 214 IMP 603
   000598         060000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1164.2 246 316
   000599         060100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1164.2 311
   000600         060200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1164.2 308 79 573
   000601         060300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1164.2 IMP 316
   000602         060400     GO TO  FAIL-ROUTINE-EX.                                      IX1164.2 608
   000603         060500 FAIL-ROUTINE-WRITE.                                              IX1164.2
   000604         060600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1164.2 196 77 573
   000605         060700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1164.2 246 224
   000606         060800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1164.2 211 77 573
   000607         060900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1164.2 IMP 224
   000608         061000 FAIL-ROUTINE-EX. EXIT.                                           IX1164.2
   000609         061100 BAIL-OUT.                                                        IX1164.2
   000610         061200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1164.2 201 IMP 612
   000611         061300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1164.2 215 IMP 617
   000612         061400 BAIL-OUT-WRITE.                                                  IX1164.2
   000613         061500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1164.2 215 315 201 313
   000614         061600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1164.2 246 316
   000615         061700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1164.2 308 79 573
   000616         061800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1164.2 IMP 316
   000617         061900 BAIL-OUT-EX. EXIT.                                               IX1164.2
   000618         062000 CCVS1-EXIT.                                                      IX1164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000619         062100     EXIT.                                                        IX1164.2
   000620         062200                                                                  IX1164.2
   000621         062300 SECT-IX116A-0003 SECTION.                                        IX1164.2
   000622         062400 SEQ-INIT-010.                                                    IX1164.2
   000623         062500     MOVE ZERO TO TEST-NO.                                        IX1164.2 IMP 323
   000624         062600     MOVE "IX-FS3" TO XFILE-NAME (1).                             IX1164.2 150
   000625         062700     MOVE "R1-F-G" TO XRECORD-NAME (1).                           IX1164.2 152
   000626         062800     MOVE CCVS-PGM-ID TO XPROGRAM-NAME (1).                       IX1164.2 324 162
   000627         062900     MOVE 000240 TO XRECORD-LENGTH (1).                           IX1164.2 164
   000628         063000     MOVE "RC" TO CHARS-OR-RECORDS (1).                           IX1164.2 166
   000629         063100     MOVE 0002 TO XBLOCK-SIZE (1).                                IX1164.2 168
   000630         063200     MOVE 000050 TO RECORDS-IN-FILE (1).                          IX1164.2 170
   000631         063300     MOVE "IX" TO XFILE-ORGANIZATION (1).                         IX1164.2 172
   000632         063400     MOVE "S" TO XLABEL-TYPE (1).                                 IX1164.2 174
   000633         063500     MOVE 000001 TO XRECORD-NUMBER (1).                           IX1164.2 156
   000634         063600     MOVE 0 TO COUNT-OF-RECS.                                     IX1164.2 128
   000635         063700                                                                  IX1164.2
   000636         063900*   TEST  1                                                      *IX1164.2
   000637         064000*         OPEN OUTPUT ...                 00 EXPECTED            *IX1164.2
   000638         064100*         IX-3, 1.3.4 (1) A                                      *IX1164.2
   000639         064200*    STATUS 00 CHECK ON OUTPUT FILE IX-FS3                       *IX1164.2
   000640         064300*    THE OUTPUT STATEMENT IS SUCCESSFULLY EXECUTED               *IX1164.2
   000641         064500 OPN-INIT-GF-01-0.                                                IX1164.2
   000642         064600     MOVE 1 TO STATUS-TEST-00.                                    IX1164.2 119
   000643         064700     MOVE SPACES TO IX-FS3-STATUS.                                IX1164.2 IMP 124
   000644         064800     MOVE "OPEN I-O   : 00 EXP." TO FEATURE.                      IX1164.2 186
   000645         064900     MOVE "OPN-TEST-GF-01-0" TO PAR-NAME.                         IX1164.2 190
   000646         065000     OPEN                                                         IX1164.2
   000647         065100        I-O    IX-FS3.                                            IX1164.2 81
   000648         065200     IF IX-FS3-STATUS EQUAL TO "00"                               IX1164.2 124
   000649      1  065300         GO TO OPN-PASS-GF-01-0.                                  IX1164.2 656
   000650         065400 OPN-FAIL-GF-01-0.                                                IX1164.2
   000651         065500     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1164.2 195
   000652         065600     PERFORM FAIL.                                                IX1164.2 516
   000653         065700     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1164.2 124 201
   000654         065800     MOVE "00" TO CORRECT-X.                                      IX1164.2 214
   000655         065900     GO TO OPN-WRITE-GF-01-0.                                     IX1164.2 658
   000656         066000 OPN-PASS-GF-01-0.                                                IX1164.2
   000657         066100     PERFORM PASS.                                                IX1164.2 515
   000658         066200 OPN-WRITE-GF-01-0.                                               IX1164.2
   000659         066300     PERFORM PRINT-DETAIL.                                        IX1164.2 519
   000660         066500*   TEST  4                                                      *IX1164.2
   000661         066600*         CLOSE I-O                       00 EXPECTED            *IX1164.2
   000662         066700*         IX-3, 1.3.4 (1) A                                      *IX1164.2
   000663         066900 CLO-INIT-GF-01-0.                                                IX1164.2
   000664         067000     MOVE SPACES TO IX-FS3-STATUS.                                IX1164.2 IMP 124
   000665         067100     MOVE "CLOSE I-O   :00 EXP." TO FEATURE.                      IX1164.2 186
   000666         067200     MOVE "CLO-TEST-GF-01-0" TO PAR-NAME.                         IX1164.2 190
   000667         067300 CLO-TEST-GF-01-0.                                                IX1164.2
   000668         067400     CLOSE IX-FS3.                                                IX1164.2 81
   000669         067500     IF IX-FS3-STATUS = "00"                                      IX1164.2 124
   000670      1  067600         GO TO CLO-PASS-GF-01-0.                                  IX1164.2 677
   000671         067700 CLO-FAIL-GF-01-0.                                                IX1164.2
   000672         067800     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1164.2 195
   000673         067900     PERFORM FAIL.                                                IX1164.2 516
   000674         068000     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1164.2 124 201
   000675         068100     MOVE "00" TO CORRECT-X.                                      IX1164.2 214
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000676         068200     GO TO CLO-WRITE-GF-01-0.                                     IX1164.2 679
   000677         068300 CLO-PASS-GF-01-0.                                                IX1164.2
   000678         068400     PERFORM PASS.                                                IX1164.2 515
   000679         068500 CLO-WRITE-GF-01-0.                                               IX1164.2
   000680         068600     PERFORM PRINT-DETAIL.                                        IX1164.2 519
   000681         068700                                                                  IX1164.2
   000682         068900*    A INDEXED FILE WITH 50 RECORDS HAS BEEN CREATED.            *IX1164.2
   000683         069100                                                                  IX1164.2
   000684         069300*   TEST  5                                                      *IX1164.2
   000685         069400*         DELETE....  FILE NOT IN THE OPEN MODE                  *IX1164.2
   000686         069500*         FILE STATUS 49 EXPECTED IX-5, 1.3.4 (5) H              *IX1164.2
   000687         069700 DEL-TEST-GF-01-0.                                                IX1164.2
   000688         069800     MOVE  5 TO TEST-NO.                                          IX1164.2 323
   000689         069900     MOVE SPACES TO IX-FS3-STATUS.                                IX1164.2 IMP 124
   000690         070000     MOVE "DELETE       49 EXP." TO FEATURE                       IX1164.2 186
   000691         070100     MOVE "DEL-TEST-GF-01-0" TO PAR-NAME.                         IX1164.2 190
   000692         070200     DELETE IX-FS3 RECORD.                                        IX1164.2 81
   000693         070300 DEL-TEST-GF-01-1.                                                IX1164.2
   000694         070400     IF IX-FS3-STATUS EQUAL TO "49"                               IX1164.2 124
   000695      1  070500        MOVE "SHOULD HAVE EXECUTED DECLARATIVES IX-3,1.3.4(4)"    IX1164.2
   000696      1  070600          TO RE-MARK                                              IX1164.2 195
   000697      1  070700        GO TO DEL-WRITE-GF-01-0.                                  IX1164.2 700
   000698         070800 DEL-FAIL-GF-01-0.                                                IX1164.2
   000699         070900     MOVE "IX-5, 1.3.4, (5) H" TO RE-MARK.                        IX1164.2 195
   000700         071000 DEL-WRITE-GF-01-0.                                               IX1164.2
   000701         071100     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1164.2 124 201
   000702         071200     MOVE "49" TO CORRECT-X.                                      IX1164.2 214
   000703         071300     PERFORM FAIL.                                                IX1164.2 516
   000704         071400     PERFORM PRINT-DETAIL.                                        IX1164.2 519
   000705         071500                                                                  IX1164.2
   000706         071600 TERMINATE-ROUTINE.                                               IX1164.2
   000707         071700     EXIT.                                                        IX1164.2
   000708         071800                                                                  IX1164.2
   000709         071900 CCVS-EXIT SECTION.                                               IX1164.2
   000710         072000 CCVS-999999.                                                     IX1164.2
   000711         072100     GO TO CLOSE-FILES.                                           IX1164.2 496
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      179   ALTERNATE-KEY1
      181   ALTERNATE-KEY2
      246   ANSI-REFERENCE . . . . . . . .  448 455 464 598 605 614
       73   C-ABORT. . . . . . . . . . . .  M358 M477 M500
       67   C-ALL. . . . . . . . . . . . .  M360 M502
       63   C-DATE . . . . . . . . . . . .  M479
       69   C-DELETED. . . . . . . . . . .  M362 M504
       68   C-FAIL . . . . . . . . . . . .  M361 M503
       72   C-INDENT
       70   C-INSPECT. . . . . . . . . . .  M363 M505
       65   C-NO-OF-TESTS. . . . . . . . .  M478
       71   C-NOTE
       66   C-OK . . . . . . . . . . . . .  M359 M501
       64   C-TIME . . . . . . . . . . . .  M480
      225   CCVS-C-1 . . . . . . . . . . .  435 537 583
      230   CCVS-C-2 . . . . . . . . . . .  436 538 584
      280   CCVS-E-1 . . . . . . . . . . .  394 543
      285   CCVS-E-2 . . . . . . . . . . .  403 410 417 423 552 559 566 571
      288   CCVS-E-2-2 . . . . . . . . . .  M402 M551
      293   CCVS-E-3 . . . . . . . . . . .  424 572
      302   CCVS-E-4 . . . . . . . . . . .  402 551
      303   CCVS-E-4-1 . . . . . . . . . .  M400 M549
      305   CCVS-E-4-2 . . . . . . . . . .  M401 M550
      247   CCVS-H-1 . . . . . . . . . . .  431 532 579
      252   CCVS-H-2A. . . . . . . . . . .  432 533 580
      261   CCVS-H-2B. . . . . . . . . . .  433 534 581
      273   CCVS-H-3 . . . . . . . . . . .  434 535 582
      324   CCVS-PGM-ID. . . . . . . . . .  356 475 485 485 498 626
      166   CHARS-OR-RECORDS . . . . . . .  M628
      207   CM-18V0
      201   COMPUTED-A . . . . . . . . . .  202 204 205 206 207 M345 460 463 610 613 M653 M674 M701
      202   COMPUTED-N
      200   COMPUTED-X . . . . . . . . . .  M386 445 M527 595
      204   COMPUTED-0V18
      206   COMPUTED-14V4
      208   COMPUTED-18V0
      205   COMPUTED-4V14
      224   COR-ANSI-REFERENCE . . . . . .  M455 M457 M605 M607
      215   CORRECT-A. . . . . . . . . . .  216 217 218 219 220 461 463 611 613
      216   CORRECT-N
      214   CORRECT-X. . . . . . . . . . .  M346 M387 447 M528 597 M654 M675 M702
      217   CORRECT-0V18
      219   CORRECT-14V4
      221   CORRECT-18V0
      218   CORRECT-4V14
      130   COUNT-OF-RECORDS
      128   COUNT-OF-RECS. . . . . . . . .  130 M634
      220   CR-18V0
      238   DELETE-COUNTER . . . . . . . .  362 398 413 415 504 M517 546 562 564
      193   DOTVALUE . . . . . . . . . . .  M378 M522
      244   DUMMY-HOLD . . . . . . . . . .  M428 438 M576 586
       79   DUMMY-RECORD . . . . . . . . .  M391 M394 M403 M410 M417 M423 M424 428 M429 430 M431 M432 M433 M434 M435 M436
                                            M437 M438 442 M443 M450 M465 M532 M533 M534 M535 M537 M538 M539 M541 M543 M552
                                            M559 M566 M571 M572 576 M577 578 M579 M580 M581 M582 M583 M584 M585 M586 590
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    17
0 Defined   Cross-reference of data names   References

0                                           M591 M600 M615
      291   ENDER-DESC . . . . . . . . . .  M405 M416 M422 M554 M565 M570
      111   EOF-FLAG . . . . . . . . . . .  M336
      239   ERROR-COUNTER. . . . . . . . .  361 M374 397 406 409 503 M516 545 555 558
      115   ERROR-FLAG
      243   ERROR-HOLD . . . . . . . . . .  360 M397 M398 M398 M399 401 502 M545 M546 M546 M547 550
      289   ERROR-TOTAL. . . . . . . . . .  M407 M409 M414 M415 M420 M421 M556 M558 M563 M564 M568 M569
      186   FEATURE. . . . . . . . . . . .  M644 M665 M690
      147   FILE-RECORD-INFO . . . . . . .  M493
      148   FILE-RECORD-INFO-P1-120
      175   FILE-RECORD-INFO-P121-240
      133   FILE-RECORD-INFO-SKELETON. . .  492
      132   FILE-RECORD-INFORMATION-REC
       99   GRP-0101
      101   GRP-0101-KEY
      104   GRP-0102
      106   GRP-0102-KEY
      317   HYPHEN-LINE. . . . . . . . . .  391 437 539 541 585
      283   ID-AGAIN . . . . . . . . . . .  M485
      316   INF-ANSI-REFERENCE . . . . . .  M448 M451 M464 M466 M598 M601 M614 M616
      311   INFO-TEXT. . . . . . . . . . .  M449 M599
      240   INSPECT-COUNTER. . . . . . . .  363 397 419 421 505 M514 545 567 569
       81   IX-FS3 . . . . . . . . . . . .  48 330 647 668 M692
       93   IX-FS3-ALTER-KEY
       91   IX-FS3-KEY . . . . . . . . . .  52
       88   IX-FS3-REC-120
       89   IX-FS3-REC-120-240
      124   IX-FS3-STATUS. . . . . . . . .  53 342 345 M643 648 653 M664 669 674 M689 694 701
      125   IX-FS3-STAT1 . . . . . . . . .  335 338
      126   IX-FS3-STAT2
       87   IX-FS3R1-F-G-240
      160   ODO-NUMBER
      188   P-OR-F . . . . . . . . . . . .  M373 M374 381 M386 M514 M515 M516 M517 524 M527
      190   PAR-NAME . . . . . . . . . . .  M388 M529 M645 M666 M691
      192   PARDOT-X . . . . . . . . . . .  M377 M521
      241   PASS-COUNTER . . . . . . . . .  359 M373 399 400 501 M515 547 549
      117   PERM-ERRORS. . . . . . . . . .  M339
       75   PRINT-FILE . . . . . . . . . .  45 368 484 509
       77   PRINT-REC. . . . . . . . . . .  M379 M454 M456 M523 M604 M606
       59   RAW-DATA . . . . . . . . . . .  39 355 357 366 474 476 483 497 499 508
       62   RAW-DATA-KEY . . . . . . . . .  43 M356 M475 M498
       61   RAW-DATA-SATZ. . . . . . . . .  364 481 506
      195   RE-MARK. . . . . . . . . . . .  M347 M389 M518 M530 M651 M672 M696 M699
      237   REC-CT . . . . . . . . . . . .  376 378 388 520 522 529
      236   REC-SKL-SUB. . . . . . . . . .  M488 M491 493
      245   RECORD-COUNT . . . . . . . . .  M426 427 M439 M574 575 M587
      113   RECORDS-IN-ERROR
      170   RECORDS-IN-FILE. . . . . . . .  M630
      154   REELUNIT-NUMBER
      122   STATUS-TEST-READ
      119   STATUS-TEST-00 . . . . . . . .  M642
      121   STATUS-TEST-10 . . . . . . . .  334
      196   TEST-COMPUTED. . . . . . . . .  454 604
      211   TEST-CORRECT . . . . . . . . .  456 606
      264   TEST-ID. . . . . . . . . . . .  M485
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    18
0 Defined   Cross-reference of data names   References

0     323   TEST-NO. . . . . . . . . . . .  332 M623 M688
      184   TEST-RESULTS . . . . . . . . .  379 M486 523
      242   TOTAL-ERROR
      158   UPDATE-NUMBER
      109   WRK-CS-09V00
      168   XBLOCK-SIZE. . . . . . . . . .  M629
      150   XFILE-NAME . . . . . . . . . .  M624
      172   XFILE-ORGANIZATION . . . . . .  M631
      174   XLABEL-TYPE. . . . . . . . . .  M632
      162   XPROGRAM-NAME. . . . . . . . .  M626
      177   XRECORD-KEY
      164   XRECORD-LENGTH . . . . . . . .  M627
      152   XRECORD-NAME . . . . . . . . .  M625
      156   XRECORD-NUMBER . . . . . . . .  M633
      313   XXCOMPUTED . . . . . . . . . .  M463 M613
      315   XXCORRECT. . . . . . . . . . .  M463 M613
      308   XXINFO . . . . . . . . . . . .  450 465 600 615
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    19
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

      609   BAIL-OUT . . . . . . . . . . .  P526
      617   BAIL-OUT-EX. . . . . . . . . .  E526 G611
      612   BAIL-OUT-WRITE . . . . . . . .  G610
      592   BLANK-LINE-PRINT
      709   CCVS-EXIT
      494   CCVS-INIT-EXIT
      490   CCVS-INIT-FILE . . . . . . . .  P489
      710   CCVS-999999
      472   CCVS1
      618   CCVS1-EXIT . . . . . . . . . .  G495
      671   CLO-FAIL-GF-01-0
      663   CLO-INIT-GF-01-0
      677   CLO-PASS-GF-01-0 . . . . . . .  G670
      667   CLO-TEST-GF-01-0
      679   CLO-WRITE-GF-01-0. . . . . . .  G676
      496   CLOSE-FILES. . . . . . . . . .  G711
      536   COLUMN-NAMES-ROUTINE . . . . .  E487
      459   D-BAIL-OUT . . . . . . . . . .  P385
      467   D-BAIL-OUT-EX. . . . . . . . .  E385 G461
      462   D-BAIL-OUT-WRITE . . . . . . .  G460
      344   D-C-FAIL-GF-01-0
      350   D-C-PASS-GF-01-0 . . . . . . .  G343
      341   D-C-TEST-GF-01-1 . . . . . . .  G333
      352   D-C-WRITE-GF-01-0. . . . . . .  G349
      354   D-CLOSE-FILES
      365   D-END-E-2. . . . . . . . . . .  G357 G364
      390   D-END-ROUTINE. . . . . . . . .  P367
      396   D-END-ROUTINE-1
      404   D-END-ROUTINE-12
      412   D-END-ROUTINE-13 . . . . . . .  E367
      393   D-END-RTN-EXIT
      374   D-FAIL . . . . . . . . . . . .  P348
      444   D-FAIL-ROUTINE . . . . . . . .  P383
      458   D-FAIL-ROUTINE-EX. . . . . . .  E383 G452
      453   D-FAIL-ROUTINE-WRITE . . . . .  G446 G447
      373   D-PASS . . . . . . . . . . . .  P351
      375   D-PRINT-DETAIL . . . . . . . .  P353
      371   D-TERMINATE-CALL
      369   D-TERMINATE-CCVS
      425   D-WRITE-LINE . . . . . . . . .  P380 P382 P392 P395 P403 P411 P418 P423 P424 P450 P454 P456 P465
      441   D-WRT-LN . . . . . . . . . . .  P431 P432 P433 P434 P435 P436 P437 P440
      517   DE-LETE
      468   DECL-EXIT. . . . . . . . . . .  G340
      698   DEL-FAIL-GF-01-0
      687   DEL-TEST-GF-01-0
      693   DEL-TEST-GF-01-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    20
0 Defined   Cross-reference of procedures   References

0     700   DEL-WRITE-GF-01-0. . . . . . .  G697
      482   END-E-1. . . . . . . . . . . .  G476 G481
      507   END-E-2. . . . . . . . . . . .  G499 G506
      540   END-ROUTINE. . . . . . . . . .  P509
      544   END-ROUTINE-1
      553   END-ROUTINE-12
      561   END-ROUTINE-13 . . . . . . . .  E509
      542   END-RTN-EXIT
      516   FAIL . . . . . . . . . . . . .  P652 P673 P703
      594   FAIL-ROUTINE . . . . . . . . .  P525
      608   FAIL-ROUTINE-EX. . . . . . . .  E525 G602
      603   FAIL-ROUTINE-WRITE . . . . . .  G596 G597
      531   HEAD-ROUTINE . . . . . . . . .  P487
      331   INPUT-PROCESS
      514   INSPT
      473   OPEN-FILES
      650   OPN-FAIL-GF-01-0
      641   OPN-INIT-GF-01-0
      656   OPN-PASS-GF-01-0 . . . . . . .  G649
      658   OPN-WRITE-GF-01-0. . . . . . .  G655
      515   PASS . . . . . . . . . . . . .  P657 P678
      519   PRINT-DETAIL . . . . . . . . .  P659 P680 P704
      329   SECT-IX105-0002
      621   SECT-IX116A-0003
      622   SEQ-INIT-010
      512   TERMINATE-CALL
      510   TERMINATE-CCVS
      706   TERMINATE-ROUTINE
      573   WRITE-LINE . . . . . . . . . .  P523 P524 P532 P533 P534 P535 P537 P538 P539 P541 P543 P552 P560 P566 P571 P572
                                            P600 P604 P606 P615
      589   WRT-LN . . . . . . . . . . . .  P579 P580 P581 P582 P583 P584 P585 P588 P593
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    21
0 Defined   Cross-reference of programs     References

        3   IX116A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX116A    Date 06/04/2022  Time 11:59:08   Page    22
0LineID  Message code  Message text

     75  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     81  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     81  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX116A:
 *    Source records = 711
 *    Data Division statements = 120
 *    Procedure Division statements = 357
 *    Generated COBOL statements = 0
 *    Program complexity factor = 365
0End of compilation 1,  program IX116A,  highest severity 0.
0Return code 0
