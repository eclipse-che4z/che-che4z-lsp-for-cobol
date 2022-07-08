1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:40   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:40   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1144.2
   000002         000200 PROGRAM-ID.                                                      IC1144.2
   000003         000300     IC114A.                                                      IC1144.2
   000004         000500*                                                              *  IC1144.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1144.2
   000006         000700*                                                              *  IC1144.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1144.2
   000008         000900*                                                              *  IC1144.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1144.2
   000010         001100*                                                              *  IC1144.2
   000011         001300*                                                              *  IC1144.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1144.2
   000013         001500*                                                              *  IC1144.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1144.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1144.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1144.2
   000017         001900*                                                              *  IC1144.2
   000018         002100*                                                                 IC1144.2
   000019         002200*         THE ROUTINE IC114 IS A MAIN PROGRAM WHICH CALLS THE     IC1144.2
   000020         002300*    SUBPROGRAM IC115.  THE PURPOSE OF THESE PROGRAMS IS TO       IC1144.2
   000021         002400*    VERIFY THAT A FILE SECTION, A WORKING-STORAGE SECTION, AND   IC1144.2
   000022         002500*    A LINKAGE SECTION CAN APPEAR IN A SUBPROGRAM, AND A FILE     IC1144.2
   000023         002600*    CAN BE WRITTEN AND READ WITHIN A SUBPROGRAM.                 IC1144.2
   000024         002700*                                                                 IC1144.2
   000025         002800*         THE PROGRAM IC114 CALLS IC115 TO CREATE AND VERIFY THE  IC1144.2
   000026         002900*    FILE.  SUBSEQUENT CALLS TO THE SUBPROGRAM ARE MADE TO READ   IC1144.2
   000027         003000*    THE FILE AND RETURN A RECORD TO THE MAIN PROGRAM WHICH CHECKSIC1144.2
   000028         003100*    THE RECORD CONTENTS.                                         IC1144.2
   000029         003200*                                                                 IC1144.2
   000030         003300*         THE SUBPROGRAM IC115 IS ADAPTED FROM THE SEQUENTIAL I-O IC1144.2
   000031         003400*    ROUTINE SQ104.  IF SQ104 DOES NOT EXECUTE CORRECTLY THEN     IC1144.2
   000032         003500*    THE RESULTS OF THESE TESTS ARE INCONCLUSIVE.                 IC1144.2
   000033         003600*                                                                 IC1144.2
   000034         003800 ENVIRONMENT DIVISION.                                            IC1144.2
   000035         003900 CONFIGURATION SECTION.                                           IC1144.2
   000036         004000 SOURCE-COMPUTER.                                                 IC1144.2
   000037         004100     XXXXX082.                                                    IC1144.2
   000038         004200 OBJECT-COMPUTER.                                                 IC1144.2
   000039         004300     XXXXX083.                                                    IC1144.2
   000040         004400 INPUT-OUTPUT SECTION.                                            IC1144.2
   000041         004500 FILE-CONTROL.                                                    IC1144.2
   000042         004600     SELECT PRINT-FILE ASSIGN TO                                  IC1144.2 46
   000043         004700     XXXXX055.                                                    IC1144.2
   000044         004800 DATA DIVISION.                                                   IC1144.2
   000045         004900 FILE SECTION.                                                    IC1144.2
   000046         005000 FD  PRINT-FILE.                                                  IC1144.2

 ==000046==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000047         005100 01  PRINT-REC PICTURE X(120).                                    IC1144.2
   000048         005200 01  DUMMY-RECORD PICTURE X(120).                                 IC1144.2
   000049         005300 WORKING-STORAGE SECTION.                                         IC1144.2
   000050         005400 01  GROUP-LINKAGE-VARIABLES.                                     IC1144.2
   000051         005500         02  COUNT-OF-RECORDS  PICTURE 9(6).                      IC1144.2
   000052         005600     02  RECORDS-IN-ERROR  PICTURE 9(6).                          IC1144.2
   000053         005700     02  ERROR-FLAG  PICTURE 9.                                   IC1144.2
   000054         005800     02  EOF-FLAG  PICTURE 9.                                     IC1144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02  CALL-FLAG  PICTURE 9.                                    IC1144.2
   000056         006000 01  FILE-REC-SQ-FS3.                                             IC1144.2
   000057         006100     02  XFILE-NAME-GROUP.                                        IC1144.2
   000058         006200         03  FILLER   PIC X(5).                                   IC1144.2
   000059         006300         03  XFILE-NAME   PIC X(6).                               IC1144.2
   000060         006400     02  XRECORD-NAME-GROUP.                                      IC1144.2
   000061         006500         03  FILLER   PIC X(8).                                   IC1144.2
   000062         006600         03  XRECORD-NAME   PIC X(6).                             IC1144.2
   000063         006700     02  REELUNIT-NUMBER-GROUP.                                   IC1144.2
   000064         006800         03  FILLER   PIC X(1).                                   IC1144.2
   000065         006900         03  REELUNIT-NUMBER   PIC 9(1).                          IC1144.2
   000066         007000     02  FILLER   PIC X(7).                                       IC1144.2
   000067         007100     02  XRECORD-NUMBER   PIC 9(6).                               IC1144.2
   000068         007200     02  FILLER   PIC X(79).                                      IC1144.2
   000069         007300     02  XLABEL-TYPE   PIC X(1).                                  IC1144.2
   000070         007400 01  TEST-RESULTS.                                                IC1144.2
   000071         007500     02 FILLER                   PIC X      VALUE SPACE.          IC1144.2 IMP
   000072         007600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC1144.2 IMP
   000073         007700     02 FILLER                   PIC X      VALUE SPACE.          IC1144.2 IMP
   000074         007800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC1144.2 IMP
   000075         007900     02 FILLER                   PIC X      VALUE SPACE.          IC1144.2 IMP
   000076         008000     02  PAR-NAME.                                                IC1144.2
   000077         008100       03 FILLER                 PIC X(19)  VALUE SPACE.          IC1144.2 IMP
   000078         008200       03  PARDOT-X              PIC X      VALUE SPACE.          IC1144.2 IMP
   000079         008300       03 DOTVALUE               PIC 99     VALUE ZERO.           IC1144.2 IMP
   000080         008400     02 FILLER                   PIC X(8)   VALUE SPACE.          IC1144.2 IMP
   000081         008500     02 RE-MARK                  PIC X(61).                       IC1144.2
   000082         008600 01  TEST-COMPUTED.                                               IC1144.2
   000083         008700     02 FILLER                   PIC X(30)  VALUE SPACE.          IC1144.2 IMP
   000084         008800     02 FILLER                   PIC X(17)  VALUE                 IC1144.2
   000085         008900            "       COMPUTED=".                                   IC1144.2
   000086         009000     02 COMPUTED-X.                                               IC1144.2
   000087         009100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC1144.2 IMP
   000088         009200     03 COMPUTED-N               REDEFINES COMPUTED-A             IC1144.2 87
   000089         009300                                 PIC -9(9).9(9).                  IC1144.2
   000090         009400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC1144.2 87
   000091         009500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC1144.2 87
   000092         009600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC1144.2 87
   000093         009700     03       CM-18V0 REDEFINES COMPUTED-A.                       IC1144.2 87
   000094         009800         04 COMPUTED-18V0                    PIC -9(18).          IC1144.2
   000095         009900         04 FILLER                           PIC X.               IC1144.2
   000096         010000     03 FILLER PIC X(50) VALUE SPACE.                             IC1144.2 IMP
   000097         010100 01  TEST-CORRECT.                                                IC1144.2
   000098         010200     02 FILLER PIC X(30) VALUE SPACE.                             IC1144.2 IMP
   000099         010300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC1144.2
   000100         010400     02 CORRECT-X.                                                IC1144.2
   000101         010500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC1144.2 IMP
   000102         010600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC1144.2 101
   000103         010700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC1144.2 101
   000104         010800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC1144.2 101
   000105         010900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC1144.2 101
   000106         011000     03      CR-18V0 REDEFINES CORRECT-A.                         IC1144.2 101
   000107         011100         04 CORRECT-18V0                     PIC -9(18).          IC1144.2
   000108         011200         04 FILLER                           PIC X.               IC1144.2
   000109         011300     03 FILLER PIC X(2) VALUE SPACE.                              IC1144.2 IMP
   000110         011400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC1144.2 IMP
   000111         011500 01  CCVS-C-1.                                                    IC1144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC1144.2
   000113         011700-    "SS  PARAGRAPH-NAME                                          IC1144.2
   000114         011800-    "       REMARKS".                                            IC1144.2
   000115         011900     02 FILLER                     PIC X(20)    VALUE SPACE.      IC1144.2 IMP
   000116         012000 01  CCVS-C-2.                                                    IC1144.2
   000117         012100     02 FILLER                     PIC X        VALUE SPACE.      IC1144.2 IMP
   000118         012200     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC1144.2
   000119         012300     02 FILLER                     PIC X(15)    VALUE SPACE.      IC1144.2 IMP
   000120         012400     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC1144.2
   000121         012500     02 FILLER                     PIC X(94)    VALUE SPACE.      IC1144.2 IMP
   000122         012600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC1144.2 IMP
   000123         012700 01  REC-CT                        PIC 99       VALUE ZERO.       IC1144.2 IMP
   000124         012800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC1144.2 IMP
   000125         012900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC1144.2 IMP
   000126         013000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC1144.2 IMP
   000127         013100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC1144.2 IMP
   000128         013200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC1144.2 IMP
   000129         013300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC1144.2 IMP
   000130         013400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC1144.2 IMP
   000131         013500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC1144.2 IMP
   000132         013600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC1144.2 IMP
   000133         013700 01  CCVS-H-1.                                                    IC1144.2
   000134         013800     02  FILLER                    PIC X(39)    VALUE SPACES.     IC1144.2 IMP
   000135         013900     02  FILLER                    PIC X(42)    VALUE             IC1144.2
   000136         014000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC1144.2
   000137         014100     02  FILLER                    PIC X(39)    VALUE SPACES.     IC1144.2 IMP
   000138         014200 01  CCVS-H-2A.                                                   IC1144.2
   000139         014300   02  FILLER                        PIC X(40)  VALUE SPACE.      IC1144.2 IMP
   000140         014400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC1144.2
   000141         014500   02  FILLER                        PIC XXXX   VALUE             IC1144.2
   000142         014600     "4.2 ".                                                      IC1144.2
   000143         014700   02  FILLER                        PIC X(28)  VALUE             IC1144.2
   000144         014800            " COPY - NOT FOR DISTRIBUTION".                       IC1144.2
   000145         014900   02  FILLER                        PIC X(41)  VALUE SPACE.      IC1144.2 IMP
   000146         015000                                                                  IC1144.2
   000147         015100 01  CCVS-H-2B.                                                   IC1144.2
   000148         015200   02  FILLER                        PIC X(15)  VALUE             IC1144.2
   000149         015300            "TEST RESULT OF ".                                    IC1144.2
   000150         015400   02  TEST-ID                       PIC X(9).                    IC1144.2
   000151         015500   02  FILLER                        PIC X(4)   VALUE             IC1144.2
   000152         015600            " IN ".                                               IC1144.2
   000153         015700   02  FILLER                        PIC X(12)  VALUE             IC1144.2
   000154         015800     " HIGH       ".                                              IC1144.2
   000155         015900   02  FILLER                        PIC X(22)  VALUE             IC1144.2
   000156         016000            " LEVEL VALIDATION FOR ".                             IC1144.2
   000157         016100   02  FILLER                        PIC X(58)  VALUE             IC1144.2
   000158         016200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1144.2
   000159         016300 01  CCVS-H-3.                                                    IC1144.2
   000160         016400     02  FILLER                      PIC X(34)  VALUE             IC1144.2
   000161         016500            " FOR OFFICIAL USE ONLY    ".                         IC1144.2
   000162         016600     02  FILLER                      PIC X(58)  VALUE             IC1144.2
   000163         016700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1144.2
   000164         016800     02  FILLER                      PIC X(28)  VALUE             IC1144.2
   000165         016900            "  COPYRIGHT   1985 ".                                IC1144.2
   000166         017000 01  CCVS-E-1.                                                    IC1144.2
   000167         017100     02 FILLER                       PIC X(52)  VALUE SPACE.      IC1144.2 IMP
   000168         017200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC1144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02 ID-AGAIN                     PIC X(9).                    IC1144.2
   000170         017400     02 FILLER                       PIC X(45)  VALUE SPACES.     IC1144.2 IMP
   000171         017500 01  CCVS-E-2.                                                    IC1144.2
   000172         017600     02  FILLER                      PIC X(31)  VALUE SPACE.      IC1144.2 IMP
   000173         017700     02  FILLER                      PIC X(21)  VALUE SPACE.      IC1144.2 IMP
   000174         017800     02 CCVS-E-2-2.                                               IC1144.2
   000175         017900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC1144.2 IMP
   000176         018000         03 FILLER                   PIC X      VALUE SPACE.      IC1144.2 IMP
   000177         018100         03 ENDER-DESC               PIC X(44)  VALUE             IC1144.2
   000178         018200            "ERRORS ENCOUNTERED".                                 IC1144.2
   000179         018300 01  CCVS-E-3.                                                    IC1144.2
   000180         018400     02  FILLER                      PIC X(22)  VALUE             IC1144.2
   000181         018500            " FOR OFFICIAL USE ONLY".                             IC1144.2
   000182         018600     02  FILLER                      PIC X(12)  VALUE SPACE.      IC1144.2 IMP
   000183         018700     02  FILLER                      PIC X(58)  VALUE             IC1144.2
   000184         018800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1144.2
   000185         018900     02  FILLER                      PIC X(13)  VALUE SPACE.      IC1144.2 IMP
   000186         019000     02 FILLER                       PIC X(15)  VALUE             IC1144.2
   000187         019100             " COPYRIGHT 1985".                                   IC1144.2
   000188         019200 01  CCVS-E-4.                                                    IC1144.2
   000189         019300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC1144.2 IMP
   000190         019400     02 FILLER                       PIC X(4)   VALUE " OF ".     IC1144.2
   000191         019500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC1144.2 IMP
   000192         019600     02 FILLER                       PIC X(40)  VALUE             IC1144.2
   000193         019700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC1144.2
   000194         019800 01  XXINFO.                                                      IC1144.2
   000195         019900     02 FILLER                       PIC X(19)  VALUE             IC1144.2
   000196         020000            "*** INFORMATION ***".                                IC1144.2
   000197         020100     02 INFO-TEXT.                                                IC1144.2
   000198         020200       04 FILLER                     PIC X(8)   VALUE SPACE.      IC1144.2 IMP
   000199         020300       04 XXCOMPUTED                 PIC X(20).                   IC1144.2
   000200         020400       04 FILLER                     PIC X(5)   VALUE SPACE.      IC1144.2 IMP
   000201         020500       04 XXCORRECT                  PIC X(20).                   IC1144.2
   000202         020600     02 INF-ANSI-REFERENCE           PIC X(48).                   IC1144.2
   000203         020700 01  HYPHEN-LINE.                                                 IC1144.2
   000204         020800     02 FILLER  PIC IS X VALUE IS SPACE.                          IC1144.2 IMP
   000205         020900     02 FILLER  PIC IS X(65)    VALUE IS "************************IC1144.2
   000206         021000-    "*****************************************".                 IC1144.2
   000207         021100     02 FILLER  PIC IS X(54)    VALUE IS "************************IC1144.2
   000208         021200-    "******************************".                            IC1144.2
   000209         021300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC1144.2
   000210         021400     "IC114A".                                                    IC1144.2
   000211         021500 PROCEDURE DIVISION.                                              IC1144.2
   000212         021600 CCVS1 SECTION.                                                   IC1144.2
   000213         021700 OPEN-FILES.                                                      IC1144.2
   000214         021800     OPEN     OUTPUT PRINT-FILE.                                  IC1144.2 46
   000215         021900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC1144.2 209 150 209 169
   000216         022000     MOVE    SPACE TO TEST-RESULTS.                               IC1144.2 IMP 70
   000217         022100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC1144.2 242 247
   000218         022200     GO TO CCVS1-EXIT.                                            IC1144.2 324
   000219         022300 CLOSE-FILES.                                                     IC1144.2
   000220         022400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC1144.2 251 272 46
   000221         022500 TERMINATE-CCVS.                                                  IC1144.2
   000222         022600     EXIT PROGRAM.                                                IC1144.2
   000223         022700 TERMINATE-CALL.                                                  IC1144.2
   000224         022800     STOP     RUN.                                                IC1144.2
   000225         022900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC1144.2 74 126
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC1144.2 74 127
   000227         023100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC1144.2 74 125
   000228         023200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC1144.2 74 124
   000229         023300     MOVE "****TEST DELETED****" TO RE-MARK.                      IC1144.2 81
   000230         023400 PRINT-DETAIL.                                                    IC1144.2
   000231         023500     IF REC-CT NOT EQUAL TO ZERO                                  IC1144.2 123 IMP
   000232      1  023600             MOVE "." TO PARDOT-X                                 IC1144.2 78
   000233      1  023700             MOVE REC-CT TO DOTVALUE.                             IC1144.2 123 79
   000234         023800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC1144.2 70 47 284
   000235         023900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC1144.2 74 284
   000236      1  024000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC1144.2 301 314
   000237      1  024100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC1144.2 315 323
   000238         024200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC1144.2 IMP 74 IMP 86
   000239         024300     MOVE SPACE TO CORRECT-X.                                     IC1144.2 IMP 100
   000240         024400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC1144.2 123 IMP IMP 76
   000241         024500     MOVE     SPACE TO RE-MARK.                                   IC1144.2 IMP 81
   000242         024600 HEAD-ROUTINE.                                                    IC1144.2
   000243         024700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC1144.2 133 48 284
   000244         024800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC1144.2 138 48 284
   000245         024900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC1144.2 147 48 284
   000246         025000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC1144.2 159 48 284
   000247         025100 COLUMN-NAMES-ROUTINE.                                            IC1144.2
   000248         025200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1144.2 111 48 284
   000249         025300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1144.2 116 48 284
   000250         025400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC1144.2 203 48 284
   000251         025500 END-ROUTINE.                                                     IC1144.2
   000252         025600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC1144.2 203 48 284
   000253         025700 END-RTN-EXIT.                                                    IC1144.2
   000254         025800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1144.2 166 48 284
   000255         025900 END-ROUTINE-1.                                                   IC1144.2
   000256         026000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC1144.2 125 129 126
   000257         026100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC1144.2 129 124 129
   000258         026200      ADD PASS-COUNTER TO ERROR-HOLD.                             IC1144.2 127 129
   000259         026300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC1144.2
   000260         026400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC1144.2 127 189
   000261         026500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC1144.2 129 191
   000262         026600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC1144.2 188 174
   000263         026700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC1144.2 171 48 284
   000264         026800  END-ROUTINE-12.                                                 IC1144.2
   000265         026900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC1144.2 177
   000266         027000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC1144.2 125 IMP
   000267      1  027100         MOVE "NO " TO ERROR-TOTAL                                IC1144.2 175
   000268         027200         ELSE                                                     IC1144.2
   000269      1  027300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC1144.2 125 175
   000270         027400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC1144.2 171 48
   000271         027500     PERFORM WRITE-LINE.                                          IC1144.2 284
   000272         027600 END-ROUTINE-13.                                                  IC1144.2
   000273         027700     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC1144.2 124 IMP
   000274      1  027800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC1144.2 175
   000275      1  027900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC1144.2 124 175
   000276         028000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC1144.2 177
   000277         028100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1144.2 171 48 284
   000278         028200      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC1144.2 126 IMP
   000279      1  028300          MOVE "NO " TO ERROR-TOTAL                               IC1144.2 175
   000280      1  028400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC1144.2 126 175
   000281         028500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC1144.2 177
   000282         028600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC1144.2 171 48 284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1144.2 179 48 284
   000284         028800 WRITE-LINE.                                                      IC1144.2
   000285         028900     ADD 1 TO RECORD-COUNT.                                       IC1144.2 131
   000286         029000     IF RECORD-COUNT GREATER 50                                   IC1144.2 131
   000287      1  029100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC1144.2 48 130
   000288      1  029200         MOVE SPACE TO DUMMY-RECORD                               IC1144.2 IMP 48
   000289      1  029300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC1144.2 48
   000290      1  029400         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC1144.2 111 48 296
   000291      1  029500         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC1144.2 116 48 296
   000292      1  029600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC1144.2 203 48 296
   000293      1  029700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC1144.2 130 48
   000294      1  029800         MOVE ZERO TO RECORD-COUNT.                               IC1144.2 IMP 131
   000295         029900     PERFORM WRT-LN.                                              IC1144.2 296
   000296         030000 WRT-LN.                                                          IC1144.2
   000297         030100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC1144.2 48
   000298         030200     MOVE SPACE TO DUMMY-RECORD.                                  IC1144.2 IMP 48
   000299         030300 BLANK-LINE-PRINT.                                                IC1144.2
   000300         030400     PERFORM WRT-LN.                                              IC1144.2 296
   000301         030500 FAIL-ROUTINE.                                                    IC1144.2
   000302         030600     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC1144.2 86 IMP 309
   000303         030700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC1144.2 100 IMP 309
   000304         030800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC1144.2 132 202
   000305         030900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC1144.2 197
   000306         031000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1144.2 194 48 284
   000307         031100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC1144.2 IMP 202
   000308         031200     GO TO  FAIL-ROUTINE-EX.                                      IC1144.2 314
   000309         031300 FAIL-ROUTINE-WRITE.                                              IC1144.2
   000310         031400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC1144.2 82 47 284
   000311         031500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC1144.2 132 110
   000312         031600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC1144.2 97 47 284
   000313         031700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC1144.2 IMP 110
   000314         031800 FAIL-ROUTINE-EX. EXIT.                                           IC1144.2
   000315         031900 BAIL-OUT.                                                        IC1144.2
   000316         032000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC1144.2 87 IMP 318
   000317         032100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC1144.2 101 IMP 323
   000318         032200 BAIL-OUT-WRITE.                                                  IC1144.2
   000319         032300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC1144.2 101 201 87 199
   000320         032400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC1144.2 132 202
   000321         032500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1144.2 194 48 284
   000322         032600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC1144.2 IMP 202
   000323         032700 BAIL-OUT-EX. EXIT.                                               IC1144.2
   000324         032800 CCVS1-EXIT.                                                      IC1144.2
   000325         032900     EXIT.                                                        IC1144.2
   000326         033000 LINK-TEST-10.                                                    IC1144.2
   000327         033100     MOVE 1 TO CALL-FLAG.                                         IC1144.2 55
   000328         033200*                                                                 IC1144.2
   000329         033300*         THIS TEST CALLS IC115 WHICH CREATES THE FILE SQ-FS3.    IC1144.2
   000330         033400*    THIS FILE IS A MASS STORAGE SEQUENTIAL FILE WITH 120         IC1144.2
   000331         033500*    CHARACTER RECORDS.  THERE ARE 649 RECORDS IN THE FILE.       IC1144.2
   000332         033600*                                                                 IC1144.2
   000333         033700     CALL "IC115A" USING GROUP-LINKAGE-VARIABLES                  IC1144.2 EXT 50
   000334         033800                        FILE-REC-SQ-FS3.                          IC1144.2 56
   000335         033900     IF COUNT-OF-RECORDS EQUAL TO 649                             IC1144.2 51
   000336      1  034000              GO TO LINK-PASS-10.                                 IC1144.2 342
   000337         034100 LINK-FAIL-10.                                                    IC1144.2
   000338         034200     PERFORM FAIL.                                                IC1144.2 227
   000339         034300     MOVE "FILE NOT CREATED IN IC115" TO RE-MARK.                 IC1144.2 81
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     MOVE "RECS WRITTEN =" TO COMPUTED-A.                         IC1144.2 87
   000341         034500     GO TO LINK-WRITE-10.                                         IC1144.2 345
   000342         034600 LINK-PASS-10.                                                    IC1144.2
   000343         034700     PERFORM PASS.                                                IC1144.2 226
   000344         034800     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   IC1144.2 87
   000345         034900 LINK-WRITE-10.                                                   IC1144.2
   000346         035000     MOVE "LINK-TEST-10" TO PAR-NAME.                             IC1144.2 76
   000347         035100     MOVE "CREATE FILE SQ-FS3" TO FEATURE.                        IC1144.2 72
   000348         035200     MOVE COUNT-OF-RECORDS TO CORRECT-18V0.                       IC1144.2 51 107
   000349         035300     PERFORM PRINT-DETAIL.                                        IC1144.2 230
   000350         035400 LINK-TEST-11.                                                    IC1144.2
   000351         035500     MOVE 2 TO CALL-FLAG.                                         IC1144.2 55
   000352         035600     MOVE ZERO TO COUNT-OF-RECORDS RECORDS-IN-ERROR               IC1144.2 IMP 51 52
   000353         035700                  ERROR-FLAG EOF-FLAG.                            IC1144.2 53 54
   000354         035800     CALL "IC115A" USING GROUP-LINKAGE-VARIABLES                  IC1144.2 EXT 50
   000355         035900                        FILE-REC-SQ-FS3.                          IC1144.2 56
   000356         036000     IF ERROR-FLAG EQUAL TO ZERO                                  IC1144.2 53 IMP
   000357      1  036100              GO TO LINK-PASS-11.                                 IC1144.2 366
   000358         036200     IF COUNT-OF-RECORDS GREATER THAN 649                         IC1144.2 51
   000359      1  036300              MOVE "MORE THAN 649 RECORDS" TO RE-MARK             IC1144.2 81
   000360      1  036400              GO TO LINK-FAIL-11.                                 IC1144.2 362
   000361         036500     MOVE "ERRORS IN READING SQ-FS3" TO RE-MARK.                  IC1144.2 81
   000362         036600 LINK-FAIL-11.                                                    IC1144.2
   000363         036700     MOVE "RECORDS-IN-ERROR =" TO COMPUTED-A.                     IC1144.2 87
   000364         036800     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       IC1144.2 52 107
   000365         036900     GO TO LINK-WRITE-11.                                         IC1144.2 370
   000366         037000 LINK-PASS-11.                                                    IC1144.2
   000367         037100     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   IC1144.2 87
   000368         037200     MOVE COUNT-OF-RECORDS TO CORRECT-18V0.                       IC1144.2 51 107
   000369         037300     PERFORM PASS.                                                IC1144.2 226
   000370         037400 LINK-WRITE-11.                                                   IC1144.2
   000371         037500     MOVE "LINK-TEST-11" TO PAR-NAME.                             IC1144.2 76
   000372         037600     MOVE "VERIFY FILE SQ-FS3" TO FEATURE.                        IC1144.2 72
   000373         037700     PERFORM PRINT-DETAIL.                                        IC1144.2 230
   000374         037800 LINK-INIT-12.                                                    IC1144.2
   000375         037900     MOVE 3 TO CALL-FLAG.                                         IC1144.2 55
   000376         038000     MOVE ZERO TO COUNT-OF-RECORDS RECORDS-IN-ERROR               IC1144.2 IMP 51 52
   000377         038100                  ERROR-FLAG EOF-FLAG.                            IC1144.2 53 54
   000378         038200     CALL "IC115A" USING GROUP-LINKAGE-VARIABLES                  IC1144.2 EXT 50
   000379         038300                        FILE-REC-SQ-FS3.                          IC1144.2 56
   000380         038400*         CALL IC115 TO OPEN FILE SQ-FS3.                         IC1144.2
   000381         038500     MOVE 4 TO CALL-FLAG.                                         IC1144.2 55
   000382         038600 LINK-TEST-12.                                                    IC1144.2
   000383         038700     CALL "IC115A" USING GROUP-LINKAGE-VARIABLES                  IC1144.2 EXT 50
   000384         038800                        FILE-REC-SQ-FS3.                          IC1144.2 56
   000385         038900*                                                                 IC1144.2
   000386         039000*        THIS TEST REPEATEDLY CALLS IC115 TO READ THE FILE SQ-FS3.IC1144.2
   000387         039100*    THE CONTENTS OF EACH DATA RECORD IS CHECKED FOR VALID DATA.  IC1144.2
   000388         039200*                                                                 IC1144.2
   000389         039300     IF EOF-FLAG EQUAL TO 1                                       IC1144.2 54
   000390      1  039400              GO TO LINK-TEST-12-01.                              IC1144.2 412
   000391         039500     ADD 1 TO COUNT-OF-RECORDS.                                   IC1144.2 51
   000392         039600     IF COUNT-OF-RECORDS GREATER THAN 649                         IC1144.2 51
   000393      1  039700              GO TO LINK-FAIL-12-02.                              IC1144.2 409
   000394         039800     IF COUNT-OF-RECORDS NOT EQUAL TO XRECORD-NUMBER              IC1144.2 51 67
   000395      1  039900              GO TO LINK-FAIL-12-01.                              IC1144.2 405
   000396         040000     IF REELUNIT-NUMBER-GROUP NOT EQUAL TO "/0"                   IC1144.2 63
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040100              GO TO LINK-FAIL-12-01.                              IC1144.2 405
   000398         040200     IF XFILE-NAME NOT EQUAL TO "SQ-FS3"                          IC1144.2 59
   000399      1  040300              GO TO LINK-FAIL-12-01.                              IC1144.2 405
   000400         040400     IF XRECORD-NAME NOT EQUAL TO "R1-F-G"                        IC1144.2 62
   000401      1  040500              GO TO LINK-FAIL-12-01.                              IC1144.2 405
   000402         040600     IF XLABEL-TYPE NOT EQUAL TO "S"                              IC1144.2 69
   000403      1  040700              GO TO LINK-FAIL-12-01.                              IC1144.2 405
   000404         040800     GO TO LINK-TEST-12.                                          IC1144.2 382
   000405         040900 LINK-FAIL-12-01.                                                 IC1144.2
   000406         041000     ADD 1 TO RECORDS-IN-ERROR.                                   IC1144.2 52
   000407         041100     MOVE 1 TO ERROR-FLAG.                                        IC1144.2 53
   000408         041200     GO TO LINK-TEST-12.                                          IC1144.2 382
   000409         041300 LINK-FAIL-12-02.                                                 IC1144.2
   000410         041400     MOVE "MORE THAN 649 RECORDS" TO RE-MARK.                     IC1144.2 81
   000411         041500     GO TO LINK-FAIL-12.                                          IC1144.2 420
   000412         041600 LINK-TEST-12-01.                                                 IC1144.2
   000413         041700     IF COUNT-OF-RECORDS LESS THAN 649                            IC1144.2 51
   000414      1  041800              GO TO LINK-FAIL-12-04.                              IC1144.2 423
   000415         041900     IF ERROR-FLAG EQUAL TO ZERO                                  IC1144.2 53 IMP
   000416      1  042000              GO TO LINK-PASS-12.                                 IC1144.2 428
   000417         042100 LINK-FAIL-12-03.                                                 IC1144.2
   000418         042200     MOVE "RECORDS-IN-ERROR =" TO COMPUTED-A.                     IC1144.2 87
   000419         042300     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       IC1144.2 52 107
   000420         042400 LINK-FAIL-12.                                                    IC1144.2
   000421         042500     PERFORM FAIL.                                                IC1144.2 227
   000422         042600     GO TO LINK-WRITE-12.                                         IC1144.2 430
   000423         042700 LINK-FAIL-12-04.                                                 IC1144.2
   000424         042800     MOVE "UNEXPECTED EOF" TO RE-MARK.                            IC1144.2 81
   000425         042900     MOVE "RECORDS READ =" TO COMPUTED-A.                         IC1144.2 87
   000426         043000     MOVE COUNT-OF-RECORDS TO CORRECT-18V0.                       IC1144.2 51 107
   000427         043100     GO TO LINK-FAIL-12.                                          IC1144.2 420
   000428         043200 LINK-PASS-12.                                                    IC1144.2
   000429         043300     PERFORM PASS.                                                IC1144.2 226
   000430         043400 LINK-WRITE-12.                                                   IC1144.2
   000431         043500     MOVE "LINK-TEST-12" TO PAR-NAME.                             IC1144.2 76
   000432         043600     MOVE "READ IN SUBPRGM" TO FEATURE.                           IC1144.2 72
   000433         043700     PERFORM PRINT-DETAIL.                                        IC1144.2 230
   000434         043800 LINK-CLOSE-12.                                                   IC1144.2
   000435         043900     MOVE 5 TO CALL-FLAG.                                         IC1144.2 55
   000436         044000     CALL "IC115A" USING GROUP-LINKAGE-VARIABLES                  IC1144.2 EXT 50
   000437         044100                        FILE-REC-SQ-FS3.                          IC1144.2 56
   000438         044200 TERMINATE-ROUTINE.                                               IC1144.2
   000439         044300     EXIT.                                                        IC1144.2
   000440         044400 FILE-DUMP SECTION.                                               IC1144.2
   000441         044500 FILE-DUMP-INIT.                                                  IC1144.2
   000442         044600     MOVE 3 TO CALL-FLAG.                                         IC1144.2 55
   000443         044700     MOVE ZERO TO EOF-FLAG COUNT-OF-RECORDS.                      IC1144.2 IMP 54 51
   000444         044800     CALL "IC115A" USING GROUP-LINKAGE-VARIABLES                  IC1144.2 EXT 50
   000445         044900                        FILE-REC-SQ-FS3.                          IC1144.2 56
   000446         045000     MOVE 4 TO CALL-FLAG.                                         IC1144.2 55
   000447         045100 FILE-3-DUMP.                                                     IC1144.2
   000448         045200     CALL "IC115A" USING GROUP-LINKAGE-VARIABLES                  IC1144.2 EXT 50
   000449         045300                        FILE-REC-SQ-FS3.                          IC1144.2 56
   000450         045400     IF EOF-FLAG EQUAL TO 1                                       IC1144.2 54
   000451      1  045500              GO TO FILE-3-DUMP-END.                              IC1144.2 459
   000452         045600     ADD 1 TO COUNT-OF-RECORDS.                                   IC1144.2 51
   000453         045700     IF COUNT-OF-RECORDS EQUAL TO 650                             IC1144.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  045800              PERFORM BLANK-LINE-PRINT 5 TIMES.                   IC1144.2 299
   000455         045900     MOVE FILE-REC-SQ-FS3 TO DUMMY-RECORD.                        IC1144.2 56 48
   000456         046000     PERFORM WRITE-LINE.                                          IC1144.2 284
   000457         046100     IF COUNT-OF-RECORDS LESS THAN 669                            IC1144.2 51
   000458      1  046200              GO TO FILE-3-DUMP.                                  IC1144.2 447
   000459         046300 FILE-3-DUMP-END.                                                 IC1144.2
   000460         046400     MOVE 5 TO CALL-FLAG.                                         IC1144.2 55
   000461         046500     CALL "IC115A" USING GROUP-LINKAGE-VARIABLES                  IC1144.2 EXT 50
   000462         046600                        FILE-REC-SQ-FS3.                          IC1144.2 56
   000463         046700 FILE-3-DUMP-EXIT.                                                IC1144.2
   000464         046800     EXIT.                                                        IC1144.2
   000465         046900 CCVS-EXIT SECTION.                                               IC1144.2
   000466         047000 CCVS-999999.                                                     IC1144.2
   000467         047100     GO TO CLOSE-FILES.                                           IC1144.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      132   ANSI-REFERENCE . . . . . . . .  304 311 320
       55   CALL-FLAG. . . . . . . . . . .  M327 M351 M375 M381 M435 M442 M446 M460
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
       87   COMPUTED-A . . . . . . . . . .  88 90 91 92 93 316 319 M340 M344 M363 M367 M418 M425
       88   COMPUTED-N
       86   COMPUTED-X . . . . . . . . . .  M238 302
       90   COMPUTED-0V18
       92   COMPUTED-14V4
       94   COMPUTED-18V0
       91   COMPUTED-4V14
      110   COR-ANSI-REFERENCE . . . . . .  M311 M313
      101   CORRECT-A. . . . . . . . . . .  102 103 104 105 106 317 319
      102   CORRECT-N
      100   CORRECT-X. . . . . . . . . . .  M239 303
      103   CORRECT-0V18
      105   CORRECT-14V4
      107   CORRECT-18V0 . . . . . . . . .  M348 M364 M368 M419 M426
      104   CORRECT-4V14
       51   COUNT-OF-RECORDS . . . . . . .  335 348 M352 358 368 M376 M391 392 394 413 426 M443 M452 453 457
      106   CR-18V0
      124   DELETE-COUNTER . . . . . . . .  M228 257 273 275
       79   DOTVALUE . . . . . . . . . . .  M233
      130   DUMMY-HOLD . . . . . . . . . .  M287 293
       48   DUMMY-RECORD . . . . . . . . .  M243 M244 M245 M246 M248 M249 M250 M252 M254 M263 M270 M277 M282 M283 287 M288
                                            289 M290 M291 M292 M293 297 M298 M306 M321 M455
      177   ENDER-DESC . . . . . . . . . .  M265 M276 M281
       54   EOF-FLAG . . . . . . . . . . .  M353 M377 389 M443 450
      125   ERROR-COUNTER. . . . . . . . .  M227 256 266 269
       53   ERROR-FLAG . . . . . . . . . .  M353 356 M377 M407 415
      129   ERROR-HOLD . . . . . . . . . .  M256 M257 M257 M258 261
      175   ERROR-TOTAL. . . . . . . . . .  M267 M269 M274 M275 M279 M280
       72   FEATURE. . . . . . . . . . . .  M347 M372 M432
       56   FILE-REC-SQ-FS3. . . . . . . .  334 355 379 384 437 445 449 455 462
       50   GROUP-LINKAGE-VARIABLES. . . .  333 354 378 383 436 444 448 461
      203   HYPHEN-LINE. . . . . . . . . .  250 252 292
      169   ID-AGAIN . . . . . . . . . . .  M215
      202   INF-ANSI-REFERENCE . . . . . .  M304 M307 M320 M322
      197   INFO-TEXT. . . . . . . . . . .  M305
      126   INSPECT-COUNTER. . . . . . . .  M225 256 278 280
       74   P-OR-F . . . . . . . . . . . .  M225 M226 M227 M228 235 M238
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page    13
0 Defined   Cross-reference of data names   References

0      76   PAR-NAME . . . . . . . . . . .  M240 M346 M371 M431
       78   PARDOT-X . . . . . . . . . . .  M232
      127   PASS-COUNTER . . . . . . . . .  M226 258 260
       46   PRINT-FILE . . . . . . . . . .  42 214 220
       47   PRINT-REC. . . . . . . . . . .  M234 M310 M312
       81   RE-MARK. . . . . . . . . . . .  M229 M241 M339 M359 M361 M410 M424
      123   REC-CT . . . . . . . . . . . .  231 233 240
      122   REC-SKL-SUB
      131   RECORD-COUNT . . . . . . . . .  M285 286 M294
       52   RECORDS-IN-ERROR . . . . . . .  M352 364 M376 M406 419
       65   REELUNIT-NUMBER
       63   REELUNIT-NUMBER-GROUP. . . . .  396
       82   TEST-COMPUTED. . . . . . . . .  310
       97   TEST-CORRECT . . . . . . . . .  312
      150   TEST-ID. . . . . . . . . . . .  M215
       70   TEST-RESULTS . . . . . . . . .  M216 234
      128   TOTAL-ERROR
       59   XFILE-NAME . . . . . . . . . .  398
       57   XFILE-NAME-GROUP
       69   XLABEL-TYPE. . . . . . . . . .  402
       62   XRECORD-NAME . . . . . . . . .  400
       60   XRECORD-NAME-GROUP
       67   XRECORD-NUMBER . . . . . . . .  394
      199   XXCOMPUTED . . . . . . . . . .  M319
      201   XXCORRECT. . . . . . . . . . .  M319
      194   XXINFO . . . . . . . . . . . .  306 321
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page    14
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
      299   BLANK-LINE-PRINT . . . . . . .  P454
      465   CCVS-EXIT
      466   CCVS-999999
      212   CCVS1
      324   CCVS1-EXIT . . . . . . . . . .  G218
      219   CLOSE-FILES. . . . . . . . . .  G467
      247   COLUMN-NAMES-ROUTINE . . . . .  E217
      228   DE-LETE
      251   END-ROUTINE. . . . . . . . . .  P220
      255   END-ROUTINE-1
      264   END-ROUTINE-12
      272   END-ROUTINE-13 . . . . . . . .  E220
      253   END-RTN-EXIT
      227   FAIL . . . . . . . . . . . . .  P338 P421
      301   FAIL-ROUTINE . . . . . . . . .  P236
      314   FAIL-ROUTINE-EX. . . . . . . .  E236 G308
      309   FAIL-ROUTINE-WRITE . . . . . .  G302 G303
      440   FILE-DUMP
      441   FILE-DUMP-INIT
      447   FILE-3-DUMP. . . . . . . . . .  G458
      459   FILE-3-DUMP-END. . . . . . . .  G451
      463   FILE-3-DUMP-EXIT
      242   HEAD-ROUTINE . . . . . . . . .  P217
      225   INSPT
      434   LINK-CLOSE-12
      337   LINK-FAIL-10
      362   LINK-FAIL-11 . . . . . . . . .  G360
      420   LINK-FAIL-12 . . . . . . . . .  G411 G427
      405   LINK-FAIL-12-01. . . . . . . .  G395 G397 G399 G401 G403
      409   LINK-FAIL-12-02. . . . . . . .  G393
      417   LINK-FAIL-12-03
      423   LINK-FAIL-12-04. . . . . . . .  G414
      374   LINK-INIT-12
      342   LINK-PASS-10 . . . . . . . . .  G336
      366   LINK-PASS-11 . . . . . . . . .  G357
      428   LINK-PASS-12 . . . . . . . . .  G416
      326   LINK-TEST-10
      350   LINK-TEST-11
      382   LINK-TEST-12 . . . . . . . . .  G404 G408
      412   LINK-TEST-12-01. . . . . . . .  G390
      345   LINK-WRITE-10. . . . . . . . .  G341
      370   LINK-WRITE-11. . . . . . . . .  G365
      430   LINK-WRITE-12. . . . . . . . .  G422
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page    15
0 Defined   Cross-reference of procedures   References

0     213   OPEN-FILES
      226   PASS . . . . . . . . . . . . .  P343 P369 P429
      230   PRINT-DETAIL . . . . . . . . .  P349 P373 P433
      223   TERMINATE-CALL
      221   TERMINATE-CCVS
      438   TERMINATE-ROUTINE
      284   WRITE-LINE . . . . . . . . . .  P234 P235 P243 P244 P245 P246 P248 P249 P250 P252 P254 P263 P271 P277 P282 P283
                                            P306 P310 P312 P321 P456
      296   WRT-LN . . . . . . . . . . . .  P290 P291 P292 P295 P300
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page    16
0 Defined   Cross-reference of programs     References

        3   IC114A
 EXTERNAL   IC115A . . . . . . . . . . . .  333 354 378 383 436 444 448 461
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC114A    Date 06/04/2022  Time 11:58:40   Page    17
0LineID  Message code  Message text

     46  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC114A:
 *    Source records = 467
 *    Data Division statements = 78
 *    Procedure Division statements = 222
 *    Generated COBOL statements = 0
 *    Program complexity factor = 229
0End of compilation 1,  program IC114A,  highest severity 0.
0Return code 0
