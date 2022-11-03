1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:21   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:21   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX1064.2
   000002         000200 PROGRAM-ID.                                                      IX1064.2
   000003         000300     IX106A.                                                      IX1064.2
   000004         000500*                                                              *  IX1064.2
   000005         000600*    VALIDATION FOR:-                                          *  IX1064.2
   000006         000700*                                                              *  IX1064.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1064.2
   000008         000900*                                                              *  IX1064.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1064.2
   000010         001100*                                                              *  IX1064.2
   000011         001300* THE PURPOSE OF THIS PROGRAM IS TO TEST THE ABILITY TO           IX1064.2
   000012         001400* USE THE THREE DIFFERENT TYPES OF FILES (SEQUENTIAL ,            IX1064.2
   000013         001500* INDEXED , AND RELATIVE) IN ONE PROGRAM . THE PROGRAM            IX1064.2
   000014         001600* IS BROKEN INTO FIVE SECTIONS . THE FIRST SECTION TESTS          IX1064.2
   000015         001700* THE ABILITY TO CREATE A RELATIVE FILE RANDOMLY . THE            IX1064.2
   000016         001800* SECOND SECTION TESTS THE ABILITY TO USE ALL THREE FILE          IX1064.2
   000017         001900* TYPES , READING IN THE RELATIVE FILE AND WRITING OUT THE        IX1064.2
   000018         002000* SEQUENTIAL AND INDEXED FILES . THE THIRD SECTION FURTHER        IX1064.2
   000019         002100* TESTS THE ABILITY TO USE THE THREE FILE TYPES . THE FOURTH      IX1064.2
   000020         002200* SECTION TESTS THE ABILITY TO DELETE RECORDS FROM THE            IX1064.2
   000021         002300* DIFFERENT FILE TYPES . THE FIFTH SECTION TESTS THE ABILITY      IX1064.2
   000022         002400* TO REWRITE RECORDS TO EACH OF THE FILE TYPES .                  IX1064.2
   000023         002500*                                                                 IX1064.2
   000024         002600* X-CARDS WHICH MUST BE RELACED WITH IMPLEMENTORS NAMES' IN       IX1064.2
   000025         002700* THIS PROGRAM ARE :                                              IX1064.2
   000026         002800*                                                                 IX1064.2
   000027         002900*        X-14 IMPLEMENTOR-NAME IN ASSIGN TO CLAUSE FOR            IX1064.2
   000028         003000*             SEQUENTIAL FILE .                                   IX1064.2
   000029         003100*        X-21 IMPLEMENTOR-NAME IN ASSIGN TO CLAUSE FOR            IX1064.2
   000030         003200*             RELATIVE FILE-1 , FILE-2 .                          IX1064.2
   000031         003300*        X-24 IMPLEMENTOR-NAME IN ASSIGN TO CLAUSE FOR            IX1064.2
   000032         003400*             INDEXED FILE .                                      IX1064.2
   000033         003500*        X-44 SYSTEM-NAME IN ASSIGN CLAUSE FOR                    IX1064.2
   000034         003600*        INDEXED FILE .                                           IX1064.2
   000035         003700*        X-55 SYSTEM PRINTER .                                    IX1064.2
   000036         003800*        X-62   FOR RAW-DATA                                      IX1064.2
   000037         003900*        X-82 SOURCE-COMPUTER .                                   IX1064.2
   000038         004000*        X-83 OBJECT-COMPUTER .                                   IX1064.2
   000039         004100*    C   X-84 PRINTE-FILE LABELS                                  IX1064.2
   000040         004300 ENVIRONMENT DIVISION.                                            IX1064.2
   000041         004400 CONFIGURATION SECTION.                                           IX1064.2
   000042         004500 SOURCE-COMPUTER.                                                 IX1064.2
   000043         004600     XXXXX082.                                                    IX1064.2
   000044         004700 OBJECT-COMPUTER.                                                 IX1064.2
   000045         004800     XXXXX083.                                                    IX1064.2
   000046         004900 INPUT-OUTPUT SECTION.                                            IX1064.2
   000047         005000 FILE-CONTROL.                                                    IX1064.2
   000048         005100     SELECT RAW-DATA   ASSIGN TO                                  IX1064.2 79
   000049         005200     XXXXX062                                                     IX1064.2
   000050         005300            ORGANIZATION IS INDEXED                               IX1064.2
   000051         005400            ACCESS MODE IS RANDOM                                 IX1064.2
   000052         005500            RECORD KEY IS RAW-DATA-KEY.                           IX1064.2 82
   000053         005600     SELECT PRINT-FILE ASSIGN TO                                  IX1064.2 94
   000054         005700     XXXXX055.                                                    IX1064.2
   000055         005800     SELECT  RL-FR1                                               IX1064.2 97
   000056         005900     ASSIGN TO                                                    IX1064.2
   000057         006000     XXXXX021                                                     IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100        ACCESS MODE IS RANDOM                                     IX1064.2
   000059         006200        RELATIVE KEY IS RL-KEY                                    IX1064.2 225
   000060         006300        ORGANIZATION IS RELATIVE                                  IX1064.2
   000061         006400        FILE STATUS IS FR1-STATUS.                                IX1064.2 250
   000062         006500     SELECT  IX-FS1                                               IX1064.2 138
   000063         006600     ASSIGN TO                                                    IX1064.2
   000064         006700     XXXXX024                                                     IX1064.2
   000065         006800     XXXXX044                                                     IX1064.2

 ==000065==> IGYDS1298-I Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX044" was treated as comments.

   000066         006900        ACCESS MODE IS RANDOM                                     IX1064.2
   000067         007000        ORGANIZATION IS INDEXED                                   IX1064.2
   000068         007100        RECORD KEY IS IX-FS1-KEY-11-13                            IX1064.2 151
   000069         007200        FILE STATUS IS FS1-STATUS-IX.                             IX1064.2 251
   000070         007300     SELECT  SQ-FS1                                               IX1064.2 179
   000071         007400     ASSIGN TO                                                    IX1064.2
   000072         007500     XXXXX014                                                     IX1064.2
   000073         007600        ACCESS MODE IS SEQUENTIAL                                 IX1064.2
   000074         007700        ORGANIZATION IS SEQUENTIAL                                IX1064.2
   000075         007800        FILE STATUS IS FS1-STATUS-SQ.                             IX1064.2 252
   000076         007900 DATA DIVISION.                                                   IX1064.2
   000077         008000 FILE SECTION.                                                    IX1064.2
   000078         008100                                                                  IX1064.2
   000079         008200 FD  RAW-DATA.                                                    IX1064.2
   000080         008300                                                                  IX1064.2
   000081         008400 01  RAW-DATA-SATZ.                                               IX1064.2
   000082         008500     05  RAW-DATA-KEY        PIC X(6).                            IX1064.2
   000083         008600     05  C-DATE              PIC 9(6).                            IX1064.2
   000084         008700     05  C-TIME              PIC 9(8).                            IX1064.2
   000085         008800     05  C-NO-OF-TESTS       PIC 99.                              IX1064.2
   000086         008900     05  C-OK                PIC 999.                             IX1064.2
   000087         009000     05  C-ALL               PIC 999.                             IX1064.2
   000088         009100     05  C-FAIL              PIC 999.                             IX1064.2
   000089         009200     05  C-DELETED           PIC 999.                             IX1064.2
   000090         009300     05  C-INSPECT           PIC 999.                             IX1064.2
   000091         009400     05  C-NOTE              PIC X(13).                           IX1064.2
   000092         009500     05  C-INDENT            PIC X.                               IX1064.2
   000093         009600     05  C-ABORT             PIC X(8).                            IX1064.2
   000094         009700 FD  PRINT-FILE.                                                  IX1064.2

 ==000094==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000095         009800 01  PRINT-REC PICTURE X(120).                                    IX1064.2
   000096         009900 01  DUMMY-RECORD PICTURE X(120).                                 IX1064.2
   000097         010000 FD  RL-FR1                                                       IX1064.2

 ==000097==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000098         010100     LABEL RECORDS ARE STANDARD                                   IX1064.2
   000099         010200     DATA RECORD IS RL-FR1R1-F-G-241                              IX1064.2 *
   000100         010300     RECORD CONTAINS 241 CHARACTERS.                              IX1064.2
   000101         010400 01  RL-FR1R1-F-G-241.                                            IX1064.2
   000102         010500     05 RL-FR1-REC-120           PICTURE X(120).                  IX1064.2
   000103         010600     05 RL-FR1-REC-121-241.                                       IX1064.2
   000104         010700        10 FILLER                PICTURE X(8).                    IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000105         010800        10 RL-REC-KEY-AREA.                                       IX1064.2
   000106         010900           15 RL-FR1-KEY.                                         IX1064.2
   000107         011000              20 RL-FR1-KEY-1-10.                                 IX1064.2
   000108         011100                 25 RL-FR1-KEY-1-5      PICTURE X(5).             IX1064.2
   000109         011200                 25 RL-FR1-KEY-6-10     PICTURE X(5).             IX1064.2
   000110         011300               20 RL-FR1-KEY-11-13      PICTURE 9(3).             IX1064.2
   000111         011400           15 RL-REDF-RECKEY REDEFINES RL-FR1-KEY.                IX1064.2 106
   000112         011500              20 R-RECKEY-1-7    PICTURE X(7).                    IX1064.2
   000113         011600              20 R-RECKEY-8-13   PICTURE X(6).                    IX1064.2
   000114         011700           15 FILLER             PICTURE X(16).                   IX1064.2
   000115         011800        10 FILLER                PICTURE X(9).                    IX1064.2
   000116         011900        10 RL-ALT-KEY1-AREA.                                      IX1064.2
   000117         012000           15 RL-FR1-ALTKEY1.                                     IX1064.2
   000118         012100              20 RL-FR1-ALTKEY1-1-10.                             IX1064.2
   000119         012200                 25 RL-FR1-ALTKEY1-1-5  PICTURE X(5).             IX1064.2
   000120         012300                 25 RL-FR1-ALTKEY1-6-10 PICTURE X(5).             IX1064.2
   000121         012400              20 RL-FR1-ALTKEY1-11-13   PICTURE X(3).             IX1064.2
   000122         012500              20 RL-FR1-ALTKEY1-14-20   PICTURE X(7).             IX1064.2
   000123         012600           15 RL-REDF-ALTKEY1 REDEFINES RL-FR1-ALTKEY1.           IX1064.2 117
   000124         012700              20 R-ALTKEY1-1-6   PICTURE X(6).                    IX1064.2
   000125         012800              20 R-ALTKEY1-7-10  PICTURE X(4).                    IX1064.2
   000126         012900              20 R-ALTKEY1-11-20 PICTURE X(10).                   IX1064.2
   000127         013000           15 FILLER             PICTURE X(9).                    IX1064.2
   000128         013100        10 FILLER                PICTURE X(9).                    IX1064.2
   000129         013200        10 RL-ALT-KEY2-AREA.                                      IX1064.2
   000130         013300           15 RL-FR1-ALTKEY2.                                     IX1064.2
   000131         013400              20 RL-FR1-ALTKEY2-1-10.                             IX1064.2
   000132         013500                 25 RL-FR1-ALTKEY2-1-5  PICTURE X(5).             IX1064.2
   000133         013600                 25 RL-FR1-ALTKEY2-6-10 PICTURE X(5).             IX1064.2
   000134         013700              20 RL-FR1-ALTKEY2-11-13   PICTURE X(3).             IX1064.2
   000135         013800              20 RL-FR1-ALTKEY2-14-20   PICTURE X(7).             IX1064.2
   000136         013900           15 FILLER             PICTURE X(9).                    IX1064.2
   000137         014000        10 FILLER                PICTURE X(8).                    IX1064.2
   000138         014100 FD  IX-FS1                                                       IX1064.2

 ==000138==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000139         014200     LABEL RECORDS ARE STANDARD                                   IX1064.2
   000140         014300     DATA RECORD IS IX-FS1R1-F-G-241                              IX1064.2 *
   000141         014400     RECORD CONTAINS 241 CHARACTERS.                              IX1064.2
   000142         014500 01  IX-FS1R1-F-G-241.                                            IX1064.2
   000143         014600     05 IX-FS1-REC-120           PICTURE X(120).                  IX1064.2
   000144         014700     05 IX-FS1-REC-121-241.                                       IX1064.2
   000145         014800        10 FILLER                PICTURE X(8).                    IX1064.2
   000146         014900        10 IX-REC-KEY-AREA.                                       IX1064.2
   000147         015000           15 IX-FS1-KEY.                                         IX1064.2
   000148         015100              20 IX-FS1-KEY-1-10.                                 IX1064.2
   000149         015200                 25 IX-FS1-KEY-1-5      PICTURE X(5).             IX1064.2
   000150         015300                 25 IX-FS1-KEY-6-10     PICTURE X(5).             IX1064.2
   000151         015400              20 IX-FS1-KEY-11-13      PICTURE X(3).              IX1064.2
   000152         015500           15 IX-REDF-RECKEY REDEFINES IX-FS1-KEY.                IX1064.2 147
   000153         015600              20 I-RECKEY-1-7    PICTURE X(7).                    IX1064.2
   000154         015700              20 I-RECKEY-8-13   PICTURE X(6).                    IX1064.2
   000155         015800           15 FILLER             PICTURE X(16).                   IX1064.2
   000156         015900        10 FILLER                PICTURE X(9).                    IX1064.2
   000157         016000        10 IX-ALT-KEY1-AREA.                                      IX1064.2
   000158         016100           15 IX-FS1-ALTKEY1.                                     IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000159         016200              20 IX-FS1-ALTKEY1-1-10.                             IX1064.2
   000160         016300                 25 IX-FS1-ALTKEY1-1-5  PICTURE X(5).             IX1064.2
   000161         016400                 25 IX-FS1-ALTKEY1-6-10 PICTURE X(5).             IX1064.2
   000162         016500              20 IX-FS1-ALTKEY1-11-13   PICTURE X(3).             IX1064.2
   000163         016600              20 IX-FS1-ALTKEY1-14-20   PICTURE X(7).             IX1064.2
   000164         016700           15 IX-REDF-ALTKEY1 REDEFINES IX-FS1-ALTKEY1.           IX1064.2 158
   000165         016800              20 I-ALTKEY1-1-6   PICTURE X(6).                    IX1064.2
   000166         016900              20 I-ALTKEY1-7-10  PICTURE X(4).                    IX1064.2
   000167         017000              20 I-ALTKEY1-11-20 PICTURE X(10).                   IX1064.2
   000168         017100           15 FILLER             PICTURE X(9).                    IX1064.2
   000169         017200        10 FILLER                PICTURE X(9).                    IX1064.2
   000170         017300        10 IX-ALT-KEY2-AREA.                                      IX1064.2
   000171         017400           15 IX-FS1-ALTKEY2.                                     IX1064.2
   000172         017500              20 IX-FS1-ALTKEY2-1-10.                             IX1064.2
   000173         017600                 25 IX-FR1-ALTKEY2-1-5  PICTURE X(5).             IX1064.2
   000174         017700                 25 IX-FR1-ALTKEY2-6-10 PICTURE X(5).             IX1064.2
   000175         017800              20 IX-FS1-ALTKEY2-11-13   PICTURE X(3).             IX1064.2
   000176         017900              20 IX-FS1-ALTKEY2-14-20   PICTURE X(7).             IX1064.2
   000177         018000           15 FILLER             PICTURE X(9).                    IX1064.2
   000178         018100        10 FILLER                PICTURE X(8).                    IX1064.2
   000179         018200 FD  SQ-FS1                                                       IX1064.2

 ==000179==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SQ-FS1".

   000180         018300     LABEL RECORDS ARE STANDARD                                   IX1064.2
   000181         018400     DATA RECORD IS SQ-FS1R1-F-G-241                              IX1064.2 *
   000182         018500     RECORD CONTAINS 241 CHARACTERS.                              IX1064.2
   000183         018600 01  SQ-FS1R1-F-G-241.                                            IX1064.2
   000184         018700     05 SQ-FS1-REC-120           PICTURE X(120).                  IX1064.2
   000185         018800     05 SQ-FS1-REC-121-241.                                       IX1064.2
   000186         018900        10 FILLER                PICTURE X(8).                    IX1064.2
   000187         019000        10 SQ-REC-KEY-AREA.                                       IX1064.2
   000188         019100           15 SQ-FS1-KEY.                                         IX1064.2
   000189         019200              20 SQ-FS1-KEY-1-10.                                 IX1064.2
   000190         019300                 25 SQ-FS1-KEY-1-5      PICTURE X(5).             IX1064.2
   000191         019400                 25 SQ-FS1-KEY-6-10     PICTURE X(5).             IX1064.2
   000192         019500               20 SQ-FS1-KEY-11-13      PICTURE 9(3).             IX1064.2
   000193         019600           15 SQ-REDF-RECKEY REDEFINES SQ-FS1-KEY.                IX1064.2 188
   000194         019700              20 S-RECKEY-1-7    PICTURE X(7).                    IX1064.2
   000195         019800              20 S-RECKEY-8-13   PICTURE X(6).                    IX1064.2
   000196         019900           15 FILLER             PICTURE X(16).                   IX1064.2
   000197         020000        10 FILLER                PICTURE X(9).                    IX1064.2
   000198         020100        10 SQ-ALT-KEY1-AREA.                                      IX1064.2
   000199         020200           15 SQ-FS1-ALTKEY1.                                     IX1064.2
   000200         020300              20 SQ-FS1-ALTKEY1-1-10.                             IX1064.2
   000201         020400                 25 SQ-FS1-ALTKEY1-1-5  PICTURE X(5).             IX1064.2
   000202         020500                 25 SQ-FS1-ALTKEY1-6-10 PICTURE X(5).             IX1064.2
   000203         020600              20 SQ-FS1-ALTKEY1-11-13   PICTURE X(3).             IX1064.2
   000204         020700              20 SQ-FS1-ALTKEY1-14-20   PICTURE X(7).             IX1064.2
   000205         020800           15 SQ-REDF-ALTKEY1 REDEFINES SQ-FS1-ALTKEY1.           IX1064.2 199
   000206         020900              20 S-ALTKEY1-1-6   PICTURE X(6).                    IX1064.2
   000207         021000              20 S-ALTKEY1-7-10  PICTURE X(4).                    IX1064.2
   000208         021100              20 S-ALTKEY1-11-20 PICTURE X(10).                   IX1064.2
   000209         021200           15 FILLER             PICTURE X(9).                    IX1064.2
   000210         021300        10 FILLER                PICTURE X(9).                    IX1064.2
   000211         021400        10 SQ-ALT-KEY2-AREA.                                      IX1064.2
   000212         021500           15 SQ-FS1-ALTKEY2.                                     IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000213         021600              20 SQ-FS1-ALTKEY2-1-10.                             IX1064.2
   000214         021700                 25 SQ-FS1-ALTKEY2-1-5  PICTURE X(5).             IX1064.2
   000215         021800                 25 SQ-FS1-ALTKEY2-6-10 PICTURE X(5).             IX1064.2
   000216         021900              20 SQ-FS1-ALTKEY2-11-13   PICTURE X(3).             IX1064.2
   000217         022000              20 SQ-FS1-ALTKEY2-14-20   PICTURE X(7).             IX1064.2
   000218         022100           15 FILLER             PICTURE X(9).                    IX1064.2
   000219         022200        10 FILLER                PICTURE X(8).                    IX1064.2
   000220         022300 WORKING-STORAGE SECTION.                                         IX1064.2
   000221         022400 01  WRK-DS-09V00-001 PIC S9(09)      USAGE COMP VALUE ZERO.      IX1064.2 IMP
   000222         022500 01  WRK-DS-09V00-002 PIC 9(3) VALUE ZERO.                        IX1064.2 IMP
   000223         022600 01  WRK-CS-09V00-002 PIC S9(09)       USAGE COMP VALUE ZERO.     IX1064.2 IMP
   000224         022700 01  WRK-CS-09V00-003 PIC S9(09)       USAGE COMP VALUE ZERO.     IX1064.2 IMP
   000225         022800 01  RL-KEY   PIC 9(3).                                           IX1064.2
   000226         022900 01  RL-KEY2  PIC 9(3).                                           IX1064.2
   000227         023000*                                                                 IX1064.2
   000228         023100 01  WRK-FR1-RECKEY.                                              IX1064.2
   000229         023200     05 FR1-RECKEY-1-13.                                          IX1064.2
   000230         023300        10 FR1-RECKEY-1-10       PICTURE X(10).                   IX1064.2
   000231         023400        10 FR1-RECKEY-11-13      PICTURE 9(3).                    IX1064.2
   000232         023500     05 FILLER                   PICTURE X(16)  VALUE SPACE.      IX1064.2 IMP
   000233         023600 01  WRK-FR1-ALTKEY1.                                             IX1064.2
   000234         023700      05 FR1-ALTKEY1-1-20.                                        IX1064.2
   000235         023800       10  FR1-ALTKEY1-1-10.                                      IX1064.2
   000236         023900        15 FR1-ALTKEY1-1-5       PICTURE X(5).                    IX1064.2
   000237         024000        15 FR1-ALTKEY1-6-10      PICTURE X(5).                    IX1064.2
   000238         024100       10 FR1-ALTKEY1-11-13      PICTURE 9(3).                    IX1064.2
   000239         024200       10 FR1-ALTKEY1-14-20      PICTURE X(7).                    IX1064.2
   000240         024300     05 FILLER                   PICTURE X(9)  VALUE SPACE.       IX1064.2 IMP
   000241         024400 01  WRK-FR1-ALTKEY2.                                             IX1064.2
   000242         024500     05 FR1-ALTKEY2-1-20.                                         IX1064.2
   000243         024600        10 FR1-ALTKEY2-1-10.                                      IX1064.2
   000244         024700           15 FR1-ALTKEY2-1-5    PICTURE X(5).                    IX1064.2
   000245         024800           15 FR1-ALTKEY2-6-10   PICTURE X(5).                    IX1064.2
   000246         024900        10 FR1-ALTKEY2-11-13     PICTURE 9(3).                    IX1064.2
   000247         025000        10 FR1-ALTKEY2-14-20     PICTURE X(7).                    IX1064.2
   000248         025100     05 FILLER                   PICTURE X(9) VALUE SPACE.        IX1064.2 IMP
   000249         025200 01  RECNO                       PICTURE 9(5)  VALUE ZERO.        IX1064.2 IMP
   000250         025300 01  FR1-STATUS                  PICTURE XX   VALUE SPACE.        IX1064.2 IMP
   000251         025400 01  FS1-STATUS-IX PIC XX VALUE SPACE.                            IX1064.2 IMP
   000252         025500 01  FS1-STATUS-SQ PIC XX VALUE SPACE.                            IX1064.2 IMP
   000253         025600 01  EXCUT-COUNTER-06V00         PICTURE 9(6) VALUE ZERO.         IX1064.2 IMP
   000254         025700 01  KEYSUB                      PICTURE 9(3) COMPUTATIONAL.      IX1064.2
   000255         025800 01  INVKEY-COUNTER-RL           PICTURE 9(3) COMPUTATIONAL.      IX1064.2
   000256         025900 01  INVKEY-COUNTER-IX           PICTURE 9(3) COMPUTATIONAL.      IX1064.2
   000257         026000 01  RECORDS-WRITTEN             PICTURE 9(3).                    IX1064.2
   000258         026100 01  RECKEY-NUM                  PICTURE 9(3).                    IX1064.2
   000259         026200 01  ALTKEY1-NUM                 PICTURE 9(3).                    IX1064.2
   000260         026300 01  ALTKEY2-NUM                 PICTURE 9(3).                    IX1064.2
   000261         026400 01  RECORD-KEY-CONTENT.                                          IX1064.2
   000262         026500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000263         026600          "BBBBBBBBBC225EEEEEEEEEF001ALTKEY1WWWWWWWWWV076ALTKEY2".IX1064.2
   000264         026700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000265         026800          "BBBBBBBBCC224EEEEEEEEFF002ALTKEY1WWWWWWWWVV077ALTKEY2".IX1064.2
   000266         026900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000267         027000          "BBBBBBBCCC223EEEEEEEFFF003ALTKEY1WWWWWWWVVV078ALTKEY2".IX1064.2
   000268         027100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000269         027200          "BBBBBBCCCC222EEEEEEFFFF004ALTKEY1WWWWWWVVVV079ALTKEY2".IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000270         027300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000271         027400          "BBBBBCCCCC221EEEEEFFFFF005ALTKEY1WWWWWVVVVV080ALTKEY2".IX1064.2
   000272         027500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000273         027600          "BBBBCCCCCC220EEEEFFFFFF006ALTKEY1WWWWVVVVVV081ALTKEY2".IX1064.2
   000274         027700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000275         027800          "BBBCCCCCCC219EEEFFFFFFF007ALTKEY1WWWVVVVVVV082ALTKEY2".IX1064.2
   000276         027900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000277         028000          "BBCCCCCCCC218EEFFFFFFFF008ALTKEY1WWVVVVVVVV083ALTKEY2".IX1064.2
   000278         028100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000279         028200          "BCCCCCCCCC217EFFFFFFFFF009ALTKEY1WVVVVVVVVV084ALTKEY2".IX1064.2
   000280         028300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000281         028400          "CCCCCCCCCC216FFFFFFFFFF010ALTKEY1VVVVVVVVVV085ALTKEY2".IX1064.2
   000282         028500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000283         028600          "CCCCCCCCCD215FFFFFFFFFG011ALTKEY1VVVVVVVVVV086ALTKEY2".IX1064.2
   000284         028700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000285         028800          "CCCCCCCCDD214FFFFFFFFGG012ALTKEY1VVVVVVVVUU087ALTKEY2".IX1064.2
   000286         028900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000287         029000          "CCCCCCCDDD213FFFFFFFGGG013ALTKEY1VVVVVVVUUU088ALTKEY2".IX1064.2
   000288         029100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000289         029200          "CCCCCCDDDD212FFFFFFGGGG014ALTKEY1VVVVVVUUUU089ALTKEY2".IX1064.2
   000290         029300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000291         029400          "CCCCCDDDDD211FFFFFGGGGG015ALTKEY1VVVVVUUUUU090ALTKEY2".IX1064.2
   000292         029500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000293         029600          "CCCCDDDDDD210FFFFGGGGGG016ALTKEY1VVVVUUUUUU091ALTKEY2".IX1064.2
   000294         029700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000295         029800          "CCCDDDDDDD209FFFGGGGGGG017ALTKEY1VVVUUUUUUU092ALTKEY2".IX1064.2
   000296         029900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000297         030000          "CCDDDDDDDD208FFGGGGGGGG018ALTKEY1VVUUUUUUUU093ALTKEY2".IX1064.2
   000298         030100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000299         030200          "CDDDDDDDDD207FGGGGGGGGG019ALTKEY1VUUUUUUUUU094ALTKEY2".IX1064.2
   000300         030300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000301         030400          "DDDDDDDDDD206GGGGGGGGGG020ALTKEY1UUUUUUUUUU095ALTKEY2".IX1064.2
   000302         030500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000303         030600          "DDDDDDDDDE205GGGGGGGGGH021ALTKEY1UUUUUUUUUU096ALTKEY2".IX1064.2
   000304         030700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000305         030800          "DDDDDDDDEE204GGGGGGGGHH022ALTKEY1UUUUUUUUTT097ALTKEY2".IX1064.2
   000306         030900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000307         031000          "DDDDDDDEEE203GGGGGGGHHH023ALTKEY1UUUUUUUTTT098ALTKEY2".IX1064.2
   000308         031100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000309         031200          "DDDDDDEEEE202GGGGGGHHHH024ALTKEY1UUUUUUTTTT099ALTKEY2".IX1064.2
   000310         031300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000311         031400          "DDDDDEEEEE201GGGGGHHHHH025ALTKEY1UUUUUTTTTT100ALTKEY2".IX1064.2
   000312         031500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000313         031600          "DDDDEEEEEE200GGGGHHHHHH026ALTKEY1UUUUTTTTTT101ALTKEY2".IX1064.2
   000314         031700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000315         031800          "DDDEEEEEEE199GGGHHHHHHH027ALTKEY1UUUTTTTTTT102ALTKEY2".IX1064.2
   000316         031900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000317         032000          "DDEEEEEEEE198GGHHHHHHHH028ALTKEY1UUTTTTTTTT103ALTKEY2".IX1064.2
   000318         032100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000319         032200          "DEEEEEEEEE197GHHHHHHHHH029ALTKEY1UTTTTTTTTT104ALTKEY2".IX1064.2
   000320         032300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000321         032400          "EEEEEEEEEE196HHHHHHHHHH030ALTKEY1TTTTTTTTTT105ALTKEY2".IX1064.2
   000322         032500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000323         032600          "EEEEEEEEEF195HHHHHHHHHI031ALTKEY1TTTTTTTTTT106ALTKEY2".IX1064.2
   000324         032700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000325         032800          "EEEEEEEEFF194HHHHHHHHII032ALTKEY1TTTTTTTTSS107ALTKEY2".IX1064.2
   000326         032900     05 FILLER PIC X(53) VALUE                                    IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000327         033000          "EEEEEEEFFF193HHHHHHHIII033ALTKEY1TTTTTTTSSS108ALTKEY2".IX1064.2
   000328         033100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000329         033200          "EEEEEEFFFF192HHHHHHIIII034ALTKEY1TTTTTTSSSS109ALTKEY2".IX1064.2
   000330         033300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000331         033400          "EEEEEFFFFF191HHHHHIIIII035ALTKEY1TTTTTSSSSS110ALTKEY2".IX1064.2
   000332         033500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000333         033600          "EEEEFFFFFF190HHHHIIIIII036ALTKEY1TTTTSSSSSS111ALTKEY2".IX1064.2
   000334         033700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000335         033800          "EEEFFFFFFF189HHHIIIIIII037ALTKEY1TTTSSSSSSS112ALTKEY2".IX1064.2
   000336         033900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000337         034000          "EEFFFFFFFF188HHIIIIIIII038ALTKEY1TTSSSSSSSS113ALTKEY2".IX1064.2
   000338         034100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000339         034200          "EFFFFFFFFF187HIIIIIIIII039ALTKEY1TSSSSSSSSS114ALTKEY2".IX1064.2
   000340         034300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000341         034400          "FFFFFFFFFF186IIIIIIIIII040ALTKEY1SSSSSSSSSS115ALTKEY2".IX1064.2
   000342         034500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000343         034600          "FFFFFFFFFG185IIIIIIIIIJ041ALTKEY1SSSSSSSSSS116ALTKEY2".IX1064.2
   000344         034700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000345         034800          "FFFFFFFFGG184IIIIIIIIJJ042ALTKEY1SSSSSSSSRR117ALTKEY2".IX1064.2
   000346         034900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000347         035000          "FFFFFFFGGG183IIIIIIIJJJ043ALTKEY1SSSSSSSRRR118ALTKEY2".IX1064.2
   000348         035100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000349         035200          "FFFFFFGGGG182IIIIIIJJJJ044ALTKEY1SSSSSSRRRR119ALTKEY2".IX1064.2
   000350         035300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000351         035400          "FFFFFGGGGG181IIIIIJJJJJ045ALTKEY1SSSSSRRRRR120ALTKEY2".IX1064.2
   000352         035500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000353         035600          "FFFFGGGGGG180IIIIJJJJJJ046ALTKEY1SSSSRRRRRR121ALTKEY2".IX1064.2
   000354         035700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000355         035800          "FFFGGGGGGG179IIIJJJJJJJ047ALTKEY1SSSRRRRRRR122ALTKEY2".IX1064.2
   000356         035900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000357         036000          "FFGGGGGGGG178IIJJJJJJJJ048ALTKEY1SSRRRRRRRR123ALTKEY2".IX1064.2
   000358         036100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000359         036200          "FGGGGGGGGG177IJJJJJJJJJ049ALTKEY1SRRRRRRRRR124ALTKEY2".IX1064.2
   000360         036300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000361         036400          "GGGGGGGGGG176JJJJJJJJJJ050ALTKEY1RRRRRRRRRR125ALTKEY2".IX1064.2
   000362         036500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000363         036600          "RRRRSSSSSS175VVVVWWWWWW051ALTKEY1GGGGFFFFFF126ALTKEY2".IX1064.2
   000364         036700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000365         036800          "RRRSSSSSSS174VVVWWWWWWW052ALTKEY1GGGFFFFFFF127ALTKEY2".IX1064.2
   000366         036900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000367         037000          "RRSSSSSSSS173VVWWWWWWWW053ALTKEY1GGFFFFFFFF128ALTKEY2".IX1064.2
   000368         037100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000369         037200          "RSSSSSSSSS172VWWWWWWWWW054ALTKEY1GFFFFFFFFF129ALTKEY2".IX1064.2
   000370         037300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000371         037400          "SSSSSSSSSS171WWWWWWWWWW055ALTKEY1FFFFFFFFFF130ALTKEY2".IX1064.2
   000372         037500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000373         037600          "SSSSSSSSST170WWWWWWWWWX056ALTKEY1FFFFFFFFFF131ALTKEY2".IX1064.2
   000374         037700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000375         037800          "SSSSSSSSTT169WWWWWWWWXX057ALTKEY1FFFFFFFFEE132ALTKEY2".IX1064.2
   000376         037900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000377         038000          "SSSSSSSTTT168WWWWWWWXXX058ALTKEY1FFFFFFFEEE133ALTKEY2".IX1064.2
   000378         038100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000379         038200          "SSSSSSTTTT167WWWWWWXXXX059ALTKEY1FFFFFFEEEE134ALTKEY2".IX1064.2
   000380         038300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000381         038400          "SSSSSTTTTT166WWWWWXXXXX060ALTKEY1FFFFFEEEEE135ALTKEY2".IX1064.2
   000382         038500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000383         038600          "SSSSTTTTTT165WWWWXXXXXX061ALTKEY1FFFFEEEEEE136ALTKEY2".IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000384         038700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000385         038800          "SSSTTTTTTT164WWWXXXXXXX062ALTKEY1FFFEEEEEEE137ALTKEY2".IX1064.2
   000386         038900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000387         039000          "SSTTTTTTTT163WWXXXXXXXX063ALTKEY1FFEEEEEEEE138ALTKEY2".IX1064.2
   000388         039100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000389         039200          "STTTTTTTTT162WXXXXXXXXX064ALTKEY1FEEEEEEEEE139ALTKEY2".IX1064.2
   000390         039300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000391         039400          "TTTTTTTTTT161XXXXXXXXXX065ALTKEY1EEEEEEEEEE140ALTKEY2".IX1064.2
   000392         039500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000393         039600          "TTTTTTTTTU160XXXXXXXXXY066ALTKEY1EEEEEEEEEE141ALTKEY2".IX1064.2
   000394         039700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000395         039800          "TTTTTTTTUU159XXXXXXXXYY067ALTKEY1EEEEEEEEDD142ALTKEY2".IX1064.2
   000396         039900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000397         040000          "TTTTTTTUUU158XXXXXXXYYY068ALTKEY1EEEEEEEDDD143ALTKEY2".IX1064.2
   000398         040100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000399         040200          "TTTTTTUUUU157XXXXXXYYYY069ALTKEY1EEEEEEDDDD144ALTKEY2".IX1064.2
   000400         040300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000401         040400          "TTTTTUUUUU156XXXXXYYYYY070ALTKEY1EEEEEDDDDD145ALTKEY2".IX1064.2
   000402         040500     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000403         040600          "TTTTUUUUUU155XXXXYYYYYY071ALTKEY1EEEEDDDDDD146ALTKEY2".IX1064.2
   000404         040700     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000405         040800          "TTTUUUUUUU154XXXYYYYYYY072ALTKEY1EEEDDDDDDD147ALTKEY2".IX1064.2
   000406         040900     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000407         041000          "TTUUUUUUUU153XXYYYYYYYY073ALTKEY1EEDDDDDDDD148ALTKEY2".IX1064.2
   000408         041100     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000409         041200          "TUUUUUUUUU152XYYYYYYYYY074ALTKEY1EDDDDDDDDD149ALTKEY2".IX1064.2
   000410         041300     05 FILLER PIC X(53) VALUE                                    IX1064.2
   000411         041400          "UUUUUUUUUU151YYYYYYYYYY075ALTKEY1DDDDDDDDDD150ALTKEY2".IX1064.2
   000412         041500 01  RECORD-KEY-DATA   REDEFINES  RECORD-KEY-CONTENT.             IX1064.2 261
   000413         041600     05 KEY-VALUES                  OCCURS 75  TIMES.             IX1064.2
   000414         041700       10 RECKEY-VALUE           PICTURE X(13).                   IX1064.2
   000415         041800       10 ALTKEY1-VALUE          PICTURE X(20).                   IX1064.2
   000416         041900       10 ALTKEY2-VALUE          PICTURE X(20).                   IX1064.2
   000417         042000 01  INIT-FLAG                   PICTURE 9.                       IX1064.2
   000418         042100 01  HOLD-FILESTATUS-RECORD.                                      IX1064.2
   000419         042200     05 FILESTATUS               PICTURE XX  OCCURS 10 TIMES.     IX1064.2
   000420         042300                                                                  IX1064.2
   000421         042400 01  FILE-RECORD-INFORMATION-REC.                                 IX1064.2
   000422         042500     03 FILE-RECORD-INFO-SKELETON.                                IX1064.2
   000423         042600        05 FILLER                 PICTURE X(48)       VALUE       IX1064.2
   000424         042700             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX1064.2
   000425         042800        05 FILLER                 PICTURE X(46)       VALUE       IX1064.2
   000426         042900             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX1064.2
   000427         043000        05 FILLER                 PICTURE X(26)       VALUE       IX1064.2
   000428         043100             ",LFIL=000000,ORG=  ,LBLR= ".                        IX1064.2
   000429         043200        05 FILLER                 PICTURE X(37)       VALUE       IX1064.2
   000430         043300             ",RECKEY=                             ".             IX1064.2
   000431         043400        05 FILLER                 PICTURE X(38)       VALUE       IX1064.2
   000432         043500             ",ALTKEY1=                             ".            IX1064.2
   000433         043600        05 FILLER                 PICTURE X(38)       VALUE       IX1064.2
   000434         043700             ",ALTKEY2=                             ".            IX1064.2
   000435         043800        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX1064.2 IMP
   000436         043900     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX1064.2
   000437         044000        05 FILE-RECORD-INFO-P1-120.                               IX1064.2
   000438         044100           07 FILLER              PIC X(5).                       IX1064.2
   000439         044200           07 XFILE-NAME           PIC X(6).                      IX1064.2
   000440         044300           07 FILLER              PIC X(8).                       IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000441         044400           07 XRECORD-NAME         PIC X(6).                      IX1064.2
   000442         044500           07 FILLER              PIC X(1).                       IX1064.2
   000443         044600           07 REELUNIT-NUMBER     PIC 9(1).                       IX1064.2
   000444         044700           07 FILLER              PIC X(7).                       IX1064.2
   000445         044800           07 XRECORD-NUMBER       PIC 9(6).                      IX1064.2
   000446         044900           07 FILLER              PIC X(6).                       IX1064.2
   000447         045000           07 UPDATE-NUMBER       PIC 9(2).                       IX1064.2
   000448         045100           07 FILLER              PIC X(5).                       IX1064.2
   000449         045200           07 ODO-NUMBER          PIC 9(4).                       IX1064.2
   000450         045300           07 FILLER              PIC X(5).                       IX1064.2
   000451         045400           07 XPROGRAM-NAME        PIC X(5).                      IX1064.2
   000452         045500           07 FILLER              PIC X(7).                       IX1064.2
   000453         045600           07 XRECORD-LENGTH       PIC 9(6).                      IX1064.2
   000454         045700           07 FILLER              PIC X(7).                       IX1064.2
   000455         045800           07 CHARS-OR-RECORDS    PIC X(2).                       IX1064.2
   000456         045900           07 FILLER              PIC X(1).                       IX1064.2
   000457         046000           07 XBLOCK-SIZE          PIC 9(4).                      IX1064.2
   000458         046100           07 FILLER              PIC X(6).                       IX1064.2
   000459         046200           07 RECORDS-IN-FILE     PIC 9(6).                       IX1064.2
   000460         046300           07 FILLER              PIC X(5).                       IX1064.2
   000461         046400           07 XFILE-ORGANIZATION   PIC X(2).                      IX1064.2
   000462         046500           07 FILLER              PIC X(6).                       IX1064.2
   000463         046600           07 XLABEL-TYPE          PIC X(1).                      IX1064.2
   000464         046700        05 FILE-RECORD-INFO-P121-240.                             IX1064.2
   000465         046800           07 FILLER              PIC X(8).                       IX1064.2
   000466         046900           07 XRECORD-KEY          PIC X(29).                     IX1064.2
   000467         047000           07 FILLER              PIC X(9).                       IX1064.2
   000468         047100           07 ALTERNATE-KEY1      PIC X(29).                      IX1064.2
   000469         047200           07 FILLER              PIC X(9).                       IX1064.2
   000470         047300           07 ALTERNATE-KEY2      PIC X(29).                      IX1064.2
   000471         047400           07 FILLER              PIC X(7).                       IX1064.2
   000472         047500                                                                  IX1064.2
   000473         047600 01  TEST-RESULTS.                                                IX1064.2
   000474         047700     02 FILLER                   PIC X      VALUE SPACE.          IX1064.2 IMP
   000475         047800     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX1064.2 IMP
   000476         047900     02 FILLER                   PIC X      VALUE SPACE.          IX1064.2 IMP
   000477         048000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX1064.2 IMP
   000478         048100     02 FILLER                   PIC X      VALUE SPACE.          IX1064.2 IMP
   000479         048200     02  PAR-NAME.                                                IX1064.2
   000480         048300       03 FILLER                 PIC X(19)  VALUE SPACE.          IX1064.2 IMP
   000481         048400       03  PARDOT-X              PIC X      VALUE SPACE.          IX1064.2 IMP
   000482         048500       03 DOTVALUE               PIC 99     VALUE ZERO.           IX1064.2 IMP
   000483         048600     02 FILLER                   PIC X(8)   VALUE SPACE.          IX1064.2 IMP
   000484         048700     02 RE-MARK                  PIC X(61).                       IX1064.2
   000485         048800 01  TEST-COMPUTED.                                               IX1064.2
   000486         048900     02 FILLER                   PIC X(30)  VALUE SPACE.          IX1064.2 IMP
   000487         049000     02 FILLER                   PIC X(17)  VALUE                 IX1064.2
   000488         049100            "       COMPUTED=".                                   IX1064.2
   000489         049200     02 COMPUTED-X.                                               IX1064.2
   000490         049300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX1064.2 IMP
   000491         049400     03 COMPUTED-N               REDEFINES COMPUTED-A             IX1064.2 490
   000492         049500                                 PIC -9(9).9(9).                  IX1064.2
   000493         049600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX1064.2 490
   000494         049700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX1064.2 490
   000495         049800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX1064.2 490
   000496         049900     03       CM-18V0 REDEFINES COMPUTED-A.                       IX1064.2 490
   000497         050000         04 COMPUTED-18V0                    PIC -9(18).          IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000498         050100         04 FILLER                           PIC X.               IX1064.2
   000499         050200     03 FILLER PIC X(50) VALUE SPACE.                             IX1064.2 IMP
   000500         050300 01  TEST-CORRECT.                                                IX1064.2
   000501         050400     02 FILLER PIC X(30) VALUE SPACE.                             IX1064.2 IMP
   000502         050500     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX1064.2
   000503         050600     02 CORRECT-X.                                                IX1064.2
   000504         050700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX1064.2 IMP
   000505         050800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX1064.2 504
   000506         050900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX1064.2 504
   000507         051000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX1064.2 504
   000508         051100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX1064.2 504
   000509         051200     03      CR-18V0 REDEFINES CORRECT-A.                         IX1064.2 504
   000510         051300         04 CORRECT-18V0                     PIC -9(18).          IX1064.2
   000511         051400         04 FILLER                           PIC X.               IX1064.2
   000512         051500     03 FILLER PIC X(2) VALUE SPACE.                              IX1064.2 IMP
   000513         051600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX1064.2 IMP
   000514         051700 01  CCVS-C-1.                                                    IX1064.2
   000515         051800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX1064.2
   000516         051900-    "SS  PARAGRAPH-NAME                                          IX1064.2
   000517         052000-    "       REMARKS".                                            IX1064.2
   000518         052100     02 FILLER                     PIC X(20)    VALUE SPACE.      IX1064.2 IMP
   000519         052200 01  CCVS-C-2.                                                    IX1064.2
   000520         052300     02 FILLER                     PIC X        VALUE SPACE.      IX1064.2 IMP
   000521         052400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX1064.2
   000522         052500     02 FILLER                     PIC X(15)    VALUE SPACE.      IX1064.2 IMP
   000523         052600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX1064.2
   000524         052700     02 FILLER                     PIC X(94)    VALUE SPACE.      IX1064.2 IMP
   000525         052800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX1064.2 IMP
   000526         052900 01  REC-CT                        PIC 99       VALUE ZERO.       IX1064.2 IMP
   000527         053000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX1064.2 IMP
   000528         053100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX1064.2 IMP
   000529         053200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX1064.2 IMP
   000530         053300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX1064.2 IMP
   000531         053400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX1064.2 IMP
   000532         053500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX1064.2 IMP
   000533         053600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX1064.2 IMP
   000534         053700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX1064.2 IMP
   000535         053800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX1064.2 IMP
   000536         053900 01  CCVS-H-1.                                                    IX1064.2
   000537         054000     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1064.2 IMP
   000538         054100     02  FILLER                    PIC X(42)    VALUE             IX1064.2
   000539         054200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX1064.2
   000540         054300     02  FILLER                    PIC X(39)    VALUE SPACES.     IX1064.2 IMP
   000541         054400 01  CCVS-H-2A.                                                   IX1064.2
   000542         054500   02  FILLER                        PIC X(40)  VALUE SPACE.      IX1064.2 IMP
   000543         054600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX1064.2
   000544         054700   02  FILLER                        PIC XXXX   VALUE             IX1064.2
   000545         054800     "4.2 ".                                                      IX1064.2
   000546         054900   02  FILLER                        PIC X(28)  VALUE             IX1064.2
   000547         055000            " COPY - NOT FOR DISTRIBUTION".                       IX1064.2
   000548         055100   02  FILLER                        PIC X(41)  VALUE SPACE.      IX1064.2 IMP
   000549         055200                                                                  IX1064.2
   000550         055300 01  CCVS-H-2B.                                                   IX1064.2
   000551         055400   02  FILLER                        PIC X(15)  VALUE             IX1064.2
   000552         055500            "TEST RESULT OF ".                                    IX1064.2
   000553         055600   02  TEST-ID                       PIC X(9).                    IX1064.2
   000554         055700   02  FILLER                        PIC X(4)   VALUE             IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000555         055800            " IN ".                                               IX1064.2
   000556         055900   02  FILLER                        PIC X(12)  VALUE             IX1064.2
   000557         056000     " HIGH       ".                                              IX1064.2
   000558         056100   02  FILLER                        PIC X(22)  VALUE             IX1064.2
   000559         056200            " LEVEL VALIDATION FOR ".                             IX1064.2
   000560         056300   02  FILLER                        PIC X(58)  VALUE             IX1064.2
   000561         056400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1064.2
   000562         056500 01  CCVS-H-3.                                                    IX1064.2
   000563         056600     02  FILLER                      PIC X(34)  VALUE             IX1064.2
   000564         056700            " FOR OFFICIAL USE ONLY    ".                         IX1064.2
   000565         056800     02  FILLER                      PIC X(58)  VALUE             IX1064.2
   000566         056900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX1064.2
   000567         057000     02  FILLER                      PIC X(28)  VALUE             IX1064.2
   000568         057100            "  COPYRIGHT   1985 ".                                IX1064.2
   000569         057200 01  CCVS-E-1.                                                    IX1064.2
   000570         057300     02 FILLER                       PIC X(52)  VALUE SPACE.      IX1064.2 IMP
   000571         057400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX1064.2
   000572         057500     02 ID-AGAIN                     PIC X(9).                    IX1064.2
   000573         057600     02 FILLER                       PIC X(45)  VALUE SPACES.     IX1064.2 IMP
   000574         057700 01  CCVS-E-2.                                                    IX1064.2
   000575         057800     02  FILLER                      PIC X(31)  VALUE SPACE.      IX1064.2 IMP
   000576         057900     02  FILLER                      PIC X(21)  VALUE SPACE.      IX1064.2 IMP
   000577         058000     02 CCVS-E-2-2.                                               IX1064.2
   000578         058100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX1064.2 IMP
   000579         058200         03 FILLER                   PIC X      VALUE SPACE.      IX1064.2 IMP
   000580         058300         03 ENDER-DESC               PIC X(44)  VALUE             IX1064.2
   000581         058400            "ERRORS ENCOUNTERED".                                 IX1064.2
   000582         058500 01  CCVS-E-3.                                                    IX1064.2
   000583         058600     02  FILLER                      PIC X(22)  VALUE             IX1064.2
   000584         058700            " FOR OFFICIAL USE ONLY".                             IX1064.2
   000585         058800     02  FILLER                      PIC X(12)  VALUE SPACE.      IX1064.2 IMP
   000586         058900     02  FILLER                      PIC X(58)  VALUE             IX1064.2
   000587         059000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX1064.2
   000588         059100     02  FILLER                      PIC X(13)  VALUE SPACE.      IX1064.2 IMP
   000589         059200     02 FILLER                       PIC X(15)  VALUE             IX1064.2
   000590         059300             " COPYRIGHT 1985".                                   IX1064.2
   000591         059400 01  CCVS-E-4.                                                    IX1064.2
   000592         059500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX1064.2 IMP
   000593         059600     02 FILLER                       PIC X(4)   VALUE " OF ".     IX1064.2
   000594         059700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX1064.2 IMP
   000595         059800     02 FILLER                       PIC X(40)  VALUE             IX1064.2
   000596         059900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX1064.2
   000597         060000 01  XXINFO.                                                      IX1064.2
   000598         060100     02 FILLER                       PIC X(19)  VALUE             IX1064.2
   000599         060200            "*** INFORMATION ***".                                IX1064.2
   000600         060300     02 INFO-TEXT.                                                IX1064.2
   000601         060400       04 FILLER                     PIC X(8)   VALUE SPACE.      IX1064.2 IMP
   000602         060500       04 XXCOMPUTED                 PIC X(20).                   IX1064.2
   000603         060600       04 FILLER                     PIC X(5)   VALUE SPACE.      IX1064.2 IMP
   000604         060700       04 XXCORRECT                  PIC X(20).                   IX1064.2
   000605         060800     02 INF-ANSI-REFERENCE           PIC X(48).                   IX1064.2
   000606         060900 01  HYPHEN-LINE.                                                 IX1064.2
   000607         061000     02 FILLER  PIC IS X VALUE IS SPACE.                          IX1064.2 IMP
   000608         061100     02 FILLER  PIC IS X(65)    VALUE IS "************************IX1064.2
   000609         061200-    "*****************************************".                 IX1064.2
   000610         061300     02 FILLER  PIC IS X(54)    VALUE IS "************************IX1064.2
   000611         061400-    "******************************".                            IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000612         061500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX1064.2
   000613         061600     "IX106A".                                                    IX1064.2
   000614         061700 PROCEDURE DIVISION.                                              IX1064.2
   000615         061800 CCVS1 SECTION.                                                   IX1064.2
   000616         061900 OPEN-FILES.                                                      IX1064.2
   000617         062000     OPEN I-O RAW-DATA.                                           IX1064.2 79
   000618         062100     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1064.2 612 82
   000619         062200     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX1064.2 79 625
   000620         062300     MOVE "ABORTED " TO C-ABORT.                                  IX1064.2 93
   000621         062400     ADD 1 TO C-NO-OF-TESTS.                                      IX1064.2 85
   000622         062500     ACCEPT C-DATE  FROM DATE.                                    IX1064.2 83
   000623         062600     ACCEPT C-TIME  FROM TIME.                                    IX1064.2 84
   000624         062700     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX1064.2 81 625
   000625         062800 END-E-1.                                                         IX1064.2
   000626         062900     CLOSE RAW-DATA.                                              IX1064.2 79
   000627         063000     OPEN    OUTPUT PRINT-FILE.                                   IX1064.2 94
   000628         063100     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX1064.2 612 553 612 572
   000629         063200     MOVE    SPACE TO TEST-RESULTS.                               IX1064.2 IMP 473
   000630         063300     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX1064.2 674 679
   000631         063400     MOVE    ZERO TO REC-SKL-SUB.                                 IX1064.2 IMP 525
   000632         063500     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX1064.2 633
   000633         063600 CCVS-INIT-FILE.                                                  IX1064.2
   000634         063700     ADD     1 TO REC-SKL-SUB.                                    IX1064.2 525
   000635         063800     MOVE    FILE-RECORD-INFO-SKELETON                            IX1064.2 422
   000636         063900          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX1064.2 436 525
   000637         064000 CCVS-INIT-EXIT.                                                  IX1064.2
   000638         064100     GO TO CCVS1-EXIT.                                            IX1064.2 761
   000639         064200 CLOSE-FILES.                                                     IX1064.2
   000640         064300     OPEN I-O RAW-DATA.                                           IX1064.2 79
   000641         064400     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX1064.2 612 82
   000642         064500     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX1064.2 79 650
   000643         064600     MOVE "OK.     " TO C-ABORT.                                  IX1064.2 93
   000644         064700     MOVE PASS-COUNTER TO C-OK.                                   IX1064.2 530 86
   000645         064800     MOVE ERROR-HOLD   TO C-ALL.                                  IX1064.2 532 87
   000646         064900     MOVE ERROR-COUNTER TO C-FAIL.                                IX1064.2 528 88
   000647         065000     MOVE DELETE-COUNTER TO C-DELETED.                            IX1064.2 527 89
   000648         065100     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX1064.2 529 90
   000649         065200     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX1064.2 81 650
   000650         065300 END-E-2.                                                         IX1064.2
   000651         065400     CLOSE RAW-DATA.                                              IX1064.2 79
   000652         065500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX1064.2 683 704 94
   000653         065600 TERMINATE-CCVS.                                                  IX1064.2
   000654         065700     EXIT PROGRAM.                                                IX1064.2
   000655         065800 TERMINATE-CALL.                                                  IX1064.2
   000656         065900     STOP     RUN.                                                IX1064.2
   000657         066000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX1064.2 477 529
   000658         066100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX1064.2 477 530
   000659         066200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX1064.2 477 528
   000660         066300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX1064.2 477 527
   000661         066400     MOVE "****TEST DELETED****" TO RE-MARK.                      IX1064.2 484
   000662         066500 PRINT-DETAIL.                                                    IX1064.2
   000663         066600     IF REC-CT NOT EQUAL TO ZERO                                  IX1064.2 526 IMP
   000664      1  066700             MOVE "." TO PARDOT-X                                 IX1064.2 481
   000665      1  066800             MOVE REC-CT TO DOTVALUE.                             IX1064.2 526 482
   000666         066900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX1064.2 473 95 716
   000667         067000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX1064.2 477 716
   000668      1  067100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX1064.2 737 751
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000669      1  067200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX1064.2 752 760
   000670         067300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX1064.2 IMP 477 IMP 489
   000671         067400     MOVE SPACE TO CORRECT-X.                                     IX1064.2 IMP 503
   000672         067500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX1064.2 526 IMP IMP 479
   000673         067600     MOVE     SPACE TO RE-MARK.                                   IX1064.2 IMP 484
   000674         067700 HEAD-ROUTINE.                                                    IX1064.2
   000675         067800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1064.2 536 96 716
   000676         067900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX1064.2 541 96 716
   000677         068000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1064.2 550 96 716
   000678         068100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX1064.2 562 96 716
   000679         068200 COLUMN-NAMES-ROUTINE.                                            IX1064.2
   000680         068300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1064.2 514 96 716
   000681         068400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1064.2 519 96 716
   000682         068500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX1064.2 606 96 716
   000683         068600 END-ROUTINE.                                                     IX1064.2
   000684         068700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX1064.2 606 96 716
   000685         068800 END-RTN-EXIT.                                                    IX1064.2
   000686         068900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1064.2 569 96 716
   000687         069000 END-ROUTINE-1.                                                   IX1064.2
   000688         069100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX1064.2 528 532 529
   000689         069200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX1064.2 532 527 532
   000690         069300      ADD PASS-COUNTER TO ERROR-HOLD.                             IX1064.2 530 532
   000691         069400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX1064.2
   000692         069500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX1064.2 530 592
   000693         069600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX1064.2 532 594
   000694         069700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX1064.2 591 577
   000695         069800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX1064.2 574 96 716
   000696         069900  END-ROUTINE-12.                                                 IX1064.2
   000697         070000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX1064.2 580
   000698         070100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX1064.2 528 IMP
   000699      1  070200         MOVE "NO " TO ERROR-TOTAL                                IX1064.2 578
   000700         070300         ELSE                                                     IX1064.2
   000701      1  070400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX1064.2 528 578
   000702         070500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX1064.2 574 96
   000703         070600     PERFORM WRITE-LINE.                                          IX1064.2 716
   000704         070700 END-ROUTINE-13.                                                  IX1064.2
   000705         070800     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX1064.2 527 IMP
   000706      1  070900         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX1064.2 578
   000707      1  071000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX1064.2 527 578
   000708         071100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX1064.2 580
   000709         071200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1064.2 574 96 716
   000710         071300      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX1064.2 529 IMP
   000711      1  071400          MOVE "NO " TO ERROR-TOTAL                               IX1064.2 578
   000712      1  071500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX1064.2 529 578
   000713         071600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX1064.2 580
   000714         071700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX1064.2 574 96 716
   000715         071800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX1064.2 582 96 716
   000716         071900 WRITE-LINE.                                                      IX1064.2
   000717         072000     ADD 1 TO RECORD-COUNT.                                       IX1064.2 534
   000718         072100     IF RECORD-COUNT GREATER 42                                   IX1064.2 534
   000719      1  072200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX1064.2 96 533
   000720      1  072300         MOVE SPACE TO DUMMY-RECORD                               IX1064.2 IMP 96
   000721      1  072400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX1064.2 96
   000722      1  072500         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1064.2 536 96 732
   000723      1  072600         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX1064.2 541 96 732
   000724      1  072700         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1064.2 550 96 732
   000725      1  072800         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX1064.2 562 96 732
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000726      1  072900         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX1064.2 514 96 732
   000727      1  073000         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX1064.2 519 96 732
   000728      1  073100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX1064.2 606 96 732
   000729      1  073200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX1064.2 533 96
   000730      1  073300         MOVE ZERO TO RECORD-COUNT.                               IX1064.2 IMP 534
   000731         073400     PERFORM WRT-LN.                                              IX1064.2 732
   000732         073500 WRT-LN.                                                          IX1064.2
   000733         073600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX1064.2 96
   000734         073700     MOVE SPACE TO DUMMY-RECORD.                                  IX1064.2 IMP 96
   000735         073800 BLANK-LINE-PRINT.                                                IX1064.2
   000736         073900     PERFORM WRT-LN.                                              IX1064.2 732
   000737         074000 FAIL-ROUTINE.                                                    IX1064.2
   000738         074100     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX1064.2 489 IMP
   000739      1  074200            GO TO   FAIL-ROUTINE-WRITE.                           IX1064.2 746
   000740         074300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX1064.2 503 IMP 746
   000741         074400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1064.2 535 605
   000742         074500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX1064.2 600
   000743         074600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1064.2 597 96 716
   000744         074700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1064.2 IMP 605
   000745         074800     GO TO  FAIL-ROUTINE-EX.                                      IX1064.2 751
   000746         074900 FAIL-ROUTINE-WRITE.                                              IX1064.2
   000747         075000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX1064.2 485 95 716
   000748         075100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX1064.2 535 513
   000749         075200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX1064.2 500 95 716
   000750         075300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX1064.2 IMP 513
   000751         075400 FAIL-ROUTINE-EX. EXIT.                                           IX1064.2
   000752         075500 BAIL-OUT.                                                        IX1064.2
   000753         075600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX1064.2 490 IMP 755
   000754         075700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX1064.2 504 IMP 760
   000755         075800 BAIL-OUT-WRITE.                                                  IX1064.2
   000756         075900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX1064.2 504 604 490 602
   000757         076000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX1064.2 535 605
   000758         076100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX1064.2 597 96 716
   000759         076200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX1064.2 IMP 605
   000760         076300 BAIL-OUT-EX. EXIT.                                               IX1064.2
   000761         076400 CCVS1-EXIT.                                                      IX1064.2
   000762         076500     EXIT.                                                        IX1064.2
   000763         076700 SECT-0001-RIS101 SECTION.                                        IX1064.2
   000764         076800*                                                                 IX1064.2
   000765         076900* THIS SECTION CREATES A RELATIVE FILE RANDOMLY.                  IX1064.2
   000766         077000*                                                                 IX1064.2
   000767         077100 WRITE-INT-GF-01.                                                 IX1064.2
   000768         077200     OPEN    OUTPUT RL-FR1.                                       IX1064.2 97
   000769         077300     MOVE    "RL-FR1" TO XFILE-NAME           (1).                IX1064.2 439
   000770         077400     MOVE    "R1-F-G" TO  XRECORD-NAME        (1).                IX1064.2 441
   000771         077500     MOVE    ZERO     TO  XRECORD-NUMBER      (1).                IX1064.2 IMP 445
   000772         077600     MOVE    "RC"     TO  CHARS-OR-RECORDS    (1).                IX1064.2 455
   000773         077700     MOVE    CCVS-PGM-ID TO  XPROGRAM-NAME    (1).                IX1064.2 612 451
   000774         077800     MOVE    241      TO  XRECORD-LENGTH      (1).                IX1064.2 453
   000775         077900     MOVE    001      TO  XBLOCK-SIZE         (1).                IX1064.2 457
   000776         078000     MOVE    "RL"     TO  XFILE-ORGANIZATION  (1).                IX1064.2 461
   000777         078100     MOVE    "S"      TO  XLABEL-TYPE         (1).                IX1064.2 463
   000778         078200     MOVE    225      TO  RECORDS-IN-FILE     (1).                IX1064.2 459
   000779         078300     MOVE    "WRITE RL-FR1   " TO FEATURE.                        IX1064.2 475
   000780         078400     MOVE    "WRITE-TEST-GF-01" TO PAR-NAME.                      IX1064.2 479
   000781         078500     MOVE    ZERO TO KEYSUB.                                      IX1064.2 IMP 254
   000782         078600     MOVE    ZERO TO INVKEY-COUNTER-RL.                           IX1064.2 IMP 255
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000783         078700 WRITE-INIT-GF-01-01.                                             IX1064.2
   000784         078800     PERFORM WRITE-TEST-GF-01-R1 75 TIMES.                        IX1064.2 786
   000785         078900     GO TO   WRITE-TEST-GF-01.                                    IX1064.2 833
   000786         079000 WRITE-TEST-GF-01-R1.                                             IX1064.2
   000787         079100*                                                                 IX1064.2
   000788         079200* WRITE-TEST-GF-01-R1 - WRITES THREE RECORDS FOR EACH PASS THRU . IX1064.2
   000789         079300*                      1) FOR THE FIRST RECORD CREATED RL-KEY IS  IX1064.2
   000790         079400*                         SET TO FR1-RECKEY-11-13 .               IX1064.2
   000791         079500*                      2) FOR THE SECOND RECORD CREATED RL-KEY IS IX1064.2
   000792         079600*                         SET TO FR1-ALTKEY1-11-13 .              IX1064.2
   000793         079700*                      3) FOR THE THIRD RECORD CREATED RL-KEY IS  IX1064.2
   000794         079800*                         SET TO FR1-ALTKEY2-11-13 .              IX1064.2
   000795         079900*                      THESE RECORD KEYS ARE IN THREE DIFFERENT   IX1064.2
   000796         080000*                      ORDERINGS.                                 IX1064.2
   000797         080100*                      1) FR1-RECKEY-11-13 ARE THE NUMBERS FROM   IX1064.2
   000798         080200*                         225 TO 151 DECENDING .                  IX1064.2
   000799         080300*                      2) FR1-ALTKEY1-11-13 ARE THE NUMBERS FROM  IX1064.2
   000800         080400*                         1 TO 75 ASCENDING .                     IX1064.2
   000801         080500*                      3) FR1-ALTKEY-11-13 ARE THE NUMBERS FROM   IX1064.2
   000802         080600*                         76 TO 151 ASCENDING .                   IX1064.2
   000803         080700*                                                                 IX1064.2
   000804         080800     ADD     001  TO XRECORD-NUMBER (1).                          IX1064.2 445
   000805         080900     ADD     001  TO  KEYSUB.                                     IX1064.2 254
   000806         081000     MOVE    RECKEY-VALUE (KEYSUB) TO FR1-RECKEY-1-13.            IX1064.2 414 254 229
   000807         081100     MOVE    ALTKEY1-VALUE (KEYSUB) TO FR1-ALTKEY1-1-20.          IX1064.2 415 254 234
   000808         081200     MOVE    ALTKEY2-VALUE (KEYSUB) TO FR1-ALTKEY2-1-20.          IX1064.2 416 254 242
   000809         081300     MOVE    WRK-FR1-RECKEY   TO    XRECORD-KEY (1).              IX1064.2 228 466
   000810         081400     MOVE    WRK-FR1-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX1064.2 233 468
   000811         081500     MOVE    WRK-FR1-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX1064.2 241 470
   000812         081600     MOVE    FILE-RECORD-INFO (1)  TO RL-FR1R1-F-G-241.           IX1064.2 436 101
   000813         081700     MOVE FR1-RECKEY-11-13 TO RL-KEY.                             IX1064.2 231 225
   000814         081800     WRITE   RL-FR1R1-F-G-241                                     IX1064.2 101
   000815      1  081900                        INVALID KEY ADD 001 TO INVKEY-COUNTER-RL. IX1064.2 255
   000816         082000     ADD     001 TO EXCUT-COUNTER-06V00.                          IX1064.2 253
   000817         082100     ADD     001 TO XRECORD-NUMBER (1).                           IX1064.2 445
   000818         082200     MOVE  FR1-ALTKEY1-11-13 TO FR1-RECKEY-11-13.                 IX1064.2 238 231
   000819         082300     MOVE WRK-FR1-RECKEY TO XRECORD-KEY (1).                      IX1064.2 228 466
   000820         082400     MOVE FR1-RECKEY-11-13 TO RL-KEY.                             IX1064.2 231 225
   000821         082500     MOVE FILE-RECORD-INFO (1) TO RL-FR1R1-F-G-241.               IX1064.2 436 101
   000822         082600     WRITE   RL-FR1R1-F-G-241                                     IX1064.2 101
   000823      1  082700                        INVALID KEY ADD 001 TO INVKEY-COUNTER-RL. IX1064.2 255
   000824         082800     ADD     001 TO EXCUT-COUNTER-06V00.                          IX1064.2 253
   000825         082900     ADD     001 TO XRECORD-NUMBER (1).                           IX1064.2 445
   000826         083000     MOVE  FR1-ALTKEY2-11-13 TO FR1-RECKEY-11-13.                 IX1064.2 246 231
   000827         083100     MOVE WRK-FR1-RECKEY TO XRECORD-KEY (1).                      IX1064.2 228 466
   000828         083200     MOVE FR1-RECKEY-11-13 TO RL-KEY.                             IX1064.2 231 225
   000829         083300     MOVE FILE-RECORD-INFO (1) TO RL-FR1R1-F-G-241.               IX1064.2 436 101
   000830         083400     WRITE   RL-FR1R1-F-G-241                                     IX1064.2 101
   000831      1  083500                        INVALID KEY ADD 001 TO INVKEY-COUNTER-RL. IX1064.2 255
   000832         083600     ADD      001 TO EXCUT-COUNTER-06V00.                         IX1064.2 253
   000833         083700 WRITE-TEST-GF-01.                                                IX1064.2
   000834         083800     SUBTRACT INVKEY-COUNTER-RL FROM EXCUT-COUNTER-06V00          IX1064.2 255 253
   000835         083900             GIVING RECORDS-WRITTEN.                              IX1064.2 257
   000836         084000 WRITE-TEST-CHECK.                                                IX1064.2
   000837         084100     MOVE    225  TO CORRECT-18V0.                                IX1064.2 510
   000838         084200     MOVE    RECORDS-WRITTEN TO COMPUTED-18V0.                    IX1064.2 257 497
   000839         084300     IF      RECORDS-WRITTEN EQUAL TO 225                         IX1064.2 257
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000840      1  084400             PERFORM  PASS                                        IX1064.2 658
   000841         084500             ELSE                                                 IX1064.2
   000842      1  084600             MOVE "VIII-37  4.9.2                    " TO RE-MARK IX1064.2 484
   000843      1  084700             PERFORM FAIL.                                        IX1064.2 659
   000844         084800     PERFORM PRINT-DETAIL.                                        IX1064.2 662
   000845         084900 WRITE-TEST-GF-01-END.                                            IX1064.2
   000846         085000     CLOSE   RL-FR1.                                              IX1064.2 97
   000847         085200 SECT-0002-RIS101 SECTION.                                        IX1064.2
   000848         085300*                                                                 IX1064.2
   000849         085400* THIS SECTION CREATES A SEQUENTIAL AND AN INDEXED FILE USING THE IX1064.2
   000850         085500* RELATIVE FILE CREATED IN THE PREVIOUS SECTION AS INPUT .        IX1064.2
   000851         085600*                                                                 IX1064.2
   000852         085700 WRITE-INIT-GF-02.                                                IX1064.2
   000853         085800     OPEN    OUTPUT IX-FS1 SQ-FS1.                                IX1064.2 138 179
   000854         085900     OPEN    INPUT RL-FR1.                                        IX1064.2 97
   000855         086000     MOVE    ZERO TO RL-KEY.                                      IX1064.2 IMP 225
   000856         086100     MOVE    ZERO TO INVKEY-COUNTER-RL.                           IX1064.2 IMP 255
   000857         086200     MOVE    ZERO TO INVKEY-COUNTER-IX.                           IX1064.2 IMP 256
   000858         086300     MOVE ZERO TO EXCUT-COUNTER-06V00.                            IX1064.2 IMP 253
   000859         086400     PERFORM WRITE-TEST-GF-02-01 75 TIMES.                        IX1064.2 869
   000860         086500     PERFORM WRITE-TEST-GF-02-02 75 TIMES.                        IX1064.2 899
   000861         086600     PERFORM WRITE-TEST-GF-02-03 75 TIMES.                        IX1064.2 925
   000862         086700     GO TO WRITE-TEST-GF-02-END.                                  IX1064.2 953
   000863         086800 WRITE-INT-GF-02-IX.                                              IX1064.2
   000864         086900     MOVE    "WRITE IX-FS1  " TO FEATURE.                         IX1064.2 475
   000865         087000     MOVE    "WRITE-TEST-GF-02" TO PAR-NAME.                      IX1064.2 479
   000866         087100 WRITE-INT-GF-02-SQ.                                              IX1064.2
   000867         087200     MOVE    "WRITE SQ-FS1  " TO FEATURE.                         IX1064.2 475
   000868         087300     MOVE    "WRITE-TEST-GF-02" TO PAR-NAME.                      IX1064.2 479
   000869         087400 WRITE-TEST-GF-02-01.                                             IX1064.2
   000870         087500*                                                                 IX1064.2
   000871         087600* WRITE-TEST-GF-02-01 - READS IN THE RELATIVE FILE IN SEQUENCE ,  IX1064.2
   000872         087700*                      MOVES RL-FR1-ALTKEY1-11-13 TO              IX1064.2
   000873         087800*                      RL-FR1-ALTKEY2-11-13 SO THAT ALL THE       IX1064.2
   000874         087900*                      KEYS ON THE RECORD ARE THE SAME , THEN     IX1064.2
   000875         088000*                      WRITES A SEQUENTIAL RECORD AND AN INDEXED  IX1064.2
   000876         088100*                      FILE RECORD .                              IX1064.2
   000877         088200*                                                                 IX1064.2
   000878         088300     ADD     001 TO RL-KEY.                                       IX1064.2 225
   000879         088400     READ RL-FR1                                                  IX1064.2 97
   000880      1  088500         INVALID KEY ADD 001 TO INVKEY-COUNTER-RL.                IX1064.2 255
   000881         088600     MOVE    RL-FR1-REC-120 TO FILE-RECORD-INFO-P1-120(1).        IX1064.2 102 437
   000882         088700     MOVE    RL-FR1-ALTKEY1-11-13 TO RL-FR1-ALTKEY2-11-13.        IX1064.2 121 134
   000883         088800     MOVE    RL-FR1R1-F-G-241 TO SQ-FS1R1-F-G-241.                IX1064.2 101 183
   000884         088900     MOVE    SQ-FS1R1-F-G-241 TO IX-FS1R1-F-G-241.                IX1064.2 183 142
   000885         089000     MOVE    "SQ-FS1" TO XFILE-NAME           (1).                IX1064.2 439
   000886         089100     MOVE    "SQ"     TO  XFILE-ORGANIZATION  (1).                IX1064.2 461
   000887         089200     MOVE    "WRITE SQ-FS1  " TO FEATURE.                         IX1064.2 475
   000888         089300     MOVE    "WRITE-TEST-GF-02" TO PAR-NAME.                      IX1064.2 479
   000889         089400     MOVE FILE-RECORD-INFO-P1-120(1) TO SQ-FS1-REC-120.           IX1064.2 437 184
   000890         089500     WRITE   SQ-FS1R1-F-G-241.                                    IX1064.2 183
   000891         089600     MOVE    "IX-FS1" TO XFILE-NAME           (1).                IX1064.2 439
   000892         089700     MOVE    "IX"     TO  XFILE-ORGANIZATION  (1).                IX1064.2 461
   000893         089800     MOVE    "WRITE IX-FS1  " TO FEATURE.                         IX1064.2 475
   000894         089900     MOVE    "WRITE-TEST-GF-02" TO PAR-NAME.                      IX1064.2 479
   000895         090000     MOVE FILE-RECORD-INFO-P1-120(1) TO IX-FS1-REC-120.           IX1064.2 437 143
   000896         090100     WRITE   IX-FS1R1-F-G-241                                     IX1064.2 142
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000897      1  090200         INVALID KEY ADD 001 TO INVKEY-COUNTER-IX.                IX1064.2 256
   000898         090300     ADD 001 TO EXCUT-COUNTER-06V00.                              IX1064.2 253
   000899         090400 WRITE-TEST-GF-02-02.                                             IX1064.2
   000900         090500*                                                                 IX1064.2
   000901         090600* WRITE-TEST-GF-02-02 - READS IN THE RELATIVE FILE IN SEQUENCE    IX1064.2
   000902         090700*                 STARTING AT NUMBER 76 WHERE WRITE-TEST-GF-02-01 IX1064.2
   000903         090800*                     LEFT OFF . MOVES RL-FR1-ALTKEY2-11-13 TO    IX1064.2
   000904         090900*                     RL-FR1-ALTKEY1-11-13 SO THAT ALL THE KEYS   IX1064.2
   000905         091000*                     IN THE RECORD ARE THE SAME . WRITES A       IX1064.2
   000906         091100*                     SEQUENTIAL AND AN INDEXED FILE RECORD .     IX1064.2
   000907         091200*                                                                 IX1064.2
   000908         091300     ADD     001 TO RL-KEY.                                       IX1064.2 225
   000909         091400     READ RL-FR1                                                  IX1064.2 97
   000910      1  091500         INVALID KEY ADD 001 TO INVKEY-COUNTER-RL.                IX1064.2 255
   000911         091600     MOVE    RL-FR1-REC-120 TO FILE-RECORD-INFO-P1-120(1).        IX1064.2 102 437
   000912         091700     MOVE    RL-FR1-ALTKEY2-11-13 TO RL-FR1-ALTKEY1-11-13.        IX1064.2 134 121
   000913         091800     MOVE    RL-FR1R1-F-G-241 TO SQ-FS1R1-F-G-241.                IX1064.2 101 183
   000914         091900     MOVE    SQ-FS1R1-F-G-241 TO IX-FS1R1-F-G-241.                IX1064.2 183 142
   000915         092000     MOVE    "SQ-FS1" TO XFILE-NAME           (1).                IX1064.2 439
   000916         092100     MOVE    "SQ"     TO  XFILE-ORGANIZATION  (1).                IX1064.2 461
   000917         092200     MOVE FILE-RECORD-INFO-P1-120(1) TO SQ-FS1-REC-120.           IX1064.2 437 184
   000918         092300     WRITE   SQ-FS1R1-F-G-241.                                    IX1064.2 183
   000919         092400     MOVE    "IX-FS1" TO XFILE-NAME           (1).                IX1064.2 439
   000920         092500     MOVE    "IX"     TO  XFILE-ORGANIZATION  (1).                IX1064.2 461
   000921         092600     MOVE FILE-RECORD-INFO-P1-120(1) TO IX-FS1-REC-120.           IX1064.2 437 143
   000922         092700     WRITE   IX-FS1R1-F-G-241                                     IX1064.2 142
   000923      1  092800         INVALID KEY ADD 001 TO INVKEY-COUNTER-IX.                IX1064.2 256
   000924         092900     ADD 001 TO EXCUT-COUNTER-06V00.                              IX1064.2 253
   000925         093000 WRITE-TEST-GF-02-03.                                             IX1064.2
   000926         093100*                                                                 IX1064.2
   000927         093200* WRITE-TEST-GF-02-03 - READS IN THE RELATIVE FILE IN SEQUENCE    IX1064.2
   000928         093300*                STARTING AT NUMBER 151 WHERE WRITE-TEST-GF-02-02 IX1064.2
   000929         093400*                    LEFT OFF . MOVES RL-FR1-KEY-11-13 TO         IX1064.2
   000930         093500*                    RL-FR1-ALTKEY1-11-13 AND RL-ALTKEY2-11-13    IX1064.2
   000931         093600*                    SO THAT ALL THE KEYS IN THE RECORD ARE       IX1064.2
   000932         093700*                    THE SAME . WRITES A SEQUENTIAL AND AN        IX1064.2
   000933         093800*                    INDEXED FILE RECORD .                        IX1064.2
   000934         093900*                                                                 IX1064.2
   000935         094000     ADD     001 TO RL-KEY.                                       IX1064.2 225
   000936         094100     READ RL-FR1                                                  IX1064.2 97
   000937      1  094200         INVALID KEY ADD 001 TO INVKEY-COUNTER-RL.                IX1064.2 255
   000938         094300     MOVE    RL-FR1-REC-120 TO FILE-RECORD-INFO-P1-120(1).        IX1064.2 102 437
   000939         094400     MOVE RL-FR1-KEY-11-13 TO RL-FR1-ALTKEY1-11-13.               IX1064.2 110 121
   000940         094500     MOVE    RL-FR1-ALTKEY1-11-13 TO RL-FR1-ALTKEY2-11-13.        IX1064.2 121 134
   000941         094600     MOVE    RL-FR1R1-F-G-241 TO SQ-FS1R1-F-G-241.                IX1064.2 101 183
   000942         094700     MOVE    SQ-FS1R1-F-G-241 TO IX-FS1R1-F-G-241.                IX1064.2 183 142
   000943         094800     MOVE    "SQ-FS1" TO XFILE-NAME           (1).                IX1064.2 439
   000944         094900     MOVE    "SQ"     TO  XFILE-ORGANIZATION  (1).                IX1064.2 461
   000945         095000     MOVE FILE-RECORD-INFO-P1-120(1) TO SQ-FS1-REC-120.           IX1064.2 437 184
   000946         095100     WRITE   SQ-FS1R1-F-G-241.                                    IX1064.2 183
   000947         095200     MOVE    "IX-FS1" TO XFILE-NAME           (1).                IX1064.2 439
   000948         095300     MOVE    "IX"     TO  XFILE-ORGANIZATION  (1).                IX1064.2 461
   000949         095400     MOVE FILE-RECORD-INFO-P1-120(1) TO IX-FS1-REC-120.           IX1064.2 437 143
   000950         095500     WRITE   IX-FS1R1-F-G-241                                     IX1064.2 142
   000951      1  095600         INVALID KEY ADD 001 TO INVKEY-COUNTER-IX.                IX1064.2 256
   000952         095700     ADD 001 TO EXCUT-COUNTER-06V00.                              IX1064.2 253
   000953         095800 WRITE-TEST-GF-02-END.                                            IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000954         095900     CLOSE RL-FR1.                                                IX1064.2 97
   000955         096000     CLOSE SQ-FS1.                                                IX1064.2 179
   000956         096100     CLOSE IX-FS1.                                                IX1064.2 138
   000957         096200     MOVE "READ RL-FR1  " TO FEATURE.                             IX1064.2 475
   000958         096300     MOVE "WRITE-TEST-GF-02" TO PAR-NAME.                         IX1064.2 479
   000959         096400     PERFORM WRITE-TEST-GF-01 THRU WRITE-TEST-CHECK.              IX1064.2 833 836
   000960         096500     SUBTRACT INVKEY-COUNTER-IX FROM EXCUT-COUNTER-06V00          IX1064.2 256 253
   000961         096600          GIVING RECORDS-WRITTEN.                                 IX1064.2 257
   000962         096700 WRITE-TEST-GF-02-2.                                              IX1064.2
   000963         096800     PERFORM WRITE-INT-GF-02-IX.                                  IX1064.2 863
   000964         096900     MOVE "WRITE-TEST-GF-02-2" TO PAR-NAME.                       IX1064.2 479
   000965         097000     PERFORM WRITE-TEST-CHECK.                                    IX1064.2 836
   000966         097100 WRITE-TEST-GF-02-3.                                              IX1064.2
   000967         097200     PERFORM WRITE-INT-GF-02-SQ.                                  IX1064.2 866
   000968         097300     MOVE "WRITE-TEST-GF-02-3" TO PAR-NAME.                       IX1064.2 479
   000969         097400     PERFORM WRITE-TEST-CHECK.                                    IX1064.2 836
   000970         097600 SECT-0003-RIS101 SECTION.                                        IX1064.2
   000971         097700*                                                                 IX1064.2
   000972         097800* THIS SECTION TESTS THE ABILITY TO HAVE ALL THREE DIFFERNT FILE  IX1064.2
   000973         097900* TYPES OPENED AND USED AT THE SAME TIME .                        IX1064.2
   000974         098000*                                                                 IX1064.2
   000975         098100 READ-TEST-F2-01-01.                                              IX1064.2
   000976         098200     MOVE ZEROES TO REC-CT.                                       IX1064.2 IMP 526
   000977         098300     OPEN INPUT RL-FR1.                                           IX1064.2 97
   000978         098400     OPEN INPUT IX-FS1.                                           IX1064.2 138
   000979         098500     OPEN INPUT SQ-FS1.                                           IX1064.2 179
   000980         098600     MOVE    "OPEN ALL - SEPARATE" TO FEATURE.                    IX1064.2 475
   000981         098700     MOVE    "READ-TEST-F2-01-02" TO PAR-NAME.                    IX1064.2 479
   000982         098800 READ-TEST-F2-01-02.                                              IX1064.2
   000983         098900*                                                                 IX1064.2
   000984         099000* READ-TEST-F2-01-02 - THIS TESTS THE ABILITY TO READ ALL THREE   IX1064.2
   000985         099100*                      TYPES OF FILES IN ANY ORDER WITH ALL OF THEIX1064.2
   000986         099200*                      FILES OPEN AT ONCE .                       IX1064.2
   000987         099300*                                                                 IX1064.2
   000988         099400     MOVE ZERO TO RL-KEY.                                         IX1064.2 IMP 225
   000989         099500     ADD 001 TO RL-KEY.                                           IX1064.2 225
   000990         099600     READ SQ-FS1 INTO IX-FS1R1-F-G-241 AT END GO TEST-FINISH-EXIT.IX1064.2 179 142 1219
   000991         099700     READ IX-FS1                                                  IX1064.2 138
   000992         099800         INVALID KEY                                              IX1064.2
   000993      1  099900         MOVE "1ST IX-FS1 READ - KEY SHOULD BE 001" TO RE-MARK    IX1064.2 484
   000994      1  100000         PERFORM FAIL                                             IX1064.2 659
   000995      1  100100         PERFORM PRINT-DETAIL                                     IX1064.2 662
   000996      1  100200         GO TO READ-TEST-F2-01-02-END.                            IX1064.2 1020
   000997         100300     READ RL-FR1                                                  IX1064.2 97
   000998         100400         INVALID KEY                                              IX1064.2
   000999      1  100500         MOVE "1ST RL-FS1 READ - KEY SHOULD BE 001" TO RE-MARK    IX1064.2 484
   001000      1  100600         PERFORM FAIL                                             IX1064.2 659
   001001      1  100700         PERFORM PRINT-DETAIL                                     IX1064.2 662
   001002      1  100800         GO TO READ-TEST-F2-01-02-END.                            IX1064.2 1020
   001003         100900     READ SQ-FS1 AT END GO TO TEST-FINISH-EXIT.                   IX1064.2 179 1219
   001004         101000     READ SQ-FS1 AT END GO TO TEST-FINISH-EXIT.                   IX1064.2 179 1219
   001005         101100     READ RL-FR1                                                  IX1064.2 97
   001006         101200         INVALID KEY                                              IX1064.2
   001007      1  101300         MOVE "2ND IX-FS1 READ - KEY SHOULD BE 001" TO RE-MARK    IX1064.2 484
   001008      1  101400         PERFORM FAIL                                             IX1064.2 659
   001009      1  101500         PERFORM PRINT-DETAIL                                     IX1064.2 662
   001010      1  101600         GO TO READ-TEST-F2-01-02-END.                            IX1064.2 1020
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001011         101700     READ IX-FS1                                                  IX1064.2 138
   001012         101800         INVALID KEY                                              IX1064.2
   001013      1  101900         MOVE "2ND RL-FR1 READ - KEY SHOULD BE 001" TO RE-MARK    IX1064.2 484
   001014      1  102000         PERFORM FAIL                                             IX1064.2 659
   001015      1  102100         PERFORM PRINT-DETAIL                                     IX1064.2 662
   001016      1  102200         GO TO READ-TEST-F2-01-02-END.                            IX1064.2 1020
   001017         102300     READ SQ-FS1 AT END GO TO TEST-FINISH-EXIT.                   IX1064.2 179 1219
   001018         102400     PERFORM PASS.                                                IX1064.2 658
   001019         102500     PERFORM PRINT-DETAIL.                                        IX1064.2 662
   001020         102600 READ-TEST-F2-01-02-END.                                          IX1064.2
   001021         102700     CLOSE RL-FR1.                                                IX1064.2 97
   001022         102800     CLOSE IX-FS1.                                                IX1064.2 138
   001023         102900     CLOSE SQ-FS1.                                                IX1064.2 179
   001024         103000 READ-INIT-F2-02.                                                 IX1064.2
   001025         103100     OPEN I-O IX-FS1 SQ-FS1 RL-FR1.                               IX1064.2 138 179 97
   001026         103200 READ-TEST-F2-02.                                                 IX1064.2
   001027         103300     READ SQ-FS1 AT END GO TO TEST-FINISH-EXIT.                   IX1064.2 179 1219
   001028         103400 READ-WRITE-F2-02.                                                IX1064.2
   001029         103500     CLOSE RL-FR1 IX-FS1 SQ-FS1.                                  IX1064.2 97 138 179
   001030         103600     MOVE    "R-I-S " TO XFILE-NAME           (1).                IX1064.2 439
   001031         103700     MOVE    ZERO     TO  XRECORD-NUMBER      (1).                IX1064.2 IMP 445
   001032         103800     MOVE    "AL"     TO  XFILE-ORGANIZATION  (1).                IX1064.2 461
   001033         103900     MOVE    "OPEN ALL 3 IN 1 LINE" TO FEATURE.                   IX1064.2 475
   001034         104000     MOVE    "READ-TEST-F2-02   " TO PAR-NAME.                    IX1064.2 479
   001035         104100     PERFORM PASS.                                                IX1064.2 658
   001036         104200     PERFORM PRINT-DETAIL.                                        IX1064.2 662
   001037         104400 SECT-0004-RIS101 SECTION.                                        IX1064.2
   001038         104500*                                                                 IX1064.2
   001039         104600* THIS SECTION TESTS THE ABILITY TO DELETE RECORDS FROM ONE FILE  IX1064.2
   001040         104700* TYPE WHILE HAVING THE OTHER FILES OPEN .                        IX1064.2
   001041         104800*                                                                 IX1064.2
   001042         104900 DELETE-TEST-GF-01.                                               IX1064.2
   001043         105000*                                                                 IX1064.2
   001044         105100* DELETE-TEST-GF-01-01 -IN THIS TEST RECORD NUMBER 121 IS DELETED IX1064.2
   001045         105200*                  THE RELATIVE FILE . THE FILE IS THEN CLOSED .  IX1064.2
   001046         105300*                   THE RELATIVE FILE IS THEN RE-OPENED AND       IX1064.2
   001047         105400*                   READ EXPECTING TO FIND 122 VALID RECORDS      IX1064.2
   001048         105500*                   AND AN INVALID KEY FOR WHAT USED TO BE        IX1064.2
   001049         105600*                   THE 122ND RECORD.  RL-FR1-RECKEY-11-13        IX1064.2
   001050         105700*                   IS CHECKED TO SEE IF RECORD 123 IS READ       IX1064.2
   001051         105800*                   AS IT SHOULD BE.                              IX1064.2
   001052         105900*                                                                 IX1064.2
   001053         106000     OPEN I-O IX-FS1 RL-FR1 SQ-FS1.                               IX1064.2 138 97 179
   001054         106100     MOVE    ZERO TO IX-FS1-KEY-11-13.                            IX1064.2 IMP 151
   001055         106200     MOVE    ZERO TO RL-KEY.                                      IX1064.2 IMP 225
   001056         106300     MOVE    ZERO TO INVKEY-COUNTER-RL.                           IX1064.2 IMP 255
   001057         106400     MOVE    ZERO TO INVKEY-COUNTER-IX.                           IX1064.2 IMP 256
   001058         106500     MOVE    121 TO IX-FS1-KEY-11-13.                             IX1064.2 151
   001059         106600     READ    IX-FS1                                               IX1064.2 138
   001060      1  106700         INVALID KEY ADD 001 TO INVKEY-COUNTER-IX.                IX1064.2 256
   001061         106800     ADD     121 TO RL-KEY.                                       IX1064.2 225
   001062         106900     MOVE    "R-I-S " TO XFILE-NAME           (1)                 IX1064.2 439
   001063         107000     MOVE    ZERO     TO  XRECORD-NUMBER      (1)                 IX1064.2 IMP 445
   001064         107100     MOVE    "RL"     TO  XFILE-ORGANIZATION  (1)                 IX1064.2 461
   001065         107200     MOVE    "DELETE RL RECORD" TO FEATURE                        IX1064.2 475
   001066         107300     MOVE    "DELETE-TEST-GF-01   " TO PAR-NAME                   IX1064.2 479
   001067         107400     DELETE RL-FR1                                                IX1064.2 97
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001068      1  107500         INVALID KEY PERFORM FAIL                                 IX1064.2 659
   001069      1  107600         PERFORM PRINT-DETAIL                                     IX1064.2 662
   001070      1  107700         GO TO DELETE-TEST-GF-01-END.                             IX1064.2 1088
   001071         107800     CLOSE RL-FR1.                                                IX1064.2 97
   001072         107900     OPEN INPUT RL-FR1.                                           IX1064.2 97
   001073         108000     MOVE ZERO TO RL-KEY.                                         IX1064.2 IMP 225
   001074         108100     PERFORM DELETE-TEST-GF-01-02-R2 122 TIMES.                   IX1064.2 1075
   001075         108200 DELETE-TEST-GF-01-02-R2.                                         IX1064.2
   001076         108300     ADD   1 TO RL-KEY.                                           IX1064.2 225
   001077         108400     READ RL-FR1 INVALID KEY                                      IX1064.2 97
   001078      1  108500           ADD 1 TO INVKEY-COUNTER-RL.                            IX1064.2 255
   001079         108600 DELETE-TEST-GF-01-02-CK.                                         IX1064.2
   001080         108700     IF RL-FR1-KEY-11-13 EQUAL TO 123                             IX1064.2 110
   001081      1  108800        ADD 1 TO INVKEY-COUNTER-RL.                               IX1064.2 255
   001082         108900        IF                                                        IX1064.2
   001083         109000           INVKEY-COUNTER-RL EQUAL TO 2                           IX1064.2 255
   001084      1  109100           PERFORM PASS ELSE                                      IX1064.2 658
   001085      1  109200           MOVE "VII-19 4.3.2                        " TO RE-MARK IX1064.2 484
   001086      1  109300           PERFORM FAIL.                                          IX1064.2 659
   001087         109400     PERFORM PRINT-DETAIL.                                        IX1064.2 662
   001088         109500 DELETE-TEST-GF-01-END.                                           IX1064.2
   001089         109600     CLOSE RL-FR1 IX-FS1 SQ-FS1.                                  IX1064.2 97 138 179
   001090         109800 SECT-TEST-005-RIS101 SECTION.                                    IX1064.2
   001091         109900*                                                                 IX1064.2
   001092         110000* THIS SECTION TESTS THE ABILITY TO REWRITE A FILE WHILE OTHER    IX1064.2
   001093         110100* FILES ARE BEING MANIPULATED .                                   IX1064.2
   001094         110200*                                                                 IX1064.2
   001095         110300 REWRITE-INIT-GF-01.                                              IX1064.2
   001096         110400     OPEN I-O SQ-FS1 IX-FS1 RL-FR1.                               IX1064.2 179 138 97
   001097         110500     MOVE ZEROES TO RL-KEY.                                       IX1064.2 IMP 225
   001098         110600     ADD 003 TO RL-KEY.                                           IX1064.2 225
   001099         110700     MOVE    ZERO TO INVKEY-COUNTER-RL.                           IX1064.2 IMP 255
   001100         110800     MOVE    ZERO TO INVKEY-COUNTER-IX.                           IX1064.2 IMP 256
   001101         110900 REWRITE-TEST-GF-01.                                              IX1064.2
   001102         111000*                                                                 IX1064.2
   001103         111100* REWRITE-TEST-GF-01:TESTS THE ABILITY TO REWRITE A RELATIVE FILE IX1064.2
   001104         111200*                    WHILE ALSO MANIPULATING DATA FROM AN INEXED  IX1064.2
   001105         111300*                    FILE .                                       IX1064.2
   001106         111400*                                                                 IX1064.2
   001107         111500 READ-INIT-RL.                                                    IX1064.2

 ==001107==> IGYPS2015-I The paragraph or section prior to paragraph or section "READ-INIT-RL" did
                         not contain any statements.

   001108         111600     READ RL-FR1                                                  IX1064.2 97
   001109         111700         INVALID KEY                                              IX1064.2
   001110      1  111800         MOVE    "READ RL RECORD" TO FEATURE                      IX1064.2 475
   001111      1  111900         MOVE    "READ-INIT-RL      " TO PAR-NAME                 IX1064.2 479
   001112      1  112000     PERFORM FAIL PERFORM PRINT-DETAIL GO REWRITE-TEST-005-END.   IX1064.2 659 662 1217
   001113         112100     MOVE RL-FR1-ALTKEY2-11-13 TO IX-FS1-KEY-11-13.               IX1064.2 134 151
   001114         112200 READ-INIT-IX.                                                    IX1064.2
   001115         112300     READ IX-FS1                                                  IX1064.2 138
   001116         112400         INVALID KEY                                              IX1064.2
   001117      1  112500         MOVE    "READ IX RECORD" TO FEATURE                      IX1064.2 475
   001118      1  112600         MOVE    "READ-INIT-IX.      " TO PAR-NAME                IX1064.2 479
   001119      1  112700     PERFORM FAIL PERFORM PRINT-DETAIL GO REWRITE-TEST-005-END.   IX1064.2 659 662 1217
   001120         112800     MOVE RL-FR1-ALTKEY2-11-13 TO IX-FS1-KEY-11-13.               IX1064.2 134 151
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001121         112900     MOVE IX-FS1R1-F-G-241 TO RL-FR1R1-F-G-241.                   IX1064.2 142 101
   001122         113000     REWRITE RL-FR1R1-F-G-241                                     IX1064.2 101
   001123         113100         INVALID KEY                                              IX1064.2
   001124      1  113200         MOVE    "REWRITE RL RECORD" TO FEATURE                   IX1064.2 475
   001125      1  113300         MOVE    "REWRITE-TEST-GF-01"    TO PAR-NAME              IX1064.2 479
   001126      1  113400     PERFORM FAIL PERFORM PRINT-DETAIL GO REWRITE-TEST-005-END.   IX1064.2 659 662 1217
   001127         113500 REWRITE-TEST-005-01-1.                                           IX1064.2
   001128         113600     READ RL-FR1                                                  IX1064.2 97
   001129         113700         INVALID KEY                                              IX1064.2
   001130      1  113800         MOVE    "READ RL RECORD" TO FEATURE                      IX1064.2 475
   001131      1  113900         MOVE    "REWRITE-TEST-005-01-1" TO PAR-NAME              IX1064.2 479
   001132      1  114000       PERFORM FAIL PERFORM PRINT-DETAIL GO REWRITE-TEST-005-END. IX1064.2 659 662 1217
   001133         114100 REWRITE-TEST-01.                                                 IX1064.2
   001134         114200     MOVE    "REWRITE RL RECORD" TO FEATURE                       IX1064.2 475
   001135         114300     MOVE    "REWRITE-TEST-GF-01"    TO PAR-NAME.                 IX1064.2 479
   001136         114400     IF RL-FR1-KEY-11-13 NOT EQUAL 78                             IX1064.2 110
   001137      1  114500         PERFORM FAIL                                             IX1064.2 659
   001138      1  114600         MOVE RL-FR1-KEY-11-13 TO COMPUTED-A                      IX1064.2 110 490
   001139      1  114700         MOVE "78" TO CORRECT-A                                   IX1064.2 504
   001140      1  114800         PERFORM PRINT-DETAIL                                     IX1064.2 662
   001141      1  114900         MOVE     RL-FR1-REC-120 TO DUMMY-RECORD                  IX1064.2 102 96
   001142      1  115000         PERFORM  WRITE-LINE                                      IX1064.2 716
   001143      1  115100         MOVE RL-FR1-REC-121-241 TO DUMMY-RECORD                  IX1064.2 103 96
   001144      1  115200         PERFORM WRITE-LINE                                       IX1064.2 716
   001145         115300     ELSE                                                         IX1064.2
   001146      1  115400         PERFORM PASS.                                            IX1064.2 658
   001147         115500     PERFORM PRINT-DETAIL.                                        IX1064.2 662
   001148         115700 REWRITE-TEST-GF-02.                                              IX1064.2
   001149         115800*                                                                 IX1064.2
   001150         115900* REWRITE-TEST-GF-02   TESTS THE ABILITY TO REWRITE A SEQUENTIAL  IX1064.2
   001151         116000*                      FILE WHILE WORKING WITH A RELATIVE ALSO .  IX1064.2
   001152         116100*                                                                 IX1064.2
   001153         116200     PERFORM READ-TEST-F2-02       9 TIMES.                       IX1064.2 1026
   001154         116300     MOVE 15 TO RL-KEY.                                           IX1064.2 225
   001155         116400     READ RL-FR1 INTO SQ-FS1R1-F-G-241                            IX1064.2 97 183
   001156         116500         INVALID KEY                                              IX1064.2
   001157      1  116600         MOVE "RL INTO SQ" TO FEATURE                             IX1064.2 475
   001158      1  116700         MOVE "REWRITE-TEST-GF-02I" TO PAR-NAME                   IX1064.2 479
   001159      1  116800         MOVE "VIII-26 4.5.2                         " TO RE-MARK IX1064.2 484
   001160      1  116900         PERFORM FAIL                                             IX1064.2 659
   001161      1  117000         PERFORM PRINT-DETAIL                                     IX1064.2 662
   001162      1  117100         GO TEST-FINISH-EXIT.                                     IX1064.2 1219
   001163         117200     MOVE "REWRITE-TEST-GF-02 " TO PAR-NAME.                      IX1064.2 479
   001164         117300     MOVE "REWRITE SQ" TO FEATURE.                                IX1064.2 475
   001165         117400     REWRITE SQ-FS1R1-F-G-241.                                    IX1064.2 183
   001166         117500     CLOSE SQ-FS1.                                                IX1064.2 179
   001167         117600     OPEN I-O SQ-FS1.                                             IX1064.2 179
   001168         117700     PERFORM READ-TEST-F2-02       9 TIMES.                       IX1064.2 1026
   001169         117800     IF SQ-FS1-ALTKEY2-11-13 EQUAL TO  "090"                      IX1064.2 216
   001170      1  117900         PERFORM PASS                                             IX1064.2 658
   001171         118000     ELSE                                                         IX1064.2
   001172      1  118100         PERFORM FAIL                                             IX1064.2 659
   001173      1  118200         MOVE "90" TO CORRECT-A                                   IX1064.2 504
   001174      1  118300         MOVE SQ-FS1-KEY-11-13 TO COMPUTED-A.                     IX1064.2 192 490
   001175         118400     PERFORM PRINT-DETAIL.                                        IX1064.2 662
   001176         118600 REWRITE-TEST-GF-03.                                              IX1064.2
   001177         118700*                                                                 IX1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001178         118800* REWRITE-TEST-GF-03  TESTS THE ABILITY TO REWRITE AN INDEXED FILEIX1064.2
   001179         118900*                      WHILE ALSO READING A RELATIVE FILE .       IX1064.2
   001180         119000*                                                                 IX1064.2
   001181         119100     MOVE 15 TO RL-KEY.                                           IX1064.2 225
   001182         119200     MOVE "077" TO IX-FS1-KEY-11-13.                              IX1064.2 151
   001183         119300     MOVE "REWRITE-TEST-GF-03 " TO PAR-NAME.                      IX1064.2 479
   001184         119400     MOVE "REWRITE IX" TO FEATURE.                                IX1064.2 475
   001185         119500     READ IX-FS1                                                  IX1064.2 138
   001186         119600         INVALID KEY                                              IX1064.2
   001187      1  119700         MOVE    "READ IX RECORD" TO FEATURE                      IX1064.2 475
   001188      1  119800       PERFORM FAIL PERFORM PRINT-DETAIL GO REWRITE-TEST-005-END. IX1064.2 659 662 1217
   001189         119900     READ RL-FR1                                                  IX1064.2 97
   001190         120000         INVALID KEY                                              IX1064.2
   001191      1  120100         MOVE "READ RL TO PASS TO IX" TO RE-MARK                  IX1064.2 484
   001192      1  120200         PERFORM FAIL                                             IX1064.2 659
   001193      1  120300         PERFORM PRINT-DETAIL                                     IX1064.2 662
   001194      1  120400         GO REWRITE-TEST-005-END.                                 IX1064.2 1217
   001195         120500     REWRITE IX-FS1R1-F-G-241 FROM RL-FR1R1-F-G-241               IX1064.2 142 101
   001196         120600         INVALID KEY                                              IX1064.2
   001197      1  120700         MOVE "REWRITE IX STATEMENT" TO RE-MARK                   IX1064.2 484
   001198      1  120800         PERFORM FAIL                                             IX1064.2 659
   001199      1  120900         PERFORM PRINT-DETAIL                                     IX1064.2 662
   001200      1  121000         GO TO REWRITE-TEST-005-END.                              IX1064.2 1217
   001201         121100     MOVE "015" TO IX-FS1-KEY-11-13.                              IX1064.2 151
   001202         121200     READ IX-FS1                                                  IX1064.2 138
   001203         121300         INVALID KEY                                              IX1064.2
   001204      1  121400         MOVE "RE-READ IX FOR CHECK" TO RE-MARK                   IX1064.2 484
   001205      1  121500         PERFORM FAIL                                             IX1064.2 659
   001206      1  121600         PERFORM PRINT-DETAIL                                     IX1064.2 662
   001207      1  121700         GO REWRITE-TEST-005-END.                                 IX1064.2 1217
   001208         121800     IF IX-FS1-ALTKEY2-11-13 EQUAL TO "090"                       IX1064.2 175
   001209      1  121900         PERFORM PASS                                             IX1064.2 658
   001210         122000     ELSE                                                         IX1064.2
   001211      1  122100         MOVE IX-FS1-REC-120 TO DUMMY-RECORD                      IX1064.2 143 96
   001212      1  122200         PERFORM WRITE-LINE                                       IX1064.2 716
   001213      1  122300         MOVE IX-FS1-REC-121-241 TO DUMMY-RECORD                  IX1064.2 144 96
   001214      1  122400         PERFORM WRITE-LINE                                       IX1064.2 716
   001215      1  122500         PERFORM FAIL.                                            IX1064.2 659
   001216         122600     PERFORM PRINT-DETAIL.                                        IX1064.2 662
   001217         122700 REWRITE-TEST-005-END.                                            IX1064.2
   001218         122800     CLOSE SQ-FS1 IX-FS1 RL-FR1.                                  IX1064.2 179 138 97
   001219         122900 TEST-FINISH-EXIT.                                                IX1064.2
   001220         123000     EXIT.                                                        IX1064.2
   001221         123100 CCVS-EXIT SECTION.                                               IX1064.2
   001222         123200 CCVS-999999.                                                     IX1064.2
   001223         123300     GO TO CLOSE-FILES.                                           IX1064.2 639
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    25
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      468   ALTERNATE-KEY1 . . . . . . . .  M810
      470   ALTERNATE-KEY2 . . . . . . . .  M811
      259   ALTKEY1-NUM
      415   ALTKEY1-VALUE. . . . . . . . .  807
      260   ALTKEY2-NUM
      416   ALTKEY2-VALUE. . . . . . . . .  808
      535   ANSI-REFERENCE . . . . . . . .  741 748 757
       93   C-ABORT. . . . . . . . . . . .  M620 M643
       87   C-ALL. . . . . . . . . . . . .  M645
       83   C-DATE . . . . . . . . . . . .  M622
       89   C-DELETED. . . . . . . . . . .  M647
       88   C-FAIL . . . . . . . . . . . .  M646
       92   C-INDENT
       90   C-INSPECT. . . . . . . . . . .  M648
       85   C-NO-OF-TESTS. . . . . . . . .  M621
       91   C-NOTE
       86   C-OK . . . . . . . . . . . . .  M644
       84   C-TIME . . . . . . . . . . . .  M623
      514   CCVS-C-1 . . . . . . . . . . .  680 726
      519   CCVS-C-2 . . . . . . . . . . .  681 727
      569   CCVS-E-1 . . . . . . . . . . .  686
      574   CCVS-E-2 . . . . . . . . . . .  695 702 709 714
      577   CCVS-E-2-2 . . . . . . . . . .  M694
      582   CCVS-E-3 . . . . . . . . . . .  715
      591   CCVS-E-4 . . . . . . . . . . .  694
      592   CCVS-E-4-1 . . . . . . . . . .  M692
      594   CCVS-E-4-2 . . . . . . . . . .  M693
      536   CCVS-H-1 . . . . . . . . . . .  675 722
      541   CCVS-H-2A. . . . . . . . . . .  676 723
      550   CCVS-H-2B. . . . . . . . . . .  677 724
      562   CCVS-H-3 . . . . . . . . . . .  678 725
      612   CCVS-PGM-ID. . . . . . . . . .  618 628 628 641 773
      455   CHARS-OR-RECORDS . . . . . . .  M772
      496   CM-18V0
      490   COMPUTED-A . . . . . . . . . .  491 493 494 495 496 753 756 M1138 M1174
      491   COMPUTED-N
      489   COMPUTED-X . . . . . . . . . .  M670 738
      493   COMPUTED-0V18
      495   COMPUTED-14V4
      497   COMPUTED-18V0. . . . . . . . .  M838
      494   COMPUTED-4V14
      513   COR-ANSI-REFERENCE . . . . . .  M748 M750
      504   CORRECT-A. . . . . . . . . . .  505 506 507 508 509 754 756 M1139 M1173
      505   CORRECT-N
      503   CORRECT-X. . . . . . . . . . .  M671 740
      506   CORRECT-0V18
      508   CORRECT-14V4
      510   CORRECT-18V0 . . . . . . . . .  M837
      507   CORRECT-4V14
      509   CR-18V0
      527   DELETE-COUNTER . . . . . . . .  647 M660 689 705 707
      482   DOTVALUE . . . . . . . . . . .  M665
      533   DUMMY-HOLD . . . . . . . . . .  M719 729
       96   DUMMY-RECORD . . . . . . . . .  M675 M676 M677 M678 M680 M681 M682 M684 M686 M695 M702 M709 M714 M715 719 M720
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    26
0 Defined   Cross-reference of data names   References

0                                           721 M722 M723 M724 M725 M726 M727 M728 M729 733 M734 M743 M758 M1141 M1143 M1211
                                            M1213
      580   ENDER-DESC . . . . . . . . . .  M697 M708 M713
      528   ERROR-COUNTER. . . . . . . . .  646 M659 688 698 701
      532   ERROR-HOLD . . . . . . . . . .  645 M688 M689 M689 M690 693
      578   ERROR-TOTAL. . . . . . . . . .  M699 M701 M706 M707 M711 M712
      253   EXCUT-COUNTER-06V00. . . . . .  M816 M824 M832 834 M858 M898 M924 M952 960
      475   FEATURE. . . . . . . . . . . .  M779 M864 M867 M887 M893 M957 M980 M1033 M1065 M1110 M1117 M1124 M1130 M1134
                                            M1157 M1164 M1184 M1187
      436   FILE-RECORD-INFO . . . . . . .  M636 812 821 829
      437   FILE-RECORD-INFO-P1-120. . . .  M881 889 895 M911 917 921 M938 945 949
      464   FILE-RECORD-INFO-P121-240
      422   FILE-RECORD-INFO-SKELETON. . .  635
      421   FILE-RECORD-INFORMATION-REC
      419   FILESTATUS
      235   FR1-ALTKEY1-1-10
      234   FR1-ALTKEY1-1-20 . . . . . . .  M807
      236   FR1-ALTKEY1-1-5
      238   FR1-ALTKEY1-11-13. . . . . . .  818
      239   FR1-ALTKEY1-14-20
      237   FR1-ALTKEY1-6-10
      243   FR1-ALTKEY2-1-10
      242   FR1-ALTKEY2-1-20 . . . . . . .  M808
      244   FR1-ALTKEY2-1-5
      246   FR1-ALTKEY2-11-13. . . . . . .  826
      247   FR1-ALTKEY2-14-20
      245   FR1-ALTKEY2-6-10
      230   FR1-RECKEY-1-10
      229   FR1-RECKEY-1-13. . . . . . . .  M806
      231   FR1-RECKEY-11-13 . . . . . . .  813 M818 820 M826 828
      250   FR1-STATUS . . . . . . . . . .  61
      251   FS1-STATUS-IX. . . . . . . . .  69
      252   FS1-STATUS-SQ. . . . . . . . .  75
      418   HOLD-FILESTATUS-RECORD
      606   HYPHEN-LINE. . . . . . . . . .  682 684 728
      165   I-ALTKEY1-1-6
      167   I-ALTKEY1-11-20
      166   I-ALTKEY1-7-10
      153   I-RECKEY-1-7
      154   I-RECKEY-8-13
      572   ID-AGAIN . . . . . . . . . . .  M628
      605   INF-ANSI-REFERENCE . . . . . .  M741 M744 M757 M759
      600   INFO-TEXT. . . . . . . . . . .  M742
      417   INIT-FLAG
      529   INSPECT-COUNTER. . . . . . . .  648 M657 688 710 712
      256   INVKEY-COUNTER-IX. . . . . . .  M857 M897 M923 M951 960 M1057 M1060 M1100
      255   INVKEY-COUNTER-RL. . . . . . .  M782 M815 M823 M831 834 M856 M880 M910 M937 M1056 M1078 M1081 1083 M1099
      157   IX-ALT-KEY1-AREA
      170   IX-ALT-KEY2-AREA
      173   IX-FR1-ALTKEY2-1-5
      174   IX-FR1-ALTKEY2-6-10
      138   IX-FS1 . . . . . . . . . . . .  62 853 956 978 991 1011 1022 1025 1029 1053 1059 1089 1096 1115 1185 1202 1218
      158   IX-FS1-ALTKEY1 . . . . . . . .  164
      159   IX-FS1-ALTKEY1-1-10
      160   IX-FS1-ALTKEY1-1-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    27
0 Defined   Cross-reference of data names   References

0     162   IX-FS1-ALTKEY1-11-13
      163   IX-FS1-ALTKEY1-14-20
      161   IX-FS1-ALTKEY1-6-10
      171   IX-FS1-ALTKEY2
      172   IX-FS1-ALTKEY2-1-10
      175   IX-FS1-ALTKEY2-11-13 . . . . .  1208
      176   IX-FS1-ALTKEY2-14-20
      147   IX-FS1-KEY . . . . . . . . . .  152
      148   IX-FS1-KEY-1-10
      149   IX-FS1-KEY-1-5
      151   IX-FS1-KEY-11-13 . . . . . . .  68 M1054 M1058 M1113 M1120 M1182 M1201
      150   IX-FS1-KEY-6-10
      143   IX-FS1-REC-120 . . . . . . . .  M895 M921 M949 1211
      144   IX-FS1-REC-121-241 . . . . . .  1213
      142   IX-FS1R1-F-G-241 . . . . . . .  M884 896 M914 922 M942 950 M990 1121 M1195
      146   IX-REC-KEY-AREA
      164   IX-REDF-ALTKEY1
      152   IX-REDF-RECKEY
      413   KEY-VALUES
      254   KEYSUB . . . . . . . . . . . .  M781 M805 806 807 808
      449   ODO-NUMBER
      477   P-OR-F . . . . . . . . . . . .  M657 M658 M659 M660 667 M670
      479   PAR-NAME . . . . . . . . . . .  M672 M780 M865 M868 M888 M894 M958 M964 M968 M981 M1034 M1066 M1111 M1118 M1125
                                            M1131 M1135 M1158 M1163 M1183
      481   PARDOT-X . . . . . . . . . . .  M664
      530   PASS-COUNTER . . . . . . . . .  644 M658 690 692
       94   PRINT-FILE . . . . . . . . . .  53 627 652
       95   PRINT-REC. . . . . . . . . . .  M666 M747 M749
      124   R-ALTKEY1-1-6
      126   R-ALTKEY1-11-20
      125   R-ALTKEY1-7-10
      112   R-RECKEY-1-7
      113   R-RECKEY-8-13
       79   RAW-DATA . . . . . . . . . . .  48 617 619 626 640 642 651
       82   RAW-DATA-KEY . . . . . . . . .  52 M618 M641
       81   RAW-DATA-SATZ. . . . . . . . .  624 649
      484   RE-MARK. . . . . . . . . . . .  M661 M673 M842 M993 M999 M1007 M1013 M1085 M1159 M1191 M1197 M1204
      526   REC-CT . . . . . . . . . . . .  663 665 672 M976
      525   REC-SKL-SUB. . . . . . . . . .  M631 M634 636
      258   RECKEY-NUM
      414   RECKEY-VALUE . . . . . . . . .  806
      249   RECNO
      534   RECORD-COUNT . . . . . . . . .  M717 718 M730
      261   RECORD-KEY-CONTENT . . . . . .  412
      412   RECORD-KEY-DATA
      459   RECORDS-IN-FILE. . . . . . . .  M778
      257   RECORDS-WRITTEN. . . . . . . .  M835 838 839 M961
      443   REELUNIT-NUMBER
      116   RL-ALT-KEY1-AREA
      129   RL-ALT-KEY2-AREA
       97   RL-FR1 . . . . . . . . . . . .  55 768 846 854 879 909 936 954 977 997 1005 1021 1025 1029 1053 M1067 1071 1072
                                            1077 1089 1096 1108 1128 1155 1189 1218
      117   RL-FR1-ALTKEY1 . . . . . . . .  123
      118   RL-FR1-ALTKEY1-1-10
      119   RL-FR1-ALTKEY1-1-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    28
0 Defined   Cross-reference of data names   References

0     121   RL-FR1-ALTKEY1-11-13 . . . . .  882 M912 M939 940
      122   RL-FR1-ALTKEY1-14-20
      120   RL-FR1-ALTKEY1-6-10
      130   RL-FR1-ALTKEY2
      131   RL-FR1-ALTKEY2-1-10
      132   RL-FR1-ALTKEY2-1-5
      134   RL-FR1-ALTKEY2-11-13 . . . . .  M882 912 M940 1113 1120
      135   RL-FR1-ALTKEY2-14-20
      133   RL-FR1-ALTKEY2-6-10
      106   RL-FR1-KEY . . . . . . . . . .  111
      107   RL-FR1-KEY-1-10
      108   RL-FR1-KEY-1-5
      110   RL-FR1-KEY-11-13 . . . . . . .  939 1080 1136 1138
      109   RL-FR1-KEY-6-10
      102   RL-FR1-REC-120 . . . . . . . .  881 911 938 1141
      103   RL-FR1-REC-121-241 . . . . . .  1143
      101   RL-FR1R1-F-G-241 . . . . . . .  M812 814 M821 822 M829 830 883 913 941 M1121 1122 1195
      225   RL-KEY . . . . . . . . . . . .  59 M813 M820 M828 M855 M878 M908 M935 M988 M989 M1055 M1061 M1073 M1076 M1097
                                            M1098 M1154 M1181
      226   RL-KEY2
      105   RL-REC-KEY-AREA
      123   RL-REDF-ALTKEY1
      111   RL-REDF-RECKEY
      206   S-ALTKEY1-1-6
      208   S-ALTKEY1-11-20
      207   S-ALTKEY1-7-10
      194   S-RECKEY-1-7
      195   S-RECKEY-8-13
      198   SQ-ALT-KEY1-AREA
      211   SQ-ALT-KEY2-AREA
      179   SQ-FS1 . . . . . . . . . . . .  70 853 955 979 990 1003 1004 1017 1023 1025 1027 1029 1053 1089 1096 1166 1167
                                            1218
      199   SQ-FS1-ALTKEY1 . . . . . . . .  205
      200   SQ-FS1-ALTKEY1-1-10
      201   SQ-FS1-ALTKEY1-1-5
      203   SQ-FS1-ALTKEY1-11-13
      204   SQ-FS1-ALTKEY1-14-20
      202   SQ-FS1-ALTKEY1-6-10
      212   SQ-FS1-ALTKEY2
      213   SQ-FS1-ALTKEY2-1-10
      214   SQ-FS1-ALTKEY2-1-5
      216   SQ-FS1-ALTKEY2-11-13 . . . . .  1169
      217   SQ-FS1-ALTKEY2-14-20
      215   SQ-FS1-ALTKEY2-6-10
      188   SQ-FS1-KEY . . . . . . . . . .  193
      189   SQ-FS1-KEY-1-10
      190   SQ-FS1-KEY-1-5
      192   SQ-FS1-KEY-11-13 . . . . . . .  1174
      191   SQ-FS1-KEY-6-10
      184   SQ-FS1-REC-120 . . . . . . . .  M889 M917 M945
      185   SQ-FS1-REC-121-241
      183   SQ-FS1R1-F-G-241 . . . . . . .  M883 884 890 M913 914 918 M941 942 946 M1155 1165
      187   SQ-REC-KEY-AREA
      205   SQ-REDF-ALTKEY1
      193   SQ-REDF-RECKEY
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    29
0 Defined   Cross-reference of data names   References

0     485   TEST-COMPUTED. . . . . . . . .  747
      500   TEST-CORRECT . . . . . . . . .  749
      553   TEST-ID. . . . . . . . . . . .  M628
      473   TEST-RESULTS . . . . . . . . .  M629 666
      531   TOTAL-ERROR
      447   UPDATE-NUMBER
      223   WRK-CS-09V00-002
      224   WRK-CS-09V00-003
      221   WRK-DS-09V00-001
      222   WRK-DS-09V00-002
      233   WRK-FR1-ALTKEY1. . . . . . . .  810
      241   WRK-FR1-ALTKEY2. . . . . . . .  811
      228   WRK-FR1-RECKEY . . . . . . . .  809 819 827
      457   XBLOCK-SIZE. . . . . . . . . .  M775
      439   XFILE-NAME . . . . . . . . . .  M769 M885 M891 M915 M919 M943 M947 M1030 M1062
      461   XFILE-ORGANIZATION . . . . . .  M776 M886 M892 M916 M920 M944 M948 M1032 M1064
      463   XLABEL-TYPE. . . . . . . . . .  M777
      451   XPROGRAM-NAME. . . . . . . . .  M773
      466   XRECORD-KEY. . . . . . . . . .  M809 M819 M827
      453   XRECORD-LENGTH . . . . . . . .  M774
      441   XRECORD-NAME . . . . . . . . .  M770
      445   XRECORD-NUMBER . . . . . . . .  M771 M804 M817 M825 M1031 M1063
      602   XXCOMPUTED . . . . . . . . . .  M756
      604   XXCORRECT. . . . . . . . . . .  M756
      597   XXINFO . . . . . . . . . . . .  743 758
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    30
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

      752   BAIL-OUT . . . . . . . . . . .  P669
      760   BAIL-OUT-EX. . . . . . . . . .  E669 G754
      755   BAIL-OUT-WRITE . . . . . . . .  G753
      735   BLANK-LINE-PRINT
     1221   CCVS-EXIT
      637   CCVS-INIT-EXIT
      633   CCVS-INIT-FILE . . . . . . . .  P632
     1222   CCVS-999999
      615   CCVS1
      761   CCVS1-EXIT . . . . . . . . . .  G638
      639   CLOSE-FILES. . . . . . . . . .  G1223
      679   COLUMN-NAMES-ROUTINE . . . . .  E630
      660   DE-LETE
     1042   DELETE-TEST-GF-01
     1088   DELETE-TEST-GF-01-END. . . . .  G1070
     1079   DELETE-TEST-GF-01-02-CK
     1075   DELETE-TEST-GF-01-02-R2. . . .  P1074
      625   END-E-1. . . . . . . . . . . .  G619 G624
      650   END-E-2. . . . . . . . . . . .  G642 G649
      683   END-ROUTINE. . . . . . . . . .  P652
      687   END-ROUTINE-1
      696   END-ROUTINE-12
      704   END-ROUTINE-13 . . . . . . . .  E652
      685   END-RTN-EXIT
      659   FAIL . . . . . . . . . . . . .  P843 P994 P1000 P1008 P1014 P1068 P1086 P1112 P1119 P1126 P1132 P1137 P1160 P1172
                                            P1188 P1192 P1198 P1205 P1215
      737   FAIL-ROUTINE . . . . . . . . .  P668
      751   FAIL-ROUTINE-EX. . . . . . . .  E668 G745
      746   FAIL-ROUTINE-WRITE . . . . . .  G739 G740
      674   HEAD-ROUTINE . . . . . . . . .  P630
      657   INSPT
      616   OPEN-FILES
      658   PASS . . . . . . . . . . . . .  P840 P1018 P1035 P1084 P1146 P1170 P1209
      662   PRINT-DETAIL . . . . . . . . .  P844 P995 P1001 P1009 P1015 P1019 P1036 P1069 P1087 P1112 P1119 P1126 P1132 P1140
                                            P1147 P1161 P1175 P1188 P1193 P1199 P1206 P1216
     1024   READ-INIT-F2-02
     1114   READ-INIT-IX
     1107   READ-INIT-RL
      975   READ-TEST-F2-01-01
      982   READ-TEST-F2-01-02
     1020   READ-TEST-F2-01-02-END . . . .  G996 G1002 G1010 G1016
     1026   READ-TEST-F2-02. . . . . . . .  P1153 P1168
     1028   READ-WRITE-F2-02
     1095   REWRITE-INIT-GF-01
     1101   REWRITE-TEST-GF-01
     1148   REWRITE-TEST-GF-02
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    31
0 Defined   Cross-reference of procedures   References

0    1176   REWRITE-TEST-GF-03
     1217   REWRITE-TEST-005-END . . . . .  G1112 G1119 G1126 G1132 G1188 G1194 G1200 G1207
     1127   REWRITE-TEST-005-01-1
     1133   REWRITE-TEST-01
     1090   SECT-TEST-005-RIS101
      763   SECT-0001-RIS101
      847   SECT-0002-RIS101
      970   SECT-0003-RIS101
     1037   SECT-0004-RIS101
      655   TERMINATE-CALL
      653   TERMINATE-CCVS
     1219   TEST-FINISH-EXIT . . . . . . .  G990 G1003 G1004 G1017 G1027 G1162
      783   WRITE-INIT-GF-01-01
      852   WRITE-INIT-GF-02
      767   WRITE-INT-GF-01
      863   WRITE-INT-GF-02-IX . . . . . .  P963
      866   WRITE-INT-GF-02-SQ . . . . . .  P967
      716   WRITE-LINE . . . . . . . . . .  P666 P667 P675 P676 P677 P678 P680 P681 P682 P684 P686 P695 P703 P709 P714 P715
                                            P743 P747 P749 P758 P1142 P1144 P1212 P1214
      836   WRITE-TEST-CHECK . . . . . . .  E959 P965 P969
      833   WRITE-TEST-GF-01 . . . . . . .  G785 P959
      845   WRITE-TEST-GF-01-END
      786   WRITE-TEST-GF-01-R1. . . . . .  P784
      953   WRITE-TEST-GF-02-END . . . . .  G862
      869   WRITE-TEST-GF-02-01. . . . . .  P859
      899   WRITE-TEST-GF-02-02. . . . . .  P860
      925   WRITE-TEST-GF-02-03. . . . . .  P861
      962   WRITE-TEST-GF-02-2
      966   WRITE-TEST-GF-02-3
      732   WRT-LN . . . . . . . . . . . .  P722 P723 P724 P725 P726 P727 P728 P731 P736
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    32
0 Defined   Cross-reference of programs     References

        3   IX106A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX106A    Date 06/04/2022  Time 12:00:21   Page    33
0LineID  Message code  Message text

     65  IGYDS1298-I   Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX044" was treated as comments.

     94  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     97  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

                       Same message on line:    138

    179  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SQ-FS1".

   1107  IGYPS2015-I   The paragraph or section prior to paragraph or section "READ-INIT-RL" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       6           6
-* Statistics for COBOL program IX106A:
 *    Source records = 1223
 *    Data Division statements = 232
 *    Procedure Division statements = 488
 *    Generated COBOL statements = 0
 *    Program complexity factor = 495
0End of compilation 1,  program IX106A,  highest severity 0.
0Return code 0
