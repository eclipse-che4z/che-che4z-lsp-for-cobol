1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:44   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:44   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1214.2
   000002         000200 PROGRAM-ID.                                                      IX1214.2
   000003         000300     IX121A.                                                      IX1214.2
   000004         000500*                                                              *  IX1214.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1214.2
   000006         000700*                                                              *  IX1214.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1214.2
   000008         000900*                                                              *  IX1214.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1214.2
   000010         001100*                                                              *  IX1214.2
   000011         001300*                                                                 IX1214.2
   000012         001400*    1.  THE  ROUTINE  CREATES  THE  MASS  STORAGE  FILE  IX-VS2  IX1214.2
   000013         001500*        CONTAINING  50  RECORDS. EACH BLOCK CONTAINS 2 RECORDS,  IX1214.2
   000014         001600*        EACH  RECORD  CONTAINS  240 CHARACTERS, ORGANIZATION IS  IX1214.2
   000015         001700*        INDEXED,  ACCESS  IS SEQUENTIAL. THEN THE FILE IS OPENED IX1214.2
   000016         001800*        AS I-O AND IT IS ATTEMTED TO REWRITE A RECORD WITH A     IX1214.2
   000017         001900*        WRONG RECORD LENGTH.  THE RECORD REWRITTEN IS LONGER     IX1214.2
   000018         002000*        THAN THE RECORD READ.                                    IX1214.2
   000019         002100*                                                                 IX1214.2
   000020         002200*    NOTE: THIS PROGRAM IS A SUPPLEMENT TO PROGRAM IX112A, WHICH  IX1214.2
   000021         002300*        REWRITES A RECORD SHORTER THAN THE RECORD READ.          IX1214.2
   000022         002400*                                                                 IX1214.2
   000023         002500*    2. THE ROUTINE READS THE CREATED FILE, VERIFIES IT AND       IX1214.2
   000024         002600*       CHECKS THE FILE STATUS CODE:                              IX1214.2
   000025         002700*           44  -  AFTER REWRITE   (WITH WRONG RECORD LENGTH)     IX1214.2
   000026         002800*                                                                 IX1214.2
   000027         002900*    3. X-CARDS USED IN THIS PROGRAM:                             IX1214.2
   000028         003000*                                                                 IX1214.2
   000029         003100*                 XXXXX024                                        IX1214.2
   000030         003200*                 XXXXX055.                                       IX1214.2
   000031         003300*                 XXXXX062.                                       IX1214.2
   000032         003400*                 XXXXX082.                                       IX1214.2
   000033         003500*                 XXXXX083.                                       IX1214.2
   000034         003600*                 XXXXX084                                        IX1214.2
   000035         003700*                                                                 IX1214.2
   000036         003800*                                                                 IX1214.2
   000037         003900 ENVIRONMENT DIVISION.                                            IX1214.2
   000038         004000 CONFIGURATION SECTION.                                           IX1214.2
   000039         004100 SOURCE-COMPUTER.                                                 IX1214.2
   000040         004200     XXXXX082.                                                    IX1214.2
   000041         004300 OBJECT-COMPUTER.                                                 IX1214.2
   000042         004400     XXXXX083.                                                    IX1214.2
   000043         004500 INPUT-OUTPUT SECTION.                                            IX1214.2
   000044         004600 FILE-CONTROL.                                                    IX1214.2
   000045         004700     SELECT RAW-DATA   ASSIGN TO                                  IX1214.2 65
   000046         004800     XXXXX062                                                     IX1214.2
   000047         004900            ORGANIZATION IS INDEXED                               IX1214.2
   000048         005000            ACCESS MODE IS RANDOM                                 IX1214.2
   000049         005100            RECORD KEY IS RAW-DATA-KEY.                           IX1214.2 68
   000050         005200*                                                                 IX1214.2
   000051         005300     SELECT PRINT-FILE ASSIGN TO                                  IX1214.2 81
   000052         005400     XXXXX055.                                                    IX1214.2
   000053         005500*                                                                 IX1214.2
   000054         005600     SELECT IX-VS2 ASSIGN                                         IX1214.2 87
   000055         005700     XXXXX024                                                     IX1214.2
   000056         005800     ORGANIZATION IS INDEXED                                      IX1214.2
   000057         005900     ACCESS MODE IS SEQUENTIAL                                    IX1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000     RECORD KEY IS IX-VS2-KEY                                     IX1214.2 98
   000059         006100     FILE STATUS IS IX-VS2-STATUS.                                IX1214.2 139
   000060         006200                                                                  IX1214.2
   000061         006300 DATA DIVISION.                                                   IX1214.2
   000062         006400                                                                  IX1214.2
   000063         006500 FILE SECTION.                                                    IX1214.2
   000064         006600                                                                  IX1214.2
   000065         006700 FD  RAW-DATA.                                                    IX1214.2
   000066         006800                                                                  IX1214.2
   000067         006900 01  RAW-DATA-SATZ.                                               IX1214.2
   000068         007000     05  RAW-DATA-KEY        PIC X(6).                            IX1214.2
   000069         007100     05  C-DATE              PIC 9(6).                            IX1214.2
   000070         007200     05  C-TIME              PIC 9(8).                            IX1214.2
   000071         007300     05  C-NO-OF-TESTS       PIC 99.                              IX1214.2
   000072         007400     05  C-OK                PIC 999.                             IX1214.2
   000073         007500     05  C-ALL               PIC 999.                             IX1214.2
   000074         007600     05  C-FAIL              PIC 999.                             IX1214.2
   000075         007700     05  C-DELETED           PIC 999.                             IX1214.2
   000076         007800     05  C-INSPECT           PIC 999.                             IX1214.2
   000077         007900     05  C-NOTE              PIC X(13).                           IX1214.2
   000078         008000     05  C-INDENT            PIC X.                               IX1214.2
   000079         008100     05  C-ABORT             PIC X(8).                            IX1214.2
   000080         008200                                                                  IX1214.2
   000081         008300 FD  PRINT-FILE.                                                  IX1214.2

 ==000081==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000082         008400                                                                  IX1214.2
   000083         008500 01  PRINT-REC               PIC X(120).                          IX1214.2
   000084         008600                                                                  IX1214.2
   000085         008700 01  DUMMY-RECORD            PIC X(120).                          IX1214.2
   000086         008800                                                                  IX1214.2
   000087         008900 FD  IX-VS2                                                       IX1214.2

 ==000087==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000087==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000088         009000        DATA RECORDS IX-VS2R1-F-G-240 IX-VS2R1-F-G-200            IX1214.2 * *
   000089         009100                                      IX-VS2R1-F-G-280            IX1214.2 *
   000090         009200        LABEL RECORD STANDARD                                     IX1214.2
   000091         009300        RECORD 200 TO 280                                         IX1214.2
   000092         009400        BLOCK CONTAINS 2 RECORDS.                                 IX1214.2
   000093         009500                                                                  IX1214.2
   000094         009600 01  IX-VS2R1-F-G-240.                                            IX1214.2
   000095         009700     05  IX-VS2-REC-120      PIC X(120).                          IX1214.2
   000096         009800     05  IX-VS2-REC-120-240.                                      IX1214.2
   000097         009900         10  FILLER          PIC X(8).                            IX1214.2
   000098         010000         10  IX-VS2-KEY      PIC X(29).                           IX1214.2
   000099         010100         10  FILLER          PIC X(9).                            IX1214.2
   000100         010200         10  IX-VS2-ALTER-KEY  PIC X(29).                         IX1214.2
   000101         010300         10  FILLER            PIC X(45).                         IX1214.2
   000102         010400                                                                  IX1214.2
   000103         010500 01  IX-VS2R1-F-G-200.                                            IX1214.2
   000104         010600     05  IX-VS2-REC-SHORT    PIC X(120).                          IX1214.2
   000105         010700     05  IX-VS2-REC-120-200  PIC X(80).                           IX1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000106         010800                                                                  IX1214.2
   000107         010900 01  IX-VS2R1-F-G-280.                                            IX1214.2
   000108         011000     05  IX-VS2-REC-LONG     PIC X(120).                          IX1214.2
   000109         011100     05  IX-VS2-REC-120-239  PIC X(120).                          IX1214.2
   000110         011200     05  IX-VS2-REC-240-280  PIC X(40).                           IX1214.2
   000111         011300                                                                  IX1214.2
   000112         011400 WORKING-STORAGE SECTION.                                         IX1214.2
   000113         011500                                                                  IX1214.2
   000114         011600 01  GRP-0101.                                                    IX1214.2
   000115         011700     05  FILLER              PIC X(10) VALUE "RECORD-KEY".        IX1214.2
   000116         011800     05  GRP-0101-KEY        PIC 9(9)  VALUE ZERO.                IX1214.2 IMP
   000117         011900     05  FILLER              PIC X(10) VALUE "END-OF-KEY".        IX1214.2
   000118         012000                                                                  IX1214.2
   000119         012100 01  GRP-0102.                                                    IX1214.2
   000120         012200     05  FILLER              PIC X(10) VALUE "ALTERN-KEY".        IX1214.2
   000121         012300     05  GRP-0102-KEY        PIC 9(9)  VALUE ZERO.                IX1214.2 IMP
   000122         012400     05  FILLER              PIC X(10) VALUE "END-AL-KEY".        IX1214.2
   000123         012500                                                                  IX1214.2
   000124         012600 01  WRK-CS-09V00            PIC S9(9) COMP VALUE ZERO.           IX1214.2 IMP
   000125         012700                                                                  IX1214.2
   000126         012800 01  EOF-FLAG                PIC 9 VALUE ZERO.                    IX1214.2 IMP
   000127         012900                                                                  IX1214.2
   000128         013000 01  RECORDS-IN-ERROR        PIC S9(5) COMP VALUE ZERO.           IX1214.2 IMP
   000129         013100                                                                  IX1214.2
   000130         013200 01  ERROR-FLAG              PIC 9 VALUE ZERO.                    IX1214.2 IMP
   000131         013300                                                                  IX1214.2
   000132         013400 01  PERM-ERRORS             PIC S9(5) COMP VALUE ZERO.           IX1214.2 IMP
   000133         013500                                                                  IX1214.2
   000134         013600 01  STATUS-TEST-00          PIC 9 VALUE ZERO.                    IX1214.2 IMP
   000135         013700                                                                  IX1214.2
   000136         013800 01  STATUS-TEST-10          PIC 9 VALUE ZERO.                    IX1214.2 IMP
   000137         013900 01  STATUS-TEST-READ        PIC 9 VALUE ZERO.                    IX1214.2 IMP
   000138         014000                                                                  IX1214.2
   000139         014100 01  IX-VS2-STATUS.                                               IX1214.2
   000140         014200     05  IX-VS2-STAT1        PIC X.                               IX1214.2
   000141         014300     05  IX-VS2-STAT2        PIC X.                               IX1214.2
   000142         014400                                                                  IX1214.2
   000143         014500 01  COUNT-OF-RECS           PIC 9(5).                            IX1214.2
   000144         014600                                                                  IX1214.2
   000145         014700 01  COUNT-OF-RECORDS REDEFINES COUNT-OF-RECS  PIC 9(5).          IX1214.2 143
   000146         014800                                                                  IX1214.2
   000147         014900 01  FILE-RECORD-INFORMATION-REC.                                 IX1214.2
   000148         015000     05  FILE-RECORD-INFO-SKELETON.                               IX1214.2
   000149         015100         10  FILLER          PIC X(48) VALUE                      IX1214.2
   000150         015200              "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00". IX1214.2
   000151         015300         10  FILLER          PIC X(46) VALUE                      IX1214.2
   000152         015400                ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000". IX1214.2
   000153         015500         10  FILLER          PIC X(26) VALUE                      IX1214.2
   000154         015600                                    ",LFIL=000000,ORG=  ,LBLR= ". IX1214.2
   000155         015700         10  FILLER          PIC X(37) VALUE                      IX1214.2
   000156         015800                         ",RECKEY=                             ". IX1214.2
   000157         015900         10  FILLER          PIC X(38) VALUE                      IX1214.2
   000158         016000                        ",ALTKEY1=                             ". IX1214.2
   000159         016100         10  FILLER          PIC X(38) VALUE                      IX1214.2
   000160         016200                        ",ALTKEY2=                             ". IX1214.2
   000161         016300         10  FILLER          PIC X(7) VALUE SPACE.                IX1214.2 IMP
   000162         016400     05  FILE-RECORD-INFO             OCCURS 10.                  IX1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000163         016500         10  FILE-RECORD-INFO-P1-120.                             IX1214.2
   000164         016600             15  FILLER      PIC X(5).                            IX1214.2
   000165         016700             15  XFILE-NAME  PIC X(6).                            IX1214.2
   000166         016800             15  FILLER      PIC X(8).                            IX1214.2
   000167         016900             15  XRECORD-NAME  PIC X(6).                          IX1214.2
   000168         017000             15  FILLER        PIC X(1).                          IX1214.2
   000169         017100             15  REELUNIT-NUMBER  PIC 9(1).                       IX1214.2
   000170         017200             15  FILLER           PIC X(7).                       IX1214.2
   000171         017300             15  XRECORD-NUMBER   PIC 9(6).                       IX1214.2
   000172         017400             15  FILLER           PIC X(6).                       IX1214.2
   000173         017500             15  UPDATE-NUMBER    PIC 9(2).                       IX1214.2
   000174         017600             15  FILLER           PIC X(5).                       IX1214.2
   000175         017700             15  ODO-NUMBER       PIC 9(4).                       IX1214.2
   000176         017800             15  FILLER           PIC X(5).                       IX1214.2
   000177         017900             15  XPROGRAM-NAME    PIC X(5).                       IX1214.2
   000178         018000             15  FILLER           PIC X(7).                       IX1214.2
   000179         018100             15  XRECORD-LENGTH   PIC 9(6).                       IX1214.2
   000180         018200             15  FILLER           PIC X(7).                       IX1214.2
   000181         018300             15  CHARS-OR-RECORDS  PIC X(2).                      IX1214.2
   000182         018400             15  FILLER            PIC X(1).                      IX1214.2
   000183         018500             15  XBLOCK-SIZE       PIC 9(4).                      IX1214.2
   000184         018600             15  FILLER            PIC X(6).                      IX1214.2
   000185         018700             15  RECORDS-IN-FILE   PIC 9(6).                      IX1214.2
   000186         018800             15  FILLER            PIC X(5).                      IX1214.2
   000187         018900             15  XFILE-ORGANIZATION  PIC X(2).                    IX1214.2
   000188         019000             15  FILLER              PIC X(6).                    IX1214.2
   000189         019100             15  XLABEL-TYPE         PIC X(1).                    IX1214.2
   000190         019200         10  FILE-RECORD-INFO-P121-240.                           IX1214.2
   000191         019300             15  FILLER              PIC X(8).                    IX1214.2
   000192         019400             15  XRECORD-KEY         PIC X(29).                   IX1214.2
   000193         019500             15  FILLER              PIC X(9).                    IX1214.2
   000194         019600             15  ALTERNATE-KEY1      PIC X(29).                   IX1214.2
   000195         019700             15  FILLER              PIC X(9).                    IX1214.2
   000196         019800             15  ALTERNATE-KEY2      PIC X(29).                   IX1214.2
   000197         019900             15  FILLER              PIC X(7).                    IX1214.2
   000198         020000                                                                  IX1214.2
   000199         020100 01  TEST-RESULTS.                                                IX1214.2
   000200         020200     02 FILLER                   PIC X      VALUE SPACE.          IX1214.2 IMP
   000201         020300     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1214.2 IMP
   000202         020400     02 FILLER                   PIC X      VALUE SPACE.          IX1214.2 IMP
   000203         020500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1214.2 IMP
   000204         020600     02 FILLER                   PIC X      VALUE SPACE.          IX1214.2 IMP
   000205         020700     02  PAR-NAME.                                                IX1214.2
   000206         020800       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1214.2 IMP
   000207         020900       03  PARDOT-X              PIC X      VALUE SPACE.          IX1214.2 IMP
   000208         021000       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1214.2 IMP
   000209         021100     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1214.2 IMP
   000210         021200     02 RE-MARK                  PIC X(61).                       IX1214.2
   000211         021300 01  TEST-COMPUTED.                                               IX1214.2
   000212         021400     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1214.2 IMP
   000213         021500     02 FILLER                   PIC X(17)  VALUE                 IX1214.2
   000214         021600            "       COMPUTED=".                                   IX1214.2
   000215         021700     02 COMPUTED-X.                                               IX1214.2
   000216         021800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1214.2 IMP
   000217         021900     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1214.2 216
   000218         022000                                 PIC -9(9).9(9).                  IX1214.2
   000219         022100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1214.2 216
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000220         022200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1214.2 216
   000221         022300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1214.2 216
   000222         022400     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1214.2 216
   000223         022500         04 COMPUTED-18V0                    PIC -9(18).          IX1214.2
   000224         022600         04 FILLER                           PIC X.               IX1214.2
   000225         022700     03 FILLER PIC X(50) VALUE SPACE.                             IX1214.2 IMP
   000226         022800 01  TEST-CORRECT.                                                IX1214.2
   000227         022900     02 FILLER PIC X(30) VALUE SPACE.                             IX1214.2 IMP
   000228         023000     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1214.2
   000229         023100     02 CORRECT-X.                                                IX1214.2
   000230         023200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1214.2 IMP
   000231         023300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1214.2 230
   000232         023400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1214.2 230
   000233         023500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1214.2 230
   000234         023600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1214.2 230
   000235         023700     03      CR-18V0 REDEFINES CORRECT-A.                         IX1214.2 230
   000236         023800         04 CORRECT-18V0                     PIC -9(18).          IX1214.2
   000237         023900         04 FILLER                           PIC X.               IX1214.2
   000238         024000     03 FILLER PIC X(2) VALUE SPACE.                              IX1214.2 IMP
   000239         024100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1214.2 IMP
   000240         024200 01  CCVS-C-1.                                                    IX1214.2
   000241         024300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1214.2
   000242         024400-    "SS  PARAGRAPH-NAME                                          IX1214.2
   000243         024500-    "       REMARKS".                                            IX1214.2
   000244         024600     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1214.2 IMP
   000245         024700 01  CCVS-C-2.                                                    IX1214.2
   000246         024800     02 FILLER                     PIC X        VALUE SPACE.      IX1214.2 IMP
   000247         024900     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1214.2
   000248         025000     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1214.2 IMP
   000249         025100     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1214.2
   000250         025200     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1214.2 IMP
   000251         025300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1214.2 IMP
   000252         025400 01  REC-CT                        PIC 99       VALUE ZERO.       IX1214.2 IMP
   000253         025500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1214.2 IMP
   000254         025600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1214.2 IMP
   000255         025700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1214.2 IMP
   000256         025800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1214.2 IMP
   000257         025900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1214.2 IMP
   000258         026000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1214.2 IMP
   000259         026100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1214.2 IMP
   000260         026200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1214.2 IMP
   000261         026300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1214.2 IMP
   000262         026400 01  CCVS-H-1.                                                    IX1214.2
   000263         026500     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1214.2 IMP
   000264         026600     02  FILLER                    PIC X(42)    VALUE             IX1214.2
   000265         026700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1214.2
   000266         026800     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1214.2 IMP
   000267         026900 01  CCVS-H-2A.                                                   IX1214.2
   000268         027000   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1214.2 IMP
   000269         027100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1214.2
   000270         027200   02  FILLER                        PIC XXXX   VALUE             IX1214.2
   000271         027300     "4.2 ".                                                      IX1214.2
   000272         027400   02  FILLER                        PIC X(28)  VALUE             IX1214.2
   000273         027500            " COPY - NOT FOR DISTRIBUTION".                       IX1214.2
   000274         027600   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1214.2 IMP
   000275         027700                                                                  IX1214.2
   000276         027800 01  CCVS-H-2B.                                                   IX1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000277         027900   02  FILLER                        PIC X(15)  VALUE             IX1214.2
   000278         028000            "TEST RESULT OF ".                                    IX1214.2
   000279         028100   02  TEST-ID                       PIC X(9).                    IX1214.2
   000280         028200   02  FILLER                        PIC X(4)   VALUE             IX1214.2
   000281         028300            " IN ".                                               IX1214.2
   000282         028400   02  FILLER                        PIC X(12)  VALUE             IX1214.2
   000283         028500     " HIGH       ".                                              IX1214.2
   000284         028600   02  FILLER                        PIC X(22)  VALUE             IX1214.2
   000285         028700            " LEVEL VALIDATION FOR ".                             IX1214.2
   000286         028800   02  FILLER                        PIC X(58)  VALUE             IX1214.2
   000287         028900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1214.2
   000288         029000 01  CCVS-H-3.                                                    IX1214.2
   000289         029100     02  FILLER                      PIC X(34)  VALUE             IX1214.2
   000290         029200            " FOR OFFICIAL USE ONLY    ".                         IX1214.2
   000291         029300     02  FILLER                      PIC X(58)  VALUE             IX1214.2
   000292         029400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1214.2
   000293         029500     02  FILLER                      PIC X(28)  VALUE             IX1214.2
   000294         029600            "  COPYRIGHT   1985 ".                                IX1214.2
   000295         029700 01  CCVS-E-1.                                                    IX1214.2
   000296         029800     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1214.2 IMP
   000297         029900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1214.2
   000298         030000     02 ID-AGAIN                     PIC X(9).                    IX1214.2
   000299         030100     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1214.2 IMP
   000300         030200 01  CCVS-E-2.                                                    IX1214.2
   000301         030300     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1214.2 IMP
   000302         030400     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1214.2 IMP
   000303         030500     02 CCVS-E-2-2.                                               IX1214.2
   000304         030600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1214.2 IMP
   000305         030700         03 FILLER                   PIC X      VALUE SPACE.      IX1214.2 IMP
   000306         030800         03 ENDER-DESC               PIC X(44)  VALUE             IX1214.2
   000307         030900            "ERRORS ENCOUNTERED".                                 IX1214.2
   000308         031000 01  CCVS-E-3.                                                    IX1214.2
   000309         031100     02  FILLER                      PIC X(22)  VALUE             IX1214.2
   000310         031200            " FOR OFFICIAL USE ONLY".                             IX1214.2
   000311         031300     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1214.2 IMP
   000312         031400     02  FILLER                      PIC X(58)  VALUE             IX1214.2
   000313         031500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1214.2
   000314         031600     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1214.2 IMP
   000315         031700     02 FILLER                       PIC X(15)  VALUE             IX1214.2
   000316         031800             " COPYRIGHT 1985".                                   IX1214.2
   000317         031900 01  CCVS-E-4.                                                    IX1214.2
   000318         032000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1214.2 IMP
   000319         032100     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1214.2
   000320         032200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1214.2 IMP
   000321         032300     02 FILLER                       PIC X(40)  VALUE             IX1214.2
   000322         032400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1214.2
   000323         032500 01  XXINFO.                                                      IX1214.2
   000324         032600     02 FILLER                       PIC X(19)  VALUE             IX1214.2
   000325         032700            "*** INFORMATION ***".                                IX1214.2
   000326         032800     02 INFO-TEXT.                                                IX1214.2
   000327         032900       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1214.2 IMP
   000328         033000       04 XXCOMPUTED                 PIC X(20).                   IX1214.2
   000329         033100       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1214.2 IMP
   000330         033200       04 XXCORRECT                  PIC X(20).                   IX1214.2
   000331         033300     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1214.2
   000332         033400 01  HYPHEN-LINE.                                                 IX1214.2
   000333         033500     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1214.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000334         033600     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1214.2
   000335         033700-    "*****************************************".                 IX1214.2
   000336         033800     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1214.2
   000337         033900-    "******************************".                            IX1214.2
   000338         034000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1214.2
   000339         034100     "IX121A".                                                    IX1214.2
   000340         034200 01 TEST-NUMBER                      PIC 9 VALUE ZERO.            IX1214.2 IMP
   000341         034300                                                                  IX1214.2
   000342         034400 PROCEDURE DIVISION.                                              IX1214.2
   000343         034500 DECLARATIVES.                                                    IX1214.2
   000344         034600                                                                  IX1214.2
   000345         034700 SECT-IX105-0002 SECTION.                                         IX1214.2
   000346         034800     USE AFTER EXCEPTION PROCEDURE ON IX-VS2.                     IX1214.2 87
   000347         034900 INPUT-PROCESS.                                                   IX1214.2
   000348         035000         MOVE 1 TO PERM-ERRORS.                                   IX1214.2 132
   000349         035100         IF TEST-NUMBER NOT = 3 GO TO END-DECL.                   IX1214.2 340 477
   000350         035200 D-RWR-TEST-GF-01-1.                                              IX1214.2
   000351         035300     IF IX-VS2-STATUS  = "00"                                     IX1214.2 139
   000352      1  035400         GO TO D-RWR-PASS-GF-01-0.                                IX1214.2 361
   000353         035500     IF IX-VS2-STATUS  = "44"                                     IX1214.2 139
   000354      1  035600         GO TO D-RWR-PASS-GF-01-0.                                IX1214.2 361
   000355         035700 D-RWR-FAIL-GF-01-0.                                              IX1214.2
   000356         035800     MOVE "IX-5, 1.3.4, (5) d 1 & 2;  SHORT RECORD" TO RE-MARK.   IX1214.2 210
   000357         035900     PERFORM D-FAIL.                                              IX1214.2 385
   000358         036000     MOVE  IX-VS2-STATUS      TO COMPUTED-A.                      IX1214.2 139 216
   000359         036100     MOVE "00 OR 44" TO CORRECT-X.                                IX1214.2 229
   000360         036200     GO TO D-RWR-WRITE-GF-01-0.                                   IX1214.2 363
   000361         036300 D-RWR-PASS-GF-01-0.                                              IX1214.2
   000362         036400     PERFORM D-PASS.                                              IX1214.2 384
   000363         036500 D-RWR-WRITE-GF-01-0.                                             IX1214.2
   000364         036600     PERFORM D-PRINT-DETAIL.                                      IX1214.2 386
   000365         036700 D-CLOSE-FILES.                                                   IX1214.2
   000366         036800     OPEN I-O RAW-DATA.                                           IX1214.2 65
   000367         036900     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1214.2 338 68
   000368         037000     READ RAW-DATA INVALID KEY GO TO D-END-E-2.                   IX1214.2 65 376
   000369         037100     MOVE "OK.     " TO C-ABORT.                                  IX1214.2 79
   000370         037200     MOVE PASS-COUNTER TO C-OK.                                   IX1214.2 256 72
   000371         037300     MOVE ERROR-HOLD   TO C-ALL.                                  IX1214.2 258 73
   000372         037400     MOVE ERROR-COUNTER TO C-FAIL.                                IX1214.2 254 74
   000373         037500     MOVE DELETE-COUNTER TO C-DELETED.                            IX1214.2 253 75
   000374         037600     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1214.2 255 76
   000375         037700     REWRITE RAW-DATA-SATZ INVALID KEY GO TO D-END-E-2.           IX1214.2 67 376
   000376         037800 D-END-E-2.                                                       IX1214.2
   000377         037900     CLOSE RAW-DATA.                                              IX1214.2 65
   000378         038000     PERFORM D-END-ROUTINE THRU D-END-ROUTINE-13.                 IX1214.2 398 419
   000379         038100     CLOSE PRINT-FILE.                                            IX1214.2 81
   000380         038200 D-TERMINATE-CCVS.                                                IX1214.2
   000381         038300     EXIT PROGRAM.                                                IX1214.2
   000382         038400 D-TERMINATE-CALL.                                                IX1214.2
   000383         038500     STOP     RUN.                                                IX1214.2
   000384         038600 D-PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.         IX1214.2 203 256
   000385         038700 D-FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.        IX1214.2 203 254
   000386         038800 D-PRINT-DETAIL.                                                  IX1214.2
   000387         038900     IF REC-CT NOT EQUAL TO ZERO                                  IX1214.2 252 IMP
   000388      1  039000             MOVE "." TO PARDOT-X                                 IX1214.2 207
   000389      1  039100             MOVE REC-CT TO DOTVALUE.                             IX1214.2 252 208
   000390         039200     MOVE TEST-RESULTS TO PRINT-REC. PERFORM D-WRITE-LINE.        IX1214.2 199 83 431
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000391         039300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM D-WRITE-LINE             IX1214.2 203 431
   000392      1  039400        PERFORM D-FAIL-ROUTINE THRU D-FAIL-ROUTINE-EX             IX1214.2 452 466
   000393      1  039500     ELSE PERFORM D-BAIL-OUT THRU D-BAIL-OUT-EX.                  IX1214.2 467 475
   000394         039600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1214.2 IMP 203 IMP 215
   000395         039700     MOVE SPACE TO CORRECT-X.                                     IX1214.2 IMP 229
   000396         039800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1214.2 252 IMP IMP 205
   000397         039900     MOVE     SPACE TO RE-MARK.                                   IX1214.2 IMP 210
   000398         040000 D-END-ROUTINE.                                                   IX1214.2
   000399         040100     MOVE HYPHEN-LINE TO DUMMY-RECORD.                            IX1214.2 332 85
   000400         040200     PERFORM D-WRITE-LINE 5 TIMES.                                IX1214.2 431
   000401         040300 D-END-RTN-EXIT.                                                  IX1214.2
   000402         040400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES. IX1214.2 295 85 431
   000403         040500 D-END-ROUTINE-1.                                                 IX1214.2
   000404         040600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1214.2 254 258 255
   000405         040700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1214.2 258 253 258
   000406         040800      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1214.2 256 258
   000407         040900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1214.2 256 318
   000408         041000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1214.2 258 320
   000409         041100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1214.2 317 303
   000410         041200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM D-WRITE-LINE.         IX1214.2 300 85 431
   000411         041300 D-END-ROUTINE-12.                                                IX1214.2
   000412         041400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1214.2 306
   000413         041500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1214.2 254 IMP
   000414      1  041600         MOVE "NO " TO ERROR-TOTAL                                IX1214.2 304
   000415         041700         ELSE                                                     IX1214.2
   000416      1  041800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1214.2 254 304
   000417         041900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1214.2 300 85
   000418         042000     PERFORM D-WRITE-LINE.                                        IX1214.2 431
   000419         042100 D-END-ROUTINE-13.                                                IX1214.2
   000420         042200     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1214.2 253 IMP
   000421      1  042300         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1214.2 304
   000422      1  042400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1214.2 253 304
   000423         042500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1214.2 306
   000424         042600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1214.2 300 85 431
   000425         042700      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1214.2 255 IMP
   000426      1  042800          MOVE "NO " TO ERROR-TOTAL                               IX1214.2 304
   000427      1  042900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1214.2 255 304
   000428         043000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1214.2 306
   000429         043100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1214.2 300 85 431
   000430         043200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM D-WRITE-LINE.         IX1214.2 308 85 431
   000431         043300 D-WRITE-LINE.                                                    IX1214.2
   000432         043400     ADD 1 TO RECORD-COUNT.                                       IX1214.2 260
   000433         043500     IF RECORD-COUNT GREATER 42                                   IX1214.2 260
   000434      1  043600       MOVE DUMMY-RECORD TO DUMMY-HOLD                            IX1214.2 85 259
   000435      1  043700       MOVE SPACE TO DUMMY-RECORD                                 IX1214.2 IMP 85
   000436      1  043800       WRITE DUMMY-RECORD AFTER ADVANCING PAGE                    IX1214.2 85
   000437      1  043900       MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES    IX1214.2 262 85 447
   000438      1  044000       MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM D-WRT-LN 2 TIMES    IX1214.2 267 85 447
   000439      1  044100       MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES    IX1214.2 276 85 447
   000440      1  044200       MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM D-WRT-LN 3 TIMES    IX1214.2 288 85 447
   000441      1  044300       MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM D-WRT-LN            IX1214.2 240 85 447
   000442      1  044400       MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM D-WRT-LN            IX1214.2 245 85 447
   000443      1  044500       MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM D-WRT-LN          IX1214.2 332 85 447
   000444      1  044600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1214.2 259 85
   000445      1  044700         MOVE ZERO TO RECORD-COUNT.                               IX1214.2 IMP 260
   000446         044800     PERFORM D-WRT-LN.                                            IX1214.2 447
   000447         044900 D-WRT-LN.                                                        IX1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000448         045000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1214.2 85
   000449         045100     MOVE SPACE TO DUMMY-RECORD.                                  IX1214.2 IMP 85
   000450         045200 D-BLANK-LINE-PRINT.                                              IX1214.2
   000451         045300     PERFORM D-WRT-LN.                                            IX1214.2 447
   000452         045400 D-FAIL-ROUTINE.                                                  IX1214.2
   000453         045500     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1214.2 215 IMP
   000454      1  045600            GO TO  D-FAIL-ROUTINE-WRITE.                          IX1214.2 461
   000455         045700     IF  CORRECT-X NOT EQUAL TO SPACE GO TO D-FAIL-ROUTINE-WRITE. IX1214.2 229 IMP 461
   000456         045800     MOVE ANSI-REFERENCE TO INF-ANSI-REFERENCE.                   IX1214.2 261 331
   000457         045900     MOVE "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.    IX1214.2 326
   000458         046000     MOVE  XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.  IX1214.2 323 85 431
   000459         046100     MOVE  SPACES TO INF-ANSI-REFERENCE.                          IX1214.2 IMP 331
   000460         046200     GO TO D-FAIL-ROUTINE-EX.                                     IX1214.2 466
   000461         046300 D-FAIL-ROUTINE-WRITE.                                            IX1214.2
   000462         046400     MOVE  TEST-COMPUTED TO PRINT-REC PERFORM D-WRITE-LINE        IX1214.2 211 83 431
   000463         046500     MOVE  ANSI-REFERENCE TO COR-ANSI-REFERENCE.                  IX1214.2 261 239
   000464         046600     MOVE TEST-CORRECT TO PRINT-REC PERFORM D-WRITE-LINE 2 TIMES. IX1214.2 226 83 431
   000465         046700     MOVE  SPACES TO COR-ANSI-REFERENCE.                          IX1214.2 IMP 239
   000466         046800 D-FAIL-ROUTINE-EX. EXIT.                                         IX1214.2
   000467         046900 D-BAIL-OUT.                                                      IX1214.2
   000468         047000     IF  COMPUTED-A NOT EQUAL TO SPACE GO TO D-BAIL-OUT-WRITE.    IX1214.2 216 IMP 470
   000469         047100     IF  CORRECT-A EQUAL TO SPACE GO TO D-BAIL-OUT-EX.            IX1214.2 230 IMP 475
   000470         047200 D-BAIL-OUT-WRITE.                                                IX1214.2
   000471         047300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1214.2 230 330 216 328
   000472         047400     MOVE  ANSI-REFERENCE TO INF-ANSI-REFERENCE.                  IX1214.2 261 331
   000473         047500     MOVE  XXINFO TO DUMMY-RECORD. PERFORM D-WRITE-LINE 2 TIMES.  IX1214.2 323 85 431
   000474         047600     MOVE  SPACES TO INF-ANSI-REFERENCE.                          IX1214.2 IMP 331
   000475         047700 D-BAIL-OUT-EX. EXIT.                                             IX1214.2
   000476         047800                                                                  IX1214.2
   000477         047900 END-DECL.                                                        IX1214.2
   000478         048000 END DECLARATIVES.                                                IX1214.2
   000479         048100                                                                  IX1214.2
   000480         048200                                                                  IX1214.2
   000481         048300 CCVS1 SECTION.                                                   IX1214.2
   000482         048400 OPEN-FILES.                                                      IX1214.2
   000483         048500     OPEN I-O RAW-DATA.                                           IX1214.2 65
   000484         048600     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1214.2 338 68
   000485         048700     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1214.2 65 491
   000486         048800     MOVE "ABORTED " TO C-ABORT.                                  IX1214.2 79
   000487         048900     ADD 1 TO C-NO-OF-TESTS.                                      IX1214.2 71
   000488         049000     ACCEPT C-DATE  FROM DATE.                                    IX1214.2 69
   000489         049100     ACCEPT C-TIME  FROM TIME.                                    IX1214.2 70
   000490         049200     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1214.2 67 491
   000491         049300 END-E-1.                                                         IX1214.2
   000492         049400     CLOSE RAW-DATA.                                              IX1214.2 65
   000493         049500     OPEN    OUTPUT PRINT-FILE.                                   IX1214.2 81
   000494         049600     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1214.2 338 279 338 298
   000495         049700     MOVE    SPACE TO TEST-RESULTS.                               IX1214.2 IMP 199
   000496         049800     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1214.2 540 545
   000497         049900     MOVE    ZERO TO REC-SKL-SUB.                                 IX1214.2 IMP 251
   000498         050000     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1214.2 499
   000499         050100 CCVS-INIT-FILE.                                                  IX1214.2
   000500         050200     ADD     1 TO REC-SKL-SUB.                                    IX1214.2 251
   000501         050300     MOVE    FILE-RECORD-INFO-SKELETON                            IX1214.2 148
   000502         050400          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1214.2 162 251
   000503         050500 CCVS-INIT-EXIT.                                                  IX1214.2
   000504         050600     GO TO CCVS1-EXIT.                                            IX1214.2 627
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000505         050700 CLOSE-FILES.                                                     IX1214.2
   000506         050800     OPEN I-O RAW-DATA.                                           IX1214.2 65
   000507         050900     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1214.2 338 68
   000508         051000     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1214.2 65 516
   000509         051100     MOVE "OK.     " TO C-ABORT.                                  IX1214.2 79
   000510         051200     MOVE PASS-COUNTER TO C-OK.                                   IX1214.2 256 72
   000511         051300     MOVE ERROR-HOLD   TO C-ALL.                                  IX1214.2 258 73
   000512         051400     MOVE ERROR-COUNTER TO C-FAIL.                                IX1214.2 254 74
   000513         051500     MOVE DELETE-COUNTER TO C-DELETED.                            IX1214.2 253 75
   000514         051600     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1214.2 255 76
   000515         051700     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1214.2 67 516
   000516         051800 END-E-2.                                                         IX1214.2
   000517         051900     CLOSE RAW-DATA.                                              IX1214.2 65
   000518         052000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1214.2 549 570 81
   000519         052100 TERMINATE-CCVS.                                                  IX1214.2
   000520         052200     EXIT PROGRAM.                                                IX1214.2
   000521         052300 TERMINATE-CALL.                                                  IX1214.2
   000522         052400     STOP     RUN.                                                IX1214.2
   000523         052500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1214.2 203 255
   000524         052600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1214.2 203 256
   000525         052700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1214.2 203 254
   000526         052800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1214.2 203 253
   000527         052900     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1214.2 210
   000528         053000 PRINT-DETAIL.                                                    IX1214.2
   000529         053100     IF REC-CT NOT EQUAL TO ZERO                                  IX1214.2 252 IMP
   000530      1  053200             MOVE "." TO PARDOT-X                                 IX1214.2 207
   000531      1  053300             MOVE REC-CT TO DOTVALUE.                             IX1214.2 252 208
   000532         053400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1214.2 199 83 582
   000533         053500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1214.2 203 582
   000534      1  053600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1214.2 603 617
   000535      1  053700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1214.2 618 626
   000536         053800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1214.2 IMP 203 IMP 215
   000537         053900     MOVE SPACE TO CORRECT-X.                                     IX1214.2 IMP 229
   000538         054000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1214.2 252 IMP IMP 205
   000539         054100     MOVE     SPACE TO RE-MARK.                                   IX1214.2 IMP 210
   000540         054200 HEAD-ROUTINE.                                                    IX1214.2
   000541         054300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1214.2 262 85 582
   000542         054400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1214.2 267 85 582
   000543         054500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1214.2 276 85 582
   000544         054600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1214.2 288 85 582
   000545         054700 COLUMN-NAMES-ROUTINE.                                            IX1214.2
   000546         054800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1214.2 240 85 582
   000547         054900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1214.2 245 85 582
   000548         055000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1214.2 332 85 582
   000549         055100 END-ROUTINE.                                                     IX1214.2
   000550         055200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1214.2 332 85 582
   000551         055300 END-RTN-EXIT.                                                    IX1214.2
   000552         055400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1214.2 295 85 582
   000553         055500 END-ROUTINE-1.                                                   IX1214.2
   000554         055600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1214.2 254 258 255
   000555         055700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1214.2 258 253 258
   000556         055800      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1214.2 256 258
   000557         055900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1214.2
   000558         056000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1214.2 256 318
   000559         056100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1214.2 258 320
   000560         056200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1214.2 317 303
   000561         056300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1214.2 300 85 582
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000562         056400  END-ROUTINE-12.                                                 IX1214.2
   000563         056500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1214.2 306
   000564         056600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1214.2 254 IMP
   000565      1  056700         MOVE "NO " TO ERROR-TOTAL                                IX1214.2 304
   000566         056800         ELSE                                                     IX1214.2
   000567      1  056900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1214.2 254 304
   000568         057000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1214.2 300 85
   000569         057100     PERFORM WRITE-LINE.                                          IX1214.2 582
   000570         057200 END-ROUTINE-13.                                                  IX1214.2
   000571         057300     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1214.2 253 IMP
   000572      1  057400         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1214.2 304
   000573      1  057500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1214.2 253 304
   000574         057600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1214.2 306
   000575         057700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1214.2 300 85 582
   000576         057800      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1214.2 255 IMP
   000577      1  057900          MOVE "NO " TO ERROR-TOTAL                               IX1214.2 304
   000578      1  058000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1214.2 255 304
   000579         058100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1214.2 306
   000580         058200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1214.2 300 85 582
   000581         058300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1214.2 308 85 582
   000582         058400 WRITE-LINE.                                                      IX1214.2
   000583         058500     ADD 1 TO RECORD-COUNT.                                       IX1214.2 260
   000584         058600     IF RECORD-COUNT GREATER 42                                   IX1214.2 260
   000585      1  058700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1214.2 85 259
   000586      1  058800         MOVE SPACE TO DUMMY-RECORD                               IX1214.2 IMP 85
   000587      1  058900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1214.2 85
   000588      1  059000         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1214.2 262 85 598
   000589      1  059100         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1214.2 267 85 598
   000590      1  059200         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1214.2 276 85 598
   000591      1  059300         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1214.2 288 85 598
   000592      1  059400         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1214.2 240 85 598
   000593      1  059500         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1214.2 245 85 598
   000594      1  059600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1214.2 332 85 598
   000595      1  059700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1214.2 259 85
   000596      1  059800         MOVE ZERO TO RECORD-COUNT.                               IX1214.2 IMP 260
   000597         059900     PERFORM WRT-LN.                                              IX1214.2 598
   000598         060000 WRT-LN.                                                          IX1214.2
   000599         060100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1214.2 85
   000600         060200     MOVE SPACE TO DUMMY-RECORD.                                  IX1214.2 IMP 85
   000601         060300 BLANK-LINE-PRINT.                                                IX1214.2
   000602         060400     PERFORM WRT-LN.                                              IX1214.2 598
   000603         060500 FAIL-ROUTINE.                                                    IX1214.2
   000604         060600     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1214.2 215 IMP
   000605      1  060700            GO TO   FAIL-ROUTINE-WRITE.                           IX1214.2 612
   000606         060800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1214.2 229 IMP 612
   000607         060900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1214.2 261 331
   000608         061000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1214.2 326
   000609         061100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1214.2 323 85 582
   000610         061200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1214.2 IMP 331
   000611         061300     GO TO  FAIL-ROUTINE-EX.                                      IX1214.2 617
   000612         061400 FAIL-ROUTINE-WRITE.                                              IX1214.2
   000613         061500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1214.2 211 83 582
   000614         061600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1214.2 261 239
   000615         061700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1214.2 226 83 582
   000616         061800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1214.2 IMP 239
   000617         061900 FAIL-ROUTINE-EX. EXIT.                                           IX1214.2
   000618         062000 BAIL-OUT.                                                        IX1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000619         062100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1214.2 216 IMP 621
   000620         062200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1214.2 230 IMP 626
   000621         062300 BAIL-OUT-WRITE.                                                  IX1214.2
   000622         062400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1214.2 230 330 216 328
   000623         062500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1214.2 261 331
   000624         062600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1214.2 323 85 582
   000625         062700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1214.2 IMP 331
   000626         062800 BAIL-OUT-EX. EXIT.                                               IX1214.2
   000627         062900 CCVS1-EXIT.                                                      IX1214.2
   000628         063000     EXIT.                                                        IX1214.2
   000629         063100                                                                  IX1214.2
   000630         063200 SECT-IX121A-0003 SECTION.                                        IX1214.2
   000631         063300 SEQ-INIT-010.                                                    IX1214.2
   000632         063400     MOVE "IX-VS2" TO XFILE-NAME (1).                             IX1214.2 165
   000633         063500     MOVE "R1-F-G" TO XRECORD-NAME (1).                           IX1214.2 167
   000634         063600     MOVE CCVS-PGM-ID TO XPROGRAM-NAME (1).                       IX1214.2 338 177
   000635         063700     MOVE 000240 TO XRECORD-LENGTH (1).                           IX1214.2 179
   000636         063800     MOVE "RC" TO CHARS-OR-RECORDS (1).                           IX1214.2 181
   000637         063900     MOVE 0002 TO XBLOCK-SIZE (1).                                IX1214.2 183
   000638         064000     MOVE 000050 TO RECORDS-IN-FILE (1).                          IX1214.2 185
   000639         064100     MOVE "IX" TO XFILE-ORGANIZATION (1).                         IX1214.2 187
   000640         064200     MOVE "S" TO XLABEL-TYPE (1).                                 IX1214.2 189
   000641         064300     MOVE 000001 TO XRECORD-NUMBER (1).                           IX1214.2 171
   000642         064400     MOVE 0 TO COUNT-OF-RECS.                                     IX1214.2 143
   000643         064500                                                                  IX1214.2
   000644         064700*   TEST  1                                                      *IX1214.2
   000645         064800*         OPEN OUTPUT ...                 00 EXPECTED            *IX1214.2
   000646         064900*         IX-3, 1.3.4 (1) a                                      *IX1214.2
   000647         065000*    STATUS 00 CHECK ON OUTPUT FILE IX-VS2                       *IX1214.2
   000648         065100*    THE OUTPUT STATEMENT IS SUCCESSFULLY EXECUTED               *IX1214.2
   000649         065300 OPN-INIT-GF-01-0.                                                IX1214.2
   000650         065400     ADD  1 TO TEST-NUMBER.                                       IX1214.2 340
   000651         065500     MOVE 1 TO STATUS-TEST-00.                                    IX1214.2 134
   000652         065600     MOVE SPACES TO IX-VS2-STATUS.                                IX1214.2 IMP 139
   000653         065700     MOVE "OPEN OUTPUT: 00 EXP." TO FEATURE.                      IX1214.2 201
   000654         065800     MOVE "OPN-TEST-GF-01-0" TO PAR-NAME.                         IX1214.2 205
   000655         065900     OPEN                                                         IX1214.2
   000656         066000        OUTPUT IX-VS2.                                            IX1214.2 87
   000657         066100     IF IX-VS2-STATUS EQUAL TO "00"                               IX1214.2 139
   000658      1  066200         GO TO OPN-PASS-GF-01-0.                                  IX1214.2 665
   000659         066300 OPN-FAIL-GF-01-0.                                                IX1214.2
   000660         066400     MOVE "IX-3, 1.3.4, (1) a. " TO RE-MARK.                      IX1214.2 210
   000661         066500     PERFORM FAIL.                                                IX1214.2 525
   000662         066600     MOVE IX-VS2-STATUS TO COMPUTED-A.                            IX1214.2 139 216
   000663         066700     MOVE "00" TO CORRECT-X.                                      IX1214.2 229
   000664         066800     GO TO OPN-WRITE-GF-01-0.                                     IX1214.2 667
   000665         066900 OPN-PASS-GF-01-0.                                                IX1214.2
   000666         067000     PERFORM PASS.                                                IX1214.2 524
   000667         067100 OPN-WRITE-GF-01-0.                                               IX1214.2
   000668         067200     PERFORM PRINT-DETAIL.                                        IX1214.2 528
   000669         067400*   TEST  2                                                      *IX1214.2
   000670         067500*         WRITE                           00 EXPECTED            *IX1214.2
   000671         067600*         IX-3, 1.3.4 (1) a                                      *IX1214.2
   000672         067700*    CREATING A INDEXED FILE WITH 50 RECORDS                     *IX1214.2
   000673         067800*    KEY:  FROM  000000001 TO 000000050                          *IX1214.2
   000674         068000 WRI-INIT-GF-01-0.                                                IX1214.2
   000675         068100     ADD  1 TO TEST-NUMBER.                                       IX1214.2 340
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000676         068200     MOVE SPACES TO IX-VS2-STATUS.                                IX1214.2 IMP 139
   000677         068300     MOVE 0 TO STATUS-TEST-00.                                    IX1214.2 134
   000678         068400     MOVE "WRITE: 00 EXPECTED" TO FEATURE.                        IX1214.2 201
   000679         068500     MOVE "WRI-TEST-GF-01-0" TO PAR-NAME.                         IX1214.2 205
   000680         068600 WRI-TEST-GF-01-0.                                                IX1214.2
   000681         068700     MOVE XRECORD-NUMBER (1) TO GRP-0101-KEY, COUNT-OF-RECS.      IX1214.2 171 116 143
   000682         068800     MOVE GRP-0101 TO XRECORD-KEY (1).                            IX1214.2 114 192
   000683         068900     MOVE GRP-0102 TO ALTERNATE-KEY1 (1).                         IX1214.2 119 194
   000684         069000*    THE VALUE OF THE ALTERNATE KEY IS 50 TIMES UNCHANGED        *IX1214.2
   000685         069100     MOVE FILE-RECORD-INFO (1) TO IX-VS2R1-F-G-240.               IX1214.2 162 94
   000686         069200     WRITE IX-VS2R1-F-G-240.                                      IX1214.2 94
   000687         069300     IF IX-VS2-STATUS  NOT = "00"                                 IX1214.2 139
   000688      1  069400         MOVE 1 TO STATUS-TEST-00                                 IX1214.2 134
   000689      1  069500         GO TO WRI-FAIL-GF-01-0.                                  IX1214.2 698
   000690         069600     IF XRECORD-NUMBER (1) EQUAL TO 50                            IX1214.2 171
   000691      1  069700         GO TO WRI-TEST-GF-01-1.                                  IX1214.2 694
   000692         069800     ADD 1 TO XRECORD-NUMBER (1).                                 IX1214.2 171
   000693         069900     GO TO WRI-TEST-GF-01-0.                                      IX1214.2 680
   000694         070000 WRI-TEST-GF-01-1.                                                IX1214.2
   000695         070100     IF RECORDS-IN-ERROR EQUAL TO ZERO                            IX1214.2 128 IMP
   000696      1  070200         GO TO WRI-PASS-GF-01-0.                                  IX1214.2 703
   000697         070300     MOVE "ERROR IN CREATING FILE" TO RE-MARK.                    IX1214.2 210
   000698         070400 WRI-FAIL-GF-01-0.                                                IX1214.2
   000699         070500     MOVE "IX-3, 1.3.4, (1) a. " TO RE-MARK.                      IX1214.2 210
   000700         070600     PERFORM FAIL.                                                IX1214.2 525
   000701         070700     MOVE "RECORDS WRITTEN =" TO COMPUTED-A.                      IX1214.2 216
   000702         070800     GO TO WRI-WRITE-GF-01-0.                                     IX1214.2 705
   000703         070900 WRI-PASS-GF-01-0.                                                IX1214.2
   000704         071000     PERFORM PASS.                                                IX1214.2 524
   000705         071100 WRI-WRITE-GF-01-0.                                               IX1214.2
   000706         071200     PERFORM PRINT-DETAIL.                                        IX1214.2 528
   000707         071300     MOVE "FILE CREATED, RECS =" TO COMPUTED-A.                   IX1214.2 216
   000708         071400     MOVE "CREATE FILE IX-VS2" TO FEATURE.                        IX1214.2 201
   000709         071500     MOVE "WRI-TEST-GF-01-1" TO PAR-NAME.                         IX1214.2 205
   000710         071600     MOVE COUNT-OF-RECS TO CORRECT-18V0.                          IX1214.2 143 236
   000711         071700     PERFORM PRINT-DETAIL.                                        IX1214.2 528
   000712         071900*   TEST  3                                                      *IX1214.2
   000713         072000*         REWRITE   (WITH WRONG RECORD LENGTH (SHORTER))         *IX1214.2
   000714         072100*         IX-5, 1.3.4 (5) d 1 & 2                                *IX1214.2
   000715         072200*         FILE STATUS  00   OR  44   EXPECTED                    *IX1214.2
   000716         072300*    KEY:        000000005                                       *IX1214.2
   000717         072500 RWR-INIT-GF-01-0.                                                IX1214.2
   000718         072600     ADD  1 TO TEST-NUMBER.                                       IX1214.2 340
   000719         072700     CLOSE IX-VS2.                                                IX1214.2 87
   000720         072800     OPEN I-O IX-VS2.                                             IX1214.2 87
   000721         072900     MOVE SPACES TO IX-VS2-STATUS.                                IX1214.2 IMP 139
   000722         073000     MOVE 0 TO STATUS-TEST-00.                                    IX1214.2 134
   000723         073100     MOVE "RWRTE LG. 00/44 EXP." TO FEATURE.                      IX1214.2 201
   000724         073200     MOVE "RWR-TEST-GF-01-0" TO PAR-NAME.                         IX1214.2 205
   000725         073300     READ IX-VS2 AT END       GO TO RWR-TEST-GF-01-0.             IX1214.2 87 730
   000726         073400     READ IX-VS2 AT END       GO TO RWR-TEST-GF-01-0.             IX1214.2 87 730
   000727         073500     READ IX-VS2 AT END       GO TO RWR-TEST-GF-01-0.             IX1214.2 87 730
   000728         073600     READ IX-VS2 AT END       GO TO RWR-TEST-GF-01-0.             IX1214.2 87 730
   000729         073700     READ IX-VS2 AT END       GO TO RWR-TEST-GF-01-0.             IX1214.2 87 730
   000730         073800 RWR-TEST-GF-01-0.                                                IX1214.2
   000731         073900     MOVE "WRONG RECORD LENGTH ( LONGER )" TO IX-VS2-REC-LONG.    IX1214.2 108
   000732         074000     REWRITE IX-VS2R1-F-G-280.                                    IX1214.2 107
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000733         074100 RWR-TEST-GF-01-1.                                                IX1214.2
   000734         074200     IF IX-VS2-STATUS  = "00"                                     IX1214.2 139
   000735      1  074300         GO TO RWR-PASS-GF-01-0.                                  IX1214.2 744
   000736         074400     IF IX-VS2-STATUS  = "44"                                     IX1214.2 139
   000737      1  074500         GO TO RWR-PASS-GF-01-0.                                  IX1214.2 744
   000738         074600 RWR-FAIL-GF-01-0.                                                IX1214.2
   000739         074700     MOVE "IX-5, 1.3.4, (5) D 1 & 2;   LONG RECORD" TO RE-MARK.   IX1214.2 210
   000740         074800     PERFORM FAIL.                                                IX1214.2 525
   000741         074900     MOVE  IX-VS2-STATUS      TO COMPUTED-A.                      IX1214.2 139 216
   000742         075000     MOVE "00 OR 44" TO CORRECT-X.                                IX1214.2 229
   000743         075100     GO TO RWR-WRITE-GF-01-0.                                     IX1214.2 746
   000744         075200 RWR-PASS-GF-01-0.                                                IX1214.2
   000745         075300     PERFORM PASS.                                                IX1214.2 524
   000746         075400 RWR-WRITE-GF-01-0.                                               IX1214.2
   000747         075500     PERFORM PRINT-DETAIL.                                        IX1214.2 528
   000748         075600                                                                  IX1214.2
   000749         075700 TERMINATE-ROUTINE.                                               IX1214.2
   000750         075800     EXIT.                                                        IX1214.2
   000751         075900                                                                  IX1214.2
   000752         076000 CCVS-EXIT SECTION.                                               IX1214.2
   000753         076100 CCVS-999999.                                                     IX1214.2
   000754         076200     GO TO CLOSE-FILES.                                           IX1214.2 505
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      194   ALTERNATE-KEY1 . . . . . . . .  M683
      196   ALTERNATE-KEY2
      261   ANSI-REFERENCE . . . . . . . .  456 463 472 607 614 623
       79   C-ABORT. . . . . . . . . . . .  M369 M486 M509
       73   C-ALL. . . . . . . . . . . . .  M371 M511
       69   C-DATE . . . . . . . . . . . .  M488
       75   C-DELETED. . . . . . . . . . .  M373 M513
       74   C-FAIL . . . . . . . . . . . .  M372 M512
       78   C-INDENT
       76   C-INSPECT. . . . . . . . . . .  M374 M514
       71   C-NO-OF-TESTS. . . . . . . . .  M487
       77   C-NOTE
       72   C-OK . . . . . . . . . . . . .  M370 M510
       70   C-TIME . . . . . . . . . . . .  M489
      240   CCVS-C-1 . . . . . . . . . . .  441 546 592
      245   CCVS-C-2 . . . . . . . . . . .  442 547 593
      295   CCVS-E-1 . . . . . . . . . . .  402 552
      300   CCVS-E-2 . . . . . . . . . . .  410 417 424 429 561 568 575 580
      303   CCVS-E-2-2 . . . . . . . . . .  M409 M560
      308   CCVS-E-3 . . . . . . . . . . .  430 581
      317   CCVS-E-4 . . . . . . . . . . .  409 560
      318   CCVS-E-4-1 . . . . . . . . . .  M407 M558
      320   CCVS-E-4-2 . . . . . . . . . .  M408 M559
      262   CCVS-H-1 . . . . . . . . . . .  437 541 588
      267   CCVS-H-2A. . . . . . . . . . .  438 542 589
      276   CCVS-H-2B. . . . . . . . . . .  439 543 590
      288   CCVS-H-3 . . . . . . . . . . .  440 544 591
      338   CCVS-PGM-ID. . . . . . . . . .  367 484 494 494 507 634
      181   CHARS-OR-RECORDS . . . . . . .  M636
      222   CM-18V0
      216   COMPUTED-A . . . . . . . . . .  217 219 220 221 222 M358 468 471 619 622 M662 M701 M707 M741
      217   COMPUTED-N
      215   COMPUTED-X . . . . . . . . . .  M394 453 M536 604
      219   COMPUTED-0V18
      221   COMPUTED-14V4
      223   COMPUTED-18V0
      220   COMPUTED-4V14
      239   COR-ANSI-REFERENCE . . . . . .  M463 M465 M614 M616
      230   CORRECT-A. . . . . . . . . . .  231 232 233 234 235 469 471 620 622
      231   CORRECT-N
      229   CORRECT-X. . . . . . . . . . .  M359 M395 455 M537 606 M663 M742
      232   CORRECT-0V18
      234   CORRECT-14V4
      236   CORRECT-18V0 . . . . . . . . .  M710
      233   CORRECT-4V14
      145   COUNT-OF-RECORDS
      143   COUNT-OF-RECS. . . . . . . . .  145 M642 M681 710
      235   CR-18V0
      253   DELETE-COUNTER . . . . . . . .  373 405 420 422 513 M526 555 571 573
      208   DOTVALUE . . . . . . . . . . .  M389 M531
      259   DUMMY-HOLD . . . . . . . . . .  M434 444 M585 595
       85   DUMMY-RECORD . . . . . . . . .  M399 M402 M410 M417 M424 M429 M430 434 M435 436 M437 M438 M439 M440 M441 M442
                                            M443 M444 448 M449 M458 M473 M541 M542 M543 M544 M546 M547 M548 M550 M552 M561
                                            M568 M575 M580 M581 585 M586 587 M588 M589 M590 M591 M592 M593 M594 M595 599
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    18
0 Defined   Cross-reference of data names   References

0                                           M600 M609 M624
      306   ENDER-DESC . . . . . . . . . .  M412 M423 M428 M563 M574 M579
      126   EOF-FLAG
      254   ERROR-COUNTER. . . . . . . . .  372 M385 404 413 416 512 M525 554 564 567
      130   ERROR-FLAG
      258   ERROR-HOLD . . . . . . . . . .  371 M404 M405 M405 M406 408 511 M554 M555 M555 M556 559
      304   ERROR-TOTAL. . . . . . . . . .  M414 M416 M421 M422 M426 M427 M565 M567 M572 M573 M577 M578
      201   FEATURE. . . . . . . . . . . .  M653 M678 M708 M723
      162   FILE-RECORD-INFO . . . . . . .  M502 685
      163   FILE-RECORD-INFO-P1-120
      190   FILE-RECORD-INFO-P121-240
      148   FILE-RECORD-INFO-SKELETON. . .  501
      147   FILE-RECORD-INFORMATION-REC
      114   GRP-0101 . . . . . . . . . . .  682
      116   GRP-0101-KEY . . . . . . . . .  M681
      119   GRP-0102 . . . . . . . . . . .  683
      121   GRP-0102-KEY
      332   HYPHEN-LINE. . . . . . . . . .  399 443 548 550 594
      298   ID-AGAIN . . . . . . . . . . .  M494
      331   INF-ANSI-REFERENCE . . . . . .  M456 M459 M472 M474 M607 M610 M623 M625
      326   INFO-TEXT. . . . . . . . . . .  M457 M608
      255   INSPECT-COUNTER. . . . . . . .  374 404 425 427 514 M523 554 576 578
       87   IX-VS2 . . . . . . . . . . . .  54 346 656 719 720 725 726 727 728 729
      100   IX-VS2-ALTER-KEY
       98   IX-VS2-KEY . . . . . . . . . .  58
      108   IX-VS2-REC-LONG. . . . . . . .  M731
      104   IX-VS2-REC-SHORT
       95   IX-VS2-REC-120
      105   IX-VS2-REC-120-200
      109   IX-VS2-REC-120-239
       96   IX-VS2-REC-120-240
      110   IX-VS2-REC-240-280
      139   IX-VS2-STATUS. . . . . . . . .  59 351 353 358 M652 657 662 M676 687 M721 734 736 741
      140   IX-VS2-STAT1
      141   IX-VS2-STAT2
      103   IX-VS2R1-F-G-200
       94   IX-VS2R1-F-G-240 . . . . . . .  M685 686
      107   IX-VS2R1-F-G-280 . . . . . . .  732
      175   ODO-NUMBER
      203   P-OR-F . . . . . . . . . . . .  M384 M385 391 M394 M523 M524 M525 M526 533 M536
      205   PAR-NAME . . . . . . . . . . .  M396 M538 M654 M679 M709 M724
      207   PARDOT-X . . . . . . . . . . .  M388 M530
      256   PASS-COUNTER . . . . . . . . .  370 M384 406 407 510 M524 556 558
      132   PERM-ERRORS. . . . . . . . . .  M348
       81   PRINT-FILE . . . . . . . . . .  51 379 493 518
       83   PRINT-REC. . . . . . . . . . .  M390 M462 M464 M532 M613 M615
       65   RAW-DATA . . . . . . . . . . .  45 366 368 377 483 485 492 506 508 517
       68   RAW-DATA-KEY . . . . . . . . .  49 M367 M484 M507
       67   RAW-DATA-SATZ. . . . . . . . .  375 490 515
      210   RE-MARK. . . . . . . . . . . .  M356 M397 M527 M539 M660 M697 M699 M739
      252   REC-CT . . . . . . . . . . . .  387 389 396 529 531 538
      251   REC-SKL-SUB. . . . . . . . . .  M497 M500 502
      260   RECORD-COUNT . . . . . . . . .  M432 433 M445 M583 584 M596
      128   RECORDS-IN-ERROR . . . . . . .  695
      185   RECORDS-IN-FILE. . . . . . . .  M638
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    19
0 Defined   Cross-reference of data names   References

0     169   REELUNIT-NUMBER
      137   STATUS-TEST-READ
      134   STATUS-TEST-00 . . . . . . . .  M651 M677 M688 M722
      136   STATUS-TEST-10
      211   TEST-COMPUTED. . . . . . . . .  462 613
      226   TEST-CORRECT . . . . . . . . .  464 615
      279   TEST-ID. . . . . . . . . . . .  M494
      340   TEST-NUMBER. . . . . . . . . .  349 M650 M675 M718
      199   TEST-RESULTS . . . . . . . . .  390 M495 532
      257   TOTAL-ERROR
      173   UPDATE-NUMBER
      124   WRK-CS-09V00
      183   XBLOCK-SIZE. . . . . . . . . .  M637
      165   XFILE-NAME . . . . . . . . . .  M632
      187   XFILE-ORGANIZATION . . . . . .  M639
      189   XLABEL-TYPE. . . . . . . . . .  M640
      177   XPROGRAM-NAME. . . . . . . . .  M634
      192   XRECORD-KEY. . . . . . . . . .  M682
      179   XRECORD-LENGTH . . . . . . . .  M635
      167   XRECORD-NAME . . . . . . . . .  M633
      171   XRECORD-NUMBER . . . . . . . .  M641 681 690 M692
      328   XXCOMPUTED . . . . . . . . . .  M471 M622
      330   XXCORRECT. . . . . . . . . . .  M471 M622
      323   XXINFO . . . . . . . . . . . .  458 473 609 624
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    20
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

      618   BAIL-OUT . . . . . . . . . . .  P535
      626   BAIL-OUT-EX. . . . . . . . . .  E535 G620
      621   BAIL-OUT-WRITE . . . . . . . .  G619
      601   BLANK-LINE-PRINT
      752   CCVS-EXIT
      503   CCVS-INIT-EXIT
      499   CCVS-INIT-FILE . . . . . . . .  P498
      753   CCVS-999999
      481   CCVS1
      627   CCVS1-EXIT . . . . . . . . . .  G504
      505   CLOSE-FILES. . . . . . . . . .  G754
      545   COLUMN-NAMES-ROUTINE . . . . .  E496
      467   D-BAIL-OUT . . . . . . . . . .  P393
      475   D-BAIL-OUT-EX. . . . . . . . .  E393 G469
      470   D-BAIL-OUT-WRITE . . . . . . .  G468
      450   D-BLANK-LINE-PRINT
      365   D-CLOSE-FILES
      376   D-END-E-2. . . . . . . . . . .  G368 G375
      398   D-END-ROUTINE. . . . . . . . .  P378
      403   D-END-ROUTINE-1
      411   D-END-ROUTINE-12
      419   D-END-ROUTINE-13 . . . . . . .  E378
      401   D-END-RTN-EXIT
      385   D-FAIL . . . . . . . . . . . .  P357
      452   D-FAIL-ROUTINE . . . . . . . .  P392
      466   D-FAIL-ROUTINE-EX. . . . . . .  E392 G460
      461   D-FAIL-ROUTINE-WRITE . . . . .  G454 G455
      384   D-PASS . . . . . . . . . . . .  P362
      386   D-PRINT-DETAIL . . . . . . . .  P364
      355   D-RWR-FAIL-GF-01-0
      361   D-RWR-PASS-GF-01-0 . . . . . .  G352 G354
      350   D-RWR-TEST-GF-01-1
      363   D-RWR-WRITE-GF-01-0. . . . . .  G360
      382   D-TERMINATE-CALL
      380   D-TERMINATE-CCVS
      431   D-WRITE-LINE . . . . . . . . .  P390 P391 P400 P402 P410 P418 P424 P429 P430 P458 P462 P464 P473
      447   D-WRT-LN . . . . . . . . . . .  P437 P438 P439 P440 P441 P442 P443 P446 P451
      526   DE-LETE
      477   END-DECL . . . . . . . . . . .  G349
      491   END-E-1. . . . . . . . . . . .  G485 G490
      516   END-E-2. . . . . . . . . . . .  G508 G515
      549   END-ROUTINE. . . . . . . . . .  P518
      553   END-ROUTINE-1
      562   END-ROUTINE-12
      570   END-ROUTINE-13 . . . . . . . .  E518
      551   END-RTN-EXIT
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    21
0 Defined   Cross-reference of procedures   References

0     525   FAIL . . . . . . . . . . . . .  P661 P700 P740
      603   FAIL-ROUTINE . . . . . . . . .  P534
      617   FAIL-ROUTINE-EX. . . . . . . .  E534 G611
      612   FAIL-ROUTINE-WRITE . . . . . .  G605 G606
      540   HEAD-ROUTINE . . . . . . . . .  P496
      347   INPUT-PROCESS
      523   INSPT
      482   OPEN-FILES
      659   OPN-FAIL-GF-01-0
      649   OPN-INIT-GF-01-0
      665   OPN-PASS-GF-01-0 . . . . . . .  G658
      667   OPN-WRITE-GF-01-0. . . . . . .  G664
      524   PASS . . . . . . . . . . . . .  P666 P704 P745
      528   PRINT-DETAIL . . . . . . . . .  P668 P706 P711 P747
      738   RWR-FAIL-GF-01-0
      717   RWR-INIT-GF-01-0
      744   RWR-PASS-GF-01-0 . . . . . . .  G735 G737
      730   RWR-TEST-GF-01-0 . . . . . . .  G725 G726 G727 G728 G729
      733   RWR-TEST-GF-01-1
      746   RWR-WRITE-GF-01-0. . . . . . .  G743
      345   SECT-IX105-0002
      630   SECT-IX121A-0003
      631   SEQ-INIT-010
      521   TERMINATE-CALL
      519   TERMINATE-CCVS
      749   TERMINATE-ROUTINE
      698   WRI-FAIL-GF-01-0 . . . . . . .  G689
      674   WRI-INIT-GF-01-0
      703   WRI-PASS-GF-01-0 . . . . . . .  G696
      680   WRI-TEST-GF-01-0 . . . . . . .  G693
      694   WRI-TEST-GF-01-1 . . . . . . .  G691
      705   WRI-WRITE-GF-01-0. . . . . . .  G702
      582   WRITE-LINE . . . . . . . . . .  P532 P533 P541 P542 P543 P544 P546 P547 P548 P550 P552 P561 P569 P575 P580 P581
                                            P609 P613 P615 P624
      598   WRT-LN . . . . . . . . . . . .  P588 P589 P590 P591 P592 P593 P594 P597 P602
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    22
0 Defined   Cross-reference of programs     References

        3   IX121A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX121A    Date 06/04/2022  Time 11:57:44   Page    23
0LineID  Message code  Message text

     81  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     87  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

     87  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX121A:
 *    Source records = 754
 *    Data Division statements = 127
 *    Procedure Division statements = 389
 *    Generated COBOL statements = 0
 *    Program complexity factor = 398
0End of compilation 1,  program IX121A,  highest severity 0.
0Return code 0
