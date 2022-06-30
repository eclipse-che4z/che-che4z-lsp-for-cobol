1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:28   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:28   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         OBSQ34.2
   000002         000200 PROGRAM-ID.                                                      OBSQ34.2
   000003         000300     OBSQ3A.                                                      OBSQ34.2
   000004         000500*                                                              *  OBSQ34.2
   000005         000600*    VALIDATION FOR:-                                          *  OBSQ34.2
   000006         000700*    " HIGH       ".                                              OBSQ34.2
   000007         000800*    USING CCVS85 VERSION 1.0 ISSUED IN JANUARY 1986.          *  OBSQ34.2
   000008         000900*                                                              *  OBSQ34.2
   000009         001000*    CREATION DATE     /     VALIDATION DATE                   *  OBSQ34.2
   000010         001100*    "4.2 ".                                                      OBSQ34.2
   000011         001200*                                                              *  OBSQ34.2
   000012         001300*    THIS ROUTINE TESTS THE USE OF MULTIPLE FILE CLAUSE           OBSQ34.2
   000013         001400*    OF THE I-O-CONTROL PARAGRAPH.  TWO TAPES ARE CREATED         OBSQ34.2
   000014         001500*    CONTAINING 4 FILES EACH.  TAPE ONE IS CREATED WITHOUT THE    OBSQ34.2
   000015         001600*    USE OF THE NO REWIND OPTION WITH THE OPEN AND CLOSE          OBSQ34.2
   000016         001700*   STATEMENTS. IT IS THEN PASSED ON TO OBSQ4A AND OBSQ5A WHERE ITOBSQ34.2
   000017         001800*    IS READ AND VALIDATED.  TAPE TWO IS CREATED USING THE        OBSQ34.2
   000018         001900*    POSITION PHRASE OF THE MULTIPLE FILE CLAUSE AND WITH THE USE OBSQ34.2
   000019         002000*    OF THE NO REWIND OPTION WITH THE OPEN AND CLOSE STATEMENT.   OBSQ34.2
   000020         002100*    TAPE TWO IS THEN PASSED ON TO OBSQ5A WHERE IT IS READ AND    OBSQ34.2
   000021         002200*    VALIDATED.                                                   OBSQ34.2
   000022         002300 ENVIRONMENT DIVISION.                                            OBSQ34.2
   000023         002400 CONFIGURATION SECTION.                                           OBSQ34.2
   000024         002500 SOURCE-COMPUTER.                                                 OBSQ34.2
   000025         002600     XXXXX082.                                                    OBSQ34.2
   000026         002700 OBJECT-COMPUTER.                                                 OBSQ34.2
   000027         002800     XXXXX083.                                                    OBSQ34.2
   000028         002900 INPUT-OUTPUT SECTION.                                            OBSQ34.2
   000029         003000 FILE-CONTROL.                                                    OBSQ34.2
   000030         003100     SELECT RAW-DATA   ASSIGN TO                                  OBSQ34.2 73
   000031         003200     XXXXX062                                                     OBSQ34.2
   000032         003300            ORGANIZATION IS INDEXED                               OBSQ34.2
   000033         003400            ACCESS MODE IS RANDOM                                 OBSQ34.2
   000034         003500            RECORD KEY IS RAW-DATA-KEY.                           OBSQ34.2 76
   000035         003600     SELECT PRINT-FILE ASSIGN TO                                  OBSQ34.2 88
   000036         003700     XXXXX055.                                                    OBSQ34.2
   000037         003800     SELECT SQ-FS1 ASSIGN TO                                      OBSQ34.2 91
   000038         003900     XXXXP004                                                     OBSQ34.2
   000039         004000     ORGANIZATION IS SEQUENTIAL.                                  OBSQ34.2
   000040         004100     SELECT SQ-FS2 ASSIGN TO                                      OBSQ34.2 95
   000041         004200     XXXXP008                                                     OBSQ34.2
   000042         004300     ACCESS MODE IS SEQUENTIAL.                                   OBSQ34.2
   000043         004400     SELECT SQ-FS3 ASSIGN                                         OBSQ34.2 99
   000044         004500     XXXXP009                                                     OBSQ34.2
   000045         004600     ORGANIZATION IS SEQUENTIAL.                                  OBSQ34.2
   000046         004700     SELECT SQ-FS4 ASSIGN                                         OBSQ34.2 104
   000047         004800     XXXXP010                                                     OBSQ34.2
   000048         004900     ACCESS MODE SEQUENTIAL.                                      OBSQ34.2
   000049         005000     SELECT SQ-FS5 ASSIGN                                         OBSQ34.2 109
   000050         005100     XXXXP005.                                                    OBSQ34.2
   000051         005200     SELECT SQ-FS6 ASSIGN                                         OBSQ34.2 113
   000052         005300     XXXXP011                                                     OBSQ34.2
   000053         005400     ORGANIZATION IS SEQUENTIAL.                                  OBSQ34.2
   000054         005500     SELECT SQ-FS7 ASSIGN TO                                      OBSQ34.2 117
   000055         005600     XXXXP012                                                     OBSQ34.2
   000056         005700     ORGANIZATION IS SEQUENTIAL                                   OBSQ34.2
   000057         005800     ACCESS MODE IS SEQUENTIAL.                                   OBSQ34.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         005900     SELECT SQ-FS8 ASSIGN TO                                      OBSQ34.2 121
   000059         006000     XXXXP013                                                     OBSQ34.2
   000060         006100     ACCESS MODE IS SEQUENTIAL.                                   OBSQ34.2
   000061         006200 I-O-CONTROL.                                                     OBSQ34.2
   000062         006300     MULTIPLE FILE TAPE CONTAINS SQ-FS1,                          OBSQ34.2
   000063         006400                                 SQ-FS2,                          OBSQ34.2
   000064         006500                                 SQ-FS3,                          OBSQ34.2
   000065         006600                                 SQ-FS4;                          OBSQ34.2
   000066         006700     MULTIPLE FILE TAPE SQ-FS8 POSITION 4,                        OBSQ34.2
   000067         006800                        SQ-FS7 POSITION 3,                        OBSQ34.2
   000068         006900                        SQ-FS6 POSITION 2,                        OBSQ34.2
   000069         007000                        SQ-FS5 POSITION 1.                        OBSQ34.2
   000070         007100 DATA DIVISION.                                                   OBSQ34.2
   000071         007200 FILE SECTION.                                                    OBSQ34.2
   000072         007300                                                                  OBSQ34.2
   000073         007400 FD  RAW-DATA.                                                    OBSQ34.2
   000074         007500                                                                  OBSQ34.2
   000075         007600 01  RAW-DATA-SATZ.                                               OBSQ34.2
   000076         007700     05  RAW-DATA-KEY        PIC X(6).                            OBSQ34.2
   000077         007800     05  C-DATE              PIC 9(6).                            OBSQ34.2
   000078         007900     05  C-TIME              PIC 9(8).                            OBSQ34.2
   000079         008000     05  C-NO-OF-TESTS       PIC 99.                              OBSQ34.2
   000080         008100     05  C-OK                PIC 999.                             OBSQ34.2
   000081         008200     05  C-ALL               PIC 999.                             OBSQ34.2
   000082         008300     05  C-FAIL              PIC 999.                             OBSQ34.2
   000083         008400     05  C-DELETED           PIC 999.                             OBSQ34.2
   000084         008500     05  C-INSPECT           PIC 999.                             OBSQ34.2
   000085         008600     05  C-NOTE              PIC X(13).                           OBSQ34.2
   000086         008700     05  C-INDENT            PIC X.                               OBSQ34.2
   000087         008800     05  C-ABORT             PIC X(8).                            OBSQ34.2
   000088         008900 FD  PRINT-FILE.                                                  OBSQ34.2

 ==000088==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000089         009000 01  PRINT-REC PICTURE X(120).                                    OBSQ34.2
   000090         009100 01  DUMMY-RECORD PICTURE X(120).                                 OBSQ34.2
   000091         009200 FD  SQ-FS1                                                       OBSQ34.2

 ==000091==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS1".

   000092         009300     LABEL RECORD IS STANDARD                                     OBSQ34.2
   000093         009400          .                                                       OBSQ34.2
   000094         009500 01  SQ-FS1R1-F-G-120   PIC X(120).                               OBSQ34.2
   000095         009600 FD  SQ-FS2                                                       OBSQ34.2

 ==000095==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS2".

   000096         009700     LABEL RECORD STANDARD                                        OBSQ34.2
   000097         009800     BLOCK CONTAINS 5 RECORDS.                                    OBSQ34.2
   000098         009900 01  SQ-FS2R1-F-G-120   PIC X(120).                               OBSQ34.2
   000099         010000 FD  SQ-FS3                                                       OBSQ34.2

 ==000099==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS3".

   000100         010100     LABEL RECORD STANDARD                                        OBSQ34.2
   000101         010200     BLOCK CONTAINS 1200 CHARACTERS                               OBSQ34.2
   000102         010300     RECORD CONTAINS 120 CHARACTERS.                              OBSQ34.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000103         010400 01  SQ-FS3R1-F-G-120   PIC X(120).                               OBSQ34.2
   000104         010500 FD  SQ-FS4                                                       OBSQ34.2

 ==000104==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS4".

   000105         010600     LABEL RECORDS STANDARD                                       OBSQ34.2
   000106         010700     BLOCK 10 RECORDS                                             OBSQ34.2
   000107         010800     RECORD 120 CHARACTERS.                                       OBSQ34.2
   000108         010900 01  SQ-FS4R1-F-G-120   PIC X(120).                               OBSQ34.2
   000109         011000 FD  SQ-FS5                                                       OBSQ34.2

 ==000109==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS5".

   000110         011100     LABEL RECORDS ARE STANDARD                                   OBSQ34.2
   000111         011200     BLOCK CONTAINS 5 RECORDS.                                    OBSQ34.2
   000112         011300 01  SQ-FS5R1-F-G-120   PIC X(120).                               OBSQ34.2
   000113         011400 FD  SQ-FS6                                                       OBSQ34.2

 ==000113==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS6".

   000114         011500     LABEL RECORD IS STANDARD                                     OBSQ34.2
   000115         011600     BLOCK CONTAINS 10 RECORDS.                                   OBSQ34.2
   000116         011700 01  SQ-FS6R1-F-G-120   PIC X(120).                               OBSQ34.2
   000117         011800 FD  SQ-FS7                                                       OBSQ34.2

 ==000117==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS7".

   000118         011900     LABEL RECORD STANDARD                                        OBSQ34.2
   000119         012000     BLOCK CONTAINS 2400 CHARACTERS.                              OBSQ34.2
   000120         012100 01  SQ-FS7R1-F-G-120   PIC X(120).                               OBSQ34.2
   000121         012200 FD  SQ-FS8                                                       OBSQ34.2

 ==000121==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS8".

   000122         012300     LABEL RECORDS ARE STANDARD                                   OBSQ34.2
   000123         012400     BLOCK 120 CHARACTERS                                         OBSQ34.2
   000124         012500     RECORD 120.                                                  OBSQ34.2
   000125         012600 01  SQ-FS8R1-F-G-120   PIC X(120).                               OBSQ34.2
   000126         012700 WORKING-STORAGE SECTION.                                         OBSQ34.2
   000127         012800 01  COUNT-OF-RECS PIC 9999.                                      OBSQ34.2
   000128         012900 01  FILE-RECORD-INFORMATION-REC.                                 OBSQ34.2
   000129         013000     03 FILE-RECORD-INFO-SKELETON.                                OBSQ34.2
   000130         013100        05 FILLER                 PICTURE X(48)       VALUE       OBSQ34.2
   000131         013200             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  OBSQ34.2
   000132         013300        05 FILLER                 PICTURE X(46)       VALUE       OBSQ34.2
   000133         013400             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    OBSQ34.2
   000134         013500        05 FILLER                 PICTURE X(26)       VALUE       OBSQ34.2
   000135         013600             ",LFIL=000000,ORG=  ,LBLR= ".                        OBSQ34.2
   000136         013700        05 FILLER                 PICTURE X(37)       VALUE       OBSQ34.2
   000137         013800             ",RECKEY=                             ".             OBSQ34.2
   000138         013900        05 FILLER                 PICTURE X(38)       VALUE       OBSQ34.2
   000139         014000             ",ALTKEY1=                             ".            OBSQ34.2
   000140         014100        05 FILLER                 PICTURE X(38)       VALUE       OBSQ34.2
   000141         014200             ",ALTKEY2=                             ".            OBSQ34.2
   000142         014300        05 FILLER                 PICTURE X(7)        VALUE SPACE.OBSQ34.2 IMP
   000143         014400     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              OBSQ34.2
   000144         014500        05 FILE-RECORD-INFO-P1-120.                               OBSQ34.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000145         014600           07 FILLER              PIC X(5).                       OBSQ34.2
   000146         014700           07 XFILE-NAME           PIC X(6).                      OBSQ34.2
   000147         014800           07 FILLER              PIC X(8).                       OBSQ34.2
   000148         014900           07 XRECORD-NAME         PIC X(6).                      OBSQ34.2
   000149         015000           07 FILLER              PIC X(1).                       OBSQ34.2
   000150         015100           07 REELUNIT-NUMBER     PIC 9(1).                       OBSQ34.2
   000151         015200           07 FILLER              PIC X(7).                       OBSQ34.2
   000152         015300           07 XRECORD-NUMBER       PIC 9(6).                      OBSQ34.2
   000153         015400           07 FILLER              PIC X(6).                       OBSQ34.2
   000154         015500           07 UPDATE-NUMBER       PIC 9(2).                       OBSQ34.2
   000155         015600           07 FILLER              PIC X(5).                       OBSQ34.2
   000156         015700           07 ODO-NUMBER          PIC 9(4).                       OBSQ34.2
   000157         015800           07 FILLER              PIC X(5).                       OBSQ34.2
   000158         015900           07 XPROGRAM-NAME        PIC X(5).                      OBSQ34.2
   000159         016000           07 FILLER              PIC X(7).                       OBSQ34.2
   000160         016100           07 XRECORD-LENGTH       PIC 9(6).                      OBSQ34.2
   000161         016200           07 FILLER              PIC X(7).                       OBSQ34.2
   000162         016300           07 CHARS-OR-RECORDS    PIC X(2).                       OBSQ34.2
   000163         016400           07 FILLER              PIC X(1).                       OBSQ34.2
   000164         016500           07 XBLOCK-SIZE          PIC 9(4).                      OBSQ34.2
   000165         016600           07 FILLER              PIC X(6).                       OBSQ34.2
   000166         016700           07 RECORDS-IN-FILE     PIC 9(6).                       OBSQ34.2
   000167         016800           07 FILLER              PIC X(5).                       OBSQ34.2
   000168         016900           07 XFILE-ORGANIZATION   PIC X(2).                      OBSQ34.2
   000169         017000           07 FILLER              PIC X(6).                       OBSQ34.2
   000170         017100           07 XLABEL-TYPE          PIC X(1).                      OBSQ34.2
   000171         017200        05 FILE-RECORD-INFO-P121-240.                             OBSQ34.2
   000172         017300           07 FILLER              PIC X(8).                       OBSQ34.2
   000173         017400           07 XRECORD-KEY          PIC X(29).                     OBSQ34.2
   000174         017500           07 FILLER              PIC X(9).                       OBSQ34.2
   000175         017600           07 ALTERNATE-KEY1      PIC X(29).                      OBSQ34.2
   000176         017700           07 FILLER              PIC X(9).                       OBSQ34.2
   000177         017800           07 ALTERNATE-KEY2      PIC X(29).                      OBSQ34.2
   000178         017900           07 FILLER              PIC X(7).                       OBSQ34.2
   000179         018000 01  TEST-RESULTS.                                                OBSQ34.2
   000180         018100     02 FILLER                    PICTURE X VALUE SPACE.          OBSQ34.2 IMP
   000181         018200     02 FEATURE                   PICTURE X(20) VALUE SPACE.      OBSQ34.2 IMP
   000182         018300     02 FILLER                    PICTURE X VALUE SPACE.          OBSQ34.2 IMP
   000183         018400     02 P-OR-F                    PICTURE X(5) VALUE SPACE.       OBSQ34.2 IMP
   000184         018500     02 FILLER                    PICTURE X  VALUE SPACE.         OBSQ34.2 IMP
   000185         018600     02  PAR-NAME.                                                OBSQ34.2
   000186         018700       03 FILLER PICTURE X(12) VALUE SPACE.                       OBSQ34.2 IMP
   000187         018800       03  PARDOT-X PICTURE X  VALUE SPACE.                       OBSQ34.2 IMP
   000188         018900       03 DOTVALUE PICTURE 99  VALUE ZERO.                        OBSQ34.2 IMP
   000189         019000       03 FILLER PIC X(5) VALUE SPACE.                            OBSQ34.2 IMP
   000190         019100     02 FILLER PIC X(10) VALUE SPACE.                             OBSQ34.2 IMP
   000191         019200     02 RE-MARK PIC X(61).                                        OBSQ34.2
   000192         019300 01  TEST-COMPUTED.                                               OBSQ34.2
   000193         019400     02 FILLER PIC X(30) VALUE SPACE.                             OBSQ34.2 IMP
   000194         019500     02 FILLER PIC X(17) VALUE "       COMPUTED=".                OBSQ34.2
   000195         019600     02 COMPUTED-X.                                               OBSQ34.2
   000196         019700     03 COMPUTED-A                PICTURE X(20) VALUE SPACE.      OBSQ34.2 IMP
   000197         019800     03 COMPUTED-N REDEFINES COMPUTED-A PICTURE -9(9).9(9).       OBSQ34.2 196
   000198         019900     03 COMPUTED-0V18 REDEFINES COMPUTED-A  PICTURE -.9(18).      OBSQ34.2 196
   000199         020000     03 COMPUTED-4V14 REDEFINES COMPUTED-A  PICTURE -9(4).9(14).  OBSQ34.2 196
   000200         020100     03 COMPUTED-14V4 REDEFINES COMPUTED-A  PICTURE -9(14).9(4).  OBSQ34.2 196
   000201         020200     03       CM-18V0 REDEFINES COMPUTED-A.                       OBSQ34.2 196
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000202         020300         04 COMPUTED-18V0                   PICTURE -9(18).       OBSQ34.2
   000203         020400         04 FILLER                          PICTURE X.            OBSQ34.2
   000204         020500     03 FILLER PIC X(50) VALUE SPACE.                             OBSQ34.2 IMP
   000205         020600 01  TEST-CORRECT.                                                OBSQ34.2
   000206         020700     02 FILLER PIC X(30) VALUE SPACE.                             OBSQ34.2 IMP
   000207         020800     02 FILLER PIC X(17) VALUE "       CORRECT =".                OBSQ34.2
   000208         020900     02 CORRECT-X.                                                OBSQ34.2
   000209         021000     03 CORRECT-A                 PICTURE X(20) VALUE SPACE.      OBSQ34.2 IMP
   000210         021100     03 CORRECT-N REDEFINES CORRECT-A PICTURE -9(9).9(9).         OBSQ34.2 209
   000211         021200     03 CORRECT-0V18 REDEFINES CORRECT-A    PICTURE -.9(18).      OBSQ34.2 209
   000212         021300     03 CORRECT-4V14 REDEFINES CORRECT-A    PICTURE -9(4).9(14).  OBSQ34.2 209
   000213         021400     03 CORRECT-14V4 REDEFINES CORRECT-A    PICTURE -9(14).9(4).  OBSQ34.2 209
   000214         021500     03      CR-18V0 REDEFINES CORRECT-A.                         OBSQ34.2 209
   000215         021600         04 CORRECT-18V0                    PICTURE -9(18).       OBSQ34.2
   000216         021700         04 FILLER                          PICTURE X.            OBSQ34.2
   000217         021800     03 FILLER PIC X(50) VALUE SPACE.                             OBSQ34.2 IMP
   000218         021900 01  CCVS-C-1.                                                    OBSQ34.2
   000219         022000     02 FILLER PICTURE IS X(99) VALUE IS " FEATURE              PAOBSQ34.2
   000220         022100-    "SS  PARAGRAPH-NAME                                          OBSQ34.2
   000221         022200-    "        REMARKS".                                           OBSQ34.2
   000222         022300     02 FILLER PICTURE IS X(20) VALUE IS SPACE.                   OBSQ34.2 IMP
   000223         022400 01  CCVS-C-2.                                                    OBSQ34.2
   000224         022500     02 FILLER PICTURE IS X VALUE IS SPACE.                       OBSQ34.2 IMP
   000225         022600     02 FILLER PICTURE IS X(6) VALUE IS "TESTED".                 OBSQ34.2
   000226         022700     02 FILLER PICTURE IS X(15) VALUE IS SPACE.                   OBSQ34.2 IMP
   000227         022800     02 FILLER PICTURE IS X(4) VALUE IS "FAIL".                   OBSQ34.2
   000228         022900     02 FILLER PICTURE IS X(94) VALUE IS SPACE.                   OBSQ34.2 IMP
   000229         023000 01  REC-SKL-SUB PICTURE 9(2) VALUE ZERO.                         OBSQ34.2 IMP
   000230         023100 01  REC-CT PICTURE 99 VALUE ZERO.                                OBSQ34.2 IMP
   000231         023200 01  DELETE-CNT                   PICTURE 999  VALUE ZERO.        OBSQ34.2 IMP
   000232         023300 01  ERROR-COUNTER PICTURE IS 999 VALUE IS ZERO.                  OBSQ34.2 IMP
   000233         023400 01  INSPECT-COUNTER PIC 999 VALUE ZERO.                          OBSQ34.2 IMP
   000234         023500 01  PASS-COUNTER PIC 999 VALUE ZERO.                             OBSQ34.2 IMP
   000235         023600 01  TOTAL-ERROR PIC 999 VALUE ZERO.                              OBSQ34.2 IMP
   000236         023700 01  ERROR-HOLD PIC 999 VALUE ZERO.                               OBSQ34.2 IMP
   000237         023800 01  DUMMY-HOLD PIC X(120) VALUE SPACE.                           OBSQ34.2 IMP
   000238         023900 01  RECORD-COUNT PIC 9(5) VALUE ZERO.                            OBSQ34.2 IMP
   000239         024000 01  CCVS-H-1.                                                    OBSQ34.2
   000240         024100     02  FILLER   PICTURE X(27)  VALUE SPACE.                     OBSQ34.2 IMP
   000241         024200     02 FILLER PICTURE X(67) VALUE                                OBSQ34.2
   000242         024300     " FEDERAL SOFTWARE TESTING CENTER COBOL COMPILER VALIDATION  OBSQ34.2
   000243         024400-    " SYSTEM".                                                   OBSQ34.2
   000244         024500     02  FILLER     PICTURE X(26)  VALUE SPACE.                   OBSQ34.2 IMP
   000245         024600 01  CCVS-H-2.                                                    OBSQ34.2
   000246         024700     02 FILLER PICTURE X(52) VALUE IS                             OBSQ34.2
   000247         024800     "CCVS85 FSTC COPY, NOT FOR DISTRIBUTION.".                   OBSQ34.2
   000248         024900     02 FILLER PICTURE IS X(19) VALUE IS "TEST RESULTS SET-  ".   OBSQ34.2
   000249         025000     02 TEST-ID PICTURE IS X(9).                                  OBSQ34.2
   000250         025100     02 FILLER PICTURE IS X(40) VALUE IS SPACE.                   OBSQ34.2 IMP
   000251         025200 01  CCVS-H-3.                                                    OBSQ34.2
   000252         025300     02  FILLER PICTURE X(34) VALUE                               OBSQ34.2
   000253         025400     " FOR OFFICIAL USE ONLY    ".                                OBSQ34.2
   000254         025500     02  FILLER PICTURE X(58) VALUE                               OBSQ34.2
   000255         025600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".OBSQ34.2
   000256         025700     02  FILLER PICTURE X(28) VALUE                               OBSQ34.2
   000257         025800     "  COPYRIGHT   1985 ".                                       OBSQ34.2
   000258         025900 01  CCVS-E-1.                                                    OBSQ34.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000259         026000     02 FILLER PICTURE IS X(52) VALUE IS SPACE.                   OBSQ34.2 IMP
   000260         026100     02 FILLER PICTURE IS X(14) VALUE IS "END OF TEST-  ".        OBSQ34.2
   000261         026200     02 ID-AGAIN PICTURE IS X(9).                                 OBSQ34.2
   000262         026300     02 FILLER PICTURE X(45) VALUE IS                             OBSQ34.2
   000263         026400     " NTIS DISTRIBUTION COBOL 85".                               OBSQ34.2
   000264         026500 01  CCVS-E-2.                                                    OBSQ34.2
   000265         026600     02  FILLER                   PICTURE X(31)  VALUE            OBSQ34.2
   000266         026700     SPACE.                                                       OBSQ34.2 IMP
   000267         026800     02  FILLER                   PICTURE X(21)  VALUE SPACE.     OBSQ34.2 IMP
   000268         026900     02 CCVS-E-2-2.                                               OBSQ34.2
   000269         027000         03 ERROR-TOTAL PICTURE IS XXX VALUE IS SPACE.            OBSQ34.2 IMP
   000270         027100         03 FILLER PICTURE IS X VALUE IS SPACE.                   OBSQ34.2 IMP
   000271         027200         03 ENDER-DESC PIC X(46) VALUE "ERRORS ENCOUNTERED".      OBSQ34.2
   000272         027300 01  CCVS-E-3.                                                    OBSQ34.2
   000273         027400     02  FILLER PICTURE X(22) VALUE                               OBSQ34.2
   000274         027500     " FOR OFFICIAL USE ONLY".                                    OBSQ34.2
   000275         027600     02  FILLER PICTURE X(12) VALUE SPACE.                        OBSQ34.2 IMP
   000276         027700     02  FILLER PICTURE X(58) VALUE                               OBSQ34.2
   000277         027800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBSQ34.2
   000278         027900     02  FILLER PICTURE X(13) VALUE SPACE.                        OBSQ34.2 IMP
   000279         028000     02 FILLER PIC X(15) VALUE " COPYRIGHT 1985".                 OBSQ34.2
   000280         028100 01  CCVS-E-4.                                                    OBSQ34.2
   000281         028200     02 CCVS-E-4-1 PIC XXX VALUE SPACE.                           OBSQ34.2 IMP
   000282         028300     02 FILLER PIC XXXX VALUE " OF ".                             OBSQ34.2
   000283         028400     02 CCVS-E-4-2 PIC XXX VALUE SPACE.                           OBSQ34.2 IMP
   000284         028500     02 FILLER PIC X(40) VALUE                                    OBSQ34.2
   000285         028600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       OBSQ34.2
   000286         028700 01  XXINFO.                                                      OBSQ34.2
   000287         028800     02 FILLER PIC X(30) VALUE "        *** INFORMATION  ***".    OBSQ34.2
   000288         028900     02 INFO-TEXT.                                                OBSQ34.2
   000289         029000     04 FILLER PIC X(20) VALUE SPACE.                             OBSQ34.2 IMP
   000290         029100     04 XXCOMPUTED PIC X(20).                                     OBSQ34.2
   000291         029200     04 FILLER PIC X(5) VALUE SPACE.                              OBSQ34.2 IMP
   000292         029300     04 XXCORRECT PIC X(20).                                      OBSQ34.2
   000293         029400 01  HYPHEN-LINE.                                                 OBSQ34.2
   000294         029500     02 FILLER PICTURE IS X VALUE IS SPACE.                       OBSQ34.2 IMP
   000295         029600     02 FILLER PICTURE IS X(65) VALUE IS "************************OBSQ34.2
   000296         029700-    "*****************************************".                 OBSQ34.2
   000297         029800     02 FILLER PICTURE IS X(54) VALUE IS "************************OBSQ34.2
   000298         029900-    "******************************".                            OBSQ34.2
   000299         030000 01  CCVS-PGM-ID PIC X(6) VALUE                                   OBSQ34.2
   000300         030100     "OBSQ3A".                                                    OBSQ34.2
   000301         030200 PROCEDURE DIVISION.                                              OBSQ34.2
   000302         030300 CCVS1 SECTION.                                                   OBSQ34.2
   000303         030400 OPEN-FILES.                                                      OBSQ34.2
   000304         030500     OPEN I-O RAW-DATA.                                           OBSQ34.2 73
   000305         030600     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            OBSQ34.2 299 76
   000306         030700     READ RAW-DATA INVALID KEY GO TO END-E-1.                     OBSQ34.2 73 312
   000307         030800     MOVE "ABORTED " TO C-ABORT.                                  OBSQ34.2 87
   000308         030900     ADD 1 TO C-NO-OF-TESTS.                                      OBSQ34.2 79
   000309         031000     ACCEPT C-DATE  FROM DATE.                                    OBSQ34.2 77
   000310         031100     ACCEPT C-TIME  FROM TIME.                                    OBSQ34.2 78
   000311         031200     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             OBSQ34.2 75 312
   000312         031300 END-E-1.                                                         OBSQ34.2
   000313         031400     CLOSE RAW-DATA.                                              OBSQ34.2 73
   000314         031500     OPEN     OUTPUT PRINT-FILE.                                  OBSQ34.2 88
   000315         031600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   OBSQ34.2 299 249 299 261
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000316         031700     MOVE    SPACE TO TEST-RESULTS.                               OBSQ34.2 IMP 179
   000317         031800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             OBSQ34.2 361 365
   000318         031900     MOVE ZERO TO REC-SKL-SUB.                                    OBSQ34.2 IMP 229
   000319         032000     PERFORM CCVS-INIT-FILE 9 TIMES.                              OBSQ34.2 320
   000320         032100 CCVS-INIT-FILE.                                                  OBSQ34.2
   000321         032200     ADD 1 TO REC-SKL-SUB.                                        OBSQ34.2 229
   000322         032300     MOVE FILE-RECORD-INFO-SKELETON TO                            OBSQ34.2 129
   000323         032400                  FILE-RECORD-INFO (REC-SKL-SUB).                 OBSQ34.2 143 229
   000324         032500 CCVS-INIT-EXIT.                                                  OBSQ34.2
   000325         032600     GO TO CCVS1-EXIT.                                            OBSQ34.2 436
   000326         032700 CLOSE-FILES.                                                     OBSQ34.2
   000327         032800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   OBSQ34.2 369 390 88
   000328         032900     OPEN I-O RAW-DATA.                                           OBSQ34.2 73
   000329         033000     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            OBSQ34.2 299 76
   000330         033100     READ RAW-DATA INVALID KEY GO TO END-E-2.                     OBSQ34.2 73 338
   000331         033200     MOVE "OK.     " TO C-ABORT.                                  OBSQ34.2 87
   000332         033300     MOVE PASS-COUNTER TO C-OK.                                   OBSQ34.2 234 80
   000333         033400     MOVE ERROR-HOLD   TO C-ALL.                                  OBSQ34.2 236 81
   000334         033500     MOVE ERROR-COUNTER TO C-FAIL.                                OBSQ34.2 232 82
   000335         033600     MOVE DELETE-CNT TO C-DELETED.                                OBSQ34.2 231 83
   000336         033700     MOVE INSPECT-COUNTER TO C-INSPECT.                           OBSQ34.2 233 84
   000337         033800     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             OBSQ34.2 75 338
   000338         033900 END-E-2.                                                         OBSQ34.2
   000339         034000     CLOSE RAW-DATA.                                              OBSQ34.2 73
   000340         034100 TERMINATE-CCVS.                                                  OBSQ34.2
   000341         034200     EXIT PROGRAM.                                                OBSQ34.2
   000342         034300 TERMINATE-CALL.                                                  OBSQ34.2
   000343         034400     STOP     RUN.                                                OBSQ34.2
   000344         034500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         OBSQ34.2 183 233
   000345         034600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           OBSQ34.2 183 234
   000346         034700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          OBSQ34.2 183 232
   000347         034800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.          OBSQ34.2 183 231
   000348         034900     MOVE "****TEST DELETED****" TO RE-MARK.                      OBSQ34.2 191
   000349         035000 PRINT-DETAIL.                                                    OBSQ34.2
   000350         035100     IF REC-CT NOT EQUAL TO ZERO                                  OBSQ34.2 230 IMP
   000351      1  035200             MOVE "." TO PARDOT-X                                 OBSQ34.2 187
   000352      1  035300             MOVE REC-CT TO DOTVALUE.                             OBSQ34.2 230 188
   000353         035400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      OBSQ34.2 179 89 402
   000354         035500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               OBSQ34.2 183 402
   000355      1  035600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 OBSQ34.2 419 428
   000356      1  035700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 OBSQ34.2 429 435
   000357         035800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              OBSQ34.2 IMP 183 IMP 195
   000358         035900     MOVE SPACE TO CORRECT-X.                                     OBSQ34.2 IMP 208
   000359         036000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         OBSQ34.2 230 IMP IMP 185
   000360         036100     MOVE     SPACE TO RE-MARK.                                   OBSQ34.2 IMP 191
   000361         036200 HEAD-ROUTINE.                                                    OBSQ34.2
   000362         036300     MOVE CCVS-H-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBSQ34.2 239 90 402
   000363         036400     MOVE CCVS-H-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.   OBSQ34.2 245 90 402
   000364         036500     MOVE CCVS-H-3 TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.   OBSQ34.2 251 90 402
   000365         036600 COLUMN-NAMES-ROUTINE.                                            OBSQ34.2
   000366         036700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBSQ34.2 218 90 402
   000367         036800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBSQ34.2 223 90 402
   000368         036900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        OBSQ34.2 293 90 402
   000369         037000 END-ROUTINE.                                                     OBSQ34.2
   000370         037100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.OBSQ34.2 293 90 402
   000371         037200 END-RTN-EXIT.                                                    OBSQ34.2
   000372         037300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   OBSQ34.2 258 90 402
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000373         037400 END-ROUTINE-1.                                                   OBSQ34.2
   000374         037500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      OBSQ34.2 232 236 233
   000375         037600      ERROR-HOLD. ADD DELETE-CNT TO ERROR-HOLD.                   OBSQ34.2 236 231 236
   000376         037700      ADD PASS-COUNTER TO ERROR-HOLD.                             OBSQ34.2 234 236
   000377         037800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   OBSQ34.2
   000378         037900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            OBSQ34.2 234 281
   000379         038000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              OBSQ34.2 236 283
   000380         038100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                OBSQ34.2 280 268
   000381         038200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           OBSQ34.2 264 90 402
   000382         038300  END-ROUTINE-12.                                                 OBSQ34.2
   000383         038400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        OBSQ34.2 271
   000384         038500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      OBSQ34.2 232 IMP
   000385      1  038600         MOVE "NO " TO ERROR-TOTAL                                OBSQ34.2 269
   000386         038700         ELSE                                                     OBSQ34.2
   000387      1  038800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       OBSQ34.2 232 269
   000388         038900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           OBSQ34.2 264 90
   000389         039000     PERFORM WRITE-LINE.                                          OBSQ34.2 402
   000390         039100 END-ROUTINE-13.                                                  OBSQ34.2
   000391         039200     IF DELETE-CNT IS EQUAL TO ZERO                               OBSQ34.2 231 IMP
   000392      1  039300         MOVE "NO " TO ERROR-TOTAL  ELSE                          OBSQ34.2 269
   000393      1  039400         MOVE DELETE-CNT TO ERROR-TOTAL.                          OBSQ34.2 231 269
   000394         039500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   OBSQ34.2 271
   000395         039600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBSQ34.2 264 90 402
   000396         039700      IF   INSPECT-COUNTER EQUAL TO ZERO                          OBSQ34.2 233 IMP
   000397      1  039800          MOVE "NO " TO ERROR-TOTAL                               OBSQ34.2 269
   000398      1  039900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   OBSQ34.2 233 269
   000399         040000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            OBSQ34.2 271
   000400         040100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          OBSQ34.2 264 90 402
   000401         040200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           OBSQ34.2 272 90 402
   000402         040300 WRITE-LINE.                                                      OBSQ34.2
   000403         040400     ADD 1 TO RECORD-COUNT.                                       OBSQ34.2 238
   000404         040500     IF RECORD-COUNT GREATER 50                                   OBSQ34.2 238
   000405      1  040600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          OBSQ34.2 90 237
   000406      1  040700         MOVE SPACE TO DUMMY-RECORD                               OBSQ34.2 IMP 90
   000407      1  040800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  OBSQ34.2 90
   000408      1  040900         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             OBSQ34.2 218 90 414
   000409      1  041000         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     OBSQ34.2 223 90 414
   000410      1  041100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          OBSQ34.2 293 90 414
   000411      1  041200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          OBSQ34.2 237 90
   000412      1  041300         MOVE ZERO TO RECORD-COUNT.                               OBSQ34.2 IMP 238
   000413         041400     PERFORM WRT-LN.                                              OBSQ34.2 414
   000414         041500 WRT-LN.                                                          OBSQ34.2
   000415         041600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               OBSQ34.2 90
   000416         041700     MOVE SPACE TO DUMMY-RECORD.                                  OBSQ34.2 IMP 90
   000417         041800 BLANK-LINE-PRINT.                                                OBSQ34.2
   000418         041900     PERFORM WRT-LN.                                              OBSQ34.2 414
   000419         042000 FAIL-ROUTINE.                                                    OBSQ34.2
   000420         042100     IF COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.   OBSQ34.2 195 IMP 425
   000421         042200     IF CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.    OBSQ34.2 208 IMP 425
   000422         042300     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    OBSQ34.2 288
   000423         042400     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     OBSQ34.2 286 90 402
   000424         042500     GO TO FAIL-ROUTINE-EX.                                       OBSQ34.2 428
   000425         042600 FAIL-ROUTINE-WRITE.                                              OBSQ34.2
   000426         042700     MOVE TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE           OBSQ34.2 192 89 402
   000427         042800     MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES.   OBSQ34.2 205 89 402
   000428         042900 FAIL-ROUTINE-EX. EXIT.                                           OBSQ34.2
   000429         043000 BAIL-OUT.                                                        OBSQ34.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000430         043100     IF COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.       OBSQ34.2 196 IMP 432
   000431         043200     IF CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.               OBSQ34.2 209 IMP 435
   000432         043300 BAIL-OUT-WRITE.                                                  OBSQ34.2
   000433         043400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  OBSQ34.2 209 292 196 290
   000434         043500     MOVE XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.     OBSQ34.2 286 90 402
   000435         043600 BAIL-OUT-EX. EXIT.                                               OBSQ34.2
   000436         043700 CCVS1-EXIT.                                                      OBSQ34.2
   000437         043800     EXIT.                                                        OBSQ34.2
   000438         043900 SECT-OBSQ3A-0001 SECTION.                                        OBSQ34.2
   000439         044000 SEQ-INIT-001.                                                    OBSQ34.2
   000440         044100*             THIS TEST CREATES FILE SQ-FS1 AS THE FIRST FILE     OBSQ34.2
   000441         044200*             ON MULTIPLE FILE TAPE ONE.  THIS FILE IS CLOSED     OBSQ34.2
   000442         044300*             WITH NO REWIND.                                     OBSQ34.2
   000443         044400     PERFORM BUILD-RECORD.                                        OBSQ34.2 636
   000444         044500     MOVE "SQ-FS1" TO XFILE-NAME (1).                             OBSQ34.2 146
   000445         044600     MOVE "RC"    TO CHARS-OR-RECORDS (1).                        OBSQ34.2 162
   000446         044700     MOVE 1        TO XBLOCK-SIZE (1).                            OBSQ34.2 164
   000447         044800     OPEN OUTPUT SQ-FS1.                                          OBSQ34.2 91
   000448         044900 SEQ-TEST-001.                                                    OBSQ34.2
   000449         045000     MOVE FILE-RECORD-INFO-P1-120 (1) TO SQ-FS1R1-F-G-120.        OBSQ34.2 144 94
   000450         045100     WRITE SQ-FS1R1-F-G-120.                                      OBSQ34.2 94
   000451         045200     IF XRECORD-NUMBER (1) EQUAL TO 750                           OBSQ34.2 152
   000452      1  045300              GO TO SEQ-WRITE-001.                                OBSQ34.2 455
   000453         045400     ADD 1 TO XRECORD-NUMBER (1).                                 OBSQ34.2 152
   000454         045500     GO TO SEQ-TEST-001.                                          OBSQ34.2 448
   000455         045600 SEQ-WRITE-001.                                                   OBSQ34.2
   000456         045700     MOVE "CREATE FILE SQ-FS1" TO FEATURE.                        OBSQ34.2 181
   000457         045800     MOVE "SEQ-TEST-001" TO PAR-NAME.                             OBSQ34.2 185
   000458         045900     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   OBSQ34.2 196
   000459         046000     MOVE XRECORD-NUMBER (1) TO CORRECT-18V0.                     OBSQ34.2 152 215
   000460         046100     PERFORM PRINT-DETAIL.                                        OBSQ34.2 349
   000461         046200 SEQ-CLOSE-001.                                                   OBSQ34.2
   000462         046300     CLOSE SQ-FS1 WITH NO REWIND.                                 OBSQ34.2 91
   000463         046400 SEQ-INIT-002.                                                    OBSQ34.2
   000464         046500*             THIS TEST CREATES FILE SQ-FS2 AS THE SECOND FILE    OBSQ34.2
   000465         046600*             ON MULTIPLE FILE TAPE ONE.  THIS FILE IS OPENED     OBSQ34.2
   000466         046700*             AND CLOSED WITH NO REWIND.                          OBSQ34.2
   000467         046800     PERFORM BUILD-RECORD.                                        OBSQ34.2 636
   000468         046900     MOVE "SQ-FS2" TO XFILE-NAME (1).                             OBSQ34.2 146
   000469         047000     MOVE "RC"     TO CHARS-OR-RECORDS (1).                       OBSQ34.2 162
   000470         047100     MOVE 5        TO XBLOCK-SIZE (1).                            OBSQ34.2 164
   000471         047200     OPEN OUTPUT SQ-FS2 WITH NO REWIND.                           OBSQ34.2 95
   000472         047300 SEQ-TEST-002.                                                    OBSQ34.2
   000473         047400     MOVE FILE-RECORD-INFO-P1-120 (1) TO SQ-FS2R1-F-G-120.        OBSQ34.2 144 98
   000474         047500     WRITE SQ-FS2R1-F-G-120.                                      OBSQ34.2 98
   000475         047600     IF XRECORD-NUMBER (1) EQUAL TO 750                           OBSQ34.2 152
   000476      1  047700              GO TO SEQ-WRITE-002.                                OBSQ34.2 479
   000477         047800     ADD 1 TO XRECORD-NUMBER (1).                                 OBSQ34.2 152
   000478         047900     GO TO SEQ-TEST-002.                                          OBSQ34.2 472
   000479         048000 SEQ-WRITE-002.                                                   OBSQ34.2
   000480         048100     MOVE "CREATE FILE SQ-FS2" TO FEATURE.                        OBSQ34.2 181
   000481         048200     MOVE "SEQ-TEST-002" TO PAR-NAME.                             OBSQ34.2 185
   000482         048300     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   OBSQ34.2 196
   000483         048400     MOVE XRECORD-NUMBER (1) TO CORRECT-18V0.                     OBSQ34.2 152 215
   000484         048500     PERFORM PRINT-DETAIL.                                        OBSQ34.2 349
   000485         048600 SEQ-CLOSE-002.                                                   OBSQ34.2
   000486         048700     CLOSE SQ-FS2 WITH NO REWIND.                                 OBSQ34.2 95
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000487         048800 SEQ-INIT-003.                                                    OBSQ34.2
   000488         048900*             THIS TEST CREATES FILE SQ-FS3 AS THE THIRD FILE     OBSQ34.2
   000489         049000*             ON MULTIPLE FILE TAPE ONE.  THIS FILE IS OPENED     OBSQ34.2
   000490         049100*             AND CLOSED WITH NO REWIND.                          OBSQ34.2
   000491         049200     PERFORM BUILD-RECORD.                                        OBSQ34.2 636
   000492         049300     MOVE "SQ-FS3" TO XFILE-NAME (1).                             OBSQ34.2 146
   000493         049400     MOVE "CH"     TO CHARS-OR-RECORDS (1).                       OBSQ34.2 162
   000494         049500     MOVE 1200     TO XBLOCK-SIZE (1).                            OBSQ34.2 164
   000495         049600     OPEN OUTPUT SQ-FS3 NO REWIND.                                OBSQ34.2 99
   000496         049700 SEQ-TEST-003.                                                    OBSQ34.2
   000497         049800     MOVE FILE-RECORD-INFO-P1-120 (1) TO SQ-FS3R1-F-G-120.        OBSQ34.2 144 103
   000498         049900     WRITE SQ-FS3R1-F-G-120.                                      OBSQ34.2 103
   000499         050000     IF XRECORD-NUMBER (1) EQUAL TO 750                           OBSQ34.2 152
   000500      1  050100              GO TO SEQ-WRITE-003.                                OBSQ34.2 503
   000501         050200     ADD 1 TO XRECORD-NUMBER (1).                                 OBSQ34.2 152
   000502         050300     GO TO SEQ-TEST-003.                                          OBSQ34.2 496
   000503         050400 SEQ-WRITE-003.                                                   OBSQ34.2
   000504         050500     MOVE "CREATE FILE SQ-FS3" TO FEATURE.                        OBSQ34.2 181
   000505         050600     MOVE "SEQ-TEST-003" TO PAR-NAME.                             OBSQ34.2 185
   000506         050700     MOVE "FILE CREATED, RECS=" TO COMPUTED-A.                    OBSQ34.2 196
   000507         050800     MOVE XRECORD-NUMBER (1) TO CORRECT-18V0.                     OBSQ34.2 152 215
   000508         050900     PERFORM PRINT-DETAIL.                                        OBSQ34.2 349
   000509         051000 SEQ-CLOSE-003.                                                   OBSQ34.2
   000510         051100     CLOSE SQ-FS3 WITH NO REWIND.                                 OBSQ34.2 99
   000511         051200 SEQ-INIT-004.                                                    OBSQ34.2
   000512         051300*             THIS TEST CREATES FILE SQ-FS4 AS THE FOURTH AND LASTOBSQ34.2
   000513         051400*             FILE ON MULTIPLE FILE TAPE ONE.  THIS FILE IS OPENEDOBSQ34.2
   000514         051500*             WITH NO REWIND.                                     OBSQ34.2
   000515         051600     PERFORM BUILD-RECORD.                                        OBSQ34.2 636
   000516         051700     MOVE "SQ-FS4" TO XFILE-NAME (1).                             OBSQ34.2 146
   000517         051800     MOVE "RC"     TO CHARS-OR-RECORDS (1).                       OBSQ34.2 162
   000518         051900     MOVE 10       TO XBLOCK-SIZE (1).                            OBSQ34.2 164
   000519         052000     OPEN OUTPUT SQ-FS4 WITH NO REWIND.                           OBSQ34.2 104
   000520         052100 SEQ-TEST-004.                                                    OBSQ34.2
   000521         052200     MOVE FILE-RECORD-INFO-P1-120 (1) TO SQ-FS4R1-F-G-120.        OBSQ34.2 144 108
   000522         052300     WRITE SQ-FS4R1-F-G-120.                                      OBSQ34.2 108
   000523         052400     IF XRECORD-NUMBER (1) EQUAL TO 750                           OBSQ34.2 152
   000524      1  052500              GO TO SEQ-WRITE-004.                                OBSQ34.2 527
   000525         052600     ADD 1 TO XRECORD-NUMBER (1).                                 OBSQ34.2 152
   000526         052700     GO TO SEQ-TEST-004.                                          OBSQ34.2 520
   000527         052800 SEQ-WRITE-004.                                                   OBSQ34.2
   000528         052900     MOVE "CREATE FILE SQ-FS4" TO FEATURE.                        OBSQ34.2 181
   000529         053000     MOVE "SEQ-TEST-004" TO PAR-NAME.                             OBSQ34.2 185
   000530         053100     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   OBSQ34.2 196
   000531         053200     MOVE XRECORD-NUMBER (1) TO CORRECT-18V0.                     OBSQ34.2 152 215
   000532         053300     PERFORM PRINT-DETAIL.                                        OBSQ34.2 349
   000533         053400 SEQ-CLOSE-004.                                                   OBSQ34.2
   000534         053500     CLOSE SQ-FS4.                                                OBSQ34.2 104
   000535         053600 SEQ-INIT-005.                                                    OBSQ34.2
   000536         053700*             THIS TEST CREATES FILE SQ-FS5 AS THE FIRST FILE ON  OBSQ34.2
   000537         053800*             MULTIPLE FILE TAPE TWO.  THE POSITION PHRASE IS     OBSQ34.2
   000538         053900*             USED IN THE MULTIPLE FILE CLAUSE.                   OBSQ34.2
   000539         054000     PERFORM BUILD-RECORD.                                        OBSQ34.2 636
   000540         054100     MOVE "SQ-FS5" TO XFILE-NAME (1).                             OBSQ34.2 146
   000541         054200     MOVE "RC"     TO CHARS-OR-RECORDS (1).                       OBSQ34.2 162
   000542         054300     MOVE 5        TO XBLOCK-SIZE (1).                            OBSQ34.2 164
   000543         054400     OPEN OUTPUT SQ-FS5.                                          OBSQ34.2 109
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000544         054500 SEQ-TEST-005.                                                    OBSQ34.2
   000545         054600     MOVE FILE-RECORD-INFO-P1-120 (1) TO SQ-FS5R1-F-G-120.        OBSQ34.2 144 112
   000546         054700     WRITE SQ-FS5R1-F-G-120.                                      OBSQ34.2 112
   000547         054800     IF XRECORD-NUMBER (1) EQUAL TO 750                           OBSQ34.2 152
   000548      1  054900              GO TO SEQ-WRITE-005.                                OBSQ34.2 551
   000549         055000     ADD 1 TO XRECORD-NUMBER (1).                                 OBSQ34.2 152
   000550         055100     GO TO SEQ-TEST-005.                                          OBSQ34.2 544
   000551         055200 SEQ-WRITE-005.                                                   OBSQ34.2
   000552         055300     MOVE "CREATE FILE SQ-FS5" TO FEATURE.                        OBSQ34.2 181
   000553         055400     MOVE "SEQ-TEST-005" TO PAR-NAME.                             OBSQ34.2 185
   000554         055500     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   OBSQ34.2 196
   000555         055600     MOVE XRECORD-NUMBER (1) TO CORRECT-18V0.                     OBSQ34.2 152 215
   000556         055700     PERFORM PRINT-DETAIL.                                        OBSQ34.2 349
   000557         055800 SEQ-CLOSE-005.                                                   OBSQ34.2
   000558         055900     CLOSE SQ-FS5.                                                OBSQ34.2 109
   000559         056000 SEQ-INIT-006.                                                    OBSQ34.2
   000560         056100*             THIS  TEST CREATES FILE SQ-FS6 AS THE SECOND FILE   OBSQ34.2
   000561         056200*             ON MULTIPLE FILE TAPE TWO.  THE POSITION PHRASE IS  OBSQ34.2
   000562         056300*             USED IN THE MULTIPLE FILE CLAUSE.                   OBSQ34.2
   000563         056400     PERFORM BUILD-RECORD.                                        OBSQ34.2 636
   000564         056500     MOVE "SQ-FS6" TO XFILE-NAME (1).                             OBSQ34.2 146
   000565         056600     MOVE "RC"     TO CHARS-OR-RECORDS (1).                       OBSQ34.2 162
   000566         056700     MOVE 10       TO XBLOCK-SIZE (1).                            OBSQ34.2 164
   000567         056800     OPEN OUTPUT SQ-FS6.                                          OBSQ34.2 113
   000568         056900 SEQ-TEST-006.                                                    OBSQ34.2
   000569         057000     MOVE FILE-RECORD-INFO-P1-120 (1) TO SQ-FS6R1-F-G-120.        OBSQ34.2 144 116
   000570         057100     WRITE SQ-FS6R1-F-G-120.                                      OBSQ34.2 116
   000571         057200     IF XRECORD-NUMBER (1) EQUAL TO 750                           OBSQ34.2 152
   000572      1  057300              GO TO SEQ-WRITE-006.                                OBSQ34.2 575
   000573         057400     ADD 1 TO XRECORD-NUMBER (1).                                 OBSQ34.2 152
   000574         057500     GO TO SEQ-TEST-006.                                          OBSQ34.2 568
   000575         057600 SEQ-WRITE-006.                                                   OBSQ34.2
   000576         057700     MOVE "CREATE FILE SQ-FS6" TO FEATURE.                        OBSQ34.2 181
   000577         057800     MOVE "SEQ-TEST-006" TO PAR-NAME.                             OBSQ34.2 185
   000578         057900     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   OBSQ34.2 196
   000579         058000     MOVE XRECORD-NUMBER (1) TO CORRECT-18V0.                     OBSQ34.2 152 215
   000580         058100     PERFORM PRINT-DETAIL.                                        OBSQ34.2 349
   000581         058200 SEQ-CLOSE-006.                                                   OBSQ34.2
   000582         058300     CLOSE SQ-FS6.                                                OBSQ34.2 113
   000583         058400 SEQ-INIT-007.                                                    OBSQ34.2
   000584         058500*             THIS TEST CREATES FILE SQ-FS7 AS THE THIRD FILE     OBSQ34.2
   000585         058600*             ON MULTIPLE FILE TAPE TWO.  THE POSITION PHRASE IS  OBSQ34.2
   000586         058700*             USED IN THE MULTIPLE FILE CLAUSE.                   OBSQ34.2
   000587         058800     PERFORM BUILD-RECORD.                                        OBSQ34.2 636
   000588         058900     MOVE "SQ-FS7" TO XFILE-NAME (1).                             OBSQ34.2 146
   000589         059000     MOVE "CH"     TO CHARS-OR-RECORDS (1).                       OBSQ34.2 162
   000590         059100     MOVE 2400     TO XBLOCK-SIZE (1).                            OBSQ34.2 164
   000591         059200     OPEN OUTPUT SQ-FS7.                                          OBSQ34.2 117
   000592         059300 SEQ-TEST-007.                                                    OBSQ34.2
   000593         059400     MOVE FILE-RECORD-INFO-P1-120 (1) TO SQ-FS7R1-F-G-120.        OBSQ34.2 144 120
   000594         059500     WRITE SQ-FS7R1-F-G-120.                                      OBSQ34.2 120
   000595         059600     IF XRECORD-NUMBER (1) EQUAL TO 750                           OBSQ34.2 152
   000596      1  059700              GO TO SEQ-WRITE-007.                                OBSQ34.2 599
   000597         059800     ADD 1 TO XRECORD-NUMBER (1).                                 OBSQ34.2 152
   000598         059900     GO TO SEQ-TEST-007.                                          OBSQ34.2 592
   000599         060000 SEQ-WRITE-007.                                                   OBSQ34.2
   000600         060100     MOVE "CREATE FILE SQ-FS7" TO FEATURE.                        OBSQ34.2 181
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000601         060200     MOVE "SEQ-TEST-007" TO PAR-NAME.                             OBSQ34.2 185
   000602         060300     MOVE "FILE CREATED, RECS-=" TO COMPUTED-A.                   OBSQ34.2 196
   000603         060400     MOVE XRECORD-NUMBER (1) TO CORRECT-18V0.                     OBSQ34.2 152 215
   000604         060500     PERFORM PRINT-DETAIL.                                        OBSQ34.2 349
   000605         060600 SEQ-CLOSE-007.                                                   OBSQ34.2
   000606         060700     CLOSE SQ-FS7.                                                OBSQ34.2 117
   000607         060800 SEQ-INIT-008.                                                    OBSQ34.2
   000608         060900*             THIS TEST CREATES FILE SQ-FS8 AS THE FOURTH AND LASTOBSQ34.2
   000609         061000*             FILE ON MULTIPLE FILE TAPE TWO.  THE POSITION PHRASEOBSQ34.2
   000610         061100*             IS USED IN THE MULTIPLE FILE CLAUSE.                OBSQ34.2
   000611         061200     PERFORM BUILD-RECORD.                                        OBSQ34.2 636
   000612         061300     MOVE "SQ-FS8" TO XFILE-NAME (1).                             OBSQ34.2 146
   000613         061400     MOVE "CH"     TO CHARS-OR-RECORDS (1).                       OBSQ34.2 162
   000614         061500     MOVE 120      TO XBLOCK-SIZE (1).                            OBSQ34.2 164
   000615         061600     OPEN OUTPUT SQ-FS8.                                          OBSQ34.2 121
   000616         061700 SEQ-TEST-008.                                                    OBSQ34.2
   000617         061800     MOVE FILE-RECORD-INFO-P1-120 (1) TO SQ-FS8R1-F-G-120.        OBSQ34.2 144 125
   000618         061900     WRITE SQ-FS8R1-F-G-120.                                      OBSQ34.2 125
   000619         062000     IF XRECORD-NUMBER (1) EQUAL 750                              OBSQ34.2 152
   000620      1  062100              GO TO SEQ-WRITE-008.                                OBSQ34.2 623
   000621         062200     ADD 1 TO XRECORD-NUMBER (1).                                 OBSQ34.2 152
   000622         062300     GO TO SEQ-TEST-008.                                          OBSQ34.2 616
   000623         062400 SEQ-WRITE-008.                                                   OBSQ34.2
   000624         062500     MOVE "CREATE FILE SQ-FS8" TO FEATURE.                        OBSQ34.2 181
   000625         062600     MOVE "SEQ-TEST-008" TO PAR-NAME.                             OBSQ34.2 185
   000626         062700     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   OBSQ34.2 196
   000627         062800     MOVE XRECORD-NUMBER (1) TO CORRECT-18V0.                     OBSQ34.2 152 215
   000628         062900     PERFORM PRINT-DETAIL.                                        OBSQ34.2 349
   000629         063000 SEQ-CLOSE-008.                                                   OBSQ34.2
   000630         063100     CLOSE SQ-FS8.                                                OBSQ34.2 121
   000631         063200 OBSQ3A-END-ROUTINE.                                              OBSQ34.2
   000632         063300     MOVE "END OF OBSQ3A VALIDATION TESTS" TO PRINT-REC.          OBSQ34.2 89
   000633         063400     WRITE PRINT-REC AFTER ADVANCING 1 LINE.                      OBSQ34.2 89
   000634         063500 TERMINATE-OBSQ3A.                                                OBSQ34.2
   000635         063600     GO TO CCVS-EXIT.                                             OBSQ34.2 644
   000636         063700 BUILD-RECORD.                                                    OBSQ34.2
   000637         063800     MOVE "R1-F-G" TO XRECORD-NAME (1).                           OBSQ34.2 148
   000638         063900     MOVE "OBSQ3A" TO XPROGRAM-NAME (1).                          OBSQ34.2 158
   000639         064000     MOVE 120      TO XRECORD-LENGTH (1).                         OBSQ34.2 160
   000640         064100     MOVE 750      TO RECORDS-IN-FILE (1).                        OBSQ34.2 166
   000641         064200     MOVE "SQ"     TO XFILE-ORGANIZATION (1).                     OBSQ34.2 168
   000642         064300     MOVE "S"      TO XLABEL-TYPE (1).                            OBSQ34.2 170
   000643         064400     MOVE 1        TO XRECORD-NUMBER (1).                         OBSQ34.2 152
   000644         064500 CCVS-EXIT SECTION.                                               OBSQ34.2
   000645         064600 CCVS-999999.                                                     OBSQ34.2
   000646         064700     GO TO CLOSE-FILES.                                           OBSQ34.2 326
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      175   ALTERNATE-KEY1
      177   ALTERNATE-KEY2
       87   C-ABORT. . . . . . . . . . . .  M307 M331
       81   C-ALL. . . . . . . . . . . . .  M333
       77   C-DATE . . . . . . . . . . . .  M309
       83   C-DELETED. . . . . . . . . . .  M335
       82   C-FAIL . . . . . . . . . . . .  M334
       86   C-INDENT
       84   C-INSPECT. . . . . . . . . . .  M336
       79   C-NO-OF-TESTS. . . . . . . . .  M308
       85   C-NOTE
       80   C-OK . . . . . . . . . . . . .  M332
       78   C-TIME . . . . . . . . . . . .  M310
      218   CCVS-C-1 . . . . . . . . . . .  366 408
      223   CCVS-C-2 . . . . . . . . . . .  367 409
      258   CCVS-E-1 . . . . . . . . . . .  372
      264   CCVS-E-2 . . . . . . . . . . .  381 388 395 400
      268   CCVS-E-2-2 . . . . . . . . . .  M380
      272   CCVS-E-3 . . . . . . . . . . .  401
      280   CCVS-E-4 . . . . . . . . . . .  380
      281   CCVS-E-4-1 . . . . . . . . . .  M378
      283   CCVS-E-4-2 . . . . . . . . . .  M379
      239   CCVS-H-1 . . . . . . . . . . .  362
      245   CCVS-H-2 . . . . . . . . . . .  363
      251   CCVS-H-3 . . . . . . . . . . .  364
      299   CCVS-PGM-ID. . . . . . . . . .  305 315 315 329
      162   CHARS-OR-RECORDS . . . . . . .  M445 M469 M493 M517 M541 M565 M589 M613
      201   CM-18V0
      196   COMPUTED-A . . . . . . . . . .  197 198 199 200 201 430 433 M458 M482 M506 M530 M554 M578 M602 M626
      197   COMPUTED-N
      195   COMPUTED-X . . . . . . . . . .  M357 420
      198   COMPUTED-0V18
      200   COMPUTED-14V4
      202   COMPUTED-18V0
      199   COMPUTED-4V14
      209   CORRECT-A. . . . . . . . . . .  210 211 212 213 214 431 433
      210   CORRECT-N
      208   CORRECT-X. . . . . . . . . . .  M358 421
      211   CORRECT-0V18
      213   CORRECT-14V4
      215   CORRECT-18V0 . . . . . . . . .  M459 M483 M507 M531 M555 M579 M603 M627
      212   CORRECT-4V14
      127   COUNT-OF-RECS
      214   CR-18V0
      231   DELETE-CNT . . . . . . . . . .  335 M347 375 391 393
      188   DOTVALUE . . . . . . . . . . .  M352
      237   DUMMY-HOLD . . . . . . . . . .  M405 411
       90   DUMMY-RECORD . . . . . . . . .  M362 M363 M364 M366 M367 M368 M370 M372 M381 M388 M395 M400 M401 405 M406 407
                                            M408 M409 M410 M411 415 M416 M423 M434
      271   ENDER-DESC . . . . . . . . . .  M383 M394 M399
      232   ERROR-COUNTER. . . . . . . . .  334 M346 374 384 387
      236   ERROR-HOLD . . . . . . . . . .  333 M374 M375 M375 M376 379
      269   ERROR-TOTAL. . . . . . . . . .  M385 M387 M392 M393 M397 M398
      181   FEATURE. . . . . . . . . . . .  M456 M480 M504 M528 M552 M576 M600 M624
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    16
0 Defined   Cross-reference of data names   References

0     143   FILE-RECORD-INFO . . . . . . .  M323
      144   FILE-RECORD-INFO-P1-120. . . .  449 473 497 521 545 569 593 617
      171   FILE-RECORD-INFO-P121-240
      129   FILE-RECORD-INFO-SKELETON. . .  322
      128   FILE-RECORD-INFORMATION-REC
      293   HYPHEN-LINE. . . . . . . . . .  368 370 410
      261   ID-AGAIN . . . . . . . . . . .  M315
      288   INFO-TEXT. . . . . . . . . . .  M422
      233   INSPECT-COUNTER. . . . . . . .  336 M344 374 396 398
      156   ODO-NUMBER
      183   P-OR-F . . . . . . . . . . . .  M344 M345 M346 M347 354 M357
      185   PAR-NAME . . . . . . . . . . .  M359 M457 M481 M505 M529 M553 M577 M601 M625
      187   PARDOT-X . . . . . . . . . . .  M351
      234   PASS-COUNTER . . . . . . . . .  332 M345 376 378
       88   PRINT-FILE . . . . . . . . . .  35 314 327
       89   PRINT-REC. . . . . . . . . . .  M353 M426 M427 M632 633
       73   RAW-DATA . . . . . . . . . . .  30 304 306 313 328 330 339
       76   RAW-DATA-KEY . . . . . . . . .  34 M305 M329
       75   RAW-DATA-SATZ. . . . . . . . .  311 337
      191   RE-MARK. . . . . . . . . . . .  M348 M360
      230   REC-CT . . . . . . . . . . . .  350 352 359
      229   REC-SKL-SUB. . . . . . . . . .  M318 M321 323
      238   RECORD-COUNT . . . . . . . . .  M403 404 M412
      166   RECORDS-IN-FILE. . . . . . . .  M640
      150   REELUNIT-NUMBER
       91   SQ-FS1 . . . . . . . . . . . .  37 447 462
       94   SQ-FS1R1-F-G-120 . . . . . . .  M449 450
       95   SQ-FS2 . . . . . . . . . . . .  40 471 486
       98   SQ-FS2R1-F-G-120 . . . . . . .  M473 474
       99   SQ-FS3 . . . . . . . . . . . .  43 495 510
      103   SQ-FS3R1-F-G-120 . . . . . . .  M497 498
      104   SQ-FS4 . . . . . . . . . . . .  46 519 534
      108   SQ-FS4R1-F-G-120 . . . . . . .  M521 522
      109   SQ-FS5 . . . . . . . . . . . .  49 543 558
      112   SQ-FS5R1-F-G-120 . . . . . . .  M545 546
      113   SQ-FS6 . . . . . . . . . . . .  51 567 582
      116   SQ-FS6R1-F-G-120 . . . . . . .  M569 570
      117   SQ-FS7 . . . . . . . . . . . .  54 591 606
      120   SQ-FS7R1-F-G-120 . . . . . . .  M593 594
      121   SQ-FS8 . . . . . . . . . . . .  58 615 630
      125   SQ-FS8R1-F-G-120 . . . . . . .  M617 618
      192   TEST-COMPUTED. . . . . . . . .  426
      205   TEST-CORRECT . . . . . . . . .  427
      249   TEST-ID. . . . . . . . . . . .  M315
      179   TEST-RESULTS . . . . . . . . .  M316 353
      235   TOTAL-ERROR
      154   UPDATE-NUMBER
      164   XBLOCK-SIZE. . . . . . . . . .  M446 M470 M494 M518 M542 M566 M590 M614
      146   XFILE-NAME . . . . . . . . . .  M444 M468 M492 M516 M540 M564 M588 M612
      168   XFILE-ORGANIZATION . . . . . .  M641
      170   XLABEL-TYPE. . . . . . . . . .  M642
      158   XPROGRAM-NAME. . . . . . . . .  M638
      173   XRECORD-KEY
      160   XRECORD-LENGTH . . . . . . . .  M639
      148   XRECORD-NAME . . . . . . . . .  M637
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    17
0 Defined   Cross-reference of data names   References

0     152   XRECORD-NUMBER . . . . . . . .  451 M453 459 475 M477 483 499 M501 507 523 M525 531 547 M549 555 571 M573 579
                                            595 M597 603 619 M621 627 M643
      290   XXCOMPUTED . . . . . . . . . .  M433
      292   XXCORRECT. . . . . . . . . . .  M433
      286   XXINFO . . . . . . . . . . . .  423 434
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    18
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

      429   BAIL-OUT . . . . . . . . . . .  P356
      435   BAIL-OUT-EX. . . . . . . . . .  E356 G431
      432   BAIL-OUT-WRITE . . . . . . . .  G430
      417   BLANK-LINE-PRINT
      636   BUILD-RECORD . . . . . . . . .  P443 P467 P491 P515 P539 P563 P587 P611
      644   CCVS-EXIT. . . . . . . . . . .  G635
      324   CCVS-INIT-EXIT
      320   CCVS-INIT-FILE . . . . . . . .  P319
      645   CCVS-999999
      302   CCVS1
      436   CCVS1-EXIT . . . . . . . . . .  G325
      326   CLOSE-FILES. . . . . . . . . .  G646
      365   COLUMN-NAMES-ROUTINE . . . . .  E317
      347   DE-LETE
      312   END-E-1. . . . . . . . . . . .  G306 G311
      338   END-E-2. . . . . . . . . . . .  G330 G337
      369   END-ROUTINE. . . . . . . . . .  P327
      373   END-ROUTINE-1
      382   END-ROUTINE-12
      390   END-ROUTINE-13 . . . . . . . .  E327
      371   END-RTN-EXIT
      346   FAIL
      419   FAIL-ROUTINE . . . . . . . . .  P355
      428   FAIL-ROUTINE-EX. . . . . . . .  E355 G424
      425   FAIL-ROUTINE-WRITE . . . . . .  G420 G421
      361   HEAD-ROUTINE . . . . . . . . .  P317
      344   INSPT
      631   OBSQ3A-END-ROUTINE
      303   OPEN-FILES
      345   PASS
      349   PRINT-DETAIL . . . . . . . . .  P460 P484 P508 P532 P556 P580 P604 P628
      438   SECT-OBSQ3A-0001
      461   SEQ-CLOSE-001
      485   SEQ-CLOSE-002
      509   SEQ-CLOSE-003
      533   SEQ-CLOSE-004
      557   SEQ-CLOSE-005
      581   SEQ-CLOSE-006
      605   SEQ-CLOSE-007
      629   SEQ-CLOSE-008
      439   SEQ-INIT-001
      463   SEQ-INIT-002
      487   SEQ-INIT-003
      511   SEQ-INIT-004
      535   SEQ-INIT-005
      559   SEQ-INIT-006
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    19
0 Defined   Cross-reference of procedures   References

0     583   SEQ-INIT-007
      607   SEQ-INIT-008
      448   SEQ-TEST-001 . . . . . . . . .  G454
      472   SEQ-TEST-002 . . . . . . . . .  G478
      496   SEQ-TEST-003 . . . . . . . . .  G502
      520   SEQ-TEST-004 . . . . . . . . .  G526
      544   SEQ-TEST-005 . . . . . . . . .  G550
      568   SEQ-TEST-006 . . . . . . . . .  G574
      592   SEQ-TEST-007 . . . . . . . . .  G598
      616   SEQ-TEST-008 . . . . . . . . .  G622
      455   SEQ-WRITE-001. . . . . . . . .  G452
      479   SEQ-WRITE-002. . . . . . . . .  G476
      503   SEQ-WRITE-003. . . . . . . . .  G500
      527   SEQ-WRITE-004. . . . . . . . .  G524
      551   SEQ-WRITE-005. . . . . . . . .  G548
      575   SEQ-WRITE-006. . . . . . . . .  G572
      599   SEQ-WRITE-007. . . . . . . . .  G596
      623   SEQ-WRITE-008. . . . . . . . .  G620
      342   TERMINATE-CALL
      340   TERMINATE-CCVS
      634   TERMINATE-OBSQ3A
      402   WRITE-LINE . . . . . . . . . .  P353 P354 P362 P363 P364 P366 P367 P368 P370 P372 P381 P389 P395 P400 P401 P423
                                            P426 P427 P434
      414   WRT-LN . . . . . . . . . . . .  P408 P409 P410 P413 P418
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    20
0 Defined   Cross-reference of programs     References

        3   OBSQ3A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBSQ3A    Date 06/04/2022  Time 12:00:28   Page    21
0LineID  Message code  Message text

     88  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     91  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS1".

     95  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS2".

     99  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS3".

    104  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS4".

    109  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS5".

    113  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS6".

    117  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS7".

    121  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS8".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       9           9
-* Statistics for COBOL program OBSQ3A:
 *    Source records = 646
 *    Data Division statements = 102
 *    Procedure Division statements = 294
 *    Generated COBOL statements = 0
 *    Program complexity factor = 300
0End of compilation 1,  program OBSQ3A,  highest severity 0.
0Return code 0
