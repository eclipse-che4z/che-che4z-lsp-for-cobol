1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:24   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:24   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2164.2
   000002         000200 PROGRAM-ID.                                                      IX2164.2
   000003         000300     IX216A.                                                      IX2164.2
   000004         000500*                                                              *  IX2164.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2164.2
   000006         000700*                                                              *  IX2164.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2164.2
   000008         000900*                                                              *  IX2164.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2164.2
   000010         001100*                                                              *  IX2164.2
   000011         001300*                                                                 IX2164.2
   000012         001400*         NEW TESTS:                                              IX2164.2
   000013         001500*                                                                 IX2164.2
   000014         001600*             SELECT OPTIONAL ...   WITH                          IX2164.2
   000015         001700*                    --------                                     IX2164.2
   000016         001800*             OPEN EXTEND ...   (FOR A NON-EXISTING FILE)         IX2164.2
   000017         001900*                  ------              ------------               IX2164.2
   000018         002000*         THEN THE FILE IS CLOSED AFTER WRITING 300 RECORDS       IX2164.2
   000019         002100*         AND OPENED WITH:                                        IX2164.2
   000020         002200*                                                                 IX2164.2
   000021         002300*             OPEN EXTEND ...   (FOR AN EXISTING FILE)            IX2164.2
   000022         002400*                  ------               --------                  IX2164.2
   000023         002500*         AND     CLOSE IX-FS2 LOCK.                              IX2164.2
   000024         002600*                              ----                               IX2164.2
   000025         002700*                                                                 IX2164.2
   000026         002800*         ALL OTHER TESTS ARE IDENTICAL WITH THE TESTS IN IX104.  IX2164.2
   000027         002900*                                                                 IX2164.2
   000028         003000*                                                                 IX2164.2
   000029         003100*    THIS PROGRAM TESTS THE SYNTACTICAL CONSTRUCTS AND SEMANTIC   IX2164.2
   000030         003200*    ACTIONS ASSOCIATED WITH THE FOLLOWING ELEMENTS:              IX2164.2
   000031         003300*                                                                 IX2164.2
   000032         003400*    (1) FILE STATUS                                              IX2164.2
   000033         003500*    (2) USE AFTER EXCEPTION USING FILE-NAME                      IX2164.2
   000034         003600*    (3) READ                                                     IX2164.2
   000035         003700*    (4) WRITE                                                    IX2164.2
   000036         003800*    (5) REWRITE                                                  IX2164.2
   000037         003900*    (6) RECORD KEY                                               IX2164.2
   000038         004000*    (7) ACCESS                                                   IX2164.2
   000039         004100*                                                                 IX2164.2
   000040         004200*    THIS PROGRAM CREATES AN INDEXED FILE SEQUENTIALLY (ACCESS    IX2164.2
   000041         004300*    MODE SEQUENTIAL) AND THEN UPDATES SELECTIVE RECORDS OF THE   IX2164.2
   000042         004400*    FILE.  THE FILE STATUS CONTENTS ARE CAPTURED AND TESTED FOR  IX2164.2
   000043         004500*    ACCURACY FOR EACH OPEN, CLOSE, READ AND REWRITE STATEMENT    IX2164.2
   000044         004600*    USED.  THE READ, WRITE AND REWRITE STATEMENTS ARE USED       IX2164.2
   000045         004700*    WITHOUT THE APPROPRIATE AT END OR INVALID KEY PHRASES. THE   IX2164.2
   000046         004800*    OMISSION OF THESE PHRASES ARE PERMITTED IF AN APPLICABLE USE IX2164.2
   000047         004900*    PROCEDURE HAS BEEN SPECIFIED.                                IX2164.2
   000048         005000*                                                                 IX2164.2
   000049         005100*                                                                 IX2164.2
   000050         005200*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX2164.2
   000051         005300*                                                                 IX2164.2
   000052         005400*             X-25   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX2164.2
   000053         005500*                    CLAUSE FOR DATA FILE IX-FD2                  IX2164.2
   000054         005600*             X-45   INDEXED FILE IMPLEMENTOR-NAME IN ASSIGN TO   IX2164.2
   000055         005700*                    CLAUSE FOR INDEX FILE IX-FD2                 IX2164.2
   000056         005800*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX2164.2
   000057         005900*             X-62   IMPLEMENTOR-NAME FOR RAW-DATA (OPTIONAL)     IX2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX2164.2
   000059         006100*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX2164.2
   000060         006200*                                                                 IX2164.2
   000061         006300*         NOTE:  X-CARDS 45 AND 62          ARE OPTIONAL          IX2164.2
   000062         006400*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX2164.2
   000063         006500*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX2164.2
   000064         006600*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX2164.2
   000065         006700*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX2164.2
   000066         006800*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX2164.2
   000067         006900*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX2164.2
   000068         007000*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX2164.2
   000069         007100*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX2164.2
   000070         007200*               THEY ARE AS FOLLOWS                               IX2164.2
   000071         007300*                                                                 IX2164.2
   000072         007400*                  J  SELECTS X-CARD 45                           IX2164.2
   000073         007500*                  P  SELECTS X-CARD 62                           IX2164.2
   000074         007600*                                                                 IX2164.2
   000075         007800 ENVIRONMENT DIVISION.                                            IX2164.2
   000076         007900 CONFIGURATION SECTION.                                           IX2164.2
   000077         008000 SOURCE-COMPUTER.                                                 IX2164.2
   000078         008100     XXXXX082.                                                    IX2164.2
   000079         008200 OBJECT-COMPUTER.                                                 IX2164.2
   000080         008300     XXXXX083.                                                    IX2164.2
   000081         008400 INPUT-OUTPUT SECTION.                                            IX2164.2
   000082         008500 FILE-CONTROL.                                                    IX2164.2
   000083         008600     SELECT RAW-DATA   ASSIGN TO                                  IX2164.2 100
   000084         008700     XXXXX062                                                     IX2164.2
   000085         008800            ORGANIZATION IS INDEXED                               IX2164.2
   000086         008900            ACCESS MODE IS RANDOM                                 IX2164.2
   000087         009000            RECORD KEY IS RAW-DATA-KEY.                           IX2164.2 103
   000088         009100     SELECT PRINT-FILE ASSIGN TO                                  IX2164.2 115
   000089         009200     XXXXX055.                                                    IX2164.2
   000090         009300     SELECT OPTIONAL  IX-FS2 ASSIGN                               IX2164.2 118
   000091         009400     XXXXX025                                                     IX2164.2
   000092         009500     XXXXX045                                                     IX2164.2

 ==000092==> IGYDS1298-I Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX045" was treated as comments.

   000093         009600             ORGANIZATION IS INDEXED                              IX2164.2
   000094         009700        ACCESS SEQUENTIAL                                         IX2164.2
   000095         009800        FILE STATUS IS IX-FS2-STATUS                              IX2164.2 142
   000096         009900        RECORD  IX-FS2-KEY.                                       IX2164.2 127
   000097         010000 DATA DIVISION.                                                   IX2164.2
   000098         010100 FILE SECTION.                                                    IX2164.2
   000099         010200                                                                  IX2164.2
   000100         010300 FD  RAW-DATA.                                                    IX2164.2
   000101         010400                                                                  IX2164.2
   000102         010500 01  RAW-DATA-SATZ.                                               IX2164.2
   000103         010600     05  RAW-DATA-KEY        PIC X(6).                            IX2164.2
   000104         010700     05  C-DATE              PIC 9(6).                            IX2164.2
   000105         010800     05  C-TIME              PIC 9(8).                            IX2164.2
   000106         010900     05  C-NO-OF-TESTS       PIC 99.                              IX2164.2
   000107         011000     05  C-OK                PIC 999.                             IX2164.2
   000108         011100     05  C-ALL               PIC 999.                             IX2164.2
   000109         011200     05  C-FAIL              PIC 999.                             IX2164.2
   000110         011300     05  C-DELETED           PIC 999.                             IX2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000111         011400     05  C-INSPECT           PIC 999.                             IX2164.2
   000112         011500     05  C-NOTE              PIC X(13).                           IX2164.2
   000113         011600     05  C-INDENT            PIC X.                               IX2164.2
   000114         011700     05  C-ABORT             PIC X(8).                            IX2164.2
   000115         011800 FD  PRINT-FILE.                                                  IX2164.2

 ==000115==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000116         011900 01  PRINT-REC PICTURE X(120).                                    IX2164.2
   000117         012000 01  DUMMY-RECORD PICTURE X(120).                                 IX2164.2
   000118         012100 FD  IX-FS2                                                       IX2164.2

 ==000118==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000118==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000119         012200     LABEL RECORDS ARE STANDARD                                   IX2164.2
   000120         012300     DATA RECORDS IX-FS2R1-F-G-240                                IX2164.2 *
   000121         012400     BLOCK CONTAINS 480                                           IX2164.2
   000122         012500     RECORD CONTAINS  240  CHARACTERS.                            IX2164.2
   000123         012600 01  IX-FS2R1-F-G-240.                                            IX2164.2
   000124         012700     05 IX-FS2-REC-120    PIC X(120).                             IX2164.2
   000125         012800     05 IX-FS2-REC-120-240.                                       IX2164.2
   000126         012900     10  FILLER PICTURE X(8).                                     IX2164.2
   000127         013000     10  IX-FS2-KEY PIC X(29).                                    IX2164.2
   000128         013100     10  FILLER PIC X(83).                                        IX2164.2
   000129         013200 WORKING-STORAGE SECTION.                                         IX2164.2
   000130         013300 01  GRP-0101.                                                    IX2164.2
   000131         013400     02 FILLER PIC X(10) VALUE "ABCD921XYZ".                      IX2164.2
   000132         013500     02  WRK-DU-09V00-001 PIC 9(9) VALUE ZERO.                    IX2164.2 IMP
   000133         013600     02 FILLER PIC X(10) VALUE "Z2F()$+-AB".                      IX2164.2
   000134         013700 01  GRP-0001.                                                    IX2164.2
   000135         013800     05 WRK-CS-09V00-012  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2164.2 IMP
   000136         013900     05 WRK-CS-09V00-013  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2164.2 IMP
   000137         014000     05 WRK-CS-09V00-014  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2164.2 IMP
   000138         014100     05 WRK-CS-09V00-015  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2164.2 IMP
   000139         014200     05 WRK-CS-09V00-016  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2164.2 IMP
   000140         014300     05 WRK-CS-09V00-017  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2164.2 IMP
   000141         014400     05 WRK-CS-09V00-018  PIC S9(9) USAGE COMP  VALUE ZERO.       IX2164.2 IMP
   000142         014500     05 IX-FS2-STATUS     PIC  XX  VALUE  SPACE.                  IX2164.2 IMP
   000143         014600     05 WRK-XN-0002-001   PIC  X(2) VALUE  SPACE.                 IX2164.2 IMP
   000144         014700     05 WRK-XN-0002-002   PIC  X(2) VALUE  SPACE.                 IX2164.2 IMP
   000145         014800     05 WRK-XN-0002-003   PIC  X(2) VALUE  SPACE.                 IX2164.2 IMP
   000146         014900     05 WRK-XN-0002-004   PIC  X(2) VALUE  SPACE.                 IX2164.2 IMP
   000147         015000     05 WRK-XN-0002-005   PIC  X(2) VALUE  SPACE.                 IX2164.2 IMP
   000148         015100     05 WRK-XN-0002-006   PIC  X(2) VALUE  SPACE.                 IX2164.2 IMP
   000149         015200     05 WRK-XN-0002-007   PIC  X(2) VALUE  SPACE.                 IX2164.2 IMP
   000150         015300     05 WRK-XN-0002-008   PIC  X(2) VALUE  SPACE.                 IX2164.2 IMP
   000151         015400     05 WRK-XN-0002-009   PIC  X(2) VALUE  SPACE.                 IX2164.2 IMP
   000152         015500 01  DUMMY-WRK-REC.                                               IX2164.2
   000153         015600     02 DUMMY-WRK1       PIC X(120).                              IX2164.2
   000154         015700     02 DUMMY-WRK2  REDEFINES  DUMMY-WRK1.                        IX2164.2 153
   000155         015800        03 FILLER   PIC X(5).                                     IX2164.2
   000156         015900        03 DUMMY-WRK-INDENT-5  PIC X(115).                        IX2164.2
   000157         016000 01  FILE-RECORD-INFORMATION-REC.                                 IX2164.2
   000158         016100     03 FILE-RECORD-INFO-SKELETON.                                IX2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000159         016200        05 FILLER                 PICTURE X(48)       VALUE       IX2164.2
   000160         016300             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2164.2
   000161         016400        05 FILLER                 PICTURE X(46)       VALUE       IX2164.2
   000162         016500             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2164.2
   000163         016600        05 FILLER                 PICTURE X(26)       VALUE       IX2164.2
   000164         016700             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2164.2
   000165         016800        05 FILLER                 PICTURE X(37)       VALUE       IX2164.2
   000166         016900             ",RECKEY=                             ".             IX2164.2
   000167         017000        05 FILLER                 PICTURE X(38)       VALUE       IX2164.2
   000168         017100             ",ALTKEY1=                             ".            IX2164.2
   000169         017200        05 FILLER                 PICTURE X(38)       VALUE       IX2164.2
   000170         017300             ",ALTKEY2=                             ".            IX2164.2
   000171         017400        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2164.2 IMP
   000172         017500     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2164.2
   000173         017600        05 FILE-RECORD-INFO-P1-120.                               IX2164.2
   000174         017700           07 FILLER              PIC X(5).                       IX2164.2
   000175         017800           07 XFILE-NAME           PIC X(6).                      IX2164.2
   000176         017900           07 FILLER              PIC X(8).                       IX2164.2
   000177         018000           07 XRECORD-NAME         PIC X(6).                      IX2164.2
   000178         018100           07 FILLER              PIC X(1).                       IX2164.2
   000179         018200           07 REELUNIT-NUMBER     PIC 9(1).                       IX2164.2
   000180         018300           07 FILLER              PIC X(7).                       IX2164.2
   000181         018400           07 XRECORD-NUMBER       PIC 9(6).                      IX2164.2
   000182         018500           07 FILLER              PIC X(6).                       IX2164.2
   000183         018600           07 UPDATE-NUMBER       PIC 9(2).                       IX2164.2
   000184         018700           07 FILLER              PIC X(5).                       IX2164.2
   000185         018800           07 ODO-NUMBER          PIC 9(4).                       IX2164.2
   000186         018900           07 FILLER              PIC X(5).                       IX2164.2
   000187         019000           07 XPROGRAM-NAME        PIC X(5).                      IX2164.2
   000188         019100           07 FILLER              PIC X(7).                       IX2164.2
   000189         019200           07 XRECORD-LENGTH       PIC 9(6).                      IX2164.2
   000190         019300           07 FILLER              PIC X(7).                       IX2164.2
   000191         019400           07 CHARS-OR-RECORDS    PIC X(2).                       IX2164.2
   000192         019500           07 FILLER              PIC X(1).                       IX2164.2
   000193         019600           07 XBLOCK-SIZE          PIC 9(4).                      IX2164.2
   000194         019700           07 FILLER              PIC X(6).                       IX2164.2
   000195         019800           07 RECORDS-IN-FILE     PIC 9(6).                       IX2164.2
   000196         019900           07 FILLER              PIC X(5).                       IX2164.2
   000197         020000           07 XFILE-ORGANIZATION   PIC X(2).                      IX2164.2
   000198         020100           07 FILLER              PIC X(6).                       IX2164.2
   000199         020200           07 XLABEL-TYPE          PIC X(1).                      IX2164.2
   000200         020300        05 FILE-RECORD-INFO-P121-240.                             IX2164.2
   000201         020400           07 FILLER              PIC X(8).                       IX2164.2
   000202         020500           07 XRECORD-KEY          PIC X(29).                     IX2164.2
   000203         020600           07 FILLER              PIC X(9).                       IX2164.2
   000204         020700           07 ALTERNATE-KEY1      PIC X(29).                      IX2164.2
   000205         020800           07 FILLER              PIC X(9).                       IX2164.2
   000206         020900           07 ALTERNATE-KEY2      PIC X(29).                      IX2164.2
   000207         021000           07 FILLER              PIC X(7).                       IX2164.2
   000208         021100 01  TEST-RESULTS.                                                IX2164.2
   000209         021200     02 FILLER                   PIC X      VALUE SPACE.          IX2164.2 IMP
   000210         021300     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2164.2 IMP
   000211         021400     02 FILLER                   PIC X      VALUE SPACE.          IX2164.2 IMP
   000212         021500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2164.2 IMP
   000213         021600     02 FILLER                   PIC X      VALUE SPACE.          IX2164.2 IMP
   000214         021700     02  PAR-NAME.                                                IX2164.2
   000215         021800       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2164.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000216         021900       03  PARDOT-X              PIC X      VALUE SPACE.          IX2164.2 IMP
   000217         022000       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2164.2 IMP
   000218         022100     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2164.2 IMP
   000219         022200     02 RE-MARK                  PIC X(61).                       IX2164.2
   000220         022300 01  TEST-COMPUTED.                                               IX2164.2
   000221         022400     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2164.2 IMP
   000222         022500     02 FILLER                   PIC X(17)  VALUE                 IX2164.2
   000223         022600            "       COMPUTED=".                                   IX2164.2
   000224         022700     02 COMPUTED-X.                                               IX2164.2
   000225         022800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2164.2 IMP
   000226         022900     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2164.2 225
   000227         023000                                 PIC -9(9).9(9).                  IX2164.2
   000228         023100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2164.2 225
   000229         023200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2164.2 225
   000230         023300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2164.2 225
   000231         023400     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2164.2 225
   000232         023500         04 COMPUTED-18V0                    PIC -9(18).          IX2164.2
   000233         023600         04 FILLER                           PIC X.               IX2164.2
   000234         023700     03 FILLER PIC X(50) VALUE SPACE.                             IX2164.2 IMP
   000235         023800 01  TEST-CORRECT.                                                IX2164.2
   000236         023900     02 FILLER PIC X(30) VALUE SPACE.                             IX2164.2 IMP
   000237         024000     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2164.2
   000238         024100     02 CORRECT-X.                                                IX2164.2
   000239         024200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2164.2 IMP
   000240         024300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2164.2 239
   000241         024400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2164.2 239
   000242         024500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2164.2 239
   000243         024600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2164.2 239
   000244         024700     03      CR-18V0 REDEFINES CORRECT-A.                         IX2164.2 239
   000245         024800         04 CORRECT-18V0                     PIC -9(18).          IX2164.2
   000246         024900         04 FILLER                           PIC X.               IX2164.2
   000247         025000     03 FILLER PIC X(2) VALUE SPACE.                              IX2164.2 IMP
   000248         025100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2164.2 IMP
   000249         025200 01  CCVS-C-1.                                                    IX2164.2
   000250         025300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2164.2
   000251         025400-    "SS  PARAGRAPH-NAME                                          IX2164.2
   000252         025500-    "       REMARKS".                                            IX2164.2
   000253         025600     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2164.2 IMP
   000254         025700 01  CCVS-C-2.                                                    IX2164.2
   000255         025800     02 FILLER                     PIC X        VALUE SPACE.      IX2164.2 IMP
   000256         025900     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2164.2
   000257         026000     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2164.2 IMP
   000258         026100     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2164.2
   000259         026200     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2164.2 IMP
   000260         026300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2164.2 IMP
   000261         026400 01  REC-CT                        PIC 99       VALUE ZERO.       IX2164.2 IMP
   000262         026500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2164.2 IMP
   000263         026600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2164.2 IMP
   000264         026700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2164.2 IMP
   000265         026800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2164.2 IMP
   000266         026900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2164.2 IMP
   000267         027000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2164.2 IMP
   000268         027100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2164.2 IMP
   000269         027200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2164.2 IMP
   000270         027300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2164.2 IMP
   000271         027400 01  CCVS-H-1.                                                    IX2164.2
   000272         027500     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2164.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000273         027600     02  FILLER                    PIC X(42)    VALUE             IX2164.2
   000274         027700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2164.2
   000275         027800     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2164.2 IMP
   000276         027900 01  CCVS-H-2A.                                                   IX2164.2
   000277         028000   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2164.2 IMP
   000278         028100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2164.2
   000279         028200   02  FILLER                        PIC XXXX   VALUE             IX2164.2
   000280         028300     "4.2 ".                                                      IX2164.2
   000281         028400   02  FILLER                        PIC X(28)  VALUE             IX2164.2
   000282         028500            " COPY - NOT FOR DISTRIBUTION".                       IX2164.2
   000283         028600   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2164.2 IMP
   000284         028700                                                                  IX2164.2
   000285         028800 01  CCVS-H-2B.                                                   IX2164.2
   000286         028900   02  FILLER                        PIC X(15)  VALUE             IX2164.2
   000287         029000            "TEST RESULT OF ".                                    IX2164.2
   000288         029100   02  TEST-ID                       PIC X(9).                    IX2164.2
   000289         029200   02  FILLER                        PIC X(4)   VALUE             IX2164.2
   000290         029300            " IN ".                                               IX2164.2
   000291         029400   02  FILLER                        PIC X(12)  VALUE             IX2164.2
   000292         029500     " HIGH       ".                                              IX2164.2
   000293         029600   02  FILLER                        PIC X(22)  VALUE             IX2164.2
   000294         029700            " LEVEL VALIDATION FOR ".                             IX2164.2
   000295         029800   02  FILLER                        PIC X(58)  VALUE             IX2164.2
   000296         029900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2164.2
   000297         030000 01  CCVS-H-3.                                                    IX2164.2
   000298         030100     02  FILLER                      PIC X(34)  VALUE             IX2164.2
   000299         030200            " FOR OFFICIAL USE ONLY    ".                         IX2164.2
   000300         030300     02  FILLER                      PIC X(58)  VALUE             IX2164.2
   000301         030400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2164.2
   000302         030500     02  FILLER                      PIC X(28)  VALUE             IX2164.2
   000303         030600            "  COPYRIGHT   1985 ".                                IX2164.2
   000304         030700 01  CCVS-E-1.                                                    IX2164.2
   000305         030800     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2164.2 IMP
   000306         030900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2164.2
   000307         031000     02 ID-AGAIN                     PIC X(9).                    IX2164.2
   000308         031100     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2164.2 IMP
   000309         031200 01  CCVS-E-2.                                                    IX2164.2
   000310         031300     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2164.2 IMP
   000311         031400     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2164.2 IMP
   000312         031500     02 CCVS-E-2-2.                                               IX2164.2
   000313         031600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2164.2 IMP
   000314         031700         03 FILLER                   PIC X      VALUE SPACE.      IX2164.2 IMP
   000315         031800         03 ENDER-DESC               PIC X(44)  VALUE             IX2164.2
   000316         031900            "ERRORS ENCOUNTERED".                                 IX2164.2
   000317         032000 01  CCVS-E-3.                                                    IX2164.2
   000318         032100     02  FILLER                      PIC X(22)  VALUE             IX2164.2
   000319         032200            " FOR OFFICIAL USE ONLY".                             IX2164.2
   000320         032300     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2164.2 IMP
   000321         032400     02  FILLER                      PIC X(58)  VALUE             IX2164.2
   000322         032500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2164.2
   000323         032600     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2164.2 IMP
   000324         032700     02 FILLER                       PIC X(15)  VALUE             IX2164.2
   000325         032800             " COPYRIGHT 1985".                                   IX2164.2
   000326         032900 01  CCVS-E-4.                                                    IX2164.2
   000327         033000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2164.2 IMP
   000328         033100     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2164.2
   000329         033200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2164.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000330         033300     02 FILLER                       PIC X(40)  VALUE             IX2164.2
   000331         033400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2164.2
   000332         033500 01  XXINFO.                                                      IX2164.2
   000333         033600     02 FILLER                       PIC X(19)  VALUE             IX2164.2
   000334         033700            "*** INFORMATION ***".                                IX2164.2
   000335         033800     02 INFO-TEXT.                                                IX2164.2
   000336         033900       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2164.2 IMP
   000337         034000       04 XXCOMPUTED                 PIC X(20).                   IX2164.2
   000338         034100       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2164.2 IMP
   000339         034200       04 XXCORRECT                  PIC X(20).                   IX2164.2
   000340         034300     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2164.2
   000341         034400 01  HYPHEN-LINE.                                                 IX2164.2
   000342         034500     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2164.2 IMP
   000343         034600     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2164.2
   000344         034700-    "*****************************************".                 IX2164.2
   000345         034800     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2164.2
   000346         034900-    "******************************".                            IX2164.2
   000347         035000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2164.2
   000348         035100     "IX216A".                                                    IX2164.2
   000349         035200 PROCEDURE DIVISION.                                              IX2164.2
   000350         035300 DECLARATIVES.                                                    IX2164.2
   000351         035400 IX-FS2-01 SECTION.                                               IX2164.2
   000352         035500     USE    AFTER STANDARD ERROR PROCEDURE ON IX-FS2.             IX2164.2 118
   000353         035600 IX-FS2-01-01.                                                    IX2164.2
   000354         035700     ADD      1 TO  WRK-CS-09V00-013.                             IX2164.2 136
   000355         035800     GO TO    IX-FS2-01-03                                        IX2164.2 359
   000356         035900              IX-FS2-01-05                                        IX2164.2 363
   000357         036000              DEPENDING ON  WRK-CS-09V00-012.                     IX2164.2 135
   000358         036100     GO TO    IX-FS2-01-EXIT.                                     IX2164.2 368
   000359         036200 IX-FS2-01-03.                                                    IX2164.2
   000360         036300*ENTRY FROM SEGMENT INX-TEST-001.                                 IX2164.2
   000361         036400*    SHOULD NOT ENTER HERE UNLESS SPACE ALLOCATION TOO SMALL.     IX2164.2
   000362         036500     ADD     1 TO  WRK-CS-09V00-014.                              IX2164.2 137
   000363         036600 IX-FS2-01-05.                                                    IX2164.2
   000364         036700     ADD      1 TO WRK-CS-09V00-017.                              IX2164.2 140
   000365         036800     IF       XRECORD-NUMBER (2) EQUAL TO 500                     IX2164.2 181
   000366      1  036900              MOVE   IX-FS2-STATUS TO WRK-XN-0002-002             IX2164.2 142 144
   000367      1  037000              MOVE  "10" TO WRK-XN-0002-003.                      IX2164.2 145
   000368         037100 IX-FS2-01-EXIT.                                                  IX2164.2
   000369         037200     EXIT.                                                        IX2164.2
   000370         037300 END DECLARATIVES.                                                IX2164.2
   000371         037400 CCVS1 SECTION.                                                   IX2164.2
   000372         037500 OPEN-FILES.                                                      IX2164.2
   000373         037600     OPEN I-O RAW-DATA.                                           IX2164.2 100
   000374         037700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2164.2 347 103
   000375         037800     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2164.2 100 381
   000376         037900     MOVE "ABORTED " TO C-ABORT.                                  IX2164.2 114
   000377         038000     ADD 1 TO C-NO-OF-TESTS.                                      IX2164.2 106
   000378         038100     ACCEPT C-DATE  FROM DATE.                                    IX2164.2 104
   000379         038200     ACCEPT C-TIME  FROM TIME.                                    IX2164.2 105
   000380         038300     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2164.2 102 381
   000381         038400 END-E-1.                                                         IX2164.2
   000382         038500     CLOSE RAW-DATA.                                              IX2164.2 100
   000383         038600     OPEN    OUTPUT PRINT-FILE.                                   IX2164.2 115
   000384         038700     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2164.2 347 288 347 307
   000385         038800     MOVE    SPACE TO TEST-RESULTS.                               IX2164.2 IMP 208
   000386         038900     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2164.2 430 435
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000387         039000     MOVE    ZERO TO REC-SKL-SUB.                                 IX2164.2 IMP 260
   000388         039100     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2164.2 389
   000389         039200 CCVS-INIT-FILE.                                                  IX2164.2
   000390         039300     ADD     1 TO REC-SKL-SUB.                                    IX2164.2 260
   000391         039400     MOVE    FILE-RECORD-INFO-SKELETON                            IX2164.2 158
   000392         039500          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2164.2 172 260
   000393         039600 CCVS-INIT-EXIT.                                                  IX2164.2
   000394         039700     GO TO CCVS1-EXIT.                                            IX2164.2 517
   000395         039800 CLOSE-FILES.                                                     IX2164.2
   000396         039900     OPEN I-O RAW-DATA.                                           IX2164.2 100
   000397         040000     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2164.2 347 103
   000398         040100     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2164.2 100 406
   000399         040200     MOVE "OK.     " TO C-ABORT.                                  IX2164.2 114
   000400         040300     MOVE PASS-COUNTER TO C-OK.                                   IX2164.2 265 107
   000401         040400     MOVE ERROR-HOLD   TO C-ALL.                                  IX2164.2 267 108
   000402         040500     MOVE ERROR-COUNTER TO C-FAIL.                                IX2164.2 263 109
   000403         040600     MOVE DELETE-COUNTER TO C-DELETED.                            IX2164.2 262 110
   000404         040700     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2164.2 264 111
   000405         040800     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2164.2 102 406
   000406         040900 END-E-2.                                                         IX2164.2
   000407         041000     CLOSE RAW-DATA.                                              IX2164.2 100
   000408         041100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2164.2 439 460 115
   000409         041200 TERMINATE-CCVS.                                                  IX2164.2
   000410         041300     EXIT PROGRAM.                                                IX2164.2
   000411         041400 TERMINATE-CALL.                                                  IX2164.2
   000412         041500     STOP     RUN.                                                IX2164.2
   000413         041600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2164.2 212 264
   000414         041700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2164.2 212 265
   000415         041800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2164.2 212 263
   000416         041900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2164.2 212 262
   000417         042000     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2164.2 219
   000418         042100 PRINT-DETAIL.                                                    IX2164.2
   000419         042200     IF REC-CT NOT EQUAL TO ZERO                                  IX2164.2 261 IMP
   000420      1  042300             MOVE "." TO PARDOT-X                                 IX2164.2 216
   000421      1  042400             MOVE REC-CT TO DOTVALUE.                             IX2164.2 261 217
   000422         042500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2164.2 208 116 472
   000423         042600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2164.2 212 472
   000424      1  042700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2164.2 493 507
   000425      1  042800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2164.2 508 516
   000426         042900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2164.2 IMP 212 IMP 224
   000427         043000     MOVE SPACE TO CORRECT-X.                                     IX2164.2 IMP 238
   000428         043100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2164.2 261 IMP IMP 214
   000429         043200     MOVE     SPACE TO RE-MARK.                                   IX2164.2 IMP 219
   000430         043300 HEAD-ROUTINE.                                                    IX2164.2
   000431         043400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2164.2 271 117 472
   000432         043500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2164.2 276 117 472
   000433         043600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2164.2 285 117 472
   000434         043700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2164.2 297 117 472
   000435         043800 COLUMN-NAMES-ROUTINE.                                            IX2164.2
   000436         043900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2164.2 249 117 472
   000437         044000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2164.2 254 117 472
   000438         044100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2164.2 341 117 472
   000439         044200 END-ROUTINE.                                                     IX2164.2
   000440         044300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2164.2 341 117 472
   000441         044400 END-RTN-EXIT.                                                    IX2164.2
   000442         044500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2164.2 304 117 472
   000443         044600 END-ROUTINE-1.                                                   IX2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000444         044700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2164.2 263 267 264
   000445         044800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2164.2 267 262 267
   000446         044900      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2164.2 265 267
   000447         045000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2164.2
   000448         045100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2164.2 265 327
   000449         045200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2164.2 267 329
   000450         045300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2164.2 326 312
   000451         045400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2164.2 309 117 472
   000452         045500  END-ROUTINE-12.                                                 IX2164.2
   000453         045600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2164.2 315
   000454         045700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2164.2 263 IMP
   000455      1  045800         MOVE "NO " TO ERROR-TOTAL                                IX2164.2 313
   000456         045900         ELSE                                                     IX2164.2
   000457      1  046000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2164.2 263 313
   000458         046100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2164.2 309 117
   000459         046200     PERFORM WRITE-LINE.                                          IX2164.2 472
   000460         046300 END-ROUTINE-13.                                                  IX2164.2
   000461         046400     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2164.2 262 IMP
   000462      1  046500         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2164.2 313
   000463      1  046600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2164.2 262 313
   000464         046700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2164.2 315
   000465         046800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2164.2 309 117 472
   000466         046900      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2164.2 264 IMP
   000467      1  047000          MOVE "NO " TO ERROR-TOTAL                               IX2164.2 313
   000468      1  047100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2164.2 264 313
   000469         047200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2164.2 315
   000470         047300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2164.2 309 117 472
   000471         047400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2164.2 317 117 472
   000472         047500 WRITE-LINE.                                                      IX2164.2
   000473         047600     ADD 1 TO RECORD-COUNT.                                       IX2164.2 269
   000474         047700     IF RECORD-COUNT GREATER 42                                   IX2164.2 269
   000475      1  047800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2164.2 117 268
   000476      1  047900         MOVE SPACE TO DUMMY-RECORD                               IX2164.2 IMP 117
   000477      1  048000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2164.2 117
   000478      1  048100         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2164.2 271 117 488
   000479      1  048200         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2164.2 276 117 488
   000480      1  048300         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2164.2 285 117 488
   000481      1  048400         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2164.2 297 117 488
   000482      1  048500         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2164.2 249 117 488
   000483      1  048600         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2164.2 254 117 488
   000484      1  048700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2164.2 341 117 488
   000485      1  048800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2164.2 268 117
   000486      1  048900         MOVE ZERO TO RECORD-COUNT.                               IX2164.2 IMP 269
   000487         049000     PERFORM WRT-LN.                                              IX2164.2 488
   000488         049100 WRT-LN.                                                          IX2164.2
   000489         049200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2164.2 117
   000490         049300     MOVE SPACE TO DUMMY-RECORD.                                  IX2164.2 IMP 117
   000491         049400 BLANK-LINE-PRINT.                                                IX2164.2
   000492         049500     PERFORM WRT-LN.                                              IX2164.2 488
   000493         049600 FAIL-ROUTINE.                                                    IX2164.2
   000494         049700     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2164.2 224 IMP
   000495      1  049800            GO TO   FAIL-ROUTINE-WRITE.                           IX2164.2 502
   000496         049900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2164.2 238 IMP 502
   000497         050000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2164.2 270 340
   000498         050100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2164.2 335
   000499         050200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2164.2 332 117 472
   000500         050300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2164.2 IMP 340
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000501         050400     GO TO  FAIL-ROUTINE-EX.                                      IX2164.2 507
   000502         050500 FAIL-ROUTINE-WRITE.                                              IX2164.2
   000503         050600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2164.2 220 116 472
   000504         050700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2164.2 270 248
   000505         050800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2164.2 235 116 472
   000506         050900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2164.2 IMP 248
   000507         051000 FAIL-ROUTINE-EX. EXIT.                                           IX2164.2
   000508         051100 BAIL-OUT.                                                        IX2164.2
   000509         051200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2164.2 225 IMP 511
   000510         051300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2164.2 239 IMP 516
   000511         051400 BAIL-OUT-WRITE.                                                  IX2164.2
   000512         051500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2164.2 239 339 225 337
   000513         051600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2164.2 270 340
   000514         051700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2164.2 332 117 472
   000515         051800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2164.2 IMP 340
   000516         051900 BAIL-OUT-EX. EXIT.                                               IX2164.2
   000517         052000 CCVS1-EXIT.                                                      IX2164.2
   000518         052100     EXIT.                                                        IX2164.2
   000519         052200 SECT-IX-04-001 SECTION.                                          IX2164.2
   000520         052300 INX-INIT-001.                                                    IX2164.2
   000521         052400     MOVE     "CREATE IX-FS2" TO  FEATURE                         IX2164.2 210
   000522         052500     MOVE     "IX-FS2"        TO  XFILE-NAME (2).                 IX2164.2 175
   000523         052600     MOVE     "R1-F-G"        TO  XRECORD-NAME (2).               IX2164.2 177
   000524         052700     MOVE     CCVS-PGM-ID     TO  XPROGRAM-NAME (2).              IX2164.2 347 187
   000525         052800     MOVE     000240          TO  XRECORD-LENGTH (2).             IX2164.2 189
   000526         052900     MOVE     "RC"            TO  CHARS-OR-RECORDS (2).           IX2164.2 191
   000527         053000     MOVE     0001            TO  XBLOCK-SIZE       (2).          IX2164.2 193
   000528         053100     MOVE     000500          TO  RECORDS-IN-FILE  (2).           IX2164.2 195
   000529         053200     MOVE    "IX"                TO XFILE-ORGANIZATION (2).       IX2164.2 197
   000530         053300     MOVE     "S"             TO  XLABEL-TYPE        (2).         IX2164.2 199
   000531         053400     MOVE     000001          TO  XRECORD-NUMBER     (2).         IX2164.2 181
   000532         053500*INITIALIZE  RECORD WORK AREA NUMBER 2.                           IX2164.2
   000533         053600     MOVE     1         TO  WRK-CS-09V00-012.                     IX2164.2 135
   000534         053700     MOVE     ZERO      TO  WRK-CS-09V00-013 WRK-CS-09V00-014     IX2164.2 IMP 136 137
   000535         053800                            WRK-CS-09V00-015 WRK-CS-09V00-016     IX2164.2 138 139
   000536         053900                            WRK-CS-09V00-017 WRK-CS-09V00-018.    IX2164.2 140 141
   000537         054000 OPEN-INIT-GF-01.                                                 IX2164.2
   000538         054100     MOVE     SPACE     TO  IX-FS2-STATUS.                        IX2164.2 IMP 142
   000539         054200     MOVE    ZERO TO WRK-DU-09V00-001.                            IX2164.2 IMP 132
   000540         054300 OPEN-TEST-GF-01.                                                 IX2164.2
   000541         054400*   FILE IX-FS2   DOES NOT EXIST **********************           IX2164.2
   000542         054500     OPEN    EXTEND     IX-FS2.                                   IX2164.2 118
   000543         054600     IF IX-FS2-STATUS = "05"                                      IX2164.2 142
   000544      1  054700         GO TO OPEN-PASS-GF-01.                                   IX2164.2 551
   000545         054800 OPEN-FAIL-GF-01.                                                 IX2164.2
   000546         054900     PERFORM FAIL.                                                IX2164.2 415
   000547         055000     MOVE IX-FS2-STATUS TO COMPUTED-A.                            IX2164.2 142 225
   000548         055100     MOVE "05" TO CORRECT-A.                                      IX2164.2 239
   000549         055200     MOVE "IX-3; 1.3.4 (1) D; STATUS AFTER OPEN EXTEND" TO RE-MARKIX2164.2 219
   000550         055300     GO TO OPEN-WRITE-GF-01.                                      IX2164.2 553
   000551         055400 OPEN-PASS-GF-01.                                                 IX2164.2
   000552         055500     PERFORM PASS.                                                IX2164.2 414
   000553         055600 OPEN-WRITE-GF-01.                                                IX2164.2
   000554         055700     MOVE "OPEN-TEST-GF-01" TO PAR-NAME.                          IX2164.2 214
   000555         055800     MOVE "OPEN EXTEND: EXP: 05"       TO FEATURE.                IX2164.2 210
   000556         055900     PERFORM PRINT-DETAIL.                                        IX2164.2 418
   000557         056000     MOVE GRP-0101 TO IX-FS2-KEY.                                 IX2164.2 130 127
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000558         056100     MOVE     IX-FS2-STATUS TO WRK-XN-0002-001.                   IX2164.2 142 143
   000559         056200*CAPTURE STATUS KEY AFTER  OPEN STATEMENT IS EXECUTED.            IX2164.2
   000560         056300 WRITE-INIT-GF-01.                                                IX2164.2
   000561         056400     MOVE    "99"  TO IX-FS2-STATUS.                              IX2164.2 142
   000562         056500     MOVE     XRECORD-NUMBER (2) TO WRK-DU-09V00-001.             IX2164.2 181 132
   000563         056600     MOVE     GRP-0101 TO XRECORD-KEY (2).                        IX2164.2 130 202
   000564         056700     MOVE     FILE-RECORD-INFO (2) TO IX-FS2R1-F-G-240.           IX2164.2 172 123
   000565         056800     WRITE   IX-FS2R1-F-G-240.                                    IX2164.2 123
   000566         056900     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX2164.2 142
   000567      1  057000         ADD  1  TO WRK-CS-09V00-016.                             IX2164.2 139
   000568         057100     IF XRECORD-NUMBER (2) EQUAL TO 300                           IX2164.2 181
   000569      1  057200         PERFORM WRITE-TEST-GF-01 THRU WRITE-TEST-GF-01-END.      IX2164.2 574 593
   000570         057300     IF       XRECORD-NUMBER (2) EQUAL TO 500                     IX2164.2 181
   000571      1  057400              GO TO  WRITE-TEST-GF-02.                            IX2164.2 596
   000572         057500     ADD      01 TO  XRECORD-NUMBER (2).                          IX2164.2 181
   000573         057600     GO TO    WRITE-INIT-GF-01.                                   IX2164.2 560
   000574         057700 WRITE-TEST-GF-01.                                                IX2164.2
   000575         057800     CLOSE IX-FS2.                                                IX2164.2 118
   000576         057900     MOVE     SPACE     TO  IX-FS2-STATUS.                        IX2164.2 IMP 142
   000577         058000     OPEN     EXTEND    IX-FS2.                                   IX2164.2 118
   000578         058100 WRITE-TEST-GF-01-02.                                             IX2164.2
   000579         058200     IF IX-FS2-STATUS = "00"                                      IX2164.2 142
   000580      1  058300         GO TO WRITE-TEST-GF-01-02-PASS.                          IX2164.2 587
   000581         058400 WRITE-TEST-GF-01-02-FAIL.                                        IX2164.2
   000582         058500     PERFORM FAIL.                                                IX2164.2 415
   000583         058600     MOVE IX-FS2-STATUS TO COMPUTED-A.                            IX2164.2 142 225
   000584         058700     MOVE "00" TO CORRECT-A.                                      IX2164.2 239
   000585         058800     MOVE "IX-3; 1.3.4 (1) A; STATUS AFTER OPEN EXTEND" TO RE-MARKIX2164.2 219
   000586         058900     GO TO WRITE-TEST-GF-01-02-WRITE.                             IX2164.2 589
   000587         059000 WRITE-TEST-GF-01-02-PASS.                                        IX2164.2
   000588         059100     PERFORM PASS.                                                IX2164.2 414
   000589         059200 WRITE-TEST-GF-01-02-WRITE.                                       IX2164.2
   000590         059300     MOVE "WRITE-TEST-GF-01   " TO PAR-NAME.                      IX2164.2 214
   000591         059400     MOVE "OPEN EXTEND EXISTING" TO FEATURE.                      IX2164.2 210
   000592         059500     PERFORM PRINT-DETAIL.                                        IX2164.2 418
   000593         059600 WRITE-TEST-GF-01-END.                                            IX2164.2
   000594         059700     EXIT.                                                        IX2164.2
   000595         059800                                                                  IX2164.2
   000596         059900 WRITE-TEST-GF-02.                                                IX2164.2
   000597         060000     IF       WRK-CS-09V00-014 NOT EQUAL TO ZERO                  IX2164.2 137 IMP
   000598      1  060100              MOVE "IX-41; EXCEPTIONS/ERRORS" TO RE-MARK          IX2164.2 219
   000599      1  060200              MOVE  ZERO TO CORRECT-18V0                          IX2164.2 IMP 245
   000600      1  060300              MOVE WRK-CS-09V00-014 TO COMPUTED-18V0              IX2164.2 137 232
   000601      1  060400              PERFORM   FAIL                                      IX2164.2 415
   000602         060500              ELSE                                                IX2164.2
   000603      1  060600              PERFORM   PASS.                                     IX2164.2 414
   000604         060700     MOVE "OP EXT: ERROR/EXCEPT" TO FEATURE.                      IX2164.2 210
   000605         060800     MOVE "WRITE-TEST-GF-02" TO PAR-NAME.                         IX2164.2 214
   000606         060900     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000607         061000 WRITE-TEST-GF-03.                                                IX2164.2
   000608         061100     MOVE "OP EXT: INCORR COUNT" TO FEATURE.                      IX2164.2 210
   000609         061200     MOVE "WRITE-TEST-GF-03" TO PAR-NAME.                         IX2164.2 214
   000610         061300     IF       XRECORD-NUMBER (2) NOT EQUAL TO 500                 IX2164.2 181
   000611      1  061400              MOVE "IX-41; INCORRECT COUNT" TO RE-MARK            IX2164.2 219
   000612      1  061500              MOVE  500 TO CORRECT-18V0                           IX2164.2 245
   000613      1  061600             MOVE   XRECORD-NUMBER (2)  TO COMPUTED-18V0          IX2164.2 181 232
   000614      1  061700              PERFORM  FAIL                                       IX2164.2 415
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000615         061800              ELSE                                                IX2164.2
   000616      1  061900              PERFORM PASS.                                       IX2164.2 414
   000617         062000     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000618         062100 WRITE-TEST-GF-04.                                                IX2164.2
   000619         062200     MOVE "OP EXT STATUS EXP:00" TO FEATURE.                      IX2164.2 210
   000620         062300     MOVE "WRITE-TEST-GF-04" TO PAR-NAME.                         IX2164.2 214
   000621         062400*    IF       WRK-XN-0002-001 NOT EQUAL TO  "00"                  IX2164.2
   000622         062500*           MOVE "IX-3; 1.3.4 (1) A; STATUS AFTER OPEN" TO RE-MARKIX2164.2
   000623         062600*             MOVE WRK-XN-0002-001 TO COMPUTED-A                  IX2164.2
   000624         062700*             MOVE "00" TO CORRECT-A                              IX2164.2
   000625         062800*             PERFORM  FAIL                                       IX2164.2
   000626         062900*             ELSE                                                IX2164.2
   000627         063000*             PERFORM  PASS.                                      IX2164.2
   000628         063100     PERFORM DE-LETE.                                             IX2164.2 416
   000629         063200     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000630         063300 WRITE-TEST-GF-05.                                                IX2164.2
   000631         063400     MOVE "WRITE STATUS EXP: 00" TO FEATURE.                      IX2164.2 210
   000632         063500     MOVE "WRITE-TEST-GF-05" TO PAR-NAME.                         IX2164.2 214
   000633         063600     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX2164.2 142
   000634      1  063700           MOVE "IX-3; 1.3.4 (1) A; STATUS AFTER WRITE" TO RE-MARKIX2164.2 219
   000635      1  063800              MOVE IX-FS2-STATUS TO COMPUTED-A                    IX2164.2 142 225
   000636      1  063900              MOVE "00" TO CORRECT-A                              IX2164.2 239
   000637      1  064000              PERFORM   FAIL                                      IX2164.2 415
   000638         064100              ELSE                                                IX2164.2
   000639      1  064200              PERFORM   PASS.                                     IX2164.2 414
   000640         064300     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000641         064400 WRITE-TEST-GF-06.                                                IX2164.2
   000642         064500     MOVE "WRITE STATUS EXP: 00" TO FEATURE.                      IX2164.2 210
   000643         064600     MOVE "WRITE-TEST-GF-06" TO PAR-NAME.                         IX2164.2 214
   000644         064700     IF      WRK-CS-09V00-016    NOT EQUAL TO ZERO                IX2164.2 139 IMP
   000645      1  064800           MOVE "IX-3; 1.3.4 (1) A; STATUS AFTER WRITE" TO RE-MARKIX2164.2 219
   000646      1  064900              MOVE   ZERO TO CORRECT-18V0                         IX2164.2 IMP 245
   000647      1  065000              MOVE    WRK-CS-09V00-016 TO COMPUTED-18V0           IX2164.2 139 232
   000648      1  065100              PERFORM   FAIL                                      IX2164.2 415
   000649         065200              ELSE                                                IX2164.2
   000650      1  065300              PERFORM  PASS.                                      IX2164.2 414
   000651         065400     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000652         065500 WRITE-TEST-GF-07.                                                IX2164.2
   000653         065600     MOVE "CLOSE STATUS EXP: 00" TO FEATURE.                      IX2164.2 210
   000654         065700     MOVE "WRITE-TEST-GF-07" TO PAR-NAME.                         IX2164.2 214
   000655         065800     MOVE   99       TO  IX-FS2-STATUS.                           IX2164.2 142
   000656         065900     CLOSE    IX-FS2.                                             IX2164.2 118
   000657         066000     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX2164.2 142
   000658      1  066100           MOVE "IX-3; 1.3.4 (1) A; STATUS AFTER CLOSE" TO RE-MARKIX2164.2 219
   000659      1  066200              MOVE   IX-FS2-STATUS TO COMPUTED-A                  IX2164.2 142 225
   000660      1  066300              MOVE "00" TO CORRECT-A                              IX2164.2 239
   000661      1  066400              PERFORM FAIL                                        IX2164.2 415
   000662         066500              ELSE                                                IX2164.2
   000663      1  066600              PERFORM PASS.                                       IX2164.2 414
   000664         066700     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000665         066800                                                                  IX2164.2
   000666         066900 RWRT-INIT-GF-01.                                                 IX2164.2
   000667         067000     MOVE     2     TO  WRK-CS-09V00-012.                         IX2164.2 135
   000668         067100     MOVE     ZERO  TO  WRK-CS-09V00-013.                         IX2164.2 IMP 136
   000669         067200     MOVE     ZERO  TO  WRK-CS-09V00-014.                         IX2164.2 IMP 137
   000670         067300     MOVE     ZERO  TO  WRK-CS-09V00-015.                         IX2164.2 IMP 138
   000671         067400     MOVE     ZERO  TO  WRK-CS-09V00-016.                         IX2164.2 IMP 139
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000672         067500     MOVE     ZERO  TO  WRK-CS-09V00-017.                         IX2164.2 IMP 140
   000673         067600     MOVE     ZERO  TO  WRK-CS-09V00-018.                         IX2164.2 IMP 141
   000674         067700     MOVE    SPACE TO IX-FS2-STATUS.                              IX2164.2 IMP 142
   000675         067800     MOVE "RWRT-TEST-GF-01" TO PAR-NAME.                          IX2164.2 214
   000676         067900     OPEN     I-O  IX-FS2.                                        IX2164.2 118
   000677         068000     MOVE     SPACE     TO  WRK-XN-0002-002                       IX2164.2 IMP 144
   000678         068100     MOVE     SPACE     TO  WRK-XN-0002-003                       IX2164.2 IMP 145
   000679         068200     MOVE     SPACE     TO  WRK-XN-0002-004                       IX2164.2 IMP 146
   000680         068300     MOVE      IX-FS2-STATUS TO WRK-XN-0002-001                   IX2164.2 142 143
   000681         068400     MOVE     SPACE TO IX-FS2-STATUS.                             IX2164.2 IMP 142
   000682         068500     MOVE    "UPDATE  IX-FS2"  TO FEATURE.                        IX2164.2 210
   000683         068600*CAPTURE THE CONTENTS OF STATUS KEY AFTER OPEN IS EXECUTED.       IX2164.2
   000684         068700 RWRT-TEST-GF-01.                                                 IX2164.2
   000685         068800     ADD      1 TO WRK-CS-09V00-014.                              IX2164.2 137
   000686         068900     ADD      1 TO WRK-CS-09V00-015.                              IX2164.2 138
   000687         069000     READ  IX-FS2.                                                IX2164.2 118
   000688         069100     IF        IX-FS2-STATUS EQUAL TO "10"                        IX2164.2 142
   000689      1  069200              GO TO  RWRT-TEST-GF-01-1.                           IX2164.2 707
   000690         069300     MOVE     IX-FS2R1-F-G-240 TO FILE-RECORD-INFO (2).           IX2164.2 123 172
   000691         069400     IF       WRK-CS-09V00-015 EQUAL TO 5                         IX2164.2 138
   000692      1  069500              ADD 01 TO UPDATE-NUMBER (2)                         IX2164.2 183
   000693      1  069600     MOVE     FILE-RECORD-INFO (2) TO IX-FS2R1-F-G-240            IX2164.2 172 123
   000694      1  069700             PERFORM  RWRT-010-UPDATE                             IX2164.2 700
   000695      1  069800           MOVE ZERO TO WRK-CS-09V00-015                          IX2164.2 IMP 138
   000696      1  069900              GO TO  RWRT-TEST-GF-01-2.                           IX2164.2 702
   000697         070000     IF       WRK-CS-09V00-014 GREATER 500                        IX2164.2 137
   000698      1  070100              GO TO  RWRT-TEST-GF-01-1.                           IX2164.2 707
   000699         070200     GO TO    RWRT-TEST-GF-01.                                    IX2164.2 684
   000700         070300 RWRT-010-UPDATE.                                                 IX2164.2
   000701         070400     REWRITE   IX-FS2R1-F-G-240.                                  IX2164.2 123
   000702         070500 RWRT-TEST-GF-01-2.                                               IX2164.2
   000703         070600     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX2164.2 142
   000704      1  070700              ADD 1 TO WRK-CS-09V00-016.                          IX2164.2 139
   000705         070800     MOVE    SPACE  TO   IX-FS2-STATUS.                           IX2164.2 IMP 142
   000706         070900     GO TO    RWRT-TEST-GF-01.                                    IX2164.2 684
   000707         071000 RWRT-TEST-GF-01-1.                                               IX2164.2
   000708         071100     MOVE "REWRITE ERR/EXCEPTIO" TO FEATURE.                      IX2164.2 210
   000709         071200     MOVE "RWRT-TEST-GF-01" TO PAR-NAME.                          IX2164.2 214
   000710         071300     IF       WRK-CS-09V00-013 NOT EQUAL TO 1                     IX2164.2 136
   000711      1  071400              MOVE "IX-33; EXCEPTIONS/ERRORS" TO RE-MARK          IX2164.2 219
   000712      1  071500              MOVE WRK-CS-09V00-013 TO COMPUTED-18V0              IX2164.2 136 232
   000713      1  071600              MOVE  1 TO CORRECT-18V0                             IX2164.2 245
   000714      1  071700              PERFORM FAIL                                        IX2164.2 415
   000715         071800              ELSE                                                IX2164.2
   000716      1  071900              PERFORM PASS.                                       IX2164.2 414
   000717         072000     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000718         072100 RWRT-TEST-GF-02.                                                 IX2164.2
   000719         072200     MOVE "REWRITE ERR/EXCEPTIO" TO FEATURE.                      IX2164.2 210
   000720         072300     MOVE "RWRT-TEST-GF-02" TO PAR-NAME.                          IX2164.2 214
   000721         072400     IF       WRK-CS-09V00-014 NOT EQUAL TO 501                   IX2164.2 137
   000722      1  072500              MOVE "IX-33;INCORRECT COUNT" TO RE-MARK             IX2164.2 219
   000723      1  072600              MOVE WRK-CS-09V00-014 TO COMPUTED-18V0              IX2164.2 137 232
   000724      1  072700              MOVE 501 TO CORRECT-18V0                            IX2164.2 245
   000725      1  072800              PERFORM FAIL                                        IX2164.2 415
   000726         072900              ELSE                                                IX2164.2
   000727      1  073000              PERFORM PASS.                                       IX2164.2 414
   000728         073100     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000729         073200 RWRT-TEST-GF-03.                                                 IX2164.2
   000730         073300     MOVE "OPEN STATUS EXP:  00" TO FEATURE.                      IX2164.2 210
   000731         073400     MOVE "RWRT-TEST-GF-03" TO PAR-NAME.                          IX2164.2 214
   000732         073500     IF       WRK-XN-0002-001 NOT EQUAL TO "00"                   IX2164.2 143
   000733      1  073600            MOVE "IX-3; 1.3.4 (1) A; STATUS AFTER OPEN" TO RE-MARKIX2164.2 219
   000734      1  073700              MOVE WRK-XN-0002-001 TO COMPUTED-A                  IX2164.2 143 225
   000735      1  073800              MOVE  "00" TO CORRECT-A                             IX2164.2 239
   000736      1  073900              PERFORM FAIL                                        IX2164.2 415
   000737         074000              ELSE                                                IX2164.2
   000738      1  074100              PERFORM PASS.                                       IX2164.2 414
   000739         074200     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000740         074300 RWRT-TEST-GF-04.                                                 IX2164.2
   000741         074400     MOVE "AT END STATUS EXP:10" TO FEATURE.                      IX2164.2 210
   000742         074500     MOVE "RWRT-TEST-GF-04" TO PAR-NAME.                          IX2164.2 214
   000743         074600     IF        IX-FS2-STATUS NOT EQUAL  TO "10"                   IX2164.2 142
   000744      1  074700            MOVE "IX-4; 1.3.4 (2) A; STATUS AT END    " TO RE-MARKIX2164.2 219
   000745      1  074800              MOVE  IX-FS2-STATUS TO COMPUTED-A                   IX2164.2 142 225
   000746      1  074900              MOVE "10" TO CORRECT-A                              IX2164.2 239
   000747      1  075000              PERFORM FAIL                                        IX2164.2 415
   000748         075100              ELSE                                                IX2164.2
   000749      1  075200              PERFORM PASS.                                       IX2164.2 414
   000750         075300     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000751         075400 RWRT-TEST-GF-05.                                                 IX2164.2
   000752         075500     MOVE "REWRITE ERR/EXCEPTIO" TO FEATURE.                      IX2164.2 210
   000753         075600     MOVE "RWRT-TEST-GF-05" TO PAR-NAME.                          IX2164.2 214
   000754         075700     IF       WRK-XN-0002-002 NOT EQUAL TO "10"                   IX2164.2 144
   000755      1  075800            MOVE "IX-4; 1.3.4 (2) A; STATUS AFTER  END" TO RE-MARKIX2164.2 219
   000756      1  075900              MOVE  "EXCEPTIN/STATUS" TO RE-MARK                  IX2164.2 219
   000757      1  076000              MOVE  WRK-XN-0002-002 TO COMPUTED-A                 IX2164.2 144 225
   000758      1  076100              MOVE  "10" TO CORRECT-A                             IX2164.2 239
   000759      1  076200              PERFORM FAIL                                        IX2164.2 415
   000760         076300              ELSE                                                IX2164.2
   000761      1  076400              PERFORM PASS.                                       IX2164.2 414
   000762         076500     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000763         076600 RWRT-TEST-GF-06.                                                 IX2164.2
   000764         076700     MOVE "REWRITE ERR/EXCEPTIO" TO FEATURE.                      IX2164.2 210
   000765         076800     MOVE "RWRT-TEST-GF-06" TO PAR-NAME.                          IX2164.2 214
   000766         076900     IF       WRK-XN-0002-003 NOT EQUAL TO "10"                   IX2164.2 145
   000767      1  077000            MOVE "IX-4; 1.3.4 (2) A; NO/ EXCEPTION    " TO RE-MARKIX2164.2 219
   000768      1  077100              MOVE WRK-XN-0002-003 TO COMPUTED-A                  IX2164.2 145 225
   000769      1  077200              MOVE "10" TO CORRECT-A                              IX2164.2 239
   000770      1  077300              PERFORM FAIL                                        IX2164.2 415
   000771         077400              ELSE                                                IX2164.2
   000772      1  077500              PERFORM PASS.                                       IX2164.2 414
   000773         077600     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000774         077700 RWRT-TEST-GF-07.                                                 IX2164.2
   000775         077800     MOVE "CLOSE LOCK STAT:  00" TO FEATURE.                      IX2164.2 210
   000776         077900     MOVE "RWRT-TEST-GF-07" TO PAR-NAME.                          IX2164.2 214
   000777         078000     MOVE     SPACE TO IX-FS2-STATUS.                             IX2164.2 IMP 142
   000778         078100     CLOSE    IX-FS2      LOCK.                                   IX2164.2 118
   000779         078200     IF        IX-FS2-STATUS NOT EQUAL TO "00"                    IX2164.2 142
   000780      1  078300           MOVE "IX-3; 1.3.4 (1) A; STATUS AFTER CLOSE" TO RE-MARKIX2164.2 219
   000781      1  078400              MOVE  IX-FS2-STATUS TO  COMPUTED-A                  IX2164.2 142 225
   000782      1  078500              MOVE "00" TO CORRECT-A                              IX2164.2 239
   000783      1  078600              PERFORM FAIL                                        IX2164.2 415
   000784         078700              ELSE                                                IX2164.2
   000785      1  078800              PERFORM PASS.                                       IX2164.2 414
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000786         078900     PERFORM  PRINT-DETAIL.                                       IX2164.2 418
   000787         079000 CCVS-EXIT SECTION.                                               IX2164.2
   000788         079100 CCVS-999999.                                                     IX2164.2
   000789         079200     GO TO CLOSE-FILES.                                           IX2164.2 395
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    18
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      204   ALTERNATE-KEY1
      206   ALTERNATE-KEY2
      270   ANSI-REFERENCE . . . . . . . .  497 504 513
      114   C-ABORT. . . . . . . . . . . .  M376 M399
      108   C-ALL. . . . . . . . . . . . .  M401
      104   C-DATE . . . . . . . . . . . .  M378
      110   C-DELETED. . . . . . . . . . .  M403
      109   C-FAIL . . . . . . . . . . . .  M402
      113   C-INDENT
      111   C-INSPECT. . . . . . . . . . .  M404
      106   C-NO-OF-TESTS. . . . . . . . .  M377
      112   C-NOTE
      107   C-OK . . . . . . . . . . . . .  M400
      105   C-TIME . . . . . . . . . . . .  M379
      249   CCVS-C-1 . . . . . . . . . . .  436 482
      254   CCVS-C-2 . . . . . . . . . . .  437 483
      304   CCVS-E-1 . . . . . . . . . . .  442
      309   CCVS-E-2 . . . . . . . . . . .  451 458 465 470
      312   CCVS-E-2-2 . . . . . . . . . .  M450
      317   CCVS-E-3 . . . . . . . . . . .  471
      326   CCVS-E-4 . . . . . . . . . . .  450
      327   CCVS-E-4-1 . . . . . . . . . .  M448
      329   CCVS-E-4-2 . . . . . . . . . .  M449
      271   CCVS-H-1 . . . . . . . . . . .  431 478
      276   CCVS-H-2A. . . . . . . . . . .  432 479
      285   CCVS-H-2B. . . . . . . . . . .  433 480
      297   CCVS-H-3 . . . . . . . . . . .  434 481
      347   CCVS-PGM-ID. . . . . . . . . .  374 384 384 397 524
      191   CHARS-OR-RECORDS . . . . . . .  M526
      231   CM-18V0
      225   COMPUTED-A . . . . . . . . . .  226 228 229 230 231 509 512 M547 M583 M635 M659 M734 M745 M757 M768 M781
      226   COMPUTED-N
      224   COMPUTED-X . . . . . . . . . .  M426 494
      228   COMPUTED-0V18
      230   COMPUTED-14V4
      232   COMPUTED-18V0. . . . . . . . .  M600 M613 M647 M712 M723
      229   COMPUTED-4V14
      248   COR-ANSI-REFERENCE . . . . . .  M504 M506
      239   CORRECT-A. . . . . . . . . . .  240 241 242 243 244 510 512 M548 M584 M636 M660 M735 M746 M758 M769 M782
      240   CORRECT-N
      238   CORRECT-X. . . . . . . . . . .  M427 496
      241   CORRECT-0V18
      243   CORRECT-14V4
      245   CORRECT-18V0 . . . . . . . . .  M599 M612 M646 M713 M724
      242   CORRECT-4V14
      244   CR-18V0
      262   DELETE-COUNTER . . . . . . . .  403 M416 445 461 463
      217   DOTVALUE . . . . . . . . . . .  M421
      268   DUMMY-HOLD . . . . . . . . . .  M475 485
      117   DUMMY-RECORD . . . . . . . . .  M431 M432 M433 M434 M436 M437 M438 M440 M442 M451 M458 M465 M470 M471 475 M476
                                            477 M478 M479 M480 M481 M482 M483 M484 M485 489 M490 M499 M514
      156   DUMMY-WRK-INDENT-5
      152   DUMMY-WRK-REC
      153   DUMMY-WRK1 . . . . . . . . . .  154
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    19
0 Defined   Cross-reference of data names   References

0     154   DUMMY-WRK2
      315   ENDER-DESC . . . . . . . . . .  M453 M464 M469
      263   ERROR-COUNTER. . . . . . . . .  402 M415 444 454 457
      267   ERROR-HOLD . . . . . . . . . .  401 M444 M445 M445 M446 449
      313   ERROR-TOTAL. . . . . . . . . .  M455 M457 M462 M463 M467 M468
      210   FEATURE. . . . . . . . . . . .  M521 M555 M591 M604 M608 M619 M631 M642 M653 M682 M708 M719 M730 M741 M752 M764
                                            M775
      172   FILE-RECORD-INFO . . . . . . .  M392 564 M690 693
      173   FILE-RECORD-INFO-P1-120
      200   FILE-RECORD-INFO-P121-240
      158   FILE-RECORD-INFO-SKELETON. . .  391
      157   FILE-RECORD-INFORMATION-REC
      134   GRP-0001
      130   GRP-0101 . . . . . . . . . . .  557 563
      341   HYPHEN-LINE. . . . . . . . . .  438 440 484
      307   ID-AGAIN . . . . . . . . . . .  M384
      340   INF-ANSI-REFERENCE . . . . . .  M497 M500 M513 M515
      335   INFO-TEXT. . . . . . . . . . .  M498
      264   INSPECT-COUNTER. . . . . . . .  404 M413 444 466 468
      118   IX-FS2 . . . . . . . . . . . .  90 352 542 575 577 656 676 687 778
      127   IX-FS2-KEY . . . . . . . . . .  96 M557
      124   IX-FS2-REC-120
      125   IX-FS2-REC-120-240
      142   IX-FS2-STATUS. . . . . . . . .  95 366 M538 543 547 558 M561 566 M576 579 583 633 635 M655 657 659 M674 680 M681
                                            688 703 M705 743 745 M777 779 781
      123   IX-FS2R1-F-G-240 . . . . . . .  M564 565 690 M693 701
      185   ODO-NUMBER
      212   P-OR-F . . . . . . . . . . . .  M413 M414 M415 M416 423 M426
      214   PAR-NAME . . . . . . . . . . .  M428 M554 M590 M605 M609 M620 M632 M643 M654 M675 M709 M720 M731 M742 M753 M765
                                            M776
      216   PARDOT-X . . . . . . . . . . .  M420
      265   PASS-COUNTER . . . . . . . . .  400 M414 446 448
      115   PRINT-FILE . . . . . . . . . .  88 383 408
      116   PRINT-REC. . . . . . . . . . .  M422 M503 M505
      100   RAW-DATA . . . . . . . . . . .  83 373 375 382 396 398 407
      103   RAW-DATA-KEY . . . . . . . . .  87 M374 M397
      102   RAW-DATA-SATZ. . . . . . . . .  380 405
      219   RE-MARK. . . . . . . . . . . .  M417 M429 M549 M585 M598 M611 M634 M645 M658 M711 M722 M733 M744 M755 M756 M767
                                            M780
      261   REC-CT . . . . . . . . . . . .  419 421 428
      260   REC-SKL-SUB. . . . . . . . . .  M387 M390 392
      269   RECORD-COUNT . . . . . . . . .  M473 474 M486
      195   RECORDS-IN-FILE. . . . . . . .  M528
      179   REELUNIT-NUMBER
      220   TEST-COMPUTED. . . . . . . . .  503
      235   TEST-CORRECT . . . . . . . . .  505
      288   TEST-ID. . . . . . . . . . . .  M384
      208   TEST-RESULTS . . . . . . . . .  M385 422
      266   TOTAL-ERROR
      183   UPDATE-NUMBER. . . . . . . . .  M692
      135   WRK-CS-09V00-012 . . . . . . .  357 M533 M667
      136   WRK-CS-09V00-013 . . . . . . .  M354 M534 M668 710 712
      137   WRK-CS-09V00-014 . . . . . . .  M362 M534 597 600 M669 M685 697 721 723
      138   WRK-CS-09V00-015 . . . . . . .  M535 M670 M686 691 M695
      139   WRK-CS-09V00-016 . . . . . . .  M535 M567 644 647 M671 M704
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    20
0 Defined   Cross-reference of data names   References

0     140   WRK-CS-09V00-017 . . . . . . .  M364 M536 M672
      141   WRK-CS-09V00-018 . . . . . . .  M536 M673
      132   WRK-DU-09V00-001 . . . . . . .  M539 M562
      143   WRK-XN-0002-001. . . . . . . .  M558 M680 732 734
      144   WRK-XN-0002-002. . . . . . . .  M366 M677 754 757
      145   WRK-XN-0002-003. . . . . . . .  M367 M678 766 768
      146   WRK-XN-0002-004. . . . . . . .  M679
      147   WRK-XN-0002-005
      148   WRK-XN-0002-006
      149   WRK-XN-0002-007
      150   WRK-XN-0002-008
      151   WRK-XN-0002-009
      193   XBLOCK-SIZE. . . . . . . . . .  M527
      175   XFILE-NAME . . . . . . . . . .  M522
      197   XFILE-ORGANIZATION . . . . . .  M529
      199   XLABEL-TYPE. . . . . . . . . .  M530
      187   XPROGRAM-NAME. . . . . . . . .  M524
      202   XRECORD-KEY. . . . . . . . . .  M563
      189   XRECORD-LENGTH . . . . . . . .  M525
      177   XRECORD-NAME . . . . . . . . .  M523
      181   XRECORD-NUMBER . . . . . . . .  365 M531 562 568 570 M572 610 613
      337   XXCOMPUTED . . . . . . . . . .  M512
      339   XXCORRECT. . . . . . . . . . .  M512
      332   XXINFO . . . . . . . . . . . .  499 514
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    21
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

      508   BAIL-OUT . . . . . . . . . . .  P425
      516   BAIL-OUT-EX. . . . . . . . . .  E425 G510
      511   BAIL-OUT-WRITE . . . . . . . .  G509
      491   BLANK-LINE-PRINT
      787   CCVS-EXIT
      393   CCVS-INIT-EXIT
      389   CCVS-INIT-FILE . . . . . . . .  P388
      788   CCVS-999999
      371   CCVS1
      517   CCVS1-EXIT . . . . . . . . . .  G394
      395   CLOSE-FILES. . . . . . . . . .  G789
      435   COLUMN-NAMES-ROUTINE . . . . .  E386
      416   DE-LETE. . . . . . . . . . . .  P628
      381   END-E-1. . . . . . . . . . . .  G375 G380
      406   END-E-2. . . . . . . . . . . .  G398 G405
      439   END-ROUTINE. . . . . . . . . .  P408
      443   END-ROUTINE-1
      452   END-ROUTINE-12
      460   END-ROUTINE-13 . . . . . . . .  E408
      441   END-RTN-EXIT
      415   FAIL . . . . . . . . . . . . .  P546 P582 P601 P614 P637 P648 P661 P714 P725 P736 P747 P759 P770 P783
      493   FAIL-ROUTINE . . . . . . . . .  P424
      507   FAIL-ROUTINE-EX. . . . . . . .  E424 G501
      502   FAIL-ROUTINE-WRITE . . . . . .  G495 G496
      430   HEAD-ROUTINE . . . . . . . . .  P386
      413   INSPT
      520   INX-INIT-001
      351   IX-FS2-01
      368   IX-FS2-01-EXIT . . . . . . . .  G358
      353   IX-FS2-01-01
      359   IX-FS2-01-03 . . . . . . . . .  D355
      363   IX-FS2-01-05 . . . . . . . . .  D356
      545   OPEN-FAIL-GF-01
      372   OPEN-FILES
      537   OPEN-INIT-GF-01
      551   OPEN-PASS-GF-01. . . . . . . .  G544
      540   OPEN-TEST-GF-01
      553   OPEN-WRITE-GF-01 . . . . . . .  G550
      414   PASS . . . . . . . . . . . . .  P552 P588 P603 P616 P639 P650 P663 P716 P727 P738 P749 P761 P772 P785
      418   PRINT-DETAIL . . . . . . . . .  P556 P592 P606 P617 P629 P640 P651 P664 P717 P728 P739 P750 P762 P773 P786
      666   RWRT-INIT-GF-01
      684   RWRT-TEST-GF-01. . . . . . . .  G699 G706
      707   RWRT-TEST-GF-01-1. . . . . . .  G689 G698
      702   RWRT-TEST-GF-01-2. . . . . . .  G696
      718   RWRT-TEST-GF-02
      729   RWRT-TEST-GF-03
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    22
0 Defined   Cross-reference of procedures   References

0     740   RWRT-TEST-GF-04
      751   RWRT-TEST-GF-05
      763   RWRT-TEST-GF-06
      774   RWRT-TEST-GF-07
      700   RWRT-010-UPDATE. . . . . . . .  P694
      519   SECT-IX-04-001
      411   TERMINATE-CALL
      409   TERMINATE-CCVS
      560   WRITE-INIT-GF-01 . . . . . . .  G573
      472   WRITE-LINE . . . . . . . . . .  P422 P423 P431 P432 P433 P434 P436 P437 P438 P440 P442 P451 P459 P465 P470 P471
                                            P499 P503 P505 P514
      574   WRITE-TEST-GF-01 . . . . . . .  P569
      593   WRITE-TEST-GF-01-END . . . . .  E569
      578   WRITE-TEST-GF-01-02
      581   WRITE-TEST-GF-01-02-FAIL
      587   WRITE-TEST-GF-01-02-PASS . . .  G580
      589   WRITE-TEST-GF-01-02-WRITE. . .  G586
      596   WRITE-TEST-GF-02 . . . . . . .  G571
      607   WRITE-TEST-GF-03
      618   WRITE-TEST-GF-04
      630   WRITE-TEST-GF-05
      641   WRITE-TEST-GF-06
      652   WRITE-TEST-GF-07
      488   WRT-LN . . . . . . . . . . . .  P478 P479 P480 P481 P482 P483 P484 P487 P492
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    23
0 Defined   Cross-reference of programs     References

        3   IX216A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX216A    Date 06/04/2022  Time 11:58:24   Page    24
0LineID  Message code  Message text

     92  IGYDS1298-I   Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX045" was treated as comments.

    115  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    118  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

    118  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       4           4
-* Statistics for COBOL program IX216A:
 *    Source records = 789
 *    Data Division statements = 125
 *    Procedure Division statements = 384
 *    Generated COBOL statements = 0
 *    Program complexity factor = 395
0End of compilation 1,  program IX216A,  highest severity 0.
0Return code 0
