1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:32   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:32   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1134.2
   000002         000200 PROGRAM-ID.                                                      IX1134.2
   000003         000300     IX113A.                                                      IX1134.2
   000004         000500*                                                              *  IX1134.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1134.2
   000006         000700*                                                              *  IX1134.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1134.2
   000008         000900*                                                              *  IX1134.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1134.2
   000010         001100*                                                              *  IX1134.2
   000011         001300*                                                                 IX1134.2
   000012         001400*    1.  THE  ROUTINE  CREATES  THE  MASS  STORAGE  FILE  IX-FS3  IX1134.2
   000013         001500*        CONTAINING  50  RECORDS. EACH BLOCK CONTAINS 2 RECORDS,  IX1134.2
   000014         001600*        EACH  RECORD  CONTAINS  240 CHARACTERS, ORGANIZATION IS  IX1134.2
   000015         001700*        INDEXED,  ACCESS  IS SEQUENTIAL.                         IX1134.2
   000016         001800*                                                                 IX1134.2
   000017         001900*    2. THE ROUTINE READS THE CREATED FILE,VERIFIES IT AND       *IX1134.2
   000018         002000*       CHECKS THE FILE STATUS CODES:                             IX1134.2
   000019         002100*           00  -  AFTER OPEN OUTPUT                              IX1134.2
   000020         002200*           00  -  AFTER WRITE                                    IX1134.2
   000021         002300*           00  -  AFTER CLOSE OUTPUT                             IX1134.2
   000022         002400*           42  -  AFTER CLOSE OUTPUT                             IX1134.2
   000023         002500*                                                                 IX1134.2
   000024         002600*    4. X-CARDS USED IN THIS PROGRAM:                             IX1134.2
   000025         002700*                                                                 IX1134.2
   000026         002800*                 XXXXX024                                        IX1134.2
   000027         002900*                 XXXXX055.                                       IX1134.2
   000028         003000*         P       XXXXX062.                                       IX1134.2
   000029         003100*                 XXXXX082.                                       IX1134.2
   000030         003200*                 XXXXX083.                                       IX1134.2
   000031         003300*         C       XXXXX084                                        IX1134.2
   000032         003400*                                                                 IX1134.2
   000033         003500*                                                                 IX1134.2
   000034         003600 ENVIRONMENT DIVISION.                                            IX1134.2
   000035         003700 CONFIGURATION SECTION.                                           IX1134.2
   000036         003800 SOURCE-COMPUTER.                                                 IX1134.2
   000037         003900     XXXXX082.                                                    IX1134.2
   000038         004000 OBJECT-COMPUTER.                                                 IX1134.2
   000039         004100     XXXXX083.                                                    IX1134.2
   000040         004200 INPUT-OUTPUT SECTION.                                            IX1134.2
   000041         004300 FILE-CONTROL.                                                    IX1134.2
   000042         004400     SELECT RAW-DATA   ASSIGN TO                                  IX1134.2 62
   000043         004500     XXXXX062                                                     IX1134.2
   000044         004600            ORGANIZATION IS INDEXED                               IX1134.2
   000045         004700            ACCESS MODE IS RANDOM                                 IX1134.2
   000046         004800            RECORD KEY IS RAW-DATA-KEY.                           IX1134.2 65
   000047         004900*                                                                 IX1134.2
   000048         005000     SELECT PRINT-FILE ASSIGN TO                                  IX1134.2 78
   000049         005100     XXXXX055.                                                    IX1134.2
   000050         005200*                                                                 IX1134.2
   000051         005300     SELECT IX-FS3 ASSIGN                                         IX1134.2 84
   000052         005400     XXXXX024                                                     IX1134.2
   000053         005500     ORGANIZATION IS INDEXED                                      IX1134.2
   000054         005600     ACCESS MODE IS SEQUENTIAL                                    IX1134.2
   000055         005700     RECORD KEY IS IX-FS3-KEY                                     IX1134.2 94
   000056         005800     FILE STATUS IS IX-FS3-STATUS.                                IX1134.2 127
   000057         005900                                                                  IX1134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000 DATA DIVISION.                                                   IX1134.2
   000059         006100                                                                  IX1134.2
   000060         006200 FILE SECTION.                                                    IX1134.2
   000061         006300                                                                  IX1134.2
   000062         006400 FD  RAW-DATA.                                                    IX1134.2
   000063         006500                                                                  IX1134.2
   000064         006600 01  RAW-DATA-SATZ.                                               IX1134.2
   000065         006700     05  RAW-DATA-KEY        PIC X(6).                            IX1134.2
   000066         006800     05  C-DATE              PIC 9(6).                            IX1134.2
   000067         006900     05  C-TIME              PIC 9(8).                            IX1134.2
   000068         007000     05  C-NO-OF-TESTS       PIC 99.                              IX1134.2
   000069         007100     05  C-OK                PIC 999.                             IX1134.2
   000070         007200     05  C-ALL               PIC 999.                             IX1134.2
   000071         007300     05  C-FAIL              PIC 999.                             IX1134.2
   000072         007400     05  C-DELETED           PIC 999.                             IX1134.2
   000073         007500     05  C-INSPECT           PIC 999.                             IX1134.2
   000074         007600     05  C-NOTE              PIC X(13).                           IX1134.2
   000075         007700     05  C-INDENT            PIC X.                               IX1134.2
   000076         007800     05  C-ABORT             PIC X(8).                            IX1134.2
   000077         007900                                                                  IX1134.2
   000078         008000 FD  PRINT-FILE.                                                  IX1134.2

 ==000078==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000079         008100                                                                  IX1134.2
   000080         008200 01  PRINT-REC               PIC X(120).                          IX1134.2
   000081         008300                                                                  IX1134.2
   000082         008400 01  DUMMY-RECORD            PIC X(120).                          IX1134.2
   000083         008500                                                                  IX1134.2
   000084         008600 FD  IX-FS3                                                       IX1134.2

 ==000084==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000084==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000085         008700        DATA RECORDS IX-FS3R1-F-G-240                             IX1134.2 *
   000086         008800        LABEL RECORD STANDARD                                     IX1134.2
   000087         008900        RECORD 240                                                IX1134.2
   000088         009000        BLOCK CONTAINS 2 RECORDS.                                 IX1134.2
   000089         009100                                                                  IX1134.2
   000090         009200 01  IX-FS3R1-F-G-240.                                            IX1134.2
   000091         009300     05  IX-FS3-REC-120      PIC X(120).                          IX1134.2
   000092         009400     05  IX-FS3-REC-120-240.                                      IX1134.2
   000093         009500         10  FILLER          PIC X(8).                            IX1134.2
   000094         009600         10  IX-FS3-KEY      PIC X(29).                           IX1134.2
   000095         009700         10  FILLER          PIC X(9).                            IX1134.2
   000096         009800         10  IX-FS3-ALTER-KEY  PIC X(29).                         IX1134.2
   000097         009900         10  FILLER            PIC X(45).                         IX1134.2
   000098         010000                                                                  IX1134.2
   000099         010100                                                                  IX1134.2
   000100         010200 WORKING-STORAGE SECTION.                                         IX1134.2
   000101         010300                                                                  IX1134.2
   000102         010400 01  GRP-0101.                                                    IX1134.2
   000103         010500     05  FILLER              PIC X(10) VALUE "RECORD-KEY".        IX1134.2
   000104         010600     05  GRP-0101-KEY        PIC 9(9)  VALUE ZERO.                IX1134.2 IMP
   000105         010700     05  FILLER              PIC X(10) VALUE "END-OF-KEY".        IX1134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000106         010800                                                                  IX1134.2
   000107         010900 01  GRP-0102.                                                    IX1134.2
   000108         011000     05  FILLER              PIC X(10) VALUE "ALTERN-KEY".        IX1134.2
   000109         011100     05  GRP-0102-KEY        PIC 9(9)  VALUE ZERO.                IX1134.2 IMP
   000110         011200     05  FILLER              PIC X(10) VALUE "END-AL-KEY".        IX1134.2
   000111         011300                                                                  IX1134.2
   000112         011400 01  WRK-CS-09V00            PIC S9(9) COMP VALUE ZERO.           IX1134.2 IMP
   000113         011500                                                                  IX1134.2
   000114         011600 01  EOF-FLAG                PIC 9 VALUE ZERO.                    IX1134.2 IMP
   000115         011700                                                                  IX1134.2
   000116         011800 01  RECORDS-IN-ERROR        PIC S9(5) COMP VALUE ZERO.           IX1134.2 IMP
   000117         011900                                                                  IX1134.2
   000118         012000 01  ERROR-FLAG              PIC 9 VALUE ZERO.                    IX1134.2 IMP
   000119         012100                                                                  IX1134.2
   000120         012200 01  PERM-ERRORS             PIC S9(5) COMP VALUE ZERO.           IX1134.2 IMP
   000121         012300                                                                  IX1134.2
   000122         012400 01  STATUS-TEST-00          PIC 9 VALUE ZERO.                    IX1134.2 IMP
   000123         012500                                                                  IX1134.2
   000124         012600 01  STATUS-TEST-10          PIC 9 VALUE ZERO.                    IX1134.2 IMP
   000125         012700 01  STATUS-TEST-READ        PIC 9 VALUE ZERO.                    IX1134.2 IMP
   000126         012800                                                                  IX1134.2
   000127         012900 01  IX-FS3-STATUS.                                               IX1134.2
   000128         013000     05  IX-FS3-STAT1        PIC X.                               IX1134.2
   000129         013100     05  IX-FS3-STAT2        PIC X.                               IX1134.2
   000130         013200                                                                  IX1134.2
   000131         013300 01  COUNT-OF-RECS           PIC 9(5).                            IX1134.2
   000132         013400                                                                  IX1134.2
   000133         013500 01  COUNT-OF-RECORDS REDEFINES COUNT-OF-RECS  PIC 9(5).          IX1134.2 131
   000134         013600                                                                  IX1134.2
   000135         013700 01  FILE-RECORD-INFORMATION-REC.                                 IX1134.2
   000136         013800     05  FILE-RECORD-INFO-SKELETON.                               IX1134.2
   000137         013900         10  FILLER          PIC X(48) VALUE                      IX1134.2
   000138         014000              "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00". IX1134.2
   000139         014100         10  FILLER          PIC X(46) VALUE                      IX1134.2
   000140         014200                ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000". IX1134.2
   000141         014300         10  FILLER          PIC X(26) VALUE                      IX1134.2
   000142         014400                                    ",LFIL=000000,ORG=  ,LBLR= ". IX1134.2
   000143         014500         10  FILLER          PIC X(37) VALUE                      IX1134.2
   000144         014600                         ",RECKEY=                             ". IX1134.2
   000145         014700         10  FILLER          PIC X(38) VALUE                      IX1134.2
   000146         014800                        ",ALTKEY1=                             ". IX1134.2
   000147         014900         10  FILLER          PIC X(38) VALUE                      IX1134.2
   000148         015000                        ",ALTKEY2=                             ". IX1134.2
   000149         015100         10  FILLER          PIC X(7) VALUE SPACE.                IX1134.2 IMP
   000150         015200     05  FILE-RECORD-INFO             OCCURS 10.                  IX1134.2
   000151         015300         10  FILE-RECORD-INFO-P1-120.                             IX1134.2
   000152         015400             15  FILLER      PIC X(5).                            IX1134.2
   000153         015500             15  XFILE-NAME  PIC X(6).                            IX1134.2
   000154         015600             15  FILLER      PIC X(8).                            IX1134.2
   000155         015700             15  XRECORD-NAME  PIC X(6).                          IX1134.2
   000156         015800             15  FILLER        PIC X(1).                          IX1134.2
   000157         015900             15  REELUNIT-NUMBER  PIC 9(1).                       IX1134.2
   000158         016000             15  FILLER           PIC X(7).                       IX1134.2
   000159         016100             15  XRECORD-NUMBER   PIC 9(6).                       IX1134.2
   000160         016200             15  FILLER           PIC X(6).                       IX1134.2
   000161         016300             15  UPDATE-NUMBER    PIC 9(2).                       IX1134.2
   000162         016400             15  FILLER           PIC X(5).                       IX1134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000163         016500             15  ODO-NUMBER       PIC 9(4).                       IX1134.2
   000164         016600             15  FILLER           PIC X(5).                       IX1134.2
   000165         016700             15  XPROGRAM-NAME    PIC X(5).                       IX1134.2
   000166         016800             15  FILLER           PIC X(7).                       IX1134.2
   000167         016900             15  XRECORD-LENGTH   PIC 9(6).                       IX1134.2
   000168         017000             15  FILLER           PIC X(7).                       IX1134.2
   000169         017100             15  CHARS-OR-RECORDS  PIC X(2).                      IX1134.2
   000170         017200             15  FILLER            PIC X(1).                      IX1134.2
   000171         017300             15  XBLOCK-SIZE       PIC 9(4).                      IX1134.2
   000172         017400             15  FILLER            PIC X(6).                      IX1134.2
   000173         017500             15  RECORDS-IN-FILE   PIC 9(6).                      IX1134.2
   000174         017600             15  FILLER            PIC X(5).                      IX1134.2
   000175         017700             15  XFILE-ORGANIZATION  PIC X(2).                    IX1134.2
   000176         017800             15  FILLER              PIC X(6).                    IX1134.2
   000177         017900             15  XLABEL-TYPE         PIC X(1).                    IX1134.2
   000178         018000         10  FILE-RECORD-INFO-P121-240.                           IX1134.2
   000179         018100             15  FILLER              PIC X(8).                    IX1134.2
   000180         018200             15  XRECORD-KEY         PIC X(29).                   IX1134.2
   000181         018300             15  FILLER              PIC X(9).                    IX1134.2
   000182         018400             15  ALTERNATE-KEY1      PIC X(29).                   IX1134.2
   000183         018500             15  FILLER              PIC X(9).                    IX1134.2
   000184         018600             15  ALTERNATE-KEY2      PIC X(29).                   IX1134.2
   000185         018700             15  FILLER              PIC X(7).                    IX1134.2
   000186         018800                                                                  IX1134.2
   000187         018900 01  TEST-RESULTS.                                                IX1134.2
   000188         019000     02 FILLER                   PIC X      VALUE SPACE.          IX1134.2 IMP
   000189         019100     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1134.2 IMP
   000190         019200     02 FILLER                   PIC X      VALUE SPACE.          IX1134.2 IMP
   000191         019300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1134.2 IMP
   000192         019400     02 FILLER                   PIC X      VALUE SPACE.          IX1134.2 IMP
   000193         019500     02  PAR-NAME.                                                IX1134.2
   000194         019600       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1134.2 IMP
   000195         019700       03  PARDOT-X              PIC X      VALUE SPACE.          IX1134.2 IMP
   000196         019800       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1134.2 IMP
   000197         019900     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1134.2 IMP
   000198         020000     02 RE-MARK                  PIC X(61).                       IX1134.2
   000199         020100 01  TEST-COMPUTED.                                               IX1134.2
   000200         020200     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1134.2 IMP
   000201         020300     02 FILLER                   PIC X(17)  VALUE                 IX1134.2
   000202         020400            "       COMPUTED=".                                   IX1134.2
   000203         020500     02 COMPUTED-X.                                               IX1134.2
   000204         020600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1134.2 IMP
   000205         020700     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1134.2 204
   000206         020800                                 PIC -9(9).9(9).                  IX1134.2
   000207         020900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1134.2 204
   000208         021000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1134.2 204
   000209         021100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1134.2 204
   000210         021200     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1134.2 204
   000211         021300         04 COMPUTED-18V0                    PIC -9(18).          IX1134.2
   000212         021400         04 FILLER                           PIC X.               IX1134.2
   000213         021500     03 FILLER PIC X(50) VALUE SPACE.                             IX1134.2 IMP
   000214         021600 01  TEST-CORRECT.                                                IX1134.2
   000215         021700     02 FILLER PIC X(30) VALUE SPACE.                             IX1134.2 IMP
   000216         021800     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1134.2
   000217         021900     02 CORRECT-X.                                                IX1134.2
   000218         022000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1134.2 IMP
   000219         022100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1134.2 218
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000220         022200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1134.2 218
   000221         022300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1134.2 218
   000222         022400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1134.2 218
   000223         022500     03      CR-18V0 REDEFINES CORRECT-A.                         IX1134.2 218
   000224         022600         04 CORRECT-18V0                     PIC -9(18).          IX1134.2
   000225         022700         04 FILLER                           PIC X.               IX1134.2
   000226         022800     03 FILLER PIC X(2) VALUE SPACE.                              IX1134.2 IMP
   000227         022900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1134.2 IMP
   000228         023000 01  CCVS-C-1.                                                    IX1134.2
   000229         023100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1134.2
   000230         023200-    "SS  PARAGRAPH-NAME                                          IX1134.2
   000231         023300-    "       REMARKS".                                            IX1134.2
   000232         023400     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1134.2 IMP
   000233         023500 01  CCVS-C-2.                                                    IX1134.2
   000234         023600     02 FILLER                     PIC X        VALUE SPACE.      IX1134.2 IMP
   000235         023700     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1134.2
   000236         023800     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1134.2 IMP
   000237         023900     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1134.2
   000238         024000     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1134.2 IMP
   000239         024100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1134.2 IMP
   000240         024200 01  REC-CT                        PIC 99       VALUE ZERO.       IX1134.2 IMP
   000241         024300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1134.2 IMP
   000242         024400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1134.2 IMP
   000243         024500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1134.2 IMP
   000244         024600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1134.2 IMP
   000245         024700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1134.2 IMP
   000246         024800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1134.2 IMP
   000247         024900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1134.2 IMP
   000248         025000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1134.2 IMP
   000249         025100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1134.2 IMP
   000250         025200 01  CCVS-H-1.                                                    IX1134.2
   000251         025300     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1134.2 IMP
   000252         025400     02  FILLER                    PIC X(42)    VALUE             IX1134.2
   000253         025500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1134.2
   000254         025600     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1134.2 IMP
   000255         025700 01  CCVS-H-2A.                                                   IX1134.2
   000256         025800   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1134.2 IMP
   000257         025900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1134.2
   000258         026000   02  FILLER                        PIC XXXX   VALUE             IX1134.2
   000259         026100     "4.2 ".                                                      IX1134.2
   000260         026200   02  FILLER                        PIC X(28)  VALUE             IX1134.2
   000261         026300            " COPY - NOT FOR DISTRIBUTION".                       IX1134.2
   000262         026400   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1134.2 IMP
   000263         026500                                                                  IX1134.2
   000264         026600 01  CCVS-H-2B.                                                   IX1134.2
   000265         026700   02  FILLER                        PIC X(15)  VALUE             IX1134.2
   000266         026800            "TEST RESULT OF ".                                    IX1134.2
   000267         026900   02  TEST-ID                       PIC X(9).                    IX1134.2
   000268         027000   02  FILLER                        PIC X(4)   VALUE             IX1134.2
   000269         027100            " IN ".                                               IX1134.2
   000270         027200   02  FILLER                        PIC X(12)  VALUE             IX1134.2
   000271         027300     " HIGH       ".                                              IX1134.2
   000272         027400   02  FILLER                        PIC X(22)  VALUE             IX1134.2
   000273         027500            " LEVEL VALIDATION FOR ".                             IX1134.2
   000274         027600   02  FILLER                        PIC X(58)  VALUE             IX1134.2
   000275         027700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1134.2
   000276         027800 01  CCVS-H-3.                                                    IX1134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000277         027900     02  FILLER                      PIC X(34)  VALUE             IX1134.2
   000278         028000            " FOR OFFICIAL USE ONLY    ".                         IX1134.2
   000279         028100     02  FILLER                      PIC X(58)  VALUE             IX1134.2
   000280         028200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1134.2
   000281         028300     02  FILLER                      PIC X(28)  VALUE             IX1134.2
   000282         028400            "  COPYRIGHT   1985 ".                                IX1134.2
   000283         028500 01  CCVS-E-1.                                                    IX1134.2
   000284         028600     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1134.2 IMP
   000285         028700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1134.2
   000286         028800     02 ID-AGAIN                     PIC X(9).                    IX1134.2
   000287         028900     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1134.2 IMP
   000288         029000 01  CCVS-E-2.                                                    IX1134.2
   000289         029100     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1134.2 IMP
   000290         029200     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1134.2 IMP
   000291         029300     02 CCVS-E-2-2.                                               IX1134.2
   000292         029400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1134.2 IMP
   000293         029500         03 FILLER                   PIC X      VALUE SPACE.      IX1134.2 IMP
   000294         029600         03 ENDER-DESC               PIC X(44)  VALUE             IX1134.2
   000295         029700            "ERRORS ENCOUNTERED".                                 IX1134.2
   000296         029800 01  CCVS-E-3.                                                    IX1134.2
   000297         029900     02  FILLER                      PIC X(22)  VALUE             IX1134.2
   000298         030000            " FOR OFFICIAL USE ONLY".                             IX1134.2
   000299         030100     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1134.2 IMP
   000300         030200     02  FILLER                      PIC X(58)  VALUE             IX1134.2
   000301         030300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1134.2
   000302         030400     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1134.2 IMP
   000303         030500     02 FILLER                       PIC X(15)  VALUE             IX1134.2
   000304         030600             " COPYRIGHT 1985".                                   IX1134.2
   000305         030700 01  CCVS-E-4.                                                    IX1134.2
   000306         030800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1134.2 IMP
   000307         030900     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1134.2
   000308         031000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1134.2 IMP
   000309         031100     02 FILLER                       PIC X(40)  VALUE             IX1134.2
   000310         031200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1134.2
   000311         031300 01  XXINFO.                                                      IX1134.2
   000312         031400     02 FILLER                       PIC X(19)  VALUE             IX1134.2
   000313         031500            "*** INFORMATION ***".                                IX1134.2
   000314         031600     02 INFO-TEXT.                                                IX1134.2
   000315         031700       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1134.2 IMP
   000316         031800       04 XXCOMPUTED                 PIC X(20).                   IX1134.2
   000317         031900       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1134.2 IMP
   000318         032000       04 XXCORRECT                  PIC X(20).                   IX1134.2
   000319         032100     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1134.2
   000320         032200 01  HYPHEN-LINE.                                                 IX1134.2
   000321         032300     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1134.2 IMP
   000322         032400     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1134.2
   000323         032500-    "*****************************************".                 IX1134.2
   000324         032600     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1134.2
   000325         032700-    "******************************".                            IX1134.2
   000326         032800 01  TEST-NO                         PIC 99.                      IX1134.2
   000327         032900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1134.2
   000328         033000     "IX113A".                                                    IX1134.2
   000329         033100 PROCEDURE DIVISION.                                              IX1134.2
   000330         033200 DECLARATIVES.                                                    IX1134.2
   000331         033300                                                                  IX1134.2
   000332         033400 SECT-IX105-0002 SECTION.                                         IX1134.2
   000333         033500     USE AFTER EXCEPTION PROCEDURE ON IX-FS3.                     IX1134.2 84
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000334         033600 INPUT-PROCESS.                                                   IX1134.2
   000335         033700     IF TEST-NO = 5                                               IX1134.2 326
   000336      1  033800        GO TO D-C-TEST-GF-02-1.                                   IX1134.2 344
   000337         033900     IF STATUS-TEST-10 EQUAL TO 1                                 IX1134.2 124
   000338      1  034000        IF  IX-FS3-STAT1 EQUAL TO "1"                             IX1134.2 128
   000339      2  034100            MOVE 1 TO EOF-FLAG                                    IX1134.2 114
   000340      1  034200        ELSE                                                      IX1134.2
   000341      2  034300           IF  IX-FS3-STAT1 GREATER THAN "1"                      IX1134.2 128
   000342      3  034400           MOVE 1 TO PERM-ERRORS.                                 IX1134.2 120
   000343         034500     GO TO DECL-EXIT.                                             IX1134.2 471
   000344         034600 D-C-TEST-GF-02-1.                                                IX1134.2
   000345         034700     IF IX-FS3-STATUS EQUAL TO "42"                               IX1134.2 127
   000346      1  034800         GO TO D-C-PASS-GF-02-0.                                  IX1134.2 353
   000347         034900 D-C-FAIL-GF-02-0.                                                IX1134.2
   000348         035000     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1134.2 127 204
   000349         035100     MOVE "42" TO CORRECT-X.                                      IX1134.2 217
   000350         035200     MOVE "IX-5, 1.3.4, (5) B" TO RE-MARK.                        IX1134.2 198
   000351         035300     PERFORM D-FAIL.                                              IX1134.2 377
   000352         035400     GO TO D-C-WRITE-GF-02-0.                                     IX1134.2 355
   000353         035500 D-C-PASS-GF-02-0.                                                IX1134.2
   000354         035600     PERFORM D-PASS.                                              IX1134.2 376
   000355         035700 D-C-WRITE-GF-02-0.                                               IX1134.2
   000356         035800     PERFORM D-PRINT-DETAIL.                                      IX1134.2 378
   000357         035900 D-CLOSE-FILES.                                                   IX1134.2
   000358         036000     OPEN I-O RAW-DATA.                                           IX1134.2 62
   000359         036100     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1134.2 327 65
   000360         036200     READ RAW-DATA INVALID KEY GO TO D-END-E-2.                   IX1134.2 62 368
   000361         036300     MOVE "OK.     " TO C-ABORT.                                  IX1134.2 76
   000362         036400     MOVE PASS-COUNTER TO C-OK.                                   IX1134.2 244 69
   000363         036500     MOVE ERROR-HOLD   TO C-ALL.                                  IX1134.2 246 70
   000364         036600     MOVE ERROR-COUNTER TO C-FAIL.                                IX1134.2 242 71
   000365         036700     MOVE DELETE-COUNTER TO C-DELETED.                            IX1134.2 241 72
   000366         036800     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1134.2 243 73
   000367         036900     REWRITE RAW-DATA-SATZ INVALID KEY GO TO D-END-E-2.           IX1134.2 64 368
   000368         037000 D-END-E-2.                                                       IX1134.2
   000369         037100     CLOSE RAW-DATA.                                              IX1134.2 62
   000370         037200     PERFORM D-END-ROUTINE THRU D-END-ROUTINE-13.                 IX1134.2 393 415
   000371         037300     CLOSE PRINT-FILE.                                            IX1134.2 78
   000372         037400 D-TERMINATE-CCVS.                                                IX1134.2
   000373         037500     EXIT PROGRAM.                                                IX1134.2
   000374         037600 D-TERMINATE-CALL.                                                IX1134.2
   000375         037700     STOP     RUN.                                                IX1134.2
   000376         037800 D-PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.         IX1134.2 191 244
   000377         037900 D-FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.        IX1134.2 191 242
   000378         038000 D-PRINT-DETAIL.                                                  IX1134.2
   000379         038100     IF   REC-CT NOT EQUAL TO ZERO                                IX1134.2 240 IMP
   000380      1  038200          MOVE "." TO PARDOT-X                                    IX1134.2 195
   000381      1  038300          MOVE REC-CT TO DOTVALUE.                                IX1134.2 240 196
   000382         038400     MOVE TEST-RESULTS TO PRINT-REC.                              IX1134.2 187 80
   000383         038500     PERFORM D-WRITE-LINE.                                        IX1134.2 428
   000384         038600     IF   P-OR-F EQUAL TO "FAIL*"                                 IX1134.2 191
   000385      1  038700          PERFORM D-WRITE-LINE                                    IX1134.2 428
   000386      1  038800          PERFORM D-FAIL-ROUTINE THRU D-FAIL-ROUTINE-EX           IX1134.2 447 461
   000387         038900     ELSE                                                         IX1134.2
   000388      1  039000          PERFORM D-BAIL-OUT THRU D-BAIL-OUT-EX.                  IX1134.2 462 470
   000389         039100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1134.2 IMP 191 IMP 203
   000390         039200     MOVE SPACE TO CORRECT-X.                                     IX1134.2 IMP 217
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000391         039300     IF   REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.           IX1134.2 240 IMP IMP 193
   000392         039400     MOVE SPACE TO RE-MARK.                                       IX1134.2 IMP 198
   000393         039500 D-END-ROUTINE.                                                   IX1134.2
   000394         039600     MOVE HYPHEN-LINE TO DUMMY-RECORD.                            IX1134.2 320 82
   000395         039700     PERFORM D-WRITE-LINE 5 TIMES.                                IX1134.2 428
   000396         039800 D-END-RTN-EXIT.                                                  IX1134.2
   000397         039900     MOVE CCVS-E-1 TO DUMMY-RECORD.                               IX1134.2 283 82
   000398         040000     PERFORM D-WRITE-LINE 2 TIMES.                                IX1134.2 428
   000399         040100 D-END-ROUTINE-1.                                                 IX1134.2
   000400         040200     ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO       IX1134.2 242 246 243
   000401         040300     ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.                IX1134.2 246 241 246
   000402         040400     ADD PASS-COUNTER TO ERROR-HOLD.                              IX1134.2 244 246
   000403         040500     MOVE PASS-COUNTER TO CCVS-E-4-1.                             IX1134.2 244 306
   000404         040600     MOVE ERROR-HOLD TO CCVS-E-4-2.                               IX1134.2 246 308
   000405         040700     MOVE CCVS-E-4 TO CCVS-E-2-2.                                 IX1134.2 305 291
   000406         040800     MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM D-WRITE-LINE.          IX1134.2 288 82 428
   000407         040900  D-END-ROUTINE-12.                                               IX1134.2
   000408         041000     MOVE "TEST(S) FAILED" TO ENDER-DESC.                         IX1134.2 294
   000409         041100     IF  ERROR-COUNTER IS EQUAL TO ZERO                           IX1134.2 242 IMP
   000410      1  041200         MOVE "NO " TO ERROR-TOTAL                                IX1134.2 292
   000411         041300     ELSE                                                         IX1134.2
   000412      1  041400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1134.2 242 292
   000413         041500     MOVE    CCVS-E-2 TO DUMMY-RECORD.                            IX1134.2 288 82
   000414         041600     PERFORM D-WRITE-LINE.                                        IX1134.2 428
   000415         041700 D-END-ROUTINE-13.                                                IX1134.2
   000416         041800     IF  DELETE-COUNTER IS EQUAL TO ZERO                          IX1134.2 241 IMP
   000417      1  041900         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1134.2 292
   000418      1  042000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1134.2 241 292
   000419         042100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1134.2 294
   000420         042200     MOVE CCVS-E-2 TO DUMMY-RECORD.                               IX1134.2 288 82
   000421         042300     PERFORM D-WRITE-LINE.                                        IX1134.2 428
   000422         042400     IF   INSPECT-COUNTER EQUAL TO ZERO                           IX1134.2 243 IMP
   000423      1  042500          MOVE "NO " TO ERROR-TOTAL                               IX1134.2 292
   000424      1  042600     ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                    IX1134.2 243 292
   000425         042700     MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.             IX1134.2 294
   000426         042800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1134.2 288 82 428
   000427         042900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1134.2 296 82 428
   000428         043000 D-WRITE-LINE.                                                    IX1134.2
   000429         043100     ADD 1 TO RECORD-COUNT.                                       IX1134.2 248
   000430         043200     IF RECORD-COUNT GREATER 42                                   IX1134.2 248
   000431      1  043300        MOVE DUMMY-RECORD TO DUMMY-HOLD                           IX1134.2 82 247
   000432      1  043400        MOVE SPACE TO DUMMY-RECORD                                IX1134.2 IMP 82
   000433      1  043500        WRITE DUMMY-RECORD AFTER ADVANCING PAGE                   IX1134.2 82
   000434      1  043600        MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1134.2 250 82 444
   000435      1  043700        MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1134.2 255 82 444
   000436      1  043800        MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1134.2 264 82 444
   000437      1  043900        MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1134.2 276 82 444
   000438      1  044000        MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1134.2 228 82 444
   000439      1  044100        MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1134.2 233 82 444
   000440      1  044200        MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM D-WRT-LN         IX1134.2 320 82 444
   000441      1  044300        MOVE DUMMY-HOLD TO DUMMY-RECORD                           IX1134.2 247 82
   000442      1  044400        MOVE ZERO TO RECORD-COUNT.                                IX1134.2 IMP 248
   000443         044500     PERFORM D-WRT-LN.                                            IX1134.2 444
   000444         044600 D-WRT-LN.                                                        IX1134.2
   000445         044700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1134.2 82
   000446         044800     MOVE SPACE TO DUMMY-RECORD.                                  IX1134.2 IMP 82
   000447         044900 D-FAIL-ROUTINE.                                                  IX1134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448         045000     IF   COMPUTED-X NOT EQUAL TO SPACE                           IX1134.2 203 IMP
   000449      1  045100          GO TO D-FAIL-ROUTINE-WRITE.                             IX1134.2 456
   000450         045200     IF   CORRECT-X NOT EQUAL TO SPACE GO TO D-FAIL-ROUTINE-WRITE.IX1134.2 217 IMP 456
   000451         045300     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1134.2 249 319
   000452         045400     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    IX1134.2 314
   000453         045500     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1134.2 311 82 428
   000454         045600     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1134.2 IMP 319
   000455         045700     GO TO D-FAIL-ROUTINE-EX.                                     IX1134.2 461
   000456         045800 D-FAIL-ROUTINE-WRITE.                                            IX1134.2
   000457         045900     MOVE TEST-COMPUTED TO PRINT-REC PERFORM D-WRITE-LINE         IX1134.2 199 80 428
   000458         046000     MOVE ANSI-REFERENCE TO COR-ANSI-REFERENCE.                   IX1134.2 249 227
   000459         046100     MOVE TEST-CORRECT TO PRINT-REC PERFORM D-WRITE-LINE 2 TIMES. IX1134.2 214 80 428
   000460         046200     MOVE SPACES TO COR-ANSI-REFERENCE.                           IX1134.2 IMP 227
   000461         046300 D-FAIL-ROUTINE-EX. EXIT.                                         IX1134.2
   000462         046400 D-BAIL-OUT.                                                      IX1134.2
   000463         046500     IF  COMPUTED-A NOT EQUAL TO SPACE GO TO D-BAIL-OUT-WRITE.    IX1134.2 204 IMP 465
   000464         046600     IF  CORRECT-A EQUAL TO SPACE GO TO D-BAIL-OUT-EX.            IX1134.2 218 IMP 470
   000465         046700 D-BAIL-OUT-WRITE.                                                IX1134.2
   000466         046800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1134.2 218 318 204 316
   000467         046900     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1134.2 249 319
   000468         047000     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1134.2 311 82 428
   000469         047100     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1134.2 IMP 319
   000470         047200 D-BAIL-OUT-EX. EXIT.                                             IX1134.2
   000471         047300 DECL-EXIT.  EXIT.                                                IX1134.2
   000472         047400 END DECLARATIVES.                                                IX1134.2
   000473         047500                                                                  IX1134.2
   000474         047600                                                                  IX1134.2
   000475         047700 CCVS1 SECTION.                                                   IX1134.2
   000476         047800 OPEN-FILES.                                                      IX1134.2
   000477         047900     OPEN I-O RAW-DATA.                                           IX1134.2 62
   000478         048000     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1134.2 327 65
   000479         048100     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1134.2 62 485
   000480         048200     MOVE "ABORTED " TO C-ABORT.                                  IX1134.2 76
   000481         048300     ADD 1 TO C-NO-OF-TESTS.                                      IX1134.2 68
   000482         048400     ACCEPT C-DATE  FROM DATE.                                    IX1134.2 66
   000483         048500     ACCEPT C-TIME  FROM TIME.                                    IX1134.2 67
   000484         048600     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1134.2 64 485
   000485         048700 END-E-1.                                                         IX1134.2
   000486         048800     CLOSE RAW-DATA.                                              IX1134.2 62
   000487         048900     OPEN    OUTPUT PRINT-FILE.                                   IX1134.2 78
   000488         049000     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1134.2 327 267 327 286
   000489         049100     MOVE    SPACE TO TEST-RESULTS.                               IX1134.2 IMP 187
   000490         049200     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1134.2 534 539
   000491         049300     MOVE    ZERO TO REC-SKL-SUB.                                 IX1134.2 IMP 239
   000492         049400     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1134.2 493
   000493         049500 CCVS-INIT-FILE.                                                  IX1134.2
   000494         049600     ADD     1 TO REC-SKL-SUB.                                    IX1134.2 239
   000495         049700     MOVE    FILE-RECORD-INFO-SKELETON                            IX1134.2 136
   000496         049800          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1134.2 150 239
   000497         049900 CCVS-INIT-EXIT.                                                  IX1134.2
   000498         050000     GO TO CCVS1-EXIT.                                            IX1134.2 621
   000499         050100 CLOSE-FILES.                                                     IX1134.2
   000500         050200     OPEN I-O RAW-DATA.                                           IX1134.2 62
   000501         050300     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1134.2 327 65
   000502         050400     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1134.2 62 510
   000503         050500     MOVE "OK.     " TO C-ABORT.                                  IX1134.2 76
   000504         050600     MOVE PASS-COUNTER TO C-OK.                                   IX1134.2 244 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000505         050700     MOVE ERROR-HOLD   TO C-ALL.                                  IX1134.2 246 70
   000506         050800     MOVE ERROR-COUNTER TO C-FAIL.                                IX1134.2 242 71
   000507         050900     MOVE DELETE-COUNTER TO C-DELETED.                            IX1134.2 241 72
   000508         051000     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1134.2 243 73
   000509         051100     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1134.2 64 510
   000510         051200 END-E-2.                                                         IX1134.2
   000511         051300     CLOSE RAW-DATA.                                              IX1134.2 62
   000512         051400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1134.2 543 564 78
   000513         051500 TERMINATE-CCVS.                                                  IX1134.2
   000514         051600     EXIT PROGRAM.                                                IX1134.2
   000515         051700 TERMINATE-CALL.                                                  IX1134.2
   000516         051800     STOP     RUN.                                                IX1134.2
   000517         051900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1134.2 191 243
   000518         052000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1134.2 191 244
   000519         052100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1134.2 191 242
   000520         052200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1134.2 191 241
   000521         052300     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1134.2 198
   000522         052400 PRINT-DETAIL.                                                    IX1134.2
   000523         052500     IF REC-CT NOT EQUAL TO ZERO                                  IX1134.2 240 IMP
   000524      1  052600             MOVE "." TO PARDOT-X                                 IX1134.2 195
   000525      1  052700             MOVE REC-CT TO DOTVALUE.                             IX1134.2 240 196
   000526         052800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1134.2 187 80 576
   000527         052900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1134.2 191 576
   000528      1  053000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1134.2 597 611
   000529      1  053100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1134.2 612 620
   000530         053200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1134.2 IMP 191 IMP 203
   000531         053300     MOVE SPACE TO CORRECT-X.                                     IX1134.2 IMP 217
   000532         053400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1134.2 240 IMP IMP 193
   000533         053500     MOVE     SPACE TO RE-MARK.                                   IX1134.2 IMP 198
   000534         053600 HEAD-ROUTINE.                                                    IX1134.2
   000535         053700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1134.2 250 82 576
   000536         053800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1134.2 255 82 576
   000537         053900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1134.2 264 82 576
   000538         054000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1134.2 276 82 576
   000539         054100 COLUMN-NAMES-ROUTINE.                                            IX1134.2
   000540         054200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1134.2 228 82 576
   000541         054300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1134.2 233 82 576
   000542         054400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1134.2 320 82 576
   000543         054500 END-ROUTINE.                                                     IX1134.2
   000544         054600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1134.2 320 82 576
   000545         054700 END-RTN-EXIT.                                                    IX1134.2
   000546         054800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1134.2 283 82 576
   000547         054900 END-ROUTINE-1.                                                   IX1134.2
   000548         055000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1134.2 242 246 243
   000549         055100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1134.2 246 241 246
   000550         055200      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1134.2 244 246
   000551         055300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1134.2
   000552         055400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1134.2 244 306
   000553         055500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1134.2 246 308
   000554         055600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1134.2 305 291
   000555         055700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1134.2 288 82 576
   000556         055800  END-ROUTINE-12.                                                 IX1134.2
   000557         055900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1134.2 294
   000558         056000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1134.2 242 IMP
   000559      1  056100         MOVE "NO " TO ERROR-TOTAL                                IX1134.2 292
   000560         056200         ELSE                                                     IX1134.2
   000561      1  056300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1134.2 242 292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000562         056400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1134.2 288 82
   000563         056500     PERFORM WRITE-LINE.                                          IX1134.2 576
   000564         056600 END-ROUTINE-13.                                                  IX1134.2
   000565         056700     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1134.2 241 IMP
   000566      1  056800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1134.2 292
   000567      1  056900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1134.2 241 292
   000568         057000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1134.2 294
   000569         057100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1134.2 288 82 576
   000570         057200      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1134.2 243 IMP
   000571      1  057300          MOVE "NO " TO ERROR-TOTAL                               IX1134.2 292
   000572      1  057400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1134.2 243 292
   000573         057500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1134.2 294
   000574         057600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1134.2 288 82 576
   000575         057700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1134.2 296 82 576
   000576         057800 WRITE-LINE.                                                      IX1134.2
   000577         057900     ADD 1 TO RECORD-COUNT.                                       IX1134.2 248
   000578         058000     IF RECORD-COUNT GREATER 42                                   IX1134.2 248
   000579      1  058100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1134.2 82 247
   000580      1  058200         MOVE SPACE TO DUMMY-RECORD                               IX1134.2 IMP 82
   000581      1  058300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1134.2 82
   000582      1  058400         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1134.2 250 82 592
   000583      1  058500         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1134.2 255 82 592
   000584      1  058600         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1134.2 264 82 592
   000585      1  058700         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1134.2 276 82 592
   000586      1  058800         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1134.2 228 82 592
   000587      1  058900         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1134.2 233 82 592
   000588      1  059000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1134.2 320 82 592
   000589      1  059100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1134.2 247 82
   000590      1  059200         MOVE ZERO TO RECORD-COUNT.                               IX1134.2 IMP 248
   000591         059300     PERFORM WRT-LN.                                              IX1134.2 592
   000592         059400 WRT-LN.                                                          IX1134.2
   000593         059500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1134.2 82
   000594         059600     MOVE SPACE TO DUMMY-RECORD.                                  IX1134.2 IMP 82
   000595         059700 BLANK-LINE-PRINT.                                                IX1134.2
   000596         059800     PERFORM WRT-LN.                                              IX1134.2 592
   000597         059900 FAIL-ROUTINE.                                                    IX1134.2
   000598         060000     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1134.2 203 IMP
   000599      1  060100            GO TO   FAIL-ROUTINE-WRITE.                           IX1134.2 606
   000600         060200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1134.2 217 IMP 606
   000601         060300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1134.2 249 319
   000602         060400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1134.2 314
   000603         060500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1134.2 311 82 576
   000604         060600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1134.2 IMP 319
   000605         060700     GO TO  FAIL-ROUTINE-EX.                                      IX1134.2 611
   000606         060800 FAIL-ROUTINE-WRITE.                                              IX1134.2
   000607         060900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1134.2 199 80 576
   000608         061000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1134.2 249 227
   000609         061100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1134.2 214 80 576
   000610         061200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1134.2 IMP 227
   000611         061300 FAIL-ROUTINE-EX. EXIT.                                           IX1134.2
   000612         061400 BAIL-OUT.                                                        IX1134.2
   000613         061500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1134.2 204 IMP 615
   000614         061600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1134.2 218 IMP 620
   000615         061700 BAIL-OUT-WRITE.                                                  IX1134.2
   000616         061800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1134.2 218 318 204 316
   000617         061900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1134.2 249 319
   000618         062000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1134.2 311 82 576
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000619         062100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1134.2 IMP 319
   000620         062200 BAIL-OUT-EX. EXIT.                                               IX1134.2
   000621         062300 CCVS1-EXIT.                                                      IX1134.2
   000622         062400     EXIT.                                                        IX1134.2
   000623         062500                                                                  IX1134.2
   000624         062600 SECT-IX113A-0003 SECTION.                                        IX1134.2
   000625         062700 SEQ-INIT-010.                                                    IX1134.2
   000626         062800     MOVE ZERO TO TEST-NO.                                        IX1134.2 IMP 326
   000627         062900     MOVE "IX-FS3" TO XFILE-NAME (1).                             IX1134.2 153
   000628         063000     MOVE "R1-F-G" TO XRECORD-NAME (1).                           IX1134.2 155
   000629         063100     MOVE CCVS-PGM-ID TO XPROGRAM-NAME (1).                       IX1134.2 327 165
   000630         063200     MOVE 000240 TO XRECORD-LENGTH (1).                           IX1134.2 167
   000631         063300     MOVE "RC" TO CHARS-OR-RECORDS (1).                           IX1134.2 169
   000632         063400     MOVE 0002 TO XBLOCK-SIZE (1).                                IX1134.2 171
   000633         063500     MOVE 000050 TO RECORDS-IN-FILE (1).                          IX1134.2 173
   000634         063600     MOVE "IX" TO XFILE-ORGANIZATION (1).                         IX1134.2 175
   000635         063700     MOVE "S" TO XLABEL-TYPE (1).                                 IX1134.2 177
   000636         063800     MOVE 000001 TO XRECORD-NUMBER (1).                           IX1134.2 159
   000637         063900     MOVE 0 TO COUNT-OF-RECS.                                     IX1134.2 131
   000638         064000                                                                  IX1134.2
   000639         064200*   TEST  1                                                      *IX1134.2
   000640         064300*         OPEN OUTPUT ...                 00 EXPECTED            *IX1134.2
   000641         064400*         IX-3, 1.3.4 (1) A                                      *IX1134.2
   000642         064500*    STATUS 00 CHECK ON OUTPUT FILE IX-FS3                       *IX1134.2
   000643         064600*    THE OUTPUT STATEMENT IS SUCCESSFULLY EXECUTED               *IX1134.2
   000644         064800 OPN-INIT-GF-01-0.                                                IX1134.2
   000645         064900     MOVE 1 TO STATUS-TEST-00.                                    IX1134.2 122
   000646         065000     MOVE SPACES TO IX-FS3-STATUS.                                IX1134.2 IMP 127
   000647         065100     MOVE "OPEN OUTPUT: 00 EXP." TO FEATURE.                      IX1134.2 189
   000648         065200     MOVE "OPN-TEST-GF-01-0" TO PAR-NAME.                         IX1134.2 193
   000649         065300     OPEN                                                         IX1134.2
   000650         065400        OUTPUT IX-FS3.                                            IX1134.2 84
   000651         065500     IF IX-FS3-STATUS EQUAL TO "00"                               IX1134.2 127
   000652      1  065600         GO TO OPN-PASS-GF-01-0.                                  IX1134.2 659
   000653         065700 OPN-FAIL-GF-01-0.                                                IX1134.2
   000654         065800     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1134.2 198
   000655         065900     PERFORM FAIL.                                                IX1134.2 519
   000656         066000     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1134.2 127 204
   000657         066100     MOVE "00" TO CORRECT-X.                                      IX1134.2 217
   000658         066200     GO TO OPN-WRITE-GF-01-0.                                     IX1134.2 661
   000659         066300 OPN-PASS-GF-01-0.                                                IX1134.2
   000660         066400     PERFORM PASS.                                                IX1134.2 518
   000661         066500 OPN-WRITE-GF-01-0.                                               IX1134.2
   000662         066600     PERFORM PRINT-DETAIL.                                        IX1134.2 522
   000663         066800*   TEST  2                                                      *IX1134.2
   000664         066900*         WRITE                           00 EXPECTED            *IX1134.2
   000665         067000*         IX-3, 1.3.4 (1) A                                      *IX1134.2
   000666         067100*    CREATING A INDEXED FILE WITH 50 RECORDS                     *IX1134.2
   000667         067200*    KEY:  FROM  000000001 TO 000000050                          *IX1134.2
   000668         067400 WRI-INIT-GF-01-0.                                                IX1134.2
   000669         067500     MOVE SPACES TO IX-FS3-STATUS.                                IX1134.2 IMP 127
   000670         067600     MOVE 0 TO STATUS-TEST-00.                                    IX1134.2 122
   000671         067700     MOVE "WRITE: 00 EXPECTED" TO FEATURE.                        IX1134.2 189
   000672         067800     MOVE "WRI-TEST-GF-01-0" TO PAR-NAME.                         IX1134.2 193
   000673         067900 WRI-TEST-GF-01-0.                                                IX1134.2
   000674         068000     MOVE XRECORD-NUMBER (1) TO GRP-0101-KEY, COUNT-OF-RECS.      IX1134.2 159 104 131
   000675         068100     MOVE GRP-0101 TO XRECORD-KEY (1).                            IX1134.2 102 180
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000676         068200     MOVE GRP-0102 TO ALTERNATE-KEY1 (1).                         IX1134.2 107 182
   000677         068300*    THE VALUE OF THE ALTERNATE KEY IS 50 TIMES UNCHANGED        *IX1134.2
   000678         068400     MOVE FILE-RECORD-INFO (1) TO IX-FS3R1-F-G-240.               IX1134.2 150 90
   000679         068500     WRITE IX-FS3R1-F-G-240.                                      IX1134.2 90
   000680         068600     IF IX-FS3-STATUS  NOT = "00"                                 IX1134.2 127
   000681      1  068700         MOVE 1 TO STATUS-TEST-00                                 IX1134.2 122
   000682      1  068800         GO TO WRI-FAIL-GF-01-0.                                  IX1134.2 691
   000683         068900     IF XRECORD-NUMBER (1) EQUAL TO 50                            IX1134.2 159
   000684      1  069000         GO TO WRI-TEST-GF-01-1.                                  IX1134.2 687
   000685         069100     ADD 1 TO XRECORD-NUMBER (1).                                 IX1134.2 159
   000686         069200     GO TO WRI-TEST-GF-01-0.                                      IX1134.2 673
   000687         069300 WRI-TEST-GF-01-1.                                                IX1134.2
   000688         069400     IF RECORDS-IN-ERROR EQUAL TO ZERO                            IX1134.2 116 IMP
   000689      1  069500         GO TO WRI-PASS-GF-01-0.                                  IX1134.2 696
   000690         069600     MOVE "ERROR IN CREATING FILE" TO RE-MARK.                    IX1134.2 198
   000691         069700 WRI-FAIL-GF-01-0.                                                IX1134.2
   000692         069800     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1134.2 198
   000693         069900     PERFORM FAIL.                                                IX1134.2 519
   000694         070000     MOVE "RECORDS WRITTEN =" TO COMPUTED-A.                      IX1134.2 204
   000695         070100     GO TO WRI-WRITE-GF-01-0.                                     IX1134.2 698
   000696         070200 WRI-PASS-GF-01-0.                                                IX1134.2
   000697         070300     PERFORM PASS.                                                IX1134.2 518
   000698         070400 WRI-WRITE-GF-01-0.                                               IX1134.2
   000699         070500     PERFORM PRINT-DETAIL.                                        IX1134.2 522
   000700         070600     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   IX1134.2 204
   000701         070700     MOVE "CREATE FILE IX-FS3" TO FEATURE.                        IX1134.2 189
   000702         070800     MOVE "WRI-TEST-GF-01-1" TO PAR-NAME.                         IX1134.2 193
   000703         070900     MOVE COUNT-OF-RECS TO CORRECT-18V0.                          IX1134.2 131 224
   000704         071000     PERFORM PRINT-DETAIL.                                        IX1134.2 522
   000705         071100                                                                  IX1134.2
   000706         071300*   TEST  4                                                      *IX1134.2
   000707         071400*         CLOSE OUTPUT                    00 EXPECTED            *IX1134.2
   000708         071500*         IX-3, 1.3.4 (1) A                                      *IX1134.2
   000709         071700 CLO-INIT-GF-01-0.                                                IX1134.2
   000710         071800     MOVE SPACES TO IX-FS3-STATUS.                                IX1134.2 IMP 127
   000711         071900     MOVE "CLOSE OUTPUT:00 EXP." TO FEATURE.                      IX1134.2 189
   000712         072000     MOVE "CLO-TEST-GF-01-0" TO PAR-NAME.                         IX1134.2 193
   000713         072100 CLO-TEST-GF-01-0.                                                IX1134.2
   000714         072200     CLOSE IX-FS3.                                                IX1134.2 84
   000715         072300     IF IX-FS3-STATUS = "00"                                      IX1134.2 127
   000716      1  072400         GO TO CLO-PASS-GF-01-0.                                  IX1134.2 723
   000717         072500 CLO-FAIL-GF-01-0.                                                IX1134.2
   000718         072600     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1134.2 198
   000719         072700     PERFORM FAIL.                                                IX1134.2 519
   000720         072800     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1134.2 127 204
   000721         072900     MOVE "00" TO CORRECT-X.                                      IX1134.2 217
   000722         073000     GO TO CLO-WRITE-GF-01-0.                                     IX1134.2 725
   000723         073100 CLO-PASS-GF-01-0.                                                IX1134.2
   000724         073200     PERFORM PASS.                                                IX1134.2 518
   000725         073300 CLO-WRITE-GF-01-0.                                               IX1134.2
   000726         073400     PERFORM PRINT-DETAIL.                                        IX1134.2 522
   000727         073500                                                                  IX1134.2
   000728         073700*    A INDEXED FILE WITH 50 RECORDS HAS BEEN CREATED.            *IX1134.2
   000729         073900                                                                  IX1134.2
   000730         074100*   TEST  5                                                      *IX1134.2
   000731         074200*         CLOSE FOR A FILE NOT IN THE OPEN MODE                  *IX1134.2
   000732         074300*         FILE STATUS 42 EXPECTED IX-5, 1.3.4 (5) B              *IX1134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000733         074500 CLO-TEST-GF-02-0.                                                IX1134.2
   000734         074600     MOVE  5 TO TEST-NO.                                          IX1134.2 326
   000735         074700     MOVE SPACES TO IX-FS3-STATUS.                                IX1134.2 IMP 127
   000736         074800     MOVE "CLOSE-INPUT: 42 EXP." TO FEATURE                       IX1134.2 189
   000737         074900     MOVE "CLO-TEST-GF-02-0" TO PAR-NAME.                         IX1134.2 193
   000738         075000     CLOSE IX-FS3.                                                IX1134.2 84
   000739         075100 CLO-TEST-GF-02-1.                                                IX1134.2
   000740         075200     IF IX-FS3-STATUS EQUAL TO "42"                               IX1134.2 127
   000741      1  075300        MOVE "SHOULD HAVE EXECUTED DECLARATIVES IX-3,1.3.4(4)"    IX1134.2
   000742      1  075400          TO RE-MARK                                              IX1134.2 198
   000743      1  075500        GO TO CLO-WRITE-GF-02-0.                                  IX1134.2 746
   000744         075600 CLO-FAIL-GF-02-0.                                                IX1134.2
   000745         075700     MOVE "IX-5, 1.3.4, (5) B" TO RE-MARK.                        IX1134.2 198
   000746         075800 CLO-WRITE-GF-02-0.                                               IX1134.2
   000747         075900     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1134.2 127 204
   000748         076000     MOVE "42" TO CORRECT-X.                                      IX1134.2 217
   000749         076100     PERFORM FAIL.                                                IX1134.2 519
   000750         076200     PERFORM PRINT-DETAIL.                                        IX1134.2 522
   000751         076300                                                                  IX1134.2
   000752         076400 TERMINATE-ROUTINE.                                               IX1134.2
   000753         076500     EXIT.                                                        IX1134.2
   000754         076600                                                                  IX1134.2
   000755         076700 CCVS-EXIT SECTION.                                               IX1134.2
   000756         076800 CCVS-999999.                                                     IX1134.2
   000757         076900     GO TO CLOSE-FILES.                                           IX1134.2 499
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      182   ALTERNATE-KEY1 . . . . . . . .  M676
      184   ALTERNATE-KEY2
      249   ANSI-REFERENCE . . . . . . . .  451 458 467 601 608 617
       76   C-ABORT. . . . . . . . . . . .  M361 M480 M503
       70   C-ALL. . . . . . . . . . . . .  M363 M505
       66   C-DATE . . . . . . . . . . . .  M482
       72   C-DELETED. . . . . . . . . . .  M365 M507
       71   C-FAIL . . . . . . . . . . . .  M364 M506
       75   C-INDENT
       73   C-INSPECT. . . . . . . . . . .  M366 M508
       68   C-NO-OF-TESTS. . . . . . . . .  M481
       74   C-NOTE
       69   C-OK . . . . . . . . . . . . .  M362 M504
       67   C-TIME . . . . . . . . . . . .  M483
      228   CCVS-C-1 . . . . . . . . . . .  438 540 586
      233   CCVS-C-2 . . . . . . . . . . .  439 541 587
      283   CCVS-E-1 . . . . . . . . . . .  397 546
      288   CCVS-E-2 . . . . . . . . . . .  406 413 420 426 555 562 569 574
      291   CCVS-E-2-2 . . . . . . . . . .  M405 M554
      296   CCVS-E-3 . . . . . . . . . . .  427 575
      305   CCVS-E-4 . . . . . . . . . . .  405 554
      306   CCVS-E-4-1 . . . . . . . . . .  M403 M552
      308   CCVS-E-4-2 . . . . . . . . . .  M404 M553
      250   CCVS-H-1 . . . . . . . . . . .  434 535 582
      255   CCVS-H-2A. . . . . . . . . . .  435 536 583
      264   CCVS-H-2B. . . . . . . . . . .  436 537 584
      276   CCVS-H-3 . . . . . . . . . . .  437 538 585
      327   CCVS-PGM-ID. . . . . . . . . .  359 478 488 488 501 629
      169   CHARS-OR-RECORDS . . . . . . .  M631
      210   CM-18V0
      204   COMPUTED-A . . . . . . . . . .  205 207 208 209 210 M348 463 466 613 616 M656 M694 M700 M720 M747
      205   COMPUTED-N
      203   COMPUTED-X . . . . . . . . . .  M389 448 M530 598
      207   COMPUTED-0V18
      209   COMPUTED-14V4
      211   COMPUTED-18V0
      208   COMPUTED-4V14
      227   COR-ANSI-REFERENCE . . . . . .  M458 M460 M608 M610
      218   CORRECT-A. . . . . . . . . . .  219 220 221 222 223 464 466 614 616
      219   CORRECT-N
      217   CORRECT-X. . . . . . . . . . .  M349 M390 450 M531 600 M657 M721 M748
      220   CORRECT-0V18
      222   CORRECT-14V4
      224   CORRECT-18V0 . . . . . . . . .  M703
      221   CORRECT-4V14
      133   COUNT-OF-RECORDS
      131   COUNT-OF-RECS. . . . . . . . .  133 M637 M674 703
      223   CR-18V0
      241   DELETE-COUNTER . . . . . . . .  365 401 416 418 507 M520 549 565 567
      196   DOTVALUE . . . . . . . . . . .  M381 M525
      247   DUMMY-HOLD . . . . . . . . . .  M431 441 M579 589
       82   DUMMY-RECORD . . . . . . . . .  M394 M397 M406 M413 M420 M426 M427 431 M432 433 M434 M435 M436 M437 M438 M439
                                            M440 M441 445 M446 M453 M468 M535 M536 M537 M538 M540 M541 M542 M544 M546 M555
                                            M562 M569 M574 M575 579 M580 581 M582 M583 M584 M585 M586 M587 M588 M589 593
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    18
0 Defined   Cross-reference of data names   References

0                                           M594 M603 M618
      294   ENDER-DESC . . . . . . . . . .  M408 M419 M425 M557 M568 M573
      114   EOF-FLAG . . . . . . . . . . .  M339
      242   ERROR-COUNTER. . . . . . . . .  364 M377 400 409 412 506 M519 548 558 561
      118   ERROR-FLAG
      246   ERROR-HOLD . . . . . . . . . .  363 M400 M401 M401 M402 404 505 M548 M549 M549 M550 553
      292   ERROR-TOTAL. . . . . . . . . .  M410 M412 M417 M418 M423 M424 M559 M561 M566 M567 M571 M572
      189   FEATURE. . . . . . . . . . . .  M647 M671 M701 M711 M736
      150   FILE-RECORD-INFO . . . . . . .  M496 678
      151   FILE-RECORD-INFO-P1-120
      178   FILE-RECORD-INFO-P121-240
      136   FILE-RECORD-INFO-SKELETON. . .  495
      135   FILE-RECORD-INFORMATION-REC
      102   GRP-0101 . . . . . . . . . . .  675
      104   GRP-0101-KEY . . . . . . . . .  M674
      107   GRP-0102 . . . . . . . . . . .  676
      109   GRP-0102-KEY
      320   HYPHEN-LINE. . . . . . . . . .  394 440 542 544 588
      286   ID-AGAIN . . . . . . . . . . .  M488
      319   INF-ANSI-REFERENCE . . . . . .  M451 M454 M467 M469 M601 M604 M617 M619
      314   INFO-TEXT. . . . . . . . . . .  M452 M602
      243   INSPECT-COUNTER. . . . . . . .  366 400 422 424 508 M517 548 570 572
       84   IX-FS3 . . . . . . . . . . . .  51 333 650 714 738
       96   IX-FS3-ALTER-KEY
       94   IX-FS3-KEY . . . . . . . . . .  55
       91   IX-FS3-REC-120
       92   IX-FS3-REC-120-240
      127   IX-FS3-STATUS. . . . . . . . .  56 345 348 M646 651 656 M669 680 M710 715 720 M735 740 747
      128   IX-FS3-STAT1 . . . . . . . . .  338 341
      129   IX-FS3-STAT2
       90   IX-FS3R1-F-G-240 . . . . . . .  M678 679
      163   ODO-NUMBER
      191   P-OR-F . . . . . . . . . . . .  M376 M377 384 M389 M517 M518 M519 M520 527 M530
      193   PAR-NAME . . . . . . . . . . .  M391 M532 M648 M672 M702 M712 M737
      195   PARDOT-X . . . . . . . . . . .  M380 M524
      244   PASS-COUNTER . . . . . . . . .  362 M376 402 403 504 M518 550 552
      120   PERM-ERRORS. . . . . . . . . .  M342
       78   PRINT-FILE . . . . . . . . . .  48 371 487 512
       80   PRINT-REC. . . . . . . . . . .  M382 M457 M459 M526 M607 M609
       62   RAW-DATA . . . . . . . . . . .  42 358 360 369 477 479 486 500 502 511
       65   RAW-DATA-KEY . . . . . . . . .  46 M359 M478 M501
       64   RAW-DATA-SATZ. . . . . . . . .  367 484 509
      198   RE-MARK. . . . . . . . . . . .  M350 M392 M521 M533 M654 M690 M692 M718 M742 M745
      240   REC-CT . . . . . . . . . . . .  379 381 391 523 525 532
      239   REC-SKL-SUB. . . . . . . . . .  M491 M494 496
      248   RECORD-COUNT . . . . . . . . .  M429 430 M442 M577 578 M590
      116   RECORDS-IN-ERROR . . . . . . .  688
      173   RECORDS-IN-FILE. . . . . . . .  M633
      157   REELUNIT-NUMBER
      125   STATUS-TEST-READ
      122   STATUS-TEST-00 . . . . . . . .  M645 M670 M681
      124   STATUS-TEST-10 . . . . . . . .  337
      199   TEST-COMPUTED. . . . . . . . .  457 607
      214   TEST-CORRECT . . . . . . . . .  459 609
      267   TEST-ID. . . . . . . . . . . .  M488
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    19
0 Defined   Cross-reference of data names   References

0     326   TEST-NO. . . . . . . . . . . .  335 M626 M734
      187   TEST-RESULTS . . . . . . . . .  382 M489 526
      245   TOTAL-ERROR
      161   UPDATE-NUMBER
      112   WRK-CS-09V00
      171   XBLOCK-SIZE. . . . . . . . . .  M632
      153   XFILE-NAME . . . . . . . . . .  M627
      175   XFILE-ORGANIZATION . . . . . .  M634
      177   XLABEL-TYPE. . . . . . . . . .  M635
      165   XPROGRAM-NAME. . . . . . . . .  M629
      180   XRECORD-KEY. . . . . . . . . .  M675
      167   XRECORD-LENGTH . . . . . . . .  M630
      155   XRECORD-NAME . . . . . . . . .  M628
      159   XRECORD-NUMBER . . . . . . . .  M636 674 683 M685
      316   XXCOMPUTED . . . . . . . . . .  M466 M616
      318   XXCORRECT. . . . . . . . . . .  M466 M616
      311   XXINFO . . . . . . . . . . . .  453 468 603 618
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    20
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
      755   CCVS-EXIT
      497   CCVS-INIT-EXIT
      493   CCVS-INIT-FILE . . . . . . . .  P492
      756   CCVS-999999
      475   CCVS1
      621   CCVS1-EXIT . . . . . . . . . .  G498
      717   CLO-FAIL-GF-01-0
      744   CLO-FAIL-GF-02-0
      709   CLO-INIT-GF-01-0
      723   CLO-PASS-GF-01-0 . . . . . . .  G716
      713   CLO-TEST-GF-01-0
      733   CLO-TEST-GF-02-0
      739   CLO-TEST-GF-02-1
      725   CLO-WRITE-GF-01-0. . . . . . .  G722
      746   CLO-WRITE-GF-02-0. . . . . . .  G743
      499   CLOSE-FILES. . . . . . . . . .  G757
      539   COLUMN-NAMES-ROUTINE . . . . .  E490
      462   D-BAIL-OUT . . . . . . . . . .  P388
      470   D-BAIL-OUT-EX. . . . . . . . .  E388 G464
      465   D-BAIL-OUT-WRITE . . . . . . .  G463
      347   D-C-FAIL-GF-02-0
      353   D-C-PASS-GF-02-0 . . . . . . .  G346
      344   D-C-TEST-GF-02-1 . . . . . . .  G336
      355   D-C-WRITE-GF-02-0. . . . . . .  G352
      357   D-CLOSE-FILES
      368   D-END-E-2. . . . . . . . . . .  G360 G367
      393   D-END-ROUTINE. . . . . . . . .  P370
      399   D-END-ROUTINE-1
      407   D-END-ROUTINE-12
      415   D-END-ROUTINE-13 . . . . . . .  E370
      396   D-END-RTN-EXIT
      377   D-FAIL . . . . . . . . . . . .  P351
      447   D-FAIL-ROUTINE . . . . . . . .  P386
      461   D-FAIL-ROUTINE-EX. . . . . . .  E386 G455
      456   D-FAIL-ROUTINE-WRITE . . . . .  G449 G450
      376   D-PASS . . . . . . . . . . . .  P354
      378   D-PRINT-DETAIL . . . . . . . .  P356
      374   D-TERMINATE-CALL
      372   D-TERMINATE-CCVS
      428   D-WRITE-LINE . . . . . . . . .  P383 P385 P395 P398 P406 P414 P421 P426 P427 P453 P457 P459 P468
      444   D-WRT-LN . . . . . . . . . . .  P434 P435 P436 P437 P438 P439 P440 P443
      520   DE-LETE
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    21
0 Defined   Cross-reference of procedures   References

0     471   DECL-EXIT. . . . . . . . . . .  G343
      485   END-E-1. . . . . . . . . . . .  G479 G484
      510   END-E-2. . . . . . . . . . . .  G502 G509
      543   END-ROUTINE. . . . . . . . . .  P512
      547   END-ROUTINE-1
      556   END-ROUTINE-12
      564   END-ROUTINE-13 . . . . . . . .  E512
      545   END-RTN-EXIT
      519   FAIL . . . . . . . . . . . . .  P655 P693 P719 P749
      597   FAIL-ROUTINE . . . . . . . . .  P528
      611   FAIL-ROUTINE-EX. . . . . . . .  E528 G605
      606   FAIL-ROUTINE-WRITE . . . . . .  G599 G600
      534   HEAD-ROUTINE . . . . . . . . .  P490
      334   INPUT-PROCESS
      517   INSPT
      476   OPEN-FILES
      653   OPN-FAIL-GF-01-0
      644   OPN-INIT-GF-01-0
      659   OPN-PASS-GF-01-0 . . . . . . .  G652
      661   OPN-WRITE-GF-01-0. . . . . . .  G658
      518   PASS . . . . . . . . . . . . .  P660 P697 P724
      522   PRINT-DETAIL . . . . . . . . .  P662 P699 P704 P726 P750
      332   SECT-IX105-0002
      624   SECT-IX113A-0003
      625   SEQ-INIT-010
      515   TERMINATE-CALL
      513   TERMINATE-CCVS
      752   TERMINATE-ROUTINE
      691   WRI-FAIL-GF-01-0 . . . . . . .  G682
      668   WRI-INIT-GF-01-0
      696   WRI-PASS-GF-01-0 . . . . . . .  G689
      673   WRI-TEST-GF-01-0 . . . . . . .  G686
      687   WRI-TEST-GF-01-1 . . . . . . .  G684
      698   WRI-WRITE-GF-01-0. . . . . . .  G695
      576   WRITE-LINE . . . . . . . . . .  P526 P527 P535 P536 P537 P538 P540 P541 P542 P544 P546 P555 P563 P569 P574 P575
                                            P603 P607 P609 P618
      592   WRT-LN . . . . . . . . . . . .  P582 P583 P584 P585 P586 P587 P588 P591 P596
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    22
0 Defined   Cross-reference of programs     References

        3   IX113A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX113A    Date 06/04/2022  Time 11:58:32   Page    23
0LineID  Message code  Message text

     78  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     84  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     84  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX113A:
 *    Source records = 757
 *    Data Division statements = 120
 *    Procedure Division statements = 387
 *    Generated COBOL statements = 0
 *    Program complexity factor = 396
0End of compilation 1,  program IX113A,  highest severity 0.
0Return code 0
