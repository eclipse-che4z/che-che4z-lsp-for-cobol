1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:35   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:35   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1034.2
   000002         000200 PROGRAM-ID.                                                      IX1034.2
   000003         000300     IX103A.                                                      IX1034.2
   000004         000500*                                                              *  IX1034.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1034.2
   000006         000700*                                                              *  IX1034.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1034.2
   000008         000900*                                                              *  IX1034.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1034.2
   000010         001100*                                                              *  IX1034.2
   000011         001300*                                                                 IX1034.2
   000012         001400*         NEW TEST:                                               IX1034.2
   000013         001500*              SELECT ...      INDEXED  ...                       IX1034.2
   000014         001600*              (WITHOUT THE OPTIONAL WORD <ORGANIZATION>)         IX1034.2
   000015         001700*                                                                 IX1034.2
   000016         001800*    THIS PROGRAM IS THE THIRD OF A SERIES.  ITS FUNCTION         IX1034.2
   000017         001900*    IS TO PROCESS THE FILE SEQUENTIALLY (ACCESS MODE IS          IX1034.2
   000018         002000*    SEQUENTIAL).  THE FILE USED IS THAT RESULTING FROM IX102.    IX1034.2
   000019         002100*                                                                 IX1034.2
   000020         002200*    FIRST, THE FILE IS VERIFIED FOR ACCURACY OF ITS 500 RECORDS. IX1034.2
   000021         002300*    SECONDLY, RECORDS OF THE FILE ARE SELECTIVELY DELETED AND    IX1034.2
   000022         002400*    THIRDLY THE ACCURACY OF EACH RECORD IN THE FILE IS AGAIN     IX1034.2
   000023         002500*    VERIFIED.                                                    IX1034.2
   000024         002600*                                                                 IX1034.2
   000025         002700*                                                                 IX1034.2
   000026         002800*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX1034.2
   000027         002900*                                                                 IX1034.2
   000028         003000*             X-24   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX1034.2
   000029         003100*                    CLAUSE FOR DATA FILE IX-FS1                  IX1034.2
   000030         003200*             X-44   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX1034.2
   000031         003300*                    CLAUSE FOR INDEX FILE IX-FS1                 IX1034.2
   000032         003400*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX1034.2
   000033         003500*             X-62   IMPLEMENTOR-NAME FOR RAW-DATA                IX1034.2
   000034         003600*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX1034.2
   000035         003700*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX1034.2
   000036         003800*                                                                 IX1034.2
   000037         003900*         NOTE:  X-CARDS 44 AND 62          ARE OPTIONAL          IX1034.2
   000038         004000*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX1034.2
   000039         004100*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX1034.2
   000040         004200*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX1034.2
   000041         004300*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX1034.2
   000042         004400*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX1034.2
   000043         004500*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX1034.2
   000044         004600*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX1034.2
   000045         004700*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX1034.2
   000046         004800*               THEY ARE AS FOLLOWS                               IX1034.2
   000047         004900*                                                                 IX1034.2
   000048         005000*                  J  SELECTS X-CARD 44                           IX1034.2
   000049         005100*                  P  SELECTS X-CARD 62                           IX1034.2
   000050         005200*                                                                 IX1034.2
   000051         005400 ENVIRONMENT DIVISION.                                            IX1034.2
   000052         005500 CONFIGURATION SECTION.                                           IX1034.2
   000053         005600 SOURCE-COMPUTER.                                                 IX1034.2
   000054         005700     XXXXX082.                                                    IX1034.2
   000055         005800 OBJECT-COMPUTER.                                                 IX1034.2
   000056         005900     XXXXX083.                                                    IX1034.2
   000057         006000 INPUT-OUTPUT SECTION.                                            IX1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100 FILE-CONTROL.                                                    IX1034.2
   000059         006200     SELECT RAW-DATA   ASSIGN TO                                  IX1034.2 76
   000060         006300     XXXXX062                                                     IX1034.2
   000061         006400            ORGANIZATION IS INDEXED                               IX1034.2
   000062         006500            ACCESS MODE IS RANDOM                                 IX1034.2
   000063         006600            RECORD KEY IS RAW-DATA-KEY.                           IX1034.2 79
   000064         006700     SELECT PRINT-FILE ASSIGN TO                                  IX1034.2 91
   000065         006800     XXXXX055.                                                    IX1034.2
   000066         006900     SELECT   IX-FS1 ASSIGN TO                                    IX1034.2 94
   000067         007000     XXXXD024                                                     IX1034.2
   000068         007100     XXXXD044                                                     IX1034.2

 ==000068==> IGYDS1298-I Assignment-name "XXXXD044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXD044" was treated as comments.

   000069         007200                     INDEXED                                      IX1034.2
   000070         007300     RECORD    IX-FS1-KEY.                                        IX1034.2 103
   000071         007400*    THE ABSENCE OF THE ACCESS CLAUSE IS TREATED AS THOUGH        IX1034.2
   000072         007500*        SEQUENTIAL HAD BEEN SPECIFIED.                           IX1034.2
   000073         007600 DATA DIVISION.                                                   IX1034.2
   000074         007700 FILE SECTION.                                                    IX1034.2
   000075         007800                                                                  IX1034.2
   000076         007900 FD  RAW-DATA.                                                    IX1034.2
   000077         008000                                                                  IX1034.2
   000078         008100 01  RAW-DATA-SATZ.                                               IX1034.2
   000079         008200     05  RAW-DATA-KEY        PIC X(6).                            IX1034.2
   000080         008300     05  C-DATE              PIC 9(6).                            IX1034.2
   000081         008400     05  C-TIME              PIC 9(8).                            IX1034.2
   000082         008500     05  C-NO-OF-TESTS       PIC 99.                              IX1034.2
   000083         008600     05  C-OK                PIC 999.                             IX1034.2
   000084         008700     05  C-ALL               PIC 999.                             IX1034.2
   000085         008800     05  C-FAIL              PIC 999.                             IX1034.2
   000086         008900     05  C-DELETED           PIC 999.                             IX1034.2
   000087         009000     05  C-INSPECT           PIC 999.                             IX1034.2
   000088         009100     05  C-NOTE              PIC X(13).                           IX1034.2
   000089         009200     05  C-INDENT            PIC X.                               IX1034.2
   000090         009300     05  C-ABORT             PIC X(8).                            IX1034.2
   000091         009400 FD  PRINT-FILE.                                                  IX1034.2

 ==000091==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000092         009500 01  PRINT-REC PICTURE X(120).                                    IX1034.2
   000093         009600 01  DUMMY-RECORD PICTURE X(120).                                 IX1034.2
   000094         009700 FD  IX-FS1                                                       IX1034.2

 ==000094==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000094==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000095         009800     LABEL RECORD STANDARD                                        IX1034.2
   000096         009900     DATA RECORDS ARE  IX-FS1R1-F-G-240                           IX1034.2 *
   000097         010000     ; BLOCK CONTAINS 01 RECORDS                                  IX1034.2
   000098         010100     RECORD CONTAINS  240.                                        IX1034.2
   000099         010200 01  IX-FS1R1-F-G-240.                                            IX1034.2
   000100         010300     05 IX-FS1-REC-120   PIC  X(120).                             IX1034.2
   000101         010400     05 IX-FS1-REC-120-240.                                       IX1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000102         010500        10 FILLER   PIC X(8).                                     IX1034.2
   000103         010600        10 IX-FS1-KEY   PIC X(29).                                IX1034.2
   000104         010700        10 FILLER        PIC X(83).                               IX1034.2
   000105         010800 WORKING-STORAGE SECTION.                                         IX1034.2
   000106         010900 01  WRK-CS-09V00-006 PIC S9(09) USAGE COMP VALUE ZERO.           IX1034.2 IMP
   000107         011000 01  WRK-CS-09V00-007 PIC S9(09) USAGE COMP VALUE ZERO.           IX1034.2 IMP
   000108         011100 01  WRK-CS-09V00-008 PIC S9(09) USAGE COMP VALUE ZERO.           IX1034.2 IMP
   000109         011200 01  WRK-CS-09V00-009 PIC S9(09) USAGE COMP VALUE ZERO.           IX1034.2 IMP
   000110         011300 01  WRK-CS-09V00-010 PIC S9(09) USAGE COMP VALUE ZERO.           IX1034.2 IMP
   000111         011400 01  WRK-CS-09V00-011 PIC S9(09) USAGE COMP VALUE ZERO.           IX1034.2 IMP
   000112         011500 01  I-O-ERROR-IX-FS1 PIC X(3) VALUE "NO ".                       IX1034.2
   000113         011600 01  IX-WRK-KEY.                                                  IX1034.2
   000114         011700     03 FILLER         PIC X(10).                                 IX1034.2
   000115         011800     03 WRK-DU-09V00-001  PIC 9(9).                               IX1034.2
   000116         011900     03 FILLER         PIC X(10).                                 IX1034.2
   000117         012000 01  DUMMY-WRK-REC.                                               IX1034.2
   000118         012100     02 DUMMY-WRK1       PIC X(120).                              IX1034.2
   000119         012200     02 DUMMY-WRK2  REDEFINES  DUMMY-WRK1.                        IX1034.2 118
   000120         012300        03 FILLER   PIC X(5).                                     IX1034.2
   000121         012400        03 DUMMY-WRK-INDENT-5  PIC X(115).                        IX1034.2
   000122         012500 01  FILE-RECORD-INFORMATION-REC.                                 IX1034.2
   000123         012600     03 FILE-RECORD-INFO-SKELETON.                                IX1034.2
   000124         012700        05 FILLER                 PICTURE X(48)       VALUE       IX1034.2
   000125         012800             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX1034.2
   000126         012900        05 FILLER                 PICTURE X(46)       VALUE       IX1034.2
   000127         013000             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX1034.2
   000128         013100        05 FILLER                 PICTURE X(26)       VALUE       IX1034.2
   000129         013200             ",LFIL=000000,ORG=  ,LBLR= ".                        IX1034.2
   000130         013300        05 FILLER                 PICTURE X(37)       VALUE       IX1034.2
   000131         013400             ",RECKEY=                             ".             IX1034.2
   000132         013500        05 FILLER                 PICTURE X(38)       VALUE       IX1034.2
   000133         013600             ",ALTKEY1=                             ".            IX1034.2
   000134         013700        05 FILLER                 PICTURE X(38)       VALUE       IX1034.2
   000135         013800             ",ALTKEY2=                             ".            IX1034.2
   000136         013900        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX1034.2 IMP
   000137         014000     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX1034.2
   000138         014100        05 FILE-RECORD-INFO-P1-120.                               IX1034.2
   000139         014200           07 FILLER              PIC X(5).                       IX1034.2
   000140         014300           07 XFILE-NAME           PIC X(6).                      IX1034.2
   000141         014400           07 FILLER              PIC X(8).                       IX1034.2
   000142         014500           07 XRECORD-NAME         PIC X(6).                      IX1034.2
   000143         014600           07 FILLER              PIC X(1).                       IX1034.2
   000144         014700           07 REELUNIT-NUMBER     PIC 9(1).                       IX1034.2
   000145         014800           07 FILLER              PIC X(7).                       IX1034.2
   000146         014900           07 XRECORD-NUMBER       PIC 9(6).                      IX1034.2
   000147         015000           07 FILLER              PIC X(6).                       IX1034.2
   000148         015100           07 UPDATE-NUMBER       PIC 9(2).                       IX1034.2
   000149         015200           07 FILLER              PIC X(5).                       IX1034.2
   000150         015300           07 ODO-NUMBER          PIC 9(4).                       IX1034.2
   000151         015400           07 FILLER              PIC X(5).                       IX1034.2
   000152         015500           07 XPROGRAM-NAME        PIC X(5).                      IX1034.2
   000153         015600           07 FILLER              PIC X(7).                       IX1034.2
   000154         015700           07 XRECORD-LENGTH       PIC 9(6).                      IX1034.2
   000155         015800           07 FILLER              PIC X(7).                       IX1034.2
   000156         015900           07 CHARS-OR-RECORDS    PIC X(2).                       IX1034.2
   000157         016000           07 FILLER              PIC X(1).                       IX1034.2
   000158         016100           07 XBLOCK-SIZE          PIC 9(4).                      IX1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000159         016200           07 FILLER              PIC X(6).                       IX1034.2
   000160         016300           07 RECORDS-IN-FILE     PIC 9(6).                       IX1034.2
   000161         016400           07 FILLER              PIC X(5).                       IX1034.2
   000162         016500           07 XFILE-ORGANIZATION   PIC X(2).                      IX1034.2
   000163         016600           07 FILLER              PIC X(6).                       IX1034.2
   000164         016700           07 XLABEL-TYPE          PIC X(1).                      IX1034.2
   000165         016800        05 FILE-RECORD-INFO-P121-240.                             IX1034.2
   000166         016900           07 FILLER              PIC X(8).                       IX1034.2
   000167         017000           07 XRECORD-KEY          PIC X(29).                     IX1034.2
   000168         017100           07 FILLER              PIC X(9).                       IX1034.2
   000169         017200           07 ALTERNATE-KEY1      PIC X(29).                      IX1034.2
   000170         017300           07 FILLER              PIC X(9).                       IX1034.2
   000171         017400           07 ALTERNATE-KEY2      PIC X(29).                      IX1034.2
   000172         017500           07 FILLER              PIC X(7).                       IX1034.2
   000173         017600 01  TEST-RESULTS.                                                IX1034.2
   000174         017700     02 FILLER                   PIC X      VALUE SPACE.          IX1034.2 IMP
   000175         017800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1034.2 IMP
   000176         017900     02 FILLER                   PIC X      VALUE SPACE.          IX1034.2 IMP
   000177         018000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1034.2 IMP
   000178         018100     02 FILLER                   PIC X      VALUE SPACE.          IX1034.2 IMP
   000179         018200     02  PAR-NAME.                                                IX1034.2
   000180         018300       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1034.2 IMP
   000181         018400       03  PARDOT-X              PIC X      VALUE SPACE.          IX1034.2 IMP
   000182         018500       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1034.2 IMP
   000183         018600     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1034.2 IMP
   000184         018700     02 RE-MARK                  PIC X(61).                       IX1034.2
   000185         018800 01  TEST-COMPUTED.                                               IX1034.2
   000186         018900     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1034.2 IMP
   000187         019000     02 FILLER                   PIC X(17)  VALUE                 IX1034.2
   000188         019100            "       COMPUTED=".                                   IX1034.2
   000189         019200     02 COMPUTED-X.                                               IX1034.2
   000190         019300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1034.2 IMP
   000191         019400     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1034.2 190
   000192         019500                                 PIC -9(9).9(9).                  IX1034.2
   000193         019600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1034.2 190
   000194         019700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1034.2 190
   000195         019800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1034.2 190
   000196         019900     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1034.2 190
   000197         020000         04 COMPUTED-18V0                    PIC -9(18).          IX1034.2
   000198         020100         04 FILLER                           PIC X.               IX1034.2
   000199         020200     03 FILLER PIC X(50) VALUE SPACE.                             IX1034.2 IMP
   000200         020300 01  TEST-CORRECT.                                                IX1034.2
   000201         020400     02 FILLER PIC X(30) VALUE SPACE.                             IX1034.2 IMP
   000202         020500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1034.2
   000203         020600     02 CORRECT-X.                                                IX1034.2
   000204         020700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1034.2 IMP
   000205         020800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1034.2 204
   000206         020900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1034.2 204
   000207         021000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1034.2 204
   000208         021100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1034.2 204
   000209         021200     03      CR-18V0 REDEFINES CORRECT-A.                         IX1034.2 204
   000210         021300         04 CORRECT-18V0                     PIC -9(18).          IX1034.2
   000211         021400         04 FILLER                           PIC X.               IX1034.2
   000212         021500     03 FILLER PIC X(2) VALUE SPACE.                              IX1034.2 IMP
   000213         021600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1034.2 IMP
   000214         021700 01  CCVS-C-1.                                                    IX1034.2
   000215         021800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000216         021900-    "SS  PARAGRAPH-NAME                                          IX1034.2
   000217         022000-    "       REMARKS".                                            IX1034.2
   000218         022100     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1034.2 IMP
   000219         022200 01  CCVS-C-2.                                                    IX1034.2
   000220         022300     02 FILLER                     PIC X        VALUE SPACE.      IX1034.2 IMP
   000221         022400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1034.2
   000222         022500     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1034.2 IMP
   000223         022600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1034.2
   000224         022700     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1034.2 IMP
   000225         022800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1034.2 IMP
   000226         022900 01  REC-CT                        PIC 99       VALUE ZERO.       IX1034.2 IMP
   000227         023000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1034.2 IMP
   000228         023100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1034.2 IMP
   000229         023200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1034.2 IMP
   000230         023300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1034.2 IMP
   000231         023400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1034.2 IMP
   000232         023500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1034.2 IMP
   000233         023600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1034.2 IMP
   000234         023700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1034.2 IMP
   000235         023800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1034.2 IMP
   000236         023900 01  CCVS-H-1.                                                    IX1034.2
   000237         024000     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1034.2 IMP
   000238         024100     02  FILLER                    PIC X(42)    VALUE             IX1034.2
   000239         024200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1034.2
   000240         024300     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1034.2 IMP
   000241         024400 01  CCVS-H-2A.                                                   IX1034.2
   000242         024500   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1034.2 IMP
   000243         024600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1034.2
   000244         024700   02  FILLER                        PIC XXXX   VALUE             IX1034.2
   000245         024800     "4.2 ".                                                      IX1034.2
   000246         024900   02  FILLER                        PIC X(28)  VALUE             IX1034.2
   000247         025000            " COPY - NOT FOR DISTRIBUTION".                       IX1034.2
   000248         025100   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1034.2 IMP
   000249         025200                                                                  IX1034.2
   000250         025300 01  CCVS-H-2B.                                                   IX1034.2
   000251         025400   02  FILLER                        PIC X(15)  VALUE             IX1034.2
   000252         025500            "TEST RESULT OF ".                                    IX1034.2
   000253         025600   02  TEST-ID                       PIC X(9).                    IX1034.2
   000254         025700   02  FILLER                        PIC X(4)   VALUE             IX1034.2
   000255         025800            " IN ".                                               IX1034.2
   000256         025900   02  FILLER                        PIC X(12)  VALUE             IX1034.2
   000257         026000     " HIGH       ".                                              IX1034.2
   000258         026100   02  FILLER                        PIC X(22)  VALUE             IX1034.2
   000259         026200            " LEVEL VALIDATION FOR ".                             IX1034.2
   000260         026300   02  FILLER                        PIC X(58)  VALUE             IX1034.2
   000261         026400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1034.2
   000262         026500 01  CCVS-H-3.                                                    IX1034.2
   000263         026600     02  FILLER                      PIC X(34)  VALUE             IX1034.2
   000264         026700            " FOR OFFICIAL USE ONLY    ".                         IX1034.2
   000265         026800     02  FILLER                      PIC X(58)  VALUE             IX1034.2
   000266         026900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1034.2
   000267         027000     02  FILLER                      PIC X(28)  VALUE             IX1034.2
   000268         027100            "  COPYRIGHT   1985 ".                                IX1034.2
   000269         027200 01  CCVS-E-1.                                                    IX1034.2
   000270         027300     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1034.2 IMP
   000271         027400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1034.2
   000272         027500     02 ID-AGAIN                     PIC X(9).                    IX1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000273         027600     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1034.2 IMP
   000274         027700 01  CCVS-E-2.                                                    IX1034.2
   000275         027800     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1034.2 IMP
   000276         027900     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1034.2 IMP
   000277         028000     02 CCVS-E-2-2.                                               IX1034.2
   000278         028100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1034.2 IMP
   000279         028200         03 FILLER                   PIC X      VALUE SPACE.      IX1034.2 IMP
   000280         028300         03 ENDER-DESC               PIC X(44)  VALUE             IX1034.2
   000281         028400            "ERRORS ENCOUNTERED".                                 IX1034.2
   000282         028500 01  CCVS-E-3.                                                    IX1034.2
   000283         028600     02  FILLER                      PIC X(22)  VALUE             IX1034.2
   000284         028700            " FOR OFFICIAL USE ONLY".                             IX1034.2
   000285         028800     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1034.2 IMP
   000286         028900     02  FILLER                      PIC X(58)  VALUE             IX1034.2
   000287         029000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1034.2
   000288         029100     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1034.2 IMP
   000289         029200     02 FILLER                       PIC X(15)  VALUE             IX1034.2
   000290         029300             " COPYRIGHT 1985".                                   IX1034.2
   000291         029400 01  CCVS-E-4.                                                    IX1034.2
   000292         029500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1034.2 IMP
   000293         029600     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1034.2
   000294         029700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1034.2 IMP
   000295         029800     02 FILLER                       PIC X(40)  VALUE             IX1034.2
   000296         029900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1034.2
   000297         030000 01  XXINFO.                                                      IX1034.2
   000298         030100     02 FILLER                       PIC X(19)  VALUE             IX1034.2
   000299         030200            "*** INFORMATION ***".                                IX1034.2
   000300         030300     02 INFO-TEXT.                                                IX1034.2
   000301         030400       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1034.2 IMP
   000302         030500       04 XXCOMPUTED                 PIC X(20).                   IX1034.2
   000303         030600       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1034.2 IMP
   000304         030700       04 XXCORRECT                  PIC X(20).                   IX1034.2
   000305         030800     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1034.2
   000306         030900 01  HYPHEN-LINE.                                                 IX1034.2
   000307         031000     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1034.2 IMP
   000308         031100     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1034.2
   000309         031200-    "*****************************************".                 IX1034.2
   000310         031300     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1034.2
   000311         031400-    "******************************".                            IX1034.2
   000312         031500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1034.2
   000313         031600     "IX103A".                                                    IX1034.2
   000314         031700 PROCEDURE DIVISION.                                              IX1034.2
   000315         031800 DECLARATIVES.                                                    IX1034.2
   000316         031900 USE-IX103-TEST  SECTION.                                         IX1034.2
   000317         032000     USE   AFTER  STANDARD  EXCEPTION PROCEDURE                   IX1034.2
   000318         032100             IX-FS1.                                              IX1034.2 94
   000319         032200 USE-PAR-001.                                                     IX1034.2
   000320         032300     ADD   1   TO WRK-CS-09V00-009.                               IX1034.2 109
   000321         032400 USE-PAR-EXIT.                                                    IX1034.2
   000322         032500     EXIT.                                                        IX1034.2
   000323         032600 END DECLARATIVES.                                                IX1034.2
   000324         032700 CCVS1 SECTION.                                                   IX1034.2
   000325         032800 OPEN-FILES.                                                      IX1034.2
   000326         032900     OPEN I-O RAW-DATA.                                           IX1034.2 76
   000327         033000     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1034.2 312 79
   000328         033100     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1034.2 76 334
   000329         033200     MOVE "ABORTED " TO C-ABORT.                                  IX1034.2 90
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000330         033300     ADD 1 TO C-NO-OF-TESTS.                                      IX1034.2 82
   000331         033400     ACCEPT C-DATE  FROM DATE.                                    IX1034.2 80
   000332         033500     ACCEPT C-TIME  FROM TIME.                                    IX1034.2 81
   000333         033600     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1034.2 78 334
   000334         033700 END-E-1.                                                         IX1034.2
   000335         033800     CLOSE RAW-DATA.                                              IX1034.2 76
   000336         033900     OPEN    OUTPUT PRINT-FILE.                                   IX1034.2 91
   000337         034000     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1034.2 312 253 312 272
   000338         034100     MOVE    SPACE TO TEST-RESULTS.                               IX1034.2 IMP 173
   000339         034200     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1034.2 383 388
   000340         034300     MOVE    ZERO TO REC-SKL-SUB.                                 IX1034.2 IMP 225
   000341         034400     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1034.2 342
   000342         034500 CCVS-INIT-FILE.                                                  IX1034.2
   000343         034600     ADD     1 TO REC-SKL-SUB.                                    IX1034.2 225
   000344         034700     MOVE    FILE-RECORD-INFO-SKELETON                            IX1034.2 123
   000345         034800          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1034.2 137 225
   000346         034900 CCVS-INIT-EXIT.                                                  IX1034.2
   000347         035000     GO TO CCVS1-EXIT.                                            IX1034.2 470
   000348         035100 CLOSE-FILES.                                                     IX1034.2
   000349         035200     OPEN I-O RAW-DATA.                                           IX1034.2 76
   000350         035300     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1034.2 312 79
   000351         035400     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1034.2 76 359
   000352         035500     MOVE "OK.     " TO C-ABORT.                                  IX1034.2 90
   000353         035600     MOVE PASS-COUNTER TO C-OK.                                   IX1034.2 230 83
   000354         035700     MOVE ERROR-HOLD   TO C-ALL.                                  IX1034.2 232 84
   000355         035800     MOVE ERROR-COUNTER TO C-FAIL.                                IX1034.2 228 85
   000356         035900     MOVE DELETE-COUNTER TO C-DELETED.                            IX1034.2 227 86
   000357         036000     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1034.2 229 87
   000358         036100     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1034.2 78 359
   000359         036200 END-E-2.                                                         IX1034.2
   000360         036300     CLOSE RAW-DATA.                                              IX1034.2 76
   000361         036400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1034.2 392 413 91
   000362         036500 TERMINATE-CCVS.                                                  IX1034.2
   000363         036600     EXIT PROGRAM.                                                IX1034.2
   000364         036700 TERMINATE-CALL.                                                  IX1034.2
   000365         036800     STOP     RUN.                                                IX1034.2
   000366         036900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1034.2 177 229
   000367         037000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1034.2 177 230
   000368         037100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1034.2 177 228
   000369         037200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1034.2 177 227
   000370         037300     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1034.2 184
   000371         037400 PRINT-DETAIL.                                                    IX1034.2
   000372         037500     IF REC-CT NOT EQUAL TO ZERO                                  IX1034.2 226 IMP
   000373      1  037600             MOVE "." TO PARDOT-X                                 IX1034.2 181
   000374      1  037700             MOVE REC-CT TO DOTVALUE.                             IX1034.2 226 182
   000375         037800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1034.2 173 92 425
   000376         037900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1034.2 177 425
   000377      1  038000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1034.2 446 460
   000378      1  038100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1034.2 461 469
   000379         038200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1034.2 IMP 177 IMP 189
   000380         038300     MOVE SPACE TO CORRECT-X.                                     IX1034.2 IMP 203
   000381         038400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1034.2 226 IMP IMP 179
   000382         038500     MOVE     SPACE TO RE-MARK.                                   IX1034.2 IMP 184
   000383         038600 HEAD-ROUTINE.                                                    IX1034.2
   000384         038700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1034.2 236 93 425
   000385         038800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1034.2 241 93 425
   000386         038900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1034.2 250 93 425
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000387         039000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1034.2 262 93 425
   000388         039100 COLUMN-NAMES-ROUTINE.                                            IX1034.2
   000389         039200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1034.2 214 93 425
   000390         039300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1034.2 219 93 425
   000391         039400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1034.2 306 93 425
   000392         039500 END-ROUTINE.                                                     IX1034.2
   000393         039600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1034.2 306 93 425
   000394         039700 END-RTN-EXIT.                                                    IX1034.2
   000395         039800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1034.2 269 93 425
   000396         039900 END-ROUTINE-1.                                                   IX1034.2
   000397         040000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1034.2 228 232 229
   000398         040100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1034.2 232 227 232
   000399         040200      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1034.2 230 232
   000400         040300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1034.2
   000401         040400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1034.2 230 292
   000402         040500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1034.2 232 294
   000403         040600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1034.2 291 277
   000404         040700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1034.2 274 93 425
   000405         040800  END-ROUTINE-12.                                                 IX1034.2
   000406         040900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1034.2 280
   000407         041000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1034.2 228 IMP
   000408      1  041100         MOVE "NO " TO ERROR-TOTAL                                IX1034.2 278
   000409         041200         ELSE                                                     IX1034.2
   000410      1  041300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1034.2 228 278
   000411         041400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1034.2 274 93
   000412         041500     PERFORM WRITE-LINE.                                          IX1034.2 425
   000413         041600 END-ROUTINE-13.                                                  IX1034.2
   000414         041700     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1034.2 227 IMP
   000415      1  041800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1034.2 278
   000416      1  041900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1034.2 227 278
   000417         042000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1034.2 280
   000418         042100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1034.2 274 93 425
   000419         042200      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1034.2 229 IMP
   000420      1  042300          MOVE "NO " TO ERROR-TOTAL                               IX1034.2 278
   000421      1  042400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1034.2 229 278
   000422         042500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1034.2 280
   000423         042600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1034.2 274 93 425
   000424         042700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1034.2 282 93 425
   000425         042800 WRITE-LINE.                                                      IX1034.2
   000426         042900     ADD 1 TO RECORD-COUNT.                                       IX1034.2 234
   000427         043000     IF RECORD-COUNT GREATER 42                                   IX1034.2 234
   000428      1  043100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1034.2 93 233
   000429      1  043200         MOVE SPACE TO DUMMY-RECORD                               IX1034.2 IMP 93
   000430      1  043300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1034.2 93
   000431      1  043400         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1034.2 236 93 441
   000432      1  043500         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1034.2 241 93 441
   000433      1  043600         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1034.2 250 93 441
   000434      1  043700         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1034.2 262 93 441
   000435      1  043800         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1034.2 214 93 441
   000436      1  043900         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1034.2 219 93 441
   000437      1  044000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1034.2 306 93 441
   000438      1  044100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1034.2 233 93
   000439      1  044200         MOVE ZERO TO RECORD-COUNT.                               IX1034.2 IMP 234
   000440         044300     PERFORM WRT-LN.                                              IX1034.2 441
   000441         044400 WRT-LN.                                                          IX1034.2
   000442         044500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1034.2 93
   000443         044600     MOVE SPACE TO DUMMY-RECORD.                                  IX1034.2 IMP 93
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000444         044700 BLANK-LINE-PRINT.                                                IX1034.2
   000445         044800     PERFORM WRT-LN.                                              IX1034.2 441
   000446         044900 FAIL-ROUTINE.                                                    IX1034.2
   000447         045000     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1034.2 189 IMP
   000448      1  045100            GO TO   FAIL-ROUTINE-WRITE.                           IX1034.2 455
   000449         045200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1034.2 203 IMP 455
   000450         045300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1034.2 235 305
   000451         045400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1034.2 300
   000452         045500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1034.2 297 93 425
   000453         045600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1034.2 IMP 305
   000454         045700     GO TO  FAIL-ROUTINE-EX.                                      IX1034.2 460
   000455         045800 FAIL-ROUTINE-WRITE.                                              IX1034.2
   000456         045900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1034.2 185 92 425
   000457         046000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1034.2 235 213
   000458         046100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1034.2 200 92 425
   000459         046200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1034.2 IMP 213
   000460         046300 FAIL-ROUTINE-EX. EXIT.                                           IX1034.2
   000461         046400 BAIL-OUT.                                                        IX1034.2
   000462         046500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1034.2 190 IMP 464
   000463         046600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1034.2 204 IMP 469
   000464         046700 BAIL-OUT-WRITE.                                                  IX1034.2
   000465         046800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1034.2 204 304 190 302
   000466         046900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1034.2 235 305
   000467         047000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1034.2 297 93 425
   000468         047100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1034.2 IMP 305
   000469         047200 BAIL-OUT-EX. EXIT.                                               IX1034.2
   000470         047300 CCVS1-EXIT.                                                      IX1034.2
   000471         047400     EXIT.                                                        IX1034.2
   000472         047500 SECT-IX-03-001 SECTION.                                          IX1034.2
   000473         047600 INX-INIT-006.                                                    IX1034.2
   000474         047700*    THIS FILE "IX-FS1" IS ACCESSED SEQUENTIALLY AND HAS          IX1034.2
   000475         047800*    ASSOCIATED WITH IT A RECORD KEY WHICH AT ALL TIMES SHOULD    IX1034.2
   000476         047900*    CONTAIN THE INDEX OF THE RECORD PREVIOUSLY READ.             IX1034.2
   000477         048000     OPEN INPUT IX-FS1.                                           IX1034.2 94
   000478         048100     MOVE     "INX-TEST-006" TO   PAR-NAME.                       IX1034.2 179
   000479         048200     MOVE     ZERO TO             WRK-CS-09V00-006.               IX1034.2 IMP 106
   000480         048300     MOVE     ZERO TO             WRK-CS-09V00-007.               IX1034.2 IMP 107
   000481         048400     MOVE     ZERO TO             WRK-CS-09V00-008.               IX1034.2 IMP 108
   000482         048500     MOVE     ZERO TO             WRK-CS-09V00-009.               IX1034.2 IMP 109
   000483         048600     MOVE     ZERO TO             WRK-CS-09V00-010.               IX1034.2 IMP 110
   000484         048700     MOVE     ZERO TO             WRK-CS-09V00-011.               IX1034.2 IMP 111
   000485         048800     MOVE     SPACE TO  FILE-RECORD-INFO (1).                     IX1034.2 IMP 137
   000486         048900     MOVE    ZERO TO WRK-DU-09V00-001.                            IX1034.2 IMP 115
   000487         049000     MOVE    IX-FS1-KEY TO COMPUTED-A.                            IX1034.2 103 190
   000488         049100     MOVE    SPACE TO P-OR-F.                                     IX1034.2 IMP 177
   000489         049200     MOVE    "INFORMATION" TO CORRECT-A.                          IX1034.2 204
   000490         049300     MOVE    "KEY AFTER OPEN" TO RE-MARK.                         IX1034.2 184
   000491         049400     MOVE    "RECORD KEY ON OPEN"  TO FEATURE.                    IX1034.2 175
   000492         049500     PERFORM PRINT-DETAIL.                                        IX1034.2 371
   000493         049600     MOVE    "INX-TEST-006"  TO PAR-NAME.                         IX1034.2 179
   000494         049700     MOVE    "READ SEQUENTIAL  "  TO FEATURE.                     IX1034.2 175
   000495         049800 INX-TEST-006-R.                                                  IX1034.2
   000496         049900     ADD      1 TO WRK-CS-09V00-006.                              IX1034.2 106
   000497         050000     READ     IX-FS1                                              IX1034.2 94
   000498      1  050100              AT END GO TO READ-TEST-F1-01.                       IX1034.2 514
   000499         050200     MOVE     IX-FS1R1-F-G-240    TO FILE-RECORD-INFO (1).        IX1034.2 99 137
   000500         050300     IF       UPDATE-NUMBER (1) EQUAL TO 00                       IX1034.2 148
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000501      1  050400             ADD 1 TO WRK-CS-09V00-007                            IX1034.2 107
   000502      1  050500              GO TO INX-TEST-006-2.                               IX1034.2 507
   000503         050600     IF       UPDATE-NUMBER (1) EQUAL TO 01                       IX1034.2 148
   000504      1  050700              ADD 1 TO WRK-CS-09V00-008                           IX1034.2 108
   000505      1  050800              GO TO INX-TEST-006-2.                               IX1034.2 507
   000506         050900     ADD      1 TO WRK-CS-09V00-009.                              IX1034.2 109
   000507         051000 INX-TEST-006-2.                                                  IX1034.2
   000508         051100     MOVE    XRECORD-KEY (1)  TO  IX-WRK-KEY.                     IX1034.2 167 113
   000509         051200     IF      WRK-DU-09V00-001  NOT EQUAL TO XRECORD-NUMBER (1)    IX1034.2 115 146
   000510      1  051300              ADD 1 TO  WRK-CS-09V00-010.                         IX1034.2 110
   000511         051400     IF       WRK-CS-09V00-006  GREATER 501                       IX1034.2 106
   000512      1  051500              GO TO READ-TEST-F1-01.                              IX1034.2 514
   000513         051600     GO TO    INX-TEST-006-R.                                     IX1034.2 495
   000514         051700 READ-TEST-F1-01.                                                 IX1034.2
   000515         051800     MOVE    "READ-TEST-F1-01"  TO PAR-NAME.                      IX1034.2 179
   000516         051900     MOVE    "READ SEQUENTIAL  "  TO FEATURE.                     IX1034.2 175
   000517         052000*                                                                 IX1034.2
   000518         052100*  TEST   1                                                       IX1034.2
   000519         052200*                                                                 IX1034.2
   000520         052300     IF       WRK-CS-09V00-006 NOT EQUAL TO 501                   IX1034.2 106
   000521      1  052400              MOVE "INCORRECT RECORD COUNT"  TO RE-MARK           IX1034.2 184
   000522      1  052500              MOVE  WRK-CS-09V00-006 TO COMPUTED-18V0             IX1034.2 106 197
   000523      1  052600              MOVE  500  TO             CORRECT-18V0              IX1034.2 210
   000524      1  052700              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1034.2 184
   000525      1  052800              PERFORM FAIL                                        IX1034.2 368
   000526         052900              ELSE                                                IX1034.2
   000527      1  053000              PERFORM PASS.                                       IX1034.2 367
   000528         053100     PERFORM  PRINT-DETAIL.                                       IX1034.2 371
   000529         053200 READ-TEST-F1-02.                                                 IX1034.2
   000530         053300     MOVE    "READ-TEST-F1-02"  TO PAR-NAME.                      IX1034.2 179
   000531         053400     MOVE    "READ SEQUENTIAL  "  TO FEATURE.                     IX1034.2 175
   000532         053500*                                                                 IX1034.2
   000533         053600*  TEST   2                                                       IX1034.2
   000534         053700*                                                                 IX1034.2
   000535         053800     IF       WRK-CS-09V00-007 EQUAL TO 400                       IX1034.2 107
   000536      1  053900              PERFORM PASS                                        IX1034.2 367
   000537         054000              ELSE                                                IX1034.2
   000538      1  054100              MOVE "NON-UPDATED RECORDS" TO COMPUTED-A            IX1034.2 190
   000539      1  054200              MOVE  WRK-CS-09V00-007 TO CORRECT-18V0              IX1034.2 107 210
   000540      1  054300              MOVE "SHOULD BE 400; IX-28 4.5.2" TO RE-MARK        IX1034.2 184
   000541      1  054400              PERFORM FAIL.                                       IX1034.2 368
   000542         054500     PERFORM  PRINT-DETAIL.                                       IX1034.2 371
   000543         054600 READ-TEST-F1-03.                                                 IX1034.2
   000544         054700     MOVE    "READ-TEST-F1-03"  TO PAR-NAME.                      IX1034.2 179
   000545         054800     MOVE    "READ SEQUENTIAL  "  TO FEATURE.                     IX1034.2 175
   000546         054900*                                                                 IX1034.2
   000547         055000*  TEST   3                                                       IX1034.2
   000548         055100*                                                                 IX1034.2
   000549         055200     IF      WRK-CS-09V00-008 EQUAL TO 100                        IX1034.2 108
   000550      1  055300              PERFORM PASS                                        IX1034.2 367
   000551         055400              ELSE                                                IX1034.2
   000552      1  055500             MOVE WRK-CS-09V00-008 TO COMPUTED-18V0               IX1034.2 108 197
   000553      1  055600             MOVE 100             TO  CORRECT-18V0                IX1034.2 210
   000554      1  055700              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1034.2 184
   000555      1  055800              PERFORM FAIL.                                       IX1034.2 368
   000556         055900     PERFORM  PRINT-DETAIL.                                       IX1034.2 371
   000557         056000 READ-TEST-F1-04.                                                 IX1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000558         056100     MOVE    "READ-TEST-F1-04"  TO PAR-NAME.                      IX1034.2 179
   000559         056200     MOVE    "READ SEQUENTIAL  "  TO FEATURE.                     IX1034.2 175
   000560         056300*                                                                 IX1034.2
   000561         056400*  TEST   4                                                       IX1034.2
   000562         056500*                                                                 IX1034.2
   000563         056600     IF      WRK-CS-09V00-009 EQUAL TO ZERO                       IX1034.2 109 IMP
   000564      1  056700             PERFORM PASS                                         IX1034.2 367
   000565         056800             ELSE                                                 IX1034.2
   000566      1  056900             MOVE WRK-CS-09V00-009 TO COMPUTED-18V0               IX1034.2 109 197
   000567      1  057000             MOVE  ZERO            TO CORRECT-18V0                IX1034.2 IMP 210
   000568      1  057100             MOVE "BAD-UPDATES" TO RE-MARK                        IX1034.2 184
   000569      1  057200             PERFORM FAIL.                                        IX1034.2 368
   000570         057300     PERFORM PRINT-DETAIL.                                        IX1034.2 371
   000571         057400 READ-TEST-F1-05.                                                 IX1034.2
   000572         057500     MOVE    "READ-TEST-F1-05"  TO PAR-NAME.                      IX1034.2 179
   000573         057600     MOVE    "READ SEQUENTIAL  "  TO FEATURE.                     IX1034.2 175
   000574         057700*                                                                 IX1034.2
   000575         057800*  TEST   5                                                       IX1034.2
   000576         057900*                                                                 IX1034.2
   000577         058000     IF      WRK-CS-09V00-010 EQUAL TO ZERO                       IX1034.2 110 IMP
   000578      1  058100             PERFORM PASS                                         IX1034.2 367
   000579         058200             ELSE                                                 IX1034.2
   000580      1  058300             MOVE WRK-CS-09V00-010 TO COMPUTED-18V0               IX1034.2 110 197
   000581      1  058400             MOVE ZERO             TO CORRECT-18V0                IX1034.2 IMP 210
   000582      1  058500             MOVE "KEY VS RECORD; IX-28" TO RE-MARK               IX1034.2 184
   000583      1  058600             PERFORM FAIL.                                        IX1034.2 368
   000584         058700     PERFORM PRINT-DETAIL.                                        IX1034.2 371
   000585         058800     CLOSE    IX-FS1.                                             IX1034.2 94
   000586         058900 DELETE-INIT-GF-01.                                               IX1034.2
   000587         059000*                                                                 IX1034.2
   000588         059100*  TEST   1                                                       IX1034.2
   000589         059200*                                                                 IX1034.2
   000590         059300     MOVE     "DELETE-TEST-GF-01" TO PAR-NAME                     IX1034.2 179
   000591         059400     OPEN     I-O IX-FS1.                                         IX1034.2 94
   000592         059500     MOVE     ZERO TO WRK-CS-09V00-006                            IX1034.2 IMP 106
   000593         059600     MOVE     ZERO TO WRK-CS-09V00-007                            IX1034.2 IMP 107
   000594         059700     MOVE     ZERO TO WRK-CS-09V00-008                            IX1034.2 IMP 108
   000595         059800     MOVE     ZERO TO WRK-CS-09V00-009                            IX1034.2 IMP 109
   000596         059900     MOVE     ZERO TO WRK-CS-09V00-010                            IX1034.2 IMP 110
   000597         060000     MOVE     ZERO TO WRK-CS-09V00-011                            IX1034.2 IMP 111
   000598         060100     MOVE     SPACE TO  FILE-RECORD-INFO (1).                     IX1034.2 IMP 137
   000599         060200     MOVE    "DELETE   "   TO FEATURE.                            IX1034.2 175
   000600         060300 DELETE-TEST-GF-01.                                               IX1034.2
   000601         060400     ADD      1 TO WRK-CS-09V00-006                               IX1034.2 106
   000602         060500     ADD      1 TO WRK-CS-09V00-007.                              IX1034.2 107
   000603         060600     READ     IX-FS1                                              IX1034.2 94
   000604         060700              AT END                                              IX1034.2
   000605      1  060800             MOVE  "AT END PATH TAKEN"  TO RE-MARK                IX1034.2 184
   000606      1  060900             GO TO  DELETE-TEST-GF-01-3.                          IX1034.2 622
   000607         061000     MOVE     IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).           IX1034.2 99 137
   000608         061100     IF       WRK-CS-09V00-007  EQUAL TO 4                        IX1034.2 107
   000609      1  061200              GO TO DELETE-TEST-GF-01-2.                          IX1034.2 614
   000610         061300     IF       WRK-CS-09V00-006 GREATER 501                        IX1034.2 106
   000611      1  061400              MOVE  "AT END NOT TAKEN"  TO RE-MARK                IX1034.2 184
   000612      1  061500              GO TO DELETE-TEST-GF-01-3.                          IX1034.2 622
   000613         061600     GO TO    DELETE-TEST-GF-01.                                  IX1034.2 600
   000614         061700 DELETE-TEST-GF-01-2.                                             IX1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000615         061800     MOVE  CCVS-PGM-ID  TO  XPROGRAM-NAME (1).                    IX1034.2 312 152
   000616         061900     MOVE  99 TO UPDATE-NUMBER (1).                               IX1034.2 148
   000617         062000     MOVE     FILE-RECORD-INFO (1) TO IX-FS1R1-F-G-240.           IX1034.2 137 99
   000618         062100     DELETE   IX-FS1.                                             IX1034.2 94
   000619         062200     MOVE     ZERO TO  WRK-CS-09V00-007.                          IX1034.2 IMP 107
   000620         062300     ADD      1 TO  WRK-CS-09V00-008                              IX1034.2 108
   000621         062400     GO TO    DELETE-TEST-GF-01.                                  IX1034.2 600
   000622         062500 DELETE-TEST-GF-01-3.                                             IX1034.2
   000623         062600     IF       WRK-CS-09V00-006 NOT EQUAL TO 501                   IX1034.2 106
   000624      1  062700              MOVE WRK-CS-09V00-006 TO COMPUTED-18V0              IX1034.2 106 197
   000625      1  062800              MOVE              501 TO CORRECT-18V0               IX1034.2 210
   000626      1  062900              MOVE "IX-21 4.3.2                       " TO RE-MARKIX1034.2 184
   000627      1  063000              PERFORM FAIL                                        IX1034.2 368
   000628         063100              ELSE                                                IX1034.2
   000629      1  063200              PERFORM PASS.                                       IX1034.2 367
   000630         063300     PERFORM  PRINT-DETAIL.                                       IX1034.2 371
   000631         063400 DELETE-TEST-GF-02.                                               IX1034.2
   000632         063500     MOVE     "DELETE-TEST-GF-02" TO PAR-NAME                     IX1034.2 179
   000633         063600     MOVE    "DELETE   "   TO FEATURE.                            IX1034.2 175
   000634         063700*                                                                 IX1034.2
   000635         063800*  TEST   2                                                       IX1034.2
   000636         063900*                                                                 IX1034.2
   000637         064000     IF       WRK-CS-09V00-008 NOT EQUAL TO 125                   IX1034.2 108
   000638      1  064100              MOVE WRK-CS-09V00-008 TO COMPUTED-18V0              IX1034.2 108 197
   000639      1  064200              MOVE 125              TO CORRECT-18V0               IX1034.2 210
   000640      1  064300              MOVE "DELETED RECORDS" TO RE-MARK                   IX1034.2 184
   000641      1  064400              PERFORM FAIL                                        IX1034.2 368
   000642         064500              ELSE                                                IX1034.2
   000643      1  064600              PERFORM PASS.                                       IX1034.2 367
   000644         064700     PERFORM  PRINT-DETAIL.                                       IX1034.2 371
   000645         064800 DELETE-TEST-GF-03.                                               IX1034.2
   000646         064900     MOVE     "DELETE-TEST-GF-03" TO PAR-NAME                     IX1034.2 179
   000647         065000     MOVE    "DELETE   "   TO FEATURE.                            IX1034.2 175
   000648         065100*                                                                 IX1034.2
   000649         065200*  TEST   3                                                       IX1034.2
   000650         065300*                                                                 IX1034.2
   000651         065400       IF WRK-CS-09V00-009 EQUAL TO ZERO                          IX1034.2 109 IMP
   000652      1  065500         PERFORM PASS                                             IX1034.2 367
   000653         065600         ELSE                                                     IX1034.2
   000654      1  065700         PERFORM FAIL                                             IX1034.2 368
   000655      1  065800         MOVE WRK-CS-09V00-009 TO COMPUTED-18V0                   IX1034.2 109 197
   000656      1  065900         MOVE ZERO TO CORRECT-18V0                                IX1034.2 IMP 210
   000657      1  066000         MOVE "INVALID KEY" TO RE-MARK.                           IX1034.2 184
   000658         066100       PERFORM PRINT-DETAIL.                                      IX1034.2 371
   000659         066200     CLOSE    IX-FS1.                                             IX1034.2 94
   000660         066300 DELETE-INIT-GF-04.                                               IX1034.2
   000661         066400     MOVE     "DELETE-TEST-GF-04" TO PAR-NAME                     IX1034.2 179
   000662         066500     MOVE    "DELETE   "   TO FEATURE.                            IX1034.2 175
   000663         066600*                                                                 IX1034.2
   000664         066700*  TEST   4                                                       IX1034.2
   000665         066800*                                                                 IX1034.2
   000666         066900     MOVE     "DELETE-TEST-GF-04" TO PAR-NAME.                    IX1034.2 179
   000667         067000     MOVE     ZERO TO   WRK-CS-09V00-006                          IX1034.2 IMP 106
   000668         067100     MOVE     ZERO TO   WRK-CS-09V00-007                          IX1034.2 IMP 107
   000669         067200     MOVE     ZERO TO   WRK-CS-09V00-008                          IX1034.2 IMP 108
   000670         067300     MOVE     ZERO TO   WRK-CS-09V00-009                          IX1034.2 IMP 109
   000671         067400     MOVE     ZERO TO   WRK-CS-09V00-010                          IX1034.2 IMP 110
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000672         067500     MOVE     ZERO TO   WRK-CS-09V00-011                          IX1034.2 IMP 111
   000673         067600     MOVE     SPACE  TO  FILE-RECORD-INFO (1).                    IX1034.2 IMP 137
   000674         067700     MOVE    ZERO TO WRK-DU-09V00-001.                            IX1034.2 IMP 115
   000675         067800     OPEN     INPUT  IX-FS1.                                      IX1034.2 94
   000676         067900 DELETE-TEST-GF-04.                                               IX1034.2
   000677         068000     ADD      1 TO WRK-CS-09V00-006.                              IX1034.2 106
   000678         068100     ADD      1 TO WRK-CS-09V00-007.                              IX1034.2 107
   000679         068200     ADD      1 TO WRK-CS-09V00-008.                              IX1034.2 108
   000680         068300     READ     IX-FS1  AT END  GO TO DELETE-TEST-GF-04-3.          IX1034.2 94 696
   000681         068400     MOVE     IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).           IX1034.2 99 137
   000682         068500     IF       UPDATE-NUMBER (1) EQUAL TO 99                       IX1034.2 148
   000683      1  068600              ADD  1 TO WRK-CS-09V00-009.                         IX1034.2 109
   000684         068700     IF       WRK-CS-09V00-007  EQUAL TO 4                        IX1034.2 107
   000685      1  068800              MOVE 01 TO WRK-CS-09V00-007                         IX1034.2 107
   000686      1  068900              ADD 1 TO WRK-CS-09V00-008.                          IX1034.2 108
   000687         069000     MOVE    XRECORD-KEY (1)  TO  IX-WRK-KEY.                     IX1034.2 167 113
   000688         069100     MOVE    WRK-CS-09V00-008  TO WRK-DU-09V00-001.               IX1034.2 108 115
   000689         069200     IF      IX-WRK-KEY  EQUAL TO IX-FS1-KEY                      IX1034.2 113 103
   000690      1  069300              ADD 1 TO  WRK-CS-09V00-010.                         IX1034.2 110
   000691         069400     IF       XRECORD-NUMBER (1) EQUAL TO  WRK-CS-09V00-008       IX1034.2 146 108
   000692      1  069500              ADD 1 TO  WRK-CS-09V00-011.                         IX1034.2 111
   000693         069600     IF       WRK-CS-09V00-006 GREATER  501                       IX1034.2 106
   000694      1  069700              GO TO DELETE-TEST-GF-04-3.                          IX1034.2 696
   000695         069800     GO TO    DELETE-TEST-GF-04.                                  IX1034.2 676
   000696         069900 DELETE-TEST-GF-04-3.                                             IX1034.2
   000697         070000     IF       WRK-CS-09V00-006 NOT EQUAL TO 376                   IX1034.2 106
   000698      1  070100              MOVE "INCORRECT RECORD COUNT"  TO RE-MARK           IX1034.2 184
   000699      1  070200              MOVE WRK-CS-09V00-006 TO COMPUTED-18V0              IX1034.2 106 197
   000700      1  070300              MOVE 376 TO CORRECT-18V0                            IX1034.2 210
   000701      1  070400              MOVE "IX-21 4.3.2                       " TO RE-MARKIX1034.2 184
   000702      1  070500              PERFORM  FAIL                                       IX1034.2 368
   000703         070600              ELSE                                                IX1034.2
   000704      1  070700              PERFORM  PASS.                                      IX1034.2 367
   000705         070800     PERFORM  PRINT-DETAIL.                                       IX1034.2 371
   000706         070900 DELETE-TEST-GF-05.                                               IX1034.2
   000707         071000     MOVE     "DELETE-TEST-GF-05" TO PAR-NAME                     IX1034.2 179
   000708         071100     MOVE    "DELETE   "   TO FEATURE.                            IX1034.2 175
   000709         071200*                                                                 IX1034.2
   000710         071300*  TEST   5                                                       IX1034.2
   000711         071400*                                                                 IX1034.2
   000712         071500     IF       WRK-CS-09V00-009 NOT EQUAL TO ZERO                  IX1034.2 109 IMP
   000713      1  071600             MOVE    ZERO TO CORRECT-18V0                         IX1034.2 IMP 210
   000714      1  071700              MOVE WRK-CS-09V00-009 TO COMPUTED-18V0              IX1034.2 109 197
   000715      1  071800              MOVE "DELETED RECORDS" TO RE-MARK                   IX1034.2 184
   000716      1  071900              MOVE "IX-21 4.3.2                       " TO RE-MARKIX1034.2 184
   000717      1  072000              PERFORM FAIL                                        IX1034.2 368
   000718         072100              ELSE                                                IX1034.2
   000719      1  072200              PERFORM PASS.                                       IX1034.2 367
   000720         072300     PERFORM  PRINT-DETAIL.                                       IX1034.2 371
   000721         072400 DELETE-TEST-GF-06.                                               IX1034.2
   000722         072500     MOVE     "DELETE-TEST-GF-06" TO PAR-NAME                     IX1034.2 179
   000723         072600     MOVE    "DELETE   "   TO FEATURE.                            IX1034.2 175
   000724         072700*                                                                 IX1034.2
   000725         072800*  TEST   6                                                       IX1034.2
   000726         072900*                                                                 IX1034.2
   000727         073000     IF       WRK-CS-09V00-010 NOT EQUAL TO 375                   IX1034.2 110
   000728      1  073100             MOVE    375  TO CORRECT-18V0                         IX1034.2 210
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000729      1  073200              MOVE "KEY MISMATCH" TO RE-MARK                      IX1034.2 184
   000730      1  073300              MOVE WRK-CS-09V00-010 TO COMPUTED-18V0              IX1034.2 110 197
   000731      1  073400              MOVE "IX-21 4.3.2                       " TO RE-MARKIX1034.2 184
   000732      1  073500              PERFORM FAIL                                        IX1034.2 368
   000733         073600              ELSE                                                IX1034.2
   000734      1  073700              PERFORM PASS.                                       IX1034.2 367
   000735         073800     PERFORM  PRINT-DETAIL.                                       IX1034.2 371
   000736         073900 DELETE-TEST-GF-07.                                               IX1034.2
   000737         074000     MOVE     "DELETE-TEST-GF-07" TO PAR-NAME                     IX1034.2 179
   000738         074100     MOVE    "DELETE   "   TO FEATURE.                            IX1034.2 175
   000739         074200*                                                                 IX1034.2
   000740         074300*  TEST   7                                                       IX1034.2
   000741         074400*                                                                 IX1034.2
   000742         074500     IF      WRK-CS-09V00-011  NOT EQUAL TO  375                  IX1034.2 111
   000743      1  074600             MOVE   375  TO CORRECT-18V0                          IX1034.2 210
   000744      1  074700             MOVE   "INCORRECT RECORD FOUND"  TO RE-MARK          IX1034.2 184
   000745      1  074800             MOVE   WRK-CS-09V00-011  TO COMPUTED-18V0            IX1034.2 111 197
   000746      1  074900              MOVE "IX-21 4.3.2                       " TO RE-MARKIX1034.2 184
   000747      1  075000             PERFORM   FAIL                                       IX1034.2 368
   000748         075100             ELSE                                                 IX1034.2
   000749      1  075200             PERFORM   PASS.                                      IX1034.2 367
   000750         075300     PERFORM   PRINT-DETAIL.                                      IX1034.2 371
   000751         075400     CLOSE    IX-FS1.                                             IX1034.2 94
   000752         075500 CCVS-EXIT SECTION.                                               IX1034.2
   000753         075600 CCVS-999999.                                                     IX1034.2
   000754         075700     GO TO CLOSE-FILES.                                           IX1034.2 348
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      169   ALTERNATE-KEY1
      171   ALTERNATE-KEY2
      235   ANSI-REFERENCE . . . . . . . .  450 457 466
       90   C-ABORT. . . . . . . . . . . .  M329 M352
       84   C-ALL. . . . . . . . . . . . .  M354
       80   C-DATE . . . . . . . . . . . .  M331
       86   C-DELETED. . . . . . . . . . .  M356
       85   C-FAIL . . . . . . . . . . . .  M355
       89   C-INDENT
       87   C-INSPECT. . . . . . . . . . .  M357
       82   C-NO-OF-TESTS. . . . . . . . .  M330
       88   C-NOTE
       83   C-OK . . . . . . . . . . . . .  M353
       81   C-TIME . . . . . . . . . . . .  M332
      214   CCVS-C-1 . . . . . . . . . . .  389 435
      219   CCVS-C-2 . . . . . . . . . . .  390 436
      269   CCVS-E-1 . . . . . . . . . . .  395
      274   CCVS-E-2 . . . . . . . . . . .  404 411 418 423
      277   CCVS-E-2-2 . . . . . . . . . .  M403
      282   CCVS-E-3 . . . . . . . . . . .  424
      291   CCVS-E-4 . . . . . . . . . . .  403
      292   CCVS-E-4-1 . . . . . . . . . .  M401
      294   CCVS-E-4-2 . . . . . . . . . .  M402
      236   CCVS-H-1 . . . . . . . . . . .  384 431
      241   CCVS-H-2A. . . . . . . . . . .  385 432
      250   CCVS-H-2B. . . . . . . . . . .  386 433
      262   CCVS-H-3 . . . . . . . . . . .  387 434
      312   CCVS-PGM-ID. . . . . . . . . .  327 337 337 350 615
      156   CHARS-OR-RECORDS
      196   CM-18V0
      190   COMPUTED-A . . . . . . . . . .  191 193 194 195 196 462 465 M487 M538
      191   COMPUTED-N
      189   COMPUTED-X . . . . . . . . . .  M379 447
      193   COMPUTED-0V18
      195   COMPUTED-14V4
      197   COMPUTED-18V0. . . . . . . . .  M522 M552 M566 M580 M624 M638 M655 M699 M714 M730 M745
      194   COMPUTED-4V14
      213   COR-ANSI-REFERENCE . . . . . .  M457 M459
      204   CORRECT-A. . . . . . . . . . .  205 206 207 208 209 463 465 M489
      205   CORRECT-N
      203   CORRECT-X. . . . . . . . . . .  M380 449
      206   CORRECT-0V18
      208   CORRECT-14V4
      210   CORRECT-18V0 . . . . . . . . .  M523 M539 M553 M567 M581 M625 M639 M656 M700 M713 M728 M743
      207   CORRECT-4V14
      209   CR-18V0
      227   DELETE-COUNTER . . . . . . . .  356 M369 398 414 416
      182   DOTVALUE . . . . . . . . . . .  M374
      233   DUMMY-HOLD . . . . . . . . . .  M428 438
       93   DUMMY-RECORD . . . . . . . . .  M384 M385 M386 M387 M389 M390 M391 M393 M395 M404 M411 M418 M423 M424 428 M429
                                            430 M431 M432 M433 M434 M435 M436 M437 M438 442 M443 M452 M467
      121   DUMMY-WRK-INDENT-5
      117   DUMMY-WRK-REC
      118   DUMMY-WRK1 . . . . . . . . . .  119
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    18
0 Defined   Cross-reference of data names   References

0     119   DUMMY-WRK2
      280   ENDER-DESC . . . . . . . . . .  M406 M417 M422
      228   ERROR-COUNTER. . . . . . . . .  355 M368 397 407 410
      232   ERROR-HOLD . . . . . . . . . .  354 M397 M398 M398 M399 402
      278   ERROR-TOTAL. . . . . . . . . .  M408 M410 M415 M416 M420 M421
      175   FEATURE. . . . . . . . . . . .  M491 M494 M516 M531 M545 M559 M573 M599 M633 M647 M662 M708 M723 M738
      137   FILE-RECORD-INFO . . . . . . .  M345 M485 M499 M598 M607 617 M673 M681
      138   FILE-RECORD-INFO-P1-120
      165   FILE-RECORD-INFO-P121-240
      123   FILE-RECORD-INFO-SKELETON. . .  344
      122   FILE-RECORD-INFORMATION-REC
      306   HYPHEN-LINE. . . . . . . . . .  391 393 437
      112   I-O-ERROR-IX-FS1
      272   ID-AGAIN . . . . . . . . . . .  M337
      305   INF-ANSI-REFERENCE . . . . . .  M450 M453 M466 M468
      300   INFO-TEXT. . . . . . . . . . .  M451
      229   INSPECT-COUNTER. . . . . . . .  357 M366 397 419 421
       94   IX-FS1 . . . . . . . . . . . .  66 318 477 497 585 591 603 M618 659 675 680 751
      103   IX-FS1-KEY . . . . . . . . . .  70 487 689
      100   IX-FS1-REC-120
      101   IX-FS1-REC-120-240
       99   IX-FS1R1-F-G-240 . . . . . . .  499 607 M617 681
      113   IX-WRK-KEY . . . . . . . . . .  M508 M687 689
      150   ODO-NUMBER
      177   P-OR-F . . . . . . . . . . . .  M366 M367 M368 M369 376 M379 M488
      179   PAR-NAME . . . . . . . . . . .  M381 M478 M493 M515 M530 M544 M558 M572 M590 M632 M646 M661 M666 M707 M722 M737
      181   PARDOT-X . . . . . . . . . . .  M373
      230   PASS-COUNTER . . . . . . . . .  353 M367 399 401
       91   PRINT-FILE . . . . . . . . . .  64 336 361
       92   PRINT-REC. . . . . . . . . . .  M375 M456 M458
       76   RAW-DATA . . . . . . . . . . .  59 326 328 335 349 351 360
       79   RAW-DATA-KEY . . . . . . . . .  63 M327 M350
       78   RAW-DATA-SATZ. . . . . . . . .  333 358
      184   RE-MARK. . . . . . . . . . . .  M370 M382 M490 M521 M524 M540 M554 M568 M582 M605 M611 M626 M640 M657 M698 M701
                                            M715 M716 M729 M731 M744 M746
      226   REC-CT . . . . . . . . . . . .  372 374 381
      225   REC-SKL-SUB. . . . . . . . . .  M340 M343 345
      234   RECORD-COUNT . . . . . . . . .  M426 427 M439
      160   RECORDS-IN-FILE
      144   REELUNIT-NUMBER
      185   TEST-COMPUTED. . . . . . . . .  456
      200   TEST-CORRECT . . . . . . . . .  458
      253   TEST-ID. . . . . . . . . . . .  M337
      173   TEST-RESULTS . . . . . . . . .  M338 375
      231   TOTAL-ERROR
      148   UPDATE-NUMBER. . . . . . . . .  500 503 M616 682
      106   WRK-CS-09V00-006 . . . . . . .  M479 M496 511 520 522 M592 M601 610 623 624 M667 M677 693 697 699
      107   WRK-CS-09V00-007 . . . . . . .  M480 M501 535 539 M593 M602 608 M619 M668 M678 684 M685
      108   WRK-CS-09V00-008 . . . . . . .  M481 M504 549 552 M594 M620 637 638 M669 M679 M686 688 691
      109   WRK-CS-09V00-009 . . . . . . .  M320 M482 M506 563 566 M595 651 655 M670 M683 712 714
      110   WRK-CS-09V00-010 . . . . . . .  M483 M510 577 580 M596 M671 M690 727 730
      111   WRK-CS-09V00-011 . . . . . . .  M484 M597 M672 M692 742 745
      115   WRK-DU-09V00-001 . . . . . . .  M486 509 M674 M688
      158   XBLOCK-SIZE
      140   XFILE-NAME
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    19
0 Defined   Cross-reference of data names   References

0     162   XFILE-ORGANIZATION
      164   XLABEL-TYPE
      152   XPROGRAM-NAME. . . . . . . . .  M615
      167   XRECORD-KEY. . . . . . . . . .  508 687
      154   XRECORD-LENGTH
      142   XRECORD-NAME
      146   XRECORD-NUMBER . . . . . . . .  509 691
      302   XXCOMPUTED . . . . . . . . . .  M465
      304   XXCORRECT. . . . . . . . . . .  M465
      297   XXINFO . . . . . . . . . . . .  452 467
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    20
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

      461   BAIL-OUT . . . . . . . . . . .  P378
      469   BAIL-OUT-EX. . . . . . . . . .  E378 G463
      464   BAIL-OUT-WRITE . . . . . . . .  G462
      444   BLANK-LINE-PRINT
      752   CCVS-EXIT
      346   CCVS-INIT-EXIT
      342   CCVS-INIT-FILE . . . . . . . .  P341
      753   CCVS-999999
      324   CCVS1
      470   CCVS1-EXIT . . . . . . . . . .  G347
      348   CLOSE-FILES. . . . . . . . . .  G754
      388   COLUMN-NAMES-ROUTINE . . . . .  E339
      369   DE-LETE
      586   DELETE-INIT-GF-01
      660   DELETE-INIT-GF-04
      600   DELETE-TEST-GF-01. . . . . . .  G613 G621
      614   DELETE-TEST-GF-01-2. . . . . .  G609
      622   DELETE-TEST-GF-01-3. . . . . .  G606 G612
      631   DELETE-TEST-GF-02
      645   DELETE-TEST-GF-03
      676   DELETE-TEST-GF-04. . . . . . .  G695
      696   DELETE-TEST-GF-04-3. . . . . .  G680 G694
      706   DELETE-TEST-GF-05
      721   DELETE-TEST-GF-06
      736   DELETE-TEST-GF-07
      334   END-E-1. . . . . . . . . . . .  G328 G333
      359   END-E-2. . . . . . . . . . . .  G351 G358
      392   END-ROUTINE. . . . . . . . . .  P361
      396   END-ROUTINE-1
      405   END-ROUTINE-12
      413   END-ROUTINE-13 . . . . . . . .  E361
      394   END-RTN-EXIT
      368   FAIL . . . . . . . . . . . . .  P525 P541 P555 P569 P583 P627 P641 P654 P702 P717 P732 P747
      446   FAIL-ROUTINE . . . . . . . . .  P377
      460   FAIL-ROUTINE-EX. . . . . . . .  E377 G454
      455   FAIL-ROUTINE-WRITE . . . . . .  G448 G449
      383   HEAD-ROUTINE . . . . . . . . .  P339
      366   INSPT
      473   INX-INIT-006
      495   INX-TEST-006-R . . . . . . . .  G513
      507   INX-TEST-006-2 . . . . . . . .  G502 G505
      325   OPEN-FILES
      367   PASS . . . . . . . . . . . . .  P527 P536 P550 P564 P578 P629 P643 P652 P704 P719 P734 P749
      371   PRINT-DETAIL . . . . . . . . .  P492 P528 P542 P556 P570 P584 P630 P644 P658 P705 P720 P735 P750
      514   READ-TEST-F1-01. . . . . . . .  G498 G512
      529   READ-TEST-F1-02
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    21
0 Defined   Cross-reference of procedures   References

0     543   READ-TEST-F1-03
      557   READ-TEST-F1-04
      571   READ-TEST-F1-05
      472   SECT-IX-03-001
      364   TERMINATE-CALL
      362   TERMINATE-CCVS
      316   USE-IX103-TEST
      321   USE-PAR-EXIT
      319   USE-PAR-001
      425   WRITE-LINE . . . . . . . . . .  P375 P376 P384 P385 P386 P387 P389 P390 P391 P393 P395 P404 P412 P418 P423 P424
                                            P452 P456 P458 P467
      441   WRT-LN . . . . . . . . . . . .  P431 P432 P433 P434 P435 P436 P437 P440 P445
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    22
0 Defined   Cross-reference of programs     References

        3   IX103A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX103A    Date 06/04/2022  Time 11:57:35   Page    23
0LineID  Message code  Message text

     68  IGYDS1298-I   Assignment-name "XXXXD044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXD044" was treated as comments.

     91  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     94  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     94  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       4           4
-* Statistics for COBOL program IX103A:
 *    Source records = 754
 *    Data Division statements = 114
 *    Procedure Division statements = 375
 *    Generated COBOL statements = 0
 *    Program complexity factor = 384
0End of compilation 1,  program IX103A,  highest severity 0.
0Return code 0
