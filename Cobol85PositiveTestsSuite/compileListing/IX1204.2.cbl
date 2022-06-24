1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:10   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:10   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1204.2
   000002         000200 PROGRAM-ID.                                                      IX1204.2
   000003         000300     IX120A.                                                      IX1204.2
   000004         000500*                                                              *  IX1204.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1204.2
   000006         000700*                                                              *  IX1204.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1204.2
   000008         000900*                                                              *  IX1204.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1204.2
   000010         001100*                                                              *  IX1204.2
   000011         001300*                                                                 IX1204.2
   000012         001400*    THIS ROUTINE USES THE MASS STORAGE FILE IX-FS3 CREATED IN    IX1204.2
   000013         001500*    IX113A.                                                      IX1204.2
   000014         001600*    THE FILE IS OPENED I-O AND THE STATUS CHECKED (00 EXPECTED), IX1204.2
   000015         001700*    THE FILE IS THEN READ UNTIL THE AT END CONDITION IS REACHED  IX1204.2
   000016         001800*    AND THEN READ ONCE MORE.  AN ATTEMPT IS THEN MADE TO REWRITE IX1204.2
   000017         001900*    A RECORD, AT WHICH POINT THE DECLARATIVES                    IX1204.2
   000018         002000*    SHOULD BE ACTIONED AND THE FILE STATUS SHOULD BE 43 .        IX1204.2
   000019         002100*                                                                 IX1204.2
   000020         002200*    STANDARD REFERENCE IX-5, 1.3.4 (5) C                         IX1204.2
   000021         002300*                                                                 IX1204.2
   000022         002400*    X-CARDS USED IN THIS PROGRAM:                                IX1204.2
   000023         002500*                                                                 IX1204.2
   000024         002600*                 XXXXX024                                        IX1204.2
   000025         002700*                 XXXXX055.                                       IX1204.2
   000026         002800*         P       XXXXX062.                                       IX1204.2
   000027         002900*                 XXXXX082.                                       IX1204.2
   000028         003000*                 XXXXX083.                                       IX1204.2
   000029         003100*         C       XXXXX084                                        IX1204.2
   000030         003200*                                                                 IX1204.2
   000031         003300*                                                                 IX1204.2
   000032         003400 ENVIRONMENT DIVISION.                                            IX1204.2
   000033         003500 CONFIGURATION SECTION.                                           IX1204.2
   000034         003600 SOURCE-COMPUTER.                                                 IX1204.2
   000035         003700     XXXXX082.                                                    IX1204.2
   000036         003800 OBJECT-COMPUTER.                                                 IX1204.2
   000037         003900     XXXXX083.                                                    IX1204.2
   000038         004000 INPUT-OUTPUT SECTION.                                            IX1204.2
   000039         004100 FILE-CONTROL.                                                    IX1204.2
   000040         004200     SELECT RAW-DATA   ASSIGN TO                                  IX1204.2 60
   000041         004300     XXXXX062                                                     IX1204.2
   000042         004400            ORGANIZATION IS INDEXED                               IX1204.2
   000043         004500            ACCESS MODE IS RANDOM                                 IX1204.2
   000044         004600            RECORD KEY IS RAW-DATA-KEY.                           IX1204.2 63
   000045         004700*                                                                 IX1204.2
   000046         004800     SELECT PRINT-FILE ASSIGN TO                                  IX1204.2 76
   000047         004900     XXXXX055.                                                    IX1204.2
   000048         005000*                                                                 IX1204.2
   000049         005100     SELECT IX-FS3 ASSIGN                                         IX1204.2 82
   000050         005200     XXXXX024                                                     IX1204.2
   000051         005300     ORGANIZATION IS INDEXED                                      IX1204.2
   000052         005400     ACCESS MODE IS SEQUENTIAL                                    IX1204.2
   000053         005500     RECORD KEY IS IX-FS3-KEY                                     IX1204.2 92
   000054         005600     FILE STATUS IS IX-FS3-STATUS.                                IX1204.2 125
   000055         005700                                                                  IX1204.2
   000056         005800 DATA DIVISION.                                                   IX1204.2
   000057         005900                                                                  IX1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000 FILE SECTION.                                                    IX1204.2
   000059         006100                                                                  IX1204.2
   000060         006200 FD  RAW-DATA.                                                    IX1204.2
   000061         006300                                                                  IX1204.2
   000062         006400 01  RAW-DATA-SATZ.                                               IX1204.2
   000063         006500     05  RAW-DATA-KEY        PIC X(6).                            IX1204.2
   000064         006600     05  C-DATE              PIC 9(6).                            IX1204.2
   000065         006700     05  C-TIME              PIC 9(8).                            IX1204.2
   000066         006800     05  C-NO-OF-TESTS       PIC 99.                              IX1204.2
   000067         006900     05  C-OK                PIC 999.                             IX1204.2
   000068         007000     05  C-ALL               PIC 999.                             IX1204.2
   000069         007100     05  C-FAIL              PIC 999.                             IX1204.2
   000070         007200     05  C-DELETED           PIC 999.                             IX1204.2
   000071         007300     05  C-INSPECT           PIC 999.                             IX1204.2
   000072         007400     05  C-NOTE              PIC X(13).                           IX1204.2
   000073         007500     05  C-INDENT            PIC X.                               IX1204.2
   000074         007600     05  C-ABORT             PIC X(8).                            IX1204.2
   000075         007700                                                                  IX1204.2
   000076         007800 FD  PRINT-FILE.                                                  IX1204.2

 ==000076==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000077         007900                                                                  IX1204.2
   000078         008000 01  PRINT-REC               PIC X(120).                          IX1204.2
   000079         008100                                                                  IX1204.2
   000080         008200 01  DUMMY-RECORD            PIC X(120).                          IX1204.2
   000081         008300                                                                  IX1204.2
   000082         008400 FD  IX-FS3                                                       IX1204.2

 ==000082==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000082==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000083         008500        DATA RECORDS IX-FS3R1-F-G-240                             IX1204.2 *
   000084         008600        LABEL RECORD STANDARD                                     IX1204.2
   000085         008700        RECORD 240                                                IX1204.2
   000086         008800        BLOCK CONTAINS 2 RECORDS.                                 IX1204.2
   000087         008900                                                                  IX1204.2
   000088         009000 01  IX-FS3R1-F-G-240.                                            IX1204.2
   000089         009100     05  IX-FS3-REC-120      PIC X(120).                          IX1204.2
   000090         009200     05  IX-FS3-REC-120-240.                                      IX1204.2
   000091         009300         10  FILLER          PIC X(8).                            IX1204.2
   000092         009400         10  IX-FS3-KEY      PIC X(29).                           IX1204.2
   000093         009500         10  FILLER          PIC X(9).                            IX1204.2
   000094         009600         10  IX-FS3-ALTER-KEY  PIC X(29).                         IX1204.2
   000095         009700         10  FILLER            PIC X(45).                         IX1204.2
   000096         009800                                                                  IX1204.2
   000097         009900                                                                  IX1204.2
   000098         010000 WORKING-STORAGE SECTION.                                         IX1204.2
   000099         010100                                                                  IX1204.2
   000100         010200 01  GRP-0101.                                                    IX1204.2
   000101         010300     05  FILLER              PIC X(10) VALUE "RECORD-KEY".        IX1204.2
   000102         010400     05  GRP-0101-KEY        PIC 9(9)  VALUE ZERO.                IX1204.2 IMP
   000103         010500     05  FILLER              PIC X(10) VALUE "END-OF-KEY".        IX1204.2
   000104         010600                                                                  IX1204.2
   000105         010700 01  GRP-0102.                                                    IX1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000106         010800     05  FILLER              PIC X(10) VALUE "ALTERN-KEY".        IX1204.2
   000107         010900     05  GRP-0102-KEY        PIC 9(9)  VALUE ZERO.                IX1204.2 IMP
   000108         011000     05  FILLER              PIC X(10) VALUE "END-AL-KEY".        IX1204.2
   000109         011100                                                                  IX1204.2
   000110         011200 01  WRK-CS-09V00            PIC S9(9) COMP VALUE ZERO.           IX1204.2 IMP
   000111         011300                                                                  IX1204.2
   000112         011400 01  EOF-FLAG                PIC 9 VALUE ZERO.                    IX1204.2 IMP
   000113         011500                                                                  IX1204.2
   000114         011600 01  RECORDS-IN-ERROR        PIC S9(5) COMP VALUE ZERO.           IX1204.2 IMP
   000115         011700                                                                  IX1204.2
   000116         011800 01  ERROR-FLAG              PIC 9 VALUE ZERO.                    IX1204.2 IMP
   000117         011900                                                                  IX1204.2
   000118         012000 01  PERM-ERRORS             PIC S9(5) COMP VALUE ZERO.           IX1204.2 IMP
   000119         012100                                                                  IX1204.2
   000120         012200 01  STATUS-TEST-00          PIC 9 VALUE ZERO.                    IX1204.2 IMP
   000121         012300                                                                  IX1204.2
   000122         012400 01  STATUS-TEST-10          PIC 9 VALUE ZERO.                    IX1204.2 IMP
   000123         012500 01  STATUS-TEST-READ        PIC 9 VALUE ZERO.                    IX1204.2 IMP
   000124         012600                                                                  IX1204.2
   000125         012700 01  IX-FS3-STATUS.                                               IX1204.2
   000126         012800     05  IX-FS3-STAT1        PIC X.                               IX1204.2
   000127         012900     05  IX-FS3-STAT2        PIC X.                               IX1204.2
   000128         013000                                                                  IX1204.2
   000129         013100 01  COUNT-OF-RECS           PIC 9(5).                            IX1204.2
   000130         013200                                                                  IX1204.2
   000131         013300 01  COUNT-OF-RECORDS REDEFINES COUNT-OF-RECS  PIC 9(5).          IX1204.2 129
   000132         013400                                                                  IX1204.2
   000133         013500 01  FILE-RECORD-INFORMATION-REC.                                 IX1204.2
   000134         013600     05  FILE-RECORD-INFO-SKELETON.                               IX1204.2
   000135         013700         10  FILLER          PIC X(48) VALUE                      IX1204.2
   000136         013800              "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00". IX1204.2
   000137         013900         10  FILLER          PIC X(46) VALUE                      IX1204.2
   000138         014000                ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000". IX1204.2
   000139         014100         10  FILLER          PIC X(26) VALUE                      IX1204.2
   000140         014200                                    ",LFIL=000000,ORG=  ,LBLR= ". IX1204.2
   000141         014300         10  FILLER          PIC X(37) VALUE                      IX1204.2
   000142         014400                         ",RECKEY=                             ". IX1204.2
   000143         014500         10  FILLER          PIC X(38) VALUE                      IX1204.2
   000144         014600                        ",ALTKEY1=                             ". IX1204.2
   000145         014700         10  FILLER          PIC X(38) VALUE                      IX1204.2
   000146         014800                        ",ALTKEY2=                             ". IX1204.2
   000147         014900         10  FILLER          PIC X(7) VALUE SPACE.                IX1204.2 IMP
   000148         015000     05  FILE-RECORD-INFO             OCCURS 10.                  IX1204.2
   000149         015100         10  FILE-RECORD-INFO-P1-120.                             IX1204.2
   000150         015200             15  FILLER      PIC X(5).                            IX1204.2
   000151         015300             15  XFILE-NAME  PIC X(6).                            IX1204.2
   000152         015400             15  FILLER      PIC X(8).                            IX1204.2
   000153         015500             15  XRECORD-NAME  PIC X(6).                          IX1204.2
   000154         015600             15  FILLER        PIC X(1).                          IX1204.2
   000155         015700             15  REELUNIT-NUMBER  PIC 9(1).                       IX1204.2
   000156         015800             15  FILLER           PIC X(7).                       IX1204.2
   000157         015900             15  XRECORD-NUMBER   PIC 9(6).                       IX1204.2
   000158         016000             15  FILLER           PIC X(6).                       IX1204.2
   000159         016100             15  UPDATE-NUMBER    PIC 9(2).                       IX1204.2
   000160         016200             15  FILLER           PIC X(5).                       IX1204.2
   000161         016300             15  ODO-NUMBER       PIC 9(4).                       IX1204.2
   000162         016400             15  FILLER           PIC X(5).                       IX1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000163         016500             15  XPROGRAM-NAME    PIC X(5).                       IX1204.2
   000164         016600             15  FILLER           PIC X(7).                       IX1204.2
   000165         016700             15  XRECORD-LENGTH   PIC 9(6).                       IX1204.2
   000166         016800             15  FILLER           PIC X(7).                       IX1204.2
   000167         016900             15  CHARS-OR-RECORDS  PIC X(2).                      IX1204.2
   000168         017000             15  FILLER            PIC X(1).                      IX1204.2
   000169         017100             15  XBLOCK-SIZE       PIC 9(4).                      IX1204.2
   000170         017200             15  FILLER            PIC X(6).                      IX1204.2
   000171         017300             15  RECORDS-IN-FILE   PIC 9(6).                      IX1204.2
   000172         017400             15  FILLER            PIC X(5).                      IX1204.2
   000173         017500             15  XFILE-ORGANIZATION  PIC X(2).                    IX1204.2
   000174         017600             15  FILLER              PIC X(6).                    IX1204.2
   000175         017700             15  XLABEL-TYPE         PIC X(1).                    IX1204.2
   000176         017800         10  FILE-RECORD-INFO-P121-240.                           IX1204.2
   000177         017900             15  FILLER              PIC X(8).                    IX1204.2
   000178         018000             15  XRECORD-KEY         PIC X(29).                   IX1204.2
   000179         018100             15  FILLER              PIC X(9).                    IX1204.2
   000180         018200             15  ALTERNATE-KEY1      PIC X(29).                   IX1204.2
   000181         018300             15  FILLER              PIC X(9).                    IX1204.2
   000182         018400             15  ALTERNATE-KEY2      PIC X(29).                   IX1204.2
   000183         018500             15  FILLER              PIC X(7).                    IX1204.2
   000184         018600                                                                  IX1204.2
   000185         018700 01  TEST-RESULTS.                                                IX1204.2
   000186         018800     02 FILLER                   PIC X      VALUE SPACE.          IX1204.2 IMP
   000187         018900     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1204.2 IMP
   000188         019000     02 FILLER                   PIC X      VALUE SPACE.          IX1204.2 IMP
   000189         019100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1204.2 IMP
   000190         019200     02 FILLER                   PIC X      VALUE SPACE.          IX1204.2 IMP
   000191         019300     02  PAR-NAME.                                                IX1204.2
   000192         019400       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1204.2 IMP
   000193         019500       03  PARDOT-X              PIC X      VALUE SPACE.          IX1204.2 IMP
   000194         019600       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1204.2 IMP
   000195         019700     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1204.2 IMP
   000196         019800     02 RE-MARK                  PIC X(61).                       IX1204.2
   000197         019900 01  TEST-COMPUTED.                                               IX1204.2
   000198         020000     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1204.2 IMP
   000199         020100     02 FILLER                   PIC X(17)  VALUE                 IX1204.2
   000200         020200            "       COMPUTED=".                                   IX1204.2
   000201         020300     02 COMPUTED-X.                                               IX1204.2
   000202         020400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1204.2 IMP
   000203         020500     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1204.2 202
   000204         020600                                 PIC -9(9).9(9).                  IX1204.2
   000205         020700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1204.2 202
   000206         020800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1204.2 202
   000207         020900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1204.2 202
   000208         021000     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1204.2 202
   000209         021100         04 COMPUTED-18V0                    PIC -9(18).          IX1204.2
   000210         021200         04 FILLER                           PIC X.               IX1204.2
   000211         021300     03 FILLER PIC X(50) VALUE SPACE.                             IX1204.2 IMP
   000212         021400 01  TEST-CORRECT.                                                IX1204.2
   000213         021500     02 FILLER PIC X(30) VALUE SPACE.                             IX1204.2 IMP
   000214         021600     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1204.2
   000215         021700     02 CORRECT-X.                                                IX1204.2
   000216         021800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1204.2 IMP
   000217         021900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1204.2 216
   000218         022000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1204.2 216
   000219         022100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1204.2 216
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000220         022200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1204.2 216
   000221         022300     03      CR-18V0 REDEFINES CORRECT-A.                         IX1204.2 216
   000222         022400         04 CORRECT-18V0                     PIC -9(18).          IX1204.2
   000223         022500         04 FILLER                           PIC X.               IX1204.2
   000224         022600     03 FILLER PIC X(2) VALUE SPACE.                              IX1204.2 IMP
   000225         022700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1204.2 IMP
   000226         022800 01  CCVS-C-1.                                                    IX1204.2
   000227         022900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1204.2
   000228         023000-    "SS  PARAGRAPH-NAME                                          IX1204.2
   000229         023100-    "       REMARKS".                                            IX1204.2
   000230         023200     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1204.2 IMP
   000231         023300 01  CCVS-C-2.                                                    IX1204.2
   000232         023400     02 FILLER                     PIC X        VALUE SPACE.      IX1204.2 IMP
   000233         023500     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1204.2
   000234         023600     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1204.2 IMP
   000235         023700     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1204.2
   000236         023800     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1204.2 IMP
   000237         023900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1204.2 IMP
   000238         024000 01  REC-CT                        PIC 99       VALUE ZERO.       IX1204.2 IMP
   000239         024100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1204.2 IMP
   000240         024200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1204.2 IMP
   000241         024300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1204.2 IMP
   000242         024400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1204.2 IMP
   000243         024500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1204.2 IMP
   000244         024600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1204.2 IMP
   000245         024700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1204.2 IMP
   000246         024800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1204.2 IMP
   000247         024900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1204.2 IMP
   000248         025000 01  CCVS-H-1.                                                    IX1204.2
   000249         025100     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1204.2 IMP
   000250         025200     02  FILLER                    PIC X(42)    VALUE             IX1204.2
   000251         025300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1204.2
   000252         025400     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1204.2 IMP
   000253         025500 01  CCVS-H-2A.                                                   IX1204.2
   000254         025600   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1204.2 IMP
   000255         025700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1204.2
   000256         025800   02  FILLER                        PIC XXXX   VALUE             IX1204.2
   000257         025900     "4.2 ".                                                      IX1204.2
   000258         026000   02  FILLER                        PIC X(28)  VALUE             IX1204.2
   000259         026100            " COPY - NOT FOR DISTRIBUTION".                       IX1204.2
   000260         026200   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1204.2 IMP
   000261         026300                                                                  IX1204.2
   000262         026400 01  CCVS-H-2B.                                                   IX1204.2
   000263         026500   02  FILLER                        PIC X(15)  VALUE             IX1204.2
   000264         026600            "TEST RESULT OF ".                                    IX1204.2
   000265         026700   02  TEST-ID                       PIC X(9).                    IX1204.2
   000266         026800   02  FILLER                        PIC X(4)   VALUE             IX1204.2
   000267         026900            " IN ".                                               IX1204.2
   000268         027000   02  FILLER                        PIC X(12)  VALUE             IX1204.2
   000269         027100     " HIGH       ".                                              IX1204.2
   000270         027200   02  FILLER                        PIC X(22)  VALUE             IX1204.2
   000271         027300            " LEVEL VALIDATION FOR ".                             IX1204.2
   000272         027400   02  FILLER                        PIC X(58)  VALUE             IX1204.2
   000273         027500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1204.2
   000274         027600 01  CCVS-H-3.                                                    IX1204.2
   000275         027700     02  FILLER                      PIC X(34)  VALUE             IX1204.2
   000276         027800            " FOR OFFICIAL USE ONLY    ".                         IX1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000277         027900     02  FILLER                      PIC X(58)  VALUE             IX1204.2
   000278         028000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1204.2
   000279         028100     02  FILLER                      PIC X(28)  VALUE             IX1204.2
   000280         028200            "  COPYRIGHT   1985 ".                                IX1204.2
   000281         028300 01  CCVS-E-1.                                                    IX1204.2
   000282         028400     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1204.2 IMP
   000283         028500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1204.2
   000284         028600     02 ID-AGAIN                     PIC X(9).                    IX1204.2
   000285         028700     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1204.2 IMP
   000286         028800 01  CCVS-E-2.                                                    IX1204.2
   000287         028900     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1204.2 IMP
   000288         029000     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1204.2 IMP
   000289         029100     02 CCVS-E-2-2.                                               IX1204.2
   000290         029200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1204.2 IMP
   000291         029300         03 FILLER                   PIC X      VALUE SPACE.      IX1204.2 IMP
   000292         029400         03 ENDER-DESC               PIC X(44)  VALUE             IX1204.2
   000293         029500            "ERRORS ENCOUNTERED".                                 IX1204.2
   000294         029600 01  CCVS-E-3.                                                    IX1204.2
   000295         029700     02  FILLER                      PIC X(22)  VALUE             IX1204.2
   000296         029800            " FOR OFFICIAL USE ONLY".                             IX1204.2
   000297         029900     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1204.2 IMP
   000298         030000     02  FILLER                      PIC X(58)  VALUE             IX1204.2
   000299         030100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1204.2
   000300         030200     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1204.2 IMP
   000301         030300     02 FILLER                       PIC X(15)  VALUE             IX1204.2
   000302         030400             " COPYRIGHT 1985".                                   IX1204.2
   000303         030500 01  CCVS-E-4.                                                    IX1204.2
   000304         030600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1204.2 IMP
   000305         030700     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1204.2
   000306         030800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1204.2 IMP
   000307         030900     02 FILLER                       PIC X(40)  VALUE             IX1204.2
   000308         031000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1204.2
   000309         031100 01  XXINFO.                                                      IX1204.2
   000310         031200     02 FILLER                       PIC X(19)  VALUE             IX1204.2
   000311         031300            "*** INFORMATION ***".                                IX1204.2
   000312         031400     02 INFO-TEXT.                                                IX1204.2
   000313         031500       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1204.2 IMP
   000314         031600       04 XXCOMPUTED                 PIC X(20).                   IX1204.2
   000315         031700       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1204.2 IMP
   000316         031800       04 XXCORRECT                  PIC X(20).                   IX1204.2
   000317         031900     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1204.2
   000318         032000 01  HYPHEN-LINE.                                                 IX1204.2
   000319         032100     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1204.2 IMP
   000320         032200     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1204.2
   000321         032300-    "*****************************************".                 IX1204.2
   000322         032400     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1204.2
   000323         032500-    "******************************".                            IX1204.2
   000324         032600 01  TEST-NO                         PIC 99.                      IX1204.2
   000325         032700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1204.2
   000326         032800     "IX120A".                                                    IX1204.2
   000327         032900 PROCEDURE DIVISION.                                              IX1204.2
   000328         033000 DECLARATIVES.                                                    IX1204.2
   000329         033100                                                                  IX1204.2
   000330         033200 SECT-IX105-0002 SECTION.                                         IX1204.2
   000331         033300     USE AFTER EXCEPTION PROCEDURE ON IX-FS3.                     IX1204.2 82
   000332         033400 INPUT-PROCESS.                                                   IX1204.2
   000333         033500     IF TEST-NO = 5                                               IX1204.2 324
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000334      1  033600        GO TO D-C-TEST-GF-01-1.                                   IX1204.2 342
   000335         033700     IF STATUS-TEST-10 EQUAL TO 1                                 IX1204.2 122
   000336      1  033800        IF  IX-FS3-STAT1 EQUAL TO "1"                             IX1204.2 126
   000337      2  033900            MOVE 1 TO EOF-FLAG                                    IX1204.2 112
   000338      1  034000        ELSE                                                      IX1204.2
   000339      2  034100           IF  IX-FS3-STAT1 GREATER THAN "1"                      IX1204.2 126
   000340      3  034200           MOVE 1 TO PERM-ERRORS.                                 IX1204.2 118
   000341         034300     GO TO DECL-EXIT.                                             IX1204.2 470
   000342         034400 D-C-TEST-GF-01-1.                                                IX1204.2
   000343         034500     IF IX-FS3-STATUS EQUAL TO "43"                               IX1204.2 125
   000344      1  034600         GO TO D-C-PASS-GF-01-0.                                  IX1204.2 351
   000345         034700 D-C-FAIL-GF-01-0.                                                IX1204.2
   000346         034800     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1204.2 125 202
   000347         034900     MOVE "43" TO CORRECT-X.                                      IX1204.2 215
   000348         035000     MOVE "IX-5, 1.3.4, (5) C" TO RE-MARK.                        IX1204.2 196
   000349         035100     PERFORM D-FAIL.                                              IX1204.2 376
   000350         035200     GO TO D-C-WRITE-GF-01-0.                                     IX1204.2 353
   000351         035300 D-C-PASS-GF-01-0.                                                IX1204.2
   000352         035400     PERFORM D-PASS.                                              IX1204.2 375
   000353         035500 D-C-WRITE-GF-01-0.                                               IX1204.2
   000354         035600     PERFORM D-PRINT-DETAIL.                                      IX1204.2 377
   000355         035700 D-CLOSE-FILES.                                                   IX1204.2
   000356         035800     CLOSE IX-FS3.                                                IX1204.2 82
   000357         035900     OPEN I-O RAW-DATA.                                           IX1204.2 60
   000358         036000     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1204.2 325 63
   000359         036100     READ RAW-DATA INVALID KEY GO TO D-END-E-2.                   IX1204.2 60 367
   000360         036200     MOVE "OK.     " TO C-ABORT.                                  IX1204.2 74
   000361         036300     MOVE PASS-COUNTER TO C-OK.                                   IX1204.2 242 67
   000362         036400     MOVE ERROR-HOLD   TO C-ALL.                                  IX1204.2 244 68
   000363         036500     MOVE ERROR-COUNTER TO C-FAIL.                                IX1204.2 240 69
   000364         036600     MOVE DELETE-COUNTER TO C-DELETED.                            IX1204.2 239 70
   000365         036700     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1204.2 241 71
   000366         036800     REWRITE RAW-DATA-SATZ INVALID KEY GO TO D-END-E-2.           IX1204.2 62 367
   000367         036900 D-END-E-2.                                                       IX1204.2
   000368         037000     CLOSE RAW-DATA.                                              IX1204.2 60
   000369         037100     PERFORM D-END-ROUTINE THRU D-END-ROUTINE-13.                 IX1204.2 392 414
   000370         037200     CLOSE PRINT-FILE.                                            IX1204.2 76
   000371         037300 D-TERMINATE-CCVS.                                                IX1204.2
   000372         037400     EXIT PROGRAM.                                                IX1204.2
   000373         037500 D-TERMINATE-CALL.                                                IX1204.2
   000374         037600     STOP     RUN.                                                IX1204.2
   000375         037700 D-PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.         IX1204.2 189 242
   000376         037800 D-FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.        IX1204.2 189 240
   000377         037900 D-PRINT-DETAIL.                                                  IX1204.2
   000378         038000     IF   REC-CT NOT EQUAL TO ZERO                                IX1204.2 238 IMP
   000379      1  038100          MOVE "." TO PARDOT-X                                    IX1204.2 193
   000380      1  038200          MOVE REC-CT TO DOTVALUE.                                IX1204.2 238 194
   000381         038300     MOVE TEST-RESULTS TO PRINT-REC.                              IX1204.2 185 78
   000382         038400     PERFORM D-WRITE-LINE.                                        IX1204.2 427
   000383         038500     IF   P-OR-F EQUAL TO "FAIL*"                                 IX1204.2 189
   000384      1  038600          PERFORM D-WRITE-LINE                                    IX1204.2 427
   000385      1  038700          PERFORM D-FAIL-ROUTINE THRU D-FAIL-ROUTINE-EX           IX1204.2 446 460
   000386         038800     ELSE                                                         IX1204.2
   000387      1  038900          PERFORM D-BAIL-OUT THRU D-BAIL-OUT-EX.                  IX1204.2 461 469
   000388         039000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1204.2 IMP 189 IMP 201
   000389         039100     MOVE SPACE TO CORRECT-X.                                     IX1204.2 IMP 215
   000390         039200     IF   REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.           IX1204.2 238 IMP IMP 191
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000391         039300     MOVE SPACE TO RE-MARK.                                       IX1204.2 IMP 196
   000392         039400 D-END-ROUTINE.                                                   IX1204.2
   000393         039500     MOVE HYPHEN-LINE TO DUMMY-RECORD.                            IX1204.2 318 80
   000394         039600     PERFORM D-WRITE-LINE 5 TIMES.                                IX1204.2 427
   000395         039700 D-END-RTN-EXIT.                                                  IX1204.2
   000396         039800     MOVE CCVS-E-1 TO DUMMY-RECORD.                               IX1204.2 281 80
   000397         039900     PERFORM D-WRITE-LINE 2 TIMES.                                IX1204.2 427
   000398         040000 D-END-ROUTINE-1.                                                 IX1204.2
   000399         040100     ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO       IX1204.2 240 244 241
   000400         040200     ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.                IX1204.2 244 239 244
   000401         040300     ADD PASS-COUNTER TO ERROR-HOLD.                              IX1204.2 242 244
   000402         040400     MOVE PASS-COUNTER TO CCVS-E-4-1.                             IX1204.2 242 304
   000403         040500     MOVE ERROR-HOLD TO CCVS-E-4-2.                               IX1204.2 244 306
   000404         040600     MOVE CCVS-E-4 TO CCVS-E-2-2.                                 IX1204.2 303 289
   000405         040700     MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM D-WRITE-LINE.          IX1204.2 286 80 427
   000406         040800  D-END-ROUTINE-12.                                               IX1204.2
   000407         040900     MOVE "TEST(S) FAILED" TO ENDER-DESC.                         IX1204.2 292
   000408         041000     IF  ERROR-COUNTER IS EQUAL TO ZERO                           IX1204.2 240 IMP
   000409      1  041100         MOVE "NO " TO ERROR-TOTAL                                IX1204.2 290
   000410         041200     ELSE                                                         IX1204.2
   000411      1  041300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1204.2 240 290
   000412         041400     MOVE    CCVS-E-2 TO DUMMY-RECORD.                            IX1204.2 286 80
   000413         041500     PERFORM D-WRITE-LINE.                                        IX1204.2 427
   000414         041600 D-END-ROUTINE-13.                                                IX1204.2
   000415         041700     IF  DELETE-COUNTER IS EQUAL TO ZERO                          IX1204.2 239 IMP
   000416      1  041800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1204.2 290
   000417      1  041900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1204.2 239 290
   000418         042000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1204.2 292
   000419         042100     MOVE CCVS-E-2 TO DUMMY-RECORD.                               IX1204.2 286 80
   000420         042200     PERFORM D-WRITE-LINE.                                        IX1204.2 427
   000421         042300     IF   INSPECT-COUNTER EQUAL TO ZERO                           IX1204.2 241 IMP
   000422      1  042400          MOVE "NO " TO ERROR-TOTAL                               IX1204.2 290
   000423      1  042500     ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                    IX1204.2 241 290
   000424         042600     MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.             IX1204.2 292
   000425         042700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1204.2 286 80 427
   000426         042800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1204.2 294 80 427
   000427         042900 D-WRITE-LINE.                                                    IX1204.2
   000428         043000     ADD 1 TO RECORD-COUNT.                                       IX1204.2 246
   000429         043100     IF RECORD-COUNT GREATER 42                                   IX1204.2 246
   000430      1  043200        MOVE DUMMY-RECORD TO DUMMY-HOLD                           IX1204.2 80 245
   000431      1  043300        MOVE SPACE TO DUMMY-RECORD                                IX1204.2 IMP 80
   000432      1  043400        WRITE DUMMY-RECORD AFTER ADVANCING PAGE                   IX1204.2 80
   000433      1  043500        MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1204.2 248 80 443
   000434      1  043600        MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1204.2 253 80 443
   000435      1  043700        MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1204.2 262 80 443
   000436      1  043800        MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1204.2 274 80 443
   000437      1  043900        MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1204.2 226 80 443
   000438      1  044000        MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1204.2 231 80 443
   000439      1  044100        MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM D-WRT-LN         IX1204.2 318 80 443
   000440      1  044200        MOVE DUMMY-HOLD TO DUMMY-RECORD                           IX1204.2 245 80
   000441      1  044300        MOVE ZERO TO RECORD-COUNT.                                IX1204.2 IMP 246
   000442         044400     PERFORM D-WRT-LN.                                            IX1204.2 443
   000443         044500 D-WRT-LN.                                                        IX1204.2
   000444         044600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1204.2 80
   000445         044700     MOVE SPACE TO DUMMY-RECORD.                                  IX1204.2 IMP 80
   000446         044800 D-FAIL-ROUTINE.                                                  IX1204.2
   000447         044900     IF   COMPUTED-X NOT EQUAL TO SPACE                           IX1204.2 201 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448      1  045000          GO TO D-FAIL-ROUTINE-WRITE.                             IX1204.2 455
   000449         045100     IF   CORRECT-X NOT EQUAL TO SPACE GO TO D-FAIL-ROUTINE-WRITE.IX1204.2 215 IMP 455
   000450         045200     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1204.2 247 317
   000451         045300     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    IX1204.2 312
   000452         045400     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1204.2 309 80 427
   000453         045500     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1204.2 IMP 317
   000454         045600     GO TO D-FAIL-ROUTINE-EX.                                     IX1204.2 460
   000455         045700 D-FAIL-ROUTINE-WRITE.                                            IX1204.2
   000456         045800     MOVE TEST-COMPUTED TO PRINT-REC PERFORM D-WRITE-LINE         IX1204.2 197 78 427
   000457         045900     MOVE ANSI-REFERENCE TO COR-ANSI-REFERENCE.                   IX1204.2 247 225
   000458         046000     MOVE TEST-CORRECT TO PRINT-REC PERFORM D-WRITE-LINE 2 TIMES. IX1204.2 212 78 427
   000459         046100     MOVE SPACES TO COR-ANSI-REFERENCE.                           IX1204.2 IMP 225
   000460         046200 D-FAIL-ROUTINE-EX. EXIT.                                         IX1204.2
   000461         046300 D-BAIL-OUT.                                                      IX1204.2
   000462         046400     IF  COMPUTED-A NOT EQUAL TO SPACE GO TO D-BAIL-OUT-WRITE.    IX1204.2 202 IMP 464
   000463         046500     IF  CORRECT-A EQUAL TO SPACE GO TO D-BAIL-OUT-EX.            IX1204.2 216 IMP 469
   000464         046600 D-BAIL-OUT-WRITE.                                                IX1204.2
   000465         046700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1204.2 216 316 202 314
   000466         046800     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1204.2 247 317
   000467         046900     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1204.2 309 80 427
   000468         047000     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1204.2 IMP 317
   000469         047100 D-BAIL-OUT-EX. EXIT.                                             IX1204.2
   000470         047200 DECL-EXIT.  EXIT.                                                IX1204.2
   000471         047300 END DECLARATIVES.                                                IX1204.2
   000472         047400                                                                  IX1204.2
   000473         047500                                                                  IX1204.2
   000474         047600 CCVS1 SECTION.                                                   IX1204.2
   000475         047700 OPEN-FILES.                                                      IX1204.2
   000476         047800     OPEN I-O RAW-DATA.                                           IX1204.2 60
   000477         047900     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1204.2 325 63
   000478         048000     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1204.2 60 484
   000479         048100     MOVE "ABORTED " TO C-ABORT.                                  IX1204.2 74
   000480         048200     ADD 1 TO C-NO-OF-TESTS.                                      IX1204.2 66
   000481         048300     ACCEPT C-DATE  FROM DATE.                                    IX1204.2 64
   000482         048400     ACCEPT C-TIME  FROM TIME.                                    IX1204.2 65
   000483         048500     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1204.2 62 484
   000484         048600 END-E-1.                                                         IX1204.2
   000485         048700     CLOSE RAW-DATA.                                              IX1204.2 60
   000486         048800     OPEN    OUTPUT PRINT-FILE.                                   IX1204.2 76
   000487         048900     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1204.2 325 265 325 284
   000488         049000     MOVE    SPACE TO TEST-RESULTS.                               IX1204.2 IMP 185
   000489         049100     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1204.2 533 538
   000490         049200     MOVE    ZERO TO REC-SKL-SUB.                                 IX1204.2 IMP 237
   000491         049300     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1204.2 492
   000492         049400 CCVS-INIT-FILE.                                                  IX1204.2
   000493         049500     ADD     1 TO REC-SKL-SUB.                                    IX1204.2 237
   000494         049600     MOVE    FILE-RECORD-INFO-SKELETON                            IX1204.2 134
   000495         049700          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1204.2 148 237
   000496         049800 CCVS-INIT-EXIT.                                                  IX1204.2
   000497         049900     GO TO CCVS1-EXIT.                                            IX1204.2 620
   000498         050000 CLOSE-FILES.                                                     IX1204.2
   000499         050100     OPEN I-O RAW-DATA.                                           IX1204.2 60
   000500         050200     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1204.2 325 63
   000501         050300     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1204.2 60 509
   000502         050400     MOVE "OK.     " TO C-ABORT.                                  IX1204.2 74
   000503         050500     MOVE PASS-COUNTER TO C-OK.                                   IX1204.2 242 67
   000504         050600     MOVE ERROR-HOLD   TO C-ALL.                                  IX1204.2 244 68
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000505         050700     MOVE ERROR-COUNTER TO C-FAIL.                                IX1204.2 240 69
   000506         050800     MOVE DELETE-COUNTER TO C-DELETED.                            IX1204.2 239 70
   000507         050900     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1204.2 241 71
   000508         051000     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1204.2 62 509
   000509         051100 END-E-2.                                                         IX1204.2
   000510         051200     CLOSE RAW-DATA.                                              IX1204.2 60
   000511         051300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1204.2 542 563 76
   000512         051400 TERMINATE-CCVS.                                                  IX1204.2
   000513         051500     EXIT PROGRAM.                                                IX1204.2
   000514         051600 TERMINATE-CALL.                                                  IX1204.2
   000515         051700     STOP     RUN.                                                IX1204.2
   000516         051800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1204.2 189 241
   000517         051900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1204.2 189 242
   000518         052000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1204.2 189 240
   000519         052100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1204.2 189 239
   000520         052200     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1204.2 196
   000521         052300 PRINT-DETAIL.                                                    IX1204.2
   000522         052400     IF REC-CT NOT EQUAL TO ZERO                                  IX1204.2 238 IMP
   000523      1  052500             MOVE "." TO PARDOT-X                                 IX1204.2 193
   000524      1  052600             MOVE REC-CT TO DOTVALUE.                             IX1204.2 238 194
   000525         052700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1204.2 185 78 575
   000526         052800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1204.2 189 575
   000527      1  052900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1204.2 596 610
   000528      1  053000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1204.2 611 619
   000529         053100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1204.2 IMP 189 IMP 201
   000530         053200     MOVE SPACE TO CORRECT-X.                                     IX1204.2 IMP 215
   000531         053300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1204.2 238 IMP IMP 191
   000532         053400     MOVE     SPACE TO RE-MARK.                                   IX1204.2 IMP 196
   000533         053500 HEAD-ROUTINE.                                                    IX1204.2
   000534         053600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1204.2 248 80 575
   000535         053700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1204.2 253 80 575
   000536         053800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1204.2 262 80 575
   000537         053900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1204.2 274 80 575
   000538         054000 COLUMN-NAMES-ROUTINE.                                            IX1204.2
   000539         054100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1204.2 226 80 575
   000540         054200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1204.2 231 80 575
   000541         054300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1204.2 318 80 575
   000542         054400 END-ROUTINE.                                                     IX1204.2
   000543         054500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1204.2 318 80 575
   000544         054600 END-RTN-EXIT.                                                    IX1204.2
   000545         054700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1204.2 281 80 575
   000546         054800 END-ROUTINE-1.                                                   IX1204.2
   000547         054900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1204.2 240 244 241
   000548         055000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1204.2 244 239 244
   000549         055100      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1204.2 242 244
   000550         055200*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1204.2
   000551         055300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1204.2 242 304
   000552         055400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1204.2 244 306
   000553         055500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1204.2 303 289
   000554         055600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1204.2 286 80 575
   000555         055700  END-ROUTINE-12.                                                 IX1204.2
   000556         055800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1204.2 292
   000557         055900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1204.2 240 IMP
   000558      1  056000         MOVE "NO " TO ERROR-TOTAL                                IX1204.2 290
   000559         056100         ELSE                                                     IX1204.2
   000560      1  056200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1204.2 240 290
   000561         056300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1204.2 286 80
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000562         056400     PERFORM WRITE-LINE.                                          IX1204.2 575
   000563         056500 END-ROUTINE-13.                                                  IX1204.2
   000564         056600     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1204.2 239 IMP
   000565      1  056700         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1204.2 290
   000566      1  056800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1204.2 239 290
   000567         056900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1204.2 292
   000568         057000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1204.2 286 80 575
   000569         057100      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1204.2 241 IMP
   000570      1  057200          MOVE "NO " TO ERROR-TOTAL                               IX1204.2 290
   000571      1  057300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1204.2 241 290
   000572         057400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1204.2 292
   000573         057500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1204.2 286 80 575
   000574         057600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1204.2 294 80 575
   000575         057700 WRITE-LINE.                                                      IX1204.2
   000576         057800     ADD 1 TO RECORD-COUNT.                                       IX1204.2 246
   000577         057900     IF RECORD-COUNT GREATER 42                                   IX1204.2 246
   000578      1  058000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1204.2 80 245
   000579      1  058100         MOVE SPACE TO DUMMY-RECORD                               IX1204.2 IMP 80
   000580      1  058200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1204.2 80
   000581      1  058300         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1204.2 248 80 591
   000582      1  058400         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1204.2 253 80 591
   000583      1  058500         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1204.2 262 80 591
   000584      1  058600         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1204.2 274 80 591
   000585      1  058700         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1204.2 226 80 591
   000586      1  058800         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1204.2 231 80 591
   000587      1  058900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1204.2 318 80 591
   000588      1  059000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1204.2 245 80
   000589      1  059100         MOVE ZERO TO RECORD-COUNT.                               IX1204.2 IMP 246
   000590         059200     PERFORM WRT-LN.                                              IX1204.2 591
   000591         059300 WRT-LN.                                                          IX1204.2
   000592         059400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1204.2 80
   000593         059500     MOVE SPACE TO DUMMY-RECORD.                                  IX1204.2 IMP 80
   000594         059600 BLANK-LINE-PRINT.                                                IX1204.2
   000595         059700     PERFORM WRT-LN.                                              IX1204.2 591
   000596         059800 FAIL-ROUTINE.                                                    IX1204.2
   000597         059900     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1204.2 201 IMP
   000598      1  060000            GO TO   FAIL-ROUTINE-WRITE.                           IX1204.2 605
   000599         060100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1204.2 215 IMP 605
   000600         060200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1204.2 247 317
   000601         060300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1204.2 312
   000602         060400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1204.2 309 80 575
   000603         060500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1204.2 IMP 317
   000604         060600     GO TO  FAIL-ROUTINE-EX.                                      IX1204.2 610
   000605         060700 FAIL-ROUTINE-WRITE.                                              IX1204.2
   000606         060800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1204.2 197 78 575
   000607         060900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1204.2 247 225
   000608         061000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1204.2 212 78 575
   000609         061100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1204.2 IMP 225
   000610         061200 FAIL-ROUTINE-EX. EXIT.                                           IX1204.2
   000611         061300 BAIL-OUT.                                                        IX1204.2
   000612         061400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1204.2 202 IMP 614
   000613         061500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1204.2 216 IMP 619
   000614         061600 BAIL-OUT-WRITE.                                                  IX1204.2
   000615         061700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1204.2 216 316 202 314
   000616         061800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1204.2 247 317
   000617         061900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1204.2 309 80 575
   000618         062000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1204.2 IMP 317
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000619         062100 BAIL-OUT-EX. EXIT.                                               IX1204.2
   000620         062200 CCVS1-EXIT.                                                      IX1204.2
   000621         062300     EXIT.                                                        IX1204.2
   000622         062400                                                                  IX1204.2
   000623         062500 SECT-IX120A-0003 SECTION.                                        IX1204.2
   000624         062600 SEQ-INIT-010.                                                    IX1204.2
   000625         062700     MOVE ZERO TO TEST-NO.                                        IX1204.2 IMP 324
   000626         062800     MOVE "IX-FS3" TO XFILE-NAME (1).                             IX1204.2 151
   000627         062900     MOVE "R1-F-G" TO XRECORD-NAME (1).                           IX1204.2 153
   000628         063000     MOVE CCVS-PGM-ID TO XPROGRAM-NAME (1).                       IX1204.2 325 163
   000629         063100     MOVE 000240 TO XRECORD-LENGTH (1).                           IX1204.2 165
   000630         063200     MOVE "RC" TO CHARS-OR-RECORDS (1).                           IX1204.2 167
   000631         063300     MOVE 0002 TO XBLOCK-SIZE (1).                                IX1204.2 169
   000632         063400     MOVE 000050 TO RECORDS-IN-FILE (1).                          IX1204.2 171
   000633         063500     MOVE "IX" TO XFILE-ORGANIZATION (1).                         IX1204.2 173
   000634         063600     MOVE "S" TO XLABEL-TYPE (1).                                 IX1204.2 175
   000635         063700     MOVE 000001 TO XRECORD-NUMBER (1).                           IX1204.2 157
   000636         063800     MOVE 0 TO COUNT-OF-RECS.                                     IX1204.2 129
   000637         063900                                                                  IX1204.2
   000638         064100*   TEST  1                                                      *IX1204.2
   000639         064200*         OPEN OUTPUT ...                 00 EXPECTED            *IX1204.2
   000640         064300*         IX-3, 1.3.4 (1) A                                      *IX1204.2
   000641         064400*    STATUS 00 CHECK ON OUTPUT FILE IX-FS3                       *IX1204.2
   000642         064500*    THE OUTPUT STATEMENT IS SUCCESSFULLY EXECUTED               *IX1204.2
   000643         064700 OPN-INIT-GF-01-0.                                                IX1204.2
   000644         064800     MOVE 1 TO STATUS-TEST-00.                                    IX1204.2 120
   000645         064900     MOVE SPACES TO IX-FS3-STATUS.                                IX1204.2 IMP 125
   000646         065000     MOVE "OPEN I-O   : 00 EXP." TO FEATURE.                      IX1204.2 187
   000647         065100     MOVE "OPN-TEST-GF-01-0" TO PAR-NAME.                         IX1204.2 191
   000648         065200     OPEN                                                         IX1204.2
   000649         065300        I-O    IX-FS3.                                            IX1204.2 82
   000650         065400     IF IX-FS3-STATUS EQUAL TO "00"                               IX1204.2 125
   000651      1  065500         GO TO OPN-PASS-GF-01-0.                                  IX1204.2 658
   000652         065600 OPN-FAIL-GF-01-0.                                                IX1204.2
   000653         065700     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1204.2 196
   000654         065800     PERFORM FAIL.                                                IX1204.2 518
   000655         065900     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1204.2 125 202
   000656         066000     MOVE "00" TO CORRECT-X.                                      IX1204.2 215
   000657         066100     GO TO OPN-WRITE-GF-01-0.                                     IX1204.2 660
   000658         066200 OPN-PASS-GF-01-0.                                                IX1204.2
   000659         066300     PERFORM PASS.                                                IX1204.2 517
   000660         066400 OPN-WRITE-GF-01-0.                                               IX1204.2
   000661         066500     PERFORM PRINT-DETAIL.                                        IX1204.2 521
   000662         066700*   TEST  5                                                      *IX1204.2
   000663         066800*         REWRITE WHERE THE LAST EXECUTED I-O STATEMENT PRIOR TO *IX1204.2
   000664         066900*         THE REWRITE WAS NOT A SUCCESSFULLY EXECUTED READ        IX1204.2
   000665         067000*         STATEMENT.       STATUS 43 EXPECTED.                    IX1204.2
   000666         067100*         IX-3, 1.3.4 (3) A                                      *IX1204.2
   000667         067300 RWR-INIT-GF-01-0.                                                IX1204.2
   000668         067400     MOVE  5 TO TEST-NO.                                          IX1204.2 324
   000669         067500     MOVE SPACES TO IX-FS3-STATUS.                                IX1204.2 IMP 125
   000670         067600     MOVE 0 TO STATUS-TEST-00.                                    IX1204.2 120
   000671         067700     MOVE "REWRITE:     43 EXP." TO FEATURE.                      IX1204.2 187
   000672         067800     MOVE "RWR-TEST-GF-01-0" TO PAR-NAME.                         IX1204.2 191
   000673         067900*RWR-READ-GF-01-0.                                                IX1204.2
   000674         068000*    READ IX-FS3 AT END GO TO RWR-TEST-GF-01-0.                   IX1204.2
   000675         068100*    GO TO RWR-READ-GF-01-0.                                      IX1204.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000676         068200*RWR-TEST-GF-01-0.                                                IX1204.2
   000677         068300*    READ IX-FS3 AT END GO TO RWR-TEST-GF-01-1.                   IX1204.2
   000678         068400*    MOVE FILE-RECORD-INFO (1) TO IX-FS3R1-F-G-240.               IX1204.2
   000679         068500 RWR-TEST-GF-01-1.                                                IX1204.2
   000680         068600     REWRITE IX-FS3R1-F-G-240.                                    IX1204.2 88
   000681         068700     IF IX-FS3-STATUS EQUAL TO "43"                               IX1204.2 125
   000682      1  068800        MOVE "SHOULD HAVE EXECUTED DECLARATIVES IX-3,1.3.4(4)"    IX1204.2
   000683      1  068900          TO RE-MARK                                              IX1204.2 196
   000684      1  069000        GO TO RWR-WRITE-GF-01-0.                                  IX1204.2 687
   000685         069100 RWR-FAIL-GF-01-0.                                                IX1204.2
   000686         069200     MOVE "IX-5, 1.3.4, (5) C" TO RE-MARK.                        IX1204.2 196
   000687         069300 RWR-WRITE-GF-01-0.                                               IX1204.2
   000688         069400     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1204.2 125 202
   000689         069500     MOVE "43" TO CORRECT-X.                                      IX1204.2 215
   000690         069600     PERFORM FAIL.                                                IX1204.2 518
   000691         069700     PERFORM PRINT-DETAIL.                                        IX1204.2 521
   000692         069800     CLOSE IX-FS3.                                                IX1204.2 82
   000693         069900                                                                  IX1204.2
   000694         070000 TERMINATE-ROUTINE.                                               IX1204.2
   000695         070100     EXIT.                                                        IX1204.2
   000696         070200                                                                  IX1204.2
   000697         070300 CCVS-EXIT SECTION.                                               IX1204.2
   000698         070400 CCVS-999999.                                                     IX1204.2
   000699         070500     GO TO CLOSE-FILES.                                           IX1204.2 498
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      180   ALTERNATE-KEY1
      182   ALTERNATE-KEY2
      247   ANSI-REFERENCE . . . . . . . .  450 457 466 600 607 616
       74   C-ABORT. . . . . . . . . . . .  M360 M479 M502
       68   C-ALL. . . . . . . . . . . . .  M362 M504
       64   C-DATE . . . . . . . . . . . .  M481
       70   C-DELETED. . . . . . . . . . .  M364 M506
       69   C-FAIL . . . . . . . . . . . .  M363 M505
       73   C-INDENT
       71   C-INSPECT. . . . . . . . . . .  M365 M507
       66   C-NO-OF-TESTS. . . . . . . . .  M480
       72   C-NOTE
       67   C-OK . . . . . . . . . . . . .  M361 M503
       65   C-TIME . . . . . . . . . . . .  M482
      226   CCVS-C-1 . . . . . . . . . . .  437 539 585
      231   CCVS-C-2 . . . . . . . . . . .  438 540 586
      281   CCVS-E-1 . . . . . . . . . . .  396 545
      286   CCVS-E-2 . . . . . . . . . . .  405 412 419 425 554 561 568 573
      289   CCVS-E-2-2 . . . . . . . . . .  M404 M553
      294   CCVS-E-3 . . . . . . . . . . .  426 574
      303   CCVS-E-4 . . . . . . . . . . .  404 553
      304   CCVS-E-4-1 . . . . . . . . . .  M402 M551
      306   CCVS-E-4-2 . . . . . . . . . .  M403 M552
      248   CCVS-H-1 . . . . . . . . . . .  433 534 581
      253   CCVS-H-2A. . . . . . . . . . .  434 535 582
      262   CCVS-H-2B. . . . . . . . . . .  435 536 583
      274   CCVS-H-3 . . . . . . . . . . .  436 537 584
      325   CCVS-PGM-ID. . . . . . . . . .  358 477 487 487 500 628
      167   CHARS-OR-RECORDS . . . . . . .  M630
      208   CM-18V0
      202   COMPUTED-A . . . . . . . . . .  203 205 206 207 208 M346 462 465 612 615 M655 M688
      203   COMPUTED-N
      201   COMPUTED-X . . . . . . . . . .  M388 447 M529 597
      205   COMPUTED-0V18
      207   COMPUTED-14V4
      209   COMPUTED-18V0
      206   COMPUTED-4V14
      225   COR-ANSI-REFERENCE . . . . . .  M457 M459 M607 M609
      216   CORRECT-A. . . . . . . . . . .  217 218 219 220 221 463 465 613 615
      217   CORRECT-N
      215   CORRECT-X. . . . . . . . . . .  M347 M389 449 M530 599 M656 M689
      218   CORRECT-0V18
      220   CORRECT-14V4
      222   CORRECT-18V0
      219   CORRECT-4V14
      131   COUNT-OF-RECORDS
      129   COUNT-OF-RECS. . . . . . . . .  131 M636
      221   CR-18V0
      239   DELETE-COUNTER . . . . . . . .  364 400 415 417 506 M519 548 564 566
      194   DOTVALUE . . . . . . . . . . .  M380 M524
      245   DUMMY-HOLD . . . . . . . . . .  M430 440 M578 588
       80   DUMMY-RECORD . . . . . . . . .  M393 M396 M405 M412 M419 M425 M426 430 M431 432 M433 M434 M435 M436 M437 M438
                                            M439 M440 444 M445 M452 M467 M534 M535 M536 M537 M539 M540 M541 M543 M545 M554
                                            M561 M568 M573 M574 578 M579 580 M581 M582 M583 M584 M585 M586 M587 M588 592
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    17
0 Defined   Cross-reference of data names   References

0                                           M593 M602 M617
      292   ENDER-DESC . . . . . . . . . .  M407 M418 M424 M556 M567 M572
      112   EOF-FLAG . . . . . . . . . . .  M337
      240   ERROR-COUNTER. . . . . . . . .  363 M376 399 408 411 505 M518 547 557 560
      116   ERROR-FLAG
      244   ERROR-HOLD . . . . . . . . . .  362 M399 M400 M400 M401 403 504 M547 M548 M548 M549 552
      290   ERROR-TOTAL. . . . . . . . . .  M409 M411 M416 M417 M422 M423 M558 M560 M565 M566 M570 M571
      187   FEATURE. . . . . . . . . . . .  M646 M671
      148   FILE-RECORD-INFO . . . . . . .  M495
      149   FILE-RECORD-INFO-P1-120
      176   FILE-RECORD-INFO-P121-240
      134   FILE-RECORD-INFO-SKELETON. . .  494
      133   FILE-RECORD-INFORMATION-REC
      100   GRP-0101
      102   GRP-0101-KEY
      105   GRP-0102
      107   GRP-0102-KEY
      318   HYPHEN-LINE. . . . . . . . . .  393 439 541 543 587
      284   ID-AGAIN . . . . . . . . . . .  M487
      317   INF-ANSI-REFERENCE . . . . . .  M450 M453 M466 M468 M600 M603 M616 M618
      312   INFO-TEXT. . . . . . . . . . .  M451 M601
      241   INSPECT-COUNTER. . . . . . . .  365 399 421 423 507 M516 547 569 571
       82   IX-FS3 . . . . . . . . . . . .  49 331 356 649 692
       94   IX-FS3-ALTER-KEY
       92   IX-FS3-KEY . . . . . . . . . .  53
       89   IX-FS3-REC-120
       90   IX-FS3-REC-120-240
      125   IX-FS3-STATUS. . . . . . . . .  54 343 346 M645 650 655 M669 681 688
      126   IX-FS3-STAT1 . . . . . . . . .  336 339
      127   IX-FS3-STAT2
       88   IX-FS3R1-F-G-240 . . . . . . .  680
      161   ODO-NUMBER
      189   P-OR-F . . . . . . . . . . . .  M375 M376 383 M388 M516 M517 M518 M519 526 M529
      191   PAR-NAME . . . . . . . . . . .  M390 M531 M647 M672
      193   PARDOT-X . . . . . . . . . . .  M379 M523
      242   PASS-COUNTER . . . . . . . . .  361 M375 401 402 503 M517 549 551
      118   PERM-ERRORS. . . . . . . . . .  M340
       76   PRINT-FILE . . . . . . . . . .  46 370 486 511
       78   PRINT-REC. . . . . . . . . . .  M381 M456 M458 M525 M606 M608
       60   RAW-DATA . . . . . . . . . . .  40 357 359 368 476 478 485 499 501 510
       63   RAW-DATA-KEY . . . . . . . . .  44 M358 M477 M500
       62   RAW-DATA-SATZ. . . . . . . . .  366 483 508
      196   RE-MARK. . . . . . . . . . . .  M348 M391 M520 M532 M653 M683 M686
      238   REC-CT . . . . . . . . . . . .  378 380 390 522 524 531
      237   REC-SKL-SUB. . . . . . . . . .  M490 M493 495
      246   RECORD-COUNT . . . . . . . . .  M428 429 M441 M576 577 M589
      114   RECORDS-IN-ERROR
      171   RECORDS-IN-FILE. . . . . . . .  M632
      155   REELUNIT-NUMBER
      123   STATUS-TEST-READ
      120   STATUS-TEST-00 . . . . . . . .  M644 M670
      122   STATUS-TEST-10 . . . . . . . .  335
      197   TEST-COMPUTED. . . . . . . . .  456 606
      212   TEST-CORRECT . . . . . . . . .  458 608
      265   TEST-ID. . . . . . . . . . . .  M487
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    18
0 Defined   Cross-reference of data names   References

0     324   TEST-NO. . . . . . . . . . . .  333 M625 M668
      185   TEST-RESULTS . . . . . . . . .  381 M488 525
      243   TOTAL-ERROR
      159   UPDATE-NUMBER
      110   WRK-CS-09V00
      169   XBLOCK-SIZE. . . . . . . . . .  M631
      151   XFILE-NAME . . . . . . . . . .  M626
      173   XFILE-ORGANIZATION . . . . . .  M633
      175   XLABEL-TYPE. . . . . . . . . .  M634
      163   XPROGRAM-NAME. . . . . . . . .  M628
      178   XRECORD-KEY
      165   XRECORD-LENGTH . . . . . . . .  M629
      153   XRECORD-NAME . . . . . . . . .  M627
      157   XRECORD-NUMBER . . . . . . . .  M635
      314   XXCOMPUTED . . . . . . . . . .  M465 M615
      316   XXCORRECT. . . . . . . . . . .  M465 M615
      309   XXINFO . . . . . . . . . . . .  452 467 602 617
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    19
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

      611   BAIL-OUT . . . . . . . . . . .  P528
      619   BAIL-OUT-EX. . . . . . . . . .  E528 G613
      614   BAIL-OUT-WRITE . . . . . . . .  G612
      594   BLANK-LINE-PRINT
      697   CCVS-EXIT
      496   CCVS-INIT-EXIT
      492   CCVS-INIT-FILE . . . . . . . .  P491
      698   CCVS-999999
      474   CCVS1
      620   CCVS1-EXIT . . . . . . . . . .  G497
      498   CLOSE-FILES. . . . . . . . . .  G699
      538   COLUMN-NAMES-ROUTINE . . . . .  E489
      461   D-BAIL-OUT . . . . . . . . . .  P387
      469   D-BAIL-OUT-EX. . . . . . . . .  E387 G463
      464   D-BAIL-OUT-WRITE . . . . . . .  G462
      345   D-C-FAIL-GF-01-0
      351   D-C-PASS-GF-01-0 . . . . . . .  G344
      342   D-C-TEST-GF-01-1 . . . . . . .  G334
      353   D-C-WRITE-GF-01-0. . . . . . .  G350
      355   D-CLOSE-FILES
      367   D-END-E-2. . . . . . . . . . .  G359 G366
      392   D-END-ROUTINE. . . . . . . . .  P369
      398   D-END-ROUTINE-1
      406   D-END-ROUTINE-12
      414   D-END-ROUTINE-13 . . . . . . .  E369
      395   D-END-RTN-EXIT
      376   D-FAIL . . . . . . . . . . . .  P349
      446   D-FAIL-ROUTINE . . . . . . . .  P385
      460   D-FAIL-ROUTINE-EX. . . . . . .  E385 G454
      455   D-FAIL-ROUTINE-WRITE . . . . .  G448 G449
      375   D-PASS . . . . . . . . . . . .  P352
      377   D-PRINT-DETAIL . . . . . . . .  P354
      373   D-TERMINATE-CALL
      371   D-TERMINATE-CCVS
      427   D-WRITE-LINE . . . . . . . . .  P382 P384 P394 P397 P405 P413 P420 P425 P426 P452 P456 P458 P467
      443   D-WRT-LN . . . . . . . . . . .  P433 P434 P435 P436 P437 P438 P439 P442
      519   DE-LETE
      470   DECL-EXIT. . . . . . . . . . .  G341
      484   END-E-1. . . . . . . . . . . .  G478 G483
      509   END-E-2. . . . . . . . . . . .  G501 G508
      542   END-ROUTINE. . . . . . . . . .  P511
      546   END-ROUTINE-1
      555   END-ROUTINE-12
      563   END-ROUTINE-13 . . . . . . . .  E511
      544   END-RTN-EXIT
      518   FAIL . . . . . . . . . . . . .  P654 P690
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    20
0 Defined   Cross-reference of procedures   References

0     596   FAIL-ROUTINE . . . . . . . . .  P527
      610   FAIL-ROUTINE-EX. . . . . . . .  E527 G604
      605   FAIL-ROUTINE-WRITE . . . . . .  G598 G599
      533   HEAD-ROUTINE . . . . . . . . .  P489
      332   INPUT-PROCESS
      516   INSPT
      475   OPEN-FILES
      652   OPN-FAIL-GF-01-0
      643   OPN-INIT-GF-01-0
      658   OPN-PASS-GF-01-0 . . . . . . .  G651
      660   OPN-WRITE-GF-01-0. . . . . . .  G657
      517   PASS . . . . . . . . . . . . .  P659
      521   PRINT-DETAIL . . . . . . . . .  P661 P691
      685   RWR-FAIL-GF-01-0
      667   RWR-INIT-GF-01-0
      679   RWR-TEST-GF-01-1
      687   RWR-WRITE-GF-01-0. . . . . . .  G684
      330   SECT-IX105-0002
      623   SECT-IX120A-0003
      624   SEQ-INIT-010
      514   TERMINATE-CALL
      512   TERMINATE-CCVS
      694   TERMINATE-ROUTINE
      575   WRITE-LINE . . . . . . . . . .  P525 P526 P534 P535 P536 P537 P539 P540 P541 P543 P545 P554 P562 P568 P573 P574
                                            P602 P606 P608 P617
      591   WRT-LN . . . . . . . . . . . .  P581 P582 P583 P584 P585 P586 P587 P590 P595
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    21
0 Defined   Cross-reference of programs     References

        3   IX120A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX120A    Date 06/04/2022  Time 11:58:10   Page    22
0LineID  Message code  Message text

     76  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     82  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     82  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX120A:
 *    Source records = 699
 *    Data Division statements = 120
 *    Procedure Division statements = 347
 *    Generated COBOL statements = 0
 *    Program complexity factor = 355
0End of compilation 1,  program IX120A,  highest severity 0.
0Return code 0
