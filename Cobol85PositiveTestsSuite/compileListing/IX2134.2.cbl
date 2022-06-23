1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:50   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:50   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2134.2
   000002         000200 PROGRAM-ID.                                                      IX2134.2
   000003         000300     IX213A.                                                      IX2134.2
   000004         000500*                                                              *  IX2134.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2134.2
   000006         000700*                                                              *  IX2134.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2134.2
   000008         000900*                                                              *  IX2134.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2134.2
   000010         001100*                                                              *  IX2134.2
   000011         001300*                                                              *  IX2134.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IX2134.2
   000013         001500*                                                              *  IX2134.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IX2134.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IX2134.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IX2134.2
   000017         001900*                                                              *  IX2134.2
   000018         002100*    THIS PROGRAM CREATES A 100 RECORD FIXED LENGTH INDEXED FILE  IX2134.2
   000019         002200*    WHOSE  ACCESS  MODES  IS DYNAMIC AND CONTAINS 100 DUPLICATE  IX2134.2
   000020         002300*    ALTERNATE  KEYS.  THE  INDEXED  FILE  IS MANIPULATED BY THE  IX2134.2
   000021         002400*    DUPLICATE ALTERNATE KEYS USING THE FOLLOWING VERBS:          IX2134.2
   000022         002500*                                                                 IX2134.2
   000023         002600*            . DELETE                                             IX2134.2
   000024         002700*            . READ ... NEXT RECORD                               IX2134.2
   000025         002800*            . READ ... RECORD KEY                                IX2134.2
   000026         002900*            . REWRITE                                            IX2134.2
   000027         003000*            . START                                              IX2134.2
   000028         003100*                                                                 IX2134.2
   000029         003200 ENVIRONMENT DIVISION.                                            IX2134.2
   000030         003300 CONFIGURATION SECTION.                                           IX2134.2
   000031         003400 SOURCE-COMPUTER.                                                 IX2134.2
   000032         003500     XXXXX082.                                                    IX2134.2
   000033         003600 OBJECT-COMPUTER.                                                 IX2134.2
   000034         003700     XXXXX083.                                                    IX2134.2
   000035         003800 INPUT-OUTPUT SECTION.                                            IX2134.2
   000036         003900 FILE-CONTROL.                                                    IX2134.2
   000037         004000     SELECT RAW-DATA   ASSIGN TO                                  IX2134.2 64
   000038         004100     XXXXX062                                                     IX2134.2
   000039         004200            ORGANIZATION IS INDEXED                               IX2134.2
   000040         004300            ACCESS MODE IS RANDOM                                 IX2134.2
   000041         004400            RECORD KEY IS RAW-DATA-KEY.                           IX2134.2 67
   000042         004500     SELECT PRINT-FILE ASSIGN TO                                  IX2134.2 79
   000043         004600     XXXXX055.                                                    IX2134.2
   000044         004700     SELECT IX-FS1                                                IX2134.2 82
   000045         004800     ASSIGN TO                                                    IX2134.2
   000046         004900     XXXXX024                                                     IX2134.2
   000047         005000     XXXXX044                                                     IX2134.2

 ==000047==> IGYDS1298-I Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX044" was treated as comments.

   000048         005100     ACCESS MODE IS DYNAMIC                                       IX2134.2
   000049         005200     RECORD KEY IS IX-FS1-KEY                                     IX2134.2 87
   000050         005300     ALTERNATE RECORD KEY IS IX-FS1-ALT01 WITH DUPLICATES         IX2134.2 88
   000051         005400     ALTERNATE RECORD KEY IS IX-FS1-ALT02 WITH DUPLICATES         IX2134.2 89
   000052         005500     ALTERNATE RECORD KEY IS IX-FS1-ALT03 WITH DUPLICATES         IX2134.2 90
   000053         005600     ALTERNATE RECORD KEY IS IX-FS1-ALT04 WITH DUPLICATES         IX2134.2 91
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000054         005700     ALTERNATE RECORD KEY IS IX-FS1-ALT05 WITH DUPLICATES         IX2134.2 92
   000055         005800     ALTERNATE RECORD KEY IS IX-FS1-ALT06 WITH DUPLICATES         IX2134.2 93
   000056         005900     ALTERNATE RECORD KEY IS IX-FS1-ALT07 WITH DUPLICATES         IX2134.2 94
   000057         006000     ALTERNATE RECORD KEY IS IX-FS1-ALT08 WITH DUPLICATES         IX2134.2 95
   000058         006100     ALTERNATE RECORD KEY IS IX-FS1-ALT09 WITH DUPLICATES         IX2134.2 96
   000059         006200     ALTERNATE RECORD KEY IS IX-FS1-ALT10 WITH DUPLICATES         IX2134.2 97
   000060         006300     ORGANIZATION IS INDEXED.                                     IX2134.2
   000061         006400 DATA DIVISION.                                                   IX2134.2
   000062         006500 FILE SECTION.                                                    IX2134.2
   000063         006600                                                                  IX2134.2
   000064         006700 FD  RAW-DATA.                                                    IX2134.2
   000065         006800                                                                  IX2134.2
   000066         006900 01  RAW-DATA-SATZ.                                               IX2134.2
   000067         007000     05  RAW-DATA-KEY        PIC X(6).                            IX2134.2
   000068         007100     05  C-DATE              PIC 9(6).                            IX2134.2
   000069         007200     05  C-TIME              PIC 9(8).                            IX2134.2
   000070         007300     05  C-NO-OF-TESTS       PIC 99.                              IX2134.2
   000071         007400     05  C-OK                PIC 999.                             IX2134.2
   000072         007500     05  C-ALL               PIC 999.                             IX2134.2
   000073         007600     05  C-FAIL              PIC 999.                             IX2134.2
   000074         007700     05  C-DELETED           PIC 999.                             IX2134.2
   000075         007800     05  C-INSPECT           PIC 999.                             IX2134.2
   000076         007900     05  C-NOTE              PIC X(13).                           IX2134.2
   000077         008000     05  C-INDENT            PIC X.                               IX2134.2
   000078         008100     05  C-ABORT             PIC X(8).                            IX2134.2
   000079         008200 FD  PRINT-FILE.                                                  IX2134.2

 ==000079==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000080         008300 01  PRINT-REC PICTURE X(120).                                    IX2134.2
   000081         008400 01  DUMMY-RECORD PICTURE X(120).                                 IX2134.2
   000082         008500 FD  IX-FS1                                                       IX2134.2

 ==000082==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000083         008600     LABEL RECORDS ARE STANDARD                                   IX2134.2
   000084         008700     DATA RECORD IS IX-FS1-RECORD                                 IX2134.2 *
   000085         008800     RECORD CONTAINS 116 CHARACTERS.                              IX2134.2
   000086         008900 01  IX-FS1-RECORD.                                               IX2134.2
   000087         009000     02 IX-FS1-KEY                 PIC X(6).                      IX2134.2
   000088         009100     02 IX-FS1-ALT01               PIC X(11).                     IX2134.2
   000089         009200     02 IX-FS1-ALT02               PIC X(11).                     IX2134.2
   000090         009300     02 IX-FS1-ALT03               PIC X(11).                     IX2134.2
   000091         009400     02 IX-FS1-ALT04               PIC X(11).                     IX2134.2
   000092         009500     02 IX-FS1-ALT05               PIC X(11).                     IX2134.2
   000093         009600     02 IX-FS1-ALT06               PIC X(11).                     IX2134.2
   000094         009700     02 IX-FS1-ALT07               PIC X(11).                     IX2134.2
   000095         009800     02 IX-FS1-ALT08               PIC X(11).                     IX2134.2
   000096         009900     02 IX-FS1-ALT09               PIC X(11).                     IX2134.2
   000097         010000     02 IX-FS1-ALT10               PIC X(11).                     IX2134.2
   000098         010100 WORKING-STORAGE SECTION.                                         IX2134.2
   000099         010200 01  RECORD-COUNTER              PIC 999    VALUE ZEROS.          IX2134.2 IMP
   000100         010300 01  INVKEY-COUNTER              PIC 999    VALUE ZEROS.          IX2134.2 IMP
   000101         010400 01  WORK-RECORD.                                                 IX2134.2
   000102         010500     02 FILLER                   PIC XXX    VALUE "AAA".          IX2134.2
   000103         010600     02 COUNTER00                PIC 999.                         IX2134.2
   000104         010700     02 FILLER                   PIC XXX    VALUE "CCC".          IX2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000105         010800     02 COUNTER01                PIC 999.                         IX2134.2
   000106         010900     02 FILLER                   PIC X(5)   VALUE "ALT01".        IX2134.2
   000107         011000     02 FILLER                   PIC XXX    VALUE "EEE".          IX2134.2
   000108         011100     02 COUNTER02                PIC 999.                         IX2134.2
   000109         011200     02 FILLER                   PIC X(5)   VALUE "ALT02".        IX2134.2
   000110         011300     02 FILLER                   PIC XXX    VALUE "GGG".          IX2134.2
   000111         011400     02 COUNTER03                PIC 999.                         IX2134.2
   000112         011500     02 FILLER                   PIC X(5)   VALUE "ALT03".        IX2134.2
   000113         011600     02 FILLER                   PIC XXX    VALUE "III".          IX2134.2
   000114         011700     02 COUNTER04                PIC 999.                         IX2134.2
   000115         011800     02 FILLER                   PIC X(5)   VALUE "ALT04".        IX2134.2
   000116         011900     02 FILLER                   PIC XXX    VALUE "KKK".          IX2134.2
   000117         012000     02 COUNTER05                PIC 999.                         IX2134.2
   000118         012100     02 FILLER                   PIC X(5)   VALUE "ALT05".        IX2134.2
   000119         012200     02 FILLER                   PIC XXX    VALUE "MMM".          IX2134.2
   000120         012300     02 COUNTER06                PIC 999.                         IX2134.2
   000121         012400     02 FILLER                   PIC X(5)   VALUE "ALT06".        IX2134.2
   000122         012500     02 FILLER                   PIC XXX    VALUE "OOO".          IX2134.2
   000123         012600     02 COUNTER07                PIC 999.                         IX2134.2
   000124         012700     02 FILLER                   PIC X(5)   VALUE "ALT07".        IX2134.2
   000125         012800     02 FILLER                   PIC XXX    VALUE "QQQ".          IX2134.2
   000126         012900     02 COUNTER08                PIC 999.                         IX2134.2
   000127         013000     02 FILLER                   PIC X(5)   VALUE "ALT08".        IX2134.2
   000128         013100     02 FILLER                   PIC XXX    VALUE "SSS".          IX2134.2
   000129         013200     02 COUNTER09                PIC 999.                         IX2134.2
   000130         013300     02 FILLER                   PIC X(5)   VALUE "ALT09".        IX2134.2
   000131         013400     02 FILLER                   PIC XXX    VALUE "UUU".          IX2134.2
   000132         013500     02 COUNTER10                PIC 999.                         IX2134.2
   000133         013600     02 FILLER                   PIC X(5)   VALUE "ALT10".        IX2134.2
   000134         013700 01  TEST-RESULTS.                                                IX2134.2
   000135         013800     02 FILLER                   PIC X      VALUE SPACE.          IX2134.2 IMP
   000136         013900     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2134.2 IMP
   000137         014000     02 FILLER                   PIC X      VALUE SPACE.          IX2134.2 IMP
   000138         014100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2134.2 IMP
   000139         014200     02 FILLER                   PIC X      VALUE SPACE.          IX2134.2 IMP
   000140         014300     02  PAR-NAME.                                                IX2134.2
   000141         014400       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2134.2 IMP
   000142         014500       03  PARDOT-X              PIC X      VALUE SPACE.          IX2134.2 IMP
   000143         014600       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2134.2 IMP
   000144         014700     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2134.2 IMP
   000145         014800     02 RE-MARK                  PIC X(61).                       IX2134.2
   000146         014900 01  TEST-COMPUTED.                                               IX2134.2
   000147         015000     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2134.2 IMP
   000148         015100     02 FILLER                   PIC X(17)  VALUE                 IX2134.2
   000149         015200            "       COMPUTED=".                                   IX2134.2
   000150         015300     02 COMPUTED-X.                                               IX2134.2
   000151         015400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2134.2 IMP
   000152         015500     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2134.2 151
   000153         015600                                 PIC -9(9).9(9).                  IX2134.2
   000154         015700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2134.2 151
   000155         015800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2134.2 151
   000156         015900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2134.2 151
   000157         016000     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2134.2 151
   000158         016100         04 COMPUTED-18V0                    PIC -9(18).          IX2134.2
   000159         016200         04 FILLER                           PIC X.               IX2134.2
   000160         016300     03 FILLER PIC X(50) VALUE SPACE.                             IX2134.2 IMP
   000161         016400 01  TEST-CORRECT.                                                IX2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000162         016500     02 FILLER PIC X(30) VALUE SPACE.                             IX2134.2 IMP
   000163         016600     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2134.2
   000164         016700     02 CORRECT-X.                                                IX2134.2
   000165         016800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2134.2 IMP
   000166         016900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2134.2 165
   000167         017000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2134.2 165
   000168         017100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2134.2 165
   000169         017200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2134.2 165
   000170         017300     03      CR-18V0 REDEFINES CORRECT-A.                         IX2134.2 165
   000171         017400         04 CORRECT-18V0                     PIC -9(18).          IX2134.2
   000172         017500         04 FILLER                           PIC X.               IX2134.2
   000173         017600     03 FILLER PIC X(2) VALUE SPACE.                              IX2134.2 IMP
   000174         017700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2134.2 IMP
   000175         017800 01  CCVS-C-1.                                                    IX2134.2
   000176         017900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2134.2
   000177         018000-    "SS  PARAGRAPH-NAME                                          IX2134.2
   000178         018100-    "       REMARKS".                                            IX2134.2
   000179         018200     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2134.2 IMP
   000180         018300 01  CCVS-C-2.                                                    IX2134.2
   000181         018400     02 FILLER                     PIC X        VALUE SPACE.      IX2134.2 IMP
   000182         018500     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2134.2
   000183         018600     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2134.2 IMP
   000184         018700     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2134.2
   000185         018800     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2134.2 IMP
   000186         018900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2134.2 IMP
   000187         019000 01  REC-CT                        PIC 99       VALUE ZERO.       IX2134.2 IMP
   000188         019100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2134.2 IMP
   000189         019200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2134.2 IMP
   000190         019300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2134.2 IMP
   000191         019400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2134.2 IMP
   000192         019500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2134.2 IMP
   000193         019600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2134.2 IMP
   000194         019700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2134.2 IMP
   000195         019800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2134.2 IMP
   000196         019900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2134.2 IMP
   000197         020000 01  CCVS-H-1.                                                    IX2134.2
   000198         020100     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2134.2 IMP
   000199         020200     02  FILLER                    PIC X(42)    VALUE             IX2134.2
   000200         020300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2134.2
   000201         020400     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2134.2 IMP
   000202         020500 01  CCVS-H-2A.                                                   IX2134.2
   000203         020600   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2134.2 IMP
   000204         020700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2134.2
   000205         020800   02  FILLER                        PIC XXXX   VALUE             IX2134.2
   000206         020900     "4.2 ".                                                      IX2134.2
   000207         021000   02  FILLER                        PIC X(28)  VALUE             IX2134.2
   000208         021100            " COPY - NOT FOR DISTRIBUTION".                       IX2134.2
   000209         021200   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2134.2 IMP
   000210         021300                                                                  IX2134.2
   000211         021400 01  CCVS-H-2B.                                                   IX2134.2
   000212         021500   02  FILLER                        PIC X(15)  VALUE             IX2134.2
   000213         021600            "TEST RESULT OF ".                                    IX2134.2
   000214         021700   02  TEST-ID                       PIC X(9).                    IX2134.2
   000215         021800   02  FILLER                        PIC X(4)   VALUE             IX2134.2
   000216         021900            " IN ".                                               IX2134.2
   000217         022000   02  FILLER                        PIC X(12)  VALUE             IX2134.2
   000218         022100     " HIGH       ".                                              IX2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000219         022200   02  FILLER                        PIC X(22)  VALUE             IX2134.2
   000220         022300            " LEVEL VALIDATION FOR ".                             IX2134.2
   000221         022400   02  FILLER                        PIC X(58)  VALUE             IX2134.2
   000222         022500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2134.2
   000223         022600 01  CCVS-H-3.                                                    IX2134.2
   000224         022700     02  FILLER                      PIC X(34)  VALUE             IX2134.2
   000225         022800            " FOR OFFICIAL USE ONLY    ".                         IX2134.2
   000226         022900     02  FILLER                      PIC X(58)  VALUE             IX2134.2
   000227         023000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2134.2
   000228         023100     02  FILLER                      PIC X(28)  VALUE             IX2134.2
   000229         023200            "  COPYRIGHT   1985 ".                                IX2134.2
   000230         023300 01  CCVS-E-1.                                                    IX2134.2
   000231         023400     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2134.2 IMP
   000232         023500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2134.2
   000233         023600     02 ID-AGAIN                     PIC X(9).                    IX2134.2
   000234         023700     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2134.2 IMP
   000235         023800 01  CCVS-E-2.                                                    IX2134.2
   000236         023900     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2134.2 IMP
   000237         024000     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2134.2 IMP
   000238         024100     02 CCVS-E-2-2.                                               IX2134.2
   000239         024200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2134.2 IMP
   000240         024300         03 FILLER                   PIC X      VALUE SPACE.      IX2134.2 IMP
   000241         024400         03 ENDER-DESC               PIC X(44)  VALUE             IX2134.2
   000242         024500            "ERRORS ENCOUNTERED".                                 IX2134.2
   000243         024600 01  CCVS-E-3.                                                    IX2134.2
   000244         024700     02  FILLER                      PIC X(22)  VALUE             IX2134.2
   000245         024800            " FOR OFFICIAL USE ONLY".                             IX2134.2
   000246         024900     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2134.2 IMP
   000247         025000     02  FILLER                      PIC X(58)  VALUE             IX2134.2
   000248         025100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2134.2
   000249         025200     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2134.2 IMP
   000250         025300     02 FILLER                       PIC X(15)  VALUE             IX2134.2
   000251         025400             " COPYRIGHT 1985".                                   IX2134.2
   000252         025500 01  CCVS-E-4.                                                    IX2134.2
   000253         025600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2134.2 IMP
   000254         025700     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2134.2
   000255         025800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2134.2 IMP
   000256         025900     02 FILLER                       PIC X(40)  VALUE             IX2134.2
   000257         026000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2134.2
   000258         026100 01  XXINFO.                                                      IX2134.2
   000259         026200     02 FILLER                       PIC X(19)  VALUE             IX2134.2
   000260         026300            "*** INFORMATION ***".                                IX2134.2
   000261         026400     02 INFO-TEXT.                                                IX2134.2
   000262         026500       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2134.2 IMP
   000263         026600       04 XXCOMPUTED                 PIC X(20).                   IX2134.2
   000264         026700       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2134.2 IMP
   000265         026800       04 XXCORRECT                  PIC X(20).                   IX2134.2
   000266         026900     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2134.2
   000267         027000 01  HYPHEN-LINE.                                                 IX2134.2
   000268         027100     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2134.2 IMP
   000269         027200     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2134.2
   000270         027300-    "*****************************************".                 IX2134.2
   000271         027400     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2134.2
   000272         027500-    "******************************".                            IX2134.2
   000273         027600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2134.2
   000274         027700     "IX213A".                                                    IX2134.2
   000275         027800 PROCEDURE DIVISION.                                              IX2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000276         027900 CCVS1 SECTION.                                                   IX2134.2
   000277         028000 OPEN-FILES.                                                      IX2134.2
   000278         028100     OPEN I-O RAW-DATA.                                           IX2134.2 64
   000279         028200     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2134.2 273 67
   000280         028300     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2134.2 64 286
   000281         028400     MOVE "ABORTED " TO C-ABORT.                                  IX2134.2 78
   000282         028500     ADD 1 TO C-NO-OF-TESTS.                                      IX2134.2 70
   000283         028600     ACCEPT C-DATE  FROM DATE.                                    IX2134.2 68
   000284         028700     ACCEPT C-TIME  FROM TIME.                                    IX2134.2 69
   000285         028800     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2134.2 66 286
   000286         028900 END-E-1.                                                         IX2134.2
   000287         029000     CLOSE RAW-DATA.                                              IX2134.2 64
   000288         029100     OPEN    OUTPUT PRINT-FILE.                                   IX2134.2 79
   000289         029200     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2134.2 273 214 273 233
   000290         029300     MOVE    SPACE TO TEST-RESULTS.                               IX2134.2 IMP 134
   000291         029400     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2134.2 328 333
   000292         029500     GO TO CCVS1-EXIT.                                            IX2134.2 415
   000293         029600 CLOSE-FILES.                                                     IX2134.2
   000294         029700     OPEN I-O RAW-DATA.                                           IX2134.2 64
   000295         029800     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2134.2 273 67
   000296         029900     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2134.2 64 304
   000297         030000     MOVE "OK.     " TO C-ABORT.                                  IX2134.2 78
   000298         030100     MOVE PASS-COUNTER TO C-OK.                                   IX2134.2 191 71
   000299         030200     MOVE ERROR-HOLD   TO C-ALL.                                  IX2134.2 193 72
   000300         030300     MOVE ERROR-COUNTER TO C-FAIL.                                IX2134.2 189 73
   000301         030400     MOVE DELETE-COUNTER TO C-DELETED.                            IX2134.2 188 74
   000302         030500     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2134.2 190 75
   000303         030600     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2134.2 66 304
   000304         030700 END-E-2.                                                         IX2134.2
   000305         030800     CLOSE RAW-DATA.                                              IX2134.2 64
   000306         030900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2134.2 337 358 79
   000307         031000 TERMINATE-CCVS.                                                  IX2134.2
   000308         031100     EXIT PROGRAM.                                                IX2134.2
   000309         031200 TERMINATE-CALL.                                                  IX2134.2
   000310         031300     STOP     RUN.                                                IX2134.2
   000311         031400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2134.2 138 190
   000312         031500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2134.2 138 191
   000313         031600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2134.2 138 189
   000314         031700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2134.2 138 188
   000315         031800     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2134.2 145
   000316         031900 PRINT-DETAIL.                                                    IX2134.2
   000317         032000     IF REC-CT NOT EQUAL TO ZERO                                  IX2134.2 187 IMP
   000318      1  032100             MOVE "." TO PARDOT-X                                 IX2134.2 142
   000319      1  032200             MOVE REC-CT TO DOTVALUE.                             IX2134.2 187 143
   000320         032300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2134.2 134 80 370
   000321         032400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2134.2 138 370
   000322      1  032500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2134.2 391 405
   000323      1  032600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2134.2 406 414
   000324         032700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2134.2 IMP 138 IMP 150
   000325         032800     MOVE SPACE TO CORRECT-X.                                     IX2134.2 IMP 164
   000326         032900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2134.2 187 IMP IMP 140
   000327         033000     MOVE     SPACE TO RE-MARK.                                   IX2134.2 IMP 145
   000328         033100 HEAD-ROUTINE.                                                    IX2134.2
   000329         033200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2134.2 197 81 370
   000330         033300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2134.2 202 81 370
   000331         033400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2134.2 211 81 370
   000332         033500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2134.2 223 81 370
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000333         033600 COLUMN-NAMES-ROUTINE.                                            IX2134.2
   000334         033700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2134.2 175 81 370
   000335         033800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2134.2 180 81 370
   000336         033900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2134.2 267 81 370
   000337         034000 END-ROUTINE.                                                     IX2134.2
   000338         034100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2134.2 267 81 370
   000339         034200 END-RTN-EXIT.                                                    IX2134.2
   000340         034300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2134.2 230 81 370
   000341         034400 END-ROUTINE-1.                                                   IX2134.2
   000342         034500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2134.2 189 193 190
   000343         034600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2134.2 193 188 193
   000344         034700      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2134.2 191 193
   000345         034800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2134.2
   000346         034900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2134.2 191 253
   000347         035000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2134.2 193 255
   000348         035100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2134.2 252 238
   000349         035200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2134.2 235 81 370
   000350         035300  END-ROUTINE-12.                                                 IX2134.2
   000351         035400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2134.2 241
   000352         035500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2134.2 189 IMP
   000353      1  035600         MOVE "NO " TO ERROR-TOTAL                                IX2134.2 239
   000354         035700         ELSE                                                     IX2134.2
   000355      1  035800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2134.2 189 239
   000356         035900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2134.2 235 81
   000357         036000     PERFORM WRITE-LINE.                                          IX2134.2 370
   000358         036100 END-ROUTINE-13.                                                  IX2134.2
   000359         036200     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2134.2 188 IMP
   000360      1  036300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2134.2 239
   000361      1  036400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2134.2 188 239
   000362         036500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2134.2 241
   000363         036600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2134.2 235 81 370
   000364         036700      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2134.2 190 IMP
   000365      1  036800          MOVE "NO " TO ERROR-TOTAL                               IX2134.2 239
   000366      1  036900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2134.2 190 239
   000367         037000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2134.2 241
   000368         037100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2134.2 235 81 370
   000369         037200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2134.2 243 81 370
   000370         037300 WRITE-LINE.                                                      IX2134.2
   000371         037400     ADD 1 TO RECORD-COUNT.                                       IX2134.2 195
   000372         037500     IF RECORD-COUNT GREATER 42                                   IX2134.2 195
   000373      1  037600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2134.2 81 194
   000374      1  037700         MOVE SPACE TO DUMMY-RECORD                               IX2134.2 IMP 81
   000375      1  037800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2134.2 81
   000376      1  037900         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2134.2 197 81 386
   000377      1  038000         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2134.2 202 81 386
   000378      1  038100         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2134.2 211 81 386
   000379      1  038200         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2134.2 223 81 386
   000380      1  038300         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2134.2 175 81 386
   000381      1  038400         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2134.2 180 81 386
   000382      1  038500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2134.2 267 81 386
   000383      1  038600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2134.2 194 81
   000384      1  038700         MOVE ZERO TO RECORD-COUNT.                               IX2134.2 IMP 195
   000385         038800     PERFORM WRT-LN.                                              IX2134.2 386
   000386         038900 WRT-LN.                                                          IX2134.2
   000387         039000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2134.2 81
   000388         039100     MOVE SPACE TO DUMMY-RECORD.                                  IX2134.2 IMP 81
   000389         039200 BLANK-LINE-PRINT.                                                IX2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000390         039300     PERFORM WRT-LN.                                              IX2134.2 386
   000391         039400 FAIL-ROUTINE.                                                    IX2134.2
   000392         039500     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2134.2 150 IMP
   000393      1  039600            GO TO   FAIL-ROUTINE-WRITE.                           IX2134.2 400
   000394         039700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2134.2 164 IMP 400
   000395         039800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2134.2 196 266
   000396         039900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2134.2 261
   000397         040000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2134.2 258 81 370
   000398         040100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2134.2 IMP 266
   000399         040200     GO TO  FAIL-ROUTINE-EX.                                      IX2134.2 405
   000400         040300 FAIL-ROUTINE-WRITE.                                              IX2134.2
   000401         040400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2134.2 146 80 370
   000402         040500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2134.2 196 174
   000403         040600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2134.2 161 80 370
   000404         040700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2134.2 IMP 174
   000405         040800 FAIL-ROUTINE-EX. EXIT.                                           IX2134.2
   000406         040900 BAIL-OUT.                                                        IX2134.2
   000407         041000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2134.2 151 IMP 409
   000408         041100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2134.2 165 IMP 414
   000409         041200 BAIL-OUT-WRITE.                                                  IX2134.2
   000410         041300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2134.2 165 265 151 263
   000411         041400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2134.2 196 266
   000412         041500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2134.2 258 81 370
   000413         041600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2134.2 IMP 266
   000414         041700 BAIL-OUT-EX. EXIT.                                               IX2134.2
   000415         041800 CCVS1-EXIT.                                                      IX2134.2
   000416         041900     EXIT.                                                        IX2134.2
   000417         042000 WRITE-INIT-GF-01.                                                IX2134.2
   000418         042100     OPEN OUTPUT IX-FS1.                                          IX2134.2 82
   000419         042200     PERFORM CREATE-IX-FS1 VARYING RECORD-COUNTER FROM 1 BY 1     IX2134.2 421 99
   000420         042300        UNTIL RECORD-COUNTER IS GREATER THAN 100.                 IX2134.2 99
   000421         042400 CREATE-IX-FS1.                                                   IX2134.2
   000422         042500     MOVE RECORD-COUNTER TO COUNTER00, COUNTER01, COUNTER02,      IX2134.2 99 103 105 108
   000423         042600        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2134.2 111 114 117 120 123
   000424         042700        COUNTER08, COUNTER09, COUNTER10.                          IX2134.2 126 129 132
   000425         042800     IF RECORD-COUNTER = 011 MOVE 010 TO COUNTER01, COUNTER02,    IX2134.2 99 105 108
   000426         042900        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2134.2 111 114 117 120 123
   000427         043000        COUNTER08, COUNTER09, COUNTER10.                          IX2134.2 126 129 132
   000428         043100     IF RECORD-COUNTER = 021 MOVE 020 TO COUNTER01, COUNTER02,    IX2134.2 99 105 108
   000429         043200        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2134.2 111 114 117 120 123
   000430         043300        COUNTER08, COUNTER09, COUNTER10.                          IX2134.2 126 129 132
   000431         043400     IF RECORD-COUNTER = 031 MOVE 030 TO COUNTER01, COUNTER02,    IX2134.2 99 105 108
   000432         043500        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2134.2 111 114 117 120 123
   000433         043600        COUNTER08, COUNTER09, COUNTER10.                          IX2134.2 126 129 132
   000434         043700     IF RECORD-COUNTER = 041 MOVE 040 TO COUNTER01, COUNTER02,    IX2134.2 99 105 108
   000435         043800        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2134.2 111 114 117 120 123
   000436         043900        COUNTER08, COUNTER09, COUNTER10.                          IX2134.2 126 129 132
   000437         044000     IF RECORD-COUNTER = 051 MOVE 050 TO COUNTER01, COUNTER02,    IX2134.2 99 105 108
   000438         044100        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2134.2 111 114 117 120 123
   000439         044200        COUNTER08, COUNTER09, COUNTER10.                          IX2134.2 126 129 132
   000440         044300     IF RECORD-COUNTER = 061 MOVE 060 TO COUNTER01, COUNTER02,    IX2134.2 99 105 108
   000441         044400        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2134.2 111 114 117 120 123
   000442         044500        COUNTER08, COUNTER09, COUNTER10.                          IX2134.2 126 129 132
   000443         044600     IF RECORD-COUNTER = 071 MOVE 070 TO COUNTER01, COUNTER02,    IX2134.2 99 105 108
   000444         044700        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2134.2 111 114 117 120 123
   000445         044800        COUNTER08, COUNTER09, COUNTER10.                          IX2134.2 126 129 132
   000446         044900     IF RECORD-COUNTER = 081 MOVE 080 TO COUNTER01, COUNTER02,    IX2134.2 99 105 108
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000447         045000        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2134.2 111 114 117 120 123
   000448         045100        COUNTER08, COUNTER09, COUNTER10.                          IX2134.2 126 129 132
   000449         045200     IF RECORD-COUNTER = 091 MOVE 090 TO COUNTER01, COUNTER02,    IX2134.2 99 105 108
   000450         045300        COUNTER03, COUNTER04, COUNTER05, COUNTER06, COUNTER07,    IX2134.2 111 114 117 120 123
   000451         045400        COUNTER08, COUNTER09, COUNTER10.                          IX2134.2 126 129 132
   000452         045500     WRITE IX-FS1-RECORD FROM WORK-RECORD INVALID KEY             IX2134.2 86 101
   000453      1  045600        ADD 1 TO INVKEY-COUNTER.                                  IX2134.2 100
   000454         045700 WRITE-TEST-GD-01.                                                IX2134.2
   000455         045800     MOVE "WRITE INVALID KEY" TO FEATURE.                         IX2134.2 136
   000456         045900     MOVE "WRITE-TEST-GF-01" TO PAR-NAME.                         IX2134.2 140
   000457         046000     MOVE "CREATE IX-FS1" TO RE-MARK.                             IX2134.2 145
   000458         046100     IF INVKEY-COUNTER = 0                                        IX2134.2 100
   000459      1  046200        PERFORM PASS                                              IX2134.2 312
   000460      1  046300        ELSE GO TO WRITE-FAIL-GF-01.                              IX2134.2 465
   000461         046400     GO TO WRITE-WRITE-GF-01.                                     IX2134.2 470
   000462         046500 INDEX-DELETE-1.                                                  IX2134.2
   000463         046600     PERFORM DE-LETE.                                             IX2134.2 314
   000464         046700     GO TO WRITE-WRITE-GF-01.                                     IX2134.2 470
   000465         046800 WRITE-FAIL-GF-01.                                                IX2134.2
   000466         046900     MOVE "IX-41; 4.9.2, FILE NOT CREATED CORRECTLY" TO RE-MARK.  IX2134.2 145
   000467         047000     PERFORM FAIL.                                                IX2134.2 313
   000468         047100     MOVE INVKEY-COUNTER TO COMPUTED-18V0.                        IX2134.2 100 158
   000469         047200     MOVE 0 TO CORRECT-18V0.                                      IX2134.2 171
   000470         047300 WRITE-WRITE-GF-01.                                               IX2134.2
   000471         047400     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000472         047500 READ-TEST-F2-01.                                                 IX2134.2
   000473         047600     CLOSE IX-FS1.                                                IX2134.2 82
   000474         047700     OPEN I-O IX-FS1.                                             IX2134.2 82
   000475         047800     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000476         047900     MOVE "READ-TEST-F2-01" TO PAR-NAME.                          IX2134.2 140
   000477         048000     MOVE "RETRIEVED BY ALTERNATE KEY 1" TO RE-MARK.              IX2134.2 145
   000478         048100     MOVE "CCC050ALT01" TO IX-FS1-ALT01.                          IX2134.2 88
   000479         048200     READ IX-FS1 RECORD                                           IX2134.2 82
   000480         048300                        KEY IS IX-FS1-ALT01                       IX2134.2 88
   000481      1  048400       INVALID KEY  GO TO READ-INVALID-F2-01.                     IX2134.2 489
   000482         048500     IF IX-FS1-KEY = "AAA050"                                     IX2134.2 87
   000483      1  048600        PERFORM PASS                                              IX2134.2 312
   000484      1  048700        ELSE GO TO READ-FAIL-F2-01.                               IX2134.2 496
   000485         048800     GO TO READ-WRITE-F2-01.                                      IX2134.2 501
   000486         048900 READ-DELETE-F2-01.                                               IX2134.2
   000487         049000     PERFORM DE-LETE.                                             IX2134.2 314
   000488         049100     GO TO READ-WRITE-F2-01.                                      IX2134.2 501
   000489         049200 READ-INVALID-F2-01.                                              IX2134.2
   000490         049300     MOVE "IX-28; 4.5.2 AND IX-6 1.3.5 INVALID KEY PATH TAKEN"    IX2134.2
   000491         049400            TO RE-MARK.                                           IX2134.2 145
   000492         049500     PERFORM FAIL.                                                IX2134.2 313
   000493         049600     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000494         049700     MOVE "CCC050ALT01" TO CORRECT-A.                             IX2134.2 165
   000495         049800     GO TO READ-WRITE-F2-01.                                      IX2134.2 501
   000496         049900 READ-FAIL-F2-01.                                                 IX2134.2
   000497         050000     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000498         050100     PERFORM FAIL.                                                IX2134.2 313
   000499         050200     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000500         050300     MOVE "AAA050" TO CORRECT-A.                                  IX2134.2 165
   000501         050400 READ-WRITE-F2-01.                                                IX2134.2
   000502         050500     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000503         050600 READ-TEST-F2-02.                                                 IX2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000504         050700     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000505         050800     MOVE "READ-TEST-F2-02"  TO PAR-NAME.                         IX2134.2 140
   000506         050900     MOVE "RETRIEVED BY ALTERNATE KEY 8" TO RE-MARK.              IX2134.2 145
   000507         051000     MOVE "QQQ040ALT08" TO IX-FS1-ALT08.                          IX2134.2 95
   000508         051100     READ IX-FS1 RECORD                                           IX2134.2 82
   000509         051200                        KEY IS IX-FS1-ALT08                       IX2134.2 95
   000510      1  051300       INVALID KEY  GO TO READ-INVALID-F2-02.                     IX2134.2 518
   000511         051400     IF IX-FS1-KEY = "AAA040"                                     IX2134.2 87
   000512      1  051500        PERFORM PASS                                              IX2134.2 312
   000513      1  051600        ELSE GO TO READ-FAIL-F2-02.                               IX2134.2 525
   000514         051700     GO TO READ-WRITE-F2-02.                                      IX2134.2 530
   000515         051800 READ-DELETE-F2-02.                                               IX2134.2
   000516         051900     PERFORM DE-LETE.                                             IX2134.2 314
   000517         052000     GO TO READ-WRITE-F2-02.                                      IX2134.2 530
   000518         052100 READ-INVALID-F2-02.                                              IX2134.2
   000519         052200     MOVE "IX-28; 4.5.2 AND IX-6 1.3.5 INVALID KEY PATH TAKEN"    IX2134.2
   000520         052300            TO RE-MARK.                                           IX2134.2 145
   000521         052400     PERFORM FAIL.                                                IX2134.2 313
   000522         052500     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000523         052600     MOVE "QQQ040ALT08" TO CORRECT-A.                             IX2134.2 165
   000524         052700     GO TO READ-WRITE-F2-02.                                      IX2134.2 530
   000525         052800 READ-FAIL-F2-02.                                                 IX2134.2
   000526         052900     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000527         053000     PERFORM FAIL.                                                IX2134.2 313
   000528         053100     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000529         053200     MOVE "AAA040" TO CORRECT-A.                                  IX2134.2 165
   000530         053300 READ-WRITE-F2-02.                                                IX2134.2
   000531         053400     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000532         053500 DELETE-TEST-GF-01.                                               IX2134.2
   000533         053600     MOVE "DELETE...RECORD" TO FEATURE.                           IX2134.2 136
   000534         053700     MOVE "DELETE-TEST-GF-01" TO PAR-NAME.                        IX2134.2 140
   000535         053800     MOVE "DELETES RECORD FOUND IN READ-TEST-GF-02" TO RE-MARK.   IX2134.2 145
   000536         053900     DELETE IX-FS1 RECORD INVALID KEY GO TO DELETE-INVALID-GF-01. IX2134.2 82 542
   000537         054000     PERFORM PASS.                                                IX2134.2 312
   000538         054100     GO TO DELETE-WRITE-GF-01.                                    IX2134.2 548
   000539         054200 DELETE-DELETE-GF-01.                                             IX2134.2
   000540         054300     PERFORM DE-LETE.                                             IX2134.2 314
   000541         054400     GO TO DELETE-WRITE-GF-01.                                    IX2134.2 548
   000542         054500 DELETE-INVALID-GF-01.                                            IX2134.2
   000543         054600     MOVE "IX-21; 4.3.2 AND IX-6 1.3.5 INVALID KEY PATH TAKEN"    IX2134.2
   000544         054700            TO RE-MARK.                                           IX2134.2 145
   000545         054800     PERFORM FAIL.                                                IX2134.2 313
   000546         054900     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000547         055000     MOVE "AAA040" TO CORRECT-A.                                  IX2134.2 165
   000548         055100 DELETE-WRITE-GF-01.                                              IX2134.2
   000549         055200     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000550         055300 READ-TEST-F2-03.                                                 IX2134.2
   000551         055400     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000552         055500     MOVE "READ-TEST-F2-03"  TO PAR-NAME.                         IX2134.2 140
   000553         055600     MOVE "RETRIEVED BY ALTERNATE KEY 4" TO RE-MARK.              IX2134.2 145
   000554         055700     MOVE "III030ALT04" TO IX-FS1-ALT04.                          IX2134.2 91
   000555         055800     READ IX-FS1 RECORD                                           IX2134.2 82
   000556         055900                        KEY IS IX-FS1-ALT04                       IX2134.2 91
   000557      1  056000       INVALID KEY  GO TO READ-INVALID-F2-03.                     IX2134.2 565
   000558         056100     IF IX-FS1-KEY = "AAA030"                                     IX2134.2 87
   000559      1  056200        PERFORM PASS                                              IX2134.2 312
   000560      1  056300        ELSE GO TO READ-FAIL-F2-03.                               IX2134.2 572
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000561         056400     GO TO READ-WRITE-F2-03.                                      IX2134.2 577
   000562         056500 READ-DELETE-F2-03.                                               IX2134.2
   000563         056600     PERFORM DE-LETE.                                             IX2134.2 314
   000564         056700     GO TO READ-WRITE-F2-03.                                      IX2134.2 577
   000565         056800 READ-INVALID-F2-03.                                              IX2134.2
   000566         056900     MOVE "IX-28; 4.5.2 AND IX-6 1.3.5 INVALID KEY PATH TAKEN"    IX2134.2
   000567         057000            TO RE-MARK.                                           IX2134.2 145
   000568         057100     PERFORM FAIL.                                                IX2134.2 313
   000569         057200     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000570         057300     MOVE "III030ALT04" TO CORRECT-A.                             IX2134.2 165
   000571         057400     GO TO READ-WRITE-F2-03.                                      IX2134.2 577
   000572         057500 READ-FAIL-F2-03.                                                 IX2134.2
   000573         057600     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000574         057700     PERFORM FAIL.                                                IX2134.2 313
   000575         057800     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000576         057900     MOVE "AAA030" TO CORRECT-A.                                  IX2134.2 165
   000577         058000 READ-WRITE-F2-03.                                                IX2134.2
   000578         058100     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000579         058200 REWRITE-TEST-GF-01.                                              IX2134.2
   000580         058300     MOVE "REWRITE...INVALID..." TO FEATURE.                      IX2134.2 136
   000581         058400     MOVE "REWRITE-TEST-GF-01" TO PAR-NAME.                       IX2134.2 140
   000582         058500     MOVE "REWRITE-S RECORD FOUND IN READ-TEST-F2-03" TO RE-MARK. IX2134.2 145
   000583         058600     MOVE "IIIIIIALT04" TO IX-FS1-ALT04.                          IX2134.2 91
   000584         058700     REWRITE IX-FS1-RECORD INVALID KEY                            IX2134.2 86
   000585      1  058800              GO TO REWRITE-INVALID-GF-01.                        IX2134.2 591
   000586         058900     PERFORM PASS.                                                IX2134.2 312
   000587         059000     GO TO REWRITE-WRITE-GF-01.                                   IX2134.2 597
   000588         059100 REWRITE-DELETE-GF-01.                                            IX2134.2
   000589         059200     PERFORM DE-LETE.                                             IX2134.2 314
   000590         059300     GO TO REWRITE-WRITE-GF-01.                                   IX2134.2 597
   000591         059400 REWRITE-INVALID-GF-01.                                           IX2134.2
   000592         059500     MOVE "IX-33; 4.6.2 AND IX-6 1.3.5 INVALID KEY PATH TAKEN"    IX2134.2
   000593         059600            TO RE-MARK.                                           IX2134.2 145
   000594         059700     PERFORM FAIL.                                                IX2134.2 313
   000595         059800     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000596         059900     MOVE "IIIIIIALT04" TO CORRECT-A.                             IX2134.2 165
   000597         060000 REWRITE-WRITE-GF-01.                                             IX2134.2
   000598         060100     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000599         060200 READ-TEST-F2-04.                                                 IX2134.2
   000600         060300     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000601         060400     MOVE "READ-TEST-F2-04"  TO PAR-NAME.                         IX2134.2 140
   000602         060500     MOVE "INVALID KEY PATH SHOULD BE TAKEN" TO RE-MARK.          IX2134.2 145
   000603         060600     MOVE "ZZZ999ALT09" TO IX-FS1-ALT09.                          IX2134.2 96
   000604         060700     READ IX-FS1 RECORD                                           IX2134.2 82
   000605         060800                        KEY IS IX-FS1-ALT09                       IX2134.2 96
   000606      1  060900       INVALID KEY  PERFORM PASS                                  IX2134.2 312
   000607      1  061000        GO TO READ-WRITE-F2-04.                                   IX2134.2 618
   000608         061100     GO TO READ-FAIL-F2-04.                                       IX2134.2 612
   000609         061200 READ-DELETE-F2-04.                                               IX2134.2
   000610         061300     PERFORM DE-LETE.                                             IX2134.2 314
   000611         061400     GO TO READ-WRITE-F2-04.                                      IX2134.2 618
   000612         061500 READ-FAIL-F2-04.                                                 IX2134.2
   000613         061600     MOVE "IX-28; 4.5.2 & IX-6 1.3.5 INVALID KEY SHOULD BE TAKEN" IX2134.2
   000614         061700            TO RE-MARK.                                           IX2134.2 145
   000615         061800     PERFORM FAIL.                                                IX2134.2 313
   000616         061900     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000617         062000     MOVE "INVALID KEY" TO CORRECT-A.                             IX2134.2 165
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000618         062100 READ-WRITE-F2-04.                                                IX2134.2
   000619         062200     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000620         062300 START-TEST-GF-01.                                                IX2134.2
   000621         062400     MOVE "START...KEY IS EQUAL"    TO FEATURE.                   IX2134.2 136
   000622         062500     MOVE "START-TEST-GF-01" TO PAR-NAME.                         IX2134.2 140
   000623         062600     MOVE "RETRIEVED BY ALTERNATE KEY 3" TO RE-MARK.              IX2134.2 145
   000624         062700     MOVE "GGG020ALT03" TO IX-FS1-ALT03.                          IX2134.2 90
   000625         062800     START IX-FS1                                                 IX2134.2 82
   000626         062900                  KEY IS EQUAL TO IX-FS1-ALT03                    IX2134.2 90
   000627      1  063000       INVALID KEY  GO TO START-INVALID-GF-01.                    IX2134.2 636
   000628         063100     READ IX-FS1 NEXT RECORD AT END GO TO START-END-GF-01.        IX2134.2 82 643
   000629         063200     IF IX-FS1-KEY = "AAA020"                                     IX2134.2 87
   000630      1  063300        PERFORM PASS                                              IX2134.2 312
   000631      1  063400        ELSE GO TO START-FAIL-GF-01.                              IX2134.2 649
   000632         063500     GO TO START-WRITE-GF-01.                                     IX2134.2 654
   000633         063600 START-DELETE-GF-01.                                              IX2134.2
   000634         063700     PERFORM DE-LETE.                                             IX2134.2 314
   000635         063800     GO TO START-WRITE-GF-01.                                     IX2134.2 654
   000636         063900 START-INVALID-GF-01.                                             IX2134.2
   000637         064000     MOVE "IX-36; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000638         064100            TO RE-MARK.                                           IX2134.2 145
   000639         064200     PERFORM FAIL.                                                IX2134.2 313
   000640         064300     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000641         064400     MOVE "GGG020ALT03" TO CORRECT-A.                             IX2134.2 165
   000642         064500     GO TO START-WRITE-GF-01.                                     IX2134.2 654
   000643         064600 START-END-GF-01.                                                 IX2134.2
   000644         064700     MOVE "IX-28; 4.5.2 F1, READ AT END NOT EXPECTED" TO RE-MARK. IX2134.2 145
   000645         064800     PERFORM FAIL.                                                IX2134.2 313
   000646         064900     MOVE "FILE IS AT END" TO COMPUTED-A.                         IX2134.2 151
   000647         065000     MOVE "AAA020" TO CORRECT-A.                                  IX2134.2 165
   000648         065100     GO TO START-WRITE-GF-01.                                     IX2134.2 654
   000649         065200 START-FAIL-GF-01.                                                IX2134.2
   000650         065300     PERFORM FAIL.                                                IX2134.2 313
   000651         065400     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000652         065500     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000653         065600     MOVE "AAA020" TO CORRECT-A.                                  IX2134.2 165
   000654         065700 START-WRITE-GF-01.                                               IX2134.2
   000655         065800     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000656         065900 START-TEST-GF-02.                                                IX2134.2
   000657         066000     MOVE "START...KEY >" TO FEATURE.                             IX2134.2 136
   000658         066100     MOVE "START-TEST-GF-02" TO PAR-NAME.                         IX2134.2 140
   000659         066200     MOVE "RETRIEVED BY ALTERNATE KEY 6" TO RE-MARK.              IX2134.2 145
   000660         066300     MOVE "MMM090ALT06" TO IX-FS1-ALT06.                          IX2134.2 93
   000661         066400     START IX-FS1                                                 IX2134.2 82
   000662         066500                  KEY > IX-FS1-ALT06                              IX2134.2 93
   000663      1  066600       INVALID KEY  GO TO START-INVALID-GF-02.                    IX2134.2 672
   000664         066700     READ IX-FS1 NEXT RECORD AT END GO TO START-END-GF-02.        IX2134.2 82 679
   000665         066800     IF IX-FS1-KEY = "AAA092"                                     IX2134.2 87
   000666      1  066900        PERFORM PASS                                              IX2134.2 312
   000667      1  067000        ELSE GO TO START-INVALID-GF-02.                           IX2134.2 672
   000668         067100     GO TO START-WRITE-GF-02.                                     IX2134.2 690
   000669         067200 START-DELETE-GF-02.                                              IX2134.2
   000670         067300     PERFORM DE-LETE.                                             IX2134.2 314
   000671         067400     GO TO START-WRITE-GF-02.                                     IX2134.2 690
   000672         067500 START-INVALID-GF-02.                                             IX2134.2
   000673         067600     MOVE "IX-36; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000674         067700            TO RE-MARK.                                           IX2134.2 145
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000675         067800     PERFORM FAIL.                                                IX2134.2 313
   000676         067900     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000677         068000     MOVE "MMM090ALT09" TO CORRECT-A.                             IX2134.2 165
   000678         068100     GO TO START-WRITE-GF-02.                                     IX2134.2 690
   000679         068200 START-END-GF-02.                                                 IX2134.2
   000680         068300     MOVE "IX-28; 4.5.2 F1, READ AT END NOT EXPECTED" TO RE-MARK. IX2134.2 145
   000681         068400     PERFORM FAIL.                                                IX2134.2 313
   000682         068500     MOVE "FILE IS AT END" TO COMPUTED-A.                         IX2134.2 151
   000683         068600     MOVE "AAA092" TO CORRECT-A.                                  IX2134.2 165
   000684         068700     GO TO START-WRITE-GF-02.                                     IX2134.2 690
   000685         068800 START-FAIL-GF-02.                                                IX2134.2
   000686         068900     MOVE "IX-28; 4.5.2 F1, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000687         069000     PERFORM FAIL.                                                IX2134.2 313
   000688         069100     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000689         069200     MOVE "AAA092" TO CORRECT-A.                                  IX2134.2 165
   000690         069300 START-WRITE-GF-02.                                               IX2134.2
   000691         069400     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000692         069500 START-TEST-GF-03.                                                IX2134.2
   000693         069600     MOVE "START...KEY >" TO FEATURE.                             IX2134.2 136
   000694         069700     MOVE "START-TEST-GF-03" TO PAR-NAME.                         IX2134.2 140
   000695         069800     MOVE "RETRIEVED BY ALTERNATE KEY 10" TO RE-MARK.             IX2134.2 145
   000696         069900     MOVE "UUU080ALT10" TO IX-FS1-ALT10.                          IX2134.2 97
   000697         070000     START IX-FS1                                                 IX2134.2 82
   000698         070100                  KEY > IX-FS1-ALT10                              IX2134.2 97
   000699      1  070200       INVALID KEY  GO TO START-INVALID-GF-03.                    IX2134.2 708
   000700         070300     READ IX-FS1 NEXT RECORD AT END GO TO START-END-GF-03.        IX2134.2 82 715
   000701         070400     IF IX-FS1-KEY = "AAA082"                                     IX2134.2 87
   000702      1  070500        PERFORM PASS                                              IX2134.2 312
   000703      1  070600        ELSE GO TO START-FAIL-GF-03.                              IX2134.2 721
   000704         070700     GO TO START-WRITE-GF-03.                                     IX2134.2 726
   000705         070800 START-DELETE-GF-03.                                              IX2134.2
   000706         070900     PERFORM DE-LETE.                                             IX2134.2 314
   000707         071000     GO TO START-WRITE-GF-03.                                     IX2134.2 726
   000708         071100 START-INVALID-GF-03.                                             IX2134.2
   000709         071200     MOVE "IX-36; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000710         071300            TO RE-MARK.                                           IX2134.2 145
   000711         071400     PERFORM FAIL.                                                IX2134.2 313
   000712         071500     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000713         071600     MOVE "UUU080ALT10" TO CORRECT-A.                             IX2134.2 165
   000714         071700     GO TO START-WRITE-GF-03.                                     IX2134.2 726
   000715         071800 START-END-GF-03.                                                 IX2134.2
   000716         071900     MOVE "IX-28; 4.5.2 F1, READ AT END NOT EXPECTED" TO RE-MARK. IX2134.2 145
   000717         072000     PERFORM FAIL.                                                IX2134.2 313
   000718         072100     MOVE "FILE IS AT END" TO COMPUTED-A.                         IX2134.2 151
   000719         072200     MOVE "AAA082" TO CORRECT-A.                                  IX2134.2 165
   000720         072300     GO TO START-WRITE-GF-03.                                     IX2134.2 726
   000721         072400 START-FAIL-GF-03.                                                IX2134.2
   000722         072500     MOVE "IX-28; 4.5.2 F1, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000723         072600     PERFORM FAIL.                                                IX2134.2 313
   000724         072700     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000725         072800     MOVE "AAA082" TO CORRECT-A.                                  IX2134.2 165
   000726         072900 START-WRITE-GF-03.                                               IX2134.2
   000727         073000     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000728         073100 READ-TEST-F2-05.                                                 IX2134.2
   000729         073200     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000730         073300     MOVE "READ-TEST-F2-05"  TO PAR-NAME.                         IX2134.2 140
   000731         073400     MOVE "RETRIEVED BY ALTERNATE KEY 8" TO RE-MARK.              IX2134.2 145
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000732         073500     MOVE "QQQ040ALT08" TO IX-FS1-ALT08.                          IX2134.2 95
   000733         073600     READ IX-FS1 RECORD                                           IX2134.2 82
   000734         073700                        KEY IS IX-FS1-ALT08                       IX2134.2 95
   000735      1  073800       INVALID KEY  GO TO READ-INVALID-F2-05.                     IX2134.2 743
   000736         073900     IF IX-FS1-KEY = "AAA041"                                     IX2134.2 87
   000737      1  074000        PERFORM PASS                                              IX2134.2 312
   000738      1  074100        ELSE GO TO READ-FAIL-F2-05.                               IX2134.2 750
   000739         074200     GO TO READ-WRITE-F2-05.                                      IX2134.2 755
   000740         074300 READ-DELETE-F2-05.                                               IX2134.2
   000741         074400     PERFORM DE-LETE.                                             IX2134.2 314
   000742         074500     GO TO READ-WRITE-F2-05.                                      IX2134.2 755
   000743         074600 READ-INVALID-F2-05.                                              IX2134.2
   000744         074700     MOVE "IX-28; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000745         074800            TO RE-MARK.                                           IX2134.2 145
   000746         074900     PERFORM FAIL.                                                IX2134.2 313
   000747         075000     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000748         075100     MOVE "QQQ040ALT08" TO CORRECT-A.                             IX2134.2 165
   000749         075200     GO TO READ-WRITE-F2-05.                                      IX2134.2 755
   000750         075300 READ-FAIL-F2-05.                                                 IX2134.2
   000751         075400     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000752         075500     PERFORM FAIL.                                                IX2134.2 313
   000753         075600     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000754         075700     MOVE "AAA041" TO CORRECT-A.                                  IX2134.2 165
   000755         075800 READ-WRITE-F2-05.                                                IX2134.2
   000756         075900     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000757         076000 READ-TEST-F2-06.                                                 IX2134.2
   000758         076100     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000759         076200     MOVE "READ-TEST-F2-06" TO PAR-NAME.                          IX2134.2 140
   000760         076300     MOVE "RETRIEVED BY ALTERNATE KEY 4" TO RE-MARK.              IX2134.2 145
   000761         076400     MOVE "IIIIIIALT04" TO IX-FS1-ALT04.                          IX2134.2 91
   000762         076500     READ IX-FS1 RECORD                                           IX2134.2 82
   000763         076600                        KEY IS IX-FS1-ALT04                       IX2134.2 91
   000764      1  076700       INVALID KEY  GO TO READ-INVALID-F2-06.                     IX2134.2 772
   000765         076800     IF IX-FS1-KEY = "AAA030"                                     IX2134.2 87
   000766      1  076900        PERFORM PASS                                              IX2134.2 312
   000767      1  077000        ELSE GO TO READ-FAIL-F2-06.                               IX2134.2 779
   000768         077100     GO TO READ-WRITE-F2-06.                                      IX2134.2 784
   000769         077200 READ-DELETE-F2-06.                                               IX2134.2
   000770         077300     PERFORM DE-LETE.                                             IX2134.2 314
   000771         077400     GO TO READ-WRITE-F2-06.                                      IX2134.2 784
   000772         077500 READ-INVALID-F2-06.                                              IX2134.2
   000773         077600     MOVE "IX-28; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000774         077700            TO RE-MARK.                                           IX2134.2 145
   000775         077800     PERFORM FAIL.                                                IX2134.2 313
   000776         077900     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000777         078000     MOVE "IIIIIIALT04" TO CORRECT-A.                             IX2134.2 165
   000778         078100     GO TO READ-WRITE-F2-06.                                      IX2134.2 784
   000779         078200 READ-FAIL-F2-06.                                                 IX2134.2
   000780         078300     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000781         078400     PERFORM FAIL.                                                IX2134.2 313
   000782         078500     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000783         078600     MOVE "AAA030" TO CORRECT-A.                                  IX2134.2 165
   000784         078700 READ-WRITE-F2-06.                                                IX2134.2
   000785         078800     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000786         078900 READ-TEST-F2-07.                                                 IX2134.2
   000787         079000     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000788         079100     MOVE "READ-TEST-F2-07"  TO PAR-NAME.                         IX2134.2 140
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000789         079200     MOVE "RETRIEVED BY PRIMARY KEY" TO RE-MARK.                  IX2134.2 145
   000790         079300     MOVE "AAA011" TO IX-FS1-KEY.                                 IX2134.2 87
   000791         079400     READ IX-FS1 RECORD                                           IX2134.2 82
   000792         079500                        KEY IS IX-FS1-KEY                         IX2134.2 87
   000793      1  079600       INVALID KEY  GO TO READ-INVALID-F2-07.                     IX2134.2 801
   000794         079700     IF IX-FS1-KEY = "AAA011"                                     IX2134.2 87
   000795      1  079800        PERFORM PASS                                              IX2134.2 312
   000796      1  079900        ELSE GO TO READ-FAIL-F2-07.                               IX2134.2 808
   000797         080000     GO TO READ-WRITE-F2-07.                                      IX2134.2 813
   000798         080100 READ-DELETE-F2-07.                                               IX2134.2
   000799         080200     PERFORM DE-LETE.                                             IX2134.2 314
   000800         080300     GO TO READ-WRITE-F2-07.                                      IX2134.2 813
   000801         080400 READ-INVALID-F2-07.                                              IX2134.2
   000802         080500     MOVE "IX-28; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000803         080600            TO RE-MARK.                                           IX2134.2 145
   000804         080700     PERFORM FAIL.                                                IX2134.2 313
   000805         080800     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000806         080900     MOVE "AAA011" TO CORRECT-A.                                  IX2134.2 165
   000807         081000     GO TO READ-WRITE-F2-07.                                      IX2134.2 813
   000808         081100 READ-FAIL-F2-07.                                                 IX2134.2
   000809         081200     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000810         081300     PERFORM FAIL.                                                IX2134.2 313
   000811         081400     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000812         081500     MOVE "AAA011" TO CORRECT-A.                                  IX2134.2 165
   000813         081600 READ-WRITE-F2-07.                                                IX2134.2
   000814         081700     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000815         081800 DELETE-TEST-GF-02.                                               IX2134.2
   000816         081900     MOVE "DELETE...RECORD" TO FEATURE.                           IX2134.2 136
   000817         082000     MOVE "DELETE-TEST-GF-02" TO PAR-NAME.                        IX2134.2 140
   000818         082100     MOVE "DELETES RECORD FOUND IN READ-TEST-F2-07" TO RE-MARK.   IX2134.2 145
   000819         082200     DELETE IX-FS1 RECORD INVALID KEY GO TO DELETE-FAIL-GF-02.    IX2134.2 82 825
   000820         082300     PERFORM PASS.                                                IX2134.2 312
   000821         082400     GO TO DELETE-WRITE-GF-02.                                    IX2134.2 831
   000822         082500 DELETE-DELETE-GF-02.                                             IX2134.2
   000823         082600     PERFORM DE-LETE.                                             IX2134.2 314
   000824         082700     GO TO DELETE-WRITE-GF-02.                                    IX2134.2 831
   000825         082800 DELETE-FAIL-GF-02.                                               IX2134.2
   000826         082900     MOVE "IX-21; 4.3.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000827         083000            TO RE-MARK.                                           IX2134.2 145
   000828         083100     PERFORM FAIL.                                                IX2134.2 313
   000829         083200     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000830         083300     MOVE "AAA011" TO CORRECT-A.                                  IX2134.2 165
   000831         083400 DELETE-WRITE-GF-02.                                              IX2134.2
   000832         083500     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000833         083600 READ-TEST-F2-08.                                                 IX2134.2
   000834         083700     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000835         083800     MOVE "READ-TEST-F2-08"  TO PAR-NAME.                         IX2134.2 140
   000836         083900     MOVE "RETRIEVED BY ALTERNATE KEY 9" TO RE-MARK.              IX2134.2 145
   000837         084000     MOVE "SSS060ALT09" TO IX-FS1-ALT09.                          IX2134.2 96
   000838         084100     READ IX-FS1 RECORD                                           IX2134.2 82
   000839         084200                        KEY IS IX-FS1-ALT09                       IX2134.2 96
   000840      1  084300       INVALID KEY  GO TO READ-INVALID-F2-08.                     IX2134.2 848
   000841         084400     IF IX-FS1-KEY = "AAA060"                                     IX2134.2 87
   000842      1  084500        PERFORM PASS                                              IX2134.2 312
   000843      1  084600        ELSE GO TO READ-FAIL-F2-08.                               IX2134.2 855
   000844         084700     GO TO READ-WRITE-F2-08.                                      IX2134.2 860
   000845         084800 READ-DELETE-F2-08.                                               IX2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000846         084900     PERFORM DE-LETE.                                             IX2134.2 314
   000847         085000     GO TO READ-WRITE-F2-08.                                      IX2134.2 860
   000848         085100 READ-INVALID-F2-08.                                              IX2134.2
   000849         085200     MOVE "IX-28; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000850         085300            TO RE-MARK.                                           IX2134.2 145
   000851         085400     PERFORM FAIL.                                                IX2134.2 313
   000852         085500     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000853         085600     MOVE "AAA060" TO CORRECT-A.                                  IX2134.2 165
   000854         085700     GO TO READ-WRITE-F2-08.                                      IX2134.2 860
   000855         085800 READ-FAIL-F2-08.                                                 IX2134.2
   000856         085900     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000857         086000     PERFORM FAIL.                                                IX2134.2 313
   000858         086100     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000859         086200     MOVE "AAA060" TO CORRECT-A.                                  IX2134.2 165
   000860         086300 READ-WRITE-F2-08.                                                IX2134.2
   000861         086400     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000862         086500 REWRITE-TEST-GF-02.                                              IX2134.2
   000863         086600     MOVE "REWRITE...INVALID..." TO FEATURE.                      IX2134.2 136
   000864         086700     MOVE "REWRITE-TEST-GF-02" TO PAR-NAME.                       IX2134.2 140
   000865         086800     MOVE "REWRITES RECORD FOUND IN READ-TEST-GF-08" TO RE-MARK.  IX2134.2 145
   000866         086900     MOVE "SSSSSSALT09" TO IX-FS1-ALT09.                          IX2134.2 96
   000867         087000     REWRITE IX-FS1-RECORD INVALID KEY GO TO REWRITE-FAIL-GF-02.  IX2134.2 86 873
   000868         087100     PERFORM PASS.                                                IX2134.2 312
   000869         087200     GO TO REWRITE-WRITE-GF-02.                                   IX2134.2 877
   000870         087300 REWRITE-DELETE-GF-02.                                            IX2134.2
   000871         087400     PERFORM DE-LETE.                                             IX2134.2 314
   000872         087500     GO TO REWRITE-WRITE-GF-02.                                   IX2134.2 877
   000873         087600 REWRITE-FAIL-GF-02.                                              IX2134.2
   000874         087700     PERFORM FAIL.                                                IX2134.2 313
   000875         087800     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000876         087900     MOVE "SSSSSSALT09" TO CORRECT-A.                             IX2134.2 165
   000877         088000 REWRITE-WRITE-GF-02.                                             IX2134.2
   000878         088100     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000879         088200 READ-TEST-F2-09.                                                 IX2134.2
   000880         088300     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000881         088400     MOVE "READ-TEST-F2-09"  TO PAR-NAME.                         IX2134.2 140
   000882         088500     MOVE "RETRIEVED BY ALTERNATE KEY 5" TO RE-MARK.              IX2134.2 145
   000883         088600     MOVE "KKK010ALT05" TO IX-FS1-ALT05.                          IX2134.2 92
   000884         088700     READ IX-FS1 RECORD                                           IX2134.2 82
   000885         088800                        KEY IS IX-FS1-ALT05                       IX2134.2 92
   000886      1  088900       INVALID KEY  GO TO READ-INVALID-F2-09.                     IX2134.2 894
   000887         089000     IF IX-FS1-KEY = "AAA010"                                     IX2134.2 87
   000888      1  089100        PERFORM PASS                                              IX2134.2 312
   000889      1  089200        ELSE GO TO READ-FAIL-F2-09.                               IX2134.2 901
   000890         089300     GO TO READ-WRITE-F2-09.                                      IX2134.2 906
   000891         089400 READ-DELETE-F2-09.                                               IX2134.2
   000892         089500     PERFORM DE-LETE.                                             IX2134.2 314
   000893         089600     GO TO READ-WRITE-F2-09.                                      IX2134.2 906
   000894         089700 READ-INVALID-F2-09.                                              IX2134.2
   000895         089800     MOVE "IX-28; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000896         089900            TO RE-MARK.                                           IX2134.2 145
   000897         090000     PERFORM FAIL.                                                IX2134.2 313
   000898         090100     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000899         090200     MOVE "KKK010ALT05" TO CORRECT-A.                             IX2134.2 165
   000900         090300     GO TO READ-WRITE-F2-09.                                      IX2134.2 906
   000901         090400 READ-FAIL-F2-09.                                                 IX2134.2
   000902         090500     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000903         090600     PERFORM FAIL.                                                IX2134.2 313
   000904         090700     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000905         090800     MOVE "AAA010" TO CORRECT-A.                                  IX2134.2 165
   000906         090900 READ-WRITE-F2-09.                                                IX2134.2
   000907         091000     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000908         091100 READ-TEST-F2-10.                                                 IX2134.2
   000909         091200     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000910         091300     MOVE "READ-TEST-F2-10" TO PAR-NAME.                          IX2134.2 140
   000911         091400     MOVE "RETRIEVED BY ALTERNATE KEY 9" TO RE-MARK.              IX2134.2 145
   000912         091500     MOVE "SSS060ALT09" TO IX-FS1-ALT09.                          IX2134.2 96
   000913         091600     READ IX-FS1 RECORD                                           IX2134.2 82
   000914         091700                        KEY IS IX-FS1-ALT09                       IX2134.2 96
   000915      1  091800       INVALID KEY  GO TO READ-INVALID-F2-10.                     IX2134.2 923
   000916         091900     IF IX-FS1-KEY = "AAA061"                                     IX2134.2 87
   000917      1  092000        PERFORM PASS                                              IX2134.2 312
   000918      1  092100        ELSE GO TO READ-FAIL-F2-10.                               IX2134.2 930
   000919         092200     GO TO READ-WRITE-F2-10.                                      IX2134.2 935
   000920         092300 READ-DELETE-F2-10.                                               IX2134.2
   000921         092400     PERFORM DE-LETE.                                             IX2134.2 314
   000922         092500     GO TO READ-WRITE-F2-10.                                      IX2134.2 935
   000923         092600 READ-INVALID-F2-10.                                              IX2134.2
   000924         092700     MOVE "IX-28; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000925         092800            TO RE-MARK.                                           IX2134.2 145
   000926         092900     PERFORM FAIL.                                                IX2134.2 313
   000927         093000     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000928         093100     MOVE "SSS060ALT09" TO CORRECT-A.                             IX2134.2 165
   000929         093200     GO TO READ-WRITE-F2-10.                                      IX2134.2 935
   000930         093300 READ-FAIL-F2-10.                                                 IX2134.2
   000931         093400     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000932         093500     PERFORM FAIL.                                                IX2134.2 313
   000933         093600     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000934         093700     MOVE "AAA061" TO CORRECT-A.                                  IX2134.2 165
   000935         093800 READ-WRITE-F2-10.                                                IX2134.2
   000936         093900     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000937         094000 READ-TEST-F2-11.                                                 IX2134.2
   000938         094100     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000939         094200     MOVE "READ-TEST-F2-11"   TO PAR-NAME.                        IX2134.2 140
   000940         094300     MOVE "RETRIEVED BY ALTERNATE KEY 7" TO RE-MARK.              IX2134.2 145
   000941         094400     MOVE "OOO070ALT07"  TO IX-FS1-ALT07.                         IX2134.2 94
   000942         094500     READ IX-FS1 RECORD                                           IX2134.2 82
   000943         094600                        KEY IS IX-FS1-ALT07                       IX2134.2 94
   000944      1  094700       INVALID KEY  GO TO READ-INVALID-F2-11.                     IX2134.2 952
   000945         094800     IF IX-FS1-KEY = "AAA070"                                     IX2134.2 87
   000946      1  094900        PERFORM PASS                                              IX2134.2 312
   000947      1  095000        ELSE GO TO READ-FAIL-F2-11.                               IX2134.2 959
   000948         095100     GO TO READ-WRITE-F2-11.                                      IX2134.2 964
   000949         095200 READ-DELETE-F2-11.                                               IX2134.2
   000950         095300     PERFORM DE-LETE.                                             IX2134.2 314
   000951         095400     GO TO READ-WRITE-F2-11.                                      IX2134.2 964
   000952         095500 READ-INVALID-F2-11.                                              IX2134.2
   000953         095600     MOVE "IX-28; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000954         095700            TO RE-MARK.                                           IX2134.2 145
   000955         095800     PERFORM FAIL.                                                IX2134.2 313
   000956         095900     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000957         096000     MOVE "OOO070ALT07" TO CORRECT-A.                             IX2134.2 165
   000958         096100     GO TO READ-WRITE-F2-11.                                      IX2134.2 964
   000959         096200 READ-FAIL-F2-11.                                                 IX2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000960         096300     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   000961         096400     PERFORM FAIL.                                                IX2134.2 313
   000962         096500     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   000963         096600     MOVE "AAA070" TO CORRECT-A.                                  IX2134.2 165
   000964         096700 READ-WRITE-F2-11.                                                IX2134.2
   000965         096800     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000966         096900 DELETE-TEST-GF-03.                                               IX2134.2
   000967         097000     MOVE "DELETE...RECORD" TO FEATURE.                           IX2134.2 136
   000968         097100     MOVE "DELETE-TEST-GF-03" TO PAR-NAME.                        IX2134.2 140
   000969         097200     MOVE "DELETES RECORD FOUND IN READ-TEST-F2-11" TO RE-MARK.   IX2134.2 145
   000970         097300     DELETE IX-FS1 RECORD INVALID KEY GO TO DELETE-FAIL-GF-03.    IX2134.2 82 976
   000971         097400     PERFORM PASS.                                                IX2134.2 312
   000972         097500     GO TO DELETE-WRITE-GF-03.                                    IX2134.2 982
   000973         097600 DELETE-DELETE-GF-03.                                             IX2134.2
   000974         097700     PERFORM DE-LETE.                                             IX2134.2 314
   000975         097800     GO TO DELETE-WRITE-GF-03.                                    IX2134.2 982
   000976         097900 DELETE-FAIL-GF-03.                                               IX2134.2
   000977         098000     MOVE "IX-21; 4.3.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   000978         098100            TO RE-MARK.                                           IX2134.2 145
   000979         098200     PERFORM FAIL.                                                IX2134.2 313
   000980         098300     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   000981         098400     MOVE "AAA070" TO CORRECT-A.                                  IX2134.2 165
   000982         098500 DELETE-WRITE-GF-03.                                              IX2134.2
   000983         098600     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   000984         098700 READ-TEST-F2-12.                                                 IX2134.2
   000985         098800     MOVE "READ...RECORD KEY" TO FEATURE.                         IX2134.2 136
   000986         098900     MOVE "READ-TEST-F2-12" TO PAR-NAME.                          IX2134.2 140
   000987         099000     MOVE "RETRIEVED BY ALTERNATE KEY 5" TO RE-MARK.              IX2134.2 145
   000988         099100     MOVE "KKK070ALT05" TO IX-FS1-ALT05.                          IX2134.2 92
   000989         099200     READ IX-FS1 RECORD                                           IX2134.2 82
   000990         099300                        KEY IS IX-FS1-ALT05                       IX2134.2 92
   000991      1  099400       INVALID KEY  GO TO READ-INVALID-F2-12.                     IX2134.2 999
   000992         099500     IF IX-FS1-KEY = "AAA071"                                     IX2134.2 87
   000993      1  099600        PERFORM PASS                                              IX2134.2 312
   000994      1  099700        ELSE GO TO READ-FAIL-F2-12.                               IX2134.2 1006
   000995         099800     GO TO READ-WRITE-F2-12.                                      IX2134.2 1011
   000996         099900 READ-DELETE-F2-12.                                               IX2134.2
   000997         100000     PERFORM DE-LETE.                                             IX2134.2 314
   000998         100100     GO TO READ-WRITE-F2-12.                                      IX2134.2 1011
   000999         100200 READ-INVALID-F2-12.                                              IX2134.2
   001000         100300     MOVE "IX-28; 4.5.2 & IX-6 1.3.5 INVALID KEY PATH      TAKEN" IX2134.2
   001001         100400            TO RE-MARK.                                           IX2134.2 145
   001002         100500     PERFORM FAIL.                                                IX2134.2 313
   001003         100600     MOVE "INVALID KEY" TO COMPUTED-A.                            IX2134.2 151
   001004         100700     MOVE "KKK070ALT05" TO CORRECT-A.                             IX2134.2 165
   001005         100800     GO TO READ-WRITE-F2-12.                                      IX2134.2 1011
   001006         100900 READ-FAIL-F2-12.                                                 IX2134.2
   001007         101000     MOVE "IX-28; 4.5.2 F2, WRONG KEY            " TO RE-MARK.    IX2134.2 145
   001008         101100     PERFORM FAIL.                                                IX2134.2 313
   001009         101200     MOVE IX-FS1-KEY TO COMPUTED-A.                               IX2134.2 87 151
   001010         101300     MOVE "AAA071" TO CORRECT-A.                                  IX2134.2 165
   001011         101400 READ-WRITE-F2-12.                                                IX2134.2
   001012         101500     PERFORM PRINT-DETAIL.                                        IX2134.2 316
   001013         101600     CLOSE IX-FS1.                                                IX2134.2 82
   001014         101700 CCVS-EXIT SECTION.                                               IX2134.2
   001015         101800 CCVS-999999.                                                     IX2134.2
   001016         101900     GO TO CLOSE-FILES.                                           IX2134.2 293
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    21
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      196   ANSI-REFERENCE . . . . . . . .  395 402 411
       78   C-ABORT. . . . . . . . . . . .  M281 M297
       72   C-ALL. . . . . . . . . . . . .  M299
       68   C-DATE . . . . . . . . . . . .  M283
       74   C-DELETED. . . . . . . . . . .  M301
       73   C-FAIL . . . . . . . . . . . .  M300
       77   C-INDENT
       75   C-INSPECT. . . . . . . . . . .  M302
       70   C-NO-OF-TESTS. . . . . . . . .  M282
       76   C-NOTE
       71   C-OK . . . . . . . . . . . . .  M298
       69   C-TIME . . . . . . . . . . . .  M284
      175   CCVS-C-1 . . . . . . . . . . .  334 380
      180   CCVS-C-2 . . . . . . . . . . .  335 381
      230   CCVS-E-1 . . . . . . . . . . .  340
      235   CCVS-E-2 . . . . . . . . . . .  349 356 363 368
      238   CCVS-E-2-2 . . . . . . . . . .  M348
      243   CCVS-E-3 . . . . . . . . . . .  369
      252   CCVS-E-4 . . . . . . . . . . .  348
      253   CCVS-E-4-1 . . . . . . . . . .  M346
      255   CCVS-E-4-2 . . . . . . . . . .  M347
      197   CCVS-H-1 . . . . . . . . . . .  329 376
      202   CCVS-H-2A. . . . . . . . . . .  330 377
      211   CCVS-H-2B. . . . . . . . . . .  331 378
      223   CCVS-H-3 . . . . . . . . . . .  332 379
      273   CCVS-PGM-ID. . . . . . . . . .  279 289 289 295
      157   CM-18V0
      151   COMPUTED-A . . . . . . . . . .  152 154 155 156 157 407 410 M493 M499 M522 M528 M546 M569 M575 M595 M616 M640
                                            M646 M652 M676 M682 M688 M712 M718 M724 M747 M753 M776 M782 M805 M811 M829 M852
                                            M858 M875 M898 M904 M927 M933 M956 M962 M980 M1003 M1009
      152   COMPUTED-N
      150   COMPUTED-X . . . . . . . . . .  M324 392
      154   COMPUTED-0V18
      156   COMPUTED-14V4
      158   COMPUTED-18V0. . . . . . . . .  M468
      155   COMPUTED-4V14
      174   COR-ANSI-REFERENCE . . . . . .  M402 M404
      165   CORRECT-A. . . . . . . . . . .  166 167 168 169 170 408 410 M494 M500 M523 M529 M547 M570 M576 M596 M617 M641
                                            M647 M653 M677 M683 M689 M713 M719 M725 M748 M754 M777 M783 M806 M812 M830 M853
                                            M859 M876 M899 M905 M928 M934 M957 M963 M981 M1004 M1010
      166   CORRECT-N
      164   CORRECT-X. . . . . . . . . . .  M325 394
      167   CORRECT-0V18
      169   CORRECT-14V4
      171   CORRECT-18V0 . . . . . . . . .  M469
      168   CORRECT-4V14
      103   COUNTER00. . . . . . . . . . .  M422
      105   COUNTER01. . . . . . . . . . .  M422 M425 M428 M431 M434 M437 M440 M443 M446 M449
      108   COUNTER02. . . . . . . . . . .  M422 M425 M428 M431 M434 M437 M440 M443 M446 M449
      111   COUNTER03. . . . . . . . . . .  M423 M426 M429 M432 M435 M438 M441 M444 M447 M450
      114   COUNTER04. . . . . . . . . . .  M423 M426 M429 M432 M435 M438 M441 M444 M447 M450
      117   COUNTER05. . . . . . . . . . .  M423 M426 M429 M432 M435 M438 M441 M444 M447 M450
      120   COUNTER06. . . . . . . . . . .  M423 M426 M429 M432 M435 M438 M441 M444 M447 M450
      123   COUNTER07. . . . . . . . . . .  M423 M426 M429 M432 M435 M438 M441 M444 M447 M450
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    22
0 Defined   Cross-reference of data names   References

0     126   COUNTER08. . . . . . . . . . .  M424 M427 M430 M433 M436 M439 M442 M445 M448 M451
      129   COUNTER09. . . . . . . . . . .  M424 M427 M430 M433 M436 M439 M442 M445 M448 M451
      132   COUNTER10. . . . . . . . . . .  M424 M427 M430 M433 M436 M439 M442 M445 M448 M451
      170   CR-18V0
      188   DELETE-COUNTER . . . . . . . .  301 M314 343 359 361
      143   DOTVALUE . . . . . . . . . . .  M319
      194   DUMMY-HOLD . . . . . . . . . .  M373 383
       81   DUMMY-RECORD . . . . . . . . .  M329 M330 M331 M332 M334 M335 M336 M338 M340 M349 M356 M363 M368 M369 373 M374
                                            375 M376 M377 M378 M379 M380 M381 M382 M383 387 M388 M397 M412
      241   ENDER-DESC . . . . . . . . . .  M351 M362 M367
      189   ERROR-COUNTER. . . . . . . . .  300 M313 342 352 355
      193   ERROR-HOLD . . . . . . . . . .  299 M342 M343 M343 M344 347
      239   ERROR-TOTAL. . . . . . . . . .  M353 M355 M360 M361 M365 M366
      136   FEATURE. . . . . . . . . . . .  M455 M475 M504 M533 M551 M580 M600 M621 M657 M693 M729 M758 M787 M816 M834 M863
                                            M880 M909 M938 M967 M985
      267   HYPHEN-LINE. . . . . . . . . .  336 338 382
      233   ID-AGAIN . . . . . . . . . . .  M289
      266   INF-ANSI-REFERENCE . . . . . .  M395 M398 M411 M413
      261   INFO-TEXT. . . . . . . . . . .  M396
      190   INSPECT-COUNTER. . . . . . . .  302 M311 342 364 366
      100   INVKEY-COUNTER . . . . . . . .  M453 458 468
       82   IX-FS1 . . . . . . . . . . . .  44 418 473 474 479 508 M536 555 604 625 628 661 664 697 700 733 762 791 M819
                                            838 884 913 942 M970 989 1013
       88   IX-FS1-ALT01 . . . . . . . . .  50 M478 480
       89   IX-FS1-ALT02 . . . . . . . . .  51
       90   IX-FS1-ALT03 . . . . . . . . .  52 M624 626
       91   IX-FS1-ALT04 . . . . . . . . .  53 M554 556 M583 M761 763
       92   IX-FS1-ALT05 . . . . . . . . .  54 M883 885 M988 990
       93   IX-FS1-ALT06 . . . . . . . . .  55 M660 662
       94   IX-FS1-ALT07 . . . . . . . . .  56 M941 943
       95   IX-FS1-ALT08 . . . . . . . . .  57 M507 509 M732 734
       96   IX-FS1-ALT09 . . . . . . . . .  58 M603 605 M837 839 M866 M912 914
       97   IX-FS1-ALT10 . . . . . . . . .  59 M696 698
       87   IX-FS1-KEY . . . . . . . . . .  49 482 499 511 528 558 575 616 629 652 665 688 701 724 736 753 765 782 M790 792
                                            794 811 841 858 887 904 916 933 945 962 992 1009
       86   IX-FS1-RECORD. . . . . . . . .  M452 584 867
      138   P-OR-F . . . . . . . . . . . .  M311 M312 M313 M314 321 M324
      140   PAR-NAME . . . . . . . . . . .  M326 M456 M476 M505 M534 M552 M581 M601 M622 M658 M694 M730 M759 M788 M817 M835
                                            M864 M881 M910 M939 M968 M986
      142   PARDOT-X . . . . . . . . . . .  M318
      191   PASS-COUNTER . . . . . . . . .  298 M312 344 346
       79   PRINT-FILE . . . . . . . . . .  42 288 306
       80   PRINT-REC. . . . . . . . . . .  M320 M401 M403
       64   RAW-DATA . . . . . . . . . . .  37 278 280 287 294 296 305
       67   RAW-DATA-KEY . . . . . . . . .  41 M279 M295
       66   RAW-DATA-SATZ. . . . . . . . .  285 303
      145   RE-MARK. . . . . . . . . . . .  M315 M327 M457 M466 M477 M491 M497 M506 M520 M526 M535 M544 M553 M567 M573 M582
                                            M593 M602 M614 M623 M638 M644 M651 M659 M674 M680 M686 M695 M710 M716 M722 M731
                                            M745 M751 M760 M774 M780 M789 M803 M809 M818 M827 M836 M850 M856 M865 M882 M896
                                            M902 M911 M925 M931 M940 M954 M960 M969 M978 M987 M1001 M1007
      187   REC-CT . . . . . . . . . . . .  317 319 326
      186   REC-SKL-SUB
      195   RECORD-COUNT . . . . . . . . .  M371 372 M384
       99   RECORD-COUNTER . . . . . . . .  M419 420 422 425 428 431 434 437 440 443 446 449
      146   TEST-COMPUTED. . . . . . . . .  401
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    23
0 Defined   Cross-reference of data names   References

0     161   TEST-CORRECT . . . . . . . . .  403
      214   TEST-ID. . . . . . . . . . . .  M289
      134   TEST-RESULTS . . . . . . . . .  M290 320
      192   TOTAL-ERROR
      101   WORK-RECORD. . . . . . . . . .  452
      263   XXCOMPUTED . . . . . . . . . .  M410
      265   XXCORRECT. . . . . . . . . . .  M410
      258   XXINFO . . . . . . . . . . . .  397 412
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    24
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

      406   BAIL-OUT . . . . . . . . . . .  P323
      414   BAIL-OUT-EX. . . . . . . . . .  E323 G408
      409   BAIL-OUT-WRITE . . . . . . . .  G407
      389   BLANK-LINE-PRINT
     1014   CCVS-EXIT
     1015   CCVS-999999
      276   CCVS1
      415   CCVS1-EXIT . . . . . . . . . .  G292
      293   CLOSE-FILES. . . . . . . . . .  G1016
      333   COLUMN-NAMES-ROUTINE . . . . .  E291
      421   CREATE-IX-FS1. . . . . . . . .  P419
      314   DE-LETE. . . . . . . . . . . .  P463 P487 P516 P540 P563 P589 P610 P634 P670 P706 P741 P770 P799 P823 P846 P871
                                            P892 P921 P950 P974 P997
      539   DELETE-DELETE-GF-01
      822   DELETE-DELETE-GF-02
      973   DELETE-DELETE-GF-03
      825   DELETE-FAIL-GF-02. . . . . . .  G819
      976   DELETE-FAIL-GF-03. . . . . . .  G970
      542   DELETE-INVALID-GF-01 . . . . .  G536
      532   DELETE-TEST-GF-01
      815   DELETE-TEST-GF-02
      966   DELETE-TEST-GF-03
      548   DELETE-WRITE-GF-01 . . . . . .  G538 G541
      831   DELETE-WRITE-GF-02 . . . . . .  G821 G824
      982   DELETE-WRITE-GF-03 . . . . . .  G972 G975
      286   END-E-1. . . . . . . . . . . .  G280 G285
      304   END-E-2. . . . . . . . . . . .  G296 G303
      337   END-ROUTINE. . . . . . . . . .  P306
      341   END-ROUTINE-1
      350   END-ROUTINE-12
      358   END-ROUTINE-13 . . . . . . . .  E306
      339   END-RTN-EXIT
      313   FAIL . . . . . . . . . . . . .  P467 P492 P498 P521 P527 P545 P568 P574 P594 P615 P639 P645 P650 P675 P681 P687
                                            P711 P717 P723 P746 P752 P775 P781 P804 P810 P828 P851 P857 P874 P897 P903 P926
                                            P932 P955 P961 P979 P1002 P1008
      391   FAIL-ROUTINE . . . . . . . . .  P322
      405   FAIL-ROUTINE-EX. . . . . . . .  E322 G399
      400   FAIL-ROUTINE-WRITE . . . . . .  G393 G394
      328   HEAD-ROUTINE . . . . . . . . .  P291
      462   INDEX-DELETE-1
      311   INSPT
      277   OPEN-FILES
      312   PASS . . . . . . . . . . . . .  P459 P483 P512 P537 P559 P586 P606 P630 P666 P702 P737 P766 P795 P820 P842 P868
                                            P888 P917 P946 P971 P993
      316   PRINT-DETAIL . . . . . . . . .  P471 P502 P531 P549 P578 P598 P619 P655 P691 P727 P756 P785 P814 P832 P861 P878
                                            P907 P936 P965 P983 P1012
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    25
0 Defined   Cross-reference of procedures   References

0     486   READ-DELETE-F2-01
      515   READ-DELETE-F2-02
      562   READ-DELETE-F2-03
      609   READ-DELETE-F2-04
      740   READ-DELETE-F2-05
      769   READ-DELETE-F2-06
      798   READ-DELETE-F2-07
      845   READ-DELETE-F2-08
      891   READ-DELETE-F2-09
      920   READ-DELETE-F2-10
      949   READ-DELETE-F2-11
      996   READ-DELETE-F2-12
      496   READ-FAIL-F2-01. . . . . . . .  G484
      525   READ-FAIL-F2-02. . . . . . . .  G513
      572   READ-FAIL-F2-03. . . . . . . .  G560
      612   READ-FAIL-F2-04. . . . . . . .  G608
      750   READ-FAIL-F2-05. . . . . . . .  G738
      779   READ-FAIL-F2-06. . . . . . . .  G767
      808   READ-FAIL-F2-07. . . . . . . .  G796
      855   READ-FAIL-F2-08. . . . . . . .  G843
      901   READ-FAIL-F2-09. . . . . . . .  G889
      930   READ-FAIL-F2-10. . . . . . . .  G918
      959   READ-FAIL-F2-11. . . . . . . .  G947
     1006   READ-FAIL-F2-12. . . . . . . .  G994
      489   READ-INVALID-F2-01 . . . . . .  G481
      518   READ-INVALID-F2-02 . . . . . .  G510
      565   READ-INVALID-F2-03 . . . . . .  G557
      743   READ-INVALID-F2-05 . . . . . .  G735
      772   READ-INVALID-F2-06 . . . . . .  G764
      801   READ-INVALID-F2-07 . . . . . .  G793
      848   READ-INVALID-F2-08 . . . . . .  G840
      894   READ-INVALID-F2-09 . . . . . .  G886
      923   READ-INVALID-F2-10 . . . . . .  G915
      952   READ-INVALID-F2-11 . . . . . .  G944
      999   READ-INVALID-F2-12 . . . . . .  G991
      472   READ-TEST-F2-01
      503   READ-TEST-F2-02
      550   READ-TEST-F2-03
      599   READ-TEST-F2-04
      728   READ-TEST-F2-05
      757   READ-TEST-F2-06
      786   READ-TEST-F2-07
      833   READ-TEST-F2-08
      879   READ-TEST-F2-09
      908   READ-TEST-F2-10
      937   READ-TEST-F2-11
      984   READ-TEST-F2-12
      501   READ-WRITE-F2-01 . . . . . . .  G485 G488 G495
      530   READ-WRITE-F2-02 . . . . . . .  G514 G517 G524
      577   READ-WRITE-F2-03 . . . . . . .  G561 G564 G571
      618   READ-WRITE-F2-04 . . . . . . .  G607 G611
      755   READ-WRITE-F2-05 . . . . . . .  G739 G742 G749
      784   READ-WRITE-F2-06 . . . . . . .  G768 G771 G778
      813   READ-WRITE-F2-07 . . . . . . .  G797 G800 G807
      860   READ-WRITE-F2-08 . . . . . . .  G844 G847 G854
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    26
0 Defined   Cross-reference of procedures   References

0     906   READ-WRITE-F2-09 . . . . . . .  G890 G893 G900
      935   READ-WRITE-F2-10 . . . . . . .  G919 G922 G929
      964   READ-WRITE-F2-11 . . . . . . .  G948 G951 G958
     1011   READ-WRITE-F2-12 . . . . . . .  G995 G998 G1005
      588   REWRITE-DELETE-GF-01
      870   REWRITE-DELETE-GF-02
      873   REWRITE-FAIL-GF-02 . . . . . .  G867
      591   REWRITE-INVALID-GF-01. . . . .  G585
      579   REWRITE-TEST-GF-01
      862   REWRITE-TEST-GF-02
      597   REWRITE-WRITE-GF-01. . . . . .  G587 G590
      877   REWRITE-WRITE-GF-02. . . . . .  G869 G872
      633   START-DELETE-GF-01
      669   START-DELETE-GF-02
      705   START-DELETE-GF-03
      643   START-END-GF-01. . . . . . . .  G628
      679   START-END-GF-02. . . . . . . .  G664
      715   START-END-GF-03. . . . . . . .  G700
      649   START-FAIL-GF-01 . . . . . . .  G631
      685   START-FAIL-GF-02
      721   START-FAIL-GF-03 . . . . . . .  G703
      636   START-INVALID-GF-01. . . . . .  G627
      672   START-INVALID-GF-02. . . . . .  G663 G667
      708   START-INVALID-GF-03. . . . . .  G699
      620   START-TEST-GF-01
      656   START-TEST-GF-02
      692   START-TEST-GF-03
      654   START-WRITE-GF-01. . . . . . .  G632 G635 G642 G648
      690   START-WRITE-GF-02. . . . . . .  G668 G671 G678 G684
      726   START-WRITE-GF-03. . . . . . .  G704 G707 G714 G720
      309   TERMINATE-CALL
      307   TERMINATE-CCVS
      465   WRITE-FAIL-GF-01 . . . . . . .  G460
      417   WRITE-INIT-GF-01
      370   WRITE-LINE . . . . . . . . . .  P320 P321 P329 P330 P331 P332 P334 P335 P336 P338 P340 P349 P357 P363 P368 P369
                                            P397 P401 P403 P412
      454   WRITE-TEST-GD-01
      470   WRITE-WRITE-GF-01. . . . . . .  G461 G464
      386   WRT-LN . . . . . . . . . . . .  P376 P377 P378 P379 P380 P381 P382 P385 P390
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    27
0 Defined   Cross-reference of programs     References

        3   IX213A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX213A    Date 06/04/2022  Time 11:59:50   Page    28
0LineID  Message code  Message text

     47  IGYDS1298-I   Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX044" was treated as comments.

     79  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     82  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX213A:
 *    Source records = 1016
 *    Data Division statements = 102
 *    Procedure Division statements = 615
 *    Generated COBOL statements = 0
 *    Program complexity factor = 622
0End of compilation 1,  program IX213A,  highest severity 0.
0Return code 0
