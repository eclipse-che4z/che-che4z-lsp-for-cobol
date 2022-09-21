1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:32   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:32   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2274.2
   000002         000200 PROGRAM-ID.                                                      IC2274.2
   000003         000300     IC227A.                                                      IC2274.2
   000004         000500*                                                              *  IC2274.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2274.2
   000006         000700*                                                              *  IC2274.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2274.2
   000008         000900*                                                              *  IC2274.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2274.2
   000010         001100*                                                              *  IC2274.2
   000011         001300*                                                              *  IC2274.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2274.2
   000013         001500*                                                              *  IC2274.2
   000014         001600*            X-55   SYSTEM PRINTER                             *  IC2274.2
   000015         001700*            X-82   SOURCE-COMPUTER                            *  IC2274.2
   000016         001800*            X-83   OBJECT-COMPUTER.                           *  IC2274.2
   000017         001900*                                                              *  IC2274.2
   000018         002100*                                                              *  IC2274.2
   000019         002200*    PROGRAMS IC227A AND IC227A-1 TEST LEVEL 2 LANGUAGE        *  IC2274.2
   000020         002300*    ELEMENTS FROM THE INTER-PROGRAM COMMUNICATION MODULE.     *  IC2274.2
   000021         002400*    THE PARTICULAR ELEMENTS TESTED ARE:                       *  IC2274.2
   000022         002500*        THE "EXTERNAL" CLAUSE IN THE FILE DESCRIPTION ENTRY   *  IC2274.2
   000023         002600*                                                              *  IC2274.2
   000024         002700*    ALTHOUGH IC227A AND IC227A-1 ARE SEPARATELY COMPILED      *  IC2274.2
   000025         002800*    PROGRAMS, BOTH ARE INTENDED TO BE COMPILED BY THE SAME    *  IC2274.2
   000026         002900*    INVOCATION OF THE COMPILER, IN ORDER TO TEST STREAM       *  IC2274.2
   000027         003000*    COMPILATION AND RECOGNITION OF THE END PROGRAM HEADER.    *  IC2274.2
   000028         003100*                                                              *  IC2274.2
   000029         003200*    THE STRUCTURE OF THE SOURCE FILE IS:                         IC2274.2
   000030         003300*                                                              *  IC2274.2
   000031         003400*    IDENTIFICATION DIVISION.                                  *  IC2274.2
   000032         003500*    PROGRAM-ID.  IC227A.                                      *  IC2274.2
   000033         003600*              .                                               *  IC2274.2
   000034         003700*              .                                               *  IC2274.2
   000035         003800*              .                                               *  IC2274.2
   000036         003900*    END PROGRAM IC227A.                                       *  IC2274.2
   000037         004000*    IDENTIFICATION DIVISION.                                  *  IC2274.2
   000038         004100*    PROGRAM-ID.  IC227A-1.                                    *  IC2274.2
   000039         004200*              .                                               *  IC2274.2
   000040         004300*              .                                               *  IC2274.2
   000041         004400*              .                                               *  IC2274.2
   000042         004500*    END PROGRAM IC227A-1.                                     *  IC2274.2
   000043         004600*                                                              *  IC2274.2
   000044         004800*                                                                 IC2274.2
   000045         004900 ENVIRONMENT DIVISION.                                            IC2274.2
   000046         005000 CONFIGURATION SECTION.                                           IC2274.2
   000047         005100 SOURCE-COMPUTER.                                                 IC2274.2
   000048         005200     XXXXX082.                                                    IC2274.2
   000049         005300 OBJECT-COMPUTER.                                                 IC2274.2
   000050         005400     XXXXX083.                                                    IC2274.2
   000051         005500*                                                                 IC2274.2
   000052         005600 INPUT-OUTPUT SECTION.                                            IC2274.2
   000053         005700 FILE-CONTROL.                                                    IC2274.2
   000054         005800     SELECT PRINT-FILE ASSIGN TO                                  IC2274.2 63
   000055         005900     XXXXX055.                                                    IC2274.2
   000056         006000*                                                                 IC2274.2
   000057         006100     SELECT EXTERNAL-FILE ASSIGN TO                               IC2274.2 67
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200     XXXXX014                                                     IC2274.2
   000059         006300     FILE STATUS IS EXTERNAL-FILE-FS.                             IC2274.2 94
   000060         006400*                                                                 IC2274.2
   000061         006500 DATA DIVISION.                                                   IC2274.2
   000062         006600 FILE SECTION.                                                    IC2274.2
   000063         006700 FD  PRINT-FILE.                                                  IC2274.2

 ==000063==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000064         006800 01  PRINT-REC PICTURE X(120).                                    IC2274.2
   000065         006900 01  DUMMY-RECORD PICTURE X(120).                                 IC2274.2
   000066         007000*                                                                 IC2274.2
   000067         007100 FD  EXTERNAL-FILE                                                IC2274.2

 ==000067==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "EXTERNAL-FILE".

   000068         007200         IS EXTERNAL                                              IC2274.2
   000069         007300         RECORD CONTAINS 18 CHARACTERS.                           IC2274.2
   000070         007400 01  EXTERNAL-FILE-RECORD.                                        IC2274.2
   000071         007500     03  EXT-DATA-1              PIC X(2).                        IC2274.2
   000072         007600     03  EXT-DATA-2              PIC X(6).                        IC2274.2
   000073         007700     03  EXT-DATA-3              PIC 9(6).                        IC2274.2
   000074         007800     03  EXT-DATA-4              PIC 9(4).                        IC2274.2
   000075         007900*                                                                 IC2274.2
   000076         008000 WORKING-STORAGE SECTION.                                         IC2274.2
   000077         008100*                                                                 IC2274.2
   000078         008300*                                                             *   IC2274.2
   000079         008400*    WORKING-STORAGE DATA ITEMS SPECIFIC TO THIS TEST SUITE   *   IC2274.2
   000080         008500*                                                             *   IC2274.2
   000081         008700*                                                                 IC2274.2
   000082         008800 01  EXTERNAL-RECORD-HOLD.                                        IC2274.2
   000083         008900     03  WSE-DATA-1              PIC X(2).                        IC2274.2
   000084         009000     03  WSE-DATA-2              PIC X(6).                        IC2274.2
   000085         009100     03  WSE-DATA-3              PIC 9(6).                        IC2274.2
   000086         009200     03  WSE-DATA-4              PIC 9(4).                        IC2274.2
   000087         009300*                                                                 IC2274.2
   000088         009400 01  EXTERNAL-RECORD-WORK.                                        IC2274.2
   000089         009500     03  WRK-DATA-1              PIC X(2).                        IC2274.2
   000090         009600     03  WRK-DATA-2              PIC X(6).                        IC2274.2
   000091         009700     03  WRK-DATA-3              PIC 9(6).                        IC2274.2
   000092         009800     03  WRK-DATA-4              PIC 9(4).                        IC2274.2
   000093         009900*                                                                 IC2274.2
   000094         010000 01  EXTERNAL-FILE-FS            PIC XX.                          IC2274.2
   000095         010100 01  F-S-PARAM                   PIC XX.                          IC2274.2
   000096         010200 01  ACTION-CODE                 PIC 99.                          IC2274.2
   000097         010300 77  ID1 PICTURE X(8) VALUE "IC227A-1".                           IC2274.2
   000098         010400*                                                                 IC2274.2
   000099         010600*                                                             *   IC2274.2
   000100         010700*    WORKING-STORAGE DATA ITEMS USED BY THE CCVS              *   IC2274.2
   000101         010800*                                                             *   IC2274.2
   000102         011000*                                                                 IC2274.2
   000103         011100 01  TEST-RESULTS.                                                IC2274.2
   000104         011200     02 FILLER                   PIC X      VALUE SPACE.          IC2274.2 IMP
   000105         011300     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2274.2 IMP
   000106         011400     02 FILLER                   PIC X      VALUE SPACE.          IC2274.2 IMP
   000107         011500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2274.2 IMP
   000108         011600     02 FILLER                   PIC X      VALUE SPACE.          IC2274.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000109         011700     02  PAR-NAME.                                                IC2274.2
   000110         011800       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2274.2 IMP
   000111         011900       03  PARDOT-X              PIC X      VALUE SPACE.          IC2274.2 IMP
   000112         012000       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2274.2 IMP
   000113         012100     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2274.2 IMP
   000114         012200     02 RE-MARK                  PIC X(61).                       IC2274.2
   000115         012300 01  TEST-COMPUTED.                                               IC2274.2
   000116         012400     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2274.2 IMP
   000117         012500     02 FILLER                   PIC X(17)  VALUE                 IC2274.2
   000118         012600            "       COMPUTED=".                                   IC2274.2
   000119         012700     02 COMPUTED-X.                                               IC2274.2
   000120         012800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2274.2 IMP
   000121         012900     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2274.2 120
   000122         013000                                 PIC -9(9).9(9).                  IC2274.2
   000123         013100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2274.2 120
   000124         013200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2274.2 120
   000125         013300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2274.2 120
   000126         013400     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2274.2 120
   000127         013500         04 COMPUTED-18V0                    PIC -9(18).          IC2274.2
   000128         013600         04 FILLER                           PIC X.               IC2274.2
   000129         013700     03 FILLER PIC X(50) VALUE SPACE.                             IC2274.2 IMP
   000130         013800 01  TEST-CORRECT.                                                IC2274.2
   000131         013900     02 FILLER PIC X(30) VALUE SPACE.                             IC2274.2 IMP
   000132         014000     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2274.2
   000133         014100     02 CORRECT-X.                                                IC2274.2
   000134         014200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2274.2 IMP
   000135         014300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2274.2 134
   000136         014400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2274.2 134
   000137         014500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2274.2 134
   000138         014600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2274.2 134
   000139         014700     03      CR-18V0 REDEFINES CORRECT-A.                         IC2274.2 134
   000140         014800         04 CORRECT-18V0                     PIC -9(18).          IC2274.2
   000141         014900         04 FILLER                           PIC X.               IC2274.2
   000142         015000     03 FILLER PIC X(2) VALUE SPACE.                              IC2274.2 IMP
   000143         015100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2274.2 IMP
   000144         015200 01  CCVS-C-1.                                                    IC2274.2
   000145         015300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2274.2
   000146         015400-    "SS  PARAGRAPH-NAME                                          IC2274.2
   000147         015500-    "       REMARKS".                                            IC2274.2
   000148         015600     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2274.2 IMP
   000149         015700 01  CCVS-C-2.                                                    IC2274.2
   000150         015800     02 FILLER                     PIC X        VALUE SPACE.      IC2274.2 IMP
   000151         015900     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2274.2
   000152         016000     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2274.2 IMP
   000153         016100     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2274.2
   000154         016200     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2274.2 IMP
   000155         016300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2274.2 IMP
   000156         016400 01  REC-CT                        PIC 99       VALUE ZERO.       IC2274.2 IMP
   000157         016500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2274.2 IMP
   000158         016600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2274.2 IMP
   000159         016700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2274.2 IMP
   000160         016800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2274.2 IMP
   000161         016900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2274.2 IMP
   000162         017000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2274.2 IMP
   000163         017100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2274.2 IMP
   000164         017200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2274.2 IMP
   000165         017300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2274.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000166         017400 01  CCVS-H-1.                                                    IC2274.2
   000167         017500     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2274.2 IMP
   000168         017600     02  FILLER                    PIC X(42)    VALUE             IC2274.2
   000169         017700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2274.2
   000170         017800     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2274.2 IMP
   000171         017900 01  CCVS-H-2A.                                                   IC2274.2
   000172         018000   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2274.2 IMP
   000173         018100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2274.2
   000174         018200   02  FILLER                        PIC XXXX   VALUE             IC2274.2
   000175         018300     "4.2 ".                                                      IC2274.2
   000176         018400   02  FILLER                        PIC X(28)  VALUE             IC2274.2
   000177         018500            " COPY - NOT FOR DISTRIBUTION".                       IC2274.2
   000178         018600   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2274.2 IMP
   000179         018700                                                                  IC2274.2
   000180         018800 01  CCVS-H-2B.                                                   IC2274.2
   000181         018900   02  FILLER                        PIC X(15)  VALUE             IC2274.2
   000182         019000            "TEST RESULT OF ".                                    IC2274.2
   000183         019100   02  TEST-ID                       PIC X(9).                    IC2274.2
   000184         019200   02  FILLER                        PIC X(4)   VALUE             IC2274.2
   000185         019300            " IN ".                                               IC2274.2
   000186         019400   02  FILLER                        PIC X(12)  VALUE             IC2274.2
   000187         019500     " HIGH       ".                                              IC2274.2
   000188         019600   02  FILLER                        PIC X(22)  VALUE             IC2274.2
   000189         019700            " LEVEL VALIDATION FOR ".                             IC2274.2
   000190         019800   02  FILLER                        PIC X(58)  VALUE             IC2274.2
   000191         019900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2274.2
   000192         020000 01  CCVS-H-3.                                                    IC2274.2
   000193         020100     02  FILLER                      PIC X(34)  VALUE             IC2274.2
   000194         020200            " FOR OFFICIAL USE ONLY    ".                         IC2274.2
   000195         020300     02  FILLER                      PIC X(58)  VALUE             IC2274.2
   000196         020400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2274.2
   000197         020500     02  FILLER                      PIC X(28)  VALUE             IC2274.2
   000198         020600            "  COPYRIGHT   1985,1986 ".                           IC2274.2
   000199         020700 01  CCVS-E-1.                                                    IC2274.2
   000200         020800     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2274.2 IMP
   000201         020900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2274.2
   000202         021000     02 ID-AGAIN                     PIC X(9).                    IC2274.2
   000203         021100     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2274.2 IMP
   000204         021200 01  CCVS-E-2.                                                    IC2274.2
   000205         021300     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2274.2 IMP
   000206         021400     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2274.2 IMP
   000207         021500     02 CCVS-E-2-2.                                               IC2274.2
   000208         021600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2274.2 IMP
   000209         021700         03 FILLER                   PIC X      VALUE SPACE.      IC2274.2 IMP
   000210         021800         03 ENDER-DESC               PIC X(44)  VALUE             IC2274.2
   000211         021900            "ERRORS ENCOUNTERED".                                 IC2274.2
   000212         022000 01  CCVS-E-3.                                                    IC2274.2
   000213         022100     02  FILLER                      PIC X(22)  VALUE             IC2274.2
   000214         022200            " FOR OFFICIAL USE ONLY".                             IC2274.2
   000215         022300     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2274.2 IMP
   000216         022400     02  FILLER                      PIC X(58)  VALUE             IC2274.2
   000217         022500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2274.2
   000218         022600     02  FILLER                      PIC X(8)   VALUE SPACE.      IC2274.2 IMP
   000219         022700     02  FILLER                      PIC X(20)  VALUE             IC2274.2
   000220         022800             " COPYRIGHT 1985,1986".                              IC2274.2
   000221         022900 01  CCVS-E-4.                                                    IC2274.2
   000222         023000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2274.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000223         023100     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2274.2
   000224         023200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2274.2 IMP
   000225         023300     02 FILLER                       PIC X(40)  VALUE             IC2274.2
   000226         023400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2274.2
   000227         023500 01  XXINFO.                                                      IC2274.2
   000228         023600     02 FILLER                       PIC X(19)  VALUE             IC2274.2
   000229         023700            "*** INFORMATION ***".                                IC2274.2
   000230         023800     02 INFO-TEXT.                                                IC2274.2
   000231         023900       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2274.2 IMP
   000232         024000       04 XXCOMPUTED                 PIC X(20).                   IC2274.2
   000233         024100       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2274.2 IMP
   000234         024200       04 XXCORRECT                  PIC X(20).                   IC2274.2
   000235         024300     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2274.2
   000236         024400 01  HYPHEN-LINE.                                                 IC2274.2
   000237         024500     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2274.2 IMP
   000238         024600     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2274.2
   000239         024700-    "*****************************************".                 IC2274.2
   000240         024800     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2274.2
   000241         024900-    "******************************".                            IC2274.2
   000242         025000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2274.2
   000243         025100     "IC227A".                                                    IC2274.2
   000244         025200*                                                                 IC2274.2
   000245         025300*                                                                 IC2274.2
   000246         025400 PROCEDURE DIVISION.                                              IC2274.2
   000247         025500 CCVS1 SECTION.                                                   IC2274.2
   000248         025600 OPEN-FILES.                                                      IC2274.2
   000249         025700     OPEN    OUTPUT PRINT-FILE.                                   IC2274.2 63
   000250         025800     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IC2274.2 242 183 242 202
   000251         025900     MOVE    SPACE TO TEST-RESULTS.                               IC2274.2 IMP 103
   000252         026000     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IC2274.2 296 301
   000253         026100     GO TO CCVS1-EXIT.                                            IC2274.2 383
   000254         026200 CLOSE-FILES.                                                     IC2274.2
   000255         026300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2274.2 305 329 63
   000256         026400 TERMINATE-CCVS.                                                  IC2274.2
   000257         026500     STOP     RUN.                                                IC2274.2
   000258         026600*                                                                 IC2274.2
   000259         026700 INSPT.                                                           IC2274.2
   000260         026800     MOVE   "INSPT" TO P-OR-F.                                    IC2274.2 107
   000261         026900     ADD     1 TO INSPECT-COUNTER.                                IC2274.2 159
   000262         027000     PERFORM PRINT-DETAIL.                                        IC2274.2 280
   000263         027100                                                                  IC2274.2
   000264         027200 PASS.                                                            IC2274.2
   000265         027300     MOVE   "PASS " TO P-OR-F.                                    IC2274.2 107
   000266         027400     ADD     1 TO PASS-COUNTER.                                   IC2274.2 160
   000267         027500     PERFORM PRINT-DETAIL.                                        IC2274.2 280
   000268         027600*                                                                 IC2274.2
   000269         027700 FAIL.                                                            IC2274.2
   000270         027800     MOVE   "FAIL*" TO P-OR-F.                                    IC2274.2 107
   000271         027900     ADD     1 TO ERROR-COUNTER.                                  IC2274.2 158
   000272         028000     PERFORM PRINT-DETAIL.                                        IC2274.2 280
   000273         028100*                                                                 IC2274.2
   000274         028200 DE-LETE.                                                         IC2274.2
   000275         028300     MOVE   "****TEST DELETED****" TO RE-MARK.                    IC2274.2 114
   000276         028400     MOVE   "*****" TO P-OR-F.                                    IC2274.2 107
   000277         028500     ADD     1 TO DELETE-COUNTER.                                 IC2274.2 157
   000278         028600     PERFORM PRINT-DETAIL.                                        IC2274.2 280
   000279         028700                                                                  IC2274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000280         028800 PRINT-DETAIL.                                                    IC2274.2
   000281         028900     IF REC-CT NOT EQUAL TO ZERO                                  IC2274.2 156 IMP
   000282      1  029000             MOVE "." TO PARDOT-X                                 IC2274.2 111
   000283      1  029100             MOVE REC-CT TO DOTVALUE.                             IC2274.2 156 112
   000284         029200     MOVE    TEST-RESULTS TO PRINT-REC.                           IC2274.2 103 64
   000285         029300     PERFORM WRITE-LINE.                                          IC2274.2 343
   000286         029400     IF P-OR-F EQUAL TO "FAIL*"                                   IC2274.2 107
   000287      1  029500          PERFORM WRITE-LINE                                      IC2274.2 343
   000288      1  029600          PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX               IC2274.2 360 373
   000289         029700     ELSE                                                         IC2274.2
   000290      1  029800          PERFORM BAIL-OUT THRU BAIL-OUT-EX.                      IC2274.2 374 382
   000291         029900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2274.2 IMP 107 IMP 119
   000292         030000     MOVE SPACE TO CORRECT-X.                                     IC2274.2 IMP 133
   000293         030100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2274.2 156 IMP IMP 109
   000294         030200     MOVE     SPACE TO RE-MARK.                                   IC2274.2 IMP 114
   000295         030300*                                                                 IC2274.2
   000296         030400 HEAD-ROUTINE.                                                    IC2274.2
   000297         030500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2274.2 166 65 343
   000298         030600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2274.2 171 65 343
   000299         030700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2274.2 180 65 343
   000300         030800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2274.2 192 65 343
   000301         030900 COLUMN-NAMES-ROUTINE.                                            IC2274.2
   000302         031000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2274.2 144 65 343
   000303         031100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2274.2 149 65 343
   000304         031200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2274.2 236 65 343
   000305         031300 END-ROUTINE.                                                     IC2274.2
   000306         031400     MOVE HYPHEN-LINE TO DUMMY-RECORD.                            IC2274.2 236 65
   000307         031500     PERFORM WRITE-LINE 5 TIMES.                                  IC2274.2 343
   000308         031600 END-RTN-EXIT.                                                    IC2274.2
   000309         031700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2274.2 199 65 343
   000310         031800*                                                                 IC2274.2
   000311         031900 END-ROUTINE-1.                                                   IC2274.2
   000312         032000      ADD     ERROR-COUNTER   TO ERROR-HOLD                       IC2274.2 158 162
   000313         032100      ADD     INSPECT-COUNTER TO ERROR-HOLD.                      IC2274.2 159 162
   000314         032200      ADD     DELETE-COUNTER  TO ERROR-HOLD.                      IC2274.2 157 162
   000315         032300      ADD     PASS-COUNTER    TO ERROR-HOLD.                      IC2274.2 160 162
   000316         032400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2274.2
   000317         032500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2274.2 160 222
   000318         032600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2274.2 162 224
   000319         032700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2274.2 221 207
   000320         032800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2274.2 204 65 343
   000321         032900  END-ROUTINE-12.                                                 IC2274.2
   000322         033000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2274.2 210
   000323         033100      IF       ERROR-COUNTER IS EQUAL TO ZERO                     IC2274.2 158 IMP
   000324      1  033200         MOVE "NO " TO ERROR-TOTAL                                IC2274.2 208
   000325         033300         ELSE                                                     IC2274.2
   000326      1  033400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2274.2 158 208
   000327         033500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2274.2 204 65
   000328         033600     PERFORM WRITE-LINE.                                          IC2274.2 343
   000329         033700 END-ROUTINE-13.                                                  IC2274.2
   000330         033800     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2274.2 157 IMP
   000331      1  033900         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2274.2 208
   000332      1  034000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2274.2 157 208
   000333         034100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2274.2 210
   000334         034200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2274.2 204 65 343
   000335         034300     IF   INSPECT-COUNTER EQUAL TO ZERO                           IC2274.2 159 IMP
   000336      1  034400          MOVE "NO " TO ERROR-TOTAL                               IC2274.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000337         034500     ELSE                                                         IC2274.2
   000338      1  034600          MOVE INSPECT-COUNTER TO ERROR-TOTAL.                    IC2274.2 159 208
   000339         034700     MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.             IC2274.2 210
   000340         034800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2274.2 204 65 343
   000341         034900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2274.2 212 65 343
   000342         035000*                                                                 IC2274.2
   000343         035100 WRITE-LINE.                                                      IC2274.2
   000344         035200     ADD 1 TO RECORD-COUNT.                                       IC2274.2 164
   000345         035300     IF RECORD-COUNT GREATER 50                                   IC2274.2 164
   000346      1  035400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2274.2 65 163
   000347      1  035500         MOVE SPACE TO DUMMY-RECORD                               IC2274.2 IMP 65
   000348      1  035600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2274.2 65
   000349      1  035700         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2274.2 144 65 355
   000350      1  035800         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2274.2 149 65 355
   000351      1  035900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2274.2 236 65 355
   000352      1  036000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2274.2 163 65
   000353      1  036100         MOVE ZERO TO RECORD-COUNT.                               IC2274.2 IMP 164
   000354         036200     PERFORM WRT-LN.                                              IC2274.2 355
   000355         036300 WRT-LN.                                                          IC2274.2
   000356         036400     WRITE   DUMMY-RECORD AFTER ADVANCING 1 LINES.                IC2274.2 65
   000357         036500     MOVE    SPACE TO DUMMY-RECORD.                               IC2274.2 IMP 65
   000358         036600 BLANK-LINE-PRINT.                                                IC2274.2
   000359         036700     PERFORM WRT-LN.                                              IC2274.2 355
   000360         036800 FAIL-ROUTINE.                                                    IC2274.2
   000361         036900     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2274.2 119 IMP 368
   000362         037000     IF   CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.  IC2274.2 133 IMP 368
   000363         037100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2274.2 165 235
   000364         037200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2274.2 230
   000365         037300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2274.2 227 65 343
   000366         037400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2274.2 IMP 235
   000367         037500     GO TO  FAIL-ROUTINE-EX.                                      IC2274.2 373
   000368         037600 FAIL-ROUTINE-WRITE.                                              IC2274.2
   000369         037700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2274.2 115 64 343
   000370         037800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2274.2 165 143
   000371         037900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2274.2 130 64 343
   000372         038000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2274.2 IMP 143
   000373         038100 FAIL-ROUTINE-EX. EXIT.                                           IC2274.2
   000374         038200 BAIL-OUT.                                                        IC2274.2
   000375         038300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2274.2 120 IMP 377
   000376         038400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2274.2 134 IMP 382
   000377         038500 BAIL-OUT-WRITE.                                                  IC2274.2
   000378         038600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2274.2 134 234 120 232
   000379         038700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2274.2 165 235
   000380         038800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2274.2 227 65 343
   000381         038900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2274.2 IMP 235
   000382         039000 BAIL-OUT-EX. EXIT.                                               IC2274.2
   000383         039100 CCVS1-EXIT.                                                      IC2274.2
   000384         039200     EXIT.                                                        IC2274.2
   000385         039300*                                                                 IC2274.2
   000386         039500*                                                              *  IC2274.2
   000387         039600*    THIS POINT MARKS THE END OF THE CCVS MONITOR ROUTINES AND *  IC2274.2
   000388         039700*    THE START OF THE TESTS OF SPECIFIC COBOL FEATURES.        *  IC2274.2
   000389         039800*                                                              *  IC2274.2
   000390         040000*                                                                 IC2274.2
   000391         040100 SECT-IC227A-01 SECTION.                                          IC2274.2
   000392         040200 EXT-INIT-01.                                                     IC2274.2
   000393         040300*                                                                 IC2274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000394         040400*    *************************************************            IC2274.2
   000395         040500*    *                                               *            IC2274.2
   000396         040600*    *    MAKE EXTERNAL FILE RECORD AREA AVAILABLE   *            IC2274.2
   000397         040700*    *                                               *            IC2274.2
   000398         040800*    *************************************************            IC2274.2
   000399         040900*                                                                 IC2274.2
   000400         041000     OPEN    OUTPUT EXTERNAL-FILE.                                IC2274.2 67
   000401         041100*                                                                 IC2274.2
   000402         041200     MOVE    1 TO REC-CT.                                         IC2274.2 156
   000403         041300     MOVE   "EXTERNAL FILE RECORD" TO FEATURE.                    IC2274.2 105
   000404         041400     MOVE   "X-23 4.5.1" TO ANSI-REFERENCE.                       IC2274.2 165
   000405         041500     MOVE   "EXT-REC-TEST-01"     TO PAR-NAME.                    IC2274.2 109
   000406         041600     MOVE   "******************"  TO EXTERNAL-FILE-RECORD.        IC2274.2 70
   000407         041700     MOVE   "**"                  TO F-S-PARAM.                   IC2274.2 95
   000408         041800     MOVE   "AA"                  TO WRK-DATA-1                   IC2274.2 89
   000409         041900     MOVE   "PQRSTU"              TO WRK-DATA-2                   IC2274.2 90
   000410         042000     MOVE    123456               TO WRK-DATA-3                   IC2274.2 91
   000411         042100     MOVE    9876                 TO WRK-DATA-4.                  IC2274.2 92
   000412         042200     MOVE    EXTERNAL-RECORD-WORK TO EXTERNAL-RECORD-HOLD.        IC2274.2 88 82
   000413         042300     MOVE   "<>"                  TO EXTERNAL-FILE-FS.            IC2274.2 94
   000414         042400     GO TO   EXT-REC-TEST-01.                                     IC2274.2 425
   000415         042500 EXT-REC-DELETE-01.                                               IC2274.2
   000416         042600     PERFORM DE-LETE.                                             IC2274.2 274
   000417         042700     GO TO   EXT-REC-DELETE-01-02.                                IC2274.2 440
   000418         042800*                                                                 IC2274.2
   000419         042900*    *************************************************            IC2274.2
   000420         043000*    *                                               *            IC2274.2
   000421         043100*    *   CHECK THAT SUBPROGRAM SEES SAME RECORD AREA *            IC2274.2
   000422         043200*    *                                               *            IC2274.2
   000423         043300*    *************************************************            IC2274.2
   000424         043400*                                                                 IC2274.2
   000425         043500 EXT-REC-TEST-01.                                                 IC2274.2
   000426         043600     MOVE    1 TO ACTION-CODE.                                    IC2274.2 96
   000427         043700     CALL   "IC227A-1" USING ACTION-CODE                          IC2274.2 EXT 96

 ==000427==> IGYPG0020-W Name "IC227A-1" was processed as "IC227A01".

   000428         043800                             EXTERNAL-RECORD-WORK                 IC2274.2 88
   000429         043900                             F-S-PARAM.                           IC2274.2 95
   000430         044000     IF EXTERNAL-FILE-RECORD EQUAL EXTERNAL-RECORD-HOLD           IC2274.2 70 82
   000431      1  044100         PERFORM PASS                                             IC2274.2 264
   000432         044200     ELSE                                                         IC2274.2
   000433      1  044300         MOVE   "SUBPROGRAM DID NOT WRITE TO RECORD AREA"         IC2274.2
   000434      1  044400                   TO RE-MARK                                     IC2274.2 114
   000435      1  044500         MOVE    EXTERNAL-FILE-RECORD TO COMPUTED-A               IC2274.2 70 120
   000436      1  044600         MOVE    EXTERNAL-RECORD-HOLD TO CORRECT-A                IC2274.2 82 134
   000437      1  044700         PERFORM FAIL                                             IC2274.2 269
   000438         044800     END-IF.                                                      IC2274.2
   000439         044900     GO TO  EXT-REC-TEST-01-02.                                   IC2274.2 444
   000440         045000 EXT-REC-DELETE-01-02.                                            IC2274.2
   000441         045100     ADD     1 TO REC-CT                                          IC2274.2 156
   000442         045200     PERFORM DE-LETE.                                             IC2274.2 274
   000443         045300     GO TO   EXT-REC-DELETE-01-03.                                IC2274.2 456
   000444         045400 EXT-REC-TEST-01-02.                                              IC2274.2
   000445         045500     ADD     1 TO REC-CT.                                         IC2274.2 156
   000446         045600     IF EXTERNAL-RECORD-WORK EQUAL "******************"           IC2274.2 88
   000447      1  045700         PERFORM PASS                                             IC2274.2 264
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448         045800     ELSE                                                         IC2274.2
   000449      1  045900         MOVE   "SUBPROGRAM DID NOT READ FROM RECORD AREA"        IC2274.2
   000450      1  046000                   TO RE-MARK                                     IC2274.2 114
   000451      1  046100         MOVE    EXTERNAL-RECORD-WORK TO COMPUTED-A               IC2274.2 88 120
   000452      1  046200         MOVE    "******************" TO CORRECT-A                IC2274.2 134
   000453      1  046300         PERFORM FAIL                                             IC2274.2 269
   000454         046400     END-IF.                                                      IC2274.2
   000455         046500     GO TO  EXT-REC-TEST-01-03.                                   IC2274.2 460
   000456         046600 EXT-REC-DELETE-01-03.                                            IC2274.2
   000457         046700     ADD     1 TO REC-CT                                          IC2274.2 156
   000458         046800     PERFORM DE-LETE.                                             IC2274.2 274
   000459         046900     GO TO   EXT-REC-TEST-01-END.                                 IC2274.2 471
   000460         047000 EXT-REC-TEST-01-03.                                              IC2274.2
   000461         047100     ADD     1 TO REC-CT.                                         IC2274.2 156
   000462         047200     IF F-S-PARAM IS EQUAL "XX"                                   IC2274.2 95
   000463      1  047300         PERFORM PASS                                             IC2274.2 264
   000464         047400     ELSE                                                         IC2274.2
   000465      1  047500         MOVE   "WRONG FILE STATUS VALUE RETURNED"                IC2274.2
   000466      1  047600                   TO RE-MARK                                     IC2274.2 114
   000467      1  047700         MOVE    F-S-PARAM TO COMPUTED-A                          IC2274.2 95 120
   000468      1  047800         MOVE    "XX" TO CORRECT-A                                IC2274.2 134
   000469      1  047900         PERFORM FAIL                                             IC2274.2 269
   000470         048000     END-IF.                                                      IC2274.2
   000471         048100 EXT-REC-TEST-01-END.                                             IC2274.2
   000472         048200*                                                                 IC2274.2
   000473         048300*                                                                 IC2274.2
   000474         048400 EXT-INIT-02.                                                     IC2274.2

 ==000474==> IGYPS2015-I The paragraph or section prior to paragraph or section "EXT-INIT-02" did
                         not contain any statements.

   000475         048500*                                                                 IC2274.2
   000476         048600*    *************************************************            IC2274.2
   000477         048700*    *                                               *            IC2274.2
   000478         048800*    *    WRITE RECORD FROM PARAMETERS TO FILE       *            IC2274.2
   000479         048900*    *                                               *            IC2274.2
   000480         049000*    *************************************************            IC2274.2
   000481         049100*                                                                 IC2274.2
   000482         049200     MOVE    1 TO REC-CT.                                         IC2274.2 156
   000483         049300     MOVE   "EXTERNAL FILE WRITE" TO FEATURE.                     IC2274.2 105
   000484         049400     MOVE   "X-23 4.5.1" TO ANSI-REFERENCE.                       IC2274.2 165
   000485         049500     MOVE   "EXT-FILE-TEST-02"    TO PAR-NAME.                    IC2274.2 109
   000486         049600     MOVE   "******************"  TO EXTERNAL-FILE-RECORD.        IC2274.2 70
   000487         049700     MOVE   "**"                  TO F-S-PARAM.                   IC2274.2 95
   000488         049800     MOVE   "AA"                  TO WRK-DATA-1                   IC2274.2 89
   000489         049900     MOVE   "PQRSTU"              TO WRK-DATA-2                   IC2274.2 90
   000490         050000     MOVE    123456               TO WRK-DATA-3                   IC2274.2 91
   000491         050100     MOVE    9876                 TO WRK-DATA-4.                  IC2274.2 92
   000492         050200     MOVE   "<>"                  TO EXTERNAL-FILE-FS.            IC2274.2 94
   000493         050300     GO TO   EXT-FILE-TEST-02.                                    IC2274.2 506
   000494         050400 EXT-FILE-DELETE-02.                                              IC2274.2
   000495         050500     PERFORM DE-LETE.                                             IC2274.2 274
   000496         050600     MOVE    EXTERNAL-RECORD-WORK TO EXTERNAL-FILE-RECORD.        IC2274.2 88 70
   000497         050700     WRITE   EXTERNAL-FILE-RECORD.                                IC2274.2 70
   000498         050800     GO TO   EXT-FILE-DELETE-02-02.                               IC2274.2 521
   000499         050900*                                                                 IC2274.2
   000500         051000*    *************************************************            IC2274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000501         051100*    *                                               *            IC2274.2
   000502         051200*    *   CHECK THAT SUBPROGRAM WILL WRITE            *            IC2274.2
   000503         051300*    *                                               *            IC2274.2
   000504         051400*    *************************************************            IC2274.2
   000505         051500*                                                                 IC2274.2
   000506         051600 EXT-FILE-TEST-02.                                                IC2274.2
   000507         051700     MOVE    2 TO ACTION-CODE.                                    IC2274.2 96
   000508         051800     CALL   "IC227A-1" USING CONTENT   ACTION-CODE                IC2274.2 EXT 96

 ==000508==> IGYPG0020-W Name "IC227A-1" was processed as "IC227A01".

   000509         051900                             REFERENCE EXTERNAL-RECORD-WORK       IC2274.2 88
   000510         052000                                       F-S-PARAM.                 IC2274.2 95
   000511         052100     IF F-S-PARAM IS EQUAL "00"                                   IC2274.2 95
   000512      1  052200         PERFORM PASS                                             IC2274.2 264
   000513         052300     ELSE                                                         IC2274.2
   000514      1  052400         MOVE   "UNEXPECTED FILE STATUS VALUE RETURNED"           IC2274.2
   000515      1  052500                   TO RE-MARK                                     IC2274.2 114
   000516      1  052600         MOVE    F-S-PARAM TO COMPUTED-A                          IC2274.2 95 120
   000517      1  052700         MOVE    "00" TO CORRECT-A                                IC2274.2 134
   000518      1  052800         PERFORM FAIL                                             IC2274.2 269
   000519         052900     END-IF.                                                      IC2274.2
   000520         053000     GO TO   EXT-FILE-TEST-02-02.                                 IC2274.2 525
   000521         053100 EXT-FILE-DELETE-02-02.                                           IC2274.2
   000522         053200     ADD     1 TO REC-CT                                          IC2274.2 156
   000523         053300     PERFORM DE-LETE.                                             IC2274.2 274
   000524         053400     GO TO   EXT-FILE-TEST-02-END.                                IC2274.2 535
   000525         053500 EXT-FILE-TEST-02-02.                                             IC2274.2
   000526         053600     ADD     1 TO REC-CT.                                         IC2274.2 156
   000527         053700     IF EXTERNAL-FILE-FS IS EQUAL TO "<>"                         IC2274.2 94
   000528      1  053800          PERFORM PASS                                            IC2274.2 264
   000529         053900     ELSE                                                         IC2274.2
   000530      1  054000          MOVE   "MAIN PROGRAM FILE STATUS UPDATED" TO RE-MARK    IC2274.2 114
   000531      1  054100          MOVE   "<>" TO CORRECT-A                                IC2274.2 134
   000532      1  054200          MOVE    EXTERNAL-FILE-FS TO COMPUTED-A                  IC2274.2 94 120
   000533      1  054300          PERFORM FAIL.                                           IC2274.2 269
   000534         054400*                                                                 IC2274.2
   000535         054500 EXT-FILE-TEST-02-END.                                            IC2274.2
   000536         054600*                                                                 IC2274.2
   000537         054700*                                                                 IC2274.2
   000538         054800 EXT-INIT-03.                                                     IC2274.2

 ==000538==> IGYPS2015-I The paragraph or section prior to paragraph or section "EXT-INIT-03" did
                         not contain any statements.

   000539         054900*                                                                 IC2274.2
   000540         055000*    *************************************************            IC2274.2
   000541         055100*    *                                               *            IC2274.2
   000542         055200*    *    WRITE A RECORD FROM THE MAIN PROGRAM       *            IC2274.2
   000543         055300*    *                                               *            IC2274.2
   000544         055400*    *************************************************            IC2274.2
   000545         055500*                                                                 IC2274.2
   000546         055600     MOVE    1 TO REC-CT.                                         IC2274.2 156
   000547         055700     MOVE   "EXTERNAL FILE WRITE" TO FEATURE.                     IC2274.2 105
   000548         055800     MOVE   "X-23 4.5.1" TO ANSI-REFERENCE.                       IC2274.2 165
   000549         055900     MOVE   "EXT-FILE-TEST-03"    TO PAR-NAME.                    IC2274.2 109
   000550         056000     MOVE   "BB"                  TO EXT-DATA-1                   IC2274.2 71
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000551         056100     MOVE   "ZYXWVU"              TO EXT-DATA-2                   IC2274.2 72
   000552         056200     MOVE    222222               TO EXT-DATA-3                   IC2274.2 73
   000553         056300     MOVE    9765                 TO EXT-DATA-4.                  IC2274.2 74
   000554         056400     MOVE   "<>"                  TO EXTERNAL-FILE-FS.            IC2274.2 94
   000555         056500     GO TO   EXT-FILE-TEST-03-01.                                 IC2274.2 560
   000556         056600 EXT-FILE-DELETE-03.                                              IC2274.2
   000557         056700     PERFORM DE-LETE.                                             IC2274.2 274
   000558         056800     GO TO   EXT-FILE-TEST-03-END.                                IC2274.2 570
   000559         056900*                                                                 IC2274.2
   000560         057000 EXT-FILE-TEST-03-01.                                             IC2274.2
   000561         057100     WRITE   EXTERNAL-FILE-RECORD.                                IC2274.2 70
   000562         057200     IF EXTERNAL-FILE-FS IS EQUAL TO "00"                         IC2274.2 94
   000563      1  057300          PERFORM PASS                                            IC2274.2 264
   000564         057400     ELSE                                                         IC2274.2
   000565      1  057500          MOVE   "MAIN PROGRAM FILE STATUS NON-ZERO" TO RE-MARK   IC2274.2 114
   000566      1  057600          MOVE   "00" TO CORRECT-A                                IC2274.2 134
   000567      1  057700          MOVE    EXTERNAL-FILE-FS TO COMPUTED-A                  IC2274.2 94 120
   000568      1  057800          PERFORM FAIL.                                           IC2274.2 269
   000569         057900*                                                                 IC2274.2
   000570         058000 EXT-FILE-TEST-03-END.                                            IC2274.2
   000571         058100*                                                                 IC2274.2
   000572         058200*                                                                 IC2274.2
   000573         058300 EXT-INIT-04.                                                     IC2274.2

 ==000573==> IGYPS2015-I The paragraph or section prior to paragraph or section "EXT-INIT-04" did
                         not contain any statements.

   000574         058400*                                                                 IC2274.2
   000575         058500*    *************************************************            IC2274.2
   000576         058600*    *                                               *            IC2274.2
   000577         058700*    *    CLOSE THE FILE THROUGH THE SUBPROGRAM      *            IC2274.2
   000578         058800*    *                                               *            IC2274.2
   000579         058900*    *************************************************            IC2274.2
   000580         059000*                                                                 IC2274.2
   000581         059100     MOVE    1 TO REC-CT.                                         IC2274.2 156
   000582         059200     MOVE   "EXTERNAL FILE CLOSE" TO FEATURE.                     IC2274.2 105
   000583         059300     MOVE   "X-23 4.5.1" TO ANSI-REFERENCE.                       IC2274.2 165
   000584         059400     MOVE   "EXT-FILE-TEST-04"    TO PAR-NAME.                    IC2274.2 109
   000585         059500     MOVE   "**"                  TO F-S-PARAM.                   IC2274.2 95
   000586         059600     MOVE   "<>"                  TO EXTERNAL-FILE-FS.            IC2274.2 94
   000587         059700     GO TO   EXT-FILE-TEST-04-01.                                 IC2274.2 593
   000588         059800 EXT-FILE-DELETE-04-01.                                           IC2274.2
   000589         059900     PERFORM DE-LETE.                                             IC2274.2 274
   000590         060000     CLOSE   EXTERNAL-FILE.                                       IC2274.2 67
   000591         060100     GO TO   EXT-FILE-DELETE-04-02.                               IC2274.2 608
   000592         060200*                                                                 IC2274.2
   000593         060300 EXT-FILE-TEST-04-01.                                             IC2274.2
   000594         060400     MOVE    3 TO ACTION-CODE.                                    IC2274.2 96
   000595         060500     CALL   "IC227A-1" USING CONTENT   ACTION-CODE                IC2274.2 EXT 96

 ==000595==> IGYPG0020-W Name "IC227A-1" was processed as "IC227A01".

   000596         060600                                       EXTERNAL-RECORD-WORK       IC2274.2 88
   000597         060700                             REFERENCE F-S-PARAM.                 IC2274.2 95
   000598         060800     IF F-S-PARAM IS EQUAL "00"                                   IC2274.2 95
   000599      1  060900         PERFORM PASS                                             IC2274.2 264
   000600         061000     ELSE                                                         IC2274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000601      1  061100         MOVE   "UNEXPECTED FILE STATUS VALUE RETURNED"           IC2274.2
   000602      1  061200                   TO RE-MARK                                     IC2274.2 114
   000603      1  061300         MOVE    F-S-PARAM TO COMPUTED-A                          IC2274.2 95 120
   000604      1  061400         MOVE    "00" TO CORRECT-A                                IC2274.2 134
   000605      1  061500         PERFORM FAIL                                             IC2274.2 269
   000606         061600     END-IF.                                                      IC2274.2
   000607         061700     GO TO   EXT-FILE-TEST-04-02.                                 IC2274.2 612
   000608         061800 EXT-FILE-DELETE-04-02.                                           IC2274.2
   000609         061900     ADD     1 TO REC-CT                                          IC2274.2 156
   000610         062000     PERFORM DE-LETE.                                             IC2274.2 274
   000611         062100     GO TO   EXT-FILE-TEST-04-END.                                IC2274.2 622
   000612         062200 EXT-FILE-TEST-04-02.                                             IC2274.2
   000613         062300     ADD     1 TO REC-CT.                                         IC2274.2 156
   000614         062400     IF EXTERNAL-FILE-FS IS EQUAL TO "<>"                         IC2274.2 94
   000615      1  062500          PERFORM PASS                                            IC2274.2 264
   000616         062600     ELSE                                                         IC2274.2
   000617      1  062700          MOVE   "MAIN PROGRAM FILE STATUS UPDATED" TO RE-MARK    IC2274.2 114
   000618      1  062800          MOVE   "<>" TO CORRECT-A                                IC2274.2 134
   000619      1  062900          MOVE    EXTERNAL-FILE-FS TO COMPUTED-A                  IC2274.2 94 120
   000620      1  063000          PERFORM FAIL.                                           IC2274.2 269
   000621         063100*                                                                 IC2274.2
   000622         063200 EXT-FILE-TEST-04-END.                                            IC2274.2
   000623         063300*                                                                 IC2274.2
   000624         063400*                                                                 IC2274.2
   000625         063500 EXT-INIT-05.                                                     IC2274.2

 ==000625==> IGYPS2015-I The paragraph or section prior to paragraph or section "EXT-INIT-05" did
                         not contain any statements.

   000626         063600*                                                                 IC2274.2
   000627         063700*    *************************************************            IC2274.2
   000628         063800*    *                                               *            IC2274.2
   000629         063900*    *    OPEN FILE FOR INPUT FROM SUBPROGRAM        *            IC2274.2
   000630         064000*    *                                               *            IC2274.2
   000631         064100*    *************************************************            IC2274.2
   000632         064200*                                                                 IC2274.2
   000633         064300     MOVE    1 TO REC-CT.                                         IC2274.2 156
   000634         064400     MOVE   "EXTERNAL FILE OPEN"  TO FEATURE.                     IC2274.2 105
   000635         064500     MOVE   "X-23 4.5.1" TO ANSI-REFERENCE.                       IC2274.2 165
   000636         064600     MOVE   "EXT-FILE-TEST-05"    TO PAR-NAME.                    IC2274.2 109
   000637         064700     MOVE   "******************"  TO EXTERNAL-RECORD-WORK.        IC2274.2 88
   000638         064800     MOVE    EXTERNAL-RECORD-WORK TO EXTERNAL-RECORD-HOLD.        IC2274.2 88 82
   000639         064900     MOVE   "**"                  TO F-S-PARAM.                   IC2274.2 95
   000640         065000     MOVE   "<>"                  TO EXTERNAL-FILE-FS.            IC2274.2 94
   000641         065100     GO TO   EXT-FILE-TEST-05-01.                                 IC2274.2 646
   000642         065200 EXT-FILE-DELETE-05.                                              IC2274.2
   000643         065300     PERFORM DE-LETE.                                             IC2274.2 274
   000644         065400     OPEN    INPUT EXTERNAL-FILE.                                 IC2274.2 67
   000645         065500     GO TO   EXT-FILE-DELETE-05-02.                               IC2274.2 661
   000646         065600 EXT-FILE-TEST-05-01.                                             IC2274.2
   000647         065700     MOVE    4 TO ACTION-CODE.                                    IC2274.2 96
   000648         065800     CALL    ID1    USING BY CONTENT   ACTION-CODE                IC2274.2 97 96
   000649         065900                             REFERENCE EXTERNAL-RECORD-WORK       IC2274.2 88
   000650         066000                          BY REFERENCE F-S-PARAM.                 IC2274.2 95
   000651         066100     IF F-S-PARAM IS EQUAL "00"                                   IC2274.2 95
   000652      1  066200         PERFORM PASS                                             IC2274.2 264
   000653         066300     ELSE                                                         IC2274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000654      1  066400         MOVE   "UNEXPECTED FILE STATUS VALUE RETURNED"           IC2274.2
   000655      1  066500                   TO RE-MARK                                     IC2274.2 114
   000656      1  066600         MOVE    F-S-PARAM TO COMPUTED-A                          IC2274.2 95 120
   000657      1  066700         MOVE    "00" TO CORRECT-A                                IC2274.2 134
   000658      1  066800         PERFORM FAIL                                             IC2274.2 269
   000659         066900     END-IF.                                                      IC2274.2
   000660         067000     GO TO   EXT-FILE-TEST-05-02.                                 IC2274.2 665
   000661         067100 EXT-FILE-DELETE-05-02.                                           IC2274.2
   000662         067200     ADD     1 TO REC-CT                                          IC2274.2 156
   000663         067300     PERFORM DE-LETE.                                             IC2274.2 274
   000664         067400     GO TO   EXT-FILE-DELETE-05-03.                               IC2274.2 675
   000665         067500 EXT-FILE-TEST-05-02.                                             IC2274.2
   000666         067600     ADD     1 TO REC-CT.                                         IC2274.2 156
   000667         067700     IF EXTERNAL-FILE-FS IS EQUAL TO "<>"                         IC2274.2 94
   000668      1  067800          PERFORM PASS                                            IC2274.2 264
   000669         067900     ELSE                                                         IC2274.2
   000670      1  068000          MOVE   "MAIN PROGRAM FILE STATUS UPDATED" TO RE-MARK    IC2274.2 114
   000671      1  068100          MOVE   "<>" TO CORRECT-A                                IC2274.2 134
   000672      1  068200          MOVE    EXTERNAL-FILE-FS TO COMPUTED-A                  IC2274.2 94 120
   000673      1  068300          PERFORM FAIL.                                           IC2274.2 269
   000674         068400*    GO TO   EXT-FILE-TEST-05-03.                                 IC2274.2
   000675         068500 EXT-FILE-DELETE-05-03.                                           IC2274.2
   000676         068600     ADD     1 TO REC-CT.                                         IC2274.2 156
   000677         068700     PERFORM DE-LETE.                                             IC2274.2 274
   000678         068800     GO TO   EXT-FILE-DELETE-05-04.                               IC2274.2 690
   000679         068900 EXT-FILE-TEST-05-03.                                             IC2274.2
   000680         069000     ADD     1 TO REC-CT.                                         IC2274.2 156
   000681         069100     IF EXTERNAL-FILE-RECORD = EXTERNAL-RECORD-HOLD               IC2274.2 70 82
   000682      1  069200          PERFORM PASS                                            IC2274.2 264
   000683         069300     ELSE                                                         IC2274.2
   000684      1  069400          MOVE   "PARAMETER NOT RETURNED THROUGH RECORD AREA"     IC2274.2
   000685      1  069500                    TO RE-MARK                                    IC2274.2 114
   000686      1  069600          MOVE    EXTERNAL-FILE-RECORD TO COMPUTED-A              IC2274.2 70 120
   000687      1  069700          MOVE    EXTERNAL-RECORD-HOLD TO CORRECT-A               IC2274.2 82 134
   000688      1  069800          PERFORM FAIL.                                           IC2274.2 269
   000689         069900     GO TO   EXT-FILE-TEST-05-04.                                 IC2274.2 694
   000690         070000 EXT-FILE-DELETE-05-04.                                           IC2274.2
   000691         070100     ADD     1 TO REC-CT.                                         IC2274.2 156
   000692         070200     PERFORM DE-LETE.                                             IC2274.2 274
   000693         070300     GO TO   EXT-FILE-TEST-05-END.                                IC2274.2 704
   000694         070400 EXT-FILE-TEST-05-04.                                             IC2274.2
   000695         070500     ADD     1 TO REC-CT.                                         IC2274.2 156
   000696         070600     IF EXTERNAL-RECORD-WORK IS = "OPEN   OPEN   OPEN"            IC2274.2 88
   000697      1  070700          PERFORM PASS                                            IC2274.2 264
   000698         070800     ELSE                                                         IC2274.2
   000699      1  070900          MOVE   "PARAMETER RETURN INCORRECT" TO RE-MARK          IC2274.2 114
   000700      1  071000          MOVE   "OPEN   OPEN   OPEN"  TO CORRECT-A               IC2274.2 134
   000701      1  071100          MOVE    EXTERNAL-RECORD-WORK TO COMPUTED-A              IC2274.2 88 120
   000702      1  071200          PERFORM FAIL.                                           IC2274.2 269
   000703         071300*                                                                 IC2274.2
   000704         071400 EXT-FILE-TEST-05-END.                                            IC2274.2
   000705         071500*                                                                 IC2274.2
   000706         071600*                                                                 IC2274.2
   000707         071700 EXT-INIT-06.                                                     IC2274.2

 ==000707==> IGYPS2015-I The paragraph or section prior to paragraph or section "EXT-INIT-06" did
                         not contain any statements.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0
   000708         071800*                                                                 IC2274.2
   000709         071900*    *************************************************            IC2274.2
   000710         072000*    *                                               *            IC2274.2
   000711         072100*    *    READ THE FIRST RECORD FROM THE FILE WITH   *            IC2274.2
   000712         072200*    *    THE MAIN PROGRAM .                         *            IC2274.2
   000713         072300*    *                                               *            IC2274.2
   000714         072400*    *************************************************            IC2274.2
   000715         072500*                                                                 IC2274.2
   000716         072600     MOVE    1 TO REC-CT.                                         IC2274.2 156
   000717         072700     MOVE   "EXTERNAL FILE READ"  TO FEATURE.                     IC2274.2 105
   000718         072800     MOVE   "X-23 4.5.1"          TO ANSI-REFERENCE.              IC2274.2 165
   000719         072900     MOVE   "EXT-FILE-TEST-06"    TO PAR-NAME.                    IC2274.2 109
   000720         073000     MOVE   "%%%%%%%%%%%%%%%%%%"  TO EXTERNAL-FILE-RECORD.        IC2274.2 70
   000721         073100     MOVE   "AAPQRSTU1234569876"  TO EXTERNAL-RECORD-HOLD.        IC2274.2 82
   000722         073200     MOVE   "<>"                  TO EXTERNAL-FILE-FS.            IC2274.2 94
   000723         073300     GO TO   EXT-FILE-TEST-06-01.                                 IC2274.2 727
   000724         073400 EXT-FILE-DELETE-06.                                              IC2274.2
   000725         073500     PERFORM DE-LETE.                                             IC2274.2 274
   000726         073600     GO TO   EXT-FILE-DELETE-06-02.                               IC2274.2 740
   000727         073700 EXT-FILE-TEST-06-01.                                             IC2274.2
   000728         073800     READ    EXTERNAL-FILE NEXT RECORD                            IC2274.2 67
   000729      1  073900            AT END GO TO EXT-FILE-TEST-06-02.                     IC2274.2 744
   000730         074000     IF EXTERNAL-FILE-FS IS EQUAL "00"                            IC2274.2 94
   000731      1  074100         PERFORM PASS                                             IC2274.2 264
   000732         074200     ELSE                                                         IC2274.2
   000733      1  074300         MOVE   "UNEXPECTED FILE STATUS VALUE RETURNED"           IC2274.2
   000734      1  074400                   TO RE-MARK                                     IC2274.2 114
   000735      1  074500         MOVE    EXTERNAL-FILE-FS TO COMPUTED-A                   IC2274.2 94 120
   000736      1  074600         MOVE    "00" TO CORRECT-A                                IC2274.2 134
   000737      1  074700         PERFORM FAIL                                             IC2274.2 269
   000738         074800     END-IF.                                                      IC2274.2
   000739         074900     GO TO   EXT-FILE-TEST-06-02.                                 IC2274.2 744
   000740         075000 EXT-FILE-DELETE-06-02.                                           IC2274.2
   000741         075100     ADD     1 TO REC-CT                                          IC2274.2 156
   000742         075200     PERFORM DE-LETE.                                             IC2274.2 274
   000743         075300     GO TO   EXT-FILE-TEST-06-END.                                IC2274.2 755
   000744         075400 EXT-FILE-TEST-06-02.                                             IC2274.2
   000745         075500     ADD     1 TO REC-CT.                                         IC2274.2 156
   000746         075600     IF EXTERNAL-FILE-RECORD = EXTERNAL-RECORD-HOLD               IC2274.2 70 82
   000747      1  075700          PERFORM PASS                                            IC2274.2 264
   000748         075800     ELSE                                                         IC2274.2
   000749      1  075900          MOVE "EXPECTED RECORD NOT READ FROM FILE"               IC2274.2
   000750      1  076000                    TO RE-MARK                                    IC2274.2 114
   000751      1  076100          MOVE    EXTERNAL-FILE-RECORD TO COMPUTED-A              IC2274.2 70 120
   000752      1  076200          MOVE    EXTERNAL-RECORD-HOLD TO CORRECT-A               IC2274.2 82 134
   000753      1  076300          PERFORM FAIL.                                           IC2274.2 269
   000754         076400*                                                                 IC2274.2
   000755         076500 EXT-FILE-TEST-06-END.                                            IC2274.2
   000756         076600*                                                                 IC2274.2
   000757         076700*                                                                 IC2274.2
   000758         076800 EXT-INIT-07.                                                     IC2274.2

 ==000758==> IGYPS2015-I The paragraph or section prior to paragraph or section "EXT-INIT-07" did
                         not contain any statements.

   000759         076900*                                                                 IC2274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000760         077000*    *************************************************            IC2274.2
   000761         077100*    *                                               *            IC2274.2
   000762         077200*    *    READ SECOND RECORD FROM THE FILE THROUGH   *            IC2274.2
   000763         077300*    *    THE SUBPROGRAM                             *            IC2274.2
   000764         077400*    *                                               *            IC2274.2
   000765         077500*    *************************************************            IC2274.2
   000766         077600*                                                                 IC2274.2
   000767         077700     MOVE    1 TO REC-CT.                                         IC2274.2 156
   000768         077800     MOVE   "EXTERNAL FILE READ"  TO FEATURE.                     IC2274.2 105
   000769         077900     MOVE   "X-23 4.5.1" TO ANSI-REFERENCE.                       IC2274.2 165
   000770         078000     MOVE   "EXT-FILE-TEST-07"    TO PAR-NAME.                    IC2274.2 109
   000771         078100     MOVE   "%%%%%%%%%%%%%%%%%%"  TO EXTERNAL-FILE-RECORD.        IC2274.2 70
   000772         078200     MOVE   ";;;;;;;;;;;;;;;;;;"  TO EXTERNAL-RECORD-WORK.        IC2274.2 88
   000773         078300     MOVE   "BBZYXWVU2222229765"  TO EXTERNAL-RECORD-HOLD.        IC2274.2 82
   000774         078400     MOVE   "**"                  TO F-S-PARAM.                   IC2274.2 95
   000775         078500     MOVE   "<>"                  TO EXTERNAL-FILE-FS.            IC2274.2 94
   000776         078600     GO TO   EXT-FILE-TEST-07-01.                                 IC2274.2 780
   000777         078700 EXT-FILE-DELETE-07.                                              IC2274.2
   000778         078800     PERFORM DE-LETE.                                             IC2274.2 274
   000779         078900     GO TO   EXT-FILE-DELETE-07-02.                               IC2274.2 795
   000780         079000 EXT-FILE-TEST-07-01.                                             IC2274.2
   000781         079100     MOVE    5 TO ACTION-CODE.                                    IC2274.2 96
   000782         079200     CALL    ID1    USING BY CONTENT   ACTION-CODE                IC2274.2 97 96
   000783         079300                             REFERENCE EXTERNAL-RECORD-WORK       IC2274.2 88
   000784         079400                          BY REFERENCE F-S-PARAM.                 IC2274.2 95
   000785         079500     IF F-S-PARAM IS EQUAL "00"                                   IC2274.2 95
   000786      1  079600         PERFORM PASS                                             IC2274.2 264
   000787         079700     ELSE                                                         IC2274.2
   000788      1  079800         MOVE   "UNEXPECTED FILE STATUS VALUE RETURNED"           IC2274.2
   000789      1  079900                   TO RE-MARK                                     IC2274.2 114
   000790      1  080000         MOVE    F-S-PARAM TO COMPUTED-A                          IC2274.2 95 120
   000791      1  080100         MOVE    "00" TO CORRECT-A                                IC2274.2 134
   000792      1  080200         PERFORM FAIL                                             IC2274.2 269
   000793         080300     END-IF.                                                      IC2274.2
   000794         080400     GO TO   EXT-FILE-TEST-07-02.                                 IC2274.2 799
   000795         080500 EXT-FILE-DELETE-07-02.                                           IC2274.2
   000796         080600     ADD     1 TO REC-CT                                          IC2274.2 156
   000797         080700     PERFORM DE-LETE.                                             IC2274.2 274
   000798         080800     GO TO   EXT-FILE-DELETE-07-03.                               IC2274.2 809
   000799         080900 EXT-FILE-TEST-07-02.                                             IC2274.2
   000800         081000     ADD     1 TO REC-CT.                                         IC2274.2 156
   000801         081100     IF EXTERNAL-FILE-FS IS EQUAL TO "<>"                         IC2274.2 94
   000802      1  081200          PERFORM PASS                                            IC2274.2 264
   000803         081300     ELSE                                                         IC2274.2
   000804      1  081400          MOVE   "MAIN PROGRAM FILE STATUS UPDATED" TO RE-MARK    IC2274.2 114
   000805      1  081500          MOVE   "<>" TO CORRECT-A                                IC2274.2 134
   000806      1  081600          MOVE    EXTERNAL-FILE-FS TO COMPUTED-A                  IC2274.2 94 120
   000807      1  081700          PERFORM FAIL.                                           IC2274.2 269
   000808         081800     GO TO   EXT-FILE-TEST-07-03.                                 IC2274.2 813
   000809         081900 EXT-FILE-DELETE-07-03.                                           IC2274.2
   000810         082000     ADD     1 TO REC-CT.                                         IC2274.2 156
   000811         082100     PERFORM DE-LETE.                                             IC2274.2 274
   000812         082200     GO TO   EXT-FILE-DELETE-07-04.                               IC2274.2 824
   000813         082300 EXT-FILE-TEST-07-03.                                             IC2274.2
   000814         082400     ADD     1 TO REC-CT.                                         IC2274.2 156
   000815         082500     IF EXTERNAL-FILE-RECORD = EXTERNAL-RECORD-HOLD               IC2274.2 70 82
   000816      1  082600          PERFORM PASS                                            IC2274.2 264
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000817         082700     ELSE                                                         IC2274.2
   000818      1  082800          MOVE "EXPECTED RECORD NOT RETURNED THROUGH RECORD AREA" IC2274.2
   000819      1  082900                    TO RE-MARK                                    IC2274.2 114
   000820      1  083000          MOVE    EXTERNAL-FILE-RECORD TO COMPUTED-A              IC2274.2 70 120
   000821      1  083100          MOVE    EXTERNAL-RECORD-HOLD TO CORRECT-A               IC2274.2 82 134
   000822      1  083200          PERFORM FAIL.                                           IC2274.2 269
   000823         083300     GO TO   EXT-FILE-TEST-07-04.                                 IC2274.2 828
   000824         083400 EXT-FILE-DELETE-07-04.                                           IC2274.2
   000825         083500     ADD     1 TO REC-CT.                                         IC2274.2 156
   000826         083600     PERFORM DE-LETE.                                             IC2274.2 274
   000827         083700     GO TO   EXT-FILE-TEST-07-END.                                IC2274.2 838
   000828         083800 EXT-FILE-TEST-07-04.                                             IC2274.2
   000829         083900     ADD     1 TO REC-CT.                                         IC2274.2 156
   000830         084000     IF EXTERNAL-RECORD-WORK IS = EXTERNAL-RECORD-HOLD            IC2274.2 88 82
   000831      1  084100          PERFORM PASS                                            IC2274.2 264
   000832         084200     ELSE                                                         IC2274.2
   000833      1  084300          MOVE   "PARAMETER RETURN INCORRECT" TO RE-MARK          IC2274.2 114
   000834      1  084400          MOVE    EXTERNAL-RECORD-HOLD TO CORRECT-A               IC2274.2 82 134
   000835      1  084500          MOVE    EXTERNAL-RECORD-WORK TO COMPUTED-A              IC2274.2 88 120
   000836      1  084600          PERFORM FAIL.                                           IC2274.2 269
   000837         084700*                                                                 IC2274.2
   000838         084800 EXT-FILE-TEST-07-END.                                            IC2274.2
   000839         084900*                                                                 IC2274.2
   000840         085000*                                                                 IC2274.2
   000841         085100 EXT-INIT-08.                                                     IC2274.2

 ==000841==> IGYPS2015-I The paragraph or section prior to paragraph or section "EXT-INIT-08" did
                         not contain any statements.

   000842         085200*                                                                 IC2274.2
   000843         085300*    *************************************************            IC2274.2
   000844         085400*    *                                               *            IC2274.2
   000845         085500*    *    ATTEMPT TO READ A THIRD RECORD FROM THE    *            IC2274.2
   000846         085600*    *    FILE THROUGH THE SUBPROGRAM.  THIS SHOULD  *            IC2274.2
   000847         085700*    *    CAUSE AN END OF FILE CONDITION.            *            IC2274.2
   000848         085800*    *                                               *            IC2274.2
   000849         085900*    *************************************************            IC2274.2
   000850         086000*                                                                 IC2274.2
   000851         086100     MOVE    1 TO REC-CT.                                         IC2274.2 156
   000852         086200     MOVE   "EXTERNAL FILE EOF"   TO FEATURE.                     IC2274.2 105
   000853         086300     MOVE   "X-23 4.5.1" TO ANSI-REFERENCE.                       IC2274.2 165
   000854         086400     MOVE   "EXT-FILE-TEST-08"    TO PAR-NAME.                    IC2274.2 109
   000855         086500     MOVE   "%%%%%%%%%%%%%%%%%%"  TO EXTERNAL-FILE-RECORD.        IC2274.2 70
   000856         086600     MOVE   ";;;;;;;;;;;;;;;;;;"  TO EXTERNAL-RECORD-WORK.        IC2274.2 88
   000857         086700     MOVE   "END-FILE  END-FILE"  TO EXTERNAL-RECORD-HOLD.        IC2274.2 82
   000858         086800     MOVE   "**"                  TO F-S-PARAM.                   IC2274.2 95
   000859         086900     MOVE   "<>"                  TO EXTERNAL-FILE-FS.            IC2274.2 94
   000860         087000     GO TO   EXT-FILE-TEST-08-01.                                 IC2274.2 864
   000861         087100 EXT-FILE-DELETE-08.                                              IC2274.2
   000862         087200     PERFORM DE-LETE.                                             IC2274.2 274
   000863         087300     GO TO   EXT-FILE-DELETE-08-02.                               IC2274.2 879
   000864         087400 EXT-FILE-TEST-08-01.                                             IC2274.2
   000865         087500     MOVE    5 TO ACTION-CODE.                                    IC2274.2 96
   000866         087600     CALL   "IC227A-1" USING CONTENT   ACTION-CODE                IC2274.2 EXT 96

 ==000866==> IGYPG0020-W Name "IC227A-1" was processed as "IC227A01".

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000867         087700                             REFERENCE EXTERNAL-RECORD-WORK       IC2274.2 88
   000868         087800                          BY REFERENCE F-S-PARAM.                 IC2274.2 95
   000869         087900     IF F-S-PARAM IS EQUAL "10"                                   IC2274.2 95
   000870      1  088000         PERFORM PASS                                             IC2274.2 264
   000871         088100     ELSE                                                         IC2274.2
   000872      1  088200         MOVE   "UNEXPECTED FILE STATUS VALUE RETURNED"           IC2274.2
   000873      1  088300                   TO RE-MARK                                     IC2274.2 114
   000874      1  088400         MOVE    F-S-PARAM TO COMPUTED-A                          IC2274.2 95 120
   000875      1  088500         MOVE    "10" TO CORRECT-A                                IC2274.2 134
   000876      1  088600         PERFORM FAIL                                             IC2274.2 269
   000877         088700     END-IF.                                                      IC2274.2
   000878         088800     GO TO   EXT-FILE-TEST-08-02.                                 IC2274.2 883
   000879         088900 EXT-FILE-DELETE-08-02.                                           IC2274.2
   000880         089000     ADD     1 TO REC-CT                                          IC2274.2 156
   000881         089100     PERFORM DE-LETE.                                             IC2274.2 274
   000882         089200     GO TO   EXT-FILE-DELETE-08-03.                               IC2274.2 893
   000883         089300 EXT-FILE-TEST-08-02.                                             IC2274.2
   000884         089400     ADD     1 TO REC-CT.                                         IC2274.2 156
   000885         089500     IF EXTERNAL-FILE-FS IS EQUAL TO "<>"                         IC2274.2 94
   000886      1  089600          PERFORM PASS                                            IC2274.2 264
   000887         089700     ELSE                                                         IC2274.2
   000888      1  089800          MOVE   "MAIN PROGRAM FILE STATUS UPDATED" TO RE-MARK    IC2274.2 114
   000889      1  089900          MOVE   "<>" TO CORRECT-A                                IC2274.2 134
   000890      1  090000          MOVE    EXTERNAL-FILE-FS TO COMPUTED-A                  IC2274.2 94 120
   000891      1  090100          PERFORM FAIL.                                           IC2274.2 269
   000892         090200*    GO TO   EXT-FILE-TEST-08-03.                                 IC2274.2
   000893         090300 EXT-FILE-DELETE-08-03.                                           IC2274.2
   000894         090400     ADD     1 TO REC-CT.                                         IC2274.2 156
   000895         090500     PERFORM DE-LETE.                                             IC2274.2 274
   000896         090600     GO TO   EXT-FILE-DELETE-08-04.                               IC2274.2 908
   000897         090700 EXT-FILE-TEST-08-03.                                             IC2274.2
   000898         090800     ADD     1 TO REC-CT.                                         IC2274.2 156
   000899         090900     IF EXTERNAL-FILE-RECORD = EXTERNAL-RECORD-HOLD               IC2274.2 70 82
   000900      1  091000          PERFORM PASS                                            IC2274.2 264
   000901         091100     ELSE                                                         IC2274.2
   000902      1  091200          MOVE "EXPECTED VALUE NOT RETURNED THROUGH RECORD AREA"  IC2274.2
   000903      1  091300                    TO RE-MARK                                    IC2274.2 114
   000904      1  091400          MOVE    EXTERNAL-FILE-RECORD TO COMPUTED-A              IC2274.2 70 120
   000905      1  091500          MOVE    EXTERNAL-RECORD-HOLD TO CORRECT-A               IC2274.2 82 134
   000906      1  091600          PERFORM FAIL.                                           IC2274.2 269
   000907         091700*    GO TO   EXT-FILE-TEST-08-04.                                 IC2274.2
   000908         091800 EXT-FILE-DELETE-08-04.                                           IC2274.2
   000909         091900     ADD     1 TO REC-CT.                                         IC2274.2 156
   000910         092000     PERFORM DE-LETE.                                             IC2274.2 274
   000911         092100     GO TO   EXT-FILE-TEST-08-END.                                IC2274.2 922
   000912         092200 EXT-FILE-TEST-08-04.                                             IC2274.2
   000913         092300     ADD     1 TO REC-CT.                                         IC2274.2 156
   000914         092400     IF EXTERNAL-RECORD-WORK IS = EXTERNAL-RECORD-HOLD            IC2274.2 88 82
   000915      1  092500          PERFORM PASS                                            IC2274.2 264
   000916         092600     ELSE                                                         IC2274.2
   000917      1  092700          MOVE   "PARAMETER RETURN INCORRECT" TO RE-MARK          IC2274.2 114
   000918      1  092800          MOVE    EXTERNAL-RECORD-HOLD TO CORRECT-A               IC2274.2 82 134
   000919      1  092900          MOVE    EXTERNAL-RECORD-WORK TO COMPUTED-A              IC2274.2 88 120
   000920      1  093000          PERFORM FAIL.                                           IC2274.2 269
   000921         093100*                                                                 IC2274.2
   000922         093200 EXT-FILE-TEST-08-END.                                            IC2274.2
   000923         093300*                                                                 IC2274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000924         093400*                                                                 IC2274.2
   000925         093500 EXT-INIT-09.                                                     IC2274.2

 ==000925==> IGYPS2015-I The paragraph or section prior to paragraph or section "EXT-INIT-09" did
                         not contain any statements.

   000926         093600*                                                                 IC2274.2
   000927         093700*    *************************************************            IC2274.2
   000928         093800*    *                                               *            IC2274.2
   000929         093900*    *    CLOSE THE EXTERNAL FILE FROM THE MAIN      *            IC2274.2
   000930         094000*    *    PROGRAM.                                   *            IC2274.2
   000931         094100*    *                                               *            IC2274.2
   000932         094200*    *************************************************            IC2274.2
   000933         094300*                                                                 IC2274.2
   000934         094400     MOVE    1 TO REC-CT.                                         IC2274.2 156
   000935         094500     MOVE   "EXTERNAL FILE CLOSE" TO FEATURE.                     IC2274.2 105
   000936         094600     MOVE   "X-23 4.5.1" TO ANSI-REFERENCE.                       IC2274.2 165
   000937         094700     MOVE   "EXT-FILE-TEST-09"    TO PAR-NAME.                    IC2274.2 109
   000938         094800     MOVE   "<>"                  TO EXTERNAL-FILE-FS.            IC2274.2 94
   000939         094900     GO TO   EXT-FILE-TEST-09-01.                                 IC2274.2 943
   000940         095000 EXT-FILE-DELETE-09.                                              IC2274.2
   000941         095100     PERFORM DE-LETE.                                             IC2274.2 274
   000942         095200     GO TO   EXT-FILE-TEST-09-END.                                IC2274.2 952
   000943         095300 EXT-FILE-TEST-09-01.                                             IC2274.2
   000944         095400     CLOSE EXTERNAL-FILE.                                         IC2274.2 67
   000945         095500     IF EXTERNAL-FILE-FS IS EQUAL TO "00"                         IC2274.2 94
   000946      1  095600          PERFORM PASS                                            IC2274.2 264
   000947         095700     ELSE                                                         IC2274.2
   000948      1  095800          MOVE   "FILE CLOSE FAILURE" TO RE-MARK                  IC2274.2 114
   000949      1  095900          MOVE   "00" TO CORRECT-A                                IC2274.2 134
   000950      1  096000          MOVE    EXTERNAL-FILE-FS TO COMPUTED-A                  IC2274.2 94 120
   000951      1  096100          PERFORM FAIL.                                           IC2274.2 269
   000952         096200 EXT-FILE-TEST-09-END.                                            IC2274.2
   000953         096300*                                                                 IC2274.2
   000954         096400*                                                                 IC2274.2
   000955         096500 CCVS-EXIT SECTION.                                               IC2274.2

 ==000955==> IGYPS2015-I The paragraph or section prior to paragraph or section "CCVS-EXIT" did
                         not contain any statements.

   000956         096600 CCVS-999999.                                                     IC2274.2
   000957         096700     GO TO CLOSE-FILES.                                           IC2274.2 254
   000958         096800 END PROGRAM IC227A.                                              IC2274.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    21
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       96   ACTION-CODE. . . . . . . . . .  M426 427 M507 508 M594 595 M647 648 M781 782 M865 866
      165   ANSI-REFERENCE . . . . . . . .  363 370 379 M404 M484 M548 M583 M635 M718 M769 M853 M936
      144   CCVS-C-1 . . . . . . . . . . .  302 349
      149   CCVS-C-2 . . . . . . . . . . .  303 350
      199   CCVS-E-1 . . . . . . . . . . .  309
      204   CCVS-E-2 . . . . . . . . . . .  320 327 334 340
      207   CCVS-E-2-2 . . . . . . . . . .  M319
      212   CCVS-E-3 . . . . . . . . . . .  341
      221   CCVS-E-4 . . . . . . . . . . .  319
      222   CCVS-E-4-1 . . . . . . . . . .  M317
      224   CCVS-E-4-2 . . . . . . . . . .  M318
      166   CCVS-H-1 . . . . . . . . . . .  297
      171   CCVS-H-2A. . . . . . . . . . .  298
      180   CCVS-H-2B. . . . . . . . . . .  299
      192   CCVS-H-3 . . . . . . . . . . .  300
      242   CCVS-PGM-ID. . . . . . . . . .  250 250
      126   CM-18V0
      120   COMPUTED-A . . . . . . . . . .  121 123 124 125 126 375 378 M435 M451 M467 M516 M532 M567 M603 M619 M656 M672
                                            M686 M701 M735 M751 M790 M806 M820 M835 M874 M890 M904 M919 M950
      121   COMPUTED-N
      119   COMPUTED-X . . . . . . . . . .  M291 361
      123   COMPUTED-0V18
      125   COMPUTED-14V4
      127   COMPUTED-18V0
      124   COMPUTED-4V14
      143   COR-ANSI-REFERENCE . . . . . .  M370 M372
      134   CORRECT-A. . . . . . . . . . .  135 136 137 138 139 376 378 M436 M452 M468 M517 M531 M566 M604 M618 M657 M671
                                            M687 M700 M736 M752 M791 M805 M821 M834 M875 M889 M905 M918 M949
      135   CORRECT-N
      133   CORRECT-X. . . . . . . . . . .  M292 362
      136   CORRECT-0V18
      138   CORRECT-14V4
      140   CORRECT-18V0
      137   CORRECT-4V14
      139   CR-18V0
      157   DELETE-COUNTER . . . . . . . .  M277 314 330 332
      112   DOTVALUE . . . . . . . . . . .  M283
      163   DUMMY-HOLD . . . . . . . . . .  M346 352
       65   DUMMY-RECORD . . . . . . . . .  M297 M298 M299 M300 M302 M303 M304 M306 M309 M320 M327 M334 M340 M341 346 M347
                                            348 M349 M350 M351 M352 356 M357 M365 M380
      210   ENDER-DESC . . . . . . . . . .  M322 M333 M339
      158   ERROR-COUNTER. . . . . . . . .  M271 312 323 326
      162   ERROR-HOLD . . . . . . . . . .  M312 M313 M314 M315 318
      208   ERROR-TOTAL. . . . . . . . . .  M324 M326 M331 M332 M336 M338
       71   EXT-DATA-1 . . . . . . . . . .  M550
       72   EXT-DATA-2 . . . . . . . . . .  M551
       73   EXT-DATA-3 . . . . . . . . . .  M552
       74   EXT-DATA-4 . . . . . . . . . .  M553
       67   EXTERNAL-FILE. . . . . . . . .  57 400 590 644 728 944
       94   EXTERNAL-FILE-FS . . . . . . .  59 M413 M492 527 532 M554 562 567 M586 614 619 M640 667 672 M722 730 735 M775
                                            801 806 M859 885 890 M938 945 950
       70   EXTERNAL-FILE-RECORD . . . . .  M406 430 435 M486 M496 497 561 681 686 M720 746 751 M771 815 820 M855 899 904
       82   EXTERNAL-RECORD-HOLD . . . . .  M412 430 436 M638 681 687 M721 746 752 M773 815 821 830 834 M857 899 905 914
                                            918
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    22
0 Defined   Cross-reference of data names   References

0      88   EXTERNAL-RECORD-WORK . . . . .  412 428 446 451 496 509 596 M637 638 649 696 701 M772 783 830 835 M856 867 914
                                            919
       95   F-S-PARAM. . . . . . . . . . .  M407 429 462 467 M487 510 511 516 M585 597 598 603 M639 650 651 656 M774 784
                                            785 790 M858 868 869 874
      105   FEATURE. . . . . . . . . . . .  M403 M483 M547 M582 M634 M717 M768 M852 M935
      236   HYPHEN-LINE. . . . . . . . . .  304 306 351
      202   ID-AGAIN . . . . . . . . . . .  M250
       97   ID1. . . . . . . . . . . . . .  648 782
      235   INF-ANSI-REFERENCE . . . . . .  M363 M366 M379 M381
      230   INFO-TEXT. . . . . . . . . . .  M364
      159   INSPECT-COUNTER. . . . . . . .  M261 313 335 338
      107   P-OR-F . . . . . . . . . . . .  M260 M265 M270 M276 286 M291
      109   PAR-NAME . . . . . . . . . . .  M293 M405 M485 M549 M584 M636 M719 M770 M854 M937
      111   PARDOT-X . . . . . . . . . . .  M282
      160   PASS-COUNTER . . . . . . . . .  M266 315 317
       63   PRINT-FILE . . . . . . . . . .  54 249 255
       64   PRINT-REC. . . . . . . . . . .  M284 M369 M371
      114   RE-MARK. . . . . . . . . . . .  M275 M294 M434 M450 M466 M515 M530 M565 M602 M617 M655 M670 M685 M699 M734 M750
                                            M789 M804 M819 M833 M873 M888 M903 M917 M948
      156   REC-CT . . . . . . . . . . . .  281 283 293 M402 M441 M445 M457 M461 M482 M522 M526 M546 M581 M609 M613 M633
                                            M662 M666 M676 M680 M691 M695 M716 M741 M745 M767 M796 M800 M810 M814 M825 M829
                                            M851 M880 M884 M894 M898 M909 M913 M934
      155   REC-SKL-SUB
      164   RECORD-COUNT . . . . . . . . .  M344 345 M353
      115   TEST-COMPUTED. . . . . . . . .  369
      130   TEST-CORRECT . . . . . . . . .  371
      183   TEST-ID. . . . . . . . . . . .  M250
      103   TEST-RESULTS . . . . . . . . .  M251 284
      161   TOTAL-ERROR
       89   WRK-DATA-1 . . . . . . . . . .  M408 M488
       90   WRK-DATA-2 . . . . . . . . . .  M409 M489
       91   WRK-DATA-3 . . . . . . . . . .  M410 M490
       92   WRK-DATA-4 . . . . . . . . . .  M411 M491
       83   WSE-DATA-1
       84   WSE-DATA-2
       85   WSE-DATA-3
       86   WSE-DATA-4
      232   XXCOMPUTED . . . . . . . . . .  M378
      234   XXCORRECT. . . . . . . . . . .  M378
      227   XXINFO . . . . . . . . . . . .  365 380
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    23
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

      374   BAIL-OUT . . . . . . . . . . .  P290
      382   BAIL-OUT-EX. . . . . . . . . .  E290 G376
      377   BAIL-OUT-WRITE . . . . . . . .  G375
      358   BLANK-LINE-PRINT
      955   CCVS-EXIT
      956   CCVS-999999
      247   CCVS1
      383   CCVS1-EXIT . . . . . . . . . .  G253
      254   CLOSE-FILES. . . . . . . . . .  G957
      301   COLUMN-NAMES-ROUTINE . . . . .  E252
      274   DE-LETE. . . . . . . . . . . .  P416 P442 P458 P495 P523 P557 P589 P610 P643 P663 P677 P692 P725 P742 P778 P797
                                            P811 P826 P862 P881 P895 P910 P941
      305   END-ROUTINE. . . . . . . . . .  P255
      311   END-ROUTINE-1
      321   END-ROUTINE-12
      329   END-ROUTINE-13 . . . . . . . .  E255
      308   END-RTN-EXIT
      494   EXT-FILE-DELETE-02
      521   EXT-FILE-DELETE-02-02. . . . .  G498
      556   EXT-FILE-DELETE-03
      588   EXT-FILE-DELETE-04-01
      608   EXT-FILE-DELETE-04-02. . . . .  G591
      642   EXT-FILE-DELETE-05
      661   EXT-FILE-DELETE-05-02. . . . .  G645
      675   EXT-FILE-DELETE-05-03. . . . .  G664
      690   EXT-FILE-DELETE-05-04. . . . .  G678
      724   EXT-FILE-DELETE-06
      740   EXT-FILE-DELETE-06-02. . . . .  G726
      777   EXT-FILE-DELETE-07
      795   EXT-FILE-DELETE-07-02. . . . .  G779
      809   EXT-FILE-DELETE-07-03. . . . .  G798
      824   EXT-FILE-DELETE-07-04. . . . .  G812
      861   EXT-FILE-DELETE-08
      879   EXT-FILE-DELETE-08-02. . . . .  G863
      893   EXT-FILE-DELETE-08-03. . . . .  G882
      908   EXT-FILE-DELETE-08-04. . . . .  G896
      940   EXT-FILE-DELETE-09
      506   EXT-FILE-TEST-02 . . . . . . .  G493
      535   EXT-FILE-TEST-02-END . . . . .  G524
      525   EXT-FILE-TEST-02-02. . . . . .  G520
      570   EXT-FILE-TEST-03-END . . . . .  G558
      560   EXT-FILE-TEST-03-01. . . . . .  G555
      622   EXT-FILE-TEST-04-END . . . . .  G611
      593   EXT-FILE-TEST-04-01. . . . . .  G587
      612   EXT-FILE-TEST-04-02. . . . . .  G607
      704   EXT-FILE-TEST-05-END . . . . .  G693
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    24
0 Defined   Cross-reference of procedures   References

0     646   EXT-FILE-TEST-05-01. . . . . .  G641
      665   EXT-FILE-TEST-05-02. . . . . .  G660
      679   EXT-FILE-TEST-05-03
      694   EXT-FILE-TEST-05-04. . . . . .  G689
      755   EXT-FILE-TEST-06-END . . . . .  G743
      727   EXT-FILE-TEST-06-01. . . . . .  G723
      744   EXT-FILE-TEST-06-02. . . . . .  G729 G739
      838   EXT-FILE-TEST-07-END . . . . .  G827
      780   EXT-FILE-TEST-07-01. . . . . .  G776
      799   EXT-FILE-TEST-07-02. . . . . .  G794
      813   EXT-FILE-TEST-07-03. . . . . .  G808
      828   EXT-FILE-TEST-07-04. . . . . .  G823
      922   EXT-FILE-TEST-08-END . . . . .  G911
      864   EXT-FILE-TEST-08-01. . . . . .  G860
      883   EXT-FILE-TEST-08-02. . . . . .  G878
      897   EXT-FILE-TEST-08-03
      912   EXT-FILE-TEST-08-04
      952   EXT-FILE-TEST-09-END . . . . .  G942
      943   EXT-FILE-TEST-09-01. . . . . .  G939
      392   EXT-INIT-01
      474   EXT-INIT-02
      538   EXT-INIT-03
      573   EXT-INIT-04
      625   EXT-INIT-05
      707   EXT-INIT-06
      758   EXT-INIT-07
      841   EXT-INIT-08
      925   EXT-INIT-09
      415   EXT-REC-DELETE-01
      440   EXT-REC-DELETE-01-02 . . . . .  G417
      456   EXT-REC-DELETE-01-03 . . . . .  G443
      425   EXT-REC-TEST-01. . . . . . . .  G414
      471   EXT-REC-TEST-01-END. . . . . .  G459
      444   EXT-REC-TEST-01-02 . . . . . .  G439
      460   EXT-REC-TEST-01-03 . . . . . .  G455
      269   FAIL . . . . . . . . . . . . .  P437 P453 P469 P518 P533 P568 P605 P620 P658 P673 P688 P702 P737 P753 P792 P807
                                            P822 P836 P876 P891 P906 P920 P951
      360   FAIL-ROUTINE . . . . . . . . .  P288
      373   FAIL-ROUTINE-EX. . . . . . . .  E288 G367
      368   FAIL-ROUTINE-WRITE . . . . . .  G361 G362
      296   HEAD-ROUTINE . . . . . . . . .  P252
      259   INSPT
      248   OPEN-FILES
      264   PASS . . . . . . . . . . . . .  P431 P447 P463 P512 P528 P563 P599 P615 P652 P668 P682 P697 P731 P747 P786 P802
                                            P816 P831 P870 P886 P900 P915 P946
      280   PRINT-DETAIL . . . . . . . . .  P262 P267 P272 P278
      391   SECT-IC227A-01
      256   TERMINATE-CCVS
      343   WRITE-LINE . . . . . . . . . .  P285 P287 P297 P298 P299 P300 P302 P303 P304 P307 P309 P320 P328 P334 P340 P341
                                            P365 P369 P371 P380
      355   WRT-LN . . . . . . . . . . . .  P349 P350 P351 P354 P359
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    25
0 Defined   Cross-reference of programs     References

        3   IC227A . . . . . . . . . . . .  958
 EXTERNAL   IC227A-1 . . . . . . . . . . .  427 508 595 866
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A    Date 06/04/2022  Time 11:57:32   Page    26
0LineID  Message code  Message text

     63  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     67  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "EXTERNAL-FILE".

    427  IGYPG0020-W   Name "IC227A-1" was processed as "IC227A01".

                       Same message on line:    508    595    866

    474  IGYPS2015-I   The paragraph or section prior to paragraph or section "EXT-INIT-02" did not contain any statements.

    538  IGYPS2015-I   The paragraph or section prior to paragraph or section "EXT-INIT-03" did not contain any statements.

    573  IGYPS2015-I   The paragraph or section prior to paragraph or section "EXT-INIT-04" did not contain any statements.

    625  IGYPS2015-I   The paragraph or section prior to paragraph or section "EXT-INIT-05" did not contain any statements.

    707  IGYPS2015-I   The paragraph or section prior to paragraph or section "EXT-INIT-06" did not contain any statements.

    758  IGYPS2015-I   The paragraph or section prior to paragraph or section "EXT-INIT-07" did not contain any statements.

    841  IGYPS2015-I   The paragraph or section prior to paragraph or section "EXT-INIT-08" did not contain any statements.

    925  IGYPS2015-I   The paragraph or section prior to paragraph or section "EXT-INIT-09" did not contain any statements.

    955  IGYPS2015-I   The paragraph or section prior to paragraph or section "CCVS-EXIT" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:      15          11              4
-* Statistics for COBOL program IC227A:
 *    Source records = 958
 *    Data Division statements = 82
 *    Procedure Division statements = 460
 *    Generated COBOL statements = 0
 *    Program complexity factor = 467
0End of compilation 1,  program IC227A,  highest severity 4.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A01  Date 06/04/2022  Time 11:57:32   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000959         096900 IDENTIFICATION DIVISION.                                         IC2274.2
   000960         097000 PROGRAM-ID.                                                      IC2274.2
   000961         097100     IC227A-1.                                                    IC2274.2

 ==000961==> IGYDS0020-W Name "IC227A-1" was processed as "IC227A01".

   000962         097300*                                                              *  IC2274.2
   000963         097400*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2274.2
   000964         097500*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2274.2
   000965         097600*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2274.2
   000966         097700*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2274.2
   000967         097800*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2274.2
   000968         097900*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2274.2
   000969         098000*                                                              *  IC2274.2
   000970         098100*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2274.2
   000971         098200*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2274.2
   000972         098300*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2274.2
   000973         098400*                                                              *  IC2274.2
   000974         098500*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2274.2
   000975         098600*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2274.2
   000976         098700*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2274.2
   000977         098800*                                                              *  IC2274.2
   000978         098900*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2274.2
   000979         099000*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2274.2
   000980         099100*                & INFORMATION TECHNOLOGY                      *  IC2274.2
   000981         099200*          TWO SKYLINE PLACE                                   *  IC2274.2
   000982         099300*          SUITE 1100                                          *  IC2274.2
   000983         099400*          5203 LEESBURG PIKE                                  *  IC2274.2
   000984         099500*          FALLS CHURCH                                        *  IC2274.2
   000985         099600*          VA 22041                                            *  IC2274.2
   000986         099700*          U.S.A.                                              *  IC2274.2
   000987         099800*                                                              *  IC2274.2
   000988         099900*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2274.2
   000989         100000*                                                              *  IC2274.2
   000990         100100*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2274.2
   000991         100200*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2274.2
   000992         100300*          21 RUE BARA                                         *  IC2274.2
   000993         100400*          F-92132 ISSY                                        *  IC2274.2
   000994         100500*          FRANCE                                              *  IC2274.2
   000995         100600*                                                              *  IC2274.2
   000996         100700*                                                              *  IC2274.2
   000997         100800*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2274.2
   000998         100900*               UND DATENVERARBEITUNG MBH)                     *  IC2274.2
   000999         101000*          SCHLOSS BIRLINGHOVEN                                *  IC2274.2
   001000         101100*          POSTFACH 12 40                                      *  IC2274.2
   001001         101200*          D-5205 ST. AUGUSTIN 1                               *  IC2274.2
   001002         101300*          GERMANY FR                                          *  IC2274.2
   001003         101400*                                                              *  IC2274.2
   001004         101500*                                                              *  IC2274.2
   001005         101600*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2274.2
   001006         101700*          OXFORD ROAD                                         *  IC2274.2
   001007         101800*          MANCHESTER                                          *  IC2274.2
   001008         101900*          M1 7ED                                              *  IC2274.2
   001009         102000*          UNITED KINGDOM                                      *  IC2274.2
   001010         102100*                                                              *  IC2274.2
   001011         102200*                                                              *  IC2274.2
   001012         102300*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2274.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A01  Date 06/04/2022  Time 11:57:32   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001013         102400*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2274.2
   001014         102500*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2274.2
   001015         102600*                                                              *  IC2274.2
   001016         102700*    REVISED 1986 AUGUST                                       *  IC2274.2
   001017         102800*                                                              *  IC2274.2
   001018         103000*                                                              *  IC2274.2
   001019         103100*    VALIDATION FOR:-                                          *  IC2274.2
   001020         103200*                                                              *  IC2274.2
   001021         103300*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2274.2
   001022         103400*                                                              *  IC2274.2
   001023         103500*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2274.2
   001024         103600*                                                              *  IC2274.2
   001025         103800*                                                              *  IC2274.2
   001026         103900*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2274.2
   001027         104000*                                                              *  IC2274.2
   001028         104100*            X-82   SOURCE-COMPUTER                            *  IC2274.2
   001029         104200*            X-83   OBJECT-COMPUTER.                           *  IC2274.2
   001030         104300*                                                              *  IC2274.2
   001031         104500*                                                              *  IC2274.2
   001032         104600*    PROGRAMS IC227A AND IC227A-1 TEST LEVEL 2 LANGUAGE        *  IC2274.2
   001033         104700*    ELEMENTS FROM THE INTER-PROGRAM COMMUNICATION MODULE.     *  IC2274.2
   001034         104800*    THE PARTICULAR ELEMENTS TESTED ARE:                       *  IC2274.2
   001035         104900*        THE "EXTERNAL" CLAUSE IN THE FILE DESCRIPTION ENTRY   *  IC2274.2
   001036         105000*                                                              *  IC2274.2
   001037         105100*    ALTHOUGH IC227A AND IC227A-1 ARE SEPARATELY COMPILED      *  IC2274.2
   001038         105200*    PROGRAMS, BOTH ARE INTENDED TO BE COMPILED BY THE SAME    *  IC2274.2
   001039         105300*    INVOCATION OF THE COMPILER, IN ORDER TO TEST STREAM       *  IC2274.2
   001040         105400*    COMPILATION AND RECOGNITION OF THE END PROGRAM HEADER.    *  IC2274.2
   001041         105500*                                                              *  IC2274.2
   001042         105600*    THE STRUCTURE OF THE SOURCE FILE IS:                      *  IC2274.2
   001043         105700*                                                              *  IC2274.2
   001044         105800*    IDENTIFICATION DIVISION.                                  *  IC2274.2
   001045         105900*    PROGRAM-ID.  IC227A.                                      *  IC2274.2
   001046         106000*              .                                               *  IC2274.2
   001047         106100*              .                                               *  IC2274.2
   001048         106200*              .                                               *  IC2274.2
   001049         106300*    END PROGRAM IC227A.                                       *  IC2274.2
   001050         106400*    IDENTIFICATION DIVISION.                                  *  IC2274.2
   001051         106500*    PROGRAM-ID.  IC227A-1.                                    *  IC2274.2
   001052         106600*              .                                               *  IC2274.2
   001053         106700*              .                                               *  IC2274.2
   001054         106800*              .                                               *  IC2274.2
   001055         106900*    END PROGRAM IC227A-1.                                     *  IC2274.2
   001056         107000*                                                              *  IC2274.2
   001057         107200*                                                                 IC2274.2
   001058         107300 ENVIRONMENT DIVISION.                                            IC2274.2
   001059         107400 CONFIGURATION SECTION.                                           IC2274.2
   001060         107500 SOURCE-COMPUTER.                                                 IC2274.2
   001061         107600     XXXXX082.                                                    IC2274.2
   001062         107700 OBJECT-COMPUTER.                                                 IC2274.2
   001063         107800     XXXXX083.                                                    IC2274.2
   001064         107900*                                                                 IC2274.2
   001065         108000 INPUT-OUTPUT SECTION.                                            IC2274.2
   001066         108100 FILE-CONTROL.                                                    IC2274.2
   001067         108200     SELECT EXTERNAL-FILE ASSIGN TO                               IC2274.2 1073
   001068         108300     XXXXX014                                                     IC2274.2
   001069         108400     FILE STATUS IS LINKAGE-FS.                                   IC2274.2 1102
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A01  Date 06/04/2022  Time 11:57:32   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001070         108500*                                                                 IC2274.2
   001071         108600 DATA DIVISION.                                                   IC2274.2
   001072         108700 FILE SECTION.                                                    IC2274.2
   001073         108800 FD  EXTERNAL-FILE                                                IC2274.2

 ==001073==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "EXTERNAL-FILE".

   001074         108900         IS EXTERNAL                                              IC2274.2
   001075         109000         RECORD CONTAINS 18 CHARACTERS.                           IC2274.2
   001076         109100 01  EXTERNAL-FILE-RECORD.                                        IC2274.2
   001077         109200     03  EXT-DATA-1              PIC X(2).                        IC2274.2
   001078         109300     03  EXT-DATA-2              PIC X(6).                        IC2274.2
   001079         109400     03  EXT-DATA-3              PIC 9(6).                        IC2274.2
   001080         109500     03  EXT-DATA-4              PIC 9(4).                        IC2274.2
   001081         109600*                                                                 IC2274.2
   001082         109700 WORKING-STORAGE SECTION.                                         IC2274.2
   001083         109800*                                                                 IC2274.2
   001084         110000*                                                             *   IC2274.2
   001085         110100*    WORKING-STORAGE DATA ITEMS SPECIFIC TO THIS TEST SUITE   *   IC2274.2
   001086         110200*                                                             *   IC2274.2
   001087         110400*                                                                 IC2274.2
   001088         110500 01  EXTERNAL-RECORD-WORK.                                        IC2274.2
   001089         110600     03  WRK-DATA-1              PIC X(2).                        IC2274.2
   001090         110700     03  WRK-DATA-2              PIC X(6).                        IC2274.2
   001091         110800     03  WRK-DATA-3              PIC 9(6).                        IC2274.2
   001092         110900     03  WRK-DATA-4              PIC 9(4).                        IC2274.2
   001093         111000*                                                                 IC2274.2
   001094         111100 LINKAGE SECTION.                                                 IC2274.2
   001095         111200*                                                                 IC2274.2
   001096         111300 01  LINKAGE-RECORD-WORK.                                         IC2274.2
   001097         111400     05  WRK-DATA-1              PIC X(2).                        IC2274.2
   001098         111500     05  WRK-DATA-2              PIC X(6).                        IC2274.2
   001099         111600     05  WRK-DATA-3              PIC 9(6).                        IC2274.2
   001100         111700     05  WRK-DATA-4              PIC 9(4).                        IC2274.2
   001101         111800*                                                                 IC2274.2
   001102         111900 01  LINKAGE-FS                  PIC XX.                          IC2274.2
   001103         112000 01  ACTION-CODE                 PIC 99.                          IC2274.2
   001104         112100*                                                                 IC2274.2
   001105         112200*                                                                 IC2274.2
   001106         112300 PROCEDURE DIVISION USING ACTION-CODE                             IC2274.2 1103
   001107         112400                          LINKAGE-RECORD-WORK                     IC2274.2 1096
   001108         112500                          LINKAGE-FS.                             IC2274.2 1102
   001109         112600*                                                                 IC2274.2
   001110         112700 SECT-IC227A-1-01 SECTION.                                        IC2274.2
   001111         112800 EXT-DECODE-01.                                                   IC2274.2
   001112         112900*                                                                 IC2274.2
   001113         113000*    *************************************************            IC2274.2
   001114         113100*    *                                               *            IC2274.2
   001115         113200*    *    USE THE ACTION CODE PARAMETER TO IDENTIFY  *            IC2274.2
   001116         113300*    *    THE FUNCTION REQUIRED ON THIS ENTRY.       *            IC2274.2
   001117         113400*    *                                               *            IC2274.2
   001118         113500*    *************************************************            IC2274.2
   001119         113600*                                                                 IC2274.2
   001120         113700     GO TO   SUBPROGRAM-FUNCTION-01                               IC2274.2 1134
   001121         113800             SUBPROGRAM-FUNCTION-02                               IC2274.2 1142
   001122         113900             SUBPROGRAM-FUNCTION-03                               IC2274.2 1151
   001123         114000             SUBPROGRAM-FUNCTION-04                               IC2274.2 1159
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A01  Date 06/04/2022  Time 11:57:32   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001124         114100             SUBPROGRAM-FUNCTION-05                               IC2274.2 1169
   001125         114200                 DEPENDING ON ACTION-CODE.                        IC2274.2 1103
   001126         114300*                                                                 IC2274.2
   001127         114400*    CONTROL SHOULD NEVER REACH HERE, BUT ...                     IC2274.2
   001128         114500*                                                                 IC2274.2
   001129         114600     MOVE   "FFFFFFFFFFFFFFFFFF" TO LINKAGE-RECORD-WORK           IC2274.2 1096
   001130         114700     MOVE   "FF"                 TO LINKAGE-FS                    IC2274.2 1102
   001131         114800     EXIT PROGRAM.                                                IC2274.2
   001132         114900*                                                                 IC2274.2
   001133         115000*                                                                 IC2274.2
   001134         115100 SUBPROGRAM-FUNCTION-01.                                          IC2274.2
   001135         115200     MOVE    EXTERNAL-FILE-RECORD TO EXTERNAL-RECORD-WORK         IC2274.2 1076 1088
   001136         115300     MOVE    LINKAGE-RECORD-WORK  TO EXTERNAL-FILE-RECORD         IC2274.2 1096 1076
   001137         115400     MOVE    EXTERNAL-RECORD-WORK TO LINKAGE-RECORD-WORK.         IC2274.2 1088 1096
   001138         115500     MOVE   "XX"                  TO LINKAGE-FS.                  IC2274.2 1102
   001139         115600     EXIT PROGRAM.                                                IC2274.2
   001140         115700*                                                                 IC2274.2
   001141         115800*                                                                 IC2274.2
   001142         115900 SUBPROGRAM-FUNCTION-02.                                          IC2274.2
   001143         116000*                                                                 IC2274.2
   001144         116100*        WRITE A RECORD TO THE EXTERNAL FILE                      IC2274.2
   001145         116200*                                                                 IC2274.2
   001146         116300     MOVE    LINKAGE-RECORD-WORK TO EXTERNAL-FILE-RECORD.         IC2274.2 1096 1076
   001147         116400     WRITE   EXTERNAL-FILE-RECORD.                                IC2274.2 1076
   001148         116500     EXIT    PROGRAM.                                             IC2274.2
   001149         116600*                                                                 IC2274.2
   001150         116700*                                                                 IC2274.2
   001151         116800 SUBPROGRAM-FUNCTION-03.                                          IC2274.2
   001152         116900*                                                                 IC2274.2
   001153         117000*        CLOSE THE EXTERNAL FILE                                  IC2274.2
   001154         117100*                                                                 IC2274.2
   001155         117200     CLOSE   EXTERNAL-FILE.                                       IC2274.2 1073
   001156         117300     EXIT    PROGRAM.                                             IC2274.2
   001157         117400*                                                                 IC2274.2
   001158         117500*                                                                 IC2274.2
   001159         117600 SUBPROGRAM-FUNCTION-04.                                          IC2274.2
   001160         117700*                                                                 IC2274.2
   001161         117800*        OPEN THE EXTERNAL FILE FOR INPUT                         IC2274.2
   001162         117900*                                                                 IC2274.2
   001163         118000     OPEN    INPUT EXTERNAL-FILE.                                 IC2274.2 1073
   001164         118100     MOVE   "OPEN   OPEN   OPEN"  TO EXTERNAL-FILE-RECORD.        IC2274.2 1076
   001165         118200     MOVE    EXTERNAL-FILE-RECORD TO LINKAGE-RECORD-WORK.         IC2274.2 1076 1096
   001166         118300     EXIT    PROGRAM.                                             IC2274.2
   001167         118400*                                                                 IC2274.2
   001168         118500*                                                                 IC2274.2
   001169         118600 SUBPROGRAM-FUNCTION-05.                                          IC2274.2
   001170         118700*                                                                 IC2274.2
   001171         118800*        READ A RECORD FROM THE EXTERNAL FILE                     IC2274.2
   001172         118900*                                                                 IC2274.2
   001173         119000     READ    EXTERNAL-FILE                                        IC2274.2 1073
   001174      1  119100                AT END GO TO SUBPROGRAM-FUNCTION-05-EOF.          IC2274.2 1178
   001175         119200     MOVE    EXTERNAL-FILE-RECORD TO LINKAGE-RECORD-WORK.         IC2274.2 1076 1096
   001176         119300     EXIT    PROGRAM.                                             IC2274.2
   001177         119400*                                                                 IC2274.2
   001178         119500 SUBPROGRAM-FUNCTION-05-EOF.                                      IC2274.2
   001179         119600     MOVE    EXTERNAL-FILE-RECORD TO LINKAGE-RECORD-WORK.         IC2274.2 1076 1096
   001180         119700     MOVE   "END-FILE  END-FILE"  TO EXTERNAL-FILE-RECORD.        IC2274.2 1076
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A01  Date 06/04/2022  Time 11:57:32   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001181         119800     EXIT    PROGRAM.                                             IC2274.2
   001182         119900*                                                                 IC2274.2
   001183         120000 END PROGRAM IC227A-1.                                            IC2274.2 961

 ==001183==> IGYSC0020-W Name "IC227A-1" was processed as "IC227A01".

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A01  Date 06/04/2022  Time 11:57:32   Page    32
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

     1103   ACTION-CODE. . . . . . . . . .  1106 1125
     1077   EXT-DATA-1
     1078   EXT-DATA-2
     1079   EXT-DATA-3
     1080   EXT-DATA-4
     1073   EXTERNAL-FILE. . . . . . . . .  1067 1155 1163 1173
     1076   EXTERNAL-FILE-RECORD . . . . .  1135 M1136 M1146 1147 M1164 1165 1175 1179 M1180
     1088   EXTERNAL-RECORD-WORK . . . . .  M1135 1137
     1102   LINKAGE-FS . . . . . . . . . .  1069 1108 M1130 M1138
     1096   LINKAGE-RECORD-WORK. . . . . .  1107 M1129 1136 M1137 1146 M1165 M1175 M1179
     1089   WRK-DATA-1
     1097   WRK-DATA-1
     1090   WRK-DATA-2
     1098   WRK-DATA-2
     1091   WRK-DATA-3
     1099   WRK-DATA-3
     1092   WRK-DATA-4
     1100   WRK-DATA-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A01  Date 06/04/2022  Time 11:57:32   Page    33
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

     1111   EXT-DECODE-01
     1110   SECT-IC227A-1-01
     1134   SUBPROGRAM-FUNCTION-01 . . . .  D1120
     1142   SUBPROGRAM-FUNCTION-02 . . . .  D1121
     1151   SUBPROGRAM-FUNCTION-03 . . . .  D1122
     1159   SUBPROGRAM-FUNCTION-04 . . . .  D1123
     1169   SUBPROGRAM-FUNCTION-05 . . . .  D1124
     1178   SUBPROGRAM-FUNCTION-05-EOF . .  G1174
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A01  Date 06/04/2022  Time 11:57:32   Page    34
0 Defined   Cross-reference of programs     References

      961   IC227A01 . . . . . . . . . . .  1183
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC227A01  Date 06/04/2022  Time 11:57:32   Page    35
0LineID  Message code  Message text

    961  IGYDS0020-W   Name "IC227A-1" was processed as "IC227A01".

                       Same message on line:   1183

   1073  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "EXTERNAL-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           1              2
-* Statistics for COBOL program IC227A01:
 *    Source records = 225
 *    Data Division statements = 17
 *    Procedure Division statements = 25
 *    Generated COBOL statements = 0
 *    Program complexity factor = 25
0End of compilation 2,  program IC227A01,  highest severity 4.
0Return code 4
