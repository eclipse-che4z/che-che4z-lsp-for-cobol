1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:04   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:04   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2124.2
   000002         000200 PROGRAM-ID.                                                      IX2124.2
   000003         000300     IX212A.                                                      IX2124.2
   000004         000500*                                                              *  IX2124.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2124.2
   000006         000700*                                                              *  IX2124.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2124.2
   000008         000900*                                                              *  IX2124.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2124.2
   000010         001100*                                                              *  IX2124.2
   000011         001300*                                                              *  IX2124.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IX2124.2
   000013         001500*                                                              *  IX2124.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IX2124.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IX2124.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IX2124.2
   000017         001900*                                                              *  IX2124.2
   000018         002100*                                                              *  IX2124.2
   000019         002200*    THIS IS IX212A.                                              IX2124.2
   000020         002300*    THIS  PROGRAM  CREATES  A  100  RECORD FIXED LENGTH INDEXED  IX2124.2
   000021         002400*    FILE  WHOSE  ACCESS  IS  DYNAMIC  AND CONTAINS 10 ALTERNATE  IX2124.2
   000022         002500*    KEYS. THE INDEXED FILE IS MANIPULATED BY THE ALTERNATE KEYS  IX2124.2
   000023         002600*    USING THE FOLLOWING VERBS:                                   IX2124.2
   000024         002700*         . DELETE                                                IX2124.2
   000025         002800*         . READ ... NEXT RECORD                                  IX2124.2
   000026         002900*         . READ ... RECORD KEY                                   IX2124.2
   000027         003000*         . REWRITE                                               IX2124.2
   000028         003100*         . START                                                 IX2124.2
   000029         003200*                                                                 IX2124.2
   000030         003300 ENVIRONMENT DIVISION.                                            IX2124.2
   000031         003400 CONFIGURATION SECTION.                                           IX2124.2
   000032         003500 SOURCE-COMPUTER.                                                 IX2124.2
   000033         003600     XXXXX082.                                                    IX2124.2
   000034         003700 OBJECT-COMPUTER.                                                 IX2124.2
   000035         003800     XXXXX083.                                                    IX2124.2
   000036         003900 INPUT-OUTPUT SECTION.                                            IX2124.2
   000037         004000 FILE-CONTROL.                                                    IX2124.2
   000038         004100     SELECT RAW-DATA   ASSIGN TO                                  IX2124.2 65
   000039         004200     XXXXX062                                                     IX2124.2
   000040         004300            ORGANIZATION IS INDEXED                               IX2124.2
   000041         004400            ACCESS MODE IS RANDOM                                 IX2124.2
   000042         004500            RECORD KEY IS RAW-DATA-KEY.                           IX2124.2 68
   000043         004600     SELECT PRINT-FILE ASSIGN TO                                  IX2124.2 80
   000044         004700     XXXXX055.                                                    IX2124.2
   000045         004800     SELECT IX-FS1                                                IX2124.2 83
   000046         004900     ASSIGN TO                                                    IX2124.2
   000047         005000     XXXXX024                                                     IX2124.2
   000048         005100     XXXXX044                                                     IX2124.2

 ==000048==> IGYDS1298-I Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX044" was treated as comments.

   000049         005200     ACCESS MODE IS DYNAMIC                                       IX2124.2
   000050         005300     RECORD KEY IS IX-FS1-KEY                                     IX2124.2 88
   000051         005400     ALTERNATE RECORD KEY IS IX-FS1-ALT01                         IX2124.2 89
   000052         005500     ALTERNATE RECORD KEY IS IX-FS1-ALT02                         IX2124.2 90
   000053         005600     ALTERNATE RECORD KEY IS IX-FS1-ALT03                         IX2124.2 91
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000054         005700     ALTERNATE RECORD KEY IS IX-FS1-ALT04                         IX2124.2 92
   000055         005800     ALTERNATE RECORD KEY IS IX-FS1-ALT05                         IX2124.2 93
   000056         005900     ALTERNATE RECORD KEY IS IX-FS1-ALT06                         IX2124.2 94
   000057         006000     ALTERNATE RECORD KEY IS IX-FS1-ALT07                         IX2124.2 95
   000058         006100     ALTERNATE RECORD KEY IS IX-FS1-ALT08                         IX2124.2 96
   000059         006200     ALTERNATE RECORD KEY IS IX-FS1-ALT09                         IX2124.2 97
   000060         006300     ALTERNATE RECORD KEY IS IX-FS1-ALT10                         IX2124.2 98
   000061         006400     ORGANIZATION IS INDEXED.                                     IX2124.2
   000062         006500 DATA DIVISION.                                                   IX2124.2
   000063         006600 FILE SECTION.                                                    IX2124.2
   000064         006700                                                                  IX2124.2
   000065         006800 FD  RAW-DATA.                                                    IX2124.2
   000066         006900                                                                  IX2124.2
   000067         007000 01  RAW-DATA-SATZ.                                               IX2124.2
   000068         007100     05  RAW-DATA-KEY        PIC X(6).                            IX2124.2
   000069         007200     05  C-DATE              PIC 9(6).                            IX2124.2
   000070         007300     05  C-TIME              PIC 9(8).                            IX2124.2
   000071         007400     05  C-NO-OF-TESTS       PIC 99.                              IX2124.2
   000072         007500     05  C-OK                PIC 999.                             IX2124.2
   000073         007600     05  C-ALL               PIC 999.                             IX2124.2
   000074         007700     05  C-FAIL              PIC 999.                             IX2124.2
   000075         007800     05  C-DELETED           PIC 999.                             IX2124.2
   000076         007900     05  C-INSPECT           PIC 999.                             IX2124.2
   000077         008000     05  C-NOTE              PIC X(13).                           IX2124.2
   000078         008100     05  C-INDENT            PIC X.                               IX2124.2
   000079         008200     05  C-ABORT             PIC X(8).                            IX2124.2
   000080         008300 FD  PRINT-FILE.                                                  IX2124.2

 ==000080==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000081         008400 01  PRINT-REC PICTURE X(120).                                    IX2124.2
   000082         008500 01  DUMMY-RECORD PICTURE X(120).                                 IX2124.2
   000083         008600 FD  IX-FS1                                                       IX2124.2

 ==000083==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000084         008700     LABEL RECORDS ARE STANDARD                                   IX2124.2
   000085         008800     DATA RECORD IS IX-FS1-RECORD                                 IX2124.2 *
   000086         008900     RECORD CONTAINS 116 CHARACTERS.                              IX2124.2
   000087         009000 01  IX-FS1-RECORD.                                               IX2124.2
   000088         009100     02 IX-FS1-KEY               PIC X(6).                        IX2124.2
   000089         009200     02 IX-FS1-ALT01             PIC X(11).                       IX2124.2
   000090         009300     02 IX-FS1-ALT02             PIC X(11).                       IX2124.2
   000091         009400     02 IX-FS1-ALT03             PIC X(11).                       IX2124.2
   000092         009500     02 IX-FS1-ALT04             PIC X(11).                       IX2124.2
   000093         009600     02 IX-FS1-ALT05             PIC X(11).                       IX2124.2
   000094         009700     02 IX-FS1-ALT06             PIC X(11).                       IX2124.2
   000095         009800     02 IX-FS1-ALT07             PIC X(11).                       IX2124.2
   000096         009900     02 IX-FS1-ALT08             PIC X(11).                       IX2124.2
   000097         010000     02 IX-FS1-ALT09             PIC X(11).                       IX2124.2
   000098         010100     02 IX-FS1-ALT10             PIC X(11).                       IX2124.2
   000099         010200 WORKING-STORAGE SECTION.                                         IX2124.2
   000100         010300 01  RECORD-COUNTER              PIC 999    VALUE ZEROS.          IX2124.2 IMP
   000101         010400 01  INVKEY-COUNTER              PIC 999    VALUE ZEROS.          IX2124.2 IMP
   000102         010500 01  WORK-RECORD.                                                 IX2124.2
   000103         010600     02 FILLER                   PIC XXX    VALUE "AAA".          IX2124.2
   000104         010700     02 COUNTER00                PIC 999.                         IX2124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000105         010800     02 FILLER                   PIC XXX    VALUE "CCC".          IX2124.2
   000106         010900     02 COUNTER01                PIC 999.                         IX2124.2
   000107         011000     02 FILLER                   PIC X(5)   VALUE "ALT01".        IX2124.2
   000108         011100     02 FILLER                   PIC XXX    VALUE "EEE".          IX2124.2
   000109         011200     02 COUNTER02                PIC 999.                         IX2124.2
   000110         011300     02 FILLER                   PIC X(5)   VALUE "ALT02".        IX2124.2
   000111         011400     02 FILLER                   PIC XXX    VALUE "GGG".          IX2124.2
   000112         011500     02 COUNTER03                PIC 999.                         IX2124.2
   000113         011600     02 FILLER                   PIC X(5)   VALUE "ALT03".        IX2124.2
   000114         011700     02 FILLER                   PIC XXX    VALUE "III".          IX2124.2
   000115         011800     02 COUNTER04                PIC 999.                         IX2124.2
   000116         011900     02 FILLER                   PIC X(5)   VALUE "ALT04".        IX2124.2
   000117         012000     02 FILLER                   PIC XXX    VALUE "KKK".          IX2124.2
   000118         012100     02 COUNTER05                PIC 999.                         IX2124.2
   000119         012200     02 FILLER                   PIC X(5)   VALUE "ALT05".        IX2124.2
   000120         012300     02 FILLER                   PIC XXX    VALUE "MMM".          IX2124.2
   000121         012400     02 COUNTER06                PIC 999.                         IX2124.2
   000122         012500     02 FILLER                   PIC X(5)   VALUE "ALT06".        IX2124.2
   000123         012600     02 FILLER                   PIC XXX    VALUE "OOO".          IX2124.2
   000124         012700     02 COUNTER07                PIC 999.                         IX2124.2
   000125         012800     02 FILLER                   PIC X(5)   VALUE "ALT07".        IX2124.2
   000126         012900     02 FILLER                   PIC XXX    VALUE "QQQ".          IX2124.2
   000127         013000     02 COUNTER08                PIC 999.                         IX2124.2
   000128         013100     02 FILLER                   PIC X(5)   VALUE "ALT08".        IX2124.2
   000129         013200     02 FILLER                   PIC XXX    VALUE "SSS".          IX2124.2
   000130         013300     02 COUNTER09                PIC 999.                         IX2124.2
   000131         013400     02 FILLER                   PIC X(5)   VALUE "ALT09".        IX2124.2
   000132         013500     02 FILLER                   PIC XXX    VALUE "UUU".          IX2124.2
   000133         013600     02 COUNTER10                PIC 999.                         IX2124.2
   000134         013700     02 FILLER                   PIC X(5)   VALUE "ALT10".        IX2124.2
   000135         013800 01  TEST-RESULTS.                                                IX2124.2
   000136         013900     02 FILLER                   PIC X      VALUE SPACE.          IX2124.2 IMP
   000137         014000     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2124.2 IMP
   000138         014100     02 FILLER                   PIC X      VALUE SPACE.          IX2124.2 IMP
   000139         014200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2124.2 IMP
   000140         014300     02 FILLER                   PIC X      VALUE SPACE.          IX2124.2 IMP
   000141         014400     02  PAR-NAME.                                                IX2124.2
   000142         014500       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2124.2 IMP
   000143         014600       03  PARDOT-X              PIC X      VALUE SPACE.          IX2124.2 IMP
   000144         014700       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2124.2 IMP
   000145         014800     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2124.2 IMP
   000146         014900     02 RE-MARK                  PIC X(61).                       IX2124.2
   000147         015000 01  TEST-COMPUTED.                                               IX2124.2
   000148         015100     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2124.2 IMP
   000149         015200     02 FILLER                   PIC X(17)  VALUE                 IX2124.2
   000150         015300            "       COMPUTED=".                                   IX2124.2
   000151         015400     02 COMPUTED-X.                                               IX2124.2
   000152         015500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2124.2 IMP
   000153         015600     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2124.2 152
   000154         015700                                 PIC -9(9).9(9).                  IX2124.2
   000155         015800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2124.2 152
   000156         015900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2124.2 152
   000157         016000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2124.2 152
   000158         016100     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2124.2 152
   000159         016200         04 COMPUTED-18V0                    PIC -9(18).          IX2124.2
   000160         016300         04 FILLER                           PIC X.               IX2124.2
   000161         016400     03 FILLER PIC X(50) VALUE SPACE.                             IX2124.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000162         016500 01  TEST-CORRECT.                                                IX2124.2
   000163         016600     02 FILLER PIC X(30) VALUE SPACE.                             IX2124.2 IMP
   000164         016700     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2124.2
   000165         016800     02 CORRECT-X.                                                IX2124.2
   000166         016900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2124.2 IMP
   000167         017000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2124.2 166
   000168         017100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2124.2 166
   000169         017200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2124.2 166
   000170         017300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2124.2 166
   000171         017400     03      CR-18V0 REDEFINES CORRECT-A.                         IX2124.2 166
   000172         017500         04 CORRECT-18V0                     PIC -9(18).          IX2124.2
   000173         017600         04 FILLER                           PIC X.               IX2124.2
   000174         017700     03 FILLER PIC X(2) VALUE SPACE.                              IX2124.2 IMP
   000175         017800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2124.2 IMP
   000176         017900 01  CCVS-C-1.                                                    IX2124.2
   000177         018000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2124.2
   000178         018100-    "SS  PARAGRAPH-NAME                                          IX2124.2
   000179         018200-    "       REMARKS".                                            IX2124.2
   000180         018300     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2124.2 IMP
   000181         018400 01  CCVS-C-2.                                                    IX2124.2
   000182         018500     02 FILLER                     PIC X        VALUE SPACE.      IX2124.2 IMP
   000183         018600     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2124.2
   000184         018700     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2124.2 IMP
   000185         018800     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2124.2
   000186         018900     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2124.2 IMP
   000187         019000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2124.2 IMP
   000188         019100 01  REC-CT                        PIC 99       VALUE ZERO.       IX2124.2 IMP
   000189         019200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2124.2 IMP
   000190         019300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2124.2 IMP
   000191         019400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2124.2 IMP
   000192         019500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2124.2 IMP
   000193         019600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2124.2 IMP
   000194         019700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2124.2 IMP
   000195         019800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2124.2 IMP
   000196         019900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2124.2 IMP
   000197         020000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2124.2 IMP
   000198         020100 01  CCVS-H-1.                                                    IX2124.2
   000199         020200     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2124.2 IMP
   000200         020300     02  FILLER                    PIC X(42)    VALUE             IX2124.2
   000201         020400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2124.2
   000202         020500     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2124.2 IMP
   000203         020600 01  CCVS-H-2A.                                                   IX2124.2
   000204         020700   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2124.2 IMP
   000205         020800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2124.2
   000206         020900   02  FILLER                        PIC XXXX   VALUE             IX2124.2
   000207         021000     "4.2 ".                                                      IX2124.2
   000208         021100   02  FILLER                        PIC X(28)  VALUE             IX2124.2
   000209         021200            " COPY - NOT FOR DISTRIBUTION".                       IX2124.2
   000210         021300   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2124.2 IMP
   000211         021400                                                                  IX2124.2
   000212         021500 01  CCVS-H-2B.                                                   IX2124.2
   000213         021600   02  FILLER                        PIC X(15)  VALUE             IX2124.2
   000214         021700            "TEST RESULT OF ".                                    IX2124.2
   000215         021800   02  TEST-ID                       PIC X(9).                    IX2124.2
   000216         021900   02  FILLER                        PIC X(4)   VALUE             IX2124.2
   000217         022000            " IN ".                                               IX2124.2
   000218         022100   02  FILLER                        PIC X(12)  VALUE             IX2124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000219         022200     " HIGH       ".                                              IX2124.2
   000220         022300   02  FILLER                        PIC X(22)  VALUE             IX2124.2
   000221         022400            " LEVEL VALIDATION FOR ".                             IX2124.2
   000222         022500   02  FILLER                        PIC X(58)  VALUE             IX2124.2
   000223         022600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2124.2
   000224         022700 01  CCVS-H-3.                                                    IX2124.2
   000225         022800     02  FILLER                      PIC X(34)  VALUE             IX2124.2
   000226         022900            " FOR OFFICIAL USE ONLY    ".                         IX2124.2
   000227         023000     02  FILLER                      PIC X(58)  VALUE             IX2124.2
   000228         023100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2124.2
   000229         023200     02  FILLER                      PIC X(28)  VALUE             IX2124.2
   000230         023300            "  COPYRIGHT   1985 ".                                IX2124.2
   000231         023400 01  CCVS-E-1.                                                    IX2124.2
   000232         023500     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2124.2 IMP
   000233         023600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2124.2
   000234         023700     02 ID-AGAIN                     PIC X(9).                    IX2124.2
   000235         023800     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2124.2 IMP
   000236         023900 01  CCVS-E-2.                                                    IX2124.2
   000237         024000     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2124.2 IMP
   000238         024100     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2124.2 IMP
   000239         024200     02 CCVS-E-2-2.                                               IX2124.2
   000240         024300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2124.2 IMP
   000241         024400         03 FILLER                   PIC X      VALUE SPACE.      IX2124.2 IMP
   000242         024500         03 ENDER-DESC               PIC X(44)  VALUE             IX2124.2
   000243         024600            "ERRORS ENCOUNTERED".                                 IX2124.2
   000244         024700 01  CCVS-E-3.                                                    IX2124.2
   000245         024800     02  FILLER                      PIC X(22)  VALUE             IX2124.2
   000246         024900            " FOR OFFICIAL USE ONLY".                             IX2124.2
   000247         025000     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2124.2 IMP
   000248         025100     02  FILLER                      PIC X(58)  VALUE             IX2124.2
   000249         025200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2124.2
   000250         025300     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2124.2 IMP
   000251         025400     02 FILLER                       PIC X(15)  VALUE             IX2124.2
   000252         025500             " COPYRIGHT 1985".                                   IX2124.2
   000253         025600 01  CCVS-E-4.                                                    IX2124.2
   000254         025700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2124.2 IMP
   000255         025800     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2124.2
   000256         025900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2124.2 IMP
   000257         026000     02 FILLER                       PIC X(40)  VALUE             IX2124.2
   000258         026100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2124.2
   000259         026200 01  XXINFO.                                                      IX2124.2
   000260         026300     02 FILLER                       PIC X(19)  VALUE             IX2124.2
   000261         026400            "*** INFORMATION ***".                                IX2124.2
   000262         026500     02 INFO-TEXT.                                                IX2124.2
   000263         026600       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2124.2 IMP
   000264         026700       04 XXCOMPUTED                 PIC X(20).                   IX2124.2
   000265         026800       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2124.2 IMP
   000266         026900       04 XXCORRECT                  PIC X(20).                   IX2124.2
   000267         027000     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2124.2
   000268         027100 01  HYPHEN-LINE.                                                 IX2124.2
   000269         027200     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2124.2 IMP
   000270         027300     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2124.2
   000271         027400-    "*****************************************".                 IX2124.2
   000272         027500     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2124.2
   000273         027600-    "******************************".                            IX2124.2
   000274         027700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2124.2
   000275         027800     "IX212A".                                                    IX2124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000276         027900 PROCEDURE DIVISION.                                              IX2124.2
   000277         028000 CCVS1 SECTION.                                                   IX2124.2
   000278         028100 OPEN-FILES.                                                      IX2124.2
   000279         028200     OPEN I-O RAW-DATA.                                           IX2124.2 65
   000280         028300     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2124.2 274 68
   000281         028400     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2124.2 65 287
   000282         028500     MOVE "ABORTED " TO C-ABORT.                                  IX2124.2 79
   000283         028600     ADD 1 TO C-NO-OF-TESTS.                                      IX2124.2 71
   000284         028700     ACCEPT C-DATE  FROM DATE.                                    IX2124.2 69
   000285         028800     ACCEPT C-TIME  FROM TIME.                                    IX2124.2 70
   000286         028900     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2124.2 67 287
   000287         029000 END-E-1.                                                         IX2124.2
   000288         029100     CLOSE RAW-DATA.                                              IX2124.2 65
   000289         029200     OPEN    OUTPUT PRINT-FILE.                                   IX2124.2 80
   000290         029300     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2124.2 274 215 274 234
   000291         029400     MOVE    SPACE TO TEST-RESULTS.                               IX2124.2 IMP 135
   000292         029500     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2124.2 329 334
   000293         029600     GO TO CCVS1-EXIT.                                            IX2124.2 416
   000294         029700 CLOSE-FILES.                                                     IX2124.2
   000295         029800     OPEN I-O RAW-DATA.                                           IX2124.2 65
   000296         029900     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2124.2 274 68
   000297         030000     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2124.2 65 305
   000298         030100     MOVE "OK.     " TO C-ABORT.                                  IX2124.2 79
   000299         030200     MOVE PASS-COUNTER TO C-OK.                                   IX2124.2 192 72
   000300         030300     MOVE ERROR-HOLD   TO C-ALL.                                  IX2124.2 194 73
   000301         030400     MOVE ERROR-COUNTER TO C-FAIL.                                IX2124.2 190 74
   000302         030500     MOVE DELETE-COUNTER TO C-DELETED.                            IX2124.2 189 75
   000303         030600     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2124.2 191 76
   000304         030700     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2124.2 67 305
   000305         030800 END-E-2.                                                         IX2124.2
   000306         030900     CLOSE RAW-DATA.                                              IX2124.2 65
   000307         031000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2124.2 338 359 80
   000308         031100 TERMINATE-CCVS.                                                  IX2124.2
   000309         031200     EXIT PROGRAM.                                                IX2124.2
   000310         031300 TERMINATE-CALL.                                                  IX2124.2
   000311         031400     STOP     RUN.                                                IX2124.2
   000312         031500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2124.2 139 191
   000313         031600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2124.2 139 192
   000314         031700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2124.2 139 190
   000315         031800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2124.2 139 189
   000316         031900     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2124.2 146
   000317         032000 PRINT-DETAIL.                                                    IX2124.2
   000318         032100     IF REC-CT NOT EQUAL TO ZERO                                  IX2124.2 188 IMP
   000319      1  032200             MOVE "." TO PARDOT-X                                 IX2124.2 143
   000320      1  032300             MOVE REC-CT TO DOTVALUE.                             IX2124.2 188 144
   000321         032400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2124.2 135 81 371
   000322         032500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2124.2 139 371
   000323      1  032600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2124.2 392 406
   000324      1  032700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2124.2 407 415
   000325         032800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2124.2 IMP 139 IMP 151
   000326         032900     MOVE SPACE TO CORRECT-X.                                     IX2124.2 IMP 165
   000327         033000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2124.2 188 IMP IMP 141
   000328         033100     MOVE     SPACE TO RE-MARK.                                   IX2124.2 IMP 146
   000329         033200 HEAD-ROUTINE.                                                    IX2124.2
   000330         033300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2124.2 198 82 371
   000331         033400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2124.2 203 82 371
   000332         033500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2124.2 212 82 371
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000333         033600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2124.2 224 82 371
   000334         033700 COLUMN-NAMES-ROUTINE.                                            IX2124.2
   000335         033800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2124.2 176 82 371
   000336         033900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2124.2 181 82 371
   000337         034000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2124.2 268 82 371
   000338         034100 END-ROUTINE.                                                     IX2124.2
   000339         034200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2124.2 268 82 371
   000340         034300 END-RTN-EXIT.                                                    IX2124.2
   000341         034400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2124.2 231 82 371
   000342         034500 END-ROUTINE-1.                                                   IX2124.2
   000343         034600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2124.2 190 194 191
   000344         034700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2124.2 194 189 194
   000345         034800      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2124.2 192 194
   000346         034900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2124.2
   000347         035000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2124.2 192 254
   000348         035100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2124.2 194 256
   000349         035200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2124.2 253 239
   000350         035300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2124.2 236 82 371
   000351         035400  END-ROUTINE-12.                                                 IX2124.2
   000352         035500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2124.2 242
   000353         035600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2124.2 190 IMP
   000354      1  035700         MOVE "NO " TO ERROR-TOTAL                                IX2124.2 240
   000355         035800         ELSE                                                     IX2124.2
   000356      1  035900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2124.2 190 240
   000357         036000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2124.2 236 82
   000358         036100     PERFORM WRITE-LINE.                                          IX2124.2 371
   000359         036200 END-ROUTINE-13.                                                  IX2124.2
   000360         036300     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2124.2 189 IMP
   000361      1  036400         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2124.2 240
   000362      1  036500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2124.2 189 240
   000363         036600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2124.2 242
   000364         036700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2124.2 236 82 371
   000365         036800      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2124.2 191 IMP
   000366      1  036900          MOVE "NO " TO ERROR-TOTAL                               IX2124.2 240
   000367      1  037000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2124.2 191 240
   000368         037100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2124.2 242
   000369         037200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2124.2 236 82 371
   000370         037300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2124.2 244 82 371
   000371         037400 WRITE-LINE.                                                      IX2124.2
   000372         037500     ADD 1 TO RECORD-COUNT.                                       IX2124.2 196
   000373         037600     IF RECORD-COUNT GREATER 42                                   IX2124.2 196
   000374      1  037700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2124.2 82 195
   000375      1  037800         MOVE SPACE TO DUMMY-RECORD                               IX2124.2 IMP 82
   000376      1  037900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2124.2 82
   000377      1  038000         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2124.2 198 82 387
   000378      1  038100         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2124.2 203 82 387
   000379      1  038200         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2124.2 212 82 387
   000380      1  038300         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2124.2 224 82 387
   000381      1  038400         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2124.2 176 82 387
   000382      1  038500         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2124.2 181 82 387
   000383      1  038600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2124.2 268 82 387
   000384      1  038700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2124.2 195 82
   000385      1  038800         MOVE ZERO TO RECORD-COUNT.                               IX2124.2 IMP 196
   000386         038900     PERFORM WRT-LN.                                              IX2124.2 387
   000387         039000 WRT-LN.                                                          IX2124.2
   000388         039100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2124.2 82
   000389         039200     MOVE SPACE TO DUMMY-RECORD.                                  IX2124.2 IMP 82
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000390         039300 BLANK-LINE-PRINT.                                                IX2124.2
   000391         039400     PERFORM WRT-LN.                                              IX2124.2 387
   000392         039500 FAIL-ROUTINE.                                                    IX2124.2
   000393         039600     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2124.2 151 IMP
   000394      1  039700            GO TO   FAIL-ROUTINE-WRITE.                           IX2124.2 401
   000395         039800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2124.2 165 IMP 401
   000396         039900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2124.2 197 267
   000397         040000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2124.2 262
   000398         040100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2124.2 259 82 371
   000399         040200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2124.2 IMP 267
   000400         040300     GO TO  FAIL-ROUTINE-EX.                                      IX2124.2 406
   000401         040400 FAIL-ROUTINE-WRITE.                                              IX2124.2
   000402         040500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2124.2 147 81 371
   000403         040600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2124.2 197 175
   000404         040700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2124.2 162 81 371
   000405         040800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2124.2 IMP 175
   000406         040900 FAIL-ROUTINE-EX. EXIT.                                           IX2124.2
   000407         041000 BAIL-OUT.                                                        IX2124.2
   000408         041100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2124.2 152 IMP 410
   000409         041200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2124.2 166 IMP 415
   000410         041300 BAIL-OUT-WRITE.                                                  IX2124.2
   000411         041400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2124.2 166 266 152 264
   000412         041500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2124.2 197 267
   000413         041600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2124.2 259 82 371
   000414         041700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2124.2 IMP 267
   000415         041800 BAIL-OUT-EX. EXIT.                                               IX2124.2
   000416         041900 CCVS1-EXIT.                                                      IX2124.2
   000417         042000     EXIT.                                                        IX2124.2
   000418         042100 WRITE-INIT-GF-01.                                                IX2124.2
   000419         042200     OPEN OUTPUT IX-FS1.                                          IX2124.2 83
   000420         042300     PERFORM CREATE-IX-FS1 VARYING RECORD-COUNTER FROM 1 BY 1     IX2124.2 423 100
   000421         042400        UNTIL RECORD-COUNTER IS GREATER THAN 100.                 IX2124.2 100
   000422         042500     GO TO WRITE-TEST-GF-01.                                      IX2124.2 429
   000423         042600 CREATE-IX-FS1.                                                   IX2124.2
   000424         042700     MOVE RECORD-COUNTER TO COUNTER00, COUNTER01, COUNTER02,      IX2124.2 100 104 106 109
   000425         042800        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2124.2 112 115 118 121 124
   000426         042900        COUNTER08, COUNTER09, COUNTER10.                          IX2124.2 127 130 133
   000427         043000     WRITE IX-FS1-RECORD FROM WORK-RECORD INVALID KEY             IX2124.2 87 102
   000428      1  043100        ADD 1 TO INVKEY-COUNTER.                                  IX2124.2 101
   000429         043200 WRITE-TEST-GF-01.                                                IX2124.2
   000430         043300     MOVE "WRITE INVALID KEY" TO FEATURE.                         IX2124.2 137
   000431         043400     MOVE "WRITE-TEST-GF-01" TO PAR-NAME.                         IX2124.2 141
   000432         043500     MOVE "CREATE IX-FS1" TO RE-MARK.                             IX2124.2 146
   000433         043600     IF INVKEY-COUNTER = 0                                        IX2124.2 101
   000434      1  043700        PERFORM PASS                                              IX2124.2 313
   000435      1  043800        ELSE GO TO WRITE-FAIL-GF-01.                              IX2124.2 440
   000436         043900     GO TO WRITE-WRITE-GF-01.                                     IX2124.2 445
   000437         044000 WRITE-DELETE-GF-01.                                              IX2124.2
   000438         044100     PERFORM DE-LETE.                                             IX2124.2 315
   000439         044200     GO TO WRITE-WRITE-GF-01.                                     IX2124.2 445
   000440         044300 WRITE-FAIL-GF-01.                                                IX2124.2
   000441         044400     MOVE "IX-41; ONE WRITE FAILED AT LEAST" TO RE-MARK.          IX2124.2 146
   000442         044500     PERFORM FAIL.                                                IX2124.2 314
   000443         044600     MOVE INVKEY-COUNTER TO COMPUTED-18V0.                        IX2124.2 101 159
   000444         044700     MOVE 0 TO CORRECT-18V0.                                      IX2124.2 172
   000445         044800 WRITE-WRITE-GF-01.                                               IX2124.2
   000446         044900     PERFORM PRINT-DETAIL.                                        IX2124.2 317
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000447         045000 READ-TEST-F2-01.                                                 IX2124.2
   000448         045100     CLOSE IX-FS1.                                                IX2124.2 83
   000449         045200     OPEN I-O IX-FS1.                                             IX2124.2 83
   000450         045300     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000451         045400     MOVE "READ-TEST-F2-01" TO PAR-NAME.                          IX2124.2 141
   000452         045500     MOVE "RETRIEVED BY ALTERNATE KEY 1" TO RE-MARK.              IX2124.2 146
   000453         045600     MOVE "CCC012ALT01" TO IX-FS1-ALT01.                          IX2124.2 89
   000454         045700     READ IX-FS1 RECORD                                           IX2124.2 83
   000455         045800                      KEY IS IX-FS1-ALT01                         IX2124.2 89
   000456      1  045900      INVALID KEY   GO TO READ-INVALID-F2-01.                     IX2124.2 464
   000457         046000     IF IX-FS1-KEY = "AAA012"                                     IX2124.2 88
   000458      1  046100        PERFORM PASS                                              IX2124.2 313
   000459      1  046200        ELSE GO TO READ-FAIL-F2-01.                               IX2124.2 470
   000460         046300     GO TO READ-WRITE-F2-01.                                      IX2124.2 475
   000461         046400 READ-DELETE-F2-01.                                               IX2124.2
   000462         046500     PERFORM DE-LETE.                                             IX2124.2 315
   000463         046600     GO TO READ-WRITE-F2-01.                                      IX2124.2 475
   000464         046700 READ-INVALID-F2-01.                                              IX2124.2
   000465         046800     PERFORM FAIL.                                                IX2124.2 314
   000466         046900     MOVE "IX-28; INVALID KEY CONDITION (IX-6) EXISTS" TO RE-MARK.IX2124.2 146
   000467         047000     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000468         047100     MOVE "CCC012ALT01" TO CORRECT-A.                             IX2124.2 166
   000469         047200     GO TO READ-WRITE-F2-01.                                      IX2124.2 475
   000470         047300 READ-FAIL-F2-01.                                                 IX2124.2
   000471         047400     MOVE "IX-28; RETRIEVED BY ALTERENATE KEY 1" TO RE-MARK.      IX2124.2 146
   000472         047500     PERFORM FAIL.                                                IX2124.2 314
   000473         047600     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000474         047700     MOVE "AAA012" TO CORRECT-A.                                  IX2124.2 166
   000475         047800 READ-WRITE-F2-01.                                                IX2124.2
   000476         047900     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000477         048000 READ-TEST-F2-02.                                                 IX2124.2
   000478         048100     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000479         048200     MOVE "READ-TEST-F2-02" TO PAR-NAME.                          IX2124.2 141
   000480         048300     MOVE "RETRIEVED BY ALTERNATE KEY 8" TO RE-MARK.              IX2124.2 146
   000481         048400     MOVE "QQQ043ALT08" TO IX-FS1-ALT08.                          IX2124.2 96
   000482         048500     READ IX-FS1 RECORD                                           IX2124.2 83
   000483         048600                      KEY IS IX-FS1-ALT08                         IX2124.2 96
   000484      1  048700       INVALID KEY  GO TO READ-INVALID-F2-02.                     IX2124.2 492
   000485         048800     IF IX-FS1-KEY = "AAA043"                                     IX2124.2 88
   000486      1  048900        PERFORM PASS                                              IX2124.2 313
   000487      1  049000        ELSE GO TO READ-FAIL-F2-02.                               IX2124.2 498
   000488         049100     GO TO READ-WRITE-F2-02.                                      IX2124.2 503
   000489         049200 READ-DELETE-F2-02.                                               IX2124.2
   000490         049300     PERFORM DE-LETE.                                             IX2124.2 315
   000491         049400     GO TO READ-WRITE-F2-02.                                      IX2124.2 503
   000492         049500 READ-INVALID-F2-02.                                              IX2124.2
   000493         049600     PERFORM FAIL.                                                IX2124.2 314
   000494         049700     MOVE "IX-28; 4.5.2 F2, INVALID KEY CONDITION (IX-6) "        IX2124.2
   000495         049800          TO RE-MARK.                                             IX2124.2 146
   000496         049900     MOVE "QQQ043ALT08" TO CORRECT-A.                             IX2124.2 166
   000497         050000     GO TO READ-WRITE-F2-02.                                      IX2124.2 503
   000498         050100 READ-FAIL-F2-02.                                                 IX2124.2
   000499         050200     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2124.2 146
   000500         050300     PERFORM FAIL.                                                IX2124.2 314
   000501         050400     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000502         050500     MOVE "AAA043" TO CORRECT-A.                                  IX2124.2 166
   000503         050600 READ-WRITE-F2-02.                                                IX2124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000504         050700     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000505         050800 DELETE-TEST-GF-01.                                               IX2124.2
   000506         050900     MOVE "DELETE...RECORD" TO FEATURE.                           IX2124.2 137
   000507         051000     MOVE "DELETE-TEST-GF-01" TO PAR-NAME.                        IX2124.2 141
   000508         051100     MOVE "DELETES RECORD FOUND IN READ-TEST-F2-02" TO RE-MARK.   IX2124.2 146
   000509         051200     DELETE IX-FS1 RECORD INVALID KEY GO TO DELETE-INVALID-GF-01. IX2124.2 83 515
   000510         051300     PERFORM PASS.                                                IX2124.2 313
   000511         051400     GO TO DELETE-WRITE-GF-01.                                    IX2124.2 521
   000512         051500 DELETE-DELETE-GF-01.                                             IX2124.2
   000513         051600     PERFORM DE-LETE.                                             IX2124.2 315
   000514         051700     GO TO DELETE-WRITE-GF-01.                                    IX2124.2 521
   000515         051800 DELETE-INVALID-GF-01.                                            IX2124.2
   000516         051900     MOVE "IX-21; 4.3.2 F2, INVALID KEY CONDITION (IX-6) "        IX2124.2
   000517         052000         TO RE-MARK.                                              IX2124.2 146
   000518         052100     PERFORM FAIL.                                                IX2124.2 314
   000519         052200     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000520         052300     MOVE "AAA043" TO CORRECT-A.                                  IX2124.2 166
   000521         052400 DELETE-WRITE-GF-01.                                              IX2124.2
   000522         052500     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000523         052600 READ-TEST-F2-03.                                                 IX2124.2
   000524         052700     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000525         052800     MOVE "READ-TEST-F2-03" TO PAR-NAME.                          IX2124.2 141
   000526         052900     MOVE "RETRIEVED BY ALTERNATE KEY 4" TO RE-MARK.              IX2124.2 146
   000527         053000     MOVE "III017ALT04" TO IX-FS1-ALT04.                          IX2124.2 92
   000528         053100     READ IX-FS1 RECORD                                           IX2124.2 83
   000529         053200                      KEY IS IX-FS1-ALT04                         IX2124.2 92
   000530      1  053300      INVALID KEY   GO TO READ-INVALID-F2-03.                     IX2124.2 538
   000531         053400     IF IX-FS1-KEY = "AAA017"                                     IX2124.2 88
   000532      1  053500        PERFORM PASS                                              IX2124.2 313
   000533      1  053600        ELSE GO TO READ-FAIL-F2-03.                               IX2124.2 545
   000534         053700     GO TO READ-WRITE-F2-03.                                      IX2124.2 550
   000535         053800 READ-DELETE-F2-03.                                               IX2124.2
   000536         053900     PERFORM DE-LETE.                                             IX2124.2 315
   000537         054000     GO TO READ-WRITE-F2-03.                                      IX2124.2 550
   000538         054100 READ-INVALID-F2-03.                                              IX2124.2
   000539         054200     MOVE "IX-28; 4.5.2 F2, INVALID KEY CONDITION (IX-6) "        IX2124.2
   000540         054300         TO RE-MARK.                                              IX2124.2 146
   000541         054400     PERFORM FAIL.                                                IX2124.2 314
   000542         054500     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000543         054600     MOVE "III017ALT04" TO CORRECT-A.                             IX2124.2 166
   000544         054700     GO TO READ-WRITE-F2-03.                                      IX2124.2 550
   000545         054800 READ-FAIL-F2-03.                                                 IX2124.2
   000546         054900     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2124.2 146
   000547         055000     PERFORM FAIL.                                                IX2124.2 314
   000548         055100     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000549         055200     MOVE "AAA017" TO CORRECT-A.                                  IX2124.2 166
   000550         055300 READ-WRITE-F2-03.                                                IX2124.2
   000551         055400     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000552         055500 REWRITE-TEST-GF-01.                                              IX2124.2
   000553         055600     MOVE "REWRITE...INVALID..." TO FEATURE.                      IX2124.2 137
   000554         055700     MOVE "REWRITE-TEST-GF-01" TO PAR-NAME.                       IX2124.2 141
   000555         055800     MOVE "REWRITES RECORD FOUND IN READ-TEST-F2-03" TO RE-MARK.  IX2124.2 146
   000556         055900     MOVE "III917ALT04" TO IX-FS1-ALT04.                          IX2124.2 92
   000557         056000     REWRITE IX-FS1-RECORD INVALID KEY                            IX2124.2 87
   000558      1  056100                  GO TO REWRITE-INVALID-GF-01.                    IX2124.2 564
   000559         056200     PERFORM PASS.                                                IX2124.2 313
   000560         056300     GO TO REWRITE-WRITE-GF-01.                                   IX2124.2 569
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000561         056400 REWRITE-DELETE-GF-01.                                            IX2124.2
   000562         056500     PERFORM DE-LETE.                                             IX2124.2 315
   000563         056600     GO TO REWRITE-WRITE-GF-01.                                   IX2124.2 569
   000564         056700 REWRITE-INVALID-GF-01.                                           IX2124.2
   000565         056800     MOVE "IX-33; 4.6.2, INVALID KEY CONDITION (IX-6) " TO RE-MARKIX2124.2 146
   000566         056900     PERFORM FAIL.                                                IX2124.2 314
   000567         057000     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000568         057100     MOVE "III917ALT04" TO CORRECT-A.                             IX2124.2 166
   000569         057200 REWRITE-WRITE-GF-01.                                             IX2124.2
   000570         057300     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000571         057400 READ-TEST-F2-04.                                                 IX2124.2
   000572         057500     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000573         057600     MOVE "READ-TEST-F2-04" TO PAR-NAME.                          IX2124.2 141
   000574         057700     MOVE "INVALID KEY PATH SHOULD BE TAKEN" TO RE-MARK.          IX2124.2 146
   000575         057800     MOVE "ZZZ999ALT09" TO IX-FS1-ALT09.                          IX2124.2 97
   000576         057900     READ IX-FS1 RECORD                                           IX2124.2 83
   000577         058000                      KEY IS IX-FS1-ALT09                         IX2124.2 97
   000578      1  058100      INVALID KEY   PERFORM PASS                                  IX2124.2 313
   000579      1  058200        GO TO READ-WRITE-F2-04.                                   IX2124.2 590
   000580         058300     GO TO READ-FAIL-F2-04.                                       IX2124.2 584
   000581         058400 READ-DELETE-F2-04.                                               IX2124.2
   000582         058500     PERFORM DE-LETE.                                             IX2124.2 315
   000583         058600     GO TO READ-WRITE-F2-04.                                      IX2124.2 590
   000584         058700 READ-FAIL-F2-04.                                                 IX2124.2
   000585         058800     MOVE "IX-28; 4.5.2 F2, INVALID KEY NOT TAKEN (IX-6)"         IX2124.2
   000586         058900          TO RE-MARK.                                             IX2124.2 146
   000587         059000     PERFORM FAIL.                                                IX2124.2 314
   000588         059100     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000589         059200     MOVE "INVALID KEY" TO CORRECT-A.                             IX2124.2 166
   000590         059300 READ-WRITE-F2-04.                                                IX2124.2
   000591         059400     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000592         059500 START-TEST-GF-01.                                                IX2124.2
   000593         059600     MOVE "START...KEY IS EQUAL"    TO FEATURE.                   IX2124.2 137
   000594         059700     MOVE "START-TEST-GF-01" TO PAR-NAME.                         IX2124.2 141
   000595         059800     MOVE "RETRIEVED BY ALTERNATE KEY 3" TO RE-MARK.              IX2124.2 146
   000596         059900     MOVE "GGG058ALT03" TO IX-FS1-ALT03.                          IX2124.2 91
   000597         060000     START IX-FS1                                                 IX2124.2 83
   000598         060100                KEY IS EQUAL TO IX-FS1-ALT03                      IX2124.2 91
   000599      1  060200        INVALID KEY  GO TO START-INVALID-GF-01.                   IX2124.2 608
   000600         060300     READ IX-FS1 NEXT RECORD AT END GO TO START-END-GF-01.        IX2124.2 83 614
   000601         060400     IF IX-FS1-KEY = "AAA058"                                     IX2124.2 88
   000602      1  060500        PERFORM PASS                                              IX2124.2 313
   000603      1  060600        ELSE GO TO START-FAIL-GF-01.                              IX2124.2 620
   000604         060700     GO TO START-WRITE-GF-01.                                     IX2124.2 626
   000605         060800 START-DELETE-GF-01.                                              IX2124.2
   000606         060900     PERFORM DE-LETE.                                             IX2124.2 315
   000607         061000     GO TO START-WRITE-GF-01.                                     IX2124.2 626
   000608         061100 START-INVALID-GF-01.                                             IX2124.2
   000609         061200     MOVE "IX-36; 4.7.2, INVALID KEY CONDITION (IX-6)" TO RE-MARK.IX2124.2 146
   000610         061300     PERFORM FAIL.                                                IX2124.2 314
   000611         061400     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000612         061500     MOVE "GGG058ALT03" TO CORRECT-A.                             IX2124.2 166
   000613         061600     GO TO START-WRITE-GF-01.                                     IX2124.2 626
   000614         061700 START-END-GF-01.                                                 IX2124.2
   000615         061800     MOVE "IX-28; 4.5.2 F1, AT END CONDITION     " TO RE-MARK.    IX2124.2 146
   000616         061900     PERFORM FAIL.                                                IX2124.2 314
   000617         062000     MOVE "FILE IS AT END" TO COMPUTED-A.                         IX2124.2 152
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000618         062100     MOVE "AAA058" TO CORRECT-A.                                  IX2124.2 166
   000619         062200     GO TO START-WRITE-GF-01.                                     IX2124.2 626
   000620         062300 START-FAIL-GF-01.                                                IX2124.2
   000621         062400     MOVE "IX-28; 4.5.2 F1, WRONG KEY OR IX-36 WRONG START  "     IX2124.2
   000622         062500           TO RE-MARK.                                            IX2124.2 146
   000623         062600     PERFORM FAIL.                                                IX2124.2 314
   000624         062700     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000625         062800     MOVE "AAA058" TO CORRECT-A.                                  IX2124.2 166
   000626         062900 START-WRITE-GF-01.                                               IX2124.2
   000627         063000     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000628         063100 START-TEST-GF-02.                                                IX2124.2
   000629         063200     MOVE "START...KEY >" TO FEATURE.                             IX2124.2 137
   000630         063300     MOVE "START-TEST-GF-02" TO PAR-NAME.                         IX2124.2 141
   000631         063400     MOVE "RETRIEVED BY ALTERNATE KEY 6" TO RE-MARK.              IX2124.2 146
   000632         063500     MOVE "MMM089ALT06" TO IX-FS1-ALT06.                          IX2124.2 94
   000633         063600     START IX-FS1                                                 IX2124.2 83
   000634         063700                KEY > IX-FS1-ALT06                                IX2124.2 94
   000635      1  063800        INVALID KEY GO TO START-INVALID-GF-02.                    IX2124.2 644
   000636         063900     READ IX-FS1 NEXT RECORD AT END GO TO START-END-GF-02.        IX2124.2 83 650
   000637         064000     IF IX-FS1-KEY = "AAA090"                                     IX2124.2 88
   000638      1  064100        PERFORM PASS                                              IX2124.2 313
   000639      1  064200        ELSE GO TO START-FAIL-GF-02.                              IX2124.2 656
   000640         064300     GO TO START-WRITE-GF-02.                                     IX2124.2 662
   000641         064400 START-DELETE-GF-02.                                              IX2124.2
   000642         064500     PERFORM DE-LETE.                                             IX2124.2 315
   000643         064600     GO TO START-WRITE-GF-02.                                     IX2124.2 662
   000644         064700 START-INVALID-GF-02.                                             IX2124.2
   000645         064800     MOVE "IX-36; 4.7.2, INVALID KEY CONDITION (IX-6)" TO RE-MARK.IX2124.2 146
   000646         064900     PERFORM FAIL.                                                IX2124.2 314
   000647         065000     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000648         065100     MOVE "MMM089ALT09" TO CORRECT-A.                             IX2124.2 166
   000649         065200     GO TO START-WRITE-GF-02.                                     IX2124.2 662
   000650         065300 START-END-GF-02.                                                 IX2124.2
   000651         065400     MOVE "IX-28; 4.5.2 F1, AT END CONDITION (IX-6)" TO RE-MARK.  IX2124.2 146
   000652         065500     PERFORM FAIL.                                                IX2124.2 314
   000653         065600     MOVE "FILE IS AT END" TO COMPUTED-A.                         IX2124.2 152
   000654         065700     MOVE "AAA090" TO CORRECT-A.                                  IX2124.2 166
   000655         065800     GO TO START-WRITE-GF-02.                                     IX2124.2 662
   000656         065900 START-FAIL-GF-02.                                                IX2124.2
   000657         066000     MOVE "IX-28; 4.5.2 F1, AT END OR IX-36 START WRONG KEY"      IX2124.2
   000658         066100           TO RE-MARK.                                            IX2124.2 146
   000659         066200     PERFORM FAIL.                                                IX2124.2 314
   000660         066300     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000661         066400     MOVE "AAA090" TO CORRECT-A.                                  IX2124.2 166
   000662         066500 START-WRITE-GF-02.                                               IX2124.2
   000663         066600     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000664         066700 START-TEST-GF-03.                                                IX2124.2
   000665         066800     MOVE "START...KEY NOT <" TO FEATURE.                         IX2124.2 137
   000666         066900     MOVE "START-TEST-GF-03" TO PAR-NAME.                         IX2124.2 141
   000667         067000     MOVE "RETRIEVED BY ALTERNATE KEY 10" TO RE-MARK.             IX2124.2 146
   000668         067100     MOVE "UUU002ALT10" TO IX-FS1-ALT10.                          IX2124.2 98
   000669         067200     START IX-FS1                                                 IX2124.2 83
   000670         067300                KEY NOT < IX-FS1-ALT10                            IX2124.2 98
   000671      1  067400      INVALID KEY   GO TO START-INVALID-GF-03.                    IX2124.2 681
   000672         067500     READ IX-FS1 NEXT RECORD                                      IX2124.2 83
   000673      1  067600      AT END GO TO START-END-GF-03.                               IX2124.2 688
   000674         067700     IF IX-FS1-KEY = "AAA002"                                     IX2124.2 88
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000675      1  067800        PERFORM PASS                                              IX2124.2 313
   000676      1  067900        ELSE GO TO START-FAIL-GF-03.                              IX2124.2 694
   000677         068000     GO TO START-WRITE-GF-03.                                     IX2124.2 700
   000678         068100 START-DELETE-GF-03.                                              IX2124.2
   000679         068200     PERFORM DE-LETE.                                             IX2124.2 315
   000680         068300     GO TO START-WRITE-GF-03.                                     IX2124.2 700
   000681         068400 START-INVALID-GF-03.                                             IX2124.2
   000682         068500     MOVE "IX-36; 4.7.2 F2, INVALID KEY CONDITION (IX-6)"         IX2124.2
   000683         068600          TO RE-MARK.                                             IX2124.2 146
   000684         068700     PERFORM FAIL.                                                IX2124.2 314
   000685         068800     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000686         068900     MOVE "UUU002ALT10" TO CORRECT-A.                             IX2124.2 166
   000687         069000     GO TO START-WRITE-GF-03.                                     IX2124.2 700
   000688         069100 START-END-GF-03.                                                 IX2124.2
   000689         069200     MOVE "IX-28; 4.5.2 F1, AT END CONDITION (IX-6)" TO RE-MARK.  IX2124.2 146
   000690         069300     PERFORM FAIL.                                                IX2124.2 314
   000691         069400     MOVE "FILE IS AT END" TO COMPUTED-A.                         IX2124.2 152
   000692         069500     MOVE "AAA002" TO CORRECT-A.                                  IX2124.2 166
   000693         069600     GO TO START-WRITE-GF-03.                                     IX2124.2 700
   000694         069700 START-FAIL-GF-03.                                                IX2124.2
   000695         069800     MOVE "IX-28; 4.5.2 F1, AT END OR IX-36 START WRONG KEY"      IX2124.2
   000696         069900           TO RE-MARK.                                            IX2124.2 146
   000697         070000     PERFORM FAIL.                                                IX2124.2 314
   000698         070100     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000699         070200     MOVE "AAA002" TO CORRECT-A.                                  IX2124.2 166
   000700         070300 START-WRITE-GF-03.                                               IX2124.2
   000701         070400     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000702         070500 START-TEST-GF-04.                                                IX2124.2
   000703         070600     MOVE "START...KEY >=   " TO FEATURE.                         IX2124.2 137
   000704         070700     MOVE "START-TEST-GF-04" TO PAR-NAME.                         IX2124.2 141
   000705         070800     MOVE "RETRIEVED BY ALTERNATE KEY 10" TO RE-MARK.             IX2124.2 146
   000706         070900     MOVE "UUU002ALT10" TO IX-FS1-ALT10.                          IX2124.2 98
   000707         071000     START IX-FS1                                                 IX2124.2 83
   000708         071100                KEY >=    IX-FS1-ALT10                            IX2124.2 98
   000709      1  071200      INVALID KEY   GO TO START-INVALID-GF-04.                    IX2124.2 719
   000710         071300     READ IX-FS1 NEXT RECORD                                      IX2124.2 83
   000711      1  071400      AT END GO TO START-END-GF-04.                               IX2124.2 726
   000712         071500     IF IX-FS1-KEY = "AAA002"                                     IX2124.2 88
   000713      1  071600        PERFORM PASS                                              IX2124.2 313
   000714      1  071700        ELSE GO TO START-FAIL-GF-04.                              IX2124.2 732
   000715         071800     GO TO START-WRITE-GF-04.                                     IX2124.2 738
   000716         071900 START-DELETE-GF-04.                                              IX2124.2
   000717         072000     PERFORM DE-LETE.                                             IX2124.2 315
   000718         072100     GO TO START-WRITE-GF-04.                                     IX2124.2 738
   000719         072200 START-INVALID-GF-04.                                             IX2124.2
   000720         072300     MOVE "IX-36; 4.7.2 F2, INVALID KEY CONDITION (IX-6)"         IX2124.2
   000721         072400          TO RE-MARK.                                             IX2124.2 146
   000722         072500     PERFORM FAIL.                                                IX2124.2 314
   000723         072600     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000724         072700     MOVE "UUU002ALT10" TO CORRECT-A.                             IX2124.2 166
   000725         072800     GO TO START-WRITE-GF-04.                                     IX2124.2 738
   000726         072900 START-END-GF-04.                                                 IX2124.2
   000727         073000     MOVE "IX-28; 4.5.2 F1, AT END CONDITION (IX-6)" TO RE-MARK.  IX2124.2 146
   000728         073100     PERFORM FAIL.                                                IX2124.2 314
   000729         073200     MOVE "FILE IS AT END" TO COMPUTED-A.                         IX2124.2 152
   000730         073300     MOVE "AAA002" TO CORRECT-A.                                  IX2124.2 166
   000731         073400     GO TO START-WRITE-GF-04.                                     IX2124.2 738
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000732         073500 START-FAIL-GF-04.                                                IX2124.2
   000733         073600     MOVE "IX-28; 4.5.2 F1, AT END OR IX-36 START WRONG KEY"      IX2124.2
   000734         073700           TO RE-MARK.                                            IX2124.2 146
   000735         073800     PERFORM FAIL.                                                IX2124.2 314
   000736         073900     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000737         074000     MOVE "AAA002" TO CORRECT-A.                                  IX2124.2 166
   000738         074100 START-WRITE-GF-04.                                               IX2124.2
   000739         074200     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000740         074300 READ-TEST-F2-05.                                                 IX2124.2
   000741         074400     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000742         074500     MOVE "READ-TEST-F2-05"  TO PAR-NAME.                         IX2124.2 141
   000743         074600     MOVE "INVALID KEY PATH SHOULD BE TAKEN" TO RE-MARK.          IX2124.2 146
   000744         074700     MOVE "QQQ043ALT08" TO IX-FS1-ALT08.                          IX2124.2 96
   000745         074800     READ IX-FS1 RECORD                                           IX2124.2 83
   000746         074900                      KEY IS IX-FS1-ALT08                         IX2124.2 96
   000747      1  075000       INVALID KEY  PERFORM PASS                                  IX2124.2 313
   000748      1  075100        GO TO READ-WRITE-F2-05.                                   IX2124.2 759
   000749         075200     GO TO READ-FAIL-F2-05.                                       IX2124.2 753
   000750         075300 READ-DELETE-F2-05.                                               IX2124.2
   000751         075400     PERFORM DE-LETE.                                             IX2124.2 315
   000752         075500     GO TO READ-WRITE-F2-05.                                      IX2124.2 759
   000753         075600 READ-FAIL-F2-05.                                                 IX2124.2
   000754         075700     MOVE "IX-28; 4.5.2 F2, INVALID KEY PATH NOT TAKEN (IX-6) "   IX2124.2
   000755         075800             TO RE-MARK.                                          IX2124.2 146
   000756         075900     PERFORM FAIL.                                                IX2124.2 314
   000757         076000     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000758         076100     MOVE "INVALID KEY" TO CORRECT-A.                             IX2124.2 166
   000759         076200 READ-WRITE-F2-05.                                                IX2124.2
   000760         076300     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000761         076400 READ-TEST-F2-06.                                                 IX2124.2
   000762         076500     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000763         076600     MOVE "READ-TEST-F2-06" TO PAR-NAME.                          IX2124.2 141
   000764         076700     MOVE "RETRIEVED BY ALTERNATE KEY 4" TO RE-MARK.              IX2124.2 146
   000765         076800     MOVE "III917ALT04" TO IX-FS1-ALT04.                          IX2124.2 92
   000766         076900     READ IX-FS1 RECORD                                           IX2124.2 83
   000767         077000                      KEY IS IX-FS1-ALT04                         IX2124.2 92
   000768      1  077100      INVALID KEY   GO TO READ-INVALID-F2-06.                     IX2124.2 776
   000769         077200     IF IX-FS1-KEY = "AAA017"                                     IX2124.2 88
   000770      1  077300        PERFORM PASS                                              IX2124.2 313
   000771      1  077400        ELSE GO TO READ-FAIL-F2-06.                               IX2124.2 783
   000772         077500     GO TO READ-WRITE-F2-06.                                      IX2124.2 788
   000773         077600 READ-DELETE-F2-06.                                               IX2124.2
   000774         077700     PERFORM DE-LETE.                                             IX2124.2 315
   000775         077800     GO TO READ-WRITE-F2-06.                                      IX2124.2 788
   000776         077900 READ-INVALID-F2-06.                                              IX2124.2
   000777         078000     MOVE "IX-28; 4.5.2 F2, INVALID KEY CONDITION (IX-6) "        IX2124.2
   000778         078100           TO RE-MARK.                                            IX2124.2 146
   000779         078200     PERFORM FAIL.                                                IX2124.2 314
   000780         078300     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000781         078400     MOVE "III917ALT04" TO CORRECT-A.                             IX2124.2 166
   000782         078500     GO TO READ-WRITE-F2-06.                                      IX2124.2 788
   000783         078600 READ-FAIL-F2-06.                                                 IX2124.2
   000784         078700     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2124.2 146
   000785         078800     PERFORM FAIL.                                                IX2124.2 314
   000786         078900     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000787         079000     MOVE "AAA017" TO CORRECT-A.                                  IX2124.2 166
   000788         079100 READ-WRITE-F2-06.                                                IX2124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000789         079200     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000790         079300 READ-TEST-F2-07.                                                 IX2124.2
   000791         079400     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000792         079500     MOVE "READ-TEST-F2-07"  TO PAR-NAME.                         IX2124.2 141
   000793         079600     MOVE "RETRIEVED BY PRIMARY KEY" TO RE-MARK.                  IX2124.2 146
   000794         079700     MOVE "AAA018" TO IX-FS1-KEY.                                 IX2124.2 88
   000795         079800     READ IX-FS1 RECORD                                           IX2124.2 83
   000796         079900                      KEY IS IX-FS1-KEY                           IX2124.2 88
   000797      1  080000       INVALID KEY  GO TO READ-INVALID-F2-07.                     IX2124.2 805
   000798         080100     IF IX-FS1-KEY = "AAA018"                                     IX2124.2 88
   000799      1  080200        PERFORM PASS                                              IX2124.2 313
   000800      1  080300        ELSE GO TO READ-FAIL-F2-07.                               IX2124.2 812
   000801         080400     GO TO READ-WRITE-F2-07.                                      IX2124.2 817
   000802         080500 READ-DELETE-F2-07.                                               IX2124.2
   000803         080600     PERFORM DE-LETE.                                             IX2124.2 315
   000804         080700     GO TO READ-WRITE-F2-07.                                      IX2124.2 817
   000805         080800 READ-INVALID-F2-07.                                              IX2124.2
   000806         080900     MOVE "IX-28; 4.5.2 F2, INVALID KEY CONDITION (IX-6) "        IX2124.2
   000807         081000          TO RE-MARK.                                             IX2124.2 146
   000808         081100     PERFORM FAIL.                                                IX2124.2 314
   000809         081200     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000810         081300     MOVE "AAA018" TO CORRECT-A.                                  IX2124.2 166
   000811         081400     GO TO READ-WRITE-F2-07.                                      IX2124.2 817
   000812         081500 READ-FAIL-F2-07.                                                 IX2124.2
   000813         081600     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2124.2 146
   000814         081700     PERFORM FAIL.                                                IX2124.2 314
   000815         081800     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000816         081900     MOVE "AAA018" TO CORRECT-A.                                  IX2124.2 166
   000817         082000 READ-WRITE-F2-07.                                                IX2124.2
   000818         082100     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000819         082200 DELETE-TEST-GF-02.                                               IX2124.2
   000820         082300     MOVE "DELETE...RECORD" TO FEATURE.                           IX2124.2 137
   000821         082400     MOVE "DELETE-TEST-GF-02" TO PAR-NAME.                        IX2124.2 141
   000822         082500     MOVE "DELETES RECORD FOUND IN READ-TEST-F2-07" TO RE-MARK.   IX2124.2 146
   000823         082600     DELETE IX-FS1 RECORD INVALID KEY GO TO DELETE-FAIL-GF-02.    IX2124.2 83 829
   000824         082700     PERFORM PASS.                                                IX2124.2 313
   000825         082800     GO TO DELETE-WRITE-GF-02.                                    IX2124.2 834
   000826         082900 DELETE-DELETE-GF-02.                                             IX2124.2
   000827         083000     PERFORM DE-LETE.                                             IX2124.2 315
   000828         083100     GO TO DELETE-WRITE-GF-02.                                    IX2124.2 834
   000829         083200 DELETE-FAIL-GF-02.                                               IX2124.2
   000830         083300     MOVE "IX-21; 4.3.2 INVALID KEY PATH TAKEN (IX-6)" TO RE-MARK.IX2124.2 146
   000831         083400     PERFORM FAIL.                                                IX2124.2 314
   000832         083500     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000833         083600     MOVE "AAA018" TO CORRECT-A.                                  IX2124.2 166
   000834         083700 DELETE-WRITE-GF-02.                                              IX2124.2
   000835         083800     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000836         083900 READ-TEST-F1-08.                                                 IX2124.2
   000837         084000     MOVE "READ...NEXT RECORD" TO FEATURE.                        IX2124.2 137
   000838         084100     MOVE "READ-TEST-F1-08"  TO PAR-NAME.                         IX2124.2 141
   000839         084200     MOVE "READS NEXT RECORD" TO RE-MARK.                         IX2124.2 146
   000840         084300     READ IX-FS1 NEXT RECORD AT END GO TO READ-END-F1-08.         IX2124.2 83 848
   000841         084400     IF IX-FS1-KEY = "AAA019"                                     IX2124.2 88
   000842      1  084500        PERFORM PASS                                              IX2124.2 313
   000843      1  084600        ELSE GO TO READ-FAIL-F1-08.                               IX2124.2 854
   000844         084700     GO TO READ-WRITE-F1-08.                                      IX2124.2 859
   000845         084800 READ-DELETE-F1-08.                                               IX2124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000846         084900     PERFORM DE-LETE.                                             IX2124.2 315
   000847         085000     GO TO READ-WRITE-F1-08.                                      IX2124.2 859
   000848         085100 READ-END-F1-08.                                                  IX2124.2
   000849         085200     MOVE "IX-28; 4.5.2 F1, AT END CONDITION TAKEN" TO RE-MARK.   IX2124.2 146
   000850         085300     PERFORM FAIL.                                                IX2124.2 314
   000851         085400     MOVE "FILE IS AT END" TO COMPUTED-A.                         IX2124.2 152
   000852         085500     MOVE "AAA019" TO CORRECT-A.                                  IX2124.2 166
   000853         085600     GO TO READ-WRITE-F1-08.                                      IX2124.2 859
   000854         085700 READ-FAIL-F1-08.                                                 IX2124.2
   000855         085800     MOVE "IX-28; 4.5.2 F1, WRONG KEY            " TO RE-MARK.    IX2124.2 146
   000856         085900     PERFORM FAIL.                                                IX2124.2 314
   000857         086000     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000858         086100     MOVE "AAA019" TO CORRECT-A.                                  IX2124.2 166
   000859         086200 READ-WRITE-F1-08.                                                IX2124.2
   000860         086300     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000861         086400 REWRITE-TEST-GF-02.                                              IX2124.2
   000862         086500     MOVE "REWRITE...INVALID..." TO FEATURE.                      IX2124.2 137
   000863         086600     MOVE "REWRITE-TEST-GF-02" TO PAR-NAME.                       IX2124.2 141
   000864         086700     MOVE "REWRITES RECORD FOUND IN READ-TEST-F1-08" TO RE-MARK.  IX2124.2 146
   000865         086800     MOVE "SSSSSSALT09" TO IX-FS1-ALT09.                          IX2124.2 97
   000866         086900     REWRITE IX-FS1-RECORD INVALID KEY GO TO REWRITE-FAIL-GF-02.  IX2124.2 87 872
   000867         087000     PERFORM PASS.                                                IX2124.2 313
   000868         087100     GO TO REWRITE-WRITE-GF-02.                                   IX2124.2 878
   000869         087200 REWRITE-DELETE-GF-02.                                            IX2124.2
   000870         087300     PERFORM DE-LETE.                                             IX2124.2 315
   000871         087400     GO TO REWRITE-WRITE-GF-02.                                   IX2124.2 878
   000872         087500 REWRITE-FAIL-GF-02.                                              IX2124.2
   000873         087600     MOVE "IX-33; 4.6.2 F2, INVALID KEY CONDITION (IX-6) "        IX2124.2
   000874         087700           TO RE-MARK.                                            IX2124.2 146
   000875         087800     PERFORM FAIL.                                                IX2124.2 314
   000876         087900     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000877         088000     MOVE "SSSSSSALT09" TO CORRECT-A.                             IX2124.2 166
   000878         088100 REWRITE-WRITE-GF-02.                                             IX2124.2
   000879         088200     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000880         088300 READ-TEST-F2-09.                                                 IX2124.2
   000881         088400     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000882         088500     MOVE "READ-TEST-F2-09" TO PAR-NAME.                          IX2124.2 141
   000883         088600     MOVE "RETRIEVED BY ALTERNATE KEY 2" TO RE-MARK.              IX2124.2 146
   000884         088700     MOVE "EEE075ALT02" TO IX-FS1-ALT02.                          IX2124.2 90
   000885         088800     READ IX-FS1 RECORD                                           IX2124.2 83
   000886         088900                      KEY IS IX-FS1-ALT02                         IX2124.2 90
   000887      1  089000       INVALID KEY  GO TO READ-INVALID-F2-09.                     IX2124.2 895
   000888         089100     IF IX-FS1-KEY = "AAA075"                                     IX2124.2 88
   000889      1  089200        PERFORM PASS                                              IX2124.2 313
   000890      1  089300        ELSE GO TO READ-FAIL-F2-09.                               IX2124.2 902
   000891         089400     GO TO READ-WRITE-F2-09.                                      IX2124.2 907
   000892         089500 READ-DELETE-F2-09.                                               IX2124.2
   000893         089600     PERFORM DE-LETE.                                             IX2124.2 315
   000894         089700     GO TO READ-WRITE-F2-09.                                      IX2124.2 907
   000895         089800 READ-INVALID-F2-09.                                              IX2124.2
   000896         089900     MOVE "IX-28; 4.5.2 F2, INVALID KEY CONDITION (IX-6) "        IX2124.2
   000897         090000           TO RE-MARK.                                            IX2124.2 146
   000898         090100     PERFORM FAIL.                                                IX2124.2 314
   000899         090200     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000900         090300     MOVE "EEE075ALT02" TO CORRECT-A.                             IX2124.2 166
   000901         090400     GO TO READ-WRITE-F2-09.                                      IX2124.2 907
   000902         090500 READ-FAIL-F2-09.                                                 IX2124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000903         090600     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2124.2 146
   000904         090700     PERFORM FAIL.                                                IX2124.2 314
   000905         090800     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000906         090900     MOVE "AAA075" TO CORRECT-A.                                  IX2124.2 166
   000907         091000 READ-WRITE-F2-09.                                                IX2124.2
   000908         091100     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000909         091200 REWRITE-TEST-GF-03.                                              IX2124.2
   000910         091300     MOVE "REWRITE...INVALID..." TO FEATURE.                      IX2124.2 137
   000911         091400     MOVE "REWRITE-TEST-GF-03" TO PAR-NAME.                       IX2124.2 141
   000912         091500     MOVE "INVALID KEY PATH SHOULD BE TAKEN" TO RE-MARK.          IX2124.2 146
   000913         091600     MOVE "EEE076ALT02" TO IX-FS1-ALT02.                          IX2124.2 90
   000914         091700     REWRITE IX-FS1-RECORD INVALID KEY                            IX2124.2 87
   000915      1  091800        PERFORM PASS                                              IX2124.2 313
   000916      1  091900        GO TO REWRITE-WRITE-GF-03.                                IX2124.2 927
   000917         092000     GO TO REWRITE-FAIL-GF-03.                                    IX2124.2 921
   000918         092100 REWRITE-DELETE-GF-03.                                            IX2124.2
   000919         092200     PERFORM DE-LETE.                                             IX2124.2 315
   000920         092300     GO TO REWRITE-WRITE-GF-03.                                   IX2124.2 927
   000921         092400 REWRITE-FAIL-GF-03.                                              IX2124.2
   000922         092500     MOVE "IX-33; 4.6.2 & INVALID KEY CONDITION (IX-6) PATH NOT BEIX2124.2
   000923         092600-      " TAKEN"   TO RE-MARK.                                     IX2124.2 146
   000924         092700     PERFORM FAIL.                                                IX2124.2 314
   000925         092800     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000926         092900     MOVE "INVALID KEY" TO CORRECT-A.                             IX2124.2 166
   000927         093000 REWRITE-WRITE-GF-03.                                             IX2124.2
   000928         093100     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000929         093200 READ-TEST-F2-10.                                                 IX2124.2
   000930         093300     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000931         093400     MOVE "READ-TEST-F2-10" TO PAR-NAME.                          IX2124.2 141
   000932         093500     MOVE "INVALID KEY PATH SHOULD BE TAKEN" TO RE-MARK.          IX2124.2 146
   000933         093600     MOVE "KKK018ALT05" TO IX-FS1-ALT05.                          IX2124.2 93
   000934         093700     READ IX-FS1 RECORD                                           IX2124.2 83
   000935         093800                      KEY IS IX-FS1-ALT05                         IX2124.2 93
   000936      1  093900       INVALID KEY  PERFORM PASS                                  IX2124.2 313
   000937      1  094000        GO TO READ-WRITE-F2-10.                                   IX2124.2 948
   000938         094100     GO TO READ-FAIL-F2-10.                                       IX2124.2 942
   000939         094200 READ-DELETE-F2-10.                                               IX2124.2
   000940         094300     PERFORM DE-LETE.                                             IX2124.2 315
   000941         094400     GO TO READ-WRITE-F2-10.                                      IX2124.2 948
   000942         094500 READ-FAIL-F2-10.                                                 IX2124.2
   000943         094600     MOVE "IX-28; 4.5.2 & INVALID KEY CONDITION (IX-6) PATH NOT BEIX2124.2
   000944         094700-      " TAKEN"   TO RE-MARK.                                     IX2124.2 146
   000945         094800     PERFORM FAIL.                                                IX2124.2 314
   000946         094900     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000947         095000     MOVE "INVALID KEY" TO CORRECT-A.                             IX2124.2 166
   000948         095100 READ-WRITE-F2-10.                                                IX2124.2
   000949         095200     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000950         095300 READ-TEST-F2-11.                                                 IX2124.2
   000951         095400     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000952         095500     MOVE "READ-TEST-F2-11"  TO PAR-NAME.                         IX2124.2 141
   000953         095600     MOVE "RETRIEVED BY ALTERNATE KEY 9" TO RE-MARK.              IX2124.2 146
   000954         095700     MOVE "SSSSSSALT09" TO IX-FS1-ALT09.                          IX2124.2 97
   000955         095800     READ IX-FS1 RECORD                                           IX2124.2 83
   000956         095900                      KEY IS IX-FS1-ALT09                         IX2124.2 97
   000957      1  096000        INVALID KEY GO TO READ-INVALID-F2-11.                     IX2124.2 965
   000958         096100     IF IX-FS1-KEY = "AAA019"                                     IX2124.2 88
   000959      1  096200        PERFORM PASS                                              IX2124.2 313
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000960      1  096300        ELSE GO TO READ-FAIL-F2-11.                               IX2124.2 972
   000961         096400     GO TO READ-WRITE-F2-11.                                      IX2124.2 977
   000962         096500 READ-DELETE-F2-11.                                               IX2124.2
   000963         096600     PERFORM DE-LETE.                                             IX2124.2 315
   000964         096700     GO TO READ-WRITE-F2-11.                                      IX2124.2 977
   000965         096800 READ-INVALID-F2-11.                                              IX2124.2
   000966         096900     MOVE "IX-28; 4.5.2 & INVALID KEY CONDITION (IX-6) PATH     BEIX2124.2
   000967         097000-      " TAKEN"   TO RE-MARK.                                     IX2124.2 146
   000968         097100     PERFORM FAIL.                                                IX2124.2 314
   000969         097200     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000970         097300     MOVE "SSSSSSALT09" TO CORRECT-A.                             IX2124.2 166
   000971         097400     GO TO READ-WRITE-F2-11.                                      IX2124.2 977
   000972         097500 READ-FAIL-F2-11.                                                 IX2124.2
   000973         097600     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2124.2 146
   000974         097700     PERFORM FAIL.                                                IX2124.2 314
   000975         097800     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   000976         097900     MOVE "AAA019" TO CORRECT-A.                                  IX2124.2 166
   000977         098000 READ-WRITE-F2-11.                                                IX2124.2
   000978         098100     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   000979         098200 READ-TEST-F2-12.                                                 IX2124.2
   000980         098300     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   000981         098400     MOVE "READ-TEST-F2-12" TO PAR-NAME.                          IX2124.2 141
   000982         098500     MOVE "RETRIEVED BY ALTERNATE KEY 7" TO RE-MARK.              IX2124.2 146
   000983         098600     MOVE "OOO026ALT07"  TO IX-FS1-ALT07.                         IX2124.2 95
   000984         098700     READ IX-FS1 RECORD                                           IX2124.2 83
   000985         098800                      KEY IS IX-FS1-ALT07                         IX2124.2 95
   000986      1  098900        INVALID KEY GO TO READ-INVALID-F2-12.                     IX2124.2 994
   000987         099000     IF IX-FS1-KEY = "AAA026"                                     IX2124.2 88
   000988      1  099100        PERFORM PASS                                              IX2124.2 313
   000989      1  099200        ELSE GO TO READ-FAIL-F2-12.                               IX2124.2 1001
   000990         099300     GO TO READ-WRITE-F2-12.                                      IX2124.2 1006
   000991         099400 READ-DELETE-F2-12.                                               IX2124.2
   000992         099500     PERFORM DE-LETE.                                             IX2124.2 315
   000993         099600     GO TO READ-WRITE-F2-12.                                      IX2124.2 1006
   000994         099700 READ-INVALID-F2-12.                                              IX2124.2
   000995         099800     MOVE "IX-28; 4.5.2 & INVALID KEY CONDITION (IX-6) PATH     BEIX2124.2
   000996         099900-      " TAKEN"   TO RE-MARK.                                     IX2124.2 146
   000997         100000     PERFORM FAIL.                                                IX2124.2 314
   000998         100100     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   000999         100200     MOVE "OOO026ALT07" TO CORRECT-A.                             IX2124.2 166
   001000         100300     GO TO READ-WRITE-F2-12.                                      IX2124.2 1006
   001001         100400 READ-FAIL-F2-12.                                                 IX2124.2
   001002         100500     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2124.2 146
   001003         100600     PERFORM FAIL.                                                IX2124.2 314
   001004         100700     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   001005         100800     MOVE "AAA026" TO CORRECT-A.                                  IX2124.2 166
   001006         100900 READ-WRITE-F2-12.                                                IX2124.2
   001007         101000     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   001008         101100 DELETE-TEST-GF-03.                                               IX2124.2
   001009         101200     MOVE "DELETE...RECORD" TO FEATURE.                           IX2124.2 137
   001010         101300     MOVE "DELETE-TEST-GF-03" TO PAR-NAME.                        IX2124.2 141
   001011         101400     MOVE "DELETES RECORD FOUND IN READ-TEST-F2-12" TO RE-MARK.   IX2124.2 146
   001012         101500     DELETE IX-FS1 RECORD INVALID KEY GO TO DELETE-FAIL-GF-03.    IX2124.2 83 1018
   001013         101600     PERFORM PASS.                                                IX2124.2 313
   001014         101700     GO TO DELETE-WRITE-GF-03.                                    IX2124.2 1024
   001015         101800 DELETE-DELETE-GF-03.                                             IX2124.2
   001016         101900     PERFORM DE-LETE.                                             IX2124.2 315
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001017         102000     GO TO DELETE-WRITE-GF-03.                                    IX2124.2 1024
   001018         102100 DELETE-FAIL-GF-03.                                               IX2124.2
   001019         102200     MOVE "IX-21; 4.3.2 & INVALID KEY CONDITION (IX-6) PATH     BEIX2124.2
   001020         102300-      " TAKEN"   TO RE-MARK.                                     IX2124.2 146
   001021         102400     PERFORM FAIL.                                                IX2124.2 314
   001022         102500     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2124.2 152
   001023         102600     MOVE "AAA026" TO CORRECT-A.                                  IX2124.2 166
   001024         102700 DELETE-WRITE-GF-03.                                              IX2124.2
   001025         102800     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   001026         102900 READ-TEST-F2-13.                                                 IX2124.2
   001027         103000     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2124.2 137
   001028         103100     MOVE "READ-TEST-F2-13" TO PAR-NAME.                          IX2124.2 141
   001029         103200     MOVE "INVALID KEY PATH SHOULD BE TAKEN" TO RE-MARK.          IX2124.2 146
   001030         103300     MOVE "KKK026ALT05" TO IX-FS1-ALT05.                          IX2124.2 93
   001031         103400     READ IX-FS1 RECORD                                           IX2124.2 83
   001032         103500                      KEY IS IX-FS1-ALT05                         IX2124.2 93
   001033      1  103600       INVALID KEY  PERFORM PASS                                  IX2124.2 313
   001034      1  103700        GO TO READ-WRITE-F2-13.                                   IX2124.2 1045
   001035         103800     GO TO READ-FAIL-F2-13.                                       IX2124.2 1039
   001036         103900 READ-DELETE-F2-13.                                               IX2124.2
   001037         104000     PERFORM DE-LETE.                                             IX2124.2 315
   001038         104100     GO TO READ-WRITE-F2-13.                                      IX2124.2 1045
   001039         104200 READ-FAIL-F2-13.                                                 IX2124.2
   001040         104300     MOVE "IX-28; 4.5.2 & INVALID KEY CONDITION (IX-6) PATH NOT BEIX2124.2
   001041         104400-      " TAKEN"   TO RE-MARK.                                     IX2124.2 146
   001042         104500     PERFORM FAIL.                                                IX2124.2 314
   001043         104600     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2124.2 88 152
   001044         104700     MOVE "INVALID KEY" TO CORRECT-A.                             IX2124.2 166
   001045         104800 READ-WRITE-F2-13.                                                IX2124.2
   001046         104900     PERFORM PRINT-DETAIL.                                        IX2124.2 317
   001047         105000     CLOSE IX-FS1.                                                IX2124.2 83
   001048         105100 CCVS-EXIT SECTION.                                               IX2124.2
   001049         105200 CCVS-999999.                                                     IX2124.2
   001050         105300     GO TO CLOSE-FILES.                                           IX2124.2 294
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    22
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      197   ANSI-REFERENCE . . . . . . . .  396 403 412
       79   C-ABORT. . . . . . . . . . . .  M282 M298
       73   C-ALL. . . . . . . . . . . . .  M300
       69   C-DATE . . . . . . . . . . . .  M284
       75   C-DELETED. . . . . . . . . . .  M302
       74   C-FAIL . . . . . . . . . . . .  M301
       78   C-INDENT
       76   C-INSPECT. . . . . . . . . . .  M303
       71   C-NO-OF-TESTS. . . . . . . . .  M283
       77   C-NOTE
       72   C-OK . . . . . . . . . . . . .  M299
       70   C-TIME . . . . . . . . . . . .  M285
      176   CCVS-C-1 . . . . . . . . . . .  335 381
      181   CCVS-C-2 . . . . . . . . . . .  336 382
      231   CCVS-E-1 . . . . . . . . . . .  341
      236   CCVS-E-2 . . . . . . . . . . .  350 357 364 369
      239   CCVS-E-2-2 . . . . . . . . . .  M349
      244   CCVS-E-3 . . . . . . . . . . .  370
      253   CCVS-E-4 . . . . . . . . . . .  349
      254   CCVS-E-4-1 . . . . . . . . . .  M347
      256   CCVS-E-4-2 . . . . . . . . . .  M348
      198   CCVS-H-1 . . . . . . . . . . .  330 377
      203   CCVS-H-2A. . . . . . . . . . .  331 378
      212   CCVS-H-2B. . . . . . . . . . .  332 379
      224   CCVS-H-3 . . . . . . . . . . .  333 380
      274   CCVS-PGM-ID. . . . . . . . . .  280 290 290 296
      158   CM-18V0
      152   COMPUTED-A . . . . . . . . . .  153 155 156 157 158 408 411 M467 M473 M501 M519 M542 M548 M567 M588 M611 M617
                                            M624 M647 M653 M660 M685 M691 M698 M723 M729 M736 M757 M780 M786 M809 M815 M832
                                            M851 M857 M876 M899 M905 M925 M946 M969 M975 M998 M1004 M1022 M1043
      153   COMPUTED-N
      151   COMPUTED-X . . . . . . . . . .  M325 393
      155   COMPUTED-0V18
      157   COMPUTED-14V4
      159   COMPUTED-18V0. . . . . . . . .  M443
      156   COMPUTED-4V14
      175   COR-ANSI-REFERENCE . . . . . .  M403 M405
      166   CORRECT-A. . . . . . . . . . .  167 168 169 170 171 409 411 M468 M474 M496 M502 M520 M543 M549 M568 M589 M612
                                            M618 M625 M648 M654 M661 M686 M692 M699 M724 M730 M737 M758 M781 M787 M810 M816
                                            M833 M852 M858 M877 M900 M906 M926 M947 M970 M976 M999 M1005 M1023 M1044
      167   CORRECT-N
      165   CORRECT-X. . . . . . . . . . .  M326 395
      168   CORRECT-0V18
      170   CORRECT-14V4
      172   CORRECT-18V0 . . . . . . . . .  M444
      169   CORRECT-4V14
      104   COUNTER00. . . . . . . . . . .  M424
      106   COUNTER01. . . . . . . . . . .  M424
      109   COUNTER02. . . . . . . . . . .  M424
      112   COUNTER03. . . . . . . . . . .  M425
      115   COUNTER04. . . . . . . . . . .  M425
      118   COUNTER05. . . . . . . . . . .  M425
      121   COUNTER06. . . . . . . . . . .  M425
      124   COUNTER07. . . . . . . . . . .  M425
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    23
0 Defined   Cross-reference of data names   References

0     127   COUNTER08. . . . . . . . . . .  M426
      130   COUNTER09. . . . . . . . . . .  M426
      133   COUNTER10. . . . . . . . . . .  M426
      171   CR-18V0
      189   DELETE-COUNTER . . . . . . . .  302 M315 344 360 362
      144   DOTVALUE . . . . . . . . . . .  M320
      195   DUMMY-HOLD . . . . . . . . . .  M374 384
       82   DUMMY-RECORD . . . . . . . . .  M330 M331 M332 M333 M335 M336 M337 M339 M341 M350 M357 M364 M369 M370 374 M375
                                            376 M377 M378 M379 M380 M381 M382 M383 M384 388 M389 M398 M413
      242   ENDER-DESC . . . . . . . . . .  M352 M363 M368
      190   ERROR-COUNTER. . . . . . . . .  301 M314 343 353 356
      194   ERROR-HOLD . . . . . . . . . .  300 M343 M344 M344 M345 348
      240   ERROR-TOTAL. . . . . . . . . .  M354 M356 M361 M362 M366 M367
      137   FEATURE. . . . . . . . . . . .  M430 M450 M478 M506 M524 M553 M572 M593 M629 M665 M703 M741 M762 M791 M820 M837
                                            M862 M881 M910 M930 M951 M980 M1009 M1027
      268   HYPHEN-LINE. . . . . . . . . .  337 339 383
      234   ID-AGAIN . . . . . . . . . . .  M290
      267   INF-ANSI-REFERENCE . . . . . .  M396 M399 M412 M414
      262   INFO-TEXT. . . . . . . . . . .  M397
      191   INSPECT-COUNTER. . . . . . . .  303 M312 343 365 367
      101   INVKEY-COUNTER . . . . . . . .  M428 433 443
       83   IX-FS1 . . . . . . . . . . . .  45 419 448 449 454 482 M509 528 576 597 600 633 636 669 672 707 710 745 766 795
                                            M823 840 885 934 955 984 M1012 1031 1047
       89   IX-FS1-ALT01 . . . . . . . . .  51 M453 455
       90   IX-FS1-ALT02 . . . . . . . . .  52 M884 886 M913
       91   IX-FS1-ALT03 . . . . . . . . .  53 M596 598
       92   IX-FS1-ALT04 . . . . . . . . .  54 M527 529 M556 M765 767
       93   IX-FS1-ALT05 . . . . . . . . .  55 M933 935 M1030 1032
       94   IX-FS1-ALT06 . . . . . . . . .  56 M632 634
       95   IX-FS1-ALT07 . . . . . . . . .  57 M983 985
       96   IX-FS1-ALT08 . . . . . . . . .  58 M481 483 M744 746
       97   IX-FS1-ALT09 . . . . . . . . .  59 M575 577 M865 M954 956
       98   IX-FS1-ALT10 . . . . . . . . .  60 M668 670 M706 708
       88   IX-FS1-KEY . . . . . . . . . .  50 457 473 485 501 531 548 588 601 624 637 660 674 698 712 736 757 769 786 M794
                                            796 798 815 841 857 888 905 925 946 958 975 987 1004 1043
       87   IX-FS1-RECORD. . . . . . . . .  M427 557 866 914
      139   P-OR-F . . . . . . . . . . . .  M312 M313 M314 M315 322 M325
      141   PAR-NAME . . . . . . . . . . .  M327 M431 M451 M479 M507 M525 M554 M573 M594 M630 M666 M704 M742 M763 M792 M821
                                            M838 M863 M882 M911 M931 M952 M981 M1010 M1028
      143   PARDOT-X . . . . . . . . . . .  M319
      192   PASS-COUNTER . . . . . . . . .  299 M313 345 347
       80   PRINT-FILE . . . . . . . . . .  43 289 307
       81   PRINT-REC. . . . . . . . . . .  M321 M402 M404
       65   RAW-DATA . . . . . . . . . . .  38 279 281 288 295 297 306
       68   RAW-DATA-KEY . . . . . . . . .  42 M280 M296
       67   RAW-DATA-SATZ. . . . . . . . .  286 304
      146   RE-MARK. . . . . . . . . . . .  M316 M328 M432 M441 M452 M466 M471 M480 M495 M499 M508 M517 M526 M540 M546 M555
                                            M565 M574 M586 M595 M609 M615 M622 M631 M645 M651 M658 M667 M683 M689 M696 M705
                                            M721 M727 M734 M743 M755 M764 M778 M784 M793 M807 M813 M822 M830 M839 M849 M855
                                            M864 M874 M883 M897 M903 M912 M923 M932 M944 M953 M967 M973 M982 M996 M1002 M1011
                                            M1020 M1029 M1041
      188   REC-CT . . . . . . . . . . . .  318 320 327
      187   REC-SKL-SUB
      196   RECORD-COUNT . . . . . . . . .  M372 373 M385
      100   RECORD-COUNTER . . . . . . . .  M420 421 424
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    24
0 Defined   Cross-reference of data names   References

0     147   TEST-COMPUTED. . . . . . . . .  402
      162   TEST-CORRECT . . . . . . . . .  404
      215   TEST-ID. . . . . . . . . . . .  M290
      135   TEST-RESULTS . . . . . . . . .  M291 321
      193   TOTAL-ERROR
      102   WORK-RECORD. . . . . . . . . .  427
      264   XXCOMPUTED . . . . . . . . . .  M411
      266   XXCORRECT. . . . . . . . . . .  M411
      259   XXINFO . . . . . . . . . . . .  398 413
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    25
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

      407   BAIL-OUT . . . . . . . . . . .  P324
      415   BAIL-OUT-EX. . . . . . . . . .  E324 G409
      410   BAIL-OUT-WRITE . . . . . . . .  G408
      390   BLANK-LINE-PRINT
     1048   CCVS-EXIT
     1049   CCVS-999999
      277   CCVS1
      416   CCVS1-EXIT . . . . . . . . . .  G293
      294   CLOSE-FILES. . . . . . . . . .  G1050
      334   COLUMN-NAMES-ROUTINE . . . . .  E292
      423   CREATE-IX-FS1. . . . . . . . .  P420
      315   DE-LETE. . . . . . . . . . . .  P438 P462 P490 P513 P536 P562 P582 P606 P642 P679 P717 P751 P774 P803 P827 P846
                                            P870 P893 P919 P940 P963 P992 P1016 P1037
      512   DELETE-DELETE-GF-01
      826   DELETE-DELETE-GF-02
     1015   DELETE-DELETE-GF-03
      829   DELETE-FAIL-GF-02. . . . . . .  G823
     1018   DELETE-FAIL-GF-03. . . . . . .  G1012
      515   DELETE-INVALID-GF-01 . . . . .  G509
      505   DELETE-TEST-GF-01
      819   DELETE-TEST-GF-02
     1008   DELETE-TEST-GF-03
      521   DELETE-WRITE-GF-01 . . . . . .  G511 G514
      834   DELETE-WRITE-GF-02 . . . . . .  G825 G828
     1024   DELETE-WRITE-GF-03 . . . . . .  G1014 G1017
      287   END-E-1. . . . . . . . . . . .  G281 G286
      305   END-E-2. . . . . . . . . . . .  G297 G304
      338   END-ROUTINE. . . . . . . . . .  P307
      342   END-ROUTINE-1
      351   END-ROUTINE-12
      359   END-ROUTINE-13 . . . . . . . .  E307
      340   END-RTN-EXIT
      314   FAIL . . . . . . . . . . . . .  P442 P465 P472 P493 P500 P518 P541 P547 P566 P587 P610 P616 P623 P646 P652 P659
                                            P684 P690 P697 P722 P728 P735 P756 P779 P785 P808 P814 P831 P850 P856 P875 P898
                                            P904 P924 P945 P968 P974 P997 P1003 P1021 P1042
      392   FAIL-ROUTINE . . . . . . . . .  P323
      406   FAIL-ROUTINE-EX. . . . . . . .  E323 G400
      401   FAIL-ROUTINE-WRITE . . . . . .  G394 G395
      329   HEAD-ROUTINE . . . . . . . . .  P292
      312   INSPT
      278   OPEN-FILES
      313   PASS . . . . . . . . . . . . .  P434 P458 P486 P510 P532 P559 P578 P602 P638 P675 P713 P747 P770 P799 P824 P842
                                            P867 P889 P915 P936 P959 P988 P1013 P1033
      317   PRINT-DETAIL . . . . . . . . .  P446 P476 P504 P522 P551 P570 P591 P627 P663 P701 P739 P760 P789 P818 P835 P860
                                            P879 P908 P928 P949 P978 P1007 P1025 P1046
      845   READ-DELETE-F1-08
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    26
0 Defined   Cross-reference of procedures   References

0     461   READ-DELETE-F2-01
      489   READ-DELETE-F2-02
      535   READ-DELETE-F2-03
      581   READ-DELETE-F2-04
      750   READ-DELETE-F2-05
      773   READ-DELETE-F2-06
      802   READ-DELETE-F2-07
      892   READ-DELETE-F2-09
      939   READ-DELETE-F2-10
      962   READ-DELETE-F2-11
      991   READ-DELETE-F2-12
     1036   READ-DELETE-F2-13
      848   READ-END-F1-08 . . . . . . . .  G840
      854   READ-FAIL-F1-08. . . . . . . .  G843
      470   READ-FAIL-F2-01. . . . . . . .  G459
      498   READ-FAIL-F2-02. . . . . . . .  G487
      545   READ-FAIL-F2-03. . . . . . . .  G533
      584   READ-FAIL-F2-04. . . . . . . .  G580
      753   READ-FAIL-F2-05. . . . . . . .  G749
      783   READ-FAIL-F2-06. . . . . . . .  G771
      812   READ-FAIL-F2-07. . . . . . . .  G800
      902   READ-FAIL-F2-09. . . . . . . .  G890
      942   READ-FAIL-F2-10. . . . . . . .  G938
      972   READ-FAIL-F2-11. . . . . . . .  G960
     1001   READ-FAIL-F2-12. . . . . . . .  G989
     1039   READ-FAIL-F2-13. . . . . . . .  G1035
      464   READ-INVALID-F2-01 . . . . . .  G456
      492   READ-INVALID-F2-02 . . . . . .  G484
      538   READ-INVALID-F2-03 . . . . . .  G530
      776   READ-INVALID-F2-06 . . . . . .  G768
      805   READ-INVALID-F2-07 . . . . . .  G797
      895   READ-INVALID-F2-09 . . . . . .  G887
      965   READ-INVALID-F2-11 . . . . . .  G957
      994   READ-INVALID-F2-12 . . . . . .  G986
      836   READ-TEST-F1-08
      447   READ-TEST-F2-01
      477   READ-TEST-F2-02
      523   READ-TEST-F2-03
      571   READ-TEST-F2-04
      740   READ-TEST-F2-05
      761   READ-TEST-F2-06
      790   READ-TEST-F2-07
      880   READ-TEST-F2-09
      929   READ-TEST-F2-10
      950   READ-TEST-F2-11
      979   READ-TEST-F2-12
     1026   READ-TEST-F2-13
      859   READ-WRITE-F1-08 . . . . . . .  G844 G847 G853
      475   READ-WRITE-F2-01 . . . . . . .  G460 G463 G469
      503   READ-WRITE-F2-02 . . . . . . .  G488 G491 G497
      550   READ-WRITE-F2-03 . . . . . . .  G534 G537 G544
      590   READ-WRITE-F2-04 . . . . . . .  G579 G583
      759   READ-WRITE-F2-05 . . . . . . .  G748 G752
      788   READ-WRITE-F2-06 . . . . . . .  G772 G775 G782
      817   READ-WRITE-F2-07 . . . . . . .  G801 G804 G811
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    27
0 Defined   Cross-reference of procedures   References

0     907   READ-WRITE-F2-09 . . . . . . .  G891 G894 G901
      948   READ-WRITE-F2-10 . . . . . . .  G937 G941
      977   READ-WRITE-F2-11 . . . . . . .  G961 G964 G971
     1006   READ-WRITE-F2-12 . . . . . . .  G990 G993 G1000
     1045   READ-WRITE-F2-13 . . . . . . .  G1034 G1038
      561   REWRITE-DELETE-GF-01
      869   REWRITE-DELETE-GF-02
      918   REWRITE-DELETE-GF-03
      872   REWRITE-FAIL-GF-02 . . . . . .  G866
      921   REWRITE-FAIL-GF-03 . . . . . .  G917
      564   REWRITE-INVALID-GF-01. . . . .  G558
      552   REWRITE-TEST-GF-01
      861   REWRITE-TEST-GF-02
      909   REWRITE-TEST-GF-03
      569   REWRITE-WRITE-GF-01. . . . . .  G560 G563
      878   REWRITE-WRITE-GF-02. . . . . .  G868 G871
      927   REWRITE-WRITE-GF-03. . . . . .  G916 G920
      605   START-DELETE-GF-01
      641   START-DELETE-GF-02
      678   START-DELETE-GF-03
      716   START-DELETE-GF-04
      614   START-END-GF-01. . . . . . . .  G600
      650   START-END-GF-02. . . . . . . .  G636
      688   START-END-GF-03. . . . . . . .  G673
      726   START-END-GF-04. . . . . . . .  G711
      620   START-FAIL-GF-01 . . . . . . .  G603
      656   START-FAIL-GF-02 . . . . . . .  G639
      694   START-FAIL-GF-03 . . . . . . .  G676
      732   START-FAIL-GF-04 . . . . . . .  G714
      608   START-INVALID-GF-01. . . . . .  G599
      644   START-INVALID-GF-02. . . . . .  G635
      681   START-INVALID-GF-03. . . . . .  G671
      719   START-INVALID-GF-04. . . . . .  G709
      592   START-TEST-GF-01
      628   START-TEST-GF-02
      664   START-TEST-GF-03
      702   START-TEST-GF-04
      626   START-WRITE-GF-01. . . . . . .  G604 G607 G613 G619
      662   START-WRITE-GF-02. . . . . . .  G640 G643 G649 G655
      700   START-WRITE-GF-03. . . . . . .  G677 G680 G687 G693
      738   START-WRITE-GF-04. . . . . . .  G715 G718 G725 G731
      310   TERMINATE-CALL
      308   TERMINATE-CCVS
      437   WRITE-DELETE-GF-01
      440   WRITE-FAIL-GF-01 . . . . . . .  G435
      418   WRITE-INIT-GF-01
      371   WRITE-LINE . . . . . . . . . .  P321 P322 P330 P331 P332 P333 P335 P336 P337 P339 P341 P350 P358 P364 P369 P370
                                            P398 P402 P404 P413
      429   WRITE-TEST-GF-01 . . . . . . .  G422
      445   WRITE-WRITE-GF-01. . . . . . .  G436 G439
      387   WRT-LN . . . . . . . . . . . .  P377 P378 P379 P380 P381 P382 P383 P386 P391
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    28
0 Defined   Cross-reference of programs     References

        3   IX212A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX212A    Date 06/04/2022  Time 12:00:04   Page    29
0LineID  Message code  Message text

     48  IGYDS1298-I   Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX044" was treated as comments.

     80  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     83  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX212A:
 *    Source records = 1050
 *    Data Division statements = 102
 *    Procedure Division statements = 642
 *    Generated COBOL statements = 0
 *    Program complexity factor = 649
0End of compilation 1,  program IX212A,  highest severity 0.
0Return code 0
