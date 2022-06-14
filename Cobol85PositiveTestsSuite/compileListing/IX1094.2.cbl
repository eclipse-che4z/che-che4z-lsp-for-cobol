1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:51   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:51   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1094.2
   000002         000200 PROGRAM-ID.                                                      IX1094.2
   000003         000300     IX109A.                                                      IX1094.2
   000004         000500*                                                              *  IX1094.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1094.2
   000006         000700*                                                              *  IX1094.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1094.2
   000008         000900*                                                              *  IX1094.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1094.2
   000010         001100*                                                              *  IX1094.2
   000011         001300*                                                                 IX1094.2
   000012         001400*    1.  THE  ROUTINE  CREATES  THE  MASS  STORAGE  FILE  IX-FS3  IX1094.2
   000013         001500*        CONTAINING  50  RECORDS. EACH BLOCK CONTAINS 2 RECORDS,  IX1094.2
   000014         001600*        EACH  RECORD  CONTAINS  240 CHARACTERS, ORGANIZATION IS  IX1094.2
   000015         001700*        INDEXED,  ACCESS  IS SEQUENTIAL. THIS ROUTINE CHECKS AS  IX1094.2
   000016         001800*        MANY  FILE STATUS CODES AS POSSIBLE. HOWEVER, IT IS NOT  IX1094.2
   000017         001900*        POSSIBLE TO CHECK ALL CODES NEITHER IN THAT PROGRAM NOR  IX1094.2
   000018         002000*        IN THE FOLLOWING ONE.                                    IX1094.2
   000019         002100*                                                                 IX1094.2
   000020         002200*    2. THE ROUTINE READS THE CREATED FILE,VERIFIES IT AND       *IX1094.2
   000021         002300*       CHECKS THE FILE STATUS CODES:                             IX1094.2
   000022         002400*           00  -  AFTER OPEN OUTPUT                              IX1094.2
   000023         002500*           00  -  AFTER WRITE                                    IX1094.2
   000024         002600*           21  -  AFTER WRITE  (VIOLATE ASCENDING SEQUENCE)      IX1094.2
   000025         002700*           00  -  AFTER CLOSE OUTPUT                             IX1094.2
   000026         002800*           00  -  AFTER OPEN INPUT                               IX1094.2
   000027         002900*           00  -  AFTER READ    (WITHOUT AT END)                 IX1094.2
   000028         003000*           10  -  AFTER READ    (SEE  IX-4, 1.3.4, (2) A)        IX1094.2
   000029         003100*           00  -  AFTER CLOSE INPUT                              IX1094.2
   000030         003200*           00  -  AFTER OPEN INPUT                               IX1094.2
   000031         003300*           00  -  AFTER READ ... END  ...                        IX1094.2
   000032         003400*           10  -  AFTER READ ... END  ...                        IX1094.2
   000033         003500*           46  -  AFTER READ ... END  ...                        IX1094.2
   000034         003600*                                                                 IX1094.2
   000035         003700*    4. X-CARDS USED IN THIS PROGRAM:                             IX1094.2
   000036         003800*                                                                 IX1094.2
   000037         003900*                 XXXXX024                                        IX1094.2
   000038         004000*                 XXXXX055.                                       IX1094.2
   000039         004100*         P       XXXXX062.                                       IX1094.2
   000040         004200*                 XXXXX082.                                       IX1094.2
   000041         004300*                 XXXXX083.                                       IX1094.2
   000042         004400*         C       XXXXX084                                        IX1094.2
   000043         004500*                                                                 IX1094.2
   000044         004600*                                                                 IX1094.2
   000045         004700 ENVIRONMENT DIVISION.                                            IX1094.2
   000046         004800 CONFIGURATION SECTION.                                           IX1094.2
   000047         004900 SOURCE-COMPUTER.                                                 IX1094.2
   000048         005000     XXXXX082.                                                    IX1094.2
   000049         005100 OBJECT-COMPUTER.                                                 IX1094.2
   000050         005200     XXXXX083.                                                    IX1094.2
   000051         005300 INPUT-OUTPUT SECTION.                                            IX1094.2
   000052         005400 FILE-CONTROL.                                                    IX1094.2
   000053         005500     SELECT RAW-DATA   ASSIGN TO                                  IX1094.2 73
   000054         005600     XXXXX062                                                     IX1094.2
   000055         005700            ORGANIZATION IS INDEXED                               IX1094.2
   000056         005800            ACCESS MODE IS RANDOM                                 IX1094.2
   000057         005900            RECORD KEY IS RAW-DATA-KEY.                           IX1094.2 76
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000                                                                  IX1094.2
   000059         006100     SELECT PRINT-FILE ASSIGN TO                                  IX1094.2 89
   000060         006200     XXXXX055.                                                    IX1094.2
   000061         006300                                                                  IX1094.2
   000062         006400     SELECT IX-FS3 ASSIGN                                         IX1094.2 95
   000063         006500     XXXXX024                                                     IX1094.2
   000064         006600     ORGANIZATION IS INDEXED                                      IX1094.2
   000065         006700     ACCESS MODE IS SEQUENTIAL                                    IX1094.2
   000066         006800     RECORD KEY IS IX-FS3-KEY                                     IX1094.2 105
   000067         006900     FILE STATUS IS IX-FS3-STATUS.                                IX1094.2 138
   000068         007000                                                                  IX1094.2
   000069         007100 DATA DIVISION.                                                   IX1094.2
   000070         007200                                                                  IX1094.2
   000071         007300 FILE SECTION.                                                    IX1094.2
   000072         007400                                                                  IX1094.2
   000073         007500 FD  RAW-DATA.                                                    IX1094.2
   000074         007600                                                                  IX1094.2
   000075         007700 01  RAW-DATA-SATZ.                                               IX1094.2
   000076         007800     05  RAW-DATA-KEY        PIC X(6).                            IX1094.2
   000077         007900     05  C-DATE              PIC 9(6).                            IX1094.2
   000078         008000     05  C-TIME              PIC 9(8).                            IX1094.2
   000079         008100     05  C-NO-OF-TESTS       PIC 99.                              IX1094.2
   000080         008200     05  C-OK                PIC 999.                             IX1094.2
   000081         008300     05  C-ALL               PIC 999.                             IX1094.2
   000082         008400     05  C-FAIL              PIC 999.                             IX1094.2
   000083         008500     05  C-DELETED           PIC 999.                             IX1094.2
   000084         008600     05  C-INSPECT           PIC 999.                             IX1094.2
   000085         008700     05  C-NOTE              PIC X(13).                           IX1094.2
   000086         008800     05  C-INDENT            PIC X.                               IX1094.2
   000087         008900     05  C-ABORT             PIC X(8).                            IX1094.2
   000088         009000                                                                  IX1094.2
   000089         009100 FD  PRINT-FILE.                                                  IX1094.2

 ==000089==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000090         009200                                                                  IX1094.2
   000091         009300 01  PRINT-REC               PIC X(120).                          IX1094.2
   000092         009400                                                                  IX1094.2
   000093         009500 01  DUMMY-RECORD            PIC X(120).                          IX1094.2
   000094         009600                                                                  IX1094.2
   000095         009700 FD  IX-FS3                                                       IX1094.2

 ==000095==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000095==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000096         009800        DATA RECORDS IX-FS3R1-F-G-240                             IX1094.2 *
   000097         009900        LABEL RECORD STANDARD                                     IX1094.2
   000098         010000        RECORD 240                                                IX1094.2
   000099         010100        BLOCK CONTAINS 2 RECORDS.                                 IX1094.2
   000100         010200                                                                  IX1094.2
   000101         010300 01  IX-FS3R1-F-G-240.                                            IX1094.2
   000102         010400     05  IX-FS3-REC-120      PIC X(120).                          IX1094.2
   000103         010500     05  IX-FS3-REC-120-240.                                      IX1094.2
   000104         010600         10  FILLER          PIC X(8).                            IX1094.2
   000105         010700         10  IX-FS3-KEY      PIC X(29).                           IX1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000106         010800         10  FILLER          PIC X(9).                            IX1094.2
   000107         010900         10  IX-FS3-ALTER-KEY  PIC X(29).                         IX1094.2
   000108         011000         10  FILLER            PIC X(45).                         IX1094.2
   000109         011100                                                                  IX1094.2
   000110         011200                                                                  IX1094.2
   000111         011300 WORKING-STORAGE SECTION.                                         IX1094.2
   000112         011400                                                                  IX1094.2
   000113         011500 01  GRP-0101.                                                    IX1094.2
   000114         011600     05  FILLER              PIC X(10) VALUE "RECORD-KEY".        IX1094.2
   000115         011700     05  GRP-0101-KEY        PIC 9(9)  VALUE ZERO.                IX1094.2 IMP
   000116         011800     05  FILLER              PIC X(10) VALUE "END-OF-KEY".        IX1094.2
   000117         011900                                                                  IX1094.2
   000118         012000 01  GRP-0102.                                                    IX1094.2
   000119         012100     05  FILLER              PIC X(10) VALUE "ALTERN-KEY".        IX1094.2
   000120         012200     05  GRP-0102-KEY        PIC 9(9)  VALUE ZERO.                IX1094.2 IMP
   000121         012300     05  FILLER              PIC X(10) VALUE "END-AL-KEY".        IX1094.2
   000122         012400                                                                  IX1094.2
   000123         012500 01  WRK-CS-09V00            PIC S9(9) COMP VALUE ZERO.           IX1094.2 IMP
   000124         012600                                                                  IX1094.2
   000125         012700 01  EOF-FLAG                PIC 9 VALUE ZERO.                    IX1094.2 IMP
   000126         012800                                                                  IX1094.2
   000127         012900 01  RECORDS-IN-ERROR        PIC S9(5) COMP VALUE ZERO.           IX1094.2 IMP
   000128         013000                                                                  IX1094.2
   000129         013100 01  ERROR-FLAG              PIC 9 VALUE ZERO.                    IX1094.2 IMP
   000130         013200                                                                  IX1094.2
   000131         013300 01  PERM-ERRORS             PIC S9(5) COMP VALUE ZERO.           IX1094.2 IMP
   000132         013400                                                                  IX1094.2
   000133         013500 01  STATUS-TEST-00          PIC 9 VALUE ZERO.                    IX1094.2 IMP
   000134         013600                                                                  IX1094.2
   000135         013700 01  STATUS-TEST-10          PIC 9 VALUE ZERO.                    IX1094.2 IMP
   000136         013800 01  STATUS-TEST-READ        PIC 9 VALUE ZERO.                    IX1094.2 IMP
   000137         013900                                                                  IX1094.2
   000138         014000 01  IX-FS3-STATUS.                                               IX1094.2
   000139         014100     05  IX-FS3-STAT1        PIC X.                               IX1094.2
   000140         014200     05  IX-FS3-STAT2        PIC X.                               IX1094.2
   000141         014300                                                                  IX1094.2
   000142         014400 01  COUNT-OF-RECS           PIC 9(5).                            IX1094.2
   000143         014500                                                                  IX1094.2
   000144         014600 01  COUNT-OF-RECORDS REDEFINES COUNT-OF-RECS  PIC 9(5).          IX1094.2 142
   000145         014700                                                                  IX1094.2
   000146         014800 01  FILE-RECORD-INFORMATION-REC.                                 IX1094.2
   000147         014900     05  FILE-RECORD-INFO-SKELETON.                               IX1094.2
   000148         015000         10  FILLER          PIC X(48) VALUE                      IX1094.2
   000149         015100              "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00". IX1094.2
   000150         015200         10  FILLER          PIC X(46) VALUE                      IX1094.2
   000151         015300                ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000". IX1094.2
   000152         015400         10  FILLER          PIC X(26) VALUE                      IX1094.2
   000153         015500                                    ",LFIL=000000,ORG=  ,LBLR= ". IX1094.2
   000154         015600         10  FILLER          PIC X(37) VALUE                      IX1094.2
   000155         015700                         ",RECKEY=                             ". IX1094.2
   000156         015800         10  FILLER          PIC X(38) VALUE                      IX1094.2
   000157         015900                        ",ALTKEY1=                             ". IX1094.2
   000158         016000         10  FILLER          PIC X(38) VALUE                      IX1094.2
   000159         016100                        ",ALTKEY2=                             ". IX1094.2
   000160         016200         10  FILLER          PIC X(7) VALUE SPACE.                IX1094.2 IMP
   000161         016300     05  FILE-RECORD-INFO             OCCURS 10.                  IX1094.2
   000162         016400         10  FILE-RECORD-INFO-P1-120.                             IX1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000163         016500             15  FILLER      PIC X(5).                            IX1094.2
   000164         016600             15  XFILE-NAME  PIC X(6).                            IX1094.2
   000165         016700             15  FILLER      PIC X(8).                            IX1094.2
   000166         016800             15  XRECORD-NAME  PIC X(6).                          IX1094.2
   000167         016900             15  FILLER        PIC X(1).                          IX1094.2
   000168         017000             15  REELUNIT-NUMBER  PIC 9(1).                       IX1094.2
   000169         017100             15  FILLER           PIC X(7).                       IX1094.2
   000170         017200             15  XRECORD-NUMBER   PIC 9(6).                       IX1094.2
   000171         017300             15  FILLER           PIC X(6).                       IX1094.2
   000172         017400             15  UPDATE-NUMBER    PIC 9(2).                       IX1094.2
   000173         017500             15  FILLER           PIC X(5).                       IX1094.2
   000174         017600             15  ODO-NUMBER       PIC 9(4).                       IX1094.2
   000175         017700             15  FILLER           PIC X(5).                       IX1094.2
   000176         017800             15  XPROGRAM-NAME    PIC X(5).                       IX1094.2
   000177         017900             15  FILLER           PIC X(7).                       IX1094.2
   000178         018000             15  XRECORD-LENGTH   PIC 9(6).                       IX1094.2
   000179         018100             15  FILLER           PIC X(7).                       IX1094.2
   000180         018200             15  CHARS-OR-RECORDS  PIC X(2).                      IX1094.2
   000181         018300             15  FILLER            PIC X(1).                      IX1094.2
   000182         018400             15  XBLOCK-SIZE       PIC 9(4).                      IX1094.2
   000183         018500             15  FILLER            PIC X(6).                      IX1094.2
   000184         018600             15  RECORDS-IN-FILE   PIC 9(6).                      IX1094.2
   000185         018700             15  FILLER            PIC X(5).                      IX1094.2
   000186         018800             15  XFILE-ORGANIZATION  PIC X(2).                    IX1094.2
   000187         018900             15  FILLER              PIC X(6).                    IX1094.2
   000188         019000             15  XLABEL-TYPE         PIC X(1).                    IX1094.2
   000189         019100         10  FILE-RECORD-INFO-P121-240.                           IX1094.2
   000190         019200             15  FILLER              PIC X(8).                    IX1094.2
   000191         019300             15  XRECORD-KEY         PIC X(29).                   IX1094.2
   000192         019400             15  FILLER              PIC X(9).                    IX1094.2
   000193         019500             15  ALTERNATE-KEY1      PIC X(29).                   IX1094.2
   000194         019600             15  FILLER              PIC X(9).                    IX1094.2
   000195         019700             15  ALTERNATE-KEY2      PIC X(29).                   IX1094.2
   000196         019800             15  FILLER              PIC X(7).                    IX1094.2
   000197         019900                                                                  IX1094.2
   000198         020000 01  TEST-RESULTS.                                                IX1094.2
   000199         020100     02 FILLER                   PIC X      VALUE SPACE.          IX1094.2 IMP
   000200         020200     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1094.2 IMP
   000201         020300     02 FILLER                   PIC X      VALUE SPACE.          IX1094.2 IMP
   000202         020400     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1094.2 IMP
   000203         020500     02 FILLER                   PIC X      VALUE SPACE.          IX1094.2 IMP
   000204         020600     02  PAR-NAME.                                                IX1094.2
   000205         020700       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1094.2 IMP
   000206         020800       03  PARDOT-X              PIC X      VALUE SPACE.          IX1094.2 IMP
   000207         020900       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1094.2 IMP
   000208         021000     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1094.2 IMP
   000209         021100     02 RE-MARK                  PIC X(61).                       IX1094.2
   000210         021200 01  TEST-COMPUTED.                                               IX1094.2
   000211         021300     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1094.2 IMP
   000212         021400     02 FILLER                   PIC X(17)  VALUE                 IX1094.2
   000213         021500            "       COMPUTED=".                                   IX1094.2
   000214         021600     02 COMPUTED-X.                                               IX1094.2
   000215         021700     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1094.2 IMP
   000216         021800     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1094.2 215
   000217         021900                                 PIC -9(9).9(9).                  IX1094.2
   000218         022000     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1094.2 215
   000219         022100     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1094.2 215
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000220         022200     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1094.2 215
   000221         022300     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1094.2 215
   000222         022400         04 COMPUTED-18V0                    PIC -9(18).          IX1094.2
   000223         022500         04 FILLER                           PIC X.               IX1094.2
   000224         022600     03 FILLER PIC X(50) VALUE SPACE.                             IX1094.2 IMP
   000225         022700 01  TEST-CORRECT.                                                IX1094.2
   000226         022800     02 FILLER PIC X(30) VALUE SPACE.                             IX1094.2 IMP
   000227         022900     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1094.2
   000228         023000     02 CORRECT-X.                                                IX1094.2
   000229         023100     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1094.2 IMP
   000230         023200     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1094.2 229
   000231         023300     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1094.2 229
   000232         023400     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1094.2 229
   000233         023500     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1094.2 229
   000234         023600     03      CR-18V0 REDEFINES CORRECT-A.                         IX1094.2 229
   000235         023700         04 CORRECT-18V0                     PIC -9(18).          IX1094.2
   000236         023800         04 FILLER                           PIC X.               IX1094.2
   000237         023900     03 FILLER PIC X(2) VALUE SPACE.                              IX1094.2 IMP
   000238         024000     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1094.2 IMP
   000239         024100 01  CCVS-C-1.                                                    IX1094.2
   000240         024200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1094.2
   000241         024300-    "SS  PARAGRAPH-NAME                                          IX1094.2
   000242         024400-    "       REMARKS".                                            IX1094.2
   000243         024500     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1094.2 IMP
   000244         024600 01  CCVS-C-2.                                                    IX1094.2
   000245         024700     02 FILLER                     PIC X        VALUE SPACE.      IX1094.2 IMP
   000246         024800     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1094.2
   000247         024900     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1094.2 IMP
   000248         025000     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1094.2
   000249         025100     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1094.2 IMP
   000250         025200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1094.2 IMP
   000251         025300 01  REC-CT                        PIC 99       VALUE ZERO.       IX1094.2 IMP
   000252         025400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1094.2 IMP
   000253         025500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1094.2 IMP
   000254         025600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1094.2 IMP
   000255         025700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1094.2 IMP
   000256         025800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1094.2 IMP
   000257         025900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1094.2 IMP
   000258         026000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1094.2 IMP
   000259         026100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1094.2 IMP
   000260         026200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1094.2 IMP
   000261         026300 01  CCVS-H-1.                                                    IX1094.2
   000262         026400     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1094.2 IMP
   000263         026500     02  FILLER                    PIC X(42)    VALUE             IX1094.2
   000264         026600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1094.2
   000265         026700     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1094.2 IMP
   000266         026800 01  CCVS-H-2A.                                                   IX1094.2
   000267         026900   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1094.2 IMP
   000268         027000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1094.2
   000269         027100   02  FILLER                        PIC XXXX   VALUE             IX1094.2
   000270         027200     "4.2 ".                                                      IX1094.2
   000271         027300   02  FILLER                        PIC X(28)  VALUE             IX1094.2
   000272         027400            " COPY - NOT FOR DISTRIBUTION".                       IX1094.2
   000273         027500   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1094.2 IMP
   000274         027600                                                                  IX1094.2
   000275         027700 01  CCVS-H-2B.                                                   IX1094.2
   000276         027800   02  FILLER                        PIC X(15)  VALUE             IX1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000277         027900            "TEST RESULT OF ".                                    IX1094.2
   000278         028000   02  TEST-ID                       PIC X(9).                    IX1094.2
   000279         028100   02  FILLER                        PIC X(4)   VALUE             IX1094.2
   000280         028200            " IN ".                                               IX1094.2
   000281         028300   02  FILLER                        PIC X(12)  VALUE             IX1094.2
   000282         028400     " HIGH       ".                                              IX1094.2
   000283         028500   02  FILLER                        PIC X(22)  VALUE             IX1094.2
   000284         028600            " LEVEL VALIDATION FOR ".                             IX1094.2
   000285         028700   02  FILLER                        PIC X(58)  VALUE             IX1094.2
   000286         028800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1094.2
   000287         028900 01  CCVS-H-3.                                                    IX1094.2
   000288         029000     02  FILLER                      PIC X(34)  VALUE             IX1094.2
   000289         029100            " FOR OFFICIAL USE ONLY    ".                         IX1094.2
   000290         029200     02  FILLER                      PIC X(58)  VALUE             IX1094.2
   000291         029300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1094.2
   000292         029400     02  FILLER                      PIC X(28)  VALUE             IX1094.2
   000293         029500            "  COPYRIGHT   1985 ".                                IX1094.2
   000294         029600 01  CCVS-E-1.                                                    IX1094.2
   000295         029700     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1094.2 IMP
   000296         029800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1094.2
   000297         029900     02 ID-AGAIN                     PIC X(9).                    IX1094.2
   000298         030000     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1094.2 IMP
   000299         030100 01  CCVS-E-2.                                                    IX1094.2
   000300         030200     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1094.2 IMP
   000301         030300     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1094.2 IMP
   000302         030400     02 CCVS-E-2-2.                                               IX1094.2
   000303         030500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1094.2 IMP
   000304         030600         03 FILLER                   PIC X      VALUE SPACE.      IX1094.2 IMP
   000305         030700         03 ENDER-DESC               PIC X(44)  VALUE             IX1094.2
   000306         030800            "ERRORS ENCOUNTERED".                                 IX1094.2
   000307         030900 01  CCVS-E-3.                                                    IX1094.2
   000308         031000     02  FILLER                      PIC X(22)  VALUE             IX1094.2
   000309         031100            " FOR OFFICIAL USE ONLY".                             IX1094.2
   000310         031200     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1094.2 IMP
   000311         031300     02  FILLER                      PIC X(58)  VALUE             IX1094.2
   000312         031400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1094.2
   000313         031500     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1094.2 IMP
   000314         031600     02 FILLER                       PIC X(15)  VALUE             IX1094.2
   000315         031700             " COPYRIGHT 1985".                                   IX1094.2
   000316         031800 01  CCVS-E-4.                                                    IX1094.2
   000317         031900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1094.2 IMP
   000318         032000     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1094.2
   000319         032100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1094.2 IMP
   000320         032200     02 FILLER                       PIC X(40)  VALUE             IX1094.2
   000321         032300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1094.2
   000322         032400 01  XXINFO.                                                      IX1094.2
   000323         032500     02 FILLER                       PIC X(19)  VALUE             IX1094.2
   000324         032600            "*** INFORMATION ***".                                IX1094.2
   000325         032700     02 INFO-TEXT.                                                IX1094.2
   000326         032800       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1094.2 IMP
   000327         032900       04 XXCOMPUTED                 PIC X(20).                   IX1094.2
   000328         033000       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1094.2 IMP
   000329         033100       04 XXCORRECT                  PIC X(20).                   IX1094.2
   000330         033200     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1094.2
   000331         033300 01  HYPHEN-LINE.                                                 IX1094.2
   000332         033400     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1094.2 IMP
   000333         033500     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000334         033600-    "*****************************************".                 IX1094.2
   000335         033700     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1094.2
   000336         033800-    "******************************".                            IX1094.2
   000337         033900 01  TEST-NO                         PIC 99.                      IX1094.2
   000338         034000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1094.2
   000339         034100     "IX109A".                                                    IX1094.2
   000340         034200 PROCEDURE DIVISION.                                              IX1094.2
   000341         034300 DECLARATIVES.                                                    IX1094.2
   000342         034400                                                                  IX1094.2
   000343         034500 SECT-IX109-0002 SECTION.                                         IX1094.2
   000344         034600     USE AFTER EXCEPTION PROCEDURE ON IX-FS3.                     IX1094.2 95
   000345         034700 INPUT-PROCESS.                                                   IX1094.2
   000346         034800     IF TEST-NO = 13                                              IX1094.2 337
   000347      1  034900        GO TO D-R-TEST-F1-06-1.                                   IX1094.2 355
   000348         035000     IF STATUS-TEST-10 EQUAL TO 1                                 IX1094.2 135
   000349      1  035100        IF  IX-FS3-STAT1 EQUAL TO "1"                             IX1094.2 139
   000350      2  035200            MOVE 1 TO EOF-FLAG                                    IX1094.2 125
   000351      1  035300        ELSE                                                      IX1094.2
   000352      2  035400           IF  IX-FS3-STAT1 GREATER THAN "1"                      IX1094.2 139
   000353      3  035500           MOVE 1 TO PERM-ERRORS.                                 IX1094.2 131
   000354         035600     GO TO DECL-EXIT.                                             IX1094.2 485
   000355         035700 D-R-TEST-F1-06-1.                                                IX1094.2
   000356         035800     IF IX-FS3-STATUS EQUAL TO "46"                               IX1094.2 138
   000357      1  035900         GO TO D-R-PASS-F1-06-0.                                  IX1094.2 364
   000358         036000 D-R-FAIL-F1-06-0.                                                IX1094.2
   000359         036100     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1094.2 138 215
   000360         036200     MOVE "46" TO CORRECT-X.                                      IX1094.2 228
   000361         036300     MOVE "IX-5, 1.3.4, (5) E 3)" TO RE-MARK.                     IX1094.2 209
   000362         036400     PERFORM D-FAIL.                                              IX1094.2 391
   000363         036500     GO TO D-R-WRITE-F1-06-0.                                     IX1094.2 366
   000364         036600 D-R-PASS-F1-06-0.                                                IX1094.2
   000365         036700     PERFORM D-PASS.                                              IX1094.2 390
   000366         036800 D-R-WRITE-F1-06-0.                                               IX1094.2
   000367         036900     MOVE "READ.        46 EXP." TO FEATURE.                      IX1094.2 200
   000368         037000     MOVE "REA-TEST-F1-06-0" TO PAR-NAME.                         IX1094.2 204
   000369         037100     PERFORM D-PRINT-DETAIL.                                      IX1094.2 392
   000370         037200 D-CLOSE-FILES.                                                   IX1094.2
   000371         037300     CLOSE IX-FS3.                                                IX1094.2 95
   000372         037400     OPEN I-O RAW-DATA.                                           IX1094.2 73
   000373         037500     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1094.2 338 76
   000374         037600     READ RAW-DATA INVALID KEY GO TO D-END-E-2.                   IX1094.2 73 382
   000375         037700     MOVE "OK.     " TO C-ABORT.                                  IX1094.2 87
   000376         037800     MOVE PASS-COUNTER TO C-OK.                                   IX1094.2 255 80
   000377         037900     MOVE ERROR-HOLD   TO C-ALL.                                  IX1094.2 257 81
   000378         038000     MOVE ERROR-COUNTER TO C-FAIL.                                IX1094.2 253 82
   000379         038100     MOVE DELETE-COUNTER TO C-DELETED.                            IX1094.2 252 83
   000380         038200     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1094.2 254 84
   000381         038300     REWRITE RAW-DATA-SATZ INVALID KEY GO TO D-END-E-2.           IX1094.2 75 382
   000382         038400 D-END-E-2.                                                       IX1094.2
   000383         038500     CLOSE RAW-DATA.                                              IX1094.2 73
   000384         038600     PERFORM D-END-ROUTINE THRU D-END-ROUTINE-13.                 IX1094.2 407 429
   000385         038700     CLOSE PRINT-FILE.                                            IX1094.2 89
   000386         038800 D-TERMINATE-CCVS.                                                IX1094.2
   000387         038900     EXIT PROGRAM.                                                IX1094.2
   000388         039000 D-TERMINATE-CALL.                                                IX1094.2
   000389         039100     STOP     RUN.                                                IX1094.2
   000390         039200 D-PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.         IX1094.2 202 255
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000391         039300 D-FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.        IX1094.2 202 253
   000392         039400 D-PRINT-DETAIL.                                                  IX1094.2
   000393         039500     IF   REC-CT NOT EQUAL TO ZERO                                IX1094.2 251 IMP
   000394      1  039600          MOVE "." TO PARDOT-X                                    IX1094.2 206
   000395      1  039700          MOVE REC-CT TO DOTVALUE.                                IX1094.2 251 207
   000396         039800     MOVE TEST-RESULTS TO PRINT-REC.                              IX1094.2 198 91
   000397         039900     PERFORM D-WRITE-LINE.                                        IX1094.2 442
   000398         040000     IF   P-OR-F EQUAL TO "FAIL*"                                 IX1094.2 202
   000399      1  040100          PERFORM D-WRITE-LINE                                    IX1094.2 442
   000400      1  040200          PERFORM D-FAIL-ROUTINE THRU D-FAIL-ROUTINE-EX           IX1094.2 461 475
   000401         040300     ELSE                                                         IX1094.2
   000402      1  040400          PERFORM D-BAIL-OUT THRU D-BAIL-OUT-EX.                  IX1094.2 476 484
   000403         040500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1094.2 IMP 202 IMP 214
   000404         040600     MOVE SPACE TO CORRECT-X.                                     IX1094.2 IMP 228
   000405         040700     IF   REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.           IX1094.2 251 IMP IMP 204
   000406         040800     MOVE SPACE TO RE-MARK.                                       IX1094.2 IMP 209
   000407         040900 D-END-ROUTINE.                                                   IX1094.2
   000408         041000     MOVE HYPHEN-LINE TO DUMMY-RECORD.                            IX1094.2 331 93
   000409         041100     PERFORM D-WRITE-LINE 5 TIMES.                                IX1094.2 442
   000410         041200 D-END-RTN-EXIT.                                                  IX1094.2
   000411         041300     MOVE CCVS-E-1 TO DUMMY-RECORD.                               IX1094.2 294 93
   000412         041400     PERFORM D-WRITE-LINE 2 TIMES.                                IX1094.2 442
   000413         041500 D-END-ROUTINE-1.                                                 IX1094.2
   000414         041600     ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO       IX1094.2 253 257 254
   000415         041700     ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.                IX1094.2 257 252 257
   000416         041800     ADD PASS-COUNTER TO ERROR-HOLD.                              IX1094.2 255 257
   000417         041900     MOVE PASS-COUNTER TO CCVS-E-4-1.                             IX1094.2 255 317
   000418         042000     MOVE ERROR-HOLD TO CCVS-E-4-2.                               IX1094.2 257 319
   000419         042100     MOVE CCVS-E-4 TO CCVS-E-2-2.                                 IX1094.2 316 302
   000420         042200     MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM D-WRITE-LINE.          IX1094.2 299 93 442
   000421         042300  D-END-ROUTINE-12.                                               IX1094.2
   000422         042400     MOVE "TEST(S) FAILED" TO ENDER-DESC.                         IX1094.2 305
   000423         042500     IF  ERROR-COUNTER IS EQUAL TO ZERO                           IX1094.2 253 IMP
   000424      1  042600         MOVE "NO " TO ERROR-TOTAL                                IX1094.2 303
   000425         042700     ELSE                                                         IX1094.2
   000426      1  042800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1094.2 253 303
   000427         042900     MOVE    CCVS-E-2 TO DUMMY-RECORD.                            IX1094.2 299 93
   000428         043000     PERFORM D-WRITE-LINE.                                        IX1094.2 442
   000429         043100 D-END-ROUTINE-13.                                                IX1094.2
   000430         043200     IF  DELETE-COUNTER IS EQUAL TO ZERO                          IX1094.2 252 IMP
   000431      1  043300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1094.2 303
   000432      1  043400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1094.2 252 303
   000433         043500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1094.2 305
   000434         043600     MOVE CCVS-E-2 TO DUMMY-RECORD.                               IX1094.2 299 93
   000435         043700     PERFORM D-WRITE-LINE.                                        IX1094.2 442
   000436         043800     IF   INSPECT-COUNTER EQUAL TO ZERO                           IX1094.2 254 IMP
   000437      1  043900          MOVE "NO " TO ERROR-TOTAL                               IX1094.2 303
   000438      1  044000     ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                    IX1094.2 254 303
   000439         044100     MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.             IX1094.2 305
   000440         044200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1094.2 299 93 442
   000441         044300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1094.2 307 93 442
   000442         044400 D-WRITE-LINE.                                                    IX1094.2
   000443         044500     ADD 1 TO RECORD-COUNT.                                       IX1094.2 259
   000444         044600     IF RECORD-COUNT GREATER 42                                   IX1094.2 259
   000445      1  044700        MOVE DUMMY-RECORD TO DUMMY-HOLD                           IX1094.2 93 258
   000446      1  044800        MOVE SPACE TO DUMMY-RECORD                                IX1094.2 IMP 93
   000447      1  044900        WRITE DUMMY-RECORD AFTER ADVANCING PAGE                   IX1094.2 93
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448      1  045000        MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1094.2 261 93 458
   000449      1  045100        MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES   IX1094.2 266 93 458
   000450      1  045200        MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1094.2 275 93 458
   000451      1  045300        MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES   IX1094.2 287 93 458
   000452      1  045400        MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1094.2 239 93 458
   000453      1  045500        MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM D-WRT-LN           IX1094.2 244 93 458
   000454      1  045600        MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM D-WRT-LN         IX1094.2 331 93 458
   000455      1  045700        MOVE DUMMY-HOLD TO DUMMY-RECORD                           IX1094.2 258 93
   000456      1  045800        MOVE ZERO TO RECORD-COUNT.                                IX1094.2 IMP 259
   000457         045900     PERFORM D-WRT-LN.                                            IX1094.2 458
   000458         046000 D-WRT-LN.                                                        IX1094.2
   000459         046100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1094.2 93
   000460         046200     MOVE SPACE TO DUMMY-RECORD.                                  IX1094.2 IMP 93
   000461         046300 D-FAIL-ROUTINE.                                                  IX1094.2
   000462         046400     IF   COMPUTED-X NOT EQUAL TO SPACE                           IX1094.2 214 IMP
   000463      1  046500          GO TO D-FAIL-ROUTINE-WRITE.                             IX1094.2 470
   000464         046600     IF   CORRECT-X NOT EQUAL TO SPACE GO TO D-FAIL-ROUTINE-WRITE.IX1094.2 228 IMP 470
   000465         046700     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1094.2 260 330
   000466         046800     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    IX1094.2 325
   000467         046900     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1094.2 322 93 442
   000468         047000     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1094.2 IMP 330
   000469         047100     GO TO D-FAIL-ROUTINE-EX.                                     IX1094.2 475
   000470         047200 D-FAIL-ROUTINE-WRITE.                                            IX1094.2
   000471         047300     MOVE TEST-COMPUTED TO PRINT-REC PERFORM D-WRITE-LINE         IX1094.2 210 91 442
   000472         047400     MOVE ANSI-REFERENCE TO COR-ANSI-REFERENCE.                   IX1094.2 260 238
   000473         047500     MOVE TEST-CORRECT TO PRINT-REC PERFORM D-WRITE-LINE 2 TIMES. IX1094.2 225 91 442
   000474         047600     MOVE SPACES TO COR-ANSI-REFERENCE.                           IX1094.2 IMP 238
   000475         047700 D-FAIL-ROUTINE-EX. EXIT.                                         IX1094.2
   000476         047800 D-BAIL-OUT.                                                      IX1094.2
   000477         047900     IF  COMPUTED-A NOT EQUAL TO SPACE GO TO D-BAIL-OUT-WRITE.    IX1094.2 215 IMP 479
   000478         048000     IF  CORRECT-A EQUAL TO SPACE GO TO D-BAIL-OUT-EX.            IX1094.2 229 IMP 484
   000479         048100 D-BAIL-OUT-WRITE.                                                IX1094.2
   000480         048200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1094.2 229 329 215 327
   000481         048300     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1094.2 260 330
   000482         048400     MOVE XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.   IX1094.2 322 93 442
   000483         048500     MOVE SPACES TO INF-ANSI-REFERENCE.                           IX1094.2 IMP 330
   000484         048600 D-BAIL-OUT-EX. EXIT.                                             IX1094.2
   000485         048700 DECL-EXIT.  EXIT.                                                IX1094.2
   000486         048800 END DECLARATIVES.                                                IX1094.2
   000487         048900                                                                  IX1094.2
   000488         049000                                                                  IX1094.2
   000489         049100 CCVS1 SECTION.                                                   IX1094.2
   000490         049200 OPEN-FILES.                                                      IX1094.2
   000491         049300     OPEN I-O RAW-DATA.                                           IX1094.2 73
   000492         049400     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1094.2 338 76
   000493         049500     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1094.2 73 499
   000494         049600     MOVE "ABORTED " TO C-ABORT.                                  IX1094.2 87
   000495         049700     ADD 1 TO C-NO-OF-TESTS.                                      IX1094.2 79
   000496         049800     ACCEPT C-DATE  FROM DATE.                                    IX1094.2 77
   000497         049900     ACCEPT C-TIME  FROM TIME.                                    IX1094.2 78
   000498         050000     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1094.2 75 499
   000499         050100 END-E-1.                                                         IX1094.2
   000500         050200     CLOSE RAW-DATA.                                              IX1094.2 73
   000501         050300     OPEN    OUTPUT PRINT-FILE.                                   IX1094.2 89
   000502         050400     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1094.2 338 278 338 297
   000503         050500     MOVE    SPACE TO TEST-RESULTS.                               IX1094.2 IMP 198
   000504         050600     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1094.2 548 553
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000505         050700     MOVE    ZERO TO REC-SKL-SUB.                                 IX1094.2 IMP 250
   000506         050800     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1094.2 507
   000507         050900 CCVS-INIT-FILE.                                                  IX1094.2
   000508         051000     ADD     1 TO REC-SKL-SUB.                                    IX1094.2 250
   000509         051100     MOVE    FILE-RECORD-INFO-SKELETON                            IX1094.2 147
   000510         051200          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1094.2 161 250
   000511         051300 CCVS-INIT-EXIT.                                                  IX1094.2
   000512         051400     GO TO CCVS1-EXIT.                                            IX1094.2 635
   000513         051500 CLOSE-FILES.                                                     IX1094.2
   000514         051600     OPEN I-O RAW-DATA.                                           IX1094.2 73
   000515         051700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1094.2 338 76
   000516         051800     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1094.2 73 524
   000517         051900     MOVE "OK.     " TO C-ABORT.                                  IX1094.2 87
   000518         052000     MOVE PASS-COUNTER TO C-OK.                                   IX1094.2 255 80
   000519         052100     MOVE ERROR-HOLD   TO C-ALL.                                  IX1094.2 257 81
   000520         052200     MOVE ERROR-COUNTER TO C-FAIL.                                IX1094.2 253 82
   000521         052300     MOVE DELETE-COUNTER TO C-DELETED.                            IX1094.2 252 83
   000522         052400     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1094.2 254 84
   000523         052500     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1094.2 75 524
   000524         052600 END-E-2.                                                         IX1094.2
   000525         052700     CLOSE RAW-DATA.                                              IX1094.2 73
   000526         052800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1094.2 557 578 89
   000527         052900 TERMINATE-CCVS.                                                  IX1094.2
   000528         053000     EXIT PROGRAM.                                                IX1094.2
   000529         053100 TERMINATE-CALL.                                                  IX1094.2
   000530         053200     STOP     RUN.                                                IX1094.2
   000531         053300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1094.2 202 254
   000532         053400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1094.2 202 255
   000533         053500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1094.2 202 253
   000534         053600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1094.2 202 252
   000535         053700     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1094.2 209
   000536         053800 PRINT-DETAIL.                                                    IX1094.2
   000537         053900     IF REC-CT NOT EQUAL TO ZERO                                  IX1094.2 251 IMP
   000538      1  054000             MOVE "." TO PARDOT-X                                 IX1094.2 206
   000539      1  054100             MOVE REC-CT TO DOTVALUE.                             IX1094.2 251 207
   000540         054200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1094.2 198 91 590
   000541         054300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1094.2 202 590
   000542      1  054400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1094.2 611 625
   000543      1  054500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1094.2 626 634
   000544         054600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1094.2 IMP 202 IMP 214
   000545         054700     MOVE SPACE TO CORRECT-X.                                     IX1094.2 IMP 228
   000546         054800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1094.2 251 IMP IMP 204
   000547         054900     MOVE     SPACE TO RE-MARK.                                   IX1094.2 IMP 209
   000548         055000 HEAD-ROUTINE.                                                    IX1094.2
   000549         055100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1094.2 261 93 590
   000550         055200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1094.2 266 93 590
   000551         055300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1094.2 275 93 590
   000552         055400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1094.2 287 93 590
   000553         055500 COLUMN-NAMES-ROUTINE.                                            IX1094.2
   000554         055600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1094.2 239 93 590
   000555         055700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1094.2 244 93 590
   000556         055800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1094.2 331 93 590
   000557         055900 END-ROUTINE.                                                     IX1094.2
   000558         056000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1094.2 331 93 590
   000559         056100 END-RTN-EXIT.                                                    IX1094.2
   000560         056200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1094.2 294 93 590
   000561         056300 END-ROUTINE-1.                                                   IX1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000562         056400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1094.2 253 257 254
   000563         056500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1094.2 257 252 257
   000564         056600      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1094.2 255 257
   000565         056700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1094.2
   000566         056800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1094.2 255 317
   000567         056900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1094.2 257 319
   000568         057000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1094.2 316 302
   000569         057100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1094.2 299 93 590
   000570         057200  END-ROUTINE-12.                                                 IX1094.2
   000571         057300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1094.2 305
   000572         057400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1094.2 253 IMP
   000573      1  057500         MOVE "NO " TO ERROR-TOTAL                                IX1094.2 303
   000574         057600         ELSE                                                     IX1094.2
   000575      1  057700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1094.2 253 303
   000576         057800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1094.2 299 93
   000577         057900     PERFORM WRITE-LINE.                                          IX1094.2 590
   000578         058000 END-ROUTINE-13.                                                  IX1094.2
   000579         058100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1094.2 252 IMP
   000580      1  058200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1094.2 303
   000581      1  058300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1094.2 252 303
   000582         058400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1094.2 305
   000583         058500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1094.2 299 93 590
   000584         058600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1094.2 254 IMP
   000585      1  058700          MOVE "NO " TO ERROR-TOTAL                               IX1094.2 303
   000586      1  058800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1094.2 254 303
   000587         058900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1094.2 305
   000588         059000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1094.2 299 93 590
   000589         059100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1094.2 307 93 590
   000590         059200 WRITE-LINE.                                                      IX1094.2
   000591         059300     ADD 1 TO RECORD-COUNT.                                       IX1094.2 259
   000592         059400     IF RECORD-COUNT GREATER 42                                   IX1094.2 259
   000593      1  059500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1094.2 93 258
   000594      1  059600         MOVE SPACE TO DUMMY-RECORD                               IX1094.2 IMP 93
   000595      1  059700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1094.2 93
   000596      1  059800         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1094.2 261 93 606
   000597      1  059900         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1094.2 266 93 606
   000598      1  060000         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1094.2 275 93 606
   000599      1  060100         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1094.2 287 93 606
   000600      1  060200         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1094.2 239 93 606
   000601      1  060300         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1094.2 244 93 606
   000602      1  060400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1094.2 331 93 606
   000603      1  060500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1094.2 258 93
   000604      1  060600         MOVE ZERO TO RECORD-COUNT.                               IX1094.2 IMP 259
   000605         060700     PERFORM WRT-LN.                                              IX1094.2 606
   000606         060800 WRT-LN.                                                          IX1094.2
   000607         060900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1094.2 93
   000608         061000     MOVE SPACE TO DUMMY-RECORD.                                  IX1094.2 IMP 93
   000609         061100 BLANK-LINE-PRINT.                                                IX1094.2
   000610         061200     PERFORM WRT-LN.                                              IX1094.2 606
   000611         061300 FAIL-ROUTINE.                                                    IX1094.2
   000612         061400     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1094.2 214 IMP
   000613      1  061500            GO TO   FAIL-ROUTINE-WRITE.                           IX1094.2 620
   000614         061600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1094.2 228 IMP 620
   000615         061700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1094.2 260 330
   000616         061800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1094.2 325
   000617         061900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1094.2 322 93 590
   000618         062000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1094.2 IMP 330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000619         062100     GO TO  FAIL-ROUTINE-EX.                                      IX1094.2 625
   000620         062200 FAIL-ROUTINE-WRITE.                                              IX1094.2
   000621         062300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1094.2 210 91 590
   000622         062400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1094.2 260 238
   000623         062500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1094.2 225 91 590
   000624         062600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1094.2 IMP 238
   000625         062700 FAIL-ROUTINE-EX. EXIT.                                           IX1094.2
   000626         062800 BAIL-OUT.                                                        IX1094.2
   000627         062900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1094.2 215 IMP 629
   000628         063000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1094.2 229 IMP 634
   000629         063100 BAIL-OUT-WRITE.                                                  IX1094.2
   000630         063200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1094.2 229 329 215 327
   000631         063300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1094.2 260 330
   000632         063400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1094.2 322 93 590
   000633         063500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1094.2 IMP 330
   000634         063600 BAIL-OUT-EX. EXIT.                                               IX1094.2
   000635         063700 CCVS1-EXIT.                                                      IX1094.2
   000636         063800     EXIT.                                                        IX1094.2
   000637         063900                                                                  IX1094.2
   000638         064000 SECT-IX109A-0003 SECTION.                                        IX1094.2
   000639         064100 SEQ-INIT-010.                                                    IX1094.2
   000640         064200     MOVE ZERO TO TEST-NO.                                        IX1094.2 IMP 337
   000641         064300     MOVE "IX-FS3" TO XFILE-NAME (1).                             IX1094.2 164
   000642         064400     MOVE "R1-F-G" TO XRECORD-NAME (1).                           IX1094.2 166
   000643         064500     MOVE CCVS-PGM-ID TO XPROGRAM-NAME (1).                       IX1094.2 338 176
   000644         064600     MOVE 000240 TO XRECORD-LENGTH (1).                           IX1094.2 178
   000645         064700     MOVE "RC" TO CHARS-OR-RECORDS (1).                           IX1094.2 180
   000646         064800     MOVE 0002 TO XBLOCK-SIZE (1).                                IX1094.2 182
   000647         064900     MOVE 000050 TO RECORDS-IN-FILE (1).                          IX1094.2 184
   000648         065000     MOVE "IX" TO XFILE-ORGANIZATION (1).                         IX1094.2 186
   000649         065100     MOVE "S" TO XLABEL-TYPE (1).                                 IX1094.2 188
   000650         065200     MOVE 000001 TO XRECORD-NUMBER (1).                           IX1094.2 170
   000651         065300     MOVE 0 TO COUNT-OF-RECS.                                     IX1094.2 142
   000652         065400                                                                  IX1094.2
   000653         065600*   TEST  1                                                      *IX1094.2
   000654         065700*         OPEN OUTPUT ...                 00 EXPECTED            *IX1094.2
   000655         065800*         IX-3, 1.3.4 (1) A                                      *IX1094.2
   000656         065900*    STATUS 00 CHECK ON OUTPUT FILE IX-FS3                       *IX1094.2
   000657         066000*    THE OUTPUT STATEMENT IS SUCCESSFULLY EXECUTED               *IX1094.2
   000658         066200 OPN-INIT-GF-01-0.                                                IX1094.2
   000659         066300     MOVE 1 TO STATUS-TEST-00.                                    IX1094.2 133
   000660         066400     MOVE SPACES TO IX-FS3-STATUS.                                IX1094.2 IMP 138
   000661         066500     MOVE "OPEN OUTPUT: 00 EXP." TO FEATURE.                      IX1094.2 200
   000662         066600     MOVE "OPN-TEST-GF-01-0" TO PAR-NAME.                         IX1094.2 204
   000663         066700     OPEN                                                         IX1094.2
   000664         066800        OUTPUT IX-FS3.                                            IX1094.2 95
   000665         066900     IF IX-FS3-STATUS EQUAL TO "00"                               IX1094.2 138
   000666      1  067000         GO TO OPN-PASS-GF-01-0.                                  IX1094.2 673
   000667         067100 OPN-FAIL-GF-01-0.                                                IX1094.2
   000668         067200     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1094.2 209
   000669         067300     PERFORM FAIL.                                                IX1094.2 533
   000670         067400     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1094.2 138 215
   000671         067500     MOVE "00" TO CORRECT-X.                                      IX1094.2 228
   000672         067600     GO TO OPN-WRITE-GF-01-0.                                     IX1094.2 675
   000673         067700 OPN-PASS-GF-01-0.                                                IX1094.2
   000674         067800     PERFORM PASS.                                                IX1094.2 532
   000675         067900 OPN-WRITE-GF-01-0.                                               IX1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000676         068000     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000677         068200*   TEST  2                                                      *IX1094.2
   000678         068300*         WRITE                           00 EXPECTED            *IX1094.2
   000679         068400*         IX-3, 1.3.4 (1) A                                      *IX1094.2
   000680         068500*    CREATING A INDEXED FILE WITH 50 RECORDS                     *IX1094.2
   000681         068600*    KEY:  FROM  000000001 TO 000000050                          *IX1094.2
   000682         068800 WRI-INIT-GF-01-0.                                                IX1094.2
   000683         068900     MOVE SPACES TO IX-FS3-STATUS.                                IX1094.2 IMP 138
   000684         069000     MOVE 0 TO STATUS-TEST-00.                                    IX1094.2 133
   000685         069100     MOVE "WRITE: 00 EXPECTED" TO FEATURE.                        IX1094.2 200
   000686         069200     MOVE "WRI-TEST-GF-01-0" TO PAR-NAME.                         IX1094.2 204
   000687         069300 WRI-TEST-GF-01-0.                                                IX1094.2
   000688         069400     MOVE XRECORD-NUMBER (1) TO GRP-0101-KEY.                     IX1094.2 170 115
   000689         069500     MOVE GRP-0101 TO XRECORD-KEY (1).                            IX1094.2 113 191
   000690         069600     MOVE GRP-0102 TO ALTERNATE-KEY1 (1).                         IX1094.2 118 193
   000691         069700*    THE VALUE OF THE ALTERNATE KEY IS 50 TIMES UNCHANGED        *IX1094.2
   000692         069800     MOVE FILE-RECORD-INFO (1) TO IX-FS3R1-F-G-240.               IX1094.2 161 101
   000693         069900     WRITE IX-FS3R1-F-G-240.                                      IX1094.2 101
   000694         070000     IF IX-FS3-STATUS  NOT = "00"                                 IX1094.2 138
   000695      1  070100         ADD 1 TO RECORDS-IN-ERROR                                IX1094.2 127
   000696         070200     ELSE                                                         IX1094.2
   000697      1  070300         ADD 1 TO COUNT-OF-RECS.                                  IX1094.2 142
   000698         070400     IF XRECORD-NUMBER (1) EQUAL TO 50                            IX1094.2 170
   000699      1  070500         GO TO WRI-TEST-GF-01-1.                                  IX1094.2 702
   000700         070600     ADD 1 TO XRECORD-NUMBER (1).                                 IX1094.2 170
   000701         070700     GO TO WRI-TEST-GF-01-0.                                      IX1094.2 687
   000702         070800 WRI-TEST-GF-01-1.                                                IX1094.2
   000703         070900     IF RECORDS-IN-ERROR EQUAL TO ZERO                            IX1094.2 127 IMP
   000704      1  071000         GO TO WRI-PASS-GF-01-0.                                  IX1094.2 711
   000705         071100 WRI-FAIL-GF-01-0.                                                IX1094.2
   000706         071200     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1094.2 209
   000707         071300     PERFORM FAIL.                                                IX1094.2 533
   000708         071400     MOVE "RECORDS IN ERROR =" TO COMPUTED-A.                     IX1094.2 215
   000709         071500     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       IX1094.2 127 235
   000710         071600     GO TO WRI-WRITE-GF-01-0.                                     IX1094.2 713
   000711         071700 WRI-PASS-GF-01-0.                                                IX1094.2
   000712         071800     PERFORM PASS.                                                IX1094.2 532
   000713         071900 WRI-WRITE-GF-01-0.                                               IX1094.2
   000714         072000     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000715         072100     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   IX1094.2 215
   000716         072200     MOVE "CREATE FILE IX-FS3" TO FEATURE.                        IX1094.2 200
   000717         072300     MOVE "WRI-TEST-GF-01-1" TO PAR-NAME.                         IX1094.2 204
   000718         072400     MOVE COUNT-OF-RECS TO CORRECT-18V0.                          IX1094.2 142 235
   000719         072500     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000720         072600                                                                  IX1094.2
   000721         072800*   TEST  3                                                      *IX1094.2
   000722         072900*         WRITE  (WRONG SEQUENCE)         21 EXPECTED            *IX1094.2
   000723         073000*         IX-4, 1.3.4 (3) A                                      *IX1094.2
   000724         073100*    KEY:        000000049                                       *IX1094.2
   000725         073300 WRI-INIT-GF-02-0.                                                IX1094.2
   000726         073400     MOVE SPACES TO IX-FS3-STATUS.                                IX1094.2 IMP 138
   000727         073500     MOVE 0 TO STATUS-TEST-00.                                    IX1094.2 133
   000728         073600     MOVE "WRITE:       21 EXP." TO FEATURE.                      IX1094.2 200
   000729         073700     MOVE "WRI-TEST-GF-02-0" TO PAR-NAME.                         IX1094.2 204
   000730         073800     MOVE 49 TO XRECORD-NUMBER (1).                               IX1094.2 170
   000731         073900 WRI-TEST-GF-02-0.                                                IX1094.2
   000732         074000     MOVE XRECORD-NUMBER (1) TO GRP-0101-KEY.                     IX1094.2 170 115
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000733         074100     MOVE GRP-0101 TO XRECORD-KEY (1).                            IX1094.2 113 191
   000734         074200     MOVE GRP-0102 TO ALTERNATE-KEY1 (1).                         IX1094.2 118 193
   000735         074300     MOVE FILE-RECORD-INFO (1) TO IX-FS3R1-F-G-240.               IX1094.2 161 101
   000736         074400     WRITE IX-FS3R1-F-G-240 INVALID KEY GO TO WRI-TEST-GF-02-1.   IX1094.2 101 737
   000737         074500 WRI-TEST-GF-02-1.                                                IX1094.2
   000738         074600     IF IX-FS3-STATUS  = "21"                                     IX1094.2 138
   000739      1  074700         GO TO WRI-PASS-GF-02-0.                                  IX1094.2 746
   000740         074800 WRI-FAIL-GF-02-0.                                                IX1094.2
   000741         074900     MOVE "IX-4, 1.3.4, (3) A. " TO RE-MARK.                      IX1094.2 209
   000742         075000     PERFORM FAIL.                                                IX1094.2 533
   000743         075100     MOVE  IX-FS3-STATUS      TO COMPUTED-A.                      IX1094.2 138 215
   000744         075200     MOVE "21" TO CORRECT-X.                                      IX1094.2 228
   000745         075300     GO TO WRI-WRITE-GF-02-0.                                     IX1094.2 748
   000746         075400 WRI-PASS-GF-02-0.                                                IX1094.2
   000747         075500     PERFORM PASS.                                                IX1094.2 532
   000748         075600 WRI-WRITE-GF-02-0.                                               IX1094.2
   000749         075700     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000750         075800                                                                  IX1094.2
   000751         076000*   TEST  4                                                      *IX1094.2
   000752         076100*         CLOSE OUTPUT                    00 EXPECTED            *IX1094.2
   000753         076200*         IX-3, 1.3.4 (1) A                                      *IX1094.2
   000754         076400 CLO-INIT-GF-01-0.                                                IX1094.2
   000755         076500     MOVE SPACES TO IX-FS3-STATUS.                                IX1094.2 IMP 138
   000756         076600     MOVE "CLOSE OUTPUT:00 EXP." TO FEATURE.                      IX1094.2 200
   000757         076700     MOVE "CLO-TEST-GF-01-0" TO PAR-NAME.                         IX1094.2 204
   000758         076800 CLO-TEST-GF-01-0.                                                IX1094.2
   000759         076900     CLOSE IX-FS3.                                                IX1094.2 95
   000760         077000     IF IX-FS3-STATUS = "00"                                      IX1094.2 138
   000761      1  077100         GO TO CLO-PASS-GF-01-0.                                  IX1094.2 768
   000762         077200 CLO-FAIL-GF-01-0.                                                IX1094.2
   000763         077300     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1094.2 209
   000764         077400     PERFORM FAIL.                                                IX1094.2 533
   000765         077500     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1094.2 138 215
   000766         077600     MOVE "00" TO CORRECT-X.                                      IX1094.2 228
   000767         077700     GO TO CLO-WRITE-GF-01-0.                                     IX1094.2 770
   000768         077800 CLO-PASS-GF-01-0.                                                IX1094.2
   000769         077900     PERFORM PASS.                                                IX1094.2 532
   000770         078000 CLO-WRITE-GF-01-0.                                               IX1094.2
   000771         078100     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000772         078200                                                                  IX1094.2
   000773         078400*    A INDEXED FILE WITH 50 RECORDS HAS BEEN CREATED.            *IX1094.2
   000774         078600                                                                  IX1094.2
   000775         078800*   TEST  5                                                      *IX1094.2
   000776         078900*         OPEN INPUT                      00 EXPECTED            *IX1094.2
   000777         079000*         IX-3, 1.3.4 (1) A                                      *IX1094.2
   000778         079200 OPN-INIT-GF-02-0.                                                IX1094.2
   000779         079300     MOVE SPACES TO IX-FS3-STATUS.                                IX1094.2 IMP 138
   000780         079400     MOVE "OPEN INPUT:  00 EXP." TO FEATURE.                      IX1094.2 200
   000781         079500     MOVE "OPN-TEST-GF-02-0" TO PAR-NAME.                         IX1094.2 204
   000782         079600 OPN-TEST-GF-02-0.                                                IX1094.2
   000783         079700     OPEN                                                         IX1094.2
   000784         079800        INPUT IX-FS3.                                             IX1094.2 95
   000785         079900     IF IX-FS3-STATUS EQUAL TO "00"                               IX1094.2 138
   000786      1  080000         GO TO OPN-PASS-GF-02-0.                                  IX1094.2 793
   000787         080100 OPN-FAIL-GF-02-0.                                                IX1094.2
   000788         080200     MOVE "IX-3, 1.3.4, (1) A." TO RE-MARK.                       IX1094.2 209
   000789         080300     PERFORM FAIL.                                                IX1094.2 533
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000790         080400     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1094.2 138 215
   000791         080500     MOVE "00" TO CORRECT-X.                                      IX1094.2 228
   000792         080600     GO TO OPN-WRITE-GF-02-0.                                     IX1094.2 795
   000793         080700 OPN-PASS-GF-02-0.                                                IX1094.2
   000794         080800     PERFORM PASS.                                                IX1094.2 532
   000795         080900 OPN-WRITE-GF-02-0.                                               IX1094.2
   000796         081000     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000797         081200*    STATUS 10 CHECK ON INPUT FILE IX-FS3.                       *IX1094.2
   000798         081300*    THIS TEST READS AND VERIFIES THE RECORDS WRITTEN IN         *IX1094.2
   000799         081400*    INX-TEST-004. THE USE ON INPUT PROCESSES THE AT END         *IX1094.2
   000800         081500*    CONDITION. THERE IS NO AT END PHRASE IN THE READ STATEMENT. *IX1094.2
   000801         081700 REA-INIT-F1-01-0.                                                IX1094.2
   000802         081800     MOVE 1 TO STATUS-TEST-10.                                    IX1094.2 135
   000803         081900     MOVE SPACES TO IX-FS3-STATUS.                                IX1094.2 IMP 138
   000804         082000     MOVE ZERO TO COUNT-OF-RECS.                                  IX1094.2 IMP 142
   000805         082100     MOVE ZERO TO RECORDS-IN-ERROR.                               IX1094.2 IMP 127
   000806         082200     MOVE ZERO TO PERM-ERRORS.                                    IX1094.2 IMP 131
   000807         082300     MOVE ZERO TO EOF-FLAG.                                       IX1094.2 IMP 125
   000808         082400 REA-TEST-F1-01-0.                                                IX1094.2
   000809         082500     READ IX-FS3.                                                 IX1094.2 95
   000810         082600     IF EOF-FLAG EQUAL TO 1                                       IX1094.2 125
   000811      1  082700         GO TO REA-TEST-F1-01-1.                                  IX1094.2 833
   000812         082800     MOVE IX-FS3R1-F-G-240 TO FILE-RECORD-INFO (1).               IX1094.2 101 161
   000813         082900     ADD 1 TO COUNT-OF-RECS.                                      IX1094.2 142
   000814         083000     IF COUNT-OF-RECS GREATER THAN 50                             IX1094.2 142
   000815      1  083100         MOVE "MORE THAN 50 RECORDS" TO RE-MARK                   IX1094.2 209
   000816      1  083200         GO TO REA-FAIL-F1-01-0.                                  IX1094.2 841
   000817         083300     IF COUNT-OF-RECS LESS THAN 51                                IX1094.2 142
   000818      1  083400        IF IX-FS3-STATUS NOT = "00"                               IX1094.2 138
   000819      2  083500            MOVE 1 TO STATUS-TEST-READ.                           IX1094.2 136
   000820         083600     IF PERM-ERRORS EQUAL TO 1                                    IX1094.2 131
   000821      1  083700         ADD 1 TO RECORDS-IN-ERROR                                IX1094.2 127
   000822      1  083800         GO TO REA-TEST-F1-01-1.                                  IX1094.2 833
   000823         083900     IF COUNT-OF-RECS NOT EQUAL TO XRECORD-NUMBER (1)             IX1094.2 142 170
   000824      1  084000         ADD 1 TO RECORDS-IN-ERROR                                IX1094.2 127
   000825      1  084100         GO TO REA-TEST-F1-01-1.                                  IX1094.2 833
   000826         084200     IF XFILE-NAME (1) NOT EQUAL TO "IX-FS3"                      IX1094.2 164
   000827      1  084300         ADD 1 TO RECORDS-IN-ERROR                                IX1094.2 127
   000828      1  084400         GO TO REA-TEST-F1-01-1.                                  IX1094.2 833
   000829         084500     MOVE XRECORD-KEY (1) TO GRP-0101.                            IX1094.2 191 113
   000830         084600     IF GRP-0101-KEY NOT EQUAL TO COUNT-OF-RECS                   IX1094.2 115 142
   000831      1  084700         ADD 1 TO RECORDS-IN-ERROR.                               IX1094.2 127
   000832         084800     GO TO REA-TEST-F1-01-0.                                      IX1094.2 808
   000833         084900 REA-TEST-F1-01-1.                                                IX1094.2
   000834         085100*   TEST  6                                                      *IX1094.2
   000835         085200*         READ ... .   (WITHOUT   AT END) 00 EXPECTED            *IX1094.2
   000836         085300*         IX-3, 1.3.4 (1) A                                      *IX1094.2
   000837         085500     MOVE "REA-TEST-F1-01-0" TO PAR-NAME.                         IX1094.2 204
   000838         085600     MOVE "READ (USE):  00 EXP."     TO FEATURE.                  IX1094.2 200
   000839         085700     IF STATUS-TEST-READ = 0                                      IX1094.2 136
   000840      1  085800         GO TO REA-PASS-F1-01-0.                                  IX1094.2 847
   000841         085900 REA-FAIL-F1-01-0.                                                IX1094.2
   000842         086000     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1094.2 209
   000843         086100     MOVE "I-O STATUS IS NOT 00" TO COMPUTED-A.                   IX1094.2 215
   000844         086200     MOVE "00" TO CORRECT-X.                                      IX1094.2 228
   000845         086300     PERFORM FAIL.                                                IX1094.2 533
   000846         086400     GO TO REA-WRITE-F1-01-0.                                     IX1094.2 849
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000847         086500 REA-PASS-F1-01-0.                                                IX1094.2
   000848         086600     PERFORM PASS.                                                IX1094.2 532
   000849         086700 REA-WRITE-F1-01-0.                                               IX1094.2
   000850         086800     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000851         086900*                                                                 IX1094.2
   000852         087000 REA-INIT-GF-02-0.                                                IX1094.2
   000853         087200*   TEST  7                                                      *IX1094.2
   000854         087300*         VERIFY FILE                                            *IX1094.2
   000855         087500     IF RECORDS-IN-ERROR EQUAL TO ZERO                            IX1094.2 127 IMP
   000856      1  087600         GO TO REA-TEST-F1-02-0.                                  IX1094.2 862
   000857         087700     MOVE "ERRORS IN READING IX-FS3" TO RE-MARK.                  IX1094.2 209
   000858         087800 REA-FAIL-F1-02-0.                                                IX1094.2
   000859         087900     MOVE "RECORDS IN ERROR =" TO COMPUTED-A.                     IX1094.2 215
   000860         088000     MOVE RECORDS-IN-ERROR TO CORRECT-18V0.                       IX1094.2 127 235
   000861         088100     GO TO REA-FAIL-F1-02-1.                                      IX1094.2 868
   000862         088200 REA-TEST-F1-02-0.                                                IX1094.2
   000863         088300     IF COUNT-OF-RECORDS EQUAL TO 50                              IX1094.2 144
   000864      1  088400         GO TO REA-PASS-F1-02-0.                                  IX1094.2 871
   000865         088500     MOVE "UNEXPECTED EOF" TO RE-MARK.                            IX1094.2 209
   000866         088600     MOVE "RECORDS READ =" TO COMPUTED-A.                         IX1094.2 215
   000867         088700     MOVE COUNT-OF-RECORDS TO CORRECT-18V0.                       IX1094.2 144 235
   000868         088800 REA-FAIL-F1-02-1.                                                IX1094.2
   000869         088900     PERFORM FAIL.                                                IX1094.2 533
   000870         089000     GO TO REA-WRITE-F1-02-0.                                     IX1094.2 875
   000871         089100 REA-PASS-F1-02-0.                                                IX1094.2
   000872         089200     PERFORM PASS.                                                IX1094.2 532
   000873         089300     MOVE "FILE VERIFIED RECS =" TO COMPUTED-A.                   IX1094.2 215
   000874         089400     MOVE COUNT-OF-RECORDS TO CORRECT-18V0.                       IX1094.2 144 235
   000875         089500 REA-WRITE-F1-02-0.                                               IX1094.2
   000876         089600     MOVE "REA-TEST-F1-02-0" TO PAR-NAME.                         IX1094.2 204
   000877         089700     MOVE "VERIFY FILE IX-FS3" TO FEATURE.                        IX1094.2 200
   000878         089800     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000879         090000*   TEST  8                                                      *IX1094.2
   000880         090100*         READ.   (WITHOUT   AT END)      10 EXPECTED            *IX1094.2
   000881         090200*         IX-4, 1.3.4 (2) A                                      *IX1094.2
   000882         090400 REA-INIT-F1-03-0.                                                IX1094.2
   000883         090500     IF IX-FS3-STATUS EQUAL TO "10"                               IX1094.2 138
   000884      1  090600         GO TO REA-PASS-F1-03-0.                                  IX1094.2 891
   000885         090700 REA-FAIL-F1-03-0.                                                IX1094.2
   000886         090800     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1094.2 138 215
   000887         090900     MOVE "10" TO CORRECT-X.                                      IX1094.2 228
   000888         091000     MOVE "IX-4, 1.3.4, (2) A." TO RE-MARK.                       IX1094.2 209
   000889         091100     PERFORM FAIL.                                                IX1094.2 533
   000890         091200     GO TO REA-WRITE-F1-03-0.                                     IX1094.2 893
   000891         091300 REA-PASS-F1-03-0.                                                IX1094.2
   000892         091400     PERFORM PASS.                                                IX1094.2 532
   000893         091500 REA-WRITE-F1-03-0.                                               IX1094.2
   000894         091600     MOVE "READ :       10 EXP." TO FEATURE.                      IX1094.2 200
   000895         091700     MOVE "REA-TEST-F1-03-0" TO PAR-NAME.                         IX1094.2 204
   000896         091800     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000897         092000*   TEST  9                                                      *IX1094.2
   000898         092100*         CLOSE INPUT                     00 EXPECTED            *IX1094.2
   000899         092200*         IX-3, 1.3.4 (1) A                                      *IX1094.2
   000900         092400 CLO-TEST-GF-02-0.                                                IX1094.2
   000901         092500     MOVE SPACES TO IX-FS3-STATUS.                                IX1094.2 IMP 138
   000902         092600     MOVE "CLOSE INPUT: 00 EXP."  TO FEATURE.                     IX1094.2 200
   000903         092700     MOVE "CLO-TEST-GF-02-0" TO PAR-NAME.                         IX1094.2 204
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000904         092800     CLOSE IX-FS3.                                                IX1094.2 95
   000905         092900     IF IX-FS3-STATUS = "00"                                      IX1094.2 138
   000906      1  093000         GO TO CLO-PASS-GF-02-0.                                  IX1094.2 913
   000907         093100 CLO-FAIL-GF-02-0.                                                IX1094.2
   000908         093200     MOVE "IX-3, 1.3.4, (1) A    " TO RE-MARK.                    IX1094.2 209
   000909         093300     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1094.2 138 215
   000910         093400     MOVE "00" TO CORRECT-X.                                      IX1094.2 228
   000911         093500     PERFORM FAIL.                                                IX1094.2 533
   000912         093600     GO TO CLO-WRITE-GF-02-0.                                     IX1094.2 915
   000913         093700 CLO-PASS-GF-02-0.                                                IX1094.2
   000914         093800     PERFORM PASS.                                                IX1094.2 532
   000915         093900 CLO-WRITE-GF-02-0.                                               IX1094.2
   000916         094000     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000917         094100                                                                  IX1094.2
   000918         094300*   TEST  10                                                     *IX1094.2
   000919         094400*         OPEN INPUT   (FOR READ ...  AT END) 00 EXPECTED        *IX1094.2
   000920         094500*         IX-3, 1.3.4 (1) A                                      *IX1094.2
   000921         094700 OPN-INIT-GF-03-0.                                                IX1094.2
   000922         094800     MOVE SPACES TO IX-FS3-STATUS.                                IX1094.2 IMP 138
   000923         094900     MOVE "OPEN  INPUT: 00 EXP." TO FEATURE.                      IX1094.2 200
   000924         095000     MOVE "OPN-TEST-GF-03-0" TO PAR-NAME.                         IX1094.2 204
   000925         095100 OPN-TEST-GF-03-0.                                                IX1094.2
   000926         095200     OPEN                                                         IX1094.2
   000927         095300        INPUT IX-FS3.                                             IX1094.2 95
   000928         095400     IF IX-FS3-STATUS EQUAL TO "00"                               IX1094.2 138
   000929      1  095500         GO TO OPN-PASS-GF-03-0.                                  IX1094.2 936
   000930         095600 OPN-FAIL-GF-03-0.                                                IX1094.2
   000931         095700     MOVE "IX-3, 1.3.4, (1) A." TO RE-MARK.                       IX1094.2 209
   000932         095800     PERFORM FAIL.                                                IX1094.2 533
   000933         095900     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1094.2 138 215
   000934         096000     MOVE "00" TO CORRECT-X.                                      IX1094.2 228
   000935         096100     GO TO OPN-WRITE-GF-03-0.                                     IX1094.2 938
   000936         096200 OPN-PASS-GF-03-0.                                                IX1094.2
   000937         096300     PERFORM PASS.                                                IX1094.2 532
   000938         096400 OPN-WRITE-GF-03-0.                                               IX1094.2
   000939         096500     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000940         096700*    STATUS IO CHECK ON INPUT FILE IX-FS3.                       *IX1094.2
   000941         096800*    THIS TEST READS AND VERIFIES THE RECORDS WRITTEN IN         *IX1094.2
   000942         096900*    TEST 2.       THE USE ON INPUT PROCESSES THE AT END         *IX1094.2
   000943         097000*    CONDITION.                                                   IX1094.2
   000944         097200 REA-INIT-F1-04-0.                                                IX1094.2
   000945         097300     MOVE 1 TO STATUS-TEST-10.                                    IX1094.2 135
   000946         097400     MOVE ZERO TO STATUS-TEST-READ.                               IX1094.2 IMP 136
   000947         097500     MOVE SPACES TO IX-FS3-STATUS.                                IX1094.2 IMP 138
   000948         097600     MOVE ZERO TO COUNT-OF-RECS.                                  IX1094.2 IMP 142
   000949         097700     MOVE ZERO TO PERM-ERRORS.                                    IX1094.2 IMP 131
   000950         097800     MOVE ZERO TO EOF-FLAG.                                       IX1094.2 IMP 125
   000951         097900 REA-TEST-F1-04-0.                                                IX1094.2
   000952         098000     READ IX-FS3  AT END MOVE 1 TO EOF-FLAG.                      IX1094.2 95 125
   000953         098100     IF EOF-FLAG EQUAL TO 1                                       IX1094.2 125
   000954      1  098200         GO TO REA-TEST-F1-04-1.                                  IX1094.2 973
   000955         098300     MOVE IX-FS3R1-F-G-240 TO FILE-RECORD-INFO (1).               IX1094.2 101 161
   000956         098400     ADD 1 TO COUNT-OF-RECS.                                      IX1094.2 142
   000957         098500     IF COUNT-OF-RECS LESS THAN 51                                IX1094.2 142
   000958      1  098600        IF IX-FS3-STATUS NOT = "00"                               IX1094.2 138
   000959      2  098700            MOVE 1 TO STATUS-TEST-READ.                           IX1094.2 136
   000960         098800     IF PERM-ERRORS EQUAL TO 1                                    IX1094.2 131
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000961      1  098900         ADD 1 TO RECORDS-IN-ERROR                                IX1094.2 127
   000962      1  099000         GO TO REA-TEST-F1-04-1.                                  IX1094.2 973
   000963         099100     IF COUNT-OF-RECS NOT EQUAL TO XRECORD-NUMBER (1)             IX1094.2 142 170
   000964      1  099200         ADD 1 TO RECORDS-IN-ERROR                                IX1094.2 127
   000965      1  099300         GO TO REA-TEST-F1-04-1.                                  IX1094.2 973
   000966         099400     IF XFILE-NAME (1) NOT EQUAL TO "IX-FS3"                      IX1094.2 164
   000967      1  099500         ADD 1 TO RECORDS-IN-ERROR                                IX1094.2 127
   000968      1  099600         GO TO REA-TEST-F1-04-1.                                  IX1094.2 973
   000969         099700     MOVE XRECORD-KEY (1) TO GRP-0101.                            IX1094.2 191 113
   000970         099800     IF GRP-0101-KEY NOT EQUAL TO COUNT-OF-RECS                   IX1094.2 115 142
   000971      1  099900         ADD 1 TO RECORDS-IN-ERROR.                               IX1094.2 127
   000972         100000     GO TO REA-TEST-F1-04-0.                                      IX1094.2 951
   000973         100100 REA-TEST-F1-04-1.                                                IX1094.2
   000974         100300*   TEST  11                                                     *IX1094.2
   000975         100400*         READ ...  AT END                00 EXPECTED            *IX1094.2
   000976         100500*         IX-3, 1.3.4 (1) A                                      *IX1094.2
   000977         100700     MOVE "REA-TEST-F1-04-0" TO PAR-NAME.                         IX1094.2 204
   000978         100800     MOVE "READ...END:  00 EXP."     TO FEATURE.                  IX1094.2 200
   000979         100900     IF STATUS-TEST-READ = 0                                      IX1094.2 136
   000980      1  101000         GO TO REA-PASS-F1-04-0.                                  IX1094.2 987
   000981         101100 REA-FAIL-F1-04-0.                                                IX1094.2
   000982         101200     MOVE "I-O STATUS IS NOT 00" TO COMPUTED-A.                   IX1094.2 215
   000983         101300     MOVE "00" TO CORRECT-X.                                      IX1094.2 228
   000984         101400     MOVE "IX-3, 1.3.4, (1) A. " TO RE-MARK.                      IX1094.2 209
   000985         101500     PERFORM FAIL.                                                IX1094.2 533
   000986         101600     GO TO REA-WRITE-F1-04-0.                                     IX1094.2 989
   000987         101700 REA-PASS-F1-04-0.                                                IX1094.2
   000988         101800     PERFORM PASS.                                                IX1094.2 532
   000989         101900 REA-WRITE-F1-04-0.                                               IX1094.2
   000990         102000     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   000991         102100*                                                                 IX1094.2
   000992         102200 REA-TEST-F1-05-0.                                                IX1094.2
   000993         102400*   TEST  12                                                     *IX1094.2
   000994         102500*         READ ... AT END    10 EXPECTED                         *IX1094.2
   000995         102600*         IX-4, 1.3.4 (2) A 1)                                   *IX1094.2
   000996         102800     IF IX-FS3-STATUS EQUAL TO "10"                               IX1094.2 138
   000997      1  102900         GO TO REA-PASS-F1-05-0.                                  IX1094.2 1004
   000998         103000 REA-FAIL-F1-05-0.                                                IX1094.2
   000999         103100     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1094.2 138 215
   001000         103200     MOVE "10" TO CORRECT-X.                                      IX1094.2 228
   001001         103300     MOVE "IX-4, 1.3.4, (2) A 1)" TO RE-MARK.                     IX1094.2 209
   001002         103400     PERFORM FAIL.                                                IX1094.2 533
   001003         103500     GO TO REA-WRITE-F1-05-0.                                     IX1094.2 1006
   001004         103600 REA-PASS-F1-05-0.                                                IX1094.2
   001005         103700     PERFORM PASS.                                                IX1094.2 532
   001006         103800 REA-WRITE-F1-05-0.                                               IX1094.2
   001007         103900     MOVE "READ...END:  10 EXP." TO FEATURE.                      IX1094.2 200
   001008         104000     MOVE "REA-TEST-F1-05-0" TO PAR-NAME.                         IX1094.2 204
   001009         104100     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   001010         104300*   TEST  13                                                     *IX1094.2
   001011         104400*         READ ... (AFTER AT END)      46 EXPECTED               *IX1094.2
   001012         104500*         IX-5, 1.3.4 (5) E 3)                                   *IX1094.2
   001013         104700 REA-TEST-F1-06-0.                                                IX1094.2
   001014         104800     MOVE 13 TO TEST-NO.                                          IX1094.2 337
   001015         104900     READ IX-FS3 AT END GO TO REA-TEST-F1-06-1.                   IX1094.2 95 1016
   001016         105000 REA-TEST-F1-06-1.                                                IX1094.2
   001017         105100     IF IX-FS3-STATUS EQUAL TO "46"                               IX1094.2 138
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001018      1  105200        MOVE "SHOULD HAVE EXECUTED DECLARATIVES IX-3,1.3.4(4)"    IX1094.2
   001019      1  105300          TO RE-MARK                                              IX1094.2 209
   001020      1  105400        GO TO REA-WRITE-F1-06-0.                                  IX1094.2 1023
   001021         105500 REA-FAIL-F1-06-0.                                                IX1094.2
   001022         105600     MOVE "IX-5, 1.3.4, (5) E 3)" TO RE-MARK.                     IX1094.2 209
   001023         105700 REA-WRITE-F1-06-0.                                               IX1094.2
   001024         105800     MOVE IX-FS3-STATUS TO COMPUTED-A.                            IX1094.2 138 215
   001025         105900     MOVE "46" TO CORRECT-X.                                      IX1094.2 228
   001026         106000     PERFORM FAIL.                                                IX1094.2 533
   001027         106100     MOVE "READ.        46 EXP." TO FEATURE.                      IX1094.2 200
   001028         106200     MOVE "REA-TEST-F1-06-0" TO PAR-NAME.                         IX1094.2 204
   001029         106300     PERFORM PRINT-DETAIL.                                        IX1094.2 536
   001030         106400     CLOSE IX-FS3.                                                IX1094.2 95
   001031         106500                                                                  IX1094.2
   001032         106600 TERMINATE-ROUTINE.                                               IX1094.2
   001033         106700     EXIT.                                                        IX1094.2
   001034         106800                                                                  IX1094.2
   001035         106900 CCVS-EXIT SECTION.                                               IX1094.2
   001036         107000 CCVS-999999.                                                     IX1094.2
   001037         107100     GO TO CLOSE-FILES.                                           IX1094.2 513
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    22
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      193   ALTERNATE-KEY1 . . . . . . . .  M690 M734
      195   ALTERNATE-KEY2
      260   ANSI-REFERENCE . . . . . . . .  465 472 481 615 622 631
       87   C-ABORT. . . . . . . . . . . .  M375 M494 M517
       81   C-ALL. . . . . . . . . . . . .  M377 M519
       77   C-DATE . . . . . . . . . . . .  M496
       83   C-DELETED. . . . . . . . . . .  M379 M521
       82   C-FAIL . . . . . . . . . . . .  M378 M520
       86   C-INDENT
       84   C-INSPECT. . . . . . . . . . .  M380 M522
       79   C-NO-OF-TESTS. . . . . . . . .  M495
       85   C-NOTE
       80   C-OK . . . . . . . . . . . . .  M376 M518
       78   C-TIME . . . . . . . . . . . .  M497
      239   CCVS-C-1 . . . . . . . . . . .  452 554 600
      244   CCVS-C-2 . . . . . . . . . . .  453 555 601
      294   CCVS-E-1 . . . . . . . . . . .  411 560
      299   CCVS-E-2 . . . . . . . . . . .  420 427 434 440 569 576 583 588
      302   CCVS-E-2-2 . . . . . . . . . .  M419 M568
      307   CCVS-E-3 . . . . . . . . . . .  441 589
      316   CCVS-E-4 . . . . . . . . . . .  419 568
      317   CCVS-E-4-1 . . . . . . . . . .  M417 M566
      319   CCVS-E-4-2 . . . . . . . . . .  M418 M567
      261   CCVS-H-1 . . . . . . . . . . .  448 549 596
      266   CCVS-H-2A. . . . . . . . . . .  449 550 597
      275   CCVS-H-2B. . . . . . . . . . .  450 551 598
      287   CCVS-H-3 . . . . . . . . . . .  451 552 599
      338   CCVS-PGM-ID. . . . . . . . . .  373 492 502 502 515 643
      180   CHARS-OR-RECORDS . . . . . . .  M645
      221   CM-18V0
      215   COMPUTED-A . . . . . . . . . .  216 218 219 220 221 M359 477 480 627 630 M670 M708 M715 M743 M765 M790 M843 M859
                                            M866 M873 M886 M909 M933 M982 M999 M1024
      216   COMPUTED-N
      214   COMPUTED-X . . . . . . . . . .  M403 462 M544 612
      218   COMPUTED-0V18
      220   COMPUTED-14V4
      222   COMPUTED-18V0
      219   COMPUTED-4V14
      238   COR-ANSI-REFERENCE . . . . . .  M472 M474 M622 M624
      229   CORRECT-A. . . . . . . . . . .  230 231 232 233 234 478 480 628 630
      230   CORRECT-N
      228   CORRECT-X. . . . . . . . . . .  M360 M404 464 M545 614 M671 M744 M766 M791 M844 M887 M910 M934 M983 M1000 M1025
      231   CORRECT-0V18
      233   CORRECT-14V4
      235   CORRECT-18V0 . . . . . . . . .  M709 M718 M860 M867 M874
      232   CORRECT-4V14
      144   COUNT-OF-RECORDS . . . . . . .  863 867 874
      142   COUNT-OF-RECS. . . . . . . . .  144 M651 M697 718 M804 M813 814 817 823 830 M948 M956 957 963 970
      234   CR-18V0
      252   DELETE-COUNTER . . . . . . . .  379 415 430 432 521 M534 563 579 581
      207   DOTVALUE . . . . . . . . . . .  M395 M539
      258   DUMMY-HOLD . . . . . . . . . .  M445 455 M593 603
       93   DUMMY-RECORD . . . . . . . . .  M408 M411 M420 M427 M434 M440 M441 445 M446 447 M448 M449 M450 M451 M452 M453
                                            M454 M455 459 M460 M467 M482 M549 M550 M551 M552 M554 M555 M556 M558 M560 M569
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    23
0 Defined   Cross-reference of data names   References

0                                           M576 M583 M588 M589 593 M594 595 M596 M597 M598 M599 M600 M601 M602 M603 607
                                            M608 M617 M632
      305   ENDER-DESC . . . . . . . . . .  M422 M433 M439 M571 M582 M587
      125   EOF-FLAG . . . . . . . . . . .  M350 M807 810 M950 M952 953
      253   ERROR-COUNTER. . . . . . . . .  378 M391 414 423 426 520 M533 562 572 575
      129   ERROR-FLAG
      257   ERROR-HOLD . . . . . . . . . .  377 M414 M415 M415 M416 418 519 M562 M563 M563 M564 567
      303   ERROR-TOTAL. . . . . . . . . .  M424 M426 M431 M432 M437 M438 M573 M575 M580 M581 M585 M586
      200   FEATURE. . . . . . . . . . . .  M367 M661 M685 M716 M728 M756 M780 M838 M877 M894 M902 M923 M978 M1007 M1027
      161   FILE-RECORD-INFO . . . . . . .  M510 692 735 M812 M955
      162   FILE-RECORD-INFO-P1-120
      189   FILE-RECORD-INFO-P121-240
      147   FILE-RECORD-INFO-SKELETON. . .  509
      146   FILE-RECORD-INFORMATION-REC
      113   GRP-0101 . . . . . . . . . . .  689 733 M829 M969
      115   GRP-0101-KEY . . . . . . . . .  M688 M732 830 970
      118   GRP-0102 . . . . . . . . . . .  690 734
      120   GRP-0102-KEY
      331   HYPHEN-LINE. . . . . . . . . .  408 454 556 558 602
      297   ID-AGAIN . . . . . . . . . . .  M502
      330   INF-ANSI-REFERENCE . . . . . .  M465 M468 M481 M483 M615 M618 M631 M633
      325   INFO-TEXT. . . . . . . . . . .  M466 M616
      254   INSPECT-COUNTER. . . . . . . .  380 414 436 438 522 M531 562 584 586
       95   IX-FS3 . . . . . . . . . . . .  62 344 371 664 759 784 809 904 927 952 1015 1030
      107   IX-FS3-ALTER-KEY
      105   IX-FS3-KEY . . . . . . . . . .  66
      102   IX-FS3-REC-120
      103   IX-FS3-REC-120-240
      138   IX-FS3-STATUS. . . . . . . . .  67 356 359 M660 665 670 M683 694 M726 738 743 M755 760 765 M779 785 790 M803
                                            818 883 886 M901 905 909 M922 928 933 M947 958 996 999 1017 1024
      139   IX-FS3-STAT1 . . . . . . . . .  349 352
      140   IX-FS3-STAT2
      101   IX-FS3R1-F-G-240 . . . . . . .  M692 693 M735 736 812 955
      174   ODO-NUMBER
      202   P-OR-F . . . . . . . . . . . .  M390 M391 398 M403 M531 M532 M533 M534 541 M544
      204   PAR-NAME . . . . . . . . . . .  M368 M405 M546 M662 M686 M717 M729 M757 M781 M837 M876 M895 M903 M924 M977 M1008
                                            M1028
      206   PARDOT-X . . . . . . . . . . .  M394 M538
      255   PASS-COUNTER . . . . . . . . .  376 M390 416 417 518 M532 564 566
      131   PERM-ERRORS. . . . . . . . . .  M353 M806 820 M949 960
       89   PRINT-FILE . . . . . . . . . .  59 385 501 526
       91   PRINT-REC. . . . . . . . . . .  M396 M471 M473 M540 M621 M623
       73   RAW-DATA . . . . . . . . . . .  53 372 374 383 491 493 500 514 516 525
       76   RAW-DATA-KEY . . . . . . . . .  57 M373 M492 M515
       75   RAW-DATA-SATZ. . . . . . . . .  381 498 523
      209   RE-MARK. . . . . . . . . . . .  M361 M406 M535 M547 M668 M706 M741 M763 M788 M815 M842 M857 M865 M888 M908 M931
                                            M984 M1001 M1019 M1022
      251   REC-CT . . . . . . . . . . . .  393 395 405 537 539 546
      250   REC-SKL-SUB. . . . . . . . . .  M505 M508 510
      259   RECORD-COUNT . . . . . . . . .  M443 444 M456 M591 592 M604
      127   RECORDS-IN-ERROR . . . . . . .  M695 703 709 M805 M821 M824 M827 M831 855 860 M961 M964 M967 M971
      184   RECORDS-IN-FILE. . . . . . . .  M647
      168   REELUNIT-NUMBER
      136   STATUS-TEST-READ . . . . . . .  M819 839 M946 M959 979
      133   STATUS-TEST-00 . . . . . . . .  M659 M684 M727
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    24
0 Defined   Cross-reference of data names   References

0     135   STATUS-TEST-10 . . . . . . . .  348 M802 M945
      210   TEST-COMPUTED. . . . . . . . .  471 621
      225   TEST-CORRECT . . . . . . . . .  473 623
      278   TEST-ID. . . . . . . . . . . .  M502
      337   TEST-NO. . . . . . . . . . . .  346 M640 M1014
      198   TEST-RESULTS . . . . . . . . .  396 M503 540
      256   TOTAL-ERROR
      172   UPDATE-NUMBER
      123   WRK-CS-09V00
      182   XBLOCK-SIZE. . . . . . . . . .  M646
      164   XFILE-NAME . . . . . . . . . .  M641 826 966
      186   XFILE-ORGANIZATION . . . . . .  M648
      188   XLABEL-TYPE. . . . . . . . . .  M649
      176   XPROGRAM-NAME. . . . . . . . .  M643
      191   XRECORD-KEY. . . . . . . . . .  M689 M733 829 969
      178   XRECORD-LENGTH . . . . . . . .  M644
      166   XRECORD-NAME . . . . . . . . .  M642
      170   XRECORD-NUMBER . . . . . . . .  M650 688 698 M700 M730 732 823 963
      327   XXCOMPUTED . . . . . . . . . .  M480 M630
      329   XXCORRECT. . . . . . . . . . .  M480 M630
      322   XXINFO . . . . . . . . . . . .  467 482 617 632
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    25
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

      626   BAIL-OUT . . . . . . . . . . .  P543
      634   BAIL-OUT-EX. . . . . . . . . .  E543 G628
      629   BAIL-OUT-WRITE . . . . . . . .  G627
      609   BLANK-LINE-PRINT
     1035   CCVS-EXIT
      511   CCVS-INIT-EXIT
      507   CCVS-INIT-FILE . . . . . . . .  P506
     1036   CCVS-999999
      489   CCVS1
      635   CCVS1-EXIT . . . . . . . . . .  G512
      762   CLO-FAIL-GF-01-0
      907   CLO-FAIL-GF-02-0
      754   CLO-INIT-GF-01-0
      768   CLO-PASS-GF-01-0 . . . . . . .  G761
      913   CLO-PASS-GF-02-0 . . . . . . .  G906
      758   CLO-TEST-GF-01-0
      900   CLO-TEST-GF-02-0
      770   CLO-WRITE-GF-01-0. . . . . . .  G767
      915   CLO-WRITE-GF-02-0. . . . . . .  G912
      513   CLOSE-FILES. . . . . . . . . .  G1037
      553   COLUMN-NAMES-ROUTINE . . . . .  E504
      476   D-BAIL-OUT . . . . . . . . . .  P402
      484   D-BAIL-OUT-EX. . . . . . . . .  E402 G478
      479   D-BAIL-OUT-WRITE . . . . . . .  G477
      370   D-CLOSE-FILES
      382   D-END-E-2. . . . . . . . . . .  G374 G381
      407   D-END-ROUTINE. . . . . . . . .  P384
      413   D-END-ROUTINE-1
      421   D-END-ROUTINE-12
      429   D-END-ROUTINE-13 . . . . . . .  E384
      410   D-END-RTN-EXIT
      391   D-FAIL . . . . . . . . . . . .  P362
      461   D-FAIL-ROUTINE . . . . . . . .  P400
      475   D-FAIL-ROUTINE-EX. . . . . . .  E400 G469
      470   D-FAIL-ROUTINE-WRITE . . . . .  G463 G464
      390   D-PASS . . . . . . . . . . . .  P365
      392   D-PRINT-DETAIL . . . . . . . .  P369
      358   D-R-FAIL-F1-06-0
      364   D-R-PASS-F1-06-0 . . . . . . .  G357
      355   D-R-TEST-F1-06-1 . . . . . . .  G347
      366   D-R-WRITE-F1-06-0. . . . . . .  G363
      388   D-TERMINATE-CALL
      386   D-TERMINATE-CCVS
      442   D-WRITE-LINE . . . . . . . . .  P397 P399 P409 P412 P420 P428 P435 P440 P441 P467 P471 P473 P482
      458   D-WRT-LN . . . . . . . . . . .  P448 P449 P450 P451 P452 P453 P454 P457
      534   DE-LETE
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    26
0 Defined   Cross-reference of procedures   References

0     485   DECL-EXIT. . . . . . . . . . .  G354
      499   END-E-1. . . . . . . . . . . .  G493 G498
      524   END-E-2. . . . . . . . . . . .  G516 G523
      557   END-ROUTINE. . . . . . . . . .  P526
      561   END-ROUTINE-1
      570   END-ROUTINE-12
      578   END-ROUTINE-13 . . . . . . . .  E526
      559   END-RTN-EXIT
      533   FAIL . . . . . . . . . . . . .  P669 P707 P742 P764 P789 P845 P869 P889 P911 P932 P985 P1002 P1026
      611   FAIL-ROUTINE . . . . . . . . .  P542
      625   FAIL-ROUTINE-EX. . . . . . . .  E542 G619
      620   FAIL-ROUTINE-WRITE . . . . . .  G613 G614
      548   HEAD-ROUTINE . . . . . . . . .  P504
      345   INPUT-PROCESS
      531   INSPT
      490   OPEN-FILES
      667   OPN-FAIL-GF-01-0
      787   OPN-FAIL-GF-02-0
      930   OPN-FAIL-GF-03-0
      658   OPN-INIT-GF-01-0
      778   OPN-INIT-GF-02-0
      921   OPN-INIT-GF-03-0
      673   OPN-PASS-GF-01-0 . . . . . . .  G666
      793   OPN-PASS-GF-02-0 . . . . . . .  G786
      936   OPN-PASS-GF-03-0 . . . . . . .  G929
      782   OPN-TEST-GF-02-0
      925   OPN-TEST-GF-03-0
      675   OPN-WRITE-GF-01-0. . . . . . .  G672
      795   OPN-WRITE-GF-02-0. . . . . . .  G792
      938   OPN-WRITE-GF-03-0. . . . . . .  G935
      532   PASS . . . . . . . . . . . . .  P674 P712 P747 P769 P794 P848 P872 P892 P914 P937 P988 P1005
      536   PRINT-DETAIL . . . . . . . . .  P676 P714 P719 P749 P771 P796 P850 P878 P896 P916 P939 P990 P1009 P1029
      841   REA-FAIL-F1-01-0 . . . . . . .  G816
      858   REA-FAIL-F1-02-0
      868   REA-FAIL-F1-02-1 . . . . . . .  G861
      885   REA-FAIL-F1-03-0
      981   REA-FAIL-F1-04-0
      998   REA-FAIL-F1-05-0
     1021   REA-FAIL-F1-06-0
      801   REA-INIT-F1-01-0
      882   REA-INIT-F1-03-0
      944   REA-INIT-F1-04-0
      852   REA-INIT-GF-02-0
      847   REA-PASS-F1-01-0 . . . . . . .  G840
      871   REA-PASS-F1-02-0 . . . . . . .  G864
      891   REA-PASS-F1-03-0 . . . . . . .  G884
      987   REA-PASS-F1-04-0 . . . . . . .  G980
     1004   REA-PASS-F1-05-0 . . . . . . .  G997
      808   REA-TEST-F1-01-0 . . . . . . .  G832
      833   REA-TEST-F1-01-1 . . . . . . .  G811 G822 G825 G828
      862   REA-TEST-F1-02-0 . . . . . . .  G856
      951   REA-TEST-F1-04-0 . . . . . . .  G972
      973   REA-TEST-F1-04-1 . . . . . . .  G954 G962 G965 G968
      992   REA-TEST-F1-05-0
     1013   REA-TEST-F1-06-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    27
0 Defined   Cross-reference of procedures   References

0    1016   REA-TEST-F1-06-1 . . . . . . .  G1015
      849   REA-WRITE-F1-01-0. . . . . . .  G846
      875   REA-WRITE-F1-02-0. . . . . . .  G870
      893   REA-WRITE-F1-03-0. . . . . . .  G890
      989   REA-WRITE-F1-04-0. . . . . . .  G986
     1006   REA-WRITE-F1-05-0. . . . . . .  G1003
     1023   REA-WRITE-F1-06-0. . . . . . .  G1020
      343   SECT-IX109-0002
      638   SECT-IX109A-0003
      639   SEQ-INIT-010
      529   TERMINATE-CALL
      527   TERMINATE-CCVS
     1032   TERMINATE-ROUTINE
      705   WRI-FAIL-GF-01-0
      740   WRI-FAIL-GF-02-0
      682   WRI-INIT-GF-01-0
      725   WRI-INIT-GF-02-0
      711   WRI-PASS-GF-01-0 . . . . . . .  G704
      746   WRI-PASS-GF-02-0 . . . . . . .  G739
      687   WRI-TEST-GF-01-0 . . . . . . .  G701
      702   WRI-TEST-GF-01-1 . . . . . . .  G699
      731   WRI-TEST-GF-02-0
      737   WRI-TEST-GF-02-1 . . . . . . .  G736
      713   WRI-WRITE-GF-01-0. . . . . . .  G710
      748   WRI-WRITE-GF-02-0. . . . . . .  G745
      590   WRITE-LINE . . . . . . . . . .  P540 P541 P549 P550 P551 P552 P554 P555 P556 P558 P560 P569 P577 P583 P588 P589
                                            P617 P621 P623 P632
      606   WRT-LN . . . . . . . . . . . .  P596 P597 P598 P599 P600 P601 P602 P605 P610
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    28
0 Defined   Cross-reference of programs     References

        3   IX109A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX109A    Date 06/04/2022  Time 11:59:51   Page    29
0LineID  Message code  Message text

     89  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     95  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     95  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX109A:
 *    Source records = 1037
 *    Data Division statements = 120
 *    Procedure Division statements = 571
 *    Generated COBOL statements = 0
 *    Program complexity factor = 580
0End of compilation 1,  program IX109A,  highest severity 0.
0Return code 0
