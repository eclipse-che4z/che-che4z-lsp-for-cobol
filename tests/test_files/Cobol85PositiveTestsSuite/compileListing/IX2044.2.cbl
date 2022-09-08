1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:09   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:09   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2044.2
   000002         000200 PROGRAM-ID.                                                      IX2044.2
   000003         000300     IX204A.                                                      IX2044.2
   000004         000500*                                                              *  IX2044.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2044.2
   000006         000700*                                                              *  IX2044.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2044.2
   000008         000900*                                                              *  IX2044.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2044.2
   000010         001100*                                                              *  IX2044.2
   000011         001300*IX204A                                                           IX2044.2
   000012         001500*                                                                 IX2044.2
   000013         001600*    NEW TESTS:                                                   IX2044.2
   000014         001700*                         CLOSE  ... <WITH LOCK>                  IX2044.2
   000015         001800*                                                                 IX2044.2
   000016         001900*                                                                 IX2044.2
   000017         002000*    THIS PROGRAM TESTS THE SYNTACTICAL CONSTRUCTS AND SEMANTIC   IX2044.2
   000018         002100*    ACTIONS ASSOCIATED WITH THE FOLLOWING ELEMENTS:              IX2044.2
   000019         002200*                                                                 IX2044.2
   000020         002300*    (1) FILE STATUS   (ONLY 00 & 10)                             IX2044.2
   000021         002400*    (2) USE AFTER ERROR PROCEDURE ON FILE-NAME                   IX2044.2
   000022         002500*    (3) READ                                                     IX2044.2
   000023         002600*    (4) WRITE                                                    IX2044.2
   000024         002700*    (5) REWRITE                                                  IX2044.2
   000025         002800*    (6) RECORD KEY                                               IX2044.2
   000026         002900*    (7) ACCESS                                                   IX2044.2
   000027         003000*                                                                 IX2044.2
   000028         003100*    THIS PROGRAM CREATES AN INDEXED FILE SEQUENTIALLY (ACCESS    IX2044.2
   000029         003200*    MODE DYMANIC) AND THEN UPDATES SELECTIVE RECORDS OF THE FILE.IX2044.2
   000030         003300*    THE FILE STATUS CONTENTS ARE CAPTURED AND TESTED FOR ACCURACYIX2044.2
   000031         003400*    FOR EACH OPEN, CLOSE, READ AND REWRITE STATEMENT USED.  THE  IX2044.2
   000032         003500*    READ, WRITE AND REWRITE STATEMENTS ARE USED WITHOUT THE      IX2044.2
   000033         003600*    APPROPRIATE AT END OR INVALID KEY PHRASES.  THE OMISSION OF  IX2044.2
   000034         003700*    THESE PHRASES ARE PERMITTED IF AN APPLICABLE USE PROCEDURE   IX2044.2
   000035         003800*    HAS BEEN SPECIFIED.                                          IX2044.2
   000036         003900*                                                                 IX2044.2
   000037         004000*                                                                 IX2044.2
   000038         004100*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX2044.2
   000039         004200*                                                                 IX2044.2
   000040         004300*             X-25   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX2044.2
   000041         004400*                    CLAUSE FOR DATA FILE IX-FD2                  IX2044.2
   000042         004500*             X-45   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX2044.2
   000043         004600*                    CLAUSE FOR INDEX FILE IX-FD2                 IX2044.2
   000044         004700*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX2044.2
   000045         004800*             X-62   IMPLEMENTOR-NAME FOR RAW-DATA                IX2044.2
   000046         004900*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX2044.2
   000047         005000*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX2044.2
   000048         005100*             X-84   LABEL RECORDS    FOR PRINT-FILEPUTER         IX2044.2
   000049         005200*                                                                 IX2044.2
   000050         005300*         NOTE:  X-CARDS 45, 62 AND 84      ARE OPTIONAL          IX2044.2
   000051         005400*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX2044.2
   000052         005500*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX2044.2
   000053         005600*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX2044.2
   000054         005700*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX2044.2
   000055         005800*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX2044.2
   000056         005900*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX2044.2
   000057         006000*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX2044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX2044.2
   000059         006200*               THEY ARE AS FOLLOWS                               IX2044.2
   000060         006300*                                                                 IX2044.2
   000061         006400*                  P  SELECTS X-CARDS 62                          IX2044.2
   000062         006500*                  J  SELECTS X-CARD 45                           IX2044.2
   000063         006600*                  C  SELECTS X-CARD 84                           IX2044.2
   000064         006700*                                                                 IX2044.2
   000065         006900 ENVIRONMENT DIVISION.                                            IX2044.2
   000066         007000 CONFIGURATION SECTION.                                           IX2044.2
   000067         007100 SOURCE-COMPUTER.                                                 IX2044.2
   000068         007200     XXXXX082.                                                    IX2044.2
   000069         007300 OBJECT-COMPUTER.                                                 IX2044.2
   000070         007400     XXXXX083.                                                    IX2044.2
   000071         007500 INPUT-OUTPUT SECTION.                                            IX2044.2
   000072         007600 FILE-CONTROL.                                                    IX2044.2
   000073         007700     SELECT RAW-DATA   ASSIGN TO                                  IX2044.2 90
   000074         007800     XXXXX062                                                     IX2044.2
   000075         007900            ORGANIZATION IS INDEXED                               IX2044.2
   000076         008000            ACCESS MODE IS RANDOM                                 IX2044.2
   000077         008100            RECORD KEY IS RAW-DATA-KEY.                           IX2044.2 93
   000078         008200     SELECT PRINT-FILE ASSIGN TO                                  IX2044.2 105
   000079         008300     XXXXX055.                                                    IX2044.2
   000080         008400     SELECT IX-FD2 ASSIGN                                         IX2044.2 108
   000081         008500     XXXXX025                                                     IX2044.2
   000082         008600     XXXXX045                                                     IX2044.2

 ==000082==> IGYDS1298-I Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX045" was treated as comments.

   000083         008700             ORGANIZATION IS INDEXED                              IX2044.2
   000084         008800        ACCESS  DYNAMIC                                           IX2044.2
   000085         008900        FILE STATUS IS IX-FD2-STATUS                              IX2044.2 132
   000086         009000        RECORD  IX-FD2-KEY.                                       IX2044.2 117
   000087         009100 DATA DIVISION.                                                   IX2044.2
   000088         009200 FILE SECTION.                                                    IX2044.2
   000089         009300                                                                  IX2044.2
   000090         009400 FD  RAW-DATA.                                                    IX2044.2
   000091         009500                                                                  IX2044.2
   000092         009600 01  RAW-DATA-SATZ.                                               IX2044.2
   000093         009700     05  RAW-DATA-KEY        PIC X(6).                            IX2044.2
   000094         009800     05  C-DATE              PIC 9(6).                            IX2044.2
   000095         009900     05  C-TIME              PIC 9(8).                            IX2044.2
   000096         010000     05  C-NO-OF-TESTS       PIC 99.                              IX2044.2
   000097         010100     05  C-OK                PIC 999.                             IX2044.2
   000098         010200     05  C-ALL               PIC 999.                             IX2044.2
   000099         010300     05  C-FAIL              PIC 999.                             IX2044.2
   000100         010400     05  C-DELETED           PIC 999.                             IX2044.2
   000101         010500     05  C-INSPECT           PIC 999.                             IX2044.2
   000102         010600     05  C-NOTE              PIC X(13).                           IX2044.2
   000103         010700     05  C-INDENT            PIC X.                               IX2044.2
   000104         010800     05  C-ABORT             PIC X(8).                            IX2044.2
   000105         010900 FD  PRINT-FILE.                                                  IX2044.2

 ==000105==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000106         011000 01  PRINT-REC PICTURE X(120).                                    IX2044.2
   000107         011100 01  DUMMY-RECORD PICTURE X(120).                                 IX2044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000108         011200 FD  IX-FD2                                                       IX2044.2

 ==000108==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000108==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000109         011300     LABEL RECORDS ARE STANDARD                                   IX2044.2
   000110         011400     DATA RECORDS IX-FD2R1-F-G-240                                IX2044.2 *
   000111         011500     BLOCK CONTAINS 480                                           IX2044.2
   000112         011600     RECORD CONTAINS  240  CHARACTERS.                            IX2044.2
   000113         011700 01  IX-FD2R1-F-G-240.                                            IX2044.2
   000114         011800     05 IX-FD2-REC-120    PIC X(120).                             IX2044.2
   000115         011900     05 IX-FD2-REC-120-240.                                       IX2044.2
   000116         012000     10  FILLER PICTURE X(8).                                     IX2044.2
   000117         012100     10  IX-FD2-KEY PIC X(29).                                    IX2044.2
   000118         012200     10  FILLER PIC X(83).                                        IX2044.2
   000119         012300 WORKING-STORAGE SECTION.                                         IX2044.2
   000120         012400 01  GRP-0101.                                                    IX2044.2
   000121         012500     02 FILLER PIC X(10) VALUE "ABCD921XYZ".                      IX2044.2
   000122         012600     02  WRK-DU-09V00-001 PIC 9(9) VALUE ZERO.                    IX2044.2 IMP
   000123         012700     02 FILLER PIC X(10) VALUE "Z2F()$+-AB".                      IX2044.2
   000124         012800 01  GRP-0001.                                                    IX2044.2
   000125         012900     05 WRK-CS-09V00-012  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2044.2 IMP
   000126         013000     05 WRK-CS-09V00-013  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2044.2 IMP
   000127         013100     05 WRK-CS-09V00-014  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2044.2 IMP
   000128         013200     05 WRK-CS-09V00-015  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2044.2 IMP
   000129         013300     05 WRK-CS-09V00-016  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2044.2 IMP
   000130         013400     05 WRK-CS-09V00-017  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2044.2 IMP
   000131         013500     05 WRK-CS-09V00-018  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2044.2 IMP
   000132         013600     05 IX-FD2-STATUS     PIC  XX  VALUE  SPACE.                  IX2044.2 IMP
   000133         013700     05 WRK-XN-0002-001   PIC  X(2) VALUE  SPACE.                 IX2044.2 IMP
   000134         013800     05 WRK-XN-0002-002   PIC  X(2) VALUE  SPACE.                 IX2044.2 IMP
   000135         013900     05 WRK-XN-0002-003   PIC  X(2) VALUE  SPACE.                 IX2044.2 IMP
   000136         014000     05 WRK-XN-0002-004   PIC  X(2) VALUE  SPACE.                 IX2044.2 IMP
   000137         014100     05 WRK-XN-0002-005   PIC  X(2) VALUE  SPACE.                 IX2044.2 IMP
   000138         014200     05 WRK-XN-0002-006   PIC  X(2) VALUE  SPACE.                 IX2044.2 IMP
   000139         014300     05 WRK-XN-0002-007   PIC  X(2) VALUE  SPACE.                 IX2044.2 IMP
   000140         014400     05 WRK-XN-0002-008   PIC  X(2) VALUE  SPACE.                 IX2044.2 IMP
   000141         014500     05 WRK-XN-0002-009   PIC  X(2) VALUE  SPACE.                 IX2044.2 IMP
   000142         014600 01  DUMMY-WRK-REC.                                               IX2044.2
   000143         014700     02 DUMMY-WRK1       PIC X(120).                              IX2044.2
   000144         014800     02 DUMMY-WRK2  REDEFINES  DUMMY-WRK1.                        IX2044.2 143
   000145         014900        03 FILLER   PIC X(5).                                     IX2044.2
   000146         015000        03 DUMMY-WRK-INDENT-5  PIC X(115).                        IX2044.2
   000147         015100 01  FILE-RECORD-INFORMATION-REC.                                 IX2044.2
   000148         015200     03 FILE-RECORD-INFO-SKELETON.                                IX2044.2
   000149         015300        05 FILLER                 PICTURE X(48)       VALUE       IX2044.2
   000150         015400             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2044.2
   000151         015500        05 FILLER                 PICTURE X(46)       VALUE       IX2044.2
   000152         015600             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2044.2
   000153         015700        05 FILLER                 PICTURE X(26)       VALUE       IX2044.2
   000154         015800             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2044.2
   000155         015900        05 FILLER                 PICTURE X(37)       VALUE       IX2044.2
   000156         016000             ",RECKEY=                             ".             IX2044.2
   000157         016100        05 FILLER                 PICTURE X(38)       VALUE       IX2044.2
   000158         016200             ",ALTKEY1=                             ".            IX2044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000159         016300        05 FILLER                 PICTURE X(38)       VALUE       IX2044.2
   000160         016400             ",ALTKEY2=                             ".            IX2044.2
   000161         016500        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2044.2 IMP
   000162         016600     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2044.2
   000163         016700        05 FILE-RECORD-INFO-P1-120.                               IX2044.2
   000164         016800           07 FILLER              PIC X(5).                       IX2044.2
   000165         016900           07 XFILE-NAME           PIC X(6).                      IX2044.2
   000166         017000           07 FILLER              PIC X(8).                       IX2044.2
   000167         017100           07 XRECORD-NAME         PIC X(6).                      IX2044.2
   000168         017200           07 FILLER              PIC X(1).                       IX2044.2
   000169         017300           07 REELUNIT-NUMBER     PIC 9(1).                       IX2044.2
   000170         017400           07 FILLER              PIC X(7).                       IX2044.2
   000171         017500           07 XRECORD-NUMBER       PIC 9(6).                      IX2044.2
   000172         017600           07 FILLER              PIC X(6).                       IX2044.2
   000173         017700           07 UPDATE-NUMBER       PIC 9(2).                       IX2044.2
   000174         017800           07 FILLER              PIC X(5).                       IX2044.2
   000175         017900           07 ODO-NUMBER          PIC 9(4).                       IX2044.2
   000176         018000           07 FILLER              PIC X(5).                       IX2044.2
   000177         018100           07 XPROGRAM-NAME        PIC X(5).                      IX2044.2
   000178         018200           07 FILLER              PIC X(7).                       IX2044.2
   000179         018300           07 XRECORD-LENGTH       PIC 9(6).                      IX2044.2
   000180         018400           07 FILLER              PIC X(7).                       IX2044.2
   000181         018500           07 CHARS-OR-RECORDS    PIC X(2).                       IX2044.2
   000182         018600           07 FILLER              PIC X(1).                       IX2044.2
   000183         018700           07 XBLOCK-SIZE          PIC 9(4).                      IX2044.2
   000184         018800           07 FILLER              PIC X(6).                       IX2044.2
   000185         018900           07 RECORDS-IN-FILE     PIC 9(6).                       IX2044.2
   000186         019000           07 FILLER              PIC X(5).                       IX2044.2
   000187         019100           07 XFILE-ORGANIZATION   PIC X(2).                      IX2044.2
   000188         019200           07 FILLER              PIC X(6).                       IX2044.2
   000189         019300           07 XLABEL-TYPE          PIC X(1).                      IX2044.2
   000190         019400        05 FILE-RECORD-INFO-P121-240.                             IX2044.2
   000191         019500           07 FILLER              PIC X(8).                       IX2044.2
   000192         019600           07 XRECORD-KEY          PIC X(29).                     IX2044.2
   000193         019700           07 FILLER              PIC X(9).                       IX2044.2
   000194         019800           07 ALTERNATE-KEY1      PIC X(29).                      IX2044.2
   000195         019900           07 FILLER              PIC X(9).                       IX2044.2
   000196         020000           07 ALTERNATE-KEY2      PIC X(29).                      IX2044.2
   000197         020100           07 FILLER              PIC X(7).                       IX2044.2
   000198         020200 01  TEST-RESULTS.                                                IX2044.2
   000199         020300     02 FILLER                   PIC X      VALUE SPACE.          IX2044.2 IMP
   000200         020400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2044.2 IMP
   000201         020500     02 FILLER                   PIC X      VALUE SPACE.          IX2044.2 IMP
   000202         020600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2044.2 IMP
   000203         020700     02 FILLER                   PIC X      VALUE SPACE.          IX2044.2 IMP
   000204         020800     02  PAR-NAME.                                                IX2044.2
   000205         020900       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2044.2 IMP
   000206         021000       03  PARDOT-X              PIC X      VALUE SPACE.          IX2044.2 IMP
   000207         021100       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2044.2 IMP
   000208         021200     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2044.2 IMP
   000209         021300     02 RE-MARK                  PIC X(61).                       IX2044.2
   000210         021400 01  TEST-COMPUTED.                                               IX2044.2
   000211         021500     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2044.2 IMP
   000212         021600     02 FILLER                   PIC X(17)  VALUE                 IX2044.2
   000213         021700            "       COMPUTED=".                                   IX2044.2
   000214         021800     02 COMPUTED-X.                                               IX2044.2
   000215         021900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2044.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000216         022000     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2044.2 215
   000217         022100                                 PIC -9(9).9(9).                  IX2044.2
   000218         022200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2044.2 215
   000219         022300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2044.2 215
   000220         022400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2044.2 215
   000221         022500     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2044.2 215
   000222         022600         04 COMPUTED-18V0                    PIC -9(18).          IX2044.2
   000223         022700         04 FILLER                           PIC X.               IX2044.2
   000224         022800     03 FILLER PIC X(50) VALUE SPACE.                             IX2044.2 IMP
   000225         022900 01  TEST-CORRECT.                                                IX2044.2
   000226         023000     02 FILLER PIC X(30) VALUE SPACE.                             IX2044.2 IMP
   000227         023100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2044.2
   000228         023200     02 CORRECT-X.                                                IX2044.2
   000229         023300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2044.2 IMP
   000230         023400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2044.2 229
   000231         023500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2044.2 229
   000232         023600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2044.2 229
   000233         023700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2044.2 229
   000234         023800     03      CR-18V0 REDEFINES CORRECT-A.                         IX2044.2 229
   000235         023900         04 CORRECT-18V0                     PIC -9(18).          IX2044.2
   000236         024000         04 FILLER                           PIC X.               IX2044.2
   000237         024100     03 FILLER PIC X(2) VALUE SPACE.                              IX2044.2 IMP
   000238         024200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2044.2 IMP
   000239         024300 01  CCVS-C-1.                                                    IX2044.2
   000240         024400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2044.2
   000241         024500-    "SS  PARAGRAPH-NAME                                          IX2044.2
   000242         024600-    "       REMARKS".                                            IX2044.2
   000243         024700     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2044.2 IMP
   000244         024800 01  CCVS-C-2.                                                    IX2044.2
   000245         024900     02 FILLER                     PIC X        VALUE SPACE.      IX2044.2 IMP
   000246         025000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2044.2
   000247         025100     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2044.2 IMP
   000248         025200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2044.2
   000249         025300     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2044.2 IMP
   000250         025400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2044.2 IMP
   000251         025500 01  REC-CT                        PIC 99       VALUE ZERO.       IX2044.2 IMP
   000252         025600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2044.2 IMP
   000253         025700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2044.2 IMP
   000254         025800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2044.2 IMP
   000255         025900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2044.2 IMP
   000256         026000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2044.2 IMP
   000257         026100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2044.2 IMP
   000258         026200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2044.2 IMP
   000259         026300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2044.2 IMP
   000260         026400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2044.2 IMP
   000261         026500 01  CCVS-H-1.                                                    IX2044.2
   000262         026600     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2044.2 IMP
   000263         026700     02  FILLER                    PIC X(42)    VALUE             IX2044.2
   000264         026800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2044.2
   000265         026900     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2044.2 IMP
   000266         027000 01  CCVS-H-2A.                                                   IX2044.2
   000267         027100   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2044.2 IMP
   000268         027200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2044.2
   000269         027300   02  FILLER                        PIC XXXX   VALUE             IX2044.2
   000270         027400     "4.2 ".                                                      IX2044.2
   000271         027500   02  FILLER                        PIC X(28)  VALUE             IX2044.2
   000272         027600            " COPY - NOT FOR DISTRIBUTION".                       IX2044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000273         027700   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2044.2 IMP
   000274         027800                                                                  IX2044.2
   000275         027900 01  CCVS-H-2B.                                                   IX2044.2
   000276         028000   02  FILLER                        PIC X(15)  VALUE             IX2044.2
   000277         028100            "TEST RESULT OF ".                                    IX2044.2
   000278         028200   02  TEST-ID                       PIC X(9).                    IX2044.2
   000279         028300   02  FILLER                        PIC X(4)   VALUE             IX2044.2
   000280         028400            " IN ".                                               IX2044.2
   000281         028500   02  FILLER                        PIC X(12)  VALUE             IX2044.2
   000282         028600     " HIGH       ".                                              IX2044.2
   000283         028700   02  FILLER                        PIC X(22)  VALUE             IX2044.2
   000284         028800            " LEVEL VALIDATION FOR ".                             IX2044.2
   000285         028900   02  FILLER                        PIC X(58)  VALUE             IX2044.2
   000286         029000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2044.2
   000287         029100 01  CCVS-H-3.                                                    IX2044.2
   000288         029200     02  FILLER                      PIC X(34)  VALUE             IX2044.2
   000289         029300            " FOR OFFICIAL USE ONLY    ".                         IX2044.2
   000290         029400     02  FILLER                      PIC X(58)  VALUE             IX2044.2
   000291         029500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2044.2
   000292         029600     02  FILLER                      PIC X(28)  VALUE             IX2044.2
   000293         029700            "  COPYRIGHT   1985 ".                                IX2044.2
   000294         029800 01  CCVS-E-1.                                                    IX2044.2
   000295         029900     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2044.2 IMP
   000296         030000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2044.2
   000297         030100     02 ID-AGAIN                     PIC X(9).                    IX2044.2
   000298         030200     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2044.2 IMP
   000299         030300 01  CCVS-E-2.                                                    IX2044.2
   000300         030400     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2044.2 IMP
   000301         030500     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2044.2 IMP
   000302         030600     02 CCVS-E-2-2.                                               IX2044.2
   000303         030700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2044.2 IMP
   000304         030800         03 FILLER                   PIC X      VALUE SPACE.      IX2044.2 IMP
   000305         030900         03 ENDER-DESC               PIC X(44)  VALUE             IX2044.2
   000306         031000            "ERRORS ENCOUNTERED".                                 IX2044.2
   000307         031100 01  CCVS-E-3.                                                    IX2044.2
   000308         031200     02  FILLER                      PIC X(22)  VALUE             IX2044.2
   000309         031300            " FOR OFFICIAL USE ONLY".                             IX2044.2
   000310         031400     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2044.2 IMP
   000311         031500     02  FILLER                      PIC X(58)  VALUE             IX2044.2
   000312         031600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2044.2
   000313         031700     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2044.2 IMP
   000314         031800     02 FILLER                       PIC X(15)  VALUE             IX2044.2
   000315         031900             " COPYRIGHT 1985".                                   IX2044.2
   000316         032000 01  CCVS-E-4.                                                    IX2044.2
   000317         032100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2044.2 IMP
   000318         032200     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2044.2
   000319         032300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2044.2 IMP
   000320         032400     02 FILLER                       PIC X(40)  VALUE             IX2044.2
   000321         032500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2044.2
   000322         032600 01  XXINFO.                                                      IX2044.2
   000323         032700     02 FILLER                       PIC X(19)  VALUE             IX2044.2
   000324         032800            "*** INFORMATION ***".                                IX2044.2
   000325         032900     02 INFO-TEXT.                                                IX2044.2
   000326         033000       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2044.2 IMP
   000327         033100       04 XXCOMPUTED                 PIC X(20).                   IX2044.2
   000328         033200       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2044.2 IMP
   000329         033300       04 XXCORRECT                  PIC X(20).                   IX2044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000330         033400     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2044.2
   000331         033500 01  HYPHEN-LINE.                                                 IX2044.2
   000332         033600     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2044.2 IMP
   000333         033700     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2044.2
   000334         033800-    "*****************************************".                 IX2044.2
   000335         033900     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2044.2
   000336         034000-    "******************************".                            IX2044.2
   000337         034100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2044.2
   000338         034200     "IX204A".                                                    IX2044.2
   000339         034300 PROCEDURE DIVISION.                                              IX2044.2
   000340         034400 DECLARATIVES.                                                    IX2044.2
   000341         034500 IX-FD2-01 SECTION.                                               IX2044.2
   000342         034600     USE    AFTER STANDARD ERROR PROCEDURE ON IX-FD2.             IX2044.2 108
   000343         034700 IX-FD2-01-01.                                                    IX2044.2
   000344         034800     ADD      1 TO  WRK-CS-09V00-013.                             IX2044.2 126
   000345         034900     GO TO    IX-FD2-01-03                                        IX2044.2 349
   000346         035000              IX-FD2-01-05                                        IX2044.2 353
   000347         035100              DEPENDING ON  WRK-CS-09V00-012.                     IX2044.2 125
   000348         035200     GO TO    IX-FD2-01-EXIT.                                     IX2044.2 358
   000349         035300 IX-FD2-01-03.                                                    IX2044.2
   000350         035400*ENTRY FROM SEGMENT INX-TEST-001.                                 IX2044.2
   000351         035500*    SHOULD NOT ENTER HERE UNLESS SPACE ALLOCATION TOO SMALL.     IX2044.2
   000352         035600     ADD     1 TO  WRK-CS-09V00-014.                              IX2044.2 127
   000353         035700 IX-FD2-01-05.                                                    IX2044.2
   000354         035800     ADD      1 TO WRK-CS-09V00-017.                              IX2044.2 130
   000355         035900     IF       XRECORD-NUMBER (2) EQUAL TO 500                     IX2044.2 171
   000356      1  036000              MOVE   IX-FD2-STATUS TO WRK-XN-0002-002             IX2044.2 132 134
   000357      1  036100              MOVE  "10" TO WRK-XN-0002-003.                      IX2044.2 135
   000358         036200 IX-FD2-01-EXIT.                                                  IX2044.2
   000359         036300     EXIT.                                                        IX2044.2
   000360         036400 END DECLARATIVES.                                                IX2044.2
   000361         036500 CCVS1 SECTION.                                                   IX2044.2
   000362         036600 OPEN-FILES.                                                      IX2044.2
   000363         036700     OPEN I-O RAW-DATA.                                           IX2044.2 90
   000364         036800     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2044.2 337 93
   000365         036900     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2044.2 90 371
   000366         037000     MOVE "ABORTED " TO C-ABORT.                                  IX2044.2 104
   000367         037100     ADD 1 TO C-NO-OF-TESTS.                                      IX2044.2 96
   000368         037200     ACCEPT C-DATE  FROM DATE.                                    IX2044.2 94
   000369         037300     ACCEPT C-TIME  FROM TIME.                                    IX2044.2 95
   000370         037400     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2044.2 92 371
   000371         037500 END-E-1.                                                         IX2044.2
   000372         037600     CLOSE RAW-DATA.                                              IX2044.2 90
   000373         037700     OPEN    OUTPUT PRINT-FILE.                                   IX2044.2 105
   000374         037800     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2044.2 337 278 337 297
   000375         037900     MOVE    SPACE TO TEST-RESULTS.                               IX2044.2 IMP 198
   000376         038000     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2044.2 420 425
   000377         038100     MOVE    ZERO TO REC-SKL-SUB.                                 IX2044.2 IMP 250
   000378         038200     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2044.2 379
   000379         038300 CCVS-INIT-FILE.                                                  IX2044.2
   000380         038400     ADD     1 TO REC-SKL-SUB.                                    IX2044.2 250
   000381         038500     MOVE    FILE-RECORD-INFO-SKELETON                            IX2044.2 148
   000382         038600          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2044.2 162 250
   000383         038700 CCVS-INIT-EXIT.                                                  IX2044.2
   000384         038800     GO TO CCVS1-EXIT.                                            IX2044.2 507
   000385         038900 CLOSE-FILES.                                                     IX2044.2
   000386         039000     OPEN I-O RAW-DATA.                                           IX2044.2 90
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000387         039100     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2044.2 337 93
   000388         039200     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2044.2 90 396
   000389         039300     MOVE "OK.     " TO C-ABORT.                                  IX2044.2 104
   000390         039400     MOVE PASS-COUNTER TO C-OK.                                   IX2044.2 255 97
   000391         039500     MOVE ERROR-HOLD   TO C-ALL.                                  IX2044.2 257 98
   000392         039600     MOVE ERROR-COUNTER TO C-FAIL.                                IX2044.2 253 99
   000393         039700     MOVE DELETE-COUNTER TO C-DELETED.                            IX2044.2 252 100
   000394         039800     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2044.2 254 101
   000395         039900     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2044.2 92 396
   000396         040000 END-E-2.                                                         IX2044.2
   000397         040100     CLOSE RAW-DATA.                                              IX2044.2 90
   000398         040200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2044.2 429 450 105
   000399         040300 TERMINATE-CCVS.                                                  IX2044.2
   000400         040400     EXIT PROGRAM.                                                IX2044.2
   000401         040500 TERMINATE-CALL.                                                  IX2044.2
   000402         040600     STOP     RUN.                                                IX2044.2
   000403         040700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2044.2 202 254
   000404         040800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2044.2 202 255
   000405         040900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2044.2 202 253
   000406         041000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2044.2 202 252
   000407         041100     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2044.2 209
   000408         041200 PRINT-DETAIL.                                                    IX2044.2
   000409         041300     IF REC-CT NOT EQUAL TO ZERO                                  IX2044.2 251 IMP
   000410      1  041400             MOVE "." TO PARDOT-X                                 IX2044.2 206
   000411      1  041500             MOVE REC-CT TO DOTVALUE.                             IX2044.2 251 207
   000412         041600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2044.2 198 106 462
   000413         041700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2044.2 202 462
   000414      1  041800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2044.2 483 497
   000415      1  041900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2044.2 498 506
   000416         042000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2044.2 IMP 202 IMP 214
   000417         042100     MOVE SPACE TO CORRECT-X.                                     IX2044.2 IMP 228
   000418         042200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2044.2 251 IMP IMP 204
   000419         042300     MOVE     SPACE TO RE-MARK.                                   IX2044.2 IMP 209
   000420         042400 HEAD-ROUTINE.                                                    IX2044.2
   000421         042500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2044.2 261 107 462
   000422         042600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2044.2 266 107 462
   000423         042700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2044.2 275 107 462
   000424         042800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2044.2 287 107 462
   000425         042900 COLUMN-NAMES-ROUTINE.                                            IX2044.2
   000426         043000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2044.2 239 107 462
   000427         043100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2044.2 244 107 462
   000428         043200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2044.2 331 107 462
   000429         043300 END-ROUTINE.                                                     IX2044.2
   000430         043400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2044.2 331 107 462
   000431         043500 END-RTN-EXIT.                                                    IX2044.2
   000432         043600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2044.2 294 107 462
   000433         043700 END-ROUTINE-1.                                                   IX2044.2
   000434         043800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2044.2 253 257 254
   000435         043900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2044.2 257 252 257
   000436         044000      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2044.2 255 257
   000437         044100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2044.2
   000438         044200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2044.2 255 317
   000439         044300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2044.2 257 319
   000440         044400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2044.2 316 302
   000441         044500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2044.2 299 107 462
   000442         044600  END-ROUTINE-12.                                                 IX2044.2
   000443         044700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2044.2 305
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000444         044800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2044.2 253 IMP
   000445      1  044900         MOVE "NO " TO ERROR-TOTAL                                IX2044.2 303
   000446         045000         ELSE                                                     IX2044.2
   000447      1  045100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2044.2 253 303
   000448         045200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2044.2 299 107
   000449         045300     PERFORM WRITE-LINE.                                          IX2044.2 462
   000450         045400 END-ROUTINE-13.                                                  IX2044.2
   000451         045500     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2044.2 252 IMP
   000452      1  045600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2044.2 303
   000453      1  045700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2044.2 252 303
   000454         045800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2044.2 305
   000455         045900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2044.2 299 107 462
   000456         046000      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2044.2 254 IMP
   000457      1  046100          MOVE "NO " TO ERROR-TOTAL                               IX2044.2 303
   000458      1  046200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2044.2 254 303
   000459         046300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2044.2 305
   000460         046400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2044.2 299 107 462
   000461         046500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2044.2 307 107 462
   000462         046600 WRITE-LINE.                                                      IX2044.2
   000463         046700     ADD 1 TO RECORD-COUNT.                                       IX2044.2 259
   000464         046800     IF RECORD-COUNT GREATER 42                                   IX2044.2 259
   000465      1  046900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2044.2 107 258
   000466      1  047000         MOVE SPACE TO DUMMY-RECORD                               IX2044.2 IMP 107
   000467      1  047100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2044.2 107
   000468      1  047200         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2044.2 261 107 478
   000469      1  047300         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2044.2 266 107 478
   000470      1  047400         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2044.2 275 107 478
   000471      1  047500         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2044.2 287 107 478
   000472      1  047600         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2044.2 239 107 478
   000473      1  047700         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2044.2 244 107 478
   000474      1  047800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2044.2 331 107 478
   000475      1  047900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2044.2 258 107
   000476      1  048000         MOVE ZERO TO RECORD-COUNT.                               IX2044.2 IMP 259
   000477         048100     PERFORM WRT-LN.                                              IX2044.2 478
   000478         048200 WRT-LN.                                                          IX2044.2
   000479         048300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2044.2 107
   000480         048400     MOVE SPACE TO DUMMY-RECORD.                                  IX2044.2 IMP 107
   000481         048500 BLANK-LINE-PRINT.                                                IX2044.2
   000482         048600     PERFORM WRT-LN.                                              IX2044.2 478
   000483         048700 FAIL-ROUTINE.                                                    IX2044.2
   000484         048800     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2044.2 214 IMP
   000485      1  048900            GO TO   FAIL-ROUTINE-WRITE.                           IX2044.2 492
   000486         049000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2044.2 228 IMP 492
   000487         049100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2044.2 260 330
   000488         049200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2044.2 325
   000489         049300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2044.2 322 107 462
   000490         049400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2044.2 IMP 330
   000491         049500     GO TO  FAIL-ROUTINE-EX.                                      IX2044.2 497
   000492         049600 FAIL-ROUTINE-WRITE.                                              IX2044.2
   000493         049700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2044.2 210 106 462
   000494         049800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2044.2 260 238
   000495         049900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2044.2 225 106 462
   000496         050000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2044.2 IMP 238
   000497         050100 FAIL-ROUTINE-EX. EXIT.                                           IX2044.2
   000498         050200 BAIL-OUT.                                                        IX2044.2
   000499         050300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2044.2 215 IMP 501
   000500         050400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2044.2 229 IMP 506
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000501         050500 BAIL-OUT-WRITE.                                                  IX2044.2
   000502         050600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2044.2 229 329 215 327
   000503         050700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2044.2 260 330
   000504         050800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2044.2 322 107 462
   000505         050900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2044.2 IMP 330
   000506         051000 BAIL-OUT-EX. EXIT.                                               IX2044.2
   000507         051100 CCVS1-EXIT.                                                      IX2044.2
   000508         051200     EXIT.                                                        IX2044.2
   000509         051300 SECT-IX-04-001 SECTION.                                          IX2044.2
   000510         051400 WRITE-INIT-GF-01.                                                IX2044.2
   000511         051500     MOVE     "CREATE IX-FD2" TO  FEATURE                         IX2044.2 200
   000512         051600     MOVE    "WRITE-TEST-001" TO PAR-NAME.                        IX2044.2 204
   000513         051700     MOVE     "IX-FD2"        TO  XFILE-NAME (2).                 IX2044.2 165
   000514         051800     MOVE     "R1-F-G"        TO  XRECORD-NAME (2).               IX2044.2 167
   000515         051900     MOVE     CCVS-PGM-ID     TO  XPROGRAM-NAME (2).              IX2044.2 337 177
   000516         052000     MOVE     000240          TO  XRECORD-LENGTH (2).             IX2044.2 179
   000517         052100     MOVE     "RC"            TO  CHARS-OR-RECORDS (2).           IX2044.2 181
   000518         052200     MOVE     0001            TO  XBLOCK-SIZE       (2).          IX2044.2 183
   000519         052300     MOVE     000500          TO  RECORDS-IN-FILE  (2).           IX2044.2 185
   000520         052400     MOVE    "IX"                TO XFILE-ORGANIZATION (2).       IX2044.2 187
   000521         052500     MOVE     "S"             TO  XLABEL-TYPE        (2).         IX2044.2 189
   000522         052600     MOVE     000001          TO  XRECORD-NUMBER     (2).         IX2044.2 171
   000523         052700*INITIALIZE  RECORD WORK AREA NUMBER 2.                           IX2044.2
   000524         052800     MOVE     1         TO  WRK-CS-09V00-012.                     IX2044.2 125
   000525         052900     MOVE     ZERO      TO  WRK-CS-09V00-013 WRK-CS-09V00-014     IX2044.2 IMP 126 127
   000526         053000                            WRK-CS-09V00-015 WRK-CS-09V00-016     IX2044.2 128 129
   000527         053100                            WRK-CS-09V00-017 WRK-CS-09V00-018.    IX2044.2 130 131
   000528         053200     MOVE     SPACE     TO  IX-FD2-STATUS.                        IX2044.2 IMP 132
   000529         053300     MOVE    ZERO TO WRK-DU-09V00-001.                            IX2044.2 IMP 122
   000530         053400     OPEN    OUTPUT  IX-FD2.                                      IX2044.2 108
   000531         053500     MOVE    GRP-0101  TO IX-FD2-KEY.                             IX2044.2 120 117
   000532         053600     MOVE     IX-FD2-STATUS TO WRK-XN-0002-001.                   IX2044.2 132 133
   000533         053700*CAPTURE STATUS KEY AFTER  OPEN STATEMENT IS EXECUTED.            IX2044.2
   000534         053800 WRITE-TEST-GF-01-R.                                              IX2044.2
   000535         053900     MOVE    "99"  TO IX-FD2-STATUS.                              IX2044.2 132
   000536         054000     MOVE     XRECORD-NUMBER (2) TO WRK-DU-09V00-001.             IX2044.2 171 122
   000537         054100     MOVE     GRP-0101 TO XRECORD-KEY (2).                        IX2044.2 120 192
   000538         054200     MOVE     FILE-RECORD-INFO (2) TO IX-FD2R1-F-G-240.           IX2044.2 162 113
   000539         054300     WRITE   IX-FD2R1-F-G-240.                                    IX2044.2 113
   000540         054400     IF        IX-FD2-STATUS NOT EQUAL TO "00"                    IX2044.2 132
   000541      1  054500         ADD  1  TO WRK-CS-09V00-016.                             IX2044.2 129
   000542         054600     IF       XRECORD-NUMBER (2) EQUAL TO 500                     IX2044.2 171
   000543      1  054700              GO TO  WRITE-TEST-GF-01.                            IX2044.2 546
   000544         054800     ADD      01 TO  XRECORD-NUMBER (2).                          IX2044.2 171
   000545         054900     GO TO    WRITE-TEST-GF-01-R.                                 IX2044.2 534
   000546         055000 WRITE-TEST-GF-01.                                                IX2044.2
   000547         055100     MOVE     "WRITE  IX-FD2." TO  FEATURE.                       IX2044.2 200
   000548         055200     MOVE    "WRITE-TEST-GF-01" TO PAR-NAME.                      IX2044.2 204
   000549         055300     IF       WRK-CS-09V00-014 NOT EQUAL TO ZERO                  IX2044.2 127 IMP
   000550      1  055400              MOVE "EXCEPTIONS/ERRORS; IX-41 4.9.2" TO RE-MARK    IX2044.2 209
   000551      1  055500              MOVE  ZERO TO CORRECT-18V0                          IX2044.2 IMP 235
   000552      1  055600              MOVE WRK-CS-09V00-014 TO COMPUTED-18V0              IX2044.2 127 222
   000553      1  055700              PERFORM   FAIL                                      IX2044.2 405
   000554         055800              ELSE                                                IX2044.2
   000555      1  055900              PERFORM   PASS.                                     IX2044.2 404
   000556         056000     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000557         056100 WRITE-TEST-GF-02.                                                IX2044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000558         056200     MOVE    "WRITE  IX-FD2." TO  FEATURE.                        IX2044.2 200
   000559         056300     MOVE    "WRITE-TEST-GF-02" TO PAR-NAME.                      IX2044.2 204
   000560         056400     IF       XRECORD-NUMBER (2) NOT EQUAL TO 500                 IX2044.2 171
   000561      1  056500              MOVE "INCORRECT COUNT; IX-41 4.9.2" TO RE-MARK      IX2044.2 209
   000562      1  056600              MOVE  500 TO CORRECT-18V0                           IX2044.2 235
   000563      1  056700             MOVE   XRECORD-NUMBER (2)  TO COMPUTED-18V0          IX2044.2 171 222
   000564      1  056800              PERFORM  FAIL                                       IX2044.2 405
   000565         056900              ELSE                                                IX2044.2
   000566      1  057000              PERFORM PASS.                                       IX2044.2 404
   000567         057100     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000568         057200 WRITE-TEST-GF-03.                                                IX2044.2
   000569         057300     MOVE    "OPEN OUTPUT 00" TO  FEATURE.                        IX2044.2 200
   000570         057400     MOVE    "WRITE-TEST-GF-03" TO PAR-NAME.                      IX2044.2 204
   000571         057500     IF       WRK-XN-0002-001 NOT EQUAL TO  "00"                  IX2044.2 133
   000572      1  057600              MOVE "STATUS/OPEN; IX-3 1.3.4 (1) A" TO RE-MARK     IX2044.2 209
   000573      1  057700              MOVE WRK-XN-0002-001 TO COMPUTED-A                  IX2044.2 133 215
   000574      1  057800              MOVE "00" TO CORRECT-A                              IX2044.2 229
   000575      1  057900              PERFORM  FAIL                                       IX2044.2 405
   000576         058000              ELSE                                                IX2044.2
   000577      1  058100              PERFORM  PASS.                                      IX2044.2 404
   000578         058200     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000579         058300 WRITE-TEST-GF-04.                                                IX2044.2
   000580         058400     MOVE    "WRITE STATUS 00" TO  FEATURE.                       IX2044.2 200
   000581         058500     MOVE    "WRITE-TEST-GF-04" TO PAR-NAME.                      IX2044.2 204
   000582         058600     IF        IX-FD2-STATUS NOT EQUAL TO "00"                    IX2044.2 132
   000583      1  058700              MOVE "STATUS/WRITE; IX-3 1.3.4 (1) A" TO RE-MARK    IX2044.2 209
   000584      1  058800              MOVE IX-FD2-STATUS TO COMPUTED-A                    IX2044.2 132 215
   000585      1  058900              MOVE "00" TO CORRECT-A                              IX2044.2 229
   000586      1  059000              PERFORM   FAIL                                      IX2044.2 405
   000587         059100              ELSE                                                IX2044.2
   000588      1  059200              PERFORM   PASS.                                     IX2044.2 404
   000589         059300     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000590         059400 WRITE-TEST-GF-05.                                                IX2044.2
   000591         059500     MOVE    "WRITE STATUS 00" TO  FEATURE.                       IX2044.2 200
   000592         059600     MOVE    "WRITE-TEST-GF-05" TO PAR-NAME.                      IX2044.2 204
   000593         059700     IF      WRK-CS-09V00-016    NOT EQUAL TO ZERO                IX2044.2 129 IMP
   000594      1  059800              MOVE  "STATUS/WRITE; IX-3 1.3.4 (1) A"  TO RE-MARK  IX2044.2 209
   000595      1  059900              MOVE    ZERO TO CORRECT-18V0                        IX2044.2 IMP 235
   000596      1  060000              MOVE    WRK-CS-09V00-016  TO COMPUTED-18V0          IX2044.2 129 222
   000597      1  060100              PERFORM   FAIL                                      IX2044.2 405
   000598         060200              ELSE                                                IX2044.2
   000599      1  060300              PERFORM  PASS.                                      IX2044.2 404
   000600         060400     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000601         060500 WRITE-TEST-GF-06.                                                IX2044.2
   000602         060600     MOVE    "CLOSE: STATUS: 00" TO  FEATURE.                     IX2044.2 200
   000603         060700     MOVE    "WRITE-TEST-GF-06" TO PAR-NAME.                      IX2044.2 204
   000604         060800     MOVE     SPACE  TO  IX-FD2-STATUS.                           IX2044.2 IMP 132
   000605         060900     CLOSE    IX-FD2.                                             IX2044.2 108
   000606         061000     IF        IX-FD2-STATUS NOT EQUAL TO "00"                    IX2044.2 132
   000607      1  061100              MOVE "CLOSE/STATUS; IX-3 1.3.4 (1) A" TO RE-MARK    IX2044.2 209
   000608      1  061200              MOVE IX-FD2-STATUS TO COMPUTED-18V0                 IX2044.2 132 222
   000609      1  061300              MOVE "00" TO CORRECT-A                              IX2044.2 229
   000610      1  061400              PERFORM FAIL                                        IX2044.2 405
   000611         061500              ELSE                                                IX2044.2
   000612      1  061600              PERFORM PASS.                                       IX2044.2 404
   000613         061700     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000614         061800 RWRT-INIT-GF-01.                                                 IX2044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000615         061900     MOVE     2     TO  WRK-CS-09V00-012.                         IX2044.2 125
   000616         062000     MOVE     ZERO  TO  WRK-CS-09V00-013.                         IX2044.2 IMP 126
   000617         062100     MOVE     ZERO  TO  WRK-CS-09V00-014.                         IX2044.2 IMP 127
   000618         062200     MOVE     ZERO  TO  WRK-CS-09V00-015.                         IX2044.2 IMP 128
   000619         062300     MOVE     ZERO  TO  WRK-CS-09V00-016.                         IX2044.2 IMP 129
   000620         062400     MOVE     ZERO  TO  WRK-CS-09V00-017.                         IX2044.2 IMP 130
   000621         062500     MOVE     ZERO  TO  WRK-CS-09V00-018.                         IX2044.2 IMP 131
   000622         062600     MOVE    SPACE TO IX-FD2-STATUS.                              IX2044.2 IMP 132
   000623         062700     OPEN     I-O  IX-FD2.                                        IX2044.2 108
   000624         062800     MOVE     SPACE     TO  WRK-XN-0002-002                       IX2044.2 IMP 134
   000625         062900     MOVE     SPACE     TO  WRK-XN-0002-003                       IX2044.2 IMP 135
   000626         063000     MOVE     SPACE     TO  WRK-XN-0002-004                       IX2044.2 IMP 136
   000627         063100     MOVE      IX-FD2-STATUS TO WRK-XN-0002-001                   IX2044.2 132 133
   000628         063200     MOVE     SPACE TO IX-FD2-STATUS.                             IX2044.2 IMP 132
   000629         063300*CAPTURE THE CONTENTS OF STATUS KEY AFTER OPEN IS EXECUTED.       IX2044.2
   000630         063400 RWRT-TEST-GF-01-R.                                               IX2044.2
   000631         063500     ADD      1 TO WRK-CS-09V00-014.                              IX2044.2 127
   000632         063600     ADD      1 TO WRK-CS-09V00-015.                              IX2044.2 128
   000633         063700     READ  IX-FD2 NEXT RECORD.                                    IX2044.2 108
   000634         063800     IF        IX-FD2-STATUS EQUAL TO "10"                        IX2044.2 132
   000635      1  063900              GO TO  RWRT-TEST-GF-01.                             IX2044.2 653
   000636         064000     MOVE     IX-FD2R1-F-G-240 TO FILE-RECORD-INFO (2).           IX2044.2 113 162
   000637         064100     IF       WRK-CS-09V00-015 EQUAL TO 5                         IX2044.2 128
   000638      1  064200              ADD 01 TO UPDATE-NUMBER (2)                         IX2044.2 173
   000639      1  064300              MOVE FILE-RECORD-INFO (2) TO IX-FD2R1-F-G-240       IX2044.2 162 113
   000640      1  064400             PERFORM  RWRT-010-UPDATE                             IX2044.2 646
   000641      1  064500             MOVE ZERO TO WRK-CS-09V00-015                        IX2044.2 IMP 128
   000642      1  064600              GO TO  RWRT-TEST-GF-01-2.                           IX2044.2 648
   000643         064700     IF       WRK-CS-09V00-014 GREATER 500                        IX2044.2 127
   000644      1  064800              GO TO  RWRT-TEST-GF-01.                             IX2044.2 653
   000645         064900     GO TO    RWRT-TEST-GF-01-R.                                  IX2044.2 630
   000646         065000 RWRT-010-UPDATE.                                                 IX2044.2
   000647         065100     REWRITE   IX-FD2R1-F-G-240.                                  IX2044.2 113
   000648         065200 RWRT-TEST-GF-01-2.                                               IX2044.2
   000649         065300     IF        IX-FD2-STATUS NOT EQUAL TO "00"                    IX2044.2 132
   000650      1  065400              ADD 1 TO WRK-CS-09V00-016.                          IX2044.2 129
   000651         065500     MOVE    SPACE  TO   IX-FD2-STATUS.                           IX2044.2 IMP 132
   000652         065600     GO TO    RWRT-TEST-GF-01-R.                                  IX2044.2 630
   000653         065700 RWRT-TEST-GF-01.                                                 IX2044.2
   000654         065800     MOVE    "RWRT-TEST-GF-01" TO PAR-NAME.                       IX2044.2 204
   000655         065900     MOVE    "REWRITE IX-FD2"  TO FEATURE.                        IX2044.2 200
   000656         066000     IF       WRK-CS-09V00-013 NOT EQUAL TO 1                     IX2044.2 126
   000657      1  066100              MOVE  "EXCEPTIONS/ERRORS; IX-33 4.6.2" TO RE-MARK   IX2044.2 209
   000658      1  066200              MOVE WRK-CS-09V00-013 TO COMPUTED-18V0              IX2044.2 126 222
   000659      1  066300              MOVE  1 TO CORRECT-18V0                             IX2044.2 235
   000660      1  066400              PERFORM FAIL                                        IX2044.2 405
   000661         066500              ELSE                                                IX2044.2
   000662      1  066600              PERFORM PASS.                                       IX2044.2 404
   000663         066700     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000664         066800 RWRT-TEST-GF-02.                                                 IX2044.2
   000665         066900     MOVE    "RWRT-TEST-GF-02" TO PAR-NAME.                       IX2044.2 204
   000666         067000     MOVE    "UPDATE  IX-FD2"  TO FEATURE.                        IX2044.2 200
   000667         067100     IF       WRK-CS-09V00-014 NOT EQUAL TO 501                   IX2044.2 127
   000668      1  067200              MOVE "INCORRECT COUNT; IX-33 4.6.2" TO RE-MARK      IX2044.2 209
   000669      1  067300              MOVE WRK-CS-09V00-014 TO COMPUTED-18V0              IX2044.2 127 222
   000670      1  067400              MOVE 501 TO CORRECT-18V0                            IX2044.2 235
   000671      1  067500              PERFORM FAIL                                        IX2044.2 405
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000672         067600              ELSE                                                IX2044.2
   000673      1  067700              PERFORM PASS.                                       IX2044.2 404
   000674         067800     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000675         067900 RWRT-TEST-GF-03.                                                 IX2044.2
   000676         068000     MOVE    "RWRT-TEST-GF-03" TO PAR-NAME.                       IX2044.2 204
   000677         068100     MOVE    "OPEN I-O STATUS: 00"  TO FEATURE.                   IX2044.2 200
   000678         068200     IF       WRK-XN-0002-001 NOT EQUAL TO "00"                   IX2044.2 133
   000679      1  068300              MOVE "OPEN/STATUS; IX-3 1.3.4 (1) A"  TO  RE-MARK   IX2044.2 209
   000680      1  068400              MOVE WRK-XN-0002-001 TO COMPUTED-A                  IX2044.2 133 215
   000681      1  068500              MOVE  "00" TO CORRECT-A                             IX2044.2 229
   000682      1  068600              PERFORM FAIL                                        IX2044.2 405
   000683         068700              ELSE                                                IX2044.2
   000684      1  068800              PERFORM PASS.                                       IX2044.2 404
   000685         068900     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000686         069000 RWRT-TEST-GF-04.                                                 IX2044.2
   000687         069100     MOVE    "RWRT-TEST-GF-04" TO PAR-NAME.                       IX2044.2 204
   000688         069200     MOVE    "READ I-O STATUS 10"  TO FEATURE.                    IX2044.2 200
   000689         069300     IF        IX-FD2-STATUS NOT EQUAL  TO "10"                   IX2044.2 132
   000690      1  069400              MOVE "AT END/STATUS; IX-4 1.3.4 (2) A" TO RE-MARK   IX2044.2 209
   000691      1  069500              MOVE  IX-FD2-STATUS TO COMPUTED-A                   IX2044.2 132 215
   000692      1  069600              MOVE "10" TO CORRECT-A                              IX2044.2 229
   000693      1  069700              PERFORM FAIL                                        IX2044.2 405
   000694         069800              ELSE                                                IX2044.2
   000695      1  069900              PERFORM PASS.                                       IX2044.2 404
   000696         070000     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000697         070100 RWRT-TEST-GF-05.                                                 IX2044.2
   000698         070200     MOVE    "RWRT-TEST-GF-05" TO PAR-NAME.                       IX2044.2 204
   000699         070300     MOVE    "UPDATE  IX-FD2"  TO FEATURE.                        IX2044.2 200
   000700         070400     IF       WRK-XN-0002-002 NOT EQUAL TO "10"                   IX2044.2 134
   000701      1  070500              MOVE  "EXCEPTIN/STATUS; IX-4 1.3.4 (2) A" TO RE-MARKIX2044.2 209
   000702      1  070600              MOVE  WRK-XN-0002-002 TO COMPUTED-A                 IX2044.2 134 215
   000703      1  070700              MOVE  "10" TO CORRECT-A                             IX2044.2 229
   000704      1  070800              PERFORM FAIL                                        IX2044.2 405
   000705         070900              ELSE                                                IX2044.2
   000706      1  071000              PERFORM PASS.                                       IX2044.2 404
   000707         071100     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000708         071200 RWRT-TEST-GF-06.                                                 IX2044.2
   000709         071300     MOVE    "RWRT-TEST-GF-06" TO PAR-NAME.                       IX2044.2 204
   000710         071400     MOVE    "STATUS: 10    "  TO FEATURE.                        IX2044.2 200
   000711         071500     IF       WRK-XN-0002-003 NOT EQUAL TO "10"                   IX2044.2 135
   000712      1  071600              MOVE "NO/EXCEPTION; IX-4 1.3.4 (2) A" TO  RE-MARK   IX2044.2 209
   000713      1  071700              MOVE WRK-XN-0002-003 TO COMPUTED-A                  IX2044.2 135 215
   000714      1  071800              MOVE "10" TO CORRECT-A                              IX2044.2 229
   000715      1  071900              PERFORM FAIL                                        IX2044.2 405
   000716         072000              ELSE                                                IX2044.2
   000717      1  072100              PERFORM PASS.                                       IX2044.2 404
   000718         072200     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000719         072300 RWRT-TEST-GF-07.                                                 IX2044.2
   000720         072400     MOVE    "RWRT-TEST-GF-07" TO PAR-NAME.                       IX2044.2 204
   000721         072500     MOVE    "CLOSE . LOCK: 00"  TO FEATURE.                      IX2044.2 200
   000722         072600     MOVE     SPACE TO IX-FD2-STATUS.                             IX2044.2 IMP 132
   000723         072700     CLOSE    IX-FD2      WITH LOCK.                              IX2044.2 108
   000724         072800     IF        IX-FD2-STATUS NOT EQUAL TO "00"                    IX2044.2 132
   000725      1  072900              MOVE "CLOSE/STATUS; IX-3 1.3.4 (1) A" TO RE-MARK    IX2044.2 209
   000726      1  073000              MOVE  IX-FD2-STATUS TO  COMPUTED-A                  IX2044.2 132 215
   000727      1  073100              MOVE "00" TO CORRECT-A                              IX2044.2 229
   000728      1  073200              PERFORM FAIL                                        IX2044.2 405
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000729         073300              ELSE                                                IX2044.2
   000730      1  073400              PERFORM PASS.                                       IX2044.2 404
   000731         073500     PERFORM  PRINT-DETAIL.                                       IX2044.2 408
   000732         073600                                                                  IX2044.2
   000733         073700 CCVS-EXIT SECTION.                                               IX2044.2
   000734         073800 CCVS-999999.                                                     IX2044.2
   000735         073900     GO TO CLOSE-FILES.                                           IX2044.2 385
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      194   ALTERNATE-KEY1
      196   ALTERNATE-KEY2
      260   ANSI-REFERENCE . . . . . . . .  487 494 503
      104   C-ABORT. . . . . . . . . . . .  M366 M389
       98   C-ALL. . . . . . . . . . . . .  M391
       94   C-DATE . . . . . . . . . . . .  M368
      100   C-DELETED. . . . . . . . . . .  M393
       99   C-FAIL . . . . . . . . . . . .  M392
      103   C-INDENT
      101   C-INSPECT. . . . . . . . . . .  M394
       96   C-NO-OF-TESTS. . . . . . . . .  M367
      102   C-NOTE
       97   C-OK . . . . . . . . . . . . .  M390
       95   C-TIME . . . . . . . . . . . .  M369
      239   CCVS-C-1 . . . . . . . . . . .  426 472
      244   CCVS-C-2 . . . . . . . . . . .  427 473
      294   CCVS-E-1 . . . . . . . . . . .  432
      299   CCVS-E-2 . . . . . . . . . . .  441 448 455 460
      302   CCVS-E-2-2 . . . . . . . . . .  M440
      307   CCVS-E-3 . . . . . . . . . . .  461
      316   CCVS-E-4 . . . . . . . . . . .  440
      317   CCVS-E-4-1 . . . . . . . . . .  M438
      319   CCVS-E-4-2 . . . . . . . . . .  M439
      261   CCVS-H-1 . . . . . . . . . . .  421 468
      266   CCVS-H-2A. . . . . . . . . . .  422 469
      275   CCVS-H-2B. . . . . . . . . . .  423 470
      287   CCVS-H-3 . . . . . . . . . . .  424 471
      337   CCVS-PGM-ID. . . . . . . . . .  364 374 374 387 515
      181   CHARS-OR-RECORDS . . . . . . .  M517
      221   CM-18V0
      215   COMPUTED-A . . . . . . . . . .  216 218 219 220 221 499 502 M573 M584 M680 M691 M702 M713 M726
      216   COMPUTED-N
      214   COMPUTED-X . . . . . . . . . .  M416 484
      218   COMPUTED-0V18
      220   COMPUTED-14V4
      222   COMPUTED-18V0. . . . . . . . .  M552 M563 M596 M608 M658 M669
      219   COMPUTED-4V14
      238   COR-ANSI-REFERENCE . . . . . .  M494 M496
      229   CORRECT-A. . . . . . . . . . .  230 231 232 233 234 500 502 M574 M585 M609 M681 M692 M703 M714 M727
      230   CORRECT-N
      228   CORRECT-X. . . . . . . . . . .  M417 486
      231   CORRECT-0V18
      233   CORRECT-14V4
      235   CORRECT-18V0 . . . . . . . . .  M551 M562 M595 M659 M670
      232   CORRECT-4V14
      234   CR-18V0
      252   DELETE-COUNTER . . . . . . . .  393 M406 435 451 453
      207   DOTVALUE . . . . . . . . . . .  M411
      258   DUMMY-HOLD . . . . . . . . . .  M465 475
      107   DUMMY-RECORD . . . . . . . . .  M421 M422 M423 M424 M426 M427 M428 M430 M432 M441 M448 M455 M460 M461 465 M466
                                            467 M468 M469 M470 M471 M472 M473 M474 M475 479 M480 M489 M504
      146   DUMMY-WRK-INDENT-5
      142   DUMMY-WRK-REC
      143   DUMMY-WRK1 . . . . . . . . . .  144
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    18
0 Defined   Cross-reference of data names   References

0     144   DUMMY-WRK2
      305   ENDER-DESC . . . . . . . . . .  M443 M454 M459
      253   ERROR-COUNTER. . . . . . . . .  392 M405 434 444 447
      257   ERROR-HOLD . . . . . . . . . .  391 M434 M435 M435 M436 439
      303   ERROR-TOTAL. . . . . . . . . .  M445 M447 M452 M453 M457 M458
      200   FEATURE. . . . . . . . . . . .  M511 M547 M558 M569 M580 M591 M602 M655 M666 M677 M688 M699 M710 M721
      162   FILE-RECORD-INFO . . . . . . .  M382 538 M636 639
      163   FILE-RECORD-INFO-P1-120
      190   FILE-RECORD-INFO-P121-240
      148   FILE-RECORD-INFO-SKELETON. . .  381
      147   FILE-RECORD-INFORMATION-REC
      124   GRP-0001
      120   GRP-0101 . . . . . . . . . . .  531 537
      331   HYPHEN-LINE. . . . . . . . . .  428 430 474
      297   ID-AGAIN . . . . . . . . . . .  M374
      330   INF-ANSI-REFERENCE . . . . . .  M487 M490 M503 M505
      325   INFO-TEXT. . . . . . . . . . .  M488
      254   INSPECT-COUNTER. . . . . . . .  394 M403 434 456 458
      108   IX-FD2 . . . . . . . . . . . .  80 342 530 605 623 633 723
      117   IX-FD2-KEY . . . . . . . . . .  86 M531
      114   IX-FD2-REC-120
      115   IX-FD2-REC-120-240
      132   IX-FD2-STATUS. . . . . . . . .  85 356 M528 532 M535 540 582 584 M604 606 608 M622 627 M628 634 649 M651 689
                                            691 M722 724 726
      113   IX-FD2R1-F-G-240 . . . . . . .  M538 539 636 M639 647
      175   ODO-NUMBER
      202   P-OR-F . . . . . . . . . . . .  M403 M404 M405 M406 413 M416
      204   PAR-NAME . . . . . . . . . . .  M418 M512 M548 M559 M570 M581 M592 M603 M654 M665 M676 M687 M698 M709 M720
      206   PARDOT-X . . . . . . . . . . .  M410
      255   PASS-COUNTER . . . . . . . . .  390 M404 436 438
      105   PRINT-FILE . . . . . . . . . .  78 373 398
      106   PRINT-REC. . . . . . . . . . .  M412 M493 M495
       90   RAW-DATA . . . . . . . . . . .  73 363 365 372 386 388 397
       93   RAW-DATA-KEY . . . . . . . . .  77 M364 M387
       92   RAW-DATA-SATZ. . . . . . . . .  370 395
      209   RE-MARK. . . . . . . . . . . .  M407 M419 M550 M561 M572 M583 M594 M607 M657 M668 M679 M690 M701 M712 M725
      251   REC-CT . . . . . . . . . . . .  409 411 418
      250   REC-SKL-SUB. . . . . . . . . .  M377 M380 382
      259   RECORD-COUNT . . . . . . . . .  M463 464 M476
      185   RECORDS-IN-FILE. . . . . . . .  M519
      169   REELUNIT-NUMBER
      210   TEST-COMPUTED. . . . . . . . .  493
      225   TEST-CORRECT . . . . . . . . .  495
      278   TEST-ID. . . . . . . . . . . .  M374
      198   TEST-RESULTS . . . . . . . . .  M375 412
      256   TOTAL-ERROR
      173   UPDATE-NUMBER. . . . . . . . .  M638
      125   WRK-CS-09V00-012 . . . . . . .  347 M524 M615
      126   WRK-CS-09V00-013 . . . . . . .  M344 M525 M616 656 658
      127   WRK-CS-09V00-014 . . . . . . .  M352 M525 549 552 M617 M631 643 667 669
      128   WRK-CS-09V00-015 . . . . . . .  M526 M618 M632 637 M641
      129   WRK-CS-09V00-016 . . . . . . .  M526 M541 593 596 M619 M650
      130   WRK-CS-09V00-017 . . . . . . .  M354 M527 M620
      131   WRK-CS-09V00-018 . . . . . . .  M527 M621
      122   WRK-DU-09V00-001 . . . . . . .  M529 M536
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    19
0 Defined   Cross-reference of data names   References

0     133   WRK-XN-0002-001. . . . . . . .  M532 571 573 M627 678 680
      134   WRK-XN-0002-002. . . . . . . .  M356 M624 700 702
      135   WRK-XN-0002-003. . . . . . . .  M357 M625 711 713
      136   WRK-XN-0002-004. . . . . . . .  M626
      137   WRK-XN-0002-005
      138   WRK-XN-0002-006
      139   WRK-XN-0002-007
      140   WRK-XN-0002-008
      141   WRK-XN-0002-009
      183   XBLOCK-SIZE. . . . . . . . . .  M518
      165   XFILE-NAME . . . . . . . . . .  M513
      187   XFILE-ORGANIZATION . . . . . .  M520
      189   XLABEL-TYPE. . . . . . . . . .  M521
      177   XPROGRAM-NAME. . . . . . . . .  M515
      192   XRECORD-KEY. . . . . . . . . .  M537
      179   XRECORD-LENGTH . . . . . . . .  M516
      167   XRECORD-NAME . . . . . . . . .  M514
      171   XRECORD-NUMBER . . . . . . . .  355 M522 536 542 M544 560 563
      327   XXCOMPUTED . . . . . . . . . .  M502
      329   XXCORRECT. . . . . . . . . . .  M502
      322   XXINFO . . . . . . . . . . . .  489 504
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    20
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

      498   BAIL-OUT . . . . . . . . . . .  P415
      506   BAIL-OUT-EX. . . . . . . . . .  E415 G500
      501   BAIL-OUT-WRITE . . . . . . . .  G499
      481   BLANK-LINE-PRINT
      733   CCVS-EXIT
      383   CCVS-INIT-EXIT
      379   CCVS-INIT-FILE . . . . . . . .  P378
      734   CCVS-999999
      361   CCVS1
      507   CCVS1-EXIT . . . . . . . . . .  G384
      385   CLOSE-FILES. . . . . . . . . .  G735
      425   COLUMN-NAMES-ROUTINE . . . . .  E376
      406   DE-LETE
      371   END-E-1. . . . . . . . . . . .  G365 G370
      396   END-E-2. . . . . . . . . . . .  G388 G395
      429   END-ROUTINE. . . . . . . . . .  P398
      433   END-ROUTINE-1
      442   END-ROUTINE-12
      450   END-ROUTINE-13 . . . . . . . .  E398
      431   END-RTN-EXIT
      405   FAIL . . . . . . . . . . . . .  P553 P564 P575 P586 P597 P610 P660 P671 P682 P693 P704 P715 P728
      483   FAIL-ROUTINE . . . . . . . . .  P414
      497   FAIL-ROUTINE-EX. . . . . . . .  E414 G491
      492   FAIL-ROUTINE-WRITE . . . . . .  G485 G486
      420   HEAD-ROUTINE . . . . . . . . .  P376
      403   INSPT
      341   IX-FD2-01
      358   IX-FD2-01-EXIT . . . . . . . .  G348
      343   IX-FD2-01-01
      349   IX-FD2-01-03 . . . . . . . . .  D345
      353   IX-FD2-01-05 . . . . . . . . .  D346
      362   OPEN-FILES
      404   PASS . . . . . . . . . . . . .  P555 P566 P577 P588 P599 P612 P662 P673 P684 P695 P706 P717 P730
      408   PRINT-DETAIL . . . . . . . . .  P556 P567 P578 P589 P600 P613 P663 P674 P685 P696 P707 P718 P731
      614   RWRT-INIT-GF-01
      653   RWRT-TEST-GF-01. . . . . . . .  G635 G644
      630   RWRT-TEST-GF-01-R. . . . . . .  G645 G652
      648   RWRT-TEST-GF-01-2. . . . . . .  G642
      664   RWRT-TEST-GF-02
      675   RWRT-TEST-GF-03
      686   RWRT-TEST-GF-04
      697   RWRT-TEST-GF-05
      708   RWRT-TEST-GF-06
      719   RWRT-TEST-GF-07
      646   RWRT-010-UPDATE. . . . . . . .  P640
      509   SECT-IX-04-001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    21
0 Defined   Cross-reference of procedures   References

0     401   TERMINATE-CALL
      399   TERMINATE-CCVS
      510   WRITE-INIT-GF-01
      462   WRITE-LINE . . . . . . . . . .  P412 P413 P421 P422 P423 P424 P426 P427 P428 P430 P432 P441 P449 P455 P460 P461
                                            P489 P493 P495 P504
      546   WRITE-TEST-GF-01 . . . . . . .  G543
      534   WRITE-TEST-GF-01-R . . . . . .  G545
      557   WRITE-TEST-GF-02
      568   WRITE-TEST-GF-03
      579   WRITE-TEST-GF-04
      590   WRITE-TEST-GF-05
      601   WRITE-TEST-GF-06
      478   WRT-LN . . . . . . . . . . . .  P468 P469 P470 P471 P472 P473 P474 P477 P482
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    22
0 Defined   Cross-reference of programs     References

        3   IX204A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX204A    Date 06/04/2022  Time 11:59:09   Page    23
0LineID  Message code  Message text

     82  IGYDS1298-I   Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX045" was treated as comments.

    105  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    108  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

    108  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       4           4
-* Statistics for COBOL program IX204A:
 *    Source records = 735
 *    Data Division statements = 125
 *    Procedure Division statements = 359
 *    Generated COBOL statements = 0
 *    Program complexity factor = 370
0End of compilation 1,  program IX204A,  highest severity 0.
0Return code 0
