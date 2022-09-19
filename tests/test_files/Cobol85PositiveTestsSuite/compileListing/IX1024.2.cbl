1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:58   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:58   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1024.2
   000002         000200 PROGRAM-ID.                                                      IX1024.2
   000003         000300     IX102A.                                                      IX1024.2
   000004         000500*                                                              *  IX1024.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1024.2
   000006         000700*                                                              *  IX1024.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1024.2
   000008         000900*                                                              *  IX1024.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1024.2
   000010         001100*                                                              *  IX1024.2
   000011         001300*                                                                 IX1024.2
   000012         001400*         NEW TEST:                                               IX1024.2
   000013         001500*                  SELECT ... ASSIGN TO <LITERAL-1> ...           IX1024.2
   000014         001600*                                                                 IX1024.2
   000015         001700*         NOTE: <LITERAL-1> WILL BE ASSIGNED BY THE X-CARD X-24.  IX1024.2
   000016         001800*               X-24 SHOULD ASSIGN  A <LITERAL-1>}                IX1024.2
   000017         001900*                                                                 IX1024.2
   000018         002000*                                                                 IX1024.2
   000019         002100*    THE FUNCTION OF THIS PROGRAM IS TO PROCESS AN INDEXED FILE   IX1024.2
   000020         002200*    RANDOMLY (ACCESS MODE IS RANDOM).  THE FILE USED AS INPUT IS IX1024.2
   000021         002300*    THAT CREATED BY IX101.                                       IX1024.2
   000022         002400*                                                                 IX1024.2
   000023         002500*    FIRST THE FILE IS VERIFIED AS TO THE EXISTANCE AND ACCURACY  IX1024.2
   000024         002600*    OF THE 500 RECORDS CREATED IN IX101.  SECONDLY, RECORDS      IX1024.2
   000025         002700*    OF THE FILE ARE SELECTIVELY UPDATED; AND THIRDLY, THE        IX1024.2
   000026         002800*    ACCURACY OF EACH RECORD IN THE FILE IS AGAIN VERIFIED.       IX1024.2
   000027         002900*                                                                 IX1024.2
   000028         003000*                                                                 IX1024.2
   000029         003100*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX1024.2
   000030         003200*                                                                 IX1024.2
   000031         003300*             X-24   INDEXED FILE <LITERAL-1>      IN ASSGN TO    IX1024.2
   000032         003400*                    CLAUSE FOR DATA FILE IX-FS1                  IX1024.2
   000033         003500*             X-44   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX1024.2
   000034         003600*                    CLAUSE FOR INDEX FILE IX-FS1                 IX1024.2
   000035         003700*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX1024.2
   000036         003800*             X-62   IMPLEMENTOR-NAME FOR RAW-DATA                IX1024.2
   000037         003900*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX1024.2
   000038         004000*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX1024.2
   000039         004100*                                                                 IX1024.2
   000040         004200*         NOTE:  X-CARDS 44 AND 62          ARE OPTIONAL          IX1024.2
   000041         004300*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX1024.2
   000042         004400*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX1024.2
   000043         004500*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX1024.2
   000044         004600*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX1024.2
   000045         004700*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX1024.2
   000046         004800*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX1024.2
   000047         004900*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX1024.2
   000048         005000*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX1024.2
   000049         005100*               THEY ARE AS FOLLOWS                               IX1024.2
   000050         005200*                                                                 IX1024.2
   000051         005300*                  J  SELECTS X-CARD 44                           IX1024.2
   000052         005400*                  P  SELECTS X-CARD 62                           IX1024.2
   000053         005500*                                                                 IX1024.2
   000054         005700 ENVIRONMENT DIVISION.                                            IX1024.2
   000055         005800 CONFIGURATION SECTION.                                           IX1024.2
   000056         005900 SOURCE-COMPUTER.                                                 IX1024.2
   000057         006000     XXXXX082.                                                    IX1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100 OBJECT-COMPUTER.                                                 IX1024.2
   000059         006200     XXXXX083.                                                    IX1024.2
   000060         006300 INPUT-OUTPUT SECTION.                                            IX1024.2
   000061         006400 FILE-CONTROL.                                                    IX1024.2
   000062         006500     SELECT RAW-DATA   ASSIGN TO                                  IX1024.2 78
   000063         006600     XXXXX062                                                     IX1024.2
   000064         006700            ORGANIZATION IS INDEXED                               IX1024.2
   000065         006800            ACCESS MODE IS RANDOM                                 IX1024.2
   000066         006900            RECORD KEY IS RAW-DATA-KEY.                           IX1024.2 81
   000067         007000     SELECT PRINT-FILE ASSIGN TO                                  IX1024.2 93
   000068         007100     XXXXX055.                                                    IX1024.2
   000069         007200     SELECT   IX-FS1 ASSIGN                                       IX1024.2 96
   000070         007300     XXXXP024                                                     IX1024.2
   000071         007400     XXXXP044                                                     IX1024.2

 ==000071==> IGYDS1298-I Assignment-name "XXXXP044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXP044" was treated as comments.

   000072         007500        ACCESS MODE IS RANDOM                                     IX1024.2
   000073         007600        ORGANIZATION INDEXED                                      IX1024.2
   000074         007700     RECORD KEY IX-FS1-KEY.                                       IX1024.2 105
   000075         007800 DATA DIVISION.                                                   IX1024.2
   000076         007900 FILE SECTION.                                                    IX1024.2
   000077         008000                                                                  IX1024.2
   000078         008100 FD  RAW-DATA.                                                    IX1024.2
   000079         008200                                                                  IX1024.2
   000080         008300 01  RAW-DATA-SATZ.                                               IX1024.2
   000081         008400     05  RAW-DATA-KEY        PIC X(6).                            IX1024.2
   000082         008500     05  C-DATE              PIC 9(6).                            IX1024.2
   000083         008600     05  C-TIME              PIC 9(8).                            IX1024.2
   000084         008700     05  C-NO-OF-TESTS       PIC 99.                              IX1024.2
   000085         008800     05  C-OK                PIC 999.                             IX1024.2
   000086         008900     05  C-ALL               PIC 999.                             IX1024.2
   000087         009000     05  C-FAIL              PIC 999.                             IX1024.2
   000088         009100     05  C-DELETED           PIC 999.                             IX1024.2
   000089         009200     05  C-INSPECT           PIC 999.                             IX1024.2
   000090         009300     05  C-NOTE              PIC X(13).                           IX1024.2
   000091         009400     05  C-INDENT            PIC X.                               IX1024.2
   000092         009500     05  C-ABORT             PIC X(8).                            IX1024.2
   000093         009600 FD  PRINT-FILE.                                                  IX1024.2

 ==000093==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000094         009700 01  PRINT-REC PICTURE X(120).                                    IX1024.2
   000095         009800 01  DUMMY-RECORD PICTURE X(120).                                 IX1024.2
   000096         009900 FD  IX-FS1                                                       IX1024.2

 ==000096==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000096==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000097         010000     LABEL RECORDS STANDARD                                       IX1024.2
   000098         010100     ; DATA RECORD IX-FS1R1-F-G-240                               IX1024.2 *
   000099         010200     BLOCK   1   RECORDS                                          IX1024.2
   000100         010300     RECORD    240  CHARACTERS.                                   IX1024.2
   000101         010400 01  IX-FS1R1-F-G-240.                                            IX1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000102         010500     05 IX-FS1-REC-120   PIC  X(120).                             IX1024.2
   000103         010600     05 IX-FS1-REC-120-240.                                       IX1024.2
   000104         010700        10 FILLER   PIC X(8).                                     IX1024.2
   000105         010800        10 IX-FS1-KEY   PIC X(29).                                IX1024.2
   000106         010900        10 FILLER        PIC X(83).                               IX1024.2
   000107         011000 WORKING-STORAGE SECTION.                                         IX1024.2
   000108         011100 01  WRK-CS-09V00 PIC S9(09)      USAGE COMP VALUE ZERO.          IX1024.2 IMP
   000109         011200 01  WRK-DS-09V00-002 PIC S9(9) VALUE ZERO.                       IX1024.2 IMP
   000110         011300 01  WRK-CS-09V00-002 PIC S9(09)       USAGE COMP VALUE ZERO.     IX1024.2 IMP
   000111         011400 01  I-O-ERROR-IX-FS1 PIC X(3) VALUE "NO ".                       IX1024.2
   000112         011500 01  WRK-CS-09V00-001 PIC S9(09)       USAGE COMP VALUE ZERO.     IX1024.2 IMP
   000113         011600 01  WRK-CS-09V00-004 PIC S9(09)       USAGE COMP VALUE ZERO.     IX1024.2 IMP
   000114         011700 01  WRK-CS-09V00-005 PIC S9(09)       USAGE COMP VALUE ZERO.     IX1024.2 IMP
   000115         011800 01  IX-WRK-KEY.                                                  IX1024.2
   000116         011900     02 FILLER   PIC  X(10)  VALUE "ABCDLKJXYZ".                  IX1024.2
   000117         012000     02  WRK-DU-09V00-001 PIC 9(9) VALUE ZERO.                    IX1024.2 IMP
   000118         012100     02 FILLER   PIC  X(10)  VALUE "ZIF,.$-+CD".                  IX1024.2
   000119         012200 01  DUMMY-WRK-REC.                                               IX1024.2
   000120         012300     02 DUMMY-WRK1       PIC X(120).                              IX1024.2
   000121         012400     02 DUMMY-WRK2  REDEFINES  DUMMY-WRK1.                        IX1024.2 120
   000122         012500        03 FILLER   PIC X(5).                                     IX1024.2
   000123         012600        03 DUMMY-WRK-INDENT-5  PIC X(115).                        IX1024.2
   000124         012700 01  FILE-RECORD-INFORMATION-REC.                                 IX1024.2
   000125         012800     03 FILE-RECORD-INFO-SKELETON.                                IX1024.2
   000126         012900        05 FILLER                 PICTURE X(48)       VALUE       IX1024.2
   000127         013000             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX1024.2
   000128         013100        05 FILLER                 PICTURE X(46)       VALUE       IX1024.2
   000129         013200             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX1024.2
   000130         013300        05 FILLER                 PICTURE X(26)       VALUE       IX1024.2
   000131         013400             ",LFIL=000000,ORG=  ,LBLR= ".                        IX1024.2
   000132         013500        05 FILLER                 PICTURE X(37)       VALUE       IX1024.2
   000133         013600             ",RECKEY=                             ".             IX1024.2
   000134         013700        05 FILLER                 PICTURE X(38)       VALUE       IX1024.2
   000135         013800             ",ALTKEY1=                             ".            IX1024.2
   000136         013900        05 FILLER                 PICTURE X(38)       VALUE       IX1024.2
   000137         014000             ",ALTKEY2=                             ".            IX1024.2
   000138         014100        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX1024.2 IMP
   000139         014200     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX1024.2
   000140         014300        05 FILE-RECORD-INFO-P1-120.                               IX1024.2
   000141         014400           07 FILLER              PIC X(5).                       IX1024.2
   000142         014500           07 XFILE-NAME           PIC X(6).                      IX1024.2
   000143         014600           07 FILLER              PIC X(8).                       IX1024.2
   000144         014700           07 XRECORD-NAME         PIC X(6).                      IX1024.2
   000145         014800           07 FILLER              PIC X(1).                       IX1024.2
   000146         014900           07 REELUNIT-NUMBER     PIC 9(1).                       IX1024.2
   000147         015000           07 FILLER              PIC X(7).                       IX1024.2
   000148         015100           07 XRECORD-NUMBER       PIC 9(6).                      IX1024.2
   000149         015200           07 FILLER              PIC X(6).                       IX1024.2
   000150         015300           07 UPDATE-NUMBER       PIC 9(2).                       IX1024.2
   000151         015400           07 FILLER              PIC X(5).                       IX1024.2
   000152         015500           07 ODO-NUMBER          PIC 9(4).                       IX1024.2
   000153         015600           07 FILLER              PIC X(5).                       IX1024.2
   000154         015700           07 XPROGRAM-NAME        PIC X(5).                      IX1024.2
   000155         015800           07 FILLER              PIC X(7).                       IX1024.2
   000156         015900           07 XRECORD-LENGTH       PIC 9(6).                      IX1024.2
   000157         016000           07 FILLER              PIC X(7).                       IX1024.2
   000158         016100           07 CHARS-OR-RECORDS    PIC X(2).                       IX1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000159         016200           07 FILLER              PIC X(1).                       IX1024.2
   000160         016300           07 XBLOCK-SIZE          PIC 9(4).                      IX1024.2
   000161         016400           07 FILLER              PIC X(6).                       IX1024.2
   000162         016500           07 RECORDS-IN-FILE     PIC 9(6).                       IX1024.2
   000163         016600           07 FILLER              PIC X(5).                       IX1024.2
   000164         016700           07 XFILE-ORGANIZATION   PIC X(2).                      IX1024.2
   000165         016800           07 FILLER              PIC X(6).                       IX1024.2
   000166         016900           07 XLABEL-TYPE          PIC X(1).                      IX1024.2
   000167         017000        05 FILE-RECORD-INFO-P121-240.                             IX1024.2
   000168         017100           07 FILLER              PIC X(8).                       IX1024.2
   000169         017200           07 XRECORD-KEY          PIC X(29).                     IX1024.2
   000170         017300           07 FILLER              PIC X(9).                       IX1024.2
   000171         017400           07 ALTERNATE-KEY1      PIC X(29).                      IX1024.2
   000172         017500           07 FILLER              PIC X(9).                       IX1024.2
   000173         017600           07 ALTERNATE-KEY2      PIC X(29).                      IX1024.2
   000174         017700           07 FILLER              PIC X(7).                       IX1024.2
   000175         017800 01  TEST-RESULTS.                                                IX1024.2
   000176         017900     02 FILLER                   PIC X      VALUE SPACE.          IX1024.2 IMP
   000177         018000     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1024.2 IMP
   000178         018100     02 FILLER                   PIC X      VALUE SPACE.          IX1024.2 IMP
   000179         018200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1024.2 IMP
   000180         018300     02 FILLER                   PIC X      VALUE SPACE.          IX1024.2 IMP
   000181         018400     02  PAR-NAME.                                                IX1024.2
   000182         018500       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1024.2 IMP
   000183         018600       03  PARDOT-X              PIC X      VALUE SPACE.          IX1024.2 IMP
   000184         018700       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1024.2 IMP
   000185         018800     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1024.2 IMP
   000186         018900     02 RE-MARK                  PIC X(61).                       IX1024.2
   000187         019000 01  TEST-COMPUTED.                                               IX1024.2
   000188         019100     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1024.2 IMP
   000189         019200     02 FILLER                   PIC X(17)  VALUE                 IX1024.2
   000190         019300            "       COMPUTED=".                                   IX1024.2
   000191         019400     02 COMPUTED-X.                                               IX1024.2
   000192         019500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1024.2 IMP
   000193         019600     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1024.2 192
   000194         019700                                 PIC -9(9).9(9).                  IX1024.2
   000195         019800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1024.2 192
   000196         019900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1024.2 192
   000197         020000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1024.2 192
   000198         020100     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1024.2 192
   000199         020200         04 COMPUTED-18V0                    PIC -9(18).          IX1024.2
   000200         020300         04 FILLER                           PIC X.               IX1024.2
   000201         020400     03 FILLER PIC X(50) VALUE SPACE.                             IX1024.2 IMP
   000202         020500 01  TEST-CORRECT.                                                IX1024.2
   000203         020600     02 FILLER PIC X(30) VALUE SPACE.                             IX1024.2 IMP
   000204         020700     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1024.2
   000205         020800     02 CORRECT-X.                                                IX1024.2
   000206         020900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1024.2 IMP
   000207         021000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1024.2 206
   000208         021100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1024.2 206
   000209         021200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1024.2 206
   000210         021300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1024.2 206
   000211         021400     03      CR-18V0 REDEFINES CORRECT-A.                         IX1024.2 206
   000212         021500         04 CORRECT-18V0                     PIC -9(18).          IX1024.2
   000213         021600         04 FILLER                           PIC X.               IX1024.2
   000214         021700     03 FILLER PIC X(2) VALUE SPACE.                              IX1024.2 IMP
   000215         021800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1024.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000216         021900 01  CCVS-C-1.                                                    IX1024.2
   000217         022000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1024.2
   000218         022100-    "SS  PARAGRAPH-NAME                                          IX1024.2
   000219         022200-    "       REMARKS".                                            IX1024.2
   000220         022300     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1024.2 IMP
   000221         022400 01  CCVS-C-2.                                                    IX1024.2
   000222         022500     02 FILLER                     PIC X        VALUE SPACE.      IX1024.2 IMP
   000223         022600     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1024.2
   000224         022700     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1024.2 IMP
   000225         022800     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1024.2
   000226         022900     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1024.2 IMP
   000227         023000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1024.2 IMP
   000228         023100 01  REC-CT                        PIC 99       VALUE ZERO.       IX1024.2 IMP
   000229         023200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1024.2 IMP
   000230         023300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1024.2 IMP
   000231         023400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1024.2 IMP
   000232         023500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1024.2 IMP
   000233         023600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1024.2 IMP
   000234         023700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1024.2 IMP
   000235         023800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1024.2 IMP
   000236         023900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1024.2 IMP
   000237         024000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1024.2 IMP
   000238         024100 01  CCVS-H-1.                                                    IX1024.2
   000239         024200     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1024.2 IMP
   000240         024300     02  FILLER                    PIC X(42)    VALUE             IX1024.2
   000241         024400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1024.2
   000242         024500     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1024.2 IMP
   000243         024600 01  CCVS-H-2A.                                                   IX1024.2
   000244         024700   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1024.2 IMP
   000245         024800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1024.2
   000246         024900   02  FILLER                        PIC XXXX   VALUE             IX1024.2
   000247         025000     "4.2 ".                                                      IX1024.2
   000248         025100   02  FILLER                        PIC X(28)  VALUE             IX1024.2
   000249         025200            " COPY - NOT FOR DISTRIBUTION".                       IX1024.2
   000250         025300   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1024.2 IMP
   000251         025400                                                                  IX1024.2
   000252         025500 01  CCVS-H-2B.                                                   IX1024.2
   000253         025600   02  FILLER                        PIC X(15)  VALUE             IX1024.2
   000254         025700            "TEST RESULT OF ".                                    IX1024.2
   000255         025800   02  TEST-ID                       PIC X(9).                    IX1024.2
   000256         025900   02  FILLER                        PIC X(4)   VALUE             IX1024.2
   000257         026000            " IN ".                                               IX1024.2
   000258         026100   02  FILLER                        PIC X(12)  VALUE             IX1024.2
   000259         026200     " HIGH       ".                                              IX1024.2
   000260         026300   02  FILLER                        PIC X(22)  VALUE             IX1024.2
   000261         026400            " LEVEL VALIDATION FOR ".                             IX1024.2
   000262         026500   02  FILLER                        PIC X(58)  VALUE             IX1024.2
   000263         026600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1024.2
   000264         026700 01  CCVS-H-3.                                                    IX1024.2
   000265         026800     02  FILLER                      PIC X(34)  VALUE             IX1024.2
   000266         026900            " FOR OFFICIAL USE ONLY    ".                         IX1024.2
   000267         027000     02  FILLER                      PIC X(58)  VALUE             IX1024.2
   000268         027100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1024.2
   000269         027200     02  FILLER                      PIC X(28)  VALUE             IX1024.2
   000270         027300            "  COPYRIGHT   1985 ".                                IX1024.2
   000271         027400 01  CCVS-E-1.                                                    IX1024.2
   000272         027500     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1024.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000273         027600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1024.2
   000274         027700     02 ID-AGAIN                     PIC X(9).                    IX1024.2
   000275         027800     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1024.2 IMP
   000276         027900 01  CCVS-E-2.                                                    IX1024.2
   000277         028000     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1024.2 IMP
   000278         028100     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1024.2 IMP
   000279         028200     02 CCVS-E-2-2.                                               IX1024.2
   000280         028300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1024.2 IMP
   000281         028400         03 FILLER                   PIC X      VALUE SPACE.      IX1024.2 IMP
   000282         028500         03 ENDER-DESC               PIC X(44)  VALUE             IX1024.2
   000283         028600            "ERRORS ENCOUNTERED".                                 IX1024.2
   000284         028700 01  CCVS-E-3.                                                    IX1024.2
   000285         028800     02  FILLER                      PIC X(22)  VALUE             IX1024.2
   000286         028900            " FOR OFFICIAL USE ONLY".                             IX1024.2
   000287         029000     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1024.2 IMP
   000288         029100     02  FILLER                      PIC X(58)  VALUE             IX1024.2
   000289         029200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1024.2
   000290         029300     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1024.2 IMP
   000291         029400     02 FILLER                       PIC X(15)  VALUE             IX1024.2
   000292         029500             " COPYRIGHT 1985".                                   IX1024.2
   000293         029600 01  CCVS-E-4.                                                    IX1024.2
   000294         029700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1024.2 IMP
   000295         029800     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1024.2
   000296         029900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1024.2 IMP
   000297         030000     02 FILLER                       PIC X(40)  VALUE             IX1024.2
   000298         030100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1024.2
   000299         030200 01  XXINFO.                                                      IX1024.2
   000300         030300     02 FILLER                       PIC X(19)  VALUE             IX1024.2
   000301         030400            "*** INFORMATION ***".                                IX1024.2
   000302         030500     02 INFO-TEXT.                                                IX1024.2
   000303         030600       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1024.2 IMP
   000304         030700       04 XXCOMPUTED                 PIC X(20).                   IX1024.2
   000305         030800       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1024.2 IMP
   000306         030900       04 XXCORRECT                  PIC X(20).                   IX1024.2
   000307         031000     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1024.2
   000308         031100 01  HYPHEN-LINE.                                                 IX1024.2
   000309         031200     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1024.2 IMP
   000310         031300     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1024.2
   000311         031400-    "*****************************************".                 IX1024.2
   000312         031500     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1024.2
   000313         031600-    "******************************".                            IX1024.2
   000314         031700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1024.2
   000315         031800     "IX102A".                                                    IX1024.2
   000316         031900 PROCEDURE DIVISION.                                              IX1024.2
   000317         032000 CCVS1 SECTION.                                                   IX1024.2
   000318         032100 OPEN-FILES.                                                      IX1024.2
   000319         032200     OPEN I-O RAW-DATA.                                           IX1024.2 78
   000320         032300     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1024.2 314 81
   000321         032400     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1024.2 78 327
   000322         032500     MOVE "ABORTED " TO C-ABORT.                                  IX1024.2 92
   000323         032600     ADD 1 TO C-NO-OF-TESTS.                                      IX1024.2 84
   000324         032700     ACCEPT C-DATE  FROM DATE.                                    IX1024.2 82
   000325         032800     ACCEPT C-TIME  FROM TIME.                                    IX1024.2 83
   000326         032900     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1024.2 80 327
   000327         033000 END-E-1.                                                         IX1024.2
   000328         033100     CLOSE RAW-DATA.                                              IX1024.2 78
   000329         033200     OPEN    OUTPUT PRINT-FILE.                                   IX1024.2 93
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000330         033300     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1024.2 314 255 314 274
   000331         033400     MOVE    SPACE TO TEST-RESULTS.                               IX1024.2 IMP 175
   000332         033500     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1024.2 376 381
   000333         033600     MOVE    ZERO TO REC-SKL-SUB.                                 IX1024.2 IMP 227
   000334         033700     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1024.2 335
   000335         033800 CCVS-INIT-FILE.                                                  IX1024.2
   000336         033900     ADD     1 TO REC-SKL-SUB.                                    IX1024.2 227
   000337         034000     MOVE    FILE-RECORD-INFO-SKELETON                            IX1024.2 125
   000338         034100          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1024.2 139 227
   000339         034200 CCVS-INIT-EXIT.                                                  IX1024.2
   000340         034300     GO TO CCVS1-EXIT.                                            IX1024.2 463
   000341         034400 CLOSE-FILES.                                                     IX1024.2
   000342         034500     OPEN I-O RAW-DATA.                                           IX1024.2 78
   000343         034600     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1024.2 314 81
   000344         034700     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1024.2 78 352
   000345         034800     MOVE "OK.     " TO C-ABORT.                                  IX1024.2 92
   000346         034900     MOVE PASS-COUNTER TO C-OK.                                   IX1024.2 232 85
   000347         035000     MOVE ERROR-HOLD   TO C-ALL.                                  IX1024.2 234 86
   000348         035100     MOVE ERROR-COUNTER TO C-FAIL.                                IX1024.2 230 87
   000349         035200     MOVE DELETE-COUNTER TO C-DELETED.                            IX1024.2 229 88
   000350         035300     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1024.2 231 89
   000351         035400     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1024.2 80 352
   000352         035500 END-E-2.                                                         IX1024.2
   000353         035600     CLOSE RAW-DATA.                                              IX1024.2 78
   000354         035700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1024.2 385 406 93
   000355         035800 TERMINATE-CCVS.                                                  IX1024.2
   000356         035900     EXIT PROGRAM.                                                IX1024.2
   000357         036000 TERMINATE-CALL.                                                  IX1024.2
   000358         036100     STOP     RUN.                                                IX1024.2
   000359         036200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1024.2 179 231
   000360         036300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1024.2 179 232
   000361         036400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1024.2 179 230
   000362         036500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1024.2 179 229
   000363         036600     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1024.2 186
   000364         036700 PRINT-DETAIL.                                                    IX1024.2
   000365         036800     IF REC-CT NOT EQUAL TO ZERO                                  IX1024.2 228 IMP
   000366      1  036900             MOVE "." TO PARDOT-X                                 IX1024.2 183
   000367      1  037000             MOVE REC-CT TO DOTVALUE.                             IX1024.2 228 184
   000368         037100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1024.2 175 94 418
   000369         037200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1024.2 179 418
   000370      1  037300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1024.2 439 453
   000371      1  037400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1024.2 454 462
   000372         037500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1024.2 IMP 179 IMP 191
   000373         037600     MOVE SPACE TO CORRECT-X.                                     IX1024.2 IMP 205
   000374         037700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1024.2 228 IMP IMP 181
   000375         037800     MOVE     SPACE TO RE-MARK.                                   IX1024.2 IMP 186
   000376         037900 HEAD-ROUTINE.                                                    IX1024.2
   000377         038000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1024.2 238 95 418
   000378         038100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1024.2 243 95 418
   000379         038200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1024.2 252 95 418
   000380         038300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1024.2 264 95 418
   000381         038400 COLUMN-NAMES-ROUTINE.                                            IX1024.2
   000382         038500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1024.2 216 95 418
   000383         038600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1024.2 221 95 418
   000384         038700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1024.2 308 95 418
   000385         038800 END-ROUTINE.                                                     IX1024.2
   000386         038900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1024.2 308 95 418
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000387         039000 END-RTN-EXIT.                                                    IX1024.2
   000388         039100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1024.2 271 95 418
   000389         039200 END-ROUTINE-1.                                                   IX1024.2
   000390         039300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1024.2 230 234 231
   000391         039400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1024.2 234 229 234
   000392         039500      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1024.2 232 234
   000393         039600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1024.2
   000394         039700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1024.2 232 294
   000395         039800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1024.2 234 296
   000396         039900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1024.2 293 279
   000397         040000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1024.2 276 95 418
   000398         040100  END-ROUTINE-12.                                                 IX1024.2
   000399         040200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1024.2 282
   000400         040300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1024.2 230 IMP
   000401      1  040400         MOVE "NO " TO ERROR-TOTAL                                IX1024.2 280
   000402         040500         ELSE                                                     IX1024.2
   000403      1  040600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1024.2 230 280
   000404         040700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1024.2 276 95
   000405         040800     PERFORM WRITE-LINE.                                          IX1024.2 418
   000406         040900 END-ROUTINE-13.                                                  IX1024.2
   000407         041000     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1024.2 229 IMP
   000408      1  041100         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1024.2 280
   000409      1  041200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1024.2 229 280
   000410         041300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1024.2 282
   000411         041400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1024.2 276 95 418
   000412         041500      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1024.2 231 IMP
   000413      1  041600          MOVE "NO " TO ERROR-TOTAL                               IX1024.2 280
   000414      1  041700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1024.2 231 280
   000415         041800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1024.2 282
   000416         041900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1024.2 276 95 418
   000417         042000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1024.2 284 95 418
   000418         042100 WRITE-LINE.                                                      IX1024.2
   000419         042200     ADD 1 TO RECORD-COUNT.                                       IX1024.2 236
   000420         042300     IF RECORD-COUNT GREATER 42                                   IX1024.2 236
   000421      1  042400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1024.2 95 235
   000422      1  042500         MOVE SPACE TO DUMMY-RECORD                               IX1024.2 IMP 95
   000423      1  042600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1024.2 95
   000424      1  042700         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1024.2 238 95 434
   000425      1  042800         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1024.2 243 95 434
   000426      1  042900         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1024.2 252 95 434
   000427      1  043000         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1024.2 264 95 434
   000428      1  043100         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1024.2 216 95 434
   000429      1  043200         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1024.2 221 95 434
   000430      1  043300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1024.2 308 95 434
   000431      1  043400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1024.2 235 95
   000432      1  043500         MOVE ZERO TO RECORD-COUNT.                               IX1024.2 IMP 236
   000433         043600     PERFORM WRT-LN.                                              IX1024.2 434
   000434         043700 WRT-LN.                                                          IX1024.2
   000435         043800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1024.2 95
   000436         043900     MOVE SPACE TO DUMMY-RECORD.                                  IX1024.2 IMP 95
   000437         044000 BLANK-LINE-PRINT.                                                IX1024.2
   000438         044100     PERFORM WRT-LN.                                              IX1024.2 434
   000439         044200 FAIL-ROUTINE.                                                    IX1024.2
   000440         044300     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1024.2 191 IMP
   000441      1  044400            GO TO   FAIL-ROUTINE-WRITE.                           IX1024.2 448
   000442         044500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1024.2 205 IMP 448
   000443         044600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1024.2 237 307
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000444         044700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1024.2 302
   000445         044800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1024.2 299 95 418
   000446         044900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1024.2 IMP 307
   000447         045000     GO TO  FAIL-ROUTINE-EX.                                      IX1024.2 453
   000448         045100 FAIL-ROUTINE-WRITE.                                              IX1024.2
   000449         045200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1024.2 187 94 418
   000450         045300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1024.2 237 215
   000451         045400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1024.2 202 94 418
   000452         045500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1024.2 IMP 215
   000453         045600 FAIL-ROUTINE-EX. EXIT.                                           IX1024.2
   000454         045700 BAIL-OUT.                                                        IX1024.2
   000455         045800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1024.2 192 IMP 457
   000456         045900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1024.2 206 IMP 462
   000457         046000 BAIL-OUT-WRITE.                                                  IX1024.2
   000458         046100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1024.2 206 306 192 304
   000459         046200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1024.2 237 307
   000460         046300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1024.2 299 95 418
   000461         046400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1024.2 IMP 307
   000462         046500 BAIL-OUT-EX. EXIT.                                               IX1024.2
   000463         046600 CCVS1-EXIT.                                                      IX1024.2
   000464         046700     EXIT.                                                        IX1024.2
   000465         046800 SECT-IX-02-001 SECTION.                                          IX1024.2
   000466         046900 READ-INIT-F2-01.                                                 IX1024.2
   000467         047000*                                                                 IX1024.2
   000468         047100*  TEST   1                                                       IX1024.2
   000469         047200*                                                                 IX1024.2
   000470         047300     OPEN     INPUT  IX-FS1.                                      IX1024.2 96
   000471         047400     MOVE     "READ-TEST-F2-01" TO PAR-NAME.                      IX1024.2 181
   000472         047500     MOVE    ZERO TO WRK-DU-09V00-001.                            IX1024.2 IMP 117
   000473         047600     MOVE    IX-WRK-KEY  TO IX-FS1-KEY.                           IX1024.2 115 105
   000474         047700     MOVE     ZERO TO   WRK-CS-09V00-002                          IX1024.2 IMP 110
   000475         047800     MOVE     ZERO  TO  WRK-DU-09V00-001                          IX1024.2 IMP 117
   000476         047900     MOVE    "READ ... INVALID"  TO FEATURE.                      IX1024.2 177
   000477         048000 READ-TEST-F2-01.                                                 IX1024.2
   000478         048100     ADD      1 TO WRK-DU-09V00-001                               IX1024.2 117
   000479         048200     MOVE      IX-WRK-KEY TO IX-FS1-KEY.                          IX1024.2 115 105
   000480         048300     IF     WRK-DU-09V00-001  GREATER  501                        IX1024.2 117
   000481      1  048400              MOVE "INVALID KEY NOT TAKEN" TO COMPUTED-A          IX1024.2 192
   000482      1  048500             MOVE    WRK-DU-09V00-001  TO CORRECT-18V0            IX1024.2 117 212
   000483      1  048600              PERFORM FAIL                                        IX1024.2 361
   000484      1  048700              PERFORM PRINT-DETAIL                                IX1024.2 364
   000485      1  048800              GO TO READ-WRITE-F2-01.                             IX1024.2 494
   000486         048900     READ     IX-FS1                                              IX1024.2 96
   000487      1  049000             INVALID KEY GO TO READ-WRITE-F2-01.                  IX1024.2 494
   000488         049100     MOVE     IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).           IX1024.2 101 139
   000489         049200     IF      XRECORD-NUMBER (1) EQUAL TO WRK-DU-09V00-001         IX1024.2 148 117
   000490      1  049300              GO TO READ-TEST-F2-01.                              IX1024.2 477
   000491         049400     MOVE    "YES" TO I-O-ERROR-IX-FS1.                           IX1024.2 111
   000492         049500     ADD      1 TO WRK-CS-09V00-002                               IX1024.2 110
   000493         049600     GO TO    READ-TEST-F2-01.                                    IX1024.2 477
   000494         049700 READ-WRITE-F2-01.                                                IX1024.2
   000495         049800     IF      WRK-DU-09V00-001  NOT EQUAL TO 501                   IX1024.2 117
   000496      1  049900              MOVE "WRONG KEY/NOT 500" TO CORRECT-A               IX1024.2 206
   000497      1  050000             MOVE    WRK-DU-09V00-001  TO  COMPUTED-18V0          IX1024.2 117 199
   000498      1  050100              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1024.2 186
   000499      1  050200              PERFORM FAIL                                        IX1024.2 361
   000500         050300              ELSE                                                IX1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000501      1  050400              PERFORM PASS.                                       IX1024.2 360
   000502         050500     PERFORM PRINT-DETAIL.                                        IX1024.2 364
   000503         050600 READ-TEST-F2-02.                                                 IX1024.2
   000504         050700     MOVE     "READ-TEST-F2-02" TO PAR-NAME.                      IX1024.2 181
   000505         050800     MOVE    "READ ... INVALID"  TO FEATURE.                      IX1024.2 177
   000506         050900*                                                                 IX1024.2
   000507         051000*  TEST   2                                                       IX1024.2
   000508         051100*                                                                 IX1024.2
   000509         051200     IF       XRECORD-NUMBER (1) NOT EQUAL TO 500                 IX1024.2 148
   000510      1  051300              MOVE "WRONG RECORD/NOT 500" TO CORRECT-A            IX1024.2 206
   000511      1  051400              MOVE  XRECORD-NUMBER (1) TO COMPUTED-18V0           IX1024.2 148 199
   000512      1  051500              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1024.2 186
   000513      1  051600              PERFORM FAIL                                        IX1024.2 361
   000514         051700              ELSE                                                IX1024.2
   000515      1  051800              PERFORM PASS.                                       IX1024.2 360
   000516         051900     PERFORM PRINT-DETAIL.                                        IX1024.2 364
   000517         052000 READ-TEST-F2-03.                                                 IX1024.2
   000518         052100     MOVE     "READ-TEST-F2-03" TO PAR-NAME.                      IX1024.2 181
   000519         052200     MOVE    "READ ... INVALID"  TO FEATURE.                      IX1024.2 177
   000520         052300*                                                                 IX1024.2
   000521         052400*  TEST   3                                                       IX1024.2
   000522         052500*                                                                 IX1024.2
   000523         052600     IF      WRK-DU-09V00-001 NOT EQUAL TO 501                    IX1024.2 117
   000524      1  052700              MOVE "INCORRECT RECORD COUNT" TO RE-MARK            IX1024.2 186
   000525      1  052800              MOVE  WRK-DU-09V00-001 TO COMPUTED-18V0             IX1024.2 117 199
   000526      1  052900             MOVE 501  TO CORRECT-18V0                            IX1024.2 212
   000527      1  053000              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1024.2 186
   000528      1  053100              PERFORM FAIL                                        IX1024.2 361
   000529         053200              ELSE                                                IX1024.2
   000530      1  053300              PERFORM PASS.                                       IX1024.2 360
   000531         053400     PERFORM PRINT-DETAIL.                                        IX1024.2 364
   000532         053500 READ-TEST-F2-04.                                                 IX1024.2
   000533         053600     MOVE     "READ-TEST-F2-04" TO PAR-NAME.                      IX1024.2 181
   000534         053700     MOVE    "READ ... INVALID"  TO FEATURE.                      IX1024.2 177
   000535         053800*                                                                 IX1024.2
   000536         053900*  TEST   4                                                       IX1024.2
   000537         054000*                                                                 IX1024.2
   000538         054100     IF       I-O-ERROR-IX-FS1 EQUAL TO "YES"                     IX1024.2 111
   000539      1  054200              MOVE WRK-CS-09V00-002 TO COMPUTED-18V0              IX1024.2 110 199
   000540      1  054300              MOVE "RECORDS DID NOT COMPARE" TO RE-MARK           IX1024.2 186
   000541      1  054400              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1024.2 186
   000542      1  054500              PERFORM FAIL                                        IX1024.2 361
   000543         054600              ELSE                                                IX1024.2
   000544      1  054700              PERFORM PASS.                                       IX1024.2 360
   000545         054800     PERFORM PRINT-DETAIL.                                        IX1024.2 364
   000546         054900     CLOSE    IX-FS1.                                             IX1024.2 96
   000547         055000 REWRITE-INIT-F2-01.                                              IX1024.2
   000548         055100     MOVE     "REWRITE-TEST-F2-01" TO PAR-NAME.                   IX1024.2 181
   000549         055200     OPEN I-O IX-FS1.                                             IX1024.2 96
   000550         055300     MOVE     ZERO TO IX-FS1-KEY.                                 IX1024.2 IMP 105
   000551         055400     MOVE     ZERO TO WRK-CS-09V00-002.                           IX1024.2 IMP 110
   000552         055500     MOVE     ZERO TO WRK-DU-09V00-001.                           IX1024.2 IMP 117
   000553         055600     MOVE    "REWRITE ... INVALID"   TO FEATURE.                  IX1024.2 177
   000554         055700     MOVE     SPACE TO  FILE-RECORD-INFO (1).                     IX1024.2 IMP 139
   000555         055800 REWRITE-TEST-F2-01.                                              IX1024.2
   000556         055900*                                                                 IX1024.2
   000557         056000*  REWRITE TEST  1                                                IX1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000558         056100*                                                                 IX1024.2
   000559         056200     ADD      5 TO  WRK-DU-09V00-001.                             IX1024.2 117
   000560         056300     MOVE    IX-WRK-KEY TO IX-FS1-KEY.                            IX1024.2 115 105
   000561         056400     IF    WRK-DU-09V00-001  GREATER 505                          IX1024.2 117
   000562      1  056500              MOVE "INVALID KEY/NOT TAKEN" TO COMPUTED-A          IX1024.2 192
   000563      1  056600             MOVE    WRK-DU-09V00-001  TO CORRECT-18V0            IX1024.2 117 212
   000564      1  056700              PERFORM FAIL                                        IX1024.2 361
   000565      1  056800              PERFORM PRINT-DETAIL                                IX1024.2 364
   000566      1  056900              GO TO REWRITE-TEST-F2-01-3.                         IX1024.2 593
   000567         057000     READ     IX-FS1                                              IX1024.2 96
   000568      1  057100              INVALID KEY GO TO REWRITE-TEST-F2-01-1.             IX1024.2 576
   000569         057200     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1)             IX1024.2 101 139
   000570         057300     ADD      01 TO UPDATE-NUMBER (1).                            IX1024.2 150
   000571         057400     MOVE  CCVS-PGM-ID  TO XPROGRAM-NAME (1).                     IX1024.2 314 154
   000572         057500     MOVE     FILE-RECORD-INFO (1) TO IX-FS1R1-F-G-240.           IX1024.2 139 101
   000573         057600     REWRITE    IX-FS1R1-F-G-240                                  IX1024.2 101
   000574      1  057700              INVALID KEY GO TO REWRITE-TEST-F2-01-2.             IX1024.2 589
   000575         057800     GO TO    REWRITE-TEST-F2-01.                                 IX1024.2 555
   000576         057900 REWRITE-TEST-F2-01-1.                                            IX1024.2
   000577         058000     IF      WRK-DU-09V00-001  LESS THAN 501                      IX1024.2 117
   000578      1  058100              ADD 1 TO  WRK-CS-09V00-004                          IX1024.2 113
   000579      1  058200              GO TO REWRITE-TEST-F2-01.                           IX1024.2 555
   000580         058300     PERFORM   PASS.                                              IX1024.2 360
   000581         058400     PERFORM    PRINT-DETAIL.                                     IX1024.2 364
   000582         058500 REWRITE-TEST-F2-02.                                              IX1024.2
   000583         058600     MOVE     "REWRITE-TEST-F2-02" TO PAR-NAME.                   IX1024.2 181
   000584         058700     MOVE    "REWRITE ... INVALID"   TO FEATURE.                  IX1024.2 177
   000585         058800*                                                                 IX1024.2
   000586         058900*  REWRITE TEST  2                                                IX1024.2
   000587         059000*                                                                 IX1024.2
   000588         059100     GO TO    REWRITE-TEST-F2-01-3.                               IX1024.2 593
   000589         059200 REWRITE-TEST-F2-01-2.                                            IX1024.2
   000590         059300     ADD      1 TO WRK-CS-09V00-005.                              IX1024.2 114
   000591         059400     IF      WRK-DU-09V00-001  LESS THAN 501                      IX1024.2 117
   000592      1  059500              GO TO REWRITE-TEST-F2-01.                           IX1024.2 555
   000593         059600 REWRITE-TEST-F2-01-3.                                            IX1024.2
   000594         059700     IF       WRK-CS-09V00-004 NOT EQUAL TO ZERO                  IX1024.2 113 IMP
   000595      1  059800              MOVE "INVALID KEY ON READ" TO COMPUTED-A            IX1024.2 192
   000596      1  059900              MOVE WRK-CS-09V00-004 TO CORRECT-18V0               IX1024.2 113 212
   000597      1  060000              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1024.2 186
   000598      1  060100              PERFORM FAIL                                        IX1024.2 361
   000599         060200              ELSE                                                IX1024.2
   000600      1  060300              PERFORM PASS.                                       IX1024.2 360
   000601         060400     PERFORM PRINT-DETAIL.                                        IX1024.2 364
   000602         060500 REWRITE-TEST-F2-03.                                              IX1024.2
   000603         060600     MOVE     "REWRITE-TEST-F2-03" TO PAR-NAME.                   IX1024.2 181
   000604         060700     MOVE    "REWRITE ... INVALID"   TO FEATURE.                  IX1024.2 177
   000605         060800*                                                                 IX1024.2
   000606         060900*  REWRITE TEST  3                                                IX1024.2
   000607         061000*                                                                 IX1024.2
   000608         061100     IF       WRK-CS-09V00-005 NOT EQUAL TO ZERO                  IX1024.2 114 IMP
   000609      1  061200              MOVE "INVALID KEY ON REWRITE" TO COMPUTED-A         IX1024.2 192
   000610      1  061300              MOVE  WRK-CS-09V00-005 TO CORRECT-18V0              IX1024.2 114 212
   000611      1  061400              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1024.2 186
   000612      1  061500              PERFORM FAIL                                        IX1024.2 361
   000613         061600              ELSE                                                IX1024.2
   000614      1  061700              PERFORM PASS.                                       IX1024.2 360
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000615         061800     PERFORM PRINT-DETAIL.                                        IX1024.2 364
   000616         061900     CLOSE    IX-FS1.                                             IX1024.2 96
   000617         062000 READ-INIT-F2-05.                                                 IX1024.2
   000618         062100     MOVE     "READ-TEST-F2-05" TO PAR-NAME.                      IX1024.2 181
   000619         062200     OPEN     INPUT  IX-FS1.                                      IX1024.2 96
   000620         062300     MOVE     501  TO WRK-DU-09V00-001.                           IX1024.2 117
   000621         062400     MOVE    ZERO TO WRK-CS-09V00-004.                            IX1024.2 IMP 113
   000622         062500     MOVE    ZERO TO WRK-CS-09V00-005.                            IX1024.2 IMP 114
   000623         062600     MOVE    ZERO TO WRK-CS-09V00-002.                            IX1024.2 IMP 110
   000624         062700     MOVE     SPACE TO  FILE-RECORD-INFO (1).                     IX1024.2 IMP 139
   000625         062800     MOVE    "READ  ... INVALID "   TO FEATURE.                   IX1024.2 177
   000626         062900 READ-TEST-F2-05.                                                 IX1024.2
   000627         063000     IF      WRK-DU-09V00-001  EQUAL TO ZERO                      IX1024.2 117 IMP
   000628      1  063100              MOVE "INVALID KEY/NOT TAKEN" TO COMPUTED-A          IX1024.2 192
   000629      1  063200             MOVE    WRK-DU-09V00-001  TO  COMPUTED-18V0          IX1024.2 117 199
   000630      1  063300             MOVE    ZERO TO CORRECT-18V0                         IX1024.2 IMP 212
   000631      1  063400              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1024.2 186
   000632      1  063500              PERFORM FAIL                                        IX1024.2 361
   000633      1  063600              PERFORM PRINT-DETAIL                                IX1024.2 364
   000634      1  063700              GO TO READ-TEST-F2-05.                              IX1024.2 626
   000635         063800     SUBTRACT     1  FROM WRK-DU-09V00-001.                       IX1024.2 117
   000636         063900     MOVE      IX-WRK-KEY TO IX-FS1-KEY.                          IX1024.2 115 105
   000637         064000     READ     IX-FS1                                              IX1024.2 96
   000638      1  064100              INVALID KEY  GO TO READ-TEST-F2-05-1.               IX1024.2 645
   000639         064200     MOVE     IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).           IX1024.2 101 139
   000640         064300     IF     UPDATE-NUMBER (1) EQUAL TO 00                         IX1024.2 150
   000641      1  064400              ADD 1 TO WRK-CS-09V00-004.                          IX1024.2 113
   000642         064500     IF     UPDATE-NUMBER (1) EQUAL TO 01                         IX1024.2 150
   000643      1  064600              ADD 1 TO WRK-CS-09V00-005.                          IX1024.2 114
   000644         064700     GO TO    READ-TEST-F2-05.                                    IX1024.2 626
   000645         064800 READ-TEST-F2-05-1.                                               IX1024.2
   000646         064900     IF      WRK-DU-09V00-001  GREATER ZERO                       IX1024.2 117 IMP
   000647      1  065000             ADD 1 TO WRK-CS-09V00-002                            IX1024.2 110
   000648      1  065100              GO TO READ-TEST-F2-05.                              IX1024.2 626
   000649         065200     PERFORM   PASS.                                              IX1024.2 360
   000650         065300     PERFORM   PRINT-DETAIL.                                      IX1024.2 364
   000651         065400 READ-TEST-F2-06.                                                 IX1024.2
   000652         065500     MOVE     "READ-TEST-F2-06" TO PAR-NAME.                      IX1024.2 181
   000653         065600     MOVE    "READ ... INVALID"  TO FEATURE.                      IX1024.2 177
   000654         065700*                                                                 IX1024.2
   000655         065800*  TEST   6                                                       IX1024.2
   000656         065900*                                                                 IX1024.2
   000657         066000     IF       WRK-CS-09V00-004 NOT EQUAL TO 400                   IX1024.2 113
   000658      1  066100              MOVE "NON-UPDATED RECORDS" TO COMPUTED-A            IX1024.2 192
   000659      1  066200              MOVE WRK-CS-09V00-004 TO CORRECT-18V0               IX1024.2 113 212
   000660      1  066300              MOVE "SHOULD BE 400" TO RE-MARK                     IX1024.2 186
   000661      1  066400              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1024.2 186
   000662      1  066500              PERFORM FAIL                                        IX1024.2 361
   000663         066600              ELSE                                                IX1024.2
   000664      1  066700              PERFORM PASS.                                       IX1024.2 360
   000665         066800     PERFORM PRINT-DETAIL.                                        IX1024.2 364
   000666         066900 READ-TEST-F2-07.                                                 IX1024.2
   000667         067000     MOVE     "READ-TEST-F2-07" TO PAR-NAME.                      IX1024.2 181
   000668         067100     MOVE    "READ ... INVALID"  TO FEATURE.                      IX1024.2 177
   000669         067200*                                                                 IX1024.2
   000670         067300*  TEST   7                                                       IX1024.2
   000671         067400*                                                                 IX1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000672         067500     IF       WRK-CS-09V00-005   NOT EQUAL TO 100                 IX1024.2 114
   000673      1  067600              MOVE "UPDATED RECORDS" TO COMPUTED-A                IX1024.2 192
   000674      1  067700              MOVE WRK-CS-09V00-005 TO CORRECT-18V0               IX1024.2 114 212
   000675      1  067800              MOVE "SHOULD BE 100" TO RE-MARK                     IX1024.2 186
   000676      1  067900              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1024.2 186
   000677      1  068000              PERFORM FAIL                                        IX1024.2 361
   000678         068100              ELSE                                                IX1024.2
   000679      1  068200              PERFORM PASS.                                       IX1024.2 360
   000680         068300     PERFORM PRINT-DETAIL.                                        IX1024.2 364
   000681         068400 READ-TEST-F2-08.                                                 IX1024.2
   000682         068500     MOVE     "READ-TEST-F2-08" TO PAR-NAME.                      IX1024.2 181
   000683         068600     MOVE    "READ ... INVALID"  TO FEATURE.                      IX1024.2 177
   000684         068700*                                                                 IX1024.2
   000685         068800*  TEST   8                                                       IX1024.2
   000686         068900*                                                                 IX1024.2
   000687         069000     IF      WRK-CS-09V00-002 GREATER 1                           IX1024.2 110
   000688      1  069100             MOVE WRK-CS-09V00-002 TO COMPUTED-N                  IX1024.2 110 193
   000689      1  069200             MOVE  "INVALID KEY/READS" TO CORRECT-A               IX1024.2 206
   000690      1  069300              MOVE "IX-28 4.5.2                       " TO RE-MARKIX1024.2 186
   000691      1  069400             PERFORM FAIL                                         IX1024.2 361
   000692         069500              ELSE                                                IX1024.2
   000693      1  069600              PERFORM PASS.                                       IX1024.2 360
   000694         069700     PERFORM PRINT-DETAIL.                                        IX1024.2 364
   000695         069800     CLOSE    IX-FS1.                                             IX1024.2 96
   000696         069900 CCVS-EXIT SECTION.                                               IX1024.2
   000697         070000 CCVS-999999.                                                     IX1024.2
   000698         070100     GO TO CLOSE-FILES.                                           IX1024.2 341
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      171   ALTERNATE-KEY1
      173   ALTERNATE-KEY2
      237   ANSI-REFERENCE . . . . . . . .  443 450 459
       92   C-ABORT. . . . . . . . . . . .  M322 M345
       86   C-ALL. . . . . . . . . . . . .  M347
       82   C-DATE . . . . . . . . . . . .  M324
       88   C-DELETED. . . . . . . . . . .  M349
       87   C-FAIL . . . . . . . . . . . .  M348
       91   C-INDENT
       89   C-INSPECT. . . . . . . . . . .  M350
       84   C-NO-OF-TESTS. . . . . . . . .  M323
       90   C-NOTE
       85   C-OK . . . . . . . . . . . . .  M346
       83   C-TIME . . . . . . . . . . . .  M325
      216   CCVS-C-1 . . . . . . . . . . .  382 428
      221   CCVS-C-2 . . . . . . . . . . .  383 429
      271   CCVS-E-1 . . . . . . . . . . .  388
      276   CCVS-E-2 . . . . . . . . . . .  397 404 411 416
      279   CCVS-E-2-2 . . . . . . . . . .  M396
      284   CCVS-E-3 . . . . . . . . . . .  417
      293   CCVS-E-4 . . . . . . . . . . .  396
      294   CCVS-E-4-1 . . . . . . . . . .  M394
      296   CCVS-E-4-2 . . . . . . . . . .  M395
      238   CCVS-H-1 . . . . . . . . . . .  377 424
      243   CCVS-H-2A. . . . . . . . . . .  378 425
      252   CCVS-H-2B. . . . . . . . . . .  379 426
      264   CCVS-H-3 . . . . . . . . . . .  380 427
      314   CCVS-PGM-ID. . . . . . . . . .  320 330 330 343 571
      158   CHARS-OR-RECORDS
      198   CM-18V0
      192   COMPUTED-A . . . . . . . . . .  193 195 196 197 198 455 458 M481 M562 M595 M609 M628 M658 M673
      193   COMPUTED-N . . . . . . . . . .  M688
      191   COMPUTED-X . . . . . . . . . .  M372 440
      195   COMPUTED-0V18
      197   COMPUTED-14V4
      199   COMPUTED-18V0. . . . . . . . .  M497 M511 M525 M539 M629
      196   COMPUTED-4V14
      215   COR-ANSI-REFERENCE . . . . . .  M450 M452
      206   CORRECT-A. . . . . . . . . . .  207 208 209 210 211 456 458 M496 M510 M689
      207   CORRECT-N
      205   CORRECT-X. . . . . . . . . . .  M373 442
      208   CORRECT-0V18
      210   CORRECT-14V4
      212   CORRECT-18V0 . . . . . . . . .  M482 M526 M563 M596 M610 M630 M659 M674
      209   CORRECT-4V14
      211   CR-18V0
      229   DELETE-COUNTER . . . . . . . .  349 M362 391 407 409
      184   DOTVALUE . . . . . . . . . . .  M367
      235   DUMMY-HOLD . . . . . . . . . .  M421 431
       95   DUMMY-RECORD . . . . . . . . .  M377 M378 M379 M380 M382 M383 M384 M386 M388 M397 M404 M411 M416 M417 421 M422
                                            423 M424 M425 M426 M427 M428 M429 M430 M431 435 M436 M445 M460
      123   DUMMY-WRK-INDENT-5
      119   DUMMY-WRK-REC
      120   DUMMY-WRK1 . . . . . . . . . .  121
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    17
0 Defined   Cross-reference of data names   References

0     121   DUMMY-WRK2
      282   ENDER-DESC . . . . . . . . . .  M399 M410 M415
      230   ERROR-COUNTER. . . . . . . . .  348 M361 390 400 403
      234   ERROR-HOLD . . . . . . . . . .  347 M390 M391 M391 M392 395
      280   ERROR-TOTAL. . . . . . . . . .  M401 M403 M408 M409 M413 M414
      177   FEATURE. . . . . . . . . . . .  M476 M505 M519 M534 M553 M584 M604 M625 M653 M668 M683
      139   FILE-RECORD-INFO . . . . . . .  M338 M488 M554 M569 572 M624 M639
      140   FILE-RECORD-INFO-P1-120
      167   FILE-RECORD-INFO-P121-240
      125   FILE-RECORD-INFO-SKELETON. . .  337
      124   FILE-RECORD-INFORMATION-REC
      308   HYPHEN-LINE. . . . . . . . . .  384 386 430
      111   I-O-ERROR-IX-FS1 . . . . . . .  M491 538
      274   ID-AGAIN . . . . . . . . . . .  M330
      307   INF-ANSI-REFERENCE . . . . . .  M443 M446 M459 M461
      302   INFO-TEXT. . . . . . . . . . .  M444
      231   INSPECT-COUNTER. . . . . . . .  350 M359 390 412 414
       96   IX-FS1 . . . . . . . . . . . .  69 470 486 546 549 567 616 619 637 695
      105   IX-FS1-KEY . . . . . . . . . .  74 M473 M479 M550 M560 M636
      102   IX-FS1-REC-120
      103   IX-FS1-REC-120-240
      101   IX-FS1R1-F-G-240 . . . . . . .  488 569 M572 573 639
      115   IX-WRK-KEY . . . . . . . . . .  473 479 560 636
      152   ODO-NUMBER
      179   P-OR-F . . . . . . . . . . . .  M359 M360 M361 M362 369 M372
      181   PAR-NAME . . . . . . . . . . .  M374 M471 M504 M518 M533 M548 M583 M603 M618 M652 M667 M682
      183   PARDOT-X . . . . . . . . . . .  M366
      232   PASS-COUNTER . . . . . . . . .  346 M360 392 394
       93   PRINT-FILE . . . . . . . . . .  67 329 354
       94   PRINT-REC. . . . . . . . . . .  M368 M449 M451
       78   RAW-DATA . . . . . . . . . . .  62 319 321 328 342 344 353
       81   RAW-DATA-KEY . . . . . . . . .  66 M320 M343
       80   RAW-DATA-SATZ. . . . . . . . .  326 351
      186   RE-MARK. . . . . . . . . . . .  M363 M375 M498 M512 M524 M527 M540 M541 M597 M611 M631 M660 M661 M675 M676 M690
      228   REC-CT . . . . . . . . . . . .  365 367 374
      227   REC-SKL-SUB. . . . . . . . . .  M333 M336 338
      236   RECORD-COUNT . . . . . . . . .  M419 420 M432
      162   RECORDS-IN-FILE
      146   REELUNIT-NUMBER
      187   TEST-COMPUTED. . . . . . . . .  449
      202   TEST-CORRECT . . . . . . . . .  451
      255   TEST-ID. . . . . . . . . . . .  M330
      175   TEST-RESULTS . . . . . . . . .  M331 368
      233   TOTAL-ERROR
      150   UPDATE-NUMBER. . . . . . . . .  M570 640 642
      108   WRK-CS-09V00
      112   WRK-CS-09V00-001
      110   WRK-CS-09V00-002 . . . . . . .  M474 M492 539 M551 M623 M647 687 688
      113   WRK-CS-09V00-004 . . . . . . .  M578 594 596 M621 M641 657 659
      114   WRK-CS-09V00-005 . . . . . . .  M590 608 610 M622 M643 672 674
      109   WRK-DS-09V00-002
      117   WRK-DU-09V00-001 . . . . . . .  M472 M475 M478 480 482 489 495 497 523 525 M552 M559 561 563 577 591 M620 627
                                            629 M635 646
      160   XBLOCK-SIZE
      142   XFILE-NAME
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    18
0 Defined   Cross-reference of data names   References

0     164   XFILE-ORGANIZATION
      166   XLABEL-TYPE
      154   XPROGRAM-NAME. . . . . . . . .  M571
      169   XRECORD-KEY
      156   XRECORD-LENGTH
      144   XRECORD-NAME
      148   XRECORD-NUMBER . . . . . . . .  489 509 511
      304   XXCOMPUTED . . . . . . . . . .  M458
      306   XXCORRECT. . . . . . . . . . .  M458
      299   XXINFO . . . . . . . . . . . .  445 460
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    19
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

      454   BAIL-OUT . . . . . . . . . . .  P371
      462   BAIL-OUT-EX. . . . . . . . . .  E371 G456
      457   BAIL-OUT-WRITE . . . . . . . .  G455
      437   BLANK-LINE-PRINT
      696   CCVS-EXIT
      339   CCVS-INIT-EXIT
      335   CCVS-INIT-FILE . . . . . . . .  P334
      697   CCVS-999999
      317   CCVS1
      463   CCVS1-EXIT . . . . . . . . . .  G340
      341   CLOSE-FILES. . . . . . . . . .  G698
      381   COLUMN-NAMES-ROUTINE . . . . .  E332
      362   DE-LETE
      327   END-E-1. . . . . . . . . . . .  G321 G326
      352   END-E-2. . . . . . . . . . . .  G344 G351
      385   END-ROUTINE. . . . . . . . . .  P354
      389   END-ROUTINE-1
      398   END-ROUTINE-12
      406   END-ROUTINE-13 . . . . . . . .  E354
      387   END-RTN-EXIT
      361   FAIL . . . . . . . . . . . . .  P483 P499 P513 P528 P542 P564 P598 P612 P632 P662 P677 P691
      439   FAIL-ROUTINE . . . . . . . . .  P370
      453   FAIL-ROUTINE-EX. . . . . . . .  E370 G447
      448   FAIL-ROUTINE-WRITE . . . . . .  G441 G442
      376   HEAD-ROUTINE . . . . . . . . .  P332
      359   INSPT
      318   OPEN-FILES
      360   PASS . . . . . . . . . . . . .  P501 P515 P530 P544 P580 P600 P614 P649 P664 P679 P693
      364   PRINT-DETAIL . . . . . . . . .  P484 P502 P516 P531 P545 P565 P581 P601 P615 P633 P650 P665 P680 P694
      466   READ-INIT-F2-01
      617   READ-INIT-F2-05
      477   READ-TEST-F2-01. . . . . . . .  G490 G493
      503   READ-TEST-F2-02
      517   READ-TEST-F2-03
      532   READ-TEST-F2-04
      626   READ-TEST-F2-05. . . . . . . .  G634 G644 G648
      645   READ-TEST-F2-05-1. . . . . . .  G638
      651   READ-TEST-F2-06
      666   READ-TEST-F2-07
      681   READ-TEST-F2-08
      494   READ-WRITE-F2-01 . . . . . . .  G485 G487
      547   REWRITE-INIT-F2-01
      555   REWRITE-TEST-F2-01 . . . . . .  G575 G579 G592
      576   REWRITE-TEST-F2-01-1 . . . . .  G568
      589   REWRITE-TEST-F2-01-2 . . . . .  G574
      593   REWRITE-TEST-F2-01-3 . . . . .  G566 G588
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    20
0 Defined   Cross-reference of procedures   References

0     582   REWRITE-TEST-F2-02
      602   REWRITE-TEST-F2-03
      465   SECT-IX-02-001
      357   TERMINATE-CALL
      355   TERMINATE-CCVS
      418   WRITE-LINE . . . . . . . . . .  P368 P369 P377 P378 P379 P380 P382 P383 P384 P386 P388 P397 P405 P411 P416 P417
                                            P445 P449 P451 P460
      434   WRT-LN . . . . . . . . . . . .  P424 P425 P426 P427 P428 P429 P430 P433 P438
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    21
0 Defined   Cross-reference of programs     References

        3   IX102A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX102A    Date 06/04/2022  Time 11:56:58   Page    22
0LineID  Message code  Message text

     71  IGYDS1298-I   Assignment-name "XXXXP044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXP044" was treated as comments.

     93  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     96  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     96  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       4           4
-* Statistics for COBOL program IX102A:
 *    Source records = 698
 *    Data Division statements = 114
 *    Procedure Division statements = 336
 *    Generated COBOL statements = 0
 *    Program complexity factor = 345
0End of compilation 1,  program IX102A,  highest severity 0.
0Return code 0
