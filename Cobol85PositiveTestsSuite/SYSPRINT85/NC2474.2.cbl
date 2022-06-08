1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:21   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:21   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2474.2
   000002         000200 PROGRAM-ID.                                                      NC2474.2
   000003         000300     NC247A.                                                      NC2474.2
   000004         000500*                                                              *  NC2474.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2474.2
   000006         000700*                                                              *  NC2474.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2474.2
   000008         000900*                                                              *  NC2474.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2474.2
   000010         001100*                                                              *  NC2474.2
   000011         001300*                                                              *  NC2474.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2474.2
   000013         001500*                                                              *  NC2474.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2474.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2474.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2474.2
   000017         001900*                                                              *  NC2474.2
   000018         002100*                                                                 NC2474.2
   000019         002200*                                                                 NC2474.2
   000020         002300*    PROGRAM NC247A TESTS FORMAT2 OF THE "OCCURS" CLAUSE TO    *  NC2474.2
   000021         002400*    VERIFY THAT THE NUMBER OF TABLE OCCURRENCES CARIES        *  NC2474.2
   000022         002500*    ACCORDING TO THE CURRENT VALUE OF THE IDENTIDIER ON WHICH *  NC2474.2
   000023         002600*    IT DEPENDS.                                               *  NC2474.2
   000024         002700*                                                              *  NC2474.2
   000025         002900 ENVIRONMENT DIVISION.                                            NC2474.2
   000026         003000 CONFIGURATION SECTION.                                           NC2474.2
   000027         003100 SOURCE-COMPUTER.                                                 NC2474.2
   000028         003200     XXXXX082.                                                    NC2474.2
   000029         003300 OBJECT-COMPUTER.                                                 NC2474.2
   000030         003400     XXXXX083.                                                    NC2474.2
   000031         003500 INPUT-OUTPUT SECTION.                                            NC2474.2
   000032         003600 FILE-CONTROL.                                                    NC2474.2
   000033         003700     SELECT PRINT-FILE ASSIGN TO                                  NC2474.2 37
   000034         003800     XXXXX055.                                                    NC2474.2
   000035         003900 DATA DIVISION.                                                   NC2474.2
   000036         004000 FILE SECTION.                                                    NC2474.2
   000037         004100 FD  PRINT-FILE.                                                  NC2474.2

 ==000037==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000038         004200 01  PRINT-REC PICTURE X(120).                                    NC2474.2
   000039         004300 01  DUMMY-RECORD PICTURE X(120).                                 NC2474.2
   000040         004400 WORKING-STORAGE SECTION.                                         NC2474.2
   000041         004500 01  ODO-RECORD.                                                  NC2474.2
   000042         004600     02  FILLER PIC X(120).                                       NC2474.2
   000043         004700     02  GRP-ODO.                                                 NC2474.2
   000044         004800         03  DOI-DU-01V00 PIC 9.                                  NC2474.2
   000045         004900         03  ODO-XN-00009 PIC X(9).                               NC2474.2
   000046         005000         03  ODO-GRP-00009.                                       NC2474.2
   000047         005100         04  ODO-XN-00001-O009D OCCURS 0 TO 9 TIMES DEPENDING ON  NC2474.2
   000048         005200                 DOI-DU-01V00 ASCENDING KEY ODO-XN-00001-O009D    NC2474.2 44 47
   000049         005300                 INDEXED BY ODO-IX PIC X.                         NC2474.2
   000050         005400 01  NEW-RECORD.                                                  NC2474.2
   000051         005500     02  FILLER PIC X(120).                                       NC2474.2
   000052         005600     02  NEW-ODO.                                                 NC2474.2
   000053         005700         03  NEW-DU-01V00 PIC 9.                                  NC2474.2
   000054         005800         03  NEW-XN-00009 PIC X(9).                               NC2474.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900         03  NEW-GRP-00009.                                       NC2474.2
   000056         006000         04  NEW-XN-00001-O009D OCCURS 0 TO 9 TIMES DEPENDING ON  NC2474.2
   000057         006100                 NEW-DU-01V00 ASCENDING KEY NEW-XN-00001-O009D    NC2474.2 53 56
   000058         006200                 INDEXED BY NEW-IX PIC X.                         NC2474.2
   000059         006300 01  STATIC-VALUE.                                                NC2474.2
   000060         006400     02  FILLER PIC 9 VALUE 9.                                    NC2474.2
   000061         006500     02  FILLER PIC X(18) VALUE " ACTIVE: 123456789".             NC2474.2
   000062         006600 01  WRK-GRP-00019.                                               NC2474.2
   000063         006700     02  WRK-DU-01V00 PIC 9.                                      NC2474.2
   000064         006800     02  WRK-XN-00009-1 PIC X(9).                                 NC2474.2
   000065         006900     02  WRK-XN-00009-2 PIC X(9).                                 NC2474.2
   000066         007000 01  WRK-DU-05V00 PIC 9(5).                                       NC2474.2
   000067         007100 01  WRK-XN-00020 PIC X(20).                                      NC2474.2
   000068         007200 01  WRK-XN-00010 PIC X(10).                                      NC2474.2
   000069         007300 01  WRK-XN-00001 PIC X.                                          NC2474.2
   000070         007400 01  TEST-RESULTS.                                                NC2474.2
   000071         007500     02 FILLER                   PIC X      VALUE SPACE.          NC2474.2 IMP
   000072         007600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2474.2 IMP
   000073         007700     02 FILLER                   PIC X      VALUE SPACE.          NC2474.2 IMP
   000074         007800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2474.2 IMP
   000075         007900     02 FILLER                   PIC X      VALUE SPACE.          NC2474.2 IMP
   000076         008000     02  PAR-NAME.                                                NC2474.2
   000077         008100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2474.2 IMP
   000078         008200       03  PARDOT-X              PIC X      VALUE SPACE.          NC2474.2 IMP
   000079         008300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2474.2 IMP
   000080         008400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2474.2 IMP
   000081         008500     02 RE-MARK                  PIC X(61).                       NC2474.2
   000082         008600 01  TEST-COMPUTED.                                               NC2474.2
   000083         008700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2474.2 IMP
   000084         008800     02 FILLER                   PIC X(17)  VALUE                 NC2474.2
   000085         008900            "       COMPUTED=".                                   NC2474.2
   000086         009000     02 COMPUTED-X.                                               NC2474.2
   000087         009100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2474.2 IMP
   000088         009200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2474.2 87
   000089         009300                                 PIC -9(9).9(9).                  NC2474.2
   000090         009400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2474.2 87
   000091         009500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2474.2 87
   000092         009600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2474.2 87
   000093         009700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2474.2 87
   000094         009800         04 COMPUTED-18V0                    PIC -9(18).          NC2474.2
   000095         009900         04 FILLER                           PIC X.               NC2474.2
   000096         010000     03 FILLER PIC X(50) VALUE SPACE.                             NC2474.2 IMP
   000097         010100 01  TEST-CORRECT.                                                NC2474.2
   000098         010200     02 FILLER PIC X(30) VALUE SPACE.                             NC2474.2 IMP
   000099         010300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2474.2
   000100         010400     02 CORRECT-X.                                                NC2474.2
   000101         010500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2474.2 IMP
   000102         010600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2474.2 101
   000103         010700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2474.2 101
   000104         010800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2474.2 101
   000105         010900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2474.2 101
   000106         011000     03      CR-18V0 REDEFINES CORRECT-A.                         NC2474.2 101
   000107         011100         04 CORRECT-18V0                     PIC -9(18).          NC2474.2
   000108         011200         04 FILLER                           PIC X.               NC2474.2
   000109         011300     03 FILLER PIC X(2) VALUE SPACE.                              NC2474.2 IMP
   000110         011400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2474.2 IMP
   000111         011500 01  CCVS-C-1.                                                    NC2474.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2474.2
   000113         011700-    "SS  PARAGRAPH-NAME                                          NC2474.2
   000114         011800-    "       REMARKS".                                            NC2474.2
   000115         011900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2474.2 IMP
   000116         012000 01  CCVS-C-2.                                                    NC2474.2
   000117         012100     02 FILLER                     PIC X        VALUE SPACE.      NC2474.2 IMP
   000118         012200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2474.2
   000119         012300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2474.2 IMP
   000120         012400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2474.2
   000121         012500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2474.2 IMP
   000122         012600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2474.2 IMP
   000123         012700 01  REC-CT                        PIC 99       VALUE ZERO.       NC2474.2 IMP
   000124         012800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2474.2 IMP
   000125         012900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2474.2 IMP
   000126         013000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2474.2 IMP
   000127         013100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2474.2 IMP
   000128         013200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2474.2 IMP
   000129         013300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2474.2 IMP
   000130         013400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2474.2 IMP
   000131         013500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2474.2 IMP
   000132         013600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2474.2 IMP
   000133         013700 01  CCVS-H-1.                                                    NC2474.2
   000134         013800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2474.2 IMP
   000135         013900     02  FILLER                    PIC X(42)    VALUE             NC2474.2
   000136         014000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2474.2
   000137         014100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2474.2 IMP
   000138         014200 01  CCVS-H-2A.                                                   NC2474.2
   000139         014300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2474.2 IMP
   000140         014400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2474.2
   000141         014500   02  FILLER                        PIC XXXX   VALUE             NC2474.2
   000142         014600     "4.2 ".                                                      NC2474.2
   000143         014700   02  FILLER                        PIC X(28)  VALUE             NC2474.2
   000144         014800            " COPY - NOT FOR DISTRIBUTION".                       NC2474.2
   000145         014900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2474.2 IMP
   000146         015000                                                                  NC2474.2
   000147         015100 01  CCVS-H-2B.                                                   NC2474.2
   000148         015200   02  FILLER                        PIC X(15)  VALUE             NC2474.2
   000149         015300            "TEST RESULT OF ".                                    NC2474.2
   000150         015400   02  TEST-ID                       PIC X(9).                    NC2474.2
   000151         015500   02  FILLER                        PIC X(4)   VALUE             NC2474.2
   000152         015600            " IN ".                                               NC2474.2
   000153         015700   02  FILLER                        PIC X(12)  VALUE             NC2474.2
   000154         015800     " HIGH       ".                                              NC2474.2
   000155         015900   02  FILLER                        PIC X(22)  VALUE             NC2474.2
   000156         016000            " LEVEL VALIDATION FOR ".                             NC2474.2
   000157         016100   02  FILLER                        PIC X(58)  VALUE             NC2474.2
   000158         016200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2474.2
   000159         016300 01  CCVS-H-3.                                                    NC2474.2
   000160         016400     02  FILLER                      PIC X(34)  VALUE             NC2474.2
   000161         016500            " FOR OFFICIAL USE ONLY    ".                         NC2474.2
   000162         016600     02  FILLER                      PIC X(58)  VALUE             NC2474.2
   000163         016700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2474.2
   000164         016800     02  FILLER                      PIC X(28)  VALUE             NC2474.2
   000165         016900            "  COPYRIGHT   1985 ".                                NC2474.2
   000166         017000 01  CCVS-E-1.                                                    NC2474.2
   000167         017100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2474.2 IMP
   000168         017200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2474.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02 ID-AGAIN                     PIC X(9).                    NC2474.2
   000170         017400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2474.2 IMP
   000171         017500 01  CCVS-E-2.                                                    NC2474.2
   000172         017600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2474.2 IMP
   000173         017700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2474.2 IMP
   000174         017800     02 CCVS-E-2-2.                                               NC2474.2
   000175         017900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2474.2 IMP
   000176         018000         03 FILLER                   PIC X      VALUE SPACE.      NC2474.2 IMP
   000177         018100         03 ENDER-DESC               PIC X(44)  VALUE             NC2474.2
   000178         018200            "ERRORS ENCOUNTERED".                                 NC2474.2
   000179         018300 01  CCVS-E-3.                                                    NC2474.2
   000180         018400     02  FILLER                      PIC X(22)  VALUE             NC2474.2
   000181         018500            " FOR OFFICIAL USE ONLY".                             NC2474.2
   000182         018600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2474.2 IMP
   000183         018700     02  FILLER                      PIC X(58)  VALUE             NC2474.2
   000184         018800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2474.2
   000185         018900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2474.2 IMP
   000186         019000     02 FILLER                       PIC X(15)  VALUE             NC2474.2
   000187         019100             " COPYRIGHT 1985".                                   NC2474.2
   000188         019200 01  CCVS-E-4.                                                    NC2474.2
   000189         019300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2474.2 IMP
   000190         019400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2474.2
   000191         019500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2474.2 IMP
   000192         019600     02 FILLER                       PIC X(40)  VALUE             NC2474.2
   000193         019700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2474.2
   000194         019800 01  XXINFO.                                                      NC2474.2
   000195         019900     02 FILLER                       PIC X(19)  VALUE             NC2474.2
   000196         020000            "*** INFORMATION ***".                                NC2474.2
   000197         020100     02 INFO-TEXT.                                                NC2474.2
   000198         020200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2474.2 IMP
   000199         020300       04 XXCOMPUTED                 PIC X(20).                   NC2474.2
   000200         020400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2474.2 IMP
   000201         020500       04 XXCORRECT                  PIC X(20).                   NC2474.2
   000202         020600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2474.2
   000203         020700 01  HYPHEN-LINE.                                                 NC2474.2
   000204         020800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2474.2 IMP
   000205         020900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2474.2
   000206         021000-    "*****************************************".                 NC2474.2
   000207         021100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2474.2
   000208         021200-    "******************************".                            NC2474.2
   000209         021300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2474.2
   000210         021400     "NC247A".                                                    NC2474.2
   000211         021500 PROCEDURE DIVISION.                                              NC2474.2
   000212         021600 CCVS1 SECTION.                                                   NC2474.2
   000213         021700 OPEN-FILES.                                                      NC2474.2
   000214         021800     OPEN     OUTPUT PRINT-FILE.                                  NC2474.2 37
   000215         021900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2474.2 209 150 209 169
   000216         022000     MOVE    SPACE TO TEST-RESULTS.                               NC2474.2 IMP 70
   000217         022100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2474.2 242 247
   000218         022200     GO TO CCVS1-EXIT.                                            NC2474.2 324
   000219         022300 CLOSE-FILES.                                                     NC2474.2
   000220         022400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2474.2 251 272 37
   000221         022500 TERMINATE-CCVS.                                                  NC2474.2
   000222         022600     EXIT PROGRAM.                                                NC2474.2
   000223         022700 TERMINATE-CALL.                                                  NC2474.2
   000224         022800     STOP     RUN.                                                NC2474.2
   000225         022900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2474.2 74 126
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2474.2 74 127
   000227         023100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2474.2 74 125
   000228         023200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2474.2 74 124
   000229         023300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2474.2 81
   000230         023400 PRINT-DETAIL.                                                    NC2474.2
   000231         023500     IF REC-CT NOT EQUAL TO ZERO                                  NC2474.2 123 IMP
   000232      1  023600             MOVE "." TO PARDOT-X                                 NC2474.2 78
   000233      1  023700             MOVE REC-CT TO DOTVALUE.                             NC2474.2 123 79
   000234         023800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2474.2 70 38 284
   000235         023900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2474.2 74 284
   000236      1  024000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2474.2 301 314
   000237      1  024100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2474.2 315 323
   000238         024200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2474.2 IMP 74 IMP 86
   000239         024300     MOVE SPACE TO CORRECT-X.                                     NC2474.2 IMP 100
   000240         024400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2474.2 123 IMP IMP 76
   000241         024500     MOVE     SPACE TO RE-MARK.                                   NC2474.2 IMP 81
   000242         024600 HEAD-ROUTINE.                                                    NC2474.2
   000243         024700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2474.2 133 39 284
   000244         024800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2474.2 138 39 284
   000245         024900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2474.2 147 39 284
   000246         025000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2474.2 159 39 284
   000247         025100 COLUMN-NAMES-ROUTINE.                                            NC2474.2
   000248         025200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2474.2 111 39 284
   000249         025300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2474.2 116 39 284
   000250         025400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2474.2 203 39 284
   000251         025500 END-ROUTINE.                                                     NC2474.2
   000252         025600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2474.2 203 39 284
   000253         025700 END-RTN-EXIT.                                                    NC2474.2
   000254         025800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2474.2 166 39 284
   000255         025900 END-ROUTINE-1.                                                   NC2474.2
   000256         026000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2474.2 125 129 126
   000257         026100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2474.2 129 124 129
   000258         026200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2474.2 127 129
   000259         026300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2474.2
   000260         026400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2474.2 127 189
   000261         026500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2474.2 129 191
   000262         026600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2474.2 188 174
   000263         026700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2474.2 171 39 284
   000264         026800  END-ROUTINE-12.                                                 NC2474.2
   000265         026900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2474.2 177
   000266         027000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2474.2 125 IMP
   000267      1  027100         MOVE "NO " TO ERROR-TOTAL                                NC2474.2 175
   000268         027200         ELSE                                                     NC2474.2
   000269      1  027300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2474.2 125 175
   000270         027400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2474.2 171 39
   000271         027500     PERFORM WRITE-LINE.                                          NC2474.2 284
   000272         027600 END-ROUTINE-13.                                                  NC2474.2
   000273         027700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2474.2 124 IMP
   000274      1  027800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2474.2 175
   000275      1  027900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2474.2 124 175
   000276         028000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2474.2 177
   000277         028100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2474.2 171 39 284
   000278         028200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2474.2 126 IMP
   000279      1  028300          MOVE "NO " TO ERROR-TOTAL                               NC2474.2 175
   000280      1  028400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2474.2 126 175
   000281         028500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2474.2 177
   000282         028600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2474.2 171 39 284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2474.2 179 39 284
   000284         028800 WRITE-LINE.                                                      NC2474.2
   000285         028900     ADD 1 TO RECORD-COUNT.                                       NC2474.2 131
   000286         029000     IF RECORD-COUNT GREATER 50                                   NC2474.2 131
   000287      1  029100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2474.2 39 130
   000288      1  029200         MOVE SPACE TO DUMMY-RECORD                               NC2474.2 IMP 39
   000289      1  029300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2474.2 39
   000290      1  029400         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2474.2 111 39 296
   000291      1  029500         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2474.2 116 39 296
   000292      1  029600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2474.2 203 39 296
   000293      1  029700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2474.2 130 39
   000294      1  029800         MOVE ZERO TO RECORD-COUNT.                               NC2474.2 IMP 131
   000295         029900     PERFORM WRT-LN.                                              NC2474.2 296
   000296         030000 WRT-LN.                                                          NC2474.2
   000297         030100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2474.2 39
   000298         030200     MOVE SPACE TO DUMMY-RECORD.                                  NC2474.2 IMP 39
   000299         030300 BLANK-LINE-PRINT.                                                NC2474.2
   000300         030400     PERFORM WRT-LN.                                              NC2474.2 296
   000301         030500 FAIL-ROUTINE.                                                    NC2474.2
   000302         030600     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2474.2 86 IMP 309
   000303         030700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2474.2 100 IMP 309
   000304         030800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2474.2 132 202
   000305         030900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2474.2 197
   000306         031000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2474.2 194 39 284
   000307         031100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2474.2 IMP 202
   000308         031200     GO TO  FAIL-ROUTINE-EX.                                      NC2474.2 314
   000309         031300 FAIL-ROUTINE-WRITE.                                              NC2474.2
   000310         031400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2474.2 82 38 284
   000311         031500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2474.2 132 110
   000312         031600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2474.2 97 38 284
   000313         031700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2474.2 IMP 110
   000314         031800 FAIL-ROUTINE-EX. EXIT.                                           NC2474.2
   000315         031900 BAIL-OUT.                                                        NC2474.2
   000316         032000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2474.2 87 IMP 318
   000317         032100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2474.2 101 IMP 323
   000318         032200 BAIL-OUT-WRITE.                                                  NC2474.2
   000319         032300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2474.2 101 201 87 199
   000320         032400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2474.2 132 202
   000321         032500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2474.2 194 39 284
   000322         032600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2474.2 IMP 202
   000323         032700 BAIL-OUT-EX. EXIT.                                               NC2474.2
   000324         032800 CCVS1-EXIT.                                                      NC2474.2
   000325         032900     EXIT.                                                        NC2474.2
   000326         033000 SECT-NC247A-001 SECTION.                                         NC2474.2
   000327         033100 INIT-WRK-AREA.                                                   NC2474.2
   000328         033200     MOVE STATIC-VALUE TO WRK-GRP-00019.                          NC2474.2 59 62
   000329         033300     MOVE 9 TO DOI-DU-01V00.                                      NC2474.2 44
   000330         033400     MOVE " ACTIVE: " TO ODO-XN-00009.                            NC2474.2 45
   000331         033500     MOVE "1" TO ODO-XN-00001-O009D (1).                          NC2474.2 47
   000332         033600     MOVE "2" TO ODO-XN-00001-O009D (2).                          NC2474.2 47
   000333         033700     MOVE "3" TO ODO-XN-00001-O009D (3).                          NC2474.2 47
   000334         033800     MOVE "4" TO ODO-XN-00001-O009D (4).                          NC2474.2 47
   000335         033900     MOVE "5" TO ODO-XN-00001-O009D (5).                          NC2474.2 47
   000336         034000     MOVE "6" TO ODO-XN-00001-O009D (6).                          NC2474.2 47
   000337         034100     MOVE "7" TO ODO-XN-00001-O009D (7).                          NC2474.2 47
   000338         034200     MOVE "8" TO ODO-XN-00001-O009D (8).                          NC2474.2 47
   000339         034300     MOVE "9" TO ODO-XN-00001-O009D (9).                          NC2474.2 47
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400*                                                                 NC2474.2
   000341         034500 IF-INIT-GF-1.                                                    NC2474.2
   000342         034600     MOVE "IF-TEST-GF-1" TO PAR-NAME.                             NC2474.2 76
   000343         034700     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000344         034800     MOVE "OCCURS DEPENDING ON" TO FEATURE.                       NC2474.2 72
   000345         034900     MOVE STATIC-VALUE TO RE-MARK.                                NC2474.2 59 81
   000346         035000 IF-TEST-GF-1.                                                    NC2474.2
   000347         035100     IF STATIC-VALUE IS EQUAL TO GRP-ODO                          NC2474.2 59 43
   000348      1  035200         PERFORM PASS                                             NC2474.2 226
   000349      1  035300         GO TO IF-WRITE-GF-1                                      NC2474.2 359
   000350         035400     ELSE                                                         NC2474.2
   000351      1  035500         GO TO IF-FAIL-GF-1.                                      NC2474.2 355
   000352         035600 IF-DELETE-GF-1.                                                  NC2474.2
   000353         035700     PERFORM DE-LETE.                                             NC2474.2 228
   000354         035800     GO TO IF-WRITE-GF-1.                                         NC2474.2 359
   000355         035900 IF-FAIL-GF-1.                                                    NC2474.2
   000356         036000     PERFORM FAIL                                                 NC2474.2 227
   000357         036100     MOVE "CONDITION WAS EQUAL" TO CORRECT-A                      NC2474.2 101
   000358         036200     MOVE "CONDITION NOT EQUAL" TO COMPUTED-A.                    NC2474.2 87
   000359         036300 IF-WRITE-GF-1.                                                   NC2474.2
   000360         036400     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000361         036500*                                                                 NC2474.2
   000362         036600 IF-INIT-GF-2.                                                    NC2474.2
   000363         036700     MOVE WRK-GRP-00019 TO RE-MARK.                               NC2474.2 62 81
   000364         036800     MOVE "IF-TEST-GF-2" TO PAR-NAME.                             NC2474.2 76
   000365         036900     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000366         037000     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000367         037100     MOVE 3 TO WRK-DU-01V00  DOI-DU-01V00                         NC2474.2 63 44
   000368         037200     MOVE "123      " TO WRK-XN-00009-2.                          NC2474.2 65
   000369         037300 IF-TEST-GF-2.                                                    NC2474.2
   000370         037400     IF GRP-ODO IS EQUAL TO WRK-GRP-00019                         NC2474.2 43 62
   000371      1  037500         PERFORM PASS                                             NC2474.2 226
   000372      1  037600         GO TO IF-WRITE-GF-2                                      NC2474.2 382
   000373         037700     ELSE                                                         NC2474.2
   000374      1  037800         GO TO IF-FAIL-GF-2.                                      NC2474.2 378
   000375         037900 IF-DELETE-GF-2.                                                  NC2474.2
   000376         038000     PERFORM DE-LETE.                                             NC2474.2 228
   000377         038100     GO TO IF-WRITE-GF-2.                                         NC2474.2 382
   000378         038200 IF-FAIL-GF-2.                                                    NC2474.2
   000379         038300     PERFORM FAIL                                                 NC2474.2 227
   000380         038400     MOVE "CONDITION WAS EQUAL" TO CORRECT-A                      NC2474.2 101
   000381         038500     MOVE "CONDITION NOT EQUAL" TO COMPUTED-A.                    NC2474.2 87
   000382         038600 IF-WRITE-GF-2.                                                   NC2474.2
   000383         038700     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000384         038800*                                                                 NC2474.2
   000385         038900 INS-INIT-F1-1.                                                   NC2474.2
   000386         039000     MOVE "INS-TEST-F1-1" TO PAR-NAME.                            NC2474.2 76
   000387         039100     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000388         039200     MOVE STATIC-VALUE TO RE-MARK.                                NC2474.2 59 81
   000389         039300     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000390         039400     MOVE 0 TO WRK-DU-05V00.                                      NC2474.2 66
   000391         039500 INS-TEST-F1-1.                                                   NC2474.2
   000392         039600     INSPECT ODO-GRP-00009 TALLYING WRK-DU-05V00 FOR ALL "7".     NC2474.2 46 66
   000393         039700     IF WRK-DU-05V00 IS EQUAL TO 1                                NC2474.2 66
   000394      1  039800         PERFORM PASS                                             NC2474.2 226
   000395      1  039900         GO TO INS-WRITE-F1-1                                     NC2474.2 405
   000396         040000     ELSE                                                         NC2474.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040100         GO TO INS-FAIL-F1-1.                                     NC2474.2 401
   000398         040200 INS-DELETE-F1-1.                                                 NC2474.2
   000399         040300     PERFORM DE-LETE.                                             NC2474.2 228
   000400         040400     GO TO INS-WRITE-F1-1.                                        NC2474.2 405
   000401         040500 INS-FAIL-F1-1.                                                   NC2474.2
   000402         040600     PERFORM FAIL                                                 NC2474.2 227
   000403         040700     MOVE 1 TO  CORRECT-18V0                                      NC2474.2 107
   000404         040800     MOVE WRK-DU-05V00 TO COMPUTED-18V0.                          NC2474.2 66 94
   000405         040900 INS-WRITE-F1-1.                                                  NC2474.2
   000406         041000     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000407         041100*                                                                 NC2474.2
   000408         041200 INS-INIT-F1-2.                                                   NC2474.2
   000409         041300     MOVE "INS-TEST-F1-2" TO PAR-NAME.                            NC2474.2 76
   000410         041400     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000411         041500     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000412         041600     MOVE 3 TO DOI-DU-01V00  WRK-DU-01V00 WRK-DU-05V00.           NC2474.2 44 63 66
   000413         041700     MOVE "123      " TO WRK-XN-00009-2.                          NC2474.2 65
   000414         041800     MOVE 0 TO WRK-DU-05V00.                                      NC2474.2 66
   000415         041900     MOVE WRK-GRP-00019 TO RE-MARK.                               NC2474.2 62 81
   000416         042000 INS-TEST-F1-2.                                                   NC2474.2
   000417         042100     INSPECT ODO-GRP-00009 TALLYING WRK-DU-05V00 FOR ALL "7".     NC2474.2 46 66
   000418         042200     IF WRK-DU-05V00 IS EQUAL TO 0                                NC2474.2 66
   000419      1  042300         PERFORM PASS                                             NC2474.2 226
   000420      1  042400         GO TO INS-WRITE-F1-2                                     NC2474.2 430
   000421         042500     ELSE                                                         NC2474.2
   000422      1  042600         GO TO INS-FAIL-F1-2.                                     NC2474.2 426
   000423         042700 INS-DELETE-F1-2.                                                 NC2474.2
   000424         042800     PERFORM DE-LETE.                                             NC2474.2 228
   000425         042900     GO TO INS-WRITE-F1-2.                                        NC2474.2 430
   000426         043000 INS-FAIL-F1-2.                                                   NC2474.2
   000427         043100     PERFORM FAIL                                                 NC2474.2 227
   000428         043200     MOVE 0 TO CORRECT-18V0                                       NC2474.2 107
   000429         043300     MOVE WRK-DU-05V00 TO COMPUTED-18V0.                          NC2474.2 66 94
   000430         043400 INS-WRITE-F1-2.                                                  NC2474.2
   000431         043500     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000432         043600*                                                                 NC2474.2
   000433         043700 MOV-INIT-F1-1.                                                   NC2474.2
   000434         043800     MOVE "MOV-TEST-F1-1" TO PAR-NAME.                            NC2474.2 76
   000435         043900     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000436         044000     MOVE "FULL ODO + BASE SEGMENT SOURCE" TO RE-MARK.            NC2474.2 81
   000437         044100     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000438         044200     MOVE SPACES TO WRK-GRP-00019.                                NC2474.2 IMP 62
   000439         044300     MOVE GRP-ODO TO WRK-GRP-00019.                               NC2474.2 43 62
   000440         044400 MOV-TEST-F1-1.                                                   NC2474.2
   000441         044500     IF WRK-GRP-00019 IS EQUAL TO STATIC-VALUE                    NC2474.2 62 59
   000442      1  044600         PERFORM PASS                                             NC2474.2 226
   000443      1  044700         GO TO MOV-WRITE-F1-1                                     NC2474.2 453
   000444         044800     ELSE                                                         NC2474.2
   000445      1  044900         GO TO MOV-FAIL-F1-1.                                     NC2474.2 449
   000446         045000 MOV-DELETE-F1-1.                                                 NC2474.2
   000447         045100     PERFORM DE-LETE.                                             NC2474.2 228
   000448         045200     GO TO MOV-WRITE-F1-1.                                        NC2474.2 453
   000449         045300 MOV-FAIL-F1-1.                                                   NC2474.2
   000450         045400     PERFORM FAIL                                                 NC2474.2 227
   000451         045500     MOVE STATIC-VALUE TO CORRECT-A                               NC2474.2 59 101
   000452         045600     MOVE WRK-GRP-00019 TO COMPUTED-A.                            NC2474.2 62 87
   000453         045700 MOV-WRITE-F1-1.                                                  NC2474.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000455         045900*                                                                 NC2474.2
   000456         046000 MOV-INIT-F1-2.                                                   NC2474.2
   000457         046100     MOVE "MOV-TEST-F1-2" TO PAR-NAME.                            NC2474.2 76
   000458         046200     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000459         046300     MOVE "PART ODO + BASE SEGMENT SOURCE" TO RE-MARK.            NC2474.2 81
   000460         046400     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000461         046500     MOVE SPACES TO WRK-GRP-00019.                                NC2474.2 IMP 62
   000462         046600     MOVE 3 TO DOI-DU-01V00.                                      NC2474.2 44
   000463         046700     MOVE GRP-ODO TO WRK-GRP-00019.                               NC2474.2 43 62
   000464         046800 MOV-TEST-F1-2.                                                   NC2474.2
   000465         046900     IF WRK-GRP-00019 IS EQUAL TO "3 ACTIVE: 123      "           NC2474.2 62
   000466      1  047000         PERFORM PASS                                             NC2474.2 226
   000467      1  047100         GO TO MOV-WRITE-F1-2                                     NC2474.2 477
   000468         047200     ELSE                                                         NC2474.2
   000469      1  047300         GO TO MOV-FAIL-F1-2.                                     NC2474.2 473
   000470         047400 MOV-DELETE-F1-2.                                                 NC2474.2
   000471         047500     PERFORM DE-LETE.                                             NC2474.2 228
   000472         047600     GO TO MOV-WRITE-F1-2.                                        NC2474.2 477
   000473         047700 MOV-FAIL-F1-2.                                                   NC2474.2
   000474         047800     PERFORM FAIL                                                 NC2474.2 227
   000475         047900     MOVE "3 ACTIVE: 123" TO CORRECT-A                            NC2474.2 101
   000476         048000     MOVE WRK-GRP-00019 TO COMPUTED-A.                            NC2474.2 62 87
   000477         048100 MOV-WRITE-F1-2.                                                  NC2474.2
   000478         048200     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000479         048300*                                                                 NC2474.2
   000480         048400 MOV-INIT-F1-3.                                                   NC2474.2
   000481         048500     MOVE "MOV-TEST-F1-3" TO PAR-NAME.                            NC2474.2 76
   000482         048600     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000483         048700     MOVE "FULL ODO +BASE SEG RECEIVING" TO RE-MARK.              NC2474.2 81
   000484         048800     MOVE 9 TO DOI-DU-01V00.                                      NC2474.2 44
   000485         048900     MOVE "F" TO  ODO-XN-00001-O009D (6).                         NC2474.2 47
   000486         049000     MOVE "A" TO  ODO-XN-00001-O009D (7).                         NC2474.2 47
   000487         049100     MOVE "I" TO  ODO-XN-00001-O009D (8).                         NC2474.2 47
   000488         049200     MOVE "L" TO  ODO-XN-00001-O009D (9).                         NC2474.2 47
   000489         049300     MOVE "3 ACTIVE: TEST PASS" TO GRP-ODO.                       NC2474.2 43
   000490         049400     MOVE 9 TO DOI-DU-01V00.                                      NC2474.2 44
   000491         049500 MOV-TEST-F1-3.                                                   NC2474.2
   000492         049600     IF GRP-ODO IS EQUAL TO "9 ACTIVE: TEST PASS"                 NC2474.2 43
   000493      1  049700         PERFORM PASS                                             NC2474.2 226
   000494      1  049800         GO TO MOV-WRITE-F1-3                                     NC2474.2 504
   000495         049900     ELSE                                                         NC2474.2
   000496      1  050000         GO TO MOV-FAIL-F1-3.                                     NC2474.2 500
   000497         050100 MOV-DELETE-F1-3.                                                 NC2474.2
   000498         050200     PERFORM DE-LETE.                                             NC2474.2 228
   000499         050300     GO TO MOV-WRITE-F1-3.                                        NC2474.2 504
   000500         050400 MOV-FAIL-F1-3.                                                   NC2474.2
   000501         050500     PERFORM FAIL                                                 NC2474.2 227
   000502         050600     MOVE "9 ACTIVE: TEST PASS" TO CORRECT-A                      NC2474.2 101
   000503         050700     MOVE GRP-ODO TO COMPUTED-A.                                  NC2474.2 43 87
   000504         050800 MOV-WRITE-F1-3.                                                  NC2474.2
   000505         050900     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000506         051000*                                                                 NC2474.2
   000507         051100 MOV-INIT-F1-4.                                                   NC2474.2
   000508         051200     MOVE "MOV-TEST-F1-4" TO PAR-NAME.                            NC2474.2 76
   000509         051300     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000510         051400     MOVE "PART ODO + BASE SEG RECEIVING" TO RE-MARK.             NC2474.2 81
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     MOVE 9 TO DOI-DU-01V00.                                      NC2474.2 44
   000512         051600     MOVE "F" TO ODO-XN-00001-O009D (6).                          NC2474.2 47
   000513         051700     MOVE "A" TO ODO-XN-00001-O009D (7).                          NC2474.2 47
   000514         051800     MOVE "I" TO ODO-XN-00001-O009D (8).                          NC2474.2 47
   000515         051900     MOVE "L" TO ODO-XN-00001-O009D (9).                          NC2474.2 47
   000516         052000     MOVE "9 ACTIVE: TEST PASS" TO GRP-ODO.                       NC2474.2 43
   000517         052100     MOVE 9 TO DOI-DU-01V00.                                      NC2474.2 44
   000518         052200     MOVE GRP-ODO TO WRK-GRP-00019.                               NC2474.2 43 62
   000519         052300     MOVE 5 TO WRK-DU-01V00.                                      NC2474.2 63
   000520         052400 MOV-TEST-F1-4.                                                   NC2474.2
   000521         052500     IF GRP-ODO IS EQUAL TO "9 ACTIVE: TEST PASS"                 NC2474.2 43
   000522      1  052600         PERFORM PASS                                             NC2474.2 226
   000523      1  052700         GO TO MOV-WRITE-F1-4                                     NC2474.2 533
   000524         052800     ELSE                                                         NC2474.2
   000525      1  052900         GO TO MOV-FAIL-F1-4.                                     NC2474.2 529
   000526         053000 MOV-DELETE-F1-4.                                                 NC2474.2
   000527         053100     PERFORM DE-LETE.                                             NC2474.2 228
   000528         053200     GO TO MOV-WRITE-F1-4.                                        NC2474.2 533
   000529         053300 MOV-FAIL-F1-4.                                                   NC2474.2
   000530         053400     PERFORM FAIL                                                 NC2474.2 227
   000531         053500     MOVE WRK-GRP-00019 TO COMPUTED-A                             NC2474.2 62 87
   000532         053600     MOVE "9 ACTIVE: TEST PASS" TO CORRECT-A.                     NC2474.2 101
   000533         053700 MOV-WRITE-F1-4.                                                  NC2474.2
   000534         053800     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000535         053900*                                                                 NC2474.2
   000536         054000 MOV-INIT-F1-5.                                                   NC2474.2
   000537         054100     MOVE   "MOV-TEST-F1-5" TO PAR-NAME.                          NC2474.2 76
   000538         054200     MOVE   "VI-26 5.8.3 SR5" TO ANSI-REFERENCE.                  NC2474.2 132
   000539         054300*    MOVE    9  TO DOI-DU-01V00.                                  NC2474.2
   000540         054400*    MOVE   "Z" TO ODO-XN-00001-O009D (1).                        NC2474.2
   000541         054500*    MOVE   "E" TO ODO-XN-00001-O009D (2).                        NC2474.2
   000542         054600*    MOVE   "R" TO ODO-XN-00001-O009D (3).                        NC2474.2
   000543         054700*    MOVE   "O" TO ODO-XN-00001-O009D (4).                        NC2474.2
   000544         054800*    MOVE   "*" TO WRK-XN-00001.                                  NC2474.2
   000545         054900*    MOVE    ZERO TO DOI-DU-01V00.                                NC2474.2
   000546         055000*    MOVE    ODO-XN-00001-O009D (1) TO WRK-XN-00001.              NC2474.2
   000547         055100*MOV-TEST-F1-5.                                                   NC2474.2
   000548         055200*    IF      WRK-XN-00001 = "*"                                   NC2474.2
   000549         055300*            PERFORM PASS                                         NC2474.2
   000550         055400*            GO TO MOV-WRITE-F1-5                                 NC2474.2
   000551         055500*    ELSE                                                         NC2474.2
   000552         055600*            GO TO MOV-FAIL-F1-5.                                 NC2474.2
   000553         055700 MOV-DELETE-F1-5.                                                 NC2474.2
   000554         055800     PERFORM DE-LETE.                                             NC2474.2 228
   000555         055900     GO TO   MOV-WRITE-F1-5.                                      NC2474.2 562
   000556         056000 MOV-FAIL-F1-5.                                                   NC2474.2
   000557         056100     MOVE    WRK-XN-00001 TO COMPUTED-A                           NC2474.2 69 87
   000558         056200     MOVE   "*"           TO CORRECT-A                            NC2474.2 101
   000559         056300     MOVE   "OCCURS ZERO TIMES - MOVE SHOULD HAVE FAILED"         NC2474.2
   000560         056400            TO RE-MARK                                            NC2474.2 81
   000561         056500     PERFORM FAIL.                                                NC2474.2 227
   000562         056600 MOV-WRITE-F1-5.                                                  NC2474.2
   000563         056700     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000564         056800*                                                                 NC2474.2
   000565         056900 MOV-INIT-F1-6.                                                   NC2474.2
   000566         057000     MOVE   "MOV-TEST-F1-6" TO PAR-NAME.                          NC2474.2 76
   000567         057100     MOVE   "VI-26 5.8.3 SR5" TO ANSI-REFERENCE.                  NC2474.2 132
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200     MOVE    9  TO DOI-DU-01V00.                                  NC2474.2 44
   000569         057300     MOVE   "P" TO ODO-XN-00001-O009D (1).                        NC2474.2 47
   000570         057400     MOVE   "Q" TO ODO-XN-00001-O009D (2).                        NC2474.2 47
   000571         057500     MOVE   "R" TO ODO-XN-00001-O009D (3).                        NC2474.2 47
   000572         057600     MOVE   "S" TO ODO-XN-00001-O009D (4).                        NC2474.2 47
   000573         057700     MOVE   "T" TO ODO-XN-00001-O009D (5).                        NC2474.2 47
   000574         057800     MOVE   "U" TO ODO-XN-00001-O009D (6).                        NC2474.2 47
   000575         057900     MOVE   "V" TO ODO-XN-00001-O009D (7).                        NC2474.2 47
   000576         058000     MOVE   "W" TO ODO-XN-00001-O009D (8).                        NC2474.2 47
   000577         058100     MOVE   "X" TO ODO-XN-00001-O009D (9).                        NC2474.2 47
   000578         058200     MOVE    3  TO NEW-DU-01V00.                                  NC2474.2 53
   000579         058300     MOVE    ODO-RECORD TO NEW-RECORD.                            NC2474.2 41 50
   000580         058400 MOV-TEST-F1-6.                                                   NC2474.2
   000581         058500     IF      NEW-GRP-00009 = "PQRSTUVWX"                          NC2474.2 55
   000582      1  058600             PERFORM PASS                                         NC2474.2 226
   000583      1  058700             GO TO MOV-WRITE-F1-6                                 NC2474.2 595
   000584         058800     ELSE                                                         NC2474.2
   000585      1  058900             GO TO MOV-FAIL-F1-6.                                 NC2474.2 589
   000586         059000 MOVE-DELETE-F1-6.                                                NC2474.2
   000587         059100     PERFORM DE-LETE.                                             NC2474.2 228
   000588         059200     GO TO   MOV-WRITE-F1-6.                                      NC2474.2 595
   000589         059300 MOV-FAIL-F1-6.                                                   NC2474.2
   000590         059400     MOVE    NEW-GRP-00009 TO COMPUTED-A                          NC2474.2 55 87
   000591         059500     MOVE   "PQRSTUVWX"   TO CORRECT-A                            NC2474.2 101
   000592         059600     MOVE   "ALL 9 FIELDS SHOULD BE MOVED IN GROUP MOVE"          NC2474.2
   000593         059700            TO RE-MARK                                            NC2474.2 81
   000594         059800     PERFORM FAIL.                                                NC2474.2 227
   000595         059900 MOV-WRITE-F1-6.                                                  NC2474.2
   000596         060000     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000597         060100*                                                                 NC2474.2
   000598         060200 SCH-INIT-F1-1.                                                   NC2474.2
   000599         060300     MOVE "SCH-TEST-F1-1" TO PAR-NAME.                            NC2474.2 76
   000600         060400     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000601         060500     MOVE "SEARCH FULL ODO TABLE" TO RE-MARK.                     NC2474.2 81
   000602         060600     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000603         060700     SET ODO-IX TO 1.                                             NC2474.2 49
   000604         060800 SCH-TEST-F1-1.                                                   NC2474.2
   000605         060900     SEARCH ODO-XN-00001-O009D                                    NC2474.2 47
   000606         061000         WHEN ODO-XN-00001-O009D (ODO-IX) IS EQUAL TO "7"         NC2474.2 47 49
   000607      1  061100             PERFORM PASS                                         NC2474.2 226
   000608      1  061200             GO TO SCH-WRITE-F1-1.                                NC2474.2 617
   000609         061300     GO TO SCH-FAIL-F1-1.                                         NC2474.2 613
   000610         061400 SCH-DELETE-F1-1.                                                 NC2474.2
   000611         061500     PERFORM DE-LETE.                                             NC2474.2 228
   000612         061600     GO TO SCH-WRITE-F1-1.                                        NC2474.2 617
   000613         061700 SCH-FAIL-F1-1.                                                   NC2474.2
   000614         061800     PERFORM FAIL.                                                NC2474.2 227
   000615         061900     MOVE "7 SHOULD BE FOUND" TO CORRECT-A                        NC2474.2 101
   000616         062000     MOVE "7 WAS NOT FOUND" TO COMPUTED-A.                        NC2474.2 87
   000617         062100 SCH-WRITE-F1-1.                                                  NC2474.2
   000618         062200     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000619         062300*                                                                 NC2474.2
   000620         062400 SCH-INIT-F1-2.                                                   NC2474.2
   000621         062500     MOVE "SCH-TEST-F1-2" TO PAR-NAME.                            NC2474.2 76
   000622         062600     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000623         062700     MOVE "SEARCH PARTIAL ODO TABLE" TO RE-MARK.                  NC2474.2 81
   000624         062800     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     MOVE 3 TO DOI-DU-01V00.                                      NC2474.2 44
   000626         063000     SET ODO-IX TO 1.                                             NC2474.2 49
   000627         063100 SCH-TEST-F1-2.                                                   NC2474.2
   000628         063200     SEARCH ODO-XN-00001-O009D                                    NC2474.2 47
   000629         063300         AT END                                                   NC2474.2
   000630      1  063400             PERFORM PASS                                         NC2474.2 226
   000631      1  063500             GO TO SCH-WRITE-F1-2                                 NC2474.2 641
   000632         063600         WHEN ODO-XN-00001-O009D (ODO-IX) IS EQUAL TO "7"         NC2474.2 47 49
   000633      1  063700             GO TO SCH-FAIL-F1-2.                                 NC2474.2 637
   000634         063800 SCH-DELETE-F1-2.                                                 NC2474.2
   000635         063900     PERFORM DE-LETE.                                             NC2474.2 228
   000636         064000     GO TO SCH-WRITE-F1-2.                                        NC2474.2 641
   000637         064100 SCH-FAIL-F1-2.                                                   NC2474.2
   000638         064200     PERFORM FAIL                                                 NC2474.2 227
   000639         064300     MOVE "7 SHOULDN""T BE FOUND" TO CORRECT-A                    NC2474.2 101
   000640         064400     MOVE "7 WAS FOUND" TO COMPUTED-A.                            NC2474.2 87
   000641         064500 SCH-WRITE-F1-2.                                                  NC2474.2
   000642         064600     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000643         064700*                                                                 NC2474.2
   000644         064800 SCH-INIT-F2-3.                                                   NC2474.2
   000645         064900     MOVE "SCH-TEST-F2-3" TO PAR-NAME.                            NC2474.2 76
   000646         065000     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000647         065100     MOVE "SEARCH ALL FULL ODO TABLE" TO RE-MARK.                 NC2474.2 81
   000648         065200     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000649         065300 SCH-TEST-F2-3.                                                   NC2474.2
   000650         065400     SEARCH ALL ODO-XN-00001-O009D                                NC2474.2 47
   000651         065500         WHEN ODO-XN-00001-O009D (ODO-IX) IS EQUAL TO "7"         NC2474.2 47 49
   000652      1  065600             PERFORM PASS                                         NC2474.2 226
   000653      1  065700             GO TO SCH-WRITE-F2-3.                                NC2474.2 662
   000654         065800     GO TO SCH-FAIL-F2-3.                                         NC2474.2 658
   000655         065900 SCH-DELETE-F2-3.                                                 NC2474.2
   000656         066000     PERFORM DE-LETE.                                             NC2474.2 228
   000657         066100     GO TO SCH-WRITE-F2-3.                                        NC2474.2 662
   000658         066200 SCH-FAIL-F2-3.                                                   NC2474.2
   000659         066300     PERFORM FAIL                                                 NC2474.2 227
   000660         066400     MOVE "7 SHOULD BE FOUND" TO CORRECT-A                        NC2474.2 101
   000661         066500     MOVE "7 WAS NOT FOUND" TO COMPUTED-A.                        NC2474.2 87
   000662         066600 SCH-WRITE-F2-3.                                                  NC2474.2
   000663         066700     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000664         066800*                                                                 NC2474.2
   000665         066900 SCH-INIT-4.                                                      NC2474.2
   000666         067000     MOVE "SCH-TEST-4" TO PAR-NAME.                               NC2474.2 76
   000667         067100     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000668         067200     MOVE "SEARCH ALL PARTIAL ODO TABLE" TO RE-MARK.              NC2474.2 81
   000669         067300     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000670         067400     MOVE 3 TO DOI-DU-01V00.                                      NC2474.2 44
   000671         067500 SCH-TEST-4.                                                      NC2474.2
   000672         067600     SEARCH ALL ODO-XN-00001-O009D                                NC2474.2 47
   000673         067700         AT END                                                   NC2474.2
   000674      1  067800             PERFORM PASS                                         NC2474.2 226
   000675      1  067900             GO TO SCH-WRITE-4                                    NC2474.2 685
   000676         068000         WHEN ODO-XN-00001-O009D (ODO-IX) IS EQUAL TO "7"         NC2474.2 47 49
   000677      1  068100             GO TO SCH-FAIL-4.                                    NC2474.2 681
   000678         068200 SCH-DELETE-4.                                                    NC2474.2
   000679         068300     PERFORM DE-LETE.                                             NC2474.2 228
   000680         068400     GO TO SCH-WRITE-4.                                           NC2474.2 685
   000681         068500 SCH-FAIL-4.                                                      NC2474.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600     PERFORM FAIL                                                 NC2474.2 227
   000683         068700     MOVE "7 SHOULDN""T BE FOUND" TO CORRECT-A                    NC2474.2 101
   000684         068800     MOVE "7 WAS FOUND" TO COMPUTED-A.                            NC2474.2 87
   000685         068900 SCH-WRITE-4.                                                     NC2474.2
   000686         069000     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000687         069100*                                                                 NC2474.2
   000688         069200 STR-INIT-GF-1.                                                   NC2474.2
   000689         069300     MOVE "STR-TEST-GF-1" TO PAR-NAME.                            NC2474.2 76
   000690         069400     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000691         069500     MOVE "STRING FULL ODO AND LITERAL"  TO RE-MARK.              NC2474.2 81
   000692         069600     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000693         069700     MOVE SPACES TO WRK-XN-00020.                                 NC2474.2 IMP 67
   000694         069800 STR-TEST-GF-1.                                                   NC2474.2
   000695         069900     STRING ODO-GRP-00009  "-TRAILER" DELIMITED BY SIZE           NC2474.2 46
   000696         070000         INTO WRK-XN-00020.                                       NC2474.2 67
   000697         070100     IF WRK-XN-00020 IS EQUAL TO "123456789-TRAILER   "           NC2474.2 67
   000698      1  070200         PERFORM PASS                                             NC2474.2 226
   000699      1  070300         GO TO STR-WRITE-GF-1                                     NC2474.2 709
   000700         070400     ELSE                                                         NC2474.2
   000701      1  070500         GO TO STR-FAIL-GF-1.                                     NC2474.2 705
   000702         070600 STR-DELETE-GF-1.                                                 NC2474.2
   000703         070700     PERFORM DE-LETE.                                             NC2474.2 228
   000704         070800     GO TO STR-WRITE-GF-1.                                        NC2474.2 709
   000705         070900 STR-FAIL-GF-1.                                                   NC2474.2
   000706         071000     PERFORM FAIL                                                 NC2474.2 227
   000707         071100     MOVE "123456789-TRAILER" TO CORRECT-A                        NC2474.2 101
   000708         071200     MOVE WRK-XN-00020 TO COMPUTED-A.                             NC2474.2 67 87
   000709         071300 STR-WRITE-GF-1.                                                  NC2474.2
   000710         071400     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000711         071500*                                                                 NC2474.2
   000712         071600 STR-INIT-GF-2.                                                   NC2474.2
   000713         071700     MOVE "STR-TEST-GF-2" TO PAR-NAME.                            NC2474.2 76
   000714         071800     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000715         071900     MOVE "STRING PARTIAL ODO AND LITERAL" TO RE-MARK.            NC2474.2 81
   000716         072000     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000717         072100     MOVE SPACES TO WRK-XN-00020.                                 NC2474.2 IMP 67
   000718         072200     MOVE 3 TO DOI-DU-01V00.                                      NC2474.2 44
   000719         072300 STR-TEST-GF-2.                                                   NC2474.2
   000720         072400     STRING ODO-GRP-00009 "-TRAILER" DELIMITED BY SIZE            NC2474.2 46
   000721         072500         INTO WRK-XN-00020.                                       NC2474.2 67
   000722         072600     IF WRK-XN-00020 IS EQUAL TO "123-TRAILER         "           NC2474.2 67
   000723      1  072700         PERFORM PASS                                             NC2474.2 226
   000724      1  072800         GO TO STR-WRITE-GF-2                                     NC2474.2 734
   000725         072900     ELSE                                                         NC2474.2
   000726      1  073000         GO TO STR-FAIL-GF-2.                                     NC2474.2 730
   000727         073100 STR-DELETE-GF-2.                                                 NC2474.2
   000728         073200     PERFORM DE-LETE.                                             NC2474.2 228
   000729         073300     GO TO STR-WRITE-GF-2.                                        NC2474.2 734
   000730         073400 STR-FAIL-GF-2.                                                   NC2474.2
   000731         073500     PERFORM FAIL                                                 NC2474.2 227
   000732         073600     MOVE "123-TRAILER" TO CORRECT-A                              NC2474.2 101
   000733         073700     MOVE WRK-XN-00020 TO COMPUTED-A.                             NC2474.2 67 87
   000734         073800 STR-WRITE-GF-2.                                                  NC2474.2
   000735         073900     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000736         074000*                                                                 NC2474.2
   000737         074100 STR-TEST-GF-3.                                                   NC2474.2
   000738         074200     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300     MOVE SPACES TO WRK-XN-00020.                                 NC2474.2 IMP 67
   000740         074400     MOVE 3 TO DOI-DU-01V00.                                      NC2474.2 44
   000741         074500     STRING "LEADER-" ODO-GRP-00009 DELIMITED BY SIZE             NC2474.2 46
   000742         074600         INTO WRK-XN-00020.                                       NC2474.2 67
   000743         074700     IF WRK-XN-00020 IS EQUAL TO "LEADER-123      "               NC2474.2 67
   000744      1  074800         PERFORM PASS                                             NC2474.2 226
   000745      1  074900         GO TO STR-WRITE-GF-3                                     NC2474.2 754
   000746         075000         ELSE                                                     NC2474.2
   000747      1  075100         PERFORM FAIL                                             NC2474.2 227
   000748      1  075200         MOVE "LEADER-123" TO CORRECT-A                           NC2474.2 101
   000749      1  075300         MOVE WRK-XN-00020 TO COMPUTED-A                          NC2474.2 67 87
   000750      1  075400         PERFORM STR-WRITE-GF-3                                   NC2474.2 754
   000751      1  075500         GO TO STR-DELETE-GF-4.                                   NC2474.2 774
   000752         075600 STR-DELETE-GF-3.                                                 NC2474.2
   000753         075700     PERFORM DE-LETE.                                             NC2474.2 228
   000754         075800 STR-WRITE-GF-3.                                                  NC2474.2
   000755         075900     MOVE "STR-TEST-GF-3" TO PAR-NAME.                            NC2474.2 76
   000756         076000     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000757         076100     MOVE "STRING LITERAL AND PARTIAL ODO" TO RE-MARK.            NC2474.2 81
   000758         076200     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000759         076300*                                                                 NC2474.2
   000760         076400 STR-INIT-GF-4.                                                   NC2474.2
   000761         076500     MOVE "STR-TEST-GF-4" TO PAR-NAME.                            NC2474.2 76
   000762         076600     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000763         076700     MOVE "PARTIAL ODO/UNNEEDED OVERFLOW" TO RE-MARK.             NC2474.2 81
   000764         076800     PERFORM INIT-WRK-AREA                                        NC2474.2 327
   000765         076900     MOVE SPACES TO WRK-XN-00010.                                 NC2474.2 IMP 68
   000766         077000     MOVE 3 TO DOI-DU-01V00.                                      NC2474.2 44
   000767         077100 STR-TEST-GF-4.                                                   NC2474.2
   000768         077200     STRING "LEADER-"  ODO-GRP-00009 DELIMITED BY SIZE            NC2474.2 46
   000769         077300         INTO WRK-XN-00010                                        NC2474.2 68
   000770         077400         ON OVERFLOW                                              NC2474.2
   000771      1  077500             GO TO STR-FAIL-GF-4.                                 NC2474.2 780
   000772         077600     PERFORM PASS.                                                NC2474.2 226
   000773         077700     GO TO STR-WRITE-GF-4.                                        NC2474.2 784
   000774         077800 STR-DELETE-GF-4.                                                 NC2474.2
   000775         077900     PERFORM DE-LETE.                                             NC2474.2 228
   000776         078000     MOVE "STR-TEST-GF-4" TO PAR-NAME.                            NC2474.2 76
   000777         078100     MOVE "DELETE AUTOMATIC IF" TO COMPUTED-A.                    NC2474.2 87
   000778         078200     MOVE "STR-TEST-GF-3 FAILS" TO CORRECT-A.                     NC2474.2 101
   000779         078300     GO TO STR-WRITE-GF-4.                                        NC2474.2 784
   000780         078400 STR-FAIL-GF-4.                                                   NC2474.2
   000781         078500     PERFORM FAIL                                                 NC2474.2 227
   000782         078600     MOVE "OVERFLOW EXIT TAKEN" TO COMPUTED-A                     NC2474.2 87
   000783         078700     MOVE "NO EXIT NECESSARY" TO CORRECT-A.                       NC2474.2 101
   000784         078800 STR-WRITE-GF-4.                                                  NC2474.2
   000785         078900     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000786         079000*                                                                 NC2474.2
   000787         079100 UST-INIT-GF-1.                                                   NC2474.2
   000788         079200     MOVE "UST-TEST-GF-1" TO PAR-NAME.                            NC2474.2 76
   000789         079300     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000790         079400     MOVE "UNSTRING FULL ODO" TO RE-MARK.                         NC2474.2 81
   000791         079500     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000792         079600     MOVE SPACES TO WRK-XN-00010 WRK-XN-00020.                    NC2474.2 IMP 68 67
   000793         079700 UST-TEST-GF-1.                                                   NC2474.2
   000794         079800     UNSTRING GRP-ODO INTO WRK-XN-00010 WRK-XN-00020.             NC2474.2 43 68 67
   000795         079900     IF WRK-XN-00020 IS EQUAL TO "123456789           "           NC2474.2 67
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796      1  080000         PERFORM PASS                                             NC2474.2 226
   000797      1  080100         GO TO UST-WRITE-GF-1                                     NC2474.2 807
   000798         080200     ELSE                                                         NC2474.2
   000799      1  080300         GO TO UST-FAIL-GF-1.                                     NC2474.2 803
   000800         080400 UST-DELETE-GF-1.                                                 NC2474.2
   000801         080500     PERFORM DE-LETE.                                             NC2474.2 228
   000802         080600     GO TO UST-WRITE-GF-1.                                        NC2474.2 807
   000803         080700 UST-FAIL-GF-1.                                                   NC2474.2
   000804         080800     PERFORM FAIL                                                 NC2474.2 227
   000805         080900     MOVE  WRK-XN-00020 TO COMPUTED-A                             NC2474.2 67 87
   000806         081000     MOVE "123456789" TO CORRECT-A.                               NC2474.2 101
   000807         081100 UST-WRITE-GF-1.                                                  NC2474.2
   000808         081200     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000809         081300*                                                                 NC2474.2
   000810         081400 UST-INIT-GF-2.                                                   NC2474.2
   000811         081500     MOVE "UST-TEST-GF-2" TO PAR-NAME.                            NC2474.2 76
   000812         081600     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000813         081700     MOVE "UNSTRING PARTIAL ODO" TO RE-MARK.                      NC2474.2 81
   000814         081800     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000815         081900     MOVE SPACES TO WRK-XN-00020  WRK-XN-00010.                   NC2474.2 IMP 67 68
   000816         082000     MOVE 3 TO DOI-DU-01V00.                                      NC2474.2 44
   000817         082100 UST-TEST-GF-2.                                                   NC2474.2
   000818         082200     UNSTRING GRP-ODO INTO WRK-XN-00010  WRK-XN-00020.            NC2474.2 43 68 67
   000819         082300     IF WRK-XN-00020 IS EQUAL TO "123                 "           NC2474.2 67
   000820      1  082400         PERFORM PASS                                             NC2474.2 226
   000821      1  082500         GO TO UST-WRITE-GF-2                                     NC2474.2 831
   000822         082600     ELSE                                                         NC2474.2
   000823      1  082700         GO TO UST-FAIL-GF-2.                                     NC2474.2 827
   000824         082800 UST-DELETE-GF-2.                                                 NC2474.2
   000825         082900     PERFORM DE-LETE.                                             NC2474.2 228
   000826         083000     GO TO UST-WRITE-GF-2.                                        NC2474.2 831
   000827         083100 UST-FAIL-GF-2.                                                   NC2474.2
   000828         083200     PERFORM FAIL                                                 NC2474.2 227
   000829         083300     MOVE WRK-XN-00020 TO COMPUTED-A                              NC2474.2 67 87
   000830         083400     MOVE "123" TO CORRECT-A.                                     NC2474.2 101
   000831         083500 UST-WRITE-GF-2.                                                  NC2474.2
   000832         083600     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000833         083700*                                                                 NC2474.2
   000834         083800 UST-INIT-GF-3.                                                   NC2474.2
   000835         083900     MOVE "UST-TEST-GF-3" TO PAR-NAME.                            NC2474.2 76
   000836         084000     MOVE "VI-26 5.8" TO ANSI-REFERENCE.                          NC2474.2 132
   000837         084100     MOVE "UNSTRING DELIMITED PARTIAL ODO" TO RE-MARK.            NC2474.2 81
   000838         084200     PERFORM INIT-WRK-AREA.                                       NC2474.2 327
   000839         084300     MOVE SPACES TO WRK-XN-00020.                                 NC2474.2 IMP 67
   000840         084400     MOVE 3 TO DOI-DU-01V00.                                      NC2474.2 44
   000841         084500 UST-TEST-GF-3.                                                   NC2474.2
   000842         084600     UNSTRING GRP-ODO DELIMITED BY "7" INTO WRK-XN-00020.         NC2474.2 43 67
   000843         084700     IF WRK-XN-00020 IS EQUAL TO "3 ACTIVE: 123       "           NC2474.2 67
   000844      1  084800         PERFORM PASS                                             NC2474.2 226
   000845      1  084900         GO TO UST-WRITE-GF-3                                     NC2474.2 855
   000846         085000     ELSE                                                         NC2474.2
   000847      1  085100         GO TO UST-FAIL-GF-3.                                     NC2474.2 851
   000848         085200 UST-DELETE-GF-3.                                                 NC2474.2
   000849         085300     PERFORM DE-LETE.                                             NC2474.2 228
   000850         085400     GO TO UST-WRITE-GF-3.                                        NC2474.2 855
   000851         085500 UST-FAIL-GF-3.                                                   NC2474.2
   000852         085600     PERFORM FAIL                                                 NC2474.2 227
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700     MOVE WRK-XN-00020 TO COMPUTED-A                              NC2474.2 67 87
   000854         085800     MOVE "3 ACTIVE: 123" TO CORRECT-A.                           NC2474.2 101
   000855         085900 UST-WRITE-GF-3.                                                  NC2474.2
   000856         086000     PERFORM PRINT-DETAIL.                                        NC2474.2 230
   000857         086100*                                                                 NC2474.2
   000858         086200 CCVS-EXIT SECTION.                                               NC2474.2
   000859         086300 CCVS-999999.                                                     NC2474.2
   000860         086400     GO TO CLOSE-FILES.                                           NC2474.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    19
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      132   ANSI-REFERENCE . . . . . . . .  304 311 320 M343 M365 M387 M410 M435 M458 M482 M509 M538 M567 M600 M622 M646
                                            M667 M690 M714 M756 M762 M789 M812 M836
      111   CCVS-C-1 . . . . . . . . . . .  248 290
      116   CCVS-C-2 . . . . . . . . . . .  249 291
      166   CCVS-E-1 . . . . . . . . . . .  254
      171   CCVS-E-2 . . . . . . . . . . .  263 270 277 282
      174   CCVS-E-2-2 . . . . . . . . . .  M262
      179   CCVS-E-3 . . . . . . . . . . .  283
      188   CCVS-E-4 . . . . . . . . . . .  262
      189   CCVS-E-4-1 . . . . . . . . . .  M260
      191   CCVS-E-4-2 . . . . . . . . . .  M261
      133   CCVS-H-1 . . . . . . . . . . .  243
      138   CCVS-H-2A. . . . . . . . . . .  244
      147   CCVS-H-2B. . . . . . . . . . .  245
      159   CCVS-H-3 . . . . . . . . . . .  246
      209   CCVS-PGM-ID. . . . . . . . . .  215 215
       93   CM-18V0
       87   COMPUTED-A . . . . . . . . . .  88 90 91 92 93 316 319 M358 M381 M452 M476 M503 M531 M557 M590 M616 M640 M661
                                            M684 M708 M733 M749 M777 M782 M805 M829 M853
       88   COMPUTED-N
       86   COMPUTED-X . . . . . . . . . .  M238 302
       90   COMPUTED-0V18
       92   COMPUTED-14V4
       94   COMPUTED-18V0. . . . . . . . .  M404 M429
       91   COMPUTED-4V14
      110   COR-ANSI-REFERENCE . . . . . .  M311 M313
      101   CORRECT-A. . . . . . . . . . .  102 103 104 105 106 317 319 M357 M380 M451 M475 M502 M532 M558 M591 M615 M639
                                            M660 M683 M707 M732 M748 M778 M783 M806 M830 M854
      102   CORRECT-N
      100   CORRECT-X. . . . . . . . . . .  M239 303
      103   CORRECT-0V18
      105   CORRECT-14V4
      107   CORRECT-18V0 . . . . . . . . .  M403 M428
      104   CORRECT-4V14
      106   CR-18V0
      124   DELETE-COUNTER . . . . . . . .  M228 257 273 275
       44   DOI-DU-01V00 . . . . . . . . .  48 M329 M367 M412 M462 M484 M490 M511 M517 M568 M625 M670 M718 M740 M766 M816
                                            M840
       79   DOTVALUE . . . . . . . . . . .  M233
      130   DUMMY-HOLD . . . . . . . . . .  M287 293
       39   DUMMY-RECORD . . . . . . . . .  M243 M244 M245 M246 M248 M249 M250 M252 M254 M263 M270 M277 M282 M283 287 M288
                                            289 M290 M291 M292 M293 297 M298 M306 M321
      177   ENDER-DESC . . . . . . . . . .  M265 M276 M281
      125   ERROR-COUNTER. . . . . . . . .  M227 256 266 269
      129   ERROR-HOLD . . . . . . . . . .  M256 M257 M257 M258 261
      175   ERROR-TOTAL. . . . . . . . . .  M267 M269 M274 M275 M279 M280
       72   FEATURE. . . . . . . . . . . .  M344
       43   GRP-ODO. . . . . . . . . . . .  347 370 439 463 M489 492 503 M516 518 521 794 818 842
      203   HYPHEN-LINE. . . . . . . . . .  250 252 292
      169   ID-AGAIN . . . . . . . . . . .  M215
      202   INF-ANSI-REFERENCE . . . . . .  M304 M307 M320 M322
      197   INFO-TEXT. . . . . . . . . . .  M305
      126   INSPECT-COUNTER. . . . . . . .  M225 256 278 280
       53   NEW-DU-01V00 . . . . . . . . .  57 M578
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    20
0 Defined   Cross-reference of data names   References

0      55   NEW-GRP-00009. . . . . . . . .  581 590
       58   NEW-IX
       52   NEW-ODO
       50   NEW-RECORD . . . . . . . . . .  M579
       56   NEW-XN-00001-O009D . . . . . .  57
       54   NEW-XN-00009
       46   ODO-GRP-00009. . . . . . . . .  392 417 695 720 741 768
       49   ODO-IX . . . . . . . . . . . .  M603 606 M626 632 651 676
       41   ODO-RECORD . . . . . . . . . .  579
       47   ODO-XN-00001-O009D . . . . . .  48 M331 M332 M333 M334 M335 M336 M337 M338 M339 M485 M486 M487 M488 M512 M513
                                            M514 M515 M569 M570 M571 M572 M573 M574 M575 M576 M577 605 606 628 632 650 651
                                            672 676
       45   ODO-XN-00009 . . . . . . . . .  M330
       74   P-OR-F . . . . . . . . . . . .  M225 M226 M227 M228 235 M238
       76   PAR-NAME . . . . . . . . . . .  M240 M342 M364 M386 M409 M434 M457 M481 M508 M537 M566 M599 M621 M645 M666 M689
                                            M713 M755 M761 M776 M788 M811 M835
       78   PARDOT-X . . . . . . . . . . .  M232
      127   PASS-COUNTER . . . . . . . . .  M226 258 260
       37   PRINT-FILE . . . . . . . . . .  33 214 220
       38   PRINT-REC. . . . . . . . . . .  M234 M310 M312
       81   RE-MARK. . . . . . . . . . . .  M229 M241 M345 M363 M388 M415 M436 M459 M483 M510 M560 M593 M601 M623 M647 M668
                                            M691 M715 M757 M763 M790 M813 M837
      123   REC-CT . . . . . . . . . . . .  231 233 240
      122   REC-SKL-SUB
      131   RECORD-COUNT . . . . . . . . .  M285 286 M294
       59   STATIC-VALUE . . . . . . . . .  328 345 347 388 441 451
       82   TEST-COMPUTED. . . . . . . . .  310
       97   TEST-CORRECT . . . . . . . . .  312
      150   TEST-ID. . . . . . . . . . . .  M215
       70   TEST-RESULTS . . . . . . . . .  M216 234
      128   TOTAL-ERROR
       63   WRK-DU-01V00 . . . . . . . . .  M367 M412 M519
       66   WRK-DU-05V00 . . . . . . . . .  M390 M392 393 404 M412 M414 M417 418 429
       62   WRK-GRP-00019. . . . . . . . .  M328 363 370 415 M438 M439 441 452 M461 M463 465 476 M518 531
       69   WRK-XN-00001 . . . . . . . . .  557
       64   WRK-XN-00009-1
       65   WRK-XN-00009-2 . . . . . . . .  M368 M413
       68   WRK-XN-00010 . . . . . . . . .  M765 M769 M792 M794 M815 M818
       67   WRK-XN-00020 . . . . . . . . .  M693 M696 697 708 M717 M721 722 733 M739 M742 743 749 M792 M794 795 805 M815
                                            M818 819 829 M839 M842 843 853
      199   XXCOMPUTED . . . . . . . . . .  M319
      201   XXCORRECT. . . . . . . . . . .  M319
      194   XXINFO . . . . . . . . . . . .  306 321
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    21
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

      315   BAIL-OUT . . . . . . . . . . .  P237
      323   BAIL-OUT-EX. . . . . . . . . .  E237 G317
      318   BAIL-OUT-WRITE . . . . . . . .  G316
      299   BLANK-LINE-PRINT
      858   CCVS-EXIT
      859   CCVS-999999
      212   CCVS1
      324   CCVS1-EXIT . . . . . . . . . .  G218
      219   CLOSE-FILES. . . . . . . . . .  G860
      247   COLUMN-NAMES-ROUTINE . . . . .  E217
      228   DE-LETE. . . . . . . . . . . .  P353 P376 P399 P424 P447 P471 P498 P527 P554 P587 P611 P635 P656 P679 P703 P728
                                            P753 P775 P801 P825 P849
      251   END-ROUTINE. . . . . . . . . .  P220
      255   END-ROUTINE-1
      264   END-ROUTINE-12
      272   END-ROUTINE-13 . . . . . . . .  E220
      253   END-RTN-EXIT
      227   FAIL . . . . . . . . . . . . .  P356 P379 P402 P427 P450 P474 P501 P530 P561 P594 P614 P638 P659 P682 P706 P731
                                            P747 P781 P804 P828 P852
      301   FAIL-ROUTINE . . . . . . . . .  P236
      314   FAIL-ROUTINE-EX. . . . . . . .  E236 G308
      309   FAIL-ROUTINE-WRITE . . . . . .  G302 G303
      242   HEAD-ROUTINE . . . . . . . . .  P217
      352   IF-DELETE-GF-1
      375   IF-DELETE-GF-2
      355   IF-FAIL-GF-1 . . . . . . . . .  G351
      378   IF-FAIL-GF-2 . . . . . . . . .  G374
      341   IF-INIT-GF-1
      362   IF-INIT-GF-2
      346   IF-TEST-GF-1
      369   IF-TEST-GF-2
      359   IF-WRITE-GF-1. . . . . . . . .  G349 G354
      382   IF-WRITE-GF-2. . . . . . . . .  G372 G377
      327   INIT-WRK-AREA. . . . . . . . .  P366 P389 P411 P437 P460 P602 P624 P648 P669 P692 P716 P738 P764 P791 P814 P838
      398   INS-DELETE-F1-1
      423   INS-DELETE-F1-2
      401   INS-FAIL-F1-1. . . . . . . . .  G397
      426   INS-FAIL-F1-2. . . . . . . . .  G422
      385   INS-INIT-F1-1
      408   INS-INIT-F1-2
      391   INS-TEST-F1-1
      416   INS-TEST-F1-2
      405   INS-WRITE-F1-1 . . . . . . . .  G395 G400
      430   INS-WRITE-F1-2 . . . . . . . .  G420 G425
      225   INSPT
      446   MOV-DELETE-F1-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    22
0 Defined   Cross-reference of procedures   References

0     470   MOV-DELETE-F1-2
      497   MOV-DELETE-F1-3
      526   MOV-DELETE-F1-4
      553   MOV-DELETE-F1-5
      449   MOV-FAIL-F1-1. . . . . . . . .  G445
      473   MOV-FAIL-F1-2. . . . . . . . .  G469
      500   MOV-FAIL-F1-3. . . . . . . . .  G496
      529   MOV-FAIL-F1-4. . . . . . . . .  G525
      556   MOV-FAIL-F1-5
      589   MOV-FAIL-F1-6. . . . . . . . .  G585
      433   MOV-INIT-F1-1
      456   MOV-INIT-F1-2
      480   MOV-INIT-F1-3
      507   MOV-INIT-F1-4
      536   MOV-INIT-F1-5
      565   MOV-INIT-F1-6
      440   MOV-TEST-F1-1
      464   MOV-TEST-F1-2
      491   MOV-TEST-F1-3
      520   MOV-TEST-F1-4
      580   MOV-TEST-F1-6
      453   MOV-WRITE-F1-1 . . . . . . . .  G443 G448
      477   MOV-WRITE-F1-2 . . . . . . . .  G467 G472
      504   MOV-WRITE-F1-3 . . . . . . . .  G494 G499
      533   MOV-WRITE-F1-4 . . . . . . . .  G523 G528
      562   MOV-WRITE-F1-5 . . . . . . . .  G555
      595   MOV-WRITE-F1-6 . . . . . . . .  G583 G588
      586   MOVE-DELETE-F1-6
      213   OPEN-FILES
      226   PASS . . . . . . . . . . . . .  P348 P371 P394 P419 P442 P466 P493 P522 P582 P607 P630 P652 P674 P698 P723 P744
                                            P772 P796 P820 P844
      230   PRINT-DETAIL . . . . . . . . .  P360 P383 P406 P431 P454 P478 P505 P534 P563 P596 P618 P642 P663 P686 P710 P735
                                            P758 P785 P808 P832 P856
      610   SCH-DELETE-F1-1
      634   SCH-DELETE-F1-2
      655   SCH-DELETE-F2-3
      678   SCH-DELETE-4
      613   SCH-FAIL-F1-1. . . . . . . . .  G609
      637   SCH-FAIL-F1-2. . . . . . . . .  G633
      658   SCH-FAIL-F2-3. . . . . . . . .  G654
      681   SCH-FAIL-4 . . . . . . . . . .  G677
      598   SCH-INIT-F1-1
      620   SCH-INIT-F1-2
      644   SCH-INIT-F2-3
      665   SCH-INIT-4
      604   SCH-TEST-F1-1
      627   SCH-TEST-F1-2
      649   SCH-TEST-F2-3
      671   SCH-TEST-4
      617   SCH-WRITE-F1-1 . . . . . . . .  G608 G612
      641   SCH-WRITE-F1-2 . . . . . . . .  G631 G636
      662   SCH-WRITE-F2-3 . . . . . . . .  G653 G657
      685   SCH-WRITE-4. . . . . . . . . .  G675 G680
      326   SECT-NC247A-001
      702   STR-DELETE-GF-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    23
0 Defined   Cross-reference of procedures   References

0     727   STR-DELETE-GF-2
      752   STR-DELETE-GF-3
      774   STR-DELETE-GF-4. . . . . . . .  G751
      705   STR-FAIL-GF-1. . . . . . . . .  G701
      730   STR-FAIL-GF-2. . . . . . . . .  G726
      780   STR-FAIL-GF-4. . . . . . . . .  G771
      688   STR-INIT-GF-1
      712   STR-INIT-GF-2
      760   STR-INIT-GF-4
      694   STR-TEST-GF-1
      719   STR-TEST-GF-2
      737   STR-TEST-GF-3
      767   STR-TEST-GF-4
      709   STR-WRITE-GF-1 . . . . . . . .  G699 G704
      734   STR-WRITE-GF-2 . . . . . . . .  G724 G729
      754   STR-WRITE-GF-3 . . . . . . . .  G745 P750
      784   STR-WRITE-GF-4 . . . . . . . .  G773 G779
      223   TERMINATE-CALL
      221   TERMINATE-CCVS
      800   UST-DELETE-GF-1
      824   UST-DELETE-GF-2
      848   UST-DELETE-GF-3
      803   UST-FAIL-GF-1. . . . . . . . .  G799
      827   UST-FAIL-GF-2. . . . . . . . .  G823
      851   UST-FAIL-GF-3. . . . . . . . .  G847
      787   UST-INIT-GF-1
      810   UST-INIT-GF-2
      834   UST-INIT-GF-3
      793   UST-TEST-GF-1
      817   UST-TEST-GF-2
      841   UST-TEST-GF-3
      807   UST-WRITE-GF-1 . . . . . . . .  G797 G802
      831   UST-WRITE-GF-2 . . . . . . . .  G821 G826
      855   UST-WRITE-GF-3 . . . . . . . .  G845 G850
      284   WRITE-LINE . . . . . . . . . .  P234 P235 P243 P244 P245 P246 P248 P249 P250 P252 P254 P263 P271 P277 P282 P283
                                            P306 P310 P312 P321
      296   WRT-LN . . . . . . . . . . . .  P290 P291 P292 P295 P300
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    24
0 Defined   Cross-reference of programs     References

        3   NC247A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC247A    Date 06/04/2022  Time 11:57:21   Page    25
0LineID  Message code  Message text

     37  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC247A:
 *    Source records = 860
 *    Data Division statements = 84
 *    Procedure Division statements = 492
 *    Generated COBOL statements = 0
 *    Program complexity factor = 501
0End of compilation 1,  program NC247A,  highest severity 0.
0Return code 0
