1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:43   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:43   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2104.2
   000002         000200 PROGRAM-ID.                                                      NC2104.2
   000003         000300     NC210A.                                                      NC2104.2
   000004         000500*                                                              *  NC2104.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2104.2
   000006         000700*                                                              *  NC2104.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2104.2
   000008         000900*                                                              *  NC2104.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2104.2
   000010         001100*                                                              *  NC2104.2
   000011         001300*                                                              *  NC2104.2
   000012         001400*    PROGRAM NC210A TESTS NESTED "IF" STATEMENTS, USING 63     *  NC2104.2
   000013         001500*    STATEMENTS AND 6 LEVELS OF NESTING IN ONE SENTENCE AND    *  NC2104.2
   000014         001600*    22 LEVELS OF NESTING IN A SECOND TEST.                    *  NC2104.2
   000015         001700*                                                              *  NC2104.2
   000016         001800*     X-CARDS USED ARE :-                                      *  NC2104.2
   000017         001900*                                                              *  NC2104.2
   000018         002000*      X-55  - SYSTEM PRINTER NAME.                            *  NC2104.2
   000019         002100*      X-82  - SOURCE COMPUTER NAME.                           *  NC2104.2
   000020         002200*      X-83  - OBJECT COMPUTER NAME.                           *  NC2104.2
   000021         002300*                                                              *  NC2104.2
   000022         002500 ENVIRONMENT DIVISION.                                            NC2104.2
   000023         002600 CONFIGURATION SECTION.                                           NC2104.2
   000024         002700 SOURCE-COMPUTER.                                                 NC2104.2
   000025         002800     XXXXX082.                                                    NC2104.2
   000026         002900 OBJECT-COMPUTER.                                                 NC2104.2
   000027         003000     XXXXX083.                                                    NC2104.2
   000028         003100 INPUT-OUTPUT SECTION.                                            NC2104.2
   000029         003200 FILE-CONTROL.                                                    NC2104.2
   000030         003300     SELECT PRINT-FILE ASSIGN TO                                  NC2104.2 34
   000031         003400     XXXXX055.                                                    NC2104.2
   000032         003500 DATA DIVISION.                                                   NC2104.2
   000033         003600 FILE SECTION.                                                    NC2104.2
   000034         003700 FD  PRINT-FILE.                                                  NC2104.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003800 01  PRINT-REC PICTURE X(120).                                    NC2104.2
   000036         003900 01  DUMMY-RECORD PICTURE X(120).                                 NC2104.2
   000037         004000 WORKING-STORAGE SECTION.                                         NC2104.2
   000038         004100 77  ACCUM-DATANAME PIC 99  VALUE ZERO.                           NC2104.2 IMP
   000039         004200 77  DATANAME-A  PIC 9 VALUE 0.                                   NC2104.2
   000040         004300 77  DATANAME-B  PIC 9 VALUE 0.                                   NC2104.2
   000041         004400 77  DATANAME-C  PIC 9 VALUE 0.                                   NC2104.2
   000042         004500 77  DATANAME-D  PIC 9 VALUE 0.                                   NC2104.2
   000043         004600 77  DATANAME-E  PIC 9 VALUE 0.                                   NC2104.2
   000044         004700 77  DATANAME-F  PIC 9 VALUE 0.                                   NC2104.2
   000045         004800 77  SUB-SCRIPT     PIC 99  VALUE 01.                             NC2104.2
   000046         004900 01  DATA-NAMES.                                                  NC2104.2
   000047         005000     02  ONE-A PIC 9 VALUE 0.                                     NC2104.2
   000048         005100     02  ONE-B PIC 9 VALUE 0.                                     NC2104.2
   000049         005200     02  ONE-C PIC 9 VALUE 0.                                     NC2104.2
   000050         005300     02  ONE-D PIC 9 VALUE 0.                                     NC2104.2
   000051         005400     02  ONE-E PIC 9 VALUE 0.                                     NC2104.2
   000052         005500     02  ONE-F PIC 9 VALUE 0.                                     NC2104.2
   000053         005600 01  ONE-X REDEFINES DATA-NAMES  PIC 9(6).                        NC2104.2 46
   000054         005700 01  BUILT-TABLE.                                                 NC2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02  A-POS                   PIC XX.                          NC2104.2
   000056         005900     02  B-POS                   PIC XX.                          NC2104.2
   000057         006000     02  C-POS                   PIC XX.                          NC2104.2
   000058         006100     02  D-POS                   PIC XXX.                         NC2104.2
   000059         006200     02  E-POS                   PIC XXX.                         NC2104.2
   000060         006300     02  F-POS                   PIC XXX.                         NC2104.2
   000061         006400 01  PARAGRAPH-NAME.                                              NC2104.2
   000062         006500     02  FILLER                  PIC X(11) VALUE "IF-TEST-GF-".   NC2104.2
   000063         006600     02  PAR-NUMBER              PIC 99  VALUE 00.                NC2104.2
   000064         006700 01  COMPARISON-TABLE.                                            NC2104.2
   000065         006800     02  FILLER PIC X(15) VALUE "A1B1C1D01E01F01".                NC2104.2
   000066         006900     02  FILLER PIC X(15) VALUE "A1B1C1D01E01F02".                NC2104.2
   000067         007000     02  FILLER PIC X(15) VALUE "A1B1C1D01E02F03".                NC2104.2
   000068         007100     02  FILLER PIC X(15) VALUE "A1B1C1D01E02F04".                NC2104.2
   000069         007200     02  FILLER PIC X(15) VALUE "A1B1C1D02E03F05".                NC2104.2
   000070         007300     02  FILLER PIC X(15) VALUE "A1B1C1D02E03F06".                NC2104.2
   000071         007400     02  FILLER PIC X(15) VALUE "A1B1C1D02E04F07".                NC2104.2
   000072         007500     02  FILLER PIC X(15) VALUE "A1B1C1D02E04F08".                NC2104.2
   000073         007600     02  FILLER PIC X(15) VALUE "A1B1C2D03E05F09".                NC2104.2
   000074         007700     02  FILLER PIC X(15) VALUE "A1B1C2D03E05F10".                NC2104.2
   000075         007800     02  FILLER PIC X(15) VALUE "A1B1C2D03E06F11".                NC2104.2
   000076         007900     02  FILLER PIC X(15) VALUE "A1B1C2D03E06F12".                NC2104.2
   000077         008000     02  FILLER PIC X(15) VALUE "A1B1C2D04E07F13".                NC2104.2
   000078         008100     02  FILLER PIC X(15) VALUE "A1B1C2D04E07F14".                NC2104.2
   000079         008200     02  FILLER PIC X(15) VALUE "A1B1C2D04E08F15".                NC2104.2
   000080         008300     02  FILLER PIC X(15) VALUE "A1B1C2D04E08F16".                NC2104.2
   000081         008400     02  FILLER PIC X(15) VALUE "A1B2C3D05E09F17".                NC2104.2
   000082         008500     02  FILLER PIC X(15) VALUE "A1B2C3D05E09F18".                NC2104.2
   000083         008600     02  FILLER PIC X(15) VALUE "A1B2C3D05E10F19".                NC2104.2
   000084         008700     02  FILLER PIC X(15) VALUE "A1B2C3D05E10F20".                NC2104.2
   000085         008800     02  FILLER PIC X(15) VALUE "A1B2C3D06E11F21".                NC2104.2
   000086         008900     02  FILLER PIC X(15) VALUE "A1B2C3D06E11F22".                NC2104.2
   000087         009000     02  FILLER PIC X(15) VALUE "A1B2C3D06E12F23".                NC2104.2
   000088         009100     02  FILLER PIC X(15) VALUE "A1B2C3D06E12F24".                NC2104.2
   000089         009200     02  FILLER PIC X(15) VALUE "A1B2C4D07E13F25".                NC2104.2
   000090         009300     02  FILLER PIC X(15) VALUE "A1B2C4D07E13F26".                NC2104.2
   000091         009400     02  FILLER PIC X(15) VALUE "A1B2C4D07E14F27".                NC2104.2
   000092         009500     02  FILLER PIC X(15) VALUE "A1B2C4D07E14F28".                NC2104.2
   000093         009600     02  FILLER PIC X(15) VALUE "A1B2C4D08E15F29".                NC2104.2
   000094         009700     02  FILLER PIC X(15) VALUE "A1B2C4D08E15F30".                NC2104.2
   000095         009800     02  FILLER PIC X(15) VALUE "A1B2C4D08E16F31".                NC2104.2
   000096         009900     02  FILLER PIC X(15) VALUE "A1B2C4D08E16F32".                NC2104.2
   000097         010000     02  FILLER PIC X(15) VALUE "A2B3C5D09E17F33".                NC2104.2
   000098         010100     02  FILLER PIC X(15) VALUE "A2B3C5D09E17F34".                NC2104.2
   000099         010200     02  FILLER PIC X(15) VALUE "A2B3C5D09E18F35".                NC2104.2
   000100         010300     02  FILLER PIC X(15) VALUE "A2B3C5D09E18F36".                NC2104.2
   000101         010400     02  FILLER PIC X(15) VALUE "A2B3C5D10E19F37".                NC2104.2
   000102         010500     02  FILLER PIC X(15) VALUE "A2B3C5D10E19F38".                NC2104.2
   000103         010600     02  FILLER PIC X(15) VALUE "A2B3C5D10E20F39".                NC2104.2
   000104         010700     02  FILLER PIC X(15) VALUE "A2B3C5D10E20F40".                NC2104.2
   000105         010800     02  FILLER PIC X(15) VALUE "A2B3C6D11E21F41".                NC2104.2
   000106         010900     02  FILLER PIC X(15) VALUE "A2B3C6D11E21F42".                NC2104.2
   000107         011000     02  FILLER PIC X(15) VALUE "A2B3C6D11E22F43".                NC2104.2
   000108         011100     02  FILLER PIC X(15) VALUE "A2B3C6D11E22F44".                NC2104.2
   000109         011200     02  FILLER PIC X(15) VALUE "A2B3C6D12E23F45".                NC2104.2
   000110         011300     02  FILLER PIC X(15) VALUE "A2B3C6D12E23F46".                NC2104.2
   000111         011400     02  FILLER PIC X(15) VALUE "A2B3C6D12E24F47".                NC2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02  FILLER PIC X(15) VALUE "A2B3C6D12E24F48".                NC2104.2
   000113         011600     02  FILLER PIC X(15) VALUE "A2B4C7D13E25F49".                NC2104.2
   000114         011700     02  FILLER PIC X(15) VALUE "A2B4C7D13E25F50".                NC2104.2
   000115         011800     02  FILLER PIC X(15) VALUE "A2B4C7D13E26F51".                NC2104.2
   000116         011900     02  FILLER PIC X(15) VALUE "A2B4C7D13E26F52".                NC2104.2
   000117         012000     02  FILLER PIC X(15) VALUE "A2B4C7D14E27F53".                NC2104.2
   000118         012100     02  FILLER PIC X(15) VALUE "A2B4C7D14E27F54".                NC2104.2
   000119         012200     02  FILLER PIC X(15) VALUE "A2B4C7D14E28F55".                NC2104.2
   000120         012300     02  FILLER PIC X(15) VALUE "A2B4C7D14E28F56".                NC2104.2
   000121         012400     02  FILLER PIC X(15) VALUE "A2B4C8D15E29F57".                NC2104.2
   000122         012500     02  FILLER PIC X(15) VALUE "A2B4C8D15E29F58".                NC2104.2
   000123         012600     02  FILLER PIC X(15) VALUE "A2B4C8D15E30F59".                NC2104.2
   000124         012700     02  FILLER PIC X(15) VALUE "A2B4C8D15E30F60".                NC2104.2
   000125         012800     02  FILLER PIC X(15) VALUE "A2B4C8D16E31F61".                NC2104.2
   000126         012900     02  FILLER PIC X(15) VALUE "A2B4C8D16E31F62".                NC2104.2
   000127         013000     02  FILLER PIC X(15) VALUE "A2B4C8D16E32F63".                NC2104.2
   000128         013100     02  FILLER PIC X(15) VALUE "A2B4C8D16E32F64".                NC2104.2
   000129         013200 01  COMP-TBL REDEFINES COMPARISON-TABLE.                         NC2104.2 64
   000130         013300     02  CORRECT-ENTRY OCCURS 64 TIMES PIC X(15).                 NC2104.2
   000131         013400 01  T-F  PIC X(5) VALUE "FALSE".                                 NC2104.2
   000132         013500 01  CHECK-PARA.                                                  NC2104.2
   000133         013600     02  FILLER  PIC X(21) VALUE "VALUE OF DATANAME AT ".         NC2104.2
   000134         013700     02  CHECK-VALU  PIC 99.                                      NC2104.2
   000135         013800     02  FILLER  PIC X(4) VALUE SPACES.                           NC2104.2 IMP
   000136         013900 01  TEST-RESULTS.                                                NC2104.2
   000137         014000     02 FILLER                   PIC X      VALUE SPACE.          NC2104.2 IMP
   000138         014100     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2104.2 IMP
   000139         014200     02 FILLER                   PIC X      VALUE SPACE.          NC2104.2 IMP
   000140         014300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2104.2 IMP
   000141         014400     02 FILLER                   PIC X      VALUE SPACE.          NC2104.2 IMP
   000142         014500     02  PAR-NAME.                                                NC2104.2
   000143         014600       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2104.2 IMP
   000144         014700       03  PARDOT-X              PIC X      VALUE SPACE.          NC2104.2 IMP
   000145         014800       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2104.2 IMP
   000146         014900     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2104.2 IMP
   000147         015000     02 RE-MARK                  PIC X(61).                       NC2104.2
   000148         015100 01  TEST-COMPUTED.                                               NC2104.2
   000149         015200     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2104.2 IMP
   000150         015300     02 FILLER                   PIC X(17)  VALUE                 NC2104.2
   000151         015400            "       COMPUTED=".                                   NC2104.2
   000152         015500     02 COMPUTED-X.                                               NC2104.2
   000153         015600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2104.2 IMP
   000154         015700     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2104.2 153
   000155         015800                                 PIC -9(9).9(9).                  NC2104.2
   000156         015900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2104.2 153
   000157         016000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2104.2 153
   000158         016100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2104.2 153
   000159         016200     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2104.2 153
   000160         016300         04 COMPUTED-18V0                    PIC -9(18).          NC2104.2
   000161         016400         04 FILLER                           PIC X.               NC2104.2
   000162         016500     03 FILLER PIC X(50) VALUE SPACE.                             NC2104.2 IMP
   000163         016600 01  TEST-CORRECT.                                                NC2104.2
   000164         016700     02 FILLER PIC X(30) VALUE SPACE.                             NC2104.2 IMP
   000165         016800     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2104.2
   000166         016900     02 CORRECT-X.                                                NC2104.2
   000167         017000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2104.2 IMP
   000168         017100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2104.2 167
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2104.2 167
   000170         017300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2104.2 167
   000171         017400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2104.2 167
   000172         017500     03      CR-18V0 REDEFINES CORRECT-A.                         NC2104.2 167
   000173         017600         04 CORRECT-18V0                     PIC -9(18).          NC2104.2
   000174         017700         04 FILLER                           PIC X.               NC2104.2
   000175         017800     03 FILLER PIC X(2) VALUE SPACE.                              NC2104.2 IMP
   000176         017900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2104.2 IMP
   000177         018000 01  CCVS-C-1.                                                    NC2104.2
   000178         018100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2104.2
   000179         018200-    "SS  PARAGRAPH-NAME                                          NC2104.2
   000180         018300-    "       REMARKS".                                            NC2104.2
   000181         018400     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2104.2 IMP
   000182         018500 01  CCVS-C-2.                                                    NC2104.2
   000183         018600     02 FILLER                     PIC X        VALUE SPACE.      NC2104.2 IMP
   000184         018700     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2104.2
   000185         018800     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2104.2 IMP
   000186         018900     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2104.2
   000187         019000     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2104.2 IMP
   000188         019100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2104.2 IMP
   000189         019200 01  REC-CT                        PIC 99       VALUE ZERO.       NC2104.2 IMP
   000190         019300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2104.2 IMP
   000191         019400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2104.2 IMP
   000192         019500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2104.2 IMP
   000193         019600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2104.2 IMP
   000194         019700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2104.2 IMP
   000195         019800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2104.2 IMP
   000196         019900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2104.2 IMP
   000197         020000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2104.2 IMP
   000198         020100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2104.2 IMP
   000199         020200 01  CCVS-H-1.                                                    NC2104.2
   000200         020300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2104.2 IMP
   000201         020400     02  FILLER                    PIC X(42)    VALUE             NC2104.2
   000202         020500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2104.2
   000203         020600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2104.2 IMP
   000204         020700 01  CCVS-H-2A.                                                   NC2104.2
   000205         020800   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2104.2 IMP
   000206         020900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2104.2
   000207         021000   02  FILLER                        PIC XXXX   VALUE             NC2104.2
   000208         021100     "4.2 ".                                                      NC2104.2
   000209         021200   02  FILLER                        PIC X(28)  VALUE             NC2104.2
   000210         021300            " COPY - NOT FOR DISTRIBUTION".                       NC2104.2
   000211         021400   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2104.2 IMP
   000212         021500                                                                  NC2104.2
   000213         021600 01  CCVS-H-2B.                                                   NC2104.2
   000214         021700   02  FILLER                        PIC X(15)  VALUE             NC2104.2
   000215         021800            "TEST RESULT OF ".                                    NC2104.2
   000216         021900   02  TEST-ID                       PIC X(9).                    NC2104.2
   000217         022000   02  FILLER                        PIC X(4)   VALUE             NC2104.2
   000218         022100            " IN ".                                               NC2104.2
   000219         022200   02  FILLER                        PIC X(12)  VALUE             NC2104.2
   000220         022300     " HIGH       ".                                              NC2104.2
   000221         022400   02  FILLER                        PIC X(22)  VALUE             NC2104.2
   000222         022500            " LEVEL VALIDATION FOR ".                             NC2104.2
   000223         022600   02  FILLER                        PIC X(58)  VALUE             NC2104.2
   000224         022700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2104.2
   000225         022800 01  CCVS-H-3.                                                    NC2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     02  FILLER                      PIC X(34)  VALUE             NC2104.2
   000227         023000            " FOR OFFICIAL USE ONLY    ".                         NC2104.2
   000228         023100     02  FILLER                      PIC X(58)  VALUE             NC2104.2
   000229         023200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2104.2
   000230         023300     02  FILLER                      PIC X(28)  VALUE             NC2104.2
   000231         023400            "  COPYRIGHT   1985 ".                                NC2104.2
   000232         023500 01  CCVS-E-1.                                                    NC2104.2
   000233         023600     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2104.2 IMP
   000234         023700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2104.2
   000235         023800     02 ID-AGAIN                     PIC X(9).                    NC2104.2
   000236         023900     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2104.2 IMP
   000237         024000 01  CCVS-E-2.                                                    NC2104.2
   000238         024100     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2104.2 IMP
   000239         024200     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2104.2 IMP
   000240         024300     02 CCVS-E-2-2.                                               NC2104.2
   000241         024400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2104.2 IMP
   000242         024500         03 FILLER                   PIC X      VALUE SPACE.      NC2104.2 IMP
   000243         024600         03 ENDER-DESC               PIC X(44)  VALUE             NC2104.2
   000244         024700            "ERRORS ENCOUNTERED".                                 NC2104.2
   000245         024800 01  CCVS-E-3.                                                    NC2104.2
   000246         024900     02  FILLER                      PIC X(22)  VALUE             NC2104.2
   000247         025000            " FOR OFFICIAL USE ONLY".                             NC2104.2
   000248         025100     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2104.2 IMP
   000249         025200     02  FILLER                      PIC X(58)  VALUE             NC2104.2
   000250         025300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2104.2
   000251         025400     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2104.2 IMP
   000252         025500     02 FILLER                       PIC X(15)  VALUE             NC2104.2
   000253         025600             " COPYRIGHT 1985".                                   NC2104.2
   000254         025700 01  CCVS-E-4.                                                    NC2104.2
   000255         025800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2104.2 IMP
   000256         025900     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2104.2
   000257         026000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2104.2 IMP
   000258         026100     02 FILLER                       PIC X(40)  VALUE             NC2104.2
   000259         026200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2104.2
   000260         026300 01  XXINFO.                                                      NC2104.2
   000261         026400     02 FILLER                       PIC X(19)  VALUE             NC2104.2
   000262         026500            "*** INFORMATION ***".                                NC2104.2
   000263         026600     02 INFO-TEXT.                                                NC2104.2
   000264         026700       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2104.2 IMP
   000265         026800       04 XXCOMPUTED                 PIC X(20).                   NC2104.2
   000266         026900       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2104.2 IMP
   000267         027000       04 XXCORRECT                  PIC X(20).                   NC2104.2
   000268         027100     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2104.2
   000269         027200 01  HYPHEN-LINE.                                                 NC2104.2
   000270         027300     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2104.2 IMP
   000271         027400     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2104.2
   000272         027500-    "*****************************************".                 NC2104.2
   000273         027600     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2104.2
   000274         027700-    "******************************".                            NC2104.2
   000275         027800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2104.2
   000276         027900     "NC210A".                                                    NC2104.2
   000277         028000 PROCEDURE DIVISION.                                              NC2104.2
   000278         028100 CCVS1 SECTION.                                                   NC2104.2
   000279         028200 OPEN-FILES.                                                      NC2104.2
   000280         028300     OPEN     OUTPUT PRINT-FILE.                                  NC2104.2 34
   000281         028400     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2104.2 275 216 275 235
   000282         028500     MOVE    SPACE TO TEST-RESULTS.                               NC2104.2 IMP 136
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2104.2 306 311
   000284         028700     GO TO CCVS1-EXIT.                                            NC2104.2 388
   000285         028800 CLOSE-FILES.                                                     NC2104.2
   000286         028900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2104.2 315 336 34
   000287         029000 TERMINATE-CCVS.                                                  NC2104.2
   000288         029100     STOP     RUN.                                                NC2104.2
   000289         029200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2104.2 140 192
   000290         029300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2104.2 140 193
   000291         029400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2104.2 140 191
   000292         029500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2104.2 140 190
   000293         029600     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2104.2 147
   000294         029700 PRINT-DETAIL.                                                    NC2104.2
   000295         029800     IF REC-CT NOT EQUAL TO ZERO                                  NC2104.2 189 IMP
   000296      1  029900             MOVE "." TO PARDOT-X                                 NC2104.2 144
   000297      1  030000             MOVE REC-CT TO DOTVALUE.                             NC2104.2 189 145
   000298         030100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2104.2 136 35 348
   000299         030200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2104.2 140 348
   000300      1  030300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2104.2 365 378
   000301      1  030400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2104.2 379 387
   000302         030500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2104.2 IMP 140 IMP 152
   000303         030600     MOVE SPACE TO CORRECT-X.                                     NC2104.2 IMP 166
   000304         030700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2104.2 189 IMP IMP 142
   000305         030800     MOVE     SPACE TO RE-MARK.                                   NC2104.2 IMP 147
   000306         030900 HEAD-ROUTINE.                                                    NC2104.2
   000307         031000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2104.2 199 36 348
   000308         031100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2104.2 204 36 348
   000309         031200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2104.2 213 36 348
   000310         031300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2104.2 225 36 348
   000311         031400 COLUMN-NAMES-ROUTINE.                                            NC2104.2
   000312         031500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2104.2 177 36 348
   000313         031600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2104.2 182 36 348
   000314         031700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2104.2 269 36 348
   000315         031800 END-ROUTINE.                                                     NC2104.2
   000316         031900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2104.2 269 36 348
   000317         032000 END-RTN-EXIT.                                                    NC2104.2
   000318         032100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2104.2 232 36 348
   000319         032200 END-ROUTINE-1.                                                   NC2104.2
   000320         032300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2104.2 191 195 192
   000321         032400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2104.2 195 190 195
   000322         032500      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2104.2 193 195
   000323         032600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2104.2
   000324         032700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2104.2 193 255
   000325         032800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2104.2 195 257
   000326         032900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2104.2 254 240
   000327         033000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2104.2 237 36 348
   000328         033100  END-ROUTINE-12.                                                 NC2104.2
   000329         033200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2104.2 243
   000330         033300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2104.2 191 IMP
   000331      1  033400         MOVE "NO " TO ERROR-TOTAL                                NC2104.2 241
   000332         033500         ELSE                                                     NC2104.2
   000333      1  033600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2104.2 191 241
   000334         033700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2104.2 237 36
   000335         033800     PERFORM WRITE-LINE.                                          NC2104.2 348
   000336         033900 END-ROUTINE-13.                                                  NC2104.2
   000337         034000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2104.2 190 IMP
   000338      1  034100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2104.2 241
   000339      1  034200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2104.2 190 241
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2104.2 243
   000341         034400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2104.2 237 36 348
   000342         034500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2104.2 192 IMP
   000343      1  034600          MOVE "NO " TO ERROR-TOTAL                               NC2104.2 241
   000344      1  034700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2104.2 192 241
   000345         034800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2104.2 243
   000346         034900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2104.2 237 36 348
   000347         035000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2104.2 245 36 348
   000348         035100 WRITE-LINE.                                                      NC2104.2
   000349         035200     ADD 1 TO RECORD-COUNT.                                       NC2104.2 197
   000350         035300     IF RECORD-COUNT GREATER 50                                   NC2104.2 197
   000351      1  035400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2104.2 36 196
   000352      1  035500         MOVE SPACE TO DUMMY-RECORD                               NC2104.2 IMP 36
   000353      1  035600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2104.2 36
   000354      1  035700         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2104.2 177 36 360
   000355      1  035800         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2104.2 182 36 360
   000356      1  035900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2104.2 269 36 360
   000357      1  036000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2104.2 196 36
   000358      1  036100         MOVE ZERO TO RECORD-COUNT.                               NC2104.2 IMP 197
   000359         036200     PERFORM WRT-LN.                                              NC2104.2 360
   000360         036300 WRT-LN.                                                          NC2104.2
   000361         036400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2104.2 36
   000362         036500     MOVE SPACE TO DUMMY-RECORD.                                  NC2104.2 IMP 36
   000363         036600 BLANK-LINE-PRINT.                                                NC2104.2
   000364         036700     PERFORM WRT-LN.                                              NC2104.2 360
   000365         036800 FAIL-ROUTINE.                                                    NC2104.2
   000366         036900     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2104.2 152 IMP 373
   000367         037000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2104.2 166 IMP 373
   000368         037100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2104.2 198 268
   000369         037200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2104.2 263
   000370         037300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2104.2 260 36 348
   000371         037400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2104.2 IMP 268
   000372         037500     GO TO  FAIL-ROUTINE-EX.                                      NC2104.2 378
   000373         037600 FAIL-ROUTINE-WRITE.                                              NC2104.2
   000374         037700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2104.2 148 35 348
   000375         037800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2104.2 198 176
   000376         037900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2104.2 163 35 348
   000377         038000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2104.2 IMP 176
   000378         038100 FAIL-ROUTINE-EX. EXIT.                                           NC2104.2
   000379         038200 BAIL-OUT.                                                        NC2104.2
   000380         038300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2104.2 153 IMP 382
   000381         038400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2104.2 167 IMP 387
   000382         038500 BAIL-OUT-WRITE.                                                  NC2104.2
   000383         038600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2104.2 167 267 153 265
   000384         038700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2104.2 198 268
   000385         038800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2104.2 260 36 348
   000386         038900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2104.2 IMP 268
   000387         039000 BAIL-OUT-EX. EXIT.                                               NC2104.2
   000388         039100 CCVS1-EXIT.                                                      NC2104.2
   000389         039200     EXIT.                                                        NC2104.2
   000390         039300 SECT-NC210A-001 SECTION.                                         NC2104.2
   000391         039400 IF-INIT-GF-X.                                                    NC2104.2
   000392         039500     MOVE   "VI-89 6.15.4 GR1(C)" TO ANSI-REFERENCE.              NC2104.2 198
   000393         039600 IF-TEST-GF-X.                                                    NC2104.2
   000394         039700     IF DATANAME-A EQUAL TO ONE-A                                 NC2104.2 39 47
   000395      1  039800         MOVE "A1" TO A-POS                                       NC2104.2 55
   000396      1  039900         IF DATANAME-B EQUAL TO ONE-B                             NC2104.2 40 48
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      2  040000             MOVE "B1" TO B-POS                                   NC2104.2 56
   000398      2  040100             IF DATANAME-C EQUAL TO ONE-C                         NC2104.2 41 49
   000399      3  040200                 MOVE "C1" TO C-POS                               NC2104.2 57
   000400      3  040300                 IF DATANAME-D EQUAL TO ONE-D                     NC2104.2 42 50
   000401      4  040400                     MOVE "D01" TO D-POS                          NC2104.2 58
   000402      4  040500                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000403      5  040600                         MOVE "E01" TO E-POS                      NC2104.2 59
   000404      5  040700                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000405      6  040800                             MOVE "F01" TO F-POS                  NC2104.2 60
   000406      5  040900                           ELSE                                   NC2104.2
   000407      6  041000                             MOVE "F02" TO F-POS                  NC2104.2 60
   000408      4  041100                       ELSE                                       NC2104.2
   000409      5  041200                         MOVE "E02" TO E-POS                      NC2104.2 59
   000410      5  041300                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000411      6  041400                             MOVE "F03" TO F-POS                  NC2104.2 60
   000412      5  041500                           ELSE                                   NC2104.2
   000413      6  041600                             MOVE "F04" TO F-POS                  NC2104.2 60
   000414      3  041700                   ELSE                                           NC2104.2
   000415      4  041800                     MOVE "D02" TO D-POS                          NC2104.2 58
   000416      4  041900                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000417      5  042000                         MOVE "E03" TO E-POS                      NC2104.2 59
   000418      5  042100                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000419      6  042200                             MOVE "F05" TO F-POS                  NC2104.2 60
   000420      5  042300                           ELSE                                   NC2104.2
   000421      6  042400                             MOVE "F06" TO F-POS                  NC2104.2 60
   000422      4  042500                       ELSE                                       NC2104.2
   000423      5  042600                         MOVE "E04" TO E-POS                      NC2104.2 59
   000424      5  042700                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000425      6  042800                             MOVE "F07" TO F-POS                  NC2104.2 60
   000426      5  042900                           ELSE                                   NC2104.2
   000427      6  043000                             MOVE "F08" TO F-POS                  NC2104.2 60
   000428      2  043100               ELSE                                               NC2104.2
   000429      3  043200                 MOVE "C2" TO C-POS                               NC2104.2 57
   000430      3  043300                 IF DATANAME-D EQUAL TO ONE-D                     NC2104.2 42 50
   000431      4  043400                     MOVE "D03" TO D-POS                          NC2104.2 58
   000432      4  043500                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000433      5  043600                         MOVE "E05" TO E-POS                      NC2104.2 59
   000434      5  043700                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000435      6  043800                             MOVE "F09" TO F-POS                  NC2104.2 60
   000436      5  043900                           ELSE                                   NC2104.2
   000437      6  044000                             MOVE "F10" TO F-POS                  NC2104.2 60
   000438      4  044100                       ELSE                                       NC2104.2
   000439      5  044200                         MOVE "E06" TO E-POS                      NC2104.2 59
   000440      5  044300                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000441      6  044400                             MOVE "F11" TO F-POS                  NC2104.2 60
   000442      5  044500                           ELSE                                   NC2104.2
   000443      6  044600                             MOVE "F12" TO F-POS                  NC2104.2 60
   000444      3  044700                   ELSE                                           NC2104.2
   000445      4  044800                     MOVE "D04" TO D-POS                          NC2104.2 58
   000446      4  044900                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000447      5  045000                         MOVE "E07" TO E-POS                      NC2104.2 59
   000448      5  045100                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000449      6  045200                             MOVE "F13" TO F-POS                  NC2104.2 60
   000450      5  045300                           ELSE                                   NC2104.2
   000451      6  045400                             MOVE "F14" TO F-POS                  NC2104.2 60
   000452      4  045500                       ELSE                                       NC2104.2
   000453      5  045600                         MOVE "E08" TO E-POS                      NC2104.2 59
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      5  045700                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000455      6  045800                             MOVE "F15" TO F-POS                  NC2104.2 60
   000456      5  045900                           ELSE                                   NC2104.2
   000457      6  046000                             MOVE "F16" TO F-POS                  NC2104.2 60
   000458      1  046100           ELSE                                                   NC2104.2
   000459      2  046200             MOVE "B2" TO B-POS                                   NC2104.2 56
   000460      2  046300             IF DATANAME-C EQUAL TO ONE-C                         NC2104.2 41 49
   000461      3  046400                 MOVE "C3" TO C-POS                               NC2104.2 57
   000462      3  046500                 IF DATANAME-D EQUAL TO ONE-D                     NC2104.2 42 50
   000463      4  046600                     MOVE "D05" TO D-POS                          NC2104.2 58
   000464      4  046700                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000465      5  046800                         MOVE "E09" TO E-POS                      NC2104.2 59
   000466      5  046900                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000467      6  047000                             MOVE "F17" TO F-POS                  NC2104.2 60
   000468      5  047100                           ELSE                                   NC2104.2
   000469      6  047200                             MOVE "F18" TO F-POS                  NC2104.2 60
   000470      4  047300                       ELSE                                       NC2104.2
   000471      5  047400                         MOVE "E10" TO E-POS                      NC2104.2 59
   000472      5  047500                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000473      6  047600                             MOVE "F19" TO F-POS                  NC2104.2 60
   000474      5  047700                           ELSE                                   NC2104.2
   000475      6  047800                             MOVE "F20" TO F-POS                  NC2104.2 60
   000476      3  047900                   ELSE                                           NC2104.2
   000477      4  048000                     MOVE "D06" TO D-POS                          NC2104.2 58
   000478      4  048100                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000479      5  048200                         MOVE "E11" TO E-POS                      NC2104.2 59
   000480      5  048300                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000481      6  048400                             MOVE "F21" TO F-POS                  NC2104.2 60
   000482      5  048500                           ELSE                                   NC2104.2
   000483      6  048600                             MOVE "F22" TO F-POS                  NC2104.2 60
   000484      4  048700                       ELSE                                       NC2104.2
   000485      5  048800                         MOVE "E12" TO E-POS                      NC2104.2 59
   000486      5  048900                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000487      6  049000                             MOVE "F23" TO F-POS                  NC2104.2 60
   000488      5  049100                           ELSE                                   NC2104.2
   000489      6  049200                             MOVE "F24" TO F-POS                  NC2104.2 60
   000490      2  049300               ELSE                                               NC2104.2
   000491      3  049400                 MOVE "C4" TO C-POS                               NC2104.2 57
   000492      3  049500                 IF DATANAME-D EQUAL TO ONE-D                     NC2104.2 42 50
   000493      4  049600                     MOVE "D07" TO D-POS                          NC2104.2 58
   000494      4  049700                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000495      5  049800                         MOVE "E13" TO E-POS                      NC2104.2 59
   000496      5  049900                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000497      6  050000                             MOVE "F25" TO F-POS                  NC2104.2 60
   000498      5  050100                           ELSE                                   NC2104.2
   000499      6  050200                             MOVE "F26" TO F-POS                  NC2104.2 60
   000500      4  050300                       ELSE                                       NC2104.2
   000501      5  050400                         MOVE "E14" TO E-POS                      NC2104.2 59
   000502      5  050500                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000503      6  050600                             MOVE "F27" TO F-POS                  NC2104.2 60
   000504      5  050700                           ELSE                                   NC2104.2
   000505      6  050800                             MOVE "F28" TO F-POS                  NC2104.2 60
   000506      3  050900                   ELSE                                           NC2104.2
   000507      4  051000                     MOVE "D08" TO D-POS                          NC2104.2 58
   000508      4  051100                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000509      5  051200                         MOVE "E15" TO E-POS                      NC2104.2 59
   000510      5  051300                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      6  051400                             MOVE "F29" TO F-POS                  NC2104.2 60
   000512      5  051500                           ELSE                                   NC2104.2
   000513      6  051600                             MOVE "F30" TO F-POS                  NC2104.2 60
   000514      4  051700                       ELSE                                       NC2104.2
   000515      5  051800                         MOVE "E16" TO E-POS                      NC2104.2 59
   000516      5  051900                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000517      6  052000                             MOVE "F31" TO F-POS                  NC2104.2 60
   000518      5  052100                           ELSE                                   NC2104.2
   000519      6  052200                             MOVE "F32" TO F-POS                  NC2104.2 60
   000520         052300       ELSE                                                       NC2104.2
   000521      1  052400         MOVE "A2" TO A-POS                                       NC2104.2 55
   000522      1  052500         IF DATANAME-B EQUAL TO ONE-B                             NC2104.2 40 48
   000523      2  052600             MOVE "B3" TO B-POS                                   NC2104.2 56
   000524      2  052700             IF DATANAME-C EQUAL TO ONE-C                         NC2104.2 41 49
   000525      3  052800                 MOVE "C5" TO C-POS                               NC2104.2 57
   000526      3  052900                 IF DATANAME-D EQUAL TO ONE-D                     NC2104.2 42 50
   000527      4  053000                     MOVE "D09" TO D-POS                          NC2104.2 58
   000528      4  053100                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000529      5  053200                         MOVE "E17" TO E-POS                      NC2104.2 59
   000530      5  053300                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000531      6  053400                             MOVE "F33" TO F-POS                  NC2104.2 60
   000532      5  053500                           ELSE                                   NC2104.2
   000533      6  053600                             MOVE "F34" TO F-POS                  NC2104.2 60
   000534      4  053700                       ELSE                                       NC2104.2
   000535      5  053800                         MOVE "E18" TO E-POS                      NC2104.2 59
   000536      5  053900                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000537      6  054000                             MOVE "F35" TO F-POS                  NC2104.2 60
   000538      5  054100                           ELSE                                   NC2104.2
   000539      6  054200                             MOVE "F36" TO F-POS                  NC2104.2 60
   000540      3  054300                   ELSE                                           NC2104.2
   000541      4  054400                     MOVE "D10" TO D-POS                          NC2104.2 58
   000542      4  054500                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000543      5  054600                         MOVE "E19" TO E-POS                      NC2104.2 59
   000544      5  054700                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000545      6  054800                             MOVE "F37" TO F-POS                  NC2104.2 60
   000546      5  054900                           ELSE                                   NC2104.2
   000547      6  055000                             MOVE "F38" TO F-POS                  NC2104.2 60
   000548      4  055100                       ELSE                                       NC2104.2
   000549      5  055200                         MOVE "E20" TO E-POS                      NC2104.2 59
   000550      5  055300                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000551      6  055400                             MOVE "F39" TO F-POS                  NC2104.2 60
   000552      5  055500                           ELSE                                   NC2104.2
   000553      6  055600                             MOVE "F40" TO F-POS                  NC2104.2 60
   000554      2  055700               ELSE                                               NC2104.2
   000555      3  055800                 MOVE "C6" TO C-POS                               NC2104.2 57
   000556      3  055900                 IF DATANAME-D EQUAL TO ONE-D                     NC2104.2 42 50
   000557      4  056000                     MOVE "D11" TO D-POS                          NC2104.2 58
   000558      4  056100                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000559      5  056200                         MOVE "E21" TO E-POS                      NC2104.2 59
   000560      5  056300                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000561      6  056400                             MOVE "F41" TO F-POS                  NC2104.2 60
   000562      5  056500                           ELSE                                   NC2104.2
   000563      6  056600                             MOVE "F42" TO F-POS                  NC2104.2 60
   000564      4  056700                       ELSE                                       NC2104.2
   000565      5  056800                         MOVE "E22" TO E-POS                      NC2104.2 59
   000566      5  056900                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000567      6  057000                             MOVE "F43" TO F-POS                  NC2104.2 60
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      5  057100                           ELSE                                   NC2104.2
   000569      6  057200                             MOVE "F44" TO F-POS                  NC2104.2 60
   000570      3  057300                   ELSE                                           NC2104.2
   000571      4  057400                     MOVE "D12" TO D-POS                          NC2104.2 58
   000572      4  057500                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000573      5  057600                         MOVE "E23" TO E-POS                      NC2104.2 59
   000574      5  057700                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000575      6  057800                             MOVE "F45" TO F-POS                  NC2104.2 60
   000576      5  057900                           ELSE                                   NC2104.2
   000577      6  058000                             MOVE "F46" TO F-POS                  NC2104.2 60
   000578      4  058100                       ELSE                                       NC2104.2
   000579      5  058200                         MOVE "E24" TO E-POS                      NC2104.2 59
   000580      5  058300                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000581      6  058400                             MOVE "F47" TO F-POS                  NC2104.2 60
   000582      5  058500                           ELSE                                   NC2104.2
   000583      6  058600                             MOVE "F48" TO F-POS                  NC2104.2 60
   000584      1  058700           ELSE                                                   NC2104.2
   000585      2  058800             MOVE "B4" TO B-POS                                   NC2104.2 56
   000586      2  058900             IF DATANAME-C EQUAL TO ONE-C                         NC2104.2 41 49
   000587      3  059000                 MOVE "C7" TO C-POS                               NC2104.2 57
   000588      3  059100                 IF DATANAME-D EQUAL TO ONE-D                     NC2104.2 42 50
   000589      4  059200                     MOVE "D13" TO D-POS                          NC2104.2 58
   000590      4  059300                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000591      5  059400                         MOVE "E25" TO E-POS                      NC2104.2 59
   000592      5  059500                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000593      6  059600                             MOVE "F49" TO F-POS                  NC2104.2 60
   000594      5  059700                           ELSE                                   NC2104.2
   000595      6  059800                             MOVE "F50" TO F-POS                  NC2104.2 60
   000596      4  059900                       ELSE                                       NC2104.2
   000597      5  060000                         MOVE "E26" TO E-POS                      NC2104.2 59
   000598      5  060100                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000599      6  060200                             MOVE "F51" TO F-POS                  NC2104.2 60
   000600      5  060300                           ELSE                                   NC2104.2
   000601      6  060400                             MOVE "F52" TO F-POS                  NC2104.2 60
   000602      3  060500                   ELSE                                           NC2104.2
   000603      4  060600                     MOVE "D14" TO D-POS                          NC2104.2 58
   000604      4  060700                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000605      5  060800                         MOVE "E27" TO E-POS                      NC2104.2 59
   000606      5  060900                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000607      6  061000                             MOVE "F53" TO F-POS                  NC2104.2 60
   000608      5  061100                           ELSE                                   NC2104.2
   000609      6  061200                             MOVE "F54" TO F-POS                  NC2104.2 60
   000610      4  061300                       ELSE                                       NC2104.2
   000611      5  061400                         MOVE "E28" TO E-POS                      NC2104.2 59
   000612      5  061500                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000613      6  061600                             MOVE "F55" TO F-POS                  NC2104.2 60
   000614      5  061700                           ELSE                                   NC2104.2
   000615      6  061800                             MOVE "F56" TO F-POS                  NC2104.2 60
   000616      2  061900               ELSE                                               NC2104.2
   000617      3  062000                 MOVE "C8" TO C-POS                               NC2104.2 57
   000618      3  062100                 IF DATANAME-D EQUAL TO ONE-D                     NC2104.2 42 50
   000619      4  062200                     MOVE "D15" TO D-POS                          NC2104.2 58
   000620      4  062300                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000621      5  062400                         MOVE "E29" TO E-POS                      NC2104.2 59
   000622      5  062500                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000623      6  062600                             MOVE "F57" TO F-POS                  NC2104.2 60
   000624      5  062700                           ELSE                                   NC2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      6  062800                             MOVE "F58" TO F-POS                  NC2104.2 60
   000626      4  062900                       ELSE                                       NC2104.2
   000627      5  063000                         MOVE "E30" TO E-POS                      NC2104.2 59
   000628      5  063100                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000629      6  063200                             MOVE "F59" TO F-POS                  NC2104.2 60
   000630      5  063300                           ELSE                                   NC2104.2
   000631      6  063400                             MOVE "F60" TO F-POS                  NC2104.2 60
   000632      3  063500                   ELSE                                           NC2104.2
   000633      4  063600                     MOVE "D16" TO D-POS                          NC2104.2 58
   000634      4  063700                     IF DATANAME-E EQUAL TO ONE-E                 NC2104.2 43 51
   000635      5  063800                         MOVE "E31" TO E-POS                      NC2104.2 59
   000636      5  063900                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000637      6  064000                             MOVE "F61" TO F-POS                  NC2104.2 60
   000638      5  064100                           ELSE                                   NC2104.2
   000639      6  064200                             MOVE "F62" TO F-POS                  NC2104.2 60
   000640      4  064300                       ELSE                                       NC2104.2
   000641      5  064400                         MOVE "E32" TO E-POS                      NC2104.2 59
   000642      5  064500                         IF DATANAME-F EQUAL TO ONE-F             NC2104.2 44 52
   000643      6  064600                             MOVE "F63" TO F-POS                  NC2104.2 60
   000644      5  064700                           ELSE                                   NC2104.2
   000645      6  064800                             MOVE "F64" TO F-POS.                 NC2104.2 60
   000646         064900     IF BUILT-TABLE EQUAL TO CORRECT-ENTRY (SUB-SCRIPT)           NC2104.2 54 130 45
   000647      1  065000         PERFORM PASS                                             NC2104.2 290
   000648      1  065100         GO TO IF-WRITE-GF-X.                                     NC2104.2 659
   000649         065200     GO TO IF-FAIL-GF-X.                                          NC2104.2 655
   000650         065300 IF-DELETE-GF-X.                                                  NC2104.2
   000651         065400     MOVE 63 TO PAR-NUMBER.                                       NC2104.2 63
   000652         065500     PERFORM DE-LETE.                                             NC2104.2 292
   000653         065600     ADD 63 TO DELETE-COUNTER.                                    NC2104.2 190
   000654         065700     GO TO IF-WRITE-GF-X.                                         NC2104.2 659
   000655         065800 IF-FAIL-GF-X.                                                    NC2104.2
   000656         065900     MOVE BUILT-TABLE TO COMPUTED-A.                              NC2104.2 54 153
   000657         066000     MOVE CORRECT-ENTRY (SUB-SCRIPT) TO CORRECT-A.                NC2104.2 130 45 167
   000658         066100     PERFORM FAIL.                                                NC2104.2 291
   000659         066200 IF-WRITE-GF-X.                                                   NC2104.2
   000660         066300     ADD 1 TO PAR-NUMBER.                                         NC2104.2 63
   000661         066400     MOVE PARAGRAPH-NAME TO PAR-NAME.                             NC2104.2 61 142
   000662         066500     PERFORM PRINT-DETAIL.                                        NC2104.2 294
   000663         066600     IF PAR-NUMBER EQUAL TO 64 GO TO IF-INIT-GF-Y.                NC2104.2 63 674
   000664         066700     ADD 1 TO  SUB-SCRIPT.                                        NC2104.2 45
   000665         066800     MOVE SPACES TO BUILT-TABLE.                                  NC2104.2 IMP 54
   000666         066900     ADD 1 TO ONE-X.                                              NC2104.2 53
   000667         067000     IF ONE-F EQUAL TO 2 ADD 8 TO ONE-X.                          NC2104.2 52 53
   000668         067100     IF ONE-E EQUAL TO 2 ADD 80 TO ONE-X.                         NC2104.2 51 53
   000669         067200     IF ONE-D EQUAL TO 2 ADD 800 TO ONE-X.                        NC2104.2 50 53
   000670         067300     IF ONE-C EQUAL TO 2 ADD 8000 TO ONE-X.                       NC2104.2 49 53
   000671         067400     IF ONE-B EQUAL TO 2 ADD 80000 TO ONE-X.                      NC2104.2 48 53
   000672         067500     GO TO IF-INIT-GF-X.                                          NC2104.2 391
   000673         067600*                                                                 NC2104.2
   000674         067700 IF-INIT-GF-Y.                                                    NC2104.2
   000675         067800     MOVE   "VI-89 6.15.4 GR1(C)" TO ANSI-REFERENCE.              NC2104.2 198
   000676         067900     ADD 1 TO PAR-NUMBER.                                         NC2104.2 63
   000677         068000     MOVE 22 TO ACCUM-DATANAME.                                   NC2104.2 38
   000678         068100 IF-TEST-GF-Y.                                                    NC2104.2
   000679         068200     MOVE "FALSE" TO T-F.                                         NC2104.2 131
   000680         068300     IF ACCUM-DATANAME NOT EQUAL TO 1                             NC2104.2 38
   000681      1  068400     IF ACCUM-DATANAME NOT EQUAL TO 2                             NC2104.2 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682      2  068500     IF ACCUM-DATANAME NOT EQUAL TO 3                             NC2104.2 38
   000683      3  068600     IF ACCUM-DATANAME NOT EQUAL TO 4                             NC2104.2 38
   000684      4  068700     IF ACCUM-DATANAME NOT EQUAL TO 5                             NC2104.2 38
   000685      5  068800     IF ACCUM-DATANAME NOT EQUAL TO 6                             NC2104.2 38
   000686      6  068900     IF ACCUM-DATANAME NOT EQUAL TO 7                             NC2104.2 38
   000687      7  069000     IF ACCUM-DATANAME NOT EQUAL TO 8                             NC2104.2 38
   000688      8  069100     IF ACCUM-DATANAME NOT EQUAL TO 9                             NC2104.2 38
   000689      9  069200     IF ACCUM-DATANAME NOT EQUAL TO 10                            NC2104.2 38
   000690     10  069300     IF ACCUM-DATANAME NOT EQUAL TO 11                            NC2104.2 38
   000691     11  069400     IF ACCUM-DATANAME NOT EQUAL TO 12                            NC2104.2 38
   000692     12  069500     IF ACCUM-DATANAME NOT EQUAL TO 13                            NC2104.2 38
   000693     13  069600     IF ACCUM-DATANAME NOT EQUAL TO 14                            NC2104.2 38
   000694     14  069700     IF ACCUM-DATANAME NOT EQUAL TO 15                            NC2104.2 38
   000695     15  069800     IF ACCUM-DATANAME NOT EQUAL TO 16                            NC2104.2 38
   000696     16  069900     IF ACCUM-DATANAME NOT EQUAL TO 17                            NC2104.2 38
   000697     17  070000     IF ACCUM-DATANAME NOT EQUAL TO 18                            NC2104.2 38
   000698     18  070100     IF ACCUM-DATANAME NOT EQUAL TO 19                            NC2104.2 38
   000699     19  070200     IF ACCUM-DATANAME NOT EQUAL TO 20                            NC2104.2 38
   000700     20  070300     IF ACCUM-DATANAME NOT EQUAL TO 21                            NC2104.2 38
   000701     21  070400         MOVE "TRUE" TO T-F.                                      NC2104.2 131
   000702         070500     IF ACCUM-DATANAME EQUAL TO 22 AND T-F EQUAL TO "TRUE"        NC2104.2 38 131
   000703      1  070600         PERFORM PASS                                             NC2104.2 290
   000704      1  070700         PERFORM IF-WRITE-GF-Y                                    NC2104.2 722
   000705      1  070800         SUBTRACT 1 FROM ACCUM-DATANAME                           NC2104.2 38
   000706      1  070900         GO TO IF-TEST-GF-Y.                                      NC2104.2 678
   000707         071000     IF ACCUM-DATANAME LESS THAN 22 AND T-F EQUAL TO "FALSE"      NC2104.2 38 131
   000708      1  071100         PERFORM PASS                                             NC2104.2 290
   000709      1  071200         GO TO IF-WRITE-GF-Y                                      NC2104.2 722
   000710      1  071300     ELSE  GO TO IF-FAIL-GF-Y.                                    NC2104.2 717
   000711         071400 IF-DELETE-GF-Y.                                                  NC2104.2
   000712         071500     ADD 21 TO PAR-NUMBER.                                        NC2104.2 63
   000713         071600     PERFORM DE-LETE.                                             NC2104.2 292
   000714         071700     ADD 21 TO DELETE-COUNTER.                                    NC2104.2 190
   000715         071800     MOVE 1 TO ACCUM-DATANAME.                                    NC2104.2 38
   000716         071900     GO TO IF-WRITE-GF-Y.                                         NC2104.2 722
   000717         072000 IF-FAIL-GF-Y.                                                    NC2104.2
   000718         072100     MOVE "*****" TO COMPUTED-A  CORRECT-A.                       NC2104.2 153 167
   000719         072200     MOVE ACCUM-DATANAME TO CHECK-VALU.                           NC2104.2 38 134
   000720         072300     MOVE CHECK-PARA TO RE-MARK.                                  NC2104.2 132 147
   000721         072400     PERFORM FAIL.                                                NC2104.2 291
   000722         072500 IF-WRITE-GF-Y.                                                   NC2104.2
   000723         072600     MOVE PARAGRAPH-NAME TO PAR-NAME.                             NC2104.2 61 142
   000724         072700     ADD 1 TO PAR-NUMBER.                                         NC2104.2 63
   000725         072800     PERFORM PRINT-DETAIL.                                        NC2104.2 294
   000726         072900     IF ACCUM-DATANAME EQUAL TO 1 GO TO TEST-EXIT.                NC2104.2 38 730
   000727         073000     SUBTRACT 1 FROM ACCUM-DATANAME.                              NC2104.2 38
   000728         073100 IF-RETURN-GF-Y.                                                  NC2104.2
   000729         073200     GO TO IF-TEST-GF-Y.                                          NC2104.2 678
   000730         073300 TEST-EXIT.                                                       NC2104.2
   000731         073400     EXIT.                                                        NC2104.2
   000732         073500 CCVS-EXIT SECTION.                                               NC2104.2
   000733         073600 CCVS-999999.                                                     NC2104.2
   000734         073700     GO TO CLOSE-FILES.                                           NC2104.2 285
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       55   A-POS. . . . . . . . . . . . .  M395 M521
       38   ACCUM-DATANAME . . . . . . . .  M677 680 681 682 683 684 685 686 687 688 689 690 691 692 693 694 695 696 697
                                            698 699 700 702 M705 707 M715 719 726 M727
      198   ANSI-REFERENCE . . . . . . . .  368 375 384 M392 M675
       56   B-POS. . . . . . . . . . . . .  M397 M459 M523 M585
       54   BUILT-TABLE. . . . . . . . . .  646 656 M665
       57   C-POS. . . . . . . . . . . . .  M399 M429 M461 M491 M525 M555 M587 M617
      177   CCVS-C-1 . . . . . . . . . . .  312 354
      182   CCVS-C-2 . . . . . . . . . . .  313 355
      232   CCVS-E-1 . . . . . . . . . . .  318
      237   CCVS-E-2 . . . . . . . . . . .  327 334 341 346
      240   CCVS-E-2-2 . . . . . . . . . .  M326
      245   CCVS-E-3 . . . . . . . . . . .  347
      254   CCVS-E-4 . . . . . . . . . . .  326
      255   CCVS-E-4-1 . . . . . . . . . .  M324
      257   CCVS-E-4-2 . . . . . . . . . .  M325
      199   CCVS-H-1 . . . . . . . . . . .  307
      204   CCVS-H-2A. . . . . . . . . . .  308
      213   CCVS-H-2B. . . . . . . . . . .  309
      225   CCVS-H-3 . . . . . . . . . . .  310
      275   CCVS-PGM-ID. . . . . . . . . .  281 281
      132   CHECK-PARA . . . . . . . . . .  720
      134   CHECK-VALU . . . . . . . . . .  M719
      159   CM-18V0
      129   COMP-TBL
       64   COMPARISON-TABLE . . . . . . .  129
      153   COMPUTED-A . . . . . . . . . .  154 156 157 158 159 380 383 M656 M718
      154   COMPUTED-N
      152   COMPUTED-X . . . . . . . . . .  M302 366
      156   COMPUTED-0V18
      158   COMPUTED-14V4
      160   COMPUTED-18V0
      157   COMPUTED-4V14
      176   COR-ANSI-REFERENCE . . . . . .  M375 M377
      167   CORRECT-A. . . . . . . . . . .  168 169 170 171 172 381 383 M657 M718
      130   CORRECT-ENTRY. . . . . . . . .  646 657
      168   CORRECT-N
      166   CORRECT-X. . . . . . . . . . .  M303 367
      169   CORRECT-0V18
      171   CORRECT-14V4
      173   CORRECT-18V0
      170   CORRECT-4V14
      172   CR-18V0
       58   D-POS. . . . . . . . . . . . .  M401 M415 M431 M445 M463 M477 M493 M507 M527 M541 M557 M571 M589 M603 M619 M633
       46   DATA-NAMES . . . . . . . . . .  53
       39   DATANAME-A . . . . . . . . . .  394
       40   DATANAME-B . . . . . . . . . .  396 522
       41   DATANAME-C . . . . . . . . . .  398 460 524 586
       42   DATANAME-D . . . . . . . . . .  400 430 462 492 526 556 588 618
       43   DATANAME-E . . . . . . . . . .  402 416 432 446 464 478 494 508 528 542 558 572 590 604 620 634
       44   DATANAME-F . . . . . . . . . .  404 410 418 424 434 440 448 454 466 472 480 486 496 502 510 516 530 536 544 550
                                            560 566 574 580 592 598 606 612 622 628 636 642
      190   DELETE-COUNTER . . . . . . . .  M292 321 337 339 M653 M714
      145   DOTVALUE . . . . . . . . . . .  M297
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    17
0 Defined   Cross-reference of data names   References

0     196   DUMMY-HOLD . . . . . . . . . .  M351 357
       36   DUMMY-RECORD . . . . . . . . .  M307 M308 M309 M310 M312 M313 M314 M316 M318 M327 M334 M341 M346 M347 351 M352
                                            353 M354 M355 M356 M357 361 M362 M370 M385
       59   E-POS. . . . . . . . . . . . .  M403 M409 M417 M423 M433 M439 M447 M453 M465 M471 M479 M485 M495 M501 M509 M515
                                            M529 M535 M543 M549 M559 M565 M573 M579 M591 M597 M605 M611 M621 M627 M635 M641
      243   ENDER-DESC . . . . . . . . . .  M329 M340 M345
      191   ERROR-COUNTER. . . . . . . . .  M291 320 330 333
      195   ERROR-HOLD . . . . . . . . . .  M320 M321 M321 M322 325
      241   ERROR-TOTAL. . . . . . . . . .  M331 M333 M338 M339 M343 M344
       60   F-POS. . . . . . . . . . . . .  M405 M407 M411 M413 M419 M421 M425 M427 M435 M437 M441 M443 M449 M451 M455 M457
                                            M467 M469 M473 M475 M481 M483 M487 M489 M497 M499 M503 M505 M511 M513 M517 M519
                                            M531 M533 M537 M539 M545 M547 M551 M553 M561 M563 M567 M569 M575 M577 M581 M583
                                            M593 M595 M599 M601 M607 M609 M613 M615 M623 M625 M629 M631 M637 M639 M643 M645
      138   FEATURE
      269   HYPHEN-LINE. . . . . . . . . .  314 316 356
      235   ID-AGAIN . . . . . . . . . . .  M281
      268   INF-ANSI-REFERENCE . . . . . .  M368 M371 M384 M386
      263   INFO-TEXT. . . . . . . . . . .  M369
      192   INSPECT-COUNTER. . . . . . . .  M289 320 342 344
       47   ONE-A. . . . . . . . . . . . .  394
       48   ONE-B. . . . . . . . . . . . .  396 522 671
       49   ONE-C. . . . . . . . . . . . .  398 460 524 586 670
       50   ONE-D. . . . . . . . . . . . .  400 430 462 492 526 556 588 618 669
       51   ONE-E. . . . . . . . . . . . .  402 416 432 446 464 478 494 508 528 542 558 572 590 604 620 634 668
       52   ONE-F. . . . . . . . . . . . .  404 410 418 424 434 440 448 454 466 472 480 486 496 502 510 516 530 536 544 550
                                            560 566 574 580 592 598 606 612 622 628 636 642 667
       53   ONE-X. . . . . . . . . . . . .  M666 M667 M668 M669 M670 M671
      140   P-OR-F . . . . . . . . . . . .  M289 M290 M291 M292 299 M302
      142   PAR-NAME . . . . . . . . . . .  M304 M661 M723
       63   PAR-NUMBER . . . . . . . . . .  M651 M660 663 M676 M712 M724
       61   PARAGRAPH-NAME . . . . . . . .  661 723
      144   PARDOT-X . . . . . . . . . . .  M296
      193   PASS-COUNTER . . . . . . . . .  M290 322 324
       34   PRINT-FILE . . . . . . . . . .  30 280 286
       35   PRINT-REC. . . . . . . . . . .  M298 M374 M376
      147   RE-MARK. . . . . . . . . . . .  M293 M305 M720
      189   REC-CT . . . . . . . . . . . .  295 297 304
      188   REC-SKL-SUB
      197   RECORD-COUNT . . . . . . . . .  M349 350 M358
       45   SUB-SCRIPT . . . . . . . . . .  646 657 M664
      131   T-F. . . . . . . . . . . . . .  M679 M701 702 707
      148   TEST-COMPUTED. . . . . . . . .  374
      163   TEST-CORRECT . . . . . . . . .  376
      216   TEST-ID. . . . . . . . . . . .  M281
      136   TEST-RESULTS . . . . . . . . .  M282 298
      194   TOTAL-ERROR
      265   XXCOMPUTED . . . . . . . . . .  M383
      267   XXCORRECT. . . . . . . . . . .  M383
      260   XXINFO . . . . . . . . . . . .  370 385
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    18
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

      379   BAIL-OUT . . . . . . . . . . .  P301
      387   BAIL-OUT-EX. . . . . . . . . .  E301 G381
      382   BAIL-OUT-WRITE . . . . . . . .  G380
      363   BLANK-LINE-PRINT
      732   CCVS-EXIT
      733   CCVS-999999
      278   CCVS1
      388   CCVS1-EXIT . . . . . . . . . .  G284
      285   CLOSE-FILES. . . . . . . . . .  G734
      311   COLUMN-NAMES-ROUTINE . . . . .  E283
      292   DE-LETE. . . . . . . . . . . .  P652 P713
      315   END-ROUTINE. . . . . . . . . .  P286
      319   END-ROUTINE-1
      328   END-ROUTINE-12
      336   END-ROUTINE-13 . . . . . . . .  E286
      317   END-RTN-EXIT
      291   FAIL . . . . . . . . . . . . .  P658 P721
      365   FAIL-ROUTINE . . . . . . . . .  P300
      378   FAIL-ROUTINE-EX. . . . . . . .  E300 G372
      373   FAIL-ROUTINE-WRITE . . . . . .  G366 G367
      306   HEAD-ROUTINE . . . . . . . . .  P283
      650   IF-DELETE-GF-X
      711   IF-DELETE-GF-Y
      655   IF-FAIL-GF-X . . . . . . . . .  G649
      717   IF-FAIL-GF-Y . . . . . . . . .  G710
      391   IF-INIT-GF-X . . . . . . . . .  G672
      674   IF-INIT-GF-Y . . . . . . . . .  G663
      728   IF-RETURN-GF-Y
      393   IF-TEST-GF-X
      678   IF-TEST-GF-Y . . . . . . . . .  G706 G729
      659   IF-WRITE-GF-X. . . . . . . . .  G648 G654
      722   IF-WRITE-GF-Y. . . . . . . . .  P704 G709 G716
      289   INSPT
      279   OPEN-FILES
      290   PASS . . . . . . . . . . . . .  P647 P703 P708
      294   PRINT-DETAIL . . . . . . . . .  P662 P725
      390   SECT-NC210A-001
      287   TERMINATE-CCVS
      730   TEST-EXIT. . . . . . . . . . .  G726
      348   WRITE-LINE . . . . . . . . . .  P298 P299 P307 P308 P309 P310 P312 P313 P314 P316 P318 P327 P335 P341 P346 P347
                                            P370 P374 P376 P385
      360   WRT-LN . . . . . . . . . . . .  P354 P355 P356 P359 P364
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    19
0 Defined   Cross-reference of programs     References

        3   NC210A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC210A    Date 06/04/2022  Time 11:59:43   Page    20
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC210A:
 *    Source records = 734
 *    Data Division statements = 94
 *    Procedure Division statements = 399
 *    Generated COBOL statements = 0
 *    Program complexity factor = 411
0End of compilation 1,  program NC210A,  highest severity 0.
0Return code 0
