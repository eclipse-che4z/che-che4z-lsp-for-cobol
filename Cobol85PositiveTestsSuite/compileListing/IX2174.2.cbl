1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:42   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:42   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2174.2
   000002         000200 PROGRAM-ID.                                                      IX2174.2
   000003         000300     IX217A.                                                      IX2174.2
   000004         000500*                                                              *  IX2174.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2174.2
   000006         000700*                                                              *  IX2174.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2174.2
   000008         000900*                                                              *  IX2174.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2174.2
   000010         001100*                                                              *  IX2174.2
   000011         001300*                                                                 IX2174.2
   000012         001400*                      THE FUNCTION OF THIS PROGRAM IS TO CREATE  IX2174.2
   000013         001500*     THE  OPTIONAL  BUT  NOT EXISTING INDEXED FILES BY THE OPEN  IX2174.2
   000014         001600*     I-O  AND  THE OPEN EXTEND STATEMENTS. THE FILE STATUS CODE  IX2174.2
   000015         001700*     FOR  BOTH  FILES  MUST  BE  "05" AFTER PROCESSING THE OPEN  IX2174.2
   000016         001800*     STATEMENT. FILE IX-FS1 CONTAINS 50 RECORDS AFTER CORRECT    IX2174.2
   000017         001900*     EXECUTION AND FILE IX-VS1 CONTAINS 25 LONG RECORDS (240)    IX2174.2
   000018         002000*     AND 25 SHORT RECORDS (200) AFTER CORRECT EXECUTION.         IX2174.2
   000019         002100*                                                                 IX2174.2
   000020         002200*                                                                 IX2174.2
   000021         002300*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX2174.2
   000022         002400*                                                                 IX2174.2
   000023         002500*             X-24   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2174.2
   000024         002600*                    CLAUSE FOR DATA FILE IX-FS1                  IX2174.2
   000025         002700*             X-25   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2174.2
   000026         002800*                    CLAUSE FOR DATA FILE IX-VS1                  IX2174.2
   000027         002900*             X-44   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2174.2
   000028         003000*                    CLAUSE FOR INDEX FILE IX-FS1                 IX2174.2
   000029         003100*             X-45   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2174.2
   000030         003200*                    CLAUSE FOR INDEX FILE IX-VS1                 IX2174.2
   000031         003300*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX2174.2
   000032         003400*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX2174.2
   000033         003500*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX2174.2
   000034         003600*                                                                 IX2174.2
   000035         003700*         NOTE:  X-CARDS 44 AND 62          ARE OPTIONAL          IX2174.2
   000036         003800*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX2174.2
   000037         003900*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX2174.2
   000038         004000*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX2174.2
   000039         004100*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX2174.2
   000040         004200*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX2174.2
   000041         004300*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX2174.2
   000042         004400*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX2174.2
   000043         004500*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX2174.2
   000044         004600*               THEY ARE AS FOLLOWS                               IX2174.2
   000045         004700*                                                                 IX2174.2
   000046         004800*                  J  SELECTS X-CARD 44                           IX2174.2
   000047         004900*                  J  SELECTS X-CARD 45                           IX2174.2
   000048         005000*                  C  SELECTS X-CARD 84                           IX2174.2
   000049         005100*                                                                 IX2174.2
   000050         005300 ENVIRONMENT DIVISION.                                            IX2174.2
   000051         005400 CONFIGURATION SECTION.                                           IX2174.2
   000052         005500 SOURCE-COMPUTER.                                                 IX2174.2
   000053         005600     XXXXX082.                                                    IX2174.2
   000054         005700 OBJECT-COMPUTER.                                                 IX2174.2
   000055         005800     XXXXX083.                                                    IX2174.2
   000056         005900 INPUT-OUTPUT SECTION.                                            IX2174.2
   000057         006000 FILE-CONTROL.                                                    IX2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100     SELECT PRINT-FILE ASSIGN TO                                  IX2174.2 79
   000059         006200     XXXXX055.                                                    IX2174.2
   000060         006300                                                                  IX2174.2
   000061         006400     SELECT OPTIONAL   IX-FS1 ASSIGN TO                           IX2174.2 83
   000062         006500     XXXXP024                                                     IX2174.2
   000063         006600     XXXXP044                                                     IX2174.2

 ==000063==> IGYDS1298-I Assignment-name "XXXXP044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXP044" was treated as comments.

   000064         006700     ORGANIZATION IS INDEXED                                      IX2174.2
   000065         006800     RECORD KEY IS IX-FS1-KEY                                     IX2174.2 92
   000066         006900     ACCESS MODE IS DYNAMIC                                       IX2174.2
   000067         007000     FILE STATUS IS IX-FS1-STATUS.                                IX2174.2 174
   000068         007100                                                                  IX2174.2
   000069         007200     SELECT OPTIONAL   IX-VS1 ASSIGN TO                           IX2174.2 95
   000070         007300     XXXXP025                                                     IX2174.2
   000071         007400     XXXXP045                                                     IX2174.2

 ==000071==> IGYDS1298-I Assignment-name "XXXXP045" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXP045" was treated as comments.

   000072         007500     ORGANIZATION IS INDEXED                                      IX2174.2
   000073         007600     RECORD KEY IS IX-VS1-KEY                                     IX2174.2 105
   000074         007700     ACCESS MODE IS SEQUENTIAL                                    IX2174.2
   000075         007800     FILE STATUS IS IX-VS1-STATUS.                                IX2174.2 178
   000076         007900                                                                  IX2174.2
   000077         008000 DATA DIVISION.                                                   IX2174.2
   000078         008100 FILE SECTION.                                                    IX2174.2
   000079         008200 FD  PRINT-FILE.                                                  IX2174.2

 ==000079==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000080         008300 01  PRINT-REC PICTURE X(120).                                    IX2174.2
   000081         008400 01  DUMMY-RECORD PICTURE X(120).                                 IX2174.2
   000082         008500                                                                  IX2174.2
   000083         008600 FD  IX-FS1                                                       IX2174.2

 ==000083==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000083==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000084         008700     LABEL RECORD IS STANDARD                                     IX2174.2
   000085         008800     DATA RECORD IS IX-FS1R1-F-G-240                              IX2174.2 *
   000086         008900     BLOCK CONTAINS 1 RECORDS                                     IX2174.2
   000087         009000     RECORD CONTAINS 240 CHARACTERS.                              IX2174.2
   000088         009100 01  IX-FS1R1-F-G-240.                                            IX2174.2
   000089         009200     03 IX-FS1-WRK-120 PIC X(120).                                IX2174.2
   000090         009300     03 IX-FS1-GRP-120.                                           IX2174.2
   000091         009400     05 FILLER   PIC   X(8).                                      IX2174.2
   000092         009500     05 IX-FS1-KEY  PIC X(29).                                    IX2174.2
   000093         009600     05 FILLER PIC X(83).                                         IX2174.2
   000094         009700                                                                  IX2174.2
   000095         009800 FD  IX-VS1                                                       IX2174.2

 ==000095==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0
 ==000095==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000096         009900     LABEL RECORD IS STANDARD                                     IX2174.2
   000097         010000     DATA RECORD IS IX-VS1R1-F-G-240 IX-VS1R1-F-G-200             IX2174.2 * *
   000098         010100     BLOCK CONTAINS 1 RECORDS                                     IX2174.2
   000099         010200     RECORD VARYING  200 TO 240 DEPENDING REC-LENGTH.             IX2174.2 *
   000100         010300                                                                  IX2174.2
   000101         010400 01  IX-VS1R1-F-G-240.                                            IX2174.2
   000102         010500     03 IX-VS1-WRK-120 PIC X(120).                                IX2174.2
   000103         010600     03 IX-VS1-GRP-120.                                           IX2174.2
   000104         010700        05 FILLER   PIC   X(8).                                   IX2174.2
   000105         010800        05 IX-VS1-KEY  PIC X(29).                                 IX2174.2
   000106         010900        05 FILLER PIC X(83).                                      IX2174.2
   000107         011000                                                                  IX2174.2
   000108         011100 01  IX-VS1R1-F-G-200.                                            IX2174.2
   000109         011200     03 IX-VS1-WRK-120-SHORT PIC X(120).                          IX2174.2
   000110         011300     03 IX-VS1-GRP-80.                                            IX2174.2
   000111         011400        05 FILLER   PIC   X(8).                                   IX2174.2
   000112         011500        05 FILLER-KEY  PIC X(29).                                 IX2174.2
   000113         011600        05 VIERZIG PIC X(43).                                     IX2174.2
   000114         011700                                                                  IX2174.2
   000115         011800 WORKING-STORAGE SECTION.                                         IX2174.2
   000116         011900 01  REC-LENGTH       PIC 9999 VALUE ZERO.                        IX2174.2 IMP
   000117         012000 01  STATUS-ERROR     PIC    9 VALUE ZERO.                        IX2174.2 IMP
   000118         012100 01  GRP-0101.                                                    IX2174.2
   000119         012200     02 FILLER   PIC X(10)  VALUE "ABCDLKJXYZ".                   IX2174.2
   000120         012300     02 WRK-DU-09V00-001 PIC 9(9)  VALUE ZERO.                    IX2174.2 IMP
   000121         012400     02 FILLER  PIC X(10)  VALUE "ZIF,.$-+CD".                    IX2174.2
   000122         012500 01  FILE-RECORD-INFORMATION-REC.                                 IX2174.2
   000123         012600     03 FILE-RECORD-INFO-SKELETON.                                IX2174.2
   000124         012700        05 FILLER                 PICTURE X(48)       VALUE       IX2174.2
   000125         012800             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2174.2
   000126         012900        05 FILLER                 PICTURE X(46)       VALUE       IX2174.2
   000127         013000             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2174.2
   000128         013100        05 FILLER                 PICTURE X(26)       VALUE       IX2174.2
   000129         013200             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2174.2
   000130         013300        05 FILLER                 PICTURE X(37)       VALUE       IX2174.2
   000131         013400             ",RECKEY=                             ".             IX2174.2
   000132         013500        05 FILLER                 PICTURE X(38)       VALUE       IX2174.2
   000133         013600             ",ALTKEY1=                             ".            IX2174.2
   000134         013700        05 FILLER                 PICTURE X(38)       VALUE       IX2174.2
   000135         013800             ",ALTKEY2=                             ".            IX2174.2
   000136         013900        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2174.2 IMP
   000137         014000     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2174.2
   000138         014100        05 FILE-RECORD-INFO-P1-120.                               IX2174.2
   000139         014200           07 FILLER              PIC X(5).                       IX2174.2
   000140         014300           07 XFILE-NAME           PIC X(6).                      IX2174.2
   000141         014400           07 FILLER              PIC X(8).                       IX2174.2
   000142         014500           07 XRECORD-NAME         PIC X(6).                      IX2174.2
   000143         014600           07 FILLER              PIC X(1).                       IX2174.2
   000144         014700           07 REELUNIT-NUMBER     PIC 9(1).                       IX2174.2
   000145         014800           07 FILLER              PIC X(7).                       IX2174.2
   000146         014900           07 XRECORD-NUMBER       PIC 9(6).                      IX2174.2
   000147         015000           07 FILLER              PIC X(6).                       IX2174.2
   000148         015100           07 UPDATE-NUMBER       PIC 9(2).                       IX2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000149         015200           07 FILLER              PIC X(5).                       IX2174.2
   000150         015300           07 ODO-NUMBER          PIC 9(4).                       IX2174.2
   000151         015400           07 FILLER              PIC X(5).                       IX2174.2
   000152         015500           07 XPROGRAM-NAME        PIC X(5).                      IX2174.2
   000153         015600           07 FILLER              PIC X(7).                       IX2174.2
   000154         015700           07 XRECORD-LENGTH       PIC 9(6).                      IX2174.2
   000155         015800           07 FILLER              PIC X(7).                       IX2174.2
   000156         015900           07 CHARS-OR-RECORDS    PIC X(2).                       IX2174.2
   000157         016000           07 FILLER              PIC X(1).                       IX2174.2
   000158         016100           07 XBLOCK-SIZE          PIC 9(4).                      IX2174.2
   000159         016200           07 FILLER              PIC X(6).                       IX2174.2
   000160         016300           07 RECORDS-IN-FILE     PIC 9(6).                       IX2174.2
   000161         016400           07 FILLER              PIC X(5).                       IX2174.2
   000162         016500           07 XFILE-ORGANIZATION   PIC X(2).                      IX2174.2
   000163         016600           07 FILLER              PIC X(6).                       IX2174.2
   000164         016700           07 XLABEL-TYPE          PIC X(1).                      IX2174.2
   000165         016800        05 FILE-RECORD-INFO-P121-240.                             IX2174.2
   000166         016900           07 FILLER              PIC X(8).                       IX2174.2
   000167         017000           07 XRECORD-KEY          PIC X(29).                     IX2174.2
   000168         017100           07 FILLER              PIC X(9).                       IX2174.2
   000169         017200           07 ALTERNATE-KEY1      PIC X(29).                      IX2174.2
   000170         017300           07 FILLER              PIC X(9).                       IX2174.2
   000171         017400           07 ALTERNATE-KEY2      PIC X(29).                      IX2174.2
   000172         017500           07 FILLER              PIC X(7).                       IX2174.2
   000173         017600                                                                  IX2174.2
   000174         017700 01  IX-FS1-STATUS.                                               IX2174.2
   000175         017800     05  IX-FS1-STAT1        PIC X.                               IX2174.2
   000176         017900     05  IX-FS1-STAT2        PIC X.                               IX2174.2
   000177         018000                                                                  IX2174.2
   000178         018100 01  IX-VS1-STATUS.                                               IX2174.2
   000179         018200     05  IX-VS1-STAT1        PIC X.                               IX2174.2
   000180         018300     05  IX-VS1-STAT2        PIC X.                               IX2174.2
   000181         018400                                                                  IX2174.2
   000182         018500 01  TEST-RESULTS.                                                IX2174.2
   000183         018600     02 FILLER                   PIC X      VALUE SPACE.          IX2174.2 IMP
   000184         018700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2174.2 IMP
   000185         018800     02 FILLER                   PIC X      VALUE SPACE.          IX2174.2 IMP
   000186         018900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2174.2 IMP
   000187         019000     02 FILLER                   PIC X      VALUE SPACE.          IX2174.2 IMP
   000188         019100     02  PAR-NAME.                                                IX2174.2
   000189         019200       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2174.2 IMP
   000190         019300       03  PARDOT-X              PIC X      VALUE SPACE.          IX2174.2 IMP
   000191         019400       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2174.2 IMP
   000192         019500     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2174.2 IMP
   000193         019600     02 RE-MARK                  PIC X(61).                       IX2174.2
   000194         019700 01  TEST-COMPUTED.                                               IX2174.2
   000195         019800     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2174.2 IMP
   000196         019900     02 FILLER                   PIC X(17)  VALUE                 IX2174.2
   000197         020000            "       COMPUTED=".                                   IX2174.2
   000198         020100     02 COMPUTED-X.                                               IX2174.2
   000199         020200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2174.2 IMP
   000200         020300     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2174.2 199
   000201         020400                                 PIC -9(9).9(9).                  IX2174.2
   000202         020500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2174.2 199
   000203         020600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2174.2 199
   000204         020700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2174.2 199
   000205         020800     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2174.2 199
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000206         020900         04 COMPUTED-18V0                    PIC -9(18).          IX2174.2
   000207         021000         04 FILLER                           PIC X.               IX2174.2
   000208         021100     03 FILLER PIC X(50) VALUE SPACE.                             IX2174.2 IMP
   000209         021200 01  TEST-CORRECT.                                                IX2174.2
   000210         021300     02 FILLER PIC X(30) VALUE SPACE.                             IX2174.2 IMP
   000211         021400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2174.2
   000212         021500     02 CORRECT-X.                                                IX2174.2
   000213         021600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2174.2 IMP
   000214         021700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2174.2 213
   000215         021800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2174.2 213
   000216         021900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2174.2 213
   000217         022000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2174.2 213
   000218         022100     03      CR-18V0 REDEFINES CORRECT-A.                         IX2174.2 213
   000219         022200         04 CORRECT-18V0                     PIC -9(18).          IX2174.2
   000220         022300         04 FILLER                           PIC X.               IX2174.2
   000221         022400     03 FILLER PIC X(2) VALUE SPACE.                              IX2174.2 IMP
   000222         022500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2174.2 IMP
   000223         022600 01  CCVS-C-1.                                                    IX2174.2
   000224         022700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2174.2
   000225         022800-    "SS  PARAGRAPH-NAME                                          IX2174.2
   000226         022900-    "       REMARKS".                                            IX2174.2
   000227         023000     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2174.2 IMP
   000228         023100 01  CCVS-C-2.                                                    IX2174.2
   000229         023200     02 FILLER                     PIC X        VALUE SPACE.      IX2174.2 IMP
   000230         023300     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2174.2
   000231         023400     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2174.2 IMP
   000232         023500     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2174.2
   000233         023600     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2174.2 IMP
   000234         023700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2174.2 IMP
   000235         023800 01  REC-CT                        PIC 99       VALUE ZERO.       IX2174.2 IMP
   000236         023900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2174.2 IMP
   000237         024000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2174.2 IMP
   000238         024100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2174.2 IMP
   000239         024200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2174.2 IMP
   000240         024300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2174.2 IMP
   000241         024400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2174.2 IMP
   000242         024500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2174.2 IMP
   000243         024600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2174.2 IMP
   000244         024700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2174.2 IMP
   000245         024800 01  CCVS-H-1.                                                    IX2174.2
   000246         024900     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2174.2 IMP
   000247         025000     02  FILLER                    PIC X(42)    VALUE             IX2174.2
   000248         025100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2174.2
   000249         025200     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2174.2 IMP
   000250         025300 01  CCVS-H-2A.                                                   IX2174.2
   000251         025400   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2174.2 IMP
   000252         025500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2174.2
   000253         025600   02  FILLER                        PIC XXXX   VALUE             IX2174.2
   000254         025700     "4.2 ".                                                      IX2174.2
   000255         025800   02  FILLER                        PIC X(28)  VALUE             IX2174.2
   000256         025900            " COPY - NOT FOR DISTRIBUTION".                       IX2174.2
   000257         026000   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2174.2 IMP
   000258         026100                                                                  IX2174.2
   000259         026200 01  CCVS-H-2B.                                                   IX2174.2
   000260         026300   02  FILLER                        PIC X(15)  VALUE             IX2174.2
   000261         026400            "TEST RESULT OF ".                                    IX2174.2
   000262         026500   02  TEST-ID                       PIC X(9).                    IX2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000263         026600   02  FILLER                        PIC X(4)   VALUE             IX2174.2
   000264         026700            " IN ".                                               IX2174.2
   000265         026800   02  FILLER                        PIC X(12)  VALUE             IX2174.2
   000266         026900     " HIGH       ".                                              IX2174.2
   000267         027000   02  FILLER                        PIC X(22)  VALUE             IX2174.2
   000268         027100            " LEVEL VALIDATION FOR ".                             IX2174.2
   000269         027200   02  FILLER                        PIC X(58)  VALUE             IX2174.2
   000270         027300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2174.2
   000271         027400 01  CCVS-H-3.                                                    IX2174.2
   000272         027500     02  FILLER                      PIC X(34)  VALUE             IX2174.2
   000273         027600            " FOR OFFICIAL USE ONLY    ".                         IX2174.2
   000274         027700     02  FILLER                      PIC X(58)  VALUE             IX2174.2
   000275         027800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2174.2
   000276         027900     02  FILLER                      PIC X(28)  VALUE             IX2174.2
   000277         028000            "  COPYRIGHT   1985 ".                                IX2174.2
   000278         028100 01  CCVS-E-1.                                                    IX2174.2
   000279         028200     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2174.2 IMP
   000280         028300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2174.2
   000281         028400     02 ID-AGAIN                     PIC X(9).                    IX2174.2
   000282         028500     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2174.2 IMP
   000283         028600 01  CCVS-E-2.                                                    IX2174.2
   000284         028700     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2174.2 IMP
   000285         028800     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2174.2 IMP
   000286         028900     02 CCVS-E-2-2.                                               IX2174.2
   000287         029000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2174.2 IMP
   000288         029100         03 FILLER                   PIC X      VALUE SPACE.      IX2174.2 IMP
   000289         029200         03 ENDER-DESC               PIC X(44)  VALUE             IX2174.2
   000290         029300            "ERRORS ENCOUNTERED".                                 IX2174.2
   000291         029400 01  CCVS-E-3.                                                    IX2174.2
   000292         029500     02  FILLER                      PIC X(22)  VALUE             IX2174.2
   000293         029600            " FOR OFFICIAL USE ONLY".                             IX2174.2
   000294         029700     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2174.2 IMP
   000295         029800     02  FILLER                      PIC X(58)  VALUE             IX2174.2
   000296         029900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2174.2
   000297         030000     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2174.2 IMP
   000298         030100     02 FILLER                       PIC X(15)  VALUE             IX2174.2
   000299         030200             " COPYRIGHT 1985".                                   IX2174.2
   000300         030300 01  CCVS-E-4.                                                    IX2174.2
   000301         030400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2174.2 IMP
   000302         030500     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2174.2
   000303         030600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2174.2 IMP
   000304         030700     02 FILLER                       PIC X(40)  VALUE             IX2174.2
   000305         030800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2174.2
   000306         030900 01  XXINFO.                                                      IX2174.2
   000307         031000     02 FILLER                       PIC X(19)  VALUE             IX2174.2
   000308         031100            "*** INFORMATION ***".                                IX2174.2
   000309         031200     02 INFO-TEXT.                                                IX2174.2
   000310         031300       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2174.2 IMP
   000311         031400       04 XXCOMPUTED                 PIC X(20).                   IX2174.2
   000312         031500       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2174.2 IMP
   000313         031600       04 XXCORRECT                  PIC X(20).                   IX2174.2
   000314         031700     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2174.2
   000315         031800 01  HYPHEN-LINE.                                                 IX2174.2
   000316         031900     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2174.2 IMP
   000317         032000     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2174.2
   000318         032100-    "*****************************************".                 IX2174.2
   000319         032200     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000320         032300-    "******************************".                            IX2174.2
   000321         032400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2174.2
   000322         032500     "IX217A".                                                    IX2174.2
   000323         032600 PROCEDURE DIVISION.                                              IX2174.2
   000324         032700 CCVS1 SECTION.                                                   IX2174.2
   000325         032800 OPEN-FILES.                                                      IX2174.2
   000326         032900     OPEN    OUTPUT PRINT-FILE.                                   IX2174.2 79
   000327         033000     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2174.2 321 262 321 281
   000328         033100     MOVE    SPACE TO TEST-RESULTS.                               IX2174.2 IMP 182
   000329         033200     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2174.2 359 364
   000330         033300     MOVE    ZERO TO REC-SKL-SUB.                                 IX2174.2 IMP 234
   000331         033400     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2174.2 332
   000332         033500 CCVS-INIT-FILE.                                                  IX2174.2
   000333         033600     ADD     1 TO REC-SKL-SUB.                                    IX2174.2 234
   000334         033700     MOVE    FILE-RECORD-INFO-SKELETON                            IX2174.2 123
   000335         033800          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2174.2 137 234
   000336         033900 CCVS-INIT-EXIT.                                                  IX2174.2
   000337         034000     GO TO CCVS1-EXIT.                                            IX2174.2 446
   000338         034100 CLOSE-FILES.                                                     IX2174.2
   000339         034200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2174.2 368 389 79
   000340         034300 TERMINATE-CCVS.                                                  IX2174.2
   000341         034400     STOP     RUN.                                                IX2174.2
   000342         034500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2174.2 186 238
   000343         034600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2174.2 186 239
   000344         034700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2174.2 186 237
   000345         034800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2174.2 186 236
   000346         034900     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2174.2 193
   000347         035000 PRINT-DETAIL.                                                    IX2174.2
   000348         035100     IF REC-CT NOT EQUAL TO ZERO                                  IX2174.2 235 IMP
   000349      1  035200             MOVE "." TO PARDOT-X                                 IX2174.2 190
   000350      1  035300             MOVE REC-CT TO DOTVALUE.                             IX2174.2 235 191
   000351         035400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2174.2 182 80 401
   000352         035500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2174.2 186 401
   000353      1  035600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2174.2 422 436
   000354      1  035700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2174.2 437 445
   000355         035800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2174.2 IMP 186 IMP 198
   000356         035900     MOVE SPACE TO CORRECT-X.                                     IX2174.2 IMP 212
   000357         036000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2174.2 235 IMP IMP 188
   000358         036100     MOVE     SPACE TO RE-MARK.                                   IX2174.2 IMP 193
   000359         036200 HEAD-ROUTINE.                                                    IX2174.2
   000360         036300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2174.2 245 81 401
   000361         036400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2174.2 250 81 401
   000362         036500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2174.2 259 81 401
   000363         036600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2174.2 271 81 401
   000364         036700 COLUMN-NAMES-ROUTINE.                                            IX2174.2
   000365         036800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2174.2 223 81 401
   000366         036900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2174.2 228 81 401
   000367         037000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2174.2 315 81 401
   000368         037100 END-ROUTINE.                                                     IX2174.2
   000369         037200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2174.2 315 81 401
   000370         037300 END-RTN-EXIT.                                                    IX2174.2
   000371         037400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2174.2 278 81 401
   000372         037500 END-ROUTINE-1.                                                   IX2174.2
   000373         037600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2174.2 237 241 238
   000374         037700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2174.2 241 236 241
   000375         037800      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2174.2 239 241
   000376         037900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000377         038000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2174.2 239 301
   000378         038100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2174.2 241 303
   000379         038200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2174.2 300 286
   000380         038300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2174.2 283 81 401
   000381         038400  END-ROUTINE-12.                                                 IX2174.2
   000382         038500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2174.2 289
   000383         038600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2174.2 237 IMP
   000384      1  038700         MOVE "NO " TO ERROR-TOTAL                                IX2174.2 287
   000385         038800         ELSE                                                     IX2174.2
   000386      1  038900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2174.2 237 287
   000387         039000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2174.2 283 81
   000388         039100     PERFORM WRITE-LINE.                                          IX2174.2 401
   000389         039200 END-ROUTINE-13.                                                  IX2174.2
   000390         039300     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2174.2 236 IMP
   000391      1  039400         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2174.2 287
   000392      1  039500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2174.2 236 287
   000393         039600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2174.2 289
   000394         039700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2174.2 283 81 401
   000395         039800      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2174.2 238 IMP
   000396      1  039900          MOVE "NO " TO ERROR-TOTAL                               IX2174.2 287
   000397      1  040000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2174.2 238 287
   000398         040100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2174.2 289
   000399         040200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2174.2 283 81 401
   000400         040300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2174.2 291 81 401
   000401         040400 WRITE-LINE.                                                      IX2174.2
   000402         040500     ADD 1 TO RECORD-COUNT.                                       IX2174.2 243
   000403         040600     IF RECORD-COUNT GREATER 42                                   IX2174.2 243
   000404      1  040700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2174.2 81 242
   000405      1  040800         MOVE SPACE TO DUMMY-RECORD                               IX2174.2 IMP 81
   000406      1  040900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2174.2 81
   000407      1  041000         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2174.2 245 81 417
   000408      1  041100         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2174.2 250 81 417
   000409      1  041200         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2174.2 259 81 417
   000410      1  041300         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2174.2 271 81 417
   000411      1  041400         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2174.2 223 81 417
   000412      1  041500         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2174.2 228 81 417
   000413      1  041600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2174.2 315 81 417
   000414      1  041700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2174.2 242 81
   000415      1  041800         MOVE ZERO TO RECORD-COUNT.                               IX2174.2 IMP 243
   000416         041900     PERFORM WRT-LN.                                              IX2174.2 417
   000417         042000 WRT-LN.                                                          IX2174.2
   000418         042100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2174.2 81
   000419         042200     MOVE SPACE TO DUMMY-RECORD.                                  IX2174.2 IMP 81
   000420         042300 BLANK-LINE-PRINT.                                                IX2174.2
   000421         042400     PERFORM WRT-LN.                                              IX2174.2 417
   000422         042500 FAIL-ROUTINE.                                                    IX2174.2
   000423         042600     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2174.2 198 IMP
   000424      1  042700            GO TO   FAIL-ROUTINE-WRITE.                           IX2174.2 431
   000425         042800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2174.2 212 IMP 431
   000426         042900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2174.2 244 314
   000427         043000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2174.2 309
   000428         043100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2174.2 306 81 401
   000429         043200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2174.2 IMP 314
   000430         043300     GO TO  FAIL-ROUTINE-EX.                                      IX2174.2 436
   000431         043400 FAIL-ROUTINE-WRITE.                                              IX2174.2
   000432         043500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2174.2 194 80 401
   000433         043600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2174.2 244 222
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000434         043700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2174.2 209 80 401
   000435         043800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2174.2 IMP 222
   000436         043900 FAIL-ROUTINE-EX. EXIT.                                           IX2174.2
   000437         044000 BAIL-OUT.                                                        IX2174.2
   000438         044100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2174.2 199 IMP 440
   000439         044200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2174.2 213 IMP 445
   000440         044300 BAIL-OUT-WRITE.                                                  IX2174.2
   000441         044400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2174.2 213 313 199 311
   000442         044500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2174.2 244 314
   000443         044600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2174.2 306 81 401
   000444         044700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2174.2 IMP 314
   000445         044800 BAIL-OUT-EX. EXIT.                                               IX2174.2
   000446         044900 CCVS1-EXIT.                                                      IX2174.2
   000447         045000     EXIT.                                                        IX2174.2
   000448         045100                                                                  IX2174.2
   000449         045300*   TEST  1                                                      *IX2174.2
   000450         045400*         OPEN I-O  (ACCESS IS DYNAMIC) OPTIONAL NOT EXISTING FILEIX2174.2
   000451         045500*                                       05  EXPECTED             *IX2174.2
   000452         045600*         IX-3, 1.3.4 (1) D                                      *IX2174.2
   000453         045800 SECT-IX-01-001 SECTION.                                          IX2174.2
   000454         045900 OPN-INIT-GF-01.                                                  IX2174.2
   000455         046000     MOVE SPACES TO IX-FS1-STATUS.                                IX2174.2 IMP 174
   000456         046100     MOVE "OPEN I-O:    05 EXP." TO FEATURE.                      IX2174.2 184
   000457         046200     MOVE "OPN-TEST-GF-01      " TO PAR-NAME.                     IX2174.2 188
   000458         046300 OPN-TEST-GF-01.                                                  IX2174.2
   000459         046400     OPEN                                                         IX2174.2
   000460         046500          I-O     IX-FS1.                                         IX2174.2 83
   000461         046600     IF IX-FS1-STATUS      = "05"                                 IX2174.2 174
   000462      1  046700         GO TO OPN-PASS-GF-01.                                    IX2174.2 469
   000463         046800 OPN-FAIL-GF-01.                                                  IX2174.2
   000464         046900     MOVE "IX-3, 1.3.4, (1) D. " TO RE-MARK.                      IX2174.2 193
   000465         047000     PERFORM FAIL.                                                IX2174.2 344
   000466         047100     MOVE IX-FS1-STATUS TO COMPUTED-A.                            IX2174.2 174 199
   000467         047200     MOVE "05" TO CORRECT-X.                                      IX2174.2 212
   000468         047300     GO TO OPN-WRITE-GF-01.                                       IX2174.2 471
   000469         047400 OPN-PASS-GF-01.                                                  IX2174.2
   000470         047500     PERFORM PASS.                                                IX2174.2 343
   000471         047600 OPN-WRITE-GF-01.                                                 IX2174.2
   000472         047700     PERFORM PRINT-DETAIL.                                        IX2174.2 347
   000473         047800                                                                  IX2174.2
   000474         048000*   TEST  2                                                      *IX2174.2
   000475         048100*         WRITE                            00 EXPECTED           *IX2174.2
   000476         048200*         IX-3, 1.3.4 (1) A                                      *IX2174.2
   000477         048400 WRI-INIT-GF-01.                                                  IX2174.2
   000478         048500     MOVE    240 TO REC-LENGTH.                                   IX2174.2 116
   000479         048600     MOVE   ZERO TO STATUS-ERROR.                                 IX2174.2 IMP 117
   000480         048700     MOVE     "WRI-TEST-GF-01  " TO PAR-NAME                      IX2174.2 188
   000481         048800     MOVE     "WRITE (OPT)F 00 EXP." TO FEATURE.                  IX2174.2 184
   000482         048900     MOVE     "IX-FS1" TO XFILE-NAME (1).                         IX2174.2 140
   000483         049000     MOVE    "IX-F-G" TO XRECORD-NAME (1).                        IX2174.2 142
   000484         049100     MOVE  CCVS-PGM-ID TO XPROGRAM-NAME (1).                      IX2174.2 321 152
   000485         049200     MOVE    000240  TO XRECORD-LENGTH (1).                       IX2174.2 154
   000486         049300     MOVE     "RC"     TO CHARS-OR-RECORDS (1).                   IX2174.2 156
   000487         049400     MOVE     0001     TO XBLOCK-SIZE (1).                        IX2174.2 158
   000488         049500     MOVE     000500   TO RECORDS-IN-FILE (1).                    IX2174.2 160
   000489         049600     MOVE    "IX"  TO XFILE-ORGANIZATION (1).                     IX2174.2 162
   000490         049700     MOVE     "S"      TO XLABEL-TYPE (1).                        IX2174.2 164
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000491         049800     MOVE     000001   TO XRECORD-NUMBER (1).                     IX2174.2 146
   000492         049900 WRI-TEST-GF-01.                                                  IX2174.2
   000493         050000     MOVE    XRECORD-NUMBER (1) TO WRK-DU-09V00-001.              IX2174.2 146 120
   000494         050100     MOVE    GRP-0101 TO XRECORD-KEY (1).                         IX2174.2 118 167
   000495         050200     MOVE    FILE-RECORD-INFO (1) TO IX-FS1R1-F-G-240.            IX2174.2 137 88
   000496         050300     WRITE   IX-FS1R1-F-G-240                                     IX2174.2 88
   000497      1  050400              INVALID KEY GO TO WRI-FAIL-GF-01.                   IX2174.2 507
   000498         050500     IF IX-FS1-STATUS NOT EQUAL TO "00"                           IX2174.2 174
   000499      1  050600          MOVE 1 TO STATUS-ERROR.                                 IX2174.2 117
   000500         050700     IF      XRECORD-NUMBER (1) EQUAL TO 50                       IX2174.2 146
   000501      1  050800             GO TO WRI-TEST-GF-01-1.                              IX2174.2 504
   000502         050900     ADD      000001 TO XRECORD-NUMBER (1).                       IX2174.2 146
   000503         051000     GO       TO WRI-TEST-GF-01.                                  IX2174.2 492
   000504         051100 WRI-TEST-GF-01-1.                                                IX2174.2
   000505         051200     IF STATUS-ERROR EQUAL TO ZERO                                IX2174.2 117 IMP
   000506      1  051300                GO TO WRI-PASS-GF-01.                             IX2174.2 511
   000507         051400 WRI-FAIL-GF-01.                                                  IX2174.2
   000508         051500     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX2174.2 193
   000509         051600     PERFORM FAIL.                                                IX2174.2 344
   000510         051700     GO TO WRI-WRITE-GF-01.                                       IX2174.2 513
   000511         051800 WRI-PASS-GF-01.                                                  IX2174.2
   000512         051900     PERFORM PASS.                                                IX2174.2 343
   000513         052000 WRI-WRITE-GF-01.                                                 IX2174.2
   000514         052100     PERFORM PRINT-DETAIL.                                        IX2174.2 347
   000515         052200                                                                  IX2174.2
   000516         052300     CLOSE    IX-FS1.                                             IX2174.2 83
   000517         052500*   TEST  3                                                      *IX2174.2
   000518         052600*         READ                               00 EXPECTED         *IX2174.2
   000519         052700*         IX-3, 1.3.4 (1) A                                      *IX2174.2
   000520         052900 READ-INIT-F1-01.                                                 IX2174.2
   000521         053000     OPEN     INPUT     IX-FS1.                                   IX2174.2 83
   000522         053100     MOVE   ZERO TO WRK-DU-09V00-001.                             IX2174.2 IMP 120
   000523         053200 READ-TEST-F1-01.                                                 IX2174.2
   000524         053300     READ     IX-FS1 NEXT RECORD                                  IX2174.2 83
   000525      1  053400              AT END GO TO READ-TEST-F1-01-1.                     IX2174.2 540
   000526         053500     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2174.2 88 137
   000527         053600     ADD     1  TO WRK-DU-09V00-001.                              IX2174.2 120
   000528         053700     IF      WRK-DU-09V00-001     GREATER 50                      IX2174.2 120
   000529      1  053800             MOVE "MORE THAN 50  RECORDS" TO RE-MARK              IX2174.2 193
   000530      1  053900              GO TO READ-TEST-F1-01-1.                            IX2174.2 540
   000531         054000     IF XRECORD-NUMBER (1) = WRK-DU-09V00-001                     IX2174.2 146 120
   000532      1  054100             GO TO READ-TEST-F1-01                                IX2174.2 523
   000533         054200         ELSE                                                     IX2174.2
   000534      1  054300             MOVE "WRONG RECORD NUMBER" TO RE-MARK                IX2174.2 193
   000535      1  054400             PERFORM FAIL                                         IX2174.2 344
   000536      1  054500             MOVE "READ (TO VERIFY)" TO FEATURE                   IX2174.2 184
   000537      1  054600             MOVE "READ-TEST-F1-01" TO PAR-NAME                   IX2174.2 188
   000538      1  054700             PERFORM PRINT-DETAIL                                 IX2174.2 347
   000539      1  054800             GO TO READ-TEST-F1-01-3.                             IX2174.2 552
   000540         054900 READ-TEST-F1-01-1.                                               IX2174.2
   000541         055000     IF       XRECORD-NUMBER (1) NOT EQUAL TO 50                  IX2174.2 146
   000542      1  055100              PERFORM FAIL                                        IX2174.2 344
   000543         055200              ELSE                                                IX2174.2
   000544      1  055300              PERFORM PASS.                                       IX2174.2 343
   000545         055400     GO       TO READ-TEST-F1-01-2.                               IX2174.2 546
   000546         055500 READ-TEST-F1-01-2.                                               IX2174.2
   000547         055600     MOVE     "READ  (TO VERIFY)   " TO FEATURE.                  IX2174.2 184
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000548         055700     MOVE     "READ-TEST-F1-01" TO PAR-NAME.                      IX2174.2 188
   000549         055800     MOVE     "FILE VERIFIED, LFILE" TO COMPUTED-A.               IX2174.2 199
   000550         055900     MOVE    XRECORD-NUMBER (1) TO CORRECT-18V0.                  IX2174.2 146 219
   000551         056000     PERFORM  PRINT-DETAIL.                                       IX2174.2 347
   000552         056100 READ-TEST-F1-01-3.                                               IX2174.2
   000553         056200     CLOSE   IX-FS1.                                              IX2174.2 83
   000554         056300                                                                  IX2174.2
   000555         056500*   TEST  4                                                      *IX2174.2
   000556         056600*       OPEN EXTEND (ACCESS IS DYNAMIC) OPTIONAL NOT EXISTING FILEIX2174.2
   000557         056700*                                       05  EXPECTED             *IX2174.2
   000558         056800*         IX-3, 1.3.4 (1) D                                      *IX2174.2
   000559         057000 OPN-INIT-GF-02.                                                  IX2174.2
   000560         057100     MOVE SPACES TO IX-VS1-STATUS.                                IX2174.2 IMP 178
   000561         057200     MOVE "OPEN EXTEND: 05 EXP." TO FEATURE.                      IX2174.2 184
   000562         057300     MOVE "OPN-TEST-GF-02      " TO PAR-NAME.                     IX2174.2 188
   000563         057400 OPN-TEST-GF-02.                                                  IX2174.2
   000564         057500     OPEN                                                         IX2174.2
   000565         057600          EXTEND  IX-VS1.                                         IX2174.2 95
   000566         057700     IF IX-VS1-STATUS      = "05"                                 IX2174.2 178
   000567      1  057800         GO TO OPN-PASS-GF-02.                                    IX2174.2 574
   000568         057900 OPN-FAIL-GF-02.                                                  IX2174.2
   000569         058000     MOVE "IX-3, 1.3.4, (1) D. " TO RE-MARK.                      IX2174.2 193
   000570         058100     PERFORM FAIL.                                                IX2174.2 344
   000571         058200     MOVE IX-VS1-STATUS TO COMPUTED-A.                            IX2174.2 178 199
   000572         058300     MOVE "05" TO CORRECT-X.                                      IX2174.2 212
   000573         058400     GO TO OPN-WRITE-GF-02.                                       IX2174.2 576
   000574         058500 OPN-PASS-GF-02.                                                  IX2174.2
   000575         058600     PERFORM PASS.                                                IX2174.2 343
   000576         058700 OPN-WRITE-GF-02.                                                 IX2174.2
   000577         058800     PERFORM PRINT-DETAIL.                                        IX2174.2 347
   000578         058900                                                                  IX2174.2
   000579         059100*   TEST  5                                                      *IX2174.2
   000580         059200*         WRITE                            00 EXPECTED           *IX2174.2
   000581         059300*         IX-3, 1.3.4 (1) A                                      *IX2174.2
   000582         059500 WRI-INIT-GF-02.                                                  IX2174.2
   000583         059600     MOVE    240 TO REC-LENGTH.                                   IX2174.2 116
   000584         059700     MOVE   ZERO TO STATUS-ERROR.                                 IX2174.2 IMP 117
   000585         059800     MOVE     "WRI-TEST-GF-02  " TO PAR-NAME                      IX2174.2 188
   000586         059900     MOVE     "WRITE (OPT)S 00 EXP." TO FEATURE.                  IX2174.2 184
   000587         060000     MOVE     "IX-VS1" TO XFILE-NAME (1).                         IX2174.2 140
   000588         060100     MOVE    " LONG " TO XRECORD-NAME (1).                        IX2174.2 142
   000589         060200     MOVE  CCVS-PGM-ID TO XPROGRAM-NAME (1).                      IX2174.2 321 152
   000590         060300     MOVE    000240  TO XRECORD-LENGTH (1).                       IX2174.2 154
   000591         060400     MOVE     "RC"     TO CHARS-OR-RECORDS (1).                   IX2174.2 156
   000592         060500     MOVE     0001     TO XBLOCK-SIZE (1).                        IX2174.2 158
   000593         060600     MOVE     000500   TO RECORDS-IN-FILE (1).                    IX2174.2 160
   000594         060700     MOVE    "IX"  TO XFILE-ORGANIZATION (1).                     IX2174.2 162
   000595         060800     MOVE     "S"      TO XLABEL-TYPE (1).                        IX2174.2 164
   000596         060900     MOVE     000001   TO XRECORD-NUMBER (1).                     IX2174.2 146
   000597         061000 WRI-TEST-GF-02.                                                  IX2174.2
   000598         061100     MOVE    XRECORD-NUMBER (1) TO WRK-DU-09V00-001.              IX2174.2 146 120
   000599         061200     MOVE    GRP-0101 TO XRECORD-KEY (1).                         IX2174.2 118 167
   000600         061300     MOVE    FILE-RECORD-INFO (1) TO IX-VS1R1-F-G-240.            IX2174.2 137 101
   000601         061400     IF XRECORD-NUMBER (1) LESS THAN 26                           IX2174.2 146
   000602      1  061500         WRITE   IX-VS1R1-F-G-240                                 IX2174.2 101
   000603      2  061600              INVALID KEY GO TO WRI-FAIL-GF-02.                   IX2174.2 622
   000604         061700     IF IX-VS1-STATUS NOT EQUAL TO "00"                           IX2174.2 178
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000605      1  061800          MOVE 1 TO STATUS-ERROR.                                 IX2174.2 117
   000606         061900     IF XRECORD-NUMBER (1) GREATER THAN 25                        IX2174.2 146
   000607      1  062000         WRITE   IX-VS1R1-F-G-200                                 IX2174.2 108
   000608      2  062100              INVALID KEY GO TO WRI-FAIL-GF-02.                   IX2174.2 622
   000609         062200     IF IX-VS1-STATUS NOT EQUAL TO "00"                           IX2174.2 178
   000610      1  062300          MOVE 1 TO STATUS-ERROR.                                 IX2174.2 117
   000611         062400     IF      XRECORD-NUMBER (1) EQUAL TO 50                       IX2174.2 146
   000612      1  062500             GO TO WRI-TEST-GF-02-1.                              IX2174.2 619
   000613         062600     IF      XRECORD-NUMBER (1) EQUAL TO 25                       IX2174.2 146
   000614      1  062700             MOVE " SHORT" TO XRECORD-NAME   (1)                  IX2174.2 142
   000615      1  062800             MOVE 200 TO REC-LENGTH                               IX2174.2 116
   000616      1  062900             MOVE 000200 TO XRECORD-LENGTH (1).                   IX2174.2 154
   000617         063000     ADD      000001 TO XRECORD-NUMBER (1).                       IX2174.2 146
   000618         063100     GO       TO WRI-TEST-GF-02.                                  IX2174.2 597
   000619         063200 WRI-TEST-GF-02-1.                                                IX2174.2
   000620         063300     IF STATUS-ERROR EQUAL TO ZERO                                IX2174.2 117 IMP
   000621      1  063400                GO TO WRI-PASS-GF-02.                             IX2174.2 626
   000622         063500 WRI-FAIL-GF-02.                                                  IX2174.2
   000623         063600     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX2174.2 193
   000624         063700     PERFORM FAIL.                                                IX2174.2 344
   000625         063800     GO TO WRI-WRITE-GF-02.                                       IX2174.2 628
   000626         063900 WRI-PASS-GF-02.                                                  IX2174.2
   000627         064000     PERFORM PASS.                                                IX2174.2 343
   000628         064100 WRI-WRITE-GF-02.                                                 IX2174.2
   000629         064200     PERFORM PRINT-DETAIL.                                        IX2174.2 347
   000630         064300                                                                  IX2174.2
   000631         064400     CLOSE    IX-VS1.                                             IX2174.2 95
   000632         064600*   TEST  6                                                      *IX2174.2
   000633         064700*         READ                               00 EXPECTED         *IX2174.2
   000634         064800*         IX-3, 1.3.4 (1) A                                      *IX2174.2
   000635         065000 READ-INIT-F1-02.                                                 IX2174.2
   000636         065100     OPEN     INPUT     IX-VS1.                                   IX2174.2 95
   000637         065200     MOVE   ZERO TO WRK-DU-09V00-001.                             IX2174.2 IMP 120
   000638         065300 READ-TEST-F1-02.                                                 IX2174.2
   000639         065400     READ     IX-VS1 NEXT RECORD                                  IX2174.2 95
   000640      1  065500              AT END GO TO READ-TEST-F1-02-1.                     IX2174.2 655
   000641         065600     MOVE    IX-VS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2174.2 101 137
   000642         065700     ADD     1  TO WRK-DU-09V00-001.                              IX2174.2 120
   000643         065800     IF      WRK-DU-09V00-001     GREATER 50                      IX2174.2 120
   000644      1  065900             MOVE "MORE THAN 50  RECORDS" TO RE-MARK              IX2174.2 193
   000645      1  066000              GO TO READ-TEST-F1-02-1.                            IX2174.2 655
   000646         066100     IF XRECORD-NUMBER (1) = WRK-DU-09V00-001                     IX2174.2 146 120
   000647      1  066200              GO TO READ-TEST-F1-02                               IX2174.2 638
   000648         066300         ELSE                                                     IX2174.2
   000649      1  066400              MOVE "WRONG RECORD NUMBER" TO RE-MARK               IX2174.2 193
   000650      1  066500              PERFORM FAIL                                        IX2174.2 344
   000651      1  066600              MOVE "READ (TO VERIFY)" TO FEATURE                  IX2174.2 184
   000652      1  066700              MOVE "READ-TEST-F1-02" TO PAR-NAME                  IX2174.2 188
   000653      1  066800              PERFORM PRINT-DETAIL                                IX2174.2 347
   000654      1  066900              GO TO READ-TEST-F1-02-3.                            IX2174.2 666
   000655         067000 READ-TEST-F1-02-1.                                               IX2174.2
   000656         067100     IF       XRECORD-NUMBER (1) NOT EQUAL TO 50                  IX2174.2 146
   000657      1  067200              PERFORM FAIL                                        IX2174.2 344
   000658         067300              ELSE                                                IX2174.2
   000659      1  067400              PERFORM PASS.                                       IX2174.2 343
   000660         067500 READ-TEST-F1-02-2.                                               IX2174.2
   000661         067600     MOVE     "READ  (TO VERIFY)   " TO FEATURE.                  IX2174.2 184
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000662         067700     MOVE     "READ-TEST-F1-02" TO PAR-NAME.                      IX2174.2 188
   000663         067800     MOVE     "FILE VERIFIED, LFILE" TO COMPUTED-A.               IX2174.2 199
   000664         067900     MOVE    XRECORD-NUMBER (1) TO CORRECT-18V0.                  IX2174.2 146 219
   000665         068000     PERFORM  PRINT-DETAIL.                                       IX2174.2 347
   000666         068100 READ-TEST-F1-02-3.                                               IX2174.2
   000667         068200     CLOSE   IX-VS1.                                              IX2174.2 95
   000668         068300                                                                  IX2174.2
   000669         068400                                                                  IX2174.2
   000670         068500 CCVS-EXIT SECTION.                                               IX2174.2
   000671         068600 CCVS-999999.                                                     IX2174.2
   000672         068700     GO TO CLOSE-FILES.                                           IX2174.2 338
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      169   ALTERNATE-KEY1
      171   ALTERNATE-KEY2
      244   ANSI-REFERENCE . . . . . . . .  426 433 442
      223   CCVS-C-1 . . . . . . . . . . .  365 411
      228   CCVS-C-2 . . . . . . . . . . .  366 412
      278   CCVS-E-1 . . . . . . . . . . .  371
      283   CCVS-E-2 . . . . . . . . . . .  380 387 394 399
      286   CCVS-E-2-2 . . . . . . . . . .  M379
      291   CCVS-E-3 . . . . . . . . . . .  400
      300   CCVS-E-4 . . . . . . . . . . .  379
      301   CCVS-E-4-1 . . . . . . . . . .  M377
      303   CCVS-E-4-2 . . . . . . . . . .  M378
      245   CCVS-H-1 . . . . . . . . . . .  360 407
      250   CCVS-H-2A. . . . . . . . . . .  361 408
      259   CCVS-H-2B. . . . . . . . . . .  362 409
      271   CCVS-H-3 . . . . . . . . . . .  363 410
      321   CCVS-PGM-ID. . . . . . . . . .  327 327 484 589
      156   CHARS-OR-RECORDS . . . . . . .  M486 M591
      205   CM-18V0
      199   COMPUTED-A . . . . . . . . . .  200 202 203 204 205 438 441 M466 M549 M571 M663
      200   COMPUTED-N
      198   COMPUTED-X . . . . . . . . . .  M355 423
      202   COMPUTED-0V18
      204   COMPUTED-14V4
      206   COMPUTED-18V0
      203   COMPUTED-4V14
      222   COR-ANSI-REFERENCE . . . . . .  M433 M435
      213   CORRECT-A. . . . . . . . . . .  214 215 216 217 218 439 441
      214   CORRECT-N
      212   CORRECT-X. . . . . . . . . . .  M356 425 M467 M572
      215   CORRECT-0V18
      217   CORRECT-14V4
      219   CORRECT-18V0 . . . . . . . . .  M550 M664
      216   CORRECT-4V14
      218   CR-18V0
      236   DELETE-COUNTER . . . . . . . .  M345 374 390 392
      191   DOTVALUE . . . . . . . . . . .  M350
      242   DUMMY-HOLD . . . . . . . . . .  M404 414
       81   DUMMY-RECORD . . . . . . . . .  M360 M361 M362 M363 M365 M366 M367 M369 M371 M380 M387 M394 M399 M400 404 M405
                                            406 M407 M408 M409 M410 M411 M412 M413 M414 418 M419 M428 M443
      289   ENDER-DESC . . . . . . . . . .  M382 M393 M398
      237   ERROR-COUNTER. . . . . . . . .  M344 373 383 386
      241   ERROR-HOLD . . . . . . . . . .  M373 M374 M374 M375 378
      287   ERROR-TOTAL. . . . . . . . . .  M384 M386 M391 M392 M396 M397
      184   FEATURE. . . . . . . . . . . .  M456 M481 M536 M547 M561 M586 M651 M661
      137   FILE-RECORD-INFO . . . . . . .  M335 495 M526 600 M641
      138   FILE-RECORD-INFO-P1-120
      165   FILE-RECORD-INFO-P121-240
      123   FILE-RECORD-INFO-SKELETON. . .  334
      122   FILE-RECORD-INFORMATION-REC
      112   FILLER-KEY
      118   GRP-0101 . . . . . . . . . . .  494 599
      315   HYPHEN-LINE. . . . . . . . . .  367 369 413
      281   ID-AGAIN . . . . . . . . . . .  M327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    17
0 Defined   Cross-reference of data names   References

0     314   INF-ANSI-REFERENCE . . . . . .  M426 M429 M442 M444
      309   INFO-TEXT. . . . . . . . . . .  M427
      238   INSPECT-COUNTER. . . . . . . .  M342 373 395 397
       83   IX-FS1 . . . . . . . . . . . .  61 460 516 521 524 553
       90   IX-FS1-GRP-120
       92   IX-FS1-KEY . . . . . . . . . .  65
      174   IX-FS1-STATUS. . . . . . . . .  67 M455 461 466 498
      175   IX-FS1-STAT1
      176   IX-FS1-STAT2
       89   IX-FS1-WRK-120
       88   IX-FS1R1-F-G-240 . . . . . . .  M495 496 526
       95   IX-VS1 . . . . . . . . . . . .  69 565 631 636 639 667
      103   IX-VS1-GRP-120
      110   IX-VS1-GRP-80
      105   IX-VS1-KEY . . . . . . . . . .  73
      178   IX-VS1-STATUS. . . . . . . . .  75 M560 566 571 604 609
      179   IX-VS1-STAT1
      180   IX-VS1-STAT2
      102   IX-VS1-WRK-120
      109   IX-VS1-WRK-120-SHORT
      108   IX-VS1R1-F-G-200 . . . . . . .  607
      101   IX-VS1R1-F-G-240 . . . . . . .  M600 602 641
      150   ODO-NUMBER
      186   P-OR-F . . . . . . . . . . . .  M342 M343 M344 M345 352 M355
      188   PAR-NAME . . . . . . . . . . .  M357 M457 M480 M537 M548 M562 M585 M652 M662
      190   PARDOT-X . . . . . . . . . . .  M349
      239   PASS-COUNTER . . . . . . . . .  M343 375 377
       79   PRINT-FILE . . . . . . . . . .  58 326 339
       80   PRINT-REC. . . . . . . . . . .  M351 M432 M434
      193   RE-MARK. . . . . . . . . . . .  M346 M358 M464 M508 M529 M534 M569 M623 M644 M649
      235   REC-CT . . . . . . . . . . . .  348 350 357
      116   REC-LENGTH . . . . . . . . . .  99 M478 M583 M615
      234   REC-SKL-SUB. . . . . . . . . .  M330 M333 335
      243   RECORD-COUNT . . . . . . . . .  M402 403 M415
      160   RECORDS-IN-FILE. . . . . . . .  M488 M593
      144   REELUNIT-NUMBER
      117   STATUS-ERROR . . . . . . . . .  M479 M499 505 M584 M605 M610 620
      194   TEST-COMPUTED. . . . . . . . .  432
      209   TEST-CORRECT . . . . . . . . .  434
      262   TEST-ID. . . . . . . . . . . .  M327
      182   TEST-RESULTS . . . . . . . . .  M328 351
      240   TOTAL-ERROR
      148   UPDATE-NUMBER
      113   VIERZIG
      120   WRK-DU-09V00-001 . . . . . . .  M493 M522 M527 528 531 M598 M637 M642 643 646
      158   XBLOCK-SIZE. . . . . . . . . .  M487 M592
      140   XFILE-NAME . . . . . . . . . .  M482 M587
      162   XFILE-ORGANIZATION . . . . . .  M489 M594
      164   XLABEL-TYPE. . . . . . . . . .  M490 M595
      152   XPROGRAM-NAME. . . . . . . . .  M484 M589
      167   XRECORD-KEY. . . . . . . . . .  M494 M599
      154   XRECORD-LENGTH . . . . . . . .  M485 M590 M616
      142   XRECORD-NAME . . . . . . . . .  M483 M588 M614
      146   XRECORD-NUMBER . . . . . . . .  M491 493 500 M502 531 541 550 M596 598 601 606 611 613 M617 646 656 664
      311   XXCOMPUTED . . . . . . . . . .  M441
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    18
0 Defined   Cross-reference of data names   References

0     313   XXCORRECT. . . . . . . . . . .  M441
      306   XXINFO . . . . . . . . . . . .  428 443
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    19
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

      437   BAIL-OUT . . . . . . . . . . .  P354
      445   BAIL-OUT-EX. . . . . . . . . .  E354 G439
      440   BAIL-OUT-WRITE . . . . . . . .  G438
      420   BLANK-LINE-PRINT
      670   CCVS-EXIT
      336   CCVS-INIT-EXIT
      332   CCVS-INIT-FILE . . . . . . . .  P331
      671   CCVS-999999
      324   CCVS1
      446   CCVS1-EXIT . . . . . . . . . .  G337
      338   CLOSE-FILES. . . . . . . . . .  G672
      364   COLUMN-NAMES-ROUTINE . . . . .  E329
      345   DE-LETE
      368   END-ROUTINE. . . . . . . . . .  P339
      372   END-ROUTINE-1
      381   END-ROUTINE-12
      389   END-ROUTINE-13 . . . . . . . .  E339
      370   END-RTN-EXIT
      344   FAIL . . . . . . . . . . . . .  P465 P509 P535 P542 P570 P624 P650 P657
      422   FAIL-ROUTINE . . . . . . . . .  P353
      436   FAIL-ROUTINE-EX. . . . . . . .  E353 G430
      431   FAIL-ROUTINE-WRITE . . . . . .  G424 G425
      359   HEAD-ROUTINE . . . . . . . . .  P329
      342   INSPT
      325   OPEN-FILES
      463   OPN-FAIL-GF-01
      568   OPN-FAIL-GF-02
      454   OPN-INIT-GF-01
      559   OPN-INIT-GF-02
      469   OPN-PASS-GF-01 . . . . . . . .  G462
      574   OPN-PASS-GF-02 . . . . . . . .  G567
      458   OPN-TEST-GF-01
      563   OPN-TEST-GF-02
      471   OPN-WRITE-GF-01. . . . . . . .  G468
      576   OPN-WRITE-GF-02. . . . . . . .  G573
      343   PASS . . . . . . . . . . . . .  P470 P512 P544 P575 P627 P659
      347   PRINT-DETAIL . . . . . . . . .  P472 P514 P538 P551 P577 P629 P653 P665
      520   READ-INIT-F1-01
      635   READ-INIT-F1-02
      523   READ-TEST-F1-01. . . . . . . .  G532
      540   READ-TEST-F1-01-1. . . . . . .  G525 G530
      546   READ-TEST-F1-01-2. . . . . . .  G545
      552   READ-TEST-F1-01-3. . . . . . .  G539
      638   READ-TEST-F1-02. . . . . . . .  G647
      655   READ-TEST-F1-02-1. . . . . . .  G640 G645
      660   READ-TEST-F1-02-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    20
0 Defined   Cross-reference of procedures   References

0     666   READ-TEST-F1-02-3. . . . . . .  G654
      453   SECT-IX-01-001
      340   TERMINATE-CCVS
      507   WRI-FAIL-GF-01 . . . . . . . .  G497
      622   WRI-FAIL-GF-02 . . . . . . . .  G603 G608
      477   WRI-INIT-GF-01
      582   WRI-INIT-GF-02
      511   WRI-PASS-GF-01 . . . . . . . .  G506
      626   WRI-PASS-GF-02 . . . . . . . .  G621
      492   WRI-TEST-GF-01 . . . . . . . .  G503
      504   WRI-TEST-GF-01-1 . . . . . . .  G501
      597   WRI-TEST-GF-02 . . . . . . . .  G618
      619   WRI-TEST-GF-02-1 . . . . . . .  G612
      513   WRI-WRITE-GF-01. . . . . . . .  G510
      628   WRI-WRITE-GF-02. . . . . . . .  G625
      401   WRITE-LINE . . . . . . . . . .  P351 P352 P360 P361 P362 P363 P365 P366 P367 P369 P371 P380 P388 P394 P399 P400
                                            P428 P432 P434 P443
      417   WRT-LN . . . . . . . . . . . .  P407 P408 P409 P410 P411 P412 P413 P416 P421
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    21
0 Defined   Cross-reference of programs     References

        3   IX217A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX217A    Date 06/04/2022  Time 11:57:42   Page    22
0LineID  Message code  Message text

     63  IGYDS1298-I   Assignment-name "XXXXP044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXP044" was treated as comments.

     71  IGYDS1298-I   Assignment-name "XXXXP045" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXP045" was treated as comments.

     79  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     83  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

                       Same message on line:     95

     83  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.

                       Same message on line:     95
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       7           7
-* Statistics for COBOL program IX217A:
 *    Source records = 672
 *    Data Division statements = 107
 *    Procedure Division statements = 294
 *    Generated COBOL statements = 0
 *    Program complexity factor = 302
0End of compilation 1,  program IX217A,  highest severity 0.
0Return code 0
