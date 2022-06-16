1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:30   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:30   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1014.2
   000002         000200 PROGRAM-ID.                                                      IX1014.2
   000003         000300     IX101A.                                                      IX1014.2
   000004         000500*                                                              *  IX1014.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1014.2
   000006         000700*                                                              *  IX1014.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1014.2
   000008         000900*                                                              *  IX1014.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1014.2
   000010         001100*                                                              *  IX1014.2
   000011         001300*    THIS PROGRAM IS THE FIRST OF A SERIES WHICH PROCESSES AN     IX1014.2
   000012         001400*    INDEXED FILE.  THE FUNCTION OF THIS PROGRAM IS TO CREATE AN  IX1014.2
   000013         001500*    INDEXED FILE SEQUENTIALLY (ACCESS MODE SEQUENTIAL) AND VERIFYIX1014.2
   000014         001600*    THAT IT WAS CREATED AS EXPECTED.  THE FILE IS IDENTIFIED AS  IX1014.2
   000015         001700*    "IX-FS1" AND IS PASSED TO PROGRAM IX102 FOR PROCESSING.      IX1014.2
   000016         001800*                                                                 IX1014.2
   000017         001900*                                                                 IX1014.2
   000018         002000*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX1014.2
   000019         002100*                                                                 IX1014.2
   000020         002200*             X-24   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX1014.2
   000021         002300*                    CLAUSE FOR DATA FILE IX-FS1                  IX1014.2
   000022         002400*             X-44   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX1014.2
   000023         002500*                    CLAUSE FOR INDEX FILE IX-FS1                 IX1014.2
   000024         002600*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX1014.2
   000025         002700*             X-62   IMPLEMENTOR-NAME FOR RAW-DATA (OPTIONAL)     IX1014.2
   000026         002800*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX1014.2
   000027         002900*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX1014.2
   000028         003000*                                                                 IX1014.2
   000029         003100*         NOTE:  X-CARDS 44 AND 62          ARE OPTIONAL          IX1014.2
   000030         003200*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX1014.2
   000031         003300*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX1014.2
   000032         003400*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX1014.2
   000033         003500*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX1014.2
   000034         003600*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX1014.2
   000035         003700*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX1014.2
   000036         003800*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX1014.2
   000037         003900*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX1014.2
   000038         004000*               THEY ARE AS FOLLOWS                               IX1014.2
   000039         004100*                                                                 IX1014.2
   000040         004200*                  J  SELECTS X-CARD 44                           IX1014.2
   000041         004300*                                                                 IX1014.2
   000042         004500 ENVIRONMENT DIVISION.                                            IX1014.2
   000043         004600 CONFIGURATION SECTION.                                           IX1014.2
   000044         004700 SOURCE-COMPUTER.                                                 IX1014.2
   000045         004800     XXXXX082.                                                    IX1014.2
   000046         004900 OBJECT-COMPUTER.                                                 IX1014.2
   000047         005000     XXXXX083.                                                    IX1014.2
   000048         005100 INPUT-OUTPUT SECTION.                                            IX1014.2
   000049         005200 FILE-CONTROL.                                                    IX1014.2
   000050         005300     SELECT RAW-DATA   ASSIGN TO                                  IX1014.2 66
   000051         005400     XXXXX062                                                     IX1014.2
   000052         005500            ORGANIZATION IS INDEXED                               IX1014.2
   000053         005600            ACCESS MODE IS RANDOM                                 IX1014.2
   000054         005700            RECORD KEY IS RAW-DATA-KEY.                           IX1014.2 69
   000055         005800     SELECT PRINT-FILE ASSIGN TO                                  IX1014.2 81
   000056         005900     XXXXX055.                                                    IX1014.2
   000057         006000     SELECT   IX-FS1 ASSIGN TO                                    IX1014.2 84
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100     XXXXP024                                                     IX1014.2
   000059         006200     XXXXP044                                                     IX1014.2

 ==000059==> IGYDS1298-I Assignment-name "XXXXP044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXP044" was treated as comments.

   000060         006300     ORGANIZATION IS INDEXED                                      IX1014.2
   000061         006400     RECORD KEY IS IX-FS1-KEY                                     IX1014.2 93
   000062         006500     ACCESS MODE IS SEQUENTIAL.                                   IX1014.2
   000063         006600 DATA DIVISION.                                                   IX1014.2
   000064         006700 FILE SECTION.                                                    IX1014.2
   000065         006800                                                                  IX1014.2
   000066         006900 FD  RAW-DATA.                                                    IX1014.2
   000067         007000                                                                  IX1014.2
   000068         007100 01  RAW-DATA-SATZ.                                               IX1014.2
   000069         007200     05  RAW-DATA-KEY        PIC X(6).                            IX1014.2
   000070         007300     05  C-DATE              PIC 9(6).                            IX1014.2
   000071         007400     05  C-TIME              PIC 9(8).                            IX1014.2
   000072         007500     05  C-NO-OF-TESTS       PIC 99.                              IX1014.2
   000073         007600     05  C-OK                PIC 999.                             IX1014.2
   000074         007700     05  C-ALL               PIC 999.                             IX1014.2
   000075         007800     05  C-FAIL              PIC 999.                             IX1014.2
   000076         007900     05  C-DELETED           PIC 999.                             IX1014.2
   000077         008000     05  C-INSPECT           PIC 999.                             IX1014.2
   000078         008100     05  C-NOTE              PIC X(13).                           IX1014.2
   000079         008200     05  C-INDENT            PIC X.                               IX1014.2
   000080         008300     05  C-ABORT             PIC X(8).                            IX1014.2
   000081         008400 FD  PRINT-FILE.                                                  IX1014.2

 ==000081==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000082         008500 01  PRINT-REC PICTURE X(120).                                    IX1014.2
   000083         008600 01  DUMMY-RECORD PICTURE X(120).                                 IX1014.2
   000084         008700 FD  IX-FS1                                                       IX1014.2

 ==000084==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000084==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000085         008800     LABEL RECORD IS STANDARD                                     IX1014.2
   000086         008900     DATA RECORD IS IX-FS1R1-F-G-240                              IX1014.2 *
   000087         009000     BLOCK CONTAINS 1 RECORDS                                     IX1014.2
   000088         009100     RECORD CONTAINS 240 CHARACTERS.                              IX1014.2
   000089         009200 01  IX-FS1R1-F-G-240.                                            IX1014.2
   000090         009300     03 IX-FS1-WRK-120 PIC X(120).                                IX1014.2
   000091         009400     03 IX-FS1-GRP-120.                                           IX1014.2
   000092         009500     05 FILLER   PIC   X(8).                                      IX1014.2
   000093         009600     05 IX-FS1-KEY  PIC X(29).                                    IX1014.2
   000094         009700     05 FILLER PIC X(83).                                         IX1014.2
   000095         009800 WORKING-STORAGE SECTION.                                         IX1014.2
   000096         009900 01  GRP-0101.                                                    IX1014.2
   000097         010000     02 FILLER   PIC X(10)  VALUE "ABCDLKJXYZ".                   IX1014.2
   000098         010100     02 WRK-DU-09V00-001 PIC 9(9)  VALUE ZERO.                    IX1014.2 IMP
   000099         010200     02 FILLER  PIC X(10)  VALUE "ZIF,.$-+CD".                    IX1014.2
   000100         010300 01  FILE-RECORD-INFORMATION-REC.                                 IX1014.2
   000101         010400     03 FILE-RECORD-INFO-SKELETON.                                IX1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000102         010500        05 FILLER                 PICTURE X(48)       VALUE       IX1014.2
   000103         010600             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX1014.2
   000104         010700        05 FILLER                 PICTURE X(46)       VALUE       IX1014.2
   000105         010800             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX1014.2
   000106         010900        05 FILLER                 PICTURE X(26)       VALUE       IX1014.2
   000107         011000             ",LFIL=000000,ORG=  ,LBLR= ".                        IX1014.2
   000108         011100        05 FILLER                 PICTURE X(37)       VALUE       IX1014.2
   000109         011200             ",RECKEY=                             ".             IX1014.2
   000110         011300        05 FILLER                 PICTURE X(38)       VALUE       IX1014.2
   000111         011400             ",ALTKEY1=                             ".            IX1014.2
   000112         011500        05 FILLER                 PICTURE X(38)       VALUE       IX1014.2
   000113         011600             ",ALTKEY2=                             ".            IX1014.2
   000114         011700        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX1014.2 IMP
   000115         011800     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX1014.2
   000116         011900        05 FILE-RECORD-INFO-P1-120.                               IX1014.2
   000117         012000           07 FILLER              PIC X(5).                       IX1014.2
   000118         012100           07 XFILE-NAME           PIC X(6).                      IX1014.2
   000119         012200           07 FILLER              PIC X(8).                       IX1014.2
   000120         012300           07 XRECORD-NAME         PIC X(6).                      IX1014.2
   000121         012400           07 FILLER              PIC X(1).                       IX1014.2
   000122         012500           07 REELUNIT-NUMBER     PIC 9(1).                       IX1014.2
   000123         012600           07 FILLER              PIC X(7).                       IX1014.2
   000124         012700           07 XRECORD-NUMBER       PIC 9(6).                      IX1014.2
   000125         012800           07 FILLER              PIC X(6).                       IX1014.2
   000126         012900           07 UPDATE-NUMBER       PIC 9(2).                       IX1014.2
   000127         013000           07 FILLER              PIC X(5).                       IX1014.2
   000128         013100           07 ODO-NUMBER          PIC 9(4).                       IX1014.2
   000129         013200           07 FILLER              PIC X(5).                       IX1014.2
   000130         013300           07 XPROGRAM-NAME        PIC X(5).                      IX1014.2
   000131         013400           07 FILLER              PIC X(7).                       IX1014.2
   000132         013500           07 XRECORD-LENGTH       PIC 9(6).                      IX1014.2
   000133         013600           07 FILLER              PIC X(7).                       IX1014.2
   000134         013700           07 CHARS-OR-RECORDS    PIC X(2).                       IX1014.2
   000135         013800           07 FILLER              PIC X(1).                       IX1014.2
   000136         013900           07 XBLOCK-SIZE          PIC 9(4).                      IX1014.2
   000137         014000           07 FILLER              PIC X(6).                       IX1014.2
   000138         014100           07 RECORDS-IN-FILE     PIC 9(6).                       IX1014.2
   000139         014200           07 FILLER              PIC X(5).                       IX1014.2
   000140         014300           07 XFILE-ORGANIZATION   PIC X(2).                      IX1014.2
   000141         014400           07 FILLER              PIC X(6).                       IX1014.2
   000142         014500           07 XLABEL-TYPE          PIC X(1).                      IX1014.2
   000143         014600        05 FILE-RECORD-INFO-P121-240.                             IX1014.2
   000144         014700           07 FILLER              PIC X(8).                       IX1014.2
   000145         014800           07 XRECORD-KEY          PIC X(29).                     IX1014.2
   000146         014900           07 FILLER              PIC X(9).                       IX1014.2
   000147         015000           07 ALTERNATE-KEY1      PIC X(29).                      IX1014.2
   000148         015100           07 FILLER              PIC X(9).                       IX1014.2
   000149         015200           07 ALTERNATE-KEY2      PIC X(29).                      IX1014.2
   000150         015300           07 FILLER              PIC X(7).                       IX1014.2
   000151         015400 01  TEST-RESULTS.                                                IX1014.2
   000152         015500     02 FILLER                   PIC X      VALUE SPACE.          IX1014.2 IMP
   000153         015600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1014.2 IMP
   000154         015700     02 FILLER                   PIC X      VALUE SPACE.          IX1014.2 IMP
   000155         015800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1014.2 IMP
   000156         015900     02 FILLER                   PIC X      VALUE SPACE.          IX1014.2 IMP
   000157         016000     02  PAR-NAME.                                                IX1014.2
   000158         016100       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000159         016200       03  PARDOT-X              PIC X      VALUE SPACE.          IX1014.2 IMP
   000160         016300       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1014.2 IMP
   000161         016400     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1014.2 IMP
   000162         016500     02 RE-MARK                  PIC X(61).                       IX1014.2
   000163         016600 01  TEST-COMPUTED.                                               IX1014.2
   000164         016700     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1014.2 IMP
   000165         016800     02 FILLER                   PIC X(17)  VALUE                 IX1014.2
   000166         016900            "       COMPUTED=".                                   IX1014.2
   000167         017000     02 COMPUTED-X.                                               IX1014.2
   000168         017100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1014.2 IMP
   000169         017200     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1014.2 168
   000170         017300                                 PIC -9(9).9(9).                  IX1014.2
   000171         017400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1014.2 168
   000172         017500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1014.2 168
   000173         017600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1014.2 168
   000174         017700     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1014.2 168
   000175         017800         04 COMPUTED-18V0                    PIC -9(18).          IX1014.2
   000176         017900         04 FILLER                           PIC X.               IX1014.2
   000177         018000     03 FILLER PIC X(50) VALUE SPACE.                             IX1014.2 IMP
   000178         018100 01  TEST-CORRECT.                                                IX1014.2
   000179         018200     02 FILLER PIC X(30) VALUE SPACE.                             IX1014.2 IMP
   000180         018300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1014.2
   000181         018400     02 CORRECT-X.                                                IX1014.2
   000182         018500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1014.2 IMP
   000183         018600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1014.2 182
   000184         018700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1014.2 182
   000185         018800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1014.2 182
   000186         018900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1014.2 182
   000187         019000     03      CR-18V0 REDEFINES CORRECT-A.                         IX1014.2 182
   000188         019100         04 CORRECT-18V0                     PIC -9(18).          IX1014.2
   000189         019200         04 FILLER                           PIC X.               IX1014.2
   000190         019300     03 FILLER PIC X(2) VALUE SPACE.                              IX1014.2 IMP
   000191         019400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1014.2 IMP
   000192         019500 01  CCVS-C-1.                                                    IX1014.2
   000193         019600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1014.2
   000194         019700-    "SS  PARAGRAPH-NAME                                          IX1014.2
   000195         019800-    "       REMARKS".                                            IX1014.2
   000196         019900     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1014.2 IMP
   000197         020000 01  CCVS-C-2.                                                    IX1014.2
   000198         020100     02 FILLER                     PIC X        VALUE SPACE.      IX1014.2 IMP
   000199         020200     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1014.2
   000200         020300     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1014.2 IMP
   000201         020400     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1014.2
   000202         020500     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1014.2 IMP
   000203         020600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1014.2 IMP
   000204         020700 01  REC-CT                        PIC 99       VALUE ZERO.       IX1014.2 IMP
   000205         020800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1014.2 IMP
   000206         020900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1014.2 IMP
   000207         021000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1014.2 IMP
   000208         021100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1014.2 IMP
   000209         021200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1014.2 IMP
   000210         021300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1014.2 IMP
   000211         021400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1014.2 IMP
   000212         021500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1014.2 IMP
   000213         021600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1014.2 IMP
   000214         021700 01  CCVS-H-1.                                                    IX1014.2
   000215         021800     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000216         021900     02  FILLER                    PIC X(42)    VALUE             IX1014.2
   000217         022000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1014.2
   000218         022100     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1014.2 IMP
   000219         022200 01  CCVS-H-2A.                                                   IX1014.2
   000220         022300   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1014.2 IMP
   000221         022400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1014.2
   000222         022500   02  FILLER                        PIC XXXX   VALUE             IX1014.2
   000223         022600     "4.2 ".                                                      IX1014.2
   000224         022700   02  FILLER                        PIC X(28)  VALUE             IX1014.2
   000225         022800            " COPY - NOT FOR DISTRIBUTION".                       IX1014.2
   000226         022900   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1014.2 IMP
   000227         023000                                                                  IX1014.2
   000228         023100 01  CCVS-H-2B.                                                   IX1014.2
   000229         023200   02  FILLER                        PIC X(15)  VALUE             IX1014.2
   000230         023300            "TEST RESULT OF ".                                    IX1014.2
   000231         023400   02  TEST-ID                       PIC X(9).                    IX1014.2
   000232         023500   02  FILLER                        PIC X(4)   VALUE             IX1014.2
   000233         023600            " IN ".                                               IX1014.2
   000234         023700   02  FILLER                        PIC X(12)  VALUE             IX1014.2
   000235         023800     " HIGH       ".                                              IX1014.2
   000236         023900   02  FILLER                        PIC X(22)  VALUE             IX1014.2
   000237         024000            " LEVEL VALIDATION FOR ".                             IX1014.2
   000238         024100   02  FILLER                        PIC X(58)  VALUE             IX1014.2
   000239         024200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1014.2
   000240         024300 01  CCVS-H-3.                                                    IX1014.2
   000241         024400     02  FILLER                      PIC X(34)  VALUE             IX1014.2
   000242         024500            " FOR OFFICIAL USE ONLY    ".                         IX1014.2
   000243         024600     02  FILLER                      PIC X(58)  VALUE             IX1014.2
   000244         024700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1014.2
   000245         024800     02  FILLER                      PIC X(28)  VALUE             IX1014.2
   000246         024900            "  COPYRIGHT   1985 ".                                IX1014.2
   000247         025000 01  CCVS-E-1.                                                    IX1014.2
   000248         025100     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1014.2 IMP
   000249         025200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1014.2
   000250         025300     02 ID-AGAIN                     PIC X(9).                    IX1014.2
   000251         025400     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1014.2 IMP
   000252         025500 01  CCVS-E-2.                                                    IX1014.2
   000253         025600     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1014.2 IMP
   000254         025700     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1014.2 IMP
   000255         025800     02 CCVS-E-2-2.                                               IX1014.2
   000256         025900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1014.2 IMP
   000257         026000         03 FILLER                   PIC X      VALUE SPACE.      IX1014.2 IMP
   000258         026100         03 ENDER-DESC               PIC X(44)  VALUE             IX1014.2
   000259         026200            "ERRORS ENCOUNTERED".                                 IX1014.2
   000260         026300 01  CCVS-E-3.                                                    IX1014.2
   000261         026400     02  FILLER                      PIC X(22)  VALUE             IX1014.2
   000262         026500            " FOR OFFICIAL USE ONLY".                             IX1014.2
   000263         026600     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1014.2 IMP
   000264         026700     02  FILLER                      PIC X(58)  VALUE             IX1014.2
   000265         026800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1014.2
   000266         026900     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1014.2 IMP
   000267         027000     02 FILLER                       PIC X(15)  VALUE             IX1014.2
   000268         027100             " COPYRIGHT 1985".                                   IX1014.2
   000269         027200 01  CCVS-E-4.                                                    IX1014.2
   000270         027300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1014.2 IMP
   000271         027400     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1014.2
   000272         027500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000273         027600     02 FILLER                       PIC X(40)  VALUE             IX1014.2
   000274         027700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1014.2
   000275         027800 01  XXINFO.                                                      IX1014.2
   000276         027900     02 FILLER                       PIC X(19)  VALUE             IX1014.2
   000277         028000            "*** INFORMATION ***".                                IX1014.2
   000278         028100     02 INFO-TEXT.                                                IX1014.2
   000279         028200       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1014.2 IMP
   000280         028300       04 XXCOMPUTED                 PIC X(20).                   IX1014.2
   000281         028400       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1014.2 IMP
   000282         028500       04 XXCORRECT                  PIC X(20).                   IX1014.2
   000283         028600     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1014.2
   000284         028700 01  HYPHEN-LINE.                                                 IX1014.2
   000285         028800     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1014.2 IMP
   000286         028900     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1014.2
   000287         029000-    "*****************************************".                 IX1014.2
   000288         029100     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1014.2
   000289         029200-    "******************************".                            IX1014.2
   000290         029300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1014.2
   000291         029400     "IX101A".                                                    IX1014.2
   000292         029500 PROCEDURE DIVISION.                                              IX1014.2
   000293         029600 CCVS1 SECTION.                                                   IX1014.2
   000294         029700 OPEN-FILES.                                                      IX1014.2
   000295         029800     OPEN I-O RAW-DATA.                                           IX1014.2 66
   000296         029900     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1014.2 290 69
   000297         030000     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1014.2 66 303
   000298         030100     MOVE "ABORTED " TO C-ABORT.                                  IX1014.2 80
   000299         030200     ADD 1 TO C-NO-OF-TESTS.                                      IX1014.2 72
   000300         030300     ACCEPT C-DATE  FROM DATE.                                    IX1014.2 70
   000301         030400     ACCEPT C-TIME  FROM TIME.                                    IX1014.2 71
   000302         030500     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1014.2 68 303
   000303         030600 END-E-1.                                                         IX1014.2
   000304         030700     CLOSE RAW-DATA.                                              IX1014.2 66
   000305         030800     OPEN    OUTPUT PRINT-FILE.                                   IX1014.2 81
   000306         030900     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1014.2 290 231 290 250
   000307         031000     MOVE    SPACE TO TEST-RESULTS.                               IX1014.2 IMP 151
   000308         031100     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1014.2 352 357
   000309         031200     MOVE    ZERO TO REC-SKL-SUB.                                 IX1014.2 IMP 203
   000310         031300     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1014.2 311
   000311         031400 CCVS-INIT-FILE.                                                  IX1014.2
   000312         031500     ADD     1 TO REC-SKL-SUB.                                    IX1014.2 203
   000313         031600     MOVE    FILE-RECORD-INFO-SKELETON                            IX1014.2 101
   000314         031700          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1014.2 115 203
   000315         031800 CCVS-INIT-EXIT.                                                  IX1014.2
   000316         031900     GO TO CCVS1-EXIT.                                            IX1014.2 439
   000317         032000 CLOSE-FILES.                                                     IX1014.2
   000318         032100     OPEN I-O RAW-DATA.                                           IX1014.2 66
   000319         032200     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1014.2 290 69
   000320         032300     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1014.2 66 328
   000321         032400     MOVE "OK.     " TO C-ABORT.                                  IX1014.2 80
   000322         032500     MOVE PASS-COUNTER TO C-OK.                                   IX1014.2 208 73
   000323         032600     MOVE ERROR-HOLD   TO C-ALL.                                  IX1014.2 210 74
   000324         032700     MOVE ERROR-COUNTER TO C-FAIL.                                IX1014.2 206 75
   000325         032800     MOVE DELETE-COUNTER TO C-DELETED.                            IX1014.2 205 76
   000326         032900     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1014.2 207 77
   000327         033000     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1014.2 68 328
   000328         033100 END-E-2.                                                         IX1014.2
   000329         033200     CLOSE RAW-DATA.                                              IX1014.2 66
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000330         033300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1014.2 361 382 81
   000331         033400 TERMINATE-CCVS.                                                  IX1014.2
   000332         033500     EXIT PROGRAM.                                                IX1014.2
   000333         033600 TERMINATE-CALL.                                                  IX1014.2
   000334         033700     STOP     RUN.                                                IX1014.2
   000335         033800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1014.2 155 207
   000336         033900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1014.2 155 208
   000337         034000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1014.2 155 206
   000338         034100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1014.2 155 205
   000339         034200     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1014.2 162
   000340         034300 PRINT-DETAIL.                                                    IX1014.2
   000341         034400     IF REC-CT NOT EQUAL TO ZERO                                  IX1014.2 204 IMP
   000342      1  034500             MOVE "." TO PARDOT-X                                 IX1014.2 159
   000343      1  034600             MOVE REC-CT TO DOTVALUE.                             IX1014.2 204 160
   000344         034700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1014.2 151 82 394
   000345         034800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1014.2 155 394
   000346      1  034900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1014.2 415 429
   000347      1  035000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1014.2 430 438
   000348         035100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1014.2 IMP 155 IMP 167
   000349         035200     MOVE SPACE TO CORRECT-X.                                     IX1014.2 IMP 181
   000350         035300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1014.2 204 IMP IMP 157
   000351         035400     MOVE     SPACE TO RE-MARK.                                   IX1014.2 IMP 162
   000352         035500 HEAD-ROUTINE.                                                    IX1014.2
   000353         035600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1014.2 214 83 394
   000354         035700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1014.2 219 83 394
   000355         035800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1014.2 228 83 394
   000356         035900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1014.2 240 83 394
   000357         036000 COLUMN-NAMES-ROUTINE.                                            IX1014.2
   000358         036100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1014.2 192 83 394
   000359         036200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1014.2 197 83 394
   000360         036300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1014.2 284 83 394
   000361         036400 END-ROUTINE.                                                     IX1014.2
   000362         036500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1014.2 284 83 394
   000363         036600 END-RTN-EXIT.                                                    IX1014.2
   000364         036700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1014.2 247 83 394
   000365         036800 END-ROUTINE-1.                                                   IX1014.2
   000366         036900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1014.2 206 210 207
   000367         037000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1014.2 210 205 210
   000368         037100      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1014.2 208 210
   000369         037200*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1014.2
   000370         037300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1014.2 208 270
   000371         037400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1014.2 210 272
   000372         037500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1014.2 269 255
   000373         037600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1014.2 252 83 394
   000374         037700  END-ROUTINE-12.                                                 IX1014.2
   000375         037800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1014.2 258
   000376         037900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1014.2 206 IMP
   000377      1  038000         MOVE "NO " TO ERROR-TOTAL                                IX1014.2 256
   000378         038100         ELSE                                                     IX1014.2
   000379      1  038200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1014.2 206 256
   000380         038300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1014.2 252 83
   000381         038400     PERFORM WRITE-LINE.                                          IX1014.2 394
   000382         038500 END-ROUTINE-13.                                                  IX1014.2
   000383         038600     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1014.2 205 IMP
   000384      1  038700         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1014.2 256
   000385      1  038800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1014.2 205 256
   000386         038900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1014.2 258
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000387         039000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1014.2 252 83 394
   000388         039100      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1014.2 207 IMP
   000389      1  039200          MOVE "NO " TO ERROR-TOTAL                               IX1014.2 256
   000390      1  039300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1014.2 207 256
   000391         039400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1014.2 258
   000392         039500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1014.2 252 83 394
   000393         039600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1014.2 260 83 394
   000394         039700 WRITE-LINE.                                                      IX1014.2
   000395         039800     ADD 1 TO RECORD-COUNT.                                       IX1014.2 212
   000396         039900     IF RECORD-COUNT GREATER 42                                   IX1014.2 212
   000397      1  040000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1014.2 83 211
   000398      1  040100         MOVE SPACE TO DUMMY-RECORD                               IX1014.2 IMP 83
   000399      1  040200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1014.2 83
   000400      1  040300         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1014.2 214 83 410
   000401      1  040400         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1014.2 219 83 410
   000402      1  040500         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1014.2 228 83 410
   000403      1  040600         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1014.2 240 83 410
   000404      1  040700         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1014.2 192 83 410
   000405      1  040800         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1014.2 197 83 410
   000406      1  040900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1014.2 284 83 410
   000407      1  041000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1014.2 211 83
   000408      1  041100         MOVE ZERO TO RECORD-COUNT.                               IX1014.2 IMP 212
   000409         041200     PERFORM WRT-LN.                                              IX1014.2 410
   000410         041300 WRT-LN.                                                          IX1014.2
   000411         041400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1014.2 83
   000412         041500     MOVE SPACE TO DUMMY-RECORD.                                  IX1014.2 IMP 83
   000413         041600 BLANK-LINE-PRINT.                                                IX1014.2
   000414         041700     PERFORM WRT-LN.                                              IX1014.2 410
   000415         041800 FAIL-ROUTINE.                                                    IX1014.2
   000416         041900     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1014.2 167 IMP
   000417      1  042000            GO TO   FAIL-ROUTINE-WRITE.                           IX1014.2 424
   000418         042100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1014.2 181 IMP 424
   000419         042200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1014.2 213 283
   000420         042300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1014.2 278
   000421         042400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1014.2 275 83 394
   000422         042500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1014.2 IMP 283
   000423         042600     GO TO  FAIL-ROUTINE-EX.                                      IX1014.2 429
   000424         042700 FAIL-ROUTINE-WRITE.                                              IX1014.2
   000425         042800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1014.2 163 82 394
   000426         042900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1014.2 213 191
   000427         043000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1014.2 178 82 394
   000428         043100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1014.2 IMP 191
   000429         043200 FAIL-ROUTINE-EX. EXIT.                                           IX1014.2
   000430         043300 BAIL-OUT.                                                        IX1014.2
   000431         043400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1014.2 168 IMP 433
   000432         043500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1014.2 182 IMP 438
   000433         043600 BAIL-OUT-WRITE.                                                  IX1014.2
   000434         043700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1014.2 182 282 168 280
   000435         043800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1014.2 213 283
   000436         043900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1014.2 275 83 394
   000437         044000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1014.2 IMP 283
   000438         044100 BAIL-OUT-EX. EXIT.                                               IX1014.2
   000439         044200 CCVS1-EXIT.                                                      IX1014.2
   000440         044300     EXIT.                                                        IX1014.2
   000441         044400 SECT-IX-01-001 SECTION.                                          IX1014.2
   000442         044500 WRITE-INIT-GF-01.                                                IX1014.2
   000443         044600     MOVE     "FILE CREATE IX-FS1" TO FEATURE.                    IX1014.2 153
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000444         044700     OPEN     OUTPUT    IX-FS1.                                   IX1014.2 84
   000445         044800     MOVE     "IX-FS1" TO XFILE-NAME (1).                         IX1014.2 118
   000446         044900     MOVE    "IX-F-G" TO XRECORD-NAME (1).                        IX1014.2 120
   000447         045000     MOVE  CCVS-PGM-ID TO XPROGRAM-NAME (1).                      IX1014.2 290 130
   000448         045100     MOVE    000240  TO XRECORD-LENGTH (1).                       IX1014.2 132
   000449         045200     MOVE     "RC"     TO CHARS-OR-RECORDS (1).                   IX1014.2 134
   000450         045300     MOVE     0001     TO XBLOCK-SIZE (1).                        IX1014.2 136
   000451         045400     MOVE     000500   TO RECORDS-IN-FILE (1).                    IX1014.2 138
   000452         045500     MOVE    "IX"  TO XFILE-ORGANIZATION (1).                     IX1014.2 140
   000453         045600     MOVE     "S"      TO XLABEL-TYPE (1).                        IX1014.2 142
   000454         045700     MOVE     000001   TO XRECORD-NUMBER (1).                     IX1014.2 124
   000455         045800 WRITE-TEST-GF-01.                                                IX1014.2
   000456         045900     MOVE    XRECORD-NUMBER (1) TO WRK-DU-09V00-001.              IX1014.2 124 98
   000457         046000     MOVE    GRP-0101 TO XRECORD-KEY (1).                         IX1014.2 96 145
   000458         046100     MOVE    FILE-RECORD-INFO (1) TO IX-FS1R1-F-G-240.            IX1014.2 115 89
   000459         046200     WRITE   IX-FS1R1-F-G-240                                     IX1014.2 89
   000460      1  046300              INVALID KEY GO TO WRITE-FAIL-GF-01.                 IX1014.2 465
   000461         046400     IF      XRECORD-NUMBER (1) EQUAL TO 500                      IX1014.2 124
   000462      1  046500             GO TO WRITE-PASS-GF-01.                              IX1014.2 469
   000463         046600     ADD      000001 TO XRECORD-NUMBER (1).                       IX1014.2 124
   000464         046700     GO       TO WRITE-TEST-GF-01.                                IX1014.2 455
   000465         046800 WRITE-FAIL-GF-01.                                                IX1014.2
   000466         046900     MOVE     "IX-41 4.9.2        " TO RE-MARK.                   IX1014.2 162
   000467         047000     PERFORM FAIL.                                                IX1014.2 337
   000468         047100     GO TO WRITE-WRITE-GF-01.                                     IX1014.2 471
   000469         047200 WRITE-PASS-GF-01.                                                IX1014.2
   000470         047300     PERFORM PASS.                                                IX1014.2 336
   000471         047400 WRITE-WRITE-GF-01.                                               IX1014.2
   000472         047500     MOVE     "WRITE-TEST-GF-01" TO PAR-NAME                      IX1014.2 157
   000473         047600     MOVE     "FILE CREATED, LFILE "  TO COMPUTED-A.              IX1014.2 168
   000474         047700     MOVE    XRECORD-NUMBER (1) TO CORRECT-18V0.                  IX1014.2 124 188
   000475         047800     PERFORM  PRINT-DETAIL.                                       IX1014.2 340
   000476         047900     CLOSE    IX-FS1.                                             IX1014.2 84
   000477         048000 READ-INIT-GF-01.                                                 IX1014.2
   000478         048100     OPEN     INPUT     IX-FS1.                                   IX1014.2 84
   000479         048200     MOVE   ZERO TO WRK-DU-09V00-001.                             IX1014.2 IMP 98
   000480         048300 READ-TEST-GF-01.                                                 IX1014.2
   000481         048400     READ     IX-FS1                                              IX1014.2 84
   000482      1  048500              AT END GO TO READ-TEST-GF-01-1.                     IX1014.2 489
   000483         048600     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX1014.2 89 115
   000484         048700     ADD     1  TO WRK-DU-09V00-001.                              IX1014.2 98
   000485         048800     IF      WRK-DU-09V00-001 GREATER 500                         IX1014.2 98
   000486      1  048900             MOVE "MORE THAN 500 RECORDS" TO RE-MARK              IX1014.2 162
   000487      1  049000              GO TO READ-TEST-GF-01-1.                            IX1014.2 489
   000488         049100     GO       TO READ-TEST-GF-01.                                 IX1014.2 480
   000489         049200 READ-TEST-GF-01-1.                                               IX1014.2
   000490         049300     IF       XRECORD-NUMBER (1) NOT EQUAL TO 500                 IX1014.2 124
   000491      1  049400              MOVE "IX-28 4.5.2 " TO RE-MARK                      IX1014.2 162
   000492      1  049500              PERFORM FAIL                                        IX1014.2 337
   000493         049600              ELSE                                                IX1014.2
   000494      1  049700              PERFORM PASS.                                       IX1014.2 336
   000495         049800     GO       TO READ-WRITE-GF-01.                                IX1014.2 496
   000496         049900 READ-WRITE-GF-01.                                                IX1014.2
   000497         050000     MOVE     "READ-TEST-GF-01" TO PAR-NAME.                      IX1014.2 157
   000498         050100     MOVE     "FILE VERIFIED, LFILE" TO COMPUTED-A.               IX1014.2 168
   000499         050200     MOVE    XRECORD-NUMBER (1) TO CORRECT-18V0.                  IX1014.2 124 188
   000500         050300     PERFORM  PRINT-DETAIL.                                       IX1014.2 340
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000501         050400     CLOSE   IX-FS1.                                              IX1014.2 84
   000502         050500 CCVS-EXIT SECTION.                                               IX1014.2
   000503         050600 CCVS-999999.                                                     IX1014.2
   000504         050700     GO TO   CLOSE-FILES.                                         IX1014.2 317
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page    13
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      147   ALTERNATE-KEY1
      149   ALTERNATE-KEY2
      213   ANSI-REFERENCE . . . . . . . .  419 426 435
       80   C-ABORT. . . . . . . . . . . .  M298 M321
       74   C-ALL. . . . . . . . . . . . .  M323
       70   C-DATE . . . . . . . . . . . .  M300
       76   C-DELETED. . . . . . . . . . .  M325
       75   C-FAIL . . . . . . . . . . . .  M324
       79   C-INDENT
       77   C-INSPECT. . . . . . . . . . .  M326
       72   C-NO-OF-TESTS. . . . . . . . .  M299
       78   C-NOTE
       73   C-OK . . . . . . . . . . . . .  M322
       71   C-TIME . . . . . . . . . . . .  M301
      192   CCVS-C-1 . . . . . . . . . . .  358 404
      197   CCVS-C-2 . . . . . . . . . . .  359 405
      247   CCVS-E-1 . . . . . . . . . . .  364
      252   CCVS-E-2 . . . . . . . . . . .  373 380 387 392
      255   CCVS-E-2-2 . . . . . . . . . .  M372
      260   CCVS-E-3 . . . . . . . . . . .  393
      269   CCVS-E-4 . . . . . . . . . . .  372
      270   CCVS-E-4-1 . . . . . . . . . .  M370
      272   CCVS-E-4-2 . . . . . . . . . .  M371
      214   CCVS-H-1 . . . . . . . . . . .  353 400
      219   CCVS-H-2A. . . . . . . . . . .  354 401
      228   CCVS-H-2B. . . . . . . . . . .  355 402
      240   CCVS-H-3 . . . . . . . . . . .  356 403
      290   CCVS-PGM-ID. . . . . . . . . .  296 306 306 319 447
      134   CHARS-OR-RECORDS . . . . . . .  M449
      174   CM-18V0
      168   COMPUTED-A . . . . . . . . . .  169 171 172 173 174 431 434 M473 M498
      169   COMPUTED-N
      167   COMPUTED-X . . . . . . . . . .  M348 416
      171   COMPUTED-0V18
      173   COMPUTED-14V4
      175   COMPUTED-18V0
      172   COMPUTED-4V14
      191   COR-ANSI-REFERENCE . . . . . .  M426 M428
      182   CORRECT-A. . . . . . . . . . .  183 184 185 186 187 432 434
      183   CORRECT-N
      181   CORRECT-X. . . . . . . . . . .  M349 418
      184   CORRECT-0V18
      186   CORRECT-14V4
      188   CORRECT-18V0 . . . . . . . . .  M474 M499
      185   CORRECT-4V14
      187   CR-18V0
      205   DELETE-COUNTER . . . . . . . .  325 M338 367 383 385
      160   DOTVALUE . . . . . . . . . . .  M343
      211   DUMMY-HOLD . . . . . . . . . .  M397 407
       83   DUMMY-RECORD . . . . . . . . .  M353 M354 M355 M356 M358 M359 M360 M362 M364 M373 M380 M387 M392 M393 397 M398
                                            399 M400 M401 M402 M403 M404 M405 M406 M407 411 M412 M421 M436
      258   ENDER-DESC . . . . . . . . . .  M375 M386 M391
      206   ERROR-COUNTER. . . . . . . . .  324 M337 366 376 379
      210   ERROR-HOLD . . . . . . . . . .  323 M366 M367 M367 M368 371
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page    14
0 Defined   Cross-reference of data names   References

0     256   ERROR-TOTAL. . . . . . . . . .  M377 M379 M384 M385 M389 M390
      153   FEATURE. . . . . . . . . . . .  M443
      115   FILE-RECORD-INFO . . . . . . .  M314 458 M483
      116   FILE-RECORD-INFO-P1-120
      143   FILE-RECORD-INFO-P121-240
      101   FILE-RECORD-INFO-SKELETON. . .  313
      100   FILE-RECORD-INFORMATION-REC
       96   GRP-0101 . . . . . . . . . . .  457
      284   HYPHEN-LINE. . . . . . . . . .  360 362 406
      250   ID-AGAIN . . . . . . . . . . .  M306
      283   INF-ANSI-REFERENCE . . . . . .  M419 M422 M435 M437
      278   INFO-TEXT. . . . . . . . . . .  M420
      207   INSPECT-COUNTER. . . . . . . .  326 M335 366 388 390
       84   IX-FS1 . . . . . . . . . . . .  57 444 476 478 481 501
       91   IX-FS1-GRP-120
       93   IX-FS1-KEY . . . . . . . . . .  61
       90   IX-FS1-WRK-120
       89   IX-FS1R1-F-G-240 . . . . . . .  M458 459 483
      128   ODO-NUMBER
      155   P-OR-F . . . . . . . . . . . .  M335 M336 M337 M338 345 M348
      157   PAR-NAME . . . . . . . . . . .  M350 M472 M497
      159   PARDOT-X . . . . . . . . . . .  M342
      208   PASS-COUNTER . . . . . . . . .  322 M336 368 370
       81   PRINT-FILE . . . . . . . . . .  55 305 330
       82   PRINT-REC. . . . . . . . . . .  M344 M425 M427
       66   RAW-DATA . . . . . . . . . . .  50 295 297 304 318 320 329
       69   RAW-DATA-KEY . . . . . . . . .  54 M296 M319
       68   RAW-DATA-SATZ. . . . . . . . .  302 327
      162   RE-MARK. . . . . . . . . . . .  M339 M351 M466 M486 M491
      204   REC-CT . . . . . . . . . . . .  341 343 350
      203   REC-SKL-SUB. . . . . . . . . .  M309 M312 314
      212   RECORD-COUNT . . . . . . . . .  M395 396 M408
      138   RECORDS-IN-FILE. . . . . . . .  M451
      122   REELUNIT-NUMBER
      163   TEST-COMPUTED. . . . . . . . .  425
      178   TEST-CORRECT . . . . . . . . .  427
      231   TEST-ID. . . . . . . . . . . .  M306
      151   TEST-RESULTS . . . . . . . . .  M307 344
      209   TOTAL-ERROR
      126   UPDATE-NUMBER
       98   WRK-DU-09V00-001 . . . . . . .  M456 M479 M484 485
      136   XBLOCK-SIZE. . . . . . . . . .  M450
      118   XFILE-NAME . . . . . . . . . .  M445
      140   XFILE-ORGANIZATION . . . . . .  M452
      142   XLABEL-TYPE. . . . . . . . . .  M453
      130   XPROGRAM-NAME. . . . . . . . .  M447
      145   XRECORD-KEY. . . . . . . . . .  M457
      132   XRECORD-LENGTH . . . . . . . .  M448
      120   XRECORD-NAME . . . . . . . . .  M446
      124   XRECORD-NUMBER . . . . . . . .  M454 456 461 M463 474 490 499
      280   XXCOMPUTED . . . . . . . . . .  M434
      282   XXCORRECT. . . . . . . . . . .  M434
      275   XXINFO . . . . . . . . . . . .  421 436
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page    15
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

      430   BAIL-OUT . . . . . . . . . . .  P347
      438   BAIL-OUT-EX. . . . . . . . . .  E347 G432
      433   BAIL-OUT-WRITE . . . . . . . .  G431
      413   BLANK-LINE-PRINT
      502   CCVS-EXIT
      315   CCVS-INIT-EXIT
      311   CCVS-INIT-FILE . . . . . . . .  P310
      503   CCVS-999999
      293   CCVS1
      439   CCVS1-EXIT . . . . . . . . . .  G316
      317   CLOSE-FILES. . . . . . . . . .  G504
      357   COLUMN-NAMES-ROUTINE . . . . .  E308
      338   DE-LETE
      303   END-E-1. . . . . . . . . . . .  G297 G302
      328   END-E-2. . . . . . . . . . . .  G320 G327
      361   END-ROUTINE. . . . . . . . . .  P330
      365   END-ROUTINE-1
      374   END-ROUTINE-12
      382   END-ROUTINE-13 . . . . . . . .  E330
      363   END-RTN-EXIT
      337   FAIL . . . . . . . . . . . . .  P467 P492
      415   FAIL-ROUTINE . . . . . . . . .  P346
      429   FAIL-ROUTINE-EX. . . . . . . .  E346 G423
      424   FAIL-ROUTINE-WRITE . . . . . .  G417 G418
      352   HEAD-ROUTINE . . . . . . . . .  P308
      335   INSPT
      294   OPEN-FILES
      336   PASS . . . . . . . . . . . . .  P470 P494
      340   PRINT-DETAIL . . . . . . . . .  P475 P500
      477   READ-INIT-GF-01
      480   READ-TEST-GF-01. . . . . . . .  G488
      489   READ-TEST-GF-01-1. . . . . . .  G482 G487
      496   READ-WRITE-GF-01 . . . . . . .  G495
      441   SECT-IX-01-001
      333   TERMINATE-CALL
      331   TERMINATE-CCVS
      465   WRITE-FAIL-GF-01 . . . . . . .  G460
      442   WRITE-INIT-GF-01
      394   WRITE-LINE . . . . . . . . . .  P344 P345 P353 P354 P355 P356 P358 P359 P360 P362 P364 P373 P381 P387 P392 P393
                                            P421 P425 P427 P436
      469   WRITE-PASS-GF-01 . . . . . . .  G462
      455   WRITE-TEST-GF-01 . . . . . . .  G464
      471   WRITE-WRITE-GF-01. . . . . . .  G468
      410   WRT-LN . . . . . . . . . . . .  P400 P401 P402 P403 P404 P405 P406 P409 P414
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page    16
0 Defined   Cross-reference of programs     References

        3   IX101A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX101A    Date 06/04/2022  Time 11:59:30   Page    17
0LineID  Message code  Message text

     59  IGYDS1298-I   Assignment-name "XXXXP044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXP044" was treated as comments.

     81  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     84  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     84  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       4           4
-* Statistics for COBOL program IX101A:
 *    Source records = 504
 *    Data Division statements = 103
 *    Procedure Division statements = 214
 *    Generated COBOL statements = 0
 *    Program complexity factor = 221
0End of compilation 1,  program IX101A,  highest severity 0.
0Return code 0
