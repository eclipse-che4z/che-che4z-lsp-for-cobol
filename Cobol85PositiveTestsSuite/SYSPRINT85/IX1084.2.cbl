1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:36   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:36   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1084.2
   000002         000200 PROGRAM-ID.                                                      IX1084.2
   000003         000300     IX108A.                                                      IX1084.2
   000004         000500*                                                              *  IX1084.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1084.2
   000006         000700*                                                              *  IX1084.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1084.2
   000008         000900*                                                              *  IX1084.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1084.2
   000010         001100*                                                              *  IX1084.2
   000011         001300*                                                                 IX1084.2
   000012         001400*         NEW TESTS:                                              IX1084.2
   000013         001500*                                                                 IX1084.2
   000014         001600*         READ STATEMENT WITH THE PHRASES:                        IX1084.2
   000015         001700*         READ ...  NOT AT END   AND   END-READ                   IX1084.2
   000016         001800*         FOR FORMAT 1 AND 2 OF THE READ STATEMENT                IX1084.2
   000017         001900*                                                                 IX1084.2
   000018         002000*         DELETE STATEMENT WITH THE PHRASES:                      IX1084.2
   000019         002100*         DELETE ... NOT INVALID  AND  END-DELETE                 IX1084.2
   000020         002200*                                                                 IX1084.2
   000021         002300*         REWRITE STATEMENT WITH THE PHRASES:                     IX1084.2
   000022         002400*         REWRITE  ...   NOT INVALID KEY   AND   END-REWRITE      IX1084.2
   000023         002500*                                                                 IX1084.2
   000024         002600*         WRITE STATEMENT WITH THE PHRASES:                       IX1084.2
   000025         002700*         WRITE  ...   NOT INVALID KEY   AND  END-WRITE           IX1084.2
   000026         002800*                                                                 IX1084.2
   000027         002900*                                                                 IX1084.2
   000028         003000*                                                                 IX1084.2
   000029         003100*                                                                 IX1084.2
   000030         003200*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX1084.2
   000031         003300*                                                                 IX1084.2
   000032         003400*             X-24   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX1084.2
   000033         003500*                    CLAUSE FOR DATA FILE IX-FD1                  IX1084.2
   000034         003600*             X-44   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX1084.2
   000035         003700*                    CLAUSE FOR INDEX FILE IX-FD1                 IX1084.2
   000036         003800*             X-25   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX1084.2
   000037         003900*                    CLAUSE FOR DATA FILE IX-FD2                  IX1084.2
   000038         004000*             X-45   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX1084.2
   000039         004100*                    CLAUSE FOR INDEX FILE IX-FD2                 IX1084.2
   000040         004200*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX1084.2
   000041         004300*             X-62   FOR RAW-DATA                                 IX1084.2
   000042         004400*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX1084.2
   000043         004500*             X-84   LABEL RECORDS OF PRINT-FILE                  IX1084.2
   000044         004600*                                                                 IX1084.2
   000045         004700*         NOTE:  X-CARDS 45, 62 AND 84   ARE OPTIONAL             IX1084.2
   000046         004800*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX1084.2
   000047         004900*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX1084.2
   000048         005000*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX1084.2
   000049         005100*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX1084.2
   000050         005200*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX1084.2
   000051         005300*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX1084.2
   000052         005400*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX1084.2
   000053         005500*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX1084.2
   000054         005600*               THEY ARE AS FOLLOWS                               IX1084.2
   000055         005700*                                                                 IX1084.2
   000056         005800*                  J  SELECTS X-CARD 45                           IX1084.2
   000057         005900*                                                                 IX1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100 ENVIRONMENT DIVISION.                                            IX1084.2
   000059         006200 CONFIGURATION SECTION.                                           IX1084.2
   000060         006300 SOURCE-COMPUTER.                                                 IX1084.2
   000061         006400     XXXXX082.                                                    IX1084.2
   000062         006500 OBJECT-COMPUTER.                                                 IX1084.2
   000063         006600     XXXXX083.                                                    IX1084.2
   000064         006700 INPUT-OUTPUT SECTION.                                            IX1084.2
   000065         006800 FILE-CONTROL.                                                    IX1084.2
   000066         006900     SELECT RAW-DATA   ASSIGN TO                                  IX1084.2 90
   000067         007000     XXXXX062                                                     IX1084.2
   000068         007100            ORGANIZATION IS INDEXED                               IX1084.2
   000069         007200            ACCESS MODE IS RANDOM                                 IX1084.2
   000070         007300            RECORD KEY IS RAW-DATA-KEY.                           IX1084.2 93
   000071         007400     SELECT PRINT-FILE ASSIGN TO                                  IX1084.2 105
   000072         007500     XXXXX055.                                                    IX1084.2
   000073         007600     SELECT   IX-FS1 ASSIGN                                       IX1084.2 108
   000074         007700     XXXXX024                                                     IX1084.2
   000075         007800     XXXXX044                                                     IX1084.2

 ==000075==> IGYDS1298-I Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX044" was treated as comments.

   000076         007900             ORGANIZATION IS INDEXED                              IX1084.2
   000077         008000        ACCESS SEQUENTIAL                                         IX1084.2
   000078         008100        FILE STATUS IS IX-FS1-STATUS                              IX1084.2 149
   000079         008200        RECORD  IX-FS1-KEY.                                       IX1084.2 117
   000080         008300     SELECT   IX-FS2 ASSIGN                                       IX1084.2 120
   000081         008400     XXXXX025                                                     IX1084.2
   000082         008500     XXXXX045                                                     IX1084.2

 ==000082==> IGYDS1298-I Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX045" was treated as comments.

   000083         008600             ORGANIZATION IS INDEXED                              IX1084.2
   000084         008700        ACCESS RANDOM                                             IX1084.2
   000085         008800        FILE STATUS IS IX-FS2-STATUS                              IX1084.2 150
   000086         008900        RECORD  IX-FS2-KEY.                                       IX1084.2 129
   000087         009000 DATA DIVISION.                                                   IX1084.2
   000088         009100 FILE SECTION.                                                    IX1084.2
   000089         009200                                                                  IX1084.2
   000090         009300 FD  RAW-DATA.                                                    IX1084.2
   000091         009400                                                                  IX1084.2
   000092         009500 01  RAW-DATA-SATZ.                                               IX1084.2
   000093         009600     05  RAW-DATA-KEY        PIC X(6).                            IX1084.2
   000094         009700     05  C-DATE              PIC 9(6).                            IX1084.2
   000095         009800     05  C-TIME              PIC 9(8).                            IX1084.2
   000096         009900     05  C-NO-OF-TESTS       PIC 99.                              IX1084.2
   000097         010000     05  C-OK                PIC 999.                             IX1084.2
   000098         010100     05  C-ALL               PIC 999.                             IX1084.2
   000099         010200     05  C-FAIL              PIC 999.                             IX1084.2
   000100         010300     05  C-DELETED           PIC 999.                             IX1084.2
   000101         010400     05  C-INSPECT           PIC 999.                             IX1084.2
   000102         010500     05  C-NOTE              PIC X(13).                           IX1084.2
   000103         010600     05  C-INDENT            PIC X.                               IX1084.2
   000104         010700     05  C-ABORT             PIC X(8).                            IX1084.2
   000105         010800 FD  PRINT-FILE.                                                  IX1084.2

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0==000105==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000106         010900 01  PRINT-REC PICTURE X(120).                                    IX1084.2
   000107         011000 01  DUMMY-RECORD PICTURE X(120).                                 IX1084.2
   000108         011100 FD  IX-FS1                                                       IX1084.2

 ==000108==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000108==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000109         011200     LABEL RECORDS ARE STANDARD                                   IX1084.2
   000110         011300     DATA RECORDS IX-FS1R1-F-G-240                                IX1084.2 *
   000111         011400     BLOCK CONTAINS 480.                                          IX1084.2
   000112         011500                                                                  IX1084.2
   000113         011600 01  IX-FS1R1-F-G-240.                                            IX1084.2
   000114         011700     05 IX-FS1-REC-120    PIC X(120).                             IX1084.2
   000115         011800     05 IX-FS1-REC-120-240.                                       IX1084.2
   000116         011900     10  FILLER PICTURE X(8).                                     IX1084.2
   000117         012000     10  IX-FS1-KEY PIC X(29).                                    IX1084.2
   000118         012100     10  FILLER PIC X(83).                                        IX1084.2
   000119         012200                                                                  IX1084.2
   000120         012300 FD  IX-FS2                                                       IX1084.2

 ==000120==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000120==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000121         012400     LABEL RECORDS ARE STANDARD                                   IX1084.2
   000122         012500     DATA RECORDS IX-FS2R1-F-G-240                                IX1084.2 *
   000123         012600     BLOCK CONTAINS 480.                                          IX1084.2
   000124         012700                                                                  IX1084.2
   000125         012800 01  IX-FS2R1-F-G-240.                                            IX1084.2
   000126         012900     05 IX-FS2-REC-120    PIC X(120).                             IX1084.2
   000127         013000     05 IX-FS2-REC-120-240.                                       IX1084.2
   000128         013100     10  FILLER PICTURE X(8).                                     IX1084.2
   000129         013200     10  IX-FS2-KEY PIC X(29).                                    IX1084.2
   000130         013300     10  FILLER PIC X(83).                                        IX1084.2
   000131         013400 WORKING-STORAGE SECTION.                                         IX1084.2
   000132         013500 01  SWITCHES-FOR-TEST.                                           IX1084.2
   000133         013600     05  SWITCH-NOT-INVALID    PIC 9 VALUE ZERO.                  IX1084.2 IMP
   000134         013700     05  SWITCH-END-XXX        PIC 9 VALUE ZERO.                  IX1084.2 IMP
   000135         013800     05  SWITCH-END-X9X        PIC 9 VALUE ZERO.                  IX1084.2 IMP
   000136         013900     05  SWITCH-IF             PIC 9 VALUE ZERO.                  IX1084.2 IMP
   000137         014000 01  GRP-0101.                                                    IX1084.2
   000138         014100     02 FILLER PIC X(10) VALUE "ABCD921XYZ".                      IX1084.2
   000139         014200     02  WRK-DU-09V00-001 PIC 9(9) VALUE ZERO.                    IX1084.2 IMP
   000140         014300     02 FILLER PIC X(10) VALUE "Z2F()$+-AB".                      IX1084.2
   000141         014400 01  GRP-0001.                                                    IX1084.2
   000142         014500     05 WRK-CS-09V00-012  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1084.2 IMP
   000143         014600     05 WRK-CS-09V00-013  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1084.2 IMP
   000144         014700     05 WRK-CS-09V00-014  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1084.2 IMP
   000145         014800     05 WRK-CS-09V00-015  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1084.2 IMP
   000146         014900     05 WRK-CS-09V00-016  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1084.2 IMP
   000147         015000     05 WRK-CS-09V00-017  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1084.2 IMP
   000148         015100     05 WRK-CS-09V00-018  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1084.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000149         015200     05 IX-FS1-STATUS     PIC  XX  VALUE  SPACE.                  IX1084.2 IMP
   000150         015300     05 IX-FS2-STATUS     PIC  XX  VALUE  SPACE.                  IX1084.2 IMP
   000151         015400     05 WRK-XN-0002-001   PIC  X(2) VALUE  SPACE.                 IX1084.2 IMP
   000152         015500     05 WRK-XN-0002-002   PIC  X(2) VALUE  SPACE.                 IX1084.2 IMP
   000153         015600     05 WRK-XN-0002-003   PIC  X(2) VALUE  SPACE.                 IX1084.2 IMP
   000154         015700     05 WRK-XN-0002-004   PIC  X(2) VALUE  SPACE.                 IX1084.2 IMP
   000155         015800     05 WRK-XN-0002-005   PIC  X(2) VALUE  SPACE.                 IX1084.2 IMP
   000156         015900     05 WRK-XN-0002-006   PIC  X(2) VALUE  SPACE.                 IX1084.2 IMP
   000157         016000     05 WRK-XN-0002-007   PIC  X(2) VALUE  SPACE.                 IX1084.2 IMP
   000158         016100     05 WRK-XN-0002-008   PIC  X(2) VALUE  SPACE.                 IX1084.2 IMP
   000159         016200     05 WRK-XN-0002-009   PIC  X(2) VALUE  SPACE.                 IX1084.2 IMP
   000160         016300 01  DUMMY-WRK-REC.                                               IX1084.2
   000161         016400     02 DUMMY-WRK1       PIC X(120).                              IX1084.2
   000162         016500     02 DUMMY-WRK2  REDEFINES  DUMMY-WRK1.                        IX1084.2 161
   000163         016600        03 FILLER   PIC X(5).                                     IX1084.2
   000164         016700        03 DUMMY-WRK-INDENT-5  PIC X(115).                        IX1084.2
   000165         016800 01  FILE-RECORD-INFORMATION-REC.                                 IX1084.2
   000166         016900     03 FILE-RECORD-INFO-SKELETON.                                IX1084.2
   000167         017000        05 FILLER                 PICTURE X(48)       VALUE       IX1084.2
   000168         017100             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX1084.2
   000169         017200        05 FILLER                 PICTURE X(46)       VALUE       IX1084.2
   000170         017300             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX1084.2
   000171         017400        05 FILLER                 PICTURE X(26)       VALUE       IX1084.2
   000172         017500             ",LFIL=000000,ORG=  ,LBLR= ".                        IX1084.2
   000173         017600        05 FILLER                 PICTURE X(37)       VALUE       IX1084.2
   000174         017700             ",RECKEY=                             ".             IX1084.2
   000175         017800        05 FILLER                 PICTURE X(38)       VALUE       IX1084.2
   000176         017900             ",ALTKEY1=                             ".            IX1084.2
   000177         018000        05 FILLER                 PICTURE X(38)       VALUE       IX1084.2
   000178         018100             ",ALTKEY2=                             ".            IX1084.2
   000179         018200        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX1084.2 IMP
   000180         018300     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX1084.2
   000181         018400        05 FILE-RECORD-INFO-P1-120.                               IX1084.2
   000182         018500           07 FILLER              PIC X(5).                       IX1084.2
   000183         018600           07 XFILE-NAME           PIC X(6).                      IX1084.2
   000184         018700           07 FILLER              PIC X(8).                       IX1084.2
   000185         018800           07 XRECORD-NAME         PIC X(6).                      IX1084.2
   000186         018900           07 FILLER              PIC X(1).                       IX1084.2
   000187         019000           07 REELUNIT-NUMBER     PIC 9(1).                       IX1084.2
   000188         019100           07 FILLER              PIC X(7).                       IX1084.2
   000189         019200           07 XRECORD-NUMBER       PIC 9(6).                      IX1084.2
   000190         019300           07 FILLER              PIC X(6).                       IX1084.2
   000191         019400           07 UPDATE-NUMBER       PIC 9(2).                       IX1084.2
   000192         019500           07 FILLER              PIC X(5).                       IX1084.2
   000193         019600           07 ODO-NUMBER          PIC 9(4).                       IX1084.2
   000194         019700           07 FILLER              PIC X(5).                       IX1084.2
   000195         019800           07 XPROGRAM-NAME        PIC X(5).                      IX1084.2
   000196         019900           07 FILLER              PIC X(7).                       IX1084.2
   000197         020000           07 XRECORD-LENGTH       PIC 9(6).                      IX1084.2
   000198         020100           07 FILLER              PIC X(7).                       IX1084.2
   000199         020200           07 CHARS-OR-RECORDS    PIC X(2).                       IX1084.2
   000200         020300           07 FILLER              PIC X(1).                       IX1084.2
   000201         020400           07 XBLOCK-SIZE          PIC 9(4).                      IX1084.2
   000202         020500           07 FILLER              PIC X(6).                       IX1084.2
   000203         020600           07 RECORDS-IN-FILE     PIC 9(6).                       IX1084.2
   000204         020700           07 FILLER              PIC X(5).                       IX1084.2
   000205         020800           07 XFILE-ORGANIZATION   PIC X(2).                      IX1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000206         020900           07 FILLER              PIC X(6).                       IX1084.2
   000207         021000           07 XLABEL-TYPE          PIC X(1).                      IX1084.2
   000208         021100        05 FILE-RECORD-INFO-P121-240.                             IX1084.2
   000209         021200           07 FILLER              PIC X(8).                       IX1084.2
   000210         021300           07 XRECORD-KEY          PIC X(29).                     IX1084.2
   000211         021400           07 FILLER              PIC X(9).                       IX1084.2
   000212         021500           07 ALTERNATE-KEY1      PIC X(29).                      IX1084.2
   000213         021600           07 FILLER              PIC X(9).                       IX1084.2
   000214         021700           07 ALTERNATE-KEY2      PIC X(29).                      IX1084.2
   000215         021800           07 FILLER              PIC X(7).                       IX1084.2
   000216         021900 01  TEST-RESULTS.                                                IX1084.2
   000217         022000     02 FILLER                   PIC X      VALUE SPACE.          IX1084.2 IMP
   000218         022100     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1084.2 IMP
   000219         022200     02 FILLER                   PIC X      VALUE SPACE.          IX1084.2 IMP
   000220         022300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1084.2 IMP
   000221         022400     02 FILLER                   PIC X      VALUE SPACE.          IX1084.2 IMP
   000222         022500     02  PAR-NAME.                                                IX1084.2
   000223         022600       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1084.2 IMP
   000224         022700       03  PARDOT-X              PIC X      VALUE SPACE.          IX1084.2 IMP
   000225         022800       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1084.2 IMP
   000226         022900     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1084.2 IMP
   000227         023000     02 RE-MARK                  PIC X(61).                       IX1084.2
   000228         023100 01  TEST-COMPUTED.                                               IX1084.2
   000229         023200     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1084.2 IMP
   000230         023300     02 FILLER                   PIC X(17)  VALUE                 IX1084.2
   000231         023400            "       COMPUTED=".                                   IX1084.2
   000232         023500     02 COMPUTED-X.                                               IX1084.2
   000233         023600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1084.2 IMP
   000234         023700     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1084.2 233
   000235         023800                                 PIC -9(9).9(9).                  IX1084.2
   000236         023900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1084.2 233
   000237         024000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1084.2 233
   000238         024100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1084.2 233
   000239         024200     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1084.2 233
   000240         024300         04 COMPUTED-18V0                    PIC -9(18).          IX1084.2
   000241         024400         04 FILLER                           PIC X.               IX1084.2
   000242         024500     03 FILLER PIC X(50) VALUE SPACE.                             IX1084.2 IMP
   000243         024600 01  TEST-CORRECT.                                                IX1084.2
   000244         024700     02 FILLER PIC X(30) VALUE SPACE.                             IX1084.2 IMP
   000245         024800     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1084.2
   000246         024900     02 CORRECT-X.                                                IX1084.2
   000247         025000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1084.2 IMP
   000248         025100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1084.2 247
   000249         025200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1084.2 247
   000250         025300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1084.2 247
   000251         025400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1084.2 247
   000252         025500     03      CR-18V0 REDEFINES CORRECT-A.                         IX1084.2 247
   000253         025600         04 CORRECT-18V0                     PIC -9(18).          IX1084.2
   000254         025700         04 FILLER                           PIC X.               IX1084.2
   000255         025800     03 FILLER PIC X(2) VALUE SPACE.                              IX1084.2 IMP
   000256         025900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1084.2 IMP
   000257         026000 01  CCVS-C-1.                                                    IX1084.2
   000258         026100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1084.2
   000259         026200-    "SS  PARAGRAPH-NAME                                          IX1084.2
   000260         026300-    "       REMARKS".                                            IX1084.2
   000261         026400     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1084.2 IMP
   000262         026500 01  CCVS-C-2.                                                    IX1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000263         026600     02 FILLER                     PIC X        VALUE SPACE.      IX1084.2 IMP
   000264         026700     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1084.2
   000265         026800     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1084.2 IMP
   000266         026900     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1084.2
   000267         027000     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1084.2 IMP
   000268         027100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1084.2 IMP
   000269         027200 01  REC-CT                        PIC 99       VALUE ZERO.       IX1084.2 IMP
   000270         027300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1084.2 IMP
   000271         027400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1084.2 IMP
   000272         027500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1084.2 IMP
   000273         027600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1084.2 IMP
   000274         027700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1084.2 IMP
   000275         027800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1084.2 IMP
   000276         027900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1084.2 IMP
   000277         028000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1084.2 IMP
   000278         028100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1084.2 IMP
   000279         028200 01  CCVS-H-1.                                                    IX1084.2
   000280         028300     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1084.2 IMP
   000281         028400     02  FILLER                    PIC X(42)    VALUE             IX1084.2
   000282         028500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1084.2
   000283         028600     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1084.2 IMP
   000284         028700 01  CCVS-H-2A.                                                   IX1084.2
   000285         028800   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1084.2 IMP
   000286         028900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1084.2
   000287         029000   02  FILLER                        PIC XXXX   VALUE             IX1084.2
   000288         029100     "4.2 ".                                                      IX1084.2
   000289         029200   02  FILLER                        PIC X(28)  VALUE             IX1084.2
   000290         029300            " COPY - NOT FOR DISTRIBUTION".                       IX1084.2
   000291         029400   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1084.2 IMP
   000292         029500                                                                  IX1084.2
   000293         029600 01  CCVS-H-2B.                                                   IX1084.2
   000294         029700   02  FILLER                        PIC X(15)  VALUE             IX1084.2
   000295         029800            "TEST RESULT OF ".                                    IX1084.2
   000296         029900   02  TEST-ID                       PIC X(9).                    IX1084.2
   000297         030000   02  FILLER                        PIC X(4)   VALUE             IX1084.2
   000298         030100            " IN ".                                               IX1084.2
   000299         030200   02  FILLER                        PIC X(12)  VALUE             IX1084.2
   000300         030300     " HIGH       ".                                              IX1084.2
   000301         030400   02  FILLER                        PIC X(22)  VALUE             IX1084.2
   000302         030500            " LEVEL VALIDATION FOR ".                             IX1084.2
   000303         030600   02  FILLER                        PIC X(58)  VALUE             IX1084.2
   000304         030700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1084.2
   000305         030800 01  CCVS-H-3.                                                    IX1084.2
   000306         030900     02  FILLER                      PIC X(34)  VALUE             IX1084.2
   000307         031000            " FOR OFFICIAL USE ONLY    ".                         IX1084.2
   000308         031100     02  FILLER                      PIC X(58)  VALUE             IX1084.2
   000309         031200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1084.2
   000310         031300     02  FILLER                      PIC X(28)  VALUE             IX1084.2
   000311         031400            "  COPYRIGHT   1985 ".                                IX1084.2
   000312         031500 01  CCVS-E-1.                                                    IX1084.2
   000313         031600     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1084.2 IMP
   000314         031700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1084.2
   000315         031800     02 ID-AGAIN                     PIC X(9).                    IX1084.2
   000316         031900     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1084.2 IMP
   000317         032000 01  CCVS-E-2.                                                    IX1084.2
   000318         032100     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1084.2 IMP
   000319         032200     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1084.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000320         032300     02 CCVS-E-2-2.                                               IX1084.2
   000321         032400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1084.2 IMP
   000322         032500         03 FILLER                   PIC X      VALUE SPACE.      IX1084.2 IMP
   000323         032600         03 ENDER-DESC               PIC X(44)  VALUE             IX1084.2
   000324         032700            "ERRORS ENCOUNTERED".                                 IX1084.2
   000325         032800 01  CCVS-E-3.                                                    IX1084.2
   000326         032900     02  FILLER                      PIC X(22)  VALUE             IX1084.2
   000327         033000            " FOR OFFICIAL USE ONLY".                             IX1084.2
   000328         033100     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1084.2 IMP
   000329         033200     02  FILLER                      PIC X(58)  VALUE             IX1084.2
   000330         033300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1084.2
   000331         033400     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1084.2 IMP
   000332         033500     02 FILLER                       PIC X(15)  VALUE             IX1084.2
   000333         033600             " COPYRIGHT 1985".                                   IX1084.2
   000334         033700 01  CCVS-E-4.                                                    IX1084.2
   000335         033800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1084.2 IMP
   000336         033900     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1084.2
   000337         034000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1084.2 IMP
   000338         034100     02 FILLER                       PIC X(40)  VALUE             IX1084.2
   000339         034200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1084.2
   000340         034300 01  XXINFO.                                                      IX1084.2
   000341         034400     02 FILLER                       PIC X(19)  VALUE             IX1084.2
   000342         034500            "*** INFORMATION ***".                                IX1084.2
   000343         034600     02 INFO-TEXT.                                                IX1084.2
   000344         034700       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1084.2 IMP
   000345         034800       04 XXCOMPUTED                 PIC X(20).                   IX1084.2
   000346         034900       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1084.2 IMP
   000347         035000       04 XXCORRECT                  PIC X(20).                   IX1084.2
   000348         035100     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1084.2
   000349         035200 01  HYPHEN-LINE.                                                 IX1084.2
   000350         035300     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1084.2 IMP
   000351         035400     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1084.2
   000352         035500-    "*****************************************".                 IX1084.2
   000353         035600     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1084.2
   000354         035700-    "******************************".                            IX1084.2
   000355         035800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1084.2
   000356         035900     "IX108A".                                                    IX1084.2
   000357         036000 PROCEDURE DIVISION.                                              IX1084.2
   000358         036100 DECLARATIVES.                                                    IX1084.2
   000359         036200 IX-FS2-01 SECTION.                                               IX1084.2
   000360         036300     USE    AFTER STANDARD ERROR PROCEDURE ON IX-FS2.             IX1084.2 120
   000361         036400 IX-FS2-01-01.                                                    IX1084.2
   000362         036500     ADD      1 TO  WRK-CS-09V00-013.                             IX1084.2 143
   000363         036600     GO TO    IX-FS2-01-03                                        IX1084.2 367
   000364         036700              IX-FS2-01-05                                        IX1084.2 371
   000365         036800              DEPENDING ON  WRK-CS-09V00-012.                     IX1084.2 142
   000366         036900     GO TO    IX-FS2-01-EXIT.                                     IX1084.2 376
   000367         037000 IX-FS2-01-03.                                                    IX1084.2
   000368         037100*ENTRY FROM SEGMENT INX-TEST-001.                                 IX1084.2
   000369         037200*    SHOULD NOT ENTER HERE UNLESS SPACE ALLOCATION TOO SMALL.     IX1084.2
   000370         037300     ADD     1 TO  WRK-CS-09V00-014.                              IX1084.2 144
   000371         037400 IX-FS2-01-05.                                                    IX1084.2
   000372         037500     ADD      1 TO WRK-CS-09V00-017.                              IX1084.2 147
   000373         037600     IF       XRECORD-NUMBER (2) EQUAL TO 500                     IX1084.2 189
   000374      1  037700              MOVE   IX-FS2-STATUS TO WRK-XN-0002-002             IX1084.2 150 152
   000375      1  037800              MOVE  "10" TO WRK-XN-0002-003.                      IX1084.2 153
   000376         037900 IX-FS2-01-EXIT.                                                  IX1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000377         038000     EXIT.                                                        IX1084.2
   000378         038100 END DECLARATIVES.                                                IX1084.2
   000379         038200 CCVS1 SECTION.                                                   IX1084.2
   000380         038300 OPEN-FILES.                                                      IX1084.2
   000381         038400     OPEN I-O RAW-DATA.                                           IX1084.2 90
   000382         038500     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1084.2 355 93
   000383         038600     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1084.2 90 389
   000384         038700     MOVE "ABORTED " TO C-ABORT.                                  IX1084.2 104
   000385         038800     ADD 1 TO C-NO-OF-TESTS.                                      IX1084.2 96
   000386         038900     ACCEPT C-DATE  FROM DATE.                                    IX1084.2 94
   000387         039000     ACCEPT C-TIME  FROM TIME.                                    IX1084.2 95
   000388         039100     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1084.2 92 389
   000389         039200 END-E-1.                                                         IX1084.2
   000390         039300     CLOSE RAW-DATA.                                              IX1084.2 90
   000391         039400     OPEN    OUTPUT PRINT-FILE.                                   IX1084.2 105
   000392         039500     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1084.2 355 296 355 315
   000393         039600     MOVE    SPACE TO TEST-RESULTS.                               IX1084.2 IMP 216
   000394         039700     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1084.2 438 443
   000395         039800     MOVE    ZERO TO REC-SKL-SUB.                                 IX1084.2 IMP 268
   000396         039900     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1084.2 397
   000397         040000 CCVS-INIT-FILE.                                                  IX1084.2
   000398         040100     ADD     1 TO REC-SKL-SUB.                                    IX1084.2 268
   000399         040200     MOVE    FILE-RECORD-INFO-SKELETON                            IX1084.2 166
   000400         040300          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1084.2 180 268
   000401         040400 CCVS-INIT-EXIT.                                                  IX1084.2
   000402         040500     GO TO CCVS1-EXIT.                                            IX1084.2 525
   000403         040600 CLOSE-FILES.                                                     IX1084.2
   000404         040700     OPEN I-O RAW-DATA.                                           IX1084.2 90
   000405         040800     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1084.2 355 93
   000406         040900     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1084.2 90 414
   000407         041000     MOVE "OK.     " TO C-ABORT.                                  IX1084.2 104
   000408         041100     MOVE PASS-COUNTER TO C-OK.                                   IX1084.2 273 97
   000409         041200     MOVE ERROR-HOLD   TO C-ALL.                                  IX1084.2 275 98
   000410         041300     MOVE ERROR-COUNTER TO C-FAIL.                                IX1084.2 271 99
   000411         041400     MOVE DELETE-COUNTER TO C-DELETED.                            IX1084.2 270 100
   000412         041500     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1084.2 272 101
   000413         041600     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1084.2 92 414
   000414         041700 END-E-2.                                                         IX1084.2
   000415         041800     CLOSE RAW-DATA.                                              IX1084.2 90
   000416         041900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1084.2 447 468 105
   000417         042000 TERMINATE-CCVS.                                                  IX1084.2
   000418         042100     EXIT PROGRAM.                                                IX1084.2
   000419         042200 TERMINATE-CALL.                                                  IX1084.2
   000420         042300     STOP     RUN.                                                IX1084.2
   000421         042400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1084.2 220 272
   000422         042500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1084.2 220 273
   000423         042600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1084.2 220 271
   000424         042700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1084.2 220 270
   000425         042800     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1084.2 227
   000426         042900 PRINT-DETAIL.                                                    IX1084.2
   000427         043000     IF REC-CT NOT EQUAL TO ZERO                                  IX1084.2 269 IMP
   000428      1  043100             MOVE "." TO PARDOT-X                                 IX1084.2 224
   000429      1  043200             MOVE REC-CT TO DOTVALUE.                             IX1084.2 269 225
   000430         043300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1084.2 216 106 480
   000431         043400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1084.2 220 480
   000432      1  043500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1084.2 501 515
   000433      1  043600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1084.2 516 524
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000434         043700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1084.2 IMP 220 IMP 232
   000435         043800     MOVE SPACE TO CORRECT-X.                                     IX1084.2 IMP 246
   000436         043900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1084.2 269 IMP IMP 222
   000437         044000     MOVE     SPACE TO RE-MARK.                                   IX1084.2 IMP 227
   000438         044100 HEAD-ROUTINE.                                                    IX1084.2
   000439         044200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1084.2 279 107 480
   000440         044300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1084.2 284 107 480
   000441         044400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1084.2 293 107 480
   000442         044500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1084.2 305 107 480
   000443         044600 COLUMN-NAMES-ROUTINE.                                            IX1084.2
   000444         044700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1084.2 257 107 480
   000445         044800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1084.2 262 107 480
   000446         044900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1084.2 349 107 480
   000447         045000 END-ROUTINE.                                                     IX1084.2
   000448         045100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1084.2 349 107 480
   000449         045200 END-RTN-EXIT.                                                    IX1084.2
   000450         045300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1084.2 312 107 480
   000451         045400 END-ROUTINE-1.                                                   IX1084.2
   000452         045500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1084.2 271 275 272
   000453         045600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1084.2 275 270 275
   000454         045700      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1084.2 273 275
   000455         045800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1084.2
   000456         045900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1084.2 273 335
   000457         046000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1084.2 275 337
   000458         046100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1084.2 334 320
   000459         046200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1084.2 317 107 480
   000460         046300  END-ROUTINE-12.                                                 IX1084.2
   000461         046400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1084.2 323
   000462         046500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1084.2 271 IMP
   000463      1  046600         MOVE "NO " TO ERROR-TOTAL                                IX1084.2 321
   000464         046700         ELSE                                                     IX1084.2
   000465      1  046800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1084.2 271 321
   000466         046900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1084.2 317 107
   000467         047000     PERFORM WRITE-LINE.                                          IX1084.2 480
   000468         047100 END-ROUTINE-13.                                                  IX1084.2
   000469         047200     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1084.2 270 IMP
   000470      1  047300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1084.2 321
   000471      1  047400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1084.2 270 321
   000472         047500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1084.2 323
   000473         047600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1084.2 317 107 480
   000474         047700      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1084.2 272 IMP
   000475      1  047800          MOVE "NO " TO ERROR-TOTAL                               IX1084.2 321
   000476      1  047900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1084.2 272 321
   000477         048000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1084.2 323
   000478         048100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1084.2 317 107 480
   000479         048200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1084.2 325 107 480
   000480         048300 WRITE-LINE.                                                      IX1084.2
   000481         048400     ADD 1 TO RECORD-COUNT.                                       IX1084.2 277
   000482         048500     IF RECORD-COUNT GREATER 42                                   IX1084.2 277
   000483      1  048600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1084.2 107 276
   000484      1  048700         MOVE SPACE TO DUMMY-RECORD                               IX1084.2 IMP 107
   000485      1  048800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1084.2 107
   000486      1  048900         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1084.2 279 107 496
   000487      1  049000         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1084.2 284 107 496
   000488      1  049100         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1084.2 293 107 496
   000489      1  049200         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1084.2 305 107 496
   000490      1  049300         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1084.2 257 107 496
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000491      1  049400         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1084.2 262 107 496
   000492      1  049500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1084.2 349 107 496
   000493      1  049600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1084.2 276 107
   000494      1  049700         MOVE ZERO TO RECORD-COUNT.                               IX1084.2 IMP 277
   000495         049800     PERFORM WRT-LN.                                              IX1084.2 496
   000496         049900 WRT-LN.                                                          IX1084.2
   000497         050000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1084.2 107
   000498         050100     MOVE SPACE TO DUMMY-RECORD.                                  IX1084.2 IMP 107
   000499         050200 BLANK-LINE-PRINT.                                                IX1084.2
   000500         050300     PERFORM WRT-LN.                                              IX1084.2 496
   000501         050400 FAIL-ROUTINE.                                                    IX1084.2
   000502         050500     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1084.2 232 IMP
   000503      1  050600            GO TO   FAIL-ROUTINE-WRITE.                           IX1084.2 510
   000504         050700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1084.2 246 IMP 510
   000505         050800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1084.2 278 348
   000506         050900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1084.2 343
   000507         051000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1084.2 340 107 480
   000508         051100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1084.2 IMP 348
   000509         051200     GO TO  FAIL-ROUTINE-EX.                                      IX1084.2 515
   000510         051300 FAIL-ROUTINE-WRITE.                                              IX1084.2
   000511         051400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1084.2 228 106 480
   000512         051500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1084.2 278 256
   000513         051600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1084.2 243 106 480
   000514         051700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1084.2 IMP 256
   000515         051800 FAIL-ROUTINE-EX. EXIT.                                           IX1084.2
   000516         051900 BAIL-OUT.                                                        IX1084.2
   000517         052000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1084.2 233 IMP 519
   000518         052100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1084.2 247 IMP 524
   000519         052200 BAIL-OUT-WRITE.                                                  IX1084.2
   000520         052300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1084.2 247 347 233 345
   000521         052400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1084.2 278 348
   000522         052500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1084.2 340 107 480
   000523         052600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1084.2 IMP 348
   000524         052700 BAIL-OUT-EX. EXIT.                                               IX1084.2
   000525         052800 CCVS1-EXIT.                                                      IX1084.2
   000526         052900     EXIT.                                                        IX1084.2
   000527         053000 SECT-IX-04-001 SECTION.                                          IX1084.2
   000528         053200*                                                                *IX1084.2
   000529         053300*   TEST  1   CREATE INDEXED FILE IX-FS2                         *IX1084.2
   000530         053400*                                                                *IX1084.2
   000531         053600 WRITE-INIT-GF-01.                                                IX1084.2
   000532         053700     MOVE     "WRITE NOT INVALID END-" TO  FEATURE.               IX1084.2 218
   000533         053800     MOVE     "IX-FS2"        TO  XFILE-NAME (2).                 IX1084.2 183
   000534         053900     MOVE     "R1-F-G"        TO  XRECORD-NAME (2).               IX1084.2 185
   000535         054000     MOVE     CCVS-PGM-ID     TO  XPROGRAM-NAME (2).              IX1084.2 355 195
   000536         054100     MOVE     000240          TO  XRECORD-LENGTH (2).             IX1084.2 197
   000537         054200     MOVE     "RC"            TO  CHARS-OR-RECORDS (2).           IX1084.2 199
   000538         054300     MOVE     0001            TO  XBLOCK-SIZE       (2).          IX1084.2 201
   000539         054400     MOVE     000500          TO  RECORDS-IN-FILE  (2).           IX1084.2 203
   000540         054500     MOVE    "IX"                TO XFILE-ORGANIZATION (2).       IX1084.2 205
   000541         054600     MOVE    "WRITE-TEST-GF-01" TO PAR-NAME.                      IX1084.2 222
   000542         054700     MOVE     "S"             TO  XLABEL-TYPE        (2).         IX1084.2 207
   000543         054800     MOVE     000001          TO  XRECORD-NUMBER     (2).         IX1084.2 189
   000544         054900     MOVE     1         TO  WRK-CS-09V00-012.                     IX1084.2 142
   000545         055000     MOVE     ZERO      TO  WRK-CS-09V00-013 WRK-CS-09V00-014     IX1084.2 IMP 143 144
   000546         055100                            WRK-CS-09V00-015 WRK-CS-09V00-016     IX1084.2 145 146
   000547         055200                            WRK-CS-09V00-017 WRK-CS-09V00-018.    IX1084.2 147 148
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000548         055300     MOVE     SPACE     TO  IX-FS1-STATUS.                        IX1084.2 IMP 149
   000549         055400     MOVE     SPACE     TO  IX-FS2-STATUS.                        IX1084.2 IMP 150
   000550         055500     MOVE    ZERO TO WRK-DU-09V00-001.                            IX1084.2 IMP 139
   000551         055600     OPEN     OUTPUT    IX-FS1.                                   IX1084.2 108
   000552         055700     OPEN     OUTPUT    IX-FS2.                                   IX1084.2 120
   000553         055800     MOVE GRP-0101 TO IX-FS2-KEY.                                 IX1084.2 137 129
   000554         055900     MOVE     IX-FS2-STATUS TO WRK-XN-0002-001.                   IX1084.2 150 151
   000555         056000 WRITE-TEST-GF-01.                                                IX1084.2
   000556         056100     MOVE ZERO TO SWITCH-NOT-INVALID.                             IX1084.2 IMP 133
   000557         056200     MOVE ZERO TO SWITCH-END-XXX.                                 IX1084.2 IMP 134
   000558         056300     MOVE ZERO TO SWITCH-END-X9X.                                 IX1084.2 IMP 135
   000559         056400     MOVE    "99"  TO IX-FS2-STATUS.                              IX1084.2 150
   000560         056500     MOVE     XRECORD-NUMBER (2) TO WRK-DU-09V00-001.             IX1084.2 189 139
   000561         056600     MOVE     GRP-0101 TO XRECORD-KEY (2).                        IX1084.2 137 210
   000562         056700     MOVE     "IX-FS2"        TO  XFILE-NAME (2).                 IX1084.2 183
   000563         056800     MOVE     FILE-RECORD-INFO (2) TO IX-FS2R1-F-G-240.           IX1084.2 180 125
   000564         056900 WRITE-TEST-GF-01-1.                                              IX1084.2
   000565         057000     WRITE   IX-FS2R1-F-G-240                                     IX1084.2 125
   000566         057100       NOT INVALID                                                IX1084.2
   000567      1  057200         MOVE 1 TO SWITCH-NOT-INVALID.                            IX1084.2 133
   000568         057300     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   000569      1  057400         MOVE 0 TO SWITCH-NOT-INVALID                             IX1084.2 133
   000570         057500      ELSE                                                        IX1084.2
   000571      1  057600         MOVE "WRITE NOT INVALID" TO FEATURE                      IX1084.2 218
   000572      1  057700         PERFORM FAIL                                             IX1084.2 423
   000573      1  057800         MOVE "FILE IX-FS2 CANNOT BE CREATED CORRECTLY; IX-41"    IX1084.2
   000574      1  057900              TO RE-MARK                                          IX1084.2 227
   000575      1  058000         GO TO CCVS-EXIT.                                         IX1084.2 1419
   000576         058100 WRITE-TEST-GF-01-2.                                              IX1084.2
   000577         058200     MOVE ZERO TO SWITCH-NOT-INVALID.                             IX1084.2 IMP 133
   000578         058300     MOVE ZERO TO SWITCH-END-XXX.                                 IX1084.2 IMP 134
   000579         058400     MOVE ZERO TO SWITCH-END-X9X.                                 IX1084.2 IMP 135
   000580         058500     MOVE     "IX-FS1"        TO  XFILE-NAME (2).                 IX1084.2 183
   000581         058600     WRITE   IX-FS1R1-F-G-240 FROM FILE-RECORD-INFO (2)           IX1084.2 113 180
   000582      1  058700          INVALID KEY GO TO WRITE-TEST-GF-01-2-1                  IX1084.2 586
   000583      1  058800          NOT INVALID                                             IX1084.2
   000584      1  058900         MOVE 1 TO SWITCH-NOT-INVALID                             IX1084.2 133
   000585         059000      END-WRITE.                                                  IX1084.2
   000586         059100 WRITE-TEST-GF-01-2-1.                                            IX1084.2
   000587         059200         MOVE 1 TO SWITCH-END-XXX.                                IX1084.2 134
   000588         059300     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   000589      1  059400         MOVE 0 TO SWITCH-NOT-INVALID                             IX1084.2 133
   000590         059500      ELSE                                                        IX1084.2
   000591      1  059600         MOVE "WRITE NOT INVALID" TO FEATURE                      IX1084.2 218
   000592      1  059700         PERFORM FAIL                                             IX1084.2 423
   000593      1  059800         MOVE "FILE IX-FS1 CANNOT BE CREATED CORRECTLY; IX-41"    IX1084.2
   000594      1  059900              TO RE-MARK                                          IX1084.2 227
   000595      1  060000         GO TO CCVS-EXIT.                                         IX1084.2 1419
   000596         060100     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   000597      1  060200         MOVE 0 TO SWITCH-END-XXX                                 IX1084.2 134
   000598         060300      ELSE                                                        IX1084.2
   000599      1  060400         MOVE "WRITE .. END-WRITE" TO FEATURE                     IX1084.2 218
   000600      1  060500         MOVE "FILE IX-FS1 CANNOT BE CREATED CORRECTLY; IX-41"    IX1084.2
   000601      1  060600              TO RE-MARK                                          IX1084.2 227
   000602      1  060700         PERFORM FAIL                                             IX1084.2 423
   000603      1  060800         GO TO CCVS-EXIT.                                         IX1084.2 1419
   000604         060900     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX1084.2 150
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000605      1  061000         ADD  1  TO WRK-CS-09V00-016.                             IX1084.2 146
   000606         061100     IF        IX-FS1-STATUS NOT EQUAL TO "00"                    IX1084.2 149
   000607      1  061200         ADD  1  TO WRK-CS-09V00-016.                             IX1084.2 146
   000608         061300     IF       XRECORD-NUMBER (2) EQUAL TO 100                     IX1084.2 189
   000609      1  061400              GO TO  WRITE-TEST-GF-01-3.                          IX1084.2 612
   000610         061500     ADD      01 TO  XRECORD-NUMBER (2).                          IX1084.2 189
   000611         061600     GO TO    WRITE-TEST-GF-01.                                   IX1084.2 555
   000612         061700 WRITE-TEST-GF-01-3.                                              IX1084.2
   000613         061800     IF       WRK-CS-09V00-014 NOT EQUAL TO ZERO                  IX1084.2 144 IMP
   000614      1  061900              MOVE "EXCEPTIONS/ERRORS" TO RE-MARK                 IX1084.2 227
   000615      1  062000              MOVE  ZERO TO CORRECT-18V0                          IX1084.2 IMP 253
   000616      1  062100              MOVE WRK-CS-09V00-014 TO COMPUTED-18V0              IX1084.2 144 240
   000617      1  062200              MOVE "IX-41 4.9.2                       " TO RE-MARKIX1084.2 227
   000618      1  062300              PERFORM   FAIL                                      IX1084.2 423
   000619         062400              ELSE                                                IX1084.2
   000620      1  062500              PERFORM   PASS.                                     IX1084.2 422
   000621         062600     PERFORM  PRINT-DETAIL.                                       IX1084.2 426
   000622         062700 WRITE-TEST-GF-02.                                                IX1084.2
   000623         062800     MOVE     "CREATE IX-FS2" TO  FEATURE                         IX1084.2 218
   000624         062900     MOVE    "WRITE-TEST-GF-02" TO PAR-NAME.                      IX1084.2 222
   000625         063000     IF       XRECORD-NUMBER (2) NOT EQUAL TO 100                 IX1084.2 189
   000626      1  063100              MOVE "INCORRECT COUNT" TO RE-MARK                   IX1084.2 227
   000627      1  063200              MOVE  500 TO CORRECT-18V0                           IX1084.2 253
   000628      1  063300             MOVE   XRECORD-NUMBER (2)  TO COMPUTED-18V0          IX1084.2 189 240
   000629      1  063400              MOVE "IX-41 4.9.2                       " TO RE-MARKIX1084.2 227
   000630      1  063500              PERFORM  FAIL                                       IX1084.2 423
   000631         063600              ELSE                                                IX1084.2
   000632      1  063700              PERFORM PASS.                                       IX1084.2 422
   000633         063800     PERFORM  PRINT-DETAIL.                                       IX1084.2 426
   000634         063900                                                                  IX1084.2
   000635         064000     CLOSE IX-FS1 IX-FS2.                                         IX1084.2 108 120
   000636         064100                                                                  IX1084.2
   000637         064300*                                                                *IX1084.2
   000638         064400*   TESTS:      R E A D         NOT INVALID    END-READ          *IX1084.2
   000639         064500*                                                                *IX1084.2
   000640         064700 READ-INIT-F1-01.                                                 IX1084.2
   000641         064800     OPEN INPUT IX-FS1.                                           IX1084.2 108
   000642         064900     MOVE "READ-TEST-F1-01" TO PAR-NAME.                          IX1084.2 222
   000643         065000     MOVE "READ NOT AT END  " TO FEATURE.                         IX1084.2 218
   000644         065100     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   000645         065200     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   000646         065300 READ-TEST-F1-01-0.                                               IX1084.2
   000647         065400     READ  IX-FS1 AT END                                          IX1084.2 108
   000648      1  065500              GO TO READ-FAIL-F1-01                               IX1084.2 654
   000649         065600          NOT AT END                                              IX1084.2
   000650      1  065700           MOVE 1 TO SWITCH-NOT-INVALID.                          IX1084.2 133
   000651         065800 READ-TEST-F1-01.                                                 IX1084.2
   000652         065900     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   000653      1  066000          GO TO READ-PASS-F1-01.                                  IX1084.2 658
   000654         066100 READ-FAIL-F1-01.                                                 IX1084.2
   000655         066200     MOVE "IX-28 4.5.4 (11) C                        " TO RE-MARK.IX1084.2 227
   000656         066300     PERFORM FAIL.                                                IX1084.2 423
   000657         066400     GO TO READ-WRITE-F1-01.                                      IX1084.2 660
   000658         066500 READ-PASS-F1-01.                                                 IX1084.2
   000659         066600     PERFORM PASS.                                                IX1084.2 422
   000660         066700 READ-WRITE-F1-01.                                                IX1084.2
   000661         066800     PERFORM PRINT-DETAIL.                                        IX1084.2 426
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000662         066900                                                                  IX1084.2
   000663         067100*   TEST  READ .. NOT AT END   ... END-READ.                     *IX1084.2
   000664         067200*                                                                *IX1084.2
   000665         067300*         IX-28, 4.5.4                                           *IX1084.2
   000666         067500 READ-INIT-F1-02.                                                 IX1084.2
   000667         067600     MOVE "READ-TEST-F1-02-1" TO PAR-NAME.                        IX1084.2 222
   000668         067700     MOVE "READ . NOT INV. . END-" TO FEATURE.                    IX1084.2 218
   000669         067800     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   000670         067900     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   000671         068000 READ-TEST-F1-02.                                                 IX1084.2
   000672         068100     READ  IX-FS1 AT END                                          IX1084.2 108
   000673      1  068200              GO TO READ-FAIL-F1-02-1                             IX1084.2 681
   000674         068300          NOT END                                                 IX1084.2
   000675      1  068400           MOVE 1 TO SWITCH-NOT-INVALID                           IX1084.2 133
   000676         068500        END-READ.                                                 IX1084.2
   000677         068600     MOVE 1 TO SWITCH-END-XXX.                                    IX1084.2 134
   000678         068700 READ-TEST-F1-02-1.                                               IX1084.2
   000679         068800     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   000680      1  068900          GO TO READ-PASS-F1-02-1.                                IX1084.2 685
   000681         069000 READ-FAIL-F1-02-1.                                               IX1084.2
   000682         069100     MOVE "IX-28 4.5.4 (11) C                        " TO RE-MARK.IX1084.2 227
   000683         069200     PERFORM FAIL.                                                IX1084.2 423
   000684         069300     GO TO READ-WRITE-F1-02-1.                                    IX1084.2 687
   000685         069400 READ-PASS-F1-02-1.                                               IX1084.2
   000686         069500     PERFORM PASS.                                                IX1084.2 422
   000687         069600 READ-WRITE-F1-02-1.                                              IX1084.2
   000688         069700     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000689         069800                                                                  IX1084.2
   000690         069900 READ-TEST-F1-02-2.                                               IX1084.2
   000691         070000     MOVE "READ-TEST-F1-02-2" TO PAR-NAME.                        IX1084.2 222
   000692         070100     MOVE "END-READ.        " TO FEATURE.                         IX1084.2 218
   000693         070200     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   000694      1  070300          GO TO READ-PASS-F1-02-2.                                IX1084.2 699
   000695         070400 READ-FAIL-F1-02-2.                                               IX1084.2
   000696         070500     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   000697         070600     PERFORM FAIL.                                                IX1084.2 423
   000698         070700     GO TO READ-WRITE-F1-02-2.                                    IX1084.2 701
   000699         070800 READ-PASS-F1-02-2.                                               IX1084.2
   000700         070900     PERFORM PASS.                                                IX1084.2 422
   000701         071000 READ-WRITE-F1-02-2.                                              IX1084.2
   000702         071100     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000703         071200                                                                  IX1084.2
   000704         071400*   TEST: IF READ .. NOT AT END   ... END-READ ...      .        *IX1084.2
   000705         071500*                                                                *IX1084.2
   000706         071600*         IX-28, 4.5.4                                           *IX1084.2
   000707         071800 READ-INIT-F1-03.                                                 IX1084.2
   000708         071900     MOVE "READ-TEST-F1-03-1" TO PAR-NAME.                        IX1084.2 222
   000709         072000     MOVE "IF . READ . NOT INV. . END-" TO FEATURE.               IX1084.2 218
   000710         072100     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   000711         072200     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   000712         072300     MOVE    1      TO  SWITCH-IF.                                IX1084.2 136
   000713         072400 READ-TEST-F1-03.                                                 IX1084.2
   000714         072500     IF SWITCH-IF = 1                                             IX1084.2 136
   000715      1  072600        READ  IX-FS1 AT END                                       IX1084.2 108
   000716      2  072700              GO TO READ-FAIL-F1-03-1                             IX1084.2 725
   000717      1  072800          NOT END                                                 IX1084.2
   000718      2  072900             MOVE 1 TO SWITCH-NOT-INVALID                         IX1084.2 133
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000719      1  073000        END-READ                                                  IX1084.2
   000720      1  073100             MOVE 1 TO SWITCH-END-XXX.                            IX1084.2 134
   000721         073200     MOVE 9 TO SWITCH-END-X9X.                                    IX1084.2 135
   000722         073300 READ-TEST-F1-03-1.                                               IX1084.2
   000723         073400     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   000724      1  073500          GO TO READ-PASS-F1-03-1.                                IX1084.2 729
   000725         073600 READ-FAIL-F1-03-1.                                               IX1084.2
   000726         073700     MOVE "IX-28 4.5.4 (11) C                        " TO RE-MARK.IX1084.2 227
   000727         073800     PERFORM FAIL.                                                IX1084.2 423
   000728         073900     GO TO READ-WRITE-F1-03-1.                                    IX1084.2 731
   000729         074000 READ-PASS-F1-03-1.                                               IX1084.2
   000730         074100     PERFORM PASS.                                                IX1084.2 422
   000731         074200 READ-WRITE-F1-03-1.                                              IX1084.2
   000732         074300     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000733         074400                                                                  IX1084.2
   000734         074500 READ-TEST-F1-03-2.                                               IX1084.2
   000735         074600     MOVE "READ-TEST-F1-03-2" TO PAR-NAME.                        IX1084.2 222
   000736         074700     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   000737      1  074800          GO TO READ-PASS-F1-03-2.                                IX1084.2 742
   000738         074900 READ-FAIL-F1-03-2.                                               IX1084.2
   000739         075000     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   000740         075100     PERFORM FAIL.                                                IX1084.2 423
   000741         075200     GO TO READ-WRITE-F1-03-2.                                    IX1084.2 744
   000742         075300 READ-PASS-F1-03-2.                                               IX1084.2
   000743         075400     PERFORM PASS.                                                IX1084.2 422
   000744         075500 READ-WRITE-F1-03-2.                                              IX1084.2
   000745         075600     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000746         075700                                                                  IX1084.2
   000747         075800 READ-TEST-F1-03-3.                                               IX1084.2
   000748         075900     MOVE "READ-TEST-F1-03-3" TO PAR-NAME.                        IX1084.2 222
   000749         076000     IF SWITCH-END-X9X     = 9                                    IX1084.2 135
   000750      1  076100          GO TO READ-PASS-F1-03-3.                                IX1084.2 755
   000751         076200 READ-FAIL-F1-03-3.                                               IX1084.2
   000752         076300     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   000753         076400     PERFORM FAIL.                                                IX1084.2 423
   000754         076500     GO TO READ-WRITE-F1-03-3.                                    IX1084.2 757
   000755         076600 READ-PASS-F1-03-3.                                               IX1084.2
   000756         076700     PERFORM PASS.                                                IX1084.2 422
   000757         076800 READ-WRITE-F1-03-3.                                              IX1084.2
   000758         076900     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000759         077000                                                                  IX1084.2
   000760         077100     CLOSE IX-FS1.                                                IX1084.2 108
   000761         077200                                                                  IX1084.2
   000762         077400*   TEST  READ    NOT INVALID                                    *IX1084.2
   000763         077500*                                                                *IX1084.2
   000764         077600*         IX-28, 4.5.4                                           *IX1084.2
   000765         077800 READ-INIT-F2-01.                                                 IX1084.2
   000766         077900     MOVE     2     TO  WRK-CS-09V00-012.                         IX1084.2 142
   000767         078000     MOVE     ZERO  TO  WRK-CS-09V00-013.                         IX1084.2 IMP 143
   000768         078100     MOVE     ZERO  TO  WRK-CS-09V00-014.                         IX1084.2 IMP 144
   000769         078200     MOVE     ZERO  TO  WRK-CS-09V00-015.                         IX1084.2 IMP 145
   000770         078300     MOVE     ZERO  TO  WRK-CS-09V00-016.                         IX1084.2 IMP 146
   000771         078400     MOVE     ZERO  TO  WRK-CS-09V00-017.                         IX1084.2 IMP 147
   000772         078500     MOVE     ZERO  TO  WRK-CS-09V00-018.                         IX1084.2 IMP 148
   000773         078600     MOVE    SPACE TO IX-FS2-STATUS.                              IX1084.2 IMP 150
   000774         078700     OPEN     I-O  IX-FS2.                                        IX1084.2 120
   000775         078800     MOVE     SPACE     TO  WRK-XN-0002-002                       IX1084.2 IMP 152
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000776         078900     MOVE     SPACE     TO  WRK-XN-0002-003                       IX1084.2 IMP 153
   000777         079000     MOVE     SPACE     TO  WRK-XN-0002-004                       IX1084.2 IMP 154
   000778         079100     MOVE      IX-FS2-STATUS TO WRK-XN-0002-001                   IX1084.2 150 151
   000779         079200     MOVE      IX-FS2-STATUS TO WRK-XN-0002-001                   IX1084.2 150 151
   000780         079300     MOVE     SPACE TO IX-FS2-STATUS.                             IX1084.2 IMP 150
   000781         079400     MOVE "READ-TEST-F2-01" TO PAR-NAME.                          IX1084.2 222
   000782         079500     MOVE "READ NOT INVALID." TO FEATURE.                         IX1084.2 218
   000783         079600     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   000784         079700     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   000785         079800 READ-TEST-F2-01-0.                                               IX1084.2
   000786         079900     MOVE 1 TO WRK-DU-09V00-001.                                  IX1084.2 139
   000787         080000     MOVE GRP-0101  TO IX-FS2-KEY.                                IX1084.2 137 129
   000788         080100     READ  IX-FS2 INVALID                                         IX1084.2 120
   000789      1  080200              GO TO READ-FAIL-F2-01                               IX1084.2 795
   000790      1  080300          NOT INVALID                                             IX1084.2
   000791      1  080400           MOVE 1 TO SWITCH-NOT-INVALID.                          IX1084.2 133
   000792         080500 READ-TEST-F2-01.                                                 IX1084.2
   000793         080600     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   000794      1  080700          GO TO READ-PASS-F2-01.                                  IX1084.2 799
   000795         080800 READ-FAIL-F2-01.                                                 IX1084.2
   000796         080900     MOVE "IX-28 4.5.4 (11) C                        " TO RE-MARK.IX1084.2 227
   000797         081000     PERFORM FAIL.                                                IX1084.2 423
   000798         081100     GO TO READ-WRITE-F2-01.                                      IX1084.2 801
   000799         081200 READ-PASS-F2-01.                                                 IX1084.2
   000800         081300     PERFORM PASS.                                                IX1084.2 422
   000801         081400 READ-WRITE-F2-01.                                                IX1084.2
   000802         081500     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000803         081600                                                                  IX1084.2
   000804         081800*   TEST  READ .. NOT INVALID  ... END-READ.                     *IX1084.2
   000805         081900*                                                                *IX1084.2
   000806         082000*         IX-28, 4.5.4                                           *IX1084.2
   000807         082200 READ-INIT-F2-02.                                                 IX1084.2
   000808         082300     MOVE "READ-TEST-F2-02-1" TO PAR-NAME.                        IX1084.2 222
   000809         082400     MOVE "READ . NOT INV. . END-" TO FEATURE.                    IX1084.2 218
   000810         082500     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   000811         082600     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   000812         082700 READ-TEST-F2-02.                                                 IX1084.2
   000813         082800     MOVE 2 TO WRK-DU-09V00-001.                                  IX1084.2 139
   000814         082900     MOVE GRP-0101  TO IX-FS2-KEY.                                IX1084.2 137 129
   000815         083000     READ  IX-FS2 INVALID KEY                                     IX1084.2 120
   000816      1  083100              GO TO READ-FAIL-F2-02-1                             IX1084.2 824
   000817         083200          NOT INVALID KEY                                         IX1084.2
   000818      1  083300           MOVE 1 TO SWITCH-NOT-INVALID                           IX1084.2 133
   000819         083400        END-READ.                                                 IX1084.2
   000820         083500     MOVE 1 TO SWITCH-END-XXX.                                    IX1084.2 134
   000821         083600 READ-TEST-F2-02-1.                                               IX1084.2
   000822         083700     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   000823      1  083800          GO TO READ-PASS-F2-02-1.                                IX1084.2 828
   000824         083900 READ-FAIL-F2-02-1.                                               IX1084.2
   000825         084000     MOVE "IX-28 4.5.4 (11) C                        " TO RE-MARK.IX1084.2 227
   000826         084100     PERFORM FAIL.                                                IX1084.2 423
   000827         084200     GO TO READ-WRITE-F2-02-1.                                    IX1084.2 830
   000828         084300 READ-PASS-F2-02-1.                                               IX1084.2
   000829         084400     PERFORM PASS.                                                IX1084.2 422
   000830         084500 READ-WRITE-F2-02-1.                                              IX1084.2
   000831         084600     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000832         084700                                                                  IX1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000833         084800 READ-TEST-F2-02-2.                                               IX1084.2
   000834         084900     MOVE "READ-TEST-F2-02-2" TO PAR-NAME.                        IX1084.2 222
   000835         085000     MOVE "END-READ.        " TO FEATURE.                         IX1084.2 218
   000836         085100     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   000837      1  085200          GO TO READ-PASS-F2-02-2.                                IX1084.2 842
   000838         085300 READ-FAIL-F2-02-2.                                               IX1084.2
   000839         085400     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   000840         085500     PERFORM FAIL.                                                IX1084.2 423
   000841         085600     GO TO READ-WRITE-F2-02-2.                                    IX1084.2 844
   000842         085700 READ-PASS-F2-02-2.                                               IX1084.2
   000843         085800     PERFORM PASS.                                                IX1084.2 422
   000844         085900 READ-WRITE-F2-02-2.                                              IX1084.2
   000845         086000     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000846         086100                                                                  IX1084.2
   000847         086300*   TEST: IF READ .. NOT INVALID  ... END-READ ...      .        *IX1084.2
   000848         086400*                                                                *IX1084.2
   000849         086500*         IX-28, 4.5.4                                           *IX1084.2
   000850         086700 READ-INIT-F2-03.                                                 IX1084.2
   000851         086800     MOVE "READ-TEST-F2-03-1" TO PAR-NAME.                        IX1084.2 222
   000852         086900     MOVE "IF . READ . NOT INV. . END-" TO FEATURE.               IX1084.2 218
   000853         087000     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   000854         087100     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   000855         087200     MOVE    1      TO  SWITCH-IF.                                IX1084.2 136
   000856         087300 READ-TEST-F2-03.                                                 IX1084.2
   000857         087400     MOVE 3 TO WRK-DU-09V00-001.                                  IX1084.2 139
   000858         087500     MOVE GRP-0101  TO IX-FS2-KEY.                                IX1084.2 137 129
   000859         087600     IF SWITCH-IF = 1                                             IX1084.2 136
   000860      1  087700        READ  IX-FS2 INVALID KEY                                  IX1084.2 120
   000861      2  087800              GO TO READ-FAIL-F2-03-1                             IX1084.2 870
   000862      1  087900          NOT INVALID KEY                                         IX1084.2
   000863      2  088000             MOVE 1 TO SWITCH-NOT-INVALID                         IX1084.2 133
   000864      1  088100        END-READ                                                  IX1084.2
   000865      1  088200             MOVE 1 TO SWITCH-END-XXX.                            IX1084.2 134
   000866         088300     MOVE 9 TO SWITCH-END-X9X.                                    IX1084.2 135
   000867         088400 READ-TEST-F2-03-1.                                               IX1084.2
   000868         088500     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   000869      1  088600          GO TO READ-PASS-F2-03-1.                                IX1084.2 874
   000870         088700 READ-FAIL-F2-03-1.                                               IX1084.2
   000871         088800     MOVE "IX-28 4.5.4 (11) C                        " TO RE-MARK.IX1084.2 227
   000872         088900     PERFORM FAIL.                                                IX1084.2 423
   000873         089000     GO TO READ-WRITE-F2-03-1.                                    IX1084.2 876
   000874         089100 READ-PASS-F2-03-1.                                               IX1084.2
   000875         089200     PERFORM PASS.                                                IX1084.2 422
   000876         089300 READ-WRITE-F2-03-1.                                              IX1084.2
   000877         089400     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000878         089500                                                                  IX1084.2
   000879         089600 READ-TEST-F2-03-2.                                               IX1084.2
   000880         089700     MOVE "READ-TEST-F2-03-2" TO PAR-NAME.                        IX1084.2 222
   000881         089800     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   000882      1  089900          GO TO READ-PASS-F2-03-2.                                IX1084.2 887
   000883         090000 READ-FAIL-F2-03-2.                                               IX1084.2
   000884         090100     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   000885         090200     PERFORM FAIL.                                                IX1084.2 423
   000886         090300     GO TO READ-WRITE-F2-03-2.                                    IX1084.2 889
   000887         090400 READ-PASS-F2-03-2.                                               IX1084.2
   000888         090500     PERFORM PASS.                                                IX1084.2 422
   000889         090600 READ-WRITE-F2-03-2.                                              IX1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000890         090700     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000891         090800                                                                  IX1084.2
   000892         090900 READ-TEST-F2-03-3.                                               IX1084.2
   000893         091000     MOVE "READ-TEST-F2-03-3" TO PAR-NAME.                        IX1084.2 222
   000894         091100     IF SWITCH-END-X9X     = 9                                    IX1084.2 135
   000895      1  091200          GO TO READ-PASS-F2-03-3.                                IX1084.2 900
   000896         091300 READ-FAIL-F2-03-3.                                               IX1084.2
   000897         091400     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   000898         091500     PERFORM FAIL.                                                IX1084.2 423
   000899         091600     GO TO READ-WRITE-F2-03-3.                                    IX1084.2 902
   000900         091700 READ-PASS-F2-03-3.                                               IX1084.2
   000901         091800     PERFORM PASS.                                                IX1084.2 422
   000902         091900 READ-WRITE-F2-03-3.                                              IX1084.2
   000903         092000     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000904         092100                                                                  IX1084.2
   000905         092200     CLOSE IX-FS2.                                                IX1084.2 120
   000906         092300                                                                  IX1084.2
   000907         092500*                                                                *IX1084.2
   000908         092600*   TESTS:   D E L E T E        NOT INVALID    END-DELETE        *IX1084.2
   000909         092700*         FOR A FILE WHICH IS IN RANDOM ACCESS MODE              *IX1084.2
   000910         092800*                                                                *IX1084.2
   000911         092900*                                                                *IX1084.2
   000912         093000*   TEST  DELETE  NOT INVALID                                    *IX1084.2
   000913         093100*                                                                *IX1084.2
   000914         093200*         IX-21, 4.3.2                                           *IX1084.2
   000915         093400 DELETE-INIT-GF-01.                                               IX1084.2
   000916         093500     MOVE     2     TO  WRK-CS-09V00-012.                         IX1084.2 142
   000917         093600     MOVE     ZERO  TO  WRK-CS-09V00-013.                         IX1084.2 IMP 143
   000918         093700     MOVE     ZERO  TO  WRK-CS-09V00-014.                         IX1084.2 IMP 144
   000919         093800     MOVE     ZERO  TO  WRK-CS-09V00-015.                         IX1084.2 IMP 145
   000920         093900     MOVE     ZERO  TO  WRK-CS-09V00-016.                         IX1084.2 IMP 146
   000921         094000     MOVE     ZERO  TO  WRK-CS-09V00-017.                         IX1084.2 IMP 147
   000922         094100     MOVE     ZERO  TO  WRK-CS-09V00-018.                         IX1084.2 IMP 148
   000923         094200     MOVE    SPACE TO IX-FS2-STATUS.                              IX1084.2 IMP 150
   000924         094300     OPEN     I-O  IX-FS2.                                        IX1084.2 120
   000925         094400     MOVE     SPACE     TO  WRK-XN-0002-002                       IX1084.2 IMP 152
   000926         094500     MOVE     SPACE     TO  WRK-XN-0002-003                       IX1084.2 IMP 153
   000927         094600     MOVE     SPACE     TO  WRK-XN-0002-004                       IX1084.2 IMP 154
   000928         094700     MOVE      IX-FS2-STATUS TO WRK-XN-0002-001                   IX1084.2 150 151
   000929         094800     MOVE      IX-FS2-STATUS TO WRK-XN-0002-001                   IX1084.2 150 151
   000930         094900     MOVE     SPACE TO IX-FS2-STATUS.                             IX1084.2 IMP 150
   000931         095000     MOVE "DELETE-TEST-GF-01" TO PAR-NAME.                        IX1084.2 222
   000932         095100     MOVE "DELETE NOT INVALID." TO FEATURE.                       IX1084.2 218
   000933         095200     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   000934         095300     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   000935         095400 DELETE-TEST-GF-01-0.                                             IX1084.2
   000936         095500     MOVE 1 TO WRK-DU-09V00-001.                                  IX1084.2 139
   000937         095600     MOVE GRP-0101  TO IX-FS2-KEY.                                IX1084.2 137 129
   000938         095700     READ  IX-FS2 INVALID KEY                                     IX1084.2 120
   000939      1  095800              MOVE " READ FAILED " TO RE-MARK                     IX1084.2 227
   000940      1  095900              PERFORM FAIL                                        IX1084.2 423
   000941      1  096000              GO TO DELETE-WRITE-GF-01.                           IX1084.2 957
   000942         096100     DELETE IX-FS2 RECORD                                         IX1084.2 120
   000943      1  096200            INVALID KEY   MOVE "DELETE IS INVALID" TO RE-MARK     IX1084.2 227
   000944      1  096300                          PERFORM FAIL                            IX1084.2 423
   000945      1  096400                          GO TO DELETE-WRITE-GF-01                IX1084.2 957
   000946         096500          NOT INVALID KEY                                         IX1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000947      1  096600           MOVE 1 TO SWITCH-NOT-INVALID.                          IX1084.2 133
   000948         096700 DELETE-TEST-GF-01.                                               IX1084.2
   000949         096800     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   000950      1  096900          GO TO DELETE-PASS-GF-01.                                IX1084.2 955
   000951         097000 DELETE-FAIL-GF-01.                                               IX1084.2
   000952         097100     MOVE "IX-21, 4.3.2                              " TO RE-MARK.IX1084.2 227
   000953         097200     PERFORM FAIL.                                                IX1084.2 423
   000954         097300     GO TO DELETE-WRITE-GF-01.                                    IX1084.2 957
   000955         097400 DELETE-PASS-GF-01.                                               IX1084.2
   000956         097500     PERFORM PASS.                                                IX1084.2 422
   000957         097600 DELETE-WRITE-GF-01.                                              IX1084.2
   000958         097700     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000959         097800                                                                  IX1084.2
   000960         098000*   TEST  DELETE  NOT INVALID  ... END-DELETE.                   *IX1084.2
   000961         098100*                                                                *IX1084.2
   000962         098200*         IX-21, 4.3.2                                           *IX1084.2
   000963         098400 DELETE-INIT-GF-02.                                               IX1084.2
   000964         098500     MOVE "DELETE-TEST-GF-02-1"   TO PAR-NAME.                    IX1084.2 222
   000965         098600     MOVE "DELETE NOT INV. . END-" TO FEATURE.                    IX1084.2 218
   000966         098700     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   000967         098800     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   000968         098900 DELETE-TEST-GF-02.                                               IX1084.2
   000969         099000     MOVE 2 TO WRK-DU-09V00-001.                                  IX1084.2 139
   000970         099100     MOVE GRP-0101  TO IX-FS2-KEY.                                IX1084.2 137 129
   000971         099200     READ  IX-FS2 INVALID KEY                                     IX1084.2 120
   000972      1  099300              MOVE "READ FAILED " TO RE-MARK                      IX1084.2 227
   000973      1  099400              PERFORM FAIL                                        IX1084.2 423
   000974      1  099500              GO TO DELETE-WRITE-GF-02-1.                         IX1084.2 992
   000975         099600     DELETE IX-FS2 RECORD                                         IX1084.2 120
   000976      1  099700            INVALID       MOVE "DELETE IS INVALID" TO RE-MARK     IX1084.2 227
   000977      1  099800                          PERFORM FAIL                            IX1084.2 423
   000978      1  099900                          GO TO DELETE-WRITE-GF-02-1              IX1084.2 992
   000979      1  100000          NOT INVALID                                             IX1084.2
   000980      1  100100           MOVE 1 TO SWITCH-NOT-INVALID                           IX1084.2 133
   000981         100200        END-DELETE.                                               IX1084.2
   000982         100300     MOVE 1 TO SWITCH-END-XXX.                                    IX1084.2 134
   000983         100400 DELETE-TEST-GF-02-1.                                             IX1084.2
   000984         100500     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   000985      1  100600          GO TO DELETE-PASS-GF-02-1.                              IX1084.2 990
   000986         100700 DELETE-FAIL-GF-02-1.                                             IX1084.2
   000987         100800     MOVE "IX-21, 4.3.2                              " TO RE-MARK.IX1084.2 227
   000988         100900     PERFORM FAIL.                                                IX1084.2 423
   000989         101000     GO TO DELETE-WRITE-GF-02-1.                                  IX1084.2 992
   000990         101100 DELETE-PASS-GF-02-1.                                             IX1084.2
   000991         101200     PERFORM PASS.                                                IX1084.2 422
   000992         101300 DELETE-WRITE-GF-02-1.                                            IX1084.2
   000993         101400     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   000994         101500                                                                  IX1084.2
   000995         101600 DELETE-TEST-GF-02-2.                                             IX1084.2
   000996         101700     MOVE "DELETE-TEST-GF-02-2"   TO PAR-NAME.                    IX1084.2 222
   000997         101800     MOVE "END-DELETE.      " TO FEATURE.                         IX1084.2 218
   000998         101900     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   000999      1  102000          GO TO DELETE-PASS-GF-02-2.                              IX1084.2 1004
   001000         102100 DELETE-FAIL-GF-02-2.                                             IX1084.2
   001001         102200     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   001002         102300     PERFORM FAIL.                                                IX1084.2 423
   001003         102400     GO TO DELETE-WRITE-GF-02-2.                                  IX1084.2 1006
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001004         102500 DELETE-PASS-GF-02-2.                                             IX1084.2
   001005         102600     PERFORM PASS.                                                IX1084.2 422
   001006         102700 DELETE-WRITE-GF-02-2.                                            IX1084.2
   001007         102800     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001008         102900                                                                  IX1084.2
   001009         103100*   TEST: IF DELETE. NOT INVALID  ... END-DELETE ...    .        *IX1084.2
   001010         103200*                                                                *IX1084.2
   001011         103300*         IX-21, 4.3.2                                           *IX1084.2
   001012         103500 DELETE-INIT-GF-03.                                               IX1084.2
   001013         103600     MOVE "DELETE-TEST-GF-03-1"   TO PAR-NAME.                    IX1084.2 222
   001014         103700     MOVE "IF .DELETE. NOT INV. . END-" TO FEATURE.               IX1084.2 218
   001015         103800     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   001016         103900     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   001017         104000     MOVE    1      TO  SWITCH-IF.                                IX1084.2 136
   001018         104100 DELETE-TEST-GF-03.                                               IX1084.2
   001019         104200     MOVE 3 TO WRK-DU-09V00-001.                                  IX1084.2 139
   001020         104300     MOVE GRP-0101  TO IX-FS2-KEY.                                IX1084.2 137 129
   001021         104400     READ  IX-FS2 INVALID KEY                                     IX1084.2 120
   001022      1  104500              MOVE "READ FAILED " TO RE-MARK                      IX1084.2 227
   001023      1  104600              PERFORM FAIL                                        IX1084.2 423
   001024      1  104700              GO TO DELETE-WRITE-GF-03-1.                         IX1084.2 1044
   001025         104800     IF SWITCH-IF = 1                                             IX1084.2 136
   001026      1  104900        DELETE IX-FS2 RECORD                                      IX1084.2 120
   001027      2  105000            INVALID KEY   MOVE "DELETE IS INVALID" TO RE-MARK     IX1084.2 227
   001028      2  105100                          PERFORM FAIL                            IX1084.2 423
   001029      2  105200                          GO TO DELETE-WRITE-GF-03-1              IX1084.2 1044
   001030      1  105300          NOT INVALID KEY                                         IX1084.2
   001031      2  105400             MOVE 1 TO SWITCH-NOT-INVALID                         IX1084.2 133
   001032      1  105500        END-DELETE                                                IX1084.2
   001033      1  105600             MOVE 1 TO SWITCH-END-XXX.                            IX1084.2 134
   001034         105700     MOVE 9 TO SWITCH-END-X9X.                                    IX1084.2 135
   001035         105800 DELETE-TEST-GF-03-1.                                             IX1084.2
   001036         105900     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   001037      1  106000          GO TO DELETE-PASS-GF-03-1.                              IX1084.2 1042
   001038         106100 DELETE-FAIL-GF-03-1.                                             IX1084.2
   001039         106200     MOVE "IX-21, 4.3.2                              " TO RE-MARK.IX1084.2 227
   001040         106300     PERFORM FAIL.                                                IX1084.2 423
   001041         106400     GO TO DELETE-WRITE-GF-03-1.                                  IX1084.2 1044
   001042         106500 DELETE-PASS-GF-03-1.                                             IX1084.2
   001043         106600     PERFORM PASS.                                                IX1084.2 422
   001044         106700 DELETE-WRITE-GF-03-1.                                            IX1084.2
   001045         106800     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001046         106900                                                                  IX1084.2
   001047         107000 DELETE-TEST-GF-03-2.                                             IX1084.2
   001048         107100     MOVE "END-DELETE" TO FEATURE.                                IX1084.2 218
   001049         107200     MOVE "DELETE-TEST-GF-03-2"   TO PAR-NAME.                    IX1084.2 222
   001050         107300     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   001051      1  107400          GO TO DELETE-PASS-GF-03-2.                              IX1084.2 1056
   001052         107500 DELETE-FAIL-GF-03-2.                                             IX1084.2
   001053         107600     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   001054         107700     PERFORM FAIL.                                                IX1084.2 423
   001055         107800     GO TO DELETE-WRITE-GF-03-2.                                  IX1084.2 1058
   001056         107900 DELETE-PASS-GF-03-2.                                             IX1084.2
   001057         108000     PERFORM PASS.                                                IX1084.2 422
   001058         108100 DELETE-WRITE-GF-03-2.                                            IX1084.2
   001059         108200     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001060         108300                                                                  IX1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001061         108400 DELETE-TEST-GF-03-3.                                             IX1084.2
   001062         108500     MOVE "DELETE-TEST-GF-03-3"   TO PAR-NAME.                    IX1084.2 222
   001063         108600     IF SWITCH-END-X9X     = 9                                    IX1084.2 135
   001064      1  108700          GO TO DELETE-PASS-GF-03-3.                              IX1084.2 1069
   001065         108800 DELETE-FAIL-GF-03-3.                                             IX1084.2
   001066         108900     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   001067         109000     PERFORM FAIL.                                                IX1084.2 423
   001068         109100     GO TO DELETE-WRITE-GF-03-3.                                  IX1084.2 1071
   001069         109200 DELETE-PASS-GF-03-3.                                             IX1084.2
   001070         109300     PERFORM PASS.                                                IX1084.2 422
   001071         109400 DELETE-WRITE-GF-03-3.                                            IX1084.2
   001072         109500     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001073         109600                                                                  IX1084.2
   001074         109700      CLOSE IX-FS2.                                               IX1084.2 120
   001075         109800                                                                  IX1084.2
   001076         110000*                                                                *IX1084.2
   001077         110100*   TESTS:   R E W R I T E      NOT INVALID    END-REWRITE       *IX1084.2
   001078         110200*         FOR A FILE WHICH IS IN RANDOM ACCESS MODE              *IX1084.2
   001079         110300*                                                                *IX1084.2
   001080         110400*                                                                *IX1084.2
   001081         110500*   TEST  REWRITE NOT INVALID                                    *IX1084.2
   001082         110600*                                                                *IX1084.2
   001083         110700*         IX-33, 4.6.2                                           *IX1084.2
   001084         110900 REWRITE-INIT-GF-01.                                              IX1084.2
   001085         111000     MOVE     2     TO  WRK-CS-09V00-012.                         IX1084.2 142
   001086         111100     MOVE     ZERO  TO  WRK-CS-09V00-013.                         IX1084.2 IMP 143
   001087         111200     MOVE     ZERO  TO  WRK-CS-09V00-014.                         IX1084.2 IMP 144
   001088         111300     MOVE     ZERO  TO  WRK-CS-09V00-015.                         IX1084.2 IMP 145
   001089         111400     MOVE     ZERO  TO  WRK-CS-09V00-016.                         IX1084.2 IMP 146
   001090         111500     MOVE     ZERO  TO  WRK-CS-09V00-017.                         IX1084.2 IMP 147
   001091         111600     MOVE     ZERO  TO  WRK-CS-09V00-018.                         IX1084.2 IMP 148
   001092         111700     MOVE    SPACE TO IX-FS2-STATUS.                              IX1084.2 IMP 150
   001093         111800     OPEN     I-O  IX-FS2.                                        IX1084.2 120
   001094         111900     MOVE     SPACE     TO  WRK-XN-0002-002                       IX1084.2 IMP 152
   001095         112000     MOVE     SPACE     TO  WRK-XN-0002-003                       IX1084.2 IMP 153
   001096         112100     MOVE     SPACE     TO  WRK-XN-0002-004                       IX1084.2 IMP 154
   001097         112200     MOVE      IX-FS2-STATUS TO WRK-XN-0002-001                   IX1084.2 150 151
   001098         112300     MOVE      IX-FS2-STATUS TO WRK-XN-0002-001                   IX1084.2 150 151
   001099         112400     MOVE     SPACE TO IX-FS2-STATUS.                             IX1084.2 IMP 150
   001100         112500     MOVE "REWRITE-TEST-GF-01" TO PAR-NAME.                       IX1084.2 222
   001101         112600     MOVE "REWRITE NOT INVALID." TO FEATURE.                      IX1084.2 218
   001102         112700     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   001103         112800     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   001104         112900 REWRITE-TEST-GF-01-0.                                            IX1084.2
   001105         113000     MOVE 5 TO WRK-DU-09V00-001.                                  IX1084.2 139
   001106         113100     MOVE GRP-0101  TO IX-FS2-KEY.                                IX1084.2 137 129
   001107         113200     READ  IX-FS2 INVALID KEY                                     IX1084.2 120
   001108      1  113300              MOVE " READ FAILED " TO RE-MARK                     IX1084.2 227
   001109      1  113400              PERFORM FAIL                                        IX1084.2 423
   001110      1  113500              GO TO REWRITE-WRITE-GF-01.                          IX1084.2 1127
   001111         113600     MOVE "RECORD REPLACED BY REWRITE STATEMENT" TO IX-FS2-REC-120IX1084.2 126
   001112         113700     REWRITE IX-FS2R1-F-G-240                                     IX1084.2 125
   001113      1  113800            INVALID KEY   MOVE "REWRITE IS INVALID" TO RE-MARK    IX1084.2 227
   001114      1  113900                          PERFORM FAIL                            IX1084.2 423
   001115      1  114000                          GO TO REWRITE-WRITE-GF-01               IX1084.2 1127
   001116         114100          NOT INVALID KEY                                         IX1084.2
   001117      1  114200           MOVE 1 TO SWITCH-NOT-INVALID.                          IX1084.2 133
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001118         114300 REWRITE-TEST-GF-01.                                              IX1084.2
   001119         114400     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   001120      1  114500          GO TO REWRITE-PASS-GF-01.                               IX1084.2 1125
   001121         114600 REWRITE-FAIL-GF-01.                                              IX1084.2
   001122         114700     MOVE "IX-33, 4.6.2                              " TO RE-MARK.IX1084.2 227
   001123         114800     PERFORM FAIL.                                                IX1084.2 423
   001124         114900     GO TO REWRITE-WRITE-GF-01.                                   IX1084.2 1127
   001125         115000 REWRITE-PASS-GF-01.                                              IX1084.2
   001126         115100     PERFORM PASS.                                                IX1084.2 422
   001127         115200 REWRITE-WRITE-GF-01.                                             IX1084.2
   001128         115300     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001129         115400                                                                  IX1084.2
   001130         115600*   TEST  REWRITE NOT INVALID  ... END-DELETE.                   *IX1084.2
   001131         115700*                                                                *IX1084.2
   001132         115800*         IX-33, 4.6.2                                           *IX1084.2
   001133         116000 REWRITE-INIT-GF-02.                                              IX1084.2
   001134         116100     MOVE "REWRITE-TEST-GF-02-1"  TO PAR-NAME.                    IX1084.2 222
   001135         116200     MOVE "REWRITE NOT INV. . END-" TO FEATURE.                   IX1084.2 218
   001136         116300     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   001137         116400     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   001138         116500 REWRITE-TEST-GF-02.                                              IX1084.2
   001139         116600     MOVE 6 TO WRK-DU-09V00-001.                                  IX1084.2 139
   001140         116700     MOVE GRP-0101  TO IX-FS2-KEY.                                IX1084.2 137 129
   001141         116800     READ  IX-FS2 INVALID KEY                                     IX1084.2 120
   001142      1  116900              MOVE "READ FAILED " TO RE-MARK                      IX1084.2 227
   001143      1  117000              PERFORM FAIL                                        IX1084.2 423
   001144      1  117100              GO TO REWRITE-WRITE-GF-02-1.                        IX1084.2 1163
   001145         117200     MOVE "RECORD REPLACED BY REWRITE STATEMENT" TO IX-FS2-REC-120IX1084.2 126
   001146         117300     REWRITE IX-FS2R1-F-G-240                                     IX1084.2 125
   001147      1  117400            INVALID KEY   MOVE "REWRITE IS INVALID" TO RE-MARK    IX1084.2 227
   001148      1  117500                          PERFORM FAIL                            IX1084.2 423
   001149      1  117600                          GO TO REWRITE-WRITE-GF-02-1             IX1084.2 1163
   001150      1  117700          NOT INVALID                                             IX1084.2
   001151      1  117800           MOVE 1 TO SWITCH-NOT-INVALID                           IX1084.2 133
   001152         117900        END-REWRITE.                                              IX1084.2
   001153         118000     MOVE 1 TO SWITCH-END-XXX.                                    IX1084.2 134
   001154         118100 REWRITE-TEST-GF-02-1.                                            IX1084.2
   001155         118200     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   001156      1  118300          GO TO REWRITE-PASS-GF-02-1.                             IX1084.2 1161
   001157         118400 REWRITE-FAIL-GF-02-1.                                            IX1084.2
   001158         118500     MOVE "IX-33, 4.6.2                              " TO RE-MARK.IX1084.2 227
   001159         118600     PERFORM FAIL.                                                IX1084.2 423
   001160         118700     GO TO REWRITE-WRITE-GF-02-1.                                 IX1084.2 1163
   001161         118800 REWRITE-PASS-GF-02-1.                                            IX1084.2
   001162         118900     PERFORM PASS.                                                IX1084.2 422
   001163         119000 REWRITE-WRITE-GF-02-1.                                           IX1084.2
   001164         119100     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001165         119200                                                                  IX1084.2
   001166         119300 REWRITE-TEST-GF-02-2.                                            IX1084.2
   001167         119400     MOVE "REWRITE-TEST-GF-02-2"  TO PAR-NAME.                    IX1084.2 222
   001168         119500     MOVE "END-REWRITE.     " TO FEATURE.                         IX1084.2 218
   001169         119600     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   001170      1  119700          GO TO REWRITE-PASS-GF-02-2.                             IX1084.2 1175
   001171         119800 REWRITE-FAIL-GF-02-2.                                            IX1084.2
   001172         119900     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   001173         120000     PERFORM FAIL.                                                IX1084.2 423
   001174         120100     GO TO REWRITE-WRITE-GF-02-2.                                 IX1084.2 1177
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001175         120200 REWRITE-PASS-GF-02-2.                                            IX1084.2
   001176         120300     PERFORM PASS.                                                IX1084.2 422
   001177         120400 REWRITE-WRITE-GF-02-2.                                           IX1084.2
   001178         120500     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001179         120600                                                                  IX1084.2
   001180         120800*   TEST: IF REWRITE. NOT INVALID ... END-DELETE ...    .        *IX1084.2
   001181         120900*                                                                *IX1084.2
   001182         121000*         IX-33, 4.6.2                                           *IX1084.2
   001183         121200 REWRITE-INIT-GF-03.                                              IX1084.2
   001184         121300     MOVE "REWRITE-TEST-GF-03-1"  TO PAR-NAME.                    IX1084.2 222
   001185         121400     MOVE "IF .REWRITE. NOT INV. . END-" TO FEATURE.              IX1084.2 218
   001186         121500     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   001187         121600     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   001188         121700     MOVE    1      TO  SWITCH-IF.                                IX1084.2 136
   001189         121800 REWRITE-TEST-GF-03.                                              IX1084.2
   001190         121900     MOVE 7 TO WRK-DU-09V00-001.                                  IX1084.2 139
   001191         122000     MOVE GRP-0101  TO IX-FS2-KEY.                                IX1084.2 137 129
   001192         122100     READ  IX-FS2 INVALID KEY                                     IX1084.2 120
   001193      1  122200              MOVE "READ FAILED " TO RE-MARK                      IX1084.2 227
   001194      1  122300              PERFORM FAIL                                        IX1084.2 423
   001195      1  122400              GO TO REWRITE-WRITE-GF-03-1.                        IX1084.2 1216
   001196         122500     IF SWITCH-IF = 1                                             IX1084.2 136
   001197      1  122600     MOVE "RECORD REPLACED BY REWRITE STATEMENT" TO IX-FS2-REC-120IX1084.2 126
   001198      1  122700        REWRITE IX-FS2R1-F-G-240                                  IX1084.2 125
   001199      2  122800            INVALID KEY   MOVE "REWRITE IS INVALID" TO RE-MARK    IX1084.2 227
   001200      2  122900                          PERFORM FAIL                            IX1084.2 423
   001201      2  123000                          GO TO REWRITE-WRITE-GF-03-1             IX1084.2 1216
   001202      1  123100          NOT INVALID KEY                                         IX1084.2
   001203      2  123200             MOVE 1 TO SWITCH-NOT-INVALID                         IX1084.2 133
   001204      1  123300        END-REWRITE                                               IX1084.2
   001205      1  123400             MOVE 1 TO SWITCH-END-XXX.                            IX1084.2 134
   001206         123500     MOVE 9 TO SWITCH-END-X9X.                                    IX1084.2 135
   001207         123600 REWRITE-TEST-GF-03-1.                                            IX1084.2
   001208         123700     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   001209      1  123800          GO TO REWRITE-PASS-GF-03-1.                             IX1084.2 1214
   001210         123900 REWRITE-FAIL-GF-03-1.                                            IX1084.2
   001211         124000     MOVE "IX-33, 4.6.2                              " TO RE-MARK.IX1084.2 227
   001212         124100     PERFORM FAIL.                                                IX1084.2 423
   001213         124200     GO TO REWRITE-WRITE-GF-03-1.                                 IX1084.2 1216
   001214         124300 REWRITE-PASS-GF-03-1.                                            IX1084.2
   001215         124400     PERFORM PASS.                                                IX1084.2 422
   001216         124500 REWRITE-WRITE-GF-03-1.                                           IX1084.2
   001217         124600     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001218         124700                                                                  IX1084.2
   001219         124800 REWRITE-TEST-GF-03-2.                                            IX1084.2
   001220         124900     MOVE "END-REWRITE" TO FEATURE.                               IX1084.2 218
   001221         125000     MOVE "REWRITE-TEST-GF-03-2"  TO PAR-NAME.                    IX1084.2 222
   001222         125100     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   001223      1  125200          GO TO REWRITE-PASS-GF-03-2.                             IX1084.2 1228
   001224         125300 REWRITE-FAIL-GF-03-2.                                            IX1084.2
   001225         125400     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   001226         125500     PERFORM FAIL.                                                IX1084.2 423
   001227         125600     GO TO REWRITE-WRITE-GF-03-2.                                 IX1084.2 1230
   001228         125700 REWRITE-PASS-GF-03-2.                                            IX1084.2
   001229         125800     PERFORM PASS.                                                IX1084.2 422
   001230         125900 REWRITE-WRITE-GF-03-2.                                           IX1084.2
   001231         126000     PERFORM PRINT-DETAIL.                                        IX1084.2 426
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001232         126100                                                                  IX1084.2
   001233         126200 REWRITE-TEST-GF-03-3.                                            IX1084.2
   001234         126300     MOVE "REWRITE-TEST-GF-03-3"  TO PAR-NAME.                    IX1084.2 222
   001235         126400     IF SWITCH-END-X9X     = 9                                    IX1084.2 135
   001236      1  126500          GO TO REWRITE-PASS-GF-03-3.                             IX1084.2 1241
   001237         126600 REWRITE-FAIL-GF-03-3.                                            IX1084.2
   001238         126700     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   001239         126800     PERFORM FAIL.                                                IX1084.2 423
   001240         126900     GO TO REWRITE-WRITE-GF-03-3.                                 IX1084.2 1243
   001241         127000 REWRITE-PASS-GF-03-3.                                            IX1084.2
   001242         127100     PERFORM PASS.                                                IX1084.2 422
   001243         127200 REWRITE-WRITE-GF-03-3.                                           IX1084.2
   001244         127300     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001245         127400                                                                  IX1084.2
   001246         127500     CLOSE IX-FS2.                                                IX1084.2 120
   001247         127600                                                                  IX1084.2
   001248         127700                                                                  IX1084.2
   001249         127900*                                                                *IX1084.2
   001250         128000*   TESTS:   R E W R I T E      NOT INVALID    END-REWRITE       *IX1084.2
   001251         128100*         FOR A FILE WHICH IS IN SEQUENTIAL ACCESS MODE          *IX1084.2
   001252         128200*                                                                *IX1084.2
   001253         128300*                                                                *IX1084.2
   001254         128400*   TEST  REWRITE NOT INVALID                                    *IX1084.2
   001255         128500*                                                                *IX1084.2
   001256         128600*         IX-33, 4.6.2                                           *IX1084.2
   001257         128800 RWR-SEQ-INIT-GF-01.                                              IX1084.2
   001258         128900     MOVE     2     TO  WRK-CS-09V00-012.                         IX1084.2 142
   001259         129000     MOVE     ZERO  TO  WRK-CS-09V00-013.                         IX1084.2 IMP 143
   001260         129100     MOVE     ZERO  TO  WRK-CS-09V00-014.                         IX1084.2 IMP 144
   001261         129200     MOVE     ZERO  TO  WRK-CS-09V00-015.                         IX1084.2 IMP 145
   001262         129300     MOVE     ZERO  TO  WRK-CS-09V00-016.                         IX1084.2 IMP 146
   001263         129400     MOVE     ZERO  TO  WRK-CS-09V00-017.                         IX1084.2 IMP 147
   001264         129500     MOVE     ZERO  TO  WRK-CS-09V00-018.                         IX1084.2 IMP 148
   001265         129600     MOVE    SPACE TO IX-FS1-STATUS.                              IX1084.2 IMP 149
   001266         129700     OPEN     I-O  IX-FS1.                                        IX1084.2 108
   001267         129800     MOVE     SPACE     TO  WRK-XN-0002-002                       IX1084.2 IMP 152
   001268         129900     MOVE     SPACE     TO  WRK-XN-0002-003                       IX1084.2 IMP 153
   001269         130000     MOVE     SPACE     TO  WRK-XN-0002-004                       IX1084.2 IMP 154
   001270         130100     MOVE      IX-FS1-STATUS TO WRK-XN-0002-001                   IX1084.2 149 151
   001271         130200     MOVE      IX-FS1-STATUS TO WRK-XN-0002-001                   IX1084.2 149 151
   001272         130300     MOVE     SPACE TO IX-FS1-STATUS.                             IX1084.2 IMP 149
   001273         130400     MOVE "RWR-SEQ-TEST-GF-01"  TO PAR-NAME.                      IX1084.2 222
   001274         130500     MOVE "REWRITE NOT INVALID." TO FEATURE.                      IX1084.2 218
   001275         130600     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   001276         130700     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   001277         130800 RWR-SEQ-TEST-GF-01-0.                                            IX1084.2
   001278         131000*                                                                *IX1084.2
   001279         131100*   READ AND REWRITE THE FIRST THREE RECORDS                     *IX1084.2
   001280         131200*                                                                *IX1084.2
   001281         131400     READ  IX-FS1 AT END                                          IX1084.2 108
   001282      1  131500              MOVE " READ FAILED " TO RE-MARK                     IX1084.2 227
   001283      1  131600              PERFORM FAIL                                        IX1084.2 423
   001284      1  131700              GO TO RWR-SEQ-WRITE-GF-01.                          IX1084.2 1301
   001285         131800     MOVE "RECORD REPLACED BY REWRITE STATEMENT" TO IX-FS1-REC-120IX1084.2 114
   001286         131900     REWRITE IX-FS1R1-F-G-240                                     IX1084.2 113
   001287      1  132000            INVALID KEY   MOVE "REWRITE IS INVALID" TO RE-MARK    IX1084.2 227
   001288      1  132100                          PERFORM FAIL                            IX1084.2 423
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001289      1  132200                          GO TO RWR-SEQ-WRITE-GF-01               IX1084.2 1301
   001290         132300          NOT INVALID KEY                                         IX1084.2
   001291      1  132400           MOVE 1 TO SWITCH-NOT-INVALID.                          IX1084.2 133
   001292         132500 RWR-SEQ-TEST-GF-01.                                              IX1084.2
   001293         132600     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   001294      1  132700          GO TO RWR-SEQ-PASS-GF-01.                               IX1084.2 1299
   001295         132800 RWR-SEQ-FAIL-GF-01.                                              IX1084.2
   001296         132900     MOVE "IX-33, 4.6.2                              " TO RE-MARK.IX1084.2 227
   001297         133000     PERFORM FAIL.                                                IX1084.2 423
   001298         133100     GO TO RWR-SEQ-WRITE-GF-01.                                   IX1084.2 1301
   001299         133200 RWR-SEQ-PASS-GF-01.                                              IX1084.2
   001300         133300     PERFORM PASS.                                                IX1084.2 422
   001301         133400 RWR-SEQ-WRITE-GF-01.                                             IX1084.2
   001302         133500     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001303         133600                                                                  IX1084.2
   001304         133800*   TEST  REWRITE NOT INVALID  ... END-DELETE.                   *IX1084.2
   001305         133900*                                                                *IX1084.2
   001306         134000*         IX-33, 4.6.2                                           *IX1084.2
   001307         134200 RWR-SEQ-INIT-GF-02.                                              IX1084.2
   001308         134300     MOVE "RWR-SEQ-TEST-GF-02-1"  TO PAR-NAME.                    IX1084.2 222
   001309         134400     MOVE "REWRITE NOT INV. . END-" TO FEATURE.                   IX1084.2 218
   001310         134500     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   001311         134600     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   001312         134700 RWR-SEQ-TEST-GF-02.                                              IX1084.2
   001313         134800     READ  IX-FS1 AT END                                          IX1084.2 108
   001314      1  134900              MOVE "READ FAILED " TO RE-MARK                      IX1084.2 227
   001315      1  135000              PERFORM FAIL                                        IX1084.2 423
   001316      1  135100              GO TO RWR-SEQ-WRITE-GF-02-1.                        IX1084.2 1335
   001317         135200     MOVE "RECORD REPLACED BY REWRITE STATEMENT" TO IX-FS1-REC-120IX1084.2 114
   001318         135300     REWRITE IX-FS1R1-F-G-240                                     IX1084.2 113
   001319      1  135400            INVALID       MOVE "REWRITE IS INVALID" TO RE-MARK    IX1084.2 227
   001320      1  135500                          PERFORM FAIL                            IX1084.2 423
   001321      1  135600                          GO TO RWR-SEQ-WRITE-GF-02-1             IX1084.2 1335
   001322      1  135700          NOT INVALID                                             IX1084.2
   001323      1  135800           MOVE 1 TO SWITCH-NOT-INVALID                           IX1084.2 133
   001324         135900        END-REWRITE.                                              IX1084.2
   001325         136000     MOVE 1 TO SWITCH-END-XXX.                                    IX1084.2 134
   001326         136100 RWR-SEQ-TEST-GF-02-1.                                            IX1084.2
   001327         136200     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   001328      1  136300          GO TO RWR-SEQ-PASS-GF-02-1.                             IX1084.2 1333
   001329         136400 RWR-SEQ-FAIL-GF-02-1.                                            IX1084.2
   001330         136500     MOVE "IX-33, 4.6.2                              " TO RE-MARK.IX1084.2 227
   001331         136600     PERFORM FAIL.                                                IX1084.2 423
   001332         136700     GO TO RWR-SEQ-WRITE-GF-02-1.                                 IX1084.2 1335
   001333         136800 RWR-SEQ-PASS-GF-02-1.                                            IX1084.2
   001334         136900     PERFORM PASS.                                                IX1084.2 422
   001335         137000 RWR-SEQ-WRITE-GF-02-1.                                           IX1084.2
   001336         137100     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001337         137200                                                                  IX1084.2
   001338         137300 RWR-SEQ-TEST-GF-02-2.                                            IX1084.2
   001339         137400     MOVE "RWR-SEQ-TEST-GF-02-2"  TO PAR-NAME.                    IX1084.2 222
   001340         137500     MOVE "END-REWRITE.     " TO FEATURE.                         IX1084.2 218
   001341         137600     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   001342      1  137700          GO TO RWR-SEQ-PASS-GF-02-2.                             IX1084.2 1347
   001343         137800 RWR-SEQ-FAIL-GF-02-2.                                            IX1084.2
   001344         137900     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   001345         138000     PERFORM FAIL.                                                IX1084.2 423
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001346         138100     GO TO RWR-SEQ-WRITE-GF-02-2.                                 IX1084.2 1349
   001347         138200 RWR-SEQ-PASS-GF-02-2.                                            IX1084.2
   001348         138300     PERFORM PASS.                                                IX1084.2 422
   001349         138400 RWR-SEQ-WRITE-GF-02-2.                                           IX1084.2
   001350         138500     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001351         138600                                                                  IX1084.2
   001352         138800*   TEST: IF REWRITE. NOT INVALID ... END-DELETE ...    .        *IX1084.2
   001353         138900*                                                                *IX1084.2
   001354         139000*         IX-33, 4.6.2                                           *IX1084.2
   001355         139200 RWR-SEQ-INIT-GF-03.                                              IX1084.2
   001356         139300     MOVE "RWR-SEQ-TEST-GF-03-1"  TO PAR-NAME.                    IX1084.2 222
   001357         139400     MOVE "IF .REWRITE. NOT INV. . END-" TO FEATURE.              IX1084.2 218
   001358         139500     MOVE     ZERO  TO  SWITCH-NOT-INVALID.                       IX1084.2 IMP 133
   001359         139600     MOVE     ZERO  TO  SWITCH-END-XXX.                           IX1084.2 IMP 134
   001360         139700     MOVE    1      TO  SWITCH-IF.                                IX1084.2 136
   001361         139800 RWR-SEQ-TEST-GF-03.                                              IX1084.2
   001362         139900     READ  IX-FS1 END                                             IX1084.2 108
   001363      1  140000              MOVE "READ FAILED " TO RE-MARK                      IX1084.2 227
   001364      1  140100              PERFORM FAIL                                        IX1084.2 423
   001365      1  140200              GO TO RWR-SEQ-WRITE-GF-03-1.                        IX1084.2 1386
   001366         140300     IF SWITCH-IF = 1                                             IX1084.2 136
   001367      1  140400     MOVE "RECORD REPLACED BY REWRITE STATEMENT" TO IX-FS1-REC-120IX1084.2 114
   001368      1  140500        REWRITE IX-FS1R1-F-G-240                                  IX1084.2 113
   001369      2  140600            INVALID KEY   MOVE "REWRITE IS INVALID" TO RE-MARK    IX1084.2 227
   001370      2  140700                          PERFORM FAIL                            IX1084.2 423
   001371      2  140800                          GO TO RWR-SEQ-WRITE-GF-03-1             IX1084.2 1386
   001372      1  140900          NOT INVALID KEY                                         IX1084.2
   001373      2  141000             MOVE 1 TO SWITCH-NOT-INVALID                         IX1084.2 133
   001374      1  141100        END-REWRITE                                               IX1084.2
   001375      1  141200             MOVE 1 TO SWITCH-END-XXX.                            IX1084.2 134
   001376         141300     MOVE 9 TO SWITCH-END-X9X.                                    IX1084.2 135
   001377         141400 RWR-SEQ-TEST-GF-03-1.                                            IX1084.2
   001378         141500     IF SWITCH-NOT-INVALID = 1                                    IX1084.2 133
   001379      1  141600          GO TO RWR-SEQ-PASS-GF-03-1.                             IX1084.2 1384
   001380         141700 RWR-SEQ-FAIL-GF-03-1.                                            IX1084.2
   001381         141800     MOVE "IX-33, 4.6.2                              " TO RE-MARK.IX1084.2 227
   001382         141900     PERFORM FAIL.                                                IX1084.2 423
   001383         142000     GO TO RWR-SEQ-WRITE-GF-03-1.                                 IX1084.2 1386
   001384         142100 RWR-SEQ-PASS-GF-03-1.                                            IX1084.2
   001385         142200     PERFORM PASS.                                                IX1084.2 422
   001386         142300 RWR-SEQ-WRITE-GF-03-1.                                           IX1084.2
   001387         142400     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001388         142500                                                                  IX1084.2
   001389         142600 RWR-SEQ-TEST-GF-03-2.                                            IX1084.2
   001390         142700     MOVE "END-REWRITE" TO FEATURE.                               IX1084.2 218
   001391         142800     MOVE "RWR-SEQ-TEST-GF-03-2"  TO PAR-NAME.                    IX1084.2 222
   001392         142900     IF SWITCH-END-XXX     = 1                                    IX1084.2 134
   001393      1  143000          GO TO RWR-SEQ-PASS-GF-03-2.                             IX1084.2 1398
   001394         143100 RWR-SEQ-FAIL-GF-03-2.                                            IX1084.2
   001395         143200     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   001396         143300     PERFORM FAIL.                                                IX1084.2 423
   001397         143400     GO TO RWR-SEQ-WRITE-GF-03-2.                                 IX1084.2 1400
   001398         143500 RWR-SEQ-PASS-GF-03-2.                                            IX1084.2
   001399         143600     PERFORM PASS.                                                IX1084.2 422
   001400         143700 RWR-SEQ-WRITE-GF-03-2.                                           IX1084.2
   001401         143800     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001402         143900                                                                  IX1084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001403         144000 RWR-SEQ-TEST-GF-03-3.                                            IX1084.2
   001404         144100     MOVE "RWR-SEQ-TEST-GF-03-3"  TO PAR-NAME.                    IX1084.2 222
   001405         144200     IF SWITCH-END-X9X     = 9                                    IX1084.2 135
   001406      1  144300          GO TO RWR-SEQ-PASS-GF-03-3.                             IX1084.2 1411
   001407         144400 RWR-SEQ-FAIL-GF-03-3.                                            IX1084.2
   001408         144500     MOVE "IX-32 4.5.4 (19)                          " TO RE-MARK.IX1084.2 227
   001409         144600     PERFORM FAIL.                                                IX1084.2 423
   001410         144700     GO TO RWR-SEQ-WRITE-GF-03-3.                                 IX1084.2 1413
   001411         144800 RWR-SEQ-PASS-GF-03-3.                                            IX1084.2
   001412         144900     PERFORM PASS.                                                IX1084.2 422
   001413         145000 RWR-SEQ-WRITE-GF-03-3.                                           IX1084.2
   001414         145100     PERFORM PRINT-DETAIL.                                        IX1084.2 426
   001415         145200                                                                  IX1084.2
   001416         145300     CLOSE IX-FS1.                                                IX1084.2 108
   001417         145400                                                                  IX1084.2
   001418         145500                                                                  IX1084.2
   001419         145600 CCVS-EXIT SECTION.                                               IX1084.2
   001420         145700 CCVS-999999.                                                     IX1084.2
   001421         145800     GO TO CLOSE-FILES.                                           IX1084.2 403
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    29
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      212   ALTERNATE-KEY1
      214   ALTERNATE-KEY2
      278   ANSI-REFERENCE . . . . . . . .  505 512 521
      104   C-ABORT. . . . . . . . . . . .  M384 M407
       98   C-ALL. . . . . . . . . . . . .  M409
       94   C-DATE . . . . . . . . . . . .  M386
      100   C-DELETED. . . . . . . . . . .  M411
       99   C-FAIL . . . . . . . . . . . .  M410
      103   C-INDENT
      101   C-INSPECT. . . . . . . . . . .  M412
       96   C-NO-OF-TESTS. . . . . . . . .  M385
      102   C-NOTE
       97   C-OK . . . . . . . . . . . . .  M408
       95   C-TIME . . . . . . . . . . . .  M387
      257   CCVS-C-1 . . . . . . . . . . .  444 490
      262   CCVS-C-2 . . . . . . . . . . .  445 491
      312   CCVS-E-1 . . . . . . . . . . .  450
      317   CCVS-E-2 . . . . . . . . . . .  459 466 473 478
      320   CCVS-E-2-2 . . . . . . . . . .  M458
      325   CCVS-E-3 . . . . . . . . . . .  479
      334   CCVS-E-4 . . . . . . . . . . .  458
      335   CCVS-E-4-1 . . . . . . . . . .  M456
      337   CCVS-E-4-2 . . . . . . . . . .  M457
      279   CCVS-H-1 . . . . . . . . . . .  439 486
      284   CCVS-H-2A. . . . . . . . . . .  440 487
      293   CCVS-H-2B. . . . . . . . . . .  441 488
      305   CCVS-H-3 . . . . . . . . . . .  442 489
      355   CCVS-PGM-ID. . . . . . . . . .  382 392 392 405 535
      199   CHARS-OR-RECORDS . . . . . . .  M537
      239   CM-18V0
      233   COMPUTED-A . . . . . . . . . .  234 236 237 238 239 517 520
      234   COMPUTED-N
      232   COMPUTED-X . . . . . . . . . .  M434 502
      236   COMPUTED-0V18
      238   COMPUTED-14V4
      240   COMPUTED-18V0. . . . . . . . .  M616 M628
      237   COMPUTED-4V14
      256   COR-ANSI-REFERENCE . . . . . .  M512 M514
      247   CORRECT-A. . . . . . . . . . .  248 249 250 251 252 518 520
      248   CORRECT-N
      246   CORRECT-X. . . . . . . . . . .  M435 504
      249   CORRECT-0V18
      251   CORRECT-14V4
      253   CORRECT-18V0 . . . . . . . . .  M615 M627
      250   CORRECT-4V14
      252   CR-18V0
      270   DELETE-COUNTER . . . . . . . .  411 M424 453 469 471
      225   DOTVALUE . . . . . . . . . . .  M429
      276   DUMMY-HOLD . . . . . . . . . .  M483 493
      107   DUMMY-RECORD . . . . . . . . .  M439 M440 M441 M442 M444 M445 M446 M448 M450 M459 M466 M473 M478 M479 483 M484
                                            485 M486 M487 M488 M489 M490 M491 M492 M493 497 M498 M507 M522
      164   DUMMY-WRK-INDENT-5
      160   DUMMY-WRK-REC
      161   DUMMY-WRK1 . . . . . . . . . .  162
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    30
0 Defined   Cross-reference of data names   References

0     162   DUMMY-WRK2
      323   ENDER-DESC . . . . . . . . . .  M461 M472 M477
      271   ERROR-COUNTER. . . . . . . . .  410 M423 452 462 465
      275   ERROR-HOLD . . . . . . . . . .  409 M452 M453 M453 M454 457
      321   ERROR-TOTAL. . . . . . . . . .  M463 M465 M470 M471 M475 M476
      218   FEATURE. . . . . . . . . . . .  M532 M571 M591 M599 M623 M643 M668 M692 M709 M782 M809 M835 M852 M932 M965 M997
                                            M1014 M1048 M1101 M1135 M1168 M1185 M1220 M1274 M1309 M1340 M1357 M1390
      180   FILE-RECORD-INFO . . . . . . .  M400 563 581
      181   FILE-RECORD-INFO-P1-120
      208   FILE-RECORD-INFO-P121-240
      166   FILE-RECORD-INFO-SKELETON. . .  399
      165   FILE-RECORD-INFORMATION-REC
      141   GRP-0001
      137   GRP-0101 . . . . . . . . . . .  553 561 787 814 858 937 970 1020 1106 1140 1191
      349   HYPHEN-LINE. . . . . . . . . .  446 448 492
      315   ID-AGAIN . . . . . . . . . . .  M392
      348   INF-ANSI-REFERENCE . . . . . .  M505 M508 M521 M523
      343   INFO-TEXT. . . . . . . . . . .  M506
      272   INSPECT-COUNTER. . . . . . . .  412 M421 452 474 476
      108   IX-FS1 . . . . . . . . . . . .  73 551 635 641 647 672 715 760 1266 1281 1313 1362 1416
      117   IX-FS1-KEY . . . . . . . . . .  79
      114   IX-FS1-REC-120 . . . . . . . .  M1285 M1317 M1367
      115   IX-FS1-REC-120-240
      149   IX-FS1-STATUS. . . . . . . . .  78 M548 606 M1265 1270 1271 M1272
      113   IX-FS1R1-F-G-240 . . . . . . .  M581 1286 1318 1368
      120   IX-FS2 . . . . . . . . . . . .  80 360 552 635 774 788 815 860 905 924 938 M942 971 M975 1021 M1026 1074 1093
                                            1107 1141 1192 1246
      129   IX-FS2-KEY . . . . . . . . . .  86 M553 M787 M814 M858 M937 M970 M1020 M1106 M1140 M1191
      126   IX-FS2-REC-120 . . . . . . . .  M1111 M1145 M1197
      127   IX-FS2-REC-120-240
      150   IX-FS2-STATUS. . . . . . . . .  85 374 M549 554 M559 604 M773 778 779 M780 M923 928 929 M930 M1092 1097 1098
                                            M1099
      125   IX-FS2R1-F-G-240 . . . . . . .  M563 565 1112 1146 1198
      193   ODO-NUMBER
      220   P-OR-F . . . . . . . . . . . .  M421 M422 M423 M424 431 M434
      222   PAR-NAME . . . . . . . . . . .  M436 M541 M624 M642 M667 M691 M708 M735 M748 M781 M808 M834 M851 M880 M893 M931
                                            M964 M996 M1013 M1049 M1062 M1100 M1134 M1167 M1184 M1221 M1234 M1273 M1308 M1339
                                            M1356 M1391 M1404
      224   PARDOT-X . . . . . . . . . . .  M428
      273   PASS-COUNTER . . . . . . . . .  408 M422 454 456
      105   PRINT-FILE . . . . . . . . . .  71 391 416
      106   PRINT-REC. . . . . . . . . . .  M430 M511 M513
       90   RAW-DATA . . . . . . . . . . .  66 381 383 390 404 406 415
       93   RAW-DATA-KEY . . . . . . . . .  70 M382 M405
       92   RAW-DATA-SATZ. . . . . . . . .  388 413
      227   RE-MARK. . . . . . . . . . . .  M425 M437 M574 M594 M601 M614 M617 M626 M629 M655 M682 M696 M726 M739 M752 M796
                                            M825 M839 M871 M884 M897 M939 M943 M952 M972 M976 M987 M1001 M1022 M1027 M1039
                                            M1053 M1066 M1108 M1113 M1122 M1142 M1147 M1158 M1172 M1193 M1199 M1211 M1225
                                            M1238 M1282 M1287 M1296 M1314 M1319 M1330 M1344 M1363 M1369 M1381 M1395 M1408
      269   REC-CT . . . . . . . . . . . .  427 429 436
      268   REC-SKL-SUB. . . . . . . . . .  M395 M398 400
      277   RECORD-COUNT . . . . . . . . .  M481 482 M494
      203   RECORDS-IN-FILE. . . . . . . .  M539
      187   REELUNIT-NUMBER
      134   SWITCH-END-XXX . . . . . . . .  M557 M578 M587 596 M597 M645 M670 M677 693 M711 M720 736 M784 M811 M820 836 M854
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    31
0 Defined   Cross-reference of data names   References

0                                           M865 881 M934 M967 M982 998 M1016 M1033 1050 M1103 M1137 M1153 1169 M1187 M1205
                                            1222 M1276 M1311 M1325 1341 M1359 M1375 1392
      135   SWITCH-END-X9X . . . . . . . .  M558 M579 M721 749 M866 894 M1034 1063 M1206 1235 M1376 1405
      136   SWITCH-IF. . . . . . . . . . .  M712 714 M855 859 M1017 1025 M1188 1196 M1360 1366
      133   SWITCH-NOT-INVALID . . . . . .  M556 M567 568 M569 M577 M584 588 M589 M644 M650 652 M669 M675 679 M710 M718 723
                                            M783 M791 793 M810 M818 822 M853 M863 868 M933 M947 949 M966 M980 984 M1015 M1031
                                            1036 M1102 M1117 1119 M1136 M1151 1155 M1186 M1203 1208 M1275 M1291 1293 M1310
                                            M1323 1327 M1358 M1373 1378
      132   SWITCHES-FOR-TEST
      228   TEST-COMPUTED. . . . . . . . .  511
      243   TEST-CORRECT . . . . . . . . .  513
      296   TEST-ID. . . . . . . . . . . .  M392
      216   TEST-RESULTS . . . . . . . . .  M393 430
      274   TOTAL-ERROR
      191   UPDATE-NUMBER
      142   WRK-CS-09V00-012 . . . . . . .  365 M544 M766 M916 M1085 M1258
      143   WRK-CS-09V00-013 . . . . . . .  M362 M545 M767 M917 M1086 M1259
      144   WRK-CS-09V00-014 . . . . . . .  M370 M545 613 616 M768 M918 M1087 M1260
      145   WRK-CS-09V00-015 . . . . . . .  M546 M769 M919 M1088 M1261
      146   WRK-CS-09V00-016 . . . . . . .  M546 M605 M607 M770 M920 M1089 M1262
      147   WRK-CS-09V00-017 . . . . . . .  M372 M547 M771 M921 M1090 M1263
      148   WRK-CS-09V00-018 . . . . . . .  M547 M772 M922 M1091 M1264
      139   WRK-DU-09V00-001 . . . . . . .  M550 M560 M786 M813 M857 M936 M969 M1019 M1105 M1139 M1190
      151   WRK-XN-0002-001. . . . . . . .  M554 M778 M779 M928 M929 M1097 M1098 M1270 M1271
      152   WRK-XN-0002-002. . . . . . . .  M374 M775 M925 M1094 M1267
      153   WRK-XN-0002-003. . . . . . . .  M375 M776 M926 M1095 M1268
      154   WRK-XN-0002-004. . . . . . . .  M777 M927 M1096 M1269
      155   WRK-XN-0002-005
      156   WRK-XN-0002-006
      157   WRK-XN-0002-007
      158   WRK-XN-0002-008
      159   WRK-XN-0002-009
      201   XBLOCK-SIZE. . . . . . . . . .  M538
      183   XFILE-NAME . . . . . . . . . .  M533 M562 M580
      205   XFILE-ORGANIZATION . . . . . .  M540
      207   XLABEL-TYPE. . . . . . . . . .  M542
      195   XPROGRAM-NAME. . . . . . . . .  M535
      210   XRECORD-KEY. . . . . . . . . .  M561
      197   XRECORD-LENGTH . . . . . . . .  M536
      185   XRECORD-NAME . . . . . . . . .  M534
      189   XRECORD-NUMBER . . . . . . . .  373 M543 560 608 M610 625 628
      345   XXCOMPUTED . . . . . . . . . .  M520
      347   XXCORRECT. . . . . . . . . . .  M520
      340   XXINFO . . . . . . . . . . . .  507 522
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    32
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

      516   BAIL-OUT . . . . . . . . . . .  P433
      524   BAIL-OUT-EX. . . . . . . . . .  E433 G518
      519   BAIL-OUT-WRITE . . . . . . . .  G517
      499   BLANK-LINE-PRINT
     1419   CCVS-EXIT. . . . . . . . . . .  G575 G595 G603
      401   CCVS-INIT-EXIT
      397   CCVS-INIT-FILE . . . . . . . .  P396
     1420   CCVS-999999
      379   CCVS1
      525   CCVS1-EXIT . . . . . . . . . .  G402
      403   CLOSE-FILES. . . . . . . . . .  G1421
      443   COLUMN-NAMES-ROUTINE . . . . .  E394
      424   DE-LETE
      951   DELETE-FAIL-GF-01
      986   DELETE-FAIL-GF-02-1
     1000   DELETE-FAIL-GF-02-2
     1038   DELETE-FAIL-GF-03-1
     1052   DELETE-FAIL-GF-03-2
     1065   DELETE-FAIL-GF-03-3
      915   DELETE-INIT-GF-01
      963   DELETE-INIT-GF-02
     1012   DELETE-INIT-GF-03
      955   DELETE-PASS-GF-01. . . . . . .  G950
      990   DELETE-PASS-GF-02-1. . . . . .  G985
     1004   DELETE-PASS-GF-02-2. . . . . .  G999
     1042   DELETE-PASS-GF-03-1. . . . . .  G1037
     1056   DELETE-PASS-GF-03-2. . . . . .  G1051
     1069   DELETE-PASS-GF-03-3. . . . . .  G1064
      948   DELETE-TEST-GF-01
      935   DELETE-TEST-GF-01-0
      968   DELETE-TEST-GF-02
      983   DELETE-TEST-GF-02-1
      995   DELETE-TEST-GF-02-2
     1018   DELETE-TEST-GF-03
     1035   DELETE-TEST-GF-03-1
     1047   DELETE-TEST-GF-03-2
     1061   DELETE-TEST-GF-03-3
      957   DELETE-WRITE-GF-01 . . . . . .  G941 G945 G954
      992   DELETE-WRITE-GF-02-1 . . . . .  G974 G978 G989
     1006   DELETE-WRITE-GF-02-2 . . . . .  G1003
     1044   DELETE-WRITE-GF-03-1 . . . . .  G1024 G1029 G1041
     1058   DELETE-WRITE-GF-03-2 . . . . .  G1055
     1071   DELETE-WRITE-GF-03-3 . . . . .  G1068
      389   END-E-1. . . . . . . . . . . .  G383 G388
      414   END-E-2. . . . . . . . . . . .  G406 G413
      447   END-ROUTINE. . . . . . . . . .  P416
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    33
0 Defined   Cross-reference of procedures   References

0     451   END-ROUTINE-1
      460   END-ROUTINE-12
      468   END-ROUTINE-13 . . . . . . . .  E416
      449   END-RTN-EXIT
      423   FAIL . . . . . . . . . . . . .  P572 P592 P602 P618 P630 P656 P683 P697 P727 P740 P753 P797 P826 P840 P872 P885
                                            P898 P940 P944 P953 P973 P977 P988 P1002 P1023 P1028 P1040 P1054 P1067 P1109
                                            P1114 P1123 P1143 P1148 P1159 P1173 P1194 P1200 P1212 P1226 P1239 P1283 P1288
                                            P1297 P1315 P1320 P1331 P1345 P1364 P1370 P1382 P1396 P1409
      501   FAIL-ROUTINE . . . . . . . . .  P432
      515   FAIL-ROUTINE-EX. . . . . . . .  E432 G509
      510   FAIL-ROUTINE-WRITE . . . . . .  G503 G504
      438   HEAD-ROUTINE . . . . . . . . .  P394
      421   INSPT
      359   IX-FS2-01
      376   IX-FS2-01-EXIT . . . . . . . .  G366
      361   IX-FS2-01-01
      367   IX-FS2-01-03 . . . . . . . . .  D363
      371   IX-FS2-01-05 . . . . . . . . .  D364
      380   OPEN-FILES
      422   PASS . . . . . . . . . . . . .  P620 P632 P659 P686 P700 P730 P743 P756 P800 P829 P843 P875 P888 P901 P956 P991
                                            P1005 P1043 P1057 P1070 P1126 P1162 P1176 P1215 P1229 P1242 P1300 P1334 P1348
                                            P1385 P1399 P1412
      426   PRINT-DETAIL . . . . . . . . .  P621 P633 P661 P688 P702 P732 P745 P758 P802 P831 P845 P877 P890 P903 P958 P993
                                            P1007 P1045 P1059 P1072 P1128 P1164 P1178 P1217 P1231 P1244 P1302 P1336 P1350
                                            P1387 P1401 P1414
      654   READ-FAIL-F1-01. . . . . . . .  G648
      681   READ-FAIL-F1-02-1. . . . . . .  G673
      695   READ-FAIL-F1-02-2
      725   READ-FAIL-F1-03-1. . . . . . .  G716
      738   READ-FAIL-F1-03-2
      751   READ-FAIL-F1-03-3
      795   READ-FAIL-F2-01. . . . . . . .  G789
      824   READ-FAIL-F2-02-1. . . . . . .  G816
      838   READ-FAIL-F2-02-2
      870   READ-FAIL-F2-03-1. . . . . . .  G861
      883   READ-FAIL-F2-03-2
      896   READ-FAIL-F2-03-3
      640   READ-INIT-F1-01
      666   READ-INIT-F1-02
      707   READ-INIT-F1-03
      765   READ-INIT-F2-01
      807   READ-INIT-F2-02
      850   READ-INIT-F2-03
      658   READ-PASS-F1-01. . . . . . . .  G653
      685   READ-PASS-F1-02-1. . . . . . .  G680
      699   READ-PASS-F1-02-2. . . . . . .  G694
      729   READ-PASS-F1-03-1. . . . . . .  G724
      742   READ-PASS-F1-03-2. . . . . . .  G737
      755   READ-PASS-F1-03-3. . . . . . .  G750
      799   READ-PASS-F2-01. . . . . . . .  G794
      828   READ-PASS-F2-02-1. . . . . . .  G823
      842   READ-PASS-F2-02-2. . . . . . .  G837
      874   READ-PASS-F2-03-1. . . . . . .  G869
      887   READ-PASS-F2-03-2. . . . . . .  G882
      900   READ-PASS-F2-03-3. . . . . . .  G895
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    34
0 Defined   Cross-reference of procedures   References

0     651   READ-TEST-F1-01
      646   READ-TEST-F1-01-0
      671   READ-TEST-F1-02
      678   READ-TEST-F1-02-1
      690   READ-TEST-F1-02-2
      713   READ-TEST-F1-03
      722   READ-TEST-F1-03-1
      734   READ-TEST-F1-03-2
      747   READ-TEST-F1-03-3
      792   READ-TEST-F2-01
      785   READ-TEST-F2-01-0
      812   READ-TEST-F2-02
      821   READ-TEST-F2-02-1
      833   READ-TEST-F2-02-2
      856   READ-TEST-F2-03
      867   READ-TEST-F2-03-1
      879   READ-TEST-F2-03-2
      892   READ-TEST-F2-03-3
      660   READ-WRITE-F1-01 . . . . . . .  G657
      687   READ-WRITE-F1-02-1 . . . . . .  G684
      701   READ-WRITE-F1-02-2 . . . . . .  G698
      731   READ-WRITE-F1-03-1 . . . . . .  G728
      744   READ-WRITE-F1-03-2 . . . . . .  G741
      757   READ-WRITE-F1-03-3 . . . . . .  G754
      801   READ-WRITE-F2-01 . . . . . . .  G798
      830   READ-WRITE-F2-02-1 . . . . . .  G827
      844   READ-WRITE-F2-02-2 . . . . . .  G841
      876   READ-WRITE-F2-03-1 . . . . . .  G873
      889   READ-WRITE-F2-03-2 . . . . . .  G886
      902   READ-WRITE-F2-03-3 . . . . . .  G899
     1121   REWRITE-FAIL-GF-01
     1157   REWRITE-FAIL-GF-02-1
     1171   REWRITE-FAIL-GF-02-2
     1210   REWRITE-FAIL-GF-03-1
     1224   REWRITE-FAIL-GF-03-2
     1237   REWRITE-FAIL-GF-03-3
     1084   REWRITE-INIT-GF-01
     1133   REWRITE-INIT-GF-02
     1183   REWRITE-INIT-GF-03
     1125   REWRITE-PASS-GF-01 . . . . . .  G1120
     1161   REWRITE-PASS-GF-02-1 . . . . .  G1156
     1175   REWRITE-PASS-GF-02-2 . . . . .  G1170
     1214   REWRITE-PASS-GF-03-1 . . . . .  G1209
     1228   REWRITE-PASS-GF-03-2 . . . . .  G1223
     1241   REWRITE-PASS-GF-03-3 . . . . .  G1236
     1118   REWRITE-TEST-GF-01
     1104   REWRITE-TEST-GF-01-0
     1138   REWRITE-TEST-GF-02
     1154   REWRITE-TEST-GF-02-1
     1166   REWRITE-TEST-GF-02-2
     1189   REWRITE-TEST-GF-03
     1207   REWRITE-TEST-GF-03-1
     1219   REWRITE-TEST-GF-03-2
     1233   REWRITE-TEST-GF-03-3
     1127   REWRITE-WRITE-GF-01. . . . . .  G1110 G1115 G1124
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    35
0 Defined   Cross-reference of procedures   References

0    1163   REWRITE-WRITE-GF-02-1. . . . .  G1144 G1149 G1160
     1177   REWRITE-WRITE-GF-02-2. . . . .  G1174
     1216   REWRITE-WRITE-GF-03-1. . . . .  G1195 G1201 G1213
     1230   REWRITE-WRITE-GF-03-2. . . . .  G1227
     1243   REWRITE-WRITE-GF-03-3. . . . .  G1240
     1295   RWR-SEQ-FAIL-GF-01
     1329   RWR-SEQ-FAIL-GF-02-1
     1343   RWR-SEQ-FAIL-GF-02-2
     1380   RWR-SEQ-FAIL-GF-03-1
     1394   RWR-SEQ-FAIL-GF-03-2
     1407   RWR-SEQ-FAIL-GF-03-3
     1257   RWR-SEQ-INIT-GF-01
     1307   RWR-SEQ-INIT-GF-02
     1355   RWR-SEQ-INIT-GF-03
     1299   RWR-SEQ-PASS-GF-01 . . . . . .  G1294
     1333   RWR-SEQ-PASS-GF-02-1 . . . . .  G1328
     1347   RWR-SEQ-PASS-GF-02-2 . . . . .  G1342
     1384   RWR-SEQ-PASS-GF-03-1 . . . . .  G1379
     1398   RWR-SEQ-PASS-GF-03-2 . . . . .  G1393
     1411   RWR-SEQ-PASS-GF-03-3 . . . . .  G1406
     1292   RWR-SEQ-TEST-GF-01
     1277   RWR-SEQ-TEST-GF-01-0
     1312   RWR-SEQ-TEST-GF-02
     1326   RWR-SEQ-TEST-GF-02-1
     1338   RWR-SEQ-TEST-GF-02-2
     1361   RWR-SEQ-TEST-GF-03
     1377   RWR-SEQ-TEST-GF-03-1
     1389   RWR-SEQ-TEST-GF-03-2
     1403   RWR-SEQ-TEST-GF-03-3
     1301   RWR-SEQ-WRITE-GF-01. . . . . .  G1284 G1289 G1298
     1335   RWR-SEQ-WRITE-GF-02-1. . . . .  G1316 G1321 G1332
     1349   RWR-SEQ-WRITE-GF-02-2. . . . .  G1346
     1386   RWR-SEQ-WRITE-GF-03-1. . . . .  G1365 G1371 G1383
     1400   RWR-SEQ-WRITE-GF-03-2. . . . .  G1397
     1413   RWR-SEQ-WRITE-GF-03-3. . . . .  G1410
      527   SECT-IX-04-001
      419   TERMINATE-CALL
      417   TERMINATE-CCVS
      531   WRITE-INIT-GF-01
      480   WRITE-LINE . . . . . . . . . .  P430 P431 P439 P440 P441 P442 P444 P445 P446 P448 P450 P459 P467 P473 P478 P479
                                            P507 P511 P513 P522
      555   WRITE-TEST-GF-01 . . . . . . .  G611
      564   WRITE-TEST-GF-01-1
      576   WRITE-TEST-GF-01-2
      586   WRITE-TEST-GF-01-2-1 . . . . .  G582
      612   WRITE-TEST-GF-01-3 . . . . . .  G609
      622   WRITE-TEST-GF-02
      496   WRT-LN . . . . . . . . . . . .  P486 P487 P488 P489 P490 P491 P492 P495 P500
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    36
0 Defined   Cross-reference of programs     References

        3   IX108A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX108A    Date 06/04/2022  Time 12:00:36   Page    37
0LineID  Message code  Message text

     75  IGYDS1298-I   Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX044" was treated as comments.

     82  IGYDS1298-I   Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX045" was treated as comments.

    105  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    108  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

                       Same message on line:    120

    108  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.

                       Same message on line:    120
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       7           7
-* Statistics for COBOL program IX108A:
 *    Source records = 1421
 *    Data Division statements = 135
 *    Procedure Division statements = 765
 *    Generated COBOL statements = 0
 *    Program complexity factor = 778
0End of compilation 1,  program IX108A,  highest severity 0.
0Return code 0
