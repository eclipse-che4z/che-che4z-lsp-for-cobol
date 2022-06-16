1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:04   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:04   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2184.2
   000002         000200 PROGRAM-ID.                                                      IX2184.2
   000003         000300     IX218A.                                                      IX2184.2
   000004         000500*                                                              *  IX2184.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2184.2
   000006         000700*                                                              *  IX2184.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2184.2
   000008         000900*                                                              *  IX2184.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2184.2
   000010         001100*                                                              *  IX2184.2
   000011         001300*                                                                 IX2184.2
   000012         001400*  1.  THE  FUNCTION  OF THIS PROGRAM IS TO CHECK THE SEQUENTIAL  IX2184.2
   000013         001500*      READ  STATEMENT FOR A NOT EXISTING OPTIONAL INDEXED FILE.  IX2184.2
   000014         001600*      THE  READ  STATEMENT WITHOUT AN OPEN STATEMENT FOR SUCH A  IX2184.2
   000015         001700*      FILE  MUST CAUSE THE AT END CONDITION AND THE FILE STATUS  IX2184.2
   000016         001800*      CODE  10. THIS CODE IS CHECKED HERE. THE NAME OF THE FILE  IX2184.2
   000017         001900*      IS  IX-FS1.  THE  AT  END PHRASE IS SPECIFIED. THAT MEANS  IX2184.2
   000018         002000*      THAT  ANY USE AFTER STANDARD EXCEPTION PROCEDURE MUST NOT  IX2184.2
   000019         002100*      BE EXECUTED.                                               IX2184.2
   000020         002200*                                                                 IX2184.2
   000021         002300*  2.  ANOTHER  FUNCTION  OF  THIS PROGRAM IS TO CHECK THE START  IX2184.2
   000022         002400*      AND  THE  RANDOM  READ  STATEMENTS  FOR  A  NOT  EXISTING  IX2184.2
   000023         002500*      OPTIONAL  INDEXED  FILE.  BOTH  ATTEMPTS SHOULD CAUSE THE  IX2184.2
   000024         002600*      FILE  STATUS CODE 23. THE INVALID KEY PHRASE IS SPECIFIED  IX2184.2
   000025         002700*      AND  THE  USE AFTER STANDARD EXCEPTION PROCEDURE MUST NOT  IX2184.2
   000026         002800*      BE EXECUTED. THE NAME OF THE FILE IS IX-FS2.               IX2184.2
   000027         002900*                                                                 IX2184.2
   000028         003000*                                                                 IX2184.2
   000029         003100*                                                                 IX2184.2
   000030         003200*       X-CARDS  WHICH MUST BE REPLACED FOR THIS PROGRAM ARE      IX2184.2
   000031         003300*                                                                 IX2184.2
   000032         003400*             X-24   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2184.2
   000033         003500*                    CLAUSE FOR DATA FILE IX-FS1                  IX2184.2
   000034         003600*             X-25   INDEXED FILE IMPLEMENTOR-NAME IN ASSGN TO    IX2184.2
   000035         003700*                    CLAUSE FOR DATA FILE IX-FS1                  IX2184.2
   000036         003800*             X-55   IMPLEMENTOR-NAME FOR SYSTEM PRINTER          IX2184.2
   000037         003900*             X-62   IMPLEMENTOR-NAME FOR RAW-DATA (OPTIONAL)     IX2184.2
   000038         004000*             X-82   IMPLEMENTOR-NAME FOR SOURCE-COMPUTER         IX2184.2
   000039         004100*             X-83   IMPLEMENTOR-NAME FOR OBJECT-COMPUTER         IX2184.2
   000040         004200*             X-84   IMPLEMENTOR-NAME FOR PRINT-FILE              IX2184.2
   000041         004300*                                                                 IX2184.2
   000042         004400*         NOTE:  X-CARDS 44, 45 AND 62          ARE OPTIONAL      IX2184.2
   000043         004500*               AND NEED ONLY TO BE PRESENT IF THE COMPILER RE-   IX2184.2
   000044         004600*               QUIRES THIS CODE BE AVAILABLE FOR PROPER PROGRAM  IX2184.2
   000045         004700*               COMPILATION AND EXECUTION. IF THE VP-ROUTINE IS   IX2184.2
   000046         004800*               USED THE  X-CARDS MAY BE AUTOMATICALLY SELECTED   IX2184.2
   000047         004900*               FOR INCLUSION IN THE PROGRAM BY SPECIFYING THE    IX2184.2
   000048         005000*               APPROPRIATE LETTER IN THE "*OPT" VP-ROUTINE       IX2184.2
   000049         005100*               CONTROL CARD. THE LETTER  CORRESPONDS TO A        IX2184.2
   000050         005200*               CHARACTER IN POSITION 7 OF THE SOURCE LINE AND    IX2184.2
   000051         005300*               THEY ARE AS FOLLOWS                               IX2184.2
   000052         005400*                                                                 IX2184.2
   000053         005500*                  J  SELECTS X-CARD 44                           IX2184.2
   000054         005600*                  J  SELECTS X-CARD 45                           IX2184.2
   000055         005700*                  P  SELECTS X-CARD 62                           IX2184.2
   000056         005800*                  C  SELECTS X-CARD 84                           IX2184.2
   000057         005900*                                                                 IX2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100 ENVIRONMENT DIVISION.                                            IX2184.2
   000059         006200 CONFIGURATION SECTION.                                           IX2184.2
   000060         006300 SOURCE-COMPUTER.                                                 IX2184.2
   000061         006400     XXXXX082.                                                    IX2184.2
   000062         006500 OBJECT-COMPUTER.                                                 IX2184.2
   000063         006600     XXXXX083.                                                    IX2184.2
   000064         006700 INPUT-OUTPUT SECTION.                                            IX2184.2
   000065         006800 FILE-CONTROL.                                                    IX2184.2
   000066         006900     SELECT RAW-DATA   ASSIGN TO                                  IX2184.2 95
   000067         007000     XXXXX062                                                     IX2184.2
   000068         007100            ORGANIZATION IS INDEXED                               IX2184.2
   000069         007200            ACCESS MODE IS RANDOM                                 IX2184.2
   000070         007300            RECORD KEY IS RAW-DATA-KEY.                           IX2184.2 98
   000071         007400     SELECT PRINT-FILE ASSIGN TO                                  IX2184.2 110
   000072         007500     XXXXX055.                                                    IX2184.2
   000073         007600                                                                  IX2184.2
   000074         007700     SELECT OPTIONAL   IX-FS1 ASSIGN TO                           IX2184.2 114
   000075         007800*    SELECT            IX-FS1 ASSIGN TO                           IX2184.2
   000076         007900     XXXXP024                                                     IX2184.2
   000077         008000     XXXXP044                                                     IX2184.2

 ==000077==> IGYDS1298-I Assignment-name "XXXXP044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXP044" was treated as comments.

   000078         008100     ORGANIZATION IS INDEXED                                      IX2184.2
   000079         008200     RECORD KEY IS IX-FS1-KEY                                     IX2184.2 123
   000080         008300     ACCESS MODE IS SEQUENTIAL                                    IX2184.2
   000081         008400     FILE STATUS IS IX-FS1-STATUS.                                IX2184.2 141
   000082         008500                                                                  IX2184.2
   000083         008600     SELECT OPTIONAL   IX-FS2 ASSIGN TO                           IX2184.2 126
   000084         008700*    SELECT            IX-FS2 ASSIGN TO                           IX2184.2
   000085         008800     XXXXP025                                                     IX2184.2
   000086         008900     XXXXP045                                                     IX2184.2

 ==000086==> IGYDS1298-I Assignment-name "XXXXP045" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXP045" was treated as comments.

   000087         009000     ORGANIZATION IS INDEXED                                      IX2184.2
   000088         009100     RECORD KEY IS IX-FS2-KEY                                     IX2184.2 135
   000089         009200     ACCESS MODE IS DYNAMIC                                       IX2184.2
   000090         009300     FILE STATUS IS IX-FS2-STATUS.                                IX2184.2 145
   000091         009400                                                                  IX2184.2
   000092         009500 DATA DIVISION.                                                   IX2184.2
   000093         009600 FILE SECTION.                                                    IX2184.2
   000094         009700                                                                  IX2184.2
   000095         009800 FD  RAW-DATA.                                                    IX2184.2
   000096         009900                                                                  IX2184.2
   000097         010000 01  RAW-DATA-SATZ.                                               IX2184.2
   000098         010100     05  RAW-DATA-KEY        PIC X(6).                            IX2184.2
   000099         010200     05  C-DATE              PIC 9(6).                            IX2184.2
   000100         010300     05  C-TIME              PIC 9(8).                            IX2184.2
   000101         010400     05  C-NO-OF-TESTS       PIC 99.                              IX2184.2
   000102         010500     05  C-OK                PIC 999.                             IX2184.2
   000103         010600     05  C-ALL               PIC 999.                             IX2184.2
   000104         010700     05  C-FAIL              PIC 999.                             IX2184.2
   000105         010800     05  C-DELETED           PIC 999.                             IX2184.2
   000106         010900     05  C-INSPECT           PIC 999.                             IX2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000107         011000     05  C-NOTE              PIC X(13).                           IX2184.2
   000108         011100     05  C-INDENT            PIC X.                               IX2184.2
   000109         011200     05  C-ABORT             PIC X(8).                            IX2184.2
   000110         011300 FD  PRINT-FILE.                                                  IX2184.2

 ==000110==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000111         011400 01  PRINT-REC PICTURE X(120).                                    IX2184.2
   000112         011500 01  DUMMY-RECORD PICTURE X(120).                                 IX2184.2
   000113         011600                                                                  IX2184.2
   000114         011700 FD  IX-FS1                                                       IX2184.2

 ==000114==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000114==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000115         011800     LABEL RECORD IS STANDARD                                     IX2184.2
   000116         011900     DATA RECORD IS IX-FS1R1-F-G-240                              IX2184.2 *
   000117         012000     BLOCK CONTAINS 1 RECORDS                                     IX2184.2
   000118         012100     RECORD CONTAINS 240 CHARACTERS.                              IX2184.2
   000119         012200 01  IX-FS1R1-F-G-240.                                            IX2184.2
   000120         012300     03 IX-FS1-WRK-120 PIC X(120).                                IX2184.2
   000121         012400     03 IX-FS1-GRP-120.                                           IX2184.2
   000122         012500     05 FILLER   PIC   X(8).                                      IX2184.2
   000123         012600     05 IX-FS1-KEY  PIC X(29).                                    IX2184.2
   000124         012700     05 FILLER PIC X(83).                                         IX2184.2
   000125         012800                                                                  IX2184.2
   000126         012900 FD  IX-FS2                                                       IX2184.2

 ==000126==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000126==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000127         013000     LABEL RECORD IS STANDARD                                     IX2184.2
   000128         013100     DATA RECORD IS IX-FS2R1-F-G-240                              IX2184.2 *
   000129         013200     BLOCK CONTAINS 1 RECORDS                                     IX2184.2
   000130         013300     RECORD CONTAINS 240 CHARACTERS.                              IX2184.2
   000131         013400 01  IX-FS2R1-F-G-240.                                            IX2184.2
   000132         013500     03 IX-FS2-WRK-120 PIC X(120).                                IX2184.2
   000133         013600     03 IX-FS2-GRP-120.                                           IX2184.2
   000134         013700     05 FILLER   PIC   X(8).                                      IX2184.2
   000135         013800     05 IX-FS2-KEY  PIC X(29).                                    IX2184.2
   000136         013900     05 FILLER PIC X(83).                                         IX2184.2
   000137         014000                                                                  IX2184.2
   000138         014100 WORKING-STORAGE SECTION.                                         IX2184.2
   000139         014200 01  EOF-FLAG                PIC 9 VALUE ZERO.                    IX2184.2 IMP
   000140         014300                                                                  IX2184.2
   000141         014400 01  IX-FS1-STATUS.                                               IX2184.2
   000142         014500     05  IX-FS1-STAT1        PIC X.                               IX2184.2
   000143         014600     05  IX-FS1-STAT2        PIC X.                               IX2184.2
   000144         014700                                                                  IX2184.2
   000145         014800 01  IX-FS2-STATUS.                                               IX2184.2
   000146         014900     05  IX-FS2-STAT1        PIC X.                               IX2184.2
   000147         015000     05  IX-FS2-STAT2        PIC X.                               IX2184.2
   000148         015100                                                                  IX2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000149         015200 01  TEST-RESULTS.                                                IX2184.2
   000150         015300     02 FILLER                   PIC X      VALUE SPACE.          IX2184.2 IMP
   000151         015400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2184.2 IMP
   000152         015500     02 FILLER                   PIC X      VALUE SPACE.          IX2184.2 IMP
   000153         015600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2184.2 IMP
   000154         015700     02 FILLER                   PIC X      VALUE SPACE.          IX2184.2 IMP
   000155         015800     02  PAR-NAME.                                                IX2184.2
   000156         015900       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2184.2 IMP
   000157         016000       03  PARDOT-X              PIC X      VALUE SPACE.          IX2184.2 IMP
   000158         016100       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2184.2 IMP
   000159         016200     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2184.2 IMP
   000160         016300     02 RE-MARK                  PIC X(61).                       IX2184.2
   000161         016400 01  TEST-COMPUTED.                                               IX2184.2
   000162         016500     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2184.2 IMP
   000163         016600     02 FILLER                   PIC X(17)  VALUE                 IX2184.2
   000164         016700            "       COMPUTED=".                                   IX2184.2
   000165         016800     02 COMPUTED-X.                                               IX2184.2
   000166         016900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2184.2 IMP
   000167         017000     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2184.2 166
   000168         017100                                 PIC -9(9).9(9).                  IX2184.2
   000169         017200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2184.2 166
   000170         017300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2184.2 166
   000171         017400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2184.2 166
   000172         017500     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2184.2 166
   000173         017600         04 COMPUTED-18V0                    PIC -9(18).          IX2184.2
   000174         017700         04 FILLER                           PIC X.               IX2184.2
   000175         017800     03 FILLER PIC X(50) VALUE SPACE.                             IX2184.2 IMP
   000176         017900 01  TEST-CORRECT.                                                IX2184.2
   000177         018000     02 FILLER PIC X(30) VALUE SPACE.                             IX2184.2 IMP
   000178         018100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2184.2
   000179         018200     02 CORRECT-X.                                                IX2184.2
   000180         018300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2184.2 IMP
   000181         018400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2184.2 180
   000182         018500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2184.2 180
   000183         018600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2184.2 180
   000184         018700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2184.2 180
   000185         018800     03      CR-18V0 REDEFINES CORRECT-A.                         IX2184.2 180
   000186         018900         04 CORRECT-18V0                     PIC -9(18).          IX2184.2
   000187         019000         04 FILLER                           PIC X.               IX2184.2
   000188         019100     03 FILLER PIC X(2) VALUE SPACE.                              IX2184.2 IMP
   000189         019200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2184.2 IMP
   000190         019300 01  CCVS-C-1.                                                    IX2184.2
   000191         019400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2184.2
   000192         019500-    "SS  PARAGRAPH-NAME                                          IX2184.2
   000193         019600-    "       REMARKS".                                            IX2184.2
   000194         019700     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2184.2 IMP
   000195         019800 01  CCVS-C-2.                                                    IX2184.2
   000196         019900     02 FILLER                     PIC X        VALUE SPACE.      IX2184.2 IMP
   000197         020000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2184.2
   000198         020100     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2184.2 IMP
   000199         020200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2184.2
   000200         020300     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2184.2 IMP
   000201         020400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2184.2 IMP
   000202         020500 01  REC-CT                        PIC 99       VALUE ZERO.       IX2184.2 IMP
   000203         020600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2184.2 IMP
   000204         020700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2184.2 IMP
   000205         020800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2184.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000206         020900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2184.2 IMP
   000207         021000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2184.2 IMP
   000208         021100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2184.2 IMP
   000209         021200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2184.2 IMP
   000210         021300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2184.2 IMP
   000211         021400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2184.2 IMP
   000212         021500 01  CCVS-H-1.                                                    IX2184.2
   000213         021600     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2184.2 IMP
   000214         021700     02  FILLER                    PIC X(42)    VALUE             IX2184.2
   000215         021800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2184.2
   000216         021900     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2184.2 IMP
   000217         022000 01  CCVS-H-2A.                                                   IX2184.2
   000218         022100   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2184.2 IMP
   000219         022200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2184.2
   000220         022300   02  FILLER                        PIC XXXX   VALUE             IX2184.2
   000221         022400     "4.2 ".                                                      IX2184.2
   000222         022500   02  FILLER                        PIC X(28)  VALUE             IX2184.2
   000223         022600            " COPY - NOT FOR DISTRIBUTION".                       IX2184.2
   000224         022700   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2184.2 IMP
   000225         022800                                                                  IX2184.2
   000226         022900 01  CCVS-H-2B.                                                   IX2184.2
   000227         023000   02  FILLER                        PIC X(15)  VALUE             IX2184.2
   000228         023100            "TEST RESULT OF ".                                    IX2184.2
   000229         023200   02  TEST-ID                       PIC X(9).                    IX2184.2
   000230         023300   02  FILLER                        PIC X(4)   VALUE             IX2184.2
   000231         023400            " IN ".                                               IX2184.2
   000232         023500   02  FILLER                        PIC X(12)  VALUE             IX2184.2
   000233         023600     " HIGH       ".                                              IX2184.2
   000234         023700   02  FILLER                        PIC X(22)  VALUE             IX2184.2
   000235         023800            " LEVEL VALIDATION FOR ".                             IX2184.2
   000236         023900   02  FILLER                        PIC X(58)  VALUE             IX2184.2
   000237         024000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2184.2
   000238         024100 01  CCVS-H-3.                                                    IX2184.2
   000239         024200     02  FILLER                      PIC X(34)  VALUE             IX2184.2
   000240         024300            " FOR OFFICIAL USE ONLY    ".                         IX2184.2
   000241         024400     02  FILLER                      PIC X(58)  VALUE             IX2184.2
   000242         024500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2184.2
   000243         024600     02  FILLER                      PIC X(28)  VALUE             IX2184.2
   000244         024700            "  COPYRIGHT   1985 ".                                IX2184.2
   000245         024800 01  CCVS-E-1.                                                    IX2184.2
   000246         024900     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2184.2 IMP
   000247         025000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2184.2
   000248         025100     02 ID-AGAIN                     PIC X(9).                    IX2184.2
   000249         025200     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2184.2 IMP
   000250         025300 01  CCVS-E-2.                                                    IX2184.2
   000251         025400     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2184.2 IMP
   000252         025500     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2184.2 IMP
   000253         025600     02 CCVS-E-2-2.                                               IX2184.2
   000254         025700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2184.2 IMP
   000255         025800         03 FILLER                   PIC X      VALUE SPACE.      IX2184.2 IMP
   000256         025900         03 ENDER-DESC               PIC X(44)  VALUE             IX2184.2
   000257         026000            "ERRORS ENCOUNTERED".                                 IX2184.2
   000258         026100 01  CCVS-E-3.                                                    IX2184.2
   000259         026200     02  FILLER                      PIC X(22)  VALUE             IX2184.2
   000260         026300            " FOR OFFICIAL USE ONLY".                             IX2184.2
   000261         026400     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2184.2 IMP
   000262         026500     02  FILLER                      PIC X(58)  VALUE             IX2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000263         026600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2184.2
   000264         026700     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2184.2 IMP
   000265         026800     02 FILLER                       PIC X(15)  VALUE             IX2184.2
   000266         026900             " COPYRIGHT 1985".                                   IX2184.2
   000267         027000 01  CCVS-E-4.                                                    IX2184.2
   000268         027100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2184.2 IMP
   000269         027200     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2184.2
   000270         027300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2184.2 IMP
   000271         027400     02 FILLER                       PIC X(40)  VALUE             IX2184.2
   000272         027500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2184.2
   000273         027600 01  XXINFO.                                                      IX2184.2
   000274         027700     02 FILLER                       PIC X(19)  VALUE             IX2184.2
   000275         027800            "*** INFORMATION ***".                                IX2184.2
   000276         027900     02 INFO-TEXT.                                                IX2184.2
   000277         028000       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2184.2 IMP
   000278         028100       04 XXCOMPUTED                 PIC X(20).                   IX2184.2
   000279         028200       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2184.2 IMP
   000280         028300       04 XXCORRECT                  PIC X(20).                   IX2184.2
   000281         028400     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2184.2
   000282         028500 01  HYPHEN-LINE.                                                 IX2184.2
   000283         028600     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2184.2 IMP
   000284         028700     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2184.2
   000285         028800-    "*****************************************".                 IX2184.2
   000286         028900     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2184.2
   000287         029000-    "******************************".                            IX2184.2
   000288         029100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2184.2
   000289         029200     "IX218A".                                                    IX2184.2
   000290         029300 PROCEDURE DIVISION.                                              IX2184.2
   000291         029400 DECLARATIVES.                                                    IX2184.2
   000292         029500                                                                  IX2184.2
   000293         029600 READ-OPTIONAL-10 SECTION.                                        IX2184.2
   000294         029700     USE AFTER EXCEPTION PROCEDURE ON IX-FS1.                     IX2184.2 114
   000295         029800 INPUT-PROCESS.                                                   IX2184.2
   000296         029900     MOVE 1 TO EOF-FLAG.                                          IX2184.2 139
   000297         030000                                                                  IX2184.2
   000298         030100 READ-OPTIONAL-23 SECTION.                                        IX2184.2
   000299         030200     USE AFTER EXCEPTION PROCEDURE ON IX-FS2.                     IX2184.2 126
   000300         030300 INPUT-PROCESS.                                                   IX2184.2
   000301         030400     MOVE 1 TO EOF-FLAG.                                          IX2184.2 139
   000302         030500                                                                  IX2184.2
   000303         030600 END DECLARATIVES.                                                IX2184.2
   000304         030700                                                                  IX2184.2
   000305         030800 CCVS1 SECTION.                                                   IX2184.2
   000306         030900 OPEN-FILES.                                                      IX2184.2
   000307         031000     OPEN I-O RAW-DATA.                                           IX2184.2 95
   000308         031100     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2184.2 288 98
   000309         031200     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2184.2 95 315
   000310         031300     MOVE "ABORTED " TO C-ABORT.                                  IX2184.2 109
   000311         031400     ADD 1 TO C-NO-OF-TESTS.                                      IX2184.2 101
   000312         031500     ACCEPT C-DATE  FROM DATE.                                    IX2184.2 99
   000313         031600     ACCEPT C-TIME  FROM TIME.                                    IX2184.2 100
   000314         031700     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2184.2 97 315
   000315         031800 END-E-1.                                                         IX2184.2
   000316         031900     CLOSE RAW-DATA.                                              IX2184.2 95
   000317         032000     OPEN    OUTPUT PRINT-FILE.                                   IX2184.2 110
   000318         032100     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2184.2 288 229 288 248
   000319         032200     MOVE    SPACE TO TEST-RESULTS.                               IX2184.2 IMP 149
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000320         032300     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2184.2 357 362
   000321         032400     GO TO CCVS1-EXIT.                                            IX2184.2 444
   000322         032500 CLOSE-FILES.                                                     IX2184.2
   000323         032600     OPEN I-O RAW-DATA.                                           IX2184.2 95
   000324         032700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2184.2 288 98
   000325         032800     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2184.2 95 333
   000326         032900     MOVE "OK.     " TO C-ABORT.                                  IX2184.2 109
   000327         033000     MOVE PASS-COUNTER TO C-OK.                                   IX2184.2 206 102
   000328         033100     MOVE ERROR-HOLD   TO C-ALL.                                  IX2184.2 208 103
   000329         033200     MOVE ERROR-COUNTER TO C-FAIL.                                IX2184.2 204 104
   000330         033300     MOVE DELETE-COUNTER TO C-DELETED.                            IX2184.2 203 105
   000331         033400     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2184.2 205 106
   000332         033500     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2184.2 97 333
   000333         033600 END-E-2.                                                         IX2184.2
   000334         033700     CLOSE RAW-DATA IX-FS1 IX-FS2.                                IX2184.2 95 114 126
   000335         033800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2184.2 366 387 110
   000336         033900 TERMINATE-CCVS.                                                  IX2184.2
   000337         034000     EXIT PROGRAM.                                                IX2184.2
   000338         034100 TERMINATE-CALL.                                                  IX2184.2
   000339         034200     STOP     RUN.                                                IX2184.2
   000340         034300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2184.2 153 205
   000341         034400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2184.2 153 206
   000342         034500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2184.2 153 204
   000343         034600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2184.2 153 203
   000344         034700     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2184.2 160
   000345         034800 PRINT-DETAIL.                                                    IX2184.2
   000346         034900     IF REC-CT NOT EQUAL TO ZERO                                  IX2184.2 202 IMP
   000347      1  035000             MOVE "." TO PARDOT-X                                 IX2184.2 157
   000348      1  035100             MOVE REC-CT TO DOTVALUE.                             IX2184.2 202 158
   000349         035200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2184.2 149 111 399
   000350         035300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2184.2 153 399
   000351      1  035400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2184.2 420 434
   000352      1  035500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2184.2 435 443
   000353         035600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2184.2 IMP 153 IMP 165
   000354         035700     MOVE SPACE TO CORRECT-X.                                     IX2184.2 IMP 179
   000355         035800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2184.2 202 IMP IMP 155
   000356         035900     MOVE     SPACE TO RE-MARK.                                   IX2184.2 IMP 160
   000357         036000 HEAD-ROUTINE.                                                    IX2184.2
   000358         036100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2184.2 212 112 399
   000359         036200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2184.2 217 112 399
   000360         036300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2184.2 226 112 399
   000361         036400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2184.2 238 112 399
   000362         036500 COLUMN-NAMES-ROUTINE.                                            IX2184.2
   000363         036600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2184.2 190 112 399
   000364         036700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2184.2 195 112 399
   000365         036800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2184.2 282 112 399
   000366         036900 END-ROUTINE.                                                     IX2184.2
   000367         037000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2184.2 282 112 399
   000368         037100 END-RTN-EXIT.                                                    IX2184.2
   000369         037200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2184.2 245 112 399
   000370         037300 END-ROUTINE-1.                                                   IX2184.2
   000371         037400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2184.2 204 208 205
   000372         037500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2184.2 208 203 208
   000373         037600      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2184.2 206 208
   000374         037700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2184.2
   000375         037800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2184.2 206 268
   000376         037900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2184.2 208 270
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000377         038000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2184.2 267 253
   000378         038100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2184.2 250 112 399
   000379         038200  END-ROUTINE-12.                                                 IX2184.2
   000380         038300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2184.2 256
   000381         038400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2184.2 204 IMP
   000382      1  038500         MOVE "NO " TO ERROR-TOTAL                                IX2184.2 254
   000383         038600         ELSE                                                     IX2184.2
   000384      1  038700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2184.2 204 254
   000385         038800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2184.2 250 112
   000386         038900     PERFORM WRITE-LINE.                                          IX2184.2 399
   000387         039000 END-ROUTINE-13.                                                  IX2184.2
   000388         039100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2184.2 203 IMP
   000389      1  039200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2184.2 254
   000390      1  039300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2184.2 203 254
   000391         039400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2184.2 256
   000392         039500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2184.2 250 112 399
   000393         039600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2184.2 205 IMP
   000394      1  039700          MOVE "NO " TO ERROR-TOTAL                               IX2184.2 254
   000395      1  039800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2184.2 205 254
   000396         039900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2184.2 256
   000397         040000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2184.2 250 112 399
   000398         040100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2184.2 258 112 399
   000399         040200 WRITE-LINE.                                                      IX2184.2
   000400         040300     ADD 1 TO RECORD-COUNT.                                       IX2184.2 210
   000401         040400     IF RECORD-COUNT GREATER 42                                   IX2184.2 210
   000402      1  040500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2184.2 112 209
   000403      1  040600         MOVE SPACE TO DUMMY-RECORD                               IX2184.2 IMP 112
   000404      1  040700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2184.2 112
   000405      1  040800         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2184.2 212 112 415
   000406      1  040900         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2184.2 217 112 415
   000407      1  041000         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2184.2 226 112 415
   000408      1  041100         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2184.2 238 112 415
   000409      1  041200         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2184.2 190 112 415
   000410      1  041300         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2184.2 195 112 415
   000411      1  041400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2184.2 282 112 415
   000412      1  041500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2184.2 209 112
   000413      1  041600         MOVE ZERO TO RECORD-COUNT.                               IX2184.2 IMP 210
   000414         041700     PERFORM WRT-LN.                                              IX2184.2 415
   000415         041800 WRT-LN.                                                          IX2184.2
   000416         041900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2184.2 112
   000417         042000     MOVE SPACE TO DUMMY-RECORD.                                  IX2184.2 IMP 112
   000418         042100 BLANK-LINE-PRINT.                                                IX2184.2
   000419         042200     PERFORM WRT-LN.                                              IX2184.2 415
   000420         042300 FAIL-ROUTINE.                                                    IX2184.2
   000421         042400     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2184.2 165 IMP
   000422      1  042500            GO TO   FAIL-ROUTINE-WRITE.                           IX2184.2 429
   000423         042600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2184.2 179 IMP 429
   000424         042700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2184.2 211 281
   000425         042800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2184.2 276
   000426         042900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2184.2 273 112 399
   000427         043000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2184.2 IMP 281
   000428         043100     GO TO  FAIL-ROUTINE-EX.                                      IX2184.2 434
   000429         043200 FAIL-ROUTINE-WRITE.                                              IX2184.2
   000430         043300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2184.2 161 111 399
   000431         043400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2184.2 211 189
   000432         043500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2184.2 176 111 399
   000433         043600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2184.2 IMP 189
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000434         043700 FAIL-ROUTINE-EX. EXIT.                                           IX2184.2
   000435         043800 BAIL-OUT.                                                        IX2184.2
   000436         043900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2184.2 166 IMP 438
   000437         044000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2184.2 180 IMP 443
   000438         044100 BAIL-OUT-WRITE.                                                  IX2184.2
   000439         044200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2184.2 180 280 166 278
   000440         044300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2184.2 211 281
   000441         044400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2184.2 273 112 399
   000442         044500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2184.2 IMP 281
   000443         044600 BAIL-OUT-EX. EXIT.                                               IX2184.2
   000444         044700 CCVS1-EXIT.                                                      IX2184.2
   000445         044800     EXIT.                                                        IX2184.2
   000446         044900                                                                  IX2184.2
   000447         045100*   TEST  1                                                      *IX2184.2
   000448         045200*         READ   (ACCESS IS SEQUENTIAL) OPTIONAL NOT EXISTING FILEIX2184.2
   000449         045300*                                       10  EXPECTED             *IX2184.2
   000450         045400*         IX-4, 1.3.4 (2) A 2);                                  *IX2184.2
   000451         045500*         IX-29, 4.5.4 GR (4) B;                                 *IX2184.2
   000452         045600*         IX-30, 4.5.4 GR (10) A;                                *IX2184.2
   000453         045700*         IX-30, 4.5.4 GR (10) B;                                *IX2184.2
   000454         045900 SECT-IX-01-001 SECTION.                                          IX2184.2
   000455         046000 REA-INIT-F1-01.                                                  IX2184.2
   000456         046100     MOVE ZERO TO EOF-FLAG.                                       IX2184.2 IMP 139
   000457         046200     MOVE SPACES TO IX-FS1-STATUS.                                IX2184.2 IMP 141
   000458         046300     MOVE "READ OPTION. 10 EXP." TO FEATURE.                      IX2184.2 151
   000459         046400     MOVE "REA-TEST-F1-01      " TO PAR-NAME.                     IX2184.2 155
   000460         046500     OPEN INPUT IX-FS1.                                           IX2184.2 114
   000461         046600 REA-TEST-F1-01.                                                  IX2184.2
   000462         046700     READ IX-FS1 AT END   GO TO REA-TEST-F1-01-1.                 IX2184.2 114 463
   000463         046800 REA-TEST-F1-01-1.                                                IX2184.2
   000464         046900     IF IX-FS1-STATUS EQUAL TO "10"                               IX2184.2 141
   000465      1  047000         GO TO REA-PASS-F1-01.                                    IX2184.2 473
   000466         047100 REA-FAIL-F1-01.                                                  IX2184.2
   000467         047200     MOVE "IX-4, 1.3.4, (2) A 2); IX-29 GR (4) B  IX-30 GR (10) A,IX2184.2
   000468         047300-         " B"                   TO RE-MARK.                      IX2184.2 160
   000469         047400     PERFORM FAIL.                                                IX2184.2 342
   000470         047500     MOVE IX-FS1-STATUS TO COMPUTED-A.                            IX2184.2 141 166
   000471         047600     MOVE "10" TO CORRECT-X.                                      IX2184.2 179
   000472         047700     GO TO REA-WRITE-F1-01.                                       IX2184.2 475
   000473         047800 REA-PASS-F1-01.                                                  IX2184.2
   000474         047900     PERFORM PASS.                                                IX2184.2 341
   000475         048000 REA-WRITE-F1-01.                                                 IX2184.2
   000476         048100     PERFORM PRINT-DETAIL.                                        IX2184.2 345
   000477         048200                                                                  IX2184.2
   000478         048400*   TEST  2                                                      *IX2184.2
   000479         048500*         READ I-O  (ACCESS IS DYNAMIC) OPTIONAL NOT EXISTING FILEIX2184.2
   000480         048600*                                                                *IX2184.2
   000481         048700*         IX-30, GR (10) B                                       *IX2184.2
   000482         048900 REA-INIT-GF-02.                                                  IX2184.2
   000483         049000     MOVE "REA-TEST-GF-02  " TO PAR-NAME.                         IX2184.2 155
   000484         049100     MOVE "NO USE MUST BE EXEC." TO FEATURE.                      IX2184.2 151
   000485         049200 REA-TEST-GF-02.                                                  IX2184.2
   000486         049300     IF EOF-FLAG EQUAL TO    0                                    IX2184.2 139
   000487      1  049400         GO TO REA-PASS-GF-02.                                    IX2184.2 495
   000488         049500 REA-FAIL-GF-02.                                                  IX2184.2
   000489         049600     MOVE "IX-30, GR (10) B; 1: USE PROCEDURE HAS BEEN  EXECUTED" IX2184.2
   000490         049700              TO RE-MARK.                                         IX2184.2 160
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000491         049800     PERFORM FAIL.                                                IX2184.2 342
   000492         049900     MOVE EOF-FLAG      TO COMPUTED-N.                            IX2184.2 139 167
   000493         050000     MOVE " 0" TO CORRECT-X.                                      IX2184.2 179
   000494         050100     GO TO REA-WRITE-GF-02.                                       IX2184.2 497
   000495         050200 REA-PASS-GF-02.                                                  IX2184.2
   000496         050300     PERFORM PASS.                                                IX2184.2 341
   000497         050400 REA-WRITE-GF-02.                                                 IX2184.2
   000498         050500     PERFORM PRINT-DETAIL.                                        IX2184.2 345
   000499         050600                                                                  IX2184.2
   000500         050800*   TEST  3                                                      *IX2184.2
   000501         050900*         START   (FOR AN OPTIONAL FILE WHICH IS NOT PRESENT)    *IX2184.2
   000502         051000*         IX-4, 1.3.4 (3) C 2)          23  EXPECTED             *IX2184.2
   000503         051200 STA-INIT-GF-01.                                                  IX2184.2
   000504         051300     MOVE ZERO TO EOF-FLAG.                                       IX2184.2 IMP 139
   000505         051400     MOVE SPACES TO IX-FS2-STATUS.                                IX2184.2 IMP 145
   000506         051500     MOVE "STA-TEST-GF-01  " TO PAR-NAME.                         IX2184.2 155
   000507         051600     MOVE "START OPT.   23 EXP." TO FEATURE.                      IX2184.2 151
   000508         051700     OPEN INPUT IX-FS2.                                           IX2184.2 126
   000509         051800 STA-TEST-GF-01.                                                  IX2184.2
   000510         051900     START IX-FS2        INVALID  KEY GO TO STA-TEST-GF-01-1.     IX2184.2 126 511
   000511         052000 STA-TEST-GF-01-1.                                                IX2184.2
   000512         052100     IF IX-FS2-STATUS EQUAL TO "23"                               IX2184.2 145
   000513      1  052200         GO TO STA-PASS-GF-01.                                    IX2184.2 520
   000514         052300 STA-FAIL-GF-01.                                                  IX2184.2
   000515         052400     MOVE "IX-4, 1.3.4,(3) C 2)" TO RE-MARK.                      IX2184.2 160
   000516         052500     PERFORM FAIL.                                                IX2184.2 342
   000517         052600     MOVE IX-FS2-STATUS TO COMPUTED-A.                            IX2184.2 145 166
   000518         052700     MOVE "23" TO CORRECT-X.                                      IX2184.2 179
   000519         052800     GO TO STA-WRITE-GF-01.                                       IX2184.2 522
   000520         052900 STA-PASS-GF-01.                                                  IX2184.2
   000521         053000     PERFORM PASS.                                                IX2184.2 341
   000522         053100 STA-WRITE-GF-01.                                                 IX2184.2
   000523         053200     PERFORM PRINT-DETAIL.                                        IX2184.2 345
   000524         053300                                                                  IX2184.2
   000525         053500*   TEST  4                                                      *IX2184.2
   000526         053600*         START   (NO USE PROCEDURE MUST BE EXECUTED BECAUSE     *IX2184.2
   000527         053700*                  THE INVALID KEY PHRASE IS SPECIFIED)          *IX2184.2
   000528         053800*         IX-37, 4.7.4, (5), (6) AND (7)                         *IX2184.2
   000529         054000 STA-INIT-GF-02.                                                  IX2184.2
   000530         054100     MOVE "STA-TEST-GF-02  " TO PAR-NAME.                         IX2184.2 155
   000531         054200     MOVE "START NO USE    EXP." TO FEATURE.                      IX2184.2 151
   000532         054300 STA-TEST-GF-02.                                                  IX2184.2
   000533         054400     IF EOF-FLAG  EQUAL TO ZERO                                   IX2184.2 139 IMP
   000534      1  054500         GO TO STA-PASS-GF-02.                                    IX2184.2 542
   000535         054600 STA-FAIL-GF-02.                                                  IX2184.2
   000536         054700     MOVE "IX-37 4.7.4,(5,6,7); 1:USE PROCEDURE HAS BEEN EXECUTED"IX2184.2
   000537         054800                                 TO RE-MARK.                      IX2184.2 160
   000538         054900     PERFORM FAIL.                                                IX2184.2 342
   000539         055000     MOVE EOF-FLAG      TO COMPUTED-N.                            IX2184.2 139 167
   000540         055100     MOVE  "0" TO CORRECT-X.                                      IX2184.2 179
   000541         055200     GO TO STA-WRITE-GF-02.                                       IX2184.2 544
   000542         055300 STA-PASS-GF-02.                                                  IX2184.2
   000543         055400     PERFORM PASS.                                                IX2184.2 341
   000544         055500 STA-WRITE-GF-02.                                                 IX2184.2
   000545         055600     PERFORM PRINT-DETAIL.                                        IX2184.2 345
   000546         055700                                                                  IX2184.2
   000547         055900*   TEST  5                                                      *IX2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000548         056000*      READ (RANDOM) (FOR AN OPTIONAL FILE WHICH IS NOT PRESENT) *IX2184.2
   000549         056100*         IX-4, 1.3.4 (3) C 2)                                   *IX2184.2
   000550         056300 REA-INIT-GF-03.                                                  IX2184.2
   000551         056400     MOVE ZERO TO EOF-FLAG.                                       IX2184.2 IMP 139
   000552         056500     MOVE SPACES TO IX-FS2-STATUS.                                IX2184.2 IMP 145
   000553         056600     MOVE "REA-TEST-GF-03  " TO PAR-NAME.                         IX2184.2 155
   000554         056700     MOVE "RANDOM READ  23 EXP." TO FEATURE.                      IX2184.2 151
   000555         056800 REA-TEST-GF-03.                                                  IX2184.2
   000556         056900     READ  IX-FS2        INVALID  KEY GO TO REA-TEST-GF-03-1.     IX2184.2 126 557
   000557         057000 REA-TEST-GF-03-1.                                                IX2184.2
   000558         057100     IF IX-FS2-STATUS EQUAL TO "23"                               IX2184.2 145
   000559      1  057200         GO TO REA-PASS-GF-03.                                    IX2184.2 567
   000560         057300 REA-FAIL-GF-03.                                                  IX2184.2
   000561         057400     MOVE "IX-4, 1.3.4,(3) C 2); IX-36 4.7.4,GR (1), (5), (6) AND IX2184.2
   000562         057500-         " (7)"                 TO RE-MARK.                      IX2184.2 160
   000563         057600     PERFORM FAIL.                                                IX2184.2 342
   000564         057700     MOVE IX-FS2-STATUS TO COMPUTED-A.                            IX2184.2 145 166
   000565         057800     MOVE "23" TO CORRECT-X.                                      IX2184.2 179
   000566         057900     GO TO REA-WRITE-GF-03.                                       IX2184.2 569
   000567         058000 REA-PASS-GF-03.                                                  IX2184.2
   000568         058100     PERFORM PASS.                                                IX2184.2 341
   000569         058200 REA-WRITE-GF-03.                                                 IX2184.2
   000570         058300     PERFORM PRINT-DETAIL.                                        IX2184.2 345
   000571         058400                                                                  IX2184.2
   000572         058600*   TEST  6                                                      *IX2184.2
   000573         058700*         READ (RANDOM) NO USE PROCEDURE MUST BE EXECUTED BECAUSE*IX2184.2
   000574         058800*                  THE INVALID KEY PHRASE IS SPECIFIED)          *IX2184.2
   000575         058900*         IX-29, 4.5.4, GR (4) B, (17)                           *IX2184.2
   000576         059100 REA-INIT-GF-04.                                                  IX2184.2
   000577         059200     MOVE "REA-TEST-GF-04  " TO PAR-NAME.                         IX2184.2 155
   000578         059300     MOVE "RANDOM READ (NO USE)" TO FEATURE.                      IX2184.2 151
   000579         059400 REA-TEST-GF-04.                                                  IX2184.2
   000580         059500     IF EOF-FLAG  EQUAL TO ZERO                                   IX2184.2 139 IMP
   000581      1  059600         GO TO REA-PASS-GF-04.                                    IX2184.2 589
   000582         059700 REA-FAIL-GF-04.                                                  IX2184.2
   000583         059800     MOVE "IX-29 4.5.4, GR (4) B, (17); 1: USE PROCEDURE HAS BEEN IX2184.2
   000584         059900-    "EXECUTED"             TO RE-MARK.                           IX2184.2 160
   000585         060000     PERFORM FAIL.                                                IX2184.2 342
   000586         060100     MOVE EOF-FLAG      TO COMPUTED-N.                            IX2184.2 139 167
   000587         060200     MOVE  "0" TO CORRECT-X.                                      IX2184.2 179
   000588         060300     GO TO REA-WRITE-GF-04.                                       IX2184.2 591
   000589         060400 REA-PASS-GF-04.                                                  IX2184.2
   000590         060500     PERFORM PASS.                                                IX2184.2 341
   000591         060600 REA-WRITE-GF-04.                                                 IX2184.2
   000592         060700     PERFORM PRINT-DETAIL.                                        IX2184.2 345
   000593         060800                                                                  IX2184.2
   000594         060900                                                                  IX2184.2
   000595         061000                                                                  IX2184.2
   000596         061100 CCVS-EXIT SECTION.                                               IX2184.2
   000597         061200 CCVS-999999.                                                     IX2184.2
   000598         061300     GO TO CLOSE-FILES.                                           IX2184.2 322
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      211   ANSI-REFERENCE . . . . . . . .  424 431 440
      109   C-ABORT. . . . . . . . . . . .  M310 M326
      103   C-ALL. . . . . . . . . . . . .  M328
       99   C-DATE . . . . . . . . . . . .  M312
      105   C-DELETED. . . . . . . . . . .  M330
      104   C-FAIL . . . . . . . . . . . .  M329
      108   C-INDENT
      106   C-INSPECT. . . . . . . . . . .  M331
      101   C-NO-OF-TESTS. . . . . . . . .  M311
      107   C-NOTE
      102   C-OK . . . . . . . . . . . . .  M327
      100   C-TIME . . . . . . . . . . . .  M313
      190   CCVS-C-1 . . . . . . . . . . .  363 409
      195   CCVS-C-2 . . . . . . . . . . .  364 410
      245   CCVS-E-1 . . . . . . . . . . .  369
      250   CCVS-E-2 . . . . . . . . . . .  378 385 392 397
      253   CCVS-E-2-2 . . . . . . . . . .  M377
      258   CCVS-E-3 . . . . . . . . . . .  398
      267   CCVS-E-4 . . . . . . . . . . .  377
      268   CCVS-E-4-1 . . . . . . . . . .  M375
      270   CCVS-E-4-2 . . . . . . . . . .  M376
      212   CCVS-H-1 . . . . . . . . . . .  358 405
      217   CCVS-H-2A. . . . . . . . . . .  359 406
      226   CCVS-H-2B. . . . . . . . . . .  360 407
      238   CCVS-H-3 . . . . . . . . . . .  361 408
      288   CCVS-PGM-ID. . . . . . . . . .  308 318 318 324
      172   CM-18V0
      166   COMPUTED-A . . . . . . . . . .  167 169 170 171 172 436 439 M470 M517 M564
      167   COMPUTED-N . . . . . . . . . .  M492 M539 M586
      165   COMPUTED-X . . . . . . . . . .  M353 421
      169   COMPUTED-0V18
      171   COMPUTED-14V4
      173   COMPUTED-18V0
      170   COMPUTED-4V14
      189   COR-ANSI-REFERENCE . . . . . .  M431 M433
      180   CORRECT-A. . . . . . . . . . .  181 182 183 184 185 437 439
      181   CORRECT-N
      179   CORRECT-X. . . . . . . . . . .  M354 423 M471 M493 M518 M540 M565 M587
      182   CORRECT-0V18
      184   CORRECT-14V4
      186   CORRECT-18V0
      183   CORRECT-4V14
      185   CR-18V0
      203   DELETE-COUNTER . . . . . . . .  330 M343 372 388 390
      158   DOTVALUE . . . . . . . . . . .  M348
      209   DUMMY-HOLD . . . . . . . . . .  M402 412
      112   DUMMY-RECORD . . . . . . . . .  M358 M359 M360 M361 M363 M364 M365 M367 M369 M378 M385 M392 M397 M398 402 M403
                                            404 M405 M406 M407 M408 M409 M410 M411 M412 416 M417 M426 M441
      256   ENDER-DESC . . . . . . . . . .  M380 M391 M396
      139   EOF-FLAG . . . . . . . . . . .  M296 M301 M456 486 492 M504 533 539 M551 580 586
      204   ERROR-COUNTER. . . . . . . . .  329 M342 371 381 384
      208   ERROR-HOLD . . . . . . . . . .  328 M371 M372 M372 M373 376
      254   ERROR-TOTAL. . . . . . . . . .  M382 M384 M389 M390 M394 M395
      151   FEATURE. . . . . . . . . . . .  M458 M484 M507 M531 M554 M578
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page    15
0 Defined   Cross-reference of data names   References

0     282   HYPHEN-LINE. . . . . . . . . .  365 367 411
      248   ID-AGAIN . . . . . . . . . . .  M318
      281   INF-ANSI-REFERENCE . . . . . .  M424 M427 M440 M442
      276   INFO-TEXT. . . . . . . . . . .  M425
      205   INSPECT-COUNTER. . . . . . . .  331 M340 371 393 395
      114   IX-FS1 . . . . . . . . . . . .  74 294 334 460 462
      121   IX-FS1-GRP-120
      123   IX-FS1-KEY . . . . . . . . . .  79
      141   IX-FS1-STATUS. . . . . . . . .  81 M457 464 470
      142   IX-FS1-STAT1
      143   IX-FS1-STAT2
      120   IX-FS1-WRK-120
      119   IX-FS1R1-F-G-240
      126   IX-FS2 . . . . . . . . . . . .  83 299 334 508 510 556
      133   IX-FS2-GRP-120
      135   IX-FS2-KEY . . . . . . . . . .  88
      145   IX-FS2-STATUS. . . . . . . . .  90 M505 512 517 M552 558 564
      146   IX-FS2-STAT1
      147   IX-FS2-STAT2
      132   IX-FS2-WRK-120
      131   IX-FS2R1-F-G-240
      153   P-OR-F . . . . . . . . . . . .  M340 M341 M342 M343 350 M353
      155   PAR-NAME . . . . . . . . . . .  M355 M459 M483 M506 M530 M553 M577
      157   PARDOT-X . . . . . . . . . . .  M347
      206   PASS-COUNTER . . . . . . . . .  327 M341 373 375
      110   PRINT-FILE . . . . . . . . . .  71 317 335
      111   PRINT-REC. . . . . . . . . . .  M349 M430 M432
       95   RAW-DATA . . . . . . . . . . .  66 307 309 316 323 325 334
       98   RAW-DATA-KEY . . . . . . . . .  70 M308 M324
       97   RAW-DATA-SATZ. . . . . . . . .  314 332
      160   RE-MARK. . . . . . . . . . . .  M344 M356 M468 M490 M515 M537 M562 M584
      202   REC-CT . . . . . . . . . . . .  346 348 355
      201   REC-SKL-SUB
      210   RECORD-COUNT . . . . . . . . .  M400 401 M413
      161   TEST-COMPUTED. . . . . . . . .  430
      176   TEST-CORRECT . . . . . . . . .  432
      229   TEST-ID. . . . . . . . . . . .  M318
      149   TEST-RESULTS . . . . . . . . .  M319 349
      207   TOTAL-ERROR
      278   XXCOMPUTED . . . . . . . . . .  M439
      280   XXCORRECT. . . . . . . . . . .  M439
      273   XXINFO . . . . . . . . . . . .  426 441
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page    16
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

      435   BAIL-OUT . . . . . . . . . . .  P352
      443   BAIL-OUT-EX. . . . . . . . . .  E352 G437
      438   BAIL-OUT-WRITE . . . . . . . .  G436
      418   BLANK-LINE-PRINT
      596   CCVS-EXIT
      597   CCVS-999999
      305   CCVS1
      444   CCVS1-EXIT . . . . . . . . . .  G321
      322   CLOSE-FILES. . . . . . . . . .  G598
      362   COLUMN-NAMES-ROUTINE . . . . .  E320
      343   DE-LETE
      315   END-E-1. . . . . . . . . . . .  G309 G314
      333   END-E-2. . . . . . . . . . . .  G325 G332
      366   END-ROUTINE. . . . . . . . . .  P335
      370   END-ROUTINE-1
      379   END-ROUTINE-12
      387   END-ROUTINE-13 . . . . . . . .  E335
      368   END-RTN-EXIT
      342   FAIL . . . . . . . . . . . . .  P469 P491 P516 P538 P563 P585
      420   FAIL-ROUTINE . . . . . . . . .  P351
      434   FAIL-ROUTINE-EX. . . . . . . .  E351 G428
      429   FAIL-ROUTINE-WRITE . . . . . .  G422 G423
      357   HEAD-ROUTINE . . . . . . . . .  P320
      295   INPUT-PROCESS
      300   INPUT-PROCESS
      340   INSPT
      306   OPEN-FILES
      341   PASS . . . . . . . . . . . . .  P474 P496 P521 P543 P568 P590
      345   PRINT-DETAIL . . . . . . . . .  P476 P498 P523 P545 P570 P592
      466   REA-FAIL-F1-01
      488   REA-FAIL-GF-02
      560   REA-FAIL-GF-03
      582   REA-FAIL-GF-04
      455   REA-INIT-F1-01
      482   REA-INIT-GF-02
      550   REA-INIT-GF-03
      576   REA-INIT-GF-04
      473   REA-PASS-F1-01 . . . . . . . .  G465
      495   REA-PASS-GF-02 . . . . . . . .  G487
      567   REA-PASS-GF-03 . . . . . . . .  G559
      589   REA-PASS-GF-04 . . . . . . . .  G581
      461   REA-TEST-F1-01
      463   REA-TEST-F1-01-1 . . . . . . .  G462
      485   REA-TEST-GF-02
      555   REA-TEST-GF-03
      557   REA-TEST-GF-03-1 . . . . . . .  G556
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page    17
0 Defined   Cross-reference of procedures   References

0     579   REA-TEST-GF-04
      475   REA-WRITE-F1-01. . . . . . . .  G472
      497   REA-WRITE-GF-02. . . . . . . .  G494
      569   REA-WRITE-GF-03. . . . . . . .  G566
      591   REA-WRITE-GF-04. . . . . . . .  G588
      293   READ-OPTIONAL-10
      298   READ-OPTIONAL-23
      454   SECT-IX-01-001
      514   STA-FAIL-GF-01
      535   STA-FAIL-GF-02
      503   STA-INIT-GF-01
      529   STA-INIT-GF-02
      520   STA-PASS-GF-01 . . . . . . . .  G513
      542   STA-PASS-GF-02 . . . . . . . .  G534
      509   STA-TEST-GF-01
      511   STA-TEST-GF-01-1 . . . . . . .  G510
      532   STA-TEST-GF-02
      522   STA-WRITE-GF-01. . . . . . . .  G519
      544   STA-WRITE-GF-02. . . . . . . .  G541
      338   TERMINATE-CALL
      336   TERMINATE-CCVS
      399   WRITE-LINE . . . . . . . . . .  P349 P350 P358 P359 P360 P361 P363 P364 P365 P367 P369 P378 P386 P392 P397 P398
                                            P426 P430 P432 P441
      415   WRT-LN . . . . . . . . . . . .  P405 P406 P407 P408 P409 P410 P411 P414 P419
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page    18
0 Defined   Cross-reference of programs     References

        3   IX218A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX218A    Date 06/04/2022  Time 11:58:04   Page    19
0LineID  Message code  Message text

     77  IGYDS1298-I   Assignment-name "XXXXP044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXP044" was treated as comments.

     86  IGYDS1298-I   Assignment-name "XXXXP045" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXP045" was treated as comments.

    110  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    114  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

                       Same message on line:    126

    114  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.

                       Same message on line:    126
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       7           7
-* Statistics for COBOL program IX218A:
 *    Source records = 598
 *    Data Division statements = 91
 *    Procedure Division statements = 244
 *    Generated COBOL statements = 0
 *    Program complexity factor = 251
0End of compilation 1,  program IX218A,  highest severity 0.
0Return code 0
