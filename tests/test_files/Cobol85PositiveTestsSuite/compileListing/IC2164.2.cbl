1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:47   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:47   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2164.2
   000002         000200 PROGRAM-ID.                                                      IC2164.2
   000003         000300     IC216A.                                                      IC2164.2
   000004         000500*                                                              *  IC2164.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2164.2
   000006         000700*                                                              *  IC2164.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2164.2
   000008         000900*                                                              *  IC2164.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2164.2
   000010         001100*                                                              *  IC2164.2
   000011         001300*                                                              *  IC2164.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2164.2
   000013         001500*                                                              *  IC2164.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2164.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2164.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2164.2
   000017         001900*                                                              *  IC2164.2
   000018         002100*    THIS IS MAIN PROGRAM IC216.                                  IC2164.2
   000019         002300 ENVIRONMENT DIVISION.                                            IC2164.2
   000020         002400 CONFIGURATION SECTION.                                           IC2164.2
   000021         002500 SOURCE-COMPUTER.                                                 IC2164.2
   000022         002600     XXXXX082.                                                    IC2164.2
   000023         002700 OBJECT-COMPUTER.                                                 IC2164.2
   000024         002800     XXXXX083.                                                    IC2164.2
   000025         002900 INPUT-OUTPUT SECTION.                                            IC2164.2
   000026         003000 FILE-CONTROL.                                                    IC2164.2
   000027         003100     SELECT PRINT-FILE ASSIGN TO                                  IC2164.2 31
   000028         003200     XXXXX055.                                                    IC2164.2
   000029         003300 DATA DIVISION.                                                   IC2164.2
   000030         003400 FILE SECTION.                                                    IC2164.2
   000031         003500 FD  PRINT-FILE.                                                  IC2164.2

 ==000031==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000032         003600 01  PRINT-REC PICTURE X(120).                                    IC2164.2
   000033         003700 01  DUMMY-RECORD PICTURE X(120).                                 IC2164.2
   000034         003800 WORKING-STORAGE SECTION.                                         IC2164.2
   000035         003900 01  DN1.                                                         IC2164.2
   000036         004000     02  DN2                     PICTURE X(5).                    IC2164.2
   000037         004100     02  DN3                     REDEFINES DN2   PICTURE 9(5).    IC2164.2 36
   000038         004200 01  DN4.                                                         IC2164.2
   000039         004300     02  DN5.                                                     IC2164.2
   000040         004400          03  DN6                 PICTURE X(3).                   IC2164.2
   000041         004500         03  DN7                 PICTURE X(3).                    IC2164.2
   000042         004600         03  DN8                 REDEFINES DN7   PICTURE 9(3).    IC2164.2 41
   000043         004700     02  DN9                     PICTURE XX.                      IC2164.2
   000044         004800 01  TEST-RESULTS.                                                IC2164.2
   000045         004900     02 FILLER                   PIC X      VALUE SPACE.          IC2164.2 IMP
   000046         005000     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2164.2 IMP
   000047         005100     02 FILLER                   PIC X      VALUE SPACE.          IC2164.2 IMP
   000048         005200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2164.2 IMP
   000049         005300     02 FILLER                   PIC X      VALUE SPACE.          IC2164.2 IMP
   000050         005400     02  PAR-NAME.                                                IC2164.2
   000051         005500       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2164.2 IMP
   000052         005600       03  PARDOT-X              PIC X      VALUE SPACE.          IC2164.2 IMP
   000053         005700       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2164.2 IMP
   000054         005800     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2164.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02 RE-MARK                  PIC X(61).                       IC2164.2
   000056         006000 01  TEST-COMPUTED.                                               IC2164.2
   000057         006100     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2164.2 IMP
   000058         006200     02 FILLER                   PIC X(17)  VALUE                 IC2164.2
   000059         006300            "       COMPUTED=".                                   IC2164.2
   000060         006400     02 COMPUTED-X.                                               IC2164.2
   000061         006500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2164.2 IMP
   000062         006600     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2164.2 61
   000063         006700                                 PIC -9(9).9(9).                  IC2164.2
   000064         006800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2164.2 61
   000065         006900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2164.2 61
   000066         007000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2164.2 61
   000067         007100     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2164.2 61
   000068         007200         04 COMPUTED-18V0                    PIC -9(18).          IC2164.2
   000069         007300         04 FILLER                           PIC X.               IC2164.2
   000070         007400     03 FILLER PIC X(50) VALUE SPACE.                             IC2164.2 IMP
   000071         007500 01  TEST-CORRECT.                                                IC2164.2
   000072         007600     02 FILLER PIC X(30) VALUE SPACE.                             IC2164.2 IMP
   000073         007700     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2164.2
   000074         007800     02 CORRECT-X.                                                IC2164.2
   000075         007900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2164.2 IMP
   000076         008000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2164.2 75
   000077         008100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2164.2 75
   000078         008200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2164.2 75
   000079         008300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2164.2 75
   000080         008400     03      CR-18V0 REDEFINES CORRECT-A.                         IC2164.2 75
   000081         008500         04 CORRECT-18V0                     PIC -9(18).          IC2164.2
   000082         008600         04 FILLER                           PIC X.               IC2164.2
   000083         008700     03 FILLER PIC X(2) VALUE SPACE.                              IC2164.2 IMP
   000084         008800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2164.2 IMP
   000085         008900 01  CCVS-C-1.                                                    IC2164.2
   000086         009000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2164.2
   000087         009100-    "SS  PARAGRAPH-NAME                                          IC2164.2
   000088         009200-    "       REMARKS".                                            IC2164.2
   000089         009300     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2164.2 IMP
   000090         009400 01  CCVS-C-2.                                                    IC2164.2
   000091         009500     02 FILLER                     PIC X        VALUE SPACE.      IC2164.2 IMP
   000092         009600     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2164.2
   000093         009700     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2164.2 IMP
   000094         009800     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2164.2
   000095         009900     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2164.2 IMP
   000096         010000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2164.2 IMP
   000097         010100 01  REC-CT                        PIC 99       VALUE ZERO.       IC2164.2 IMP
   000098         010200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2164.2 IMP
   000099         010300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2164.2 IMP
   000100         010400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2164.2 IMP
   000101         010500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2164.2 IMP
   000102         010600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2164.2 IMP
   000103         010700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2164.2 IMP
   000104         010800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2164.2 IMP
   000105         010900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2164.2 IMP
   000106         011000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2164.2 IMP
   000107         011100 01  CCVS-H-1.                                                    IC2164.2
   000108         011200     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2164.2 IMP
   000109         011300     02  FILLER                    PIC X(42)    VALUE             IC2164.2
   000110         011400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2164.2
   000111         011500     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2164.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  CCVS-H-2A.                                                   IC2164.2
   000113         011700   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2164.2 IMP
   000114         011800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2164.2
   000115         011900   02  FILLER                        PIC XXXX   VALUE             IC2164.2
   000116         012000     "4.2 ".                                                      IC2164.2
   000117         012100   02  FILLER                        PIC X(28)  VALUE             IC2164.2
   000118         012200            " COPY - NOT FOR DISTRIBUTION".                       IC2164.2
   000119         012300   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2164.2 IMP
   000120         012400                                                                  IC2164.2
   000121         012500 01  CCVS-H-2B.                                                   IC2164.2
   000122         012600   02  FILLER                        PIC X(15)  VALUE             IC2164.2
   000123         012700            "TEST RESULT OF ".                                    IC2164.2
   000124         012800   02  TEST-ID                       PIC X(9).                    IC2164.2
   000125         012900   02  FILLER                        PIC X(4)   VALUE             IC2164.2
   000126         013000            " IN ".                                               IC2164.2
   000127         013100   02  FILLER                        PIC X(12)  VALUE             IC2164.2
   000128         013200     " HIGH       ".                                              IC2164.2
   000129         013300   02  FILLER                        PIC X(22)  VALUE             IC2164.2
   000130         013400            " LEVEL VALIDATION FOR ".                             IC2164.2
   000131         013500   02  FILLER                        PIC X(58)  VALUE             IC2164.2
   000132         013600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2164.2
   000133         013700 01  CCVS-H-3.                                                    IC2164.2
   000134         013800     02  FILLER                      PIC X(34)  VALUE             IC2164.2
   000135         013900            " FOR OFFICIAL USE ONLY    ".                         IC2164.2
   000136         014000     02  FILLER                      PIC X(58)  VALUE             IC2164.2
   000137         014100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2164.2
   000138         014200     02  FILLER                      PIC X(28)  VALUE             IC2164.2
   000139         014300            "  COPYRIGHT   1985 ".                                IC2164.2
   000140         014400 01  CCVS-E-1.                                                    IC2164.2
   000141         014500     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2164.2 IMP
   000142         014600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2164.2
   000143         014700     02 ID-AGAIN                     PIC X(9).                    IC2164.2
   000144         014800     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2164.2 IMP
   000145         014900 01  CCVS-E-2.                                                    IC2164.2
   000146         015000     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2164.2 IMP
   000147         015100     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2164.2 IMP
   000148         015200     02 CCVS-E-2-2.                                               IC2164.2
   000149         015300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2164.2 IMP
   000150         015400         03 FILLER                   PIC X      VALUE SPACE.      IC2164.2 IMP
   000151         015500         03 ENDER-DESC               PIC X(44)  VALUE             IC2164.2
   000152         015600            "ERRORS ENCOUNTERED".                                 IC2164.2
   000153         015700 01  CCVS-E-3.                                                    IC2164.2
   000154         015800     02  FILLER                      PIC X(22)  VALUE             IC2164.2
   000155         015900            " FOR OFFICIAL USE ONLY".                             IC2164.2
   000156         016000     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2164.2 IMP
   000157         016100     02  FILLER                      PIC X(58)  VALUE             IC2164.2
   000158         016200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2164.2
   000159         016300     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2164.2 IMP
   000160         016400     02 FILLER                       PIC X(15)  VALUE             IC2164.2
   000161         016500             " COPYRIGHT 1985".                                   IC2164.2
   000162         016600 01  CCVS-E-4.                                                    IC2164.2
   000163         016700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2164.2 IMP
   000164         016800     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2164.2
   000165         016900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2164.2 IMP
   000166         017000     02 FILLER                       PIC X(40)  VALUE             IC2164.2
   000167         017100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2164.2
   000168         017200 01  XXINFO.                                                      IC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02 FILLER                       PIC X(19)  VALUE             IC2164.2
   000170         017400            "*** INFORMATION ***".                                IC2164.2
   000171         017500     02 INFO-TEXT.                                                IC2164.2
   000172         017600       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2164.2 IMP
   000173         017700       04 XXCOMPUTED                 PIC X(20).                   IC2164.2
   000174         017800       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2164.2 IMP
   000175         017900       04 XXCORRECT                  PIC X(20).                   IC2164.2
   000176         018000     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2164.2
   000177         018100 01  HYPHEN-LINE.                                                 IC2164.2
   000178         018200     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2164.2 IMP
   000179         018300     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2164.2
   000180         018400-    "*****************************************".                 IC2164.2
   000181         018500     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2164.2
   000182         018600-    "******************************".                            IC2164.2
   000183         018700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2164.2
   000184         018800     "IC216A".                                                    IC2164.2
   000185         018900 PROCEDURE DIVISION.                                              IC2164.2
   000186         019000 CCVS1 SECTION.                                                   IC2164.2
   000187         019100 OPEN-FILES.                                                      IC2164.2
   000188         019200     OPEN     OUTPUT PRINT-FILE.                                  IC2164.2 31
   000189         019300     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2164.2 183 124 183 143
   000190         019400     MOVE    SPACE TO TEST-RESULTS.                               IC2164.2 IMP 44
   000191         019500     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2164.2 216 221
   000192         019600     GO TO CCVS1-EXIT.                                            IC2164.2 298
   000193         019700 CLOSE-FILES.                                                     IC2164.2
   000194         019800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2164.2 225 246 31
   000195         019900 TERMINATE-CCVS.                                                  IC2164.2
   000196         020000     EXIT PROGRAM.                                                IC2164.2
   000197         020100 TERMINATE-CALL.                                                  IC2164.2
   000198         020200     STOP     RUN.                                                IC2164.2
   000199         020300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2164.2 48 100
   000200         020400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2164.2 48 101
   000201         020500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2164.2 48 99
   000202         020600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2164.2 48 98
   000203         020700     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2164.2 55
   000204         020800 PRINT-DETAIL.                                                    IC2164.2
   000205         020900     IF REC-CT NOT EQUAL TO ZERO                                  IC2164.2 97 IMP
   000206      1  021000             MOVE "." TO PARDOT-X                                 IC2164.2 52
   000207      1  021100             MOVE REC-CT TO DOTVALUE.                             IC2164.2 97 53
   000208         021200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2164.2 44 32 258
   000209         021300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2164.2 48 258
   000210      1  021400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2164.2 275 288
   000211      1  021500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2164.2 289 297
   000212         021600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2164.2 IMP 48 IMP 60
   000213         021700     MOVE SPACE TO CORRECT-X.                                     IC2164.2 IMP 74
   000214         021800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2164.2 97 IMP IMP 50
   000215         021900     MOVE     SPACE TO RE-MARK.                                   IC2164.2 IMP 55
   000216         022000 HEAD-ROUTINE.                                                    IC2164.2
   000217         022100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2164.2 107 33 258
   000218         022200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2164.2 112 33 258
   000219         022300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2164.2 121 33 258
   000220         022400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2164.2 133 33 258
   000221         022500 COLUMN-NAMES-ROUTINE.                                            IC2164.2
   000222         022600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2164.2 85 33 258
   000223         022700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2164.2 90 33 258
   000224         022800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2164.2 177 33 258
   000225         022900 END-ROUTINE.                                                     IC2164.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2164.2 177 33 258
   000227         023100 END-RTN-EXIT.                                                    IC2164.2
   000228         023200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2164.2 140 33 258
   000229         023300 END-ROUTINE-1.                                                   IC2164.2
   000230         023400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2164.2 99 103 100
   000231         023500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2164.2 103 98 103
   000232         023600      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2164.2 101 103
   000233         023700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2164.2
   000234         023800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2164.2 101 163
   000235         023900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2164.2 103 165
   000236         024000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2164.2 162 148
   000237         024100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2164.2 145 33 258
   000238         024200  END-ROUTINE-12.                                                 IC2164.2
   000239         024300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2164.2 151
   000240         024400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2164.2 99 IMP
   000241      1  024500         MOVE "NO " TO ERROR-TOTAL                                IC2164.2 149
   000242         024600         ELSE                                                     IC2164.2
   000243      1  024700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2164.2 99 149
   000244         024800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2164.2 145 33
   000245         024900     PERFORM WRITE-LINE.                                          IC2164.2 258
   000246         025000 END-ROUTINE-13.                                                  IC2164.2
   000247         025100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2164.2 98 IMP
   000248      1  025200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2164.2 149
   000249      1  025300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2164.2 98 149
   000250         025400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2164.2 151
   000251         025500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2164.2 145 33 258
   000252         025600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2164.2 100 IMP
   000253      1  025700          MOVE "NO " TO ERROR-TOTAL                               IC2164.2 149
   000254      1  025800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2164.2 100 149
   000255         025900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2164.2 151
   000256         026000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2164.2 145 33 258
   000257         026100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2164.2 153 33 258
   000258         026200 WRITE-LINE.                                                      IC2164.2
   000259         026300     ADD 1 TO RECORD-COUNT.                                       IC2164.2 105
   000260         026400     IF RECORD-COUNT GREATER 50                                   IC2164.2 105
   000261      1  026500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2164.2 33 104
   000262      1  026600         MOVE SPACE TO DUMMY-RECORD                               IC2164.2 IMP 33
   000263      1  026700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2164.2 33
   000264      1  026800         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2164.2 85 33 270
   000265      1  026900         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2164.2 90 33 270
   000266      1  027000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2164.2 177 33 270
   000267      1  027100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2164.2 104 33
   000268      1  027200         MOVE ZERO TO RECORD-COUNT.                               IC2164.2 IMP 105
   000269         027300     PERFORM WRT-LN.                                              IC2164.2 270
   000270         027400 WRT-LN.                                                          IC2164.2
   000271         027500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2164.2 33
   000272         027600     MOVE SPACE TO DUMMY-RECORD.                                  IC2164.2 IMP 33
   000273         027700 BLANK-LINE-PRINT.                                                IC2164.2
   000274         027800     PERFORM WRT-LN.                                              IC2164.2 270
   000275         027900 FAIL-ROUTINE.                                                    IC2164.2
   000276         028000     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2164.2 60 IMP 283
   000277         028100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2164.2 74 IMP 283
   000278         028200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2164.2 106 176
   000279         028300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2164.2 171
   000280         028400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2164.2 168 33 258
   000281         028500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2164.2 IMP 176
   000282         028600     GO TO  FAIL-ROUTINE-EX.                                      IC2164.2 288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700 FAIL-ROUTINE-WRITE.                                              IC2164.2
   000284         028800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2164.2 56 32 258
   000285         028900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2164.2 106 84
   000286         029000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2164.2 71 32 258
   000287         029100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2164.2 IMP 84
   000288         029200 FAIL-ROUTINE-EX. EXIT.                                           IC2164.2
   000289         029300 BAIL-OUT.                                                        IC2164.2
   000290         029400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2164.2 61 IMP 292
   000291         029500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2164.2 75 IMP 297
   000292         029600 BAIL-OUT-WRITE.                                                  IC2164.2
   000293         029700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2164.2 75 175 61 173
   000294         029800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2164.2 106 176
   000295         029900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2164.2 168 33 258
   000296         030000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2164.2 IMP 176
   000297         030100 BAIL-OUT-EX. EXIT.                                               IC2164.2
   000298         030200 CCVS1-EXIT.                                                      IC2164.2
   000299         030300     EXIT.                                                        IC2164.2
   000300         030400 CALL-TEST-1.                                                     IC2164.2
   000301         030500     MOVE "CALL...USING DATA-NM" TO FEATURE.                      IC2164.2 46
   000302         030600     MOVE "CALL-TEST-1" TO PAR-NAME.                              IC2164.2 50
   000303         030700     MOVE "REFERENCING REDEFINED DATA-NAMES" TO RE-MARK.          IC2164.2 55
   000304         030800     CALL "IC217A" USING DN1, DN4.                                IC2164.2 EXT 35 38
   000305         030900     IF DN1 = 12345                                               IC2164.2 35
   000306      1  031000        PERFORM PASS                                              IC2164.2 200
   000307      1  031100        GO TO CALL-WRITE-1.                                       IC2164.2 312
   000308         031200 CALL-FAIL-1.                                                     IC2164.2
   000309         031300     MOVE DN1 TO COMPUTED-A.                                      IC2164.2 35 61
   000310         031400     MOVE 12345 TO CORRECT-A.                                     IC2164.2 75
   000311         031500     PERFORM FAIL.                                                IC2164.2 201
   000312         031600 CALL-WRITE-1.                                                    IC2164.2
   000313         031700     PERFORM PRINT-DETAIL.                                        IC2164.2 204
   000314         031800 CALL-TEST-2.                                                     IC2164.2
   000315         031900     MOVE "CALL...USING DATA-NM" TO FEATURE.                      IC2164.2 46
   000316         032000     MOVE "CALL-TEST-2" TO PAR-NAME.                              IC2164.2 50
   000317         032100     MOVE "REFERENCING REDEFINED DATA-NAMES" TO RE-MARK.          IC2164.2 55
   000318         032200     IF DN4 = "YES987NO"                                          IC2164.2 38
   000319      1  032300        PERFORM PASS                                              IC2164.2 200
   000320      1  032400        GO TO CALL-WRITE-2.                                       IC2164.2 325
   000321         032500 CALL-FAIL-2.                                                     IC2164.2
   000322         032600     MOVE DN4 TO COMPUTED-A.                                      IC2164.2 38 61
   000323         032700     MOVE "YES987NO" TO CORRECT-A.                                IC2164.2 75
   000324         032800     PERFORM FAIL.                                                IC2164.2 201
   000325         032900 CALL-WRITE-2.                                                    IC2164.2
   000326         033000     PERFORM PRINT-DETAIL.                                        IC2164.2 204
   000327         033100 CCVS-EXIT SECTION.                                               IC2164.2
   000328         033200 CCVS-999999.                                                     IC2164.2
   000329         033300     GO TO CLOSE-FILES.                                           IC2164.2 193
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page     9
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      106   ANSI-REFERENCE . . . . . . . .  278 285 294
       85   CCVS-C-1 . . . . . . . . . . .  222 264
       90   CCVS-C-2 . . . . . . . . . . .  223 265
      140   CCVS-E-1 . . . . . . . . . . .  228
      145   CCVS-E-2 . . . . . . . . . . .  237 244 251 256
      148   CCVS-E-2-2 . . . . . . . . . .  M236
      153   CCVS-E-3 . . . . . . . . . . .  257
      162   CCVS-E-4 . . . . . . . . . . .  236
      163   CCVS-E-4-1 . . . . . . . . . .  M234
      165   CCVS-E-4-2 . . . . . . . . . .  M235
      107   CCVS-H-1 . . . . . . . . . . .  217
      112   CCVS-H-2A. . . . . . . . . . .  218
      121   CCVS-H-2B. . . . . . . . . . .  219
      133   CCVS-H-3 . . . . . . . . . . .  220
      183   CCVS-PGM-ID. . . . . . . . . .  189 189
       67   CM-18V0
       61   COMPUTED-A . . . . . . . . . .  62 64 65 66 67 290 293 M309 M322
       62   COMPUTED-N
       60   COMPUTED-X . . . . . . . . . .  M212 276
       64   COMPUTED-0V18
       66   COMPUTED-14V4
       68   COMPUTED-18V0
       65   COMPUTED-4V14
       84   COR-ANSI-REFERENCE . . . . . .  M285 M287
       75   CORRECT-A. . . . . . . . . . .  76 77 78 79 80 291 293 M310 M323
       76   CORRECT-N
       74   CORRECT-X. . . . . . . . . . .  M213 277
       77   CORRECT-0V18
       79   CORRECT-14V4
       81   CORRECT-18V0
       78   CORRECT-4V14
       80   CR-18V0
       98   DELETE-COUNTER . . . . . . . .  M202 231 247 249
       35   DN1. . . . . . . . . . . . . .  304 305 309
       36   DN2. . . . . . . . . . . . . .  37
       37   DN3
       38   DN4. . . . . . . . . . . . . .  304 318 322
       39   DN5
       40   DN6
       41   DN7. . . . . . . . . . . . . .  42
       42   DN8
       43   DN9
       53   DOTVALUE . . . . . . . . . . .  M207
      104   DUMMY-HOLD . . . . . . . . . .  M261 267
       33   DUMMY-RECORD . . . . . . . . .  M217 M218 M219 M220 M222 M223 M224 M226 M228 M237 M244 M251 M256 M257 261 M262
                                            263 M264 M265 M266 M267 271 M272 M280 M295
      151   ENDER-DESC . . . . . . . . . .  M239 M250 M255
       99   ERROR-COUNTER. . . . . . . . .  M201 230 240 243
      103   ERROR-HOLD . . . . . . . . . .  M230 M231 M231 M232 235
      149   ERROR-TOTAL. . . . . . . . . .  M241 M243 M248 M249 M253 M254
       46   FEATURE. . . . . . . . . . . .  M301 M315
      177   HYPHEN-LINE. . . . . . . . . .  224 226 266
      143   ID-AGAIN . . . . . . . . . . .  M189
      176   INF-ANSI-REFERENCE . . . . . .  M278 M281 M294 M296
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page    10
0 Defined   Cross-reference of data names   References

0     171   INFO-TEXT. . . . . . . . . . .  M279
      100   INSPECT-COUNTER. . . . . . . .  M199 230 252 254
       48   P-OR-F . . . . . . . . . . . .  M199 M200 M201 M202 209 M212
       50   PAR-NAME . . . . . . . . . . .  M214 M302 M316
       52   PARDOT-X . . . . . . . . . . .  M206
      101   PASS-COUNTER . . . . . . . . .  M200 232 234
       31   PRINT-FILE . . . . . . . . . .  27 188 194
       32   PRINT-REC. . . . . . . . . . .  M208 M284 M286
       55   RE-MARK. . . . . . . . . . . .  M203 M215 M303 M317
       97   REC-CT . . . . . . . . . . . .  205 207 214
       96   REC-SKL-SUB
      105   RECORD-COUNT . . . . . . . . .  M259 260 M268
       56   TEST-COMPUTED. . . . . . . . .  284
       71   TEST-CORRECT . . . . . . . . .  286
      124   TEST-ID. . . . . . . . . . . .  M189
       44   TEST-RESULTS . . . . . . . . .  M190 208
      102   TOTAL-ERROR
      173   XXCOMPUTED . . . . . . . . . .  M293
      175   XXCORRECT. . . . . . . . . . .  M293
      168   XXINFO . . . . . . . . . . . .  280 295
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page    11
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

      289   BAIL-OUT . . . . . . . . . . .  P211
      297   BAIL-OUT-EX. . . . . . . . . .  E211 G291
      292   BAIL-OUT-WRITE . . . . . . . .  G290
      273   BLANK-LINE-PRINT
      308   CALL-FAIL-1
      321   CALL-FAIL-2
      300   CALL-TEST-1
      314   CALL-TEST-2
      312   CALL-WRITE-1 . . . . . . . . .  G307
      325   CALL-WRITE-2 . . . . . . . . .  G320
      327   CCVS-EXIT
      328   CCVS-999999
      186   CCVS1
      298   CCVS1-EXIT . . . . . . . . . .  G192
      193   CLOSE-FILES. . . . . . . . . .  G329
      221   COLUMN-NAMES-ROUTINE . . . . .  E191
      202   DE-LETE
      225   END-ROUTINE. . . . . . . . . .  P194
      229   END-ROUTINE-1
      238   END-ROUTINE-12
      246   END-ROUTINE-13 . . . . . . . .  E194
      227   END-RTN-EXIT
      201   FAIL . . . . . . . . . . . . .  P311 P324
      275   FAIL-ROUTINE . . . . . . . . .  P210
      288   FAIL-ROUTINE-EX. . . . . . . .  E210 G282
      283   FAIL-ROUTINE-WRITE . . . . . .  G276 G277
      216   HEAD-ROUTINE . . . . . . . . .  P191
      199   INSPT
      187   OPEN-FILES
      200   PASS . . . . . . . . . . . . .  P306 P319
      204   PRINT-DETAIL . . . . . . . . .  P313 P326
      197   TERMINATE-CALL
      195   TERMINATE-CCVS
      258   WRITE-LINE . . . . . . . . . .  P208 P209 P217 P218 P219 P220 P222 P223 P224 P226 P228 P237 P245 P251 P256 P257
                                            P280 P284 P286 P295
      270   WRT-LN . . . . . . . . . . . .  P264 P265 P266 P269 P274
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page    12
0 Defined   Cross-reference of programs     References

        3   IC216A
 EXTERNAL   IC217A . . . . . . . . . . . .  304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC216A    Date 06/04/2022  Time 11:57:47   Page    13
0LineID  Message code  Message text

     31  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC216A:
 *    Source records = 329
 *    Data Division statements = 72
 *    Procedure Division statements = 149
 *    Generated COBOL statements = 0
 *    Program complexity factor = 156
0End of compilation 1,  program IC216A,  highest severity 0.
0Return code 0
