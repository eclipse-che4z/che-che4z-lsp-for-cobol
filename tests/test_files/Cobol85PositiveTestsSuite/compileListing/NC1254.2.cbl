1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:45   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:45   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1254.2
   000002         000200 PROGRAM-ID.                                                      NC1254.2
   000003         000300     NC125A.                                                      NC1254.2
   000004         000500*                                                              *  NC1254.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1254.2
   000006         000700*                                                              *  NC1254.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1254.2
   000008         000900*                                                              *  NC1254.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1254.2
   000010         001100*                                                              *  NC1254.2
   000011         001300*                                                              *  NC1254.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1254.2
   000013         001500*                                                              *  NC1254.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1254.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1254.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1254.2
   000017         001900*                                                              *  NC1254.2
   000018         002100*                                                                 NC1254.2
   000019         002200*    PROGRAM NC125A TESTS THE USE OF PICTURE CHARACTERS           NC1254.2
   000020         002300*    $ + * . , WITH FORMAT 1 OF THE "MOVE" STATEMENT AND          NC1254.2
   000021         002400*    FORMAT 2 OF THE "ADD" AND "SUBTRACT" STATEMENTS.             NC1254.2
   000022         002500*                                                                 NC1254.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1254.2
   000024         002700 CONFIGURATION SECTION.                                           NC1254.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1254.2
   000026         002900     XXXXX082.                                                    NC1254.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1254.2
   000028         003100     XXXXX083.                                                    NC1254.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1254.2
   000030         003300 FILE-CONTROL.                                                    NC1254.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1254.2 35
   000032         003500     XXXXX055.                                                    NC1254.2
   000033         003600 DATA DIVISION.                                                   NC1254.2
   000034         003700 FILE SECTION.                                                    NC1254.2
   000035         003800 FD  PRINT-FILE.                                                  NC1254.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1254.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1254.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1254.2
   000039         004200 01  W1.                                                          NC1254.2
   000040         004300     02 WRK-EDIT-001 PIC $$,$$$,$$$,$$$,$$$,$$$.99.               NC1254.2
   000041         004400 01  W2.                                                          NC1254.2
   000042         004500     02 WRK-EDIT-002 PIC ++,+++,+++,+++,+++,+++.99.               NC1254.2
   000043         004600 01  W3.                                                          NC1254.2
   000044         004700     02 WRK-EDIT-003 PIC --,---,---,---,---,---.99.               NC1254.2
   000045         004800 01  W4.                                                          NC1254.2
   000046         004900     02 WRK-EDIT-004 PIC  *,***,***,***,***,***.99.               NC1254.2
   000047         005000 01  W5.                                                          NC1254.2
   000048         005100     02 WRK-EDIT-005 PIC  9,9,9,9,9,9,9,9,9,9,9,9,.               NC1254.2
   000049         005200 01  W6.                                                          NC1254.2
   000050         005300     02 WRK-EDIT-006 PIC  999999999999.                           NC1254.2
   000051         005400 01  TBL-001.                                                     NC1254.2
   000052         005500     02 FILLER PIC S9(16)V99 VALUE ZERO.                          NC1254.2 IMP
   000053         005600     02 FILLER PIC S9(16)V99 VALUE .01.                           NC1254.2
   000054         005700     02 FILLER PIC S9(16)V99 VALUE .19.                           NC1254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02 FILLER PIC S9(16)V99 VALUE 1.00.                          NC1254.2
   000056         005900     02 FILLER PIC S9(16)V99 VALUE 111.11.                        NC1254.2
   000057         006000     02 FILLER PIC S9(16)V99 VALUE 9999.11.                       NC1254.2
   000058         006100     02 FILLER PIC S9(16)V99 VALUE 1010101.99.                    NC1254.2
   000059         006200     02 FILLER PIC S9(16)V99 VALUE 900000000.11.                  NC1254.2
   000060         006300     02 FILLER PIC S9(16)V99 VALUE 9999999999.99.                 NC1254.2
   000061         006400 01  TBL-001-R REDEFINES TBL-001.                                 NC1254.2 51
   000062         006500     02 TBL-001-O PIC S9(16)V99 OCCURS 9 TIMES.                   NC1254.2
   000063         006600 01  TBL-002.                                                     NC1254.2
   000064         006700     02 FILLER PIC X(25) VALUE "                     $.00".       NC1254.2
   000065         006800     02 FILLER PIC X(25) VALUE "                     $.01".       NC1254.2
   000066         006900     02 FILLER PIC X(25) VALUE "                     $.19".       NC1254.2
   000067         007000     02 FILLER PIC X(25) VALUE "                    $1.00".       NC1254.2
   000068         007100     02 FILLER PIC X(25) VALUE "                  $111.11".       NC1254.2
   000069         007200     02 FILLER PIC X(25) VALUE "                $9,999.11".       NC1254.2
   000070         007300     02 FILLER PIC X(25) VALUE "            $1,010,101.99".       NC1254.2
   000071         007400     02 FILLER PIC X(25) VALUE "          $900,000,000.11".       NC1254.2
   000072         007500     02 FILLER PIC X(25) VALUE "        $9,999,999,999.99".       NC1254.2
   000073         007600 01  TBL-002-R REDEFINES TBL-002.                                 NC1254.2 63
   000074         007700     02 TBL-002-O PIC X(25) OCCURS 9 TIMES.                       NC1254.2
   000075         007800 01  TBL-003.                                                     NC1254.2
   000076         007900     02 FILLER PIC X(25) VALUE "                     +.00".       NC1254.2
   000077         008000     02 FILLER PIC X(25) VALUE "                     +.01".       NC1254.2
   000078         008100     02 FILLER PIC X(25) VALUE "                     +.19".       NC1254.2
   000079         008200     02 FILLER PIC X(25) VALUE "                    +1.00".       NC1254.2
   000080         008300     02 FILLER PIC X(25) VALUE "                  +111.11".       NC1254.2
   000081         008400     02 FILLER PIC X(25) VALUE "                +9,999.11".       NC1254.2
   000082         008500     02 FILLER PIC X(25) VALUE "            +1,010,101.99".       NC1254.2
   000083         008600     02 FILLER PIC X(25) VALUE "          +900,000,000.11".       NC1254.2
   000084         008700     02 FILLER PIC X(25) VALUE "        +9,999,999,999.99".       NC1254.2
   000085         008800 01  TBL-003-R REDEFINES TBL-003.                                 NC1254.2 75
   000086         008900     02 TBL-003-O PIC X(25) OCCURS 9 TIMES.                       NC1254.2
   000087         009000 01  TBL-004.                                                     NC1254.2
   000088         009100     02 FILLER PIC X(25) VALUE "                      .00".       NC1254.2
   000089         009200     02 FILLER PIC X(25) VALUE "                      .01".       NC1254.2
   000090         009300     02 FILLER PIC X(25) VALUE "                      .19".       NC1254.2
   000091         009400     02 FILLER PIC X(25) VALUE "                     1.00".       NC1254.2
   000092         009500     02 FILLER PIC X(25) VALUE "                   111.11".       NC1254.2
   000093         009600     02 FILLER PIC X(25) VALUE "                 9,999.11".       NC1254.2
   000094         009700     02 FILLER PIC X(25) VALUE "             1,010,101.99".       NC1254.2
   000095         009800     02 FILLER PIC X(25) VALUE "           900,000,000.11".       NC1254.2
   000096         009900     02 FILLER PIC X(25) VALUE "         9,999,999,999.99".       NC1254.2
   000097         010000 01  TBL-004-R REDEFINES TBL-004.                                 NC1254.2 87
   000098         010100     02 TBL-004-O PIC X(25) OCCURS 9 TIMES.                       NC1254.2
   000099         010200 01  TBL-005.                                                     NC1254.2
   000100         010300     02 FILLER PIC X(24) VALUE "*********************.00".        NC1254.2
   000101         010400     02 FILLER PIC X(24) VALUE "*********************.01".        NC1254.2
   000102         010500     02 FILLER PIC X(24) VALUE "*********************.19".        NC1254.2
   000103         010600     02 FILLER PIC X(24) VALUE "********************1.00".        NC1254.2
   000104         010700     02 FILLER PIC X(24) VALUE "******************111.11".        NC1254.2
   000105         010800     02 FILLER PIC X(24) VALUE "****************9,999.11".        NC1254.2
   000106         010900     02 FILLER PIC X(24) VALUE "************1,010,101.99".        NC1254.2
   000107         011000     02 FILLER PIC X(24) VALUE "**********900,000,000.11".        NC1254.2
   000108         011100     02 FILLER PIC X(24) VALUE "********9,999,999,999.99".        NC1254.2
   000109         011200 01  TBL-005-R REDEFINES TBL-005.                                 NC1254.2 99
   000110         011300     02 TBL-005-O PIC X(24) OCCURS 9 TIMES.                       NC1254.2
   000111         011400 01  TBL-006.                                                     NC1254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 FILLER PIC X(25) VALUE "                      .00".       NC1254.2
   000113         011600     02 FILLER PIC X(25) VALUE "                     -.01".       NC1254.2
   000114         011700     02 FILLER PIC X(25) VALUE "                     -.19".       NC1254.2
   000115         011800     02 FILLER PIC X(25) VALUE "                    -1.00".       NC1254.2
   000116         011900     02 FILLER PIC X(25) VALUE "                  -111.11".       NC1254.2
   000117         012000     02 FILLER PIC X(25) VALUE "                -9,999.11".       NC1254.2
   000118         012100     02 FILLER PIC X(25) VALUE "            -1,010,101.99".       NC1254.2
   000119         012200     02 FILLER PIC X(25) VALUE "          -900,000,000.11".       NC1254.2
   000120         012300     02 FILLER PIC X(25) VALUE "        -9,999,999,999.99".       NC1254.2
   000121         012400 01  TBL-006-R REDEFINES TBL-006.                                 NC1254.2 111
   000122         012500     02 TBL-006-O PIC X(25) OCCURS 9 TIMES.                       NC1254.2
   000123         012600 01  CTR-1 PIC 999 VALUE 0.                                       NC1254.2
   000124         012700 01  CRT-2 PIC 999 VALUE 9.                                       NC1254.2
   000125         012800 01  CTR-3 PIC 999 VALUE 0.                                       NC1254.2
   000126         012900 01  TEST-RESULTS.                                                NC1254.2
   000127         013000     02 FILLER                   PIC X      VALUE SPACE.          NC1254.2 IMP
   000128         013100     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1254.2 IMP
   000129         013200     02 FILLER                   PIC X      VALUE SPACE.          NC1254.2 IMP
   000130         013300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1254.2 IMP
   000131         013400     02 FILLER                   PIC X      VALUE SPACE.          NC1254.2 IMP
   000132         013500     02  PAR-NAME.                                                NC1254.2
   000133         013600       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1254.2 IMP
   000134         013700       03  PARDOT-X              PIC X      VALUE SPACE.          NC1254.2 IMP
   000135         013800       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1254.2 IMP
   000136         013900     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1254.2 IMP
   000137         014000     02 RE-MARK                  PIC X(61).                       NC1254.2
   000138         014100 01  TEST-COMPUTED.                                               NC1254.2
   000139         014200     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1254.2 IMP
   000140         014300     02 FILLER                   PIC X(17)  VALUE                 NC1254.2
   000141         014400            "       COMPUTED=".                                   NC1254.2
   000142         014500     02 COMPUTED-X.                                               NC1254.2
   000143         014600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1254.2 IMP
   000144         014700     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1254.2 143
   000145         014800                                 PIC -9(9).9(9).                  NC1254.2
   000146         014900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1254.2 143
   000147         015000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1254.2 143
   000148         015100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1254.2 143
   000149         015200     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1254.2 143
   000150         015300         04 COMPUTED-18V0                    PIC -9(18).          NC1254.2
   000151         015400         04 FILLER                           PIC X.               NC1254.2
   000152         015500     03 FILLER PIC X(50) VALUE SPACE.                             NC1254.2 IMP
   000153         015600 01  TEST-CORRECT.                                                NC1254.2
   000154         015700     02 FILLER PIC X(30) VALUE SPACE.                             NC1254.2 IMP
   000155         015800     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1254.2
   000156         015900     02 CORRECT-X.                                                NC1254.2
   000157         016000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1254.2 IMP
   000158         016100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1254.2 157
   000159         016200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1254.2 157
   000160         016300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1254.2 157
   000161         016400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1254.2 157
   000162         016500     03      CR-18V0 REDEFINES CORRECT-A.                         NC1254.2 157
   000163         016600         04 CORRECT-18V0                     PIC -9(18).          NC1254.2
   000164         016700         04 FILLER                           PIC X.               NC1254.2
   000165         016800     03 FILLER PIC X(2) VALUE SPACE.                              NC1254.2 IMP
   000166         016900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1254.2 IMP
   000167         017000 01  CCVS-C-1.                                                    NC1254.2
   000168         017100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200-    "SS  PARAGRAPH-NAME                                          NC1254.2
   000170         017300-    "       REMARKS".                                            NC1254.2
   000171         017400     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1254.2 IMP
   000172         017500 01  CCVS-C-2.                                                    NC1254.2
   000173         017600     02 FILLER                     PIC X        VALUE SPACE.      NC1254.2 IMP
   000174         017700     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1254.2
   000175         017800     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1254.2 IMP
   000176         017900     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1254.2
   000177         018000     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1254.2 IMP
   000178         018100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1254.2 IMP
   000179         018200 01  REC-CT                        PIC 99       VALUE ZERO.       NC1254.2 IMP
   000180         018300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1254.2 IMP
   000181         018400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1254.2 IMP
   000182         018500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1254.2 IMP
   000183         018600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1254.2 IMP
   000184         018700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1254.2 IMP
   000185         018800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1254.2 IMP
   000186         018900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1254.2 IMP
   000187         019000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1254.2 IMP
   000188         019100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1254.2 IMP
   000189         019200 01  CCVS-H-1.                                                    NC1254.2
   000190         019300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1254.2 IMP
   000191         019400     02  FILLER                    PIC X(42)    VALUE             NC1254.2
   000192         019500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1254.2
   000193         019600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1254.2 IMP
   000194         019700 01  CCVS-H-2A.                                                   NC1254.2
   000195         019800   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1254.2 IMP
   000196         019900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1254.2
   000197         020000   02  FILLER                        PIC XXXX   VALUE             NC1254.2
   000198         020100     "4.2 ".                                                      NC1254.2
   000199         020200   02  FILLER                        PIC X(28)  VALUE             NC1254.2
   000200         020300            " COPY - NOT FOR DISTRIBUTION".                       NC1254.2
   000201         020400   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1254.2 IMP
   000202         020500                                                                  NC1254.2
   000203         020600 01  CCVS-H-2B.                                                   NC1254.2
   000204         020700   02  FILLER                        PIC X(15)  VALUE             NC1254.2
   000205         020800            "TEST RESULT OF ".                                    NC1254.2
   000206         020900   02  TEST-ID                       PIC X(9).                    NC1254.2
   000207         021000   02  FILLER                        PIC X(4)   VALUE             NC1254.2
   000208         021100            " IN ".                                               NC1254.2
   000209         021200   02  FILLER                        PIC X(12)  VALUE             NC1254.2
   000210         021300     " HIGH       ".                                              NC1254.2
   000211         021400   02  FILLER                        PIC X(22)  VALUE             NC1254.2
   000212         021500            " LEVEL VALIDATION FOR ".                             NC1254.2
   000213         021600   02  FILLER                        PIC X(58)  VALUE             NC1254.2
   000214         021700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1254.2
   000215         021800 01  CCVS-H-3.                                                    NC1254.2
   000216         021900     02  FILLER                      PIC X(34)  VALUE             NC1254.2
   000217         022000            " FOR OFFICIAL USE ONLY    ".                         NC1254.2
   000218         022100     02  FILLER                      PIC X(58)  VALUE             NC1254.2
   000219         022200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1254.2
   000220         022300     02  FILLER                      PIC X(28)  VALUE             NC1254.2
   000221         022400            "  COPYRIGHT   1985 ".                                NC1254.2
   000222         022500 01  CCVS-E-1.                                                    NC1254.2
   000223         022600     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1254.2 IMP
   000224         022700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1254.2
   000225         022800     02 ID-AGAIN                     PIC X(9).                    NC1254.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1254.2 IMP
   000227         023000 01  CCVS-E-2.                                                    NC1254.2
   000228         023100     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1254.2 IMP
   000229         023200     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1254.2 IMP
   000230         023300     02 CCVS-E-2-2.                                               NC1254.2
   000231         023400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1254.2 IMP
   000232         023500         03 FILLER                   PIC X      VALUE SPACE.      NC1254.2 IMP
   000233         023600         03 ENDER-DESC               PIC X(44)  VALUE             NC1254.2
   000234         023700            "ERRORS ENCOUNTERED".                                 NC1254.2
   000235         023800 01  CCVS-E-3.                                                    NC1254.2
   000236         023900     02  FILLER                      PIC X(22)  VALUE             NC1254.2
   000237         024000            " FOR OFFICIAL USE ONLY".                             NC1254.2
   000238         024100     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1254.2 IMP
   000239         024200     02  FILLER                      PIC X(58)  VALUE             NC1254.2
   000240         024300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1254.2
   000241         024400     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1254.2 IMP
   000242         024500     02 FILLER                       PIC X(15)  VALUE             NC1254.2
   000243         024600             " COPYRIGHT 1985".                                   NC1254.2
   000244         024700 01  CCVS-E-4.                                                    NC1254.2
   000245         024800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1254.2 IMP
   000246         024900     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1254.2
   000247         025000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1254.2 IMP
   000248         025100     02 FILLER                       PIC X(40)  VALUE             NC1254.2
   000249         025200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1254.2
   000250         025300 01  XXINFO.                                                      NC1254.2
   000251         025400     02 FILLER                       PIC X(19)  VALUE             NC1254.2
   000252         025500            "*** INFORMATION ***".                                NC1254.2
   000253         025600     02 INFO-TEXT.                                                NC1254.2
   000254         025700       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1254.2 IMP
   000255         025800       04 XXCOMPUTED                 PIC X(20).                   NC1254.2
   000256         025900       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1254.2 IMP
   000257         026000       04 XXCORRECT                  PIC X(20).                   NC1254.2
   000258         026100     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1254.2
   000259         026200 01  HYPHEN-LINE.                                                 NC1254.2
   000260         026300     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1254.2 IMP
   000261         026400     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1254.2
   000262         026500-    "*****************************************".                 NC1254.2
   000263         026600     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1254.2
   000264         026700-    "******************************".                            NC1254.2
   000265         026800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1254.2
   000266         026900     "NC125A".                                                    NC1254.2
   000267         027000 PROCEDURE DIVISION.                                              NC1254.2
   000268         027100 CCVS1 SECTION.                                                   NC1254.2
   000269         027200 OPEN-FILES.                                                      NC1254.2
   000270         027300     OPEN     OUTPUT PRINT-FILE.                                  NC1254.2 35
   000271         027400     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1254.2 265 206 265 225
   000272         027500     MOVE    SPACE TO TEST-RESULTS.                               NC1254.2 IMP 126
   000273         027600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1254.2 298 303
   000274         027700     GO TO CCVS1-EXIT.                                            NC1254.2 385
   000275         027800 CLOSE-FILES.                                                     NC1254.2
   000276         027900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1254.2 307 328 35
   000277         028000 TERMINATE-CCVS.                                                  NC1254.2
   000278         028100     EXIT PROGRAM.                                                NC1254.2
   000279         028200 TERMINATE-CALL.                                                  NC1254.2
   000280         028300     STOP     RUN.                                                NC1254.2
   000281         028400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1254.2 130 182
   000282         028500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1254.2 130 183
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1254.2 130 181
   000284         028700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1254.2 130 180
   000285         028800     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1254.2 137
   000286         028900 PRINT-DETAIL.                                                    NC1254.2
   000287         029000     IF REC-CT NOT EQUAL TO ZERO                                  NC1254.2 179 IMP
   000288      1  029100             MOVE "." TO PARDOT-X                                 NC1254.2 134
   000289      1  029200             MOVE REC-CT TO DOTVALUE.                             NC1254.2 179 135
   000290         029300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1254.2 126 36 340
   000291         029400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1254.2 130 340
   000292      1  029500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1254.2 361 375
   000293      1  029600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1254.2 376 384
   000294         029700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1254.2 IMP 130 IMP 142
   000295         029800     MOVE SPACE TO CORRECT-X.                                     NC1254.2 IMP 156
   000296         029900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1254.2 179 IMP IMP 132
   000297         030000     MOVE     SPACE TO RE-MARK.                                   NC1254.2 IMP 137
   000298         030100 HEAD-ROUTINE.                                                    NC1254.2
   000299         030200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1254.2 189 37 340
   000300         030300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1254.2 194 37 340
   000301         030400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1254.2 203 37 340
   000302         030500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1254.2 215 37 340
   000303         030600 COLUMN-NAMES-ROUTINE.                                            NC1254.2
   000304         030700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1254.2 167 37 340
   000305         030800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1254.2 172 37 340
   000306         030900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1254.2 259 37 340
   000307         031000 END-ROUTINE.                                                     NC1254.2
   000308         031100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1254.2 259 37 340
   000309         031200 END-RTN-EXIT.                                                    NC1254.2
   000310         031300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1254.2 222 37 340
   000311         031400 END-ROUTINE-1.                                                   NC1254.2
   000312         031500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1254.2 181 185 182
   000313         031600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1254.2 185 180 185
   000314         031700      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1254.2 183 185
   000315         031800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1254.2
   000316         031900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1254.2 183 245
   000317         032000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1254.2 185 247
   000318         032100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1254.2 244 230
   000319         032200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1254.2 227 37 340
   000320         032300  END-ROUTINE-12.                                                 NC1254.2
   000321         032400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1254.2 233
   000322         032500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1254.2 181 IMP
   000323      1  032600         MOVE "NO " TO ERROR-TOTAL                                NC1254.2 231
   000324         032700         ELSE                                                     NC1254.2
   000325      1  032800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1254.2 181 231
   000326         032900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1254.2 227 37
   000327         033000     PERFORM WRITE-LINE.                                          NC1254.2 340
   000328         033100 END-ROUTINE-13.                                                  NC1254.2
   000329         033200     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1254.2 180 IMP
   000330      1  033300         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1254.2 231
   000331      1  033400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1254.2 180 231
   000332         033500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1254.2 233
   000333         033600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1254.2 227 37 340
   000334         033700      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1254.2 182 IMP
   000335      1  033800          MOVE "NO " TO ERROR-TOTAL                               NC1254.2 231
   000336      1  033900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1254.2 182 231
   000337         034000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1254.2 233
   000338         034100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1254.2 227 37 340
   000339         034200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1254.2 235 37 340
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300 WRITE-LINE.                                                      NC1254.2
   000341         034400     ADD 1 TO RECORD-COUNT.                                       NC1254.2 187
   000342         034500     IF RECORD-COUNT GREATER 42                                   NC1254.2 187
   000343      1  034600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1254.2 37 186
   000344      1  034700         MOVE SPACE TO DUMMY-RECORD                               NC1254.2 IMP 37
   000345      1  034800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1254.2 37
   000346      1  034900         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1254.2 189 37 356
   000347      1  035000         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1254.2 194 37 356
   000348      1  035100         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1254.2 203 37 356
   000349      1  035200         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1254.2 215 37 356
   000350      1  035300         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1254.2 167 37 356
   000351      1  035400         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1254.2 172 37 356
   000352      1  035500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1254.2 259 37 356
   000353      1  035600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1254.2 186 37
   000354      1  035700         MOVE ZERO TO RECORD-COUNT.                               NC1254.2 IMP 187
   000355         035800     PERFORM WRT-LN.                                              NC1254.2 356
   000356         035900 WRT-LN.                                                          NC1254.2
   000357         036000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1254.2 37
   000358         036100     MOVE SPACE TO DUMMY-RECORD.                                  NC1254.2 IMP 37
   000359         036200 BLANK-LINE-PRINT.                                                NC1254.2
   000360         036300     PERFORM WRT-LN.                                              NC1254.2 356
   000361         036400 FAIL-ROUTINE.                                                    NC1254.2
   000362         036500     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1254.2 142 IMP
   000363      1  036600            GO TO FAIL-ROUTINE-WRITE.                             NC1254.2 370
   000364         036700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1254.2 156 IMP 370
   000365         036800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1254.2 188 258
   000366         036900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1254.2 253
   000367         037000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1254.2 250 37 340
   000368         037100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1254.2 IMP 258
   000369         037200     GO TO  FAIL-ROUTINE-EX.                                      NC1254.2 375
   000370         037300 FAIL-ROUTINE-WRITE.                                              NC1254.2
   000371         037400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1254.2 138 36 340
   000372         037500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1254.2 188 166
   000373         037600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1254.2 153 36 340
   000374         037700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1254.2 IMP 166
   000375         037800 FAIL-ROUTINE-EX. EXIT.                                           NC1254.2
   000376         037900 BAIL-OUT.                                                        NC1254.2
   000377         038000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1254.2 143 IMP 379
   000378         038100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1254.2 157 IMP 384
   000379         038200 BAIL-OUT-WRITE.                                                  NC1254.2
   000380         038300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1254.2 157 257 143 255
   000381         038400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1254.2 188 258
   000382         038500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1254.2 250 37 340
   000383         038600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1254.2 IMP 258
   000384         038700 BAIL-OUT-EX. EXIT.                                               NC1254.2
   000385         038800 CCVS1-EXIT.                                                      NC1254.2
   000386         038900     EXIT.                                                        NC1254.2
   000387         039000 SECT-NC125A-001 SECTION.                                         NC1254.2
   000388         039100 EDI-TEST-GF1.                                                    NC1254.2
   000389         039200     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000390         039300     MOVE "EDI-TEST-GF1" TO PAR-NAME.                             NC1254.2 132
   000391         039400     MOVE "l EDIT MOVE" TO FEATURE.                               NC1254.2 128
   000392         039500     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000393         039600     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000394         039700     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000395         039800     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000396         039900     PERFORM EDI-TEST-GF1-R CRT-2 TIMES                           NC1254.2 402 124
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     GO TO EDI-TEST-GF1-EXIT.                                     NC1254.2 411
   000398         040100 EDI-TEST-GF1-DELETE.                                             NC1254.2
   000399         040200     PERFORM  DE-LETE.                                            NC1254.2 284
   000400         040300     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000401         040400     GO TO    EDI-TEST-GF1-EXIT.                                  NC1254.2 411
   000402         040500 EDI-TEST-GF1-R.                                                  NC1254.2
   000403         040600     ADD 1 TO REC-CT.                                             NC1254.2 179
   000404         040700     ADD 1 TO CTR-1.                                              NC1254.2 123
   000405         040800     MOVE TBL-001-O (CTR-1) TO WRK-EDIT-001.                      NC1254.2 62 123 40
   000406         040900     IF WRK-EDIT-001 EQUAL TO TBL-002-O (CTR-1) PERFORM PASS      NC1254.2 40 74 123 282
   000407      1  041000     ELSE MOVE W1 TO COMPUTED-X MOVE TBL-002-O (CTR-1) TO         NC1254.2 39 142 74 123
   000408      1  041100         CORRECT-X                                                NC1254.2 156
   000409      1  041200     PERFORM FAIL.                                                NC1254.2 283
   000410         041300     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000411         041400 EDI-TEST-GF1-EXIT.                                               NC1254.2
   000412         041500     EXIT.                                                        NC1254.2
   000413         041600 EDI-TEST-GF2.                                                    NC1254.2
   000414         041700     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000415         041800     MOVE "EDI-TEST-GF2" TO PAR-NAME.                             NC1254.2 132
   000416         041900     MOVE "+ EDIT MOVE" TO FEATURE.                               NC1254.2 128
   000417         042000     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000418         042100     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000419         042200     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000420         042300     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000421         042400     PERFORM EDI-TEST-GF2-R CRT-2 TIMES                           NC1254.2 427 124
   000422         042500     GO TO EDI-TEST-GF2-EXIT.                                     NC1254.2 436
   000423         042600 EDI-TEST-GF2-DELETE.                                             NC1254.2
   000424         042700     PERFORM  DE-LETE.                                            NC1254.2 284
   000425         042800     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000426         042900     GO TO    EDI-TEST-GF2-EXIT.                                  NC1254.2 436
   000427         043000 EDI-TEST-GF2-R.                                                  NC1254.2
   000428         043100     ADD 1 TO REC-CT.                                             NC1254.2 179
   000429         043200     ADD 1 TO CTR-1.                                              NC1254.2 123
   000430         043300     MOVE TBL-001-O (CTR-1) TO WRK-EDIT-002.                      NC1254.2 62 123 42
   000431         043400     IF WRK-EDIT-002 EQUAL TO TBL-003-O (CTR-1) PERFORM PASS      NC1254.2 42 86 123 282
   000432      1  043500     ELSE MOVE W2 TO COMPUTED-X MOVE TBL-003-O (CTR-1) TO         NC1254.2 41 142 86 123
   000433      1  043600         CORRECT-X                                                NC1254.2 156
   000434      1  043700     PERFORM FAIL.                                                NC1254.2 283
   000435         043800     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000436         043900 EDI-TEST-GF2-EXIT.                                               NC1254.2
   000437         044000     EXIT.                                                        NC1254.2
   000438         044100 EDI-TEST-GF3.                                                    NC1254.2
   000439         044200     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000440         044300     MOVE "EDI-TEST-GF3" TO PAR-NAME.                             NC1254.2 132
   000441         044400     MOVE "- EDIT MOVE" TO FEATURE.                               NC1254.2 128
   000442         044500     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000443         044600     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000444         044700     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000445         044800     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000446         044900     PERFORM EDI-TEST-GF3-R CRT-2 TIMES                           NC1254.2 452 124
   000447         045000     GO TO EDI-TEST-GF3-EXIT.                                     NC1254.2 461
   000448         045100 EDI-TEST-GF3-DELETE.                                             NC1254.2
   000449         045200     PERFORM  DE-LETE.                                            NC1254.2 284
   000450         045300     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000451         045400     GO TO    EDI-TEST-GF3-EXIT.                                  NC1254.2 461
   000452         045500 EDI-TEST-GF3-R.                                                  NC1254.2
   000453         045600     ADD 1 TO REC-CT.                                             NC1254.2 179
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     ADD 1 TO CTR-1.                                              NC1254.2 123
   000455         045800     MOVE TBL-001-O (CTR-1) TO WRK-EDIT-003.                      NC1254.2 62 123 44
   000456         045900     IF WRK-EDIT-003 EQUAL TO TBL-004-O (CTR-1) PERFORM PASS      NC1254.2 44 98 123 282
   000457      1  046000     ELSE MOVE W3 TO COMPUTED-X MOVE TBL-004-O (CTR-1) TO         NC1254.2 43 142 98 123
   000458      1  046100         CORRECT-X                                                NC1254.2 156
   000459      1  046200     PERFORM FAIL.                                                NC1254.2 283
   000460         046300     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000461         046400 EDI-TEST-GF3-EXIT.                                               NC1254.2
   000462         046500     EXIT.                                                        NC1254.2
   000463         046600 EDI-TEST-GF4.                                                    NC1254.2
   000464         046700     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000465         046800     MOVE "EDI-TEST-GF4" TO PAR-NAME.                             NC1254.2 132
   000466         046900     MOVE "* EDIT MOVE" TO FEATURE.                               NC1254.2 128
   000467         047000     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000468         047100     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000469         047200     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000470         047300     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000471         047400     PERFORM EDI-TEST-GF4-R CRT-2 TIMES                           NC1254.2 477 124
   000472         047500     GO TO EDI-TEST-GF4-EXIT.                                     NC1254.2 486
   000473         047600 EDI-TEST-GF4-DELETE.                                             NC1254.2
   000474         047700     PERFORM  DE-LETE.                                            NC1254.2 284
   000475         047800     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000476         047900     GO TO    EDI-TEST-GF4-EXIT.                                  NC1254.2 486
   000477         048000 EDI-TEST-GF4-R.                                                  NC1254.2
   000478         048100     ADD 1 TO REC-CT.                                             NC1254.2 179
   000479         048200     ADD 1 TO CTR-1.                                              NC1254.2 123
   000480         048300     MOVE TBL-001-O (CTR-1) TO WRK-EDIT-004.                      NC1254.2 62 123 46
   000481         048400     IF WRK-EDIT-004 EQUAL TO TBL-005-O (CTR-1) PERFORM PASS      NC1254.2 46 110 123 282
   000482      1  048500     ELSE MOVE W4 TO COMPUTED-X MOVE TBL-005-O (CTR-1) TO         NC1254.2 45 142 110 123
   000483      1  048600         CORRECT-X                                                NC1254.2 156
   000484      1  048700     PERFORM FAIL.                                                NC1254.2 283
   000485         048800     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000486         048900 EDI-TEST-GF4-EXIT.                                               NC1254.2
   000487         049000     EXIT.                                                        NC1254.2
   000488         049100 EDI-TEST-GF5.                                                    NC1254.2
   000489         049200     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000490         049300     MOVE "EDI-TEST-GF5" TO PAR-NAME.                             NC1254.2 132
   000491         049400     MOVE "l EDIT ADD" TO FEATURE.                                NC1254.2 128
   000492         049500     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000493         049600     MOVE 0 TO CTR-3.                                             NC1254.2 125
   000494         049700     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000495         049800     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000496         049900     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000497         050000     PERFORM EDI-TEST-GF5-R CRT-2 TIMES                           NC1254.2 503 124
   000498         050100     GO TO EDI-TEST-GF5-EXIT.                                     NC1254.2 512
   000499         050200 EDI-TEST-GF5-DELETE.                                             NC1254.2
   000500         050300     PERFORM  DE-LETE.                                            NC1254.2 284
   000501         050400     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000502         050500     GO TO    EDI-TEST-GF5-EXIT.                                  NC1254.2 512
   000503         050600 EDI-TEST-GF5-R.                                                  NC1254.2
   000504         050700     ADD 1 TO REC-CT.                                             NC1254.2 179
   000505         050800     ADD 1 TO CTR-1.                                              NC1254.2 123
   000506         050900     ADD TBL-001-O (CTR-1)  CTR-3 GIVING WRK-EDIT-001.            NC1254.2 62 123 125 40
   000507         051000     IF WRK-EDIT-001 EQUAL TO TBL-002-O (CTR-1) PERFORM PASS      NC1254.2 40 74 123 282
   000508      1  051100     ELSE MOVE W1 TO COMPUTED-X MOVE TBL-002-O (CTR-1) TO         NC1254.2 39 142 74 123
   000509      1  051200         CORRECT-X                                                NC1254.2 156
   000510      1  051300     PERFORM FAIL.                                                NC1254.2 283
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000512         051500 EDI-TEST-GF5-EXIT.                                               NC1254.2
   000513         051600     EXIT.                                                        NC1254.2
   000514         051700 EDI-TEST-GF6.                                                    NC1254.2
   000515         051800     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000516         051900     MOVE "EDI-TEST-GF6" TO PAR-NAME.                             NC1254.2 132
   000517         052000     MOVE "+ EDIT ADD" TO FEATURE.                                NC1254.2 128
   000518         052100     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000519         052200     MOVE 0 TO CTR-3.                                             NC1254.2 125
   000520         052300     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000521         052400     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000522         052500     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000523         052600     PERFORM EDI-TEST-GF6-R CRT-2 TIMES                           NC1254.2 529 124
   000524         052700     GO TO EDI-TEST-GF6-EXIT.                                     NC1254.2 538
   000525         052800 EDI-TEST-GF6-DELETE.                                             NC1254.2
   000526         052900     PERFORM  DE-LETE.                                            NC1254.2 284
   000527         053000     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000528         053100     GO TO    EDI-TEST-GF6-EXIT.                                  NC1254.2 538
   000529         053200 EDI-TEST-GF6-R.                                                  NC1254.2
   000530         053300     ADD 1 TO REC-CT.                                             NC1254.2 179
   000531         053400     ADD 1 TO CTR-1.                                              NC1254.2 123
   000532         053500     ADD TBL-001-O (CTR-1)  CTR-3 GIVING WRK-EDIT-002.            NC1254.2 62 123 125 42
   000533         053600     IF WRK-EDIT-002 EQUAL TO TBL-003-O (CTR-1) PERFORM PASS      NC1254.2 42 86 123 282
   000534      1  053700     ELSE MOVE W2 TO COMPUTED-X MOVE TBL-003-O (CTR-1) TO         NC1254.2 41 142 86 123
   000535      1  053800         CORRECT-X                                                NC1254.2 156
   000536      1  053900     PERFORM FAIL.                                                NC1254.2 283
   000537         054000     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000538         054100 EDI-TEST-GF6-EXIT.                                               NC1254.2
   000539         054200     EXIT.                                                        NC1254.2
   000540         054300 EDI-TEST-GF7.                                                    NC1254.2
   000541         054400     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000542         054500     MOVE "EDI-TEST-GF7" TO PAR-NAME.                             NC1254.2 132
   000543         054600     MOVE "- EDIT ADD" TO FEATURE.                                NC1254.2 128
   000544         054700     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000545         054800     MOVE 0 TO CTR-3.                                             NC1254.2 125
   000546         054900     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000547         055000     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000548         055100     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000549         055200     PERFORM EDI-TEST-GF7-R CRT-2 TIMES                           NC1254.2 555 124
   000550         055300     GO TO EDI-TEST-GF7-EXIT.                                     NC1254.2 564
   000551         055400 EDI-TEST-GF7-DELETE.                                             NC1254.2
   000552         055500     PERFORM  DE-LETE.                                            NC1254.2 284
   000553         055600     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000554         055700     GO TO    EDI-TEST-GF7-EXIT.                                  NC1254.2 564
   000555         055800 EDI-TEST-GF7-R.                                                  NC1254.2
   000556         055900     ADD 1 TO REC-CT.                                             NC1254.2 179
   000557         056000     ADD 1 TO CTR-1.                                              NC1254.2 123
   000558         056100     ADD TBL-001-O (CTR-1)  CTR-3 GIVING WRK-EDIT-003.            NC1254.2 62 123 125 44
   000559         056200     IF WRK-EDIT-003 EQUAL TO TBL-004-O (CTR-1) PERFORM PASS      NC1254.2 44 98 123 282
   000560      1  056300     ELSE MOVE W3 TO COMPUTED-X MOVE TBL-004-O (CTR-1) TO         NC1254.2 43 142 98 123
   000561      1  056400         CORRECT-X                                                NC1254.2 156
   000562      1  056500     PERFORM FAIL.                                                NC1254.2 283
   000563         056600     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000564         056700 EDI-TEST-GF7-EXIT.                                               NC1254.2
   000565         056800     EXIT.                                                        NC1254.2
   000566         056900 EDI-TEST-GF8.                                                    NC1254.2
   000567         057000     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE "EDI-TEST-GF8" TO PAR-NAME.                             NC1254.2 132
   000569         057200     MOVE "* EDIT ADD" TO FEATURE.                                NC1254.2 128
   000570         057300     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000571         057400     MOVE 0 TO CTR-3.                                             NC1254.2 125
   000572         057500     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000573         057600     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000574         057700     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000575         057800     PERFORM EDI-TEST-GF8-R CRT-2 TIMES                           NC1254.2 581 124
   000576         057900     GO TO EDI-TEST-GF8-EXIT.                                     NC1254.2 590
   000577         058000 EDI-TEST-GF8-DELETE.                                             NC1254.2
   000578         058100     PERFORM  DE-LETE.                                            NC1254.2 284
   000579         058200     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000580         058300     GO TO    EDI-TEST-GF8-EXIT.                                  NC1254.2 590
   000581         058400 EDI-TEST-GF8-R.                                                  NC1254.2
   000582         058500     ADD 1 TO REC-CT.                                             NC1254.2 179
   000583         058600     ADD 1 TO CTR-1.                                              NC1254.2 123
   000584         058700     ADD TBL-001-O (CTR-1)  CTR-3 GIVING WRK-EDIT-004.            NC1254.2 62 123 125 46
   000585         058800     IF WRK-EDIT-004 EQUAL TO TBL-005-O (CTR-1) PERFORM PASS      NC1254.2 46 110 123 282
   000586      1  058900     ELSE MOVE W4 TO COMPUTED-X MOVE TBL-005-O (CTR-1) TO         NC1254.2 45 142 110 123
   000587      1  059000         CORRECT-X                                                NC1254.2 156
   000588      1  059100     PERFORM FAIL.                                                NC1254.2 283
   000589         059200     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000590         059300 EDI-TEST-GF8-EXIT.                                               NC1254.2
   000591         059400     EXIT.                                                        NC1254.2
   000592         059500 EDI-TEST-GF9.                                                    NC1254.2
   000593         059600     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000594         059700     MOVE "EDI-TEST-GF9" TO PAR-NAME.                             NC1254.2 132
   000595         059800     MOVE "l EDIT SUB" TO FEATURE.                                NC1254.2 128
   000596         059900     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000597         060000     MOVE 0 TO CTR-3.                                             NC1254.2 125
   000598         060100     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000599         060200     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000600         060300     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000601         060400     PERFORM EDI-TEST-GF9-R CRT-2 TIMES                           NC1254.2 607 124
   000602         060500     GO TO EDI-TEST-GF9-EXIT.                                     NC1254.2 616
   000603         060600 EDI-TEST-GF9-DELETE.                                             NC1254.2
   000604         060700     PERFORM  DE-LETE.                                            NC1254.2 284
   000605         060800     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000606         060900     GO TO    EDI-TEST-GF9-EXIT.                                  NC1254.2 616
   000607         061000 EDI-TEST-GF9-R.                                                  NC1254.2
   000608         061100     ADD 1 TO REC-CT.                                             NC1254.2 179
   000609         061200     ADD 1 TO CTR-1.                                              NC1254.2 123
   000610         061300     SUBTRACT TBL-001-O (CTR-1) FROM CTR-3 GIVING WRK-EDIT-001.   NC1254.2 62 123 125 40
   000611         061400     IF WRK-EDIT-001 EQUAL TO TBL-002-O (CTR-1) PERFORM PASS      NC1254.2 40 74 123 282
   000612      1  061500     ELSE MOVE W1 TO COMPUTED-X MOVE TBL-002-O (CTR-1) TO         NC1254.2 39 142 74 123
   000613      1  061600         CORRECT-X                                                NC1254.2 156
   000614      1  061700     PERFORM FAIL.                                                NC1254.2 283
   000615         061800     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000616         061900 EDI-TEST-GF9-EXIT.                                               NC1254.2
   000617         062000     EXIT.                                                        NC1254.2
   000618         062100 EDI-TEST-GF10.                                                   NC1254.2
   000619         062200     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000620         062300     MOVE "EDI-TEST-GF10" TO PAR-NAME.                            NC1254.2 132
   000621         062400     MOVE "+ EDIT SUB" TO FEATURE.                                NC1254.2 128
   000622         062500     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000623         062600     MOVE 0 TO CTR-3.                                             NC1254.2 125
   000624         062700     MOVE 0 TO REC-CT.                                            NC1254.2 179
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000626         062900     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000627         063000     MOVE "                     +.00" TO TBL-006-O (1).           NC1254.2 122
   000628         063100     PERFORM EDI-TEST-GF10-R CRT-2 TIMES                          NC1254.2 634 124
   000629         063200     GO TO EDI-TEST-GF10-EXIT.                                    NC1254.2 643
   000630         063300 EDI-TEST-GF10-DELETE.                                            NC1254.2
   000631         063400     PERFORM  DE-LETE.                                            NC1254.2 284
   000632         063500     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000633         063600     GO TO    EDI-TEST-GF10-EXIT.                                 NC1254.2 643
   000634         063700 EDI-TEST-GF10-R.                                                 NC1254.2
   000635         063800     ADD 1 TO REC-CT.                                             NC1254.2 179
   000636         063900     ADD 1 TO CTR-1.                                              NC1254.2 123
   000637         064000     SUBTRACT TBL-001-O (CTR-1) FROM CTR-3 GIVING WRK-EDIT-002.   NC1254.2 62 123 125 42
   000638         064100     IF WRK-EDIT-002 EQUAL TO TBL-006-O (CTR-1) PERFORM PASS      NC1254.2 42 122 123 282
   000639      1  064200     ELSE MOVE W2 TO COMPUTED-X MOVE TBL-006-O (CTR-1) TO         NC1254.2 41 142 122 123
   000640      1  064300         CORRECT-X                                                NC1254.2 156
   000641      1  064400     PERFORM FAIL.                                                NC1254.2 283
   000642         064500     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000643         064600 EDI-TEST-GF10-EXIT.                                              NC1254.2
   000644         064700     EXIT.                                                        NC1254.2
   000645         064800 EDI-TEST-GF11.                                                   NC1254.2
   000646         064900     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000647         065000     MOVE "EDI-TEST-GF11" TO PAR-NAME.                            NC1254.2 132
   000648         065100     MOVE "- EDIT SUB" TO FEATURE.                                NC1254.2 128
   000649         065200     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000650         065300     MOVE 0 TO CTR-3.                                             NC1254.2 125
   000651         065400     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000652         065500     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000653         065600     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000654         065700     MOVE "                      .00" TO TBL-006-O (1).           NC1254.2 122
   000655         065800     PERFORM EDI-TEST-GF11-R CRT-2 TIMES                          NC1254.2 661 124
   000656         065900     GO TO EDI-TEST-GF11-EXIT.                                    NC1254.2 670
   000657         066000 EDI-TEST-GF11-DELETE.                                            NC1254.2
   000658         066100     PERFORM  DE-LETE.                                            NC1254.2 284
   000659         066200     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000660         066300     GO TO    EDI-TEST-GF11-EXIT.                                 NC1254.2 670
   000661         066400 EDI-TEST-GF11-R.                                                 NC1254.2
   000662         066500     ADD 1 TO REC-CT.                                             NC1254.2 179
   000663         066600     ADD 1 TO CTR-1.                                              NC1254.2 123
   000664         066700     SUBTRACT TBL-001-O (CTR-1) FROM CTR-3 GIVING WRK-EDIT-003.   NC1254.2 62 123 125 44
   000665         066800     IF WRK-EDIT-003 EQUAL TO TBL-006-O (CTR-1) PERFORM PASS      NC1254.2 44 122 123 282
   000666      1  066900     ELSE MOVE W3 TO COMPUTED-X MOVE TBL-006-O (CTR-1) TO         NC1254.2 43 142 122 123
   000667      1  067000         CORRECT-X                                                NC1254.2 156
   000668      1  067100     PERFORM FAIL.                                                NC1254.2 283
   000669         067200     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000670         067300 EDI-TEST-GF11-EXIT.                                              NC1254.2
   000671         067400     EXIT.                                                        NC1254.2
   000672         067500 EDI-TEST-GF12.                                                   NC1254.2
   000673         067600     MOVE "VI-34 5.9.5 (7), (8)" TO ANSI-REFERENCE.               NC1254.2 188
   000674         067700     MOVE "EDI-TEST-GF12" TO PAR-NAME.                            NC1254.2 132
   000675         067800     MOVE "* EDIT SUB" TO FEATURE.                                NC1254.2 128
   000676         067900     MOVE 0 TO CTR-1.                                             NC1254.2 123
   000677         068000     MOVE 0 TO CTR-3.                                             NC1254.2 125
   000678         068100     MOVE 0 TO REC-CT.                                            NC1254.2 179
   000679         068200     MOVE ZERO TO TBL-001-O (1).                                  NC1254.2 IMP 62
   000680         068300     MOVE .01  TO TBL-001-O (2).                                  NC1254.2 62
   000681         068400     PERFORM EDI-TEST-GF12-R CRT-2 TIMES                          NC1254.2 687 124
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500     GO TO EDI-TEST-GF12-EXIT.                                    NC1254.2 696
   000683         068600 EDI-TEST-GF12-DELETE.                                            NC1254.2
   000684         068700     PERFORM  DE-LETE.                                            NC1254.2 284
   000685         068800     PERFORM  PRINT-DETAIL.                                       NC1254.2 286
   000686         068900     GO TO    EDI-TEST-GF12-EXIT.                                 NC1254.2 696
   000687         069000 EDI-TEST-GF12-R.                                                 NC1254.2
   000688         069100     ADD 1 TO REC-CT.                                             NC1254.2 179
   000689         069200     ADD 1 TO CTR-1.                                              NC1254.2 123
   000690         069300     SUBTRACT TBL-001-O (CTR-1) FROM CTR-3 GIVING WRK-EDIT-004.   NC1254.2 62 123 125 46
   000691         069400     IF WRK-EDIT-004 EQUAL TO TBL-005-O (CTR-1) PERFORM PASS      NC1254.2 46 110 123 282
   000692      1  069500     ELSE MOVE W4 TO COMPUTED-X MOVE TBL-005-O (CTR-1) TO         NC1254.2 45 142 110 123
   000693      1  069600         CORRECT-X                                                NC1254.2 156
   000694      1  069700     PERFORM FAIL.                                                NC1254.2 283
   000695         069800     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000696         069900 EDI-TEST-GF12-EXIT.                                              NC1254.2
   000697         070000     EXIT.                                                        NC1254.2
   000698         070100*                                                                 NC1254.2
   000699         070200 EDI-INIT-GF-13.                                                  NC1254.2
   000700         070300     MOVE   "VI-33 5.9.5 (4), (5)" TO ANSI-REFERENCE.             NC1254.2 188
   000701         070400     MOVE   "EDI-TEST-GF-13"       TO PAR-NAME.                   NC1254.2 132
   000702         070500     MOVE   "COMMA AS LAST SYMBOL" TO FEATURE.                    NC1254.2 128
   000703         070600 EDI-TEST-GF-13-0.                                                NC1254.2
   000704         070700     MOVE    123456789012 TO WRK-EDIT-005.                        NC1254.2 48
   000705         070800 EDI-TEST-GF-13-1.                                                NC1254.2
   000706         070900     IF      WRK-EDIT-005 = "1,2,3,4,5,6,7,8,9,0,1,2,"            NC1254.2 48
   000707      1  071000             PERFORM PASS                                         NC1254.2 282
   000708         071100     ELSE                                                         NC1254.2
   000709      1  071200             GO TO   EDI-FAIL-GF-13.                              NC1254.2 715
   000710         071300     GO TO   EDI-WRITE-GF-13.                                     NC1254.2 719
   000711         071400 EDI-DELETE-GF-13.                                                NC1254.2
   000712         071500     PERFORM DE-LETE.                                             NC1254.2 284
   000713         071600     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000714         071700     GO TO   EDI-INIT-GF-14.                                      NC1254.2 722
   000715         071800 EDI-FAIL-GF-13.                                                  NC1254.2
   000716         071900     MOVE   "1,2,3,4,5,6,7,8,9,0,1,2," TO CORRECT-X.              NC1254.2 156
   000717         072000     MOVE    W5 TO COMPUTED-X.                                    NC1254.2 47 142
   000718         072100     PERFORM FAIL.                                                NC1254.2 283
   000719         072200 EDI-WRITE-GF-13.                                                 NC1254.2
   000720         072300     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000721         072400*                                                                 NC1254.2
   000722         072500 EDI-INIT-GF-14.                                                  NC1254.2
   000723         072600     MOVE   "VI-34 5.9.5 (4), (5)" TO ANSI-REFERENCE.             NC1254.2 188
   000724         072700     MOVE   "EDI-TEST-GF-14"       TO PAR-NAME.                   NC1254.2 132
   000725         072800     MOVE   "PERIOD LAST SYMBOL"   TO FEATURE.                    NC1254.2 128
   000726         072900 EDI-TEST-GF-14-0.                                                NC1254.2
   000727         073000     MOVE    123456789012 TO WRK-EDIT-006.                        NC1254.2 50
   000728         073100 EDI-TEST-GF-14-1.                                                NC1254.2
   000729         073200     IF      WRK-EDIT-006 = "123456789012."                       NC1254.2 50

 ==000729==> IGYPG3173-W The result of the comparison of operands WRK-EDIT-006 and 123456789012.
                         is known at compile time, based on the attributes of the operands.
                         Unconditional code was generated.

   000730      1  073300             PERFORM PASS                                         NC1254.2 282
   000731         073400     ELSE                                                         NC1254.2
   000732      1  073500             GO TO   EDI-FAIL-GF-14.                              NC1254.2 738
   000733         073600     GO TO   EDI-WRITE-GF-14.                                     NC1254.2 742
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000734         073700 EDI-DELETE-GF-14.                                                NC1254.2
   000735         073800     PERFORM DE-LETE.                                             NC1254.2 284
   000736         073900     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000737         074000     GO TO   EDI-INIT-GF-14.                                      NC1254.2 722
   000738         074100 EDI-FAIL-GF-14.                                                  NC1254.2
   000739         074200     MOVE   "123456789012." TO CORRECT-X.                         NC1254.2 156
   000740         074300     MOVE    W6 TO COMPUTED-X.                                    NC1254.2 49 142
   000741         074400     PERFORM FAIL.                                                NC1254.2 283
   000742         074500 EDI-WRITE-GF-14.                                                 NC1254.2
   000743         074600     PERFORM PRINT-DETAIL.                                        NC1254.2 286
   000744         074700*                                                                 NC1254.2
   000745         074800 CCVS-EXIT SECTION.                                               NC1254.2
   000746         074900 CCVS-999999.                                                     NC1254.2
   000747         075000     GO TO CLOSE-FILES.                                           NC1254.2 275
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      188   ANSI-REFERENCE . . . . . . . .  365 372 381 M389 M414 M439 M464 M489 M515 M541 M567 M593 M619 M646 M673 M700
                                            M723
      167   CCVS-C-1 . . . . . . . . . . .  304 350
      172   CCVS-C-2 . . . . . . . . . . .  305 351
      222   CCVS-E-1 . . . . . . . . . . .  310
      227   CCVS-E-2 . . . . . . . . . . .  319 326 333 338
      230   CCVS-E-2-2 . . . . . . . . . .  M318
      235   CCVS-E-3 . . . . . . . . . . .  339
      244   CCVS-E-4 . . . . . . . . . . .  318
      245   CCVS-E-4-1 . . . . . . . . . .  M316
      247   CCVS-E-4-2 . . . . . . . . . .  M317
      189   CCVS-H-1 . . . . . . . . . . .  299 346
      194   CCVS-H-2A. . . . . . . . . . .  300 347
      203   CCVS-H-2B. . . . . . . . . . .  301 348
      215   CCVS-H-3 . . . . . . . . . . .  302 349
      265   CCVS-PGM-ID. . . . . . . . . .  271 271
      149   CM-18V0
      143   COMPUTED-A . . . . . . . . . .  144 146 147 148 149 377 380
      144   COMPUTED-N
      142   COMPUTED-X . . . . . . . . . .  M294 362 M407 M432 M457 M482 M508 M534 M560 M586 M612 M639 M666 M692 M717 M740
      146   COMPUTED-0V18
      148   COMPUTED-14V4
      150   COMPUTED-18V0
      147   COMPUTED-4V14
      166   COR-ANSI-REFERENCE . . . . . .  M372 M374
      157   CORRECT-A. . . . . . . . . . .  158 159 160 161 162 378 380
      158   CORRECT-N
      156   CORRECT-X. . . . . . . . . . .  M295 364 M408 M433 M458 M483 M509 M535 M561 M587 M613 M640 M667 M693 M716 M739
      159   CORRECT-0V18
      161   CORRECT-14V4
      163   CORRECT-18V0
      160   CORRECT-4V14
      162   CR-18V0
      124   CRT-2. . . . . . . . . . . . .  396 421 446 471 497 523 549 575 601 628 655 681
      123   CTR-1. . . . . . . . . . . . .  M393 M404 405 406 407 M418 M429 430 431 432 M443 M454 455 456 457 M468 M479 480
                                            481 482 M492 M505 506 507 508 M518 M531 532 533 534 M544 M557 558 559 560 M570
                                            M583 584 585 586 M596 M609 610 611 612 M622 M636 637 638 639 M649 M663 664 665
                                            666 M676 M689 690 691 692
      125   CTR-3. . . . . . . . . . . . .  M493 506 M519 532 M545 558 M571 584 M597 610 M623 637 M650 664 M677 690
      180   DELETE-COUNTER . . . . . . . .  M284 313 329 331
      135   DOTVALUE . . . . . . . . . . .  M289
      186   DUMMY-HOLD . . . . . . . . . .  M343 353
       37   DUMMY-RECORD . . . . . . . . .  M299 M300 M301 M302 M304 M305 M306 M308 M310 M319 M326 M333 M338 M339 343 M344
                                            345 M346 M347 M348 M349 M350 M351 M352 M353 357 M358 M367 M382
      233   ENDER-DESC . . . . . . . . . .  M321 M332 M337
      181   ERROR-COUNTER. . . . . . . . .  M283 312 322 325
      185   ERROR-HOLD . . . . . . . . . .  M312 M313 M313 M314 317
      231   ERROR-TOTAL. . . . . . . . . .  M323 M325 M330 M331 M335 M336
      128   FEATURE. . . . . . . . . . . .  M391 M416 M441 M466 M491 M517 M543 M569 M595 M621 M648 M675 M702 M725
      259   HYPHEN-LINE. . . . . . . . . .  306 308 352
      225   ID-AGAIN . . . . . . . . . . .  M271
      258   INF-ANSI-REFERENCE . . . . . .  M365 M368 M381 M383
      253   INFO-TEXT. . . . . . . . . . .  M366
      182   INSPECT-COUNTER. . . . . . . .  M281 312 334 336
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    18
0 Defined   Cross-reference of data names   References

0     130   P-OR-F . . . . . . . . . . . .  M281 M282 M283 M284 291 M294
      132   PAR-NAME . . . . . . . . . . .  M296 M390 M415 M440 M465 M490 M516 M542 M568 M594 M620 M647 M674 M701 M724
      134   PARDOT-X . . . . . . . . . . .  M288
      183   PASS-COUNTER . . . . . . . . .  M282 314 316
       35   PRINT-FILE . . . . . . . . . .  31 270 276
       36   PRINT-REC. . . . . . . . . . .  M290 M371 M373
      137   RE-MARK. . . . . . . . . . . .  M285 M297
      179   REC-CT . . . . . . . . . . . .  287 289 296 M392 M403 M417 M428 M442 M453 M467 M478 M494 M504 M520 M530 M546
                                            M556 M572 M582 M598 M608 M624 M635 M651 M662 M678 M688
      178   REC-SKL-SUB
      187   RECORD-COUNT . . . . . . . . .  M341 342 M354
       51   TBL-001. . . . . . . . . . . .  61
       62   TBL-001-O. . . . . . . . . . .  M394 M395 405 M419 M420 430 M444 M445 455 M469 M470 480 M495 M496 506 M521 M522
                                            532 M547 M548 558 M573 M574 584 M599 M600 610 M625 M626 637 M652 M653 664 M679
                                            M680 690
       61   TBL-001-R
       63   TBL-002. . . . . . . . . . . .  73
       74   TBL-002-O. . . . . . . . . . .  406 407 507 508 611 612
       73   TBL-002-R
       75   TBL-003. . . . . . . . . . . .  85
       86   TBL-003-O. . . . . . . . . . .  431 432 533 534
       85   TBL-003-R
       87   TBL-004. . . . . . . . . . . .  97
       98   TBL-004-O. . . . . . . . . . .  456 457 559 560
       97   TBL-004-R
       99   TBL-005. . . . . . . . . . . .  109
      110   TBL-005-O. . . . . . . . . . .  481 482 585 586 691 692
      109   TBL-005-R
      111   TBL-006. . . . . . . . . . . .  121
      122   TBL-006-O. . . . . . . . . . .  M627 638 639 M654 665 666
      121   TBL-006-R
      138   TEST-COMPUTED. . . . . . . . .  371
      153   TEST-CORRECT . . . . . . . . .  373
      206   TEST-ID. . . . . . . . . . . .  M271
      126   TEST-RESULTS . . . . . . . . .  M272 290
      184   TOTAL-ERROR
       40   WRK-EDIT-001 . . . . . . . . .  M405 406 M506 507 M610 611
       42   WRK-EDIT-002 . . . . . . . . .  M430 431 M532 533 M637 638
       44   WRK-EDIT-003 . . . . . . . . .  M455 456 M558 559 M664 665
       46   WRK-EDIT-004 . . . . . . . . .  M480 481 M584 585 M690 691
       48   WRK-EDIT-005 . . . . . . . . .  M704 706
       50   WRK-EDIT-006 . . . . . . . . .  M727 729
       39   W1 . . . . . . . . . . . . . .  407 508 612
       41   W2 . . . . . . . . . . . . . .  432 534 639
       43   W3 . . . . . . . . . . . . . .  457 560 666
       45   W4 . . . . . . . . . . . . . .  482 586 692
       47   W5 . . . . . . . . . . . . . .  717
       49   W6 . . . . . . . . . . . . . .  740
      255   XXCOMPUTED . . . . . . . . . .  M380
      257   XXCORRECT. . . . . . . . . . .  M380
      250   XXINFO . . . . . . . . . . . .  367 382
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    19
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

      376   BAIL-OUT . . . . . . . . . . .  P293
      384   BAIL-OUT-EX. . . . . . . . . .  E293 G378
      379   BAIL-OUT-WRITE . . . . . . . .  G377
      359   BLANK-LINE-PRINT
      745   CCVS-EXIT
      746   CCVS-999999
      268   CCVS1
      385   CCVS1-EXIT . . . . . . . . . .  G274
      275   CLOSE-FILES. . . . . . . . . .  G747
      303   COLUMN-NAMES-ROUTINE . . . . .  E273
      284   DE-LETE. . . . . . . . . . . .  P399 P424 P449 P474 P500 P526 P552 P578 P604 P631 P658 P684 P712 P735
      711   EDI-DELETE-GF-13
      734   EDI-DELETE-GF-14
      715   EDI-FAIL-GF-13 . . . . . . . .  G709
      738   EDI-FAIL-GF-14 . . . . . . . .  G732
      699   EDI-INIT-GF-13
      722   EDI-INIT-GF-14 . . . . . . . .  G714 G737
      703   EDI-TEST-GF-13-0
      705   EDI-TEST-GF-13-1
      726   EDI-TEST-GF-14-0
      728   EDI-TEST-GF-14-1
      388   EDI-TEST-GF1
      398   EDI-TEST-GF1-DELETE
      411   EDI-TEST-GF1-EXIT. . . . . . .  G397 G401
      402   EDI-TEST-GF1-R . . . . . . . .  P396
      618   EDI-TEST-GF10
      630   EDI-TEST-GF10-DELETE
      643   EDI-TEST-GF10-EXIT . . . . . .  G629 G633
      634   EDI-TEST-GF10-R. . . . . . . .  P628
      645   EDI-TEST-GF11
      657   EDI-TEST-GF11-DELETE
      670   EDI-TEST-GF11-EXIT . . . . . .  G656 G660
      661   EDI-TEST-GF11-R. . . . . . . .  P655
      672   EDI-TEST-GF12
      683   EDI-TEST-GF12-DELETE
      696   EDI-TEST-GF12-EXIT . . . . . .  G682 G686
      687   EDI-TEST-GF12-R. . . . . . . .  P681
      413   EDI-TEST-GF2
      423   EDI-TEST-GF2-DELETE
      436   EDI-TEST-GF2-EXIT. . . . . . .  G422 G426
      427   EDI-TEST-GF2-R . . . . . . . .  P421
      438   EDI-TEST-GF3
      448   EDI-TEST-GF3-DELETE
      461   EDI-TEST-GF3-EXIT. . . . . . .  G447 G451
      452   EDI-TEST-GF3-R . . . . . . . .  P446
      463   EDI-TEST-GF4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    20
0 Defined   Cross-reference of procedures   References

0     473   EDI-TEST-GF4-DELETE
      486   EDI-TEST-GF4-EXIT. . . . . . .  G472 G476
      477   EDI-TEST-GF4-R . . . . . . . .  P471
      488   EDI-TEST-GF5
      499   EDI-TEST-GF5-DELETE
      512   EDI-TEST-GF5-EXIT. . . . . . .  G498 G502
      503   EDI-TEST-GF5-R . . . . . . . .  P497
      514   EDI-TEST-GF6
      525   EDI-TEST-GF6-DELETE
      538   EDI-TEST-GF6-EXIT. . . . . . .  G524 G528
      529   EDI-TEST-GF6-R . . . . . . . .  P523
      540   EDI-TEST-GF7
      551   EDI-TEST-GF7-DELETE
      564   EDI-TEST-GF7-EXIT. . . . . . .  G550 G554
      555   EDI-TEST-GF7-R . . . . . . . .  P549
      566   EDI-TEST-GF8
      577   EDI-TEST-GF8-DELETE
      590   EDI-TEST-GF8-EXIT. . . . . . .  G576 G580
      581   EDI-TEST-GF8-R . . . . . . . .  P575
      592   EDI-TEST-GF9
      603   EDI-TEST-GF9-DELETE
      616   EDI-TEST-GF9-EXIT. . . . . . .  G602 G606
      607   EDI-TEST-GF9-R . . . . . . . .  P601
      719   EDI-WRITE-GF-13. . . . . . . .  G710
      742   EDI-WRITE-GF-14. . . . . . . .  G733
      307   END-ROUTINE. . . . . . . . . .  P276
      311   END-ROUTINE-1
      320   END-ROUTINE-12
      328   END-ROUTINE-13 . . . . . . . .  E276
      309   END-RTN-EXIT
      283   FAIL . . . . . . . . . . . . .  P409 P434 P459 P484 P510 P536 P562 P588 P614 P641 P668 P694 P718 P741
      361   FAIL-ROUTINE . . . . . . . . .  P292
      375   FAIL-ROUTINE-EX. . . . . . . .  E292 G369
      370   FAIL-ROUTINE-WRITE . . . . . .  G363 G364
      298   HEAD-ROUTINE . . . . . . . . .  P273
      281   INSPT
      269   OPEN-FILES
      282   PASS . . . . . . . . . . . . .  P406 P431 P456 P481 P507 P533 P559 P585 P611 P638 P665 P691 P707 P730
      286   PRINT-DETAIL . . . . . . . . .  P400 P410 P425 P435 P450 P460 P475 P485 P501 P511 P527 P537 P553 P563 P579 P589
                                            P605 P615 P632 P642 P659 P669 P685 P695 P713 P720 P736 P743
      387   SECT-NC125A-001
      279   TERMINATE-CALL
      277   TERMINATE-CCVS
      340   WRITE-LINE . . . . . . . . . .  P290 P291 P299 P300 P301 P302 P304 P305 P306 P308 P310 P319 P327 P333 P338 P339
                                            P367 P371 P373 P382
      356   WRT-LN . . . . . . . . . . . .  P346 P347 P348 P349 P350 P351 P352 P355 P360
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    21
0 Defined   Cross-reference of programs     References

        3   NC125A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC125A    Date 06/04/2022  Time 11:57:45   Page    22
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    729  IGYPG3173-W   The result of the comparison of operands WRK-EDIT-006 and 123456789012. is known at compile time, based on the
                       attributes of the operands.  Unconditional code was generated.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program NC125A:
 *    Source records = 747
 *    Data Division statements = 96
 *    Procedure Division statements = 440
 *    Generated COBOL statements = 0
 *    Program complexity factor = 448
0End of compilation 1,  program NC125A,  highest severity 4.
0Return code 4
