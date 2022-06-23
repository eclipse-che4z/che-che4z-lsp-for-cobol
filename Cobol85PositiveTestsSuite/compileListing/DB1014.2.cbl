1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:49   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:49   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         DB1014.2
   000002         000200 PROGRAM-ID.                                                      DB1014.2
   000003         000300     DB101A.                                                      DB1014.2
   000004         000400 AUTHOR.                                                          DB1014.2
   000005         000500     FEDERAL COMPILER TESTING CENTER.                             DB1014.2
   000006         000600 INSTALLATION.                                                    DB1014.2
   000007         000700     GENERAL SERVICES ADMINISTRATION                              DB1014.2
   000008         000800     AUTOMATED      AND TELECOMMUNICATION SERVICE.                DB1014.2
   000009         000900     SOFTWARE DEVELOPMENT OFFICE.                                 DB1014.2
   000010         001000     5203 LEESBURG PIKE  SUITE 1100                               DB1014.2
   000011         001100     FALLS CHURCH VIRGINIA 22041.                                 DB1014.2
   000012         001200                                                                  DB1014.2
   000013         001300     PHONE   (703) 756-6153                                       DB1014.2
   000014         001400                                                                  DB1014.2
   000015         001500     " HIGH       ".                                              DB1014.2
   000016         001600 DATE-WRITTEN.                                                    DB1014.2
   000017         001700     CCVS-74 VERSION 4.0 - 1980 JULY 1.                           DB1014.2
   000018         001800     CREATION DATE     /    VALIDATION DATE                       DB1014.2
   000019         001900     "4.2 ".                                                      DB1014.2
   000020         002000 SECURITY.                                                        DB1014.2
   000021         002100     NONE.                                                        DB1014.2
   000022         002200*                                                                 DB1014.2
   000023         002300*    *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *DB1014.2
   000024         002400*                                                                 DB1014.2
   000025         002500*                       PROGRAM ABSTRACT                          DB1014.2
   000026         002600*                                                                 DB1014.2
   000027         002700*    DB101A TESTS THE BASIC OPERATION OF THE DEBUG MODULE WHEN    DB1014.2
   000028         002800*    BOTH THE COMPILE AND OBJECT TIME DEBUGGING SWITCHES ARE      DB1014.2
   000029         002900*    TURNED ON.  THE PROGRAM CONTAINS BOTH DEBUG LINES AND SIMPLE DB1014.2
   000030         003000*    DEBUGGING PROCEDURES.  THE DEBUGGING PROCEDURES ARE SPECI-   DB1014.2
   000031         003100*    FIED FOR PROCEDURE-NAMES AND PROCEDURE-NAME SERIES.  THE     DB1014.2
   000032         003200*    FOLLOWING CONDITIONS ARE EVALUATED FOR THE "DEBUG-ITEM"      DB1014.2
   000033         003300*    REGISTER                                                     DB1014.2
   000034         003400*                                                                 DB1014.2
   000035         003500*        (1)  START OF PROGRAM                                    DB1014.2
   000036         003600*        (2)  REFERENCE BY "ALTER"                                DB1014.2
   000037         003700*        (3)  REFERENCE BY "GO TO"                                DB1014.2
   000038         003800*        (4)  REFERENCE BY "PERFORM"                              DB1014.2
   000039         003900*        (5)  SEQUENTIAL PASSAGE OF CONTROL  (FALL THROUGH)       DB1014.2
   000040         004000*                                                                 DB1014.2
   000041         004100*    BEFORE BEGINNING EXECUTION OF THE OBJECT PROGRAM,            DB1014.2
   000042         004200*    WHATEVER JOB CONTROL LANGUAGE IS NECESSARY TO ACTIVATE       DB1014.2
   000043         004300*    (TURN ON) THE OBJECT TIME DEBUGGING SWITCH SHOULD BE         DB1014.2
   000044         004400*    SUBMITTED.                                                   DB1014.2
   000045         004500*                                                                 DB1014.2
   000046         004600*                                                                 DB1014.2
   000047         004700*                                                                 DB1014.2
   000048         004800*                                                                 DB1014.2
   000049         004900 ENVIRONMENT DIVISION.                                            DB1014.2
   000050         005000 CONFIGURATION SECTION.                                           DB1014.2
   000051         005100 SOURCE-COMPUTER.                                                 DB1014.2
   000052         005200     XXXXX082                                                     DB1014.2
   000053         005300         WITH DEBUGGING MODE.                                     DB1014.2
   000054         005400 OBJECT-COMPUTER.                                                 DB1014.2
   000055         005500     XXXXX083.                                                    DB1014.2
   000056         005600 INPUT-OUTPUT SECTION.                                            DB1014.2
   000057         005700 FILE-CONTROL.                                                    DB1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         005800     SELECT PRINT-FILE ASSIGN TO                                  DB1014.2 62
   000059         005900     XXXXX055.                                                    DB1014.2
   000060         006000 DATA DIVISION.                                                   DB1014.2
   000061         006100 FILE SECTION.                                                    DB1014.2
   000062         006200 FD  PRINT-FILE                                                   DB1014.2

 ==000062==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000063         006300*    LABEL RECORDS                                                DB1014.2
   000064         006400*    XXXXX084                                                     DB1014.2
   000065         006500     DATA RECORD IS PRINT-REC DUMMY-RECORD.                       DB1014.2 * *
   000066         006600 01  PRINT-REC PICTURE X(120).                                    DB1014.2
   000067         006700 01  DUMMY-RECORD PICTURE X(120).                                 DB1014.2
   000068         006800 WORKING-STORAGE SECTION.                                         DB1014.2
   000069         006900 77  A PIC 9 COMP VALUE 1.                                        DB1014.2
   000070         007000 77  B PIC 9 COMP VALUE 5.                                        DB1014.2
   000071         007100 77  C PIC 9 COMP VALUE 9.                                        DB1014.2
   000072         007200 77  D PIC 99 COMP.                                               DB1014.2
   000073         007300 77  RESULT-FLAG PIC 99 VALUE 0.                                  DB1014.2
   000074         007400 77  DBLINE-HOLD PIC X(6).                                        DB1014.2
   000075         007500 77  DBNAME-HOLD PIC X(30).                                       DB1014.2
   000076         007600 77  DBCONT-HOLD PIC X(30).                                       DB1014.2
   000077         007700 77  FIVE PIC 9 COMP VALUE 5.                                     DB1014.2
   000078         007800 01  SIZE-19.                                                     DB1014.2
   000079         007900     02  FILLER PIC X.                                            DB1014.2
   000080         008000     02  SIZE-18.                                                 DB1014.2
   000081         008100         03  FILLER PIC X.                                        DB1014.2
   000082         008200         03  SIZE-17.                                             DB1014.2
   000083         008300             04  FILLER PIC X.                                    DB1014.2
   000084         008400             04  SIZE-16.                                         DB1014.2
   000085         008500                 05  FILLER PIC X.                                DB1014.2
   000086         008600                 05  SIZE-15.                                     DB1014.2
   000087         008700                     06  FILLER PIC X.                            DB1014.2
   000088         008800                     06  SIZE-14.                                 DB1014.2
   000089         008900                         07  FILLER PIC X.                        DB1014.2
   000090         009000                         07  SIZE-13.                             DB1014.2
   000091         009100                             08  FILLER PIC X.                    DB1014.2
   000092         009200                             08  SIZE-12.                         DB1014.2
   000093         009300                                 09  FILLER PIC XX.               DB1014.2
   000094         009400                                 09  SIZE-10.                     DB1014.2
   000095         009500                                     10  FILLER PICTURE X(5).     DB1014.2
   000096         009600                                     10  SIZE-5 PICTURE X(5).     DB1014.2
   000097         009700 01  TEST-RESULTS.                                                DB1014.2
   000098         009800     02 FILLER                    PICTURE X VALUE SPACE.          DB1014.2 IMP
   000099         009900     02 FEATURE                   PICTURE X(20) VALUE SPACE.      DB1014.2 IMP
   000100         010000     02 FILLER                    PICTURE X VALUE SPACE.          DB1014.2 IMP
   000101         010100     02 P-OR-F                    PICTURE X(5) VALUE SPACE.       DB1014.2 IMP
   000102         010200     02 FILLER                    PICTURE X  VALUE SPACE.         DB1014.2 IMP
   000103         010300     02  PAR-NAME.                                                DB1014.2
   000104         010400       03 FILLER PICTURE X(12) VALUE SPACE.                       DB1014.2 IMP
   000105         010500       03  PARDOT-X PICTURE X  VALUE SPACE.                       DB1014.2 IMP
   000106         010600       03 DOTVALUE PICTURE 99  VALUE ZERO.                        DB1014.2 IMP
   000107         010700       03 FILLER PIC X(5) VALUE SPACE.                            DB1014.2 IMP
   000108         010800     02 FILLER PIC X(10) VALUE SPACE.                             DB1014.2 IMP
   000109         010900     02 RE-MARK PIC X(61).                                        DB1014.2
   000110         011000 01  TEST-COMPUTED.                                               DB1014.2
   000111         011100     02 FILLER PIC X(30) VALUE SPACE.                             DB1014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011200     02 FILLER PIC X(17) VALUE "       COMPUTED=".                DB1014.2
   000113         011300     02 COMPUTED-X.                                               DB1014.2
   000114         011400     03 COMPUTED-A                PICTURE X(20) VALUE SPACE.      DB1014.2 IMP
   000115         011500     03 COMPUTED-N REDEFINES COMPUTED-A PICTURE -9(9).9(9).       DB1014.2 114
   000116         011600     03 COMPUTED-0V18 REDEFINES COMPUTED-A  PICTURE -.9(18).      DB1014.2 114
   000117         011700     03 COMPUTED-4V14 REDEFINES COMPUTED-A  PICTURE -9(4).9(14).  DB1014.2 114
   000118         011800     03 COMPUTED-14V4 REDEFINES COMPUTED-A  PICTURE -9(14).9(4).  DB1014.2 114
   000119         011900     03       CM-18V0 REDEFINES COMPUTED-A.                       DB1014.2 114
   000120         012000         04 COMPUTED-18V0                   PICTURE -9(18).       DB1014.2
   000121         012100         04 FILLER                          PICTURE X.            DB1014.2
   000122         012200     03 FILLER PIC X(50) VALUE SPACE.                             DB1014.2 IMP
   000123         012300 01  TEST-CORRECT.                                                DB1014.2
   000124         012400     02 FILLER PIC X(30) VALUE SPACE.                             DB1014.2 IMP
   000125         012500     02 FILLER PIC X(17) VALUE "       CORRECT =".                DB1014.2
   000126         012600     02 CORRECT-X.                                                DB1014.2
   000127         012700     03 CORRECT-A                 PICTURE X(20) VALUE SPACE.      DB1014.2 IMP
   000128         012800     03 CORRECT-N REDEFINES CORRECT-A PICTURE -9(9).9(9).         DB1014.2 127
   000129         012900     03 CORRECT-0V18 REDEFINES CORRECT-A    PICTURE -.9(18).      DB1014.2 127
   000130         013000     03 CORRECT-4V14 REDEFINES CORRECT-A    PICTURE -9(4).9(14).  DB1014.2 127
   000131         013100     03 CORRECT-14V4 REDEFINES CORRECT-A    PICTURE -9(14).9(4).  DB1014.2 127
   000132         013200     03      CR-18V0 REDEFINES CORRECT-A.                         DB1014.2 127
   000133         013300         04 CORRECT-18V0                    PICTURE -9(18).       DB1014.2
   000134         013400         04 FILLER                          PICTURE X.            DB1014.2
   000135         013500     03 FILLER PIC X(50) VALUE SPACE.                             DB1014.2 IMP
   000136         013600 01  CCVS-C-1.                                                    DB1014.2
   000137         013700     02 FILLER PICTURE    X(99) VALUE IS " FEATURE              PADB1014.2
   000138         013800-    "SS  PARAGRAPH-NAME                                          DB1014.2
   000139         013900-    "        REMARKS".                                           DB1014.2
   000140         014000     02 FILLER PICTURE    X(20) VALUE IS SPACE.                   DB1014.2 IMP
   000141         014100 01  CCVS-C-2.                                                    DB1014.2
   000142         014200     02 FILLER PICTURE    X VALUE IS SPACE.                       DB1014.2 IMP
   000143         014300     02 FILLER PICTURE    X(6) VALUE IS "TESTED".                 DB1014.2
   000144         014400     02 FILLER PICTURE    X(15) VALUE IS SPACE.                   DB1014.2 IMP
   000145         014500     02 FILLER PICTURE    X(4) VALUE IS "FAIL".                   DB1014.2
   000146         014600     02 FILLER PICTURE    X(94) VALUE IS SPACE.                   DB1014.2 IMP
   000147         014700 01  REC-SKL-SUB PICTURE 9(2) VALUE ZERO.                         DB1014.2 IMP
   000148         014800 01  REC-CT PICTURE 99 VALUE ZERO.                                DB1014.2 IMP
   000149         014900 01  DELETE-CNT                   PICTURE 999  VALUE ZERO.        DB1014.2 IMP
   000150         015000 01  ERROR-COUNTER PICTURE   999 VALUE IS ZERO.                   DB1014.2 IMP
   000151         015100 01  INSPECT-COUNTER PIC 999 VALUE ZERO.                          DB1014.2 IMP
   000152         015200 01  PASS-COUNTER PIC 999 VALUE ZERO.                             DB1014.2 IMP
   000153         015300 01  TOTAL-ERROR PIC 999 VALUE ZERO.                              DB1014.2 IMP
   000154         015400 01  ERROR-HOLD PIC 999 VALUE ZERO.                               DB1014.2 IMP
   000155         015500 01  DUMMY-HOLD PIC X(120) VALUE SPACE.                           DB1014.2 IMP
   000156         015600 01  RECORD-COUNT PIC 9(5) VALUE ZERO.                            DB1014.2 IMP
   000157         015700 01  CCVS-H-1.                                                    DB1014.2
   000158         015800     02  FILLER   PICTURE X(27)  VALUE SPACE.                     DB1014.2 IMP
   000159         015900     02 FILLER PICTURE X(67) VALUE                                DB1014.2
   000160         016000     " FEDERAL COMPILER TESTING CENTER COBOL COMPILER VALIDATION  DB1014.2
   000161         016100-    " SYSTEM".                                                   DB1014.2
   000162         016200     02  FILLER     PICTURE X(26)  VALUE SPACE.                   DB1014.2 IMP
   000163         016300 01  CCVS-H-2.                                                    DB1014.2
   000164         016400     02 FILLER PICTURE X(52) VALUE IS                             DB1014.2
   000165         016500     "CCVS74 NCC  COPY, NOT FOR DISTRIBUTION.".                   DB1014.2
   000166         016600     02 FILLER PICTURE    X(19) VALUE IS "TEST RESULTS SET-  ".   DB1014.2
   000167         016700     02 TEST-ID PICTURE    X(9).                                  DB1014.2
   000168         016800     02 FILLER PICTURE    X(40) VALUE IS SPACE.                   DB1014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         016900 01  CCVS-H-3.                                                    DB1014.2
   000170         017000     02  FILLER PICTURE X(34) VALUE                               DB1014.2
   000171         017100     " FOR OFFICIAL USE ONLY    ".                                DB1014.2
   000172         017200     02  FILLER PICTURE X(58) VALUE                               DB1014.2
   000173         017300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".DB1014.2
   000174         017400     02  FILLER PICTURE X(28) VALUE                               DB1014.2
   000175         017500     "  COPYRIGHT   1974 ".                                       DB1014.2
   000176         017600 01  CCVS-E-1.                                                    DB1014.2
   000177         017700     02 FILLER PICTURE    X(52) VALUE IS SPACE.                   DB1014.2 IMP
   000178         017800     02 FILLER PICTURE    X(14) VALUE IS "END OF TEST-  ".        DB1014.2
   000179         017900     02 ID-AGAIN PICTURE    X(9).                                 DB1014.2
   000180         018000     02 FILLER PICTURE X(45) VALUE IS                             DB1014.2
   000181         018100     " NTIS DISTRIBUTION COBOL 74".                               DB1014.2
   000182         018200 01  CCVS-E-2.                                                    DB1014.2
   000183         018300     02  FILLER                   PICTURE X(31)  VALUE            DB1014.2
   000184         018400     SPACE.                                                       DB1014.2 IMP
   000185         018500     02  FILLER                   PICTURE X(21)  VALUE SPACE.     DB1014.2 IMP
   000186         018600     02 CCVS-E-2-2.                                               DB1014.2
   000187         018700         03 ERROR-TOTAL PICTURE    XXX VALUE IS SPACE.            DB1014.2 IMP
   000188         018800         03 FILLER PICTURE    X VALUE IS SPACE.                   DB1014.2 IMP
   000189         018900         03 ENDER-DESC PIC X(44) VALUE "ERRORS ENCOUNTERED".      DB1014.2
   000190         019000 01  CCVS-E-3.                                                    DB1014.2
   000191         019100     02  FILLER PICTURE X(22) VALUE                               DB1014.2
   000192         019200     " FOR OFFICIAL USE ONLY".                                    DB1014.2
   000193         019300     02  FILLER PICTURE X(12) VALUE SPACE.                        DB1014.2 IMP
   000194         019400     02  FILLER PICTURE X(58) VALUE                               DB1014.2
   000195         019500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".DB1014.2
   000196         019600     02  FILLER PICTURE X(13) VALUE SPACE.                        DB1014.2 IMP
   000197         019700     02 FILLER PIC X(15) VALUE " COPYRIGHT 1974".                 DB1014.2
   000198         019800 01  CCVS-E-4.                                                    DB1014.2
   000199         019900     02 CCVS-E-4-1 PIC XXX VALUE SPACE.                           DB1014.2 IMP
   000200         020000     02 FILLER PIC XXXX VALUE " OF ".                             DB1014.2
   000201         020100     02 CCVS-E-4-2 PIC XXX VALUE SPACE.                           DB1014.2 IMP
   000202         020200     02 FILLER PIC X(40) VALUE                                    DB1014.2
   000203         020300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       DB1014.2
   000204         020400 01  XXINFO.                                                      DB1014.2
   000205         020500     02 FILLER PIC X(30) VALUE "        *** INFORMATION  ***".    DB1014.2
   000206         020600     02 INFO-TEXT.                                                DB1014.2
   000207         020700     04 FILLER PIC X(20) VALUE SPACE.                             DB1014.2 IMP
   000208         020800     04 XXCOMPUTED PIC X(20).                                     DB1014.2
   000209         020900     04 FILLER PIC X(5) VALUE SPACE.                              DB1014.2 IMP
   000210         021000     04 XXCORRECT PIC X(20).                                      DB1014.2
   000211         021100 01  HYPHEN-LINE.                                                 DB1014.2
   000212         021200     02 FILLER PICTURE IS X VALUE IS SPACE.                       DB1014.2 IMP
   000213         021300     02 FILLER PICTURE IS X(65) VALUE IS "************************DB1014.2
   000214         021400-    "*****************************************".                 DB1014.2
   000215         021500     02 FILLER PICTURE IS X(54) VALUE IS "************************DB1014.2
   000216         021600-    "******************************".                            DB1014.2
   000217         021700 01  CCVS-PGM-ID PIC X(6) VALUE                                   DB1014.2
   000218         021800     "DB101A".                                                    DB1014.2
   000219         021900 PROCEDURE DIVISION.                                              DB1014.2
   000220         022000 DECLARATIVES.                                                    DB1014.2
   000221         022100 START-UP SECTION.                                                DB1014.2
   000222         022200     USE FOR DEBUGGING ON CCVS1.                                  DB1014.2 260
   000223         022300 BEGIN-START-UP.                                                  DB1014.2
   000224         022400     MOVE 1 TO RESULT-FLAG.                                       DB1014.2 73
   000225         022500 DB-COMMON.                                                       DB1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022600     MOVE DEBUG-LINE TO DBLINE-HOLD.                              DB1014.2 IMP 74
   000227         022700     MOVE DEBUG-NAME TO DBNAME-HOLD.                              DB1014.2 IMP 75
   000228         022800     MOVE DEBUG-CONTENTS TO DBCONT-HOLD.                          DB1014.2 IMP 76
   000229         022900 FALL-THROUGH-AND-SERIES SECTION.                                 DB1014.2
   000230         023000     USE FOR DEBUGGING ON FALL-THROUGH-TEST                       DB1014.2
   000231         023100              PROC-SERIES-TEST.                                   DB1014.2 405 442
   000232         023200 BEGIN-FALL-THROUGH-AND-SERIES.                                   DB1014.2
   000233         023300     PERFORM DB-COMMON.                                           DB1014.2 225
   000234         023400     MOVE 2 TO RESULT-FLAG.                                       DB1014.2 73
   000235         023500 GO-TO SECTION.                                                   DB1014.2
   000236         023600     USE FOR DEBUGGING ON GO-TO-TEST.                             DB1014.2 485
   000237         023700 BEGIN-GO-TO.                                                     DB1014.2
   000238         023800     PERFORM DB-COMMON.                                           DB1014.2 225
   000239         023900     MOVE 3 TO RESULT-FLAG.                                       DB1014.2 73
   000240         024000 ALTER-PARAGRAPH SECTION.                                         DB1014.2
   000241         024100     USE FOR DEBUGGING ON ALTERABLE-PARAGRAPH.                    DB1014.2 479
   000242         024200 BEGIN-ALTER-PARAGRAPH.                                           DB1014.2
   000243         024300     PERFORM DB-COMMON.                                           DB1014.2 225
   000244         024400     MOVE 4 TO RESULT-FLAG.                                       DB1014.2 73
   000245         024500 LOOP-ITERATION SECTION.                                          DB1014.2
   000246         024600     USE FOR DEBUGGING ON LOOP-ROUTINE.                           DB1014.2 645
   000247         024700 BEGIN-LOOP-ITERATION.                                            DB1014.2
   000248         024800     PERFORM DB-COMMON.                                           DB1014.2 225
   000249         024900     ADD 1 TO RESULT-FLAG.                                        DB1014.2 73
   000250         025000 PERFORM-THRU SECTION.                                            DB1014.2
   000251         025100     USE FOR DEBUGGING ON DO-NOTHING-1.                           DB1014.2 654
   000252         025200 BEGIN-PERFORM-THRU.                                              DB1014.2
   000253         025300     PERFORM DB-COMMON.                                           DB1014.2 225
   000254         025400     ADD 1 TO RESULT-FLAG.                                        DB1014.2 73
   000255         025500 END DECLARATIVES.                                                DB1014.2
   000256         025700*    THE DEBUG-LINE (INSPT) SUBTEST FOR THE TEST NAMED IN THE    *DB1014.2
   000257         025800*    OUTPUT REPORT AS "START-PROGRAM-TEST" SHOULD POINT TO THE   *DB1014.2
   000258         025900*    EXECUTABLE STATEMENT WHICH FOLLOWS THIS COMMENT SET AND     *DB1014.2
   000259         026000*    WHICH READS, "OPEN OUTPUT PRINT-FILE."                      *DB1014.2
   000260         026200 CCVS1 SECTION.                                                   DB1014.2
   000261         026300 OPEN-FILES.                                                      DB1014.2
   000262         026400     OPEN     OUTPUT PRINT-FILE.                                  DB1014.2 62
   000263         026500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   DB1014.2 217 167 217 179
   000264         026600     MOVE    SPACE TO TEST-RESULTS.                               DB1014.2 IMP 97
   000265         026700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             DB1014.2 290 294
   000266         026800     GO TO CCVS1-EXIT.                                            DB1014.2 365
   000267         026900 CLOSE-FILES.                                                     DB1014.2
   000268         027000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   DB1014.2 298 319 62
   000269         027100 TERMINATE-CCVS.                                                  DB1014.2
   000270         027200     EXIT PROGRAM.                                                DB1014.2
   000271         027300 TERMINATE-CALL.                                                  DB1014.2
   000272         027400     STOP     RUN.                                                DB1014.2
   000273         027500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         DB1014.2 101 151
   000274         027600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           DB1014.2 101 152
   000275         027700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          DB1014.2 101 150
   000276         027800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.          DB1014.2 101 149
   000277         027900     MOVE "****TEST DELETED****" TO RE-MARK.                      DB1014.2 109
   000278         028000 PRINT-DETAIL.                                                    DB1014.2
   000279         028100     IF REC-CT NOT EQUAL TO ZERO                                  DB1014.2 148 IMP
   000280      1  028200             MOVE "." TO PARDOT-X                                 DB1014.2 105
   000281      1  028300             MOVE REC-CT TO DOTVALUE.                             DB1014.2 148 106
   000282         028400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      DB1014.2 97 66 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               DB1014.2 101 331
   000284      1  028600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 DB1014.2 348 357
   000285      1  028700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 DB1014.2 358 364
   000286         028800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              DB1014.2 IMP 101 IMP 113
   000287         028900     MOVE SPACE TO CORRECT-X.                                     DB1014.2 IMP 126
   000288         029000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         DB1014.2 148 IMP IMP 103
   000289         029100     MOVE     SPACE TO RE-MARK.                                   DB1014.2 IMP 109
   000290         029200 HEAD-ROUTINE.                                                    DB1014.2
   000291         029300     MOVE CCVS-H-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1014.2 157 67 331
   000292         029400     MOVE CCVS-H-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.   DB1014.2 163 67 331
   000293         029500     MOVE CCVS-H-3 TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.   DB1014.2 169 67 331
   000294         029600 COLUMN-NAMES-ROUTINE.                                            DB1014.2
   000295         029700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1014.2 136 67 331
   000296         029800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1014.2 141 67 331
   000297         029900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        DB1014.2 211 67 331
   000298         030000 END-ROUTINE.                                                     DB1014.2
   000299         030100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.DB1014.2 211 67 331
   000300         030200 END-RTN-EXIT.                                                    DB1014.2
   000301         030300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1014.2 176 67 331
   000302         030400 END-ROUTINE-1.                                                   DB1014.2
   000303         030500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      DB1014.2 150 154 151
   000304         030600      ERROR-HOLD. ADD DELETE-CNT TO ERROR-HOLD.                   DB1014.2 154 149 154
   000305         030700      ADD PASS-COUNTER TO ERROR-HOLD.                             DB1014.2 152 154
   000306         030800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   DB1014.2
   000307         030900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            DB1014.2 152 199
   000308         031000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              DB1014.2 154 201
   000309         031100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                DB1014.2 198 186
   000310         031200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           DB1014.2 182 67 331
   000311         031300  END-ROUTINE-12.                                                 DB1014.2
   000312         031400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        DB1014.2 189
   000313         031500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      DB1014.2 150 IMP
   000314      1  031600         MOVE "NO " TO ERROR-TOTAL                                DB1014.2 187
   000315         031700         ELSE                                                     DB1014.2
   000316      1  031800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       DB1014.2 150 187
   000317         031900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           DB1014.2 182 67
   000318         032000     PERFORM WRITE-LINE.                                          DB1014.2 331
   000319         032100 END-ROUTINE-13.                                                  DB1014.2
   000320         032200     IF DELETE-CNT IS EQUAL TO ZERO                               DB1014.2 149 IMP
   000321      1  032300         MOVE "NO " TO ERROR-TOTAL  ELSE                          DB1014.2 187
   000322      1  032400         MOVE DELETE-CNT TO ERROR-TOTAL.                          DB1014.2 149 187
   000323         032500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   DB1014.2 189
   000324         032600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1014.2 182 67 331
   000325         032700      IF   INSPECT-COUNTER EQUAL TO ZERO                          DB1014.2 151 IMP
   000326      1  032800          MOVE "NO " TO ERROR-TOTAL                               DB1014.2 187
   000327      1  032900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   DB1014.2 151 187
   000328         033000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            DB1014.2 189
   000329         033100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          DB1014.2 182 67 331
   000330         033200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1014.2 190 67 331
   000331         033300 WRITE-LINE.                                                      DB1014.2
   000332         033400     ADD 1 TO RECORD-COUNT.                                       DB1014.2 156
   000333         033500     IF RECORD-COUNT GREATER 50                                   DB1014.2 156
   000334      1  033600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          DB1014.2 67 155
   000335      1  033700         MOVE SPACE TO DUMMY-RECORD                               DB1014.2 IMP 67
   000336      1  033800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  DB1014.2 67
   000337      1  033900         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             DB1014.2 136 67 343
   000338      1  034000         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     DB1014.2 141 67 343
   000339      1  034100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          DB1014.2 211 67 343
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340      1  034200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          DB1014.2 155 67
   000341      1  034300         MOVE ZERO TO RECORD-COUNT.                               DB1014.2 IMP 156
   000342         034400     PERFORM WRT-LN.                                              DB1014.2 343
   000343         034500 WRT-LN.                                                          DB1014.2
   000344         034600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               DB1014.2 67
   000345         034700     MOVE SPACE TO DUMMY-RECORD.                                  DB1014.2 IMP 67
   000346         034800 BLANK-LINE-PRINT.                                                DB1014.2
   000347         034900     PERFORM WRT-LN.                                              DB1014.2 343
   000348         035000 FAIL-ROUTINE.                                                    DB1014.2
   000349         035100     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.   DB1014.2 113 IMP 354
   000350         035200     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.    DB1014.2 126 IMP 354
   000351         035300     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    DB1014.2 206
   000352         035400     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     DB1014.2 204 67 331
   000353         035500     GO TO FAIL-ROUTINE-EX.                                       DB1014.2 357
   000354         035600 FAIL-ROUTINE-WRITE.                                              DB1014.2
   000355         035700     MOVE TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE           DB1014.2 110 66 331
   000356         035800     MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES.   DB1014.2 123 66 331
   000357         035900 FAIL-ROUTINE-EX. EXIT.                                           DB1014.2
   000358         036000 BAIL-OUT.                                                        DB1014.2
   000359         036100     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.       DB1014.2 114 IMP 361
   000360         036200     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.               DB1014.2 127 IMP 364
   000361         036300 BAIL-OUT-WRITE.                                                  DB1014.2
   000362         036400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  DB1014.2 127 210 114 208
   000363         036500     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     DB1014.2 204 67 331
   000364         036600 BAIL-OUT-EX. EXIT.                                               DB1014.2
   000365         036700 CCVS1-EXIT.                                                      DB1014.2
   000366         036800     EXIT.                                                        DB1014.2
   000367         036900 START-PROGRAM-TEST.                                              DB1014.2
   000368         037000     IF RESULT-FLAG IS NOT EQUAL TO 1                             DB1014.2 73
   000369      1  037100         MOVE "USE PROCEDURE NOT EXECUTED" TO RE-MARK             DB1014.2 109
   000370      1  037200         PERFORM FAIL                                             DB1014.2 275
   000371      1  037300         GO TO START-PROGRAM-WRITE.                               DB1014.2 396
   000372         037400     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1014.2 109
   000373         037500     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1014.2 127
   000374         037600     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1014.2 74 114
   000375         037700     PERFORM INSPT.                                               DB1014.2 273
   000376         037800     PERFORM START-PROGRAM-WRITE.                                 DB1014.2 396
   000377         037900     MOVE DBNAME-HOLD TO SIZE-5.                                  DB1014.2 75 96
   000378         038000     IF SIZE-5 IS EQUAL TO "CCVS1"                                DB1014.2 96
   000379      1  038100         PERFORM PASS  ELSE                                       DB1014.2 274
   000380      1  038200         MOVE "CCVS1" TO CORRECT-A                                DB1014.2 127
   000381      1  038300         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1014.2 75 114
   000382      1  038400         PERFORM FAIL.                                            DB1014.2 275
   000383         038500 START-PROGRAM-TEST-1.                                            DB1014.2
   000384         038600     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1014.2 109
   000385         038700     PERFORM START-PROGRAM-WRITE.                                 DB1014.2 396
   000386         038800     MOVE DBCONT-HOLD TO SIZE-13.                                 DB1014.2 76 90
   000387         038900     IF SIZE-13 IS EQUAL TO "START PROGRAM"                       DB1014.2 90
   000388      1  039000         PERFORM PASS ELSE                                        DB1014.2 274
   000389      1  039100         MOVE "START PROGRAM" TO CORRECT-A                        DB1014.2 127
   000390      1  039200         MOVE DBCONT-HOLD TO COMPUTED-A                           DB1014.2 76 114
   000391      1  039300         PERFORM FAIL.                                            DB1014.2 275
   000392         039400     MOVE "DEBUG-CONTENTS" TO RE-MARK.                            DB1014.2 109
   000393         039500     GO TO START-PROGRAM-WRITE.                                   DB1014.2 396
   000394         039600 START-PROGRAM-DELETE.                                            DB1014.2
   000395         039700     PERFORM DE-LETE.                                             DB1014.2 276
   000396         039800 START-PROGRAM-WRITE.                                             DB1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         039900     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1014.2 99
   000398         040000     MOVE "START-PROGRAM-TEST" TO PAR-NAME.                       DB1014.2 103
   000399         040100     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000400         040300*    THE DEBUG-LINE (INSPT) SUBTEST FOR THE TEST NAMED IN THE    *DB1014.2
   000401         040400*    OUTPUT REPORT AS "FALL-THROUGH-TEST" SHOULD POINT TO THE    *DB1014.2
   000402         040500*    EXECUTABLE STATEMENT WHICH FOLLOWS THIS COMMENT SET AND     *DB1014.2
   000403         040600*    WHICH READS, "MOVE 0 TO RESULT-FLAG."                       *DB1014.2
   000404         040800     MOVE 0 TO RESULT-FLAG.                                       DB1014.2 73
   000405         040900 FALL-THROUGH-TEST.                                               DB1014.2
   000406         041000     IF RESULT-FLAG IS NOT EQUAL TO 2                             DB1014.2 73
   000407      1  041100         MOVE "USE PROCEDURE NOT EXECUTED" TO RE-MARK             DB1014.2 109
   000408      1  041200         PERFORM FAIL                                             DB1014.2 275
   000409      1  041300         GO TO FALL-THROUGH-WRITE.                                DB1014.2 433
   000410         041400     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1014.2 109
   000411         041500     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1014.2 127
   000412         041600     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1014.2 74 114
   000413         041700     PERFORM INSPT.                                               DB1014.2 273
   000414         041800     PERFORM FALL-THROUGH-WRITE.                                  DB1014.2 433
   000415         041900     MOVE DBNAME-HOLD TO SIZE-17.                                 DB1014.2 75 82
   000416         042000     IF SIZE-17 IS EQUAL TO "FALL-THROUGH-TEST"                   DB1014.2 82
   000417      1  042100         PERFORM PASS ELSE                                        DB1014.2 274
   000418      1  042200         MOVE "FALL-THROUGH-TEST" TO CORRECT-A                    DB1014.2 127
   000419      1  042300         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1014.2 75 114
   000420      1  042400         PERFORM FAIL.                                            DB1014.2 275
   000421         042500     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1014.2 109
   000422         042600     PERFORM FALL-THROUGH-WRITE.                                  DB1014.2 433
   000423         042700     MOVE DBCONT-HOLD TO SIZE-12.                                 DB1014.2 76 92
   000424         042800     IF SIZE-12 IS EQUAL TO "FALL THROUGH"                        DB1014.2 92
   000425      1  042900         PERFORM PASS ELSE                                        DB1014.2 274
   000426      1  043000         MOVE "FALL THROUGH" TO CORRECT-A                         DB1014.2 127
   000427      1  043100         MOVE DBCONT-HOLD TO COMPUTED-A                           DB1014.2 76 114
   000428      1  043200         PERFORM FAIL.                                            DB1014.2 275
   000429         043300     MOVE "DEBUG-CONTENTS" TO RE-MARK.                            DB1014.2 109
   000430         043400     GO TO FALL-THROUGH-WRITE.                                    DB1014.2 433
   000431         043500 FALL-THROUGH-DELETE.                                             DB1014.2
   000432         043600     PERFORM DE-LETE.                                             DB1014.2 276
   000433         043700 FALL-THROUGH-WRITE.                                              DB1014.2
   000434         043800     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1014.2 99
   000435         043900     MOVE "FALL-THROUGH-TEST" TO PAR-NAME.                        DB1014.2 103
   000436         044000     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000437         044200*    THE DEBUG-LINE (INSPT) SUBTEST FOR THE TEST NAMED IN THE    *DB1014.2
   000438         044300*    OUTPUT REPORT AS "PROC-SERIES-TEST" SHOULD POINT TO THE     *DB1014.2
   000439         044400*    EXECUTABLE STATEMENT WHICH FOLLOWS THIS COMMENT SET AND     *DB1014.2
   000440         044500*    WHICH READS, "MOVE 0 TO RESULT-FLAG."                       *DB1014.2
   000441         044700     MOVE 0 TO RESULT-FLAG.                                       DB1014.2 73
   000442         044800 PROC-SERIES-TEST.                                                DB1014.2
   000443         044900     IF RESULT-FLAG IS NOT EQUAL TO 2                             DB1014.2 73
   000444      1  045000         MOVE "USE PROCEDURE NOT EXECUTED" TO RE-MARK             DB1014.2 109
   000445      1  045100         PERFORM FAIL                                             DB1014.2 275
   000446      1  045200         GO TO PROC-SERIES-WRITE.                                 DB1014.2 470
   000447         045300     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1014.2 109
   000448         045400     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1014.2 127
   000449         045500     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1014.2 74 114
   000450         045600     PERFORM INSPT.                                               DB1014.2 273
   000451         045700     PERFORM PROC-SERIES-WRITE.                                   DB1014.2 470
   000452         045800     MOVE DBNAME-HOLD TO SIZE-16.                                 DB1014.2 75 84
   000453         045900     IF SIZE-16 IS EQUAL TO "PROC-SERIES-TEST"                    DB1014.2 84
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  046000         PERFORM PASS ELSE                                        DB1014.2 274
   000455      1  046100         MOVE "PROC-SERIES-TEST" TO CORRECT-A                     DB1014.2 127
   000456      1  046200         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1014.2 75 114
   000457      1  046300         PERFORM FAIL.                                            DB1014.2 275
   000458         046400     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1014.2 109
   000459         046500     PERFORM PROC-SERIES-WRITE.                                   DB1014.2 470
   000460         046600     MOVE DBCONT-HOLD TO SIZE-12.                                 DB1014.2 76 92
   000461         046700     IF SIZE-12 IS EQUAL TO "FALL THROUGH"                        DB1014.2 92
   000462      1  046800         PERFORM PASS ELSE                                        DB1014.2 274
   000463      1  046900         MOVE "FALL THROUGH" TO CORRECT-A                         DB1014.2 127
   000464      1  047000         MOVE DBCONT-HOLD TO COMPUTED-A                           DB1014.2 76 114
   000465      1  047100         PERFORM FAIL.                                            DB1014.2 275
   000466         047200     MOVE "DEBUG-CONTENTS" TO RE-MARK.                            DB1014.2 109
   000467         047300     GO TO PROC-SERIES-WRITE.                                     DB1014.2 470
   000468         047400 PROC-SERIES-DELETE.                                              DB1014.2
   000469         047500     PERFORM DE-LETE.                                             DB1014.2 276
   000470         047600 PROC-SERIES-WRITE.                                               DB1014.2
   000471         047700     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1014.2 99
   000472         047800     MOVE "PROC-SERIES-TEST" TO PAR-NAME.                         DB1014.2 103
   000473         047900     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000474         048000     MOVE 0 TO RESULT-FLAG.                                       DB1014.2 73
   000475         048200*    THE DEBUG-LINE (INSPT) SUBTEST FOR THE TEST NAMED IN THE    *DB1014.2
   000476         048300*    OUTPUT REPORT AS "GO-TO-TEST" SHOULD POINT TO THE           *DB1014.2
   000477         048400*    EXECUTABLE STATEMENT WHICH FOLLOWS THIS COMMENT SET AND     *DB1014.2
   000478         048500*    WHICH READS, "GO TO GO-TO-TEST.".                           *DB1014.2
   000479         048700 ALTERABLE-PARAGRAPH.                                             DB1014.2
   000480         048800     GO TO GO-TO-TEST.                                            DB1014.2 485
   000481         048900 FILLER-PARAGRAPH.                                                DB1014.2
   000482         049000     DISPLAY "ALTER FAILED AT ALTER-TEST-INIT".                   DB1014.2
   000483         049100     PERFORM FAIL.                                                DB1014.2 275
   000484         049200     GO TO ALTERED-GO-TO-TEST.                                    DB1014.2 565
   000485         049300 GO-TO-TEST.                                                      DB1014.2
   000486         049400     IF RESULT-FLAG IS NOT EQUAL TO 3                             DB1014.2 73
   000487      1  049500         MOVE "USE PROCEDURE NOT EXECUTED" TO RE-MARK             DB1014.2 109
   000488      1  049600         PERFORM FAIL                                             DB1014.2 275
   000489      1  049700         GO TO GO-TO-WRITE.                                       DB1014.2 514
   000490         049800     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1014.2 109
   000491         049900     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1014.2 127
   000492         050000     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1014.2 74 114
   000493         050100     PERFORM INSPT.                                               DB1014.2 273
   000494         050200     PERFORM GO-TO-WRITE.                                         DB1014.2 514
   000495         050300     MOVE DBNAME-HOLD TO SIZE-10.                                 DB1014.2 75 94
   000496         050400     IF SIZE-10 IS EQUAL TO "GO-TO-TEST"                          DB1014.2 94
   000497      1  050500         PERFORM PASS ELSE                                        DB1014.2 274
   000498      1  050600         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1014.2 75 114
   000499      1  050700         MOVE "GO-TO-TEST" TO CORRECT-A                           DB1014.2 127
   000500      1  050800         PERFORM FAIL.                                            DB1014.2 275
   000501         050900     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1014.2 109
   000502         051000     PERFORM GO-TO-WRITE.                                         DB1014.2 514
   000503         051100     MOVE DBCONT-HOLD TO SIZE-12.                                 DB1014.2 76 92
   000504         051200     IF       SIZE-12 IS EQUAL TO SPACE                           DB1014.2 92 IMP
   000505      1  051300              PERFORM PASS                                        DB1014.2 274
   000506         051400              ELSE                                                DB1014.2
   000507      1  051500              PERFORM FAIL                                        DB1014.2 275
   000508      1  051600              MOVE DBCONT-HOLD TO COMPUTED-A                      DB1014.2 76 114
   000509      1  051700              MOVE "SPACES" TO CORRECT-A.                         DB1014.2 127
   000510         051800     MOVE     "DEBUG-CONTENTS" TO RE-MARK.                        DB1014.2 109
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051900     GO TO     GO-TO-WRITE.                                       DB1014.2 514
   000512         052000 GO-TO-DELETE.                                                    DB1014.2
   000513         052100         PERFORM DE-LETE.                                         DB1014.2 276
   000514         052200 GO-TO-WRITE.                                                     DB1014.2
   000515         052300     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1014.2 99
   000516         052400     MOVE "GO-TO-TEST" TO PAR-NAME.                               DB1014.2 103
   000517         052500     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000518         052600     MOVE 0 TO RESULT-FLAG.                                       DB1014.2 73
   000519         052800*    THE DEBUG-LINE (INSPT) SUBTEST FOR THE TEST NAMED IN THE    *DB1014.2
   000520         052900*    OUTPUT REPORT AS "ALTER-TEST" SHOULD POINT TO THE           *DB1014.2
   000521         053000*    EXECUTABLE STATEMENT WHICH FOLLOWS THIS COMMENT SET AND     *DB1014.2
   000522         053100*    WHICH READS, "ALTER ALTERABLE-PARAGRAPH TO PROCEED TO       *DB1014.2
   000523         053200*    ALTERED-GO-TO-TEST.".                                       *DB1014.2
   000524         053400 ALTER-TEST-INIT.                                                 DB1014.2
   000525         053500     ALTER ALTERABLE-PARAGRAPH TO PROCEED TO ALTERED-GO-TO-TEST.  DB1014.2 479 565
   000526         053600 ALTER-TEST.                                                      DB1014.2
   000527         053700     IF RESULT-FLAG IS NOT EQUAL TO 4                             DB1014.2 73
   000528      1  053800         MOVE "USE PROCEDURE NOT EXECUTED" TO RE-MARK             DB1014.2 109
   000529      1  053900         PERFORM FAIL                                             DB1014.2 275
   000530      1  054000         GO TO ALTER-WRITE.                                       DB1014.2 554
   000531         054100     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1014.2 109
   000532         054200     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1014.2 127
   000533         054300     MOVE DBLINE-HOLD TO COMPUTED-A                               DB1014.2 74 114
   000534         054400     PERFORM INSPT.                                               DB1014.2 273
   000535         054500     PERFORM ALTER-WRITE.                                         DB1014.2 554
   000536         054600     MOVE DBNAME-HOLD TO SIZE-19.                                 DB1014.2 75 78
   000537         054700     IF SIZE-19 IS EQUAL TO "ALTERABLE-PARAGRAPH"                 DB1014.2 78
   000538      1  054800         PERFORM PASS ELSE                                        DB1014.2 274
   000539      1  054900         MOVE "ALTERABLE-PARAGRAPH" TO CORRECT-A                  DB1014.2 127
   000540      1  055000         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1014.2 75 114
   000541      1  055100         PERFORM FAIL.                                            DB1014.2 275
   000542         055200     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1014.2 109
   000543         055300     PERFORM ALTER-WRITE.                                         DB1014.2 554
   000544         055400     MOVE DBCONT-HOLD TO SIZE-18.                                 DB1014.2 76 80
   000545         055500     IF SIZE-18 IS EQUAL TO "ALTERED-GO-TO-TEST"                  DB1014.2 80
   000546      1  055600         PERFORM PASS ELSE                                        DB1014.2 274
   000547      1  055700         MOVE "ALTERED-GO-TO-TEST" TO CORRECT-A                   DB1014.2 127
   000548      1  055800         MOVE DBCONT-HOLD TO COMPUTED-A                           DB1014.2 76 114
   000549      1  055900         PERFORM FAIL.                                            DB1014.2 275
   000550         056000     MOVE "DEBUG-CONTENTS" TO RE-MARK.                            DB1014.2 109
   000551         056100     GO TO ALTER-WRITE.                                           DB1014.2 554
   000552         056200 ALTER-DELETE.                                                    DB1014.2
   000553         056300     PERFORM DE-LETE.                                             DB1014.2 276
   000554         056400 ALTER-WRITE.                                                     DB1014.2
   000555         056500     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1014.2 99
   000556         056600     MOVE "ALTER-TEST" TO PAR-NAME.                               DB1014.2 103
   000557         056700     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000558         056800     MOVE 0 TO RESULT-FLAG.                                       DB1014.2 73
   000559         057000*    THE DEBUG-LINE (INSPT) SUBTEST FOR THE TEST NAMED IN THE    *DB1014.2
   000560         057100*    OUTPUT REPORT AS "ALTERED-GO-TO-TEST" SHOULD POINT TO THE   *DB1014.2
   000561         057200*    EXECUTABLE STATEMENT WHICH FOLLOWS THIS COMMENT SET AND     *DB1014.2
   000562         057300*    WHICH READS, "GO TO ALTERABLE-PARAGRAPH.".                  *DB1014.2
   000563         057500 ALTER-WRITE-END.                                                 DB1014.2
   000564         057600     GO TO ALTERABLE-PARAGRAPH.                                   DB1014.2 479
   000565         057700 ALTERED-GO-TO-TEST.                                              DB1014.2
   000566         057800     IF RESULT-FLAG IS NOT EQUAL TO 4                             DB1014.2 73
   000567      1  057900         MOVE "USE PROCEDURE NOT EXECUTED" TO RE-MARK             DB1014.2 109
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  058000         PERFORM FAIL                                             DB1014.2 275
   000569      1  058100         GO TO ALTERED-GO-TO-WRITE.                               DB1014.2 593
   000570         058200     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1014.2 109
   000571         058300     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1014.2 127
   000572         058400     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1014.2 74 114
   000573         058500     PERFORM INSPT.                                               DB1014.2 273
   000574         058600     PERFORM ALTERED-GO-TO-WRITE.                                 DB1014.2 593
   000575         058700     MOVE DBNAME-HOLD TO SIZE-19.                                 DB1014.2 75 78
   000576         058800     IF SIZE-19 IS EQUAL TO "ALTERABLE-PARAGRAPH"                 DB1014.2 78
   000577      1  058900         PERFORM PASS ELSE                                        DB1014.2 274
   000578      1  059000         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1014.2 75 114
   000579      1  059100         MOVE "ALTERABLE-PARAGRAPH" TO CORRECT-A                  DB1014.2 127
   000580      1  059200         PERFORM FAIL.                                            DB1014.2 275
   000581         059300     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1014.2 109
   000582         059400     PERFORM ALTERED-GO-TO-WRITE.                                 DB1014.2 593
   000583         059500     IF       DBCONT-HOLD EQUAL TO SPACE                          DB1014.2 76 IMP
   000584      1  059600              PERFORM PASS                                        DB1014.2 274
   000585         059700              ELSE                                                DB1014.2
   000586      1  059800              PERFORM FAIL                                        DB1014.2 275
   000587      1  059900              MOVE DBCONT-HOLD TO COMPUTED-A                      DB1014.2 76 114
   000588      1  060000              MOVE "SPACES" TO CORRECT-A.                         DB1014.2 127
   000589         060100     MOVE     "DEBUG-CONTENTS" TO RE-MARK.                        DB1014.2 109
   000590         060200     GO TO ALTERED-GO-TO-WRITE.                                   DB1014.2 593
   000591         060300 ALTERED-GO-TO-DELETE.                                            DB1014.2
   000592         060400     PERFORM DE-LETE.                                             DB1014.2 276
   000593         060500 ALTERED-GO-TO-WRITE.                                             DB1014.2
   000594         060600     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1014.2 99
   000595         060700     MOVE "ALTERED-GO-TO-TEST" TO PAR-NAME.                       DB1014.2 103
   000596         060800     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000597         060900     MOVE 0 TO RESULT-FLAG.                                       DB1014.2 73
   000598         061100*    THE DEBUG-LINE (INSPT) SUBTEST FOR THE TEST NAMED IN THE    *DB1014.2
   000599         061200*    OUTPUT REPORT AS "PERF-ITERATION-TEST" SHOULD POINT TO THE  *DB1014.2
   000600         061300*    EXECUTABLE STATEMENT WHICH FOLLOWS THIS COMMENT SET AND     *DB1014.2
   000601         061400*    WHICH READS, "PERFORM LOOP-ROUTINE FIVE TIMES.".            *DB1014.2
   000602         061600 PERF-ITERATION-TEST.                                             DB1014.2
   000603         061700     PERFORM LOOP-ROUTINE FIVE TIMES.                             DB1014.2 645 77
   000604         061800     IF RESULT-FLAG IS NOT EQUAL TO 5                             DB1014.2 73
   000605      1  061900         MOVE "05" TO CORRECT-A                                   DB1014.2 127
   000606      1  062000         MOVE RESULT-FLAG TO COMPUTED-A                           DB1014.2 73 114
   000607      1  062100         MOVE "NO. OF TIMES USE PROC EXECUTED" TO RE-MARK         DB1014.2 109
   000608      1  062200         PERFORM FAIL                                             DB1014.2 275
   000609         062300              ELSE                                                DB1014.2
   000610      1  062400              MOVE "PROC EXECUTED FIVE TIMES" TO RE-MARK          DB1014.2 109
   000611      1  062500              PERFORM PASS.                                       DB1014.2 274
   000612         062600     IF RESULT-FLAG IS EQUAL TO 0                                 DB1014.2 73
   000613      1  062700         GO TO PERF-ITERATION-WRITE                               DB1014.2 638
   000614      1  062800         ELSE PERFORM PERF-ITERATION-WRITE.                       DB1014.2 638
   000615         062900     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1014.2 74 114
   000616         063000     PERFORM INSPT.                                               DB1014.2 273
   000617         063100     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1014.2 109
   000618         063200     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1014.2 127
   000619         063300     PERFORM PERF-ITERATION-WRITE.                                DB1014.2 638
   000620         063400     MOVE DBNAME-HOLD TO SIZE-12.                                 DB1014.2 75 92
   000621         063500     IF SIZE-12 IS EQUAL TO "LOOP-ROUTINE"                        DB1014.2 92
   000622      1  063600         PERFORM PASS ELSE                                        DB1014.2 274
   000623      1  063700         MOVE "LOOP-ROUTINE" TO CORRECT-A                         DB1014.2 127
   000624      1  063800         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1014.2 75 114
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  063900         PERFORM FAIL.                                            DB1014.2 275
   000626         064000     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1014.2 109
   000627         064100     PERFORM PERF-ITERATION-WRITE.                                DB1014.2 638
   000628         064200     MOVE DBCONT-HOLD TO SIZE-12.                                 DB1014.2 76 92
   000629         064300     IF SIZE-12 IS EQUAL TO "PERFORM LOOP"                        DB1014.2 92
   000630      1  064400         PERFORM PASS ELSE                                        DB1014.2 274
   000631      1  064500         MOVE "PERFORM LOOP" TO CORRECT-A                         DB1014.2 127
   000632      1  064600         MOVE DBCONT-HOLD TO COMPUTED-A                           DB1014.2 76 114
   000633      1  064700         PERFORM FAIL.                                            DB1014.2 275
   000634         064800     MOVE "DEBUG-CONTENTS" TO RE-MARK.                            DB1014.2 109
   000635         064900     GO TO PERF-ITERATION-WRITE.                                  DB1014.2 638
   000636         065000 PERF-ITERATION-DELETE.                                           DB1014.2
   000637         065100     PERFORM DE-LETE.                                             DB1014.2 276
   000638         065200 PERF-ITERATION-WRITE.                                            DB1014.2
   000639         065300     MOVE "PERF-ITERATION-TEST" TO PAR-NAME.                      DB1014.2 103
   000640         065400     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1014.2 99
   000641         065500     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000642         065600     MOVE 0 TO RESULT-FLAG.                                       DB1014.2 73
   000643         065700 PERF-ITERATION-END.                                              DB1014.2
   000644         065800     GO TO PERFORM-THRU-TEST.                                     DB1014.2 656
   000645         065900 LOOP-ROUTINE.                                                    DB1014.2
   000646         066100* ACTION RESULTING IN LOOP UNFOLDING AND REDUCTION.               DB1014.2
   000647         066200     PERFORM DO-NOTHING.                                          DB1014.2 652
   000648         066400*    THE DEBUG-LINE (INSPT) SUBTEST FOR THE TEST NAMED IN THE    *DB1014.2
   000649         066500*    OUTPUT REPORT AS "PERFORM-THRU-TEST" SHOULD POINT TO THE    *DB1014.2
   000650         066600*    EXECUTABLE STATEMENT WHICH FOLLOWS THIS COMMENT SET AND     *DB1014.2
   000651         066700*    WHICH READS, "ADD A B C GIVING D.".                         *DB1014.2
   000652         066900 DO-NOTHING.                                                      DB1014.2
   000653         067000     ADD A B C GIVING D.                                          DB1014.2 69 70 71 72
   000654         067100 DO-NOTHING-1.                                                    DB1014.2
   000655         067200     SUBTRACT A FROM B.                                           DB1014.2 69 70
   000656         067300 PERFORM-THRU-TEST.                                               DB1014.2
   000657         067400     PERFORM DO-NOTHING THRU DO-NOTHING-1 FIVE TIMES.             DB1014.2 652 654 77
   000658         067500     IF RESULT-FLAG IS NOT EQUAL TO 5                             DB1014.2 73
   000659      1  067600         MOVE "05" TO CORRECT-A                                   DB1014.2 127
   000660      1  067700         MOVE RESULT-FLAG TO COMPUTED-A                           DB1014.2 73 114
   000661      1  067800         MOVE "NO. OF TIMES USE PROC EXECUTED" TO RE-MARK         DB1014.2 109
   000662      1  067900         PERFORM FAIL                                             DB1014.2 275
   000663         068000              ELSE                                                DB1014.2
   000664      1  068100              MOVE "PROC EXECUTED FIVE TIMES" TO RE-MARK          DB1014.2 109
   000665      1  068200              PERFORM PASS.                                       DB1014.2 274
   000666         068300     IF RESULT-FLAG IS EQUAL TO 0                                 DB1014.2 73
   000667      1  068400         GO TO PERFORM-THRU-WRITE   ELSE                          DB1014.2 692
   000668      1  068500         PERFORM PERFORM-THRU-WRITE.                              DB1014.2 692
   000669         068600     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1014.2 109
   000670         068700     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1014.2 127
   000671         068800     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1014.2 74 114
   000672         068900     PERFORM INSPT.                                               DB1014.2 273
   000673         069000     PERFORM PERFORM-THRU-WRITE.                                  DB1014.2 692
   000674         069100     MOVE DBNAME-HOLD TO SIZE-12.                                 DB1014.2 75 92
   000675         069200     IF SIZE-12 IS EQUAL TO "DO-NOTHING-1"                        DB1014.2 92
   000676      1  069300         PERFORM PASS   ELSE                                      DB1014.2 274
   000677      1  069400         MOVE "DO-NOTHING-1" TO CORRECT-A                         DB1014.2 127
   000678      1  069500         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1014.2 75 114
   000679      1  069600         PERFORM FAIL.                                            DB1014.2 275
   000680         069700     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1014.2 109
   000681         069800     PERFORM PERFORM-THRU-WRITE.                                  DB1014.2 692
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         069900     MOVE DBCONT-HOLD TO SIZE-12                                  DB1014.2 76 92
   000683         070000     IF SIZE-12 IS EQUAL TO "FALL THROUGH"                        DB1014.2 92
   000684      1  070100         PERFORM PASS   ELSE                                      DB1014.2 274
   000685      1  070200         MOVE "FALL THROUGH" TO CORRECT-A                         DB1014.2 127
   000686      1  070300         MOVE DBCONT-HOLD TO COMPUTED-A                           DB1014.2 76 114
   000687      1  070400         PERFORM FAIL.                                            DB1014.2 275
   000688         070500     MOVE "DEBUG-CONTENTS" TO RE-MARK.                            DB1014.2 109
   000689         070600     GO TO PERFORM-THRU-WRITE.                                    DB1014.2 692
   000690         070700 PERFORM-THRU-DELETE.                                             DB1014.2
   000691         070800     PERFORM DE-LETE.                                             DB1014.2 276
   000692         070900 PERFORM-THRU-WRITE.                                              DB1014.2
   000693         071000     MOVE "PERFORM-THRU-TEST" TO PAR-NAME.                        DB1014.2 103
   000694         071100     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1014.2 99
   000695         071200     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000696         071300     MOVE 0 TO RESULT-FLAG.                                       DB1014.2 73
   000697         071500*    THE DEBUG-LINE (INSPT) SUBTEST FOR THE TEST NAMED IN THE    *DB1014.2
   000698         071600*    OUTPUT REPORT AS "SIMPLE-PERFORM-TEST" SHOULD POINT TO THE  *DB1014.2
   000699         071700*    EXECUTABLE STATEMENT WHICH FOLLOWS THIS COMMENT SET AND     *DB1014.2
   000700         071800*    WHICH READS, "PERFORM LOOP-ROUTINE.".                       *DB1014.2
   000701         072000 SIMPLE-PERFORM-TEST.                                             DB1014.2
   000702         072100     PERFORM LOOP-ROUTINE.                                        DB1014.2 645
   000703         072200     IF RESULT-FLAG IS NOT EQUAL TO 1                             DB1014.2 73
   000704      1  072300         MOVE "USE PROCEDURE NOT EXECUTED" TO RE-MARK             DB1014.2 109
   000705      1  072400         PERFORM FAIL                                             DB1014.2 275
   000706      1  072500         GO TO SIMPLE-PERFORM-WRITE.                              DB1014.2 730
   000707         072600     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1014.2 109
   000708         072700     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1014.2 127
   000709         072800     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1014.2 74 114
   000710         072900     PERFORM INSPT.                                               DB1014.2 273
   000711         073000     PERFORM SIMPLE-PERFORM-WRITE.                                DB1014.2 730
   000712         073100     MOVE DBNAME-HOLD TO SIZE-12.                                 DB1014.2 75 92
   000713         073200     IF SIZE-12 IS EQUAL TO "LOOP-ROUTINE"                        DB1014.2 92
   000714      1  073300         PERFORM PASS   ELSE                                      DB1014.2 274
   000715      1  073400         MOVE "LOOP-ROUTINE" TO CORRECT-A                         DB1014.2 127
   000716      1  073500         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1014.2 75 114
   000717      1  073600         PERFORM FAIL.                                            DB1014.2 275
   000718         073700     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1014.2 109
   000719         073800     PERFORM SIMPLE-PERFORM-WRITE.                                DB1014.2 730
   000720         073900     MOVE DBCONT-HOLD TO SIZE-12.                                 DB1014.2 76 92
   000721         074000     IF SIZE-12 IS EQUAL TO "PERFORM LOOP"                        DB1014.2 92
   000722      1  074100         PERFORM PASS   ELSE                                      DB1014.2 274
   000723      1  074200         MOVE "PERFORM LOOP" TO CORRECT-A                         DB1014.2 127
   000724      1  074300         MOVE DBCONT-HOLD TO COMPUTED-A                           DB1014.2 76 114
   000725      1  074400         PERFORM FAIL.                                            DB1014.2 275
   000726         074500     MOVE "DEBUG-CONTENTS" TO RE-MARK.                            DB1014.2 109
   000727         074600     GO TO SIMPLE-PERFORM-WRITE.                                  DB1014.2 730
   000728         074700 SIMPLE-PERFORM-DELETE.                                           DB1014.2
   000729         074800     PERFORM DE-LETE.                                             DB1014.2 276
   000730         074900 SIMPLE-PERFORM-WRITE.                                            DB1014.2
   000731         075000     MOVE "SIMPLE-PERFORM-TEST" TO PAR-NAME.                      DB1014.2 103
   000732         075100     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1014.2 99
   000733         075200     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000734         075300     MOVE 0 TO RESULT-FLAG.                                       DB1014.2 73
   000735         075400 DEBUG-LINE-TESTS-INIT.                                           DB1014.2
   000736         075500     MOVE "DEBUG LINE TESTS" TO FEATURE.                          DB1014.2 99
   000737         075600 DEBUG-LINE-TEST-01.                                              DB1014.2
   000738         075700     MOVE "COMPLETE ENTITY" TO RE-MARK.                           DB1014.2 109
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         075800     PERFORM FAIL.                                                DB1014.2 275
   000740         075900D    PERFORM PASS  SUBTRACT 1 FROM ERROR-COUNTER.                 DB1014.2 274 150
   000741         076000     GO TO DEBUG-LINE-WRITE-01.                                   DB1014.2 744
   000742         076100 DEBUG-LINE-DELETE-01.                                            DB1014.2
   000743         076200     PERFORM DE-LETE.                                             DB1014.2 276
   000744         076300 DEBUG-LINE-WRITE-01.                                             DB1014.2
   000745         076400     MOVE "DEBUG-LINE-TEST-01" TO PAR-NAME.                       DB1014.2 103
   000746         076500     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000747         076600 DEBUG-LINE-TEST-02.                                              DB1014.2
   000748         076700     MOVE "CONSECUTIVE DEBUG LINES" TO RE-MARK.                   DB1014.2 109
   000749         076800     PERFORM FAIL.                                                DB1014.2 275
   000750         076900D    PERFORM PASS.                                                DB1014.2 274
   000751         077000D    SUBTRACT 1 FROM ERROR-COUNTER.                               DB1014.2 150
   000752         077100     GO TO DEBUG-LINE-WRITE-02.                                   DB1014.2 755
   000753         077200 DEBUG-LINE-DELETE-02.                                            DB1014.2
   000754         077300     PERFORM DE-LETE.                                             DB1014.2 276
   000755         077400 DEBUG-LINE-WRITE-02.                                             DB1014.2
   000756         077500     MOVE "DEBUG-LINE-TEST-02" TO PAR-NAME.                       DB1014.2 103
   000757         077600     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000758         077700 DEBUG-LINE-TEST-03.                                              DB1014.2
   000759         077800     MOVE "BROKEN STATEMENTS" TO RE-MARK.                         DB1014.2 109
   000760         077900     PERFORM                                                      DB1014.2
   000761         078000D        PASS.  GO TO DEBUG-LINE-WRITE-03.                        DB1014.2 274 767
   000762         078100DDEBUG-LINE-TEST-03-A.    PERFORM                                 DB1014.2
   000763         078200                             FAIL.                                DB1014.2 275
   000764         078300                             GO TO DEBUG-LINE-WRITE-03.           DB1014.2 767
   000765         078400 DEBUG-LINE-DELETE-03.                                            DB1014.2
   000766         078500     PERFORM DE-LETE.                                             DB1014.2 276
   000767         078600 DEBUG-LINE-WRITE-03.                                             DB1014.2
   000768         078700     MOVE "DEBUG-LINE-TEST-03" TO PAR-NAME.                       DB1014.2 103
   000769         078800     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000770         078900 DEBUG-LINE-TEST-04.                                              DB1014.2
   000771         079000     MOVE "NESTED COMMENTS" TO RE-MARK.                           DB1014.2 109
   000772         079100D    PERFORM                                                      DB1014.2
   000773         079200*        FAIL.  GO TO DEBUG-LINE-WRITE-04.                        DB1014.2
   000774         079300*DEBUG-LINE-TEST-04-A.    PERFORM                                 DB1014.2
   000775         079400D                         PASS.  GO TO DEBUG-LINE-WRITE-04.       DB1014.2 274 782
   000776         079500 DEBUG-LINE-TEST-04-B.                                            DB1014.2
   000777         079600     MOVE "    FAILURE 04B" TO COMPUTED-A.                        DB1014.2 114
   000778         079700     PERFORM FAIL.                                                DB1014.2 275
   000779         079800     GO TO DEBUG-LINE-WRITE-04.                                   DB1014.2 782
   000780         079900 DEBUG-LINE-DELETE-04.                                            DB1014.2
   000781         080000     PERFORM DE-LETE.                                             DB1014.2 276
   000782         080100 DEBUG-LINE-WRITE-04.                                             DB1014.2
   000783         080200     MOVE "DEBUG-LINE-TEST-04" TO PAR-NAME.                       DB1014.2 103
   000784         080300     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000785         080400 DEBUG-LINE-TEST-05.                                              DB1014.2
   000786         080500     MOVE "NESTED INSIDE COMMENTS" TO RE-MARK.                    DB1014.2 109
   000787         080600*    PERFORM FAIL.                                                DB1014.2
   000788         080700*    GO TO DEBUG-LINE-WRITE-05.                                   DB1014.2
   000789         080800*DEBUG-LINE-TEST-05-A.                                            DB1014.2
   000790         080900D    PERFORM PASS.                                                DB1014.2 274
   000791         081000D    GO TO DEBUG-LINE-WRITE-05.                                   DB1014.2 800
   000792         081100*DEBUG-LINE-TEST-05-B.                                            DB1014.2
   000793         081200*    MOVE "    FAILURE 05B" TO COMPUTED-A.                        DB1014.2
   000794         081300*    PERFORM FAIL.  GO TO DEBUG-LINE-WRITE-05.                    DB1014.2
   000795         081400 DEBUG-LINE-TEST-05-C.                                            DB1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         081500     MOVE "    FAILURE 05C" TO COMPUTED-A.                        DB1014.2 114
   000797         081600     PERFORM FAIL.   GO TO DEBUG-LINE-WRITE-05.                   DB1014.2 275 800
   000798         081700 DEBUG-LINE-DELETE-05.                                            DB1014.2
   000799         081800     PERFORM DE-LETE.                                             DB1014.2 276
   000800         081900 DEBUG-LINE-WRITE-05.                                             DB1014.2
   000801         082000     MOVE "DEBUG-LINE-TEST-05" TO PAR-NAME.                       DB1014.2 103
   000802         082100     PERFORM PRINT-DETAIL.                                        DB1014.2 278
   000803         082200 CCVS-EXIT SECTION.                                               DB1014.2
   000804         082300 CCVS-999999.                                                     DB1014.2
   000805         082400     GO TO CLOSE-FILES.                                           DB1014.2 267
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    18
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       69   A. . . . . . . . . . . . . . .  653 655
       70   B. . . . . . . . . . . . . . .  653 M655
       71   C. . . . . . . . . . . . . . .  653
      136   CCVS-C-1 . . . . . . . . . . .  295 337
      141   CCVS-C-2 . . . . . . . . . . .  296 338
      176   CCVS-E-1 . . . . . . . . . . .  301
      182   CCVS-E-2 . . . . . . . . . . .  310 317 324 329
      186   CCVS-E-2-2 . . . . . . . . . .  M309
      190   CCVS-E-3 . . . . . . . . . . .  330
      198   CCVS-E-4 . . . . . . . . . . .  309
      199   CCVS-E-4-1 . . . . . . . . . .  M307
      201   CCVS-E-4-2 . . . . . . . . . .  M308
      157   CCVS-H-1 . . . . . . . . . . .  291
      163   CCVS-H-2 . . . . . . . . . . .  292
      169   CCVS-H-3 . . . . . . . . . . .  293
      217   CCVS-PGM-ID. . . . . . . . . .  263 263
      119   CM-18V0
      114   COMPUTED-A . . . . . . . . . .  115 116 117 118 119 359 362 M374 M381 M390 M412 M419 M427 M449 M456 M464 M492
                                            M498 M508 M533 M540 M548 M572 M578 M587 M606 M615 M624 M632 M660 M671 M678 M686
                                            M709 M716 M724 M777 M796
      115   COMPUTED-N
      113   COMPUTED-X . . . . . . . . . .  M286 349
      116   COMPUTED-0V18
      118   COMPUTED-14V4
      120   COMPUTED-18V0
      117   COMPUTED-4V14
      127   CORRECT-A. . . . . . . . . . .  128 129 130 131 132 360 362 M373 M380 M389 M411 M418 M426 M448 M455 M463 M491
                                            M499 M509 M532 M539 M547 M571 M579 M588 M605 M618 M623 M631 M659 M670 M677 M685
                                            M708 M715 M723
      128   CORRECT-N
      126   CORRECT-X. . . . . . . . . . .  M287 350
      129   CORRECT-0V18
      131   CORRECT-14V4
      133   CORRECT-18V0
      130   CORRECT-4V14
      132   CR-18V0
       72   D. . . . . . . . . . . . . . .  M653
       76   DBCONT-HOLD. . . . . . . . . .  M228 386 390 423 427 460 464 503 508 544 548 583 587 628 632 682 686 720 724
       74   DBLINE-HOLD. . . . . . . . . .  M226 374 412 449 492 533 572 615 671 709
       75   DBNAME-HOLD. . . . . . . . . .  M227 377 381 415 419 452 456 495 498 536 540 575 578 620 624 674 678 712 716
        0   DEBUG-CONTENTS . . . . . . . .  228
        0   DEBUG-LINE . . . . . . . . . .  226
        0   DEBUG-NAME . . . . . . . . . .  227
      149   DELETE-CNT . . . . . . . . . .  M276 304 320 322
      106   DOTVALUE . . . . . . . . . . .  M281
      155   DUMMY-HOLD . . . . . . . . . .  M334 340
       67   DUMMY-RECORD . . . . . . . . .  M291 M292 M293 M295 M296 M297 M299 M301 M310 M317 M324 M329 M330 334 M335 336
                                            M337 M338 M339 M340 344 M345 M352 M363
      189   ENDER-DESC . . . . . . . . . .  M312 M323 M328
      150   ERROR-COUNTER. . . . . . . . .  M275 303 313 316 M740 M751
      154   ERROR-HOLD . . . . . . . . . .  M303 M304 M304 M305 308
      187   ERROR-TOTAL. . . . . . . . . .  M314 M316 M321 M322 M326 M327
       99   FEATURE. . . . . . . . . . . .  M397 M434 M471 M515 M555 M594 M640 M694 M732 M736
       77   FIVE . . . . . . . . . . . . .  603 657
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    19
0 Defined   Cross-reference of data names   References

0     211   HYPHEN-LINE. . . . . . . . . .  297 299 339
      179   ID-AGAIN . . . . . . . . . . .  M263
      206   INFO-TEXT. . . . . . . . . . .  M351
      151   INSPECT-COUNTER. . . . . . . .  M273 303 325 327
      101   P-OR-F . . . . . . . . . . . .  M273 M274 M275 M276 283 M286
      103   PAR-NAME . . . . . . . . . . .  M288 M398 M435 M472 M516 M556 M595 M639 M693 M731 M745 M756 M768 M783 M801
      105   PARDOT-X . . . . . . . . . . .  M280
      152   PASS-COUNTER . . . . . . . . .  M274 305 307
       62   PRINT-FILE . . . . . . . . . .  58 262 268
       66   PRINT-REC. . . . . . . . . . .  M282 M355 M356
      109   RE-MARK. . . . . . . . . . . .  M277 M289 M369 M372 M384 M392 M407 M410 M421 M429 M444 M447 M458 M466 M487 M490
                                            M501 M510 M528 M531 M542 M550 M567 M570 M581 M589 M607 M610 M617 M626 M634 M661
                                            M664 M669 M680 M688 M704 M707 M718 M726 M738 M748 M759 M771 M786
      148   REC-CT . . . . . . . . . . . .  279 281 288
      147   REC-SKL-SUB
      156   RECORD-COUNT . . . . . . . . .  M332 333 M341
       73   RESULT-FLAG. . . . . . . . . .  M224 M234 M239 M244 M249 M254 368 M404 406 M441 443 M474 486 M518 527 M558 566
                                            M597 604 606 612 M642 658 660 666 M696 703 M734
       94   SIZE-10. . . . . . . . . . . .  M495 496
       92   SIZE-12. . . . . . . . . . . .  M423 424 M460 461 M503 504 M620 621 M628 629 M674 675 M682 683 M712 713 M720
                                            721
       90   SIZE-13. . . . . . . . . . . .  M386 387
       88   SIZE-14
       86   SIZE-15
       84   SIZE-16. . . . . . . . . . . .  M452 453
       82   SIZE-17. . . . . . . . . . . .  M415 416
       80   SIZE-18. . . . . . . . . . . .  M544 545
       78   SIZE-19. . . . . . . . . . . .  M536 537 M575 576
       96   SIZE-5 . . . . . . . . . . . .  M377 378
      110   TEST-COMPUTED. . . . . . . . .  355
      123   TEST-CORRECT . . . . . . . . .  356
      167   TEST-ID. . . . . . . . . . . .  M263
       97   TEST-RESULTS . . . . . . . . .  M264 282
      153   TOTAL-ERROR
      208   XXCOMPUTED . . . . . . . . . .  M362
      210   XXCORRECT. . . . . . . . . . .  M362
      204   XXINFO . . . . . . . . . . . .  352 363
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    20
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

      552   ALTER-DELETE
      240   ALTER-PARAGRAPH
      526   ALTER-TEST
      524   ALTER-TEST-INIT
      554   ALTER-WRITE. . . . . . . . . .  G530 P535 P543 G551
      563   ALTER-WRITE-END
      479   ALTERABLE-PARAGRAPH. . . . . .  U241 A525 G564
      591   ALTERED-GO-TO-DELETE
      565   ALTERED-GO-TO-TEST . . . . . .  G484 T525
      593   ALTERED-GO-TO-WRITE. . . . . .  G569 P574 P582 G590
      358   BAIL-OUT . . . . . . . . . . .  P285
      364   BAIL-OUT-EX. . . . . . . . . .  E285 G360
      361   BAIL-OUT-WRITE . . . . . . . .  G359
      242   BEGIN-ALTER-PARAGRAPH
      232   BEGIN-FALL-THROUGH-AND-SERIES
      237   BEGIN-GO-TO
      247   BEGIN-LOOP-ITERATION
      252   BEGIN-PERFORM-THRU
      223   BEGIN-START-UP
      346   BLANK-LINE-PRINT
      803   CCVS-EXIT
      804   CCVS-999999
      260   CCVS1. . . . . . . . . . . . .  U222
      365   CCVS1-EXIT . . . . . . . . . .  G266
      267   CLOSE-FILES. . . . . . . . . .  G805
      294   COLUMN-NAMES-ROUTINE . . . . .  E265
      225   DB-COMMON. . . . . . . . . . .  P233 P238 P243 P248 P253
      276   DE-LETE. . . . . . . . . . . .  P395 P432 P469 P513 P553 P592 P637 P691 P729 P743 P754 P766 P781 P799
      742   DEBUG-LINE-DELETE-01
      753   DEBUG-LINE-DELETE-02
      765   DEBUG-LINE-DELETE-03
      780   DEBUG-LINE-DELETE-04
      798   DEBUG-LINE-DELETE-05
      737   DEBUG-LINE-TEST-01
      747   DEBUG-LINE-TEST-02
      758   DEBUG-LINE-TEST-03
      762   DEBUG-LINE-TEST-03-A
      770   DEBUG-LINE-TEST-04
      776   DEBUG-LINE-TEST-04-B
      785   DEBUG-LINE-TEST-05
      795   DEBUG-LINE-TEST-05-C
      735   DEBUG-LINE-TESTS-INIT
      744   DEBUG-LINE-WRITE-01. . . . . .  G741
      755   DEBUG-LINE-WRITE-02. . . . . .  G752
      767   DEBUG-LINE-WRITE-03. . . . . .  G761 G764
      782   DEBUG-LINE-WRITE-04. . . . . .  G775 G779
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    21
0 Defined   Cross-reference of procedures   References

0     800   DEBUG-LINE-WRITE-05. . . . . .  G791 G797
      652   DO-NOTHING . . . . . . . . . .  P647 P657
      654   DO-NOTHING-1 . . . . . . . . .  U251 E657
      298   END-ROUTINE. . . . . . . . . .  P268
      302   END-ROUTINE-1
      311   END-ROUTINE-12
      319   END-ROUTINE-13 . . . . . . . .  E268
      300   END-RTN-EXIT
      275   FAIL . . . . . . . . . . . . .  P370 P382 P391 P408 P420 P428 P445 P457 P465 P483 P488 P500 P507 P529 P541 P549
                                            P568 P580 P586 P608 P625 P633 P662 P679 P687 P705 P717 P725 P739 P749 P763 P778
                                            P797
      348   FAIL-ROUTINE . . . . . . . . .  P284
      357   FAIL-ROUTINE-EX. . . . . . . .  E284 G353
      354   FAIL-ROUTINE-WRITE . . . . . .  G349 G350
      229   FALL-THROUGH-AND-SERIES
      431   FALL-THROUGH-DELETE
      405   FALL-THROUGH-TEST. . . . . . .  U231
      433   FALL-THROUGH-WRITE . . . . . .  G409 P414 P422 G430
      481   FILLER-PARAGRAPH
      235   GO-TO
      512   GO-TO-DELETE
      485   GO-TO-TEST . . . . . . . . . .  U236 G480
      514   GO-TO-WRITE. . . . . . . . . .  G489 P494 P502 G511
      290   HEAD-ROUTINE . . . . . . . . .  P265
      273   INSPT. . . . . . . . . . . . .  P375 P413 P450 P493 P534 P573 P616 P672 P710
      245   LOOP-ITERATION
      645   LOOP-ROUTINE . . . . . . . . .  U246 P603 P702
      261   OPEN-FILES
      274   PASS . . . . . . . . . . . . .  P379 P388 P417 P425 P454 P462 P497 P505 P538 P546 P577 P584 P611 P622 P630 P665
                                            P676 P684 P714 P722 P740 P750 P761 P775 P790
      636   PERF-ITERATION-DELETE
      643   PERF-ITERATION-END
      602   PERF-ITERATION-TEST
      638   PERF-ITERATION-WRITE . . . . .  G613 P614 P619 P627 G635
      250   PERFORM-THRU
      690   PERFORM-THRU-DELETE
      656   PERFORM-THRU-TEST. . . . . . .  G644
      692   PERFORM-THRU-WRITE . . . . . .  G667 P668 P673 P681 G689
      278   PRINT-DETAIL . . . . . . . . .  P399 P436 P473 P517 P557 P596 P641 P695 P733 P746 P757 P769 P784 P802
      468   PROC-SERIES-DELETE
      442   PROC-SERIES-TEST . . . . . . .  U231
      470   PROC-SERIES-WRITE. . . . . . .  G446 P451 P459 G467
      728   SIMPLE-PERFORM-DELETE
      701   SIMPLE-PERFORM-TEST
      730   SIMPLE-PERFORM-WRITE . . . . .  G706 P711 P719 G727
      394   START-PROGRAM-DELETE
      367   START-PROGRAM-TEST
      383   START-PROGRAM-TEST-1
      396   START-PROGRAM-WRITE. . . . . .  G371 P376 P385 G393
      221   START-UP
      271   TERMINATE-CALL
      269   TERMINATE-CCVS
      331   WRITE-LINE . . . . . . . . . .  P282 P283 P291 P292 P293 P295 P296 P297 P299 P301 P310 P318 P324 P329 P330 P352
                                            P355 P356 P363
      343   WRT-LN . . . . . . . . . . . .  P337 P338 P339 P342 P347
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    22
0 Defined   Cross-reference of programs     References

        3   DB101A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB101A    Date 06/04/2022  Time 11:56:49   Page    23
0LineID  Message code  Message text

     62  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program DB101A:
 *    Source records = 805
 *    Data Division statements = 78
 *    Procedure Division statements = 477
 *    Generated COBOL statements = 0
 *    Program complexity factor = 485
0End of compilation 1,  program DB101A,  highest severity 0.
0Return code 0
