1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:11   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:11   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1044.2
   000002         000200 PROGRAM-ID.                                                      IX1044.2
   000003         000300     IX104A.                                                      IX1044.2
   000004         000500*                                                              *  IX1044.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1044.2
   000006         000700*                                                              *  IX1044.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1044.2
   000008         000900*                                                              *  IX1044.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1044.2
   000010         001100*                                                              *  IX1044.2
   000011         001300*    THIS PROGRAM TESTS THE SYNTACTICAL CONSTRUCTS AND SEMANTIC   IX1044.2
   000012         001400*    ACTIONS ASSOCIATED WITH THE FOLLOWING ELEMENTS:              IX1044.2
   000013         001500*                                                                 IX1044.2
   000014         001600*    (1) FILE STATUS                                              IX1044.2
   000015         001700*    (2) USE AFTER EXCEPTION USING FILE-NAME                      IX1044.2
   000016         001800*    (3) READ                                                     IX1044.2
   000017         001900*    (4) WRITE                                                    IX1044.2
   000018         002000*    (5) REWRITE                                                  IX1044.2
   000019         002100*    (6) RECORD KEY                                               IX1044.2
   000020         002200*    (7) ACCESS                                                   IX1044.2
   000021         002300*                                                                 IX1044.2
   000022         002400*    THIS PROGRAM CREATES AN INDEXED FILE SEQUENTIALLY (ACCESS    IX1044.2
   000023         002500*    MODE SEQUENTIAL) AND THEN UPDATES SELECTIVE RECORDS OF THE   IX1044.2
   000024         002600*    FILE.  THE FILE STATUS CONTENTS ARE CAPTURED AND TESTED FOR  IX1044.2
   000025         002700*    ACCURACY FOR EACH OPEN, CLOSE, READ AND REWRITE STATEMENT    IX1044.2
   000026         002800*    USED.  THE READ, WRITE AND REWRITE STATEMENTS ARE USED       IX1044.2
   000027         002900*    WITHOUT THE APPROPRIATE AT END OR INVALID KEY PHRASES. THE   IX1044.2
   000028         003000*    OMISSION OF THESE PHRASES ARE PERMITTED IF AN APPLICABLE USE IX1044.2
   000029         003100*    PROCEDURE HAS BEEN SPECIFIED.                                IX1044.2
   000030         003200*                                                                 IX1044.2
   000031         003300*                                                                 IX1044.2
   000032         003400*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX1044.2
   000033         003500*                                                                 IX1044.2
   000034         003600*             X-25   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX1044.2
   000035         003700*                    CLAUSE FOR DATA FILE IX-FD2                  IX1044.2
   000036         003800*             X-45   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX1044.2
   000037         003900*                    CLAUSE FOR INDEX FILE IX-FD2                 IX1044.2
   000038         004000*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX1044.2
   000039         004100*             X-62   FOR RAW-DATA                                 IX1044.2
   000040         004200*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX1044.2
   000041         004300*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX1044.2
   000042         004400*                                                                 IX1044.2
   000043         004500*         NOTE:  X-CARDS 45 AND 62       ARE OPTIONAL             IX1044.2
   000044         004600*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX1044.2
   000045         004700*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX1044.2
   000046         004800*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX1044.2
   000047         004900*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX1044.2
   000048         005000*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX1044.2
   000049         005100*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX1044.2
   000050         005200*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX1044.2
   000051         005300*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX1044.2
   000052         005400*               THEY ARE AS FOLLOWS                               IX1044.2
   000053         005500*                                                                 IX1044.2
   000054         005600*                  J  SELECTS X-CARD 45                           IX1044.2
   000055         005700*                                                                 IX1044.2
   000056         005900 ENVIRONMENT DIVISION.                                            IX1044.2
   000057         006000 CONFIGURATION SECTION.                                           IX1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100 SOURCE-COMPUTER.                                                 IX1044.2
   000059         006200     XXXXX082.                                                    IX1044.2
   000060         006300 OBJECT-COMPUTER.                                                 IX1044.2
   000061         006400     XXXXX083.                                                    IX1044.2
   000062         006500 INPUT-OUTPUT SECTION.                                            IX1044.2
   000063         006600 FILE-CONTROL.                                                    IX1044.2
   000064         006700     SELECT RAW-DATA   ASSIGN TO                                  IX1044.2 81
   000065         006800     XXXXX062                                                     IX1044.2
   000066         006900            ORGANIZATION IS INDEXED                               IX1044.2
   000067         007000            ACCESS MODE IS RANDOM                                 IX1044.2
   000068         007100            RECORD KEY IS RAW-DATA-KEY.                           IX1044.2 84
   000069         007200     SELECT PRINT-FILE ASSIGN TO                                  IX1044.2 96
   000070         007300     XXXXX055.                                                    IX1044.2
   000071         007400     SELECT   IX-FS2 ASSIGN                                       IX1044.2 99
   000072         007500     XXXXX025                                                     IX1044.2
   000073         007600     XXXXX045                                                     IX1044.2

 ==000073==> IGYDS1298-I Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX045" was treated as comments.

   000074         007700             ORGANIZATION IS INDEXED                              IX1044.2
   000075         007800        ACCESS SEQUENTIAL                                         IX1044.2
   000076         007900        FILE STATUS IS IX-FS2-STATUS                              IX1044.2 123
   000077         008000        RECORD  IX-FS2-KEY.                                       IX1044.2 108
   000078         008100 DATA DIVISION.                                                   IX1044.2
   000079         008200 FILE SECTION.                                                    IX1044.2
   000080         008300                                                                  IX1044.2
   000081         008400 FD  RAW-DATA.                                                    IX1044.2
   000082         008500                                                                  IX1044.2
   000083         008600 01  RAW-DATA-SATZ.                                               IX1044.2
   000084         008700     05  RAW-DATA-KEY        PIC X(6).                            IX1044.2
   000085         008800     05  C-DATE              PIC 9(6).                            IX1044.2
   000086         008900     05  C-TIME              PIC 9(8).                            IX1044.2
   000087         009000     05  C-NO-OF-TESTS       PIC 99.                              IX1044.2
   000088         009100     05  C-OK                PIC 999.                             IX1044.2
   000089         009200     05  C-ALL               PIC 999.                             IX1044.2
   000090         009300     05  C-FAIL              PIC 999.                             IX1044.2
   000091         009400     05  C-DELETED           PIC 999.                             IX1044.2
   000092         009500     05  C-INSPECT           PIC 999.                             IX1044.2
   000093         009600     05  C-NOTE              PIC X(13).                           IX1044.2
   000094         009700     05  C-INDENT            PIC X.                               IX1044.2
   000095         009800     05  C-ABORT             PIC X(8).                            IX1044.2
   000096         009900 FD  PRINT-FILE.                                                  IX1044.2

 ==000096==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000097         010000 01  PRINT-REC PICTURE X(120).                                    IX1044.2
   000098         010100 01  DUMMY-RECORD PICTURE X(120).                                 IX1044.2
   000099         010200 FD  IX-FS2                                                       IX1044.2

 ==000099==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000099==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000100         010300     LABEL RECORDS ARE STANDARD                                   IX1044.2
   000101         010400     DATA RECORDS IX-FS2R1-F-G-240                                IX1044.2 *
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000102         010500     BLOCK CONTAINS 480                                           IX1044.2
   000103         010600     RECORD CONTAINS  240  CHARACTERS.                            IX1044.2
   000104         010700 01  IX-FS2R1-F-G-240.                                            IX1044.2
   000105         010800     05 IX-FS2-REC-120    PIC X(120).                             IX1044.2
   000106         010900     05 IX-FS2-REC-120-240.                                       IX1044.2
   000107         011000     10  FILLER PICTURE X(8).                                     IX1044.2
   000108         011100     10  IX-FS2-KEY PIC X(29).                                    IX1044.2
   000109         011200     10  FILLER PIC X(83).                                        IX1044.2
   000110         011300 WORKING-STORAGE SECTION.                                         IX1044.2
   000111         011400 01  GRP-0101.                                                    IX1044.2
   000112         011500     02 FILLER PIC X(10) VALUE "ABCD921XYZ".                      IX1044.2
   000113         011600     02  WRK-DU-09V00-001 PIC 9(9) VALUE ZERO.                    IX1044.2 IMP
   000114         011700     02 FILLER PIC X(10) VALUE "Z2F()$+-AB".                      IX1044.2
   000115         011800 01  GRP-0001.                                                    IX1044.2
   000116         011900     05 WRK-CS-09V00-012  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1044.2 IMP
   000117         012000     05 WRK-CS-09V00-013  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1044.2 IMP
   000118         012100     05 WRK-CS-09V00-014  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1044.2 IMP
   000119         012200     05 WRK-CS-09V00-015  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1044.2 IMP
   000120         012300     05 WRK-CS-09V00-016  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1044.2 IMP
   000121         012400     05 WRK-CS-09V00-017  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1044.2 IMP
   000122         012500     05 WRK-CS-09V00-018  PIC S9(9) USAGE COMP  VALUE ZERO.       IX1044.2 IMP
   000123         012600     05 IX-FS2-STATUS     PIC  XX  VALUE  SPACE.                  IX1044.2 IMP
   000124         012700     05 WRK-XN-0002-001   PIC  X(2) VALUE  SPACE.                 IX1044.2 IMP
   000125         012800     05 WRK-XN-0002-002   PIC  X(2) VALUE  SPACE.                 IX1044.2 IMP
   000126         012900     05 WRK-XN-0002-003   PIC  X(2) VALUE  SPACE.                 IX1044.2 IMP
   000127         013000     05 WRK-XN-0002-004   PIC  X(2) VALUE  SPACE.                 IX1044.2 IMP
   000128         013100     05 WRK-XN-0002-005   PIC  X(2) VALUE  SPACE.                 IX1044.2 IMP
   000129         013200     05 WRK-XN-0002-006   PIC  X(2) VALUE  SPACE.                 IX1044.2 IMP
   000130         013300     05 WRK-XN-0002-007   PIC  X(2) VALUE  SPACE.                 IX1044.2 IMP
   000131         013400     05 WRK-XN-0002-008   PIC  X(2) VALUE  SPACE.                 IX1044.2 IMP
   000132         013500     05 WRK-XN-0002-009   PIC  X(2) VALUE  SPACE.                 IX1044.2 IMP
   000133         013600 01  DUMMY-WRK-REC.                                               IX1044.2
   000134         013700     02 DUMMY-WRK1       PIC X(120).                              IX1044.2
   000135         013800     02 DUMMY-WRK2  REDEFINES  DUMMY-WRK1.                        IX1044.2 134
   000136         013900        03 FILLER   PIC X(5).                                     IX1044.2
   000137         014000        03 DUMMY-WRK-INDENT-5  PIC X(115).                        IX1044.2
   000138         014100 01  FILE-RECORD-INFORMATION-REC.                                 IX1044.2
   000139         014200     03 FILE-RECORD-INFO-SKELETON.                                IX1044.2
   000140         014300        05 FILLER                 PICTURE X(48)       VALUE       IX1044.2
   000141         014400             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX1044.2
   000142         014500        05 FILLER                 PICTURE X(46)       VALUE       IX1044.2
   000143         014600             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX1044.2
   000144         014700        05 FILLER                 PICTURE X(26)       VALUE       IX1044.2
   000145         014800             ",LFIL=000000,ORG=  ,LBLR= ".                        IX1044.2
   000146         014900        05 FILLER                 PICTURE X(37)       VALUE       IX1044.2
   000147         015000             ",RECKEY=                             ".             IX1044.2
   000148         015100        05 FILLER                 PICTURE X(38)       VALUE       IX1044.2
   000149         015200             ",ALTKEY1=                             ".            IX1044.2
   000150         015300        05 FILLER                 PICTURE X(38)       VALUE       IX1044.2
   000151         015400             ",ALTKEY2=                             ".            IX1044.2
   000152         015500        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX1044.2 IMP
   000153         015600     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX1044.2
   000154         015700        05 FILE-RECORD-INFO-P1-120.                               IX1044.2
   000155         015800           07 FILLER              PIC X(5).                       IX1044.2
   000156         015900           07 XFILE-NAME           PIC X(6).                      IX1044.2
   000157         016000           07 FILLER              PIC X(8).                       IX1044.2
   000158         016100           07 XRECORD-NAME         PIC X(6).                      IX1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000159         016200           07 FILLER              PIC X(1).                       IX1044.2
   000160         016300           07 REELUNIT-NUMBER     PIC 9(1).                       IX1044.2
   000161         016400           07 FILLER              PIC X(7).                       IX1044.2
   000162         016500           07 XRECORD-NUMBER       PIC 9(6).                      IX1044.2
   000163         016600           07 FILLER              PIC X(6).                       IX1044.2
   000164         016700           07 UPDATE-NUMBER       PIC 9(2).                       IX1044.2
   000165         016800           07 FILLER              PIC X(5).                       IX1044.2
   000166         016900           07 ODO-NUMBER          PIC 9(4).                       IX1044.2
   000167         017000           07 FILLER              PIC X(5).                       IX1044.2
   000168         017100           07 XPROGRAM-NAME        PIC X(5).                      IX1044.2
   000169         017200           07 FILLER              PIC X(7).                       IX1044.2
   000170         017300           07 XRECORD-LENGTH       PIC 9(6).                      IX1044.2
   000171         017400           07 FILLER              PIC X(7).                       IX1044.2
   000172         017500           07 CHARS-OR-RECORDS    PIC X(2).                       IX1044.2
   000173         017600           07 FILLER              PIC X(1).                       IX1044.2
   000174         017700           07 XBLOCK-SIZE          PIC 9(4).                      IX1044.2
   000175         017800           07 FILLER              PIC X(6).                       IX1044.2
   000176         017900           07 RECORDS-IN-FILE     PIC 9(6).                       IX1044.2
   000177         018000           07 FILLER              PIC X(5).                       IX1044.2
   000178         018100           07 XFILE-ORGANIZATION   PIC X(2).                      IX1044.2
   000179         018200           07 FILLER              PIC X(6).                       IX1044.2
   000180         018300           07 XLABEL-TYPE          PIC X(1).                      IX1044.2
   000181         018400        05 FILE-RECORD-INFO-P121-240.                             IX1044.2
   000182         018500           07 FILLER              PIC X(8).                       IX1044.2
   000183         018600           07 XRECORD-KEY          PIC X(29).                     IX1044.2
   000184         018700           07 FILLER              PIC X(9).                       IX1044.2
   000185         018800           07 ALTERNATE-KEY1      PIC X(29).                      IX1044.2
   000186         018900           07 FILLER              PIC X(9).                       IX1044.2
   000187         019000           07 ALTERNATE-KEY2      PIC X(29).                      IX1044.2
   000188         019100           07 FILLER              PIC X(7).                       IX1044.2
   000189         019200 01  TEST-RESULTS.                                                IX1044.2
   000190         019300     02 FILLER                   PIC X      VALUE SPACE.          IX1044.2 IMP
   000191         019400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1044.2 IMP
   000192         019500     02 FILLER                   PIC X      VALUE SPACE.          IX1044.2 IMP
   000193         019600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1044.2 IMP
   000194         019700     02 FILLER                   PIC X      VALUE SPACE.          IX1044.2 IMP
   000195         019800     02  PAR-NAME.                                                IX1044.2
   000196         019900       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1044.2 IMP
   000197         020000       03  PARDOT-X              PIC X      VALUE SPACE.          IX1044.2 IMP
   000198         020100       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1044.2 IMP
   000199         020200     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1044.2 IMP
   000200         020300     02 RE-MARK                  PIC X(61).                       IX1044.2
   000201         020400 01  TEST-COMPUTED.                                               IX1044.2
   000202         020500     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1044.2 IMP
   000203         020600     02 FILLER                   PIC X(17)  VALUE                 IX1044.2
   000204         020700            "       COMPUTED=".                                   IX1044.2
   000205         020800     02 COMPUTED-X.                                               IX1044.2
   000206         020900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1044.2 IMP
   000207         021000     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1044.2 206
   000208         021100                                 PIC -9(9).9(9).                  IX1044.2
   000209         021200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1044.2 206
   000210         021300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1044.2 206
   000211         021400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1044.2 206
   000212         021500     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1044.2 206
   000213         021600         04 COMPUTED-18V0                    PIC -9(18).          IX1044.2
   000214         021700         04 FILLER                           PIC X.               IX1044.2
   000215         021800     03 FILLER PIC X(50) VALUE SPACE.                             IX1044.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000216         021900 01  TEST-CORRECT.                                                IX1044.2
   000217         022000     02 FILLER PIC X(30) VALUE SPACE.                             IX1044.2 IMP
   000218         022100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1044.2
   000219         022200     02 CORRECT-X.                                                IX1044.2
   000220         022300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1044.2 IMP
   000221         022400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1044.2 220
   000222         022500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1044.2 220
   000223         022600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1044.2 220
   000224         022700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1044.2 220
   000225         022800     03      CR-18V0 REDEFINES CORRECT-A.                         IX1044.2 220
   000226         022900         04 CORRECT-18V0                     PIC -9(18).          IX1044.2
   000227         023000         04 FILLER                           PIC X.               IX1044.2
   000228         023100     03 FILLER PIC X(2) VALUE SPACE.                              IX1044.2 IMP
   000229         023200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1044.2 IMP
   000230         023300 01  CCVS-C-1.                                                    IX1044.2
   000231         023400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1044.2
   000232         023500-    "SS  PARAGRAPH-NAME                                          IX1044.2
   000233         023600-    "       REMARKS".                                            IX1044.2
   000234         023700     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1044.2 IMP
   000235         023800 01  CCVS-C-2.                                                    IX1044.2
   000236         023900     02 FILLER                     PIC X        VALUE SPACE.      IX1044.2 IMP
   000237         024000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1044.2
   000238         024100     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1044.2 IMP
   000239         024200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1044.2
   000240         024300     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1044.2 IMP
   000241         024400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1044.2 IMP
   000242         024500 01  REC-CT                        PIC 99       VALUE ZERO.       IX1044.2 IMP
   000243         024600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1044.2 IMP
   000244         024700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1044.2 IMP
   000245         024800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1044.2 IMP
   000246         024900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1044.2 IMP
   000247         025000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1044.2 IMP
   000248         025100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1044.2 IMP
   000249         025200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1044.2 IMP
   000250         025300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1044.2 IMP
   000251         025400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1044.2 IMP
   000252         025500 01  CCVS-H-1.                                                    IX1044.2
   000253         025600     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1044.2 IMP
   000254         025700     02  FILLER                    PIC X(42)    VALUE             IX1044.2
   000255         025800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1044.2
   000256         025900     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1044.2 IMP
   000257         026000 01  CCVS-H-2A.                                                   IX1044.2
   000258         026100   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1044.2 IMP
   000259         026200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1044.2
   000260         026300   02  FILLER                        PIC XXXX   VALUE             IX1044.2
   000261         026400     "4.2 ".                                                      IX1044.2
   000262         026500   02  FILLER                        PIC X(28)  VALUE             IX1044.2
   000263         026600            " COPY - NOT FOR DISTRIBUTION".                       IX1044.2
   000264         026700   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1044.2 IMP
   000265         026800                                                                  IX1044.2
   000266         026900 01  CCVS-H-2B.                                                   IX1044.2
   000267         027000   02  FILLER                        PIC X(15)  VALUE             IX1044.2
   000268         027100            "TEST RESULT OF ".                                    IX1044.2
   000269         027200   02  TEST-ID                       PIC X(9).                    IX1044.2
   000270         027300   02  FILLER                        PIC X(4)   VALUE             IX1044.2
   000271         027400            " IN ".                                               IX1044.2
   000272         027500   02  FILLER                        PIC X(12)  VALUE             IX1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000273         027600     " HIGH       ".                                              IX1044.2
   000274         027700   02  FILLER                        PIC X(22)  VALUE             IX1044.2
   000275         027800            " LEVEL VALIDATION FOR ".                             IX1044.2
   000276         027900   02  FILLER                        PIC X(58)  VALUE             IX1044.2
   000277         028000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1044.2
   000278         028100 01  CCVS-H-3.                                                    IX1044.2
   000279         028200     02  FILLER                      PIC X(34)  VALUE             IX1044.2
   000280         028300            " FOR OFFICIAL USE ONLY    ".                         IX1044.2
   000281         028400     02  FILLER                      PIC X(58)  VALUE             IX1044.2
   000282         028500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1044.2
   000283         028600     02  FILLER                      PIC X(28)  VALUE             IX1044.2
   000284         028700            "  COPYRIGHT   1985 ".                                IX1044.2
   000285         028800 01  CCVS-E-1.                                                    IX1044.2
   000286         028900     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1044.2 IMP
   000287         029000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1044.2
   000288         029100     02 ID-AGAIN                     PIC X(9).                    IX1044.2
   000289         029200     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1044.2 IMP
   000290         029300 01  CCVS-E-2.                                                    IX1044.2
   000291         029400     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1044.2 IMP
   000292         029500     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1044.2 IMP
   000293         029600     02 CCVS-E-2-2.                                               IX1044.2
   000294         029700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1044.2 IMP
   000295         029800         03 FILLER                   PIC X      VALUE SPACE.      IX1044.2 IMP
   000296         029900         03 ENDER-DESC               PIC X(44)  VALUE             IX1044.2
   000297         030000            "ERRORS ENCOUNTERED".                                 IX1044.2
   000298         030100 01  CCVS-E-3.                                                    IX1044.2
   000299         030200     02  FILLER                      PIC X(22)  VALUE             IX1044.2
   000300         030300            " FOR OFFICIAL USE ONLY".                             IX1044.2
   000301         030400     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1044.2 IMP
   000302         030500     02  FILLER                      PIC X(58)  VALUE             IX1044.2
   000303         030600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1044.2
   000304         030700     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1044.2 IMP
   000305         030800     02 FILLER                       PIC X(15)  VALUE             IX1044.2
   000306         030900             " COPYRIGHT 1985".                                   IX1044.2
   000307         031000 01  CCVS-E-4.                                                    IX1044.2
   000308         031100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1044.2 IMP
   000309         031200     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1044.2
   000310         031300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1044.2 IMP
   000311         031400     02 FILLER                       PIC X(40)  VALUE             IX1044.2
   000312         031500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1044.2
   000313         031600 01  XXINFO.                                                      IX1044.2
   000314         031700     02 FILLER                       PIC X(19)  VALUE             IX1044.2
   000315         031800            "*** INFORMATION ***".                                IX1044.2
   000316         031900     02 INFO-TEXT.                                                IX1044.2
   000317         032000       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1044.2 IMP
   000318         032100       04 XXCOMPUTED                 PIC X(20).                   IX1044.2
   000319         032200       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1044.2 IMP
   000320         032300       04 XXCORRECT                  PIC X(20).                   IX1044.2
   000321         032400     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1044.2
   000322         032500 01  HYPHEN-LINE.                                                 IX1044.2
   000323         032600     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1044.2 IMP
   000324         032700     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1044.2
   000325         032800-    "*****************************************".                 IX1044.2
   000326         032900     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1044.2
   000327         033000-    "******************************".                            IX1044.2
   000328         033100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1044.2
   000329         033200     "IX104A".                                                    IX1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000330         033300 PROCEDURE DIVISION.                                              IX1044.2
   000331         033400 DECLARATIVES.                                                    IX1044.2
   000332         033500 IX-FS2-01 SECTION.                                               IX1044.2
   000333         033600     USE    AFTER STANDARD ERROR PROCEDURE ON IX-FS2.             IX1044.2 99
   000334         033700 IX-FS2-01-01.                                                    IX1044.2
   000335         033800     ADD      1 TO  WRK-CS-09V00-013.                             IX1044.2 117
   000336         033900     GO TO    IX-FS2-01-03                                        IX1044.2 340
   000337         034000              IX-FS2-01-05                                        IX1044.2 344
   000338         034100              DEPENDING ON  WRK-CS-09V00-012.                     IX1044.2 116
   000339         034200     GO TO    IX-FS2-01-EXIT.                                     IX1044.2 349
   000340         034300 IX-FS2-01-03.                                                    IX1044.2
   000341         034400*ENTRY FROM SEGMENT INX-TEST-001.                                 IX1044.2
   000342         034500*    SHOULD NOT ENTER HERE UNLESS SPACE ALLOCATION TOO SMALL.     IX1044.2
   000343         034600     ADD     1 TO  WRK-CS-09V00-014.                              IX1044.2 118
   000344         034700 IX-FS2-01-05.                                                    IX1044.2
   000345         034800     ADD      1 TO WRK-CS-09V00-017.                              IX1044.2 121
   000346         034900     IF       XRECORD-NUMBER (2) EQUAL TO 500                     IX1044.2 162
   000347      1  035000              MOVE   IX-FS2-STATUS TO WRK-XN-0002-002             IX1044.2 123 125
   000348      1  035100              MOVE  "10" TO WRK-XN-0002-003.                      IX1044.2 126
   000349         035200 IX-FS2-01-EXIT.                                                  IX1044.2
   000350         035300     EXIT.                                                        IX1044.2
   000351         035400 END DECLARATIVES.                                                IX1044.2
   000352         035500 CCVS1 SECTION.                                                   IX1044.2
   000353         035600 OPEN-FILES.                                                      IX1044.2
   000354         035700     OPEN I-O RAW-DATA.                                           IX1044.2 81
   000355         035800     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1044.2 328 84
   000356         035900     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1044.2 81 362
   000357         036000     MOVE "ABORTED " TO C-ABORT.                                  IX1044.2 95
   000358         036100     ADD 1 TO C-NO-OF-TESTS.                                      IX1044.2 87
   000359         036200     ACCEPT C-DATE  FROM DATE.                                    IX1044.2 85
   000360         036300     ACCEPT C-TIME  FROM TIME.                                    IX1044.2 86
   000361         036400     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1044.2 83 362
   000362         036500 END-E-1.                                                         IX1044.2
   000363         036600     CLOSE RAW-DATA.                                              IX1044.2 81
   000364         036700     OPEN    OUTPUT PRINT-FILE.                                   IX1044.2 96
   000365         036800     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1044.2 328 269 328 288
   000366         036900     MOVE    SPACE TO TEST-RESULTS.                               IX1044.2 IMP 189
   000367         037000     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1044.2 411 416
   000368         037100     MOVE    ZERO TO REC-SKL-SUB.                                 IX1044.2 IMP 241
   000369         037200     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1044.2 370
   000370         037300 CCVS-INIT-FILE.                                                  IX1044.2
   000371         037400     ADD     1 TO REC-SKL-SUB.                                    IX1044.2 241
   000372         037500     MOVE    FILE-RECORD-INFO-SKELETON                            IX1044.2 139
   000373         037600          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1044.2 153 241
   000374         037700 CCVS-INIT-EXIT.                                                  IX1044.2
   000375         037800     GO TO CCVS1-EXIT.                                            IX1044.2 498
   000376         037900 CLOSE-FILES.                                                     IX1044.2
   000377         038000     OPEN I-O RAW-DATA.                                           IX1044.2 81
   000378         038100     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1044.2 328 84
   000379         038200     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1044.2 81 387
   000380         038300     MOVE "OK.     " TO C-ABORT.                                  IX1044.2 95
   000381         038400     MOVE PASS-COUNTER TO C-OK.                                   IX1044.2 246 88
   000382         038500     MOVE ERROR-HOLD   TO C-ALL.                                  IX1044.2 248 89
   000383         038600     MOVE ERROR-COUNTER TO C-FAIL.                                IX1044.2 244 90
   000384         038700     MOVE DELETE-COUNTER TO C-DELETED.                            IX1044.2 243 91
   000385         038800     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1044.2 245 92
   000386         038900     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1044.2 83 387
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000387         039000 END-E-2.                                                         IX1044.2
   000388         039100     CLOSE RAW-DATA.                                              IX1044.2 81
   000389         039200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1044.2 420 441 96
   000390         039300 TERMINATE-CCVS.                                                  IX1044.2
   000391         039400     EXIT PROGRAM.                                                IX1044.2
   000392         039500 TERMINATE-CALL.                                                  IX1044.2
   000393         039600     STOP     RUN.                                                IX1044.2
   000394         039700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1044.2 193 245
   000395         039800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1044.2 193 246
   000396         039900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1044.2 193 244
   000397         040000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1044.2 193 243
   000398         040100     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1044.2 200
   000399         040200 PRINT-DETAIL.                                                    IX1044.2
   000400         040300     IF REC-CT NOT EQUAL TO ZERO                                  IX1044.2 242 IMP
   000401      1  040400             MOVE "." TO PARDOT-X                                 IX1044.2 197
   000402      1  040500             MOVE REC-CT TO DOTVALUE.                             IX1044.2 242 198
   000403         040600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1044.2 189 97 453
   000404         040700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1044.2 193 453
   000405      1  040800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1044.2 474 488
   000406      1  040900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1044.2 489 497
   000407         041000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1044.2 IMP 193 IMP 205
   000408         041100     MOVE SPACE TO CORRECT-X.                                     IX1044.2 IMP 219
   000409         041200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1044.2 242 IMP IMP 195
   000410         041300     MOVE     SPACE TO RE-MARK.                                   IX1044.2 IMP 200
   000411         041400 HEAD-ROUTINE.                                                    IX1044.2
   000412         041500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1044.2 252 98 453
   000413         041600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1044.2 257 98 453
   000414         041700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1044.2 266 98 453
   000415         041800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1044.2 278 98 453
   000416         041900 COLUMN-NAMES-ROUTINE.                                            IX1044.2
   000417         042000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1044.2 230 98 453
   000418         042100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1044.2 235 98 453
   000419         042200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1044.2 322 98 453
   000420         042300 END-ROUTINE.                                                     IX1044.2
   000421         042400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1044.2 322 98 453
   000422         042500 END-RTN-EXIT.                                                    IX1044.2
   000423         042600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1044.2 285 98 453
   000424         042700 END-ROUTINE-1.                                                   IX1044.2
   000425         042800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1044.2 244 248 245
   000426         042900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1044.2 248 243 248
   000427         043000      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1044.2 246 248
   000428         043100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1044.2
   000429         043200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1044.2 246 308
   000430         043300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1044.2 248 310
   000431         043400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1044.2 307 293
   000432         043500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1044.2 290 98 453
   000433         043600  END-ROUTINE-12.                                                 IX1044.2
   000434         043700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1044.2 296
   000435         043800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1044.2 244 IMP
   000436      1  043900         MOVE "NO " TO ERROR-TOTAL                                IX1044.2 294
   000437         044000         ELSE                                                     IX1044.2
   000438      1  044100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1044.2 244 294
   000439         044200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1044.2 290 98
   000440         044300     PERFORM WRITE-LINE.                                          IX1044.2 453
   000441         044400 END-ROUTINE-13.                                                  IX1044.2
   000442         044500     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1044.2 243 IMP
   000443      1  044600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1044.2 294
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000444      1  044700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1044.2 243 294
   000445         044800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1044.2 296
   000446         044900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1044.2 290 98 453
   000447         045000      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1044.2 245 IMP
   000448      1  045100          MOVE "NO " TO ERROR-TOTAL                               IX1044.2 294
   000449      1  045200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1044.2 245 294
   000450         045300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1044.2 296
   000451         045400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1044.2 290 98 453
   000452         045500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1044.2 298 98 453
   000453         045600 WRITE-LINE.                                                      IX1044.2
   000454         045700     ADD 1 TO RECORD-COUNT.                                       IX1044.2 250
   000455         045800     IF RECORD-COUNT GREATER 42                                   IX1044.2 250
   000456      1  045900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1044.2 98 249
   000457      1  046000         MOVE SPACE TO DUMMY-RECORD                               IX1044.2 IMP 98
   000458      1  046100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1044.2 98
   000459      1  046200         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1044.2 252 98 469
   000460      1  046300         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1044.2 257 98 469
   000461      1  046400         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1044.2 266 98 469
   000462      1  046500         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1044.2 278 98 469
   000463      1  046600         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1044.2 230 98 469
   000464      1  046700         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1044.2 235 98 469
   000465      1  046800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1044.2 322 98 469
   000466      1  046900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1044.2 249 98
   000467      1  047000         MOVE ZERO TO RECORD-COUNT.                               IX1044.2 IMP 250
   000468         047100     PERFORM WRT-LN.                                              IX1044.2 469
   000469         047200 WRT-LN.                                                          IX1044.2
   000470         047300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1044.2 98
   000471         047400     MOVE SPACE TO DUMMY-RECORD.                                  IX1044.2 IMP 98
   000472         047500 BLANK-LINE-PRINT.                                                IX1044.2
   000473         047600     PERFORM WRT-LN.                                              IX1044.2 469
   000474         047700 FAIL-ROUTINE.                                                    IX1044.2
   000475         047800     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1044.2 205 IMP
   000476      1  047900            GO TO   FAIL-ROUTINE-WRITE.                           IX1044.2 483
   000477         048000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1044.2 219 IMP 483
   000478         048100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1044.2 251 321
   000479         048200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1044.2 316
   000480         048300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1044.2 313 98 453
   000481         048400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1044.2 IMP 321
   000482         048500     GO TO  FAIL-ROUTINE-EX.                                      IX1044.2 488
   000483         048600 FAIL-ROUTINE-WRITE.                                              IX1044.2
   000484         048700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1044.2 201 97 453
   000485         048800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1044.2 251 229
   000486         048900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1044.2 216 97 453
   000487         049000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1044.2 IMP 229
   000488         049100 FAIL-ROUTINE-EX. EXIT.                                           IX1044.2
   000489         049200 BAIL-OUT.                                                        IX1044.2
   000490         049300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1044.2 206 IMP 492
   000491         049400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1044.2 220 IMP 497
   000492         049500 BAIL-OUT-WRITE.                                                  IX1044.2
   000493         049600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1044.2 220 320 206 318
   000494         049700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1044.2 251 321
   000495         049800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1044.2 313 98 453
   000496         049900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1044.2 IMP 321
   000497         050000 BAIL-OUT-EX. EXIT.                                               IX1044.2
   000498         050100 CCVS1-EXIT.                                                      IX1044.2
   000499         050200     EXIT.                                                        IX1044.2
   000500         050300 SECT-IX-04-001 SECTION.                                          IX1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000501         050400 WRITE-INIT-GF-01.                                                IX1044.2
   000502         050500     MOVE     "CREATE IX-FS2" TO  FEATURE                         IX1044.2 191
   000503         050600     MOVE     "IX-FS2"        TO  XFILE-NAME (2).                 IX1044.2 156
   000504         050700     MOVE     "R1-F-G"        TO  XRECORD-NAME (2).               IX1044.2 158
   000505         050800     MOVE     CCVS-PGM-ID     TO  XPROGRAM-NAME (2).              IX1044.2 328 168
   000506         050900     MOVE     000240          TO  XRECORD-LENGTH (2).             IX1044.2 170
   000507         051000     MOVE     "RC"            TO  CHARS-OR-RECORDS (2).           IX1044.2 172
   000508         051100     MOVE     0001            TO  XBLOCK-SIZE       (2).          IX1044.2 174
   000509         051200     MOVE     000500          TO  RECORDS-IN-FILE  (2).           IX1044.2 176
   000510         051300     MOVE    "IX"                TO XFILE-ORGANIZATION (2).       IX1044.2 178
   000511         051400     MOVE    "WRITE-TEST-GF-01" TO PAR-NAME.                      IX1044.2 195
   000512         051500     MOVE     "S"             TO  XLABEL-TYPE        (2).         IX1044.2 180
   000513         051600     MOVE     000001          TO  XRECORD-NUMBER     (2).         IX1044.2 162
   000514         051700*INITIALIZE  RECORD WORK AREA NUMBER 2.                           IX1044.2
   000515         051800     MOVE     1         TO  WRK-CS-09V00-012.                     IX1044.2 116
   000516         051900     MOVE     ZERO      TO  WRK-CS-09V00-013 WRK-CS-09V00-014     IX1044.2 IMP 117 118
   000517         052000                            WRK-CS-09V00-015 WRK-CS-09V00-016     IX1044.2 119 120
   000518         052100                            WRK-CS-09V00-017 WRK-CS-09V00-018.    IX1044.2 121 122
   000519         052200     MOVE     SPACE     TO  IX-FS2-STATUS.                        IX1044.2 IMP 123
   000520         052300     MOVE    ZERO TO WRK-DU-09V00-001.                            IX1044.2 IMP 113
   000521         052400     OPEN     OUTPUT    IX-FS2.                                   IX1044.2 99
   000522         052500     MOVE GRP-0101 TO IX-FS2-KEY.                                 IX1044.2 111 108
   000523         052600     MOVE     IX-FS2-STATUS TO WRK-XN-0002-001.                   IX1044.2 123 124
   000524         052700*CAPTURE STATUS KEY AFTER  OPEN STATEMENT IS EXECUTED.            IX1044.2
   000525         052800 WRITE-TEST-GF-01.                                                IX1044.2
   000526         052900     MOVE    "99"  TO IX-FS2-STATUS.                              IX1044.2 123
   000527         053000     MOVE     XRECORD-NUMBER (2) TO WRK-DU-09V00-001.             IX1044.2 162 113
   000528         053100     MOVE     GRP-0101 TO XRECORD-KEY (2).                        IX1044.2 111 183
   000529         053200     MOVE     FILE-RECORD-INFO (2) TO IX-FS2R1-F-G-240.           IX1044.2 153 104
   000530         053300     WRITE   IX-FS2R1-F-G-240.                                    IX1044.2 104
   000531         053400     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX1044.2 123
   000532      1  053500         ADD  1  TO WRK-CS-09V00-016.                             IX1044.2 120
   000533         053600     IF       XRECORD-NUMBER (2) EQUAL TO 500                     IX1044.2 162
   000534      1  053700              GO TO  WRITE-TEST-GF-01-2.                          IX1044.2 537
   000535         053800     ADD      01 TO  XRECORD-NUMBER (2).                          IX1044.2 162
   000536         053900     GO TO    WRITE-TEST-GF-01.                                   IX1044.2 525
   000537         054000 WRITE-TEST-GF-01-2.                                              IX1044.2
   000538         054100     IF       WRK-CS-09V00-014 NOT EQUAL TO ZERO                  IX1044.2 118 IMP
   000539      1  054200              MOVE "EXCEPTIONS/ERRORS" TO RE-MARK                 IX1044.2 200
   000540      1  054300              MOVE  ZERO TO CORRECT-18V0                          IX1044.2 IMP 226
   000541      1  054400              MOVE WRK-CS-09V00-014 TO COMPUTED-18V0              IX1044.2 118 213
   000542      1  054500              MOVE "IX-41 4.9.2                       " TO RE-MARKIX1044.2 200
   000543      1  054600              PERFORM   FAIL                                      IX1044.2 396
   000544         054700              ELSE                                                IX1044.2
   000545      1  054800              PERFORM   PASS.                                     IX1044.2 395
   000546         054900     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000547         055000 WRITE-TEST-GF-02.                                                IX1044.2
   000548         055100     MOVE     "CREATE IX-FS2" TO  FEATURE                         IX1044.2 191
   000549         055200     MOVE    "WRITE-TEST-GF-02" TO PAR-NAME.                      IX1044.2 195
   000550         055300     IF       XRECORD-NUMBER (2) NOT EQUAL TO 500                 IX1044.2 162
   000551      1  055400              MOVE "INCORRECT COUNT" TO RE-MARK                   IX1044.2 200
   000552      1  055500              MOVE  500 TO CORRECT-18V0                           IX1044.2 226
   000553      1  055600             MOVE   XRECORD-NUMBER (2)  TO COMPUTED-18V0          IX1044.2 162 213
   000554      1  055700              MOVE "IX-41 4.9.2                       " TO RE-MARKIX1044.2 200
   000555      1  055800              PERFORM  FAIL                                       IX1044.2 396
   000556         055900              ELSE                                                IX1044.2
   000557      1  056000              PERFORM PASS.                                       IX1044.2 395
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000558         056100     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000559         056200 WRITE-TEST-GF-03.                                                IX1044.2
   000560         056300     MOVE "OPEN: 00 EXP.    " TO  FEATURE.                        IX1044.2 191
   000561         056400     MOVE    "WRITE-TEST-GF-03" TO PAR-NAME.                      IX1044.2 195
   000562         056500     IF       WRK-XN-0002-001 NOT EQUAL TO  "00"                  IX1044.2 124
   000563      1  056600              MOVE WRK-XN-0002-001 TO COMPUTED-A                  IX1044.2 124 206
   000564      1  056700              MOVE "00" TO CORRECT-A                              IX1044.2 220
   000565      1  056800              MOVE "IX-41 4.9.2; IX-3 1.3.4  (1) A    " TO RE-MARKIX1044.2 200
   000566      1  056900              PERFORM  FAIL                                       IX1044.2 396
   000567         057000              ELSE                                                IX1044.2
   000568      1  057100              PERFORM  PASS.                                      IX1044.2 395
   000569         057200     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000570         057300 WRITE-TEST-GF-04.                                                IX1044.2
   000571         057400     MOVE     "WRITE: 00 EXP." TO  FEATURE.                       IX1044.2 191
   000572         057500     MOVE    "WRITE-TEST-GF-04" TO PAR-NAME.                      IX1044.2 195
   000573         057600     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX1044.2 123
   000574      1  057700              MOVE IX-FS2-STATUS TO COMPUTED-A                    IX1044.2 123 206
   000575      1  057800              MOVE "00" TO CORRECT-A                              IX1044.2 220
   000576      1  057900              MOVE "IX-41 4.9.2; IX-3 1.3.4 (1) A     " TO RE-MARKIX1044.2 200
   000577      1  058000              PERFORM   FAIL                                      IX1044.2 396
   000578         058100              ELSE                                                IX1044.2
   000579      1  058200              PERFORM   PASS.                                     IX1044.2 395
   000580         058300     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000581         058400 WRITE-TEST-GF-05.                                                IX1044.2
   000582         058500     MOVE "WRITE: 00 EXP.   " TO  FEATURE.                        IX1044.2 191
   000583         058600     MOVE    "WRITE-TEST-GF-05" TO PAR-NAME.                      IX1044.2 195
   000584         058700     IF      WRK-CS-09V00-016    NOT EQUAL TO ZERO                IX1044.2 120 IMP
   000585      1  058800              MOVE   ZERO TO CORRECT-18V0                         IX1044.2 IMP 226
   000586      1  058900              MOVE    WRK-CS-09V00-016 TO COMPUTED-18V0           IX1044.2 120 213
   000587      1  059000              MOVE "IX-41 4.9.2; IX-3 1.3.4 (1) A     " TO RE-MARKIX1044.2 200
   000588      1  059100              PERFORM   FAIL                                      IX1044.2 396
   000589         059200              ELSE                                                IX1044.2
   000590      1  059300              PERFORM  PASS.                                      IX1044.2 395
   000591         059400     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000592         059500 WRITE-TEST-GF-06.                                                IX1044.2
   000593         059600     MOVE "CLOSE: 00 EXP.   " TO  FEATURE.                        IX1044.2 191
   000594         059700     MOVE    "WRITE-TEST-GF-06" TO PAR-NAME.                      IX1044.2 195
   000595         059800     MOVE     SPACE  TO  IX-FS2-STATUS.                           IX1044.2 IMP 123
   000596         059900     CLOSE    IX-FS2.                                             IX1044.2 99
   000597         060000     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX1044.2 123
   000598      1  060100              MOVE "CLOSE/STATUS; IX-3 1.3.4 (1) A" TO RE-MARK    IX1044.2 200
   000599      1  060200              MOVE   IX-FS2-STATUS TO COMPUTED-A                  IX1044.2 123 206
   000600      1  060300              MOVE "00" TO CORRECT-A                              IX1044.2 220
   000601      1  060400              PERFORM FAIL                                        IX1044.2 396
   000602         060500              ELSE                                                IX1044.2
   000603      1  060600              PERFORM PASS.                                       IX1044.2 395
   000604         060700     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000605         060800 READ-INIT-F1-01.                                                 IX1044.2
   000606         060900     MOVE     2     TO  WRK-CS-09V00-012.                         IX1044.2 116
   000607         061000     MOVE     ZERO  TO  WRK-CS-09V00-013.                         IX1044.2 IMP 117
   000608         061100     MOVE     ZERO  TO  WRK-CS-09V00-014.                         IX1044.2 IMP 118
   000609         061200     MOVE     ZERO  TO  WRK-CS-09V00-015.                         IX1044.2 IMP 119
   000610         061300     MOVE     ZERO  TO  WRK-CS-09V00-016.                         IX1044.2 IMP 120
   000611         061400     MOVE     ZERO  TO  WRK-CS-09V00-017.                         IX1044.2 IMP 121
   000612         061500     MOVE     ZERO  TO  WRK-CS-09V00-018.                         IX1044.2 IMP 122
   000613         061600     MOVE    SPACE TO IX-FS2-STATUS.                              IX1044.2 IMP 123
   000614         061700     OPEN     I-O  IX-FS2.                                        IX1044.2 99
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000615         061800     MOVE     SPACE     TO  WRK-XN-0002-002                       IX1044.2 IMP 125
   000616         061900     MOVE     SPACE     TO  WRK-XN-0002-003                       IX1044.2 IMP 126
   000617         062000     MOVE     SPACE     TO  WRK-XN-0002-004                       IX1044.2 IMP 127
   000618         062100     MOVE      IX-FS2-STATUS TO WRK-XN-0002-001                   IX1044.2 123 124
   000619         062200     MOVE     SPACE TO IX-FS2-STATUS.                             IX1044.2 IMP 123
   000620         062300*CAPTURE THE CONTENTS OF STATUS KEY AFTER OPEN IS EXECUTED.       IX1044.2
   000621         062400 READ-TEST-F1-01.                                                 IX1044.2
   000622         062500     ADD      1 TO WRK-CS-09V00-014.                              IX1044.2 118
   000623         062600     ADD      1 TO WRK-CS-09V00-015.                              IX1044.2 119
   000624         062700     READ  IX-FS2.                                                IX1044.2 99
   000625         062800     IF        IX-FS2-STATUS EQUAL TO "10"                        IX1044.2 123
   000626      1  062900              GO TO  READ-TEST-F1-01-3.                           IX1044.2 644
   000627         063000     MOVE     IX-FS2R1-F-G-240 TO FILE-RECORD-INFO (2).           IX1044.2 104 153
   000628         063100     IF       WRK-CS-09V00-015 EQUAL TO 5                         IX1044.2 119
   000629      1  063200              ADD 01 TO UPDATE-NUMBER (2)                         IX1044.2 164
   000630      1  063300     MOVE     FILE-RECORD-INFO (2) TO IX-FS2R1-F-G-240            IX1044.2 153 104
   000631      1  063400             PERFORM  READ-010-UPDATE                             IX1044.2 637
   000632      1  063500           MOVE ZERO TO WRK-CS-09V00-015                          IX1044.2 IMP 119
   000633      1  063600              GO TO  READ-TEST-F1-01-2.                           IX1044.2 639
   000634         063700     IF       WRK-CS-09V00-014 GREATER 500                        IX1044.2 118
   000635      1  063800              GO TO  READ-TEST-F1-01-3.                           IX1044.2 644
   000636         063900     GO TO    READ-TEST-F1-01.                                    IX1044.2 621
   000637         064000 READ-010-UPDATE.                                                 IX1044.2
   000638         064100     REWRITE   IX-FS2R1-F-G-240.                                  IX1044.2 104
   000639         064200 READ-TEST-F1-01-2.                                               IX1044.2
   000640         064300     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX1044.2 123
   000641      1  064400              ADD 1 TO WRK-CS-09V00-016.                          IX1044.2 120
   000642         064500     MOVE    SPACE  TO   IX-FS2-STATUS.                           IX1044.2 IMP 123
   000643         064600     GO TO    READ-TEST-F1-01.                                    IX1044.2 621
   000644         064700 READ-TEST-F1-01-3.                                               IX1044.2
   000645         064800     MOVE    "READ: 10 EXP. "  TO FEATURE.                        IX1044.2 191
   000646         064900     MOVE    "READ-TEST-F1-01-3" TO PAR-NAME.                     IX1044.2 195
   000647         065000     IF       WRK-CS-09V00-013 NOT EQUAL TO 1                     IX1044.2 117
   000648      1  065100              MOVE  "IX-4 1.3.4 (2) A                 " TO RE-MARKIX1044.2 200
   000649      1  065200              MOVE WRK-CS-09V00-013 TO COMPUTED-18V0              IX1044.2 117 213
   000650      1  065300              MOVE  1 TO CORRECT-18V0                             IX1044.2 226
   000651      1  065400              PERFORM FAIL                                        IX1044.2 396
   000652         065500              ELSE                                                IX1044.2
   000653      1  065600              PERFORM PASS.                                       IX1044.2 395
   000654         065700     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000655         065800 READ-TEST-F1-02.                                                 IX1044.2
   000656         065900     MOVE    "READ                "  TO FEATURE.                  IX1044.2 191
   000657         066000     MOVE    "READ-TEST-F1-02  " TO PAR-NAME.                     IX1044.2 195
   000658         066100     IF       WRK-CS-09V00-014 NOT EQUAL TO 501                   IX1044.2 118
   000659      1  066200              MOVE "INCORRECT COUNT IX-28 4.5.2" TO RE-MARK       IX1044.2 200
   000660      1  066300              MOVE WRK-CS-09V00-014 TO COMPUTED-18V0              IX1044.2 118 213
   000661      1  066400              MOVE 501 TO CORRECT-18V0                            IX1044.2 226
   000662      1  066500              PERFORM FAIL                                        IX1044.2 396
   000663         066600              ELSE                                                IX1044.2
   000664      1  066700              PERFORM PASS.                                       IX1044.2 395
   000665         066800     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000666         066900 READ-TEST-F1-03.                                                 IX1044.2
   000667         067000     MOVE    "OPEN:  00 EXP.      "  TO FEATURE.                  IX1044.2 191
   000668         067100     MOVE    "READ-TEST-F1-03  " TO PAR-NAME.                     IX1044.2 195
   000669         067200     IF       WRK-XN-0002-001 NOT EQUAL TO "00"                   IX1044.2 124
   000670      1  067300              MOVE  "IX-3 1.3.4 (1) A                 " TO RE-MARKIX1044.2 200
   000671      1  067400              MOVE WRK-XN-0002-001 TO COMPUTED-A                  IX1044.2 124 206
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000672      1  067500              MOVE  "00" TO CORRECT-A                             IX1044.2 220
   000673      1  067600              PERFORM FAIL                                        IX1044.2 396
   000674         067700              ELSE                                                IX1044.2
   000675      1  067800              PERFORM PASS.                                       IX1044.2 395
   000676         067900     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000677         068000 READ-TEST-F1-04.                                                 IX1044.2
   000678         068100     MOVE    "READ AT END: 10 EXP."  TO FEATURE.                  IX1044.2 191
   000679         068200     MOVE    "READ-TEST-F1-04  " TO PAR-NAME.                     IX1044.2 195
   000680         068300     IF        IX-FS2-STATUS NOT EQUAL  TO "10"                   IX1044.2 123
   000681      1  068400              MOVE "ATEND/STATUS" TO RE-MARK                      IX1044.2 200
   000682      1  068500              MOVE  "IX-4 1.3.4 (2) A                 " TO RE-MARKIX1044.2 200
   000683      1  068600              MOVE  IX-FS2-STATUS TO COMPUTED-A                   IX1044.2 123 206
   000684      1  068700              MOVE "10" TO CORRECT-A                              IX1044.2 220
   000685      1  068800              PERFORM FAIL                                        IX1044.2 396
   000686         068900              ELSE                                                IX1044.2
   000687      1  069000              PERFORM PASS.                                       IX1044.2 395
   000688         069100     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000689         069200 READ-TEST-F1-05.                                                 IX1044.2
   000690         069300     MOVE    "READ:   10 EXP.     "  TO FEATURE.                  IX1044.2 191
   000691         069400     MOVE    "READ-TEST-F1-05  " TO PAR-NAME.                     IX1044.2 195
   000692         069500     IF       WRK-XN-0002-002 NOT EQUAL TO "10"                   IX1044.2 125
   000693      1  069600              MOVE  "IX-4 1.3.4 (2) A                 " TO RE-MARKIX1044.2 200
   000694      1  069700              MOVE  WRK-XN-0002-002 TO COMPUTED-A                 IX1044.2 125 206
   000695      1  069800              MOVE  "10" TO CORRECT-A                             IX1044.2 220
   000696      1  069900              PERFORM FAIL                                        IX1044.2 396
   000697         070000              ELSE                                                IX1044.2
   000698      1  070100              PERFORM PASS.                                       IX1044.2 395
   000699         070200     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000700         070300 READ-TEST-F1-06.                                                 IX1044.2
   000701         070400     MOVE    "READ NO EXCEPTION 10"  TO FEATURE.                  IX1044.2 191
   000702         070500     MOVE    "READ-TEST-F1-06  " TO PAR-NAME.                     IX1044.2 195
   000703         070600     IF       WRK-XN-0002-003 NOT EQUAL TO "10"                   IX1044.2 126
   000704      1  070700              MOVE "NO/EXCEPTION IX-4 1.3.4 (2) A" TO  RE-MARK    IX1044.2 200
   000705      1  070800              MOVE WRK-XN-0002-003 TO COMPUTED-A                  IX1044.2 126 206
   000706      1  070900              MOVE "10" TO CORRECT-A                              IX1044.2 220
   000707      1  071000              PERFORM FAIL                                        IX1044.2 396
   000708         071100              ELSE                                                IX1044.2
   000709      1  071200              PERFORM PASS.                                       IX1044.2 395
   000710         071300     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000711         071400 READ-TEST-F1-07.                                                 IX1044.2
   000712         071500     MOVE    "CLOSE:    00 EXP.   "  TO FEATURE.                  IX1044.2 191
   000713         071600     MOVE    "READ-TEST-F1-07  " TO PAR-NAME.                     IX1044.2 195
   000714         071700     MOVE     SPACE TO IX-FS2-STATUS.                             IX1044.2 IMP 123
   000715         071800     CLOSE    IX-FS2                                              IX1044.2 99
   000716         071900     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX1044.2 123
   000717      1  072000              MOVE "CLOSE/STATUS  IX-3  1.3.4 (1) A" TO RE-MARK   IX1044.2 200
   000718      1  072100              MOVE  IX-FS2-STATUS TO  COMPUTED-A                  IX1044.2 123 206
   000719      1  072200              MOVE "00" TO CORRECT-A                              IX1044.2 220
   000720      1  072300              PERFORM FAIL                                        IX1044.2 396
   000721         072400              ELSE                                                IX1044.2
   000722      1  072500              PERFORM PASS.                                       IX1044.2 395
   000723         072600     PERFORM  PRINT-DETAIL.                                       IX1044.2 399
   000724         072700 CCVS-EXIT SECTION.                                               IX1044.2
   000725         072800 CCVS-999999.                                                     IX1044.2
   000726         072900     GO TO CLOSE-FILES.                                           IX1044.2 376
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      185   ALTERNATE-KEY1
      187   ALTERNATE-KEY2
      251   ANSI-REFERENCE . . . . . . . .  478 485 494
       95   C-ABORT. . . . . . . . . . . .  M357 M380
       89   C-ALL. . . . . . . . . . . . .  M382
       85   C-DATE . . . . . . . . . . . .  M359
       91   C-DELETED. . . . . . . . . . .  M384
       90   C-FAIL . . . . . . . . . . . .  M383
       94   C-INDENT
       92   C-INSPECT. . . . . . . . . . .  M385
       87   C-NO-OF-TESTS. . . . . . . . .  M358
       93   C-NOTE
       88   C-OK . . . . . . . . . . . . .  M381
       86   C-TIME . . . . . . . . . . . .  M360
      230   CCVS-C-1 . . . . . . . . . . .  417 463
      235   CCVS-C-2 . . . . . . . . . . .  418 464
      285   CCVS-E-1 . . . . . . . . . . .  423
      290   CCVS-E-2 . . . . . . . . . . .  432 439 446 451
      293   CCVS-E-2-2 . . . . . . . . . .  M431
      298   CCVS-E-3 . . . . . . . . . . .  452
      307   CCVS-E-4 . . . . . . . . . . .  431
      308   CCVS-E-4-1 . . . . . . . . . .  M429
      310   CCVS-E-4-2 . . . . . . . . . .  M430
      252   CCVS-H-1 . . . . . . . . . . .  412 459
      257   CCVS-H-2A. . . . . . . . . . .  413 460
      266   CCVS-H-2B. . . . . . . . . . .  414 461
      278   CCVS-H-3 . . . . . . . . . . .  415 462
      328   CCVS-PGM-ID. . . . . . . . . .  355 365 365 378 505
      172   CHARS-OR-RECORDS . . . . . . .  M507
      212   CM-18V0
      206   COMPUTED-A . . . . . . . . . .  207 209 210 211 212 490 493 M563 M574 M599 M671 M683 M694 M705 M718
      207   COMPUTED-N
      205   COMPUTED-X . . . . . . . . . .  M407 475
      209   COMPUTED-0V18
      211   COMPUTED-14V4
      213   COMPUTED-18V0. . . . . . . . .  M541 M553 M586 M649 M660
      210   COMPUTED-4V14
      229   COR-ANSI-REFERENCE . . . . . .  M485 M487
      220   CORRECT-A. . . . . . . . . . .  221 222 223 224 225 491 493 M564 M575 M600 M672 M684 M695 M706 M719
      221   CORRECT-N
      219   CORRECT-X. . . . . . . . . . .  M408 477
      222   CORRECT-0V18
      224   CORRECT-14V4
      226   CORRECT-18V0 . . . . . . . . .  M540 M552 M585 M650 M661
      223   CORRECT-4V14
      225   CR-18V0
      243   DELETE-COUNTER . . . . . . . .  384 M397 426 442 444
      198   DOTVALUE . . . . . . . . . . .  M402
      249   DUMMY-HOLD . . . . . . . . . .  M456 466
       98   DUMMY-RECORD . . . . . . . . .  M412 M413 M414 M415 M417 M418 M419 M421 M423 M432 M439 M446 M451 M452 456 M457
                                            458 M459 M460 M461 M462 M463 M464 M465 M466 470 M471 M480 M495
      137   DUMMY-WRK-INDENT-5
      133   DUMMY-WRK-REC
      134   DUMMY-WRK1 . . . . . . . . . .  135
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    17
0 Defined   Cross-reference of data names   References

0     135   DUMMY-WRK2
      296   ENDER-DESC . . . . . . . . . .  M434 M445 M450
      244   ERROR-COUNTER. . . . . . . . .  383 M396 425 435 438
      248   ERROR-HOLD . . . . . . . . . .  382 M425 M426 M426 M427 430
      294   ERROR-TOTAL. . . . . . . . . .  M436 M438 M443 M444 M448 M449
      191   FEATURE. . . . . . . . . . . .  M502 M548 M560 M571 M582 M593 M645 M656 M667 M678 M690 M701 M712
      153   FILE-RECORD-INFO . . . . . . .  M373 529 M627 630
      154   FILE-RECORD-INFO-P1-120
      181   FILE-RECORD-INFO-P121-240
      139   FILE-RECORD-INFO-SKELETON. . .  372
      138   FILE-RECORD-INFORMATION-REC
      115   GRP-0001
      111   GRP-0101 . . . . . . . . . . .  522 528
      322   HYPHEN-LINE. . . . . . . . . .  419 421 465
      288   ID-AGAIN . . . . . . . . . . .  M365
      321   INF-ANSI-REFERENCE . . . . . .  M478 M481 M494 M496
      316   INFO-TEXT. . . . . . . . . . .  M479
      245   INSPECT-COUNTER. . . . . . . .  385 M394 425 447 449
       99   IX-FS2 . . . . . . . . . . . .  71 333 521 596 614 624 715
      108   IX-FS2-KEY . . . . . . . . . .  77 M522
      105   IX-FS2-REC-120
      106   IX-FS2-REC-120-240
      123   IX-FS2-STATUS. . . . . . . . .  76 347 M519 523 M526 531 573 574 M595 597 599 M613 618 M619 625 640 M642 680
                                            683 M714 716 718
      104   IX-FS2R1-F-G-240 . . . . . . .  M529 530 627 M630 638
      166   ODO-NUMBER
      193   P-OR-F . . . . . . . . . . . .  M394 M395 M396 M397 404 M407
      195   PAR-NAME . . . . . . . . . . .  M409 M511 M549 M561 M572 M583 M594 M646 M657 M668 M679 M691 M702 M713
      197   PARDOT-X . . . . . . . . . . .  M401
      246   PASS-COUNTER . . . . . . . . .  381 M395 427 429
       96   PRINT-FILE . . . . . . . . . .  69 364 389
       97   PRINT-REC. . . . . . . . . . .  M403 M484 M486
       81   RAW-DATA . . . . . . . . . . .  64 354 356 363 377 379 388
       84   RAW-DATA-KEY . . . . . . . . .  68 M355 M378
       83   RAW-DATA-SATZ. . . . . . . . .  361 386
      200   RE-MARK. . . . . . . . . . . .  M398 M410 M539 M542 M551 M554 M565 M576 M587 M598 M648 M659 M670 M681 M682 M693
                                            M704 M717
      242   REC-CT . . . . . . . . . . . .  400 402 409
      241   REC-SKL-SUB. . . . . . . . . .  M368 M371 373
      250   RECORD-COUNT . . . . . . . . .  M454 455 M467
      176   RECORDS-IN-FILE. . . . . . . .  M509
      160   REELUNIT-NUMBER
      201   TEST-COMPUTED. . . . . . . . .  484
      216   TEST-CORRECT . . . . . . . . .  486
      269   TEST-ID. . . . . . . . . . . .  M365
      189   TEST-RESULTS . . . . . . . . .  M366 403
      247   TOTAL-ERROR
      164   UPDATE-NUMBER. . . . . . . . .  M629
      116   WRK-CS-09V00-012 . . . . . . .  338 M515 M606
      117   WRK-CS-09V00-013 . . . . . . .  M335 M516 M607 647 649
      118   WRK-CS-09V00-014 . . . . . . .  M343 M516 538 541 M608 M622 634 658 660
      119   WRK-CS-09V00-015 . . . . . . .  M517 M609 M623 628 M632
      120   WRK-CS-09V00-016 . . . . . . .  M517 M532 584 586 M610 M641
      121   WRK-CS-09V00-017 . . . . . . .  M345 M518 M611
      122   WRK-CS-09V00-018 . . . . . . .  M518 M612
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    18
0 Defined   Cross-reference of data names   References

0     113   WRK-DU-09V00-001 . . . . . . .  M520 M527
      124   WRK-XN-0002-001. . . . . . . .  M523 562 563 M618 669 671
      125   WRK-XN-0002-002. . . . . . . .  M347 M615 692 694
      126   WRK-XN-0002-003. . . . . . . .  M348 M616 703 705
      127   WRK-XN-0002-004. . . . . . . .  M617
      128   WRK-XN-0002-005
      129   WRK-XN-0002-006
      130   WRK-XN-0002-007
      131   WRK-XN-0002-008
      132   WRK-XN-0002-009
      174   XBLOCK-SIZE. . . . . . . . . .  M508
      156   XFILE-NAME . . . . . . . . . .  M503
      178   XFILE-ORGANIZATION . . . . . .  M510
      180   XLABEL-TYPE. . . . . . . . . .  M512
      168   XPROGRAM-NAME. . . . . . . . .  M505
      183   XRECORD-KEY. . . . . . . . . .  M528
      170   XRECORD-LENGTH . . . . . . . .  M506
      158   XRECORD-NAME . . . . . . . . .  M504
      162   XRECORD-NUMBER . . . . . . . .  346 M513 527 533 M535 550 553
      318   XXCOMPUTED . . . . . . . . . .  M493
      320   XXCORRECT. . . . . . . . . . .  M493
      313   XXINFO . . . . . . . . . . . .  480 495
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    19
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

      489   BAIL-OUT . . . . . . . . . . .  P406
      497   BAIL-OUT-EX. . . . . . . . . .  E406 G491
      492   BAIL-OUT-WRITE . . . . . . . .  G490
      472   BLANK-LINE-PRINT
      724   CCVS-EXIT
      374   CCVS-INIT-EXIT
      370   CCVS-INIT-FILE . . . . . . . .  P369
      725   CCVS-999999
      352   CCVS1
      498   CCVS1-EXIT . . . . . . . . . .  G375
      376   CLOSE-FILES. . . . . . . . . .  G726
      416   COLUMN-NAMES-ROUTINE . . . . .  E367
      397   DE-LETE
      362   END-E-1. . . . . . . . . . . .  G356 G361
      387   END-E-2. . . . . . . . . . . .  G379 G386
      420   END-ROUTINE. . . . . . . . . .  P389
      424   END-ROUTINE-1
      433   END-ROUTINE-12
      441   END-ROUTINE-13 . . . . . . . .  E389
      422   END-RTN-EXIT
      396   FAIL . . . . . . . . . . . . .  P543 P555 P566 P577 P588 P601 P651 P662 P673 P685 P696 P707 P720
      474   FAIL-ROUTINE . . . . . . . . .  P405
      488   FAIL-ROUTINE-EX. . . . . . . .  E405 G482
      483   FAIL-ROUTINE-WRITE . . . . . .  G476 G477
      411   HEAD-ROUTINE . . . . . . . . .  P367
      394   INSPT
      332   IX-FS2-01
      349   IX-FS2-01-EXIT . . . . . . . .  G339
      334   IX-FS2-01-01
      340   IX-FS2-01-03 . . . . . . . . .  D336
      344   IX-FS2-01-05 . . . . . . . . .  D337
      353   OPEN-FILES
      395   PASS . . . . . . . . . . . . .  P545 P557 P568 P579 P590 P603 P653 P664 P675 P687 P698 P709 P722
      399   PRINT-DETAIL . . . . . . . . .  P546 P558 P569 P580 P591 P604 P654 P665 P676 P688 P699 P710 P723
      605   READ-INIT-F1-01
      621   READ-TEST-F1-01. . . . . . . .  G636 G643
      639   READ-TEST-F1-01-2. . . . . . .  G633
      644   READ-TEST-F1-01-3. . . . . . .  G626 G635
      655   READ-TEST-F1-02
      666   READ-TEST-F1-03
      677   READ-TEST-F1-04
      689   READ-TEST-F1-05
      700   READ-TEST-F1-06
      711   READ-TEST-F1-07
      637   READ-010-UPDATE. . . . . . . .  P631
      500   SECT-IX-04-001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    20
0 Defined   Cross-reference of procedures   References

0     392   TERMINATE-CALL
      390   TERMINATE-CCVS
      501   WRITE-INIT-GF-01
      453   WRITE-LINE . . . . . . . . . .  P403 P404 P412 P413 P414 P415 P417 P418 P419 P421 P423 P432 P440 P446 P451 P452
                                            P480 P484 P486 P495
      525   WRITE-TEST-GF-01 . . . . . . .  G536
      537   WRITE-TEST-GF-01-2 . . . . . .  G534
      547   WRITE-TEST-GF-02
      559   WRITE-TEST-GF-03
      570   WRITE-TEST-GF-04
      581   WRITE-TEST-GF-05
      592   WRITE-TEST-GF-06
      469   WRT-LN . . . . . . . . . . . .  P459 P460 P461 P462 P463 P464 P465 P468 P473
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    21
0 Defined   Cross-reference of programs     References

        3   IX104A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX104A    Date 06/04/2022  Time 11:57:11   Page    22
0LineID  Message code  Message text

     73  IGYDS1298-I   Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX045" was treated as comments.

     96  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     99  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     99  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       4           4
-* Statistics for COBOL program IX104A:
 *    Source records = 726
 *    Data Division statements = 125
 *    Procedure Division statements = 360
 *    Generated COBOL statements = 0
 *    Program complexity factor = 371
0End of compilation 1,  program IX104A,  highest severity 0.
0Return code 0
