1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:36   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:36   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2014.2
   000002         000200 PROGRAM-ID.                                                      IX2014.2
   000003         000300     IX201A.                                                      IX2014.2
   000004         000500*                                                              *  IX2014.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2014.2
   000006         000700*                                                              *  IX2014.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2014.2
   000008         000900*                                                              *  IX2014.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2014.2
   000010         001100*                                                              *  IX2014.2
   000011         001300*    THIS PROGRAM IS THE FIRST OF A SERIES WHICH PROCESSES AN     IX2014.2
   000012         001400*    INDEXED FILE.  THE FUNCTION OF THIS PROGRAM IS TO CREATE AN  IX2014.2
   000013         001500*    INDEXED FILE SEQUENTIALLY (ACCESS MODE SEQUENTIAL) AND VERIFYIX2014.2
   000014         001600*    THAT IT WAS CREATED CORRECTLY.  THE FILE IS IDENTIFIED AS    IX2014.2
   000015         001700*    "IX-FS1" AND IS PASSED TO IX202 FOR PROCESSING.              IX2014.2
   000016         001800*                                                                 IX2014.2
   000017         001900*                                                                 IX2014.2
   000018         002000*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX2014.2
   000019         002100*                                                                 IX2014.2
   000020         002200*             X-24   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2014.2
   000021         002300*                    CLAUSE FOR DATA FILE IX-FS1                  IX2014.2
   000022         002400*             X-44   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2014.2
   000023         002500*                    CLAUSE FOR INDEX FILE IX-FS1                 IX2014.2
   000024         002600*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX2014.2
   000025         002700*             X-62   FOR RAW-DATA                                 IX2014.2
   000026         002800*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX2014.2
   000027         002900*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX2014.2
   000028         003000*                                                                 IX2014.2
   000029         003100*         NOTE:  X-CARDS 44 AND 62       ARE OPTIONAL             IX2014.2
   000030         003200*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX2014.2
   000031         003300*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX2014.2
   000032         003400*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX2014.2
   000033         003500*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX2014.2
   000034         003600*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX2014.2
   000035         003700*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX2014.2
   000036         003800*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX2014.2
   000037         003900*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX2014.2
   000038         004000*               THEY ARE AS FOLLOWS                               IX2014.2
   000039         004100*                                                                 IX2014.2
   000040         004200*                  P  SELECTS X-CARDS 62                          IX2014.2
   000041         004300*                  J  SELECTS X-CARD 44                           IX2014.2
   000042         004400*                                                                 IX2014.2
   000043         004600 ENVIRONMENT DIVISION.                                            IX2014.2
   000044         004700 CONFIGURATION SECTION.                                           IX2014.2
   000045         004800 SOURCE-COMPUTER.                                                 IX2014.2
   000046         004900     XXXXX082.                                                    IX2014.2
   000047         005000 OBJECT-COMPUTER.                                                 IX2014.2
   000048         005100     XXXXX083.                                                    IX2014.2
   000049         005200 INPUT-OUTPUT SECTION.                                            IX2014.2
   000050         005300 FILE-CONTROL.                                                    IX2014.2
   000051         005400     SELECT RAW-DATA   ASSIGN TO                                  IX2014.2 67
   000052         005500     XXXXX062                                                     IX2014.2
   000053         005600            ORGANIZATION IS INDEXED                               IX2014.2
   000054         005700            ACCESS MODE IS RANDOM                                 IX2014.2
   000055         005800            RECORD KEY IS RAW-DATA-KEY.                           IX2014.2 70
   000056         005900     SELECT PRINT-FILE ASSIGN TO                                  IX2014.2 82
   000057         006000     XXXXX055.                                                    IX2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100     SELECT   IX-FS1 ASSIGN TO                                    IX2014.2 85
   000059         006200     XXXXP024                                                     IX2014.2
   000060         006300     XXXXP044                                                     IX2014.2

 ==000060==> IGYDS1298-I Assignment-name "XXXXP044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXP044" was treated as comments.

   000061         006400     ORGANIZATION IS INDEXED                                      IX2014.2
   000062         006500     RECORD KEY IS IX-FS1-KEY                                     IX2014.2 94
   000063         006600     ACCESS MODE IS SEQUENTIAL.                                   IX2014.2
   000064         006700 DATA DIVISION.                                                   IX2014.2
   000065         006800 FILE SECTION.                                                    IX2014.2
   000066         006900                                                                  IX2014.2
   000067         007000 FD  RAW-DATA.                                                    IX2014.2
   000068         007100                                                                  IX2014.2
   000069         007200 01  RAW-DATA-SATZ.                                               IX2014.2
   000070         007300     05  RAW-DATA-KEY        PIC X(6).                            IX2014.2
   000071         007400     05  C-DATE              PIC 9(6).                            IX2014.2
   000072         007500     05  C-TIME              PIC 9(8).                            IX2014.2
   000073         007600     05  C-NO-OF-TESTS       PIC 99.                              IX2014.2
   000074         007700     05  C-OK                PIC 999.                             IX2014.2
   000075         007800     05  C-ALL               PIC 999.                             IX2014.2
   000076         007900     05  C-FAIL              PIC 999.                             IX2014.2
   000077         008000     05  C-DELETED           PIC 999.                             IX2014.2
   000078         008100     05  C-INSPECT           PIC 999.                             IX2014.2
   000079         008200     05  C-NOTE              PIC X(13).                           IX2014.2
   000080         008300     05  C-INDENT            PIC X.                               IX2014.2
   000081         008400     05  C-ABORT             PIC X(8).                            IX2014.2
   000082         008500 FD  PRINT-FILE.                                                  IX2014.2

 ==000082==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000083         008600 01  PRINT-REC PICTURE X(120).                                    IX2014.2
   000084         008700 01  DUMMY-RECORD PICTURE X(120).                                 IX2014.2
   000085         008800 FD  IX-FS1                                                       IX2014.2

 ==000085==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000085==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000086         008900     LABEL RECORD IS STANDARD                                     IX2014.2
   000087         009000     DATA RECORD IS IX-FS1R1-F-G-240                              IX2014.2 *
   000088         009100     BLOCK CONTAINS 1 RECORDS                                     IX2014.2
   000089         009200     RECORD CONTAINS 240 CHARACTERS.                              IX2014.2
   000090         009300 01  IX-FS1R1-F-G-240.                                            IX2014.2
   000091         009400     03 IX-FS1-WRK-120 PIC X(120).                                IX2014.2
   000092         009500     03 IX-FS1-GRP-120.                                           IX2014.2
   000093         009600     05 FILLER   PIC   X(8).                                      IX2014.2
   000094         009700     05 IX-FS1-KEY  PIC X(29).                                    IX2014.2
   000095         009800     05 FILLER PIC X(83).                                         IX2014.2
   000096         009900 WORKING-STORAGE SECTION.                                         IX2014.2
   000097         010000 01  GRP-0101.                                                    IX2014.2
   000098         010100     02 FILLER   PIC X(10)  VALUE "ABCDLKJXYZ".                   IX2014.2
   000099         010200     02 WRK-DU-09V00-001 PIC 9(9)  VALUE ZERO.                    IX2014.2 IMP
   000100         010300     02 FILLER  PIC X(10)  VALUE "ZIF,.$-+CD".                    IX2014.2
   000101         010400 01  FILE-RECORD-INFORMATION-REC.                                 IX2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000102         010500     03 FILE-RECORD-INFO-SKELETON.                                IX2014.2
   000103         010600        05 FILLER                 PICTURE X(48)       VALUE       IX2014.2
   000104         010700             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2014.2
   000105         010800        05 FILLER                 PICTURE X(46)       VALUE       IX2014.2
   000106         010900             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2014.2
   000107         011000        05 FILLER                 PICTURE X(26)       VALUE       IX2014.2
   000108         011100             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2014.2
   000109         011200        05 FILLER                 PICTURE X(37)       VALUE       IX2014.2
   000110         011300             ",RECKEY=                             ".             IX2014.2
   000111         011400        05 FILLER                 PICTURE X(38)       VALUE       IX2014.2
   000112         011500             ",ALTKEY1=                             ".            IX2014.2
   000113         011600        05 FILLER                 PICTURE X(38)       VALUE       IX2014.2
   000114         011700             ",ALTKEY2=                             ".            IX2014.2
   000115         011800        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2014.2 IMP
   000116         011900     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2014.2
   000117         012000        05 FILE-RECORD-INFO-P1-120.                               IX2014.2
   000118         012100           07 FILLER              PIC X(5).                       IX2014.2
   000119         012200           07 XFILE-NAME           PIC X(6).                      IX2014.2
   000120         012300           07 FILLER              PIC X(8).                       IX2014.2
   000121         012400           07 XRECORD-NAME         PIC X(6).                      IX2014.2
   000122         012500           07 FILLER              PIC X(1).                       IX2014.2
   000123         012600           07 REELUNIT-NUMBER     PIC 9(1).                       IX2014.2
   000124         012700           07 FILLER              PIC X(7).                       IX2014.2
   000125         012800           07 XRECORD-NUMBER       PIC 9(6).                      IX2014.2
   000126         012900           07 FILLER              PIC X(6).                       IX2014.2
   000127         013000           07 UPDATE-NUMBER       PIC 9(2).                       IX2014.2
   000128         013100           07 FILLER              PIC X(5).                       IX2014.2
   000129         013200           07 ODO-NUMBER          PIC 9(4).                       IX2014.2
   000130         013300           07 FILLER              PIC X(5).                       IX2014.2
   000131         013400           07 XPROGRAM-NAME        PIC X(5).                      IX2014.2
   000132         013500           07 FILLER              PIC X(7).                       IX2014.2
   000133         013600           07 XRECORD-LENGTH       PIC 9(6).                      IX2014.2
   000134         013700           07 FILLER              PIC X(7).                       IX2014.2
   000135         013800           07 CHARS-OR-RECORDS    PIC X(2).                       IX2014.2
   000136         013900           07 FILLER              PIC X(1).                       IX2014.2
   000137         014000           07 XBLOCK-SIZE          PIC 9(4).                      IX2014.2
   000138         014100           07 FILLER              PIC X(6).                       IX2014.2
   000139         014200           07 RECORDS-IN-FILE     PIC 9(6).                       IX2014.2
   000140         014300           07 FILLER              PIC X(5).                       IX2014.2
   000141         014400           07 XFILE-ORGANIZATION   PIC X(2).                      IX2014.2
   000142         014500           07 FILLER              PIC X(6).                       IX2014.2
   000143         014600           07 XLABEL-TYPE          PIC X(1).                      IX2014.2
   000144         014700        05 FILE-RECORD-INFO-P121-240.                             IX2014.2
   000145         014800           07 FILLER              PIC X(8).                       IX2014.2
   000146         014900           07 XRECORD-KEY          PIC X(29).                     IX2014.2
   000147         015000           07 FILLER              PIC X(9).                       IX2014.2
   000148         015100           07 ALTERNATE-KEY1      PIC X(29).                      IX2014.2
   000149         015200           07 FILLER              PIC X(9).                       IX2014.2
   000150         015300           07 ALTERNATE-KEY2      PIC X(29).                      IX2014.2
   000151         015400           07 FILLER              PIC X(7).                       IX2014.2
   000152         015500 01  TEST-RESULTS.                                                IX2014.2
   000153         015600     02 FILLER                   PIC X      VALUE SPACE.          IX2014.2 IMP
   000154         015700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2014.2 IMP
   000155         015800     02 FILLER                   PIC X      VALUE SPACE.          IX2014.2 IMP
   000156         015900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2014.2 IMP
   000157         016000     02 FILLER                   PIC X      VALUE SPACE.          IX2014.2 IMP
   000158         016100     02  PAR-NAME.                                                IX2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000159         016200       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2014.2 IMP
   000160         016300       03  PARDOT-X              PIC X      VALUE SPACE.          IX2014.2 IMP
   000161         016400       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2014.2 IMP
   000162         016500     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2014.2 IMP
   000163         016600     02 RE-MARK                  PIC X(61).                       IX2014.2
   000164         016700 01  TEST-COMPUTED.                                               IX2014.2
   000165         016800     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2014.2 IMP
   000166         016900     02 FILLER                   PIC X(17)  VALUE                 IX2014.2
   000167         017000            "       COMPUTED=".                                   IX2014.2
   000168         017100     02 COMPUTED-X.                                               IX2014.2
   000169         017200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2014.2 IMP
   000170         017300     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2014.2 169
   000171         017400                                 PIC -9(9).9(9).                  IX2014.2
   000172         017500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2014.2 169
   000173         017600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2014.2 169
   000174         017700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2014.2 169
   000175         017800     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2014.2 169
   000176         017900         04 COMPUTED-18V0                    PIC -9(18).          IX2014.2
   000177         018000         04 FILLER                           PIC X.               IX2014.2
   000178         018100     03 FILLER PIC X(50) VALUE SPACE.                             IX2014.2 IMP
   000179         018200 01  TEST-CORRECT.                                                IX2014.2
   000180         018300     02 FILLER PIC X(30) VALUE SPACE.                             IX2014.2 IMP
   000181         018400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2014.2
   000182         018500     02 CORRECT-X.                                                IX2014.2
   000183         018600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2014.2 IMP
   000184         018700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2014.2 183
   000185         018800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2014.2 183
   000186         018900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2014.2 183
   000187         019000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2014.2 183
   000188         019100     03      CR-18V0 REDEFINES CORRECT-A.                         IX2014.2 183
   000189         019200         04 CORRECT-18V0                     PIC -9(18).          IX2014.2
   000190         019300         04 FILLER                           PIC X.               IX2014.2
   000191         019400     03 FILLER PIC X(2) VALUE SPACE.                              IX2014.2 IMP
   000192         019500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2014.2 IMP
   000193         019600 01  CCVS-C-1.                                                    IX2014.2
   000194         019700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2014.2
   000195         019800-    "SS  PARAGRAPH-NAME                                          IX2014.2
   000196         019900-    "       REMARKS".                                            IX2014.2
   000197         020000     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2014.2 IMP
   000198         020100 01  CCVS-C-2.                                                    IX2014.2
   000199         020200     02 FILLER                     PIC X        VALUE SPACE.      IX2014.2 IMP
   000200         020300     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2014.2
   000201         020400     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2014.2 IMP
   000202         020500     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2014.2
   000203         020600     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2014.2 IMP
   000204         020700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2014.2 IMP
   000205         020800 01  REC-CT                        PIC 99       VALUE ZERO.       IX2014.2 IMP
   000206         020900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2014.2 IMP
   000207         021000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2014.2 IMP
   000208         021100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2014.2 IMP
   000209         021200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2014.2 IMP
   000210         021300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2014.2 IMP
   000211         021400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2014.2 IMP
   000212         021500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2014.2 IMP
   000213         021600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2014.2 IMP
   000214         021700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2014.2 IMP
   000215         021800 01  CCVS-H-1.                                                    IX2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000216         021900     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2014.2 IMP
   000217         022000     02  FILLER                    PIC X(42)    VALUE             IX2014.2
   000218         022100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2014.2
   000219         022200     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2014.2 IMP
   000220         022300 01  CCVS-H-2A.                                                   IX2014.2
   000221         022400   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2014.2 IMP
   000222         022500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2014.2
   000223         022600   02  FILLER                        PIC XXXX   VALUE             IX2014.2
   000224         022700     "4.2 ".                                                      IX2014.2
   000225         022800   02  FILLER                        PIC X(28)  VALUE             IX2014.2
   000226         022900            " COPY - NOT FOR DISTRIBUTION".                       IX2014.2
   000227         023000   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2014.2 IMP
   000228         023100                                                                  IX2014.2
   000229         023200 01  CCVS-H-2B.                                                   IX2014.2
   000230         023300   02  FILLER                        PIC X(15)  VALUE             IX2014.2
   000231         023400            "TEST RESULT OF ".                                    IX2014.2
   000232         023500   02  TEST-ID                       PIC X(9).                    IX2014.2
   000233         023600   02  FILLER                        PIC X(4)   VALUE             IX2014.2
   000234         023700            " IN ".                                               IX2014.2
   000235         023800   02  FILLER                        PIC X(12)  VALUE             IX2014.2
   000236         023900     " HIGH       ".                                              IX2014.2
   000237         024000   02  FILLER                        PIC X(22)  VALUE             IX2014.2
   000238         024100            " LEVEL VALIDATION FOR ".                             IX2014.2
   000239         024200   02  FILLER                        PIC X(58)  VALUE             IX2014.2
   000240         024300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2014.2
   000241         024400 01  CCVS-H-3.                                                    IX2014.2
   000242         024500     02  FILLER                      PIC X(34)  VALUE             IX2014.2
   000243         024600            " FOR OFFICIAL USE ONLY    ".                         IX2014.2
   000244         024700     02  FILLER                      PIC X(58)  VALUE             IX2014.2
   000245         024800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2014.2
   000246         024900     02  FILLER                      PIC X(28)  VALUE             IX2014.2
   000247         025000            "  COPYRIGHT   1985 ".                                IX2014.2
   000248         025100 01  CCVS-E-1.                                                    IX2014.2
   000249         025200     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2014.2 IMP
   000250         025300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2014.2
   000251         025400     02 ID-AGAIN                     PIC X(9).                    IX2014.2
   000252         025500     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2014.2 IMP
   000253         025600 01  CCVS-E-2.                                                    IX2014.2
   000254         025700     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2014.2 IMP
   000255         025800     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2014.2 IMP
   000256         025900     02 CCVS-E-2-2.                                               IX2014.2
   000257         026000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2014.2 IMP
   000258         026100         03 FILLER                   PIC X      VALUE SPACE.      IX2014.2 IMP
   000259         026200         03 ENDER-DESC               PIC X(44)  VALUE             IX2014.2
   000260         026300            "ERRORS ENCOUNTERED".                                 IX2014.2
   000261         026400 01  CCVS-E-3.                                                    IX2014.2
   000262         026500     02  FILLER                      PIC X(22)  VALUE             IX2014.2
   000263         026600            " FOR OFFICIAL USE ONLY".                             IX2014.2
   000264         026700     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2014.2 IMP
   000265         026800     02  FILLER                      PIC X(58)  VALUE             IX2014.2
   000266         026900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2014.2
   000267         027000     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2014.2 IMP
   000268         027100     02 FILLER                       PIC X(15)  VALUE             IX2014.2
   000269         027200             " COPYRIGHT 1985".                                   IX2014.2
   000270         027300 01  CCVS-E-4.                                                    IX2014.2
   000271         027400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2014.2 IMP
   000272         027500     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000273         027600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2014.2 IMP
   000274         027700     02 FILLER                       PIC X(40)  VALUE             IX2014.2
   000275         027800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2014.2
   000276         027900 01  XXINFO.                                                      IX2014.2
   000277         028000     02 FILLER                       PIC X(19)  VALUE             IX2014.2
   000278         028100            "*** INFORMATION ***".                                IX2014.2
   000279         028200     02 INFO-TEXT.                                                IX2014.2
   000280         028300       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2014.2 IMP
   000281         028400       04 XXCOMPUTED                 PIC X(20).                   IX2014.2
   000282         028500       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2014.2 IMP
   000283         028600       04 XXCORRECT                  PIC X(20).                   IX2014.2
   000284         028700     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2014.2
   000285         028800 01  HYPHEN-LINE.                                                 IX2014.2
   000286         028900     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2014.2 IMP
   000287         029000     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2014.2
   000288         029100-    "*****************************************".                 IX2014.2
   000289         029200     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2014.2
   000290         029300-    "******************************".                            IX2014.2
   000291         029400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2014.2
   000292         029500     "IX201A".                                                    IX2014.2
   000293         029600 PROCEDURE DIVISION.                                              IX2014.2
   000294         029700 CCVS1 SECTION.                                                   IX2014.2
   000295         029800 OPEN-FILES.                                                      IX2014.2
   000296         029900     OPEN I-O RAW-DATA.                                           IX2014.2 67
   000297         030000     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2014.2 291 70
   000298         030100     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2014.2 67 304
   000299         030200     MOVE "ABORTED " TO C-ABORT.                                  IX2014.2 81
   000300         030300     ADD 1 TO C-NO-OF-TESTS.                                      IX2014.2 73
   000301         030400     ACCEPT C-DATE  FROM DATE.                                    IX2014.2 71
   000302         030500     ACCEPT C-TIME  FROM TIME.                                    IX2014.2 72
   000303         030600     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2014.2 69 304
   000304         030700 END-E-1.                                                         IX2014.2
   000305         030800     CLOSE RAW-DATA.                                              IX2014.2 67
   000306         030900     OPEN    OUTPUT PRINT-FILE.                                   IX2014.2 82
   000307         031000     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2014.2 291 232 291 251
   000308         031100     MOVE    SPACE TO TEST-RESULTS.                               IX2014.2 IMP 152
   000309         031200     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2014.2 353 358
   000310         031300     MOVE    ZERO TO REC-SKL-SUB.                                 IX2014.2 IMP 204
   000311         031400     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2014.2 312
   000312         031500 CCVS-INIT-FILE.                                                  IX2014.2
   000313         031600     ADD     1 TO REC-SKL-SUB.                                    IX2014.2 204
   000314         031700     MOVE    FILE-RECORD-INFO-SKELETON                            IX2014.2 102
   000315         031800          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2014.2 116 204
   000316         031900 CCVS-INIT-EXIT.                                                  IX2014.2
   000317         032000     GO TO CCVS1-EXIT.                                            IX2014.2 440
   000318         032100 CLOSE-FILES.                                                     IX2014.2
   000319         032200     OPEN I-O RAW-DATA.                                           IX2014.2 67
   000320         032300     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2014.2 291 70
   000321         032400     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2014.2 67 329
   000322         032500     MOVE "OK.     " TO C-ABORT.                                  IX2014.2 81
   000323         032600     MOVE PASS-COUNTER TO C-OK.                                   IX2014.2 209 74
   000324         032700     MOVE ERROR-HOLD   TO C-ALL.                                  IX2014.2 211 75
   000325         032800     MOVE ERROR-COUNTER TO C-FAIL.                                IX2014.2 207 76
   000326         032900     MOVE DELETE-COUNTER TO C-DELETED.                            IX2014.2 206 77
   000327         033000     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2014.2 208 78
   000328         033100     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2014.2 69 329
   000329         033200 END-E-2.                                                         IX2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000330         033300     CLOSE RAW-DATA.                                              IX2014.2 67
   000331         033400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2014.2 362 383 82
   000332         033500 TERMINATE-CCVS.                                                  IX2014.2
   000333         033600     EXIT PROGRAM.                                                IX2014.2
   000334         033700 TERMINATE-CALL.                                                  IX2014.2
   000335         033800     STOP     RUN.                                                IX2014.2
   000336         033900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2014.2 156 208
   000337         034000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2014.2 156 209
   000338         034100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2014.2 156 207
   000339         034200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2014.2 156 206
   000340         034300     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2014.2 163
   000341         034400 PRINT-DETAIL.                                                    IX2014.2
   000342         034500     IF REC-CT NOT EQUAL TO ZERO                                  IX2014.2 205 IMP
   000343      1  034600             MOVE "." TO PARDOT-X                                 IX2014.2 160
   000344      1  034700             MOVE REC-CT TO DOTVALUE.                             IX2014.2 205 161
   000345         034800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2014.2 152 83 395
   000346         034900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2014.2 156 395
   000347      1  035000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2014.2 416 430
   000348      1  035100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2014.2 431 439
   000349         035200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2014.2 IMP 156 IMP 168
   000350         035300     MOVE SPACE TO CORRECT-X.                                     IX2014.2 IMP 182
   000351         035400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2014.2 205 IMP IMP 158
   000352         035500     MOVE     SPACE TO RE-MARK.                                   IX2014.2 IMP 163
   000353         035600 HEAD-ROUTINE.                                                    IX2014.2
   000354         035700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2014.2 215 84 395
   000355         035800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2014.2 220 84 395
   000356         035900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2014.2 229 84 395
   000357         036000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2014.2 241 84 395
   000358         036100 COLUMN-NAMES-ROUTINE.                                            IX2014.2
   000359         036200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2014.2 193 84 395
   000360         036300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2014.2 198 84 395
   000361         036400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2014.2 285 84 395
   000362         036500 END-ROUTINE.                                                     IX2014.2
   000363         036600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2014.2 285 84 395
   000364         036700 END-RTN-EXIT.                                                    IX2014.2
   000365         036800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2014.2 248 84 395
   000366         036900 END-ROUTINE-1.                                                   IX2014.2
   000367         037000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2014.2 207 211 208
   000368         037100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2014.2 211 206 211
   000369         037200      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2014.2 209 211
   000370         037300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2014.2
   000371         037400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2014.2 209 271
   000372         037500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2014.2 211 273
   000373         037600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2014.2 270 256
   000374         037700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2014.2 253 84 395
   000375         037800  END-ROUTINE-12.                                                 IX2014.2
   000376         037900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2014.2 259
   000377         038000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2014.2 207 IMP
   000378      1  038100         MOVE "NO " TO ERROR-TOTAL                                IX2014.2 257
   000379         038200         ELSE                                                     IX2014.2
   000380      1  038300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2014.2 207 257
   000381         038400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2014.2 253 84
   000382         038500     PERFORM WRITE-LINE.                                          IX2014.2 395
   000383         038600 END-ROUTINE-13.                                                  IX2014.2
   000384         038700     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2014.2 206 IMP
   000385      1  038800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2014.2 257
   000386      1  038900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2014.2 206 257
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000387         039000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2014.2 259
   000388         039100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2014.2 253 84 395
   000389         039200      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2014.2 208 IMP
   000390      1  039300          MOVE "NO " TO ERROR-TOTAL                               IX2014.2 257
   000391      1  039400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2014.2 208 257
   000392         039500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2014.2 259
   000393         039600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2014.2 253 84 395
   000394         039700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2014.2 261 84 395
   000395         039800 WRITE-LINE.                                                      IX2014.2
   000396         039900     ADD 1 TO RECORD-COUNT.                                       IX2014.2 213
   000397         040000     IF RECORD-COUNT GREATER 42                                   IX2014.2 213
   000398      1  040100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2014.2 84 212
   000399      1  040200         MOVE SPACE TO DUMMY-RECORD                               IX2014.2 IMP 84
   000400      1  040300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2014.2 84
   000401      1  040400         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2014.2 215 84 411
   000402      1  040500         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2014.2 220 84 411
   000403      1  040600         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2014.2 229 84 411
   000404      1  040700         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2014.2 241 84 411
   000405      1  040800         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2014.2 193 84 411
   000406      1  040900         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2014.2 198 84 411
   000407      1  041000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2014.2 285 84 411
   000408      1  041100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2014.2 212 84
   000409      1  041200         MOVE ZERO TO RECORD-COUNT.                               IX2014.2 IMP 213
   000410         041300     PERFORM WRT-LN.                                              IX2014.2 411
   000411         041400 WRT-LN.                                                          IX2014.2
   000412         041500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2014.2 84
   000413         041600     MOVE SPACE TO DUMMY-RECORD.                                  IX2014.2 IMP 84
   000414         041700 BLANK-LINE-PRINT.                                                IX2014.2
   000415         041800     PERFORM WRT-LN.                                              IX2014.2 411
   000416         041900 FAIL-ROUTINE.                                                    IX2014.2
   000417         042000     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2014.2 168 IMP
   000418      1  042100            GO TO   FAIL-ROUTINE-WRITE.                           IX2014.2 425
   000419         042200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2014.2 182 IMP 425
   000420         042300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2014.2 214 284
   000421         042400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2014.2 279
   000422         042500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2014.2 276 84 395
   000423         042600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2014.2 IMP 284
   000424         042700     GO TO  FAIL-ROUTINE-EX.                                      IX2014.2 430
   000425         042800 FAIL-ROUTINE-WRITE.                                              IX2014.2
   000426         042900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2014.2 164 83 395
   000427         043000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2014.2 214 192
   000428         043100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2014.2 179 83 395
   000429         043200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2014.2 IMP 192
   000430         043300 FAIL-ROUTINE-EX. EXIT.                                           IX2014.2
   000431         043400 BAIL-OUT.                                                        IX2014.2
   000432         043500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2014.2 169 IMP 434
   000433         043600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2014.2 183 IMP 439
   000434         043700 BAIL-OUT-WRITE.                                                  IX2014.2
   000435         043800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2014.2 183 283 169 281
   000436         043900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2014.2 214 284
   000437         044000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2014.2 276 84 395
   000438         044100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2014.2 IMP 284
   000439         044200 BAIL-OUT-EX. EXIT.                                               IX2014.2
   000440         044300 CCVS1-EXIT.                                                      IX2014.2
   000441         044400     EXIT.                                                        IX2014.2
   000442         044500 SECT-IX-01-001 SECTION.                                          IX2014.2
   000443         044600 WRITE-INIT-GF-01.                                                IX2014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000444         044700     MOVE     "WRITE       IX-FS1" TO FEATURE.                    IX2014.2 154
   000445         044800     OPEN     OUTPUT    IX-FS1.                                   IX2014.2 85
   000446         044900     MOVE     "IX-FS1" TO XFILE-NAME (1).                         IX2014.2 119
   000447         045000     MOVE     "IX-F-G" TO XRECORD-NAME (1).                       IX2014.2 121
   000448         045100     MOVE     CCVS-PGM-ID TO XPROGRAM-NAME (1).                   IX2014.2 291 131
   000449         045200     MOVE     000240  TO XRECORD-LENGTH (1).                      IX2014.2 133
   000450         045300     MOVE     "RC"     TO CHARS-OR-RECORDS (1).                   IX2014.2 135
   000451         045400     MOVE     0001     TO XBLOCK-SIZE (1).                        IX2014.2 137
   000452         045500     MOVE     000500   TO RECORDS-IN-FILE (1).                    IX2014.2 139
   000453         045600     MOVE     "IX"  TO XFILE-ORGANIZATION (1).                    IX2014.2 141
   000454         045700     MOVE     "S"      TO XLABEL-TYPE (1).                        IX2014.2 143
   000455         045800     MOVE     000001   TO XRECORD-NUMBER (1).                     IX2014.2 125
   000456         045900 WRITE-TEST-GF-01.                                                IX2014.2
   000457         046000     MOVE     XRECORD-NUMBER (1) TO WRK-DU-09V00-001.             IX2014.2 125 99
   000458         046100     MOVE     GRP-0101 TO XRECORD-KEY (1).                        IX2014.2 97 146
   000459         046200     MOVE     FILE-RECORD-INFO (1) TO IX-FS1R1-F-G-240.           IX2014.2 116 90
   000460         046300     WRITE    IX-FS1R1-F-G-240                                    IX2014.2 90
   000461      1  046400              INVALID KEY GO TO WRITE-FAIL-GF-01.                 IX2014.2 467
   000462         046500     IF       XRECORD-NUMBER (1) EQUAL TO 500                     IX2014.2 125
   000463      1  046600              PERFORM PASS                                        IX2014.2 337
   000464      1  046700              GO TO WRITE-WRITE-GF-01.                            IX2014.2 470
   000465         046800     ADD      000001 TO XRECORD-NUMBER (1).                       IX2014.2 125
   000466         046900     GO       TO WRITE-TEST-GF-01.                                IX2014.2 456
   000467         047000 WRITE-FAIL-GF-01.                                                IX2014.2
   000468         047100     MOVE "BOUNDARY VIOLATION. WRITE FAILED; IX-41" TO RE-MARK.   IX2014.2 163
   000469         047200     PERFORM FAIL.                                                IX2014.2 338
   000470         047300 WRITE-WRITE-GF-01.                                               IX2014.2
   000471         047400     MOVE     "WRITE-TEST-GF-01" TO PAR-NAME                      IX2014.2 158
   000472         047500     MOVE     "FILE CREATED, LFILE "  TO COMPUTED-A.              IX2014.2 169
   000473         047600     MOVE     XRECORD-NUMBER (1) TO CORRECT-18V0.                 IX2014.2 125 189
   000474         047700     PERFORM  PRINT-DETAIL.                                       IX2014.2 341
   000475         047800     CLOSE    IX-FS1.                                             IX2014.2 85
   000476         047900 READ-INIT-F1-01.                                                 IX2014.2
   000477         048000     OPEN     INPUT     IX-FS1.                                   IX2014.2 85
   000478         048100     MOVE     ZERO TO WRK-DU-09V00-001.                           IX2014.2 IMP 99
   000479         048200 READ-TEST-F1-01.                                                 IX2014.2
   000480         048300     READ     IX-FS1                                              IX2014.2 85
   000481      1  048400              AT END GO TO READ-TEST-F1-01-1.                     IX2014.2 488
   000482         048500     MOVE     IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).           IX2014.2 90 116
   000483         048600     ADD      1  TO WRK-DU-09V00-001.                             IX2014.2 99
   000484         048700     IF       WRK-DU-09V00-001 GREATER 500                        IX2014.2 99
   000485      1  048800              MOVE "MORE THAN 500 RECORDS" TO RE-MARK             IX2014.2 163
   000486      1  048900              GO TO READ-TEST-F1-01-1.                            IX2014.2 488
   000487         049000     GO       TO READ-TEST-F1-01.                                 IX2014.2 479
   000488         049100 READ-TEST-F1-01-1.                                               IX2014.2
   000489         049200     IF       XRECORD-NUMBER (1) NOT EQUAL TO 500                 IX2014.2 125
   000490      1  049300              MOVE "READ FAILED; IX-28, 4.5.2" TO RE-MARK         IX2014.2 163
   000491      1  049400              PERFORM FAIL                                        IX2014.2 338
   000492         049500              ELSE                                                IX2014.2
   000493      1  049600              PERFORM PASS.                                       IX2014.2 337
   000494         049700 READ-WRITE-F1-01.                                                IX2014.2
   000495         049800     MOVE     "READ-TEST-F1-01" TO PAR-NAME.                      IX2014.2 158
   000496         049900     MOVE     "READ TO VERIFY " TO FEATURE.                       IX2014.2 154
   000497         050000     MOVE     "FILE VERIFIED, LFILE" TO COMPUTED-A.               IX2014.2 169
   000498         050100     MOVE     XRECORD-NUMBER (1) TO CORRECT-18V0.                 IX2014.2 125 189
   000499         050200     PERFORM  PRINT-DETAIL.                                       IX2014.2 341
   000500         050300     CLOSE    IX-FS1.                                             IX2014.2 85
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000501         050400 CCVS-EXIT SECTION.                                               IX2014.2
   000502         050500 CCVS-999999.                                                     IX2014.2
   000503         050600     GO TO CLOSE-FILES.                                           IX2014.2 318
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page    13
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      148   ALTERNATE-KEY1
      150   ALTERNATE-KEY2
      214   ANSI-REFERENCE . . . . . . . .  420 427 436
       81   C-ABORT. . . . . . . . . . . .  M299 M322
       75   C-ALL. . . . . . . . . . . . .  M324
       71   C-DATE . . . . . . . . . . . .  M301
       77   C-DELETED. . . . . . . . . . .  M326
       76   C-FAIL . . . . . . . . . . . .  M325
       80   C-INDENT
       78   C-INSPECT. . . . . . . . . . .  M327
       73   C-NO-OF-TESTS. . . . . . . . .  M300
       79   C-NOTE
       74   C-OK . . . . . . . . . . . . .  M323
       72   C-TIME . . . . . . . . . . . .  M302
      193   CCVS-C-1 . . . . . . . . . . .  359 405
      198   CCVS-C-2 . . . . . . . . . . .  360 406
      248   CCVS-E-1 . . . . . . . . . . .  365
      253   CCVS-E-2 . . . . . . . . . . .  374 381 388 393
      256   CCVS-E-2-2 . . . . . . . . . .  M373
      261   CCVS-E-3 . . . . . . . . . . .  394
      270   CCVS-E-4 . . . . . . . . . . .  373
      271   CCVS-E-4-1 . . . . . . . . . .  M371
      273   CCVS-E-4-2 . . . . . . . . . .  M372
      215   CCVS-H-1 . . . . . . . . . . .  354 401
      220   CCVS-H-2A. . . . . . . . . . .  355 402
      229   CCVS-H-2B. . . . . . . . . . .  356 403
      241   CCVS-H-3 . . . . . . . . . . .  357 404
      291   CCVS-PGM-ID. . . . . . . . . .  297 307 307 320 448
      135   CHARS-OR-RECORDS . . . . . . .  M450
      175   CM-18V0
      169   COMPUTED-A . . . . . . . . . .  170 172 173 174 175 432 435 M472 M497
      170   COMPUTED-N
      168   COMPUTED-X . . . . . . . . . .  M349 417
      172   COMPUTED-0V18
      174   COMPUTED-14V4
      176   COMPUTED-18V0
      173   COMPUTED-4V14
      192   COR-ANSI-REFERENCE . . . . . .  M427 M429
      183   CORRECT-A. . . . . . . . . . .  184 185 186 187 188 433 435
      184   CORRECT-N
      182   CORRECT-X. . . . . . . . . . .  M350 419
      185   CORRECT-0V18
      187   CORRECT-14V4
      189   CORRECT-18V0 . . . . . . . . .  M473 M498
      186   CORRECT-4V14
      188   CR-18V0
      206   DELETE-COUNTER . . . . . . . .  326 M339 368 384 386
      161   DOTVALUE . . . . . . . . . . .  M344
      212   DUMMY-HOLD . . . . . . . . . .  M398 408
       84   DUMMY-RECORD . . . . . . . . .  M354 M355 M356 M357 M359 M360 M361 M363 M365 M374 M381 M388 M393 M394 398 M399
                                            400 M401 M402 M403 M404 M405 M406 M407 M408 412 M413 M422 M437
      259   ENDER-DESC . . . . . . . . . .  M376 M387 M392
      207   ERROR-COUNTER. . . . . . . . .  325 M338 367 377 380
      211   ERROR-HOLD . . . . . . . . . .  324 M367 M368 M368 M369 372
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page    14
0 Defined   Cross-reference of data names   References

0     257   ERROR-TOTAL. . . . . . . . . .  M378 M380 M385 M386 M390 M391
      154   FEATURE. . . . . . . . . . . .  M444 M496
      116   FILE-RECORD-INFO . . . . . . .  M315 459 M482
      117   FILE-RECORD-INFO-P1-120
      144   FILE-RECORD-INFO-P121-240
      102   FILE-RECORD-INFO-SKELETON. . .  314
      101   FILE-RECORD-INFORMATION-REC
       97   GRP-0101 . . . . . . . . . . .  458
      285   HYPHEN-LINE. . . . . . . . . .  361 363 407
      251   ID-AGAIN . . . . . . . . . . .  M307
      284   INF-ANSI-REFERENCE . . . . . .  M420 M423 M436 M438
      279   INFO-TEXT. . . . . . . . . . .  M421
      208   INSPECT-COUNTER. . . . . . . .  327 M336 367 389 391
       85   IX-FS1 . . . . . . . . . . . .  58 445 475 477 480 500
       92   IX-FS1-GRP-120
       94   IX-FS1-KEY . . . . . . . . . .  62
       91   IX-FS1-WRK-120
       90   IX-FS1R1-F-G-240 . . . . . . .  M459 460 482
      129   ODO-NUMBER
      156   P-OR-F . . . . . . . . . . . .  M336 M337 M338 M339 346 M349
      158   PAR-NAME . . . . . . . . . . .  M351 M471 M495
      160   PARDOT-X . . . . . . . . . . .  M343
      209   PASS-COUNTER . . . . . . . . .  323 M337 369 371
       82   PRINT-FILE . . . . . . . . . .  56 306 331
       83   PRINT-REC. . . . . . . . . . .  M345 M426 M428
       67   RAW-DATA . . . . . . . . . . .  51 296 298 305 319 321 330
       70   RAW-DATA-KEY . . . . . . . . .  55 M297 M320
       69   RAW-DATA-SATZ. . . . . . . . .  303 328
      163   RE-MARK. . . . . . . . . . . .  M340 M352 M468 M485 M490
      205   REC-CT . . . . . . . . . . . .  342 344 351
      204   REC-SKL-SUB. . . . . . . . . .  M310 M313 315
      213   RECORD-COUNT . . . . . . . . .  M396 397 M409
      139   RECORDS-IN-FILE. . . . . . . .  M452
      123   REELUNIT-NUMBER
      164   TEST-COMPUTED. . . . . . . . .  426
      179   TEST-CORRECT . . . . . . . . .  428
      232   TEST-ID. . . . . . . . . . . .  M307
      152   TEST-RESULTS . . . . . . . . .  M308 345
      210   TOTAL-ERROR
      127   UPDATE-NUMBER
       99   WRK-DU-09V00-001 . . . . . . .  M457 M478 M483 484
      137   XBLOCK-SIZE. . . . . . . . . .  M451
      119   XFILE-NAME . . . . . . . . . .  M446
      141   XFILE-ORGANIZATION . . . . . .  M453
      143   XLABEL-TYPE. . . . . . . . . .  M454
      131   XPROGRAM-NAME. . . . . . . . .  M448
      146   XRECORD-KEY. . . . . . . . . .  M458
      133   XRECORD-LENGTH . . . . . . . .  M449
      121   XRECORD-NAME . . . . . . . . .  M447
      125   XRECORD-NUMBER . . . . . . . .  M455 457 462 M465 473 489 498
      281   XXCOMPUTED . . . . . . . . . .  M435
      283   XXCORRECT. . . . . . . . . . .  M435
      276   XXINFO . . . . . . . . . . . .  422 437
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page    15
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

      431   BAIL-OUT . . . . . . . . . . .  P348
      439   BAIL-OUT-EX. . . . . . . . . .  E348 G433
      434   BAIL-OUT-WRITE . . . . . . . .  G432
      414   BLANK-LINE-PRINT
      501   CCVS-EXIT
      316   CCVS-INIT-EXIT
      312   CCVS-INIT-FILE . . . . . . . .  P311
      502   CCVS-999999
      294   CCVS1
      440   CCVS1-EXIT . . . . . . . . . .  G317
      318   CLOSE-FILES. . . . . . . . . .  G503
      358   COLUMN-NAMES-ROUTINE . . . . .  E309
      339   DE-LETE
      304   END-E-1. . . . . . . . . . . .  G298 G303
      329   END-E-2. . . . . . . . . . . .  G321 G328
      362   END-ROUTINE. . . . . . . . . .  P331
      366   END-ROUTINE-1
      375   END-ROUTINE-12
      383   END-ROUTINE-13 . . . . . . . .  E331
      364   END-RTN-EXIT
      338   FAIL . . . . . . . . . . . . .  P469 P491
      416   FAIL-ROUTINE . . . . . . . . .  P347
      430   FAIL-ROUTINE-EX. . . . . . . .  E347 G424
      425   FAIL-ROUTINE-WRITE . . . . . .  G418 G419
      353   HEAD-ROUTINE . . . . . . . . .  P309
      336   INSPT
      295   OPEN-FILES
      337   PASS . . . . . . . . . . . . .  P463 P493
      341   PRINT-DETAIL . . . . . . . . .  P474 P499
      476   READ-INIT-F1-01
      479   READ-TEST-F1-01. . . . . . . .  G487
      488   READ-TEST-F1-01-1. . . . . . .  G481 G486
      494   READ-WRITE-F1-01
      442   SECT-IX-01-001
      334   TERMINATE-CALL
      332   TERMINATE-CCVS
      467   WRITE-FAIL-GF-01 . . . . . . .  G461
      443   WRITE-INIT-GF-01
      395   WRITE-LINE . . . . . . . . . .  P345 P346 P354 P355 P356 P357 P359 P360 P361 P363 P365 P374 P382 P388 P393 P394
                                            P422 P426 P428 P437
      456   WRITE-TEST-GF-01 . . . . . . .  G466
      470   WRITE-WRITE-GF-01. . . . . . .  G464
      411   WRT-LN . . . . . . . . . . . .  P401 P402 P403 P404 P405 P406 P407 P410 P415
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page    16
0 Defined   Cross-reference of programs     References

        3   IX201A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX201A    Date 06/04/2022  Time 11:57:36   Page    17
0LineID  Message code  Message text

     60  IGYDS1298-I   Assignment-name "XXXXP044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXP044" was treated as comments.

     82  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     85  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     85  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       4           4
-* Statistics for COBOL program IX201A:
 *    Source records = 503
 *    Data Division statements = 103
 *    Procedure Division statements = 213
 *    Generated COBOL statements = 0
 *    Program complexity factor = 220
0End of compilation 1,  program IX201A,  highest severity 0.
0Return code 0
