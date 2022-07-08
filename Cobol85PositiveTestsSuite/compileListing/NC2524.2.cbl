1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:32   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:32   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2524.2
   000002         000200 PROGRAM-ID.                                                      NC2524.2
   000003         000300     NC252A.                                                      NC2524.2
   000004         000500*                                                              *  NC2524.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2524.2
   000006         000700*                                                              *  NC2524.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2524.2
   000008         000900*                                                              *  NC2524.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2524.2
   000010         001100*                                                              *  NC2524.2
   000011         001300*                                                              *  NC2524.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2524.2
   000013         001500*                                                              *  NC2524.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2524.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2524.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2524.2
   000017         001900*                                                              *  NC2524.2
   000018         002100*                                                              *  NC2524.2
   000019         002200*    THIS PROGRAM TESTS THE "REDEFINES" AND "RENAMES" CLAUSES. *  NC2524.2
   000020         002300*                                                              *  NC2524.2
   000021         002500 ENVIRONMENT DIVISION.                                            NC2524.2
   000022         002600 CONFIGURATION SECTION.                                           NC2524.2
   000023         002700 SOURCE-COMPUTER.                                                 NC2524.2
   000024         002800     XXXXX082.                                                    NC2524.2
   000025         002900 OBJECT-COMPUTER.                                                 NC2524.2
   000026         003000     XXXXX083.                                                    NC2524.2
   000027         003100 INPUT-OUTPUT SECTION.                                            NC2524.2
   000028         003200 FILE-CONTROL.                                                    NC2524.2
   000029         003300     SELECT PRINT-FILE ASSIGN TO                                  NC2524.2 33
   000030         003400     XXXXX055.                                                    NC2524.2
   000031         003500 DATA DIVISION.                                                   NC2524.2
   000032         003600 FILE SECTION.                                                    NC2524.2
   000033         003700 FD  PRINT-FILE.                                                  NC2524.2

 ==000033==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000034         003800 01  PRINT-REC PICTURE X(120).                                    NC2524.2
   000035         003900 01  DUMMY-RECORD PICTURE X(120).                                 NC2524.2
   000036         004000 WORKING-STORAGE SECTION.                                         NC2524.2
   000037         004100 01  WS-REMAINDERS.                                               NC2524.2
   000038         004200   03  WS-REM                    PIC 99 OCCURS 20.                NC2524.2
   000039         004300 01  WRK-XN-00001-1              PIC X.                           NC2524.2
   000040         004400 01  WRK-XN-00001-2              PIC X.                           NC2524.2
   000041         004500 01  WS-46.                                                       NC2524.2
   000042         004600   03  WS-1-20                   PIC X(20).                       NC2524.2
   000043         004700   03  WS-21-40                  PIC X(20).                       NC2524.2
   000044         004800   03  WS-41-46                  PIC X(6).                        NC2524.2
   000045         004900 77  11A                PICTURE 9999  VALUE 9.                    NC2524.2
   000046         005000 77  11B   PICTURE 99; VALUE 8.                                   NC2524.2
   000047         005100 77  1111C PICTURE 99 VALUE 9.                                    NC2524.2
   000048         005200 77  WRK-DS-02V00                 PICTURE S99.                    NC2524.2
   000049         005300     88 TEST-2NUC-COND-99         VALUE 99.                       NC2524.2
   000050         005400 77  A99-DS-02V00                 PICTURE S99    VALUE 99.        NC2524.2
   000051         005500 77  WRK-DS-18V00                 PICTURE S9(18).                 NC2524.2
   000052         005600 77  A18ONES-DS-18V00             PICTURE S9(18)                  NC2524.2
   000053         005700                                  VALUE 111111111111111111.       NC2524.2
   000054         005800 77  A18TWOS-DS-18V00             PICTURE S9(18)                  NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900                                  VALUE 222222222222222222.       NC2524.2
   000056         006000 77  WRK-DS-05V00                 PICTURE S9(5).                  NC2524.2
   000057         006100 77  A02TWOS-DU-02V00             PICTURE 99     VALUE 22.        NC2524.2
   000058         006200 77  A02TWOS-DS-03V02             PICTURE S999V99 VALUE +022.00.  NC2524.2
   000059         006300 77  ATWO-DS-01V00                PICTURE S9     VALUE 2.         NC2524.2
   000060         006400 77  AZERO-DS-05V05               PICTURE S9(5)V9(5) VALUE ZERO.  NC2524.2 IMP
   000061         006500 77  WRK-DS-06V06                 PICTURE S9(6)V9(6).             NC2524.2
   000062         006600 77  WRK-DS-0201P                 PICTURE S99P.                   NC2524.2
   000063         006700 77  A05ONES-DS-05V00             PICTURE S9(5)  VALUE 11111.     NC2524.2
   000064         006800 77  WRK-DS-09V00                 PICTURE S9(9).                  NC2524.2
   000065         006900 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC2524.2
   000066         007000 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09                        NC2524.2 65
   000067         007100                                  PICTURE S9(18).                 NC2524.2
   000068         007200 77  XRAY                    PICTURE IS X.                        NC2524.2
   000069         007300 77  W-1                     PICTURE IS 9.                        NC2524.2
   000070         007400 77  W-2                     PICTURE IS 99.                       NC2524.2
   000071         007500 77  W-3                     PICTURE IS 999.                      NC2524.2
   000072         007600 77  W-5                PICTURE 99  VALUE ZERO.                   NC2524.2 IMP
   000073         007700 77  W-9                     PICTURE 999.                         NC2524.2
   000074         007800 77  W-11               PICTURE S99V9.                            NC2524.2
   000075         007900 77  D-1                PICTURE S9V99  VALUE 1.06.                NC2524.2
   000076         008000 77  D-7                PICTURE S99V99  VALUE 1.09.               NC2524.2
   000077         008100 77  ONE                     PICTURE IS 9      VALUE IS 1.        NC2524.2
   000078         008200 77  TWO                     PICTURE IS S9     VALUE IS 2.        NC2524.2
   000079         008300 77  THREE                   PICTURE IS S9     VALUE IS 3.        NC2524.2
   000080         008400 77  FOUR                    PICTURE IS S9     VALUE IS 4.        NC2524.2
   000081         008500 77  FIVE                    PICTURE IS S9     VALUE IS 5.        NC2524.2
   000082         008600 77  SIX                     PICTURE IS S9     VALUE IS 6.        NC2524.2
   000083         008700 77  SEVEN                   PICTURE IS S9     VALUE IS 7.        NC2524.2
   000084         008800 77  EIGHT                   PICTURE IS 9      VALUE IS 8.        NC2524.2
   000085         008900 77  NINE                    PICTURE IS S9     VALUE IS 9.        NC2524.2
   000086         009000 77  TEN                     PICTURE IS S99    VALUE IS 10.       NC2524.2
   000087         009100 77  FIFTEEN                 PICTURE IS S99    VALUE IS 15.       NC2524.2
   000088         009200 77  TWENTY                  PICTURE IS S99    VALUE IS 20.       NC2524.2
   000089         009300 77  TWENTY-5                PICTURE IS S99    VALUE IS 25.       NC2524.2
   000090         009400    1 COMPUTE-DATA.                                               NC2524.2
   000091         009500                                                                02NC2524.2
   000092         009600     COMPUTE-1                    PICTURE 999V9999  VALUE ZERO.   NC2524.2 IMP
   000093         009700     2 COMPUTE-1A            PICTURE 9(3)V9(4) VALUE 654.1873.    NC2524.2
   000094         009800     2 COMPUTE-2             PICTURE 9999V9    VALUE ZERO.        NC2524.2 IMP
   000095         009900     02 COMPUTE-3            PICTURE 999V99    VALUE ZERO.        NC2524.2 IMP
   000096         010000     2 COMPUTE-3A            PICTURE 999V99    VALUE 86.14.       NC2524.2
   000097         010100     2 COMPUTE-3B            PICTURE 999V99    VALUE 33.75.       NC2524.2
   000098         010200     2 COMPUTE-4             PICTURE 999       VALUE ZERO.        NC2524.2 IMP
   000099         010300     2 COMPUTE-4A            PICTURE 999       VALUE 124.         NC2524.2
   000100         010400     2 COMPUTE-4B            PICTURE 999       VALUE 217.         NC2524.2
   000101         010500     2 COMPUTE-5             PICTURE 9999V99   VALUE ZERO.        NC2524.2 IMP
   000102         010600     02 COMPUTE-5A           PICTURE 999V9     VALUE 11.1.        NC2524.2
   000103         010700     2 COMPUTE-6             PICTURE 999V9     VALUE ZERO.        NC2524.2 IMP
   000104         010800     2 COMPUTE-6A            PICTURE 999V9     VALUE 374.4.       NC2524.2
   000105         010900     2 COMPUTE-7             PICTURE 999       VALUE ZERO.        NC2524.2 IMP
   000106         011000     2 COMPUTE-8             PICTURE 999       VALUE ZERO.        NC2524.2 IMP
   000107         011100     02 COMPUTE-9            PICTURE 9999      VALUE ZERO.        NC2524.2 IMP
   000108         011200     2 COMPUTE-10            PICTURE 999V9999  VALUE ZERO.        NC2524.2 IMP
   000109         011300     2 COMPUTE-11            PICTURE 999V9     VALUE ZERO.        NC2524.2 IMP
   000110         011400     2 COMPUTE-11A           PICTURE 999V9     VALUE 371.2.       NC2524.2
   000111         011500     2 COMPUTE-11B           PICTURE 999V9     VALUE 468.9.       NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     2 COMPUTE-12            PICTURE 99V99     VALUE ZERO.        NC2524.2 IMP
   000113         011700     2 COMPUTE-12A           PICTURE 999V9     VALUE 336.4.       NC2524.2
   000114         011800     2 COMPUTE-12B           PICTURE 999V9     VALUE 281.7.       NC2524.2
   000115         011900 01  RENAMES-DATA.                                                NC2524.2
   000116         012000     02  NAME1.                                                   NC2524.2
   000117         012100         03 NAME1A PICTURE XX VALUE SPACE.                        NC2524.2 IMP
   000118         012200         03 NAME1B PICTURE XXX VALUE SPACE.                       NC2524.2 IMP
   000119         012300     02  NAME2 PICTURE X(10) VALUE SPACE.                         NC2524.2 IMP
   000120         012400     02  NAME3.                                                   NC2524.2
   000121         012500         09 NAME3A PICTURE XXX VALUE SPACE.                       NC2524.2 IMP
   000122         012600         09 NAME3B PICTURE XX VALUE SPACE.                        NC2524.2 IMP
   000123         012700 66  RENAME1 RENAMES NAME1 THRU NAME3.                            NC2524.2 116 120
   000124         012800 66  RENAME2 RENAMES NAME1A THRU NAME1B.                          NC2524.2 117 118
   000125         012900 66  RENAME3 RENAMES NAME2.                                       NC2524.2 119
   000126         013000 66  RENAME4 RENAMES NAME1.                                       NC2524.2 116
   000127         013100 01  GRP-FOR-RENAMES.                                             NC2524.2
   000128         013200     03  SUB-GRP-FOR-RENAMES-1.                                   NC2524.2
   000129         013300     05  ELEM-FOR-RENAMES-1      PICTURE X    VALUE "X".          NC2524.2
   000130         013400     05  FILLER                  PICTURE XX   VALUE SPACE.        NC2524.2 IMP
   000131         013500     03  SUB-GRP-FOR-RENAMES-2.                                   NC2524.2
   000132         013600     49  ELEM-FOR-RENAMES-2      PICTURE 999  VALUE 123.          NC2524.2
   000133         013700     49  FILLER                  PICTURE 9    VALUE ZERO.         NC2524.2 IMP
   000134         013800     49  ELEM-FOR-RENAMES-3      PICTURE XXXX VALUE ZERO.         NC2524.2 IMP
   000135         013900     66  RENAMES-TEST-1 RENAMES ELEM-FOR-RENAMES-2.               NC2524.2 132
   000136         014000     66  RENAMES-TEST-2 RENAMES SUB-GRP-FOR-RENAMES-1             NC2524.2 128
   000137         014100         OF GRP-FOR-RENAMES.                                      NC2524.2 127
   000138         014200     66  RENAMES-TEST-3 RENAMES SUB-GRP-FOR-RENAMES-1             NC2524.2 128
   000139         014300         THRU ELEM-FOR-RENAMES-2.                                 NC2524.2 132
   000140         014400     66  RENAMES-TEST-4 RENAMES ELEM-FOR-RENAMES-1                NC2524.2 129
   000141         014500         THRU ELEM-FOR-RENAMES-2 IN GRP-FOR-RENAMES.              NC2524.2 132 127
   000142         014600 01  T-RENAMES-DATA.                                              NC2524.2
   000143         014700     02 TAG-1.                                                    NC2524.2
   000144         014800        03 TAG-1A       PICTURE XXXX.                             NC2524.2
   000145         014900         03 TAG-1B      PICTURE XXXXXX.                           NC2524.2
   000146         015000     02 NAME-2          PICTURE XXXXXXX.                          NC2524.2
   000147         015100 66  RENAME-5 RENAMES TAG-1A THRU TAG-1B.                         NC2524.2 144 145
   000148         015200 66  RENAME-6 RENAMES TAG-1A THRU NAME-2 OF T-RENAMES-DATA.       NC2524.2 144 146 142
   000149         015300 01  U-RENAMES-DATA.                                              NC2524.2
   000150         015400     02 UNIT-1.                                                   NC2524.2
   000151         015500         03 UNIT-1A     PICTURE XXXXXXX VALUE "VERMONT".          NC2524.2
   000152         015600         03 UNIT-1B     PICTURE XXXX    VALUE "OHIO".             NC2524.2
   000153         015700     02 NAME-2          PICTURE XXXXX   VALUE "MAINE".            NC2524.2
   000154         015800 66  RENAME-5 RENAMES UNIT-1A THROUGH UNIT-1B.                    NC2524.2 151 152
   000155         015900 66  RENAME-6 RENAMES UNIT-1A THRU NAME-2 OF U-RENAMES-DATA.      NC2524.2 151 153 149
   000156         016000 01  V-RENAMES-DATA.                                              NC2524.2
   000157         016100     02 ITEM-1          PICTURE X(5).                             NC2524.2
   000158         016200     02 TABLE-2.                                                  NC2524.2
   000159         016300         03 TABLE-ITEM-2 PICTURE XXX OCCURS 5 TIMES.              NC2524.2
   000160         016400 66  RENAME-7 RENAMES ITEM-1 THRU TABLE-2.                        NC2524.2 157 158
   000161         016500 01  W-RENAMES-DATA.                                              NC2524.2
   000162         016600     02 WIDGET-1        PICTURE 99V9.                             NC2524.2
   000163         016700     02 WIDGET-2        PICTURE ***,***.**.                       NC2524.2
   000164         016800     02 WIDGET-3        PICTURE XXXX.                             NC2524.2
   000165         016900     02 WIDGET-4        PICTURE 9(4).                             NC2524.2
   000166         017000     02 WIDGET-5        PICTURE 9(4).                             NC2524.2
   000167         017100 66  RENAME-8  RENAMES WIDGET-1 THRU WIDGET-3.                    NC2524.2 162 164
   000168         017200 66  RENAME-9  RENAMES WIDGET-3 THRU WIDGET-5.                    NC2524.2 164 166
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 66  RENAME-10 RENAMES WIDGET-4 THRU WIDGET-5.                    NC2524.2 165 166
   000170         017400 66  RENAME-11 RENAMES WIDGET-2.                                  NC2524.2 163
   000171         017500 66  RENAME-12 RENAMES WIDGET-4.                                  NC2524.2 165
   000172         017600 01  REDEF10.                                                     NC2524.2
   000173         017700     02  RDFDATA1                PICTURE X(10) VALUE "ABC98765DE".NC2524.2
   000174         017800     02  RDFDATA2                PICTURE 9(4)V99 VALUE 9116.44.   NC2524.2
   000175         017900     02  RDFDATA3.                                                NC2524.2
   000176         018000         08  RDFDATA4            PICTURE X(6)  VALUE "ALLDON".    NC2524.2
   000177         018100         08  RDFDATA5            PICTURE XX99  VALUE "XX66".      NC2524.2
   000178         018200     02  RDF3 REDEFINES RDFDATA3.                                 NC2524.2 175
   000179         018300         03  RDF3-4              PICTURE X(8).                    NC2524.2
   000180         018400         03  RDF3-5              PIC 99.                          NC2524.2
   000181         018500         03  RDF3-5-1 REDEFINES RDF3-5.                           NC2524.2 180
   000182         018600             04  RDF3-5-14  PIC 9.                                NC2524.2
   000183         018700             04  RDF3-5-15  PIC 9.                                NC2524.2
   000184         018800                 88  HARD  VALUE 0.                               NC2524.2
   000185         018900                 88 SOFT  VALUE 1.                                NC2524.2
   000186         019000     02  RDFDATA6                PICTURE A(20) VALUE              NC2524.2
   000187         019100     "ZYXWVUTSRQPONMLKJIHG".                                      NC2524.2
   000188         019200     66  RDF3-5-16 RENAMES RDF3-5.                                NC2524.2 180
   000189         019300 01  REDEF11 REDEFINES REDEF10.                                   NC2524.2 172
   000190         019400     02  RDFDATA7                PICTURE X(20).                   NC2524.2
   000191         019500     02  RDF8.                                                    NC2524.2
   000192         019600         03   RDFDATA8 OCCURS 36 TIMES PICTURE XX.                NC2524.2
   000193         019700     02  RDEF8 REDEFINES RDF8.                                    NC2524.2 191
   000194         019800         03  RDF8-1              PICTURE X(50).                   NC2524.2
   000195         019900         03  RDF8-2              PIC X(9).                        NC2524.2
   000196         020000         03  RDF8-3 REDEFINES RDF8-2.                             NC2524.2 195
   000197         020100             04  RDF8-4          PIC X(5).                        NC2524.2
   000198         020200             04  RDF8-5          PICTURE XX.                      NC2524.2
   000199         020300             04  RDF8-6  PIC XX.                                  NC2524.2
   000200         020400         03  RDF8-8              PIC X(13).                       NC2524.2
   000201         020500     66  RDF8-7 RENAMES RDF8-5 THRU RDF8-6.                       NC2524.2 198 199
   000202         020600 01  REDEF12 REDEFINES REDEF10.                                   NC2524.2 172
   000203         020700     02  RDFDATA9                PICTURE A(3).                    NC2524.2
   000204         020800     02  RDFDATA10     PIC 9(5).                                  NC2524.2
   000205         020900     02  RDFDATA11.                                               NC2524.2
   000206         021000         03  RDFDATA12.                                           NC2524.2
   000207         021100             04  RDFDATA13       PICTURE XX.                      NC2524.2
   000208         021200             04  RDFDATA14 OCCURS 6 TIMES PICTURE 9.              NC2524.2
   000209         021300         03  RDFDATA15           PICTURE X(8).                    NC2524.2
   000210         021400     02  RDFDATA16               PICTURE 99.                      NC2524.2
   000211         021500     02  RDFDATA17               PICTURE X(80).                   NC2524.2
   000212         021600     02  RDFDATA18               PICTURE X(14).                   NC2524.2
   000213         021700 01  GRP-REDEF125   REDEFINES REDEF10.                            NC2524.2 172
   000214         021800     02 AN0020-X-0001             PIC X(26).                      NC2524.2
   000215         021900     02 AN0002-O036F-X-0002       PIC XX  OCCURS 36 TIMES.        NC2524.2
   000216         022000 01  WRK-DU-05V00-0001            PIC 9(5).                       NC2524.2
   000217         022100 01  WRK-DS-05V00-0002            PIC S9(5).                      NC2524.2
   000218         022200 01  WRK-CS-05V00-0003            PIC S9(5) COMP.                 NC2524.2
   000219         022300 01  WRK-DU-04V02-0004            PIC 9(4)V9(2).                  NC2524.2
   000220         022400 01  WRK-DS-04V01-0005            PIC S9(4)V9.                    NC2524.2
   000221         022500 01  NE-0008                      PIC $9(4).99-.                  NC2524.2
   000222         022600 01  NE-0009                      PIC ***99.                      NC2524.2
   000223         022700 01  NE-04V01-0006     PIC ****.9.                                NC2524.2
   000224         022800 01  GRP-0010.                                                    NC2524.2
   000225         022900     02 WRK-DU-03V00-L-0011       PIC 9(03) SYNC LEFT.            NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02 WRK-O005F-0012        OCCURS   5  TIMES.                  NC2524.2
   000227         023100        03 WRK-O003F-0013     OCCURS   3  TIMES.                  NC2524.2
   000228         023200           05 WRK-DS-03V04-0003F-0014 PIC S9(3)V9999              NC2524.2
   000229         023300                                            OCCURS 3 TIMES.       NC2524.2
   000230         023400 01  DS-02V00-0001                PIC S99  VALUE  16.             NC2524.2
   000231         023500 01  DS-03V00-0002                PIC S999 VALUE  174.            NC2524.2
   000232         023600 01  CS-05V00-0003                PIC S9(5) COMP  VALUE 10.       NC2524.2
   000233         023700 01    TA--X           PIC 9(5)  COMP VALUE ZERO.                 NC2524.2 IMP
   000234         023800 01  REDEF13.                                                     NC2524.2
   000235         023900     02  FILLER                  PICTURE X(57)   VALUE            NC2524.2
   000236         024000     "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA". NC2524.2
   000237         024100     02  FILLER                  PICTURE X(57)   VALUE            NC2524.2
   000238         024200     "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA". NC2524.2
   000239         024300     02  FILLER                  PICTURE X(6)    VALUE "AAAAAA".  NC2524.2
   000240         024400 01  MINUS-NAMES.                                                 NC2524.2
   000241         024500     02  WHOLE-FIELD              PICTURE S9(18).                 NC2524.2
   000242         024600     02  PLUS-NAME1  PICTURE S9(18) VALUE +333333333333333333.    NC2524.2
   000243         024700     02  EVEN-NAME1  PICTURE S9(18) VALUE +1.                     NC2524.2
   000244         024800     02  PLUS-NAME2  PICTURE S9(18) VALUE +999999999999999999.    NC2524.2
   000245         024900     02  ALPHA-LIT                PICTURE X(5)  VALUE SPACE.      NC2524.2 IMP
   000246         025000     02  SNEG-LIT2                PICTURE S9(5)  VALUE -70718.    NC2524.2
   000247         025100 01  TEST-RESULTS.                                                NC2524.2
   000248         025200     02 FILLER                   PIC X      VALUE SPACE.          NC2524.2 IMP
   000249         025300     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2524.2 IMP
   000250         025400     02 FILLER                   PIC X      VALUE SPACE.          NC2524.2 IMP
   000251         025500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2524.2 IMP
   000252         025600     02 FILLER                   PIC X      VALUE SPACE.          NC2524.2 IMP
   000253         025700     02  PAR-NAME.                                                NC2524.2
   000254         025800       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2524.2 IMP
   000255         025900       03  PARDOT-X              PIC X      VALUE SPACE.          NC2524.2 IMP
   000256         026000       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2524.2 IMP
   000257         026100     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2524.2 IMP
   000258         026200     02 RE-MARK                  PIC X(61).                       NC2524.2
   000259         026300 01  TEST-COMPUTED.                                               NC2524.2
   000260         026400     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2524.2 IMP
   000261         026500     02 FILLER                   PIC X(17)  VALUE                 NC2524.2
   000262         026600            "       COMPUTED=".                                   NC2524.2
   000263         026700     02 COMPUTED-X.                                               NC2524.2
   000264         026800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2524.2 IMP
   000265         026900     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2524.2 264
   000266         027000                                 PIC -9(9).9(9).                  NC2524.2
   000267         027100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2524.2 264
   000268         027200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2524.2 264
   000269         027300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2524.2 264
   000270         027400     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2524.2 264
   000271         027500         04 COMPUTED-18V0                    PIC -9(18).          NC2524.2
   000272         027600         04 FILLER                           PIC X.               NC2524.2
   000273         027700     03 FILLER PIC X(50) VALUE SPACE.                             NC2524.2 IMP
   000274         027800 01  TEST-CORRECT.                                                NC2524.2
   000275         027900     02 FILLER PIC X(30) VALUE SPACE.                             NC2524.2 IMP
   000276         028000     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2524.2
   000277         028100     02 CORRECT-X.                                                NC2524.2
   000278         028200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2524.2 IMP
   000279         028300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2524.2 278
   000280         028400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2524.2 278
   000281         028500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2524.2 278
   000282         028600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2524.2 278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     03      CR-18V0 REDEFINES CORRECT-A.                         NC2524.2 278
   000284         028800         04 CORRECT-18V0                     PIC -9(18).          NC2524.2
   000285         028900         04 FILLER                           PIC X.               NC2524.2
   000286         029000     03 FILLER PIC X(2) VALUE SPACE.                              NC2524.2 IMP
   000287         029100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2524.2 IMP
   000288         029200 01  CCVS-C-1.                                                    NC2524.2
   000289         029300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2524.2
   000290         029400-    "SS  PARAGRAPH-NAME                                          NC2524.2
   000291         029500-    "       REMARKS".                                            NC2524.2
   000292         029600     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2524.2 IMP
   000293         029700 01  CCVS-C-2.                                                    NC2524.2
   000294         029800     02 FILLER                     PIC X        VALUE SPACE.      NC2524.2 IMP
   000295         029900     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2524.2
   000296         030000     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2524.2 IMP
   000297         030100     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2524.2
   000298         030200     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2524.2 IMP
   000299         030300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2524.2 IMP
   000300         030400 01  REC-CT                        PIC 99       VALUE ZERO.       NC2524.2 IMP
   000301         030500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2524.2 IMP
   000302         030600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2524.2 IMP
   000303         030700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2524.2 IMP
   000304         030800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2524.2 IMP
   000305         030900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2524.2 IMP
   000306         031000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2524.2 IMP
   000307         031100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2524.2 IMP
   000308         031200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2524.2 IMP
   000309         031300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2524.2 IMP
   000310         031400 01  CCVS-H-1.                                                    NC2524.2
   000311         031500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2524.2 IMP
   000312         031600     02  FILLER                    PIC X(42)    VALUE             NC2524.2
   000313         031700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2524.2
   000314         031800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2524.2 IMP
   000315         031900 01  CCVS-H-2A.                                                   NC2524.2
   000316         032000   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2524.2 IMP
   000317         032100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2524.2
   000318         032200   02  FILLER                        PIC XXXX   VALUE             NC2524.2
   000319         032300     "4.2 ".                                                      NC2524.2
   000320         032400   02  FILLER                        PIC X(28)  VALUE             NC2524.2
   000321         032500            " COPY - NOT FOR DISTRIBUTION".                       NC2524.2
   000322         032600   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2524.2 IMP
   000323         032700                                                                  NC2524.2
   000324         032800 01  CCVS-H-2B.                                                   NC2524.2
   000325         032900   02  FILLER                        PIC X(15)  VALUE             NC2524.2
   000326         033000            "TEST RESULT OF ".                                    NC2524.2
   000327         033100   02  TEST-ID                       PIC X(9).                    NC2524.2
   000328         033200   02  FILLER                        PIC X(4)   VALUE             NC2524.2
   000329         033300            " IN ".                                               NC2524.2
   000330         033400   02  FILLER                        PIC X(12)  VALUE             NC2524.2
   000331         033500     " HIGH       ".                                              NC2524.2
   000332         033600   02  FILLER                        PIC X(22)  VALUE             NC2524.2
   000333         033700            " LEVEL VALIDATION FOR ".                             NC2524.2
   000334         033800   02  FILLER                        PIC X(58)  VALUE             NC2524.2
   000335         033900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2524.2
   000336         034000 01  CCVS-H-3.                                                    NC2524.2
   000337         034100     02  FILLER                      PIC X(34)  VALUE             NC2524.2
   000338         034200            " FOR OFFICIAL USE ONLY    ".                         NC2524.2
   000339         034300     02  FILLER                      PIC X(58)  VALUE             NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2524.2
   000341         034500     02  FILLER                      PIC X(28)  VALUE             NC2524.2
   000342         034600            "  COPYRIGHT   1985 ".                                NC2524.2
   000343         034700 01  CCVS-E-1.                                                    NC2524.2
   000344         034800     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2524.2 IMP
   000345         034900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2524.2
   000346         035000     02 ID-AGAIN                     PIC X(9).                    NC2524.2
   000347         035100     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2524.2 IMP
   000348         035200 01  CCVS-E-2.                                                    NC2524.2
   000349         035300     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2524.2 IMP
   000350         035400     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2524.2 IMP
   000351         035500     02 CCVS-E-2-2.                                               NC2524.2
   000352         035600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2524.2 IMP
   000353         035700         03 FILLER                   PIC X      VALUE SPACE.      NC2524.2 IMP
   000354         035800         03 ENDER-DESC               PIC X(44)  VALUE             NC2524.2
   000355         035900            "ERRORS ENCOUNTERED".                                 NC2524.2
   000356         036000 01  CCVS-E-3.                                                    NC2524.2
   000357         036100     02  FILLER                      PIC X(22)  VALUE             NC2524.2
   000358         036200            " FOR OFFICIAL USE ONLY".                             NC2524.2
   000359         036300     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2524.2 IMP
   000360         036400     02  FILLER                      PIC X(58)  VALUE             NC2524.2
   000361         036500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2524.2
   000362         036600     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2524.2 IMP
   000363         036700     02 FILLER                       PIC X(15)  VALUE             NC2524.2
   000364         036800             " COPYRIGHT 1985".                                   NC2524.2
   000365         036900 01  CCVS-E-4.                                                    NC2524.2
   000366         037000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2524.2 IMP
   000367         037100     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2524.2
   000368         037200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2524.2 IMP
   000369         037300     02 FILLER                       PIC X(40)  VALUE             NC2524.2
   000370         037400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2524.2
   000371         037500 01  XXINFO.                                                      NC2524.2
   000372         037600     02 FILLER                       PIC X(19)  VALUE             NC2524.2
   000373         037700            "*** INFORMATION ***".                                NC2524.2
   000374         037800     02 INFO-TEXT.                                                NC2524.2
   000375         037900       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2524.2 IMP
   000376         038000       04 XXCOMPUTED                 PIC X(20).                   NC2524.2
   000377         038100       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2524.2 IMP
   000378         038200       04 XXCORRECT                  PIC X(20).                   NC2524.2
   000379         038300     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2524.2
   000380         038400 01  HYPHEN-LINE.                                                 NC2524.2
   000381         038500     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2524.2 IMP
   000382         038600     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2524.2
   000383         038700-    "*****************************************".                 NC2524.2
   000384         038800     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2524.2
   000385         038900-    "******************************".                            NC2524.2
   000386         039000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2524.2
   000387         039100     "NC252A".                                                    NC2524.2
   000388         039200 PROCEDURE DIVISION.                                              NC2524.2
   000389         039300 CCVS1 SECTION.                                                   NC2524.2
   000390         039400 OPEN-FILES.                                                      NC2524.2
   000391         039500     OPEN     OUTPUT PRINT-FILE.                                  NC2524.2 33
   000392         039600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2524.2 386 327 386 346
   000393         039700     MOVE    SPACE TO TEST-RESULTS.                               NC2524.2 IMP 247
   000394         039800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2524.2 417 422
   000395         039900     GO TO CCVS1-EXIT.                                            NC2524.2 499
   000396         040000 CLOSE-FILES.                                                     NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2524.2 426 447 33
   000398         040200 TERMINATE-CCVS.                                                  NC2524.2
   000399         040300     STOP     RUN.                                                NC2524.2
   000400         040400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2524.2 251 303
   000401         040500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2524.2 251 304
   000402         040600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2524.2 251 302
   000403         040700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2524.2 251 301
   000404         040800     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2524.2 258
   000405         040900 PRINT-DETAIL.                                                    NC2524.2
   000406         041000     IF REC-CT NOT EQUAL TO ZERO                                  NC2524.2 300 IMP
   000407      1  041100             MOVE "." TO PARDOT-X                                 NC2524.2 255
   000408      1  041200             MOVE REC-CT TO DOTVALUE.                             NC2524.2 300 256
   000409         041300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2524.2 247 34 459
   000410         041400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2524.2 251 459
   000411      1  041500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2524.2 476 489
   000412      1  041600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2524.2 490 498
   000413         041700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2524.2 IMP 251 IMP 263
   000414         041800     MOVE SPACE TO CORRECT-X.                                     NC2524.2 IMP 277
   000415         041900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2524.2 300 IMP IMP 253
   000416         042000     MOVE     SPACE TO RE-MARK.                                   NC2524.2 IMP 258
   000417         042100 HEAD-ROUTINE.                                                    NC2524.2
   000418         042200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2524.2 310 35 459
   000419         042300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2524.2 315 35 459
   000420         042400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2524.2 324 35 459
   000421         042500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2524.2 336 35 459
   000422         042600 COLUMN-NAMES-ROUTINE.                                            NC2524.2
   000423         042700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2524.2 288 35 459
   000424         042800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2524.2 293 35 459
   000425         042900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2524.2 380 35 459
   000426         043000 END-ROUTINE.                                                     NC2524.2
   000427         043100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2524.2 380 35 459
   000428         043200 END-RTN-EXIT.                                                    NC2524.2
   000429         043300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2524.2 343 35 459
   000430         043400 END-ROUTINE-1.                                                   NC2524.2
   000431         043500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2524.2 302 306 303
   000432         043600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2524.2 306 301 306
   000433         043700      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2524.2 304 306
   000434         043800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2524.2
   000435         043900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2524.2 304 366
   000436         044000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2524.2 306 368
   000437         044100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2524.2 365 351
   000438         044200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2524.2 348 35 459
   000439         044300  END-ROUTINE-12.                                                 NC2524.2
   000440         044400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2524.2 354
   000441         044500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2524.2 302 IMP
   000442      1  044600         MOVE "NO " TO ERROR-TOTAL                                NC2524.2 352
   000443         044700         ELSE                                                     NC2524.2
   000444      1  044800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2524.2 302 352
   000445         044900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2524.2 348 35
   000446         045000     PERFORM WRITE-LINE.                                          NC2524.2 459
   000447         045100 END-ROUTINE-13.                                                  NC2524.2
   000448         045200     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2524.2 301 IMP
   000449      1  045300         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2524.2 352
   000450      1  045400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2524.2 301 352
   000451         045500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2524.2 354
   000452         045600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2524.2 348 35 459
   000453         045700      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2524.2 303 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  045800          MOVE "NO " TO ERROR-TOTAL                               NC2524.2 352
   000455      1  045900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2524.2 303 352
   000456         046000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2524.2 354
   000457         046100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2524.2 348 35 459
   000458         046200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2524.2 356 35 459
   000459         046300 WRITE-LINE.                                                      NC2524.2
   000460         046400     ADD 1 TO RECORD-COUNT.                                       NC2524.2 308
   000461         046500     IF RECORD-COUNT GREATER 50                                   NC2524.2 308
   000462      1  046600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2524.2 35 307
   000463      1  046700         MOVE SPACE TO DUMMY-RECORD                               NC2524.2 IMP 35
   000464      1  046800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2524.2 35
   000465      1  046900         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2524.2 288 35 471
   000466      1  047000         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2524.2 293 35 471
   000467      1  047100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2524.2 380 35 471
   000468      1  047200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2524.2 307 35
   000469      1  047300         MOVE ZERO TO RECORD-COUNT.                               NC2524.2 IMP 308
   000470         047400     PERFORM WRT-LN.                                              NC2524.2 471
   000471         047500 WRT-LN.                                                          NC2524.2
   000472         047600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2524.2 35
   000473         047700     MOVE SPACE TO DUMMY-RECORD.                                  NC2524.2 IMP 35
   000474         047800 BLANK-LINE-PRINT.                                                NC2524.2
   000475         047900     PERFORM WRT-LN.                                              NC2524.2 471
   000476         048000 FAIL-ROUTINE.                                                    NC2524.2
   000477         048100     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2524.2 263 IMP 484
   000478         048200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2524.2 277 IMP 484
   000479         048300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2524.2 309 379
   000480         048400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2524.2 374
   000481         048500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2524.2 371 35 459
   000482         048600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2524.2 IMP 379
   000483         048700     GO TO  FAIL-ROUTINE-EX.                                      NC2524.2 489
   000484         048800 FAIL-ROUTINE-WRITE.                                              NC2524.2
   000485         048900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2524.2 259 34 459
   000486         049000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2524.2 309 287
   000487         049100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2524.2 274 34 459
   000488         049200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2524.2 IMP 287
   000489         049300 FAIL-ROUTINE-EX. EXIT.                                           NC2524.2
   000490         049400 BAIL-OUT.                                                        NC2524.2
   000491         049500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2524.2 264 IMP 493
   000492         049600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2524.2 278 IMP 498
   000493         049700 BAIL-OUT-WRITE.                                                  NC2524.2
   000494         049800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2524.2 278 378 264 376
   000495         049900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2524.2 309 379
   000496         050000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2524.2 371 35 459
   000497         050100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2524.2 IMP 379
   000498         050200 BAIL-OUT-EX. EXIT.                                               NC2524.2
   000499         050300 CCVS1-EXIT.                                                      NC2524.2
   000500         050400     EXIT.                                                        NC2524.2
   000501         050500 SECT-NC252A-001 SECTION.                                         NC2524.2
   000502         050600 RDF-INIT.                                                        NC2524.2
   000503         050700     MOVE "REDEFINES " TO FEATURE.                                NC2524.2 249
   000504         050800 RDF-TEST-1.                                                      NC2524.2
   000505         050900     IF HARD                                                      NC2524.2 184
   000506      1  051000         MOVE RDF3-5-15 TO COMPUTED-A                             NC2524.2 183 264
   000507      1  051100         MOVE 6 TO CORRECT-A                                      NC2524.2 278
   000508      1  051200         PERFORM FAIL                                             NC2524.2 402
   000509      1  051300         GO TO RDF-WRITE-1.                                       NC2524.2 515
   000510         051400*    NOTE 88 LEVEL CONDITION TEST ON REDEFINED FIELD.             NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     PERFORM PASS.                                                NC2524.2 401
   000512         051600     GO TO RDF-WRITE-1.                                           NC2524.2 515
   000513         051700 RDF-DELETE-1.                                                    NC2524.2
   000514         051800     PERFORM DE-LETE.                                             NC2524.2 403
   000515         051900 RDF-WRITE-1.                                                     NC2524.2
   000516         052000     MOVE "RDF-TEST-1 " TO PAR-NAME.                              NC2524.2 253
   000517         052100     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000518         052200 RDF-TEST-2.                                                      NC2524.2
   000519         052300     IF RDF3-5-16 EQUAL TO 66                                     NC2524.2 188
   000520      1  052400         PERFORM PASS                                             NC2524.2 401
   000521      1  052500         GO TO RDF-WRITE-2.                                       NC2524.2 529
   000522         052600*    NOTE USING A RENAMES DATANAME THAT IS ALSO REDEFINED.        NC2524.2
   000523         052700     MOVE RDF3-5-16 TO COMPUTED-A.                                NC2524.2 188 264
   000524         052800     MOVE 66 TO CORRECT-A.                                        NC2524.2 278
   000525         052900     PERFORM FAIL.                                                NC2524.2 402
   000526         053000     GO TO RDF-WRITE-2.                                           NC2524.2 529
   000527         053100 RDF-DELETE-2.                                                    NC2524.2
   000528         053200     PERFORM DE-LETE.                                             NC2524.2 403
   000529         053300 RDF-WRITE-2.                                                     NC2524.2
   000530         053400     MOVE "RDF-TEST-2 " TO PAR-NAME.                              NC2524.2 253
   000531         053500     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000532         053600 RDF-TEST-003.                                                    NC2524.2
   000533         053700     IF   AN0002-O036F-X-0002  (8)  EQUAL TO  "LK"                NC2524.2 215
   000534      1  053800          PERFORM  PASS                                           NC2524.2 401
   000535      1  053900          GO TO   RDF-WRITE-003.                                  NC2524.2 546
   000536         054000*                                                                 NC2524.2
   000537         054100*    NOTE  REFERENCING    SUBSCRIPTED DATA ITEM WHICH IS          NC2524.2
   000538         054200*          SUBORDINATE TO A REDEFINES CLAUSE.                     NC2524.2
   000539         054300*                                                                 NC2524.2
   000540         054400     MOVE  AN0002-O036F-X-0002 (8) TO  COMPUTED-A.                NC2524.2 215 264
   000541         054500     MOVE   "LK"  TO CORRECT-A.                                   NC2524.2 278
   000542         054600     PERFORM  FAIL.                                               NC2524.2 402
   000543         054700     GO TO    RDF-WRITE-003.                                      NC2524.2 546
   000544         054800 RDF-DELETE-003.                                                  NC2524.2
   000545         054900     PERFORM  DE-LETE.                                            NC2524.2 403
   000546         055000 RDF-WRITE-003.                                                   NC2524.2
   000547         055100     MOVE     "RDF-TEST-003"  TO  PAR-NAME.                       NC2524.2 253
   000548         055200     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   000549         055300 RDF-TEST-4.                                                      NC2524.2
   000550         055400     IF RDFDATA7 EQUAL TO "ABC98765DE911644ALLD"                  NC2524.2 190
   000551      1  055500         PERFORM PASS                                             NC2524.2 401
   000552      1  055600         GO TO RDF-WRITE-4.                                       NC2524.2 562
   000553         055700*    NOTE THIS IS THE FIRST REFERENCE TO THESE REDEFINED          NC2524.2
   000554         055800*        DATANAMES, SO, THE FIELDS CONTAIN THE WORKING-STORAGE    NC2524.2
   000555         055900*        ASSIGNED VALUES.                                         NC2524.2
   000556         056000     MOVE RDFDATA7 TO COMPUTED-A.                                 NC2524.2 190 264
   000557         056100     MOVE "ABC98765DE911644ALLD" TO CORRECT-A.                    NC2524.2 278
   000558         056200     PERFORM FAIL.                                                NC2524.2 402
   000559         056300     GO TO RDF-WRITE-4.                                           NC2524.2 562
   000560         056400 RDF-DELETE-4.                                                    NC2524.2
   000561         056500     PERFORM DE-LETE.                                             NC2524.2 403
   000562         056600 RDF-WRITE-4.                                                     NC2524.2
   000563         056700     MOVE "RDF-TEST-4 " TO PAR-NAME.                              NC2524.2 253
   000564         056800     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000565         056900 RDF-TEST-5.                                                      NC2524.2
   000566         057000     IF RDFDATA8 (13) EQUAL TO "HG"                               NC2524.2 192
   000567      1  057100         PERFORM PASS                                             NC2524.2 401
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  057200         GO TO RDF-WRITE-5.                                       NC2524.2 575
   000569         057300     MOVE "HG" TO CORRECT-A.                                      NC2524.2 278
   000570         057400     MOVE RDFDATA8 (13) TO COMPUTED-A.                            NC2524.2 192 264
   000571         057500     PERFORM FAIL.                                                NC2524.2 402
   000572         057600     GO TO RDF-WRITE-5.                                           NC2524.2 575
   000573         057700 RDF-DELETE-5.                                                    NC2524.2
   000574         057800     PERFORM DE-LETE.                                             NC2524.2 403
   000575         057900 RDF-WRITE-5.                                                     NC2524.2
   000576         058000     MOVE "RDF-TEST-5 " TO PAR-NAME.                              NC2524.2 253
   000577         058100     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000578         058200 RDF-TEST-6.                                                      NC2524.2
   000579         058300     IF RDFDATA2 EQUAL TO 9116.44                                 NC2524.2 174
   000580      1  058400         PERFORM PASS                                             NC2524.2 401
   000581      1  058500         GO TO RDF-WRITE-6.                                       NC2524.2 588
   000582         058600     MOVE 9116.44 TO COMPUTED-N.                                  NC2524.2 265
   000583         058700     MOVE RDFDATA2 TO CORRECT-N.                                  NC2524.2 174 279
   000584         058800     PERFORM FAIL.                                                NC2524.2 402
   000585         058900     GO TO RDF-WRITE-6.                                           NC2524.2 588
   000586         059000 RDF-DELETE-6.                                                    NC2524.2
   000587         059100     PERFORM DE-LETE.                                             NC2524.2 403
   000588         059200 RDF-WRITE-6.                                                     NC2524.2
   000589         059300     MOVE "RDF-TEST-6 " TO PAR-NAME.                              NC2524.2 253
   000590         059400     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000591         059500 RDF-TEST-7.                                                      NC2524.2
   000592         059600     IF RDFDATA16 EQUAL TO 66                                     NC2524.2 210
   000593      1  059700         PERFORM PASS                                             NC2524.2 401
   000594      1  059800         GO TO RDF-WRITE-7.                                       NC2524.2 601
   000595         059900     MOVE RDFDATA16 TO COMPUTED-A.                                NC2524.2 210 264
   000596         060000     MOVE 66 TO CORRECT-A.                                        NC2524.2 278
   000597         060100     PERFORM FAIL.                                                NC2524.2 402
   000598         060200     GO TO RDF-WRITE-7.                                           NC2524.2 601
   000599         060300 RDF-DELETE-7.                                                    NC2524.2
   000600         060400     PERFORM DE-LETE.                                             NC2524.2 403
   000601         060500 RDF-WRITE-7.                                                     NC2524.2
   000602         060600     MOVE "RDF-TEST-7 " TO PAR-NAME.                              NC2524.2 253
   000603         060700     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000604         060800 RDF-TEST-8.                                                      NC2524.2
   000605         060900     MOVE SPACE TO REDEF12.                                       NC2524.2 IMP 202
   000606         061000     IF REDEF11 EQUAL TO SPACE                                    NC2524.2 189 IMP
   000607      1  061100         PERFORM PASS                                             NC2524.2 401
   000608      1  061200         GO TO RDF-WRITE-8.                                       NC2524.2 616
   000609         061300     MOVE "SPACE EXPECTED " TO CORRECT-A.                         NC2524.2 278
   000610         061400     MOVE "NON BLANK CHARACTERS" TO COMPUTED-A.                   NC2524.2 264
   000611         061500     MOVE "REDEF11 CONTAINS NON BLANKS" TO RE-MARK.               NC2524.2 258
   000612         061600     PERFORM FAIL.                                                NC2524.2 402
   000613         061700     GO TO RDF-WRITE-8.                                           NC2524.2 616
   000614         061800 RDF-DELETE-8.                                                    NC2524.2
   000615         061900     PERFORM DE-LETE.                                             NC2524.2 403
   000616         062000 RDF-WRITE-8.                                                     NC2524.2
   000617         062100     MOVE "RDF-TEST-8 " TO PAR-NAME.                              NC2524.2 253
   000618         062200     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000619         062300 RDF-TEST-9.                                                      NC2524.2
   000620         062400     MOVE ZERO TO REDEF12.                                        NC2524.2 IMP 202
   000621         062500     MOVE SPACE TO REDEF11.                                       NC2524.2 IMP 189
   000622         062600*    NOTE  CHECKS RDFDATA18 WHICH SHOULD NOT BE DISTURBED BY THE  NC2524.2
   000623         062700*        MOVE SPACE STATEMENT TO A SHORTER REDEFINED AREA.        NC2524.2
   000624         062800     IF RDFDATA18 EQUAL TO ZERO                                   NC2524.2 212 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  062900         PERFORM PASS                                             NC2524.2 401
   000626      1  063000         GO TO RDF-WRITE-9.                                       NC2524.2 633
   000627         063100     MOVE "00000000000000" TO CORRECT-A.                          NC2524.2 278
   000628         063200     MOVE RDFDATA18 TO COMPUTED-A.                                NC2524.2 212 264
   000629         063300     PERFORM FAIL.                                                NC2524.2 402
   000630         063400     GO TO RDF-WRITE-9.                                           NC2524.2 633
   000631         063500 RDF-DELETE-9.                                                    NC2524.2
   000632         063600     PERFORM DE-LETE.                                             NC2524.2 403
   000633         063700 RDF-WRITE-9.                                                     NC2524.2
   000634         063800     MOVE "RDF-TEST-9 " TO PAR-NAME.                              NC2524.2 253
   000635         063900     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000636         064000 RDF-TEST-10.                                                     NC2524.2
   000637         064100     MOVE ZERO TO REDEF12.                                        NC2524.2 IMP 202
   000638         064200     MOVE "MOVING DATA TO A REDEFINED FIELD CAN BE RISKY "        NC2524.2
   000639         064300         TO REDEF10.                                              NC2524.2 172
   000640         064400     IF RDFDATA8 (14) EQUAL TO "00"                               NC2524.2 192
   000641      1  064500         PERFORM PASS                                             NC2524.2 401
   000642      1  064600         GO TO RDF-WRITE-10.                                      NC2524.2 649
   000643         064700     MOVE 00 TO CORRECT-A.                                        NC2524.2 278
   000644         064800     MOVE RDFDATA8 (14) TO COMPUTED-A.                            NC2524.2 192 264
   000645         064900     PERFORM FAIL.                                                NC2524.2 402
   000646         065000     GO TO RDF-WRITE-10.                                          NC2524.2 649
   000647         065100 RDF-DELETE-10.                                                   NC2524.2
   000648         065200     PERFORM DE-LETE.                                             NC2524.2 403
   000649         065300 RDF-WRITE-10.                                                    NC2524.2
   000650         065400     MOVE "RDF-TEST-10 " TO PAR-NAME.                             NC2524.2 253
   000651         065500     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000652         065600 RDF-INIT-11.                                                     NC2524.2
   000653         065700     MOVE REDEF13 TO REDEF12.                                     NC2524.2 234 202
   000654         065800     MOVE "RDF-TEST-11 " TO PAR-NAME.                             NC2524.2 253
   000655         065900 RDF-TEST-11.                                                     NC2524.2
   000656         066000     IF REDEF10 EQUAL TO                                          NC2524.2 172
   000657         066100         "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"         NC2524.2
   000658      1  066200         PERFORM PASS                                             NC2524.2 401
   000659      1  066300         PERFORM PRINT-DETAIL                                     NC2524.2 405
   000660      1  066400         GO TO   RDF-TEST-12.                                     NC2524.2 683
   000661         066500     MOVE    1 TO REC-CT.                                         NC2524.2 300
   000662         066600     MOVE    REDEF10 TO WS-46.                                    NC2524.2 172 41
   000663         066700     MOVE   "AAAAAAAAAAAAAAAAAAAA" TO CORRECT-A.                  NC2524.2 278
   000664         066800     MOVE    WS-1-20 TO COMPUTED-A.                               NC2524.2 42 264
   000665         066900     MOVE   "FIELDS DIDNT COMPARE EQUAL " TO RE-MARK.             NC2524.2 258
   000666         067000     PERFORM FAIL.                                                NC2524.2 402
   000667         067100     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000668         067200     ADD     1 TO REC-CT.                                         NC2524.2 300
   000669         067300     MOVE   "AAAAAAAAAAAAAAAAAAAA" TO CORRECT-A.                  NC2524.2 278
   000670         067400     MOVE    WS-21-40 TO COMPUTED-A.                              NC2524.2 43 264
   000671         067500     MOVE   "FIELDS DIDNT COMPARE EQUAL " TO RE-MARK.             NC2524.2 258
   000672         067600     PERFORM FAIL.                                                NC2524.2 402
   000673         067700     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000674         067800     ADD     1 TO REC-CT.                                         NC2524.2 300
   000675         067900     MOVE   "AAAAAA"  TO CORRECT-A.                               NC2524.2 278
   000676         068000     MOVE    WS-41-46 TO COMPUTED-A.                              NC2524.2 44 264
   000677         068100     MOVE   "FIELDS DIDNT COMPARE EQUAL " TO RE-MARK.             NC2524.2 258
   000678         068200     PERFORM FAIL.                                                NC2524.2 402
   000679         068300     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000680         068400     GO TO   RDF-TEST-12.                                         NC2524.2 683
   000681         068500 RDF-DELETE-11.                                                   NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600     PERFORM DE-LETE.                                             NC2524.2 403
   000683         068700 RDF-TEST-12.                                                     NC2524.2
   000684         068800     MOVE 11 TO RDFDATA16.                                        NC2524.2 210
   000685         068900*    NOTE 88 LEVEL TEST ON REDEFINED AREA.                        NC2524.2
   000686         069000     IF  SOFT                                                     NC2524.2 185
   000687      1  069100         PERFORM PASS                                             NC2524.2 401
   000688         069200     ELSE                                                         NC2524.2
   000689      1  069300         MOVE "CONDITION-NAME TEST" TO RE-MARK                    NC2524.2 258
   000690      1  069400         PERFORM FAIL.                                            NC2524.2 402
   000691         069500     GO TO RDF-WRITE-12.                                          NC2524.2 694
   000692         069600 RDF-DELETE-12.                                                   NC2524.2
   000693         069700     PERFORM DE-LETE.                                             NC2524.2 403
   000694         069800 RDF-WRITE-12.                                                    NC2524.2
   000695         069900     MOVE "RDF-TEST-12" TO PAR-NAME.                              NC2524.2 253
   000696         070000     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000697         070100 RDF-TEST-13.                                                     NC2524.2
   000698         070200     MOVE REDEF13 TO REDEF12.                                     NC2524.2 234 202
   000699         070300     MOVE SPACE TO REDEF10.                                       NC2524.2 IMP 172
   000700         070400     IF RDF8-7 EQUAL TO SPACE                                     NC2524.2 201 IMP
   000701      1  070500         MOVE RDF8-7 TO COMPUTED-A                                NC2524.2 201 264
   000702      1  070600         MOVE "AAAA" TO CORRECT-A                                 NC2524.2 278
   000703      1  070700         PERFORM FAIL                                             NC2524.2 402
   000704      1  070800         GO TO RDF-WRITE-13.                                      NC2524.2 709
   000705         070900     PERFORM PASS.                                                NC2524.2 401
   000706         071000     GO TO RDF-WRITE-13.                                          NC2524.2 709
   000707         071100 RDF-DELETE-13.                                                   NC2524.2
   000708         071200     PERFORM DE-LETE.                                             NC2524.2 403
   000709         071300 RDF-WRITE-13.                                                    NC2524.2
   000710         071400     MOVE "RDF-TEST-13 " TO PAR-NAME.                             NC2524.2 253
   000711         071500     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000712         071600 RDF-TEST-14.                                                     NC2524.2
   000713         071700     MOVE SPACE TO REDEF12.                                       NC2524.2 IMP 202
   000714         071800     MOVE REDEF13 TO REDEF10.                                     NC2524.2 234 172
   000715         071900     IF RDF8-3 EQUAL TO "AAAAAAAAA"                               NC2524.2 196
   000716      1  072000         MOVE RDF8-3 TO COMPUTED-A                                NC2524.2 196 264
   000717      1  072100         MOVE SPACE TO CORRECT-A                                  NC2524.2 IMP 278
   000718      1  072200         PERFORM FAIL                                             NC2524.2 402
   000719      1  072300         GO TO RDF-WRITE-14.                                      NC2524.2 724
   000720         072400     PERFORM PASS.                                                NC2524.2 401
   000721         072500     GO TO RDF-WRITE-14.                                          NC2524.2 724
   000722         072600 RDF-DELETE-14.                                                   NC2524.2
   000723         072700     PERFORM DE-LETE.                                             NC2524.2 403
   000724         072800 RDF-WRITE-14.                                                    NC2524.2
   000725         072900     MOVE "RDF-TEST-14 " TO PAR-NAME.                             NC2524.2 253
   000726         073000     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000727         073100 RNM-INIT.                                                        NC2524.2
   000728         073200     PERFORM END-ROUTINE.                                         NC2524.2 426
   000729         073300     MOVE "RENAMES" TO FEATURE.                                   NC2524.2 249
   000730         073400 RENAM-TEST-1.                                                    NC2524.2
   000731         073500     MOVE "AB" TO NAME1A.                                         NC2524.2 117
   000732         073600     MOVE "CD" TO NAME1B.                                         NC2524.2 118
   000733         073700     IF RENAME4 EQUAL TO "ABCD "                                  NC2524.2 126
   000734      1  073800              PERFORM PASS                                        NC2524.2 401
   000735      1  073900              GO TO RNM-WRITE-1.                                  NC2524.2 743
   000736         074000     MOVE RENAME4 TO COMPUTED-A.                                  NC2524.2 126 264
   000737         074100     MOVE "ABCD" TO CORRECT-A.                                    NC2524.2 278
   000738         074200*    NOTE  CORRECT ANSWER IS   ABCD-BLANK.                        NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300     PERFORM FAIL.                                                NC2524.2 402
   000740         074400     GO TO RNM-WRITE-1.                                           NC2524.2 743
   000741         074500 RNM-DELETE-1.                                                    NC2524.2
   000742         074600     PERFORM DE-LETE.                                             NC2524.2 403
   000743         074700 RNM-WRITE-1.                                                     NC2524.2
   000744         074800     MOVE "RENAM-TEST-1" TO PAR-NAME.                             NC2524.2 253
   000745         074900     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000746         075000 RENAM-TEST-2.                                                    NC2524.2
   000747         075100     MOVE ALL "A" TO RENAMES-DATA.                                NC2524.2 115
   000748         075200     IF RENAME3 EQUAL TO "AAAAAAAAAA"                             NC2524.2 125
   000749      1  075300              PERFORM PASS                                        NC2524.2 401
   000750      1  075400              GO TO RNM-WRITE-2.                                  NC2524.2 757
   000751         075500     MOVE RENAME3 TO COMPUTED-A.                                  NC2524.2 125 264
   000752         075600     MOVE "AAAAAAAAAA" TO CORRECT-A.                              NC2524.2 278
   000753         075700     PERFORM FAIL.                                                NC2524.2 402
   000754         075800     GO TO RNM-WRITE-2.                                           NC2524.2 757
   000755         075900 RNM-DELETE-2.                                                    NC2524.2
   000756         076000     PERFORM DE-LETE.                                             NC2524.2 403
   000757         076100 RNM-WRITE-2.                                                     NC2524.2
   000758         076200     MOVE "RENAM-TEST-2" TO PAR-NAME.                             NC2524.2 253
   000759         076300     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000760         076400 RENAM-TEST-3.                                                    NC2524.2
   000761         076500     MOVE ALL "A" TO RENAMES-DATA.                                NC2524.2 115
   000762         076600     MOVE ALL "X" TO RENAME1.                                     NC2524.2 123
   000763         076700     IF NAME1 NOT EQUAL TO "XXXXX" GO TO RNM-FAIL-3.              NC2524.2 116 771
   000764         076800     IF NAME2 NOT EQUAL TO "XXXXXXXXXX" GO TO RNM-FAIL-3.         NC2524.2 119 771
   000765         076900     IF NAME3 NOT EQUAL TO "XXXXX" GO TO RNM-FAIL-3.              NC2524.2 120 771
   000766         077000     PERFORM PASS.                                                NC2524.2 401
   000767         077100     GO TO RNM-WRITE-3.                                           NC2524.2 775
   000768         077200 RNM-DELETE-3.                                                    NC2524.2
   000769         077300     PERFORM DE-LETE.                                             NC2524.2 403
   000770         077400     GO TO RNM-WRITE-3.                                           NC2524.2 775
   000771         077500 RNM-FAIL-3.                                                      NC2524.2
   000772         077600     MOVE RENAMES-DATA TO COMPUTED-A.                             NC2524.2 115 264
   000773         077700     MOVE "XXXXXXXXXXXXXXXXXXXX" TO CORRECT-A.                    NC2524.2 278
   000774         077800     PERFORM FAIL.                                                NC2524.2 402
   000775         077900 RNM-WRITE-3.                                                     NC2524.2
   000776         078000     MOVE "RENAM-TEST-3" TO PAR-NAME.                             NC2524.2 253
   000777         078100     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000778         078200 RENAM-TEST-4.                                                    NC2524.2
   000779         078300     IF RENAMES-TEST-1 EQUAL TO 123                               NC2524.2 135
   000780      1  078400         PERFORM PASS                                             NC2524.2 401
   000781      1  078500         GO TO RENAM-WRITE-4.                                     NC2524.2 788
   000782         078600     MOVE RENAMES-TEST-1 TO COMPUTED-A.                           NC2524.2 135 264
   000783         078700     MOVE 123 TO CORRECT-A.                                       NC2524.2 278
   000784         078800     PERFORM FAIL.                                                NC2524.2 402
   000785         078900     GO TO RENAM-WRITE-4.                                         NC2524.2 788
   000786         079000 RENAM-DELETE-4.                                                  NC2524.2
   000787         079100     PERFORM DE-LETE.                                             NC2524.2 403
   000788         079200 RENAM-WRITE-4.                                                   NC2524.2
   000789         079300     MOVE "RENAM-TEST-4" TO PAR-NAME.                             NC2524.2 253
   000790         079400     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000791         079500 RENAM-TEST-5.                                                    NC2524.2
   000792         079600     IF RENAMES-TEST-3 EQUAL TO "X  123"                          NC2524.2 138
   000793      1  079700         PERFORM PASS                                             NC2524.2 401
   000794      1  079800         GO TO RENAM-WRITE-5.                                     NC2524.2 801
   000795         079900     MOVE RENAMES-TEST-3 TO COMPUTED-A.                           NC2524.2 138 264
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000     MOVE "X  123" TO CORRECT-A.                                  NC2524.2 278
   000797         080100     PERFORM FAIL.                                                NC2524.2 402
   000798         080200     GO TO RENAM-WRITE-5.                                         NC2524.2 801
   000799         080300 RENAM-DELETE-5.                                                  NC2524.2
   000800         080400     PERFORM DE-LETE.                                             NC2524.2 403
   000801         080500 RENAM-WRITE-5.                                                   NC2524.2
   000802         080600     MOVE "RENAM-TEST-5" TO PAR-NAME.                             NC2524.2 253
   000803         080700     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000804         080800 RENAM-TEST-6.                                                    NC2524.2
   000805         080900     IF RENAMES-TEST-4 EQUAL TO "X  123"                          NC2524.2 140
   000806      1  081000         PERFORM PASS                                             NC2524.2 401
   000807      1  081100         GO TO RENAM-WRITE-6.                                     NC2524.2 814
   000808         081200     MOVE RENAMES-TEST-4 TO COMPUTED-A.                           NC2524.2 140 264
   000809         081300     MOVE "X  123" TO CORRECT-A.                                  NC2524.2 278
   000810         081400     PERFORM FAIL.                                                NC2524.2 402
   000811         081500     GO TO RENAM-WRITE-6.                                         NC2524.2 814
   000812         081600 RENAM-DELETE-6.                                                  NC2524.2
   000813         081700     PERFORM DE-LETE.                                             NC2524.2 403
   000814         081800 RENAM-WRITE-6.                                                   NC2524.2
   000815         081900     MOVE "RENAM-TEST-6" TO PAR-NAME.                             NC2524.2 253
   000816         082000     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000817         082100 RENAM-TEST-7.                                                    NC2524.2
   000818         082200     IF RENAMES-TEST-2 EQUAL TO "X  "                             NC2524.2 136
   000819      1  082300         PERFORM PASS                                             NC2524.2 401
   000820      1  082400         GO TO RENAM-WRITE-7.                                     NC2524.2 827
   000821         082500     MOVE RENAMES-TEST-2 TO COMPUTED-A.                           NC2524.2 136 264
   000822         082600     MOVE "X  " TO CORRECT-A.                                     NC2524.2 278
   000823         082700     PERFORM FAIL.                                                NC2524.2 402
   000824         082800     GO TO RENAM-WRITE-7.                                         NC2524.2 827
   000825         082900 RENAM-DELETE-7.                                                  NC2524.2
   000826         083000     PERFORM DE-LETE.                                             NC2524.2 403
   000827         083100 RENAM-WRITE-7.                                                   NC2524.2
   000828         083200     MOVE "RENAM-TEST-7" TO PAR-NAME.                             NC2524.2 253
   000829         083300     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000830         083400 RENAM-INIT-C.                                                    NC2524.2
   000831         083500     MOVE     "QUALIFIED RENAMES" TO FEATURE.                     NC2524.2 249
   000832         083600 RENAM-TEST-8.                                                    NC2524.2
   000833         083700     MOVE     "IOWA" TO TAG-1A.                                   NC2524.2 144
   000834         083800     MOVE     "OREGON" TO TAG-1B.                                 NC2524.2 145
   000835         083900     MOVE     "CALIFORNIA" TO RENAME-5 OF T-RENAMES-DATA.         NC2524.2 147 142
   000836         084000     IF       TAG-1 EQUAL TO "CALIFORNIA"                         NC2524.2 143
   000837      1  084100              PERFORM PASS GO TO RENAM-WRITE-8.                   NC2524.2 401 846
   000838         084200     GO       TO RENAM-FAIL-8.                                    NC2524.2 842
   000839         084300 RENAM-DELETE-8.                                                  NC2524.2
   000840         084400     PERFORM  DE-LETE.                                            NC2524.2 403
   000841         084500     GO       TO RENAM-WRITE-8.                                   NC2524.2 846
   000842         084600 RENAM-FAIL-8.                                                    NC2524.2
   000843         084700     PERFORM FAIL.                                                NC2524.2 402
   000844         084800     MOVE     TAG-1 TO COMPUTED-A.                                NC2524.2 143 264
   000845         084900     MOVE     "CALIFORNIA" TO CORRECT-A.                          NC2524.2 278
   000846         085000 RENAM-WRITE-8.                                                   NC2524.2
   000847         085100     MOVE     "RENAM-TEST-8 " TO PAR-NAME.                        NC2524.2 253
   000848         085200     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   000849         085300 RENAM-TEST-9.                                                    NC2524.2
   000850         085400     IF       UNIT-1 EQUAL TO "VERMONTOHIO"                       NC2524.2 150
   000851      1  085500              PERFORM PASS GO TO RENAM-WRITE-9.                   NC2524.2 401 862
   000852         085600*        NOTE THIS TEST FURTHER CHECKS THE RESULTS OF             NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700*             THE PREVIOUS TEST - THIS ITEM SHOULD BE UNCHANGED.  NC2524.2
   000854         085800     GO       TO RENAM-FAIL-9.                                    NC2524.2 858
   000855         085900 RENAM-DELETE-9.                                                  NC2524.2
   000856         086000     PERFORM  DE-LETE.                                            NC2524.2 403
   000857         086100     GO       TO RENAM-WRITE-9.                                   NC2524.2 862
   000858         086200 RENAM-FAIL-9.                                                    NC2524.2
   000859         086300     PERFORM FAIL.                                                NC2524.2 402
   000860         086400     MOVE     UNIT-1 TO COMPUTED-A.                               NC2524.2 150 264
   000861         086500     MOVE     "VERMONTOHIO" TO CORRECT-A.                         NC2524.2 278
   000862         086600 RENAM-WRITE-9.                                                   NC2524.2
   000863         086700     MOVE     "RENAM-TEST-9 " TO PAR-NAME.                        NC2524.2 253
   000864         086800     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   000865         086900 RENAM-TEST-10.                                                   NC2524.2
   000866         087000     MOVE     "IOWAOREGONFLORIDA" TO T-RENAMES-DATA.              NC2524.2 142
   000867         087100     IF       RENAME-6 IN T-RENAMES-DATA EQUAL TO                 NC2524.2 148 142
   000868         087200              "IOWAOREGONFLORIDA"                                 NC2524.2
   000869      1  087300              PERFORM PASS GO TO RENAM-WRITE-10.                  NC2524.2 401 878
   000870         087400     GO       TO RENAM-FAIL-10.                                   NC2524.2 874
   000871         087500 RENAM-DELETE-10.                                                 NC2524.2
   000872         087600     PERFORM  DE-LETE.                                            NC2524.2 403
   000873         087700     GO       TO RENAM-WRITE-10.                                  NC2524.2 878
   000874         087800 RENAM-FAIL-10.                                                   NC2524.2
   000875         087900     PERFORM FAIL.                                                NC2524.2 402
   000876         088000     MOVE    RENAME-6 IN T-RENAMES-DATA TO COMPUTED-A.            NC2524.2 148 142 264
   000877         088100     MOVE   "IOWAOREGONFLORIDA" TO CORRECT-A.                     NC2524.2 278
   000878         088200 RENAM-WRITE-10.                                                  NC2524.2
   000879         088300     MOVE   "RENAM-TEST-10" TO PAR-NAME.                          NC2524.2 253
   000880         088400     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   000881         088500 RENAM-TEST-11.                                                   NC2524.2
   000882         088600     MOVE   "BOSTO" TO ITEM-1.                                    NC2524.2 157
   000883         088700     MOVE   "N M" TO TABLE-ITEM-2 (1).                            NC2524.2 159
   000884         088800     MOVE   "ASS" TO TABLE-ITEM-2 (2).                            NC2524.2 159
   000885         088900     MOVE   "ACH" TO TABLE-ITEM-2 (3).                            NC2524.2 159
   000886         089000     MOVE   "USE" TO TABLE-ITEM-2 (4).                            NC2524.2 159
   000887         089100     MOVE   "TTS" TO TABLE-ITEM-2 (5).                            NC2524.2 159
   000888         089200     IF      RENAME-7 EQUAL TO "BOSTON MASSACHUSETTS"             NC2524.2 160
   000889      1  089300             PERFORM PASS GO TO RENAM-WRITE-11.                   NC2524.2 401 898
   000890         089400     GO      TO RENAM-FAIL-11.                                    NC2524.2 894
   000891         089500 RENAM-DELETE-11.                                                 NC2524.2
   000892         089600     PERFORM  DE-LETE.                                            NC2524.2 403
   000893         089700     GO       TO RENAM-WRITE-11.                                  NC2524.2 898
   000894         089800 RENAM-FAIL-11.                                                   NC2524.2
   000895         089900     PERFORM FAIL.                                                NC2524.2 402
   000896         090000     MOVE     RENAME-7 TO COMPUTED-A.                             NC2524.2 160 264
   000897         090100     MOVE     "BOSTON MASSACHUSETTS" TO CORRECT-A.                NC2524.2 278
   000898         090200 RENAM-WRITE-11.                                                  NC2524.2
   000899         090300     MOVE     "RENAMES A TABLE" TO FEATURE.                       NC2524.2 249
   000900         090400     MOVE     "RENAM-TEST-11" TO PAR-NAME.                        NC2524.2 253
   000901         090500     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   000902         090600 RENAM-INIT-D.                                                    NC2524.2
   000903         090700     MOVE     "RENAMED DATA ---" TO FEATURE.                      NC2524.2 249
   000904         090800     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   000905         090900 RENAM-TEST-12.                                                   NC2524.2
   000906         091000     MOVE     SPACE TO W-RENAMES-DATA.                            NC2524.2 IMP 161
   000907         091100     MOVE     12.3 TO WIDGET-1.                                   NC2524.2 162
   000908         091200     MOVE     45678.9 TO WIDGET-2.                                NC2524.2 163
   000909         091300     MOVE     ZERO TO WIDGET-3.                                   NC2524.2 IMP 164
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091400     IF       RENAME-8 EQUAL TO "123*45,678.900000"               NC2524.2 167
   000911      1  091500              PERFORM PASS GO TO RENAM-WRITE-12.                  NC2524.2 401 920
   000912         091600     GO       TO RENAM-FAIL-12.                                   NC2524.2 916
   000913         091700 RENAM-DELETE-12.                                                 NC2524.2
   000914         091800     PERFORM  DE-LETE.                                            NC2524.2 403
   000915         091900     GO       TO RENAM-WRITE-12.                                  NC2524.2 920
   000916         092000 RENAM-FAIL-12.                                                   NC2524.2
   000917         092100     PERFORM FAIL.                                                NC2524.2 402
   000918         092200     MOVE     RENAME-8 TO COMPUTED-A.                             NC2524.2 167 264
   000919         092300     MOVE     "123*45,678.900000" TO CORRECT-A.                   NC2524.2 278
   000920         092400 RENAM-WRITE-12.                                                  NC2524.2
   000921         092500     MOVE     "  GROUP COMPARISON" TO FEATURE                     NC2524.2 249
   000922         092600     MOVE     "RENAM-TEST-12" TO PAR-NAME.                        NC2524.2 253
   000923         092700     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   000924         092800 RENAM-TEST-13.                                                   NC2524.2
   000925         092900     MOVE     SPACE TO W-RENAMES-DATA.                            NC2524.2 IMP 161
   000926         093000     MOVE     "123456789" TO RENAME-10.                           NC2524.2 169
   000927         093100     IF       RENAME-9 EQUAL TO "    12345678"                    NC2524.2 168
   000928      1  093200              PERFORM PASS GO TO RENAM-WRITE-13.                  NC2524.2 401 937
   000929         093300     GO       TO RENAM-FAIL-13.                                   NC2524.2 933
   000930         093400 RENAM-DELETE-13.                                                 NC2524.2
   000931         093500     PERFORM  DE-LETE.                                            NC2524.2 403
   000932         093600     GO       TO RENAM-WRITE-13.                                  NC2524.2 937
   000933         093700 RENAM-FAIL-13.                                                   NC2524.2
   000934         093800     PERFORM FAIL.                                                NC2524.2 402
   000935         093900     MOVE     RENAME-9 TO COMPUTED-A                              NC2524.2 168 264
   000936         094000     MOVE     "    12345678" TO CORRECT-A.                        NC2524.2 278
   000937         094100 RENAM-WRITE-13.                                                  NC2524.2
   000938         094200     MOVE     "  GRP MOVE, COMPARE" TO FEATURE.                   NC2524.2 249
   000939         094300     MOVE     "RENAM-TEST-13" TO PAR-NAME.                        NC2524.2 253
   000940         094400     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   000941         094500 RENAM-TEST-14.                                                   NC2524.2
   000942         094600     MOVE     SPACE TO W-RENAMES-DATA.                            NC2524.2 IMP 161
   000943         094700     MOVE     123456 TO RENAME-10                                 NC2524.2 169
   000944         094800     IF       WIDGET-4 EQUAL TO 1234                              NC2524.2 165
   000945      1  094900              PERFORM PASS GO TO RENAM-WRITE-14.                  NC2524.2 401 954
   000946         095000     GO       TO RENAM-FAIL-14.                                   NC2524.2 950
   000947         095100 RENAM-DELETE-14.                                                 NC2524.2
   000948         095200     PERFORM  DE-LETE.                                            NC2524.2 403
   000949         095300     GO       TO RENAM-WRITE-14.                                  NC2524.2 954
   000950         095400 RENAM-FAIL-14.                                                   NC2524.2
   000951         095500     PERFORM FAIL.                                                NC2524.2 402
   000952         095600     MOVE     WIDGET-4 TO COMPUTED-N.                             NC2524.2 165 265
   000953         095700     MOVE     1234 TO CORRECT-N.                                  NC2524.2 279
   000954         095800 RENAM-WRITE-14.                                                  NC2524.2
   000955         095900     MOVE     "  GROUP MOVE" TO FEATURE.                          NC2524.2 249
   000956         096000     MOVE     "RENAM-TEST-14" TO PAR-NAME.                        NC2524.2 253
   000957         096100     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   000958         096200 RENAM-TEST-15.                                                   NC2524.2
   000959         096300     MOVE     SPACE TO W-RENAMES-DATA.                            NC2524.2 IMP 161
   000960         096400     MOVE     234.5 TO RENAME-11.                                 NC2524.2 170
   000961         096500     IF       WIDGET-2 EQUAL TO "****234.50"                      NC2524.2 163
   000962      1  096600              PERFORM PASS GO TO RENAM-WRITE-15.                  NC2524.2 401 971
   000963         096700     GO       TO RENAM-FAIL-15.                                   NC2524.2 967
   000964         096800 RENAM-DELETE-15.                                                 NC2524.2
   000965         096900     PERFORM  DE-LETE.                                            NC2524.2 403
   000966         097000     GO       TO RENAM-WRITE-15.                                  NC2524.2 971
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097100 RENAM-FAIL-15.                                                   NC2524.2
   000968         097200     PERFORM FAIL.                                                NC2524.2 402
   000969         097300     MOVE     WIDGET-2 TO COMPUTED-A.                             NC2524.2 163 264
   000970         097400     MOVE     "****234.50" TO CORRECT-A.                          NC2524.2 278
   000971         097500 RENAM-WRITE-15.                                                  NC2524.2
   000972         097600     MOVE     "  EDITED MOVE" TO FEATURE.                         NC2524.2 249
   000973         097700     MOVE     "RENAM-TEST-15" TO PAR-NAME.                        NC2524.2 253
   000974         097800     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   000975         097900 RENAM-INIT-E.                                                    NC2524.2
   000976         098000     MOVE     "  ADD, SIZE ERROR" TO FEATURE.                     NC2524.2 249
   000977         098100*        NOTE THE NEXT TWO TESTS ARE INTERRELATED.                NC2524.2
   000978         098200 RENAM-TEST-16.                                                   NC2524.2
   000979         098300     MOVE     8000 TO WIDGET-4.                                   NC2524.2 165
   000980         098400     ADD      3500 TO RENAME-12 ON SIZE ERROR                     NC2524.2 171
   000981      1  098500              PERFORM PASS GO TO RENAM-WRITE-16.                  NC2524.2 401 989
   000982         098600     GO       TO RENAM-FAIL-16.                                   NC2524.2 986
   000983         098700 RENAM-DELETE-16.                                                 NC2524.2
   000984         098800     PERFORM  DE-LETE.                                            NC2524.2 403
   000985         098900     GO       TO RENAM-WRITE-16.                                  NC2524.2 989
   000986         099000 RENAM-FAIL-16.                                                   NC2524.2
   000987         099100     PERFORM FAIL.                                                NC2524.2 402
   000988         099200     MOVE     "SIZE ERROR DID NOT OCCUR" TO RE-MARK.              NC2524.2 258
   000989         099300 RENAM-WRITE-16.                                                  NC2524.2
   000990         099400     MOVE     "RENAM-TEST-16" TO PAR-NAME.                        NC2524.2 253
   000991         099500     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   000992         099600 RENAM-TEST-17.                                                   NC2524.2
   000993         099700     IF       RENAME-12 EQUAL TO 8000                             NC2524.2 171
   000994      1  099800              PERFORM PASS GO TO RENAM-WRITE-17.                  NC2524.2 401 1003
   000995         099900     GO       TO RENAM-FAIL-17.                                   NC2524.2 999
   000996         100000 RENAM-DELETE-17.                                                 NC2524.2
   000997         100100     PERFORM  DE-LETE.                                            NC2524.2 403
   000998         100200     GO       TO RENAM-WRITE-17.                                  NC2524.2 1003
   000999         100300 RENAM-FAIL-17.                                                   NC2524.2
   001000         100400     PERFORM FAIL.                                                NC2524.2 402
   001001         100500     MOVE     RENAME-12 TO COMPUTED-N.                            NC2524.2 171 265
   001002         100600     MOVE     8000 TO CORRECT-N.                                  NC2524.2 279
   001003         100700 RENAM-WRITE-17.                                                  NC2524.2
   001004         100800     MOVE     "RENAM-TEST-17" TO PAR-NAME.                        NC2524.2 253
   001005         100900     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001006         101000 RENAM-TEST-18.                                                   NC2524.2
   001007         101100     MOVE     SPACE TO U-RENAMES-DATA.                            NC2524.2 IMP 149
   001008         101200     MOVE     "CHICAGO ILLINOIS" TO RENAME-5 OF U-RENAMES-DATA.   NC2524.2 154 149
   001009         101300     IF       U-RENAMES-DATA EQUAL TO "CHICAGO ILL     "          NC2524.2 149
   001010      1  101400              PERFORM PASS GO TO RENAM-WRITE-18.                  NC2524.2 401 1020
   001011         101500     PERFORM  FAIL.                                               NC2524.2 402
   001012         101600     GO       TO RENAM-FAIL-18.                                   NC2524.2 1016
   001013         101700 RENAM-DELETE-18.                                                 NC2524.2
   001014         101800     PERFORM  DE-LETE.                                            NC2524.2 403
   001015         101900     GO       TO RENAM-WRITE-18.                                  NC2524.2 1020
   001016         102000 RENAM-FAIL-18.                                                   NC2524.2
   001017         102100     PERFORM  FAIL.                                               NC2524.2 402
   001018         102200     MOVE     U-RENAMES-DATA TO COMPUTED-A.                       NC2524.2 149 264
   001019         102300     MOVE     "CHICAGO ILL     " TO CORRECT-A.                    NC2524.2 278
   001020         102400 RENAM-WRITE-18.                                                  NC2524.2
   001021         102500     MOVE     "  THROUGH" TO FEATURE.                             NC2524.2 249
   001022         102600     MOVE     "RENAM-TEST-18" TO PAR-NAME.                        NC2524.2 253
   001023         102700     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102800*                                                                 NC2524.2
   001025         102900 COMPUTING SECTION.                                               NC2524.2
   001026         103000 COMPUTE-INIT.                                                    NC2524.2
   001027         103100     MOVE SPACES TO TEST-RESULTS.                                 NC2524.2 IMP 247
   001028         103200     PERFORM END-ROUTINE.                                         NC2524.2 426
   001029         103300     MOVE "THE COMPUTED RESULT FOR THE FOLLOWING TESTS"           NC2524.2
   001030         103400             TO RE-MARK.                                          NC2524.2 258
   001031         103500     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001032         103600     MOVE "IS ALLOWED TO DEVIATE FROM THE INDICATED"              NC2524.2
   001033         103700             TO RE-MARK.                                          NC2524.2 258
   001034         103800     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001035         103900     MOVE "CORRECT RESULT BY" TO RE-MARK.                         NC2524.2 258
   001036         104000     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001037         104100     MOVE "+ OR - (CORRECT RESULT * (.2 ** 5))."                  NC2524.2
   001038         104200             TO RE-MARK.                                          NC2524.2 258
   001039         104300     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001040         104400     MOVE "COMPUTE        " TO FEATURE.                           NC2524.2 249
   001041         104500 COMP-TEST-1.                                                     NC2524.2
   001042         104600     COMPUTE COMPUTE-1 = COMPUTE-1A.                              NC2524.2 92 93
   001043         104700     IF ( COMPUTE-1 < 654.20038) AND                              NC2524.2 92
   001044         104800        ( COMPUTE-1 > 654.17422) THEN                             NC2524.2 92
   001045      1  104900              PERFORM PASS                                        NC2524.2 401
   001046      1  105000              GO TO COMP-WRITE-1.                                 NC2524.2 1053
   001047         105100     PERFORM FAIL.                                                NC2524.2 402
   001048         105200     MOVE COMPUTE-1 TO COMPUTED-N.                                NC2524.2 92 265
   001049         105300     MOVE "+654.1873" TO CORRECT-A.                               NC2524.2 278
   001050         105400     GO TO COMP-WRITE-1.                                          NC2524.2 1053
   001051         105500 COMP-DELETE-1.                                                   NC2524.2
   001052         105600     PERFORM DE-LETE.                                             NC2524.2 403
   001053         105700 COMP-WRITE-1.                                                    NC2524.2
   001054         105800     MOVE "COMP-TEST-1" TO PAR-NAME.                              NC2524.2 253
   001055         105900     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001056         106000 COMP-TEST-2.                                                     NC2524.2
   001057         106100     COMPUTE COMPUTE-2 = 2233.9                                   NC2524.2 94
   001058         106200     IF ( COMPUTE-2 < 2233.94468) AND                             NC2524.2 94
   001059         106300         ( COMPUTE-2 > 2233.85532) THEN                           NC2524.2 94
   001060      1  106400              PERFORM PASS                                        NC2524.2 401
   001061      1  106500              GO TO COMP-WRITE-2.                                 NC2524.2 1068
   001062         106600     PERFORM FAIL.                                                NC2524.2 402
   001063         106700     MOVE COMPUTE-2 TO COMPUTED-N.                                NC2524.2 94 265
   001064         106800     MOVE "+2233.9" TO CORRECT-A.                                 NC2524.2 278
   001065         106900     GO TO COMP-WRITE-2.                                          NC2524.2 1068
   001066         107000 COMP-DELETE-2.                                                   NC2524.2
   001067         107100     PERFORM DE-LETE.                                             NC2524.2 403
   001068         107200 COMP-WRITE-2.                                                    NC2524.2
   001069         107300     MOVE "COMP-TEST-2" TO PAR-NAME.                              NC2524.2 253
   001070         107400     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001071         107500 COMP-TEST-3.                                                     NC2524.2
   001072         107600     COMPUTE COMPUTE-3 = COMPUTE-3A - COMPUTE-3B.                 NC2524.2 95 96 97
   001073         107700     IF ( COMPUTE-3 NOT < 52.39105) AND                           NC2524.2 95
   001074         107800        ( COMPUTE-3 NOT > 52.38895) THEN                          NC2524.2 95
   001075      1  107900              PERFORM FAIL                                        NC2524.2 402
   001076      1  108000               MOVE COMPUTE-3 TO COMPUTED-N                       NC2524.2 95 265
   001077      1  108100              MOVE "+52.39" TO CORRECT-A                          NC2524.2 278
   001078      1  108200              GO TO COMP-WRITE-3.                                 NC2524.2 1083
   001079         108300     PERFORM PASS.                                                NC2524.2 401
   001080         108400     GO TO COMP-WRITE-3.                                          NC2524.2 1083
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108500 COMP-DELETE-3.                                                   NC2524.2
   001082         108600     PERFORM DE-LETE.                                             NC2524.2 403
   001083         108700 COMP-WRITE-3.                                                    NC2524.2
   001084         108800     MOVE "COMP-TEST-3" TO PAR-NAME.                              NC2524.2 253
   001085         108900     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001086         109000 COMP-TEST-4.                                                     NC2524.2
   001087         109100     COMPUTE COMPUTE-4 = COMPUTE-4A + COMPUTE-4B.                 NC2524.2 98 99 100
   001088         109200        IF COMPUTE-4 NOT = 341                                    NC2524.2 98
   001089      1  109300              PERFORM FAIL                                        NC2524.2 402
   001090      1  109400              MOVE COMPUTE-4 TO COMPUTED-N                        NC2524.2 98 265
   001091      1  109500              MOVE "+341" TO CORRECT-A                            NC2524.2 278
   001092      1  109600              GO TO COMP-WRITE-4.                                 NC2524.2 1097
   001093         109700     PERFORM PASS.                                                NC2524.2 401
   001094         109800     GO TO COMP-WRITE-4.                                          NC2524.2 1097
   001095         109900 COMP-DELETE-4.                                                   NC2524.2
   001096         110000     PERFORM DE-LETE.                                             NC2524.2 403
   001097         110100 COMP-WRITE-4.                                                    NC2524.2
   001098         110200     MOVE "COMP-TEST-4" TO PAR-NAME.                              NC2524.2 253
   001099         110300     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001100         110400 COMP-TEST-5.                                                     NC2524.2
   001101         110500     COMPUTE COMPUTE-5 = COMPUTE-5A * 36.1                        NC2524.2 101 102
   001102         110600     IF ( COMPUTE-5 > 400.71801) OR                               NC2524.2 101
   001103         110700        ( COMPUTE-5 < 400.70199) THEN                             NC2524.2 101
   001104      1  110800              PERFORM FAIL                                        NC2524.2 402
   001105      1  110900              MOVE COMPUTE-5 TO COMPUTED-N                        NC2524.2 101 265
   001106      1  111000              MOVE "+400.71" TO CORRECT-A                         NC2524.2 278
   001107      1  111100              GO TO COMP-WRITE-5.                                 NC2524.2 1112
   001108         111200     PERFORM PASS.                                                NC2524.2 401
   001109         111300     GO TO COMP-WRITE-5.                                          NC2524.2 1112
   001110         111400 COMP-DELETE-5.                                                   NC2524.2
   001111         111500     PERFORM DE-LETE.                                             NC2524.2 403
   001112         111600 COMP-WRITE-5.                                                    NC2524.2
   001113         111700     MOVE "COMP-TEST-5" TO PAR-NAME.                              NC2524.2 253
   001114         111800     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001115         111900 COMP-TEST-6.                                                     NC2524.2
   001116         112000     COMPUTE COMPUTE-6 = COMPUTE-6A / 6.0                         NC2524.2 103 104
   001117         112100     IF ( COMPUTE-6 > 62.40125) OR                                NC2524.2 103
   001118         112200        ( COMPUTE-6 < 62.39875) THEN                              NC2524.2 103
   001119      1  112300              PERFORM FAIL                                        NC2524.2 402
   001120      1  112400              MOVE COMPUTE-6 TO COMPUTED-N                        NC2524.2 103 265
   001121      1  112500              MOVE "+062.40" TO CORRECT-A                         NC2524.2 278
   001122      1  112600              GO TO COMP-WRITE-6.                                 NC2524.2 1127
   001123         112700     PERFORM PASS.                                                NC2524.2 401
   001124         112800     GO TO COMP-WRITE-6.                                          NC2524.2 1127
   001125         112900 COMP-DELETE-6.                                                   NC2524.2
   001126         113000     PERFORM DE-LETE.                                             NC2524.2 403
   001127         113100 COMP-WRITE-6.                                                    NC2524.2
   001128         113200     MOVE "COMP-TEST-6" TO PAR-NAME.                              NC2524.2 253
   001129         113300     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001130         113400 COMP-TEST-7.                                                     NC2524.2
   001131         113500     COMPUTE COMPUTE-7 = 2.0 ** 4.                                NC2524.2 105
   001132         113600        IF COMPUTE-7 = 16                                         NC2524.2 105
   001133      1  113700              PERFORM PASS                                        NC2524.2 401
   001134      1  113800              GO TO COMP-WRITE-7.                                 NC2524.2 1141
   001135         113900     PERFORM FAIL.                                                NC2524.2 402
   001136         114000     MOVE COMPUTE-7 TO COMPUTED-N.                                NC2524.2 105 265
   001137         114100     MOVE "+16" TO CORRECT-A.                                     NC2524.2 278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114200     GO TO COMP-WRITE-7.                                          NC2524.2 1141
   001139         114300 COMP-DELETE-7.                                                   NC2524.2
   001140         114400     PERFORM DE-LETE.                                             NC2524.2 403
   001141         114500 COMP-WRITE-7.                                                    NC2524.2
   001142         114600     MOVE "COMP-TEST-7" TO PAR-NAME.                              NC2524.2 253
   001143         114700     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001144         114800 COMP-TEST-8.                                                     NC2524.2
   001145         114900     COMPUTE COMPUTE-8 = (((24.0 + 1) * (60 - 10)) / 125) ** 2.   NC2524.2 106
   001146         115000             IF COMPUTE-8 = 100                                   NC2524.2 106
   001147      1  115100          PERFORM PASS                                            NC2524.2 401
   001148      1  115200          GO TO COMP-WRITE-8.                                     NC2524.2 1155
   001149         115300     PERFORM FAIL.                                                NC2524.2 402
   001150         115400     MOVE COMPUTE-8 TO COMPUTED-N.                                NC2524.2 106 265
   001151         115500     MOVE "+100" TO CORRECT-A.                                    NC2524.2 278
   001152         115600     GO TO COMP-WRITE-8.                                          NC2524.2 1155
   001153         115700 COMP-DELETE-8.                                                   NC2524.2
   001154         115800     PERFORM DE-LETE.                                             NC2524.2 403
   001155         115900 COMP-WRITE-8.                                                    NC2524.2
   001156         116000     MOVE "COMP-TEST-8" TO PAR-NAME.                              NC2524.2 253
   001157         116100     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001158         116200 COMP-TEST-9.                                                     NC2524.2
   001159         116300     COMPUTE COMPUTE-9 ROUNDED = COMPUTE-6A * 7.0                 NC2524.2 107 104
   001160         116400     IF (COMPUTE-9 > 2621.05242) OR                               NC2524.2 107
   001161         116500        (COMPUTE-9 < 2620.94758) THEN                             NC2524.2 107
   001162      1  116600              PERFORM FAIL                                        NC2524.2 402
   001163      1  116700              MOVE COMPUTE-9 TO COMPUTED-N                        NC2524.2 107 265
   001164      1  116800              MOVE "+2621" TO CORRECT-A                           NC2524.2 278
   001165      1  116900              GO TO COMP-WRITE-9.                                 NC2524.2 1170
   001166         117000     PERFORM PASS.                                                NC2524.2 401
   001167         117100     GO TO COMP-WRITE-9.                                          NC2524.2 1170
   001168         117200 COMP-DELETE-9.                                                   NC2524.2
   001169         117300     PERFORM DE-LETE.                                             NC2524.2 403
   001170         117400 COMP-WRITE-9.                                                    NC2524.2
   001171         117500     MOVE "COMP-TEST-9" TO PAR-NAME.                              NC2524.2 253
   001172         117600     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001173         117700 COMP-TEST-10.                                                    NC2524.2
   001174         117800     COMPUTE COMPUTE-10 = COMPUTE-1A + COMPUTE-6A ON SIZE ERROR   NC2524.2 108 93 104
   001175      1  117900     MOVE "R" TO XRAY.                                            NC2524.2 68
   001176         118000     IF XRAY EQUAL TO "R"                                         NC2524.2 68
   001177      1  118100              PERFORM PASS                                        NC2524.2 401
   001178      1  118200              GO TO COMP-WRITE-10.                                NC2524.2 1184
   001179         118300     PERFORM FAIL.                                                NC2524.2 402
   001180         118400     MOVE "OSE NOT EXECUTED" TO RE-MARK.                          NC2524.2 258
   001181         118500     GO TO COMP-WRITE-10.                                         NC2524.2 1184
   001182         118600 COMP-DELETE-10.                                                  NC2524.2
   001183         118700     PERFORM DE-LETE.                                             NC2524.2 403
   001184         118800 COMP-WRITE-10.                                                   NC2524.2
   001185         118900     MOVE "COMP-TEST-10" TO PAR-NAME.                             NC2524.2 253
   001186         119000     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001187         119100 COMP-TEST-11.                                                    NC2524.2
   001188         119200     IF (COMPUTE-10 > 0.00002) OR                                 NC2524.2 108

 ==001188==> IGYPG3174-W The result of the comparison of operand -0.00002 and an arithmetic
                         expression is known at compile time, based on the attributes of the
                         operands.  Unconditional code was generated.

   001189         119300        (COMPUTE-10 < -0.00002)                                   NC2524.2 108
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001190      1  119400              PERFORM FAIL                                        NC2524.2 402
   001191      1  119500              MOVE COMPUTE-10 TO COMPUTED-N                       NC2524.2 108 265
   001192      1  119600              MOVE ZERO TO CORRECT-N                              NC2524.2 IMP 279
   001193      1  119700              GO TO COMP-WRITE-11.                                NC2524.2 1198
   001194         119800     PERFORM PASS.                                                NC2524.2 401
   001195         119900     GO TO COMP-WRITE-11.                                         NC2524.2 1198
   001196         120000 COMP-DELETE-11.                                                  NC2524.2
   001197         120100     PERFORM DE-LETE.                                             NC2524.2 403
   001198         120200 COMP-WRITE-11.                                                   NC2524.2
   001199         120300     MOVE "COMP-TEST-11" TO PAR-NAME.                             NC2524.2 253
   001200         120400     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001201         120500 COMP-TEST-12.                                                    NC2524.2
   001202         120600     COMPUTE COMPUTE-11 = COMPUTE-11A + COMPUTE-11B - 121.6       NC2524.2 109 110 111
   001203         120700     IF ( COMPUTE-11 < 718.51437) AND                             NC2524.2 109
   001204         120800        ( COMPUTE-11 > 718.48563) THEN                            NC2524.2 109
   001205      1  120900              PERFORM PASS                                        NC2524.2 401
   001206      1  121000              GO TO COMP-WRITE-12.                                NC2524.2 1213
   001207         121100     PERFORM FAIL.                                                NC2524.2 402
   001208         121200     MOVE COMPUTE-11 TO COMPUTED-N.                               NC2524.2 109 265
   001209         121300     MOVE "+718.5" TO CORRECT-A.                                  NC2524.2 278
   001210         121400     GO TO COMP-WRITE-12.                                         NC2524.2 1213
   001211         121500 COMP-DELETE-12.                                                  NC2524.2
   001212         121600     PERFORM DE-LETE.                                             NC2524.2 403
   001213         121700 COMP-WRITE-12.                                                   NC2524.2
   001214         121800     MOVE "COMP-TEST-12" TO PAR-NAME.                             NC2524.2 253
   001215         121900     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001216         122000 COMP-TEST-13.                                                    NC2524.2
   001217         122100     COMPUTE COMPUTE-12 = COMPUTE-12A * 5.1 / 281.7.              NC2524.2 112 113
   001218         122200     IF (COMPUTE-12 < 6.09012) AND                                NC2524.2 112
   001219         122300        (COMPUTE-12 > 6.08988) THEN                               NC2524.2 112
   001220      1  122400              PERFORM PASS                                        NC2524.2 401
   001221      1  122500              GO TO COMP-WRITE-13.                                NC2524.2 1228
   001222         122600     PERFORM FAIL.                                                NC2524.2 402
   001223         122700     MOVE COMPUTE-12 TO COMPUTED-N.                               NC2524.2 112 265
   001224         122800     MOVE "+6.09" TO CORRECT-A.                                   NC2524.2 278
   001225         122900     GO TO COMP-WRITE-13.                                         NC2524.2 1228
   001226         123000 COMP-DELETE-13.                                                  NC2524.2
   001227         123100     PERFORM DE-LETE.                                             NC2524.2 403
   001228         123200 COMP-WRITE-13.                                                   NC2524.2
   001229         123300     MOVE "COMP-TEST-13" TO PAR-NAME.                             NC2524.2 253
   001230         123400     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001231         123500 COMPUTE-ROUTINE SECTION.                                         NC2524.2
   001232         123600 COMPUTE-TEST.                                                    NC2524.2
   001233         123700     MOVE "COMPUTE" TO FEATURE.                                   NC2524.2 249
   001234         123800     MOVE ZERO TO W-1.                                            NC2524.2 IMP 69
   001235         123900     MOVE ZERO TO W-2.                                            NC2524.2 IMP 70
   001236         124000 COMP-TEST-14.                                                    NC2524.2
   001237         124100     COMPUTE W-1 = NINE.                                          NC2524.2 69 85
   001238         124200        IF W-1 = 9                                                NC2524.2 69
   001239      1  124300              PERFORM PASS                                        NC2524.2 401
   001240      1  124400              GO TO COMP-WRITE-14.                                NC2524.2 1248
   001241         124500     PERFORM FAIL.                                                NC2524.2 402
   001242         124600     MOVE W-1 TO COMPUTED-A.                                      NC2524.2 69 264
   001243         124700     MOVE 9 TO W-1.                                               NC2524.2 69
   001244         124800     MOVE 9 TO CORRECT-A.                                         NC2524.2 278
   001245         124900     GO TO COMP-WRITE-14.                                         NC2524.2 1248
   001246         125000 COMP-DELETE-14.                                                  NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001247         125100     PERFORM DE-LETE.                                             NC2524.2 403
   001248         125200 COMP-WRITE-14.                                                   NC2524.2
   001249         125300     MOVE "COMP-TEST-14" TO PAR-NAME.                             NC2524.2 253
   001250         125400     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001251         125500 COMP-TEST-15.                                                    NC2524.2
   001252         125600     COMPUTE W-2 = W-1 + 20.                                      NC2524.2 70 69
   001253         125700        IF W-2 = 29                                               NC2524.2 70
   001254      1  125800              PERFORM PASS                                        NC2524.2 401
   001255      1  125900              GO TO COMP-WRITE-15.                                NC2524.2 1263
   001256         126000     PERFORM FAIL.                                                NC2524.2 402
   001257         126100     MOVE W-2 TO COMPUTED-N.                                      NC2524.2 70 265
   001258         126200     MOVE "+29" TO CORRECT-A.                                     NC2524.2 278
   001259         126300     MOVE 29 TO W-2.                                              NC2524.2 70
   001260         126400     GO TO COMP-WRITE-15.                                         NC2524.2 1263
   001261         126500 COMP-DELETE-15.                                                  NC2524.2
   001262         126600     PERFORM DE-LETE.                                             NC2524.2 403
   001263         126700 COMP-WRITE-15.                                                   NC2524.2
   001264         126800     MOVE "COMP-TEST-15" TO PAR-NAME.                             NC2524.2 253
   001265         126900     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001266         127000 COMP-TEST-16.                                                    NC2524.2
   001267         127100     MOVE ZERO TO W-11.                                           NC2524.2 IMP 74
   001268         127200     COMPUTE W-11 = W-1 - W-2.                                    NC2524.2 74 69 70
   001269         127300     IF ( W-11 > -20.00040) AND                                   NC2524.2 74
   001270         127400        ( W-11 < -19.99960) THEN                                  NC2524.2 74
   001271      1  127500              PERFORM PASS                                        NC2524.2 401
   001272      1  127600              GO TO COMP-WRITE-16.                                NC2524.2 1279
   001273         127700     PERFORM FAIL.                                                NC2524.2 402
   001274         127800     MOVE W-11 TO COMPUTED-N.                                     NC2524.2 74 265
   001275         127900     MOVE "-20" TO CORRECT-A.                                     NC2524.2 278
   001276         128000     GO TO COMP-WRITE-16.                                         NC2524.2 1279
   001277         128100 COMP-DELETE-16.                                                  NC2524.2
   001278         128200     PERFORM DE-LETE.                                             NC2524.2 403
   001279         128300 COMP-WRITE-16.                                                   NC2524.2
   001280         128400     MOVE "COMP-TEST-16" TO PAR-NAME.                             NC2524.2 253
   001281         128500     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001282         128600 COMP-TEST-17.                                                    NC2524.2
   001283         128700     MOVE ZERO TO W-3.                                            NC2524.2 IMP 71
   001284         128800     COMPUTE W-3 = TEN * 30.                                      NC2524.2 71 86
   001285         128900        IF W-3 = 300                                              NC2524.2 71
   001286      1  129000              PERFORM PASS                                        NC2524.2 401
   001287      1  129100              GO TO COMP-WRITE-17.                                NC2524.2 1294
   001288         129200     PERFORM FAIL.                                                NC2524.2 402
   001289         129300     MOVE W-3 TO COMPUTED-N.                                      NC2524.2 71 265
   001290         129400     MOVE "+300" TO CORRECT-A.                                    NC2524.2 278
   001291         129500     GO TO COMP-WRITE-17.                                         NC2524.2 1294
   001292         129600 COMP-DELETE-17.                                                  NC2524.2
   001293         129700     PERFORM DE-LETE.                                             NC2524.2 403
   001294         129800 COMP-WRITE-17.                                                   NC2524.2
   001295         129900     MOVE "COMP-TEST-17" TO PAR-NAME.                             NC2524.2 253
   001296         130000     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001297         130100 COMP-TEST-18.                                                    NC2524.2
   001298         130200     MOVE ZERO TO W-5.                                            NC2524.2 IMP 72
   001299         130300     COMPUTE W-5 = 42 / SEVEN.                                    NC2524.2 72 83
   001300         130400        IF W-5 = 6                                                NC2524.2 72
   001301      1  130500              PERFORM PASS                                        NC2524.2 401
   001302      1  130600              GO TO COMP-WRITE-18.                                NC2524.2 1309
   001303         130700     PERFORM FAIL.                                                NC2524.2 402
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001304         130800     MOVE W-5 TO COMPUTED-N.                                      NC2524.2 72 265
   001305         130900     MOVE "+6" TO CORRECT-A.                                      NC2524.2 278
   001306         131000     GO TO COMP-WRITE-18.                                         NC2524.2 1309
   001307         131100 COMP-DELETE-18.                                                  NC2524.2
   001308         131200     PERFORM DE-LETE.                                             NC2524.2 403
   001309         131300 COMP-WRITE-18.                                                   NC2524.2
   001310         131400     MOVE "COMP-TEST-18" TO PAR-NAME.                             NC2524.2 253
   001311         131500     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001312         131600 COMP-TEST-19.                                                    NC2524.2
   001313         131700     MOVE ZERO TO W-2.                                            NC2524.2 IMP 70
   001314         131800     COMPUTE W-2 = FOUR ** 3.                                     NC2524.2 70 80
   001315         131900        IF W-2 = 64                                               NC2524.2 70
   001316      1  132000              PERFORM PASS                                        NC2524.2 401
   001317      1  132100              GO TO COMP-WRITE-19.                                NC2524.2 1324
   001318         132200     PERFORM FAIL.                                                NC2524.2 402
   001319         132300     MOVE W-2 TO COMPUTED-N.                                      NC2524.2 70 265
   001320         132400     MOVE "+64" TO CORRECT-A.                                     NC2524.2 278
   001321         132500     GO TO COMP-WRITE-19.                                         NC2524.2 1324
   001322         132600 COMP-DELETE-19.                                                  NC2524.2
   001323         132700     PERFORM DE-LETE.                                             NC2524.2 403
   001324         132800 COMP-WRITE-19.                                                   NC2524.2
   001325         132900     MOVE "COMP-TEST-19" TO PAR-NAME.                             NC2524.2 253
   001326         133000     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001327         133100 COMP-TEST-20.                                                    NC2524.2
   001328         133200     MOVE 555 TO W-3.                                             NC2524.2 71
   001329         133300     COMPUTE W-3 = TWENTY-5 + 101 + 222.                          NC2524.2 71 89
   001330         133400        IF W-3 = 348                                              NC2524.2 71
   001331      1  133500              PERFORM PASS                                        NC2524.2 401
   001332      1  133600              GO TO COMP-WRITE-20.                                NC2524.2 1339
   001333         133700              PERFORM FAIL.                                       NC2524.2 402
   001334         133800              MOVE W-3 TO COMPUTED-N.                             NC2524.2 71 265
   001335         133900              MOVE "+348" TO CORRECT-A.                           NC2524.2 278
   001336         134000     GO TO COMP-WRITE-20.                                         NC2524.2 1339
   001337         134100 COMP-DELETE-20.                                                  NC2524.2
   001338         134200     PERFORM DE-LETE.                                             NC2524.2 403
   001339         134300 COMP-WRITE-20.                                                   NC2524.2
   001340         134400     MOVE "COMP-TEST-20" TO PAR-NAME.                             NC2524.2 253
   001341         134500     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001342         134600 COMP-TEST-21.                                                    NC2524.2
   001343         134700     MOVE ZERO TO W-9.                                            NC2524.2 IMP 73
   001344         134800     COMPUTE W-9 = TWO * (3 + 4).                                 NC2524.2 73 78
   001345         134900        IF W-9 = 14                                               NC2524.2 73
   001346      1  135000              PERFORM PASS                                        NC2524.2 401
   001347      1  135100              GO TO COMP-WRITE-21.                                NC2524.2 1354
   001348         135200     PERFORM FAIL.                                                NC2524.2 402
   001349         135300     MOVE W-9 TO COMPUTED-N.                                      NC2524.2 73 265
   001350         135400     MOVE "+14" TO CORRECT-A.                                     NC2524.2 278
   001351         135500     GO TO COMP-WRITE-21.                                         NC2524.2 1354
   001352         135600 COMP-DELETE-21.                                                  NC2524.2
   001353         135700     PERFORM DE-LETE.                                             NC2524.2 403
   001354         135800 COMP-WRITE-21.                                                   NC2524.2
   001355         135900     MOVE "COMP-TEST-21" TO PAR-NAME.                             NC2524.2 253
   001356         136000     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001357         136100  COMP-TEST-22.                                                   NC2524.2
   001358         136200     MOVE ZERO TO W-9.                                            NC2524.2 IMP 73
   001359         136300     COMPUTE W-9 = (TWO + (3 * FOUR) / (2 * THREE)) ** 2 - 1.     NC2524.2 73 78 80 79
   001360         136400             IF W-9 = 15     PERFORM PASS                         NC2524.2 73 401
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001361      1  136500         GO TO COMP-WRITE-22.                                     NC2524.2 1368
   001362         136600     PERFORM FAIL.                                                NC2524.2 402
   001363         136700     MOVE W-9 TO COMPUTED-N.                                      NC2524.2 73 265
   001364         136800     MOVE "+15" TO CORRECT-A.                                     NC2524.2 278
   001365         136900     GO TO COMP-WRITE-22.                                         NC2524.2 1368
   001366         137000 COMP-DELETE-22.                                                  NC2524.2
   001367         137100     PERFORM DE-LETE.                                             NC2524.2 403
   001368         137200 COMP-WRITE-22.                                                   NC2524.2
   001369         137300     MOVE "COMP-TEST-22" TO PAR-NAME.                             NC2524.2 253
   001370         137400     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001371         137500 COMP-TEST-23.                                                    NC2524.2
   001372         137600     MOVE ZERO TO XRAY.                                           NC2524.2 IMP 68
   001373         137700     MOVE 10 TO W-2.                                              NC2524.2 70
   001374         137800     COMPUTE W-2 = 96 + TWENTY ON SIZE ERROR                      NC2524.2 70 88
   001375      1  137900     MOVE 8 TO XRAY.                                              NC2524.2 68
   001376         138000     IF XRAY IS EQUAL TO "8"                                      NC2524.2 68
   001377      1  138100              PERFORM PASS                                        NC2524.2 401
   001378      1  138200              GO TO COMP-WRITE-23.                                NC2524.2 1386
   001379         138300     PERFORM FAIL.                                                NC2524.2 402
   001380         138400     MOVE "8" TO CORRECT-A.                                       NC2524.2 278
   001381         138500     MOVE XRAY TO COMPUTED-A.                                     NC2524.2 68 264
   001382         138600     MOVE "OSE NOT EXECUTED" TO RE-MARK.                          NC2524.2 258
   001383         138700     GO TO COMP-WRITE-23.                                         NC2524.2 1386
   001384         138800 COMP-DELETE-23.                                                  NC2524.2
   001385         138900     PERFORM DE-LETE.                                             NC2524.2 403
   001386         139000 COMP-WRITE-23.                                                   NC2524.2
   001387         139100     MOVE "COMP-TEST-23" TO PAR-NAME.                             NC2524.2 253
   001388         139200     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001389         139300 COMP-TEST-24.                                                    NC2524.2
   001390         139400        IF W-2 = 10                                               NC2524.2 70
   001391      1  139500              PERFORM PASS                                        NC2524.2 401
   001392      1  139600              GO TO COMP-WRITE-24.                                NC2524.2 1400
   001393         139700     PERFORM FAIL.                                                NC2524.2 402
   001394         139800     MOVE W-2 TO COMPUTED-A.                                      NC2524.2 70 264
   001395         139900     MOVE "10" TO CORRECT-A.                                      NC2524.2 278
   001396         140000     MOVE "NOT PROTECTED BY OES" TO RE-MARK.                      NC2524.2 258
   001397         140100     GO TO COMP-WRITE-24.                                         NC2524.2 1400
   001398         140200 COMP-DELETE-24.                                                  NC2524.2
   001399         140300     PERFORM DE-LETE.                                             NC2524.2 403
   001400         140400 COMP-WRITE-24.                                                   NC2524.2
   001401         140500     MOVE "COMP-TEST-24" TO PAR-NAME.                             NC2524.2 253
   001402         140600     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001403         140700 COMP-TEST-25.                                                    NC2524.2
   001404         140800     MOVE ZERO TO W-11.                                           NC2524.2 IMP 74
   001405         140900     COMPUTE W-11 ROUNDED = D-1 + D-7.                            NC2524.2 74 75 76
   001406         141000     IF ( W-11 < 2.20004) AND                                     NC2524.2 74
   001407         141100        ( W-11 > 2.19996) THEN                                    NC2524.2 74
   001408      1  141200              PERFORM PASS                                        NC2524.2 401
   001409      1  141300              GO TO COMP-WRITE-25.                                NC2524.2 1416
   001410         141400     PERFORM FAIL.                                                NC2524.2 402
   001411         141500     MOVE W-11 TO COMPUTED-N.                                     NC2524.2 74 265
   001412         141600     MOVE "+2.2" TO CORRECT-A.                                    NC2524.2 278
   001413         141700     GO TO COMP-WRITE-25.                                         NC2524.2 1416
   001414         141800 COMP-DELETE-25.                                                  NC2524.2
   001415         141900     PERFORM DE-LETE.                                             NC2524.2 403
   001416         142000 COMP-WRITE-25.                                                   NC2524.2
   001417         142100     MOVE "COMP-TEST-25" TO PAR-NAME.                             NC2524.2 253
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001418         142200     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001419         142300 COMP-TEST-26.                                                    NC2524.2
   001420         142400     MOVE ZERO TO W-11.                                           NC2524.2 IMP 74
   001421         142500     COMPUTE W-11 ROUNDED = 25 / 10.                              NC2524.2 74
   001422         142600     IF ( W-11 < 2.50005) AND                                     NC2524.2 74
   001423         142700        ( W-11 > 2.49995) THEN                                    NC2524.2 74
   001424      1  142800              PERFORM PASS                                        NC2524.2 401
   001425      1  142900              GO TO COMP-WRITE-26.                                NC2524.2 1432
   001426         143000     PERFORM FAIL.                                                NC2524.2 402
   001427         143100     MOVE W-11 TO COMPUTED-N.                                     NC2524.2 74 265
   001428         143200     MOVE "+2.5" TO CORRECT-A.                                    NC2524.2 278
   001429         143300     GO TO COMP-WRITE-26.                                         NC2524.2 1432
   001430         143400 COMP-DELETE-26.                                                  NC2524.2
   001431         143500     PERFORM DE-LETE.                                             NC2524.2 403
   001432         143600 COMP-WRITE-26.                                                   NC2524.2
   001433         143700     MOVE "COMP-TEST-26" TO PAR-NAME.                             NC2524.2 253
   001434         143800     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001435         143900 CTST-END.                                                        NC2524.2
   001436         144000     EXIT.                                                        NC2524.2
   001437         144100 COMP-INIT-A.                                                     NC2524.2
   001438         144200     MOVE     "COMPUTE" TO FEATURE.                               NC2524.2 249
   001439         144300 COMP-TEST-27.                                                    NC2524.2
   001440         144400     MOVE     ZERO TO WRK-DS-02V00.                               NC2524.2 IMP 48
   001441         144500     COMPUTE  WRK-DS-02V00 = -9.                                  NC2524.2 48
   001442         144600        IF WRK-DS-02V00 = -9                                      NC2524.2 48
   001443      1  144700              PERFORM PASS                                        NC2524.2 401
   001444      1  144800              GO TO COMP-WRITE-27.                                NC2524.2 1451
   001445         144900     MOVE     WRK-DS-02V00 TO COMPUTED-N.                         NC2524.2 48 265
   001446         145000     MOVE     -9 TO CORRECT-N.                                    NC2524.2 279
   001447         145100     PERFORM  FAIL.                                               NC2524.2 402
   001448         145200     GO TO COMP-WRITE-27.                                         NC2524.2 1451
   001449         145300 COMP-DELETE-27.                                                  NC2524.2
   001450         145400     PERFORM DE-LETE.                                             NC2524.2 403
   001451         145500 COMP-WRITE-27.                                                   NC2524.2
   001452         145600     MOVE     "COMP-TEST-27" TO PAR-NAME.                         NC2524.2 253
   001453         145700     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001454         145800 COMP-TEST-28.                                                    NC2524.2
   001455         145900     MOVE     ZERO TO WRK-DS-02V00.                               NC2524.2 IMP 48
   001456         146000     COMPUTE  WRK-DS-02V00 = A99-DS-02V00.                        NC2524.2 48 50
   001457         146100        IF WRK-DS-02V00 = 99                                      NC2524.2 48
   001458      1  146200              PERFORM PASS                                        NC2524.2 401
   001459      1  146300              GO TO COMP-WRITE-28.                                NC2524.2 1466
   001460         146400     MOVE     WRK-DS-02V00 TO COMPUTED-N.                         NC2524.2 48 265
   001461         146500     MOVE     99 TO CORRECT-N.                                    NC2524.2 279
   001462         146600     PERFORM  FAIL.                                               NC2524.2 402
   001463         146700     GO TO COMP-WRITE-28.                                         NC2524.2 1466
   001464         146800 COMP-DELETE-28.                                                  NC2524.2
   001465         146900     PERFORM DE-LETE.                                             NC2524.2 403
   001466         147000 COMP-WRITE-28.                                                   NC2524.2
   001467         147100     MOVE     "COMP-TEST-28" TO PAR-NAME.                         NC2524.2 253
   001468         147200     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001469         147300 COMP-TEST-29.                                                    NC2524.2
   001470         147400     MOVE     ZERO TO WRK-DS-18V00.                               NC2524.2 IMP 51
   001471         147500     COMPUTE  WRK-DS-18V00 = A18ONES-DS-18V00 + A18ONES-DS-18V00. NC2524.2 51 52 52
   001472         147600     IF       WRK-DS-18V00 = 222222222222222222                   NC2524.2 51
   001473      1  147700              PERFORM PASS                                        NC2524.2 401
   001474      1  147800              GO TO COMP-WRITE-29.                                NC2524.2 1481
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001475         147900     MOVE     WRK-DS-18V00 TO COMPUTED-18V0.                      NC2524.2 51 271
   001476         148000     MOVE     222222222222222222 TO CORRECT-18V0.                 NC2524.2 284
   001477         148100     PERFORM  FAIL.                                               NC2524.2 402
   001478         148200     GO TO COMP-WRITE-29.                                         NC2524.2 1481
   001479         148300 COMP-DELETE-29.                                                  NC2524.2
   001480         148400     PERFORM DE-LETE.                                             NC2524.2 403
   001481         148500 COMP-WRITE-29.                                                   NC2524.2
   001482         148600     MOVE     "COMP-TEST-29" TO PAR-NAME.                         NC2524.2 253
   001483         148700     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001484         148800 COMP-TEST-30.                                                    NC2524.2
   001485         148900     MOVE     ZERO TO WRK-DS-18V00.                               NC2524.2 IMP 51
   001486         149000     COMPUTE  WRK-DS-18V00 = A18TWOS-DS-18V00 - A18ONES-DS-18V00. NC2524.2 51 54 52
   001487         149100     IF       WRK-DS-18V00 = 111111111111111111                   NC2524.2 51
   001488      1  149200              PERFORM PASS                                        NC2524.2 401
   001489      1  149300              GO TO COMP-WRITE-30.                                NC2524.2 1496
   001490         149400     MOVE     WRK-DS-18V00 TO COMPUTED-18V0.                      NC2524.2 51 271
   001491         149500     MOVE     111111111111111111 TO CORRECT-18V0.                 NC2524.2 284
   001492         149600     PERFORM  FAIL.                                               NC2524.2 402
   001493         149700     GO TO COMP-WRITE-30.                                         NC2524.2 1496
   001494         149800 COMP-DELETE-30.                                                  NC2524.2
   001495         149900     PERFORM DE-LETE.                                             NC2524.2 403
   001496         150000 COMP-WRITE-30.                                                   NC2524.2
   001497         150100     MOVE     "COMP-TEST-30" TO PAR-NAME.                         NC2524.2 253
   001498         150200     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001499         150300 COMP-TEST-31.                                                    NC2524.2
   001500         150400     MOVE   ZERO TO   TA--X.                                      NC2524.2 IMP 233
   001501         150500     COMPUTE     TA--X  =  3 * A02TWOS-DU-02V00.                  NC2524.2 233 57
   001502         150600        IF TA--X = 66                                             NC2524.2 233
   001503      1  150700              PERFORM PASS                                        NC2524.2 401
   001504      1  150800              GO TO COMP-WRITE-31.                                NC2524.2 1511
   001505         150900     MOVE       TA--X TO COMPUTED-N                               NC2524.2 233 265
   001506         151000     MOVE     66 TO CORRECT-N.                                    NC2524.2 279
   001507         151100     PERFORM  FAIL.                                               NC2524.2 402
   001508         151200     GO TO COMP-WRITE-31.                                         NC2524.2 1511
   001509         151300 COMP-DELETE-31.                                                  NC2524.2
   001510         151400     PERFORM DE-LETE.                                             NC2524.2 403
   001511         151500 COMP-WRITE-31.                                                   NC2524.2
   001512         151600     MOVE     "COMP-TEST-31" TO PAR-NAME.                         NC2524.2 253
   001513         151700     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001514         151800 COMP-TEST-32.                                                    NC2524.2
   001515         151900     MOVE     ZERO TO WRK-DS-05V00.                               NC2524.2 IMP 56
   001516         152000     COMPUTE  WRK-DS-05V00 = A02TWOS-DU-02V00 / A02TWOS-DS-03V02. NC2524.2 56 57 58
   001517         152100        IF WRK-DS-05V00 = 1                                       NC2524.2 56
   001518      1  152200              PERFORM PASS                                        NC2524.2 401
   001519      1  152300              GO TO COMP-WRITE-32.                                NC2524.2 1526
   001520         152400     MOVE     WRK-DS-05V00 TO COMPUTED-N.                         NC2524.2 56 265
   001521         152500     MOVE     1 TO CORRECT-N.                                     NC2524.2 279
   001522         152600     PERFORM  FAIL.                                               NC2524.2 402
   001523         152700     GO TO COMP-WRITE-32.                                         NC2524.2 1526
   001524         152800 COMP-DELETE-32.                                                  NC2524.2
   001525         152900     PERFORM DE-LETE.                                             NC2524.2 403
   001526         153000 COMP-WRITE-32.                                                   NC2524.2
   001527         153100     MOVE     "COMP-TEST-32" TO PAR-NAME.                         NC2524.2 253
   001528         153200     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001529         153300 COMP-TEST-33.                                                    NC2524.2
   001530         153400     MOVE     ZERO TO WRK-DS-05V00.                               NC2524.2 IMP 56
   001531         153500     COMPUTE  WRK-DS-05V00 = 3 ** ATWO-DS-01V00.                  NC2524.2 56 59
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001532         153600        IF WRK-DS-05V00 = 9                                       NC2524.2 56
   001533      1  153700              PERFORM PASS                                        NC2524.2 401
   001534      1  153800              GO TO COMP-WRITE-33.                                NC2524.2 1541
   001535         153900     MOVE     WRK-DS-05V00 TO COMPUTED-N.                         NC2524.2 56 265
   001536         154000     MOVE     9 TO CORRECT-N.                                     NC2524.2 279
   001537         154100     PERFORM  FAIL.                                               NC2524.2 402
   001538         154200     GO TO COMP-WRITE-33.                                         NC2524.2 1541
   001539         154300 COMP-DELETE-33.                                                  NC2524.2
   001540         154400              PERFORM DE-LETE.                                    NC2524.2 403
   001541         154500 COMP-WRITE-33.                                                   NC2524.2
   001542         154600     MOVE     "COMP-TEST-33" TO PAR-NAME.                         NC2524.2 253
   001543         154700     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001544         154800 COMP-TEST-34.                                                    NC2524.2
   001545         154900     MOVE     ZERO TO WRK-DS-02V00.                               NC2524.2 IMP 48
   001546         155000     COMPUTE  WRK-DS-02V00 ROUNDED  = A99-DS-02V00                NC2524.2 48 50
   001547         155100              +   AZERO-DS-05V05 - 2.5.                           NC2524.2 60
   001548         155200        IF WRK-DS-02V00 = 97                                      NC2524.2 48
   001549      1  155300              PERFORM PASS                                        NC2524.2 401
   001550      1  155400              GO TO COMP-WRITE-34.                                NC2524.2 1557
   001551         155500     MOVE     WRK-DS-02V00 TO COMPUTED-N.                         NC2524.2 48 265
   001552         155600     MOVE     97 TO CORRECT-N.                                    NC2524.2 279
   001553         155700     PERFORM  FAIL.                                               NC2524.2 402
   001554         155800     GO TO COMP-WRITE-34.                                         NC2524.2 1557
   001555         155900 COMP-DELETE-34.                                                  NC2524.2
   001556         156000     PERFORM DE-LETE.                                             NC2524.2 403
   001557         156100 COMP-WRITE-34.                                                   NC2524.2
   001558         156200     MOVE     "COMP-TEST-34" TO PAR-NAME.                         NC2524.2 253
   001559         156300     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001560         156400 COMP-TEST-35.                                                    NC2524.2
   001561         156500     MOVE     ZERO TO WRK-DS-02V00.                               NC2524.2 IMP 48
   001562         156600     COMPUTE  WRK-DS-02V00 = A99-DS-02V00 + AZERO-DS-05V05        NC2524.2 48 50 60
   001563         156700              ON SIZE ERROR                                       NC2524.2
   001564      1  156800              MOVE "SIZE ERR SHOULD NOT EXCUTE" TO RE-MARK        NC2524.2 258
   001565      1  156900              PERFORM FAIL                                        NC2524.2 402
   001566      1  157000              GO TO COMP-WRITE-35.                                NC2524.2 1571
   001567         157100     PERFORM  PASS.                                               NC2524.2 401
   001568         157200     GO       TO COMP-WRITE-35.                                   NC2524.2 1571
   001569         157300 COMP-DELETE-35.                                                  NC2524.2
   001570         157400     PERFORM  DE-LETE.                                            NC2524.2 403
   001571         157500 COMP-WRITE-35.                                                   NC2524.2
   001572         157600     MOVE     "COMP-TEST-35" TO PAR-NAME.                         NC2524.2 253
   001573         157700     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001574         157800 COMP-TEST-36.                                                    NC2524.2
   001575         157900     IF       TEST-2NUC-COND-99                                   NC2524.2 49
   001576      1  158000              PERFORM PASS                                        NC2524.2 401
   001577      1  158100              GO TO COMP-WRITE-36.                                NC2524.2 1585
   001578         158200*    NOTE     THIS TEST DEPENDS UPON THE RESULT OF COMP-TEST-35.  NC2524.2
   001579         158300     MOVE     WRK-DS-02V00 TO COMPUTED-N.                         NC2524.2 48 265
   001580         158400     MOVE     99 TO CORRECT-N.                                    NC2524.2 279
   001581         158500     PERFORM  FAIL.                                               NC2524.2 402
   001582         158600     GO TO COMP-WRITE-36.                                         NC2524.2 1585
   001583         158700 COMP-DELETE-36.                                                  NC2524.2
   001584         158800     PERFORM DE-LETE.                                             NC2524.2 403
   001585         158900 COMP-WRITE-36.                                                   NC2524.2
   001586         159000     MOVE     "COMP-TEST-36" TO PAR-NAME.                         NC2524.2 253
   001587         159100     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001588         159200 COMP-TEST-37.                                                    NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001589         159300     MOVE     ZERO TO WRK-DS-0201P.                               NC2524.2 IMP 62
   001590         159400     COMPUTE  WRK-DS-0201P ROUNDED = A05ONES-DS-05V00 / 5         NC2524.2 62 63
   001591         159500              ON SIZE ERROR                                       NC2524.2
   001592      1  159600              PERFORM PASS                                        NC2524.2 401
   001593      1  159700              GO TO COMP-WRITE-37.                                NC2524.2 1599
   001594         159800     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC2524.2 258
   001595         159900     PERFORM  FAIL.                                               NC2524.2 402
   001596         160000     GO TO COMP-WRITE-37.                                         NC2524.2 1599
   001597         160100 COMP-DELETE-37.                                                  NC2524.2
   001598         160200     PERFORM DE-LETE.                                             NC2524.2 403
   001599         160300 COMP-WRITE-37.                                                   NC2524.2
   001600         160400     MOVE     "COMP-TEST-37" TO PAR-NAME.                         NC2524.2 253
   001601         160500     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001602         160600 COMP-TEST-38.                                                    NC2524.2
   001603         160700        IF WRK-DS-0201P = ZERO                                    NC2524.2 62 IMP
   001604      1  160800              PERFORM PASS                                        NC2524.2 401
   001605      1  160900              GO TO COMP-WRITE-38.                                NC2524.2 1613
   001606         161000*    NOTE     THIS TEST DEPENDS UPON THE RESULT OF COMP-TEST-37.  NC2524.2
   001607         161100     MOVE     WRK-DS-0201P TO COMPUTED-N.                         NC2524.2 62 265
   001608         161200     MOVE     ZERO TO CORRECT-N.                                  NC2524.2 IMP 279
   001609         161300     PERFORM  FAIL.                                               NC2524.2 402
   001610         161400     GO TO COMP-WRITE-38.                                         NC2524.2 1613
   001611         161500 COMP-DELETE-38.                                                  NC2524.2
   001612         161600     PERFORM DE-LETE.                                             NC2524.2 403
   001613         161700 COMP-WRITE-38.                                                   NC2524.2
   001614         161800     MOVE     "COMP-TEST-38" TO PAR-NAME.                         NC2524.2 253
   001615         161900     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001616         162000 COMP-TEST-39-42.                                                 NC2524.2
   001617         162100     MOVE SPACES TO TEST-RESULTS.                                 NC2524.2 IMP 247
   001618         162200     MOVE "NOT USED" TO RE-MARK.                                  NC2524.2 258
   001619         162300     MOVE "COMP-TEST-39" TO PAR-NAME.                             NC2524.2 253
   001620         162400     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001621         162500     MOVE "NOT USED" TO RE-MARK.                                  NC2524.2 258
   001622         162600     MOVE "COMP-TEST-40" TO PAR-NAME.                             NC2524.2 253
   001623         162700     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001624         162800     MOVE "NOT USED" TO RE-MARK.                                  NC2524.2 258
   001625         162900     MOVE "COMP-TEST-41" TO PAR-NAME.                             NC2524.2 253
   001626         163000     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001627         163100     MOVE "NOT USED" TO RE-MARK.                                  NC2524.2 258
   001628         163200     MOVE "COMP-TEST-42" TO PAR-NAME.                             NC2524.2 253
   001629         163300     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001630         163400     MOVE "COMPUTE" TO FEATURE.                                   NC2524.2 249
   001631         163500 COMP-TEST-43.                                                    NC2524.2
   001632         163600     MOVE    ZEROS TO WHOLE-FIELD.                                NC2524.2 IMP 241
   001633         163700     COMPUTE WHOLE-FIELD =                                        NC2524.2 241
   001634         163800     (1 + (2 - (3 + (4 - (5 + (6 - (7 + (8 - (9 + (10 -           NC2524.2
   001635         163900     EVEN-NAME1)))))))))).                                        NC2524.2 243
   001636         164000     IF (WHOLE-FIELD < 10.0002) AND                               NC2524.2 241
   001637      1  164100        (WHOLE-FIELD > 9.9998) PERFORM PASS                       NC2524.2 241 401
   001638      1  164200         GO TO COMP-WRITE-43.                                     NC2524.2 1645
   001639         164300     MOVE WHOLE-FIELD TO COMPUTED-18V0.                           NC2524.2 241 271
   001640         164400     MOVE 10 TO CORRECT-18V0.                                     NC2524.2 284
   001641         164500     PERFORM FAIL.                                                NC2524.2 402
   001642         164600     GO TO COMP-WRITE-43.                                         NC2524.2 1645
   001643         164700 COMP-DELETE-43.                                                  NC2524.2
   001644         164800     PERFORM DE-LETE.                                             NC2524.2 403
   001645         164900 COMP-WRITE-43.                                                   NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001646         165000     MOVE "COMP-TEST-43" TO PAR-NAME.                             NC2524.2 253
   001647         165100     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001648         165200 COMP-TEST-44.                                                    NC2524.2
   001649         165300     MOVE    ZEROS TO WHOLE-FIELD.                                NC2524.2 IMP 241
   001650         165400     COMPUTE  WHOLE-FIELD =                                       NC2524.2 241
   001651         165500     (ONE + (TWO - (THREE + (FOUR - (FIVE + (SIX - (SEVEN +       NC2524.2 77 78 79 80 81 82 83
   001652         165600         (EIGHT - (NINE + (TEN - EVEN-NAME1)))))))))).            NC2524.2 84 85 86 243
   001653         165700        IF WHOLE-FIELD = 10    PERFORM PASS                       NC2524.2 241 401
   001654      1  165800         GO TO COMP-WRITE-44.                                     NC2524.2 1661
   001655         165900     MOVE WHOLE-FIELD TO COMPUTED-18V0.                           NC2524.2 241 271
   001656         166000     MOVE 10 TO CORRECT-18V0.                                     NC2524.2 284
   001657         166100     PERFORM FAIL.                                                NC2524.2 402
   001658         166200     GO TO COMP-WRITE-44.                                         NC2524.2 1661
   001659         166300 COMP-DELETE-44.                                                  NC2524.2
   001660         166400     PERFORM DE-LETE.                                             NC2524.2 403
   001661         166500 COMP-WRITE-44.                                                   NC2524.2
   001662         166600     MOVE "COMP-TEST-44" TO PAR-NAME.                             NC2524.2 253
   001663         166700     PERFORM PRINT-DETAIL.                                        NC2524.2 405
   001664         166800 COMP-INT-045.                                                    NC2524.2
   001665         166900     MOVE    "COMPUTE SERIES"  TO FEATURE.                        NC2524.2 249
   001666         167000     MOVE    "COMP-TEST-045"  TO PAR-NAME.                        NC2524.2 253
   001667         167100 COMP-TEST-045.                                                   NC2524.2
   001668         167200     COMPUTE  WRK-DS-05V00-0002                                   NC2524.2 217
   001669         167300              WRK-DS-04V01-0005   ROUNDED                         NC2524.2 220
   001670         167400              WRK-DS-03V04-0003F-0014  (2, 2, 2) =  174 / 16.     NC2524.2 228
   001671         167500*                                                                 NC2524.2
   001672         167600*    IDENTIFIER SERIES  -  WITH AND WITHOUT ROUNDED  -            NC2524.2
   001673         167700*             SUBSCRIPTED DATA ITEM.                              NC2524.2
   001674         167800*                                                                 NC2524.2
   001675         167900     MOVE "COMP-TEST-045-1" TO PAR-NAME.                          NC2524.2 253
   001676         168000        IF WRK-DS-05V00-0002 NOT = 10                             NC2524.2 217
   001677      1  168100              MOVE      +00010  TO  CORRECT-N                     NC2524.2 279
   001678      1  168200              MOVE     WRK-DS-05V00-0002   TO COMPUTED-N          NC2524.2 217 265
   001679      1  168300              PERFORM COMP-WRITE-045 GO TO COMP-TEST-045-2.       NC2524.2 1700 1681
   001680         168400     PERFORM PASS.  PERFORM COMP-WRITE-045.                       NC2524.2 401 1700
   001681         168500 COMP-TEST-045-2.                                                 NC2524.2
   001682         168600     MOVE "COMP-TEST-045-2" TO PAR-NAME.                          NC2524.2 253
   001683         168700     IF (WRK-DS-04V01-0005 > 10.9002180) OR                       NC2524.2 220
   001684      1  168800        (WRK-DS-04V01-0005 < 10.8997820) PERFORM FAIL             NC2524.2 220 402
   001685      1  168900              MOVE +10.9 TO CORRECT-N                             NC2524.2 279
   001686      1  169000              MOVE WRK-DS-04V01-0005 TO COMPUTED-N                NC2524.2 220 265
   001687      1  169100              PERFORM COMP-WRITE-045 GO TO COMP-TEST-045-3.       NC2524.2 1700 1689
   001688         169200     PERFORM PASS.  PERFORM COMP-WRITE-045.                       NC2524.2 401 1700
   001689         169300 COMP-TEST-045-3.                                                 NC2524.2
   001690         169400     MOVE "COMP-TEST-045-3" TO PAR-NAME.                          NC2524.2 253
   001691         169500     IF (WRK-DS-03V04-0003F-0014 (2, 2, 2) > 10.87521750) OR      NC2524.2 228
   001692         169600        (WRK-DS-03V04-0003F-0014 (2, 2, 2) < 10.87479250)         NC2524.2 228
   001693      1  169700             PERFORM FAIL MOVE +010.8750 TO CORRECT-N             NC2524.2 402 279
   001694      1  169800             MOVE WRK-DS-03V04-0003F-0014 (2, 2, 2) TO COMPUTED-N NC2524.2 228 265
   001695      1  169900             GO TO COMP-WRITE-045.                                NC2524.2 1700
   001696         170000     PERFORM PASS.                                                NC2524.2 401
   001697         170100     GO TO      COMP-WRITE-045.                                   NC2524.2 1700
   001698         170200 COMP-DELETE-045.                                                 NC2524.2
   001699         170300     PERFORM  DE-LETE.                                            NC2524.2 403
   001700         170400 COMP-WRITE-045.                                                  NC2524.2
   001701         170500     PERFORM  PRINT-DETAIL.                                       NC2524.2 405
   001702         170600 COMP-TEST-045-EXIT.                                              NC2524.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001703         170700     EXIT.                                                        NC2524.2
   001704         170800 CCVS-EXIT SECTION.                                               NC2524.2
   001705         170900 CCVS-999999.                                                     NC2524.2
   001706         171000     GO TO CLOSE-FILES.                                           NC2524.2 396
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    34
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      245   ALPHA-LIT
      309   ANSI-REFERENCE . . . . . . . .  479 486 495
      215   AN0002-O036F-X-0002. . . . . .  533 540
      214   AN0020-X-0001
       59   ATWO-DS-01V00. . . . . . . . .  1531
       60   AZERO-DS-05V05 . . . . . . . .  1547 1562
       58   A02TWOS-DS-03V02 . . . . . . .  1516
       57   A02TWOS-DU-02V00 . . . . . . .  1501 1516
       63   A05ONES-DS-05V00 . . . . . . .  1590
       52   A18ONES-DS-18V00 . . . . . . .  1471 1471 1486
       54   A18TWOS-DS-18V00 . . . . . . .  1486
       50   A99-DS-02V00 . . . . . . . . .  1456 1546 1562
      288   CCVS-C-1 . . . . . . . . . . .  423 465
      293   CCVS-C-2 . . . . . . . . . . .  424 466
      343   CCVS-E-1 . . . . . . . . . . .  429
      348   CCVS-E-2 . . . . . . . . . . .  438 445 452 457
      351   CCVS-E-2-2 . . . . . . . . . .  M437
      356   CCVS-E-3 . . . . . . . . . . .  458
      365   CCVS-E-4 . . . . . . . . . . .  437
      366   CCVS-E-4-1 . . . . . . . . . .  M435
      368   CCVS-E-4-2 . . . . . . . . . .  M436
      310   CCVS-H-1 . . . . . . . . . . .  418
      315   CCVS-H-2A. . . . . . . . . . .  419
      324   CCVS-H-2B. . . . . . . . . . .  420
      336   CCVS-H-3 . . . . . . . . . . .  421
      386   CCVS-PGM-ID. . . . . . . . . .  392 392
      270   CM-18V0
       90   COMPUTE-DATA
       92   COMPUTE-1. . . . . . . . . . .  M1042 1043 1044 1048
       93   COMPUTE-1A . . . . . . . . . .  1042 1174
      108   COMPUTE-10 . . . . . . . . . .  M1174 1188 1189 1191
      109   COMPUTE-11 . . . . . . . . . .  M1202 1203 1204 1208
      110   COMPUTE-11A. . . . . . . . . .  1202
      111   COMPUTE-11B. . . . . . . . . .  1202
      112   COMPUTE-12 . . . . . . . . . .  M1217 1218 1219 1223
      113   COMPUTE-12A. . . . . . . . . .  1217
      114   COMPUTE-12B
       94   COMPUTE-2. . . . . . . . . . .  M1057 1058 1059 1063
       95   COMPUTE-3. . . . . . . . . . .  M1072 1073 1074 1076
       96   COMPUTE-3A . . . . . . . . . .  1072
       97   COMPUTE-3B . . . . . . . . . .  1072
       98   COMPUTE-4. . . . . . . . . . .  M1087 1088 1090
       99   COMPUTE-4A . . . . . . . . . .  1087
      100   COMPUTE-4B . . . . . . . . . .  1087
      101   COMPUTE-5. . . . . . . . . . .  M1101 1102 1103 1105
      102   COMPUTE-5A . . . . . . . . . .  1101
      103   COMPUTE-6. . . . . . . . . . .  M1116 1117 1118 1120
      104   COMPUTE-6A . . . . . . . . . .  1116 1159 1174
      105   COMPUTE-7. . . . . . . . . . .  M1131 1132 1136
      106   COMPUTE-8. . . . . . . . . . .  M1145 1146 1150
      107   COMPUTE-9. . . . . . . . . . .  M1159 1160 1161 1163
      264   COMPUTED-A . . . . . . . . . .  265 267 268 269 270 491 494 M506 M523 M540 M556 M570 M595 M610 M628 M644 M664
                                            M670 M676 M701 M716 M736 M751 M772 M782 M795 M808 M821 M844 M860 M876 M896 M918
                                            M935 M969 M1018 M1242 M1381 M1394
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    35
0 Defined   Cross-reference of data names   References

0     265   COMPUTED-N . . . . . . . . . .  M582 M952 M1001 M1048 M1063 M1076 M1090 M1105 M1120 M1136 M1150 M1163 M1191 M1208
                                            M1223 M1257 M1274 M1289 M1304 M1319 M1334 M1349 M1363 M1411 M1427 M1445 M1460
                                            M1505 M1520 M1535 M1551 M1579 M1607 M1678 M1686 M1694
      263   COMPUTED-X . . . . . . . . . .  M413 477
      267   COMPUTED-0V18
      269   COMPUTED-14V4
      271   COMPUTED-18V0. . . . . . . . .  M1475 M1490 M1639 M1655
      268   COMPUTED-4V14
      287   COR-ANSI-REFERENCE . . . . . .  M486 M488
      278   CORRECT-A. . . . . . . . . . .  279 280 281 282 283 492 494 M507 M524 M541 M557 M569 M596 M609 M627 M643 M663
                                            M669 M675 M702 M717 M737 M752 M773 M783 M796 M809 M822 M845 M861 M877 M897 M919
                                            M936 M970 M1019 M1049 M1064 M1077 M1091 M1106 M1121 M1137 M1151 M1164 M1209 M1224
                                            M1244 M1258 M1275 M1290 M1305 M1320 M1335 M1350 M1364 M1380 M1395 M1412 M1428
      279   CORRECT-N. . . . . . . . . . .  M583 M953 M1002 M1192 M1446 M1461 M1506 M1521 M1536 M1552 M1580 M1608 M1677 M1685
                                            M1693
      277   CORRECT-X. . . . . . . . . . .  M414 478
      280   CORRECT-0V18
      282   CORRECT-14V4
      284   CORRECT-18V0 . . . . . . . . .  M1476 M1491 M1640 M1656
      281   CORRECT-4V14
      283   CR-18V0
      232   CS-05V00-0003
       75   D-1. . . . . . . . . . . . . .  1405
       76   D-7. . . . . . . . . . . . . .  1405
      301   DELETE-COUNTER . . . . . . . .  M403 432 448 450
      256   DOTVALUE . . . . . . . . . . .  M408
      230   DS-02V00-0001
      231   DS-03V00-0002
      307   DUMMY-HOLD . . . . . . . . . .  M462 468
       35   DUMMY-RECORD . . . . . . . . .  M418 M419 M420 M421 M423 M424 M425 M427 M429 M438 M445 M452 M457 M458 462 M463
                                            464 M465 M466 M467 M468 472 M473 M481 M496
       84   EIGHT. . . . . . . . . . . . .  1652
      129   ELEM-FOR-RENAMES-1 . . . . . .  140
      132   ELEM-FOR-RENAMES-2 . . . . . .  135 139 141
      134   ELEM-FOR-RENAMES-3
      354   ENDER-DESC . . . . . . . . . .  M440 M451 M456
      302   ERROR-COUNTER. . . . . . . . .  M402 431 441 444
      306   ERROR-HOLD . . . . . . . . . .  M431 M432 M432 M433 436
      352   ERROR-TOTAL. . . . . . . . . .  M442 M444 M449 M450 M454 M455
      243   EVEN-NAME1 . . . . . . . . . .  1635 1652
      249   FEATURE. . . . . . . . . . . .  M503 M729 M831 M899 M903 M921 M938 M955 M972 M976 M1021 M1040 M1233 M1438 M1630
                                            M1665
       87   FIFTEEN
       81   FIVE . . . . . . . . . . . . .  1651
       80   FOUR . . . . . . . . . . . . .  1314 1359 1651
      127   GRP-FOR-RENAMES. . . . . . . .  137 141
      213   GRP-REDEF125
      224   GRP-0010
      184   HARD . . . . . . . . . . . . .  505
      380   HYPHEN-LINE. . . . . . . . . .  425 427 467
      346   ID-AGAIN . . . . . . . . . . .  M392
      379   INF-ANSI-REFERENCE . . . . . .  M479 M482 M495 M497
      374   INFO-TEXT. . . . . . . . . . .  M480
      303   INSPECT-COUNTER. . . . . . . .  M400 431 453 455
      157   ITEM-1 . . . . . . . . . . . .  160 M882
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    36
0 Defined   Cross-reference of data names   References

0     240   MINUS-NAMES
      146   NAME-2 . . . . . . . . . . . .  148
      153   NAME-2 . . . . . . . . . . . .  155
      116   NAME1. . . . . . . . . . . . .  123 126 763
      117   NAME1A . . . . . . . . . . . .  124 M731
      118   NAME1B . . . . . . . . . . . .  124 M732
      119   NAME2. . . . . . . . . . . . .  125 764
      120   NAME3. . . . . . . . . . . . .  123 765
      121   NAME3A
      122   NAME3B
      221   NE-0008
      222   NE-0009
      223   NE-04V01-0006
       85   NINE . . . . . . . . . . . . .  1237 1652
       77   ONE. . . . . . . . . . . . . .  1651
      251   P-OR-F . . . . . . . . . . . .  M400 M401 M402 M403 410 M413
      253   PAR-NAME . . . . . . . . . . .  M415 M516 M530 M547 M563 M576 M589 M602 M617 M634 M650 M654 M695 M710 M725 M744
                                            M758 M776 M789 M802 M815 M828 M847 M863 M879 M900 M922 M939 M956 M973 M990 M1004
                                            M1022 M1054 M1069 M1084 M1098 M1113 M1128 M1142 M1156 M1171 M1185 M1199 M1214
                                            M1229 M1249 M1264 M1280 M1295 M1310 M1325 M1340 M1355 M1369 M1387 M1401 M1417
                                            M1433 M1452 M1467 M1482 M1497 M1512 M1527 M1542 M1558 M1572 M1586 M1600 M1614
                                            M1619 M1622 M1625 M1628 M1646 M1662 M1666 M1675 M1682 M1690
      255   PARDOT-X . . . . . . . . . . .  M407
      304   PASS-COUNTER . . . . . . . . .  M401 433 435
      242   PLUS-NAME1
      244   PLUS-NAME2
       33   PRINT-FILE . . . . . . . . . .  29 391 397
       34   PRINT-REC. . . . . . . . . . .  M409 M485 M487
      193   RDEF8
      173   RDFDATA1
      204   RDFDATA10
      205   RDFDATA11
      206   RDFDATA12
      207   RDFDATA13
      208   RDFDATA14
      209   RDFDATA15
      210   RDFDATA16. . . . . . . . . . .  592 595 M684
      211   RDFDATA17
      212   RDFDATA18. . . . . . . . . . .  624 628
      174   RDFDATA2 . . . . . . . . . . .  579 583
      175   RDFDATA3 . . . . . . . . . . .  178
      176   RDFDATA4
      177   RDFDATA5
      186   RDFDATA6
      190   RDFDATA7 . . . . . . . . . . .  550 556
      192   RDFDATA8 . . . . . . . . . . .  566 570 640 644
      203   RDFDATA9
      178   RDF3
      179   RDF3-4
      180   RDF3-5 . . . . . . . . . . . .  181 188
      181   RDF3-5-1
      182   RDF3-5-14
      183   RDF3-5-15. . . . . . . . . . .  506
      188   RDF3-5-16. . . . . . . . . . .  519 523
      191   RDF8 . . . . . . . . . . . . .  193
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    37
0 Defined   Cross-reference of data names   References

0     194   RDF8-1
      195   RDF8-2 . . . . . . . . . . . .  196
      196   RDF8-3 . . . . . . . . . . . .  715 716
      197   RDF8-4
      198   RDF8-5 . . . . . . . . . . . .  201
      199   RDF8-6 . . . . . . . . . . . .  201
      201   RDF8-7 . . . . . . . . . . . .  700 701
      200   RDF8-8
      258   RE-MARK. . . . . . . . . . . .  M404 M416 M611 M665 M671 M677 M689 M988 M1030 M1033 M1035 M1038 M1180 M1382 M1396
                                            M1564 M1594 M1618 M1621 M1624 M1627
      300   REC-CT . . . . . . . . . . . .  406 408 415 M661 M668 M674
      299   REC-SKL-SUB
      308   RECORD-COUNT . . . . . . . . .  M460 461 M469
      172   REDEF10. . . . . . . . . . . .  189 202 213 M639 656 662 M699 M714
      189   REDEF11. . . . . . . . . . . .  606 M621
      202   REDEF12. . . . . . . . . . . .  M605 M620 M637 M653 M698 M713
      234   REDEF13. . . . . . . . . . . .  653 698 714
      169   RENAME-10. . . . . . . . . . .  M926 M943
      170   RENAME-11. . . . . . . . . . .  M960
      171   RENAME-12. . . . . . . . . . .  M980 993 1001
      147   RENAME-5 . . . . . . . . . . .  M835
      154   RENAME-5 . . . . . . . . . . .  M1008
      148   RENAME-6 . . . . . . . . . . .  867 876
      155   RENAME-6
      160   RENAME-7 . . . . . . . . . . .  888 896
      167   RENAME-8 . . . . . . . . . . .  910 918
      168   RENAME-9 . . . . . . . . . . .  927 935
      115   RENAMES-DATA . . . . . . . . .  M747 M761 772
      135   RENAMES-TEST-1 . . . . . . . .  779 782
      136   RENAMES-TEST-2 . . . . . . . .  818 821
      138   RENAMES-TEST-3 . . . . . . . .  792 795
      140   RENAMES-TEST-4 . . . . . . . .  805 808
      123   RENAME1. . . . . . . . . . . .  M762
      124   RENAME2
      125   RENAME3. . . . . . . . . . . .  748 751
      126   RENAME4. . . . . . . . . . . .  733 736
       83   SEVEN. . . . . . . . . . . . .  1299 1651
       82   SIX. . . . . . . . . . . . . .  1651
      246   SNEG-LIT2
      185   SOFT . . . . . . . . . . . . .  686
      128   SUB-GRP-FOR-RENAMES-1. . . . .  136 138
      131   SUB-GRP-FOR-RENAMES-2
      142   T-RENAMES-DATA . . . . . . . .  148 835 M866 867 876
      233   TA--X. . . . . . . . . . . . .  M1500 M1501 1502 1505
      159   TABLE-ITEM-2 . . . . . . . . .  M883 M884 M885 M886 M887
      158   TABLE-2. . . . . . . . . . . .  160
      143   TAG-1. . . . . . . . . . . . .  836 844
      144   TAG-1A . . . . . . . . . . . .  147 148 M833
      145   TAG-1B . . . . . . . . . . . .  147 M834
       86   TEN. . . . . . . . . . . . . .  1284 1652
      259   TEST-COMPUTED. . . . . . . . .  485
      274   TEST-CORRECT . . . . . . . . .  487
      327   TEST-ID. . . . . . . . . . . .  M392
      247   TEST-RESULTS . . . . . . . . .  M393 409 M1027 M1617
       49   TEST-2NUC-COND-99. . . . . . .  1575
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    38
0 Defined   Cross-reference of data names   References

0      79   THREE. . . . . . . . . . . . .  1359 1651
      305   TOTAL-ERROR
       88   TWENTY . . . . . . . . . . . .  1374
       89   TWENTY-5 . . . . . . . . . . .  1329
       78   TWO. . . . . . . . . . . . . .  1344 1359 1651
      149   U-RENAMES-DATA . . . . . . . .  155 M1007 1008 1009 1018
      150   UNIT-1 . . . . . . . . . . . .  850 860
      151   UNIT-1A. . . . . . . . . . . .  154 155
      152   UNIT-1B. . . . . . . . . . . .  154
      156   V-RENAMES-DATA
      161   W-RENAMES-DATA . . . . . . . .  M906 M925 M942 M959
       69   W-1. . . . . . . . . . . . . .  M1234 M1237 1238 1242 M1243 1252 1268
       74   W-11 . . . . . . . . . . . . .  M1267 M1268 1269 1270 1274 M1404 M1405 1406 1407 1411 M1420 M1421 1422 1423 1427
       70   W-2. . . . . . . . . . . . . .  M1235 M1252 1253 1257 M1259 1268 M1313 M1314 1315 1319 M1373 M1374 1390 1394
       71   W-3. . . . . . . . . . . . . .  M1283 M1284 1285 1289 M1328 M1329 1330 1334
       72   W-5. . . . . . . . . . . . . .  M1298 M1299 1300 1304
       73   W-9. . . . . . . . . . . . . .  M1343 M1344 1345 1349 M1358 M1359 1360 1363
      241   WHOLE-FIELD. . . . . . . . . .  M1632 M1633 1636 1637 1639 M1649 M1650 1653 1655
      162   WIDGET-1 . . . . . . . . . . .  167 M907
      163   WIDGET-2 . . . . . . . . . . .  170 M908 961 969
      164   WIDGET-3 . . . . . . . . . . .  167 168 M909
      165   WIDGET-4 . . . . . . . . . . .  169 171 944 952 M979
      166   WIDGET-5 . . . . . . . . . . .  168 169
      218   WRK-CS-05V00-0003
       48   WRK-DS-02V00 . . . . . . . . .  M1440 M1441 1442 1445 M1455 M1456 1457 1460 M1545 M1546 1548 1551 M1561 M1562
                                            1579
       62   WRK-DS-0201P . . . . . . . . .  M1589 M1590 1603 1607
      228   WRK-DS-03V04-0003F-0014. . . .  M1670 1691 1692 1694
      220   WRK-DS-04V01-0005. . . . . . .  M1669 1683 1684 1686
       56   WRK-DS-05V00 . . . . . . . . .  M1515 M1516 1517 1520 M1530 M1531 1532 1535
      217   WRK-DS-05V00-0002. . . . . . .  M1668 1676 1678
       61   WRK-DS-06V06
       64   WRK-DS-09V00
       65   WRK-DS-09V09 . . . . . . . . .  66
       51   WRK-DS-18V00 . . . . . . . . .  M1470 M1471 1472 1475 M1485 M1486 1487 1490
       66   WRK-DS-18V00-S
      225   WRK-DU-03V00-L-0011
      219   WRK-DU-04V02-0004
      216   WRK-DU-05V00-0001
      227   WRK-O003F-0013
      226   WRK-O005F-0012
       39   WRK-XN-00001-1
       40   WRK-XN-00001-2
       38   WS-REM
       37   WS-REMAINDERS
       42   WS-1-20. . . . . . . . . . . .  664
       43   WS-21-40 . . . . . . . . . . .  670
       44   WS-41-46 . . . . . . . . . . .  676
       41   WS-46. . . . . . . . . . . . .  M662
       68   XRAY . . . . . . . . . . . . .  M1175 1176 M1372 M1375 1376 1381
      376   XXCOMPUTED . . . . . . . . . .  M494
      378   XXCORRECT. . . . . . . . . . .  M494
      371   XXINFO . . . . . . . . . . . .  481 496
       45   11A
       46   11B
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    39
0 Defined   Cross-reference of data names   References

0      47   1111C
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    40
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

      490   BAIL-OUT . . . . . . . . . . .  P412
      498   BAIL-OUT-EX. . . . . . . . . .  E412 G492
      493   BAIL-OUT-WRITE . . . . . . . .  G491
      474   BLANK-LINE-PRINT
     1704   CCVS-EXIT
     1705   CCVS-999999
      389   CCVS1
      499   CCVS1-EXIT . . . . . . . . . .  G395
      396   CLOSE-FILES. . . . . . . . . .  G1706
      422   COLUMN-NAMES-ROUTINE . . . . .  E394
     1698   COMP-DELETE-045
     1051   COMP-DELETE-1
     1182   COMP-DELETE-10
     1196   COMP-DELETE-11
     1211   COMP-DELETE-12
     1226   COMP-DELETE-13
     1246   COMP-DELETE-14
     1261   COMP-DELETE-15
     1277   COMP-DELETE-16
     1292   COMP-DELETE-17
     1307   COMP-DELETE-18
     1322   COMP-DELETE-19
     1066   COMP-DELETE-2
     1337   COMP-DELETE-20
     1352   COMP-DELETE-21
     1366   COMP-DELETE-22
     1384   COMP-DELETE-23
     1398   COMP-DELETE-24
     1414   COMP-DELETE-25
     1430   COMP-DELETE-26
     1449   COMP-DELETE-27
     1464   COMP-DELETE-28
     1479   COMP-DELETE-29
     1081   COMP-DELETE-3
     1494   COMP-DELETE-30
     1509   COMP-DELETE-31
     1524   COMP-DELETE-32
     1539   COMP-DELETE-33
     1555   COMP-DELETE-34
     1569   COMP-DELETE-35
     1583   COMP-DELETE-36
     1597   COMP-DELETE-37
     1611   COMP-DELETE-38
     1095   COMP-DELETE-4
     1643   COMP-DELETE-43
     1659   COMP-DELETE-44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    41
0 Defined   Cross-reference of procedures   References

0    1110   COMP-DELETE-5
     1125   COMP-DELETE-6
     1139   COMP-DELETE-7
     1153   COMP-DELETE-8
     1168   COMP-DELETE-9
     1437   COMP-INIT-A
     1664   COMP-INT-045
     1667   COMP-TEST-045
     1702   COMP-TEST-045-EXIT
     1681   COMP-TEST-045-2. . . . . . . .  G1679
     1689   COMP-TEST-045-3. . . . . . . .  G1687
     1041   COMP-TEST-1
     1173   COMP-TEST-10
     1187   COMP-TEST-11
     1201   COMP-TEST-12
     1216   COMP-TEST-13
     1236   COMP-TEST-14
     1251   COMP-TEST-15
     1266   COMP-TEST-16
     1282   COMP-TEST-17
     1297   COMP-TEST-18
     1312   COMP-TEST-19
     1056   COMP-TEST-2
     1327   COMP-TEST-20
     1342   COMP-TEST-21
     1357   COMP-TEST-22
     1371   COMP-TEST-23
     1389   COMP-TEST-24
     1403   COMP-TEST-25
     1419   COMP-TEST-26
     1439   COMP-TEST-27
     1454   COMP-TEST-28
     1469   COMP-TEST-29
     1071   COMP-TEST-3
     1484   COMP-TEST-30
     1499   COMP-TEST-31
     1514   COMP-TEST-32
     1529   COMP-TEST-33
     1544   COMP-TEST-34
     1560   COMP-TEST-35
     1574   COMP-TEST-36
     1588   COMP-TEST-37
     1602   COMP-TEST-38
     1616   COMP-TEST-39-42
     1086   COMP-TEST-4
     1631   COMP-TEST-43
     1648   COMP-TEST-44
     1100   COMP-TEST-5
     1115   COMP-TEST-6
     1130   COMP-TEST-7
     1144   COMP-TEST-8
     1158   COMP-TEST-9
     1700   COMP-WRITE-045 . . . . . . . .  P1679 P1680 P1687 P1688 G1695 G1697
     1053   COMP-WRITE-1 . . . . . . . . .  G1046 G1050
     1184   COMP-WRITE-10. . . . . . . . .  G1178 G1181
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    42
0 Defined   Cross-reference of procedures   References

0    1198   COMP-WRITE-11. . . . . . . . .  G1193 G1195
     1213   COMP-WRITE-12. . . . . . . . .  G1206 G1210
     1228   COMP-WRITE-13. . . . . . . . .  G1221 G1225
     1248   COMP-WRITE-14. . . . . . . . .  G1240 G1245
     1263   COMP-WRITE-15. . . . . . . . .  G1255 G1260
     1279   COMP-WRITE-16. . . . . . . . .  G1272 G1276
     1294   COMP-WRITE-17. . . . . . . . .  G1287 G1291
     1309   COMP-WRITE-18. . . . . . . . .  G1302 G1306
     1324   COMP-WRITE-19. . . . . . . . .  G1317 G1321
     1068   COMP-WRITE-2 . . . . . . . . .  G1061 G1065
     1339   COMP-WRITE-20. . . . . . . . .  G1332 G1336
     1354   COMP-WRITE-21. . . . . . . . .  G1347 G1351
     1368   COMP-WRITE-22. . . . . . . . .  G1361 G1365
     1386   COMP-WRITE-23. . . . . . . . .  G1378 G1383
     1400   COMP-WRITE-24. . . . . . . . .  G1392 G1397
     1416   COMP-WRITE-25. . . . . . . . .  G1409 G1413
     1432   COMP-WRITE-26. . . . . . . . .  G1425 G1429
     1451   COMP-WRITE-27. . . . . . . . .  G1444 G1448
     1466   COMP-WRITE-28. . . . . . . . .  G1459 G1463
     1481   COMP-WRITE-29. . . . . . . . .  G1474 G1478
     1083   COMP-WRITE-3 . . . . . . . . .  G1078 G1080
     1496   COMP-WRITE-30. . . . . . . . .  G1489 G1493
     1511   COMP-WRITE-31. . . . . . . . .  G1504 G1508
     1526   COMP-WRITE-32. . . . . . . . .  G1519 G1523
     1541   COMP-WRITE-33. . . . . . . . .  G1534 G1538
     1557   COMP-WRITE-34. . . . . . . . .  G1550 G1554
     1571   COMP-WRITE-35. . . . . . . . .  G1566 G1568
     1585   COMP-WRITE-36. . . . . . . . .  G1577 G1582
     1599   COMP-WRITE-37. . . . . . . . .  G1593 G1596
     1613   COMP-WRITE-38. . . . . . . . .  G1605 G1610
     1097   COMP-WRITE-4 . . . . . . . . .  G1092 G1094
     1645   COMP-WRITE-43. . . . . . . . .  G1638 G1642
     1661   COMP-WRITE-44. . . . . . . . .  G1654 G1658
     1112   COMP-WRITE-5 . . . . . . . . .  G1107 G1109
     1127   COMP-WRITE-6 . . . . . . . . .  G1122 G1124
     1141   COMP-WRITE-7 . . . . . . . . .  G1134 G1138
     1155   COMP-WRITE-8 . . . . . . . . .  G1148 G1152
     1170   COMP-WRITE-9 . . . . . . . . .  G1165 G1167
     1026   COMPUTE-INIT
     1231   COMPUTE-ROUTINE
     1232   COMPUTE-TEST
     1025   COMPUTING
     1435   CTST-END
      403   DE-LETE. . . . . . . . . . . .  P514 P528 P545 P561 P574 P587 P600 P615 P632 P648 P682 P693 P708 P723 P742 P756
                                            P769 P787 P800 P813 P826 P840 P856 P872 P892 P914 P931 P948 P965 P984 P997 P1014
                                            P1052 P1067 P1082 P1096 P1111 P1126 P1140 P1154 P1169 P1183 P1197 P1212 P1227
                                            P1247 P1262 P1278 P1293 P1308 P1323 P1338 P1353 P1367 P1385 P1399 P1415 P1431
                                            P1450 P1465 P1480 P1495 P1510 P1525 P1540 P1556 P1570 P1584 P1598 P1612 P1644
                                            P1660 P1699
      426   END-ROUTINE. . . . . . . . . .  P397 P728 P1028
      430   END-ROUTINE-1
      439   END-ROUTINE-12
      447   END-ROUTINE-13 . . . . . . . .  E397
      428   END-RTN-EXIT
      402   FAIL . . . . . . . . . . . . .  P508 P525 P542 P558 P571 P584 P597 P612 P629 P645 P666 P672 P678 P690 P703 P718
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    43
0 Defined   Cross-reference of procedures   References

0                                           P739 P753 P774 P784 P797 P810 P823 P843 P859 P875 P895 P917 P934 P951 P968 P987
                                            P1000 P1011 P1017 P1047 P1062 P1075 P1089 P1104 P1119 P1135 P1149 P1162 P1179
                                            P1190 P1207 P1222 P1241 P1256 P1273 P1288 P1303 P1318 P1333 P1348 P1362 P1379
                                            P1393 P1410 P1426 P1447 P1462 P1477 P1492 P1507 P1522 P1537 P1553 P1565 P1581
                                            P1595 P1609 P1641 P1657 P1684 P1693
      476   FAIL-ROUTINE . . . . . . . . .  P411
      489   FAIL-ROUTINE-EX. . . . . . . .  E411 G483
      484   FAIL-ROUTINE-WRITE . . . . . .  G477 G478
      417   HEAD-ROUTINE . . . . . . . . .  P394
      400   INSPT
      390   OPEN-FILES
      401   PASS . . . . . . . . . . . . .  P511 P520 P534 P551 P567 P580 P593 P607 P625 P641 P658 P687 P705 P720 P734 P749
                                            P766 P780 P793 P806 P819 P837 P851 P869 P889 P911 P928 P945 P962 P981 P994 P1010
                                            P1045 P1060 P1079 P1093 P1108 P1123 P1133 P1147 P1166 P1177 P1194 P1205 P1220
                                            P1239 P1254 P1271 P1286 P1301 P1316 P1331 P1346 P1360 P1377 P1391 P1408 P1424
                                            P1443 P1458 P1473 P1488 P1503 P1518 P1533 P1549 P1567 P1576 P1592 P1604 P1637
                                            P1653 P1680 P1688 P1696
      405   PRINT-DETAIL . . . . . . . . .  P517 P531 P548 P564 P577 P590 P603 P618 P635 P651 P659 P667 P673 P679 P696 P711
                                            P726 P745 P759 P777 P790 P803 P816 P829 P848 P864 P880 P901 P904 P923 P940 P957
                                            P974 P991 P1005 P1023 P1031 P1034 P1036 P1039 P1055 P1070 P1085 P1099 P1114 P1129
                                            P1143 P1157 P1172 P1186 P1200 P1215 P1230 P1250 P1265 P1281 P1296 P1311 P1326
                                            P1341 P1356 P1370 P1388 P1402 P1418 P1434 P1453 P1468 P1483 P1498 P1513 P1528
                                            P1543 P1559 P1573 P1587 P1601 P1615 P1620 P1623 P1626 P1629 P1647 P1663 P1701
      544   RDF-DELETE-003
      513   RDF-DELETE-1
      647   RDF-DELETE-10
      681   RDF-DELETE-11
      692   RDF-DELETE-12
      707   RDF-DELETE-13
      722   RDF-DELETE-14
      527   RDF-DELETE-2
      560   RDF-DELETE-4
      573   RDF-DELETE-5
      586   RDF-DELETE-6
      599   RDF-DELETE-7
      614   RDF-DELETE-8
      631   RDF-DELETE-9
      502   RDF-INIT
      652   RDF-INIT-11
      532   RDF-TEST-003
      504   RDF-TEST-1
      636   RDF-TEST-10
      655   RDF-TEST-11
      683   RDF-TEST-12. . . . . . . . . .  G660 G680
      697   RDF-TEST-13
      712   RDF-TEST-14
      518   RDF-TEST-2
      549   RDF-TEST-4
      565   RDF-TEST-5
      578   RDF-TEST-6
      591   RDF-TEST-7
      604   RDF-TEST-8
      619   RDF-TEST-9
      546   RDF-WRITE-003. . . . . . . . .  G535 G543
      515   RDF-WRITE-1. . . . . . . . . .  G509 G512
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    44
0 Defined   Cross-reference of procedures   References

0     649   RDF-WRITE-10 . . . . . . . . .  G642 G646
      694   RDF-WRITE-12 . . . . . . . . .  G691
      709   RDF-WRITE-13 . . . . . . . . .  G704 G706
      724   RDF-WRITE-14 . . . . . . . . .  G719 G721
      529   RDF-WRITE-2. . . . . . . . . .  G521 G526
      562   RDF-WRITE-4. . . . . . . . . .  G552 G559
      575   RDF-WRITE-5. . . . . . . . . .  G568 G572
      588   RDF-WRITE-6. . . . . . . . . .  G581 G585
      601   RDF-WRITE-7. . . . . . . . . .  G594 G598
      616   RDF-WRITE-8. . . . . . . . . .  G608 G613
      633   RDF-WRITE-9. . . . . . . . . .  G626 G630
      871   RENAM-DELETE-10
      891   RENAM-DELETE-11
      913   RENAM-DELETE-12
      930   RENAM-DELETE-13
      947   RENAM-DELETE-14
      964   RENAM-DELETE-15
      983   RENAM-DELETE-16
      996   RENAM-DELETE-17
     1013   RENAM-DELETE-18
      786   RENAM-DELETE-4
      799   RENAM-DELETE-5
      812   RENAM-DELETE-6
      825   RENAM-DELETE-7
      839   RENAM-DELETE-8
      855   RENAM-DELETE-9
      874   RENAM-FAIL-10. . . . . . . . .  G870
      894   RENAM-FAIL-11. . . . . . . . .  G890
      916   RENAM-FAIL-12. . . . . . . . .  G912
      933   RENAM-FAIL-13. . . . . . . . .  G929
      950   RENAM-FAIL-14. . . . . . . . .  G946
      967   RENAM-FAIL-15. . . . . . . . .  G963
      986   RENAM-FAIL-16. . . . . . . . .  G982
      999   RENAM-FAIL-17. . . . . . . . .  G995
     1016   RENAM-FAIL-18. . . . . . . . .  G1012
      842   RENAM-FAIL-8 . . . . . . . . .  G838
      858   RENAM-FAIL-9 . . . . . . . . .  G854
      830   RENAM-INIT-C
      902   RENAM-INIT-D
      975   RENAM-INIT-E
      730   RENAM-TEST-1
      865   RENAM-TEST-10
      881   RENAM-TEST-11
      905   RENAM-TEST-12
      924   RENAM-TEST-13
      941   RENAM-TEST-14
      958   RENAM-TEST-15
      978   RENAM-TEST-16
      992   RENAM-TEST-17
     1006   RENAM-TEST-18
      746   RENAM-TEST-2
      760   RENAM-TEST-3
      778   RENAM-TEST-4
      791   RENAM-TEST-5
      804   RENAM-TEST-6
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    45
0 Defined   Cross-reference of procedures   References

0     817   RENAM-TEST-7
      832   RENAM-TEST-8
      849   RENAM-TEST-9
      878   RENAM-WRITE-10 . . . . . . . .  G869 G873
      898   RENAM-WRITE-11 . . . . . . . .  G889 G893
      920   RENAM-WRITE-12 . . . . . . . .  G911 G915
      937   RENAM-WRITE-13 . . . . . . . .  G928 G932
      954   RENAM-WRITE-14 . . . . . . . .  G945 G949
      971   RENAM-WRITE-15 . . . . . . . .  G962 G966
      989   RENAM-WRITE-16 . . . . . . . .  G981 G985
     1003   RENAM-WRITE-17 . . . . . . . .  G994 G998
     1020   RENAM-WRITE-18 . . . . . . . .  G1010 G1015
      788   RENAM-WRITE-4. . . . . . . . .  G781 G785
      801   RENAM-WRITE-5. . . . . . . . .  G794 G798
      814   RENAM-WRITE-6. . . . . . . . .  G807 G811
      827   RENAM-WRITE-7. . . . . . . . .  G820 G824
      846   RENAM-WRITE-8. . . . . . . . .  G837 G841
      862   RENAM-WRITE-9. . . . . . . . .  G851 G857
      741   RNM-DELETE-1
      755   RNM-DELETE-2
      768   RNM-DELETE-3
      771   RNM-FAIL-3 . . . . . . . . . .  G763 G764 G765
      727   RNM-INIT
      743   RNM-WRITE-1. . . . . . . . . .  G735 G740
      757   RNM-WRITE-2. . . . . . . . . .  G750 G754
      775   RNM-WRITE-3. . . . . . . . . .  G767 G770
      501   SECT-NC252A-001
      398   TERMINATE-CCVS
      459   WRITE-LINE . . . . . . . . . .  P409 P410 P418 P419 P420 P421 P423 P424 P425 P427 P429 P438 P446 P452 P457 P458
                                            P481 P485 P487 P496
      471   WRT-LN . . . . . . . . . . . .  P465 P466 P467 P470 P475
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    46
0 Defined   Cross-reference of programs     References

        3   NC252A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC252A    Date 06/04/2022  Time 12:00:32   Page    47
0LineID  Message code  Message text

     33  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   1188  IGYPG3174-W   The result of the comparison of operand -0.00002 and an arithmetic expression is known at compile time, based
                       on the attributes of the operands.  Unconditional code was generated.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program NC252A:
 *    Source records = 1706
 *    Data Division statements = 257
 *    Procedure Division statements = 1051
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1075
0End of compilation 1,  program NC252A,  highest severity 4.
0Return code 4
