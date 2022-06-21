1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:46   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:46   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2094.2
   000002         000200 PROGRAM-ID.                                                      IC2094.2
   000003         000300     IC209A.                                                      IC2094.2
   000004         000500*                                                              *  IC2094.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2094.2
   000006         000700*                                                              *  IC2094.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2094.2
   000008         000900*                                                              *  IC2094.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2094.2
   000010         001100*                                                              *  IC2094.2
   000011         001300*                                                              *  IC2094.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2094.2
   000013         001500*                                                              *  IC2094.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2094.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2094.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2094.2
   000017         001900*                                                              *  IC2094.2
   000018         002100*    THIS IS MAIN PROGRAM IC209.                                  IC2094.2
   000019         002300 ENVIRONMENT DIVISION.                                            IC2094.2
   000020         002400 CONFIGURATION SECTION.                                           IC2094.2
   000021         002500 SOURCE-COMPUTER.                                                 IC2094.2
   000022         002600     XXXXX082.                                                    IC2094.2
   000023         002700 OBJECT-COMPUTER.                                                 IC2094.2
   000024         002800     XXXXX083.                                                    IC2094.2
   000025         002900 INPUT-OUTPUT SECTION.                                            IC2094.2
   000026         003000 FILE-CONTROL.                                                    IC2094.2
   000027         003100     SELECT PRINT-FILE ASSIGN TO                                  IC2094.2 31
   000028         003200     XXXXX055.                                                    IC2094.2
   000029         003300 DATA DIVISION.                                                   IC2094.2
   000030         003400 FILE SECTION.                                                    IC2094.2
   000031         003500 FD  PRINT-FILE.                                                  IC2094.2

 ==000031==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000032         003600 01  PRINT-REC PICTURE X(120).                                    IC2094.2
   000033         003700 01  DUMMY-RECORD PICTURE X(120).                                 IC2094.2
   000034         003800 WORKING-STORAGE SECTION.                                         IC2094.2
   000035         003900 01  TEST-AREA.                                                   IC2094.2
   000036         004000     02  TEST1                   PICTURE X.                       IC2094.2
   000037         004100     02  TEST2                   PICTURE X.                       IC2094.2
   000038         004200     02  TEST3                   PICTURE X.                       IC2094.2
   000039         004300     02  TEST4                   PICTURE X.                       IC2094.2
   000040         004400 01  TEST-RESULTS.                                                IC2094.2
   000041         004500     02 FILLER                   PIC X      VALUE SPACE.          IC2094.2 IMP
   000042         004600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2094.2 IMP
   000043         004700     02 FILLER                   PIC X      VALUE SPACE.          IC2094.2 IMP
   000044         004800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2094.2 IMP
   000045         004900     02 FILLER                   PIC X      VALUE SPACE.          IC2094.2 IMP
   000046         005000     02  PAR-NAME.                                                IC2094.2
   000047         005100       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2094.2 IMP
   000048         005200       03  PARDOT-X              PIC X      VALUE SPACE.          IC2094.2 IMP
   000049         005300       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2094.2 IMP
   000050         005400     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2094.2 IMP
   000051         005500     02 RE-MARK                  PIC X(61).                       IC2094.2
   000052         005600 01  TEST-COMPUTED.                                               IC2094.2
   000053         005700     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2094.2 IMP
   000054         005800     02 FILLER                   PIC X(17)  VALUE                 IC2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900            "       COMPUTED=".                                   IC2094.2
   000056         006000     02 COMPUTED-X.                                               IC2094.2
   000057         006100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2094.2 IMP
   000058         006200     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2094.2 57
   000059         006300                                 PIC -9(9).9(9).                  IC2094.2
   000060         006400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2094.2 57
   000061         006500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2094.2 57
   000062         006600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2094.2 57
   000063         006700     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2094.2 57
   000064         006800         04 COMPUTED-18V0                    PIC -9(18).          IC2094.2
   000065         006900         04 FILLER                           PIC X.               IC2094.2
   000066         007000     03 FILLER PIC X(50) VALUE SPACE.                             IC2094.2 IMP
   000067         007100 01  TEST-CORRECT.                                                IC2094.2
   000068         007200     02 FILLER PIC X(30) VALUE SPACE.                             IC2094.2 IMP
   000069         007300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2094.2
   000070         007400     02 CORRECT-X.                                                IC2094.2
   000071         007500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2094.2 IMP
   000072         007600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2094.2 71
   000073         007700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2094.2 71
   000074         007800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2094.2 71
   000075         007900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2094.2 71
   000076         008000     03      CR-18V0 REDEFINES CORRECT-A.                         IC2094.2 71
   000077         008100         04 CORRECT-18V0                     PIC -9(18).          IC2094.2
   000078         008200         04 FILLER                           PIC X.               IC2094.2
   000079         008300     03 FILLER PIC X(2) VALUE SPACE.                              IC2094.2 IMP
   000080         008400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2094.2 IMP
   000081         008500 01  CCVS-C-1.                                                    IC2094.2
   000082         008600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2094.2
   000083         008700-    "SS  PARAGRAPH-NAME                                          IC2094.2
   000084         008800-    "       REMARKS".                                            IC2094.2
   000085         008900     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2094.2 IMP
   000086         009000 01  CCVS-C-2.                                                    IC2094.2
   000087         009100     02 FILLER                     PIC X        VALUE SPACE.      IC2094.2 IMP
   000088         009200     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2094.2
   000089         009300     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2094.2 IMP
   000090         009400     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2094.2
   000091         009500     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2094.2 IMP
   000092         009600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2094.2 IMP
   000093         009700 01  REC-CT                        PIC 99       VALUE ZERO.       IC2094.2 IMP
   000094         009800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2094.2 IMP
   000095         009900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2094.2 IMP
   000096         010000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2094.2 IMP
   000097         010100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2094.2 IMP
   000098         010200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2094.2 IMP
   000099         010300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2094.2 IMP
   000100         010400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2094.2 IMP
   000101         010500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2094.2 IMP
   000102         010600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2094.2 IMP
   000103         010700 01  CCVS-H-1.                                                    IC2094.2
   000104         010800     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2094.2 IMP
   000105         010900     02  FILLER                    PIC X(42)    VALUE             IC2094.2
   000106         011000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2094.2
   000107         011100     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2094.2 IMP
   000108         011200 01  CCVS-H-2A.                                                   IC2094.2
   000109         011300   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2094.2 IMP
   000110         011400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2094.2
   000111         011500   02  FILLER                        PIC XXXX   VALUE             IC2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     "4.2 ".                                                      IC2094.2
   000113         011700   02  FILLER                        PIC X(28)  VALUE             IC2094.2
   000114         011800            " COPY - NOT FOR DISTRIBUTION".                       IC2094.2
   000115         011900   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2094.2 IMP
   000116         012000                                                                  IC2094.2
   000117         012100 01  CCVS-H-2B.                                                   IC2094.2
   000118         012200   02  FILLER                        PIC X(15)  VALUE             IC2094.2
   000119         012300            "TEST RESULT OF ".                                    IC2094.2
   000120         012400   02  TEST-ID                       PIC X(9).                    IC2094.2
   000121         012500   02  FILLER                        PIC X(4)   VALUE             IC2094.2
   000122         012600            " IN ".                                               IC2094.2
   000123         012700   02  FILLER                        PIC X(12)  VALUE             IC2094.2
   000124         012800     " HIGH       ".                                              IC2094.2
   000125         012900   02  FILLER                        PIC X(22)  VALUE             IC2094.2
   000126         013000            " LEVEL VALIDATION FOR ".                             IC2094.2
   000127         013100   02  FILLER                        PIC X(58)  VALUE             IC2094.2
   000128         013200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2094.2
   000129         013300 01  CCVS-H-3.                                                    IC2094.2
   000130         013400     02  FILLER                      PIC X(34)  VALUE             IC2094.2
   000131         013500            " FOR OFFICIAL USE ONLY    ".                         IC2094.2
   000132         013600     02  FILLER                      PIC X(58)  VALUE             IC2094.2
   000133         013700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2094.2
   000134         013800     02  FILLER                      PIC X(28)  VALUE             IC2094.2
   000135         013900            "  COPYRIGHT   1985 ".                                IC2094.2
   000136         014000 01  CCVS-E-1.                                                    IC2094.2
   000137         014100     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2094.2 IMP
   000138         014200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2094.2
   000139         014300     02 ID-AGAIN                     PIC X(9).                    IC2094.2
   000140         014400     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2094.2 IMP
   000141         014500 01  CCVS-E-2.                                                    IC2094.2
   000142         014600     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2094.2 IMP
   000143         014700     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2094.2 IMP
   000144         014800     02 CCVS-E-2-2.                                               IC2094.2
   000145         014900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2094.2 IMP
   000146         015000         03 FILLER                   PIC X      VALUE SPACE.      IC2094.2 IMP
   000147         015100         03 ENDER-DESC               PIC X(44)  VALUE             IC2094.2
   000148         015200            "ERRORS ENCOUNTERED".                                 IC2094.2
   000149         015300 01  CCVS-E-3.                                                    IC2094.2
   000150         015400     02  FILLER                      PIC X(22)  VALUE             IC2094.2
   000151         015500            " FOR OFFICIAL USE ONLY".                             IC2094.2
   000152         015600     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2094.2 IMP
   000153         015700     02  FILLER                      PIC X(58)  VALUE             IC2094.2
   000154         015800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2094.2
   000155         015900     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2094.2 IMP
   000156         016000     02 FILLER                       PIC X(15)  VALUE             IC2094.2
   000157         016100             " COPYRIGHT 1985".                                   IC2094.2
   000158         016200 01  CCVS-E-4.                                                    IC2094.2
   000159         016300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2094.2 IMP
   000160         016400     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2094.2
   000161         016500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2094.2 IMP
   000162         016600     02 FILLER                       PIC X(40)  VALUE             IC2094.2
   000163         016700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2094.2
   000164         016800 01  XXINFO.                                                      IC2094.2
   000165         016900     02 FILLER                       PIC X(19)  VALUE             IC2094.2
   000166         017000            "*** INFORMATION ***".                                IC2094.2
   000167         017100     02 INFO-TEXT.                                                IC2094.2
   000168         017200       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2094.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300       04 XXCOMPUTED                 PIC X(20).                   IC2094.2
   000170         017400       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2094.2 IMP
   000171         017500       04 XXCORRECT                  PIC X(20).                   IC2094.2
   000172         017600     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2094.2
   000173         017700 01  HYPHEN-LINE.                                                 IC2094.2
   000174         017800     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2094.2 IMP
   000175         017900     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2094.2
   000176         018000-    "*****************************************".                 IC2094.2
   000177         018100     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2094.2
   000178         018200-    "******************************".                            IC2094.2
   000179         018300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2094.2
   000180         018400     "IC209A".                                                    IC2094.2
   000181         018500 PROCEDURE DIVISION.                                              IC2094.2
   000182         018600 CCVS1 SECTION.                                                   IC2094.2
   000183         018700 OPEN-FILES.                                                      IC2094.2
   000184         018800     OPEN     OUTPUT PRINT-FILE.                                  IC2094.2 31
   000185         018900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2094.2 179 120 179 139
   000186         019000     MOVE    SPACE TO TEST-RESULTS.                               IC2094.2 IMP 40
   000187         019100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2094.2 212 217
   000188         019200     GO TO CCVS1-EXIT.                                            IC2094.2 294
   000189         019300 CLOSE-FILES.                                                     IC2094.2
   000190         019400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2094.2 221 242 31
   000191         019500 TERMINATE-CCVS.                                                  IC2094.2
   000192         019600     EXIT PROGRAM.                                                IC2094.2
   000193         019700 TERMINATE-CALL.                                                  IC2094.2
   000194         019800     STOP     RUN.                                                IC2094.2
   000195         019900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2094.2 44 96
   000196         020000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2094.2 44 97
   000197         020100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2094.2 44 95
   000198         020200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2094.2 44 94
   000199         020300     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2094.2 51
   000200         020400 PRINT-DETAIL.                                                    IC2094.2
   000201         020500     IF REC-CT NOT EQUAL TO ZERO                                  IC2094.2 93 IMP
   000202      1  020600             MOVE "." TO PARDOT-X                                 IC2094.2 48
   000203      1  020700             MOVE REC-CT TO DOTVALUE.                             IC2094.2 93 49
   000204         020800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2094.2 40 32 254
   000205         020900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2094.2 44 254
   000206      1  021000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2094.2 271 284
   000207      1  021100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2094.2 285 293
   000208         021200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2094.2 IMP 44 IMP 56
   000209         021300     MOVE SPACE TO CORRECT-X.                                     IC2094.2 IMP 70
   000210         021400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2094.2 93 IMP IMP 46
   000211         021500     MOVE     SPACE TO RE-MARK.                                   IC2094.2 IMP 51
   000212         021600 HEAD-ROUTINE.                                                    IC2094.2
   000213         021700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2094.2 103 33 254
   000214         021800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2094.2 108 33 254
   000215         021900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2094.2 117 33 254
   000216         022000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2094.2 129 33 254
   000217         022100 COLUMN-NAMES-ROUTINE.                                            IC2094.2
   000218         022200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2094.2 81 33 254
   000219         022300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2094.2 86 33 254
   000220         022400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2094.2 173 33 254
   000221         022500 END-ROUTINE.                                                     IC2094.2
   000222         022600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2094.2 173 33 254
   000223         022700 END-RTN-EXIT.                                                    IC2094.2
   000224         022800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2094.2 136 33 254
   000225         022900 END-ROUTINE-1.                                                   IC2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2094.2 95 99 96
   000227         023100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2094.2 99 94 99
   000228         023200      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2094.2 97 99
   000229         023300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2094.2
   000230         023400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2094.2 97 159
   000231         023500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2094.2 99 161
   000232         023600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2094.2 158 144
   000233         023700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2094.2 141 33 254
   000234         023800  END-ROUTINE-12.                                                 IC2094.2
   000235         023900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2094.2 147
   000236         024000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2094.2 95 IMP
   000237      1  024100         MOVE "NO " TO ERROR-TOTAL                                IC2094.2 145
   000238         024200         ELSE                                                     IC2094.2
   000239      1  024300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2094.2 95 145
   000240         024400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2094.2 141 33
   000241         024500     PERFORM WRITE-LINE.                                          IC2094.2 254
   000242         024600 END-ROUTINE-13.                                                  IC2094.2
   000243         024700     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2094.2 94 IMP
   000244      1  024800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2094.2 145
   000245      1  024900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2094.2 94 145
   000246         025000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2094.2 147
   000247         025100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2094.2 141 33 254
   000248         025200      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2094.2 96 IMP
   000249      1  025300          MOVE "NO " TO ERROR-TOTAL                               IC2094.2 145
   000250      1  025400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2094.2 96 145
   000251         025500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2094.2 147
   000252         025600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2094.2 141 33 254
   000253         025700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2094.2 149 33 254
   000254         025800 WRITE-LINE.                                                      IC2094.2
   000255         025900     ADD 1 TO RECORD-COUNT.                                       IC2094.2 101
   000256         026000     IF RECORD-COUNT GREATER 50                                   IC2094.2 101
   000257      1  026100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2094.2 33 100
   000258      1  026200         MOVE SPACE TO DUMMY-RECORD                               IC2094.2 IMP 33
   000259      1  026300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2094.2 33
   000260      1  026400         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2094.2 81 33 266
   000261      1  026500         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2094.2 86 33 266
   000262      1  026600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2094.2 173 33 266
   000263      1  026700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2094.2 100 33
   000264      1  026800         MOVE ZERO TO RECORD-COUNT.                               IC2094.2 IMP 101
   000265         026900     PERFORM WRT-LN.                                              IC2094.2 266
   000266         027000 WRT-LN.                                                          IC2094.2
   000267         027100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2094.2 33
   000268         027200     MOVE SPACE TO DUMMY-RECORD.                                  IC2094.2 IMP 33
   000269         027300 BLANK-LINE-PRINT.                                                IC2094.2
   000270         027400     PERFORM WRT-LN.                                              IC2094.2 266
   000271         027500 FAIL-ROUTINE.                                                    IC2094.2
   000272         027600     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2094.2 56 IMP 279
   000273         027700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2094.2 70 IMP 279
   000274         027800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2094.2 102 172
   000275         027900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2094.2 167
   000276         028000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2094.2 164 33 254
   000277         028100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2094.2 IMP 172
   000278         028200     GO TO  FAIL-ROUTINE-EX.                                      IC2094.2 284
   000279         028300 FAIL-ROUTINE-WRITE.                                              IC2094.2
   000280         028400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2094.2 52 32 254
   000281         028500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2094.2 102 80
   000282         028600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2094.2 67 32 254
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2094.2 IMP 80
   000284         028800 FAIL-ROUTINE-EX. EXIT.                                           IC2094.2
   000285         028900 BAIL-OUT.                                                        IC2094.2
   000286         029000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2094.2 57 IMP 288
   000287         029100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2094.2 71 IMP 293
   000288         029200 BAIL-OUT-WRITE.                                                  IC2094.2
   000289         029300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2094.2 71 171 57 169
   000290         029400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2094.2 102 172
   000291         029500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2094.2 164 33 254
   000292         029600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2094.2 IMP 172
   000293         029700 BAIL-OUT-EX. EXIT.                                               IC2094.2
   000294         029800 CCVS1-EXIT.                                                      IC2094.2
   000295         029900     EXIT.                                                        IC2094.2
   000296         030000 CALL-TEST-1.                                                     IC2094.2
   000297         030100     MOVE SPACES TO TEST-AREA.                                    IC2094.2 IMP 35
   000298         030200     CALL "IC210A" USING TEST-AREA.                               IC2094.2 EXT 35
   000299         030300     MOVE "CALL...USING DATA-NM" TO FEATURE.                      IC2094.2 42
   000300         030400     MOVE "CALL-TEST-1" TO PAR-NAME.                              IC2094.2 46
   000301         030500     MOVE "MAIN PROGRAM CALLS SUBPROGRAM1" TO RE-MARK.            IC2094.2 51
   000302         030600     IF TEST1 = "Y" PERFORM PASS                                  IC2094.2 36 196
   000303      1  030700        GO TO CALL-WRITE-1.                                       IC2094.2 308
   000304         030800 CALL-FAIL-1.                                                     IC2094.2
   000305         030900     MOVE TEST1 TO COMPUTED-A.                                    IC2094.2 36 57
   000306         031000     MOVE "Y" TO CORRECT-A.                                       IC2094.2 71
   000307         031100     PERFORM FAIL.                                                IC2094.2 197
   000308         031200 CALL-WRITE-1.                                                    IC2094.2
   000309         031300     PERFORM PRINT-DETAIL.                                        IC2094.2 200
   000310         031400 CALL-TEST-2.                                                     IC2094.2
   000311         031500     MOVE "CALL...USING DATA-NM" TO FEATURE.                      IC2094.2 42
   000312         031600     MOVE "CALL-TEST-2" TO PAR-NAME.                              IC2094.2 46
   000313         031700     MOVE "SUBPROGRAM1 CALLS SUBPROGRAM2" TO RE-MARK.             IC2094.2 51
   000314         031800     IF TEST2 = "Y" PERFORM PASS                                  IC2094.2 37 196
   000315      1  031900        GO TO CALL-WRITE-2.                                       IC2094.2 320
   000316         032000 CALL-FAIL-2.                                                     IC2094.2
   000317         032100     MOVE TEST2 TO COMPUTED-A.                                    IC2094.2 37 57
   000318         032200     MOVE "Y" TO CORRECT-A.                                       IC2094.2 71
   000319         032300     PERFORM FAIL.                                                IC2094.2 197
   000320         032400 CALL-WRITE-2.                                                    IC2094.2
   000321         032500     PERFORM PRINT-DETAIL.                                        IC2094.2 200
   000322         032600 CALL-TEST-3.                                                     IC2094.2
   000323         032700     MOVE "CALL...USING DATA-NM" TO FEATURE.                      IC2094.2 42
   000324         032800     MOVE "CALL-TEST-3" TO PAR-NAME.                              IC2094.2 46
   000325         032900     MOVE "SUBPROGRAM1 CALLS SUBPROGRAM3" TO RE-MARK.             IC2094.2 51
   000326         033000     IF TEST3 = "Y" PERFORM PASS                                  IC2094.2 38 196
   000327      1  033100        GO TO CALL-WRITE-3.                                       IC2094.2 332
   000328         033200 CALL-FAIL-3.                                                     IC2094.2
   000329         033300     MOVE TEST3 TO COMPUTED-A.                                    IC2094.2 38 57
   000330         033400     MOVE "Y" TO CORRECT-A.                                       IC2094.2 71
   000331         033500     PERFORM FAIL.                                                IC2094.2 197
   000332         033600 CALL-WRITE-3.                                                    IC2094.2
   000333         033700     PERFORM PRINT-DETAIL.                                        IC2094.2 200
   000334         033800 CANCEL-TEST-1.                                                   IC2094.2
   000335         033900     MOVE "CANCEL" TO FEATURE.                                    IC2094.2 42
   000336         034000     MOVE "CANCEL-TEST-1" TO PAR-NAME.                            IC2094.2 46
   000337         034100     MOVE "SUBPROGRAM1 CANCELS SUBPROGRAM2" TO RE-MARK.           IC2094.2 51
   000338         034200     IF TEST4 = "Y" PERFORM PASS                                  IC2094.2 39 196
   000339      1  034300        GO TO CANCEL-WRITE-1.                                     IC2094.2 344
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400 CANCEL-FAIL-1.                                                   IC2094.2
   000341         034500     MOVE TEST4 TO COMPUTED-A.                                    IC2094.2 39 57
   000342         034600     MOVE "Y" TO CORRECT-A.                                       IC2094.2 71
   000343         034700     PERFORM FAIL.                                                IC2094.2 197
   000344         034800 CANCEL-WRITE-1.                                                  IC2094.2
   000345         034900     PERFORM PRINT-DETAIL.                                        IC2094.2 200
   000346         035000 CCVS-EXIT SECTION.                                               IC2094.2
   000347         035100 CCVS-999999.                                                     IC2094.2
   000348         035200     GO TO CLOSE-FILES.                                           IC2094.2 189
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page    10
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      102   ANSI-REFERENCE . . . . . . . .  274 281 290
       81   CCVS-C-1 . . . . . . . . . . .  218 260
       86   CCVS-C-2 . . . . . . . . . . .  219 261
      136   CCVS-E-1 . . . . . . . . . . .  224
      141   CCVS-E-2 . . . . . . . . . . .  233 240 247 252
      144   CCVS-E-2-2 . . . . . . . . . .  M232
      149   CCVS-E-3 . . . . . . . . . . .  253
      158   CCVS-E-4 . . . . . . . . . . .  232
      159   CCVS-E-4-1 . . . . . . . . . .  M230
      161   CCVS-E-4-2 . . . . . . . . . .  M231
      103   CCVS-H-1 . . . . . . . . . . .  213
      108   CCVS-H-2A. . . . . . . . . . .  214
      117   CCVS-H-2B. . . . . . . . . . .  215
      129   CCVS-H-3 . . . . . . . . . . .  216
      179   CCVS-PGM-ID. . . . . . . . . .  185 185
       63   CM-18V0
       57   COMPUTED-A . . . . . . . . . .  58 60 61 62 63 286 289 M305 M317 M329 M341
       58   COMPUTED-N
       56   COMPUTED-X . . . . . . . . . .  M208 272
       60   COMPUTED-0V18
       62   COMPUTED-14V4
       64   COMPUTED-18V0
       61   COMPUTED-4V14
       80   COR-ANSI-REFERENCE . . . . . .  M281 M283
       71   CORRECT-A. . . . . . . . . . .  72 73 74 75 76 287 289 M306 M318 M330 M342
       72   CORRECT-N
       70   CORRECT-X. . . . . . . . . . .  M209 273
       73   CORRECT-0V18
       75   CORRECT-14V4
       77   CORRECT-18V0
       74   CORRECT-4V14
       76   CR-18V0
       94   DELETE-COUNTER . . . . . . . .  M198 227 243 245
       49   DOTVALUE . . . . . . . . . . .  M203
      100   DUMMY-HOLD . . . . . . . . . .  M257 263
       33   DUMMY-RECORD . . . . . . . . .  M213 M214 M215 M216 M218 M219 M220 M222 M224 M233 M240 M247 M252 M253 257 M258
                                            259 M260 M261 M262 M263 267 M268 M276 M291
      147   ENDER-DESC . . . . . . . . . .  M235 M246 M251
       95   ERROR-COUNTER. . . . . . . . .  M197 226 236 239
       99   ERROR-HOLD . . . . . . . . . .  M226 M227 M227 M228 231
      145   ERROR-TOTAL. . . . . . . . . .  M237 M239 M244 M245 M249 M250
       42   FEATURE. . . . . . . . . . . .  M299 M311 M323 M335
      173   HYPHEN-LINE. . . . . . . . . .  220 222 262
      139   ID-AGAIN . . . . . . . . . . .  M185
      172   INF-ANSI-REFERENCE . . . . . .  M274 M277 M290 M292
      167   INFO-TEXT. . . . . . . . . . .  M275
       96   INSPECT-COUNTER. . . . . . . .  M195 226 248 250
       44   P-OR-F . . . . . . . . . . . .  M195 M196 M197 M198 205 M208
       46   PAR-NAME . . . . . . . . . . .  M210 M300 M312 M324 M336
       48   PARDOT-X . . . . . . . . . . .  M202
       97   PASS-COUNTER . . . . . . . . .  M196 228 230
       31   PRINT-FILE . . . . . . . . . .  27 184 190
       32   PRINT-REC. . . . . . . . . . .  M204 M280 M282
       51   RE-MARK. . . . . . . . . . . .  M199 M211 M301 M313 M325 M337
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page    11
0 Defined   Cross-reference of data names   References

0      93   REC-CT . . . . . . . . . . . .  201 203 210
       92   REC-SKL-SUB
      101   RECORD-COUNT . . . . . . . . .  M255 256 M264
       35   TEST-AREA. . . . . . . . . . .  M297 298
       52   TEST-COMPUTED. . . . . . . . .  280
       67   TEST-CORRECT . . . . . . . . .  282
      120   TEST-ID. . . . . . . . . . . .  M185
       40   TEST-RESULTS . . . . . . . . .  M186 204
       36   TEST1. . . . . . . . . . . . .  302 305
       37   TEST2. . . . . . . . . . . . .  314 317
       38   TEST3. . . . . . . . . . . . .  326 329
       39   TEST4. . . . . . . . . . . . .  338 341
       98   TOTAL-ERROR
      169   XXCOMPUTED . . . . . . . . . .  M289
      171   XXCORRECT. . . . . . . . . . .  M289
      164   XXINFO . . . . . . . . . . . .  276 291
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page    12
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

      285   BAIL-OUT . . . . . . . . . . .  P207
      293   BAIL-OUT-EX. . . . . . . . . .  E207 G287
      288   BAIL-OUT-WRITE . . . . . . . .  G286
      269   BLANK-LINE-PRINT
      304   CALL-FAIL-1
      316   CALL-FAIL-2
      328   CALL-FAIL-3
      296   CALL-TEST-1
      310   CALL-TEST-2
      322   CALL-TEST-3
      308   CALL-WRITE-1 . . . . . . . . .  G303
      320   CALL-WRITE-2 . . . . . . . . .  G315
      332   CALL-WRITE-3 . . . . . . . . .  G327
      340   CANCEL-FAIL-1
      334   CANCEL-TEST-1
      344   CANCEL-WRITE-1 . . . . . . . .  G339
      346   CCVS-EXIT
      347   CCVS-999999
      182   CCVS1
      294   CCVS1-EXIT . . . . . . . . . .  G188
      189   CLOSE-FILES. . . . . . . . . .  G348
      217   COLUMN-NAMES-ROUTINE . . . . .  E187
      198   DE-LETE
      221   END-ROUTINE. . . . . . . . . .  P190
      225   END-ROUTINE-1
      234   END-ROUTINE-12
      242   END-ROUTINE-13 . . . . . . . .  E190
      223   END-RTN-EXIT
      197   FAIL . . . . . . . . . . . . .  P307 P319 P331 P343
      271   FAIL-ROUTINE . . . . . . . . .  P206
      284   FAIL-ROUTINE-EX. . . . . . . .  E206 G278
      279   FAIL-ROUTINE-WRITE . . . . . .  G272 G273
      212   HEAD-ROUTINE . . . . . . . . .  P187
      195   INSPT
      183   OPEN-FILES
      196   PASS . . . . . . . . . . . . .  P302 P314 P326 P338
      200   PRINT-DETAIL . . . . . . . . .  P309 P321 P333 P345
      193   TERMINATE-CALL
      191   TERMINATE-CCVS
      254   WRITE-LINE . . . . . . . . . .  P204 P205 P213 P214 P215 P216 P218 P219 P220 P222 P224 P233 P241 P247 P252 P253
                                            P276 P280 P282 P291
      266   WRT-LN . . . . . . . . . . . .  P260 P261 P262 P265 P270
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page    13
0 Defined   Cross-reference of programs     References

        3   IC209A
 EXTERNAL   IC210A . . . . . . . . . . . .  298
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC209A    Date 06/04/2022  Time 11:58:46   Page    14
0LineID  Message code  Message text

     31  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC209A:
 *    Source records = 348
 *    Data Division statements = 68
 *    Procedure Division statements = 170
 *    Generated COBOL statements = 0
 *    Program complexity factor = 177
0End of compilation 1,  program IC209A,  highest severity 0.
0Return code 0
