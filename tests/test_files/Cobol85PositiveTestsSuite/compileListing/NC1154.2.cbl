1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:25   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:25   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1154.2
   000002         000200 PROGRAM-ID.                                                      NC1154.2
   000003         000300     NC115A.                                                      NC1154.2
   000004         000500*                                                              *  NC1154.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1154.2
   000006         000700*                                                              *  NC1154.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1154.2
   000008         000900*                                                              *  NC1154.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1154.2
   000010         001100*                                                              *  NC1154.2
   000011         001300*                                                              *  NC1154.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1154.2
   000013         001500*                                                              *  NC1154.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1154.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1154.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1154.2
   000017         001900*                                                              *  NC1154.2
   000018         002100*                                                                 NC1154.2
   000019         002200*    PROGRAM NC115A TESTS FORMATS 1, 2, AND 3 OF                  NC1154.2
   000020         002300*    THE INSPECT STATEMENT.                                       NC1154.2
   000021         002400*                                                                 NC1154.2
   000022         002600 ENVIRONMENT DIVISION.                                            NC1154.2
   000023         002700 CONFIGURATION SECTION.                                           NC1154.2
   000024         002800 SOURCE-COMPUTER.                                                 NC1154.2
   000025         002900     XXXXX082.                                                    NC1154.2
   000026         003000 OBJECT-COMPUTER.                                                 NC1154.2
   000027         003100     XXXXX083.                                                    NC1154.2
   000028         003200 INPUT-OUTPUT SECTION.                                            NC1154.2
   000029         003300 FILE-CONTROL.                                                    NC1154.2
   000030         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1154.2 34
   000031         003500     XXXXX055.                                                    NC1154.2
   000032         003600 DATA DIVISION.                                                   NC1154.2
   000033         003700 FILE SECTION.                                                    NC1154.2
   000034         003800 FD  PRINT-FILE.                                                  NC1154.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003900 01  PRINT-REC PICTURE X(120).                                    NC1154.2
   000036         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1154.2
   000037         004100 WORKING-STORAGE SECTION.                                         NC1154.2
   000038         004200 01  WRK-DU-999-1 PIC 999.                                        NC1154.2
   000039         004300 01  WRK-DU-999-2 PIC 999.                                        NC1154.2
   000040         004400 01  WRK-DU-999-3 PIC 999.                                        NC1154.2
   000041         004500 01  WRK-DU-999-4 PIC 999.                                        NC1154.2
   000042         004600 01  JUST-XN-20-1 PIC X(20) JUSTIFIED.                            NC1154.2
   000043         004700 01  SPACE-XN-1-1 PIC X VALUE SPACE.                              NC1154.2 IMP
   000044         004800 01  COMMA-XN-1-1 PIC X VALUE ",".                                NC1154.2
   000045         004900 01  HYPEN-XN-1-1 PIC X VALUE "-".                                NC1154.2
   000046         005000 01  A-XN-1-1 PIC X VALUE "A".                                    NC1154.2
   000047         005100 01  D-XN-1-1 PIC X VALUE "D".                                    NC1154.2
   000048         005200 01  G-XN-1-1 PIC X VALUE "G".                                    NC1154.2
   000049         005300 01  H-XN-1-1 PIC X VALUE "H".                                    NC1154.2
   000050         005400 01  L-XN-1-1 PIC X VALUE "L".                                    NC1154.2
   000051         005500 01  O-XN-1-1 PIC X VALUE "O".                                    NC1154.2
   000052         005600 01  P-XN-1-1 PIC X VALUE "P".                                    NC1154.2
   000053         005700 01  S-XN-1-1 PIC X VALUE "S".                                    NC1154.2
   000054         005800 01  Z-XN-1-1 PIC X VALUE "Z".                                    NC1154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 01  WRK-OK.                                                      NC1154.2
   000056         006000   03  WRK-OK-1-20                  PIC X(20).                    NC1154.2
   000057         006100   03  WRK-OK-21-40                 PIC X(20).                    NC1154.2
   000058         006200   03  WRK-OK-41-60                 PIC X(20).                    NC1154.2
   000059         006300   03  WRK-OK-61-80                 PIC X(20).                    NC1154.2
   000060         006400   03  WRK-OK-81-83                 PIC X(3).                     NC1154.2
   000061         006500 01  WRK-ER.                                                      NC1154.2
   000062         006600   03  WRK-ER-1-20                  PIC X(20).                    NC1154.2
   000063         006700   03  WRK-ER-21-40                 PIC X(20).                    NC1154.2
   000064         006800   03  WRK-ER-41-60                 PIC X(20).                    NC1154.2
   000065         006900   03  WRK-ER-61-80                 PIC X(20).                    NC1154.2
   000066         007000   03  WRK-ER-81-83                 PIC X(3).                     NC1154.2
   000067         007100                                                                  NC1154.2
   000068         007200 01  WRK-XN-83-1 PIC X(83).                                       NC1154.2
   000069         007300 01  WC-XN-83  PIC X(83) VALUE                                    NC1154.2
   000070         007400     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1154.2
   000071         007500-    "IDS CAN NOT BE ALL BAD.".                                   NC1154.2
   000072         007600 01  ANS-XN-83-1 PIC X(83) VALUE                                  NC1154.2
   000073         007700     "OH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1154.2
   000074         007800-    "IDS CAN NOT BE ALL BAD.".                                   NC1154.2
   000075         007900 01  ANS-XN-83-2 PIC X(83) VALUE                                  NC1154.2
   000076         008000     "AH YES,AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1154.2
   000077         008100-    "IDS CAN NOT BE ALL BAD.".                                   NC1154.2
   000078         008200 01  ANS-XN-83-3 PIC X(83) VALUE                                  NC1154.2
   000079         008300     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1154.2
   000080         008400-    "IDS CAN NOT BE ALL-BAD.".                                   NC1154.2
   000081         008500 01  ANS-XN-83-4 PIC X(83) VALUE                                  NC1154.2
   000082         008600     "EH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1154.2
   000083         008700-    "IDS CAN NOT BE ALL BAD.".                                   NC1154.2
   000084         008800 01  ANS-XN-83-5 PIC X(83) VALUE                                  NC1154.2
   000085         008900     "AH YES OH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1154.2
   000086         009000-    "IDS CAN NOT BE ALL BAD.".                                   NC1154.2
   000087         009100 01  ANS-XN-83-6 PIC X(83) VALUE                                  NC1154.2
   000088         009200     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1154.2
   000089         009300-    "IDS CAN NOT BE ALZZZZZZ".                                   NC1154.2
   000090         009400 01  ANS-XN-83-7 PIC X(83) VALUE                                  NC1154.2
   000091         009500     "OH-YES-AH-YES-W.P.-ZRITOES-HERE.-ANYONE-WHO-HATES-DOGS-AND-KNC1154.2
   000092         009600-    "IDS-CAN-NOT-BE-ALZZZZZZ".                                   NC1154.2
   000093         009700 01  TEST-RESULTS.                                                NC1154.2
   000094         009800     02 FILLER                   PIC X      VALUE SPACE.          NC1154.2 IMP
   000095         009900     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1154.2 IMP
   000096         010000     02 FILLER                   PIC X      VALUE SPACE.          NC1154.2 IMP
   000097         010100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1154.2 IMP
   000098         010200     02 FILLER                   PIC X      VALUE SPACE.          NC1154.2 IMP
   000099         010300     02  PAR-NAME.                                                NC1154.2
   000100         010400       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1154.2 IMP
   000101         010500       03  PARDOT-X              PIC X      VALUE SPACE.          NC1154.2 IMP
   000102         010600       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1154.2 IMP
   000103         010700     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1154.2 IMP
   000104         010800     02 RE-MARK                  PIC X(61).                       NC1154.2
   000105         010900 01  TEST-COMPUTED.                                               NC1154.2
   000106         011000     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1154.2 IMP
   000107         011100     02 FILLER                   PIC X(17)  VALUE                 NC1154.2
   000108         011200            "       COMPUTED=".                                   NC1154.2
   000109         011300     02 COMPUTED-X.                                               NC1154.2
   000110         011400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1154.2 IMP
   000111         011500     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1154.2 110
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600                                 PIC -9(9).9(9).                  NC1154.2
   000113         011700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1154.2 110
   000114         011800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1154.2 110
   000115         011900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1154.2 110
   000116         012000     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1154.2 110
   000117         012100         04 COMPUTED-18V0                    PIC -9(18).          NC1154.2
   000118         012200         04 FILLER                           PIC X.               NC1154.2
   000119         012300     03 FILLER PIC X(50) VALUE SPACE.                             NC1154.2 IMP
   000120         012400 01  TEST-CORRECT.                                                NC1154.2
   000121         012500     02 FILLER PIC X(30) VALUE SPACE.                             NC1154.2 IMP
   000122         012600     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1154.2
   000123         012700     02 CORRECT-X.                                                NC1154.2
   000124         012800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1154.2 IMP
   000125         012900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1154.2 124
   000126         013000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1154.2 124
   000127         013100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1154.2 124
   000128         013200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1154.2 124
   000129         013300     03      CR-18V0 REDEFINES CORRECT-A.                         NC1154.2 124
   000130         013400         04 CORRECT-18V0                     PIC -9(18).          NC1154.2
   000131         013500         04 FILLER                           PIC X.               NC1154.2
   000132         013600     03 FILLER PIC X(2) VALUE SPACE.                              NC1154.2 IMP
   000133         013700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1154.2 IMP
   000134         013800 01  CCVS-C-1.                                                    NC1154.2
   000135         013900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1154.2
   000136         014000-    "SS  PARAGRAPH-NAME                                          NC1154.2
   000137         014100-    "       REMARKS".                                            NC1154.2
   000138         014200     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1154.2 IMP
   000139         014300 01  CCVS-C-2.                                                    NC1154.2
   000140         014400     02 FILLER                     PIC X        VALUE SPACE.      NC1154.2 IMP
   000141         014500     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1154.2
   000142         014600     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1154.2 IMP
   000143         014700     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1154.2
   000144         014800     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1154.2 IMP
   000145         014900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1154.2 IMP
   000146         015000 01  REC-CT                        PIC 99       VALUE ZERO.       NC1154.2 IMP
   000147         015100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1154.2 IMP
   000148         015200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1154.2 IMP
   000149         015300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1154.2 IMP
   000150         015400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1154.2 IMP
   000151         015500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1154.2 IMP
   000152         015600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1154.2 IMP
   000153         015700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1154.2 IMP
   000154         015800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1154.2 IMP
   000155         015900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1154.2 IMP
   000156         016000 01  CCVS-H-1.                                                    NC1154.2
   000157         016100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1154.2 IMP
   000158         016200     02  FILLER                    PIC X(42)    VALUE             NC1154.2
   000159         016300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1154.2
   000160         016400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1154.2 IMP
   000161         016500 01  CCVS-H-2A.                                                   NC1154.2
   000162         016600   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1154.2 IMP
   000163         016700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1154.2
   000164         016800   02  FILLER                        PIC XXXX   VALUE             NC1154.2
   000165         016900     "4.2 ".                                                      NC1154.2
   000166         017000   02  FILLER                        PIC X(28)  VALUE             NC1154.2
   000167         017100            " COPY - NOT FOR DISTRIBUTION".                       NC1154.2
   000168         017200   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1154.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300                                                                  NC1154.2
   000170         017400 01  CCVS-H-2B.                                                   NC1154.2
   000171         017500   02  FILLER                        PIC X(15)  VALUE             NC1154.2
   000172         017600            "TEST RESULT OF ".                                    NC1154.2
   000173         017700   02  TEST-ID                       PIC X(9).                    NC1154.2
   000174         017800   02  FILLER                        PIC X(4)   VALUE             NC1154.2
   000175         017900            " IN ".                                               NC1154.2
   000176         018000   02  FILLER                        PIC X(12)  VALUE             NC1154.2
   000177         018100     " HIGH       ".                                              NC1154.2
   000178         018200   02  FILLER                        PIC X(22)  VALUE             NC1154.2
   000179         018300            " LEVEL VALIDATION FOR ".                             NC1154.2
   000180         018400   02  FILLER                        PIC X(58)  VALUE             NC1154.2
   000181         018500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1154.2
   000182         018600 01  CCVS-H-3.                                                    NC1154.2
   000183         018700     02  FILLER                      PIC X(34)  VALUE             NC1154.2
   000184         018800            " FOR OFFICIAL USE ONLY    ".                         NC1154.2
   000185         018900     02  FILLER                      PIC X(58)  VALUE             NC1154.2
   000186         019000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1154.2
   000187         019100     02  FILLER                      PIC X(28)  VALUE             NC1154.2
   000188         019200            "  COPYRIGHT   1985 ".                                NC1154.2
   000189         019300 01  CCVS-E-1.                                                    NC1154.2
   000190         019400     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1154.2 IMP
   000191         019500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1154.2
   000192         019600     02 ID-AGAIN                     PIC X(9).                    NC1154.2
   000193         019700     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1154.2 IMP
   000194         019800 01  CCVS-E-2.                                                    NC1154.2
   000195         019900     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1154.2 IMP
   000196         020000     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1154.2 IMP
   000197         020100     02 CCVS-E-2-2.                                               NC1154.2
   000198         020200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1154.2 IMP
   000199         020300         03 FILLER                   PIC X      VALUE SPACE.      NC1154.2 IMP
   000200         020400         03 ENDER-DESC               PIC X(44)  VALUE             NC1154.2
   000201         020500            "ERRORS ENCOUNTERED".                                 NC1154.2
   000202         020600 01  CCVS-E-3.                                                    NC1154.2
   000203         020700     02  FILLER                      PIC X(22)  VALUE             NC1154.2
   000204         020800            " FOR OFFICIAL USE ONLY".                             NC1154.2
   000205         020900     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1154.2 IMP
   000206         021000     02  FILLER                      PIC X(58)  VALUE             NC1154.2
   000207         021100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1154.2
   000208         021200     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1154.2 IMP
   000209         021300     02 FILLER                       PIC X(15)  VALUE             NC1154.2
   000210         021400             " COPYRIGHT 1985".                                   NC1154.2
   000211         021500 01  CCVS-E-4.                                                    NC1154.2
   000212         021600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1154.2 IMP
   000213         021700     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1154.2
   000214         021800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1154.2 IMP
   000215         021900     02 FILLER                       PIC X(40)  VALUE             NC1154.2
   000216         022000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1154.2
   000217         022100 01  XXINFO.                                                      NC1154.2
   000218         022200     02 FILLER                       PIC X(19)  VALUE             NC1154.2
   000219         022300            "*** INFORMATION ***".                                NC1154.2
   000220         022400     02 INFO-TEXT.                                                NC1154.2
   000221         022500       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1154.2 IMP
   000222         022600       04 XXCOMPUTED                 PIC X(20).                   NC1154.2
   000223         022700       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1154.2 IMP
   000224         022800       04 XXCORRECT                  PIC X(20).                   NC1154.2
   000225         022900     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 01  HYPHEN-LINE.                                                 NC1154.2
   000227         023100     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1154.2 IMP
   000228         023200     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1154.2
   000229         023300-    "*****************************************".                 NC1154.2
   000230         023400     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1154.2
   000231         023500-    "******************************".                            NC1154.2
   000232         023600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1154.2
   000233         023700     "NC115A".                                                    NC1154.2
   000234         023800 PROCEDURE DIVISION.                                              NC1154.2
   000235         023900 CCVS1 SECTION.                                                   NC1154.2
   000236         024000 OPEN-FILES.                                                      NC1154.2
   000237         024100     OPEN     OUTPUT PRINT-FILE.                                  NC1154.2 34
   000238         024200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1154.2 232 173 232 192
   000239         024300     MOVE    SPACE TO TEST-RESULTS.                               NC1154.2 IMP 93
   000240         024400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1154.2 265 270
   000241         024500     GO TO CCVS1-EXIT.                                            NC1154.2 352
   000242         024600 CLOSE-FILES.                                                     NC1154.2
   000243         024700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1154.2 274 295 34
   000244         024800 TERMINATE-CCVS.                                                  NC1154.2
   000245         024900     EXIT PROGRAM.                                                NC1154.2
   000246         025000 TERMINATE-CALL.                                                  NC1154.2
   000247         025100     STOP     RUN.                                                NC1154.2
   000248         025200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1154.2 97 149
   000249         025300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1154.2 97 150
   000250         025400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1154.2 97 148
   000251         025500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1154.2 97 147
   000252         025600     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1154.2 104
   000253         025700 PRINT-DETAIL.                                                    NC1154.2
   000254         025800     IF REC-CT NOT EQUAL TO ZERO                                  NC1154.2 146 IMP
   000255      1  025900             MOVE "." TO PARDOT-X                                 NC1154.2 101
   000256      1  026000             MOVE REC-CT TO DOTVALUE.                             NC1154.2 146 102
   000257         026100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1154.2 93 35 307
   000258         026200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1154.2 97 307
   000259      1  026300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1154.2 328 342
   000260      1  026400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1154.2 343 351
   000261         026500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1154.2 IMP 97 IMP 109
   000262         026600     MOVE SPACE TO CORRECT-X.                                     NC1154.2 IMP 123
   000263         026700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1154.2 146 IMP IMP 99
   000264         026800     MOVE     SPACE TO RE-MARK.                                   NC1154.2 IMP 104
   000265         026900 HEAD-ROUTINE.                                                    NC1154.2
   000266         027000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1154.2 156 36 307
   000267         027100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1154.2 161 36 307
   000268         027200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1154.2 170 36 307
   000269         027300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1154.2 182 36 307
   000270         027400 COLUMN-NAMES-ROUTINE.                                            NC1154.2
   000271         027500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1154.2 134 36 307
   000272         027600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1154.2 139 36 307
   000273         027700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1154.2 226 36 307
   000274         027800 END-ROUTINE.                                                     NC1154.2
   000275         027900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1154.2 226 36 307
   000276         028000 END-RTN-EXIT.                                                    NC1154.2
   000277         028100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1154.2 189 36 307
   000278         028200 END-ROUTINE-1.                                                   NC1154.2
   000279         028300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1154.2 148 152 149
   000280         028400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1154.2 152 147 152
   000281         028500      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1154.2 150 152
   000282         028600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1154.2 150 212
   000284         028800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1154.2 152 214
   000285         028900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1154.2 211 197
   000286         029000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1154.2 194 36 307
   000287         029100  END-ROUTINE-12.                                                 NC1154.2
   000288         029200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1154.2 200
   000289         029300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1154.2 148 IMP
   000290      1  029400         MOVE "NO " TO ERROR-TOTAL                                NC1154.2 198
   000291         029500         ELSE                                                     NC1154.2
   000292      1  029600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1154.2 148 198
   000293         029700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1154.2 194 36
   000294         029800     PERFORM WRITE-LINE.                                          NC1154.2 307
   000295         029900 END-ROUTINE-13.                                                  NC1154.2
   000296         030000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1154.2 147 IMP
   000297      1  030100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1154.2 198
   000298      1  030200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1154.2 147 198
   000299         030300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1154.2 200
   000300         030400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1154.2 194 36 307
   000301         030500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1154.2 149 IMP
   000302      1  030600          MOVE "NO " TO ERROR-TOTAL                               NC1154.2 198
   000303      1  030700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1154.2 149 198
   000304         030800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1154.2 200
   000305         030900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1154.2 194 36 307
   000306         031000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1154.2 202 36 307
   000307         031100 WRITE-LINE.                                                      NC1154.2
   000308         031200     ADD 1 TO RECORD-COUNT.                                       NC1154.2 154
   000309         031300     IF RECORD-COUNT GREATER 42                                   NC1154.2 154
   000310      1  031400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1154.2 36 153
   000311      1  031500         MOVE SPACE TO DUMMY-RECORD                               NC1154.2 IMP 36
   000312      1  031600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1154.2 36
   000313      1  031700         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1154.2 156 36 323
   000314      1  031800         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1154.2 161 36 323
   000315      1  031900         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1154.2 170 36 323
   000316      1  032000         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1154.2 182 36 323
   000317      1  032100         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1154.2 134 36 323
   000318      1  032200         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1154.2 139 36 323
   000319      1  032300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1154.2 226 36 323
   000320      1  032400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1154.2 153 36
   000321      1  032500         MOVE ZERO TO RECORD-COUNT.                               NC1154.2 IMP 154
   000322         032600     PERFORM WRT-LN.                                              NC1154.2 323
   000323         032700 WRT-LN.                                                          NC1154.2
   000324         032800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1154.2 36
   000325         032900     MOVE SPACE TO DUMMY-RECORD.                                  NC1154.2 IMP 36
   000326         033000 BLANK-LINE-PRINT.                                                NC1154.2
   000327         033100     PERFORM WRT-LN.                                              NC1154.2 323
   000328         033200 FAIL-ROUTINE.                                                    NC1154.2
   000329         033300     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1154.2 109 IMP
   000330      1  033400            GO TO FAIL-ROUTINE-WRITE.                             NC1154.2 337
   000331         033500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1154.2 123 IMP 337
   000332         033600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1154.2 155 225
   000333         033700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1154.2 220
   000334         033800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1154.2 217 36 307
   000335         033900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1154.2 IMP 225
   000336         034000     GO TO  FAIL-ROUTINE-EX.                                      NC1154.2 342
   000337         034100 FAIL-ROUTINE-WRITE.                                              NC1154.2
   000338         034200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1154.2 105 35 307
   000339         034300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1154.2 155 133
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1154.2 120 35 307
   000341         034500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1154.2 IMP 133
   000342         034600 FAIL-ROUTINE-EX. EXIT.                                           NC1154.2
   000343         034700 BAIL-OUT.                                                        NC1154.2
   000344         034800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1154.2 110 IMP 346
   000345         034900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1154.2 124 IMP 351
   000346         035000 BAIL-OUT-WRITE.                                                  NC1154.2
   000347         035100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1154.2 124 224 110 222
   000348         035200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1154.2 155 225
   000349         035300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1154.2 217 36 307
   000350         035400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1154.2 IMP 225
   000351         035500 BAIL-OUT-EX. EXIT.                                               NC1154.2
   000352         035600 CCVS1-EXIT.                                                      NC1154.2
   000353         035700     EXIT.                                                        NC1154.2
   000354         035800 SECT-NC115A-001 SECTION.                                         NC1154.2
   000355         035900 INSP-INIT-F1-1.                                                  NC1154.2
   000356         036000     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000357         036100     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000358         036200 INSP-TEST-F1-1-0.                                                NC1154.2
   000359         036300     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR CHARACTERS.       NC1154.2 69 38
   000360         036400 INSP-TEST-F1-1-1.                                                NC1154.2
   000361         036500     IF      WRK-DU-999-1 EQUAL TO 83                             NC1154.2 38
   000362      1  036600     PERFORM PASS                                                 NC1154.2 249
   000363      1  036700     GO      TO INSP-WRITE-F1-1.                                  NC1154.2 372
   000364         036800     GO TO INSP-FAIL-F1-1.                                        NC1154.2 368
   000365         036900 INSP-DELETE-F1-1.                                                NC1154.2
   000366         037000     PERFORM DE-LETE.                                             NC1154.2 251
   000367         037100     GO TO INSP-WRITE-F1-1.                                       NC1154.2 372
   000368         037200 INSP-FAIL-F1-1.                                                  NC1154.2
   000369         037300     PERFORM FAIL.                                                NC1154.2 250
   000370         037400     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC1154.2 38 111
   000371         037500     MOVE 83 TO CORRECT-N.                                        NC1154.2 125
   000372         037600 INSP-WRITE-F1-1.                                                 NC1154.2
   000373         037700     MOVE "INSP-TEST-F1-1" TO PAR-NAME.                           NC1154.2 99
   000374         037800     MOVE "TALLY FOR CHARACTERS" TO FEATURE.                      NC1154.2 95
   000375         037900     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000376         038000 INSP-INIT-F1-2.                                                  NC1154.2
   000377         038100     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000378         038200     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000379         038300 INSP-TEST-F1-2-0.                                                NC1154.2
   000380         038400     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR ALL "A".          NC1154.2 69 38
   000381         038500 INSP-TEST-F1-2-1.                                                NC1154.2
   000382         038600     IF      WRK-DU-999-1 EQUAL TO 8                              NC1154.2 38
   000383      1  038700     PERFORM PASS                                                 NC1154.2 249
   000384      1  038800     GO      TO INSP-WRITE-F1-2.                                  NC1154.2 393
   000385         038900     GO TO INSP-FAIL-F1-2.                                        NC1154.2 389
   000386         039000 INSP-DELETE-F1-2.                                                NC1154.2
   000387         039100     PERFORM DE-LETE.                                             NC1154.2 251
   000388         039200     GO TO INSP-WRITE-F1-2.                                       NC1154.2 393
   000389         039300 INSP-FAIL-F1-2.                                                  NC1154.2
   000390         039400     PERFORM FAIL.                                                NC1154.2 250
   000391         039500     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC1154.2 38 111
   000392         039600     MOVE 8 TO CORRECT-N.                                         NC1154.2 125
   000393         039700 INSP-WRITE-F1-2.                                                 NC1154.2
   000394         039800     MOVE "INSP-TEST-F1-2" TO PAR-NAME.                           NC1154.2 99
   000395         039900     MOVE "TALLY ALL LITERAL" TO FEATURE.                         NC1154.2 95
   000396         040000     PERFORM PRINT-DETAIL.                                        NC1154.2 253
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100 INSP-INIT-F1-3.                                                  NC1154.2
   000398         040200     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000399         040300     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000400         040400 INSP-TEST-F1-3-0.                                                NC1154.2
   000401         040500     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR ALL SPACE.        NC1154.2 69 38 IMP
   000402         040600 INSP-TEST-F1-3-1.                                                NC1154.2
   000403         040700     IF      WRK-DU-999-1 EQUAL TO 17                             NC1154.2 38
   000404      1  040800     PERFORM PASS                                                 NC1154.2 249
   000405      1  040900     GO      TO INSP-WRITE-F1-3.                                  NC1154.2 414
   000406         041000     GO TO INSP-FAIL-F1-3.                                        NC1154.2 410
   000407         041100 INSP-DELETE-F1-3.                                                NC1154.2
   000408         041200     PERFORM DE-LETE.                                             NC1154.2 251
   000409         041300     GO TO INSP-WRITE-F1-3.                                       NC1154.2 414
   000410         041400 INSP-FAIL-F1-3.                                                  NC1154.2
   000411         041500     PERFORM FAIL.                                                NC1154.2 250
   000412         041600     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC1154.2 38 111
   000413         041700     MOVE 17 TO CORRECT-N.                                        NC1154.2 125
   000414         041800 INSP-WRITE-F1-3.                                                 NC1154.2
   000415         041900     MOVE "INSP-TEST-F1-3" TO PAR-NAME.                           NC1154.2 99
   000416         042000     MOVE "TALLY FOR ALL SPACE" TO FEATURE.                       NC1154.2 95
   000417         042100     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000418         042200 INSP-INIT-F1-4.                                                  NC1154.2
   000419         042300     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000420         042400     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000421         042500 INSP-TEST-F1-4-0.                                                NC1154.2
   000422         042600     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR LEADING "A".      NC1154.2 69 38
   000423         042700 INSP-TEST-F1-4-1.                                                NC1154.2
   000424         042800     IF      WRK-DU-999-1 EQUAL TO 1                              NC1154.2 38
   000425      1  042900     PERFORM PASS                                                 NC1154.2 249
   000426      1  043000     GO      TO INSP-WRITE-F1-4.                                  NC1154.2 435
   000427         043100     GO TO INSP-FAIL-F1-4.                                        NC1154.2 431
   000428         043200 INSP-DELETE-F1-4.                                                NC1154.2
   000429         043300     PERFORM DE-LETE.                                             NC1154.2 251
   000430         043400     GO TO INSP-WRITE-F1-4.                                       NC1154.2 435
   000431         043500 INSP-FAIL-F1-4.                                                  NC1154.2
   000432         043600     PERFORM FAIL.                                                NC1154.2 250
   000433         043700     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC1154.2 38 111
   000434         043800     MOVE 1 TO CORRECT-N.                                         NC1154.2 125
   000435         043900 INSP-WRITE-F1-4.                                                 NC1154.2
   000436         044000     MOVE "INSP-TEST-F1-4" TO PAR-NAME.                           NC1154.2 99
   000437         044100     MOVE "TALLY LEADING LIT" TO FEATURE.                         NC1154.2 95
   000438         044200     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000439         044300 INSP-INIT-F1-5.                                                  NC1154.2
   000440         044400     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000441         044500     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000442         044600 INSP-TEST-F1-5-0.                                                NC1154.2
   000443         044700     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR CHARACTERS        NC1154.2 69 38
   000444         044800         AFTER "W".                                               NC1154.2
   000445         044900 INSP-TEST-F1-5-1.                                                NC1154.2
   000446         045000     IF      WRK-DU-999-1 EQUAL TO 68                             NC1154.2 38
   000447      1  045100     PERFORM PASS                                                 NC1154.2 249
   000448      1  045200     GO      TO INSP-WRITE-F1-5.                                  NC1154.2 457
   000449         045300     GO TO INSP-FAIL-F1-5.                                        NC1154.2 453
   000450         045400 INSP-DELETE-F1-5.                                                NC1154.2
   000451         045500     PERFORM DE-LETE.                                             NC1154.2 251
   000452         045600     GO TO INSP-WRITE-F1-5.                                       NC1154.2 457
   000453         045700 INSP-FAIL-F1-5.                                                  NC1154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     PERFORM FAIL.                                                NC1154.2 250
   000455         045900     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC1154.2 38 111
   000456         046000     MOVE 68 TO CORRECT-N.                                        NC1154.2 125
   000457         046100 INSP-WRITE-F1-5.                                                 NC1154.2
   000458         046200     MOVE "INSP-TEST-F1-5" TO PAR-NAME.                           NC1154.2 99
   000459         046300     MOVE "FOR CHARS AFTER LIT" TO FEATURE.                       NC1154.2 95
   000460         046400     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000461         046500 INSP-INIT-F1-6.                                                  NC1154.2
   000462         046600     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000463         046700     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000464         046800 INSP-TEST-F1-6-0.                                                NC1154.2
   000465         046900     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR ALL " "           NC1154.2 69 38
   000466         047000         BEFORE INITIAL "W".                                      NC1154.2
   000467         047100 INSP-TEST-F1-6-1.                                                NC1154.2
   000468         047200     IF      WRK-DU-999-1 EQUAL TO 4                              NC1154.2 38
   000469      1  047300     PERFORM PASS                                                 NC1154.2 249
   000470      1  047400     GO      TO INSP-WRITE-F1-6.                                  NC1154.2 479
   000471         047500     GO TO INSP-FAIL-F1-6.                                        NC1154.2 475
   000472         047600 INSP-DELETE-F1-6.                                                NC1154.2
   000473         047700     PERFORM DE-LETE.                                             NC1154.2 251
   000474         047800     GO TO INSP-WRITE-F1-6.                                       NC1154.2 479
   000475         047900 INSP-FAIL-F1-6.                                                  NC1154.2
   000476         048000     PERFORM FAIL.                                                NC1154.2 250
   000477         048100     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC1154.2 38 111
   000478         048200     MOVE 4 TO CORRECT-N.                                         NC1154.2 125
   000479         048300 INSP-WRITE-F1-6.                                                 NC1154.2
   000480         048400     MOVE "INSP-TEST-F1-6" TO PAR-NAME.                           NC1154.2 99
   000481         048500     MOVE "ALL BEFORE INITIAL" TO FEATURE.                        NC1154.2 95
   000482         048600     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000483         048700 INSP-INIT-F1-7.                                                  NC1154.2
   000484         048800     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000485         048900     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000486         049000 INSP-TEST-F1-7-0.                                                NC1154.2
   000487         049100     INSPECT WC-XN-83 TALLYING WRK-DU-999-1 FOR LEADING "Y"       NC1154.2 69 38
   000488         049200         AFTER INITIAL SPACE.                                     NC1154.2 IMP
   000489         049300 INSP-TEST-F1-7-1.                                                NC1154.2
   000490         049400     IF      WRK-DU-999-1 EQUAL TO 1                              NC1154.2 38
   000491      1  049500     PERFORM PASS                                                 NC1154.2 249
   000492      1  049600     GO      TO INSP-WRITE-F1-7.                                  NC1154.2 501
   000493         049700     GO TO INSP-FAIL-F1-7.                                        NC1154.2 497
   000494         049800 INSP-DELETE-F1-7.                                                NC1154.2
   000495         049900     PERFORM DE-LETE.                                             NC1154.2 251
   000496         050000     GO TO INSP-WRITE-F1-7.                                       NC1154.2 501
   000497         050100 INSP-FAIL-F1-7.                                                  NC1154.2
   000498         050200     PERFORM FAIL.                                                NC1154.2 250
   000499         050300     MOVE WRK-DU-999-1 TO COMPUTED-N.                             NC1154.2 38 111
   000500         050400     MOVE 1 TO CORRECT-N.                                         NC1154.2 125
   000501         050500 INSP-WRITE-F1-7.                                                 NC1154.2
   000502         050600     MOVE "INSP-TEST-F1-7" TO PAR-NAME.                           NC1154.2 99
   000503         050700     MOVE "LEAD LIT INITIAL FIG" TO FEATURE.                      NC1154.2 95
   000504         050800     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000505         050900 INSP-INIT-F2-1.                                                  NC1154.2
   000506         051000     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000507         051100     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000508         051200     MOVE "INSP-TEST-F2-1" TO PAR-NAME.                           NC1154.2 99
   000509         051300     MOVE "REP CHARS BY SPACE" TO FEATURE.                        NC1154.2 95
   000510         051400 INSP-TEST-F2-1-0.                                                NC1154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     INSPECT WRK-XN-83-1 REPLACING CHARACTERS BY SPACE.           NC1154.2 68 IMP
   000512         051600 INSP-TEST-F2-1-1.                                                NC1154.2
   000513         051700     IF      WRK-XN-83-1 EQUAL TO SPACE                           NC1154.2 68 IMP
   000514      1  051800             PERFORM PASS                                         NC1154.2 249
   000515      1  051900             PERFORM PRINT-DETAIL                                 NC1154.2 253
   000516      1  052000             GO      TO INSP-INIT-F2-2.                           NC1154.2 541
   000517         052100     GO TO INSP-FAIL-F2-1.                                        NC1154.2 522
   000518         052200 INSP-DELETE-F2-1.                                                NC1154.2
   000519         052300     PERFORM DE-LETE.                                             NC1154.2 251
   000520         052400     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000521         052500     GO TO INSP-INIT-F2-2.                                        NC1154.2 541
   000522         052600 INSP-FAIL-F2-1.                                                  NC1154.2
   000523         052700     PERFORM FAIL.                                                NC1154.2 250
   000524         052800     MOVE    WRK-XN-83-1 TO WRK-ER.                               NC1154.2 68 61
   000525         052900     MOVE    SPACE TO WRK-OK.                                     NC1154.2 IMP 55
   000526         053000     MOVE    WRK-OK-1-20 TO CORRECT-X.                            NC1154.2 56 123
   000527         053100     MOVE    WRK-ER-1-20 TO COMPUTED-X.                           NC1154.2 62 109
   000528         053200     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000529         053300     MOVE    WRK-OK-21-40 TO CORRECT-X.                           NC1154.2 57 123
   000530         053400     MOVE    WRK-ER-21-40 TO COMPUTED-X.                          NC1154.2 63 109
   000531         053500     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000532         053600     MOVE    WRK-OK-41-60 TO CORRECT-X.                           NC1154.2 58 123
   000533         053700     MOVE    WRK-ER-41-60 TO COMPUTED-X.                          NC1154.2 64 109
   000534         053800     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000535         053900     MOVE    WRK-OK-61-80 TO CORRECT-X.                           NC1154.2 59 123
   000536         054000     MOVE    WRK-ER-61-80 TO COMPUTED-X.                          NC1154.2 65 109
   000537         054100     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000538         054200     MOVE    WRK-OK-81-83 TO CORRECT-X.                           NC1154.2 60 123
   000539         054300     MOVE    WRK-ER-81-83 TO COMPUTED-X.                          NC1154.2 66 109
   000540         054400     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000541         054500 INSP-INIT-F2-2.                                                  NC1154.2
   000542         054600     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000543         054700     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000544         054800     MOVE "INSP-TEST-F2-2" TO PAR-NAME.                           NC1154.2 99
   000545         054900     MOVE "CHARS BEFORE INITIAL" TO FEATURE.                      NC1154.2 95
   000546         055000 INSP-TEST-F2-2-0.                                                NC1154.2
   000547         055100     INSPECT WRK-XN-83-1 REPLACING CHARACTERS BY "O"              NC1154.2 68
   000548         055200         BEFORE INITIAL "H".                                      NC1154.2
   000549         055300 INSP-TEST-F2-2-1.                                                NC1154.2
   000550         055400     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-1                     NC1154.2 68 72
   000551      1  055500             PERFORM PASS                                         NC1154.2 249
   000552      1  055600             PERFORM PRINT-DETAIL                                 NC1154.2 253
   000553      1  055700             GO      TO INSP-INIT-F2-3.                           NC1154.2 578
   000554         055800     GO TO INSP-FAIL-F2-2.                                        NC1154.2 559
   000555         055900 INSP-DELETE-F2-2.                                                NC1154.2
   000556         056000     PERFORM DE-LETE.                                             NC1154.2 251
   000557         056100     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000558         056200     GO TO INSP-INIT-F2-3.                                        NC1154.2 578
   000559         056300 INSP-FAIL-F2-2.                                                  NC1154.2
   000560         056400     PERFORM FAIL.                                                NC1154.2 250
   000561         056500     MOVE    WRK-XN-83-1 TO WRK-ER.                               NC1154.2 68 61
   000562         056600     MOVE    ANS-XN-83-1 TO WRK-OK.                               NC1154.2 72 55
   000563         056700     MOVE    WRK-OK-1-20 TO CORRECT-X.                            NC1154.2 56 123
   000564         056800     MOVE    WRK-ER-1-20 TO COMPUTED-X.                           NC1154.2 62 109
   000565         056900     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000566         057000     MOVE    WRK-OK-21-40 TO CORRECT-X.                           NC1154.2 57 123
   000567         057100     MOVE    WRK-ER-21-40 TO COMPUTED-X.                          NC1154.2 63 109
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000569         057300     MOVE    WRK-OK-41-60 TO CORRECT-X.                           NC1154.2 58 123
   000570         057400     MOVE    WRK-ER-41-60 TO COMPUTED-X.                          NC1154.2 64 109
   000571         057500     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000572         057600     MOVE    WRK-OK-61-80 TO CORRECT-X.                           NC1154.2 59 123
   000573         057700     MOVE    WRK-ER-61-80 TO COMPUTED-X.                          NC1154.2 65 109
   000574         057800     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000575         057900     MOVE    WRK-OK-81-83 TO CORRECT-X.                           NC1154.2 60 123
   000576         058000     MOVE    WRK-ER-81-83 TO COMPUTED-X.                          NC1154.2 66 109
   000577         058100     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000578         058200 INSP-INIT-F2-3.                                                  NC1154.2
   000579         058300     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000580         058400     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000581         058500     MOVE "INSP-TEST-F2-3" TO PAR-NAME.                           NC1154.2 99
   000582         058600     MOVE "LEAD AFTER INIT ID" TO FEATURE.                        NC1154.2 95
   000583         058700 INSP-TEST-F2-3-0.                                                NC1154.2
   000584         058800     INSPECT WRK-XN-83-1 REPLACING LEADING SPACE-XN-1-1           NC1154.2 68 43
   000585         058900         BY COMMA-XN-1-1 AFTER INITIAL S-XN-1-1.                  NC1154.2 44 53
   000586         059000 INSP-TEST-F2-3-1.                                                NC1154.2
   000587         059100     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-2                     NC1154.2 68 75
   000588      1  059200             PERFORM PASS                                         NC1154.2 249
   000589      1  059300             PERFORM PRINT-DETAIL                                 NC1154.2 253
   000590      1  059400             GO TO INSP-INIT-F2-4.                                NC1154.2 615
   000591         059500     GO TO INSP-FAIL-F2-3.                                        NC1154.2 596
   000592         059600 INSP-DELETE-F2-3.                                                NC1154.2
   000593         059700     PERFORM DE-LETE.                                             NC1154.2 251
   000594         059800     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000595         059900     GO TO INSP-INIT-F2-4.                                        NC1154.2 615
   000596         060000 INSP-FAIL-F2-3.                                                  NC1154.2
   000597         060100     PERFORM FAIL.                                                NC1154.2 250
   000598         060200     MOVE    WRK-XN-83-1 TO WRK-ER.                               NC1154.2 68 61
   000599         060300     MOVE    ANS-XN-83-2 TO WRK-OK.                               NC1154.2 75 55
   000600         060400     MOVE    WRK-OK-1-20 TO CORRECT-X.                            NC1154.2 56 123
   000601         060500     MOVE    WRK-ER-1-20 TO COMPUTED-X.                           NC1154.2 62 109
   000602         060600     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000603         060700     MOVE    WRK-OK-21-40 TO CORRECT-X.                           NC1154.2 57 123
   000604         060800     MOVE    WRK-ER-21-40 TO COMPUTED-X.                          NC1154.2 63 109
   000605         060900     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000606         061000     MOVE    WRK-OK-41-60 TO CORRECT-X.                           NC1154.2 58 123
   000607         061100     MOVE    WRK-ER-41-60 TO COMPUTED-X.                          NC1154.2 64 109
   000608         061200     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000609         061300     MOVE    WRK-OK-61-80 TO CORRECT-X.                           NC1154.2 59 123
   000610         061400     MOVE    WRK-ER-61-80 TO COMPUTED-X.                          NC1154.2 65 109
   000611         061500     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000612         061600     MOVE    WRK-OK-81-83 TO CORRECT-X.                           NC1154.2 60 123
   000613         061700     MOVE    WRK-ER-81-83 TO COMPUTED-X.                          NC1154.2 66 109
   000614         061800     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000615         061900 INSP-INIT-F2-4.                                                  NC1154.2
   000616         062000     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000617         062100     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000618         062200     MOVE "INSP-TEST-F2-4" TO PAR-NAME.                           NC1154.2 99
   000619         062300     MOVE "FIRST BY ID BEFORE" TO FEATURE.                        NC1154.2 95
   000620         062400 INSP-TEST-F2-4-0.                                                NC1154.2
   000621         062500     INSPECT WRK-XN-83-1 REPLACING FIRST "A" BY O-XN-1-1          NC1154.2 68 51
   000622         062600         BEFORE INITIAL "H".                                      NC1154.2
   000623         062700 INSP-TEST-F2-4-1.                                                NC1154.2
   000624         062800     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-1                     NC1154.2 68 72
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  062900             PERFORM PASS                                         NC1154.2 249
   000626      1  063000             PERFORM PRINT-DETAIL                                 NC1154.2 253
   000627      1  063100             GO      TO INSP-INIT-F2-5.                           NC1154.2 652
   000628         063200     GO TO INSP-FAIL-F2-4.                                        NC1154.2 633
   000629         063300 INSP-DELETE-F2-4.                                                NC1154.2
   000630         063400     PERFORM DE-LETE.                                             NC1154.2 251
   000631         063500     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000632         063600     GO TO INSP-INIT-F2-5.                                        NC1154.2 652
   000633         063700 INSP-FAIL-F2-4.                                                  NC1154.2
   000634         063800     PERFORM FAIL.                                                NC1154.2 250
   000635         063900     MOVE    WRK-XN-83-1 TO WRK-ER.                               NC1154.2 68 61
   000636         064000     MOVE    ANS-XN-83-1 TO WRK-OK.                               NC1154.2 72 55
   000637         064100     MOVE    WRK-OK-1-20 TO CORRECT-X.                            NC1154.2 56 123
   000638         064200     MOVE    WRK-ER-1-20 TO COMPUTED-X.                           NC1154.2 62 109
   000639         064300     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000640         064400     MOVE    WRK-OK-21-40 TO CORRECT-X.                           NC1154.2 57 123
   000641         064500     MOVE    WRK-ER-21-40 TO COMPUTED-X.                          NC1154.2 63 109
   000642         064600     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000643         064700     MOVE    WRK-OK-41-60 TO CORRECT-X.                           NC1154.2 58 123
   000644         064800     MOVE    WRK-ER-41-60 TO COMPUTED-X.                          NC1154.2 64 109
   000645         064900     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000646         065000     MOVE    WRK-OK-61-80 TO CORRECT-X.                           NC1154.2 59 123
   000647         065100     MOVE    WRK-ER-61-80 TO COMPUTED-X.                          NC1154.2 65 109
   000648         065200     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000649         065300     MOVE    WRK-OK-81-83 TO CORRECT-X.                           NC1154.2 60 123
   000650         065400     MOVE    WRK-ER-81-83 TO COMPUTED-X.                          NC1154.2 66 109
   000651         065500     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000652         065600 INSP-INIT-F2-5.                                                  NC1154.2
   000653         065700     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000654         065800     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000655         065900     MOVE "INSP-TEST-F2-5" TO PAR-NAME.                           NC1154.2 99
   000656         066000     MOVE "ALL ID BY LIT AFTER" TO FEATURE.                       NC1154.2 95
   000657         066100 INSP-TEST-F2-5-0.                                                NC1154.2
   000658         066200     INSPECT WRK-XN-83-1 REPLACING ALL SPACE-XN-1-1 BY "-"        NC1154.2 68 43
   000659         066300         AFTER L-XN-1-1.                                          NC1154.2 50
   000660         066400 INSP-TEST-F2-5-1.                                                NC1154.2
   000661         066500     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-3                     NC1154.2 68 78
   000662      1  066600             PERFORM PASS                                         NC1154.2 249
   000663      1  066700             PERFORM PRINT-DETAIL                                 NC1154.2 253
   000664      1  066800             GO      TO INSP-INIT-F3-1.                           NC1154.2 689
   000665         066900     GO TO INSP-FAIL-F2-5.                                        NC1154.2 670
   000666         067000 INSP-DELETE-F2-5.                                                NC1154.2
   000667         067100     PERFORM DE-LETE.                                             NC1154.2 251
   000668         067200     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000669         067300     GO TO INSP-INIT-F3-1.                                        NC1154.2 689
   000670         067400 INSP-FAIL-F2-5.                                                  NC1154.2
   000671         067500     PERFORM FAIL.                                                NC1154.2 250
   000672         067600     MOVE    WRK-XN-83-1 TO WRK-ER.                               NC1154.2 68 61
   000673         067700     MOVE    ANS-XN-83-3 TO WRK-OK.                               NC1154.2 78 55
   000674         067800     MOVE    WRK-OK-1-20 TO CORRECT-X.                            NC1154.2 56 123
   000675         067900     MOVE    WRK-ER-1-20 TO COMPUTED-X.                           NC1154.2 62 109
   000676         068000     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000677         068100     MOVE    WRK-OK-21-40 TO CORRECT-X.                           NC1154.2 57 123
   000678         068200     MOVE    WRK-ER-21-40 TO COMPUTED-X.                          NC1154.2 63 109
   000679         068300     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000680         068400     MOVE    WRK-OK-41-60 TO CORRECT-X.                           NC1154.2 58 123
   000681         068500     MOVE    WRK-ER-41-60 TO COMPUTED-X.                          NC1154.2 64 109
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000683         068700     MOVE    WRK-OK-61-80 TO CORRECT-X.                           NC1154.2 59 123
   000684         068800     MOVE    WRK-ER-61-80 TO COMPUTED-X.                          NC1154.2 65 109
   000685         068900     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000686         069000     MOVE    WRK-OK-81-83 TO CORRECT-X.                           NC1154.2 60 123
   000687         069100     MOVE    WRK-ER-81-83 TO COMPUTED-X.                          NC1154.2 66 109
   000688         069200     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1154.2 337 342
   000689         069300 INSP-INIT-F3-1.                                                  NC1154.2
   000690         069400     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000691         069500     MOVE "INSP-TEST-F3-1" TO PAR-NAME.                           NC1154.2 99
   000692         069600     MOVE "TALLY-REPLACE CHARS" TO FEATURE.                       NC1154.2 95
   000693         069700     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000694         069800     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000695         069900     MOVE    1 TO REC-CT.                                         NC1154.2 146
   000696         070000 INSP-TEST-F3-1-0.                                                NC1154.2
   000697         070100     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR CHARACTERS     NC1154.2 68 38
   000698         070200         REPLACING CHARACTERS BY " ".                             NC1154.2
   000699         070300     GO      TO TEST-F3-1-1.                                      NC1154.2 704
   000700         070400 INSP-DELETE-F3-1.                                                NC1154.2
   000701         070500     PERFORM DE-LETE.                                             NC1154.2 251
   000702         070600     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000703         070700     GO      TO INSP-INIT-F3-2.                                   NC1154.2 737
   000704         070800 TEST-F3-1-1.                                                     NC1154.2
   000705         070900     IF      WRK-DU-999-1 EQUAL TO 83                             NC1154.2 38
   000706      1  071000     PERFORM PASS                                                 NC1154.2 249
   000707      1  071100     PERFORM PRINT-DETAIL                                         NC1154.2 253
   000708         071200     ELSE                                                         NC1154.2
   000709      1  071300     PERFORM FAIL                                                 NC1154.2 250
   000710      1  071400     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC1154.2 38 111
   000711      1  071500     MOVE    83 TO CORRECT-N                                      NC1154.2 125
   000712      1  071600     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000713         071700     ADD     1 TO REC-CT.                                         NC1154.2 146
   000714         071800 TEST-F3-1-2.                                                     NC1154.2
   000715         071900     IF   WRK-XN-83-1 EQUAL TO SPACE                              NC1154.2 68 IMP
   000716      1  072000          PERFORM PASS                                            NC1154.2 249
   000717      1  072100          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000718         072200     ELSE                                                         NC1154.2
   000719      1  072300          PERFORM FAIL                                            NC1154.2 250
   000720      1  072400          MOVE  WRK-XN-83-1 TO WRK-ER                             NC1154.2 68 61
   000721      1  072500          MOVE  SPACES      TO WRK-OK                             NC1154.2 IMP 55
   000722      1  072600          MOVE  WRK-OK-1-20 TO CORRECT-X                          NC1154.2 56 123
   000723      1  072700          MOVE  WRK-ER-1-20 TO COMPUTED-X                         NC1154.2 62 109
   000724      1  072800          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000725      1  072900          MOVE  WRK-OK-21-40 TO CORRECT-X                         NC1154.2 57 123
   000726      1  073000          MOVE  WRK-ER-21-40 TO COMPUTED-X                        NC1154.2 63 109
   000727      1  073100          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000728      1  073200          MOVE  WRK-OK-41-60 TO CORRECT-X                         NC1154.2 58 123
   000729      1  073300          MOVE  WRK-ER-41-60 TO COMPUTED-X                        NC1154.2 64 109
   000730      1  073400          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000731      1  073500          MOVE  WRK-OK-61-80 TO CORRECT-X                         NC1154.2 59 123
   000732      1  073600          MOVE  WRK-ER-61-80 TO COMPUTED-X                        NC1154.2 65 109
   000733      1  073700          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000734      1  073800          MOVE  WRK-OK-81-83 TO CORRECT-X                         NC1154.2 60 123
   000735      1  073900          MOVE  WRK-ER-81-83 TO COMPUTED-X                        NC1154.2 66 109
   000736      1  074000          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.        NC1154.2 337 342
   000737         074100 INSP-INIT-F3-2.                                                  NC1154.2
   000738         074200     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300     MOVE "INSP-TEST-F3-2" TO PAR-NAME.                           NC1154.2 99
   000740         074400     MOVE "LIT BY BEFORE INIT" TO FEATURE.                        NC1154.2 95
   000741         074500     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000742         074600     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000743         074700     MOVE    1 TO REC-CT.                                         NC1154.2 146
   000744         074800 INSP-TEST-F3-2-0.                                                NC1154.2
   000745         074900     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR CHARACTERS     NC1154.2 68 38
   000746         075000         AFTER L-XN-1-1 REPLACING ALL "A" BY "E" BEFORE INITIAL   NC1154.2 50
   000747         075100     H-XN-1-1.                                                    NC1154.2 49
   000748         075200     GO      TO TEST-F3-2-1.                                      NC1154.2 753
   000749         075300 INSP-DELETE-F3-2.                                                NC1154.2
   000750         075400     PERFORM DE-LETE.                                             NC1154.2 251
   000751         075500     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000752         075600     GO      TO INSP-INIT-F3-3.                                   NC1154.2 786
   000753         075700 TEST-F3-2-1.                                                     NC1154.2
   000754         075800     IF      WRK-DU-999-1 EQUAL TO 6                              NC1154.2 38
   000755      1  075900     PERFORM PASS                                                 NC1154.2 249
   000756      1  076000     PERFORM PRINT-DETAIL                                         NC1154.2 253
   000757         076100     ELSE                                                         NC1154.2
   000758      1  076200     PERFORM FAIL                                                 NC1154.2 250
   000759      1  076300     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC1154.2 38 111
   000760      1  076400     MOVE    6 TO CORRECT-N                                       NC1154.2 125
   000761      1  076500     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000762         076600     ADD     1 TO REC-CT.                                         NC1154.2 146
   000763         076700 TEST-F3-2-2.                                                     NC1154.2
   000764         076800     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-4                     NC1154.2 68 81
   000765      1  076900          PERFORM PASS                                            NC1154.2 249
   000766      1  077000          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000767         077100     ELSE                                                         NC1154.2
   000768      1  077200          PERFORM FAIL                                            NC1154.2 250
   000769      1  077300          MOVE    WRK-XN-83-1 TO WRK-ER                           NC1154.2 68 61
   000770      1  077400          MOVE    ANS-XN-83-4 TO WRK-OK                           NC1154.2 81 55
   000771      1  077500          MOVE    WRK-OK-1-20 TO CORRECT-X                        NC1154.2 56 123
   000772      1  077600          MOVE    WRK-ER-1-20 TO COMPUTED-X                       NC1154.2 62 109
   000773      1  077700          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000774      1  077800          MOVE    WRK-OK-21-40 TO CORRECT-X                       NC1154.2 57 123
   000775      1  077900          MOVE    WRK-ER-21-40 TO COMPUTED-X                      NC1154.2 63 109
   000776      1  078000          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000777      1  078100          MOVE    WRK-OK-41-60 TO CORRECT-X                       NC1154.2 58 123
   000778      1  078200          MOVE    WRK-ER-41-60 TO COMPUTED-X                      NC1154.2 64 109
   000779      1  078300          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000780      1  078400          MOVE    WRK-OK-61-80 TO CORRECT-X                       NC1154.2 59 123
   000781      1  078500          MOVE    WRK-ER-61-80 TO COMPUTED-X                      NC1154.2 65 109
   000782      1  078600          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000783      1  078700          MOVE    WRK-OK-81-83 TO CORRECT-X                       NC1154.2 60 123
   000784      1  078800          MOVE    WRK-ER-81-83 TO COMPUTED-X                      NC1154.2 66 109
   000785      1  078900          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.        NC1154.2 337 342
   000786         079000 INSP-INIT-F3-3.                                                  NC1154.2
   000787         079100     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000788         079200     MOVE "INSP-TEST-F3-3" TO PAR-NAME.                           NC1154.2 99
   000789         079300     MOVE "REPL FIRST AFTER" TO FEATURE.                          NC1154.2 95
   000790         079400     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000791         079500     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000792         079600     MOVE    1 TO REC-CT.                                         NC1154.2 146
   000793         079700 INSP-TEST-F3-3-0.                                                NC1154.2
   000794         079800     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR ALL "A" BEFORE NC1154.2 68 38
   000795         079900         L-XN-1-1 REPLACING FIRST  A-XN-1-1 BY "O" AFTER          NC1154.2 50 46
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000         INITIAL H-XN-1-1.                                        NC1154.2 49
   000797         080100     GO      TO TEST-F3-3-1.                                      NC1154.2 802
   000798         080200 INSP-DELETE-F3-3.                                                NC1154.2
   000799         080300     PERFORM DE-LETE.                                             NC1154.2 251
   000800         080400     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000801         080500     GO      TO INSP-INIT-F3-4.                                   NC1154.2 835
   000802         080600 TEST-F3-3-1.                                                     NC1154.2
   000803         080700     IF      WRK-DU-999-1 EQUAL TO 7                              NC1154.2 38
   000804      1  080800     PERFORM PASS                                                 NC1154.2 249
   000805      1  080900     PERFORM PRINT-DETAIL                                         NC1154.2 253
   000806         081000     ELSE                                                         NC1154.2
   000807      1  081100     PERFORM FAIL                                                 NC1154.2 250
   000808      1  081200     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC1154.2 38 111
   000809      1  081300     MOVE    7 TO CORRECT-N                                       NC1154.2 125
   000810      1  081400     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000811         081500     ADD     1 TO REC-CT.                                         NC1154.2 146
   000812         081600 TEST-F3-3-2.                                                     NC1154.2
   000813         081700     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-5                     NC1154.2 68 84
   000814      1  081800          PERFORM PASS                                            NC1154.2 249
   000815      1  081900          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000816         082000     ELSE                                                         NC1154.2
   000817      1  082100          PERFORM FAIL                                            NC1154.2 250
   000818      1  082200          MOVE    WRK-XN-83-1 TO WRK-ER                           NC1154.2 68 61
   000819      1  082300          MOVE    ANS-XN-83-5 TO WRK-OK                           NC1154.2 84 55
   000820      1  082400          MOVE    WRK-OK-1-20 TO CORRECT-X                        NC1154.2 56 123
   000821      1  082500          MOVE    WRK-ER-1-20 TO COMPUTED-X                       NC1154.2 62 109
   000822      1  082600          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000823      1  082700          MOVE    WRK-OK-21-40 TO CORRECT-X                       NC1154.2 57 123
   000824      1  082800          MOVE    WRK-ER-21-40 TO COMPUTED-X                      NC1154.2 63 109
   000825      1  082900          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000826      1  083000          MOVE    WRK-OK-41-60 TO CORRECT-X                       NC1154.2 58 123
   000827      1  083100          MOVE    WRK-ER-41-60 TO COMPUTED-X                      NC1154.2 64 109
   000828      1  083200          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000829      1  083300          MOVE    WRK-OK-61-80 TO CORRECT-X                       NC1154.2 59 123
   000830      1  083400          MOVE    WRK-ER-61-80 TO COMPUTED-X                      NC1154.2 65 109
   000831      1  083500          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000832      1  083600          MOVE    WRK-OK-81-83 TO CORRECT-X                       NC1154.2 60 123
   000833      1  083700          MOVE    WRK-ER-81-83 TO COMPUTED-X                      NC1154.2 66 109
   000834      1  083800          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.        NC1154.2 337 342
   000835         083900 INSP-INIT-F3-4.                                                  NC1154.2
   000836         084000     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000837         084100     MOVE "INSP-TEST-F3-4" TO PAR-NAME.                           NC1154.2 99
   000838         084200     MOVE "FOR LEADING" TO FEATURE.                               NC1154.2 95
   000839         084300     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000840         084400     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000841         084500     MOVE    1 TO REC-CT.                                         NC1154.2 146
   000842         084600 INSP-TEST-F3-4-0.                                                NC1154.2
   000843         084700     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR LEADING        NC1154.2 68 38
   000844         084800         A-XN-1-1 REPLACING LEADING A-XN-1-1 BY "O".              NC1154.2 46 46
   000845         084900     GO      TO TEST-F3-4-1.                                      NC1154.2 850
   000846         085000 INSP-DELETE-F3-4.                                                NC1154.2
   000847         085100     PERFORM DE-LETE.                                             NC1154.2 251
   000848         085200     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000849         085300     GO      TO INSP-INIT-F3-5.                                   NC1154.2 883
   000850         085400 TEST-F3-4-1.                                                     NC1154.2
   000851         085500     IF      WRK-DU-999-1 EQUAL TO 1                              NC1154.2 38
   000852      1  085600     PERFORM PASS                                                 NC1154.2 249
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853      1  085700     PERFORM PRINT-DETAIL                                         NC1154.2 253
   000854         085800     ELSE                                                         NC1154.2
   000855      1  085900     PERFORM FAIL                                                 NC1154.2 250
   000856      1  086000     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC1154.2 38 111
   000857      1  086100     MOVE    1 TO CORRECT-N                                       NC1154.2 125
   000858      1  086200     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000859         086300     ADD     1 TO REC-CT.                                         NC1154.2 146
   000860         086400 TEST-F3-4-2.                                                     NC1154.2
   000861         086500     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-1                     NC1154.2 68 72
   000862      1  086600          PERFORM PASS                                            NC1154.2 249
   000863      1  086700          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000864         086800     ELSE                                                         NC1154.2
   000865      1  086900          PERFORM FAIL                                            NC1154.2 250
   000866      1  087000          MOVE    WRK-XN-83-1 TO WRK-ER                           NC1154.2 68 61
   000867      1  087100          MOVE    ANS-XN-83-1 TO WRK-OK                           NC1154.2 72 55
   000868      1  087200          MOVE    WRK-OK-1-20 TO CORRECT-X                        NC1154.2 56 123
   000869      1  087300          MOVE    WRK-ER-1-20 TO COMPUTED-X                       NC1154.2 62 109
   000870      1  087400          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000871      1  087500          MOVE    WRK-OK-21-40 TO CORRECT-X                       NC1154.2 57 123
   000872      1  087600          MOVE    WRK-ER-21-40 TO COMPUTED-X                      NC1154.2 63 109
   000873      1  087700          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000874      1  087800          MOVE    WRK-OK-41-60 TO CORRECT-X                       NC1154.2 58 123
   000875      1  087900          MOVE    WRK-ER-41-60 TO COMPUTED-X                      NC1154.2 64 109
   000876      1  088000          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000877      1  088100          MOVE    WRK-OK-61-80 TO CORRECT-X                       NC1154.2 59 123
   000878      1  088200          MOVE    WRK-ER-61-80 TO COMPUTED-X                      NC1154.2 65 109
   000879      1  088300          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000880      1  088400          MOVE    WRK-OK-81-83 TO CORRECT-X                       NC1154.2 60 123
   000881      1  088500          MOVE    WRK-ER-81-83 TO COMPUTED-X                      NC1154.2 66 109
   000882      1  088600          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.        NC1154.2 337 342
   000883         088700 INSP-INIT-F3-5.                                                  NC1154.2
   000884         088800     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000885         088900     MOVE "INSP-TEST-F3-5" TO PAR-NAME.                           NC1154.2 99
   000886         089000     MOVE "LIT BY AFTER INIT" TO FEATURE.                         NC1154.2 95
   000887         089100     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000888         089200     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000889         089300     MOVE    1 TO REC-CT.                                         NC1154.2 146
   000890         089400 INSP-TEST-F3-5-0.                                                NC1154.2
   000891         089500     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR ALL "A"        NC1154.2 68 38
   000892         089600         REPLACING FIRST "A" BY "O" AFTER INITIAL "Y".            NC1154.2
   000893         089700     GO      TO TEST-F3-5-1.                                      NC1154.2 898
   000894         089800 INSP-DELETE-F3-5.                                                NC1154.2
   000895         089900     PERFORM DE-LETE.                                             NC1154.2 251
   000896         090000     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000897         090100     GO      TO INSP-INIT-F3-6.                                   NC1154.2 931
   000898         090200 TEST-F3-5-1.                                                     NC1154.2
   000899         090300     IF      WRK-DU-999-1 EQUAL TO 8                              NC1154.2 38
   000900      1  090400     PERFORM PASS                                                 NC1154.2 249
   000901      1  090500     PERFORM PRINT-DETAIL                                         NC1154.2 253
   000902         090600     ELSE                                                         NC1154.2
   000903      1  090700     PERFORM FAIL                                                 NC1154.2 250
   000904      1  090800     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC1154.2 38 111
   000905      1  090900     MOVE    8 TO CORRECT-N                                       NC1154.2 125
   000906      1  091000     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000907         091100     ADD     1 TO REC-CT.                                         NC1154.2 146
   000908         091200 TEST-F3-5-2.                                                     NC1154.2
   000909         091300     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-5                     NC1154.2 68 84
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910      1  091400          PERFORM PASS                                            NC1154.2 249
   000911      1  091500          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000912         091600     ELSE                                                         NC1154.2
   000913      1  091700          PERFORM FAIL                                            NC1154.2 250
   000914      1  091800          MOVE    WRK-XN-83-1 TO WRK-ER                           NC1154.2 68 61
   000915      1  091900          MOVE    ANS-XN-83-5 TO WRK-OK                           NC1154.2 84 55
   000916      1  092000          MOVE    WRK-OK-1-20 TO CORRECT-X                        NC1154.2 56 123
   000917      1  092100          MOVE    WRK-ER-1-20 TO COMPUTED-X                       NC1154.2 62 109
   000918      1  092200          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000919      1  092300          MOVE    WRK-OK-21-40 TO CORRECT-X                       NC1154.2 57 123
   000920      1  092400          MOVE    WRK-ER-21-40 TO COMPUTED-X                      NC1154.2 63 109
   000921      1  092500          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000922      1  092600          MOVE    WRK-OK-41-60 TO CORRECT-X                       NC1154.2 58 123
   000923      1  092700          MOVE    WRK-ER-41-60 TO COMPUTED-X                      NC1154.2 64 109
   000924      1  092800          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000925      1  092900          MOVE    WRK-OK-61-80 TO CORRECT-X                       NC1154.2 59 123
   000926      1  093000          MOVE    WRK-ER-61-80 TO COMPUTED-X                      NC1154.2 65 109
   000927      1  093100          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000928      1  093200          MOVE    WRK-OK-81-83 TO CORRECT-X                       NC1154.2 60 123
   000929      1  093300          MOVE    WRK-ER-81-83 TO COMPUTED-X                      NC1154.2 66 109
   000930      1  093400          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.        NC1154.2 337 342
   000931         093500 INSP-INIT-F3-6.                                                  NC1154.2
   000932         093600     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000933         093700     MOVE "INSP-TEST-F3-6" TO PAR-NAME.                           NC1154.2 99
   000934         093800     MOVE "CHAR AFTER ALL BEF" TO FEATURE.                        NC1154.2 95
   000935         093900     MOVE ZERO TO WRK-DU-999-1.                                   NC1154.2 IMP 38
   000936         094000     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000937         094100     MOVE 1 TO REC-CT.                                            NC1154.2 146
   000938         094200 INSP-TEST-F3-6-0.                                                NC1154.2
   000939         094300     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR CHARACTERS     NC1154.2 68 38
   000940         094400         AFTER A-XN-1-1 REPLACING ALL "A" BY "O" BEFORE H-XN-1-1. NC1154.2 46 49
   000941         094500     GO      TO TEST-F3-6-1.                                      NC1154.2 946
   000942         094600 INSP-DELETE-F3-6.                                                NC1154.2
   000943         094700     PERFORM DE-LETE.                                             NC1154.2 251
   000944         094800     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000945         094900     GO      TO INSP-INIT-F3-7.                                   NC1154.2 979
   000946         095000 TEST-F3-6-1.                                                     NC1154.2
   000947         095100     IF      WRK-DU-999-1 EQUAL TO 82                             NC1154.2 38
   000948      1  095200     PERFORM PASS                                                 NC1154.2 249
   000949      1  095300     PERFORM PRINT-DETAIL                                         NC1154.2 253
   000950         095400     ELSE                                                         NC1154.2
   000951      1  095500     PERFORM FAIL                                                 NC1154.2 250
   000952      1  095600     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC1154.2 38 111
   000953      1  095700     MOVE    82 TO CORRECT-N                                      NC1154.2 125
   000954      1  095800     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000955         095900     ADD     1 TO REC-CT.                                         NC1154.2 146
   000956         096000 TEST-F3-6-2.                                                     NC1154.2
   000957         096100     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-1                     NC1154.2 68 72
   000958      1  096200          PERFORM PASS                                            NC1154.2 249
   000959      1  096300          PERFORM PRINT-DETAIL                                    NC1154.2 253
   000960         096400     ELSE                                                         NC1154.2
   000961      1  096500          PERFORM FAIL                                            NC1154.2 250
   000962      1  096600          MOVE    WRK-XN-83-1 TO WRK-ER                           NC1154.2 68 61
   000963      1  096700          MOVE    ANS-XN-83-1 TO WRK-OK                           NC1154.2 72 55
   000964      1  096800          MOVE    WRK-OK-1-20 TO CORRECT-X                        NC1154.2 56 123
   000965      1  096900          MOVE    WRK-ER-1-20 TO COMPUTED-X                       NC1154.2 62 109
   000966      1  097000          PERFORM PRINT-DETAIL                                    NC1154.2 253
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967      1  097100          MOVE    WRK-OK-21-40 TO CORRECT-X                       NC1154.2 57 123
   000968      1  097200          MOVE    WRK-ER-21-40 TO COMPUTED-X                      NC1154.2 63 109
   000969      1  097300          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000970      1  097400          MOVE    WRK-OK-41-60 TO CORRECT-X                       NC1154.2 58 123
   000971      1  097500          MOVE    WRK-ER-41-60 TO COMPUTED-X                      NC1154.2 64 109
   000972      1  097600          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000973      1  097700          MOVE    WRK-OK-61-80 TO CORRECT-X                       NC1154.2 59 123
   000974      1  097800          MOVE    WRK-ER-61-80 TO COMPUTED-X                      NC1154.2 65 109
   000975      1  097900          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX         NC1154.2 337 342
   000976      1  098000          MOVE    WRK-OK-81-83 TO CORRECT-X                       NC1154.2 60 123
   000977      1  098100          MOVE    WRK-ER-81-83 TO COMPUTED-X                      NC1154.2 66 109
   000978      1  098200          PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.        NC1154.2 337 342
   000979         098300 INSP-INIT-F3-7.                                                  NC1154.2
   000980         098400     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   000981         098500     MOVE ZERO TO WRK-DU-999-1 WRK-DU-999-2 WRK-DU-999-3          NC1154.2 IMP 38 39 40
   000982         098600         WRK-DU-999-4.                                            NC1154.2 41
   000983         098700     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   000984         098800     MOVE "INSP-TEST-F3-7" TO PAR-NAME.                           NC1154.2 99
   000985         098900     MOVE "TALLY SERIES" TO FEATURE.                              NC1154.2 95
   000986         099000     MOVE 1 TO REC-CT.                                            NC1154.2 146
   000987         099100 INSP-TEST-F3-7-0.                                                NC1154.2
   000988         099200     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR ALL "A".       NC1154.2 68 38
   000989         099300     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-2 FOR LEADING "A".   NC1154.2 68 39
   000990         099400     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-3 FOR CHARACTERS     NC1154.2 68 40
   000991         099500             BEFORE ".".                                          NC1154.2
   000992         099600     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-4 FOR CHARACTERS     NC1154.2 68 41
   000993         099700             AFTER "L".                                           NC1154.2
   000994         099800     INSPECT WRK-XN-83-1 REPLACING CHARACTERS BY "Z" AFTER "L".   NC1154.2 68
   000995         099900     GO TO INSP-TEST-F3-7-1.                                      NC1154.2 1000
   000996         100000 INSP-DELETE-F3-7.                                                NC1154.2
   000997         100100     PERFORM DE-LETE.                                             NC1154.2 251
   000998         100200     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   000999         100300     GO TO INSP-INIT-F3-8.                                        NC1154.2 1045
   001000         100400 INSP-TEST-F3-7-1.                                                NC1154.2
   001001         100500     IF WRK-DU-999-1 EQUAL TO 8 PERFORM PASS PERFORM PRINT-DETAIL NC1154.2 38 249 253
   001002         100600     ELSE                                                         NC1154.2
   001003      1  100700     PERFORM FAIL MOVE WRK-DU-999-1 TO COMPUTED-N MOVE 8          NC1154.2 250 38 111
   001004      1  100800     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1154.2 125 253
   001005         100900     ADD 1 TO REC-CT.                                             NC1154.2 146
   001006         101000 INSP-TEST-F3-7-2.                                                NC1154.2
   001007         101100     IF WRK-DU-999-2 EQUAL TO 1 PERFORM PASS PERFORM PRINT-DETAIL NC1154.2 39 249 253
   001008         101200     ELSE                                                         NC1154.2
   001009      1  101300     PERFORM FAIL MOVE WRK-DU-999-2 TO COMPUTED-N MOVE 1          NC1154.2 250 39 111
   001010      1  101400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1154.2 125 253
   001011         101500     ADD 1 TO REC-CT.                                             NC1154.2 146
   001012         101600 INSP-TEST-F3-7-3.                                                NC1154.2
   001013         101700     IF WRK-DU-999-3 EQUAL TO 15 PERFORM PASS PERFORM PRINT-DETAILNC1154.2 40 249 253
   001014         101800     ELSE                                                         NC1154.2
   001015      1  101900     PERFORM FAIL MOVE WRK-DU-999-3 TO COMPUTED-N MOVE 15         NC1154.2 250 40 111
   001016      1  102000     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1154.2 125 253
   001017         102100     ADD 1 TO REC-CT.                                             NC1154.2 146
   001018         102200 INSP-TEST-F3-7-4.                                                NC1154.2
   001019         102300     IF WRK-DU-999-4 EQUAL TO 6 PERFORM PASS PERFORM PRINT-DETAIL NC1154.2 41 249 253
   001020         102400         ELSE                                                     NC1154.2
   001021      1  102500     PERFORM FAIL MOVE WRK-DU-999-4 TO COMPUTED-N MOVE 6          NC1154.2 250 41 111
   001022      1  102600     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1154.2 125 253
   001023         102700     ADD 1 TO REC-CT.                                             NC1154.2 146
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102800 INSP-TEST-F3-7-5.                                                NC1154.2
   001025         102900     IF WRK-XN-83-1 EQUAL TO ANS-XN-83-6 PERFORM PASS PERFORM     NC1154.2 68 87 249
   001026         103000     PRINT-DETAIL ELSE                                            NC1154.2 253
   001027      1  103100        PERFORM FAIL                                              NC1154.2 250
   001028      1  103200        MOVE    WRK-XN-83-1 TO WRK-ER                             NC1154.2 68 61
   001029      1  103300        MOVE    ANS-XN-83-6 TO WRK-OK                             NC1154.2 87 55
   001030      1  103400        MOVE    WRK-OK-1-20 TO CORRECT-X                          NC1154.2 56 123
   001031      1  103500        MOVE    WRK-ER-1-20 TO COMPUTED-X                         NC1154.2 62 109
   001032      1  103600        PERFORM PRINT-DETAIL                                      NC1154.2 253
   001033      1  103700        MOVE    WRK-OK-21-40 TO CORRECT-X                         NC1154.2 57 123
   001034      1  103800        MOVE    WRK-ER-21-40 TO COMPUTED-X                        NC1154.2 63 109
   001035      1  103900        PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX           NC1154.2 337 342
   001036      1  104000        MOVE    WRK-OK-41-60 TO CORRECT-X                         NC1154.2 58 123
   001037      1  104100        MOVE    WRK-ER-41-60 TO COMPUTED-X                        NC1154.2 64 109
   001038      1  104200        PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX           NC1154.2 337 342
   001039      1  104300        MOVE    WRK-OK-61-80 TO CORRECT-X                         NC1154.2 59 123
   001040      1  104400        MOVE    WRK-ER-61-80 TO COMPUTED-X                        NC1154.2 65 109
   001041      1  104500        PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX           NC1154.2 337 342
   001042      1  104600        MOVE    WRK-OK-81-83 TO CORRECT-X                         NC1154.2 60 123
   001043      1  104700        MOVE    WRK-ER-81-83 TO COMPUTED-X                        NC1154.2 66 109
   001044      1  104800        PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.          NC1154.2 337 342
   001045         104900 INSP-INIT-F3-8.                                                  NC1154.2
   001046         105000     MOVE   "VI-95 6.17.4" TO ANSI-REFERENCE.                     NC1154.2 155
   001047         105100     MOVE "INSP-TEST-F3-8" TO PAR-NAME.                           NC1154.2 99
   001048         105200     MOVE "REPLACE SERIES" TO FEATURE.                            NC1154.2 95
   001049         105300     MOVE ZERO TO REC-CT WRK-DU-999-1.                            NC1154.2 IMP 146 38
   001050         105400     MOVE WC-XN-83 TO WRK-XN-83-1.                                NC1154.2 69 68
   001051         105500     MOVE    1 TO REC-CT.                                         NC1154.2 146
   001052         105600 INSP-TEST-F3-8-0.                                                NC1154.2
   001053         105700     INSPECT WRK-XN-83-1 TALLYING WRK-DU-999-1 FOR CHARACTERS     NC1154.2 68 38
   001054         105800         BEFORE "." REPLACING CHARACTERS BY Z-XN-1-1 AFTER        NC1154.2 54
   001055         105900             L-XN-1-1.                                            NC1154.2 50
   001056         106000     INSPECT WRK-XN-83-1 REPLACING ALL " " BY HYPEN-XN-1-1.       NC1154.2 68 45
   001057         106100     INSPECT WRK-XN-83-1 REPLACING FIRST "C" BY P-XN-1-1.         NC1154.2 68 52
   001058         106200     INSPECT WRK-XN-83-1 REPLACING LEADING A-XN-1-1 BY O-XN-1-1.  NC1154.2 68 46 51
   001059         106300     INSPECT WRK-XN-83-1 REPLACING ALL "F" BY "Z" BEFORE G-XN-1-1.NC1154.2 68 48
   001060         106400     GO      TO TEST-F3-8-1.                                      NC1154.2 1065
   001061         106500 INSP-DELETE-F3-8.                                                NC1154.2
   001062         106600     PERFORM DE-LETE.                                             NC1154.2 251
   001063         106700     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   001064         106800     GO      TO CCVS-999999.                                      NC1154.2 1099
   001065         106900 TEST-F3-8-1.                                                     NC1154.2
   001066         107000     IF      WRK-DU-999-1 EQUAL TO 15                             NC1154.2 38
   001067      1  107100     PERFORM PASS                                                 NC1154.2 249
   001068      1  107200     PERFORM PRINT-DETAIL                                         NC1154.2 253
   001069         107300     ELSE                                                         NC1154.2
   001070      1  107400     PERFORM FAIL                                                 NC1154.2 250
   001071      1  107500     MOVE    WRK-DU-999-1 TO COMPUTED-N                           NC1154.2 38 111
   001072      1  107600     MOVE    15 TO CORRECT-N                                      NC1154.2 125
   001073      1  107700     PERFORM PRINT-DETAIL.                                        NC1154.2 253
   001074         107800     ADD     1 TO REC-CT.                                         NC1154.2 146
   001075         107900 TEST-F3-8-2.                                                     NC1154.2
   001076         108000     IF      WRK-XN-83-1 EQUAL TO ANS-XN-83-7                     NC1154.2 68 90
   001077      1  108100     PERFORM PASS                                                 NC1154.2 249
   001078      1  108200     PERFORM PRINT-DETAIL                                         NC1154.2 253
   001079         108300     ELSE                                                         NC1154.2
   001080      1  108400        PERFORM FAIL                                              NC1154.2 250
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081      1  108500        MOVE    WRK-XN-83-1 TO WRK-ER                             NC1154.2 68 61
   001082      1  108600        MOVE    ANS-XN-83-7 TO WRK-OK                             NC1154.2 90 55
   001083      1  108700        MOVE    WRK-OK-1-20 TO CORRECT-X                          NC1154.2 56 123
   001084      1  108800        MOVE    WRK-ER-1-20 TO COMPUTED-X                         NC1154.2 62 109
   001085      1  108900        PERFORM PRINT-DETAIL                                      NC1154.2 253
   001086      1  109000        MOVE    WRK-OK-21-40 TO CORRECT-X                         NC1154.2 57 123
   001087      1  109100        MOVE    WRK-ER-21-40 TO COMPUTED-X                        NC1154.2 63 109
   001088      1  109200        PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX           NC1154.2 337 342
   001089      1  109300        MOVE    WRK-OK-41-60 TO CORRECT-X                         NC1154.2 58 123
   001090      1  109400        MOVE    WRK-ER-41-60 TO COMPUTED-X                        NC1154.2 64 109
   001091      1  109500        PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX           NC1154.2 337 342
   001092      1  109600        MOVE    WRK-OK-61-80 TO CORRECT-X                         NC1154.2 59 123
   001093      1  109700        MOVE    WRK-ER-61-80 TO COMPUTED-X                        NC1154.2 65 109
   001094      1  109800        PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX           NC1154.2 337 342
   001095      1  109900        MOVE    WRK-OK-81-83 TO CORRECT-X                         NC1154.2 60 123
   001096      1  110000        MOVE    WRK-ER-81-83 TO COMPUTED-X                        NC1154.2 66 109
   001097      1  110100        PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.          NC1154.2 337 342
   001098         110200 CCVS-EXIT SECTION.                                               NC1154.2
   001099         110300 CCVS-999999.                                                     NC1154.2
   001100         110400     GO TO CLOSE-FILES.                                           NC1154.2 242
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    23
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       46   A-XN-1-1 . . . . . . . . . . .  795 844 844 940 1058
       72   ANS-XN-83-1. . . . . . . . . .  550 562 624 636 861 867 957 963
       75   ANS-XN-83-2. . . . . . . . . .  587 599
       78   ANS-XN-83-3. . . . . . . . . .  661 673
       81   ANS-XN-83-4. . . . . . . . . .  764 770
       84   ANS-XN-83-5. . . . . . . . . .  813 819 909 915
       87   ANS-XN-83-6. . . . . . . . . .  1025 1029
       90   ANS-XN-83-7. . . . . . . . . .  1076 1082
      155   ANSI-REFERENCE . . . . . . . .  332 339 348 M356 M377 M398 M419 M440 M462 M484 M506 M542 M579 M616 M653 M690
                                            M738 M787 M836 M884 M932 M980 M1046
      134   CCVS-C-1 . . . . . . . . . . .  271 317
      139   CCVS-C-2 . . . . . . . . . . .  272 318
      189   CCVS-E-1 . . . . . . . . . . .  277
      194   CCVS-E-2 . . . . . . . . . . .  286 293 300 305
      197   CCVS-E-2-2 . . . . . . . . . .  M285
      202   CCVS-E-3 . . . . . . . . . . .  306
      211   CCVS-E-4 . . . . . . . . . . .  285
      212   CCVS-E-4-1 . . . . . . . . . .  M283
      214   CCVS-E-4-2 . . . . . . . . . .  M284
      156   CCVS-H-1 . . . . . . . . . . .  266 313
      161   CCVS-H-2A. . . . . . . . . . .  267 314
      170   CCVS-H-2B. . . . . . . . . . .  268 315
      182   CCVS-H-3 . . . . . . . . . . .  269 316
      232   CCVS-PGM-ID. . . . . . . . . .  238 238
      116   CM-18V0
       44   COMMA-XN-1-1 . . . . . . . . .  585
      110   COMPUTED-A . . . . . . . . . .  111 113 114 115 116 344 347
      111   COMPUTED-N . . . . . . . . . .  M370 M391 M412 M433 M455 M477 M499 M710 M759 M808 M856 M904 M952 M1003 M1009
                                            M1015 M1021 M1071
      109   COMPUTED-X . . . . . . . . . .  M261 329 M527 M530 M533 M536 M539 M564 M567 M570 M573 M576 M601 M604 M607 M610
                                            M613 M638 M641 M644 M647 M650 M675 M678 M681 M684 M687 M723 M726 M729 M732 M735
                                            M772 M775 M778 M781 M784 M821 M824 M827 M830 M833 M869 M872 M875 M878 M881 M917
                                            M920 M923 M926 M929 M965 M968 M971 M974 M977 M1031 M1034 M1037 M1040 M1043 M1084
                                            M1087 M1090 M1093 M1096
      113   COMPUTED-0V18
      115   COMPUTED-14V4
      117   COMPUTED-18V0
      114   COMPUTED-4V14
      133   COR-ANSI-REFERENCE . . . . . .  M339 M341
      124   CORRECT-A. . . . . . . . . . .  125 126 127 128 129 345 347
      125   CORRECT-N. . . . . . . . . . .  M371 M392 M413 M434 M456 M478 M500 M711 M760 M809 M857 M905 M953 M1004 M1010
                                            M1016 M1022 M1072
      123   CORRECT-X. . . . . . . . . . .  M262 331 M526 M529 M532 M535 M538 M563 M566 M569 M572 M575 M600 M603 M606 M609
                                            M612 M637 M640 M643 M646 M649 M674 M677 M680 M683 M686 M722 M725 M728 M731 M734
                                            M771 M774 M777 M780 M783 M820 M823 M826 M829 M832 M868 M871 M874 M877 M880 M916
                                            M919 M922 M925 M928 M964 M967 M970 M973 M976 M1030 M1033 M1036 M1039 M1042 M1083
                                            M1086 M1089 M1092 M1095
      126   CORRECT-0V18
      128   CORRECT-14V4
      130   CORRECT-18V0
      127   CORRECT-4V14
      129   CR-18V0
       47   D-XN-1-1
      147   DELETE-COUNTER . . . . . . . .  M251 280 296 298
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    24
0 Defined   Cross-reference of data names   References

0     102   DOTVALUE . . . . . . . . . . .  M256
      153   DUMMY-HOLD . . . . . . . . . .  M310 320
       36   DUMMY-RECORD . . . . . . . . .  M266 M267 M268 M269 M271 M272 M273 M275 M277 M286 M293 M300 M305 M306 310 M311
                                            312 M313 M314 M315 M316 M317 M318 M319 M320 324 M325 M334 M349
      200   ENDER-DESC . . . . . . . . . .  M288 M299 M304
      148   ERROR-COUNTER. . . . . . . . .  M250 279 289 292
      152   ERROR-HOLD . . . . . . . . . .  M279 M280 M280 M281 284
      198   ERROR-TOTAL. . . . . . . . . .  M290 M292 M297 M298 M302 M303
       95   FEATURE. . . . . . . . . . . .  M374 M395 M416 M437 M459 M481 M503 M509 M545 M582 M619 M656 M692 M740 M789 M838
                                            M886 M934 M985 M1048
       48   G-XN-1-1 . . . . . . . . . . .  1059
       49   H-XN-1-1 . . . . . . . . . . .  747 796 940
       45   HYPEN-XN-1-1 . . . . . . . . .  1056
      226   HYPHEN-LINE. . . . . . . . . .  273 275 319
      192   ID-AGAIN . . . . . . . . . . .  M238
      225   INF-ANSI-REFERENCE . . . . . .  M332 M335 M348 M350
      220   INFO-TEXT. . . . . . . . . . .  M333
      149   INSPECT-COUNTER. . . . . . . .  M248 279 301 303
       42   JUST-XN-20-1
       50   L-XN-1-1 . . . . . . . . . . .  659 746 795 1055
       51   O-XN-1-1 . . . . . . . . . . .  621 1058
       97   P-OR-F . . . . . . . . . . . .  M248 M249 M250 M251 258 M261
       52   P-XN-1-1 . . . . . . . . . . .  1057
       99   PAR-NAME . . . . . . . . . . .  M263 M373 M394 M415 M436 M458 M480 M502 M508 M544 M581 M618 M655 M691 M739 M788
                                            M837 M885 M933 M984 M1047
      101   PARDOT-X . . . . . . . . . . .  M255
      150   PASS-COUNTER . . . . . . . . .  M249 281 283
       34   PRINT-FILE . . . . . . . . . .  30 237 243
       35   PRINT-REC. . . . . . . . . . .  M257 M338 M340
      104   RE-MARK. . . . . . . . . . . .  M252 M264
      146   REC-CT . . . . . . . . . . . .  254 256 263 M695 M713 M743 M762 M792 M811 M841 M859 M889 M907 M937 M955 M986
                                            M1005 M1011 M1017 M1023 M1049 M1051 M1074
      145   REC-SKL-SUB
      154   RECORD-COUNT . . . . . . . . .  M308 309 M321
       53   S-XN-1-1 . . . . . . . . . . .  585
       43   SPACE-XN-1-1 . . . . . . . . .  584 658
      105   TEST-COMPUTED. . . . . . . . .  338
      120   TEST-CORRECT . . . . . . . . .  340
      173   TEST-ID. . . . . . . . . . . .  M238
       93   TEST-RESULTS . . . . . . . . .  M239 257
      151   TOTAL-ERROR
       69   WC-XN-83 . . . . . . . . . . .  359 380 401 422 443 465 487 507 543 580 617 654 694 742 791 840 888 936 983 1050
       38   WRK-DU-999-1 . . . . . . . . .  M357 M359 361 370 M378 M380 382 391 M399 M401 403 412 M420 M422 424 433 M441
                                            M443 446 455 M463 M465 468 477 M485 M487 490 499 M693 M697 705 710 M741 M745
                                            754 759 M790 M794 803 808 M839 M843 851 856 M887 M891 899 904 M935 M939 947 952
                                            M981 M988 1001 1003 M1049 M1053 1066 1071
       39   WRK-DU-999-2 . . . . . . . . .  M981 M989 1007 1009
       40   WRK-DU-999-3 . . . . . . . . .  M981 M990 1013 1015
       41   WRK-DU-999-4 . . . . . . . . .  M982 M992 1019 1021
       61   WRK-ER . . . . . . . . . . . .  M524 M561 M598 M635 M672 M720 M769 M818 M866 M914 M962 M1028 M1081
       62   WRK-ER-1-20. . . . . . . . . .  527 564 601 638 675 723 772 821 869 917 965 1031 1084
       63   WRK-ER-21-40 . . . . . . . . .  530 567 604 641 678 726 775 824 872 920 968 1034 1087
       64   WRK-ER-41-60 . . . . . . . . .  533 570 607 644 681 729 778 827 875 923 971 1037 1090
       65   WRK-ER-61-80 . . . . . . . . .  536 573 610 647 684 732 781 830 878 926 974 1040 1093
       66   WRK-ER-81-83 . . . . . . . . .  539 576 613 650 687 735 784 833 881 929 977 1043 1096
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    25
0 Defined   Cross-reference of data names   References

0      55   WRK-OK . . . . . . . . . . . .  M525 M562 M599 M636 M673 M721 M770 M819 M867 M915 M963 M1029 M1082
       56   WRK-OK-1-20. . . . . . . . . .  526 563 600 637 674 722 771 820 868 916 964 1030 1083
       57   WRK-OK-21-40 . . . . . . . . .  529 566 603 640 677 725 774 823 871 919 967 1033 1086
       58   WRK-OK-41-60 . . . . . . . . .  532 569 606 643 680 728 777 826 874 922 970 1036 1089
       59   WRK-OK-61-80 . . . . . . . . .  535 572 609 646 683 731 780 829 877 925 973 1039 1092
       60   WRK-OK-81-83 . . . . . . . . .  538 575 612 649 686 734 783 832 880 928 976 1042 1095
       68   WRK-XN-83-1. . . . . . . . . .  M507 M511 513 524 M543 M547 550 561 M580 M584 587 598 M617 M621 624 635 M654
                                            M658 661 672 M694 M697 715 720 M742 M745 764 769 M791 M794 813 818 M840 M843
                                            861 866 M888 M891 909 914 M936 M939 957 962 M983 988 989 990 992 M994 1025 1028
                                            M1050 M1053 M1056 M1057 M1058 M1059 1076 1081
      222   XXCOMPUTED . . . . . . . . . .  M347
      224   XXCORRECT. . . . . . . . . . .  M347
      217   XXINFO . . . . . . . . . . . .  334 349
       54   Z-XN-1-1 . . . . . . . . . . .  1054
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    26
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

      343   BAIL-OUT . . . . . . . . . . .  P260
      351   BAIL-OUT-EX. . . . . . . . . .  E260 G345
      346   BAIL-OUT-WRITE . . . . . . . .  G344
      326   BLANK-LINE-PRINT
     1098   CCVS-EXIT
     1099   CCVS-999999. . . . . . . . . .  G1064
      235   CCVS1
      352   CCVS1-EXIT . . . . . . . . . .  G241
      242   CLOSE-FILES. . . . . . . . . .  G1100
      270   COLUMN-NAMES-ROUTINE . . . . .  E240
      251   DE-LETE. . . . . . . . . . . .  P366 P387 P408 P429 P451 P473 P495 P519 P556 P593 P630 P667 P701 P750 P799 P847
                                            P895 P943 P997 P1062
      274   END-ROUTINE. . . . . . . . . .  P243
      278   END-ROUTINE-1
      287   END-ROUTINE-12
      295   END-ROUTINE-13 . . . . . . . .  E243
      276   END-RTN-EXIT
      250   FAIL . . . . . . . . . . . . .  P369 P390 P411 P432 P454 P476 P498 P523 P560 P597 P634 P671 P709 P719 P758 P768
                                            P807 P817 P855 P865 P903 P913 P951 P961 P1003 P1009 P1015 P1021 P1027 P1070 P1080
      328   FAIL-ROUTINE . . . . . . . . .  P259
      342   FAIL-ROUTINE-EX. . . . . . . .  E259 G336 E531 E534 E537 E540 E568 E571 E574 E577 E605 E608 E611 E614 E642 E645
                                            E648 E651 E679 E682 E685 E688 E727 E730 E733 E736 E776 E779 E782 E785 E825 E828
                                            E831 E834 E873 E876 E879 E882 E921 E924 E927 E930 E969 E972 E975 E978 E1035 E1038
                                            E1041 E1044 E1088 E1091 E1094 E1097
      337   FAIL-ROUTINE-WRITE . . . . . .  G330 G331 P531 P534 P537 P540 P568 P571 P574 P577 P605 P608 P611 P614 P642 P645
                                            P648 P651 P679 P682 P685 P688 P727 P730 P733 P736 P776 P779 P782 P785 P825 P828
                                            P831 P834 P873 P876 P879 P882 P921 P924 P927 P930 P969 P972 P975 P978 P1035 P1038
                                            P1041 P1044 P1088 P1091 P1094 P1097
      265   HEAD-ROUTINE . . . . . . . . .  P240
      365   INSP-DELETE-F1-1
      386   INSP-DELETE-F1-2
      407   INSP-DELETE-F1-3
      428   INSP-DELETE-F1-4
      450   INSP-DELETE-F1-5
      472   INSP-DELETE-F1-6
      494   INSP-DELETE-F1-7
      518   INSP-DELETE-F2-1
      555   INSP-DELETE-F2-2
      592   INSP-DELETE-F2-3
      629   INSP-DELETE-F2-4
      666   INSP-DELETE-F2-5
      700   INSP-DELETE-F3-1
      749   INSP-DELETE-F3-2
      798   INSP-DELETE-F3-3
      846   INSP-DELETE-F3-4
      894   INSP-DELETE-F3-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    27
0 Defined   Cross-reference of procedures   References

0     942   INSP-DELETE-F3-6
      996   INSP-DELETE-F3-7
     1061   INSP-DELETE-F3-8
      368   INSP-FAIL-F1-1 . . . . . . . .  G364
      389   INSP-FAIL-F1-2 . . . . . . . .  G385
      410   INSP-FAIL-F1-3 . . . . . . . .  G406
      431   INSP-FAIL-F1-4 . . . . . . . .  G427
      453   INSP-FAIL-F1-5 . . . . . . . .  G449
      475   INSP-FAIL-F1-6 . . . . . . . .  G471
      497   INSP-FAIL-F1-7 . . . . . . . .  G493
      522   INSP-FAIL-F2-1 . . . . . . . .  G517
      559   INSP-FAIL-F2-2 . . . . . . . .  G554
      596   INSP-FAIL-F2-3 . . . . . . . .  G591
      633   INSP-FAIL-F2-4 . . . . . . . .  G628
      670   INSP-FAIL-F2-5 . . . . . . . .  G665
      355   INSP-INIT-F1-1
      376   INSP-INIT-F1-2
      397   INSP-INIT-F1-3
      418   INSP-INIT-F1-4
      439   INSP-INIT-F1-5
      461   INSP-INIT-F1-6
      483   INSP-INIT-F1-7
      505   INSP-INIT-F2-1
      541   INSP-INIT-F2-2 . . . . . . . .  G516 G521
      578   INSP-INIT-F2-3 . . . . . . . .  G553 G558
      615   INSP-INIT-F2-4 . . . . . . . .  G590 G595
      652   INSP-INIT-F2-5 . . . . . . . .  G627 G632
      689   INSP-INIT-F3-1 . . . . . . . .  G664 G669
      737   INSP-INIT-F3-2 . . . . . . . .  G703
      786   INSP-INIT-F3-3 . . . . . . . .  G752
      835   INSP-INIT-F3-4 . . . . . . . .  G801
      883   INSP-INIT-F3-5 . . . . . . . .  G849
      931   INSP-INIT-F3-6 . . . . . . . .  G897
      979   INSP-INIT-F3-7 . . . . . . . .  G945
     1045   INSP-INIT-F3-8 . . . . . . . .  G999
      358   INSP-TEST-F1-1-0
      360   INSP-TEST-F1-1-1
      379   INSP-TEST-F1-2-0
      381   INSP-TEST-F1-2-1
      400   INSP-TEST-F1-3-0
      402   INSP-TEST-F1-3-1
      421   INSP-TEST-F1-4-0
      423   INSP-TEST-F1-4-1
      442   INSP-TEST-F1-5-0
      445   INSP-TEST-F1-5-1
      464   INSP-TEST-F1-6-0
      467   INSP-TEST-F1-6-1
      486   INSP-TEST-F1-7-0
      489   INSP-TEST-F1-7-1
      510   INSP-TEST-F2-1-0
      512   INSP-TEST-F2-1-1
      546   INSP-TEST-F2-2-0
      549   INSP-TEST-F2-2-1
      583   INSP-TEST-F2-3-0
      586   INSP-TEST-F2-3-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    28
0 Defined   Cross-reference of procedures   References

0     620   INSP-TEST-F2-4-0
      623   INSP-TEST-F2-4-1
      657   INSP-TEST-F2-5-0
      660   INSP-TEST-F2-5-1
      696   INSP-TEST-F3-1-0
      744   INSP-TEST-F3-2-0
      793   INSP-TEST-F3-3-0
      842   INSP-TEST-F3-4-0
      890   INSP-TEST-F3-5-0
      938   INSP-TEST-F3-6-0
      987   INSP-TEST-F3-7-0
     1000   INSP-TEST-F3-7-1 . . . . . . .  G995
     1006   INSP-TEST-F3-7-2
     1012   INSP-TEST-F3-7-3
     1018   INSP-TEST-F3-7-4
     1024   INSP-TEST-F3-7-5
     1052   INSP-TEST-F3-8-0
      372   INSP-WRITE-F1-1. . . . . . . .  G363 G367
      393   INSP-WRITE-F1-2. . . . . . . .  G384 G388
      414   INSP-WRITE-F1-3. . . . . . . .  G405 G409
      435   INSP-WRITE-F1-4. . . . . . . .  G426 G430
      457   INSP-WRITE-F1-5. . . . . . . .  G448 G452
      479   INSP-WRITE-F1-6. . . . . . . .  G470 G474
      501   INSP-WRITE-F1-7. . . . . . . .  G492 G496
      248   INSPT
      236   OPEN-FILES
      249   PASS . . . . . . . . . . . . .  P362 P383 P404 P425 P447 P469 P491 P514 P551 P588 P625 P662 P706 P716 P755 P765
                                            P804 P814 P852 P862 P900 P910 P948 P958 P1001 P1007 P1013 P1019 P1025 P1067 P1077
      253   PRINT-DETAIL . . . . . . . . .  P375 P396 P417 P438 P460 P482 P504 P515 P520 P528 P552 P557 P565 P589 P594 P602
                                            P626 P631 P639 P663 P668 P676 P702 P707 P712 P717 P724 P751 P756 P761 P766 P773
                                            P800 P805 P810 P815 P822 P848 P853 P858 P863 P870 P896 P901 P906 P911 P918 P944
                                            P949 P954 P959 P966 P998 P1001 P1004 P1007 P1010 P1013 P1016 P1019 P1022 P1026
                                            P1032 P1063 P1068 P1073 P1078 P1085
      354   SECT-NC115A-001
      246   TERMINATE-CALL
      244   TERMINATE-CCVS
      704   TEST-F3-1-1. . . . . . . . . .  G699
      714   TEST-F3-1-2
      753   TEST-F3-2-1. . . . . . . . . .  G748
      763   TEST-F3-2-2
      802   TEST-F3-3-1. . . . . . . . . .  G797
      812   TEST-F3-3-2
      850   TEST-F3-4-1. . . . . . . . . .  G845
      860   TEST-F3-4-2
      898   TEST-F3-5-1. . . . . . . . . .  G893
      908   TEST-F3-5-2
      946   TEST-F3-6-1. . . . . . . . . .  G941
      956   TEST-F3-6-2
     1065   TEST-F3-8-1. . . . . . . . . .  G1060
     1075   TEST-F3-8-2
      307   WRITE-LINE . . . . . . . . . .  P257 P258 P266 P267 P268 P269 P271 P272 P273 P275 P277 P286 P294 P300 P305 P306
                                            P334 P338 P340 P349
      323   WRT-LN . . . . . . . . . . . .  P313 P314 P315 P316 P317 P318 P319 P322 P327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    29
0 Defined   Cross-reference of programs     References

        3   NC115A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC115A    Date 06/04/2022  Time 11:59:25   Page    30
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC115A:
 *    Source records = 1100
 *    Data Division statements = 101
 *    Procedure Division statements = 748
 *    Generated COBOL statements = 0
 *    Program complexity factor = 761
0End of compilation 1,  program NC115A,  highest severity 0.
0Return code 0
