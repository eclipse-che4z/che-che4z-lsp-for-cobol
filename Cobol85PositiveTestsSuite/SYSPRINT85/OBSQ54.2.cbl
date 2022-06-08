1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:23   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:23   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         OBSQ54.2
   000002         000200 PROGRAM-ID.                                                      OBSQ54.2
   000003         000300     OBSQ5A.                                                      OBSQ54.2
   000004         000500*                                                              *  OBSQ54.2
   000005         000600*    VALIDATION FOR:-                                          *  OBSQ54.2
   000006         000700*    " HIGH       ".                                              OBSQ54.2
   000007         000800*    USING CCVS85 VERSION 1.0 ISSUED IN JANUARY 1986.          *  OBSQ54.2
   000008         000900*                                                              *  OBSQ54.2
   000009         001000*    CREATION DATE     /     VALIDATION DATE                   *  OBSQ54.2
   000010         001100*    "4.2 ".                                                      OBSQ54.2
   000011         001200*                                                              *  OBSQ54.2
   000012         001300*         THE ROUTINE OBSQ5A TESTS THE USE OF THE MULTIPLE FILE   OBSQ54.2
   000013         001400*    CLAUSE BY READING AND VALIDATING THE TWO MULTIPLE FILE TAPES OBSQ54.2
   000014         001500*    CREATED IN OBSQ3A. TAPE ONE IS PROCESSED USING THE MULTIPLE  OBSQ54.2
   000015         001600*    FILE CLAUSE WITH POSITION PHRASE.  ONLY FILE SQ-FS3 IS       OBSQ54.2
   000016         001700*    SPECIFIED AND PROCESSED FROM THIS TAPE.  TAPE TWO IS         OBSQ54.2
   000017         001800*    PROCESSED USING THE MULTIPLE FILE CLAUSE WITHOUT THE         OBSQ54.2
   000018         001900*    POSITION PHRASE.  ALL FOUR FILES ON THIS TAPE ARE PROCESSED. OBSQ54.2
   000019         002000*    THESE FILES WERE CREATED USING A MULTIPLE FILE CLAUSE WITH   OBSQ54.2
   000020         002100*    POSITION PHRASE.                                             OBSQ54.2
   000021         002200 ENVIRONMENT DIVISION.                                            OBSQ54.2
   000022         002300 CONFIGURATION SECTION.                                           OBSQ54.2
   000023         002400 SOURCE-COMPUTER.                                                 OBSQ54.2
   000024         002500     XXXXX082.                                                    OBSQ54.2
   000025         002600 OBJECT-COMPUTER.                                                 OBSQ54.2
   000026         002700     XXXXX083.                                                    OBSQ54.2
   000027         002800 INPUT-OUTPUT SECTION.                                            OBSQ54.2
   000028         002900 FILE-CONTROL.                                                    OBSQ54.2
   000029         003000     SELECT RAW-DATA   ASSIGN TO                                  OBSQ54.2 55
   000030         003100     XXXXX062                                                     OBSQ54.2
   000031         003200            ORGANIZATION IS INDEXED                               OBSQ54.2
   000032         003300            ACCESS MODE IS RANDOM                                 OBSQ54.2
   000033         003400            RECORD KEY IS RAW-DATA-KEY.                           OBSQ54.2 58
   000034         003500     SELECT PRINT-FILE ASSIGN TO                                  OBSQ54.2 70
   000035         003600     XXXXX055.                                                    OBSQ54.2
   000036         003700     SELECT SQ-FS3 ASSIGN TO                                      OBSQ54.2 73
   000037         003800     XXXXD009.                                                    OBSQ54.2
   000038         003900     SELECT SQ-FS5 ASSIGN TO                                      OBSQ54.2 78
   000039         004000     XXXXD005.                                                    OBSQ54.2
   000040         004100     SELECT SQ-FS6 ASSIGN TO                                      OBSQ54.2 82
   000041         004200     XXXXD011.                                                    OBSQ54.2
   000042         004300     SELECT SQ-FS7 ASSIGN TO                                      OBSQ54.2 86
   000043         004400     XXXXD012.                                                    OBSQ54.2
   000044         004500     SELECT SQ-FS8 ASSIGN TO                                      OBSQ54.2 90
   000045         004600     XXXXD013.                                                    OBSQ54.2
   000046         004700 I-O-CONTROL.                                                     OBSQ54.2
   000047         004800     MULTIPLE FILE TAPE CONTAINS SQ-FS3 POSITION 3;               OBSQ54.2
   000048         004900     MULTIPLE FILE TAPE SQ-FS5,                                   OBSQ54.2
   000049         005000                        SQ-FS6,                                   OBSQ54.2
   000050         005100                        SQ-FS7,                                   OBSQ54.2
   000051         005200                        SQ-FS8.                                   OBSQ54.2
   000052         005300 DATA DIVISION.                                                   OBSQ54.2
   000053         005400 FILE SECTION.                                                    OBSQ54.2
   000054         005500                                                                  OBSQ54.2
   000055         005600 FD  RAW-DATA.                                                    OBSQ54.2
   000056         005700                                                                  OBSQ54.2
   000057         005800 01  RAW-DATA-SATZ.                                               OBSQ54.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         005900     05  RAW-DATA-KEY        PIC X(6).                            OBSQ54.2
   000059         006000     05  C-DATE              PIC 9(6).                            OBSQ54.2
   000060         006100     05  C-TIME              PIC 9(8).                            OBSQ54.2
   000061         006200     05  C-NO-OF-TESTS       PIC 99.                              OBSQ54.2
   000062         006300     05  C-OK                PIC 999.                             OBSQ54.2
   000063         006400     05  C-ALL               PIC 999.                             OBSQ54.2
   000064         006500     05  C-FAIL              PIC 999.                             OBSQ54.2
   000065         006600     05  C-DELETED           PIC 999.                             OBSQ54.2
   000066         006700     05  C-INSPECT           PIC 999.                             OBSQ54.2
   000067         006800     05  C-NOTE              PIC X(13).                           OBSQ54.2
   000068         006900     05  C-INDENT            PIC X.                               OBSQ54.2
   000069         007000     05  C-ABORT             PIC X(8).                            OBSQ54.2
   000070         007100 FD  PRINT-FILE.                                                  OBSQ54.2

 ==000070==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000071         007200 01  PRINT-REC PICTURE X(120).                                    OBSQ54.2
   000072         007300 01  DUMMY-RECORD PICTURE X(120).                                 OBSQ54.2
   000073         007400 FD  SQ-FS3                                                       OBSQ54.2

 ==000073==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS3".

   000074         007500     LABEL RECORD IS STANDARD                                     OBSQ54.2
   000075         007600     RECORD CONTAINS 120 CHARACTERS                               OBSQ54.2
   000076         007700     BLOCK CONTAINS 1200 CHARACTERS.                              OBSQ54.2
   000077         007800 01  SQ-FS3R1-F-G-120   PIC X(120).                               OBSQ54.2
   000078         007900 FD  SQ-FS5                                                       OBSQ54.2

 ==000078==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS5".

   000079         008000     LABEL RECORD STANDARD                                        OBSQ54.2
   000080         008100     BLOCK CONTAINS 5 RECORDS.                                    OBSQ54.2
   000081         008200 01  SQ-FS5R1-F-G-120   PIC X(120).                               OBSQ54.2
   000082         008300 FD  SQ-FS6                                                       OBSQ54.2

 ==000082==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS6".

   000083         008400     LABEL RECORD STANDARD                                        OBSQ54.2
   000084         008500     BLOCK CONTAINS 10 RECORDS.                                   OBSQ54.2
   000085         008600 01  SQ-FS6R1-F-G-120   PIC X(120).                               OBSQ54.2
   000086         008700 FD  SQ-FS7                                                       OBSQ54.2

 ==000086==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS7".

   000087         008800     LABEL RECORD STANDARD                                        OBSQ54.2
   000088         008900     BLOCK CONTAINS 2400 CHARACTERS.                              OBSQ54.2
   000089         009000 01  SQ-FS7R1-F-G-120   PIC X(120).                               OBSQ54.2
   000090         009100 FD  SQ-FS8                                                       OBSQ54.2

 ==000090==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS8".

   000091         009200     LABEL RECORD STANDARD                                        OBSQ54.2
   000092         009300     RECORD 120                                                   OBSQ54.2
   000093         009400     BLOCK CONTAINS 120 CHARACTERS.                               OBSQ54.2
   000094         009500 01  SQ-FS8R1-F-G-120   PIC X(120).                               OBSQ54.2
   000095         009600 WORKING-STORAGE SECTION.                                         OBSQ54.2
   000096         009700 77  COUNT-OF-RECS  PICTURE 999 VALUE 0.                          OBSQ54.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000097         009800 77  RECORDS-IN-ERROR   PIC 999   VALUE 0.                        OBSQ54.2
   000098         009900 01  FILE-RECORD-INFORMATION-REC.                                 OBSQ54.2
   000099         010000     03 FILE-RECORD-INFO-SKELETON.                                OBSQ54.2
   000100         010100        05 FILLER                 PICTURE X(48)       VALUE       OBSQ54.2
   000101         010200             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  OBSQ54.2
   000102         010300        05 FILLER                 PICTURE X(46)       VALUE       OBSQ54.2
   000103         010400             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    OBSQ54.2
   000104         010500        05 FILLER                 PICTURE X(26)       VALUE       OBSQ54.2
   000105         010600             ",LFIL=000000,ORG=  ,LBLR= ".                        OBSQ54.2
   000106         010700        05 FILLER                 PICTURE X(37)       VALUE       OBSQ54.2
   000107         010800             ",RECKEY=                             ".             OBSQ54.2
   000108         010900        05 FILLER                 PICTURE X(38)       VALUE       OBSQ54.2
   000109         011000             ",ALTKEY1=                             ".            OBSQ54.2
   000110         011100        05 FILLER                 PICTURE X(38)       VALUE       OBSQ54.2
   000111         011200             ",ALTKEY2=                             ".            OBSQ54.2
   000112         011300        05 FILLER                 PICTURE X(7)        VALUE SPACE.OBSQ54.2 IMP
   000113         011400     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              OBSQ54.2
   000114         011500        05 FILE-RECORD-INFO-P1-120.                               OBSQ54.2
   000115         011600           07 FILLER              PIC X(5).                       OBSQ54.2
   000116         011700           07 XFILE-NAME           PIC X(6).                      OBSQ54.2
   000117         011800           07 FILLER              PIC X(8).                       OBSQ54.2
   000118         011900           07 XRECORD-NAME         PIC X(6).                      OBSQ54.2
   000119         012000           07 FILLER              PIC X(1).                       OBSQ54.2
   000120         012100           07 REELUNIT-NUMBER     PIC 9(1).                       OBSQ54.2
   000121         012200           07 FILLER              PIC X(7).                       OBSQ54.2
   000122         012300           07 XRECORD-NUMBER       PIC 9(6).                      OBSQ54.2
   000123         012400           07 FILLER              PIC X(6).                       OBSQ54.2
   000124         012500           07 UPDATE-NUMBER       PIC 9(2).                       OBSQ54.2
   000125         012600           07 FILLER              PIC X(5).                       OBSQ54.2
   000126         012700           07 ODO-NUMBER          PIC 9(4).                       OBSQ54.2
   000127         012800           07 FILLER              PIC X(5).                       OBSQ54.2
   000128         012900           07 XPROGRAM-NAME        PIC X(5).                      OBSQ54.2
   000129         013000           07 FILLER              PIC X(7).                       OBSQ54.2
   000130         013100           07 XRECORD-LENGTH       PIC 9(6).                      OBSQ54.2
   000131         013200           07 FILLER              PIC X(7).                       OBSQ54.2
   000132         013300           07 CHARS-OR-RECORDS    PIC X(2).                       OBSQ54.2
   000133         013400           07 FILLER              PIC X(1).                       OBSQ54.2
   000134         013500           07 XBLOCK-SIZE          PIC 9(4).                      OBSQ54.2
   000135         013600           07 FILLER              PIC X(6).                       OBSQ54.2
   000136         013700           07 RECORDS-IN-FILE     PIC 9(6).                       OBSQ54.2
   000137         013800           07 FILLER              PIC X(5).                       OBSQ54.2
   000138         013900           07 XFILE-ORGANIZATION   PIC X(2).                      OBSQ54.2
   000139         014000           07 FILLER              PIC X(6).                       OBSQ54.2
   000140         014100           07 XLABEL-TYPE          PIC X(1).                      OBSQ54.2
   000141         014200        05 FILE-RECORD-INFO-P121-240.                             OBSQ54.2
   000142         014300           07 FILLER              PIC X(8).                       OBSQ54.2
   000143         014400           07 XRECORD-KEY          PIC X(29).                     OBSQ54.2
   000144         014500           07 FILLER              PIC X(9).                       OBSQ54.2
   000145         014600           07 ALTERNATE-KEY1      PIC X(29).                      OBSQ54.2
   000146         014700           07 FILLER              PIC X(9).                       OBSQ54.2
   000147         014800           07 ALTERNATE-KEY2      PIC X(29).                      OBSQ54.2
   000148         014900           07 FILLER              PIC X(7).                       OBSQ54.2
   000149         015000 01  TEST-RESULTS.                                                OBSQ54.2
   000150         015100     02 FILLER                    PICTURE X VALUE SPACE.          OBSQ54.2 IMP
   000151         015200     02 FEATURE                   PICTURE X(20) VALUE SPACE.      OBSQ54.2 IMP
   000152         015300     02 FILLER                    PICTURE X VALUE SPACE.          OBSQ54.2 IMP
   000153         015400     02 P-OR-F                    PICTURE X(5) VALUE SPACE.       OBSQ54.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000154         015500     02 FILLER                    PICTURE X  VALUE SPACE.         OBSQ54.2 IMP
   000155         015600     02  PAR-NAME.                                                OBSQ54.2
   000156         015700       03 FILLER PICTURE X(12) VALUE SPACE.                       OBSQ54.2 IMP
   000157         015800       03  PARDOT-X PICTURE X  VALUE SPACE.                       OBSQ54.2 IMP
   000158         015900       03 DOTVALUE PICTURE 99  VALUE ZERO.                        OBSQ54.2 IMP
   000159         016000       03 FILLER PIC X(5) VALUE SPACE.                            OBSQ54.2 IMP
   000160         016100     02 FILLER PIC X(10) VALUE SPACE.                             OBSQ54.2 IMP
   000161         016200     02 RE-MARK PIC X(61).                                        OBSQ54.2
   000162         016300 01  TEST-COMPUTED.                                               OBSQ54.2
   000163         016400     02 FILLER PIC X(30) VALUE SPACE.                             OBSQ54.2 IMP
   000164         016500     02 FILLER PIC X(17) VALUE "       COMPUTED=".                OBSQ54.2
   000165         016600     02 COMPUTED-X.                                               OBSQ54.2
   000166         016700     03 COMPUTED-A                PICTURE X(20) VALUE SPACE.      OBSQ54.2 IMP
   000167         016800     03 COMPUTED-N REDEFINES COMPUTED-A PICTURE -9(9).9(9).       OBSQ54.2 166
   000168         016900     03 COMPUTED-0V18 REDEFINES COMPUTED-A  PICTURE -.9(18).      OBSQ54.2 166
   000169         017000     03 COMPUTED-4V14 REDEFINES COMPUTED-A  PICTURE -9(4).9(14).  OBSQ54.2 166
   000170         017100     03 COMPUTED-14V4 REDEFINES COMPUTED-A  PICTURE -9(14).9(4).  OBSQ54.2 166
   000171         017200     03       CM-18V0 REDEFINES COMPUTED-A.                       OBSQ54.2 166
   000172         017300         04 COMPUTED-18V0                   PICTURE -9(18).       OBSQ54.2
   000173         017400         04 FILLER                          PICTURE X.            OBSQ54.2
   000174         017500     03 FILLER PIC X(50) VALUE SPACE.                             OBSQ54.2 IMP
   000175         017600 01  TEST-CORRECT.                                                OBSQ54.2
   000176         017700     02 FILLER PIC X(30) VALUE SPACE.                             OBSQ54.2 IMP
   000177         017800     02 FILLER PIC X(17) VALUE "       CORRECT =".                OBSQ54.2
   000178         017900     02 CORRECT-X.                                                OBSQ54.2
   000179         018000     03 CORRECT-A                 PICTURE X(20) VALUE SPACE.      OBSQ54.2 IMP
   000180         018100     03 CORRECT-N REDEFINES CORRECT-A PICTURE -9(9).9(9).         OBSQ54.2 179
   000181         018200     03 CORRECT-0V18 REDEFINES CORRECT-A    PICTURE -.9(18).      OBSQ54.2 179
   000182         018300     03 CORRECT-4V14 REDEFINES CORRECT-A    PICTURE -9(4).9(14).  OBSQ54.2 179
   000183         018400     03 CORRECT-14V4 REDEFINES CORRECT-A    PICTURE -9(14).9(4).  OBSQ54.2 179
   000184         018500     03      CR-18V0 REDEFINES CORRECT-A.                         OBSQ54.2 179
   000185         018600         04 CORRECT-18V0                    PICTURE -9(18).       OBSQ54.2
   000186         018700         04 FILLER                          PICTURE X.            OBSQ54.2
   000187         018800     03 FILLER PIC X(50) VALUE SPACE.                             OBSQ54.2 IMP
   000188         018900 01  CCVS-C-1.                                                    OBSQ54.2
   000189         019000     02 FILLER PICTURE IS X(99) VALUE IS " FEATURE              PAOBSQ54.2
   000190         019100-    "SS  PARAGRAPH-NAME                                          OBSQ54.2
   000191         019200-    "        REMARKS".                                           OBSQ54.2
   000192         019300     02 FILLER PICTURE IS X(20) VALUE IS SPACE.                   OBSQ54.2 IMP
   000193         019400 01  CCVS-C-2.                                                    OBSQ54.2
   000194         019500     02 FILLER PICTURE IS X VALUE IS SPACE.                       OBSQ54.2 IMP
   000195         019600     02 FILLER PICTURE IS X(6) VALUE IS "TESTED".                 OBSQ54.2
   000196         019700     02 FILLER PICTURE IS X(15) VALUE IS SPACE.                   OBSQ54.2 IMP
   000197         019800     02 FILLER PICTURE IS X(4) VALUE IS "FAIL".                   OBSQ54.2
   000198         019900     02 FILLER PICTURE IS X(94) VALUE IS SPACE.                   OBSQ54.2 IMP
   000199         020000 01  REC-SKL-SUB PICTURE 9(2) VALUE ZERO.                         OBSQ54.2 IMP
   000200         020100 01  REC-CT PICTURE 99 VALUE ZERO.                                OBSQ54.2 IMP
   000201         020200 01  DELETE-CNT                   PICTURE 999  VALUE ZERO.        OBSQ54.2 IMP
   000202         020300 01  ERROR-COUNTER PICTURE IS 999 VALUE IS ZERO.                  OBSQ54.2 IMP
   000203         020400 01  INSPECT-COUNTER PIC 999 VALUE ZERO.                          OBSQ54.2 IMP
   000204         020500 01  PASS-COUNTER PIC 999 VALUE ZERO.                             OBSQ54.2 IMP
   000205         020600 01  TOTAL-ERROR PIC 999 VALUE ZERO.                              OBSQ54.2 IMP
   000206         020700 01  ERROR-HOLD PIC 999 VALUE ZERO.                               OBSQ54.2 IMP
   000207         020800 01  DUMMY-HOLD PIC X(120) VALUE SPACE.                           OBSQ54.2 IMP
   000208         020900 01  RECORD-COUNT PIC 9(5) VALUE ZERO.                            OBSQ54.2 IMP
   000209         021000 01  REC-COUNT    PIC 9(5) VALUE ZERO.                            OBSQ54.2 IMP
   000210         021100 01  CCVS-H-1.                                                    OBSQ54.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000211         021200     02  FILLER   PICTURE X(27)  VALUE SPACE.                     OBSQ54.2 IMP
   000212         021300     02 FILLER PICTURE X(67) VALUE                                OBSQ54.2
   000213         021400     " FEDERAL SOFTWARE TESTING CENTER COBOL COMPILER VALIDATION  OBSQ54.2
   000214         021500-    " SYSTEM".                                                   OBSQ54.2
   000215         021600     02  FILLER     PICTURE X(26)  VALUE SPACE.                   OBSQ54.2 IMP
   000216         021700 01  CCVS-H-2.                                                    OBSQ54.2
   000217         021800     02 FILLER PICTURE X(52) VALUE IS                             OBSQ54.2
   000218         021900     "CCVS85 FSTC COPY, NOT FOR DISTRIBUTION.".                   OBSQ54.2
   000219         022000     02 FILLER PICTURE IS X(19) VALUE IS "TEST RESULTS SET-  ".   OBSQ54.2
   000220         022100     02 TEST-ID PICTURE IS X(9).                                  OBSQ54.2
   000221         022200     02 FILLER PICTURE IS X(40) VALUE IS SPACE.                   OBSQ54.2 IMP
   000222         022300 01  CCVS-H-3.                                                    OBSQ54.2
   000223         022400     02  FILLER PICTURE X(34) VALUE                               OBSQ54.2
   000224         022500     " FOR OFFICIAL USE ONLY    ".                                OBSQ54.2
   000225         022600     02  FILLER PICTURE X(58) VALUE                               OBSQ54.2
   000226         022700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".OBSQ54.2
   000227         022800     02  FILLER PICTURE X(28) VALUE                               OBSQ54.2
   000228         022900     "  COPYRIGHT   1985 ".                                       OBSQ54.2
   000229         023000 01  CCVS-E-1.                                                    OBSQ54.2
   000230         023100     02 FILLER PICTURE IS X(52) VALUE IS SPACE.                   OBSQ54.2 IMP
   000231         023200     02 FILLER PICTURE IS X(14) VALUE IS "END OF TEST-  ".        OBSQ54.2
   000232         023300     02 ID-AGAIN PICTURE IS X(9).                                 OBSQ54.2
   000233         023400     02 FILLER PICTURE X(45) VALUE IS                             OBSQ54.2
   000234         023500     " NTIS DISTRIBUTION COBOL 85".                               OBSQ54.2
   000235         023600 01  CCVS-E-2.                                                    OBSQ54.2
   000236         023700     02  FILLER                   PICTURE X(31)  VALUE            OBSQ54.2
   000237         023800     SPACE.                                                       OBSQ54.2 IMP
   000238         023900     02  FILLER                   PICTURE X(21)  VALUE SPACE.     OBSQ54.2 IMP
   000239         024000     02 CCVS-E-2-2.                                               OBSQ54.2
   000240         024100         03 ERROR-TOTAL PICTURE IS XXX VALUE IS SPACE.            OBSQ54.2 IMP
   000241         024200         03 FILLER PICTURE IS X VALUE IS SPACE.                   OBSQ54.2 IMP
   000242         024300         03 ENDER-DESC PIC X(46) VALUE "ERRORS ENCOUNTERED".      OBSQ54.2
   000243         024400 01  CCVS-E-3.                                                    OBSQ54.2
   000244         024500     02  FILLER PICTURE X(22) VALUE                               OBSQ54.2
   000245         024600     " FOR OFFICIAL USE ONLY".                                    OBSQ54.2
   000246         024700     02  FILLER PICTURE X(12) VALUE SPACE.                        OBSQ54.2 IMP
   000247         024800     02  FILLER PICTURE X(58) VALUE                               OBSQ54.2
   000248         024900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBSQ54.2
   000249         025000     02  FILLER PICTURE X(13) VALUE SPACE.                        OBSQ54.2 IMP
   000250         025100     02 FILLER PIC X(15) VALUE " COPYRIGHT 1985".                 OBSQ54.2
   000251         025200 01  CCVS-E-4.                                                    OBSQ54.2
   000252         025300     02 CCVS-E-4-1 PIC XXX VALUE SPACE.                           OBSQ54.2 IMP
   000253         025400     02 FILLER PIC XXXX VALUE " OF ".                             OBSQ54.2
   000254         025500     02 CCVS-E-4-2 PIC XXX VALUE SPACE.                           OBSQ54.2 IMP
   000255         025600     02 FILLER PIC X(40) VALUE                                    OBSQ54.2
   000256         025700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       OBSQ54.2
   000257         025800 01  XXINFO.                                                      OBSQ54.2
   000258         025900     02 FILLER PIC X(30) VALUE "        *** INFORMATION  ***".    OBSQ54.2
   000259         026000     02 INFO-TEXT.                                                OBSQ54.2
   000260         026100     04 FILLER PIC X(20) VALUE SPACE.                             OBSQ54.2 IMP
   000261         026200     04 XXCOMPUTED PIC X(20).                                     OBSQ54.2
   000262         026300     04 FILLER PIC X(5) VALUE SPACE.                              OBSQ54.2 IMP
   000263         026400     04 XXCORRECT PIC X(20).                                      OBSQ54.2
   000264         026500 01  HYPHEN-LINE.                                                 OBSQ54.2
   000265         026600     02 FILLER PICTURE IS X VALUE IS SPACE.                       OBSQ54.2 IMP
   000266         026700     02 FILLER PICTURE IS X(65) VALUE IS "************************OBSQ54.2
   000267         026800-    "*****************************************".                 OBSQ54.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000268         026900     02 FILLER PICTURE IS X(54) VALUE IS "************************OBSQ54.2
   000269         027000-    "******************************".                            OBSQ54.2
   000270         027100 01  CCVS-PGM-ID PIC X(6) VALUE                                   OBSQ54.2
   000271         027200     "OBSQ5A".                                                    OBSQ54.2
   000272         027300 PROCEDURE DIVISION.                                              OBSQ54.2
   000273         027400 CCVS1 SECTION.                                                   OBSQ54.2
   000274         027500 OPEN-FILES.                                                      OBSQ54.2
   000275         027600     OPEN I-O RAW-DATA.                                           OBSQ54.2 55
   000276         027700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            OBSQ54.2 270 58
   000277         027800     READ RAW-DATA INVALID KEY GO TO END-E-1.                     OBSQ54.2 55 283
   000278         027900     MOVE "ABORTED " TO C-ABORT.                                  OBSQ54.2 69
   000279         028000     ADD 1 TO C-NO-OF-TESTS.                                      OBSQ54.2 61
   000280         028100     ACCEPT C-DATE  FROM DATE.                                    OBSQ54.2 59
   000281         028200     ACCEPT C-TIME  FROM TIME.                                    OBSQ54.2 60
   000282         028300     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             OBSQ54.2 57 283
   000283         028400 END-E-1.                                                         OBSQ54.2
   000284         028500     CLOSE RAW-DATA.                                              OBSQ54.2 55
   000285         028600     OPEN     OUTPUT PRINT-FILE.                                  OBSQ54.2 70
   000286         028700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   OBSQ54.2 270 220 270 232
   000287         028800     MOVE    SPACE TO TEST-RESULTS.                               OBSQ54.2 IMP 149
   000288         028900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             OBSQ54.2 332 336
   000289         029000     MOVE ZERO TO REC-SKL-SUB.                                    OBSQ54.2 IMP 199
   000290         029100     PERFORM CCVS-INIT-FILE 9 TIMES.                              OBSQ54.2 291
   000291         029200 CCVS-INIT-FILE.                                                  OBSQ54.2
   000292         029300     ADD 1 TO REC-SKL-SUB.                                        OBSQ54.2 199
   000293         029400     MOVE FILE-RECORD-INFO-SKELETON TO                            OBSQ54.2 99
   000294         029500                  FILE-RECORD-INFO (REC-SKL-SUB).                 OBSQ54.2 113 199
   000295         029600 CCVS-INIT-EXIT.                                                  OBSQ54.2
   000296         029700     GO TO CCVS1-EXIT.                                            OBSQ54.2 407
   000297         029800 CLOSE-FILES.                                                     OBSQ54.2
   000298         029900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   OBSQ54.2 340 361 70
   000299         030000     OPEN I-O RAW-DATA.                                           OBSQ54.2 55
   000300         030100     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            OBSQ54.2 270 58
   000301         030200     READ RAW-DATA INVALID KEY GO TO END-E-2.                     OBSQ54.2 55 309
   000302         030300     MOVE "OK.     " TO C-ABORT.                                  OBSQ54.2 69
   000303         030400     MOVE PASS-COUNTER TO C-OK.                                   OBSQ54.2 204 62
   000304         030500     MOVE ERROR-HOLD   TO C-ALL.                                  OBSQ54.2 206 63
   000305         030600     MOVE ERROR-COUNTER TO C-FAIL.                                OBSQ54.2 202 64
   000306         030700     MOVE DELETE-CNT TO C-DELETED.                                OBSQ54.2 201 65
   000307         030800     MOVE INSPECT-COUNTER TO C-INSPECT.                           OBSQ54.2 203 66
   000308         030900     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             OBSQ54.2 57 309
   000309         031000 END-E-2.                                                         OBSQ54.2
   000310         031100     CLOSE RAW-DATA.                                              OBSQ54.2 55
   000311         031200 TERMINATE-CCVS.                                                  OBSQ54.2
   000312         031300     EXIT PROGRAM.                                                OBSQ54.2
   000313         031400 TERMINATE-CALL.                                                  OBSQ54.2
   000314         031500     STOP     RUN.                                                OBSQ54.2
   000315         031600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         OBSQ54.2 153 203
   000316         031700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           OBSQ54.2 153 204
   000317         031800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          OBSQ54.2 153 202
   000318         031900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.          OBSQ54.2 153 201
   000319         032000     MOVE "****TEST DELETED****" TO RE-MARK.                      OBSQ54.2 161
   000320         032100 PRINT-DETAIL.                                                    OBSQ54.2
   000321         032200     IF REC-CT NOT EQUAL TO ZERO                                  OBSQ54.2 200 IMP
   000322      1  032300             MOVE "." TO PARDOT-X                                 OBSQ54.2 157
   000323      1  032400             MOVE REC-CT TO DOTVALUE.                             OBSQ54.2 200 158
   000324         032500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      OBSQ54.2 149 71 373
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000325         032600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               OBSQ54.2 153 373
   000326      1  032700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 OBSQ54.2 390 399
   000327      1  032800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 OBSQ54.2 400 406
   000328         032900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              OBSQ54.2 IMP 153 IMP 165
   000329         033000     MOVE SPACE TO CORRECT-X.                                     OBSQ54.2 IMP 178
   000330         033100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         OBSQ54.2 200 IMP IMP 155
   000331         033200     MOVE     SPACE TO RE-MARK.                                   OBSQ54.2 IMP 161
   000332         033300 HEAD-ROUTINE.                                                    OBSQ54.2
   000333         033400     MOVE CCVS-H-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBSQ54.2 210 72 373
   000334         033500     MOVE CCVS-H-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.   OBSQ54.2 216 72 373
   000335         033600     MOVE CCVS-H-3 TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.   OBSQ54.2 222 72 373
   000336         033700 COLUMN-NAMES-ROUTINE.                                            OBSQ54.2
   000337         033800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBSQ54.2 188 72 373
   000338         033900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBSQ54.2 193 72 373
   000339         034000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        OBSQ54.2 264 72 373
   000340         034100 END-ROUTINE.                                                     OBSQ54.2
   000341         034200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.OBSQ54.2 264 72 373
   000342         034300 END-RTN-EXIT.                                                    OBSQ54.2
   000343         034400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBSQ54.2 229 72 373
   000344         034500 END-ROUTINE-1.                                                   OBSQ54.2
   000345         034600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      OBSQ54.2 202 206 203
   000346         034700      ERROR-HOLD. ADD DELETE-CNT TO ERROR-HOLD.                   OBSQ54.2 206 201 206
   000347         034800      ADD PASS-COUNTER TO ERROR-HOLD.                             OBSQ54.2 204 206
   000348         034900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   OBSQ54.2
   000349         035000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            OBSQ54.2 204 252
   000350         035100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              OBSQ54.2 206 254
   000351         035200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                OBSQ54.2 251 239
   000352         035300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           OBSQ54.2 235 72 373
   000353         035400  END-ROUTINE-12.                                                 OBSQ54.2
   000354         035500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        OBSQ54.2 242
   000355         035600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      OBSQ54.2 202 IMP
   000356      1  035700         MOVE "NO " TO ERROR-TOTAL                                OBSQ54.2 240
   000357         035800         ELSE                                                     OBSQ54.2
   000358      1  035900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       OBSQ54.2 202 240
   000359         036000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           OBSQ54.2 235 72
   000360         036100     PERFORM WRITE-LINE.                                          OBSQ54.2 373
   000361         036200 END-ROUTINE-13.                                                  OBSQ54.2
   000362         036300     IF DELETE-CNT IS EQUAL TO ZERO                               OBSQ54.2 201 IMP
   000363      1  036400         MOVE "NO " TO ERROR-TOTAL  ELSE                          OBSQ54.2 240
   000364      1  036500         MOVE DELETE-CNT TO ERROR-TOTAL.                          OBSQ54.2 201 240
   000365         036600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   OBSQ54.2 242
   000366         036700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBSQ54.2 235 72 373
   000367         036800      IF   INSPECT-COUNTER EQUAL TO ZERO                          OBSQ54.2 203 IMP
   000368      1  036900          MOVE "NO " TO ERROR-TOTAL                               OBSQ54.2 240
   000369      1  037000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   OBSQ54.2 203 240
   000370         037100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            OBSQ54.2 242
   000371         037200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          OBSQ54.2 235 72 373
   000372         037300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBSQ54.2 243 72 373
   000373         037400 WRITE-LINE.                                                      OBSQ54.2
   000374         037500     ADD 1 TO RECORD-COUNT.                                       OBSQ54.2 208
   000375         037600     IF RECORD-COUNT GREATER 50                                   OBSQ54.2 208
   000376      1  037700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          OBSQ54.2 72 207
   000377      1  037800         MOVE SPACE TO DUMMY-RECORD                               OBSQ54.2 IMP 72
   000378      1  037900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  OBSQ54.2 72
   000379      1  038000         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             OBSQ54.2 188 72 385
   000380      1  038100         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     OBSQ54.2 193 72 385
   000381      1  038200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          OBSQ54.2 264 72 385
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000382      1  038300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          OBSQ54.2 207 72
   000383      1  038400         MOVE ZERO TO RECORD-COUNT.                               OBSQ54.2 IMP 208
   000384         038500     PERFORM WRT-LN.                                              OBSQ54.2 385
   000385         038600 WRT-LN.                                                          OBSQ54.2
   000386         038700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               OBSQ54.2 72
   000387         038800     MOVE SPACE TO DUMMY-RECORD.                                  OBSQ54.2 IMP 72
   000388         038900 BLANK-LINE-PRINT.                                                OBSQ54.2
   000389         039000     PERFORM WRT-LN.                                              OBSQ54.2 385
   000390         039100 FAIL-ROUTINE.                                                    OBSQ54.2
   000391         039200     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.   OBSQ54.2 165 IMP 396
   000392         039300     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.    OBSQ54.2 178 IMP 396
   000393         039400     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    OBSQ54.2 259
   000394         039500     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     OBSQ54.2 257 72 373
   000395         039600     GO TO FAIL-ROUTINE-EX.                                       OBSQ54.2 399
   000396         039700 FAIL-ROUTINE-WRITE.                                              OBSQ54.2
   000397         039800     MOVE TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE           OBSQ54.2 162 71 373
   000398         039900     MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES.   OBSQ54.2 175 71 373
   000399         040000 FAIL-ROUTINE-EX. EXIT.                                           OBSQ54.2
   000400         040100 BAIL-OUT.                                                        OBSQ54.2
   000401         040200     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.       OBSQ54.2 166 IMP 403
   000402         040300     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.               OBSQ54.2 179 IMP 406
   000403         040400 BAIL-OUT-WRITE.                                                  OBSQ54.2
   000404         040500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  OBSQ54.2 179 263 166 261
   000405         040600     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     OBSQ54.2 257 72 373
   000406         040700 BAIL-OUT-EX. EXIT.                                               OBSQ54.2
   000407         040800 CCVS1-EXIT.                                                      OBSQ54.2
   000408         040900     EXIT.                                                        OBSQ54.2
   000409         041000 SECT-OBSQ5A-0001 SECTION.                                        OBSQ54.2
   000410         041100 SEQ-INIT-001.                                                    OBSQ54.2
   000411         041200     MOVE 0 TO REC-COUNT,    RECORDS-IN-ERROR.                    OBSQ54.2 209 97
   000412         041300     OPEN INPUT SQ-FS3.                                           OBSQ54.2 73
   000413         041400 SEQ-TEST-001.                                                    OBSQ54.2
   000414         041500     READ SQ-FS3 AT END GO TO SEQ-TEST-001-01.                    OBSQ54.2 73 432
   000415         041600     MOVE SQ-FS3R1-F-G-120 TO FILE-RECORD-INFO-P1-120 (1).        OBSQ54.2 77 114
   000416         041700     ADD 1 TO REC-COUNT.                                          OBSQ54.2 209
   000417         041800     IF REC-COUNT    GREATER THAN 750                             OBSQ54.2 209
   000418      1  041900              MOVE "MORE THAN 750 RECORDS" TO RE-MARK             OBSQ54.2 161
   000419      1  042000              GO TO SEQ-FAIL-001.                                 OBSQ54.2 436
   000420         042100     IF REC-COUNT    NOT EQUAL TO XRECORD-NUMBER (1)              OBSQ54.2 209 122
   000421      1  042200              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000422      1  042300              GO TO SEQ-TEST-001.                                 OBSQ54.2 413
   000423         042400     IF XFILE-NAME (1) NOT EQUAL TO "SQ-FS3"                      OBSQ54.2 116
   000424      1  042500              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000425      1  042600              GO TO SEQ-TEST-001.                                 OBSQ54.2 413
   000426         042700     IF CHARS-OR-RECORDS (1) NOT EQUAL TO "CH"                    OBSQ54.2 132
   000427      1  042800              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000428      1  042900              GO TO SEQ-TEST-001.                                 OBSQ54.2 413
   000429         043000     IF XBLOCK-SIZE (1) NOT EQUAL TO 1200                         OBSQ54.2 134
   000430      1  043100              ADD 1 TO RECORDS-IN-ERROR.                          OBSQ54.2 97
   000431         043200     GO TO SEQ-TEST-001.                                          OBSQ54.2 413
   000432         043300 SEQ-TEST-001-01.                                                 OBSQ54.2
   000433         043400     IF RECORDS-IN-ERROR EQUAL TO ZERO                            OBSQ54.2 97 IMP
   000434      1  043500              GO TO SEQ-PASS-001.                                 OBSQ54.2 441
   000435         043600     MOVE "ERRORS IN READING SQ-FS3" TO RE-MARK.                  OBSQ54.2 161
   000436         043700 SEQ-FAIL-001.                                                    OBSQ54.2
   000437         043800     MOVE "RECORDS IN ERROR" TO COMPUTED-A.                       OBSQ54.2 166
   000438         043900     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       OBSQ54.2 97 185
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000439         044000     PERFORM FAIL.                                                OBSQ54.2 317
   000440         044100     GO TO SEQ-WRITE-001.                                         OBSQ54.2 445
   000441         044200 SEQ-PASS-001.                                                    OBSQ54.2
   000442         044300     PERFORM PASS.                                                OBSQ54.2 316
   000443         044400     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   OBSQ54.2 166
   000444         044500     MOVE REC-COUNT    TO CORRECT-18V0.                           OBSQ54.2 209 185
   000445         044600 SEQ-WRITE-001.                                                   OBSQ54.2
   000446         044700     MOVE "SEQ-TEST-001" TO PAR-NAME.                             OBSQ54.2 155
   000447         044800     MOVE "VERIFY FILE SQ-FS3" TO FEATURE.                        OBSQ54.2 151
   000448         044900     PERFORM PRINT-DETAIL.                                        OBSQ54.2 320
   000449         045000 SEQ-CLOSE-001.                                                   OBSQ54.2
   000450         045100     CLOSE SQ-FS3.                                                OBSQ54.2 73
   000451         045200 SEQ-INIT-002.                                                    OBSQ54.2
   000452         045300*             THIS TEST READS AND VALIDATES FILE SQ-FS5.          OBSQ54.2
   000453         045400     MOVE 0 TO REC-COUNT,    RECORDS-IN-ERROR.                    OBSQ54.2 209 97
   000454         045500     OPEN INPUT SQ-FS5.                                           OBSQ54.2 78
   000455         045600 SEQ-TEST-002.                                                    OBSQ54.2
   000456         045700     READ SQ-FS5 AT END GO TO SEQ-TEST-002-01.                    OBSQ54.2 78 474
   000457         045800     MOVE SQ-FS5R1-F-G-120 TO FILE-RECORD-INFO-P1-120 (1).        OBSQ54.2 81 114
   000458         045900     ADD 1 TO REC-COUNT.                                          OBSQ54.2 209
   000459         046000     IF REC-COUNT    GREATER THAN 750                             OBSQ54.2 209
   000460      1  046100              MOVE "MORE THAN 750 RECORDS" TO RE-MARK             OBSQ54.2 161
   000461      1  046200              GO TO SEQ-FAIL-002.                                 OBSQ54.2 478
   000462         046300     IF REC-COUNT    NOT EQUAL TO XRECORD-NUMBER (1)              OBSQ54.2 209 122
   000463      1  046400              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000464      1  046500              GO TO SEQ-TEST-002.                                 OBSQ54.2 455
   000465         046600     IF XFILE-NAME (1) NOT EQUAL TO "SQ-FS5"                      OBSQ54.2 116
   000466      1  046700              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000467      1  046800              GO TO SEQ-TEST-002.                                 OBSQ54.2 455
   000468         046900     IF CHARS-OR-RECORDS (1) NOT EQUAL TO "RC"                    OBSQ54.2 132
   000469      1  047000              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000470      1  047100              GO TO SEQ-TEST-002.                                 OBSQ54.2 455
   000471         047200     IF XBLOCK-SIZE (1) NOT EQUAL TO 5                            OBSQ54.2 134
   000472      1  047300              ADD 1 TO RECORDS-IN-ERROR.                          OBSQ54.2 97
   000473         047400     GO TO SEQ-TEST-002.                                          OBSQ54.2 455
   000474         047500 SEQ-TEST-002-01.                                                 OBSQ54.2
   000475         047600     IF RECORDS-IN-ERROR EQUAL TO ZERO                            OBSQ54.2 97 IMP
   000476      1  047700              GO TO SEQ-PASS-002.                                 OBSQ54.2 483
   000477         047800     MOVE "ERRORS IN READINGS SQ-FS5" TO RE-MARK.                 OBSQ54.2 161
   000478         047900 SEQ-FAIL-002.                                                    OBSQ54.2
   000479         048000     MOVE "RECORDS IN ERROR" TO COMPUTED-A.                       OBSQ54.2 166
   000480         048100     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       OBSQ54.2 97 185
   000481         048200     PERFORM FAIL.                                                OBSQ54.2 317
   000482         048300     GO TO SEQ-WRITE-002.                                         OBSQ54.2 487
   000483         048400 SEQ-PASS-002.                                                    OBSQ54.2
   000484         048500     PERFORM PASS.                                                OBSQ54.2 316
   000485         048600     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   OBSQ54.2 166
   000486         048700     MOVE REC-COUNT    TO CORRECT-18V0.                           OBSQ54.2 209 185
   000487         048800 SEQ-WRITE-002.                                                   OBSQ54.2
   000488         048900     MOVE "SEQ-TEST-002" TO PAR-NAME.                             OBSQ54.2 155
   000489         049000     MOVE "VERIFY FILE SQ-FS5" TO FEATURE                         OBSQ54.2 151
   000490         049100     PERFORM PRINT-DETAIL.                                        OBSQ54.2 320
   000491         049200 SEQ-CLOSE-002.                                                   OBSQ54.2
   000492         049300     CLOSE SQ-FS5 WITH NO REWIND.                                 OBSQ54.2 78
   000493         049400 SEQ-INIT-003.                                                    OBSQ54.2
   000494         049500*             THIS TEST READS AND VALIDATES FILE SQ-FS6.          OBSQ54.2
   000495         049600     MOVE 0 TO REC-COUNT,    RECORDS-IN-ERROR.                    OBSQ54.2 209 97
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000496         049700     OPEN INPUT SQ-FS6 WITH NO REWIND.                            OBSQ54.2 82
   000497         049800 SEQ-TEST-003.                                                    OBSQ54.2
   000498         049900     READ SQ-FS6 AT END GO TO SEQ-TEST-003-01.                    OBSQ54.2 82 516
   000499         050000     MOVE SQ-FS6R1-F-G-120 TO FILE-RECORD-INFO-P1-120 (1).        OBSQ54.2 85 114
   000500         050100     ADD 1 TO REC-COUNT.                                          OBSQ54.2 209
   000501         050200     IF REC-COUNT    GREATER THAN 750                             OBSQ54.2 209
   000502      1  050300              MOVE "MORE THAN 750 RECORDS" TO RE-MARK             OBSQ54.2 161
   000503      1  050400              GO TO SEQ-FAIL-003.                                 OBSQ54.2 520
   000504         050500     IF REC-COUNT    NOT EQUAL TO XRECORD-NUMBER (1)              OBSQ54.2 209 122
   000505      1  050600              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000506      1  050700              GO TO SEQ-TEST-003.                                 OBSQ54.2 497
   000507         050800     IF XFILE-NAME (1) NOT EQUAL TO "SQ-FS6"                      OBSQ54.2 116
   000508      1  050900              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000509      1  051000              GO TO SEQ-TEST-003.                                 OBSQ54.2 497
   000510         051100     IF CHARS-OR-RECORDS (1) NOT EQUAL TO "RC"                    OBSQ54.2 132
   000511      1  051200              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000512      1  051300              GO TO SEQ-TEST-003.                                 OBSQ54.2 497
   000513         051400     IF XBLOCK-SIZE (1) NOT EQUAL TO 10                           OBSQ54.2 134
   000514      1  051500              ADD 1 TO RECORDS-IN-ERROR.                          OBSQ54.2 97
   000515         051600     GO TO SEQ-TEST-003.                                          OBSQ54.2 497
   000516         051700 SEQ-TEST-003-01.                                                 OBSQ54.2
   000517         051800     IF RECORDS-IN-ERROR EQUAL TO ZERO                            OBSQ54.2 97 IMP
   000518      1  051900              GO TO SEQ-PASS-003.                                 OBSQ54.2 525
   000519         052000     MOVE "ERRORS IN READING SQ-FS6" TO RE-MARK.                  OBSQ54.2 161
   000520         052100 SEQ-FAIL-003.                                                    OBSQ54.2
   000521         052200     MOVE "RECORDS IN ERROR" TO COMPUTED-A.                       OBSQ54.2 166
   000522         052300     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       OBSQ54.2 97 185
   000523         052400     PERFORM FAIL.                                                OBSQ54.2 317
   000524         052500     GO TO SEQ-WRITE-003.                                         OBSQ54.2 529
   000525         052600 SEQ-PASS-003.                                                    OBSQ54.2
   000526         052700     PERFORM PASS.                                                OBSQ54.2 316
   000527         052800     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   OBSQ54.2 166
   000528         052900     MOVE REC-COUNT    TO CORRECT-18V0.                           OBSQ54.2 209 185
   000529         053000 SEQ-WRITE-003.                                                   OBSQ54.2
   000530         053100     MOVE "SEQ-TEST-003" TO PAR-NAME.                             OBSQ54.2 155
   000531         053200     MOVE "VERIFY FILE SQ-FS6" TO FEATURE.                        OBSQ54.2 151
   000532         053300     PERFORM PRINT-DETAIL.                                        OBSQ54.2 320
   000533         053400 SEQ-CLOSE-003.                                                   OBSQ54.2
   000534         053500     CLOSE SQ-FS6 WITH NO REWIND.                                 OBSQ54.2 82
   000535         053600 SEQ-INIT-004.                                                    OBSQ54.2
   000536         053700*             THIS TEST READS AND VALIDATES FILE SQ-FS7.          OBSQ54.2
   000537         053800     MOVE 0 TO REC-COUNT,    RECORDS-IN-ERROR.                    OBSQ54.2 209 97
   000538         053900     OPEN INPUT SQ-FS7 WITH NO REWIND.                            OBSQ54.2 86
   000539         054000 SEQ-TEST-004.                                                    OBSQ54.2
   000540         054100     READ SQ-FS7 AT END GO TO SEQ-TEST-004-01.                    OBSQ54.2 86 558
   000541         054200     MOVE SQ-FS7R1-F-G-120 TO FILE-RECORD-INFO-P1-120 (1).        OBSQ54.2 89 114
   000542         054300     ADD 1 TO REC-COUNT.                                          OBSQ54.2 209
   000543         054400     IF REC-COUNT    GREATER THAN 750                             OBSQ54.2 209
   000544      1  054500              MOVE "MORE THAN 750 RECORDS" TO RE-MARK             OBSQ54.2 161
   000545      1  054600              GO TO SEQ-FAIL-004.                                 OBSQ54.2 562
   000546         054700     IF REC-COUNT    NOT EQUAL TO XRECORD-NUMBER (1)              OBSQ54.2 209 122
   000547      1  054800              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000548      1  054900              GO TO SEQ-TEST-004.                                 OBSQ54.2 539
   000549         055000     IF XFILE-NAME (1) NOT EQUAL TO "SQ-FS7"                      OBSQ54.2 116
   000550      1  055100              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000551      1  055200              GO TO SEQ-TEST-004.                                 OBSQ54.2 539
   000552         055300     IF CHARS-OR-RECORDS (1) NOT EQUAL "CH"                       OBSQ54.2 132
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000553      1  055400              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000554      1  055500              GO TO SEQ-TEST-004.                                 OBSQ54.2 539
   000555         055600     IF XBLOCK-SIZE (1) NOT EQUAL TO 2400                         OBSQ54.2 134
   000556      1  055700              ADD 1 TO RECORDS-IN-ERROR.                          OBSQ54.2 97
   000557         055800     GO TO SEQ-TEST-004.                                          OBSQ54.2 539
   000558         055900 SEQ-TEST-004-01.                                                 OBSQ54.2
   000559         056000     IF RECORDS-IN-ERROR EQUAL TO ZERO                            OBSQ54.2 97 IMP
   000560      1  056100              GO TO SEQ-PASS-004.                                 OBSQ54.2 567
   000561         056200     MOVE "ERRORS IN READING SQ-FS7" TO RE-MARK.                  OBSQ54.2 161
   000562         056300 SEQ-FAIL-004.                                                    OBSQ54.2
   000563         056400     MOVE "RECORDS IN ERROR" TO COMPUTED-A.                       OBSQ54.2 166
   000564         056500     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       OBSQ54.2 97 185
   000565         056600     PERFORM FAIL.                                                OBSQ54.2 317
   000566         056700     GO TO SEQ-WRITE-004.                                         OBSQ54.2 571
   000567         056800 SEQ-PASS-004.                                                    OBSQ54.2
   000568         056900     PERFORM PASS.                                                OBSQ54.2 316
   000569         057000     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   OBSQ54.2 166
   000570         057100     MOVE REC-COUNT    TO CORRECT-18V0.                           OBSQ54.2 209 185
   000571         057200 SEQ-WRITE-004.                                                   OBSQ54.2
   000572         057300     MOVE "SEQ-TEST-004" TO PAR-NAME.                             OBSQ54.2 155
   000573         057400     MOVE "VERIFY FILE SQ-FS7" TO FEATURE.                        OBSQ54.2 151
   000574         057500     PERFORM PRINT-DETAIL.                                        OBSQ54.2 320
   000575         057600 SEQ-CLOSE-004.                                                   OBSQ54.2
   000576         057700     CLOSE SQ-FS7 WITH NO REWIND.                                 OBSQ54.2 86
   000577         057800 SEQ-INIT-005.                                                    OBSQ54.2
   000578         057900*             THIS TEST READS AND VALIDATES FILE SQ-FS8.          OBSQ54.2
   000579         058000     MOVE 0 TO REC-COUNT,    RECORDS-IN-ERROR.                    OBSQ54.2 209 97
   000580         058100     OPEN INPUT SQ-FS8 WITH NO REWIND.                            OBSQ54.2 90
   000581         058200 SEQ-TEST-005.                                                    OBSQ54.2
   000582         058300     READ SQ-FS8 AT END GO TO SEQ-TEST-005-01.                    OBSQ54.2 90 600
   000583         058400     MOVE SQ-FS8R1-F-G-120 TO FILE-RECORD-INFO-P1-120 (1).        OBSQ54.2 94 114
   000584         058500     ADD 1 TO REC-COUNT.                                          OBSQ54.2 209
   000585         058600     IF REC-COUNT    GREATER THAN 750                             OBSQ54.2 209
   000586      1  058700              MOVE "MORE THAN 750 RECORDS" TO RE-MARK             OBSQ54.2 161
   000587      1  058800              GO TO SEQ-FAIL-005.                                 OBSQ54.2 604
   000588         058900     IF REC-COUNT    NOT EQUAL TO XRECORD-NUMBER (1)              OBSQ54.2 209 122
   000589      1  059000              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000590      1  059100              GO TO SEQ-TEST-005.                                 OBSQ54.2 581
   000591         059200     IF XFILE-NAME (1) NOT EQUAL TO "SQ-FS8"                      OBSQ54.2 116
   000592      1  059300              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000593      1  059400              GO TO SEQ-TEST-005.                                 OBSQ54.2 581
   000594         059500     IF CHARS-OR-RECORDS (1) NOT EQUAL TO "CH"                    OBSQ54.2 132
   000595      1  059600              ADD 1 TO RECORDS-IN-ERROR                           OBSQ54.2 97
   000596      1  059700              GO TO SEQ-TEST-005.                                 OBSQ54.2 581
   000597         059800     IF XBLOCK-SIZE (1) NOT EQUAL TO 120                          OBSQ54.2 134
   000598      1  059900              ADD 1 TO RECORDS-IN-ERROR.                          OBSQ54.2 97
   000599         060000     GO TO SEQ-TEST-005.                                          OBSQ54.2 581
   000600         060100 SEQ-TEST-005-01.                                                 OBSQ54.2
   000601         060200     IF RECORDS-IN-ERROR EQUAL TO ZERO                            OBSQ54.2 97 IMP
   000602      1  060300              GO TO SEQ-PASS-005.                                 OBSQ54.2 609
   000603         060400     MOVE "ERRORS IN READING SQ-FS8" TO RE-MARK.                  OBSQ54.2 161
   000604         060500 SEQ-FAIL-005.                                                    OBSQ54.2
   000605         060600     MOVE "RECORDS IN ERROR" TO COMPUTED-A.                       OBSQ54.2 166
   000606         060700     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       OBSQ54.2 97 185
   000607         060800     PERFORM FAIL.                                                OBSQ54.2 317
   000608         060900     GO TO SEQ-WRITE-005.                                         OBSQ54.2 613
   000609         061000 SEQ-PASS-005.                                                    OBSQ54.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000610         061100     PERFORM PASS.                                                OBSQ54.2 316
   000611         061200     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   OBSQ54.2 166
   000612         061300     MOVE REC-COUNT    TO CORRECT-18V0.                           OBSQ54.2 209 185
   000613         061400 SEQ-WRITE-005.                                                   OBSQ54.2
   000614         061500     MOVE "SEQ-TEST-005" TO PAR-NAME.                             OBSQ54.2 155
   000615         061600     MOVE "VERIFY FILE SQ-FS8" TO FEATURE.                        OBSQ54.2 151
   000616         061700     PERFORM PRINT-DETAIL.                                        OBSQ54.2 320
   000617         061800 SEQ-CLOSE-005.                                                   OBSQ54.2
   000618         061900     CLOSE SQ-FS8.                                                OBSQ54.2 90
   000619         062000 OBSQ5A-END-ROUTINE.                                              OBSQ54.2
   000620         062100     MOVE "END OF OBSQ5A VALIDATION TESTS" TO PRINT-REC.          OBSQ54.2 71
   000621         062200     WRITE PRINT-REC AFTER ADVANCING 1 LINE.                      OBSQ54.2 71
   000622         062300     GO TO CCVS-EXIT.                                             OBSQ54.2 623
   000623         062400 CCVS-EXIT SECTION.                                               OBSQ54.2
   000624         062500 CCVS-999999.                                                     OBSQ54.2
   000625         062600     GO TO CLOSE-FILES.                                           OBSQ54.2 297
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      145   ALTERNATE-KEY1
      147   ALTERNATE-KEY2
       69   C-ABORT. . . . . . . . . . . .  M278 M302
       63   C-ALL. . . . . . . . . . . . .  M304
       59   C-DATE . . . . . . . . . . . .  M280
       65   C-DELETED. . . . . . . . . . .  M306
       64   C-FAIL . . . . . . . . . . . .  M305
       68   C-INDENT
       66   C-INSPECT. . . . . . . . . . .  M307
       61   C-NO-OF-TESTS. . . . . . . . .  M279
       67   C-NOTE
       62   C-OK . . . . . . . . . . . . .  M303
       60   C-TIME . . . . . . . . . . . .  M281
      188   CCVS-C-1 . . . . . . . . . . .  337 379
      193   CCVS-C-2 . . . . . . . . . . .  338 380
      229   CCVS-E-1 . . . . . . . . . . .  343
      235   CCVS-E-2 . . . . . . . . . . .  352 359 366 371
      239   CCVS-E-2-2 . . . . . . . . . .  M351
      243   CCVS-E-3 . . . . . . . . . . .  372
      251   CCVS-E-4 . . . . . . . . . . .  351
      252   CCVS-E-4-1 . . . . . . . . . .  M349
      254   CCVS-E-4-2 . . . . . . . . . .  M350
      210   CCVS-H-1 . . . . . . . . . . .  333
      216   CCVS-H-2 . . . . . . . . . . .  334
      222   CCVS-H-3 . . . . . . . . . . .  335
      270   CCVS-PGM-ID. . . . . . . . . .  276 286 286 300
      132   CHARS-OR-RECORDS . . . . . . .  426 468 510 552 594
      171   CM-18V0
      166   COMPUTED-A . . . . . . . . . .  167 168 169 170 171 401 404 M437 M443 M479 M485 M521 M527 M563 M569 M605 M611
      167   COMPUTED-N
      165   COMPUTED-X . . . . . . . . . .  M328 391
      168   COMPUTED-0V18
      170   COMPUTED-14V4
      172   COMPUTED-18V0
      169   COMPUTED-4V14
      179   CORRECT-A. . . . . . . . . . .  180 181 182 183 184 402 404
      180   CORRECT-N
      178   CORRECT-X. . . . . . . . . . .  M329 392
      181   CORRECT-0V18
      183   CORRECT-14V4
      185   CORRECT-18V0 . . . . . . . . .  M438 M444 M480 M486 M522 M528 M564 M570 M606 M612
      182   CORRECT-4V14
       96   COUNT-OF-RECS
      184   CR-18V0
      201   DELETE-CNT . . . . . . . . . .  306 M318 346 362 364
      158   DOTVALUE . . . . . . . . . . .  M323
      207   DUMMY-HOLD . . . . . . . . . .  M376 382
       72   DUMMY-RECORD . . . . . . . . .  M333 M334 M335 M337 M338 M339 M341 M343 M352 M359 M366 M371 M372 376 M377 378
                                            M379 M380 M381 M382 386 M387 M394 M405
      242   ENDER-DESC . . . . . . . . . .  M354 M365 M370
      202   ERROR-COUNTER. . . . . . . . .  305 M317 345 355 358
      206   ERROR-HOLD . . . . . . . . . .  304 M345 M346 M346 M347 350
      240   ERROR-TOTAL. . . . . . . . . .  M356 M358 M363 M364 M368 M369
      151   FEATURE. . . . . . . . . . . .  M447 M489 M531 M573 M615
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    16
0 Defined   Cross-reference of data names   References

0     113   FILE-RECORD-INFO . . . . . . .  M294
      114   FILE-RECORD-INFO-P1-120. . . .  M415 M457 M499 M541 M583
      141   FILE-RECORD-INFO-P121-240
       99   FILE-RECORD-INFO-SKELETON. . .  293
       98   FILE-RECORD-INFORMATION-REC
      264   HYPHEN-LINE. . . . . . . . . .  339 341 381
      232   ID-AGAIN . . . . . . . . . . .  M286
      259   INFO-TEXT. . . . . . . . . . .  M393
      203   INSPECT-COUNTER. . . . . . . .  307 M315 345 367 369
      126   ODO-NUMBER
      153   P-OR-F . . . . . . . . . . . .  M315 M316 M317 M318 325 M328
      155   PAR-NAME . . . . . . . . . . .  M330 M446 M488 M530 M572 M614
      157   PARDOT-X . . . . . . . . . . .  M322
      204   PASS-COUNTER . . . . . . . . .  303 M316 347 349
       70   PRINT-FILE . . . . . . . . . .  34 285 298
       71   PRINT-REC. . . . . . . . . . .  M324 M397 M398 M620 621
       55   RAW-DATA . . . . . . . . . . .  29 275 277 284 299 301 310
       58   RAW-DATA-KEY . . . . . . . . .  33 M276 M300
       57   RAW-DATA-SATZ. . . . . . . . .  282 308
      161   RE-MARK. . . . . . . . . . . .  M319 M331 M418 M435 M460 M477 M502 M519 M544 M561 M586 M603
      209   REC-COUNT. . . . . . . . . . .  M411 M416 417 420 444 M453 M458 459 462 486 M495 M500 501 504 528 M537 M542 543
                                            546 570 M579 M584 585 588 612
      200   REC-CT . . . . . . . . . . . .  321 323 330
      199   REC-SKL-SUB. . . . . . . . . .  M289 M292 294
      208   RECORD-COUNT . . . . . . . . .  M374 375 M383
       97   RECORDS-IN-ERROR . . . . . . .  M411 M421 M424 M427 M430 433 438 M453 M463 M466 M469 M472 475 480 M495 M505 M508
                                            M511 M514 517 522 M537 M547 M550 M553 M556 559 564 M579 M589 M592 M595 M598 601
                                            606
      136   RECORDS-IN-FILE
      120   REELUNIT-NUMBER
       73   SQ-FS3 . . . . . . . . . . . .  36 412 414 450
       77   SQ-FS3R1-F-G-120 . . . . . . .  415
       78   SQ-FS5 . . . . . . . . . . . .  38 454 456 492
       81   SQ-FS5R1-F-G-120 . . . . . . .  457
       82   SQ-FS6 . . . . . . . . . . . .  40 496 498 534
       85   SQ-FS6R1-F-G-120 . . . . . . .  499
       86   SQ-FS7 . . . . . . . . . . . .  42 538 540 576
       89   SQ-FS7R1-F-G-120 . . . . . . .  541
       90   SQ-FS8 . . . . . . . . . . . .  44 580 582 618
       94   SQ-FS8R1-F-G-120 . . . . . . .  583
      162   TEST-COMPUTED. . . . . . . . .  397
      175   TEST-CORRECT . . . . . . . . .  398
      220   TEST-ID. . . . . . . . . . . .  M286
      149   TEST-RESULTS . . . . . . . . .  M287 324
      205   TOTAL-ERROR
      124   UPDATE-NUMBER
      134   XBLOCK-SIZE. . . . . . . . . .  429 471 513 555 597
      116   XFILE-NAME . . . . . . . . . .  423 465 507 549 591
      138   XFILE-ORGANIZATION
      140   XLABEL-TYPE
      128   XPROGRAM-NAME
      143   XRECORD-KEY
      130   XRECORD-LENGTH
      118   XRECORD-NAME
      122   XRECORD-NUMBER . . . . . . . .  420 462 504 546 588
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    17
0 Defined   Cross-reference of data names   References

0     261   XXCOMPUTED . . . . . . . . . .  M404
      263   XXCORRECT. . . . . . . . . . .  M404
      257   XXINFO . . . . . . . . . . . .  394 405
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    18
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

      400   BAIL-OUT . . . . . . . . . . .  P327
      406   BAIL-OUT-EX. . . . . . . . . .  E327 G402
      403   BAIL-OUT-WRITE . . . . . . . .  G401
      388   BLANK-LINE-PRINT
      623   CCVS-EXIT. . . . . . . . . . .  G622
      295   CCVS-INIT-EXIT
      291   CCVS-INIT-FILE . . . . . . . .  P290
      624   CCVS-999999
      273   CCVS1
      407   CCVS1-EXIT . . . . . . . . . .  G296
      297   CLOSE-FILES. . . . . . . . . .  G625
      336   COLUMN-NAMES-ROUTINE . . . . .  E288
      318   DE-LETE
      283   END-E-1. . . . . . . . . . . .  G277 G282
      309   END-E-2. . . . . . . . . . . .  G301 G308
      340   END-ROUTINE. . . . . . . . . .  P298
      344   END-ROUTINE-1
      353   END-ROUTINE-12
      361   END-ROUTINE-13 . . . . . . . .  E298
      342   END-RTN-EXIT
      317   FAIL . . . . . . . . . . . . .  P439 P481 P523 P565 P607
      390   FAIL-ROUTINE . . . . . . . . .  P326
      399   FAIL-ROUTINE-EX. . . . . . . .  E326 G395
      396   FAIL-ROUTINE-WRITE . . . . . .  G391 G392
      332   HEAD-ROUTINE . . . . . . . . .  P288
      315   INSPT
      619   OBSQ5A-END-ROUTINE
      274   OPEN-FILES
      316   PASS . . . . . . . . . . . . .  P442 P484 P526 P568 P610
      320   PRINT-DETAIL . . . . . . . . .  P448 P490 P532 P574 P616
      409   SECT-OBSQ5A-0001
      449   SEQ-CLOSE-001
      491   SEQ-CLOSE-002
      533   SEQ-CLOSE-003
      575   SEQ-CLOSE-004
      617   SEQ-CLOSE-005
      436   SEQ-FAIL-001 . . . . . . . . .  G419
      478   SEQ-FAIL-002 . . . . . . . . .  G461
      520   SEQ-FAIL-003 . . . . . . . . .  G503
      562   SEQ-FAIL-004 . . . . . . . . .  G545
      604   SEQ-FAIL-005 . . . . . . . . .  G587
      410   SEQ-INIT-001
      451   SEQ-INIT-002
      493   SEQ-INIT-003
      535   SEQ-INIT-004
      577   SEQ-INIT-005
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    19
0 Defined   Cross-reference of procedures   References

0     441   SEQ-PASS-001 . . . . . . . . .  G434
      483   SEQ-PASS-002 . . . . . . . . .  G476
      525   SEQ-PASS-003 . . . . . . . . .  G518
      567   SEQ-PASS-004 . . . . . . . . .  G560
      609   SEQ-PASS-005 . . . . . . . . .  G602
      413   SEQ-TEST-001 . . . . . . . . .  G422 G425 G428 G431
      432   SEQ-TEST-001-01. . . . . . . .  G414
      455   SEQ-TEST-002 . . . . . . . . .  G464 G467 G470 G473
      474   SEQ-TEST-002-01. . . . . . . .  G456
      497   SEQ-TEST-003 . . . . . . . . .  G506 G509 G512 G515
      516   SEQ-TEST-003-01. . . . . . . .  G498
      539   SEQ-TEST-004 . . . . . . . . .  G548 G551 G554 G557
      558   SEQ-TEST-004-01. . . . . . . .  G540
      581   SEQ-TEST-005 . . . . . . . . .  G590 G593 G596 G599
      600   SEQ-TEST-005-01. . . . . . . .  G582
      445   SEQ-WRITE-001. . . . . . . . .  G440
      487   SEQ-WRITE-002. . . . . . . . .  G482
      529   SEQ-WRITE-003. . . . . . . . .  G524
      571   SEQ-WRITE-004. . . . . . . . .  G566
      613   SEQ-WRITE-005. . . . . . . . .  G608
      313   TERMINATE-CALL
      311   TERMINATE-CCVS
      373   WRITE-LINE . . . . . . . . . .  P324 P325 P333 P334 P335 P337 P338 P339 P341 P343 P352 P360 P366 P371 P372 P394
                                            P397 P398 P405
      385   WRT-LN . . . . . . . . . . . .  P379 P380 P381 P384 P389
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    20
0 Defined   Cross-reference of programs     References

        3   OBSQ5A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ5A    Date 06/04/2022  Time 11:59:23   Page    21
0LineID  Message code  Message text

     70  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     73  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS3".

     78  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS5".

     82  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS6".

     86  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS7".

     90  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS8".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       6           6
-* Statistics for COBOL program OBSQ5A:
 *    Source records = 625
 *    Data Division statements = 101
 *    Procedure Division statements = 326
 *    Generated COBOL statements = 0
 *    Program complexity factor = 333
0End of compilation 1,  program OBSQ5A,  highest severity 0.
0Return code 0
