1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:39   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:39   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1054.2
   000002         000200 PROGRAM-ID.                                                      IX1054.2
   000003         000300     IX105A.                                                      IX1054.2
   000004         000500*                                                              *  IX1054.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1054.2
   000006         000700*                                                              *  IX1054.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1054.2
   000008         000900*                                                              *  IX1054.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1054.2
   000010         001100*                                                              *  IX1054.2
   000011         001300*GENERAL:    THIS PROGRAM PROCESSES THREE INDEXED I-O FILES       IX1054.2
   000012         001400*            IDENTIFIED AS IX-FR1,IX-FR2 AND IX-FR3.  THE FUNCTIONIX1054.2
   000013         001500*            OF THIS PROGRAM IS TO CREATE THREE INDEXED FILES     IX1054.2
   000014         001600*            RANDOMLLY (ACCESS MODE RANDOM) AND VERIFY THAT THEY  IX1054.2
   000015         001700*            WERE CREATED CORRECTLY.  THE FILES PROCESSED         IX1054.2
   000016         001800*            CONTAIN VARIABLE LENGTH RECORDS.                     IX1054.2
   000017         001900*                                                                 IX1054.2
   000018         002000*            X-CARD PARAMETERS WHICH MUST BE SUPPLIED FOR THIS    IX1054.2
   000019         002100*            PROGRAM ARE:                                         IX1054.2
   000020         002200*                                                                 IX1054.2
   000021         002300*                 X-24   IMPLEMENTOR-NAME IN ASSIGN TO CLAUSE FOR IX1054.2
   000022         002400*                         INDEXED  I-O DATA FILE-1                IX1054.2
   000023         002500*                 X-25   IMPLEMENTOR-NAME IN ASSIGN TO CLAUSE FOR IX1054.2
   000024         002600*                         INDEXED  I-O DATA FILE-2                IX1054.2
   000025         002700*                 X-26   IMPLEMENTOR-NAME IN ASSIGN TO CLAUSE FOR IX1054.2
   000026         002800*                         INDEXED  I-O DATA FILE-3                IX1054.2
   000027         002900*                 X-55   SYSTEM PRINTER                           IX1054.2
   000028         003000*                 X-62   FOR RAW-DATA                             IX1054.2
   000029         003100*                 X-82   SOURCE-COMPUTER                          IX1054.2
   000030         003200*                 X-83   OBJECT-COMPUTER.                         IX1054.2
   000031         003300*                                                                 IX1054.2
   000032         003400*  THIS PROGRAM SHOULD BE RUN ONLY WHEN AN IMPLEMENTATION   *     IX1054.2
   000033         003500*  PROVIDES VARIABLE-LENGTH RECORDS FOR THE RECORD CONTAINS *     IX1054.2
   000034         003600*  INTEGER TO INTEGER CLAUSE.                               *     IX1054.2
   000035         003700*                                                           *     IX1054.2
   000036         003900 ENVIRONMENT DIVISION.                                            IX1054.2
   000037         004000 CONFIGURATION SECTION.                                           IX1054.2
   000038         004100 SOURCE-COMPUTER.                                                 IX1054.2
   000039         004200     XXXXX082.                                                    IX1054.2
   000040         004300 OBJECT-COMPUTER.                                                 IX1054.2
   000041         004400     XXXXX083.                                                    IX1054.2
   000042         004500 INPUT-OUTPUT SECTION.                                            IX1054.2
   000043         004600 FILE-CONTROL.                                                    IX1054.2
   000044         004700     SELECT PRINT-FILE ASSIGN TO                                  IX1054.2 65
   000045         004800     XXXXX055.                                                    IX1054.2
   000046         004900     SELECT IX-FR1 ASSIGN TO                                      IX1054.2 68
   000047         005000     XXXXX024                                                     IX1054.2
   000048         005100             ORGANIZATION IS INDEXED                              IX1054.2
   000049         005200             ACCESS  MODE IS RANDOM                               IX1054.2
   000050         005300              RECORD KEY IS IX-FR1-KEY.                           IX1054.2 73
   000051         005400     SELECT IX-FR2 ASSIGN TO                                      IX1054.2 81
   000052         005500     XXXXX025                                                     IX1054.2
   000053         005600             ORGANIZATION IS INDEXED                              IX1054.2
   000054         005700             ACCESS  MODE IS RANDOM                               IX1054.2
   000055         005800              RECORD KEY IS IX-FR2-KEY.                           IX1054.2 86
   000056         005900     SELECT IX-FR3 ASSIGN TO                                      IX1054.2 94
   000057         006000     XXXXX026                                                     IX1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100             ORGANIZATION IS INDEXED                              IX1054.2
   000059         006200             ACCESS  MODE IS RANDOM                               IX1054.2
   000060         006300              RECORD KEY IS IX-FR3-KEY.                           IX1054.2 100
   000061         006400 I-O-CONTROL.                                                     IX1054.2
   000062         006500     SAME IX-FR2 IX-FR3.                                          IX1054.2 81 94
   000063         006600 DATA DIVISION.                                                   IX1054.2
   000064         006700 FILE SECTION.                                                    IX1054.2
   000065         006800 FD  PRINT-FILE.                                                  IX1054.2

 ==000065==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000066         006900 01  PRINT-REC PICTURE X(120).                                    IX1054.2
   000067         007000 01  DUMMY-RECORD PICTURE X(120).                                 IX1054.2
   000068         007100 FD  IX-FR1                                                       IX1054.2

 ==000068==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000069         007200     LABEL RECORDS ARE STANDARD                                   IX1054.2
   000070         007300     DATA RECORDS ARE GRP-1SEQ-RECORD-1A  GRP-1SEQ-RECORD-1B      IX1054.2 * *
   000071         007400     RECORD CONTAINS 56 TO 100 CHARACTERS.                        IX1054.2
   000072         007500 01  GRP-1SEQ-RECORD-1A.                                          IX1054.2
   000073         007600     02  IX-FR1-KEY              PICTURE X(8).                    IX1054.2
   000074         007700     02  FILLER-1A               PICTURE X(48).                   IX1054.2
   000075         007800 01  GRP-1SEQ-RECORD-1B.                                          IX1054.2
   000076         007900     02  FILLER-1B               PICTURE X(56).                   IX1054.2
   000077         008000     02  LONG-REC-1B.                                             IX1054.2
   000078         008100         03  FILLER              PICTURE X(15).                   IX1054.2
   000079         008200         03  REC-NUMBER-1B       PICTURE XXX.                     IX1054.2
   000080         008300         03  FILLER              PICTURE X(26).                   IX1054.2
   000081         008400 FD  IX-FR2                                                       IX1054.2

 ==000081==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000082         008500     DATA RECORDS  GRP-1SEQ-RECORD-2A  GRP-1SEQ-RECORD-2B         IX1054.2 * *
   000083         008600     LABEL RECORDS ARE STANDARD                                   IX1054.2
   000084         008700     RECORD CONTAINS 56 TO 101 CHARACTERS.                        IX1054.2
   000085         008800 01  GRP-1SEQ-RECORD-2A.                                          IX1054.2
   000086         008900     02  IX-FR2-KEY              PICTURE X(8).                    IX1054.2
   000087         009000     02  FILLER-2A               PICTURE X(48).                   IX1054.2
   000088         009100 01  GRP-1SEQ-RECORD-2B.                                          IX1054.2
   000089         009200     02  FILLER-2B               PICTURE X(56).                   IX1054.2
   000090         009300     02  LONG-REC-2B.                                             IX1054.2
   000091         009400         03  FILLER              PICTURE X(15).                   IX1054.2
   000092         009500         03  REC-NUMBER-2B       PICTURE XXX.                     IX1054.2
   000093         009600         03  FILLER              PICTURE X(27).                   IX1054.2
   000094         009700 FD  IX-FR3                                                       IX1054.2

 ==000094==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000094==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000095         009800     LABEL RECORD STANDARD                                        IX1054.2
   000096         009900     DATA RECORD  GRP-1SEQ-RECORD-3A  GRP-1SEQ-RECORD-3B          IX1054.2 * *
   000097         010000     BLOCK 3 RECORDS                                              IX1054.2
   000098         010100     RECORD CONTAINS 56 TO 102 CHARACTERS.                        IX1054.2
   000099         010200 01  GRP-1SEQ-RECORD-3A.                                          IX1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000100         010300     02  IX-FR3-KEY              PICTURE X(8).                    IX1054.2
   000101         010400     02  FILLER-3A               PICTURE X(48).                   IX1054.2
   000102         010500 01  GRP-1SEQ-RECORD-3B.                                          IX1054.2
   000103         010600     02  FILLER-3B               PICTURE X(56).                   IX1054.2
   000104         010700     02  LONG-REC-3B.                                             IX1054.2
   000105         010800         03  FILLER              PICTURE X(15).                   IX1054.2
   000106         010900         03  REC-NUMBER-3B       PICTURE XXX.                     IX1054.2
   000107         011000     02  FILLER                  PICTURE X(28).                   IX1054.2
   000108         011100 WORKING-STORAGE SECTION.                                         IX1054.2
   000109         011200 01  SHORT-SW                    PICTURE 9 VALUE ZERO.            IX1054.2 IMP
   000110         011300 01  RECORD-BUILD.                                                IX1054.2
   000111         011400     02  KEY-BUILD.                                               IX1054.2
   000112         011500         03  KEY-NAME            PICTURE X(3) VALUE "KEY".        IX1054.2
   000113         011600         03  KEY-VALUE           PICTURE 9(5) VALUE ZERO.         IX1054.2 IMP
   000114         011700     02  FILLER                  PICTURE X(6) VALUE " FILE ".     IX1054.2
   000115         011800     02  FILE-NO                 PICTURE 99 VALUE ZERO.           IX1054.2 IMP
   000116         011900     02  FILLER                  PICTURE X(14)  VALUE             IX1054.2
   000117         012000     "  RECORD TYPE ".                                            IX1054.2
   000118         012100     02  RECORD-LONG-OR-SHORT    PICTURE X(5) VALUE "SHORT".      IX1054.2
   000119         012200     02  FILLER                  PICTURE X(21) VALUE SPACE.       IX1054.2 IMP
   000120         012300     02  RECORD-LONG-ONLY.                                        IX1054.2
   000121         012400         03  FILLER              PICTURE X(15)  VALUE             IX1054.2
   000122         012500         " RECORD NUMBER ".                                       IX1054.2
   000123         012600         03  THREE-POS-NUM       PICTURE 999 VALUE ZERO.          IX1054.2 IMP
   000124         012700         03  FILLER-LONG         PICTURE X(28)  VALUE             IX1054.2
   000125         012800         " AREA USED FOR LONG RECORD  ".                          IX1054.2
   000126         012900 01  FILE-RECORD-INFORMATION-REC.                                 IX1054.2
   000127         013000     03 FILE-RECORD-INFO-SKELETON.                                IX1054.2
   000128         013100        05 FILLER                 PICTURE X(48)       VALUE       IX1054.2
   000129         013200             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX1054.2
   000130         013300        05 FILLER                 PICTURE X(46)       VALUE       IX1054.2
   000131         013400             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX1054.2
   000132         013500        05 FILLER                 PICTURE X(26)       VALUE       IX1054.2
   000133         013600             ",LFIL=000000,ORG=  ,LBLR= ".                        IX1054.2
   000134         013700        05 FILLER                 PICTURE X(37)       VALUE       IX1054.2
   000135         013800             ",RECKEY=                             ".             IX1054.2
   000136         013900        05 FILLER                 PICTURE X(38)       VALUE       IX1054.2
   000137         014000             ",ALTKEY1=                             ".            IX1054.2
   000138         014100        05 FILLER                 PICTURE X(38)       VALUE       IX1054.2
   000139         014200             ",ALTKEY2=                             ".            IX1054.2
   000140         014300        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX1054.2 IMP
   000141         014400     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX1054.2
   000142         014500        05 FILE-RECORD-INFO-P1-120.                               IX1054.2
   000143         014600           07 FILLER              PIC X(5).                       IX1054.2
   000144         014700           07 XFILE-NAME           PIC X(6).                      IX1054.2
   000145         014800           07 FILLER              PIC X(8).                       IX1054.2
   000146         014900           07 XRECORD-NAME         PIC X(6).                      IX1054.2
   000147         015000           07 FILLER              PIC X(1).                       IX1054.2
   000148         015100           07 REELUNIT-NUMBER     PIC 9(1).                       IX1054.2
   000149         015200           07 FILLER              PIC X(7).                       IX1054.2
   000150         015300           07 XRECORD-NUMBER       PIC 9(6).                      IX1054.2
   000151         015400           07 FILLER              PIC X(6).                       IX1054.2
   000152         015500           07 UPDATE-NUMBER       PIC 9(2).                       IX1054.2
   000153         015600           07 FILLER              PIC X(5).                       IX1054.2
   000154         015700           07 ODO-NUMBER          PIC 9(4).                       IX1054.2
   000155         015800           07 FILLER              PIC X(5).                       IX1054.2
   000156         015900           07 XPROGRAM-NAME        PIC X(5).                      IX1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000157         016000           07 FILLER              PIC X(7).                       IX1054.2
   000158         016100           07 XRECORD-LENGTH       PIC 9(6).                      IX1054.2
   000159         016200           07 FILLER              PIC X(7).                       IX1054.2
   000160         016300           07 CHARS-OR-RECORDS    PIC X(2).                       IX1054.2
   000161         016400           07 FILLER              PIC X(1).                       IX1054.2
   000162         016500           07 XBLOCK-SIZE          PIC 9(4).                      IX1054.2
   000163         016600           07 FILLER              PIC X(6).                       IX1054.2
   000164         016700           07 RECORDS-IN-FILE     PIC 9(6).                       IX1054.2
   000165         016800           07 FILLER              PIC X(5).                       IX1054.2
   000166         016900           07 XFILE-ORGANIZATION   PIC X(2).                      IX1054.2
   000167         017000           07 FILLER              PIC X(6).                       IX1054.2
   000168         017100           07 XLABEL-TYPE          PIC X(1).                      IX1054.2
   000169         017200        05 FILE-RECORD-INFO-P121-240.                             IX1054.2
   000170         017300           07 FILLER              PIC X(8).                       IX1054.2
   000171         017400           07 XRECORD-KEY          PIC X(29).                     IX1054.2
   000172         017500           07 FILLER              PIC X(9).                       IX1054.2
   000173         017600           07 ALTERNATE-KEY1      PIC X(29).                      IX1054.2
   000174         017700           07 FILLER              PIC X(9).                       IX1054.2
   000175         017800           07 ALTERNATE-KEY2      PIC X(29).                      IX1054.2
   000176         017900           07 FILLER              PIC X(7).                       IX1054.2
   000177         018000 01  TEST-RESULTS.                                                IX1054.2
   000178         018100     02 FILLER                   PIC X      VALUE SPACE.          IX1054.2 IMP
   000179         018200     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1054.2 IMP
   000180         018300     02 FILLER                   PIC X      VALUE SPACE.          IX1054.2 IMP
   000181         018400     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1054.2 IMP
   000182         018500     02 FILLER                   PIC X      VALUE SPACE.          IX1054.2 IMP
   000183         018600     02  PAR-NAME.                                                IX1054.2
   000184         018700       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1054.2 IMP
   000185         018800       03  PARDOT-X              PIC X      VALUE SPACE.          IX1054.2 IMP
   000186         018900       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1054.2 IMP
   000187         019000     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1054.2 IMP
   000188         019100     02 RE-MARK                  PIC X(61).                       IX1054.2
   000189         019200 01  TEST-COMPUTED.                                               IX1054.2
   000190         019300     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1054.2 IMP
   000191         019400     02 FILLER                   PIC X(17)  VALUE                 IX1054.2
   000192         019500            "       COMPUTED=".                                   IX1054.2
   000193         019600     02 COMPUTED-X.                                               IX1054.2
   000194         019700     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1054.2 IMP
   000195         019800     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1054.2 194
   000196         019900                                 PIC -9(9).9(9).                  IX1054.2
   000197         020000     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1054.2 194
   000198         020100     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1054.2 194
   000199         020200     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1054.2 194
   000200         020300     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1054.2 194
   000201         020400         04 COMPUTED-18V0                    PIC -9(18).          IX1054.2
   000202         020500         04 FILLER                           PIC X.               IX1054.2
   000203         020600     03 FILLER PIC X(50) VALUE SPACE.                             IX1054.2 IMP
   000204         020700 01  TEST-CORRECT.                                                IX1054.2
   000205         020800     02 FILLER PIC X(30) VALUE SPACE.                             IX1054.2 IMP
   000206         020900     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1054.2
   000207         021000     02 CORRECT-X.                                                IX1054.2
   000208         021100     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1054.2 IMP
   000209         021200     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1054.2 208
   000210         021300     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1054.2 208
   000211         021400     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1054.2 208
   000212         021500     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1054.2 208
   000213         021600     03      CR-18V0 REDEFINES CORRECT-A.                         IX1054.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000214         021700         04 CORRECT-18V0                     PIC -9(18).          IX1054.2
   000215         021800         04 FILLER                           PIC X.               IX1054.2
   000216         021900     03 FILLER PIC X(2) VALUE SPACE.                              IX1054.2 IMP
   000217         022000     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1054.2 IMP
   000218         022100 01  CCVS-C-1.                                                    IX1054.2
   000219         022200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1054.2
   000220         022300-    "SS  PARAGRAPH-NAME                                          IX1054.2
   000221         022400-    "       REMARKS".                                            IX1054.2
   000222         022500     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1054.2 IMP
   000223         022600 01  CCVS-C-2.                                                    IX1054.2
   000224         022700     02 FILLER                     PIC X        VALUE SPACE.      IX1054.2 IMP
   000225         022800     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1054.2
   000226         022900     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1054.2 IMP
   000227         023000     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1054.2
   000228         023100     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1054.2 IMP
   000229         023200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1054.2 IMP
   000230         023300 01  REC-CT                        PIC 99       VALUE ZERO.       IX1054.2 IMP
   000231         023400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1054.2 IMP
   000232         023500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1054.2 IMP
   000233         023600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1054.2 IMP
   000234         023700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1054.2 IMP
   000235         023800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1054.2 IMP
   000236         023900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1054.2 IMP
   000237         024000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1054.2 IMP
   000238         024100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1054.2 IMP
   000239         024200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1054.2 IMP
   000240         024300 01  CCVS-H-1.                                                    IX1054.2
   000241         024400     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1054.2 IMP
   000242         024500     02  FILLER                    PIC X(42)    VALUE             IX1054.2
   000243         024600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1054.2
   000244         024700     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1054.2 IMP
   000245         024800 01  CCVS-H-2A.                                                   IX1054.2
   000246         024900   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1054.2 IMP
   000247         025000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1054.2
   000248         025100   02  FILLER                        PIC XXXX   VALUE             IX1054.2
   000249         025200     "4.2 ".                                                      IX1054.2
   000250         025300   02  FILLER                        PIC X(28)  VALUE             IX1054.2
   000251         025400            " COPY - NOT FOR DISTRIBUTION".                       IX1054.2
   000252         025500   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1054.2 IMP
   000253         025600                                                                  IX1054.2
   000254         025700 01  CCVS-H-2B.                                                   IX1054.2
   000255         025800   02  FILLER                        PIC X(15)  VALUE             IX1054.2
   000256         025900            "TEST RESULT OF ".                                    IX1054.2
   000257         026000   02  TEST-ID                       PIC X(9).                    IX1054.2
   000258         026100   02  FILLER                        PIC X(4)   VALUE             IX1054.2
   000259         026200            " IN ".                                               IX1054.2
   000260         026300   02  FILLER                        PIC X(12)  VALUE             IX1054.2
   000261         026400     " HIGH       ".                                              IX1054.2
   000262         026500   02  FILLER                        PIC X(22)  VALUE             IX1054.2
   000263         026600            " LEVEL VALIDATION FOR ".                             IX1054.2
   000264         026700   02  FILLER                        PIC X(58)  VALUE             IX1054.2
   000265         026800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1054.2
   000266         026900 01  CCVS-H-3.                                                    IX1054.2
   000267         027000     02  FILLER                      PIC X(34)  VALUE             IX1054.2
   000268         027100            " FOR OFFICIAL USE ONLY    ".                         IX1054.2
   000269         027200     02  FILLER                      PIC X(58)  VALUE             IX1054.2
   000270         027300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000271         027400     02  FILLER                      PIC X(28)  VALUE             IX1054.2
   000272         027500            "  COPYRIGHT   1985 ".                                IX1054.2
   000273         027600 01  CCVS-E-1.                                                    IX1054.2
   000274         027700     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1054.2 IMP
   000275         027800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1054.2
   000276         027900     02 ID-AGAIN                     PIC X(9).                    IX1054.2
   000277         028000     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1054.2 IMP
   000278         028100 01  CCVS-E-2.                                                    IX1054.2
   000279         028200     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1054.2 IMP
   000280         028300     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1054.2 IMP
   000281         028400     02 CCVS-E-2-2.                                               IX1054.2
   000282         028500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1054.2 IMP
   000283         028600         03 FILLER                   PIC X      VALUE SPACE.      IX1054.2 IMP
   000284         028700         03 ENDER-DESC               PIC X(44)  VALUE             IX1054.2
   000285         028800            "ERRORS ENCOUNTERED".                                 IX1054.2
   000286         028900 01  CCVS-E-3.                                                    IX1054.2
   000287         029000     02  FILLER                      PIC X(22)  VALUE             IX1054.2
   000288         029100            " FOR OFFICIAL USE ONLY".                             IX1054.2
   000289         029200     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1054.2 IMP
   000290         029300     02  FILLER                      PIC X(58)  VALUE             IX1054.2
   000291         029400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1054.2
   000292         029500     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1054.2 IMP
   000293         029600     02 FILLER                       PIC X(15)  VALUE             IX1054.2
   000294         029700             " COPYRIGHT 1985".                                   IX1054.2
   000295         029800 01  CCVS-E-4.                                                    IX1054.2
   000296         029900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1054.2 IMP
   000297         030000     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1054.2
   000298         030100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1054.2 IMP
   000299         030200     02 FILLER                       PIC X(40)  VALUE             IX1054.2
   000300         030300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1054.2
   000301         030400 01  XXINFO.                                                      IX1054.2
   000302         030500     02 FILLER                       PIC X(19)  VALUE             IX1054.2
   000303         030600            "*** INFORMATION ***".                                IX1054.2
   000304         030700     02 INFO-TEXT.                                                IX1054.2
   000305         030800       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1054.2 IMP
   000306         030900       04 XXCOMPUTED                 PIC X(20).                   IX1054.2
   000307         031000       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1054.2 IMP
   000308         031100       04 XXCORRECT                  PIC X(20).                   IX1054.2
   000309         031200     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1054.2
   000310         031300 01  HYPHEN-LINE.                                                 IX1054.2
   000311         031400     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1054.2 IMP
   000312         031500     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1054.2
   000313         031600-    "*****************************************".                 IX1054.2
   000314         031700     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1054.2
   000315         031800-    "******************************".                            IX1054.2
   000316         031900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1054.2
   000317         032000     "IX105A".                                                    IX1054.2
   000318         032100 PROCEDURE DIVISION.                                              IX1054.2
   000319         032200 CCVS1 SECTION.                                                   IX1054.2
   000320         032300 OPEN-FILES.                                                      IX1054.2
   000321         032400     OPEN    OUTPUT PRINT-FILE.                                   IX1054.2 65
   000322         032500     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1054.2 316 257 316 276
   000323         032600     MOVE    SPACE TO TEST-RESULTS.                               IX1054.2 IMP 177
   000324         032700     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1054.2 354 359
   000325         032800     MOVE    ZERO TO REC-SKL-SUB.                                 IX1054.2 IMP 229
   000326         032900     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1054.2 327
   000327         033000 CCVS-INIT-FILE.                                                  IX1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000328         033100     ADD     1 TO REC-SKL-SUB.                                    IX1054.2 229
   000329         033200     MOVE    FILE-RECORD-INFO-SKELETON                            IX1054.2 127
   000330         033300          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1054.2 141 229
   000331         033400 CCVS-INIT-EXIT.                                                  IX1054.2
   000332         033500     GO TO CCVS1-EXIT.                                            IX1054.2 441
   000333         033600 CLOSE-FILES.                                                     IX1054.2
   000334         033700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1054.2 363 384 65
   000335         033800 TERMINATE-CCVS.                                                  IX1054.2
   000336         033900     STOP     RUN.                                                IX1054.2
   000337         034000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1054.2 181 233
   000338         034100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1054.2 181 234
   000339         034200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1054.2 181 232
   000340         034300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1054.2 181 231
   000341         034400     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1054.2 188
   000342         034500 PRINT-DETAIL.                                                    IX1054.2
   000343         034600     IF REC-CT NOT EQUAL TO ZERO                                  IX1054.2 230 IMP
   000344      1  034700             MOVE "." TO PARDOT-X                                 IX1054.2 185
   000345      1  034800             MOVE REC-CT TO DOTVALUE.                             IX1054.2 230 186
   000346         034900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1054.2 177 66 396
   000347         035000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1054.2 181 396
   000348      1  035100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1054.2 417 431
   000349      1  035200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1054.2 432 440
   000350         035300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1054.2 IMP 181 IMP 193
   000351         035400     MOVE SPACE TO CORRECT-X.                                     IX1054.2 IMP 207
   000352         035500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1054.2 230 IMP IMP 183
   000353         035600     MOVE     SPACE TO RE-MARK.                                   IX1054.2 IMP 188
   000354         035700 HEAD-ROUTINE.                                                    IX1054.2
   000355         035800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1054.2 240 67 396
   000356         035900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1054.2 245 67 396
   000357         036000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1054.2 254 67 396
   000358         036100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1054.2 266 67 396
   000359         036200 COLUMN-NAMES-ROUTINE.                                            IX1054.2
   000360         036300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1054.2 218 67 396
   000361         036400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1054.2 223 67 396
   000362         036500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1054.2 310 67 396
   000363         036600 END-ROUTINE.                                                     IX1054.2
   000364         036700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1054.2 310 67 396
   000365         036800 END-RTN-EXIT.                                                    IX1054.2
   000366         036900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1054.2 273 67 396
   000367         037000 END-ROUTINE-1.                                                   IX1054.2
   000368         037100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1054.2 232 236 233
   000369         037200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1054.2 236 231 236
   000370         037300      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1054.2 234 236
   000371         037400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1054.2
   000372         037500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1054.2 234 296
   000373         037600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1054.2 236 298
   000374         037700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1054.2 295 281
   000375         037800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1054.2 278 67 396
   000376         037900  END-ROUTINE-12.                                                 IX1054.2
   000377         038000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1054.2 284
   000378         038100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1054.2 232 IMP
   000379      1  038200         MOVE "NO " TO ERROR-TOTAL                                IX1054.2 282
   000380         038300         ELSE                                                     IX1054.2
   000381      1  038400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1054.2 232 282
   000382         038500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1054.2 278 67
   000383         038600     PERFORM WRITE-LINE.                                          IX1054.2 396
   000384         038700 END-ROUTINE-13.                                                  IX1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000385         038800     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1054.2 231 IMP
   000386      1  038900         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1054.2 282
   000387      1  039000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1054.2 231 282
   000388         039100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1054.2 284
   000389         039200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1054.2 278 67 396
   000390         039300      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1054.2 233 IMP
   000391      1  039400          MOVE "NO " TO ERROR-TOTAL                               IX1054.2 282
   000392      1  039500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1054.2 233 282
   000393         039600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1054.2 284
   000394         039700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1054.2 278 67 396
   000395         039800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1054.2 286 67 396
   000396         039900 WRITE-LINE.                                                      IX1054.2
   000397         040000     ADD 1 TO RECORD-COUNT.                                       IX1054.2 238
   000398         040100     IF RECORD-COUNT GREATER 42                                   IX1054.2 238
   000399      1  040200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1054.2 67 237
   000400      1  040300         MOVE SPACE TO DUMMY-RECORD                               IX1054.2 IMP 67
   000401      1  040400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1054.2 67
   000402      1  040500         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1054.2 240 67 412
   000403      1  040600         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1054.2 245 67 412
   000404      1  040700         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1054.2 254 67 412
   000405      1  040800         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1054.2 266 67 412
   000406      1  040900         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1054.2 218 67 412
   000407      1  041000         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1054.2 223 67 412
   000408      1  041100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1054.2 310 67 412
   000409      1  041200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1054.2 237 67
   000410      1  041300         MOVE ZERO TO RECORD-COUNT.                               IX1054.2 IMP 238
   000411         041400     PERFORM WRT-LN.                                              IX1054.2 412
   000412         041500 WRT-LN.                                                          IX1054.2
   000413         041600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1054.2 67
   000414         041700     MOVE SPACE TO DUMMY-RECORD.                                  IX1054.2 IMP 67
   000415         041800 BLANK-LINE-PRINT.                                                IX1054.2
   000416         041900     PERFORM WRT-LN.                                              IX1054.2 412
   000417         042000 FAIL-ROUTINE.                                                    IX1054.2
   000418         042100     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1054.2 193 IMP
   000419      1  042200            GO TO   FAIL-ROUTINE-WRITE.                           IX1054.2 426
   000420         042300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1054.2 207 IMP 426
   000421         042400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1054.2 239 309
   000422         042500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1054.2 304
   000423         042600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1054.2 301 67 396
   000424         042700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1054.2 IMP 309
   000425         042800     GO TO  FAIL-ROUTINE-EX.                                      IX1054.2 431
   000426         042900 FAIL-ROUTINE-WRITE.                                              IX1054.2
   000427         043000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1054.2 189 66 396
   000428         043100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1054.2 239 217
   000429         043200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1054.2 204 66 396
   000430         043300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1054.2 IMP 217
   000431         043400 FAIL-ROUTINE-EX. EXIT.                                           IX1054.2
   000432         043500 BAIL-OUT.                                                        IX1054.2
   000433         043600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1054.2 194 IMP 435
   000434         043700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1054.2 208 IMP 440
   000435         043800 BAIL-OUT-WRITE.                                                  IX1054.2
   000436         043900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1054.2 208 308 194 306
   000437         044000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1054.2 239 309
   000438         044100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1054.2 301 67 396
   000439         044200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1054.2 IMP 309
   000440         044300 BAIL-OUT-EX. EXIT.                                               IX1054.2
   000441         044400 CCVS1-EXIT.                                                      IX1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000442         044500     EXIT.                                                        IX1054.2
   000443         044600 SECT-RC-02-001 SECTION.                                          IX1054.2
   000444         044700 WRITE-INIT-GF-01.                                                IX1054.2
   000445         044800     MOVE "WRITE SHORT & LONG " TO FEATURE.                       IX1054.2 179
   000446         044900     MOVE "WRITE-TEST-GF-01" TO PAR-NAME.                         IX1054.2 183
   000447         045000 WRITE-TEST-GF-01.                                                IX1054.2
   000448         045100*    CREATE AN INDEXED FILE OF 180 RECORDS.  THE RECORDS SIZE IS  IX1054.2
   000449         045200*    VARIABLE LENGTH (056 TO 100 CHARACTERS).                     IX1054.2
   000450         045300     MOVE 1 TO FILE-NO.                                           IX1054.2 115
   000451         045400     OPEN OUTPUT IX-FR1.                                          IX1054.2 68
   000452         045500     PERFORM WRITE-TEST-GF-01-SHORT-REC 20 TIMES.                 IX1054.2 476
   000453         045600     PERFORM WRITE-TEST-GF-01-LONG-REC 45 TIMES.                  IX1054.2 469
   000454         045700     PERFORM WRITE-TEST-GF-01-SHORT-REC 50 TIMES.                 IX1054.2 476
   000455         045800     PERFORM WRITE-TEST-GF-01-LONG-REC 29 TIMES.                  IX1054.2 469
   000456         045900     PERFORM WRITE-TEST-GF-01-SHORT-REC 35 TIMES.                 IX1054.2 476
   000457         046000     PERFORM WRITE-TEST-GF-01-LONG-REC.                           IX1054.2 469
   000458         046100     IF THREE-POS-NUM EQUAL 180                                   IX1054.2 123
   000459      1  046200        PERFORM PASS                                              IX1054.2 338
   000460      1  046300        MOVE "FILE IX-FR1 CREATED (180 RECORDS)" TO RE-MARK       IX1054.2 188
   000461      1  046400        GO TO WRITE-TEST-GF-01-WRITE.                             IX1054.2 488
   000462         046500     MOVE "WRONG NUMBER OF RECORDS WRITTEN" TO RE-MARK.           IX1054.2 188
   000463         046600     GO TO WRITE-TEST-GF-01-FAIL.                                 IX1054.2 483
   000464         046700 WRITE-DELETE-GF-01.                                              IX1054.2
   000465         046800     PERFORM DE-LETE.                                             IX1054.2 340
   000466         046900*    NOTE IX-FR1 IS NOT CREATED  SO SKIP TO WRITE-TEST-5.         IX1054.2
   000467         047000     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000468         047100     GO TO WRITE-INIT-GF-02.                                      IX1054.2 588
   000469         047200 WRITE-TEST-GF-01-LONG-REC.                                       IX1054.2
   000470         047300     ADD 1 TO KEY-VALUE  THREE-POS-NUM.                           IX1054.2 113 123
   000471         047400     MOVE "LONG " TO RECORD-LONG-OR-SHORT.                        IX1054.2 118
   000472         047500     MOVE RECORD-BUILD TO GRP-1SEQ-RECORD-1B.                     IX1054.2 110 75
   000473         047600     WRITE GRP-1SEQ-RECORD-1B INVALID KEY                         IX1054.2 75
   000474      1  047700        MOVE "INVALID KEY ON WRITE (LONG)" TO RE-MARK             IX1054.2 188
   000475      1  047800        GO TO WRITE-TEST-GF-01-FAIL.                              IX1054.2 483
   000476         047900 WRITE-TEST-GF-01-SHORT-REC.                                      IX1054.2
   000477         048000     ADD 1 TO KEY-VALUE  THREE-POS-NUM.                           IX1054.2 113 123
   000478         048100     MOVE "SHORT" TO RECORD-LONG-OR-SHORT.                        IX1054.2 118
   000479         048200     MOVE RECORD-BUILD TO GRP-1SEQ-RECORD-1B.                     IX1054.2 110 75
   000480         048300     WRITE GRP-1SEQ-RECORD-1A INVALID KEY                         IX1054.2 72
   000481      1  048400        MOVE "INVALID KEY ON WRITE (SHORT)" TO RE-MARK            IX1054.2 188
   000482      1  048500        GO TO WRITE-TEST-GF-01-FAIL.                              IX1054.2 483
   000483         048600 WRITE-TEST-GF-01-FAIL.                                           IX1054.2
   000484         048700     MOVE "IX-41 4.9.2 WRONG NUMBER OF RECORDS WRITTEN" TO RE-MARKIX1054.2 188
   000485         048800     PERFORM FAIL.                                                IX1054.2 339
   000486         048900     MOVE 180 TO CORRECT-18V0.                                    IX1054.2 214
   000487         049000     MOVE THREE-POS-NUM TO COMPUTED-18V0.                         IX1054.2 123 201
   000488         049100 WRITE-TEST-GF-01-WRITE.                                          IX1054.2
   000489         049200     MOVE SPACE TO GRP-1SEQ-RECORD-1B.                            IX1054.2 IMP 75
   000490         049300     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000491         049400     CLOSE IX-FR1.                                                IX1054.2 68
   000492         049500 READ-INIT-F2-01.                                                 IX1054.2
   000493         049600     MOVE "READ TO VERIFY     " TO FEATURE.                       IX1054.2 179
   000494         049700     MOVE "READ-TEST-F2-01    " TO PAR-NAME.                      IX1054.2 183
   000495         049800*    VERIFY NUMBER OF RECORDS IN FILE.                            IX1054.2
   000496         049900     OPEN INPUT IX-FR1.                                           IX1054.2 68
   000497         050000     MOVE 1 TO KEY-VALUE.                                         IX1054.2 113
   000498         050100     MOVE KEY-BUILD TO IX-FR1-KEY.                                IX1054.2 111 73
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000499         050200 READ-TEST-F2-01.                                                 IX1054.2
   000500         050300     READ IX-FR1 INVALID KEY                                      IX1054.2 68
   000501      1  050400        GO TO COMPARE-FOR-TEST-F2-01.                             IX1054.2 507
   000502         050500     ADD 1 TO KEY-VALUE.                                          IX1054.2 113
   000503         050600     MOVE KEY-BUILD TO IX-FR1-KEY.                                IX1054.2 111 73
   000504         050700     IF KEY-VALUE GREATER THAN 181                                IX1054.2 113
   000505      1  050800        GO TO READ-FAIL-F2-01.                                    IX1054.2 512
   000506         050900     GO TO READ-TEST-F2-01.                                       IX1054.2 499
   000507         051000 COMPARE-FOR-TEST-F2-01.                                          IX1054.2
   000508         051100     IF KEY-VALUE EQUAL 181                                       IX1054.2 113
   000509      1  051200         PERFORM PASS                                             IX1054.2 338
   000510      1  051300         MOVE "180 RECORDS VERIFIED" TO RE-MARK                   IX1054.2 188
   000511      1  051400         GO TO READ-WRITE-F2-01.                                  IX1054.2 519
   000512         051500 READ-FAIL-F2-01.                                                 IX1054.2
   000513         051600     MOVE "IX-28 4.5.2                               " TO RE-MARK.IX1054.2 188
   000514         051700     PERFORM FAIL.                                                IX1054.2 339
   000515         051800     MOVE 180 TO CORRECT-18V0.                                    IX1054.2 214
   000516         051900     SUBTRACT 1 FROM KEY-VALUE.                                   IX1054.2 113
   000517         052000     MOVE KEY-VALUE TO COMPUTED-18V0.                             IX1054.2 113 201
   000518         052100     MOVE "INCORRECT NUMBER OF RECORDS" TO RE-MARK.               IX1054.2 188
   000519         052200 READ-WRITE-F2-01.                                                IX1054.2
   000520         052300     MOVE "READ-TEST-F2-01" TO PAR-NAME.                          IX1054.2 183
   000521         052400     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000522         052500     CLOSE IX-FR1.                                                IX1054.2 68
   000523         052600 READ-INIT-F2-02.                                                 IX1054.2
   000524         052700     OPEN INPUT IX-FR1.                                           IX1054.2 68
   000525         052800     MOVE 10 TO KEY-VALUE.                                        IX1054.2 113
   000526         052900     MOVE KEY-BUILD TO IX-FR1-KEY.                                IX1054.2 111 73
   000527         053000     MOVE "READ  SHORT RECORDS" TO FEATURE.                       IX1054.2 179
   000528         053100     MOVE "READ-TEST-GF-02    " TO PAR-NAME.                      IX1054.2 183
   000529         053200 READ-TEST-F2-02.                                                 IX1054.2
   000530         053300*    VERIFY VARIABLE LENGTH RECORDS WERE CREATED BY TESTING       IX1054.2
   000531         053400*    SHORT RECORD.                                                IX1054.2
   000532         053500     READ IX-FR1 INVALID KEY                                      IX1054.2 68
   000533      1  053600         PERFORM FAIL                                             IX1054.2 339
   000534      1  053700         MOVE "KEY00010" TO CORRECT-A                             IX1054.2 208
   000535      1  053800         MOVE "***INVALID KEY***" TO COMPUTED-A                   IX1054.2 194
   000536      1  053900         MOVE "INVALID KEY IX-FR1 IX-28 4.5.2" TO RE-MARK         IX1054.2 188
   000537      1  054000         GO TO READ-TEST-F2-02-WRITE.                             IX1054.2 549
   000538         054100*    NOTE  *** IF REC-NUMBER-1B CONTAINS THE RECORD NUMBER        IX1054.2
   000539         054200*          THEN FIXED LENGTH RECORDS WERE WRITTEN INSTEAD         IX1054.2
   000540         054300*          OF VARIABLE LENGTH RECORDS.                            IX1054.2
   000541         054400*    NOTE  CHECK LENGTH OF RECORD 10.                             IX1054.2
   000542         054500 COMPARE-FOR-TEST-F2-02.                                          IX1054.2
   000543         054600     IF REC-NUMBER-1B EQUAL TO "010"                              IX1054.2 79
   000544      1  054700        MOVE "LONG RECORD CREATED" TO COMPUTED-A                  IX1054.2 194
   000545      1  054800     ELSE MOVE "SHORT RECORD CREATED" TO COMPUTED-A               IX1054.2 194
   000546      1  054900          MOVE 1 TO SHORT-SW.                                     IX1054.2 109
   000547         055000     MOVE "EXPECT SHORT RECORD" TO CORRECT-A.                     IX1054.2 208
   000548         055100     MOVE "INFO ONLY-SEE PROGRAM" TO RE-MARK.                     IX1054.2 188
   000549         055200 READ-TEST-F2-02-WRITE.                                           IX1054.2
   000550         055300     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000551         055400     CLOSE IX-FR1.                                                IX1054.2 68
   000552         055500 READ-INIT-F2-03.                                                 IX1054.2
   000553         055600*    VERIFY VARIABLE LENGTH RECORDS WERE CREATED BY TESTING       IX1054.2
   000554         055700*    LONG RECORD.                                                 IX1054.2
   000555         055800     OPEN INPUT IX-FR1.                                           IX1054.2 68
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000556         055900     MOVE 144 TO KEY-VALUE.                                       IX1054.2 113
   000557         056000     MOVE KEY-BUILD TO IX-FR1-KEY.                                IX1054.2 111 73
   000558         056100     MOVE "READ LONG   RECORDS" TO FEATURE.                       IX1054.2 179
   000559         056200     MOVE "READ-TEST-F2-03    " TO PAR-NAME.                      IX1054.2 183
   000560         056300 READ-TEST-F2-03.                                                 IX1054.2
   000561         056400     READ IX-FR1 INVALID KEY                                      IX1054.2 68
   000562      1  056500         PERFORM FAIL                                             IX1054.2 339
   000563      1  056600         MOVE "KEY00144" TO CORRECT-A                             IX1054.2 208
   000564      1  056700         MOVE "***INVALID KEY***" TO COMPUTED-A                   IX1054.2 194
   000565      1  056800         MOVE "INVAILD KEY IX-FR1" TO RE-MARK                     IX1054.2 188
   000566      1  056900         GO TO READ-WRITE-F2-03.                                  IX1054.2 584
   000567         057000*    NOTE  *** IF REC-NUMBER-1B CONTAINS THE RECORD NUMBER        IX1054.2
   000568         057100*              THEN LONG RECORDS WERE WRITTEN.                    IX1054.2
   000569         057200 COMPARE-FOR-TEST-F2-03.                                          IX1054.2
   000570         057300     IF REC-NUMBER-1B NOT EQUAL TO "144" GO TO READ-FAIL-F2-03.   IX1054.2 79 579
   000571         057400     PERFORM PASS.                                                IX1054.2 338
   000572         057500     PERFORM READ-WRITE-F2-03.                                    IX1054.2 584
   000573         057600     MOVE "EXPECT VARIABLE LTH" TO CORRECT-A.                     IX1054.2 208
   000574         057700     MOVE "INFO ONLY-SEE PROGRAM" TO RE-MARK.                     IX1054.2 188
   000575         057800     IF SHORT-SW EQUAL TO ZERO                                    IX1054.2 109 IMP
   000576      1  057900        MOVE "FIXED RECORD CREATED" TO COMPUTED-A                 IX1054.2 194
   000577      1  058000        ELSE MOVE "VARIABLE LTH CREATED" TO COMPUTED-A.           IX1054.2 194
   000578         058100     GO TO READ-WRITE-F2-03.                                      IX1054.2 584
   000579         058200 READ-FAIL-F2-03.                                                 IX1054.2
   000580         058300     PERFORM FAIL.                                                IX1054.2 339
   000581         058400     MOVE "KEY00144" TO CORRECT-A.                                IX1054.2 208
   000582         058500     MOVE IX-FR1-KEY TO COMPUTED-A.                               IX1054.2 73 194
   000583         058600     MOVE "WRONG LENGTH OR WRONG RECORD IX-28 4.5.2" TO RE-MARK.  IX1054.2 188
   000584         058700 READ-WRITE-F2-03.                                                IX1054.2
   000585         058800     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000586         058900 READ-TEST-F2-03-EXIT.                                            IX1054.2
   000587         059000     CLOSE  IX-FR1.                                               IX1054.2 68
   000588         059100 WRITE-INIT-GF-02.                                                IX1054.2
   000589         059200     MOVE "WRITE IX-FS2       " TO FEATURE.                       IX1054.2 179
   000590         059300     MOVE "WRITE-TEST-GF-02    " TO PAR-NAME.                     IX1054.2 183
   000591         059400*    CREATE AN INDEXED FILE OF 101 RECORDS.  THE RECORD SIZE IS   IX1054.2
   000592         059500*    VARIABLE LENGTH (056 TO 101 CHARACTERS).                     IX1054.2
   000593         059600     MOVE ZERO TO KEY-VALUE  THREE-POS-NUM  SHORT-SW.             IX1054.2 IMP 113 123 109
   000594         059700     MOVE 2 TO FILE-NO.                                           IX1054.2 115
   000595         059800     OPEN OUTPUT IX-FR2.                                          IX1054.2 81
   000596         059900 WRITE-TEST-GF-02.                                                IX1054.2
   000597         060000     PERFORM WRITE-TEST-GF-02-SHORT-REC 11 TIMES.                 IX1054.2 621
   000598         060100     PERFORM WRITE-TEST-GF-02-LONG-REC 29 TIMES.                  IX1054.2 614
   000599         060200     PERFORM WRITE-TEST-GF-02-SHORT-REC 20 TIMES.                 IX1054.2 621
   000600         060300     PERFORM WRITE-TEST-GF-02-LONG-REC 20 TIMES.                  IX1054.2 614
   000601         060400     PERFORM WRITE-TEST-GF-02-SHORT-REC 20 TIMES.                 IX1054.2 621
   000602         060500     PERFORM WRITE-TEST-GF-02-LONG-REC.                           IX1054.2 614
   000603         060600     IF THREE-POS-NUM EQUAL 101                                   IX1054.2 123
   000604      1  060700        PERFORM PASS                                              IX1054.2 338
   000605      1  060800        MOVE "FILE IX-FR2 CREATED (101 RECORDS)" TO RE-MARK       IX1054.2 188
   000606      1  060900        GO TO WRITE-TEST-GF-02-WRITE.                             IX1054.2 632
   000607         061000     MOVE "WRONG NUMBER OF RECORDS WRITTEN IX-41 4.9.2" TO RE-MARKIX1054.2 188
   000608         061100     GO TO WRITE-TEST-GF-02-FAIL.                                 IX1054.2 628
   000609         061200 WRITE-DELETE-GF-02.                                              IX1054.2
   000610         061300     PERFORM DE-LETE.                                             IX1054.2 340
   000611         061400*    NOTE IX-FR2 IS NOT CREATED  SO SKIP TO WRITE-TEST-9.         IX1054.2
   000612         061500     PERFORM PRINT-DETAIL.                                        IX1054.2 342
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000613         061600     GO TO WRITE-INIT-GF-03.                                      IX1054.2 726
   000614         061700 WRITE-TEST-GF-02-LONG-REC.                                       IX1054.2
   000615         061800     ADD 1 TO KEY-VALUE  THREE-POS-NUM.                           IX1054.2 113 123
   000616         061900     MOVE "LONG " TO RECORD-LONG-OR-SHORT.                        IX1054.2 118
   000617         062000     MOVE RECORD-BUILD TO GRP-1SEQ-RECORD-2B.                     IX1054.2 110 88
   000618         062100     WRITE GRP-1SEQ-RECORD-2B INVALID KEY                         IX1054.2 88
   000619      1  062200        MOVE "INVALID KEY ON WRITE (LONG)" TO RE-MARK             IX1054.2 188
   000620      1  062300        GO TO WRITE-TEST-GF-02-FAIL.                              IX1054.2 628
   000621         062400 WRITE-TEST-GF-02-SHORT-REC.                                      IX1054.2
   000622         062500     ADD 1 TO KEY-VALUE  THREE-POS-NUM.                           IX1054.2 113 123
   000623         062600     MOVE "SHORT" TO RECORD-LONG-OR-SHORT.                        IX1054.2 118
   000624         062700     MOVE RECORD-BUILD TO GRP-1SEQ-RECORD-2B.                     IX1054.2 110 88
   000625         062800     WRITE GRP-1SEQ-RECORD-2A INVALID KEY                         IX1054.2 85
   000626      1  062900        MOVE "INVALID KEY ON WRITE (SHORT)" TO RE-MARK            IX1054.2 188
   000627      1  063000        GO TO WRITE-TEST-GF-02-FAIL.                              IX1054.2 628
   000628         063100 WRITE-TEST-GF-02-FAIL.                                           IX1054.2
   000629         063200     PERFORM FAIL.                                                IX1054.2 339
   000630         063300     MOVE 101 TO CORRECT-18V0.                                    IX1054.2 214
   000631         063400     MOVE THREE-POS-NUM TO COMPUTED-18V0.                         IX1054.2 123 201
   000632         063500 WRITE-TEST-GF-02-WRITE.                                          IX1054.2
   000633         063600     MOVE SPACE TO GRP-1SEQ-RECORD-2B.                            IX1054.2 IMP 88
   000634         063700     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000635         063800     CLOSE IX-FR2.                                                IX1054.2 81
   000636         063900 READ-INIT-F2-05.                                                 IX1054.2
   000637         064000*    VERIFY NUMBER OF RECORDS IN FILE.                            IX1054.2
   000638         064100     MOVE "READ IX-FS2 VERIFY " TO FEATURE.                       IX1054.2 179
   000639         064200     MOVE "READ-TEST-F2-05    " TO PAR-NAME.                      IX1054.2 183
   000640         064300     OPEN INPUT IX-FR2.                                           IX1054.2 81
   000641         064400     MOVE 1 TO KEY-VALUE.                                         IX1054.2 113
   000642         064500     MOVE KEY-BUILD TO IX-FR2-KEY.                                IX1054.2 111 86
   000643         064600 READ-TEST-F2-05.                                                 IX1054.2
   000644         064700     READ IX-FR2 INVALID KEY                                      IX1054.2 81
   000645      1  064800        GO TO COMPARE-FOR-TEST-F2-05.                             IX1054.2 651
   000646         064900     ADD 1 TO KEY-VALUE.                                          IX1054.2 113
   000647         065000     MOVE KEY-BUILD TO IX-FR2-KEY.                                IX1054.2 111 86
   000648         065100     IF KEY-VALUE GREATER THAN 102                                IX1054.2 113
   000649      1  065200        GO TO READ-TEST-F2-05-FAIL.                               IX1054.2 656
   000650         065300     GO TO READ-TEST-F2-05.                                       IX1054.2 643
   000651         065400 COMPARE-FOR-TEST-F2-05.                                          IX1054.2
   000652         065500     IF KEY-VALUE EQUAL 102                                       IX1054.2 113
   000653      1  065600         PERFORM PASS                                             IX1054.2 338
   000654      1  065700         MOVE "101 RECORDS VERIFIED" TO RE-MARK                   IX1054.2 188
   000655      1  065800         GO TO READ-TEST-F2-05-WRITE.                             IX1054.2 662
   000656         065900 READ-TEST-F2-05-FAIL.                                            IX1054.2
   000657         066000     PERFORM FAIL.                                                IX1054.2 339
   000658         066100     MOVE 101 TO CORRECT-18V0.                                    IX1054.2 214
   000659         066200     SUBTRACT 1 FROM KEY-VALUE.                                   IX1054.2 113
   000660         066300     MOVE KEY-VALUE TO COMPUTED-18V0.                             IX1054.2 113 201
   000661         066400     MOVE "INCORRECT NUMBER OF RECORDS IX-28  4.5.2" TO RE-MARK.  IX1054.2 188
   000662         066500 READ-TEST-F2-05-WRITE.                                           IX1054.2
   000663         066600     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000664         066700 READ-INIT-F2-06.                                                 IX1054.2
   000665         066800*    VERIFY VARIABLE LENGTH RECORDS WERE CREATED BY TESTING       IX1054.2
   000666         066900*    SHORT RECORD.                                                IX1054.2
   000667         067000     MOVE "READ               " TO FEATURE.                       IX1054.2 179
   000668         067100     MOVE "READ-TEST-F2-06    " TO PAR-NAME.                      IX1054.2 183
   000669         067200     MOVE 100 TO KEY-VALUE.                                       IX1054.2 113
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000670         067300     MOVE KEY-BUILD TO IX-FR2-KEY.                                IX1054.2 111 86
   000671         067400 READ-TEST-F2-06.                                                 IX1054.2
   000672         067500     READ IX-FR2 INVALID KEY                                      IX1054.2 81
   000673      1  067600         PERFORM FAIL                                             IX1054.2 339
   000674      1  067700         MOVE "KEY00100" TO CORRECT-A                             IX1054.2 208
   000675      1  067800         MOVE "***INVALID KEY***" TO COMPUTED-A                   IX1054.2 194
   000676      1  067900         MOVE "INVAILD KEY IX-FR2 IX-28 4.5.2 " TO RE-MARK        IX1054.2 188
   000677      1  068000         GO TO READ-TEST-F2-06-WRITE.                             IX1054.2 689
   000678         068100*    NOTE  *** IF REC-NUMBER-2B CONTAINS THE RECORD NUMBER        IX1054.2
   000679         068200*          THEN FIXED LENGTH RECORDS WERE WRITTEN INSTEAD         IX1054.2
   000680         068300*          OF VARIABLE LENGTH RECORDS.                            IX1054.2
   000681         068400*    NOTE  CHECK LENGTH OF RECORD 100.                            IX1054.2
   000682         068500 COMPARE-FOR-TEST-F2-06.                                          IX1054.2
   000683         068600     IF REC-NUMBER-2B EQUAL TO "100"                              IX1054.2 92
   000684      1  068700        MOVE "LONG RECORD CREATED" TO COMPUTED-A                  IX1054.2 194
   000685      1  068800     ELSE MOVE "SHORT RECORD CREATED" TO COMPUTED-A               IX1054.2 194
   000686      1  068900          MOVE 1 TO SHORT-SW.                                     IX1054.2 109
   000687         069000     MOVE "EXPECT SHORT RECORD" TO CORRECT-A.                     IX1054.2 208
   000688         069100     MOVE "INFO ONLY-SEE PROGRAM" TO RE-MARK.                     IX1054.2 188
   000689         069200 READ-TEST-F2-06-WRITE.                                           IX1054.2
   000690         069300     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000691         069400 READ-INIT-F2-07.                                                 IX1054.2
   000692         069500*    VERIFY VARIABLE LENGTH RECORDS WERE CREATED BY TESTING       IX1054.2
   000693         069600*    LONG RECORD.                                                 IX1054.2
   000694         069700     MOVE "READ               " TO FEATURE.                       IX1054.2 179
   000695         069800     MOVE "READ-TEST-F2-07    " TO PAR-NAME.                      IX1054.2 183
   000696         069900     MOVE 12 TO KEY-VALUE.                                        IX1054.2 113
   000697         070000     MOVE KEY-BUILD TO IX-FR2-KEY.                                IX1054.2 111 86
   000698         070100 READ-TEST-F2-07.                                                 IX1054.2
   000699         070200     READ IX-FR2 INVALID KEY                                      IX1054.2 81
   000700      1  070300         PERFORM FAIL                                             IX1054.2 339
   000701      1  070400         MOVE "KEY00012" TO CORRECT-A                             IX1054.2 208
   000702      1  070500         MOVE "***INVALID KEY***" TO COMPUTED-A                   IX1054.2 194
   000703      1  070600         MOVE "INVALID KEY IX-FR2 IX-28 4.5.2" TO RE-MARK         IX1054.2 188
   000704      1  070700         GO TO READ-TEST-F2-07-WRITE.                             IX1054.2 722
   000705         070800*    NOTE  ** IF REC-NUMBER-1B CONTAINS THE RECORD NUMBER         IX1054.2
   000706         070900*             THEN LONG RECORDS WERE WRITTEN.                     IX1054.2
   000707         071000 COMPARE-FOR-TEST-F2-07.                                          IX1054.2
   000708         071100     IF REC-NUMBER-2B EQUAL TO "012"                              IX1054.2 92
   000709      1  071200        PERFORM PASS                                              IX1054.2 338
   000710      1  071300        PERFORM READ-TEST-F2-07-WRITE                             IX1054.2 722
   000711      1  071400        MOVE "EXPECT VARIABLE LTH" TO CORRECT-A                   IX1054.2 208
   000712      1  071500        MOVE "INFO ONLY-SEE PROGRAM" TO RE-MARK                   IX1054.2 188
   000713      1  071600        IF SHORT-SW EQUAL TO ZERO                                 IX1054.2 109 IMP
   000714      2  071700           MOVE "FIXED RECORD CREATED" TO COMPUTED-A              IX1054.2 194
   000715      2  071800           GO TO READ-TEST-F2-07-WRITE                            IX1054.2 722
   000716      2  071900        ELSE MOVE "VARIABLE LTH CREATED" TO COMPUTED-A            IX1054.2 194
   000717      2  072000             GO TO READ-TEST-F2-07-WRITE.                         IX1054.2 722
   000718         072100     PERFORM FAIL.                                                IX1054.2 339
   000719         072200     MOVE "KEY00012" TO CORRECT-A.                                IX1054.2 208
   000720         072300     MOVE IX-FR2-KEY TO COMPUTED-A.                               IX1054.2 86 194
   000721         072400     MOVE "WRONG LENGTH OR WRONG RECORD" TO RE-MARK.              IX1054.2 188
   000722         072500 READ-TEST-F2-07-WRITE.                                           IX1054.2
   000723         072600     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000724         072700 READ-TEST-F2-07-EXIT.                                            IX1054.2
   000725         072800     CLOSE IX-FR2.                                                IX1054.2 81
   000726         072900 WRITE-INIT-GF-03.                                                IX1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000727         073000*    CREATE AN INDEXED FILE OF 120 RECORDS.  THE RECORD SIZE IS   IX1054.2
   000728         073100*    VARIABLE LENGTH (056-102 CHARACTERS).                        IX1054.2
   000729         073200     MOVE "WRITE IX-FS3       " TO FEATURE.                       IX1054.2 179
   000730         073300     MOVE "WRITE-TEST-GF-03   " TO PAR-NAME.                      IX1054.2 183
   000731         073400     MOVE ZERO TO KEY-VALUE  THREE-POS-NUM  SHORT-SW.             IX1054.2 IMP 113 123 109
   000732         073500     MOVE 3 TO FILE-NO.                                           IX1054.2 115
   000733         073600     OPEN OUTPUT IX-FR3.                                          IX1054.2 94
   000734         073700 WRITE-TEST-GF-03.                                                IX1054.2
   000735         073800     PERFORM WRITE-TEST-GF-03-SHORT-REC.                          IX1054.2 761
   000736         073900     PERFORM WRITE-TEST-GF-03-LONG-REC 15 TIMES.                  IX1054.2 754
   000737         074000     PERFORM WRITE-TEST-GF-03-SHORT-REC 20 TIMES.                 IX1054.2 761
   000738         074100     PERFORM WRITE-TEST-GF-03-LONG-REC 12 TIMES.                  IX1054.2 754
   000739         074200     PERFORM WRITE-TEST-GF-03-SHORT-REC 23 TIMES.                 IX1054.2 761
   000740         074300     PERFORM WRITE-TEST-GF-03-LONG-REC 23 TIMES.                  IX1054.2 754
   000741         074400     PERFORM WRITE-TEST-GF-03-SHORT-REC 25 TIMES.                 IX1054.2 761
   000742         074500     PERFORM WRITE-TEST-GF-03-LONG-REC.                           IX1054.2 754
   000743         074600     IF THREE-POS-NUM EQUAL 120                                   IX1054.2 123
   000744      1  074700        PERFORM PASS                                              IX1054.2 338
   000745      1  074800        MOVE "FILE IX-FR3 CREATED (120 RECORDS)" TO RE-MARK       IX1054.2 188
   000746      1  074900        GO TO WRITE-TEST-GF-03-WRITE.                             IX1054.2 772
   000747         075000     MOVE "WRONG NUMBER OF RECORDS WRITTEN IX-41 4.9.2" TO RE-MARKIX1054.2 188
   000748         075100     GO TO WRITE-TEST-GF-03-FAIL.                                 IX1054.2 768
   000749         075200 WRITE-DELETE-GF-03.                                              IX1054.2
   000750         075300     PERFORM DE-LETE.                                             IX1054.2 340
   000751         075400*    NOTE IX-FR3 IS NOT CREATED  SO SKIP TO END-PARAGRAPH.        IX1054.2
   000752         075500     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000753         075600     GO TO CCVS-EXIT.                                             IX1054.2 870
   000754         075700 WRITE-TEST-GF-03-LONG-REC.                                       IX1054.2
   000755         075800     ADD 1 TO KEY-VALUE  THREE-POS-NUM.                           IX1054.2 113 123
   000756         075900     MOVE "LONG " TO RECORD-LONG-OR-SHORT.                        IX1054.2 118
   000757         076000     MOVE RECORD-BUILD TO GRP-1SEQ-RECORD-3B.                     IX1054.2 110 102
   000758         076100     WRITE GRP-1SEQ-RECORD-3B INVALID KEY                         IX1054.2 102
   000759      1  076200        MOVE "INVALID KEY ON WRITE (LONG)" TO RE-MARK             IX1054.2 188
   000760      1  076300        GO TO WRITE-TEST-GF-03-FAIL.                              IX1054.2 768
   000761         076400 WRITE-TEST-GF-03-SHORT-REC.                                      IX1054.2
   000762         076500     ADD 1 TO KEY-VALUE  THREE-POS-NUM.                           IX1054.2 113 123
   000763         076600     MOVE "SHORT" TO RECORD-LONG-OR-SHORT.                        IX1054.2 118
   000764         076700     MOVE RECORD-BUILD TO GRP-1SEQ-RECORD-3B.                     IX1054.2 110 102
   000765         076800     WRITE GRP-1SEQ-RECORD-3A INVALID KEY                         IX1054.2 99
   000766      1  076900        MOVE "INVALID KEY ON WRITE (SHORT)" TO RE-MARK            IX1054.2 188
   000767      1  077000        GO TO WRITE-TEST-GF-03-FAIL.                              IX1054.2 768
   000768         077100 WRITE-TEST-GF-03-FAIL.                                           IX1054.2
   000769         077200     PERFORM FAIL.                                                IX1054.2 339
   000770         077300     MOVE 120 TO CORRECT-18V0.                                    IX1054.2 214
   000771         077400     MOVE THREE-POS-NUM TO COMPUTED-18V0.                         IX1054.2 123 201
   000772         077500 WRITE-TEST-GF-03-WRITE.                                          IX1054.2
   000773         077600     MOVE SPACE TO GRP-1SEQ-RECORD-3B.                            IX1054.2 IMP 102
   000774         077700     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000775         077800     CLOSE IX-FR3.                                                IX1054.2 94
   000776         077900 READ-INIT-F2-08.                                                 IX1054.2
   000777         078000*    VERIFY VARIABLE LENGTH RECORDS WERE CREATED BY TESTING       IX1054.2
   000778         078100*    LONG RECORD.                                                 IX1054.2
   000779         078200     MOVE "READ IX-FS3 VERIFY " TO FEATURE.                       IX1054.2 179
   000780         078300     MOVE "READ-TEST-F2-08    " TO PAR-NAME.                      IX1054.2 183
   000781         078400     OPEN INPUT IX-FR3.                                           IX1054.2 94
   000782         078500     MOVE 1 TO KEY-VALUE.                                         IX1054.2 113
   000783         078600     MOVE KEY-BUILD TO IX-FR3-KEY.                                IX1054.2 111 100
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000784         078700 READ-TEST-F2-08.                                                 IX1054.2
   000785         078800     READ IX-FR3 INVALID KEY                                      IX1054.2 94
   000786      1  078900         PERFORM FAIL                                             IX1054.2 339
   000787      1  079000         MOVE "KEY00016" TO CORRECT-A                             IX1054.2 208
   000788      1  079100         MOVE "***INVALID KEY***" TO COMPUTED-A                   IX1054.2 194
   000789      1  079200         MOVE "INVAILD KEY IX-FR3" TO RE-MARK                     IX1054.2 188
   000790      1  079300         GO TO READ-TEST-F2-08-WRITE.                             IX1054.2 805
   000791         079400     IF KEY-VALUE NOT EQUAL TO 16                                 IX1054.2 113
   000792      1  079500        ADD 1 TO KEY-VALUE                                        IX1054.2 113
   000793      1  079600        MOVE KEY-BUILD TO IX-FR3-KEY                              IX1054.2 111 100
   000794      1  079700        GO TO READ-TEST-F2-08.                                    IX1054.2 784
   000795         079800*    NOTE  *** IF REC-NUMBER-3B CONTAINS THE RECORD NUMBER        IX1054.2
   000796         079900*              THEN LONG RECORDS WERE WRITTEN.                    IX1054.2
   000797         080000 COMPARE-FOR-TEST-F2-08.                                          IX1054.2
   000798         080100     IF REC-NUMBER-3B EQUAL TO "016"                              IX1054.2 106
   000799      1  080200        PERFORM PASS                                              IX1054.2 338
   000800      1  080300        GO TO READ-TEST-F2-08-WRITE.                              IX1054.2 805
   000801         080400     PERFORM FAIL.                                                IX1054.2 339
   000802         080500     MOVE "KEY00016" TO CORRECT-A.                                IX1054.2 208
   000803         080600     MOVE IX-FR3-KEY TO COMPUTED-A.                               IX1054.2 100 194
   000804         080700     MOVE "WRONG LENGTH OR WRONG RECORD IX-28 4.5.2" TO RE-MARK.  IX1054.2 188
   000805         080800 READ-TEST-F2-08-WRITE.                                           IX1054.2
   000806         080900     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000807         081000 READ-INIT-09.                                                    IX1054.2
   000808         081100*    VERIFY VARIABLE LENGTH RECORDS WERE CREATED BY TESTING       IX1054.2
   000809         081200*    SHORT RECORD.                                                IX1054.2
   000810         081300     MOVE "READ  SHORT RECORDS" TO FEATURE.                       IX1054.2 179
   000811         081400     MOVE "READ-TEST-F2-09    " TO PAR-NAME.                      IX1054.2 183
   000812         081500     MOVE 71 TO KEY-VALUE.                                        IX1054.2 113
   000813         081600     MOVE KEY-BUILD TO IX-FR3-KEY.                                IX1054.2 111 100
   000814         081700 READ-TEST-F2-09.                                                 IX1054.2
   000815         081800     READ IX-FR3 INVALID KEY                                      IX1054.2 94
   000816      1  081900         PERFORM FAIL                                             IX1054.2 339
   000817      1  082000         MOVE "KEY00071" TO CORRECT-A                             IX1054.2 208
   000818      1  082100         MOVE "***INVALID KEY***" TO COMPUTED-A                   IX1054.2 194
   000819      1  082200         MOVE "INVAILD KEY IX-FR3 IX-28 4.5.2" TO RE-MARK         IX1054.2 188
   000820      1  082300         GO TO READ-TEST-F2-09-WRITE.                             IX1054.2 832
   000821         082400*    NOTE  *** IF REC-NUMBER-1B CONTAINS THE RECORD NUMBER        IX1054.2
   000822         082500*          THEN FIXED LENGTH RECORDS WERE WRITTEN INSTEAD         IX1054.2
   000823         082600*          OF VARIABLE LENGTH RECORDS.                            IX1054.2
   000824         082700*    NOTE  CHECK LENGTH OF RECORD 71.                             IX1054.2
   000825         082800 COMPARE-FOR-TEST-F2-09.                                          IX1054.2
   000826         082900     IF REC-NUMBER-3B EQUAL TO "071"                              IX1054.2 106
   000827      1  083000        MOVE "LONG RECORD CREATED" TO COMPUTED-A                  IX1054.2 194
   000828      1  083100     ELSE MOVE "SHORT RECORD CREATED" TO COMPUTED-A               IX1054.2 194
   000829      1  083200          MOVE 1 TO SHORT-SW.                                     IX1054.2 109
   000830         083300     MOVE "EXPECT SHORT RECORD" TO CORRECT-A.                     IX1054.2 208
   000831         083400     MOVE "INFO ONLY-SEE PROGRAM" TO RE-MARK.                     IX1054.2 188
   000832         083500 READ-TEST-F2-09-WRITE.                                           IX1054.2
   000833         083600     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000834         083700 READ-INIT-F2-10.                                                 IX1054.2
   000835         083800*    VERIFY VARIABLE LENGTH RECORDS WERE CREATED BY TESTING       IX1054.2
   000836         083900*    LONG RECORD.                                                 IX1054.2
   000837         084000     MOVE "READ LONG   RECORDS" TO FEATURE.                       IX1054.2 179
   000838         084100     MOVE "READ-TEST-F2-10    " TO PAR-NAME.                      IX1054.2 183
   000839         084200     MOVE 120 TO KEY-VALUE.                                       IX1054.2 113
   000840         084300     MOVE KEY-BUILD TO IX-FR3-KEY.                                IX1054.2 111 100
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000841         084400 READ-TEST-F2-10.                                                 IX1054.2
   000842         084500     READ IX-FR3 INVALID KEY                                      IX1054.2 94
   000843      1  084600         PERFORM FAIL                                             IX1054.2 339
   000844      1  084700         MOVE "KEY00120" TO CORRECT-A                             IX1054.2 208
   000845      1  084800         MOVE "***INVALID KEY***" TO COMPUTED-A                   IX1054.2 194
   000846      1  084900         MOVE "INVAILD KEY IX-FR3 IX-28 4.5.2" TO RE-MARK         IX1054.2 188
   000847      1  085000         GO TO READ-TEST-F2-10-WRITE.                             IX1054.2 865
   000848         085100*    NOTE  *** IF REC-NUMBER-3B CONTAINS THE RECORD NUMBER        IX1054.2
   000849         085200*          THEN LONG RECORDS WERE WITTEN.                         IX1054.2
   000850         085300 COMPARE-FOR-TEST-F2-10.                                          IX1054.2
   000851         085400     IF REC-NUMBER-3B EQUAL TO "120"                              IX1054.2 106
   000852      1  085500        PERFORM PASS                                              IX1054.2 338
   000853      1  085600        PERFORM READ-TEST-F2-10-WRITE                             IX1054.2 865
   000854      1  085700        MOVE "EXPECT VARIABLE LTH" TO CORRECT-A                   IX1054.2 208
   000855      1  085800        MOVE "INFO ONLY-SEE PROGRAM" TO RE-MARK                   IX1054.2 188
   000856      1  085900        IF SHORT-SW EQUAL TO ZERO                                 IX1054.2 109 IMP
   000857      2  086000           MOVE "FIXED RECORD CREATED" TO COMPUTED-A              IX1054.2 194
   000858      2  086100           GO TO READ-TEST-F2-10-WRITE                            IX1054.2 865
   000859      2  086200        ELSE MOVE "VARIABLE LTH CREATED" TO COMPUTED-A            IX1054.2 194
   000860      2  086300             GO TO READ-TEST-F2-10-WRITE.                         IX1054.2 865
   000861         086400     PERFORM FAIL.                                                IX1054.2 339
   000862         086500     MOVE "KEY00120" TO CORRECT-A.                                IX1054.2 208
   000863         086600     MOVE IX-FR3-KEY TO COMPUTED-A.                               IX1054.2 100 194
   000864         086700     MOVE "WRONG LENGTH OR WRONG RECORD IX-28 4.5.2" TO RE-MARK.  IX1054.2 188
   000865         086800 READ-TEST-F2-10-WRITE.                                           IX1054.2
   000866         086900     MOVE "READ-TEST-012" TO PAR-NAME.                            IX1054.2 183
   000867         087000     PERFORM PRINT-DETAIL.                                        IX1054.2 342
   000868         087100 READ-TEST-F2-10-EXIT.                                            IX1054.2
   000869         087200     CLOSE IX-FR3.                                                IX1054.2 94
   000870         087300 CCVS-EXIT SECTION.                                               IX1054.2
   000871         087400 CCVS-999999.                                                     IX1054.2
   000872         087500     GO TO CLOSE-FILES.                                           IX1054.2 333
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    19
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      173   ALTERNATE-KEY1
      175   ALTERNATE-KEY2
      239   ANSI-REFERENCE . . . . . . . .  421 428 437
      218   CCVS-C-1 . . . . . . . . . . .  360 406
      223   CCVS-C-2 . . . . . . . . . . .  361 407
      273   CCVS-E-1 . . . . . . . . . . .  366
      278   CCVS-E-2 . . . . . . . . . . .  375 382 389 394
      281   CCVS-E-2-2 . . . . . . . . . .  M374
      286   CCVS-E-3 . . . . . . . . . . .  395
      295   CCVS-E-4 . . . . . . . . . . .  374
      296   CCVS-E-4-1 . . . . . . . . . .  M372
      298   CCVS-E-4-2 . . . . . . . . . .  M373
      240   CCVS-H-1 . . . . . . . . . . .  355 402
      245   CCVS-H-2A. . . . . . . . . . .  356 403
      254   CCVS-H-2B. . . . . . . . . . .  357 404
      266   CCVS-H-3 . . . . . . . . . . .  358 405
      316   CCVS-PGM-ID. . . . . . . . . .  322 322
      160   CHARS-OR-RECORDS
      200   CM-18V0
      194   COMPUTED-A . . . . . . . . . .  195 197 198 199 200 433 436 M535 M544 M545 M564 M576 M577 M582 M675 M684 M685
                                            M702 M714 M716 M720 M788 M803 M818 M827 M828 M845 M857 M859 M863
      195   COMPUTED-N
      193   COMPUTED-X . . . . . . . . . .  M350 418
      197   COMPUTED-0V18
      199   COMPUTED-14V4
      201   COMPUTED-18V0. . . . . . . . .  M487 M517 M631 M660 M771
      198   COMPUTED-4V14
      217   COR-ANSI-REFERENCE . . . . . .  M428 M430
      208   CORRECT-A. . . . . . . . . . .  209 210 211 212 213 434 436 M534 M547 M563 M573 M581 M674 M687 M701 M711 M719
                                            M787 M802 M817 M830 M844 M854 M862
      209   CORRECT-N
      207   CORRECT-X. . . . . . . . . . .  M351 420
      210   CORRECT-0V18
      212   CORRECT-14V4
      214   CORRECT-18V0 . . . . . . . . .  M486 M515 M630 M658 M770
      211   CORRECT-4V14
      213   CR-18V0
      231   DELETE-COUNTER . . . . . . . .  M340 369 385 387
      186   DOTVALUE . . . . . . . . . . .  M345
      237   DUMMY-HOLD . . . . . . . . . .  M399 409
       67   DUMMY-RECORD . . . . . . . . .  M355 M356 M357 M358 M360 M361 M362 M364 M366 M375 M382 M389 M394 M395 399 M400
                                            401 M402 M403 M404 M405 M406 M407 M408 M409 413 M414 M423 M438
      284   ENDER-DESC . . . . . . . . . .  M377 M388 M393
      232   ERROR-COUNTER. . . . . . . . .  M339 368 378 381
      236   ERROR-HOLD . . . . . . . . . .  M368 M369 M369 M370 373
      282   ERROR-TOTAL. . . . . . . . . .  M379 M381 M386 M387 M391 M392
      179   FEATURE. . . . . . . . . . . .  M445 M493 M527 M558 M589 M638 M667 M694 M729 M779 M810 M837
      115   FILE-NO. . . . . . . . . . . .  M450 M594 M732
      141   FILE-RECORD-INFO . . . . . . .  M330
      142   FILE-RECORD-INFO-P1-120
      169   FILE-RECORD-INFO-P121-240
      127   FILE-RECORD-INFO-SKELETON. . .  329
      126   FILE-RECORD-INFORMATION-REC
      124   FILLER-LONG
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    20
0 Defined   Cross-reference of data names   References

0      74   FILLER-1A
       76   FILLER-1B
       87   FILLER-2A
       89   FILLER-2B
      101   FILLER-3A
      103   FILLER-3B
       72   GRP-1SEQ-RECORD-1A . . . . . .  480
       75   GRP-1SEQ-RECORD-1B . . . . . .  M472 473 M479 M489
       85   GRP-1SEQ-RECORD-2A . . . . . .  625
       88   GRP-1SEQ-RECORD-2B . . . . . .  M617 618 M624 M633
       99   GRP-1SEQ-RECORD-3A . . . . . .  765
      102   GRP-1SEQ-RECORD-3B . . . . . .  M757 758 M764 M773
      310   HYPHEN-LINE. . . . . . . . . .  362 364 408
      276   ID-AGAIN . . . . . . . . . . .  M322
      309   INF-ANSI-REFERENCE . . . . . .  M421 M424 M437 M439
      304   INFO-TEXT. . . . . . . . . . .  M422
      233   INSPECT-COUNTER. . . . . . . .  M337 368 390 392
       68   IX-FR1 . . . . . . . . . . . .  46 451 491 496 500 522 524 532 551 555 561 587
       73   IX-FR1-KEY . . . . . . . . . .  50 M498 M503 M526 M557 582
       81   IX-FR2 . . . . . . . . . . . .  51 62 595 635 640 644 672 699 725
       86   IX-FR2-KEY . . . . . . . . . .  55 M642 M647 M670 M697 720
       94   IX-FR3 . . . . . . . . . . . .  56 62 733 775 781 785 815 842 869
      100   IX-FR3-KEY . . . . . . . . . .  60 M783 M793 803 M813 M840 863
      111   KEY-BUILD. . . . . . . . . . .  498 503 526 557 642 647 670 697 783 793 813 840
      112   KEY-NAME
      113   KEY-VALUE. . . . . . . . . . .  M470 M477 M497 M502 504 508 M516 517 M525 M556 M593 M615 M622 M641 M646 648 652
                                            M659 660 M669 M696 M731 M755 M762 M782 791 M792 M812 M839
       77   LONG-REC-1B
       90   LONG-REC-2B
      104   LONG-REC-3B
      154   ODO-NUMBER
      181   P-OR-F . . . . . . . . . . . .  M337 M338 M339 M340 347 M350
      183   PAR-NAME . . . . . . . . . . .  M352 M446 M494 M520 M528 M559 M590 M639 M668 M695 M730 M780 M811 M838 M866
      185   PARDOT-X . . . . . . . . . . .  M344
      234   PASS-COUNTER . . . . . . . . .  M338 370 372
       65   PRINT-FILE . . . . . . . . . .  44 321 334
       66   PRINT-REC. . . . . . . . . . .  M346 M427 M429
      188   RE-MARK. . . . . . . . . . . .  M341 M353 M460 M462 M474 M481 M484 M510 M513 M518 M536 M548 M565 M574 M583 M605
                                            M607 M619 M626 M654 M661 M676 M688 M703 M712 M721 M745 M747 M759 M766 M789 M804
                                            M819 M831 M846 M855 M864
      230   REC-CT . . . . . . . . . . . .  343 345 352
       79   REC-NUMBER-1B. . . . . . . . .  543 570
       92   REC-NUMBER-2B. . . . . . . . .  683 708
      106   REC-NUMBER-3B. . . . . . . . .  798 826 851
      229   REC-SKL-SUB. . . . . . . . . .  M325 M328 330
      110   RECORD-BUILD . . . . . . . . .  472 479 617 624 757 764
      238   RECORD-COUNT . . . . . . . . .  M397 398 M410
      120   RECORD-LONG-ONLY
      118   RECORD-LONG-OR-SHORT . . . . .  M471 M478 M616 M623 M756 M763
      164   RECORDS-IN-FILE
      148   REELUNIT-NUMBER
      109   SHORT-SW . . . . . . . . . . .  M546 575 M593 M686 713 M731 M829 856
      189   TEST-COMPUTED. . . . . . . . .  427
      204   TEST-CORRECT . . . . . . . . .  429
      257   TEST-ID. . . . . . . . . . . .  M322
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    21
0 Defined   Cross-reference of data names   References

0     177   TEST-RESULTS . . . . . . . . .  M323 346
      123   THREE-POS-NUM. . . . . . . . .  458 M470 M477 487 M593 603 M615 M622 631 M731 743 M755 M762 771
      235   TOTAL-ERROR
      152   UPDATE-NUMBER
      162   XBLOCK-SIZE
      144   XFILE-NAME
      166   XFILE-ORGANIZATION
      168   XLABEL-TYPE
      156   XPROGRAM-NAME
      171   XRECORD-KEY
      158   XRECORD-LENGTH
      146   XRECORD-NAME
      150   XRECORD-NUMBER
      306   XXCOMPUTED . . . . . . . . . .  M436
      308   XXCORRECT. . . . . . . . . . .  M436
      301   XXINFO . . . . . . . . . . . .  423 438
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    22
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

      432   BAIL-OUT . . . . . . . . . . .  P349
      440   BAIL-OUT-EX. . . . . . . . . .  E349 G434
      435   BAIL-OUT-WRITE . . . . . . . .  G433
      415   BLANK-LINE-PRINT
      870   CCVS-EXIT. . . . . . . . . . .  G753
      331   CCVS-INIT-EXIT
      327   CCVS-INIT-FILE . . . . . . . .  P326
      871   CCVS-999999
      319   CCVS1
      441   CCVS1-EXIT . . . . . . . . . .  G332
      333   CLOSE-FILES. . . . . . . . . .  G872
      359   COLUMN-NAMES-ROUTINE . . . . .  E324
      507   COMPARE-FOR-TEST-F2-01 . . . .  G501
      542   COMPARE-FOR-TEST-F2-02
      569   COMPARE-FOR-TEST-F2-03
      651   COMPARE-FOR-TEST-F2-05 . . . .  G645
      682   COMPARE-FOR-TEST-F2-06
      707   COMPARE-FOR-TEST-F2-07
      797   COMPARE-FOR-TEST-F2-08
      825   COMPARE-FOR-TEST-F2-09
      850   COMPARE-FOR-TEST-F2-10
      340   DE-LETE. . . . . . . . . . . .  P465 P610 P750
      363   END-ROUTINE. . . . . . . . . .  P334
      367   END-ROUTINE-1
      376   END-ROUTINE-12
      384   END-ROUTINE-13 . . . . . . . .  E334
      365   END-RTN-EXIT
      339   FAIL . . . . . . . . . . . . .  P485 P514 P533 P562 P580 P629 P657 P673 P700 P718 P769 P786 P801 P816 P843 P861
      417   FAIL-ROUTINE . . . . . . . . .  P348
      431   FAIL-ROUTINE-EX. . . . . . . .  E348 G425
      426   FAIL-ROUTINE-WRITE . . . . . .  G419 G420
      354   HEAD-ROUTINE . . . . . . . . .  P324
      337   INSPT
      320   OPEN-FILES
      338   PASS . . . . . . . . . . . . .  P459 P509 P571 P604 P653 P709 P744 P799 P852
      342   PRINT-DETAIL . . . . . . . . .  P467 P490 P521 P550 P585 P612 P634 P663 P690 P723 P752 P774 P806 P833 P867
      512   READ-FAIL-F2-01. . . . . . . .  G505
      579   READ-FAIL-F2-03. . . . . . . .  G570
      492   READ-INIT-F2-01
      523   READ-INIT-F2-02
      552   READ-INIT-F2-03
      636   READ-INIT-F2-05
      664   READ-INIT-F2-06
      691   READ-INIT-F2-07
      776   READ-INIT-F2-08
      834   READ-INIT-F2-10
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    23
0 Defined   Cross-reference of procedures   References

0     807   READ-INIT-09
      499   READ-TEST-F2-01. . . . . . . .  G506
      529   READ-TEST-F2-02
      549   READ-TEST-F2-02-WRITE. . . . .  G537
      560   READ-TEST-F2-03
      586   READ-TEST-F2-03-EXIT
      643   READ-TEST-F2-05. . . . . . . .  G650
      656   READ-TEST-F2-05-FAIL . . . . .  G649
      662   READ-TEST-F2-05-WRITE. . . . .  G655
      671   READ-TEST-F2-06
      689   READ-TEST-F2-06-WRITE. . . . .  G677
      698   READ-TEST-F2-07
      724   READ-TEST-F2-07-EXIT
      722   READ-TEST-F2-07-WRITE. . . . .  G704 P710 G715 G717
      784   READ-TEST-F2-08. . . . . . . .  G794
      805   READ-TEST-F2-08-WRITE. . . . .  G790 G800
      814   READ-TEST-F2-09
      832   READ-TEST-F2-09-WRITE. . . . .  G820
      841   READ-TEST-F2-10
      868   READ-TEST-F2-10-EXIT
      865   READ-TEST-F2-10-WRITE. . . . .  G847 P853 G858 G860
      519   READ-WRITE-F2-01 . . . . . . .  G511
      584   READ-WRITE-F2-03 . . . . . . .  G566 P572 G578
      443   SECT-RC-02-001
      335   TERMINATE-CCVS
      464   WRITE-DELETE-GF-01
      609   WRITE-DELETE-GF-02
      749   WRITE-DELETE-GF-03
      444   WRITE-INIT-GF-01
      588   WRITE-INIT-GF-02 . . . . . . .  G468
      726   WRITE-INIT-GF-03 . . . . . . .  G613
      396   WRITE-LINE . . . . . . . . . .  P346 P347 P355 P356 P357 P358 P360 P361 P362 P364 P366 P375 P383 P389 P394 P395
                                            P423 P427 P429 P438
      447   WRITE-TEST-GF-01
      483   WRITE-TEST-GF-01-FAIL. . . . .  G463 G475 G482
      469   WRITE-TEST-GF-01-LONG-REC. . .  P453 P455 P457
      476   WRITE-TEST-GF-01-SHORT-REC . .  P452 P454 P456
      488   WRITE-TEST-GF-01-WRITE . . . .  G461
      596   WRITE-TEST-GF-02
      628   WRITE-TEST-GF-02-FAIL. . . . .  G608 G620 G627
      614   WRITE-TEST-GF-02-LONG-REC. . .  P598 P600 P602
      621   WRITE-TEST-GF-02-SHORT-REC . .  P597 P599 P601
      632   WRITE-TEST-GF-02-WRITE . . . .  G606
      734   WRITE-TEST-GF-03
      768   WRITE-TEST-GF-03-FAIL. . . . .  G748 G760 G767
      754   WRITE-TEST-GF-03-LONG-REC. . .  P736 P738 P740 P742
      761   WRITE-TEST-GF-03-SHORT-REC . .  P735 P737 P739 P741
      772   WRITE-TEST-GF-03-WRITE . . . .  G746
      412   WRT-LN . . . . . . . . . . . .  P402 P403 P404 P405 P406 P407 P408 P411 P416
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    24
0 Defined   Cross-reference of programs     References

        3   IX105A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX105A    Date 06/04/2022  Time 11:58:39   Page    25
0LineID  Message code  Message text

     65  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     68  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

                       Same message on line:     81     94

     94  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       5           5
-* Statistics for COBOL program IX105A:
 *    Source records = 872
 *    Data Division statements = 115
 *    Procedure Division statements = 458
 *    Generated COBOL statements = 0
 *    Program complexity factor = 467
0End of compilation 1,  program IX105A,  highest severity 0.
0Return code 0
