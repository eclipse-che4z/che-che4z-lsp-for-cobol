1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:39   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:39   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC113M    Date 06/04/2022  Time 11:56:39   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100    IDENTIFICATION DIVISION.                                      NC1134.2
   000002         000200    PROGRAM-ID.                                                   NC1134.2
   000003         000300     NC113M.                                                      NC1134.2
   000004         000500*                                                              *  NC1134.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1134.2
   000006         000700*                                                              *  NC1134.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1134.2
   000008         000900*                                                              *  NC1134.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1134.2
   000010         001100*                                                              *  NC1134.2
   000011         001300*                                                              *  NC1134.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1134.2
   000013         001500*                                                              *  NC1134.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1134.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1134.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1134.2
   000017         001900*                                                              *  NC1134.2
   000018         002100*                                                                 NC1134.2
   000019         002200*   PROGRAM NC113M VERIFIES CORRECT USE OF AREA A WITHIN          NC1134.2
   000020         002300*                      A PROGRAM.                                 NC1134.2
   000021         002400*                                                                 NC1134.2
   000022         002500*                                                                 NC1134.2
   000023         002600    ENVIRONMENT DIVISION.                                         NC1134.2
   000024         002700    CONFIGURATION SECTION.                                        NC1134.2
   000025         002800    SOURCE-COMPUTER.                                              NC1134.2
   000026         002900     XXXXX082.                                                    NC1134.2
   000027         003000    OBJECT-COMPUTER.                                              NC1134.2
   000028         003100     XXXXX083.                                                    NC1134.2
   000029         003200    INPUT-OUTPUT SECTION.                                         NC1134.2
   000030         003300    FILE-CONTROL.                                                 NC1134.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1134.2 36
   000032         003500     XXXXX055.                                                    NC1134.2
   000033         003600    DATA                                                          NC1134.2
   000034         003700     DIVISION.                                                    NC1134.2
   000035         003800    FILE SECTION.                                                 NC1134.2
   000036         003900    FD PRINT-FILE.                                                NC1134.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000    01 PRINT-REC PICTURE X(120).                                  NC1134.2
   000038         004100    01  DUMMY-RECORD PICTURE X(120).                              NC1134.2
   000039         004200 WORKING-STORAGE SECTION.                                         NC1134.2
   000040         004300    77  ERROR-COUNTER PICTURE IS 999 VALUE IS ZERO.               NC1134.2 IMP
   000041         004400    77  DELETE-CNT                PICTURE 999  VALUE ZERO.        NC1134.2 IMP
   000042         004500    01  TEST-RESULTS.                                             NC1134.2
   000043         004600    02 FILLER                     PICTURE X VALUE SPACE.          NC1134.2 IMP
   000044         004700  02  FEATURE                PICTURE X(20).                       NC1134.2
   000045         004800  02 FILLER                       PICTURE X VALUE SPACE.          NC1134.2 IMP
   000046         004900  02  P-OR-F                      PICTURE XXXXX.                  NC1134.2
   000047         005000   02 FILLER                      PICTURE X  VALUE SPACE.         NC1134.2 IMP
   000048         005100    02 PAR-NAME                   PICTURE X(19).                  NC1134.2
   000049         005200   02 FILLER                      PICTURE X VALUE SPACE.          NC1134.2 IMP
   000050         005300  02 COMPUTED-A                   PICTURE X(20).                  NC1134.2
   000051         005400   02 COMPUTED-N REDEFINES COMPUTED-A PICTURE -9(9).9(9).         NC1134.2 50
   000052         005500     02 FILLER                    PICTURE XX VALUE SPACE.         NC1134.2 IMP
   000053         005600     02 CORRECT-A                 PICTURE X(20).                  NC1134.2
   000054         005700  02 CORRECT-N REDEFINES CORRECT-A PICTURE -9(9).9(9).            NC1134.2 53
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC113M    Date 06/04/2022  Time 11:56:39   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800       02 FILLER                  PICTURE XX VALUE SPACE.         NC1134.2 IMP
   000056         005900  02 RE-MARK                      PICTURE X(27).                  NC1134.2
   000057         006000   01  HEADER-LINE-1.                                             NC1134.2
   000058         006100       02  PAGE-CONTROL-4 PICTURE IS X   VALUE IS "1".            NC1134.2
   000059         006200       02  FILLER         PICTURE X(42)  VALUE                    NC1134.2
   000060         006300     SPACE.                                                       NC1134.2 IMP
   000061         006400 02 FILLER PICTURE X(42) VALUE                                    NC1134.2
   000062         006500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM ".                NC1134.2
   000063         006600 02 FILLER                        PICTURE X(35)  VALUE            NC1134.2
   000064         006700     SPACE.                                                       NC1134.2 IMP
   000065         006800    01 HEADER-LINE-2.                                             NC1134.2
   000066         006900  02 FILLER PICTURE IS X(52) VALUE IS SPACE.                      NC1134.2 IMP
   000067         007000   02 FILLER PICTURE IS X(19) VALUE IS "TEST RESULTS SET-  ".     NC1134.2
   000068         007100    02 TEST-ID PICTURE IS X(9).                                   NC1134.2
   000069         007200   02 FILLER PICTURE IS X(40) VALUE IS SPACE.                     NC1134.2 IMP
   000070         007300   01 HEADER-LINE-3.                                              NC1134.2
   000071         007400  02 FILLER PICTURE X(34) VALUE                                   NC1134.2
   000072         007500     " FOR OFFICIAL USE ONLY    ".                                NC1134.2
   000073         007600     02  FILLER PICTURE X(58) VALUE                               NC1134.2
   000074         007700     "                                                         ". NC1134.2
   000075         007800       02 FILLER PICTURE X(28) VALUE                              NC1134.2
   000076         007900     "          COPYRIGHT 1985    ".                              NC1134.2
   000077         008000    01  COLUMNS-LINE-1.                                           NC1134.2
   000078         008100  02 PAGE-CONTROL-C PICTURE IS X VALUE IS SPACE.                  NC1134.2 IMP
   000079         008200  02  FILLER   PICTURE IS X(99) VALUE IS "FEATURE              PASNC1134.2
   000080         008300-    "S  PARAGRAPH NAME                                           NC1134.2
   000081         008400-    "        REMARKS".                                           NC1134.2
   000082         008500  02 FILLER PICTURE IS X(20) VALUE IS SPACE.                      NC1134.2 IMP
   000083         008600   01  COLUMNS-LINE-2.                                            NC1134.2
   000084         008700   02 FILLER PICTURE IS X VALUE IS SPACE.                         NC1134.2 IMP
   000085         008800   02 FILLER PICTURE IS X(6) VALUE IS "TESTED".                   NC1134.2
   000086         008900   02 FILLER PICTURE IS X(15) VALUE IS SPACE.                     NC1134.2 IMP
   000087         009000   02 FILLER PICTURE IS X(4) VALUE IS "FAIL".                     NC1134.2
   000088         009100   02 FILLER PICTURE IS X(94) VALUE IS SPACE.                     NC1134.2 IMP
   000089         009200    01        ENDER-LINE-1.                                       NC1134.2
   000090         009300    02      FILLER PICTURE IS X(52) VALUE IS SPACE.               NC1134.2 IMP
   000091         009400    02        FILLER PICTURE IS X(14) VALUE IS "END OF TEST-  ".  NC1134.2
   000092         009500    02         ID-AGAIN   PICTURE IS X(9).                        NC1134.2
   000093         009600    02         FILLER PICTURE IS X(45) VALUE IS SPACE.            NC1134.2 IMP
   000094         009700  01 ENDER-LINE-2.                                                NC1134.2
   000095         009800  02 FILLER                       PICTURE X(31)  VALUE            NC1134.2
   000096         009900     SPACE.                                                       NC1134.2 IMP
   000097         010000  02 FILLER     PICTURE     X(21)    VALUE   IS   SPACE.          NC1134.2 IMP
   000098         010100   02 ERROR-TOTAL PICTURE IS         XXX     VALUE IS SPACE.      NC1134.2 IMP
   000099         010200  02 FILLER PICTURE IS X VALUE IS SPACE.                          NC1134.2 IMP
   000100         010300    02      ENDER-DESC           PICTURE X(31) VALUE IS "ERRORS ENNC1134.2
   000101         010400-    "COUNTERED".                                                 NC1134.2
   000102         010500     02 FILLER PICTURE IS X(33) VALUE IS SPACE.                   NC1134.2 IMP
   000103         010600    01 ENDER-LINE-3.                                              NC1134.2
   000104         010700   02 FILLER PICTURE X(22) VALUE                                  NC1134.2
   000105         010800     " FOR OFFICIAL USE ONLY".                                    NC1134.2
   000106         010900  02 FILLER PICTURE X(12) VALUE SPACE.                            NC1134.2 IMP
   000107         011000   02 FILLER PICTURE X(58) VALUE SPACE.                           NC1134.2 IMP
   000108         011100    02 FILLER PICTURE X(13) VALUE SPACE.                          NC1134.2 IMP
   000109         011200     02  FILLER PICTURE X(15) VALUE " COPYRIGHT 1985".            NC1134.2
   000110         011300  01  HYPHEN-LINE.                                                NC1134.2
   000111         011400     02 FILLER PICTURE IS X VALUE IS SPACE.                       NC1134.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC113M    Date 06/04/2022  Time 11:56:39   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 FILLER PICTURE IS X(65) VALUE IS "------------------------NC1134.2
   000113         011600-    "-----------------------------------------".                 NC1134.2
   000114         011700     02 FILLER PICTURE IS X(54) VALUE IS "------------------------NC1134.2
   000115         011800-    "------------------------------".                            NC1134.2
   000116         011900    PROCEDURE                                                     NC1134.2
   000117         012000      DIVISION                                                    NC1134.2
   000118         012100               .                                                  NC1134.2
   000119         012200    OPEN-FILES.                                                   NC1134.2
   000120         012300     OPEN     OUTPUT PRINT-FILE.                                  NC1134.2 36
   000121         012400     MOVE "  NC113M" TO TEST-ID.                                  NC1134.2 68
   000122         012500     MOVE     TEST-ID TO ID-AGAIN.                                NC1134.2 68 92
   000123         012600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1134.2 214 225
   000124         012700     MOVE     SPACE TO TEST-RESULTS.                              NC1134.2 IMP 42
   000125         012800     MOVE "MARGIN TESTING" TO FEATURE.                            NC1134.2 44
   000126         012900     PERFORM MAR-TEST-1.                                          NC1134.2 154
   000127         013000    MAR-TEST-2.                                                   NC1134.2
   000128         013100     MOVE "VISUALLY CHECKED" TO RE-MARK.                          NC1134.2 56
   000129         013200     MOVE "MAR-TEST-2"     TO PAR-NAME.                           NC1134.2 48
   000130         013300     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000131         013400     GO TO  MAR-TEST-3.                                           NC1134.2 167
   000132         013500    MAR-TEST-15.                                                  NC1134.2
   000133         013600     MOVE "MAR-TEST-15"    TO PAR-NAME.                           NC1134.2 48
   000134         013700     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000135         013800    MAR-TEST-7.                                                   NC1134.2
   000136         013900     MOVE "MAR-TEST-7"     TO PAR-NAME.                           NC1134.2 48
   000137         014000     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000138         014100*    GO TO MAR-TEST-8.                                            NC1134.2
   000139         014200    MAR-TEST-12.                                                  NC1134.2
   000140         014300     MOVE "MAR-TEST-12"    TO PAR-NAME.                           NC1134.2 48
   000141         014400     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000142         014500     GO TO MAR-TEST-13.                                           NC1134.2 163
   000143         014600    MAR-TEST-4.                                                   NC1134.2
   000144         014700     MOVE "MAR-TEST-4"     TO PAR-NAME.                           NC1134.2 48
   000145         014800     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000146         014900  MAR-TEST-9.                                                     NC1134.2
   000147         015000     MOVE "MAR-TEST-9"     TO PAR-NAME.                           NC1134.2 48
   000148         015100     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000149         015200 MAR-TEST-8.                                                      NC1134.2
   000150         015300     MOVE "MAR-TEST-8"     TO PAR-NAME.                           NC1134.2 48
   000151         015400     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000152         015500     PERFORM MAR-TEST-9.                                          NC1134.2 146
   000153         015600     GO TO MAR-TEST-10.                                           NC1134.2 182
   000154         015700    MAR-TEST-1.                                                   NC1134.2
   000155         015800     MOVE "ANSWERS MUST BE"  TO RE-MARK.                          NC1134.2 56
   000156         015900     MOVE "MAR-TEST-1"     TO PAR-NAME.                           NC1134.2 48
   000157         016000     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000158         016100    MAR-TEST-5.                                                   NC1134.2
   000159         016200     MOVE "TESTS MUST BE SEQUENTIAL" TO RE-MARK.                  NC1134.2 56
   000160         016300     MOVE "MAR-TEST-5"     TO PAR-NAME.                           NC1134.2 48
   000161         016400     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000162         016500     GO TO   MAR-TEST-6.                                          NC1134.2 186
   000163         016600    MAR-TEST-13.                                                  NC1134.2
   000164         016700     MOVE "MAR-TEST-13"    TO PAR-NAME.                           NC1134.2 48
   000165         016800     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000166         016900     GO TO MAR-TEST-14.                                           NC1134.2 173
   000167         017000    MAR-TEST-3.                                                   NC1134.2
   000168         017100     MOVE "FOR CORRECTNESS"  TO RE-MARK.                          NC1134.2 56
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC113M    Date 06/04/2022  Time 11:56:39   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     MOVE "MAR-TEST-3"     TO PAR-NAME.                           NC1134.2 48
   000170         017300     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000171         017400     PERFORM MAR-TEST-4.                                          NC1134.2 143
   000172         017500     GO TO MAR-TEST-5.                                            NC1134.2 158
   000173         017600    MAR-TEST-14.                                                  NC1134.2
   000174         017700     MOVE "MAR-TEST-14"    TO PAR-NAME.                           NC1134.2 48
   000175         017800     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000176         017900     PERFORM MAR-TEST-15.                                         NC1134.2 132
   000177         018000     GO TO CLOSE-FILES.                                           NC1134.2 191
   000178         018100    MAR-TEST-11.                                                  NC1134.2
   000179         018200     MOVE "MAR-TEST-11"    TO PAR-NAME.                           NC1134.2 48
   000180         018300     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000181         018400     GO TO MAR-TEST-12.                                           NC1134.2 139
   000182         018500   MAR-TEST-10.                                                   NC1134.2
   000183         018600     MOVE "MAR-TEST-10"    TO PAR-NAME.                           NC1134.2 48
   000184         018700     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000185         018800     GO TO MAR-TEST-11.                                           NC1134.2 178
   000186         018900    MAR-TEST-6.                                                   NC1134.2
   000187         019000     MOVE "MAR-TEST-6"     TO PAR-NAME.                           NC1134.2 48
   000188         019100     PERFORM PRINT-DETAIL.                                        NC1134.2 206
   000189         019200     PERFORM MAR-TEST-7.                                          NC1134.2 135
   000190         019300     GO TO MAR-TEST-8.                                            NC1134.2 149
   000191         019400    CLOSE-FILES.                                                  NC1134.2
   000192         019500     PERFORM END-ROUTINE THRU END-ROUTINE-3.                      NC1134.2 234 246
   000193         019600     CLOSE    PRINT-FILE.                                         NC1134.2 36
   000194         019700     STOP     RUN.                                                NC1134.2
   000195         019800    PASS.                                                         NC1134.2
   000196         019900     MOVE "PASS" TO P-OR-F.                                       NC1134.2 46
   000197         020000    FAIL.                                                         NC1134.2
   000198         020100     ADD      1 TO ERROR-COUNTER.                                 NC1134.2 40
   000199         020200     MOVE "FAIL*" TO P-OR-F.                                      NC1134.2 46
   000200         020300    DE-LETE.                                                      NC1134.2
   000201         020400     MOVE     SPACE TO P-OR-F.                                    NC1134.2 IMP 46
   000202         020500     MOVE     "    ************    " TO COMPUTED-A.               NC1134.2 50
   000203         020600     MOVE     "    ************    " TO CORRECT-A.                NC1134.2 53
   000204         020700     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1134.2 56
   000205         020800     ADD 1 TO DELETE-CNT.                                         NC1134.2 41
   000206         020900    PRINT-DETAIL.                                                 NC1134.2
   000207         021000     MOVE     TEST-RESULTS TO PRINT-REC.                          NC1134.2 42 37
   000208         021100     WRITE    PRINT-REC                             AFTER 1.      NC1134.2 37
   000209         021200     MOVE     SPACE TO P-OR-F.                                    NC1134.2 IMP 46
   000210         021300     MOVE     SPACE TO PAR-NAME.                                  NC1134.2 IMP 48
   000211         021400     MOVE     SPACE TO COMPUTED-A.                                NC1134.2 IMP 50
   000212         021500     MOVE SPACE TO CORRECT-A.                                     NC1134.2 IMP 53
   000213         021600     MOVE     SPACE TO RE-MARK.                                   NC1134.2 IMP 56
   000214         021700    HEAD-ROUTINE.                                                 NC1134.2
   000215         021800     PERFORM  BLANK-LINE-PRINT 15 TIMES.                          NC1134.2 257
   000216         021900     MOVE     HEADER-LINE-1 TO DUMMY-RECORD.                      NC1134.2 57 38
   000217         022000     WRITE    DUMMY-RECORD                          AFTER 1.      NC1134.2 38
   000218         022100     PERFORM  BLANK-LINE-PRINT.                                   NC1134.2 257
   000219         022200     MOVE     HEADER-LINE-2 TO DUMMY-RECORD.                      NC1134.2 65 38
   000220         022300     WRITE    DUMMY-RECORD                          AFTER 1.      NC1134.2 38
   000221         022400     PERFORM  BLANK-LINE-PRINT 4 TIMES.                           NC1134.2 257
   000222         022500     MOVE HEADER-LINE-3 TO DUMMY-RECORD.                          NC1134.2 70 38
   000223         022600     WRITE DUMMY-RECORD                             AFTER 1.      NC1134.2 38
   000224         022700     PERFORM BLANK-LINE-PRINT 2 TIMES.                            NC1134.2 257
   000225         022800    COLUMN-NAMES-ROUTINE.                                         NC1134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC113M    Date 06/04/2022  Time 11:56:39   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     MOVE     COLUMNS-LINE-1 TO DUMMY-RECORD.                     NC1134.2 77 38
   000227         023000     WRITE    DUMMY-RECORD                          AFTER 1.      NC1134.2 38
   000228         023100     MOVE     SPACE TO PAGE-CONTROL-C.                            NC1134.2 IMP 78
   000229         023200     MOVE     COLUMNS-LINE-2 TO DUMMY-RECORD.                     NC1134.2 83 38
   000230         023300     WRITE    DUMMY-RECORD                          AFTER 1.      NC1134.2 38
   000231         023400     PERFORM  BLANK-LINE-PRINT.                                   NC1134.2 257
   000232         023500     MOVE     HYPHEN-LINE TO DUMMY-RECORD.                        NC1134.2 110 38
   000233         023600     WRITE    DUMMY-RECORD                          AFTER 1.      NC1134.2 38
   000234         023700    END-ROUTINE.                                                  NC1134.2
   000235         023800     MOVE     HYPHEN-LINE TO DUMMY-RECORD.                        NC1134.2 110 38
   000236         023900     WRITE    DUMMY-RECORD                          AFTER 1.      NC1134.2 38
   000237         024000    PARA-Z.                                                       NC1134.2
   000238         024100     PERFORM  BLANK-LINE-PRINT 4 TIMES.                           NC1134.2 257
   000239         024200     MOVE     ENDER-LINE-1 TO DUMMY-RECORD.                       NC1134.2 89 38
   000240         024300     WRITE    DUMMY-RECORD                          AFTER 1.      NC1134.2 38
   000241         024400    END-ROUTINE-1.                                                NC1134.2
   000242         024500     PERFORM  BLANK-LINE-PRINT.                                   NC1134.2 257
   000243         024600     MOVE   "TESTS REQUIRE VISUAL INSPECTION" TO ENDER-DESC.      NC1134.2 100
   000244         024700    END-ROUTINE-2.                                                NC1134.2
   000245         024800     MOVE " 15" TO ERROR-TOTAL.                                   NC1134.2 98
   000246         024900    END-ROUTINE-3.                                                NC1134.2
   000247         025000     MOVE     ENDER-LINE-2 TO DUMMY-RECORD.                       NC1134.2 94 38
   000248         025100     WRITE    DUMMY-RECORD                          AFTER 1.      NC1134.2 38
   000249         025200     IF DELETE-CNT IS EQUAL TO ZERO                               NC1134.2 41 IMP
   000250      1  025300         MOVE " NO" TO ERROR-TOTAL  ELSE                          NC1134.2 98
   000251      1  025400     MOVE DELETE-CNT TO ERROR-TOTAL.                              NC1134.2 41 98
   000252         025500     MOVE "TESTS DELETED     " TO ENDER-DESC.                     NC1134.2 100
   000253         025600     MOVE ENDER-LINE-2 TO DUMMY-RECORD.                           NC1134.2 94 38
   000254         025700     WRITE DUMMY-RECORD                             AFTER 1.      NC1134.2 38
   000255         025800     MOVE ENDER-LINE-3 TO DUMMY-RECORD.                           NC1134.2 103 38
   000256         025900     WRITE DUMMY-RECORD                             AFTER 1.      NC1134.2 38
   000257         026000    BLANK-LINE-PRINT.                                             NC1134.2
   000258         026100     MOVE     SPACE TO DUMMY-RECORD.                              NC1134.2 IMP 38
   000259         026200     WRITE    DUMMY-RECORD                          AFTER 1.      NC1134.2 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC113M    Date 06/04/2022  Time 11:56:39   Page     8
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       77   COLUMNS-LINE-1 . . . . . . . .  226
       83   COLUMNS-LINE-2 . . . . . . . .  229
       50   COMPUTED-A . . . . . . . . . .  51 M202 M211
       51   COMPUTED-N
       53   CORRECT-A. . . . . . . . . . .  54 M203 M212
       54   CORRECT-N
       41   DELETE-CNT . . . . . . . . . .  M205 249 251
       38   DUMMY-RECORD . . . . . . . . .  M216 217 M219 220 M222 223 M226 227 M229 230 M232 233 M235 236 M239 240 M247
                                            248 M253 254 M255 256 M258 259
      100   ENDER-DESC . . . . . . . . . .  M243 M252
       89   ENDER-LINE-1 . . . . . . . . .  239
       94   ENDER-LINE-2 . . . . . . . . .  247 253
      103   ENDER-LINE-3 . . . . . . . . .  255
       40   ERROR-COUNTER. . . . . . . . .  M198
       98   ERROR-TOTAL. . . . . . . . . .  M245 M250 M251
       44   FEATURE. . . . . . . . . . . .  M125
       57   HEADER-LINE-1. . . . . . . . .  216
       65   HEADER-LINE-2. . . . . . . . .  219
       70   HEADER-LINE-3. . . . . . . . .  222
      110   HYPHEN-LINE. . . . . . . . . .  232 235
       92   ID-AGAIN . . . . . . . . . . .  M122
       46   P-OR-F . . . . . . . . . . . .  M196 M199 M201 M209
       78   PAGE-CONTROL-C . . . . . . . .  M228
       58   PAGE-CONTROL-4
       48   PAR-NAME . . . . . . . . . . .  M129 M133 M136 M140 M144 M147 M150 M156 M160 M164 M169 M174 M179 M183 M187 M210
       36   PRINT-FILE . . . . . . . . . .  31 120 193
       37   PRINT-REC. . . . . . . . . . .  M207 208
       56   RE-MARK. . . . . . . . . . . .  M128 M155 M159 M168 M204 M213
       68   TEST-ID. . . . . . . . . . . .  M121 122
       42   TEST-RESULTS . . . . . . . . .  M124 207
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC113M    Date 06/04/2022  Time 11:56:39   Page     9
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

      257   BLANK-LINE-PRINT . . . . . . .  P215 P218 P221 P224 P231 P238 P242
      191   CLOSE-FILES. . . . . . . . . .  G177
      225   COLUMN-NAMES-ROUTINE . . . . .  E123
      200   DE-LETE
      234   END-ROUTINE. . . . . . . . . .  P192
      241   END-ROUTINE-1
      244   END-ROUTINE-2
      246   END-ROUTINE-3. . . . . . . . .  E192
      197   FAIL
      214   HEAD-ROUTINE . . . . . . . . .  P123
      154   MAR-TEST-1 . . . . . . . . . .  P126
      182   MAR-TEST-10. . . . . . . . . .  G153
      178   MAR-TEST-11. . . . . . . . . .  G185
      139   MAR-TEST-12. . . . . . . . . .  G181
      163   MAR-TEST-13. . . . . . . . . .  G142
      173   MAR-TEST-14. . . . . . . . . .  G166
      132   MAR-TEST-15. . . . . . . . . .  P176
      127   MAR-TEST-2
      167   MAR-TEST-3 . . . . . . . . . .  G131
      143   MAR-TEST-4 . . . . . . . . . .  P171
      158   MAR-TEST-5 . . . . . . . . . .  G172
      186   MAR-TEST-6 . . . . . . . . . .  G162
      135   MAR-TEST-7 . . . . . . . . . .  P189
      149   MAR-TEST-8 . . . . . . . . . .  G190
      146   MAR-TEST-9 . . . . . . . . . .  P152
      119   OPEN-FILES
      237   PARA-Z
      195   PASS
      206   PRINT-DETAIL . . . . . . . . .  P130 P134 P137 P141 P145 P148 P151 P157 P161 P165 P170 P175 P180 P184 P188
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC113M    Date 06/04/2022  Time 11:56:39   Page    10
0 Defined   Cross-reference of programs     References

        3   NC113M
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC113M    Date 06/04/2022  Time 11:56:39   Page    11
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC113M:
 *    Source records = 259
 *    Data Division statements = 28
 *    Procedure Division statements = 111
 *    Generated COBOL statements = 0
 *    Program complexity factor = 112
0End of compilation 1,  program NC113M,  highest severity 0.
0Return code 0
