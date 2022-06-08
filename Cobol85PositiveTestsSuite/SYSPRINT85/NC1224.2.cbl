1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:12   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:12   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1224.2
   000002         000200 PROGRAM-ID.                                                      NC1224.2
   000003         000300     NC122A.                                                      NC1224.2
   000004         000500*                                                              *  NC1224.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1224.2
   000006         000700*                                                              *  NC1224.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1224.2
   000008         000900*                                                              *  NC1224.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1224.2
   000010         001100*                                                              *  NC1224.2
   000011         001300*                                                              *  NC1224.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1224.2
   000013         001500*                                                              *  NC1224.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1224.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1224.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1224.2
   000017         001900*                                                              *  NC1224.2
   000018         002100*                                                                 NC1224.2
   000019         002200*   PROGRAM NC122A TESTS THE USE OF INDEXED IDENTIFIERS USING     NC1224.2
   000020         002300*   FORMATS 1, 2 AND 3 OF THE "INSPECT" STATEMENT.                NC1224.2
   000021         002400*   SINGLE LEVEL AND RELATIVE INDEXING ARE USED.                  NC1224.2
   000022         002500*                                                                 NC1224.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1224.2
   000024         002700 CONFIGURATION SECTION.                                           NC1224.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1224.2
   000026         002900     XXXXX082.                                                    NC1224.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1224.2
   000028         003100     XXXXX083.                                                    NC1224.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1224.2
   000030         003300 FILE-CONTROL.                                                    NC1224.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1224.2 35
   000032         003500     XXXXX055.                                                    NC1224.2
   000033         003600 DATA DIVISION.                                                   NC1224.2
   000034         003700 FILE SECTION.                                                    NC1224.2
   000035         003800 FD  PRINT-FILE.                                                  NC1224.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1224.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1224.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1224.2
   000039         004200 01  WRK-OK.                                                      NC1224.2
   000040         004300   03  WRK-OK-1-20                  PIC X(20).                    NC1224.2
   000041         004400   03  WRK-OK-21-40                 PIC X(20).                    NC1224.2
   000042         004500   03  WRK-OK-41-60                 PIC X(20).                    NC1224.2
   000043         004600   03  WRK-OK-61-80                 PIC X(20).                    NC1224.2
   000044         004700   03  WRK-OK-81-83                 PIC X(3).                     NC1224.2
   000045         004800 01  WRK-ER.                                                      NC1224.2
   000046         004900   03  WRK-ER-1-20                  PIC X(20).                    NC1224.2
   000047         005000   03  WRK-ER-21-40                 PIC X(20).                    NC1224.2
   000048         005100   03  WRK-ER-41-60                 PIC X(20).                    NC1224.2
   000049         005200   03  WRK-ER-61-80                 PIC X(20).                    NC1224.2
   000050         005300   03  WRK-ER-81-83                 PIC X(3).                     NC1224.2
   000051         005400 01  TABLE1.                                                      NC1224.2
   000052         005500     02  TABLE1-REC              PICTURE X(83)                    NC1224.2
   000053         005600                                 OCCURS 4 TIMES                   NC1224.2
   000054         005700                                 INDEXED BY INDEX1.               NC1224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 01  TABLE2.                                                      NC1224.2
   000056         005900     02  WRK-DU-999              PICTURE 999                      NC1224.2
   000057         006000                                 OCCURS 4 TIMES                   NC1224.2
   000058         006100                                 INDEXED BY INDEX2.               NC1224.2
   000059         006200 01  TABLE3.                                                      NC1224.2
   000060         006300     02  TABLE3-SYMBOL           PICTURE X                        NC1224.2
   000061         006400                                 OCCURS 3 TIMES                   NC1224.2
   000062         006500                                 INDEXED BY INDEX3.               NC1224.2
   000063         006600 01  TABLE4.                                                      NC1224.2
   000064         006700     02  TABLE4-LETTER           PICTURE X                        NC1224.2
   000065         006800                                 OCCURS 9 TIMES                   NC1224.2
   000066         006900                                 INDEXED BY INDEX4.               NC1224.2
   000067         007000 01  WC-XN-83  PIC X(83) VALUE                                    NC1224.2
   000068         007100     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1224.2
   000069         007200-    "IDS CAN NOT BE ALL BAD.".                                   NC1224.2
   000070         007300 01  ANS-XN-83-1 PIC X(83) VALUE                                  NC1224.2
   000071         007400     "OH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1224.2
   000072         007500-    "IDS CAN NOT BE ALL BAD.".                                   NC1224.2
   000073         007600 01  ANS-XN-83-2 PIC X(83) VALUE                                  NC1224.2
   000074         007700     "AH YES,AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1224.2
   000075         007800-    "IDS CAN NOT BE ALL BAD.".                                   NC1224.2
   000076         007900 01  ANS-XN-83-3 PIC X(83) VALUE                                  NC1224.2
   000077         008000     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1224.2
   000078         008100-    "IDS CAN NOT BE ALL-BAD.".                                   NC1224.2
   000079         008200 01  ANS-XN-83-4 PIC X(83) VALUE                                  NC1224.2
   000080         008300     "EH YES EH YES W.C. FRITOES HERE. ENYONE WHO HETES DOGS END KNC1224.2
   000081         008400-    "IDS CEN NOT BE ELL BAD.".                                   NC1224.2
   000082         008500 01  ANS-XN-83-5 PIC X(83) VALUE                                  NC1224.2
   000083         008600     "AH YES OH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC1224.2
   000084         008700-    "IDS CAN NOT BE ALL BAD.".                                   NC1224.2
   000085         008800 01  TEST-RESULTS.                                                NC1224.2
   000086         008900     02 FILLER                   PIC X      VALUE SPACE.          NC1224.2 IMP
   000087         009000     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1224.2 IMP
   000088         009100     02 FILLER                   PIC X      VALUE SPACE.          NC1224.2 IMP
   000089         009200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1224.2 IMP
   000090         009300     02 FILLER                   PIC X      VALUE SPACE.          NC1224.2 IMP
   000091         009400     02  PAR-NAME.                                                NC1224.2
   000092         009500       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1224.2 IMP
   000093         009600       03  PARDOT-X              PIC X      VALUE SPACE.          NC1224.2 IMP
   000094         009700       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1224.2 IMP
   000095         009800     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1224.2 IMP
   000096         009900     02 RE-MARK                  PIC X(61).                       NC1224.2
   000097         010000 01  TEST-COMPUTED.                                               NC1224.2
   000098         010100     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1224.2 IMP
   000099         010200     02 FILLER                   PIC X(17)  VALUE                 NC1224.2
   000100         010300            "       COMPUTED=".                                   NC1224.2
   000101         010400     02 COMPUTED-X.                                               NC1224.2
   000102         010500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1224.2 IMP
   000103         010600     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1224.2 102
   000104         010700                                 PIC -9(9).9(9).                  NC1224.2
   000105         010800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1224.2 102
   000106         010900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1224.2 102
   000107         011000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1224.2 102
   000108         011100     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1224.2 102
   000109         011200         04 COMPUTED-18V0                    PIC -9(18).          NC1224.2
   000110         011300         04 FILLER                           PIC X.               NC1224.2
   000111         011400     03 FILLER PIC X(50) VALUE SPACE.                             NC1224.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  TEST-CORRECT.                                                NC1224.2
   000113         011600     02 FILLER PIC X(30) VALUE SPACE.                             NC1224.2 IMP
   000114         011700     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1224.2
   000115         011800     02 CORRECT-X.                                                NC1224.2
   000116         011900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1224.2 IMP
   000117         012000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1224.2 116
   000118         012100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1224.2 116
   000119         012200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1224.2 116
   000120         012300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1224.2 116
   000121         012400     03      CR-18V0 REDEFINES CORRECT-A.                         NC1224.2 116
   000122         012500         04 CORRECT-18V0                     PIC -9(18).          NC1224.2
   000123         012600         04 FILLER                           PIC X.               NC1224.2
   000124         012700     03 FILLER PIC X(2) VALUE SPACE.                              NC1224.2 IMP
   000125         012800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1224.2 IMP
   000126         012900 01  CCVS-C-1.                                                    NC1224.2
   000127         013000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1224.2
   000128         013100-    "SS  PARAGRAPH-NAME                                          NC1224.2
   000129         013200-    "       REMARKS".                                            NC1224.2
   000130         013300     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1224.2 IMP
   000131         013400 01  CCVS-C-2.                                                    NC1224.2
   000132         013500     02 FILLER                     PIC X        VALUE SPACE.      NC1224.2 IMP
   000133         013600     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1224.2
   000134         013700     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1224.2 IMP
   000135         013800     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1224.2
   000136         013900     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1224.2 IMP
   000137         014000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1224.2 IMP
   000138         014100 01  REC-CT                        PIC 99       VALUE ZERO.       NC1224.2 IMP
   000139         014200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1224.2 IMP
   000140         014300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1224.2 IMP
   000141         014400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1224.2 IMP
   000142         014500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1224.2 IMP
   000143         014600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1224.2 IMP
   000144         014700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1224.2 IMP
   000145         014800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1224.2 IMP
   000146         014900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1224.2 IMP
   000147         015000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1224.2 IMP
   000148         015100 01  CCVS-H-1.                                                    NC1224.2
   000149         015200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1224.2 IMP
   000150         015300     02  FILLER                    PIC X(42)    VALUE             NC1224.2
   000151         015400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1224.2
   000152         015500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1224.2 IMP
   000153         015600 01  CCVS-H-2A.                                                   NC1224.2
   000154         015700   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1224.2 IMP
   000155         015800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1224.2
   000156         015900   02  FILLER                        PIC XXXX   VALUE             NC1224.2
   000157         016000     "4.2 ".                                                      NC1224.2
   000158         016100   02  FILLER                        PIC X(28)  VALUE             NC1224.2
   000159         016200            " COPY - NOT FOR DISTRIBUTION".                       NC1224.2
   000160         016300   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1224.2 IMP
   000161         016400                                                                  NC1224.2
   000162         016500 01  CCVS-H-2B.                                                   NC1224.2
   000163         016600   02  FILLER                        PIC X(15)  VALUE             NC1224.2
   000164         016700            "TEST RESULT OF ".                                    NC1224.2
   000165         016800   02  TEST-ID                       PIC X(9).                    NC1224.2
   000166         016900   02  FILLER                        PIC X(4)   VALUE             NC1224.2
   000167         017000            " IN ".                                               NC1224.2
   000168         017100   02  FILLER                        PIC X(12)  VALUE             NC1224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     " HIGH       ".                                              NC1224.2
   000170         017300   02  FILLER                        PIC X(22)  VALUE             NC1224.2
   000171         017400            " LEVEL VALIDATION FOR ".                             NC1224.2
   000172         017500   02  FILLER                        PIC X(58)  VALUE             NC1224.2
   000173         017600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1224.2
   000174         017700 01  CCVS-H-3.                                                    NC1224.2
   000175         017800     02  FILLER                      PIC X(34)  VALUE             NC1224.2
   000176         017900            " FOR OFFICIAL USE ONLY    ".                         NC1224.2
   000177         018000     02  FILLER                      PIC X(58)  VALUE             NC1224.2
   000178         018100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1224.2
   000179         018200     02  FILLER                      PIC X(28)  VALUE             NC1224.2
   000180         018300            "  COPYRIGHT   1985 ".                                NC1224.2
   000181         018400 01  CCVS-E-1.                                                    NC1224.2
   000182         018500     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1224.2 IMP
   000183         018600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1224.2
   000184         018700     02 ID-AGAIN                     PIC X(9).                    NC1224.2
   000185         018800     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1224.2 IMP
   000186         018900 01  CCVS-E-2.                                                    NC1224.2
   000187         019000     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1224.2 IMP
   000188         019100     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1224.2 IMP
   000189         019200     02 CCVS-E-2-2.                                               NC1224.2
   000190         019300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1224.2 IMP
   000191         019400         03 FILLER                   PIC X      VALUE SPACE.      NC1224.2 IMP
   000192         019500         03 ENDER-DESC               PIC X(44)  VALUE             NC1224.2
   000193         019600            "ERRORS ENCOUNTERED".                                 NC1224.2
   000194         019700 01  CCVS-E-3.                                                    NC1224.2
   000195         019800     02  FILLER                      PIC X(22)  VALUE             NC1224.2
   000196         019900            " FOR OFFICIAL USE ONLY".                             NC1224.2
   000197         020000     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1224.2 IMP
   000198         020100     02  FILLER                      PIC X(58)  VALUE             NC1224.2
   000199         020200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1224.2
   000200         020300     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1224.2 IMP
   000201         020400     02 FILLER                       PIC X(15)  VALUE             NC1224.2
   000202         020500             " COPYRIGHT 1985".                                   NC1224.2
   000203         020600 01  CCVS-E-4.                                                    NC1224.2
   000204         020700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1224.2 IMP
   000205         020800     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1224.2
   000206         020900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1224.2 IMP
   000207         021000     02 FILLER                       PIC X(40)  VALUE             NC1224.2
   000208         021100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1224.2
   000209         021200 01  XXINFO.                                                      NC1224.2
   000210         021300     02 FILLER                       PIC X(19)  VALUE             NC1224.2
   000211         021400            "*** INFORMATION ***".                                NC1224.2
   000212         021500     02 INFO-TEXT.                                                NC1224.2
   000213         021600       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1224.2 IMP
   000214         021700       04 XXCOMPUTED                 PIC X(20).                   NC1224.2
   000215         021800       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1224.2 IMP
   000216         021900       04 XXCORRECT                  PIC X(20).                   NC1224.2
   000217         022000     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1224.2
   000218         022100 01  HYPHEN-LINE.                                                 NC1224.2
   000219         022200     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1224.2 IMP
   000220         022300     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1224.2
   000221         022400-    "*****************************************".                 NC1224.2
   000222         022500     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1224.2
   000223         022600-    "******************************".                            NC1224.2
   000224         022700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1224.2
   000225         022800     "NC122A".                                                    NC1224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 PROCEDURE DIVISION.                                              NC1224.2
   000227         023000 CCVS1 SECTION.                                                   NC1224.2
   000228         023100 OPEN-FILES.                                                      NC1224.2
   000229         023200     OPEN     OUTPUT PRINT-FILE.                                  NC1224.2 35
   000230         023300     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1224.2 224 165 224 184
   000231         023400     MOVE    SPACE TO TEST-RESULTS.                               NC1224.2 IMP 85
   000232         023500     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1224.2 257 262
   000233         023600     GO TO CCVS1-EXIT.                                            NC1224.2 344
   000234         023700 CLOSE-FILES.                                                     NC1224.2
   000235         023800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1224.2 266 287 35
   000236         023900 TERMINATE-CCVS.                                                  NC1224.2
   000237         024000     EXIT PROGRAM.                                                NC1224.2
   000238         024100 TERMINATE-CALL.                                                  NC1224.2
   000239         024200     STOP     RUN.                                                NC1224.2
   000240         024300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1224.2 89 141
   000241         024400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1224.2 89 142
   000242         024500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1224.2 89 140
   000243         024600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1224.2 89 139
   000244         024700     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1224.2 96
   000245         024800 PRINT-DETAIL.                                                    NC1224.2
   000246         024900     IF REC-CT NOT EQUAL TO ZERO                                  NC1224.2 138 IMP
   000247      1  025000             MOVE "." TO PARDOT-X                                 NC1224.2 93
   000248      1  025100             MOVE REC-CT TO DOTVALUE.                             NC1224.2 138 94
   000249         025200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1224.2 85 36 299
   000250         025300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1224.2 89 299
   000251      1  025400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1224.2 320 334
   000252      1  025500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1224.2 335 343
   000253         025600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1224.2 IMP 89 IMP 101
   000254         025700     MOVE SPACE TO CORRECT-X.                                     NC1224.2 IMP 115
   000255         025800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1224.2 138 IMP IMP 91
   000256         025900     MOVE     SPACE TO RE-MARK.                                   NC1224.2 IMP 96
   000257         026000 HEAD-ROUTINE.                                                    NC1224.2
   000258         026100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1224.2 148 37 299
   000259         026200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1224.2 153 37 299
   000260         026300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1224.2 162 37 299
   000261         026400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1224.2 174 37 299
   000262         026500 COLUMN-NAMES-ROUTINE.                                            NC1224.2
   000263         026600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1224.2 126 37 299
   000264         026700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1224.2 131 37 299
   000265         026800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1224.2 218 37 299
   000266         026900 END-ROUTINE.                                                     NC1224.2
   000267         027000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1224.2 218 37 299
   000268         027100 END-RTN-EXIT.                                                    NC1224.2
   000269         027200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1224.2 181 37 299
   000270         027300 END-ROUTINE-1.                                                   NC1224.2
   000271         027400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1224.2 140 144 141
   000272         027500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1224.2 144 139 144
   000273         027600      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1224.2 142 144
   000274         027700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1224.2
   000275         027800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1224.2 142 204
   000276         027900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1224.2 144 206
   000277         028000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1224.2 203 189
   000278         028100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1224.2 186 37 299
   000279         028200  END-ROUTINE-12.                                                 NC1224.2
   000280         028300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1224.2 192
   000281         028400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1224.2 140 IMP
   000282      1  028500         MOVE "NO " TO ERROR-TOTAL                                NC1224.2 190
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600         ELSE                                                     NC1224.2
   000284      1  028700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1224.2 140 190
   000285         028800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1224.2 186 37
   000286         028900     PERFORM WRITE-LINE.                                          NC1224.2 299
   000287         029000 END-ROUTINE-13.                                                  NC1224.2
   000288         029100     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1224.2 139 IMP
   000289      1  029200         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1224.2 190
   000290      1  029300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1224.2 139 190
   000291         029400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1224.2 192
   000292         029500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1224.2 186 37 299
   000293         029600      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1224.2 141 IMP
   000294      1  029700          MOVE "NO " TO ERROR-TOTAL                               NC1224.2 190
   000295      1  029800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1224.2 141 190
   000296         029900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1224.2 192
   000297         030000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1224.2 186 37 299
   000298         030100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1224.2 194 37 299
   000299         030200 WRITE-LINE.                                                      NC1224.2
   000300         030300     ADD 1 TO RECORD-COUNT.                                       NC1224.2 146
   000301         030400     IF RECORD-COUNT GREATER 42                                   NC1224.2 146
   000302      1  030500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1224.2 37 145
   000303      1  030600         MOVE SPACE TO DUMMY-RECORD                               NC1224.2 IMP 37
   000304      1  030700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1224.2 37
   000305      1  030800         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1224.2 148 37 315
   000306      1  030900         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1224.2 153 37 315
   000307      1  031000         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1224.2 162 37 315
   000308      1  031100         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1224.2 174 37 315
   000309      1  031200         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1224.2 126 37 315
   000310      1  031300         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1224.2 131 37 315
   000311      1  031400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1224.2 218 37 315
   000312      1  031500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1224.2 145 37
   000313      1  031600         MOVE ZERO TO RECORD-COUNT.                               NC1224.2 IMP 146
   000314         031700     PERFORM WRT-LN.                                              NC1224.2 315
   000315         031800 WRT-LN.                                                          NC1224.2
   000316         031900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1224.2 37
   000317         032000     MOVE SPACE TO DUMMY-RECORD.                                  NC1224.2 IMP 37
   000318         032100 BLANK-LINE-PRINT.                                                NC1224.2
   000319         032200     PERFORM WRT-LN.                                              NC1224.2 315
   000320         032300 FAIL-ROUTINE.                                                    NC1224.2
   000321         032400     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1224.2 101 IMP
   000322      1  032500            GO TO FAIL-ROUTINE-WRITE.                             NC1224.2 329
   000323         032600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1224.2 115 IMP 329
   000324         032700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1224.2 147 217
   000325         032800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1224.2 212
   000326         032900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1224.2 209 37 299
   000327         033000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1224.2 IMP 217
   000328         033100     GO TO  FAIL-ROUTINE-EX.                                      NC1224.2 334
   000329         033200 FAIL-ROUTINE-WRITE.                                              NC1224.2
   000330         033300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1224.2 97 36 299
   000331         033400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1224.2 147 125
   000332         033500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1224.2 112 36 299
   000333         033600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1224.2 IMP 125
   000334         033700 FAIL-ROUTINE-EX. EXIT.                                           NC1224.2
   000335         033800 BAIL-OUT.                                                        NC1224.2
   000336         033900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1224.2 102 IMP 338
   000337         034000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1224.2 116 IMP 343
   000338         034100 BAIL-OUT-WRITE.                                                  NC1224.2
   000339         034200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1224.2 116 216 102 214
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1224.2 147 217
   000341         034400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1224.2 209 37 299
   000342         034500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1224.2 IMP 217
   000343         034600 BAIL-OUT-EX. EXIT.                                               NC1224.2
   000344         034700 CCVS1-EXIT.                                                      NC1224.2
   000345         034800     EXIT.                                                        NC1224.2
   000346         034900 BUILD-TABLE1.                                                    NC1224.2
   000347         035000     MOVE WC-XN-83 TO TABLE1-REC (1).                             NC1224.2 67 52
   000348         035100     MOVE WC-XN-83 TO TABLE1-REC (2).                             NC1224.2 67 52
   000349         035200     MOVE WC-XN-83 TO TABLE1-REC (3).                             NC1224.2 67 52
   000350         035300     MOVE WC-XN-83 TO TABLE1-REC (4).                             NC1224.2 67 52
   000351         035400 BUILD-TABLE3.                                                    NC1224.2
   000352         035500     MOVE " " TO TABLE3-SYMBOL (1).                               NC1224.2 60
   000353         035600     MOVE "," TO TABLE3-SYMBOL (2).                               NC1224.2 60
   000354         035700     MOVE "-" TO TABLE3-SYMBOL (3).                               NC1224.2 60
   000355         035800 BUILD-TABLE4.                                                    NC1224.2
   000356         035900     MOVE "A" TO TABLE4-LETTER (1).                               NC1224.2 64
   000357         036000     MOVE "D" TO TABLE4-LETTER (2).                               NC1224.2 64
   000358         036100     MOVE "G" TO TABLE4-LETTER (3).                               NC1224.2 64
   000359         036200     MOVE "H" TO TABLE4-LETTER (4).                               NC1224.2 64
   000360         036300     MOVE "L" TO TABLE4-LETTER (5).                               NC1224.2 64
   000361         036400     MOVE "O" TO TABLE4-LETTER (6).                               NC1224.2 64
   000362         036500     MOVE "Y" TO TABLE4-LETTER (7).                               NC1224.2 64
   000363         036600     MOVE "S" TO TABLE4-LETTER (8).                               NC1224.2 64
   000364         036700     MOVE "Z" TO TABLE4-LETTER (9).                               NC1224.2 64
   000365         036800 IND-INIT-GF-1.                                                   NC1224.2
   000366         036900     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000367         037000     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000368         037100     SET INDEX1 TO 1.                                             NC1224.2 54
   000369         037200     SET INDEX2 TO 1.                                             NC1224.2 58
   000370         037300 IND-TEST-GF-1-0.                                                 NC1224.2
   000371         037400     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC1224.2 52 54 56 58
   000372         037500        FOR CHARACTERS.                                           NC1224.2
   000373         037600 IND-TEST-GF-1-1.                                                 NC1224.2
   000374         037700     IF WRK-DU-999 (INDEX2) EQUAL TO 83                           NC1224.2 56 58
   000375      1  037800        PERFORM PASS                                              NC1224.2 241
   000376      1  037900        GO TO IND-WRITE-GF-1.                                     NC1224.2 385
   000377         038000     GO TO IND-FAIL-GF-1.                                         NC1224.2 381
   000378         038100 IND-DELETE-GF-1.                                                 NC1224.2
   000379         038200     PERFORM DE-LETE.                                             NC1224.2 243
   000380         038300     GO TO IND-WRITE-GF-1.                                        NC1224.2 385
   000381         038400 IND-FAIL-GF-1.                                                   NC1224.2
   000382         038500     PERFORM FAIL.                                                NC1224.2 242
   000383         038600     MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N.                      NC1224.2 56 58 103
   000384         038700     MOVE 83 TO CORRECT-N.                                        NC1224.2 117
   000385         038800 IND-WRITE-GF-1.                                                  NC1224.2
   000386         038900     MOVE "IND-TEST-GF-1" TO PAR-NAME.                            NC1224.2 91
   000387         039000     MOVE "TALLY FOR CHARACTERS" TO FEATURE.                      NC1224.2 87
   000388         039100     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000389         039200 IND-INIT-GF-2.                                                   NC1224.2
   000390         039300     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000391         039400     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000392         039500     SET INDEX1 TO 2.                                             NC1224.2 54
   000393         039600     SET INDEX2 TO 2.                                             NC1224.2 58
   000394         039700     MOVE ZERO TO WRK-DU-999 (INDEX2).                            NC1224.2 IMP 56 58
   000395         039800 IND-TEST-GF-2-0.                                                 NC1224.2
   000396         039900     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC1224.2 52 54 56 58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000        FOR ALL "A".                                              NC1224.2
   000398         040100 IND-TEST-GF-2-1.                                                 NC1224.2
   000399         040200     IF WRK-DU-999 (INDEX2) EQUAL TO 8                            NC1224.2 56 58
   000400      1  040300        PERFORM PASS                                              NC1224.2 241
   000401      1  040400        GO TO IND-WRITE-GF-2.                                     NC1224.2 410
   000402         040500     GO TO IND-FAIL-GF-2.                                         NC1224.2 406
   000403         040600 IND-DELETE-GF-2.                                                 NC1224.2
   000404         040700     PERFORM DE-LETE.                                             NC1224.2 243
   000405         040800     GO TO IND-WRITE-GF-2.                                        NC1224.2 410
   000406         040900 IND-FAIL-GF-2.                                                   NC1224.2
   000407         041000     PERFORM FAIL.                                                NC1224.2 242
   000408         041100     MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N.                      NC1224.2 56 58 103
   000409         041200     MOVE 8 TO CORRECT-N.                                         NC1224.2 117
   000410         041300 IND-WRITE-GF-2.                                                  NC1224.2
   000411         041400     MOVE "IND-TEST-GF-2" TO PAR-NAME.                            NC1224.2 91
   000412         041500     MOVE "TALLY FOR LITERAL" TO FEATURE.                         NC1224.2 87
   000413         041600     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000414         041700 IND-INIT-GF-3.                                                   NC1224.2
   000415         041800     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000416         041900     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000417         042000     SET INDEX1 TO 3.                                             NC1224.2 54
   000418         042100     SET INDEX2 TO 3.                                             NC1224.2 58
   000419         042200     MOVE ZERO TO WRK-DU-999 (INDEX2).                            NC1224.2 IMP 56 58
   000420         042300 IND-TEST-GF-3-0.                                                 NC1224.2
   000421         042400     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC1224.2 52 54 56 58
   000422         042500        FOR ALL SPACE.                                            NC1224.2 IMP
   000423         042600 IND-TEST-GF-3-1.                                                 NC1224.2
   000424         042700     IF WRK-DU-999 (INDEX2) EQUAL TO 17                           NC1224.2 56 58
   000425      1  042800        PERFORM PASS                                              NC1224.2 241
   000426      1  042900        GO TO IND-WRITE-GF-3.                                     NC1224.2 435
   000427         043000     GO TO IND-FAIL-GF-3.                                         NC1224.2 431
   000428         043100 IND-DELETE-GF-3.                                                 NC1224.2
   000429         043200     PERFORM DE-LETE.                                             NC1224.2 243
   000430         043300     GO TO IND-WRITE-GF-3.                                        NC1224.2 435
   000431         043400 IND-FAIL-GF-3.                                                   NC1224.2
   000432         043500     PERFORM FAIL.                                                NC1224.2 242
   000433         043600     MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N.                      NC1224.2 56 58 103
   000434         043700     MOVE 17 TO CORRECT-N.                                        NC1224.2 117
   000435         043800 IND-WRITE-GF-3.                                                  NC1224.2
   000436         043900     MOVE "IND-TEST-GF-3" TO PAR-NAME.                            NC1224.2 91
   000437         044000     MOVE "TALLY FOR ALL SPACE" TO FEATURE.                       NC1224.2 87
   000438         044100     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000439         044200 IND-INIT-GF-4.                                                   NC1224.2
   000440         044300     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000441         044400     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000442         044500     SET INDEX1 TO 4.                                             NC1224.2 54
   000443         044600     SET INDEX2 TO 4.                                             NC1224.2 58
   000444         044700     MOVE ZERO TO WRK-DU-999 (INDEX2).                            NC1224.2 IMP 56 58
   000445         044800 IND-TEST-GF-4-0.                                                 NC1224.2
   000446         044900     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC1224.2 52 54 56 58
   000447         045000        FOR LEADING "A".                                          NC1224.2
   000448         045100 IND-TEST-GF-4-1.                                                 NC1224.2
   000449         045200     IF WRK-DU-999 (INDEX2) EQUAL TO 1                            NC1224.2 56 58
   000450      1  045300        PERFORM PASS                                              NC1224.2 241
   000451      1  045400        GO TO IND-WRITE-GF-4.                                     NC1224.2 460
   000452         045500     GO TO IND-FAIL-GF-4.                                         NC1224.2 456
   000453         045600 IND-DELETE-GF-4.                                                 NC1224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     PERFORM DE-LETE.                                             NC1224.2 243
   000455         045800     GO TO IND-WRITE-GF-4.                                        NC1224.2 460
   000456         045900 IND-FAIL-GF-4.                                                   NC1224.2
   000457         046000     PERFORM FAIL.                                                NC1224.2 242
   000458         046100     MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N.                      NC1224.2 56 58 103
   000459         046200     MOVE 1 TO CORRECT-N.                                         NC1224.2 117
   000460         046300 IND-WRITE-GF-4.                                                  NC1224.2
   000461         046400     MOVE "IND-TEST-GF-4" TO PAR-NAME.                            NC1224.2 91
   000462         046500     MOVE "TALLY LEADING LIT." TO FEATURE.                        NC1224.2 87
   000463         046600     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000464         046700 IND-INIT-GF-5.                                                   NC1224.2
   000465         046800     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000466         046900     SET INDEX1 TO 1.                                             NC1224.2 54
   000467         047000     SET INDEX2 TO 2.                                             NC1224.2 58
   000468         047100     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000469         047200     MOVE ZERO TO WRK-DU-999 (INDEX2 + 1).                        NC1224.2 IMP 56 58
   000470         047300 IND-TEST-GF-5-0.                                                 NC1224.2
   000471         047400     INSPECT TABLE1-REC (INDEX1 + 1) TALLYING                     NC1224.2 52 54
   000472         047500        WRK-DU-999 (INDEX2 + 1)                                   NC1224.2 56 58
   000473         047600        FOR CHARACTERS AFTER "W".                                 NC1224.2
   000474         047700 IND-TEST-GF-5-1.                                                 NC1224.2
   000475         047800     IF WRK-DU-999 (INDEX2 + 1) EQUAL TO 68                       NC1224.2 56 58
   000476      1  047900        PERFORM PASS                                              NC1224.2 241
   000477      1  048000        GO TO IND-WRITE-GF-5.                                     NC1224.2 486
   000478         048100     GO TO IND-FAIL-GF-5.                                         NC1224.2 482
   000479         048200 IND-DELETE-GF-5.                                                 NC1224.2
   000480         048300     PERFORM DE-LETE.                                             NC1224.2 243
   000481         048400     GO TO IND-WRITE-GF-5.                                        NC1224.2 486
   000482         048500 IND-FAIL-GF-5.                                                   NC1224.2
   000483         048600     PERFORM FAIL.                                                NC1224.2 242
   000484         048700     MOVE WRK-DU-999 (INDEX2 + 1) TO COMPUTED-N.                  NC1224.2 56 58 103
   000485         048800     MOVE 68 TO CORRECT-N.                                        NC1224.2 117
   000486         048900 IND-WRITE-GF-5.                                                  NC1224.2
   000487         049000     MOVE "IND-TEST-GF-5" TO PAR-NAME.                            NC1224.2 91
   000488         049100     MOVE "FOR CHARS AFTER LIT." TO FEATURE.                      NC1224.2 87
   000489         049200     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000490         049300 IND-INIT-GF-6.                                                   NC1224.2
   000491         049400     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000492         049500     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000493         049600     SET INDEX1 TO 3.                                             NC1224.2 54
   000494         049700     SET INDEX2 TO 4.                                             NC1224.2 58
   000495         049800     MOVE ZERO TO WRK-DU-999 (INDEX2 - 2).                        NC1224.2 IMP 56 58
   000496         049900 IND-TEST-GF-6-0.                                                 NC1224.2
   000497         050000     INSPECT TABLE1-REC (INDEX1 - 1)                              NC1224.2 52 54
   000498         050100        TALLYING WRK-DU-999 (INDEX2 - 2)                          NC1224.2 56 58
   000499         050200        FOR ALL " " BEFORE INITIAL "W".                           NC1224.2
   000500         050300 IND-TEST-GF-6-1.                                                 NC1224.2
   000501         050400     IF WRK-DU-999 (INDEX2 - 2) EQUAL TO 4                        NC1224.2 56 58
   000502      1  050500        PERFORM PASS                                              NC1224.2 241
   000503      1  050600        GO TO IND-WRITE-GF-6.                                     NC1224.2 512
   000504         050700     GO TO IND-FAIL-GF-6.                                         NC1224.2 508
   000505         050800 IND-DELETE-GF-6.                                                 NC1224.2
   000506         050900     PERFORM DE-LETE.                                             NC1224.2 243
   000507         051000     GO TO IND-WRITE-GF-6.                                        NC1224.2 512
   000508         051100 IND-FAIL-GF-6.                                                   NC1224.2
   000509         051200     PERFORM FAIL.                                                NC1224.2 242
   000510         051300     MOVE WRK-DU-999 (INDEX2 - 2) TO COMPUTED-N.                  NC1224.2 56 58 103
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE 4 TO CORRECT-N.                                         NC1224.2 117
   000512         051500 IND-WRITE-GF-6.                                                  NC1224.2
   000513         051600     MOVE "IND-TEST-GF-6" TO PAR-NAME.                            NC1224.2 91
   000514         051700     MOVE "ALL BEFORE INITIAL" TO FEATURE.                        NC1224.2 87
   000515         051800     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000516         051900 IND-INIT-GF-7.                                                   NC1224.2
   000517         052000     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000518         052100     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000519         052200     SET INDEX1 TO 1.                                             NC1224.2 54
   000520         052300     SET INDEX2 TO 1.                                             NC1224.2 58
   000521         052400     MOVE ZERO TO WRK-DU-999 (INDEX2).                            NC1224.2 IMP 56 58
   000522         052500 IND-TEST-GF-7-0.                                                 NC1224.2
   000523         052600     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC1224.2 52 54 56 58
   000524         052700        FOR LEADING "Y" AFTER INITIAL SPACE.                      NC1224.2 IMP
   000525         052800 IND-TEST-GF-7-1.                                                 NC1224.2
   000526         052900     IF WRK-DU-999 (INDEX2) EQUAL TO 1                            NC1224.2 56 58
   000527      1  053000        PERFORM PASS                                              NC1224.2 241
   000528      1  053100        GO TO IND-WRITE-GF-7.                                     NC1224.2 537
   000529         053200     GO TO IND-FAIL-GF-7.                                         NC1224.2 533
   000530         053300 IND-DELETE-GF-7.                                                 NC1224.2
   000531         053400     PERFORM DE-LETE.                                             NC1224.2 243
   000532         053500     GO TO IND-WRITE-GF-7.                                        NC1224.2 537
   000533         053600 IND-FAIL-GF-7.                                                   NC1224.2
   000534         053700     PERFORM FAIL.                                                NC1224.2 242
   000535         053800     MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N.                      NC1224.2 56 58 103
   000536         053900     MOVE 1 TO CORRECT-N.                                         NC1224.2 117
   000537         054000 IND-WRITE-GF-7.                                                  NC1224.2
   000538         054100     MOVE "IND-TEST-GF-7" TO PAR-NAME.                            NC1224.2 91
   000539         054200     MOVE "LEAD. LIT. INITIAL" TO FEATURE.                        NC1224.2 87
   000540         054300     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000541         054400 IND-INIT-GF-8.                                                   NC1224.2
   000542         054500     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000543         054600     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000544         054700     SET INDEX1 TO 1.                                             NC1224.2 54
   000545         054800 IND-TEST-GF-8-0.                                                 NC1224.2
   000546         054900     INSPECT TABLE1-REC (INDEX1) REPLACING CHARACTERS BY SPACE.   NC1224.2 52 54 IMP
   000547         055000 IND-TEST-GF-8-1.                                                 NC1224.2
   000548         055100     IF TABLE1-REC (INDEX1) EQUAL TO SPACE                        NC1224.2 52 54 IMP
   000549      1  055200        PERFORM PASS                                              NC1224.2 241
   000550      1  055300        GO TO IND-WRITE-GF-8.                                     NC1224.2 559
   000551         055400     GO TO IND-FAIL-GF-8.                                         NC1224.2 555
   000552         055500 IND-DELETE-GF-8.                                                 NC1224.2
   000553         055600     PERFORM DE-LETE.                                             NC1224.2 243
   000554         055700     GO TO IND-WRITE-GF-8.                                        NC1224.2 559
   000555         055800 IND-FAIL-GF-8.                                                   NC1224.2
   000556         055900     PERFORM FAIL.                                                NC1224.2 242
   000557         056000     MOVE TABLE1-REC (INDEX1) TO COMPUTED-A.                      NC1224.2 52 54 102
   000558         056100     MOVE "SPACES" TO CORRECT-A.                                  NC1224.2 116
   000559         056200 IND-WRITE-GF-8.                                                  NC1224.2
   000560         056300     MOVE "IND-TEST-GF-8" TO PAR-NAME.                            NC1224.2 91
   000561         056400     MOVE "REP. CHARS BY SPACE" TO FEATURE.                       NC1224.2 87
   000562         056500     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000563         056600 IND-INIT-GF-9.                                                   NC1224.2
   000564         056700     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000565         056800     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000566         056900     SET INDEX1 TO 2.                                             NC1224.2 54
   000567         057000 IND-TEST-GF-9-0.                                                 NC1224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     INSPECT TABLE1-REC (INDEX1) REPLACING CHARACTERS             NC1224.2 52 54
   000569         057200        BY "O" BEFORE INITIAL "H".                                NC1224.2
   000570         057300 IND-TEST-GF-9-1.                                                 NC1224.2
   000571         057400     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-1                  NC1224.2 52 54 70
   000572      1  057500        PERFORM PASS                                              NC1224.2 241
   000573      1  057600        GO TO IND-WRITE-GF-9.                                     NC1224.2 597
   000574         057700     GO TO IND-FAIL-GF-9.                                         NC1224.2 578
   000575         057800 IND-DELETE-GF-9.                                                 NC1224.2
   000576         057900     PERFORM DE-LETE.                                             NC1224.2 243
   000577         058000     GO TO IND-WRITE-GF-9.                                        NC1224.2 597
   000578         058100 IND-FAIL-GF-9.                                                   NC1224.2
   000579         058200     PERFORM FAIL.                                                NC1224.2 242
   000580         058300     MOVE    TABLE1-REC (INDEX1) TO WRK-ER.                       NC1224.2 52 54 45
   000581         058400     MOVE    ANS-XN-83-1 TO WRK-OK.                               NC1224.2 70 39
   000582         058500     MOVE    WRK-OK-1-20 TO CORRECT-X.                            NC1224.2 40 115
   000583         058600     MOVE    WRK-ER-1-20 TO COMPUTED-X.                           NC1224.2 46 101
   000584         058700     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000585         058800     MOVE    WRK-OK-21-40 TO CORRECT-X.                           NC1224.2 41 115
   000586         058900     MOVE    WRK-ER-21-40 TO COMPUTED-X.                          NC1224.2 47 101
   000587         059000     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000588         059100     MOVE    WRK-OK-41-60 TO CORRECT-X.                           NC1224.2 42 115
   000589         059200     MOVE    WRK-ER-41-60 TO COMPUTED-X.                          NC1224.2 48 101
   000590         059300     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000591         059400     MOVE    WRK-OK-61-80 TO CORRECT-X.                           NC1224.2 43 115
   000592         059500     MOVE    WRK-ER-61-80 TO COMPUTED-X.                          NC1224.2 49 101
   000593         059600     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000594         059700     MOVE    WRK-OK-81-83 TO CORRECT-X.                           NC1224.2 44 115
   000595         059800     MOVE    WRK-ER-81-83 TO COMPUTED-X.                          NC1224.2 50 101
   000596         059900     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000597         060000 IND-WRITE-GF-9.                                                  NC1224.2
   000598         060100     MOVE "IND-TEST-GF-9" TO PAR-NAME.                            NC1224.2 91
   000599         060200     MOVE "CHARS BEFORE INITIAL" TO FEATURE.                      NC1224.2 87
   000600         060300     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000601         060400 IND-INIT-GF-10.                                                  NC1224.2
   000602         060500     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000603         060600     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000604         060700     SET INDEX1 TO 3.                                             NC1224.2 54
   000605         060800     SET INDEX3 TO 1.                                             NC1224.2 62
   000606         060900     SET INDEX4 TO 8.                                             NC1224.2 66
   000607         061000 IND-TEST-GF-10-0.                                                NC1224.2
   000608         061100     INSPECT TABLE1-REC (INDEX1) REPLACING LEADING                NC1224.2 52 54
   000609         061200        TABLE3-SYMBOL (INDEX3) BY TABLE3-SYMBOL (INDEX3 + 1)      NC1224.2 60 62 60 62
   000610         061300        AFTER INITIAL TABLE4-LETTER (INDEX4).                     NC1224.2 64 66
   000611         061400 IND-TEST-GF-10-1.                                                NC1224.2
   000612         061500     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-2                  NC1224.2 52 54 73
   000613      1  061600        PERFORM PASS                                              NC1224.2 241
   000614      1  061700        GO TO IND-WRITE-GF-10.                                    NC1224.2 638
   000615         061800     GO TO IND-FAIL-GF-10.                                        NC1224.2 619
   000616         061900 IND-DELETE-GF-10.                                                NC1224.2
   000617         062000     PERFORM DE-LETE.                                             NC1224.2 243
   000618         062100     GO TO IND-WRITE-GF-10.                                       NC1224.2 638
   000619         062200 IND-FAIL-GF-10.                                                  NC1224.2
   000620         062300     PERFORM FAIL.                                                NC1224.2 242
   000621         062400     MOVE    TABLE1-REC (INDEX1) TO WRK-ER.                       NC1224.2 52 54 45
   000622         062500     MOVE    ANS-XN-83-2 TO WRK-OK.                               NC1224.2 73 39
   000623         062600     MOVE    WRK-OK-1-20 TO CORRECT-X.                            NC1224.2 40 115
   000624         062700     MOVE    WRK-ER-1-20 TO COMPUTED-X.                           NC1224.2 46 101
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000626         062900     MOVE    WRK-OK-21-40 TO CORRECT-X.                           NC1224.2 41 115
   000627         063000     MOVE    WRK-ER-21-40 TO COMPUTED-X.                          NC1224.2 47 101
   000628         063100     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000629         063200     MOVE    WRK-OK-41-60 TO CORRECT-X.                           NC1224.2 42 115
   000630         063300     MOVE    WRK-ER-41-60 TO COMPUTED-X.                          NC1224.2 48 101
   000631         063400     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000632         063500     MOVE    WRK-OK-61-80 TO CORRECT-X.                           NC1224.2 43 115
   000633         063600     MOVE    WRK-ER-61-80 TO COMPUTED-X.                          NC1224.2 49 101
   000634         063700     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000635         063800     MOVE    WRK-OK-81-83 TO CORRECT-X.                           NC1224.2 44 115
   000636         063900     MOVE    WRK-ER-81-83 TO COMPUTED-X.                          NC1224.2 50 101
   000637         064000     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000638         064100 IND-WRITE-GF-10.                                                 NC1224.2
   000639         064200     MOVE "IND-TEST-GF-10" TO PAR-NAME.                           NC1224.2 91
   000640         064300     MOVE "LEAD. AFTER INIT. ID" TO FEATURE.                      NC1224.2 87
   000641         064400     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000642         064500 IND-INIT-GF-11.                                                  NC1224.2
   000643         064600     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000644         064700     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000645         064800     SET INDEX1 TO 4.                                             NC1224.2 54
   000646         064900     SET INDEX4 TO 6.                                             NC1224.2 66
   000647         065000 IND-TEST-GF-11-0.                                                NC1224.2
   000648         065100     INSPECT TABLE1-REC (INDEX1) REPLACING FIRST "A"              NC1224.2 52 54
   000649         065200        BY TABLE4-LETTER (INDEX4) BEFORE INITIAL "H".             NC1224.2 64 66
   000650         065300 IND-TEST-GF-11-1.                                                NC1224.2
   000651         065400     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-1                  NC1224.2 52 54 70
   000652      1  065500        PERFORM PASS                                              NC1224.2 241
   000653      1  065600        GO TO IND-WRITE-GF-11.                                    NC1224.2 677
   000654         065700     GO TO IND-FAIL-GF-11.                                        NC1224.2 658
   000655         065800 IND-DELETE-GF-11.                                                NC1224.2
   000656         065900     PERFORM DE-LETE.                                             NC1224.2 243
   000657         066000     GO TO IND-WRITE-GF-11.                                       NC1224.2 677
   000658         066100 IND-FAIL-GF-11.                                                  NC1224.2
   000659         066200     PERFORM FAIL.                                                NC1224.2 242
   000660         066300     MOVE    TABLE1-REC (INDEX1) TO WRK-ER.                       NC1224.2 52 54 45
   000661         066400     MOVE    ANS-XN-83-1 TO WRK-OK.                               NC1224.2 70 39
   000662         066500     MOVE    WRK-OK-1-20 TO CORRECT-X.                            NC1224.2 40 115
   000663         066600     MOVE    WRK-ER-1-20 TO COMPUTED-X.                           NC1224.2 46 101
   000664         066700     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000665         066800     MOVE    WRK-OK-21-40 TO CORRECT-X.                           NC1224.2 41 115
   000666         066900     MOVE    WRK-ER-21-40 TO COMPUTED-X.                          NC1224.2 47 101
   000667         067000     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000668         067100     MOVE    WRK-OK-41-60 TO CORRECT-X.                           NC1224.2 42 115
   000669         067200     MOVE    WRK-ER-41-60 TO COMPUTED-X.                          NC1224.2 48 101
   000670         067300     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000671         067400     MOVE    WRK-OK-61-80 TO CORRECT-X.                           NC1224.2 43 115
   000672         067500     MOVE    WRK-ER-61-80 TO COMPUTED-X.                          NC1224.2 49 101
   000673         067600     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000674         067700     MOVE    WRK-OK-81-83 TO CORRECT-X.                           NC1224.2 44 115
   000675         067800     MOVE    WRK-ER-81-83 TO COMPUTED-X.                          NC1224.2 50 101
   000676         067900     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000677         068000 IND-WRITE-GF-11.                                                 NC1224.2
   000678         068100     MOVE "IND-TEST-GF-11" TO PAR-NAME.                           NC1224.2 91
   000679         068200     MOVE "FIRST BY ID BEFORE" TO FEATURE.                        NC1224.2 87
   000680         068300     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000681         068400 IND-INIT-GF-12.                                                  NC1224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000683         068600     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000684         068700     SET INDEX1 TO 1.                                             NC1224.2 54
   000685         068800     SET INDEX3 TO 1.                                             NC1224.2 62
   000686         068900     SET INDEX4 TO 5.                                             NC1224.2 66
   000687         069000 IND-TEST-GF-12-0.                                                NC1224.2
   000688         069100     INSPECT TABLE1-REC (INDEX1 + 1) REPLACING ALL                NC1224.2 52 54
   000689         069200      TABLE3-SYMBOL (INDEX3) BY "-" AFTER TABLE4-LETTER (INDEX4). NC1224.2 60 62 64 66
   000690         069300 IND-TEST-GF-12-1.                                                NC1224.2
   000691         069400     IF TABLE1-REC (INDEX1 + 1) EQUAL TO ANS-XN-83-3              NC1224.2 52 54 76
   000692      1  069500        PERFORM PASS                                              NC1224.2 241
   000693      1  069600        GO TO IND-WRITE-GF-12.                                    NC1224.2 717
   000694         069700     GO TO IND-FAIL-GF-12.                                        NC1224.2 698
   000695         069800 IND-DELETE-GF-12.                                                NC1224.2
   000696         069900     PERFORM DE-LETE.                                             NC1224.2 243
   000697         070000     GO TO IND-WRITE-GF-12.                                       NC1224.2 717
   000698         070100 IND-FAIL-GF-12.                                                  NC1224.2
   000699         070200     PERFORM FAIL.                                                NC1224.2 242
   000700         070300     MOVE    TABLE1-REC (INDEX1 + 1) TO WRK-ER.                   NC1224.2 52 54 45
   000701         070400     MOVE    ANS-XN-83-3 TO WRK-OK.                               NC1224.2 76 39
   000702         070500     MOVE    WRK-OK-1-20 TO CORRECT-X.                            NC1224.2 40 115
   000703         070600     MOVE    WRK-ER-1-20 TO COMPUTED-X.                           NC1224.2 46 101
   000704         070700     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000705         070800     MOVE    WRK-OK-21-40 TO CORRECT-X.                           NC1224.2 41 115
   000706         070900     MOVE    WRK-ER-21-40 TO COMPUTED-X.                          NC1224.2 47 101
   000707         071000     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000708         071100     MOVE    WRK-OK-41-60 TO CORRECT-X.                           NC1224.2 42 115
   000709         071200     MOVE    WRK-ER-41-60 TO COMPUTED-X.                          NC1224.2 48 101
   000710         071300     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000711         071400     MOVE    WRK-OK-61-80 TO CORRECT-X.                           NC1224.2 43 115
   000712         071500     MOVE    WRK-ER-61-80 TO COMPUTED-X.                          NC1224.2 49 101
   000713         071600     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000714         071700     MOVE    WRK-OK-81-83 TO CORRECT-X.                           NC1224.2 44 115
   000715         071800     MOVE    WRK-ER-81-83 TO COMPUTED-X.                          NC1224.2 50 101
   000716         071900     PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.             NC1224.2 329 334
   000717         072000 IND-WRITE-GF-12.                                                 NC1224.2
   000718         072100     MOVE "IND-TEST-GF-12" TO PAR-NAME.                           NC1224.2 91
   000719         072200     MOVE "ALL ID BY LIT. AFTER" TO FEATURE.                      NC1224.2 87
   000720         072300     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000721         072400 IND-INIT-GF-13.                                                  NC1224.2
   000722         072500     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000723         072600     MOVE "IND-TEST-GF-13" TO PAR-NAME.                           NC1224.2 91
   000724         072700     MOVE "TALLY REPLACE CHARS" TO FEATURE.                       NC1224.2 87
   000725         072800     MOVE 1 TO REC-CT.                                            NC1224.2 138
   000726         072900     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000727         073000     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000728         073100     SET INDEX1 TO 1.                                             NC1224.2 54
   000729         073200     SET INDEX2 TO 1.                                             NC1224.2 58
   000730         073300     MOVE 0 TO WRK-DU-999 (INDEX2).                               NC1224.2 56 58
   000731         073400 IND-TEST-GF-13-0.                                                NC1224.2
   000732         073500     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC1224.2 52 54 56 58
   000733         073600        FOR CHARACTERS REPLACING CHARACTERS BY " ".               NC1224.2
   000734         073700     GO TO IND-TEST-GF-13-1.                                      NC1224.2 739
   000735         073800 IND-DELETE-GF-13.                                                NC1224.2
   000736         073900     PERFORM DE-LETE.                                             NC1224.2 243
   000737         074000     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000738         074100     GO TO IND-INIT-GF-14.                                        NC1224.2 771
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200 IND-TEST-GF-13-1.                                                NC1224.2
   000740         074300     IF WRK-DU-999 (INDEX2) EQUAL TO 83                           NC1224.2 56 58
   000741      1  074400        PERFORM PASS                                              NC1224.2 241
   000742      1  074500        PERFORM PRINT-DETAIL                                      NC1224.2 245
   000743      1  074600        ELSE PERFORM FAIL                                         NC1224.2 242
   000744      1  074700        MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N                    NC1224.2 56 58 103
   000745      1  074800        MOVE 83 TO CORRECT-N                                      NC1224.2 117
   000746      1  074900        PERFORM PRINT-DETAIL.                                     NC1224.2 245
   000747         075000     ADD 1 TO REC-CT.                                             NC1224.2 138
   000748         075100 IND-TEST-GF-13-2.                                                NC1224.2
   000749         075200     IF TABLE1-REC (INDEX1) EQUAL TO SPACE                        NC1224.2 52 54 IMP
   000750      1  075300        PERFORM PASS                                              NC1224.2 241
   000751      1  075400        PERFORM PRINT-DETAIL                                      NC1224.2 245
   000752         075500     ELSE                                                         NC1224.2
   000753      1  075600         PERFORM FAIL                                             NC1224.2 242
   000754      1  075700         MOVE    TABLE1-REC (INDEX1) TO WRK-ER                    NC1224.2 52 54 45
   000755      1  075800         MOVE    SPACES TO WRK-OK                                 NC1224.2 IMP 39
   000756      1  075900         MOVE    WRK-OK-1-20 TO CORRECT-X                         NC1224.2 40 115
   000757      1  076000         MOVE    WRK-ER-1-20 TO COMPUTED-X                        NC1224.2 46 101
   000758      1  076100         PERFORM PRINT-DETAIL                                     NC1224.2 245
   000759      1  076200         MOVE    WRK-OK-21-40 TO CORRECT-X                        NC1224.2 41 115
   000760      1  076300         MOVE    WRK-ER-21-40 TO COMPUTED-X                       NC1224.2 47 101
   000761      1  076400         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000762      1  076500         MOVE    WRK-OK-41-60 TO CORRECT-X                        NC1224.2 42 115
   000763      1  076600         MOVE    WRK-ER-41-60 TO COMPUTED-X                       NC1224.2 48 101
   000764      1  076700         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000765      1  076800         MOVE    WRK-OK-61-80 TO CORRECT-X                        NC1224.2 43 115
   000766      1  076900         MOVE    WRK-ER-61-80 TO COMPUTED-X                       NC1224.2 49 101
   000767      1  077000         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000768      1  077100         MOVE    WRK-OK-81-83 TO CORRECT-X                        NC1224.2 44 115
   000769      1  077200         MOVE    WRK-ER-81-83 TO COMPUTED-X                       NC1224.2 50 101
   000770      1  077300         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.         NC1224.2 329 334
   000771         077400 IND-INIT-GF-14.                                                  NC1224.2
   000772         077500     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000773         077600     MOVE "IND-TEST-GF-14" TO PAR-NAME.                           NC1224.2 91
   000774         077700     MOVE "LIT. BY BEFORE INIT." TO FEATURE.                      NC1224.2 87
   000775         077800     MOVE 1 TO REC-CT.                                            NC1224.2 138
   000776         077900     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000777         078000     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000778         078100     SET INDEX1 TO 4.                                             NC1224.2 54
   000779         078200     SET INDEX2 TO 2.                                             NC1224.2 58
   000780         078300     SET INDEX4 TO 5.                                             NC1224.2 66
   000781         078400 IND-TEST-GF-14-0.                                                NC1224.2
   000782         078500     INSPECT TABLE1-REC (INDEX1 - 2) TALLYING                     NC1224.2 52 54
   000783         078600        WRK-DU-999 (INDEX2 + 2) FOR CHARACTERS                    NC1224.2 56 58
   000784         078700        AFTER TABLE4-LETTER (INDEX4 - 1) REPLACING ALL            NC1224.2 64 66
   000785         078800        "A" BY "E" BEFORE INITIAL TABLE4-LETTER (INDEX4).         NC1224.2 64 66
   000786         078900     GO TO IND-TEST-GF-14-1.                                      NC1224.2 791
   000787         079000 IND-DELETE-GF-14.                                                NC1224.2
   000788         079100     PERFORM DE-LETE.                                             NC1224.2 243
   000789         079200     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000790         079300     GO TO IND-INIT-GF-15.                                        NC1224.2 823
   000791         079400 IND-TEST-GF-14-1.                                                NC1224.2
   000792         079500     IF WRK-DU-999 (INDEX2 + 2) EQUAL TO 81                       NC1224.2 56 58
   000793      1  079600        PERFORM PASS                                              NC1224.2 241
   000794      1  079700        PERFORM PRINT-DETAIL                                      NC1224.2 245
   000795      1  079800        ELSE PERFORM FAIL                                         NC1224.2 242
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796      1  079900        MOVE WRK-DU-999 (INDEX2 + 2) TO COMPUTED-N                NC1224.2 56 58 103
   000797      1  080000        MOVE 6 TO CORRECT-N                                       NC1224.2 117
   000798      1  080100        PERFORM PRINT-DETAIL.                                     NC1224.2 245
   000799         080200     ADD 1 TO REC-CT.                                             NC1224.2 138
   000800         080300 IND-TEST-GF-14-2.                                                NC1224.2
   000801         080400     IF TABLE1-REC (INDEX1 - 2) EQUAL TO ANS-XN-83-4              NC1224.2 52 54 79
   000802      1  080500        PERFORM PASS                                              NC1224.2 241
   000803      1  080600        PERFORM PRINT-DETAIL                                      NC1224.2 245
   000804         080700     ELSE                                                         NC1224.2
   000805      1  080800        PERFORM FAIL                                              NC1224.2 242
   000806      1  080900         MOVE    TABLE1-REC (INDEX1 - 2) TO WRK-ER                NC1224.2 52 54 45
   000807      1  081000         MOVE    ANS-XN-83-4 TO WRK-OK                            NC1224.2 79 39
   000808      1  081100         MOVE    WRK-OK-1-20 TO CORRECT-X                         NC1224.2 40 115
   000809      1  081200         MOVE    WRK-ER-1-20 TO COMPUTED-X                        NC1224.2 46 101
   000810      1  081300         PERFORM PRINT-DETAIL                                     NC1224.2 245
   000811      1  081400         MOVE    WRK-OK-21-40 TO CORRECT-X                        NC1224.2 41 115
   000812      1  081500         MOVE    WRK-ER-21-40 TO COMPUTED-X                       NC1224.2 47 101
   000813      1  081600         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000814      1  081700         MOVE    WRK-OK-41-60 TO CORRECT-X                        NC1224.2 42 115
   000815      1  081800         MOVE    WRK-ER-41-60 TO COMPUTED-X                       NC1224.2 48 101
   000816      1  081900         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000817      1  082000         MOVE    WRK-OK-61-80 TO CORRECT-X                        NC1224.2 43 115
   000818      1  082100         MOVE    WRK-ER-61-80 TO COMPUTED-X                       NC1224.2 49 101
   000819      1  082200         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000820      1  082300         MOVE    WRK-OK-81-83 TO CORRECT-X                        NC1224.2 44 115
   000821      1  082400         MOVE    WRK-ER-81-83 TO COMPUTED-X                       NC1224.2 50 101
   000822      1  082500         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.         NC1224.2 329 334
   000823         082600 IND-INIT-GF-15.                                                  NC1224.2
   000824         082700     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000825         082800     MOVE "IND-TEST-GF-15" TO PAR-NAME.                           NC1224.2 91
   000826         082900     MOVE "REPL. FIRST AFTER" TO FEATURE.                         NC1224.2 87
   000827         083000     MOVE 1 TO REC-CT.                                            NC1224.2 138
   000828         083100     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000829         083200     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000830         083300     SET INDEX1 TO 1.                                             NC1224.2 54
   000831         083400     SET INDEX2 TO 1.                                             NC1224.2 58
   000832         083500     SET INDEX4 TO 4.                                             NC1224.2 66
   000833         083600     MOVE 0 TO WRK-DU-999 (INDEX2).                               NC1224.2 56 58
   000834         083700 IND-TEST-GF-15-0.                                                NC1224.2
   000835         083800     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC1224.2 52 54 56 58
   000836         083900        FOR ALL "A" BEFORE TABLE4-LETTER (INDEX4 + 1)             NC1224.2 64 66
   000837         084000        REPLACING FIRST TABLE4-LETTER (INDEX4 - 3)                NC1224.2 64 66
   000838         084100        BY "O" AFTER INITIAL TABLE4-LETTER (INDEX4).              NC1224.2 64 66
   000839         084200     GO TO IND-TEST-GF-15-1.                                      NC1224.2 844
   000840         084300 IND-DELETE-GF-15.                                                NC1224.2
   000841         084400     PERFORM DE-LETE.                                             NC1224.2 243
   000842         084500     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000843         084600     GO TO IND-INIT-GF-16.                                        NC1224.2 876
   000844         084700 IND-TEST-GF-15-1.                                                NC1224.2
   000845         084800     IF WRK-DU-999 (INDEX2) EQUAL TO 7                            NC1224.2 56 58
   000846      1  084900        PERFORM PASS                                              NC1224.2 241
   000847      1  085000        PERFORM PRINT-DETAIL                                      NC1224.2 245
   000848      1  085100        ELSE PERFORM FAIL                                         NC1224.2 242
   000849      1  085200        MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N                    NC1224.2 56 58 103
   000850      1  085300        MOVE 7 TO CORRECT-N                                       NC1224.2 117
   000851      1  085400        PERFORM PRINT-DETAIL.                                     NC1224.2 245
   000852         085500     ADD 1 TO REC-CT.                                             NC1224.2 138
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600 IND-TEST-GF-15-2.                                                NC1224.2
   000854         085700     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-5                  NC1224.2 52 54 82
   000855      1  085800        PERFORM PASS                                              NC1224.2 241
   000856      1  085900        PERFORM PRINT-DETAIL                                      NC1224.2 245
   000857         086000        ELSE                                                      NC1224.2
   000858      1  086100         PERFORM FAIL                                             NC1224.2 242
   000859      1  086200         MOVE    TABLE1-REC (INDEX1) TO WRK-ER                    NC1224.2 52 54 45
   000860      1  086300         MOVE    ANS-XN-83-5 TO WRK-OK                            NC1224.2 82 39
   000861      1  086400         MOVE    WRK-OK-1-20 TO CORRECT-X                         NC1224.2 40 115
   000862      1  086500         MOVE    WRK-ER-1-20 TO COMPUTED-X                        NC1224.2 46 101
   000863      1  086600         PERFORM PRINT-DETAIL                                     NC1224.2 245
   000864      1  086700         MOVE    WRK-OK-21-40 TO CORRECT-X                        NC1224.2 41 115
   000865      1  086800         MOVE    WRK-ER-21-40 TO COMPUTED-X                       NC1224.2 47 101
   000866      1  086900         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000867      1  087000         MOVE    WRK-OK-41-60 TO CORRECT-X                        NC1224.2 42 115
   000868      1  087100         MOVE    WRK-ER-41-60 TO COMPUTED-X                       NC1224.2 48 101
   000869      1  087200         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000870      1  087300         MOVE    WRK-OK-61-80 TO CORRECT-X                        NC1224.2 43 115
   000871      1  087400         MOVE    WRK-ER-61-80 TO COMPUTED-X                       NC1224.2 49 101
   000872      1  087500         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000873      1  087600         MOVE    WRK-OK-81-83 TO CORRECT-X                        NC1224.2 44 115
   000874      1  087700         MOVE    WRK-ER-81-83 TO COMPUTED-X                       NC1224.2 50 101
   000875      1  087800         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.         NC1224.2 329 334
   000876         087900 IND-INIT-GF-16.                                                  NC1224.2
   000877         088000     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000878         088100     MOVE "IND-TEST-GF-16" TO PAR-NAME.                           NC1224.2 91
   000879         088200     MOVE "FOR LEADING" TO FEATURE.                               NC1224.2 87
   000880         088300     MOVE 1 TO REC-CT.                                            NC1224.2 138
   000881         088400     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000882         088500     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000883         088600     SET INDEX1 TO 2.                                             NC1224.2 54
   000884         088700     SET INDEX2 TO 2.                                             NC1224.2 58
   000885         088800     SET INDEX4 TO 1.                                             NC1224.2 66
   000886         088900     MOVE 0 TO WRK-DU-999 (INDEX2).                               NC1224.2 56 58
   000887         089000 IND-TEST-GF-16-0.                                                NC1224.2
   000888         089100     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC1224.2 52 54 56 58
   000889         089200        FOR LEADING TABLE4-LETTER (INDEX4) REPLACING              NC1224.2 64 66
   000890         089300        LEADING TABLE4-LETTER (INDEX4) BY "O".                    NC1224.2 64 66
   000891         089400     GO TO IND-TEST-GF-16-1.                                      NC1224.2 896
   000892         089500 IND-DELETE-GF-16.                                                NC1224.2
   000893         089600     PERFORM DE-LETE.                                             NC1224.2 243
   000894         089700     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000895         089800     GO TO IND-INIT-GF-17.                                        NC1224.2 928
   000896         089900 IND-TEST-GF-16-1.                                                NC1224.2
   000897         090000     IF WRK-DU-999 (INDEX2) EQUAL TO 1                            NC1224.2 56 58
   000898      1  090100        PERFORM PASS                                              NC1224.2 241
   000899      1  090200        PERFORM PRINT-DETAIL                                      NC1224.2 245
   000900      1  090300        ELSE PERFORM FAIL                                         NC1224.2 242
   000901      1  090400        MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N                    NC1224.2 56 58 103
   000902      1  090500        MOVE 1 TO CORRECT-N                                       NC1224.2 117
   000903      1  090600        PERFORM PRINT-DETAIL.                                     NC1224.2 245
   000904         090700     ADD 1 TO REC-CT.                                             NC1224.2 138
   000905         090800 IND-TEST-GF-16-2.                                                NC1224.2
   000906         090900     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-1                  NC1224.2 52 54 70
   000907      1  091000        PERFORM PASS                                              NC1224.2 241
   000908      1  091100        PERFORM PRINT-DETAIL                                      NC1224.2 245
   000909         091200        ELSE                                                      NC1224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910      1  091300         PERFORM FAIL                                             NC1224.2 242
   000911      1  091400         MOVE    TABLE1-REC (INDEX1) TO WRK-ER                    NC1224.2 52 54 45
   000912      1  091500         MOVE    ANS-XN-83-1 TO WRK-OK                            NC1224.2 70 39
   000913      1  091600         MOVE    WRK-OK-1-20 TO CORRECT-X                         NC1224.2 40 115
   000914      1  091700         MOVE    WRK-ER-1-20 TO COMPUTED-X                        NC1224.2 46 101
   000915      1  091800         PERFORM PRINT-DETAIL                                     NC1224.2 245
   000916      1  091900         MOVE    WRK-OK-21-40 TO CORRECT-X                        NC1224.2 41 115
   000917      1  092000         MOVE    WRK-ER-21-40 TO COMPUTED-X                       NC1224.2 47 101
   000918      1  092100         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000919      1  092200         MOVE    WRK-OK-41-60 TO CORRECT-X                        NC1224.2 42 115
   000920      1  092300         MOVE    WRK-ER-41-60 TO COMPUTED-X                       NC1224.2 48 101
   000921      1  092400         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000922      1  092500         MOVE    WRK-OK-61-80 TO CORRECT-X                        NC1224.2 43 115
   000923      1  092600         MOVE    WRK-ER-61-80 TO COMPUTED-X                       NC1224.2 49 101
   000924      1  092700         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000925      1  092800         MOVE    WRK-OK-81-83 TO CORRECT-X                        NC1224.2 44 115
   000926      1  092900         MOVE    WRK-ER-81-83 TO COMPUTED-X                       NC1224.2 50 101
   000927      1  093000         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.         NC1224.2 329 334
   000928         093100 IND-INIT-GF-17.                                                  NC1224.2
   000929         093200     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000930         093300     MOVE "IND-TEST-GF-17" TO PAR-NAME.                           NC1224.2 91
   000931         093400     MOVE "LIT. BY AFTER INIT." TO FEATURE.                       NC1224.2 87
   000932         093500     MOVE 1 TO REC-CT.                                            NC1224.2 138
   000933         093600     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000934         093700     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000935         093800     SET INDEX1 TO 3.                                             NC1224.2 54
   000936         093900     SET INDEX2 TO 3.                                             NC1224.2 58
   000937         094000     SET INDEX4 TO 7.                                             NC1224.2 66
   000938         094100     MOVE 0 TO WRK-DU-999 (INDEX2).                               NC1224.2 56 58
   000939         094200 IND-TEST-GF-17-0.                                                NC1224.2
   000940         094300     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC1224.2 52 54 56 58
   000941         094400        FOR ALL "A" REPLACING FIRST "A" BY "O"                    NC1224.2
   000942         094500        AFTER INITIAL TABLE4-LETTER (INDEX4).                     NC1224.2 64 66
   000943         094600     GO TO IND-TEST-GF-17-1.                                      NC1224.2 948
   000944         094700 IND-DELETE-GF-17.                                                NC1224.2
   000945         094800     PERFORM DE-LETE.                                             NC1224.2 243
   000946         094900     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   000947         095000     GO TO IND-INIT-GF-18.                                        NC1224.2 980
   000948         095100 IND-TEST-GF-17-1.                                                NC1224.2
   000949         095200     IF WRK-DU-999 (INDEX2) EQUAL TO 8                            NC1224.2 56 58
   000950      1  095300        PERFORM PASS                                              NC1224.2 241
   000951      1  095400        PERFORM PRINT-DETAIL                                      NC1224.2 245
   000952      1  095500        ELSE PERFORM FAIL                                         NC1224.2 242
   000953      1  095600        MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N                    NC1224.2 56 58 103
   000954      1  095700        MOVE 8 TO CORRECT-N                                       NC1224.2 117
   000955      1  095800        PERFORM PRINT-DETAIL.                                     NC1224.2 245
   000956         095900     ADD 1 TO REC-CT.                                             NC1224.2 138
   000957         096000 IND-TEST-GF-17-2.                                                NC1224.2
   000958         096100     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-5                  NC1224.2 52 54 82
   000959      1  096200        PERFORM PASS                                              NC1224.2 241
   000960      1  096300        PERFORM PRINT-DETAIL                                      NC1224.2 245
   000961         096400        ELSE                                                      NC1224.2
   000962      1  096500         PERFORM FAIL                                             NC1224.2 242
   000963      1  096600         MOVE    TABLE1-REC (INDEX1) TO WRK-ER                    NC1224.2 52 54 45
   000964      1  096700         MOVE    ANS-XN-83-1 TO WRK-OK                            NC1224.2 70 39
   000965      1  096800         MOVE    WRK-OK-1-20 TO CORRECT-X                         NC1224.2 40 115
   000966      1  096900         MOVE    WRK-ER-1-20 TO COMPUTED-X                        NC1224.2 46 101
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967      1  097000         PERFORM PRINT-DETAIL                                     NC1224.2 245
   000968      1  097100         MOVE    WRK-OK-21-40 TO CORRECT-X                        NC1224.2 41 115
   000969      1  097200         MOVE    WRK-ER-21-40 TO COMPUTED-X                       NC1224.2 47 101
   000970      1  097300         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000971      1  097400         MOVE    WRK-OK-41-60 TO CORRECT-X                        NC1224.2 42 115
   000972      1  097500         MOVE    WRK-ER-41-60 TO COMPUTED-X                       NC1224.2 48 101
   000973      1  097600         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000974      1  097700         MOVE    WRK-OK-61-80 TO CORRECT-X                        NC1224.2 43 115
   000975      1  097800         MOVE    WRK-ER-61-80 TO COMPUTED-X                       NC1224.2 49 101
   000976      1  097900         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   000977      1  098000         MOVE    WRK-OK-81-83 TO CORRECT-X                        NC1224.2 44 115
   000978      1  098100         MOVE    WRK-ER-81-83 TO COMPUTED-X                       NC1224.2 50 101
   000979      1  098200         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.         NC1224.2 329 334
   000980         098300 IND-INIT-GF-18.                                                  NC1224.2
   000981         098400     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1224.2 147
   000982         098500     MOVE "IND-TEST-GF-18" TO PAR-NAME.                           NC1224.2 91
   000983         098600     MOVE "CHARS AFTER ALL BEF." TO FEATURE.                      NC1224.2 87
   000984         098700     MOVE 1 TO REC-CT.                                            NC1224.2 138
   000985         098800     PERFORM BUILD-TABLE1.                                        NC1224.2 346
   000986         098900     MOVE ZERO TO TABLE2.                                         NC1224.2 IMP 55
   000987         099000     SET INDEX1 TO 4.                                             NC1224.2 54
   000988         099100     SET INDEX2 TO 4.                                             NC1224.2 58
   000989         099200     SET INDEX4 TO 1.                                             NC1224.2 66
   000990         099300     MOVE 0 TO WRK-DU-999 (INDEX2).                               NC1224.2 56 58
   000991         099400 IND-TEST-GF-18-0.                                                NC1224.2
   000992         099500     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC1224.2 52 54 56 58
   000993         099600        FOR CHARACTERS AFTER TABLE4-LETTER (INDEX4)               NC1224.2 64 66
   000994         099700        REPLACING ALL "A" BY "O"                                  NC1224.2
   000995         099800        BEFORE TABLE4-LETTER (INDEX4 + 3).                        NC1224.2 64 66
   000996         099900     GO TO IND-TEST-GF-18-1.                                      NC1224.2 1001
   000997         100000 IND-DELETE-GF-18.                                                NC1224.2
   000998         100100     PERFORM DE-LETE.                                             NC1224.2 243
   000999         100200     PERFORM PRINT-DETAIL.                                        NC1224.2 245
   001000         100300     GO TO CCVS-999999.                                           NC1224.2 1034
   001001         100400 IND-TEST-GF-18-1.                                                NC1224.2
   001002         100500     IF WRK-DU-999 (INDEX2) EQUAL TO 82                           NC1224.2 56 58
   001003      1  100600        PERFORM PASS                                              NC1224.2 241
   001004      1  100700        PERFORM PRINT-DETAIL                                      NC1224.2 245
   001005      1  100800        ELSE PERFORM FAIL                                         NC1224.2 242
   001006      1  100900        MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N                    NC1224.2 56 58 103
   001007      1  101000        MOVE 82 TO CORRECT-N                                      NC1224.2 117
   001008      1  101100        PERFORM PRINT-DETAIL.                                     NC1224.2 245
   001009         101200     ADD 1 TO REC-CT.                                             NC1224.2 138
   001010         101300 IND-TEST-GF-18-2.                                                NC1224.2
   001011         101400     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-1                  NC1224.2 52 54 70
   001012      1  101500        PERFORM PASS                                              NC1224.2 241
   001013      1  101600        PERFORM PRINT-DETAIL                                      NC1224.2 245
   001014         101700        ELSE                                                      NC1224.2
   001015      1  101800         PERFORM FAIL                                             NC1224.2 242
   001016      1  101900         MOVE    TABLE1-REC (INDEX1) TO WRK-ER                    NC1224.2 52 54 45
   001017      1  102000         MOVE    ANS-XN-83-1 TO WRK-OK                            NC1224.2 70 39
   001018      1  102100         MOVE    WRK-OK-1-20 TO CORRECT-X                         NC1224.2 40 115
   001019      1  102200         MOVE    WRK-ER-1-20 TO COMPUTED-X                        NC1224.2 46 101
   001020      1  102300         PERFORM PRINT-DETAIL                                     NC1224.2 245
   001021      1  102400         MOVE    WRK-OK-21-40 TO CORRECT-X                        NC1224.2 41 115
   001022      1  102500         MOVE    WRK-ER-21-40 TO COMPUTED-X                       NC1224.2 47 101
   001023      1  102600         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024      1  102700         MOVE    WRK-OK-41-60 TO CORRECT-X                        NC1224.2 42 115
   001025      1  102800         MOVE    WRK-ER-41-60 TO COMPUTED-X                       NC1224.2 48 101
   001026      1  102900         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   001027      1  103000         MOVE    WRK-OK-61-80 TO CORRECT-X                        NC1224.2 43 115
   001028      1  103100         MOVE    WRK-ER-61-80 TO COMPUTED-X                       NC1224.2 49 101
   001029      1  103200         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX          NC1224.2 329 334
   001030      1  103300         MOVE    WRK-OK-81-83 TO CORRECT-X                        NC1224.2 44 115
   001031      1  103400         MOVE    WRK-ER-81-83 TO COMPUTED-X                       NC1224.2 50 101
   001032      1  103500         PERFORM FAIL-ROUTINE-WRITE THRU FAIL-ROUTINE-EX.         NC1224.2 329 334
   001033         103600 CCVS-EXIT SECTION.                                               NC1224.2
   001034         103700 CCVS-999999.                                                     NC1224.2
   001035         103800     GO TO CLOSE-FILES.                                           NC1224.2 234
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    22
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       70   ANS-XN-83-1. . . . . . . . . .  571 581 651 661 906 912 964 1011 1017
       73   ANS-XN-83-2. . . . . . . . . .  612 622
       76   ANS-XN-83-3. . . . . . . . . .  691 701
       79   ANS-XN-83-4. . . . . . . . . .  801 807
       82   ANS-XN-83-5. . . . . . . . . .  854 860 958
      147   ANSI-REFERENCE . . . . . . . .  324 331 340 M366 M390 M415 M440 M465 M491 M517 M542 M564 M602 M643 M682 M722
                                            M772 M824 M877 M929 M981
      126   CCVS-C-1 . . . . . . . . . . .  263 309
      131   CCVS-C-2 . . . . . . . . . . .  264 310
      181   CCVS-E-1 . . . . . . . . . . .  269
      186   CCVS-E-2 . . . . . . . . . . .  278 285 292 297
      189   CCVS-E-2-2 . . . . . . . . . .  M277
      194   CCVS-E-3 . . . . . . . . . . .  298
      203   CCVS-E-4 . . . . . . . . . . .  277
      204   CCVS-E-4-1 . . . . . . . . . .  M275
      206   CCVS-E-4-2 . . . . . . . . . .  M276
      148   CCVS-H-1 . . . . . . . . . . .  258 305
      153   CCVS-H-2A. . . . . . . . . . .  259 306
      162   CCVS-H-2B. . . . . . . . . . .  260 307
      174   CCVS-H-3 . . . . . . . . . . .  261 308
      224   CCVS-PGM-ID. . . . . . . . . .  230 230
      108   CM-18V0
      102   COMPUTED-A . . . . . . . . . .  103 105 106 107 108 336 339 M557
      103   COMPUTED-N . . . . . . . . . .  M383 M408 M433 M458 M484 M510 M535 M744 M796 M849 M901 M953 M1006
      101   COMPUTED-X . . . . . . . . . .  M253 321 M583 M586 M589 M592 M595 M624 M627 M630 M633 M636 M663 M666 M669 M672
                                            M675 M703 M706 M709 M712 M715 M757 M760 M763 M766 M769 M809 M812 M815 M818 M821
                                            M862 M865 M868 M871 M874 M914 M917 M920 M923 M926 M966 M969 M972 M975 M978 M1019
                                            M1022 M1025 M1028 M1031
      105   COMPUTED-0V18
      107   COMPUTED-14V4
      109   COMPUTED-18V0
      106   COMPUTED-4V14
      125   COR-ANSI-REFERENCE . . . . . .  M331 M333
      116   CORRECT-A. . . . . . . . . . .  117 118 119 120 121 337 339 M558
      117   CORRECT-N. . . . . . . . . . .  M384 M409 M434 M459 M485 M511 M536 M745 M797 M850 M902 M954 M1007
      115   CORRECT-X. . . . . . . . . . .  M254 323 M582 M585 M588 M591 M594 M623 M626 M629 M632 M635 M662 M665 M668 M671
                                            M674 M702 M705 M708 M711 M714 M756 M759 M762 M765 M768 M808 M811 M814 M817 M820
                                            M861 M864 M867 M870 M873 M913 M916 M919 M922 M925 M965 M968 M971 M974 M977 M1018
                                            M1021 M1024 M1027 M1030
      118   CORRECT-0V18
      120   CORRECT-14V4
      122   CORRECT-18V0
      119   CORRECT-4V14
      121   CR-18V0
      139   DELETE-COUNTER . . . . . . . .  M243 272 288 290
       94   DOTVALUE . . . . . . . . . . .  M248
      145   DUMMY-HOLD . . . . . . . . . .  M302 312
       37   DUMMY-RECORD . . . . . . . . .  M258 M259 M260 M261 M263 M264 M265 M267 M269 M278 M285 M292 M297 M298 302 M303
                                            304 M305 M306 M307 M308 M309 M310 M311 M312 316 M317 M326 M341
      192   ENDER-DESC . . . . . . . . . .  M280 M291 M296
      140   ERROR-COUNTER. . . . . . . . .  M242 271 281 284
      144   ERROR-HOLD . . . . . . . . . .  M271 M272 M272 M273 276
      190   ERROR-TOTAL. . . . . . . . . .  M282 M284 M289 M290 M294 M295
       87   FEATURE. . . . . . . . . . . .  M387 M412 M437 M462 M488 M514 M539 M561 M599 M640 M679 M719 M724 M774 M826 M879
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    23
0 Defined   Cross-reference of data names   References

0                                           M931 M983
      218   HYPHEN-LINE. . . . . . . . . .  265 267 311
      184   ID-AGAIN . . . . . . . . . . .  M230
       54   INDEX1 . . . . . . . . . . . .  M368 371 M392 396 M417 421 M442 446 M466 471 M493 497 M519 523 M544 546 548 557
                                            M566 568 571 580 M604 608 612 621 M645 648 651 660 M684 688 691 700 M728 732
                                            749 754 M778 782 801 806 M830 835 854 859 M883 888 906 911 M935 940 958 963 M987
                                            992 1011 1016
       58   INDEX2 . . . . . . . . . . . .  M369 371 374 383 M393 394 396 399 408 M418 419 421 424 433 M443 444 446 449 458
                                            M467 469 472 475 484 M494 495 498 501 510 M520 521 523 526 535 M729 730 732 740
                                            744 M779 783 792 796 M831 833 835 845 849 M884 886 888 897 901 M936 938 940 949
                                            953 M988 990 992 1002 1006
       62   INDEX3 . . . . . . . . . . . .  M605 609 609 M685 689
       66   INDEX4 . . . . . . . . . . . .  M606 610 M646 649 M686 689 M780 784 785 M832 836 837 838 M885 889 890 M937 942
                                            M989 993 995
      217   INF-ANSI-REFERENCE . . . . . .  M324 M327 M340 M342
      212   INFO-TEXT. . . . . . . . . . .  M325
      141   INSPECT-COUNTER. . . . . . . .  M240 271 293 295
       89   P-OR-F . . . . . . . . . . . .  M240 M241 M242 M243 250 M253
       91   PAR-NAME . . . . . . . . . . .  M255 M386 M411 M436 M461 M487 M513 M538 M560 M598 M639 M678 M718 M723 M773 M825
                                            M878 M930 M982
       93   PARDOT-X . . . . . . . . . . .  M247
      142   PASS-COUNTER . . . . . . . . .  M241 273 275
       35   PRINT-FILE . . . . . . . . . .  31 229 235
       36   PRINT-REC. . . . . . . . . . .  M249 M330 M332
       96   RE-MARK. . . . . . . . . . . .  M244 M256
      138   REC-CT . . . . . . . . . . . .  246 248 255 M725 M747 M775 M799 M827 M852 M880 M904 M932 M956 M984 M1009
      137   REC-SKL-SUB
      146   RECORD-COUNT . . . . . . . . .  M300 301 M313
       51   TABLE1
       52   TABLE1-REC . . . . . . . . . .  M347 M348 M349 M350 371 396 421 446 471 497 523 M546 548 557 M568 571 580 M608
                                            612 621 M648 651 660 M688 691 700 M732 749 754 M782 801 806 M835 854 859 M888
                                            906 911 M940 958 963 M992 1011 1016
       55   TABLE2 . . . . . . . . . . . .  M367 M391 M416 M441 M468 M492 M518 M727 M777 M829 M882 M934 M986
       59   TABLE3
       60   TABLE3-SYMBOL. . . . . . . . .  M352 M353 M354 609 609 689
       63   TABLE4
       64   TABLE4-LETTER. . . . . . . . .  M356 M357 M358 M359 M360 M361 M362 M363 M364 610 649 689 784 785 836 837 838
                                            889 890 942 993 995
       97   TEST-COMPUTED. . . . . . . . .  330
      112   TEST-CORRECT . . . . . . . . .  332
      165   TEST-ID. . . . . . . . . . . .  M230
       85   TEST-RESULTS . . . . . . . . .  M231 249
      143   TOTAL-ERROR
       67   WC-XN-83 . . . . . . . . . . .  347 348 349 350
       56   WRK-DU-999 . . . . . . . . . .  M371 374 383 M394 M396 399 408 M419 M421 424 433 M444 M446 449 458 M469 M472
                                            475 484 M495 M498 501 510 M521 M523 526 535 M730 M732 740 744 M783 792 796 M833
                                            M835 845 849 M886 M888 897 901 M938 M940 949 953 M990 M992 1002 1006
       45   WRK-ER . . . . . . . . . . . .  M580 M621 M660 M700 M754 M806 M859 M911 M963 M1016
       46   WRK-ER-1-20. . . . . . . . . .  583 624 663 703 757 809 862 914 966 1019
       47   WRK-ER-21-40 . . . . . . . . .  586 627 666 706 760 812 865 917 969 1022
       48   WRK-ER-41-60 . . . . . . . . .  589 630 669 709 763 815 868 920 972 1025
       49   WRK-ER-61-80 . . . . . . . . .  592 633 672 712 766 818 871 923 975 1028
       50   WRK-ER-81-83 . . . . . . . . .  595 636 675 715 769 821 874 926 978 1031
       39   WRK-OK . . . . . . . . . . . .  M581 M622 M661 M701 M755 M807 M860 M912 M964 M1017
       40   WRK-OK-1-20. . . . . . . . . .  582 623 662 702 756 808 861 913 965 1018
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    24
0 Defined   Cross-reference of data names   References

0      41   WRK-OK-21-40 . . . . . . . . .  585 626 665 705 759 811 864 916 968 1021
       42   WRK-OK-41-60 . . . . . . . . .  588 629 668 708 762 814 867 919 971 1024
       43   WRK-OK-61-80 . . . . . . . . .  591 632 671 711 765 817 870 922 974 1027
       44   WRK-OK-81-83 . . . . . . . . .  594 635 674 714 768 820 873 925 977 1030
      214   XXCOMPUTED . . . . . . . . . .  M339
      216   XXCORRECT. . . . . . . . . . .  M339
      209   XXINFO . . . . . . . . . . . .  326 341
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    25
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

      335   BAIL-OUT . . . . . . . . . . .  P252
      343   BAIL-OUT-EX. . . . . . . . . .  E252 G337
      338   BAIL-OUT-WRITE . . . . . . . .  G336
      318   BLANK-LINE-PRINT
      346   BUILD-TABLE1 . . . . . . . . .  P543 P565 P603 P644 P683 P726 P776 P828 P881 P933 P985
      351   BUILD-TABLE3
      355   BUILD-TABLE4
     1033   CCVS-EXIT
     1034   CCVS-999999. . . . . . . . . .  G1000
      227   CCVS1
      344   CCVS1-EXIT . . . . . . . . . .  G233
      234   CLOSE-FILES. . . . . . . . . .  G1035
      262   COLUMN-NAMES-ROUTINE . . . . .  E232
      243   DE-LETE. . . . . . . . . . . .  P379 P404 P429 P454 P480 P506 P531 P553 P576 P617 P656 P696 P736 P788 P841 P893
                                            P945 P998
      266   END-ROUTINE. . . . . . . . . .  P235
      270   END-ROUTINE-1
      279   END-ROUTINE-12
      287   END-ROUTINE-13 . . . . . . . .  E235
      268   END-RTN-EXIT
      242   FAIL . . . . . . . . . . . . .  P382 P407 P432 P457 P483 P509 P534 P556 P579 P620 P659 P699 P743 P753 P795 P805
                                            P848 P858 P900 P910 P952 P962 P1005 P1015
      320   FAIL-ROUTINE . . . . . . . . .  P251
      334   FAIL-ROUTINE-EX. . . . . . . .  E251 G328 E587 E590 E593 E596 E628 E631 E634 E637 E667 E670 E673 E676 E707 E710
                                            E713 E716 E761 E764 E767 E770 E813 E816 E819 E822 E866 E869 E872 E875 E918 E921
                                            E924 E927 E970 E973 E976 E979 E1023 E1026 E1029 E1032
      329   FAIL-ROUTINE-WRITE . . . . . .  G322 G323 P587 P590 P593 P596 P628 P631 P634 P637 P667 P670 P673 P676 P707 P710
                                            P713 P716 P761 P764 P767 P770 P813 P816 P819 P822 P866 P869 P872 P875 P918 P921
                                            P924 P927 P970 P973 P976 P979 P1023 P1026 P1029 P1032
      257   HEAD-ROUTINE . . . . . . . . .  P232
      378   IND-DELETE-GF-1
      616   IND-DELETE-GF-10
      655   IND-DELETE-GF-11
      695   IND-DELETE-GF-12
      735   IND-DELETE-GF-13
      787   IND-DELETE-GF-14
      840   IND-DELETE-GF-15
      892   IND-DELETE-GF-16
      944   IND-DELETE-GF-17
      997   IND-DELETE-GF-18
      403   IND-DELETE-GF-2
      428   IND-DELETE-GF-3
      453   IND-DELETE-GF-4
      479   IND-DELETE-GF-5
      505   IND-DELETE-GF-6
      530   IND-DELETE-GF-7
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    26
0 Defined   Cross-reference of procedures   References

0     552   IND-DELETE-GF-8
      575   IND-DELETE-GF-9
      381   IND-FAIL-GF-1. . . . . . . . .  G377
      619   IND-FAIL-GF-10 . . . . . . . .  G615
      658   IND-FAIL-GF-11 . . . . . . . .  G654
      698   IND-FAIL-GF-12 . . . . . . . .  G694
      406   IND-FAIL-GF-2. . . . . . . . .  G402
      431   IND-FAIL-GF-3. . . . . . . . .  G427
      456   IND-FAIL-GF-4. . . . . . . . .  G452
      482   IND-FAIL-GF-5. . . . . . . . .  G478
      508   IND-FAIL-GF-6. . . . . . . . .  G504
      533   IND-FAIL-GF-7. . . . . . . . .  G529
      555   IND-FAIL-GF-8. . . . . . . . .  G551
      578   IND-FAIL-GF-9. . . . . . . . .  G574
      365   IND-INIT-GF-1
      601   IND-INIT-GF-10
      642   IND-INIT-GF-11
      681   IND-INIT-GF-12
      721   IND-INIT-GF-13
      771   IND-INIT-GF-14 . . . . . . . .  G738
      823   IND-INIT-GF-15 . . . . . . . .  G790
      876   IND-INIT-GF-16 . . . . . . . .  G843
      928   IND-INIT-GF-17 . . . . . . . .  G895
      980   IND-INIT-GF-18 . . . . . . . .  G947
      389   IND-INIT-GF-2
      414   IND-INIT-GF-3
      439   IND-INIT-GF-4
      464   IND-INIT-GF-5
      490   IND-INIT-GF-6
      516   IND-INIT-GF-7
      541   IND-INIT-GF-8
      563   IND-INIT-GF-9
      370   IND-TEST-GF-1-0
      373   IND-TEST-GF-1-1
      607   IND-TEST-GF-10-0
      611   IND-TEST-GF-10-1
      647   IND-TEST-GF-11-0
      650   IND-TEST-GF-11-1
      687   IND-TEST-GF-12-0
      690   IND-TEST-GF-12-1
      731   IND-TEST-GF-13-0
      739   IND-TEST-GF-13-1 . . . . . . .  G734
      748   IND-TEST-GF-13-2
      781   IND-TEST-GF-14-0
      791   IND-TEST-GF-14-1 . . . . . . .  G786
      800   IND-TEST-GF-14-2
      834   IND-TEST-GF-15-0
      844   IND-TEST-GF-15-1 . . . . . . .  G839
      853   IND-TEST-GF-15-2
      887   IND-TEST-GF-16-0
      896   IND-TEST-GF-16-1 . . . . . . .  G891
      905   IND-TEST-GF-16-2
      939   IND-TEST-GF-17-0
      948   IND-TEST-GF-17-1 . . . . . . .  G943
      957   IND-TEST-GF-17-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    27
0 Defined   Cross-reference of procedures   References

0     991   IND-TEST-GF-18-0
     1001   IND-TEST-GF-18-1 . . . . . . .  G996
     1010   IND-TEST-GF-18-2
      395   IND-TEST-GF-2-0
      398   IND-TEST-GF-2-1
      420   IND-TEST-GF-3-0
      423   IND-TEST-GF-3-1
      445   IND-TEST-GF-4-0
      448   IND-TEST-GF-4-1
      470   IND-TEST-GF-5-0
      474   IND-TEST-GF-5-1
      496   IND-TEST-GF-6-0
      500   IND-TEST-GF-6-1
      522   IND-TEST-GF-7-0
      525   IND-TEST-GF-7-1
      545   IND-TEST-GF-8-0
      547   IND-TEST-GF-8-1
      567   IND-TEST-GF-9-0
      570   IND-TEST-GF-9-1
      385   IND-WRITE-GF-1 . . . . . . . .  G376 G380
      638   IND-WRITE-GF-10. . . . . . . .  G614 G618
      677   IND-WRITE-GF-11. . . . . . . .  G653 G657
      717   IND-WRITE-GF-12. . . . . . . .  G693 G697
      410   IND-WRITE-GF-2 . . . . . . . .  G401 G405
      435   IND-WRITE-GF-3 . . . . . . . .  G426 G430
      460   IND-WRITE-GF-4 . . . . . . . .  G451 G455
      486   IND-WRITE-GF-5 . . . . . . . .  G477 G481
      512   IND-WRITE-GF-6 . . . . . . . .  G503 G507
      537   IND-WRITE-GF-7 . . . . . . . .  G528 G532
      559   IND-WRITE-GF-8 . . . . . . . .  G550 G554
      597   IND-WRITE-GF-9 . . . . . . . .  G573 G577
      240   INSPT
      228   OPEN-FILES
      241   PASS . . . . . . . . . . . . .  P375 P400 P425 P450 P476 P502 P527 P549 P572 P613 P652 P692 P741 P750 P793 P802
                                            P846 P855 P898 P907 P950 P959 P1003 P1012
      245   PRINT-DETAIL . . . . . . . . .  P388 P413 P438 P463 P489 P515 P540 P562 P584 P600 P625 P641 P664 P680 P704 P720
                                            P737 P742 P746 P751 P758 P789 P794 P798 P803 P810 P842 P847 P851 P856 P863 P894
                                            P899 P903 P908 P915 P946 P951 P955 P960 P967 P999 P1004 P1008 P1013 P1020
      238   TERMINATE-CALL
      236   TERMINATE-CCVS
      299   WRITE-LINE . . . . . . . . . .  P249 P250 P258 P259 P260 P261 P263 P264 P265 P267 P269 P278 P286 P292 P297 P298
                                            P326 P330 P332 P341
      315   WRT-LN . . . . . . . . . . . .  P305 P306 P307 P308 P309 P310 P311 P314 P319
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    28
0 Defined   Cross-reference of programs     References

        3   NC122A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC122A    Date 06/04/2022  Time 11:58:12   Page    29
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC122A:
 *    Source records = 1035
 *    Data Division statements = 89
 *    Procedure Division statements = 684
 *    Generated COBOL statements = 0
 *    Program complexity factor = 693
0End of compilation 1,  program NC122A,  highest severity 0.
0Return code 0
