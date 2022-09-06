1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:50   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:50   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1264.2
   000002         000200 PROGRAM-ID.                                                      NC1264.2
   000003         000300     NC126A.                                                      NC1264.2
   000004         000500*                                                              *  NC1264.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1264.2
   000006         000700*                                                              *  NC1264.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1264.2
   000008         000900*                                                              *  NC1264.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1264.2
   000010         001100*                                                              *  NC1264.2
   000011         001300*                                                              *  NC1264.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1264.2
   000013         001500*                                                              *  NC1264.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1264.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1264.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1264.2
   000017         001900*                                                              *  NC1264.2
   000018         002100*                                                                 NC1264.2
   000019         002200*    PROGRAM NC126A TESTS THE USE OF LEVEL NUMBERS 01 THROUGH 49  NC1264.2
   000020         002300*    INCLUSIVE WITH A VARIETY OF PICTURE CLAUSES AND GROUP AND    NC1264.2
   000021         002400*    ELEMENTARY COMPARISONS.                                      NC1264.2
   000022         002500*                                                                 NC1264.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1264.2
   000024         002700 CONFIGURATION SECTION.                                           NC1264.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1264.2
   000026         002900     XXXXX082.                                                    NC1264.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1264.2
   000028         003100     XXXXX083.                                                    NC1264.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1264.2
   000030         003300 FILE-CONTROL.                                                    NC1264.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1264.2 35
   000032         003500     XXXXX055.                                                    NC1264.2
   000033         003600 DATA DIVISION.                                                   NC1264.2
   000034         003700 FILE SECTION.                                                    NC1264.2
   000035         003800 FD  PRINT-FILE.                                                  NC1264.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1264.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1264.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1264.2
   000039         004200 01  TEST-GROUP-1.                                                NC1264.2
   000040         004300     02 GP-1  PICTURE ZZZ999.                                     NC1264.2
   000041         004400     02 GPLEVEL-1.                                                NC1264.2
   000042         004500      03 GP-2  PICTURE 9(9).99.                                   NC1264.2
   000043         004600      03 GPLEVEL-2.                                               NC1264.2
   000044         004700       04 GP-3 PICTURE  0009(9).                                  NC1264.2
   000045         004800       04 GPLEVEL-3.                                              NC1264.2
   000046         004900        05 GP-4 PICTURE  ZBZBZ9.                                  NC1264.2
   000047         005000        05 GPLEVEL-4.                                             NC1264.2
   000048         005100           06  GP-5  PICTURE  $$$,$99.99.                         NC1264.2
   000049         005200         06 GPLEVEL-5.                                            NC1264.2
   000050         005300          07 GP-6 PICTURE  ******99.                              NC1264.2
   000051         005400          07 GPLEVEL-6.                                           NC1264.2
   000052         005500           08 GP-7 PICTURE +999,999.                              NC1264.2
   000053         005600           08 GPLEVEL-7.                                          NC1264.2
   000054         005700            09 GP-8 PICTURE X(14).                                NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800            09 GPLEVEL-8.                                         NC1264.2
   000056         005900             10 GP-9 PICTURE XBXBXBX.                             NC1264.2
   000057         006000             10 GPLEVEL-9.                                        NC1264.2
   000058         006100              11 GP-10 PICTURE 9090900.                           NC1264.2
   000059         006200              11 GPLEVEL-10.                                      NC1264.2
   000060         006300               12 GP-11  PICTURE $999,999.00.                     NC1264.2
   000061         006400               12 GPLEVEL-11.                                     NC1264.2
   000062         006500                13 GP-12 PICTURE ZZZ.9.                           NC1264.2
   000063         006600                13 GPLEVEL-12.                                    NC1264.2
   000064         006700                 14 GP-13 PICTURE  ZZ9B900.                       NC1264.2
   000065         006800                 14 GPLEVEL-13.                                   NC1264.2
   000066         006900                  15 GP-14  PICTURE  XXXX.                        NC1264.2
   000067         007000                  15 GPLEVEL-14.                                  NC1264.2
   000068         007100     16 GP-15 PICTURE  9(10).                                     NC1264.2
   000069         007200     16 GPLEVEL-15.                                               NC1264.2
   000070         007300      17 GP-16 PICTURE  Z(11).                                    NC1264.2
   000071         007400      17 GPLEVEL-16.                                              NC1264.2
   000072         007500       18 GP-17  PICTURE  99BB909.                                NC1264.2
   000073         007600       18 GPLEVEL-17.                                             NC1264.2
   000074         007700        19 GP-18  PICTURE -*B*99.                                 NC1264.2
   000075         007800        19 GPLEVEL-18.                                            NC1264.2
   000076         007900         20 GP-19 PICTURE  0009999.                               NC1264.2
   000077         008000         20 GPLEVEL-19.                                           NC1264.2
   000078         008100          21 GP-20 PICTURE  999DB.                                NC1264.2
   000079         008200          21 GPLEVEL-20.                                          NC1264.2
   000080         008300           22 GP-21 PICTURE  ABABABA.                             NC1264.2
   000081         008400           22 GPLEVEL-21.                                         NC1264.2
   000082         008500            23 GP-22 PICTURE *999999.                             NC1264.2
   000083         008600            23 GPLEVEL-22.                                        NC1264.2
   000084         008700             24 GP-23 PICTURE XXXXXA.                             NC1264.2
   000085         008800             24 GPLEVEL-23.                                       NC1264.2
   000086         008900              25 GP-24  PICTURE  $$$,$$$.99.                      NC1264.2
   000087         009000              25 GPLEVEL-24.                                      NC1264.2
   000088         009100               26 GP-25  PICTURE  9BB9BBB9BBB.                    NC1264.2
   000089         009200               26 GPLEVEL-25.                                     NC1264.2
   000090         009300                27 GP-26 PICTURE  9990009.                        NC1264.2
   000091         009400                27 GPLEVEL-26.                                    NC1264.2
   000092         009500                 28 GP-27 PICTURE  9,999,999.                     NC1264.2
   000093         009600                 28 GPLEVEL-27.                                   NC1264.2
   000094         009700                  29 GP-28 PICTURE   9(7),9.                      NC1264.2
   000095         009800                  29 GPLEVEL-28.                                  NC1264.2
   000096         009900                   30 GP-29  PICTURE  $***.99.                    NC1264.2
   000097         010000                   30 GPLEVEL-29.                                 NC1264.2
   000098         010100     31 GP-30  PICTURE  X(15).                                    NC1264.2
   000099         010200     31 GPLEVEL-30.                                               NC1264.2
   000100         010300      32 GP-31  PICTURE  9(10).                                   NC1264.2
   000101         010400      32 GPLEVEL-31.                                              NC1264.2
   000102         010500       33 GP-32 PICTURE  *99.                                     NC1264.2
   000103         010600       33 GPLEVEL-32.                                             NC1264.2
   000104         010700        34 GP-33 PICTURE  ZZZ9.                                   NC1264.2
   000105         010800        34 GPLEVEL-33.                                            NC1264.2
   000106         010900         35 GP-34  PICTURE BB9BB9.                                NC1264.2
   000107         011000         35 GPLEVEL-34.                                           NC1264.2
   000108         011100          36 GP-35 PICTURE  $99,999.99.                           NC1264.2
   000109         011200          36 GPLEVEL-35.                                          NC1264.2
   000110         011300           37 GP-36  PICTURE  090909.                             NC1264.2
   000111         011400           37 GPLEVEL-36.                                         NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500            38 GP-37  PICTURE  ZZZZ.                              NC1264.2
   000113         011600            38 GPLEVEL-37.                                        NC1264.2
   000114         011700             39 GP-38  PICTURE  +99.                              NC1264.2
   000115         011800             39 GPLEVEL-38.                                       NC1264.2
   000116         011900              40 GP-39  PICTURE -99.                              NC1264.2
   000117         012000              40 GPLEVEL-39.                                      NC1264.2
   000118         012100               41 GP-40  PICTURE  99CR.                           NC1264.2
   000119         012200               41 GPLEVEL-40.                                     NC1264.2
   000120         012300                42 GP-41  PICTURE  99DB.                          NC1264.2
   000121         012400                42 GPLEVEL-41.                                    NC1264.2
   000122         012500                 43 GP-42  PICTURE  ****.                         NC1264.2
   000123         012600                 43 GPLEVEL-42.                                   NC1264.2
   000124         012700                  44 GP-43  PICTURE  AAA.                         NC1264.2
   000125         012800                  44 GPLEVEL-43.                                  NC1264.2
   000126         012900                   45 GP-44  PICTURE XXX.                         NC1264.2
   000127         013000                   45 GPLEVEL-44.                                 NC1264.2
   000128         013100     46 GP-45  PICTURE  *9999.                                    NC1264.2
   000129         013200     46 GPLEVEL-45.                                               NC1264.2
   000130         013300      47 GP-46  PICTURE  9(10).99.                                NC1264.2
   000131         013400      47 GPLEVEL-46.                                              NC1264.2
   000132         013500       48 GP-47           OCCURS 2 TIMES  PICTURE 9.              NC1264.2
   000133         013600       48 GPLEVEL-47.                                             NC1264.2
   000134         013700        49 GP-48          OCCURS 2 TIMES  PICTURE X.              NC1264.2
   000135         013800 01  TABLE-GROUP.                                                 NC1264.2
   000136         013900     02  TB-1  PICTURE XX.                                        NC1264.2
   000137         014000     02  TBGRP-1.                                                 NC1264.2
   000138         014100      03 TB-2  PICTURE XX.                                        NC1264.2
   000139         014200      03 TBGRP-2.                                                 NC1264.2
   000140         014300       04 TB-3 PICTURE XX.                                        NC1264.2
   000141         014400       04 TBGRP-3.                                                NC1264.2
   000142         014500        05 TB-4  PICTURE XX.                                      NC1264.2
   000143         014600        05 TBGRP-4.                                               NC1264.2
   000144         014700         06 TB-5  PICTURE XX.                                     NC1264.2
   000145         014800         06 TBGRP-5.                                              NC1264.2
   000146         014900          07 TB-6  PICTURE XX.                                    NC1264.2
   000147         015000          07 TBGRP-6.                                             NC1264.2
   000148         015100           08 TB-7  PICTURE XX.                                   NC1264.2
   000149         015200           08 TBGRP-7.                                            NC1264.2
   000150         015300            09 TB-8  PICTURE XX.                                  NC1264.2
   000151         015400            09 TBGRP-8.                                           NC1264.2
   000152         015500             10 TB-9 PICTURE XX.                                  NC1264.2
   000153         015600             10 TBGRP-9.                                          NC1264.2
   000154         015700              11 TB-10 PICTURE XX.                                NC1264.2
   000155         015800              11 TBGRP-10.                                        NC1264.2
   000156         015900               12 TB-11 PICTURE XX.                               NC1264.2
   000157         016000               12 TBGRP-11.                                       NC1264.2
   000158         016100                13 TB-12  PICTURE XX.                             NC1264.2
   000159         016200                13 TBGRP-12.                                      NC1264.2
   000160         016300                14 TB-13  PICTURE XX.                             NC1264.2
   000161         016400                14 TBGRP-13.                                      NC1264.2
   000162         016500                 15 TB-14  PICTURE XX.                            NC1264.2
   000163         016600                 15 TBGRP-14.                                     NC1264.2
   000164         016700     16 TB-15 PICTURE XX.                                         NC1264.2
   000165         016800     16 TBGRP-15.                                                 NC1264.2
   000166         016900      17 TB-16 PICTURE XX.                                        NC1264.2
   000167         017000      17 TBGRP-16.                                                NC1264.2
   000168         017100       18 TB-17 PICTURE XX.                                       NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200       18 TBGRP-17.                                               NC1264.2
   000170         017300        19 TB-18 PICTURE XX.                                      NC1264.2
   000171         017400        19 TBGRP-18.                                              NC1264.2
   000172         017500         20 TB-19 PICTURE XX.                                     NC1264.2
   000173         017600         20 TBGRP-19.                                             NC1264.2
   000174         017700          21 TB-20 PICTURE XX.                                    NC1264.2
   000175         017800          21 TBGRP-20.                                            NC1264.2
   000176         017900           22 TB-21 PICTURE XX.                                   NC1264.2
   000177         018000           22 TBGRP-21.                                           NC1264.2
   000178         018100            23 TB-22 PICTURE XX.                                  NC1264.2
   000179         018200            23 TBGRP-22.                                          NC1264.2
   000180         018300             24 TB-23  PICTURE XX.                                NC1264.2
   000181         018400             24 TBGRP-23.                                         NC1264.2
   000182         018500              25 TB-24 PICTURE XX.                                NC1264.2
   000183         018600              25 TBGRP-24.                                        NC1264.2
   000184         018700               26 TB-25 PICTURE XX.                               NC1264.2
   000185         018800               26 TBGRP-25.                                       NC1264.2
   000186         018900                27 TB-26 PICTURE XX.                              NC1264.2
   000187         019000                27 TBGRP-26.                                      NC1264.2
   000188         019100                 28 TB-27 PICTURE XX.                             NC1264.2
   000189         019200                 28 TBGRP-27.                                     NC1264.2
   000190         019300                  29 TB-28 PICTURE XX.                            NC1264.2
   000191         019400                  29 TBGRP-28.                                    NC1264.2
   000192         019500                   30 TB-29 PICTURE XX.                           NC1264.2
   000193         019600                   30 TBGRP-29.                                   NC1264.2
   000194         019700     31 TB-30  PICTURE XX.                                        NC1264.2
   000195         019800     31 TBGRP-30.                                                 NC1264.2
   000196         019900      32 TB-31  PICTURE XX.                                       NC1264.2
   000197         020000      32 TBGRP-31.                                                NC1264.2
   000198         020100       33 TB-32  PICTURE XX.                                      NC1264.2
   000199         020200       33 TBGRP-32.                                               NC1264.2
   000200         020300        34 TB-33  PICTURE XX.                                     NC1264.2
   000201         020400        34 TBGRP-33.                                              NC1264.2
   000202         020500         35 TB-34  PICTURE XX.                                    NC1264.2
   000203         020600         35 TBGRP-34.                                             NC1264.2
   000204         020700          36 TB-35 PICTURE XX.                                    NC1264.2
   000205         020800          36 TBGRP-35.                                            NC1264.2
   000206         020900           37 TB-36  PICTURE XX.                                  NC1264.2
   000207         021000           37 TBGRP-36.                                           NC1264.2
   000208         021100            38 TB-37  PICTURE XX.                                 NC1264.2
   000209         021200            38 TBGRP-37.                                          NC1264.2
   000210         021300             39 TB-38  PICTURE XX.                                NC1264.2
   000211         021400             39 TBGRP-38.                                         NC1264.2
   000212         021500              40 TB-39  PICTURE XX.                               NC1264.2
   000213         021600              40 TBGRP-39.                                        NC1264.2
   000214         021700               41 TB-40  PICTURE XX.                              NC1264.2
   000215         021800               41 TBGRP-40.                                       NC1264.2
   000216         021900                42 TB-41  PICTURE XX.                             NC1264.2
   000217         022000                42 TBGRP-41.                                      NC1264.2
   000218         022100                 43 TB-42  PICTURE XX.                            NC1264.2
   000219         022200                 43 TBGRP-42.                                     NC1264.2
   000220         022300                  44 TB-43  PICTURE XX.                           NC1264.2
   000221         022400                  44 TBGRP-43.                                    NC1264.2
   000222         022500                   45 TB-44  PICTURE XX.                          NC1264.2
   000223         022600                   45 TBGRP-44.                                   NC1264.2
   000224         022700     46 TB-45  PICTURE XX.                                        NC1264.2
   000225         022800     46 TBGRP-45.                                                 NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900      47 TB-46  PICTURE XX.                                       NC1264.2
   000227         023000      47 TBGRP-46.                                                NC1264.2
   000228         023100       48 TB-47  PICTURE XX.                                      NC1264.2
   000229         023200       48 TBGRP-47.                                               NC1264.2
   000230         023300        49 TB-48  PICTURE XX.                                     NC1264.2
   000231         023400 01  LITERAL-98.                                                  NC1264.2
   000232         023500     02 A-PART-98  PICTURE X(20) VALUE "ABCDEFGHIJKLMNOPQRST".    NC1264.2
   000233         023600     02 B-PART-98  PICTURE X(20) VALUE "01234567899876543210".    NC1264.2
   000234         023700     02 C-PART-98  PICTURE X(20) VALUE "SUPERCALIFRAGILISTIC".    NC1264.2
   000235         023800     02 D-PART-98  PICTURE X(20) VALUE "THAT LITERAL WAS BAD".    NC1264.2
   000236         023900     02 E-PART-98  PICTURE X(16) VALUE "UP ON THE ROOFS".         NC1264.2
   000237         024000 01  BREAKDOWN-RECORD.                                            NC1264.2
   000238         024100     02 LENGTH-COUNTER  PICTURE 999 VALUE ZERO.                   NC1264.2 IMP
   000239         024200     02 COMPUTED-BREAKDOWN.                                       NC1264.2
   000240         024300         03 CM-20       PICTURE X(20).                            NC1264.2
   000241         024400         03 CM-40       PICTURE X(20).                            NC1264.2
   000242         024500         03 CM-60       PICTURE X(20).                            NC1264.2
   000243         024600         03 CM-80       PICTURE X(20).                            NC1264.2
   000244         024700         03 CM-100      PICTURE X(20).                            NC1264.2
   000245         024800         03 CM-120      PICTURE X(20).                            NC1264.2
   000246         024900         03 CM-140      PICTURE X(20).                            NC1264.2
   000247         025000         03 CM-160      PICTURE X(20).                            NC1264.2
   000248         025100         03 CM-180      PICTURE X(20).                            NC1264.2
   000249         025200         03 CM-200      PICTURE X(20).                            NC1264.2
   000250         025300     02 CORRECT-BREAKDOWN.                                        NC1264.2
   000251         025400         03 CR-20       PICTURE X(20).                            NC1264.2
   000252         025500         03 CR-40       PICTURE X(20).                            NC1264.2
   000253         025600         03 CR-60       PICTURE X(20).                            NC1264.2
   000254         025700         03 CR-80       PICTURE X(20).                            NC1264.2
   000255         025800         03 CR-100      PICTURE X(20).                            NC1264.2
   000256         025900         03 CR-120      PICTURE X(20).                            NC1264.2
   000257         026000         03 CR-140      PICTURE X(20).                            NC1264.2
   000258         026100         03 CR-160      PICTURE X(20).                            NC1264.2
   000259         026200         03 CR-180      PICTURE X(20).                            NC1264.2
   000260         026300         03 CR-200      PICTURE X(20).                            NC1264.2
   000261         026400 01  TEST-RESULTS.                                                NC1264.2
   000262         026500     02 FILLER                   PIC X      VALUE SPACE.          NC1264.2 IMP
   000263         026600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1264.2 IMP
   000264         026700     02 FILLER                   PIC X      VALUE SPACE.          NC1264.2 IMP
   000265         026800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1264.2 IMP
   000266         026900     02 FILLER                   PIC X      VALUE SPACE.          NC1264.2 IMP
   000267         027000     02  PAR-NAME.                                                NC1264.2
   000268         027100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1264.2 IMP
   000269         027200       03  PARDOT-X              PIC X      VALUE SPACE.          NC1264.2 IMP
   000270         027300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1264.2 IMP
   000271         027400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1264.2 IMP
   000272         027500     02 RE-MARK                  PIC X(61).                       NC1264.2
   000273         027600 01  TEST-COMPUTED.                                               NC1264.2
   000274         027700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1264.2 IMP
   000275         027800     02 FILLER                   PIC X(17)  VALUE                 NC1264.2
   000276         027900            "       COMPUTED=".                                   NC1264.2
   000277         028000     02 COMPUTED-X.                                               NC1264.2
   000278         028100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1264.2 IMP
   000279         028200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1264.2 278
   000280         028300                                 PIC -9(9).9(9).                  NC1264.2
   000281         028400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1264.2 278
   000282         028500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1264.2 278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1264.2 278
   000284         028700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1264.2 278
   000285         028800         04 COMPUTED-18V0                    PIC -9(18).          NC1264.2
   000286         028900         04 FILLER                           PIC X.               NC1264.2
   000287         029000     03 FILLER PIC X(50) VALUE SPACE.                             NC1264.2 IMP
   000288         029100 01  TEST-CORRECT.                                                NC1264.2
   000289         029200     02 FILLER PIC X(30) VALUE SPACE.                             NC1264.2 IMP
   000290         029300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1264.2
   000291         029400     02 CORRECT-X.                                                NC1264.2
   000292         029500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1264.2 IMP
   000293         029600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1264.2 292
   000294         029700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1264.2 292
   000295         029800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1264.2 292
   000296         029900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1264.2 292
   000297         030000     03      CR-18V0 REDEFINES CORRECT-A.                         NC1264.2 292
   000298         030100         04 CORRECT-18V0                     PIC -9(18).          NC1264.2
   000299         030200         04 FILLER                           PIC X.               NC1264.2
   000300         030300     03 FILLER PIC X(2) VALUE SPACE.                              NC1264.2 IMP
   000301         030400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1264.2 IMP
   000302         030500 01  CCVS-C-1.                                                    NC1264.2
   000303         030600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1264.2
   000304         030700-    "SS  PARAGRAPH-NAME                                          NC1264.2
   000305         030800-    "       REMARKS".                                            NC1264.2
   000306         030900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1264.2 IMP
   000307         031000 01  CCVS-C-2.                                                    NC1264.2
   000308         031100     02 FILLER                     PIC X        VALUE SPACE.      NC1264.2 IMP
   000309         031200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1264.2
   000310         031300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1264.2 IMP
   000311         031400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1264.2
   000312         031500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1264.2 IMP
   000313         031600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1264.2 IMP
   000314         031700 01  REC-CT                        PIC 99       VALUE ZERO.       NC1264.2 IMP
   000315         031800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1264.2 IMP
   000316         031900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1264.2 IMP
   000317         032000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1264.2 IMP
   000318         032100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1264.2 IMP
   000319         032200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1264.2 IMP
   000320         032300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1264.2 IMP
   000321         032400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1264.2 IMP
   000322         032500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1264.2 IMP
   000323         032600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1264.2 IMP
   000324         032700 01  CCVS-H-1.                                                    NC1264.2
   000325         032800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1264.2 IMP
   000326         032900     02  FILLER                    PIC X(42)    VALUE             NC1264.2
   000327         033000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1264.2
   000328         033100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1264.2 IMP
   000329         033200 01  CCVS-H-2A.                                                   NC1264.2
   000330         033300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1264.2 IMP
   000331         033400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1264.2
   000332         033500   02  FILLER                        PIC XXXX   VALUE             NC1264.2
   000333         033600     "4.2 ".                                                      NC1264.2
   000334         033700   02  FILLER                        PIC X(28)  VALUE             NC1264.2
   000335         033800            " COPY - NOT FOR DISTRIBUTION".                       NC1264.2
   000336         033900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1264.2 IMP
   000337         034000                                                                  NC1264.2
   000338         034100 01  CCVS-H-2B.                                                   NC1264.2
   000339         034200   02  FILLER                        PIC X(15)  VALUE             NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300            "TEST RESULT OF ".                                    NC1264.2
   000341         034400   02  TEST-ID                       PIC X(9).                    NC1264.2
   000342         034500   02  FILLER                        PIC X(4)   VALUE             NC1264.2
   000343         034600            " IN ".                                               NC1264.2
   000344         034700   02  FILLER                        PIC X(12)  VALUE             NC1264.2
   000345         034800     " HIGH       ".                                              NC1264.2
   000346         034900   02  FILLER                        PIC X(22)  VALUE             NC1264.2
   000347         035000            " LEVEL VALIDATION FOR ".                             NC1264.2
   000348         035100   02  FILLER                        PIC X(58)  VALUE             NC1264.2
   000349         035200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1264.2
   000350         035300 01  CCVS-H-3.                                                    NC1264.2
   000351         035400     02  FILLER                      PIC X(34)  VALUE             NC1264.2
   000352         035500            " FOR OFFICIAL USE ONLY    ".                         NC1264.2
   000353         035600     02  FILLER                      PIC X(58)  VALUE             NC1264.2
   000354         035700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1264.2
   000355         035800     02  FILLER                      PIC X(28)  VALUE             NC1264.2
   000356         035900            "  COPYRIGHT   1985 ".                                NC1264.2
   000357         036000 01  CCVS-E-1.                                                    NC1264.2
   000358         036100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1264.2 IMP
   000359         036200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1264.2
   000360         036300     02 ID-AGAIN                     PIC X(9).                    NC1264.2
   000361         036400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1264.2 IMP
   000362         036500 01  CCVS-E-2.                                                    NC1264.2
   000363         036600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1264.2 IMP
   000364         036700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1264.2 IMP
   000365         036800     02 CCVS-E-2-2.                                               NC1264.2
   000366         036900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1264.2 IMP
   000367         037000         03 FILLER                   PIC X      VALUE SPACE.      NC1264.2 IMP
   000368         037100         03 ENDER-DESC               PIC X(44)  VALUE             NC1264.2
   000369         037200            "ERRORS ENCOUNTERED".                                 NC1264.2
   000370         037300 01  CCVS-E-3.                                                    NC1264.2
   000371         037400     02  FILLER                      PIC X(22)  VALUE             NC1264.2
   000372         037500            " FOR OFFICIAL USE ONLY".                             NC1264.2
   000373         037600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1264.2 IMP
   000374         037700     02  FILLER                      PIC X(58)  VALUE             NC1264.2
   000375         037800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1264.2
   000376         037900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1264.2 IMP
   000377         038000     02 FILLER                       PIC X(15)  VALUE             NC1264.2
   000378         038100             " COPYRIGHT 1985".                                   NC1264.2
   000379         038200 01  CCVS-E-4.                                                    NC1264.2
   000380         038300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1264.2 IMP
   000381         038400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1264.2
   000382         038500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1264.2 IMP
   000383         038600     02 FILLER                       PIC X(40)  VALUE             NC1264.2
   000384         038700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1264.2
   000385         038800 01  XXINFO.                                                      NC1264.2
   000386         038900     02 FILLER                       PIC X(19)  VALUE             NC1264.2
   000387         039000            "*** INFORMATION ***".                                NC1264.2
   000388         039100     02 INFO-TEXT.                                                NC1264.2
   000389         039200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1264.2 IMP
   000390         039300       04 XXCOMPUTED                 PIC X(20).                   NC1264.2
   000391         039400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1264.2 IMP
   000392         039500       04 XXCORRECT                  PIC X(20).                   NC1264.2
   000393         039600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1264.2
   000394         039700 01  HYPHEN-LINE.                                                 NC1264.2
   000395         039800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1264.2 IMP
   000396         039900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000-    "*****************************************".                 NC1264.2
   000398         040100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1264.2
   000399         040200-    "******************************".                            NC1264.2
   000400         040300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1264.2
   000401         040400     "NC126A".                                                    NC1264.2
   000402         040500 PROCEDURE DIVISION.                                              NC1264.2
   000403         040600 CCVS1 SECTION.                                                   NC1264.2
   000404         040700 OPEN-FILES.                                                      NC1264.2
   000405         040800     OPEN     OUTPUT PRINT-FILE.                                  NC1264.2 35
   000406         040900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1264.2 400 341 400 360
   000407         041000     MOVE    SPACE TO TEST-RESULTS.                               NC1264.2 IMP 261
   000408         041100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1264.2 433 438
   000409         041200     GO TO CCVS1-EXIT.                                            NC1264.2 520
   000410         041300 CLOSE-FILES.                                                     NC1264.2
   000411         041400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1264.2 442 463 35
   000412         041500 TERMINATE-CCVS.                                                  NC1264.2
   000413         041600     EXIT PROGRAM.                                                NC1264.2
   000414         041700 TERMINATE-CALL.                                                  NC1264.2
   000415         041800     STOP     RUN.                                                NC1264.2
   000416         041900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1264.2 265 317
   000417         042000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1264.2 265 318
   000418         042100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1264.2 265 316
   000419         042200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1264.2 265 315
   000420         042300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1264.2 272
   000421         042400 PRINT-DETAIL.                                                    NC1264.2
   000422         042500     IF REC-CT NOT EQUAL TO ZERO                                  NC1264.2 314 IMP
   000423      1  042600             MOVE "." TO PARDOT-X                                 NC1264.2 269
   000424      1  042700             MOVE REC-CT TO DOTVALUE.                             NC1264.2 314 270
   000425         042800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1264.2 261 36 475
   000426         042900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1264.2 265 475
   000427      1  043000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1264.2 496 510
   000428      1  043100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1264.2 511 519
   000429         043200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1264.2 IMP 265 IMP 277
   000430         043300     MOVE SPACE TO CORRECT-X.                                     NC1264.2 IMP 291
   000431         043400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1264.2 314 IMP IMP 267
   000432         043500     MOVE     SPACE TO RE-MARK.                                   NC1264.2 IMP 272
   000433         043600 HEAD-ROUTINE.                                                    NC1264.2
   000434         043700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1264.2 324 37 475
   000435         043800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1264.2 329 37 475
   000436         043900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1264.2 338 37 475
   000437         044000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1264.2 350 37 475
   000438         044100 COLUMN-NAMES-ROUTINE.                                            NC1264.2
   000439         044200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1264.2 302 37 475
   000440         044300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1264.2 307 37 475
   000441         044400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1264.2 394 37 475
   000442         044500 END-ROUTINE.                                                     NC1264.2
   000443         044600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1264.2 394 37 475
   000444         044700 END-RTN-EXIT.                                                    NC1264.2
   000445         044800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1264.2 357 37 475
   000446         044900 END-ROUTINE-1.                                                   NC1264.2
   000447         045000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1264.2 316 320 317
   000448         045100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1264.2 320 315 320
   000449         045200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1264.2 318 320
   000450         045300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1264.2
   000451         045400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1264.2 318 380
   000452         045500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1264.2 320 382
   000453         045600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1264.2 379 365
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1264.2 362 37 475
   000455         045800  END-ROUTINE-12.                                                 NC1264.2
   000456         045900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1264.2 368
   000457         046000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1264.2 316 IMP
   000458      1  046100         MOVE "NO " TO ERROR-TOTAL                                NC1264.2 366
   000459         046200         ELSE                                                     NC1264.2
   000460      1  046300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1264.2 316 366
   000461         046400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1264.2 362 37
   000462         046500     PERFORM WRITE-LINE.                                          NC1264.2 475
   000463         046600 END-ROUTINE-13.                                                  NC1264.2
   000464         046700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1264.2 315 IMP
   000465      1  046800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1264.2 366
   000466      1  046900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1264.2 315 366
   000467         047000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1264.2 368
   000468         047100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1264.2 362 37 475
   000469         047200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1264.2 317 IMP
   000470      1  047300          MOVE "NO " TO ERROR-TOTAL                               NC1264.2 366
   000471      1  047400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1264.2 317 366
   000472         047500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1264.2 368
   000473         047600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1264.2 362 37 475
   000474         047700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1264.2 370 37 475
   000475         047800 WRITE-LINE.                                                      NC1264.2
   000476         047900     ADD 1 TO RECORD-COUNT.                                       NC1264.2 322
   000477         048000     IF RECORD-COUNT GREATER 42                                   NC1264.2 322
   000478      1  048100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1264.2 37 321
   000479      1  048200         MOVE SPACE TO DUMMY-RECORD                               NC1264.2 IMP 37
   000480      1  048300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1264.2 37
   000481      1  048400         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1264.2 324 37 491
   000482      1  048500         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1264.2 329 37 491
   000483      1  048600         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1264.2 338 37 491
   000484      1  048700         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1264.2 350 37 491
   000485      1  048800         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1264.2 302 37 491
   000486      1  048900         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1264.2 307 37 491
   000487      1  049000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1264.2 394 37 491
   000488      1  049100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1264.2 321 37
   000489      1  049200         MOVE ZERO TO RECORD-COUNT.                               NC1264.2 IMP 322
   000490         049300     PERFORM WRT-LN.                                              NC1264.2 491
   000491         049400 WRT-LN.                                                          NC1264.2
   000492         049500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1264.2 37
   000493         049600     MOVE SPACE TO DUMMY-RECORD.                                  NC1264.2 IMP 37
   000494         049700 BLANK-LINE-PRINT.                                                NC1264.2
   000495         049800     PERFORM WRT-LN.                                              NC1264.2 491
   000496         049900 FAIL-ROUTINE.                                                    NC1264.2
   000497         050000     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1264.2 277 IMP
   000498      1  050100            GO TO FAIL-ROUTINE-WRITE.                             NC1264.2 505
   000499         050200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1264.2 291 IMP 505
   000500         050300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1264.2 323 393
   000501         050400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1264.2 388
   000502         050500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1264.2 385 37 475
   000503         050600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1264.2 IMP 393
   000504         050700     GO TO  FAIL-ROUTINE-EX.                                      NC1264.2 510
   000505         050800 FAIL-ROUTINE-WRITE.                                              NC1264.2
   000506         050900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1264.2 273 36 475
   000507         051000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1264.2 323 301
   000508         051100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1264.2 288 36 475
   000509         051200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1264.2 IMP 301
   000510         051300 FAIL-ROUTINE-EX. EXIT.                                           NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400 BAIL-OUT.                                                        NC1264.2
   000512         051500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1264.2 278 IMP 514
   000513         051600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1264.2 292 IMP 519
   000514         051700 BAIL-OUT-WRITE.                                                  NC1264.2
   000515         051800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1264.2 292 392 278 390
   000516         051900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1264.2 323 393
   000517         052000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1264.2 385 37 475
   000518         052100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1264.2 IMP 393
   000519         052200 BAIL-OUT-EX. EXIT.                                               NC1264.2
   000520         052300 CCVS1-EXIT.                                                      NC1264.2
   000521         052400     EXIT.                                                        NC1264.2
   000522         052500 SECT-NC126A-001 SECTION.                                         NC1264.2
   000523         052600 LEV-INIT-GF-1-1.                                                 NC1264.2
   000524         052700     MOVE "VI-21 5.3.3 SR1" TO ANSI-REFERENCE.                    NC1264.2 323
   000525         052800     MOVE "SPACE MOVED TO GRP"  TO FEATURE.                       NC1264.2 263
   000526         052900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000527         053000     MOVE "GROUP ITEM CHECK  " TO FEATURE.                        NC1264.2 263
   000528         053100 LEV-TEST-GF-1-0.                                                 NC1264.2
   000529         053200     MOVE SPACE  TO TABLE-GROUP.                                  NC1264.2 IMP 135
   000530         053300 LEV-TEST-GF-1-1.                                                 NC1264.2
   000531         053400     IF TBGRP-1 EQUAL TO  SPACE                                   NC1264.2 137 IMP
   000532      1  053500              PERFORM PASS                                        NC1264.2 417
   000533      1  053600              GO  TO   LEV-WRITE-GF-1-1.                          NC1264.2 540
   000534         053700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000535         053800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000536         053900     MOVE  94     TO LENGTH-COUNTER.                              NC1264.2 238
   000537         054000     GO   TO    LEV-WRITE-GF-1-1.                                 NC1264.2 540
   000538         054100 LEV-DELETE-GF-1-1.                                               NC1264.2
   000539         054200     PERFORM DE-LETE.                                             NC1264.2 419
   000540         054300 LEV-WRITE-GF-1-1.                                                NC1264.2
   000541         054400     MOVE  "LEV-TEST-GF-1-1"  TO PAR-NAME.                        NC1264.2 267
   000542         054500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000543      1  054600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000544         054700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000545         054800 LEV-TEST-GF-1-2.                                                 NC1264.2
   000546         054900     IF TBGRP-2 EQUAL TO  SPACE                                   NC1264.2 139 IMP
   000547      1  055000              PERFORM PASS                                        NC1264.2 417
   000548      1  055100              GO  TO   LEV-WRITE-GF-1-2.                          NC1264.2 555
   000549         055200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000550         055300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000551         055400     MOVE  92     TO LENGTH-COUNTER.                              NC1264.2 238
   000552         055500     GO   TO    LEV-WRITE-GF-1-2.                                 NC1264.2 555
   000553         055600 LEV-DELETE-GF-1-2.                                               NC1264.2
   000554         055700     PERFORM DE-LETE.                                             NC1264.2 419
   000555         055800 LEV-WRITE-GF-1-2.                                                NC1264.2
   000556         055900     MOVE  "LEV-TEST-GF-1-2"  TO PAR-NAME.                        NC1264.2 267
   000557         056000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000558      1  056100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000559         056200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000560         056300 LEV-TEST-GF-1-3.                                                 NC1264.2
   000561         056400     IF TBGRP-3   EQUAL TO SPACE                                  NC1264.2 141 IMP
   000562      1  056500              PERFORM PASS                                        NC1264.2 417
   000563      1  056600              GO  TO   LEV-WRITE-GF-1-3.                          NC1264.2 570
   000564         056700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000565         056800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000566         056900     MOVE  90     TO LENGTH-COUNTER.                              NC1264.2 238
   000567         057000     GO   TO    LEV-WRITE-GF-1-3.                                 NC1264.2 570
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100 LEV-DELETE-GF-1-3.                                               NC1264.2
   000569         057200     PERFORM DE-LETE.                                             NC1264.2 419
   000570         057300 LEV-WRITE-GF-1-3.                                                NC1264.2
   000571         057400     MOVE  "LEV-TEST-GF-1-3"  TO PAR-NAME.                        NC1264.2 267
   000572         057500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000573      1  057600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000574         057700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000575         057800 LEV-TEST-GF-1-4.                                                 NC1264.2
   000576         057900     IF TBGRP-4   EQUAL TO SPACE                                  NC1264.2 143 IMP
   000577      1  058000              PERFORM PASS                                        NC1264.2 417
   000578      1  058100              GO  TO   LEV-WRITE-GF-1-4.                          NC1264.2 585
   000579         058200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000580         058300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000581         058400     MOVE  88     TO LENGTH-COUNTER.                              NC1264.2 238
   000582         058500     GO   TO    LEV-WRITE-GF-1-4.                                 NC1264.2 585
   000583         058600 LEV-DELETE-GF-1-4.                                               NC1264.2
   000584         058700     PERFORM DE-LETE.                                             NC1264.2 419
   000585         058800 LEV-WRITE-GF-1-4.                                                NC1264.2
   000586         058900     MOVE  "LEV-TEST-GF-1-4"  TO PAR-NAME.                        NC1264.2 267
   000587         059000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000588      1  059100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000589         059200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000590         059300 LEV-TEST-GF-1-5.                                                 NC1264.2
   000591         059400     IF TBGRP-5   EQUAL TO   SPACE                                NC1264.2 145 IMP
   000592      1  059500              PERFORM PASS                                        NC1264.2 417
   000593      1  059600              GO  TO   LEV-WRITE-GF-1-5.                          NC1264.2 600
   000594         059700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000595         059800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000596         059900     MOVE  86     TO LENGTH-COUNTER.                              NC1264.2 238
   000597         060000     GO   TO    LEV-WRITE-GF-1-5.                                 NC1264.2 600
   000598         060100 LEV-DELETE-GF-1-5.                                               NC1264.2
   000599         060200     PERFORM DE-LETE.                                             NC1264.2 419
   000600         060300 LEV-WRITE-GF-1-5.                                                NC1264.2
   000601         060400     MOVE  "LEV-TEST-GF-1-5"  TO PAR-NAME.                        NC1264.2 267
   000602         060500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000603      1  060600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000604         060700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000605         060800 LEV-TEST-GF-1-6.                                                 NC1264.2
   000606         060900     IF TBGRP-6   EQUAL TO   SPACE                                NC1264.2 147 IMP
   000607      1  061000              PERFORM PASS                                        NC1264.2 417
   000608      1  061100              GO  TO   LEV-WRITE-GF-1-6.                          NC1264.2 615
   000609         061200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000610         061300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000611         061400     MOVE  84     TO LENGTH-COUNTER.                              NC1264.2 238
   000612         061500     GO   TO    LEV-WRITE-GF-1-6.                                 NC1264.2 615
   000613         061600 LEV-DELETE-GF-1-6.                                               NC1264.2
   000614         061700     PERFORM DE-LETE.                                             NC1264.2 419
   000615         061800 LEV-WRITE-GF-1-6.                                                NC1264.2
   000616         061900     MOVE  "LEV-TEST-GF-1-6"  TO PAR-NAME.                        NC1264.2 267
   000617         062000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000618      1  062100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000619         062200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000620         062300 LEV-TEST-GF-1-7.                                                 NC1264.2
   000621         062400     IF TBGRP-7   EQUAL TO   SPACE                                NC1264.2 149 IMP
   000622      1  062500              PERFORM PASS                                        NC1264.2 417
   000623      1  062600              GO  TO   LEV-WRITE-GF-1-7.                          NC1264.2 630
   000624         062700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000626         062900     MOVE  82     TO LENGTH-COUNTER.                              NC1264.2 238
   000627         063000     GO   TO    LEV-WRITE-GF-1-7.                                 NC1264.2 630
   000628         063100 LEV-DELETE-GF-1-7.                                               NC1264.2
   000629         063200     PERFORM DE-LETE.                                             NC1264.2 419
   000630         063300 LEV-WRITE-GF-1-7.                                                NC1264.2
   000631         063400     MOVE  "LEV-TEST-GF-1-7"  TO PAR-NAME.                        NC1264.2 267
   000632         063500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000633      1  063600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000634         063700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000635         063800 LEV-TEST-GF-1-8.                                                 NC1264.2
   000636         063900     IF TBGRP-8   EQUAL TO   SPACE                                NC1264.2 151 IMP
   000637      1  064000              PERFORM PASS                                        NC1264.2 417
   000638      1  064100              GO  TO   LEV-WRITE-GF-1-8.                          NC1264.2 645
   000639         064200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000640         064300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000641         064400     MOVE  80     TO LENGTH-COUNTER.                              NC1264.2 238
   000642         064500     GO   TO    LEV-WRITE-GF-1-8.                                 NC1264.2 645
   000643         064600 LEV-DELETE-GF-1-8.                                               NC1264.2
   000644         064700     PERFORM DE-LETE.                                             NC1264.2 419
   000645         064800 LEV-WRITE-GF-1-8.                                                NC1264.2
   000646         064900     MOVE  "LEV-TEST-GF-1-8"  TO PAR-NAME.                        NC1264.2 267
   000647         065000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000648      1  065100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000649         065200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000650         065300 LEV-TEST-GF-1-9.                                                 NC1264.2
   000651         065400     IF TBGRP-9   EQUAL TO   SPACE                                NC1264.2 153 IMP
   000652      1  065500              PERFORM PASS                                        NC1264.2 417
   000653      1  065600              GO  TO   LEV-WRITE-GF-1-9.                          NC1264.2 660
   000654         065700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000655         065800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000656         065900     MOVE  78     TO LENGTH-COUNTER.                              NC1264.2 238
   000657         066000     GO   TO    LEV-WRITE-GF-1-9.                                 NC1264.2 660
   000658         066100 LEV-DELETE-GF-1-9.                                               NC1264.2
   000659         066200     PERFORM DE-LETE.                                             NC1264.2 419
   000660         066300 LEV-WRITE-GF-1-9.                                                NC1264.2
   000661         066400     MOVE  "LEV-TEST-GF-1-9"  TO PAR-NAME.                        NC1264.2 267
   000662         066500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000663      1  066600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000664         066700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000665         066800 LEV-TEST-GF-10.                                                  NC1264.2
   000666         066900     IF TBGRP-10 EQUAL TO    SPACE                                NC1264.2 155 IMP
   000667      1  067000              PERFORM PASS                                        NC1264.2 417
   000668      1  067100              GO  TO   LEV-WRITE-GF-1-10.                         NC1264.2 675
   000669         067200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000670         067300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000671         067400     MOVE  76     TO LENGTH-COUNTER.                              NC1264.2 238
   000672         067500     GO   TO    LEV-WRITE-GF-1-10.                                NC1264.2 675
   000673         067600 LEV-DELETE-GF-1-10.                                              NC1264.2
   000674         067700     PERFORM DE-LETE.                                             NC1264.2 419
   000675         067800 LEV-WRITE-GF-1-10.                                               NC1264.2
   000676         067900     MOVE  "LEV-TEST-GF-1-10"  TO PAR-NAME.                       NC1264.2 267
   000677         068000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000678      1  068100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000679         068200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000680         068300 LEV-TEST-GF-1-11.                                                NC1264.2
   000681         068400     IF TBGRP-11 EQUAL TO    SPACE                                NC1264.2 157 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682      1  068500              PERFORM PASS                                        NC1264.2 417
   000683      1  068600              GO  TO   LEV-WRITE-GF-1-11.                         NC1264.2 690
   000684         068700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000685         068800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000686         068900     MOVE  74     TO LENGTH-COUNTER.                              NC1264.2 238
   000687         069000     GO   TO    LEV-WRITE-GF-1-11.                                NC1264.2 690
   000688         069100 LEV-DELETE-GF-1-11.                                              NC1264.2
   000689         069200     PERFORM DE-LETE.                                             NC1264.2 419
   000690         069300 LEV-WRITE-GF-1-11.                                               NC1264.2
   000691         069400     MOVE  "LEV-TEST-GF-1-11"  TO PAR-NAME.                       NC1264.2 267
   000692         069500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000693      1  069600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000694         069700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000695         069800 LEV-TEST-GF-1-12.                                                NC1264.2
   000696         069900     IF TBGRP-12 EQUAL TO    SPACE                                NC1264.2 159 IMP
   000697      1  070000              PERFORM PASS                                        NC1264.2 417
   000698      1  070100              GO  TO   LEV-WRITE-GF-1-12.                         NC1264.2 705
   000699         070200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000700         070300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000701         070400     MOVE  72     TO LENGTH-COUNTER.                              NC1264.2 238
   000702         070500     GO   TO    LEV-WRITE-GF-1-12.                                NC1264.2 705
   000703         070600 LEV-DELETE-GF-1-12.                                              NC1264.2
   000704         070700     PERFORM DE-LETE.                                             NC1264.2 419
   000705         070800 LEV-WRITE-GF-1-12.                                               NC1264.2
   000706         070900     MOVE  "LEV-TEST-GF-1-12"  TO PAR-NAME.                       NC1264.2 267
   000707         071000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000708      1  071100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000709         071200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000710         071300 LEV-TEST-GF-13.                                                  NC1264.2
   000711         071400     IF TBGRP-13 EQUAL TO    SPACE                                NC1264.2 161 IMP
   000712      1  071500              PERFORM PASS                                        NC1264.2 417
   000713      1  071600              GO  TO   LEV-WRITE-GF-1-13.                         NC1264.2 720
   000714         071700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000715         071800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000716         071900     MOVE  70     TO LENGTH-COUNTER.                              NC1264.2 238
   000717         072000     GO   TO    LEV-WRITE-GF-1-13.                                NC1264.2 720
   000718         072100 LEV-DELETE-GF-1-13.                                              NC1264.2
   000719         072200     PERFORM DE-LETE.                                             NC1264.2 419
   000720         072300 LEV-WRITE-GF-1-13.                                               NC1264.2
   000721         072400     MOVE  "LEV-TEST-GF-1-13"  TO PAR-NAME.                       NC1264.2 267
   000722         072500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000723      1  072600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000724         072700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000725         072800 LEV-TEST-GF-1-14.                                                NC1264.2
   000726         072900     IF TBGRP-14 EQUAL TO    SPACE                                NC1264.2 163 IMP
   000727      1  073000              PERFORM PASS                                        NC1264.2 417
   000728      1  073100              GO  TO   LEV-WRITE-GF-1-14.                         NC1264.2 735
   000729         073200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000730         073300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000731         073400     MOVE  68     TO LENGTH-COUNTER.                              NC1264.2 238
   000732         073500     GO   TO    LEV-WRITE-GF-1-14.                                NC1264.2 735
   000733         073600 LEV-DELETE-GF-1-14.                                              NC1264.2
   000734         073700     PERFORM DE-LETE.                                             NC1264.2 419
   000735         073800 LEV-WRITE-GF-1-14.                                               NC1264.2
   000736         073900     MOVE  "LEV-TEST-GF-1-14"  TO PAR-NAME.                       NC1264.2 267
   000737         074000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000738      1  074100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000740         074300 LEV-TEST-GF-1-15.                                                NC1264.2
   000741         074400     IF TBGRP-15 EQUAL TO    SPACE                                NC1264.2 165 IMP
   000742      1  074500              PERFORM PASS                                        NC1264.2 417
   000743      1  074600              GO  TO   LEV-WRITE-GF-1-15.                         NC1264.2 750
   000744         074700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000745         074800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000746         074900     MOVE  66     TO LENGTH-COUNTER.                              NC1264.2 238
   000747         075000     GO   TO    LEV-WRITE-GF-1-15.                                NC1264.2 750
   000748         075100 LEV-DELETE-GF-1-15.                                              NC1264.2
   000749         075200     PERFORM DE-LETE.                                             NC1264.2 419
   000750         075300 LEV-WRITE-GF-1-15.                                               NC1264.2
   000751         075400     MOVE  "LEV-TEST-GF-1-15"  TO PAR-NAME.                       NC1264.2 267
   000752         075500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000753      1  075600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000754         075700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000755         075800 LEV-TEST-GF-1-16.                                                NC1264.2
   000756         075900     IF TBGRP-16 EQUAL TO    SPACE                                NC1264.2 167 IMP
   000757      1  076000              PERFORM PASS                                        NC1264.2 417
   000758      1  076100              GO  TO   LEV-WRITE-GF-1-16.                         NC1264.2 765
   000759         076200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000760         076300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000761         076400     MOVE  64     TO LENGTH-COUNTER.                              NC1264.2 238
   000762         076500     GO   TO    LEV-WRITE-GF-1-16.                                NC1264.2 765
   000763         076600 LEV-DELETE-GF-1-16.                                              NC1264.2
   000764         076700     PERFORM DE-LETE.                                             NC1264.2 419
   000765         076800 LEV-WRITE-GF-1-16.                                               NC1264.2
   000766         076900     MOVE  "LEV-TEST-GF-1-16"  TO PAR-NAME.                       NC1264.2 267
   000767         077000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000768      1  077100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000769         077200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000770         077300 LEV-TEST-GF-1-17.                                                NC1264.2
   000771         077400     IF TBGRP-17 EQUAL TO    SPACE                                NC1264.2 169 IMP
   000772      1  077500              PERFORM PASS                                        NC1264.2 417
   000773      1  077600              GO  TO   LEV-WRITE-GF-1-17.                         NC1264.2 780
   000774         077700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000775         077800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000776         077900     MOVE  62     TO LENGTH-COUNTER.                              NC1264.2 238
   000777         078000     GO   TO    LEV-WRITE-GF-1-17.                                NC1264.2 780
   000778         078100 LEV-DELETE-GF-1-17.                                              NC1264.2
   000779         078200     PERFORM DE-LETE.                                             NC1264.2 419
   000780         078300 LEV-WRITE-GF-1-17.                                               NC1264.2
   000781         078400     MOVE  "LEV-TEST-GF-1-17"  TO PAR-NAME.                       NC1264.2 267
   000782         078500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000783      1  078600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000784         078700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000785         078800 LEV-TEST-GF-1-18.                                                NC1264.2
   000786         078900     IF TBGRP-18 EQUAL TO    SPACE                                NC1264.2 171 IMP
   000787      1  079000              PERFORM PASS                                        NC1264.2 417
   000788      1  079100              GO  TO   LEV-WRITE-GF-1-18.                         NC1264.2 795
   000789         079200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000790         079300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000791         079400     MOVE  60     TO LENGTH-COUNTER.                              NC1264.2 238
   000792         079500     GO   TO    LEV-WRITE-GF-1-18.                                NC1264.2 795
   000793         079600 LEV-DELETE-GF-1-18.                                              NC1264.2
   000794         079700     PERFORM DE-LETE.                                             NC1264.2 419
   000795         079800 LEV-WRITE-GF-1-18.                                               NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900     MOVE  "LEV-TEST-GF-1-18"  TO PAR-NAME.                       NC1264.2 267
   000797         080000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000798      1  080100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000799         080200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000800         080300 LEV-TEST-GF-1-19.                                                NC1264.2
   000801         080400     IF TBGRP-19 EQUAL TO    SPACE                                NC1264.2 173 IMP
   000802      1  080500              PERFORM PASS                                        NC1264.2 417
   000803      1  080600              GO  TO   LEV-WRITE-GF-1-19.                         NC1264.2 810
   000804         080700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000805         080800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000806         080900     MOVE  58     TO LENGTH-COUNTER.                              NC1264.2 238
   000807         081000     GO   TO    LEV-WRITE-GF-1-19.                                NC1264.2 810
   000808         081100 LEV-DELETE-GF-1-19.                                              NC1264.2
   000809         081200     PERFORM DE-LETE.                                             NC1264.2 419
   000810         081300 LEV-WRITE-GF-1-19.                                               NC1264.2
   000811         081400     MOVE  "LEV-TEST-GF-1-19"  TO PAR-NAME.                       NC1264.2 267
   000812         081500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000813      1  081600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000814         081700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000815         081800 LEV-TEST-GF-1-20.                                                NC1264.2
   000816         081900     IF TBGRP-20 EQUAL TO    SPACE                                NC1264.2 175 IMP
   000817      1  082000              PERFORM PASS                                        NC1264.2 417
   000818      1  082100              GO  TO   LEV-WRITE-GF-1-20.                         NC1264.2 825
   000819         082200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000820         082300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000821         082400     MOVE  56     TO LENGTH-COUNTER.                              NC1264.2 238
   000822         082500     GO   TO    LEV-WRITE-GF-1-20.                                NC1264.2 825
   000823         082600 LEV-DELETE-GF-1-20.                                              NC1264.2
   000824         082700     PERFORM DE-LETE.                                             NC1264.2 419
   000825         082800 LEV-WRITE-GF-1-20.                                               NC1264.2
   000826         082900     MOVE  "LEV-TEST-GF-1-20"  TO PAR-NAME.                       NC1264.2 267
   000827         083000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000828      1  083100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000829         083200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000830         083300 LEV-TEST-GF-1-21.                                                NC1264.2
   000831         083400     IF TBGRP-21 EQUAL TO    SPACE                                NC1264.2 177 IMP
   000832      1  083500              PERFORM PASS                                        NC1264.2 417
   000833      1  083600              GO  TO   LEV-WRITE-GF-1-21.                         NC1264.2 840
   000834         083700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000835         083800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000836         083900     MOVE  54     TO LENGTH-COUNTER.                              NC1264.2 238
   000837         084000     GO   TO    LEV-WRITE-GF-1-21.                                NC1264.2 840
   000838         084100 LEV-DELETE-GF-1-21.                                              NC1264.2
   000839         084200     PERFORM DE-LETE.                                             NC1264.2 419
   000840         084300 LEV-WRITE-GF-1-21.                                               NC1264.2
   000841         084400     MOVE  "LEV-TEST-GF-1-21"  TO PAR-NAME.                       NC1264.2 267
   000842         084500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000843      1  084600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000844         084700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000845         084800 LEV-TEST-GF-1-22.                                                NC1264.2
   000846         084900     IF TBGRP-22 EQUAL TO    SPACE                                NC1264.2 179 IMP
   000847      1  085000              PERFORM PASS                                        NC1264.2 417
   000848      1  085100              GO  TO   LEV-WRITE-GF-1-22.                         NC1264.2 855
   000849         085200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000850         085300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000851         085400     MOVE  52     TO LENGTH-COUNTER.                              NC1264.2 238
   000852         085500     GO   TO    LEV-WRITE-GF-1-22.                                NC1264.2 855
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600 LEV-DELETE-GF-1-22.                                              NC1264.2
   000854         085700     PERFORM DE-LETE.                                             NC1264.2 419
   000855         085800 LEV-WRITE-GF-1-22.                                               NC1264.2
   000856         085900     MOVE  "LEV-TEST-GF-1-22"  TO PAR-NAME.                       NC1264.2 267
   000857         086000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000858      1  086100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000859         086200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000860         086300 LEV-TEST-GF-1-23.                                                NC1264.2
   000861         086400     IF TBGRP-23 EQUAL TO    SPACE                                NC1264.2 181 IMP
   000862      1  086500              PERFORM PASS                                        NC1264.2 417
   000863      1  086600              GO  TO   LEV-WRITE-GF-1-23.                         NC1264.2 870
   000864         086700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000865         086800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000866         086900     MOVE  50     TO LENGTH-COUNTER.                              NC1264.2 238
   000867         087000     GO   TO    LEV-WRITE-GF-1-23.                                NC1264.2 870
   000868         087100 LEV-DELETE-GF-1-23.                                              NC1264.2
   000869         087200     PERFORM DE-LETE.                                             NC1264.2 419
   000870         087300 LEV-WRITE-GF-1-23.                                               NC1264.2
   000871         087400     MOVE  "LEV-TEST-GF-1-23"  TO PAR-NAME.                       NC1264.2 267
   000872         087500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000873      1  087600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000874         087700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000875         087800 LEV-TEST-GF-1-24.                                                NC1264.2
   000876         087900     IF TBGRP-24 EQUAL TO    SPACE                                NC1264.2 183 IMP
   000877      1  088000              PERFORM PASS                                        NC1264.2 417
   000878      1  088100              GO  TO   LEV-WRITE-GF-1-24.                         NC1264.2 885
   000879         088200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000880         088300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000881         088400     MOVE  48     TO LENGTH-COUNTER.                              NC1264.2 238
   000882         088500     GO   TO    LEV-WRITE-GF-1-24.                                NC1264.2 885
   000883         088600 LEV-DELETE-GF-1-24.                                              NC1264.2
   000884         088700     PERFORM DE-LETE.                                             NC1264.2 419
   000885         088800 LEV-WRITE-GF-1-24.                                               NC1264.2
   000886         088900     MOVE  "LEV-TEST-GF-1-24"  TO PAR-NAME.                       NC1264.2 267
   000887         089000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000888      1  089100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000889         089200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000890         089300 LEV-TEST-GF-1-25.                                                NC1264.2
   000891         089400     IF TBGRP-25 EQUAL TO    SPACE                                NC1264.2 185 IMP
   000892      1  089500              PERFORM PASS                                        NC1264.2 417
   000893      1  089600              GO  TO   LEV-WRITE-GF-1-25.                         NC1264.2 900
   000894         089700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000895         089800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000896         089900     MOVE  46     TO LENGTH-COUNTER.                              NC1264.2 238
   000897         090000     GO   TO    LEV-WRITE-GF-1-25.                                NC1264.2 900
   000898         090100 LEV-DELETE-GF-1-25.                                              NC1264.2
   000899         090200     PERFORM DE-LETE.                                             NC1264.2 419
   000900         090300 LEV-WRITE-GF-1-25.                                               NC1264.2
   000901         090400     MOVE  "LEV-TEST-GF-1-25"  TO PAR-NAME.                       NC1264.2 267
   000902         090500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000903      1  090600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000904         090700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000905         090800 LEV-TEST-GF-1-26.                                                NC1264.2
   000906         090900     IF TBGRP-26 EQUAL TO    SPACE                                NC1264.2 187 IMP
   000907      1  091000              PERFORM PASS                                        NC1264.2 417
   000908      1  091100              GO  TO   LEV-WRITE-GF-1-26.                         NC1264.2 915
   000909         091200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000911         091400     MOVE  44     TO LENGTH-COUNTER.                              NC1264.2 238
   000912         091500     GO   TO    LEV-WRITE-GF-1-26.                                NC1264.2 915
   000913         091600 LEV-DELETE-GF-1-26.                                              NC1264.2
   000914         091700     PERFORM DE-LETE.                                             NC1264.2 419
   000915         091800 LEV-WRITE-GF-1-26.                                               NC1264.2
   000916         091900     MOVE  "LEV-TEST-GF-1-26"  TO PAR-NAME.                       NC1264.2 267
   000917         092000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000918      1  092100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000919         092200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000920         092300 LEV-TEST-GF-1-27.                                                NC1264.2
   000921         092400     IF TBGRP-27 EQUAL TO    SPACE                                NC1264.2 189 IMP
   000922      1  092500              PERFORM PASS                                        NC1264.2 417
   000923      1  092600              GO  TO   LEV-WRITE-GF-1-27.                         NC1264.2 930
   000924         092700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000925         092800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000926         092900     MOVE  42     TO LENGTH-COUNTER.                              NC1264.2 238
   000927         093000     GO   TO    LEV-WRITE-GF-1-27.                                NC1264.2 930
   000928         093100 LEV-DELETE-GF-1-27.                                              NC1264.2
   000929         093200     PERFORM DE-LETE.                                             NC1264.2 419
   000930         093300 LEV-WRITE-GF-1-27.                                               NC1264.2
   000931         093400     MOVE  "LEV-TEST-GF-1-27"  TO PAR-NAME.                       NC1264.2 267
   000932         093500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000933      1  093600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000934         093700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000935         093800 LEV-TEST-GF-1-28.                                                NC1264.2
   000936         093900     IF TBGRP-28 EQUAL TO    SPACE                                NC1264.2 191 IMP
   000937      1  094000              PERFORM PASS                                        NC1264.2 417
   000938      1  094100              GO  TO   LEV-WRITE-GF-1-28.                         NC1264.2 945
   000939         094200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000940         094300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000941         094400     MOVE  40     TO LENGTH-COUNTER.                              NC1264.2 238
   000942         094500     GO   TO    LEV-WRITE-GF-1-28.                                NC1264.2 945
   000943         094600 LEV-DELETE-GF-1-28.                                              NC1264.2
   000944         094700     PERFORM DE-LETE.                                             NC1264.2 419
   000945         094800 LEV-WRITE-GF-1-28.                                               NC1264.2
   000946         094900     MOVE  "LEV-TEST-GF-1-28"  TO PAR-NAME.                       NC1264.2 267
   000947         095000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000948      1  095100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000949         095200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000950         095300 LEV-TEST-GF-1-29.                                                NC1264.2
   000951         095400     IF TBGRP-29 EQUAL TO    SPACE                                NC1264.2 193 IMP
   000952      1  095500              PERFORM PASS                                        NC1264.2 417
   000953      1  095600              GO  TO   LEV-WRITE-GF-1-29.                         NC1264.2 960
   000954         095700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000955         095800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000956         095900     MOVE  38     TO LENGTH-COUNTER.                              NC1264.2 238
   000957         096000     GO   TO    LEV-WRITE-GF-1-29.                                NC1264.2 960
   000958         096100 LEV-DELETE-GF-1-29.                                              NC1264.2
   000959         096200     PERFORM DE-LETE.                                             NC1264.2 419
   000960         096300 LEV-WRITE-GF-1-29.                                               NC1264.2
   000961         096400     MOVE  "LEV-TEST-GF-1-29"  TO PAR-NAME.                       NC1264.2 267
   000962         096500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000963      1  096600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000964         096700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000965         096800 LEV-TEST-GF-1-30.                                                NC1264.2
   000966         096900     IF TBGRP-30 EQUAL TO    SPACE                                NC1264.2 195 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967      1  097000              PERFORM PASS                                        NC1264.2 417
   000968      1  097100              GO  TO   LEV-WRITE-GF-1-30.                         NC1264.2 975
   000969         097200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000970         097300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000971         097400     MOVE  36     TO LENGTH-COUNTER.                              NC1264.2 238
   000972         097500     GO   TO    LEV-WRITE-GF-1-30.                                NC1264.2 975
   000973         097600 LEV-DELETE-GF-1-30.                                              NC1264.2
   000974         097700     PERFORM DE-LETE.                                             NC1264.2 419
   000975         097800 LEV-WRITE-GF-1-30.                                               NC1264.2
   000976         097900     MOVE  "LEV-TEST-GF-1-30"  TO PAR-NAME.                       NC1264.2 267
   000977         098000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000978      1  098100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000979         098200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000980         098300 LEV-TEST-GF-1-31.                                                NC1264.2
   000981         098400     IF TBGRP-31 EQUAL TO    SPACE                                NC1264.2 197 IMP
   000982      1  098500              PERFORM PASS                                        NC1264.2 417
   000983      1  098600              GO  TO   LEV-WRITE-GF-1-31.                         NC1264.2 990
   000984         098700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   000985         098800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   000986         098900     MOVE  34     TO LENGTH-COUNTER.                              NC1264.2 238
   000987         099000     GO   TO    LEV-WRITE-GF-1-31.                                NC1264.2 990
   000988         099100 LEV-DELETE-GF-1-31.                                              NC1264.2
   000989         099200     PERFORM DE-LETE.                                             NC1264.2 419
   000990         099300 LEV-WRITE-GF-1-31.                                               NC1264.2
   000991         099400     MOVE  "LEV-TEST-GF-1-31"  TO PAR-NAME.                       NC1264.2 267
   000992         099500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   000993      1  099600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   000994         099700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   000995         099800 LEV-TEST-GF-1-32.                                                NC1264.2
   000996         099900     IF TBGRP-32 EQUAL TO    SPACE                                NC1264.2 199 IMP
   000997      1  100000              PERFORM PASS                                        NC1264.2 417
   000998      1  100100              GO  TO   LEV-WRITE-GF-1-32.                         NC1264.2 1005
   000999         100200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001000         100300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001001         100400     MOVE  32     TO LENGTH-COUNTER.                              NC1264.2 238
   001002         100500     GO   TO    LEV-WRITE-GF-1-32.                                NC1264.2 1005
   001003         100600 LEV-DELETE-GF-1-32.                                              NC1264.2
   001004         100700     PERFORM DE-LETE.                                             NC1264.2 419
   001005         100800 LEV-WRITE-GF-1-32.                                               NC1264.2
   001006         100900     MOVE  "LEV-TEST-GF-1-32"  TO PAR-NAME.                       NC1264.2 267
   001007         101000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001008      1  101100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001009         101200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001010         101300 LEV-TEST-GF-1-33.                                                NC1264.2
   001011         101400     IF TBGRP-33 EQUAL TO    SPACE                                NC1264.2 201 IMP
   001012      1  101500              PERFORM PASS                                        NC1264.2 417
   001013      1  101600              GO  TO   LEV-WRITE-GF-1-33.                         NC1264.2 1020
   001014         101700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001015         101800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001016         101900     MOVE  30     TO LENGTH-COUNTER.                              NC1264.2 238
   001017         102000     GO   TO    LEV-WRITE-GF-1-33.                                NC1264.2 1020
   001018         102100 LEV-DELETE-GF-1-33.                                              NC1264.2
   001019         102200     PERFORM DE-LETE.                                             NC1264.2 419
   001020         102300 LEV-WRITE-GF-1-33.                                               NC1264.2
   001021         102400     MOVE  "LEV-TEST-GF-1-33"  TO PAR-NAME.                       NC1264.2 267
   001022         102500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001023      1  102600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001025         102800 LEV-TEST-GF-1-34.                                                NC1264.2
   001026         102900     IF TBGRP-34 EQUAL TO    SPACE                                NC1264.2 203 IMP
   001027      1  103000              PERFORM PASS                                        NC1264.2 417
   001028      1  103100              GO  TO   LEV-WRITE-GF-1-34.                         NC1264.2 1035
   001029         103200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001030         103300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001031         103400     MOVE  28     TO LENGTH-COUNTER.                              NC1264.2 238
   001032         103500     GO   TO    LEV-WRITE-GF-1-34.                                NC1264.2 1035
   001033         103600 LEV-DELETE-GF-1-34.                                              NC1264.2
   001034         103700     PERFORM DE-LETE.                                             NC1264.2 419
   001035         103800 LEV-WRITE-GF-1-34.                                               NC1264.2
   001036         103900     MOVE  "LEV-TEST-GF-1-34"  TO PAR-NAME.                       NC1264.2 267
   001037         104000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001038      1  104100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001039         104200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001040         104300 LEV-TEST-GF-1-35.                                                NC1264.2
   001041         104400     IF TBGRP-35 EQUAL TO    SPACE                                NC1264.2 205 IMP
   001042      1  104500              PERFORM PASS                                        NC1264.2 417
   001043      1  104600              GO  TO   LEV-WRITE-GF-1-35.                         NC1264.2 1050
   001044         104700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001045         104800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001046         104900     MOVE  26     TO LENGTH-COUNTER.                              NC1264.2 238
   001047         105000     GO   TO    LEV-WRITE-GF-1-35.                                NC1264.2 1050
   001048         105100 LEV-DELETE-GF-1-35.                                              NC1264.2
   001049         105200     PERFORM DE-LETE.                                             NC1264.2 419
   001050         105300 LEV-WRITE-GF-1-35.                                               NC1264.2
   001051         105400     MOVE  "LEV-TEST-GF-1-35"  TO PAR-NAME.                       NC1264.2 267
   001052         105500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001053      1  105600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001054         105700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001055         105800 LEV-TEST-GF-1-36.                                                NC1264.2
   001056         105900     IF TBGRP-36 EQUAL TO    SPACE                                NC1264.2 207 IMP
   001057      1  106000              PERFORM PASS                                        NC1264.2 417
   001058      1  106100              GO  TO   LEV-WRITE-GF-1-36.                         NC1264.2 1065
   001059         106200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001060         106300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001061         106400     MOVE  24     TO LENGTH-COUNTER.                              NC1264.2 238
   001062         106500     GO   TO    LEV-WRITE-GF-1-36.                                NC1264.2 1065
   001063         106600 LEV-DELETE-GF-1-36.                                              NC1264.2
   001064         106700     PERFORM DE-LETE.                                             NC1264.2 419
   001065         106800 LEV-WRITE-GF-1-36.                                               NC1264.2
   001066         106900     MOVE  "LEV-TEST-GF-1-36"  TO PAR-NAME.                       NC1264.2 267
   001067         107000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001068      1  107100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001069         107200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001070         107300 LEV-TEST-GF-1-37.                                                NC1264.2
   001071         107400     IF TBGRP-37 EQUAL TO    SPACE                                NC1264.2 209 IMP
   001072      1  107500              PERFORM PASS                                        NC1264.2 417
   001073      1  107600              GO  TO   LEV-WRITE-GF-1-37.                         NC1264.2 1080
   001074         107700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001075         107800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001076         107900     MOVE  22     TO LENGTH-COUNTER.                              NC1264.2 238
   001077         108000     GO   TO    LEV-WRITE-GF-1-37.                                NC1264.2 1080
   001078         108100 LEV-DELETE-GF-1-37.                                              NC1264.2
   001079         108200     PERFORM DE-LETE.                                             NC1264.2 419
   001080         108300 LEV-WRITE-GF-1-37.                                               NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400     MOVE  "LEV-TEST-GF-1-37"  TO PAR-NAME.                       NC1264.2 267
   001082         108500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001083      1  108600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001084         108700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001085         108800 LEV-TEST-GF-1-38.                                                NC1264.2
   001086         108900     IF TBGRP-38 EQUAL TO    SPACE                                NC1264.2 211 IMP
   001087      1  109000              PERFORM PASS                                        NC1264.2 417
   001088      1  109100              GO  TO   LEV-WRITE-GF-1-38.                         NC1264.2 1095
   001089         109200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001090         109300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001091         109400     MOVE  20     TO LENGTH-COUNTER.                              NC1264.2 238
   001092         109500     GO   TO    LEV-WRITE-GF-1-38.                                NC1264.2 1095
   001093         109600 LEV-DELETE-GF-1-38.                                              NC1264.2
   001094         109700     PERFORM DE-LETE.                                             NC1264.2 419
   001095         109800 LEV-WRITE-GF-1-38.                                               NC1264.2
   001096         109900     MOVE  "LEV-TEST-GF-1-38"  TO PAR-NAME.                       NC1264.2 267
   001097         110000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001098      1  110100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001099         110200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001100         110300 LEV-TEST-GF-1-39.                                                NC1264.2
   001101         110400     IF TBGRP-39 EQUAL TO    SPACE                                NC1264.2 213 IMP
   001102      1  110500              PERFORM PASS                                        NC1264.2 417
   001103      1  110600              GO  TO   LEV-WRITE-GF-1-39.                         NC1264.2 1110
   001104         110700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001105         110800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001106         110900     MOVE  18     TO LENGTH-COUNTER.                              NC1264.2 238
   001107         111000     GO   TO    LEV-WRITE-GF-1-39.                                NC1264.2 1110
   001108         111100 LEV-DELETE-GF-1-39.                                              NC1264.2
   001109         111200     PERFORM DE-LETE.                                             NC1264.2 419
   001110         111300 LEV-WRITE-GF-1-39.                                               NC1264.2
   001111         111400     MOVE  "LEV-TEST-GF-1-39"  TO PAR-NAME.                       NC1264.2 267
   001112         111500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001113      1  111600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001114         111700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001115         111800 LEV-TEST-GF-1-40.                                                NC1264.2
   001116         111900     IF TBGRP-40 EQUAL TO    SPACE                                NC1264.2 215 IMP
   001117      1  112000              PERFORM PASS                                        NC1264.2 417
   001118      1  112100              GO  TO   LEV-WRITE-GF-1-40.                         NC1264.2 1125
   001119         112200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001120         112300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001121         112400     MOVE  16     TO LENGTH-COUNTER.                              NC1264.2 238
   001122         112500     GO   TO    LEV-WRITE-GF-1-40.                                NC1264.2 1125
   001123         112600 LEV-DELETE-GF-1-40.                                              NC1264.2
   001124         112700     PERFORM DE-LETE.                                             NC1264.2 419
   001125         112800 LEV-WRITE-GF-1-40.                                               NC1264.2
   001126         112900     MOVE  "LEV-TEST-GF-1-40"  TO PAR-NAME.                       NC1264.2 267
   001127         113000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001128      1  113100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001129         113200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001130         113300 LEV-TEST-GF-1-41.                                                NC1264.2
   001131         113400     IF TBGRP-41 EQUAL TO    SPACE                                NC1264.2 217 IMP
   001132      1  113500              PERFORM PASS                                        NC1264.2 417
   001133      1  113600              GO  TO   LEV-WRITE-GF-1-41.                         NC1264.2 1140
   001134         113700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001135         113800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001136         113900     MOVE  14     TO LENGTH-COUNTER.                              NC1264.2 238
   001137         114000     GO   TO    LEV-WRITE-GF-1-41.                                NC1264.2 1140
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100 LEV-DELETE-GF-1-41.                                              NC1264.2
   001139         114200     PERFORM DE-LETE.                                             NC1264.2 419
   001140         114300 LEV-WRITE-GF-1-41.                                               NC1264.2
   001141         114400     MOVE  "LEV-TEST-GF-1-41"  TO PAR-NAME.                       NC1264.2 267
   001142         114500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001143      1  114600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001144         114700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001145         114800 LEV-TEST-GF-1-42.                                                NC1264.2
   001146         114900     IF TBGRP-42 EQUAL TO    SPACE                                NC1264.2 219 IMP
   001147      1  115000              PERFORM PASS                                        NC1264.2 417
   001148      1  115100              GO  TO   LEV-WRITE-GF-1-42.                         NC1264.2 1155
   001149         115200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001150         115300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001151         115400     MOVE  12     TO LENGTH-COUNTER.                              NC1264.2 238
   001152         115500     GO   TO    LEV-WRITE-GF-1-42.                                NC1264.2 1155
   001153         115600 LEV-DELETE-GF-1-42.                                              NC1264.2
   001154         115700     PERFORM DE-LETE.                                             NC1264.2 419
   001155         115800 LEV-WRITE-GF-1-42.                                               NC1264.2
   001156         115900     MOVE  "LEV-TEST-GF-1-42"  TO PAR-NAME.                       NC1264.2 267
   001157         116000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001158      1  116100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001159         116200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001160         116300 LEV-TEST-GF-1-43.                                                NC1264.2
   001161         116400     IF TBGRP-43 EQUAL TO    SPACE                                NC1264.2 221 IMP
   001162      1  116500              PERFORM PASS                                        NC1264.2 417
   001163      1  116600              GO  TO   LEV-WRITE-GF-1-43.                         NC1264.2 1170
   001164         116700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001165         116800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001166         116900     MOVE  10     TO LENGTH-COUNTER.                              NC1264.2 238
   001167         117000     GO   TO    LEV-WRITE-GF-1-43.                                NC1264.2 1170
   001168         117100 LEV-DELETE-GF-1-43.                                              NC1264.2
   001169         117200     PERFORM DE-LETE.                                             NC1264.2 419
   001170         117300 LEV-WRITE-GF-1-43.                                               NC1264.2
   001171         117400     MOVE  "LEV-TEST-GF-1-43"  TO PAR-NAME.                       NC1264.2 267
   001172         117500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001173      1  117600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001174         117700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001175         117800 LEV-TEST-GF-1-44.                                                NC1264.2
   001176         117900     IF TBGRP-44 EQUAL TO    SPACE                                NC1264.2 223 IMP
   001177      1  118000              PERFORM PASS                                        NC1264.2 417
   001178      1  118100              GO  TO   LEV-WRITE-GF-1-44.                         NC1264.2 1185
   001179         118200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001180         118300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001181         118400     MOVE   8     TO LENGTH-COUNTER.                              NC1264.2 238
   001182         118500     GO   TO    LEV-WRITE-GF-1-44.                                NC1264.2 1185
   001183         118600 LEV-DELETE-GF-1-44.                                              NC1264.2
   001184         118700     PERFORM DE-LETE.                                             NC1264.2 419
   001185         118800 LEV-WRITE-GF-1-44.                                               NC1264.2
   001186         118900     MOVE  "LEV-TEST-GF-1-44"  TO PAR-NAME.                       NC1264.2 267
   001187         119000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001188      1  119100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001189         119200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001190         119300 LEV-TEST-GF-1-45.                                                NC1264.2
   001191         119400     IF TBGRP-45 EQUAL TO    SPACE                                NC1264.2 225 IMP
   001192      1  119500              PERFORM PASS                                        NC1264.2 417
   001193      1  119600              GO  TO   LEV-WRITE-GF-1-45.                         NC1264.2 1200
   001194         119700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001196         119900     MOVE   6     TO LENGTH-COUNTER.                              NC1264.2 238
   001197         120000     GO   TO    LEV-WRITE-GF-1-45.                                NC1264.2 1200
   001198         120100 LEV-DELETE-GF-1-45.                                              NC1264.2
   001199         120200     PERFORM DE-LETE.                                             NC1264.2 419
   001200         120300 LEV-WRITE-GF-1-45.                                               NC1264.2
   001201         120400     MOVE  "LEV-TEST-GF-1-45"  TO PAR-NAME.                       NC1264.2 267
   001202         120500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001203      1  120600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001204         120700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001205         120800 LEV-TEST-GF-1-46.                                                NC1264.2
   001206         120900     IF TBGRP-46 EQUAL TO    SPACE                                NC1264.2 227 IMP
   001207      1  121000              PERFORM PASS                                        NC1264.2 417
   001208      1  121100              GO  TO   LEV-WRITE-GF-1-46.                         NC1264.2 1215
   001209         121200     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001210         121300     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001211         121400     MOVE   4     TO LENGTH-COUNTER.                              NC1264.2 238
   001212         121500     GO   TO    LEV-WRITE-GF-1-46.                                NC1264.2 1215
   001213         121600 LEV-DELETE-GF-1-46.                                              NC1264.2
   001214         121700     PERFORM DE-LETE.                                             NC1264.2 419
   001215         121800 LEV-WRITE-GF-1-46.                                               NC1264.2
   001216         121900     MOVE  "LEV-TEST-GF-1-46"  TO PAR-NAME.                       NC1264.2 267
   001217         122000     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001218      1  122100              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001219         122200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001220         122300 LEV-TEST-GF-1-47.                                                NC1264.2
   001221         122400     IF TBGRP-47 EQUAL TO    SPACE                                NC1264.2 229 IMP
   001222      1  122500              PERFORM PASS                                        NC1264.2 417
   001223      1  122600              GO  TO   LEV-WRITE-GF-1-47.                         NC1264.2 1230
   001224         122700     MOVE    TABLE-GROUP           TO COMPUTED-BREAKDOWN.         NC1264.2 135 239
   001225         122800     MOVE    SPACE                 TO CORRECT-BREAKDOWN.          NC1264.2 IMP 250
   001226         122900     MOVE   2     TO LENGTH-COUNTER.                              NC1264.2 238
   001227         123000     GO   TO    LEV-WRITE-GF-1-47.                                NC1264.2 1230
   001228         123100 LEV-DELETE-GF-1-47.                                              NC1264.2
   001229         123200     PERFORM DE-LETE.                                             NC1264.2 419
   001230         123300 LEV-WRITE-GF-1-47.                                               NC1264.2
   001231         123400     MOVE  "LEV-TEST-GF-1-47"  TO PAR-NAME.                       NC1264.2 267
   001232         123500     IF       LENGTH-COUNTER GREATER THAN ZERO                    NC1264.2 238 IMP
   001233      1  123600              PERFORM BREAKDOWN-PARA THRU BREAKDOWN-EXIT.         NC1264.2 2579 2629
   001234         123700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001235         123800 LEV-INIT-GF-2-1.                                                 NC1264.2
   001236         123900     MOVE "VI-21 5.3.3 SR1" TO ANSI-REFERENCE.                    NC1264.2 323
   001237         124000     PERFORM END-ROUTINE.                                         NC1264.2 442
   001238         124100     MOVE SPACE TO PRINT-REC.                                     NC1264.2 IMP 36
   001239         124200     MOVE "ALPHA MOVED TO GROUP"  TO FEATURE.                     NC1264.2 263
   001240         124300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001241         124400     MOVE "ELEMENTRY ITEM CHK"  TO FEATURE.                       NC1264.2 263
   001242         124500     MOVE "ABCDEFGHIJKLMNOPQRST" TO A-PART-98.                    NC1264.2 232
   001243         124600     MOVE "01234567899876543210" TO B-PART-98.                    NC1264.2 233
   001244         124700     MOVE "SUPERCALIFRAGILISTIC" TO C-PART-98.                    NC1264.2 234
   001245         124800     MOVE "THAT LITERAL WAS BAD" TO D-PART-98.                    NC1264.2 235
   001246         124900     MOVE "UP ON THE ROOFS"      TO E-PART-98.                    NC1264.2 236
   001247         125000     MOVE LITERAL-98 TO TABLE-GROUP.                              NC1264.2 231 135
   001248         125100 LEV-TEST-GF-2-1.                                                 NC1264.2
   001249         125200     IF TB-1 EQUAL TO "AB"                                        NC1264.2 136
   001250      1  125300              PERFORM PASS                                        NC1264.2 417
   001251      1  125400              GO  TO   LEV-WRITE-GF-2-1.                          NC1264.2 1258
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125500     PERFORM FAIL.                                                NC1264.2 418
   001253         125600     MOVE TB-1 TO COMPUTED-A.                                     NC1264.2 136 278
   001254         125700     MOVE "AB" TO CORRECT-A.                                      NC1264.2 292
   001255         125800     GO   TO    LEV-WRITE-GF-2-1.                                 NC1264.2 1258
   001256         125900 LEV-DELETE-GF-2-1.                                               NC1264.2
   001257         126000     PERFORM DE-LETE.                                             NC1264.2 419
   001258         126100 LEV-WRITE-GF-2-1.                                                NC1264.2
   001259         126200     MOVE  "LEV-TEST-GF-2-1"  TO PAR-NAME.                        NC1264.2 267
   001260         126300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001261         126400 LEV-TEST-GF-2-2.                                                 NC1264.2
   001262         126500     IF TB-2 EQUAL TO "CD"                                        NC1264.2 138
   001263      1  126600              PERFORM PASS                                        NC1264.2 417
   001264      1  126700              GO  TO   LEV-WRITE-GF-2-2.                          NC1264.2 1271
   001265         126800     PERFORM FAIL.                                                NC1264.2 418
   001266         126900     MOVE TB-2 TO COMPUTED-A.                                     NC1264.2 138 278
   001267         127000     MOVE "CD" TO  CORRECT-A.                                     NC1264.2 292
   001268         127100     GO   TO    LEV-WRITE-GF-2-2.                                 NC1264.2 1271
   001269         127200 LEV-DELETE-GF-2-2.                                               NC1264.2
   001270         127300     PERFORM DE-LETE.                                             NC1264.2 419
   001271         127400 LEV-WRITE-GF-2-2.                                                NC1264.2
   001272         127500     MOVE  "LEV-TEST-GF-2-2"  TO PAR-NAME.                        NC1264.2 267
   001273         127600     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001274         127700 LEV-TEST-GF-2-3.                                                 NC1264.2
   001275         127800     IF TB-3 EQUAL TO "EF"                                        NC1264.2 140
   001276      1  127900              PERFORM PASS                                        NC1264.2 417
   001277      1  128000              GO  TO   LEV-WRITE-GF-2-3.                          NC1264.2 1284
   001278         128100     PERFORM FAIL.                                                NC1264.2 418
   001279         128200     MOVE TB-3 TO COMPUTED-A.                                     NC1264.2 140 278
   001280         128300     MOVE "EF" TO CORRECT-A.                                      NC1264.2 292
   001281         128400     GO   TO    LEV-WRITE-GF-2-3.                                 NC1264.2 1284
   001282         128500 LEV-DELETE-GF-2-3.                                               NC1264.2
   001283         128600     PERFORM DE-LETE.                                             NC1264.2 419
   001284         128700 LEV-WRITE-GF-2-3.                                                NC1264.2
   001285         128800     MOVE  "LEV-TEST-GF-2-3"  TO PAR-NAME.                        NC1264.2 267
   001286         128900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001287         129000 LEV-TEST-GF-2-4.                                                 NC1264.2
   001288         129100     IF TB-4 EQUAL TO "GH"                                        NC1264.2 142
   001289      1  129200              PERFORM PASS                                        NC1264.2 417
   001290      1  129300              GO  TO   LEV-WRITE-GF-2-4.                          NC1264.2 1297
   001291         129400     PERFORM FAIL.                                                NC1264.2 418
   001292         129500     MOVE TB-4 TO COMPUTED-A.                                     NC1264.2 142 278
   001293         129600     MOVE "GH" TO CORRECT-A.                                      NC1264.2 292
   001294         129700     GO   TO    LEV-WRITE-GF-2-4.                                 NC1264.2 1297
   001295         129800 LEV-DELETE-GF-2-4.                                               NC1264.2
   001296         129900     PERFORM DE-LETE.                                             NC1264.2 419
   001297         130000 LEV-WRITE-GF-2-4.                                                NC1264.2
   001298         130100     MOVE  "LEV-TEST-GF-2-4"  TO PAR-NAME.                        NC1264.2 267
   001299         130200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001300         130300 LEV-TEST-GF-2-5.                                                 NC1264.2
   001301         130400     IF TB-5 EQUAL TO "IJ"                                        NC1264.2 144
   001302      1  130500              PERFORM PASS                                        NC1264.2 417
   001303      1  130600              GO  TO   LEV-WRITE-GF-2-5.                          NC1264.2 1310
   001304         130700     PERFORM FAIL.                                                NC1264.2 418
   001305         130800     MOVE TB-5 TO COMPUTED-A.                                     NC1264.2 144 278
   001306         130900     MOVE "IJ" TO CORRECT-A.                                      NC1264.2 292
   001307         131000     GO   TO    LEV-WRITE-GF-2-5.                                 NC1264.2 1310
   001308         131100 LEV-DELETE-GF-2-5.                                               NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131200     PERFORM DE-LETE.                                             NC1264.2 419
   001310         131300 LEV-WRITE-GF-2-5.                                                NC1264.2
   001311         131400     MOVE  "LEV-TEST-GF-2-5"  TO PAR-NAME.                        NC1264.2 267
   001312         131500     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001313         131600 LEV-TEST-GF-2-6.                                                 NC1264.2
   001314         131700     IF TB-6 EQUAL TO "KL"                                        NC1264.2 146
   001315      1  131800              PERFORM PASS                                        NC1264.2 417
   001316      1  131900              GO  TO   LEV-WRITE-GF-2-6.                          NC1264.2 1323
   001317         132000     PERFORM FAIL.                                                NC1264.2 418
   001318         132100     MOVE TB-6 TO COMPUTED-A.                                     NC1264.2 146 278
   001319         132200     MOVE "KL" TO CORRECT-A.                                      NC1264.2 292
   001320         132300     GO   TO    LEV-WRITE-GF-2-6.                                 NC1264.2 1323
   001321         132400 LEV-DELETE-GF-2-6.                                               NC1264.2
   001322         132500     PERFORM DE-LETE.                                             NC1264.2 419
   001323         132600 LEV-WRITE-GF-2-6.                                                NC1264.2
   001324         132700     MOVE  "LEV-TEST-GF-2-6"  TO PAR-NAME.                        NC1264.2 267
   001325         132800     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001326         132900 LEV-TEST-GF-2-7.                                                 NC1264.2
   001327         133000     IF TB-7 EQUAL TO "MN"                                        NC1264.2 148
   001328      1  133100              PERFORM PASS                                        NC1264.2 417
   001329      1  133200              GO  TO   LEV-WRITE-GF-2-7.                          NC1264.2 1336
   001330         133300     PERFORM FAIL.                                                NC1264.2 418
   001331         133400     MOVE TB-7 TO COMPUTED-A.                                     NC1264.2 148 278
   001332         133500     MOVE "MN" TO CORRECT-A.                                      NC1264.2 292
   001333         133600     GO   TO    LEV-WRITE-GF-2-7.                                 NC1264.2 1336
   001334         133700 LEV-DELETE-GF-2-7.                                               NC1264.2
   001335         133800     PERFORM DE-LETE.                                             NC1264.2 419
   001336         133900 LEV-WRITE-GF-2-7.                                                NC1264.2
   001337         134000     MOVE  "LEV-TEST-GF-2-7"  TO PAR-NAME.                        NC1264.2 267
   001338         134100     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001339         134200 LEV-TEST-GF-2-8.                                                 NC1264.2
   001340         134300     IF TB-8 EQUAL TO "OP"                                        NC1264.2 150
   001341      1  134400              PERFORM PASS                                        NC1264.2 417
   001342      1  134500              GO  TO   LEV-WRITE-GF-2-8.                          NC1264.2 1349
   001343         134600     PERFORM FAIL.                                                NC1264.2 418
   001344         134700     MOVE TB-8 TO COMPUTED-A.                                     NC1264.2 150 278
   001345         134800     MOVE "OP" TO CORRECT-A.                                      NC1264.2 292
   001346         134900     GO   TO    LEV-WRITE-GF-2-8.                                 NC1264.2 1349
   001347         135000 LEV-DELETE-GF-2-8.                                               NC1264.2
   001348         135100     PERFORM DE-LETE.                                             NC1264.2 419
   001349         135200 LEV-WRITE-GF-2-8.                                                NC1264.2
   001350         135300     MOVE  "LEV-TEST-GF-2-8"  TO PAR-NAME.                        NC1264.2 267
   001351         135400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001352         135500 LEV-TEST-GF-2-9.                                                 NC1264.2
   001353         135600     IF TB-9 EQUAL TO "QR"                                        NC1264.2 152
   001354      1  135700              PERFORM PASS                                        NC1264.2 417
   001355      1  135800              GO  TO   LEV-WRITE-GF-2-9.                          NC1264.2 1362
   001356         135900     PERFORM FAIL.                                                NC1264.2 418
   001357         136000     MOVE TB-9 TO COMPUTED-A.                                     NC1264.2 152 278
   001358         136100     MOVE "QR" TO CORRECT-A.                                      NC1264.2 292
   001359         136200     GO   TO    LEV-WRITE-GF-2-9.                                 NC1264.2 1362
   001360         136300 LEV-DELETE-GF-2-9.                                               NC1264.2
   001361         136400     PERFORM DE-LETE.                                             NC1264.2 419
   001362         136500 LEV-WRITE-GF-2-9.                                                NC1264.2
   001363         136600     MOVE  "LEV-TEST-GF-2-9"  TO PAR-NAME.                        NC1264.2 267
   001364         136700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001365         136800 LEV-TEST-GF-2-10.                                                NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         136900     IF TB-10 EQUAL TO "ST"                                       NC1264.2 154
   001367      1  137000              PERFORM  PASS                                       NC1264.2 417
   001368      1  137100              GO  TO   LEV-WRITE-GF-2-10.                         NC1264.2 1375
   001369         137200     PERFORM FAIL.                                                NC1264.2 418
   001370         137300     MOVE TB-10 TO COMPUTED-A.                                    NC1264.2 154 278
   001371         137400     MOVE "ST" TO CORRECT-A.                                      NC1264.2 292
   001372         137500     GO   TO    LEV-WRITE-GF-2-10.                                NC1264.2 1375
   001373         137600 LEV-DELETE-GF-2-10.                                              NC1264.2
   001374         137700     PERFORM DE-LETE.                                             NC1264.2 419
   001375         137800 LEV-WRITE-GF-2-10.                                               NC1264.2
   001376         137900     MOVE  "LEV-TEST-GF-2-10"  TO PAR-NAME.                       NC1264.2 267
   001377         138000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001378         138100 LEV-TEST-GF-2-11.                                                NC1264.2
   001379         138200     IF TB-11 EQUAL TO "01"                                       NC1264.2 156
   001380      1  138300              PERFORM PASS                                        NC1264.2 417
   001381      1  138400              GO  TO   LEV-WRITE-GF-2-11.                         NC1264.2 1388
   001382         138500     PERFORM FAIL.                                                NC1264.2 418
   001383         138600     MOVE TB-11 TO COMPUTED-A.                                    NC1264.2 156 278
   001384         138700     MOVE "01" TO CORRECT-A.                                      NC1264.2 292
   001385         138800     GO   TO    LEV-WRITE-GF-2-11.                                NC1264.2 1388
   001386         138900 LEV-DELETE-GF-2-11.                                              NC1264.2
   001387         139000     PERFORM DE-LETE.                                             NC1264.2 419
   001388         139100 LEV-WRITE-GF-2-11.                                               NC1264.2
   001389         139200     MOVE  "LEV-TEST-GF-2-11"  TO PAR-NAME.                       NC1264.2 267
   001390         139300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001391         139400 LEV-TEST-GF-2-12.                                                NC1264.2
   001392         139500     IF TB-12 EQUAL TO "23"                                       NC1264.2 158
   001393      1  139600              PERFORM PASS                                        NC1264.2 417
   001394      1  139700              GO  TO   LEV-WRITE-GF-2-12.                         NC1264.2 1401
   001395         139800     PERFORM FAIL.                                                NC1264.2 418
   001396         139900     MOVE TB-12 TO COMPUTED-A.                                    NC1264.2 158 278
   001397         140000     MOVE "23" TO CORRECT-A.                                      NC1264.2 292
   001398         140100     GO   TO    LEV-WRITE-GF-2-12.                                NC1264.2 1401
   001399         140200 LEV-DELETE-GF-2-12.                                              NC1264.2
   001400         140300     PERFORM DE-LETE.                                             NC1264.2 419
   001401         140400 LEV-WRITE-GF-2-12.                                               NC1264.2
   001402         140500     MOVE  "LEV-TEST-GF-2-12"  TO PAR-NAME.                       NC1264.2 267
   001403         140600     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001404         140700 LEV-TEST-GF-2-13.                                                NC1264.2
   001405         140800     IF TB-13 EQUAL TO "45"                                       NC1264.2 160
   001406      1  140900              PERFORM PASS                                        NC1264.2 417
   001407      1  141000              GO  TO   LEV-WRITE-GF-2-13.                         NC1264.2 1414
   001408         141100     PERFORM FAIL.                                                NC1264.2 418
   001409         141200     MOVE TB-13 TO COMPUTED-A.                                    NC1264.2 160 278
   001410         141300     MOVE "45" TO CORRECT-A.                                      NC1264.2 292
   001411         141400     GO   TO    LEV-WRITE-GF-2-13.                                NC1264.2 1414
   001412         141500 LEV-DELETE-GF-2-13.                                              NC1264.2
   001413         141600     PERFORM DE-LETE.                                             NC1264.2 419
   001414         141700 LEV-WRITE-GF-2-13.                                               NC1264.2
   001415         141800     MOVE  "LEV-TEST-GF-2-13"  TO PAR-NAME.                       NC1264.2 267
   001416         141900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001417         142000 LEV-TEST-GF-2-14.                                                NC1264.2
   001418         142100     IF TB-14 EQUAL TO "67"                                       NC1264.2 162
   001419      1  142200              PERFORM PASS                                        NC1264.2 417
   001420      1  142300              GO  TO   LEV-WRITE-GF-2-14.                         NC1264.2 1427
   001421         142400     PERFORM FAIL.                                                NC1264.2 418
   001422         142500     MOVE TB-14 TO COMPUTED-A.                                    NC1264.2 162 278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142600     MOVE "67" TO CORRECT-A.                                      NC1264.2 292
   001424         142700     GO   TO    LEV-WRITE-GF-2-14.                                NC1264.2 1427
   001425         142800 LEV-DELETE-GF-2-14.                                              NC1264.2
   001426         142900     PERFORM DE-LETE.                                             NC1264.2 419
   001427         143000 LEV-WRITE-GF-2-14.                                               NC1264.2
   001428         143100     MOVE  "LEV-TEST-GF-2-14"  TO PAR-NAME.                       NC1264.2 267
   001429         143200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001430         143300 LEV-TEST-GF-2-15.                                                NC1264.2
   001431         143400     IF TB-15 EQUAL TO "89"                                       NC1264.2 164
   001432      1  143500              PERFORM PASS                                        NC1264.2 417
   001433      1  143600              GO  TO   LEV-WRITE-GF-2-15.                         NC1264.2 1440
   001434         143700     PERFORM FAIL.                                                NC1264.2 418
   001435         143800     MOVE TB-15 TO COMPUTED-A.                                    NC1264.2 164 278
   001436         143900     MOVE "89" TO CORRECT-A.                                      NC1264.2 292
   001437         144000     GO   TO    LEV-WRITE-GF-2-15.                                NC1264.2 1440
   001438         144100 LEV-DELETE-GF-2-15.                                              NC1264.2
   001439         144200     PERFORM DE-LETE.                                             NC1264.2 419
   001440         144300 LEV-WRITE-GF-2-15.                                               NC1264.2
   001441         144400     MOVE "LEV-TEST-GF-2-15" TO PAR-NAME.                         NC1264.2 267
   001442         144500     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001443         144600 LEV-TEST-GF-2-16.                                                NC1264.2
   001444         144700     IF TB-16 EQUAL TO "98"                                       NC1264.2 166
   001445      1  144800              PERFORM PASS                                        NC1264.2 417
   001446      1  144900              GO  TO   LEV-WRITE-GF-2-16.                         NC1264.2 1453
   001447         145000     PERFORM FAIL.                                                NC1264.2 418
   001448         145100     MOVE TB-16 TO COMPUTED-A.                                    NC1264.2 166 278
   001449         145200     MOVE "98" TO CORRECT-A.                                      NC1264.2 292
   001450         145300     GO   TO    LEV-WRITE-GF-2-16.                                NC1264.2 1453
   001451         145400 LEV-DELETE-GF-2-16.                                              NC1264.2
   001452         145500     PERFORM DE-LETE.                                             NC1264.2 419
   001453         145600 LEV-WRITE-GF-2-16.                                               NC1264.2
   001454         145700     MOVE  "LEV-TEST-GF-2-16"  TO PAR-NAME.                       NC1264.2 267
   001455         145800     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001456         145900 LEV-TEST-GF-2-17.                                                NC1264.2
   001457         146000     IF TB-17 EQUAL TO "76"                                       NC1264.2 168
   001458      1  146100              PERFORM PASS                                        NC1264.2 417
   001459      1  146200              GO  TO   LEV-WRITE-GF-2-17.                         NC1264.2 1466
   001460         146300     PERFORM FAIL.                                                NC1264.2 418
   001461         146400     MOVE TB-17 TO COMPUTED-A.                                    NC1264.2 168 278
   001462         146500     MOVE "76" TO CORRECT-A.                                      NC1264.2 292
   001463         146600     GO   TO    LEV-WRITE-GF-2-17.                                NC1264.2 1466
   001464         146700 LEV-DELETE-GF-2-17.                                              NC1264.2
   001465         146800     PERFORM DE-LETE.                                             NC1264.2 419
   001466         146900 LEV-WRITE-GF-2-17.                                               NC1264.2
   001467         147000     MOVE  "LEV-TEST-GF-2-17"  TO PAR-NAME.                       NC1264.2 267
   001468         147100     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001469         147200 LEV-TEST-GF-2-18.                                                NC1264.2
   001470         147300     IF TB-18 EQUAL TO "54"                                       NC1264.2 170
   001471      1  147400              PERFORM PASS                                        NC1264.2 417
   001472      1  147500              GO  TO   LEV-WRITE-GF-2-18.                         NC1264.2 1479
   001473         147600     PERFORM FAIL.                                                NC1264.2 418
   001474         147700     MOVE TB-18 TO COMPUTED-A.                                    NC1264.2 170 278
   001475         147800     MOVE "54" TO CORRECT-A.                                      NC1264.2 292
   001476         147900     GO   TO    LEV-WRITE-GF-2-18.                                NC1264.2 1479
   001477         148000 LEV-DELETE-GF-2-18.                                              NC1264.2
   001478         148100     PERFORM DE-LETE.                                             NC1264.2 419
   001479         148200 LEV-WRITE-GF-2-18.                                               NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148300     MOVE  "LEV-TEST-GF-2-18"  TO PAR-NAME.                       NC1264.2 267
   001481         148400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001482         148500 LEV-TEST-GF-2-19.                                                NC1264.2
   001483         148600     IF TB-19 EQUAL TO "32"                                       NC1264.2 172
   001484      1  148700              PERFORM PASS                                        NC1264.2 417
   001485      1  148800              GO  TO   LEV-WRITE-GF-2-19.                         NC1264.2 1492
   001486         148900     PERFORM FAIL.                                                NC1264.2 418
   001487         149000     MOVE TB-19 TO COMPUTED-A.                                    NC1264.2 172 278
   001488         149100     MOVE "32" TO CORRECT-A.                                      NC1264.2 292
   001489         149200     GO   TO    LEV-WRITE-GF-2-19.                                NC1264.2 1492
   001490         149300 LEV-DELETE-GF-2-19.                                              NC1264.2
   001491         149400     PERFORM DE-LETE.                                             NC1264.2 419
   001492         149500 LEV-WRITE-GF-2-19.                                               NC1264.2
   001493         149600     MOVE  "LEV-TEST-GF-2-19"  TO PAR-NAME.                       NC1264.2 267
   001494         149700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001495         149800 LEV-TEST-GF-2-20.                                                NC1264.2
   001496         149900     IF TB-20 EQUAL TO "10"                                       NC1264.2 174
   001497      1  150000              PERFORM PASS                                        NC1264.2 417
   001498      1  150100              GO  TO   LEV-WRITE-GF-2-20.                         NC1264.2 1505
   001499         150200     PERFORM FAIL.                                                NC1264.2 418
   001500         150300     MOVE TB-20 TO COMPUTED-A.                                    NC1264.2 174 278
   001501         150400     MOVE "10" TO CORRECT-A.                                      NC1264.2 292
   001502         150500     GO   TO    LEV-WRITE-GF-2-20.                                NC1264.2 1505
   001503         150600 LEV-DELETE-GF-2-20.                                              NC1264.2
   001504         150700     PERFORM DE-LETE.                                             NC1264.2 419
   001505         150800 LEV-WRITE-GF-2-20.                                               NC1264.2
   001506         150900     MOVE  "LEV-TEST-GF-2-20"  TO PAR-NAME.                       NC1264.2 267
   001507         151000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001508         151100 LEV-TEST-GF-2-21.                                                NC1264.2
   001509         151200     IF TB-21 EQUAL TO "SU"                                       NC1264.2 176
   001510      1  151300              PERFORM PASS                                        NC1264.2 417
   001511      1  151400              GO  TO   LEV-WRITE-GF-2-21.                         NC1264.2 1518
   001512         151500     PERFORM FAIL.                                                NC1264.2 418
   001513         151600     MOVE TB-21 TO COMPUTED-A.                                    NC1264.2 176 278
   001514         151700     MOVE "SU" TO CORRECT-A.                                      NC1264.2 292
   001515         151800     GO   TO    LEV-WRITE-GF-2-21.                                NC1264.2 1518
   001516         151900 LEV-DELETE-GF-2-21.                                              NC1264.2
   001517         152000     PERFORM DE-LETE.                                             NC1264.2 419
   001518         152100 LEV-WRITE-GF-2-21.                                               NC1264.2
   001519         152200     MOVE  "LEV-TEST-GF-2-21"  TO PAR-NAME.                       NC1264.2 267
   001520         152300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001521         152400 LEV-TEST-GF-2-22.                                                NC1264.2
   001522         152500     IF TB-22 EQUAL TO "PE"                                       NC1264.2 178
   001523      1  152600              PERFORM PASS                                        NC1264.2 417
   001524      1  152700              GO  TO   LEV-WRITE-GF-2-22.                         NC1264.2 1531
   001525         152800     PERFORM FAIL.                                                NC1264.2 418
   001526         152900     MOVE TB-22 TO COMPUTED-A.                                    NC1264.2 178 278
   001527         153000     MOVE "PE" TO CORRECT-A.                                      NC1264.2 292
   001528         153100     GO   TO    LEV-WRITE-GF-2-22.                                NC1264.2 1531
   001529         153200 LEV-DELETE-GF-2-22.                                              NC1264.2
   001530         153300     PERFORM DE-LETE.                                             NC1264.2 419
   001531         153400 LEV-WRITE-GF-2-22.                                               NC1264.2
   001532         153500     MOVE  "LEV-TEST-GF-2-22"  TO PAR-NAME.                       NC1264.2 267
   001533         153600     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001534         153700 LEV-TEST-GF-2-23.                                                NC1264.2
   001535         153800     IF TB-23 EQUAL TO "RC"                                       NC1264.2 180
   001536      1  153900              PERFORM PASS                                        NC1264.2 417
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537      1  154000              GO  TO   LEV-WRITE-GF-2-23.                         NC1264.2 1544
   001538         154100     PERFORM FAIL.                                                NC1264.2 418
   001539         154200     MOVE TB-23 TO COMPUTED-A.                                    NC1264.2 180 278
   001540         154300     MOVE "RC" TO CORRECT-A.                                      NC1264.2 292
   001541         154400     GO   TO    LEV-WRITE-GF-2-23.                                NC1264.2 1544
   001542         154500 LEV-DELETE-GF-2-23.                                              NC1264.2
   001543         154600     PERFORM DE-LETE.                                             NC1264.2 419
   001544         154700 LEV-WRITE-GF-2-23.                                               NC1264.2
   001545         154800     MOVE  "LEV-TEST-GF-2-23"  TO PAR-NAME.                       NC1264.2 267
   001546         154900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001547         155000 LEV-TEST-GF-2-24.                                                NC1264.2
   001548         155100     IF TB-24 EQUAL TO "AL"                                       NC1264.2 182
   001549      1  155200              PERFORM PASS                                        NC1264.2 417
   001550      1  155300              GO  TO   LEV-WRITE-GF-2-24.                         NC1264.2 1557
   001551         155400     PERFORM FAIL.                                                NC1264.2 418
   001552         155500     MOVE TB-24 TO COMPUTED-A.                                    NC1264.2 182 278
   001553         155600     MOVE "AL" TO CORRECT-A.                                      NC1264.2 292
   001554         155700     GO   TO    LEV-WRITE-GF-2-24.                                NC1264.2 1557
   001555         155800 LEV-DELETE-GF-2-24.                                              NC1264.2
   001556         155900     PERFORM DE-LETE.                                             NC1264.2 419
   001557         156000 LEV-WRITE-GF-2-24.                                               NC1264.2
   001558         156100     MOVE  "LEV-TEST-GF-2-24"  TO PAR-NAME.                       NC1264.2 267
   001559         156200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001560         156300 LEV-TEST-GF-2-25.                                                NC1264.2
   001561         156400     IF TB-25 EQUAL TO "IF"                                       NC1264.2 184
   001562      1  156500              PERFORM PASS                                        NC1264.2 417
   001563      1  156600              GO  TO   LEV-WRITE-GF-2-25.                         NC1264.2 1570
   001564         156700     PERFORM FAIL.                                                NC1264.2 418
   001565         156800     MOVE TB-25 TO COMPUTED-A.                                    NC1264.2 184 278
   001566         156900     MOVE "IF" TO CORRECT-A.                                      NC1264.2 292
   001567         157000     GO   TO    LEV-WRITE-GF-2-25.                                NC1264.2 1570
   001568         157100 LEV-DELETE-GF-2-25.                                              NC1264.2
   001569         157200     PERFORM DE-LETE.                                             NC1264.2 419
   001570         157300 LEV-WRITE-GF-2-25.                                               NC1264.2
   001571         157400     MOVE  "LEV-TEST-GF-2-25"  TO PAR-NAME.                       NC1264.2 267
   001572         157500     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001573         157600 LEV-TEST-GF-2-26.                                                NC1264.2
   001574         157700     IF TB-26 EQUAL TO "RA"                                       NC1264.2 186
   001575      1  157800              PERFORM PASS                                        NC1264.2 417
   001576      1  157900              GO  TO   LEV-WRITE-GF-2-26.                         NC1264.2 1583
   001577         158000     PERFORM FAIL.                                                NC1264.2 418
   001578         158100     MOVE TB-26 TO COMPUTED-A.                                    NC1264.2 186 278
   001579         158200     MOVE "RA" TO CORRECT-A.                                      NC1264.2 292
   001580         158300     GO   TO    LEV-WRITE-GF-2-26.                                NC1264.2 1583
   001581         158400 LEV-DELETE-GF-2-26.                                              NC1264.2
   001582         158500     PERFORM DE-LETE.                                             NC1264.2 419
   001583         158600 LEV-WRITE-GF-2-26.                                               NC1264.2
   001584         158700     MOVE  "LEV-TEST-GF-2-26"  TO PAR-NAME.                       NC1264.2 267
   001585         158800     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001586         158900 LEV-TEST-GF-2-27.                                                NC1264.2
   001587         159000     IF TB-27 EQUAL TO "GI"                                       NC1264.2 188
   001588      1  159100              PERFORM PASS                                        NC1264.2 417
   001589      1  159200              GO  TO   LEV-WRITE-GF-2-27.                         NC1264.2 1596
   001590         159300     PERFORM FAIL.                                                NC1264.2 418
   001591         159400     MOVE TB-27 TO COMPUTED-A.                                    NC1264.2 188 278
   001592         159500     MOVE "GI" TO CORRECT-A.                                      NC1264.2 292
   001593         159600     GO   TO    LEV-WRITE-GF-2-27.                                NC1264.2 1596
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159700 LEV-DELETE-GF-2-27.                                              NC1264.2
   001595         159800     PERFORM DE-LETE.                                             NC1264.2 419
   001596         159900 LEV-WRITE-GF-2-27.                                               NC1264.2
   001597         160000     MOVE  "LEV-TEST-GF-2-27"  TO PAR-NAME.                       NC1264.2 267
   001598         160100     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001599         160200 LEV-TEST-GF-2-28.                                                NC1264.2
   001600         160300     IF TB-28 EQUAL TO "LI"                                       NC1264.2 190
   001601      1  160400             PERFORM PASS                                         NC1264.2 417
   001602      1  160500              GO  TO   LEV-WRITE-GF-2-28.                         NC1264.2 1609
   001603         160600     PERFORM FAIL.                                                NC1264.2 418
   001604         160700     MOVE TB-29 TO COMPUTED-A.                                    NC1264.2 192 278
   001605         160800     MOVE "LI" TO CORRECT-A.                                      NC1264.2 292
   001606         160900     GO   TO    LEV-WRITE-GF-2-28.                                NC1264.2 1609
   001607         161000 LEV-DELETE-GF-2-28.                                              NC1264.2
   001608         161100     PERFORM DE-LETE.                                             NC1264.2 419
   001609         161200 LEV-WRITE-GF-2-28.                                               NC1264.2
   001610         161300     MOVE  "LEV-TEST-GF-2-28"  TO PAR-NAME.                       NC1264.2 267
   001611         161400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001612         161500 LEV-TEST-GF-2-29.                                                NC1264.2
   001613         161600     IF TB-29 EQUAL TO "ST"                                       NC1264.2 192
   001614      1  161700              PERFORM PASS                                        NC1264.2 417
   001615      1  161800              GO  TO   LEV-WRITE-GF-2-29.                         NC1264.2 1622
   001616         161900     PERFORM FAIL.                                                NC1264.2 418
   001617         162000     MOVE TB-29 TO COMPUTED-A.                                    NC1264.2 192 278
   001618         162100     MOVE "ST" TO CORRECT-A.                                      NC1264.2 292
   001619         162200     GO   TO    LEV-WRITE-GF-2-29.                                NC1264.2 1622
   001620         162300 LEV-DELETE-GF-2-29.                                              NC1264.2
   001621         162400     PERFORM DE-LETE.                                             NC1264.2 419
   001622         162500 LEV-WRITE-GF-2-29.                                               NC1264.2
   001623         162600     MOVE  "LEV-TEST-GF-2-29"  TO PAR-NAME.                       NC1264.2 267
   001624         162700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001625         162800 LEV-TEST-GF-2-30.                                                NC1264.2
   001626         162900     IF TB-30 EQUAL TO "IC"                                       NC1264.2 194
   001627      1  163000              PERFORM PASS                                        NC1264.2 417
   001628      1  163100              GO  TO   LEV-WRITE-GF-2-30.                         NC1264.2 1635
   001629         163200     PERFORM FAIL.                                                NC1264.2 418
   001630         163300     MOVE TB-30 TO COMPUTED-A.                                    NC1264.2 194 278
   001631         163400     MOVE "IC" TO CORRECT-A.                                      NC1264.2 292
   001632         163500     GO   TO    LEV-WRITE-GF-2-30.                                NC1264.2 1635
   001633         163600 LEV-DELETE-GF-2-30.                                              NC1264.2
   001634         163700     PERFORM DE-LETE.                                             NC1264.2 419
   001635         163800 LEV-WRITE-GF-2-30.                                               NC1264.2
   001636         163900     MOVE  "LEV-TEST-GF-2-30"  TO PAR-NAME.                       NC1264.2 267
   001637         164000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001638         164100 LEV-TEST-GF-2-31.                                                NC1264.2
   001639         164200     IF TB-31 EQUAL TO "TH"                                       NC1264.2 196
   001640      1  164300              PERFORM PASS                                        NC1264.2 417
   001641      1  164400              GO  TO   LEV-WRITE-GF-2-31.                         NC1264.2 1648
   001642         164500     PERFORM FAIL.                                                NC1264.2 418
   001643         164600     MOVE TB-31 TO COMPUTED-A.                                    NC1264.2 196 278
   001644         164700     MOVE "TH" TO CORRECT-A.                                      NC1264.2 292
   001645         164800     GO   TO    LEV-WRITE-GF-2-31.                                NC1264.2 1648
   001646         164900 LEV-DELETE-GF-2-31.                                              NC1264.2
   001647         165000     PERFORM DE-LETE.                                             NC1264.2 419
   001648         165100 LEV-WRITE-GF-2-31.                                               NC1264.2
   001649         165200     MOVE  "LEV-TEST-GF-2-31"  TO PAR-NAME.                       NC1264.2 267
   001650         165300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165400 LEV-TEST-GF-2-32.                                                NC1264.2
   001652         165500     IF TB-32 EQUAL TO "AT"                                       NC1264.2 198
   001653      1  165600              PERFORM PASS                                        NC1264.2 417
   001654      1  165700              GO  TO   LEV-WRITE-GF-2-32.                         NC1264.2 1661
   001655         165800     PERFORM FAIL.                                                NC1264.2 418
   001656         165900     MOVE TB-32 TO COMPUTED-A.                                    NC1264.2 198 278
   001657         166000     MOVE "AT" TO CORRECT-A.                                      NC1264.2 292
   001658         166100     GO   TO    LEV-WRITE-GF-2-32.                                NC1264.2 1661
   001659         166200 LEV-DELETE-GF-2-32.                                              NC1264.2
   001660         166300     PERFORM DE-LETE.                                             NC1264.2 419
   001661         166400 LEV-WRITE-GF-2-32.                                               NC1264.2
   001662         166500     MOVE  "LEV-TEST-GF-2-32"  TO PAR-NAME.                       NC1264.2 267
   001663         166600     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001664         166700 LEV-TEST-GF-2-33.                                                NC1264.2
   001665         166800     IF TB-33 EQUAL TO " L"                                       NC1264.2 200
   001666      1  166900              PERFORM PASS                                        NC1264.2 417
   001667      1  167000              GO  TO   LEV-WRITE-GF-2-33.                         NC1264.2 1674
   001668         167100     PERFORM FAIL.                                                NC1264.2 418
   001669         167200     MOVE TB-33 TO COMPUTED-A.                                    NC1264.2 200 278
   001670         167300     MOVE " L" TO CORRECT-A.                                      NC1264.2 292
   001671         167400     GO   TO    LEV-WRITE-GF-2-33.                                NC1264.2 1674
   001672         167500 LEV-DELETE-GF-2-33.                                              NC1264.2
   001673         167600     PERFORM DE-LETE.                                             NC1264.2 419
   001674         167700 LEV-WRITE-GF-2-33.                                               NC1264.2
   001675         167800     MOVE  "LEV-TEST-GF-2-33"  TO PAR-NAME.                       NC1264.2 267
   001676         167900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001677         168000 LEV-TEST-GF-2-34.                                                NC1264.2
   001678         168100     IF TB-34 EQUAL TO "IT"                                       NC1264.2 202
   001679      1  168200              PERFORM PASS                                        NC1264.2 417
   001680      1  168300              GO  TO   LEV-WRITE-GF-2-34.                         NC1264.2 1687
   001681         168400     PERFORM FAIL.                                                NC1264.2 418
   001682         168500     MOVE TB-34 TO COMPUTED-A.                                    NC1264.2 202 278
   001683         168600     MOVE "IT" TO CORRECT-A.                                      NC1264.2 292
   001684         168700     GO   TO    LEV-WRITE-GF-2-34.                                NC1264.2 1687
   001685         168800 LEV-DELETE-GF-2-34.                                              NC1264.2
   001686         168900     PERFORM DE-LETE.                                             NC1264.2 419
   001687         169000 LEV-WRITE-GF-2-34.                                               NC1264.2
   001688         169100     MOVE  "LEV-TEST-GF-2-34"  TO PAR-NAME.                       NC1264.2 267
   001689         169200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001690         169300 LEV-TEST-GF-2-35.                                                NC1264.2
   001691         169400     IF TB-35 EQUAL TO "ER"                                       NC1264.2 204
   001692      1  169500              PERFORM PASS                                        NC1264.2 417
   001693      1  169600              GO  TO   LEV-WRITE-GF-2-35.                         NC1264.2 1700
   001694         169700     PERFORM FAIL.                                                NC1264.2 418
   001695         169800     MOVE TB-35 TO COMPUTED-A.                                    NC1264.2 204 278
   001696         169900     MOVE "ER" TO CORRECT-A.                                      NC1264.2 292
   001697         170000     GO   TO    LEV-WRITE-GF-2-35.                                NC1264.2 1700
   001698         170100 LEV-DELETE-GF-2-35.                                              NC1264.2
   001699         170200     PERFORM DE-LETE.                                             NC1264.2 419
   001700         170300 LEV-WRITE-GF-2-35.                                               NC1264.2
   001701         170400     MOVE  "LEV-TEST-GF-2-35"  TO PAR-NAME.                       NC1264.2 267
   001702         170500     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001703         170600 LEV-TEST-GF-2-36.                                                NC1264.2
   001704         170700     IF TB-36 EQUAL TO "AL"                                       NC1264.2 206
   001705      1  170800              PERFORM PASS                                        NC1264.2 417
   001706      1  170900              GO  TO   LEV-WRITE-GF-2-36.                         NC1264.2 1713
   001707         171000     PERFORM FAIL.                                                NC1264.2 418
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171100     MOVE TB-36 TO COMPUTED-A.                                    NC1264.2 206 278
   001709         171200     MOVE "AL" TO CORRECT-A.                                      NC1264.2 292
   001710         171300     GO   TO    LEV-WRITE-GF-2-36.                                NC1264.2 1713
   001711         171400 LEV-DELETE-GF-2-36.                                              NC1264.2
   001712         171500     PERFORM DE-LETE.                                             NC1264.2 419
   001713         171600 LEV-WRITE-GF-2-36.                                               NC1264.2
   001714         171700     MOVE  "LEV-TEST-GF-2-36"  TO PAR-NAME.                       NC1264.2 267
   001715         171800     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001716         171900 LEV-TEST-GF-2-37.                                                NC1264.2
   001717         172000     IF TB-37 EQUAL TO " W"                                       NC1264.2 208
   001718      1  172100              PERFORM PASS                                        NC1264.2 417
   001719      1  172200              GO  TO   LEV-WRITE-GF-2-37.                         NC1264.2 1726
   001720         172300     PERFORM FAIL.                                                NC1264.2 418
   001721         172400     MOVE TB-37 TO COMPUTED-A.                                    NC1264.2 208 278
   001722         172500     MOVE " W" TO CORRECT-A.                                      NC1264.2 292
   001723         172600     GO   TO    LEV-WRITE-GF-2-37.                                NC1264.2 1726
   001724         172700 LEV-DELETE-GF-2-37.                                              NC1264.2
   001725         172800     PERFORM DE-LETE.                                             NC1264.2 419
   001726         172900 LEV-WRITE-GF-2-37.                                               NC1264.2
   001727         173000     MOVE  "LEV-TEST-GF-2-37"  TO PAR-NAME.                       NC1264.2 267
   001728         173100     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001729         173200 LEV-TEST-GF-2-38.                                                NC1264.2
   001730         173300     IF TB-38 EQUAL TO "AS"                                       NC1264.2 210
   001731      1  173400              PERFORM PASS                                        NC1264.2 417
   001732      1  173500              GO  TO   LEV-WRITE-GF-2-38.                         NC1264.2 1739
   001733         173600     PERFORM FAIL.                                                NC1264.2 418
   001734         173700     MOVE TB-38 TO COMPUTED-A.                                    NC1264.2 210 278
   001735         173800     MOVE "AS" TO CORRECT-A.                                      NC1264.2 292
   001736         173900     GO   TO    LEV-WRITE-GF-2-38.                                NC1264.2 1739
   001737         174000 LEV-DELETE-GF-2-38.                                              NC1264.2
   001738         174100     PERFORM DE-LETE.                                             NC1264.2 419
   001739         174200 LEV-WRITE-GF-2-38.                                               NC1264.2
   001740         174300     MOVE  "LEV-TEST-GF-2-38"  TO PAR-NAME.                       NC1264.2 267
   001741         174400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001742         174500 LEV-TEST-GF-2-39.                                                NC1264.2
   001743         174600     IF TB-39 EQUAL TO " B"                                       NC1264.2 212
   001744      1  174700              PERFORM PASS                                        NC1264.2 417
   001745      1  174800              GO  TO   LEV-WRITE-GF-2-39.                         NC1264.2 1752
   001746         174900     PERFORM FAIL.                                                NC1264.2 418
   001747         175000     MOVE TB-39 TO COMPUTED-A.                                    NC1264.2 212 278
   001748         175100     MOVE " B" TO CORRECT-A.                                      NC1264.2 292
   001749         175200     GO   TO    LEV-WRITE-GF-2-39.                                NC1264.2 1752
   001750         175300 LEV-DELETE-GF-2-39.                                              NC1264.2
   001751         175400     PERFORM DE-LETE.                                             NC1264.2 419
   001752         175500 LEV-WRITE-GF-2-39.                                               NC1264.2
   001753         175600     MOVE  "LEV-TEST-GF-2-39"  TO PAR-NAME.                       NC1264.2 267
   001754         175700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001755         175800 LEV-TEST-GF-2-40.                                                NC1264.2
   001756         175900     IF TB-40 EQUAL TO "AD"                                       NC1264.2 214
   001757      1  176000              PERFORM PASS                                        NC1264.2 417
   001758      1  176100              GO  TO   LEV-WRITE-GF-2-40.                         NC1264.2 1765
   001759         176200     PERFORM FAIL.                                                NC1264.2 418
   001760         176300     MOVE TB-40 TO COMPUTED-A.                                    NC1264.2 214 278
   001761         176400     MOVE "AD" TO CORRECT-A.                                      NC1264.2 292
   001762         176500     GO   TO    LEV-WRITE-GF-2-40.                                NC1264.2 1765
   001763         176600 LEV-DELETE-GF-2-40.                                              NC1264.2
   001764         176700     PERFORM DE-LETE.                                             NC1264.2 419
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176800 LEV-WRITE-GF-2-40.                                               NC1264.2
   001766         176900     MOVE  "LEV-TEST-GF-2-40"  TO PAR-NAME.                       NC1264.2 267
   001767         177000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001768         177100 LEV-TEST-GF-2-41.                                                NC1264.2
   001769         177200     IF TB-41 EQUAL TO "UP"                                       NC1264.2 216
   001770      1  177300              PERFORM PASS                                        NC1264.2 417
   001771      1  177400              GO  TO   LEV-WRITE-GF-2-41.                         NC1264.2 1778
   001772         177500     PERFORM FAIL.                                                NC1264.2 418
   001773         177600     MOVE TB-41 TO COMPUTED-A.                                    NC1264.2 216 278
   001774         177700     MOVE "UP" TO CORRECT-A.                                      NC1264.2 292
   001775         177800     GO   TO    LEV-WRITE-GF-2-41.                                NC1264.2 1778
   001776         177900 LEV-DELETE-GF-2-41.                                              NC1264.2
   001777         178000     PERFORM DE-LETE.                                             NC1264.2 419
   001778         178100 LEV-WRITE-GF-2-41.                                               NC1264.2
   001779         178200     MOVE  "LEV-TEST-GF-2-41"  TO PAR-NAME.                       NC1264.2 267
   001780         178300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001781         178400 LEV-TEST-GF-2-42.                                                NC1264.2
   001782         178500     IF TB-42  EQUAL TO " O"                                      NC1264.2 218
   001783      1  178600              PERFORM PASS                                        NC1264.2 417
   001784      1  178700              GO  TO   LEV-WRITE-GF-2-42.                         NC1264.2 1791
   001785         178800     PERFORM FAIL.                                                NC1264.2 418
   001786         178900     MOVE TB-42 TO COMPUTED-A.                                    NC1264.2 218 278
   001787         179000     MOVE " O" TO CORRECT-A.                                      NC1264.2 292
   001788         179100     GO   TO    LEV-WRITE-GF-2-42.                                NC1264.2 1791
   001789         179200 LEV-DELETE-GF-2-42.                                              NC1264.2
   001790         179300     PERFORM DE-LETE.                                             NC1264.2 419
   001791         179400 LEV-WRITE-GF-2-42.                                               NC1264.2
   001792         179500     MOVE  "LEV-TEST-GF-2-42"  TO PAR-NAME.                       NC1264.2 267
   001793         179600     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001794         179700 LEV-TEST-GF-2-43.                                                NC1264.2
   001795         179800     IF TB-43 EQUAL TO "N "                                       NC1264.2 220
   001796      1  179900              PERFORM PASS                                        NC1264.2 417
   001797      1  180000              GO  TO   LEV-WRITE-GF-2-43.                         NC1264.2 1804
   001798         180100     PERFORM FAIL.                                                NC1264.2 418
   001799         180200     MOVE TB-43 TO COMPUTED-A.                                    NC1264.2 220 278
   001800         180300     MOVE "N " TO CORRECT-A.                                      NC1264.2 292
   001801         180400     GO   TO    LEV-WRITE-GF-2-43.                                NC1264.2 1804
   001802         180500 LEV-DELETE-GF-2-43.                                              NC1264.2
   001803         180600     PERFORM DE-LETE.                                             NC1264.2 419
   001804         180700 LEV-WRITE-GF-2-43.                                               NC1264.2
   001805         180800     MOVE  "LEV-TEST-GF-2-43"  TO PAR-NAME.                       NC1264.2 267
   001806         180900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001807         181000 LEV-TEST-GF-2-44.                                                NC1264.2
   001808         181100     IF TB-44 EQUAL TO "TH"                                       NC1264.2 222
   001809      1  181200              PERFORM PASS                                        NC1264.2 417
   001810      1  181300              GO  TO   LEV-WRITE-GF-2-44.                         NC1264.2 1817
   001811         181400     PERFORM FAIL.                                                NC1264.2 418
   001812         181500     MOVE TB-44 TO COMPUTED-A.                                    NC1264.2 222 278
   001813         181600     MOVE "TH" TO CORRECT-A.                                      NC1264.2 292
   001814         181700     GO   TO    LEV-WRITE-GF-2-44.                                NC1264.2 1817
   001815         181800 LEV-DELETE-GF-2-44.                                              NC1264.2
   001816         181900     PERFORM DE-LETE.                                             NC1264.2 419
   001817         182000 LEV-WRITE-GF-2-44.                                               NC1264.2
   001818         182100     MOVE  "LEV-TEST-GF-2-44"  TO PAR-NAME.                       NC1264.2 267
   001819         182200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001820         182300 LEV-TEST-GF-2-45.                                                NC1264.2
   001821         182400     IF TB-45 EQUAL TO "E "                                       NC1264.2 224
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822      1  182500              PERFORM PASS                                        NC1264.2 417
   001823      1  182600              GO  TO   LEV-WRITE-GF-2-45.                         NC1264.2 1830
   001824         182700     PERFORM FAIL.                                                NC1264.2 418
   001825         182800     MOVE TB-45 TO COMPUTED-A.                                    NC1264.2 224 278
   001826         182900     MOVE "E " TO CORRECT-A.                                      NC1264.2 292
   001827         183000     GO   TO    LEV-WRITE-GF-2-45.                                NC1264.2 1830
   001828         183100 LEV-DELETE-GF-2-45.                                              NC1264.2
   001829         183200     PERFORM DE-LETE.                                             NC1264.2 419
   001830         183300 LEV-WRITE-GF-2-45.                                               NC1264.2
   001831         183400     MOVE  "LEV-TEST-GF-2-45"  TO PAR-NAME.                       NC1264.2 267
   001832         183500     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001833         183600 LEV-TEST-GF-2-46.                                                NC1264.2
   001834         183700     IF TB-46 EQUAL TO "RO"                                       NC1264.2 226
   001835      1  183800              PERFORM PASS                                        NC1264.2 417
   001836      1  183900              GO  TO   LEV-WRITE-GF-2-46.                         NC1264.2 1843
   001837         184000     PERFORM FAIL.                                                NC1264.2 418
   001838         184100     MOVE TB-46 TO COMPUTED-A.                                    NC1264.2 226 278
   001839         184200     MOVE "RO" TO CORRECT-A.                                      NC1264.2 292
   001840         184300     GO   TO    LEV-WRITE-GF-2-46.                                NC1264.2 1843
   001841         184400 LEV-DELETE-GF-2-46.                                              NC1264.2
   001842         184500     PERFORM DE-LETE.                                             NC1264.2 419
   001843         184600 LEV-WRITE-GF-2-46.                                               NC1264.2
   001844         184700     MOVE  "LEV-TEST-GF-2-46"  TO PAR-NAME.                       NC1264.2 267
   001845         184800     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001846         184900 LEV-TEST-GF-2-47.                                                NC1264.2
   001847         185000     IF TB-47 EQUAL TO "OF"                                       NC1264.2 228
   001848      1  185100              PERFORM PASS                                        NC1264.2 417
   001849      1  185200              GO TO LEV-WRITE-GF-2-47.                            NC1264.2 1856
   001850         185300     PERFORM FAIL.                                                NC1264.2 418
   001851         185400     MOVE TB-47  TO COMPUTED-A.                                   NC1264.2 228 278
   001852         185500     MOVE "OF" TO CORRECT-A.                                      NC1264.2 292
   001853         185600     GO   TO    LEV-WRITE-GF-2-47.                                NC1264.2 1856
   001854         185700 LEV-DELETE-GF-2-47.                                              NC1264.2
   001855         185800     PERFORM DE-LETE.                                             NC1264.2 419
   001856         185900 LEV-WRITE-GF-2-47.                                               NC1264.2
   001857         186000     MOVE  "LEV-TEST-GF-2-47"  TO PAR-NAME.                       NC1264.2 267
   001858         186100     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001859         186200 LEV-TEST-GF-2-48.                                                NC1264.2
   001860         186300     IF TB-48 EQUAL TO "S "                                       NC1264.2 230
   001861      1  186400              PERFORM PASS                                        NC1264.2 417
   001862      1  186500              GO  TO   LEV-WRITE-GF-2-48.                         NC1264.2 1869
   001863         186600     PERFORM FAIL.                                                NC1264.2 418
   001864         186700     MOVE TB-48 TO COMPUTED-A.                                    NC1264.2 230 278
   001865         186800     MOVE "S " TO CORRECT-A.                                      NC1264.2 292
   001866         186900     GO   TO    LEV-WRITE-GF-2-48.                                NC1264.2 1869
   001867         187000 LEV-DELETE-GF-2-48.                                              NC1264.2
   001868         187100     PERFORM DE-LETE.                                             NC1264.2 419
   001869         187200 LEV-WRITE-GF-2-48.                                               NC1264.2
   001870         187300     MOVE  "LEV-TEST-GF-2-48"  TO PAR-NAME.                       NC1264.2 267
   001871         187400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001872         187500 LEV-INIT-GF-3-1.                                                 NC1264.2
   001873         187600     MOVE "VI-21 5.3.3 SR1" TO ANSI-REFERENCE.                    NC1264.2 323
   001874         187700     PERFORM END-ROUTINE.                                         NC1264.2 442
   001875         187800     MOVE SPACE TO PRINT-REC.                                     NC1264.2 IMP 36
   001876         187900     MOVE "NUMERIC MOVED TO GRP"     TO FEATURE.                  NC1264.2 263
   001877         188000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001878         188100     MOVE "ELEMENTRY ITEM CHK"  TO FEATURE.                       NC1264.2 263
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879         188200     MOVE  000046                 TO GP-1.                        NC1264.2 40
   001880         188300     MOVE  12345678902            TO GP-2.                        NC1264.2 42
   001881         188400     MOVE  121619492              TO GP-3.                        NC1264.2 44
   001882         188500     MOVE  0109                   TO GP-4.                        NC1264.2 46
   001883         188600     MOVE  6645143                TO GP-5.                        NC1264.2 48
   001884         188700     MOVE  000096                 TO GP-6.                        NC1264.2 50
   001885         188800     MOVE  -4361                  TO GP-7.                        NC1264.2 52
   001886         188900     MOVE  "PROGRAM DIVISI"       TO GP-8.                        NC1264.2 54
   001887         189000     MOVE  "NPLD"                 TO GP-9.                        NC1264.2 56
   001888         189100     MOVE  770                    TO GP-10.                       NC1264.2 58
   001889         189200     MOVE  5604                   TO GP-11.                       NC1264.2 60
   001890         189300     MOVE  ZERO                   TO GP-12.                       NC1264.2 IMP 62
   001891         189400     MOVE  0004                   TO GP-13.                       NC1264.2 64
   001892         189500     MOVE  "KLOP"                 TO GP-14.                       NC1264.2 66
   001893         189600     MOVE  12345678902           TO GP-15.                        NC1264.2 68
   001894         189700     MOVE  ZERO                   TO GP-16.                       NC1264.2 IMP 70
   001895         189800     MOVE  1972                   TO GP-17.                       NC1264.2 72
   001896         189900     MOVE  -0042                  TO GP-18.                       NC1264.2 74
   001897         190000     MOVE  ZERO                   TO GP-19.                       NC1264.2 IMP 76
   001898         190100     MOVE  492                    TO GP-20.                       NC1264.2 78
   001899         190200     MOVE  SPACE                  TO GP-21.                       NC1264.2 IMP 80
   001900         190300     MOVE  040290                 TO GP-22.                       NC1264.2 82
   001901         190400     MOVE "9A8B7C"                TO GP-23.                       NC1264.2 84
   001902         190500     MOVE        040290           TO GP-24.                       NC1264.2 86
   001903         190600     MOVE  289                    TO GP-25.                       NC1264.2 88
   001904         190700     MOVE  2251                   TO GP-26.                       NC1264.2 90
   001905         190800     MOVE  1692                   TO GP-27.                       NC1264.2 92
   001906         190900     MOVE  00000041               TO GP-28.                       NC1264.2 94
   001907         191000     MOVE  00001                  TO GP-29.                       NC1264.2 96
   001908         191100     MOVE              ZERO       TO GP-30.                       NC1264.2 IMP 98
   001909         191200     MOVE  ZERO            TO GP-31.                              NC1264.2 IMP 100
   001910         191300     MOVE  000                    TO GP-32.                       NC1264.2 102
   001911         191400     MOVE  ZERO                   TO GP-33.                       NC1264.2 IMP 104
   001912         191500     MOVE  21                     TO GP-34.                       NC1264.2 106
   001913         191600     MOVE  36                     TO GP-35.                       NC1264.2 108
   001914         191700     MOVE  918                    TO GP-36.                       NC1264.2 110
   001915         191800     MOVE  ZERO TO         GP-37.                                 NC1264.2 IMP 112
   001916         191900     MOVE  -36                    TO GP-38.                       NC1264.2 114
   001917         192000     MOVE  24                     TO GP-39.                       NC1264.2 116
   001918         192100     MOVE  36                     TO GP-40.                       NC1264.2 118
   001919         192200     MOVE  -1                     TO GP-41.                       NC1264.2 120
   001920         192300     MOVE  ZERO                   TO GP-42.                       NC1264.2 IMP 122
   001921         192400     MOVE  "AIR"                  TO GP-43.                       NC1264.2 124
   001922         192500     MOVE "9ZX"                   TO GP-44.                       NC1264.2 126
   001923         192600     MOVE  01000                  TO GP-45.                       NC1264.2 128
   001924         192700     MOVE  93                     TO GP-46.                       NC1264.2 130
   001925         192800     MOVE   5      TO GP-47 (1).                                  NC1264.2 132
   001926         192900     MOVE    ZERO TO   GP-47 (2).                                 NC1264.2 IMP 132
   001927         193000     MOVE  "Y"   TO GP-48 (1).                                    NC1264.2 134
   001928         193100     MOVE   SPACE TO   GP-48 (2).                                 NC1264.2 IMP 134
   001929         193200 LEV-TEST-GF-3-1.                                                 NC1264.2
   001930         193300     IF GP-1 EQUAL TO       "   046"                              NC1264.2 40
   001931      1  193400              PERFORM PASS                                        NC1264.2 417
   001932      1  193500              GO  TO   LEV-WRITE-GF-3-1.                          NC1264.2 1939
   001933         193600     PERFORM FAIL.                                                NC1264.2 418
   001934         193700     MOVE GP-1 TO COMPUTED-A.                                     NC1264.2 40 278
   001935         193800     MOVE  "   046"               TO CORRECT-A.                   NC1264.2 292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         193900     GO   TO    LEV-WRITE-GF-3-1.                                 NC1264.2 1939
   001937         194000 LEV-DELETE-GF-3-1.                                               NC1264.2
   001938         194100     PERFORM DE-LETE.                                             NC1264.2 419
   001939         194200 LEV-WRITE-GF-3-1.                                                NC1264.2
   001940         194300     MOVE  "LEV-TEST-GF-3-1"  TO PAR-NAME.                        NC1264.2 267
   001941         194400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001942         194500 LEV-TEST-GF-3-2.                                                 NC1264.2
   001943         194600     IF GP-2 EQUAL TO "345678902.00"                              NC1264.2 42
   001944      1  194700              PERFORM PASS                                        NC1264.2 417
   001945      1  194800              GO  TO   LEV-WRITE-GF-3-2.                          NC1264.2 1952
   001946         194900     PERFORM FAIL.                                                NC1264.2 418
   001947         195000     MOVE GP-2 TO COMPUTED-A                                      NC1264.2 42 278
   001948         195100     MOVE  "345678902.00"         TO CORRECT-A.                   NC1264.2 292
   001949         195200     GO   TO    LEV-WRITE-GF-3-2.                                 NC1264.2 1952
   001950         195300 LEV-DELETE-GF-3-2.                                               NC1264.2
   001951         195400     PERFORM DE-LETE.                                             NC1264.2 419
   001952         195500 LEV-WRITE-GF-3-2.                                                NC1264.2
   001953         195600     MOVE  "LEV-TEST-GF-3-2"  TO PAR-NAME.                        NC1264.2 267
   001954         195700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001955         195800 LEV-TEST-GF-3-3.                                                 NC1264.2
   001956         195900     IF GP-3 EQUAL TO       "000121619492"                        NC1264.2 44
   001957      1  196000              PERFORM PASS                                        NC1264.2 417
   001958      1  196100              GO  TO   LEV-WRITE-GF-3-3.                          NC1264.2 1965
   001959         196200     PERFORM FAIL.                                                NC1264.2 418
   001960         196300     MOVE GP-3 TO COMPUTED-A                                      NC1264.2 44 278
   001961         196400     MOVE  "000121619492"         TO CORRECT-A.                   NC1264.2 292
   001962         196500     GO   TO    LEV-WRITE-GF-3-3.                                 NC1264.2 1965
   001963         196600 LEV-DELETE-GF-3-3.                                               NC1264.2
   001964         196700     PERFORM DE-LETE.                                             NC1264.2 419
   001965         196800 LEV-WRITE-GF-3-3.                                                NC1264.2
   001966         196900     MOVE  "LEV-TEST-GF-3-3"  TO PAR-NAME.                        NC1264.2 267
   001967         197000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001968         197100 LEV-TEST-GF-3-4.                                                 NC1264.2
   001969         197200     IF GP-4 EQUAL TO       "  1 09"                              NC1264.2 46
   001970      1  197300              PERFORM PASS                                        NC1264.2 417
   001971      1  197400              GO  TO   LEV-WRITE-GF-3-4.                          NC1264.2 1978
   001972         197500     PERFORM FAIL.                                                NC1264.2 418
   001973         197600     MOVE GP-4 TO COMPUTED-A                                      NC1264.2 46 278
   001974         197700     MOVE  "  1 09"               TO CORRECT-A.                   NC1264.2 292
   001975         197800     GO   TO    LEV-WRITE-GF-3-4.                                 NC1264.2 1978
   001976         197900 LEV-DELETE-GF-3-4.                                               NC1264.2
   001977         198000     PERFORM DE-LETE.                                             NC1264.2 419
   001978         198100 LEV-WRITE-GF-3-4.                                                NC1264.2
   001979         198200     MOVE  "LEV-TEST-GF-3-4"  TO PAR-NAME.                        NC1264.2 267
   001980         198300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001981         198400 LEV-TEST-GF-3-5.                                                 NC1264.2
   001982         198500     IF GP-5 EQUAL TO       "$45,143.00"                          NC1264.2 48
   001983      1  198600              PERFORM PASS                                        NC1264.2 417
   001984      1  198700              GO  TO   LEV-WRITE-GF-3-5.                          NC1264.2 1991
   001985         198800     PERFORM FAIL.                                                NC1264.2 418
   001986         198900     MOVE GP-5 TO COMPUTED-A                                      NC1264.2 48 278
   001987         199000     MOVE  "$45,143.00"           TO CORRECT-A.                   NC1264.2 292
   001988         199100     GO   TO    LEV-WRITE-GF-3-5.                                 NC1264.2 1991
   001989         199200 LEV-DELETE-GF-3-5.                                               NC1264.2
   001990         199300     PERFORM DE-LETE.                                             NC1264.2 419
   001991         199400 LEV-WRITE-GF-3-5.                                                NC1264.2
   001992         199500     MOVE  "LEV-TEST-GF-3-5" TO PAR-NAME.                         NC1264.2 267
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993         199600     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   001994         199700 LEV-TEST-GF-3-6.                                                 NC1264.2
   001995         199800     IF GP-6 EQUAL TO       "******96"                            NC1264.2 50
   001996      1  199900              PERFORM PASS                                        NC1264.2 417
   001997      1  200000              GO  TO   LEV-WRITE-GF-3-6.                          NC1264.2 2004
   001998         200100     PERFORM FAIL.                                                NC1264.2 418
   001999         200200     MOVE GP-6 TO COMPUTED-A                                      NC1264.2 50 278
   002000         200300     MOVE  "******96"             TO CORRECT-A.                   NC1264.2 292
   002001         200400     GO   TO    LEV-WRITE-GF-3-6.                                 NC1264.2 2004
   002002         200500 LEV-DELETE-GF-3-6.                                               NC1264.2
   002003         200600     PERFORM DE-LETE.                                             NC1264.2 419
   002004         200700 LEV-WRITE-GF-3-6.                                                NC1264.2
   002005         200800     MOVE  "LEV-TEST-GF-3-6" TO PAR-NAME.                         NC1264.2 267
   002006         200900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002007         201000 LEV-TEST-GF-3-7.                                                 NC1264.2
   002008         201100     IF GP-7 EQUAL TO       "-004,361"                            NC1264.2 52
   002009      1  201200              PERFORM PASS                                        NC1264.2 417
   002010      1  201300              GO  TO   LEV-WRITE-GF-3-7.                          NC1264.2 2017
   002011         201400     PERFORM FAIL.                                                NC1264.2 418
   002012         201500     MOVE GP-7 TO COMPUTED-A                                      NC1264.2 52 278
   002013         201600     MOVE  "-004,361"             TO CORRECT-A.                   NC1264.2 292
   002014         201700     GO   TO    LEV-WRITE-GF-3-7.                                 NC1264.2 2017
   002015         201800 LEV-DELETE-GF-3-7.                                               NC1264.2
   002016         201900     PERFORM DE-LETE.                                             NC1264.2 419
   002017         202000 LEV-WRITE-GF-3-7.                                                NC1264.2
   002018         202100     MOVE  "LEV-TEST-GF-3-7" TO PAR-NAME.                         NC1264.2 267
   002019         202200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002020         202300 LEV-TEST-GF-3-8.                                                 NC1264.2
   002021         202400     IF GP-8 EQUAL TO       "PROGRAM DIVISI"                      NC1264.2 54
   002022      1  202500              PERFORM PASS                                        NC1264.2 417
   002023      1  202600              GO  TO   LEV-WRITE-GF-3-8.                          NC1264.2 2029
   002024         202700     PERFORM FAIL.                                                NC1264.2 418
   002025         202800     MOVE  "PROGRAM DIVISI"       TO CORRECT-A.                   NC1264.2 292
   002026         202900     GO   TO    LEV-WRITE-GF-3-8.                                 NC1264.2 2029
   002027         203000 LEV-DELETE-GF-3-8.                                               NC1264.2
   002028         203100     PERFORM DE-LETE.                                             NC1264.2 419
   002029         203200 LEV-WRITE-GF-3-8.                                                NC1264.2
   002030         203300     MOVE  "LEV-TEST-GF-3-8" TO PAR-NAME.                         NC1264.2 267
   002031         203400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002032         203500 LEV-TEST-GF-3-9.                                                 NC1264.2
   002033         203600     IF GP-9 EQUAL TO       "N P L D"                             NC1264.2 56
   002034      1  203700              PERFORM PASS                                        NC1264.2 417
   002035      1  203800              GO  TO   LEV-WRITE-GF-3-9.                          NC1264.2 2042
   002036         203900     PERFORM FAIL.                                                NC1264.2 418
   002037         204000     MOVE GP-9 TO COMPUTED-A                                      NC1264.2 56 278
   002038         204100     MOVE  "N P L D"              TO CORRECT-A.                   NC1264.2 292
   002039         204200     GO   TO    LEV-WRITE-GF-3-9.                                 NC1264.2 2042
   002040         204300 LEV-DELETE-GF-3-9.                                               NC1264.2
   002041         204400     PERFORM DE-LETE.                                             NC1264.2 419
   002042         204500 LEV-WRITE-GF-3-9.                                                NC1264.2
   002043         204600     MOVE  "LEV-TEST-GF-3-9" TO PAR-NAME.                         NC1264.2 267
   002044         204700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002045         204800 LEV-TEST-GF-3-10.                                                NC1264.2
   002046         204900     IF GP-10 EQUAL TO      "7070000"                             NC1264.2 58
   002047      1  205000              PERFORM PASS                                        NC1264.2 417
   002048      1  205100              GO  TO   LEV-WRITE-GF-3-10.                         NC1264.2 2055
   002049         205200     PERFORM FAIL.                                                NC1264.2 418
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050         205300     MOVE GP-10 TO COMPUTED-A                                     NC1264.2 58 278
   002051         205400     MOVE  "7070000"              TO CORRECT-A.                   NC1264.2 292
   002052         205500     GO   TO    LEV-WRITE-GF-3-10.                                NC1264.2 2055
   002053         205600 LEV-DELETE-GF-3-10.                                              NC1264.2
   002054         205700     PERFORM DE-LETE.                                             NC1264.2 419
   002055         205800 LEV-WRITE-GF-3-10.                                               NC1264.2
   002056         205900     MOVE  "LEV-TEST-GF-3-10" TO PAR-NAME.                        NC1264.2 267
   002057         206000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002058         206100 LEV-TEST-GF-3-11.                                                NC1264.2
   002059         206200     IF GP-11 EQUAL TO     "$005,604.00"                          NC1264.2 60
   002060      1  206300              PERFORM PASS                                        NC1264.2 417
   002061      1  206400              GO  TO   LEV-WRITE-GF-3-11.                         NC1264.2 2068
   002062         206500     PERFORM FAIL.                                                NC1264.2 418
   002063         206600     MOVE GP-11 TO COMPUTED-A.                                    NC1264.2 60 278
   002064         206700     MOVE "$005,604.00"           TO CORRECT-A.                   NC1264.2 292
   002065         206800     GO   TO    LEV-WRITE-GF-3-11.                                NC1264.2 2068
   002066         206900 LEV-DELETE-GF-3-11.                                              NC1264.2
   002067         207000     PERFORM DE-LETE.                                             NC1264.2 419
   002068         207100 LEV-WRITE-GF-3-11.                                               NC1264.2
   002069         207200     MOVE  "LEV-TEST-GF-3-11" TO PAR-NAME.                        NC1264.2 267
   002070         207300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002071         207400 LEV-TEST-GF-3-12.                                                NC1264.2
   002072         207500     IF GP-12 EQUAL TO      "   .0"                               NC1264.2 62
   002073      1  207600              PERFORM PASS                                        NC1264.2 417
   002074      1  207700              GO  TO   LEV-WRITE-GF-3-12.                         NC1264.2 2081
   002075         207800     PERFORM FAIL.                                                NC1264.2 418
   002076         207900     MOVE GP-12 TO COMPUTED-A                                     NC1264.2 62 278
   002077         208000     MOVE  "   .0"                TO CORRECT-A.                   NC1264.2 292
   002078         208100     GO   TO    LEV-WRITE-GF-3-12.                                NC1264.2 2081
   002079         208200 LEV-DELETE-GF-3-12.                                              NC1264.2
   002080         208300     PERFORM DE-LETE.                                             NC1264.2 419
   002081         208400 LEV-WRITE-GF-3-12.                                               NC1264.2
   002082         208500     MOVE  "LEV-TEST-GF-3-12" TO PAR-NAME.                        NC1264.2 267
   002083         208600     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002084         208700 LEV-TEST-GF-3-13.                                                NC1264.2
   002085         208800     IF GP-13 EQUAL TO      "  0 400"                             NC1264.2 64
   002086      1  208900              PERFORM PASS                                        NC1264.2 417
   002087      1  209000              GO  TO   LEV-WRITE-GF-3-13.                         NC1264.2 2094
   002088         209100     PERFORM FAIL.                                                NC1264.2 418
   002089         209200     MOVE GP-13 TO COMPUTED-A.                                    NC1264.2 64 278
   002090         209300     MOVE  "  0 400"              TO CORRECT-A.                   NC1264.2 292
   002091         209400     GO   TO    LEV-WRITE-GF-3-13.                                NC1264.2 2094
   002092         209500 LEV-DELETE-GF-3-13.                                              NC1264.2
   002093         209600     PERFORM DE-LETE.                                             NC1264.2 419
   002094         209700 LEV-WRITE-GF-3-13.                                               NC1264.2
   002095         209800     MOVE  "LEV-TEST-GF-3-13" TO PAR-NAME.                        NC1264.2 267
   002096         209900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002097         210000 LEV-TEST-GF-3-14.                                                NC1264.2
   002098         210100     IF GP-14 EQUAL TO      "KLOP"                                NC1264.2 66
   002099      1  210200              PERFORM PASS                                        NC1264.2 417
   002100      1  210300              GO  TO   LEV-WRITE-GF-3-14.                         NC1264.2 2107
   002101         210400     PERFORM FAIL.                                                NC1264.2 418
   002102         210500     MOVE GP-14 TO COMPUTED-A                                     NC1264.2 66 278
   002103         210600     MOVE  "KLOP"                 TO CORRECT-A.                   NC1264.2 292
   002104         210700     GO   TO    LEV-WRITE-GF-3-14.                                NC1264.2 2107
   002105         210800 LEV-DELETE-GF-3-14.                                              NC1264.2
   002106         210900     PERFORM DE-LETE.                                             NC1264.2 419
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107         211000 LEV-WRITE-GF-3-14.                                               NC1264.2
   002108         211100     MOVE  "LEV-TEST-GF-3-14" TO PAR-NAME.                        NC1264.2 267
   002109         211200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002110         211300 LEV-TEST-GF-3-15.                                                NC1264.2
   002111         211400     IF GP-15  EQUAL TO "2345678902"                              NC1264.2 68
   002112      1  211500              PERFORM PASS                                        NC1264.2 417
   002113      1  211600              GO  TO   LEV-WRITE-GF-3-15.                         NC1264.2 2120
   002114         211700     PERFORM FAIL.                                                NC1264.2 418
   002115         211800     MOVE GP-15 TO COMPUTED-A.                                    NC1264.2 68 278
   002116         211900     MOVE  "2345678902"           TO CORRECT-A.                   NC1264.2 292
   002117         212000     GO   TO    LEV-WRITE-GF-3-15.                                NC1264.2 2120
   002118         212100 LEV-DELETE-GF-3-15.                                              NC1264.2
   002119         212200     PERFORM DE-LETE.                                             NC1264.2 419
   002120         212300 LEV-WRITE-GF-3-15.                                               NC1264.2
   002121         212400     MOVE  "LEV-TEST-GF-3-15" TO PAR-NAME.                        NC1264.2 267
   002122         212500     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002123         212600 LEV-TEST-GF-3-16.                                                NC1264.2
   002124         212700     IF GP-16 EQUAL TO  SPACE                                     NC1264.2 70 IMP
   002125      1  212800              PERFORM PASS                                        NC1264.2 417
   002126      1  212900              GO  TO   LEV-WRITE-GF-3-16.                         NC1264.2 2133
   002127         213000     PERFORM FAIL.                                                NC1264.2 418
   002128         213100     MOVE GP-16 TO COMPUTED-A                                     NC1264.2 70 278
   002129         213200     MOVE  "SPACE"                TO CORRECT-A.                   NC1264.2 292
   002130         213300     GO   TO    LEV-WRITE-GF-3-16.                                NC1264.2 2133
   002131         213400 LEV-DELETE-GF-3-16.                                              NC1264.2
   002132         213500     PERFORM DE-LETE.                                             NC1264.2 419
   002133         213600 LEV-WRITE-GF-3-16.                                               NC1264.2
   002134         213700     MOVE  "LEV-TEST-GF-3-16" TO PAR-NAME.                        NC1264.2 267
   002135         213800     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002136         213900 LEV-TEST-GF-3-17.                                                NC1264.2
   002137         214000     IF GP-17 EQUAL TO  "19  702"                                 NC1264.2 72
   002138      1  214100              PERFORM PASS                                        NC1264.2 417
   002139      1  214200              GO  TO   LEV-WRITE-GF-3-17.                         NC1264.2 2146
   002140         214300     PERFORM FAIL.                                                NC1264.2 418
   002141         214400     MOVE GP-17 TO COMPUTED-A.                                    NC1264.2 72 278
   002142         214500     MOVE  "19  702"              TO CORRECT-A.                   NC1264.2 292
   002143         214600     GO   TO    LEV-WRITE-GF-3-17.                                NC1264.2 2146
   002144         214700 LEV-DELETE-GF-3-17.                                              NC1264.2
   002145         214800     PERFORM DE-LETE.                                             NC1264.2 419
   002146         214900 LEV-WRITE-GF-3-17.                                               NC1264.2
   002147         215000     MOVE  "LEV-TEST-GF-3-17" TO PAR-NAME.                        NC1264.2 267
   002148         215100     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002149         215200 LEV-TEST-GF-3-18.                                                NC1264.2
   002150         215300     IF GP-18 EQUAL TO "-***42"                                   NC1264.2 74
   002151      1  215400              PERFORM PASS                                        NC1264.2 417
   002152      1  215500              GO  TO   LEV-WRITE-GF-3-18.                         NC1264.2 2159
   002153         215600     PERFORM FAIL.                                                NC1264.2 418
   002154         215700     MOVE GP-18 TO COMPUTED-A                                     NC1264.2 74 278
   002155         215800     MOVE  "-***42" TO CORRECT-A.                                 NC1264.2 292
   002156         215900     GO   TO    LEV-WRITE-GF-3-18.                                NC1264.2 2159
   002157         216000 LEV-DELETE-GF-3-18.                                              NC1264.2
   002158         216100     PERFORM DE-LETE.                                             NC1264.2 419
   002159         216200 LEV-WRITE-GF-3-18.                                               NC1264.2
   002160         216300     MOVE  "LEV-TEST-GF-3-18" TO PAR-NAME.                        NC1264.2 267
   002161         216400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002162         216500 LEV-TEST-GF-3-19.                                                NC1264.2
   002163         216600     IF GP-19 EQUAL TO       ZERO                                 NC1264.2 76 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002164      1  216700              PERFORM PASS                                        NC1264.2 417
   002165      1  216800              GO  TO   LEV-WRITE-GF-3-19.                         NC1264.2 2172
   002166         216900     PERFORM FAIL.                                                NC1264.2 418
   002167         217000     MOVE GP-19 TO COMPUTED-A.                                    NC1264.2 76 278
   002168         217100     MOVE  "0000000"   TO CORRECT-A.                              NC1264.2 292
   002169         217200     GO   TO    LEV-WRITE-GF-3-19.                                NC1264.2 2172
   002170         217300 LEV-DELETE-GF-3-19.                                              NC1264.2
   002171         217400     PERFORM DE-LETE.                                             NC1264.2 419
   002172         217500 LEV-WRITE-GF-3-19.                                               NC1264.2
   002173         217600     MOVE  "LEV-TEST-GF-3-19" TO PAR-NAME.                        NC1264.2 267
   002174         217700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002175         217800 LEV-TEST-GF-3-20.                                                NC1264.2
   002176         217900     IF GP-20 EQUAL TO      "492  "                               NC1264.2 78
   002177      1  218000              PERFORM PASS                                        NC1264.2 417
   002178      1  218100              GO  TO   LEV-WRITE-GF-3-20.                         NC1264.2 2185
   002179         218200     PERFORM FAIL.                                                NC1264.2 418
   002180         218300     MOVE GP-20 TO COMPUTED-A                                     NC1264.2 78 278
   002181         218400     MOVE  "492  "                TO CORRECT-A.                   NC1264.2 292
   002182         218500     GO   TO    LEV-WRITE-GF-3-20.                                NC1264.2 2185
   002183         218600 LEV-DELETE-GF-3-20.                                              NC1264.2
   002184         218700     PERFORM DE-LETE.                                             NC1264.2 419
   002185         218800 LEV-WRITE-GF-3-20.                                               NC1264.2
   002186         218900     MOVE  "LEV-TEST-GF-3-20" TO PAR-NAME.                        NC1264.2 267
   002187         219000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002188         219100 LEV-TEST-GF-3-21.                                                NC1264.2
   002189         219200     IF GP-21 EQUAL TO       SPACE                                NC1264.2 80 IMP
   002190      1  219300              PERFORM PASS                                        NC1264.2 417
   002191      1  219400              GO  TO   LEV-WRITE-GF-3-21.                         NC1264.2 2198
   002192         219500     PERFORM FAIL.                                                NC1264.2 418
   002193         219600     MOVE GP-20 TO COMPUTED-A                                     NC1264.2 78 278
   002194         219700     MOVE  "SPACE"                TO CORRECT-A.                   NC1264.2 292
   002195         219800     GO   TO    LEV-WRITE-GF-3-21.                                NC1264.2 2198
   002196         219900 LEV-DELETE-GF-3-21.                                              NC1264.2
   002197         220000     PERFORM DE-LETE.                                             NC1264.2 419
   002198         220100 LEV-WRITE-GF-3-21.                                               NC1264.2
   002199         220200     MOVE  "LEV-TEST-GF-3-21" TO PAR-NAME.                        NC1264.2 267
   002200         220300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002201         220400 LEV-TEST-GF-3-22.                                                NC1264.2
   002202         220500     IF GP-22 EQUAL TO   "*040290"                                NC1264.2 82
   002203      1  220600              PERFORM PASS                                        NC1264.2 417
   002204      1  220700              GO  TO   LEV-WRITE-GF-3-22.                         NC1264.2 2211
   002205         220800     PERFORM FAIL                                                 NC1264.2 418
   002206         220900     MOVE GP-22 TO COMPUTED-A                                     NC1264.2 82 278
   002207         221000     MOVE "*040290"               TO CORRECT-A.                   NC1264.2 292
   002208         221100     GO   TO    LEV-WRITE-GF-3-22.                                NC1264.2 2211
   002209         221200 LEV-DELETE-GF-3-22.                                              NC1264.2
   002210         221300     PERFORM DE-LETE.                                             NC1264.2 419
   002211         221400 LEV-WRITE-GF-3-22.                                               NC1264.2
   002212         221500     MOVE  "LEV-TEST-GF-3-22" TO PAR-NAME.                        NC1264.2 267
   002213         221600     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002214         221700 LEV-TEST-GF-3-23.                                                NC1264.2
   002215         221800     IF GP-23 EQUAL TO      "9A8B7C"                              NC1264.2 84
   002216      1  221900              PERFORM PASS                                        NC1264.2 417
   002217      1  222000              GO  TO   LEV-WRITE-GF-3-23.                         NC1264.2 2224
   002218         222100     PERFORM FAIL.                                                NC1264.2 418
   002219         222200     MOVE GP-23 TO COMPUTED-A                                     NC1264.2 84 278
   002220         222300     MOVE  "9A8B7C"               TO CORRECT-A.                   NC1264.2 292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002221         222400     GO   TO    LEV-WRITE-GF-3-23.                                NC1264.2 2224
   002222         222500 LEV-DELETE-GF-3-23.                                              NC1264.2
   002223         222600     PERFORM DE-LETE.                                             NC1264.2 419
   002224         222700 LEV-WRITE-GF-3-23.                                               NC1264.2
   002225         222800     MOVE  "LEV-TEST-GF-3-23" TO PAR-NAME.                        NC1264.2 267
   002226         222900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002227         223000 LEV-TEST-GF-3-24.                                                NC1264.2
   002228         223100     IF GP-24 EQUAL TO      "$40,290.00"                          NC1264.2 86
   002229      1  223200              PERFORM PASS                                        NC1264.2 417
   002230      1  223300              GO  TO   LEV-WRITE-GF-3-24.                         NC1264.2 2237
   002231         223400     PERFORM FAIL.                                                NC1264.2 418
   002232         223500     MOVE GP-24 TO COMPUTED-A                                     NC1264.2 86 278
   002233         223600     MOVE  "$40,290.00"           TO CORRECT-A.                   NC1264.2 292
   002234         223700     GO   TO    LEV-WRITE-GF-3-24.                                NC1264.2 2237
   002235         223800 LEV-DELETE-GF-3-24.                                              NC1264.2
   002236         223900     PERFORM DE-LETE.                                             NC1264.2 419
   002237         224000 LEV-WRITE-GF-3-24.                                               NC1264.2
   002238         224100     MOVE  "LEV-TEST-GF-3-24" TO PAR-NAME.                        NC1264.2 267
   002239         224200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002240         224300 LEV-TEST-GF-3-25.                                                NC1264.2
   002241         224400     IF GP-25 EQUAL TO      "2  8   9   "                         NC1264.2 88
   002242      1  224500              PERFORM PASS                                        NC1264.2 417
   002243      1  224600              GO  TO   LEV-WRITE-GF-3-25.                         NC1264.2 2250
   002244         224700     PERFORM FAIL.                                                NC1264.2 418
   002245         224800     MOVE GP-25 TO COMPUTED-A                                     NC1264.2 88 278
   002246         224900     MOVE  "2  8   9   "          TO CORRECT-A.                   NC1264.2 292
   002247         225000     GO   TO    LEV-WRITE-GF-3-25.                                NC1264.2 2250
   002248         225100 LEV-DELETE-GF-3-25.                                              NC1264.2
   002249         225200     PERFORM DE-LETE.                                             NC1264.2 419
   002250         225300 LEV-WRITE-GF-3-25.                                               NC1264.2
   002251         225400     MOVE  "LEV-TEST-GF-3-25" TO PAR-NAME.                        NC1264.2 267
   002252         225500     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002253         225600 LEV-TEST-GF-3-26.                                                NC1264.2
   002254         225700     IF GP-26 EQUAL TO      "2250001"                             NC1264.2 90
   002255      1  225800              PERFORM PASS                                        NC1264.2 417
   002256      1  225900              GO  TO   LEV-WRITE-GF-3-26.                         NC1264.2 2263
   002257         226000     PERFORM FAIL.                                                NC1264.2 418
   002258         226100     MOVE GP-26 TO COMPUTED-A                                     NC1264.2 90 278
   002259         226200     MOVE  "2250001"              TO CORRECT-A.                   NC1264.2 292
   002260         226300     GO   TO    LEV-WRITE-GF-3-26.                                NC1264.2 2263
   002261         226400 LEV-DELETE-GF-3-26.                                              NC1264.2
   002262         226500     PERFORM DE-LETE.                                             NC1264.2 419
   002263         226600 LEV-WRITE-GF-3-26.                                               NC1264.2
   002264         226700     MOVE  "LEV-TEST-GF-3-26" TO PAR-NAME.                        NC1264.2 267
   002265         226800     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002266         226900 LEV-TEST-GF-3-27.                                                NC1264.2
   002267         227000     IF GP-27 EQUAL TO      "0,001,692"                           NC1264.2 92
   002268      1  227100              PERFORM PASS                                        NC1264.2 417
   002269      1  227200              GO  TO   LEV-WRITE-GF-3-27.                         NC1264.2 2276
   002270         227300     PERFORM FAIL.                                                NC1264.2 418
   002271         227400     MOVE GP-27 TO COMPUTED-A                                     NC1264.2 92 278
   002272         227500     MOVE  "0,001,692"            TO CORRECT-A.                   NC1264.2 292
   002273         227600     GO   TO    LEV-WRITE-GF-3-27.                                NC1264.2 2276
   002274         227700 LEV-DELETE-GF-3-27.                                              NC1264.2
   002275         227800     PERFORM DE-LETE.                                             NC1264.2 419
   002276         227900 LEV-WRITE-GF-3-27.                                               NC1264.2
   002277         228000     MOVE  "LEV-TEST-GF-3-27" TO PAR-NAME.                        NC1264.2 267
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002278         228100     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002279         228200 LEV-TEST-GF-3-28.                                                NC1264.2
   002280         228300     IF GP-28 EQUAL TO      "0000004,1"                           NC1264.2 94
   002281      1  228400              PERFORM PASS                                        NC1264.2 417
   002282      1  228500              GO  TO   LEV-WRITE-GF-3-28.                         NC1264.2 2289
   002283         228600     PERFORM FAIL.                                                NC1264.2 418
   002284         228700     MOVE GP-28 TO COMPUTED-A.                                    NC1264.2 94 278
   002285         228800     MOVE  "0000004,1"            TO CORRECT-A.                   NC1264.2 292
   002286         228900     GO   TO    LEV-WRITE-GF-3-28.                                NC1264.2 2289
   002287         229000 LEV-DELETE-GF-3-28.                                              NC1264.2
   002288         229100     PERFORM DE-LETE.                                             NC1264.2 419
   002289         229200 LEV-WRITE-GF-3-28.                                               NC1264.2
   002290         229300     MOVE  "LEV-TEST-GF-3-28" TO PAR-NAME.                        NC1264.2 267
   002291         229400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002292         229500 LEV-TEST-GF-3-29.                                                NC1264.2
   002293         229600     IF GP-29 EQUAL TO      "$**1.00"                             NC1264.2 96
   002294      1  229700              PERFORM PASS                                        NC1264.2 417
   002295      1  229800              GO  TO   LEV-WRITE-GF-3-29.                         NC1264.2 2302
   002296         229900     PERFORM FAIL.                                                NC1264.2 418
   002297         230000     MOVE GP-29 TO COMPUTED-A                                     NC1264.2 96 278
   002298         230100     MOVE  "$**1.00"              TO CORRECT-A.                   NC1264.2 292
   002299         230200     GO   TO    LEV-WRITE-GF-3-29.                                NC1264.2 2302
   002300         230300 LEV-DELETE-GF-3-29.                                              NC1264.2
   002301         230400     PERFORM DE-LETE.                                             NC1264.2 419
   002302         230500 LEV-WRITE-GF-3-29.                                               NC1264.2
   002303         230600     MOVE  "LEV-TEST-GF-3-29" TO PAR-NAME.                        NC1264.2 267
   002304         230700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002305         230800 LEV-TEST-GF-3-30.                                                NC1264.2
   002306         230900     IF GP-30 EQUAL TO      ZERO                                  NC1264.2 98 IMP
   002307      1  231000              PERFORM PASS                                        NC1264.2 417
   002308      1  231100              GO  TO   LEV-WRITE-GF-3-30.                         NC1264.2 2315
   002309         231200     PERFORM FAIL.                                                NC1264.2 418
   002310         231300     MOVE GP-30 TO COMPUTED-A                                     NC1264.2 98 278
   002311         231400     MOVE  "000000000000000"      TO CORRECT-A.                   NC1264.2 292
   002312         231500     GO   TO    LEV-WRITE-GF-3-30.                                NC1264.2 2315
   002313         231600 LEV-DELETE-GF-3-30.                                              NC1264.2
   002314         231700     PERFORM DE-LETE.                                             NC1264.2 419
   002315         231800 LEV-WRITE-GF-3-30.                                               NC1264.2
   002316         231900     MOVE  "LEV-TEST-GF-3-30" TO PAR-NAME.                        NC1264.2 267
   002317         232000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002318         232100 LEV-TEST-GF-3-31.                                                NC1264.2
   002319         232200     IF GP-31  EQUAL TO ZERO                                      NC1264.2 100 IMP
   002320      1  232300              PERFORM PASS                                        NC1264.2 417
   002321      1  232400              GO  TO   LEV-WRITE-GF-3-31.                         NC1264.2 2328
   002322         232500     PERFORM FAIL.                                                NC1264.2 418
   002323         232600     MOVE GP-31 TO COMPUTED-A                                     NC1264.2 100 278
   002324         232700     MOVE  "SPACE"                TO CORRECT-A.                   NC1264.2 292
   002325         232800     GO   TO    LEV-WRITE-GF-3-31.                                NC1264.2 2328
   002326         232900 LEV-DELETE-GF-3-31.                                              NC1264.2
   002327         233000     PERFORM DE-LETE.                                             NC1264.2 419
   002328         233100 LEV-WRITE-GF-3-31.                                               NC1264.2
   002329         233200     MOVE  "LEV-TEST-GF-3-31" TO PAR-NAME.                        NC1264.2 267
   002330         233300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002331         233400 LEV-TEST-GF-3-32.                                                NC1264.2
   002332         233500     IF GP-32 EQUAL TO      "*00"                                 NC1264.2 102
   002333      1  233600              PERFORM PASS                                        NC1264.2 417
   002334      1  233700              GO  TO   LEV-WRITE-GF-3-32.                         NC1264.2 2341
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002335         233800     PERFORM FAIL.                                                NC1264.2 418
   002336         233900     MOVE GP-32 TO COMPUTED-A                                     NC1264.2 102 278
   002337         234000     MOVE  "*00"                  TO CORRECT-A.                   NC1264.2 292
   002338         234100     GO   TO    LEV-WRITE-GF-3-32.                                NC1264.2 2341
   002339         234200 LEV-DELETE-GF-3-32.                                              NC1264.2
   002340         234300     PERFORM DE-LETE.                                             NC1264.2 419
   002341         234400 LEV-WRITE-GF-3-32.                                               NC1264.2
   002342         234500     MOVE  "LEV-TEST-GF-3-32" TO PAR-NAME.                        NC1264.2 267
   002343         234600     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002344         234700 LEV-TEST-GF-3-33.                                                NC1264.2
   002345         234800     IF GP-33 EQUAL TO      "   0"                                NC1264.2 104
   002346      1  234900              PERFORM PASS                                        NC1264.2 417
   002347      1  235000              GO  TO   LEV-WRITE-GF-3-33.                         NC1264.2 2354
   002348         235100     PERFORM FAIL.                                                NC1264.2 418
   002349         235200     MOVE GP-33 TO COMPUTED-A                                     NC1264.2 104 278
   002350         235300     MOVE  "   0"                 TO CORRECT-A.                   NC1264.2 292
   002351         235400     GO   TO    LEV-WRITE-GF-3-33.                                NC1264.2 2354
   002352         235500 LEV-DELETE-GF-3-33.                                              NC1264.2
   002353         235600     PERFORM DE-LETE.                                             NC1264.2 419
   002354         235700 LEV-WRITE-GF-3-33.                                               NC1264.2
   002355         235800     MOVE  "LEV-TEST-GF-3-33" TO PAR-NAME.                        NC1264.2 267
   002356         235900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002357         236000 LEV-TEST-GF-3-34.                                                NC1264.2
   002358         236100     IF GP-34 EQUAL TO      "  2  1"                              NC1264.2 106
   002359      1  236200              PERFORM PASS                                        NC1264.2 417
   002360      1  236300              GO  TO   LEV-WRITE-GF-3-34.                         NC1264.2 2367
   002361         236400     PERFORM FAIL.                                                NC1264.2 418
   002362         236500     MOVE GP-34 TO COMPUTED-A.                                    NC1264.2 106 278
   002363         236600     MOVE  "  2  1"               TO CORRECT-A.                   NC1264.2 292
   002364         236700     GO   TO    LEV-WRITE-GF-3-34.                                NC1264.2 2367
   002365         236800 LEV-DELETE-GF-3-34.                                              NC1264.2
   002366         236900     PERFORM DE-LETE.                                             NC1264.2 419
   002367         237000 LEV-WRITE-GF-3-34.                                               NC1264.2
   002368         237100     MOVE  "LEV-TEST-GF-3-34" TO PAR-NAME.                        NC1264.2 267
   002369         237200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002370         237300 LEV-TEST-GF-3-35.                                                NC1264.2
   002371         237400     IF GP-35 EQUAL TO      "$00,036.00"                          NC1264.2 108
   002372      1  237500              PERFORM PASS                                        NC1264.2 417
   002373      1  237600              GO  TO   LEV-WRITE-GF-3-35.                         NC1264.2 2380
   002374         237700     PERFORM FAIL.                                                NC1264.2 418
   002375         237800     MOVE GP-35 TO COMPUTED-A.                                    NC1264.2 108 278
   002376         237900     MOVE  "$00,036.00"           TO CORRECT-A.                   NC1264.2 292
   002377         238000     GO   TO    LEV-WRITE-GF-3-35.                                NC1264.2 2380
   002378         238100 LEV-DELETE-GF-3-35.                                              NC1264.2
   002379         238200     PERFORM DE-LETE.                                             NC1264.2 419
   002380         238300 LEV-WRITE-GF-3-35.                                               NC1264.2
   002381         238400     MOVE  "LEV-TEST-GF-3-35" TO PAR-NAME.                        NC1264.2 267
   002382         238500     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002383         238600 LEV-TEST-GF-3-36.                                                NC1264.2
   002384         238700     IF GP-36 EQUAL TO      "090108"                              NC1264.2 110
   002385      1  238800              PERFORM PASS                                        NC1264.2 417
   002386      1  238900              GO  TO   LEV-WRITE-GF-3-36.                         NC1264.2 2393
   002387         239000     PERFORM FAIL.                                                NC1264.2 418
   002388         239100     MOVE GP-36 TO COMPUTED-A                                     NC1264.2 110 278
   002389         239200     MOVE  "090108"               TO CORRECT-A.                   NC1264.2 292
   002390         239300     GO   TO    LEV-WRITE-GF-3-36.                                NC1264.2 2393
   002391         239400 LEV-DELETE-GF-3-36.                                              NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    45
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002392         239500     PERFORM DE-LETE.                                             NC1264.2 419
   002393         239600 LEV-WRITE-GF-3-36.                                               NC1264.2
   002394         239700     MOVE  "LEV-TEST-GF-3-36" TO PAR-NAME.                        NC1264.2 267
   002395         239800     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002396         239900 LEV-TEST-GF-3-37.                                                NC1264.2
   002397         240000     IF GP-37 EQUAL TO       SPACE                                NC1264.2 112 IMP
   002398      1  240100              PERFORM PASS                                        NC1264.2 417
   002399      1  240200              GO  TO   LEV-WRITE-GF-3-37.                         NC1264.2 2406
   002400         240300     PERFORM FAIL.                                                NC1264.2 418
   002401         240400     MOVE GP-37 TO COMPUTED-A                                     NC1264.2 112 278
   002402         240500     MOVE  "SPACE"                TO CORRECT-A.                   NC1264.2 292
   002403         240600     GO   TO    LEV-WRITE-GF-3-37.                                NC1264.2 2406
   002404         240700 LEV-DELETE-GF-3-37.                                              NC1264.2
   002405         240800     PERFORM DE-LETE.                                             NC1264.2 419
   002406         240900 LEV-WRITE-GF-3-37.                                               NC1264.2
   002407         241000     MOVE  "LEV-TEST-GF-3-37" TO PAR-NAME.                        NC1264.2 267
   002408         241100     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002409         241200 LEV-TEST-GF-3-38.                                                NC1264.2
   002410         241300     IF GP-38 EQUAL TO      "-36"                                 NC1264.2 114
   002411      1  241400              PERFORM PASS                                        NC1264.2 417
   002412      1  241500              GO  TO   LEV-WRITE-GF-3-38.                         NC1264.2 2419
   002413         241600     PERFORM FAIL.                                                NC1264.2 418
   002414         241700     MOVE GP-38 TO COMPUTED-A                                     NC1264.2 114 278
   002415         241800     MOVE  "-36"                  TO CORRECT-A.                   NC1264.2 292
   002416         241900     GO   TO    LEV-WRITE-GF-3-38.                                NC1264.2 2419
   002417         242000 LEV-DELETE-GF-3-38.                                              NC1264.2
   002418         242100     PERFORM DE-LETE.                                             NC1264.2 419
   002419         242200 LEV-WRITE-GF-3-38.                                               NC1264.2
   002420         242300     MOVE  "LEV-TEST-GF-3-38" TO PAR-NAME.                        NC1264.2 267
   002421         242400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002422         242500 LEV-TEST-GF-3-39.                                                NC1264.2
   002423         242600     IF GP-39 EQUAL TO      " 24"                                 NC1264.2 116
   002424      1  242700              PERFORM PASS                                        NC1264.2 417
   002425      1  242800              GO  TO   LEV-WRITE-GF-3-39.                         NC1264.2 2432
   002426         242900              PERFORM FAIL.                                       NC1264.2 418
   002427         243000     MOVE GP-39 TO COMPUTED-A                                     NC1264.2 116 278
   002428         243100     MOVE  " 24"                  TO CORRECT-A.                   NC1264.2 292
   002429         243200     GO   TO    LEV-WRITE-GF-3-39.                                NC1264.2 2432
   002430         243300 LEV-DELETE-GF-3-39.                                              NC1264.2
   002431         243400     PERFORM DE-LETE.                                             NC1264.2 419
   002432         243500 LEV-WRITE-GF-3-39.                                               NC1264.2
   002433         243600     MOVE  "LEV-TEST-GF-3-39" TO PAR-NAME.                        NC1264.2 267
   002434         243700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002435         243800 LEV-TEST-GF-3-40.                                                NC1264.2
   002436         243900     IF GP-40 EQUAL TO      "36  "                                NC1264.2 118
   002437      1  244000              PERFORM PASS                                        NC1264.2 417
   002438      1  244100              GO  TO   LEV-WRITE-GF-3-40.                         NC1264.2 2445
   002439         244200     PERFORM FAIL.                                                NC1264.2 418
   002440         244300     MOVE GP-40 TO COMPUTED-A                                     NC1264.2 118 278
   002441         244400     MOVE  "36  "                 TO CORRECT-A.                   NC1264.2 292
   002442         244500     GO   TO    LEV-WRITE-GF-3-40.                                NC1264.2 2445
   002443         244600 LEV-DELETE-GF-3-40.                                              NC1264.2
   002444         244700     PERFORM DE-LETE.                                             NC1264.2 419
   002445         244800 LEV-WRITE-GF-3-40.                                               NC1264.2
   002446         244900     MOVE  "LEV-TEST-GF-3-40" TO PAR-NAME.                        NC1264.2 267
   002447         245000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002448         245100 LEV-TEST-GF-3-41.                                                NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    46
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002449         245200     IF GP-41 EQUAL TO      "01DB"                                NC1264.2 120
   002450      1  245300              PERFORM PASS                                        NC1264.2 417
   002451      1  245400              GO  TO   LEV-WRITE-GF-3-41.                         NC1264.2 2458
   002452         245500     PERFORM FAIL.                                                NC1264.2 418
   002453         245600     MOVE GP-41 TO COMPUTED-A                                     NC1264.2 120 278
   002454         245700     MOVE  "01DB"                 TO CORRECT-A.                   NC1264.2 292
   002455         245800     GO   TO    LEV-WRITE-GF-3-41.                                NC1264.2 2458
   002456         245900 LEV-DELETE-GF-3-41.                                              NC1264.2
   002457         246000     PERFORM DE-LETE.                                             NC1264.2 419
   002458         246100 LEV-WRITE-GF-3-41.                                               NC1264.2
   002459         246200     MOVE  "LEV-TEST-GF-3-41" TO PAR-NAME.                        NC1264.2 267
   002460         246300     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002461         246400 LEV-TEST-GF-3-42.                                                NC1264.2
   002462         246500     IF GP-42 EQUAL TO "****"                                     NC1264.2 122
   002463      1  246600              PERFORM PASS                                        NC1264.2 417
   002464      1  246700              GO  TO   LEV-WRITE-GF-3-42.                         NC1264.2 2471
   002465         246800     PERFORM FAIL.                                                NC1264.2 418
   002466         246900     MOVE GP-42       TO COMPUTED-A.                              NC1264.2 122 278
   002467         247000     MOVE "****"  TO CORRECT-A.                                   NC1264.2 292
   002468         247100     GO   TO    LEV-WRITE-GF-3-42.                                NC1264.2 2471
   002469         247200 LEV-DELETE-GF-3-42.                                              NC1264.2
   002470         247300     PERFORM DE-LETE.                                             NC1264.2 419
   002471         247400 LEV-WRITE-GF-3-42.                                               NC1264.2
   002472         247500     MOVE  "LEV-TEST-GF-3-42" TO PAR-NAME.                        NC1264.2 267
   002473         247600     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002474         247700 LEV-TEST-GF-3-43.                                                NC1264.2
   002475         247800     IF GP-43 EQUAL TO      "AIR"                                 NC1264.2 124
   002476      1  247900              PERFORM PASS                                        NC1264.2 417
   002477      1  248000              GO  TO   LEV-WRITE-GF-3-43.                         NC1264.2 2484
   002478         248100     PERFORM FAIL.                                                NC1264.2 418
   002479         248200     MOVE GP-43 TO COMPUTED-A                                     NC1264.2 124 278
   002480         248300     MOVE  "AIR"                  TO CORRECT-A.                   NC1264.2 292
   002481         248400     GO   TO    LEV-WRITE-GF-3-43.                                NC1264.2 2484
   002482         248500 LEV-DELETE-GF-3-43.                                              NC1264.2
   002483         248600     PERFORM DE-LETE.                                             NC1264.2 419
   002484         248700 LEV-WRITE-GF-3-43.                                               NC1264.2
   002485         248800     MOVE  "LEV-TEST-GF-3-43" TO PAR-NAME.                        NC1264.2 267
   002486         248900     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002487         249000 LEV-TEST-GF-3-44.                                                NC1264.2
   002488         249100     IF GP-44 EQUAL TO      "9ZX"                                 NC1264.2 126
   002489      1  249200              PERFORM PASS                                        NC1264.2 417
   002490      1  249300              GO  TO   LEV-WRITE-GF-3-44.                         NC1264.2 2497
   002491         249400     PERFORM FAIL.                                                NC1264.2 418
   002492         249500     MOVE GP-44 TO COMPUTED-A                                     NC1264.2 126 278
   002493         249600     MOVE  "9ZX"                  TO CORRECT-A.                   NC1264.2 292
   002494         249700     GO   TO    LEV-WRITE-GF-3-44.                                NC1264.2 2497
   002495         249800 LEV-DELETE-GF-3-44.                                              NC1264.2
   002496         249900     PERFORM DE-LETE.                                             NC1264.2 419
   002497         250000 LEV-WRITE-GF-3-44.                                               NC1264.2
   002498         250100     MOVE  "LEV-TEST-GF-3-44" TO PAR-NAME.                        NC1264.2 267
   002499         250200     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002500         250300 LEV-TEST-GF-3-45.                                                NC1264.2
   002501         250400     IF GP-45 EQUAL TO       "*1000"                              NC1264.2 128
   002502      1  250500              PERFORM PASS                                        NC1264.2 417
   002503      1  250600              GO  TO   LEV-WRITE-GF-3-45.                         NC1264.2 2510
   002504         250700     PERFORM FAIL.                                                NC1264.2 418
   002505         250800     MOVE GP-45 TO COMPUTED-A                                     NC1264.2 128 278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    47
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002506         250900     MOVE  "*1000"                TO CORRECT-A.                   NC1264.2 292
   002507         251000     GO   TO    LEV-WRITE-GF-3-45.                                NC1264.2 2510
   002508         251100 LEV-DELETE-GF-3-45.                                              NC1264.2
   002509         251200     PERFORM DE-LETE.                                             NC1264.2 419
   002510         251300 LEV-WRITE-GF-3-45.                                               NC1264.2
   002511         251400     MOVE  "LEV-TEST-GF-3-45" TO PAR-NAME.                        NC1264.2 267
   002512         251500     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002513         251600 LEV-TEST-GF-3-46.                                                NC1264.2
   002514         251700     IF GP-46 EQUAL TO      "0000000093.00"                       NC1264.2 130
   002515      1  251800              PERFORM PASS                                        NC1264.2 417
   002516      1  251900              GO  TO   LEV-WRITE-GF-3-46.                         NC1264.2 2523
   002517         252000     PERFORM FAIL.                                                NC1264.2 418
   002518         252100     MOVE GP-46 TO COMPUTED-A                                     NC1264.2 130 278
   002519         252200     MOVE  "0000000093.00"        TO CORRECT-A.                   NC1264.2 292
   002520         252300     GO   TO    LEV-WRITE-GF-3-46.                                NC1264.2 2523
   002521         252400 LEV-DELETE-GF-3-46.                                              NC1264.2
   002522         252500     PERFORM DE-LETE.                                             NC1264.2 419
   002523         252600 LEV-WRITE-GF-3-46.                                               NC1264.2
   002524         252700     MOVE  "LEV-TEST-GF-3-46" TO PAR-NAME.                        NC1264.2 267
   002525         252800     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002526         252900 LEV-TEST-GF-3-47.                                                NC1264.2
   002527         253000     IF GP-47 (1) EQUAL TO "5"                                    NC1264.2 132
   002528      1  253100              PERFORM PASS                                        NC1264.2 417
   002529      1  253200              GO  TO   LEV-WRITE-GF-3-47.                         NC1264.2 2536
   002530         253300     PERFORM FAIL.                                                NC1264.2 418
   002531         253400     MOVE GP-47 (1)   TO COMPUTED-A.                              NC1264.2 132 278
   002532         253500     MOVE  "5"                    TO CORRECT-A.                   NC1264.2 292
   002533         253600     GO   TO    LEV-WRITE-GF-3-47.                                NC1264.2 2536
   002534         253700 LEV-DELETE-GF-3-47.                                              NC1264.2
   002535         253800     PERFORM DE-LETE.                                             NC1264.2 419
   002536         253900 LEV-WRITE-GF-3-47.                                               NC1264.2
   002537         254000     MOVE  "LEV-TEST-GF-3-47" TO PAR-NAME.                        NC1264.2 267
   002538         254100     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002539         254200 LEV-TEST-GF-3-48.                                                NC1264.2
   002540         254300     IF GP-47 (2) EQUAL TO ZERO                                   NC1264.2 132 IMP
   002541      1  254400              PERFORM PASS                                        NC1264.2 417
   002542      1  254500              GO  TO   LEV-WRITE-GF-3-48.                         NC1264.2 2549
   002543         254600     PERFORM FAIL.                                                NC1264.2 418
   002544         254700     MOVE GP-47 (2) TO COMPUTED-A.                                NC1264.2 132 278
   002545         254800     MOVE   ZERO TO  CORRECT-A.                                   NC1264.2 IMP 292
   002546         254900     GO   TO    LEV-WRITE-GF-3-48.                                NC1264.2 2549
   002547         255000 LEV-DELETE-GF-3-48.                                              NC1264.2
   002548         255100     PERFORM DE-LETE.                                             NC1264.2 419
   002549         255200 LEV-WRITE-GF-3-48.                                               NC1264.2
   002550         255300     MOVE  "LEV-TEST-GF-3-48" TO PAR-NAME.                        NC1264.2 267
   002551         255400     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002552         255500 LEV-TEST-GF-3-49.                                                NC1264.2
   002553         255600     IF GP-48 (1) EQUAL TO "Y"                                    NC1264.2 134
   002554      1  255700              PERFORM PASS                                        NC1264.2 417
   002555      1  255800              GO TO LEV-WRITE-GF-3-49.                            NC1264.2 2562
   002556         255900     PERFORM FAIL.                                                NC1264.2 418
   002557         256000     MOVE GP-48 (1)   TO COMPUTED-A.                              NC1264.2 134 278
   002558         256100     MOVE  "Y"                    TO CORRECT-A.                   NC1264.2 292
   002559         256200     GO TO LEV-WRITE-GF-3-49.                                     NC1264.2 2562
   002560         256300 LEV-DELETE-GF-3-49.                                              NC1264.2
   002561         256400     PERFORM DE-LETE.                                             NC1264.2 419
   002562         256500 LEV-WRITE-GF-3-49.                                               NC1264.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    48
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002563         256600     MOVE "LEV-TEST-GF-3-49"  TO PAR-NAME.                        NC1264.2 267
   002564         256700     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002565         256800 LEV-TEST-GF-3-50.                                                NC1264.2
   002566         256900     IF GP-48 (2) EQUAL TO " "                                    NC1264.2 134
   002567      1  257000              PERFORM PASS                                        NC1264.2 417
   002568      1  257100              GO TO LEV-WRITE-GF-3-50.                            NC1264.2 2575
   002569         257200     PERFORM FAIL.                                                NC1264.2 418
   002570         257300     MOVE GP-48 (2) TO COMPUTED-A.                                NC1264.2 134 278
   002571         257400     MOVE " "    TO CORRECT-A.                                    NC1264.2 292
   002572         257500     GO TO LEV-WRITE-GF-3-50.                                     NC1264.2 2575
   002573         257600 LEV-DELETE-GF-3-50.                                              NC1264.2
   002574         257700     PERFORM DE-LETE.                                             NC1264.2 419
   002575         257800 LEV-WRITE-GF-3-50.                                               NC1264.2
   002576         257900     MOVE "LEV-TEST-GF-3-50"  TO PAR-NAME.                        NC1264.2 267
   002577         258000     PERFORM PRINT-DETAIL.                                        NC1264.2 421
   002578         258100     GO TO    CCVS-EXIT.                                          NC1264.2 2631
   002579         258200 BREAKDOWN-PARA.                                                  NC1264.2
   002580         258300     PERFORM  FAIL.                                               NC1264.2 418
   002581         258400     MOVE     CM-20  TO COMPUTED-A.                               NC1264.2 240 278
   002582         258500     MOVE     CR-20  TO CORRECT-A.                                NC1264.2 251 292
   002583         258600     MOVE     " 1ST 20 POSITIONS OF RESULTS" TO RE-MARK.          NC1264.2 272
   002584         258700     IF       LENGTH-COUNTER LESS THAN  21 GO TO BREAKDOWN-EXIT.  NC1264.2 238 2629
   002585         258800     PERFORM  PRINT-DETAIL.                                       NC1264.2 421
   002586         258900     MOVE     CM-40  TO COMPUTED-A.                               NC1264.2 241 278
   002587         259000     MOVE     CR-40  TO CORRECT-A.                                NC1264.2 252 292
   002588         259100     MOVE     " 2ND 20 POSITIONS OF RESULTS" TO RE-MARK.          NC1264.2 272
   002589         259200     IF       LENGTH-COUNTER LESS THAN  41 GO TO BREAKDOWN-EXIT.  NC1264.2 238 2629
   002590         259300     PERFORM  PRINT-DETAIL.                                       NC1264.2 421
   002591         259400     MOVE     CM-60  TO COMPUTED-A.                               NC1264.2 242 278
   002592         259500     MOVE     CR-60  TO CORRECT-A.                                NC1264.2 253 292
   002593         259600     MOVE     " 3RD 20 POSITIONS OF RESULTS" TO RE-MARK.          NC1264.2 272
   002594         259700     IF       LENGTH-COUNTER LESS THAN  61 GO TO BREAKDOWN-EXIT.  NC1264.2 238 2629
   002595         259800     PERFORM  PRINT-DETAIL.                                       NC1264.2 421
   002596         259900     MOVE     CM-80  TO COMPUTED-A.                               NC1264.2 243 278
   002597         260000     MOVE     CR-80  TO CORRECT-A.                                NC1264.2 254 292
   002598         260100     MOVE     " 4TH 20 POSITIONS OF RESULTS" TO RE-MARK.          NC1264.2 272
   002599         260200     IF       LENGTH-COUNTER LESS THAN  81 GO TO BREAKDOWN-EXIT.  NC1264.2 238 2629
   002600         260300     PERFORM  PRINT-DETAIL.                                       NC1264.2 421
   002601         260400     MOVE     CM-100 TO COMPUTED-A.                               NC1264.2 244 278
   002602         260500     MOVE     CR-100 TO CORRECT-A.                                NC1264.2 255 292
   002603         260600     MOVE     " 5TH 20 POSITIONS OF RESULTS" TO RE-MARK.          NC1264.2 272
   002604         260700     IF       LENGTH-COUNTER LESS THAN 101 GO TO BREAKDOWN-EXIT.  NC1264.2 238 2629
   002605         260800     PERFORM  PRINT-DETAIL.                                       NC1264.2 421
   002606         260900     MOVE     CM-120 TO COMPUTED-A.                               NC1264.2 245 278
   002607         261000     MOVE     CR-120 TO CORRECT-A.                                NC1264.2 256 292
   002608         261100     MOVE     " 6TH 20 POSITIONS OF RESULTS" TO RE-MARK.          NC1264.2 272
   002609         261200     IF       LENGTH-COUNTER LESS THAN 121 GO TO BREAKDOWN-EXIT.  NC1264.2 238 2629
   002610         261300     PERFORM  PRINT-DETAIL.                                       NC1264.2 421
   002611         261400     MOVE     CM-140 TO COMPUTED-A.                               NC1264.2 246 278
   002612         261500     MOVE     CR-140 TO CORRECT-A.                                NC1264.2 257 292
   002613         261600     MOVE     " 7TH 20 POSITIONS OF RESULTS" TO RE-MARK.          NC1264.2 272
   002614         261700     IF       LENGTH-COUNTER LESS THAN 141 GO TO BREAKDOWN-EXIT.  NC1264.2 238 2629
   002615         261800     PERFORM  PRINT-DETAIL.                                       NC1264.2 421
   002616         261900     MOVE     CM-160 TO COMPUTED-A.                               NC1264.2 247 278
   002617         262000     MOVE     CR-160 TO CORRECT-A.                                NC1264.2 258 292
   002618         262100     MOVE     " 8TH 20 POSITIONS OF RESULTS" TO RE-MARK.          NC1264.2 272
   002619         262200     IF       LENGTH-COUNTER LESS THAN 161 GO TO BREAKDOWN-EXIT.  NC1264.2 238 2629
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    49
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002620         262300     PERFORM  PRINT-DETAIL.                                       NC1264.2 421
   002621         262400     MOVE     CM-180 TO COMPUTED-A.                               NC1264.2 248 278
   002622         262500     MOVE     CR-180 TO CORRECT-A.                                NC1264.2 259 292
   002623         262600     MOVE     " 9TH 20 POSITIONS OF RESULTS" TO RE-MARK.          NC1264.2 272
   002624         262700     IF       LENGTH-COUNTER LESS THAN 181 GO TO BREAKDOWN-EXIT.  NC1264.2 238 2629
   002625         262800     PERFORM  PRINT-DETAIL.                                       NC1264.2 421
   002626         262900     MOVE     CM-200 TO COMPUTED-A.                               NC1264.2 249 278
   002627         263000     MOVE     CR-200 TO CORRECT-A.                                NC1264.2 260 292
   002628         263100     MOVE     "10TH 20 POSITIONS OF RESULTS" TO RE-MARK.          NC1264.2 272
   002629         263200 BREAKDOWN-EXIT.                                                  NC1264.2
   002630         263300     MOVE     ZERO TO LENGTH-COUNTER.                             NC1264.2 IMP 238
   002631         263400 CCVS-EXIT SECTION.                                               NC1264.2
   002632         263500 CCVS-999999.                                                     NC1264.2
   002633         263600     GO TO CLOSE-FILES.                                           NC1264.2 410
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    50
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      232   A-PART-98. . . . . . . . . . .  M1242
      323   ANSI-REFERENCE . . . . . . . .  500 507 516 M524 M1236 M1873
      233   B-PART-98. . . . . . . . . . .  M1243
      237   BREAKDOWN-RECORD
      234   C-PART-98. . . . . . . . . . .  M1244
      302   CCVS-C-1 . . . . . . . . . . .  439 485
      307   CCVS-C-2 . . . . . . . . . . .  440 486
      357   CCVS-E-1 . . . . . . . . . . .  445
      362   CCVS-E-2 . . . . . . . . . . .  454 461 468 473
      365   CCVS-E-2-2 . . . . . . . . . .  M453
      370   CCVS-E-3 . . . . . . . . . . .  474
      379   CCVS-E-4 . . . . . . . . . . .  453
      380   CCVS-E-4-1 . . . . . . . . . .  M451
      382   CCVS-E-4-2 . . . . . . . . . .  M452
      324   CCVS-H-1 . . . . . . . . . . .  434 481
      329   CCVS-H-2A. . . . . . . . . . .  435 482
      338   CCVS-H-2B. . . . . . . . . . .  436 483
      350   CCVS-H-3 . . . . . . . . . . .  437 484
      400   CCVS-PGM-ID. . . . . . . . . .  406 406
      244   CM-100 . . . . . . . . . . . .  2601
      245   CM-120 . . . . . . . . . . . .  2606
      246   CM-140 . . . . . . . . . . . .  2611
      247   CM-160 . . . . . . . . . . . .  2616
      284   CM-18V0
      248   CM-180 . . . . . . . . . . . .  2621
      240   CM-20. . . . . . . . . . . . .  2581
      249   CM-200 . . . . . . . . . . . .  2626
      241   CM-40. . . . . . . . . . . . .  2586
      242   CM-60. . . . . . . . . . . . .  2591
      243   CM-80. . . . . . . . . . . . .  2596
      278   COMPUTED-A . . . . . . . . . .  279 281 282 283 284 512 515 M1253 M1266 M1279 M1292 M1305 M1318 M1331 M1344 M1357
                                            M1370 M1383 M1396 M1409 M1422 M1435 M1448 M1461 M1474 M1487 M1500 M1513 M1526
                                            M1539 M1552 M1565 M1578 M1591 M1604 M1617 M1630 M1643 M1656 M1669 M1682 M1695
                                            M1708 M1721 M1734 M1747 M1760 M1773 M1786 M1799 M1812 M1825 M1838 M1851 M1864
                                            M1934 M1947 M1960 M1973 M1986 M1999 M2012 M2037 M2050 M2063 M2076 M2089 M2102
                                            M2115 M2128 M2141 M2154 M2167 M2180 M2193 M2206 M2219 M2232 M2245 M2258 M2271
                                            M2284 M2297 M2310 M2323 M2336 M2349 M2362 M2375 M2388 M2401 M2414 M2427 M2440
                                            M2453 M2466 M2479 M2492 M2505 M2518 M2531 M2544 M2557 M2570 M2581 M2586 M2591
                                            M2596 M2601 M2606 M2611 M2616 M2621 M2626
      239   COMPUTED-BREAKDOWN . . . . . .  M534 M549 M564 M579 M594 M609 M624 M639 M654 M669 M684 M699 M714 M729 M744 M759
                                            M774 M789 M804 M819 M834 M849 M864 M879 M894 M909 M924 M939 M954 M969 M984 M999
                                            M1014 M1029 M1044 M1059 M1074 M1089 M1104 M1119 M1134 M1149 M1164 M1179 M1194
                                            M1209 M1224
      279   COMPUTED-N
      277   COMPUTED-X . . . . . . . . . .  M429 497
      281   COMPUTED-0V18
      283   COMPUTED-14V4
      285   COMPUTED-18V0
      282   COMPUTED-4V14
      301   COR-ANSI-REFERENCE . . . . . .  M507 M509
      292   CORRECT-A. . . . . . . . . . .  293 294 295 296 297 513 515 M1254 M1267 M1280 M1293 M1306 M1319 M1332 M1345 M1358
                                            M1371 M1384 M1397 M1410 M1423 M1436 M1449 M1462 M1475 M1488 M1501 M1514 M1527
                                            M1540 M1553 M1566 M1579 M1592 M1605 M1618 M1631 M1644 M1657 M1670 M1683 M1696
                                            M1709 M1722 M1735 M1748 M1761 M1774 M1787 M1800 M1813 M1826 M1839 M1852 M1865
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    51
0 Defined   Cross-reference of data names   References

0                                           M1935 M1948 M1961 M1974 M1987 M2000 M2013 M2025 M2038 M2051 M2064 M2077 M2090
                                            M2103 M2116 M2129 M2142 M2155 M2168 M2181 M2194 M2207 M2220 M2233 M2246 M2259
                                            M2272 M2285 M2298 M2311 M2324 M2337 M2350 M2363 M2376 M2389 M2402 M2415 M2428
                                            M2441 M2454 M2467 M2480 M2493 M2506 M2519 M2532 M2545 M2558 M2571 M2582 M2587
                                            M2592 M2597 M2602 M2607 M2612 M2617 M2622 M2627
      250   CORRECT-BREAKDOWN. . . . . . .  M535 M550 M565 M580 M595 M610 M625 M640 M655 M670 M685 M700 M715 M730 M745 M760
                                            M775 M790 M805 M820 M835 M850 M865 M880 M895 M910 M925 M940 M955 M970 M985 M1000
                                            M1015 M1030 M1045 M1060 M1075 M1090 M1105 M1120 M1135 M1150 M1165 M1180 M1195
                                            M1210 M1225
      293   CORRECT-N
      291   CORRECT-X. . . . . . . . . . .  M430 499
      294   CORRECT-0V18
      296   CORRECT-14V4
      298   CORRECT-18V0
      295   CORRECT-4V14
      255   CR-100 . . . . . . . . . . . .  2602
      256   CR-120 . . . . . . . . . . . .  2607
      257   CR-140 . . . . . . . . . . . .  2612
      258   CR-160 . . . . . . . . . . . .  2617
      297   CR-18V0
      259   CR-180 . . . . . . . . . . . .  2622
      251   CR-20. . . . . . . . . . . . .  2582
      260   CR-200 . . . . . . . . . . . .  2627
      252   CR-40. . . . . . . . . . . . .  2587
      253   CR-60. . . . . . . . . . . . .  2592
      254   CR-80. . . . . . . . . . . . .  2597
      235   D-PART-98. . . . . . . . . . .  M1245
      315   DELETE-COUNTER . . . . . . . .  M419 448 464 466
      270   DOTVALUE . . . . . . . . . . .  M424
      321   DUMMY-HOLD . . . . . . . . . .  M478 488
       37   DUMMY-RECORD . . . . . . . . .  M434 M435 M436 M437 M439 M440 M441 M443 M445 M454 M461 M468 M473 M474 478 M479
                                            480 M481 M482 M483 M484 M485 M486 M487 M488 492 M493 M502 M517
      236   E-PART-98. . . . . . . . . . .  M1246
      368   ENDER-DESC . . . . . . . . . .  M456 M467 M472
      316   ERROR-COUNTER. . . . . . . . .  M418 447 457 460
      320   ERROR-HOLD . . . . . . . . . .  M447 M448 M448 M449 452
      366   ERROR-TOTAL. . . . . . . . . .  M458 M460 M465 M466 M470 M471
      263   FEATURE. . . . . . . . . . . .  M525 M527 M1239 M1241 M1876 M1878
       40   GP-1 . . . . . . . . . . . . .  M1879 1930 1934
       58   GP-10. . . . . . . . . . . . .  M1888 2046 2050
       60   GP-11. . . . . . . . . . . . .  M1889 2059 2063
       62   GP-12. . . . . . . . . . . . .  M1890 2072 2076
       64   GP-13. . . . . . . . . . . . .  M1891 2085 2089
       66   GP-14. . . . . . . . . . . . .  M1892 2098 2102
       68   GP-15. . . . . . . . . . . . .  M1893 2111 2115
       70   GP-16. . . . . . . . . . . . .  M1894 2124 2128
       72   GP-17. . . . . . . . . . . . .  M1895 2137 2141
       74   GP-18. . . . . . . . . . . . .  M1896 2150 2154
       76   GP-19. . . . . . . . . . . . .  M1897 2163 2167
       42   GP-2 . . . . . . . . . . . . .  M1880 1943 1947
       78   GP-20. . . . . . . . . . . . .  M1898 2176 2180 2193
       80   GP-21. . . . . . . . . . . . .  M1899 2189
       82   GP-22. . . . . . . . . . . . .  M1900 2202 2206
       84   GP-23. . . . . . . . . . . . .  M1901 2215 2219
       86   GP-24. . . . . . . . . . . . .  M1902 2228 2232
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    52
0 Defined   Cross-reference of data names   References

0      88   GP-25. . . . . . . . . . . . .  M1903 2241 2245
       90   GP-26. . . . . . . . . . . . .  M1904 2254 2258
       92   GP-27. . . . . . . . . . . . .  M1905 2267 2271
       94   GP-28. . . . . . . . . . . . .  M1906 2280 2284
       96   GP-29. . . . . . . . . . . . .  M1907 2293 2297
       44   GP-3 . . . . . . . . . . . . .  M1881 1956 1960
       98   GP-30. . . . . . . . . . . . .  M1908 2306 2310
      100   GP-31. . . . . . . . . . . . .  M1909 2319 2323
      102   GP-32. . . . . . . . . . . . .  M1910 2332 2336
      104   GP-33. . . . . . . . . . . . .  M1911 2345 2349
      106   GP-34. . . . . . . . . . . . .  M1912 2358 2362
      108   GP-35. . . . . . . . . . . . .  M1913 2371 2375
      110   GP-36. . . . . . . . . . . . .  M1914 2384 2388
      112   GP-37. . . . . . . . . . . . .  M1915 2397 2401
      114   GP-38. . . . . . . . . . . . .  M1916 2410 2414
      116   GP-39. . . . . . . . . . . . .  M1917 2423 2427
       46   GP-4 . . . . . . . . . . . . .  M1882 1969 1973
      118   GP-40. . . . . . . . . . . . .  M1918 2436 2440
      120   GP-41. . . . . . . . . . . . .  M1919 2449 2453
      122   GP-42. . . . . . . . . . . . .  M1920 2462 2466
      124   GP-43. . . . . . . . . . . . .  M1921 2475 2479
      126   GP-44. . . . . . . . . . . . .  M1922 2488 2492
      128   GP-45. . . . . . . . . . . . .  M1923 2501 2505
      130   GP-46. . . . . . . . . . . . .  M1924 2514 2518
      132   GP-47. . . . . . . . . . . . .  M1925 M1926 2527 2531 2540 2544
      134   GP-48. . . . . . . . . . . . .  M1927 M1928 2553 2557 2566 2570
       48   GP-5 . . . . . . . . . . . . .  M1883 1982 1986
       50   GP-6 . . . . . . . . . . . . .  M1884 1995 1999
       52   GP-7 . . . . . . . . . . . . .  M1885 2008 2012
       54   GP-8 . . . . . . . . . . . . .  M1886 2021
       56   GP-9 . . . . . . . . . . . . .  M1887 2033 2037
       41   GPLEVEL-1
       59   GPLEVEL-10
       61   GPLEVEL-11
       63   GPLEVEL-12
       65   GPLEVEL-13
       67   GPLEVEL-14
       69   GPLEVEL-15
       71   GPLEVEL-16
       73   GPLEVEL-17
       75   GPLEVEL-18
       77   GPLEVEL-19
       43   GPLEVEL-2
       79   GPLEVEL-20
       81   GPLEVEL-21
       83   GPLEVEL-22
       85   GPLEVEL-23
       87   GPLEVEL-24
       89   GPLEVEL-25
       91   GPLEVEL-26
       93   GPLEVEL-27
       95   GPLEVEL-28
       97   GPLEVEL-29
       45   GPLEVEL-3
       99   GPLEVEL-30
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    53
0 Defined   Cross-reference of data names   References

0     101   GPLEVEL-31
      103   GPLEVEL-32
      105   GPLEVEL-33
      107   GPLEVEL-34
      109   GPLEVEL-35
      111   GPLEVEL-36
      113   GPLEVEL-37
      115   GPLEVEL-38
      117   GPLEVEL-39
       47   GPLEVEL-4
      119   GPLEVEL-40
      121   GPLEVEL-41
      123   GPLEVEL-42
      125   GPLEVEL-43
      127   GPLEVEL-44
      129   GPLEVEL-45
      131   GPLEVEL-46
      133   GPLEVEL-47
       49   GPLEVEL-5
       51   GPLEVEL-6
       53   GPLEVEL-7
       55   GPLEVEL-8
       57   GPLEVEL-9
      394   HYPHEN-LINE. . . . . . . . . .  441 443 487
      360   ID-AGAIN . . . . . . . . . . .  M406
      393   INF-ANSI-REFERENCE . . . . . .  M500 M503 M516 M518
      388   INFO-TEXT. . . . . . . . . . .  M501
      317   INSPECT-COUNTER. . . . . . . .  M416 447 469 471
      238   LENGTH-COUNTER . . . . . . . .  M536 542 M551 557 M566 572 M581 587 M596 602 M611 617 M626 632 M641 647 M656
                                            662 M671 677 M686 692 M701 707 M716 722 M731 737 M746 752 M761 767 M776 782 M791
                                            797 M806 812 M821 827 M836 842 M851 857 M866 872 M881 887 M896 902 M911 917 M926
                                            932 M941 947 M956 962 M971 977 M986 992 M1001 1007 M1016 1022 M1031 1037 M1046
                                            1052 M1061 1067 M1076 1082 M1091 1097 M1106 1112 M1121 1127 M1136 1142 M1151
                                            1157 M1166 1172 M1181 1187 M1196 1202 M1211 1217 M1226 1232 2584 2589 2594 2599
                                            2604 2609 2614 2619 2624 M2630
      231   LITERAL-98 . . . . . . . . . .  1247
      265   P-OR-F . . . . . . . . . . . .  M416 M417 M418 M419 426 M429
      267   PAR-NAME . . . . . . . . . . .  M431 M541 M556 M571 M586 M601 M616 M631 M646 M661 M676 M691 M706 M721 M736 M751
                                            M766 M781 M796 M811 M826 M841 M856 M871 M886 M901 M916 M931 M946 M961 M976 M991
                                            M1006 M1021 M1036 M1051 M1066 M1081 M1096 M1111 M1126 M1141 M1156 M1171 M1186
                                            M1201 M1216 M1231 M1259 M1272 M1285 M1298 M1311 M1324 M1337 M1350 M1363 M1376
                                            M1389 M1402 M1415 M1428 M1441 M1454 M1467 M1480 M1493 M1506 M1519 M1532 M1545
                                            M1558 M1571 M1584 M1597 M1610 M1623 M1636 M1649 M1662 M1675 M1688 M1701 M1714
                                            M1727 M1740 M1753 M1766 M1779 M1792 M1805 M1818 M1831 M1844 M1857 M1870 M1940
                                            M1953 M1966 M1979 M1992 M2005 M2018 M2030 M2043 M2056 M2069 M2082 M2095 M2108
                                            M2121 M2134 M2147 M2160 M2173 M2186 M2199 M2212 M2225 M2238 M2251 M2264 M2277
                                            M2290 M2303 M2316 M2329 M2342 M2355 M2368 M2381 M2394 M2407 M2420 M2433 M2446
                                            M2459 M2472 M2485 M2498 M2511 M2524 M2537 M2550 M2563 M2576
      269   PARDOT-X . . . . . . . . . . .  M423
      318   PASS-COUNTER . . . . . . . . .  M417 449 451
       35   PRINT-FILE . . . . . . . . . .  31 405 411
       36   PRINT-REC. . . . . . . . . . .  M425 M506 M508 M1238 M1875
      272   RE-MARK. . . . . . . . . . . .  M420 M432 M2583 M2588 M2593 M2598 M2603 M2608 M2613 M2618 M2623 M2628
      314   REC-CT . . . . . . . . . . . .  422 424 431
      313   REC-SKL-SUB
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    54
0 Defined   Cross-reference of data names   References

0     322   RECORD-COUNT . . . . . . . . .  M476 477 M489
      135   TABLE-GROUP. . . . . . . . . .  M529 534 549 564 579 594 609 624 639 654 669 684 699 714 729 744 759 774 789
                                            804 819 834 849 864 879 894 909 924 939 954 969 984 999 1014 1029 1044 1059 1074
                                            1089 1104 1119 1134 1149 1164 1179 1194 1209 1224 M1247
      136   TB-1 . . . . . . . . . . . . .  1249 1253
      154   TB-10. . . . . . . . . . . . .  1366 1370
      156   TB-11. . . . . . . . . . . . .  1379 1383
      158   TB-12. . . . . . . . . . . . .  1392 1396
      160   TB-13. . . . . . . . . . . . .  1405 1409
      162   TB-14. . . . . . . . . . . . .  1418 1422
      164   TB-15. . . . . . . . . . . . .  1431 1435
      166   TB-16. . . . . . . . . . . . .  1444 1448
      168   TB-17. . . . . . . . . . . . .  1457 1461
      170   TB-18. . . . . . . . . . . . .  1470 1474
      172   TB-19. . . . . . . . . . . . .  1483 1487
      138   TB-2 . . . . . . . . . . . . .  1262 1266
      174   TB-20. . . . . . . . . . . . .  1496 1500
      176   TB-21. . . . . . . . . . . . .  1509 1513
      178   TB-22. . . . . . . . . . . . .  1522 1526
      180   TB-23. . . . . . . . . . . . .  1535 1539
      182   TB-24. . . . . . . . . . . . .  1548 1552
      184   TB-25. . . . . . . . . . . . .  1561 1565
      186   TB-26. . . . . . . . . . . . .  1574 1578
      188   TB-27. . . . . . . . . . . . .  1587 1591
      190   TB-28. . . . . . . . . . . . .  1600
      192   TB-29. . . . . . . . . . . . .  1604 1613 1617
      140   TB-3 . . . . . . . . . . . . .  1275 1279
      194   TB-30. . . . . . . . . . . . .  1626 1630
      196   TB-31. . . . . . . . . . . . .  1639 1643
      198   TB-32. . . . . . . . . . . . .  1652 1656
      200   TB-33. . . . . . . . . . . . .  1665 1669
      202   TB-34. . . . . . . . . . . . .  1678 1682
      204   TB-35. . . . . . . . . . . . .  1691 1695
      206   TB-36. . . . . . . . . . . . .  1704 1708
      208   TB-37. . . . . . . . . . . . .  1717 1721
      210   TB-38. . . . . . . . . . . . .  1730 1734
      212   TB-39. . . . . . . . . . . . .  1743 1747
      142   TB-4 . . . . . . . . . . . . .  1288 1292
      214   TB-40. . . . . . . . . . . . .  1756 1760
      216   TB-41. . . . . . . . . . . . .  1769 1773
      218   TB-42. . . . . . . . . . . . .  1782 1786
      220   TB-43. . . . . . . . . . . . .  1795 1799
      222   TB-44. . . . . . . . . . . . .  1808 1812
      224   TB-45. . . . . . . . . . . . .  1821 1825
      226   TB-46. . . . . . . . . . . . .  1834 1838
      228   TB-47. . . . . . . . . . . . .  1847 1851
      230   TB-48. . . . . . . . . . . . .  1860 1864
      144   TB-5 . . . . . . . . . . . . .  1301 1305
      146   TB-6 . . . . . . . . . . . . .  1314 1318
      148   TB-7 . . . . . . . . . . . . .  1327 1331
      150   TB-8 . . . . . . . . . . . . .  1340 1344
      152   TB-9 . . . . . . . . . . . . .  1353 1357
      137   TBGRP-1. . . . . . . . . . . .  531
      155   TBGRP-10 . . . . . . . . . . .  666
      157   TBGRP-11 . . . . . . . . . . .  681
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    55
0 Defined   Cross-reference of data names   References

0     159   TBGRP-12 . . . . . . . . . . .  696
      161   TBGRP-13 . . . . . . . . . . .  711
      163   TBGRP-14 . . . . . . . . . . .  726
      165   TBGRP-15 . . . . . . . . . . .  741
      167   TBGRP-16 . . . . . . . . . . .  756
      169   TBGRP-17 . . . . . . . . . . .  771
      171   TBGRP-18 . . . . . . . . . . .  786
      173   TBGRP-19 . . . . . . . . . . .  801
      139   TBGRP-2. . . . . . . . . . . .  546
      175   TBGRP-20 . . . . . . . . . . .  816
      177   TBGRP-21 . . . . . . . . . . .  831
      179   TBGRP-22 . . . . . . . . . . .  846
      181   TBGRP-23 . . . . . . . . . . .  861
      183   TBGRP-24 . . . . . . . . . . .  876
      185   TBGRP-25 . . . . . . . . . . .  891
      187   TBGRP-26 . . . . . . . . . . .  906
      189   TBGRP-27 . . . . . . . . . . .  921
      191   TBGRP-28 . . . . . . . . . . .  936
      193   TBGRP-29 . . . . . . . . . . .  951
      141   TBGRP-3. . . . . . . . . . . .  561
      195   TBGRP-30 . . . . . . . . . . .  966
      197   TBGRP-31 . . . . . . . . . . .  981
      199   TBGRP-32 . . . . . . . . . . .  996
      201   TBGRP-33 . . . . . . . . . . .  1011
      203   TBGRP-34 . . . . . . . . . . .  1026
      205   TBGRP-35 . . . . . . . . . . .  1041
      207   TBGRP-36 . . . . . . . . . . .  1056
      209   TBGRP-37 . . . . . . . . . . .  1071
      211   TBGRP-38 . . . . . . . . . . .  1086
      213   TBGRP-39 . . . . . . . . . . .  1101
      143   TBGRP-4. . . . . . . . . . . .  576
      215   TBGRP-40 . . . . . . . . . . .  1116
      217   TBGRP-41 . . . . . . . . . . .  1131
      219   TBGRP-42 . . . . . . . . . . .  1146
      221   TBGRP-43 . . . . . . . . . . .  1161
      223   TBGRP-44 . . . . . . . . . . .  1176
      225   TBGRP-45 . . . . . . . . . . .  1191
      227   TBGRP-46 . . . . . . . . . . .  1206
      229   TBGRP-47 . . . . . . . . . . .  1221
      145   TBGRP-5. . . . . . . . . . . .  591
      147   TBGRP-6. . . . . . . . . . . .  606
      149   TBGRP-7. . . . . . . . . . . .  621
      151   TBGRP-8. . . . . . . . . . . .  636
      153   TBGRP-9. . . . . . . . . . . .  651
      273   TEST-COMPUTED. . . . . . . . .  506
      288   TEST-CORRECT . . . . . . . . .  508
       39   TEST-GROUP-1
      341   TEST-ID. . . . . . . . . . . .  M406
      261   TEST-RESULTS . . . . . . . . .  M407 425
      319   TOTAL-ERROR
      390   XXCOMPUTED . . . . . . . . . .  M515
      392   XXCORRECT. . . . . . . . . . .  M515
      385   XXINFO . . . . . . . . . . . .  502 517
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    56
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

      511   BAIL-OUT . . . . . . . . . . .  P428
      519   BAIL-OUT-EX. . . . . . . . . .  E428 G513
      514   BAIL-OUT-WRITE . . . . . . . .  G512
      494   BLANK-LINE-PRINT
     2629   BREAKDOWN-EXIT . . . . . . . .  E543 E558 E573 E588 E603 E618 E633 E648 E663 E678 E693 E708 E723 E738 E753 E768
                                            E783 E798 E813 E828 E843 E858 E873 E888 E903 E918 E933 E948 E963 E978 E993 E1008
                                            E1023 E1038 E1053 E1068 E1083 E1098 E1113 E1128 E1143 E1158 E1173 E1188 E1203
                                            E1218 E1233 G2584 G2589 G2594 G2599 G2604 G2609 G2614 G2619 G2624
     2579   BREAKDOWN-PARA . . . . . . . .  P543 P558 P573 P588 P603 P618 P633 P648 P663 P678 P693 P708 P723 P738 P753 P768
                                            P783 P798 P813 P828 P843 P858 P873 P888 P903 P918 P933 P948 P963 P978 P993 P1008
                                            P1023 P1038 P1053 P1068 P1083 P1098 P1113 P1128 P1143 P1158 P1173 P1188 P1203
                                            P1218 P1233
     2631   CCVS-EXIT. . . . . . . . . . .  G2578
     2632   CCVS-999999
      403   CCVS1
      520   CCVS1-EXIT . . . . . . . . . .  G409
      410   CLOSE-FILES. . . . . . . . . .  G2633
      438   COLUMN-NAMES-ROUTINE . . . . .  E408
      419   DE-LETE. . . . . . . . . . . .  P539 P554 P569 P584 P599 P614 P629 P644 P659 P674 P689 P704 P719 P734 P749 P764
                                            P779 P794 P809 P824 P839 P854 P869 P884 P899 P914 P929 P944 P959 P974 P989 P1004
                                            P1019 P1034 P1049 P1064 P1079 P1094 P1109 P1124 P1139 P1154 P1169 P1184 P1199
                                            P1214 P1229 P1257 P1270 P1283 P1296 P1309 P1322 P1335 P1348 P1361 P1374 P1387
                                            P1400 P1413 P1426 P1439 P1452 P1465 P1478 P1491 P1504 P1517 P1530 P1543 P1556
                                            P1569 P1582 P1595 P1608 P1621 P1634 P1647 P1660 P1673 P1686 P1699 P1712 P1725
                                            P1738 P1751 P1764 P1777 P1790 P1803 P1816 P1829 P1842 P1855 P1868 P1938 P1951
                                            P1964 P1977 P1990 P2003 P2016 P2028 P2041 P2054 P2067 P2080 P2093 P2106 P2119
                                            P2132 P2145 P2158 P2171 P2184 P2197 P2210 P2223 P2236 P2249 P2262 P2275 P2288
                                            P2301 P2314 P2327 P2340 P2353 P2366 P2379 P2392 P2405 P2418 P2431 P2444 P2457
                                            P2470 P2483 P2496 P2509 P2522 P2535 P2548 P2561 P2574
      442   END-ROUTINE. . . . . . . . . .  P411 P1237 P1874
      446   END-ROUTINE-1
      455   END-ROUTINE-12
      463   END-ROUTINE-13 . . . . . . . .  E411
      444   END-RTN-EXIT
      418   FAIL . . . . . . . . . . . . .  P1252 P1265 P1278 P1291 P1304 P1317 P1330 P1343 P1356 P1369 P1382 P1395 P1408
                                            P1421 P1434 P1447 P1460 P1473 P1486 P1499 P1512 P1525 P1538 P1551 P1564 P1577
                                            P1590 P1603 P1616 P1629 P1642 P1655 P1668 P1681 P1694 P1707 P1720 P1733 P1746
                                            P1759 P1772 P1785 P1798 P1811 P1824 P1837 P1850 P1863 P1933 P1946 P1959 P1972
                                            P1985 P1998 P2011 P2024 P2036 P2049 P2062 P2075 P2088 P2101 P2114 P2127 P2140
                                            P2153 P2166 P2179 P2192 P2205 P2218 P2231 P2244 P2257 P2270 P2283 P2296 P2309
                                            P2322 P2335 P2348 P2361 P2374 P2387 P2400 P2413 P2426 P2439 P2452 P2465 P2478
                                            P2491 P2504 P2517 P2530 P2543 P2556 P2569 P2580
      496   FAIL-ROUTINE . . . . . . . . .  P427
      510   FAIL-ROUTINE-EX. . . . . . . .  E427 G504
      505   FAIL-ROUTINE-WRITE . . . . . .  G498 G499
      433   HEAD-ROUTINE . . . . . . . . .  P408
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    57
0 Defined   Cross-reference of procedures   References

0     416   INSPT
      538   LEV-DELETE-GF-1-1
      673   LEV-DELETE-GF-1-10
      688   LEV-DELETE-GF-1-11
      703   LEV-DELETE-GF-1-12
      718   LEV-DELETE-GF-1-13
      733   LEV-DELETE-GF-1-14
      748   LEV-DELETE-GF-1-15
      763   LEV-DELETE-GF-1-16
      778   LEV-DELETE-GF-1-17
      793   LEV-DELETE-GF-1-18
      808   LEV-DELETE-GF-1-19
      553   LEV-DELETE-GF-1-2
      823   LEV-DELETE-GF-1-20
      838   LEV-DELETE-GF-1-21
      853   LEV-DELETE-GF-1-22
      868   LEV-DELETE-GF-1-23
      883   LEV-DELETE-GF-1-24
      898   LEV-DELETE-GF-1-25
      913   LEV-DELETE-GF-1-26
      928   LEV-DELETE-GF-1-27
      943   LEV-DELETE-GF-1-28
      958   LEV-DELETE-GF-1-29
      568   LEV-DELETE-GF-1-3
      973   LEV-DELETE-GF-1-30
      988   LEV-DELETE-GF-1-31
     1003   LEV-DELETE-GF-1-32
     1018   LEV-DELETE-GF-1-33
     1033   LEV-DELETE-GF-1-34
     1048   LEV-DELETE-GF-1-35
     1063   LEV-DELETE-GF-1-36
     1078   LEV-DELETE-GF-1-37
     1093   LEV-DELETE-GF-1-38
     1108   LEV-DELETE-GF-1-39
      583   LEV-DELETE-GF-1-4
     1123   LEV-DELETE-GF-1-40
     1138   LEV-DELETE-GF-1-41
     1153   LEV-DELETE-GF-1-42
     1168   LEV-DELETE-GF-1-43
     1183   LEV-DELETE-GF-1-44
     1198   LEV-DELETE-GF-1-45
     1213   LEV-DELETE-GF-1-46
     1228   LEV-DELETE-GF-1-47
      598   LEV-DELETE-GF-1-5
      613   LEV-DELETE-GF-1-6
      628   LEV-DELETE-GF-1-7
      643   LEV-DELETE-GF-1-8
      658   LEV-DELETE-GF-1-9
     1256   LEV-DELETE-GF-2-1
     1373   LEV-DELETE-GF-2-10
     1386   LEV-DELETE-GF-2-11
     1399   LEV-DELETE-GF-2-12
     1412   LEV-DELETE-GF-2-13
     1425   LEV-DELETE-GF-2-14
     1438   LEV-DELETE-GF-2-15
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    58
0 Defined   Cross-reference of procedures   References

0    1451   LEV-DELETE-GF-2-16
     1464   LEV-DELETE-GF-2-17
     1477   LEV-DELETE-GF-2-18
     1490   LEV-DELETE-GF-2-19
     1269   LEV-DELETE-GF-2-2
     1503   LEV-DELETE-GF-2-20
     1516   LEV-DELETE-GF-2-21
     1529   LEV-DELETE-GF-2-22
     1542   LEV-DELETE-GF-2-23
     1555   LEV-DELETE-GF-2-24
     1568   LEV-DELETE-GF-2-25
     1581   LEV-DELETE-GF-2-26
     1594   LEV-DELETE-GF-2-27
     1607   LEV-DELETE-GF-2-28
     1620   LEV-DELETE-GF-2-29
     1282   LEV-DELETE-GF-2-3
     1633   LEV-DELETE-GF-2-30
     1646   LEV-DELETE-GF-2-31
     1659   LEV-DELETE-GF-2-32
     1672   LEV-DELETE-GF-2-33
     1685   LEV-DELETE-GF-2-34
     1698   LEV-DELETE-GF-2-35
     1711   LEV-DELETE-GF-2-36
     1724   LEV-DELETE-GF-2-37
     1737   LEV-DELETE-GF-2-38
     1750   LEV-DELETE-GF-2-39
     1295   LEV-DELETE-GF-2-4
     1763   LEV-DELETE-GF-2-40
     1776   LEV-DELETE-GF-2-41
     1789   LEV-DELETE-GF-2-42
     1802   LEV-DELETE-GF-2-43
     1815   LEV-DELETE-GF-2-44
     1828   LEV-DELETE-GF-2-45
     1841   LEV-DELETE-GF-2-46
     1854   LEV-DELETE-GF-2-47
     1867   LEV-DELETE-GF-2-48
     1308   LEV-DELETE-GF-2-5
     1321   LEV-DELETE-GF-2-6
     1334   LEV-DELETE-GF-2-7
     1347   LEV-DELETE-GF-2-8
     1360   LEV-DELETE-GF-2-9
     1937   LEV-DELETE-GF-3-1
     2053   LEV-DELETE-GF-3-10
     2066   LEV-DELETE-GF-3-11
     2079   LEV-DELETE-GF-3-12
     2092   LEV-DELETE-GF-3-13
     2105   LEV-DELETE-GF-3-14
     2118   LEV-DELETE-GF-3-15
     2131   LEV-DELETE-GF-3-16
     2144   LEV-DELETE-GF-3-17
     2157   LEV-DELETE-GF-3-18
     2170   LEV-DELETE-GF-3-19
     1950   LEV-DELETE-GF-3-2
     2183   LEV-DELETE-GF-3-20
     2196   LEV-DELETE-GF-3-21
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    59
0 Defined   Cross-reference of procedures   References

0    2209   LEV-DELETE-GF-3-22
     2222   LEV-DELETE-GF-3-23
     2235   LEV-DELETE-GF-3-24
     2248   LEV-DELETE-GF-3-25
     2261   LEV-DELETE-GF-3-26
     2274   LEV-DELETE-GF-3-27
     2287   LEV-DELETE-GF-3-28
     2300   LEV-DELETE-GF-3-29
     1963   LEV-DELETE-GF-3-3
     2313   LEV-DELETE-GF-3-30
     2326   LEV-DELETE-GF-3-31
     2339   LEV-DELETE-GF-3-32
     2352   LEV-DELETE-GF-3-33
     2365   LEV-DELETE-GF-3-34
     2378   LEV-DELETE-GF-3-35
     2391   LEV-DELETE-GF-3-36
     2404   LEV-DELETE-GF-3-37
     2417   LEV-DELETE-GF-3-38
     2430   LEV-DELETE-GF-3-39
     1976   LEV-DELETE-GF-3-4
     2443   LEV-DELETE-GF-3-40
     2456   LEV-DELETE-GF-3-41
     2469   LEV-DELETE-GF-3-42
     2482   LEV-DELETE-GF-3-43
     2495   LEV-DELETE-GF-3-44
     2508   LEV-DELETE-GF-3-45
     2521   LEV-DELETE-GF-3-46
     2534   LEV-DELETE-GF-3-47
     2547   LEV-DELETE-GF-3-48
     2560   LEV-DELETE-GF-3-49
     1989   LEV-DELETE-GF-3-5
     2573   LEV-DELETE-GF-3-50
     2002   LEV-DELETE-GF-3-6
     2015   LEV-DELETE-GF-3-7
     2027   LEV-DELETE-GF-3-8
     2040   LEV-DELETE-GF-3-9
      523   LEV-INIT-GF-1-1
     1235   LEV-INIT-GF-2-1
     1872   LEV-INIT-GF-3-1
      528   LEV-TEST-GF-1-0
      530   LEV-TEST-GF-1-1
      680   LEV-TEST-GF-1-11
      695   LEV-TEST-GF-1-12
      725   LEV-TEST-GF-1-14
      740   LEV-TEST-GF-1-15
      755   LEV-TEST-GF-1-16
      770   LEV-TEST-GF-1-17
      785   LEV-TEST-GF-1-18
      800   LEV-TEST-GF-1-19
      545   LEV-TEST-GF-1-2
      815   LEV-TEST-GF-1-20
      830   LEV-TEST-GF-1-21
      845   LEV-TEST-GF-1-22
      860   LEV-TEST-GF-1-23
      875   LEV-TEST-GF-1-24
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    60
0 Defined   Cross-reference of procedures   References

0     890   LEV-TEST-GF-1-25
      905   LEV-TEST-GF-1-26
      920   LEV-TEST-GF-1-27
      935   LEV-TEST-GF-1-28
      950   LEV-TEST-GF-1-29
      560   LEV-TEST-GF-1-3
      965   LEV-TEST-GF-1-30
      980   LEV-TEST-GF-1-31
      995   LEV-TEST-GF-1-32
     1010   LEV-TEST-GF-1-33
     1025   LEV-TEST-GF-1-34
     1040   LEV-TEST-GF-1-35
     1055   LEV-TEST-GF-1-36
     1070   LEV-TEST-GF-1-37
     1085   LEV-TEST-GF-1-38
     1100   LEV-TEST-GF-1-39
      575   LEV-TEST-GF-1-4
     1115   LEV-TEST-GF-1-40
     1130   LEV-TEST-GF-1-41
     1145   LEV-TEST-GF-1-42
     1160   LEV-TEST-GF-1-43
     1175   LEV-TEST-GF-1-44
     1190   LEV-TEST-GF-1-45
     1205   LEV-TEST-GF-1-46
     1220   LEV-TEST-GF-1-47
      590   LEV-TEST-GF-1-5
      605   LEV-TEST-GF-1-6
      620   LEV-TEST-GF-1-7
      635   LEV-TEST-GF-1-8
      650   LEV-TEST-GF-1-9
      665   LEV-TEST-GF-10
      710   LEV-TEST-GF-13
     1248   LEV-TEST-GF-2-1
     1365   LEV-TEST-GF-2-10
     1378   LEV-TEST-GF-2-11
     1391   LEV-TEST-GF-2-12
     1404   LEV-TEST-GF-2-13
     1417   LEV-TEST-GF-2-14
     1430   LEV-TEST-GF-2-15
     1443   LEV-TEST-GF-2-16
     1456   LEV-TEST-GF-2-17
     1469   LEV-TEST-GF-2-18
     1482   LEV-TEST-GF-2-19
     1261   LEV-TEST-GF-2-2
     1495   LEV-TEST-GF-2-20
     1508   LEV-TEST-GF-2-21
     1521   LEV-TEST-GF-2-22
     1534   LEV-TEST-GF-2-23
     1547   LEV-TEST-GF-2-24
     1560   LEV-TEST-GF-2-25
     1573   LEV-TEST-GF-2-26
     1586   LEV-TEST-GF-2-27
     1599   LEV-TEST-GF-2-28
     1612   LEV-TEST-GF-2-29
     1274   LEV-TEST-GF-2-3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    61
0 Defined   Cross-reference of procedures   References

0    1625   LEV-TEST-GF-2-30
     1638   LEV-TEST-GF-2-31
     1651   LEV-TEST-GF-2-32
     1664   LEV-TEST-GF-2-33
     1677   LEV-TEST-GF-2-34
     1690   LEV-TEST-GF-2-35
     1703   LEV-TEST-GF-2-36
     1716   LEV-TEST-GF-2-37
     1729   LEV-TEST-GF-2-38
     1742   LEV-TEST-GF-2-39
     1287   LEV-TEST-GF-2-4
     1755   LEV-TEST-GF-2-40
     1768   LEV-TEST-GF-2-41
     1781   LEV-TEST-GF-2-42
     1794   LEV-TEST-GF-2-43
     1807   LEV-TEST-GF-2-44
     1820   LEV-TEST-GF-2-45
     1833   LEV-TEST-GF-2-46
     1846   LEV-TEST-GF-2-47
     1859   LEV-TEST-GF-2-48
     1300   LEV-TEST-GF-2-5
     1313   LEV-TEST-GF-2-6
     1326   LEV-TEST-GF-2-7
     1339   LEV-TEST-GF-2-8
     1352   LEV-TEST-GF-2-9
     1929   LEV-TEST-GF-3-1
     2045   LEV-TEST-GF-3-10
     2058   LEV-TEST-GF-3-11
     2071   LEV-TEST-GF-3-12
     2084   LEV-TEST-GF-3-13
     2097   LEV-TEST-GF-3-14
     2110   LEV-TEST-GF-3-15
     2123   LEV-TEST-GF-3-16
     2136   LEV-TEST-GF-3-17
     2149   LEV-TEST-GF-3-18
     2162   LEV-TEST-GF-3-19
     1942   LEV-TEST-GF-3-2
     2175   LEV-TEST-GF-3-20
     2188   LEV-TEST-GF-3-21
     2201   LEV-TEST-GF-3-22
     2214   LEV-TEST-GF-3-23
     2227   LEV-TEST-GF-3-24
     2240   LEV-TEST-GF-3-25
     2253   LEV-TEST-GF-3-26
     2266   LEV-TEST-GF-3-27
     2279   LEV-TEST-GF-3-28
     2292   LEV-TEST-GF-3-29
     1955   LEV-TEST-GF-3-3
     2305   LEV-TEST-GF-3-30
     2318   LEV-TEST-GF-3-31
     2331   LEV-TEST-GF-3-32
     2344   LEV-TEST-GF-3-33
     2357   LEV-TEST-GF-3-34
     2370   LEV-TEST-GF-3-35
     2383   LEV-TEST-GF-3-36
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    62
0 Defined   Cross-reference of procedures   References

0    2396   LEV-TEST-GF-3-37
     2409   LEV-TEST-GF-3-38
     2422   LEV-TEST-GF-3-39
     1968   LEV-TEST-GF-3-4
     2435   LEV-TEST-GF-3-40
     2448   LEV-TEST-GF-3-41
     2461   LEV-TEST-GF-3-42
     2474   LEV-TEST-GF-3-43
     2487   LEV-TEST-GF-3-44
     2500   LEV-TEST-GF-3-45
     2513   LEV-TEST-GF-3-46
     2526   LEV-TEST-GF-3-47
     2539   LEV-TEST-GF-3-48
     2552   LEV-TEST-GF-3-49
     1981   LEV-TEST-GF-3-5
     2565   LEV-TEST-GF-3-50
     1994   LEV-TEST-GF-3-6
     2007   LEV-TEST-GF-3-7
     2020   LEV-TEST-GF-3-8
     2032   LEV-TEST-GF-3-9
      540   LEV-WRITE-GF-1-1 . . . . . . .  G533 G537
      675   LEV-WRITE-GF-1-10. . . . . . .  G668 G672
      690   LEV-WRITE-GF-1-11. . . . . . .  G683 G687
      705   LEV-WRITE-GF-1-12. . . . . . .  G698 G702
      720   LEV-WRITE-GF-1-13. . . . . . .  G713 G717
      735   LEV-WRITE-GF-1-14. . . . . . .  G728 G732
      750   LEV-WRITE-GF-1-15. . . . . . .  G743 G747
      765   LEV-WRITE-GF-1-16. . . . . . .  G758 G762
      780   LEV-WRITE-GF-1-17. . . . . . .  G773 G777
      795   LEV-WRITE-GF-1-18. . . . . . .  G788 G792
      810   LEV-WRITE-GF-1-19. . . . . . .  G803 G807
      555   LEV-WRITE-GF-1-2 . . . . . . .  G548 G552
      825   LEV-WRITE-GF-1-20. . . . . . .  G818 G822
      840   LEV-WRITE-GF-1-21. . . . . . .  G833 G837
      855   LEV-WRITE-GF-1-22. . . . . . .  G848 G852
      870   LEV-WRITE-GF-1-23. . . . . . .  G863 G867
      885   LEV-WRITE-GF-1-24. . . . . . .  G878 G882
      900   LEV-WRITE-GF-1-25. . . . . . .  G893 G897
      915   LEV-WRITE-GF-1-26. . . . . . .  G908 G912
      930   LEV-WRITE-GF-1-27. . . . . . .  G923 G927
      945   LEV-WRITE-GF-1-28. . . . . . .  G938 G942
      960   LEV-WRITE-GF-1-29. . . . . . .  G953 G957
      570   LEV-WRITE-GF-1-3 . . . . . . .  G563 G567
      975   LEV-WRITE-GF-1-30. . . . . . .  G968 G972
      990   LEV-WRITE-GF-1-31. . . . . . .  G983 G987
     1005   LEV-WRITE-GF-1-32. . . . . . .  G998 G1002
     1020   LEV-WRITE-GF-1-33. . . . . . .  G1013 G1017
     1035   LEV-WRITE-GF-1-34. . . . . . .  G1028 G1032
     1050   LEV-WRITE-GF-1-35. . . . . . .  G1043 G1047
     1065   LEV-WRITE-GF-1-36. . . . . . .  G1058 G1062
     1080   LEV-WRITE-GF-1-37. . . . . . .  G1073 G1077
     1095   LEV-WRITE-GF-1-38. . . . . . .  G1088 G1092
     1110   LEV-WRITE-GF-1-39. . . . . . .  G1103 G1107
      585   LEV-WRITE-GF-1-4 . . . . . . .  G578 G582
     1125   LEV-WRITE-GF-1-40. . . . . . .  G1118 G1122
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    63
0 Defined   Cross-reference of procedures   References

0    1140   LEV-WRITE-GF-1-41. . . . . . .  G1133 G1137
     1155   LEV-WRITE-GF-1-42. . . . . . .  G1148 G1152
     1170   LEV-WRITE-GF-1-43. . . . . . .  G1163 G1167
     1185   LEV-WRITE-GF-1-44. . . . . . .  G1178 G1182
     1200   LEV-WRITE-GF-1-45. . . . . . .  G1193 G1197
     1215   LEV-WRITE-GF-1-46. . . . . . .  G1208 G1212
     1230   LEV-WRITE-GF-1-47. . . . . . .  G1223 G1227
      600   LEV-WRITE-GF-1-5 . . . . . . .  G593 G597
      615   LEV-WRITE-GF-1-6 . . . . . . .  G608 G612
      630   LEV-WRITE-GF-1-7 . . . . . . .  G623 G627
      645   LEV-WRITE-GF-1-8 . . . . . . .  G638 G642
      660   LEV-WRITE-GF-1-9 . . . . . . .  G653 G657
     1258   LEV-WRITE-GF-2-1 . . . . . . .  G1251 G1255
     1375   LEV-WRITE-GF-2-10. . . . . . .  G1368 G1372
     1388   LEV-WRITE-GF-2-11. . . . . . .  G1381 G1385
     1401   LEV-WRITE-GF-2-12. . . . . . .  G1394 G1398
     1414   LEV-WRITE-GF-2-13. . . . . . .  G1407 G1411
     1427   LEV-WRITE-GF-2-14. . . . . . .  G1420 G1424
     1440   LEV-WRITE-GF-2-15. . . . . . .  G1433 G1437
     1453   LEV-WRITE-GF-2-16. . . . . . .  G1446 G1450
     1466   LEV-WRITE-GF-2-17. . . . . . .  G1459 G1463
     1479   LEV-WRITE-GF-2-18. . . . . . .  G1472 G1476
     1492   LEV-WRITE-GF-2-19. . . . . . .  G1485 G1489
     1271   LEV-WRITE-GF-2-2 . . . . . . .  G1264 G1268
     1505   LEV-WRITE-GF-2-20. . . . . . .  G1498 G1502
     1518   LEV-WRITE-GF-2-21. . . . . . .  G1511 G1515
     1531   LEV-WRITE-GF-2-22. . . . . . .  G1524 G1528
     1544   LEV-WRITE-GF-2-23. . . . . . .  G1537 G1541
     1557   LEV-WRITE-GF-2-24. . . . . . .  G1550 G1554
     1570   LEV-WRITE-GF-2-25. . . . . . .  G1563 G1567
     1583   LEV-WRITE-GF-2-26. . . . . . .  G1576 G1580
     1596   LEV-WRITE-GF-2-27. . . . . . .  G1589 G1593
     1609   LEV-WRITE-GF-2-28. . . . . . .  G1602 G1606
     1622   LEV-WRITE-GF-2-29. . . . . . .  G1615 G1619
     1284   LEV-WRITE-GF-2-3 . . . . . . .  G1277 G1281
     1635   LEV-WRITE-GF-2-30. . . . . . .  G1628 G1632
     1648   LEV-WRITE-GF-2-31. . . . . . .  G1641 G1645
     1661   LEV-WRITE-GF-2-32. . . . . . .  G1654 G1658
     1674   LEV-WRITE-GF-2-33. . . . . . .  G1667 G1671
     1687   LEV-WRITE-GF-2-34. . . . . . .  G1680 G1684
     1700   LEV-WRITE-GF-2-35. . . . . . .  G1693 G1697
     1713   LEV-WRITE-GF-2-36. . . . . . .  G1706 G1710
     1726   LEV-WRITE-GF-2-37. . . . . . .  G1719 G1723
     1739   LEV-WRITE-GF-2-38. . . . . . .  G1732 G1736
     1752   LEV-WRITE-GF-2-39. . . . . . .  G1745 G1749
     1297   LEV-WRITE-GF-2-4 . . . . . . .  G1290 G1294
     1765   LEV-WRITE-GF-2-40. . . . . . .  G1758 G1762
     1778   LEV-WRITE-GF-2-41. . . . . . .  G1771 G1775
     1791   LEV-WRITE-GF-2-42. . . . . . .  G1784 G1788
     1804   LEV-WRITE-GF-2-43. . . . . . .  G1797 G1801
     1817   LEV-WRITE-GF-2-44. . . . . . .  G1810 G1814
     1830   LEV-WRITE-GF-2-45. . . . . . .  G1823 G1827
     1843   LEV-WRITE-GF-2-46. . . . . . .  G1836 G1840
     1856   LEV-WRITE-GF-2-47. . . . . . .  G1849 G1853
     1869   LEV-WRITE-GF-2-48. . . . . . .  G1862 G1866
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    64
0 Defined   Cross-reference of procedures   References

0    1310   LEV-WRITE-GF-2-5 . . . . . . .  G1303 G1307
     1323   LEV-WRITE-GF-2-6 . . . . . . .  G1316 G1320
     1336   LEV-WRITE-GF-2-7 . . . . . . .  G1329 G1333
     1349   LEV-WRITE-GF-2-8 . . . . . . .  G1342 G1346
     1362   LEV-WRITE-GF-2-9 . . . . . . .  G1355 G1359
     1939   LEV-WRITE-GF-3-1 . . . . . . .  G1932 G1936
     2055   LEV-WRITE-GF-3-10. . . . . . .  G2048 G2052
     2068   LEV-WRITE-GF-3-11. . . . . . .  G2061 G2065
     2081   LEV-WRITE-GF-3-12. . . . . . .  G2074 G2078
     2094   LEV-WRITE-GF-3-13. . . . . . .  G2087 G2091
     2107   LEV-WRITE-GF-3-14. . . . . . .  G2100 G2104
     2120   LEV-WRITE-GF-3-15. . . . . . .  G2113 G2117
     2133   LEV-WRITE-GF-3-16. . . . . . .  G2126 G2130
     2146   LEV-WRITE-GF-3-17. . . . . . .  G2139 G2143
     2159   LEV-WRITE-GF-3-18. . . . . . .  G2152 G2156
     2172   LEV-WRITE-GF-3-19. . . . . . .  G2165 G2169
     1952   LEV-WRITE-GF-3-2 . . . . . . .  G1945 G1949
     2185   LEV-WRITE-GF-3-20. . . . . . .  G2178 G2182
     2198   LEV-WRITE-GF-3-21. . . . . . .  G2191 G2195
     2211   LEV-WRITE-GF-3-22. . . . . . .  G2204 G2208
     2224   LEV-WRITE-GF-3-23. . . . . . .  G2217 G2221
     2237   LEV-WRITE-GF-3-24. . . . . . .  G2230 G2234
     2250   LEV-WRITE-GF-3-25. . . . . . .  G2243 G2247
     2263   LEV-WRITE-GF-3-26. . . . . . .  G2256 G2260
     2276   LEV-WRITE-GF-3-27. . . . . . .  G2269 G2273
     2289   LEV-WRITE-GF-3-28. . . . . . .  G2282 G2286
     2302   LEV-WRITE-GF-3-29. . . . . . .  G2295 G2299
     1965   LEV-WRITE-GF-3-3 . . . . . . .  G1958 G1962
     2315   LEV-WRITE-GF-3-30. . . . . . .  G2308 G2312
     2328   LEV-WRITE-GF-3-31. . . . . . .  G2321 G2325
     2341   LEV-WRITE-GF-3-32. . . . . . .  G2334 G2338
     2354   LEV-WRITE-GF-3-33. . . . . . .  G2347 G2351
     2367   LEV-WRITE-GF-3-34. . . . . . .  G2360 G2364
     2380   LEV-WRITE-GF-3-35. . . . . . .  G2373 G2377
     2393   LEV-WRITE-GF-3-36. . . . . . .  G2386 G2390
     2406   LEV-WRITE-GF-3-37. . . . . . .  G2399 G2403
     2419   LEV-WRITE-GF-3-38. . . . . . .  G2412 G2416
     2432   LEV-WRITE-GF-3-39. . . . . . .  G2425 G2429
     1978   LEV-WRITE-GF-3-4 . . . . . . .  G1971 G1975
     2445   LEV-WRITE-GF-3-40. . . . . . .  G2438 G2442
     2458   LEV-WRITE-GF-3-41. . . . . . .  G2451 G2455
     2471   LEV-WRITE-GF-3-42. . . . . . .  G2464 G2468
     2484   LEV-WRITE-GF-3-43. . . . . . .  G2477 G2481
     2497   LEV-WRITE-GF-3-44. . . . . . .  G2490 G2494
     2510   LEV-WRITE-GF-3-45. . . . . . .  G2503 G2507
     2523   LEV-WRITE-GF-3-46. . . . . . .  G2516 G2520
     2536   LEV-WRITE-GF-3-47. . . . . . .  G2529 G2533
     2549   LEV-WRITE-GF-3-48. . . . . . .  G2542 G2546
     2562   LEV-WRITE-GF-3-49. . . . . . .  G2555 G2559
     1991   LEV-WRITE-GF-3-5 . . . . . . .  G1984 G1988
     2575   LEV-WRITE-GF-3-50. . . . . . .  G2568 G2572
     2004   LEV-WRITE-GF-3-6 . . . . . . .  G1997 G2001
     2017   LEV-WRITE-GF-3-7 . . . . . . .  G2010 G2014
     2029   LEV-WRITE-GF-3-8 . . . . . . .  G2023 G2026
     2042   LEV-WRITE-GF-3-9 . . . . . . .  G2035 G2039
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    65
0 Defined   Cross-reference of procedures   References

0     404   OPEN-FILES
      417   PASS . . . . . . . . . . . . .  P532 P547 P562 P577 P592 P607 P622 P637 P652 P667 P682 P697 P712 P727 P742 P757
                                            P772 P787 P802 P817 P832 P847 P862 P877 P892 P907 P922 P937 P952 P967 P982 P997
                                            P1012 P1027 P1042 P1057 P1072 P1087 P1102 P1117 P1132 P1147 P1162 P1177 P1192
                                            P1207 P1222 P1250 P1263 P1276 P1289 P1302 P1315 P1328 P1341 P1354 P1367 P1380
                                            P1393 P1406 P1419 P1432 P1445 P1458 P1471 P1484 P1497 P1510 P1523 P1536 P1549
                                            P1562 P1575 P1588 P1601 P1614 P1627 P1640 P1653 P1666 P1679 P1692 P1705 P1718
                                            P1731 P1744 P1757 P1770 P1783 P1796 P1809 P1822 P1835 P1848 P1861 P1931 P1944
                                            P1957 P1970 P1983 P1996 P2009 P2022 P2034 P2047 P2060 P2073 P2086 P2099 P2112
                                            P2125 P2138 P2151 P2164 P2177 P2190 P2203 P2216 P2229 P2242 P2255 P2268 P2281
                                            P2294 P2307 P2320 P2333 P2346 P2359 P2372 P2385 P2398 P2411 P2424 P2437 P2450
                                            P2463 P2476 P2489 P2502 P2515 P2528 P2541 P2554 P2567
      421   PRINT-DETAIL . . . . . . . . .  P526 P544 P559 P574 P589 P604 P619 P634 P649 P664 P679 P694 P709 P724 P739 P754
                                            P769 P784 P799 P814 P829 P844 P859 P874 P889 P904 P919 P934 P949 P964 P979 P994
                                            P1009 P1024 P1039 P1054 P1069 P1084 P1099 P1114 P1129 P1144 P1159 P1174 P1189
                                            P1204 P1219 P1234 P1240 P1260 P1273 P1286 P1299 P1312 P1325 P1338 P1351 P1364
                                            P1377 P1390 P1403 P1416 P1429 P1442 P1455 P1468 P1481 P1494 P1507 P1520 P1533
                                            P1546 P1559 P1572 P1585 P1598 P1611 P1624 P1637 P1650 P1663 P1676 P1689 P1702
                                            P1715 P1728 P1741 P1754 P1767 P1780 P1793 P1806 P1819 P1832 P1845 P1858 P1871
                                            P1877 P1941 P1954 P1967 P1980 P1993 P2006 P2019 P2031 P2044 P2057 P2070 P2083
                                            P2096 P2109 P2122 P2135 P2148 P2161 P2174 P2187 P2200 P2213 P2226 P2239 P2252
                                            P2265 P2278 P2291 P2304 P2317 P2330 P2343 P2356 P2369 P2382 P2395 P2408 P2421
                                            P2434 P2447 P2460 P2473 P2486 P2499 P2512 P2525 P2538 P2551 P2564 P2577 P2585
                                            P2590 P2595 P2600 P2605 P2610 P2615 P2620 P2625
      522   SECT-NC126A-001
      414   TERMINATE-CALL
      412   TERMINATE-CCVS
      475   WRITE-LINE . . . . . . . . . .  P425 P426 P434 P435 P436 P437 P439 P440 P441 P443 P445 P454 P462 P468 P473 P474
                                            P502 P506 P508 P517
      491   WRT-LN . . . . . . . . . . . .  P481 P482 P483 P484 P485 P486 P487 P490 P495
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    66
0 Defined   Cross-reference of programs     References

        3   NC126A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC126A    Date 06/04/2022  Time 12:00:50   Page    67
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC126A:
 *    Source records = 2633
 *    Data Division statements = 285
 *    Procedure Division statements = 1812
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1821
0End of compilation 1,  program NC126A,  highest severity 0.
0Return code 0
