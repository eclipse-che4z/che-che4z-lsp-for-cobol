1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:51   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:51   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         OBSQ44.2
   000002         000200 PROGRAM-ID.                                                      OBSQ44.2
   000003         000300     OBSQ4A.                                                      OBSQ44.2
   000004         000500*                                                              *  OBSQ44.2
   000005         000600*    VALIDATION FOR:-                                          *  OBSQ44.2
   000006         000700*    " HIGH       ".                                              OBSQ44.2
   000007         000800*    USING CCVS85 VERSION 1.0 ISSUED IN JANUARY 1986.          *  OBSQ44.2
   000008         000900*                                                              *  OBSQ44.2
   000009         001000*    CREATION DATE     /     VALIDATION DATE                   *  OBSQ44.2
   000010         001100*    "4.2 ".                                                      OBSQ44.2
   000011         001200*                                                              *  OBSQ44.2
   000012         001300*         THE ROUTINE OBSQ4A READS AND VALIDATES THE MULTIPLE     OBSQ44.2
   000013         001400*    FILE TAPE CREATED IN OBSQ3A. THE FOUR FILES CONTAINED ON     OBSQ44.2
   000014         001500*    THIS TAPE ARE SQ-FS1, SQ-FS2, SQ-FS3, AND SQ-FS4.  BOTH      OBSQ44.2
   000015         001600*    MULTIPLE FILE TAPES ONE AND TWO ARE THEN PASSED ON TO OBSQ5A.OBSQ44.2
   000016         001700*    OBSQ4A USES A MULTIPLE FILE CLAUSE WITH THE POSITION PHRASE  OBSQ44.2
   000017         001800*    TO PROCESS TAPE ONE.  THIS TAPE WAS CREATED USING OPEN AND   OBSQ44.2
   000018         001900*    CLOSE STATEMENTS WITH NO REWIND.                             OBSQ44.2
   000019         002000 ENVIRONMENT DIVISION.                                            OBSQ44.2
   000020         002100 CONFIGURATION SECTION.                                           OBSQ44.2
   000021         002200 SOURCE-COMPUTER.                                                 OBSQ44.2
   000022         002300     XXXXX082.                                                    OBSQ44.2
   000023         002400 OBJECT-COMPUTER.                                                 OBSQ44.2
   000024         002500     XXXXX083.                                                    OBSQ44.2
   000025         002600 INPUT-OUTPUT SECTION.                                            OBSQ44.2
   000026         002700 FILE-CONTROL.                                                    OBSQ44.2
   000027         002800     SELECT RAW-DATA   ASSIGN TO                                  OBSQ44.2 50
   000028         002900     XXXXX062                                                     OBSQ44.2
   000029         003000            ORGANIZATION IS INDEXED                               OBSQ44.2
   000030         003100            ACCESS MODE IS RANDOM                                 OBSQ44.2
   000031         003200            RECORD KEY IS RAW-DATA-KEY.                           OBSQ44.2 53
   000032         003300     SELECT PRINT-FILE ASSIGN TO                                  OBSQ44.2 65
   000033         003400     XXXXX055.                                                    OBSQ44.2
   000034         003500     SELECT SQ-FS1 ASSIGN TO                                      OBSQ44.2 68
   000035         003600     XXXXP004.                                                    OBSQ44.2
   000036         003700     SELECT SQ-FS2 ASSIGN TO                                      OBSQ44.2 72
   000037         003800     XXXXP008.                                                    OBSQ44.2
   000038         003900     SELECT SQ-FS3 ASSIGN TO                                      OBSQ44.2 76
   000039         004000     XXXXP009.                                                    OBSQ44.2
   000040         004100     SELECT SQ-FS4 ASSIGN TO                                      OBSQ44.2 81
   000041         004200     XXXXP010.                                                    OBSQ44.2
   000042         004300 I-O-CONTROL.                                                     OBSQ44.2
   000043         004400     MULTIPLE FILE CONTAINS SQ-FS1 POSITION 1,                    OBSQ44.2
   000044         004500                            SQ-FS4 POSITION 4,                    OBSQ44.2
   000045         004600                            SQ-FS3 POSITION 3,                    OBSQ44.2
   000046         004700                            SQ-FS2 POSITION 2.                    OBSQ44.2
   000047         004800 DATA DIVISION.                                                   OBSQ44.2
   000048         004900 FILE SECTION.                                                    OBSQ44.2
   000049         005000                                                                  OBSQ44.2
   000050         005100 FD  RAW-DATA.                                                    OBSQ44.2
   000051         005200                                                                  OBSQ44.2
   000052         005300 01  RAW-DATA-SATZ.                                               OBSQ44.2
   000053         005400     05  RAW-DATA-KEY        PIC X(6).                            OBSQ44.2
   000054         005500     05  C-DATE              PIC 9(6).                            OBSQ44.2
   000055         005600     05  C-TIME              PIC 9(8).                            OBSQ44.2
   000056         005700     05  C-NO-OF-TESTS       PIC 99.                              OBSQ44.2
   000057         005800     05  C-OK                PIC 999.                             OBSQ44.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         005900     05  C-ALL               PIC 999.                             OBSQ44.2
   000059         006000     05  C-FAIL              PIC 999.                             OBSQ44.2
   000060         006100     05  C-DELETED           PIC 999.                             OBSQ44.2
   000061         006200     05  C-INSPECT           PIC 999.                             OBSQ44.2
   000062         006300     05  C-NOTE              PIC X(13).                           OBSQ44.2
   000063         006400     05  C-INDENT            PIC X.                               OBSQ44.2
   000064         006500     05  C-ABORT             PIC X(8).                            OBSQ44.2
   000065         006600 FD  PRINT-FILE.                                                  OBSQ44.2

 ==000065==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000066         006700 01  PRINT-REC PICTURE X(120).                                    OBSQ44.2
   000067         006800 01  DUMMY-RECORD PICTURE X(120).                                 OBSQ44.2
   000068         006900 FD  SQ-FS1                                                       OBSQ44.2

 ==000068==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS1".

   000069         007000     LABEL RECORD STANDARD                                        OBSQ44.2
   000070         007100                 .                                                OBSQ44.2
   000071         007200 01  SQ-FS1R1-F-G-120   PIC X(120).                               OBSQ44.2
   000072         007300 FD  SQ-FS2                                                       OBSQ44.2

 ==000072==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS2".

   000073         007400     LABEL RECORD STANDARD                                        OBSQ44.2
   000074         007500     BLOCK 5 RECORDS.                                             OBSQ44.2
   000075         007600 01  SQ-FS2R1-F-G-120   PIC X(120).                               OBSQ44.2
   000076         007700 FD  SQ-FS3                                                       OBSQ44.2

 ==000076==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS3".

   000077         007800     LABEL RECORD STANDARD                                        OBSQ44.2
   000078         007900     RECORD CONTAINS 120 CHARACTERS                               OBSQ44.2
   000079         008000     BLOCK CONTAINS 1200 CHARACTERS.                              OBSQ44.2
   000080         008100 01  SQ-FS3R1-F-G-120   PIC X(120).                               OBSQ44.2
   000081         008200 FD  SQ-FS4                                                       OBSQ44.2

 ==000081==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS4".

   000082         008300     LABEL RECORD IS STANDARD                                     OBSQ44.2
   000083         008400     RECORD          120 CHARACTERS                               OBSQ44.2
   000084         008500     BLOCK CONTAINS 10 RECORDS.                                   OBSQ44.2
   000085         008600 01  SQ-FS4R1-F-G-120   PIC X(120).                               OBSQ44.2
   000086         008700 WORKING-STORAGE SECTION.                                         OBSQ44.2
   000087         008800 77  RECORDS-COUNT       PIC 999   VALUE 0.                       OBSQ44.2
   000088         008900 77  RECORDS-IN-ERROR   PIC 999   VALUE 0.                        OBSQ44.2
   000089         009000 01  FILE-RECORD-INFORMATION-REC.                                 OBSQ44.2
   000090         009100     03 FILE-RECORD-INFO-SKELETON.                                OBSQ44.2
   000091         009200        05 FILLER                 PICTURE X(48)       VALUE       OBSQ44.2
   000092         009300             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  OBSQ44.2
   000093         009400        05 FILLER                 PICTURE X(46)       VALUE       OBSQ44.2
   000094         009500             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    OBSQ44.2
   000095         009600        05 FILLER                 PICTURE X(26)       VALUE       OBSQ44.2
   000096         009700             ",LFIL=000000,ORG=  ,LBLR= ".                        OBSQ44.2
   000097         009800        05 FILLER                 PICTURE X(37)       VALUE       OBSQ44.2
   000098         009900             ",RECKEY=                             ".             OBSQ44.2
   000099         010000        05 FILLER                 PICTURE X(38)       VALUE       OBSQ44.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000100         010100             ",ALTKEY1=                             ".            OBSQ44.2
   000101         010200        05 FILLER                 PICTURE X(38)       VALUE       OBSQ44.2
   000102         010300             ",ALTKEY2=                             ".            OBSQ44.2
   000103         010400        05 FILLER                 PICTURE X(7)        VALUE SPACE.OBSQ44.2 IMP
   000104         010500     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              OBSQ44.2
   000105         010600        05 FILE-RECORD-INFO-P1-120.                               OBSQ44.2
   000106         010700           07 FILLER              PIC X(5).                       OBSQ44.2
   000107         010800           07 XFILE-NAME           PIC X(6).                      OBSQ44.2
   000108         010900           07 FILLER              PIC X(8).                       OBSQ44.2
   000109         011000           07 XRECORD-NAME         PIC X(6).                      OBSQ44.2
   000110         011100           07 FILLER              PIC X(1).                       OBSQ44.2
   000111         011200           07 REELUNIT-NUMBER     PIC 9(1).                       OBSQ44.2
   000112         011300           07 FILLER              PIC X(7).                       OBSQ44.2
   000113         011400           07 XRECORD-NUMBER       PIC 9(6).                      OBSQ44.2
   000114         011500           07 FILLER              PIC X(6).                       OBSQ44.2
   000115         011600           07 UPDATE-NUMBER       PIC 9(2).                       OBSQ44.2
   000116         011700           07 FILLER              PIC X(5).                       OBSQ44.2
   000117         011800           07 ODO-NUMBER          PIC 9(4).                       OBSQ44.2
   000118         011900           07 FILLER              PIC X(5).                       OBSQ44.2
   000119         012000           07 XPROGRAM-NAME        PIC X(5).                      OBSQ44.2
   000120         012100           07 FILLER              PIC X(7).                       OBSQ44.2
   000121         012200           07 XRECORD-LENGTH       PIC 9(6).                      OBSQ44.2
   000122         012300           07 FILLER              PIC X(7).                       OBSQ44.2
   000123         012400           07 CHARS-OR-RECORDS    PIC X(2).                       OBSQ44.2
   000124         012500           07 FILLER              PIC X(1).                       OBSQ44.2
   000125         012600           07 XBLOCK-SIZE          PIC 9(4).                      OBSQ44.2
   000126         012700           07 FILLER              PIC X(6).                       OBSQ44.2
   000127         012800           07 RECORDS-IN-FILE     PIC 9(6).                       OBSQ44.2
   000128         012900           07 FILLER              PIC X(5).                       OBSQ44.2
   000129         013000           07 XFILE-ORGANIZATION   PIC X(2).                      OBSQ44.2
   000130         013100           07 FILLER              PIC X(6).                       OBSQ44.2
   000131         013200           07 XLABEL-TYPE          PIC X(1).                      OBSQ44.2
   000132         013300        05 FILE-RECORD-INFO-P121-240.                             OBSQ44.2
   000133         013400           07 FILLER              PIC X(8).                       OBSQ44.2
   000134         013500           07 XRECORD-KEY          PIC X(29).                     OBSQ44.2
   000135         013600           07 FILLER              PIC X(9).                       OBSQ44.2
   000136         013700           07 ALTERNATE-KEY1      PIC X(29).                      OBSQ44.2
   000137         013800           07 FILLER              PIC X(9).                       OBSQ44.2
   000138         013900           07 ALTERNATE-KEY2      PIC X(29).                      OBSQ44.2
   000139         014000           07 FILLER              PIC X(7).                       OBSQ44.2
   000140         014100 01  TEST-RESULTS.                                                OBSQ44.2
   000141         014200     02 FILLER                    PICTURE X VALUE SPACE.          OBSQ44.2 IMP
   000142         014300     02 FEATURE                   PICTURE X(20) VALUE SPACE.      OBSQ44.2 IMP
   000143         014400     02 FILLER                    PICTURE X VALUE SPACE.          OBSQ44.2 IMP
   000144         014500     02 P-OR-F                    PICTURE X(5) VALUE SPACE.       OBSQ44.2 IMP
   000145         014600     02 FILLER                    PICTURE X  VALUE SPACE.         OBSQ44.2 IMP
   000146         014700     02  PAR-NAME.                                                OBSQ44.2
   000147         014800       03 FILLER PICTURE X(12) VALUE SPACE.                       OBSQ44.2 IMP
   000148         014900       03  PARDOT-X PICTURE X  VALUE SPACE.                       OBSQ44.2 IMP
   000149         015000       03 DOTVALUE PICTURE 99  VALUE ZERO.                        OBSQ44.2 IMP
   000150         015100       03 FILLER PIC X(5) VALUE SPACE.                            OBSQ44.2 IMP
   000151         015200     02 FILLER PIC X(10) VALUE SPACE.                             OBSQ44.2 IMP
   000152         015300     02 RE-MARK PIC X(61).                                        OBSQ44.2
   000153         015400 01  TEST-COMPUTED.                                               OBSQ44.2
   000154         015500     02 FILLER PIC X(30) VALUE SPACE.                             OBSQ44.2 IMP
   000155         015600     02 FILLER PIC X(17) VALUE "       COMPUTED=".                OBSQ44.2
   000156         015700     02 COMPUTED-X.                                               OBSQ44.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000157         015800     03 COMPUTED-A                PICTURE X(20) VALUE SPACE.      OBSQ44.2 IMP
   000158         015900     03 COMPUTED-N REDEFINES COMPUTED-A PICTURE -9(9).9(9).       OBSQ44.2 157
   000159         016000     03 COMPUTED-0V18 REDEFINES COMPUTED-A  PICTURE -.9(18).      OBSQ44.2 157
   000160         016100     03 COMPUTED-4V14 REDEFINES COMPUTED-A  PICTURE -9(4).9(14).  OBSQ44.2 157
   000161         016200     03 COMPUTED-14V4 REDEFINES COMPUTED-A  PICTURE -9(14).9(4).  OBSQ44.2 157
   000162         016300     03       CM-18V0 REDEFINES COMPUTED-A.                       OBSQ44.2 157
   000163         016400         04 COMPUTED-18V0                   PICTURE -9(18).       OBSQ44.2
   000164         016500         04 FILLER                          PICTURE X.            OBSQ44.2
   000165         016600     03 FILLER PIC X(50) VALUE SPACE.                             OBSQ44.2 IMP
   000166         016700 01  TEST-CORRECT.                                                OBSQ44.2
   000167         016800     02 FILLER PIC X(30) VALUE SPACE.                             OBSQ44.2 IMP
   000168         016900     02 FILLER PIC X(17) VALUE "       CORRECT =".                OBSQ44.2
   000169         017000     02 CORRECT-X.                                                OBSQ44.2
   000170         017100     03 CORRECT-A                 PICTURE X(20) VALUE SPACE.      OBSQ44.2 IMP
   000171         017200     03 CORRECT-N REDEFINES CORRECT-A PICTURE -9(9).9(9).         OBSQ44.2 170
   000172         017300     03 CORRECT-0V18 REDEFINES CORRECT-A    PICTURE -.9(18).      OBSQ44.2 170
   000173         017400     03 CORRECT-4V14 REDEFINES CORRECT-A    PICTURE -9(4).9(14).  OBSQ44.2 170
   000174         017500     03 CORRECT-14V4 REDEFINES CORRECT-A    PICTURE -9(14).9(4).  OBSQ44.2 170
   000175         017600     03      CR-18V0 REDEFINES CORRECT-A.                         OBSQ44.2 170
   000176         017700         04 CORRECT-18V0                    PICTURE -9(18).       OBSQ44.2
   000177         017800         04 FILLER                          PICTURE X.            OBSQ44.2
   000178         017900     03 FILLER PIC X(50) VALUE SPACE.                             OBSQ44.2 IMP
   000179         018000 01  CCVS-C-1.                                                    OBSQ44.2
   000180         018100     02 FILLER PICTURE IS X(99) VALUE IS " FEATURE              PAOBSQ44.2
   000181         018200-    "SS  PARAGRAPH-NAME                                          OBSQ44.2
   000182         018300-    "        REMARKS".                                           OBSQ44.2
   000183         018400     02 FILLER PICTURE IS X(20) VALUE IS SPACE.                   OBSQ44.2 IMP
   000184         018500 01  CCVS-C-2.                                                    OBSQ44.2
   000185         018600     02 FILLER PICTURE IS X VALUE IS SPACE.                       OBSQ44.2 IMP
   000186         018700     02 FILLER PICTURE IS X(6) VALUE IS "TESTED".                 OBSQ44.2
   000187         018800     02 FILLER PICTURE IS X(15) VALUE IS SPACE.                   OBSQ44.2 IMP
   000188         018900     02 FILLER PICTURE IS X(4) VALUE IS "FAIL".                   OBSQ44.2
   000189         019000     02 FILLER PICTURE IS X(94) VALUE IS SPACE.                   OBSQ44.2 IMP
   000190         019100 01  REC-SKL-SUB PICTURE 9(2) VALUE ZERO.                         OBSQ44.2 IMP
   000191         019200 01  REC-CT PICTURE 99 VALUE ZERO.                                OBSQ44.2 IMP
   000192         019300 01  DELETE-CNT                   PICTURE 999  VALUE ZERO.        OBSQ44.2 IMP
   000193         019400 01  ERROR-COUNTER PICTURE IS 999 VALUE IS ZERO.                  OBSQ44.2 IMP
   000194         019500 01  INSPECT-COUNTER PIC 999 VALUE ZERO.                          OBSQ44.2 IMP
   000195         019600 01  PASS-COUNTER PIC 999 VALUE ZERO.                             OBSQ44.2 IMP
   000196         019700 01  TOTAL-ERROR PIC 999 VALUE ZERO.                              OBSQ44.2 IMP
   000197         019800 01  ERROR-HOLD PIC 999 VALUE ZERO.                               OBSQ44.2 IMP
   000198         019900 01  DUMMY-HOLD PIC X(120) VALUE SPACE.                           OBSQ44.2 IMP
   000199         020000 01  RECORD-COUNT PIC 9(5) VALUE ZERO.                            OBSQ44.2 IMP
   000200         020100 01  CCVS-H-1.                                                    OBSQ44.2
   000201         020200     02  FILLER   PICTURE X(27)  VALUE SPACE.                     OBSQ44.2 IMP
   000202         020300     02 FILLER PICTURE X(67) VALUE                                OBSQ44.2
   000203         020400     " FEDERAL SOFTWARE TESTING CENTER COBOL COMPILER VALIDATION  OBSQ44.2
   000204         020500-    " SYSTEM".                                                   OBSQ44.2
   000205         020600     02  FILLER     PICTURE X(26)  VALUE SPACE.                   OBSQ44.2 IMP
   000206         020700 01  CCVS-H-2.                                                    OBSQ44.2
   000207         020800     02 FILLER PICTURE X(52) VALUE IS                             OBSQ44.2
   000208         020900     "CCVS85 FSTC COPY, NOT FOR DISTRIBUTION.".                   OBSQ44.2
   000209         021000     02 FILLER PICTURE IS X(19) VALUE IS "TEST RESULTS SET-  ".   OBSQ44.2
   000210         021100     02 TEST-ID PICTURE IS X(9).                                  OBSQ44.2
   000211         021200     02 FILLER PICTURE IS X(40) VALUE IS SPACE.                   OBSQ44.2 IMP
   000212         021300 01  CCVS-H-3.                                                    OBSQ44.2
   000213         021400     02  FILLER PICTURE X(34) VALUE                               OBSQ44.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000214         021500     " FOR OFFICIAL USE ONLY    ".                                OBSQ44.2
   000215         021600     02  FILLER PICTURE X(58) VALUE                               OBSQ44.2
   000216         021700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".OBSQ44.2
   000217         021800     02  FILLER PICTURE X(28) VALUE                               OBSQ44.2
   000218         021900     "  COPYRIGHT   1985 ".                                       OBSQ44.2
   000219         022000 01  CCVS-E-1.                                                    OBSQ44.2
   000220         022100     02 FILLER PICTURE IS X(52) VALUE IS SPACE.                   OBSQ44.2 IMP
   000221         022200     02 FILLER PICTURE IS X(14) VALUE IS "END OF TEST-  ".        OBSQ44.2
   000222         022300     02 ID-AGAIN PICTURE IS X(9).                                 OBSQ44.2
   000223         022400     02 FILLER PICTURE X(45) VALUE IS                             OBSQ44.2
   000224         022500     " NTIS DISTRIBUTION COBOL 85".                               OBSQ44.2
   000225         022600 01  CCVS-E-2.                                                    OBSQ44.2
   000226         022700     02  FILLER                   PICTURE X(31)  VALUE            OBSQ44.2
   000227         022800     SPACE.                                                       OBSQ44.2 IMP
   000228         022900     02  FILLER                   PICTURE X(21)  VALUE SPACE.     OBSQ44.2 IMP
   000229         023000     02 CCVS-E-2-2.                                               OBSQ44.2
   000230         023100         03 ERROR-TOTAL PICTURE IS XXX VALUE IS SPACE.            OBSQ44.2 IMP
   000231         023200         03 FILLER PICTURE IS X VALUE IS SPACE.                   OBSQ44.2 IMP
   000232         023300         03 ENDER-DESC PIC X(46) VALUE "ERRORS ENCOUNTERED".      OBSQ44.2
   000233         023400 01  CCVS-E-3.                                                    OBSQ44.2
   000234         023500     02  FILLER PICTURE X(22) VALUE                               OBSQ44.2
   000235         023600     " FOR OFFICIAL USE ONLY".                                    OBSQ44.2
   000236         023700     02  FILLER PICTURE X(12) VALUE SPACE.                        OBSQ44.2 IMP
   000237         023800     02  FILLER PICTURE X(58) VALUE                               OBSQ44.2
   000238         023900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBSQ44.2
   000239         024000     02  FILLER PICTURE X(13) VALUE SPACE.                        OBSQ44.2 IMP
   000240         024100     02 FILLER PIC X(15) VALUE " COPYRIGHT 1985".                 OBSQ44.2
   000241         024200 01  CCVS-E-4.                                                    OBSQ44.2
   000242         024300     02 CCVS-E-4-1 PIC XXX VALUE SPACE.                           OBSQ44.2 IMP
   000243         024400     02 FILLER PIC XXXX VALUE " OF ".                             OBSQ44.2
   000244         024500     02 CCVS-E-4-2 PIC XXX VALUE SPACE.                           OBSQ44.2 IMP
   000245         024600     02 FILLER PIC X(40) VALUE                                    OBSQ44.2
   000246         024700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       OBSQ44.2
   000247         024800 01  XXINFO.                                                      OBSQ44.2
   000248         024900     02 FILLER PIC X(30) VALUE "        *** INFORMATION  ***".    OBSQ44.2
   000249         025000     02 INFO-TEXT.                                                OBSQ44.2
   000250         025100     04 FILLER PIC X(20) VALUE SPACE.                             OBSQ44.2 IMP
   000251         025200     04 XXCOMPUTED PIC X(20).                                     OBSQ44.2
   000252         025300     04 FILLER PIC X(5) VALUE SPACE.                              OBSQ44.2 IMP
   000253         025400     04 XXCORRECT PIC X(20).                                      OBSQ44.2
   000254         025500 01  HYPHEN-LINE.                                                 OBSQ44.2
   000255         025600     02 FILLER PICTURE IS X VALUE IS SPACE.                       OBSQ44.2 IMP
   000256         025700     02 FILLER PICTURE IS X(65) VALUE IS "************************OBSQ44.2
   000257         025800-    "*****************************************".                 OBSQ44.2
   000258         025900     02 FILLER PICTURE IS X(54) VALUE IS "************************OBSQ44.2
   000259         026000-    "******************************".                            OBSQ44.2
   000260         026100 01  CCVS-PGM-ID PIC X(6) VALUE                                   OBSQ44.2
   000261         026200     "OBSQ4A".                                                    OBSQ44.2
   000262         026300 PROCEDURE DIVISION.                                              OBSQ44.2
   000263         026400 CCVS1 SECTION.                                                   OBSQ44.2
   000264         026500 OPEN-FILES.                                                      OBSQ44.2
   000265         026600     OPEN I-O RAW-DATA.                                           OBSQ44.2 50
   000266         026700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            OBSQ44.2 260 53
   000267         026800     READ RAW-DATA INVALID KEY GO TO END-E-1.                     OBSQ44.2 50 273
   000268         026900     MOVE "ABORTED " TO C-ABORT.                                  OBSQ44.2 64
   000269         027000     ADD 1 TO C-NO-OF-TESTS.                                      OBSQ44.2 56
   000270         027100     ACCEPT C-DATE  FROM DATE.                                    OBSQ44.2 54
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000271         027200     ACCEPT C-TIME  FROM TIME.                                    OBSQ44.2 55
   000272         027300     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             OBSQ44.2 52 273
   000273         027400 END-E-1.                                                         OBSQ44.2
   000274         027500     CLOSE RAW-DATA.                                              OBSQ44.2 50
   000275         027600     OPEN     OUTPUT PRINT-FILE.                                  OBSQ44.2 65
   000276         027700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   OBSQ44.2 260 210 260 222
   000277         027800     MOVE    SPACE TO TEST-RESULTS.                               OBSQ44.2 IMP 140
   000278         027900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             OBSQ44.2 322 326
   000279         028000     MOVE ZERO TO REC-SKL-SUB.                                    OBSQ44.2 IMP 190
   000280         028100     PERFORM CCVS-INIT-FILE 9 TIMES.                              OBSQ44.2 281
   000281         028200 CCVS-INIT-FILE.                                                  OBSQ44.2
   000282         028300     ADD 1 TO REC-SKL-SUB.                                        OBSQ44.2 190
   000283         028400     MOVE FILE-RECORD-INFO-SKELETON TO                            OBSQ44.2 90
   000284         028500                  FILE-RECORD-INFO (REC-SKL-SUB).                 OBSQ44.2 104 190
   000285         028600 CCVS-INIT-EXIT.                                                  OBSQ44.2
   000286         028700     GO TO CCVS1-EXIT.                                            OBSQ44.2 397
   000287         028800 CLOSE-FILES.                                                     OBSQ44.2
   000288         028900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   OBSQ44.2 330 351 65
   000289         029000     OPEN I-O RAW-DATA.                                           OBSQ44.2 50
   000290         029100     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            OBSQ44.2 260 53
   000291         029200     READ RAW-DATA INVALID KEY GO TO END-E-2.                     OBSQ44.2 50 299
   000292         029300     MOVE "OK.     " TO C-ABORT.                                  OBSQ44.2 64
   000293         029400     MOVE PASS-COUNTER TO C-OK.                                   OBSQ44.2 195 57
   000294         029500     MOVE ERROR-HOLD   TO C-ALL.                                  OBSQ44.2 197 58
   000295         029600     MOVE ERROR-COUNTER TO C-FAIL.                                OBSQ44.2 193 59
   000296         029700     MOVE DELETE-CNT TO C-DELETED.                                OBSQ44.2 192 60
   000297         029800     MOVE INSPECT-COUNTER TO C-INSPECT.                           OBSQ44.2 194 61
   000298         029900     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             OBSQ44.2 52 299
   000299         030000 END-E-2.                                                         OBSQ44.2
   000300         030100     CLOSE RAW-DATA.                                              OBSQ44.2 50
   000301         030200 TERMINATE-CCVS.                                                  OBSQ44.2
   000302         030300     EXIT PROGRAM.                                                OBSQ44.2
   000303         030400 TERMINATE-CALL.                                                  OBSQ44.2
   000304         030500     STOP     RUN.                                                OBSQ44.2
   000305         030600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         OBSQ44.2 144 194
   000306         030700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           OBSQ44.2 144 195
   000307         030800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          OBSQ44.2 144 193
   000308         030900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.          OBSQ44.2 144 192
   000309         031000     MOVE "****TEST DELETED****" TO RE-MARK.                      OBSQ44.2 152
   000310         031100 PRINT-DETAIL.                                                    OBSQ44.2
   000311         031200     IF REC-CT NOT EQUAL TO ZERO                                  OBSQ44.2 191 IMP
   000312      1  031300             MOVE "." TO PARDOT-X                                 OBSQ44.2 148
   000313      1  031400             MOVE REC-CT TO DOTVALUE.                             OBSQ44.2 191 149
   000314         031500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      OBSQ44.2 140 66 363
   000315         031600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               OBSQ44.2 144 363
   000316      1  031700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 OBSQ44.2 380 389
   000317      1  031800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 OBSQ44.2 390 396
   000318         031900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              OBSQ44.2 IMP 144 IMP 156
   000319         032000     MOVE SPACE TO CORRECT-X.                                     OBSQ44.2 IMP 169
   000320         032100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         OBSQ44.2 191 IMP IMP 146
   000321         032200     MOVE     SPACE TO RE-MARK.                                   OBSQ44.2 IMP 152
   000322         032300 HEAD-ROUTINE.                                                    OBSQ44.2
   000323         032400     MOVE CCVS-H-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBSQ44.2 200 67 363
   000324         032500     MOVE CCVS-H-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.   OBSQ44.2 206 67 363
   000325         032600     MOVE CCVS-H-3 TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.   OBSQ44.2 212 67 363
   000326         032700 COLUMN-NAMES-ROUTINE.                                            OBSQ44.2
   000327         032800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBSQ44.2 179 67 363
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000328         032900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBSQ44.2 184 67 363
   000329         033000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        OBSQ44.2 254 67 363
   000330         033100 END-ROUTINE.                                                     OBSQ44.2
   000331         033200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.OBSQ44.2 254 67 363
   000332         033300 END-RTN-EXIT.                                                    OBSQ44.2
   000333         033400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBSQ44.2 219 67 363
   000334         033500 END-ROUTINE-1.                                                   OBSQ44.2
   000335         033600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      OBSQ44.2 193 197 194
   000336         033700      ERROR-HOLD. ADD DELETE-CNT TO ERROR-HOLD.                   OBSQ44.2 197 192 197
   000337         033800      ADD PASS-COUNTER TO ERROR-HOLD.                             OBSQ44.2 195 197
   000338         033900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   OBSQ44.2
   000339         034000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            OBSQ44.2 195 242
   000340         034100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              OBSQ44.2 197 244
   000341         034200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                OBSQ44.2 241 229
   000342         034300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           OBSQ44.2 225 67 363
   000343         034400  END-ROUTINE-12.                                                 OBSQ44.2
   000344         034500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        OBSQ44.2 232
   000345         034600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      OBSQ44.2 193 IMP
   000346      1  034700         MOVE "NO " TO ERROR-TOTAL                                OBSQ44.2 230
   000347         034800         ELSE                                                     OBSQ44.2
   000348      1  034900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       OBSQ44.2 193 230
   000349         035000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           OBSQ44.2 225 67
   000350         035100     PERFORM WRITE-LINE.                                          OBSQ44.2 363
   000351         035200 END-ROUTINE-13.                                                  OBSQ44.2
   000352         035300     IF DELETE-CNT IS EQUAL TO ZERO                               OBSQ44.2 192 IMP
   000353      1  035400         MOVE "NO " TO ERROR-TOTAL  ELSE                          OBSQ44.2 230
   000354      1  035500         MOVE DELETE-CNT TO ERROR-TOTAL.                          OBSQ44.2 192 230
   000355         035600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   OBSQ44.2 232
   000356         035700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBSQ44.2 225 67 363
   000357         035800      IF   INSPECT-COUNTER EQUAL TO ZERO                          OBSQ44.2 194 IMP
   000358      1  035900          MOVE "NO " TO ERROR-TOTAL                               OBSQ44.2 230
   000359      1  036000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   OBSQ44.2 194 230
   000360         036100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            OBSQ44.2 232
   000361         036200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          OBSQ44.2 225 67 363
   000362         036300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBSQ44.2 233 67 363
   000363         036400 WRITE-LINE.                                                      OBSQ44.2
   000364         036500     ADD 1 TO RECORD-COUNT.                                       OBSQ44.2 199
   000365         036600     IF RECORD-COUNT GREATER 50                                   OBSQ44.2 199
   000366      1  036700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          OBSQ44.2 67 198
   000367      1  036800         MOVE SPACE TO DUMMY-RECORD                               OBSQ44.2 IMP 67
   000368      1  036900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  OBSQ44.2 67
   000369      1  037000         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             OBSQ44.2 179 67 375
   000370      1  037100         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     OBSQ44.2 184 67 375
   000371      1  037200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          OBSQ44.2 254 67 375
   000372      1  037300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          OBSQ44.2 198 67
   000373      1  037400         MOVE ZERO TO RECORD-COUNT.                               OBSQ44.2 IMP 199
   000374         037500     PERFORM WRT-LN.                                              OBSQ44.2 375
   000375         037600 WRT-LN.                                                          OBSQ44.2
   000376         037700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               OBSQ44.2 67
   000377         037800     MOVE SPACE TO DUMMY-RECORD.                                  OBSQ44.2 IMP 67
   000378         037900 BLANK-LINE-PRINT.                                                OBSQ44.2
   000379         038000     PERFORM WRT-LN.                                              OBSQ44.2 375
   000380         038100 FAIL-ROUTINE.                                                    OBSQ44.2
   000381         038200     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.   OBSQ44.2 156 IMP 386
   000382         038300     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.    OBSQ44.2 169 IMP 386
   000383         038400     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    OBSQ44.2 249
   000384         038500     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     OBSQ44.2 247 67 363
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000385         038600     GO TO FAIL-ROUTINE-EX.                                       OBSQ44.2 389
   000386         038700 FAIL-ROUTINE-WRITE.                                              OBSQ44.2
   000387         038800     MOVE TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE           OBSQ44.2 153 66 363
   000388         038900     MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES.   OBSQ44.2 166 66 363
   000389         039000 FAIL-ROUTINE-EX. EXIT.                                           OBSQ44.2
   000390         039100 BAIL-OUT.                                                        OBSQ44.2
   000391         039200     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.       OBSQ44.2 157 IMP 393
   000392         039300     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.               OBSQ44.2 170 IMP 396
   000393         039400 BAIL-OUT-WRITE.                                                  OBSQ44.2
   000394         039500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  OBSQ44.2 170 253 157 251
   000395         039600     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     OBSQ44.2 247 67 363
   000396         039700 BAIL-OUT-EX. EXIT.                                               OBSQ44.2
   000397         039800 CCVS1-EXIT.                                                      OBSQ44.2
   000398         039900     EXIT.                                                        OBSQ44.2
   000399         040000 SECT-OBSQ4A-0001 SECTION.                                        OBSQ44.2
   000400         040100 SEQ-INIT-001.                                                    OBSQ44.2
   000401         040200     MOVE 0 TO RECORDS-COUNT, RECORDS-IN-ERROR.                   OBSQ44.2 87 88
   000402         040300     OPEN INPUT SQ-FS1.                                           OBSQ44.2 68
   000403         040400 SEQ-TEST-001.                                                    OBSQ44.2
   000404         040500     READ SQ-FS1 AT END GO TO SEQ-TEST-001-01.                    OBSQ44.2 68 422
   000405         040600     MOVE SQ-FS1R1-F-G-120 TO FILE-RECORD-INFO-P1-120 (1).        OBSQ44.2 71 105
   000406         040700     ADD 1 TO RECORDS-COUNT.                                      OBSQ44.2 87
   000407         040800     IF RECORDS-COUNT GREATER THAN 750                            OBSQ44.2 87
   000408      1  040900              MOVE "MORE THAN 750 RECORDS" TO RE-MARK             OBSQ44.2 152
   000409      1  041000              GO TO SEQ-FAIL-001.                                 OBSQ44.2 426
   000410         041100     IF RECORDS-COUNT NOT EQUAL TO XRECORD-NUMBER (1)             OBSQ44.2 87 113
   000411      1  041200              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000412      1  041300              GO TO SEQ-TEST-001.                                 OBSQ44.2 403
   000413         041400     IF XFILE-NAME (1) NOT EQUAL TO "SQ-FS1"                      OBSQ44.2 107
   000414      1  041500              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000415      1  041600              GO TO SEQ-TEST-001.                                 OBSQ44.2 403
   000416         041700     IF CHARS-OR-RECORDS (1) NOT EQUAL TO "RC"                    OBSQ44.2 123
   000417      1  041800              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000418      1  041900              GO TO SEQ-TEST-001.                                 OBSQ44.2 403
   000419         042000     IF XBLOCK-SIZE (1) NOT EQUAL TO 1                            OBSQ44.2 125
   000420      1  042100              ADD 1 TO RECORDS-IN-ERROR.                          OBSQ44.2 88
   000421         042200     GO TO SEQ-TEST-001.                                          OBSQ44.2 403
   000422         042300 SEQ-TEST-001-01.                                                 OBSQ44.2
   000423         042400     IF RECORDS-IN-ERROR EQUAL TO ZERO                            OBSQ44.2 88 IMP
   000424      1  042500              GO TO SEQ-PASS-001.                                 OBSQ44.2 431
   000425         042600     MOVE "ERRORS IN READING SQ-FS1" TO RE-MARK.                  OBSQ44.2 152
   000426         042700 SEQ-FAIL-001.                                                    OBSQ44.2
   000427         042800     MOVE "RECORDS IN ERROR" TO COMPUTED-A.                       OBSQ44.2 157
   000428         042900     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       OBSQ44.2 88 176
   000429         043000     PERFORM FAIL.                                                OBSQ44.2 307
   000430         043100     GO TO SEQ-WRITE-001.                                         OBSQ44.2 435
   000431         043200 SEQ-PASS-001.                                                    OBSQ44.2
   000432         043300     PERFORM PASS.                                                OBSQ44.2 306
   000433         043400     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   OBSQ44.2 157
   000434         043500     MOVE RECORDS-COUNT TO CORRECT-18V0.                          OBSQ44.2 87 176
   000435         043600 SEQ-WRITE-001.                                                   OBSQ44.2
   000436         043700     MOVE "SEQ-TEST-001" TO PAR-NAME.                             OBSQ44.2 146
   000437         043800     MOVE "VERIFY FILE SQ-FS1" TO FEATURE.                        OBSQ44.2 142
   000438         043900     PERFORM PRINT-DETAIL.                                        OBSQ44.2 310
   000439         044000 SEQ-CLOSE-001.                                                   OBSQ44.2
   000440         044100     CLOSE SQ-FS1.                                                OBSQ44.2 68
   000441         044200 SEQ-INIT-002.                                                    OBSQ44.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000442         044300*             THIS TEST READS AND VALIDATES FILE SQ-FS3.          OBSQ44.2
   000443         044400     MOVE 0 TO RECORDS-COUNT, RECORDS-IN-ERROR.                   OBSQ44.2 87 88
   000444         044500     OPEN INPUT SQ-FS3.                                           OBSQ44.2 76
   000445         044600 SEQ-TEST-002.                                                    OBSQ44.2
   000446         044700     READ SQ-FS3 AT END GO TO SEQ-TEST-002-01.                    OBSQ44.2 76 464
   000447         044800     MOVE SQ-FS3R1-F-G-120 TO FILE-RECORD-INFO-P1-120 (1).        OBSQ44.2 80 105
   000448         044900     ADD 1 TO RECORDS-COUNT.                                      OBSQ44.2 87
   000449         045000     IF RECORDS-COUNT GREATER THAN 750                            OBSQ44.2 87
   000450      1  045100              MOVE "MORE THAN 750 RECORDS" TO RE-MARK             OBSQ44.2 152
   000451      1  045200              GO TO SEQ-FAIL-002.                                 OBSQ44.2 468
   000452         045300     IF RECORDS-COUNT NOT EQUAL TO XRECORD-NUMBER (1)             OBSQ44.2 87 113
   000453      1  045400              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000454      1  045500              GO TO SEQ-TEST-002.                                 OBSQ44.2 445
   000455         045600     IF XFILE-NAME (1) NOT EQUAL TO "SQ-FS3"                      OBSQ44.2 107
   000456      1  045700              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000457      1  045800              GO TO SEQ-TEST-002.                                 OBSQ44.2 445
   000458         045900     IF CHARS-OR-RECORDS (1) NOT EQUAL TO "CH"                    OBSQ44.2 123
   000459      1  046000              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000460      1  046100              GO TO SEQ-TEST-002.                                 OBSQ44.2 445
   000461         046200     IF XBLOCK-SIZE (1) NOT EQUAL TO 1200                         OBSQ44.2 125
   000462      1  046300              ADD 1 TO RECORDS-IN-ERROR.                          OBSQ44.2 88
   000463         046400     GO TO SEQ-TEST-002.                                          OBSQ44.2 445
   000464         046500 SEQ-TEST-002-01.                                                 OBSQ44.2
   000465         046600     IF RECORDS-IN-ERROR EQUAL TO ZERO                            OBSQ44.2 88 IMP
   000466      1  046700              GO TO SEQ-PASS-002.                                 OBSQ44.2 473
   000467         046800     MOVE "ERRORS IN READING SQ-FS3" TO RE-MARK.                  OBSQ44.2 152
   000468         046900 SEQ-FAIL-002.                                                    OBSQ44.2
   000469         047000     MOVE "RECORDS IN ERROR" TO COMPUTED-A.                       OBSQ44.2 157
   000470         047100     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       OBSQ44.2 88 176
   000471         047200     PERFORM FAIL.                                                OBSQ44.2 307
   000472         047300     GO TO SEQ-WRITE-002.                                         OBSQ44.2 477
   000473         047400 SEQ-PASS-002.                                                    OBSQ44.2
   000474         047500     PERFORM PASS.                                                OBSQ44.2 306
   000475         047600     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   OBSQ44.2 157
   000476         047700     MOVE RECORDS-COUNT TO CORRECT-18V0.                          OBSQ44.2 87 176
   000477         047800 SEQ-WRITE-002.                                                   OBSQ44.2
   000478         047900     MOVE "SEQ-TEST-002" TO PAR-NAME.                             OBSQ44.2 146
   000479         048000     MOVE "VERIFY FILE SQ-FS3" TO FEATURE.                        OBSQ44.2 142
   000480         048100     PERFORM PRINT-DETAIL.                                        OBSQ44.2 310
   000481         048200 SEQ-CLOSE-002.                                                   OBSQ44.2
   000482         048300     CLOSE SQ-FS3.                                                OBSQ44.2 76
   000483         048400 SEQ-INIT-003.                                                    OBSQ44.2
   000484         048500*             THIS TEST READS AND VALIDATES FILE SQ-FS2.          OBSQ44.2
   000485         048600     MOVE 0 TO RECORDS-COUNT, RECORDS-IN-ERROR.                   OBSQ44.2 87 88
   000486         048700     OPEN INPUT SQ-FS2.                                           OBSQ44.2 72
   000487         048800 SEQ-TEST-003.                                                    OBSQ44.2
   000488         048900     READ SQ-FS2 AT END GO TO SEQ-TEST-003-01.                    OBSQ44.2 72 506
   000489         049000     MOVE SQ-FS2R1-F-G-120 TO FILE-RECORD-INFO-P1-120 (1).        OBSQ44.2 75 105
   000490         049100     ADD 1 TO RECORDS-COUNT.                                      OBSQ44.2 87
   000491         049200     IF RECORDS-COUNT GREATER THAN 750                            OBSQ44.2 87
   000492      1  049300              MOVE "MORE THAN 750 RECORDS" TO RE-MARK             OBSQ44.2 152
   000493      1  049400              GO TO SEQ-FAIL-003.                                 OBSQ44.2 510
   000494         049500     IF RECORDS-COUNT NOT EQUAL TO XRECORD-NUMBER (1)             OBSQ44.2 87 113
   000495      1  049600              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000496      1  049700              GO TO SEQ-TEST-003.                                 OBSQ44.2 487
   000497         049800     IF XFILE-NAME (1) NOT EQUAL TO "SQ-FS2"                      OBSQ44.2 107
   000498      1  049900              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000499      1  050000              GO TO SEQ-TEST-003.                                 OBSQ44.2 487
   000500         050100     IF CHARS-OR-RECORDS (1) NOT EQUAL TO "RC"                    OBSQ44.2 123
   000501      1  050200              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000502      1  050300              GO TO SEQ-TEST-003.                                 OBSQ44.2 487
   000503         050400     IF XBLOCK-SIZE (1) NOT EQUAL TO 5                            OBSQ44.2 125
   000504      1  050500              ADD 1 TO RECORDS-IN-ERROR.                          OBSQ44.2 88
   000505         050600     GO TO SEQ-TEST-003.                                          OBSQ44.2 487
   000506         050700 SEQ-TEST-003-01.                                                 OBSQ44.2
   000507         050800     IF RECORDS-IN-ERROR EQUAL TO ZERO                            OBSQ44.2 88 IMP
   000508      1  050900              GO TO SEQ-PASS-003.                                 OBSQ44.2 515
   000509         051000     MOVE "ERRORS IN READING SQ-FS2" TO RE-MARK.                  OBSQ44.2 152
   000510         051100 SEQ-FAIL-003.                                                    OBSQ44.2
   000511         051200     MOVE "RECORDS IN ERROR" TO COMPUTED-A.                       OBSQ44.2 157
   000512         051300     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       OBSQ44.2 88 176
   000513         051400     PERFORM FAIL.                                                OBSQ44.2 307
   000514         051500     GO TO SEQ-WRITE-003.                                         OBSQ44.2 519
   000515         051600 SEQ-PASS-003.                                                    OBSQ44.2
   000516         051700     PERFORM PASS.                                                OBSQ44.2 306
   000517         051800     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   OBSQ44.2 157
   000518         051900     MOVE RECORDS-COUNT TO CORRECT-18V0.                          OBSQ44.2 87 176
   000519         052000 SEQ-WRITE-003.                                                   OBSQ44.2
   000520         052100     MOVE "SEQ-TEST-003" TO PAR-NAME.                             OBSQ44.2 146
   000521         052200     MOVE "VERIFY FILE SQ-FS2" TO FEATURE.                        OBSQ44.2 142
   000522         052300     PERFORM PRINT-DETAIL.                                        OBSQ44.2 310
   000523         052400 SEQ-CLOSE-003.                                                   OBSQ44.2
   000524         052500     CLOSE SQ-FS2.                                                OBSQ44.2 72
   000525         052600 SEQ-INIT-004.                                                    OBSQ44.2
   000526         052700*             THIS TEST READS AND VALIDATES FILE SQ-FS4.          OBSQ44.2
   000527         052800     MOVE 0 TO RECORDS-COUNT, RECORDS-IN-ERROR.                   OBSQ44.2 87 88
   000528         052900     OPEN INPUT SQ-FS4.                                           OBSQ44.2 81
   000529         053000 SEQ-TEST-004.                                                    OBSQ44.2
   000530         053100     READ SQ-FS4 AT END GO TO SEQ-TEST-004-01.                    OBSQ44.2 81 548
   000531         053200     MOVE SQ-FS4R1-F-G-120 TO FILE-RECORD-INFO-P1-120 (1).        OBSQ44.2 85 105
   000532         053300     ADD 1 TO RECORDS-COUNT.                                      OBSQ44.2 87
   000533         053400     IF RECORDS-COUNT GREATER THAN 750                            OBSQ44.2 87
   000534      1  053500              MOVE "MORE THAN 750 RECORDS" TO RE-MARK             OBSQ44.2 152
   000535      1  053600              GO TO SEQ-FAIL-004.                                 OBSQ44.2 552
   000536         053700     IF RECORDS-COUNT NOT EQUAL TO XRECORD-NUMBER (1)             OBSQ44.2 87 113
   000537      1  053800              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000538      1  053900              GO TO SEQ-TEST-004.                                 OBSQ44.2 529
   000539         054000     IF XFILE-NAME (1) NOT EQUAL TO "SQ-FS4"                      OBSQ44.2 107
   000540      1  054100              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000541      1  054200              GO TO SEQ-TEST-004.                                 OBSQ44.2 529
   000542         054300     IF CHARS-OR-RECORDS (1) NOT EQUAL TO "RC"                    OBSQ44.2 123
   000543      1  054400              ADD 1 TO RECORDS-IN-ERROR                           OBSQ44.2 88
   000544      1  054500              GO TO SEQ-TEST-004.                                 OBSQ44.2 529
   000545         054600     IF XBLOCK-SIZE (1) NOT EQUAL TO 10                           OBSQ44.2 125
   000546      1  054700              ADD 1 TO RECORDS-IN-ERROR.                          OBSQ44.2 88
   000547         054800     GO TO SEQ-TEST-004.                                          OBSQ44.2 529
   000548         054900 SEQ-TEST-004-01.                                                 OBSQ44.2
   000549         055000     IF RECORDS-IN-ERROR EQUAL TO ZERO                            OBSQ44.2 88 IMP
   000550      1  055100              GO TO SEQ-PASS-004.                                 OBSQ44.2 557
   000551         055200     MOVE "ERRORS IN READING SQ-FS4" TO RE-MARK.                  OBSQ44.2 152
   000552         055300 SEQ-FAIL-004.                                                    OBSQ44.2
   000553         055400     MOVE "RECORDS IN ERROR" TO COMPUTED-A.                       OBSQ44.2 157
   000554         055500     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       OBSQ44.2 88 176
   000555         055600     PERFORM FAIL.                                                OBSQ44.2 307
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000556         055700     GO TO SEQ-WRITE-004.                                         OBSQ44.2 561
   000557         055800 SEQ-PASS-004.                                                    OBSQ44.2
   000558         055900     PERFORM PASS.                                                OBSQ44.2 306
   000559         056000     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   OBSQ44.2 157
   000560         056100     MOVE RECORDS-COUNT TO CORRECT-18V0.                          OBSQ44.2 87 176
   000561         056200 SEQ-WRITE-004.                                                   OBSQ44.2
   000562         056300     MOVE "SEQ-TEST-004" TO PAR-NAME.                             OBSQ44.2 146
   000563         056400     MOVE "VERIFY FILE SQ-FS4" TO FEATURE.                        OBSQ44.2 142
   000564         056500     PERFORM PRINT-DETAIL.                                        OBSQ44.2 310
   000565         056600 SEQ-CLOSE-004.                                                   OBSQ44.2
   000566         056700     CLOSE SQ-FS4.                                                OBSQ44.2 81
   000567         056800 OBSQ4A-END-ROUTINE.                                              OBSQ44.2
   000568         056900     MOVE "END OF OBSQ4A VALIDATION TESTS" TO PRINT-REC.          OBSQ44.2 66
   000569         057000     WRITE PRINT-REC AFTER ADVANCING 1 LINE.                      OBSQ44.2 66
   000570         057100     GO TO CCVS-EXIT.                                             OBSQ44.2 571
   000571         057200 CCVS-EXIT SECTION.                                               OBSQ44.2
   000572         057300 CCVS-999999.                                                     OBSQ44.2
   000573         057400     GO TO CLOSE-FILES.                                           OBSQ44.2 287
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      136   ALTERNATE-KEY1
      138   ALTERNATE-KEY2
       64   C-ABORT. . . . . . . . . . . .  M268 M292
       58   C-ALL. . . . . . . . . . . . .  M294
       54   C-DATE . . . . . . . . . . . .  M270
       60   C-DELETED. . . . . . . . . . .  M296
       59   C-FAIL . . . . . . . . . . . .  M295
       63   C-INDENT
       61   C-INSPECT. . . . . . . . . . .  M297
       56   C-NO-OF-TESTS. . . . . . . . .  M269
       62   C-NOTE
       57   C-OK . . . . . . . . . . . . .  M293
       55   C-TIME . . . . . . . . . . . .  M271
      179   CCVS-C-1 . . . . . . . . . . .  327 369
      184   CCVS-C-2 . . . . . . . . . . .  328 370
      219   CCVS-E-1 . . . . . . . . . . .  333
      225   CCVS-E-2 . . . . . . . . . . .  342 349 356 361
      229   CCVS-E-2-2 . . . . . . . . . .  M341
      233   CCVS-E-3 . . . . . . . . . . .  362
      241   CCVS-E-4 . . . . . . . . . . .  341
      242   CCVS-E-4-1 . . . . . . . . . .  M339
      244   CCVS-E-4-2 . . . . . . . . . .  M340
      200   CCVS-H-1 . . . . . . . . . . .  323
      206   CCVS-H-2 . . . . . . . . . . .  324
      212   CCVS-H-3 . . . . . . . . . . .  325
      260   CCVS-PGM-ID. . . . . . . . . .  266 276 276 290
      123   CHARS-OR-RECORDS . . . . . . .  416 458 500 542
      162   CM-18V0
      157   COMPUTED-A . . . . . . . . . .  158 159 160 161 162 391 394 M427 M433 M469 M475 M511 M517 M553 M559
      158   COMPUTED-N
      156   COMPUTED-X . . . . . . . . . .  M318 381
      159   COMPUTED-0V18
      161   COMPUTED-14V4
      163   COMPUTED-18V0
      160   COMPUTED-4V14
      170   CORRECT-A. . . . . . . . . . .  171 172 173 174 175 392 394
      171   CORRECT-N
      169   CORRECT-X. . . . . . . . . . .  M319 382
      172   CORRECT-0V18
      174   CORRECT-14V4
      176   CORRECT-18V0 . . . . . . . . .  M428 M434 M470 M476 M512 M518 M554 M560
      173   CORRECT-4V14
      175   CR-18V0
      192   DELETE-CNT . . . . . . . . . .  296 M308 336 352 354
      149   DOTVALUE . . . . . . . . . . .  M313
      198   DUMMY-HOLD . . . . . . . . . .  M366 372
       67   DUMMY-RECORD . . . . . . . . .  M323 M324 M325 M327 M328 M329 M331 M333 M342 M349 M356 M361 M362 366 M367 368
                                            M369 M370 M371 M372 376 M377 M384 M395
      232   ENDER-DESC . . . . . . . . . .  M344 M355 M360
      193   ERROR-COUNTER. . . . . . . . .  295 M307 335 345 348
      197   ERROR-HOLD . . . . . . . . . .  294 M335 M336 M336 M337 340
      230   ERROR-TOTAL. . . . . . . . . .  M346 M348 M353 M354 M358 M359
      142   FEATURE. . . . . . . . . . . .  M437 M479 M521 M563
      104   FILE-RECORD-INFO . . . . . . .  M284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page    15
0 Defined   Cross-reference of data names   References

0     105   FILE-RECORD-INFO-P1-120. . . .  M405 M447 M489 M531
      132   FILE-RECORD-INFO-P121-240
       90   FILE-RECORD-INFO-SKELETON. . .  283
       89   FILE-RECORD-INFORMATION-REC
      254   HYPHEN-LINE. . . . . . . . . .  329 331 371
      222   ID-AGAIN . . . . . . . . . . .  M276
      249   INFO-TEXT. . . . . . . . . . .  M383
      194   INSPECT-COUNTER. . . . . . . .  297 M305 335 357 359
      117   ODO-NUMBER
      144   P-OR-F . . . . . . . . . . . .  M305 M306 M307 M308 315 M318
      146   PAR-NAME . . . . . . . . . . .  M320 M436 M478 M520 M562
      148   PARDOT-X . . . . . . . . . . .  M312
      195   PASS-COUNTER . . . . . . . . .  293 M306 337 339
       65   PRINT-FILE . . . . . . . . . .  32 275 288
       66   PRINT-REC. . . . . . . . . . .  M314 M387 M388 M568 569
       50   RAW-DATA . . . . . . . . . . .  27 265 267 274 289 291 300
       53   RAW-DATA-KEY . . . . . . . . .  31 M266 M290
       52   RAW-DATA-SATZ. . . . . . . . .  272 298
      152   RE-MARK. . . . . . . . . . . .  M309 M321 M408 M425 M450 M467 M492 M509 M534 M551
      191   REC-CT . . . . . . . . . . . .  311 313 320
      190   REC-SKL-SUB. . . . . . . . . .  M279 M282 284
      199   RECORD-COUNT . . . . . . . . .  M364 365 M373
       87   RECORDS-COUNT. . . . . . . . .  M401 M406 407 410 434 M443 M448 449 452 476 M485 M490 491 494 518 M527 M532 533
                                            536 560
       88   RECORDS-IN-ERROR . . . . . . .  M401 M411 M414 M417 M420 423 428 M443 M453 M456 M459 M462 465 470 M485 M495 M498
                                            M501 M504 507 512 M527 M537 M540 M543 M546 549 554
      127   RECORDS-IN-FILE
      111   REELUNIT-NUMBER
       68   SQ-FS1 . . . . . . . . . . . .  34 402 404 440
       71   SQ-FS1R1-F-G-120 . . . . . . .  405
       72   SQ-FS2 . . . . . . . . . . . .  36 486 488 524
       75   SQ-FS2R1-F-G-120 . . . . . . .  489
       76   SQ-FS3 . . . . . . . . . . . .  38 444 446 482
       80   SQ-FS3R1-F-G-120 . . . . . . .  447
       81   SQ-FS4 . . . . . . . . . . . .  40 528 530 566
       85   SQ-FS4R1-F-G-120 . . . . . . .  531
      153   TEST-COMPUTED. . . . . . . . .  387
      166   TEST-CORRECT . . . . . . . . .  388
      210   TEST-ID. . . . . . . . . . . .  M276
      140   TEST-RESULTS . . . . . . . . .  M277 314
      196   TOTAL-ERROR
      115   UPDATE-NUMBER
      125   XBLOCK-SIZE. . . . . . . . . .  419 461 503 545
      107   XFILE-NAME . . . . . . . . . .  413 455 497 539
      129   XFILE-ORGANIZATION
      131   XLABEL-TYPE
      119   XPROGRAM-NAME
      134   XRECORD-KEY
      121   XRECORD-LENGTH
      109   XRECORD-NAME
      113   XRECORD-NUMBER . . . . . . . .  410 452 494 536
      251   XXCOMPUTED . . . . . . . . . .  M394
      253   XXCORRECT. . . . . . . . . . .  M394
      247   XXINFO . . . . . . . . . . . .  384 395
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page    16
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

      390   BAIL-OUT . . . . . . . . . . .  P317
      396   BAIL-OUT-EX. . . . . . . . . .  E317 G392
      393   BAIL-OUT-WRITE . . . . . . . .  G391
      378   BLANK-LINE-PRINT
      571   CCVS-EXIT. . . . . . . . . . .  G570
      285   CCVS-INIT-EXIT
      281   CCVS-INIT-FILE . . . . . . . .  P280
      572   CCVS-999999
      263   CCVS1
      397   CCVS1-EXIT . . . . . . . . . .  G286
      287   CLOSE-FILES. . . . . . . . . .  G573
      326   COLUMN-NAMES-ROUTINE . . . . .  E278
      308   DE-LETE
      273   END-E-1. . . . . . . . . . . .  G267 G272
      299   END-E-2. . . . . . . . . . . .  G291 G298
      330   END-ROUTINE. . . . . . . . . .  P288
      334   END-ROUTINE-1
      343   END-ROUTINE-12
      351   END-ROUTINE-13 . . . . . . . .  E288
      332   END-RTN-EXIT
      307   FAIL . . . . . . . . . . . . .  P429 P471 P513 P555
      380   FAIL-ROUTINE . . . . . . . . .  P316
      389   FAIL-ROUTINE-EX. . . . . . . .  E316 G385
      386   FAIL-ROUTINE-WRITE . . . . . .  G381 G382
      322   HEAD-ROUTINE . . . . . . . . .  P278
      305   INSPT
      567   OBSQ4A-END-ROUTINE
      264   OPEN-FILES
      306   PASS . . . . . . . . . . . . .  P432 P474 P516 P558
      310   PRINT-DETAIL . . . . . . . . .  P438 P480 P522 P564
      399   SECT-OBSQ4A-0001
      439   SEQ-CLOSE-001
      481   SEQ-CLOSE-002
      523   SEQ-CLOSE-003
      565   SEQ-CLOSE-004
      426   SEQ-FAIL-001 . . . . . . . . .  G409
      468   SEQ-FAIL-002 . . . . . . . . .  G451
      510   SEQ-FAIL-003 . . . . . . . . .  G493
      552   SEQ-FAIL-004 . . . . . . . . .  G535
      400   SEQ-INIT-001
      441   SEQ-INIT-002
      483   SEQ-INIT-003
      525   SEQ-INIT-004
      431   SEQ-PASS-001 . . . . . . . . .  G424
      473   SEQ-PASS-002 . . . . . . . . .  G466
      515   SEQ-PASS-003 . . . . . . . . .  G508
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page    17
0 Defined   Cross-reference of procedures   References

0     557   SEQ-PASS-004 . . . . . . . . .  G550
      403   SEQ-TEST-001 . . . . . . . . .  G412 G415 G418 G421
      422   SEQ-TEST-001-01. . . . . . . .  G404
      445   SEQ-TEST-002 . . . . . . . . .  G454 G457 G460 G463
      464   SEQ-TEST-002-01. . . . . . . .  G446
      487   SEQ-TEST-003 . . . . . . . . .  G496 G499 G502 G505
      506   SEQ-TEST-003-01. . . . . . . .  G488
      529   SEQ-TEST-004 . . . . . . . . .  G538 G541 G544 G547
      548   SEQ-TEST-004-01. . . . . . . .  G530
      435   SEQ-WRITE-001. . . . . . . . .  G430
      477   SEQ-WRITE-002. . . . . . . . .  G472
      519   SEQ-WRITE-003. . . . . . . . .  G514
      561   SEQ-WRITE-004. . . . . . . . .  G556
      303   TERMINATE-CALL
      301   TERMINATE-CCVS
      363   WRITE-LINE . . . . . . . . . .  P314 P315 P323 P324 P325 P327 P328 P329 P331 P333 P342 P350 P356 P361 P362 P384
                                            P387 P388 P395
      375   WRT-LN . . . . . . . . . . . .  P369 P370 P371 P374 P379
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page    18
0 Defined   Cross-reference of programs     References

        3   OBSQ4A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ4A    Date 06/04/2022  Time 11:57:51   Page    19
0LineID  Message code  Message text

     65  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     68  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS1".

     72  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS2".

     76  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS3".

     81  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS4".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       5           5
-* Statistics for COBOL program OBSQ4A:
 *    Source records = 573
 *    Data Division statements = 99
 *    Procedure Division statements = 291
 *    Generated COBOL statements = 0
 *    Program complexity factor = 298
0End of compilation 1,  program OBSQ4A,  highest severity 0.
0Return code 0
