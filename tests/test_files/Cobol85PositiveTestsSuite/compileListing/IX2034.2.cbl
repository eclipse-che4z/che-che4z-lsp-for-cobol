1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:59   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:59   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2034.2
   000002         000200 PROGRAM-ID.                                                      IX2034.2
   000003         000300     IX203A.                                                      IX2034.2
   000004         000500*                                                              *  IX2034.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2034.2
   000006         000700*                                                              *  IX2034.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2034.2
   000008         000900*                                                              *  IX2034.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2034.2
   000010         001100*                                                              *  IX2034.2
   000011         001300*    THIS PROGRAM IS THE THIRD OF A SERIES.  ITS FUNCTION         IX2034.2
   000012         001400*    IS TO PROCESS THE FILE SEQUENTIALLY USING THE ACCESS MODE IS IX2034.2
   000013         001500*    DYNAMIC CLAUSE.  THE FILE USED IS THAT RESULTING FROM IX202. IX2034.2
   000014         001600*                                                                 IX2034.2
   000015         001700*    FIRST, THE FILE IS VERIFIED FOR ACCURACY OF ITS 500 RECORDS. IX2034.2
   000016         001800*    SECONDLY, RECORDS OF THE FILE ARE SELECTIVELY DELETED AND    IX2034.2
   000017         001900*    THIRDLY THE ACCURACY OF EACH RECORD IN THE FILE IS AGAIN     IX2034.2
   000018         002000*    VERIFIED.                                                    IX2034.2
   000019         002100*                                                                 IX2034.2
   000020         002200*                                                                 IX2034.2
   000021         002300*                                                                 IX2034.2
   000022         002400*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX2034.2
   000023         002500*                                                                 IX2034.2
   000024         002600*             X-24   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2034.2
   000025         002700*                    CLAUSE FOR DATA FILE IX-FS1                  IX2034.2
   000026         002800*             X-44   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2034.2
   000027         002900*                    CLAUSE FOR INDEX FILE IX-FS1                 IX2034.2
   000028         003000*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX2034.2
   000029         003100*             X-62   FOR RAW-DATA                                 IX2034.2
   000030         003200*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX2034.2
   000031         003300*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX2034.2
   000032         003400*                                                                 IX2034.2
   000033         003500*         NOTE:  X-CARDS 44 AND 62       ARE OPTIONAL             IX2034.2
   000034         003600*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX2034.2
   000035         003700*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX2034.2
   000036         003800*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX2034.2
   000037         003900*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX2034.2
   000038         004000*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX2034.2
   000039         004100*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX2034.2
   000040         004200*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX2034.2
   000041         004300*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX2034.2
   000042         004400*               THEY ARE AS FOLLOWS                               IX2034.2
   000043         004500*                                                                 IX2034.2
   000044         004600*                  P  SELECTS X-CARDS 62                          IX2034.2
   000045         004700*                  J  SELECTS X-CARD 44                           IX2034.2
   000046         004800*                                                                 IX2034.2
   000047         004900 ENVIRONMENT DIVISION.                                            IX2034.2
   000048         005000 CONFIGURATION SECTION.                                           IX2034.2
   000049         005100 SOURCE-COMPUTER.                                                 IX2034.2
   000050         005200     XXXXX082.                                                    IX2034.2
   000051         005300 OBJECT-COMPUTER.                                                 IX2034.2
   000052         005400     XXXXX083.                                                    IX2034.2
   000053         005500 INPUT-OUTPUT SECTION.                                            IX2034.2
   000054         005600 FILE-CONTROL.                                                    IX2034.2
   000055         005700     SELECT RAW-DATA   ASSIGN TO                                  IX2034.2 71
   000056         005800     XXXXX062                                                     IX2034.2
   000057         005900            ORGANIZATION IS INDEXED                               IX2034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000            ACCESS MODE IS RANDOM                                 IX2034.2
   000059         006100            RECORD KEY IS RAW-DATA-KEY.                           IX2034.2 74
   000060         006200     SELECT PRINT-FILE ASSIGN TO                                  IX2034.2 86
   000061         006300     XXXXX055.                                                    IX2034.2
   000062         006400     SELECT   IX-FD1 ASSIGN TO                                    IX2034.2 89
   000063         006500     XXXXD024                                                     IX2034.2
   000064         006600     XXXXD044                                                     IX2034.2

 ==000064==> IGYDS1298-I Assignment-name "XXXXD044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXD044" was treated as comments.

   000065         006700        ACCESS MODE IS DYNAMIC                                    IX2034.2
   000066         006800        ORGANIZATION IS INDEXED                                   IX2034.2
   000067         006900        RECORD    IX-FD1-KEY.                                     IX2034.2 98
   000068         007000 DATA DIVISION.                                                   IX2034.2
   000069         007100 FILE SECTION.                                                    IX2034.2
   000070         007200                                                                  IX2034.2
   000071         007300 FD  RAW-DATA.                                                    IX2034.2
   000072         007400                                                                  IX2034.2
   000073         007500 01  RAW-DATA-SATZ.                                               IX2034.2
   000074         007600     05  RAW-DATA-KEY        PIC X(6).                            IX2034.2
   000075         007700     05  C-DATE              PIC 9(6).                            IX2034.2
   000076         007800     05  C-TIME              PIC 9(8).                            IX2034.2
   000077         007900     05  C-NO-OF-TESTS       PIC 99.                              IX2034.2
   000078         008000     05  C-OK                PIC 999.                             IX2034.2
   000079         008100     05  C-ALL               PIC 999.                             IX2034.2
   000080         008200     05  C-FAIL              PIC 999.                             IX2034.2
   000081         008300     05  C-DELETED           PIC 999.                             IX2034.2
   000082         008400     05  C-INSPECT           PIC 999.                             IX2034.2
   000083         008500     05  C-NOTE              PIC X(13).                           IX2034.2
   000084         008600     05  C-INDENT            PIC X.                               IX2034.2
   000085         008700     05  C-ABORT             PIC X(8).                            IX2034.2
   000086         008800 FD  PRINT-FILE.                                                  IX2034.2

 ==000086==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000087         008900 01  PRINT-REC PICTURE X(120).                                    IX2034.2
   000088         009000 01  DUMMY-RECORD PICTURE X(120).                                 IX2034.2
   000089         009100 FD  IX-FD1                                                       IX2034.2

 ==000089==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000089==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000090         009200     LABEL RECORD STANDARD                                        IX2034.2
   000091         009300     DATA RECORDS ARE  IX-FD1R1-F-G-240                           IX2034.2 *
   000092         009400     BLOCK CONTAINS 01 RECORDS                                    IX2034.2
   000093         009500     RECORD CONTAINS  240.                                        IX2034.2
   000094         009600 01  IX-FD1R1-F-G-240.                                            IX2034.2
   000095         009700     05 IX-FD1-REC-120   PIC  X(120).                             IX2034.2
   000096         009800     05 IX-FD1-REC-120-240.                                       IX2034.2
   000097         009900        10 FILLER   PIC X(8).                                     IX2034.2
   000098         010000        10 IX-FD1-KEY   PIC X(29).                                IX2034.2
   000099         010100        10 FILLER        PIC X(83).                               IX2034.2
   000100         010200 WORKING-STORAGE SECTION.                                         IX2034.2
   000101         010300 01  WRK-CS-09V00-006 PIC S9(09) USAGE COMP VALUE ZERO.           IX2034.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000102         010400 01  WRK-CS-09V00-007 PIC S9(09) USAGE COMP VALUE ZERO.           IX2034.2 IMP
   000103         010500 01  WRK-CS-09V00-008 PIC S9(09) USAGE COMP VALUE ZERO.           IX2034.2 IMP
   000104         010600 01  WRK-CS-09V00-009 PIC S9(09) USAGE COMP VALUE ZERO.           IX2034.2 IMP
   000105         010700 01  WRK-CS-09V00-010 PIC S9(09) USAGE COMP VALUE ZERO.           IX2034.2 IMP
   000106         010800 01  WRK-CS-09V00-011 PIC S9(09) USAGE COMP VALUE ZERO.           IX2034.2 IMP
   000107         010900 01  I-O-ERROR-IX-FD1 PIC X(3) VALUE "NO ".                       IX2034.2
   000108         011000 01  IX-WRK-KEY.                                                  IX2034.2
   000109         011100     03 FILLER         PIC X(10).                                 IX2034.2
   000110         011200     03 WRK-DU-09V00-001  PIC 9(9).                               IX2034.2
   000111         011300     03 FILLER         PIC X(10).                                 IX2034.2
   000112         011400 01  DUMMY-WRK-REC.                                               IX2034.2
   000113         011500     02 DUMMY-WRK1       PIC X(120).                              IX2034.2
   000114         011600     02 DUMMY-WRK2  REDEFINES  DUMMY-WRK1.                        IX2034.2 113
   000115         011700        03 FILLER   PIC X(5).                                     IX2034.2
   000116         011800        03 DUMMY-WRK-INDENT-5  PIC X(115).                        IX2034.2
   000117         011900 01  FILE-RECORD-INFORMATION-REC.                                 IX2034.2
   000118         012000     03 FILE-RECORD-INFO-SKELETON.                                IX2034.2
   000119         012100        05 FILLER                 PICTURE X(48)       VALUE       IX2034.2
   000120         012200             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2034.2
   000121         012300        05 FILLER                 PICTURE X(46)       VALUE       IX2034.2
   000122         012400             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2034.2
   000123         012500        05 FILLER                 PICTURE X(26)       VALUE       IX2034.2
   000124         012600             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2034.2
   000125         012700        05 FILLER                 PICTURE X(37)       VALUE       IX2034.2
   000126         012800             ",RECKEY=                             ".             IX2034.2
   000127         012900        05 FILLER                 PICTURE X(38)       VALUE       IX2034.2
   000128         013000             ",ALTKEY1=                             ".            IX2034.2
   000129         013100        05 FILLER                 PICTURE X(38)       VALUE       IX2034.2
   000130         013200             ",ALTKEY2=                             ".            IX2034.2
   000131         013300        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2034.2 IMP
   000132         013400     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2034.2
   000133         013500        05 FILE-RECORD-INFO-P1-120.                               IX2034.2
   000134         013600           07 FILLER              PIC X(5).                       IX2034.2
   000135         013700           07 XFILE-NAME           PIC X(6).                      IX2034.2
   000136         013800           07 FILLER              PIC X(8).                       IX2034.2
   000137         013900           07 XRECORD-NAME         PIC X(6).                      IX2034.2
   000138         014000           07 FILLER              PIC X(1).                       IX2034.2
   000139         014100           07 REELUNIT-NUMBER     PIC 9(1).                       IX2034.2
   000140         014200           07 FILLER              PIC X(7).                       IX2034.2
   000141         014300           07 XRECORD-NUMBER       PIC 9(6).                      IX2034.2
   000142         014400           07 FILLER              PIC X(6).                       IX2034.2
   000143         014500           07 UPDATE-NUMBER       PIC 9(2).                       IX2034.2
   000144         014600           07 FILLER              PIC X(5).                       IX2034.2
   000145         014700           07 ODO-NUMBER          PIC 9(4).                       IX2034.2
   000146         014800           07 FILLER              PIC X(5).                       IX2034.2
   000147         014900           07 XPROGRAM-NAME        PIC X(5).                      IX2034.2
   000148         015000           07 FILLER              PIC X(7).                       IX2034.2
   000149         015100           07 XRECORD-LENGTH       PIC 9(6).                      IX2034.2
   000150         015200           07 FILLER              PIC X(7).                       IX2034.2
   000151         015300           07 CHARS-OR-RECORDS    PIC X(2).                       IX2034.2
   000152         015400           07 FILLER              PIC X(1).                       IX2034.2
   000153         015500           07 XBLOCK-SIZE          PIC 9(4).                      IX2034.2
   000154         015600           07 FILLER              PIC X(6).                       IX2034.2
   000155         015700           07 RECORDS-IN-FILE     PIC 9(6).                       IX2034.2
   000156         015800           07 FILLER              PIC X(5).                       IX2034.2
   000157         015900           07 XFILE-ORGANIZATION   PIC X(2).                      IX2034.2
   000158         016000           07 FILLER              PIC X(6).                       IX2034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000159         016100           07 XLABEL-TYPE          PIC X(1).                      IX2034.2
   000160         016200        05 FILE-RECORD-INFO-P121-240.                             IX2034.2
   000161         016300           07 FILLER              PIC X(8).                       IX2034.2
   000162         016400           07 XRECORD-KEY          PIC X(29).                     IX2034.2
   000163         016500           07 FILLER              PIC X(9).                       IX2034.2
   000164         016600           07 ALTERNATE-KEY1      PIC X(29).                      IX2034.2
   000165         016700           07 FILLER              PIC X(9).                       IX2034.2
   000166         016800           07 ALTERNATE-KEY2      PIC X(29).                      IX2034.2
   000167         016900           07 FILLER              PIC X(7).                       IX2034.2
   000168         017000 01  TEST-RESULTS.                                                IX2034.2
   000169         017100     02 FILLER                   PIC X      VALUE SPACE.          IX2034.2 IMP
   000170         017200     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2034.2 IMP
   000171         017300     02 FILLER                   PIC X      VALUE SPACE.          IX2034.2 IMP
   000172         017400     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2034.2 IMP
   000173         017500     02 FILLER                   PIC X      VALUE SPACE.          IX2034.2 IMP
   000174         017600     02  PAR-NAME.                                                IX2034.2
   000175         017700       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2034.2 IMP
   000176         017800       03  PARDOT-X              PIC X      VALUE SPACE.          IX2034.2 IMP
   000177         017900       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2034.2 IMP
   000178         018000     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2034.2 IMP
   000179         018100     02 RE-MARK                  PIC X(61).                       IX2034.2
   000180         018200 01  TEST-COMPUTED.                                               IX2034.2
   000181         018300     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2034.2 IMP
   000182         018400     02 FILLER                   PIC X(17)  VALUE                 IX2034.2
   000183         018500            "       COMPUTED=".                                   IX2034.2
   000184         018600     02 COMPUTED-X.                                               IX2034.2
   000185         018700     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2034.2 IMP
   000186         018800     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2034.2 185
   000187         018900                                 PIC -9(9).9(9).                  IX2034.2
   000188         019000     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2034.2 185
   000189         019100     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2034.2 185
   000190         019200     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2034.2 185
   000191         019300     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2034.2 185
   000192         019400         04 COMPUTED-18V0                    PIC -9(18).          IX2034.2
   000193         019500         04 FILLER                           PIC X.               IX2034.2
   000194         019600     03 FILLER PIC X(50) VALUE SPACE.                             IX2034.2 IMP
   000195         019700 01  TEST-CORRECT.                                                IX2034.2
   000196         019800     02 FILLER PIC X(30) VALUE SPACE.                             IX2034.2 IMP
   000197         019900     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2034.2
   000198         020000     02 CORRECT-X.                                                IX2034.2
   000199         020100     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2034.2 IMP
   000200         020200     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2034.2 199
   000201         020300     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2034.2 199
   000202         020400     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2034.2 199
   000203         020500     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2034.2 199
   000204         020600     03      CR-18V0 REDEFINES CORRECT-A.                         IX2034.2 199
   000205         020700         04 CORRECT-18V0                     PIC -9(18).          IX2034.2
   000206         020800         04 FILLER                           PIC X.               IX2034.2
   000207         020900     03 FILLER PIC X(2) VALUE SPACE.                              IX2034.2 IMP
   000208         021000     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2034.2 IMP
   000209         021100 01  CCVS-C-1.                                                    IX2034.2
   000210         021200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2034.2
   000211         021300-    "SS  PARAGRAPH-NAME                                          IX2034.2
   000212         021400-    "       REMARKS".                                            IX2034.2
   000213         021500     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2034.2 IMP
   000214         021600 01  CCVS-C-2.                                                    IX2034.2
   000215         021700     02 FILLER                     PIC X        VALUE SPACE.      IX2034.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000216         021800     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2034.2
   000217         021900     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2034.2 IMP
   000218         022000     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2034.2
   000219         022100     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2034.2 IMP
   000220         022200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2034.2 IMP
   000221         022300 01  REC-CT                        PIC 99       VALUE ZERO.       IX2034.2 IMP
   000222         022400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2034.2 IMP
   000223         022500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2034.2 IMP
   000224         022600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2034.2 IMP
   000225         022700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2034.2 IMP
   000226         022800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2034.2 IMP
   000227         022900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2034.2 IMP
   000228         023000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2034.2 IMP
   000229         023100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2034.2 IMP
   000230         023200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2034.2 IMP
   000231         023300 01  CCVS-H-1.                                                    IX2034.2
   000232         023400     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2034.2 IMP
   000233         023500     02  FILLER                    PIC X(42)    VALUE             IX2034.2
   000234         023600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2034.2
   000235         023700     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2034.2 IMP
   000236         023800 01  CCVS-H-2A.                                                   IX2034.2
   000237         023900   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2034.2 IMP
   000238         024000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2034.2
   000239         024100   02  FILLER                        PIC XXXX   VALUE             IX2034.2
   000240         024200     "4.2 ".                                                      IX2034.2
   000241         024300   02  FILLER                        PIC X(28)  VALUE             IX2034.2
   000242         024400            " COPY - NOT FOR DISTRIBUTION".                       IX2034.2
   000243         024500   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2034.2 IMP
   000244         024600                                                                  IX2034.2
   000245         024700 01  CCVS-H-2B.                                                   IX2034.2
   000246         024800   02  FILLER                        PIC X(15)  VALUE             IX2034.2
   000247         024900            "TEST RESULT OF ".                                    IX2034.2
   000248         025000   02  TEST-ID                       PIC X(9).                    IX2034.2
   000249         025100   02  FILLER                        PIC X(4)   VALUE             IX2034.2
   000250         025200            " IN ".                                               IX2034.2
   000251         025300   02  FILLER                        PIC X(12)  VALUE             IX2034.2
   000252         025400     " HIGH       ".                                              IX2034.2
   000253         025500   02  FILLER                        PIC X(22)  VALUE             IX2034.2
   000254         025600            " LEVEL VALIDATION FOR ".                             IX2034.2
   000255         025700   02  FILLER                        PIC X(58)  VALUE             IX2034.2
   000256         025800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2034.2
   000257         025900 01  CCVS-H-3.                                                    IX2034.2
   000258         026000     02  FILLER                      PIC X(34)  VALUE             IX2034.2
   000259         026100            " FOR OFFICIAL USE ONLY    ".                         IX2034.2
   000260         026200     02  FILLER                      PIC X(58)  VALUE             IX2034.2
   000261         026300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2034.2
   000262         026400     02  FILLER                      PIC X(28)  VALUE             IX2034.2
   000263         026500            "  COPYRIGHT   1985 ".                                IX2034.2
   000264         026600 01  CCVS-E-1.                                                    IX2034.2
   000265         026700     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2034.2 IMP
   000266         026800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2034.2
   000267         026900     02 ID-AGAIN                     PIC X(9).                    IX2034.2
   000268         027000     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2034.2 IMP
   000269         027100 01  CCVS-E-2.                                                    IX2034.2
   000270         027200     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2034.2 IMP
   000271         027300     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2034.2 IMP
   000272         027400     02 CCVS-E-2-2.                                               IX2034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000273         027500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2034.2 IMP
   000274         027600         03 FILLER                   PIC X      VALUE SPACE.      IX2034.2 IMP
   000275         027700         03 ENDER-DESC               PIC X(44)  VALUE             IX2034.2
   000276         027800            "ERRORS ENCOUNTERED".                                 IX2034.2
   000277         027900 01  CCVS-E-3.                                                    IX2034.2
   000278         028000     02  FILLER                      PIC X(22)  VALUE             IX2034.2
   000279         028100            " FOR OFFICIAL USE ONLY".                             IX2034.2
   000280         028200     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2034.2 IMP
   000281         028300     02  FILLER                      PIC X(58)  VALUE             IX2034.2
   000282         028400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2034.2
   000283         028500     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2034.2 IMP
   000284         028600     02 FILLER                       PIC X(15)  VALUE             IX2034.2
   000285         028700             " COPYRIGHT 1985".                                   IX2034.2
   000286         028800 01  CCVS-E-4.                                                    IX2034.2
   000287         028900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2034.2 IMP
   000288         029000     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2034.2
   000289         029100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2034.2 IMP
   000290         029200     02 FILLER                       PIC X(40)  VALUE             IX2034.2
   000291         029300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2034.2
   000292         029400 01  XXINFO.                                                      IX2034.2
   000293         029500     02 FILLER                       PIC X(19)  VALUE             IX2034.2
   000294         029600            "*** INFORMATION ***".                                IX2034.2
   000295         029700     02 INFO-TEXT.                                                IX2034.2
   000296         029800       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2034.2 IMP
   000297         029900       04 XXCOMPUTED                 PIC X(20).                   IX2034.2
   000298         030000       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2034.2 IMP
   000299         030100       04 XXCORRECT                  PIC X(20).                   IX2034.2
   000300         030200     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2034.2
   000301         030300 01  HYPHEN-LINE.                                                 IX2034.2
   000302         030400     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2034.2 IMP
   000303         030500     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2034.2
   000304         030600-    "*****************************************".                 IX2034.2
   000305         030700     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2034.2
   000306         030800-    "******************************".                            IX2034.2
   000307         030900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2034.2
   000308         031000     "IX203A".                                                    IX2034.2
   000309         031100 PROCEDURE DIVISION.                                              IX2034.2
   000310         031200 CCVS1 SECTION.                                                   IX2034.2
   000311         031300 OPEN-FILES.                                                      IX2034.2
   000312         031400     OPEN I-O RAW-DATA.                                           IX2034.2 71
   000313         031500     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2034.2 307 74
   000314         031600     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2034.2 71 320
   000315         031700     MOVE "ABORTED " TO C-ABORT.                                  IX2034.2 85
   000316         031800     ADD 1 TO C-NO-OF-TESTS.                                      IX2034.2 77
   000317         031900     ACCEPT C-DATE  FROM DATE.                                    IX2034.2 75
   000318         032000     ACCEPT C-TIME  FROM TIME.                                    IX2034.2 76
   000319         032100     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2034.2 73 320
   000320         032200 END-E-1.                                                         IX2034.2
   000321         032300     CLOSE RAW-DATA.                                              IX2034.2 71
   000322         032400     OPEN    OUTPUT PRINT-FILE.                                   IX2034.2 86
   000323         032500     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2034.2 307 248 307 267
   000324         032600     MOVE    SPACE TO TEST-RESULTS.                               IX2034.2 IMP 168
   000325         032700     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2034.2 369 374
   000326         032800     MOVE    ZERO TO REC-SKL-SUB.                                 IX2034.2 IMP 220
   000327         032900     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2034.2 328
   000328         033000 CCVS-INIT-FILE.                                                  IX2034.2
   000329         033100     ADD     1 TO REC-SKL-SUB.                                    IX2034.2 220
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000330         033200     MOVE    FILE-RECORD-INFO-SKELETON                            IX2034.2 118
   000331         033300          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2034.2 132 220
   000332         033400 CCVS-INIT-EXIT.                                                  IX2034.2
   000333         033500     GO TO CCVS1-EXIT.                                            IX2034.2 456
   000334         033600 CLOSE-FILES.                                                     IX2034.2
   000335         033700     OPEN I-O RAW-DATA.                                           IX2034.2 71
   000336         033800     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2034.2 307 74
   000337         033900     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2034.2 71 345
   000338         034000     MOVE "OK.     " TO C-ABORT.                                  IX2034.2 85
   000339         034100     MOVE PASS-COUNTER TO C-OK.                                   IX2034.2 225 78
   000340         034200     MOVE ERROR-HOLD   TO C-ALL.                                  IX2034.2 227 79
   000341         034300     MOVE ERROR-COUNTER TO C-FAIL.                                IX2034.2 223 80
   000342         034400     MOVE DELETE-COUNTER TO C-DELETED.                            IX2034.2 222 81
   000343         034500     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2034.2 224 82
   000344         034600     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2034.2 73 345
   000345         034700 END-E-2.                                                         IX2034.2
   000346         034800     CLOSE RAW-DATA.                                              IX2034.2 71
   000347         034900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2034.2 378 399 86
   000348         035000 TERMINATE-CCVS.                                                  IX2034.2
   000349         035100     EXIT PROGRAM.                                                IX2034.2
   000350         035200 TERMINATE-CALL.                                                  IX2034.2
   000351         035300     STOP     RUN.                                                IX2034.2
   000352         035400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2034.2 172 224
   000353         035500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2034.2 172 225
   000354         035600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2034.2 172 223
   000355         035700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2034.2 172 222
   000356         035800     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2034.2 179
   000357         035900 PRINT-DETAIL.                                                    IX2034.2
   000358         036000     IF REC-CT NOT EQUAL TO ZERO                                  IX2034.2 221 IMP
   000359      1  036100             MOVE "." TO PARDOT-X                                 IX2034.2 176
   000360      1  036200             MOVE REC-CT TO DOTVALUE.                             IX2034.2 221 177
   000361         036300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2034.2 168 87 411
   000362         036400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2034.2 172 411
   000363      1  036500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2034.2 432 446
   000364      1  036600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2034.2 447 455
   000365         036700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2034.2 IMP 172 IMP 184
   000366         036800     MOVE SPACE TO CORRECT-X.                                     IX2034.2 IMP 198
   000367         036900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2034.2 221 IMP IMP 174
   000368         037000     MOVE     SPACE TO RE-MARK.                                   IX2034.2 IMP 179
   000369         037100 HEAD-ROUTINE.                                                    IX2034.2
   000370         037200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2034.2 231 88 411
   000371         037300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2034.2 236 88 411
   000372         037400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2034.2 245 88 411
   000373         037500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2034.2 257 88 411
   000374         037600 COLUMN-NAMES-ROUTINE.                                            IX2034.2
   000375         037700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2034.2 209 88 411
   000376         037800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2034.2 214 88 411
   000377         037900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2034.2 301 88 411
   000378         038000 END-ROUTINE.                                                     IX2034.2
   000379         038100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2034.2 301 88 411
   000380         038200 END-RTN-EXIT.                                                    IX2034.2
   000381         038300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2034.2 264 88 411
   000382         038400 END-ROUTINE-1.                                                   IX2034.2
   000383         038500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2034.2 223 227 224
   000384         038600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2034.2 227 222 227
   000385         038700      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2034.2 225 227
   000386         038800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000387         038900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2034.2 225 287
   000388         039000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2034.2 227 289
   000389         039100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2034.2 286 272
   000390         039200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2034.2 269 88 411
   000391         039300  END-ROUTINE-12.                                                 IX2034.2
   000392         039400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2034.2 275
   000393         039500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2034.2 223 IMP
   000394      1  039600         MOVE "NO " TO ERROR-TOTAL                                IX2034.2 273
   000395         039700         ELSE                                                     IX2034.2
   000396      1  039800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2034.2 223 273
   000397         039900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2034.2 269 88
   000398         040000     PERFORM WRITE-LINE.                                          IX2034.2 411
   000399         040100 END-ROUTINE-13.                                                  IX2034.2
   000400         040200     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2034.2 222 IMP
   000401      1  040300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2034.2 273
   000402      1  040400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2034.2 222 273
   000403         040500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2034.2 275
   000404         040600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2034.2 269 88 411
   000405         040700      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2034.2 224 IMP
   000406      1  040800          MOVE "NO " TO ERROR-TOTAL                               IX2034.2 273
   000407      1  040900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2034.2 224 273
   000408         041000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2034.2 275
   000409         041100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2034.2 269 88 411
   000410         041200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2034.2 277 88 411
   000411         041300 WRITE-LINE.                                                      IX2034.2
   000412         041400     ADD 1 TO RECORD-COUNT.                                       IX2034.2 229
   000413         041500     IF RECORD-COUNT GREATER 42                                   IX2034.2 229
   000414      1  041600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2034.2 88 228
   000415      1  041700         MOVE SPACE TO DUMMY-RECORD                               IX2034.2 IMP 88
   000416      1  041800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2034.2 88
   000417      1  041900         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2034.2 231 88 427
   000418      1  042000         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2034.2 236 88 427
   000419      1  042100         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2034.2 245 88 427
   000420      1  042200         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2034.2 257 88 427
   000421      1  042300         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2034.2 209 88 427
   000422      1  042400         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2034.2 214 88 427
   000423      1  042500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2034.2 301 88 427
   000424      1  042600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2034.2 228 88
   000425      1  042700         MOVE ZERO TO RECORD-COUNT.                               IX2034.2 IMP 229
   000426         042800     PERFORM WRT-LN.                                              IX2034.2 427
   000427         042900 WRT-LN.                                                          IX2034.2
   000428         043000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2034.2 88
   000429         043100     MOVE SPACE TO DUMMY-RECORD.                                  IX2034.2 IMP 88
   000430         043200 BLANK-LINE-PRINT.                                                IX2034.2
   000431         043300     PERFORM WRT-LN.                                              IX2034.2 427
   000432         043400 FAIL-ROUTINE.                                                    IX2034.2
   000433         043500     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2034.2 184 IMP
   000434      1  043600            GO TO   FAIL-ROUTINE-WRITE.                           IX2034.2 441
   000435         043700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2034.2 198 IMP 441
   000436         043800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2034.2 230 300
   000437         043900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2034.2 295
   000438         044000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2034.2 292 88 411
   000439         044100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2034.2 IMP 300
   000440         044200     GO TO  FAIL-ROUTINE-EX.                                      IX2034.2 446
   000441         044300 FAIL-ROUTINE-WRITE.                                              IX2034.2
   000442         044400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2034.2 180 87 411
   000443         044500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2034.2 230 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000444         044600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2034.2 195 87 411
   000445         044700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2034.2 IMP 208
   000446         044800 FAIL-ROUTINE-EX. EXIT.                                           IX2034.2
   000447         044900 BAIL-OUT.                                                        IX2034.2
   000448         045000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2034.2 185 IMP 450
   000449         045100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2034.2 199 IMP 455
   000450         045200 BAIL-OUT-WRITE.                                                  IX2034.2
   000451         045300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2034.2 199 299 185 297
   000452         045400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2034.2 230 300
   000453         045500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2034.2 292 88 411
   000454         045600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2034.2 IMP 300
   000455         045700 BAIL-OUT-EX. EXIT.                                               IX2034.2
   000456         045800 CCVS1-EXIT.                                                      IX2034.2
   000457         045900     EXIT.                                                        IX2034.2
   000458         046000 SECT-IX-03-001 SECTION.                                          IX2034.2
   000459         046100 READ-INIT-F1-01.                                                 IX2034.2
   000460         046200*    THIS FILE "IX-FD1" IS ACCESSED SEQUENTIALLY AND HAS          IX2034.2
   000461         046300*    ASSOCIATED WITH IT A RECORD KEY WHICH AT ALL TIMES SHOULD    IX2034.2
   000462         046400*    CONTAIN THE INDEX OF THE RECORD PREVIOUSLY READ.             IX2034.2
   000463         046500     OPEN INPUT IX-FD1.                                           IX2034.2 89
   000464         046600     MOVE     ZERO TO             WRK-CS-09V00-006.               IX2034.2 IMP 101
   000465         046700     MOVE     ZERO TO             WRK-CS-09V00-007.               IX2034.2 IMP 102
   000466         046800     MOVE     ZERO TO             WRK-CS-09V00-008.               IX2034.2 IMP 103
   000467         046900     MOVE     ZERO TO             WRK-CS-09V00-009.               IX2034.2 IMP 104
   000468         047000     MOVE     ZERO TO             WRK-CS-09V00-010.               IX2034.2 IMP 105
   000469         047100     MOVE     ZERO TO             WRK-CS-09V00-011.               IX2034.2 IMP 106
   000470         047200     MOVE     SPACE TO  FILE-RECORD-INFO (1).                     IX2034.2 IMP 132
   000471         047300     MOVE    ZERO TO WRK-DU-09V00-001.                            IX2034.2 IMP 110
   000472         047400     MOVE    IX-FD1-KEY TO COMPUTED-A.                            IX2034.2 98 185
   000473         047500     MOVE    SPACE TO P-OR-F.                                     IX2034.2 IMP 172
   000474         047600     MOVE    "INFORMATION" TO CORRECT-A.                          IX2034.2 199
   000475         047700     MOVE    "KEY AFTER OPEN" TO RE-MARK.                         IX2034.2 179
   000476         047800     MOVE    "RECORD KEY ON OPEN"  TO FEATURE.                    IX2034.2 170
   000477         047900     MOVE     "READ-INIT-F1-01" TO PAR-NAME.                      IX2034.2 174
   000478         048000     PERFORM PRINT-DETAIL.                                        IX2034.2 357
   000479         048100*                                                                 IX2034.2
   000480         048200*                                                                 IX2034.2
   000481         048300*                                                                 IX2034.2
   000482         048400 READ-INIT-F1-01-0.                                               IX2034.2
   000483         048500     MOVE    "READ-TEST-F1-01" TO PAR-NAME.                       IX2034.2 174
   000484         048600     MOVE    "READ  NEXT RECORD"  TO FEATURE.                     IX2034.2 170
   000485         048700 READ-TEST-F1-01-R.                                               IX2034.2
   000486         048800     ADD      1 TO WRK-CS-09V00-006.                              IX2034.2 101
   000487         048900     READ     IX-FD1  NEXT RECORD                                 IX2034.2 89
   000488      1  049000              AT END GO TO READ-TEST-F1-01.                       IX2034.2 504
   000489         049100     MOVE     IX-FD1R1-F-G-240    TO FILE-RECORD-INFO (1).        IX2034.2 94 132
   000490         049200     IF       UPDATE-NUMBER (1) EQUAL TO 00                       IX2034.2 143
   000491      1  049300             ADD 1 TO WRK-CS-09V00-007                            IX2034.2 102
   000492      1  049400              GO TO READ-TEST-F1-01-2.                            IX2034.2 497
   000493         049500     IF       UPDATE-NUMBER (1) EQUAL TO 01                       IX2034.2 143
   000494      1  049600              ADD 1 TO WRK-CS-09V00-008                           IX2034.2 103
   000495      1  049700              GO TO READ-TEST-F1-01-2.                            IX2034.2 497
   000496         049800     ADD      1 TO WRK-CS-09V00-009.                              IX2034.2 104
   000497         049900 READ-TEST-F1-01-2.                                               IX2034.2
   000498         050000     MOVE    XRECORD-KEY (1)  TO  IX-WRK-KEY.                     IX2034.2 162 108
   000499         050100     IF      WRK-DU-09V00-001  NOT EQUAL TO XRECORD-NUMBER (1)    IX2034.2 110 141
   000500      1  050200              ADD 1 TO  WRK-CS-09V00-010.                         IX2034.2 105
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000501         050300     IF       WRK-CS-09V00-006  GREATER 501                       IX2034.2 101
   000502      1  050400              GO TO READ-TEST-F1-01.                              IX2034.2 504
   000503         050500     GO TO    READ-TEST-F1-01-R.                                  IX2034.2 485
   000504         050600 READ-TEST-F1-01.                                                 IX2034.2
   000505         050700     IF       WRK-CS-09V00-006 NOT EQUAL TO 501                   IX2034.2 101
   000506      1  050800              MOVE "INCORRECT RECORD COUNT"  TO RE-MARK           IX2034.2 179
   000507      1  050900              MOVE  WRK-CS-09V00-006 TO COMPUTED-18V0             IX2034.2 101 192
   000508      1  051000              MOVE  500  TO             CORRECT-18V0              IX2034.2 205
   000509      1  051100              MOVE "IX-28; 4.5.2 FORMAT 1    " TO RE-MARK         IX2034.2 179
   000510      1  051200              PERFORM FAIL                                        IX2034.2 354
   000511         051300              ELSE                                                IX2034.2
   000512      1  051400              PERFORM PASS.                                       IX2034.2 353
   000513         051500     PERFORM  PRINT-DETAIL.                                       IX2034.2 357
   000514         051600*                                                                 IX2034.2
   000515         051700*                                                                 IX2034.2
   000516         051800*                                                                 IX2034.2
   000517         051900 READ-TEST-F1-02.                                                 IX2034.2
   000518         052000     MOVE    "READ-TEST-F1-02" TO PAR-NAME.                       IX2034.2 174
   000519         052100     MOVE    "READ  NEXT RECORD"  TO FEATURE.                     IX2034.2 170
   000520         052200     IF       WRK-CS-09V00-007 EQUAL TO 400                       IX2034.2 102
   000521      1  052300              PERFORM PASS                                        IX2034.2 353
   000522         052400              ELSE                                                IX2034.2
   000523      1  052500              MOVE "NON-UPDATED RECORDS" TO COMPUTED-A            IX2034.2 185
   000524      1  052600              MOVE  WRK-CS-09V00-007 TO CORRECT-18V0              IX2034.2 102 205
   000525      1  052700              MOVE "SHOULD BE 400; IX-28; 4.5.2 FORMAT 1    "     IX2034.2
   000526      1  052800                                   TO RE-MARK                     IX2034.2 179
   000527      1  052900              PERFORM FAIL.                                       IX2034.2 354
   000528         053000     PERFORM  PRINT-DETAIL.                                       IX2034.2 357
   000529         053100*                                                                 IX2034.2
   000530         053200*                                                                 IX2034.2
   000531         053300*                                                                 IX2034.2
   000532         053400 READ-TEST-F1-03.                                                 IX2034.2
   000533         053500     MOVE    "READ-TEST-F1-03" TO PAR-NAME.                       IX2034.2 174
   000534         053600     MOVE    "READ  NEXT RECORD"  TO FEATURE.                     IX2034.2 170
   000535         053700     IF      WRK-CS-09V00-008 EQUAL TO 100                        IX2034.2 103
   000536      1  053800              PERFORM PASS                                        IX2034.2 353
   000537         053900              ELSE                                                IX2034.2
   000538      1  054000             MOVE WRK-CS-09V00-008 TO COMPUTED-18V0               IX2034.2 103 192
   000539      1  054100             MOVE 100             TO  CORRECT-18V0                IX2034.2 205
   000540      1  054200              MOVE "IX-28; 4.5.2 FORMAT 1    " TO RE-MARK         IX2034.2 179
   000541      1  054300              PERFORM FAIL.                                       IX2034.2 354
   000542         054400     PERFORM  PRINT-DETAIL.                                       IX2034.2 357
   000543         054500*                                                                 IX2034.2
   000544         054600 READ-TEST-F1-04.                                                 IX2034.2
   000545         054700     MOVE    "READ-TEST-F1-04" TO PAR-NAME.                       IX2034.2 174
   000546         054800     MOVE    "READ  NEXT RECORD"  TO FEATURE.                     IX2034.2 170
   000547         054900     IF      WRK-CS-09V00-009 EQUAL TO ZERO                       IX2034.2 104 IMP
   000548      1  055000             PERFORM PASS                                         IX2034.2 353
   000549         055100             ELSE                                                 IX2034.2
   000550      1  055200             MOVE WRK-CS-09V00-009 TO COMPUTED-18V0               IX2034.2 104 192
   000551      1  055300             MOVE  ZERO            TO CORRECT-18V0                IX2034.2 IMP 205
   000552      1  055400             MOVE "BAD UPDATES; IX-28; 4.5.2 FORMAT 1    "        IX2034.2
   000553      1  055500                                TO RE-MARK                        IX2034.2 179
   000554      1  055600             PERFORM FAIL.                                        IX2034.2 354
   000555         055700     PERFORM PRINT-DETAIL.                                        IX2034.2 357
   000556         055800*                                                                 IX2034.2
   000557         055900 READ-TEST-F1-05.                                                 IX2034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000558         056000     MOVE    "READ-TEST-F1-05" TO PAR-NAME.                       IX2034.2 174
   000559         056100     MOVE    "READ  NEXT RECORD"  TO FEATURE.                     IX2034.2 170
   000560         056200     IF      WRK-CS-09V00-010 EQUAL TO ZERO                       IX2034.2 105 IMP
   000561      1  056300             PERFORM PASS                                         IX2034.2 353
   000562         056400             ELSE                                                 IX2034.2
   000563      1  056500             MOVE WRK-CS-09V00-010 TO COMPUTED-18V0               IX2034.2 105 192
   000564      1  056600             MOVE ZERO             TO CORRECT-18V0                IX2034.2 IMP 205
   000565      1  056700             MOVE "IX-28; 4.5.2 FORMAT 1; KEY VS RECORD"          IX2034.2
   000566      1  056800                                  TO RE-MARK                      IX2034.2 179
   000567      1  056900             PERFORM FAIL.                                        IX2034.2 354
   000568         057000     PERFORM PRINT-DETAIL.                                        IX2034.2 357
   000569         057100     CLOSE    IX-FD1.                                             IX2034.2 89
   000570         057200*                                                                 IX2034.2
   000571         057300*     R E A D     NEXT RECORD                                     IX2034.2
   000572         057400*                                                                 IX2034.2
   000573         057500 DELETE-INIT-GF-01.                                               IX2034.2
   000574         057600     OPEN     I-O IX-FD1.                                         IX2034.2 89
   000575         057700     MOVE     ZERO TO WRK-CS-09V00-006                            IX2034.2 IMP 101
   000576         057800     MOVE     ZERO TO WRK-CS-09V00-007                            IX2034.2 IMP 102
   000577         057900     MOVE     ZERO TO WRK-CS-09V00-008                            IX2034.2 IMP 103
   000578         058000     MOVE     ZERO TO WRK-CS-09V00-009                            IX2034.2 IMP 104
   000579         058100     MOVE     ZERO TO WRK-CS-09V00-010                            IX2034.2 IMP 105
   000580         058200     MOVE     ZERO TO WRK-CS-09V00-011                            IX2034.2 IMP 106
   000581         058300                                                                  IX2034.2
   000582         058400     MOVE     SPACE TO  FILE-RECORD-INFO (1).                     IX2034.2 IMP 132
   000583         058500     MOVE    "DELETE   "   TO FEATURE.                            IX2034.2 170
   000584         058600     MOVE     "DELETE-TEST-GF-01" TO PAR-NAME.                    IX2034.2 174
   000585         058700 DELETE-TEST-GF-01-R.                                             IX2034.2
   000586         058800     ADD      1 TO WRK-CS-09V00-006                               IX2034.2 101
   000587         058900     ADD      1 TO WRK-CS-09V00-007.                              IX2034.2 102
   000588         059000     READ     IX-FD1  NEXT RECORD                                 IX2034.2 89
   000589         059100              AT END                                              IX2034.2
   000590      1  059200              MOVE "AT END PATH TAKEN " TO RE-MARK                IX2034.2 179
   000591      1  059300              GO TO  DELETE-TEST-GF-01.                           IX2034.2 610
   000592         059400     MOVE     IX-FD1R1-F-G-240 TO FILE-RECORD-INFO (1).           IX2034.2 94 132
   000593         059500     IF       WRK-CS-09V00-007  EQUAL TO 4                        IX2034.2 102
   000594      1  059600              GO TO DELETE-TEST-GF-01-2.                          IX2034.2 599
   000595         059700     IF       WRK-CS-09V00-006 GREATER 501                        IX2034.2 101
   000596      1  059800              MOVE  "AT END NOT TAKEN"  TO RE-MARK                IX2034.2 179
   000597      1  059900              GO TO DELETE-TEST-GF-01.                            IX2034.2 610
   000598         060000     GO TO    DELETE-TEST-GF-01-R.                                IX2034.2 585
   000599         060100 DELETE-TEST-GF-01-2.                                             IX2034.2
   000600         060200     MOVE     CCVS-PGM-ID TO  XPROGRAM-NAME (1).                  IX2034.2 307 147
   000601         060300     MOVE     99 TO UPDATE-NUMBER (1).                            IX2034.2 143
   000602         060400     MOVE     FILE-RECORD-INFO (1) TO IX-FD1R1-F-G-240.           IX2034.2 132 94
   000603         060500     DELETE IX-FD1 INVALID KEY                                    IX2034.2 89
   000604      1  060600                    ADD 1 TO WRK-CS-09V00-009                     IX2034.2 104
   000605      1  060700                    MOVE ZERO TO WRK-CS-09V00-007                 IX2034.2 IMP 102
   000606      1  060800                    GO TO DELETE-TEST-GF-01-R.                    IX2034.2 585
   000607         060900     MOVE     ZERO TO  WRK-CS-09V00-007.                          IX2034.2 IMP 102
   000608         061000     ADD      1 TO  WRK-CS-09V00-008                              IX2034.2 103
   000609         061100     GO TO    DELETE-TEST-GF-01-R.                                IX2034.2 585
   000610         061200 DELETE-TEST-GF-01.                                               IX2034.2
   000611         061300     IF       WRK-CS-09V00-006 NOT EQUAL TO 501                   IX2034.2 101
   000612      1  061400              MOVE WRK-CS-09V00-006 TO COMPUTED-18V0              IX2034.2 101 192
   000613      1  061500              MOVE              501 TO CORRECT-18V0               IX2034.2 205
   000614      1  061600              MOVE "IX-21; 4.3.2             " TO RE-MARK         IX2034.2 179
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000615      1  061700              PERFORM FAIL                                        IX2034.2 354
   000616         061800              ELSE                                                IX2034.2
   000617      1  061900              PERFORM PASS.                                       IX2034.2 353
   000618         062000     PERFORM  PRINT-DETAIL.                                       IX2034.2 357
   000619         062100*                                                                 IX2034.2
   000620         062200*                                                                 IX2034.2
   000621         062300*                                                                 IX2034.2
   000622         062400 DELETE-TEST-GF-02.                                               IX2034.2
   000623         062500     MOVE    "DELETE   "   TO FEATURE.                            IX2034.2 170
   000624         062600     MOVE     "DELETE-TEST-GF-02" TO PAR-NAME                     IX2034.2 174
   000625         062700     IF       WRK-CS-09V00-008 NOT EQUAL TO 125                   IX2034.2 103
   000626      1  062800              MOVE WRK-CS-09V00-008 TO COMPUTED-18V0              IX2034.2 103 192
   000627      1  062900              MOVE 125              TO CORRECT-18V0               IX2034.2 205
   000628      1  063000              MOVE "DELETED RECORDS; IX-21; 4.3.2    " TO RE-MARK IX2034.2 179
   000629      1  063100              PERFORM FAIL                                        IX2034.2 354
   000630         063200              ELSE                                                IX2034.2
   000631      1  063300              PERFORM PASS.                                       IX2034.2 353
   000632         063400     PERFORM  PRINT-DETAIL.                                       IX2034.2 357
   000633         063500*                                                                 IX2034.2
   000634         063600*                                                                 IX2034.2
   000635         063700*                                                                 IX2034.2
   000636         063800 DELETE-TEST-GF-03.                                               IX2034.2
   000637         063900     MOVE    "DELETE   "   TO FEATURE.                            IX2034.2 170
   000638         064000     MOVE     "DELETE-TEST-GF-03" TO PAR-NAME.                    IX2034.2 174
   000639         064100     IF WRK-CS-09V00-009 EQUAL TO ZERO                            IX2034.2 104 IMP
   000640      1  064200         PERFORM PASS                                             IX2034.2 353
   000641         064300         ELSE                                                     IX2034.2
   000642      1  064400         PERFORM FAIL                                             IX2034.2 354
   000643      1  064500         MOVE WRK-CS-09V00-009 TO COMPUTED-18V0                   IX2034.2 104 192
   000644      1  064600         MOVE ZERO TO CORRECT-18V0                                IX2034.2 IMP 205
   000645      1  064700         MOVE "INVALID KEY; IX-21; 4.3.2           " TO RE-MARK.  IX2034.2 179
   000646         064800     PERFORM PRINT-DETAIL.                                        IX2034.2 357
   000647         064900     CLOSE    IX-FD1.                                             IX2034.2 89
   000648         065000*                                                                 IX2034.2
   000649         065100*                                                                 IX2034.2
   000650         065200*                                                                 IX2034.2
   000651         065300 DELETE-INIT-GF-04.                                               IX2034.2
   000652         065400     MOVE     "DELETE-TEST-GF-04" TO PAR-NAME.                    IX2034.2 174
   000653         065500     MOVE     ZERO TO   WRK-CS-09V00-006                          IX2034.2 IMP 101
   000654         065600     MOVE     ZERO TO   WRK-CS-09V00-007                          IX2034.2 IMP 102
   000655         065700     MOVE     ZERO TO   WRK-CS-09V00-008                          IX2034.2 IMP 103
   000656         065800     MOVE     ZERO TO   WRK-CS-09V00-009                          IX2034.2 IMP 104
   000657         065900     MOVE     ZERO TO   WRK-CS-09V00-010                          IX2034.2 IMP 105
   000658         066000     MOVE     ZERO TO   WRK-CS-09V00-011                          IX2034.2 IMP 106
   000659         066100     MOVE     SPACE  TO  FILE-RECORD-INFO (1).                    IX2034.2 IMP 132
   000660         066200     MOVE    ZERO TO WRK-DU-09V00-001.                            IX2034.2 IMP 110
   000661         066300     OPEN     INPUT  IX-FD1.                                      IX2034.2 89
   000662         066400 DELETE-TEST-GF-04-R.                                             IX2034.2
   000663         066500     ADD      1 TO WRK-CS-09V00-006.                              IX2034.2 101
   000664         066600     ADD      1 TO WRK-CS-09V00-007.                              IX2034.2 102
   000665         066700     ADD      1 TO WRK-CS-09V00-008.                              IX2034.2 103
   000666         066800     READ   IX-FD1 NEXT RECORD  AT END  GO TO DELETE-TEST-GF-04.  IX2034.2 89 682
   000667         066900     MOVE     IX-FD1R1-F-G-240 TO FILE-RECORD-INFO (1).           IX2034.2 94 132
   000668         067000     IF       UPDATE-NUMBER (1) EQUAL TO 99                       IX2034.2 143
   000669      1  067100              ADD  1 TO WRK-CS-09V00-009.                         IX2034.2 104
   000670         067200     IF       WRK-CS-09V00-007  EQUAL TO 4                        IX2034.2 102
   000671      1  067300              MOVE 01 TO WRK-CS-09V00-007                         IX2034.2 102
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000672      1  067400              ADD 1 TO WRK-CS-09V00-008.                          IX2034.2 103
   000673         067500     MOVE     XRECORD-KEY (1)  TO  IX-WRK-KEY.                    IX2034.2 162 108
   000674         067600     MOVE     WRK-CS-09V00-008  TO WRK-DU-09V00-001.              IX2034.2 103 110
   000675         067700     IF       IX-WRK-KEY  EQUAL TO IX-FD1-KEY                     IX2034.2 108 98
   000676      1  067800              ADD 1 TO  WRK-CS-09V00-010.                         IX2034.2 105
   000677         067900     IF       XRECORD-NUMBER (1) EQUAL TO  WRK-CS-09V00-008       IX2034.2 141 103
   000678      1  068000              ADD 1 TO  WRK-CS-09V00-011.                         IX2034.2 106
   000679         068100     IF       WRK-CS-09V00-006 GREATER  501                       IX2034.2 101
   000680      1  068200              GO TO DELETE-TEST-GF-04.                            IX2034.2 682
   000681         068300     GO TO    DELETE-TEST-GF-04-R.                                IX2034.2 662
   000682         068400 DELETE-TEST-GF-04.                                               IX2034.2
   000683         068500     IF       WRK-CS-09V00-006 NOT EQUAL TO 376                   IX2034.2 101
   000684      1  068600              MOVE "IX-21; 4.3.2; INCORRECT RECORD COUNT"         IX2034.2
   000685      1  068700                                             TO RE-MARK           IX2034.2 179
   000686      1  068800              MOVE WRK-CS-09V00-006 TO COMPUTED-18V0              IX2034.2 101 192
   000687      1  068900              MOVE 376 TO CORRECT-18V0                            IX2034.2 205
   000688      1  069000              PERFORM  FAIL                                       IX2034.2 354
   000689         069100              ELSE                                                IX2034.2
   000690      1  069200              PERFORM  PASS.                                      IX2034.2 353
   000691         069300     PERFORM  PRINT-DETAIL.                                       IX2034.2 357
   000692         069400*                                                                 IX2034.2
   000693         069500 DELETE-TEST-GF-05.                                               IX2034.2
   000694         069600     MOVE    "DELETE   "   TO FEATURE.                            IX2034.2 170
   000695         069700     MOVE     "DELETE-TEST-GF-05" TO PAR-NAME                     IX2034.2 174
   000696         069800     IF       WRK-CS-09V00-009 NOT EQUAL TO ZERO                  IX2034.2 104 IMP
   000697      1  069900              MOVE    ZERO TO CORRECT-18V0                        IX2034.2 IMP 205
   000698      1  070000              MOVE WRK-CS-09V00-009 TO COMPUTED-18V0              IX2034.2 104 192
   000699      1  070100              MOVE "IX-21; 4.3.2; DELETED RECORDDS" TO RE-MARK    IX2034.2 179
   000700      1  070200              PERFORM FAIL                                        IX2034.2 354
   000701         070300              ELSE                                                IX2034.2
   000702      1  070400              PERFORM PASS.                                       IX2034.2 353
   000703         070500     PERFORM  PRINT-DETAIL.                                       IX2034.2 357
   000704         070600*                                                                 IX2034.2
   000705         070700 DELETE-TEST-GF-06.                                               IX2034.2
   000706         070800     MOVE    "DELETE   "   TO FEATURE.                            IX2034.2 170
   000707         070900     MOVE     "DELETE-TEST-GF-06" TO PAR-NAME                     IX2034.2 174
   000708         071000     IF       WRK-CS-09V00-010 NOT EQUAL TO 375                   IX2034.2 105
   000709      1  071100              MOVE    375  TO CORRECT-18V0                        IX2034.2 205
   000710      1  071200              MOVE "IX-21; 4.3.2; KEY MISMATCH" TO RE-MARK        IX2034.2 179
   000711      1  071300              MOVE WRK-CS-09V00-010 TO COMPUTED-18V0              IX2034.2 105 192
   000712      1  071400              PERFORM FAIL                                        IX2034.2 354
   000713         071500              ELSE                                                IX2034.2
   000714      1  071600              PERFORM PASS.                                       IX2034.2 353
   000715         071700     PERFORM  PRINT-DETAIL.                                       IX2034.2 357
   000716         071800*                                                                 IX2034.2
   000717         071900 DELETE-TEST-GF-07.                                               IX2034.2
   000718         072000     MOVE    "DELETE   "   TO FEATURE.                            IX2034.2 170
   000719         072100     MOVE     "DELETE-TEST-GF-07" TO PAR-NAME                     IX2034.2 174
   000720         072200     IF      WRK-CS-09V00-011  NOT EQUAL TO  375                  IX2034.2 106
   000721      1  072300             MOVE   375  TO CORRECT-18V0                          IX2034.2 205
   000722      1  072400             MOVE   "INCORRECT RECORD FOUND; IX-21, 4.3.2"        IX2034.2
   000723      1  072500                   TO RE-MARK                                     IX2034.2 179
   000724      1  072600             MOVE   WRK-CS-09V00-011  TO COMPUTED-18V0            IX2034.2 106 192
   000725      1  072700             PERFORM   FAIL                                       IX2034.2 354
   000726         072800             ELSE                                                 IX2034.2
   000727      1  072900             PERFORM   PASS.                                      IX2034.2 353
   000728         073000     PERFORM   PRINT-DETAIL.                                      IX2034.2 357
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000729         073100     CLOSE    IX-FD1.                                             IX2034.2 89
   000730         073200                                                                  IX2034.2
   000731         073300                                                                  IX2034.2
   000732         073400 CCVS-999999.                                                     IX2034.2
   000733         073500     GO TO CLOSE-FILES.                                           IX2034.2 334
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      164   ALTERNATE-KEY1
      166   ALTERNATE-KEY2
      230   ANSI-REFERENCE . . . . . . . .  436 443 452
       85   C-ABORT. . . . . . . . . . . .  M315 M338
       79   C-ALL. . . . . . . . . . . . .  M340
       75   C-DATE . . . . . . . . . . . .  M317
       81   C-DELETED. . . . . . . . . . .  M342
       80   C-FAIL . . . . . . . . . . . .  M341
       84   C-INDENT
       82   C-INSPECT. . . . . . . . . . .  M343
       77   C-NO-OF-TESTS. . . . . . . . .  M316
       83   C-NOTE
       78   C-OK . . . . . . . . . . . . .  M339
       76   C-TIME . . . . . . . . . . . .  M318
      209   CCVS-C-1 . . . . . . . . . . .  375 421
      214   CCVS-C-2 . . . . . . . . . . .  376 422
      264   CCVS-E-1 . . . . . . . . . . .  381
      269   CCVS-E-2 . . . . . . . . . . .  390 397 404 409
      272   CCVS-E-2-2 . . . . . . . . . .  M389
      277   CCVS-E-3 . . . . . . . . . . .  410
      286   CCVS-E-4 . . . . . . . . . . .  389
      287   CCVS-E-4-1 . . . . . . . . . .  M387
      289   CCVS-E-4-2 . . . . . . . . . .  M388
      231   CCVS-H-1 . . . . . . . . . . .  370 417
      236   CCVS-H-2A. . . . . . . . . . .  371 418
      245   CCVS-H-2B. . . . . . . . . . .  372 419
      257   CCVS-H-3 . . . . . . . . . . .  373 420
      307   CCVS-PGM-ID. . . . . . . . . .  313 323 323 336 600
      151   CHARS-OR-RECORDS
      191   CM-18V0
      185   COMPUTED-A . . . . . . . . . .  186 188 189 190 191 448 451 M472 M523
      186   COMPUTED-N
      184   COMPUTED-X . . . . . . . . . .  M365 433
      188   COMPUTED-0V18
      190   COMPUTED-14V4
      192   COMPUTED-18V0. . . . . . . . .  M507 M538 M550 M563 M612 M626 M643 M686 M698 M711 M724
      189   COMPUTED-4V14
      208   COR-ANSI-REFERENCE . . . . . .  M443 M445
      199   CORRECT-A. . . . . . . . . . .  200 201 202 203 204 449 451 M474
      200   CORRECT-N
      198   CORRECT-X. . . . . . . . . . .  M366 435
      201   CORRECT-0V18
      203   CORRECT-14V4
      205   CORRECT-18V0 . . . . . . . . .  M508 M524 M539 M551 M564 M613 M627 M644 M687 M697 M709 M721
      202   CORRECT-4V14
      204   CR-18V0
      222   DELETE-COUNTER . . . . . . . .  342 M355 384 400 402
      177   DOTVALUE . . . . . . . . . . .  M360
      228   DUMMY-HOLD . . . . . . . . . .  M414 424
       88   DUMMY-RECORD . . . . . . . . .  M370 M371 M372 M373 M375 M376 M377 M379 M381 M390 M397 M404 M409 M410 414 M415
                                            416 M417 M418 M419 M420 M421 M422 M423 M424 428 M429 M438 M453
      116   DUMMY-WRK-INDENT-5
      112   DUMMY-WRK-REC
      113   DUMMY-WRK1 . . . . . . . . . .  114
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    18
0 Defined   Cross-reference of data names   References

0     114   DUMMY-WRK2
      275   ENDER-DESC . . . . . . . . . .  M392 M403 M408
      223   ERROR-COUNTER. . . . . . . . .  341 M354 383 393 396
      227   ERROR-HOLD . . . . . . . . . .  340 M383 M384 M384 M385 388
      273   ERROR-TOTAL. . . . . . . . . .  M394 M396 M401 M402 M406 M407
      170   FEATURE. . . . . . . . . . . .  M476 M484 M519 M534 M546 M559 M583 M623 M637 M694 M706 M718
      132   FILE-RECORD-INFO . . . . . . .  M331 M470 M489 M582 M592 602 M659 M667
      133   FILE-RECORD-INFO-P1-120
      160   FILE-RECORD-INFO-P121-240
      118   FILE-RECORD-INFO-SKELETON. . .  330
      117   FILE-RECORD-INFORMATION-REC
      301   HYPHEN-LINE. . . . . . . . . .  377 379 423
      107   I-O-ERROR-IX-FD1
      267   ID-AGAIN . . . . . . . . . . .  M323
      300   INF-ANSI-REFERENCE . . . . . .  M436 M439 M452 M454
      295   INFO-TEXT. . . . . . . . . . .  M437
      224   INSPECT-COUNTER. . . . . . . .  343 M352 383 405 407
       89   IX-FD1 . . . . . . . . . . . .  62 463 487 569 574 588 M603 647 661 666 729
       98   IX-FD1-KEY . . . . . . . . . .  67 472 675
       95   IX-FD1-REC-120
       96   IX-FD1-REC-120-240
       94   IX-FD1R1-F-G-240 . . . . . . .  489 592 M602 667
      108   IX-WRK-KEY . . . . . . . . . .  M498 M673 675
      145   ODO-NUMBER
      172   P-OR-F . . . . . . . . . . . .  M352 M353 M354 M355 362 M365 M473
      174   PAR-NAME . . . . . . . . . . .  M367 M477 M483 M518 M533 M545 M558 M584 M624 M638 M652 M695 M707 M719
      176   PARDOT-X . . . . . . . . . . .  M359
      225   PASS-COUNTER . . . . . . . . .  339 M353 385 387
       86   PRINT-FILE . . . . . . . . . .  60 322 347
       87   PRINT-REC. . . . . . . . . . .  M361 M442 M444
       71   RAW-DATA . . . . . . . . . . .  55 312 314 321 335 337 346
       74   RAW-DATA-KEY . . . . . . . . .  59 M313 M336
       73   RAW-DATA-SATZ. . . . . . . . .  319 344
      179   RE-MARK. . . . . . . . . . . .  M356 M368 M475 M506 M509 M526 M540 M553 M566 M590 M596 M614 M628 M645 M685 M699
                                            M710 M723
      221   REC-CT . . . . . . . . . . . .  358 360 367
      220   REC-SKL-SUB. . . . . . . . . .  M326 M329 331
      229   RECORD-COUNT . . . . . . . . .  M412 413 M425
      155   RECORDS-IN-FILE
      139   REELUNIT-NUMBER
      180   TEST-COMPUTED. . . . . . . . .  442
      195   TEST-CORRECT . . . . . . . . .  444
      248   TEST-ID. . . . . . . . . . . .  M323
      168   TEST-RESULTS . . . . . . . . .  M324 361
      226   TOTAL-ERROR
      143   UPDATE-NUMBER. . . . . . . . .  490 493 M601 668
      101   WRK-CS-09V00-006 . . . . . . .  M464 M486 501 505 507 M575 M586 595 611 612 M653 M663 679 683 686
      102   WRK-CS-09V00-007 . . . . . . .  M465 M491 520 524 M576 M587 593 M605 M607 M654 M664 670 M671
      103   WRK-CS-09V00-008 . . . . . . .  M466 M494 535 538 M577 M608 625 626 M655 M665 M672 674 677
      104   WRK-CS-09V00-009 . . . . . . .  M467 M496 547 550 M578 M604 639 643 M656 M669 696 698
      105   WRK-CS-09V00-010 . . . . . . .  M468 M500 560 563 M579 M657 M676 708 711
      106   WRK-CS-09V00-011 . . . . . . .  M469 M580 M658 M678 720 724
      110   WRK-DU-09V00-001 . . . . . . .  M471 499 M660 M674
      153   XBLOCK-SIZE
      135   XFILE-NAME
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    19
0 Defined   Cross-reference of data names   References

0     157   XFILE-ORGANIZATION
      159   XLABEL-TYPE
      147   XPROGRAM-NAME. . . . . . . . .  M600
      162   XRECORD-KEY. . . . . . . . . .  498 673
      149   XRECORD-LENGTH
      137   XRECORD-NAME
      141   XRECORD-NUMBER . . . . . . . .  499 677
      297   XXCOMPUTED . . . . . . . . . .  M451
      299   XXCORRECT. . . . . . . . . . .  M451
      292   XXINFO . . . . . . . . . . . .  438 453
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    20
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

      447   BAIL-OUT . . . . . . . . . . .  P364
      455   BAIL-OUT-EX. . . . . . . . . .  E364 G449
      450   BAIL-OUT-WRITE . . . . . . . .  G448
      430   BLANK-LINE-PRINT
      332   CCVS-INIT-EXIT
      328   CCVS-INIT-FILE . . . . . . . .  P327
      732   CCVS-999999
      310   CCVS1
      456   CCVS1-EXIT . . . . . . . . . .  G333
      334   CLOSE-FILES. . . . . . . . . .  G733
      374   COLUMN-NAMES-ROUTINE . . . . .  E325
      355   DE-LETE
      573   DELETE-INIT-GF-01
      651   DELETE-INIT-GF-04
      610   DELETE-TEST-GF-01. . . . . . .  G591 G597
      585   DELETE-TEST-GF-01-R. . . . . .  G598 G606 G609
      599   DELETE-TEST-GF-01-2. . . . . .  G594
      622   DELETE-TEST-GF-02
      636   DELETE-TEST-GF-03
      682   DELETE-TEST-GF-04. . . . . . .  G666 G680
      662   DELETE-TEST-GF-04-R. . . . . .  G681
      693   DELETE-TEST-GF-05
      705   DELETE-TEST-GF-06
      717   DELETE-TEST-GF-07
      320   END-E-1. . . . . . . . . . . .  G314 G319
      345   END-E-2. . . . . . . . . . . .  G337 G344
      378   END-ROUTINE. . . . . . . . . .  P347
      382   END-ROUTINE-1
      391   END-ROUTINE-12
      399   END-ROUTINE-13 . . . . . . . .  E347
      380   END-RTN-EXIT
      354   FAIL . . . . . . . . . . . . .  P510 P527 P541 P554 P567 P615 P629 P642 P688 P700 P712 P725
      432   FAIL-ROUTINE . . . . . . . . .  P363
      446   FAIL-ROUTINE-EX. . . . . . . .  E363 G440
      441   FAIL-ROUTINE-WRITE . . . . . .  G434 G435
      369   HEAD-ROUTINE . . . . . . . . .  P325
      352   INSPT
      311   OPEN-FILES
      353   PASS . . . . . . . . . . . . .  P512 P521 P536 P548 P561 P617 P631 P640 P690 P702 P714 P727
      357   PRINT-DETAIL . . . . . . . . .  P478 P513 P528 P542 P555 P568 P618 P632 P646 P691 P703 P715 P728
      459   READ-INIT-F1-01
      482   READ-INIT-F1-01-0
      504   READ-TEST-F1-01. . . . . . . .  G488 G502
      485   READ-TEST-F1-01-R. . . . . . .  G503
      497   READ-TEST-F1-01-2. . . . . . .  G492 G495
      517   READ-TEST-F1-02
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    21
0 Defined   Cross-reference of procedures   References

0     532   READ-TEST-F1-03
      544   READ-TEST-F1-04
      557   READ-TEST-F1-05
      458   SECT-IX-03-001
      350   TERMINATE-CALL
      348   TERMINATE-CCVS
      411   WRITE-LINE . . . . . . . . . .  P361 P362 P370 P371 P372 P373 P375 P376 P377 P379 P381 P390 P398 P404 P409 P410
                                            P438 P442 P444 P453
      427   WRT-LN . . . . . . . . . . . .  P417 P418 P419 P420 P421 P422 P423 P426 P431
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    22
0 Defined   Cross-reference of programs     References

        3   IX203A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX203A    Date 06/04/2022  Time 11:58:59   Page    23
0LineID  Message code  Message text

     64  IGYDS1298-I   Assignment-name "XXXXD044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXD044" was treated as comments.

     86  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     89  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     89  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       4           4
-* Statistics for COBOL program IX203A:
 *    Source records = 733
 *    Data Division statements = 114
 *    Procedure Division statements = 367
 *    Generated COBOL statements = 0
 *    Program complexity factor = 376
0End of compilation 1,  program IX203A,  highest severity 0.
0Return code 0
