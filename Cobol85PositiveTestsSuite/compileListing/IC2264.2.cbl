1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:38   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:38   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2264.2
   000002         000200 PROGRAM-ID.                                                      IC2264.2
   000003         000300     IC226A.                                                      IC2264.2
   000004         000500*                                                              *  IC2264.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2264.2
   000006         000700*                                                              *  IC2264.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2264.2
   000008         000900*                                                              *  IC2264.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2264.2
   000010         001100*                                                              *  IC2264.2
   000011         001300*                                                              *  IC2264.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2264.2
   000013         001500*                                                              *  IC2264.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2264.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2264.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2264.2
   000017         001900*                                                              *  IC2264.2
   000018         002100*                                                              *  IC2264.2
   000019         002200*    PROGRAM IC226A AND IC226A-1 WILL TEST THE NEW LANGUAGE    *  IC2264.2
   000020         002300*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2264.2
   000021         002400*    MODULE.                                                   *  IC2264.2
   000022         002500*    THE NEW LANGUAGE ELEMENT  TO BE TESTED WILL BE:           *  IC2264.2
   000023         002600*          THE "EXTERNAL"     PHRASE                           *  IC2264.2
   000024         002700*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2264.2
   000025         002800*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2264.2
   000026         002900*    IDENTIFICATION DIVISION.                                  *  IC2264.2
   000027         003000*    PROGRAM-ID. IC226A.                                       *  IC2264.2
   000028         003100*              .                                               *  IC2264.2
   000029         003200*              .                                               *  IC2264.2
   000030         003300*              .                                               *  IC2264.2
   000031         003400*    END PROGRAM IC226A.                                       *  IC2264.2
   000032         003500*    PROGRAM-ID. IC226A-1.                                     *  IC2264.2
   000033         003600*              .                                               *  IC2264.2
   000034         003700*              .                                               *  IC2264.2
   000035         003800*              .                                               *  IC2264.2
   000036         004000 ENVIRONMENT DIVISION.                                            IC2264.2
   000037         004100 CONFIGURATION SECTION.                                           IC2264.2
   000038         004200 SOURCE-COMPUTER.                                                 IC2264.2
   000039         004300     XXXXX082.                                                    IC2264.2
   000040         004400 OBJECT-COMPUTER.                                                 IC2264.2
   000041         004500     XXXXX083.                                                    IC2264.2
   000042         004600 INPUT-OUTPUT SECTION.                                            IC2264.2
   000043         004700 FILE-CONTROL.                                                    IC2264.2
   000044         004800     SELECT PRINT-FILE ASSIGN TO                                  IC2264.2 48
   000045         004900     XXXXX055.                                                    IC2264.2
   000046         005000 DATA DIVISION.                                                   IC2264.2
   000047         005100 FILE SECTION.                                                    IC2264.2
   000048         005200 FD  PRINT-FILE.                                                  IC2264.2

 ==000048==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000049         005300 01  PRINT-REC PICTURE X(120).                                    IC2264.2
   000050         005400 01  DUMMY-RECORD PICTURE X(120).                                 IC2264.2
   000051         005500 WORKING-STORAGE SECTION.                                         IC2264.2
   000052         005600 01  EXTERNAL-DATA IS EXTERNAL.                                   IC2264.2
   000053         005700   03        EXT-DATA-1          PIC X(2).                        IC2264.2
   000054         005800   03        EXT-DATA-2          PIC X(6).                        IC2264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900   03        EXT-DATA-3          PIC 9(8).                        IC2264.2
   000056         006000   03        EXT-DATA-4          PIC 9(4).                        IC2264.2
   000057         006100 01  SUB                         PIC 9(4)  VALUE ZERO.            IC2264.2 IMP
   000058         006200*                                                                 IC2264.2
   000059         006300 01  TEST-RESULTS.                                                IC2264.2
   000060         006400     02 FILLER                   PIC X      VALUE SPACE.          IC2264.2 IMP
   000061         006500     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2264.2 IMP
   000062         006600     02 FILLER                   PIC X      VALUE SPACE.          IC2264.2 IMP
   000063         006700     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2264.2 IMP
   000064         006800     02 FILLER                   PIC X      VALUE SPACE.          IC2264.2 IMP
   000065         006900     02  PAR-NAME.                                                IC2264.2
   000066         007000       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2264.2 IMP
   000067         007100       03  PARDOT-X              PIC X      VALUE SPACE.          IC2264.2 IMP
   000068         007200       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2264.2 IMP
   000069         007300     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2264.2 IMP
   000070         007400     02 RE-MARK                  PIC X(61).                       IC2264.2
   000071         007500 01  TEST-COMPUTED.                                               IC2264.2
   000072         007600     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2264.2 IMP
   000073         007700     02 FILLER                   PIC X(17)  VALUE                 IC2264.2
   000074         007800            "       COMPUTED=".                                   IC2264.2
   000075         007900     02 COMPUTED-X.                                               IC2264.2
   000076         008000     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2264.2 IMP
   000077         008100     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2264.2 76
   000078         008200                                 PIC -9(9).9(9).                  IC2264.2
   000079         008300     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2264.2 76
   000080         008400     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2264.2 76
   000081         008500     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2264.2 76
   000082         008600     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2264.2 76
   000083         008700         04 COMPUTED-18V0                    PIC -9(18).          IC2264.2
   000084         008800         04 FILLER                           PIC X.               IC2264.2
   000085         008900     03 FILLER PIC X(50) VALUE SPACE.                             IC2264.2 IMP
   000086         009000 01  TEST-CORRECT.                                                IC2264.2
   000087         009100     02 FILLER PIC X(30) VALUE SPACE.                             IC2264.2 IMP
   000088         009200     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2264.2
   000089         009300     02 CORRECT-X.                                                IC2264.2
   000090         009400     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2264.2 IMP
   000091         009500     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2264.2 90
   000092         009600     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2264.2 90
   000093         009700     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2264.2 90
   000094         009800     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2264.2 90
   000095         009900     03      CR-18V0 REDEFINES CORRECT-A.                         IC2264.2 90
   000096         010000         04 CORRECT-18V0                     PIC -9(18).          IC2264.2
   000097         010100         04 FILLER                           PIC X.               IC2264.2
   000098         010200     03 FILLER PIC X(2) VALUE SPACE.                              IC2264.2 IMP
   000099         010300     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2264.2 IMP
   000100         010400 01  CCVS-C-1.                                                    IC2264.2
   000101         010500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2264.2
   000102         010600-    "SS  PARAGRAPH-NAME                                          IC2264.2
   000103         010700-    "       REMARKS".                                            IC2264.2
   000104         010800     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2264.2 IMP
   000105         010900 01  CCVS-C-2.                                                    IC2264.2
   000106         011000     02 FILLER                     PIC X        VALUE SPACE.      IC2264.2 IMP
   000107         011100     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2264.2
   000108         011200     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2264.2 IMP
   000109         011300     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2264.2
   000110         011400     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2264.2 IMP
   000111         011500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2264.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  REC-CT                        PIC 99       VALUE ZERO.       IC2264.2 IMP
   000113         011700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2264.2 IMP
   000114         011800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2264.2 IMP
   000115         011900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2264.2 IMP
   000116         012000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2264.2 IMP
   000117         012100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2264.2 IMP
   000118         012200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2264.2 IMP
   000119         012300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2264.2 IMP
   000120         012400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2264.2 IMP
   000121         012500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2264.2 IMP
   000122         012600 01  CCVS-H-1.                                                    IC2264.2
   000123         012700     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2264.2 IMP
   000124         012800     02  FILLER                    PIC X(42)    VALUE             IC2264.2
   000125         012900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2264.2
   000126         013000     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2264.2 IMP
   000127         013100 01  CCVS-H-2A.                                                   IC2264.2
   000128         013200   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2264.2 IMP
   000129         013300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2264.2
   000130         013400   02  FILLER                        PIC XXXX   VALUE             IC2264.2
   000131         013500     "4.2 ".                                                      IC2264.2
   000132         013600   02  FILLER                        PIC X(28)  VALUE             IC2264.2
   000133         013700            " COPY - NOT FOR DISTRIBUTION".                       IC2264.2
   000134         013800   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2264.2 IMP
   000135         013900                                                                  IC2264.2
   000136         014000 01  CCVS-H-2B.                                                   IC2264.2
   000137         014100   02  FILLER                        PIC X(15)  VALUE             IC2264.2
   000138         014200            "TEST RESULT OF ".                                    IC2264.2
   000139         014300   02  TEST-ID                       PIC X(9).                    IC2264.2
   000140         014400   02  FILLER                        PIC X(4)   VALUE             IC2264.2
   000141         014500            " IN ".                                               IC2264.2
   000142         014600   02  FILLER                        PIC X(12)  VALUE             IC2264.2
   000143         014700     " HIGH       ".                                              IC2264.2
   000144         014800   02  FILLER                        PIC X(22)  VALUE             IC2264.2
   000145         014900            " LEVEL VALIDATION FOR ".                             IC2264.2
   000146         015000   02  FILLER                        PIC X(58)  VALUE             IC2264.2
   000147         015100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2264.2
   000148         015200 01  CCVS-H-3.                                                    IC2264.2
   000149         015300     02  FILLER                      PIC X(34)  VALUE             IC2264.2
   000150         015400            " FOR OFFICIAL USE ONLY    ".                         IC2264.2
   000151         015500     02  FILLER                      PIC X(58)  VALUE             IC2264.2
   000152         015600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2264.2
   000153         015700     02  FILLER                      PIC X(28)  VALUE             IC2264.2
   000154         015800            "  COPYRIGHT   1985 ".                                IC2264.2
   000155         015900 01  CCVS-E-1.                                                    IC2264.2
   000156         016000     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2264.2 IMP
   000157         016100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2264.2
   000158         016200     02 ID-AGAIN                     PIC X(9).                    IC2264.2
   000159         016300     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2264.2 IMP
   000160         016400 01  CCVS-E-2.                                                    IC2264.2
   000161         016500     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2264.2 IMP
   000162         016600     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2264.2 IMP
   000163         016700     02 CCVS-E-2-2.                                               IC2264.2
   000164         016800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2264.2 IMP
   000165         016900         03 FILLER                   PIC X      VALUE SPACE.      IC2264.2 IMP
   000166         017000         03 ENDER-DESC               PIC X(44)  VALUE             IC2264.2
   000167         017100            "ERRORS ENCOUNTERED".                                 IC2264.2
   000168         017200 01  CCVS-E-3.                                                    IC2264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02  FILLER                      PIC X(22)  VALUE             IC2264.2
   000170         017400            " FOR OFFICIAL USE ONLY".                             IC2264.2
   000171         017500     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2264.2 IMP
   000172         017600     02  FILLER                      PIC X(58)  VALUE             IC2264.2
   000173         017700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2264.2
   000174         017800     02  FILLER                      PIC X(13)  VALUE SPACE.      IC2264.2 IMP
   000175         017900     02 FILLER                       PIC X(15)  VALUE             IC2264.2
   000176         018000             " COPYRIGHT 1985".                                   IC2264.2
   000177         018100 01  CCVS-E-4.                                                    IC2264.2
   000178         018200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2264.2 IMP
   000179         018300     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2264.2
   000180         018400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2264.2 IMP
   000181         018500     02 FILLER                       PIC X(40)  VALUE             IC2264.2
   000182         018600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2264.2
   000183         018700 01  XXINFO.                                                      IC2264.2
   000184         018800     02 FILLER                       PIC X(19)  VALUE             IC2264.2
   000185         018900            "*** INFORMATION ***".                                IC2264.2
   000186         019000     02 INFO-TEXT.                                                IC2264.2
   000187         019100       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2264.2 IMP
   000188         019200       04 XXCOMPUTED                 PIC X(20).                   IC2264.2
   000189         019300       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2264.2 IMP
   000190         019400       04 XXCORRECT                  PIC X(20).                   IC2264.2
   000191         019500     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2264.2
   000192         019600 01  HYPHEN-LINE.                                                 IC2264.2
   000193         019700     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2264.2 IMP
   000194         019800     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2264.2
   000195         019900-    "*****************************************".                 IC2264.2
   000196         020000     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2264.2
   000197         020100-    "******************************".                            IC2264.2
   000198         020200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2264.2
   000199         020300     "IC226A".                                                    IC2264.2
   000200         020400 PROCEDURE DIVISION.                                              IC2264.2
   000201         020500 CCVS1 SECTION.                                                   IC2264.2
   000202         020600 OPEN-FILES.                                                      IC2264.2
   000203         020700     OPEN     OUTPUT PRINT-FILE.                                  IC2264.2 48
   000204         020800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IC2264.2 198 139 198 158
   000205         020900     MOVE    SPACE TO TEST-RESULTS.                               IC2264.2 IMP 59
   000206         021000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IC2264.2 231 236
   000207         021100     GO TO CCVS1-EXIT.                                            IC2264.2 313
   000208         021200 CLOSE-FILES.                                                     IC2264.2
   000209         021300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2264.2 240 261 48
   000210         021400 TERMINATE-CCVS.                                                  IC2264.2
   000211         021500     EXIT PROGRAM.                                                IC2264.2
   000212         021600 TERMINATE-CALL.                                                  IC2264.2
   000213         021700     STOP     RUN.                                                IC2264.2
   000214         021800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2264.2 63 115
   000215         021900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2264.2 63 116
   000216         022000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2264.2 63 114
   000217         022100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2264.2 63 113
   000218         022200     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2264.2 70
   000219         022300 PRINT-DETAIL.                                                    IC2264.2
   000220         022400     IF REC-CT NOT EQUAL TO ZERO                                  IC2264.2 112 IMP
   000221      1  022500             MOVE "." TO PARDOT-X                                 IC2264.2 67
   000222      1  022600             MOVE REC-CT TO DOTVALUE.                             IC2264.2 112 68
   000223         022700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2264.2 59 49 273
   000224         022800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2264.2 63 273
   000225      1  022900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2264.2 290 303
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  023000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2264.2 304 312
   000227         023100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2264.2 IMP 63 IMP 75
   000228         023200     MOVE SPACE TO CORRECT-X.                                     IC2264.2 IMP 89
   000229         023300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2264.2 112 IMP IMP 65
   000230         023400     MOVE     SPACE TO RE-MARK.                                   IC2264.2 IMP 70
   000231         023500 HEAD-ROUTINE.                                                    IC2264.2
   000232         023600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2264.2 122 50 273
   000233         023700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2264.2 127 50 273
   000234         023800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2264.2 136 50 273
   000235         023900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2264.2 148 50 273
   000236         024000 COLUMN-NAMES-ROUTINE.                                            IC2264.2
   000237         024100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2264.2 100 50 273
   000238         024200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2264.2 105 50 273
   000239         024300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2264.2 192 50 273
   000240         024400 END-ROUTINE.                                                     IC2264.2
   000241         024500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2264.2 192 50 273
   000242         024600 END-RTN-EXIT.                                                    IC2264.2
   000243         024700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2264.2 155 50 273
   000244         024800 END-ROUTINE-1.                                                   IC2264.2
   000245         024900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2264.2 114 118 115
   000246         025000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2264.2 118 113 118
   000247         025100      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2264.2 116 118
   000248         025200*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2264.2
   000249         025300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2264.2 116 178
   000250         025400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2264.2 118 180
   000251         025500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2264.2 177 163
   000252         025600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2264.2 160 50 273
   000253         025700  END-ROUTINE-12.                                                 IC2264.2
   000254         025800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2264.2 166
   000255         025900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2264.2 114 IMP
   000256      1  026000         MOVE "NO " TO ERROR-TOTAL                                IC2264.2 164
   000257         026100         ELSE                                                     IC2264.2
   000258      1  026200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2264.2 114 164
   000259         026300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2264.2 160 50
   000260         026400     PERFORM WRITE-LINE.                                          IC2264.2 273
   000261         026500 END-ROUTINE-13.                                                  IC2264.2
   000262         026600     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2264.2 113 IMP
   000263      1  026700         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2264.2 164
   000264      1  026800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2264.2 113 164
   000265         026900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2264.2 166
   000266         027000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2264.2 160 50 273
   000267         027100      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2264.2 115 IMP
   000268      1  027200          MOVE "NO " TO ERROR-TOTAL                               IC2264.2 164
   000269      1  027300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2264.2 115 164
   000270         027400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2264.2 166
   000271         027500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2264.2 160 50 273
   000272         027600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2264.2 168 50 273
   000273         027700 WRITE-LINE.                                                      IC2264.2
   000274         027800     ADD 1 TO RECORD-COUNT.                                       IC2264.2 120
   000275         027900     IF RECORD-COUNT GREATER 50                                   IC2264.2 120
   000276      1  028000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2264.2 50 119
   000277      1  028100         MOVE SPACE TO DUMMY-RECORD                               IC2264.2 IMP 50
   000278      1  028200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2264.2 50
   000279      1  028300         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2264.2 100 50 285
   000280      1  028400         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2264.2 105 50 285
   000281      1  028500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2264.2 192 50 285
   000282      1  028600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2264.2 119 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700         MOVE ZERO TO RECORD-COUNT.                               IC2264.2 IMP 120
   000284         028800     PERFORM WRT-LN.                                              IC2264.2 285
   000285         028900 WRT-LN.                                                          IC2264.2
   000286         029000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2264.2 50
   000287         029100     MOVE SPACE TO DUMMY-RECORD.                                  IC2264.2 IMP 50
   000288         029200 BLANK-LINE-PRINT.                                                IC2264.2
   000289         029300     PERFORM WRT-LN.                                              IC2264.2 285
   000290         029400 FAIL-ROUTINE.                                                    IC2264.2
   000291         029500     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2264.2 75 IMP 298
   000292         029600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IC2264.2 89 IMP 298
   000293         029700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2264.2 121 191
   000294         029800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2264.2 186
   000295         029900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2264.2 183 50 273
   000296         030000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2264.2 IMP 191
   000297         030100     GO TO  FAIL-ROUTINE-EX.                                      IC2264.2 303
   000298         030200 FAIL-ROUTINE-WRITE.                                              IC2264.2
   000299         030300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2264.2 71 49 273
   000300         030400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2264.2 121 99
   000301         030500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2264.2 86 49 273
   000302         030600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2264.2 IMP 99
   000303         030700 FAIL-ROUTINE-EX. EXIT.                                           IC2264.2
   000304         030800 BAIL-OUT.                                                        IC2264.2
   000305         030900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2264.2 76 IMP 307
   000306         031000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2264.2 90 IMP 312
   000307         031100 BAIL-OUT-WRITE.                                                  IC2264.2
   000308         031200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2264.2 90 190 76 188
   000309         031300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2264.2 121 191
   000310         031400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2264.2 183 50 273
   000311         031500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2264.2 IMP 191
   000312         031600 BAIL-OUT-EX. EXIT.                                               IC2264.2
   000313         031700 CCVS1-EXIT.                                                      IC2264.2
   000314         031800     EXIT.                                                        IC2264.2
   000315         031900 SECT-IC226A-001 SECTION.                                         IC2264.2
   000316         032000 EXT-INIT-01.                                                     IC2264.2
   000317         032100     MOVE   1         TO REC-CT.                                  IC2264.2 112
   000318         032200     MOVE   "X-21 4.5.1" TO ANSI-REFERENCE.                       IC2264.2 121
   000319         032300     MOVE   "EXTERNAL CLAUSE" TO FEATURE.                         IC2264.2 61
   000320         032400     MOVE   "AA"      TO EXT-DATA-1.                              IC2264.2 53
   000321         032500     MOVE   "FIRST]"  TO EXT-DATA-2.                              IC2264.2 54
   000322         032600     MOVE    12345678 TO EXT-DATA-3.                              IC2264.2 55
   000323         032700     MOVE    1        TO EXT-DATA-4.                              IC2264.2 56
   000324         032800 EXT-TEST-01-01-0.                                                IC2264.2
   000325         032900     CALL   "IC226A-1"                                            IC2264.2 EXT

 ==000325==> IGYPG0020-W Name "IC226A-1" was processed as "IC226A01".

   000326         033000     END-CALL.                                                    IC2264.2
   000327         033100     GO TO   EXT-TEST-01-01-1.                                    IC2264.2 332
   000328         033200 EXT-DELETE-01-01.                                                IC2264.2
   000329         033300     PERFORM DE-LETE.                                             IC2264.2 217
   000330         033400     PERFORM PRINT-DETAIL.                                        IC2264.2 219
   000331         033500     GO TO   CCVS-EXIT.                                           IC2264.2 380
   000332         033600 EXT-TEST-01-01-1.                                                IC2264.2
   000333         033700     MOVE   "EXT-TEST-01-01-1" TO PAR-NAME.                       IC2264.2 65
   000334         033800     IF      EXT-DATA-1 = "ZZ"                                    IC2264.2 53
   000335      1  033900             PERFORM PASS                                         IC2264.2 215
   000336      1  034000             PERFORM PRINT-DETAIL                                 IC2264.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000337         034100     ELSE                                                         IC2264.2
   000338      1  034200             MOVE    EXT-DATA-1  TO COMPUTED-X                    IC2264.2 53 75
   000339      1  034300             MOVE   "ZZ" TO CORRECT-X                             IC2264.2 89
   000340      1  034400             MOVE   "INCORRECT VALUE RETURNED" TO RE-MARK         IC2264.2 70
   000341      1  034500             PERFORM FAIL                                         IC2264.2 216
   000342      1  034600             PERFORM PRINT-DETAIL.                                IC2264.2 219
   000343         034700     ADD     1 TO REC-CT.                                         IC2264.2 112
   000344         034800 CALL-TEST-01-01-2.                                               IC2264.2
   000345         034900     MOVE   "CALL-TEST-01-01-2" TO PAR-NAME.                      IC2264.2 65
   000346         035000     IF      EXT-DATA-2 = "CHANGE"                                IC2264.2 54
   000347      1  035100             PERFORM PASS                                         IC2264.2 215
   000348      1  035200             PERFORM PRINT-DETAIL                                 IC2264.2 219
   000349         035300     ELSE                                                         IC2264.2
   000350      1  035400             MOVE    EXT-DATA-2  TO COMPUTED-X                    IC2264.2 54 75
   000351      1  035500             MOVE   "CHANGE" TO CORRECT-X                         IC2264.2 89
   000352      1  035600             MOVE   "INCORRECT VALUE RETURNED" TO RE-MARK         IC2264.2 70
   000353      1  035700             PERFORM FAIL                                         IC2264.2 216
   000354      1  035800             PERFORM PRINT-DETAIL.                                IC2264.2 219
   000355         035900     ADD     1 TO REC-CT.                                         IC2264.2 112
   000356         036000 CALL-TEST-01-01-3.                                               IC2264.2
   000357         036100     MOVE   "CALL-TEST-01-01-3" TO PAR-NAME.                      IC2264.2 65
   000358         036200     IF      EXT-DATA-3 = 87654321                                IC2264.2 55
   000359      1  036300             PERFORM PASS                                         IC2264.2 215
   000360      1  036400             PERFORM PRINT-DETAIL                                 IC2264.2 219
   000361         036500     ELSE                                                         IC2264.2
   000362      1  036600             MOVE    EXT-DATA-3  TO COMPUTED-N                    IC2264.2 55 77
   000363      1  036700             MOVE    87654321 TO CORRECT-N                        IC2264.2 91
   000364      1  036800             MOVE   "INCORRECT VALUE RETURNED" TO RE-MARK         IC2264.2 70
   000365      1  036900             PERFORM FAIL                                         IC2264.2 216
   000366      1  037000             PERFORM PRINT-DETAIL.                                IC2264.2 219
   000367         037100     ADD     1 TO REC-CT.                                         IC2264.2 112
   000368         037200 CALL-TEST-01-01-4.                                               IC2264.2
   000369         037300     MOVE   "CALL-TEST-01-01-4" TO PAR-NAME.                      IC2264.2 65
   000370         037400     IF      EXT-DATA-4 = 11                                      IC2264.2 56
   000371      1  037500             PERFORM PASS                                         IC2264.2 215
   000372      1  037600             PERFORM PRINT-DETAIL                                 IC2264.2 219
   000373         037700     ELSE                                                         IC2264.2
   000374      1  037800             MOVE    EXT-DATA-4 TO COMPUTED-N                     IC2264.2 56 77
   000375      1  037900             MOVE    11   TO CORRECT-N                            IC2264.2 91
   000376      1  038000             MOVE   "INCORRECT VALUE RETURNED" TO RE-MARK         IC2264.2 70
   000377      1  038100             PERFORM FAIL                                         IC2264.2 216
   000378      1  038200             PERFORM PRINT-DETAIL.                                IC2264.2 219
   000379         038300*                                                                 IC2264.2
   000380         038400 CCVS-EXIT SECTION.                                               IC2264.2
   000381         038500 CCVS-999999.                                                     IC2264.2
   000382         038600     GO TO CLOSE-FILES.                                           IC2264.2 208
   000383         038700 END PROGRAM IC226A.                                              IC2264.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page    10
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      121   ANSI-REFERENCE . . . . . . . .  293 300 309 M318
      100   CCVS-C-1 . . . . . . . . . . .  237 279
      105   CCVS-C-2 . . . . . . . . . . .  238 280
      155   CCVS-E-1 . . . . . . . . . . .  243
      160   CCVS-E-2 . . . . . . . . . . .  252 259 266 271
      163   CCVS-E-2-2 . . . . . . . . . .  M251
      168   CCVS-E-3 . . . . . . . . . . .  272
      177   CCVS-E-4 . . . . . . . . . . .  251
      178   CCVS-E-4-1 . . . . . . . . . .  M249
      180   CCVS-E-4-2 . . . . . . . . . .  M250
      122   CCVS-H-1 . . . . . . . . . . .  232
      127   CCVS-H-2A. . . . . . . . . . .  233
      136   CCVS-H-2B. . . . . . . . . . .  234
      148   CCVS-H-3 . . . . . . . . . . .  235
      198   CCVS-PGM-ID. . . . . . . . . .  204 204
       82   CM-18V0
       76   COMPUTED-A . . . . . . . . . .  77 79 80 81 82 305 308
       77   COMPUTED-N . . . . . . . . . .  M362 M374
       75   COMPUTED-X . . . . . . . . . .  M227 291 M338 M350
       79   COMPUTED-0V18
       81   COMPUTED-14V4
       83   COMPUTED-18V0
       80   COMPUTED-4V14
       99   COR-ANSI-REFERENCE . . . . . .  M300 M302
       90   CORRECT-A. . . . . . . . . . .  91 92 93 94 95 306 308
       91   CORRECT-N. . . . . . . . . . .  M363 M375
       89   CORRECT-X. . . . . . . . . . .  M228 292 M339 M351
       92   CORRECT-0V18
       94   CORRECT-14V4
       96   CORRECT-18V0
       93   CORRECT-4V14
       95   CR-18V0
      113   DELETE-COUNTER . . . . . . . .  M217 246 262 264
       68   DOTVALUE . . . . . . . . . . .  M222
      119   DUMMY-HOLD . . . . . . . . . .  M276 282
       50   DUMMY-RECORD . . . . . . . . .  M232 M233 M234 M235 M237 M238 M239 M241 M243 M252 M259 M266 M271 M272 276 M277
                                            278 M279 M280 M281 M282 286 M287 M295 M310
      166   ENDER-DESC . . . . . . . . . .  M254 M265 M270
      114   ERROR-COUNTER. . . . . . . . .  M216 245 255 258
      118   ERROR-HOLD . . . . . . . . . .  M245 M246 M246 M247 250
      164   ERROR-TOTAL. . . . . . . . . .  M256 M258 M263 M264 M268 M269
       53   EXT-DATA-1 . . . . . . . . . .  M320 334 338
       54   EXT-DATA-2 . . . . . . . . . .  M321 346 350
       55   EXT-DATA-3 . . . . . . . . . .  M322 358 362
       56   EXT-DATA-4 . . . . . . . . . .  M323 370 374
       52   EXTERNAL-DATA
       61   FEATURE. . . . . . . . . . . .  M319
      192   HYPHEN-LINE. . . . . . . . . .  239 241 281
      158   ID-AGAIN . . . . . . . . . . .  M204
      191   INF-ANSI-REFERENCE . . . . . .  M293 M296 M309 M311
      186   INFO-TEXT. . . . . . . . . . .  M294
      115   INSPECT-COUNTER. . . . . . . .  M214 245 267 269
       63   P-OR-F . . . . . . . . . . . .  M214 M215 M216 M217 224 M227
       65   PAR-NAME . . . . . . . . . . .  M229 M333 M345 M357 M369
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page    11
0 Defined   Cross-reference of data names   References

0      67   PARDOT-X . . . . . . . . . . .  M221
      116   PASS-COUNTER . . . . . . . . .  M215 247 249
       48   PRINT-FILE . . . . . . . . . .  44 203 209
       49   PRINT-REC. . . . . . . . . . .  M223 M299 M301
       70   RE-MARK. . . . . . . . . . . .  M218 M230 M340 M352 M364 M376
      112   REC-CT . . . . . . . . . . . .  220 222 229 M317 M343 M355 M367
      111   REC-SKL-SUB
      120   RECORD-COUNT . . . . . . . . .  M274 275 M283
       57   SUB
       71   TEST-COMPUTED. . . . . . . . .  299
       86   TEST-CORRECT . . . . . . . . .  301
      139   TEST-ID. . . . . . . . . . . .  M204
       59   TEST-RESULTS . . . . . . . . .  M205 223
      117   TOTAL-ERROR
      188   XXCOMPUTED . . . . . . . . . .  M308
      190   XXCORRECT. . . . . . . . . . .  M308
      183   XXINFO . . . . . . . . . . . .  295 310
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page    12
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

      304   BAIL-OUT . . . . . . . . . . .  P226
      312   BAIL-OUT-EX. . . . . . . . . .  E226 G306
      307   BAIL-OUT-WRITE . . . . . . . .  G305
      288   BLANK-LINE-PRINT
      344   CALL-TEST-01-01-2
      356   CALL-TEST-01-01-3
      368   CALL-TEST-01-01-4
      380   CCVS-EXIT. . . . . . . . . . .  G331
      381   CCVS-999999
      201   CCVS1
      313   CCVS1-EXIT . . . . . . . . . .  G207
      208   CLOSE-FILES. . . . . . . . . .  G382
      236   COLUMN-NAMES-ROUTINE . . . . .  E206
      217   DE-LETE. . . . . . . . . . . .  P329
      240   END-ROUTINE. . . . . . . . . .  P209
      244   END-ROUTINE-1
      253   END-ROUTINE-12
      261   END-ROUTINE-13 . . . . . . . .  E209
      242   END-RTN-EXIT
      328   EXT-DELETE-01-01
      316   EXT-INIT-01
      324   EXT-TEST-01-01-0
      332   EXT-TEST-01-01-1 . . . . . . .  G327
      216   FAIL . . . . . . . . . . . . .  P341 P353 P365 P377
      290   FAIL-ROUTINE . . . . . . . . .  P225
      303   FAIL-ROUTINE-EX. . . . . . . .  E225 G297
      298   FAIL-ROUTINE-WRITE . . . . . .  G291 G292
      231   HEAD-ROUTINE . . . . . . . . .  P206
      214   INSPT
      202   OPEN-FILES
      215   PASS . . . . . . . . . . . . .  P335 P347 P359 P371
      219   PRINT-DETAIL . . . . . . . . .  P330 P336 P342 P348 P354 P360 P366 P372 P378
      315   SECT-IC226A-001
      212   TERMINATE-CALL
      210   TERMINATE-CCVS
      273   WRITE-LINE . . . . . . . . . .  P223 P224 P232 P233 P234 P235 P237 P238 P239 P241 P243 P252 P260 P266 P271 P272
                                            P295 P299 P301 P310
      285   WRT-LN . . . . . . . . . . . .  P279 P280 P281 P284 P289
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page    13
0 Defined   Cross-reference of programs     References

        3   IC226A . . . . . . . . . . . .  383
 EXTERNAL   IC226A-1 . . . . . . . . . . .  325
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A    Date 06/04/2022  Time 11:58:38   Page    14
0LineID  Message code  Message text

     48  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    325  IGYPG0020-W   Name "IC226A-1" was processed as "IC226A01".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program IC226A:
 *    Source records = 383
 *    Data Division statements = 69
 *    Procedure Division statements = 179
 *    Generated COBOL statements = 0
 *    Program complexity factor = 186
0End of compilation 1,  program IC226A,  highest severity 4.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A01  Date 06/04/2022  Time 11:58:38   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000384         038800 IDENTIFICATION DIVISION.                                         IC2264.2
   000385         038900 PROGRAM-ID.                                                      IC2264.2
   000386         039000     IC226A-1.                                                    IC2264.2

 ==000386==> IGYDS0020-W Name "IC226A-1" was processed as "IC226A01".

   000387         039200*                                                              *  IC2264.2
   000388         039300*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2264.2
   000389         039400*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2264.2
   000390         039500*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2264.2
   000391         039600*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2264.2
   000392         039700*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2264.2
   000393         039800*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2264.2
   000394         039900*                                                              *  IC2264.2
   000395         040000*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2264.2
   000396         040100*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2264.2
   000397         040200*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2264.2
   000398         040300*                                                              *  IC2264.2
   000399         040400*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2264.2
   000400         040500*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2264.2
   000401         040600*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2264.2
   000402         040700*                                                              *  IC2264.2
   000403         040800*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2264.2
   000404         040900*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2264.2
   000405         041000*                & INFORMATION TECHNOLOGY                      *  IC2264.2
   000406         041100*          TWO SKYLINE PLACE                                   *  IC2264.2
   000407         041200*          SUITE 1100                                          *  IC2264.2
   000408         041300*          5203 LEESBURG PIKE                                  *  IC2264.2
   000409         041400*          FALLS CHURCH                                        *  IC2264.2
   000410         041500*          VA 22041                                            *  IC2264.2
   000411         041600*          U.S.A.                                              *  IC2264.2
   000412         041700*                                                              *  IC2264.2
   000413         041800*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2264.2
   000414         041900*                                                              *  IC2264.2
   000415         042000*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2264.2
   000416         042100*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2264.2
   000417         042200*          21 RUE BARA                                         *  IC2264.2
   000418         042300*          F-92132 ISSY                                        *  IC2264.2
   000419         042400*          FRANCE                                              *  IC2264.2
   000420         042500*                                                              *  IC2264.2
   000421         042600*                                                              *  IC2264.2
   000422         042700*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2264.2
   000423         042800*               UND DATENVERARBEITUNG MBH)                     *  IC2264.2
   000424         042900*          SCHLOSS BIRLINGHOVEN                                *  IC2264.2
   000425         043000*          POSTFACH 12 40                                      *  IC2264.2
   000426         043100*          D-5205 ST. AUGUSTIN 1                               *  IC2264.2
   000427         043200*          GERMANY FR                                          *  IC2264.2
   000428         043300*                                                              *  IC2264.2
   000429         043400*                                                              *  IC2264.2
   000430         043500*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2264.2
   000431         043600*          OXFORD ROAD                                         *  IC2264.2
   000432         043700*          MANCHESTER                                          *  IC2264.2
   000433         043800*          M1 7ED                                              *  IC2264.2
   000434         043900*          UNITED KINGDOM                                      *  IC2264.2
   000435         044000*                                                              *  IC2264.2
   000436         044100*                                                              *  IC2264.2
   000437         044200*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A01  Date 06/04/2022  Time 11:58:38   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000438         044300*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2264.2
   000439         044400*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2264.2
   000440         044500*                                                              *  IC2264.2
   000441         044700*                                                              *  IC2264.2
   000442         044800*    VALIDATION FOR:-                                          *  IC2264.2
   000443         044900*                                                              *  IC2264.2
   000444         045000*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2264.2
   000445         045100*                                                              *  IC2264.2
   000446         045200*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2264.2
   000447         045300*                                                              *  IC2264.2
   000448         045500*                                                              *  IC2264.2
   000449         045600*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2264.2
   000450         045700*                                                              *  IC2264.2
   000451         045800*        X-14  - SEQUENTIAL MASS STORAGE                       *  IC2264.2
   000452         045900*        X-55  - SYSTEM PRINTER NAME.                          *  IC2264.2
   000453         046000*        X-82  - SOURCE COMPUTER NAME.                         *  IC2264.2
   000454         046100*        X-83  - OBJECT COMPUTER NAME.                         *  IC2264.2
   000455         046200*                                                              *  IC2264.2
   000456         046400*                                                              *  IC2264.2
   000457         046500*    PROGRAM IC226A AND IC226A-1 WILL TEST THE NEW LANGUAGE    *  IC2264.2
   000458         046600*    ELEMENTS FOR THE LEVEL 2 INTER-PROGRAM COMMUNICATION      *  IC2264.2
   000459         046700*    MODULE.                                                   *  IC2264.2
   000460         046800*    THE NEW LANGUAGE ELEMENTS TO BE TESTED WILL BE:           *  IC2264.2
   000461         046900*           THE "EXTERNAL" CLAUSE IN WORKING-STORAGE.          *  IC2264.2
   000462         047000*    THE TWO PROGRAMS WILL BE COMPILED IN THE SAME FLOW        *  IC2264.2
   000463         047100*    (TO TEST THE "END PROGRAM" STATEMENT) AS SHOWN BELOW:     *  IC2264.2
   000464         047200*    IDENTIFICATION DIVISION.                                  *  IC2264.2
   000465         047300*    PROGRAM-ID. IC226A.                                       *  IC2264.2
   000466         047400*              .                                               *  IC2264.2
   000467         047500*              .                                               *  IC2264.2
   000468         047600*              .                                               *  IC2264.2
   000469         047700*    END PROGRAM IC226A.                                       *  IC2264.2
   000470         047800*    PROGRAM-ID. IC226A-1.                                     *  IC2264.2
   000471         047900*              .                                               *  IC2264.2
   000472         048000*              .                                               *  IC2264.2
   000473         048100*              .                                               *  IC2264.2
   000474         048300 ENVIRONMENT DIVISION.                                            IC2264.2
   000475         048400 CONFIGURATION SECTION.                                           IC2264.2
   000476         048500 SOURCE-COMPUTER.                                                 IC2264.2
   000477         048600     XXXXX082.                                                    IC2264.2
   000478         048700 OBJECT-COMPUTER.                                                 IC2264.2
   000479         048800     XXXXX083.                                                    IC2264.2
   000480         048900*INPUT-OUTPUT SECTION.                                            IC2264.2
   000481         049000 DATA DIVISION.                                                   IC2264.2
   000482         049100 FILE SECTION.                                                    IC2264.2
   000483         049200 WORKING-STORAGE SECTION.                                         IC2264.2
   000484         049300 01  EXTERNAL-DATA IS EXTERNAL.                                   IC2264.2
   000485         049400   03        EXT-DATA-1          PIC X(2).                        IC2264.2
   000486         049500   03        EXT-DATA-2          PIC X(6).                        IC2264.2
   000487         049600   03        EXT-DATA-3          PIC 9(8).                        IC2264.2
   000488         049700   03        EXT-DATA-4          PIC 9(4).                        IC2264.2
   000489         049800 PROCEDURE DIVISION.                                              IC2264.2
   000490         049900 SECT-IC226A-1-001 SECTION.                                       IC2264.2
   000491         050000 EXT-TEST-001.                                                    IC2264.2
   000492         050100     MOVE   "ZZ"      TO EXT-DATA-1.                              IC2264.2 485
   000493         050200     MOVE   "CHANGE"  TO EXT-DATA-2.                              IC2264.2 486
   000494         050300     MOVE    87654321 TO EXT-DATA-3.                              IC2264.2 487
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A01  Date 06/04/2022  Time 11:58:38   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000495         050400     ADD     10       TO EXT-DATA-4.                              IC2264.2 488
   000496         050500 EXT-EXIT-001.                                                    IC2264.2
   000497         050600     EXIT PROGRAM.                                                IC2264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A01  Date 06/04/2022  Time 11:58:38   Page    18
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      485   EXT-DATA-1 . . . . . . . . . .  M492
      486   EXT-DATA-2 . . . . . . . . . .  M493
      487   EXT-DATA-3 . . . . . . . . . .  M494
      488   EXT-DATA-4 . . . . . . . . . .  M495
      484   EXTERNAL-DATA
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A01  Date 06/04/2022  Time 11:58:38   Page    19
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

      496   EXT-EXIT-001
      491   EXT-TEST-001
      490   SECT-IC226A-1-001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A01  Date 06/04/2022  Time 11:58:38   Page    20
0 Defined   Cross-reference of programs     References

      386   IC226A01
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC226A01  Date 06/04/2022  Time 11:58:38   Page    21
0LineID  Message code  Message text

    386  IGYDS0020-W   Name "IC226A-1" was processed as "IC226A01".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1                          1
-* Statistics for COBOL program IC226A01:
 *    Source records = 114
 *    Data Division statements = 5
 *    Procedure Division statements = 5
 *    Generated COBOL statements = 0
 *    Program complexity factor = 5
0End of compilation 2,  program IC226A01,  highest severity 4.
0Return code 4
