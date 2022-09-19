1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:11   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:11   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1124.2
   000002         000200 PROGRAM-ID.                                                      IX1124.2
   000003         000300     IX112A.                                                      IX1124.2
   000004         000500*                                                              *  IX1124.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1124.2
   000006         000700*                                                              *  IX1124.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1124.2
   000008         000900*                                                              *  IX1124.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1124.2
   000010         001100*                                                              *  IX1124.2
   000011         001300*                                                                 IX1124.2
   000012         001400*    1.  THE  ROUTINE  CREATES  THE  MASS  STORAGE  FILE  IX-VS2  IX1124.2
   000013         001500*        CONTAINING  50  RECORDS. EACH BLOCK CONTAINS 2 RECORDS,  IX1124.2
   000014         001600*        EACH  RECORD  CONTAINS  240 CHARACTERS, ORGANIZATION IS  IX1124.2
   000015         001700*        INDEXED,  ACCESS  IS SEQUENTIAL. THEN THE FILE IS OPENED IX1124.2
   000016         001800*        AS I-O AND IT IS ATTEMTED TO REWRITE A RECORD WITH A     IX1124.2
   000017         001900*        WRONG RECORD LENGTH.                                     IX1124.2
   000018         002000*                                                                 IX1124.2
   000019         002100*    2. THE ROUTINE READS THE CREATED FILE, VERIFIES IT AND       IX1124.2
   000020         002200*       CHECKS THE FILE STATUS CODE:                              IX1124.2
   000021         002300*           44  -  AFTER REWRITE   (WITH WRONG RECORD LENGTH)     IX1124.2
   000022         002400*                                                                 IX1124.2
   000023         002500*    3. X-CARDS USED IN THIS PROGRAM:                             IX1124.2
   000024         002600*                                                                 IX1124.2
   000025         002700*                 XXXXX024                                        IX1124.2
   000026         002800*                 XXXXX055.                                       IX1124.2
   000027         002900*                 XXXXX062.                                       IX1124.2
   000028         003000*                 XXXXX082.                                       IX1124.2
   000029         003100*                 XXXXX083.                                       IX1124.2
   000030         003200*                 XXXXX084                                        IX1124.2
   000031         003300*                                                                 IX1124.2
   000032         003400*                                                                 IX1124.2
   000033         003500 ENVIRONMENT DIVISION.                                            IX1124.2
   000034         003600 CONFIGURATION SECTION.                                           IX1124.2
   000035         003700 SOURCE-COMPUTER.                                                 IX1124.2
   000036         003800     XXXXX082.                                                    IX1124.2
   000037         003900 OBJECT-COMPUTER.                                                 IX1124.2
   000038         004000     XXXXX083.                                                    IX1124.2
   000039         004100 INPUT-OUTPUT SECTION.                                            IX1124.2
   000040         004200 FILE-CONTROL.                                                    IX1124.2
   000041         004300     SELECT RAW-DATA   ASSIGN TO                                  IX1124.2 61
   000042         004400     XXXXX062                                                     IX1124.2
   000043         004500            ORGANIZATION IS INDEXED                               IX1124.2
   000044         004600            ACCESS MODE IS RANDOM                                 IX1124.2
   000045         004700            RECORD KEY IS RAW-DATA-KEY.                           IX1124.2 64
   000046         004800*                                                                 IX1124.2
   000047         004900     SELECT PRINT-FILE ASSIGN TO                                  IX1124.2 77
   000048         005000     XXXXX055.                                                    IX1124.2
   000049         005100*                                                                 IX1124.2
   000050         005200     SELECT IX-VS2 ASSIGN                                         IX1124.2 83
   000051         005300     XXXXX024                                                     IX1124.2
   000052         005400     ORGANIZATION IS INDEXED                                      IX1124.2
   000053         005500     ACCESS MODE IS SEQUENTIAL                                    IX1124.2
   000054         005600     RECORD KEY IS IX-VS2-KEY                                     IX1124.2 94
   000055         005700     FILE STATUS IS IX-VS2-STATUS.                                IX1124.2 135
   000056         005800                                                                  IX1124.2
   000057         005900 DATA DIVISION.                                                   IX1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000                                                                  IX1124.2
   000059         006100 FILE SECTION.                                                    IX1124.2
   000060         006200                                                                  IX1124.2
   000061         006300 FD  RAW-DATA.                                                    IX1124.2
   000062         006400                                                                  IX1124.2
   000063         006500 01  RAW-DATA-SATZ.                                               IX1124.2
   000064         006600     05  RAW-DATA-KEY        PIC X(6).                            IX1124.2
   000065         006700     05  C-DATE              PIC 9(6).                            IX1124.2
   000066         006800     05  C-TIME              PIC 9(8).                            IX1124.2
   000067         006900     05  C-NO-OF-TESTS       PIC 99.                              IX1124.2
   000068         007000     05  C-OK                PIC 999.                             IX1124.2
   000069         007100     05  C-ALL               PIC 999.                             IX1124.2
   000070         007200     05  C-FAIL              PIC 999.                             IX1124.2
   000071         007300     05  C-DELETED           PIC 999.                             IX1124.2
   000072         007400     05  C-INSPECT           PIC 999.                             IX1124.2
   000073         007500     05  C-NOTE              PIC X(13).                           IX1124.2
   000074         007600     05  C-INDENT            PIC X.                               IX1124.2
   000075         007700     05  C-ABORT             PIC X(8).                            IX1124.2
   000076         007800                                                                  IX1124.2
   000077         007900 FD  PRINT-FILE.                                                  IX1124.2

 ==000077==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000078         008000                                                                  IX1124.2
   000079         008100 01  PRINT-REC               PIC X(120).                          IX1124.2
   000080         008200                                                                  IX1124.2
   000081         008300 01  DUMMY-RECORD            PIC X(120).                          IX1124.2
   000082         008400                                                                  IX1124.2
   000083         008500 FD  IX-VS2                                                       IX1124.2

 ==000083==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000083==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000084         008600        DATA RECORDS IX-VS2R1-F-G-240 IX-VS2R1-F-G-200            IX1124.2 * *
   000085         008700                                      IX-VS2R1-F-G-280            IX1124.2 *
   000086         008800        LABEL RECORD STANDARD                                     IX1124.2
   000087         008900        RECORD 200 TO 280                                         IX1124.2
   000088         009000        BLOCK CONTAINS 2 RECORDS.                                 IX1124.2
   000089         009100                                                                  IX1124.2
   000090         009200 01  IX-VS2R1-F-G-240.                                            IX1124.2
   000091         009300     05  IX-VS2-REC-120      PIC X(120).                          IX1124.2
   000092         009400     05  IX-VS2-REC-120-240.                                      IX1124.2
   000093         009500         10  FILLER          PIC X(8).                            IX1124.2
   000094         009600         10  IX-VS2-KEY      PIC X(29).                           IX1124.2
   000095         009700         10  FILLER          PIC X(9).                            IX1124.2
   000096         009800         10  IX-VS2-ALTER-KEY  PIC X(29).                         IX1124.2
   000097         009900         10  FILLER            PIC X(45).                         IX1124.2
   000098         010000                                                                  IX1124.2
   000099         010100 01  IX-VS2R1-F-G-200.                                            IX1124.2
   000100         010200     05  IX-VS2-REC-SHORT    PIC X(120).                          IX1124.2
   000101         010300     05  IX-VS2-REC-120-200  PIC X(80).                           IX1124.2
   000102         010400                                                                  IX1124.2
   000103         010500 01  IX-VS2R1-F-G-280.                                            IX1124.2
   000104         010600     05  IX-VS2-REC-LONG     PIC X(120).                          IX1124.2
   000105         010700     05  IX-VS2-REC-120-239  PIC X(120).                          IX1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000106         010800     05  IX-VS2-REC-240-280  PIC X(40).                           IX1124.2
   000107         010900                                                                  IX1124.2
   000108         011000 WORKING-STORAGE SECTION.                                         IX1124.2
   000109         011100                                                                  IX1124.2
   000110         011200 01  GRP-0101.                                                    IX1124.2
   000111         011300     05  FILLER              PIC X(10) VALUE "RECORD-KEY".        IX1124.2
   000112         011400     05  GRP-0101-KEY        PIC 9(9)  VALUE ZERO.                IX1124.2 IMP
   000113         011500     05  FILLER              PIC X(10) VALUE "END-OF-KEY".        IX1124.2
   000114         011600                                                                  IX1124.2
   000115         011700 01  GRP-0102.                                                    IX1124.2
   000116         011800     05  FILLER              PIC X(10) VALUE "ALTERN-KEY".        IX1124.2
   000117         011900     05  GRP-0102-KEY        PIC 9(9)  VALUE ZERO.                IX1124.2 IMP
   000118         012000     05  FILLER              PIC X(10) VALUE "END-AL-KEY".        IX1124.2
   000119         012100                                                                  IX1124.2
   000120         012200 01  WRK-CS-09V00            PIC S9(9) COMP VALUE ZERO.           IX1124.2 IMP
   000121         012300                                                                  IX1124.2
   000122         012400 01  EOF-FLAG                PIC 9 VALUE ZERO.                    IX1124.2 IMP
   000123         012500                                                                  IX1124.2
   000124         012600 01  RECORDS-IN-ERROR        PIC S9(5) COMP VALUE ZERO.           IX1124.2 IMP
   000125         012700                                                                  IX1124.2
   000126         012800 01  ERROR-FLAG              PIC 9 VALUE ZERO.                    IX1124.2 IMP
   000127         012900                                                                  IX1124.2
   000128         013000 01  PERM-ERRORS             PIC S9(5) COMP VALUE ZERO.           IX1124.2 IMP
   000129         013100                                                                  IX1124.2
   000130         013200 01  STATUS-TEST-00          PIC 9 VALUE ZERO.                    IX1124.2 IMP
   000131         013300                                                                  IX1124.2
   000132         013400 01  STATUS-TEST-10          PIC 9 VALUE ZERO.                    IX1124.2 IMP
   000133         013500 01  STATUS-TEST-READ        PIC 9 VALUE ZERO.                    IX1124.2 IMP
   000134         013600                                                                  IX1124.2
   000135         013700 01  IX-VS2-STATUS.                                               IX1124.2
   000136         013800     05  IX-VS2-STAT1        PIC X.                               IX1124.2
   000137         013900     05  IX-VS2-STAT2        PIC X.                               IX1124.2
   000138         014000                                                                  IX1124.2
   000139         014100 01  COUNT-OF-RECS           PIC 9(5).                            IX1124.2
   000140         014200                                                                  IX1124.2
   000141         014300 01  COUNT-OF-RECORDS REDEFINES COUNT-OF-RECS  PIC 9(5).          IX1124.2 139
   000142         014400                                                                  IX1124.2
   000143         014500 01  FILE-RECORD-INFORMATION-REC.                                 IX1124.2
   000144         014600     05  FILE-RECORD-INFO-SKELETON.                               IX1124.2
   000145         014700         10  FILLER          PIC X(48) VALUE                      IX1124.2
   000146         014800              "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00". IX1124.2
   000147         014900         10  FILLER          PIC X(46) VALUE                      IX1124.2
   000148         015000                ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000". IX1124.2
   000149         015100         10  FILLER          PIC X(26) VALUE                      IX1124.2
   000150         015200                                    ",LFIL=000000,ORG=  ,LBLR= ". IX1124.2
   000151         015300         10  FILLER          PIC X(37) VALUE                      IX1124.2
   000152         015400                         ",RECKEY=                             ". IX1124.2
   000153         015500         10  FILLER          PIC X(38) VALUE                      IX1124.2
   000154         015600                        ",ALTKEY1=                             ". IX1124.2
   000155         015700         10  FILLER          PIC X(38) VALUE                      IX1124.2
   000156         015800                        ",ALTKEY2=                             ". IX1124.2
   000157         015900         10  FILLER          PIC X(7) VALUE SPACE.                IX1124.2 IMP
   000158         016000     05  FILE-RECORD-INFO             OCCURS 10.                  IX1124.2
   000159         016100         10  FILE-RECORD-INFO-P1-120.                             IX1124.2
   000160         016200             15  FILLER      PIC X(5).                            IX1124.2
   000161         016300             15  XFILE-NAME  PIC X(6).                            IX1124.2
   000162         016400             15  FILLER      PIC X(8).                            IX1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000163         016500             15  XRECORD-NAME  PIC X(6).                          IX1124.2
   000164         016600             15  FILLER        PIC X(1).                          IX1124.2
   000165         016700             15  REELUNIT-NUMBER  PIC 9(1).                       IX1124.2
   000166         016800             15  FILLER           PIC X(7).                       IX1124.2
   000167         016900             15  XRECORD-NUMBER   PIC 9(6).                       IX1124.2
   000168         017000             15  FILLER           PIC X(6).                       IX1124.2
   000169         017100             15  UPDATE-NUMBER    PIC 9(2).                       IX1124.2
   000170         017200             15  FILLER           PIC X(5).                       IX1124.2
   000171         017300             15  ODO-NUMBER       PIC 9(4).                       IX1124.2
   000172         017400             15  FILLER           PIC X(5).                       IX1124.2
   000173         017500             15  XPROGRAM-NAME    PIC X(5).                       IX1124.2
   000174         017600             15  FILLER           PIC X(7).                       IX1124.2
   000175         017700             15  XRECORD-LENGTH   PIC 9(6).                       IX1124.2
   000176         017800             15  FILLER           PIC X(7).                       IX1124.2
   000177         017900             15  CHARS-OR-RECORDS  PIC X(2).                      IX1124.2
   000178         018000             15  FILLER            PIC X(1).                      IX1124.2
   000179         018100             15  XBLOCK-SIZE       PIC 9(4).                      IX1124.2
   000180         018200             15  FILLER            PIC X(6).                      IX1124.2
   000181         018300             15  RECORDS-IN-FILE   PIC 9(6).                      IX1124.2
   000182         018400             15  FILLER            PIC X(5).                      IX1124.2
   000183         018500             15  XFILE-ORGANIZATION  PIC X(2).                    IX1124.2
   000184         018600             15  FILLER              PIC X(6).                    IX1124.2
   000185         018700             15  XLABEL-TYPE         PIC X(1).                    IX1124.2
   000186         018800         10  FILE-RECORD-INFO-P121-240.                           IX1124.2
   000187         018900             15  FILLER              PIC X(8).                    IX1124.2
   000188         019000             15  XRECORD-KEY         PIC X(29).                   IX1124.2
   000189         019100             15  FILLER              PIC X(9).                    IX1124.2
   000190         019200             15  ALTERNATE-KEY1      PIC X(29).                   IX1124.2
   000191         019300             15  FILLER              PIC X(9).                    IX1124.2
   000192         019400             15  ALTERNATE-KEY2      PIC X(29).                   IX1124.2
   000193         019500             15  FILLER              PIC X(7).                    IX1124.2
   000194         019600                                                                  IX1124.2
   000195         019700 01  TEST-RESULTS.                                                IX1124.2
   000196         019800     02 FILLER                   PIC X      VALUE SPACE.          IX1124.2 IMP
   000197         019900     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1124.2 IMP
   000198         020000     02 FILLER                   PIC X      VALUE SPACE.          IX1124.2 IMP
   000199         020100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1124.2 IMP
   000200         020200     02 FILLER                   PIC X      VALUE SPACE.          IX1124.2 IMP
   000201         020300     02  PAR-NAME.                                                IX1124.2
   000202         020400       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1124.2 IMP
   000203         020500       03  PARDOT-X              PIC X      VALUE SPACE.          IX1124.2 IMP
   000204         020600       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1124.2 IMP
   000205         020700     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1124.2 IMP
   000206         020800     02 RE-MARK                  PIC X(61).                       IX1124.2
   000207         020900 01  TEST-COMPUTED.                                               IX1124.2
   000208         021000     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1124.2 IMP
   000209         021100     02 FILLER                   PIC X(17)  VALUE                 IX1124.2
   000210         021200            "       COMPUTED=".                                   IX1124.2
   000211         021300     02 COMPUTED-X.                                               IX1124.2
   000212         021400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1124.2 IMP
   000213         021500     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1124.2 212
   000214         021600                                 PIC -9(9).9(9).                  IX1124.2
   000215         021700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1124.2 212
   000216         021800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1124.2 212
   000217         021900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1124.2 212
   000218         022000     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1124.2 212
   000219         022100         04 COMPUTED-18V0                    PIC -9(18).          IX1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000220         022200         04 FILLER                           PIC X.               IX1124.2
   000221         022300     03 FILLER PIC X(50) VALUE SPACE.                             IX1124.2 IMP
   000222         022400 01  TEST-CORRECT.                                                IX1124.2
   000223         022500     02 FILLER PIC X(30) VALUE SPACE.                             IX1124.2 IMP
   000224         022600     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1124.2
   000225         022700     02 CORRECT-X.                                                IX1124.2
   000226         022800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1124.2 IMP
   000227         022900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1124.2 226
   000228         023000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1124.2 226
   000229         023100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1124.2 226
   000230         023200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1124.2 226
   000231         023300     03      CR-18V0 REDEFINES CORRECT-A.                         IX1124.2 226
   000232         023400         04 CORRECT-18V0                     PIC -9(18).          IX1124.2
   000233         023500         04 FILLER                           PIC X.               IX1124.2
   000234         023600     03 FILLER PIC X(2) VALUE SPACE.                              IX1124.2 IMP
   000235         023700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1124.2 IMP
   000236         023800 01  CCVS-C-1.                                                    IX1124.2
   000237         023900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1124.2
   000238         024000-    "SS  PARAGRAPH-NAME                                          IX1124.2
   000239         024100-    "       REMARKS".                                            IX1124.2
   000240         024200     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1124.2 IMP
   000241         024300 01  CCVS-C-2.                                                    IX1124.2
   000242         024400     02 FILLER                     PIC X        VALUE SPACE.      IX1124.2 IMP
   000243         024500     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1124.2
   000244         024600     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1124.2 IMP
   000245         024700     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1124.2
   000246         024800     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1124.2 IMP
   000247         024900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1124.2 IMP
   000248         025000 01  REC-CT                        PIC 99       VALUE ZERO.       IX1124.2 IMP
   000249         025100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1124.2 IMP
   000250         025200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1124.2 IMP
   000251         025300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1124.2 IMP
   000252         025400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1124.2 IMP
   000253         025500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1124.2 IMP
   000254         025600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1124.2 IMP
   000255         025700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1124.2 IMP
   000256         025800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1124.2 IMP
   000257         025900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1124.2 IMP
   000258         026000 01  CCVS-H-1.                                                    IX1124.2
   000259         026100     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1124.2 IMP
   000260         026200     02  FILLER                    PIC X(42)    VALUE             IX1124.2
   000261         026300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1124.2
   000262         026400     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1124.2 IMP
   000263         026500 01  CCVS-H-2A.                                                   IX1124.2
   000264         026600   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1124.2 IMP
   000265         026700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1124.2
   000266         026800   02  FILLER                        PIC XXXX   VALUE             IX1124.2
   000267         026900     "4.2 ".                                                      IX1124.2
   000268         027000   02  FILLER                        PIC X(28)  VALUE             IX1124.2
   000269         027100            " COPY - NOT FOR DISTRIBUTION".                       IX1124.2
   000270         027200   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1124.2 IMP
   000271         027300                                                                  IX1124.2
   000272         027400 01  CCVS-H-2B.                                                   IX1124.2
   000273         027500   02  FILLER                        PIC X(15)  VALUE             IX1124.2
   000274         027600            "TEST RESULT OF ".                                    IX1124.2
   000275         027700   02  TEST-ID                       PIC X(9).                    IX1124.2
   000276         027800   02  FILLER                        PIC X(4)   VALUE             IX1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000277         027900            " IN ".                                               IX1124.2
   000278         028000   02  FILLER                        PIC X(12)  VALUE             IX1124.2
   000279         028100     " HIGH       ".                                              IX1124.2
   000280         028200   02  FILLER                        PIC X(22)  VALUE             IX1124.2
   000281         028300            " LEVEL VALIDATION FOR ".                             IX1124.2
   000282         028400   02  FILLER                        PIC X(58)  VALUE             IX1124.2
   000283         028500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1124.2
   000284         028600 01  CCVS-H-3.                                                    IX1124.2
   000285         028700     02  FILLER                      PIC X(34)  VALUE             IX1124.2
   000286         028800            " FOR OFFICIAL USE ONLY    ".                         IX1124.2
   000287         028900     02  FILLER                      PIC X(58)  VALUE             IX1124.2
   000288         029000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1124.2
   000289         029100     02  FILLER                      PIC X(28)  VALUE             IX1124.2
   000290         029200            "  COPYRIGHT   1985 ".                                IX1124.2
   000291         029300 01  CCVS-E-1.                                                    IX1124.2
   000292         029400     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1124.2 IMP
   000293         029500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1124.2
   000294         029600     02 ID-AGAIN                     PIC X(9).                    IX1124.2
   000295         029700     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1124.2 IMP
   000296         029800 01  CCVS-E-2.                                                    IX1124.2
   000297         029900     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1124.2 IMP
   000298         030000     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1124.2 IMP
   000299         030100     02 CCVS-E-2-2.                                               IX1124.2
   000300         030200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1124.2 IMP
   000301         030300         03 FILLER                   PIC X      VALUE SPACE.      IX1124.2 IMP
   000302         030400         03 ENDER-DESC               PIC X(44)  VALUE             IX1124.2
   000303         030500            "ERRORS ENCOUNTERED".                                 IX1124.2
   000304         030600 01  CCVS-E-3.                                                    IX1124.2
   000305         030700     02  FILLER                      PIC X(22)  VALUE             IX1124.2
   000306         030800            " FOR OFFICIAL USE ONLY".                             IX1124.2
   000307         030900     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1124.2 IMP
   000308         031000     02  FILLER                      PIC X(58)  VALUE             IX1124.2
   000309         031100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1124.2
   000310         031200     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1124.2 IMP
   000311         031300     02 FILLER                       PIC X(15)  VALUE             IX1124.2
   000312         031400             " COPYRIGHT 1985".                                   IX1124.2
   000313         031500 01  CCVS-E-4.                                                    IX1124.2
   000314         031600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1124.2 IMP
   000315         031700     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1124.2
   000316         031800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1124.2 IMP
   000317         031900     02 FILLER                       PIC X(40)  VALUE             IX1124.2
   000318         032000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1124.2
   000319         032100 01  XXINFO.                                                      IX1124.2
   000320         032200     02 FILLER                       PIC X(19)  VALUE             IX1124.2
   000321         032300            "*** INFORMATION ***".                                IX1124.2
   000322         032400     02 INFO-TEXT.                                                IX1124.2
   000323         032500       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1124.2 IMP
   000324         032600       04 XXCOMPUTED                 PIC X(20).                   IX1124.2
   000325         032700       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1124.2 IMP
   000326         032800       04 XXCORRECT                  PIC X(20).                   IX1124.2
   000327         032900     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1124.2
   000328         033000 01  HYPHEN-LINE.                                                 IX1124.2
   000329         033100     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1124.2 IMP
   000330         033200     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1124.2
   000331         033300-    "*****************************************".                 IX1124.2
   000332         033400     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1124.2
   000333         033500-    "******************************".                            IX1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000334         033600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1124.2
   000335         033700     "IX112A".                                                    IX1124.2
   000336         033800 01 TEST-NUMBER                      PIC 9 VALUE ZERO.            IX1124.2 IMP
   000337         033900                                                                  IX1124.2
   000338         034000 PROCEDURE DIVISION.                                              IX1124.2
   000339         034100 DECLARATIVES.                                                    IX1124.2
   000340         034200                                                                  IX1124.2
   000341         034300 SECT-IX105-0002 SECTION.                                         IX1124.2
   000342         034400     USE AFTER EXCEPTION PROCEDURE ON IX-VS2.                     IX1124.2 83
   000343         034500 INPUT-PROCESS.                                                   IX1124.2
   000344         034600         MOVE 1 TO PERM-ERRORS.                                   IX1124.2 128
   000345         034700         IF TEST-NUMBER NOT = 7 GO TO END-DECL.                   IX1124.2 336 473
   000346         034800 D-RWR-TEST-GF-01-1.                                              IX1124.2
   000347         034900     IF IX-VS2-STATUS  = "00"                                     IX1124.2 135
   000348      1  035000         GO TO D-RWR-PASS-GF-01-0.                                IX1124.2 357
   000349         035100     IF IX-VS2-STATUS  = "44"                                     IX1124.2 135
   000350      1  035200         GO TO D-RWR-PASS-GF-01-0.                                IX1124.2 357
   000351         035300 D-RWR-FAIL-GF-01-0.                                              IX1124.2
   000352         035400     MOVE "IX-5, 1.3.4, (5) d 1 & 2;  SHORT RECORD" TO RE-MARK.   IX1124.2 206
   000353         035500     PERFORM D-FAIL.                                              IX1124.2 381
   000354         035600     MOVE  IX-VS2-STATUS      TO COMPUTED-A.                      IX1124.2 135 212
   000355         035700     MOVE "00 OR 44" TO CORRECT-X.                                IX1124.2 225
   000356         035800     GO TO D-RWR-WRITE-GF-01-0.                                   IX1124.2 359
   000357         035900 D-RWR-PASS-GF-01-0.                                              IX1124.2
   000358         036000     PERFORM D-PASS.                                              IX1124.2 380
   000359         036100 D-RWR-WRITE-GF-01-0.                                             IX1124.2
   000360         036200     PERFORM D-PRINT-DETAIL.                                      IX1124.2 382
   000361         036300 D-CLOSE-FILES.                                                   IX1124.2
   000362         036400     OPEN I-O RAW-DATA.                                           IX1124.2 61
   000363         036500     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1124.2 334 64
   000364         036600     READ RAW-DATA INVALID KEY GO TO D-END-E-2.                   IX1124.2 61 372
   000365         036700     MOVE "OK.     " TO C-ABORT.                                  IX1124.2 75
   000366         036800     MOVE PASS-COUNTER TO C-OK.                                   IX1124.2 252 68
   000367         036900     MOVE ERROR-HOLD   TO C-ALL.                                  IX1124.2 254 69
   000368         037000     MOVE ERROR-COUNTER TO C-FAIL.                                IX1124.2 250 70
   000369         037100     MOVE DELETE-COUNTER TO C-DELETED.                            IX1124.2 249 71
   000370         037200     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1124.2 251 72
   000371         037300     REWRITE RAW-DATA-SATZ INVALID KEY GO TO D-END-E-2.           IX1124.2 63 372
   000372         037400 D-END-E-2.                                                       IX1124.2
   000373         037500     CLOSE RAW-DATA.                                              IX1124.2 61
   000374         037600     PERFORM D-END-ROUTINE THRU D-END-ROUTINE-13.                 IX1124.2 394 415
   000375         037700     CLOSE PRINT-FILE.                                            IX1124.2 77
   000376         037800 D-TERMINATE-CCVS.                                                IX1124.2
   000377         037900     EXIT PROGRAM.                                                IX1124.2
   000378         038000 D-TERMINATE-CALL.                                                IX1124.2
   000379         038100     STOP     RUN.                                                IX1124.2
   000380         038200 D-PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.         IX1124.2 199 252
   000381         038300 D-FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.        IX1124.2 199 250
   000382         038400 D-PRINT-DETAIL.                                                  IX1124.2
   000383         038500     IF REC-CT NOT EQUAL TO ZERO                                  IX1124.2 248 IMP
   000384      1  038600             MOVE "." TO PARDOT-X                                 IX1124.2 203
   000385      1  038700             MOVE REC-CT TO DOTVALUE.                             IX1124.2 248 204
   000386         038800     MOVE TEST-RESULTS TO PRINT-REC. PERFORM D-WRITE-LINE.        IX1124.2 195 79 427
   000387         038900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM D-WRITE-LINE             IX1124.2 199 427
   000388      1  039000        PERFORM D-FAIL-ROUTINE THRU D-FAIL-ROUTINE-EX             IX1124.2 448 462
   000389      1  039100     ELSE PERFORM D-BAIL-OUT THRU D-BAIL-OUT-EX.                  IX1124.2 463 471
   000390         039200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1124.2 IMP 199 IMP 211
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000391         039300     MOVE SPACE TO CORRECT-X.                                     IX1124.2 IMP 225
   000392         039400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1124.2 248 IMP IMP 201
   000393         039500     MOVE     SPACE TO RE-MARK.                                   IX1124.2 IMP 206
   000394         039600 D-END-ROUTINE.                                                   IX1124.2
   000395         039700     MOVE HYPHEN-LINE TO DUMMY-RECORD.                            IX1124.2 328 81
   000396         039800     PERFORM D-WRITE-LINE 5 TIMES.                                IX1124.2 427
   000397         039900 D-END-RTN-EXIT.                                                  IX1124.2
   000398         040000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES. IX1124.2 291 81 427
   000399         040100 D-END-ROUTINE-1.                                                 IX1124.2
   000400         040200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1124.2 250 254 251
   000401         040300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1124.2 254 249 254
   000402         040400      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1124.2 252 254
   000403         040500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1124.2 252 314
   000404         040600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1124.2 254 316
   000405         040700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1124.2 313 299
   000406         040800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM D-WRITE-LINE.         IX1124.2 296 81 427
   000407         040900 D-END-ROUTINE-12.                                                IX1124.2
   000408         041000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1124.2 302
   000409         041100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1124.2 250 IMP
   000410      1  041200         MOVE "NO " TO ERROR-TOTAL                                IX1124.2 300
   000411         041300         ELSE                                                     IX1124.2
   000412      1  041400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1124.2 250 300
   000413         041500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1124.2 296 81
   000414         041600     PERFORM D-WRITE-LINE.                                        IX1124.2 427
   000415         041700 D-END-ROUTINE-13.                                                IX1124.2
   000416         041800     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1124.2 249 IMP
   000417      1  041900         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1124.2 300
   000418      1  042000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1124.2 249 300
   000419         042100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1124.2 302
   000420         042200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1124.2 296 81 427
   000421         042300      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1124.2 251 IMP
   000422      1  042400          MOVE "NO " TO ERROR-TOTAL                               IX1124.2 300
   000423      1  042500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1124.2 251 300
   000424         042600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1124.2 302
   000425         042700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1124.2 296 81 427
   000426         042800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1124.2 304 81 427
   000427         042900 D-WRITE-LINE.                                                    IX1124.2
   000428         043000     ADD 1 TO RECORD-COUNT.                                       IX1124.2 256
   000429         043100     IF RECORD-COUNT GREATER 42                                   IX1124.2 256
   000430      1  043200       MOVE DUMMY-RECORD TO DUMMY-HOLD                            IX1124.2 81 255
   000431      1  043300       MOVE SPACE TO DUMMY-RECORD                                 IX1124.2 IMP 81
   000432      1  043400       WRITE DUMMY-RECORD AFTER ADVANCING PAGE                    IX1124.2 81
   000433      1  043500       MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES    IX1124.2 258 81 443
   000434      1  043600       MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES    IX1124.2 263 81 443
   000435      1  043700       MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES    IX1124.2 272 81 443
   000436      1  043800       MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES    IX1124.2 284 81 443
   000437      1  043900       MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM D-WRT-LN            IX1124.2 236 81 443
   000438      1  044000       MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM D-WRT-LN            IX1124.2 241 81 443
   000439      1  044100       MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM D-WRT-LN          IX1124.2 328 81 443
   000440      1  044200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1124.2 255 81
   000441      1  044300         MOVE ZERO TO RECORD-COUNT.                               IX1124.2 IMP 256
   000442         044400     PERFORM D-WRT-LN.                                            IX1124.2 443
   000443         044500 D-WRT-LN.                                                        IX1124.2
   000444         044600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1124.2 81
   000445         044700     MOVE SPACE TO DUMMY-RECORD.                                  IX1124.2 IMP 81
   000446         044800 D-BLANK-LINE-PRINT.                                              IX1124.2
   000447         044900     PERFORM D-WRT-LN.                                            IX1124.2 443
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448         045000 D-FAIL-ROUTINE.                                                  IX1124.2
   000449         045100     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1124.2 211 IMP
   000450      1  045200            GO TO  D-FAIL-ROUTINE-WRITE.                          IX1124.2 457
   000451         045300     IF  CORRECT-X NOT EQUAL TO SPACE GO TO D-FAIL-ROUTINE-WRITE. IX1124.2 225 IMP 457
   000452         045400     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1124.2 257 327
   000453         045500     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    IX1124.2 322
   000454         045600     MOVE  XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.  IX1124.2 319 81 427
   000455         045700     MOVE  SPACES TO INF-ANSI-REFERENCE.                          IX1124.2 IMP 327
   000456         045800     GO TO D-FAIL-ROUTINE-EX.                                     IX1124.2 462
   000457         045900 D-FAIL-ROUTINE-WRITE.                                            IX1124.2
   000458         046000     MOVE  TEST-COMPUTED TO PRINT-REC PERFORM D-WRITE-LINE        IX1124.2 207 79 427
   000459         046100     MOVE  ANSI-REFERENCE TO COR-ANSI-REFERENCE.                  IX1124.2 257 235
   000460         046200     MOVE TEST-CORRECT TO PRINT-REC PERFORM D-WRITE-LINE 2 TIMES. IX1124.2 222 79 427
   000461         046300     MOVE  SPACES TO COR-ANSI-REFERENCE.                          IX1124.2 IMP 235
   000462         046400 D-FAIL-ROUTINE-EX. EXIT.                                         IX1124.2
   000463         046500 D-BAIL-OUT.                                                      IX1124.2
   000464         046600     IF  COMPUTED-A NOT EQUAL TO SPACE GO TO D-BAIL-OUT-WRITE.    IX1124.2 212 IMP 466
   000465         046700     IF  CORRECT-A EQUAL TO SPACE GO TO D-BAIL-OUT-EX.            IX1124.2 226 IMP 471
   000466         046800 D-BAIL-OUT-WRITE.                                                IX1124.2
   000467         046900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1124.2 226 326 212 324
   000468         047000     MOVE  ANSI-REFERENCE TO INF-ANSI-REFERENCE.                  IX1124.2 257 327
   000469         047100     MOVE  XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.  IX1124.2 319 81 427
   000470         047200     MOVE  SPACES TO INF-ANSI-REFERENCE.                          IX1124.2 IMP 327
   000471         047300 D-BAIL-OUT-EX. EXIT.                                             IX1124.2
   000472         047400                                                                  IX1124.2
   000473         047500 END-DECL.                                                        IX1124.2
   000474         047600 END DECLARATIVES.                                                IX1124.2
   000475         047700                                                                  IX1124.2
   000476         047800                                                                  IX1124.2
   000477         047900 CCVS1 SECTION.                                                   IX1124.2
   000478         048000 OPEN-FILES.                                                      IX1124.2
   000479         048100     OPEN I-O RAW-DATA.                                           IX1124.2 61
   000480         048200     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1124.2 334 64
   000481         048300     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1124.2 61 487
   000482         048400     MOVE "ABORTED " TO C-ABORT.                                  IX1124.2 75
   000483         048500     ADD 1 TO C-NO-OF-TESTS.                                      IX1124.2 67
   000484         048600     ACCEPT C-DATE  FROM DATE.                                    IX1124.2 65
   000485         048700     ACCEPT C-TIME  FROM TIME.                                    IX1124.2 66
   000486         048800     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1124.2 63 487
   000487         048900 END-E-1.                                                         IX1124.2
   000488         049000     CLOSE RAW-DATA.                                              IX1124.2 61
   000489         049100     OPEN    OUTPUT PRINT-FILE.                                   IX1124.2 77
   000490         049200     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1124.2 334 275 334 294
   000491         049300     MOVE    SPACE TO TEST-RESULTS.                               IX1124.2 IMP 195
   000492         049400     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1124.2 536 541
   000493         049500     MOVE    ZERO TO REC-SKL-SUB.                                 IX1124.2 IMP 247
   000494         049600     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1124.2 495
   000495         049700 CCVS-INIT-FILE.                                                  IX1124.2
   000496         049800     ADD     1 TO REC-SKL-SUB.                                    IX1124.2 247
   000497         049900     MOVE    FILE-RECORD-INFO-SKELETON                            IX1124.2 144
   000498         050000          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1124.2 158 247
   000499         050100 CCVS-INIT-EXIT.                                                  IX1124.2
   000500         050200     GO TO CCVS1-EXIT.                                            IX1124.2 623
   000501         050300 CLOSE-FILES.                                                     IX1124.2
   000502         050400     OPEN I-O RAW-DATA.                                           IX1124.2 61
   000503         050500     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1124.2 334 64
   000504         050600     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1124.2 61 512
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000505         050700     MOVE "OK.     " TO C-ABORT.                                  IX1124.2 75
   000506         050800     MOVE PASS-COUNTER TO C-OK.                                   IX1124.2 252 68
   000507         050900     MOVE ERROR-HOLD   TO C-ALL.                                  IX1124.2 254 69
   000508         051000     MOVE ERROR-COUNTER TO C-FAIL.                                IX1124.2 250 70
   000509         051100     MOVE DELETE-COUNTER TO C-DELETED.                            IX1124.2 249 71
   000510         051200     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1124.2 251 72
   000511         051300     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1124.2 63 512
   000512         051400 END-E-2.                                                         IX1124.2
   000513         051500     CLOSE RAW-DATA.                                              IX1124.2 61
   000514         051600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1124.2 545 566 77
   000515         051700 TERMINATE-CCVS.                                                  IX1124.2
   000516         051800     EXIT PROGRAM.                                                IX1124.2
   000517         051900 TERMINATE-CALL.                                                  IX1124.2
   000518         052000     STOP     RUN.                                                IX1124.2
   000519         052100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1124.2 199 251
   000520         052200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1124.2 199 252
   000521         052300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1124.2 199 250
   000522         052400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1124.2 199 249
   000523         052500     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1124.2 206
   000524         052600 PRINT-DETAIL.                                                    IX1124.2
   000525         052700     IF REC-CT NOT EQUAL TO ZERO                                  IX1124.2 248 IMP
   000526      1  052800             MOVE "." TO PARDOT-X                                 IX1124.2 203
   000527      1  052900             MOVE REC-CT TO DOTVALUE.                             IX1124.2 248 204
   000528         053000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1124.2 195 79 578
   000529         053100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1124.2 199 578
   000530      1  053200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1124.2 599 613
   000531      1  053300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1124.2 614 622
   000532         053400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1124.2 IMP 199 IMP 211
   000533         053500     MOVE SPACE TO CORRECT-X.                                     IX1124.2 IMP 225
   000534         053600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1124.2 248 IMP IMP 201
   000535         053700     MOVE     SPACE TO RE-MARK.                                   IX1124.2 IMP 206
   000536         053800 HEAD-ROUTINE.                                                    IX1124.2
   000537         053900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1124.2 258 81 578
   000538         054000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1124.2 263 81 578
   000539         054100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1124.2 272 81 578
   000540         054200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1124.2 284 81 578
   000541         054300 COLUMN-NAMES-ROUTINE.                                            IX1124.2
   000542         054400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1124.2 236 81 578
   000543         054500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1124.2 241 81 578
   000544         054600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1124.2 328 81 578
   000545         054700 END-ROUTINE.                                                     IX1124.2
   000546         054800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1124.2 328 81 578
   000547         054900 END-RTN-EXIT.                                                    IX1124.2
   000548         055000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1124.2 291 81 578
   000549         055100 END-ROUTINE-1.                                                   IX1124.2
   000550         055200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1124.2 250 254 251
   000551         055300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1124.2 254 249 254
   000552         055400      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1124.2 252 254
   000553         055500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1124.2
   000554         055600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1124.2 252 314
   000555         055700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1124.2 254 316
   000556         055800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1124.2 313 299
   000557         055900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1124.2 296 81 578
   000558         056000  END-ROUTINE-12.                                                 IX1124.2
   000559         056100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1124.2 302
   000560         056200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1124.2 250 IMP
   000561      1  056300         MOVE "NO " TO ERROR-TOTAL                                IX1124.2 300
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000562         056400         ELSE                                                     IX1124.2
   000563      1  056500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1124.2 250 300
   000564         056600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1124.2 296 81
   000565         056700     PERFORM WRITE-LINE.                                          IX1124.2 578
   000566         056800 END-ROUTINE-13.                                                  IX1124.2
   000567         056900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1124.2 249 IMP
   000568      1  057000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1124.2 300
   000569      1  057100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1124.2 249 300
   000570         057200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1124.2 302
   000571         057300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1124.2 296 81 578
   000572         057400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1124.2 251 IMP
   000573      1  057500          MOVE "NO " TO ERROR-TOTAL                               IX1124.2 300
   000574      1  057600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1124.2 251 300
   000575         057700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1124.2 302
   000576         057800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1124.2 296 81 578
   000577         057900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1124.2 304 81 578
   000578         058000 WRITE-LINE.                                                      IX1124.2
   000579         058100     ADD 1 TO RECORD-COUNT.                                       IX1124.2 256
   000580         058200     IF RECORD-COUNT GREATER 42                                   IX1124.2 256
   000581      1  058300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1124.2 81 255
   000582      1  058400         MOVE SPACE TO DUMMY-RECORD                               IX1124.2 IMP 81
   000583      1  058500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1124.2 81
   000584      1  058600         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1124.2 258 81 594
   000585      1  058700         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1124.2 263 81 594
   000586      1  058800         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1124.2 272 81 594
   000587      1  058900         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1124.2 284 81 594
   000588      1  059000         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1124.2 236 81 594
   000589      1  059100         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1124.2 241 81 594
   000590      1  059200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1124.2 328 81 594
   000591      1  059300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1124.2 255 81
   000592      1  059400         MOVE ZERO TO RECORD-COUNT.                               IX1124.2 IMP 256
   000593         059500     PERFORM WRT-LN.                                              IX1124.2 594
   000594         059600 WRT-LN.                                                          IX1124.2
   000595         059700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1124.2 81
   000596         059800     MOVE SPACE TO DUMMY-RECORD.                                  IX1124.2 IMP 81
   000597         059900 BLANK-LINE-PRINT.                                                IX1124.2
   000598         060000     PERFORM WRT-LN.                                              IX1124.2 594
   000599         060100 FAIL-ROUTINE.                                                    IX1124.2
   000600         060200     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1124.2 211 IMP
   000601      1  060300            GO TO   FAIL-ROUTINE-WRITE.                           IX1124.2 608
   000602         060400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1124.2 225 IMP 608
   000603         060500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1124.2 257 327
   000604         060600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1124.2 322
   000605         060700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1124.2 319 81 578
   000606         060800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1124.2 IMP 327
   000607         060900     GO TO  FAIL-ROUTINE-EX.                                      IX1124.2 613
   000608         061000 FAIL-ROUTINE-WRITE.                                              IX1124.2
   000609         061100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1124.2 207 79 578
   000610         061200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1124.2 257 235
   000611         061300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1124.2 222 79 578
   000612         061400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1124.2 IMP 235
   000613         061500 FAIL-ROUTINE-EX. EXIT.                                           IX1124.2
   000614         061600 BAIL-OUT.                                                        IX1124.2
   000615         061700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1124.2 212 IMP 617
   000616         061800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1124.2 226 IMP 622
   000617         061900 BAIL-OUT-WRITE.                                                  IX1124.2
   000618         062000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1124.2 226 326 212 324
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000619         062100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1124.2 257 327
   000620         062200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1124.2 319 81 578
   000621         062300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1124.2 IMP 327
   000622         062400 BAIL-OUT-EX. EXIT.                                               IX1124.2
   000623         062500 CCVS1-EXIT.                                                      IX1124.2
   000624         062600     EXIT.                                                        IX1124.2
   000625         062700                                                                  IX1124.2
   000626         062800 SECT-IX112A-0003 SECTION.                                        IX1124.2
   000627         062900 SEQ-INIT-010.                                                    IX1124.2
   000628         063000     MOVE "IX-VS2" TO XFILE-NAME (1).                             IX1124.2 161
   000629         063100     MOVE "R1-F-G" TO XRECORD-NAME (1).                           IX1124.2 163
   000630         063200     MOVE CCVS-PGM-ID TO XPROGRAM-NAME (1).                       IX1124.2 334 173
   000631         063300     MOVE 000240 TO XRECORD-LENGTH (1).                           IX1124.2 175
   000632         063400     MOVE "RC" TO CHARS-OR-RECORDS (1).                           IX1124.2 177
   000633         063500     MOVE 0002 TO XBLOCK-SIZE (1).                                IX1124.2 179
   000634         063600     MOVE 000050 TO RECORDS-IN-FILE (1).                          IX1124.2 181
   000635         063700     MOVE "IX" TO XFILE-ORGANIZATION (1).                         IX1124.2 183
   000636         063800     MOVE "S" TO XLABEL-TYPE (1).                                 IX1124.2 185
   000637         063900     MOVE 000001 TO XRECORD-NUMBER (1).                           IX1124.2 167
   000638         064000     MOVE 0 TO COUNT-OF-RECS.                                     IX1124.2 139
   000639         064100                                                                  IX1124.2
   000640         064300*   TEST  1                                                      *IX1124.2
   000641         064400*         OPEN OUTPUT ...                 00 EXPECTED            *IX1124.2
   000642         064500*         IX-3, 1.3.4 (1) a                                      *IX1124.2
   000643         064600*    STATUS 00 CHECK ON OUTPUT FILE IX-VS2                       *IX1124.2
   000644         064700*    THE OUTPUT STATEMENT IS SUCCESSFULLY EXECUTED               *IX1124.2
   000645         064900 OPN-INIT-GF-01-0.                                                IX1124.2
   000646         065000     ADD  1 TO TEST-NUMBER.                                       IX1124.2 336
   000647         065100     MOVE 1 TO STATUS-TEST-00.                                    IX1124.2 130
   000648         065200     MOVE SPACES TO IX-VS2-STATUS.                                IX1124.2 IMP 135
   000649         065300     MOVE "OPEN OUTPUT: 00 EXP." TO FEATURE.                      IX1124.2 197
   000650         065400     MOVE "OPN-TEST-GF-01-0" TO PAR-NAME.                         IX1124.2 201
   000651         065500     OPEN                                                         IX1124.2
   000652         065600        OUTPUT IX-VS2.                                            IX1124.2 83
   000653         065700     IF IX-VS2-STATUS EQUAL TO "00"                               IX1124.2 135
   000654      1  065800         GO TO OPN-PASS-GF-01-0.                                  IX1124.2 661
   000655         065900 OPN-FAIL-GF-01-0.                                                IX1124.2
   000656         066000     MOVE "IX-3, 1.3.4, (1) a. " TO RE-MARK.                      IX1124.2 206
   000657         066100     PERFORM FAIL.                                                IX1124.2 521
   000658         066200     MOVE IX-VS2-STATUS TO COMPUTED-A.                            IX1124.2 135 212
   000659         066300     MOVE "00" TO CORRECT-X.                                      IX1124.2 225
   000660         066400     GO TO OPN-WRITE-GF-01-0.                                     IX1124.2 663
   000661         066500 OPN-PASS-GF-01-0.                                                IX1124.2
   000662         066600     PERFORM PASS.                                                IX1124.2 520
   000663         066700 OPN-WRITE-GF-01-0.                                               IX1124.2
   000664         066800     PERFORM PRINT-DETAIL.                                        IX1124.2 524
   000665         067000*   TEST  2                                                      *IX1124.2
   000666         067100*         WRITE                           00 EXPECTED            *IX1124.2
   000667         067200*         IX-3, 1.3.4 (1) a                                      *IX1124.2
   000668         067300*    CREATING A INDEXED FILE WITH 50 RECORDS                     *IX1124.2
   000669         067400*    KEY:  FROM  000000001 TO 000000050                          *IX1124.2
   000670         067600 WRI-INIT-GF-01-0.                                                IX1124.2
   000671         067700     ADD  1 TO TEST-NUMBER.                                       IX1124.2 336
   000672         067800     MOVE SPACES TO IX-VS2-STATUS.                                IX1124.2 IMP 135
   000673         067900     MOVE 0 TO STATUS-TEST-00.                                    IX1124.2 130
   000674         068000     MOVE "WRITE: 00 EXPECTED" TO FEATURE.                        IX1124.2 197
   000675         068100     MOVE "WRI-TEST-GF-01-0" TO PAR-NAME.                         IX1124.2 201
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000676         068200 WRI-TEST-GF-01-0.                                                IX1124.2
   000677         068300     MOVE XRECORD-NUMBER (1) TO GRP-0101-KEY, COUNT-OF-RECS.      IX1124.2 167 112 139
   000678         068400     MOVE GRP-0101 TO XRECORD-KEY (1).                            IX1124.2 110 188
   000679         068500     MOVE GRP-0102 TO ALTERNATE-KEY1 (1).                         IX1124.2 115 190
   000680         068600*    THE VALUE OF THE ALTERNATE KEY IS 50 TIMES UNCHANGED        *IX1124.2
   000681         068700     MOVE FILE-RECORD-INFO (1) TO IX-VS2R1-F-G-240.               IX1124.2 158 90
   000682         068800     WRITE IX-VS2R1-F-G-240.                                      IX1124.2 90
   000683         068900     IF IX-VS2-STATUS  NOT = "00"                                 IX1124.2 135
   000684      1  069000         MOVE 1 TO STATUS-TEST-00                                 IX1124.2 130
   000685      1  069100         GO TO WRI-FAIL-GF-01-0.                                  IX1124.2 694
   000686         069200     IF XRECORD-NUMBER (1) EQUAL TO 50                            IX1124.2 167
   000687      1  069300         GO TO WRI-TEST-GF-01-1.                                  IX1124.2 690
   000688         069400     ADD 1 TO XRECORD-NUMBER (1).                                 IX1124.2 167
   000689         069500     GO TO WRI-TEST-GF-01-0.                                      IX1124.2 676
   000690         069600 WRI-TEST-GF-01-1.                                                IX1124.2
   000691         069700     IF RECORDS-IN-ERROR EQUAL TO ZERO                            IX1124.2 124 IMP
   000692      1  069800         GO TO WRI-PASS-GF-01-0.                                  IX1124.2 699
   000693         069900     MOVE "ERROR IN CREATING FILE" TO RE-MARK.                    IX1124.2 206
   000694         070000 WRI-FAIL-GF-01-0.                                                IX1124.2
   000695         070100     MOVE "IX-3, 1.3.4, (1) a. " TO RE-MARK.                      IX1124.2 206
   000696         070200     PERFORM FAIL.                                                IX1124.2 521
   000697         070300     MOVE "RECORDS WRITTEN =" TO COMPUTED-A.                      IX1124.2 212
   000698         070400     GO TO WRI-WRITE-GF-01-0.                                     IX1124.2 701
   000699         070500 WRI-PASS-GF-01-0.                                                IX1124.2
   000700         070600     PERFORM PASS.                                                IX1124.2 520
   000701         070700 WRI-WRITE-GF-01-0.                                               IX1124.2
   000702         070800     PERFORM PRINT-DETAIL.                                        IX1124.2 524
   000703         070900     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   IX1124.2 212
   000704         071000     MOVE "CREATE FILE IX-VS2" TO FEATURE.                        IX1124.2 197
   000705         071100     MOVE "WRI-TEST-GF-01-1" TO PAR-NAME.                         IX1124.2 201
   000706         071200     MOVE COUNT-OF-RECS TO CORRECT-18V0.                          IX1124.2 139 232
   000707         071300     PERFORM PRINT-DETAIL.                                        IX1124.2 524
   000708         071400                                                                  IX1124.2
   000709         071600*   TEST  3                                                      *IX1124.2
   000710         071700*         WRITE  (WRONG SEQUENCE)         21 EXPECTED            *IX1124.2
   000711         071800*         IX-4, 1.3.4 (3) a                                      *IX1124.2
   000712         071900*    KEY:        000000049                                       *IX1124.2
   000713         072100 WRI-INIT-GF-02-0.                                                IX1124.2
   000714         072200     ADD  1 TO TEST-NUMBER.                                       IX1124.2 336
   000715         072300     MOVE SPACES TO IX-VS2-STATUS.                                IX1124.2 IMP 135
   000716         072400     MOVE 0 TO STATUS-TEST-00.                                    IX1124.2 130
   000717         072500     MOVE "WRITE:WRONG SEQ 21EX" TO FEATURE.                      IX1124.2 197
   000718         072600     MOVE "WRI-TEST-GF-02-0" TO PAR-NAME.                         IX1124.2 201
   000719         072700     MOVE 49 TO XRECORD-NUMBER (1).                               IX1124.2 167
   000720         072800 WRI-TEST-GF-02-0.                                                IX1124.2
   000721         072900     MOVE XRECORD-NUMBER (1) TO GRP-0101-KEY, COUNT-OF-RECS.      IX1124.2 167 112 139
   000722         073000     MOVE GRP-0101 TO XRECORD-KEY (1).                            IX1124.2 110 188
   000723         073100     MOVE GRP-0102 TO ALTERNATE-KEY1 (1).                         IX1124.2 115 190
   000724         073200     MOVE FILE-RECORD-INFO (1) TO IX-VS2R1-F-G-240.               IX1124.2 158 90
   000725         073300     WRITE IX-VS2R1-F-G-240 INVALID KEY GO TO WRI-TEST-GF-02-1.   IX1124.2 90 726
   000726         073400 WRI-TEST-GF-02-1.                                                IX1124.2
   000727         073500     IF IX-VS2-STATUS  = "21"                                     IX1124.2 135
   000728      1  073600         GO TO WRI-PASS-GF-02-0.                                  IX1124.2 735
   000729         073700 WRI-FAIL-GF-02-0.                                                IX1124.2
   000730         073800     MOVE "IX-4, 1.3.4, (3) a. " TO RE-MARK.                      IX1124.2 206
   000731         073900     PERFORM FAIL.                                                IX1124.2 521
   000732         074000     MOVE  IX-VS2-STATUS      TO COMPUTED-A.                      IX1124.2 135 212
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000733         074100     MOVE "21" TO CORRECT-X.                                      IX1124.2 225
   000734         074200     GO TO WRI-WRITE-GF-02-0.                                     IX1124.2 737
   000735         074300 WRI-PASS-GF-02-0.                                                IX1124.2
   000736         074400     PERFORM PASS.                                                IX1124.2 520
   000737         074500 WRI-WRITE-GF-02-0.                                               IX1124.2
   000738         074600     PERFORM PRINT-DETAIL.                                        IX1124.2 524
   000739         074700                                                                  IX1124.2
   000740         074900*   TEST  4                                                      *IX1124.2
   000741         075000*         CLOSE OUTPUT                    00 EXPECTED            *IX1124.2
   000742         075100*         IX-3, 1.3.4 (1) a                                      *IX1124.2
   000743         075300 CLO-INIT-GF-01-0.                                                IX1124.2
   000744         075400     ADD  1 TO TEST-NUMBER.                                       IX1124.2 336
   000745         075500     MOVE SPACES TO IX-VS2-STATUS.                                IX1124.2 IMP 135
   000746         075600     MOVE "CLOSE OUTPUT:00 EXP." TO FEATURE.                      IX1124.2 197
   000747         075700     MOVE "CLO-TEST-GF-01-0" TO PAR-NAME.                         IX1124.2 201
   000748         075800 CLO-TEST-GF-01-0.                                                IX1124.2
   000749         075900     CLOSE IX-VS2.                                                IX1124.2 83
   000750         076000     IF IX-VS2-STATUS = "00"                                      IX1124.2 135
   000751      1  076100         GO TO CLO-PASS-GF-01-0.                                  IX1124.2 758
   000752         076200 CLO-FAIL-GF-01-0.                                                IX1124.2
   000753         076300     MOVE "IX-3, 1.3.4, (1) a. " TO RE-MARK.                      IX1124.2 206
   000754         076400     PERFORM FAIL.                                                IX1124.2 521
   000755         076500     MOVE IX-VS2-STATUS TO COMPUTED-A.                            IX1124.2 135 212
   000756         076600     MOVE "00" TO CORRECT-X.                                      IX1124.2 225
   000757         076700     GO TO CLO-WRITE-GF-01-0.                                     IX1124.2 760
   000758         076800 CLO-PASS-GF-01-0.                                                IX1124.2
   000759         076900     PERFORM PASS.                                                IX1124.2 520
   000760         077000 CLO-WRITE-GF-01-0.                                               IX1124.2
   000761         077100     PERFORM PRINT-DETAIL.                                        IX1124.2 524
   000762         077200                                                                  IX1124.2
   000763         077400*    A INDEXED FILE WITH 50 RECORDS HAS BEEN CREATED.            *IX1124.2
   000764         077600                                                                  IX1124.2
   000765         077800*   TEST  5                                                      *IX1124.2
   000766         077900*         OPEN INPUT                      00 EXPECTED            *IX1124.2
   000767         078000*         IX-3, 1.3.4 (1) a                                      *IX1124.2
   000768         078200 OPN-INIT-GF-02-0.                                                IX1124.2
   000769         078300     ADD  1 TO TEST-NUMBER.                                       IX1124.2 336
   000770         078400     MOVE SPACES TO IX-VS2-STATUS.                                IX1124.2 IMP 135
   000771         078500     MOVE "OPEN INPUT:  00 EXP." TO FEATURE.                      IX1124.2 197
   000772         078600     MOVE "OPN-TEST-GF-02-0" TO PAR-NAME.                         IX1124.2 201
   000773         078700 OPN-TEST-GF-02-0.                                                IX1124.2
   000774         078800     OPEN                                                         IX1124.2
   000775         078900        INPUT IX-VS2.                                             IX1124.2 83
   000776         079000     IF IX-VS2-STATUS EQUAL TO "00"                               IX1124.2 135
   000777      1  079100         GO TO OPN-PASS-GF-02-0.                                  IX1124.2 784
   000778         079200 OPN-FAIL-GF-02-0.                                                IX1124.2
   000779         079300     MOVE "IX-3, 1.3.4, (1) a." TO RE-MARK.                       IX1124.2 206
   000780         079400     PERFORM FAIL.                                                IX1124.2 521
   000781         079500     MOVE IX-VS2-STATUS TO COMPUTED-A.                            IX1124.2 135 212
   000782         079600     MOVE "00" TO CORRECT-X.                                      IX1124.2 225
   000783         079700     GO TO OPN-WRITE-GF-02-0.                                     IX1124.2 786
   000784         079800 OPN-PASS-GF-02-0.                                                IX1124.2
   000785         079900     PERFORM PASS.                                                IX1124.2 520
   000786         080000 OPN-WRITE-GF-02-0.                                               IX1124.2
   000787         080100     PERFORM PRINT-DETAIL.                                        IX1124.2 524
   000788         080200                                                                  IX1124.2
   000789         080400*   TEST  6                                                      *IX1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000790         080500*         READ                  OO EXPECTED                      *IX1124.2
   000791         080600*         IX-3, 1.3.4 (1) a                                      *IX1124.2
   000792         080800 REA-INIT-F1-01-0.                                                IX1124.2
   000793         080900     ADD  1 TO TEST-NUMBER.                                       IX1124.2 336
   000794         081000     MOVE 1 TO STATUS-TEST-10.                                    IX1124.2 132
   000795         081100     MOVE SPACES TO IX-VS2-STATUS.                                IX1124.2 IMP 135
   000796         081200     MOVE ZERO TO COUNT-OF-RECS.                                  IX1124.2 IMP 139
   000797         081300     MOVE ZERO TO PERM-ERRORS.                                    IX1124.2 IMP 128
   000798         081400     MOVE ZERO TO EOF-FLAG.                                       IX1124.2 IMP 122
   000799         081500 REA-TEST-F1-01-0.                                                IX1124.2
   000800         081600     READ IX-VS2.                                                 IX1124.2 83
   000801         081700     MOVE "REA-TEST-F1-01-0" TO PAR-NAME.                         IX1124.2 201
   000802         081800     MOVE "READ (USE):  00 EXP."     TO FEATURE.                  IX1124.2 197
   000803         081900     IF IX-VS2-STATUS = "00"                                      IX1124.2 135
   000804      1  082000         GO TO REA-PASS-F1-01-0.                                  IX1124.2 811
   000805         082100 REA-FAIL-F1-01-0.                                                IX1124.2
   000806         082200     MOVE "IX-3, 1.3.4, (1) a. " TO RE-MARK.                      IX1124.2 206
   000807         082300     MOVE "I-O STATUS IS NOT 00" TO COMPUTED-A.                   IX1124.2 212
   000808         082400     MOVE "00" TO CORRECT-X.                                      IX1124.2 225
   000809         082500     PERFORM FAIL.                                                IX1124.2 521
   000810         082600     GO TO REA-WRITE-F1-01-0.                                     IX1124.2 813
   000811         082700 REA-PASS-F1-01-0.                                                IX1124.2
   000812         082800     PERFORM PASS.                                                IX1124.2 520
   000813         082900 REA-WRITE-F1-01-0.                                               IX1124.2
   000814         083000     PERFORM PRINT-DETAIL.                                        IX1124.2 524
   000815         083100                                                                  IX1124.2
   000816         083300*   TEST  7                                                      *IX1124.2
   000817         083400*         REWRITE   (WITH WRONG RECORD LENGTH (SHORTER))         *IX1124.2
   000818         083500*         IX-5, 1.3.4 (5) d 1 & 2                                *IX1124.2
   000819         083600*         FILE STATUS  00   OR  44   EXPECTED                    *IX1124.2
   000820         083700*    KEY:        000000005                                       *IX1124.2
   000821         083900 RWR-INIT-GF-01-0.                                                IX1124.2
   000822         084000     ADD  1 TO TEST-NUMBER.                                       IX1124.2 336
   000823         084100     CLOSE IX-VS2.                                                IX1124.2 83
   000824         084200     OPEN I-O IX-VS2.                                             IX1124.2 83
   000825         084300     MOVE SPACES TO IX-VS2-STATUS.                                IX1124.2 IMP 135
   000826         084400     MOVE 0 TO STATUS-TEST-00.                                    IX1124.2 130
   000827         084500     MOVE "RWRTE SH. 00/44 EXP." TO FEATURE.                      IX1124.2 197
   000828         084600     MOVE "RWR-TEST-GF-01-0" TO PAR-NAME.                         IX1124.2 201
   000829         084700     READ IX-VS2 AT END       GO TO RWR-TEST-GF-01-0.             IX1124.2 83 834
   000830         084800     READ IX-VS2 AT END       GO TO RWR-TEST-GF-01-0.             IX1124.2 83 834
   000831         084900     READ IX-VS2 AT END       GO TO RWR-TEST-GF-01-0.             IX1124.2 83 834
   000832         085000     READ IX-VS2 AT END       GO TO RWR-TEST-GF-01-0.             IX1124.2 83 834
   000833         085100     READ IX-VS2 AT END       GO TO RWR-TEST-GF-01-0.             IX1124.2 83 834
   000834         085200 RWR-TEST-GF-01-0.                                                IX1124.2
   000835         085300     MOVE "WRONG RECORD LENGTH ( SHORTER)" TO IX-VS2-REC-LONG.    IX1124.2 104
   000836         085400     REWRITE IX-VS2R1-F-G-200.                                    IX1124.2 99
   000837         085500 RWR-TEST-GF-01-1.                                                IX1124.2
   000838         085600     IF IX-VS2-STATUS  = "00"                                     IX1124.2 135
   000839      1  085700         GO TO RWR-PASS-GF-01-0.                                  IX1124.2 848
   000840         085800     IF IX-VS2-STATUS  = "44"                                     IX1124.2 135
   000841      1  085900         GO TO RWR-PASS-GF-01-0.                                  IX1124.2 848
   000842         086000 RWR-FAIL-GF-01-0.                                                IX1124.2
   000843         086100     MOVE "IX-5, 1.3.4, (5) d 1 & 2;  SHORT RECORD" TO RE-MARK.   IX1124.2 206
   000844         086200     PERFORM FAIL.                                                IX1124.2 521
   000845         086300     MOVE  IX-VS2-STATUS      TO COMPUTED-A.                      IX1124.2 135 212
   000846         086400     MOVE "00 OR 44" TO CORRECT-X.                                IX1124.2 225
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000847         086500     GO TO RWR-WRITE-GF-01-0.                                     IX1124.2 850
   000848         086600 RWR-PASS-GF-01-0.                                                IX1124.2
   000849         086700     PERFORM PASS.                                                IX1124.2 520
   000850         086800 RWR-WRITE-GF-01-0.                                               IX1124.2
   000851         086900     PERFORM PRINT-DETAIL.                                        IX1124.2 524
   000852         087000                                                                  IX1124.2
   000853         087100 TERMINATE-ROUTINE.                                               IX1124.2
   000854         087200     EXIT.                                                        IX1124.2
   000855         087300                                                                  IX1124.2
   000856         087400 CCVS-EXIT SECTION.                                               IX1124.2
   000857         087500 CCVS-999999.                                                     IX1124.2
   000858         087600     GO TO CLOSE-FILES.                                           IX1124.2 501
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    19
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      190   ALTERNATE-KEY1 . . . . . . . .  M679 M723
      192   ALTERNATE-KEY2
      257   ANSI-REFERENCE . . . . . . . .  452 459 468 603 610 619
       75   C-ABORT. . . . . . . . . . . .  M365 M482 M505
       69   C-ALL. . . . . . . . . . . . .  M367 M507
       65   C-DATE . . . . . . . . . . . .  M484
       71   C-DELETED. . . . . . . . . . .  M369 M509
       70   C-FAIL . . . . . . . . . . . .  M368 M508
       74   C-INDENT
       72   C-INSPECT. . . . . . . . . . .  M370 M510
       67   C-NO-OF-TESTS. . . . . . . . .  M483
       73   C-NOTE
       68   C-OK . . . . . . . . . . . . .  M366 M506
       66   C-TIME . . . . . . . . . . . .  M485
      236   CCVS-C-1 . . . . . . . . . . .  437 542 588
      241   CCVS-C-2 . . . . . . . . . . .  438 543 589
      291   CCVS-E-1 . . . . . . . . . . .  398 548
      296   CCVS-E-2 . . . . . . . . . . .  406 413 420 425 557 564 571 576
      299   CCVS-E-2-2 . . . . . . . . . .  M405 M556
      304   CCVS-E-3 . . . . . . . . . . .  426 577
      313   CCVS-E-4 . . . . . . . . . . .  405 556
      314   CCVS-E-4-1 . . . . . . . . . .  M403 M554
      316   CCVS-E-4-2 . . . . . . . . . .  M404 M555
      258   CCVS-H-1 . . . . . . . . . . .  433 537 584
      263   CCVS-H-2A. . . . . . . . . . .  434 538 585
      272   CCVS-H-2B. . . . . . . . . . .  435 539 586
      284   CCVS-H-3 . . . . . . . . . . .  436 540 587
      334   CCVS-PGM-ID. . . . . . . . . .  363 480 490 490 503 630
      177   CHARS-OR-RECORDS . . . . . . .  M632
      218   CM-18V0
      212   COMPUTED-A . . . . . . . . . .  213 215 216 217 218 M354 464 467 615 618 M658 M697 M703 M732 M755 M781 M807 M845
      213   COMPUTED-N
      211   COMPUTED-X . . . . . . . . . .  M390 449 M532 600
      215   COMPUTED-0V18
      217   COMPUTED-14V4
      219   COMPUTED-18V0
      216   COMPUTED-4V14
      235   COR-ANSI-REFERENCE . . . . . .  M459 M461 M610 M612
      226   CORRECT-A. . . . . . . . . . .  227 228 229 230 231 465 467 616 618
      227   CORRECT-N
      225   CORRECT-X. . . . . . . . . . .  M355 M391 451 M533 602 M659 M733 M756 M782 M808 M846
      228   CORRECT-0V18
      230   CORRECT-14V4
      232   CORRECT-18V0 . . . . . . . . .  M706
      229   CORRECT-4V14
      141   COUNT-OF-RECORDS
      139   COUNT-OF-RECS. . . . . . . . .  141 M638 M677 706 M721 M796
      231   CR-18V0
      249   DELETE-COUNTER . . . . . . . .  369 401 416 418 509 M522 551 567 569
      204   DOTVALUE . . . . . . . . . . .  M385 M527
      255   DUMMY-HOLD . . . . . . . . . .  M430 440 M581 591
       81   DUMMY-RECORD . . . . . . . . .  M395 M398 M406 M413 M420 M425 M426 430 M431 432 M433 M434 M435 M436 M437 M438
                                            M439 M440 444 M445 M454 M469 M537 M538 M539 M540 M542 M543 M544 M546 M548 M557
                                            M564 M571 M576 M577 581 M582 583 M584 M585 M586 M587 M588 M589 M590 M591 595
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    20
0 Defined   Cross-reference of data names   References

0                                           M596 M605 M620
      302   ENDER-DESC . . . . . . . . . .  M408 M419 M424 M559 M570 M575
      122   EOF-FLAG . . . . . . . . . . .  M798
      250   ERROR-COUNTER. . . . . . . . .  368 M381 400 409 412 508 M521 550 560 563
      126   ERROR-FLAG
      254   ERROR-HOLD . . . . . . . . . .  367 M400 M401 M401 M402 404 507 M550 M551 M551 M552 555
      300   ERROR-TOTAL. . . . . . . . . .  M410 M412 M417 M418 M422 M423 M561 M563 M568 M569 M573 M574
      197   FEATURE. . . . . . . . . . . .  M649 M674 M704 M717 M746 M771 M802 M827
      158   FILE-RECORD-INFO . . . . . . .  M498 681 724
      159   FILE-RECORD-INFO-P1-120
      186   FILE-RECORD-INFO-P121-240
      144   FILE-RECORD-INFO-SKELETON. . .  497
      143   FILE-RECORD-INFORMATION-REC
      110   GRP-0101 . . . . . . . . . . .  678 722
      112   GRP-0101-KEY . . . . . . . . .  M677 M721
      115   GRP-0102 . . . . . . . . . . .  679 723
      117   GRP-0102-KEY
      328   HYPHEN-LINE. . . . . . . . . .  395 439 544 546 590
      294   ID-AGAIN . . . . . . . . . . .  M490
      327   INF-ANSI-REFERENCE . . . . . .  M452 M455 M468 M470 M603 M606 M619 M621
      322   INFO-TEXT. . . . . . . . . . .  M453 M604
      251   INSPECT-COUNTER. . . . . . . .  370 400 421 423 510 M519 550 572 574
       83   IX-VS2 . . . . . . . . . . . .  50 342 652 749 775 800 823 824 829 830 831 832 833
       96   IX-VS2-ALTER-KEY
       94   IX-VS2-KEY . . . . . . . . . .  54
      104   IX-VS2-REC-LONG. . . . . . . .  M835
      100   IX-VS2-REC-SHORT
       91   IX-VS2-REC-120
      101   IX-VS2-REC-120-200
      105   IX-VS2-REC-120-239
       92   IX-VS2-REC-120-240
      106   IX-VS2-REC-240-280
      135   IX-VS2-STATUS. . . . . . . . .  55 347 349 354 M648 653 658 M672 683 M715 727 732 M745 750 755 M770 776 781 M795
                                            803 M825 838 840 845
      136   IX-VS2-STAT1
      137   IX-VS2-STAT2
       99   IX-VS2R1-F-G-200 . . . . . . .  836
       90   IX-VS2R1-F-G-240 . . . . . . .  M681 682 M724 725
      103   IX-VS2R1-F-G-280
      171   ODO-NUMBER
      199   P-OR-F . . . . . . . . . . . .  M380 M381 387 M390 M519 M520 M521 M522 529 M532
      201   PAR-NAME . . . . . . . . . . .  M392 M534 M650 M675 M705 M718 M747 M772 M801 M828
      203   PARDOT-X . . . . . . . . . . .  M384 M526
      252   PASS-COUNTER . . . . . . . . .  366 M380 402 403 506 M520 552 554
      128   PERM-ERRORS. . . . . . . . . .  M344 M797
       77   PRINT-FILE . . . . . . . . . .  47 375 489 514
       79   PRINT-REC. . . . . . . . . . .  M386 M458 M460 M528 M609 M611
       61   RAW-DATA . . . . . . . . . . .  41 362 364 373 479 481 488 502 504 513
       64   RAW-DATA-KEY . . . . . . . . .  45 M363 M480 M503
       63   RAW-DATA-SATZ. . . . . . . . .  371 486 511
      206   RE-MARK. . . . . . . . . . . .  M352 M393 M523 M535 M656 M693 M695 M730 M753 M779 M806 M843
      248   REC-CT . . . . . . . . . . . .  383 385 392 525 527 534
      247   REC-SKL-SUB. . . . . . . . . .  M493 M496 498
      256   RECORD-COUNT . . . . . . . . .  M428 429 M441 M579 580 M592
      124   RECORDS-IN-ERROR . . . . . . .  691
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    21
0 Defined   Cross-reference of data names   References

0     181   RECORDS-IN-FILE. . . . . . . .  M634
      165   REELUNIT-NUMBER
      133   STATUS-TEST-READ
      130   STATUS-TEST-00 . . . . . . . .  M647 M673 M684 M716 M826
      132   STATUS-TEST-10 . . . . . . . .  M794
      207   TEST-COMPUTED. . . . . . . . .  458 609
      222   TEST-CORRECT . . . . . . . . .  460 611
      275   TEST-ID. . . . . . . . . . . .  M490
      336   TEST-NUMBER. . . . . . . . . .  345 M646 M671 M714 M744 M769 M793 M822
      195   TEST-RESULTS . . . . . . . . .  386 M491 528
      253   TOTAL-ERROR
      169   UPDATE-NUMBER
      120   WRK-CS-09V00
      179   XBLOCK-SIZE. . . . . . . . . .  M633
      161   XFILE-NAME . . . . . . . . . .  M628
      183   XFILE-ORGANIZATION . . . . . .  M635
      185   XLABEL-TYPE. . . . . . . . . .  M636
      173   XPROGRAM-NAME. . . . . . . . .  M630
      188   XRECORD-KEY. . . . . . . . . .  M678 M722
      175   XRECORD-LENGTH . . . . . . . .  M631
      163   XRECORD-NAME . . . . . . . . .  M629
      167   XRECORD-NUMBER . . . . . . . .  M637 677 686 M688 M719 721
      324   XXCOMPUTED . . . . . . . . . .  M467 M618
      326   XXCORRECT. . . . . . . . . . .  M467 M618
      319   XXINFO . . . . . . . . . . . .  454 469 605 620
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    22
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

      614   BAIL-OUT . . . . . . . . . . .  P531
      622   BAIL-OUT-EX. . . . . . . . . .  E531 G616
      617   BAIL-OUT-WRITE . . . . . . . .  G615
      597   BLANK-LINE-PRINT
      856   CCVS-EXIT
      499   CCVS-INIT-EXIT
      495   CCVS-INIT-FILE . . . . . . . .  P494
      857   CCVS-999999
      477   CCVS1
      623   CCVS1-EXIT . . . . . . . . . .  G500
      752   CLO-FAIL-GF-01-0
      743   CLO-INIT-GF-01-0
      758   CLO-PASS-GF-01-0 . . . . . . .  G751
      748   CLO-TEST-GF-01-0
      760   CLO-WRITE-GF-01-0. . . . . . .  G757
      501   CLOSE-FILES. . . . . . . . . .  G858
      541   COLUMN-NAMES-ROUTINE . . . . .  E492
      463   D-BAIL-OUT . . . . . . . . . .  P389
      471   D-BAIL-OUT-EX. . . . . . . . .  E389 G465
      466   D-BAIL-OUT-WRITE . . . . . . .  G464
      446   D-BLANK-LINE-PRINT
      361   D-CLOSE-FILES
      372   D-END-E-2. . . . . . . . . . .  G364 G371
      394   D-END-ROUTINE. . . . . . . . .  P374
      399   D-END-ROUTINE-1
      407   D-END-ROUTINE-12
      415   D-END-ROUTINE-13 . . . . . . .  E374
      397   D-END-RTN-EXIT
      381   D-FAIL . . . . . . . . . . . .  P353
      448   D-FAIL-ROUTINE . . . . . . . .  P388
      462   D-FAIL-ROUTINE-EX. . . . . . .  E388 G456
      457   D-FAIL-ROUTINE-WRITE . . . . .  G450 G451
      380   D-PASS . . . . . . . . . . . .  P358
      382   D-PRINT-DETAIL . . . . . . . .  P360
      351   D-RWR-FAIL-GF-01-0
      357   D-RWR-PASS-GF-01-0 . . . . . .  G348 G350
      346   D-RWR-TEST-GF-01-1
      359   D-RWR-WRITE-GF-01-0. . . . . .  G356
      378   D-TERMINATE-CALL
      376   D-TERMINATE-CCVS
      427   D-WRITE-LINE . . . . . . . . .  P386 P387 P396 P398 P406 P414 P420 P425 P426 P454 P458 P460 P469
      443   D-WRT-LN . . . . . . . . . . .  P433 P434 P435 P436 P437 P438 P439 P442 P447
      522   DE-LETE
      473   END-DECL . . . . . . . . . . .  G345
      487   END-E-1. . . . . . . . . . . .  G481 G486
      512   END-E-2. . . . . . . . . . . .  G504 G511
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    23
0 Defined   Cross-reference of procedures   References

0     545   END-ROUTINE. . . . . . . . . .  P514
      549   END-ROUTINE-1
      558   END-ROUTINE-12
      566   END-ROUTINE-13 . . . . . . . .  E514
      547   END-RTN-EXIT
      521   FAIL . . . . . . . . . . . . .  P657 P696 P731 P754 P780 P809 P844
      599   FAIL-ROUTINE . . . . . . . . .  P530
      613   FAIL-ROUTINE-EX. . . . . . . .  E530 G607
      608   FAIL-ROUTINE-WRITE . . . . . .  G601 G602
      536   HEAD-ROUTINE . . . . . . . . .  P492
      343   INPUT-PROCESS
      519   INSPT
      478   OPEN-FILES
      655   OPN-FAIL-GF-01-0
      778   OPN-FAIL-GF-02-0
      645   OPN-INIT-GF-01-0
      768   OPN-INIT-GF-02-0
      661   OPN-PASS-GF-01-0 . . . . . . .  G654
      784   OPN-PASS-GF-02-0 . . . . . . .  G777
      773   OPN-TEST-GF-02-0
      663   OPN-WRITE-GF-01-0. . . . . . .  G660
      786   OPN-WRITE-GF-02-0. . . . . . .  G783
      520   PASS . . . . . . . . . . . . .  P662 P700 P736 P759 P785 P812 P849
      524   PRINT-DETAIL . . . . . . . . .  P664 P702 P707 P738 P761 P787 P814 P851
      805   REA-FAIL-F1-01-0
      792   REA-INIT-F1-01-0
      811   REA-PASS-F1-01-0 . . . . . . .  G804
      799   REA-TEST-F1-01-0
      813   REA-WRITE-F1-01-0. . . . . . .  G810
      842   RWR-FAIL-GF-01-0
      821   RWR-INIT-GF-01-0
      848   RWR-PASS-GF-01-0 . . . . . . .  G839 G841
      834   RWR-TEST-GF-01-0 . . . . . . .  G829 G830 G831 G832 G833
      837   RWR-TEST-GF-01-1
      850   RWR-WRITE-GF-01-0. . . . . . .  G847
      341   SECT-IX105-0002
      626   SECT-IX112A-0003
      627   SEQ-INIT-010
      517   TERMINATE-CALL
      515   TERMINATE-CCVS
      853   TERMINATE-ROUTINE
      694   WRI-FAIL-GF-01-0 . . . . . . .  G685
      729   WRI-FAIL-GF-02-0
      670   WRI-INIT-GF-01-0
      713   WRI-INIT-GF-02-0
      699   WRI-PASS-GF-01-0 . . . . . . .  G692
      735   WRI-PASS-GF-02-0 . . . . . . .  G728
      676   WRI-TEST-GF-01-0 . . . . . . .  G689
      690   WRI-TEST-GF-01-1 . . . . . . .  G687
      720   WRI-TEST-GF-02-0
      726   WRI-TEST-GF-02-1 . . . . . . .  G725
      701   WRI-WRITE-GF-01-0. . . . . . .  G698
      737   WRI-WRITE-GF-02-0. . . . . . .  G734
      578   WRITE-LINE . . . . . . . . . .  P528 P529 P537 P538 P539 P540 P542 P543 P544 P546 P548 P557 P565 P571 P576 P577
                                            P605 P609 P611 P620
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    24
0 Defined   Cross-reference of procedures   References

0     594   WRT-LN . . . . . . . . . . . .  P584 P585 P586 P587 P588 P589 P590 P593 P598
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    25
0 Defined   Cross-reference of programs     References

        3   IX112A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX112A    Date 06/04/2022  Time 11:59:11   Page    26
0LineID  Message code  Message text

     77  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     83  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     83  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX112A:
 *    Source records = 858
 *    Data Division statements = 127
 *    Procedure Division statements = 456
 *    Generated COBOL statements = 0
 *    Program complexity factor = 465
0End of compilation 1,  program IX112A,  highest severity 0.
0Return code 0
