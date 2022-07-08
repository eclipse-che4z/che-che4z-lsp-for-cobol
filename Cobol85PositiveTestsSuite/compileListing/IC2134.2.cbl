1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:25   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:25   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2134.2
   000002         000200 PROGRAM-ID.                                                      IC2134.2
   000003         000300     IC213A.                                                      IC2134.2
   000004         000500*                                                              *  IC2134.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2134.2
   000006         000700*                                                              *  IC2134.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2134.2
   000008         000900*                                                              *  IC2134.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2134.2
   000010         001100*                                                              *  IC2134.2
   000011         001300*                                                              *  IC2134.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2134.2
   000013         001500*                                                              *  IC2134.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2134.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2134.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2134.2
   000017         001900*                                                              *  IC2134.2
   000018         002100*    THIS IS MAIN PROGRAM IC213.                                  IC2134.2
   000019         002300 ENVIRONMENT DIVISION.                                            IC2134.2
   000020         002400 CONFIGURATION SECTION.                                           IC2134.2
   000021         002500 SOURCE-COMPUTER.                                                 IC2134.2
   000022         002600     XXXXX082.                                                    IC2134.2
   000023         002700 OBJECT-COMPUTER.                                                 IC2134.2
   000024         002800     XXXXX083.                                                    IC2134.2
   000025         002900 INPUT-OUTPUT SECTION.                                            IC2134.2
   000026         003000 FILE-CONTROL.                                                    IC2134.2
   000027         003100     SELECT PRINT-FILE ASSIGN TO                                  IC2134.2 31
   000028         003200     XXXXX055.                                                    IC2134.2
   000029         003300 DATA DIVISION.                                                   IC2134.2
   000030         003400 FILE SECTION.                                                    IC2134.2
   000031         003500 FD  PRINT-FILE.                                                  IC2134.2

 ==000031==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000032         003600 01  PRINT-REC PICTURE X(120).                                    IC2134.2
   000033         003700 01  DUMMY-RECORD PICTURE X(120).                                 IC2134.2
   000034         003800 WORKING-STORAGE SECTION.                                         IC2134.2
   000035         003900 01  DN1                         PICTURE S9      VALUE ZERO.      IC2134.2 IMP
   000036         004000 01  DN2                         PICTURE S9      VALUE ZERO.      IC2134.2 IMP
   000037         004100 01  DN3                         PICTURE S9      VALUE ZERO.      IC2134.2 IMP
   000038         004200 01  TEST-RESULTS.                                                IC2134.2
   000039         004300     02 FILLER                   PIC X      VALUE SPACE.          IC2134.2 IMP
   000040         004400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2134.2 IMP
   000041         004500     02 FILLER                   PIC X      VALUE SPACE.          IC2134.2 IMP
   000042         004600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2134.2 IMP
   000043         004700     02 FILLER                   PIC X      VALUE SPACE.          IC2134.2 IMP
   000044         004800     02  PAR-NAME.                                                IC2134.2
   000045         004900       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2134.2 IMP
   000046         005000       03  PARDOT-X              PIC X      VALUE SPACE.          IC2134.2 IMP
   000047         005100       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2134.2 IMP
   000048         005200     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2134.2 IMP
   000049         005300     02 RE-MARK                  PIC X(61).                       IC2134.2
   000050         005400 01  TEST-COMPUTED.                                               IC2134.2
   000051         005500     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2134.2 IMP
   000052         005600     02 FILLER                   PIC X(17)  VALUE                 IC2134.2
   000053         005700            "       COMPUTED=".                                   IC2134.2
   000054         005800     02 COMPUTED-X.                                               IC2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2134.2 IMP
   000056         006000     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2134.2 55
   000057         006100                                 PIC -9(9).9(9).                  IC2134.2
   000058         006200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2134.2 55
   000059         006300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2134.2 55
   000060         006400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2134.2 55
   000061         006500     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2134.2 55
   000062         006600         04 COMPUTED-18V0                    PIC -9(18).          IC2134.2
   000063         006700         04 FILLER                           PIC X.               IC2134.2
   000064         006800     03 FILLER PIC X(50) VALUE SPACE.                             IC2134.2 IMP
   000065         006900 01  TEST-CORRECT.                                                IC2134.2
   000066         007000     02 FILLER PIC X(30) VALUE SPACE.                             IC2134.2 IMP
   000067         007100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2134.2
   000068         007200     02 CORRECT-X.                                                IC2134.2
   000069         007300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2134.2 IMP
   000070         007400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2134.2 69
   000071         007500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2134.2 69
   000072         007600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2134.2 69
   000073         007700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2134.2 69
   000074         007800     03      CR-18V0 REDEFINES CORRECT-A.                         IC2134.2 69
   000075         007900         04 CORRECT-18V0                     PIC -9(18).          IC2134.2
   000076         008000         04 FILLER                           PIC X.               IC2134.2
   000077         008100     03 FILLER PIC X(2) VALUE SPACE.                              IC2134.2 IMP
   000078         008200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2134.2 IMP
   000079         008300 01  CCVS-C-1.                                                    IC2134.2
   000080         008400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2134.2
   000081         008500-    "SS  PARAGRAPH-NAME                                          IC2134.2
   000082         008600-    "       REMARKS".                                            IC2134.2
   000083         008700     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2134.2 IMP
   000084         008800 01  CCVS-C-2.                                                    IC2134.2
   000085         008900     02 FILLER                     PIC X        VALUE SPACE.      IC2134.2 IMP
   000086         009000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2134.2
   000087         009100     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2134.2 IMP
   000088         009200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2134.2
   000089         009300     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2134.2 IMP
   000090         009400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2134.2 IMP
   000091         009500 01  REC-CT                        PIC 99       VALUE ZERO.       IC2134.2 IMP
   000092         009600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2134.2 IMP
   000093         009700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2134.2 IMP
   000094         009800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2134.2 IMP
   000095         009900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2134.2 IMP
   000096         010000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2134.2 IMP
   000097         010100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2134.2 IMP
   000098         010200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2134.2 IMP
   000099         010300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2134.2 IMP
   000100         010400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2134.2 IMP
   000101         010500 01  CCVS-H-1.                                                    IC2134.2
   000102         010600     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2134.2 IMP
   000103         010700     02  FILLER                    PIC X(42)    VALUE             IC2134.2
   000104         010800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2134.2
   000105         010900     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2134.2 IMP
   000106         011000 01  CCVS-H-2A.                                                   IC2134.2
   000107         011100   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2134.2 IMP
   000108         011200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2134.2
   000109         011300   02  FILLER                        PIC XXXX   VALUE             IC2134.2
   000110         011400     "4.2 ".                                                      IC2134.2
   000111         011500   02  FILLER                        PIC X(28)  VALUE             IC2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600            " COPY - NOT FOR DISTRIBUTION".                       IC2134.2
   000113         011700   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2134.2 IMP
   000114         011800                                                                  IC2134.2
   000115         011900 01  CCVS-H-2B.                                                   IC2134.2
   000116         012000   02  FILLER                        PIC X(15)  VALUE             IC2134.2
   000117         012100            "TEST RESULT OF ".                                    IC2134.2
   000118         012200   02  TEST-ID                       PIC X(9).                    IC2134.2
   000119         012300   02  FILLER                        PIC X(4)   VALUE             IC2134.2
   000120         012400            " IN ".                                               IC2134.2
   000121         012500   02  FILLER                        PIC X(12)  VALUE             IC2134.2
   000122         012600     " HIGH       ".                                              IC2134.2
   000123         012700   02  FILLER                        PIC X(22)  VALUE             IC2134.2
   000124         012800            " LEVEL VALIDATION FOR ".                             IC2134.2
   000125         012900   02  FILLER                        PIC X(58)  VALUE             IC2134.2
   000126         013000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2134.2
   000127         013100 01  CCVS-H-3.                                                    IC2134.2
   000128         013200     02  FILLER                      PIC X(34)  VALUE             IC2134.2
   000129         013300            " FOR OFFICIAL USE ONLY    ".                         IC2134.2
   000130         013400     02  FILLER                      PIC X(58)  VALUE             IC2134.2
   000131         013500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2134.2
   000132         013600     02  FILLER                      PIC X(28)  VALUE             IC2134.2
   000133         013700            "  COPYRIGHT   1985 ".                                IC2134.2
   000134         013800 01  CCVS-E-1.                                                    IC2134.2
   000135         013900     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2134.2 IMP
   000136         014000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2134.2
   000137         014100     02 ID-AGAIN                     PIC X(9).                    IC2134.2
   000138         014200     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2134.2 IMP
   000139         014300 01  CCVS-E-2.                                                    IC2134.2
   000140         014400     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2134.2 IMP
   000141         014500     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2134.2 IMP
   000142         014600     02 CCVS-E-2-2.                                               IC2134.2
   000143         014700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2134.2 IMP
   000144         014800         03 FILLER                   PIC X      VALUE SPACE.      IC2134.2 IMP
   000145         014900         03 ENDER-DESC               PIC X(44)  VALUE             IC2134.2
   000146         015000            "ERRORS ENCOUNTERED".                                 IC2134.2
   000147         015100 01  CCVS-E-3.                                                    IC2134.2
   000148         015200     02  FILLER                      PIC X(22)  VALUE             IC2134.2
   000149         015300            " FOR OFFICIAL USE ONLY".                             IC2134.2
   000150         015400     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2134.2 IMP
   000151         015500     02  FILLER                      PIC X(58)  VALUE             IC2134.2
   000152         015600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2134.2
   000153         015700     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2134.2 IMP
   000154         015800     02 FILLER                       PIC X(15)  VALUE             IC2134.2
   000155         015900             " COPYRIGHT 1985".                                   IC2134.2
   000156         016000 01  CCVS-E-4.                                                    IC2134.2
   000157         016100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2134.2 IMP
   000158         016200     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2134.2
   000159         016300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2134.2 IMP
   000160         016400     02 FILLER                       PIC X(40)  VALUE             IC2134.2
   000161         016500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2134.2
   000162         016600 01  XXINFO.                                                      IC2134.2
   000163         016700     02 FILLER                       PIC X(19)  VALUE             IC2134.2
   000164         016800            "*** INFORMATION ***".                                IC2134.2
   000165         016900     02 INFO-TEXT.                                                IC2134.2
   000166         017000       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2134.2 IMP
   000167         017100       04 XXCOMPUTED                 PIC X(20).                   IC2134.2
   000168         017200       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2134.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300       04 XXCORRECT                  PIC X(20).                   IC2134.2
   000170         017400     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2134.2
   000171         017500 01  HYPHEN-LINE.                                                 IC2134.2
   000172         017600     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2134.2 IMP
   000173         017700     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2134.2
   000174         017800-    "*****************************************".                 IC2134.2
   000175         017900     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2134.2
   000176         018000-    "******************************".                            IC2134.2
   000177         018100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2134.2
   000178         018200     "IC213A".                                                    IC2134.2
   000179         018300 PROCEDURE DIVISION.                                              IC2134.2
   000180         018400 CCVS1 SECTION.                                                   IC2134.2
   000181         018500 OPEN-FILES.                                                      IC2134.2
   000182         018600     OPEN     OUTPUT PRINT-FILE.                                  IC2134.2 31
   000183         018700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2134.2 177 118 177 137
   000184         018800     MOVE    SPACE TO TEST-RESULTS.                               IC2134.2 IMP 38
   000185         018900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2134.2 210 215
   000186         019000     GO TO CCVS1-EXIT.                                            IC2134.2 292
   000187         019100 CLOSE-FILES.                                                     IC2134.2
   000188         019200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2134.2 219 240 31
   000189         019300 TERMINATE-CCVS.                                                  IC2134.2
   000190         019400     EXIT PROGRAM.                                                IC2134.2
   000191         019500 TERMINATE-CALL.                                                  IC2134.2
   000192         019600     STOP     RUN.                                                IC2134.2
   000193         019700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2134.2 42 94
   000194         019800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2134.2 42 95
   000195         019900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2134.2 42 93
   000196         020000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2134.2 42 92
   000197         020100     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2134.2 49
   000198         020200 PRINT-DETAIL.                                                    IC2134.2
   000199         020300     IF REC-CT NOT EQUAL TO ZERO                                  IC2134.2 91 IMP
   000200      1  020400             MOVE "." TO PARDOT-X                                 IC2134.2 46
   000201      1  020500             MOVE REC-CT TO DOTVALUE.                             IC2134.2 91 47
   000202         020600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2134.2 38 32 252
   000203         020700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2134.2 42 252
   000204      1  020800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2134.2 269 282
   000205      1  020900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2134.2 283 291
   000206         021000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2134.2 IMP 42 IMP 54
   000207         021100     MOVE SPACE TO CORRECT-X.                                     IC2134.2 IMP 68
   000208         021200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2134.2 91 IMP IMP 44
   000209         021300     MOVE     SPACE TO RE-MARK.                                   IC2134.2 IMP 49
   000210         021400 HEAD-ROUTINE.                                                    IC2134.2
   000211         021500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2134.2 101 33 252
   000212         021600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2134.2 106 33 252
   000213         021700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2134.2 115 33 252
   000214         021800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2134.2 127 33 252
   000215         021900 COLUMN-NAMES-ROUTINE.                                            IC2134.2
   000216         022000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2134.2 79 33 252
   000217         022100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2134.2 84 33 252
   000218         022200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2134.2 171 33 252
   000219         022300 END-ROUTINE.                                                     IC2134.2
   000220         022400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2134.2 171 33 252
   000221         022500 END-RTN-EXIT.                                                    IC2134.2
   000222         022600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2134.2 134 33 252
   000223         022700 END-ROUTINE-1.                                                   IC2134.2
   000224         022800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2134.2 93 97 94
   000225         022900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2134.2 97 92 97
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2134.2 95 97
   000227         023100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2134.2
   000228         023200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2134.2 95 157
   000229         023300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2134.2 97 159
   000230         023400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2134.2 156 142
   000231         023500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2134.2 139 33 252
   000232         023600  END-ROUTINE-12.                                                 IC2134.2
   000233         023700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2134.2 145
   000234         023800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2134.2 93 IMP
   000235      1  023900         MOVE "NO " TO ERROR-TOTAL                                IC2134.2 143
   000236         024000         ELSE                                                     IC2134.2
   000237      1  024100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2134.2 93 143
   000238         024200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2134.2 139 33
   000239         024300     PERFORM WRITE-LINE.                                          IC2134.2 252
   000240         024400 END-ROUTINE-13.                                                  IC2134.2
   000241         024500     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2134.2 92 IMP
   000242      1  024600         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2134.2 143
   000243      1  024700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2134.2 92 143
   000244         024800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2134.2 145
   000245         024900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2134.2 139 33 252
   000246         025000      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2134.2 94 IMP
   000247      1  025100          MOVE "NO " TO ERROR-TOTAL                               IC2134.2 143
   000248      1  025200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2134.2 94 143
   000249         025300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2134.2 145
   000250         025400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2134.2 139 33 252
   000251         025500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2134.2 147 33 252
   000252         025600 WRITE-LINE.                                                      IC2134.2
   000253         025700     ADD 1 TO RECORD-COUNT.                                       IC2134.2 99
   000254         025800     IF RECORD-COUNT GREATER 50                                   IC2134.2 99
   000255      1  025900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2134.2 33 98
   000256      1  026000         MOVE SPACE TO DUMMY-RECORD                               IC2134.2 IMP 33
   000257      1  026100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2134.2 33
   000258      1  026200         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2134.2 79 33 264
   000259      1  026300         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2134.2 84 33 264
   000260      1  026400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2134.2 171 33 264
   000261      1  026500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2134.2 98 33
   000262      1  026600         MOVE ZERO TO RECORD-COUNT.                               IC2134.2 IMP 99
   000263         026700     PERFORM WRT-LN.                                              IC2134.2 264
   000264         026800 WRT-LN.                                                          IC2134.2
   000265         026900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2134.2 33
   000266         027000     MOVE SPACE TO DUMMY-RECORD.                                  IC2134.2 IMP 33
   000267         027100 BLANK-LINE-PRINT.                                                IC2134.2
   000268         027200     PERFORM WRT-LN.                                              IC2134.2 264
   000269         027300 FAIL-ROUTINE.                                                    IC2134.2
   000270         027400     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2134.2 54 IMP 277
   000271         027500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2134.2 68 IMP 277
   000272         027600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2134.2 100 170
   000273         027700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2134.2 165
   000274         027800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2134.2 162 33 252
   000275         027900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2134.2 IMP 170
   000276         028000     GO TO  FAIL-ROUTINE-EX.                                      IC2134.2 282
   000277         028100 FAIL-ROUTINE-WRITE.                                              IC2134.2
   000278         028200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2134.2 50 32 252
   000279         028300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2134.2 100 78
   000280         028400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2134.2 65 32 252
   000281         028500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2134.2 IMP 78
   000282         028600 FAIL-ROUTINE-EX. EXIT.                                           IC2134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700 BAIL-OUT.                                                        IC2134.2
   000284         028800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2134.2 55 IMP 286
   000285         028900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2134.2 69 IMP 291
   000286         029000 BAIL-OUT-WRITE.                                                  IC2134.2
   000287         029100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2134.2 69 169 55 167
   000288         029200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2134.2 100 170
   000289         029300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2134.2 162 33 252
   000290         029400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2134.2 IMP 170
   000291         029500 BAIL-OUT-EX. EXIT.                                               IC2134.2
   000292         029600 CCVS1-EXIT.                                                      IC2134.2
   000293         029700     EXIT.                                                        IC2134.2
   000294         029800 CALL-TEST-1.                                                     IC2134.2
   000295         029900     MOVE "CALL...USING DATA-NM" TO FEATURE.                      IC2134.2 40
   000296         030000     MOVE "CALL-TEST-1" TO PAR-NAME.                              IC2134.2 44
   000297         030100     MOVE "MAIN PROGRAM CALLS SUBPROGRAM1" TO RE-MARK.            IC2134.2 49
   000298         030200     CALL "IC214A" USING DN1.                                     IC2134.2 EXT 35
   000299         030300     IF DN1 IS EQUAL TO 1                                         IC2134.2 35
   000300      1  030400         PERFORM PASS                                             IC2134.2 194
   000301      1  030500         GO TO CALL-WRITE-1.                                      IC2134.2 306
   000302         030600 CALL-FAIL-1.                                                     IC2134.2
   000303         030700     MOVE 1 TO CORRECT-18V0.                                      IC2134.2 75
   000304         030800     MOVE DN1 TO COMPUTED-18V0.                                   IC2134.2 35 62
   000305         030900     PERFORM FAIL.                                                IC2134.2 195
   000306         031000 CALL-WRITE-1.                                                    IC2134.2
   000307         031100     PERFORM PRINT-DETAIL.                                        IC2134.2 198
   000308         031200 CALL-TEST-2.                                                     IC2134.2
   000309         031300     MOVE "CALL...USING DATA-NM" TO FEATURE.                      IC2134.2 40
   000310         031400     MOVE "CALL-TEST-2" TO PAR-NAME.                              IC2134.2 44
   000311         031500     MOVE "MAIN PROGRAM CALLS SUBPROGRAM2" TO RE-MARK.            IC2134.2 49
   000312         031600     CALL "IC215A" USING DN2, DN3.                                IC2134.2 EXT 36 37
   000313         031700     IF DN2 IS EQUAL TO 1                                         IC2134.2 36
   000314      1  031800         PERFORM PASS                                             IC2134.2 194
   000315      1  031900         GO TO CALL-WRITE-2.                                      IC2134.2 320
   000316         032000 CALL-FAIL-2.                                                     IC2134.2
   000317         032100     MOVE 1 TO CORRECT-18V0.                                      IC2134.2 75
   000318         032200     MOVE DN2 TO COMPUTED-18V0.                                   IC2134.2 36 62
   000319         032300     PERFORM FAIL.                                                IC2134.2 195
   000320         032400 CALL-WRITE-2.                                                    IC2134.2
   000321         032500     PERFORM PRINT-DETAIL.                                        IC2134.2 198
   000322         032600 CANCEL-TEST-1.                                                   IC2134.2
   000323         032700     MOVE "CANCEL" TO FEATURE.                                    IC2134.2 40
   000324         032800     MOVE "CANCEL-TEST-1" TO PAR-NAME.                            IC2134.2 44
   000325         032900     MOVE "SUBPROGRAM2 CANCELS SUBPROGRAM1" TO RE-MARK.           IC2134.2 49
   000326         033000     IF DN3 IS EQUAL TO 1                                         IC2134.2 37
   000327      1  033100         PERFORM PASS                                             IC2134.2 194
   000328      1  033200         GO TO CANCEL-WRITE-1.                                    IC2134.2 333
   000329         033300 CANCEL-FAIL-1.                                                   IC2134.2
   000330         033400     MOVE 1 TO CORRECT-18V0.                                      IC2134.2 75
   000331         033500     MOVE DN3 TO COMPUTED-18V0.                                   IC2134.2 37 62
   000332         033600     PERFORM FAIL.                                                IC2134.2 195
   000333         033700 CANCEL-WRITE-1.                                                  IC2134.2
   000334         033800     PERFORM PRINT-DETAIL.                                        IC2134.2 198
   000335         033900 CCVS-EXIT SECTION.                                               IC2134.2
   000336         034000 CCVS-999999.                                                     IC2134.2
   000337         034100     GO TO CLOSE-FILES.                                           IC2134.2 187
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page     9
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      100   ANSI-REFERENCE . . . . . . . .  272 279 288
       79   CCVS-C-1 . . . . . . . . . . .  216 258
       84   CCVS-C-2 . . . . . . . . . . .  217 259
      134   CCVS-E-1 . . . . . . . . . . .  222
      139   CCVS-E-2 . . . . . . . . . . .  231 238 245 250
      142   CCVS-E-2-2 . . . . . . . . . .  M230
      147   CCVS-E-3 . . . . . . . . . . .  251
      156   CCVS-E-4 . . . . . . . . . . .  230
      157   CCVS-E-4-1 . . . . . . . . . .  M228
      159   CCVS-E-4-2 . . . . . . . . . .  M229
      101   CCVS-H-1 . . . . . . . . . . .  211
      106   CCVS-H-2A. . . . . . . . . . .  212
      115   CCVS-H-2B. . . . . . . . . . .  213
      127   CCVS-H-3 . . . . . . . . . . .  214
      177   CCVS-PGM-ID. . . . . . . . . .  183 183
       61   CM-18V0
       55   COMPUTED-A . . . . . . . . . .  56 58 59 60 61 284 287
       56   COMPUTED-N
       54   COMPUTED-X . . . . . . . . . .  M206 270
       58   COMPUTED-0V18
       60   COMPUTED-14V4
       62   COMPUTED-18V0. . . . . . . . .  M304 M318 M331
       59   COMPUTED-4V14
       78   COR-ANSI-REFERENCE . . . . . .  M279 M281
       69   CORRECT-A. . . . . . . . . . .  70 71 72 73 74 285 287
       70   CORRECT-N
       68   CORRECT-X. . . . . . . . . . .  M207 271
       71   CORRECT-0V18
       73   CORRECT-14V4
       75   CORRECT-18V0 . . . . . . . . .  M303 M317 M330
       72   CORRECT-4V14
       74   CR-18V0
       92   DELETE-COUNTER . . . . . . . .  M196 225 241 243
       35   DN1. . . . . . . . . . . . . .  298 299 304
       36   DN2. . . . . . . . . . . . . .  312 313 318
       37   DN3. . . . . . . . . . . . . .  312 326 331
       47   DOTVALUE . . . . . . . . . . .  M201
       98   DUMMY-HOLD . . . . . . . . . .  M255 261
       33   DUMMY-RECORD . . . . . . . . .  M211 M212 M213 M214 M216 M217 M218 M220 M222 M231 M238 M245 M250 M251 255 M256
                                            257 M258 M259 M260 M261 265 M266 M274 M289
      145   ENDER-DESC . . . . . . . . . .  M233 M244 M249
       93   ERROR-COUNTER. . . . . . . . .  M195 224 234 237
       97   ERROR-HOLD . . . . . . . . . .  M224 M225 M225 M226 229
      143   ERROR-TOTAL. . . . . . . . . .  M235 M237 M242 M243 M247 M248
       40   FEATURE. . . . . . . . . . . .  M295 M309 M323
      171   HYPHEN-LINE. . . . . . . . . .  218 220 260
      137   ID-AGAIN . . . . . . . . . . .  M183
      170   INF-ANSI-REFERENCE . . . . . .  M272 M275 M288 M290
      165   INFO-TEXT. . . . . . . . . . .  M273
       94   INSPECT-COUNTER. . . . . . . .  M193 224 246 248
       42   P-OR-F . . . . . . . . . . . .  M193 M194 M195 M196 203 M206
       44   PAR-NAME . . . . . . . . . . .  M208 M296 M310 M324
       46   PARDOT-X . . . . . . . . . . .  M200
       95   PASS-COUNTER . . . . . . . . .  M194 226 228
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page    10
0 Defined   Cross-reference of data names   References

0      31   PRINT-FILE . . . . . . . . . .  27 182 188
       32   PRINT-REC. . . . . . . . . . .  M202 M278 M280
       49   RE-MARK. . . . . . . . . . . .  M197 M209 M297 M311 M325
       91   REC-CT . . . . . . . . . . . .  199 201 208
       90   REC-SKL-SUB
       99   RECORD-COUNT . . . . . . . . .  M253 254 M262
       50   TEST-COMPUTED. . . . . . . . .  278
       65   TEST-CORRECT . . . . . . . . .  280
      118   TEST-ID. . . . . . . . . . . .  M183
       38   TEST-RESULTS . . . . . . . . .  M184 202
       96   TOTAL-ERROR
      167   XXCOMPUTED . . . . . . . . . .  M287
      169   XXCORRECT. . . . . . . . . . .  M287
      162   XXINFO . . . . . . . . . . . .  274 289
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page    11
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

      283   BAIL-OUT . . . . . . . . . . .  P205
      291   BAIL-OUT-EX. . . . . . . . . .  E205 G285
      286   BAIL-OUT-WRITE . . . . . . . .  G284
      267   BLANK-LINE-PRINT
      302   CALL-FAIL-1
      316   CALL-FAIL-2
      294   CALL-TEST-1
      308   CALL-TEST-2
      306   CALL-WRITE-1 . . . . . . . . .  G301
      320   CALL-WRITE-2 . . . . . . . . .  G315
      329   CANCEL-FAIL-1
      322   CANCEL-TEST-1
      333   CANCEL-WRITE-1 . . . . . . . .  G328
      335   CCVS-EXIT
      336   CCVS-999999
      180   CCVS1
      292   CCVS1-EXIT . . . . . . . . . .  G186
      187   CLOSE-FILES. . . . . . . . . .  G337
      215   COLUMN-NAMES-ROUTINE . . . . .  E185
      196   DE-LETE
      219   END-ROUTINE. . . . . . . . . .  P188
      223   END-ROUTINE-1
      232   END-ROUTINE-12
      240   END-ROUTINE-13 . . . . . . . .  E188
      221   END-RTN-EXIT
      195   FAIL . . . . . . . . . . . . .  P305 P319 P332
      269   FAIL-ROUTINE . . . . . . . . .  P204
      282   FAIL-ROUTINE-EX. . . . . . . .  E204 G276
      277   FAIL-ROUTINE-WRITE . . . . . .  G270 G271
      210   HEAD-ROUTINE . . . . . . . . .  P185
      193   INSPT
      181   OPEN-FILES
      194   PASS . . . . . . . . . . . . .  P300 P314 P327
      198   PRINT-DETAIL . . . . . . . . .  P307 P321 P334
      191   TERMINATE-CALL
      189   TERMINATE-CCVS
      252   WRITE-LINE . . . . . . . . . .  P202 P203 P211 P212 P213 P214 P216 P217 P218 P220 P222 P231 P239 P245 P250 P251
                                            P274 P278 P280 P289
      264   WRT-LN . . . . . . . . . . . .  P258 P259 P260 P263 P268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page    12
0 Defined   Cross-reference of programs     References

        3   IC213A
 EXTERNAL   IC214A . . . . . . . . . . . .  298
 EXTERNAL   IC215A . . . . . . . . . . . .  312
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC213A    Date 06/04/2022  Time 11:58:25   Page    13
0LineID  Message code  Message text

     31  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC213A:
 *    Source records = 337
 *    Data Division statements = 66
 *    Procedure Division statements = 160
 *    Generated COBOL statements = 0
 *    Program complexity factor = 168
0End of compilation 1,  program IC213A,  highest severity 0.
0Return code 0
