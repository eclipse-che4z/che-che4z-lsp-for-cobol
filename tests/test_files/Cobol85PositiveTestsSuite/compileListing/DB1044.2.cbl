1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:34   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:34   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         DB1044.2
   000002         000200 PROGRAM-ID.                                                      DB1044.2
   000003         000300     DB104A.                                                      DB1044.2
   000004         000400 AUTHOR.                                                          DB1044.2
   000005         000500     FEDERAL COMPILER TESTING CENTER.                             DB1044.2
   000006         000600 INSTALLATION.                                                    DB1044.2
   000007         000700     GENERAL SERVICES ADMINISTRATION                              DB1044.2
   000008         000800     AUTOMATED      AND TELECOMMUNICATION SERVICE.                DB1044.2
   000009         000900     SOFTWARE DEVELOPMENT OFFICE.                                 DB1044.2
   000010         001000     5203 LEESBURG PIKE  SUITE 1100                               DB1044.2
   000011         001100     FALLS CHURCH VIRGINIA 22041.                                 DB1044.2
   000012         001200                                                                  DB1044.2
   000013         001300     PHONE   (703) 756-6153                                       DB1044.2
   000014         001400                                                                  DB1044.2
   000015         001500     " HIGH       ".                                              DB1044.2
   000016         001600 DATE-WRITTEN.                                                    DB1044.2
   000017         001700     CCVS-74 VERSION 4.0 - 1980 JULY 1.                           DB1044.2
   000018         001800     CREATION DATE     /    VALIDATION DATE                       DB1044.2
   000019         001900     "4.2 ".                                                      DB1044.2
   000020         002000 SECURITY.                                                        DB1044.2
   000021         002100     NONE.                                                        DB1044.2
   000022         002200*                                                                 DB1044.2
   000023         002300*    *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *DB1044.2
   000024         002400*                                                                 DB1044.2
   000025         002500*                       PROGRAM ABSTRACT                          DB1044.2
   000026         002600*                                                                 DB1044.2
   000027         002700*    DB104A TESTS THE CAPABILITY OF THE DEBUG MODULE TO HANDLE    DB1044.2
   000028         002800*    PROCEDURES TIED TO SORT INPUT, SORT OUTPUT, AND FILE         DB1044.2
   000029         002900*    DECLARATIVE PROCEDURES.  THIS PROGRAM IS TO BE COMPILED AND  DB1044.2
   000030         003000*    EXECUTED WITH BOTH COMPILE AND OBJECT TIME DEBUGGING         DB1044.2
   000031         003100*    SWITCHES ENABLED.  THE PROGRAM FIRST BUILDS A SEQUENTIAL     DB1044.2
   000032         003200*    FILE CONTAINING 99 EIGHTY CHARACTER RECORDS.  THIS FILE      DB1044.2
   000033         003300*    IS THEN SORTED.                                              DB1044.2
   000034         003400*                                                                 DB1044.2
   000035         003500*    ALL DEBUGGING PROCEDURES SHOULD BE INCLUDED IN COMPILATION   DB1044.2
   000036         003600*    AND GENERATE CODE.  BEFORE BEGINNING EXECUTION OF THE OBJECT DB1044.2
   000037         003700*    PROGRAM, THE JOB CONTROL LANGUAGE NECESSARY TO ACTIVATE      DB1044.2
   000038         003800*    THE OBJECT TIME DEBUGGING SWITCH MUST BE SUBMITTED.          DB1044.2
   000039         003900*                                                                 DB1044.2
   000040         004000*    EXECUTION OF THE PROGRAM"S SORT SHOULD TRIGGER DEBUGGING     DB1044.2
   000041         004100*    PROCEDURES AT THE BEGINNING OF THE SORT INPUT AND SORT       DB1044.2
   000042         004200*    OUTPUT PROCEDURES.  DURING EXECUTION OF THE SORT INPUT       DB1044.2
   000043         004300*    PROCEDURE, END-OF-FILE CONDITION ON THE INPUT FILE SHOULD    DB1044.2
   000044         004400*    TRIGGER A DECLARATIVE PROCEDURE ASSOCIATED WITH THE FILE,    DB1044.2
   000045         004500*    AND THIS IN TURN SHOULD CAUSE EXECUTION OF A DEBUGGING       DB1044.2
   000046         004600*    PROCEDURE MONITORING THE FILE DECLARATIVE PROCEDURE.         DB1044.2
   000047         004700*                                                                 DB1044.2
   000048         004800*    THE PERFORMANCE OF THE SORT VERB IS NOT CHECKED IN DB104.    DB1044.2
   000049         004900*                                                                 DB1044.2
   000050         005000*                                                                 DB1044.2
   000051         005100*                                                                 DB1044.2
   000052         005200 ENVIRONMENT DIVISION.                                            DB1044.2
   000053         005300 CONFIGURATION SECTION.                                           DB1044.2
   000054         005400 SOURCE-COMPUTER.                                                 DB1044.2
   000055         005500     XXXXX082                                                     DB1044.2
   000056         005600         WITH DEBUGGING MODE.                                     DB1044.2
   000057         005700 OBJECT-COMPUTER.                                                 DB1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         005800     XXXXX083.                                                    DB1044.2
   000059         005900 INPUT-OUTPUT SECTION.                                            DB1044.2
   000060         006000 FILE-CONTROL.                                                    DB1044.2
   000061         006100     SELECT PRINT-FILE ASSIGN TO                                  DB1044.2 72
   000062         006200     XXXXX055.                                                    DB1044.2
   000063         006300     SELECT GEN-FILE ASSIGN TO                                    DB1044.2 78
   000064         006400     XXXXX014                                                     DB1044.2
   000065         006500     FILE STATUS IS GEN-STATUS.                                   DB1044.2 150
   000066         006600*      XXXXX014  REPLACE WITH SEQUENTIAL ACCESS SCRATCH FILE NAME DB1044.2
   000067         006700     SELECT SORT-FILE ASSIGN TO                                   DB1044.2 89
   000068         006800     XXXXX027.                                                    DB1044.2
   000069         006900*      XXXXX27  REPLACE WITH SORT FILE NAME                       DB1044.2
   000070         007000 DATA DIVISION.                                                   DB1044.2
   000071         007100 FILE SECTION.                                                    DB1044.2
   000072         007200 FD  PRINT-FILE                                                   DB1044.2

 ==000072==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000073         007300*    LABEL RECORDS                                                DB1044.2
   000074         007400*    XXXXX084                                                     DB1044.2
   000075         007500     DATA RECORD IS PRINT-REC DUMMY-RECORD.                       DB1044.2 * *
   000076         007600 01  PRINT-REC PICTURE X(120).                                    DB1044.2
   000077         007700 01  DUMMY-RECORD PICTURE X(120).                                 DB1044.2
   000078         007800 FD  GEN-FILE                                                     DB1044.2

 ==000078==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "GEN-FILE".

   000079         007900*    VALUE OF                                                     DB1044.2
   000080         008000*    XXXXX074                                                     DB1044.2
   000081         008100*      XXXXX074  REPLACE WITH IMPLEMENTOR NAME (*OPT C ONLY)      DB1044.2
   000082         008200*    IS                                                           DB1044.2
   000083         008300*    XXXXX075                                                     DB1044.2
   000084         008400*      XXXXX075  REPLACE WITH VALUE CLAUSE OBJECT (*OPT C ONLY)   DB1044.2
   000085         008500*    XXXXX069                                                     DB1044.2
   000086         008600*      XXXXX069  REPLACE WITH ADDITIONAL INFO (*OPT G ONLY)       DB1044.2
   000087         008700     LABEL RECORD IS STANDARD.                                    DB1044.2
   000088         008800 01  GEN-REC PIC X(80).                                           DB1044.2
   000089         008900 SD  SORT-FILE.                                                   DB1044.2
   000090         009000 01  SORT-REC.                                                    DB1044.2
   000091         009100     02  FILLER PIC X(34).                                        DB1044.2
   000092         009200     02  SORT-REC-NO PIC 9(6).                                    DB1044.2
   000093         009300     02  FILLER PIC X(40).                                        DB1044.2
   000094         009400 WORKING-STORAGE SECTION.                                         DB1044.2
   000095         009500 77  RESULT-FLAG PIC 99 COMP VALUE 0.                             DB1044.2
   000096         009600 77  DBLINE-HOLD PIC X(6).                                        DB1044.2
   000097         009700 77  DBNAME-HOLD PIC X(30).                                       DB1044.2
   000098         009800 77  DBCONT-HOLD PIC X(30).                                       DB1044.2
   000099         009900 01  FILE-RECORD-INFORMATION-REC.                                 DB1044.2
   000100         010000     03 FILE-RECORD-INFO-SKELETON.                                DB1044.2
   000101         010100        05 FILLER                 PICTURE X(48)       VALUE       DB1044.2
   000102         010200             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  DB1044.2
   000103         010300        05 FILLER                 PICTURE X(46)       VALUE       DB1044.2
   000104         010400             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    DB1044.2
   000105         010500        05 FILLER                 PICTURE X(26)       VALUE       DB1044.2
   000106         010600             ",LFIL=000000,ORG=  ,LBLR= ".                        DB1044.2
   000107         010700        05 FILLER                 PICTURE X(37)       VALUE       DB1044.2
   000108         010800             ",RECKEY=                             ".             DB1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000109         010900        05 FILLER                 PICTURE X(38)       VALUE       DB1044.2
   000110         011000             ",ALTKEY1=                             ".            DB1044.2
   000111         011100        05 FILLER                 PICTURE X(38)       VALUE       DB1044.2
   000112         011200             ",ALTKEY2=                             ".            DB1044.2
   000113         011300        05 FILLER                 PICTURE X(7)        VALUE SPACE.DB1044.2 IMP
   000114         011400     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              DB1044.2
   000115         011500        05 FILE-RECORD-INFO-P1-120.                               DB1044.2
   000116         011600           07 FILLER              PIC X(5).                       DB1044.2
   000117         011700           07 XFILE-NAME           PIC X(6).                      DB1044.2
   000118         011800           07 FILLER              PIC X(8).                       DB1044.2
   000119         011900           07 XRECORD-NAME         PIC X(6).                      DB1044.2
   000120         012000           07 FILLER              PIC X(1).                       DB1044.2
   000121         012100           07 REELUNIT-NUMBER     PIC 9(1).                       DB1044.2
   000122         012200           07 FILLER              PIC X(7).                       DB1044.2
   000123         012300           07 XRECORD-NUMBER       PIC 9(6).                      DB1044.2
   000124         012400           07 FILLER              PIC X(6).                       DB1044.2
   000125         012500           07 UPDATE-NUMBER       PIC 9(2).                       DB1044.2
   000126         012600           07 FILLER              PIC X(5).                       DB1044.2
   000127         012700           07 ODO-NUMBER          PIC 9(4).                       DB1044.2
   000128         012800           07 FILLER              PIC X(5).                       DB1044.2
   000129         012900           07 XPROGRAM-NAME        PIC X(5).                      DB1044.2
   000130         013000           07 FILLER              PIC X(7).                       DB1044.2
   000131         013100           07 XRECORD-LENGTH       PIC 9(6).                      DB1044.2
   000132         013200           07 FILLER              PIC X(7).                       DB1044.2
   000133         013300           07 CHARS-OR-RECORDS    PIC X(2).                       DB1044.2
   000134         013400           07 FILLER              PIC X(1).                       DB1044.2
   000135         013500           07 XBLOCK-SIZE          PIC 9(4).                      DB1044.2
   000136         013600           07 FILLER              PIC X(6).                       DB1044.2
   000137         013700           07 RECORDS-IN-FILE     PIC 9(6).                       DB1044.2
   000138         013800           07 FILLER              PIC X(5).                       DB1044.2
   000139         013900           07 XFILE-ORGANIZATION   PIC X(2).                      DB1044.2
   000140         014000           07 FILLER              PIC X(6).                       DB1044.2
   000141         014100           07 XLABEL-TYPE          PIC X(1).                      DB1044.2
   000142         014200        05 FILE-RECORD-INFO-P121-240.                             DB1044.2
   000143         014300           07 FILLER              PIC X(8).                       DB1044.2
   000144         014400           07 XRECORD-KEY          PIC X(29).                     DB1044.2
   000145         014500           07 FILLER              PIC X(9).                       DB1044.2
   000146         014600           07 ALTERNATE-KEY1      PIC X(29).                      DB1044.2
   000147         014700           07 FILLER              PIC X(9).                       DB1044.2
   000148         014800           07 ALTERNATE-KEY2      PIC X(29).                      DB1044.2
   000149         014900           07 FILLER              PIC X(7).                       DB1044.2
   000150         015000 01  GEN-STATUS.                                                  DB1044.2
   000151         015100     02  END-FLAG PIC X.                                          DB1044.2
   000152         015200     02  FILLER PIC X.                                            DB1044.2
   000153         015300 01  SIZE-13.                                                     DB1044.2
   000154         015400     02  FILLER PIC XX.                                           DB1044.2
   000155         015500     02  SIZE-11.                                                 DB1044.2
   000156         015600         03  FILLER PIC X.                                        DB1044.2
   000157         015700         03  SIZE-10.                                             DB1044.2
   000158         015800             04  FILLER PIC XX.                                   DB1044.2
   000159         015900             04  SIZE-8.                                          DB1044.2
   000160         016000                 05  FILLER PIC X.                                DB1044.2
   000161         016100                 05  SIZE-7 PIC X(7).                             DB1044.2
   000162         016200 01  TEST-RESULTS.                                                DB1044.2
   000163         016300     02 FILLER                    PICTURE X VALUE SPACE.          DB1044.2 IMP
   000164         016400     02 FEATURE                   PICTURE X(20) VALUE SPACE.      DB1044.2 IMP
   000165         016500     02 FILLER                    PICTURE X VALUE SPACE.          DB1044.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000166         016600     02 P-OR-F                    PICTURE X(5) VALUE SPACE.       DB1044.2 IMP
   000167         016700     02 FILLER                    PICTURE X  VALUE SPACE.         DB1044.2 IMP
   000168         016800     02  PAR-NAME.                                                DB1044.2
   000169         016900       03 FILLER PICTURE X(12) VALUE SPACE.                       DB1044.2 IMP
   000170         017000       03  PARDOT-X PICTURE X  VALUE SPACE.                       DB1044.2 IMP
   000171         017100       03 DOTVALUE PICTURE 99  VALUE ZERO.                        DB1044.2 IMP
   000172         017200       03 FILLER PIC X(5) VALUE SPACE.                            DB1044.2 IMP
   000173         017300     02 FILLER PIC X(10) VALUE SPACE.                             DB1044.2 IMP
   000174         017400     02 RE-MARK PIC X(61).                                        DB1044.2
   000175         017500 01  TEST-COMPUTED.                                               DB1044.2
   000176         017600     02 FILLER PIC X(30) VALUE SPACE.                             DB1044.2 IMP
   000177         017700     02 FILLER PIC X(17) VALUE "       COMPUTED=".                DB1044.2
   000178         017800     02 COMPUTED-X.                                               DB1044.2
   000179         017900     03 COMPUTED-A                PICTURE X(20) VALUE SPACE.      DB1044.2 IMP
   000180         018000     03 COMPUTED-N REDEFINES COMPUTED-A PICTURE -9(9).9(9).       DB1044.2 179
   000181         018100     03 COMPUTED-0V18 REDEFINES COMPUTED-A  PICTURE -.9(18).      DB1044.2 179
   000182         018200     03 COMPUTED-4V14 REDEFINES COMPUTED-A  PICTURE -9(4).9(14).  DB1044.2 179
   000183         018300     03 COMPUTED-14V4 REDEFINES COMPUTED-A  PICTURE -9(14).9(4).  DB1044.2 179
   000184         018400     03       CM-18V0 REDEFINES COMPUTED-A.                       DB1044.2 179
   000185         018500         04 COMPUTED-18V0                   PICTURE -9(18).       DB1044.2
   000186         018600         04 FILLER                          PICTURE X.            DB1044.2
   000187         018700     03 FILLER PIC X(50) VALUE SPACE.                             DB1044.2 IMP
   000188         018800 01  TEST-CORRECT.                                                DB1044.2
   000189         018900     02 FILLER PIC X(30) VALUE SPACE.                             DB1044.2 IMP
   000190         019000     02 FILLER PIC X(17) VALUE "       CORRECT =".                DB1044.2
   000191         019100     02 CORRECT-X.                                                DB1044.2
   000192         019200     03 CORRECT-A                 PICTURE X(20) VALUE SPACE.      DB1044.2 IMP
   000193         019300     03 CORRECT-N REDEFINES CORRECT-A PICTURE -9(9).9(9).         DB1044.2 192
   000194         019400     03 CORRECT-0V18 REDEFINES CORRECT-A    PICTURE -.9(18).      DB1044.2 192
   000195         019500     03 CORRECT-4V14 REDEFINES CORRECT-A    PICTURE -9(4).9(14).  DB1044.2 192
   000196         019600     03 CORRECT-14V4 REDEFINES CORRECT-A    PICTURE -9(14).9(4).  DB1044.2 192
   000197         019700     03      CR-18V0 REDEFINES CORRECT-A.                         DB1044.2 192
   000198         019800         04 CORRECT-18V0                    PICTURE -9(18).       DB1044.2
   000199         019900         04 FILLER                          PICTURE X.            DB1044.2
   000200         020000     03 FILLER PIC X(50) VALUE SPACE.                             DB1044.2 IMP
   000201         020100 01  CCVS-C-1.                                                    DB1044.2
   000202         020200     02 FILLER PICTURE IS X(99) VALUE IS " FEATURE              PADB1044.2
   000203         020300-    "SS  PARAGRAPH-NAME                                          DB1044.2
   000204         020400-    "        REMARKS".                                           DB1044.2
   000205         020500     02 FILLER PICTURE IS X(20) VALUE IS SPACE.                   DB1044.2 IMP
   000206         020600 01  CCVS-C-2.                                                    DB1044.2
   000207         020700     02 FILLER PICTURE IS X VALUE IS SPACE.                       DB1044.2 IMP
   000208         020800     02 FILLER PICTURE IS X(6) VALUE IS "TESTED".                 DB1044.2
   000209         020900     02 FILLER PICTURE IS X(15) VALUE IS SPACE.                   DB1044.2 IMP
   000210         021000     02 FILLER PICTURE IS X(4) VALUE IS "FAIL".                   DB1044.2
   000211         021100     02 FILLER PICTURE IS X(94) VALUE IS SPACE.                   DB1044.2 IMP
   000212         021200 01  REC-SKL-SUB PICTURE 9(2) VALUE ZERO.                         DB1044.2 IMP
   000213         021300 01  REC-CT PICTURE 99 VALUE ZERO.                                DB1044.2 IMP
   000214         021400 01  DELETE-CNT                   PICTURE 999  VALUE ZERO.        DB1044.2 IMP
   000215         021500 01  ERROR-COUNTER PICTURE IS 999 VALUE IS ZERO.                  DB1044.2 IMP
   000216         021600 01  INSPECT-COUNTER PIC 999 VALUE ZERO.                          DB1044.2 IMP
   000217         021700 01  PASS-COUNTER PIC 999 VALUE ZERO.                             DB1044.2 IMP
   000218         021800 01  TOTAL-ERROR PIC 999 VALUE ZERO.                              DB1044.2 IMP
   000219         021900 01  ERROR-HOLD PIC 999 VALUE ZERO.                               DB1044.2 IMP
   000220         022000 01  DUMMY-HOLD PIC X(120) VALUE SPACE.                           DB1044.2 IMP
   000221         022100 01  RECORD-COUNT PIC 9(5) VALUE ZERO.                            DB1044.2 IMP
   000222         022200 01  CCVS-H-1.                                                    DB1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000223         022300     02  FILLER   PICTURE X(27)  VALUE SPACE.                     DB1044.2 IMP
   000224         022400     02 FILLER PICTURE X(67) VALUE                                DB1044.2
   000225         022500     " FEDERAL COMPILER TESTING CENTER COBOL COMPILER VALIDATION  DB1044.2
   000226         022600-    " SYSTEM".                                                   DB1044.2
   000227         022700     02  FILLER     PICTURE X(26)  VALUE SPACE.                   DB1044.2 IMP
   000228         022800 01  CCVS-H-2.                                                    DB1044.2
   000229         022900     02 FILLER PICTURE X(52) VALUE IS                             DB1044.2
   000230         023000     "CCVS74 NCC  COPY, NOT FOR DISTRIBUTION.".                   DB1044.2
   000231         023100     02 FILLER PICTURE IS X(19) VALUE IS "TEST RESULTS SET-  ".   DB1044.2
   000232         023200     02 TEST-ID PICTURE IS X(9).                                  DB1044.2
   000233         023300     02 FILLER PICTURE IS X(40) VALUE IS SPACE.                   DB1044.2 IMP
   000234         023400 01  CCVS-H-3.                                                    DB1044.2
   000235         023500     02  FILLER PICTURE X(34) VALUE                               DB1044.2
   000236         023600     " FOR OFFICIAL USE ONLY    ".                                DB1044.2
   000237         023700     02  FILLER PICTURE X(58) VALUE                               DB1044.2
   000238         023800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".DB1044.2
   000239         023900     02  FILLER PICTURE X(28) VALUE                               DB1044.2
   000240         024000     "  COPYRIGHT   1974 ".                                       DB1044.2
   000241         024100 01  CCVS-E-1.                                                    DB1044.2
   000242         024200     02 FILLER PICTURE IS X(52) VALUE IS SPACE.                   DB1044.2 IMP
   000243         024300     02 FILLER PICTURE IS X(14) VALUE IS "END OF TEST-  ".        DB1044.2
   000244         024400     02 ID-AGAIN PICTURE IS X(9).                                 DB1044.2
   000245         024500     02 FILLER PICTURE X(45) VALUE IS                             DB1044.2
   000246         024600     " NTIS DISTRIBUTION COBOL 74".                               DB1044.2
   000247         024700 01  CCVS-E-2.                                                    DB1044.2
   000248         024800     02  FILLER                   PICTURE X(31)  VALUE            DB1044.2
   000249         024900     SPACE.                                                       DB1044.2 IMP
   000250         025000     02  FILLER                   PICTURE X(21)  VALUE SPACE.     DB1044.2 IMP
   000251         025100     02 CCVS-E-2-2.                                               DB1044.2
   000252         025200         03 ERROR-TOTAL PICTURE IS XXX VALUE IS SPACE.            DB1044.2 IMP
   000253         025300         03 FILLER PICTURE IS X VALUE IS SPACE.                   DB1044.2 IMP
   000254         025400         03 ENDER-DESC PIC X(44) VALUE "ERRORS ENCOUNTERED".      DB1044.2
   000255         025500 01  CCVS-E-3.                                                    DB1044.2
   000256         025600     02  FILLER PICTURE X(22) VALUE                               DB1044.2
   000257         025700     " FOR OFFICIAL USE ONLY".                                    DB1044.2
   000258         025800     02  FILLER PICTURE X(12) VALUE SPACE.                        DB1044.2 IMP
   000259         025900     02  FILLER PICTURE X(58) VALUE                               DB1044.2
   000260         026000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".DB1044.2
   000261         026100     02  FILLER PICTURE X(13) VALUE SPACE.                        DB1044.2 IMP
   000262         026200     02 FILLER PIC X(15) VALUE " COPYRIGHT 1974".                 DB1044.2
   000263         026300 01  CCVS-E-4.                                                    DB1044.2
   000264         026400     02 CCVS-E-4-1 PIC XXX VALUE SPACE.                           DB1044.2 IMP
   000265         026500     02 FILLER PIC XXXX VALUE " OF ".                             DB1044.2
   000266         026600     02 CCVS-E-4-2 PIC XXX VALUE SPACE.                           DB1044.2 IMP
   000267         026700     02 FILLER PIC X(40) VALUE                                    DB1044.2
   000268         026800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       DB1044.2
   000269         026900 01  XXINFO.                                                      DB1044.2
   000270         027000     02 FILLER PIC X(30) VALUE "        *** INFORMATION  ***".    DB1044.2
   000271         027100     02 INFO-TEXT.                                                DB1044.2
   000272         027200     04 FILLER PIC X(20) VALUE SPACE.                             DB1044.2 IMP
   000273         027300     04 XXCOMPUTED PIC X(20).                                     DB1044.2
   000274         027400     04 FILLER PIC X(5) VALUE SPACE.                              DB1044.2 IMP
   000275         027500     04 XXCORRECT PIC X(20).                                      DB1044.2
   000276         027600 01  HYPHEN-LINE.                                                 DB1044.2
   000277         027700     02 FILLER PICTURE IS X VALUE IS SPACE.                       DB1044.2 IMP
   000278         027800     02 FILLER PICTURE IS X(65) VALUE IS "************************DB1044.2
   000279         027900-    "*****************************************".                 DB1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000280         028000     02 FILLER PICTURE IS X(54) VALUE IS "************************DB1044.2
   000281         028100-    "******************************".                            DB1044.2
   000282         028200 01  CCVS-PGM-ID PIC X(6) VALUE                                   DB1044.2
   000283         028300     "DB104A".                                                    DB1044.2
   000284         028400 PROCEDURE DIVISION.                                              DB1044.2
   000285         028500 DECLARATIVES.                                                    DB1044.2
   000286         028600 SORT-IN-PROC SECTION.                                            DB1044.2
   000287         028700     USE FOR DEBUGGING ON SORT-IN.                                DB1044.2 450
   000288         028800 BEGIN-SORT-IN-PROC.                                              DB1044.2
   000289         028900     MOVE 1 TO RESULT-FLAG.                                       DB1044.2 95
   000290         029000 DB-COMMON.                                                       DB1044.2
   000291         029100     MOVE DEBUG-LINE TO DBLINE-HOLD.                              DB1044.2 IMP 96
   000292         029200     MOVE DEBUG-NAME TO DBNAME-HOLD.                              DB1044.2 IMP 97
   000293         029300     MOVE DEBUG-CONTENTS TO DBCONT-HOLD.                          DB1044.2 IMP 98
   000294         029400 SORT-OUT-PROC SECTION.                                           DB1044.2
   000295         029500     USE FOR DEBUGGING ON SORT-OUT.                               DB1044.2 622
   000296         029600 BEGIN-SORT-OUT-PROC.                                             DB1044.2
   000297         029700     MOVE 2 TO RESULT-FLAG.                                       DB1044.2 95
   000298         029800     PERFORM DB-COMMON.                                           DB1044.2 290
   000299         029900 USE-PROC SECTION.                                                DB1044.2
   000300         030000     USE FOR DEBUGGING ON AT-END-PROC.                            DB1044.2 304
   000301         030100 BEGIN-USE-PROC.                                                  DB1044.2
   000302         030200     ADD 3 TO RESULT-FLAG.                                        DB1044.2 95
   000303         030300     PERFORM DB-COMMON.                                           DB1044.2 290
   000304         030400 AT-END-PROC SECTION.                                             DB1044.2
   000305         030500     USE AFTER ERROR PROCEDURE ON GEN-FILE.                       DB1044.2 78
   000306         030600 BEGIN-AT-END-PROC.                                               DB1044.2
   000307         030700     ADD 4 TO RESULT-FLAG.                                        DB1044.2 95
   000308         030800 END DECLARATIVES.                                                DB1044.2
   000309         030900 CCVS1 SECTION.                                                   DB1044.2
   000310         031000 OPEN-FILES.                                                      DB1044.2
   000311         031100     OPEN     OUTPUT PRINT-FILE.                                  DB1044.2 72
   000312         031200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   DB1044.2 282 232 282 244
   000313         031300     MOVE    SPACE TO TEST-RESULTS.                               DB1044.2 IMP 162
   000314         031400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             DB1044.2 339 343
   000315         031500     GO TO CCVS1-EXIT.                                            DB1044.2 414
   000316         031600 CLOSE-FILES.                                                     DB1044.2
   000317         031700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   DB1044.2 347 368 72
   000318         031800 TERMINATE-CCVS.                                                  DB1044.2
   000319         031900     EXIT PROGRAM.                                                DB1044.2
   000320         032000 TERMINATE-CALL.                                                  DB1044.2
   000321         032100     STOP     RUN.                                                DB1044.2
   000322         032200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         DB1044.2 166 216
   000323         032300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           DB1044.2 166 217
   000324         032400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          DB1044.2 166 215
   000325         032500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.          DB1044.2 166 214
   000326         032600     MOVE "****TEST DELETED****" TO RE-MARK.                      DB1044.2 174
   000327         032700 PRINT-DETAIL.                                                    DB1044.2
   000328         032800     IF REC-CT NOT EQUAL TO ZERO                                  DB1044.2 213 IMP
   000329      1  032900             MOVE "." TO PARDOT-X                                 DB1044.2 170
   000330      1  033000             MOVE REC-CT TO DOTVALUE.                             DB1044.2 213 171
   000331         033100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      DB1044.2 162 76 380
   000332         033200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               DB1044.2 166 380
   000333      1  033300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 DB1044.2 397 406
   000334      1  033400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 DB1044.2 407 413
   000335         033500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              DB1044.2 IMP 166 IMP 178
   000336         033600     MOVE SPACE TO CORRECT-X.                                     DB1044.2 IMP 191
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000337         033700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         DB1044.2 213 IMP IMP 168
   000338         033800     MOVE     SPACE TO RE-MARK.                                   DB1044.2 IMP 174
   000339         033900 HEAD-ROUTINE.                                                    DB1044.2
   000340         034000     MOVE CCVS-H-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1044.2 222 77 380
   000341         034100     MOVE CCVS-H-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.   DB1044.2 228 77 380
   000342         034200     MOVE CCVS-H-3 TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.   DB1044.2 234 77 380
   000343         034300 COLUMN-NAMES-ROUTINE.                                            DB1044.2
   000344         034400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1044.2 201 77 380
   000345         034500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1044.2 206 77 380
   000346         034600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        DB1044.2 276 77 380
   000347         034700 END-ROUTINE.                                                     DB1044.2
   000348         034800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.DB1044.2 276 77 380
   000349         034900 END-RTN-EXIT.                                                    DB1044.2
   000350         035000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1044.2 241 77 380
   000351         035100 END-ROUTINE-1.                                                   DB1044.2
   000352         035200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      DB1044.2 215 219 216
   000353         035300      ERROR-HOLD. ADD DELETE-CNT TO ERROR-HOLD.                   DB1044.2 219 214 219
   000354         035400      ADD PASS-COUNTER TO ERROR-HOLD.                             DB1044.2 217 219
   000355         035500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   DB1044.2
   000356         035600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            DB1044.2 217 264
   000357         035700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              DB1044.2 219 266
   000358         035800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                DB1044.2 263 251
   000359         035900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           DB1044.2 247 77 380
   000360         036000  END-ROUTINE-12.                                                 DB1044.2
   000361         036100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        DB1044.2 254
   000362         036200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      DB1044.2 215 IMP
   000363      1  036300         MOVE "NO " TO ERROR-TOTAL                                DB1044.2 252
   000364         036400         ELSE                                                     DB1044.2
   000365      1  036500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       DB1044.2 215 252
   000366         036600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           DB1044.2 247 77
   000367         036700     PERFORM WRITE-LINE.                                          DB1044.2 380
   000368         036800 END-ROUTINE-13.                                                  DB1044.2
   000369         036900     IF DELETE-CNT IS EQUAL TO ZERO                               DB1044.2 214 IMP
   000370      1  037000         MOVE "NO " TO ERROR-TOTAL  ELSE                          DB1044.2 252
   000371      1  037100         MOVE DELETE-CNT TO ERROR-TOTAL.                          DB1044.2 214 252
   000372         037200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   DB1044.2 254
   000373         037300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1044.2 247 77 380
   000374         037400      IF   INSPECT-COUNTER EQUAL TO ZERO                          DB1044.2 216 IMP
   000375      1  037500          MOVE "NO " TO ERROR-TOTAL                               DB1044.2 252
   000376      1  037600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   DB1044.2 216 252
   000377         037700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            DB1044.2 254
   000378         037800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          DB1044.2 247 77 380
   000379         037900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1044.2 255 77 380
   000380         038000 WRITE-LINE.                                                      DB1044.2
   000381         038100     ADD 1 TO RECORD-COUNT.                                       DB1044.2 221
   000382         038200     IF RECORD-COUNT GREATER 50                                   DB1044.2 221
   000383      1  038300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          DB1044.2 77 220
   000384      1  038400         MOVE SPACE TO DUMMY-RECORD                               DB1044.2 IMP 77
   000385      1  038500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  DB1044.2 77
   000386      1  038600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             DB1044.2 201 77 392
   000387      1  038700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     DB1044.2 206 77 392
   000388      1  038800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          DB1044.2 276 77 392
   000389      1  038900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          DB1044.2 220 77
   000390      1  039000         MOVE ZERO TO RECORD-COUNT.                               DB1044.2 IMP 221
   000391         039100     PERFORM WRT-LN.                                              DB1044.2 392
   000392         039200 WRT-LN.                                                          DB1044.2
   000393         039300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               DB1044.2 77
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000394         039400     MOVE SPACE TO DUMMY-RECORD.                                  DB1044.2 IMP 77
   000395         039500 BLANK-LINE-PRINT.                                                DB1044.2
   000396         039600     PERFORM WRT-LN.                                              DB1044.2 392
   000397         039700 FAIL-ROUTINE.                                                    DB1044.2
   000398         039800     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.   DB1044.2 178 IMP 403
   000399         039900     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.    DB1044.2 191 IMP 403
   000400         040000     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    DB1044.2 271
   000401         040100     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     DB1044.2 269 77 380
   000402         040200     GO TO FAIL-ROUTINE-EX.                                       DB1044.2 406
   000403         040300 FAIL-ROUTINE-WRITE.                                              DB1044.2
   000404         040400     MOVE TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE           DB1044.2 175 76 380
   000405         040500     MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES.   DB1044.2 188 76 380
   000406         040600 FAIL-ROUTINE-EX. EXIT.                                           DB1044.2
   000407         040700 BAIL-OUT.                                                        DB1044.2
   000408         040800     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.       DB1044.2 179 IMP 410
   000409         040900     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.               DB1044.2 192 IMP 413
   000410         041000 BAIL-OUT-WRITE.                                                  DB1044.2
   000411         041100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  DB1044.2 192 275 179 273
   000412         041200     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     DB1044.2 269 77 380
   000413         041300 BAIL-OUT-EX. EXIT.                                               DB1044.2
   000414         041400 CCVS1-EXIT.                                                      DB1044.2
   000415         041500     EXIT.                                                        DB1044.2
   000416         041600 BEGIN-FILE-GENERATION.                                           DB1044.2
   000417         041700     MOVE FILE-RECORD-INFO-SKELETON TO FILE-RECORD-INFO (1).      DB1044.2 100 114
   000418         041800     MOVE "GEN-FI" TO XFILE-NAME (1).                             DB1044.2 117
   000419         041900     MOVE "GEN-RE" TO XRECORD-NAME (1).                           DB1044.2 119
   000420         042000     MOVE "DB104A" TO XPROGRAM-NAME (1).                          DB1044.2 129
   000421         042100     MOVE 80 TO XRECORD-LENGTH (1).                               DB1044.2 131
   000422         042200     OPEN OUTPUT GEN-FILE.                                        DB1044.2 78
   000423         042300     MOVE 99 TO XRECORD-NUMBER (1).                               DB1044.2 123
   000424         042400 GEN-LOOP.                                                        DB1044.2
   000425         042500     MOVE FILE-RECORD-INFO (1) TO GEN-REC.                        DB1044.2 114 88
   000426         042600     WRITE GEN-REC.                                               DB1044.2 88
   000427         042700     IF XRECORD-NUMBER (1) IS GREATER THAN 5                      DB1044.2 123
   000428      1  042800         SUBTRACT 5 FROM XRECORD-NUMBER (1)                       DB1044.2 123
   000429      1  042900         GO TO GEN-LOOP.                                          DB1044.2 424
   000430         043000 END-OF-GEN-LOOP.                                                 DB1044.2
   000431         043100     MOVE 98 TO XRECORD-NUMBER (1).                               DB1044.2 123
   000432         043200     PERFORM GEN-LOOP.                                            DB1044.2 424
   000433         043300     MOVE 97 TO XRECORD-NUMBER (1).                               DB1044.2 123
   000434         043400     PERFORM GEN-LOOP.                                            DB1044.2 424
   000435         043500     MOVE 96 TO XRECORD-NUMBER (1).                               DB1044.2 123
   000436         043600     PERFORM GEN-LOOP.                                            DB1044.2 424
   000437         043700     MOVE 95 TO XRECORD-NUMBER (1).                               DB1044.2 123
   000438         043800     PERFORM GEN-LOOP.                                            DB1044.2 424
   000439         043900     CLOSE GEN-FILE.                                              DB1044.2 78
   000440         044100*    THE DEBUG-LINE (INSPT) SUBTESTS FOR THE TESTS NAMED IN THE  *DB1044.2
   000441         044200*    OUTPUT REPORT AS "SORT-IN-2" AND "SORT-OUT-2" SHOULD POINT  *DB1044.2
   000442         044300*    TO THE "SORT" STATEMENT WHICH APPEARS IN THE PARAGRAPH      *DB1044.2
   000443         044400*    BELOW NAMED "BEGIN-TESTS".                                  *DB1044.2
   000444         044600 BEGIN-TESTS.                                                     DB1044.2
   000445         044700     MOVE 0 TO RESULT-FLAG.                                       DB1044.2 95
   000446         044800     SORT SORT-FILE ON ASCENDING KEY SORT-REC-NO                  DB1044.2 89 92
   000447         044900         INPUT PROCEDURE IS SORT-IN                               DB1044.2 450
   000448         045000         OUTPUT PROCEDURE IS SORT-OUT.                            DB1044.2 622
   000449         045100     GO TO AFTER-SORT.                                            DB1044.2 727
   000450         045200 SORT-IN SECTION.                                                 DB1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000451         045300 SORT-IN-1.                                                       DB1044.2
   000452         045400     MOVE "SORT-IN-1" TO PAR-NAME.                                DB1044.2 168
   000453         045500     IF RESULT-FLAG IS NOT EQUAL TO 1                             DB1044.2 95
   000454      1  045600         MOVE "DEBUG PROCEDURE NOT EXECUTED" TO RE-MARK           DB1044.2 174
   000455      1  045700         PERFORM FAIL-1                                           DB1044.2 571
   000456      1  045800         PERFORM SORT-IN-WRITE                                    DB1044.2 467
   000457      1  045900         GO TO SORT-IN-5                                          DB1044.2 497
   000458      1  046000         ELSE  PERFORM PASS-1                                     DB1044.2 570
   000459      1  046100         MOVE "DEBUG PROCEDURE EXECUTED" TO RE-MARK.              DB1044.2 174
   000460         046200     PERFORM SORT-IN-WRITE.                                       DB1044.2 467
   000461         046300     GO TO SORT-IN-2.                                             DB1044.2 470
   000462         046400 SORT-IN-DELETE.                                                  DB1044.2
   000463         046500     MOVE "SORT-IN" TO PAR-NAME.                                  DB1044.2 168
   000464         046600     PERFORM DE-LETE-1.                                           DB1044.2 572
   000465         046700     PERFORM SORT-IN-WRITE.                                       DB1044.2 467
   000466         046800     GO TO SORT-IN-5.                                             DB1044.2 497
   000467         046900 SORT-IN-WRITE.                                                   DB1044.2
   000468         047000     MOVE "DEBUG SORT INPUT" TO FEATURE.                          DB1044.2 164
   000469         047100     PERFORM PRINT-DETAIL-1.                                      DB1044.2 574
   000470         047200 SORT-IN-2.                                                       DB1044.2
   000471         047300     MOVE "SORT-IN-2" TO PAR-NAME.                                DB1044.2 168
   000472         047400     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1044.2 96 179
   000473         047500     MOVE "DEBUG-LINE, SEE NEXT LINE" TO RE-MARK.                 DB1044.2 174
   000474         047600     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1044.2 192
   000475         047700     PERFORM   INSPT-1.                                           DB1044.2 569
   000476         047800     PERFORM SORT-IN-WRITE.                                       DB1044.2 467
   000477         047900 SORT-IN-3.                                                       DB1044.2
   000478         048000     MOVE DBNAME-HOLD TO SIZE-7.                                  DB1044.2 97 161
   000479         048100     IF SIZE-7 IS EQUAL TO "SORT-IN"                              DB1044.2 161
   000480      1  048200         PERFORM PASS-1 ELSE                                      DB1044.2 570
   000481      1  048300         MOVE "SORT-IN" TO CORRECT-A                              DB1044.2 192
   000482      1  048400         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1044.2 97 179
   000483      1  048500         PERFORM FAIL-1.                                          DB1044.2 571
   000484         048600     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1044.2 174
   000485         048700     MOVE "SORT-IN-3" TO PAR-NAME.                                DB1044.2 168
   000486         048800     PERFORM SORT-IN-WRITE.                                       DB1044.2 467
   000487         048900 SORT-IN-4.                                                       DB1044.2
   000488         049000     MOVE DBCONT-HOLD TO SIZE-10.                                 DB1044.2 98 157
   000489         049100     IF SIZE-10 IS EQUAL TO "SORT INPUT"                          DB1044.2 157
   000490      1  049200         PERFORM PASS-1 ELSE                                      DB1044.2 570
   000491      1  049300         MOVE "SORT INPUT" TO CORRECT-A                           DB1044.2 192
   000492      1  049400         MOVE DBCONT-HOLD TO COMPUTED-A                           DB1044.2 98 179
   000493      1  049500         PERFORM FAIL-1.                                          DB1044.2 571
   000494         049600     MOVE "DEBUG-CONTENTS" TO RE-MARK.                            DB1044.2 174
   000495         049700     MOVE "SORT-IN-4" TO PAR-NAME.                                DB1044.2 168
   000496         049800     PERFORM SORT-IN-WRITE.                                       DB1044.2 467
   000497         049900 SORT-IN-5.                                                       DB1044.2
   000498         050000     OPEN INPUT GEN-FILE.                                         DB1044.2 78
   000499         050100     MOVE 0 TO RESULT-FLAG.                                       DB1044.2 95
   000500         050300*    THE DEBUG-LINE (INSPT) SUBTEST FOR THE TEST NAMED IN THE    *DB1044.2
   000501         050400*    OUTPUT REPORT AS "SORT-USE-TEST" SHOULD POINT TO THE        *DB1044.2
   000502         050500*    EXECUTABLE STATEMENT WHICH FOLLOWS THIS COMMENT SET AND     *DB1044.2
   000503         050600*    WHICH READS, "READ GEN-FILE".                               *DB1044.2
   000504         050800 SORT-USE-TEST.                                                   DB1044.2
   000505         050900     READ GEN-FILE                                                DB1044.2 78
   000506         051000*        AT END GO TO SORT-USE-DELETE.                            DB1044.2
   000507         051100*                                                                 DB1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000508         051200*    IN CASE IMPLEMENTATION FAILS TO NOTIFY PROGRAM OF            DB1044.2
   000509         051300*    END-OF-FILE VIA STATUS OR DECLARATIVE PROC, REMOVE ASTERISK  DB1044.2
   000510         051400*    FROM THE FIRST OF THESE COMMENT LINES AND PERMIT THE AT END  DB1044.2
   000511         051500*    CLAUSE TO BE COMPILED; THIS WILL RESULT IN TEST DELETION.    DB1044.2
   000512         051600*                                                                 DB1044.2
   000513         051700     IF RESULT-FLAG IS EQUAL TO 3                                 DB1044.2 95
   000514      1  051800         CLOSE GEN-FILE GO TO SORT-USE-1.                         DB1044.2 78 531
   000515         051900     IF RESULT-FLAG IS EQUAL TO 4                                 DB1044.2 95
   000516      1  052000         CLOSE GEN-FILE GO TO SORT-USE-3.                         DB1044.2 78 556
   000517         052100     IF RESULT-FLAG IS EQUAL TO 7                                 DB1044.2 95
   000518      1  052200         CLOSE GEN-FILE                                           DB1044.2 78
   000519      1  052300         PERFORM PASS-1                                           DB1044.2 570
   000520      1  052400         MOVE "BOTH PROCEDURES EXECUTED" TO RE-MARK               DB1044.2 174
   000521      1  052500         PERFORM SORT-USE-WRITE                                   DB1044.2 563
   000522      1  052600         GO TO SORT-USE-2.                                        DB1044.2 534
   000523         052700     IF END-FLAG IS EQUAL TO "1"                                  DB1044.2 151
   000524      1  052800         CLOSE GEN-FILE GO TO SORT-USE-4.                         DB1044.2 78 560
   000525         052900     RELEASE SORT-REC FROM GEN-REC.                               DB1044.2 90 88
   000526         053000     GO TO SORT-USE-TEST.                                         DB1044.2 504
   000527         053100 SORT-USE-DELETE.                                                 DB1044.2
   000528         053200     CLOSE GEN-FILE.                                              DB1044.2 78
   000529         053300     PERFORM DE-LETE-1.                                           DB1044.2 572
   000530         053400     GO TO SORT-USE-WRITE.                                        DB1044.2 563
   000531         053500 SORT-USE-1.                                                      DB1044.2
   000532         053600     MOVE "ERROR PROCEDURE NOT COMPLETED" TO RE-MARK.             DB1044.2 174
   000533         053700     PERFORM SORT-USE-WRITE.                                      DB1044.2 563
   000534         053800 SORT-USE-2.                                                      DB1044.2
   000535         053900     MOVE "DEBUG-LINE, SEE NEXT LINE" TO RE-MARK.                 DB1044.2 174
   000536         054000     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1044.2 192
   000537         054100     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1044.2 96 179
   000538         054200     PERFORM   INSPT-1.                                           DB1044.2 569
   000539         054300     PERFORM SORT-USE-WRITE.                                      DB1044.2 563
   000540         054400     MOVE DBNAME-HOLD TO SIZE-11.                                 DB1044.2 97 155
   000541         054500     IF SIZE-11 IS EQUAL TO "AT-END-PROC"                         DB1044.2 155
   000542      1  054600         PERFORM PASS-1 ELSE                                      DB1044.2 570
   000543      1  054700         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1044.2 97 179
   000544      1  054800         MOVE "AT-END-PROC" TO CORRECT-A                          DB1044.2 192
   000545      1  054900         PERFORM FAIL-1.                                          DB1044.2 571
   000546         055000     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1044.2 174
   000547         055100     PERFORM SORT-USE-WRITE.                                      DB1044.2 563
   000548         055200     MOVE DBCONT-HOLD TO SIZE-13.                                 DB1044.2 98 153
   000549         055300     IF SIZE-13 IS EQUAL TO "USE PROCEDURE"                       DB1044.2 153
   000550      1  055400         PERFORM PASS-1 ELSE                                      DB1044.2 570
   000551      1  055500         MOVE DBCONT-HOLD TO COMPUTED-A                           DB1044.2 98 179
   000552      1  055600         MOVE "USE PROCEDURE" TO CORRECT-A                        DB1044.2 192
   000553      1  055700         PERFORM FAIL-1.                                          DB1044.2 571
   000554         055800     MOVE "DEBUG-CONTENTS" TO RE-MARK.                            DB1044.2 174
   000555         055900     GO TO SORT-USE-WRITE.                                        DB1044.2 563
   000556         056000 SORT-USE-3.                                                      DB1044.2
   000557         056100     MOVE "DEBUG ON USE PROC NOT EXECUTED" TO RE-MARK.            DB1044.2 174
   000558         056200     PERFORM FAIL-1.                                              DB1044.2 571
   000559         056300     GO TO SORT-USE-WRITE.                                        DB1044.2 563
   000560         056400 SORT-USE-4.                                                      DB1044.2
   000561         056500     MOVE "DEBUG AND USE PROCS BOTH FAIL" TO RE-MARK.             DB1044.2 174
   000562         056600     PERFORM FAIL-1.                                              DB1044.2 571
   000563         056700 SORT-USE-WRITE.                                                  DB1044.2
   000564         056800     MOVE "SORT-USE-TEST" TO PAR-NAME.                            DB1044.2 168
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000565         056900     MOVE "DEBUG USE PROC" TO FEATURE.                            DB1044.2 164
   000566         057000     PERFORM PRINT-DETAIL-1.                                      DB1044.2 574
   000567         057100 SORT-USE-DONE.                                                   DB1044.2
   000568         057200     GO TO SORT-IN-EXIT.                                          DB1044.2 620
   000569         057300 INSPT-1. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.       DB1044.2 166 216
   000570         057400 PASS-1.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.         DB1044.2 166 217
   000571         057500 FAIL-1.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.        DB1044.2 166 215
   000572         057600 DE-LETE-1.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.        DB1044.2 166 214
   000573         057700     MOVE "****TEST DELETED****" TO RE-MARK.                      DB1044.2 174
   000574         057800 PRINT-DETAIL-1.                                                  DB1044.2
   000575         057900     IF REC-CT NOT EQUAL TO ZERO                                  DB1044.2 213 IMP
   000576      1  058000             MOVE "." TO PARDOT-X                                 DB1044.2 170
   000577      1  058100             MOVE REC-CT TO DOTVALUE.                             DB1044.2 213 171
   000578         058200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE-1.    DB1044.2 162 76 586
   000579         058300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE-1             DB1044.2 166 586
   000580      1  058400        PERFORM FAIL-ROUTINE-1 THRU FAIL-ROUTINE-EX-1             DB1044.2 603 612
   000581      1  058500          ELSE PERFORM BAIL-OUT-1 THRU BAIL-OUT-EX-1.             DB1044.2 613 619
   000582         058600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              DB1044.2 IMP 166 IMP 178
   000583         058700     MOVE SPACE TO CORRECT-X.                                     DB1044.2 IMP 191
   000584         058800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         DB1044.2 213 IMP IMP 168
   000585         058900     MOVE     SPACE TO RE-MARK.                                   DB1044.2 IMP 174
   000586         059000 WRITE-LINE-1.                                                    DB1044.2
   000587         059100     ADD 1 TO RECORD-COUNT.                                       DB1044.2 221
   000588         059200     IF RECORD-COUNT GREATER 50                                   DB1044.2 221
   000589      1  059300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          DB1044.2 77 220
   000590      1  059400         MOVE SPACE TO DUMMY-RECORD                               DB1044.2 IMP 77
   000591      1  059500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  DB1044.2 77
   000592      1  059600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN-1           DB1044.2 201 77 598
   000593      1  059700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN-1 2 TIMES   DB1044.2 206 77 598
   000594      1  059800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN-1        DB1044.2 276 77 598
   000595      1  059900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          DB1044.2 220 77
   000596      1  060000         MOVE ZERO TO RECORD-COUNT.                               DB1044.2 IMP 221
   000597         060100     PERFORM WRT-LN-1.                                            DB1044.2 598
   000598         060200 WRT-LN-1.                                                        DB1044.2
   000599         060300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               DB1044.2 77
   000600         060400     MOVE SPACE TO DUMMY-RECORD.                                  DB1044.2 IMP 77
   000601         060500 BLANK-LINE-PRINT-1.                                              DB1044.2
   000602         060600     PERFORM WRT-LN-1.                                            DB1044.2 598
   000603         060700 FAIL-ROUTINE-1.                                                  DB1044.2
   000604         060800     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-RTN-WRITE-1.     DB1044.2 178 IMP 609
   000605         060900     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-RTN-WRITE-1.      DB1044.2 191 IMP 609
   000606         061000     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    DB1044.2 271
   000607         061100     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE-1 2 TIMES.   DB1044.2 269 77 586
   000608         061200     GO TO FAIL-ROUTINE-EX-1.                                     DB1044.2 612
   000609         061300 FAIL-RTN-WRITE-1.                                                DB1044.2
   000610         061400     MOVE TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE-1         DB1044.2 175 76 586
   000611         061500     MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE-1 2 TIMES. DB1044.2 188 76 586
   000612         061600 FAIL-ROUTINE-EX-1. EXIT.                                         DB1044.2
   000613         061700 BAIL-OUT-1.                                                      DB1044.2
   000614         061800     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE-1.     DB1044.2 179 IMP 616
   000615         061900     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX-1.             DB1044.2 192 IMP 619
   000616         062000 BAIL-OUT-WRITE-1.                                                DB1044.2
   000617         062100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  DB1044.2 192 275 179 273
   000618         062200     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE-1 2 TIMES.   DB1044.2 269 77 586
   000619         062300 BAIL-OUT-EX-1. EXIT.                                             DB1044.2
   000620         062400 SORT-IN-EXIT.                                                    DB1044.2
   000621         062500     MOVE 0 TO RESULT-FLAG.                                       DB1044.2 95
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000622         062600 SORT-OUT SECTION.                                                DB1044.2
   000623         062700 SORT-OUT-1.                                                      DB1044.2
   000624         062800     MOVE "SORT-OUT-1" TO PAR-NAME.                               DB1044.2 168
   000625         062900     IF RESULT-FLAG IS NOT EQUAL TO 2                             DB1044.2 95
   000626      1  063000         PERFORM FAIL-2                                           DB1044.2 674
   000627      1  063100         MOVE "DEBUG PROCEDURE NOT EXECUTED" TO RE-MARK           DB1044.2 174
   000628      1  063200         GO TO SORT-OUT-WRITE.                                    DB1044.2 662
   000629         063300     PERFORM PASS-2.                                              DB1044.2 673
   000630         063400     MOVE "DEBUG PROCEDURE EXECUTED" TO RE-MARK.                  DB1044.2 174
   000631         063500     PERFORM SORT-OUT-WRITE.                                      DB1044.2 662
   000632         063600 SORT-OUT-2.                                                      DB1044.2
   000633         063700     MOVE "SORT-OUT-2" TO PAR-NAME.                               DB1044.2 168
   000634         063800     MOVE DBLINE-HOLD TO COMPUTED-A.                              DB1044.2 96 179
   000635         063900     MOVE "DEBUG-LINE, SEE NEXT LINE" TO RE-MARK.                 DB1044.2 174
   000636         064000     MOVE "<===  DEBUG-LINE" TO CORRECT-A.                        DB1044.2 192
   000637         064100     PERFORM   INSPT-2.                                           DB1044.2 672
   000638         064200     PERFORM SORT-OUT-WRITE.                                      DB1044.2 662
   000639         064300 SORT-OUT-3.                                                      DB1044.2
   000640         064400     MOVE "SORT-OUT-3" TO PAR-NAME.                               DB1044.2 168
   000641         064500     MOVE DBNAME-HOLD TO SIZE-8.                                  DB1044.2 97 159
   000642         064600     IF SIZE-8 IS EQUAL TO "SORT-OUT"                             DB1044.2 159
   000643      1  064700         PERFORM PASS-2 ELSE                                      DB1044.2 673
   000644      1  064800         MOVE "SORT-OUT" TO CORRECT-A                             DB1044.2 192
   000645      1  064900         MOVE DBNAME-HOLD TO COMPUTED-A                           DB1044.2 97 179
   000646      1  065000         PERFORM FAIL-2.                                          DB1044.2 674
   000647         065100     MOVE "DEBUG-NAME" TO RE-MARK.                                DB1044.2 174
   000648         065200     PERFORM SORT-OUT-WRITE.                                      DB1044.2 662
   000649         065300 SORT-OUT-4.                                                      DB1044.2
   000650         065400     MOVE "SORT-OUT-4" TO PAR-NAME.                               DB1044.2 168
   000651         065500     MOVE DBCONT-HOLD TO SIZE-11.                                 DB1044.2 98 155
   000652         065600     IF SIZE-11 IS EQUAL TO "SORT OUTPUT"                         DB1044.2 155
   000653      1  065700         PERFORM PASS-2 ELSE                                      DB1044.2 673
   000654      1  065800         MOVE "SORT OUTPUT" TO CORRECT-A                          DB1044.2 192
   000655      1  065900         MOVE DBCONT-HOLD TO COMPUTED-A                           DB1044.2 98 179
   000656      1  066000     PERFORM FAIL-2.                                              DB1044.2 674
   000657         066100     MOVE "DEBUG-CONTENTS" TO RE-MARK.                            DB1044.2 174
   000658         066200     GO TO SORT-OUT-WRITE.                                        DB1044.2 662
   000659         066300 SORT-OUT-DELETE.                                                 DB1044.2
   000660         066400     MOVE "SORT-OUT" TO PAR-NAME.                                 DB1044.2 168
   000661         066500     PERFORM DE-LETE-2.                                           DB1044.2 675
   000662         066600 SORT-OUT-WRITE.                                                  DB1044.2
   000663         066700     MOVE "DEBUG SORT OUTPUT" TO FEATURE.                         DB1044.2 164
   000664         066800     PERFORM PRINT-DETAIL-2.                                      DB1044.2 677
   000665         066900 SORT-OUT-5.                                                      DB1044.2
   000666         067000     OPEN OUTPUT GEN-FILE.                                        DB1044.2 78
   000667         067100 SORT-OUT-6.                                                      DB1044.2
   000668         067200     RETURN SORT-FILE INTO GEN-REC                                DB1044.2 89 88
   000669      1  067300         AT END GO TO SORT-OUT-EXIT.                              DB1044.2 723
   000670         067400     WRITE GEN-REC.                                               DB1044.2 88
   000671         067500     GO TO SORT-OUT-6.                                            DB1044.2 667
   000672         067600 INSPT-2. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.       DB1044.2 166 216
   000673         067700 PASS-2.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.         DB1044.2 166 217
   000674         067800 FAIL-2.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.        DB1044.2 166 215
   000675         067900 DE-LETE-2.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.        DB1044.2 166 214
   000676         068000     MOVE "****TEST DELETED****" TO RE-MARK.                      DB1044.2 174
   000677         068100 PRINT-DETAIL-2.                                                  DB1044.2
   000678         068200     IF REC-CT NOT EQUAL TO ZERO                                  DB1044.2 213 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000679      1  068300             MOVE "." TO PARDOT-X                                 DB1044.2 170
   000680      1  068400             MOVE REC-CT TO DOTVALUE.                             DB1044.2 213 171
   000681         068500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE-2.    DB1044.2 162 76 689
   000682         068600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE-2             DB1044.2 166 689
   000683      1  068700        PERFORM FAIL-ROUTINE-2 THRU FAIL-ROUTINE-EX-2             DB1044.2 706 715
   000684      1  068800          ELSE PERFORM BAIL-OUT-2 THRU BAIL-OUT-EX-2.             DB1044.2 716 722
   000685         068900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              DB1044.2 IMP 166 IMP 178
   000686         069000     MOVE SPACE TO CORRECT-X.                                     DB1044.2 IMP 191
   000687         069100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         DB1044.2 213 IMP IMP 168
   000688         069200     MOVE     SPACE TO RE-MARK.                                   DB1044.2 IMP 174
   000689         069300 WRITE-LINE-2.                                                    DB1044.2
   000690         069400     ADD 1 TO RECORD-COUNT.                                       DB1044.2 221
   000691         069500     IF RECORD-COUNT GREATER 50                                   DB1044.2 221
   000692      1  069600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          DB1044.2 77 220
   000693      1  069700         MOVE SPACE TO DUMMY-RECORD                               DB1044.2 IMP 77
   000694      1  069800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  DB1044.2 77
   000695      1  069900         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN-2           DB1044.2 201 77 701
   000696      1  070000         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN-2 2 TIMES   DB1044.2 206 77 701
   000697      1  070100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN-2        DB1044.2 276 77 701
   000698      1  070200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          DB1044.2 220 77
   000699      1  070300         MOVE ZERO TO RECORD-COUNT.                               DB1044.2 IMP 221
   000700         070400     PERFORM WRT-LN-2.                                            DB1044.2 701
   000701         070500 WRT-LN-2.                                                        DB1044.2
   000702         070600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               DB1044.2 77
   000703         070700     MOVE SPACE TO DUMMY-RECORD.                                  DB1044.2 IMP 77
   000704         070800 BLANK-LINE-PRINT-2.                                              DB1044.2
   000705         070900     PERFORM WRT-LN-2.                                            DB1044.2 701
   000706         071000 FAIL-ROUTINE-2.                                                  DB1044.2
   000707         071100     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-RTN-WRITE-2.     DB1044.2 178 IMP 712
   000708         071200     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-RTN-WRITE-2.      DB1044.2 191 IMP 712
   000709         071300     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    DB1044.2 271
   000710         071400     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE-2 2 TIMES.   DB1044.2 269 77 689
   000711         071500     GO TO FAIL-ROUTINE-EX-2.                                     DB1044.2 715
   000712         071600 FAIL-RTN-WRITE-2.                                                DB1044.2
   000713         071700     MOVE TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE-2         DB1044.2 175 76 689
   000714         071800     MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE-2 2 TIMES. DB1044.2 188 76 689
   000715         071900 FAIL-ROUTINE-EX-2. EXIT.                                         DB1044.2
   000716         072000 BAIL-OUT-2.                                                      DB1044.2
   000717         072100     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE-2.     DB1044.2 179 IMP 719
   000718         072200     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX-2.             DB1044.2 192 IMP 722
   000719         072300 BAIL-OUT-WRITE-2.                                                DB1044.2
   000720         072400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  DB1044.2 192 275 179 273
   000721         072500     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE-2 2 TIMES.   DB1044.2 269 77 689
   000722         072600 BAIL-OUT-EX-2. EXIT.                                             DB1044.2
   000723         072700 SORT-OUT-EXIT.                                                   DB1044.2
   000724         072800     CLOSE GEN-FILE.                                              DB1044.2 78
   000725         072900     MOVE 0 TO RESULT-FLAG.                                       DB1044.2 95
   000726         073000 END-OF-SORT SECTION.                                             DB1044.2
   000727         073100 AFTER-SORT.                                                      DB1044.2
   000728         073200     EXIT.                                                        DB1044.2
   000729         073300 DUMP-CODING SECTION.                                             DB1044.2
   000730         073400 BEGIN-DUMP.                                                      DB1044.2
   000731         073500     OPEN INPUT GEN-FILE.                                         DB1044.2 78
   000732         073600     PERFORM BLANK-LINE-PRINT.                                    DB1044.2 395
   000733         073700     MOVE " DUMP OF GEN-FILE FOLLOWS:" TO PRINT-REC.              DB1044.2 76
   000734         073800     PERFORM WRITE-LINE.                                          DB1044.2 380
   000735         073900 DUMP-FILE-1.                                                     DB1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000736         074000     READ GEN-FILE AT END GO TO DUMP-FILE-2.                      DB1044.2 78 740
   000737         074100     MOVE GEN-REC TO PRINT-REC.                                   DB1044.2 88 76
   000738         074200     PERFORM WRITE-LINE.                                          DB1044.2 380
   000739         074300     GO TO DUMP-FILE-1.                                           DB1044.2 735
   000740         074400 DUMP-FILE-2.                                                     DB1044.2
   000741         074500     CLOSE GEN-FILE.                                              DB1044.2 78
   000742         074600 CCVS-EXIT SECTION.                                               DB1044.2
   000743         074700 CCVS-999999.                                                     DB1044.2
   000744         074800     GO TO CLOSE-FILES.                                           DB1044.2 316
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      146   ALTERNATE-KEY1
      148   ALTERNATE-KEY2
      201   CCVS-C-1 . . . . . . . . . . .  344 386 592 695
      206   CCVS-C-2 . . . . . . . . . . .  345 387 593 696
      241   CCVS-E-1 . . . . . . . . . . .  350
      247   CCVS-E-2 . . . . . . . . . . .  359 366 373 378
      251   CCVS-E-2-2 . . . . . . . . . .  M358
      255   CCVS-E-3 . . . . . . . . . . .  379
      263   CCVS-E-4 . . . . . . . . . . .  358
      264   CCVS-E-4-1 . . . . . . . . . .  M356
      266   CCVS-E-4-2 . . . . . . . . . .  M357
      222   CCVS-H-1 . . . . . . . . . . .  340
      228   CCVS-H-2 . . . . . . . . . . .  341
      234   CCVS-H-3 . . . . . . . . . . .  342
      282   CCVS-PGM-ID. . . . . . . . . .  312 312
      133   CHARS-OR-RECORDS
      184   CM-18V0
      179   COMPUTED-A . . . . . . . . . .  180 181 182 183 184 408 411 M472 M482 M492 M537 M543 M551 614 617 M634 M645 M655
                                            717 720
      180   COMPUTED-N
      178   COMPUTED-X . . . . . . . . . .  M335 398 M582 604 M685 707
      181   COMPUTED-0V18
      183   COMPUTED-14V4
      185   COMPUTED-18V0
      182   COMPUTED-4V14
      192   CORRECT-A. . . . . . . . . . .  193 194 195 196 197 409 411 M474 M481 M491 M536 M544 M552 615 617 M636 M644 M654
                                            718 720
      193   CORRECT-N
      191   CORRECT-X. . . . . . . . . . .  M336 399 M583 605 M686 708
      194   CORRECT-0V18
      196   CORRECT-14V4
      198   CORRECT-18V0
      195   CORRECT-4V14
      197   CR-18V0
       98   DBCONT-HOLD. . . . . . . . . .  M293 488 492 548 551 651 655
       96   DBLINE-HOLD. . . . . . . . . .  M291 472 537 634
       97   DBNAME-HOLD. . . . . . . . . .  M292 478 482 540 543 641 645
        0   DEBUG-CONTENTS . . . . . . . .  293
        0   DEBUG-LINE . . . . . . . . . .  291
        0   DEBUG-NAME . . . . . . . . . .  292
      214   DELETE-CNT . . . . . . . . . .  M325 353 369 371 M572 M675
      171   DOTVALUE . . . . . . . . . . .  M330 M577 M680
      220   DUMMY-HOLD . . . . . . . . . .  M383 389 M589 595 M692 698
       77   DUMMY-RECORD . . . . . . . . .  M340 M341 M342 M344 M345 M346 M348 M350 M359 M366 M373 M378 M379 383 M384 385
                                            M386 M387 M388 M389 393 M394 M401 M412 589 M590 591 M592 M593 M594 M595 599 M600
                                            M607 M618 692 M693 694 M695 M696 M697 M698 702 M703 M710 M721
      151   END-FLAG . . . . . . . . . . .  523
      254   ENDER-DESC . . . . . . . . . .  M361 M372 M377
      215   ERROR-COUNTER. . . . . . . . .  M324 352 362 365 M571 M674
      219   ERROR-HOLD . . . . . . . . . .  M352 M353 M353 M354 357
      252   ERROR-TOTAL. . . . . . . . . .  M363 M365 M370 M371 M375 M376
      164   FEATURE. . . . . . . . . . . .  M468 M565 M663
      114   FILE-RECORD-INFO . . . . . . .  M417 425
      115   FILE-RECORD-INFO-P1-120
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    18
0 Defined   Cross-reference of data names   References

0     142   FILE-RECORD-INFO-P121-240
      100   FILE-RECORD-INFO-SKELETON. . .  417
       99   FILE-RECORD-INFORMATION-REC
       78   GEN-FILE . . . . . . . . . . .  63 305 422 439 498 505 514 516 518 524 528 666 724 731 736 741
       88   GEN-REC. . . . . . . . . . . .  M425 426 525 M668 670 737
      150   GEN-STATUS . . . . . . . . . .  65
      276   HYPHEN-LINE. . . . . . . . . .  346 348 388 594 697
      244   ID-AGAIN . . . . . . . . . . .  M312
      271   INFO-TEXT. . . . . . . . . . .  M400 M606 M709
      216   INSPECT-COUNTER. . . . . . . .  M322 352 374 376 M569 M672
      127   ODO-NUMBER
      166   P-OR-F . . . . . . . . . . . .  M322 M323 M324 M325 332 M335 M569 M570 M571 M572 579 M582 M672 M673 M674 M675
                                            682 M685
      168   PAR-NAME . . . . . . . . . . .  M337 M452 M463 M471 M485 M495 M564 M584 M624 M633 M640 M650 M660 M687
      170   PARDOT-X . . . . . . . . . . .  M329 M576 M679
      217   PASS-COUNTER . . . . . . . . .  M323 354 356 M570 M673
       72   PRINT-FILE . . . . . . . . . .  61 311 317
       76   PRINT-REC. . . . . . . . . . .  M331 M404 M405 M578 M610 M611 M681 M713 M714 M733 M737
      174   RE-MARK. . . . . . . . . . . .  M326 M338 M454 M459 M473 M484 M494 M520 M532 M535 M546 M554 M557 M561 M573 M585
                                            M627 M630 M635 M647 M657 M676 M688
      213   REC-CT . . . . . . . . . . . .  328 330 337 575 577 584 678 680 687
      212   REC-SKL-SUB
      221   RECORD-COUNT . . . . . . . . .  M381 382 M390 M587 588 M596 M690 691 M699
      137   RECORDS-IN-FILE
      121   REELUNIT-NUMBER
       95   RESULT-FLAG. . . . . . . . . .  M289 M297 M302 M307 M445 453 M499 513 515 517 M621 625 M725
      157   SIZE-10. . . . . . . . . . . .  M488 489
      155   SIZE-11. . . . . . . . . . . .  M540 541 M651 652
      153   SIZE-13. . . . . . . . . . . .  M548 549
      161   SIZE-7 . . . . . . . . . . . .  M478 479
      159   SIZE-8 . . . . . . . . . . . .  M641 642
       89   SORT-FILE. . . . . . . . . . .  67 446 668
       90   SORT-REC . . . . . . . . . . .  M525
       92   SORT-REC-NO. . . . . . . . . .  446
      175   TEST-COMPUTED. . . . . . . . .  404 610 713
      188   TEST-CORRECT . . . . . . . . .  405 611 714
      232   TEST-ID. . . . . . . . . . . .  M312
      162   TEST-RESULTS . . . . . . . . .  M313 331 578 681
      218   TOTAL-ERROR
      125   UPDATE-NUMBER
      135   XBLOCK-SIZE
      117   XFILE-NAME . . . . . . . . . .  M418
      139   XFILE-ORGANIZATION
      141   XLABEL-TYPE
      129   XPROGRAM-NAME. . . . . . . . .  M420
      144   XRECORD-KEY
      131   XRECORD-LENGTH . . . . . . . .  M421
      119   XRECORD-NAME . . . . . . . . .  M419
      123   XRECORD-NUMBER . . . . . . . .  M423 427 M428 M431 M433 M435 M437
      273   XXCOMPUTED . . . . . . . . . .  M411 M617 M720
      275   XXCORRECT. . . . . . . . . . .  M411 M617 M720
      269   XXINFO . . . . . . . . . . . .  401 412 607 618 710 721
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    19
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

      727   AFTER-SORT . . . . . . . . . .  G449
      304   AT-END-PROC. . . . . . . . . .  U300
      407   BAIL-OUT . . . . . . . . . . .  P334
      413   BAIL-OUT-EX. . . . . . . . . .  E334 G409
      619   BAIL-OUT-EX-1. . . . . . . . .  E581 G615
      722   BAIL-OUT-EX-2. . . . . . . . .  E684 G718
      410   BAIL-OUT-WRITE . . . . . . . .  G408
      616   BAIL-OUT-WRITE-1 . . . . . . .  G614
      719   BAIL-OUT-WRITE-2 . . . . . . .  G717
      613   BAIL-OUT-1 . . . . . . . . . .  P581
      716   BAIL-OUT-2 . . . . . . . . . .  P684
      306   BEGIN-AT-END-PROC
      730   BEGIN-DUMP
      416   BEGIN-FILE-GENERATION
      288   BEGIN-SORT-IN-PROC
      296   BEGIN-SORT-OUT-PROC
      444   BEGIN-TESTS
      301   BEGIN-USE-PROC
      395   BLANK-LINE-PRINT . . . . . . .  P732
      601   BLANK-LINE-PRINT-1
      704   BLANK-LINE-PRINT-2
      742   CCVS-EXIT
      743   CCVS-999999
      309   CCVS1
      414   CCVS1-EXIT . . . . . . . . . .  G315
      316   CLOSE-FILES. . . . . . . . . .  G744
      343   COLUMN-NAMES-ROUTINE . . . . .  E314
      290   DB-COMMON. . . . . . . . . . .  P298 P303
      325   DE-LETE
      572   DE-LETE-1. . . . . . . . . . .  P464 P529
      675   DE-LETE-2. . . . . . . . . . .  P661
      729   DUMP-CODING
      735   DUMP-FILE-1. . . . . . . . . .  G739
      740   DUMP-FILE-2. . . . . . . . . .  G736
      430   END-OF-GEN-LOOP
      726   END-OF-SORT
      347   END-ROUTINE. . . . . . . . . .  P317
      351   END-ROUTINE-1
      360   END-ROUTINE-12
      368   END-ROUTINE-13 . . . . . . . .  E317
      349   END-RTN-EXIT
      324   FAIL
      397   FAIL-ROUTINE . . . . . . . . .  P333
      406   FAIL-ROUTINE-EX. . . . . . . .  E333 G402
      612   FAIL-ROUTINE-EX-1. . . . . . .  E580 G608
      715   FAIL-ROUTINE-EX-2. . . . . . .  E683 G711
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    20
0 Defined   Cross-reference of procedures   References

0     403   FAIL-ROUTINE-WRITE . . . . . .  G398 G399
      603   FAIL-ROUTINE-1 . . . . . . . .  P580
      706   FAIL-ROUTINE-2 . . . . . . . .  P683
      609   FAIL-RTN-WRITE-1 . . . . . . .  G604 G605
      712   FAIL-RTN-WRITE-2 . . . . . . .  G707 G708
      571   FAIL-1 . . . . . . . . . . . .  P455 P483 P493 P545 P553 P558 P562
      674   FAIL-2 . . . . . . . . . . . .  P626 P646 P656
      424   GEN-LOOP . . . . . . . . . . .  G429 P432 P434 P436 P438
      339   HEAD-ROUTINE . . . . . . . . .  P314
      322   INSPT
      569   INSPT-1. . . . . . . . . . . .  P475 P538
      672   INSPT-2. . . . . . . . . . . .  P637
      310   OPEN-FILES
      323   PASS
      570   PASS-1 . . . . . . . . . . . .  P458 P480 P490 P519 P542 P550
      673   PASS-2 . . . . . . . . . . . .  P629 P643 P653
      327   PRINT-DETAIL
      574   PRINT-DETAIL-1 . . . . . . . .  P469 P566
      677   PRINT-DETAIL-2 . . . . . . . .  P664
      450   SORT-IN. . . . . . . . . . . .  U287 P447
      462   SORT-IN-DELETE
      620   SORT-IN-EXIT . . . . . . . . .  G568
      286   SORT-IN-PROC
      467   SORT-IN-WRITE. . . . . . . . .  P456 P460 P465 P476 P486 P496
      451   SORT-IN-1
      470   SORT-IN-2. . . . . . . . . . .  G461
      477   SORT-IN-3
      487   SORT-IN-4
      497   SORT-IN-5. . . . . . . . . . .  G457 G466
      622   SORT-OUT . . . . . . . . . . .  U295 P448
      659   SORT-OUT-DELETE
      723   SORT-OUT-EXIT. . . . . . . . .  G669
      294   SORT-OUT-PROC
      662   SORT-OUT-WRITE . . . . . . . .  G628 P631 P638 P648 G658
      623   SORT-OUT-1
      632   SORT-OUT-2
      639   SORT-OUT-3
      649   SORT-OUT-4
      665   SORT-OUT-5
      667   SORT-OUT-6 . . . . . . . . . .  G671
      527   SORT-USE-DELETE
      567   SORT-USE-DONE
      504   SORT-USE-TEST. . . . . . . . .  G526
      563   SORT-USE-WRITE . . . . . . . .  P521 G530 P533 P539 P547 G555 G559
      531   SORT-USE-1 . . . . . . . . . .  G514
      534   SORT-USE-2 . . . . . . . . . .  G522
      556   SORT-USE-3 . . . . . . . . . .  G516
      560   SORT-USE-4 . . . . . . . . . .  G524
      320   TERMINATE-CALL
      318   TERMINATE-CCVS
      299   USE-PROC
      380   WRITE-LINE . . . . . . . . . .  P331 P332 P340 P341 P342 P344 P345 P346 P348 P350 P359 P367 P373 P378 P379 P401
                                            P404 P405 P412 P734 P738
      586   WRITE-LINE-1 . . . . . . . . .  P578 P579 P607 P610 P611 P618
      689   WRITE-LINE-2 . . . . . . . . .  P681 P682 P710 P713 P714 P721
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    21
0 Defined   Cross-reference of procedures   References

0     392   WRT-LN . . . . . . . . . . . .  P386 P387 P388 P391 P396
      598   WRT-LN-1 . . . . . . . . . . .  P592 P593 P594 P597 P602
      701   WRT-LN-2 . . . . . . . . . . .  P695 P696 P697 P700 P705
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    22
0 Defined   Cross-reference of programs     References

        3   DB104A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB104A    Date 06/04/2022  Time 11:58:34   Page    23
0LineID  Message code  Message text

     72  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     78  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "GEN-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program DB104A:
 *    Source records = 744
 *    Data Division statements = 94
 *    Procedure Division statements = 433
 *    Generated COBOL statements = 0
 *    Program complexity factor = 439
0End of compilation 1,  program DB104A,  highest severity 0.
0Return code 0
