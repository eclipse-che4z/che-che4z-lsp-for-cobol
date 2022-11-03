1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:58   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:58   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2384.2
   000002         000200 PROGRAM-ID.                                                      NC2384.2
   000003         000300     NC238A.                                                      NC2384.2
   000004         000500*                                                              *  NC2384.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2384.2
   000006         000700*                                                              *  NC2384.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2384.2
   000008         000900*                                                              *  NC2384.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2384.2
   000010         001100*                                                              *  NC2384.2
   000011         001300*                                                              *  NC2384.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2384.2
   000013         001500*                                                              *  NC2384.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2384.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2384.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2384.2
   000017         001900*                                                              *  NC2384.2
   000018         002100*                                                                 NC2384.2
   000019         002200*    PROGRAM NC238A TESTS FORMATS 1 AND 2 OF THE "SEARCH"      *  NC2384.2
   000020         002300*    STATEMENT USING A TWO-DIMENDIONAL TABLE WITH ASCENDING    *  NC2384.2
   000021         002400*    AND DESCENDING KEYS AND MULTIPLE INDICES.  SINGLE AND     *  NC2384.2
   000022         002500*    MULTIPLE CONDITIONS ARE USED IN THE "WHEN" PHRASE.        *  NC2384.2
   000023         002600*                                                              *  NC2384.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2384.2
   000025         002900 CONFIGURATION SECTION.                                           NC2384.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2384.2
   000027         003100     XXXXX082.                                                    NC2384.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2384.2
   000029         003300     XXXXX083.                                                    NC2384.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2384.2
   000031         003500 FILE-CONTROL.                                                    NC2384.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2384.2 36
   000033         003700     XXXXX055.                                                    NC2384.2
   000034         003800 DATA DIVISION.                                                   NC2384.2
   000035         003900 FILE SECTION.                                                    NC2384.2
   000036         004000 FD  PRINT-FILE.                                                  NC2384.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2384.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2384.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2384.2
   000040         004400 77  SUB-1              PICTURE S99  VALUE ZERO.                  NC2384.2 IMP
   000041         004500 77  SUB-2              PICTURE 99   VALUE ZERO.                  NC2384.2 IMP
   000042         004600 77  SUB-3              PICTURE 99   VALUE ZERO.                  NC2384.2 IMP
   000043         004700 77  CON-7              PICTURE 99  VALUE 07.                     NC2384.2
   000044         004800 77  CON-10             PICTURE 99  VALUE 10.                     NC2384.2
   000045         004900 77  GRP-HOLD-AREA                PICTURE X(5)  VALUE SPACES.     NC2384.2 IMP
   000046         005000 77  CON-5              PICTURE 99  VALUE 05.                     NC2384.2
   000047         005100 77  SEC-HOLD-AREA                PICTURE X(11)  VALUE SPACES.    NC2384.2 IMP
   000048         005200 77  CON-6              PICTURE 99  VALUE 06.                     NC2384.2
   000049         005300 77  ELEM-HOLD-AREA               PICTURE X(15)  VALUE SPACES.    NC2384.2 IMP
   000050         005400 77  SUB-4  PICTURE 9 VALUE 9.                                    NC2384.2
   000051         005500 77  SUB-5  PICTURE 9 VALUE 1.                                    NC2384.2
   000052         005600 77  SUB-6  PICTURE 99 VALUE 01.                                  NC2384.2
   000053         005700 77  LEVEL-HOLD   PICTURE X(4) VALUE SPACES.                      NC2384.2 IMP
   000054         005800 01  ALPHA-TABLE.                                                 NC2384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02  FILLER   PICTURE X(4)  VALUE "PPPP".                     NC2384.2
   000056         006000     02  FILLER   PICTURE X(4)  VALUE "OOOO".                     NC2384.2
   000057         006100     02  FILLER   PICTURE X(4)  VALUE "NNNN".                     NC2384.2
   000058         006200     02  FILLER   PICTURE X(4)  VALUE "MMMM".                     NC2384.2
   000059         006300     02  FILLER   PICTURE X(4)  VALUE "LLLL".                     NC2384.2
   000060         006400     02  FILLER   PICTURE X(4)  VALUE "KKKK".                     NC2384.2
   000061         006500     02  FILLER   PICTURE X(4)  VALUE "JJJJ".                     NC2384.2
   000062         006600     02  FILLER   PICTURE X(4)  VALUE "IIII".                     NC2384.2
   000063         006700     02  FILLER   PICTURE X(4)  VALUE "HHHH".                     NC2384.2
   000064         006800     02  FILLER   PICTURE X(4)  VALUE "GGGG".                     NC2384.2
   000065         006900     02  FILLER   PICTURE X(4)  VALUE "FFFF".                     NC2384.2
   000066         007000     02  FILLER   PICTURE X(4)  VALUE "EEEE".                     NC2384.2
   000067         007100     02  FILLER   PICTURE X(4)  VALUE "DDDD".                     NC2384.2
   000068         007200     02  FILLER   PICTURE X(4)  VALUE "CCCC".                     NC2384.2
   000069         007300     02  FILLER   PICTURE X(4)  VALUE "BBBB".                     NC2384.2
   000070         007400     02  FILLER   PICTURE X(4)  VALUE "AAAA".                     NC2384.2
   000071         007500 01  ALPHA-BET-TABLE REDEFINES ALPHA-TABLE.                       NC2384.2 54
   000072         007600     02  ALPHA-BET OCCURS 16 TIMES PICTURE X(4).                  NC2384.2
   000073         007700                                                                  NC2384.2
   000074         007800 01  SERIES-TABLE-2.                                              NC2384.2
   000075         007900     02  1ST-ENTRY OCCURS 4 TIMES ASCENDING KEY IS FIELD-1 FIELD-2NC2384.2 78 79
   000076         008000         DESCENDING KEY IS FIELD-3  FIELD-4 INDEXED BY IDX-4      NC2384.2 80 81
   000077         008100         IDX-5  IDX-6.                                            NC2384.2
   000078         008200         03  FIELD-1  PICTURE 9.                                  NC2384.2
   000079         008300         03  FIELD-2  PICTURE 9.                                  NC2384.2
   000080         008400         03  FIELD-3  PICTURE 9.                                  NC2384.2
   000081         008500         03  FIELD-4  PICTURE 9.                                  NC2384.2
   000082         008600         03  2ND-ENTRY OCCURS 4 TIMES DESCENDING IS FIELD-5       NC2384.2 84
   000083         008700             FIELD-6  FIELD-7  FIELD-8 INDEXED IDX-7 IDX-8 IDX-9. NC2384.2 85 86 87
   000084         008800             04  FIELD-5  PICTURE X.                              NC2384.2
   000085         008900             04  FIELD-6  PICTURE X.                              NC2384.2
   000086         009000             04  FIELD-7  PICTURE X.                              NC2384.2
   000087         009100             04  FIELD-8  PICTURE X.                              NC2384.2
   000088         009200 01  NOTE-1.                                                      NC2384.2
   000089         009300     02  FILLER                   PICTURE X(74)  VALUE            NC2384.2
   000090         009400     "NOTE 1 - CORRECT AND COMPUTED DATA ARE EQUAL BUT THE AT END NC2384.2
   000091         009500-    "PATH WAS TAKEN".                                            NC2384.2
   000092         009600     02  FILLER                   PICTURE X(46)  VALUE SPACES.    NC2384.2 IMP
   000093         009700 01  NOTE-2.                                                      NC2384.2
   000094         009800     02  FILLER                   PICTURE X(112)  VALUE           NC2384.2
   000095         009900     "NOTE 2 - CORRECT AND COMPUTED DATA ARE NOT EQUAL. THE COMPUTNC2384.2
   000096         010000-    "ED ENTRY WAS EXTRACTED FROM THE TABLE BY SUBSCRIPTS.".      NC2384.2
   000097         010100     02  FILLER                   PICTURE X(8)  VALUE SPACES.     NC2384.2 IMP
   000098         010200                                                                  NC2384.2
   000099         010300 01  END-STMT.                                                    NC2384.2
   000100         010400     02  FILLER         PICTURE X(7)  VALUE "AT END ".            NC2384.2
   000101         010500     02  END-IDX                  PICTURE X(5)  VALUE SPACES.     NC2384.2 IMP
   000102         010600     02  FILLER                   PICTURE XXX  VALUE " = ".       NC2384.2
   000103         010700     02  IDX-VALU                 PICTURE 99  VALUE 00.           NC2384.2
   000104         010800     02  FILLER                   PICTURE XXX  VALUE SPACES.      NC2384.2 IMP
   000105         010900 01  TEST-RESULTS.                                                NC2384.2
   000106         011000     02 FILLER                   PIC X      VALUE SPACE.          NC2384.2 IMP
   000107         011100     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2384.2 IMP
   000108         011200     02 FILLER                   PIC X      VALUE SPACE.          NC2384.2 IMP
   000109         011300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2384.2 IMP
   000110         011400     02 FILLER                   PIC X      VALUE SPACE.          NC2384.2 IMP
   000111         011500     02  PAR-NAME.                                                NC2384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2384.2 IMP
   000113         011700       03  PARDOT-X              PIC X      VALUE SPACE.          NC2384.2 IMP
   000114         011800       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2384.2 IMP
   000115         011900     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2384.2 IMP
   000116         012000     02 RE-MARK                  PIC X(61).                       NC2384.2
   000117         012100 01  TEST-COMPUTED.                                               NC2384.2
   000118         012200     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2384.2 IMP
   000119         012300     02 FILLER                   PIC X(17)  VALUE                 NC2384.2
   000120         012400            "       COMPUTED=".                                   NC2384.2
   000121         012500     02 COMPUTED-X.                                               NC2384.2
   000122         012600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2384.2 IMP
   000123         012700     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2384.2 122
   000124         012800                                 PIC -9(9).9(9).                  NC2384.2
   000125         012900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2384.2 122
   000126         013000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2384.2 122
   000127         013100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2384.2 122
   000128         013200     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2384.2 122
   000129         013300         04 COMPUTED-18V0                    PIC -9(18).          NC2384.2
   000130         013400         04 FILLER                           PIC X.               NC2384.2
   000131         013500     03 FILLER PIC X(50) VALUE SPACE.                             NC2384.2 IMP
   000132         013600 01  TEST-CORRECT.                                                NC2384.2
   000133         013700     02 FILLER PIC X(30) VALUE SPACE.                             NC2384.2 IMP
   000134         013800     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2384.2
   000135         013900     02 CORRECT-X.                                                NC2384.2
   000136         014000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2384.2 IMP
   000137         014100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2384.2 136
   000138         014200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2384.2 136
   000139         014300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2384.2 136
   000140         014400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2384.2 136
   000141         014500     03      CR-18V0 REDEFINES CORRECT-A.                         NC2384.2 136
   000142         014600         04 CORRECT-18V0                     PIC -9(18).          NC2384.2
   000143         014700         04 FILLER                           PIC X.               NC2384.2
   000144         014800     03 FILLER PIC X(2) VALUE SPACE.                              NC2384.2 IMP
   000145         014900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2384.2 IMP
   000146         015000 01  CCVS-C-1.                                                    NC2384.2
   000147         015100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2384.2
   000148         015200-    "SS  PARAGRAPH-NAME                                          NC2384.2
   000149         015300-    "       REMARKS".                                            NC2384.2
   000150         015400     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2384.2 IMP
   000151         015500 01  CCVS-C-2.                                                    NC2384.2
   000152         015600     02 FILLER                     PIC X        VALUE SPACE.      NC2384.2 IMP
   000153         015700     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2384.2
   000154         015800     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2384.2 IMP
   000155         015900     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2384.2
   000156         016000     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2384.2 IMP
   000157         016100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2384.2 IMP
   000158         016200 01  REC-CT                        PIC 99       VALUE ZERO.       NC2384.2 IMP
   000159         016300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2384.2 IMP
   000160         016400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2384.2 IMP
   000161         016500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2384.2 IMP
   000162         016600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2384.2 IMP
   000163         016700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2384.2 IMP
   000164         016800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2384.2 IMP
   000165         016900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2384.2 IMP
   000166         017000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2384.2 IMP
   000167         017100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2384.2 IMP
   000168         017200 01  CCVS-H-1.                                                    NC2384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2384.2 IMP
   000170         017400     02  FILLER                    PIC X(42)    VALUE             NC2384.2
   000171         017500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2384.2
   000172         017600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2384.2 IMP
   000173         017700 01  CCVS-H-2A.                                                   NC2384.2
   000174         017800   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2384.2 IMP
   000175         017900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2384.2
   000176         018000   02  FILLER                        PIC XXXX   VALUE             NC2384.2
   000177         018100     "4.2 ".                                                      NC2384.2
   000178         018200   02  FILLER                        PIC X(28)  VALUE             NC2384.2
   000179         018300            " COPY - NOT FOR DISTRIBUTION".                       NC2384.2
   000180         018400   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2384.2 IMP
   000181         018500                                                                  NC2384.2
   000182         018600 01  CCVS-H-2B.                                                   NC2384.2
   000183         018700   02  FILLER                        PIC X(15)  VALUE             NC2384.2
   000184         018800            "TEST RESULT OF ".                                    NC2384.2
   000185         018900   02  TEST-ID                       PIC X(9).                    NC2384.2
   000186         019000   02  FILLER                        PIC X(4)   VALUE             NC2384.2
   000187         019100            " IN ".                                               NC2384.2
   000188         019200   02  FILLER                        PIC X(12)  VALUE             NC2384.2
   000189         019300     " HIGH       ".                                              NC2384.2
   000190         019400   02  FILLER                        PIC X(22)  VALUE             NC2384.2
   000191         019500            " LEVEL VALIDATION FOR ".                             NC2384.2
   000192         019600   02  FILLER                        PIC X(58)  VALUE             NC2384.2
   000193         019700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2384.2
   000194         019800 01  CCVS-H-3.                                                    NC2384.2
   000195         019900     02  FILLER                      PIC X(34)  VALUE             NC2384.2
   000196         020000            " FOR OFFICIAL USE ONLY    ".                         NC2384.2
   000197         020100     02  FILLER                      PIC X(58)  VALUE             NC2384.2
   000198         020200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2384.2
   000199         020300     02  FILLER                      PIC X(28)  VALUE             NC2384.2
   000200         020400            "  COPYRIGHT   1985 ".                                NC2384.2
   000201         020500 01  CCVS-E-1.                                                    NC2384.2
   000202         020600     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2384.2 IMP
   000203         020700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2384.2
   000204         020800     02 ID-AGAIN                     PIC X(9).                    NC2384.2
   000205         020900     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2384.2 IMP
   000206         021000 01  CCVS-E-2.                                                    NC2384.2
   000207         021100     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2384.2 IMP
   000208         021200     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2384.2 IMP
   000209         021300     02 CCVS-E-2-2.                                               NC2384.2
   000210         021400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2384.2 IMP
   000211         021500         03 FILLER                   PIC X      VALUE SPACE.      NC2384.2 IMP
   000212         021600         03 ENDER-DESC               PIC X(44)  VALUE             NC2384.2
   000213         021700            "ERRORS ENCOUNTERED".                                 NC2384.2
   000214         021800 01  CCVS-E-3.                                                    NC2384.2
   000215         021900     02  FILLER                      PIC X(22)  VALUE             NC2384.2
   000216         022000            " FOR OFFICIAL USE ONLY".                             NC2384.2
   000217         022100     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2384.2 IMP
   000218         022200     02  FILLER                      PIC X(58)  VALUE             NC2384.2
   000219         022300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2384.2
   000220         022400     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2384.2 IMP
   000221         022500     02 FILLER                       PIC X(15)  VALUE             NC2384.2
   000222         022600             " COPYRIGHT 1985".                                   NC2384.2
   000223         022700 01  CCVS-E-4.                                                    NC2384.2
   000224         022800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2384.2 IMP
   000225         022900     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2384.2 IMP
   000227         023100     02 FILLER                       PIC X(40)  VALUE             NC2384.2
   000228         023200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2384.2
   000229         023300 01  XXINFO.                                                      NC2384.2
   000230         023400     02 FILLER                       PIC X(19)  VALUE             NC2384.2
   000231         023500            "*** INFORMATION ***".                                NC2384.2
   000232         023600     02 INFO-TEXT.                                                NC2384.2
   000233         023700       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2384.2 IMP
   000234         023800       04 XXCOMPUTED                 PIC X(20).                   NC2384.2
   000235         023900       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2384.2 IMP
   000236         024000       04 XXCORRECT                  PIC X(20).                   NC2384.2
   000237         024100     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2384.2
   000238         024200 01  HYPHEN-LINE.                                                 NC2384.2
   000239         024300     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2384.2 IMP
   000240         024400     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2384.2
   000241         024500-    "*****************************************".                 NC2384.2
   000242         024600     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2384.2
   000243         024700-    "******************************".                            NC2384.2
   000244         024800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2384.2
   000245         024900     "NC238A".                                                    NC2384.2
   000246         025000 PROCEDURE DIVISION.                                              NC2384.2
   000247         025100 CCVS1 SECTION.                                                   NC2384.2
   000248         025200 OPEN-FILES.                                                      NC2384.2
   000249         025300     OPEN     OUTPUT PRINT-FILE.                                  NC2384.2 36
   000250         025400     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2384.2 244 185 244 204
   000251         025500     MOVE    SPACE TO TEST-RESULTS.                               NC2384.2 IMP 105
   000252         025600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2384.2 277 282
   000253         025700     GO TO CCVS1-EXIT.                                            NC2384.2 359
   000254         025800 CLOSE-FILES.                                                     NC2384.2
   000255         025900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2384.2 286 307 36
   000256         026000 TERMINATE-CCVS.                                                  NC2384.2
   000257         026100     EXIT PROGRAM.                                                NC2384.2
   000258         026200 TERMINATE-CALL.                                                  NC2384.2
   000259         026300     STOP     RUN.                                                NC2384.2
   000260         026400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2384.2 109 161
   000261         026500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2384.2 109 162
   000262         026600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2384.2 109 160
   000263         026700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2384.2 109 159
   000264         026800     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2384.2 116
   000265         026900 PRINT-DETAIL.                                                    NC2384.2
   000266         027000     IF REC-CT NOT EQUAL TO ZERO                                  NC2384.2 158 IMP
   000267      1  027100             MOVE "." TO PARDOT-X                                 NC2384.2 113
   000268      1  027200             MOVE REC-CT TO DOTVALUE.                             NC2384.2 158 114
   000269         027300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2384.2 105 37 319
   000270         027400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2384.2 109 319
   000271      1  027500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2384.2 336 349
   000272      1  027600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2384.2 350 358
   000273         027700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2384.2 IMP 109 IMP 121
   000274         027800     MOVE SPACE TO CORRECT-X.                                     NC2384.2 IMP 135
   000275         027900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2384.2 158 IMP IMP 111
   000276         028000     MOVE     SPACE TO RE-MARK.                                   NC2384.2 IMP 116
   000277         028100 HEAD-ROUTINE.                                                    NC2384.2
   000278         028200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2384.2 168 38 319
   000279         028300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2384.2 173 38 319
   000280         028400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2384.2 182 38 319
   000281         028500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2384.2 194 38 319
   000282         028600 COLUMN-NAMES-ROUTINE.                                            NC2384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2384.2 146 38 319
   000284         028800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2384.2 151 38 319
   000285         028900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2384.2 238 38 319
   000286         029000 END-ROUTINE.                                                     NC2384.2
   000287         029100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2384.2 238 38 319
   000288         029200 END-RTN-EXIT.                                                    NC2384.2
   000289         029300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2384.2 201 38 319
   000290         029400 END-ROUTINE-1.                                                   NC2384.2
   000291         029500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2384.2 160 164 161
   000292         029600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2384.2 164 159 164
   000293         029700      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2384.2 162 164
   000294         029800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2384.2
   000295         029900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2384.2 162 224
   000296         030000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2384.2 164 226
   000297         030100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2384.2 223 209
   000298         030200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2384.2 206 38 319
   000299         030300  END-ROUTINE-12.                                                 NC2384.2
   000300         030400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2384.2 212
   000301         030500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2384.2 160 IMP
   000302      1  030600         MOVE "NO " TO ERROR-TOTAL                                NC2384.2 210
   000303         030700         ELSE                                                     NC2384.2
   000304      1  030800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2384.2 160 210
   000305         030900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2384.2 206 38
   000306         031000     PERFORM WRITE-LINE.                                          NC2384.2 319
   000307         031100 END-ROUTINE-13.                                                  NC2384.2
   000308         031200     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2384.2 159 IMP
   000309      1  031300         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2384.2 210
   000310      1  031400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2384.2 159 210
   000311         031500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2384.2 212
   000312         031600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2384.2 206 38 319
   000313         031700      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2384.2 161 IMP
   000314      1  031800          MOVE "NO " TO ERROR-TOTAL                               NC2384.2 210
   000315      1  031900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2384.2 161 210
   000316         032000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2384.2 212
   000317         032100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2384.2 206 38 319
   000318         032200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2384.2 214 38 319
   000319         032300 WRITE-LINE.                                                      NC2384.2
   000320         032400     ADD 1 TO RECORD-COUNT.                                       NC2384.2 166
   000321         032500     IF RECORD-COUNT GREATER 50                                   NC2384.2 166
   000322      1  032600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2384.2 38 165
   000323      1  032700         MOVE SPACE TO DUMMY-RECORD                               NC2384.2 IMP 38
   000324      1  032800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2384.2 38
   000325      1  032900         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2384.2 146 38 331
   000326      1  033000         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2384.2 151 38 331
   000327      1  033100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2384.2 238 38 331
   000328      1  033200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2384.2 165 38
   000329      1  033300         MOVE ZERO TO RECORD-COUNT.                               NC2384.2 IMP 166
   000330         033400     PERFORM WRT-LN.                                              NC2384.2 331
   000331         033500 WRT-LN.                                                          NC2384.2
   000332         033600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2384.2 38
   000333         033700     MOVE SPACE TO DUMMY-RECORD.                                  NC2384.2 IMP 38
   000334         033800 BLANK-LINE-PRINT.                                                NC2384.2
   000335         033900     PERFORM WRT-LN.                                              NC2384.2 331
   000336         034000 FAIL-ROUTINE.                                                    NC2384.2
   000337         034100     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2384.2 121 IMP 344
   000338         034200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2384.2 135 IMP 344
   000339         034300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2384.2 167 237
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2384.2 232
   000341         034500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2384.2 229 38 319
   000342         034600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2384.2 IMP 237
   000343         034700     GO TO  FAIL-ROUTINE-EX.                                      NC2384.2 349
   000344         034800 FAIL-ROUTINE-WRITE.                                              NC2384.2
   000345         034900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2384.2 117 37 319
   000346         035000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2384.2 167 145
   000347         035100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2384.2 132 37 319
   000348         035200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2384.2 IMP 145
   000349         035300 FAIL-ROUTINE-EX. EXIT.                                           NC2384.2
   000350         035400 BAIL-OUT.                                                        NC2384.2
   000351         035500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2384.2 122 IMP 353
   000352         035600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2384.2 136 IMP 358
   000353         035700 BAIL-OUT-WRITE.                                                  NC2384.2
   000354         035800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2384.2 136 236 122 234
   000355         035900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2384.2 167 237
   000356         036000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2384.2 229 38 319
   000357         036100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2384.2 IMP 237
   000358         036200 BAIL-OUT-EX. EXIT.                                               NC2384.2
   000359         036300 CCVS1-EXIT.                                                      NC2384.2
   000360         036400     EXIT.                                                        NC2384.2
   000361         036500 SECT-NC238A-001 SECTION.                                         NC2384.2
   000362         036600 TH-11-001.                                                       NC2384.2
   000363         036700     SET IDX-4  IDX-7 TO 01.                                      NC2384.2 76 83
   000364         036800 BUILD-LOOP-1.                                                    NC2384.2
   000365         036900     MOVE SUB-5 TO FIELD-1 (IDX-4) FIELD-2 (IDX-4).               NC2384.2 51 78 76 79 76
   000366         037000     MOVE SUB-4 TO FIELD-3 (IDX-4) FIELD-4 (IDX-4).               NC2384.2 50 80 76 81 76
   000367         037100     PERFORM BUILD-ENTRY-2 THRU ENTRY-2-EXIT.                     NC2384.2 373 382
   000368         037200     IF 2ND-ENTRY (4, 4) EQUAL TO "AAAA" GO TO BUILD-EXIT.        NC2384.2 82 384
   000369         037300     ADD 1 TO SUB-5.                                              NC2384.2 51
   000370         037400     SUBTRACT 1 FROM SUB-4.                                       NC2384.2 50
   000371         037500     SET IDX-4 UP BY 1.                                           NC2384.2 76
   000372         037600     GO TO BUILD-LOOP-1.                                          NC2384.2 364
   000373         037700 BUILD-ENTRY-2.                                                   NC2384.2
   000374         037800     MOVE ALPHA-BET (SUB-6) TO 2ND-ENTRY (IDX-4, IDX-7).          NC2384.2 72 52 82 76 83
   000375         037900     IF IDX-7 EQUAL TO 4                                          NC2384.2 83
   000376      1  038000         SET IDX-7 TO 1                                           NC2384.2 83
   000377      1  038100         ADD 1 TO SUB-6                                           NC2384.2 52
   000378      1  038200         GO TO ENTRY-2-EXIT.                                      NC2384.2 382
   000379         038300     SET IDX-7 UP BY 1.                                           NC2384.2 83
   000380         038400     ADD 1 TO SUB-6.                                              NC2384.2 52
   000381         038500     GO TO BUILD-ENTRY-2.                                         NC2384.2 373
   000382         038600 ENTRY-2-EXIT.                                                    NC2384.2
   000383         038700     EXIT.                                                        NC2384.2
   000384         038800 BUILD-EXIT.                                                      NC2384.2
   000385         038900     EXIT.                                                        NC2384.2
   000386         039000*                                                                 NC2384.2
   000387         039100 SCH-INIT-F1-1.                                                   NC2384.2
   000388         039200     MOVE "SCH-TEST-F1-1" TO PAR-NAME.                            NC2384.2 111
   000389         039300     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2384.2 167
   000390         039400     MOVE "SEARCH" TO FEATURE.                                    NC2384.2 107
   000391         039500     MOVE "IMPLIED VARYING OPTION" TO RE-MARK.                    NC2384.2 116
   000392         039600     SET IDX-4 TO 01.                                             NC2384.2 76
   000393         039700 SCH-TEST-F1-1.                                                   NC2384.2
   000394         039800     SEARCH 1ST-ENTRY                                             NC2384.2 75
   000395         039900         WHEN 1ST-ENTRY (IDX-4) EQUAL TO "2288LLLLKKKKJJJJIIII"   NC2384.2 75 76
   000396      1  040000             MOVE 1ST-ENTRY (IDX-4) TO LEVEL-HOLD.                NC2384.2 75 76 53
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     IF LEVEL-HOLD EQUAL TO "2288"                                NC2384.2 53
   000398      1  040200         PERFORM PASS                                             NC2384.2 261
   000399      1  040300         GO TO SCH-WRITE-F1-1.                                    NC2384.2 408
   000400         040400     GO TO SCH-FAIL-F1-1.                                         NC2384.2 404
   000401         040500 SCH-DELETE-F1-1.                                                 NC2384.2
   000402         040600     PERFORM DE-LETE.                                             NC2384.2 263
   000403         040700     GO TO SCH-WRITE-F1-1.                                        NC2384.2 408
   000404         040800 SCH-FAIL-F1-1.                                                   NC2384.2
   000405         040900     MOVE "2288" TO CORRECT-A.                                    NC2384.2 136
   000406         041000     MOVE "ENTRY NOT FOUND" TO COMPUTED-A.                        NC2384.2 122
   000407         041100     PERFORM FAIL.                                                NC2384.2 262
   000408         041200 SCH-WRITE-F1-1.                                                  NC2384.2
   000409         041300     PERFORM PRINT-DETAIL.                                        NC2384.2 265
   000410         041400*                                                                 NC2384.2
   000411         041500 SCH-INIT-F1-2.                                                   NC2384.2
   000412         041600     MOVE "SCH-TEST-F1-2" TO PAR-NAME.                            NC2384.2 111
   000413         041700     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2384.2 167
   000414         041800     MOVE "FORMAT 1 VARYING OPTION" TO RE-MARK.                   NC2384.2 116
   000415         041900     MOVE "SEARCH WHEN SERIES" TO FEATURE.                        NC2384.2 107
   000416         042000     SET IDX-5 TO 04.                                             NC2384.2 77
   000417         042100 SCH-TEST-F1-2.                                                   NC2384.2
   000418         042200     SEARCH 1ST-ENTRY VARYING IDX-5                               NC2384.2 75 77
   000419      1  042300                      AT END MOVE SPACES TO LEVEL-HOLD            NC2384.2 IMP 53
   000420         042400         WHEN FIELD-1 (IDX-5) EQUAL TO 3                          NC2384.2 78 77
   000421      1  042500             MOVE FIELD-1 (IDX-5) TO LEVEL-HOLD                   NC2384.2 78 77 53
   000422         042600         WHEN FIELD-4 (IDX-5) EQUAL TO 6                          NC2384.2 81 77
   000423      1  042700             MOVE FIELD-4 (IDX-5) TO LEVEL-HOLD.                  NC2384.2 81 77 53
   000424         042800     MOVE "FORMAT 1 W/0 VARYING" TO RE-MARK.                      NC2384.2 116
   000425         042900     IF LEVEL-HOLD EQUAL TO "6   "                                NC2384.2 53
   000426      1  043000         PERFORM PASS                                             NC2384.2 261
   000427      1  043100         GO TO SCH-WRITE-F1-2.                                    NC2384.2 436
   000428         043200     GO TO SCH-FAIL-F1-2.                                         NC2384.2 432
   000429         043300 SCH-DELETE-F1-2.                                                 NC2384.2
   000430         043400     PERFORM DE-LETE.                                             NC2384.2 263
   000431         043500     GO TO SCH-WRITE-F1-2.                                        NC2384.2 436
   000432         043600 SCH-FAIL-F1-2.                                                   NC2384.2
   000433         043700     MOVE "6" TO CORRECT-A.                                       NC2384.2 136
   000434         043800     MOVE LEVEL-HOLD TO COMPUTED-A.                               NC2384.2 53 122
   000435         043900     PERFORM FAIL.                                                NC2384.2 262
   000436         044000 SCH-WRITE-F1-2.                                                  NC2384.2
   000437         044100     PERFORM PRINT-DETAIL.                                        NC2384.2 265
   000438         044200*                                                                 NC2384.2
   000439         044300 SCH-INIT-F1-3.                                                   NC2384.2
   000440         044400     MOVE "SCH-TEST-F1-3" TO PAR-NAME.                            NC2384.2 111
   000441         044500     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2384.2 167
   000442         044600     MOVE "SEARCH WHEN SERIES" TO FEATURE.                        NC2384.2 107
   000443         044700     SET IDX-5 TO 03.                                             NC2384.2 77
   000444         044800     SET IDX-8 TO 01.                                             NC2384.2 83
   000445         044900 SCH-TEST-F1-3.                                                   NC2384.2
   000446         045000     SEARCH 2ND-ENTRY VARYING IDX-8                               NC2384.2 82 83
   000447      1  045100                      AT END MOVE SPACES TO LEVEL-HOLD            NC2384.2 IMP 53
   000448         045200         WHEN FIELD-7 (IDX-5, IDX-8) EQUAL TO "E"                 NC2384.2 86 77 83
   000449      1  045300             MOVE FIELD-7 (IDX-5, IDX-8) TO LEVEL-HOLD            NC2384.2 86 77 83 53
   000450         045400         WHEN FIELD-5 (IDX-5, IDX-8) EQUAL TO "E"                 NC2384.2 84 77 83
   000451      1  045500             MOVE FIELD-5 (IDX-5, IDX-8) TO LEVEL-HOLD            NC2384.2 84 77 83 53
   000452         045600         WHEN FIELD-8 (IDX-5, IDX-8) EQUAL TO "E"                 NC2384.2 87 77 83
   000453      1  045700             MOVE FIELD-8 (IDX-5, IDX-8) TO LEVEL-HOLD.           NC2384.2 87 77 83 53
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     IF LEVEL-HOLD EQUAL TO "E   "                                NC2384.2 53
   000455      1  045900         PERFORM PASS                                             NC2384.2 261
   000456      1  046000         GO TO SCH-WRITE-F1-3.                                    NC2384.2 465
   000457         046100     GO TO SCH-FAIL-F1-3.                                         NC2384.2 461
   000458         046200 SCH-DELETE-F1-3.                                                 NC2384.2
   000459         046300     PERFORM DE-LETE.                                             NC2384.2 263
   000460         046400     GO TO SCH-WRITE-F1-3.                                        NC2384.2 465
   000461         046500 SCH-FAIL-F1-3.                                                   NC2384.2
   000462         046600     MOVE "E" TO CORRECT-A.                                       NC2384.2 136
   000463         046700     MOVE LEVEL-HOLD TO COMPUTED-A.                               NC2384.2 53 122
   000464         046800     PERFORM FAIL.                                                NC2384.2 262
   000465         046900 SCH-WRITE-F1-3.                                                  NC2384.2
   000466         047000     PERFORM PRINT-DETAIL.                                        NC2384.2 265
   000467         047100*                                                                 NC2384.2
   000468         047200 SCH-INIT-F1-4.                                                   NC2384.2
   000469         047300     MOVE "SCH-TEST-F1-4" TO PAR-NAME.                            NC2384.2 111
   000470         047400     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2384.2 167
   000471         047500     MOVE "SEARCH VARYING" TO FEATURE.                            NC2384.2 107
   000472         047600     MOVE "WHEN-COMPOUND CONDITION" TO RE-MARK.                   NC2384.2 116
   000473         047700     SET IDX-4 IDX-9 TO 04.                                       NC2384.2 76 83
   000474         047800 SCH-TEST-F1-4.                                                   NC2384.2
   000475         047900     SEARCH 2ND-ENTRY VARYING IDX-9                               NC2384.2 82 83
   000476      1  048000                      AT END MOVE SPACES TO LEVEL-HOLD            NC2384.2 IMP 53
   000477         048100         WHEN FIELD-6 (IDX-4, IDX-9) NOT EQUAL TO "A"             NC2384.2 85 76 83
   000478         048200          AND FIELD-7 (IDX-4, IDX-9) NOT EQUAL TO "A"             NC2384.2 86 76 83
   000479      1  048300              MOVE "A" TO LEVEL-HOLD.                             NC2384.2 53
   000480         048400     IF LEVEL-HOLD EQUAL TO SPACES                                NC2384.2 53 IMP
   000481      1  048500         PERFORM PASS                                             NC2384.2 261
   000482      1  048600         GO TO SCH-WRITE-F1-4.                                    NC2384.2 491
   000483         048700     GO TO SCH-FAIL-F1-4.                                         NC2384.2 487
   000484         048800 SCH-DELETE-F1-4.                                                 NC2384.2
   000485         048900     PERFORM DE-LETE.                                             NC2384.2 263
   000486         049000     GO TO SCH-WRITE-F1-4.                                        NC2384.2 491
   000487         049100 SCH-FAIL-F1-4.                                                   NC2384.2
   000488         049200     MOVE LEVEL-HOLD TO COMPUTED-A.                               NC2384.2 53 122
   000489         049300     MOVE "NO SUCH ENTRY" TO CORRECT-A.                           NC2384.2 136
   000490         049400     PERFORM FAIL.                                                NC2384.2 262
   000491         049500 SCH-WRITE-F1-4.                                                  NC2384.2
   000492         049600     PERFORM PRINT-DETAIL.                                        NC2384.2 265
   000493         049700*                                                                 NC2384.2
   000494         049800 SCH-INIT-F1-5.                                                   NC2384.2
   000495         049900     MOVE "SCH-TEST-F1-5" TO PAR-NAME.                            NC2384.2 111
   000496         050000     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2384.2 167
   000497         050100     MOVE "SEARCH WHEN SERIES" TO FEATURE.                        NC2384.2 107
   000498         050200     SET IDX-6 TO 02.                                             NC2384.2 77
   000499         050300     SET IDX-7 TO 02.                                             NC2384.2 83
   000500         050400 SCH-TEST-F1-5.                                                   NC2384.2
   000501         050500     SEARCH 2ND-ENTRY VARYING IDX-7                               NC2384.2 82 83
   000502      1  050600                      AT END MOVE SPACES TO LEVEL-HOLD            NC2384.2 IMP 53
   000503         050700         WHEN FIELD-5 (IDX-6, IDX-7) EQUAL TO "M"                 NC2384.2 84 77 83
   000504      1  050800             MOVE FIELD-5 (IDX-6, IDX-7) TO LEVEL-HOLD            NC2384.2 84 77 83 53
   000505         050900         WHEN FIELD-6 (IDX-6, IDX-7) EQUAL TO "N"                 NC2384.2 85 77 83
   000506      1  051000             MOVE FIELD-6 (IDX-6, IDX-7) TO LEVEL-HOLD            NC2384.2 85 77 83 53
   000507         051100         WHEN FIELD-7 (IDX-6, IDX-7) EQUAL TO "O"                 NC2384.2 86 77 83
   000508      1  051200             MOVE FIELD-7 (IDX-6, IDX-7) TO LEVEL-HOLD            NC2384.2 86 77 83 53
   000509         051300         WHEN FIELD-8 (IDX-6, IDX-7) EQUAL TO "I"                 NC2384.2 87 77 83
   000510      1  051400             MOVE FIELD-8 (IDX-6, IDX-7) TO LEVEL-HOLD.           NC2384.2 87 77 83 53
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     IF LEVEL-HOLD EQUAL TO "I   "                                NC2384.2 53
   000512      1  051600         PERFORM PASS                                             NC2384.2 261
   000513      1  051700         GO TO SCH-WRITE-F1-5.                                    NC2384.2 522
   000514         051800     GO TO SCH-FAIL-F1-5.                                         NC2384.2 518
   000515         051900 SCH-DELETE-F1-5.                                                 NC2384.2
   000516         052000     PERFORM DE-LETE.                                             NC2384.2 263
   000517         052100     GO TO SCH-WRITE-F1-5.                                        NC2384.2 522
   000518         052200 SCH-FAIL-F1-5.                                                   NC2384.2
   000519         052300     MOVE "I" TO CORRECT-A.                                       NC2384.2 136
   000520         052400     MOVE LEVEL-HOLD TO COMPUTED-A.                               NC2384.2 53 122
   000521         052500     PERFORM FAIL.                                                NC2384.2 262
   000522         052600 SCH-WRITE-F1-5.                                                  NC2384.2
   000523         052700     PERFORM PRINT-DETAIL.                                        NC2384.2 265
   000524         052800*                                                                 NC2384.2
   000525         052900 SCH-INIT-F2-6.                                                   NC2384.2
   000526         053000     MOVE "SCH-TEST-F2-6" TO PAR-NAME.                            NC2384.2 111
   000527         053100     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2384.2 167
   000528         053200     MOVE "SEARCH ALL " TO FEATURE.                               NC2384.2 107
   000529         053300     MOVE "WHEN-COMPOUND CONDITION" TO RE-MARK.                   NC2384.2 116
   000530         053400 SCH-TEST-F2-6.                                                   NC2384.2
   000531         053500     SEARCH ALL 1ST-ENTRY                                         NC2384.2 75
   000532      1  053600                      AT END MOVE SPACES TO LEVEL-HOLD            NC2384.2 IMP 53
   000533         053700         WHEN FIELD-1 (IDX-4) EQUAL TO 2 AND                      NC2384.2 78 76
   000534      1  053800              FIELD-2 (IDX-4) EQUAL TO 2 MOVE 2 TO LEVEL-HOLD.    NC2384.2 79 76 53
   000535         053900     IF LEVEL-HOLD EQUAL TO "2   "                                NC2384.2 53
   000536      1  054000         PERFORM PASS                                             NC2384.2 261
   000537      1  054100         GO TO SCH-WRITE-F2-6.                                    NC2384.2 546
   000538         054200     GO TO SCH-FAIL-F2-6.                                         NC2384.2 542
   000539         054300 SCH-DELETE-F2-6.                                                 NC2384.2
   000540         054400     PERFORM DE-LETE.                                             NC2384.2 263
   000541         054500     GO TO SCH-WRITE-F2-6.                                        NC2384.2 546
   000542         054600 SCH-FAIL-F2-6.                                                   NC2384.2
   000543         054700     MOVE LEVEL-HOLD TO COMPUTED-A.                               NC2384.2 53 122
   000544         054800     MOVE "2" TO CORRECT-A.                                       NC2384.2 136
   000545         054900     PERFORM FAIL.                                                NC2384.2 262
   000546         055000 SCH-WRITE-F2-6.                                                  NC2384.2
   000547         055100     PERFORM PRINT-DETAIL.                                        NC2384.2 265
   000548         055200*                                                                 NC2384.2
   000549         055300 SCH-INIT-F2-7.                                                   NC2384.2
   000550         055400     MOVE "SCH-TEST-F2-7" TO PAR-NAME.                            NC2384.2 111
   000551         055500     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2384.2 167
   000552         055600     MOVE "SEARCH ALL " TO FEATURE.                               NC2384.2 107
   000553         055700 SCH-TEST-F2-7.                                                   NC2384.2
   000554         055800     SEARCH ALL 1ST-ENTRY                                         NC2384.2 75
   000555      1  055900                      AT END MOVE SPACES TO LEVEL-HOLD            NC2384.2 IMP 53
   000556         056000         WHEN FIELD-1 (IDX-4) EQUAL TO 4 AND                      NC2384.2 78 76
   000557         056100              FIELD-2 (IDX-4) EQUAL TO 4 AND                      NC2384.2 79 76
   000558         056200              FIELD-3 (IDX-4) EQUAL TO 6 AND                      NC2384.2 80 76
   000559         056300              FIELD-4 (IDX-4) EQUAL TO 6                          NC2384.2 81 76
   000560      1  056400              MOVE 6 TO LEVEL-HOLD.                               NC2384.2 53
   000561         056500     IF LEVEL-HOLD EQUAL TO "6   "                                NC2384.2 53
   000562      1  056600         PERFORM PASS                                             NC2384.2 261
   000563      1  056700         GO TO SCH-WRITE-F2-7.                                    NC2384.2 572
   000564         056800     GO TO SCH-FAIL-F2-7.                                         NC2384.2 568
   000565         056900 SCH-DELETE-F2-7.                                                 NC2384.2
   000566         057000     PERFORM DE-LETE.                                             NC2384.2 263
   000567         057100     GO TO SCH-WRITE-F2-7.                                        NC2384.2 572
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200 SCH-FAIL-F2-7.                                                   NC2384.2
   000569         057300     MOVE LEVEL-HOLD TO COMPUTED-A.                               NC2384.2 53 122
   000570         057400     MOVE "6" TO CORRECT-A.                                       NC2384.2 136
   000571         057500     PERFORM FAIL.                                                NC2384.2 262
   000572         057600 SCH-WRITE-F2-7.                                                  NC2384.2
   000573         057700     PERFORM PRINT-DETAIL.                                        NC2384.2 265
   000574         057800*                                                                 NC2384.2
   000575         057900 SCH-INIT-F2-8.                                                   NC2384.2
   000576         058000     MOVE "SCH-TEST-F2-8" TO PAR-NAME.                            NC2384.2 111
   000577         058100     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2384.2 167
   000578         058200     MOVE "SEARCH ALL " TO FEATURE.                               NC2384.2 107
   000579         058300     MOVE SPACES TO LEVEL-HOLD.                                   NC2384.2 IMP 53
   000580         058400     SET IDX-4 TO 01.                                             NC2384.2 76
   000581         058500 SCH-TEST-F2-8.                                                   NC2384.2
   000582         058600     SEARCH ALL 2ND-ENTRY                                         NC2384.2 82
   000583         058700         WHEN FIELD-5  (IDX-4, IDX-7) EQUAL TO "O" AND            NC2384.2 84 76 83
   000584         058800              FIELD-6  (IDX-4, IDX-7) EQUAL TO "O" AND            NC2384.2 85 76 83
   000585         058900              FIELD-7  (IDX-4, IDX-7) EQUAL TO "O" AND            NC2384.2 86 76 83
   000586         059000              FIELD-8  (IDX-4, IDX-7) EQUAL TO "P"                NC2384.2 87 76 83
   000587      1  059100             MOVE "OOOP" TO LEVEL-HOLD.                           NC2384.2 53
   000588         059200     IF LEVEL-HOLD EQUAL TO "OOOP"                                NC2384.2 53
   000589      1  059300         GO TO SCH-FAIL-F2-8.                                     NC2384.2 595
   000590         059400     PERFORM PASS.                                                NC2384.2 261
   000591         059500     GO TO SCH-WRITE-F2-8.                                        NC2384.2 599
   000592         059600 SCH-DELETE-F2-8.                                                 NC2384.2
   000593         059700     PERFORM DE-LETE.                                             NC2384.2 263
   000594         059800     GO TO SCH-WRITE-F2-8.                                        NC2384.2 599
   000595         059900 SCH-FAIL-F2-8.                                                   NC2384.2
   000596         060000     MOVE "NO SUCH ENTRY" TO CORRECT-A                            NC2384.2 136
   000597         060100     MOVE LEVEL-HOLD TO COMPUTED-A                                NC2384.2 53 122
   000598         060200     PERFORM FAIL.                                                NC2384.2 262
   000599         060300 SCH-WRITE-F2-8.                                                  NC2384.2
   000600         060400     PERFORM PRINT-DETAIL.                                        NC2384.2 265
   000601         060500*                                                                 NC2384.2
   000602         060600 SCH-INIT-F2-9.                                                   NC2384.2
   000603         060700     MOVE "SCH-TEST-F2-9" TO PAR-NAME.                            NC2384.2 111
   000604         060800     MOVE "VI-121 6.21.2" TO ANSI-REFERENCE.                      NC2384.2 167
   000605         060900     MOVE "SEARCH ALL " TO FEATURE.                               NC2384.2 107
   000606         061000     MOVE SPACES TO LEVEL-HOLD.                                   NC2384.2 IMP 53
   000607         061100     SET IDX-4 TO 04.                                             NC2384.2 76
   000608         061200 SCH-TEST-F2-9.                                                   NC2384.2
   000609         061300     SEARCH ALL 2ND-ENTRY                                         NC2384.2 82
   000610         061400         WHEN FIELD-5 (IDX-4, IDX-7) EQUAL TO "B" AND             NC2384.2 84 76 83
   000611         061500              FIELD-6 (IDX-4, IDX-7) EQUAL TO "B"                 NC2384.2 85 76 83
   000612      1  061600             MOVE "BB" TO LEVEL-HOLD.                             NC2384.2 53
   000613         061700     IF LEVEL-HOLD EQUAL TO "BB "                                 NC2384.2 53
   000614      1  061800         PERFORM PASS                                             NC2384.2 261
   000615      1  061900         GO TO SCH-WRITE-F2-9.                                    NC2384.2 624
   000616         062000     GO TO SCH-FAIL-F2-9.                                         NC2384.2 620
   000617         062100 SCH-DELETE-F2-9.                                                 NC2384.2
   000618         062200     PERFORM DE-LETE.                                             NC2384.2 263
   000619         062300     GO TO SCH-WRITE-F2-9.                                        NC2384.2 624
   000620         062400 SCH-FAIL-F2-9.                                                   NC2384.2
   000621         062500     MOVE "BB  " TO CORRECT-A.                                    NC2384.2 136
   000622         062600     MOVE LEVEL-HOLD TO COMPUTED-A.                               NC2384.2 53 122
   000623         062700     PERFORM FAIL.                                                NC2384.2 262
   000624         062800 SCH-WRITE-F2-9.                                                  NC2384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     PERFORM PRINT-DETAIL.                                        NC2384.2 265
   000626         063000*                                                                 NC2384.2
   000627         063100 SCH-INIT-F2-10.                                                  NC2384.2
   000628         063200*    ===-->  ARITHMETIC EXPRESSION OF ZERO  <--===                NC2384.2
   000629         063300     MOVE "SCH-TEST-F2-10" TO PAR-NAME.                           NC2384.2 111
   000630         063400     MOVE   "VI-51 6.2" TO ANSI-REFERENCE.                        NC2384.2 167
   000631         063500     MOVE "SEARCH ALL " TO FEATURE.                               NC2384.2 107
   000632         063600     MOVE "ARITHMETIC EXPRESSION OF ZERO" TO RE-MARK.             NC2384.2 116
   000633         063700 SCH-TEST-F2-10.                                                  NC2384.2
   000634         063800     SEARCH  ALL 1ST-ENTRY                                        NC2384.2 75
   000635      1  063900             AT END  MOVE ZERO TO LEVEL-HOLD                      NC2384.2 IMP 53
   000636         064000        WHEN FIELD-1 (IDX-4) EQUAL TO ZERO                        NC2384.2 78 76 IMP
   000637      1  064100             MOVE    2 TO LEVEL-HOLD.                             NC2384.2 53
   000638         064200     IF      LEVEL-HOLD EQUAL TO ZERO                             NC2384.2 53 IMP
   000639      1  064300             PERFORM PASS                                         NC2384.2 261
   000640      1  064400             GO TO   SCH-WRITE-F2-10.                             NC2384.2 649
   000641         064500     GO TO SCH-FAIL-F2-10.                                        NC2384.2 645
   000642         064600 SCH-DELETE-F2-10.                                                NC2384.2
   000643         064700     PERFORM DE-LETE.                                             NC2384.2 263
   000644         064800     GO TO SCH-WRITE-F2-10.                                       NC2384.2 649
   000645         064900 SCH-FAIL-F2-10.                                                  NC2384.2
   000646         065000     MOVE    LEVEL-HOLD TO COMPUTED-A.                            NC2384.2 53 122
   000647         065100     MOVE    ZERO TO CORRECT-A.                                   NC2384.2 IMP 136
   000648         065200     PERFORM FAIL.                                                NC2384.2 262
   000649         065300 SCH-WRITE-F2-10.                                                 NC2384.2
   000650         065400     PERFORM PRINT-DETAIL.                                        NC2384.2 265
   000651         065500*                                                                 NC2384.2
   000652         065600 CCVS-EXIT SECTION.                                               NC2384.2
   000653         065700 CCVS-999999.                                                     NC2384.2
   000654         065800     GO TO CLOSE-FILES.                                           NC2384.2 254
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       72   ALPHA-BET. . . . . . . . . . .  374
       71   ALPHA-BET-TABLE
       54   ALPHA-TABLE. . . . . . . . . .  71
      167   ANSI-REFERENCE . . . . . . . .  339 346 355 M389 M413 M441 M470 M496 M527 M551 M577 M604 M630
      146   CCVS-C-1 . . . . . . . . . . .  283 325
      151   CCVS-C-2 . . . . . . . . . . .  284 326
      201   CCVS-E-1 . . . . . . . . . . .  289
      206   CCVS-E-2 . . . . . . . . . . .  298 305 312 317
      209   CCVS-E-2-2 . . . . . . . . . .  M297
      214   CCVS-E-3 . . . . . . . . . . .  318
      223   CCVS-E-4 . . . . . . . . . . .  297
      224   CCVS-E-4-1 . . . . . . . . . .  M295
      226   CCVS-E-4-2 . . . . . . . . . .  M296
      168   CCVS-H-1 . . . . . . . . . . .  278
      173   CCVS-H-2A. . . . . . . . . . .  279
      182   CCVS-H-2B. . . . . . . . . . .  280
      194   CCVS-H-3 . . . . . . . . . . .  281
      244   CCVS-PGM-ID. . . . . . . . . .  250 250
      128   CM-18V0
      122   COMPUTED-A . . . . . . . . . .  123 125 126 127 128 351 354 M406 M434 M463 M488 M520 M543 M569 M597 M622 M646
      123   COMPUTED-N
      121   COMPUTED-X . . . . . . . . . .  M273 337
      125   COMPUTED-0V18
      127   COMPUTED-14V4
      129   COMPUTED-18V0
      126   COMPUTED-4V14
       44   CON-10
       46   CON-5
       48   CON-6
       43   CON-7
      145   COR-ANSI-REFERENCE . . . . . .  M346 M348
      136   CORRECT-A. . . . . . . . . . .  137 138 139 140 141 352 354 M405 M433 M462 M489 M519 M544 M570 M596 M621 M647
      137   CORRECT-N
      135   CORRECT-X. . . . . . . . . . .  M274 338
      138   CORRECT-0V18
      140   CORRECT-14V4
      142   CORRECT-18V0
      139   CORRECT-4V14
      141   CR-18V0
      159   DELETE-COUNTER . . . . . . . .  M263 292 308 310
      114   DOTVALUE . . . . . . . . . . .  M268
      165   DUMMY-HOLD . . . . . . . . . .  M322 328
       38   DUMMY-RECORD . . . . . . . . .  M278 M279 M280 M281 M283 M284 M285 M287 M289 M298 M305 M312 M317 M318 322 M323
                                            324 M325 M326 M327 M328 332 M333 M341 M356
       49   ELEM-HOLD-AREA
      101   END-IDX
       99   END-STMT
      212   ENDER-DESC . . . . . . . . . .  M300 M311 M316
      160   ERROR-COUNTER. . . . . . . . .  M262 291 301 304
      164   ERROR-HOLD . . . . . . . . . .  M291 M292 M292 M293 296
      210   ERROR-TOTAL. . . . . . . . . .  M302 M304 M309 M310 M314 M315
      107   FEATURE. . . . . . . . . . . .  M390 M415 M442 M471 M497 M528 M552 M578 M605 M631
       78   FIELD-1. . . . . . . . . . . .  75 M365 420 421 533 556 636
       79   FIELD-2. . . . . . . . . . . .  75 M365 534 557
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    16
0 Defined   Cross-reference of data names   References

0      80   FIELD-3. . . . . . . . . . . .  76 M366 558
       81   FIELD-4. . . . . . . . . . . .  76 M366 422 423 559
       84   FIELD-5. . . . . . . . . . . .  82 450 451 503 504 583 610
       85   FIELD-6. . . . . . . . . . . .  83 477 505 506 584 611
       86   FIELD-7. . . . . . . . . . . .  83 448 449 478 507 508 585
       87   FIELD-8. . . . . . . . . . . .  83 452 453 509 510 586
       45   GRP-HOLD-AREA
      238   HYPHEN-LINE. . . . . . . . . .  285 287 327
      204   ID-AGAIN . . . . . . . . . . .  M250
      103   IDX-VALU
       76   IDX-4. . . . . . . . . . . . .  M363 365 365 366 366 M371 374 M392 395 396 M473 477 478 533 534 556 557 558 559
                                            M580 583 584 585 586 M607 610 611 636
       77   IDX-5. . . . . . . . . . . . .  M416 M418 420 421 422 423 M443 448 449 450 451 452 453
       77   IDX-6. . . . . . . . . . . . .  M498 503 504 505 506 507 508 509 510
       83   IDX-7. . . . . . . . . . . . .  M363 374 375 M376 M379 M499 M501 503 504 505 506 507 508 509 510 583 584 585
                                            586 610 611
       83   IDX-8. . . . . . . . . . . . .  M444 M446 448 449 450 451 452 453
       83   IDX-9. . . . . . . . . . . . .  M473 M475 477 478
      237   INF-ANSI-REFERENCE . . . . . .  M339 M342 M355 M357
      232   INFO-TEXT. . . . . . . . . . .  M340
      161   INSPECT-COUNTER. . . . . . . .  M260 291 313 315
       53   LEVEL-HOLD . . . . . . . . . .  M396 397 M419 M421 M423 425 434 M447 M449 M451 M453 454 463 M476 M479 480 488
                                            M502 M504 M506 M508 M510 511 520 M532 M534 535 543 M555 M560 561 569 M579 M587
                                            588 597 M606 M612 613 622 M635 M637 638 646
       88   NOTE-1
       93   NOTE-2
      109   P-OR-F . . . . . . . . . . . .  M260 M261 M262 M263 270 M273
      111   PAR-NAME . . . . . . . . . . .  M275 M388 M412 M440 M469 M495 M526 M550 M576 M603 M629
      113   PARDOT-X . . . . . . . . . . .  M267
      162   PASS-COUNTER . . . . . . . . .  M261 293 295
       36   PRINT-FILE . . . . . . . . . .  32 249 255
       37   PRINT-REC. . . . . . . . . . .  M269 M345 M347
      116   RE-MARK. . . . . . . . . . . .  M264 M276 M391 M414 M424 M472 M529 M632
      158   REC-CT . . . . . . . . . . . .  266 268 275
      157   REC-SKL-SUB
      166   RECORD-COUNT . . . . . . . . .  M320 321 M329
       47   SEC-HOLD-AREA
       74   SERIES-TABLE-2
       40   SUB-1
       41   SUB-2
       42   SUB-3
       50   SUB-4. . . . . . . . . . . . .  366 M370
       51   SUB-5. . . . . . . . . . . . .  365 M369
       52   SUB-6. . . . . . . . . . . . .  374 M377 M380
      117   TEST-COMPUTED. . . . . . . . .  345
      132   TEST-CORRECT . . . . . . . . .  347
      185   TEST-ID. . . . . . . . . . . .  M250
      105   TEST-RESULTS . . . . . . . . .  M251 269
      163   TOTAL-ERROR
      234   XXCOMPUTED . . . . . . . . . .  M354
      236   XXCORRECT. . . . . . . . . . .  M354
      229   XXINFO . . . . . . . . . . . .  341 356
       75   1ST-ENTRY. . . . . . . . . . .  394 395 396 418 531 554 634
       82   2ND-ENTRY. . . . . . . . . . .  368 M374 446 475 501 582 609
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    17
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

      350   BAIL-OUT . . . . . . . . . . .  P272
      358   BAIL-OUT-EX. . . . . . . . . .  E272 G352
      353   BAIL-OUT-WRITE . . . . . . . .  G351
      334   BLANK-LINE-PRINT
      373   BUILD-ENTRY-2. . . . . . . . .  P367 G381
      384   BUILD-EXIT . . . . . . . . . .  G368
      364   BUILD-LOOP-1 . . . . . . . . .  G372
      652   CCVS-EXIT
      653   CCVS-999999
      247   CCVS1
      359   CCVS1-EXIT . . . . . . . . . .  G253
      254   CLOSE-FILES. . . . . . . . . .  G654
      282   COLUMN-NAMES-ROUTINE . . . . .  E252
      263   DE-LETE. . . . . . . . . . . .  P402 P430 P459 P485 P516 P540 P566 P593 P618 P643
      286   END-ROUTINE. . . . . . . . . .  P255
      290   END-ROUTINE-1
      299   END-ROUTINE-12
      307   END-ROUTINE-13 . . . . . . . .  E255
      288   END-RTN-EXIT
      382   ENTRY-2-EXIT . . . . . . . . .  E367 G378
      262   FAIL . . . . . . . . . . . . .  P407 P435 P464 P490 P521 P545 P571 P598 P623 P648
      336   FAIL-ROUTINE . . . . . . . . .  P271
      349   FAIL-ROUTINE-EX. . . . . . . .  E271 G343
      344   FAIL-ROUTINE-WRITE . . . . . .  G337 G338
      277   HEAD-ROUTINE . . . . . . . . .  P252
      260   INSPT
      248   OPEN-FILES
      261   PASS . . . . . . . . . . . . .  P398 P426 P455 P481 P512 P536 P562 P590 P614 P639
      265   PRINT-DETAIL . . . . . . . . .  P409 P437 P466 P492 P523 P547 P573 P600 P625 P650
      401   SCH-DELETE-F1-1
      429   SCH-DELETE-F1-2
      458   SCH-DELETE-F1-3
      484   SCH-DELETE-F1-4
      515   SCH-DELETE-F1-5
      642   SCH-DELETE-F2-10
      539   SCH-DELETE-F2-6
      565   SCH-DELETE-F2-7
      592   SCH-DELETE-F2-8
      617   SCH-DELETE-F2-9
      404   SCH-FAIL-F1-1. . . . . . . . .  G400
      432   SCH-FAIL-F1-2. . . . . . . . .  G428
      461   SCH-FAIL-F1-3. . . . . . . . .  G457
      487   SCH-FAIL-F1-4. . . . . . . . .  G483
      518   SCH-FAIL-F1-5. . . . . . . . .  G514
      645   SCH-FAIL-F2-10 . . . . . . . .  G641
      542   SCH-FAIL-F2-6. . . . . . . . .  G538
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    18
0 Defined   Cross-reference of procedures   References

0     568   SCH-FAIL-F2-7. . . . . . . . .  G564
      595   SCH-FAIL-F2-8. . . . . . . . .  G589
      620   SCH-FAIL-F2-9. . . . . . . . .  G616
      387   SCH-INIT-F1-1
      411   SCH-INIT-F1-2
      439   SCH-INIT-F1-3
      468   SCH-INIT-F1-4
      494   SCH-INIT-F1-5
      627   SCH-INIT-F2-10
      525   SCH-INIT-F2-6
      549   SCH-INIT-F2-7
      575   SCH-INIT-F2-8
      602   SCH-INIT-F2-9
      393   SCH-TEST-F1-1
      417   SCH-TEST-F1-2
      445   SCH-TEST-F1-3
      474   SCH-TEST-F1-4
      500   SCH-TEST-F1-5
      633   SCH-TEST-F2-10
      530   SCH-TEST-F2-6
      553   SCH-TEST-F2-7
      581   SCH-TEST-F2-8
      608   SCH-TEST-F2-9
      408   SCH-WRITE-F1-1 . . . . . . . .  G399 G403
      436   SCH-WRITE-F1-2 . . . . . . . .  G427 G431
      465   SCH-WRITE-F1-3 . . . . . . . .  G456 G460
      491   SCH-WRITE-F1-4 . . . . . . . .  G482 G486
      522   SCH-WRITE-F1-5 . . . . . . . .  G513 G517
      649   SCH-WRITE-F2-10. . . . . . . .  G640 G644
      546   SCH-WRITE-F2-6 . . . . . . . .  G537 G541
      572   SCH-WRITE-F2-7 . . . . . . . .  G563 G567
      599   SCH-WRITE-F2-8 . . . . . . . .  G591 G594
      624   SCH-WRITE-F2-9 . . . . . . . .  G615 G619
      361   SECT-NC238A-001
      258   TERMINATE-CALL
      256   TERMINATE-CCVS
      362   TH-11-001
      319   WRITE-LINE . . . . . . . . . .  P269 P270 P278 P279 P280 P281 P283 P284 P285 P287 P289 P298 P306 P312 P317 P318
                                            P341 P345 P347 P356
      331   WRT-LN . . . . . . . . . . . .  P325 P326 P327 P330 P335
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    19
0 Defined   Cross-reference of programs     References

        3   NC238A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC238A    Date 06/04/2022  Time 11:58:58   Page    20
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC238A:
 *    Source records = 654
 *    Data Division statements = 96
 *    Procedure Division statements = 328
 *    Generated COBOL statements = 0
 *    Program complexity factor = 336
0End of compilation 1,  program NC238A,  highest severity 0.
0Return code 0
