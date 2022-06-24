1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:29   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:29   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2164.2
   000002         000200 PROGRAM-ID.                                                      NC2164.2
   000003         000300     NC216A.                                                      NC2164.2
   000004         000500*                                                              *  NC2164.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2164.2
   000006         000700*                                                              *  NC2164.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2164.2
   000008         000900*                                                              *  NC2164.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2164.2
   000010         001100*                                                              *  NC2164.2
   000011         001300*                                                              *  NC2164.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2164.2
   000013         001500*                                                              *  NC2164.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2164.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2164.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2164.2
   000017         001900*                                                              *  NC2164.2
   000018         002100*                                                              *  NC2164.2
   000019         002200*    PROGRAM NC216A TESTS ALL FOUR FORMATS OF THE "INSPECT"    *  NC2164.2
   000020         002300*    STATEMENT USING VARIOUS COMBINATIONS OF THE OPTIONAL      *  NC2164.2
   000021         002400*    PHRASES: CHARACTERS, ALL, LEADING, FIRST, BEFORE, AFTER.  *  NC2164.2
   000022         002500*                                                              *  NC2164.2
   000023         002700 ENVIRONMENT DIVISION.                                            NC2164.2
   000024         002800 CONFIGURATION SECTION.                                           NC2164.2
   000025         002900 SOURCE-COMPUTER.                                                 NC2164.2
   000026         003000     XXXXX082.                                                    NC2164.2
   000027         003100 OBJECT-COMPUTER.                                                 NC2164.2
   000028         003200     XXXXX083.                                                    NC2164.2
   000029         003300 INPUT-OUTPUT SECTION.                                            NC2164.2
   000030         003400 FILE-CONTROL.                                                    NC2164.2
   000031         003500     SELECT PRINT-FILE ASSIGN TO                                  NC2164.2 35
   000032         003600     XXXXX055.                                                    NC2164.2
   000033         003700 DATA DIVISION.                                                   NC2164.2
   000034         003800 FILE SECTION.                                                    NC2164.2
   000035         003900 FD  PRINT-FILE.                                                  NC2164.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         004000 01  PRINT-REC PICTURE X(120).                                    NC2164.2
   000037         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC2164.2
   000038         004200 WORKING-STORAGE SECTION.                                         NC2164.2
   000039         004300 01  WRK-DU-999-1 PIC 999.                                        NC2164.2
   000040         004400 01  WRK-DU-999-2 PIC 999.                                        NC2164.2
   000041         004500 01  WRK-DU-999-3 PIC 999.                                        NC2164.2
   000042         004600 01  WRK-DU-999-4 PIC 999.                                        NC2164.2
   000043         004700 01  JUST-XN-20-1 PIC X(20) JUSTIFIED.                            NC2164.2
   000044         004800 01  SPACE-XN-1-1 PIC X VALUE SPACE.                              NC2164.2 IMP
   000045         004900 01  COMMA-XN-1-1 PIC X VALUE ",".                                NC2164.2
   000046         005000 01  HYPEN-XN-1-1 PIC X VALUE "-".                                NC2164.2
   000047         005100 01  A-XN-1-1 PIC X VALUE "A".                                    NC2164.2
   000048         005200 01  D-XN-1-1 PIC X VALUE "D".                                    NC2164.2
   000049         005300 01  G-XN-1-1 PIC X VALUE "G".                                    NC2164.2
   000050         005400 01  H-XN-1-1 PIC X VALUE "H".                                    NC2164.2
   000051         005500 01  L-XN-1-1 PIC X VALUE "L".                                    NC2164.2
   000052         005600 01  O-XN-1-1 PIC X VALUE "O".                                    NC2164.2
   000053         005700 01  P-XN-1-1 PIC X VALUE "P".                                    NC2164.2
   000054         005800 01  S-XN-1-1 PIC X VALUE "S".                                    NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 01  Z-XN-1-1 PIC X VALUE "Z".                                    NC2164.2
   000056         006000 01  AH-XN-2 PIC X(2) VALUE "AH".                                 NC2164.2
   000057         006100 01  HSPACE-XN-2 PIC X(2) VALUE "H ".                             NC2164.2
   000058         006200 01  OH-XN-2 PIC X(2) VALUE "OH".                                 NC2164.2
   000059         006300 01  ALL-XN-3 PIC X(3) VALUE "ALL".                               NC2164.2
   000060         006400 01  YES-XN-3 PIC X(3) VALUE "YES".                               NC2164.2
   000061         006500 01  X-SPACE-X-XN-3                  PICTURE X(3) VALUE "X X".    NC2164.2
   000062         006600 01  AABA-XN-4                       PICTURE X(4) VALUE "AABA".   NC2164.2
   000063         006700 01  WRK-XN-83-1 PIC X(83).                                       NC2164.2
   000064         006800 01  WRK-XN-83-2  PIC X(83).                                      NC2164.2
   000065         006900 01  WRK-DS-5V0-1  PIC S9(5) VALUE -12345.                        NC2164.2
   000066         007000 01  WRK-NE-1  PIC -999,999.99/9 VALUE "-123,456.78/9".           NC2164.2
   000067         007100 01  KIDS-CAN-NOT-BE  PIC  X(15)  VALUE "KIDS CAN NOT BE".        NC2164.2
   000068         007200 01  BLANK-PERIOD PIC X(2) VALUE " ." .                           NC2164.2
   000069         007300 01  WC-XN-83  PIC X(83) VALUE                                    NC2164.2
   000070         007400     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000071         007500-    "IDS CAN NOT BE ALL BAD.".                                   NC2164.2
   000072         007600 01  ANS-XN-83-1 PIC X(83) VALUE                                  NC2164.2
   000073         007700     "OH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000074         007800-    "IDS CAN NOT BE ALL BAD.".                                   NC2164.2
   000075         007900 01  ANS-XN-83-2 PIC X(83) VALUE                                  NC2164.2
   000076         008000     "AH YES,AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000077         008100-    "IDS CAN NOT BE ALL BAD.".                                   NC2164.2
   000078         008200 01  ANS-XN-83-3 PIC X(83) VALUE                                  NC2164.2
   000079         008300     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000080         008400-    "IDS CAN NOT BE ALL-BAD.".                                   NC2164.2
   000081         008500 01  ANS-XN-83-4 PIC X(83) VALUE                                  NC2164.2
   000082         008600     "EH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000083         008700-    "IDS CAN NOT BE ALL BAD.".                                   NC2164.2
   000084         008800 01  ANS-XN-83-5 PIC X(83) VALUE                                  NC2164.2
   000085         008900     "AH YES OH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000086         009000-    "IDS CAN NOT BE ALL BAD.".                                   NC2164.2
   000087         009100 01  ANS-XN-83-6 PIC X(83) VALUE                                  NC2164.2
   000088         009200     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000089         009300-    "IDS CAN NOT BE ALZZZZZZ".                                   NC2164.2
   000090         009400 01  ANS-XN-83-7 PIC X(83) VALUE                                  NC2164.2
   000091         009500     "OH-YES-AH-YES-W.P.-ZRITOES-HERE.-ANYONE-WHO-HATES-DOGS-AND-KNC2164.2
   000092         009600-    "IDS-CAN-NOT-BE-ALZZZZZZ".                                   NC2164.2
   000093         009700 01  ANS-XN-83-8 PIC X(83) VALUE                                  NC2164.2
   000094         009800     "AH-YES-AH-YES-W.C.-FRITOES-HERE.-ANYONE-WHO-HATES-DOGS-AND-KNC2164.2
   000095         009900-    "IDS-CAN-NOT-BE-ALL-BAD.".                                   NC2164.2
   000096         010000 01  ANS-XN-83-9  PIC X(83) VALUE                                 NC2164.2
   000097         010100     "OH YES AH YES W.C. FROTOES HERE, ANYONE WHO HATES DOGS AND KNC2164.2
   000098         010200-    "IDS CAN NOT BE ALL BAD.".                                   NC2164.2
   000099         010300 01  ANS-XN-83-10 PIC X(83) VALUE                                 NC2164.2
   000100         010400     "OH YES AH YES W.C. FRITOES HE                               NC2164.2
   000101         010500-    "            BE ALL BAD.".                                   NC2164.2
   000102         010600 01  ANS-XN-83-11 PIC X(83) VALUE                                 NC2164.2
   000103         010700     "OH YES AH                                                   NC2164.2
   000104         010800-    "                     D.".                                   NC2164.2
   000105         010900                                                                  NC2164.2
   000106         011000                                                                  NC2164.2
   000107         011100 01  WS-RIGHT-1-83.                                               NC2164.2
   000108         011200   03  WS-RIGHT-1-20                PIC X(20).                    NC2164.2
   000109         011300   03  WS-RIGHT-21-40               PIC X(20).                    NC2164.2
   000110         011400   03  WS-RIGHT-41-60               PIC X(20).                    NC2164.2
   000111         011500   03  WS-RIGHT-61-80               PIC X(20).                    NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600   03  WS-RIGHT-81-83               PIC X(3).                     NC2164.2
   000113         011700 01  WS-WRONG-1-83.                                               NC2164.2
   000114         011800   03  WS-WRONG-1-20                PIC X(20).                    NC2164.2
   000115         011900   03  WS-WRONG-21-40               PIC X(20).                    NC2164.2
   000116         012000   03  WS-WRONG-41-60               PIC X(20).                    NC2164.2
   000117         012100   03  WS-WRONG-61-80               PIC X(20).                    NC2164.2
   000118         012200   03  WS-WRONG-81-83               PIC X(3).                     NC2164.2
   000119         012300                                                                  NC2164.2
   000120         012400 01  INSPECT-FIELDS.                                              NC2164.2
   000121         012500   03  GRP-A.                                                     NC2164.2
   000122         012600     05  PIC X(7)  VALUE "XXXXXXX".                               NC2164.2
   000123         012700     05  PIC X(7)  VALUE "YYYYYYY".                               NC2164.2
   000124         012800     05  PIC X(7)  VALUE "AAABAAA".                               NC2164.2
   000125         012900     05  PIC X(7)  VALUE "SSSSSSS".                               NC2164.2
   000126         013000     05  PIC X(7)  VALUE "TTTTTTT".                               NC2164.2
   000127         013100   03  GRP-B       REDEFINES GRP-A.                               NC2164.2 121
   000128         013200     05  DATA-FIELD  PIC X(7) OCCURS 5.                           NC2164.2
   000129         013300 01  LOCATE-CHARS.                                                NC2164.2
   000130         013400   03  GRP-C.                                                     NC2164.2
   000131         013500     05  PIC X  VALUE "G".                                        NC2164.2
   000132         013600     05  PIC X  VALUE "H".                                        NC2164.2
   000133         013700     05  PIC X  VALUE "B".                                        NC2164.2
   000134         013800     05  PIC X  VALUE "D".                                        NC2164.2
   000135         013900     05  PIC X  VALUE "C".                                        NC2164.2
   000136         014000   03  GRP-D       REDEFINES GRP-C.                               NC2164.2 130
   000137         014100     05  END-CHAR  PIC X OCCURS 5.                                NC2164.2
   000138         014200 01  SUB PIC 9 COMP.                                              NC2164.2
   000139         014300 01  WS-BB         PIC XX VALUE "BB".                             NC2164.2
   000140         014400 01  WS-Y          PIC X  VALUE "Y".                              NC2164.2
   000141         014500 01  WS-3          PIC X  VALUE "3".                              NC2164.2
   000142         014600 01  WS-E          PIC X  VALUE "E".                              NC2164.2
   000143         014700 01  XN-DF         PIC XX VALUE "DF".                             NC2164.2
   000144         014800 01  XN-67         PIC XX VALUE "67".                             NC2164.2
   000145         014900 01  XN-B          PIC X  VALUE "B".                              NC2164.2
   000146         015000 01  TEST-31-DATA.                                                NC2164.2
   000147         015100   03  FILLER PIC X(48)  VALUE                                    NC2164.2
   000148         015200            "AABBCCDDEBBBBGHDDIJJXXAABBCCDDEEEFFGGHHIIJJKKLLM".   NC2164.2
   000149         015300 01  TEST-32-DATA.                                                NC2164.2
   000150         015400   03  FILLER PIC X(48)  VALUE                                    NC2164.2
   000151         015500            "AABSSSSSEBBTTTT1URSTSTSTVVDYYDEEEFFGSSSSTZSTZSTM".   NC2164.2
   000152         015600 01  TEST-34-DATA.                                                NC2164.2
   000153         015700   03  FILLER PIC X(20)  VALUE                                    NC2164.2
   000154         015800            "AAFSSA  ET U V W H S".                               NC2164.2
   000155         015900 01  TEST-34-ANSWER.                                              NC2164.2
   000156         016000   03  FILLER PIC X(20)  VALUE                                    NC2164.2
   000157         016100            "AAFXXA  ET Y Y Y H S".                               NC2164.2
   000158         016200 01  TEST-35-DATA.                                                NC2164.2
   000159         016300   03  FILLER PIC X(20)  VALUE                                    NC2164.2
   000160         016400            "AX SSA YEG U V W H S".                               NC2164.2
   000161         016500 01  TEST-35-ANSWER.                                              NC2164.2
   000162         016600   03  FILLER PIC X(20)  VALUE                                    NC2164.2
   000163         016700            "AX AAA YEG       H S".                               NC2164.2
   000164         016800 01  TEST-38-DATA.                                                NC2164.2
   000165         016900   03  FILLER PIC X(20)  VALUE                                    NC2164.2
   000166         017000            "AXESSA YEGTUASSW H S".                               NC2164.2
   000167         017100 01  TEST-39-DATA.                                                NC2164.2
   000168         017200   03  FILLER PIC X(20)  VALUE                                    NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300            "ABESSA YE TUTCGW H S".                               NC2164.2
   000170         017400 01  TEST-40-DATA.                                                NC2164.2
   000171         017500   03  FILLER PIC X(13)  VALUE                                    NC2164.2
   000172         017600            "GADQAUZTABAGA".                                      NC2164.2
   000173         017700 01  TEST-RESULTS.                                                NC2164.2
   000174         017800     02 FILLER                   PIC X      VALUE SPACE.          NC2164.2 IMP
   000175         017900     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2164.2 IMP
   000176         018000     02 FILLER                   PIC X      VALUE SPACE.          NC2164.2 IMP
   000177         018100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2164.2 IMP
   000178         018200     02 FILLER                   PIC X      VALUE SPACE.          NC2164.2 IMP
   000179         018300     02  PAR-NAME.                                                NC2164.2
   000180         018400       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2164.2 IMP
   000181         018500       03  PARDOT-X              PIC X      VALUE SPACE.          NC2164.2 IMP
   000182         018600       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2164.2 IMP
   000183         018700     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2164.2 IMP
   000184         018800     02 RE-MARK                  PIC X(61).                       NC2164.2
   000185         018900 01  TEST-COMPUTED.                                               NC2164.2
   000186         019000     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2164.2 IMP
   000187         019100     02 FILLER                   PIC X(17)  VALUE                 NC2164.2
   000188         019200            "       COMPUTED=".                                   NC2164.2
   000189         019300     02 COMPUTED-X.                                               NC2164.2
   000190         019400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2164.2 IMP
   000191         019500     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2164.2 190
   000192         019600                                 PIC -9(9).9(9).                  NC2164.2
   000193         019700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2164.2 190
   000194         019800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2164.2 190
   000195         019900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2164.2 190
   000196         020000     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2164.2 190
   000197         020100         04 COMPUTED-18V0                    PIC -9(18).          NC2164.2
   000198         020200         04 FILLER                           PIC X.               NC2164.2
   000199         020300     03 FILLER PIC X(50) VALUE SPACE.                             NC2164.2 IMP
   000200         020400 01  TEST-CORRECT.                                                NC2164.2
   000201         020500     02 FILLER PIC X(30) VALUE SPACE.                             NC2164.2 IMP
   000202         020600     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2164.2
   000203         020700     02 CORRECT-X.                                                NC2164.2
   000204         020800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2164.2 IMP
   000205         020900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2164.2 204
   000206         021000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2164.2 204
   000207         021100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2164.2 204
   000208         021200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2164.2 204
   000209         021300     03      CR-18V0 REDEFINES CORRECT-A.                         NC2164.2 204
   000210         021400         04 CORRECT-18V0                     PIC -9(18).          NC2164.2
   000211         021500         04 FILLER                           PIC X.               NC2164.2
   000212         021600     03 FILLER PIC X(2) VALUE SPACE.                              NC2164.2 IMP
   000213         021700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2164.2 IMP
   000214         021800 01  CCVS-C-1.                                                    NC2164.2
   000215         021900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2164.2
   000216         022000-    "SS  PARAGRAPH-NAME                                          NC2164.2
   000217         022100-    "       REMARKS".                                            NC2164.2
   000218         022200     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2164.2 IMP
   000219         022300 01  CCVS-C-2.                                                    NC2164.2
   000220         022400     02 FILLER                     PIC X        VALUE SPACE.      NC2164.2 IMP
   000221         022500     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2164.2
   000222         022600     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2164.2 IMP
   000223         022700     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2164.2
   000224         022800     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2164.2 IMP
   000225         022900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2164.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 01  REC-CT                        PIC 99       VALUE ZERO.       NC2164.2 IMP
   000227         023100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2164.2 IMP
   000228         023200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2164.2 IMP
   000229         023300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2164.2 IMP
   000230         023400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2164.2 IMP
   000231         023500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2164.2 IMP
   000232         023600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2164.2 IMP
   000233         023700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2164.2 IMP
   000234         023800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2164.2 IMP
   000235         023900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2164.2 IMP
   000236         024000 01  CCVS-H-1.                                                    NC2164.2
   000237         024100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2164.2 IMP
   000238         024200     02  FILLER                    PIC X(42)    VALUE             NC2164.2
   000239         024300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2164.2
   000240         024400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2164.2 IMP
   000241         024500 01  CCVS-H-2A.                                                   NC2164.2
   000242         024600   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2164.2 IMP
   000243         024700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2164.2
   000244         024800   02  FILLER                        PIC XXXX   VALUE             NC2164.2
   000245         024900     "4.2 ".                                                      NC2164.2
   000246         025000   02  FILLER                        PIC X(28)  VALUE             NC2164.2
   000247         025100            " COPY - NOT FOR DISTRIBUTION".                       NC2164.2
   000248         025200   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2164.2 IMP
   000249         025300                                                                  NC2164.2
   000250         025400 01  CCVS-H-2B.                                                   NC2164.2
   000251         025500   02  FILLER                        PIC X(15)  VALUE             NC2164.2
   000252         025600            "TEST RESULT OF ".                                    NC2164.2
   000253         025700   02  TEST-ID                       PIC X(9).                    NC2164.2
   000254         025800   02  FILLER                        PIC X(4)   VALUE             NC2164.2
   000255         025900            " IN ".                                               NC2164.2
   000256         026000   02  FILLER                        PIC X(12)  VALUE             NC2164.2
   000257         026100     " HIGH       ".                                              NC2164.2
   000258         026200   02  FILLER                        PIC X(22)  VALUE             NC2164.2
   000259         026300            " LEVEL VALIDATION FOR ".                             NC2164.2
   000260         026400   02  FILLER                        PIC X(58)  VALUE             NC2164.2
   000261         026500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2164.2
   000262         026600 01  CCVS-H-3.                                                    NC2164.2
   000263         026700     02  FILLER                      PIC X(34)  VALUE             NC2164.2
   000264         026800            " FOR OFFICIAL USE ONLY    ".                         NC2164.2
   000265         026900     02  FILLER                      PIC X(58)  VALUE             NC2164.2
   000266         027000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2164.2
   000267         027100     02  FILLER                      PIC X(28)  VALUE             NC2164.2
   000268         027200            "  COPYRIGHT   1985 ".                                NC2164.2
   000269         027300 01  CCVS-E-1.                                                    NC2164.2
   000270         027400     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2164.2 IMP
   000271         027500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2164.2
   000272         027600     02 ID-AGAIN                     PIC X(9).                    NC2164.2
   000273         027700     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2164.2 IMP
   000274         027800 01  CCVS-E-2.                                                    NC2164.2
   000275         027900     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2164.2 IMP
   000276         028000     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2164.2 IMP
   000277         028100     02 CCVS-E-2-2.                                               NC2164.2
   000278         028200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2164.2 IMP
   000279         028300         03 FILLER                   PIC X      VALUE SPACE.      NC2164.2 IMP
   000280         028400         03 ENDER-DESC               PIC X(44)  VALUE             NC2164.2
   000281         028500            "ERRORS ENCOUNTERED".                                 NC2164.2
   000282         028600 01  CCVS-E-3.                                                    NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     02  FILLER                      PIC X(22)  VALUE             NC2164.2
   000284         028800            " FOR OFFICIAL USE ONLY".                             NC2164.2
   000285         028900     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2164.2 IMP
   000286         029000     02  FILLER                      PIC X(58)  VALUE             NC2164.2
   000287         029100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2164.2
   000288         029200     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2164.2 IMP
   000289         029300     02 FILLER                       PIC X(15)  VALUE             NC2164.2
   000290         029400             " COPYRIGHT 1985".                                   NC2164.2
   000291         029500 01  CCVS-E-4.                                                    NC2164.2
   000292         029600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2164.2 IMP
   000293         029700     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2164.2
   000294         029800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2164.2 IMP
   000295         029900     02 FILLER                       PIC X(40)  VALUE             NC2164.2
   000296         030000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2164.2
   000297         030100 01  XXINFO.                                                      NC2164.2
   000298         030200     02 FILLER                       PIC X(19)  VALUE             NC2164.2
   000299         030300            "*** INFORMATION ***".                                NC2164.2
   000300         030400     02 INFO-TEXT.                                                NC2164.2
   000301         030500       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2164.2 IMP
   000302         030600       04 XXCOMPUTED                 PIC X(20).                   NC2164.2
   000303         030700       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2164.2 IMP
   000304         030800       04 XXCORRECT                  PIC X(20).                   NC2164.2
   000305         030900     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2164.2
   000306         031000 01  HYPHEN-LINE.                                                 NC2164.2
   000307         031100     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2164.2 IMP
   000308         031200     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2164.2
   000309         031300-    "*****************************************".                 NC2164.2
   000310         031400     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2164.2
   000311         031500-    "******************************".                            NC2164.2
   000312         031600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2164.2
   000313         031700     "NC216A".                                                    NC2164.2
   000314         031800 PROCEDURE DIVISION.                                              NC2164.2
   000315         031900 CCVS1 SECTION.                                                   NC2164.2
   000316         032000 OPEN-FILES.                                                      NC2164.2
   000317         032100     OPEN     OUTPUT PRINT-FILE.                                  NC2164.2 35
   000318         032200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2164.2 312 253 312 272
   000319         032300     MOVE    SPACE TO TEST-RESULTS.                               NC2164.2 IMP 173
   000320         032400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2164.2 345 350
   000321         032500     GO TO CCVS1-EXIT.                                            NC2164.2 427
   000322         032600 CLOSE-FILES.                                                     NC2164.2
   000323         032700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2164.2 354 375 35
   000324         032800 TERMINATE-CCVS.                                                  NC2164.2
   000325         032900     EXIT PROGRAM.                                                NC2164.2
   000326         033000 TERMINATE-CALL.                                                  NC2164.2
   000327         033100     STOP     RUN.                                                NC2164.2
   000328         033200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2164.2 177 229
   000329         033300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2164.2 177 230
   000330         033400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2164.2 177 228
   000331         033500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2164.2 177 227
   000332         033600     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2164.2 184
   000333         033700 PRINT-DETAIL.                                                    NC2164.2
   000334         033800     IF REC-CT NOT EQUAL TO ZERO                                  NC2164.2 226 IMP
   000335      1  033900             MOVE "." TO PARDOT-X                                 NC2164.2 181
   000336      1  034000             MOVE REC-CT TO DOTVALUE.                             NC2164.2 226 182
   000337         034100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2164.2 173 36 387
   000338         034200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2164.2 177 387
   000339      1  034300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2164.2 404 417
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340      1  034400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2164.2 418 426
   000341         034500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2164.2 IMP 177 IMP 189
   000342         034600     MOVE SPACE TO CORRECT-X.                                     NC2164.2 IMP 203
   000343         034700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2164.2 226 IMP IMP 179
   000344         034800     MOVE     SPACE TO RE-MARK.                                   NC2164.2 IMP 184
   000345         034900 HEAD-ROUTINE.                                                    NC2164.2
   000346         035000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2164.2 236 37 387
   000347         035100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2164.2 241 37 387
   000348         035200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2164.2 250 37 387
   000349         035300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2164.2 262 37 387
   000350         035400 COLUMN-NAMES-ROUTINE.                                            NC2164.2
   000351         035500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2164.2 214 37 387
   000352         035600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2164.2 219 37 387
   000353         035700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2164.2 306 37 387
   000354         035800 END-ROUTINE.                                                     NC2164.2
   000355         035900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2164.2 306 37 387
   000356         036000 END-RTN-EXIT.                                                    NC2164.2
   000357         036100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2164.2 269 37 387
   000358         036200 END-ROUTINE-1.                                                   NC2164.2
   000359         036300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2164.2 228 232 229
   000360         036400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2164.2 232 227 232
   000361         036500      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2164.2 230 232
   000362         036600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2164.2
   000363         036700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2164.2 230 292
   000364         036800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2164.2 232 294
   000365         036900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2164.2 291 277
   000366         037000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2164.2 274 37 387
   000367         037100  END-ROUTINE-12.                                                 NC2164.2
   000368         037200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2164.2 280
   000369         037300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2164.2 228 IMP
   000370      1  037400         MOVE "NO " TO ERROR-TOTAL                                NC2164.2 278
   000371         037500         ELSE                                                     NC2164.2
   000372      1  037600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2164.2 228 278
   000373         037700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2164.2 274 37
   000374         037800     PERFORM WRITE-LINE.                                          NC2164.2 387
   000375         037900 END-ROUTINE-13.                                                  NC2164.2
   000376         038000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2164.2 227 IMP
   000377      1  038100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2164.2 278
   000378      1  038200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2164.2 227 278
   000379         038300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2164.2 280
   000380         038400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2164.2 274 37 387
   000381         038500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2164.2 229 IMP
   000382      1  038600          MOVE "NO " TO ERROR-TOTAL                               NC2164.2 278
   000383      1  038700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2164.2 229 278
   000384         038800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2164.2 280
   000385         038900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2164.2 274 37 387
   000386         039000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2164.2 282 37 387
   000387         039100 WRITE-LINE.                                                      NC2164.2
   000388         039200     ADD 1 TO RECORD-COUNT.                                       NC2164.2 234
   000389         039300     IF RECORD-COUNT GREATER 50                                   NC2164.2 234
   000390      1  039400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2164.2 37 233
   000391      1  039500         MOVE SPACE TO DUMMY-RECORD                               NC2164.2 IMP 37
   000392      1  039600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2164.2 37
   000393      1  039700         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2164.2 214 37 399
   000394      1  039800         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2164.2 219 37 399
   000395      1  039900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2164.2 306 37 399
   000396      1  040000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2164.2 233 37
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040100         MOVE ZERO TO RECORD-COUNT.                               NC2164.2 IMP 234
   000398         040200     PERFORM WRT-LN.                                              NC2164.2 399
   000399         040300 WRT-LN.                                                          NC2164.2
   000400         040400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2164.2 37
   000401         040500     MOVE SPACE TO DUMMY-RECORD.                                  NC2164.2 IMP 37
   000402         040600 BLANK-LINE-PRINT.                                                NC2164.2
   000403         040700     PERFORM WRT-LN.                                              NC2164.2 399
   000404         040800 FAIL-ROUTINE.                                                    NC2164.2
   000405         040900     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2164.2 189 IMP 412
   000406         041000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2164.2 203 IMP 412
   000407         041100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2164.2 235 305
   000408         041200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2164.2 300
   000409         041300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2164.2 297 37 387
   000410         041400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2164.2 IMP 305
   000411         041500     GO TO  FAIL-ROUTINE-EX.                                      NC2164.2 417
   000412         041600 FAIL-ROUTINE-WRITE.                                              NC2164.2
   000413         041700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2164.2 185 36 387
   000414         041800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2164.2 235 213
   000415         041900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2164.2 200 36 387
   000416         042000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2164.2 IMP 213
   000417         042100 FAIL-ROUTINE-EX. EXIT.                                           NC2164.2
   000418         042200 BAIL-OUT.                                                        NC2164.2
   000419         042300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2164.2 190 IMP 421
   000420         042400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2164.2 204 IMP 426
   000421         042500 BAIL-OUT-WRITE.                                                  NC2164.2
   000422         042600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2164.2 204 304 190 302
   000423         042700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2164.2 235 305
   000424         042800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2164.2 297 37 387
   000425         042900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2164.2 IMP 305
   000426         043000 BAIL-OUT-EX. EXIT.                                               NC2164.2
   000427         043100 CCVS1-EXIT.                                                      NC2164.2
   000428         043200     EXIT.                                                        NC2164.2
   000429         043300 SECT-NC216A-001 SECTION.                                         NC2164.2
   000430         043400*                                                                 NC2164.2
   000431         043500 INS-INIT-F1-1.                                                   NC2164.2
   000432         043600     MOVE "INS-TEST-F1-1" TO PAR-NAME.                            NC2164.2 179
   000433         043700     MOVE   "VI-94" TO ANSI-REFERENCE.                            NC2164.2 235
   000434         043800     MOVE "TALLY FOR CHARACTERS" TO FEATURE.                      NC2164.2 175
   000435         043900     MOVE                                                         NC2164.2
   000436         044000     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000437         044100-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000438         044200         TO WC-XN-83.                                             NC2164.2 69
   000439         044300     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   000440         044400 INS-TEST-F1-1.                                                   NC2164.2
   000441         044500     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR CHARACTERS.       NC2164.2 69 39
   000442         044600     IF      WRK-DU-999-1 EQUAL TO 83                             NC2164.2 39
   000443      1  044700             PERFORM PASS                                         NC2164.2 329
   000444      1  044800             GO TO   INS-WRITE-F1-1.                              NC2164.2 453
   000445         044900     GO TO INS-FAIL-F1-1.                                         NC2164.2 449
   000446         045000 INS-DELETE-F1-1.                                                 NC2164.2
   000447         045100     PERFORM DE-LETE.                                             NC2164.2 331
   000448         045200     GO TO INS-WRITE-F1-1.                                        NC2164.2 453
   000449         045300 INS-FAIL-F1-1.                                                   NC2164.2
   000450         045400     PERFORM FAIL.                                                NC2164.2 330
   000451         045500     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC2164.2 39 191
   000452         045600     MOVE 83 TO CORRECT-N.                                        NC2164.2 205
   000453         045700 INS-WRITE-F1-1.                                                  NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000455         045900*                                                                 NC2164.2
   000456         046000 INS-INIT-F1-2.                                                   NC2164.2
   000457         046100     MOVE "INS-TEST-F1-2" TO PAR-NAME.                            NC2164.2 179
   000458         046200     MOVE   "VI-94" TO ANSI-REFERENCE.                            NC2164.2 235
   000459         046300     MOVE "TALLY ALL LITERAL" TO FEATURE.                         NC2164.2 175
   000460         046400     MOVE                                                         NC2164.2
   000461         046500     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000462         046600-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000463         046700         TO WC-XN-83.                                             NC2164.2 69
   000464         046800     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   000465         046900 INS-TEST-F1-2.                                                   NC2164.2
   000466         047000     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR ALL "A".          NC2164.2 69 39
   000467         047100     IF      WRK-DU-999-1 EQUAL TO 8                              NC2164.2 39
   000468      1  047200            PERFORM PASS                                          NC2164.2 329
   000469      1  047300            GO      TO INS-WRITE-F1-2.                            NC2164.2 478
   000470         047400     GO TO INS-FAIL-F1-2.                                         NC2164.2 474
   000471         047500 INS-DELETE-F1-2.                                                 NC2164.2
   000472         047600     PERFORM DE-LETE.                                             NC2164.2 331
   000473         047700     GO TO INS-WRITE-F1-2.                                        NC2164.2 478
   000474         047800 INS-FAIL-F1-2.                                                   NC2164.2
   000475         047900     PERFORM FAIL.                                                NC2164.2 330
   000476         048000     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC2164.2 39 191
   000477         048100     MOVE 8 TO CORRECT-N.                                         NC2164.2 205
   000478         048200 INS-WRITE-F1-2.                                                  NC2164.2
   000479         048300     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000480         048400*                                                                 NC2164.2
   000481         048500 INS-INIT-F1-3.                                                   NC2164.2
   000482         048600     MOVE "INS-TEST-F1-3" TO PAR-NAME.                            NC2164.2 179
   000483         048700     MOVE   "VI-94" TO ANSI-REFERENCE.                            NC2164.2 235
   000484         048800     MOVE "TALLY FOR ALL SPACES" TO FEATURE.                      NC2164.2 175
   000485         048900     MOVE                                                         NC2164.2
   000486         049000     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000487         049100-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000488         049200         TO WC-XN-83.                                             NC2164.2 69
   000489         049300     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   000490         049400 INS-TEST-F1-3.                                                   NC2164.2
   000491         049500     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR ALL SPACES.       NC2164.2 69 39 IMP
   000492         049600     IF      WRK-DU-999-1 EQUAL TO 17                             NC2164.2 39
   000493      1  049700     PERFORM PASS                                                 NC2164.2 329
   000494      1  049800     GO      TO INS-WRITE-F1-3.                                   NC2164.2 503
   000495         049900     GO TO INS-FAIL-F1-3.                                         NC2164.2 499
   000496         050000 INS-DELETE-F1-3.                                                 NC2164.2
   000497         050100     PERFORM DE-LETE.                                             NC2164.2 331
   000498         050200     GO TO INS-WRITE-F1-3.                                        NC2164.2 503
   000499         050300 INS-FAIL-F1-3.                                                   NC2164.2
   000500         050400     PERFORM FAIL.                                                NC2164.2 330
   000501         050500     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC2164.2 39 191
   000502         050600     MOVE 17 TO CORRECT-N.                                        NC2164.2 205
   000503         050700 INS-WRITE-F1-3.                                                  NC2164.2
   000504         050800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000505         050900*                                                                 NC2164.2
   000506         051000 INS-INIT-F1-4.                                                   NC2164.2
   000507         051100     MOVE "INS-TEST-F1-4" TO PAR-NAME.                            NC2164.2 179
   000508         051200     MOVE   "VI-94" TO ANSI-REFERENCE.                            NC2164.2 235
   000509         051300     MOVE "TALLY LEADING LIT" TO FEATURE.                         NC2164.2 175
   000510         051400     MOVE                                                         NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000512         051600-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000513         051700         TO WC-XN-83.                                             NC2164.2 69
   000514         051800     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   000515         051900 INS-TEST-F1-4.                                                   NC2164.2
   000516         052000     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR LEADING "AH".     NC2164.2 69 39
   000517         052100     IF      WRK-DU-999-1 EQUAL TO 1                              NC2164.2 39
   000518      1  052200     PERFORM PASS                                                 NC2164.2 329
   000519      1  052300     GO      TO INS-WRITE-F1-4.                                   NC2164.2 528
   000520         052400     GO TO INS-FAIL-F1-4.                                         NC2164.2 524
   000521         052500 INS-DELETE-F1-4.                                                 NC2164.2
   000522         052600     PERFORM DE-LETE.                                             NC2164.2 331
   000523         052700     GO TO INS-WRITE-F1-4.                                        NC2164.2 528
   000524         052800 INS-FAIL-F1-4.                                                   NC2164.2
   000525         052900     PERFORM FAIL.                                                NC2164.2 330
   000526         053000     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC2164.2 39 191
   000527         053100     MOVE 1 TO CORRECT-N.                                         NC2164.2 205
   000528         053200 INS-WRITE-F1-4.                                                  NC2164.2
   000529         053300     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000530         053400*                                                                 NC2164.2
   000531         053500 INS-INIT-F1-5.                                                   NC2164.2
   000532         053600     MOVE "INS-TEST-F1-5" TO PAR-NAME.                            NC2164.2 179
   000533         053700     MOVE   "VI-94" TO ANSI-REFERENCE.                            NC2164.2 235
   000534         053800     MOVE "FOR CHARS AFTER LIT" TO FEATURE.                       NC2164.2 175
   000535         053900     MOVE                                                         NC2164.2
   000536         054000     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000537         054100-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000538         054200         TO WC-XN-83.                                             NC2164.2 69
   000539         054300     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   000540         054400 INS-TEST-F1-5.                                                   NC2164.2
   000541         054500     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR CHARACTERS        NC2164.2 69 39
   000542         054600         AFTER " W".                                              NC2164.2
   000543         054700     IF      WRK-DU-999-1 EQUAL TO 68                             NC2164.2 39
   000544      1  054800     PERFORM PASS                                                 NC2164.2 329
   000545      1  054900     GO      TO INS-WRITE-F1-5.                                   NC2164.2 554
   000546         055000     GO TO INS-FAIL-F1-5.                                         NC2164.2 550
   000547         055100 INS-DELETE-F1-5.                                                 NC2164.2
   000548         055200     PERFORM DE-LETE.                                             NC2164.2 331
   000549         055300     GO TO INS-WRITE-F1-5.                                        NC2164.2 554
   000550         055400 INS-FAIL-F1-5.                                                   NC2164.2
   000551         055500     PERFORM FAIL.                                                NC2164.2 330
   000552         055600     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC2164.2 39 191
   000553         055700     MOVE 68 TO CORRECT-N.                                        NC2164.2 205
   000554         055800 INS-WRITE-F1-5.                                                  NC2164.2
   000555         055900     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000556         056000*                                                                 NC2164.2
   000557         056100 INS-INIT-F1-6.                                                   NC2164.2
   000558         056200     MOVE "INS-TEST-F1-6" TO PAR-NAME.                            NC2164.2 179
   000559         056300     MOVE   "VI-94" TO ANSI-REFERENCE.                            NC2164.2 235
   000560         056400     MOVE "ALL BEFORE INITIAL" TO FEATURE.                        NC2164.2 175
   000561         056500     MOVE                                                         NC2164.2
   000562         056600     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000563         056700-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000564         056800         TO WC-XN-83.                                             NC2164.2 69
   000565         056900     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   000566         057000 INS-TEST-F1-6.                                                   NC2164.2
   000567         057100     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR ALL " "           NC2164.2 69 39
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200         BEFORE INITIAL "W.C.".                                   NC2164.2
   000569         057300     IF      WRK-DU-999-1 EQUAL TO 4                              NC2164.2 39
   000570      1  057400     PERFORM PASS                                                 NC2164.2 329
   000571      1  057500     GO      TO INS-WRITE-F1-6.                                   NC2164.2 580
   000572         057600     GO TO INS-FAIL-F1-6.                                         NC2164.2 576
   000573         057700 INS-DELETE-F1-6.                                                 NC2164.2
   000574         057800     PERFORM DE-LETE.                                             NC2164.2 331
   000575         057900     GO TO INS-WRITE-F1-6.                                        NC2164.2 580
   000576         058000 INS-FAIL-F1-6.                                                   NC2164.2
   000577         058100     PERFORM FAIL.                                                NC2164.2 330
   000578         058200     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC2164.2 39 191
   000579         058300     MOVE 4 TO CORRECT-N.                                         NC2164.2 205
   000580         058400 INS-WRITE-F1-6.                                                  NC2164.2
   000581         058500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000582         058600*                                                                 NC2164.2
   000583         058700 INS-INIT-F1-7.                                                   NC2164.2
   000584         058800     MOVE "INS-TEST-F1-7" TO PAR-NAME.                            NC2164.2 179
   000585         058900     MOVE   "VI-94" TO ANSI-REFERENCE.                            NC2164.2 235
   000586         059000     MOVE "LEAD LIT INITIAL FIG" TO FEATURE.                      NC2164.2 175
   000587         059100     MOVE                                                         NC2164.2
   000588         059200     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000589         059300-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000590         059400         TO WC-XN-83.                                             NC2164.2 69
   000591         059500     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   000592         059600 INS-TEST-F1-7.                                                   NC2164.2
   000593         059700     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR LEADING "Y"       NC2164.2 69 39
   000594         059800         AFTER INITIAL SPACES.                                    NC2164.2 IMP
   000595         059900     IF      WRK-DU-999-1 EQUAL TO 1                              NC2164.2 39
   000596      1  060000     PERFORM PASS                                                 NC2164.2 329
   000597      1  060100     GO      TO INS-WRITE-F1-7.                                   NC2164.2 606
   000598         060200     GO TO INS-FAIL-F1-7.                                         NC2164.2 602
   000599         060300 INS-DELETE-F1-7.                                                 NC2164.2
   000600         060400     PERFORM DE-LETE.                                             NC2164.2 331
   000601         060500     GO TO INS-WRITE-F1-7.                                        NC2164.2 606
   000602         060600 INS-FAIL-F1-7.                                                   NC2164.2
   000603         060700     PERFORM FAIL.                                                NC2164.2 330
   000604         060800     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC2164.2 39 191
   000605         060900     MOVE 1 TO CORRECT-N.                                         NC2164.2 205
   000606         061000 INS-WRITE-F1-7.                                                  NC2164.2
   000607         061100     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000608         061200*                                                                 NC2164.2
   000609         061300 INS-INIT-F2-8.                                                   NC2164.2
   000610         061400     MOVE "INS-TEST-F2-8" TO PAR-NAME.                            NC2164.2 179
   000611         061500     MOVE   "VI-94 6.17.3" TO ANSI-REFERENCE.                     NC2164.2 235
   000612         061600     MOVE "REP CHARS BY SPACES" TO FEATURE.                       NC2164.2 175
   000613         061700     MOVE                                                         NC2164.2
   000614         061800     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000615         061900-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000616         062000         TO WC-XN-83.                                             NC2164.2 69
   000617         062100     MOVE    WC-XN-83 TO WRK-XN-83-1.                             NC2164.2 69 63
   000618         062200     MOVE                                                         NC2164.2
   000619         062300     "AH YES OH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000620         062400-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000621         062500         TO ANS-XN-83-5.                                          NC2164.2 84
   000622         062600 INS-TEST-F2-8.                                                   NC2164.2
   000623         062700     INSPECT WRK-XN-83-1 REPLACING CHARACTERS BY SPACES.          NC2164.2 63 IMP
   000624         062800     IF      WRK-XN-83-1 EQUAL TO SPACES                          NC2164.2 63 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  062900             PERFORM PASS                                         NC2164.2 329
   000626      1  063000             GO      TO INS-WRITE-F2-8.                           NC2164.2 653
   000627         063100     GO TO INS-FAIL-F2-8.                                         NC2164.2 631
   000628         063200 INS-DELETE-F2-8.                                                 NC2164.2
   000629         063300     PERFORM DE-LETE.                                             NC2164.2 331
   000630         063400     GO TO INS-WRITE-F2-8.                                        NC2164.2 653
   000631         063500 INS-FAIL-F2-8.                                                   NC2164.2
   000632         063600     PERFORM FAIL.                                                NC2164.2 330
   000633         063700     MOVE    "83 SPACES" TO RE-MARK.                              NC2164.2 184
   000634         063800     MOVE    WRK-XN-83-1 TO WS-WRONG-1-83.                        NC2164.2 63 113
   000635         063900     MOVE    SPACES      TO WS-RIGHT-1-83.                        NC2164.2 IMP 107
   000636         064000     PERFORM FAIL.                                                NC2164.2 330
   000637         064100     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83.                    NC2164.2 63 113
   000638         064200     MOVE    ANS-XN-83-5     TO WS-RIGHT-1-83.                    NC2164.2 84 107
   000639         064300     MOVE    WS-RIGHT-1-20   TO CORRECT-A.                        NC2164.2 108 204
   000640         064400     MOVE    WS-WRONG-1-20   TO COMPUTED-A.                       NC2164.2 114 190
   000641         064500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000642         064600     MOVE    WS-RIGHT-21-40  TO CORRECT-A.                        NC2164.2 109 204
   000643         064700     MOVE    WS-WRONG-21-40  TO COMPUTED-A.                       NC2164.2 115 190
   000644         064800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000645         064900     MOVE    WS-RIGHT-41-60  TO CORRECT-A.                        NC2164.2 110 204
   000646         065000     MOVE    WS-WRONG-41-60  TO COMPUTED-A.                       NC2164.2 116 190
   000647         065100     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000648         065200     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   000649         065300     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   000650         065400     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000651         065500     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   000652         065600     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   000653         065700 INS-WRITE-F2-8.                                                  NC2164.2
   000654         065800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000655         065900*                                                                 NC2164.2
   000656         066000 INS-INIT-F2-9.                                                   NC2164.2
   000657         066100     MOVE "INS-TEST-F2-9" TO PAR-NAME.                            NC2164.2 179
   000658         066200     MOVE   "VI-94 6.17.3" TO ANSI-REFERENCE.                     NC2164.2 235
   000659         066300     MOVE "CHARS BEFORE INITIAL" TO FEATURE.                      NC2164.2 175
   000660         066400     MOVE                                                         NC2164.2
   000661         066500     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000662         066600-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000663         066700         TO WC-XN-83.                                             NC2164.2 69
   000664         066800     MOVE                                                         NC2164.2
   000665         066900     "OH YES AH YES W.C. FROTOES HERE, ANYONE WHO HATES DOGS AND KNC2164.2
   000666         067000-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000667         067100         TO ANS-XN-83-9.                                          NC2164.2 96
   000668         067200     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   000669         067300     MOVE    1 TO REC-CT.                                         NC2164.2 226
   000670         067400 INS-TEST-F2-9.                                                   NC2164.2
   000671         067500     INSPECT WRK-XN-83-1                                          NC2164.2 63
   000672         067600         REPLACING LEADING "AH" BY "OH" BEFORE INITIAL " AH YES"  NC2164.2
   000673         067700                   FIRST "I" BY "O" AFTER INITIAL "."             NC2164.2
   000674         067800                   ALL ". " BY ", " AFTER INITIAL "HE".           NC2164.2
   000675         067900     MOVE    WRK-XN-83-1 TO WRK-XN-83-2.                          NC2164.2 63 64
   000676         068000     INSPECT WRK-XN-83-1                                          NC2164.2 63
   000677         068100         REPLACING ALL "OT" BY "IT" BEFORE "HE"                   NC2164.2
   000678         068200                   LEADING ", " BY ". " AFTER "RE"                NC2164.2
   000679         068300                   FIRST "KIDS CAN NOT BE" BY  KIDS-CAN-NOT-BE    NC2164.2 67
   000680         068400                   ALL BLANK-PERIOD BY " ." AFTER "BAD".          NC2164.2 68
   000681         068500     GO      TO INS-TEST-F2-9-1.                                  NC2164.2 687
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600 INS-DELETE-F2-9.                                                 NC2164.2
   000683         068700     PERFORM DE-LETE.                                             NC2164.2 331
   000684         068800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000685         068900     GO      TO INS-TEST-F2-10.                                   NC2164.2 741
   000686         069000*                                                                 NC2164.2
   000687         069100 INS-TEST-F2-9-1.                                                 NC2164.2
   000688         069200     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-1                     NC2164.2 63 72
   000689      1  069300             PERFORM PASS                                         NC2164.2 329
   000690      1  069400             GO TO INS-WRITE-F2-9-1                               NC2164.2 700
   000691         069500     ELSE                                                         NC2164.2
   000692      1  069600             GO TO INS-FAIL-F2-9-1.                               NC2164.2 696
   000693         069700 INS-DELETE-F2-9-1.                                               NC2164.2
   000694         069800     PERFORM DE-LETE.                                             NC2164.2 331
   000695         069900     GO TO INS-WRITE-F2-9-1.                                      NC2164.2 700
   000696         070000 INS-FAIL-F2-9-1.                                                 NC2164.2
   000697         070100     PERFORM FAIL                                                 NC2164.2 330
   000698         070200     MOVE    WRK-XN-83-1 TO COMPUTED-A                            NC2164.2 63 190
   000699         070300     MOVE    ANS-XN-83-1 TO CORRECT-A.                            NC2164.2 72 204
   000700         070400 INS-WRITE-F2-9-1.                                                NC2164.2
   000701         070500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000702         070600*                                                                 NC2164.2
   000703         070700 INS-TEST-F2-9-2.                                                 NC2164.2
   000704         070800     ADD     1 TO REC-CT.                                         NC2164.2 226
   000705         070900     IF      WRK-XN-83-2 EQUAL TO ANS-XN-83-9                     NC2164.2 64 96
   000706      1  071000             PERFORM PASS                                         NC2164.2 329
   000707      1  071100             GO TO INS-WRITE-F2-9-2                               NC2164.2 728
   000708         071200     ELSE                                                         NC2164.2
   000709      1  071300             GO TO INS-FAIL-F2-9-2.                               NC2164.2 710
   000710         071400 INS-FAIL-F2-9-2.                                                 NC2164.2
   000711         071500     PERFORM FAIL                                                 NC2164.2 330
   000712         071600     MOVE    WRK-XN-83-2     TO WS-WRONG-1-83                     NC2164.2 64 113
   000713         071700     MOVE    ANS-XN-83-9     TO WS-RIGHT-1-83                     NC2164.2 96 107
   000714         071800     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   000715         071900     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   000716         072000     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000717         072100     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   000718         072200     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   000719         072300     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000720         072400     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   000721         072500     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   000722         072600     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000723         072700     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   000724         072800     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   000725         072900     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000726         073000     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   000727         073100     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   000728         073200 INS-WRITE-F2-9-2.                                                NC2164.2
   000729         073300     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000730         073400*                                                                 NC2164.2
   000731         073500 INS-INIT-F2-10.                                                  NC2164.2
   000732         073600     MOVE "INS-TEST-F2-10" TO PAR-NAME.                           NC2164.2 179
   000733         073700     MOVE   "VI-94 6.17.3" TO ANSI-REFERENCE.                     NC2164.2 235
   000734         073800     MOVE "LEAD AFTER INIT ID" TO FEATURE.                        NC2164.2 175
   000735         073900     MOVE    ZERO TO REC-CT.                                      NC2164.2 IMP 226
   000736         074000     MOVE                                                         NC2164.2
   000737         074100     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000738         074200-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300         TO WC-XN-83.                                             NC2164.2 69
   000740         074400     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   000741         074500 INS-TEST-F2-10.                                                  NC2164.2
   000742         074600     INSPECT WRK-XN-83-1 REPLACING LEADING SPACE-XN-1-1           NC2164.2 63 44
   000743         074700         BY COMMA-XN-1-1 AFTER INITIAL YES-XN-3.                  NC2164.2 45 60
   000744         074800     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-2                     NC2164.2 63 75
   000745      1  074900     PERFORM PASS                                                 NC2164.2 329
   000746      1  075000     GO      TO INS-WRITE-F2-10.                                  NC2164.2 769
   000747         075100     GO TO INS-FAIL-F2-10.                                        NC2164.2 751
   000748         075200 INS-DELETE-F2-10.                                                NC2164.2
   000749         075300     PERFORM DE-LETE.                                             NC2164.2 331
   000750         075400     GO TO INS-WRITE-F2-10.                                       NC2164.2 769
   000751         075500 INS-FAIL-F2-10.                                                  NC2164.2
   000752         075600     PERFORM FAIL.                                                NC2164.2 330
   000753         075700     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   000754         075800     MOVE    ANS-XN-83-2     TO WS-RIGHT-1-83                     NC2164.2 75 107
   000755         075900     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   000756         076000     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   000757         076100     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000758         076200     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   000759         076300     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   000760         076400     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000761         076500     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   000762         076600     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   000763         076700     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000764         076800     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   000765         076900     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   000766         077000     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000767         077100     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   000768         077200     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   000769         077300 INS-WRITE-F2-10.                                                 NC2164.2
   000770         077400     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000771         077500*                                                                 NC2164.2
   000772         077600 INS-INIT-F2-11.                                                  NC2164.2
   000773         077700     MOVE "INS-TEST-F2-11" TO PAR-NAME.                           NC2164.2 179
   000774         077800     MOVE   "VI-94 6.17.3" TO ANSI-REFERENCE.                     NC2164.2 235
   000775         077900     MOVE "FIRST BY ID BEFORE" TO FEATURE.                        NC2164.2 175
   000776         078000     MOVE                                                         NC2164.2
   000777         078100     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000778         078200-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000779         078300         TO WC-XN-83.                                             NC2164.2 69
   000780         078400     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   000781         078500     MOVE "O" TO O-XN-1-1.                                        NC2164.2 52
   000782         078600 INS-TEST-F2-11.                                                  NC2164.2
   000783         078700     INSPECT WRK-XN-83-1 REPLACING FIRST "A" BY O-XN-1-1          NC2164.2 63 52
   000784         078800         BEFORE INITIAL "H YES".                                  NC2164.2
   000785         078900     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-1                     NC2164.2 63 72
   000786      1  079000     PERFORM PASS                                                 NC2164.2 329
   000787      1  079100     GO      TO INS-WRITE-F2-11.                                  NC2164.2 810
   000788         079200     GO TO INS-FAIL-F2-11.                                        NC2164.2 792
   000789         079300 INS-DELETE-F2-11.                                                NC2164.2
   000790         079400     PERFORM DE-LETE.                                             NC2164.2 331
   000791         079500     GO TO INS-WRITE-F2-11.                                       NC2164.2 810
   000792         079600 INS-FAIL-F2-11.                                                  NC2164.2
   000793         079700     PERFORM FAIL.                                                NC2164.2 330
   000794         079800     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   000795         079900     MOVE    ANS-XN-83-1     TO WS-RIGHT-1-83                     NC2164.2 72 107
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   000797         080100     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   000798         080200     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000799         080300     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   000800         080400     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   000801         080500     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000802         080600     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   000803         080700     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   000804         080800     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000805         080900     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   000806         081000     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   000807         081100     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000808         081200     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   000809         081300     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   000810         081400 INS-WRITE-F2-11.                                                 NC2164.2
   000811         081500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000812         081600*                                                                 NC2164.2
   000813         081700 INS-INIT-F2-12.                                                  NC2164.2
   000814         081800     MOVE "INS-TEST-F2-12" TO PAR-NAME.                           NC2164.2 179
   000815         081900     MOVE   "VI-94 6.17.3" TO ANSI-REFERENCE.                     NC2164.2 235
   000816         082000     MOVE "ALL ID BY LIT AFTER" TO FEATURE.                       NC2164.2 175
   000817         082100     MOVE                                                         NC2164.2
   000818         082200     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000819         082300-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000820         082400         TO WC-XN-83.                                             NC2164.2 69
   000821         082500     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   000822         082600 INS-TEST-F2-12.                                                  NC2164.2
   000823         082700     INSPECT WRK-XN-83-1 REPLACING ALL SPACE-XN-1-1 BY "-"        NC2164.2 63 44
   000824         082800         AFTER ALL-XN-3.                                          NC2164.2 59
   000825         082900     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-3                     NC2164.2 63 78
   000826      1  083000     PERFORM PASS                                                 NC2164.2 329
   000827      1  083100     GO      TO INS-WRITE-F2-12.                                  NC2164.2 850
   000828         083200     GO TO INS-FAIL-F2-12.                                        NC2164.2 832
   000829         083300 INS-DELETE-F2-12.                                                NC2164.2
   000830         083400     PERFORM DE-LETE.                                             NC2164.2 331
   000831         083500     GO TO INS-WRITE-F2-12.                                       NC2164.2 850
   000832         083600 INS-FAIL-F2-12.                                                  NC2164.2
   000833         083700     PERFORM FAIL.                                                NC2164.2 330
   000834         083800     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   000835         083900     MOVE    ANS-XN-83-3     TO WS-RIGHT-1-83                     NC2164.2 78 107
   000836         084000     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   000837         084100     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   000838         084200     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000839         084300     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   000840         084400     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   000841         084500     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000842         084600     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   000843         084700     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   000844         084800     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000845         084900     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   000846         085000     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   000847         085100     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000848         085200     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   000849         085300     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   000850         085400 INS-WRITE-F2-12.                                                 NC2164.2
   000851         085500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000852         085600*                                                                 NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700 INS-INIT-F3-13.                                                  NC2164.2
   000854         085800     MOVE "INS-TEST-F3-13" TO PAR-NAME.                           NC2164.2 179
   000855         085900     MOVE "VI-94 6.17.3"   TO ANSI-REFERENCE.                     NC2164.2 235
   000856         086000     MOVE "TALLY-REPLACE CHARS" TO FEATURE.                       NC2164.2 175
   000857         086100     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   000858         086200     MOVE                                                         NC2164.2
   000859         086300     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000860         086400-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000861         086500         TO WC-XN-83.                                             NC2164.2 69
   000862         086600     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   000863         086700     MOVE    1 TO REC-CT.                                         NC2164.2 226
   000864         086800 INS-TEST-F3-13-0.                                                NC2164.2
   000865         086900     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR CHARACTERS     NC2164.2 63 39
   000866         087000         REPLACING CHARACTERS BY SPACES.                          NC2164.2 IMP
   000867         087100     GO      TO INS-TEST-F3-13-1.                                 NC2164.2 873
   000868         087200 INS-DELETE-F3-13.                                                NC2164.2
   000869         087300     PERFORM DE-LETE.                                             NC2164.2 331
   000870         087400     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000871         087500     GO TO INS-INIT-F3-14.                                        NC2164.2 906
   000872         087600*                                                                 NC2164.2
   000873         087700 INS-TEST-F3-13-1.                                                NC2164.2
   000874         087800     IF      WRK-DU-999-1 EQUAL TO 83                             NC2164.2 39
   000875      1  087900             PERFORM PASS                                         NC2164.2 329
   000876      1  088000             GO TO INS-WRITE-F3-13-1                              NC2164.2 886
   000877         088100     ELSE                                                         NC2164.2
   000878      1  088200             GO TO INS-FAIL-F3-13-1.                              NC2164.2 882
   000879         088300 INS-DELETE-F3-13-1.                                              NC2164.2
   000880         088400     PERFORM DE-LETE.                                             NC2164.2 331
   000881         088500     GO TO INS-WRITE-F3-13-1.                                     NC2164.2 886
   000882         088600 INS-FAIL-F3-13-1.                                                NC2164.2
   000883         088700     PERFORM FAIL                                                 NC2164.2 330
   000884         088800     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   000885         088900     MOVE    83 TO CORRECT-N.                                     NC2164.2 205
   000886         089000 INS-WRITE-F3-13-1.                                               NC2164.2
   000887         089100     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000888         089200*                                                                 NC2164.2
   000889         089300 TEST-13-2.                                                       NC2164.2
   000890         089400     ADD     1 TO REC-CT.                                         NC2164.2 226
   000891         089500     IF      WRK-XN-83-1 EQUAL TO SPACES                          NC2164.2 63 IMP
   000892      1  089600             PERFORM PASS                                         NC2164.2 329
   000893      1  089700             GO TO INS-WRITE-F3-13-2                              NC2164.2 903
   000894         089800     ELSE                                                         NC2164.2
   000895      1  089900             GO TO INS-FAIL-F3-13-2.                              NC2164.2 899
   000896         090000 INS-DELETE-F3-13-2.                                              NC2164.2
   000897         090100     PERFORM DE-LETE.                                             NC2164.2 331
   000898         090200     GO TO INS-WRITE-F3-13-2.                                     NC2164.2 903
   000899         090300 INS-FAIL-F3-13-2.                                                NC2164.2
   000900         090400     PERFORM FAIL                                                 NC2164.2 330
   000901         090500     MOVE    WRK-XN-83-1 TO COMPUTED-A                            NC2164.2 63 190
   000902         090600     MOVE    "83 SPACES" TO CORRECT-A.                            NC2164.2 204
   000903         090700 INS-WRITE-F3-13-2.                                               NC2164.2
   000904         090800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000905         090900*                                                                 NC2164.2
   000906         091000 INS-INIT-F3-14.                                                  NC2164.2
   000907         091100     MOVE "INS-TEST-F3-14" TO PAR-NAME.                           NC2164.2 179
   000908         091200     MOVE "VI-94 6.17.3"   TO ANSI-REFERENCE.                     NC2164.2 235
   000909         091300     MOVE "LIT BY BEFORE INIT" TO FEATURE.                        NC2164.2 175
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091400     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   000911         091500     MOVE                                                         NC2164.2
   000912         091600     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000913         091700-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000914         091800         TO WC-XN-83.                                             NC2164.2 69
   000915         091900     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   000916         092000     MOVE    1 TO REC-CT.                                         NC2164.2 226
   000917         092100 INS-TEST-F3-14-0.                                                NC2164.2
   000918         092200     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR CHARACTERS     NC2164.2 63 39
   000919         092300         AFTER L-XN-1-1 REPLACING ALL "A" BY "E" BEFORE INITIAL   NC2164.2 51
   000920         092400     HSPACE-XN-2.                                                 NC2164.2 57
   000921         092500     GO TO INS-TEST-F3-14-1.                                      NC2164.2 927
   000922         092600 INS-DELETE-F3-14.                                                NC2164.2
   000923         092700     PERFORM DE-LETE.                                             NC2164.2 331
   000924         092800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000925         092900     GO TO INS-INIT-F3-15.                                        NC2164.2 974
   000926         093000*                                                                 NC2164.2
   000927         093100 INS-TEST-F3-14-1.                                                NC2164.2
   000928         093200     IF      WRK-DU-999-1 EQUAL TO 6                              NC2164.2 39
   000929      1  093300     PERFORM PASS                                                 NC2164.2 329
   000930      1  093400             GO TO INS-WRITE-F3-14-1                              NC2164.2 940
   000931         093500     ELSE                                                         NC2164.2
   000932      1  093600             PERFORM FAIL                                         NC2164.2 330
   000933      1  093700             GO TO INS-FAIL-F3-14-1.                              NC2164.2 937
   000934         093800 INS-DELETE-F3-14-1.                                              NC2164.2
   000935         093900     PERFORM DE-LETE.                                             NC2164.2 331
   000936         094000     GO TO INS-WRITE-F3-14-1.                                     NC2164.2 940
   000937         094100 INS-FAIL-F3-14-1.                                                NC2164.2
   000938         094200     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   000939         094300     MOVE    6 TO CORRECT-N.                                      NC2164.2 205
   000940         094400 INS-WRITE-F3-14-1.                                               NC2164.2
   000941         094500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000942         094600*                                                                 NC2164.2
   000943         094700 INS-TEST-F3-14-2.                                                NC2164.2
   000944         094800     ADD     1 TO REC-CT.                                         NC2164.2 226
   000945         094900     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-4                     NC2164.2 63 81
   000946      1  095000             PERFORM PASS                                         NC2164.2 329
   000947      1  095100             GO TO INS-WRITE-F3-14-2                              NC2164.2 971
   000948         095200     ELSE                                                         NC2164.2
   000949      1  095300             PERFORM FAIL                                         NC2164.2 330
   000950      1  095400             GO TO INS-FAIL-F3-14-2.                              NC2164.2 954
   000951         095500 INS-DELETE-F3-14-2.                                              NC2164.2
   000952         095600     PERFORM DE-LETE.                                             NC2164.2 331
   000953         095700     GO TO INS-WRITE-F3-14-2.                                     NC2164.2 971
   000954         095800 INS-FAIL-F3-14-2.                                                NC2164.2
   000955         095900     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   000956         096000     MOVE    ANS-XN-83-4     TO WS-RIGHT-1-83                     NC2164.2 81 107
   000957         096100     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   000958         096200     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   000959         096300     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000960         096400     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   000961         096500     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   000962         096600     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000963         096700     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   000964         096800     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   000965         096900     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000966         097000     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097100     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   000968         097200     PERFORM PRINT-DETAIL                                         NC2164.2 333
   000969         097300     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   000970         097400     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   000971         097500 INS-WRITE-F3-14-2.                                               NC2164.2
   000972         097600     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000973         097700*                                                                 NC2164.2
   000974         097800 INS-INIT-F3-15.                                                  NC2164.2
   000975         097900     MOVE "INS-TEST-F3-15" TO PAR-NAME.                           NC2164.2 179
   000976         098000     MOVE "VI-94 6.17.3"   TO ANSI-REFERENCE.                     NC2164.2 235
   000977         098100     MOVE "REPL FIRST AFTER" TO FEATURE.                          NC2164.2 175
   000978         098200     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   000979         098300     MOVE                                                         NC2164.2
   000980         098400     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000981         098500-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000982         098600         TO WC-XN-83.                                             NC2164.2 69
   000983         098700     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   000984         098800     MOVE                                                         NC2164.2
   000985         098900     "AH YES OH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   000986         099000-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   000987         099100         TO ANS-XN-83-5.                                          NC2164.2 84
   000988         099200     MOVE    1 TO REC-CT.                                         NC2164.2 226
   000989         099300 INS-TEST-F3-15-0.                                                NC2164.2
   000990         099400     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR ALL "A" BEFORE NC2164.2 63 39
   000991         099500         L-XN-1-1 REPLACING FIRST  AH-XN-2 BY "OH" AFTER          NC2164.2 51 56
   000992         099600         INITIAL HSPACE-XN-2.                                     NC2164.2 57
   000993         099700     GO      TO INS-TEST-F3-15-1.                                 NC2164.2 999
   000994         099800 INS-DELETE-F3-15.                                                NC2164.2
   000995         099900     PERFORM DE-LETE.                                             NC2164.2 331
   000996         100000     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   000997         100100     GO TO INS-INIT-F3-16.                                        NC2164.2 1032
   000998         100200*                                                                 NC2164.2
   000999         100300 INS-TEST-F3-15-1.                                                NC2164.2
   001000         100400     IF      WRK-DU-999-1 EQUAL TO 7                              NC2164.2 39
   001001      1  100500             PERFORM PASS                                         NC2164.2 329
   001002      1  100600             GO TO INS-WRITE-F3-15-1                              NC2164.2 1012
   001003         100700     ELSE                                                         NC2164.2
   001004      1  100800             PERFORM FAIL                                         NC2164.2 330
   001005      1  100900             GO TO INS-FAIL-F3-15-1.                              NC2164.2 1009
   001006         101000 INS-DELETE-F3-15-1.                                              NC2164.2
   001007         101100     PERFORM DE-LETE.                                             NC2164.2 331
   001008         101200     GO TO INS-WRITE-F3-15-1.                                     NC2164.2 1012
   001009         101300 INS-FAIL-F3-15-1.                                                NC2164.2
   001010         101400     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   001011         101500     MOVE    7 TO CORRECT-N.                                      NC2164.2 205
   001012         101600 INS-WRITE-F3-15-1.                                               NC2164.2
   001013         101700     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001014         101800*                                                                 NC2164.2
   001015         101900 INS-TEST-F3-15-2.                                                NC2164.2
   001016         102000     ADD     1 TO REC-CT.                                         NC2164.2 226
   001017         102100     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-5                     NC2164.2 63 84
   001018      1  102200             PERFORM PASS                                         NC2164.2 329
   001019      1  102300             GO TO INS-WRITE-F3-15-2                              NC2164.2 1029
   001020         102400     ELSE                                                         NC2164.2
   001021      1  102500             PERFORM FAIL                                         NC2164.2 330
   001022      1  102600             GO TO INS-FAIL-F3-15-2.                              NC2164.2 1026
   001023         102700 INS-DELETE-F3-15-2.                                              NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102800     PERFORM DE-LETE.                                             NC2164.2 331
   001025         102900     GO TO INS-WRITE-F3-15-2.                                     NC2164.2 1029
   001026         103000 INS-FAIL-F3-15-2.                                                NC2164.2
   001027         103100     MOVE    WRK-XN-83-1 TO COMPUTED-A                            NC2164.2 63 190
   001028         103200     MOVE    ANS-XN-83-5 TO CORRECT-A.                            NC2164.2 84 204
   001029         103300 INS-WRITE-F3-15-2.                                               NC2164.2
   001030         103400     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001031         103500*                                                                 NC2164.2
   001032         103600 INS-INIT-F3-16.                                                  NC2164.2
   001033         103700     MOVE "INS-TEST-F3-16" TO PAR-NAME.                           NC2164.2 179
   001034         103800     MOVE "VI-94 6.17.3"   TO ANSI-REFERENCE.                     NC2164.2 235
   001035         103900     MOVE "FOR LEADING" TO FEATURE.                               NC2164.2 175
   001036         104000     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   001037         104100     MOVE                                                         NC2164.2
   001038         104200     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001039         104300-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001040         104400         TO WC-XN-83.                                             NC2164.2 69
   001041         104500     MOVE                                                         NC2164.2
   001042         104600     "AH YES OH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001043         104700-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001044         104800         TO ANS-XN-83-5.                                          NC2164.2 84
   001045         104900     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   001046         105000     MOVE    1 TO REC-CT.                                         NC2164.2 226
   001047         105100 INS-TEST-F3-16-0.                                                NC2164.2
   001048         105200     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR LEADING        NC2164.2 63 39
   001049         105300         AH-XN-2 REPLACING LEADING AH-XN-2 BY "OH".               NC2164.2 56 56
   001050         105400     GO      TO INS-TEST-F3-16-1.                                 NC2164.2 1056
   001051         105500 INS-DELETE-F3-16.                                                NC2164.2
   001052         105600     PERFORM DE-LETE.                                             NC2164.2 331
   001053         105700     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001054         105800     GO TO INS-INIT-F3-17.                                        NC2164.2 1103
   001055         105900*                                                                 NC2164.2
   001056         106000 INS-TEST-F3-16-1.                                                NC2164.2
   001057         106100     IF      WRK-DU-999-1 EQUAL TO 1                              NC2164.2 39
   001058      1  106200             PERFORM PASS                                         NC2164.2 329
   001059      1  106300             GO TO INS-WRITE-F3-16-1                              NC2164.2 1069
   001060         106400     ELSE                                                         NC2164.2
   001061      1  106500             PERFORM FAIL                                         NC2164.2 330
   001062      1  106600             GO TO INS-FAIL-F3-16-1.                              NC2164.2 1066
   001063         106700 INS-DELETE-F3-16-1.                                              NC2164.2
   001064         106800     PERFORM DE-LETE.                                             NC2164.2 331
   001065         106900     GO TO INS-WRITE-F3-16-1.                                     NC2164.2 1069
   001066         107000 INS-FAIL-F3-16-1.                                                NC2164.2
   001067         107100     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   001068         107200     MOVE    1 TO CORRECT-N.                                      NC2164.2 205
   001069         107300 INS-WRITE-F3-16-1.                                               NC2164.2
   001070         107400     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001071         107500*                                                                 NC2164.2
   001072         107600 INS-TEST-F3-16-2.                                                NC2164.2
   001073         107700     ADD     1 TO REC-CT.                                         NC2164.2 226
   001074         107800     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-1                     NC2164.2 63 72
   001075      1  107900             PERFORM PASS                                         NC2164.2 329
   001076      1  108000             GO TO INS-WRITE-F3-16-2                              NC2164.2 1100
   001077         108100     ELSE                                                         NC2164.2
   001078      1  108200             PERFORM FAIL                                         NC2164.2 330
   001079      1  108300             GO TO INS-FAIL-F3-16-2.                              NC2164.2 1083
   001080         108400 INS-DELETE-F3-16-2.                                              NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108500     PERFORM DE-LETE.                                             NC2164.2 331
   001082         108600     GO TO   INS-WRITE-F3-16-2.                                   NC2164.2 1100
   001083         108700 INS-FAIL-F3-16-2.                                                NC2164.2
   001084         108800     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   001085         108900     MOVE    ANS-XN-83-1     TO WS-RIGHT-1-83                     NC2164.2 72 107
   001086         109000     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   001087         109100     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   001088         109200     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001089         109300     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   001090         109400     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   001091         109500     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001092         109600     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   001093         109700     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   001094         109800     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001095         109900     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   001096         110000     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   001097         110100     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001098         110200     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   001099         110300     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   001100         110400 INS-WRITE-F3-16-2.                                               NC2164.2
   001101         110500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001102         110600*                                                                 NC2164.2
   001103         110700 INS-INIT-F3-17.                                                  NC2164.2
   001104         110800     MOVE "INS-TEST-F3-17" TO PAR-NAME.                           NC2164.2 179
   001105         110900     MOVE "VI-94 6.17.3"   TO ANSI-REFERENCE.                     NC2164.2 235
   001106         111000     MOVE "LIT BY AFTER INIT" TO FEATURE.                         NC2164.2 175
   001107         111100     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   001108         111200     MOVE                                                         NC2164.2
   001109         111300     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001110         111400-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001111         111500         TO WC-XN-83.                                             NC2164.2 69
   001112         111600     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   001113         111700     MOVE                                                         NC2164.2
   001114         111800     "AH YES OH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001115         111900-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001116         112000         TO ANS-XN-83-5.                                          NC2164.2 84
   001117         112100     MOVE    1 TO REC-CT.                                         NC2164.2 226
   001118         112200 INS-TEST-F3-17-0.                                                NC2164.2
   001119         112300     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR ALL "A"        NC2164.2 63 39
   001120         112400         REPLACING FIRST "AH" BY "OH" AFTER INITIAL "YES".        NC2164.2
   001121         112500     GO      TO INS-TEST-F3-17-1.                                 NC2164.2 1127
   001122         112600 INS-DELETE-F3-17.                                                NC2164.2
   001123         112700     PERFORM DE-LETE.                                             NC2164.2 331
   001124         112800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001125         112900     GO TO INS-INIT-F3-18.                                        NC2164.2 1174
   001126         113000*                                                                 NC2164.2
   001127         113100 INS-TEST-F3-17-1.                                                NC2164.2
   001128         113200     IF      WRK-DU-999-1 EQUAL TO 8                              NC2164.2 39
   001129      1  113300             PERFORM PASS                                         NC2164.2 329
   001130      1  113400             GO TO INS-WRITE-F3-17-1                              NC2164.2 1140
   001131         113500     ELSE                                                         NC2164.2
   001132      1  113600             PERFORM FAIL                                         NC2164.2 330
   001133      1  113700             GO TO INS-FAIL-F3-17-1.                              NC2164.2 1137
   001134         113800 INS-DELETE-F3-17-1.                                              NC2164.2
   001135         113900     PERFORM DE-LETE.                                             NC2164.2 331
   001136         114000     GO TO INS-WRITE-F3-17-1.                                     NC2164.2 1140
   001137         114100 INS-FAIL-F3-17-1.                                                NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114200     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   001139         114300     MOVE    8 TO CORRECT-N.                                      NC2164.2 205
   001140         114400 INS-WRITE-F3-17-1.                                               NC2164.2
   001141         114500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001142         114600*                                                                 NC2164.2
   001143         114700 INS-TEST-F3-17-2.                                                NC2164.2
   001144         114800     ADD     1 TO REC-CT.                                         NC2164.2 226
   001145         114900     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-5                     NC2164.2 63 84
   001146      1  115000             PERFORM PASS                                         NC2164.2 329
   001147      1  115100             GO TO INS-WRITE-F3-17-2                              NC2164.2 1171
   001148         115200     ELSE                                                         NC2164.2
   001149      1  115300             PERFORM FAIL                                         NC2164.2 330
   001150      1  115400             GO TO INS-FAIL-F3-17-2.                              NC2164.2 1154
   001151         115500 INS-DELETE-F3-17-2.                                              NC2164.2
   001152         115600     PERFORM DE-LETE.                                             NC2164.2 331
   001153         115700     GO TO INS-WRITE-F3-17-2.                                     NC2164.2 1171
   001154         115800 INS-FAIL-F3-17-2.                                                NC2164.2
   001155         115900     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   001156         116000     MOVE    ANS-XN-83-5     TO WS-RIGHT-1-83                     NC2164.2 84 107
   001157         116100     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   001158         116200     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   001159         116300     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001160         116400     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   001161         116500     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   001162         116600     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001163         116700     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   001164         116800     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   001165         116900     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001166         117000     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   001167         117100     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   001168         117200     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001169         117300     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   001170         117400     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   001171         117500 INS-WRITE-F3-17-2.                                               NC2164.2
   001172         117600     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001173         117700*                                                                 NC2164.2
   001174         117800 INS-INIT-F3-18.                                                  NC2164.2
   001175         117900     MOVE "INS-TEST-F3-18" TO PAR-NAME.                           NC2164.2 179
   001176         118000     MOVE "VI-94 6.17.3"   TO ANSI-REFERENCE.                     NC2164.2 235
   001177         118100     MOVE "CHAR AFTER ALL BEF" TO FEATURE.                        NC2164.2 175
   001178         118200     MOVE ZERO TO WRK-DU-999-1.                                   NC2164.2 IMP 39
   001179         118300     MOVE                                                         NC2164.2
   001180         118400     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001181         118500-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001182         118600         TO WC-XN-83.                                             NC2164.2 69
   001183         118700     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   001184         118800     MOVE 1 TO REC-CT.                                            NC2164.2 226
   001185         118900 INS-TEST-F3-18-0.                                                NC2164.2
   001186         119000     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR CHARACTERS     NC2164.2 63 39
   001187         119100         AFTER AH-XN-2 REPLACING ALL "AH" BY "OH" BEFORE YES-XN-3.NC2164.2 56 60
   001188         119200     GO      TO INS-TEST-F3-18-1.                                 NC2164.2 1194
   001189         119300 INS-DELETE-F3-18.                                                NC2164.2
   001190         119400     PERFORM DE-LETE.                                             NC2164.2 331
   001191         119500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001192         119600     GO      TO INS-INIT-F3-19.                                   NC2164.2 1241
   001193         119700*                                                                 NC2164.2
   001194         119800 INS-TEST-F3-18-1.                                                NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119900     IF      WRK-DU-999-1 EQUAL TO 81                             NC2164.2 39
   001196      1  120000             PERFORM PASS                                         NC2164.2 329
   001197      1  120100             GO TO INS-WRITE-F3-18-1                              NC2164.2 1207
   001198         120200     ELSE                                                         NC2164.2
   001199      1  120300             PERFORM FAIL                                         NC2164.2 330
   001200      1  120400             GO TO INS-FAIL-F3-18-1.                              NC2164.2 1204
   001201         120500 INS-DELETE-F3-18-1.                                              NC2164.2
   001202         120600     PERFORM DE-LETE.                                             NC2164.2 331
   001203         120700     GO TO INS-WRITE-F3-18-1.                                     NC2164.2 1207
   001204         120800 INS-FAIL-F3-18-1.                                                NC2164.2
   001205         120900     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   001206         121000     MOVE    81 TO CORRECT-N.                                     NC2164.2 205
   001207         121100 INS-WRITE-F3-18-1.                                               NC2164.2
   001208         121200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001209         121300*                                                                 NC2164.2
   001210         121400 INS-TEST-F3-18-2.                                                NC2164.2
   001211         121500     ADD     1 TO REC-CT.                                         NC2164.2 226
   001212         121600     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-1                     NC2164.2 63 72
   001213      1  121700             PERFORM PASS                                         NC2164.2 329
   001214      1  121800             GO TO INS-WRITE-F3-18-2                              NC2164.2 1238
   001215         121900     ELSE                                                         NC2164.2
   001216      1  122000             PERFORM FAIL                                         NC2164.2 330
   001217      1  122100             GO TO INS-FAIL-F3-18-2.                              NC2164.2 1221
   001218         122200 INS-DELETE-F3-18-2.                                              NC2164.2
   001219         122300     PERFORM DE-LETE.                                             NC2164.2 331
   001220         122400     GO TO INS-WRITE-F3-18-2.                                     NC2164.2 1238
   001221         122500 INS-FAIL-F3-18-2.                                                NC2164.2
   001222         122600     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   001223         122700     MOVE    ANS-XN-83-1     TO WS-RIGHT-1-83                     NC2164.2 72 107
   001224         122800     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   001225         122900     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   001226         123000     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001227         123100     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   001228         123200     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   001229         123300     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001230         123400     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   001231         123500     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   001232         123600     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001233         123700     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   001234         123800     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   001235         123900     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001236         124000     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   001237         124100     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   001238         124200 INS-WRITE-F3-18-2.                                               NC2164.2
   001239         124300     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001240         124400*                                                                 NC2164.2
   001241         124500 INS-INIT-F3-19.                                                  NC2164.2
   001242         124600     MOVE "INS-TEST-F3-19" TO PAR-NAME.                           NC2164.2 179
   001243         124700     MOVE "VI-94 6.17.3"   TO ANSI-REFERENCE.                     NC2164.2 235
   001244         124800     MOVE "TALLY SERIES" TO FEATURE.                              NC2164.2 175
   001245         124900     MOVE ZERO TO WRK-DU-999-1 WRK-DU-999-2 WRK-DU-999-3          NC2164.2 IMP 39 40 41
   001246         125000         WRK-DU-999-4.                                            NC2164.2 42
   001247         125100     MOVE                                                         NC2164.2
   001248         125200     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001249         125300-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001250         125400         TO WC-XN-83.                                             NC2164.2 69
   001251         125500     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125600     MOVE 1 TO REC-CT.                                            NC2164.2 226
   001253         125700     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR ALL "A"        NC2164.2 63 39
   001254         125800             WRK-DU-999-2 FOR LEADING "AH"                        NC2164.2 40
   001255         125900             WRK-DU-999-3 FOR CHARACTERS BEFORE "."               NC2164.2 41
   001256         126000             WRK-DU-999-4 FOR CHARACTERS AFTER "AL"               NC2164.2 42
   001257         126100             REPLACING                                            NC2164.2
   001258         126200                 FIRST "L " BY "ZZ" AFTER INITIAL "AL"            NC2164.2
   001259         126300                 FIRST "BAD" BY "ZZZ" AFTER "L "                  NC2164.2
   001260         126400                 LEADING "BAD" BY "ZZZ" BEFORE INITIAL "Q"        NC2164.2
   001261         126500                 FIRST "BAD" BY "ZZZ" BEFORE INITIAL "Z"          NC2164.2
   001262         126600                 FIRST "BAD" BY "ZZZ" AFTER "ALL "                NC2164.2
   001263         126700                 ALL "." BY "Z" AFTER "AL".                       NC2164.2
   001264         126800     GO TO INS-TEST-F3-19-1.                                      NC2164.2 1270
   001265         126900 INS-DELETE-F3-19.                                                NC2164.2
   001266         127000     PERFORM DE-LETE.                                             NC2164.2 331
   001267         127100     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001268         127200     GO TO INS-INIT-F3-20.                                        NC2164.2 1368
   001269         127300*                                                                 NC2164.2
   001270         127400 INS-TEST-F3-19-1.                                                NC2164.2
   001271         127500     IF WRK-DU-999-1 = 8                                          NC2164.2 39
   001272      1  127600             PERFORM PASS                                         NC2164.2 329
   001273      1  127700             GO TO INS-WRITE-F3-19-1                              NC2164.2 1283
   001274         127800     ELSE                                                         NC2164.2
   001275      1  127900             GO TO INS-FAIL-F3-19-1.                              NC2164.2 1279
   001276         128000 INS-DELETE-F3-19-1.                                              NC2164.2
   001277         128100     PERFORM DE-LETE.                                             NC2164.2 331
   001278         128200     GO TO INS-WRITE-F3-19-1.                                     NC2164.2 1283
   001279         128300 INS-FAIL-F3-19-1.                                                NC2164.2
   001280         128400     PERFORM FAIL                                                 NC2164.2 330
   001281         128500     MOVE WRK-DU-999-1 TO COMPUTED-N                              NC2164.2 39 191
   001282         128600     MOVE 8 TO CORRECT-N.                                         NC2164.2 205
   001283         128700 INS-WRITE-F3-19-1.                                               NC2164.2
   001284         128800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001285         128900*                                                                 NC2164.2
   001286         129000 INS-TEST-F3-19-2.                                                NC2164.2
   001287         129100     ADD 1 TO REC-CT.                                             NC2164.2 226
   001288         129200     IF WRK-DU-999-2 = 0                                          NC2164.2 40
   001289      1  129300             PERFORM PASS                                         NC2164.2 329
   001290      1  129400             GO TO INS-WRITE-F3-19-2                              NC2164.2 1300
   001291         129500     ELSE                                                         NC2164.2
   001292      1  129600             GO TO INS-FAIL-F3-19-2.                              NC2164.2 1296
   001293         129700 INS-DELETE-F3-19-2.                                              NC2164.2
   001294         129800     PERFORM DE-LETE.                                             NC2164.2 331
   001295         129900     GO TO INS-WRITE-F3-19-2.                                     NC2164.2 1300
   001296         130000 INS-FAIL-F3-19-2.                                                NC2164.2
   001297         130100     PERFORM FAIL                                                 NC2164.2 330
   001298         130200     MOVE WRK-DU-999-2 TO COMPUTED-N                              NC2164.2 40 191
   001299         130300     MOVE 0 TO CORRECT-N.                                         NC2164.2 205
   001300         130400 INS-WRITE-F3-19-2.                                               NC2164.2
   001301         130500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001302         130600*                                                                 NC2164.2
   001303         130700 INS-TEST-F3-19-3.                                                NC2164.2
   001304         130800     ADD 1 TO REC-CT.                                             NC2164.2 226
   001305         130900     IF WRK-DU-999-3 = 13                                         NC2164.2 41
   001306      1  131000             PERFORM PASS                                         NC2164.2 329
   001307      1  131100             GO TO INS-WRITE-F3-19-3                              NC2164.2 1317
   001308         131200     ELSE                                                         NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309      1  131300             PERFORM FAIL                                         NC2164.2 330
   001310      1  131400             GO TO INS-FAIL-F3-19-3.                              NC2164.2 1314
   001311         131500 INS-DELETE-F3-19-3.                                              NC2164.2
   001312         131600     PERFORM DE-LETE.                                             NC2164.2 331
   001313         131700     GO TO INS-WRITE-F3-19-3.                                     NC2164.2 1317
   001314         131800 INS-FAIL-F3-19-3.                                                NC2164.2
   001315         131900     MOVE WRK-DU-999-3 TO COMPUTED-N                              NC2164.2 41 191
   001316         132000     MOVE 13 TO CORRECT-N.                                        NC2164.2 205
   001317         132100 INS-WRITE-F3-19-3.                                               NC2164.2
   001318         132200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001319         132300*                                                                 NC2164.2
   001320         132400 INS-TEST-F3-19-4.                                                NC2164.2
   001321         132500     ADD 1 TO REC-CT.                                             NC2164.2 226
   001322         132600     IF WRK-DU-999-4 = 5                                          NC2164.2 42
   001323      1  132700             PERFORM PASS                                         NC2164.2 329
   001324      1  132800             GO TO INS-WRITE-F3-19-4                              NC2164.2 1334
   001325         132900     ELSE                                                         NC2164.2
   001326      1  133000             GO TO INS-FAIL-F3-19-4.                              NC2164.2 1330
   001327         133100 INS-DELETE-F3-19-4.                                              NC2164.2
   001328         133200     PERFORM DE-LETE.                                             NC2164.2 331
   001329         133300     GO TO INS-WRITE-F3-19-4.                                     NC2164.2 1334
   001330         133400 INS-FAIL-F3-19-4.                                                NC2164.2
   001331         133500     PERFORM FAIL                                                 NC2164.2 330
   001332         133600     MOVE WRK-DU-999-4 TO COMPUTED-N                              NC2164.2 42 191
   001333         133700     MOVE 5 TO CORRECT-N.                                         NC2164.2 205
   001334         133800 INS-WRITE-F3-19-4.                                               NC2164.2
   001335         133900     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001336         134000*                                                                 NC2164.2
   001337         134100 INS-TEST-F3-19-5.                                                NC2164.2
   001338         134200     ADD 1 TO REC-CT.                                             NC2164.2 226
   001339         134300     IF WRK-XN-83-1 = ANS-XN-83-6                                 NC2164.2 63 87
   001340      1  134400             PERFORM PASS                                         NC2164.2 329
   001341      1  134500             GO TO INS-WRITE-F3-19-5                              NC2164.2 1365
   001342         134600     ELSE                                                         NC2164.2
   001343      1  134700             GO TO INS-FAIL-F3-19-5.                              NC2164.2 1347
   001344         134800 INS-DELETE-F3-19-5.                                              NC2164.2
   001345         134900     PERFORM DE-LETE.                                             NC2164.2 331
   001346         135000     GO TO INS-WRITE-F3-19-5.                                     NC2164.2 1365
   001347         135100 INS-FAIL-F3-19-5.                                                NC2164.2
   001348         135200     PERFORM FAIL                                                 NC2164.2 330
   001349         135300     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   001350         135400     MOVE    ANS-XN-83-6     TO WS-RIGHT-1-83                     NC2164.2 87 107
   001351         135500     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   001352         135600     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   001353         135700     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001354         135800     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   001355         135900     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   001356         136000     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001357         136100     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   001358         136200     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   001359         136300     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001360         136400     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   001361         136500     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   001362         136600     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001363         136700     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   001364         136800     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   001365         136900 INS-WRITE-F3-19-5.                                               NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         137000     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001367         137100*                                                                 NC2164.2
   001368         137200 INS-INIT-F3-20.                                                  NC2164.2
   001369         137300     MOVE "INS-TEST-F3-20" TO PAR-NAME.                           NC2164.2 179
   001370         137400     MOVE "VI-94 6.17.3"   TO ANSI-REFERENCE.                     NC2164.2 235
   001371         137500     MOVE "REPLACE SERIES" TO FEATURE.                            NC2164.2 175
   001372         137600     MOVE ZERO TO REC-CT WRK-DU-999-1.                            NC2164.2 IMP 226 39
   001373         137700     MOVE                                                         NC2164.2
   001374         137800     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001375         137900-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001376         138000         TO WC-XN-83.                                             NC2164.2 69
   001377         138100     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC2164.2 69 63
   001378         138200     MOVE    1 TO REC-CT.                                         NC2164.2 226
   001379         138300 INS-TEST-F3-20-0.                                                NC2164.2
   001380         138400     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1  FOR CHARACTERS    NC2164.2 63 39
   001381         138500             BEFORE "."                                           NC2164.2
   001382         138600             REPLACING                                            NC2164.2
   001383         138700             ALL "L BAD." BY "ZZZZZZ" AFTER L-XN-1-1              NC2164.2 51
   001384         138800             ALL " " BY HYPEN-XN-1-1                              NC2164.2 46
   001385         138900             FIRST "C" BY P-XN-1-1                                NC2164.2 53
   001386         139000             LEADING AH-XN-2 BY OH-XN-2                           NC2164.2 56 58
   001387         139100             ALL "F" BY "Z" BEFORE G-XN-1-1.                      NC2164.2 49
   001388         139200     GO      TO INS-TEST-F3-20-1.                                 NC2164.2 1394
   001389         139300 INS-DELETE-F3-20.                                                NC2164.2
   001390         139400     PERFORM DE-LETE.                                             NC2164.2 331
   001391         139500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001392         139600     GO      TO CCVS-999999.                                      NC2164.2 2222
   001393         139700*                                                                 NC2164.2
   001394         139800 INS-TEST-F3-20-1.                                                NC2164.2
   001395         139900     IF      WRK-DU-999-1 EQUAL TO 15                             NC2164.2 39
   001396      1  140000             PERFORM PASS                                         NC2164.2 329
   001397      1  140100             GO TO INS-WRITE-F3-20-1                              NC2164.2 1407
   001398         140200     ELSE                                                         NC2164.2
   001399      1  140300             GO TO INS-FAIL-F3-20-1.                              NC2164.2 1403
   001400         140400 INS-DELETE-F3-20-1.                                              NC2164.2
   001401         140500     PERFORM DE-LETE.                                             NC2164.2 331
   001402         140600     GO TO INS-WRITE-F3-20-1.                                     NC2164.2 1407
   001403         140700 INS-FAIL-F3-20-1.                                                NC2164.2
   001404         140800     PERFORM FAIL                                                 NC2164.2 330
   001405         140900     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   001406         141000     MOVE    15 TO CORRECT-N.                                     NC2164.2 205
   001407         141100 INS-WRITE-F3-20-1.                                               NC2164.2
   001408         141200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001409         141300*                                                                 NC2164.2
   001410         141400 INS-TEST-F3-20-2.                                                NC2164.2
   001411         141500     ADD     1 TO REC-CT.                                         NC2164.2 226
   001412         141600     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-7                     NC2164.2 63 90
   001413      1  141700             PERFORM PASS                                         NC2164.2 329
   001414      1  141800             GO TO INS-WRITE-F3-20-2                              NC2164.2 1438
   001415         141900     ELSE                                                         NC2164.2
   001416      1  142000             GO TO INS-FAIL-F3-20-2.                              NC2164.2 1420
   001417         142100 INS-DELETE-F3-20-2.                                              NC2164.2
   001418         142200     PERFORM DE-LETE.                                             NC2164.2 331
   001419         142300     GO TO INS-WRITE-F3-20-2.                                     NC2164.2 1438
   001420         142400 INS-FAIL-F3-20-2.                                                NC2164.2
   001421         142500     PERFORM FAIL                                                 NC2164.2 330
   001422         142600     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142700     MOVE    ANS-XN-83-7     TO WS-RIGHT-1-83                     NC2164.2 90 107
   001424         142800     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   001425         142900     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   001426         143000     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001427         143100     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   001428         143200     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   001429         143300     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001430         143400     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   001431         143500     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   001432         143600     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001433         143700     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   001434         143800     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   001435         143900     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001436         144000     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   001437         144100     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   001438         144200 INS-WRITE-F3-20-2.                                               NC2164.2
   001439         144300     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001440         144400*                                                                 NC2164.2
   001441         144500 INS-INIT-F2-21.                                                  NC2164.2
   001442         144600     MOVE    ZERO TO REC-CT.                                      NC2164.2 IMP 226
   001443         144700     MOVE    SPACES TO PAR-NAME.                                  NC2164.2 IMP 179
   001444         144800     MOVE "INS-TEST-F2-21" TO PAR-NAME.                           NC2164.2 179
   001445         144900     MOVE "VI-94 6.17.3"   TO ANSI-REFERENCE.                     NC2164.2 235
   001446         145000     MOVE "REPLACE BEFORE" TO FEATURE.                            NC2164.2 175
   001447         145100     MOVE                                                         NC2164.2
   001448         145200     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001449         145300-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001450         145400         TO WC-XN-83.                                             NC2164.2 69
   001451         145500     MOVE    WC-XN-83 TO WRK-XN-83-1.                             NC2164.2 69 63
   001452         145600 INS-TEST-F2-21.                                                  NC2164.2
   001453         145700     INSPECT WRK-XN-83-1                                          NC2164.2 63
   001454         145800         REPLACING ALL SPACE-XN-1-1 BY "-" BEFORE INITIAL "Z".    NC2164.2 44
   001455         145900     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-8                     NC2164.2 63 93
   001456      1  146000             PERFORM PASS                                         NC2164.2 329
   001457      1  146100             GO TO INS-WRITE-F2-21-1                              NC2164.2 1481
   001458         146200     ELSE                                                         NC2164.2
   001459      1  146300             GO TO INS-FAIL-F2-21-1.                              NC2164.2 1463
   001460         146400 INS-DELETE-F2-21-1.                                              NC2164.2
   001461         146500     PERFORM DE-LETE.                                             NC2164.2 331
   001462         146600     GO TO INS-WRITE-F2-21-1.                                     NC2164.2 1481
   001463         146700 INS-FAIL-F2-21-1.                                                NC2164.2
   001464         146800     PERFORM FAIL                                                 NC2164.2 330
   001465         146900     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   001466         147000     MOVE    ANS-XN-83-8     TO WS-RIGHT-1-83                     NC2164.2 93 107
   001467         147100     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   001468         147200     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   001469         147300     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001470         147400     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   001471         147500     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   001472         147600     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001473         147700     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   001474         147800     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   001475         147900     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001476         148000     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   001477         148100     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   001478         148200     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001479         148300     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148400     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   001481         148500 INS-WRITE-F2-21-1.                                               NC2164.2
   001482         148600     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001483         148700*                                                                 NC2164.2
   001484         148800 INS-INIT-F2-22.                                                  NC2164.2
   001485         148900     MOVE "INS-TEST-F2-22" TO PAR-NAME.                           NC2164.2 179
   001486         149000     MOVE "VI-94 6.17.3"   TO ANSI-REFERENCE.                     NC2164.2 235
   001487         149100     MOVE  "REPLACE AFTER" TO FEATURE.                            NC2164.2 175
   001488         149200     MOVE                                                         NC2164.2
   001489         149300     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001490         149400-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001491         149500         TO WC-XN-83.                                             NC2164.2 69
   001492         149600     MOVE    WC-XN-83 TO WRK-XN-83-1.                             NC2164.2 69 63
   001493         149700 INS-TEST-F2-22.                                                  NC2164.2
   001494         149800     INSPECT WRK-XN-83-1                                          NC2164.2 63
   001495         149900         REPLACING ALL SPACE-XN-1-1 BY "-" AFTER INITIAL "Z".     NC2164.2 44
   001496         150000     IF      WRK-XN-83-1 EQUAL TO WC-XN-83                        NC2164.2 63 69
   001497      1  150100             PERFORM PASS                                         NC2164.2 329
   001498      1  150200             GO TO INS-WRITE-F2-22                                NC2164.2 1522
   001499         150300     ELSE                                                         NC2164.2
   001500      1  150400             GO TO INS-FAIL-F2-22.                                NC2164.2 1504
   001501         150500 INS-DELETE-F2-22.                                                NC2164.2
   001502         150600     PERFORM DE-LETE.                                             NC2164.2 331
   001503         150700     GO TO INS-WRITE-F2-22.                                       NC2164.2 1522
   001504         150800 INS-FAIL-F2-22.                                                  NC2164.2
   001505         150900     PERFORM FAIL                                                 NC2164.2 330
   001506         151000     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   001507         151100     MOVE    WC-XN-83        TO WS-RIGHT-1-83                     NC2164.2 69 107
   001508         151200     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   001509         151300     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   001510         151400     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001511         151500     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   001512         151600     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   001513         151700     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001514         151800     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   001515         151900     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   001516         152000     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001517         152100     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   001518         152200     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   001519         152300     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001520         152400     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   001521         152500     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   001522         152600 INS-WRITE-F2-22.                                                 NC2164.2
   001523         152700     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001524         152800*                                                                 NC2164.2
   001525         152900 INS-INIT-F1-23.                                                  NC2164.2
   001526         153000     MOVE "INS-TEST-F1-23" TO PAR-NAME.                           NC2164.2 179
   001527         153100     MOVE   "VI-94" TO ANSI-REFERENCE.                            NC2164.2 235
   001528         153200     MOVE    "TALLY SIGNED NUM." TO FEATURE.                      NC2164.2 175
   001529         153300     MOVE    -12345 TO WRK-DS-5V0-1.                              NC2164.2 65
   001530         153400     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001531         153500     MOVE    ZERO TO WRK-DU-999-2.                                NC2164.2 IMP 40
   001532         153600     MOVE    1 TO REC-CT.                                         NC2164.2 226
   001533         153700 INS-TEST-F1-23-0.                                                NC2164.2
   001534         153800     INSPECT WRK-DS-5V0-1                                         NC2164.2 65
   001535         153900         TALLYING WRK-DU-999-1 FOR ALL "-"                        NC2164.2 39
   001536         154000                  WRK-DU-999-2 FOR ALL "5".                       NC2164.2 40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154100     GO      TO INS-TEST-F1-23-1.                                 NC2164.2 1543
   001538         154200 INS-DELETE-F1-23.                                                NC2164.2
   001539         154300     PERFORM DE-LETE.                                             NC2164.2 331
   001540         154400     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001541         154500     GO TO INS-INIT-F1-24.                                        NC2164.2 1576
   001542         154600*                                                                 NC2164.2
   001543         154700 INS-TEST-F1-23-1.                                                NC2164.2
   001544         154800     IF      WRK-DU-999-1 EQUAL 0                                 NC2164.2 39
   001545      1  154900             PERFORM PASS                                         NC2164.2 329
   001546      1  155000             GO TO INS-WRITE-F1-23-1                              NC2164.2 1556
   001547         155100     ELSE                                                         NC2164.2
   001548      1  155200             PERFORM FAIL                                         NC2164.2 330
   001549      1  155300             GO TO INS-FAIL-F1-23-1.                              NC2164.2 1553
   001550         155400 INS-DELETE-F1-23-1.                                              NC2164.2
   001551         155500     PERFORM DE-LETE.                                             NC2164.2 331
   001552         155600     GO TO INS-WRITE-F1-23-1.                                     NC2164.2 1556
   001553         155700 INS-FAIL-F1-23-1.                                                NC2164.2
   001554         155800     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   001555         155900     MOVE    ZERO TO CORRECT-N.                                   NC2164.2 IMP 205
   001556         156000 INS-WRITE-F1-23-1.                                               NC2164.2
   001557         156100     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001558         156200*                                                                 NC2164.2
   001559         156300 INS-TEST-F1-23-2.                                                NC2164.2
   001560         156400     ADD     1 TO REC-CT.                                         NC2164.2 226
   001561         156500     IF      WRK-DU-999-2 EQUAL TO 1                              NC2164.2 40
   001562      1  156600     PERFORM PASS                                                 NC2164.2 329
   001563      1  156700             GO TO INS-WRITE-F1-23-2                              NC2164.2 1573
   001564         156800     ELSE                                                         NC2164.2
   001565      1  156900             PERFORM FAIL                                         NC2164.2 330
   001566      1  157000             GO TO INS-FAIL-F1-23-2.                              NC2164.2 1570
   001567         157100 INS-DELETE-F1-23-2.                                              NC2164.2
   001568         157200     PERFORM DE-LETE.                                             NC2164.2 331
   001569         157300     GO TO INS-WRITE-F1-23-2.                                     NC2164.2 1573
   001570         157400 INS-FAIL-F1-23-2.                                                NC2164.2
   001571         157500     MOVE    WRK-DU-999-2 TO COMPUTED-N                           NC2164.2 40 191
   001572         157600     MOVE    1 TO CORRECT-N.                                      NC2164.2 205
   001573         157700 INS-WRITE-F1-23-2.                                               NC2164.2
   001574         157800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001575         157900*                                                                 NC2164.2
   001576         158000 INS-INIT-F1-24.                                                  NC2164.2
   001577         158100     MOVE "INS-TEST-F1-24" TO PAR-NAME.                           NC2164.2 179
   001578         158200     MOVE "NUMERIC EDITED FIELD" TO FEATURE.                      NC2164.2 175
   001579         158300     MOVE "VI-94" TO ANSI-REFERENCE.                              NC2164.2 235
   001580         158400     MOVE  123456.789  TO WRK-NE-1.                               NC2164.2 66
   001581         158500     MOVE    ZERO TO REC-CT.                                      NC2164.2 IMP 226
   001582         158600     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001583         158700 INS-TEST-F1-24.                                                  NC2164.2
   001584         158800     INSPECT WRK-NE-1  TALLYING WRK-DU-999-1  FOR ALL ",".        NC2164.2 66 39
   001585         158900     IF WRK-DU-999-1 EQUAL TO 1                                   NC2164.2 39
   001586      1  159000             PERFORM PASS                                         NC2164.2 329
   001587      1  159100             GO TO INS-WRITE-F1-24                                NC2164.2 1597
   001588         159200     ELSE                                                         NC2164.2
   001589      1  159300             GO TO INS-FAIL-F1-24.                                NC2164.2 1593
   001590         159400 INS-DELETE-F1-24.                                                NC2164.2
   001591         159500     PERFORM DE-LETE.                                             NC2164.2 331
   001592         159600     GO TO INS-WRITE-F1-24.                                       NC2164.2 1597
   001593         159700 INS-FAIL-F1-24.                                                  NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159800     PERFORM FAIL                                                 NC2164.2 330
   001595         159900     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   001596         160000     MOVE    1 TO CORRECT-N.                                      NC2164.2 205
   001597         160100 INS-WRITE-F1-24.                                                 NC2164.2
   001598         160200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001599         160300*                                                                 NC2164.2
   001600         160400 INS-INIT-F1-25.                                                  NC2164.2
   001601         160500     MOVE "INS-TEST-F1-25" TO PAR-NAME.                           NC2164.2 179
   001602         160600     MOVE   "VI-94" TO ANSI-REFERENCE.                            NC2164.2 235
   001603         160700     MOVE    "NUMERIC EDITED FIELD" TO FEATURE.                   NC2164.2 175
   001604         160800     MOVE    123456.789 TO WRK-NE-1.                              NC2164.2 66
   001605         160900     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001606         161000 INS-TEST-F1-25.                                                  NC2164.2
   001607         161100     INSPECT WRK-NE-1  TALLYING WRK-DU-999-1  FOR ALL "-".        NC2164.2 66 39
   001608         161200     IF      WRK-DU-999-1 EQUAL TO ZERO                           NC2164.2 39 IMP
   001609      1  161300             PERFORM PASS                                         NC2164.2 329
   001610      1  161400             GO TO INS-WRITE-F1-25                                NC2164.2 1620
   001611         161500     ELSE                                                         NC2164.2
   001612      1  161600             GO TO INS-FAIL-F1-25.                                NC2164.2 1616
   001613         161700 INS-DELETE-F1-25.                                                NC2164.2
   001614         161800     PERFORM DE-LETE.                                             NC2164.2 331
   001615         161900     GO TO INS-WRITE-F1-25.                                       NC2164.2 1620
   001616         162000 INS-FAIL-F1-25.                                                  NC2164.2
   001617         162100     PERFORM FAIL                                                 NC2164.2 330
   001618         162200     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   001619         162300     MOVE    ZERO TO CORRECT-N.                                   NC2164.2 IMP 205
   001620         162400 INS-WRITE-F1-25.                                                 NC2164.2
   001621         162500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001622         162600*                                                                 NC2164.2
   001623         162700 INS-INIT-F1-26.                                                  NC2164.2
   001624         162800     MOVE    "INS-TEST-F1-26" TO PAR-NAME.                        NC2164.2 179
   001625         162900     MOVE    "VI-94" TO ANSI-REFERENCE.                           NC2164.2 235
   001626         163000     MOVE    "2 CHARACTER MASK" TO FEATURE.                       NC2164.2 175
   001627         163100     MOVE    "X X" TO X-SPACE-X-XN-3.                             NC2164.2 61
   001628         163200     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001629         163300 INS-TEST-F1-26.                                                  NC2164.2
   001630         163400     INSPECT X-SPACE-X-XN-3 TALLYING WRK-DU-999-1 FOR ALL "X ".   NC2164.2 61 39
   001631         163500     IF      WRK-DU-999-1 EQUAL TO 1                              NC2164.2 39
   001632      1  163600             PERFORM PASS                                         NC2164.2 329
   001633      1  163700             GO TO INS-WRITE-F1-26                                NC2164.2 1643
   001634         163800     ELSE                                                         NC2164.2
   001635      1  163900             GO TO INS-FAIL-F1-26.                                NC2164.2 1639
   001636         164000 INS-DELETE-F1-26.                                                NC2164.2
   001637         164100     PERFORM DE-LETE.                                             NC2164.2 331
   001638         164200     GO TO INS-WRITE-F1-26.                                       NC2164.2 1643
   001639         164300 INS-FAIL-F1-26.                                                  NC2164.2
   001640         164400     PERFORM FAIL                                                 NC2164.2 330
   001641         164500     MOVE WRK-DU-999-1 TO COMPUTED-N                              NC2164.2 39 191
   001642         164600     MOVE 1 TO CORRECT-N.                                         NC2164.2 205
   001643         164700 INS-WRITE-F1-26.                                                 NC2164.2
   001644         164800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001645         164900*                                                                 NC2164.2
   001646         165000 INS-INIT-F1-27.                                                  NC2164.2
   001647         165100     MOVE   "INS-TEST-F1-27" TO PAR-NAME.                         NC2164.2 179
   001648         165200     MOVE   "VI-94" TO ANSI-REFERENCE.                            NC2164.2 235
   001649         165300     MOVE   "ORDER OF COMPARE" TO FEATURE.                        NC2164.2 175
   001650         165400     MOVE   "AABA" TO AABA-XN-4.                                  NC2164.2 62
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165500     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001652         165600     MOVE    ZERO TO WRK-DU-999-2.                                NC2164.2 IMP 40
   001653         165700 INS-TEST-F1-27.                                                  NC2164.2
   001654         165800     INSPECT AABA-XN-4 TALLYING WRK-DU-999-1 FOR ALL "AA"         NC2164.2 62 39
   001655         165900                                WRK-DU-999-2 FOR ALL "A".         NC2164.2 40
   001656         166000     IF      WRK-DU-999-1 EQUAL TO 1                              NC2164.2 39
   001657         166100         AND                                                      NC2164.2
   001658         166200             WRK-DU-999-2 EQUAL TO 1                              NC2164.2 40
   001659      1  166300             PERFORM PASS                                         NC2164.2 329
   001660      1  166400             GO TO INS-WRITE-F1-27                                NC2164.2 1671
   001661         166500     ELSE                                                         NC2164.2
   001662      1  166600             GO TO INS-FAIL-F1-27.                                NC2164.2 1666
   001663         166700 INS-DELETE-F1-27.                                                NC2164.2
   001664         166800     PERFORM DE-LETE.                                             NC2164.2 331
   001665         166900     GO TO INS-WRITE-F1-27.                                       NC2164.2 1671
   001666         167000 INS-FAIL-F1-27.                                                  NC2164.2
   001667         167100     PERFORM FAIL                                                 NC2164.2 330
   001668         167200     MOVE WRK-DU-999-1 TO COMPUTED-N                              NC2164.2 39 191
   001669         167300     MOVE WRK-DU-999-2 TO CORRECT-N                               NC2164.2 40 205
   001670         167400     MOVE "BOTH SHOULD BE 1" TO RE-MARK.                          NC2164.2 184
   001671         167500 INS-WRITE-F1-27.                                                 NC2164.2
   001672         167600     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001673         167700*                                                                 NC2164.2
   001674         167800 INS-INIT-F1-28.                                                  NC2164.2
   001675         167900*    ===-->  BEFORE AND AFTER PHRASES  <--===                     NC2164.2
   001676         168000     MOVE   "INS-TEST-F1-28" TO PAR-NAME.                         NC2164.2 179
   001677         168100     MOVE   "VI-94 6.17.3 SR4" TO ANSI-REFERENCE.                 NC2164.2 235
   001678         168200     MOVE   "TALLY FOR ALL SPACES" TO FEATURE.                    NC2164.2 175
   001679         168300     MOVE                                                         NC2164.2
   001680         168400     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001681         168500-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001682         168600         TO WC-XN-83.                                             NC2164.2 69
   001683         168700     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001684         168800 INS-TEST-F1-28.                                                  NC2164.2
   001685         168900     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR ALL SPACES        NC2164.2 69 39 IMP
   001686         169000             AFTER  "C."                                          NC2164.2
   001687         169100             BEFORE "DO".                                         NC2164.2
   001688         169200     IF      WRK-DU-999-1 EQUAL TO 6                              NC2164.2 39
   001689      1  169300             PERFORM PASS                                         NC2164.2 329
   001690      1  169400             GO TO   INS-WRITE-F1-28.                             NC2164.2 1699
   001691         169500     GO TO   INS-FAIL-F1-28.                                      NC2164.2 1695
   001692         169600 INS-DELETE-F1-28.                                                NC2164.2
   001693         169700     PERFORM DE-LETE.                                             NC2164.2 331
   001694         169800     GO TO   INS-WRITE-F1-28.                                     NC2164.2 1699
   001695         169900 INS-FAIL-F1-28.                                                  NC2164.2
   001696         170000     PERFORM FAIL.                                                NC2164.2 330
   001697         170100     MOVE    WRK-DU-999-1 TO COMPUTED-N.                          NC2164.2 39 191
   001698         170200     MOVE    6 TO CORRECT-N.                                      NC2164.2 205
   001699         170300 INS-WRITE-F1-28.                                                 NC2164.2
   001700         170400     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001701         170500*                                                                 NC2164.2
   001702         170600 INS-INIT-F1-29.                                                  NC2164.2
   001703         170700*    ===-->  BEFORE AND AFTER PHRASES  <--===                     NC2164.2
   001704         170800     MOVE "INS-TEST-F1-29" TO PAR-NAME.                           NC2164.2 179
   001705         170900     MOVE "VI-94 6.17.3 SR4" TO ANSI-REFERENCE.                   NC2164.2 235
   001706         171000     MOVE "FOR CHARS AFTER LIT" TO FEATURE.                       NC2164.2 175
   001707         171100     MOVE                                                         NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171200     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001709         171300-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001710         171400         TO WC-XN-83.                                             NC2164.2 69
   001711         171500     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001712         171600 INS-TEST-F1-29.                                                  NC2164.2
   001713         171700     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR CHARACTERS        NC2164.2 69 39
   001714         171800             BEFORE "KI"                                          NC2164.2
   001715         171900             AFTER  " W".                                         NC2164.2
   001716         172000     IF      WRK-DU-999-1 EQUAL TO 44                             NC2164.2 39
   001717      1  172100             PERFORM PASS                                         NC2164.2 329
   001718      1  172200             GO TO   INS-WRITE-F1-29.                             NC2164.2 1727
   001719         172300     GO TO   INS-FAIL-F1-29.                                      NC2164.2 1723
   001720         172400 INS-DELETE-F1-29.                                                NC2164.2
   001721         172500     PERFORM DE-LETE.                                             NC2164.2 331
   001722         172600     GO TO   INS-WRITE-F1-29.                                     NC2164.2 1727
   001723         172700 INS-FAIL-F1-29.                                                  NC2164.2
   001724         172800     PERFORM FAIL.                                                NC2164.2 330
   001725         172900     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC2164.2 39 191
   001726         173000     MOVE 44 TO CORRECT-N.                                        NC2164.2 205
   001727         173100 INS-WRITE-F1-29.                                                 NC2164.2
   001728         173200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001729         173300*                                                                 NC2164.2
   001730         173400 INS-INIT-F1-30.                                                  NC2164.2
   001731         173500*    ===-->  EVALUATION OF SUBSCRIPTED IDENTIFIERS  <--===        NC2164.2
   001732         173600     MOVE   "INS-TEST-F1-30" TO PAR-NAME.                         NC2164.2 179
   001733         173700     MOVE   "VI-95 6.17.4 GR4 & VI-97 6.17.4 GR8"                 NC2164.2
   001734         173800          TO ANSI-REFERENCE.                                      NC2164.2 235
   001735         173900     MOVE   "FOR CHARS AFTER LIT" TO FEATURE.                     NC2164.2 175
   001736         174000     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001737         174100     MOVE "XXXXXXXYYYYYYYAAABAAASSSSSSSTTTTTTT"                   NC2164.2
   001738         174200          TO INSPECT-FIELDS.                                      NC2164.2 120
   001739         174300     MOVE "GHBDC" TO LOCATE-CHARS.                                NC2164.2 129
   001740         174400     MOVE    3    TO SUB.                                         NC2164.2 138
   001741         174500 INS-TEST-F1-30-0.                                                NC2164.2
   001742         174600     INSPECT DATA-FIELD (SUB)                                     NC2164.2 128 138
   001743         174700             TALLYING WRK-DU-999-1                                NC2164.2 39
   001744         174800             FOR ALL "A" BEFORE END-CHAR (SUB)                    NC2164.2 137 138
   001745         174900                 ALL END-CHAR (SUB).                              NC2164.2 137 138
   001746         175000 INS-TEST-F1-30-1.                                                NC2164.2
   001747         175100     IF      WRK-DU-999-1 EQUAL TO 4                              NC2164.2 39
   001748      1  175200             PERFORM PASS                                         NC2164.2 329
   001749      1  175300             GO TO   INS-WRITE-F1-30-1.                           NC2164.2 1758
   001750         175400     GO TO   INS-FAIL-F1-30-1.                                    NC2164.2 1754
   001751         175500 INS-DELETE-F1-30-1.                                              NC2164.2
   001752         175600     PERFORM DE-LETE.                                             NC2164.2 331
   001753         175700     GO TO   INS-WRITE-F1-30-1.                                   NC2164.2 1758
   001754         175800 INS-FAIL-F1-30-1.                                                NC2164.2
   001755         175900     PERFORM FAIL.                                                NC2164.2 330
   001756         176000     MOVE    WRK-DU-999-1 TO COMPUTED-N.                          NC2164.2 39 191
   001757         176100     MOVE    4 TO CORRECT-N.                                      NC2164.2 205
   001758         176200 INS-WRITE-F1-30-1.                                               NC2164.2
   001759         176300     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001760         176400*                                                                 NC2164.2
   001761         176500 INS-INIT-F1-31.                                                  NC2164.2
   001762         176600     MOVE   "INS-TEST-F1-31" TO PAR-NAME.                         NC2164.2 179
   001763         176700     MOVE   "VI-93" TO ANSI-REFERENCE.                            NC2164.2 235
   001764         176800     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176900     MOVE   "AABBCCDDEBBBBGHDDIJJXXAABBCCDDEEEFFGGHHIIJJKKLLM"    NC2164.2
   001766         177000         TO TEST-31-DATA.                                         NC2164.2 146
   001767         177100     MOVE "BB" TO WS-BB.                                          NC2164.2 139
   001768         177200 INS-TEST-F1-31-0.                                                NC2164.2
   001769         177300     INSPECT TEST-31-DATA TALLYING WRK-DU-999-1                   NC2164.2 146 39
   001770         177400             FOR ALL "A"    BEFORE "X"                            NC2164.2
   001771         177500                 ALL  WS-BB BEFORE "X"                            NC2164.2 139
   001772         177600                 ALL "D"    BEFORE "X".                           NC2164.2
   001773         177700 INS-TEST-F1-31-1.                                                NC2164.2
   001774         177800     IF      WRK-DU-999-1 EQUAL TO 9                              NC2164.2 39
   001775      1  177900             PERFORM PASS                                         NC2164.2 329
   001776      1  178000             GO TO   INS-WRITE-F1-31-1.                           NC2164.2 1785
   001777         178100     GO TO   INS-FAIL-F1-31-1.                                    NC2164.2 1781
   001778         178200 INS-DELETE-F1-31-1.                                              NC2164.2
   001779         178300     PERFORM DE-LETE.                                             NC2164.2 331
   001780         178400     GO TO   INS-WRITE-F1-31-1.                                   NC2164.2 1785
   001781         178500 INS-FAIL-F1-31-1.                                                NC2164.2
   001782         178600     PERFORM FAIL.                                                NC2164.2 330
   001783         178700     MOVE    WRK-DU-999-1 TO COMPUTED-N.                          NC2164.2 39 191
   001784         178800     MOVE    10 TO CORRECT-N.                                     NC2164.2 205
   001785         178900 INS-WRITE-F1-31-1.                                               NC2164.2
   001786         179000     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001787         179100*                                                                 NC2164.2
   001788         179200 INS-INIT-F1-32.                                                  NC2164.2
   001789         179300     MOVE   "INS-TEST-F1-32" TO PAR-NAME.                         NC2164.2 179
   001790         179400     MOVE   "VI-93" TO ANSI-REFERENCE.                            NC2164.2 235
   001791         179500     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001792         179600     MOVE "AABSSSSSEBBTTTT1URSTSTSTVVDYYDEEEFFGSSSSTZSTZSTM"      NC2164.2
   001793         179700         TO TEST-32-DATA.                                         NC2164.2 149
   001794         179800     MOVE "Y" TO WS-Y.                                            NC2164.2 140
   001795         179900 INS-TEST-F1-32-0.                                                NC2164.2
   001796         180000     INSPECT TEST-32-DATA TALLYING WRK-DU-999-1                   NC2164.2 149 39
   001797         180100             FOR LEADING "S" AFTER WS-Y                           NC2164.2 140
   001798         180200                         "S" AFTER "U"                            NC2164.2
   001799         180300                         "T" AFTER WS-Y                           NC2164.2 140
   001800         180400                         "T" AFTER "U".                           NC2164.2
   001801         180500 INS-TEST-F1-32-1.                                                NC2164.2
   001802         180600     IF      WRK-DU-999-1 EQUAL TO 0                              NC2164.2 39
   001803      1  180700             PERFORM PASS                                         NC2164.2 329
   001804      1  180800             GO TO   INS-WRITE-F1-32-1.                           NC2164.2 1813
   001805         180900     GO TO   INS-FAIL-F1-32-1.                                    NC2164.2 1809
   001806         181000 INS-DELETE-F1-32-1.                                              NC2164.2
   001807         181100     PERFORM DE-LETE.                                             NC2164.2 331
   001808         181200     GO TO   INS-WRITE-F1-32-1.                                   NC2164.2 1813
   001809         181300 INS-FAIL-F1-32-1.                                                NC2164.2
   001810         181400     PERFORM FAIL.                                                NC2164.2 330
   001811         181500     MOVE    WRK-DU-999-1 TO COMPUTED-N.                          NC2164.2 39 191
   001812         181600     MOVE    0 TO CORRECT-N.                                      NC2164.2 205
   001813         181700 INS-WRITE-F1-32-1.                                               NC2164.2
   001814         181800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001815         181900*                                                                 NC2164.2
   001816         182000 INS-INIT-F2-33.                                                  NC2164.2
   001817         182100*    ===--> "BEFORE" AND "AFTER" PHRASES  <--===                  NC2164.2
   001818         182200     MOVE "INS-TEST-F2-33" TO PAR-NAME.                           NC2164.2 179
   001819         182300     MOVE "VI-94 6.17.3 SR4" TO ANSI-REFERENCE.                   NC2164.2 235
   001820         182400     MOVE "REP CHARS BY SPACES" TO FEATURE.                       NC2164.2 175
   001821         182500     MOVE                                                         NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822         182600     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001823         182700-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   001824         182800         TO WC-XN-83.                                             NC2164.2 69
   001825         182900     MOVE    WC-XN-83 TO WRK-XN-83-1.                             NC2164.2 69 63
   001826         183000     MOVE                                                         NC2164.2
   001827         183100     "AH YES AH YES W.C                                           NC2164.2
   001828         183200-    "            BE ALL BAD."                                    NC2164.2
   001829         183300         TO ANS-XN-83-10.                                         NC2164.2 99
   001830         183400 INS-TEST-F2-33-0.                                                NC2164.2
   001831         183500     INSPECT WRK-XN-83-1 REPLACING CHARACTERS BY SPACES           NC2164.2 63 IMP
   001832         183600             BEFORE "B" AFTER "C".                                NC2164.2
   001833         183700 INS-TEST-F2-33-1.                                                NC2164.2
   001834         183800     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-10                    NC2164.2 63 99
   001835      1  183900             PERFORM PASS                                         NC2164.2 329
   001836      1  184000             GO TO   INS-WRITE-F2-33-1.                           NC2164.2 1861
   001837         184100     GO TO   INS-FAIL-F2-33-1.                                    NC2164.2 1841
   001838         184200 INS-DELETE-F2-33-1.                                              NC2164.2
   001839         184300     PERFORM DE-LETE.                                             NC2164.2 331
   001840         184400     GO TO   INS-WRITE-F2-33-1.                                   NC2164.2 1861
   001841         184500 INS-FAIL-F2-33-1.                                                NC2164.2
   001842         184600     PERFORM FAIL.                                                NC2164.2 330
   001843         184700     MOVE    WRK-XN-83-1  TO WS-WRONG-1-83.                       NC2164.2 63 113
   001844         184800     MOVE    ANS-XN-83-10 TO WS-RIGHT-1-83.                       NC2164.2 99 107
   001845         184900     MOVE "THERE SHOUD BE 55 SPACES BETWEEN ""B"" AND ""C""."     NC2164.2
   001846         185000          TO RE-MARK.                                             NC2164.2 184
   001847         185100     MOVE    WS-RIGHT-1-20   TO CORRECT-A.                        NC2164.2 108 204
   001848         185200     MOVE    WS-WRONG-1-20   TO COMPUTED-A.                       NC2164.2 114 190
   001849         185300     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001850         185400     MOVE    WS-RIGHT-21-40  TO CORRECT-A.                        NC2164.2 109 204
   001851         185500     MOVE    WS-WRONG-21-40  TO COMPUTED-A.                       NC2164.2 115 190
   001852         185600     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001853         185700     MOVE    WS-RIGHT-41-60  TO CORRECT-A.                        NC2164.2 110 204
   001854         185800     MOVE    WS-WRONG-41-60  TO COMPUTED-A.                       NC2164.2 116 190
   001855         185900     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001856         186000     MOVE    WS-RIGHT-61-80  TO CORRECT-A.                        NC2164.2 111 204
   001857         186100     MOVE    WS-WRONG-61-80  TO COMPUTED-A.                       NC2164.2 117 190
   001858         186200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001859         186300     MOVE    WS-RIGHT-81-83  TO CORRECT-A.                        NC2164.2 112 204
   001860         186400     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   001861         186500 INS-WRITE-F2-33-1.                                               NC2164.2
   001862         186600     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001863         186700*                                                                 NC2164.2
   001864         186800 INS-INIT-F2-34.                                                  NC2164.2
   001865         186900*    ===-->  MULTIPLE "CHARACTERS" PHRASES WITH  <--===           NC2164.2
   001866         187000*    ===-->         "BEFORE" AND "AFTER"         <--===           NC2164.2
   001867         187100     MOVE   "INS-TEST-F2-34" TO PAR-NAME.                         NC2164.2 179
   001868         187200     MOVE   "VI-93 6.17.2" TO ANSI-REFERENCE.                     NC2164.2 235
   001869         187300     MOVE   "AAFSSQ  ET U V W H S" TO TEST-34-DATA.               NC2164.2 152
   001870         187400     MOVE   "AAFXXQ  ETYYYYYYYH S" TO TEST-34-ANSWER.             NC2164.2 155
   001871         187500 INS-TEST-F2-34-0.                                                NC2164.2
   001872         187600     INSPECT TEST-34-DATA                                         NC2164.2 152
   001873         187700             REPLACING                                            NC2164.2
   001874         187800             CHARACTERS BY "X" AFTER "F" BEFORE "Q"               NC2164.2
   001875         187900             CHARACTERS BY "Y" AFTER "T" BEFORE "H".              NC2164.2
   001876         188000 INS-TEST-F2-34-1.                                                NC2164.2
   001877         188100     IF      TEST-34-DATA = TEST-34-ANSWER                        NC2164.2 152 155
   001878      1  188200             PERFORM PASS                                         NC2164.2 329
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879      1  188300             GO TO   INS-WRITE-F2-34-1.                           NC2164.2 1888
   001880         188400     GO TO   INS-FAIL-F2-34-1.                                    NC2164.2 1884
   001881         188500 INS-DELETE-F2-34-1.                                              NC2164.2
   001882         188600     PERFORM DE-LETE.                                             NC2164.2 331
   001883         188700     GO TO   INS-WRITE-F2-34-1.                                   NC2164.2 1888
   001884         188800 INS-FAIL-F2-34-1.                                                NC2164.2
   001885         188900     PERFORM FAIL.                                                NC2164.2 330
   001886         189000     MOVE    TEST-34-DATA TO COMPUTED-A.                          NC2164.2 152 190
   001887         189100     MOVE    TEST-34-ANSWER TO CORRECT-A.                         NC2164.2 155 204
   001888         189200 INS-WRITE-F2-34-1.                                               NC2164.2
   001889         189300     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001890         189400*                                                                 NC2164.2
   001891         189500 INS-INIT-F3-35.                                                  NC2164.2
   001892         189600*    ===-->  MULTIPLE "CHARACTERS" PHRASES WITH  <--===           NC2164.2
   001893         189700*    ===-->         "BEFORE" AND "AFTER"         <--===           NC2164.2
   001894         189800     MOVE   "INS-TEST-F3-35-1" TO PAR-NAME.                       NC2164.2 179
   001895         189900     MOVE   "VI-93 6.17.2" TO ANSI-REFERENCE.                     NC2164.2 235
   001896         190000     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001897         190100     MOVE "AX SSA YEG U V W H S"  TO TEST-35-DATA.                NC2164.2 158
   001898         190200     MOVE "AXAAAAAYEG       H S"  TO TEST-35-ANSWER.              NC2164.2 161
   001899         190300 INS-TEST-F3-35-0.                                                NC2164.2
   001900         190400     INSPECT TEST-35-DATA TALLYING WRK-DU-999-1                   NC2164.2 158 39
   001901         190500             FOR CHARACTERS                                       NC2164.2
   001902         190600             REPLACING                                            NC2164.2
   001903         190700             CHARACTERS BY   "A" AFTER "X" BEFORE "Y"             NC2164.2
   001904         190800             CHARACTERS BY SPACE AFTER "G" BEFORE "H".            NC2164.2 IMP
   001905         190900 INS-TEST-F3-35-1.                                                NC2164.2
   001906         191000     IF      TEST-35-DATA = TEST-35-ANSWER                        NC2164.2 158 161
   001907      1  191100             PERFORM PASS                                         NC2164.2 329
   001908      1  191200             GO TO   INS-WRITE-F3-35-1.                           NC2164.2 1917
   001909         191300     GO TO   INS-FAIL-F3-35-1.                                    NC2164.2 1913
   001910         191400 INS-DELETE-F3-35-1.                                              NC2164.2
   001911         191500     PERFORM DE-LETE.                                             NC2164.2 331
   001912         191600     GO TO   INS-WRITE-F3-35-1.                                   NC2164.2 1917
   001913         191700 INS-FAIL-F3-35-1.                                                NC2164.2
   001914         191800     PERFORM FAIL.                                                NC2164.2 330
   001915         191900     MOVE    TEST-35-DATA TO COMPUTED-A.                          NC2164.2 158 190
   001916         192000     MOVE    TEST-35-ANSWER TO CORRECT-A.                         NC2164.2 161 204
   001917         192100 INS-WRITE-F3-35-1.                                               NC2164.2
   001918         192200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001919         192300*                                                                 NC2164.2
   001920         192400 INS-INIT-F3-36.                                                  NC2164.2
   001921         192500*    ===-->    "BEFORE" AND "AFTER" PHRASES     <--===            NC2164.2
   001922         192600     MOVE   "INS-TEST-F3-36" TO PAR-NAME.                         NC2164.2 179
   001923         192700     MOVE   "TALLY-REPLACE CHARS" TO FEATURE.                     NC2164.2 175
   001924         192800     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   001925         192900     MOVE                                                         NC2164.2
   001926         193000     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   001927         193100-    "IDS CAN NOT BE ALL BAZ."                                    NC2164.2
   001928         193200         TO WC-XN-83.                                             NC2164.2 69
   001929         193300     MOVE    WC-XN-83 TO WRK-XN-83-1.                             NC2164.2 69 63
   001930         193400     MOVE                                                         NC2164.2
   001931         193500     "AH                                                          NC2164.2
   001932         193600-    "                     Z."                                    NC2164.2
   001933         193700          TO ANS-XN-83-11.                                        NC2164.2 102
   001934         193800     MOVE    1 TO REC-CT.                                         NC2164.2 226
   001935         193900 INS-TEST-F3-36-0.                                                NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         194000     INSPECT WRK-XN-83-1                                          NC2164.2 63
   001937         194100             TALLYING  WRK-DU-999-1 FOR CHARACTERS                NC2164.2 39
   001938         194200                       BEFORE "LL" AFTER "ES"                     NC2164.2
   001939         194300             REPLACING CHARACTERS BY SPACES                       NC2164.2 IMP
   001940         194400                       AFTER "H" BEFORE "Z".                      NC2164.2
   001941         194500     GO TO   INS-TEST-F3-36-1.                                    NC2164.2 1946
   001942         194600 INS-DELETE-F3-36.                                                NC2164.2
   001943         194700     PERFORM DE-LETE.                                             NC2164.2 331
   001944         194800     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001945         194900     GO      TO INS-INIT-F3-37.                                   NC2164.2 1995
   001946         195000 INS-TEST-F3-36-1.                                                NC2164.2
   001947         195100     IF      WRK-DU-999-1 EQUAL TO 70                             NC2164.2 39
   001948      1  195200             PERFORM PASS                                         NC2164.2 329
   001949      1  195300             GO TO INS-WRITE-F3-36-1                              NC2164.2 1959
   001950         195400     ELSE                                                         NC2164.2
   001951      1  195500             GO TO INS-FAIL-F3-36-1.                              NC2164.2 1955
   001952         195600 INS-DELETE-F3-36-1.                                              NC2164.2
   001953         195700     PERFORM DE-LETE.                                             NC2164.2 331
   001954         195800     GO TO INS-WRITE-F3-36-1.                                     NC2164.2 1959
   001955         195900 INS-FAIL-F3-36-1.                                                NC2164.2
   001956         196000     PERFORM FAIL                                                 NC2164.2 330
   001957         196100     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   001958         196200     MOVE    70 TO CORRECT-N.                                     NC2164.2 205
   001959         196300 INS-WRITE-F3-36-1.                                               NC2164.2
   001960         196400     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001961         196500*                                                                 NC2164.2
   001962         196600 INS-TEST-F3-36-2.                                                NC2164.2
   001963         196700     ADD     1 TO REC-CT.                                         NC2164.2 226
   001964         196800     IF      WRK-XN-83-1 = ANS-XN-83-11                           NC2164.2 63 102
   001965      1  196900             PERFORM PASS                                         NC2164.2 329
   001966      1  197000             GO TO INS-WRITE-F3-36-2                              NC2164.2 1992
   001967         197100     ELSE                                                         NC2164.2
   001968      1  197200             GO TO INS-FAIL-F3-36-2.                              NC2164.2 1972
   001969         197300 INS-DELETE-F3-36-2.                                              NC2164.2
   001970         197400     PERFORM DE-LETE.                                             NC2164.2 331
   001971         197500     GO TO INS-WRITE-F3-36-2.                                     NC2164.2 1992
   001972         197600 INS-FAIL-F3-36-2.                                                NC2164.2
   001973         197700     PERFORM FAIL                                                 NC2164.2 330
   001974         197800     MOVE    WRK-XN-83-1  TO WS-WRONG-1-83                        NC2164.2 63 113
   001975         197900     MOVE    ANS-XN-83-11 TO WS-RIGHT-1-83                        NC2164.2 102 107
   001976         198000     MOVE "THERE SHOULD BE 81 SPACES BETWEEN ""H"" AND ""Z""."    NC2164.2
   001977         198100             TO RE-MARK                                           NC2164.2 184
   001978         198200     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   001979         198300     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   001980         198400     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001981         198500     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   001982         198600     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   001983         198700     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001984         198800     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   001985         198900     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   001986         199000     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001987         199100     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   001988         199200     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   001989         199300     PERFORM PRINT-DETAIL                                         NC2164.2 333
   001990         199400     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   001991         199500     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   001992         199600 INS-WRITE-F3-36-2.                                               NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993         199700     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   001994         199800*                                                                 NC2164.2
   001995         199900 INS-INIT-F3-37.                                                  NC2164.2
   001996         200000*    ===-->    "BEFORE" AND "AFTER" PHRASES     <--===            NC2164.2
   001997         200100     MOVE   "INS-TEST-F3-37" TO PAR-NAME.                         NC2164.2 179
   001998         200200     MOVE   "REPL FIRST AFTER" TO FEATURE.                        NC2164.2 175
   001999         200300     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   002000         200400     MOVE                                                         NC2164.2
   002001         200500     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   002002         200600-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   002003         200700         TO WC-XN-83.                                             NC2164.2 69
   002004         200800     MOVE    WC-XN-83 TO WRK-XN-83-1.                             NC2164.2 69 63
   002005         200900     MOVE                                                         NC2164.2
   002006         201000     "AH YES OH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2164.2
   002007         201100-    "IDS CAN NOT BE ALL BAD."                                    NC2164.2
   002008         201200         TO ANS-XN-83-5.                                          NC2164.2 84
   002009         201300     MOVE    1 TO REC-CT.                                         NC2164.2 226
   002010         201400 INS-TEST-F3-37-0.                                                NC2164.2
   002011         201500     INSPECT WRK-XN-83-1                                          NC2164.2 63
   002012         201600             TALLYING  WRK-DU-999-1 FOR ALL "A"                   NC2164.2 39
   002013         201700                       BEFORE L-XN-1-1                            NC2164.2 51
   002014         201800                       AFTER  "YE"                                NC2164.2
   002015         201900             REPLACING FIRST  AH-XN-2 BY "OH"                     NC2164.2 56
   002016         202000                       AFTER  INITIAL HSPACE-XN-2                 NC2164.2 57
   002017         202100                       BEFORE "F".                                NC2164.2
   002018         202200     GO TO INS-TEST-F3-37-1.                                      NC2164.2 2023
   002019         202300 INS-DELETE-F3-37.                                                NC2164.2
   002020         202400     PERFORM DE-LETE.                                             NC2164.2 331
   002021         202500     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002022         202600     GO      TO INS-INIT-F3-38.                                   NC2164.2 2070
   002023         202700 INS-TEST-F3-37-1.                                                NC2164.2
   002024         202800     IF      WRK-DU-999-1 EQUAL TO 6                              NC2164.2 39
   002025      1  202900             PERFORM PASS                                         NC2164.2 329
   002026      1  203000             GO TO INS-WRITE-F3-37-1                              NC2164.2 2036
   002027         203100     ELSE                                                         NC2164.2
   002028      1  203200             GO TO INS-FAIL-F3-37-1.                              NC2164.2 2032
   002029         203300 INS-DELETE-F3-37-1.                                              NC2164.2
   002030         203400     PERFORM DE-LETE.                                             NC2164.2 331
   002031         203500     GO TO INS-WRITE-F3-37-1.                                     NC2164.2 2036
   002032         203600 INS-FAIL-F3-37-1.                                                NC2164.2
   002033         203700     PERFORM FAIL                                                 NC2164.2 330
   002034         203800     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC2164.2 39 191
   002035         203900     MOVE    6 TO CORRECT-N.                                      NC2164.2 205
   002036         204000 INS-WRITE-F3-37-1.                                               NC2164.2
   002037         204100     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002038         204200*                                                                 NC2164.2
   002039         204300 INS-TEST-F3-37-2.                                                NC2164.2
   002040         204400     ADD     1 TO REC-CT.                                         NC2164.2 226
   002041         204500     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-5                     NC2164.2 63 84
   002042      1  204600             PERFORM PASS                                         NC2164.2 329
   002043      1  204700             GO TO INS-WRITE-F3-37-2                              NC2164.2 2067
   002044         204800     ELSE                                                         NC2164.2
   002045      1  204900             GO TO INS-FAIL-F3-37-2.                              NC2164.2 2049
   002046         205000 INS-DELETE-F3-37-2.                                              NC2164.2
   002047         205100     PERFORM DE-LETE.                                             NC2164.2 331
   002048         205200     GO TO INS-WRITE-F3-37-2.                                     NC2164.2 2067
   002049         205300 INS-FAIL-F3-37-2.                                                NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050         205400     PERFORM FAIL                                                 NC2164.2 330
   002051         205500     MOVE    WRK-XN-83-1     TO WS-WRONG-1-83                     NC2164.2 63 113
   002052         205600     MOVE    ANS-XN-83-5     TO WS-RIGHT-1-83                     NC2164.2 84 107
   002053         205700     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2164.2 108 204
   002054         205800     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2164.2 114 190
   002055         205900     PERFORM PRINT-DETAIL                                         NC2164.2 333
   002056         206000     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2164.2 109 204
   002057         206100     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2164.2 115 190
   002058         206200     PERFORM PRINT-DETAIL                                         NC2164.2 333
   002059         206300     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2164.2 110 204
   002060         206400     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2164.2 116 190
   002061         206500     PERFORM PRINT-DETAIL                                         NC2164.2 333
   002062         206600     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2164.2 111 204
   002063         206700     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2164.2 117 190
   002064         206800     PERFORM PRINT-DETAIL                                         NC2164.2 333
   002065         206900     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2164.2 112 204
   002066         207000     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2164.2 118 190
   002067         207100 INS-WRITE-F3-37-2.                                               NC2164.2
   002068         207200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002069         207300*                                                                 NC2164.2
   002070         207400 INS-INIT-F3-38.                                                  NC2164.2
   002071         207500*    ===-->  MULTIPLE OPERANDS FOR "ALL"         <--===           NC2164.2
   002072         207600     MOVE   "INS-TEST-F3-38" TO PAR-NAME.                         NC2164.2 179
   002073         207700     MOVE   "VI-93 6.17.2" TO ANSI-REFERENCE.                     NC2164.2 235
   002074         207800     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   002075         207900     MOVE "E" TO WS-E.                                            NC2164.2 142
   002076         208000     MOVE "AXESSA YEGTUASSW H S"  TO TEST-38-DATA.                NC2164.2 164
   002077         208100     MOVE    ZERO TO REC-CT.                                      NC2164.2 IMP 226
   002078         208200 INS-TEST-F3-38-0.                                                NC2164.2
   002079         208300     INSPECT TEST-38-DATA TALLYING WRK-DU-999-1                   NC2164.2 164 39
   002080         208400             FOR                                                  NC2164.2
   002081         208500             ALL "A" AFTER WS-E                                   NC2164.2 142
   002082         208600                 "A" AFTER "T"                                    NC2164.2
   002083         208700                 "S" AFTER WS-E                                   NC2164.2 142
   002084         208800                 "S" AFTER "T".                                   NC2164.2
   002085         208900 INS-TEST-F3-38-1.                                                NC2164.2
   002086         209000     IF      WRK-DU-999-1 = 7                                     NC2164.2 39
   002087      1  209100             PERFORM PASS                                         NC2164.2 329
   002088      1  209200             GO TO   INS-WRITE-F3-38.                             NC2164.2 2097
   002089         209300     GO TO   INS-FAIL-F3-38.                                      NC2164.2 2093
   002090         209400 INS-DELETE-F3-38.                                                NC2164.2
   002091         209500     PERFORM DE-LETE.                                             NC2164.2 331
   002092         209600     GO TO   INS-WRITE-F3-38.                                     NC2164.2 2097
   002093         209700 INS-FAIL-F3-38.                                                  NC2164.2
   002094         209800     PERFORM FAIL.                                                NC2164.2 330
   002095         209900     MOVE    WRK-DU-999-1 TO COMPUTED-N.                          NC2164.2 39 191
   002096         210000     MOVE    7 TO CORRECT-N.                                      NC2164.2 205
   002097         210100 INS-WRITE-F3-38.                                                 NC2164.2
   002098         210200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002099         210300*                                                                 NC2164.2
   002100         210400 INS-INIT-F3-39.                                                  NC2164.2
   002101         210500*    ===-->  MULTIPLE OPERANDS FOR "LEADING"     <--===           NC2164.2
   002102         210600     MOVE   "INS-TEST-F3-39" TO PAR-NAME.                         NC2164.2 179
   002103         210700     MOVE   "VI-93 6.17.2" TO ANSI-REFERENCE.                     NC2164.2 235
   002104         210800     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   002105         210900     MOVE "ABESSA YE TUTCGW H S" TO TEST-39-DATA.                 NC2164.2 167
   002106         211000 INS-TEST-F3-39-0.                                                NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107         211100     INSPECT TEST-39-DATA                                         NC2164.2 167
   002108         211200             TALLYING   WRK-DU-999-1                              NC2164.2 39
   002109         211300             FOR        LEADING "B"                               NC2164.2
   002110         211400                        LEADING WS-E                              NC2164.2 142
   002111         211500                        BEFORE  "C"                               NC2164.2
   002112         211600             REPLACING                                            NC2164.2
   002113         211700             CHARACTERS BY   "A" AFTER "X" BEFORE "Y"             NC2164.2
   002114         211800             CHARACTERS BY SPACE AFTER "G" BEFORE "H".            NC2164.2 IMP
   002115         211900 INS-TEST-F3-39-1.                                                NC2164.2
   002116         212000     IF      WRK-DU-999-1 = 0                                     NC2164.2 39
   002117      1  212100             PERFORM PASS                                         NC2164.2 329
   002118      1  212200             GO TO   INS-WRITE-F3-39-1.                           NC2164.2 2127
   002119         212300     GO TO   INS-FAIL-F3-39-1.                                    NC2164.2 2123
   002120         212400 INS-DELETE-F3-39-1.                                              NC2164.2
   002121         212500     PERFORM DE-LETE.                                             NC2164.2 331
   002122         212600     GO TO   INS-WRITE-F3-39-1.                                   NC2164.2 2127
   002123         212700 INS-FAIL-F3-39-1.                                                NC2164.2
   002124         212800     PERFORM FAIL.                                                NC2164.2 330
   002125         212900     MOVE    WRK-DU-999-1 TO COMPUTED-N.                          NC2164.2 39 191
   002126         213000     MOVE    0            TO CORRECT-N.                           NC2164.2 205
   002127         213100 INS-WRITE-F3-39-1.                                               NC2164.2
   002128         213200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002129         213300*                                                                 NC2164.2
   002130         213400 INS-INIT-F4-40.                                                  NC2164.2
   002131         213500*    ===-->        INSPECT CONVERTING            <--===           NC2164.2
   002132         213600     MOVE   "INS-TEST-F4-40" TO PAR-NAME.                         NC2164.2 179
   002133         213700     MOVE   "VI-943" TO ANSI-REFERENCE.                           NC2164.2 235
   002134         213800     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   002135         213900     MOVE "GADQAUZTABAGA" TO TEST-40-DATA.                        NC2164.2 170
   002136         214000 INS-TEST-F4-40-0.                                                NC2164.2
   002137         214100     INSPECT TEST-40-DATA                                         NC2164.2 170
   002138         214200             CONVERTING "AU" TO "23" BEFORE "B" AFTER "Q".        NC2164.2
   002139         214300     GO TO   INS-TEST-F4-40-1.                                    NC2164.2 2144
   002140         214400 INS-DELETE-F4-40.                                                NC2164.2
   002141         214500     PERFORM DE-LETE.                                             NC2164.2 331
   002142         214600     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002143         214700     GO TO   INS-INIT-F4-41.                                      NC2164.2 2159
   002144         214800 INS-TEST-F4-40-1.                                                NC2164.2
   002145         214900     IF      TEST-40-DATA = "GADQ23ZT2BAGA"                       NC2164.2 170
   002146      1  215000             PERFORM PASS                                         NC2164.2 329
   002147      1  215100             GO TO INS-WRITE-F4-40-1                              NC2164.2 2157
   002148         215200     ELSE                                                         NC2164.2
   002149      1  215300             GO TO INS-FAIL-F4-40-1.                              NC2164.2 2153
   002150         215400 INS-DELETE-F4-40-1.                                              NC2164.2
   002151         215500     PERFORM DE-LETE.                                             NC2164.2 331
   002152         215600     GO TO INS-WRITE-F4-40-1.                                     NC2164.2 2157
   002153         215700 INS-FAIL-F4-40-1.                                                NC2164.2
   002154         215800     MOVE   "GADQ23ZT2BAGA" TO CORRECT-A                          NC2164.2 204
   002155         215900     MOVE    TEST-40-DATA TO COMPUTED-A                           NC2164.2 170 190
   002156         216000     PERFORM FAIL.                                                NC2164.2 330
   002157         216100 INS-WRITE-F4-40-1.                                               NC2164.2
   002158         216200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002159         216300 INS-INIT-F4-41.                                                  NC2164.2
   002160         216400*    ===-->        INSPECT CONVERTING            <--===           NC2164.2
   002161         216500     MOVE   "INS-TEST-F4-41" TO PAR-NAME.                         NC2164.2 179
   002162         216600     MOVE   "VI-943" TO ANSI-REFERENCE.                           NC2164.2 235
   002163         216700     MOVE   "GADQ23ZT2BAGA"  TO TEST-40-DATA.                     NC2164.2 170
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002164         216800     MOVE   "DF" TO XN-DF.                                        NC2164.2 143
   002165         216900     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   002166         217000 INS-TEST-F4-41-0.                                                NC2164.2
   002167         217100     INSPECT TEST-40-DATA                                         NC2164.2 170
   002168         217200             CONVERTING XN-DF TO "45".                            NC2164.2 143
   002169         217300     GO TO   INS-TEST-F4-41-1.                                    NC2164.2 2174
   002170         217400 INS-DELETE-F4-41.                                                NC2164.2
   002171         217500     PERFORM DE-LETE.                                             NC2164.2 331
   002172         217600     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002173         217700     GO TO   INS-INIT-F4-42.                                      NC2164.2 2190
   002174         217800 INS-TEST-F4-41-1.                                                NC2164.2
   002175         217900     IF      TEST-40-DATA = "GA4Q23ZT2BAGA"                       NC2164.2 170
   002176      1  218000             PERFORM PASS                                         NC2164.2 329
   002177      1  218100             GO TO INS-WRITE-F4-41-1                              NC2164.2 2187
   002178         218200     ELSE                                                         NC2164.2
   002179      1  218300             GO TO INS-FAIL-F4-41-1.                              NC2164.2 2183
   002180         218400 INS-DELETE-F4-41-1.                                              NC2164.2
   002181         218500     PERFORM DE-LETE.                                             NC2164.2 331
   002182         218600     GO TO INS-WRITE-F4-41-1.                                     NC2164.2 2187
   002183         218700 INS-FAIL-F4-41-1.                                                NC2164.2
   002184         218800     MOVE   "GA4Q23ZT2BAGA" TO CORRECT-A                          NC2164.2 204
   002185         218900     MOVE    TEST-40-DATA TO COMPUTED-A                           NC2164.2 170 190
   002186         219000     PERFORM FAIL.                                                NC2164.2 330
   002187         219100 INS-WRITE-F4-41-1.                                               NC2164.2
   002188         219200     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002189         219300*                                                                 NC2164.2
   002190         219400 INS-INIT-F4-42.                                                  NC2164.2
   002191         219500*    ===-->        INSPECT CONVERTING            <--===           NC2164.2
   002192         219600     MOVE   "INS-TEST-F4-42" TO PAR-NAME.                         NC2164.2 179
   002193         219700     MOVE   "VI-943" TO ANSI-REFERENCE.                           NC2164.2 235
   002194         219800     MOVE    ZERO TO WRK-DU-999-1.                                NC2164.2 IMP 39
   002195         219900     MOVE   "GA4Q23ZT2BAGA" TO TEST-40-DATA.                      NC2164.2 170
   002196         220000     MOVE   "67" TO XN-67.                                        NC2164.2 144
   002197         220100 INS-TEST-F4-42-0.                                                NC2164.2
   002198         220200     INSPECT TEST-40-DATA                                         NC2164.2 170
   002199         220300             CONVERTING  "GA" TO XN-67 BEFORE XN-B.               NC2164.2 144 145
   002200         220400     GO TO   INS-TEST-F4-42-1.                                    NC2164.2 2205
   002201         220500 INS-DELETE-F4-42.                                                NC2164.2
   002202         220600     PERFORM DE-LETE.                                             NC2164.2 331
   002203         220700     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002204         220800     GO TO   CCVS-EXIT.                                           NC2164.2 2221
   002205         220900 INS-TEST-F4-42-1.                                                NC2164.2
   002206         221000     IF      TEST-40-DATA = "674Q23ZT2BAGA"                       NC2164.2 170
   002207      1  221100             PERFORM PASS                                         NC2164.2 329
   002208      1  221200             GO TO INS-WRITE-F4-42-1                              NC2164.2 2218
   002209         221300     ELSE                                                         NC2164.2
   002210      1  221400             GO TO INS-FAIL-F4-42-1.                              NC2164.2 2214
   002211         221500 INS-DELETE-F4-42-1.                                              NC2164.2
   002212         221600     PERFORM DE-LETE.                                             NC2164.2 331
   002213         221700     GO TO INS-WRITE-F4-42-1.                                     NC2164.2 2218
   002214         221800 INS-FAIL-F4-42-1.                                                NC2164.2
   002215         221900     MOVE   "674Q23ZT2BAGA" TO CORRECT-A                          NC2164.2 204
   002216         222000     MOVE    TEST-40-DATA TO COMPUTED-A                           NC2164.2 170 190
   002217         222100     PERFORM FAIL.                                                NC2164.2 330
   002218         222200 INS-WRITE-F4-42-1.                                               NC2164.2
   002219         222300     PERFORM PRINT-DETAIL.                                        NC2164.2 333
   002220         222400*                                                                 NC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002221         222500 CCVS-EXIT SECTION.                                               NC2164.2
   002222         222600 CCVS-999999.                                                     NC2164.2
   002223         222700     GO TO CLOSE-FILES.                                           NC2164.2 322
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    43
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       47   A-XN-1-1
       62   AABA-XN-4. . . . . . . . . . .  M1650 M1654
       56   AH-XN-2. . . . . . . . . . . .  991 1049 1049 1187 1386 2015
       59   ALL-XN-3 . . . . . . . . . . .  824
       72   ANS-XN-83-1. . . . . . . . . .  688 699 785 795 1074 1085 1212 1223
       99   ANS-XN-83-10 . . . . . . . . .  M1829 1834 1844
      102   ANS-XN-83-11 . . . . . . . . .  M1933 1964 1975
       75   ANS-XN-83-2. . . . . . . . . .  744 754
       78   ANS-XN-83-3. . . . . . . . . .  825 835
       81   ANS-XN-83-4. . . . . . . . . .  945 956
       84   ANS-XN-83-5. . . . . . . . . .  M621 638 M987 1017 1028 M1044 M1116 1145 1156 M2008 2041 2052
       87   ANS-XN-83-6. . . . . . . . . .  1339 1350
       90   ANS-XN-83-7. . . . . . . . . .  1412 1423
       93   ANS-XN-83-8. . . . . . . . . .  1455 1466
       96   ANS-XN-83-9. . . . . . . . . .  M667 705 713
      235   ANSI-REFERENCE . . . . . . . .  407 414 423 M433 M458 M483 M508 M533 M559 M585 M611 M658 M733 M774 M815 M855
                                            M908 M976 M1034 M1105 M1176 M1243 M1370 M1445 M1486 M1527 M1579 M1602 M1625 M1648
                                            M1677 M1705 M1734 M1763 M1790 M1819 M1868 M1895 M2073 M2103 M2133 M2162 M2193
       68   BLANK-PERIOD . . . . . . . . .  680
      214   CCVS-C-1 . . . . . . . . . . .  351 393
      219   CCVS-C-2 . . . . . . . . . . .  352 394
      269   CCVS-E-1 . . . . . . . . . . .  357
      274   CCVS-E-2 . . . . . . . . . . .  366 373 380 385
      277   CCVS-E-2-2 . . . . . . . . . .  M365
      282   CCVS-E-3 . . . . . . . . . . .  386
      291   CCVS-E-4 . . . . . . . . . . .  365
      292   CCVS-E-4-1 . . . . . . . . . .  M363
      294   CCVS-E-4-2 . . . . . . . . . .  M364
      236   CCVS-H-1 . . . . . . . . . . .  346
      241   CCVS-H-2A. . . . . . . . . . .  347
      250   CCVS-H-2B. . . . . . . . . . .  348
      262   CCVS-H-3 . . . . . . . . . . .  349
      312   CCVS-PGM-ID. . . . . . . . . .  318 318
      196   CM-18V0
       45   COMMA-XN-1-1 . . . . . . . . .  743
      190   COMPUTED-A . . . . . . . . . .  191 193 194 195 196 419 422 M640 M643 M646 M649 M652 M698 M715 M718 M721 M724
                                            M727 M756 M759 M762 M765 M768 M797 M800 M803 M806 M809 M837 M840 M843 M846 M849
                                            M901 M958 M961 M964 M967 M970 M1027 M1087 M1090 M1093 M1096 M1099 M1158 M1161
                                            M1164 M1167 M1170 M1225 M1228 M1231 M1234 M1237 M1352 M1355 M1358 M1361 M1364
                                            M1425 M1428 M1431 M1434 M1437 M1468 M1471 M1474 M1477 M1480 M1509 M1512 M1515
                                            M1518 M1521 M1848 M1851 M1854 M1857 M1860 M1886 M1915 M1979 M1982 M1985 M1988
                                            M1991 M2054 M2057 M2060 M2063 M2066 M2155 M2185 M2216
      191   COMPUTED-N . . . . . . . . . .  M451 M476 M501 M526 M552 M578 M604 M884 M938 M1010 M1067 M1138 M1205 M1281 M1298
                                            M1315 M1332 M1405 M1554 M1571 M1595 M1618 M1641 M1668 M1697 M1725 M1756 M1783
                                            M1811 M1957 M2034 M2095 M2125
      189   COMPUTED-X . . . . . . . . . .  M341 405
      193   COMPUTED-0V18
      195   COMPUTED-14V4
      197   COMPUTED-18V0
      194   COMPUTED-4V14
      213   COR-ANSI-REFERENCE . . . . . .  M414 M416
      204   CORRECT-A. . . . . . . . . . .  205 206 207 208 209 420 422 M639 M642 M645 M648 M651 M699 M714 M717 M720 M723
                                            M726 M755 M758 M761 M764 M767 M796 M799 M802 M805 M808 M836 M839 M842 M845 M848
                                            M902 M957 M960 M963 M966 M969 M1028 M1086 M1089 M1092 M1095 M1098 M1157 M1160
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    44
0 Defined   Cross-reference of data names   References

0                                           M1163 M1166 M1169 M1224 M1227 M1230 M1233 M1236 M1351 M1354 M1357 M1360 M1363
                                            M1424 M1427 M1430 M1433 M1436 M1467 M1470 M1473 M1476 M1479 M1508 M1511 M1514
                                            M1517 M1520 M1847 M1850 M1853 M1856 M1859 M1887 M1916 M1978 M1981 M1984 M1987
                                            M1990 M2053 M2056 M2059 M2062 M2065 M2154 M2184 M2215
      205   CORRECT-N. . . . . . . . . . .  M452 M477 M502 M527 M553 M579 M605 M885 M939 M1011 M1068 M1139 M1206 M1282 M1299
                                            M1316 M1333 M1406 M1555 M1572 M1596 M1619 M1642 M1669 M1698 M1726 M1757 M1784
                                            M1812 M1958 M2035 M2096 M2126
      203   CORRECT-X. . . . . . . . . . .  M342 406
      206   CORRECT-0V18
      208   CORRECT-14V4
      210   CORRECT-18V0
      207   CORRECT-4V14
      209   CR-18V0
       48   D-XN-1-1
      128   DATA-FIELD . . . . . . . . . .  1742
      227   DELETE-COUNTER . . . . . . . .  M331 360 376 378
      182   DOTVALUE . . . . . . . . . . .  M336
      233   DUMMY-HOLD . . . . . . . . . .  M390 396
       37   DUMMY-RECORD . . . . . . . . .  M346 M347 M348 M349 M351 M352 M353 M355 M357 M366 M373 M380 M385 M386 390 M391
                                            392 M393 M394 M395 M396 400 M401 M409 M424
      137   END-CHAR . . . . . . . . . . .  1744 1745
      280   ENDER-DESC . . . . . . . . . .  M368 M379 M384
      228   ERROR-COUNTER. . . . . . . . .  M330 359 369 372
      232   ERROR-HOLD . . . . . . . . . .  M359 M360 M360 M361 364
      278   ERROR-TOTAL. . . . . . . . . .  M370 M372 M377 M378 M382 M383
      175   FEATURE. . . . . . . . . . . .  M434 M459 M484 M509 M534 M560 M586 M612 M659 M734 M775 M816 M856 M909 M977 M1035
                                            M1106 M1177 M1244 M1371 M1446 M1487 M1528 M1578 M1603 M1626 M1649 M1678 M1706
                                            M1735 M1820 M1923 M1998
       49   G-XN-1-1 . . . . . . . . . . .  1387
      121   GRP-A. . . . . . . . . . . . .  127
      127   GRP-B
      130   GRP-C. . . . . . . . . . . . .  136
      136   GRP-D
       50   H-XN-1-1
       57   HSPACE-XN-2. . . . . . . . . .  920 992 2016
       46   HYPEN-XN-1-1 . . . . . . . . .  1384
      306   HYPHEN-LINE. . . . . . . . . .  353 355 395
      272   ID-AGAIN . . . . . . . . . . .  M318
      305   INF-ANSI-REFERENCE . . . . . .  M407 M410 M423 M425
      300   INFO-TEXT. . . . . . . . . . .  M408
      229   INSPECT-COUNTER. . . . . . . .  M328 359 381 383
      120   INSPECT-FIELDS . . . . . . . .  M1738
       43   JUST-XN-20-1
       67   KIDS-CAN-NOT-BE. . . . . . . .  679
       51   L-XN-1-1 . . . . . . . . . . .  919 991 1383 2013
      129   LOCATE-CHARS . . . . . . . . .  M1739
       52   O-XN-1-1 . . . . . . . . . . .  M781 783
       58   OH-XN-2. . . . . . . . . . . .  1386
      177   P-OR-F . . . . . . . . . . . .  M328 M329 M330 M331 338 M341
       53   P-XN-1-1 . . . . . . . . . . .  1385
      179   PAR-NAME . . . . . . . . . . .  M343 M432 M457 M482 M507 M532 M558 M584 M610 M657 M732 M773 M814 M854 M907 M975
                                            M1033 M1104 M1175 M1242 M1369 M1443 M1444 M1485 M1526 M1577 M1601 M1624 M1647
                                            M1676 M1704 M1732 M1762 M1789 M1818 M1867 M1894 M1922 M1997 M2072 M2102 M2132
                                            M2161 M2192
      181   PARDOT-X . . . . . . . . . . .  M335
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    45
0 Defined   Cross-reference of data names   References

0     230   PASS-COUNTER . . . . . . . . .  M329 361 363
       35   PRINT-FILE . . . . . . . . . .  31 317 323
       36   PRINT-REC. . . . . . . . . . .  M337 M413 M415
      184   RE-MARK. . . . . . . . . . . .  M332 M344 M633 M1670 M1846 M1977
      226   REC-CT . . . . . . . . . . . .  334 336 343 M669 M704 M735 M863 M890 M916 M944 M988 M1016 M1046 M1073 M1117 M1144
                                            M1184 M1211 M1252 M1287 M1304 M1321 M1338 M1372 M1378 M1411 M1442 M1532 M1560
                                            M1581 M1934 M1963 M2009 M2040 M2077
      225   REC-SKL-SUB
      234   RECORD-COUNT . . . . . . . . .  M388 389 M397
       54   S-XN-1-1
       44   SPACE-XN-1-1 . . . . . . . . .  742 823 1454 1495
      138   SUB. . . . . . . . . . . . . .  M1740 1742 1744 1745
      185   TEST-COMPUTED. . . . . . . . .  413
      200   TEST-CORRECT . . . . . . . . .  415
      253   TEST-ID. . . . . . . . . . . .  M318
      173   TEST-RESULTS . . . . . . . . .  M319 337
      146   TEST-31-DATA . . . . . . . . .  M1766 1769
      149   TEST-32-DATA . . . . . . . . .  M1793 1796
      155   TEST-34-ANSWER . . . . . . . .  M1870 1877 1887
      152   TEST-34-DATA . . . . . . . . .  M1869 M1872 1877 1886
      161   TEST-35-ANSWER . . . . . . . .  M1898 1906 1916
      158   TEST-35-DATA . . . . . . . . .  M1897 M1900 1906 1915
      164   TEST-38-DATA . . . . . . . . .  M2076 M2079
      167   TEST-39-DATA . . . . . . . . .  M2105 M2107
      170   TEST-40-DATA . . . . . . . . .  M2135 M2137 2145 2155 M2163 M2167 2175 2185 M2195 M2198 2206 2216
      231   TOTAL-ERROR
       69   WC-XN-83 . . . . . . . . . . .  M438 441 M463 466 M488 491 M513 516 M538 541 M564 567 M590 593 M616 617 M663
                                            668 M739 740 M779 780 M820 821 M861 862 M914 915 M982 983 M1040 1045 M1111 1112
                                            M1182 1183 M1250 1251 M1376 1377 M1450 1451 M1491 1492 1496 1507 M1682 1685 M1710
                                            1713 M1824 1825 M1928 1929 M2003 2004
       65   WRK-DS-5V0-1 . . . . . . . . .  M1529 M1534
       39   WRK-DU-999-1 . . . . . . . . .  M439 M441 442 451 M464 M466 467 476 M489 M491 492 501 M514 M516 517 526 M539
                                            M541 543 552 M565 M567 569 578 M591 M593 595 604 M857 M865 874 884 M910 M918
                                            928 938 M978 M990 1000 1010 M1036 M1048 1057 1067 M1107 M1119 1128 1138 M1178
                                            M1186 1195 1205 M1245 M1253 1271 1281 M1372 M1380 1395 1405 M1530 M1535 1544
                                            1554 M1582 M1584 1585 1595 M1605 M1607 1608 1618 M1628 M1630 1631 1641 M1651
                                            M1654 1656 1668 M1683 M1685 1688 1697 M1711 M1713 1716 1725 M1736 M1743 1747
                                            1756 M1764 M1769 1774 1783 M1791 M1796 1802 1811 M1896 M1900 M1924 M1937 1947
                                            1957 M1999 M2012 2024 2034 M2074 M2079 2086 2095 M2104 M2108 2116 2125 M2134
                                            M2165 M2194
       40   WRK-DU-999-2 . . . . . . . . .  M1245 M1254 1288 1298 M1531 1536 1561 1571 M1652 1655 1658 1669
       41   WRK-DU-999-3 . . . . . . . . .  M1245 M1255 1305 1315
       42   WRK-DU-999-4 . . . . . . . . .  M1246 M1256 1322 1332
       66   WRK-NE-1 . . . . . . . . . . .  M1580 1584 M1604 1607
       63   WRK-XN-83-1. . . . . . . . . .  M617 M623 624 634 637 M668 M671 675 M676 688 698 M740 M742 744 753 M780 M783
                                            785 794 M821 M823 825 834 M862 M865 891 901 M915 M918 945 955 M983 M990 1017
                                            1027 M1045 M1048 1074 1084 M1112 M1119 1145 1155 M1183 M1186 1212 1222 M1251
                                            M1253 1339 1349 M1377 M1380 1412 1422 M1451 M1453 1455 1465 M1492 M1494 1496
                                            1506 M1825 M1831 1834 1843 M1929 M1936 1964 1974 M2004 M2011 2041 2051
       64   WRK-XN-83-2. . . . . . . . . .  M675 705 712
      139   WS-BB. . . . . . . . . . . . .  M1767 1771
      142   WS-E . . . . . . . . . . . . .  M2075 2081 2083 2110
      108   WS-RIGHT-1-20. . . . . . . . .  639 714 755 796 836 957 1086 1157 1224 1351 1424 1467 1508 1847 1978 2053
      107   WS-RIGHT-1-83. . . . . . . . .  M635 M638 M713 M754 M795 M835 M956 M1085 M1156 M1223 M1350 M1423 M1466 M1507
                                            M1844 M1975 M2052
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    46
0 Defined   Cross-reference of data names   References

0     109   WS-RIGHT-21-40 . . . . . . . .  642 717 758 799 839 960 1089 1160 1227 1354 1427 1470 1511 1850 1981 2056
      110   WS-RIGHT-41-60 . . . . . . . .  645 720 761 802 842 963 1092 1163 1230 1357 1430 1473 1514 1853 1984 2059
      111   WS-RIGHT-61-80 . . . . . . . .  648 723 764 805 845 966 1095 1166 1233 1360 1433 1476 1517 1856 1987 2062
      112   WS-RIGHT-81-83 . . . . . . . .  651 726 767 808 848 969 1098 1169 1236 1363 1436 1479 1520 1859 1990 2065
      114   WS-WRONG-1-20. . . . . . . . .  640 715 756 797 837 958 1087 1158 1225 1352 1425 1468 1509 1848 1979 2054
      113   WS-WRONG-1-83. . . . . . . . .  M634 M637 M712 M753 M794 M834 M955 M1084 M1155 M1222 M1349 M1422 M1465 M1506
                                            M1843 M1974 M2051
      115   WS-WRONG-21-40 . . . . . . . .  643 718 759 800 840 961 1090 1161 1228 1355 1428 1471 1512 1851 1982 2057
      116   WS-WRONG-41-60 . . . . . . . .  646 721 762 803 843 964 1093 1164 1231 1358 1431 1474 1515 1854 1985 2060
      117   WS-WRONG-61-80 . . . . . . . .  649 724 765 806 846 967 1096 1167 1234 1361 1434 1477 1518 1857 1988 2063
      118   WS-WRONG-81-83 . . . . . . . .  652 727 768 809 849 970 1099 1170 1237 1364 1437 1480 1521 1860 1991 2066
      140   WS-Y . . . . . . . . . . . . .  M1794 1797 1799
      141   WS-3
       61   X-SPACE-X-XN-3 . . . . . . . .  M1627 1630
      145   XN-B . . . . . . . . . . . . .  2199
      143   XN-DF. . . . . . . . . . . . .  M2164 2168
      144   XN-67. . . . . . . . . . . . .  M2196 2199
      302   XXCOMPUTED . . . . . . . . . .  M422
      304   XXCORRECT. . . . . . . . . . .  M422
      297   XXINFO . . . . . . . . . . . .  409 424
       60   YES-XN-3 . . . . . . . . . . .  743 1187
       55   Z-XN-1-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    47
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

      418   BAIL-OUT . . . . . . . . . . .  P340
      426   BAIL-OUT-EX. . . . . . . . . .  E340 G420
      421   BAIL-OUT-WRITE . . . . . . . .  G419
      402   BLANK-LINE-PRINT
     2221   CCVS-EXIT. . . . . . . . . . .  G2204
     2222   CCVS-999999. . . . . . . . . .  G1392
      315   CCVS1
      427   CCVS1-EXIT . . . . . . . . . .  G321
      322   CLOSE-FILES. . . . . . . . . .  G2223
      350   COLUMN-NAMES-ROUTINE . . . . .  E320
      331   DE-LETE. . . . . . . . . . . .  P447 P472 P497 P522 P548 P574 P600 P629 P683 P694 P749 P790 P830 P869 P880 P897
                                            P923 P935 P952 P995 P1007 P1024 P1052 P1064 P1081 P1123 P1135 P1152 P1190 P1202
                                            P1219 P1266 P1277 P1294 P1312 P1328 P1345 P1390 P1401 P1418 P1461 P1502 P1539
                                            P1551 P1568 P1591 P1614 P1637 P1664 P1693 P1721 P1752 P1779 P1807 P1839 P1882
                                            P1911 P1943 P1953 P1970 P2020 P2030 P2047 P2091 P2121 P2141 P2151 P2171 P2181
                                            P2202 P2212
      354   END-ROUTINE. . . . . . . . . .  P323
      358   END-ROUTINE-1
      367   END-ROUTINE-12
      375   END-ROUTINE-13 . . . . . . . .  E323
      356   END-RTN-EXIT
      330   FAIL . . . . . . . . . . . . .  P450 P475 P500 P525 P551 P577 P603 P632 P636 P697 P711 P752 P793 P833 P883 P900
                                            P932 P949 P1004 P1021 P1061 P1078 P1132 P1149 P1199 P1216 P1280 P1297 P1309 P1331
                                            P1348 P1404 P1421 P1464 P1505 P1548 P1565 P1594 P1617 P1640 P1667 P1696 P1724
                                            P1755 P1782 P1810 P1842 P1885 P1914 P1956 P1973 P2033 P2050 P2094 P2124 P2156
                                            P2186 P2217
      404   FAIL-ROUTINE . . . . . . . . .  P339
      417   FAIL-ROUTINE-EX. . . . . . . .  E339 G411
      412   FAIL-ROUTINE-WRITE . . . . . .  G405 G406
      345   HEAD-ROUTINE . . . . . . . . .  P320
      446   INS-DELETE-F1-1
      471   INS-DELETE-F1-2
     1538   INS-DELETE-F1-23
     1550   INS-DELETE-F1-23-1
     1567   INS-DELETE-F1-23-2
     1590   INS-DELETE-F1-24
     1613   INS-DELETE-F1-25
     1636   INS-DELETE-F1-26
     1663   INS-DELETE-F1-27
     1692   INS-DELETE-F1-28
     1720   INS-DELETE-F1-29
      496   INS-DELETE-F1-3
     1751   INS-DELETE-F1-30-1
     1778   INS-DELETE-F1-31-1
     1806   INS-DELETE-F1-32-1
      521   INS-DELETE-F1-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    48
0 Defined   Cross-reference of procedures   References

0     547   INS-DELETE-F1-5
      573   INS-DELETE-F1-6
      599   INS-DELETE-F1-7
      748   INS-DELETE-F2-10
      789   INS-DELETE-F2-11
      829   INS-DELETE-F2-12
     1460   INS-DELETE-F2-21-1
     1501   INS-DELETE-F2-22
     1838   INS-DELETE-F2-33-1
     1881   INS-DELETE-F2-34-1
      628   INS-DELETE-F2-8
      682   INS-DELETE-F2-9
      693   INS-DELETE-F2-9-1
      868   INS-DELETE-F3-13
      879   INS-DELETE-F3-13-1
      896   INS-DELETE-F3-13-2
      922   INS-DELETE-F3-14
      934   INS-DELETE-F3-14-1
      951   INS-DELETE-F3-14-2
      994   INS-DELETE-F3-15
     1006   INS-DELETE-F3-15-1
     1023   INS-DELETE-F3-15-2
     1051   INS-DELETE-F3-16
     1063   INS-DELETE-F3-16-1
     1080   INS-DELETE-F3-16-2
     1122   INS-DELETE-F3-17
     1134   INS-DELETE-F3-17-1
     1151   INS-DELETE-F3-17-2
     1189   INS-DELETE-F3-18
     1201   INS-DELETE-F3-18-1
     1218   INS-DELETE-F3-18-2
     1265   INS-DELETE-F3-19
     1276   INS-DELETE-F3-19-1
     1293   INS-DELETE-F3-19-2
     1311   INS-DELETE-F3-19-3
     1327   INS-DELETE-F3-19-4
     1344   INS-DELETE-F3-19-5
     1389   INS-DELETE-F3-20
     1400   INS-DELETE-F3-20-1
     1417   INS-DELETE-F3-20-2
     1910   INS-DELETE-F3-35-1
     1942   INS-DELETE-F3-36
     1952   INS-DELETE-F3-36-1
     1969   INS-DELETE-F3-36-2
     2019   INS-DELETE-F3-37
     2029   INS-DELETE-F3-37-1
     2046   INS-DELETE-F3-37-2
     2090   INS-DELETE-F3-38
     2120   INS-DELETE-F3-39-1
     2140   INS-DELETE-F4-40
     2150   INS-DELETE-F4-40-1
     2170   INS-DELETE-F4-41
     2180   INS-DELETE-F4-41-1
     2201   INS-DELETE-F4-42
     2211   INS-DELETE-F4-42-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    49
0 Defined   Cross-reference of procedures   References

0     449   INS-FAIL-F1-1. . . . . . . . .  G445
      474   INS-FAIL-F1-2. . . . . . . . .  G470
     1553   INS-FAIL-F1-23-1 . . . . . . .  G1549
     1570   INS-FAIL-F1-23-2 . . . . . . .  G1566
     1593   INS-FAIL-F1-24 . . . . . . . .  G1589
     1616   INS-FAIL-F1-25 . . . . . . . .  G1612
     1639   INS-FAIL-F1-26 . . . . . . . .  G1635
     1666   INS-FAIL-F1-27 . . . . . . . .  G1662
     1695   INS-FAIL-F1-28 . . . . . . . .  G1691
     1723   INS-FAIL-F1-29 . . . . . . . .  G1719
      499   INS-FAIL-F1-3. . . . . . . . .  G495
     1754   INS-FAIL-F1-30-1 . . . . . . .  G1750
     1781   INS-FAIL-F1-31-1 . . . . . . .  G1777
     1809   INS-FAIL-F1-32-1 . . . . . . .  G1805
      524   INS-FAIL-F1-4. . . . . . . . .  G520
      550   INS-FAIL-F1-5. . . . . . . . .  G546
      576   INS-FAIL-F1-6. . . . . . . . .  G572
      602   INS-FAIL-F1-7. . . . . . . . .  G598
      751   INS-FAIL-F2-10 . . . . . . . .  G747
      792   INS-FAIL-F2-11 . . . . . . . .  G788
      832   INS-FAIL-F2-12 . . . . . . . .  G828
     1463   INS-FAIL-F2-21-1 . . . . . . .  G1459
     1504   INS-FAIL-F2-22 . . . . . . . .  G1500
     1841   INS-FAIL-F2-33-1 . . . . . . .  G1837
     1884   INS-FAIL-F2-34-1 . . . . . . .  G1880
      631   INS-FAIL-F2-8. . . . . . . . .  G627
      696   INS-FAIL-F2-9-1. . . . . . . .  G692
      710   INS-FAIL-F2-9-2. . . . . . . .  G709
      882   INS-FAIL-F3-13-1 . . . . . . .  G878
      899   INS-FAIL-F3-13-2 . . . . . . .  G895
      937   INS-FAIL-F3-14-1 . . . . . . .  G933
      954   INS-FAIL-F3-14-2 . . . . . . .  G950
     1009   INS-FAIL-F3-15-1 . . . . . . .  G1005
     1026   INS-FAIL-F3-15-2 . . . . . . .  G1022
     1066   INS-FAIL-F3-16-1 . . . . . . .  G1062
     1083   INS-FAIL-F3-16-2 . . . . . . .  G1079
     1137   INS-FAIL-F3-17-1 . . . . . . .  G1133
     1154   INS-FAIL-F3-17-2 . . . . . . .  G1150
     1204   INS-FAIL-F3-18-1 . . . . . . .  G1200
     1221   INS-FAIL-F3-18-2 . . . . . . .  G1217
     1279   INS-FAIL-F3-19-1 . . . . . . .  G1275
     1296   INS-FAIL-F3-19-2 . . . . . . .  G1292
     1314   INS-FAIL-F3-19-3 . . . . . . .  G1310
     1330   INS-FAIL-F3-19-4 . . . . . . .  G1326
     1347   INS-FAIL-F3-19-5 . . . . . . .  G1343
     1403   INS-FAIL-F3-20-1 . . . . . . .  G1399
     1420   INS-FAIL-F3-20-2 . . . . . . .  G1416
     1913   INS-FAIL-F3-35-1 . . . . . . .  G1909
     1955   INS-FAIL-F3-36-1 . . . . . . .  G1951
     1972   INS-FAIL-F3-36-2 . . . . . . .  G1968
     2032   INS-FAIL-F3-37-1 . . . . . . .  G2028
     2049   INS-FAIL-F3-37-2 . . . . . . .  G2045
     2093   INS-FAIL-F3-38 . . . . . . . .  G2089
     2123   INS-FAIL-F3-39-1 . . . . . . .  G2119
     2153   INS-FAIL-F4-40-1 . . . . . . .  G2149
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    50
0 Defined   Cross-reference of procedures   References

0    2183   INS-FAIL-F4-41-1 . . . . . . .  G2179
     2214   INS-FAIL-F4-42-1 . . . . . . .  G2210
      431   INS-INIT-F1-1
      456   INS-INIT-F1-2
     1525   INS-INIT-F1-23
     1576   INS-INIT-F1-24 . . . . . . . .  G1541
     1600   INS-INIT-F1-25
     1623   INS-INIT-F1-26
     1646   INS-INIT-F1-27
     1674   INS-INIT-F1-28
     1702   INS-INIT-F1-29
      481   INS-INIT-F1-3
     1730   INS-INIT-F1-30
     1761   INS-INIT-F1-31
     1788   INS-INIT-F1-32
      506   INS-INIT-F1-4
      531   INS-INIT-F1-5
      557   INS-INIT-F1-6
      583   INS-INIT-F1-7
      731   INS-INIT-F2-10
      772   INS-INIT-F2-11
      813   INS-INIT-F2-12
     1441   INS-INIT-F2-21
     1484   INS-INIT-F2-22
     1816   INS-INIT-F2-33
     1864   INS-INIT-F2-34
      609   INS-INIT-F2-8
      656   INS-INIT-F2-9
      853   INS-INIT-F3-13
      906   INS-INIT-F3-14 . . . . . . . .  G871
      974   INS-INIT-F3-15 . . . . . . . .  G925
     1032   INS-INIT-F3-16 . . . . . . . .  G997
     1103   INS-INIT-F3-17 . . . . . . . .  G1054
     1174   INS-INIT-F3-18 . . . . . . . .  G1125
     1241   INS-INIT-F3-19 . . . . . . . .  G1192
     1368   INS-INIT-F3-20 . . . . . . . .  G1268
     1891   INS-INIT-F3-35
     1920   INS-INIT-F3-36
     1995   INS-INIT-F3-37 . . . . . . . .  G1945
     2070   INS-INIT-F3-38 . . . . . . . .  G2022
     2100   INS-INIT-F3-39
     2130   INS-INIT-F4-40
     2159   INS-INIT-F4-41 . . . . . . . .  G2143
     2190   INS-INIT-F4-42 . . . . . . . .  G2173
      440   INS-TEST-F1-1
      465   INS-TEST-F1-2
     1533   INS-TEST-F1-23-0
     1543   INS-TEST-F1-23-1 . . . . . . .  G1537
     1559   INS-TEST-F1-23-2
     1583   INS-TEST-F1-24
     1606   INS-TEST-F1-25
     1629   INS-TEST-F1-26
     1653   INS-TEST-F1-27
     1684   INS-TEST-F1-28
     1712   INS-TEST-F1-29
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    51
0 Defined   Cross-reference of procedures   References

0     490   INS-TEST-F1-3
     1741   INS-TEST-F1-30-0
     1746   INS-TEST-F1-30-1
     1768   INS-TEST-F1-31-0
     1773   INS-TEST-F1-31-1
     1795   INS-TEST-F1-32-0
     1801   INS-TEST-F1-32-1
      515   INS-TEST-F1-4
      540   INS-TEST-F1-5
      566   INS-TEST-F1-6
      592   INS-TEST-F1-7
      741   INS-TEST-F2-10 . . . . . . . .  G685
      782   INS-TEST-F2-11
      822   INS-TEST-F2-12
     1452   INS-TEST-F2-21
     1493   INS-TEST-F2-22
     1830   INS-TEST-F2-33-0
     1833   INS-TEST-F2-33-1
     1871   INS-TEST-F2-34-0
     1876   INS-TEST-F2-34-1
      622   INS-TEST-F2-8
      670   INS-TEST-F2-9
      687   INS-TEST-F2-9-1. . . . . . . .  G681
      703   INS-TEST-F2-9-2
      864   INS-TEST-F3-13-0
      873   INS-TEST-F3-13-1 . . . . . . .  G867
      917   INS-TEST-F3-14-0
      927   INS-TEST-F3-14-1 . . . . . . .  G921
      943   INS-TEST-F3-14-2
      989   INS-TEST-F3-15-0
      999   INS-TEST-F3-15-1 . . . . . . .  G993
     1015   INS-TEST-F3-15-2
     1047   INS-TEST-F3-16-0
     1056   INS-TEST-F3-16-1 . . . . . . .  G1050
     1072   INS-TEST-F3-16-2
     1118   INS-TEST-F3-17-0
     1127   INS-TEST-F3-17-1 . . . . . . .  G1121
     1143   INS-TEST-F3-17-2
     1185   INS-TEST-F3-18-0
     1194   INS-TEST-F3-18-1 . . . . . . .  G1188
     1210   INS-TEST-F3-18-2
     1270   INS-TEST-F3-19-1 . . . . . . .  G1264
     1286   INS-TEST-F3-19-2
     1303   INS-TEST-F3-19-3
     1320   INS-TEST-F3-19-4
     1337   INS-TEST-F3-19-5
     1379   INS-TEST-F3-20-0
     1394   INS-TEST-F3-20-1 . . . . . . .  G1388
     1410   INS-TEST-F3-20-2
     1899   INS-TEST-F3-35-0
     1905   INS-TEST-F3-35-1
     1935   INS-TEST-F3-36-0
     1946   INS-TEST-F3-36-1 . . . . . . .  G1941
     1962   INS-TEST-F3-36-2
     2010   INS-TEST-F3-37-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    52
0 Defined   Cross-reference of procedures   References

0    2023   INS-TEST-F3-37-1 . . . . . . .  G2018
     2039   INS-TEST-F3-37-2
     2078   INS-TEST-F3-38-0
     2085   INS-TEST-F3-38-1
     2106   INS-TEST-F3-39-0
     2115   INS-TEST-F3-39-1
     2136   INS-TEST-F4-40-0
     2144   INS-TEST-F4-40-1 . . . . . . .  G2139
     2166   INS-TEST-F4-41-0
     2174   INS-TEST-F4-41-1 . . . . . . .  G2169
     2197   INS-TEST-F4-42-0
     2205   INS-TEST-F4-42-1 . . . . . . .  G2200
      453   INS-WRITE-F1-1 . . . . . . . .  G444 G448
      478   INS-WRITE-F1-2 . . . . . . . .  G469 G473
     1556   INS-WRITE-F1-23-1. . . . . . .  G1546 G1552
     1573   INS-WRITE-F1-23-2. . . . . . .  G1563 G1569
     1597   INS-WRITE-F1-24. . . . . . . .  G1587 G1592
     1620   INS-WRITE-F1-25. . . . . . . .  G1610 G1615
     1643   INS-WRITE-F1-26. . . . . . . .  G1633 G1638
     1671   INS-WRITE-F1-27. . . . . . . .  G1660 G1665
     1699   INS-WRITE-F1-28. . . . . . . .  G1690 G1694
     1727   INS-WRITE-F1-29. . . . . . . .  G1718 G1722
      503   INS-WRITE-F1-3 . . . . . . . .  G494 G498
     1758   INS-WRITE-F1-30-1. . . . . . .  G1749 G1753
     1785   INS-WRITE-F1-31-1. . . . . . .  G1776 G1780
     1813   INS-WRITE-F1-32-1. . . . . . .  G1804 G1808
      528   INS-WRITE-F1-4 . . . . . . . .  G519 G523
      554   INS-WRITE-F1-5 . . . . . . . .  G545 G549
      580   INS-WRITE-F1-6 . . . . . . . .  G571 G575
      606   INS-WRITE-F1-7 . . . . . . . .  G597 G601
      769   INS-WRITE-F2-10. . . . . . . .  G746 G750
      810   INS-WRITE-F2-11. . . . . . . .  G787 G791
      850   INS-WRITE-F2-12. . . . . . . .  G827 G831
     1481   INS-WRITE-F2-21-1. . . . . . .  G1457 G1462
     1522   INS-WRITE-F2-22. . . . . . . .  G1498 G1503
     1861   INS-WRITE-F2-33-1. . . . . . .  G1836 G1840
     1888   INS-WRITE-F2-34-1. . . . . . .  G1879 G1883
      653   INS-WRITE-F2-8 . . . . . . . .  G626 G630
      700   INS-WRITE-F2-9-1 . . . . . . .  G690 G695
      728   INS-WRITE-F2-9-2 . . . . . . .  G707
      886   INS-WRITE-F3-13-1. . . . . . .  G876 G881
      903   INS-WRITE-F3-13-2. . . . . . .  G893 G898
      940   INS-WRITE-F3-14-1. . . . . . .  G930 G936
      971   INS-WRITE-F3-14-2. . . . . . .  G947 G953
     1012   INS-WRITE-F3-15-1. . . . . . .  G1002 G1008
     1029   INS-WRITE-F3-15-2. . . . . . .  G1019 G1025
     1069   INS-WRITE-F3-16-1. . . . . . .  G1059 G1065
     1100   INS-WRITE-F3-16-2. . . . . . .  G1076 G1082
     1140   INS-WRITE-F3-17-1. . . . . . .  G1130 G1136
     1171   INS-WRITE-F3-17-2. . . . . . .  G1147 G1153
     1207   INS-WRITE-F3-18-1. . . . . . .  G1197 G1203
     1238   INS-WRITE-F3-18-2. . . . . . .  G1214 G1220
     1283   INS-WRITE-F3-19-1. . . . . . .  G1273 G1278
     1300   INS-WRITE-F3-19-2. . . . . . .  G1290 G1295
     1317   INS-WRITE-F3-19-3. . . . . . .  G1307 G1313
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    53
0 Defined   Cross-reference of procedures   References

0    1334   INS-WRITE-F3-19-4. . . . . . .  G1324 G1329
     1365   INS-WRITE-F3-19-5. . . . . . .  G1341 G1346
     1407   INS-WRITE-F3-20-1. . . . . . .  G1397 G1402
     1438   INS-WRITE-F3-20-2. . . . . . .  G1414 G1419
     1917   INS-WRITE-F3-35-1. . . . . . .  G1908 G1912
     1959   INS-WRITE-F3-36-1. . . . . . .  G1949 G1954
     1992   INS-WRITE-F3-36-2. . . . . . .  G1966 G1971
     2036   INS-WRITE-F3-37-1. . . . . . .  G2026 G2031
     2067   INS-WRITE-F3-37-2. . . . . . .  G2043 G2048
     2097   INS-WRITE-F3-38. . . . . . . .  G2088 G2092
     2127   INS-WRITE-F3-39-1. . . . . . .  G2118 G2122
     2157   INS-WRITE-F4-40-1. . . . . . .  G2147 G2152
     2187   INS-WRITE-F4-41-1. . . . . . .  G2177 G2182
     2218   INS-WRITE-F4-42-1. . . . . . .  G2208 G2213
      328   INSPT
      316   OPEN-FILES
      329   PASS . . . . . . . . . . . . .  P443 P468 P493 P518 P544 P570 P596 P625 P689 P706 P745 P786 P826 P875 P892 P929
                                            P946 P1001 P1018 P1058 P1075 P1129 P1146 P1196 P1213 P1272 P1289 P1306 P1323
                                            P1340 P1396 P1413 P1456 P1497 P1545 P1562 P1586 P1609 P1632 P1659 P1689 P1717
                                            P1748 P1775 P1803 P1835 P1878 P1907 P1948 P1965 P2025 P2042 P2087 P2117 P2146
                                            P2176 P2207
      333   PRINT-DETAIL . . . . . . . . .  P454 P479 P504 P529 P555 P581 P607 P641 P644 P647 P650 P654 P684 P701 P716 P719
                                            P722 P725 P729 P757 P760 P763 P766 P770 P798 P801 P804 P807 P811 P838 P841 P844
                                            P847 P851 P870 P887 P904 P924 P941 P959 P962 P965 P968 P972 P996 P1013 P1030
                                            P1053 P1070 P1088 P1091 P1094 P1097 P1101 P1124 P1141 P1159 P1162 P1165 P1168
                                            P1172 P1191 P1208 P1226 P1229 P1232 P1235 P1239 P1267 P1284 P1301 P1318 P1335
                                            P1353 P1356 P1359 P1362 P1366 P1391 P1408 P1426 P1429 P1432 P1435 P1439 P1469
                                            P1472 P1475 P1478 P1482 P1510 P1513 P1516 P1519 P1523 P1540 P1557 P1574 P1598
                                            P1621 P1644 P1672 P1700 P1728 P1759 P1786 P1814 P1849 P1852 P1855 P1858 P1862
                                            P1889 P1918 P1944 P1960 P1980 P1983 P1986 P1989 P1993 P2021 P2037 P2055 P2058
                                            P2061 P2064 P2068 P2098 P2128 P2142 P2158 P2172 P2188 P2203 P2219
      429   SECT-NC216A-001
      326   TERMINATE-CALL
      324   TERMINATE-CCVS
      889   TEST-13-2
      387   WRITE-LINE . . . . . . . . . .  P337 P338 P346 P347 P348 P349 P351 P352 P353 P355 P357 P366 P374 P380 P385 P386
                                            P409 P413 P415 P424
      399   WRT-LN . . . . . . . . . . . .  P393 P394 P395 P398 P403
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    54
0 Defined   Cross-reference of programs     References

        3   NC216A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC216A    Date 06/04/2022  Time 12:00:29   Page    55
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC216A:
 *    Source records = 2223
 *    Data Division statements = 142
 *    Procedure Division statements = 1291
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1310
0End of compilation 1,  program NC216A,  highest severity 0.
0Return code 0
