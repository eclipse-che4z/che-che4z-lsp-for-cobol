1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:57   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:57   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2344.2
   000002         000200 PROGRAM-ID.                                                      IC2344.2
   000003         000300     IC234A.                                                      IC2344.2
   000004         000500*                                                              *  IC2344.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2344.2
   000006         000700*                                                              *  IC2344.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2344.2
   000008         000900*                                                              *  IC2344.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2344.2
   000010         001100*                                                              *  IC2344.2
   000011         001300*                                                              *  IC2344.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2344.2
   000013         001500*                                                              *  IC2344.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2344.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2344.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2344.2
   000017         001900*        X-14  - TEST-FILE.                                    *  IC2344.2
   000018         002000*                                                              *  IC2344.2
   000019         002200*                                                              *  IC2344.2
   000020         002300*    PROGRAMS IC234A, IC234A-1, IC234A-2 AND IC234A-3 TEST     *  IC2344.2
   000021         002400*    TEST THAT A "USE" PROCEDURE IN A CALLING PROGRAM IS       *  IC2344.2
   000022         002500*    INVOKED BY A QUALIFYING CONDITION OCURRING IN A CONTAINED *  IC2344.2
   000023         002600*    PROGRAM NESTED TO FOUR LEVELS.                            *  IC2344.2
   000024         002700*                                                              *  IC2344.2
   000025         002800*    ALL PROGRAMS WILL BE COMPILED IN ONE INVOCATION OF THE    *  IC2344.2
   000026         002900*    COMPILER AS SHOWN BELOW:                                  *  IC2344.2
   000027         003000*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000028         003100*    PROGRAM-ID. IC234A.                                       *  IC2344.2
   000029         003200*              .                                               *  IC2344.2
   000030         003300*              .                                               *  IC2344.2
   000031         003400*              .                                               *  IC2344.2
   000032         003500*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000033         003600*    PROGRAM-ID. IC234A-1.                                     *  IC2344.2
   000034         003700*              .                                               *  IC2344.2
   000035         003800*              .                                               *  IC2344.2
   000036         003900*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000037         004000*    PROGRAM-ID. IC234A-2.                                     *  IC2344.2
   000038         004100*              .                                               *  IC2344.2
   000039         004200*              .                                               *  IC2344.2
   000040         004300*              .                                               *  IC2344.2
   000041         004400*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000042         004500*    PROGRAM-ID. IC234A-3.                                     *  IC2344.2
   000043         004600*              .                                               *  IC2344.2
   000044         004700*              .                                               *  IC2344.2
   000045         004800*    END PROGRAM IC234A-3.                                     *  IC2344.2
   000046         004900*    END PROGRAM IC234A-2.                                     *  IC2344.2
   000047         005000*    END PROGRAM IC234A-1.                                     *  IC2344.2
   000048         005100*    END PROGRAM IC234A.                                       *  IC2344.2
   000049         005300 ENVIRONMENT DIVISION.                                            IC2344.2
   000050         005400 CONFIGURATION SECTION.                                           IC2344.2
   000051         005500 SOURCE-COMPUTER.                                                 IC2344.2
   000052         005600     XXXXX082.                                                    IC2344.2
   000053         005700 OBJECT-COMPUTER.                                                 IC2344.2
   000054         005800     XXXXX083.                                                    IC2344.2
   000055         005900 INPUT-OUTPUT SECTION.                                            IC2344.2
   000056         006000 FILE-CONTROL.                                                    IC2344.2
   000057         006100     SELECT PRINT-FILE ASSIGN TO                                  IC2344.2 63
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200     XXXXX055.                                                    IC2344.2
   000059         006300     SELECT TEST-FILE  ASSIGN TO                                  IC2344.2 66
   000060         006400     XXXXX014.                                                    IC2344.2
   000061         006500 DATA DIVISION.                                                   IC2344.2
   000062         006600 FILE SECTION.                                                    IC2344.2
   000063         006700 FD  PRINT-FILE.                                                  IC2344.2

 ==000063==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000064         006800 01  PRINT-REC                   PIC X(120).                      IC2344.2
   000065         006900 01  DUMMY-RECORD                PIC X(120).                      IC2344.2
   000066         007000 FD  TEST-FILE GLOBAL.                                            IC2344.2

 ==000066==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "TEST-FILE".

   000067         007100 01  TEST-RECORD                 PIC X(20).                       IC2344.2
   000068         007200 WORKING-STORAGE SECTION.                                         IC2344.2
   000069         007300 01  DILFRAP   GLOBAL            PIC 9.                           IC2344.2
   000070         007400 01  TEST-RESULTS.                                                IC2344.2
   000071         007500     02 FILLER                   PIC X      VALUE SPACE.          IC2344.2 IMP
   000072         007600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2344.2 IMP
   000073         007700     02 FILLER                   PIC X      VALUE SPACE.          IC2344.2 IMP
   000074         007800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2344.2 IMP
   000075         007900     02 FILLER                   PIC X      VALUE SPACE.          IC2344.2 IMP
   000076         008000     02  PAR-NAME.                                                IC2344.2
   000077         008100       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2344.2 IMP
   000078         008200       03  PARDOT-X              PIC X      VALUE SPACE.          IC2344.2 IMP
   000079         008300       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2344.2 IMP
   000080         008400     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2344.2 IMP
   000081         008500     02 RE-MARK                  PIC X(61).                       IC2344.2
   000082         008600 01  TEST-COMPUTED.                                               IC2344.2
   000083         008700     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2344.2 IMP
   000084         008800     02 FILLER                   PIC X(17)  VALUE                 IC2344.2
   000085         008900            "       COMPUTED=".                                   IC2344.2
   000086         009000     02 COMPUTED-X.                                               IC2344.2
   000087         009100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2344.2 IMP
   000088         009200     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2344.2 87
   000089         009300                                 PIC -9(9).9(9).                  IC2344.2
   000090         009400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2344.2 87
   000091         009500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2344.2 87
   000092         009600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2344.2 87
   000093         009700     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2344.2 87
   000094         009800         04 COMPUTED-18V0                    PIC -9(18).          IC2344.2
   000095         009900         04 FILLER                           PIC X.               IC2344.2
   000096         010000     03 FILLER PIC X(50) VALUE SPACE.                             IC2344.2 IMP
   000097         010100 01  TEST-CORRECT.                                                IC2344.2
   000098         010200     02 FILLER PIC X(30) VALUE SPACE.                             IC2344.2 IMP
   000099         010300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2344.2
   000100         010400     02 CORRECT-X.                                                IC2344.2
   000101         010500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2344.2 IMP
   000102         010600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2344.2 101
   000103         010700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2344.2 101
   000104         010800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2344.2 101
   000105         010900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2344.2 101
   000106         011000     03      CR-18V0 REDEFINES CORRECT-A.                         IC2344.2 101
   000107         011100         04 CORRECT-18V0                     PIC -9(18).          IC2344.2
   000108         011200         04 FILLER                           PIC X.               IC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000109         011300     03 FILLER PIC X(2) VALUE SPACE.                              IC2344.2 IMP
   000110         011400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2344.2 IMP
   000111         011500 01  CCVS-C-1.                                                    IC2344.2
   000112         011600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2344.2
   000113         011700-    "SS  PARAGRAPH-NAME                                          IC2344.2
   000114         011800-    "       REMARKS".                                            IC2344.2
   000115         011900     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2344.2 IMP
   000116         012000 01  CCVS-C-2.                                                    IC2344.2
   000117         012100     02 FILLER                     PIC X        VALUE SPACE.      IC2344.2 IMP
   000118         012200     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2344.2
   000119         012300     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2344.2 IMP
   000120         012400     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2344.2
   000121         012500     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2344.2 IMP
   000122         012600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2344.2 IMP
   000123         012700 01  REC-CT                        PIC 99       VALUE ZERO.       IC2344.2 IMP
   000124         012800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2344.2 IMP
   000125         012900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2344.2 IMP
   000126         013000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2344.2 IMP
   000127         013100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2344.2 IMP
   000128         013200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2344.2 IMP
   000129         013300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2344.2 IMP
   000130         013400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2344.2 IMP
   000131         013500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2344.2 IMP
   000132         013600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2344.2 IMP
   000133         013700 01  CCVS-H-1.                                                    IC2344.2
   000134         013800     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2344.2 IMP
   000135         013900     02  FILLER                    PIC X(42)    VALUE             IC2344.2
   000136         014000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2344.2
   000137         014100     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2344.2 IMP
   000138         014200 01  CCVS-H-2A.                                                   IC2344.2
   000139         014300   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2344.2 IMP
   000140         014400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2344.2
   000141         014500   02  FILLER                        PIC XXXX   VALUE             IC2344.2
   000142         014600     "4.2 ".                                                      IC2344.2
   000143         014700   02  FILLER                        PIC X(28)  VALUE             IC2344.2
   000144         014800            " COPY - NOT FOR DISTRIBUTION".                       IC2344.2
   000145         014900   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2344.2 IMP
   000146         015000                                                                  IC2344.2
   000147         015100 01  CCVS-H-2B.                                                   IC2344.2
   000148         015200   02  FILLER                        PIC X(15)  VALUE             IC2344.2
   000149         015300            "TEST RESULT OF ".                                    IC2344.2
   000150         015400   02  TEST-ID                       PIC X(9).                    IC2344.2
   000151         015500   02  FILLER                        PIC X(4)   VALUE             IC2344.2
   000152         015600            " IN ".                                               IC2344.2
   000153         015700   02  FILLER                        PIC X(12)  VALUE             IC2344.2
   000154         015800     " HIGH       ".                                              IC2344.2
   000155         015900   02  FILLER                        PIC X(22)  VALUE             IC2344.2
   000156         016000            " LEVEL VALIDATION FOR ".                             IC2344.2
   000157         016100   02  FILLER                        PIC X(58)  VALUE             IC2344.2
   000158         016200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2344.2
   000159         016300 01  CCVS-H-3.                                                    IC2344.2
   000160         016400     02  FILLER                      PIC X(34)  VALUE             IC2344.2
   000161         016500            " FOR OFFICIAL USE ONLY    ".                         IC2344.2
   000162         016600     02  FILLER                      PIC X(58)  VALUE             IC2344.2
   000163         016700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2344.2
   000164         016800     02  FILLER                      PIC X(28)  VALUE             IC2344.2
   000165         016900            "  COPYRIGHT   1985 ".                                IC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000166         017000 01  CCVS-E-1.                                                    IC2344.2
   000167         017100     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2344.2 IMP
   000168         017200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2344.2
   000169         017300     02 ID-AGAIN                     PIC X(9).                    IC2344.2
   000170         017400     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2344.2 IMP
   000171         017500 01  CCVS-E-2.                                                    IC2344.2
   000172         017600     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2344.2 IMP
   000173         017700     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2344.2 IMP
   000174         017800     02 CCVS-E-2-2.                                               IC2344.2
   000175         017900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2344.2 IMP
   000176         018000         03 FILLER                   PIC X      VALUE SPACE.      IC2344.2 IMP
   000177         018100         03 ENDER-DESC               PIC X(44)  VALUE             IC2344.2
   000178         018200            "ERRORS ENCOUNTERED".                                 IC2344.2
   000179         018300 01  CCVS-E-3.                                                    IC2344.2
   000180         018400     02  FILLER                      PIC X(22)  VALUE             IC2344.2
   000181         018500            " FOR OFFICIAL USE ONLY".                             IC2344.2
   000182         018600     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2344.2 IMP
   000183         018700     02  FILLER                      PIC X(58)  VALUE             IC2344.2
   000184         018800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2344.2
   000185         018900     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2344.2 IMP
   000186         019000     02 FILLER                       PIC X(15)  VALUE             IC2344.2
   000187         019100             " COPYRIGHT 1985".                                   IC2344.2
   000188         019200 01  CCVS-E-4.                                                    IC2344.2
   000189         019300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2344.2 IMP
   000190         019400     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2344.2
   000191         019500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2344.2 IMP
   000192         019600     02 FILLER                       PIC X(40)  VALUE             IC2344.2
   000193         019700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2344.2
   000194         019800 01  XXINFO.                                                      IC2344.2
   000195         019900     02 FILLER                       PIC X(19)  VALUE             IC2344.2
   000196         020000            "*** INFORMATION ***".                                IC2344.2
   000197         020100     02 INFO-TEXT.                                                IC2344.2
   000198         020200       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2344.2 IMP
   000199         020300       04 XXCOMPUTED                 PIC X(20).                   IC2344.2
   000200         020400       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2344.2 IMP
   000201         020500       04 XXCORRECT                  PIC X(20).                   IC2344.2
   000202         020600     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2344.2
   000203         020700 01  HYPHEN-LINE.                                                 IC2344.2
   000204         020800     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2344.2 IMP
   000205         020900     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2344.2
   000206         021000-    "*****************************************".                 IC2344.2
   000207         021100     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2344.2
   000208         021200-    "******************************".                            IC2344.2
   000209         021300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2344.2
   000210         021400     "IC234A".                                                    IC2344.2
   000211         021500 PROCEDURE DIVISION.                                              IC2344.2
   000212         021600 DECLARATIVES.                                                    IC2344.2
   000213         021700 SECT-IC234A-001 SECTION.                                         IC2344.2
   000214         021800     USE GLOBAL AFTER ERROR PROCEDURE ON INPUT.                   IC2344.2
   000215         021900 USE-TEST-2.                                                      IC2344.2
   000216         022000     ADD 1 TO DILFRAP.                                            IC2344.2 69
   000217         022100 END DECLARATIVES.                                                IC2344.2
   000218         022200 CCVS1 SECTION.                                                   IC2344.2
   000219         022300 OPEN-FILES.                                                      IC2344.2
   000220         022400     OPEN     OUTPUT PRINT-FILE.                                  IC2344.2 63
   000221         022500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2344.2 209 150 209 169
   000222         022600     MOVE    SPACE TO TEST-RESULTS.                               IC2344.2 IMP 70
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000223         022700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2344.2 248 253
   000224         022800     GO TO CCVS1-EXIT.                                            IC2344.2 330
   000225         022900 CLOSE-FILES.                                                     IC2344.2
   000226         023000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2344.2 257 278 63
   000227         023100 TERMINATE-CCVS.                                                  IC2344.2
   000228         023200     EXIT PROGRAM.                                                IC2344.2
   000229         023300 TERMINATE-CALL.                                                  IC2344.2
   000230         023400     STOP     RUN.                                                IC2344.2
   000231         023500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2344.2 74 126
   000232         023600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2344.2 74 127
   000233         023700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2344.2 74 125
   000234         023800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2344.2 74 124
   000235         023900     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2344.2 81
   000236         024000 PRINT-DETAIL.                                                    IC2344.2
   000237         024100     IF REC-CT NOT EQUAL TO ZERO                                  IC2344.2 123 IMP
   000238      1  024200             MOVE "." TO PARDOT-X                                 IC2344.2 78
   000239      1  024300             MOVE REC-CT TO DOTVALUE.                             IC2344.2 123 79
   000240         024400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2344.2 70 64 290
   000241         024500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2344.2 74 290
   000242      1  024600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2344.2 307 320
   000243      1  024700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2344.2 321 329
   000244         024800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2344.2 IMP 74 IMP 86
   000245         024900     MOVE SPACE TO CORRECT-X.                                     IC2344.2 IMP 100
   000246         025000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2344.2 123 IMP IMP 76
   000247         025100     MOVE     SPACE TO RE-MARK.                                   IC2344.2 IMP 81
   000248         025200 HEAD-ROUTINE.                                                    IC2344.2
   000249         025300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2344.2 133 65 290
   000250         025400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2344.2 138 65 290
   000251         025500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2344.2 147 65 290
   000252         025600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2344.2 159 65 290
   000253         025700 COLUMN-NAMES-ROUTINE.                                            IC2344.2
   000254         025800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2344.2 111 65 290
   000255         025900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2344.2 116 65 290
   000256         026000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2344.2 203 65 290
   000257         026100 END-ROUTINE.                                                     IC2344.2
   000258         026200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2344.2 203 65 290
   000259         026300 END-RTN-EXIT.                                                    IC2344.2
   000260         026400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2344.2 166 65 290
   000261         026500 END-ROUTINE-1.                                                   IC2344.2
   000262         026600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2344.2 125 129 126
   000263         026700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2344.2 129 124 129
   000264         026800      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2344.2 127 129
   000265         026900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2344.2
   000266         027000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2344.2 127 189
   000267         027100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2344.2 129 191
   000268         027200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2344.2 188 174
   000269         027300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2344.2 171 65 290
   000270         027400  END-ROUTINE-12.                                                 IC2344.2
   000271         027500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2344.2 177
   000272         027600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2344.2 125 IMP
   000273      1  027700         MOVE "NO " TO ERROR-TOTAL                                IC2344.2 175
   000274         027800         ELSE                                                     IC2344.2
   000275      1  027900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2344.2 125 175
   000276         028000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2344.2 171 65
   000277         028100     PERFORM WRITE-LINE.                                          IC2344.2 290
   000278         028200 END-ROUTINE-13.                                                  IC2344.2
   000279         028300     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2344.2 124 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000280      1  028400         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2344.2 175
   000281      1  028500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2344.2 124 175
   000282         028600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2344.2 177
   000283         028700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2344.2 171 65 290
   000284         028800      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2344.2 126 IMP
   000285      1  028900          MOVE "NO " TO ERROR-TOTAL                               IC2344.2 175
   000286      1  029000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2344.2 126 175
   000287         029100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2344.2 177
   000288         029200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2344.2 171 65 290
   000289         029300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2344.2 179 65 290
   000290         029400 WRITE-LINE.                                                      IC2344.2
   000291         029500     ADD 1 TO RECORD-COUNT.                                       IC2344.2 131
   000292         029600     IF RECORD-COUNT GREATER 50                                   IC2344.2 131
   000293      1  029700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2344.2 65 130
   000294      1  029800         MOVE SPACE TO DUMMY-RECORD                               IC2344.2 IMP 65
   000295      1  029900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2344.2 65
   000296      1  030000         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2344.2 111 65 302
   000297      1  030100         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2344.2 116 65 302
   000298      1  030200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2344.2 203 65 302
   000299      1  030300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2344.2 130 65
   000300      1  030400         MOVE ZERO TO RECORD-COUNT.                               IC2344.2 IMP 131
   000301         030500     PERFORM WRT-LN.                                              IC2344.2 302
   000302         030600 WRT-LN.                                                          IC2344.2
   000303         030700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2344.2 65
   000304         030800     MOVE SPACE TO DUMMY-RECORD.                                  IC2344.2 IMP 65
   000305         030900 BLANK-LINE-PRINT.                                                IC2344.2
   000306         031000     PERFORM WRT-LN.                                              IC2344.2 302
   000307         031100 FAIL-ROUTINE.                                                    IC2344.2
   000308         031200     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2344.2 86 IMP 315
   000309         031300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2344.2 100 IMP 315
   000310         031400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2344.2 132 202
   000311         031500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2344.2 197
   000312         031600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2344.2 194 65 290
   000313         031700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2344.2 IMP 202
   000314         031800     GO TO  FAIL-ROUTINE-EX.                                      IC2344.2 320
   000315         031900 FAIL-ROUTINE-WRITE.                                              IC2344.2
   000316         032000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2344.2 82 64 290
   000317         032100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2344.2 132 110
   000318         032200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2344.2 97 64 290
   000319         032300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2344.2 IMP 110
   000320         032400 FAIL-ROUTINE-EX. EXIT.                                           IC2344.2
   000321         032500 BAIL-OUT.                                                        IC2344.2
   000322         032600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2344.2 87 IMP 324
   000323         032700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2344.2 101 IMP 329
   000324         032800 BAIL-OUT-WRITE.                                                  IC2344.2
   000325         032900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2344.2 101 201 87 199
   000326         033000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2344.2 132 202
   000327         033100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2344.2 194 65 290
   000328         033200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2344.2 IMP 202
   000329         033300 BAIL-OUT-EX. EXIT.                                               IC2344.2
   000330         033400 CCVS1-EXIT.                                                      IC2344.2
   000331         033500     EXIT.                                                        IC2344.2
   000332         033600 SECT-IC234A-1R-001 SECTION.                                      IC2344.2
   000333         033700 USE-INIT-1.                                                      IC2344.2
   000334         033800     OPEN    OUTPUT TEST-FILE.                                    IC2344.2 66
   000335         033900     CLOSE   TEST-FILE.                                           IC2344.2 66
   000336         034000     MOVE    1 TO REC-CT.                                         IC2344.2 123
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000337         034100     MOVE "USE GLOBAL INPUT" TO FEATURE.                          IC2344.2 72
   000338         034200     MOVE   "USE-TEST-1" TO PAR-NAME.                             IC2344.2 76
   000339         034300     MOVE   "X-34 5.5.4 GR(1)C" TO ANSI-REFERENCE.                IC2344.2 132
   000340         034400     MOVE    ZERO TO DILFRAP.                                     IC2344.2 IMP 69
   000341         034500 USE-TEST-0.                                                      IC2344.2
   000342         034600     CALL   "IC234A-1".                                           IC2344.2 365
   000343         034700     IF      DILFRAP = 1                                          IC2344.2 69
   000344      1  034800             PERFORM PASS                                         IC2344.2 232
   000345      1  034900             GO TO   USE-WRITE-1.                                 IC2344.2 356
   000346         035000 USE-FAIL-1.                                                      IC2344.2
   000347         035100     MOVE    1 TO CORRECT-N.                                      IC2344.2 102
   000348         035200     MOVE    DILFRAP TO COMPUTED-N.                               IC2344.2 69 88
   000349         035300     IF DILFRAP = 0                                               IC2344.2 69
   000350      1  035400             MOVE   "USE PROCEDURE NOT INVOKED" TO RE-MARK        IC2344.2 81
   000351      1  035500     ELSE MOVE "WRONG 'USE' PROCEDURE INVOKED" TO RE-MARK.        IC2344.2 81
   000352         035600     PERFORM FAIL.                                                IC2344.2 233
   000353         035700     GO TO   USE-WRITE-1.                                         IC2344.2 356
   000354         035800 USE-DELETE-1.                                                    IC2344.2
   000355         035900     PERFORM DE-LETE.                                             IC2344.2 234
   000356         036000 USE-WRITE-1.                                                     IC2344.2
   000357         036100     PERFORM PRINT-DETAIL.                                        IC2344.2 236
   000358         036200*                                                                 IC2344.2
   000359         036300 CCVS-EXIT SECTION.                                               IC2344.2
   000360         036400 CCVS-999999.                                                     IC2344.2
   000361         036500     GO TO CLOSE-FILES.                                           IC2344.2 225
   000362         036600*                                                                 IC2344.2
   000363   1     036700 IDENTIFICATION DIVISION.                                         IC2344.2
   000364   1     036800 PROGRAM-ID.                                                      IC2344.2
   000365   1     036900     IC234A-1.                                                    IC2344.2
   000366   1     037100*                                                              *  IC2344.2
   000367   1     037200*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2344.2
   000368   1     037300*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2344.2
   000369   1     037400*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2344.2
   000370   1     037500*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2344.2
   000371   1     037600*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2344.2
   000372   1     037700*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2344.2
   000373   1     037800*                                                              *  IC2344.2
   000374   1     037900*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2344.2
   000375   1     038000*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2344.2
   000376   1     038100*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2344.2
   000377   1     038200*                                                              *  IC2344.2
   000378   1     038300*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2344.2
   000379   1     038400*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2344.2
   000380   1     038500*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2344.2
   000381   1     038600*                                                              *  IC2344.2
   000382   1     038700*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2344.2
   000383   1     038800*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2344.2
   000384   1     038900*                & INFORMATION TECHNOLOGY                      *  IC2344.2
   000385   1     039000*          TWO SKYLINE PLACE                                   *  IC2344.2
   000386   1     039100*          SUITE 1100                                          *  IC2344.2
   000387   1     039200*          5203 LEESBURG PIKE                                  *  IC2344.2
   000388   1     039300*          FALLS CHURCH                                        *  IC2344.2
   000389   1     039400*          VA 22041                                            *  IC2344.2
   000390   1     039500*          U.S.A.                                              *  IC2344.2
   000391   1     039600*                                                              *  IC2344.2
   000392   1     039700*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2344.2
   000393   1     039800*                                                              *  IC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000394   1     039900*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2344.2
   000395   1     040000*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2344.2
   000396   1     040100*          21 RUE BARA                                         *  IC2344.2
   000397   1     040200*          F-92132 ISSY                                        *  IC2344.2
   000398   1     040300*          FRANCE                                              *  IC2344.2
   000399   1     040400*                                                              *  IC2344.2
   000400   1     040500*                                                              *  IC2344.2
   000401   1     040600*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2344.2
   000402   1     040700*               UND DATENVERARBEITUNG MBH)                     *  IC2344.2
   000403   1     040800*          SCHLOSS BIRLINGHOVEN                                *  IC2344.2
   000404   1     040900*          POSTFACH 12 40                                      *  IC2344.2
   000405   1     041000*          D-5205 ST. AUGUSTIN 1                               *  IC2344.2
   000406   1     041100*          GERMANY FR                                          *  IC2344.2
   000407   1     041200*                                                              *  IC2344.2
   000408   1     041300*                                                              *  IC2344.2
   000409   1     041400*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2344.2
   000410   1     041500*          OXFORD ROAD                                         *  IC2344.2
   000411   1     041600*          MANCHESTER                                          *  IC2344.2
   000412   1     041700*          M1 7ED                                              *  IC2344.2
   000413   1     041800*          UNITED KINGDOM                                      *  IC2344.2
   000414   1     041900*                                                              *  IC2344.2
   000415   1     042000*                                                              *  IC2344.2
   000416   1     042100*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2344.2
   000417   1     042200*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2344.2
   000418   1     042300*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2344.2
   000419   1     042400*                                                              *  IC2344.2
   000420   1     042600*                                                              *  IC2344.2
   000421   1     042700*    VALIDATION FOR:-                                          *  IC2344.2
   000422   1     042800*                                                              *  IC2344.2
   000423   1     042900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2344.2
   000424   1     043000*                                                              *  IC2344.2
   000425   1     043100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2344.2
   000426   1     043200*                                                              *  IC2344.2
   000427   1     043400*                                                              *  IC2344.2
   000428   1     043500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2344.2
   000429   1     043600*                                                              *  IC2344.2
   000430   1     043700*        X-55  - SYSTEM PRINTER NAME.                          *  IC2344.2
   000431   1     043800*        X-82  - SOURCE COMPUTER NAME.                         *  IC2344.2
   000432   1     043900*        X-83  - OBJECT COMPUTER NAME.                         *  IC2344.2
   000433   1     044000*                                                              *  IC2344.2
   000434   1     044200*                                                              *  IC2344.2
   000435   1     044300*    PROGRAMS IC234A, IC234A-1, IC234A-2 AND IC234A-3 TEST     *  IC2344.2
   000436   1     044400*    TEST THAT A "USE" PROCEDURE IN A CALLING PROGRAM IS       *  IC2344.2
   000437   1     044500*    INVOKED BY A QUALIFYING CONDITION OCURRING IN A CONTAINED *  IC2344.2
   000438   1     044600*    PROGRAM NESTED TO FOUR LEVELS.                            *  IC2344.2
   000439   1     044700*                                                              *  IC2344.2
   000440   1     044800*    ALL PROGRAMS WILL BE COMPILED IN ONE INVOCATION OF THE    *  IC2344.2
   000441   1     044900*    COMPILER AS SHOWN BELOW:                                  *  IC2344.2
   000442   1     045000*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000443   1     045100*    PROGRAM-ID. IC234A.                                       *  IC2344.2
   000444   1     045200*              .                                               *  IC2344.2
   000445   1     045300*              .                                               *  IC2344.2
   000446   1     045400*              .                                               *  IC2344.2
   000447   1     045500*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000448   1     045600*    PROGRAM-ID. IC234A-1.                                     *  IC2344.2
   000449   1     045700*              .                                               *  IC2344.2
   000450   1     045800*              .                                               *  IC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000451   1     045900*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000452   1     046000*    PROGRAM-ID. IC234A-2.                                     *  IC2344.2
   000453   1     046100*              .                                               *  IC2344.2
   000454   1     046200*              .                                               *  IC2344.2
   000455   1     046300*              .                                               *  IC2344.2
   000456   1     046400*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000457   1     046500*    PROGRAM-ID. IC234A-3.                                     *  IC2344.2
   000458   1     046600*              .                                               *  IC2344.2
   000459   1     046700*              .                                               *  IC2344.2
   000460   1     046800*    END PROGRAM IC234A-3.                                     *  IC2344.2
   000461   1     046900*    END PROGRAM IC234A-2.                                     *  IC2344.2
   000462   1     047000*    END PROGRAM IC234A-1.                                     *  IC2344.2
   000463   1     047100*    END PROGRAM IC234A.                                       *  IC2344.2
   000464   1     047300*ENVIRONMENT DIVISION.                                            IC2344.2
   000465   1     047400*INPUT-OUTPUT SECTION.                                            IC2344.2
   000466   1     047500*FILE-CONTROL.                                                    IC2344.2
   000467   1     047600 DATA DIVISION.                                                   IC2344.2
   000468   1     047700 FILE SECTION.                                                    IC2344.2
   000469   1     047800 WORKING-STORAGE SECTION.                                         IC2344.2
   000470   1     047900 PROCEDURE DIVISION.                                              IC2344.2
   000471   1     048000 DECLARATIVES.                                                    IC2344.2
   000472   1     048100 NON-GLOBAL-SECTION SECTION.                                      IC2344.2
   000473   1     048200     USE AFTER STANDARD EXCEPTION PROCEDURE ON TEST-FILE.         IC2344.2 66
   000474   1     048300 USE-PARA.                                                        IC2344.2
   000475   1     048400     ADD 2 TO DILFRAP.                                            IC2344.2 69
   000476   1     048500 END DECLARATIVES.                                                IC2344.2
   000477   1     048600 SECT-IC234A-1-001 SECTION.                                       IC2344.2
   000478   1     048700 USE-INIT-1.                                                      IC2344.2
   000479   1     048800     CALL   "IC234A-2".                                           IC2344.2 484
   000480   1     048900     EXIT PROGRAM.                                                IC2344.2
   000481   1     049000*                                                                 IC2344.2
   000482   2     049100 IDENTIFICATION DIVISION.                                         IC2344.2
   000483   2     049200 PROGRAM-ID.                                                      IC2344.2
   000484   2     049300     IC234A-2.                                                    IC2344.2
   000485   2     049500*                                                              *  IC2344.2
   000486   2     049600*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2344.2
   000487   2     049700*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2344.2
   000488   2     049800*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2344.2
   000489   2     049900*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2344.2
   000490   2     050000*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2344.2
   000491   2     050100*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2344.2
   000492   2     050200*                                                              *  IC2344.2
   000493   2     050300*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2344.2
   000494   2     050400*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2344.2
   000495   2     050500*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2344.2
   000496   2     050600*                                                              *  IC2344.2
   000497   2     050700*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2344.2
   000498   2     050800*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2344.2
   000499   2     050900*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2344.2
   000500   2     051000*                                                              *  IC2344.2
   000501   2     051100*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2344.2
   000502   2     051200*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2344.2
   000503   2     051300*                & INFORMATION TECHNOLOGY                      *  IC2344.2
   000504   2     051400*          TWO SKYLINE PLACE                                   *  IC2344.2
   000505   2     051500*          SUITE 1100                                          *  IC2344.2
   000506   2     051600*          5203 LEESBURG PIKE                                  *  IC2344.2
   000507   2     051700*          FALLS CHURCH                                        *  IC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000508   2     051800*          VA 22041                                            *  IC2344.2
   000509   2     051900*          U.S.A.                                              *  IC2344.2
   000510   2     052000*                                                              *  IC2344.2
   000511   2     052100*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2344.2
   000512   2     052200*                                                              *  IC2344.2
   000513   2     052300*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2344.2
   000514   2     052400*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2344.2
   000515   2     052500*          21 RUE BARA                                         *  IC2344.2
   000516   2     052600*          F-92132 ISSY                                        *  IC2344.2
   000517   2     052700*          FRANCE                                              *  IC2344.2
   000518   2     052800*                                                              *  IC2344.2
   000519   2     052900*                                                              *  IC2344.2
   000520   2     053000*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2344.2
   000521   2     053100*               UND DATENVERARBEITUNG MBH)                     *  IC2344.2
   000522   2     053200*          SCHLOSS BIRLINGHOVEN                                *  IC2344.2
   000523   2     053300*          POSTFACH 12 40                                      *  IC2344.2
   000524   2     053400*          D-5205 ST. AUGUSTIN 1                               *  IC2344.2
   000525   2     053500*          GERMANY FR                                          *  IC2344.2
   000526   2     053600*                                                              *  IC2344.2
   000527   2     053700*                                                              *  IC2344.2
   000528   2     053800*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2344.2
   000529   2     053900*          OXFORD ROAD                                         *  IC2344.2
   000530   2     054000*          MANCHESTER                                          *  IC2344.2
   000531   2     054100*          M1 7ED                                              *  IC2344.2
   000532   2     054200*          UNITED KINGDOM                                      *  IC2344.2
   000533   2     054300*                                                              *  IC2344.2
   000534   2     054400*                                                              *  IC2344.2
   000535   2     054500*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2344.2
   000536   2     054600*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2344.2
   000537   2     054700*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2344.2
   000538   2     054800*                                                              *  IC2344.2
   000539   2     055000*                                                              *  IC2344.2
   000540   2     055100*    VALIDATION FOR:-                                          *  IC2344.2
   000541   2     055200*                                                              *  IC2344.2
   000542   2     055300*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2344.2
   000543   2     055400*                                                              *  IC2344.2
   000544   2     055500*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2344.2
   000545   2     055600*                                                              *  IC2344.2
   000546   2     055800*                                                              *  IC2344.2
   000547   2     055900*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2344.2
   000548   2     056000*                                                              *  IC2344.2
   000549   2     056100*        X-55  - SYSTEM PRINTER NAME.                          *  IC2344.2
   000550   2     056200*        X-82  - SOURCE COMPUTER NAME.                         *  IC2344.2
   000551   2     056300*        X-83  - OBJECT COMPUTER NAME.                         *  IC2344.2
   000552   2     056400*                                                              *  IC2344.2
   000553   2     056600*                                                              *  IC2344.2
   000554   2     056700*    PROGRAMS IC234A, IC234A-1, IC234A-2 AND IC234A-3 TEST     *  IC2344.2
   000555   2     056800*    TEST THAT A "USE" PROCEDURE IN A CALLING PROGRAM IS       *  IC2344.2
   000556   2     056900*    INVOKED BY A QUALIFYING CONDITION OCURRING IN A CONTAINED *  IC2344.2
   000557   2     057000*    PROGRAM NESTED TO FOUR LEVELS.                            *  IC2344.2
   000558   2     057100*                                                              *  IC2344.2
   000559   2     057200*    ALL PROGRAMS WILL BE COMPILED IN ONE INVOCATION OF THE    *  IC2344.2
   000560   2     057300*    COMPILER AS SHOWN BELOW:                                  *  IC2344.2
   000561   2     057400*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000562   2     057500*    PROGRAM-ID. IC234A.                                       *  IC2344.2
   000563   2     057600*              .                                               *  IC2344.2
   000564   2     057700*              .                                               *  IC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000565   2     057800*              .                                               *  IC2344.2
   000566   2     057900*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000567   2     058000*    PROGRAM-ID. IC234A-1.                                     *  IC2344.2
   000568   2     058100*              .                                               *  IC2344.2
   000569   2     058200*              .                                               *  IC2344.2
   000570   2     058300*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000571   2     058400*    PROGRAM-ID. IC234A-2.                                     *  IC2344.2
   000572   2     058500*              .                                               *  IC2344.2
   000573   2     058600*              .                                               *  IC2344.2
   000574   2     058700*              .                                               *  IC2344.2
   000575   2     058800*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000576   2     058900*    PROGRAM-ID. IC234A-3.                                     *  IC2344.2
   000577   2     059000*              .                                               *  IC2344.2
   000578   2     059100*              .                                               *  IC2344.2
   000579   2     059200*    END PROGRAM IC234A-3.                                     *  IC2344.2
   000580   2     059300*    END PROGRAM IC234A-2.                                     *  IC2344.2
   000581   2     059400*    END PROGRAM IC234A-1.                                     *  IC2344.2
   000582   2     059500*    END PROGRAM IC234A.                                       *  IC2344.2
   000583   2     059700*ENVIRONMENT DIVISION.                                            IC2344.2
   000584   2     059800*INPUT-OUTPUT SECTION.                                            IC2344.2
   000585   2     059900*FILE-CONTROL.                                                    IC2344.2
   000586   2     060000 DATA DIVISION.                                                   IC2344.2
   000587   2     060100 FILE SECTION.                                                    IC2344.2
   000588   2     060200 WORKING-STORAGE SECTION.                                         IC2344.2
   000589   2     060300 PROCEDURE DIVISION.                                              IC2344.2
   000590   2     060400 DECLARATIVES.                                                    IC2344.2
   000591   2     060500 USE-TEST SECTION.                                                IC2344.2
   000592   2     060600     USE GLOBAL AFTER ERROR PROCEDURE ON OUTPUT.                  IC2344.2
   000593   2     060700 USE-TEST-1.                                                      IC2344.2
   000594   2     060800     ADD  4 TO DILFRAP.                                           IC2344.2 69
   000595   2     060900 END DECLARATIVES.                                                IC2344.2
   000596   2     061000 SECT-IC234A-2-001 SECTION.                                       IC2344.2
   000597   2     061100 USE-INIT-1.                                                      IC2344.2
   000598   2     061200     CALL   "IC234A-3".                                           IC2344.2 603
   000599   2     061300     EXIT PROGRAM.                                                IC2344.2
   000600   2     061400*                                                                 IC2344.2
   000601   3     061500 IDENTIFICATION DIVISION.                                         IC2344.2
   000602   3     061600 PROGRAM-ID.                                                      IC2344.2
   000603   3     061700     IC234A-3.                                                    IC2344.2
   000604   3     061900*                                                              *  IC2344.2
   000605   3     062000*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2344.2
   000606   3     062100*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2344.2
   000607   3     062200*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2344.2
   000608   3     062300*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2344.2
   000609   3     062400*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2344.2
   000610   3     062500*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2344.2
   000611   3     062600*                                                              *  IC2344.2
   000612   3     062700*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2344.2
   000613   3     062800*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2344.2
   000614   3     062900*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2344.2
   000615   3     063000*                                                              *  IC2344.2
   000616   3     063100*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2344.2
   000617   3     063200*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2344.2
   000618   3     063300*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2344.2
   000619   3     063400*                                                              *  IC2344.2
   000620   3     063500*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2344.2
   000621   3     063600*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000622   3     063700*                & INFORMATION TECHNOLOGY                      *  IC2344.2
   000623   3     063800*          TWO SKYLINE PLACE                                   *  IC2344.2
   000624   3     063900*          SUITE 1100                                          *  IC2344.2
   000625   3     064000*          5203 LEESBURG PIKE                                  *  IC2344.2
   000626   3     064100*          FALLS CHURCH                                        *  IC2344.2
   000627   3     064200*          VA 22041                                            *  IC2344.2
   000628   3     064300*          U.S.A.                                              *  IC2344.2
   000629   3     064400*                                                              *  IC2344.2
   000630   3     064500*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2344.2
   000631   3     064600*                                                              *  IC2344.2
   000632   3     064700*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2344.2
   000633   3     064800*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2344.2
   000634   3     064900*          21 RUE BARA                                         *  IC2344.2
   000635   3     065000*          F-92132 ISSY                                        *  IC2344.2
   000636   3     065100*          FRANCE                                              *  IC2344.2
   000637   3     065200*                                                              *  IC2344.2
   000638   3     065300*                                                              *  IC2344.2
   000639   3     065400*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2344.2
   000640   3     065500*               UND DATENVERARBEITUNG MBH)                     *  IC2344.2
   000641   3     065600*          SCHLOSS BIRLINGHOVEN                                *  IC2344.2
   000642   3     065700*          POSTFACH 12 40                                      *  IC2344.2
   000643   3     065800*          D-5205 ST. AUGUSTIN 1                               *  IC2344.2
   000644   3     065900*          GERMANY FR                                          *  IC2344.2
   000645   3     066000*                                                              *  IC2344.2
   000646   3     066100*                                                              *  IC2344.2
   000647   3     066200*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2344.2
   000648   3     066300*          OXFORD ROAD                                         *  IC2344.2
   000649   3     066400*          MANCHESTER                                          *  IC2344.2
   000650   3     066500*          M1 7ED                                              *  IC2344.2
   000651   3     066600*          UNITED KINGDOM                                      *  IC2344.2
   000652   3     066700*                                                              *  IC2344.2
   000653   3     066800*                                                              *  IC2344.2
   000654   3     066900*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2344.2
   000655   3     067000*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2344.2
   000656   3     067100*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2344.2
   000657   3     067200*                                                              *  IC2344.2
   000658   3     067400*                                                              *  IC2344.2
   000659   3     067500*    VALIDATION FOR:-                                          *  IC2344.2
   000660   3     067600*                                                              *  IC2344.2
   000661   3     067700*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2344.2
   000662   3     067800*                                                              *  IC2344.2
   000663   3     067900*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2344.2
   000664   3     068000*                                                              *  IC2344.2
   000665   3     068200*                                                              *  IC2344.2
   000666   3     068300*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2344.2
   000667   3     068400*                                                              *  IC2344.2
   000668   3     068500*        X-55  - SYSTEM PRINTER NAME.                          *  IC2344.2
   000669   3     068600*        X-82  - SOURCE COMPUTER NAME.                         *  IC2344.2
   000670   3     068700*        X-83  - OBJECT COMPUTER NAME.                         *  IC2344.2
   000671   3     068800*                                                              *  IC2344.2
   000672   3     069000*                                                              *  IC2344.2
   000673   3     069100*    PROGRAMS IC234A, IC234A-1, IC234A-2 AND IC234A-3 TEST     *  IC2344.2
   000674   3     069200*    TEST THAT A "USE" PROCEDURE IN A CALLING PROGRAM IS       *  IC2344.2
   000675   3     069300*    INVOKED BY A QUALIFYING CONDITION OCURRING IN A CONTAINED *  IC2344.2
   000676   3     069400*    PROGRAM NESTED TO FOUR LEVELS.                            *  IC2344.2
   000677   3     069500*                                                              *  IC2344.2
   000678   3     069600*    ALL PROGRAMS WILL BE COMPILED IN ONE INVOCATION OF THE    *  IC2344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000679   3     069700*    COMPILER AS SHOWN BELOW:                                  *  IC2344.2
   000680   3     069800*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000681   3     069900*    PROGRAM-ID. IC234A.                                       *  IC2344.2
   000682   3     070000*              .                                               *  IC2344.2
   000683   3     070100*              .                                               *  IC2344.2
   000684   3     070200*              .                                               *  IC2344.2
   000685   3     070300*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000686   3     070400*    PROGRAM-ID. IC234A-1.                                     *  IC2344.2
   000687   3     070500*              .                                               *  IC2344.2
   000688   3     070600*              .                                               *  IC2344.2
   000689   3     070700*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000690   3     070800*    PROGRAM-ID. IC234A-2.                                     *  IC2344.2
   000691   3     070900*              .                                               *  IC2344.2
   000692   3     071000*              .                                               *  IC2344.2
   000693   3     071100*              .                                               *  IC2344.2
   000694   3     071200*    IDENTIFICATION DIVISION.                                  *  IC2344.2
   000695   3     071300*    PROGRAM-ID. IC234A-3.                                     *  IC2344.2
   000696   3     071400*              .                                               *  IC2344.2
   000697   3     071500*              .                                               *  IC2344.2
   000698   3     071600*    END PROGRAM IC234A-3.                                     *  IC2344.2
   000699   3     071700*    END PROGRAM IC234A-2.                                     *  IC2344.2
   000700   3     071800*    END PROGRAM IC234A-1.                                     *  IC2344.2
   000701   3     071900*    END PROGRAM IC234A.                                       *  IC2344.2
   000702   3     072100*ENVIRONMENT DIVISION.                                            IC2344.2
   000703   3     072200*INPUT-OUTPUT SECTION.                                            IC2344.2
   000704   3     072300*FILE-CONTROL.                                                    IC2344.2
   000705   3     072400 DATA DIVISION.                                                   IC2344.2
   000706   3     072500 FILE SECTION.                                                    IC2344.2
   000707   3     072600 WORKING-STORAGE SECTION.                                         IC2344.2
   000708   3     072700 PROCEDURE DIVISION.                                              IC2344.2
   000709   3     072800 SECT-IC234A-3-001 SECTION.                                       IC2344.2
   000710   3     072900 USE-INIT-1.                                                      IC2344.2
   000711   3     073000     OPEN    INPUT TEST-FILE.                                     IC2344.2 66
   000712   3     073100     READ    TEST-FILE.                                           IC2344.2 66
   000713   3     073200     EXIT PROGRAM.                                                IC2344.2
   000714   3     073300*                                                                 IC2344.2
   000715   3     073400 END PROGRAM IC234A-3.                                            IC2344.2 603
   000716   2     073500 END PROGRAM IC234A-2.                                            IC2344.2 484
   000717   1     073600 END PROGRAM IC234A-1.                                            IC2344.2 365
   000718         073700 END PROGRAM IC234A.                                              IC2344.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      132   ANSI-REFERENCE . . . . . . . .  310 317 326 M339
      111   CCVS-C-1 . . . . . . . . . . .  254 296
      116   CCVS-C-2 . . . . . . . . . . .  255 297
      166   CCVS-E-1 . . . . . . . . . . .  260
      171   CCVS-E-2 . . . . . . . . . . .  269 276 283 288
      174   CCVS-E-2-2 . . . . . . . . . .  M268
      179   CCVS-E-3 . . . . . . . . . . .  289
      188   CCVS-E-4 . . . . . . . . . . .  268
      189   CCVS-E-4-1 . . . . . . . . . .  M266
      191   CCVS-E-4-2 . . . . . . . . . .  M267
      133   CCVS-H-1 . . . . . . . . . . .  249
      138   CCVS-H-2A. . . . . . . . . . .  250
      147   CCVS-H-2B. . . . . . . . . . .  251
      159   CCVS-H-3 . . . . . . . . . . .  252
      209   CCVS-PGM-ID. . . . . . . . . .  221 221
       93   CM-18V0
       87   COMPUTED-A . . . . . . . . . .  88 90 91 92 93 322 325
       88   COMPUTED-N . . . . . . . . . .  M348
       86   COMPUTED-X . . . . . . . . . .  M244 308
       90   COMPUTED-0V18
       92   COMPUTED-14V4
       94   COMPUTED-18V0
       91   COMPUTED-4V14
      110   COR-ANSI-REFERENCE . . . . . .  M317 M319
      101   CORRECT-A. . . . . . . . . . .  102 103 104 105 106 323 325
      102   CORRECT-N. . . . . . . . . . .  M347
      100   CORRECT-X. . . . . . . . . . .  M245 309
      103   CORRECT-0V18
      105   CORRECT-14V4
      107   CORRECT-18V0
      104   CORRECT-4V14
      106   CR-18V0
      124   DELETE-COUNTER . . . . . . . .  M234 263 279 281
       69   DILFRAP. . . . . . . . . . . .  M216 M340 343 348 349 M475 M594
       79   DOTVALUE . . . . . . . . . . .  M239
      130   DUMMY-HOLD . . . . . . . . . .  M293 299
       65   DUMMY-RECORD . . . . . . . . .  M249 M250 M251 M252 M254 M255 M256 M258 M260 M269 M276 M283 M288 M289 293 M294
                                            295 M296 M297 M298 M299 303 M304 M312 M327
      177   ENDER-DESC . . . . . . . . . .  M271 M282 M287
      125   ERROR-COUNTER. . . . . . . . .  M233 262 272 275
      129   ERROR-HOLD . . . . . . . . . .  M262 M263 M263 M264 267
      175   ERROR-TOTAL. . . . . . . . . .  M273 M275 M280 M281 M285 M286
       72   FEATURE. . . . . . . . . . . .  M337
      203   HYPHEN-LINE. . . . . . . . . .  256 258 298
      169   ID-AGAIN . . . . . . . . . . .  M221
      202   INF-ANSI-REFERENCE . . . . . .  M310 M313 M326 M328
      197   INFO-TEXT. . . . . . . . . . .  M311
      126   INSPECT-COUNTER. . . . . . . .  M231 262 284 286
       74   P-OR-F . . . . . . . . . . . .  M231 M232 M233 M234 241 M244
       76   PAR-NAME . . . . . . . . . . .  M246 M338
       78   PARDOT-X . . . . . . . . . . .  M238
      127   PASS-COUNTER . . . . . . . . .  M232 264 266
       63   PRINT-FILE . . . . . . . . . .  57 220 226
       64   PRINT-REC. . . . . . . . . . .  M240 M316 M318
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    17
0 Defined   Cross-reference of data names   References

0      81   RE-MARK. . . . . . . . . . . .  M235 M247 M350 M351
      123   REC-CT . . . . . . . . . . . .  237 239 246 M336
      122   REC-SKL-SUB
      131   RECORD-COUNT . . . . . . . . .  M291 292 M300
       82   TEST-COMPUTED. . . . . . . . .  316
       97   TEST-CORRECT . . . . . . . . .  318
       66   TEST-FILE. . . . . . . . . . .  59 334 335 473 711 712
      150   TEST-ID. . . . . . . . . . . .  M221
       67   TEST-RECORD
       70   TEST-RESULTS . . . . . . . . .  M222 240
      128   TOTAL-ERROR
      199   XXCOMPUTED . . . . . . . . . .  M325
      201   XXCORRECT. . . . . . . . . . .  M325
      194   XXINFO . . . . . . . . . . . .  312 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    18
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

      321   BAIL-OUT . . . . . . . . . . .  P243
      329   BAIL-OUT-EX. . . . . . . . . .  E243 G323
      324   BAIL-OUT-WRITE . . . . . . . .  G322
      305   BLANK-LINE-PRINT
      359   CCVS-EXIT
      360   CCVS-999999
      218   CCVS1
      330   CCVS1-EXIT . . . . . . . . . .  G224
      225   CLOSE-FILES. . . . . . . . . .  G361
      253   COLUMN-NAMES-ROUTINE . . . . .  E223
      234   DE-LETE. . . . . . . . . . . .  P355
      257   END-ROUTINE. . . . . . . . . .  P226
      261   END-ROUTINE-1
      270   END-ROUTINE-12
      278   END-ROUTINE-13 . . . . . . . .  E226
      259   END-RTN-EXIT
      233   FAIL . . . . . . . . . . . . .  P352
      307   FAIL-ROUTINE . . . . . . . . .  P242
      320   FAIL-ROUTINE-EX. . . . . . . .  E242 G314
      315   FAIL-ROUTINE-WRITE . . . . . .  G308 G309
      248   HEAD-ROUTINE . . . . . . . . .  P223
      231   INSPT
      472   NON-GLOBAL-SECTION
      219   OPEN-FILES
      232   PASS . . . . . . . . . . . . .  P344
      236   PRINT-DETAIL . . . . . . . . .  P357
      213   SECT-IC234A-001
      477   SECT-IC234A-1-001
      332   SECT-IC234A-1R-001
      596   SECT-IC234A-2-001
      709   SECT-IC234A-3-001
      229   TERMINATE-CALL
      227   TERMINATE-CCVS
      354   USE-DELETE-1
      346   USE-FAIL-1
      333   USE-INIT-1
      478   USE-INIT-1
      597   USE-INIT-1
      710   USE-INIT-1
      474   USE-PARA
      591   USE-TEST
      341   USE-TEST-0
      593   USE-TEST-1
      215   USE-TEST-2
      356   USE-WRITE-1. . . . . . . . . .  G345 G353
      290   WRITE-LINE . . . . . . . . . .  P240 P241 P249 P250 P251 P252 P254 P255 P256 P258 P260 P269 P277 P283 P288 P289
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    19
0 Defined   Cross-reference of procedures   References

0                                           P312 P316 P318 P327
      302   WRT-LN . . . . . . . . . . . .  P296 P297 P298 P301 P306
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    20
0 Defined   Cross-reference of programs     References

        3   IC234A . . . . . . . . . . . .  718
      365   IC234A-1 . . . . . . . . . . .  717 342
      484   IC234A-2 . . . . . . . . . . .  716 479
      603   IC234A-3 . . . . . . . . . . .  715 598
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC234A    Date 06/04/2022  Time 11:56:57   Page    21
0LineID  Message code  Message text

     63  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     66  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "TEST-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program IC234A:
 *    Source records = 718
 *    Data Division statements = 65
 *    Procedure Division statements = 161
 *    Generated COBOL statements = 0
 *    Program complexity factor = 168
0End of compilation 1,  program IC234A,  highest severity 0.
0Return code 0
