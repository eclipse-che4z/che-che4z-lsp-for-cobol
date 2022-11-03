1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:31   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:31   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         DB1024.2
   000002         000200 PROGRAM-ID.                                                      DB1024.2
   000003         000300     DB102A.                                                      DB1024.2
   000004         000400 AUTHOR.                                                          DB1024.2
   000005         000500     FEDERAL COMPILER TESTING CENTER.                             DB1024.2
   000006         000600 INSTALLATION.                                                    DB1024.2
   000007         000700     GENERAL SERVICES ADMINISTRATION                              DB1024.2
   000008         000800     AUTOMATED DATA AND TELECOMMUNICATION SERVICE.                DB1024.2
   000009         000900     SOFTWARE DEVELOPMENT OFFICE.                                 DB1024.2
   000010         001000     5203 LEESBURG PIKE  SUITE 1100                               DB1024.2
   000011         001100     FALLS CHURCH VIRGINIA 22041.                                 DB1024.2
   000012         001200                                                                  DB1024.2
   000013         001300     PHONE   (703) 756-6153                                       DB1024.2
   000014         001400                                                                  DB1024.2
   000015         001500     " HIGH       ".                                              DB1024.2
   000016         001600 DATE-WRITTEN.                                                    DB1024.2
   000017         001700     CCVS-74 VERSION 4.0 - 1980 JULY 1.                           DB1024.2
   000018         001800     CREATION DATE     /    VALIDATION DATE                       DB1024.2
   000019         001900     "4.2 ".                                                      DB1024.2
   000020         002000 SECURITY.                                                        DB1024.2
   000021         002100     NONE.                                                        DB1024.2
   000022         002200*                                                                 DB1024.2
   000023         002300*    *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *DB1024.2
   000024         002400*                                                                 DB1024.2
   000025         002500*                       PROGRAM ABSTRACT                          DB1024.2
   000026         002600*                                                                 DB1024.2
   000027         002700*    DB102A TESTS THE BASIC OPERATION OF THE DEBUG MODULE         DB1024.2
   000028         002800*    FACILITIES WHEN THE COMPILE TIME DEBUGGING SWITCH IS ON      DB1024.2
   000029         002900*    AND THE OBJECT TIME SWITCH IS OFF.  ALL DEBUG LINES AND      DB1024.2
   000030         003000*    DEBUGGING PROCEDURES SHOULD BE INCLUDED IN COMPILATION AND   DB1024.2
   000031         003100*    GENERATE CODE.                                               DB1024.2
   000032         003200*                                                                 DB1024.2
   000033         003300*    BEFORE BEGINNING EXECUTION OF THE OBJECT PROGRAM, THE JOB    DB1024.2
   000034         003400*    CONTROL LANGUAGE NECESSARY TO DEACTIVATE (TURN OFF) THE      DB1024.2
   000035         003500*    OBJECT TIME DEBUGGING SWITCH MUST BE SUBMITTED.              DB1024.2
   000036         003600*                                                                 DB1024.2
   000037         003700*    AT EXECUTION TIME, CODE GENERATED FROM DEBUG LINES SHOULD    DB1024.2
   000038         003800*    BE EXECUTED, BUT DEBUGGING PROCEDURES SHOULD BE DEACTIVATED  DB1024.2
   000039         003900*    BY THE OBJECT TIME SWITCH.                                   DB1024.2
   000040         004000*                                                                 DB1024.2
   000041         004100*                                                                 DB1024.2
   000042         004200*                                                                 DB1024.2
   000043         004300 ENVIRONMENT DIVISION.                                            DB1024.2
   000044         004400 CONFIGURATION SECTION.                                           DB1024.2
   000045         004500 SOURCE-COMPUTER.                                                 DB1024.2
   000046         004600     XXXXX082                                                     DB1024.2
   000047         004700         WITH DEBUGGING MODE.                                     DB1024.2
   000048         004800 OBJECT-COMPUTER.                                                 DB1024.2
   000049         004900     XXXXX083.                                                    DB1024.2
   000050         005000 INPUT-OUTPUT SECTION.                                            DB1024.2
   000051         005100 FILE-CONTROL.                                                    DB1024.2
   000052         005200     SELECT PRINT-FILE ASSIGN TO                                  DB1024.2 56
   000053         005300     XXXXX055.                                                    DB1024.2
   000054         005400 DATA DIVISION.                                                   DB1024.2
   000055         005500 FILE SECTION.                                                    DB1024.2
   000056         005600 FD  PRINT-FILE                                                   DB1024.2

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0==000056==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000057         005700     LABEL RECORDS                                                DB1024.2
   000058         005800     XXXXX084                                                     DB1024.2 UND

 ==000058==> IGYGR1174-S "XXXXX084" was not defined as a data-name.  "XXXXX084" was discarded.

   000059         005900     DATA RECORD IS PRINT-REC DUMMY-RECORD.                       DB1024.2 * *
   000060         006000 01  PRINT-REC PICTURE X(120).                                    DB1024.2
   000061         006100 01  DUMMY-RECORD PICTURE X(120).                                 DB1024.2
   000062         006200 WORKING-STORAGE SECTION.                                         DB1024.2
   000063         006300 77  A PIC 9 COMP VALUE 1.                                        DB1024.2
   000064         006400 77  B PIC 9 COMP VALUE 5.                                        DB1024.2
   000065         006500 77  C PIC 9 COMP VALUE 9.                                        DB1024.2
   000066         006600 77  D PIC 99 COMP.                                               DB1024.2
   000067         006700 77  RESULT-FLAG PIC 99 COMP VALUE 0.                             DB1024.2
   000068         006800 77  DBLINE-HOLD PIC X(6).                                        DB1024.2
   000069         006900 77  DBNAME-HOLD PIC X(30).                                       DB1024.2
   000070         007000 77  DBCONT-HOLD PIC X(30).                                       DB1024.2
   000071         007100 77  FIVE PIC 9 COMP VALUE 5.                                     DB1024.2
   000072         007200 01  SIZE-19.                                                     DB1024.2
   000073         007300     02  FILLER PIC X.                                            DB1024.2
   000074         007400     02  SIZE-18.                                                 DB1024.2
   000075         007500         03  FILLER PIC X.                                        DB1024.2
   000076         007600         03  SIZE-17.                                             DB1024.2
   000077         007700             04  FILLER PIC X.                                    DB1024.2
   000078         007800             04  SIZE-16.                                         DB1024.2
   000079         007900                 05  FILLER PIC X.                                DB1024.2
   000080         008000                 05  SIZE-15.                                     DB1024.2
   000081         008100                     06  FILLER PIC X.                            DB1024.2
   000082         008200                     06  SIZE-14.                                 DB1024.2
   000083         008300                         07  FILLER PIC X.                        DB1024.2
   000084         008400                         07  SIZE-13.                             DB1024.2
   000085         008500                             08  FILLER PIC X.                    DB1024.2
   000086         008600                             08  SIZE-12.                         DB1024.2
   000087         008700                                 09  FILLER PIC X.                DB1024.2
   000088         008800                                 09  SIZE-11.                     DB1024.2
   000089         008900                                     10  FILLER PIC X.            DB1024.2
   000090         009000                                     10  SIZE-10 PIC X(10).       DB1024.2
   000091         009100 01  TEST-RESULTS.                                                DB1024.2
   000092         009200     02 FILLER                    PICTURE X VALUE SPACE.          DB1024.2 IMP
   000093         009300     02 FEATURE                   PICTURE X(20) VALUE SPACE.      DB1024.2 IMP
   000094         009400     02 FILLER                    PICTURE X VALUE SPACE.          DB1024.2 IMP
   000095         009500     02 P-OR-F                    PICTURE X(5) VALUE SPACE.       DB1024.2 IMP
   000096         009600     02 FILLER                    PICTURE X  VALUE SPACE.         DB1024.2 IMP
   000097         009700     02  PAR-NAME.                                                DB1024.2
   000098         009800       03 FILLER PICTURE X(12) VALUE SPACE.                       DB1024.2 IMP
   000099         009900       03  PARDOT-X PICTURE X  VALUE SPACE.                       DB1024.2 IMP
   000100         010000       03 DOTVALUE PICTURE 99  VALUE ZERO.                        DB1024.2 IMP
   000101         010100       03 FILLER PIC X(5) VALUE SPACE.                            DB1024.2 IMP
   000102         010200     02 FILLER PIC X(10) VALUE SPACE.                             DB1024.2 IMP
   000103         010300     02 RE-MARK PIC X(61).                                        DB1024.2
   000104         010400 01  TEST-COMPUTED.                                               DB1024.2
   000105         010500     02 FILLER PIC X(30) VALUE SPACE.                             DB1024.2 IMP
   000106         010600     02 FILLER PIC X(17) VALUE "       COMPUTED=".                DB1024.2
   000107         010700     02 COMPUTED-X.                                               DB1024.2
   000108         010800     03 COMPUTED-A                PICTURE X(20) VALUE SPACE.      DB1024.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000109         010900     03 COMPUTED-N REDEFINES COMPUTED-A PICTURE -9(9).9(9).       DB1024.2 108
   000110         011000     03 COMPUTED-0V18 REDEFINES COMPUTED-A  PICTURE -.9(18).      DB1024.2 108
   000111         011100     03 COMPUTED-4V14 REDEFINES COMPUTED-A  PICTURE -9(4).9(14).  DB1024.2 108
   000112         011200     03 COMPUTED-14V4 REDEFINES COMPUTED-A  PICTURE -9(14).9(4).  DB1024.2 108
   000113         011300     03       CM-18V0 REDEFINES COMPUTED-A.                       DB1024.2 108
   000114         011400         04 COMPUTED-18V0                   PICTURE -9(18).       DB1024.2
   000115         011500         04 FILLER                          PICTURE X.            DB1024.2
   000116         011600     03 FILLER PIC X(50) VALUE SPACE.                             DB1024.2 IMP
   000117         011700 01  TEST-CORRECT.                                                DB1024.2
   000118         011800     02 FILLER PIC X(30) VALUE SPACE.                             DB1024.2 IMP
   000119         011900     02 FILLER PIC X(17) VALUE "       CORRECT =".                DB1024.2
   000120         012000     02 CORRECT-X.                                                DB1024.2
   000121         012100     03 CORRECT-A                 PICTURE X(20) VALUE SPACE.      DB1024.2 IMP
   000122         012200     03 CORRECT-N REDEFINES CORRECT-A PICTURE -9(9).9(9).         DB1024.2 121
   000123         012300     03 CORRECT-0V18 REDEFINES CORRECT-A    PICTURE -.9(18).      DB1024.2 121
   000124         012400     03 CORRECT-4V14 REDEFINES CORRECT-A    PICTURE -9(4).9(14).  DB1024.2 121
   000125         012500     03 CORRECT-14V4 REDEFINES CORRECT-A    PICTURE -9(14).9(4).  DB1024.2 121
   000126         012600     03      CR-18V0 REDEFINES CORRECT-A.                         DB1024.2 121
   000127         012700         04 CORRECT-18V0                    PICTURE -9(18).       DB1024.2
   000128         012800         04 FILLER                          PICTURE X.            DB1024.2
   000129         012900     03 FILLER PIC X(50) VALUE SPACE.                             DB1024.2 IMP
   000130         013000 01  CCVS-C-1.                                                    DB1024.2
   000131         013100     02 FILLER PICTURE IS X(99) VALUE IS " FEATURE              PADB1024.2
   000132         013200-    "SS  PARAGRAPH-NAME                                          DB1024.2
   000133         013300-    "        REMARKS".                                           DB1024.2
   000134         013400     02 FILLER PICTURE IS X(20) VALUE IS SPACE.                   DB1024.2 IMP
   000135         013500 01  CCVS-C-2.                                                    DB1024.2
   000136         013600     02 FILLER PICTURE IS X VALUE IS SPACE.                       DB1024.2 IMP
   000137         013700     02 FILLER PICTURE IS X(6) VALUE IS "TESTED".                 DB1024.2
   000138         013800     02 FILLER PICTURE IS X(15) VALUE IS SPACE.                   DB1024.2 IMP
   000139         013900     02 FILLER PICTURE IS X(4) VALUE IS "FAIL".                   DB1024.2
   000140         014000     02 FILLER PICTURE IS X(94) VALUE IS SPACE.                   DB1024.2 IMP
   000141         014100 01  REC-SKL-SUB PICTURE 9(2) VALUE ZERO.                         DB1024.2 IMP
   000142         014200 01  REC-CT PICTURE 99 VALUE ZERO.                                DB1024.2 IMP
   000143         014300 01  DELETE-CNT                   PICTURE 999  VALUE ZERO.        DB1024.2 IMP
   000144         014400 01  ERROR-COUNTER PICTURE IS 999 VALUE IS ZERO.                  DB1024.2 IMP
   000145         014500 01  INSPECT-COUNTER PIC 999 VALUE ZERO.                          DB1024.2 IMP
   000146         014600 01  PASS-COUNTER PIC 999 VALUE ZERO.                             DB1024.2 IMP
   000147         014700 01  TOTAL-ERROR PIC 999 VALUE ZERO.                              DB1024.2 IMP
   000148         014800 01  ERROR-HOLD PIC 999 VALUE ZERO.                               DB1024.2 IMP
   000149         014900 01  DUMMY-HOLD PIC X(120) VALUE SPACE.                           DB1024.2 IMP
   000150         015000 01  RECORD-COUNT PIC 9(5) VALUE ZERO.                            DB1024.2 IMP
   000151         015100 01  CCVS-H-1.                                                    DB1024.2
   000152         015200     02  FILLER   PICTURE X(27)  VALUE SPACE.                     DB1024.2 IMP
   000153         015300     02 FILLER PICTURE X(67) VALUE                                DB1024.2
   000154         015400     " FEDERAL COMPILER TESTING CENTER COBOL COMPILER VALIDATION  DB1024.2
   000155         015500-    " SYSTEM".                                                   DB1024.2
   000156         015600     02  FILLER     PICTURE X(26)  VALUE SPACE.                   DB1024.2 IMP
   000157         015700 01  CCVS-H-2.                                                    DB1024.2
   000158         015800     02 FILLER PICTURE X(52) VALUE IS                             DB1024.2
   000159         015900     "CCVS74 NCC  COPY, NOT FOR DISTRIBUTION.".                   DB1024.2
   000160         016000     02 FILLER PICTURE IS X(19) VALUE IS "TEST RESULTS SET-  ".   DB1024.2
   000161         016100     02 TEST-ID PICTURE IS X(9).                                  DB1024.2
   000162         016200     02 FILLER PICTURE IS X(40) VALUE IS SPACE.                   DB1024.2 IMP
   000163         016300 01  CCVS-H-3.                                                    DB1024.2
   000164         016400     02  FILLER PICTURE X(34) VALUE                               DB1024.2
   000165         016500     " FOR OFFICIAL USE ONLY    ".                                DB1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000166         016600     02  FILLER PICTURE X(58) VALUE                               DB1024.2
   000167         016700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".DB1024.2
   000168         016800     02  FILLER PICTURE X(28) VALUE                               DB1024.2
   000169         016900     "  COPYRIGHT   1974 ".                                       DB1024.2
   000170         017000 01  CCVS-E-1.                                                    DB1024.2
   000171         017100     02 FILLER PICTURE IS X(52) VALUE IS SPACE.                   DB1024.2 IMP
   000172         017200     02 FILLER PICTURE IS X(14) VALUE IS "END OF TEST-  ".        DB1024.2
   000173         017300     02 ID-AGAIN PICTURE IS X(9).                                 DB1024.2
   000174         017400     02 FILLER PICTURE X(45) VALUE IS                             DB1024.2
   000175         017500     " NTIS DISTRIBUTION COBOL 74".                               DB1024.2
   000176         017600 01  CCVS-E-2.                                                    DB1024.2
   000177         017700     02  FILLER                   PICTURE X(31)  VALUE            DB1024.2
   000178         017800     SPACE.                                                       DB1024.2 IMP
   000179         017900     02  FILLER                   PICTURE X(21)  VALUE SPACE.     DB1024.2 IMP
   000180         018000     02 CCVS-E-2-2.                                               DB1024.2
   000181         018100         03 ERROR-TOTAL PICTURE IS XXX VALUE IS SPACE.            DB1024.2 IMP
   000182         018200         03 FILLER PICTURE IS X VALUE IS SPACE.                   DB1024.2 IMP
   000183         018300         03 ENDER-DESC PIC X(44) VALUE "ERRORS ENCOUNTERED".      DB1024.2
   000184         018400 01  CCVS-E-3.                                                    DB1024.2
   000185         018500     02  FILLER PICTURE X(22) VALUE                               DB1024.2
   000186         018600     " FOR OFFICIAL USE ONLY".                                    DB1024.2
   000187         018700     02  FILLER PICTURE X(12) VALUE SPACE.                        DB1024.2 IMP
   000188         018800     02  FILLER PICTURE X(58) VALUE                               DB1024.2
   000189         018900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".DB1024.2
   000190         019000     02  FILLER PICTURE X(13) VALUE SPACE.                        DB1024.2 IMP
   000191         019100     02 FILLER PIC X(15) VALUE " COPYRIGHT 1974".                 DB1024.2
   000192         019200 01  CCVS-E-4.                                                    DB1024.2
   000193         019300     02 CCVS-E-4-1 PIC XXX VALUE SPACE.                           DB1024.2 IMP
   000194         019400     02 FILLER PIC XXXX VALUE " OF ".                             DB1024.2
   000195         019500     02 CCVS-E-4-2 PIC XXX VALUE SPACE.                           DB1024.2 IMP
   000196         019600     02 FILLER PIC X(40) VALUE                                    DB1024.2
   000197         019700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       DB1024.2
   000198         019800 01  XXINFO.                                                      DB1024.2
   000199         019900     02 FILLER PIC X(30) VALUE "        *** INFORMATION  ***".    DB1024.2
   000200         020000     02 INFO-TEXT.                                                DB1024.2
   000201         020100     04 FILLER PIC X(20) VALUE SPACE.                             DB1024.2 IMP
   000202         020200     04 XXCOMPUTED PIC X(20).                                     DB1024.2
   000203         020300     04 FILLER PIC X(5) VALUE SPACE.                              DB1024.2 IMP
   000204         020400     04 XXCORRECT PIC X(20).                                      DB1024.2
   000205         020500 01  HYPHEN-LINE.                                                 DB1024.2
   000206         020600     02 FILLER PICTURE IS X VALUE IS SPACE.                       DB1024.2 IMP
   000207         020700     02 FILLER PICTURE IS X(65) VALUE IS "************************DB1024.2
   000208         020800-    "*****************************************".                 DB1024.2
   000209         020900     02 FILLER PICTURE IS X(54) VALUE IS "************************DB1024.2
   000210         021000-    "******************************".                            DB1024.2
   000211         021100 01  CCVS-PGM-ID PIC X(6) VALUE                                   DB1024.2
   000212         021200     "DB102A".                                                    DB1024.2
   000213         021300 PROCEDURE DIVISION.                                              DB1024.2
   000214         021400 DECLARATIVES.                                                    DB1024.2
   000215         021500 START-UP SECTION.                                                DB1024.2
   000216         021600     USE FOR DEBUGGING ON OPEN-FILES.                             DB1024.2 251
   000217         021700 BEGIN-START-UP.                                                  DB1024.2
   000218         021800     MOVE 1 TO RESULT-FLAG.                                       DB1024.2 67
   000219         021900 DB-COMMON.                                                       DB1024.2
   000220         022000     MOVE DEBUG-LINE TO DBLINE-HOLD.                              DB1024.2 IMP 68
   000221         022100     MOVE DEBUG-NAME TO DBNAME-HOLD.                              DB1024.2 IMP 69
   000222         022200     MOVE DEBUG-CONTENTS TO DBCONT-HOLD.                          DB1024.2 IMP 70
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000223         022300 FALL-THROUGH-AND-SERIES SECTION.                                 DB1024.2
   000224         022400     USE FOR DEBUGGING ON FALL-THROUGH-TEST                       DB1024.2
   000225         022500              PROC-SERIES-TEST.                                   DB1024.2 383 409
   000226         022600 BEGIN-FALL-THROUGH-AND-SERIES.                                   DB1024.2
   000227         022700     PERFORM DB-COMMON.                                           DB1024.2 219
   000228         022800     MOVE 2 TO RESULT-FLAG.                                       DB1024.2 67
   000229         022900 GO-TO SECTION.                                                   DB1024.2
   000230         023000     USE FOR DEBUGGING ON GO-TO-TEST.                             DB1024.2 441
   000231         023100 BEGIN-GO-TO.                                                     DB1024.2
   000232         023200     PERFORM DB-COMMON.                                           DB1024.2 219
   000233         023300     MOVE 3 TO RESULT-FLAG.                                       DB1024.2 67
   000234         023400 ALTER-PARAGRAPH SECTION.                                         DB1024.2
   000235         023500     USE FOR DEBUGGING ON ALTERABLE-PARAGRAPH.                    DB1024.2 435
   000236         023600 BEGIN-ALTER-PARAGRAPH.                                           DB1024.2
   000237         023700     PERFORM DB-COMMON.                                           DB1024.2 219
   000238         023800     MOVE 4 TO RESULT-FLAG.                                       DB1024.2 67
   000239         023900 LOOP-ITERATION SECTION.                                          DB1024.2
   000240         024000     USE FOR DEBUGGING ON LOOP-ROUTINE.                           DB1024.2 552
   000241         024100 BEGIN-LOOP-ITERATION.                                            DB1024.2
   000242         024200     PERFORM DB-COMMON.                                           DB1024.2 219
   000243         024300     ADD 1 TO RESULT-FLAG.                                        DB1024.2 67
   000244         024400 PERFORM-THRU SECTION.                                            DB1024.2
   000245         024500     USE FOR DEBUGGING ON DO-NOTHING-1.                           DB1024.2 557
   000246         024600 BEGIN-PERFORM-THRU.                                              DB1024.2
   000247         024700     PERFORM DB-COMMON.                                           DB1024.2 219
   000248         024800     ADD 1 TO RESULT-FLAG.                                        DB1024.2 67
   000249         024900 END DECLARATIVES.                                                DB1024.2
   000250         025000 CCVS1 SECTION.                                                   DB1024.2
   000251         025100 OPEN-FILES.                                                      DB1024.2
   000252         025200     OPEN     OUTPUT PRINT-FILE.                                  DB1024.2 56
   000253         025300     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   DB1024.2 211 161 211 173
   000254         025400     MOVE    SPACE TO TEST-RESULTS.                               DB1024.2 IMP 91
   000255         025500     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             DB1024.2 280 284
   000256         025600     GO TO CCVS1-EXIT.                                            DB1024.2 355
   000257         025700 CLOSE-FILES.                                                     DB1024.2
   000258         025800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   DB1024.2 288 309 56
   000259         025900 TERMINATE-CCVS.                                                  DB1024.2
   000260         026000     EXIT PROGRAM.                                                DB1024.2
   000261         026100 TERMINATE-CALL.                                                  DB1024.2
   000262         026200     STOP     RUN.                                                DB1024.2
   000263         026300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         DB1024.2 95 145
   000264         026400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           DB1024.2 95 146
   000265         026500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          DB1024.2 95 144
   000266         026600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.          DB1024.2 95 143
   000267         026700     MOVE "****TEST DELETED****" TO RE-MARK.                      DB1024.2 103
   000268         026800 PRINT-DETAIL.                                                    DB1024.2
   000269         026900     IF REC-CT NOT EQUAL TO ZERO                                  DB1024.2 142 IMP
   000270      1  027000             MOVE "." TO PARDOT-X                                 DB1024.2 99
   000271      1  027100             MOVE REC-CT TO DOTVALUE.                             DB1024.2 142 100
   000272         027200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      DB1024.2 91 60 321
   000273         027300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               DB1024.2 95 321
   000274      1  027400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 DB1024.2 338 347
   000275      1  027500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 DB1024.2 348 354
   000276         027600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              DB1024.2 IMP 95 IMP 107
   000277         027700     MOVE SPACE TO CORRECT-X.                                     DB1024.2 IMP 120
   000278         027800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         DB1024.2 142 IMP IMP 97
   000279         027900     MOVE     SPACE TO RE-MARK.                                   DB1024.2 IMP 103
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000280         028000 HEAD-ROUTINE.                                                    DB1024.2
   000281         028100     MOVE CCVS-H-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1024.2 151 61 321
   000282         028200     MOVE CCVS-H-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.   DB1024.2 157 61 321
   000283         028300     MOVE CCVS-H-3 TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.   DB1024.2 163 61 321
   000284         028400 COLUMN-NAMES-ROUTINE.                                            DB1024.2
   000285         028500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1024.2 130 61 321
   000286         028600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1024.2 135 61 321
   000287         028700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        DB1024.2 205 61 321
   000288         028800 END-ROUTINE.                                                     DB1024.2
   000289         028900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.DB1024.2 205 61 321
   000290         029000 END-RTN-EXIT.                                                    DB1024.2
   000291         029100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1024.2 170 61 321
   000292         029200 END-ROUTINE-1.                                                   DB1024.2
   000293         029300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      DB1024.2 144 148 145
   000294         029400      ERROR-HOLD. ADD DELETE-CNT TO ERROR-HOLD.                   DB1024.2 148 143 148
   000295         029500      ADD PASS-COUNTER TO ERROR-HOLD.                             DB1024.2 146 148
   000296         029600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   DB1024.2
   000297         029700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            DB1024.2 146 193
   000298         029800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              DB1024.2 148 195
   000299         029900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                DB1024.2 192 180
   000300         030000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           DB1024.2 176 61 321
   000301         030100  END-ROUTINE-12.                                                 DB1024.2
   000302         030200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        DB1024.2 183
   000303         030300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      DB1024.2 144 IMP
   000304      1  030400         MOVE "NO " TO ERROR-TOTAL                                DB1024.2 181
   000305         030500         ELSE                                                     DB1024.2
   000306      1  030600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       DB1024.2 144 181
   000307         030700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           DB1024.2 176 61
   000308         030800     PERFORM WRITE-LINE.                                          DB1024.2 321
   000309         030900 END-ROUTINE-13.                                                  DB1024.2
   000310         031000     IF DELETE-CNT IS EQUAL TO ZERO                               DB1024.2 143 IMP
   000311      1  031100         MOVE "NO " TO ERROR-TOTAL  ELSE                          DB1024.2 181
   000312      1  031200         MOVE DELETE-CNT TO ERROR-TOTAL.                          DB1024.2 143 181
   000313         031300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   DB1024.2 183
   000314         031400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1024.2 176 61 321
   000315         031500      IF   INSPECT-COUNTER EQUAL TO ZERO                          DB1024.2 145 IMP
   000316      1  031600          MOVE "NO " TO ERROR-TOTAL                               DB1024.2 181
   000317      1  031700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   DB1024.2 145 181
   000318         031800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            DB1024.2 183
   000319         031900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          DB1024.2 176 61 321
   000320         032000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1024.2 184 61 321
   000321         032100 WRITE-LINE.                                                      DB1024.2
   000322         032200     ADD 1 TO RECORD-COUNT.                                       DB1024.2 150
   000323         032300     IF RECORD-COUNT GREATER 50                                   DB1024.2 150
   000324      1  032400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          DB1024.2 61 149
   000325      1  032500         MOVE SPACE TO DUMMY-RECORD                               DB1024.2 IMP 61
   000326      1  032600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  DB1024.2 61
   000327      1  032700         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             DB1024.2 130 61 333
   000328      1  032800         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     DB1024.2 135 61 333
   000329      1  032900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          DB1024.2 205 61 333
   000330      1  033000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          DB1024.2 149 61
   000331      1  033100         MOVE ZERO TO RECORD-COUNT.                               DB1024.2 IMP 150
   000332         033200     PERFORM WRT-LN.                                              DB1024.2 333
   000333         033300 WRT-LN.                                                          DB1024.2
   000334         033400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               DB1024.2 61
   000335         033500     MOVE SPACE TO DUMMY-RECORD.                                  DB1024.2 IMP 61
   000336         033600 BLANK-LINE-PRINT.                                                DB1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000337         033700     PERFORM WRT-LN.                                              DB1024.2 333
   000338         033800 FAIL-ROUTINE.                                                    DB1024.2
   000339         033900     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.   DB1024.2 107 IMP 344
   000340         034000     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.    DB1024.2 120 IMP 344
   000341         034100     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    DB1024.2 200
   000342         034200     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     DB1024.2 198 61 321
   000343         034300     GO TO FAIL-ROUTINE-EX.                                       DB1024.2 347
   000344         034400 FAIL-ROUTINE-WRITE.                                              DB1024.2
   000345         034500     MOVE TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE           DB1024.2 104 60 321
   000346         034600     MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES.   DB1024.2 117 60 321
   000347         034700 FAIL-ROUTINE-EX. EXIT.                                           DB1024.2
   000348         034800 BAIL-OUT.                                                        DB1024.2
   000349         034900     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.       DB1024.2 108 IMP 351
   000350         035000     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.               DB1024.2 121 IMP 354
   000351         035100 BAIL-OUT-WRITE.                                                  DB1024.2
   000352         035200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  DB1024.2 121 204 108 202
   000353         035300     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     DB1024.2 198 61 321
   000354         035400 BAIL-OUT-EX. EXIT.                                               DB1024.2
   000355         035500 CCVS1-EXIT.                                                      DB1024.2
   000356         035600     EXIT.                                                        DB1024.2
   000357         035700 START-PROGRAM-TEST.                                              DB1024.2
   000358         035800     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1024.2 67
   000359      1  035900         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1024.2 103
   000360      1  036000         PERFORM FAIL                                             DB1024.2 265
   000361      1  036100         PERFORM START-PROGRAM-WRITE                              DB1024.2 378
   000362      1  036200         ELSE PERFORM PASS                                        DB1024.2 264
   000363      1  036300         GO TO START-PROGRAM-WRITE.                               DB1024.2 378
   000364         036400     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000365         036500     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1024.2 121
   000366         036600     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1024.2 68 108
   000367         036700     PERFORM START-PROGRAM-WRITE.                                 DB1024.2 378
   000368         036800     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000369         036900     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1024.2 121
   000370         037000     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1024.2 69 108
   000371         037100     PERFORM START-PROGRAM-WRITE.                                 DB1024.2 378
   000372         037200     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1024.2 103
   000373         037300     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1024.2 121
   000374         037400     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1024.2 70 108
   000375         037500     GO TO   START-PROGRAM-WRITE.                                 DB1024.2 378
   000376         037600 START-PROGRAM-DELETE.                                            DB1024.2
   000377         037700     PERFORM DE-LETE.                                             DB1024.2 266
   000378         037800 START-PROGRAM-WRITE.                                             DB1024.2
   000379         037900     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1024.2 93
   000380         038000     MOVE "START-PROGRAM-TEST" TO PAR-NAME.                       DB1024.2 97
   000381         038100     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000382         038200     MOVE 0 TO RESULT-FLAG.                                       DB1024.2 67
   000383         038300 FALL-THROUGH-TEST.                                               DB1024.2
   000384         038400     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1024.2 67
   000385      1  038500         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1024.2 103
   000386      1  038600         PERFORM FAIL                                             DB1024.2 265
   000387      1  038700         PERFORM FALL-THROUGH-WRITE                               DB1024.2 404
   000388      1  038800         ELSE PERFORM PASS                                        DB1024.2 264
   000389      1  038900         GO TO FALL-THROUGH-WRITE.                                DB1024.2 404
   000390         039000     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000391         039100     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1024.2 121
   000392         039200     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1024.2 68 108
   000393         039300     PERFORM FALL-THROUGH-WRITE.                                  DB1024.2 404
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000394         039400     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000395         039500     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1024.2 121
   000396         039600     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1024.2 69 108
   000397         039700     PERFORM FALL-THROUGH-WRITE.                                  DB1024.2 404
   000398         039800     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1024.2 103
   000399         039900     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1024.2 121
   000400         040000     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1024.2 70 108
   000401         040100     GO TO   FALL-THROUGH-WRITE.                                  DB1024.2 404
   000402         040200 FALL-THROUGH-DELETE.                                             DB1024.2
   000403         040300     PERFORM DE-LETE.                                             DB1024.2 266
   000404         040400 FALL-THROUGH-WRITE.                                              DB1024.2
   000405         040500     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1024.2 93
   000406         040600     MOVE "FALL-THROUGH-TEST" TO PAR-NAME.                        DB1024.2 97
   000407         040700     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000408         040800     MOVE 0 TO RESULT-FLAG.                                       DB1024.2 67
   000409         040900 PROC-SERIES-TEST.                                                DB1024.2
   000410         041000     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1024.2 67
   000411      1  041100         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1024.2 103
   000412      1  041200         PERFORM FAIL                                             DB1024.2 265
   000413      1  041300         PERFORM PROC-SERIES-WRITE                                DB1024.2 430
   000414      1  041400         ELSE PERFORM PASS                                        DB1024.2 264
   000415      1  041500         GO TO PROC-SERIES-WRITE.                                 DB1024.2 430
   000416         041600     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000417         041700     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1024.2 121
   000418         041800     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1024.2 68 108
   000419         041900     PERFORM PROC-SERIES-WRITE.                                   DB1024.2 430
   000420         042000     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000421         042100     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1024.2 121
   000422         042200     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1024.2 69 108
   000423         042300     PERFORM PROC-SERIES-WRITE.                                   DB1024.2 430
   000424         042400     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1024.2 103
   000425         042500     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1024.2 121
   000426         042600     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1024.2 70 108
   000427         042700     GO TO   PROC-SERIES-WRITE.                                   DB1024.2 430
   000428         042800 PROC-SERIES-DELETE.                                              DB1024.2
   000429         042900     PERFORM DE-LETE.                                             DB1024.2 266
   000430         043000 PROC-SERIES-WRITE.                                               DB1024.2
   000431         043100     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1024.2 93
   000432         043200     MOVE "PROC-SERIES-TEST" TO PAR-NAME.                         DB1024.2 97
   000433         043300     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000434         043400     MOVE 0 TO RESULT-FLAG.                                       DB1024.2 67
   000435         043500 ALTERABLE-PARAGRAPH.                                             DB1024.2
   000436         043600     GO TO GO-TO-TEST.                                            DB1024.2 441
   000437         043700 FILLER-PARAGRAPH.                                                DB1024.2
   000438         043800     DISPLAY "ALTER FAILED AT ALTER-TEST-INIT".                   DB1024.2
   000439         043900     PERFORM FAIL.                                                DB1024.2 265
   000440         044000     GO TO ALTERED-GO-TO-TEST.                                    DB1024.2 497
   000441         044100 GO-TO-TEST.                                                      DB1024.2
   000442         044200     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1024.2 67
   000443      1  044300         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1024.2 103
   000444      1  044400         PERFORM FAIL                                             DB1024.2 265
   000445      1  044500         PERFORM GO-TO-WRITE                                      DB1024.2 462
   000446      1  044600         ELSE PERFORM PASS                                        DB1024.2 264
   000447      1  044700         GO TO GO-TO-WRITE.                                       DB1024.2 462
   000448         044800     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000449         044900     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1024.2 121
   000450         045000     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1024.2 68 108
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000451         045100     PERFORM GO-TO-WRITE.                                         DB1024.2 462
   000452         045200     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000453         045300     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1024.2 121
   000454         045400     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1024.2 69 108
   000455         045500     PERFORM GO-TO-WRITE.                                         DB1024.2 462
   000456         045600     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1024.2 103
   000457         045700     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1024.2 121
   000458         045800     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1024.2 70 108
   000459         045900     GO TO   GO-TO-WRITE.                                         DB1024.2 462
   000460         046000 GO-TO-DELETE.                                                    DB1024.2
   000461         046100     PERFORM DE-LETE.                                             DB1024.2 266
   000462         046200 GO-TO-WRITE.                                                     DB1024.2
   000463         046300     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1024.2 93
   000464         046400     MOVE "GO-TO-TEST" TO PAR-NAME.                               DB1024.2 97
   000465         046500     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000466         046600     MOVE 0 TO RESULT-FLAG.                                       DB1024.2 67
   000467         046700 ALTER-TEST-INIT.                                                 DB1024.2
   000468         046800     ALTER ALTERABLE-PARAGRAPH TO PROCEED TO ALTERED-GO-TO-TEST.  DB1024.2 435 497
   000469         046900 ALTER-TEST.                                                      DB1024.2
   000470         047000     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1024.2 67
   000471      1  047100         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1024.2 103
   000472      1  047200         PERFORM FAIL                                             DB1024.2 265
   000473      1  047300         PERFORM ALTER-WRITE                                      DB1024.2 490
   000474      1  047400         ELSE PERFORM PASS                                        DB1024.2 264
   000475      1  047500         GO TO ALTER-WRITE.                                       DB1024.2 490
   000476         047600     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000477         047700     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1024.2 121
   000478         047800     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1024.2 68 108
   000479         047900     PERFORM ALTER-WRITE.                                         DB1024.2 490
   000480         048000     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000481         048100     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1024.2 121
   000482         048200     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1024.2 69 108
   000483         048300     PERFORM ALTER-WRITE.                                         DB1024.2 490
   000484         048400     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1024.2 103
   000485         048500     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1024.2 121
   000486         048600     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1024.2 70 108
   000487         048700     GO TO   ALTER-WRITE.                                         DB1024.2 490
   000488         048800 ALTER-DELETE.                                                    DB1024.2
   000489         048900     PERFORM DE-LETE.                                             DB1024.2 266
   000490         049000 ALTER-WRITE.                                                     DB1024.2
   000491         049100     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1024.2 93
   000492         049200     MOVE "ALTER-TEST" TO PAR-NAME.                               DB1024.2 97
   000493         049300     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000494         049400     MOVE 0 TO RESULT-FLAG.                                       DB1024.2 67
   000495         049500 ALTER-WRITE-END.                                                 DB1024.2
   000496         049600     GO TO ALTERABLE-PARAGRAPH.                                   DB1024.2 435
   000497         049700 ALTERED-GO-TO-TEST.                                              DB1024.2
   000498         049800     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1024.2 67
   000499      1  049900         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1024.2 103
   000500      1  050000         PERFORM FAIL                                             DB1024.2 265
   000501      1  050100         PERFORM ALTERED-GO-TO-WRITE                              DB1024.2 518
   000502      1  050200         ELSE PERFORM PASS                                        DB1024.2 264
   000503      1  050300         GO TO ALTERED-GO-TO-WRITE.                               DB1024.2 518
   000504         050400     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000505         050500     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1024.2 121
   000506         050600     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1024.2 68 108
   000507         050700     PERFORM ALTERED-GO-TO-WRITE.                                 DB1024.2 518
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000508         050800     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000509         050900     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1024.2 121
   000510         051000     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1024.2 69 108
   000511         051100     PERFORM ALTERED-GO-TO-WRITE.                                 DB1024.2 518
   000512         051200     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1024.2 103
   000513         051300     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1024.2 121
   000514         051400     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1024.2 70 108
   000515         051500     GO TO   ALTERED-GO-TO-WRITE.                                 DB1024.2 518
   000516         051600 ALTERED-GO-TO-DELETE.                                            DB1024.2
   000517         051700     PERFORM DE-LETE.                                             DB1024.2 266
   000518         051800 ALTERED-GO-TO-WRITE.                                             DB1024.2
   000519         051900     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1024.2 93
   000520         052000     MOVE "ALTERED-GO-TO-TEST" TO PAR-NAME.                       DB1024.2 97
   000521         052100     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000522         052200     MOVE 0 TO RESULT-FLAG.                                       DB1024.2 67
   000523         052300 PERF-ITERATION-TEST.                                             DB1024.2
   000524         052400     PERFORM LOOP-ROUTINE FIVE TIMES.                             DB1024.2 552 71
   000525         052500     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1024.2 67
   000526      1  052600         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1024.2 103
   000527      1  052700         PERFORM FAIL                                             DB1024.2 265
   000528      1  052800         PERFORM PERF-ITERATION-WRITE                             DB1024.2 545
   000529      1  052900         ELSE  PERFORM PASS                                       DB1024.2 264
   000530      1  053000         GO TO PERF-ITERATION-WRITE.                              DB1024.2 545
   000531         053100     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000532         053200     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1024.2 121
   000533         053300     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1024.2 68 108
   000534         053400     PERFORM PERF-ITERATION-WRITE.                                DB1024.2 545
   000535         053500     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000536         053600     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1024.2 121
   000537         053700     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1024.2 69 108
   000538         053800     PERFORM PERF-ITERATION-WRITE.                                DB1024.2 545
   000539         053900     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1024.2 103
   000540         054000     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1024.2 121
   000541         054100     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1024.2 70 108
   000542         054200     GO TO   PERF-ITERATION-WRITE.                                DB1024.2 545
   000543         054300 PERF-ITERATION-DELETE.                                           DB1024.2
   000544         054400     PERFORM DE-LETE.                                             DB1024.2 266
   000545         054500 PERF-ITERATION-WRITE.                                            DB1024.2
   000546         054600     MOVE "PERF-ITERATION-TEST" TO PAR-NAME.                      DB1024.2 97
   000547         054700     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1024.2 93
   000548         054800     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000549         054900     MOVE 0 TO RESULT-FLAG.                                       DB1024.2 67
   000550         055000 PERF-ITERATION-END.                                              DB1024.2
   000551         055100     GO TO PERFORM-THRU-TEST.                                     DB1024.2 559
   000552         055200 LOOP-ROUTINE.                                                    DB1024.2
   000553         055400* ACTION RESULTING IN LOOP UNFOLDING AND REDUCTION.               DB1024.2
   000554         055500     PERFORM DO-NOTHING.                                          DB1024.2 555
   000555         055600 DO-NOTHING.                                                      DB1024.2
   000556         055700     ADD A B C GIVING D.                                          DB1024.2 63 64 65 66
   000557         055800 DO-NOTHING-1.                                                    DB1024.2
   000558         055900     SUBTRACT A FROM B.                                           DB1024.2 63 64
   000559         056000 PERFORM-THRU-TEST.                                               DB1024.2
   000560         056100     PERFORM DO-NOTHING THRU DO-NOTHING-1 FIVE TIMES.             DB1024.2 555 557 71
   000561         056200     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1024.2 67
   000562      1  056300         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1024.2 103
   000563      1  056400         PERFORM FAIL                                             DB1024.2 265
   000564      1  056500         PERFORM PERFORM-THRU-WRITE                               DB1024.2 581
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000565      1  056600         ELSE PERFORM PASS                                        DB1024.2 264
   000566      1  056700         GO TO PERFORM-THRU-WRITE.                                DB1024.2 581
   000567         056800     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000568         056900     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1024.2 121
   000569         057000     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1024.2 68 108
   000570         057100     PERFORM PERFORM-THRU-WRITE.                                  DB1024.2 581
   000571         057200     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000572         057300     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1024.2 121
   000573         057400     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1024.2 69 108
   000574         057500     PERFORM PERFORM-THRU-WRITE.                                  DB1024.2 581
   000575         057600     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1024.2 103
   000576         057700     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1024.2 121
   000577         057800     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1024.2 70 108
   000578         057900     GO TO   PERFORM-THRU-WRITE.                                  DB1024.2 581
   000579         058000 PERFORM-THRU-DELETE.                                             DB1024.2
   000580         058100     PERFORM DE-LETE.                                             DB1024.2 266
   000581         058200 PERFORM-THRU-WRITE.                                              DB1024.2
   000582         058300     MOVE "PERFORM-THRU-TEST" TO PAR-NAME.                        DB1024.2 97
   000583         058400     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1024.2 93
   000584         058500     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000585         058600     MOVE 0 TO RESULT-FLAG.                                       DB1024.2 67
   000586         058700 SIMPLE-PERFORM-TEST.                                             DB1024.2
   000587         058800     PERFORM LOOP-ROUTINE.                                        DB1024.2 552
   000588         058900     IF RESULT-FLAG IS NOT EQUAL TO 0                             DB1024.2 67
   000589      1  059000         MOVE "USE PROCEDURE EXECUTED" TO RE-MARK                 DB1024.2 103
   000590      1  059100         PERFORM FAIL                                             DB1024.2 265
   000591      1  059200         PERFORM SIMPLE-PERFORM-WRITE                             DB1024.2 608
   000592      1  059300         ELSE PERFORM PASS                                        DB1024.2 264
   000593      1  059400         GO TO SIMPLE-PERFORM-WRITE.                              DB1024.2 608
   000594         059500     MOVE "DEBUG-LINE; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000595         059600     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1024.2 121
   000596         059700     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1024.2 68 108
   000597         059800     PERFORM SIMPLE-PERFORM-WRITE.                                DB1024.2 608
   000598         059900     MOVE "DEBUG-NAME; SEE NEXT LINE" TO RE-MARK.                 DB1024.2 103
   000599         060000     MOVE "<===  DEBUG-NAME" TO CORRECT-A.                        DB1024.2 121
   000600         060100     MOVE DBNAME-HOLD TO COMPUTED-A.                              DB1024.2 69 108
   000601         060200     PERFORM SIMPLE-PERFORM-WRITE.                                DB1024.2 608
   000602         060300     MOVE "DEBUG-CONTENTS; SEE NEXT LINE" TO RE-MARK.             DB1024.2 103
   000603         060400     MOVE "<===  DEBUG-CONTENTS" TO CORRECT-A.                    DB1024.2 121
   000604         060500     MOVE DBCONT-HOLD TO COMPUTED-A.                              DB1024.2 70 108
   000605         060600     GO TO   SIMPLE-PERFORM-WRITE.                                DB1024.2 608
   000606         060700 SIMPLE-PERFORM-DELETE.                                           DB1024.2
   000607         060800     PERFORM DE-LETE.                                             DB1024.2 266
   000608         060900 SIMPLE-PERFORM-WRITE.                                            DB1024.2
   000609         061000     MOVE "SIMPLE-PERFORM-TEST" TO PAR-NAME.                      DB1024.2 97
   000610         061100     MOVE "DEBUG ON PROC-NAME" TO FEATURE.                        DB1024.2 93
   000611         061200     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000612         061300     MOVE 0 TO RESULT-FLAG.                                       DB1024.2 67
   000613         061400 DEBUG-LINE-TESTS-INIT.                                           DB1024.2
   000614         061500     MOVE "DEBUG LINE TESTS" TO FEATURE.                          DB1024.2 93
   000615         061600 DEBUG-LINE-TEST-01.                                              DB1024.2
   000616         061700     MOVE "COMPLETE ENTITY" TO RE-MARK.                           DB1024.2 103
   000617         061800     PERFORM FAIL.                                                DB1024.2 265
   000618         061900D    PERFORM PASS  SUBTRACT 1 FROM ERROR-COUNTER.                 DB1024.2 264 144
   000619         062000     GO TO DEBUG-LINE-WRITE-01.                                   DB1024.2 622
   000620         062100 DEBUG-LINE-DELETE-01.                                            DB1024.2
   000621         062200     PERFORM DE-LETE.                                             DB1024.2 266
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000622         062300 DEBUG-LINE-WRITE-01.                                             DB1024.2
   000623         062400     MOVE "DEBUG-LINE-TEST-01" TO PAR-NAME.                       DB1024.2 97
   000624         062500     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000625         062600 DEBUG-LINE-TEST-02.                                              DB1024.2
   000626         062700     MOVE "CONSECUTIVE DEBUG LINES" TO RE-MARK.                   DB1024.2 103
   000627         062800     PERFORM FAIL.                                                DB1024.2 265
   000628         062900D    PERFORM PASS.                                                DB1024.2 264
   000629         063000D    SUBTRACT 1 FROM ERROR-COUNTER.                               DB1024.2 144
   000630         063100     GO TO DEBUG-LINE-WRITE-02.                                   DB1024.2 633
   000631         063200 DEBUG-LINE-DELETE-02.                                            DB1024.2
   000632         063300     PERFORM DE-LETE.                                             DB1024.2 266
   000633         063400 DEBUG-LINE-WRITE-02.                                             DB1024.2
   000634         063500     MOVE "DEBUG-LINE-TEST-02" TO PAR-NAME.                       DB1024.2 97
   000635         063600     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000636         063700 DEBUG-LINE-TEST-03.                                              DB1024.2
   000637         063800     MOVE "BROKEN STATEMENTS" TO RE-MARK.                         DB1024.2 103
   000638         063900     PERFORM                                                      DB1024.2
   000639         064000D        PASS.  GO TO DEBUG-LINE-WRITE-03.                        DB1024.2 264 645
   000640         064100DDEBUG-LINE-TEST-03-A.    PERFORM                                 DB1024.2
   000641         064200                             FAIL.                                DB1024.2 265
   000642         064300                             GO TO DEBUG-LINE-WRITE-03.           DB1024.2 645
   000643         064400 DEBUG-LINE-DELETE-03.                                            DB1024.2
   000644         064500     PERFORM DE-LETE.                                             DB1024.2 266
   000645         064600 DEBUG-LINE-WRITE-03.                                             DB1024.2
   000646         064700     MOVE "DEBUG-LINE-TEST-03" TO PAR-NAME.                       DB1024.2 97
   000647         064800     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000648         064900 DEBUG-LINE-TEST-04.                                              DB1024.2
   000649         065000     MOVE "NESTED COMMENTS" TO RE-MARK.                           DB1024.2 103
   000650         065100D    PERFORM                                                      DB1024.2
   000651         065200*        FAIL.  GO TO DEBUG-LINE-WRITE-04.                        DB1024.2
   000652         065300*DEBUG-LINE-TEST-04-A.    PERFORM                                 DB1024.2
   000653         065400D                         PASS.  GO TO DEBUG-LINE-WRITE-04.       DB1024.2 264 660
   000654         065500 DEBUG-LINE-TEST-04-B.                                            DB1024.2
   000655         065600     MOVE "    FAILURE 04B" TO COMPUTED-A.                        DB1024.2 108
   000656         065700     PERFORM FAIL.                                                DB1024.2 265
   000657         065800     GO TO DEBUG-LINE-WRITE-04.                                   DB1024.2 660
   000658         065900 DEBUG-LINE-DELETE-04.                                            DB1024.2
   000659         066000     PERFORM DE-LETE.                                             DB1024.2 266
   000660         066100 DEBUG-LINE-WRITE-04.                                             DB1024.2
   000661         066200     MOVE "DEBUG-LINE-TEST-04" TO PAR-NAME.                       DB1024.2 97
   000662         066300     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000663         066400 DEBUG-LINE-TEST-05.                                              DB1024.2
   000664         066500     MOVE "NESTED INSIDE COMMENTS" TO RE-MARK.                    DB1024.2 103
   000665         066600*    PERFORM FAIL.                                                DB1024.2
   000666         066700*    GO TO DEBUG-LINE-WRITE-05.                                   DB1024.2
   000667         066800*DEBUG-LINE-TEST-05-A.                                            DB1024.2
   000668         066900D    PERFORM PASS.                                                DB1024.2 264
   000669         067000D    GO TO DEBUG-LINE-WRITE-05.                                   DB1024.2 678
   000670         067100*DEBUG-LINE-TEST-05-B.                                            DB1024.2
   000671         067200*    MOVE "    FAILURE 05B" TO COMPUTED-A.                        DB1024.2
   000672         067300*    PERFORM FAIL.  GO TO DEBUG-LINE-WRITE-05.                    DB1024.2
   000673         067400 DEBUG-LINE-TEST-05-C.                                            DB1024.2
   000674         067500     MOVE "    FAILURE 05C" TO COMPUTED-A.                        DB1024.2 108
   000675         067600     PERFORM FAIL.   GO TO DEBUG-LINE-WRITE-05.                   DB1024.2 265 678
   000676         067700 DEBUG-LINE-DELETE-05.                                            DB1024.2
   000677         067800     PERFORM DE-LETE.                                             DB1024.2 266
   000678         067900 DEBUG-LINE-WRITE-05.                                             DB1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000679         068000     MOVE "DEBUG-LINE-TEST-05" TO PAR-NAME.                       DB1024.2 97
   000680         068100     PERFORM PRINT-DETAIL.                                        DB1024.2 268
   000681         068200 CCVS-EXIT SECTION.                                               DB1024.2
   000682         068300 CCVS-999999.                                                     DB1024.2
   000683         068400     GO TO CLOSE-FILES.                                           DB1024.2 257
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       63   A. . . . . . . . . . . . . . .  556 558
       64   B. . . . . . . . . . . . . . .  556 M558
       65   C. . . . . . . . . . . . . . .  556
      130   CCVS-C-1 . . . . . . . . . . .  285 327
      135   CCVS-C-2 . . . . . . . . . . .  286 328
      170   CCVS-E-1 . . . . . . . . . . .  291
      176   CCVS-E-2 . . . . . . . . . . .  300 307 314 319
      180   CCVS-E-2-2 . . . . . . . . . .  M299
      184   CCVS-E-3 . . . . . . . . . . .  320
      192   CCVS-E-4 . . . . . . . . . . .  299
      193   CCVS-E-4-1 . . . . . . . . . .  M297
      195   CCVS-E-4-2 . . . . . . . . . .  M298
      151   CCVS-H-1 . . . . . . . . . . .  281
      157   CCVS-H-2 . . . . . . . . . . .  282
      163   CCVS-H-3 . . . . . . . . . . .  283
      211   CCVS-PGM-ID. . . . . . . . . .  253 253
      113   CM-18V0
      108   COMPUTED-A . . . . . . . . . .  109 110 111 112 113 349 352 M366 M370 M374 M392 M396 M400 M418 M422 M426 M450
                                            M454 M458 M478 M482 M486 M506 M510 M514 M533 M537 M541 M569 M573 M577 M596 M600
                                            M604 M655 M674
      109   COMPUTED-N
      107   COMPUTED-X . . . . . . . . . .  M276 339
      110   COMPUTED-0V18
      112   COMPUTED-14V4
      114   COMPUTED-18V0
      111   COMPUTED-4V14
      121   CORRECT-A. . . . . . . . . . .  122 123 124 125 126 350 352 M365 M369 M373 M391 M395 M399 M417 M421 M425 M449
                                            M453 M457 M477 M481 M485 M505 M509 M513 M532 M536 M540 M568 M572 M576 M595 M599
                                            M603
      122   CORRECT-N
      120   CORRECT-X. . . . . . . . . . .  M277 340
      123   CORRECT-0V18
      125   CORRECT-14V4
      127   CORRECT-18V0
      124   CORRECT-4V14
      126   CR-18V0
       66   D. . . . . . . . . . . . . . .  M556
       70   DBCONT-HOLD. . . . . . . . . .  M222 374 400 426 458 486 514 541 577 604
       68   DBLINE-HOLD. . . . . . . . . .  M220 366 392 418 450 478 506 533 569 596
       69   DBNAME-HOLD. . . . . . . . . .  M221 370 396 422 454 482 510 537 573 600
        0   DEBUG-CONTENTS . . . . . . . .  222
        0   DEBUG-LINE . . . . . . . . . .  220
        0   DEBUG-NAME . . . . . . . . . .  221
      143   DELETE-CNT . . . . . . . . . .  M266 294 310 312
      100   DOTVALUE . . . . . . . . . . .  M271
      149   DUMMY-HOLD . . . . . . . . . .  M324 330
       61   DUMMY-RECORD . . . . . . . . .  M281 M282 M283 M285 M286 M287 M289 M291 M300 M307 M314 M319 M320 324 M325 326
                                            M327 M328 M329 M330 334 M335 M342 M353
      183   ENDER-DESC . . . . . . . . . .  M302 M313 M318
      144   ERROR-COUNTER. . . . . . . . .  M265 293 303 306 M618 M629
      148   ERROR-HOLD . . . . . . . . . .  M293 M294 M294 M295 298
      181   ERROR-TOTAL. . . . . . . . . .  M304 M306 M311 M312 M316 M317
       93   FEATURE. . . . . . . . . . . .  M379 M405 M431 M463 M491 M519 M547 M583 M610 M614
       71   FIVE . . . . . . . . . . . . .  524 560
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    17
0 Defined   Cross-reference of data names   References

0     205   HYPHEN-LINE. . . . . . . . . .  287 289 329
      173   ID-AGAIN . . . . . . . . . . .  M253
      200   INFO-TEXT. . . . . . . . . . .  M341
      145   INSPECT-COUNTER. . . . . . . .  M263 293 315 317
       95   P-OR-F . . . . . . . . . . . .  M263 M264 M265 M266 273 M276
       97   PAR-NAME . . . . . . . . . . .  M278 M380 M406 M432 M464 M492 M520 M546 M582 M609 M623 M634 M646 M661 M679
       99   PARDOT-X . . . . . . . . . . .  M270
      146   PASS-COUNTER . . . . . . . . .  M264 295 297
       56   PRINT-FILE . . . . . . . . . .  52 252 258
       60   PRINT-REC. . . . . . . . . . .  M272 M345 M346
      103   RE-MARK. . . . . . . . . . . .  M267 M279 M359 M364 M368 M372 M385 M390 M394 M398 M411 M416 M420 M424 M443 M448
                                            M452 M456 M471 M476 M480 M484 M499 M504 M508 M512 M526 M531 M535 M539 M562 M567
                                            M571 M575 M589 M594 M598 M602 M616 M626 M637 M649 M664
      142   REC-CT . . . . . . . . . . . .  269 271 278
      141   REC-SKL-SUB
      150   RECORD-COUNT . . . . . . . . .  M322 323 M331
       67   RESULT-FLAG. . . . . . . . . .  M218 M228 M233 M238 M243 M248 358 M382 384 M408 410 M434 442 M466 470 M494 498
                                            M522 525 M549 561 M585 588 M612
       90   SIZE-10
       88   SIZE-11
       86   SIZE-12
       84   SIZE-13
       82   SIZE-14
       80   SIZE-15
       78   SIZE-16
       76   SIZE-17
       74   SIZE-18
       72   SIZE-19
      104   TEST-COMPUTED. . . . . . . . .  345
      117   TEST-CORRECT . . . . . . . . .  346
      161   TEST-ID. . . . . . . . . . . .  M253
       91   TEST-RESULTS . . . . . . . . .  M254 272
      147   TOTAL-ERROR
      202   XXCOMPUTED . . . . . . . . . .  M352
      204   XXCORRECT. . . . . . . . . . .  M352
      198   XXINFO . . . . . . . . . . . .  342 353
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    18
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

      488   ALTER-DELETE
      234   ALTER-PARAGRAPH
      469   ALTER-TEST
      467   ALTER-TEST-INIT
      490   ALTER-WRITE. . . . . . . . . .  P473 G475 P479 P483 G487
      495   ALTER-WRITE-END
      435   ALTERABLE-PARAGRAPH. . . . . .  U235 A468 G496
      516   ALTERED-GO-TO-DELETE
      497   ALTERED-GO-TO-TEST . . . . . .  G440 T468
      518   ALTERED-GO-TO-WRITE. . . . . .  P501 G503 P507 P511 G515
      348   BAIL-OUT . . . . . . . . . . .  P275
      354   BAIL-OUT-EX. . . . . . . . . .  E275 G350
      351   BAIL-OUT-WRITE . . . . . . . .  G349
      236   BEGIN-ALTER-PARAGRAPH
      226   BEGIN-FALL-THROUGH-AND-SERIES
      231   BEGIN-GO-TO
      241   BEGIN-LOOP-ITERATION
      246   BEGIN-PERFORM-THRU
      217   BEGIN-START-UP
      336   BLANK-LINE-PRINT
      681   CCVS-EXIT
      682   CCVS-999999
      250   CCVS1
      355   CCVS1-EXIT . . . . . . . . . .  G256
      257   CLOSE-FILES. . . . . . . . . .  G683
      284   COLUMN-NAMES-ROUTINE . . . . .  E255
      219   DB-COMMON. . . . . . . . . . .  P227 P232 P237 P242 P247
      266   DE-LETE. . . . . . . . . . . .  P377 P403 P429 P461 P489 P517 P544 P580 P607 P621 P632 P644 P659 P677
      620   DEBUG-LINE-DELETE-01
      631   DEBUG-LINE-DELETE-02
      643   DEBUG-LINE-DELETE-03
      658   DEBUG-LINE-DELETE-04
      676   DEBUG-LINE-DELETE-05
      615   DEBUG-LINE-TEST-01
      625   DEBUG-LINE-TEST-02
      636   DEBUG-LINE-TEST-03
      640   DEBUG-LINE-TEST-03-A
      648   DEBUG-LINE-TEST-04
      654   DEBUG-LINE-TEST-04-B
      663   DEBUG-LINE-TEST-05
      673   DEBUG-LINE-TEST-05-C
      613   DEBUG-LINE-TESTS-INIT
      622   DEBUG-LINE-WRITE-01. . . . . .  G619
      633   DEBUG-LINE-WRITE-02. . . . . .  G630
      645   DEBUG-LINE-WRITE-03. . . . . .  G639 G642
      660   DEBUG-LINE-WRITE-04. . . . . .  G653 G657
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    19
0 Defined   Cross-reference of procedures   References

0     678   DEBUG-LINE-WRITE-05. . . . . .  G669 G675
      555   DO-NOTHING . . . . . . . . . .  P554 P560
      557   DO-NOTHING-1 . . . . . . . . .  U245 E560
      288   END-ROUTINE. . . . . . . . . .  P258
      292   END-ROUTINE-1
      301   END-ROUTINE-12
      309   END-ROUTINE-13 . . . . . . . .  E258
      290   END-RTN-EXIT
      265   FAIL . . . . . . . . . . . . .  P360 P386 P412 P439 P444 P472 P500 P527 P563 P590 P617 P627 P641 P656 P675
      338   FAIL-ROUTINE . . . . . . . . .  P274
      347   FAIL-ROUTINE-EX. . . . . . . .  E274 G343
      344   FAIL-ROUTINE-WRITE . . . . . .  G339 G340
      223   FALL-THROUGH-AND-SERIES
      402   FALL-THROUGH-DELETE
      383   FALL-THROUGH-TEST. . . . . . .  U225
      404   FALL-THROUGH-WRITE . . . . . .  P387 G389 P393 P397 G401
      437   FILLER-PARAGRAPH
      229   GO-TO
      460   GO-TO-DELETE
      441   GO-TO-TEST . . . . . . . . . .  U230 G436
      462   GO-TO-WRITE. . . . . . . . . .  P445 G447 P451 P455 G459
      280   HEAD-ROUTINE . . . . . . . . .  P255
      263   INSPT
      239   LOOP-ITERATION
      552   LOOP-ROUTINE . . . . . . . . .  U240 P524 P587
      251   OPEN-FILES . . . . . . . . . .  U216
      264   PASS . . . . . . . . . . . . .  P362 P388 P414 P446 P474 P502 P529 P565 P592 P618 P628 P639 P653 P668
      543   PERF-ITERATION-DELETE
      550   PERF-ITERATION-END
      523   PERF-ITERATION-TEST
      545   PERF-ITERATION-WRITE . . . . .  P528 G530 P534 P538 G542
      244   PERFORM-THRU
      579   PERFORM-THRU-DELETE
      559   PERFORM-THRU-TEST. . . . . . .  G551
      581   PERFORM-THRU-WRITE . . . . . .  P564 G566 P570 P574 G578
      268   PRINT-DETAIL . . . . . . . . .  P381 P407 P433 P465 P493 P521 P548 P584 P611 P624 P635 P647 P662 P680
      428   PROC-SERIES-DELETE
      409   PROC-SERIES-TEST . . . . . . .  U225
      430   PROC-SERIES-WRITE. . . . . . .  P413 G415 P419 P423 G427
      606   SIMPLE-PERFORM-DELETE
      586   SIMPLE-PERFORM-TEST
      608   SIMPLE-PERFORM-WRITE . . . . .  P591 G593 P597 P601 G605
      376   START-PROGRAM-DELETE
      357   START-PROGRAM-TEST
      378   START-PROGRAM-WRITE. . . . . .  P361 G363 P367 P371 G375
      215   START-UP
      261   TERMINATE-CALL
      259   TERMINATE-CCVS
      321   WRITE-LINE . . . . . . . . . .  P272 P273 P281 P282 P283 P285 P286 P287 P289 P291 P300 P308 P314 P319 P320 P342
                                            P345 P346 P353
      333   WRT-LN . . . . . . . . . . . .  P327 P328 P329 P332 P337
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    20
0 Defined   Cross-reference of programs     References

        3   DB102A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB102A    Date 06/04/2022  Time 11:57:31   Page    21
0LineID  Message code  Message text

     56  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     58  IGYGR1174-S   "XXXXX084" was not defined as a data-name.  "XXXXX084" was discarded.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1                                  1
-* Statistics for COBOL program DB102A:
 *    Source records = 683
 *    Data Division statements = 78
 *    Procedure Division statements = 403
 *    Generated COBOL statements = 0
 *    Program complexity factor = 411
0End of compilation 1,  program DB102A,  highest severity 12.
0Return code 12
