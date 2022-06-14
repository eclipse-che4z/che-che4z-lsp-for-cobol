1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:09   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:09   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2054.2
   000002         000200 PROGRAM-ID.                                                      IX2054.2
   000003         000300     IX205A.                                                      IX2054.2
   000004         000500*                                                              *  IX2054.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2054.2
   000006         000700*                                                              *  IX2054.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2054.2
   000008         000900*                                                              *  IX2054.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2054.2
   000010         001100*                                                              *  IX2054.2
   000011         001300*    THE FUNCTION OF THIS PROGRAM IS TO TEST THE PERMISSIBLE      IX2054.2
   000012         001400*    SYNTACTICAL CONSTRUCTS OF COBOL ELEMENTS ASSOCIATED WITH     IX2054.2
   000013         001500*    LEVEL 2 OF INDEXED I-O.  THE ELEMENTS TESTED IN THIS ROU-    IX2054.2
   000014         001600*    TINE ARE:                                                    IX2054.2
   000015         001700*                                                                 IX2054.2
   000016         001800*    (1) ACCESS MODE DYNAMIC;                                     IX2054.2
   000017         001900*    (2) ALTERNATE RECORD KEY WITHOUT THE DUPLICATES OPTION;      IX2054.2
   000018         002000*    (3) RESERVE CLAUSE;                                          IX2054.2
   000019         002100*    (4) SAME CLAUSE;                                             IX2054.2
   000020         002200*    (5) BLOCK CONTAINS INTEGER-1 TO INTEGER-2 CLAUSE;            IX2054.2
   000021         002300*    (6) VALUE OF IMPLEMENTOR-NAME.                               IX2054.2
   000022         002400*                                                                 IX2054.2
   000023         002500*   NEW TEST:   START ...                                         IX2054.2
   000024         002600*              KEY IS GREATER THAN OR EQUAL TO  ...               IX2054.2
   000025         002700*                                                                 IX2054.2
   000026         002800*    EACH ELEMENT TESTED WILL BE EXERCISED SEMANTICALLY BY THIS   IX2054.2
   000027         002900*    ROUTINE.  FILES ARE CREATED AND ACCESSED USING THE ACCESS    IX2054.2
   000028         003000*    MODE IS DYNAMIC.                                             IX2054.2
   000029         003100*                                                                 IX2054.2
   000030         003200*                                                                 IX2054.2
   000031         003300*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX2054.2
   000032         003400*                                                                 IX2054.2
   000033         003500*             X-24   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2054.2
   000034         003600*                    CLAUSE FOR DATA FILE IX-FS1                  IX2054.2
   000035         003700*             X-25   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX2054.2
   000036         003800*                    CLAUSE FOR DATA FILE IX-FD2                  IX2054.2
   000037         003900*             X-44   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2054.2
   000038         004000*                    CLAUSE FOR INDEX FILE IX-FS1                 IX2054.2
   000039         004100*             X-45   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX2054.2
   000040         004200*                    CLAUSE FOR INDEX FILE IX-FD2                 IX2054.2
   000041         004300*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX2054.2
   000042         004400*             X-62   FOR RAW-DATA                                 IX2054.2
   000043         004500*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX2054.2
   000044         004600*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX2054.2
   000045         004700*             X-84   LABEL RECORDS  FOR PRINT-FILE                IX2054.2
   000046         004800*                                                                 IX2054.2
   000047         004900*        NOTE:  X-CARDS 44, 45, 62 AND 84     ARE OPTIONAL        IX2054.2
   000048         005000*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX2054.2
   000049         005100*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX2054.2
   000050         005200*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX2054.2
   000051         005300*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX2054.2
   000052         005400*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX2054.2
   000053         005500*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX2054.2
   000054         005600*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX2054.2
   000055         005700*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX2054.2
   000056         005800*               THEY ARE AS FOLLOWS                               IX2054.2
   000057         005900*                                                                 IX2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000*                  P  SELECTS X-CARDS 62                          IX2054.2
   000059         006100*                  J  SELECTS X-CARDS 44 AND 45                   IX2054.2
   000060         006200*                  C  SELECTS X-CARDS 84                          IX2054.2
   000061         006300*                                                                 IX2054.2
   000062         006500 ENVIRONMENT DIVISION.                                            IX2054.2
   000063         006600 CONFIGURATION SECTION.                                           IX2054.2
   000064         006700 SOURCE-COMPUTER.                                                 IX2054.2
   000065         006800     XXXXX082.                                                    IX2054.2
   000066         006900 OBJECT-COMPUTER.                                                 IX2054.2
   000067         007000     XXXXX083.                                                    IX2054.2
   000068         007100 INPUT-OUTPUT SECTION.                                            IX2054.2
   000069         007200 FILE-CONTROL.                                                    IX2054.2
   000070         007300     SELECT RAW-DATA   ASSIGN TO                                  IX2054.2 98
   000071         007400     XXXXX062                                                     IX2054.2
   000072         007500            ORGANIZATION IS INDEXED                               IX2054.2
   000073         007600            ACCESS MODE IS RANDOM                                 IX2054.2
   000074         007700            RECORD KEY IS RAW-DATA-KEY.                           IX2054.2 101
   000075         007800     SELECT PRINT-FILE ASSIGN TO                                  IX2054.2 113
   000076         007900     XXXXX055.                                                    IX2054.2
   000077         008000     SELECT   IX-FD1  ASSIGN TO                                   IX2054.2 116
   000078         008100     XXXXX024                                                     IX2054.2
   000079         008200     XXXXX044                                                     IX2054.2

 ==000079==> IGYDS1298-I Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX044" was treated as comments.

   000080         008300              RESERVE  3  AREA                                    IX2054.2
   000081         008400              ORGANIZATION IS INDEXED                             IX2054.2
   000082         008500              ACCESS MODE IS DYNAMIC                              IX2054.2
   000083         008600              RECORD  KEY IS IX-FD1-KEY                           IX2054.2 125
   000084         008700              ALTERNATE RECORD KEY IS IX-FD1-ALTKEY1.             IX2054.2 129
   000085         008800     SELECT   IX-FD2    ASSIGN TO                                 IX2054.2 131
   000086         008900     XXXXX025                                                     IX2054.2
   000087         009000     XXXXX045                                                     IX2054.2

 ==000087==> IGYDS1298-I Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX045" was treated as comments.

   000088         009100              RESERVE  2  AREAS                                   IX2054.2
   000089         009200              ACCESS MODE  DYNAMIC                                IX2054.2
   000090         009300              ORGANIZATION INDEXED                                IX2054.2
   000091         009400              RECORD KEY  IX-FD2-KEY                              IX2054.2 141
   000092         009500              ALTERNATE RECORD        IX-FD2-ALTKEY1.             IX2054.2 145
   000093         009600 I-O-CONTROL.                                                     IX2054.2
   000094         009700     SAME   RECORD  IX-FD1  IX-FD2.                               IX2054.2 116 131
   000095         009800 DATA DIVISION.                                                   IX2054.2
   000096         009900 FILE SECTION.                                                    IX2054.2
   000097         010000                                                                  IX2054.2
   000098         010100 FD  RAW-DATA.                                                    IX2054.2
   000099         010200                                                                  IX2054.2
   000100         010300 01  RAW-DATA-SATZ.                                               IX2054.2
   000101         010400     05  RAW-DATA-KEY        PIC X(6).                            IX2054.2
   000102         010500     05  C-DATE              PIC 9(6).                            IX2054.2
   000103         010600     05  C-TIME              PIC 9(8).                            IX2054.2
   000104         010700     05  C-NO-OF-TESTS       PIC 99.                              IX2054.2
   000105         010800     05  C-OK                PIC 999.                             IX2054.2
   000106         010900     05  C-ALL               PIC 999.                             IX2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000107         011000     05  C-FAIL              PIC 999.                             IX2054.2
   000108         011100     05  C-DELETED           PIC 999.                             IX2054.2
   000109         011200     05  C-INSPECT           PIC 999.                             IX2054.2
   000110         011300     05  C-NOTE              PIC X(13).                           IX2054.2
   000111         011400     05  C-INDENT            PIC X.                               IX2054.2
   000112         011500     05  C-ABORT             PIC X(8).                            IX2054.2
   000113         011600 FD  PRINT-FILE.                                                  IX2054.2

 ==000113==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000114         011700 01  PRINT-REC PICTURE X(120).                                    IX2054.2
   000115         011800 01  DUMMY-RECORD PICTURE X(120).                                 IX2054.2
   000116         011900 FD  IX-FD1                                                       IX2054.2

 ==000116==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000117         012000     LABEL  RECORDS ARE STANDARD                                  IX2054.2
   000118         012100     RECORD CONTAINS  240  CHARACTERS.                            IX2054.2
   000119         012200 01  IX-FD1R1-F-G-240.                                            IX2054.2
   000120         012300     05 IX-FD1-REC-120           PIC X(120).                      IX2054.2
   000121         012400     05 IX-FD1-REC-120-240.                                       IX2054.2
   000122         012500              10 FILLER          PIC X(8).                        IX2054.2
   000123         012600              10 IX-FD1-REC-KEY.                                  IX2054.2
   000124         012700                 15 FILLER       PIC X(19).                       IX2054.2
   000125         012800                 15 IX-FD1-KEY   PIC X(10).                       IX2054.2
   000126         012900              10 FILLER          PIC X(9).                        IX2054.2
   000127         013000              10 IX-FD1-ALT1-KEY.                                 IX2054.2
   000128         013100                 15 FILLER       PIC X(19).                       IX2054.2
   000129         013200                 15 IX-FD1-ALTKEY1  PIC X(10).                    IX2054.2
   000130         013300              10 FILLER          PIC X(45).                       IX2054.2
   000131         013400 FD  IX-FD2                                                       IX2054.2

 ==000131==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000131==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000132         013500     LABEL RECORDS ARE STANDARD                                   IX2054.2
   000133         013600     BLOCK CONTAINS  5  TO  25  RECORDS                           IX2054.2
   000134         013700     RECORD CONTAINS  240  CHARACTERS.                            IX2054.2
   000135         013800 01  IX-FD2R1-F-G-240.                                            IX2054.2
   000136         013900     05 IX-FD2-REC-120           PIC X(120).                      IX2054.2
   000137         014000     05 IX-FD2-REC-120-240.                                       IX2054.2
   000138         014100              10 FILLER          PIC X(8).                        IX2054.2
   000139         014200              10 IX-FD2-REC-KEY.                                  IX2054.2
   000140         014300                 15 FILLER       PIC X(19).                       IX2054.2
   000141         014400                 15 IX-FD2-KEY   PIC X(10).                       IX2054.2
   000142         014500              10 FILLER          PIC X(9).                        IX2054.2
   000143         014600              10 IX-FD2-ALT1-KEY.                                 IX2054.2
   000144         014700                 15 FILLER       PIC X(19).                       IX2054.2
   000145         014800                 15 IX-FD2-ALTKEY1 PIC X(10).                     IX2054.2
   000146         014900              10 FILLER          PIC X(45).                       IX2054.2
   000147         015000 WORKING-STORAGE SECTION.                                         IX2054.2
   000148         015100*01  IX-FD2-ID                                                    IX2054.2
   000149         015200*    XXXXX086.                                                    IX2054.2
   000150         015300 01  WRK-CS-09V00-001            PIC S9(9)    COMPUTATIONAL.      IX2054.2
   000151         015400 01  WRK-REC-KEY-FD1.                                             IX2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000152         015500     03 FILLER                   PIC X(19)         VALUE SPACE.   IX2054.2 IMP
   000153         015600     03 WRK-DU-10V00-001         PIC 9(10)      VALUE ZERO.       IX2054.2 IMP
   000154         015700 01  WRK-ALT1-KEY-FD1.                                            IX2054.2
   000155         015800     03 FILLER                   PIC X(19)        VALUE SPACE.    IX2054.2 IMP
   000156         015900     03 WRK-DU-10V00-002         PIC 9(10)     VALUE ZERO.        IX2054.2 IMP
   000157         016000 01  FD1-FILE-SIZE               PIC 9(10)  VALUE 200.            IX2054.2
   000158         016100 01  WRK-REC-KEY-FD2.                                             IX2054.2
   000159         016200     03 FILLER                   PIC X(19)      VALUE SPACE.      IX2054.2 IMP
   000160         016300     03 WRK-DU-10V00-003         PIC 9(10)    VALUE ZERO.         IX2054.2 IMP
   000161         016400 01  WRK-ALT1-KEY-FD2.                                            IX2054.2
   000162         016500     03 FILLER                   PIC X(19)      VALUE SPACE.      IX2054.2 IMP
   000163         016600     03 WRK-DU-10V00-004         PIC 9(10)   VALUE ZERO.          IX2054.2 IMP
   000164         016700 01  FD2-FILE-SIZE               PIC 9(10)  VALUE 200.            IX2054.2
   000165         016800 01  FILE-RECORD-INFORMATION-REC.                                 IX2054.2
   000166         016900     03 FILE-RECORD-INFO-SKELETON.                                IX2054.2
   000167         017000        05 FILLER                 PICTURE X(48)       VALUE       IX2054.2
   000168         017100             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2054.2
   000169         017200        05 FILLER                 PICTURE X(46)       VALUE       IX2054.2
   000170         017300             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2054.2
   000171         017400        05 FILLER                 PICTURE X(26)       VALUE       IX2054.2
   000172         017500             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2054.2
   000173         017600        05 FILLER                 PICTURE X(37)       VALUE       IX2054.2
   000174         017700             ",RECKEY=                             ".             IX2054.2
   000175         017800        05 FILLER                 PICTURE X(38)       VALUE       IX2054.2
   000176         017900             ",ALTKEY1=                             ".            IX2054.2
   000177         018000        05 FILLER                 PICTURE X(38)       VALUE       IX2054.2
   000178         018100             ",ALTKEY2=                             ".            IX2054.2
   000179         018200        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2054.2 IMP
   000180         018300     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2054.2
   000181         018400        05 FILE-RECORD-INFO-P1-120.                               IX2054.2
   000182         018500           07 FILLER              PIC X(5).                       IX2054.2
   000183         018600           07 XFILE-NAME           PIC X(6).                      IX2054.2
   000184         018700           07 FILLER              PIC X(8).                       IX2054.2
   000185         018800           07 XRECORD-NAME         PIC X(6).                      IX2054.2
   000186         018900           07 FILLER              PIC X(1).                       IX2054.2
   000187         019000           07 REELUNIT-NUMBER     PIC 9(1).                       IX2054.2
   000188         019100           07 FILLER              PIC X(7).                       IX2054.2
   000189         019200           07 XRECORD-NUMBER       PIC 9(6).                      IX2054.2
   000190         019300           07 FILLER              PIC X(6).                       IX2054.2
   000191         019400           07 UPDATE-NUMBER       PIC 9(2).                       IX2054.2
   000192         019500           07 FILLER              PIC X(5).                       IX2054.2
   000193         019600           07 ODO-NUMBER          PIC 9(4).                       IX2054.2
   000194         019700           07 FILLER              PIC X(5).                       IX2054.2
   000195         019800           07 XPROGRAM-NAME        PIC X(5).                      IX2054.2
   000196         019900           07 FILLER              PIC X(7).                       IX2054.2
   000197         020000           07 XRECORD-LENGTH       PIC 9(6).                      IX2054.2
   000198         020100           07 FILLER              PIC X(7).                       IX2054.2
   000199         020200           07 CHARS-OR-RECORDS    PIC X(2).                       IX2054.2
   000200         020300           07 FILLER              PIC X(1).                       IX2054.2
   000201         020400           07 XBLOCK-SIZE          PIC 9(4).                      IX2054.2
   000202         020500           07 FILLER              PIC X(6).                       IX2054.2
   000203         020600           07 RECORDS-IN-FILE     PIC 9(6).                       IX2054.2
   000204         020700           07 FILLER              PIC X(5).                       IX2054.2
   000205         020800           07 XFILE-ORGANIZATION   PIC X(2).                      IX2054.2
   000206         020900           07 FILLER              PIC X(6).                       IX2054.2
   000207         021000           07 XLABEL-TYPE          PIC X(1).                      IX2054.2
   000208         021100        05 FILE-RECORD-INFO-P121-240.                             IX2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000209         021200           07 FILLER              PIC X(8).                       IX2054.2
   000210         021300           07 XRECORD-KEY          PIC X(29).                     IX2054.2
   000211         021400           07 FILLER              PIC X(9).                       IX2054.2
   000212         021500           07 ALTERNATE-KEY1      PIC X(29).                      IX2054.2
   000213         021600           07 FILLER              PIC X(9).                       IX2054.2
   000214         021700           07 ALTERNATE-KEY2      PIC X(29).                      IX2054.2
   000215         021800           07 FILLER              PIC X(7).                       IX2054.2
   000216         021900 01  TEST-RESULTS.                                                IX2054.2
   000217         022000     02 FILLER                   PIC X      VALUE SPACE.          IX2054.2 IMP
   000218         022100     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2054.2 IMP
   000219         022200     02 FILLER                   PIC X      VALUE SPACE.          IX2054.2 IMP
   000220         022300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2054.2 IMP
   000221         022400     02 FILLER                   PIC X      VALUE SPACE.          IX2054.2 IMP
   000222         022500     02  PAR-NAME.                                                IX2054.2
   000223         022600       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2054.2 IMP
   000224         022700       03  PARDOT-X              PIC X      VALUE SPACE.          IX2054.2 IMP
   000225         022800       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2054.2 IMP
   000226         022900     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2054.2 IMP
   000227         023000     02 RE-MARK                  PIC X(61).                       IX2054.2
   000228         023100 01  TEST-COMPUTED.                                               IX2054.2
   000229         023200     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2054.2 IMP
   000230         023300     02 FILLER                   PIC X(17)  VALUE                 IX2054.2
   000231         023400            "       COMPUTED=".                                   IX2054.2
   000232         023500     02 COMPUTED-X.                                               IX2054.2
   000233         023600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2054.2 IMP
   000234         023700     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2054.2 233
   000235         023800                                 PIC -9(9).9(9).                  IX2054.2
   000236         023900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2054.2 233
   000237         024000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2054.2 233
   000238         024100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2054.2 233
   000239         024200     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2054.2 233
   000240         024300         04 COMPUTED-18V0                    PIC -9(18).          IX2054.2
   000241         024400         04 FILLER                           PIC X.               IX2054.2
   000242         024500     03 FILLER PIC X(50) VALUE SPACE.                             IX2054.2 IMP
   000243         024600 01  TEST-CORRECT.                                                IX2054.2
   000244         024700     02 FILLER PIC X(30) VALUE SPACE.                             IX2054.2 IMP
   000245         024800     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2054.2
   000246         024900     02 CORRECT-X.                                                IX2054.2
   000247         025000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2054.2 IMP
   000248         025100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2054.2 247
   000249         025200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2054.2 247
   000250         025300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2054.2 247
   000251         025400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2054.2 247
   000252         025500     03      CR-18V0 REDEFINES CORRECT-A.                         IX2054.2 247
   000253         025600         04 CORRECT-18V0                     PIC -9(18).          IX2054.2
   000254         025700         04 FILLER                           PIC X.               IX2054.2
   000255         025800     03 FILLER PIC X(2) VALUE SPACE.                              IX2054.2 IMP
   000256         025900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2054.2 IMP
   000257         026000 01  CCVS-C-1.                                                    IX2054.2
   000258         026100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2054.2
   000259         026200-    "SS  PARAGRAPH-NAME                                          IX2054.2
   000260         026300-    "       REMARKS".                                            IX2054.2
   000261         026400     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2054.2 IMP
   000262         026500 01  CCVS-C-2.                                                    IX2054.2
   000263         026600     02 FILLER                     PIC X        VALUE SPACE.      IX2054.2 IMP
   000264         026700     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2054.2
   000265         026800     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2054.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000266         026900     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2054.2
   000267         027000     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2054.2 IMP
   000268         027100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2054.2 IMP
   000269         027200 01  REC-CT                        PIC 99       VALUE ZERO.       IX2054.2 IMP
   000270         027300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2054.2 IMP
   000271         027400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2054.2 IMP
   000272         027500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2054.2 IMP
   000273         027600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2054.2 IMP
   000274         027700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2054.2 IMP
   000275         027800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2054.2 IMP
   000276         027900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2054.2 IMP
   000277         028000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2054.2 IMP
   000278         028100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2054.2 IMP
   000279         028200 01  CCVS-H-1.                                                    IX2054.2
   000280         028300     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2054.2 IMP
   000281         028400     02  FILLER                    PIC X(42)    VALUE             IX2054.2
   000282         028500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2054.2
   000283         028600     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2054.2 IMP
   000284         028700 01  CCVS-H-2A.                                                   IX2054.2
   000285         028800   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2054.2 IMP
   000286         028900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2054.2
   000287         029000   02  FILLER                        PIC XXXX   VALUE             IX2054.2
   000288         029100     "4.2 ".                                                      IX2054.2
   000289         029200   02  FILLER                        PIC X(28)  VALUE             IX2054.2
   000290         029300            " COPY - NOT FOR DISTRIBUTION".                       IX2054.2
   000291         029400   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2054.2 IMP
   000292         029500                                                                  IX2054.2
   000293         029600 01  CCVS-H-2B.                                                   IX2054.2
   000294         029700   02  FILLER                        PIC X(15)  VALUE             IX2054.2
   000295         029800            "TEST RESULT OF ".                                    IX2054.2
   000296         029900   02  TEST-ID                       PIC X(9).                    IX2054.2
   000297         030000   02  FILLER                        PIC X(4)   VALUE             IX2054.2
   000298         030100            " IN ".                                               IX2054.2
   000299         030200   02  FILLER                        PIC X(12)  VALUE             IX2054.2
   000300         030300     " HIGH       ".                                              IX2054.2
   000301         030400   02  FILLER                        PIC X(22)  VALUE             IX2054.2
   000302         030500            " LEVEL VALIDATION FOR ".                             IX2054.2
   000303         030600   02  FILLER                        PIC X(58)  VALUE             IX2054.2
   000304         030700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2054.2
   000305         030800 01  CCVS-H-3.                                                    IX2054.2
   000306         030900     02  FILLER                      PIC X(34)  VALUE             IX2054.2
   000307         031000            " FOR OFFICIAL USE ONLY    ".                         IX2054.2
   000308         031100     02  FILLER                      PIC X(58)  VALUE             IX2054.2
   000309         031200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2054.2
   000310         031300     02  FILLER                      PIC X(28)  VALUE             IX2054.2
   000311         031400            "  COPYRIGHT   1985 ".                                IX2054.2
   000312         031500 01  CCVS-E-1.                                                    IX2054.2
   000313         031600     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2054.2 IMP
   000314         031700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2054.2
   000315         031800     02 ID-AGAIN                     PIC X(9).                    IX2054.2
   000316         031900     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2054.2 IMP
   000317         032000 01  CCVS-E-2.                                                    IX2054.2
   000318         032100     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2054.2 IMP
   000319         032200     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2054.2 IMP
   000320         032300     02 CCVS-E-2-2.                                               IX2054.2
   000321         032400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2054.2 IMP
   000322         032500         03 FILLER                   PIC X      VALUE SPACE.      IX2054.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000323         032600         03 ENDER-DESC               PIC X(44)  VALUE             IX2054.2
   000324         032700            "ERRORS ENCOUNTERED".                                 IX2054.2
   000325         032800 01  CCVS-E-3.                                                    IX2054.2
   000326         032900     02  FILLER                      PIC X(22)  VALUE             IX2054.2
   000327         033000            " FOR OFFICIAL USE ONLY".                             IX2054.2
   000328         033100     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2054.2 IMP
   000329         033200     02  FILLER                      PIC X(58)  VALUE             IX2054.2
   000330         033300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2054.2
   000331         033400     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2054.2 IMP
   000332         033500     02 FILLER                       PIC X(15)  VALUE             IX2054.2
   000333         033600             " COPYRIGHT 1985".                                   IX2054.2
   000334         033700 01  CCVS-E-4.                                                    IX2054.2
   000335         033800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2054.2 IMP
   000336         033900     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2054.2
   000337         034000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2054.2 IMP
   000338         034100     02 FILLER                       PIC X(40)  VALUE             IX2054.2
   000339         034200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2054.2
   000340         034300 01  XXINFO.                                                      IX2054.2
   000341         034400     02 FILLER                       PIC X(19)  VALUE             IX2054.2
   000342         034500            "*** INFORMATION ***".                                IX2054.2
   000343         034600     02 INFO-TEXT.                                                IX2054.2
   000344         034700       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2054.2 IMP
   000345         034800       04 XXCOMPUTED                 PIC X(20).                   IX2054.2
   000346         034900       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2054.2 IMP
   000347         035000       04 XXCORRECT                  PIC X(20).                   IX2054.2
   000348         035100     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2054.2
   000349         035200 01  HYPHEN-LINE.                                                 IX2054.2
   000350         035300     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2054.2 IMP
   000351         035400     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2054.2
   000352         035500-    "*****************************************".                 IX2054.2
   000353         035600     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2054.2
   000354         035700-    "******************************".                            IX2054.2
   000355         035800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2054.2
   000356         035900     "IX205A".                                                    IX2054.2
   000357         036000 PROCEDURE DIVISION.                                              IX2054.2
   000358         036100 CCVS1 SECTION.                                                   IX2054.2
   000359         036200 OPEN-FILES.                                                      IX2054.2
   000360         036300     OPEN I-O RAW-DATA.                                           IX2054.2 98
   000361         036400     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2054.2 355 101
   000362         036500     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2054.2 98 368
   000363         036600     MOVE "ABORTED " TO C-ABORT.                                  IX2054.2 112
   000364         036700     ADD 1 TO C-NO-OF-TESTS.                                      IX2054.2 104
   000365         036800     ACCEPT C-DATE  FROM DATE.                                    IX2054.2 102
   000366         036900     ACCEPT C-TIME  FROM TIME.                                    IX2054.2 103
   000367         037000     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2054.2 100 368
   000368         037100 END-E-1.                                                         IX2054.2
   000369         037200     CLOSE RAW-DATA.                                              IX2054.2 98
   000370         037300     OPEN    OUTPUT PRINT-FILE.                                   IX2054.2 113
   000371         037400     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2054.2 355 296 355 315
   000372         037500     MOVE    SPACE TO TEST-RESULTS.                               IX2054.2 IMP 216
   000373         037600     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2054.2 417 422
   000374         037700     MOVE    ZERO TO REC-SKL-SUB.                                 IX2054.2 IMP 268
   000375         037800     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2054.2 376
   000376         037900 CCVS-INIT-FILE.                                                  IX2054.2
   000377         038000     ADD     1 TO REC-SKL-SUB.                                    IX2054.2 268
   000378         038100     MOVE    FILE-RECORD-INFO-SKELETON                            IX2054.2 166
   000379         038200          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2054.2 180 268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000380         038300 CCVS-INIT-EXIT.                                                  IX2054.2
   000381         038400     GO TO CCVS1-EXIT.                                            IX2054.2 504
   000382         038500 CLOSE-FILES.                                                     IX2054.2
   000383         038600     OPEN I-O RAW-DATA.                                           IX2054.2 98
   000384         038700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2054.2 355 101
   000385         038800     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2054.2 98 393
   000386         038900     MOVE "OK.     " TO C-ABORT.                                  IX2054.2 112
   000387         039000     MOVE PASS-COUNTER TO C-OK.                                   IX2054.2 273 105
   000388         039100     MOVE ERROR-HOLD   TO C-ALL.                                  IX2054.2 275 106
   000389         039200     MOVE ERROR-COUNTER TO C-FAIL.                                IX2054.2 271 107
   000390         039300     MOVE DELETE-COUNTER TO C-DELETED.                            IX2054.2 270 108
   000391         039400     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2054.2 272 109
   000392         039500     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2054.2 100 393
   000393         039600 END-E-2.                                                         IX2054.2
   000394         039700     CLOSE RAW-DATA.                                              IX2054.2 98
   000395         039800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2054.2 426 447 113
   000396         039900 TERMINATE-CCVS.                                                  IX2054.2
   000397         040000     EXIT PROGRAM.                                                IX2054.2
   000398         040100 TERMINATE-CALL.                                                  IX2054.2
   000399         040200     STOP     RUN.                                                IX2054.2
   000400         040300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2054.2 220 272
   000401         040400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2054.2 220 273
   000402         040500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2054.2 220 271
   000403         040600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2054.2 220 270
   000404         040700     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2054.2 227
   000405         040800 PRINT-DETAIL.                                                    IX2054.2
   000406         040900     IF REC-CT NOT EQUAL TO ZERO                                  IX2054.2 269 IMP
   000407      1  041000             MOVE "." TO PARDOT-X                                 IX2054.2 224
   000408      1  041100             MOVE REC-CT TO DOTVALUE.                             IX2054.2 269 225
   000409         041200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2054.2 216 114 459
   000410         041300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2054.2 220 459
   000411      1  041400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2054.2 480 494
   000412      1  041500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2054.2 495 503
   000413         041600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2054.2 IMP 220 IMP 232
   000414         041700     MOVE SPACE TO CORRECT-X.                                     IX2054.2 IMP 246
   000415         041800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2054.2 269 IMP IMP 222
   000416         041900     MOVE     SPACE TO RE-MARK.                                   IX2054.2 IMP 227
   000417         042000 HEAD-ROUTINE.                                                    IX2054.2
   000418         042100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2054.2 279 115 459
   000419         042200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2054.2 284 115 459
   000420         042300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2054.2 293 115 459
   000421         042400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2054.2 305 115 459
   000422         042500 COLUMN-NAMES-ROUTINE.                                            IX2054.2
   000423         042600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2054.2 257 115 459
   000424         042700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2054.2 262 115 459
   000425         042800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2054.2 349 115 459
   000426         042900 END-ROUTINE.                                                     IX2054.2
   000427         043000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2054.2 349 115 459
   000428         043100 END-RTN-EXIT.                                                    IX2054.2
   000429         043200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2054.2 312 115 459
   000430         043300 END-ROUTINE-1.                                                   IX2054.2
   000431         043400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2054.2 271 275 272
   000432         043500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2054.2 275 270 275
   000433         043600      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2054.2 273 275
   000434         043700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2054.2
   000435         043800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2054.2 273 335
   000436         043900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2054.2 275 337
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000437         044000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2054.2 334 320
   000438         044100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2054.2 317 115 459
   000439         044200  END-ROUTINE-12.                                                 IX2054.2
   000440         044300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2054.2 323
   000441         044400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2054.2 271 IMP
   000442      1  044500         MOVE "NO " TO ERROR-TOTAL                                IX2054.2 321
   000443         044600         ELSE                                                     IX2054.2
   000444      1  044700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2054.2 271 321
   000445         044800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2054.2 317 115
   000446         044900     PERFORM WRITE-LINE.                                          IX2054.2 459
   000447         045000 END-ROUTINE-13.                                                  IX2054.2
   000448         045100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2054.2 270 IMP
   000449      1  045200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2054.2 321
   000450      1  045300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2054.2 270 321
   000451         045400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2054.2 323
   000452         045500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2054.2 317 115 459
   000453         045600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2054.2 272 IMP
   000454      1  045700          MOVE "NO " TO ERROR-TOTAL                               IX2054.2 321
   000455      1  045800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2054.2 272 321
   000456         045900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2054.2 323
   000457         046000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2054.2 317 115 459
   000458         046100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2054.2 325 115 459
   000459         046200 WRITE-LINE.                                                      IX2054.2
   000460         046300     ADD 1 TO RECORD-COUNT.                                       IX2054.2 277
   000461         046400     IF RECORD-COUNT GREATER 42                                   IX2054.2 277
   000462      1  046500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2054.2 115 276
   000463      1  046600         MOVE SPACE TO DUMMY-RECORD                               IX2054.2 IMP 115
   000464      1  046700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2054.2 115
   000465      1  046800         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2054.2 279 115 475
   000466      1  046900         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2054.2 284 115 475
   000467      1  047000         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2054.2 293 115 475
   000468      1  047100         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2054.2 305 115 475
   000469      1  047200         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2054.2 257 115 475
   000470      1  047300         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2054.2 262 115 475
   000471      1  047400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2054.2 349 115 475
   000472      1  047500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2054.2 276 115
   000473      1  047600         MOVE ZERO TO RECORD-COUNT.                               IX2054.2 IMP 277
   000474         047700     PERFORM WRT-LN.                                              IX2054.2 475
   000475         047800 WRT-LN.                                                          IX2054.2
   000476         047900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2054.2 115
   000477         048000     MOVE SPACE TO DUMMY-RECORD.                                  IX2054.2 IMP 115
   000478         048100 BLANK-LINE-PRINT.                                                IX2054.2
   000479         048200     PERFORM WRT-LN.                                              IX2054.2 475
   000480         048300 FAIL-ROUTINE.                                                    IX2054.2
   000481         048400     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2054.2 232 IMP
   000482      1  048500            GO TO   FAIL-ROUTINE-WRITE.                           IX2054.2 489
   000483         048600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2054.2 246 IMP 489
   000484         048700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2054.2 278 348
   000485         048800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2054.2 343
   000486         048900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2054.2 340 115 459
   000487         049000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2054.2 IMP 348
   000488         049100     GO TO  FAIL-ROUTINE-EX.                                      IX2054.2 494
   000489         049200 FAIL-ROUTINE-WRITE.                                              IX2054.2
   000490         049300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2054.2 228 114 459
   000491         049400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2054.2 278 256
   000492         049500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2054.2 243 114 459
   000493         049600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2054.2 IMP 256
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000494         049700 FAIL-ROUTINE-EX. EXIT.                                           IX2054.2
   000495         049800 BAIL-OUT.                                                        IX2054.2
   000496         049900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2054.2 233 IMP 498
   000497         050000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2054.2 247 IMP 503
   000498         050100 BAIL-OUT-WRITE.                                                  IX2054.2
   000499         050200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2054.2 247 347 233 345
   000500         050300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2054.2 278 348
   000501         050400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2054.2 340 115 459
   000502         050500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2054.2 IMP 348
   000503         050600 BAIL-OUT-EX. EXIT.                                               IX2054.2
   000504         050700 CCVS1-EXIT.                                                      IX2054.2
   000505         050800     EXIT.                                                        IX2054.2
   000506         050900 SECT-IX-01-001  SECTION.                                         IX2054.2
   000507         051000 WRITE-INIT-GF-01.                                                IX2054.2
   000508         051100     OPEN     OUTPUT   IX-FD1.                                    IX2054.2 116
   000509         051200     MOVE     ZERO TO WRK-CS-09V00-001.                           IX2054.2 IMP 150
   000510         051300     MOVE     ZERO TO WRK-DU-10V00-001.                           IX2054.2 IMP 153
   000511         051400     MOVE     "IX-FD1"  TO XFILE-NAME (1).                        IX2054.2 183
   000512         051500     MOVE     "R1-F-G"  TO XRECORD-NAME (1).                      IX2054.2 185
   000513         051600     MOVE     000001    TO XRECORD-NUMBER (1).                    IX2054.2 189
   000514         051700     MOVE     CCVS-PGM-ID TO XPROGRAM-NAME (1).                   IX2054.2 355 195
   000515         051800     MOVE     200  TO RECORDS-IN-FILE (1).                        IX2054.2 203
   000516         051900     MOVE     240  TO XRECORD-LENGTH (1).                         IX2054.2 197
   000517         052000     MOVE     0001      TO XBLOCK-SIZE (1).                       IX2054.2 201
   000518         052100     MOVE     "RC"      TO CHARS-OR-RECORDS (1).                  IX2054.2 199
   000519         052200     MOVE     "IX"      TO XFILE-ORGANIZATION (1).                IX2054.2 205
   000520         052300     MOVE     "S"       TO XLABEL-TYPE (1).                       IX2054.2 207
   000521         052400     MOVE     000200    TO WRK-DU-10V00-002                       IX2054.2 156
   000522         052500     MOVE     "FILE CREATED"  TO RE-MARK.                         IX2054.2 227
   000523         052600     MOVE     "WRITE-TEST-GF-01" TO PAR-NAME.                     IX2054.2 222
   000524         052700     MOVE     "WRITE DYNAMIC MODE " TO FEATURE.                   IX2054.2 218
   000525         052800 WRITE-TEST-GF-01-R.                                              IX2054.2
   000526         052900     MOVE     XRECORD-NUMBER (1) TO WRK-DU-10V00-001.             IX2054.2 189 153
   000527         053000     MOVE     WRK-REC-KEY-FD1  TO XRECORD-KEY (1).                IX2054.2 151 210
   000528         053100     MOVE     WRK-ALT1-KEY-FD1  TO ALTERNATE-KEY1 (1).            IX2054.2 154 212
   000529         053200     MOVE     FILE-RECORD-INFO (1)  TO IX-FD1R1-F-G-240.          IX2054.2 180 119
   000530         053300     WRITE    IX-FD1R1-F-G-240                                    IX2054.2 119
   000531      1  053400                        INVALID KEY GO TO WRITE-TEST-GF-01.       IX2054.2 537
   000532         053500     IF     XRECORD-NUMBER (1)  NOT LESS THAN FD1-FILE-SIZE       IX2054.2 189 157
   000533      1  053600              GO TO    WRITE-TEST-GF-01.                          IX2054.2 537
   000534         053700     ADD      000001   TO XRECORD-NUMBER (1).                     IX2054.2 189
   000535         053800     SUBTRACT  000001   FROM WRK-DU-10V00-002.                    IX2054.2 156
   000536         053900     GO TO    WRITE-TEST-GF-01-R.                                 IX2054.2 525
   000537         054000 WRITE-TEST-GF-01.                                                IX2054.2
   000538         054100     MOVE     XRECORD-NUMBER  (1)  TO COMPUTED-18V0.              IX2054.2 189 240
   000539         054200     MOVE     FD1-FILE-SIZE   TO CORRECT-18V0.                    IX2054.2 157 253
   000540         054300     IF       XRECORD-NUMBER (1)  EQUAL TO FD1-FILE-SIZE          IX2054.2 189 157
   000541      1  054400              PERFORM  PASS                                       IX2054.2 401
   000542         054500          ELSE                                                    IX2054.2
   000543      1  054600             MOVE     "FILE CREATION PREMATURE" TO RE-MARK        IX2054.2 227
   000544      1  054700             PERFORM  FAIL.                                       IX2054.2 402
   000545         054800     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000546         054900*                                                                 IX2054.2
   000547         055000*    01                                                           IX2054.2
   000548         055100*                                                                 IX2054.2
   000549         055200     CLOSE  IX-FD1.                                               IX2054.2 116
   000550         055300 READ-INIT-F1-01.                                                 IX2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000551         055400     OPEN     INPUT  IX-FD1.                                      IX2054.2 116
   000552         055500     MOVE     ZERO TO WRK-DU-10V00-001.                           IX2054.2 IMP 153
   000553         055600     MOVE     ZERO TO WRK-DU-10V00-002.                           IX2054.2 IMP 156
   000554         055700     MOVE    ZERO TO WRK-CS-09V00-001.                            IX2054.2 IMP 150
   000555         055800     MOVE     "READ-TEST-F1-01  "  TO PAR-NAME.                   IX2054.2 222
   000556         055900     MOVE     "READ NEXT RECORD "  TO FEATURE.                    IX2054.2 218
   000557         056000 READ-TEST-F1-01-3.                                               IX2054.2
   000558         056100     ADD      1   TO WRK-DU-10V00-001.                            IX2054.2 153
   000559         056200     READ    IX-FD1                                               IX2054.2 116
   000560         056300        NEXT RECORD                                               IX2054.2
   000561         056400         AT END                                                   IX2054.2
   000562      1  056500              ADD    1000  TO WRK-DU-10V00-002.                   IX2054.2 156
   000563         056600*                                                                 IX2054.2
   000564         056700*    COMPUTED RESULTS IN INCREMENTS OF 1000  INDICATE AT END PATH IX2054.2
   000565         056800*         HAS BEEN TAKEN.                                         IX2054.2
   000566         056900*                                                                 IX2054.2
   000567         057000     MOVE     IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).          IX2054.2 119 180
   000568         057100     IF       XRECORD-NUMBER (1)  NOT EQUAL TO WRK-DU-10V00-001   IX2054.2 189 153
   000569      1  057200              ADD     1  TO WRK-DU-10V00-002.                     IX2054.2 156
   000570         057300*                                                                 IX2054.2
   000571         057400*    COMPUTED RESULTS IN INCREMENTS OF 1  INDICATE THAT THE       IX2054.2
   000572         057500*       RECORD RETRIEVED WAS NOT THE ONE EXPECTED.                IX2054.2
   000573         057600*                                                                 IX2054.2
   000574         057700     ADD     1  TO WRK-CS-09V00-001.                              IX2054.2 150
   000575         057800     IF      WRK-CS-09V00-001  GREATER THAN 24                    IX2054.2 150
   000576      1  057900              NEXT  SENTENCE  ELSE                                IX2054.2
   000577      1  058000              GO TO   READ-TEST-F1-01-3.                          IX2054.2 557
   000578         058100     IF       WRK-DU-10V00-002  GREATER THAN ZERO                 IX2054.2 156 IMP
   000579      1  058200              PERFORM  FAIL                                       IX2054.2 402
   000580      1  058300              MOVE    WRK-DU-10V00-002 TO COMPUTED-18V0           IX2054.2 156 240
   000581      1  058400              MOVE    ZERO TO CORRECT-18V0                        IX2054.2 IMP 253
   000582      1  058500              MOVE    "SEE  PROGRAM"  TO RE-MARK                  IX2054.2 227
   000583      1  058600              ELSE  PERFORM PASS.                                 IX2054.2 401
   000584         058700     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000585         058800*                                                                 IX2054.2
   000586         058900*    02                                                           IX2054.2
   000587         059000*                                                                 IX2054.2
   000588         059100 READ-INIT-F2-02.                                                 IX2054.2
   000589         059200     MOVE  "READ-TEST-F1-02  "  TO PAR-NAME.                      IX2054.2 222
   000590         059300     MOVE  "READ . RECORD INVALID"  TO FEATURE.                   IX2054.2 218
   000591         059400     MOVE     ZERO TO WRK-DU-10V00-001.                           IX2054.2 IMP 153
   000592         059500     MOVE     ZERO TO WRK-CS-09V00-001.                           IX2054.2 IMP 150
   000593         059600     MOVE     ZERO TO WRK-DU-10V00-002.                           IX2054.2 IMP 156
   000594         059700 READ-TEST-F1-02-5.                                               IX2054.2
   000595         059800     ADD      10  TO WRK-DU-10V00-001.                            IX2054.2 153
   000596         059900     MOVE     WRK-DU-10V00-001  TO IX-FD1-KEY                     IX2054.2 153 125
   000597         060000     READ     IX-FD1  RECORD                                      IX2054.2 116
   000598         060100          INVALID KEY                                             IX2054.2
   000599      1  060200              ADD   1000 TO WRK-DU-10V00-002.                     IX2054.2 156
   000600         060300*                                                                 IX2054.2
   000601         060400*    COMPUTED RESULTS IN INCREMENTS OF 1000 INDICATE INVALID KEY  IX2054.2
   000602         060500*       PATH HAS BEEN TAKEN.                                      IX2054.2
   000603         060600*                                                                 IX2054.2
   000604         060700     MOVE     IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).          IX2054.2 119 180
   000605         060800     IF       XRECORD-NUMBER (1)  NOT EQUAL TO WRK-DU-10V00-001   IX2054.2 189 153
   000606      1  060900              ADD    1    TO WRK-DU-10V00-002.                    IX2054.2 156
   000607         061000*                                                                 IX2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000608         061100*    COMPUTED RESULTS IN INCREMENTS OF 1  INDICAT THAT THE        IX2054.2
   000609         061200*       RECORD RETRIEVED WAS NOT THE ONE EXPECTED.                IX2054.2
   000610         061300*                                                                 IX2054.2
   000611         061400     ADD     1  TO WRK-CS-09V00-001.                              IX2054.2 150
   000612         061500     IF      WRK-CS-09V00-001  GREATER THAN   10                  IX2054.2 150
   000613      1  061600              NEXT SENTENCE  ELSE                                 IX2054.2
   000614      1  061700              GO TO    READ-TEST-F1-02-5.                         IX2054.2 594
   000615         061800 READ-TEST-F1-02.                                                 IX2054.2
   000616         061900     IF       WRK-DU-10V00-002  GREATER THAN ZERO                 IX2054.2 156 IMP
   000617      1  062000              PERFORM  FAIL                                       IX2054.2 402
   000618      1  062100              MOVE    WRK-DU-10V00-002  TO COMPUTED-18V0          IX2054.2 156 240
   000619      1  062200              MOVE    ZERO  TO CORRECT-18V0                       IX2054.2 IMP 253
   000620      1  062300              MOVE    "SEE PROGRAM"  TO RE-MARK                   IX2054.2 227
   000621      1  062400              ELSE  PERFORM  PASS.                                IX2054.2 401
   000622         062500     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000623         062600*                                                                 IX2054.2
   000624         062700*    03                                                           IX2054.2
   000625         062800*                                                                 IX2054.2
   000626         062900 READ-INIT-GF-03.                                                 IX2054.2
   000627         063000     MOVE  "READ-TEST-F1-03  "  TO PAR-NAME.                      IX2054.2 222
   000628         063100     MOVE  "START = READ  ALTERN."  TO FEATURE.                   IX2054.2 218
   000629         063200     MOVE    0000000200  TO WRK-DU-10V00-001.                     IX2054.2 153
   000630         063300     MOVE    WRK-REC-KEY-FD1  TO IX-FD1-REC-KEY.                  IX2054.2 151 123
   000631         063400     MOVE     FD1-FILE-SIZE TO WRK-DU-10V00-001.                  IX2054.2 157 153
   000632         063500     MOVE     0000000001 TO WRK-DU-10V00-002.                     IX2054.2 156
   000633         063600     MOVE    ZERO  TO  WRK-CS-09V00-001.                          IX2054.2 IMP 150
   000634         063700     MOVE    WRK-ALT1-KEY-FD1  TO IX-FD1-ALT1-KEY.                IX2054.2 154 127
   000635         063800     MOVE    ZERO  TO WRK-DU-10V00-002.                           IX2054.2 IMP 156
   000636         063900     START    IX-FD1                                              IX2054.2 116
   000637         064000                     KEY IS EQUAL TO IX-FD1-ALTKEY1               IX2054.2 129
   000638         064100          INVALID KEY                                             IX2054.2
   000639      1  064200                          ADD 1000000  TO WRK-DU-10V00-002.       IX2054.2 156
   000640         064300*                                                                 IX2054.2
   000641         064400*    COMPUTED RESULTS VALUE IN INCREMENTS OF 1000000 INDICATE     IX2054.2
   000642         064500*        INVALID KEY PATH HAS BEEN TAKEN ON START STATEMENT.      IX2054.2
   000643         064600*                                                                 IX2054.2
   000644         064700 READ-TEST-F1-03.                                                 IX2054.2
   000645         064800     READ    IX-FD1                                               IX2054.2 116
   000646         064900        NEXT RECORD                                               IX2054.2
   000647         065000         AT END                                                   IX2054.2
   000648      1  065100              ADD   1000  TO WRK-DU-10V00-002.                    IX2054.2 156
   000649         065200*                                                                 IX2054.2
   000650         065300*    COMPUTED RESULTS IN INCREMENTS OF 1000 INDICATE AT END PATH  IX2054.2
   000651         065400*       HAS BEEN TAKEN ON THE READ STATEMENT.                     IX2054.2
   000652         065500*                                                                 IX2054.2
   000653         065600     MOVE     IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).          IX2054.2 119 180
   000654         065700     IF       XRECORD-NUMBER (1)  NOT EQUAL TO WRK-DU-10V00-001   IX2054.2 189 153
   000655      1  065800              ADD    1   TO WRK-DU-10V00-002.                     IX2054.2 156
   000656         065900*                                                                 IX2054.2
   000657         066000*     COMPUTED RESULTS IN INCREMENTS OF 1 INDICATE THAT           IX2054.2
   000658         066100*       RECORD  RETRIEVED WAS NOT THE ONE EXPECTED.               IX2054.2
   000659         066200*                                                                 IX2054.2
   000660         066300     SUBTRACT  1  FROM WRK-DU-10V00-001.                          IX2054.2 153
   000661         066400     ADD     1  TO WRK-CS-09V00-001.                              IX2054.2 150
   000662         066500     IF      WRK-CS-09V00-001  GREATER THAN 25                    IX2054.2 150
   000663      1  066600              NEXT  SENTENCE  ELSE                                IX2054.2
   000664      1  066700              GO TO READ-TEST-F1-03.                              IX2054.2 644
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000665         066800     IF       WRK-DU-10V00-002  GREATER THAN ZERO                 IX2054.2 156 IMP
   000666      1  066900              PERFORM  FAIL                                       IX2054.2 402
   000667      1  067000              MOVE    WRK-DU-10V00-002 TO COMPUTED-18V0           IX2054.2 156 240
   000668      1  067100              MOVE     ZERO TO CORRECT-18V0                       IX2054.2 IMP 253
   000669      1  067200              MOVE    "SEE PROGRAM"  TO RE-MARK                   IX2054.2 227
   000670      1  067300              ELSE    PERFORM  PASS.                              IX2054.2 401
   000671         067400     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000672         067500*                                                                 IX2054.2
   000673         067600*    04                                                           IX2054.2
   000674         067700*                                                                 IX2054.2
   000675         067800 READ-INIT-GF-04.                                                 IX2054.2
   000676         067900     MOVE  "READ-TEST-F1-04  "  TO PAR-NAME.                      IX2054.2 222
   000677         068000     MOVE  "START >= READ  ALTERN."  TO FEATURE.                  IX2054.2 218
   000678         068100     MOVE    0000000200  TO WRK-DU-10V00-001.                     IX2054.2 153
   000679         068200     MOVE    WRK-REC-KEY-FD1  TO IX-FD1-REC-KEY.                  IX2054.2 151 123
   000680         068300     MOVE     FD1-FILE-SIZE TO WRK-DU-10V00-001.                  IX2054.2 157 153
   000681         068400     MOVE     0000000001 TO WRK-DU-10V00-002.                     IX2054.2 156
   000682         068500     MOVE    ZERO  TO  WRK-CS-09V00-001.                          IX2054.2 IMP 150
   000683         068600     MOVE    WRK-ALT1-KEY-FD1  TO IX-FD1-ALT1-KEY.                IX2054.2 154 127
   000684         068700     MOVE    ZERO  TO WRK-DU-10V00-002.                           IX2054.2 IMP 156
   000685         068800     START    IX-FD1                                              IX2054.2 116
   000686         068900        KEY IS GREATER THAN OR EQUAL TO IX-FD1-ALTKEY1            IX2054.2 129
   000687         069000          INVALID KEY                                             IX2054.2
   000688      1  069100                          ADD 1000000  TO WRK-DU-10V00-002.       IX2054.2 156
   000689         069200*                                                                 IX2054.2
   000690         069300*    COMPUTED RESULTS VALUE IN INCREMENTS OF 1000000 INDICATE     IX2054.2
   000691         069400*        INVALID KEY PATH HAS BEEN TAKEN ON START STATEMENT.      IX2054.2
   000692         069500*                                                                 IX2054.2
   000693         069600 READ-TEST-F1-04.                                                 IX2054.2
   000694         069700     READ    IX-FD1                                               IX2054.2 116
   000695         069800        NEXT RECORD                                               IX2054.2
   000696         069900         AT END                                                   IX2054.2
   000697      1  070000              ADD   1000  TO WRK-DU-10V00-002.                    IX2054.2 156
   000698         070100*                                                                 IX2054.2
   000699         070200*    COMPUTED RESULTS IN INCREMENTS OF 1000 INDICATE AT END PATH  IX2054.2
   000700         070300*       HAS BEEN TAKEN ON THE READ STATEMENT.                     IX2054.2
   000701         070400*                                                                 IX2054.2
   000702         070500     MOVE     IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).          IX2054.2 119 180
   000703         070600     IF       XRECORD-NUMBER (1)  NOT EQUAL TO WRK-DU-10V00-001   IX2054.2 189 153
   000704      1  070700              ADD    1   TO WRK-DU-10V00-002.                     IX2054.2 156
   000705         070800*                                                                 IX2054.2
   000706         070900*     COMPUTED RESULTS IN INCREMENTS OF 1 INDICATE THAT           IX2054.2
   000707         071000*       RECORD  RETRIEVED WAS NOT THE ONE EXPECTED.               IX2054.2
   000708         071100*                                                                 IX2054.2
   000709         071200     SUBTRACT  1  FROM WRK-DU-10V00-001.                          IX2054.2 153
   000710         071300     ADD     1  TO WRK-CS-09V00-001.                              IX2054.2 150
   000711         071400     IF      WRK-CS-09V00-001  GREATER THAN 25                    IX2054.2 150
   000712      1  071500              NEXT  SENTENCE  ELSE                                IX2054.2
   000713      1  071600              GO TO READ-TEST-F1-04.                              IX2054.2 693
   000714         071700     IF       WRK-DU-10V00-002  GREATER THAN ZERO                 IX2054.2 156 IMP
   000715      1  071800              PERFORM  FAIL                                       IX2054.2 402
   000716      1  071900              MOVE    WRK-DU-10V00-002 TO COMPUTED-18V0           IX2054.2 156 240
   000717      1  072000              MOVE     ZERO TO CORRECT-18V0                       IX2054.2 IMP 253
   000718      1  072100              MOVE    "SEE PROGRAM"  TO RE-MARK                   IX2054.2 227
   000719      1  072200              ELSE    PERFORM  PASS.                              IX2054.2 401
   000720         072300     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000721         072400     CLOSE    IX-FD1.                                             IX2054.2 116
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000722         072500 READ-EXIT-F1.                                                    IX2054.2
   000723         072600     EXIT.                                                        IX2054.2
   000724         072700 SECT-IX-01-002 SECTION.                                          IX2054.2
   000725         072800 WRITE-INIT-GF-02.                                                IX2054.2
   000726         072900     OPEN     OUTPUT   IX-FD2.                                    IX2054.2 131
   000727         073000     MOVE     ZERO TO  WRK-CS-09V00-001.                          IX2054.2 IMP 150
   000728         073100     MOVE     ZERO TO  WRK-DU-10V00-003.                          IX2054.2 IMP 160
   000729         073200     MOVE     "IX-FD2"  TO XFILE-NAME (2).                        IX2054.2 183
   000730         073300     MOVE     "R1-F-G"  TO XRECORD-NAME (2).                      IX2054.2 185
   000731         073400     MOVE     000001   TO XRECORD-NUMBER (2).                     IX2054.2 189
   000732         073500     MOVE     CCVS-PGM-ID  TO XPROGRAM-NAME (2).                  IX2054.2 355 195
   000733         073600     MOVE     000240     TO XRECORD-LENGTH (2).                   IX2054.2 197
   000734         073700     MOVE     "RC"      TO CHARS-OR-RECORDS (2).                  IX2054.2 199
   000735         073800     MOVE     0025    TO XBLOCK-SIZE (2).                         IX2054.2 201
   000736         073900     MOVE     0000200   TO RECORDS-IN-FILE (2).                   IX2054.2 203
   000737         074000     MOVE     "IX"     TO XFILE-ORGANIZATION (2).                 IX2054.2 205
   000738         074100     MOVE     "S"      TO XLABEL-TYPE (2).                        IX2054.2 207
   000739         074200     MOVE     000200    TO WRK-DU-10V00-004.                      IX2054.2 163
   000740         074300     MOVE     "FILE CREATED"  TO RE-MARK.                         IX2054.2 227
   000741         074400     MOVE     "WRITE-TEST-GF-02" TO PAR-NAME.                     IX2054.2 222
   000742         074500     MOVE     "DYNAMIC MODE"  TO FEATURE.                         IX2054.2 218
   000743         074600 WRITE-TEST-GF-02-R.                                              IX2054.2
   000744         074700     MOVE     XRECORD-NUMBER (2) TO WRK-DU-10V00-003.             IX2054.2 189 160
   000745         074800     MOVE     WRK-REC-KEY-FD2  TO XRECORD-KEY (2).                IX2054.2 158 210
   000746         074900     MOVE     WRK-ALT1-KEY-FD2  TO ALTERNATE-KEY1 (2).            IX2054.2 161 212
   000747         075000     MOVE     FILE-RECORD-INFO (2)  TO IX-FD2R1-F-G-240.          IX2054.2 180 135
   000748         075100     WRITE    IX-FD2R1-F-G-240                                    IX2054.2 135
   000749      1  075200              INVALID KEY GO TO WRITE-TEST-GF-02.                 IX2054.2 755
   000750         075300     IF       XRECORD-NUMBER (2)  NOT LESS THAN FD2-FILE-SIZE     IX2054.2 189 164
   000751      1  075400              GO TO    WRITE-TEST-GF-02.                          IX2054.2 755
   000752         075500     ADD      000001  TO XRECORD-NUMBER (2).                      IX2054.2 189
   000753         075600     SUBTRACT 000001  FROM  WRK-DU-10V00-004.                     IX2054.2 163
   000754         075700     GO TO    WRITE-TEST-GF-02-R.                                 IX2054.2 743
   000755         075800 WRITE-TEST-GF-02.                                                IX2054.2
   000756         075900     MOVE     XRECORD-NUMBER  (2)  TO COMPUTED-18V0.              IX2054.2 189 240
   000757         076000     MOVE     FD2-FILE-SIZE   TO CORRECT-18V0.                    IX2054.2 164 253
   000758         076100     IF       XRECORD-NUMBER (2)  EQUAL TO FD2-FILE-SIZE          IX2054.2 189 164
   000759      1  076200              PERFORM  PASS                                       IX2054.2 401
   000760         076300     ELSE                                                         IX2054.2
   000761      1  076400         MOVE     "FILE CREATION PREMATURE; IX-41" TO RE-MARK     IX2054.2 227
   000762      1  076500         PERFORM  FAIL.                                           IX2054.2 402
   000763         076600     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000764         076700*                                                                 IX2054.2
   000765         076800*    02                                                           IX2054.2
   000766         076900*                                                                 IX2054.2
   000767         077000     CLOSE    IX-FD2.                                             IX2054.2 131
   000768         077100 READ-INIT-F1-05.                                                 IX2054.2
   000769         077200     OPEN     INPUT  IX-FD2.                                      IX2054.2 131
   000770         077300     MOVE     ZERO TO WRK-DU-10V00-003.                           IX2054.2 IMP 160
   000771         077400     MOVE     ZERO TO WRK-DU-10V00-004.                           IX2054.2 IMP 163
   000772         077500     MOVE     "  READ SEQUENTIAL"  TO FEATURE.                    IX2054.2 218
   000773         077600     MOVE     ZERO TO WRK-CS-09V00-001.                           IX2054.2 IMP 150
   000774         077700 READ-TEST-F1-05-3.                                               IX2054.2
   000775         077800     ADD      1   TO WRK-DU-10V00-003.                            IX2054.2 160
   000776         077900     READ     IX-FD2                                              IX2054.2 131
   000777         078000              NEXT RECORD                                         IX2054.2
   000778         078100         AT END                                                   IX2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000779      1  078200              ADD    1000  TO WRK-DU-10V00-004.                   IX2054.2 163
   000780         078300*                                                                 IX2054.2
   000781         078400*    COMPUTED RESULTS IN INCREMENTS OF 1000  INDICATE AT END PATH IX2054.2
   000782         078500*         HAS BEEN TAKEN.                                         IX2054.2
   000783         078600*                                                                 IX2054.2
   000784         078700     MOVE     IX-FD2R1-F-G-240  TO FILE-RECORD-INFO (2).          IX2054.2 135 180
   000785         078800     IF       XRECORD-NUMBER (2)  NOT EQUAL TO WRK-DU-10V00-003   IX2054.2 189 160
   000786      1  078900              ADD     1  TO WRK-DU-10V00-004.                     IX2054.2 163
   000787         079000*                                                                 IX2054.2
   000788         079100*    COMPUTED RESULTS IN INCREMENTS OF 1  INDICATE THAT THE       IX2054.2
   000789         079200*       RECORD RETRIEVED WAS NOT THE ONE EXPECTED.                IX2054.2
   000790         079300*                                                                 IX2054.2
   000791         079400     ADD     000000001  TO WRK-CS-09V00-001.                      IX2054.2 150
   000792         079500     IF      WRK-CS-09V00-001  GREATER THAN  24                   IX2054.2 150
   000793      1  079600              NEXT  SENTENCE  ELSE                                IX2054.2
   000794      1  079700              GO TO   READ-TEST-F1-05-3.                          IX2054.2 774
   000795         079800 READ-TEST-F1-05.                                                 IX2054.2
   000796         079900     MOVE "READ-TEST-F1-05" TO PAR-NAME.                          IX2054.2 222
   000797         080000     IF       WRK-DU-10V00-004  GREATER THAN ZERO                 IX2054.2 163 IMP
   000798      1  080100              MOVE "RETRIEVED A NOT EXPECTED RECORD " TO RE-MARK  IX2054.2 227
   000799      1  080200              PERFORM  FAIL                                       IX2054.2 402
   000800      1  080300              MOVE    WRK-DU-10V00-004 TO COMPUTED-18V0           IX2054.2 163 240
   000801      1  080400              MOVE    ZERO TO CORRECT-18V0                        IX2054.2 IMP 253
   000802      1  080500              MOVE    "SEE  PROGRAM"  TO RE-MARK                  IX2054.2 227
   000803      1  080600              ELSE  PERFORM PASS.                                 IX2054.2 401
   000804         080700     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000805         080800*                                                                 IX2054.2
   000806         080900*    06                                                           IX2054.2
   000807         081000*                                                                 IX2054.2
   000808         081100 READ-TEST-F1-06-4.                                               IX2054.2
   000809         081200     MOVE     ZERO TO WRK-DU-10V00-003.                           IX2054.2 IMP 160
   000810         081300     MOVE     ZERO TO WRK-DU-10V00-004.                           IX2054.2 IMP 163
   000811         081400     MOVE    ZERO  TO  WRK-CS-09V00-001.                          IX2054.2 IMP 150
   000812         081500     MOVE     "  READ RANDOM"  TO FEATURE.                        IX2054.2 218
   000813         081600 READ-TEST-F1-06-5.                                               IX2054.2
   000814         081700     ADD      10  TO WRK-DU-10V00-003.                            IX2054.2 160
   000815         081800     MOVE     WRK-DU-10V00-003  TO IX-FD2-KEY                     IX2054.2 160 141
   000816         081900     READ     IX-FD2  RECORD                                      IX2054.2 131
   000817         082000          INVALID KEY                                             IX2054.2
   000818      1  082100              ADD   1000 TO WRK-DU-10V00-004.                     IX2054.2 163
   000819         082200*                                                                 IX2054.2
   000820         082300*    COMPUTED RESULTS IN INCREMENTS OF 1000 INDICATE INVALID KEY  IX2054.2
   000821         082400*       PATH HAS BEEN TAKEN.                                      IX2054.2
   000822         082500*                                                                 IX2054.2
   000823         082600     MOVE     IX-FD2R1-F-G-240  TO FILE-RECORD-INFO (2).          IX2054.2 135 180
   000824         082700     IF       XRECORD-NUMBER (2)  NOT EQUAL TO WRK-DU-10V00-003   IX2054.2 189 160
   000825      1  082800              ADD    1    TO WRK-DU-10V00-004.                    IX2054.2 163
   000826         082900*                                                                 IX2054.2
   000827         083000*    COMPUTED RESULTS IN INCREMENTS OF 1  INDICAT THAT THE        IX2054.2
   000828         083100*       RECORD RETRIEVED WAS NOT THE ONE EXPECTED.                IX2054.2
   000829         083200*                                                                 IX2054.2
   000830         083300     ADD     1  TO WRK-CS-09V00-001.                              IX2054.2 150
   000831         083400     IF      WRK-CS-09V00-001  GREATER THAN   10                  IX2054.2 150
   000832      1  083500              NEXT SENTENCE  ELSE                                 IX2054.2
   000833      1  083600              GO TO    READ-TEST-F1-06-5.                         IX2054.2 813
   000834         083700 READ-TEST-F1-06.                                                 IX2054.2
   000835         083800     MOVE "READ-TEST-F1-06" TO PAR-NAME.                          IX2054.2 222
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000836         083900     IF       WRK-DU-10V00-004  GREATER THAN ZERO                 IX2054.2 163 IMP
   000837      1  084000              MOVE "RETRIEVED A NOT EXPECTED RECORD " TO RE-MARK  IX2054.2 227
   000838      1  084100              PERFORM  FAIL                                       IX2054.2 402
   000839      1  084200              MOVE    WRK-DU-10V00-004  TO COMPUTED-18V0          IX2054.2 163 240
   000840      1  084300              MOVE    ZERO  TO CORRECT-18V0                       IX2054.2 IMP 253
   000841      1  084400              MOVE    "SEE PROGRAM"  TO RE-MARK                   IX2054.2 227
   000842      1  084500              ELSE  PERFORM  PASS.                                IX2054.2 401
   000843         084600     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000844         084700*                                                                 IX2054.2
   000845         084800*    07                                                           IX2054.2
   000846         084900*                                                                 IX2054.2
   000847         085000 READ-TEST-F1-07-6.                                               IX2054.2
   000848         085100     MOVE    00000200  TO WRK-DU-10V00-003.                       IX2054.2 160
   000849         085200     MOVE    WRK-REC-KEY-FD2  TO IX-FD2-REC-KEY.                  IX2054.2 158 139
   000850         085300     MOVE     FD2-FILE-SIZE TO WRK-DU-10V00-003.                  IX2054.2 164 160
   000851         085400     MOVE     000000001 TO WRK-DU-10V00-004.                      IX2054.2 163
   000852         085500     MOVE    ZERO  TO  WRK-CS-09V00-001.                          IX2054.2 IMP 150
   000853         085600     MOVE    WRK-ALT1-KEY-FD2  TO IX-FD2-ALT1-KEY.                IX2054.2 161 143
   000854         085700     MOVE     "  READ ALTERNATE KEY"  TO FEATURE.                 IX2054.2 218
   000855         085800     MOVE    ZERO TO WRK-DU-10V00-004.                            IX2054.2 IMP 163
   000856         085900     START   IX-FD2                                               IX2054.2 131
   000857         086000                   KEY IS EQUAL TO IX-FD2-ALTKEY1                 IX2054.2 145
   000858      1  086100              INVALID KEY ADD 1000000  TO WRK-DU-10V00-004.       IX2054.2 163
   000859         086200*                                                                 IX2054.2
   000860         086300*    COMPUTED RESULTS VALUE IN INCREMENTS OF 1000000 INDICATE     IX2054.2
   000861         086400*        INVALID KEY PATH HAS BEEN TAKEN ON START STATEMENT.      IX2054.2
   000862         086500*                                                                 IX2054.2
   000863         086600 READ-TEST-F1-07-7.                                               IX2054.2
   000864         086700     READ    IX-FD2                                               IX2054.2 131
   000865         086800        NEXT RECORD                                               IX2054.2
   000866         086900         AT END                                                   IX2054.2
   000867      1  087000              ADD   1000  TO WRK-DU-10V00-004.                    IX2054.2 163
   000868         087100*                                                                 IX2054.2
   000869         087200*    COMPUTED RESULTS IN INCREMENTS OF 1000 INDICATE AT END PATH  IX2054.2
   000870         087300*       HAS BEEN TAKEN.                                           IX2054.2
   000871         087400*                                                                 IX2054.2
   000872         087500     MOVE     IX-FD2R1-F-G-240  TO FILE-RECORD-INFO (2).          IX2054.2 135 180
   000873         087600     IF       XRECORD-NUMBER (2)  NOT EQUAL TO WRK-DU-10V00-003   IX2054.2 189 160
   000874      1  087700              ADD    1   TO WRK-DU-10V00-004.                     IX2054.2 163
   000875         087800*                                                                 IX2054.2
   000876         087900*     COMPUTED RESULTS IN INCREMENTS OF 1 INDICATE THAT           IX2054.2
   000877         088000*       RECORD  RETRIEVED WAS NOT THE ONE EXPECTED.               IX2054.2
   000878         088100*                                                                 IX2054.2
   000879         088200     SUBTRACT  1  FROM WRK-DU-10V00-003.                          IX2054.2 160
   000880         088300     ADD     1  TO WRK-CS-09V00-001.                              IX2054.2 150
   000881         088400     IF      WRK-CS-09V00-001  GREATER THAN 25                    IX2054.2 150
   000882      1  088500              NEXT  SENTENCE  ELSE                                IX2054.2
   000883      1  088600              GO TO    READ-TEST-F1-07-7.                         IX2054.2 863
   000884         088700 READ-TEST-F1-07.                                                 IX2054.2
   000885         088800     MOVE "READ-TEST-F1-07" TO PAR-NAME.                          IX2054.2 222
   000886         088900     IF       WRK-DU-10V00-004  GREATER THAN ZERO                 IX2054.2 163 IMP
   000887      1  089000              PERFORM  FAIL                                       IX2054.2 402
   000888      1  089100              MOVE    WRK-DU-10V00-004 TO COMPUTED-18V0           IX2054.2 163 240
   000889      1  089200              MOVE     ZERO TO CORRECT-18V0                       IX2054.2 IMP 253
   000890      1  089300              MOVE    "SEE PROGRAM"  TO RE-MARK                   IX2054.2 227
   000891      1  089400              ELSE    PERFORM  PASS.                              IX2054.2 401
   000892         089500     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000893         089600     CLOSE    IX-FD2.                                             IX2054.2 131
   000894         089700 INX-EXIT-002.                                                    IX2054.2
   000895         089800     EXIT.                                                        IX2054.2
   000896         089900 READ-INIT-F1-08.                                                 IX2054.2
   000897         090000     OPEN     INPUT    IX-FD1.                                    IX2054.2 116
   000898         090100     OPEN     INPUT   IX-FD2.                                     IX2054.2 131
   000899         090200     MOVE     SPACE TO FILE-RECORD-INFO (9).                      IX2054.2 IMP 180
   000900         090300     MOVE    SPACE TO FILE-RECORD-INFO (1).                       IX2054.2 IMP 180
   000901         090400     MOVE     ZERO TO WRK-DU-10V00-004.                           IX2054.2 IMP 163
   000902         090500     MOVE     SPACES   TO IX-FD1R1-F-G-240.                       IX2054.2 IMP 119
   000903         090600     MOVE     SPACES TO IX-FD2R1-F-G-240.                         IX2054.2 IMP 135
   000904         090700     MOVE    "SAME AREA" TO FEATURE.                              IX2054.2 218
   000905         090800 READ-TEST-F1-08-1.                                               IX2054.2
   000906         090900     READ    IX-FD1                                               IX2054.2 116
   000907         091000                NEXT RECORD                                       IX2054.2
   000908         091100                AT END                                            IX2054.2
   000909      1  091200              ADD     1000  TO WRK-DU-10V00-004.                  IX2054.2 163
   000910         091300     MOVE     IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).          IX2054.2 119 180
   000911         091400 READ-TEST-F1-08.                                                 IX2054.2
   000912         091500     MOVE "READ-TEST-F1-08" TO PAR-NAME.                          IX2054.2 222
   000913         091600     IF       XFILE-NAME (1)  EQUAL TO "IX-FD1"                   IX2054.2 183
   000914      1  091700              PERFORM  PASS                                       IX2054.2 401
   000915         091800              ELSE                                                IX2054.2
   000916      1  091900              MOVE "RETRIEVED A RECORD NOT EXPECTED " TO RE-MARK  IX2054.2 227
   000917      1  092000              PERFORM FAIL                                        IX2054.2 402
   000918      1  092100              MOVE    XFILE-NAME (1)  TO COMPUTED-A               IX2054.2 183 233
   000919      1  092200              MOVE     "IX-FD1"  TO CORRECT-A.                    IX2054.2 247
   000920         092300     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000921         092400*                                                                 IX2054.2
   000922         092500*    09                                                           IX2054.2
   000923         092600*                                                                 IX2054.2
   000924         092700     READ    IX-FD2                                               IX2054.2 131
   000925         092800               NEXT RECORD                                        IX2054.2
   000926         092900                       AT END                                     IX2054.2
   000927      1  093000              ADD    1000 TO WRK-DU-10V00-004.                    IX2054.2 163
   000928         093100*                                                                 IX2054.2
   000929         093200*    COMPUTED RESULTS IN INCREMENTS OF 1000 INDICATE INVALID KEY  IX2054.2
   000930         093300*       PATH HAS BEEN TAKEN.                                      IX2054.2
   000931         093400*                                                                 IX2054.2
   000932         093500 READ-TEST-F1-09.                                                 IX2054.2
   000933         093600     MOVE "READ-TEST-F1-09" TO PAR-NAME.                          IX2054.2 222
   000934         093700     IF       WRK-DU-10V00-004    EQUAL TO ZERO                   IX2054.2 163 IMP
   000935      1  093800              PERFORM PASS                                        IX2054.2 401
   000936         093900            ELSE                                                  IX2054.2
   000937      1  094000              MOVE "RETRIEVED A RECORD NOT EXPECTED " TO RE-MARK  IX2054.2 227
   000938      1  094100              PERFORM FAIL                                        IX2054.2 402
   000939      1  094200              MOVE     WRK-DU-10V00-004  TO COMPUTED-A            IX2054.2 163 233
   000940      1  094300              MOVE      ZERO TO CORRECT-A                         IX2054.2 IMP 247
   000941      1  094400              MOVE      "SEE PROGRAM"  TO RE-MARK.                IX2054.2 227
   000942         094500     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000943         094600*                                                                 IX2054.2
   000944         094700*    10                                                           IX2054.2
   000945         094800*                                                                 IX2054.2
   000946         094900 READ-TEST-F1-10.                                                 IX2054.2
   000947         095000     MOVE "READ-TEST-F1-10" TO PAR-NAME.                          IX2054.2 222
   000948         095100     MOVE    IX-FD1R1-F-G-240  TO FILE-RECORD-INFO  (9).          IX2054.2 119 180
   000949         095200*                                                                 IX2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000950         095300*    NOTE    IN TESTING THE SAME AREA CLAUSE THE RECORD AREA      IX2054.2
   000951         095400*       SHOULD BE SHARED BY BOTH FILES IX-FD1 AND IX-FD2,         IX2054.2
   000952         095500*       THEREFORE FILE IX-FD2 IS READ AND THE RECORD              IX2054.2
   000953         095600*       IDENTIFIED FOR IX-FD1 IS ACCESSED AND TESTED FOR          IX2054.2
   000954         095700*       EXPECTED PRESENCE OF IX-FD2 FILE RECORD CONTENTS.         IX2054.2
   000955         095800*                                                                 IX2054.2
   000956         095900     IF       XFILE-NAME (9)  EQUAL TO "IX-FD2"                   IX2054.2 183
   000957      1  096000              PERFORM   PASS                                      IX2054.2 401
   000958         096100              ELSE                                                IX2054.2
   000959      1  096200              PERFORM   FAIL                                      IX2054.2 402
   000960      1  096300              MOVE     XFILE-NAME (9)  TO COMPUTED-A              IX2054.2 183 233
   000961      1  096400              MOVE "IX-FD2" TO CORRECT-A                          IX2054.2 247
   000962      1  096500              MOVE    "SEE PROGRAM"  TO RE-MARK.                  IX2054.2 227
   000963         096600     PERFORM   PRINT-DETAIL.                                      IX2054.2 405
   000964         096700     CLOSE    IX-FD2.                                             IX2054.2 131
   000965         096800     CLOSE    IX-FD1.                                             IX2054.2 116
   000966         096900 INX-EXIT-003.                                                    IX2054.2
   000967         097000     EXIT.                                                        IX2054.2
   000968         097100 CCVS-EXIT SECTION.                                               IX2054.2
   000969         097200 CCVS-999999.                                                     IX2054.2
   000970         097300     GO TO CLOSE-FILES.                                           IX2054.2 382
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    21
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      212   ALTERNATE-KEY1 . . . . . . . .  M528 M746
      214   ALTERNATE-KEY2
      278   ANSI-REFERENCE . . . . . . . .  484 491 500
      112   C-ABORT. . . . . . . . . . . .  M363 M386
      106   C-ALL. . . . . . . . . . . . .  M388
      102   C-DATE . . . . . . . . . . . .  M365
      108   C-DELETED. . . . . . . . . . .  M390
      107   C-FAIL . . . . . . . . . . . .  M389
      111   C-INDENT
      109   C-INSPECT. . . . . . . . . . .  M391
      104   C-NO-OF-TESTS. . . . . . . . .  M364
      110   C-NOTE
      105   C-OK . . . . . . . . . . . . .  M387
      103   C-TIME . . . . . . . . . . . .  M366
      257   CCVS-C-1 . . . . . . . . . . .  423 469
      262   CCVS-C-2 . . . . . . . . . . .  424 470
      312   CCVS-E-1 . . . . . . . . . . .  429
      317   CCVS-E-2 . . . . . . . . . . .  438 445 452 457
      320   CCVS-E-2-2 . . . . . . . . . .  M437
      325   CCVS-E-3 . . . . . . . . . . .  458
      334   CCVS-E-4 . . . . . . . . . . .  437
      335   CCVS-E-4-1 . . . . . . . . . .  M435
      337   CCVS-E-4-2 . . . . . . . . . .  M436
      279   CCVS-H-1 . . . . . . . . . . .  418 465
      284   CCVS-H-2A. . . . . . . . . . .  419 466
      293   CCVS-H-2B. . . . . . . . . . .  420 467
      305   CCVS-H-3 . . . . . . . . . . .  421 468
      355   CCVS-PGM-ID. . . . . . . . . .  361 371 371 384 514 732
      199   CHARS-OR-RECORDS . . . . . . .  M518 M734
      239   CM-18V0
      233   COMPUTED-A . . . . . . . . . .  234 236 237 238 239 496 499 M918 M939 M960
      234   COMPUTED-N
      232   COMPUTED-X . . . . . . . . . .  M413 481
      236   COMPUTED-0V18
      238   COMPUTED-14V4
      240   COMPUTED-18V0. . . . . . . . .  M538 M580 M618 M667 M716 M756 M800 M839 M888
      237   COMPUTED-4V14
      256   COR-ANSI-REFERENCE . . . . . .  M491 M493
      247   CORRECT-A. . . . . . . . . . .  248 249 250 251 252 497 499 M919 M940 M961
      248   CORRECT-N
      246   CORRECT-X. . . . . . . . . . .  M414 483
      249   CORRECT-0V18
      251   CORRECT-14V4
      253   CORRECT-18V0 . . . . . . . . .  M539 M581 M619 M668 M717 M757 M801 M840 M889
      250   CORRECT-4V14
      252   CR-18V0
      270   DELETE-COUNTER . . . . . . . .  390 M403 432 448 450
      225   DOTVALUE . . . . . . . . . . .  M408
      276   DUMMY-HOLD . . . . . . . . . .  M462 472
      115   DUMMY-RECORD . . . . . . . . .  M418 M419 M420 M421 M423 M424 M425 M427 M429 M438 M445 M452 M457 M458 462 M463
                                            464 M465 M466 M467 M468 M469 M470 M471 M472 476 M477 M486 M501
      323   ENDER-DESC . . . . . . . . . .  M440 M451 M456
      271   ERROR-COUNTER. . . . . . . . .  389 M402 431 441 444
      275   ERROR-HOLD . . . . . . . . . .  388 M431 M432 M432 M433 436
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    22
0 Defined   Cross-reference of data names   References

0     321   ERROR-TOTAL. . . . . . . . . .  M442 M444 M449 M450 M454 M455
      157   FD1-FILE-SIZE. . . . . . . . .  532 539 540 631 680
      164   FD2-FILE-SIZE. . . . . . . . .  750 757 758 850
      218   FEATURE. . . . . . . . . . . .  M524 M556 M590 M628 M677 M742 M772 M812 M854 M904
      180   FILE-RECORD-INFO . . . . . . .  M379 529 M567 M604 M653 M702 747 M784 M823 M872 M899 M900 M910 M948
      181   FILE-RECORD-INFO-P1-120
      208   FILE-RECORD-INFO-P121-240
      166   FILE-RECORD-INFO-SKELETON. . .  378
      165   FILE-RECORD-INFORMATION-REC
      349   HYPHEN-LINE. . . . . . . . . .  425 427 471
      315   ID-AGAIN . . . . . . . . . . .  M371
      348   INF-ANSI-REFERENCE . . . . . .  M484 M487 M500 M502
      343   INFO-TEXT. . . . . . . . . . .  M485
      272   INSPECT-COUNTER. . . . . . . .  391 M400 431 453 455
      116   IX-FD1 . . . . . . . . . . . .  77 94 508 549 551 559 597 636 645 685 694 721 897 906 965
      129   IX-FD1-ALTKEY1 . . . . . . . .  84 637 686
      127   IX-FD1-ALT1-KEY. . . . . . . .  M634 M683
      125   IX-FD1-KEY . . . . . . . . . .  83 M596
      123   IX-FD1-REC-KEY . . . . . . . .  M630 M679
      120   IX-FD1-REC-120
      121   IX-FD1-REC-120-240
      119   IX-FD1R1-F-G-240 . . . . . . .  M529 530 567 604 653 702 M902 910 948
      131   IX-FD2 . . . . . . . . . . . .  85 94 726 767 769 776 816 856 864 893 898 924 964
      145   IX-FD2-ALTKEY1 . . . . . . . .  92 857
      143   IX-FD2-ALT1-KEY. . . . . . . .  M853
      141   IX-FD2-KEY . . . . . . . . . .  91 M815
      139   IX-FD2-REC-KEY . . . . . . . .  M849
      136   IX-FD2-REC-120
      137   IX-FD2-REC-120-240
      135   IX-FD2R1-F-G-240 . . . . . . .  M747 748 784 823 872 M903
      193   ODO-NUMBER
      220   P-OR-F . . . . . . . . . . . .  M400 M401 M402 M403 410 M413
      222   PAR-NAME . . . . . . . . . . .  M415 M523 M555 M589 M627 M676 M741 M796 M835 M885 M912 M933 M947
      224   PARDOT-X . . . . . . . . . . .  M407
      273   PASS-COUNTER . . . . . . . . .  387 M401 433 435
      113   PRINT-FILE . . . . . . . . . .  75 370 395
      114   PRINT-REC. . . . . . . . . . .  M409 M490 M492
       98   RAW-DATA . . . . . . . . . . .  70 360 362 369 383 385 394
      101   RAW-DATA-KEY . . . . . . . . .  74 M361 M384
      100   RAW-DATA-SATZ. . . . . . . . .  367 392
      227   RE-MARK. . . . . . . . . . . .  M404 M416 M522 M543 M582 M620 M669 M718 M740 M761 M798 M802 M837 M841 M890 M916
                                            M937 M941 M962
      269   REC-CT . . . . . . . . . . . .  406 408 415
      268   REC-SKL-SUB. . . . . . . . . .  M374 M377 379
      277   RECORD-COUNT . . . . . . . . .  M460 461 M473
      203   RECORDS-IN-FILE. . . . . . . .  M515 M736
      187   REELUNIT-NUMBER
      228   TEST-COMPUTED. . . . . . . . .  490
      243   TEST-CORRECT . . . . . . . . .  492
      296   TEST-ID. . . . . . . . . . . .  M371
      216   TEST-RESULTS . . . . . . . . .  M372 409
      274   TOTAL-ERROR
      191   UPDATE-NUMBER
      154   WRK-ALT1-KEY-FD1 . . . . . . .  528 634 683
      161   WRK-ALT1-KEY-FD2 . . . . . . .  746 853
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    23
0 Defined   Cross-reference of data names   References

0     150   WRK-CS-09V00-001 . . . . . . .  M509 M554 M574 575 M592 M611 612 M633 M661 662 M682 M710 711 M727 M773 M791 792
                                            M811 M830 831 M852 M880 881
      153   WRK-DU-10V00-001 . . . . . . .  M510 M526 M552 M558 568 M591 M595 596 605 M629 M631 654 M660 M678 M680 703 M709
      156   WRK-DU-10V00-002 . . . . . . .  M521 M535 M553 M562 M569 578 580 M593 M599 M606 616 618 M632 M635 M639 M648 M655
                                            665 667 M681 M684 M688 M697 M704 714 716
      160   WRK-DU-10V00-003 . . . . . . .  M728 M744 M770 M775 785 M809 M814 815 824 M848 M850 873 M879
      163   WRK-DU-10V00-004 . . . . . . .  M739 M753 M771 M779 M786 797 800 M810 M818 M825 836 839 M851 M855 M858 M867 M874
                                            886 888 M901 M909 M927 934 939
      151   WRK-REC-KEY-FD1. . . . . . . .  527 630 679
      158   WRK-REC-KEY-FD2. . . . . . . .  745 849
      201   XBLOCK-SIZE. . . . . . . . . .  M517 M735
      183   XFILE-NAME . . . . . . . . . .  M511 M729 913 918 956 960
      205   XFILE-ORGANIZATION . . . . . .  M519 M737
      207   XLABEL-TYPE. . . . . . . . . .  M520 M738
      195   XPROGRAM-NAME. . . . . . . . .  M514 M732
      210   XRECORD-KEY. . . . . . . . . .  M527 M745
      197   XRECORD-LENGTH . . . . . . . .  M516 M733
      185   XRECORD-NAME . . . . . . . . .  M512 M730
      189   XRECORD-NUMBER . . . . . . . .  M513 526 532 M534 538 540 568 605 654 703 M731 744 750 M752 756 758 785 824 873
      345   XXCOMPUTED . . . . . . . . . .  M499
      347   XXCORRECT. . . . . . . . . . .  M499
      340   XXINFO . . . . . . . . . . . .  486 501
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    24
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

      495   BAIL-OUT . . . . . . . . . . .  P412
      503   BAIL-OUT-EX. . . . . . . . . .  E412 G497
      498   BAIL-OUT-WRITE . . . . . . . .  G496
      478   BLANK-LINE-PRINT
      968   CCVS-EXIT
      380   CCVS-INIT-EXIT
      376   CCVS-INIT-FILE . . . . . . . .  P375
      969   CCVS-999999
      358   CCVS1
      504   CCVS1-EXIT . . . . . . . . . .  G381
      382   CLOSE-FILES. . . . . . . . . .  G970
      422   COLUMN-NAMES-ROUTINE . . . . .  E373
      403   DE-LETE
      368   END-E-1. . . . . . . . . . . .  G362 G367
      393   END-E-2. . . . . . . . . . . .  G385 G392
      426   END-ROUTINE. . . . . . . . . .  P395
      430   END-ROUTINE-1
      439   END-ROUTINE-12
      447   END-ROUTINE-13 . . . . . . . .  E395
      428   END-RTN-EXIT
      402   FAIL . . . . . . . . . . . . .  P544 P579 P617 P666 P715 P762 P799 P838 P887 P917 P938 P959
      480   FAIL-ROUTINE . . . . . . . . .  P411
      494   FAIL-ROUTINE-EX. . . . . . . .  E411 G488
      489   FAIL-ROUTINE-WRITE . . . . . .  G482 G483
      417   HEAD-ROUTINE . . . . . . . . .  P373
      400   INSPT
      894   INX-EXIT-002
      966   INX-EXIT-003
      359   OPEN-FILES
      401   PASS . . . . . . . . . . . . .  P541 P583 P621 P670 P719 P759 P803 P842 P891 P914 P935 P957
      405   PRINT-DETAIL . . . . . . . . .  P545 P584 P622 P671 P720 P763 P804 P843 P892 P920 P942 P963
      722   READ-EXIT-F1
      550   READ-INIT-F1-01
      768   READ-INIT-F1-05
      896   READ-INIT-F1-08
      588   READ-INIT-F2-02
      626   READ-INIT-GF-03
      675   READ-INIT-GF-04
      557   READ-TEST-F1-01-3. . . . . . .  G577
      615   READ-TEST-F1-02
      594   READ-TEST-F1-02-5. . . . . . .  G614
      644   READ-TEST-F1-03. . . . . . . .  G664
      693   READ-TEST-F1-04. . . . . . . .  G713
      795   READ-TEST-F1-05
      774   READ-TEST-F1-05-3. . . . . . .  G794
      834   READ-TEST-F1-06
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    25
0 Defined   Cross-reference of procedures   References

0     808   READ-TEST-F1-06-4
      813   READ-TEST-F1-06-5. . . . . . .  G833
      884   READ-TEST-F1-07
      847   READ-TEST-F1-07-6
      863   READ-TEST-F1-07-7. . . . . . .  G883
      911   READ-TEST-F1-08
      905   READ-TEST-F1-08-1
      932   READ-TEST-F1-09
      946   READ-TEST-F1-10
      506   SECT-IX-01-001
      724   SECT-IX-01-002
      398   TERMINATE-CALL
      396   TERMINATE-CCVS
      507   WRITE-INIT-GF-01
      725   WRITE-INIT-GF-02
      459   WRITE-LINE . . . . . . . . . .  P409 P410 P418 P419 P420 P421 P423 P424 P425 P427 P429 P438 P446 P452 P457 P458
                                            P486 P490 P492 P501
      537   WRITE-TEST-GF-01 . . . . . . .  G531 G533
      525   WRITE-TEST-GF-01-R . . . . . .  G536
      755   WRITE-TEST-GF-02 . . . . . . .  G749 G751
      743   WRITE-TEST-GF-02-R . . . . . .  G754
      475   WRT-LN . . . . . . . . . . . .  P465 P466 P467 P468 P469 P470 P471 P474 P479
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    26
0 Defined   Cross-reference of programs     References

        3   IX205A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX205A    Date 06/04/2022  Time 11:58:09   Page    27
0LineID  Message code  Message text

     79  IGYDS1298-I   Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX044" was treated as comments.

     87  IGYDS1298-I   Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX045" was treated as comments.

    113  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    116  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

                       Same message on line:    131

    131  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       6           6
-* Statistics for COBOL program IX205A:
 *    Source records = 970
 *    Data Division statements = 122
 *    Procedure Division statements = 453
 *    Generated COBOL statements = 0
 *    Program complexity factor = 462
0End of compilation 1,  program IX205A,  highest severity 0.
0Return code 0
