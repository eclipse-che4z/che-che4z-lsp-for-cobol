1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:19   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:19   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1064.2
   000002         000200 PROGRAM-ID.                                                      IC1064.2
   000003         000300     IC106A.                                                      IC1064.2
   000004         000500*                                                              *  IC1064.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1064.2
   000006         000700*                                                              *  IC1064.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1064.2
   000008         000900*                                                              *  IC1064.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1064.2
   000010         001100*                                                              *  IC1064.2
   000011         001300*                                                              *  IC1064.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1064.2
   000013         001500*                                                              *  IC1064.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1064.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1064.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1064.2
   000017         001900*                                                              *  IC1064.2
   000018         002100*        THIS PROGRAM CALLS A SUBPROGRAM WITH TWO TABLES          IC1064.2
   000019         002200*    AND AN INDEX DATA ITEM REFERENCED IN THE USING PHRASE        IC1064.2
   000020         002300*    OF THE CALL STATEMENT.  BOTH OF THE TABLES CONTAIN AN        IC1064.2
   000021         002400*    INDEXED BY CLAUSE.                                           IC1064.2
   000022         002500*        THE TESTS IN THIS PROGRAM VERIFY THAT                    IC1064.2
   000023         002600*           (1)  THE INDICES IN THE MAIN PROGRAM AND THE          IC1064.2
   000024         002700*                SUBPROGRAM ARE SEPARATE,                         IC1064.2
   000025         002800*           (2)  AN INDEX DATA ITEM SET IN A MAIN PROGRAM         IC1064.2
   000026         002900*                CAN BE USED TO SET AN INDEX IN A SUBPROGRAM,     IC1064.2
   000027         003000*           (3)  TABLES CAN BE SHARED BETWEEN A MAIN PROGRAM      IC1064.2
   000028         003100*                AND A SUBPROGRAM.                                IC1064.2
   000029         003200*        THE SUBPROGRAM IC107 IS CALLED BY THIS PROGRAM.          IC1064.2
   000030         003300 ENVIRONMENT DIVISION.                                            IC1064.2
   000031         003400 CONFIGURATION SECTION.                                           IC1064.2
   000032         003500 SOURCE-COMPUTER.                                                 IC1064.2
   000033         003600     XXXXX082.                                                    IC1064.2
   000034         003700 OBJECT-COMPUTER.                                                 IC1064.2
   000035         003800     XXXXX083.                                                    IC1064.2
   000036         003900 INPUT-OUTPUT SECTION.                                            IC1064.2
   000037         004000 FILE-CONTROL.                                                    IC1064.2
   000038         004100     SELECT PRINT-FILE ASSIGN TO                                  IC1064.2 42
   000039         004200     XXXXX055.                                                    IC1064.2
   000040         004300 DATA DIVISION.                                                   IC1064.2
   000041         004400 FILE SECTION.                                                    IC1064.2
   000042         004500 FD  PRINT-FILE.                                                  IC1064.2

 ==000042==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000043         004600 01  PRINT-REC PICTURE X(120).                                    IC1064.2
   000044         004700 01  DUMMY-RECORD PICTURE X(120).                                 IC1064.2
   000045         004800 WORKING-STORAGE SECTION.                                         IC1064.2
   000046         004900 77  IDN1  USAGE IS INDEX.                                        IC1064.2
   000047         005000 77  INDEX-VALUE PIC 999.                                         IC1064.2
   000048         005100 01  TABLE-1.                                                     IC1064.2
   000049         005200     02  DN1 PICTURE X                                            IC1064.2
   000050         005300             OCCURS 10 TIMES                                      IC1064.2
   000051         005400             INDEXED BY IN1.                                      IC1064.2
   000052         005500 01  TABLE-2.                                                     IC1064.2
   000053         005600     02  DN2 PICTURE X                                            IC1064.2
   000054         005700             OCCURS 10 TIMES                                      IC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800             INDEXED BY IN2.                                      IC1064.2
   000056         005900 01  TEST-RESULTS.                                                IC1064.2
   000057         006000     02 FILLER                   PIC X      VALUE SPACE.          IC1064.2 IMP
   000058         006100     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC1064.2 IMP
   000059         006200     02 FILLER                   PIC X      VALUE SPACE.          IC1064.2 IMP
   000060         006300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC1064.2 IMP
   000061         006400     02 FILLER                   PIC X      VALUE SPACE.          IC1064.2 IMP
   000062         006500     02  PAR-NAME.                                                IC1064.2
   000063         006600       03 FILLER                 PIC X(19)  VALUE SPACE.          IC1064.2 IMP
   000064         006700       03  PARDOT-X              PIC X      VALUE SPACE.          IC1064.2 IMP
   000065         006800       03 DOTVALUE               PIC 99     VALUE ZERO.           IC1064.2 IMP
   000066         006900     02 FILLER                   PIC X(8)   VALUE SPACE.          IC1064.2 IMP
   000067         007000     02 RE-MARK                  PIC X(61).                       IC1064.2
   000068         007100 01  TEST-COMPUTED.                                               IC1064.2
   000069         007200     02 FILLER                   PIC X(30)  VALUE SPACE.          IC1064.2 IMP
   000070         007300     02 FILLER                   PIC X(17)  VALUE                 IC1064.2
   000071         007400            "       COMPUTED=".                                   IC1064.2
   000072         007500     02 COMPUTED-X.                                               IC1064.2
   000073         007600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC1064.2 IMP
   000074         007700     03 COMPUTED-N               REDEFINES COMPUTED-A             IC1064.2 73
   000075         007800                                 PIC -9(9).9(9).                  IC1064.2
   000076         007900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC1064.2 73
   000077         008000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC1064.2 73
   000078         008100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC1064.2 73
   000079         008200     03       CM-18V0 REDEFINES COMPUTED-A.                       IC1064.2 73
   000080         008300         04 COMPUTED-18V0                    PIC -9(18).          IC1064.2
   000081         008400         04 FILLER                           PIC X.               IC1064.2
   000082         008500     03 FILLER PIC X(50) VALUE SPACE.                             IC1064.2 IMP
   000083         008600 01  TEST-CORRECT.                                                IC1064.2
   000084         008700     02 FILLER PIC X(30) VALUE SPACE.                             IC1064.2 IMP
   000085         008800     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC1064.2
   000086         008900     02 CORRECT-X.                                                IC1064.2
   000087         009000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC1064.2 IMP
   000088         009100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC1064.2 87
   000089         009200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC1064.2 87
   000090         009300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC1064.2 87
   000091         009400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC1064.2 87
   000092         009500     03      CR-18V0 REDEFINES CORRECT-A.                         IC1064.2 87
   000093         009600         04 CORRECT-18V0                     PIC -9(18).          IC1064.2
   000094         009700         04 FILLER                           PIC X.               IC1064.2
   000095         009800     03 FILLER PIC X(2) VALUE SPACE.                              IC1064.2 IMP
   000096         009900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC1064.2 IMP
   000097         010000 01  CCVS-C-1.                                                    IC1064.2
   000098         010100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC1064.2
   000099         010200-    "SS  PARAGRAPH-NAME                                          IC1064.2
   000100         010300-    "       REMARKS".                                            IC1064.2
   000101         010400     02 FILLER                     PIC X(20)    VALUE SPACE.      IC1064.2 IMP
   000102         010500 01  CCVS-C-2.                                                    IC1064.2
   000103         010600     02 FILLER                     PIC X        VALUE SPACE.      IC1064.2 IMP
   000104         010700     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC1064.2
   000105         010800     02 FILLER                     PIC X(15)    VALUE SPACE.      IC1064.2 IMP
   000106         010900     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC1064.2
   000107         011000     02 FILLER                     PIC X(94)    VALUE SPACE.      IC1064.2 IMP
   000108         011100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC1064.2 IMP
   000109         011200 01  REC-CT                        PIC 99       VALUE ZERO.       IC1064.2 IMP
   000110         011300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC1064.2 IMP
   000111         011400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC1064.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC1064.2 IMP
   000113         011600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC1064.2 IMP
   000114         011700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC1064.2 IMP
   000115         011800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC1064.2 IMP
   000116         011900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC1064.2 IMP
   000117         012000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC1064.2 IMP
   000118         012100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC1064.2 IMP
   000119         012200 01  CCVS-H-1.                                                    IC1064.2
   000120         012300     02  FILLER                    PIC X(39)    VALUE SPACES.     IC1064.2 IMP
   000121         012400     02  FILLER                    PIC X(42)    VALUE             IC1064.2
   000122         012500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC1064.2
   000123         012600     02  FILLER                    PIC X(39)    VALUE SPACES.     IC1064.2 IMP
   000124         012700 01  CCVS-H-2A.                                                   IC1064.2
   000125         012800   02  FILLER                        PIC X(40)  VALUE SPACE.      IC1064.2 IMP
   000126         012900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC1064.2
   000127         013000   02  FILLER                        PIC XXXX   VALUE             IC1064.2
   000128         013100     "4.2 ".                                                      IC1064.2
   000129         013200   02  FILLER                        PIC X(28)  VALUE             IC1064.2
   000130         013300            " COPY - NOT FOR DISTRIBUTION".                       IC1064.2
   000131         013400   02  FILLER                        PIC X(41)  VALUE SPACE.      IC1064.2 IMP
   000132         013500                                                                  IC1064.2
   000133         013600 01  CCVS-H-2B.                                                   IC1064.2
   000134         013700   02  FILLER                        PIC X(15)  VALUE             IC1064.2
   000135         013800            "TEST RESULT OF ".                                    IC1064.2
   000136         013900   02  TEST-ID                       PIC X(9).                    IC1064.2
   000137         014000   02  FILLER                        PIC X(4)   VALUE             IC1064.2
   000138         014100            " IN ".                                               IC1064.2
   000139         014200   02  FILLER                        PIC X(12)  VALUE             IC1064.2
   000140         014300     " HIGH       ".                                              IC1064.2
   000141         014400   02  FILLER                        PIC X(22)  VALUE             IC1064.2
   000142         014500            " LEVEL VALIDATION FOR ".                             IC1064.2
   000143         014600   02  FILLER                        PIC X(58)  VALUE             IC1064.2
   000144         014700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1064.2
   000145         014800 01  CCVS-H-3.                                                    IC1064.2
   000146         014900     02  FILLER                      PIC X(34)  VALUE             IC1064.2
   000147         015000            " FOR OFFICIAL USE ONLY    ".                         IC1064.2
   000148         015100     02  FILLER                      PIC X(58)  VALUE             IC1064.2
   000149         015200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1064.2
   000150         015300     02  FILLER                      PIC X(28)  VALUE             IC1064.2
   000151         015400            "  COPYRIGHT   1985 ".                                IC1064.2
   000152         015500 01  CCVS-E-1.                                                    IC1064.2
   000153         015600     02 FILLER                       PIC X(52)  VALUE SPACE.      IC1064.2 IMP
   000154         015700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC1064.2
   000155         015800     02 ID-AGAIN                     PIC X(9).                    IC1064.2
   000156         015900     02 FILLER                       PIC X(45)  VALUE SPACES.     IC1064.2 IMP
   000157         016000 01  CCVS-E-2.                                                    IC1064.2
   000158         016100     02  FILLER                      PIC X(31)  VALUE SPACE.      IC1064.2 IMP
   000159         016200     02  FILLER                      PIC X(21)  VALUE SPACE.      IC1064.2 IMP
   000160         016300     02 CCVS-E-2-2.                                               IC1064.2
   000161         016400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC1064.2 IMP
   000162         016500         03 FILLER                   PIC X      VALUE SPACE.      IC1064.2 IMP
   000163         016600         03 ENDER-DESC               PIC X(44)  VALUE             IC1064.2
   000164         016700            "ERRORS ENCOUNTERED".                                 IC1064.2
   000165         016800 01  CCVS-E-3.                                                    IC1064.2
   000166         016900     02  FILLER                      PIC X(22)  VALUE             IC1064.2
   000167         017000            " FOR OFFICIAL USE ONLY".                             IC1064.2
   000168         017100     02  FILLER                      PIC X(12)  VALUE SPACE.      IC1064.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02  FILLER                      PIC X(58)  VALUE             IC1064.2
   000170         017300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1064.2
   000171         017400     02  FILLER                      PIC X(13)  VALUE SPACE.      IC1064.2 IMP
   000172         017500     02 FILLER                       PIC X(15)  VALUE             IC1064.2
   000173         017600             " COPYRIGHT 1985".                                   IC1064.2
   000174         017700 01  CCVS-E-4.                                                    IC1064.2
   000175         017800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC1064.2 IMP
   000176         017900     02 FILLER                       PIC X(4)   VALUE " OF ".     IC1064.2
   000177         018000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC1064.2 IMP
   000178         018100     02 FILLER                       PIC X(40)  VALUE             IC1064.2
   000179         018200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC1064.2
   000180         018300 01  XXINFO.                                                      IC1064.2
   000181         018400     02 FILLER                       PIC X(19)  VALUE             IC1064.2
   000182         018500            "*** INFORMATION ***".                                IC1064.2
   000183         018600     02 INFO-TEXT.                                                IC1064.2
   000184         018700       04 FILLER                     PIC X(8)   VALUE SPACE.      IC1064.2 IMP
   000185         018800       04 XXCOMPUTED                 PIC X(20).                   IC1064.2
   000186         018900       04 FILLER                     PIC X(5)   VALUE SPACE.      IC1064.2 IMP
   000187         019000       04 XXCORRECT                  PIC X(20).                   IC1064.2
   000188         019100     02 INF-ANSI-REFERENCE           PIC X(48).                   IC1064.2
   000189         019200 01  HYPHEN-LINE.                                                 IC1064.2
   000190         019300     02 FILLER  PIC IS X VALUE IS SPACE.                          IC1064.2 IMP
   000191         019400     02 FILLER  PIC IS X(65)    VALUE IS "************************IC1064.2
   000192         019500-    "*****************************************".                 IC1064.2
   000193         019600     02 FILLER  PIC IS X(54)    VALUE IS "************************IC1064.2
   000194         019700-    "******************************".                            IC1064.2
   000195         019800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC1064.2
   000196         019900     "IC106A".                                                    IC1064.2
   000197         020000 PROCEDURE DIVISION.                                              IC1064.2
   000198         020100 CCVS1 SECTION.                                                   IC1064.2
   000199         020200 OPEN-FILES.                                                      IC1064.2
   000200         020300     OPEN     OUTPUT PRINT-FILE.                                  IC1064.2 42
   000201         020400     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC1064.2 195 136 195 155
   000202         020500     MOVE    SPACE TO TEST-RESULTS.                               IC1064.2 IMP 56
   000203         020600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC1064.2 228 233
   000204         020700     GO TO CCVS1-EXIT.                                            IC1064.2 310
   000205         020800 CLOSE-FILES.                                                     IC1064.2
   000206         020900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC1064.2 237 258 42
   000207         021000 TERMINATE-CCVS.                                                  IC1064.2
   000208         021100     EXIT PROGRAM.                                                IC1064.2
   000209         021200 TERMINATE-CALL.                                                  IC1064.2
   000210         021300     STOP     RUN.                                                IC1064.2
   000211         021400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC1064.2 60 112
   000212         021500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC1064.2 60 113
   000213         021600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC1064.2 60 111
   000214         021700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC1064.2 60 110
   000215         021800     MOVE "****TEST DELETED****" TO RE-MARK.                      IC1064.2 67
   000216         021900 PRINT-DETAIL.                                                    IC1064.2
   000217         022000     IF REC-CT NOT EQUAL TO ZERO                                  IC1064.2 109 IMP
   000218      1  022100             MOVE "." TO PARDOT-X                                 IC1064.2 64
   000219      1  022200             MOVE REC-CT TO DOTVALUE.                             IC1064.2 109 65
   000220         022300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC1064.2 56 43 270
   000221         022400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC1064.2 60 270
   000222      1  022500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC1064.2 287 300
   000223      1  022600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC1064.2 301 309
   000224         022700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC1064.2 IMP 60 IMP 72
   000225         022800     MOVE SPACE TO CORRECT-X.                                     IC1064.2 IMP 86
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC1064.2 109 IMP IMP 62
   000227         023000     MOVE     SPACE TO RE-MARK.                                   IC1064.2 IMP 67
   000228         023100 HEAD-ROUTINE.                                                    IC1064.2
   000229         023200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC1064.2 119 44 270
   000230         023300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC1064.2 124 44 270
   000231         023400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC1064.2 133 44 270
   000232         023500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC1064.2 145 44 270
   000233         023600 COLUMN-NAMES-ROUTINE.                                            IC1064.2
   000234         023700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1064.2 97 44 270
   000235         023800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1064.2 102 44 270
   000236         023900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC1064.2 189 44 270
   000237         024000 END-ROUTINE.                                                     IC1064.2
   000238         024100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC1064.2 189 44 270
   000239         024200 END-RTN-EXIT.                                                    IC1064.2
   000240         024300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1064.2 152 44 270
   000241         024400 END-ROUTINE-1.                                                   IC1064.2
   000242         024500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC1064.2 111 115 112
   000243         024600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC1064.2 115 110 115
   000244         024700      ADD PASS-COUNTER TO ERROR-HOLD.                             IC1064.2 113 115
   000245         024800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC1064.2
   000246         024900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC1064.2 113 175
   000247         025000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC1064.2 115 177
   000248         025100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC1064.2 174 160
   000249         025200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC1064.2 157 44 270
   000250         025300  END-ROUTINE-12.                                                 IC1064.2
   000251         025400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC1064.2 163
   000252         025500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC1064.2 111 IMP
   000253      1  025600         MOVE "NO " TO ERROR-TOTAL                                IC1064.2 161
   000254         025700         ELSE                                                     IC1064.2
   000255      1  025800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC1064.2 111 161
   000256         025900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC1064.2 157 44
   000257         026000     PERFORM WRITE-LINE.                                          IC1064.2 270
   000258         026100 END-ROUTINE-13.                                                  IC1064.2
   000259         026200     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC1064.2 110 IMP
   000260      1  026300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC1064.2 161
   000261      1  026400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC1064.2 110 161
   000262         026500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC1064.2 163
   000263         026600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1064.2 157 44 270
   000264         026700      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC1064.2 112 IMP
   000265      1  026800          MOVE "NO " TO ERROR-TOTAL                               IC1064.2 161
   000266      1  026900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC1064.2 112 161
   000267         027000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC1064.2 163
   000268         027100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC1064.2 157 44 270
   000269         027200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC1064.2 165 44 270
   000270         027300 WRITE-LINE.                                                      IC1064.2
   000271         027400     ADD 1 TO RECORD-COUNT.                                       IC1064.2 117
   000272         027500     IF RECORD-COUNT GREATER 50                                   IC1064.2 117
   000273      1  027600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC1064.2 44 116
   000274      1  027700         MOVE SPACE TO DUMMY-RECORD                               IC1064.2 IMP 44
   000275      1  027800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC1064.2 44
   000276      1  027900         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC1064.2 97 44 282
   000277      1  028000         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC1064.2 102 44 282
   000278      1  028100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC1064.2 189 44 282
   000279      1  028200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC1064.2 116 44
   000280      1  028300         MOVE ZERO TO RECORD-COUNT.                               IC1064.2 IMP 117
   000281         028400     PERFORM WRT-LN.                                              IC1064.2 282
   000282         028500 WRT-LN.                                                          IC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC1064.2 44
   000284         028700     MOVE SPACE TO DUMMY-RECORD.                                  IC1064.2 IMP 44
   000285         028800 BLANK-LINE-PRINT.                                                IC1064.2
   000286         028900     PERFORM WRT-LN.                                              IC1064.2 282
   000287         029000 FAIL-ROUTINE.                                                    IC1064.2
   000288         029100     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC1064.2 72 IMP 295
   000289         029200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC1064.2 86 IMP 295
   000290         029300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC1064.2 118 188
   000291         029400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC1064.2 183
   000292         029500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1064.2 180 44 270
   000293         029600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC1064.2 IMP 188
   000294         029700     GO TO  FAIL-ROUTINE-EX.                                      IC1064.2 300
   000295         029800 FAIL-ROUTINE-WRITE.                                              IC1064.2
   000296         029900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC1064.2 68 43 270
   000297         030000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC1064.2 118 96
   000298         030100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC1064.2 83 43 270
   000299         030200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC1064.2 IMP 96
   000300         030300 FAIL-ROUTINE-EX. EXIT.                                           IC1064.2
   000301         030400 BAIL-OUT.                                                        IC1064.2
   000302         030500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC1064.2 73 IMP 304
   000303         030600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC1064.2 87 IMP 309
   000304         030700 BAIL-OUT-WRITE.                                                  IC1064.2
   000305         030800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC1064.2 87 187 73 185
   000306         030900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC1064.2 118 188
   000307         031000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC1064.2 180 44 270
   000308         031100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC1064.2 IMP 188
   000309         031200 BAIL-OUT-EX. EXIT.                                               IC1064.2
   000310         031300 CCVS1-EXIT.                                                      IC1064.2
   000311         031400     EXIT.                                                        IC1064.2
   000312         031500 SEC-IC106-0001 SECTION.                                          IC1064.2
   000313         031600 LINK-TEST-INITIALIZE.                                            IC1064.2
   000314         031700     MOVE "ABCDEFGHIJ" TO TABLE-1.                                IC1064.2 48
   000315         031800     MOVE SPACE TO TABLE-2.                                       IC1064.2 IMP 52
   000316         031900     SET IN1 TO 6.                                                IC1064.2 51
   000317         032000     SET IDN1 TO IN1.                                             IC1064.2 46 51
   000318         032100     CALL "IC107A" USING IDN1 TABLE-1 TABLE-2.                    IC1064.2 EXT 46 48 52
   000319         032200 LINK-TEST-01.                                                    IC1064.2
   000320         032300     MOVE "SEPARATE INDEXES" TO FEATURE.                          IC1064.2 58
   000321         032400     MOVE "LINK-TEST-01" TO PAR-NAME.                             IC1064.2 62
   000322         032500*        THIS TEST VERIFIES THAT IN1 HAS NOT BEEN AFFECTED        IC1064.2
   000323         032600*    BY THE USE OF AN INDEX FOR TABLE-1 IN THE SUBPROGRAM.        IC1064.2
   000324         032700 LINK-TEST-01-01.                                                 IC1064.2
   000325         032800     MOVE 1 TO REC-CT.                                            IC1064.2 109
   000326         032900     IF DN1 (IN1) EQUAL TO "F"                                    IC1064.2 49 51
   000327      1  033000         PERFORM PASS                                             IC1064.2 212
   000328      1  033100         GO TO LINK-WRITE-01-01.                                  IC1064.2 334
   000329         033200 LINK-FAIL-01-01.                                                 IC1064.2
   000330         033300     PERFORM FAIL.                                                IC1064.2 213
   000331         033400     MOVE DN1 (IN1) TO COMPUTED-A.                                IC1064.2 49 51 73
   000332         033500     MOVE "F" TO CORRECT-A.                                       IC1064.2 87
   000333         033600     MOVE "TABLE INDEX DESTROYED" TO RE-MARK.                     IC1064.2 67
   000334         033700 LINK-WRITE-01-01.                                                IC1064.2
   000335         033800     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000336         033900 LINK-TEST-01-02.                                                 IC1064.2
   000337         034000     ADD 1 TO REC-CT.                                             IC1064.2 109
   000338         034100     IF IN1 EQUAL TO 6                                            IC1064.2 51
   000339      1  034200         PERFORM PASS                                             IC1064.2 212
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340      1  034300         GO TO LINK-WRITE-01-02.                                  IC1064.2 347
   000341         034400 LINK-FAIL-01-02.                                                 IC1064.2
   000342         034500     PERFORM FAIL.                                                IC1064.2 213
   000343         034600     MOVE 6 TO CORRECT-18V0.                                      IC1064.2 93
   000344         034700     SET      INDEX-VALUE TO IN1.                                 IC1064.2 47 51
   000345         034800     MOVE     INDEX-VALUE TO COMPUTED-18V0.                       IC1064.2 47 80
   000346         034900     MOVE "TABLE INDEX DESTROYED" TO RE-MARK.                     IC1064.2 67
   000347         035000 LINK-WRITE-01-02.                                                IC1064.2
   000348         035100     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000349         035200 LINK-TEST-02.                                                    IC1064.2
   000350         035300     MOVE "INDEX DATA ITEM" TO FEATURE.                           IC1064.2 58
   000351         035400     MOVE "LINK-TEST-02" TO PAR-NAME.                             IC1064.2 62
   000352         035500*        THIS TEST VERIFIES THAT THE INDEX DATA ITEM WAS          IC1064.2
   000353         035600*    USED IN THE SUBPROGRAM TO SET AN INDEX AND AN INDEX          IC1064.2
   000354         035700*    DATA ITEM.                                                   IC1064.2
   000355         035800 LINK-TEST-02-01.                                                 IC1064.2
   000356         035900     MOVE 1 TO REC-CT.                                            IC1064.2 109
   000357         036000     IF DN2 (7) IS EQUAL TO "G"                                   IC1064.2 53
   000358      1  036100         PERFORM PASS                                             IC1064.2 212
   000359      1  036200         GO TO LINK-WRITE-02-01.                                  IC1064.2 365
   000360         036300 LINK-FAIL-02-01.                                                 IC1064.2
   000361         036400     PERFORM FAIL.                                                IC1064.2 213
   000362         036500     MOVE DN2 (7) TO COMPUTED-A.                                  IC1064.2 53 73
   000363         036600     MOVE "G" TO CORRECT-A.                                       IC1064.2 87
   000364         036700     MOVE "INDEX DATA ITEM IN LINKAGE SEC" TO RE-MARK.            IC1064.2 67
   000365         036800 LINK-WRITE-02-01.                                                IC1064.2
   000366         036900     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000367         037000 LINK-TEST-02-02.                                                 IC1064.2
   000368         037100     ADD 1 TO REC-CT.                                             IC1064.2 109
   000369         037200     IF DN2 (6) EQUAL TO "F"                                      IC1064.2 53
   000370      1  037300         PERFORM PASS                                             IC1064.2 212
   000371      1  037400         GO TO LINK-WRITE-02-02.                                  IC1064.2 377
   000372         037500 LINK-FAIL-02-02.                                                 IC1064.2
   000373         037600     PERFORM FAIL.                                                IC1064.2 213
   000374         037700     MOVE DN2 (6) TO COMPUTED-A.                                  IC1064.2 53 73
   000375         037800     MOVE "F" TO CORRECT-A.                                       IC1064.2 87
   000376         037900     MOVE "INDEX DATA ITEM IN LINKAGE SEC" TO RE-MARK.            IC1064.2 67
   000377         038000 LINK-WRITE-02-02.                                                IC1064.2
   000378         038100     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000379         038200 LINK-TEST-03.                                                    IC1064.2
   000380         038300     MOVE "SUBPROGRAM INDEX" TO FEATURE.                          IC1064.2 58
   000381         038400     MOVE "LINK-TEST-03" TO PAR-NAME.                             IC1064.2 62
   000382         038500*        THIS TEST  VERIFIES THAT A SUBPROGRAM INDEX FOR          IC1064.2
   000383         038600*    A TABLE DEFINED IN THE LINKAGE SECTION OF IC107 CAN BE       IC1064.2
   000384         038700*    USED TO REFERENCE THE TABLE.                                 IC1064.2
   000385         038800 LINK-TEST-03-01.                                                 IC1064.2
   000386         038900     MOVE 1 TO REC-CT.                                            IC1064.2 109
   000387         039000     IF DN2 (1) EQUAL TO "A"                                      IC1064.2 53
   000388      1  039100         PERFORM PASS                                             IC1064.2 212
   000389      1  039200         GO TO LINK-WRITE-03-01.                                  IC1064.2 395
   000390         039300 LINK-FAIL-03-01.                                                 IC1064.2
   000391         039400     PERFORM FAIL.                                                IC1064.2 213
   000392         039500     MOVE DN2 (1) TO COMPUTED-A.                                  IC1064.2 53 73
   000393         039600     MOVE "A" TO CORRECT-A.                                       IC1064.2 87
   000394         039700     MOVE "INDEX IN LINKAGE SECTION" TO RE-MARK.                  IC1064.2 67
   000395         039800 LINK-WRITE-03-01.                                                IC1064.2
   000396         039900     PERFORM PRINT-DETAIL.                                        IC1064.2 216
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 LINK-TEST-03-02.                                                 IC1064.2
   000398         040100     ADD 1 TO REC-CT.                                             IC1064.2 109
   000399         040200     IF DN2 (2) EQUAL TO "B"                                      IC1064.2 53
   000400      1  040300         PERFORM PASS                                             IC1064.2 212
   000401      1  040400         GO TO LINK-WRITE-03-02.                                  IC1064.2 407
   000402         040500 LINK-FAIL-03-02.                                                 IC1064.2
   000403         040600     PERFORM FAIL.                                                IC1064.2 213
   000404         040700     MOVE DN2 (2) TO COMPUTED-A.                                  IC1064.2 53 73
   000405         040800     MOVE "B" TO CORRECT-A.                                       IC1064.2 87
   000406         040900     MOVE "INDEX IN LINKAGE SECTION" TO RE-MARK.                  IC1064.2 67
   000407         041000 LINK-WRITE-03-02.                                                IC1064.2
   000408         041100     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000409         041200 LINK-TEST-04.                                                    IC1064.2
   000410         041300     MOVE "INDEX DATA ITEM" TO FEATURE.                           IC1064.2 58
   000411         041400     MOVE "LINK-TEST-04" TO PAR-NAME.                             IC1064.2 62
   000412         041500*        THIS TEST VERIFIES THAT AN INDEX DATA ITEM               IC1064.2
   000413         041600*    SET IN THE SUBPROGRAM CAN BE USED IN THE MAIN PROGRAM.       IC1064.2
   000414         041700 LINK-TEST-04-01.                                                 IC1064.2
   000415         041800     MOVE 1 TO REC-CT.                                            IC1064.2 109
   000416         041900     SET IN1 TO IDN1.                                             IC1064.2 51 46
   000417         042000     IF IN1 EQUAL TO 3                                            IC1064.2 51
   000418      1  042100         PERFORM PASS                                             IC1064.2 212
   000419      1  042200         GO TO LINK-WRITE-04-01.                                  IC1064.2 426
   000420         042300 LINK-FAIL-04-01.                                                 IC1064.2
   000421         042400     MOVE  3  TO CORRECT-18V0.                                    IC1064.2 93
   000422         042500     SET      INDEX-VALUE TO IN1.                                 IC1064.2 47 51
   000423         042600     MOVE     INDEX-VALUE TO COMPUTED-18V0.                       IC1064.2 47 80
   000424         042700     PERFORM FAIL.                                                IC1064.2 213
   000425         042800     MOVE "INDEX DATA ITEM SET IN SUBPROG" TO RE-MARK.            IC1064.2 67
   000426         042900 LINK-WRITE-04-01.                                                IC1064.2
   000427         043000     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000428         043100 LINK-TEST-04-02.                                                 IC1064.2
   000429         043200     ADD 1 TO REC-CT.                                             IC1064.2 109
   000430         043300     IF DN1 (IN1) EQUAL TO "C"                                    IC1064.2 49 51
   000431      1  043400         PERFORM PASS                                             IC1064.2 212
   000432      1  043500         GO TO LINK-WRITE-04-02.                                  IC1064.2 438
   000433         043600 LINK-FAIL-04-02.                                                 IC1064.2
   000434         043700     MOVE "C" TO CORRECT-A.                                       IC1064.2 87
   000435         043800     MOVE DN1 (IN1) TO COMPUTED-A.                                IC1064.2 49 51 73
   000436         043900     MOVE "INDEX DATA ITEM SET IN SUBPROG" TO RE-MARK.            IC1064.2 67
   000437         044000     PERFORM FAIL.                                                IC1064.2 213
   000438         044100 LINK-WRITE-04-02.                                                IC1064.2
   000439         044200     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000440         044300 LINK-TEST-04-03.                                                 IC1064.2
   000441         044400     ADD 1 TO REC-CT.                                             IC1064.2 109
   000442         044500     IF DN2 (3) EQUAL TO "C"                                      IC1064.2 53
   000443      1  044600         PERFORM PASS                                             IC1064.2 212
   000444      1  044700         GO TO LINK-WRITE-04-03.                                  IC1064.2 450
   000445         044800 LINK-FAIL-04-03.                                                 IC1064.2
   000446         044900     PERFORM FAIL.                                                IC1064.2 213
   000447         045000     MOVE "C" TO CORRECT-A.                                       IC1064.2 87
   000448         045100     MOVE DN2 (3) TO COMPUTED-A.                                  IC1064.2 53 73
   000449         045200     MOVE "INDEX DATA ITEM SET IN SUBPROG" TO RE-MARK.            IC1064.2 67
   000450         045300 LINK-WRITE-04-03.                                                IC1064.2
   000451         045400     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000452         045500 LINK-TEST-05.                                                    IC1064.2
   000453         045600     MOVE "TABLE REFERENCES" TO FEATURE.                          IC1064.2 58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     MOVE "LINK-TEST-05" TO PAR-NAME.                             IC1064.2 62
   000455         045800*        THIS TEST VERIFIES THAT DATA WAS MOVED FROM THE          IC1064.2
   000456         045900*    FIRST TABLE IN USING PHRASE TO SECOND TABLE IN USING PHRASE. IC1064.2
   000457         046000*    DATA WAS MOVED IN SUBPROGRAM IC107.                          IC1064.2
   000458         046100 LINK-TEST-05-01.                                                 IC1064.2
   000459         046200     MOVE 1 TO REC-CT.                                            IC1064.2 109
   000460         046300     IF DN2 (4) EQUAL TO "D"                                      IC1064.2 53
   000461      1  046400         PERFORM PASS                                             IC1064.2 212
   000462      1  046500         GO TO LINK-WRITE-05-01.                                  IC1064.2 468
   000463         046600 LINK-FAIL-05-01.                                                 IC1064.2
   000464         046700     PERFORM FAIL.                                                IC1064.2 213
   000465         046800     MOVE DN2 (4) TO COMPUTED-A.                                  IC1064.2 53 73
   000466         046900     MOVE "D" TO CORRECT-A.                                       IC1064.2 87
   000467         047000     MOVE "TABLES DEFINED IN LINKAGE SEC" TO RE-MARK.             IC1064.2 67
   000468         047100 LINK-WRITE-05-01.                                                IC1064.2
   000469         047200     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000470         047300 LINK-TEST-05-02.                                                 IC1064.2
   000471         047400     ADD 1 TO REC-CT.                                             IC1064.2 109
   000472         047500     IF DN2 (5) EQUAL TO "E"                                      IC1064.2 53
   000473      1  047600         PERFORM PASS                                             IC1064.2 212
   000474      1  047700         GO TO LINK-WRITE-05-02.                                  IC1064.2 480
   000475         047800 LINK-FAIL-05-02.                                                 IC1064.2
   000476         047900     PERFORM FAIL.                                                IC1064.2 213
   000477         048000     MOVE DN2 (5) TO COMPUTED-A.                                  IC1064.2 53 73
   000478         048100     MOVE "E" TO CORRECT-A.                                       IC1064.2 87
   000479         048200     MOVE "TABLES DEFINED IN LINKAGE SEC" TO RE-MARK.             IC1064.2 67
   000480         048300 LINK-WRITE-05-02.                                                IC1064.2
   000481         048400     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000482         048500 LINK-TEST-06.                                                    IC1064.2
   000483         048600     MOVE "REDEFINED ITEM" TO FEATURE.                            IC1064.2 58
   000484         048700     MOVE "LINK-TEST-06" TO PAR-NAME.                             IC1064.2 62
   000485         048800*        THIS TEST VERIFIES THAT DATA WAS MOVED TO                IC1064.2
   000486         048900*    A REDEFINED ITEM IN THE LINKAGE SECTION OF IC107.            IC1064.2
   000487         049000 LINK-TEST-06-01.                                                 IC1064.2
   000488         049100     MOVE 1 TO REC-CT.                                            IC1064.2 109
   000489         049200     IF DN2 (8) EQUAL TO "X"                                      IC1064.2 53
   000490      1  049300         PERFORM PASS                                             IC1064.2 212
   000491      1  049400         GO TO LINK-WRITE-06-01.                                  IC1064.2 497
   000492         049500 LINK-FAIL-06-01.                                                 IC1064.2
   000493         049600     PERFORM FAIL.                                                IC1064.2 213
   000494         049700     MOVE DN2 (8) TO COMPUTED-A.                                  IC1064.2 53 73
   000495         049800     MOVE "X" TO CORRECT-A.                                       IC1064.2 87
   000496         049900     MOVE "REDEFINED ITEM IN LINKAGE SEC" TO RE-MARK.             IC1064.2 67
   000497         050000 LINK-WRITE-06-01.                                                IC1064.2
   000498         050100     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000499         050200 LINK-TEST-06-02.                                                 IC1064.2
   000500         050300     ADD 1 TO REC-CT.                                             IC1064.2 109
   000501         050400     IF DN2 (9) EQUAL TO "Y"                                      IC1064.2 53
   000502      1  050500         PERFORM PASS                                             IC1064.2 212
   000503      1  050600         GO TO LINK-WRITE-06-02.                                  IC1064.2 509
   000504         050700 LINK-FAIL-06-02.                                                 IC1064.2
   000505         050800     PERFORM FAIL.                                                IC1064.2 213
   000506         050900     MOVE DN2 (9) TO COMPUTED-A.                                  IC1064.2 53 73
   000507         051000     MOVE "Y" TO CORRECT-A.                                       IC1064.2 87
   000508         051100     MOVE "REDEFINED ITEM IN LINKAGE SEC" TO RE-MARK.             IC1064.2 67
   000509         051200 LINK-WRITE-06-02.                                                IC1064.2
   000510         051300     PERFORM PRINT-DETAIL.                                        IC1064.2 216
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400 LINK-TEST-06-03.                                                 IC1064.2
   000512         051500     ADD 1 TO REC-CT.                                             IC1064.2 109
   000513         051600     IF DN2 (10) EQUAL TO "Z"                                     IC1064.2 53
   000514      1  051700         PERFORM PASS                                             IC1064.2 212
   000515      1  051800         GO TO LINK-WRITE-06-03.                                  IC1064.2 521
   000516         051900 LINK-FAIL-06-03.                                                 IC1064.2
   000517         052000     PERFORM FAIL.                                                IC1064.2 213
   000518         052100     MOVE DN2 (10) TO COMPUTED-A.                                 IC1064.2 53 73
   000519         052200     MOVE "Z" TO CORRECT-A.                                       IC1064.2 87
   000520         052300     MOVE "REDEFINED ITEM IN LINKAGE SEC" TO RE-MARK.             IC1064.2 67
   000521         052400 LINK-WRITE-06-03.                                                IC1064.2
   000522         052500     PERFORM PRINT-DETAIL.                                        IC1064.2 216
   000523         052600 LINK-END-ROUTINE.                                                IC1064.2
   000524         052700     GO TO CCVS-EXIT.                                             IC1064.2 525
   000525         052800 CCVS-EXIT SECTION.                                               IC1064.2
   000526         052900 CCVS-999999.                                                     IC1064.2
   000527         053000     GO TO CLOSE-FILES.                                           IC1064.2 205
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page    13
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      118   ANSI-REFERENCE . . . . . . . .  290 297 306
       97   CCVS-C-1 . . . . . . . . . . .  234 276
      102   CCVS-C-2 . . . . . . . . . . .  235 277
      152   CCVS-E-1 . . . . . . . . . . .  240
      157   CCVS-E-2 . . . . . . . . . . .  249 256 263 268
      160   CCVS-E-2-2 . . . . . . . . . .  M248
      165   CCVS-E-3 . . . . . . . . . . .  269
      174   CCVS-E-4 . . . . . . . . . . .  248
      175   CCVS-E-4-1 . . . . . . . . . .  M246
      177   CCVS-E-4-2 . . . . . . . . . .  M247
      119   CCVS-H-1 . . . . . . . . . . .  229
      124   CCVS-H-2A. . . . . . . . . . .  230
      133   CCVS-H-2B. . . . . . . . . . .  231
      145   CCVS-H-3 . . . . . . . . . . .  232
      195   CCVS-PGM-ID. . . . . . . . . .  201 201
       79   CM-18V0
       73   COMPUTED-A . . . . . . . . . .  74 76 77 78 79 302 305 M331 M362 M374 M392 M404 M435 M448 M465 M477 M494 M506
                                            M518
       74   COMPUTED-N
       72   COMPUTED-X . . . . . . . . . .  M224 288
       76   COMPUTED-0V18
       78   COMPUTED-14V4
       80   COMPUTED-18V0. . . . . . . . .  M345 M423
       77   COMPUTED-4V14
       96   COR-ANSI-REFERENCE . . . . . .  M297 M299
       87   CORRECT-A. . . . . . . . . . .  88 89 90 91 92 303 305 M332 M363 M375 M393 M405 M434 M447 M466 M478 M495 M507
                                            M519
       88   CORRECT-N
       86   CORRECT-X. . . . . . . . . . .  M225 289
       89   CORRECT-0V18
       91   CORRECT-14V4
       93   CORRECT-18V0 . . . . . . . . .  M343 M421
       90   CORRECT-4V14
       92   CR-18V0
      110   DELETE-COUNTER . . . . . . . .  M214 243 259 261
       49   DN1. . . . . . . . . . . . . .  326 331 430 435
       53   DN2. . . . . . . . . . . . . .  357 362 369 374 387 392 399 404 442 448 460 465 472 477 489 494 501 506 513 518
       65   DOTVALUE . . . . . . . . . . .  M219
      116   DUMMY-HOLD . . . . . . . . . .  M273 279
       44   DUMMY-RECORD . . . . . . . . .  M229 M230 M231 M232 M234 M235 M236 M238 M240 M249 M256 M263 M268 M269 273 M274
                                            275 M276 M277 M278 M279 283 M284 M292 M307
      163   ENDER-DESC . . . . . . . . . .  M251 M262 M267
      111   ERROR-COUNTER. . . . . . . . .  M213 242 252 255
      115   ERROR-HOLD . . . . . . . . . .  M242 M243 M243 M244 247
      161   ERROR-TOTAL. . . . . . . . . .  M253 M255 M260 M261 M265 M266
       58   FEATURE. . . . . . . . . . . .  M320 M350 M380 M410 M453 M483
      189   HYPHEN-LINE. . . . . . . . . .  236 238 278
      155   ID-AGAIN . . . . . . . . . . .  M201
       46   IDN1 . . . . . . . . . . . . .  M317 318 416
       47   INDEX-VALUE. . . . . . . . . .  M344 345 M422 423
      188   INF-ANSI-REFERENCE . . . . . .  M290 M293 M306 M308
      183   INFO-TEXT. . . . . . . . . . .  M291
      112   INSPECT-COUNTER. . . . . . . .  M211 242 264 266
       51   IN1. . . . . . . . . . . . . .  M316 317 326 331 338 344 M416 417 422 430 435
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page    14
0 Defined   Cross-reference of data names   References

0      55   IN2
       60   P-OR-F . . . . . . . . . . . .  M211 M212 M213 M214 221 M224
       62   PAR-NAME . . . . . . . . . . .  M226 M321 M351 M381 M411 M454 M484
       64   PARDOT-X . . . . . . . . . . .  M218
      113   PASS-COUNTER . . . . . . . . .  M212 244 246
       42   PRINT-FILE . . . . . . . . . .  38 200 206
       43   PRINT-REC. . . . . . . . . . .  M220 M296 M298
       67   RE-MARK. . . . . . . . . . . .  M215 M227 M333 M346 M364 M376 M394 M406 M425 M436 M449 M467 M479 M496 M508 M520
      109   REC-CT . . . . . . . . . . . .  217 219 226 M325 M337 M356 M368 M386 M398 M415 M429 M441 M459 M471 M488 M500
                                            M512
      108   REC-SKL-SUB
      117   RECORD-COUNT . . . . . . . . .  M271 272 M280
       48   TABLE-1. . . . . . . . . . . .  M314 318
       52   TABLE-2. . . . . . . . . . . .  M315 318
       68   TEST-COMPUTED. . . . . . . . .  296
       83   TEST-CORRECT . . . . . . . . .  298
      136   TEST-ID. . . . . . . . . . . .  M201
       56   TEST-RESULTS . . . . . . . . .  M202 220
      114   TOTAL-ERROR
      185   XXCOMPUTED . . . . . . . . . .  M305
      187   XXCORRECT. . . . . . . . . . .  M305
      180   XXINFO . . . . . . . . . . . .  292 307
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page    15
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

      301   BAIL-OUT . . . . . . . . . . .  P223
      309   BAIL-OUT-EX. . . . . . . . . .  E223 G303
      304   BAIL-OUT-WRITE . . . . . . . .  G302
      285   BLANK-LINE-PRINT
      525   CCVS-EXIT. . . . . . . . . . .  G524
      526   CCVS-999999
      198   CCVS1
      310   CCVS1-EXIT . . . . . . . . . .  G204
      205   CLOSE-FILES. . . . . . . . . .  G527
      233   COLUMN-NAMES-ROUTINE . . . . .  E203
      214   DE-LETE
      237   END-ROUTINE. . . . . . . . . .  P206
      241   END-ROUTINE-1
      250   END-ROUTINE-12
      258   END-ROUTINE-13 . . . . . . . .  E206
      239   END-RTN-EXIT
      213   FAIL . . . . . . . . . . . . .  P330 P342 P361 P373 P391 P403 P424 P437 P446 P464 P476 P493 P505 P517
      287   FAIL-ROUTINE . . . . . . . . .  P222
      300   FAIL-ROUTINE-EX. . . . . . . .  E222 G294
      295   FAIL-ROUTINE-WRITE . . . . . .  G288 G289
      228   HEAD-ROUTINE . . . . . . . . .  P203
      211   INSPT
      523   LINK-END-ROUTINE
      329   LINK-FAIL-01-01
      341   LINK-FAIL-01-02
      360   LINK-FAIL-02-01
      372   LINK-FAIL-02-02
      390   LINK-FAIL-03-01
      402   LINK-FAIL-03-02
      420   LINK-FAIL-04-01
      433   LINK-FAIL-04-02
      445   LINK-FAIL-04-03
      463   LINK-FAIL-05-01
      475   LINK-FAIL-05-02
      492   LINK-FAIL-06-01
      504   LINK-FAIL-06-02
      516   LINK-FAIL-06-03
      313   LINK-TEST-INITIALIZE
      319   LINK-TEST-01
      324   LINK-TEST-01-01
      336   LINK-TEST-01-02
      349   LINK-TEST-02
      355   LINK-TEST-02-01
      367   LINK-TEST-02-02
      379   LINK-TEST-03
      385   LINK-TEST-03-01
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page    16
0 Defined   Cross-reference of procedures   References

0     397   LINK-TEST-03-02
      409   LINK-TEST-04
      414   LINK-TEST-04-01
      428   LINK-TEST-04-02
      440   LINK-TEST-04-03
      452   LINK-TEST-05
      458   LINK-TEST-05-01
      470   LINK-TEST-05-02
      482   LINK-TEST-06
      487   LINK-TEST-06-01
      499   LINK-TEST-06-02
      511   LINK-TEST-06-03
      334   LINK-WRITE-01-01 . . . . . . .  G328
      347   LINK-WRITE-01-02 . . . . . . .  G340
      365   LINK-WRITE-02-01 . . . . . . .  G359
      377   LINK-WRITE-02-02 . . . . . . .  G371
      395   LINK-WRITE-03-01 . . . . . . .  G389
      407   LINK-WRITE-03-02 . . . . . . .  G401
      426   LINK-WRITE-04-01 . . . . . . .  G419
      438   LINK-WRITE-04-02 . . . . . . .  G432
      450   LINK-WRITE-04-03 . . . . . . .  G444
      468   LINK-WRITE-05-01 . . . . . . .  G462
      480   LINK-WRITE-05-02 . . . . . . .  G474
      497   LINK-WRITE-06-01 . . . . . . .  G491
      509   LINK-WRITE-06-02 . . . . . . .  G503
      521   LINK-WRITE-06-03 . . . . . . .  G515
      199   OPEN-FILES
      212   PASS . . . . . . . . . . . . .  P327 P339 P358 P370 P388 P400 P418 P431 P443 P461 P473 P490 P502 P514
      216   PRINT-DETAIL . . . . . . . . .  P335 P348 P366 P378 P396 P408 P427 P439 P451 P469 P481 P498 P510 P522
      312   SEC-IC106-0001
      209   TERMINATE-CALL
      207   TERMINATE-CCVS
      270   WRITE-LINE . . . . . . . . . .  P220 P221 P229 P230 P231 P232 P234 P235 P236 P238 P240 P249 P257 P263 P268 P269
                                            P292 P296 P298 P307
      282   WRT-LN . . . . . . . . . . . .  P276 P277 P278 P281 P286
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page    17
0 Defined   Cross-reference of programs     References

        3   IC106A
 EXTERNAL   IC107A . . . . . . . . . . . .  318
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC106A    Date 06/04/2022  Time 11:59:19   Page    18
0LineID  Message code  Message text

     42  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC106A:
 *    Source records = 527
 *    Data Division statements = 69
 *    Procedure Division statements = 275
 *    Generated COBOL statements = 0
 *    Program complexity factor = 282
0End of compilation 1,  program IC106A,  highest severity 0.
0Return code 0
