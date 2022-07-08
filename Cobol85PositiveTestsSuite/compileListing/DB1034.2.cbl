1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:39   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:39   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         DB1034.2
   000002         000200 PROGRAM-ID.                                                      DB1034.2
   000003         000300     DB103M.                                                      DB1034.2
   000004         000400 AUTHOR.                                                          DB1034.2
   000005         000500     FEDERAL COMPILER TESTING CENTER.                             DB1034.2
   000006         000600 INSTALLATION.                                                    DB1034.2
   000007         000700     GENERAL SERVICES ADMINISTRATION                              DB1034.2
   000008         000800     AUTOMATED DATA AND TELECOMMUNICATION SERVICE.                DB1034.2
   000009         000900     SOFTWARE DEVELOPMENT OFFICE.                                 DB1034.2
   000010         001000     5203 LEESBURG PIKE  SUITE 1100                               DB1034.2
   000011         001100     FALLS CHURCH VIRGINIA 22041.                                 DB1034.2
   000012         001200                                                                  DB1034.2
   000013         001300     PHONE   (703) 756-6153                                       DB1034.2
   000014         001400                                                                  DB1034.2
   000015         001500     " HIGH       ".                                              DB1034.2
   000016         001600 DATE-WRITTEN.                                                    DB1034.2
   000017         001700     CCVS-74 VERSION 4.0 - 1980 JULY 1.                           DB1034.2
   000018         001800     CREATION DATE     /    VALIDATION DATE                       DB1034.2
   000019         001900     "4.2 ".                                                      DB1034.2
   000020         002000 SECURITY.                                                        DB1034.2
   000021         002100     NONE.                                                        DB1034.2
   000022         002200*                                                                 DB1034.2
   000023         002300*    *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *DB1034.2
   000024         002400*                                                                 DB1034.2
   000025         002500*                       PROGRAM ABSTRACT                          DB1034.2
   000026         002600*                                                                 DB1034.2
   000027         002700*    DB103M TESTS THE BASIC OPERATION OF DEBUG MODULE FACILITIES  DB1034.2
   000028         002800*    WHEN THE COMPILE TIME DEBUGGING SWITCH IS OFF.  ALL DEBUG    DB1034.2
   000029         002900*    LINES  SHOULD BE TREATED AS COMMENTS AND NO CODE SHOULD      DB1034.2
   000030         003000*    BE GENERATED FOR EITHER DEBUG LINES OR DEBUGGING PROCED-     DB1034.2
   000031         003100*    URES.                                                        DB1034.2
   000032         003200*                                                                 DB1034.2
   000033         003300*    THE OBJECT PROGRAM FOR DB103M SHOULD BE EXECUTED TWICE;ONCE  DB1034.2
   000034         003400*    WITH THE OBJECT TIME DEBUGGING SWITCH ENABLED (ON), AND ONCE DB1034.2
   000035         003500*    WITH THE OBJECT TIME DEBUGGING SWITCH DISABLED (OFF).  BOTH  DB1034.2
   000036         003600*    EXECUTION RUNS SHOULD YIELD THE SAME RESULTS AS THE SETTING  DB1034.2
   000037         003700*    OF THE OBJECT TIME DEBUGGING SWITCH SHOULD MAKE NO DIFFER-   DB1034.2
   000038         003800*    ENCE SINCE THE COMPILE TIME DEBUGGING SWITCH WAS INITIALLY   DB1034.2
   000039         003900*    DISABLED.                                                    DB1034.2
   000040         004000*                                                                 DB1034.2
   000041         004100*                                                                 DB1034.2
   000042         004200 ENVIRONMENT DIVISION.                                            DB1034.2
   000043         004300 CONFIGURATION SECTION.                                           DB1034.2
   000044         004400 SOURCE-COMPUTER.                                                 DB1034.2
   000045         004500     XXXXX082.                                                    DB1034.2
   000046         004600 OBJECT-COMPUTER.                                                 DB1034.2
   000047         004700     XXXXX083.                                                    DB1034.2
   000048         004800 INPUT-OUTPUT SECTION.                                            DB1034.2
   000049         004900 FILE-CONTROL.                                                    DB1034.2
   000050         005000     SELECT PRINT-FILE ASSIGN TO                                  DB1034.2 54
   000051         005100     XXXXX055.                                                    DB1034.2
   000052         005200 DATA DIVISION.                                                   DB1034.2
   000053         005300 FILE SECTION.                                                    DB1034.2
   000054         005400 FD  PRINT-FILE                                                   DB1034.2

 ==000054==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005500     LABEL RECORDS                                                DB1034.2
   000056         005600     XXXXX084                                                     DB1034.2 UND

 ==000056==> IGYGR1174-S "XXXXX084" was not defined as a data-name.  "XXXXX084" was discarded.

   000057         005700     DATA RECORD IS PRINT-REC DUMMY-RECORD.                       DB1034.2 * *
   000058         005800 01  PRINT-REC PICTURE X(120).                                    DB1034.2
   000059         005900 01  DUMMY-RECORD PICTURE X(120).                                 DB1034.2
   000060         006000 WORKING-STORAGE SECTION.                                         DB1034.2
   000061         006100 77  A PIC 9 COMP VALUE 1.                                        DB1034.2
   000062         006200 77  B PIC 9 COMP VALUE 5.                                        DB1034.2
   000063         006300 77  C PIC 9 COMP VALUE 9.                                        DB1034.2
   000064         006400 77  D PIC 99 COMP.                                               DB1034.2
   000065         006500 77  RESULT-FLAG PIC 99 COMP VALUE 0.                             DB1034.2
   000066         006600 77  DBLINE-HOLD PIC X(6).                                        DB1034.2
   000067         006700 77  DBNAME-HOLD PIC X(30).                                       DB1034.2
   000068         006800 77  DBCONT-HOLD PIC X(30).                                       DB1034.2
   000069         006900 77  FIVE PIC 9 COMP VALUE 5.                                     DB1034.2
   000070         007000 01  SIZE-19.                                                     DB1034.2
   000071         007100     02  FILLER PIC X.                                            DB1034.2
   000072         007200     02  SIZE-18.                                                 DB1034.2
   000073         007300         03  FILLER PIC X.                                        DB1034.2
   000074         007400         03  SIZE-17.                                             DB1034.2
   000075         007500             04  FILLER PIC X.                                    DB1034.2
   000076         007600             04  SIZE-16.                                         DB1034.2
   000077         007700                 05  FILLER PIC X.                                DB1034.2
   000078         007800                 05  SIZE-15.                                     DB1034.2
   000079         007900                     06  FILLER PIC X.                            DB1034.2
   000080         008000                     06  SIZE-14.                                 DB1034.2
   000081         008100                         07  FILLER PIC X.                        DB1034.2
   000082         008200                         07  SIZE-13.                             DB1034.2
   000083         008300                             08  FILLER PIC X.                    DB1034.2
   000084         008400                             08  SIZE-12.                         DB1034.2
   000085         008500                                 09  FILLER PIC X.                DB1034.2
   000086         008600                                 09  SIZE-11.                     DB1034.2
   000087         008700                                     10  FILLER PIC X.            DB1034.2
   000088         008800                                     10  SIZE-10 PIC X(10).       DB1034.2
   000089         008900 01  TEST-RESULTS.                                                DB1034.2
   000090         009000     02 FILLER                    PICTURE X VALUE SPACE.          DB1034.2 IMP
   000091         009100     02 FEATURE                   PICTURE X(20) VALUE SPACE.      DB1034.2 IMP
   000092         009200     02 FILLER                    PICTURE X VALUE SPACE.          DB1034.2 IMP
   000093         009300     02 P-OR-F                    PICTURE X(5) VALUE SPACE.       DB1034.2 IMP
   000094         009400     02 FILLER                    PICTURE X  VALUE SPACE.         DB1034.2 IMP
   000095         009500     02  PAR-NAME.                                                DB1034.2
   000096         009600       03 FILLER PICTURE X(12) VALUE SPACE.                       DB1034.2 IMP
   000097         009700       03  PARDOT-X PICTURE X  VALUE SPACE.                       DB1034.2 IMP
   000098         009800       03 DOTVALUE PICTURE 99  VALUE ZERO.                        DB1034.2 IMP
   000099         009900       03 FILLER PIC X(5) VALUE SPACE.                            DB1034.2 IMP
   000100         010000     02 FILLER PIC X(10) VALUE SPACE.                             DB1034.2 IMP
   000101         010100     02 RE-MARK PIC X(61).                                        DB1034.2
   000102         010200 01  TEST-COMPUTED.                                               DB1034.2
   000103         010300     02 FILLER PIC X(30) VALUE SPACE.                             DB1034.2 IMP
   000104         010400     02 FILLER PIC X(17) VALUE "       COMPUTED=".                DB1034.2
   000105         010500     02 COMPUTED-X.                                               DB1034.2
   000106         010600     03 COMPUTED-A                PICTURE X(20) VALUE SPACE.      DB1034.2 IMP
   000107         010700     03 COMPUTED-N REDEFINES COMPUTED-A PICTURE -9(9).9(9).       DB1034.2 106
   000108         010800     03 COMPUTED-0V18 REDEFINES COMPUTED-A  PICTURE -.9(18).      DB1034.2 106
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000109         010900     03 COMPUTED-4V14 REDEFINES COMPUTED-A  PICTURE -9(4).9(14).  DB1034.2 106
   000110         011000     03 COMPUTED-14V4 REDEFINES COMPUTED-A  PICTURE -9(14).9(4).  DB1034.2 106
   000111         011100     03       CM-18V0 REDEFINES COMPUTED-A.                       DB1034.2 106
   000112         011200         04 COMPUTED-18V0                   PICTURE -9(18).       DB1034.2
   000113         011300         04 FILLER                          PICTURE X.            DB1034.2
   000114         011400     03 FILLER PIC X(50) VALUE SPACE.                             DB1034.2 IMP
   000115         011500 01  TEST-CORRECT.                                                DB1034.2
   000116         011600     02 FILLER PIC X(30) VALUE SPACE.                             DB1034.2 IMP
   000117         011700     02 FILLER PIC X(17) VALUE "       CORRECT =".                DB1034.2
   000118         011800     02 CORRECT-X.                                                DB1034.2
   000119         011900     03 CORRECT-A                 PICTURE X(20) VALUE SPACE.      DB1034.2 IMP
   000120         012000     03 CORRECT-N REDEFINES CORRECT-A PICTURE -9(9).9(9).         DB1034.2 119
   000121         012100     03 CORRECT-0V18 REDEFINES CORRECT-A    PICTURE -.9(18).      DB1034.2 119
   000122         012200     03 CORRECT-4V14 REDEFINES CORRECT-A    PICTURE -9(4).9(14).  DB1034.2 119
   000123         012300     03 CORRECT-14V4 REDEFINES CORRECT-A    PICTURE -9(14).9(4).  DB1034.2 119
   000124         012400     03      CR-18V0 REDEFINES CORRECT-A.                         DB1034.2 119
   000125         012500         04 CORRECT-18V0                    PICTURE -9(18).       DB1034.2
   000126         012600         04 FILLER                          PICTURE X.            DB1034.2
   000127         012700     03 FILLER PIC X(50) VALUE SPACE.                             DB1034.2 IMP
   000128         012800 01  CCVS-C-1.                                                    DB1034.2
   000129         012900     02 FILLER PICTURE IS X(99) VALUE IS " FEATURE              PADB1034.2
   000130         013000-    "SS  PARAGRAPH-NAME                                          DB1034.2
   000131         013100-    "        REMARKS".                                           DB1034.2
   000132         013200     02 FILLER PICTURE IS X(20) VALUE IS SPACE.                   DB1034.2 IMP
   000133         013300 01  CCVS-C-2.                                                    DB1034.2
   000134         013400     02 FILLER PICTURE IS X VALUE IS SPACE.                       DB1034.2 IMP
   000135         013500     02 FILLER PICTURE IS X(6) VALUE IS "TESTED".                 DB1034.2
   000136         013600     02 FILLER PICTURE IS X(15) VALUE IS SPACE.                   DB1034.2 IMP
   000137         013700     02 FILLER PICTURE IS X(4) VALUE IS "FAIL".                   DB1034.2
   000138         013800     02 FILLER PICTURE IS X(94) VALUE IS SPACE.                   DB1034.2 IMP
   000139         013900 01  REC-SKL-SUB PICTURE 9(2) VALUE ZERO.                         DB1034.2 IMP
   000140         014000 01  REC-CT PICTURE 99 VALUE ZERO.                                DB1034.2 IMP
   000141         014100 01  DELETE-CNT                   PICTURE 999  VALUE ZERO.        DB1034.2 IMP
   000142         014200 01  ERROR-COUNTER PICTURE IS 999 VALUE IS ZERO.                  DB1034.2 IMP
   000143         014300 01  INSPECT-COUNTER PIC 999 VALUE ZERO.                          DB1034.2 IMP
   000144         014400 01  PASS-COUNTER PIC 999 VALUE ZERO.                             DB1034.2 IMP
   000145         014500 01  TOTAL-ERROR PIC 999 VALUE ZERO.                              DB1034.2 IMP
   000146         014600 01  ERROR-HOLD PIC 999 VALUE ZERO.                               DB1034.2 IMP
   000147         014700 01  DUMMY-HOLD PIC X(120) VALUE SPACE.                           DB1034.2 IMP
   000148         014800 01  RECORD-COUNT PIC 9(5) VALUE ZERO.                            DB1034.2 IMP
   000149         014900 01  CCVS-H-1.                                                    DB1034.2
   000150         015000     02  FILLER   PICTURE X(27)  VALUE SPACE.                     DB1034.2 IMP
   000151         015100     02 FILLER PICTURE X(67) VALUE                                DB1034.2
   000152         015200     " FEDERAL COMPILER TESTING CENTER COBOL COMPILER VALIDATION  DB1034.2
   000153         015300-    " SYSTEM".                                                   DB1034.2
   000154         015400     02  FILLER     PICTURE X(26)  VALUE SPACE.                   DB1034.2 IMP
   000155         015500 01  CCVS-H-2.                                                    DB1034.2
   000156         015600     02 FILLER PICTURE X(52) VALUE IS                             DB1034.2
   000157         015700     "CCVS74 NCC  COPY, NOT FOR DISTRIBUTION.".                   DB1034.2
   000158         015800     02 FILLER PICTURE IS X(19) VALUE IS "TEST RESULTS SET-  ".   DB1034.2
   000159         015900     02 TEST-ID PICTURE IS X(9).                                  DB1034.2
   000160         016000     02 FILLER PICTURE IS X(40) VALUE IS SPACE.                   DB1034.2 IMP
   000161         016100 01  CCVS-H-3.                                                    DB1034.2
   000162         016200     02  FILLER PICTURE X(34) VALUE                               DB1034.2
   000163         016300     " FOR OFFICIAL USE ONLY    ".                                DB1034.2
   000164         016400     02  FILLER PICTURE X(58) VALUE                               DB1034.2
   000165         016500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".DB1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000166         016600     02  FILLER PICTURE X(28) VALUE                               DB1034.2
   000167         016700     "  COPYRIGHT   1974 ".                                       DB1034.2
   000168         016800 01  CCVS-E-1.                                                    DB1034.2
   000169         016900     02 FILLER PICTURE IS X(52) VALUE IS SPACE.                   DB1034.2 IMP
   000170         017000     02 FILLER PICTURE IS X(14) VALUE IS "END OF TEST-  ".        DB1034.2
   000171         017100     02 ID-AGAIN PICTURE IS X(9).                                 DB1034.2
   000172         017200     02 FILLER PICTURE X(45) VALUE IS                             DB1034.2
   000173         017300     " NTIS DISTRIBUTION COBOL 74".                               DB1034.2
   000174         017400 01  CCVS-E-2.                                                    DB1034.2
   000175         017500     02  FILLER                   PICTURE X(31)  VALUE            DB1034.2
   000176         017600     SPACE.                                                       DB1034.2 IMP
   000177         017700     02  FILLER                   PICTURE X(21)  VALUE SPACE.     DB1034.2 IMP
   000178         017800     02 CCVS-E-2-2.                                               DB1034.2
   000179         017900         03 ERROR-TOTAL PICTURE IS XXX VALUE IS SPACE.            DB1034.2 IMP
   000180         018000         03 FILLER PICTURE IS X VALUE IS SPACE.                   DB1034.2 IMP
   000181         018100         03 ENDER-DESC PIC X(44) VALUE "ERRORS ENCOUNTERED".      DB1034.2
   000182         018200 01  CCVS-E-3.                                                    DB1034.2
   000183         018300     02  FILLER PICTURE X(22) VALUE                               DB1034.2
   000184         018400     " FOR OFFICIAL USE ONLY".                                    DB1034.2
   000185         018500     02  FILLER PICTURE X(12) VALUE SPACE.                        DB1034.2 IMP
   000186         018600     02  FILLER PICTURE X(58) VALUE                               DB1034.2
   000187         018700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".DB1034.2
   000188         018800     02  FILLER PICTURE X(13) VALUE SPACE.                        DB1034.2 IMP
   000189         018900     02 FILLER PIC X(15) VALUE " COPYRIGHT 1974".                 DB1034.2
   000190         019000 01  CCVS-E-4.                                                    DB1034.2
   000191         019100     02 CCVS-E-4-1 PIC XXX VALUE SPACE.                           DB1034.2 IMP
   000192         019200     02 FILLER PIC XXXX VALUE " OF ".                             DB1034.2
   000193         019300     02 CCVS-E-4-2 PIC XXX VALUE SPACE.                           DB1034.2 IMP
   000194         019400     02 FILLER PIC X(40) VALUE                                    DB1034.2
   000195         019500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       DB1034.2
   000196         019600 01  XXINFO.                                                      DB1034.2
   000197         019700     02 FILLER PIC X(30) VALUE "        *** INFORMATION  ***".    DB1034.2
   000198         019800     02 INFO-TEXT.                                                DB1034.2
   000199         019900     04 FILLER PIC X(20) VALUE SPACE.                             DB1034.2 IMP
   000200         020000     04 XXCOMPUTED PIC X(20).                                     DB1034.2
   000201         020100     04 FILLER PIC X(5) VALUE SPACE.                              DB1034.2 IMP
   000202         020200     04 XXCORRECT PIC X(20).                                      DB1034.2
   000203         020300 01  HYPHEN-LINE.                                                 DB1034.2
   000204         020400     02 FILLER PICTURE IS X VALUE IS SPACE.                       DB1034.2 IMP
   000205         020500     02 FILLER PICTURE IS X(65) VALUE IS "************************DB1034.2
   000206         020600-    "*****************************************".                 DB1034.2
   000207         020700     02 FILLER PICTURE IS X(54) VALUE IS "************************DB1034.2
   000208         020800-    "******************************".                            DB1034.2
   000209         020900 01  CCVS-PGM-ID PIC X(6) VALUE                                   DB1034.2
   000210         021000     "DB103M".                                                    DB1034.2
   000211         021100 PROCEDURE DIVISION.                                              DB1034.2
   000212         021200 DECLARATIVES.                                                    DB1034.2
   000213         021300 START-UP SECTION.                                                DB1034.2
   000214         021400     USE FOR DEBUGGING ON OPEN-FILES.                             DB1034.2

 ==000214==> IGYPS2151-I A "USE FOR DEBUGGING" section was found, but "WITH DEBUGGING MODE" was
                         not specified.  Skipped to the next section-name, "USE" statement or "END
                         DECLARATIVES".

   000215         021500 BEGIN-START-UP.                                                  DB1034.2
   000216         021600     MOVE 1 TO RESULT-FLAG.                                       DB1034.2
   000217         021700 DB-COMMON.                                                       DB1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000218         021800     MOVE DEBUG-LINE TO DBLINE-HOLD.                              DB1034.2
   000219         021900     MOVE DEBUG-NAME TO DBNAME-HOLD.                              DB1034.2
   000220         022000     MOVE DEBUG-CONTENTS TO DBCONT-HOLD.                          DB1034.2
   000221         022100 FALL-THROUGH-AND-SERIES SECTION.                                 DB1034.2
   000222         022200     USE FOR DEBUGGING ON FALL-THROUGH-TEST                       DB1034.2

 ==000222==> IGYPS2151-I A "USE FOR DEBUGGING" section was found, but "WITH DEBUGGING MODE" was
                         not specified.  Skipped to the next section-name, "USE" statement or "END
                         DECLARATIVES".

   000223         022300              PROC-SERIES-TEST.                                   DB1034.2
   000224         022400 BEGIN-FALL-THROUGH-AND-SERIES.                                   DB1034.2
   000225         022500     PERFORM DB-COMMON.                                           DB1034.2
   000226         022600     MOVE 2 TO RESULT-FLAG.                                       DB1034.2
   000227         022700 GO-TO SECTION.                                                   DB1034.2
   000228         022800     USE FOR DEBUGGING ON GO-TO-TEST.                             DB1034.2

 ==000228==> IGYPS2151-I A "USE FOR DEBUGGING" section was found, but "WITH DEBUGGING MODE" was
                         not specified.  Skipped to the next section-name, "USE" statement or "END
                         DECLARATIVES".

   000229         022900 BEGIN-GO-TO.                                                     DB1034.2
   000230         023000     PERFORM DB-COMMON.                                           DB1034.2
   000231         023100     MOVE 3 TO RESULT-FLAG.                                       DB1034.2
   000232         023200 ALTER-PARAGRAPH SECTION.                                         DB1034.2
   000233         023300     USE FOR DEBUGGING ON ALTERABLE-PARAGRAPH.                    DB1034.2

 ==000233==> IGYPS2151-I A "USE FOR DEBUGGING" section was found, but "WITH DEBUGGING MODE" was
                         not specified.  Skipped to the next section-name, "USE" statement or "END
                         DECLARATIVES".

   000234         023400 BEGIN-ALTER-PARAGRAPH.                                           DB1034.2
   000235         023500     PERFORM DB-COMMON.                                           DB1034.2
   000236         023600     MOVE 4 TO RESULT-FLAG.                                       DB1034.2
   000237         023700 LOOP-ITERATION SECTION.                                          DB1034.2
   000238         023800     USE FOR DEBUGGING ON LOOP-ROUTINE.                           DB1034.2

 ==000238==> IGYPS2151-I A "USE FOR DEBUGGING" section was found, but "WITH DEBUGGING MODE" was
                         not specified.  Skipped to the next section-name, "USE" statement or "END
                         DECLARATIVES".

   000239         023900 BEGIN-LOOP-ITERATION.                                            DB1034.2
   000240         024000     PERFORM DB-COMMON.                                           DB1034.2
   000241         024100     ADD 1 TO RESULT-FLAG.                                        DB1034.2
   000242         024200 PERFORM-THRU SECTION.                                            DB1034.2
   000243         024300     USE FOR DEBUGGING ON DO-NOTHING-1.                           DB1034.2

 ==000243==> IGYPS2151-I A "USE FOR DEBUGGING" section was found, but "WITH DEBUGGING MODE" was
                         not specified.  Skipped to the next section-name, "USE" statement or "END
                         DECLARATIVES".

   000244         024400 BEGIN-PERFORM-THRU.                                              DB1034.2
   000245         024500     PERFORM DB-COMMON.                                           DB1034.2
   000246         024600     ADD 1 TO RESULT-FLAG.                                        DB1034.2
   000247         024700 END DECLARATIVES.                                                DB1034.2
   000248         024800 CCVS1 SECTION.                                                   DB1034.2
   000249         024900 OPEN-FILES.                                                      DB1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000250         025000     OPEN     OUTPUT PRINT-FILE.                                  DB1034.2 54
   000251         025100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   DB1034.2 209 159 209 171
   000252         025200     MOVE    SPACE TO TEST-RESULTS.                               DB1034.2 IMP 89
   000253         025300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             DB1034.2 278 282
   000254         025400     GO TO CCVS1-EXIT.                                            DB1034.2 353
   000255         025500 CLOSE-FILES.                                                     DB1034.2
   000256         025600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   DB1034.2 286 307 54
   000257         025700 TERMINATE-CCVS.                                                  DB1034.2
   000258         025800     EXIT PROGRAM.                                                DB1034.2
   000259         025900 TERMINATE-CALL.                                                  DB1034.2
   000260         026000     STOP     RUN.                                                DB1034.2
   000261         026100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         DB1034.2 93 143
   000262         026200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           DB1034.2 93 144
   000263         026300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          DB1034.2 93 142
   000264         026400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.          DB1034.2 93 141
   000265         026500     MOVE "****TEST DELETED****" TO RE-MARK.                      DB1034.2 101
   000266         026600 PRINT-DETAIL.                                                    DB1034.2
   000267         026700     IF REC-CT NOT EQUAL TO ZERO                                  DB1034.2 140 IMP
   000268      1  026800             MOVE "." TO PARDOT-X                                 DB1034.2 97
   000269      1  026900             MOVE REC-CT TO DOTVALUE.                             DB1034.2 140 98
   000270         027000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      DB1034.2 89 58 319
   000271         027100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               DB1034.2 93 319
   000272      1  027200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 DB1034.2 336 345
   000273      1  027300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 DB1034.2 346 352
   000274         027400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              DB1034.2 IMP 93 IMP 105
   000275         027500     MOVE SPACE TO CORRECT-X.                                     DB1034.2 IMP 118
   000276         027600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         DB1034.2 140 IMP IMP 95
   000277         027700     MOVE     SPACE TO RE-MARK.                                   DB1034.2 IMP 101
   000278         027800 HEAD-ROUTINE.                                                    DB1034.2
   000279         027900     MOVE CCVS-H-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1034.2 149 59 319
   000280         028000     MOVE CCVS-H-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.   DB1034.2 155 59 319
   000281         028100     MOVE CCVS-H-3 TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.   DB1034.2 161 59 319
   000282         028200 COLUMN-NAMES-ROUTINE.                                            DB1034.2
   000283         028300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1034.2 128 59 319
   000284         028400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1034.2 133 59 319
   000285         028500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        DB1034.2 203 59 319
   000286         028600 END-ROUTINE.                                                     DB1034.2
   000287         028700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.DB1034.2 203 59 319
   000288         028800 END-RTN-EXIT.                                                    DB1034.2
   000289         028900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1034.2 168 59 319
   000290         029000 END-ROUTINE-1.                                                   DB1034.2
   000291         029100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      DB1034.2 142 146 143
   000292         029200      ERROR-HOLD. ADD DELETE-CNT TO ERROR-HOLD.                   DB1034.2 146 141 146
   000293         029300      ADD PASS-COUNTER TO ERROR-HOLD.                             DB1034.2 144 146
   000294         029400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   DB1034.2
   000295         029500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            DB1034.2 144 191
   000296         029600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              DB1034.2 146 193
   000297         029700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                DB1034.2 190 178
   000298         029800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           DB1034.2 174 59 319
   000299         029900  END-ROUTINE-12.                                                 DB1034.2
   000300         030000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        DB1034.2 181
   000301         030100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      DB1034.2 142 IMP
   000302      1  030200         MOVE "NO " TO ERROR-TOTAL                                DB1034.2 179
   000303         030300         ELSE                                                     DB1034.2
   000304      1  030400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       DB1034.2 142 179
   000305         030500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           DB1034.2 174 59
   000306         030600     PERFORM WRITE-LINE.                                          DB1034.2 319
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000307         030700 END-ROUTINE-13.                                                  DB1034.2
   000308         030800     IF DELETE-CNT IS EQUAL TO ZERO                               DB1034.2 141 IMP
   000309      1  030900         MOVE "NO " TO ERROR-TOTAL  ELSE                          DB1034.2 179
   000310      1  031000         MOVE DELETE-CNT TO ERROR-TOTAL.                          DB1034.2 141 179
   000311         031100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   DB1034.2 181
   000312         031200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1034.2 174 59 319
   000313         031300      IF   INSPECT-COUNTER EQUAL TO ZERO                          DB1034.2 143 IMP
   000314      1  031400          MOVE "NO " TO ERROR-TOTAL                               DB1034.2 179
   000315      1  031500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   DB1034.2 143 179
   000316         031600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            DB1034.2 181
   000317         031700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          DB1034.2 174 59 319
   000318         031800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1034.2 182 59 319
   000319         031900 WRITE-LINE.                                                      DB1034.2
   000320         032000     ADD 1 TO RECORD-COUNT.                                       DB1034.2 148
   000321         032100     IF RECORD-COUNT GREATER 50                                   DB1034.2 148
   000322      1  032200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          DB1034.2 59 147
   000323      1  032300         MOVE SPACE TO DUMMY-RECORD                               DB1034.2 IMP 59
   000324      1  032400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  DB1034.2 59
   000325      1  032500         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             DB1034.2 128 59 331
   000326      1  032600         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     DB1034.2 133 59 331
   000327      1  032700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          DB1034.2 203 59 331
   000328      1  032800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          DB1034.2 147 59
   000329      1  032900         MOVE ZERO TO RECORD-COUNT.                               DB1034.2 IMP 148
   000330         033000     PERFORM WRT-LN.                                              DB1034.2 331
   000331         033100 WRT-LN.                                                          DB1034.2
   000332         033200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               DB1034.2 59
   000333         033300     MOVE SPACE TO DUMMY-RECORD.                                  DB1034.2 IMP 59
   000334         033400 BLANK-LINE-PRINT.                                                DB1034.2
   000335         033500     PERFORM WRT-LN.                                              DB1034.2 331
   000336         033600 FAIL-ROUTINE.                                                    DB1034.2
   000337         033700     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.   DB1034.2 105 IMP 342
   000338         033800     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.    DB1034.2 118 IMP 342
   000339         033900     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    DB1034.2 198
   000340         034000     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     DB1034.2 196 59 319
   000341         034100     GO TO FAIL-ROUTINE-EX.                                       DB1034.2 345
   000342         034200 FAIL-ROUTINE-WRITE.                                              DB1034.2
   000343         034300     MOVE TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE           DB1034.2 102 58 319
   000344         034400     MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES.   DB1034.2 115 58 319
   000345         034500 FAIL-ROUTINE-EX. EXIT.                                           DB1034.2
   000346         034600 BAIL-OUT.                                                        DB1034.2
   000347         034700     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.       DB1034.2 106 IMP 349
   000348         034800     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.               DB1034.2 119 IMP 352
   000349         034900 BAIL-OUT-WRITE.                                                  DB1034.2
   000350         035000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  DB1034.2 119 202 106 200
   000351         035100     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     DB1034.2 196 59 319
   000352         035200 BAIL-OUT-EX. EXIT.                                               DB1034.2
   000353         035300 CCVS1-EXIT.                                                      DB1034.2
   000354         035400     EXIT.                                                        DB1034.2
   000355         035500 START-PROGRAM-TEST.                                              DB1034.2
   000356         035600     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1034.2 65
   000357      1  035700         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1034.2 101
   000358      1  035800         PERFORM FAIL                                             DB1034.2 263
   000359      1  035900         PERFORM START-PROGRAM-WRITE                              DB1034.2 376
   000360      1  036000         ELSE PERFORM PASS                                        DB1034.2 262
   000361      1  036100         GO TO START-PROGRAM-WRITE.                               DB1034.2 376
   000362         036200     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000363         036300     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1034.2 119
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000364         036400     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1034.2 66 106
   000365         036500     PERFORM START-PROGRAM-WRITE.                                 DB1034.2 376
   000366         036600     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000367         036700     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1034.2 119
   000368         036800     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1034.2 67 106
   000369         036900     PERFORM START-PROGRAM-WRITE.                                 DB1034.2 376
   000370         037000     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1034.2 101
   000371         037100     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1034.2 119
   000372         037200     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1034.2 68 106
   000373         037300     GO TO   START-PROGRAM-WRITE.                                 DB1034.2 376
   000374         037400 START-PROGRAM-DELETE.                                            DB1034.2
   000375         037500     PERFORM DE-LETE.                                             DB1034.2 264
   000376         037600 START-PROGRAM-WRITE.                                             DB1034.2
   000377         037700     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1034.2 91
   000378         037800     MOVE "START-PROGRAM-TEST" TO PAR-NAME.                       DB1034.2 95
   000379         037900     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000380         038000     MOVE 0 TO RESULT-FLAG.                                       DB1034.2 65
   000381         038100 FALL-THROUGH-TEST.                                               DB1034.2
   000382         038200     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1034.2 65
   000383      1  038300         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1034.2 101
   000384      1  038400         PERFORM FAIL                                             DB1034.2 263
   000385      1  038500         PERFORM FALL-THROUGH-WRITE                               DB1034.2 402
   000386      1  038600         ELSE PERFORM PASS                                        DB1034.2 262
   000387      1  038700         GO TO FALL-THROUGH-WRITE.                                DB1034.2 402
   000388         038800     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000389         038900     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1034.2 119
   000390         039000     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1034.2 66 106
   000391         039100     PERFORM FALL-THROUGH-WRITE.                                  DB1034.2 402
   000392         039200     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000393         039300     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1034.2 119
   000394         039400     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1034.2 67 106
   000395         039500     PERFORM FALL-THROUGH-WRITE.                                  DB1034.2 402
   000396         039600     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1034.2 101
   000397         039700     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1034.2 119
   000398         039800     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1034.2 68 106
   000399         039900     GO TO   FALL-THROUGH-WRITE.                                  DB1034.2 402
   000400         040000 FALL-THROUGH-DELETE.                                             DB1034.2
   000401         040100     PERFORM DE-LETE.                                             DB1034.2 264
   000402         040200 FALL-THROUGH-WRITE.                                              DB1034.2
   000403         040300     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1034.2 91
   000404         040400     MOVE "FALL-THROUGH-TEST" TO PAR-NAME.                        DB1034.2 95
   000405         040500     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000406         040600     MOVE 0 TO RESULT-FLAG.                                       DB1034.2 65
   000407         040700 PROC-SERIES-TEST.                                                DB1034.2
   000408         040800     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1034.2 65
   000409      1  040900         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1034.2 101
   000410      1  041000         PERFORM FAIL                                             DB1034.2 263
   000411      1  041100         PERFORM PROC-SERIES-WRITE                                DB1034.2 428
   000412      1  041200         ELSE PERFORM PASS                                        DB1034.2 262
   000413      1  041300         GO TO PROC-SERIES-WRITE.                                 DB1034.2 428
   000414         041400     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000415         041500     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1034.2 119
   000416         041600     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1034.2 66 106
   000417         041700     PERFORM PROC-SERIES-WRITE.                                   DB1034.2 428
   000418         041800     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000419         041900     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1034.2 119
   000420         042000     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1034.2 67 106
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000421         042100     PERFORM PROC-SERIES-WRITE.                                   DB1034.2 428
   000422         042200     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1034.2 101
   000423         042300     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1034.2 119
   000424         042400     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1034.2 68 106
   000425         042500     GO TO   PROC-SERIES-WRITE.                                   DB1034.2 428
   000426         042600 PROC-SERIES-DELETE.                                              DB1034.2
   000427         042700     PERFORM DE-LETE.                                             DB1034.2 264
   000428         042800 PROC-SERIES-WRITE.                                               DB1034.2
   000429         042900     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1034.2 91
   000430         043000     MOVE "PROC-SERIES-TEST" TO PAR-NAME.                         DB1034.2 95
   000431         043100     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000432         043200     MOVE 0 TO RESULT-FLAG.                                       DB1034.2 65
   000433         043300 ALTERABLE-PARAGRAPH.                                             DB1034.2
   000434         043400     GO TO GO-TO-TEST.                                            DB1034.2 439
   000435         043500 FILLER-PARAGRAPH.                                                DB1034.2
   000436         043600     DISPLAY "ALTER FAILED AT ALTER-TEST-INIT".                   DB1034.2
   000437         043700     PERFORM FAIL.                                                DB1034.2 263
   000438         043800     GO TO ALTERED-GO-TO-TEST.                                    DB1034.2 495
   000439         043900 GO-TO-TEST.                                                      DB1034.2
   000440         044000     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1034.2 65
   000441      1  044100         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1034.2 101
   000442      1  044200         PERFORM FAIL                                             DB1034.2 263
   000443      1  044300         PERFORM GO-TO-WRITE                                      DB1034.2 460
   000444      1  044400         ELSE PERFORM PASS                                        DB1034.2 262
   000445      1  044500         GO TO GO-TO-WRITE.                                       DB1034.2 460
   000446         044600     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000447         044700     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1034.2 119
   000448         044800     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1034.2 66 106
   000449         044900     PERFORM GO-TO-WRITE.                                         DB1034.2 460
   000450         045000     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000451         045100     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1034.2 119
   000452         045200     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1034.2 67 106
   000453         045300     PERFORM GO-TO-WRITE.                                         DB1034.2 460
   000454         045400     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1034.2 101
   000455         045500     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1034.2 119
   000456         045600     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1034.2 68 106
   000457         045700     GO TO   GO-TO-WRITE.                                         DB1034.2 460
   000458         045800 GO-TO-DELETE.                                                    DB1034.2
   000459         045900     PERFORM DE-LETE.                                             DB1034.2 264
   000460         046000 GO-TO-WRITE.                                                     DB1034.2
   000461         046100     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1034.2 91
   000462         046200     MOVE "GO-TO-TEST" TO PAR-NAME.                               DB1034.2 95
   000463         046300     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000464         046400     MOVE 0 TO RESULT-FLAG.                                       DB1034.2 65
   000465         046500 ALTER-TEST-INIT.                                                 DB1034.2
   000466         046600     ALTER ALTERABLE-PARAGRAPH TO PROCEED TO ALTERED-GO-TO-TEST.  DB1034.2 433 495
   000467         046700 ALTER-TEST.                                                      DB1034.2
   000468         046800     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1034.2 65
   000469      1  046900         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1034.2 101
   000470      1  047000         PERFORM FAIL                                             DB1034.2 263
   000471      1  047100         PERFORM ALTER-WRITE                                      DB1034.2 488
   000472      1  047200         ELSE PERFORM PASS                                        DB1034.2 262
   000473      1  047300         GO TO ALTER-WRITE.                                       DB1034.2 488
   000474         047400     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000475         047500     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1034.2 119
   000476         047600     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1034.2 66 106
   000477         047700     PERFORM ALTER-WRITE.                                         DB1034.2 488
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000478         047800     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000479         047900     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1034.2 119
   000480         048000     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1034.2 67 106
   000481         048100     PERFORM ALTER-WRITE.                                         DB1034.2 488
   000482         048200     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1034.2 101
   000483         048300     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1034.2 119
   000484         048400     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1034.2 68 106
   000485         048500     GO TO   ALTER-WRITE.                                         DB1034.2 488
   000486         048600 ALTER-DELETE.                                                    DB1034.2
   000487         048700     PERFORM DE-LETE.                                             DB1034.2 264
   000488         048800 ALTER-WRITE.                                                     DB1034.2
   000489         048900     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1034.2 91
   000490         049000     MOVE "ALTER-TEST" TO PAR-NAME.                               DB1034.2 95
   000491         049100     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000492         049200     MOVE 0 TO RESULT-FLAG.                                       DB1034.2 65
   000493         049300 ALTER-WRITE-END.                                                 DB1034.2
   000494         049400     GO TO ALTERABLE-PARAGRAPH.                                   DB1034.2 433
   000495         049500 ALTERED-GO-TO-TEST.                                              DB1034.2
   000496         049600     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1034.2 65
   000497      1  049700         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1034.2 101
   000498      1  049800         PERFORM FAIL                                             DB1034.2 263
   000499      1  049900         PERFORM ALTERED-GO-TO-WRITE                              DB1034.2 516
   000500      1  050000         ELSE PERFORM PASS                                        DB1034.2 262
   000501      1  050100         GO TO ALTERED-GO-TO-WRITE.                               DB1034.2 516
   000502         050200     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000503         050300     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1034.2 119
   000504         050400     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1034.2 66 106
   000505         050500     PERFORM ALTERED-GO-TO-WRITE.                                 DB1034.2 516
   000506         050600     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000507         050700     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1034.2 119
   000508         050800     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1034.2 67 106
   000509         050900     PERFORM ALTERED-GO-TO-WRITE.                                 DB1034.2 516
   000510         051000     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1034.2 101
   000511         051100     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1034.2 119
   000512         051200     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1034.2 68 106
   000513         051300     GO TO   ALTERED-GO-TO-WRITE.                                 DB1034.2 516
   000514         051400 ALTERED-GO-TO-DELETE.                                            DB1034.2
   000515         051500     PERFORM DE-LETE.                                             DB1034.2 264
   000516         051600 ALTERED-GO-TO-WRITE.                                             DB1034.2
   000517         051700     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1034.2 91
   000518         051800     MOVE "ALTERED-GO-TO-TEST" TO PAR-NAME.                       DB1034.2 95
   000519         051900     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000520         052000     MOVE 0 TO RESULT-FLAG.                                       DB1034.2 65
   000521         052100 PERF-ITERATION-TEST.                                             DB1034.2
   000522         052200     PERFORM LOOP-ROUTINE FIVE TIMES.                             DB1034.2 550 69
   000523         052300     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1034.2 65
   000524      1  052400         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1034.2 101
   000525      1  052500         PERFORM FAIL                                             DB1034.2 263
   000526      1  052600         PERFORM PERF-ITERATION-WRITE                             DB1034.2 543
   000527      1  052700         ELSE  PERFORM PASS                                       DB1034.2 262
   000528      1  052800         GO TO PERF-ITERATION-WRITE.                              DB1034.2 543
   000529         052900     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000530         053000     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1034.2 119
   000531         053100     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1034.2 66 106
   000532         053200     PERFORM PERF-ITERATION-WRITE.                                DB1034.2 543
   000533         053300     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000534         053400     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1034.2 119
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000535         053500     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1034.2 67 106
   000536         053600     PERFORM PERF-ITERATION-WRITE.                                DB1034.2 543
   000537         053700     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1034.2 101
   000538         053800     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1034.2 119
   000539         053900     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1034.2 68 106
   000540         054000     GO TO   PERF-ITERATION-WRITE.                                DB1034.2 543
   000541         054100 PERF-ITERATION-DELETE.                                           DB1034.2
   000542         054200     PERFORM DE-LETE.                                             DB1034.2 264
   000543         054300 PERF-ITERATION-WRITE.                                            DB1034.2
   000544         054400     MOVE "PERF-ITERATION-TEST" TO PAR-NAME.                      DB1034.2 95
   000545         054500     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1034.2 91
   000546         054600     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000547         054700     MOVE 0 TO RESULT-FLAG.                                       DB1034.2 65
   000548         054800 PERF-ITERATION-END.                                              DB1034.2
   000549         054900     GO TO PERFORM-THRU-TEST.                                     DB1034.2 557
   000550         055000 LOOP-ROUTINE.                                                    DB1034.2
   000551         055200* ACTION RESULTING IN LOOP UNFOLDING AND REDUCTION.               DB1034.2
   000552         055300     PERFORM DO-NOTHING.                                          DB1034.2 553
   000553         055400 DO-NOTHING.                                                      DB1034.2
   000554         055500     ADD A B C GIVING D.                                          DB1034.2 61 62 63 64
   000555         055600 DO-NOTHING-1.                                                    DB1034.2
   000556         055700     SUBTRACT A FROM B.                                           DB1034.2 61 62
   000557         055800 PERFORM-THRU-TEST.                                               DB1034.2
   000558         055900     PERFORM DO-NOTHING THRU DO-NOTHING-1 FIVE TIMES.             DB1034.2 553 555 69
   000559         056000     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1034.2 65
   000560      1  056100         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1034.2 101
   000561      1  056200         PERFORM FAIL                                             DB1034.2 263
   000562      1  056300         PERFORM PERFORM-THRU-WRITE                               DB1034.2 579
   000563      1  056400         ELSE PERFORM PASS                                        DB1034.2 262
   000564      1  056500         GO TO PERFORM-THRU-WRITE.                                DB1034.2 579
   000565         056600     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000566         056700     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1034.2 119
   000567         056800     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1034.2 66 106
   000568         056900     PERFORM PERFORM-THRU-WRITE.                                  DB1034.2 579
   000569         057000     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000570         057100     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1034.2 119
   000571         057200     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1034.2 67 106
   000572         057300     PERFORM PERFORM-THRU-WRITE.                                  DB1034.2 579
   000573         057400     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1034.2 101
   000574         057500     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1034.2 119
   000575         057600     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1034.2 68 106
   000576         057700     GO TO   PERFORM-THRU-WRITE.                                  DB1034.2 579
   000577         057800 PERFORM-THRU-DELETE.                                             DB1034.2
   000578         057900     PERFORM DE-LETE.                                             DB1034.2 264
   000579         058000 PERFORM-THRU-WRITE.                                              DB1034.2
   000580         058100     MOVE "PERFORM-THRU-TEST" TO PAR-NAME.                        DB1034.2 95
   000581         058200     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1034.2 91
   000582         058300     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000583         058400     MOVE 0 TO RESULT-FLAG.                                       DB1034.2 65
   000584         058500 SIMPLE-PERFORM-TEST.                                             DB1034.2
   000585         058600     PERFORM LOOP-ROUTINE.                                        DB1034.2 550
   000586         058700     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1034.2 65
   000587      1  058800         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1034.2 101
   000588      1  058900         PERFORM FAIL                                             DB1034.2 263
   000589      1  059000         PERFORM SIMPLE-PERFORM-WRITE                             DB1034.2 606
   000590      1  059100         ELSE PERFORM PASS                                        DB1034.2 262
   000591      1  059200         GO TO SIMPLE-PERFORM-WRITE.                              DB1034.2 606
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000592         059300     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000593         059400     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1034.2 119
   000594         059500     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1034.2 66 106
   000595         059600     PERFORM SIMPLE-PERFORM-WRITE.                                DB1034.2 606
   000596         059700     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1034.2 101
   000597         059800     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1034.2 119
   000598         059900     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1034.2 67 106
   000599         060000     PERFORM SIMPLE-PERFORM-WRITE.                                DB1034.2 606
   000600         060100     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1034.2 101
   000601         060200     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1034.2 119
   000602         060300     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1034.2 68 106
   000603         060400     GO TO   SIMPLE-PERFORM-WRITE.                                DB1034.2 606
   000604         060500 SIMPLE-PERFORM-DELETE.                                           DB1034.2
   000605         060600     PERFORM DE-LETE.                                             DB1034.2 264
   000606         060700 SIMPLE-PERFORM-WRITE.                                            DB1034.2
   000607         060800     MOVE "SIMPLE-PERFORM-TEST" TO PAR-NAME.                      DB1034.2 95
   000608         060900     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1034.2 91
   000609         061000     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000610         061100     MOVE 0 TO RESULT-FLAG.                                       DB1034.2 65
   000611         061200 DEBUG-LINE-TESTS-INIT.                                           DB1034.2
   000612         061300     MOVE "DEBUG LINE TESTS" TO FEATURE.                          DB1034.2 91
   000613         061400 DEBUG-LINE-TEST-01.                                              DB1034.2
   000614         061500     MOVE "COMPLETE ENTITY" TO RE-MARK.                           DB1034.2 101
   000615         061600     PERFORM PASS.                                                DB1034.2 262
   000616         061700D    PERFORM FAIL.                                                DB1034.2
   000617         061800     GO TO DEBUG-LINE-WRITE-01.                                   DB1034.2 620
   000618         061900 DEBUG-LINE-DELETE-01.                                            DB1034.2
   000619         062000     PERFORM DE-LETE.                                             DB1034.2 264
   000620         062100 DEBUG-LINE-WRITE-01.                                             DB1034.2
   000621         062200     MOVE "DEBUG-LINE-TEST-01" TO PAR-NAME.                       DB1034.2 95
   000622         062300     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000623         062400 DEBUG-LINE-TEST-02.                                              DB1034.2
   000624         062500     MOVE "CONSECUTIVE DEBUG LINES" TO RE-MARK.                   DB1034.2 101
   000625         062600     PERFORM PASS.                                                DB1034.2 262
   000626         062700D    PERFORM FAIL.                                                DB1034.2
   000627         062800D    SUBTRACT 1 FROM D.                                           DB1034.2
   000628         062900     GO TO DEBUG-LINE-WRITE-02.                                   DB1034.2 631
   000629         063000 DEBUG-LINE-DELETE-02.                                            DB1034.2
   000630         063100     PERFORM DE-LETE.                                             DB1034.2 264
   000631         063200 DEBUG-LINE-WRITE-02.                                             DB1034.2
   000632         063300     MOVE "DEBUG-LINE-TEST-02" TO PAR-NAME.                       DB1034.2 95
   000633         063400     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000634         063500 DEBUG-LINE-TEST-03.                                              DB1034.2
   000635         063600     MOVE "BROKEN STATEMENTS" TO RE-MARK.                         DB1034.2 101
   000636         063700     PERFORM                                                      DB1034.2
   000637         063800D        FAIL.   GO TO DEBUG-LINE-WRITE-03.                       DB1034.2
   000638         063900DDEBUG-LINE-TEST-03A.     PERFORM                                 DB1034.2
   000639         064000                             PASS.                                DB1034.2 262
   000640         064100                             GO TO DEBUG-LINE-WRITE-03.           DB1034.2 643
   000641         064200 DEBUG-LINE-DELETE-03.                                            DB1034.2
   000642         064300     PERFORM DE-LETE.                                             DB1034.2 264
   000643         064400 DEBUG-LINE-WRITE-03.                                             DB1034.2
   000644         064500     MOVE "DEBUG-LINE-TEST-03" TO PAR-NAME.                       DB1034.2 95
   000645         064600     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000646         064700 DEBUG-LINE-TEST-04.                                              DB1034.2
   000647         064800     MOVE "NESTED COMMENTS" TO RE-MARK.                           DB1034.2 101
   000648         064900D    PERFORM FAIL.                                                DB1034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000649         065000*    PERFORM FAIL.  MOVE "COMMENTS EXECUTED" TO COMPUTED-A.       DB1034.2
   000650         065100*    GO TO DEBUG-LINE-WRITE-04.                                   DB1034.2
   000651         065200*DEBUG-LINE-TEST-04-A.                                            DB1034.2
   000652         065300D    GO TO DEBUG-LINE-WRITE-04.                                   DB1034.2
   000653         065400 DEBUG-LINE-TEST-04-B.                                            DB1034.2
   000654         065500     PERFORM PASS.                                                DB1034.2 262
   000655         065600     GO TO DEBUG-LINE-WRITE-04.                                   DB1034.2 658
   000656         065700 DEBUG-LINE-DELETE-04.                                            DB1034.2
   000657         065800     PERFORM DE-LETE.                                             DB1034.2 264
   000658         065900 DEBUG-LINE-WRITE-04.                                             DB1034.2
   000659         066000     MOVE "DEBUG-LINE-TEST-04" TO PAR-NAME.                       DB1034.2 95
   000660         066100     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000661         066200 DEBUG-LINE-TEST-05.                                              DB1034.2
   000662         066300     MOVE "NESTED INSIDE COMMENTS" TO RE-MARK.                    DB1034.2 101
   000663         066400*    PERFORM FAIL.  MOVE "COMMENTS EXECUTED" TO COMPUTED-A.       DB1034.2
   000664         066500*    GO TO DEBUG-LINE-WRITE-05.                                   DB1034.2
   000665         066600DDEBUG-LINE-TEST-05-A.                                            DB1034.2
   000666         066700D    PERFORM FAIL.                                                DB1034.2
   000667         066800D    GO TO DEBUG-LINE-WRITE-05.                                   DB1034.2
   000668         066900*DEBUG-LINE-TEST-05-B.                                            DB1034.2
   000669         067000*    MOVE "    FAILURE 05B" TO COMPUTED-A.                        DB1034.2
   000670         067100*    PERFORM FAIL.  GO TO DEBUG-LINE-WRITE-05.                    DB1034.2
   000671         067200 DEBUG-LINE-TEST-05-C.                                            DB1034.2
   000672         067300     PERFORM PASS.                                                DB1034.2 262
   000673         067400     GO TO DEBUG-LINE-WRITE-05.                                   DB1034.2 676
   000674         067500 DEBUG-LINE-DELETE-05.                                            DB1034.2
   000675         067600     PERFORM DE-LETE.                                             DB1034.2 264
   000676         067700 DEBUG-LINE-WRITE-05.                                             DB1034.2
   000677         067800     MOVE "DEBUG-LINE-TEST-05" TO PAR-NAME.                       DB1034.2 95
   000678         067900     PERFORM PRINT-DETAIL.                                        DB1034.2 266
   000679         068000 CCVS-EXIT SECTION.                                               DB1034.2
   000680         068100 CCVS-999999.                                                     DB1034.2
   000681         068200     GO TO CLOSE-FILES.                                           DB1034.2 255
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       61   A. . . . . . . . . . . . . . .  554 556
       62   B. . . . . . . . . . . . . . .  554 M556
       63   C. . . . . . . . . . . . . . .  554
      128   CCVS-C-1 . . . . . . . . . . .  283 325
      133   CCVS-C-2 . . . . . . . . . . .  284 326
      168   CCVS-E-1 . . . . . . . . . . .  289
      174   CCVS-E-2 . . . . . . . . . . .  298 305 312 317
      178   CCVS-E-2-2 . . . . . . . . . .  M297
      182   CCVS-E-3 . . . . . . . . . . .  318
      190   CCVS-E-4 . . . . . . . . . . .  297
      191   CCVS-E-4-1 . . . . . . . . . .  M295
      193   CCVS-E-4-2 . . . . . . . . . .  M296
      149   CCVS-H-1 . . . . . . . . . . .  279
      155   CCVS-H-2 . . . . . . . . . . .  280
      161   CCVS-H-3 . . . . . . . . . . .  281
      209   CCVS-PGM-ID. . . . . . . . . .  251 251
      111   CM-18V0
      106   COMPUTED-A . . . . . . . . . .  107 108 109 110 111 347 350 M364 M368 M372 M390 M394 M398 M416 M420 M424 M448
                                            M452 M456 M476 M480 M484 M504 M508 M512 M531 M535 M539 M567 M571 M575 M594 M598
                                            M602
      107   COMPUTED-N
      105   COMPUTED-X . . . . . . . . . .  M274 337
      108   COMPUTED-0V18
      110   COMPUTED-14V4
      112   COMPUTED-18V0
      109   COMPUTED-4V14
      119   CORRECT-A. . . . . . . . . . .  120 121 122 123 124 348 350 M363 M367 M371 M389 M393 M397 M415 M419 M423 M447
                                            M451 M455 M475 M479 M483 M503 M507 M511 M530 M534 M538 M566 M570 M574 M593 M597
                                            M601
      120   CORRECT-N
      118   CORRECT-X. . . . . . . . . . .  M275 338
      121   CORRECT-0V18
      123   CORRECT-14V4
      125   CORRECT-18V0
      122   CORRECT-4V14
      124   CR-18V0
       64   D. . . . . . . . . . . . . . .  M554
       68   DBCONT-HOLD. . . . . . . . . .  372 398 424 456 484 512 539 575 602
       66   DBLINE-HOLD. . . . . . . . . .  364 390 416 448 476 504 531 567 594
       67   DBNAME-HOLD. . . . . . . . . .  368 394 420 452 480 508 535 571 598
      141   DELETE-CNT . . . . . . . . . .  M264 292 308 310
       98   DOTVALUE . . . . . . . . . . .  M269
      147   DUMMY-HOLD . . . . . . . . . .  M322 328
       59   DUMMY-RECORD . . . . . . . . .  M279 M280 M281 M283 M284 M285 M287 M289 M298 M305 M312 M317 M318 322 M323 324
                                            M325 M326 M327 M328 332 M333 M340 M351
      181   ENDER-DESC . . . . . . . . . .  M300 M311 M316
      142   ERROR-COUNTER. . . . . . . . .  M263 291 301 304
      146   ERROR-HOLD . . . . . . . . . .  M291 M292 M292 M293 296
      179   ERROR-TOTAL. . . . . . . . . .  M302 M304 M309 M310 M314 M315
       91   FEATURE. . . . . . . . . . . .  M377 M403 M429 M461 M489 M517 M545 M581 M608 M612
       69   FIVE . . . . . . . . . . . . .  522 558
      203   HYPHEN-LINE. . . . . . . . . .  285 287 327
      171   ID-AGAIN . . . . . . . . . . .  M251
      198   INFO-TEXT. . . . . . . . . . .  M339
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    17
0 Defined   Cross-reference of data names   References

0     143   INSPECT-COUNTER. . . . . . . .  M261 291 313 315
       93   P-OR-F . . . . . . . . . . . .  M261 M262 M263 M264 271 M274
       95   PAR-NAME . . . . . . . . . . .  M276 M378 M404 M430 M462 M490 M518 M544 M580 M607 M621 M632 M644 M659 M677
       97   PARDOT-X . . . . . . . . . . .  M268
      144   PASS-COUNTER . . . . . . . . .  M262 293 295
       54   PRINT-FILE . . . . . . . . . .  50 250 256
       58   PRINT-REC. . . . . . . . . . .  M270 M343 M344
      101   RE-MARK. . . . . . . . . . . .  M265 M277 M357 M362 M366 M370 M383 M388 M392 M396 M409 M414 M418 M422 M441 M446
                                            M450 M454 M469 M474 M478 M482 M497 M502 M506 M510 M524 M529 M533 M537 M560 M565
                                            M569 M573 M587 M592 M596 M600 M614 M624 M635 M647 M662
      140   REC-CT . . . . . . . . . . . .  267 269 276
      139   REC-SKL-SUB
      148   RECORD-COUNT . . . . . . . . .  M320 321 M329
       65   RESULT-FLAG. . . . . . . . . .  356 M380 382 M406 408 M432 440 M464 468 M492 496 M520 523 M547 559 M583 586 M610
       88   SIZE-10
       86   SIZE-11
       84   SIZE-12
       82   SIZE-13
       80   SIZE-14
       78   SIZE-15
       76   SIZE-16
       74   SIZE-17
       72   SIZE-18
       70   SIZE-19
      102   TEST-COMPUTED. . . . . . . . .  343
      115   TEST-CORRECT . . . . . . . . .  344
      159   TEST-ID. . . . . . . . . . . .  M251
       89   TEST-RESULTS . . . . . . . . .  M252 270
      145   TOTAL-ERROR
      200   XXCOMPUTED . . . . . . . . . .  M350
      202   XXCORRECT. . . . . . . . . . .  M350
      196   XXINFO . . . . . . . . . . . .  340 351
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    18
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

      486   ALTER-DELETE
      467   ALTER-TEST
      465   ALTER-TEST-INIT
      488   ALTER-WRITE. . . . . . . . . .  P471 G473 P477 P481 G485
      493   ALTER-WRITE-END
      433   ALTERABLE-PARAGRAPH. . . . . .  A466 G494
      514   ALTERED-GO-TO-DELETE
      495   ALTERED-GO-TO-TEST . . . . . .  G438 T466
      516   ALTERED-GO-TO-WRITE. . . . . .  P499 G501 P505 P509 G513
      346   BAIL-OUT . . . . . . . . . . .  P273
      352   BAIL-OUT-EX. . . . . . . . . .  E273 G348
      349   BAIL-OUT-WRITE . . . . . . . .  G347
      334   BLANK-LINE-PRINT
      679   CCVS-EXIT
      680   CCVS-999999
      248   CCVS1
      353   CCVS1-EXIT . . . . . . . . . .  G254
      255   CLOSE-FILES. . . . . . . . . .  G681
      282   COLUMN-NAMES-ROUTINE . . . . .  E253
      264   DE-LETE. . . . . . . . . . . .  P375 P401 P427 P459 P487 P515 P542 P578 P605 P619 P630 P642 P657 P675
      618   DEBUG-LINE-DELETE-01
      629   DEBUG-LINE-DELETE-02
      641   DEBUG-LINE-DELETE-03
      656   DEBUG-LINE-DELETE-04
      674   DEBUG-LINE-DELETE-05
      613   DEBUG-LINE-TEST-01
      623   DEBUG-LINE-TEST-02
      634   DEBUG-LINE-TEST-03
      646   DEBUG-LINE-TEST-04
      653   DEBUG-LINE-TEST-04-B
      661   DEBUG-LINE-TEST-05
      671   DEBUG-LINE-TEST-05-C
      611   DEBUG-LINE-TESTS-INIT
      620   DEBUG-LINE-WRITE-01. . . . . .  G617
      631   DEBUG-LINE-WRITE-02. . . . . .  G628
      643   DEBUG-LINE-WRITE-03. . . . . .  G640
      658   DEBUG-LINE-WRITE-04. . . . . .  G655
      676   DEBUG-LINE-WRITE-05. . . . . .  G673
      553   DO-NOTHING . . . . . . . . . .  P552 P558
      555   DO-NOTHING-1 . . . . . . . . .  E558
      286   END-ROUTINE. . . . . . . . . .  P256
      290   END-ROUTINE-1
      299   END-ROUTINE-12
      307   END-ROUTINE-13 . . . . . . . .  E256
      288   END-RTN-EXIT
      263   FAIL . . . . . . . . . . . . .  P358 P384 P410 P437 P442 P470 P498 P525 P561 P588
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    19
0 Defined   Cross-reference of procedures   References

0     336   FAIL-ROUTINE . . . . . . . . .  P272
      345   FAIL-ROUTINE-EX. . . . . . . .  E272 G341
      342   FAIL-ROUTINE-WRITE . . . . . .  G337 G338
      400   FALL-THROUGH-DELETE
      381   FALL-THROUGH-TEST
      402   FALL-THROUGH-WRITE . . . . . .  P385 G387 P391 P395 G399
      435   FILLER-PARAGRAPH
      458   GO-TO-DELETE
      439   GO-TO-TEST . . . . . . . . . .  G434
      460   GO-TO-WRITE. . . . . . . . . .  P443 G445 P449 P453 G457
      278   HEAD-ROUTINE . . . . . . . . .  P253
      261   INSPT
      550   LOOP-ROUTINE . . . . . . . . .  P522 P585
      249   OPEN-FILES
      262   PASS . . . . . . . . . . . . .  P360 P386 P412 P444 P472 P500 P527 P563 P590 P615 P625 P639 P654 P672
      541   PERF-ITERATION-DELETE
      548   PERF-ITERATION-END
      521   PERF-ITERATION-TEST
      543   PERF-ITERATION-WRITE . . . . .  P526 G528 P532 P536 G540
      577   PERFORM-THRU-DELETE
      557   PERFORM-THRU-TEST. . . . . . .  G549
      579   PERFORM-THRU-WRITE . . . . . .  P562 G564 P568 P572 G576
      266   PRINT-DETAIL . . . . . . . . .  P379 P405 P431 P463 P491 P519 P546 P582 P609 P622 P633 P645 P660 P678
      426   PROC-SERIES-DELETE
      407   PROC-SERIES-TEST
      428   PROC-SERIES-WRITE. . . . . . .  P411 G413 P417 P421 G425
      604   SIMPLE-PERFORM-DELETE
      584   SIMPLE-PERFORM-TEST
      606   SIMPLE-PERFORM-WRITE . . . . .  P589 G591 P595 P599 G603
      374   START-PROGRAM-DELETE
      355   START-PROGRAM-TEST
      376   START-PROGRAM-WRITE. . . . . .  P359 G361 P365 P369 G373
      259   TERMINATE-CALL
      257   TERMINATE-CCVS
      319   WRITE-LINE . . . . . . . . . .  P270 P271 P279 P280 P281 P283 P284 P285 P287 P289 P298 P306 P312 P317 P318 P340
                                            P343 P344 P351
      331   WRT-LN . . . . . . . . . . . .  P325 P326 P327 P330 P335
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    20
0 Defined   Cross-reference of programs     References

        3   DB103M
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB103M    Date 06/04/2022  Time 11:57:39   Page    21
0LineID  Message code  Message text

     54  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     56  IGYGR1174-S   "XXXXX084" was not defined as a data-name.  "XXXXX084" was discarded.

    214  IGYPS2151-I   A "USE FOR DEBUGGING" section was found, but "WITH DEBUGGING MODE" was not specified.  Skipped to the next
                       section-name, "USE" statement or "END DECLARATIVES".

                       Same message on line:    222    228    233    238    243
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       8           7                                  1
-* Statistics for COBOL program DB103M:
 *    Source records = 681
 *    Data Division statements = 78
 *    Procedure Division statements = 371
 *    Generated COBOL statements = 0
 *    Program complexity factor = 379
0End of compilation 1,  program DB103M,  highest severity 12.
0Return code 12
