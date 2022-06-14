1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:55   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:55   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2074.2
   000002         000200 PROGRAM-ID.                                                      NC2074.2
   000003         000300     NC207A.                                                      NC2074.2
   000004         000500*                                                              *  NC2074.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2074.2
   000006         000700*                                                              *  NC2074.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2074.2
   000008         000900*                                                              *  NC2074.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2074.2
   000010         001100*                                                              *  NC2074.2
   000011         001300*                                                              *  NC2074.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2074.2
   000013         001500*                                                              *  NC2074.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2074.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2074.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2074.2
   000017         001900*                                                              *  NC2074.2
   000018         002100*                                                              *  NC2074.2
   000019         002200*    PROGRAM NC207A TESTS THE USE OF FORMAT 1 QUALIFICATION    *  NC2074.2
   000020         002300*    USING FORMATS 1, 2 AND 3 OF THE "ADD" STATEMENT, FORMATS  *  NC2074.2
   000021         002400*    2 AND 3 OF THE "SUBTRACT" STATEMENT, FORMAT 2 OF THE      *  NC2074.2
   000022         002500*    "MULTIPLY" STATEMENT AND FORMAT 3 OF THE "DIVIDE"*           NC2074.2
   000023         002600*    STATEMENT.                                                *  NC2074.2
   000024         002700*    THE MAJORITY OF TESTST USE UP TO FIVE LEVELS OF           *  NC2074.2
   000025         002800*    QUALIFICATION BUT THE MINIMUM REQUIREMENT OF 49 LEVELS IN *  NC2074.2
   000026         002900*    THE NUCLEUS IS ALSO TESTED.                               *  NC2074.2
   000027         003000*                                                              *  NC2074.2
   000028         003200 ENVIRONMENT DIVISION.                                            NC2074.2
   000029         003300 CONFIGURATION SECTION.                                           NC2074.2
   000030         003400 SOURCE-COMPUTER.                                                 NC2074.2
   000031         003500     XXXXX082.                                                    NC2074.2
   000032         003600 OBJECT-COMPUTER.                                                 NC2074.2
   000033         003700     XXXXX083.                                                    NC2074.2
   000034         003800 INPUT-OUTPUT SECTION.                                            NC2074.2
   000035         003900 FILE-CONTROL.                                                    NC2074.2
   000036         004000     SELECT PRINT-FILE ASSIGN TO                                  NC2074.2 40
   000037         004100     XXXXX055.                                                    NC2074.2
   000038         004200 DATA DIVISION.                                                   NC2074.2
   000039         004300 FILE SECTION.                                                    NC2074.2
   000040         004400 FD  PRINT-FILE.                                                  NC2074.2

 ==000040==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000041         004500 01  PRINT-REC PICTURE X(120).                                    NC2074.2
   000042         004600 01  DUMMY-RECORD PICTURE X(120).                                 NC2074.2
   000043         004700 WORKING-STORAGE SECTION.                                         NC2074.2
   000044         004800 77  ACCUMULATOR1                PIC 9(18) VALUE ZERO.            NC2074.2 IMP
   000045         004900 77  ACCUMULATOR2                PIC 9(18) VALUE ZERO.            NC2074.2 IMP
   000046         005000 01  TABLE-LEVEL-5A.                                              NC2074.2
   000047         005100     02  TABLE-LEVEL-4A.                                          NC2074.2
   000048         005200         03  TABLE-LEVEL-3A.                                      NC2074.2
   000049         005300             04  TABLE-LEVEL-2A.                                  NC2074.2
   000050         005400                 05  TABLE-LEVEL-1A.                              NC2074.2
   000051         005500                     06  TBL-ITEM-1   PIC 9  VALUE 1.             NC2074.2
   000052         005600                 05  TABLE-LEVEL-1B.                              NC2074.2
   000053         005700                     06  TBL-ITEM-1   PIC 9(2)  VALUE 2.          NC2074.2
   000054         005800             04  TABLE-LEVEL-2B.                                  NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900                 05  TABLE-LEVEL-1A.                              NC2074.2
   000056         006000                     06  TBL-ITEM-1   PIC 9(3)  VALUE 3.          NC2074.2
   000057         006100                 05  TABLE-LEVEL-1B.                              NC2074.2
   000058         006200                     06  TBL-ITEM-1   PIC 9(4)  VALUE 4.          NC2074.2
   000059         006300         03  TABLE-LEVEL-3B.                                      NC2074.2
   000060         006400             04  TABLE-LEVEL-2A.                                  NC2074.2
   000061         006500                 05  TABLE-LEVEL-1A.                              NC2074.2
   000062         006600                     06  TBL-ITEM-1   PIC 9(5)  VALUE 5.          NC2074.2
   000063         006700                 05  TABLE-LEVEL-1B.                              NC2074.2
   000064         006800                     06  TBL-ITEM-1   PIC 9(6)  VALUE 6.          NC2074.2
   000065         006900             04  TABLE-LEVEL-2B.                                  NC2074.2
   000066         007000                 05  TABLE-LEVEL-1A.                              NC2074.2
   000067         007100                     06  TBL-ITEM-1   PIC 9(7)  VALUE 7.          NC2074.2
   000068         007200                 05  TABLE-LEVEL-1B.                              NC2074.2
   000069         007300                     06  TBL-ITEM-1   PIC 9(8)  VALUE 8.          NC2074.2
   000070         007400     02  TABLE-LEVEL-4B.                                          NC2074.2
   000071         007500         03  TABLE-LEVEL-3A.                                      NC2074.2
   000072         007600             04  TABLE-LEVEL-2A.                                  NC2074.2
   000073         007700                 05  TABLE-LEVEL-1A.                              NC2074.2
   000074         007800                     06  TBL-ITEM-1   PIC 9(9)  VALUE 9.          NC2074.2
   000075         007900                 05  TABLE-LEVEL-1B.                              NC2074.2
   000076         008000                     06  TBL-ITEM-1   PIC 9(10) VALUE 10.         NC2074.2
   000077         008100             04  TABLE-LEVEL-2B.                                  NC2074.2
   000078         008200                 05  TABLE-LEVEL-1A.                              NC2074.2
   000079         008300                     06  TBL-ITEM-1   PIC 9(11) VALUE 11.         NC2074.2
   000080         008400                 05  TABLE-LEVEL-1B.                              NC2074.2
   000081         008500                     06  TBL-ITEM-1   PIC 9(12) VALUE 12.         NC2074.2
   000082         008600         03  TABLE-LEVEL-3B.                                      NC2074.2
   000083         008700             04  TABLE-LEVEL-2A.                                  NC2074.2
   000084         008800                 05  TABLE-LEVEL-1A.                              NC2074.2
   000085         008900                     06  TBL-ITEM-1   PIC 9(13) VALUE 13.         NC2074.2
   000086         009000                 05  TABLE-LEVEL-1B.                              NC2074.2
   000087         009100                     06  TBL-ITEM-1   PIC 9(14) VALUE 14.         NC2074.2
   000088         009200             04  TABLE-LEVEL-2B.                                  NC2074.2
   000089         009300                 05  TABLE-LEVEL-1A.                              NC2074.2
   000090         009400                     06  TBL-ITEM-1   PIC 9(15) VALUE 15.         NC2074.2
   000091         009500                 05  TABLE-LEVEL-1B.                              NC2074.2
   000092         009600                     06  TBL-ITEM-1   PIC 9(16) VALUE 16.         NC2074.2
   000093         009700 01  TABLE-LEVEL-5B.                                              NC2074.2
   000094         009800     02  TABLE-LEVEL-4A.                                          NC2074.2
   000095         009900         03  TABLE-LEVEL-3A.                                      NC2074.2
   000096         010000             04  TABLE-LEVEL-2A.                                  NC2074.2
   000097         010100                 05  TABLE-LEVEL-1A.                              NC2074.2
   000098         010200                     06  TBL-ITEM-1   PIC 9(16) VALUE 16.         NC2074.2
   000099         010300                 05  TABLE-LEVEL-1B.                              NC2074.2
   000100         010400                     06  TBL-ITEM-1   PIC 9(15) VALUE 15.         NC2074.2
   000101         010500             04  TABLE-LEVEL-2B.                                  NC2074.2
   000102         010600                 05  TABLE-LEVEL-1A.                              NC2074.2
   000103         010700                     06  TBL-ITEM-1   PIC 9(14) VALUE 14.         NC2074.2
   000104         010800                 05  TABLE-LEVEL-1B.                              NC2074.2
   000105         010900                     06  TBL-ITEM-1   PIC 9(13) VALUE 13.         NC2074.2
   000106         011000         03  TABLE-LEVEL-3B.                                      NC2074.2
   000107         011100             04  TABLE-LEVEL-2A.                                  NC2074.2
   000108         011200                 05  TABLE-LEVEL-1A.                              NC2074.2
   000109         011300                     06  TBL-ITEM-1   PIC 9(12) VALUE 12.         NC2074.2
   000110         011400                 05  TABLE-LEVEL-1B.                              NC2074.2
   000111         011500                     06  TBL-ITEM-1   PIC 9(11) VALUE 11.         NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600             04  TABLE-LEVEL-2B.                                  NC2074.2
   000113         011700                 05  TABLE-LEVEL-1A.                              NC2074.2
   000114         011800                     06  TBL-ITEM-1   PIC 9(10) VALUE 10.         NC2074.2
   000115         011900                 05  TABLE-LEVEL-1B.                              NC2074.2
   000116         012000                     06  TBL-ITEM-1   PIC 9(9)  VALUE 9.          NC2074.2
   000117         012100     02  TABLE-LEVEL-4B.                                          NC2074.2
   000118         012200         03  TABLE-LEVEL-3A.                                      NC2074.2
   000119         012300             04  TABLE-LEVEL-2A.                                  NC2074.2
   000120         012400                 05  TABLE-LEVEL-1A.                              NC2074.2
   000121         012500                     06  TBL-ITEM-1   PIC 9(8)  VALUE 8.          NC2074.2
   000122         012600                 05  TABLE-LEVEL-1B.                              NC2074.2
   000123         012700                     06  TBL-ITEM-1   PIC 9(7)  VALUE 7.          NC2074.2
   000124         012800             04  TABLE-LEVEL-2B.                                  NC2074.2
   000125         012900                 05  TABLE-LEVEL-1A.                              NC2074.2
   000126         013000                     06  TBL-ITEM-1   PIC 9(6)  VALUE 6.          NC2074.2
   000127         013100                 05  TABLE-LEVEL-1B.                              NC2074.2
   000128         013200                     06  TBL-ITEM-1   PIC 9(5)  VALUE 5.          NC2074.2
   000129         013300         03  TABLE-LEVEL-3B.                                      NC2074.2
   000130         013400             04  TABLE-LEVEL-2A.                                  NC2074.2
   000131         013500                 05  TABLE-LEVEL-1A.                              NC2074.2
   000132         013600                     06  TBL-ITEM-1   PIC 9(4)  VALUE 4.          NC2074.2
   000133         013700                 05  TABLE-LEVEL-1B.                              NC2074.2
   000134         013800                     06  TBL-ITEM-1   PIC 9(3)  VALUE 3.          NC2074.2
   000135         013900             04  TABLE-LEVEL-2B.                                  NC2074.2
   000136         014000                 05  TABLE-LEVEL-1A.                              NC2074.2
   000137         014100                     06  TBL-ITEM-1   PIC 9(2)  VALUE 2.          NC2074.2
   000138         014200                 05  TABLE-LEVEL-1B.                              NC2074.2
   000139         014300                     06  TBL-ITEM-1   PIC 99 VALUE 1.             NC2074.2
   000140         014400                                                                  NC2074.2
   000141         014500 01  TABLE-LEVEL-5C.                                              NC2074.2
   000142         014600     02  TABLE-LEVEL-4A.                                          NC2074.2
   000143         014700         03  TABLE-LEVEL-3A.                                      NC2074.2
   000144         014800             04  TABLE-LEVEL-2A.                                  NC2074.2
   000145         014900                 05  TABLE-LEVEL-1A.                              NC2074.2
   000146         015000                     06  TBL-ITEM-1   PIC 9  VALUE 1.             NC2074.2
   000147         015100                 05  TABLE-LEVEL-1B.                              NC2074.2
   000148         015200                     06  TBL-ITEM-1   PIC 9(2)  VALUE  2.         NC2074.2
   000149         015300             04  TABLE-LEVEL-2B.                                  NC2074.2
   000150         015400                 05  TABLE-LEVEL-1A.                              NC2074.2
   000151         015500                     06  TBL-ITEM-1   PIC 9(3)  VALUE  3.         NC2074.2
   000152         015600                 05  TABLE-LEVEL-1B.                              NC2074.2
   000153         015700                     06  TBL-ITEM-1   PIC 9(4)  VALUE  4.         NC2074.2
   000154         015800         03  TABLE-LEVEL-3B.                                      NC2074.2
   000155         015900             04  TABLE-LEVEL-2A.                                  NC2074.2
   000156         016000                 05  TABLE-LEVEL-1A.                              NC2074.2
   000157         016100                     06  TBL-ITEM-1   PIC 9(5)  VALUE  5.         NC2074.2
   000158         016200                 05  TABLE-LEVEL-1B.                              NC2074.2
   000159         016300                     06  TBL-ITEM-1   PIC 9(6)  VALUE  6.         NC2074.2
   000160         016400             04  TABLE-LEVEL-2B.                                  NC2074.2
   000161         016500                 05  TABLE-LEVEL-1A.                              NC2074.2
   000162         016600                     06  TBL-ITEM-1   PIC 9(7)  VALUE  7.         NC2074.2
   000163         016700                 05  TABLE-LEVEL-1B.                              NC2074.2
   000164         016800                     06  TBL-ITEM-1   PIC 9(8)  VALUE  8.         NC2074.2
   000165         016900     02  TABLE-LEVEL-4B.                                          NC2074.2
   000166         017000         03  TABLE-LEVEL-3A.                                      NC2074.2
   000167         017100             04  TABLE-LEVEL-2A.                                  NC2074.2
   000168         017200                 05  TABLE-LEVEL-1A.                              NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300                     06  TBL-ITEM-1   PIC 9(9)  VALUE  9.         NC2074.2
   000170         017400                 05  TABLE-LEVEL-1B.                              NC2074.2
   000171         017500                     06  TBL-ITEM-1   PIC 9(10) VALUE 10.         NC2074.2
   000172         017600             04  TABLE-LEVEL-2B.                                  NC2074.2
   000173         017700                 05  TABLE-LEVEL-1A.                              NC2074.2
   000174         017800                     06  TBL-ITEM-1   PIC 9(11) VALUE 11.         NC2074.2
   000175         017900                 05  TABLE-LEVEL-1B.                              NC2074.2
   000176         018000                     06  TBL-ITEM-1   PIC 9(12) VALUE 12.         NC2074.2
   000177         018100         03  TABLE-LEVEL-3B.                                      NC2074.2
   000178         018200             04  TABLE-LEVEL-2A.                                  NC2074.2
   000179         018300                 05  TABLE-LEVEL-1A.                              NC2074.2
   000180         018400                     06  TBL-ITEM-1   PIC 9(13) VALUE 13.         NC2074.2
   000181         018500                 05  TABLE-LEVEL-1B.                              NC2074.2
   000182         018600                     06  TBL-ITEM-1   PIC 9(14) VALUE 14.         NC2074.2
   000183         018700             04  TABLE-LEVEL-2B.                                  NC2074.2
   000184         018800                 05  TABLE-LEVEL-1A.                              NC2074.2
   000185         018900                     06  TBL-ITEM-1   PIC 9(15) VALUE 15.         NC2074.2
   000186         019000                 05  TABLE-LEVEL-1B.                              NC2074.2
   000187         019100                     06  TBL-ITEM-1   PIC 9(16) VALUE 16.         NC2074.2
   000188         019200 01  TABLE-5B-INIT.                                               NC2074.2
   000189         019300     02 FILLER         PIC 9(16)  VALUE  16.                      NC2074.2
   000190         019400     02 FILLER         PIC 9(15)  VALUE  15.                      NC2074.2
   000191         019500     02 FILLER         PIC 9(14)  VALUE  14.                      NC2074.2
   000192         019600     02 FILLER         PIC 9(13)  VALUE  13.                      NC2074.2
   000193         019700     02 FILLER         PIC 9(12)  VALUE  12.                      NC2074.2
   000194         019800     02 FILLER         PIC 9(11)  VALUE  11.                      NC2074.2
   000195         019900     02 FILLER         PIC 9(10)  VALUE  10.                      NC2074.2
   000196         020000     02 FILLER         PIC 9(9)   VALUE  9.                       NC2074.2
   000197         020100     02 FILLER         PIC 9(8)   VALUE  8.                       NC2074.2
   000198         020200     02 FILLER         PIC 9(7)   VALUE  7.                       NC2074.2
   000199         020300     02 FILLER         PIC 9(6)   VALUE  6.                       NC2074.2
   000200         020400     02 FILLER         PIC 9(5)   VALUE  5.                       NC2074.2
   000201         020500     02 FILLER         PIC 9(4)   VALUE  4.                       NC2074.2
   000202         020600     02 FILLER         PIC 9(3)   VALUE  3.                       NC2074.2
   000203         020700     02 FILLER         PIC 9(2)   VALUE  2.                       NC2074.2
   000204         020800     02 FILLER         PIC 9(2)   VALUE  1.                       NC2074.2
   000205         020900 01  FIRST-GROUP.                                                 NC2074.2
   000206         021000  02 GROUP-02.                                                    NC2074.2
   000207         021100   03 GROUP-03.                                                   NC2074.2
   000208         021200    04 GROUP-04.                                                  NC2074.2
   000209         021300     05 GROUP-05.                                                 NC2074.2
   000210         021400      06 GROUP-06.                                                NC2074.2
   000211         021500       07 GROUP-07.                                               NC2074.2
   000212         021600        08 GROUP-08.                                              NC2074.2
   000213         021700         09 GROUP-09.                                             NC2074.2
   000214         021800          10 GROUP-10.                                            NC2074.2
   000215         021900           11 GROUP-11.                                           NC2074.2
   000216         022000            12 GROUP-12.                                          NC2074.2
   000217         022100             13 GROUP-13.                                         NC2074.2
   000218         022200              14 GROUP-14.                                        NC2074.2
   000219         022300               15 GROUP-15.                                       NC2074.2
   000220         022400                16 GROUP-16.                                      NC2074.2
   000221         022500                 17 GROUP-17.                                     NC2074.2
   000222         022600                  18 GROUP-18.                                    NC2074.2
   000223         022700                   19 GROUP-19.                                   NC2074.2
   000224         022800                    20 GROUP-20.                                  NC2074.2
   000225         022900                     21 GROUP-21.                                 NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000                      22 GROUP-22.                                NC2074.2
   000227         023100                       23 GROUP-23.                               NC2074.2
   000228         023200                        24 GROUP-24.                              NC2074.2
   000229         023300                         25 GROUP-25.                             NC2074.2
   000230         023400                          26 GROUP-26.                            NC2074.2
   000231         023500                           27 GROUP-27.                           NC2074.2
   000232         023600                            28 GROUP-28.                          NC2074.2
   000233         023700                             29 GROUP-29.                         NC2074.2
   000234         023800                              30 GROUP-30.                        NC2074.2
   000235         023900                               31 GROUP-31.                       NC2074.2
   000236         024000                                32 GROUP-32.                      NC2074.2
   000237         024100                                 33 GROUP-33.                     NC2074.2
   000238         024200                                  34 GROUP-34.                    NC2074.2
   000239         024300                                   35 GROUP-35.                   NC2074.2
   000240         024400                                    36 GROUP-36.                  NC2074.2
   000241         024500                                     37 GROUP-37.                 NC2074.2
   000242         024600                                      38 GROUP-38.                NC2074.2
   000243         024700                                       39 GROUP-39.               NC2074.2
   000244         024800                                        40 GROUP-40.              NC2074.2
   000245         024900                                         41 GROUP-41.             NC2074.2
   000246         025000                                          42 GROUP-42.            NC2074.2
   000247         025100                                           43 GROUP-43.           NC2074.2
   000248         025200                                            44 GROUP-44.          NC2074.2
   000249         025300                                             45 GROUP-45.         NC2074.2
   000250         025400                                              46 GROUP-46.        NC2074.2
   000251         025500                                               47 GROUP-47.       NC2074.2
   000252         025600                                                48 GROUP-48.      NC2074.2
   000253         025700                   49 GROUP-49-1  PIC 9(4)           VALUE 1.     NC2074.2
   000254         025800                   49 GROUP-49-2  PIC S9(3)  COMP    VALUE 2.     NC2074.2
   000255         025900                   49 GROUP-49-3  PIC S9(15) COMP    VALUE 3.     NC2074.2
   000256         026000                   49 GROUP-49-4  PIC S9(8)  COMP    VALUE 4.     NC2074.2
   000257         026100                   49 GROUP-49-5  PIC 9(8)           VALUE 5.     NC2074.2
   000258         026200 01  SECOND-GROUP.                                                NC2074.2
   000259         026300  02 GROUP-02.                                                    NC2074.2
   000260         026400   03 GROUP-03.                                                   NC2074.2
   000261         026500    04 GROUP-04.                                                  NC2074.2
   000262         026600     05 GROUP-05.                                                 NC2074.2
   000263         026700      06 GROUP-06.                                                NC2074.2
   000264         026800       07 GROUP-07.                                               NC2074.2
   000265         026900        08 GROUP-08.                                              NC2074.2
   000266         027000         09 GROUP-09.                                             NC2074.2
   000267         027100          10 GROUP-10.                                            NC2074.2
   000268         027200           11 GROUP-11.                                           NC2074.2
   000269         027300            12 GROUP-12.                                          NC2074.2
   000270         027400             13 GROUP-13.                                         NC2074.2
   000271         027500              14 GROUP-14.                                        NC2074.2
   000272         027600               15 GROUP-15.                                       NC2074.2
   000273         027700                16 GROUP-16.                                      NC2074.2
   000274         027800                 17 GROUP-17.                                     NC2074.2
   000275         027900                  18 GROUP-18.                                    NC2074.2
   000276         028000                   19 GROUP-19.                                   NC2074.2
   000277         028100                    20 GROUP-20.                                  NC2074.2
   000278         028200                     21 GROUP-21.                                 NC2074.2
   000279         028300                      22 GROUP-22.                                NC2074.2
   000280         028400                       23 GROUP-23.                               NC2074.2
   000281         028500                        24 GROUP-24.                              NC2074.2
   000282         028600                         25 GROUP-25.                             NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700                          26 GROUP-26.                            NC2074.2
   000284         028800                           27 GROUP-27.                           NC2074.2
   000285         028900                            28 GROUP-28.                          NC2074.2
   000286         029000                             29 GROUP-29.                         NC2074.2
   000287         029100                              30 GROUP-30.                        NC2074.2
   000288         029200                               31 GROUP-31.                       NC2074.2
   000289         029300                                32 GROUP-32.                      NC2074.2
   000290         029400                                 33 GROUP-33.                     NC2074.2
   000291         029500                                  34 GROUP-34.                    NC2074.2
   000292         029600                                   35 GROUP-35.                   NC2074.2
   000293         029700                                    36 GROUP-36.                  NC2074.2
   000294         029800                                     37 GROUP-37.                 NC2074.2
   000295         029900                                      38 GROUP-38.                NC2074.2
   000296         030000                                       39 GROUP-39.               NC2074.2
   000297         030100                                        40 GROUP-40.              NC2074.2
   000298         030200                                         41 GROUP-41.             NC2074.2
   000299         030300                                          42 GROUP-42.            NC2074.2
   000300         030400                                           43 GROUP-43.           NC2074.2
   000301         030500                                            44 GROUP-44.          NC2074.2
   000302         030600                                             45 GROUP-45.         NC2074.2
   000303         030700                                              46 GROUP-46.        NC2074.2
   000304         030800                                               47 GROUP-47.       NC2074.2
   000305         030900                                                48 GROUP-48.      NC2074.2
   000306         031000                   49 GROUP-49-1  PIC 9(4)           VALUE 100.   NC2074.2
   000307         031100                   49 GROUP-49-2  PIC S9(3)  COMP    VALUE 200.   NC2074.2
   000308         031200                   49 GROUP-49-3  PIC S9(15) COMP    VALUE 300.   NC2074.2
   000309         031300                   49 GROUP-49-4  PIC S9(8)  COMP    VALUE 400.   NC2074.2
   000310         031400                   49 GROUP-49-5  PIC 9(8)           VALUE 500.   NC2074.2
   000311         031500                     88 LEVEL-49-OK VALUE 500.                    NC2074.2
   000312         031600 01  TEST-RESULTS.                                                NC2074.2
   000313         031700     02 FILLER                   PIC X      VALUE SPACE.          NC2074.2 IMP
   000314         031800     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2074.2 IMP
   000315         031900     02 FILLER                   PIC X      VALUE SPACE.          NC2074.2 IMP
   000316         032000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2074.2 IMP
   000317         032100     02 FILLER                   PIC X      VALUE SPACE.          NC2074.2 IMP
   000318         032200     02  PAR-NAME.                                                NC2074.2
   000319         032300       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2074.2 IMP
   000320         032400       03  PARDOT-X              PIC X      VALUE SPACE.          NC2074.2 IMP
   000321         032500       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2074.2 IMP
   000322         032600     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2074.2 IMP
   000323         032700     02 RE-MARK                  PIC X(61).                       NC2074.2
   000324         032800 01  TEST-COMPUTED.                                               NC2074.2
   000325         032900     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2074.2 IMP
   000326         033000     02 FILLER                   PIC X(17)  VALUE                 NC2074.2
   000327         033100            "       COMPUTED=".                                   NC2074.2
   000328         033200     02 COMPUTED-X.                                               NC2074.2
   000329         033300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2074.2 IMP
   000330         033400     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2074.2 329
   000331         033500                                 PIC -9(9).9(9).                  NC2074.2
   000332         033600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2074.2 329
   000333         033700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2074.2 329
   000334         033800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2074.2 329
   000335         033900     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2074.2 329
   000336         034000         04 COMPUTED-18V0                    PIC -9(18).          NC2074.2
   000337         034100         04 FILLER                           PIC X.               NC2074.2
   000338         034200     03 FILLER PIC X(50) VALUE SPACE.                             NC2074.2 IMP
   000339         034300 01  TEST-CORRECT.                                                NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     02 FILLER PIC X(30) VALUE SPACE.                             NC2074.2 IMP
   000341         034500     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2074.2
   000342         034600     02 CORRECT-X.                                                NC2074.2
   000343         034700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2074.2 IMP
   000344         034800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2074.2 343
   000345         034900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2074.2 343
   000346         035000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2074.2 343
   000347         035100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2074.2 343
   000348         035200     03      CR-18V0 REDEFINES CORRECT-A.                         NC2074.2 343
   000349         035300         04 CORRECT-18V0                     PIC -9(18).          NC2074.2
   000350         035400         04 FILLER                           PIC X.               NC2074.2
   000351         035500     03 FILLER PIC X(2) VALUE SPACE.                              NC2074.2 IMP
   000352         035600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2074.2 IMP
   000353         035700 01  CCVS-C-1.                                                    NC2074.2
   000354         035800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2074.2
   000355         035900-    "SS  PARAGRAPH-NAME                                          NC2074.2
   000356         036000-    "       REMARKS".                                            NC2074.2
   000357         036100     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2074.2 IMP
   000358         036200 01  CCVS-C-2.                                                    NC2074.2
   000359         036300     02 FILLER                     PIC X        VALUE SPACE.      NC2074.2 IMP
   000360         036400     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2074.2
   000361         036500     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2074.2 IMP
   000362         036600     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2074.2
   000363         036700     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2074.2 IMP
   000364         036800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2074.2 IMP
   000365         036900 01  REC-CT                        PIC 99       VALUE ZERO.       NC2074.2 IMP
   000366         037000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2074.2 IMP
   000367         037100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2074.2 IMP
   000368         037200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2074.2 IMP
   000369         037300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2074.2 IMP
   000370         037400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2074.2 IMP
   000371         037500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2074.2 IMP
   000372         037600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2074.2 IMP
   000373         037700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2074.2 IMP
   000374         037800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2074.2 IMP
   000375         037900 01  CCVS-H-1.                                                    NC2074.2
   000376         038000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2074.2 IMP
   000377         038100     02  FILLER                    PIC X(42)    VALUE             NC2074.2
   000378         038200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2074.2
   000379         038300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2074.2 IMP
   000380         038400 01  CCVS-H-2A.                                                   NC2074.2
   000381         038500   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2074.2 IMP
   000382         038600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2074.2
   000383         038700   02  FILLER                        PIC XXXX   VALUE             NC2074.2
   000384         038800     "4.2 ".                                                      NC2074.2
   000385         038900   02  FILLER                        PIC X(28)  VALUE             NC2074.2
   000386         039000            " COPY - NOT FOR DISTRIBUTION".                       NC2074.2
   000387         039100   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2074.2 IMP
   000388         039200                                                                  NC2074.2
   000389         039300 01  CCVS-H-2B.                                                   NC2074.2
   000390         039400   02  FILLER                        PIC X(15)  VALUE             NC2074.2
   000391         039500            "TEST RESULT OF ".                                    NC2074.2
   000392         039600   02  TEST-ID                       PIC X(9).                    NC2074.2
   000393         039700   02  FILLER                        PIC X(4)   VALUE             NC2074.2
   000394         039800            " IN ".                                               NC2074.2
   000395         039900   02  FILLER                        PIC X(12)  VALUE             NC2074.2
   000396         040000     " HIGH       ".                                              NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100   02  FILLER                        PIC X(22)  VALUE             NC2074.2
   000398         040200            " LEVEL VALIDATION FOR ".                             NC2074.2
   000399         040300   02  FILLER                        PIC X(58)  VALUE             NC2074.2
   000400         040400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2074.2
   000401         040500 01  CCVS-H-3.                                                    NC2074.2
   000402         040600     02  FILLER                      PIC X(34)  VALUE             NC2074.2
   000403         040700            " FOR OFFICIAL USE ONLY    ".                         NC2074.2
   000404         040800     02  FILLER                      PIC X(58)  VALUE             NC2074.2
   000405         040900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2074.2
   000406         041000     02  FILLER                      PIC X(28)  VALUE             NC2074.2
   000407         041100            "  COPYRIGHT   1985 ".                                NC2074.2
   000408         041200 01  CCVS-E-1.                                                    NC2074.2
   000409         041300     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2074.2 IMP
   000410         041400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2074.2
   000411         041500     02 ID-AGAIN                     PIC X(9).                    NC2074.2
   000412         041600     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2074.2 IMP
   000413         041700 01  CCVS-E-2.                                                    NC2074.2
   000414         041800     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2074.2 IMP
   000415         041900     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2074.2 IMP
   000416         042000     02 CCVS-E-2-2.                                               NC2074.2
   000417         042100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2074.2 IMP
   000418         042200         03 FILLER                   PIC X      VALUE SPACE.      NC2074.2 IMP
   000419         042300         03 ENDER-DESC               PIC X(44)  VALUE             NC2074.2
   000420         042400            "ERRORS ENCOUNTERED".                                 NC2074.2
   000421         042500 01  CCVS-E-3.                                                    NC2074.2
   000422         042600     02  FILLER                      PIC X(22)  VALUE             NC2074.2
   000423         042700            " FOR OFFICIAL USE ONLY".                             NC2074.2
   000424         042800     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2074.2 IMP
   000425         042900     02  FILLER                      PIC X(58)  VALUE             NC2074.2
   000426         043000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2074.2
   000427         043100     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2074.2 IMP
   000428         043200     02 FILLER                       PIC X(15)  VALUE             NC2074.2
   000429         043300             " COPYRIGHT 1985".                                   NC2074.2
   000430         043400 01  CCVS-E-4.                                                    NC2074.2
   000431         043500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2074.2 IMP
   000432         043600     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2074.2
   000433         043700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2074.2 IMP
   000434         043800     02 FILLER                       PIC X(40)  VALUE             NC2074.2
   000435         043900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2074.2
   000436         044000 01  XXINFO.                                                      NC2074.2
   000437         044100     02 FILLER                       PIC X(19)  VALUE             NC2074.2
   000438         044200            "*** INFORMATION ***".                                NC2074.2
   000439         044300     02 INFO-TEXT.                                                NC2074.2
   000440         044400       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2074.2 IMP
   000441         044500       04 XXCOMPUTED                 PIC X(20).                   NC2074.2
   000442         044600       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2074.2 IMP
   000443         044700       04 XXCORRECT                  PIC X(20).                   NC2074.2
   000444         044800     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2074.2
   000445         044900 01  HYPHEN-LINE.                                                 NC2074.2
   000446         045000     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2074.2 IMP
   000447         045100     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2074.2
   000448         045200-    "*****************************************".                 NC2074.2
   000449         045300     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2074.2
   000450         045400-    "******************************".                            NC2074.2
   000451         045500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2074.2
   000452         045600     "NC207".                                                     NC2074.2
   000453         045700 PROCEDURE DIVISION.                                              NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800 CCVS1 SECTION.                                                   NC2074.2
   000455         045900 OPEN-FILES.                                                      NC2074.2
   000456         046000     OPEN     OUTPUT PRINT-FILE.                                  NC2074.2 40
   000457         046100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2074.2 451 392 451 411
   000458         046200     MOVE    SPACE TO TEST-RESULTS.                               NC2074.2 IMP 312
   000459         046300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2074.2 484 489
   000460         046400     GO TO CCVS1-EXIT.                                            NC2074.2 566
   000461         046500 CLOSE-FILES.                                                     NC2074.2
   000462         046600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2074.2 493 514 40
   000463         046700 TERMINATE-CCVS.                                                  NC2074.2
   000464         046800     EXIT PROGRAM.                                                NC2074.2
   000465         046900 TERMINATE-CALL.                                                  NC2074.2
   000466         047000     STOP     RUN.                                                NC2074.2
   000467         047100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2074.2 316 368
   000468         047200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2074.2 316 369
   000469         047300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2074.2 316 367
   000470         047400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2074.2 316 366
   000471         047500     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2074.2 323
   000472         047600 PRINT-DETAIL.                                                    NC2074.2
   000473         047700     IF REC-CT NOT EQUAL TO ZERO                                  NC2074.2 365 IMP
   000474      1  047800             MOVE "." TO PARDOT-X                                 NC2074.2 320
   000475      1  047900             MOVE REC-CT TO DOTVALUE.                             NC2074.2 365 321
   000476         048000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2074.2 312 41 526
   000477         048100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2074.2 316 526
   000478      1  048200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2074.2 543 556
   000479      1  048300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2074.2 557 565
   000480         048400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2074.2 IMP 316 IMP 328
   000481         048500     MOVE SPACE TO CORRECT-X.                                     NC2074.2 IMP 342
   000482         048600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2074.2 365 IMP IMP 318
   000483         048700     MOVE     SPACE TO RE-MARK.                                   NC2074.2 IMP 323
   000484         048800 HEAD-ROUTINE.                                                    NC2074.2
   000485         048900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2074.2 375 42 526
   000486         049000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2074.2 380 42 526
   000487         049100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2074.2 389 42 526
   000488         049200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2074.2 401 42 526
   000489         049300 COLUMN-NAMES-ROUTINE.                                            NC2074.2
   000490         049400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2074.2 353 42 526
   000491         049500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2074.2 358 42 526
   000492         049600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2074.2 445 42 526
   000493         049700 END-ROUTINE.                                                     NC2074.2
   000494         049800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2074.2 445 42 526
   000495         049900 END-RTN-EXIT.                                                    NC2074.2
   000496         050000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2074.2 408 42 526
   000497         050100 END-ROUTINE-1.                                                   NC2074.2
   000498         050200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2074.2 367 371 368
   000499         050300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2074.2 371 366 371
   000500         050400      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2074.2 369 371
   000501         050500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2074.2
   000502         050600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2074.2 369 431
   000503         050700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2074.2 371 433
   000504         050800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2074.2 430 416
   000505         050900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2074.2 413 42 526
   000506         051000  END-ROUTINE-12.                                                 NC2074.2
   000507         051100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2074.2 419
   000508         051200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2074.2 367 IMP
   000509      1  051300         MOVE "NO " TO ERROR-TOTAL                                NC2074.2 417
   000510         051400         ELSE                                                     NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  051500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2074.2 367 417
   000512         051600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2074.2 413 42
   000513         051700     PERFORM WRITE-LINE.                                          NC2074.2 526
   000514         051800 END-ROUTINE-13.                                                  NC2074.2
   000515         051900     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2074.2 366 IMP
   000516      1  052000         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2074.2 417
   000517      1  052100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2074.2 366 417
   000518         052200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2074.2 419
   000519         052300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2074.2 413 42 526
   000520         052400      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2074.2 368 IMP
   000521      1  052500          MOVE "NO " TO ERROR-TOTAL                               NC2074.2 417
   000522      1  052600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2074.2 368 417
   000523         052700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2074.2 419
   000524         052800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2074.2 413 42 526
   000525         052900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2074.2 421 42 526
   000526         053000 WRITE-LINE.                                                      NC2074.2
   000527         053100     ADD 1 TO RECORD-COUNT.                                       NC2074.2 373
   000528         053200     IF RECORD-COUNT GREATER 50                                   NC2074.2 373
   000529      1  053300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2074.2 42 372
   000530      1  053400         MOVE SPACE TO DUMMY-RECORD                               NC2074.2 IMP 42
   000531      1  053500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2074.2 42
   000532      1  053600         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2074.2 353 42 538
   000533      1  053700         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2074.2 358 42 538
   000534      1  053800         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2074.2 445 42 538
   000535      1  053900         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2074.2 372 42
   000536      1  054000         MOVE ZERO TO RECORD-COUNT.                               NC2074.2 IMP 373
   000537         054100     PERFORM WRT-LN.                                              NC2074.2 538
   000538         054200 WRT-LN.                                                          NC2074.2
   000539         054300     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2074.2 42
   000540         054400     MOVE SPACE TO DUMMY-RECORD.                                  NC2074.2 IMP 42
   000541         054500 BLANK-LINE-PRINT.                                                NC2074.2
   000542         054600     PERFORM WRT-LN.                                              NC2074.2 538
   000543         054700 FAIL-ROUTINE.                                                    NC2074.2
   000544         054800     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2074.2 328 IMP 551
   000545         054900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2074.2 342 IMP 551
   000546         055000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2074.2 374 444
   000547         055100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2074.2 439
   000548         055200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2074.2 436 42 526
   000549         055300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2074.2 IMP 444
   000550         055400     GO TO  FAIL-ROUTINE-EX.                                      NC2074.2 556
   000551         055500 FAIL-ROUTINE-WRITE.                                              NC2074.2
   000552         055600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2074.2 324 41 526
   000553         055700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2074.2 374 352
   000554         055800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2074.2 339 41 526
   000555         055900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2074.2 IMP 352
   000556         056000 FAIL-ROUTINE-EX. EXIT.                                           NC2074.2
   000557         056100 BAIL-OUT.                                                        NC2074.2
   000558         056200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2074.2 329 IMP 560
   000559         056300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2074.2 343 IMP 565
   000560         056400 BAIL-OUT-WRITE.                                                  NC2074.2
   000561         056500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2074.2 343 443 329 441
   000562         056600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2074.2 374 444
   000563         056700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2074.2 436 42 526
   000564         056800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2074.2 IMP 444
   000565         056900 BAIL-OUT-EX. EXIT.                                               NC2074.2
   000566         057000 CCVS1-EXIT.                                                      NC2074.2
   000567         057100     EXIT.                                                        NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200 SECT-NC207A-001 SECTION.                                         NC2074.2
   000569         057300 ADD-INIT-F1-1.                                                   NC2074.2
   000570         057400     MOVE "ADD-TEST-F1-1 " TO PAR-NAME.                           NC2074.2 318
   000571         057500     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000572         057600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000573         057700     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   000574         057800 ADD-TEST-F1-1.                                                   NC2074.2
   000575         057900     ADD TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF        NC2074.2 51 50 49
   000576         058000         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   000577         058100         TO ACCUMULATOR1.                                         NC2074.2 44
   000578         058200     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
   000579      1  058300         PERFORM PASS                                             NC2074.2 468
   000580      1  058400         GO TO ADD-WRITE-F1-1.                                    NC2074.2 591
   000581         058500     GO TO ADD-FAIL-F1-1.                                         NC2074.2 585
   000582         058600 ADD-DELETE-F1-1.                                                 NC2074.2
   000583         058700     PERFORM DE-LETE.                                             NC2074.2 470
   000584         058800     GO TO ADD-WRITE-F1-1.                                        NC2074.2 591
   000585         058900 ADD-FAIL-F1-1.                                                   NC2074.2
   000586         059000     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   000587         059100     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2074.2 51 50 49
   000588         059200         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   000589         059300         TO COMPUTED-N.                                           NC2074.2 330
   000590         059400     PERFORM FAIL.                                                NC2074.2 469
   000591         059500 ADD-WRITE-F1-1.                                                  NC2074.2
   000592         059600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000593         059700*                                                                 NC2074.2
   000594         059800 ADD-INIT-F1-2.                                                   NC2074.2
   000595         059900     MOVE "ADD-TEST-F1-2 " TO PAR-NAME.                           NC2074.2 318
   000596         060000     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000597         060100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000598         060200     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   000599         060300 ADD-TEST-F1-2.                                                   NC2074.2
   000600         060400     ADD TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A OF        NC2074.2 53 52 49
   000601         060500         TABLE-LEVEL-3A OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2074.2 48 47 46
   000602         060600         ACCUMULATOR1.                                            NC2074.2 44
   000603         060700     IF ACCUMULATOR1 EQUAL TO 2                                   NC2074.2 44
   000604      1  060800         PERFORM PASS                                             NC2074.2 468
   000605      1  060900         GO TO ADD-WRITE-F1-2.                                    NC2074.2 616
   000606         061000     GO TO ADD-FAIL-F1-2.                                         NC2074.2 610
   000607         061100 ADD-DELETE-F1-2.                                                 NC2074.2
   000608         061200     PERFORM DE-LETE.                                             NC2074.2 470
   000609         061300     GO TO ADD-WRITE-F1-2.                                        NC2074.2 616
   000610         061400 ADD-FAIL-F1-2.                                                   NC2074.2
   000611         061500     MOVE 2 TO CORRECT-N.                                         NC2074.2 344
   000612         061600     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A OF       NC2074.2 53 52 49
   000613         061700         TABLE-LEVEL-3A OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2074.2 48 47 46
   000614         061800         COMPUTED-N.                                              NC2074.2 330
   000615         061900     PERFORM FAIL.                                                NC2074.2 469
   000616         062000 ADD-WRITE-F1-2.                                                  NC2074.2
   000617         062100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000618         062200*                                                                 NC2074.2
   000619         062300 ADD-INIT-F1-3.                                                   NC2074.2
   000620         062400     MOVE "ADD-TEST-F1-3 " TO PAR-NAME.                           NC2074.2 318
   000621         062500     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000622         062600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000623         062700     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   000624         062800 ADD-TEST-F1-3.                                                   NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     ADD TBL-ITEM-1 IN TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN        NC2074.2 56 55 54
   000626         063000         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2074.2 48 47 46
   000627         063100         ACCUMULATOR1.                                            NC2074.2 44
   000628         063200     IF ACCUMULATOR1 EQUAL TO 3                                   NC2074.2 44
   000629      1  063300         PERFORM PASS                                             NC2074.2 468
   000630      1  063400         GO TO ADD-WRITE-F1-3.                                    NC2074.2 641
   000631         063500     GO TO ADD-FAIL-F1-3.                                         NC2074.2 635
   000632         063600 ADD-DELETE-F1-3.                                                 NC2074.2
   000633         063700     PERFORM DE-LETE.                                             NC2074.2 470
   000634         063800     GO TO ADD-WRITE-F1-3.                                        NC2074.2 641
   000635         063900 ADD-FAIL-F1-3.                                                   NC2074.2
   000636         064000     MOVE TBL-ITEM-1 IN TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN       NC2074.2 56 55 54
   000637         064100         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2074.2 48 47 46
   000638         064200         COMPUTED-N.                                              NC2074.2 330
   000639         064300     MOVE 3 TO CORRECT-N.                                         NC2074.2 344
   000640         064400     PERFORM FAIL.                                                NC2074.2 469
   000641         064500 ADD-WRITE-F1-3.                                                  NC2074.2
   000642         064600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000643         064700*                                                                 NC2074.2
   000644         064800 ADD-INIT-F1-4.                                                   NC2074.2
   000645         064900     MOVE "ADD-TEST-F1-4 " TO PAR-NAME.                           NC2074.2 318
   000646         065000     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000647         065100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000648         065200     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   000649         065300 ADD-TEST-F1-4.                                                   NC2074.2
   000650         065400     ADD TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF        NC2074.2 58 57 54
   000651         065500         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2074.2 48 47 46
   000652         065600         ACCUMULATOR1.                                            NC2074.2 44
   000653         065700     IF ACCUMULATOR1 EQUAL TO 4                                   NC2074.2 44
   000654      1  065800         PERFORM PASS                                             NC2074.2 468
   000655      1  065900         GO TO ADD-WRITE-F1-4.                                    NC2074.2 666
   000656         066000     GO TO ADD-FAIL-F1-4.                                         NC2074.2 660
   000657         066100 ADD-DELETE-F1-4.                                                 NC2074.2
   000658         066200     PERFORM DE-LETE.                                             NC2074.2 470
   000659         066300     GO TO ADD-WRITE-F1-4.                                        NC2074.2 666
   000660         066400 ADD-FAIL-F1-4.                                                   NC2074.2
   000661         066500     MOVE 4 TO CORRECT-N.                                         NC2074.2 344
   000662         066600     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2074.2 58 57 54
   000663         066700         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2074.2 48 47 46
   000664         066800         COMPUTED-N.                                              NC2074.2 330
   000665         066900     PERFORM FAIL.                                                NC2074.2 469
   000666         067000 ADD-WRITE-F1-4.                                                  NC2074.2
   000667         067100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000668         067200*                                                                 NC2074.2
   000669         067300 ADD-INIT-F1-5.                                                   NC2074.2
   000670         067400     MOVE "ADD-TEST-F1-5 " TO PAR-NAME.                           NC2074.2 318
   000671         067500     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000672         067600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000673         067700     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   000674         067800 ADD-TEST-F1-5.                                                   NC2074.2
   000675         067900     ADD TBL-ITEM-1 OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF        NC2074.2 62 61 60
   000676         068000         TABLE-LEVEL-3B OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2074.2 59 47 46
   000677         068100         ACCUMULATOR1.                                            NC2074.2 44
   000678         068200     IF ACCUMULATOR1 EQUAL TO 5                                   NC2074.2 44
   000679      1  068300         PERFORM PASS                                             NC2074.2 468
   000680      1  068400         GO TO ADD-WRITE-F1-5.                                    NC2074.2 691
   000681         068500     GO TO ADD-FAIL-F1-5.                                         NC2074.2 685
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600 ADD-DELETE-F1-5.                                                 NC2074.2
   000683         068700     PERFORM DE-LETE.                                             NC2074.2 470
   000684         068800     GO TO ADD-WRITE-F1-5.                                        NC2074.2 691
   000685         068900 ADD-FAIL-F1-5.                                                   NC2074.2
   000686         069000     MOVE 5 TO CORRECT-N.                                         NC2074.2 344
   000687         069100     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF       NC2074.2 62 61 60
   000688         069200         TABLE-LEVEL-3B OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2074.2 59 47 46
   000689         069300         COMPUTED-N.                                              NC2074.2 330
   000690         069400     PERFORM FAIL.                                                NC2074.2 469
   000691         069500 ADD-WRITE-F1-5.                                                  NC2074.2
   000692         069600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000693         069700*                                                                 NC2074.2
   000694         069800 ADD-INIT-F1-6.                                                   NC2074.2
   000695         069900     MOVE "ADD-TEST-F1-6 " TO PAR-NAME.                           NC2074.2 318
   000696         070000     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000697         070100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000698         070200     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   000699         070300 ADD-TEST-F1-6.                                                   NC2074.2
   000700         070400     ADD TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN        NC2074.2 64 63 60
   000701         070500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2074.2 59 47 46
   000702         070600         ACCUMULATOR1.                                            NC2074.2 44
   000703         070700     IF ACCUMULATOR1 EQUAL TO 6                                   NC2074.2 44
   000704      1  070800         PERFORM PASS                                             NC2074.2 468
   000705      1  070900         GO TO ADD-WRITE-F1-6.                                    NC2074.2 716
   000706         071000     GO TO ADD-FAIL-F1-6.                                         NC2074.2 710
   000707         071100 ADD-DELETE-F1-6.                                                 NC2074.2
   000708         071200     PERFORM DE-LETE.                                             NC2074.2 470
   000709         071300     GO TO ADD-WRITE-F1-6.                                        NC2074.2 716
   000710         071400 ADD-FAIL-F1-6.                                                   NC2074.2
   000711         071500     MOVE 6 TO CORRECT-N.                                         NC2074.2 344
   000712         071600     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN       NC2074.2 64 63 60
   000713         071700         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2074.2 59 47 46
   000714         071800         COMPUTED-N.                                              NC2074.2 330
   000715         071900     PERFORM FAIL.                                                NC2074.2 469
   000716         072000 ADD-WRITE-F1-6.                                                  NC2074.2
   000717         072100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000718         072200*                                                                 NC2074.2
   000719         072300 ADD-INIT-F1-7.                                                   NC2074.2
   000720         072400     MOVE "ADD-TEST-F1-7" TO PAR-NAME.                            NC2074.2 318
   000721         072500     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000722         072600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000723         072700     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   000724         072800 ADD-TEST-F1-7.                                                   NC2074.2
   000725         072900     ADD TBL-ITEM-1 IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF        NC2074.2 67 66 65
   000726         073000         TABLE-LEVEL-3B OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2074.2 59 47 46
   000727         073100         ACCUMULATOR1.                                            NC2074.2 44
   000728         073200     IF ACCUMULATOR1 EQUAL TO 7                                   NC2074.2 44
   000729      1  073300         PERFORM PASS                                             NC2074.2 468
   000730      1  073400         GO TO ADD-WRITE-F1-7.                                    NC2074.2 741
   000731         073500     GO TO ADD-FAIL-F1-7.                                         NC2074.2 735
   000732         073600 ADD-DELETE-F1-7.                                                 NC2074.2
   000733         073700     PERFORM DE-LETE.                                             NC2074.2 470
   000734         073800     GO TO ADD-WRITE-F1-7.                                        NC2074.2 741
   000735         073900 ADD-FAIL-F1-7.                                                   NC2074.2
   000736         074000     MOVE TBL-ITEM-1 IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF       NC2074.2 67 66 65
   000737         074100         TABLE-LEVEL-3B OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2074.2 59 47 46
   000738         074200         COMPUTED-N.                                              NC2074.2 330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300     MOVE 7 TO CORRECT-N.                                         NC2074.2 344
   000740         074400     PERFORM FAIL.                                                NC2074.2 469
   000741         074500 ADD-WRITE-F1-7.                                                  NC2074.2
   000742         074600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000743         074700*                                                                 NC2074.2
   000744         074800 ADD-INIT-F1-8.                                                   NC2074.2
   000745         074900     MOVE "ADD-TEST-F1-8 " TO PAR-NAME.                           NC2074.2 318
   000746         075000     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000747         075100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000748         075200     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   000749         075300 ADD-TEST-F1-8.                                                   NC2074.2
   000750         075400     ADD TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN        NC2074.2 69 68 65
   000751         075500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2074.2 59 47 46
   000752         075600         ACCUMULATOR1.                                            NC2074.2 44
   000753         075700     IF ACCUMULATOR1 EQUAL TO 8                                   NC2074.2 44
   000754      1  075800         PERFORM PASS                                             NC2074.2 468
   000755      1  075900         GO TO ADD-WRITE-F1-8.                                    NC2074.2 766
   000756         076000     GO TO ADD-FAIL-F1-8.                                         NC2074.2 760
   000757         076100 ADD-DELETE-F1-8.                                                 NC2074.2
   000758         076200     PERFORM DE-LETE.                                             NC2074.2 470
   000759         076300     GO TO ADD-WRITE-F1-8.                                        NC2074.2 766
   000760         076400 ADD-FAIL-F1-8.                                                   NC2074.2
   000761         076500     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN       NC2074.2 69 68 65
   000762         076600         TABLE-LEVEL-3B IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2074.2 59 47 46
   000763         076700         COMPUTED-N.                                              NC2074.2 330
   000764         076800     MOVE 8 TO CORRECT-N.                                         NC2074.2 344
   000765         076900     PERFORM FAIL.                                                NC2074.2 469
   000766         077000 ADD-WRITE-F1-8.                                                  NC2074.2
   000767         077100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000768         077200*                                                                 NC2074.2
   000769         077300 ADD-INIT-F2-9.                                                   NC2074.2
   000770         077400     MOVE "ADD-TEST-F2-9 " TO PAR-NAME.                           NC2074.2 318
   000771         077500     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000772         077600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000773         077700     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   000774         077800 ADD-TEST-F2-9.                                                   NC2074.2
   000775         077900     ADD TBL-ITEM-1 OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF        NC2074.2 74 73 72
   000776         078000         TABLE-LEVEL-3A IN TABLE-LEVEL-4B IN TABLE-LEVEL-5A       NC2074.2 71 70 46
   000777         078100         TBL-ITEM-1 OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF        NC2074.2 74 73 72
   000778         078200         TABLE-LEVEL-3A IN TABLE-LEVEL-4B IN TABLE-LEVEL-5A       NC2074.2 71 70 46
   000779         078300         GIVING ACCUMULATOR2.                                     NC2074.2 45
   000780         078400     IF ACCUMULATOR2 EQUAL TO 18                                  NC2074.2 45
   000781      1  078500         PERFORM PASS                                             NC2074.2 468
   000782      1  078600         GO TO ADD-WRITE-F2-9.                                    NC2074.2 791
   000783         078700     GO TO ADD-FAIL-F2-9.                                         NC2074.2 787
   000784         078800 ADD-DELETE-F2-9.                                                 NC2074.2
   000785         078900     PERFORM DE-LETE.                                             NC2074.2 470
   000786         079000     GO TO ADD-WRITE-F2-9.                                        NC2074.2 791
   000787         079100 ADD-FAIL-F2-9.                                                   NC2074.2
   000788         079200     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   000789         079300     MOVE 18 TO CORRECT-N.                                        NC2074.2 344
   000790         079400     PERFORM FAIL.                                                NC2074.2 469
   000791         079500 ADD-WRITE-F2-9.                                                  NC2074.2
   000792         079600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000793         079700*                                                                 NC2074.2
   000794         079800 ADD-INIT-F2-10.                                                  NC2074.2
   000795         079900     MOVE "ADD-TEST-F2-10 " TO PAR-NAME.                          NC2074.2 318
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000797         080100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000798         080200     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   000799         080300 ADD-TEST-F2-10.                                                  NC2074.2
   000800         080400     ADD TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN        NC2074.2 76 75 72
   000801         080500         TABLE-LEVEL-3A IN TABLE-LEVEL-4B IN TABLE-LEVEL-5A       NC2074.2 71 70 46
   000802         080600         TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN        NC2074.2 76 75 72
   000803         080700         TABLE-LEVEL-3A IN TABLE-LEVEL-4B IN TABLE-LEVEL-5A       NC2074.2 71 70 46
   000804         080800         GIVING ACCUMULATOR2.                                     NC2074.2 45
   000805         080900     IF ACCUMULATOR2 EQUAL TO 20                                  NC2074.2 45
   000806      1  081000         PERFORM PASS                                             NC2074.2 468
   000807      1  081100         GO TO ADD-WRITE-F2-10.                                   NC2074.2 816
   000808         081200     GO TO ADD-FAIL-F2-10.                                        NC2074.2 812
   000809         081300 ADD-DELETE-F2-10.                                                NC2074.2
   000810         081400     PERFORM DE-LETE.                                             NC2074.2 470
   000811         081500     GO TO ADD-WRITE-F2-10.                                       NC2074.2 816
   000812         081600 ADD-FAIL-F2-10.                                                  NC2074.2
   000813         081700     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   000814         081800     MOVE 20 TO CORRECT-N.                                        NC2074.2 344
   000815         081900     PERFORM FAIL.                                                NC2074.2 469
   000816         082000 ADD-WRITE-F2-10.                                                 NC2074.2
   000817         082100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000818         082200*                                                                 NC2074.2
   000819         082300 ADD-INIT-F2-11.                                                  NC2074.2
   000820         082400     MOVE "ADD-TEST-F2-11 " TO PAR-NAME.                          NC2074.2 318
   000821         082500     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000822         082600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000823         082700     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   000824         082800 ADD-TEST-F2-11.                                                  NC2074.2
   000825         082900     ADD TBL-ITEM-1 OF TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF        NC2074.2 79 78 77
   000826         083000         TABLE-LEVEL-3A OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A       NC2074.2 71 70 46
   000827         083100         TBL-ITEM-1 OF TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF        NC2074.2 79 78 77
   000828         083200         TABLE-LEVEL-3A OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A       NC2074.2 71 70 46
   000829         083300         GIVING ACCUMULATOR2.                                     NC2074.2 45
   000830         083400     IF ACCUMULATOR2 EQUAL TO 22                                  NC2074.2 45
   000831      1  083500         PERFORM PASS                                             NC2074.2 468
   000832      1  083600         GO TO ADD-WRITE-F2-11.                                   NC2074.2 841
   000833         083700     GO TO ADD-FAIL-F2-11.                                        NC2074.2 837
   000834         083800 ADD-DELETE-F2-11.                                                NC2074.2
   000835         083900     PERFORM DE-LETE.                                             NC2074.2 470
   000836         084000     GO TO ADD-WRITE-F2-11.                                       NC2074.2 841
   000837         084100 ADD-FAIL-F2-11.                                                  NC2074.2
   000838         084200     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   000839         084300     MOVE 22 TO CORRECT-N.                                        NC2074.2 344
   000840         084400     PERFORM FAIL.                                                NC2074.2 469
   000841         084500 ADD-WRITE-F2-11.                                                 NC2074.2
   000842         084600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000843         084700*                                                                 NC2074.2
   000844         084800 ADD-INIT-F2-12.                                                  NC2074.2
   000845         084900     MOVE "ADD-TEST-F2-12 " TO PAR-NAME.                          NC2074.2 318
   000846         085000     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000847         085100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000848         085200     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   000849         085300 ADD-TEST-F2-12.                                                  NC2074.2
   000850         085400     ADD TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN        NC2074.2 81 80 77
   000851         085500         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   000852         085600         TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN        NC2074.2 81 80 77
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   000854         085800         GIVING ACCUMULATOR2.                                     NC2074.2 45
   000855         085900     IF ACCUMULATOR2 EQUAL TO 24                                  NC2074.2 45
   000856      1  086000         PERFORM PASS                                             NC2074.2 468
   000857      1  086100         GO TO ADD-WRITE-F2-12.                                   NC2074.2 866
   000858         086200     GO TO ADD-FAIL-F2-12.                                        NC2074.2 862
   000859         086300 ADD-DELETE-F2-12.                                                NC2074.2
   000860         086400     PERFORM DE-LETE.                                             NC2074.2 470
   000861         086500     GO TO ADD-WRITE-F2-12.                                       NC2074.2 866
   000862         086600 ADD-FAIL-F2-12.                                                  NC2074.2
   000863         086700     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   000864         086800     MOVE 24 TO CORRECT-N.                                        NC2074.2 344
   000865         086900     PERFORM FAIL.                                                NC2074.2 469
   000866         087000 ADD-WRITE-F2-12.                                                 NC2074.2
   000867         087100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000868         087200*                                                                 NC2074.2
   000869         087300 ADD-INIT-F2-13.                                                  NC2074.2
   000870         087400     MOVE "ADD-TEST-F2-13 " TO PAR-NAME.                          NC2074.2 318
   000871         087500     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000872         087600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000873         087700     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   000874         087800 ADD-TEST-F2-13.                                                  NC2074.2
   000875         087900     ADD TBL-ITEM-1 OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A IN        NC2074.2 85 84 83
   000876         088000         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   000877         088100         TBL-ITEM-1 OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A IN        NC2074.2 85 84 83
   000878         088200         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   000879         088300         GIVING ACCUMULATOR2.                                     NC2074.2 45
   000880         088400     IF ACCUMULATOR2 EQUAL TO 26                                  NC2074.2 45
   000881      1  088500         PERFORM PASS                                             NC2074.2 468
   000882      1  088600         GO TO ADD-WRITE-F2-13.                                   NC2074.2 891
   000883         088700     GO TO ADD-FAIL-F2-13.                                        NC2074.2 887
   000884         088800 ADD-DELETE-F2-13.                                                NC2074.2
   000885         088900     PERFORM DE-LETE.                                             NC2074.2 470
   000886         089000     GO TO ADD-WRITE-F2-13.                                       NC2074.2 891
   000887         089100 ADD-FAIL-F2-13.                                                  NC2074.2
   000888         089200     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   000889         089300     MOVE 26 TO CORRECT-N.                                        NC2074.2 344
   000890         089400     PERFORM FAIL.                                                NC2074.2 469
   000891         089500 ADD-WRITE-F2-13.                                                 NC2074.2
   000892         089600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000893         089700*                                                                 NC2074.2
   000894         089800 ADD-INIT-F2-14.                                                  NC2074.2
   000895         089900     MOVE "ADD-TEST-F2-14 " TO PAR-NAME.                          NC2074.2 318
   000896         090000     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000897         090100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000898         090200     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   000899         090300 ADD-TEST-F2-14.                                                  NC2074.2
   000900         090400     ADD TBL-ITEM-1 IN TABLE-LEVEL-1B IN TABLE-LEVEL-2A IN        NC2074.2 87 86 83
   000901         090500         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   000902         090600         TBL-ITEM-1 IN TABLE-LEVEL-1B IN TABLE-LEVEL-2A IN        NC2074.2 87 86 83
   000903         090700         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   000904         090800         GIVING ACCUMULATOR2.                                     NC2074.2 45
   000905         090900     IF ACCUMULATOR2 EQUAL TO 28                                  NC2074.2 45
   000906      1  091000         PERFORM PASS                                             NC2074.2 468
   000907      1  091100         GO TO ADD-WRITE-F2-14.                                   NC2074.2 916
   000908         091200     GO TO ADD-FAIL-F2-14.                                        NC2074.2 912
   000909         091300 ADD-DELETE-F2-14.                                                NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091400     PERFORM DE-LETE.                                             NC2074.2 470
   000911         091500     GO TO ADD-WRITE-F2-14.                                       NC2074.2 916
   000912         091600 ADD-FAIL-F2-14.                                                  NC2074.2
   000913         091700     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   000914         091800     MOVE 28 TO CORRECT-N.                                        NC2074.2 344
   000915         091900     PERFORM FAIL.                                                NC2074.2 469
   000916         092000 ADD-WRITE-F2-14.                                                 NC2074.2
   000917         092100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000918         092200*                                                                 NC2074.2
   000919         092300 ADD-INIT-F2-15.                                                  NC2074.2
   000920         092400     MOVE "ADD-TEST-F2-15 " TO PAR-NAME.                          NC2074.2 318
   000921         092500     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000922         092600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000923         092700     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   000924         092800 ADD-TEST-F2-15.                                                  NC2074.2
   000925         092900     ADD TBL-ITEM-1 IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B IN        NC2074.2 90 89 88
   000926         093000         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   000927         093100         TBL-ITEM-1 IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B IN        NC2074.2 90 89 88
   000928         093200         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   000929         093300         GIVING ACCUMULATOR2.                                     NC2074.2 45
   000930         093400     IF ACCUMULATOR2 EQUAL TO 30                                  NC2074.2 45
   000931      1  093500         PERFORM PASS                                             NC2074.2 468
   000932      1  093600         GO TO ADD-WRITE-F2-15.                                   NC2074.2 941
   000933         093700     GO TO ADD-FAIL-F2-15.                                        NC2074.2 937
   000934         093800 ADD-DELETE-F2-15.                                                NC2074.2
   000935         093900     PERFORM DE-LETE.                                             NC2074.2 470
   000936         094000     GO TO ADD-WRITE-F2-15.                                       NC2074.2 941
   000937         094100 ADD-FAIL-F2-15.                                                  NC2074.2
   000938         094200     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   000939         094300     MOVE 30 TO CORRECT-N.                                        NC2074.2 344
   000940         094400     PERFORM FAIL.                                                NC2074.2 469
   000941         094500 ADD-WRITE-F2-15.                                                 NC2074.2
   000942         094600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000943         094700*                                                                 NC2074.2
   000944         094800 ADD-INIT-F2-16.                                                  NC2074.2
   000945         094900     MOVE "ADD-TEST-F2-16 " TO PAR-NAME.                          NC2074.2 318
   000946         095000     MOVE "QUALIFIED ADDITION" TO FEATURE.                        NC2074.2 314
   000947         095100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000948         095200     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   000949         095300 ADD-TEST-F2-16.                                                  NC2074.2
   000950         095400     ADD TBL-ITEM-1 IN TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF        NC2074.2 92 91 88
   000951         095500         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   000952         095600         TBL-ITEM-1 IN TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF        NC2074.2 92 91 88
   000953         095700         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   000954         095800         GIVING ACCUMULATOR2.                                     NC2074.2 45
   000955         095900     IF ACCUMULATOR2 EQUAL TO 32                                  NC2074.2 45
   000956      1  096000         PERFORM PASS                                             NC2074.2 468
   000957      1  096100         GO TO ADD-WRITE-F2-16.                                   NC2074.2 966
   000958         096200     GO TO ADD-FAIL-F2-16.                                        NC2074.2 962
   000959         096300 ADD-DELETE-F2-16.                                                NC2074.2
   000960         096400     PERFORM DE-LETE.                                             NC2074.2 470
   000961         096500     GO TO ADD-WRITE-F2-16.                                       NC2074.2 966
   000962         096600 ADD-FAIL-F2-16.                                                  NC2074.2
   000963         096700     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   000964         096800     MOVE 32 TO CORRECT-N.                                        NC2074.2 344
   000965         096900     PERFORM FAIL.                                                NC2074.2 469
   000966         097000 ADD-WRITE-F2-16.                                                 NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000968         097200*                                                                 NC2074.2
   000969         097300 ADD-INIT-F3-17.                                                  NC2074.2
   000970         097400     MOVE "ADD-TEST-F3-17" TO PAR-NAME.                           NC2074.2 318
   000971         097500     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000972         097600     MOVE "       CORRESPONDING" TO FEATURE.                      NC2074.2 314
   000973         097700     ADD CORRESPONDING TABLE-LEVEL-5A TO TABLE-LEVEL-5B.          NC2074.2 46 93
   000974         097800 ADD-TEST-F3-17.                                                  NC2074.2
   000975         097900     IF  TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF        NC2074.2 98 97 96
   000976         098000         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 95 94 93
   000977         098100         EQUAL TO 17                                              NC2074.2
   000978      1  098200         PERFORM PASS                                             NC2074.2 468
   000979      1  098300         GO TO ADD-WRITE-F3-17.                                   NC2074.2 990
   000980         098400     GO TO ADD-FAIL-F3-17.                                        NC2074.2 984
   000981         098500 ADD-DELETE-F3-17.                                                NC2074.2
   000982         098600     PERFORM DE-LETE.                                             NC2074.2 470
   000983         098700     GO TO ADD-WRITE-F3-17.                                       NC2074.2 990
   000984         098800 ADD-FAIL-F3-17.                                                  NC2074.2
   000985         098900     MOVE 17 TO CORRECT-N.                                        NC2074.2 344
   000986         099000     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2074.2 98 97 96
   000987         099100         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 95 94 93
   000988         099200         TO COMPUTED-N.                                           NC2074.2 330
   000989         099300     PERFORM FAIL.                                                NC2074.2 469
   000990         099400 ADD-WRITE-F3-17.                                                 NC2074.2
   000991         099500     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   000992         099600*                                                                 NC2074.2
   000993         099700 ADD-INIT-F3-18.                                                  NC2074.2
   000994         099800     MOVE "ADD-TEST-F3-18" TO PAR-NAME.                           NC2074.2 318
   000995         099900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   000996         100000     MOVE "       CORRESPONDING" TO FEATURE.                      NC2074.2 314
   000997         100100 ADD-TEST-F3-18.                                                  NC2074.2
   000998         100200     IF  TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A OF        NC2074.2 100 99 96
   000999         100300         TABLE-LEVEL-3A OF TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 95 94 93
   001000         100400         EQUAL TO 17                                              NC2074.2
   001001      1  100500         PERFORM PASS                                             NC2074.2 468
   001002      1  100600         GO TO ADD-WRITE-F3-18.                                   NC2074.2 1012
   001003         100700 ADD-DELETE-F3-18.                                                NC2074.2
   001004         100800     PERFORM DE-LETE.                                             NC2074.2 470
   001005         100900     GO TO ADD-WRITE-F3-18.                                       NC2074.2 1012
   001006         101000 ADD-FAIL-F3-18.                                                  NC2074.2
   001007         101100     MOVE 17 TO CORRECT-N.                                        NC2074.2 344
   001008         101200     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A OF       NC2074.2 100 99 96
   001009         101300         TABLE-LEVEL-3A OF TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 95 94 93
   001010         101400     TO  COMPUTED-N.                                              NC2074.2 330
   001011         101500     PERFORM FAIL.                                                NC2074.2 469
   001012         101600 ADD-WRITE-F3-18.                                                 NC2074.2
   001013         101700     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001014         101800*                                                                 NC2074.2
   001015         101900 ADD-INIT-F3-19.                                                  NC2074.2
   001016         102000     MOVE "ADD-TEST-F3-19" TO PAR-NAME.                           NC2074.2 318
   001017         102100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001018         102200     MOVE "       CORRESPONDING" TO FEATURE.                      NC2074.2 314
   001019         102300 ADD-TEST-F3-19.                                                  NC2074.2
   001020         102400     IF  TBL-ITEM-1 IN TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN        NC2074.2 103 102 101
   001021         102500         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5B       NC2074.2 95 94 93
   001022         102600         EQUAL TO 17                                              NC2074.2
   001023      1  102700         PERFORM PASS                                             NC2074.2 468
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024      1  102800         GO TO ADD-WRITE-F3-19.                                   NC2074.2 1035
   001025         102900     GO TO ADD-FAIL-F3-19.                                        NC2074.2 1029
   001026         103000 ADD-DELETE-F3-19.                                                NC2074.2
   001027         103100     PERFORM DE-LETE.                                             NC2074.2 470
   001028         103200     GO TO ADD-WRITE-F3-19.                                       NC2074.2 1035
   001029         103300 ADD-FAIL-F3-19.                                                  NC2074.2
   001030         103400     MOVE 17 TO CORRECT-N.                                        NC2074.2 344
   001031         103500     MOVE TBL-ITEM-1 IN TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN       NC2074.2 103 102 101
   001032         103600         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5B       NC2074.2 95 94 93
   001033         103700     TO  COMPUTED-N.                                              NC2074.2 330
   001034         103800     PERFORM FAIL.                                                NC2074.2 469
   001035         103900 ADD-WRITE-F3-19.                                                 NC2074.2
   001036         104000     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001037         104100*                                                                 NC2074.2
   001038         104200 ADD-INIT-F3-20.                                                  NC2074.2
   001039         104300     MOVE "ADD-TEST-F3-20" TO PAR-NAME.                           NC2074.2 318
   001040         104400     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001041         104500     MOVE "       CORRESPONDING" TO FEATURE.                      NC2074.2 314
   001042         104600 ADD-TEST-F3-20.                                                  NC2074.2
   001043         104700     IF  TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF        NC2074.2 105 104 101
   001044         104800         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5B       NC2074.2 95 94 93
   001045         104900         EQUAL TO 17                                              NC2074.2
   001046      1  105000         PERFORM PASS                                             NC2074.2 468
   001047      1  105100         GO TO ADD-WRITE-F3-20.                                   NC2074.2 1058
   001048         105200     GO TO ADD-FAIL-F3-20.                                        NC2074.2 1052
   001049         105300 ADD-DELETE-F3-20.                                                NC2074.2
   001050         105400     PERFORM DE-LETE.                                             NC2074.2 470
   001051         105500     GO TO ADD-WRITE-F3-20.                                       NC2074.2 1058
   001052         105600 ADD-FAIL-F3-20.                                                  NC2074.2
   001053         105700     MOVE 17 TO CORRECT-N.                                        NC2074.2 344
   001054         105800     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2074.2 105 104 101
   001055         105900         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5B       NC2074.2 95 94 93
   001056         106000     TO  COMPUTED-N.                                              NC2074.2 330
   001057         106100     PERFORM FAIL.                                                NC2074.2 469
   001058         106200 ADD-WRITE-F3-20.                                                 NC2074.2
   001059         106300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001060         106400*                                                                 NC2074.2
   001061         106500 ADD-INIT-F3-21.                                                  NC2074.2
   001062         106600     MOVE "ADD-TEST-F3-21" TO PAR-NAME.                           NC2074.2 318
   001063         106700     MOVE "       CORRESPONDING" TO FEATURE.                      NC2074.2 314
   001064         106800     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001065         106900 ADD-TEST-F3-21.                                                  NC2074.2
   001066         107000     IF  TBL-ITEM-1 OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF        NC2074.2 109 108 107
   001067         107100         TABLE-LEVEL-3B OF TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 106 94 93
   001068         107200         EQUAL TO 17                                              NC2074.2
   001069      1  107300         PERFORM PASS                                             NC2074.2 468
   001070      1  107400         GO TO ADD-WRITE-F3-21.                                   NC2074.2 1081
   001071         107500     GO TO ADD-FAIL-F3-21.                                        NC2074.2 1075
   001072         107600 ADD-DELETE-F3-21.                                                NC2074.2
   001073         107700     PERFORM DE-LETE.                                             NC2074.2 470
   001074         107800     GO TO ADD-WRITE-F3-21.                                       NC2074.2 1081
   001075         107900 ADD-FAIL-F3-21.                                                  NC2074.2
   001076         108000     MOVE 17 TO CORRECT-N.                                        NC2074.2 344
   001077         108100     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF       NC2074.2 109 108 107
   001078         108200         TABLE-LEVEL-3B OF TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 106 94 93
   001079         108300     TO  COMPUTED-N.                                              NC2074.2 330
   001080         108400     PERFORM FAIL.                                                NC2074.2 469
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108500 ADD-WRITE-F3-21.                                                 NC2074.2
   001082         108600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001083         108700*                                                                 NC2074.2
   001084         108800 ADD-INIT-F3-22.                                                  NC2074.2
   001085         108900     MOVE "ADD-TEST-F3-22" TO PAR-NAME.                           NC2074.2 318
   001086         109000     MOVE "       CORRESPONDING" TO FEATURE.                      NC2074.2 314
   001087         109100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001088         109200 ADD-TEST-F3-22.                                                  NC2074.2
   001089         109300     IF  TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN        NC2074.2 111 110 107
   001090         109400         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 106 94 93
   001091         109500         EQUAL TO 17                                              NC2074.2
   001092      1  109600         PERFORM PASS                                             NC2074.2 468
   001093      1  109700         GO TO ADD-WRITE-F3-22.                                   NC2074.2 1104
   001094         109800     GO TO ADD-FAIL-F3-22.                                        NC2074.2 1098
   001095         109900 ADD-DELETE-F3-22.                                                NC2074.2
   001096         110000     PERFORM DE-LETE.                                             NC2074.2 470
   001097         110100     GO TO ADD-WRITE-F3-22.                                       NC2074.2 1104
   001098         110200 ADD-FAIL-F3-22.                                                  NC2074.2
   001099         110300     MOVE 17 TO CORRECT-N.                                        NC2074.2 344
   001100         110400     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN       NC2074.2 111 110 107
   001101         110500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B TO    NC2074.2 106 94 93
   001102         110600         COMPUTED-N.                                              NC2074.2 330
   001103         110700     PERFORM FAIL.                                                NC2074.2 469
   001104         110800 ADD-WRITE-F3-22.                                                 NC2074.2
   001105         110900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001106         111000*                                                                 NC2074.2
   001107         111100 ADD-INIT-F3-23.                                                  NC2074.2
   001108         111200     MOVE "ADD-TEST-F3-23" TO PAR-NAME.                           NC2074.2 318
   001109         111300     MOVE "       CORRESPONDING" TO FEATURE.                      NC2074.2 314
   001110         111400     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001111         111500 ADD-TEST-F3-23.                                                  NC2074.2
   001112         111600     IF  TBL-ITEM-1 IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF        NC2074.2 114 113 112
   001113         111700         TABLE-LEVEL-3B OF TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 106 94 93
   001114         111800         EQUAL TO 17                                              NC2074.2
   001115      1  111900         PERFORM PASS                                             NC2074.2 468
   001116      1  112000         GO TO ADD-WRITE-F3-23.                                   NC2074.2 1127
   001117         112100     GO TO ADD-FAIL-F3-23.                                        NC2074.2 1121
   001118         112200 ADD-DELETE-F3-23.                                                NC2074.2
   001119         112300     PERFORM DE-LETE.                                             NC2074.2 470
   001120         112400     GO TO ADD-WRITE-F3-23.                                       NC2074.2 1127
   001121         112500 ADD-FAIL-F3-23.                                                  NC2074.2
   001122         112600     MOVE 17 TO CORRECT-N.                                        NC2074.2 344
   001123         112700     MOVE TBL-ITEM-1 IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF       NC2074.2 114 113 112
   001124         112800         TABLE-LEVEL-3B OF TABLE-LEVEL-4A OF TABLE-LEVEL-5B TO    NC2074.2 106 94 93
   001125         112900         COMPUTED-N.                                              NC2074.2 330
   001126         113000     PERFORM FAIL.                                                NC2074.2 469
   001127         113100 ADD-WRITE-F3-23.                                                 NC2074.2
   001128         113200     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001129         113300*                                                                 NC2074.2
   001130         113400 ADD-INIT-F3-24.                                                  NC2074.2
   001131         113500     MOVE "ADD-TEST-F3-24" TO PAR-NAME.                           NC2074.2 318
   001132         113600     MOVE "       CORRESPONDING" TO FEATURE.                      NC2074.2 314
   001133         113700     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001134         113800 ADD-TEST-F3-24.                                                  NC2074.2
   001135         113900     IF  TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN        NC2074.2 116 115 112
   001136         114000         TABLE-LEVEL-3B IN TABLE-LEVEL-4A IN TABLE-LEVEL-5B       NC2074.2 106 94 93
   001137         114100         EQUAL TO 17                                              NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138      1  114200         PERFORM PASS                                             NC2074.2 468
   001139      1  114300         GO TO ADD-WRITE-F3-24.                                   NC2074.2 1150
   001140         114400     GO TO ADD-FAIL-F3-24.                                        NC2074.2 1144
   001141         114500 ADD-DELETE-F3-24.                                                NC2074.2
   001142         114600     PERFORM DE-LETE.                                             NC2074.2 470
   001143         114700     GO TO ADD-WRITE-F3-24.                                       NC2074.2 1150
   001144         114800 ADD-FAIL-F3-24.                                                  NC2074.2
   001145         114900     MOVE 17 TO CORRECT-N.                                        NC2074.2 344
   001146         115000     MOVE TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN       NC2074.2 116 115 112
   001147         115100         TABLE-LEVEL-3B IN TABLE-LEVEL-4A IN TABLE-LEVEL-5B TO    NC2074.2 106 94 93
   001148         115200         COMPUTED-N.                                              NC2074.2 330
   001149         115300     PERFORM FAIL.                                                NC2074.2 469
   001150         115400 ADD-WRITE-F3-24.                                                 NC2074.2
   001151         115500     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001152         115600     PERFORM END-ROUTINE.                                         NC2074.2 493
   001153         115700*                                                                 NC2074.2
   001154         115800 ADD-INIT-F1-25.                                                  NC2074.2
   001155         115900*    ===-->  48 LEVELS OF QUALIFICATION  <--===                   NC2074.2
   001156         116000     MOVE   "ADD-TEST-F1-25 " TO PAR-NAME.                        NC2074.2 318
   001157         116100     MOVE   "VI-2 1.3.2" TO ANSI-REFERENCE.                       NC2074.2 374
   001158         116200     MOVE    ZERO TO ACCUMULATOR2.                                NC2074.2 IMP 45
   001159         116300 ADD-TEST-F1-25.                                                  NC2074.2
   001160         116400     ADD     GROUP-49-1  OF GROUP-48 IN GROUP-47 OF GROUP-46      NC2074.2 306 305 304 303
   001161         116500             IN GROUP-45 OF GROUP-44 IN GROUP-43 OF GROUP-42      NC2074.2 302 301 300 299
   001162         116600             IN GROUP-41 OF GROUP-40 IN GROUP-39 OF GROUP-38      NC2074.2 298 297 296 295
   001163         116700             IN GROUP-37 OF GROUP-36 IN GROUP-35 OF GROUP-34      NC2074.2 294 293 292 291
   001164         116800             IN GROUP-33 OF GROUP-32 IN GROUP-31 OF GROUP-30      NC2074.2 290 289 288 287
   001165         116900             IN GROUP-29 OF GROUP-28 IN GROUP-27 OF GROUP-26      NC2074.2 286 285 284 283
   001166         117000             IN GROUP-25 OF GROUP-24 IN GROUP-23 OF GROUP-22      NC2074.2 282 281 280 279
   001167         117100             IN GROUP-21 OF GROUP-20 IN GROUP-19 OF GROUP-18      NC2074.2 278 277 276 275
   001168         117200             IN GROUP-17 OF GROUP-16 IN GROUP-15 OF GROUP-14      NC2074.2 274 273 272 271
   001169         117300             IN GROUP-13 OF GROUP-12 IN GROUP-11 OF GROUP-10      NC2074.2 270 269 268 267
   001170         117400             IN GROUP-09 OF GROUP-08 IN GROUP-07 OF GROUP-06      NC2074.2 266 265 264 263
   001171         117500             IN GROUP-05 OF GROUP-04 IN GROUP-03 OF GROUP-02      NC2074.2 262 261 260 259
   001172         117600             IN SECOND-GROUP                                      NC2074.2 258
   001173         117700          TO ACCUMULATOR2.                                        NC2074.2 45
   001174         117800     IF      ACCUMULATOR2 EQUAL TO 100                            NC2074.2 45
   001175      1  117900             PERFORM PASS                                         NC2074.2 468
   001176      1  118000             GO TO   ADD-WRITE-F1-25.                             NC2074.2 1198
   001177         118100     GO TO ADD-FAIL-F1-25.                                        NC2074.2 1181
   001178         118200 ADD-DELETE-F1-25.                                                NC2074.2
   001179         118300     PERFORM DE-LETE.                                             NC2074.2 470
   001180         118400     GO TO   ADD-WRITE-F1-25.                                     NC2074.2 1198
   001181         118500 ADD-FAIL-F1-25.                                                  NC2074.2
   001182         118600     MOVE    100 TO CORRECT-N.                                    NC2074.2 344
   001183         118700     MOVE    GROUP-49-1  OF GROUP-48 IN GROUP-47 OF GROUP-46      NC2074.2 306 305 304 303
   001184         118800             IN GROUP-45 OF GROUP-44 IN GROUP-43 OF GROUP-42      NC2074.2 302 301 300 299
   001185         118900             IN GROUP-41 OF GROUP-40 IN GROUP-39 OF GROUP-38      NC2074.2 298 297 296 295
   001186         119000             IN GROUP-37 OF GROUP-36 IN GROUP-35 OF GROUP-34      NC2074.2 294 293 292 291
   001187         119100             IN GROUP-33 OF GROUP-32 IN GROUP-31 OF GROUP-30      NC2074.2 290 289 288 287
   001188         119200             IN GROUP-29 OF GROUP-28 IN GROUP-27 OF GROUP-26      NC2074.2 286 285 284 283
   001189         119300             IN GROUP-25 OF GROUP-24 IN GROUP-23 OF GROUP-22      NC2074.2 282 281 280 279
   001190         119400             IN GROUP-21 OF GROUP-20 IN GROUP-19 OF GROUP-18      NC2074.2 278 277 276 275
   001191         119500             IN GROUP-17 OF GROUP-16 IN GROUP-15 OF GROUP-14      NC2074.2 274 273 272 271
   001192         119600             IN GROUP-13 OF GROUP-12 IN GROUP-11 OF GROUP-10      NC2074.2 270 269 268 267
   001193         119700             IN GROUP-09 OF GROUP-08 IN GROUP-07 OF GROUP-06      NC2074.2 266 265 264 263
   001194         119800             IN GROUP-05 OF GROUP-04 IN GROUP-03 OF GROUP-02      NC2074.2 262 261 260 259
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119900             IN SECOND-GROUP                                      NC2074.2 258
   001196         120000          TO COMPUTED-N.                                          NC2074.2 330
   001197         120100     PERFORM FAIL.                                                NC2074.2 469
   001198         120200 ADD-WRITE-F1-25.                                                 NC2074.2
   001199         120300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001200         120400*                                                                 NC2074.2
   001201         120500 SUB-INIT-F2-1.                                                   NC2074.2
   001202         120600     MOVE "SUB-TEST-F2-1  " TO PAR-NAME.                          NC2074.2 318
   001203         120700     MOVE "QUALIFIED SUBTRACT" TO FEATURE.                        NC2074.2 314
   001204         120800     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001205         120900     MOVE    TABLE-5B-INIT  TO TABLE-LEVEL-5B.                    NC2074.2 188 93
   001206         121000     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001207         121100 SUB-TEST-F2-1.                                                   NC2074.2
   001208         121200     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 51 50 49
   001209         121300         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   001210         121400         FROM TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 98 97 96
   001211         121500         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 95 94 93
   001212         121600         GIVING ACCUMULATOR1.                                     NC2074.2 44
   001213         121700     IF ACCUMULATOR1 EQUAL TO 15                                  NC2074.2 44
   001214      1  121800         PERFORM PASS                                             NC2074.2 468
   001215      1  121900         GO TO SUB-WRITE-F2-1.                                    NC2074.2 1224
   001216         122000     GO TO SUB-FAIL-F2-1.                                         NC2074.2 1220
   001217         122100 SUB-DELETE-F2-1.                                                 NC2074.2
   001218         122200     PERFORM DE-LETE.                                             NC2074.2 470
   001219         122300     GO TO SUB-WRITE-F2-1.                                        NC2074.2 1224
   001220         122400 SUB-FAIL-F2-1.                                                   NC2074.2
   001221         122500     MOVE 15 TO CORRECT-N.                                        NC2074.2 344
   001222         122600     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001223         122700     PERFORM FAIL.                                                NC2074.2 469
   001224         122800 SUB-WRITE-F2-1.                                                  NC2074.2
   001225         122900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001226         123000*                                                                 NC2074.2
   001227         123100 SUB-INIT-F2-2.                                                   NC2074.2
   001228         123200     MOVE "SUB-TEST-F2-2  " TO PAR-NAME.                          NC2074.2 318
   001229         123300     MOVE "QUALIFIED SUBTRACT" TO FEATURE.                        NC2074.2 314
   001230         123400     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001231         123500     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001232         123600 SUB-TEST-F2-2.                                                   NC2074.2
   001233         123700     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 53 52 49
   001234         123800         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   001235         123900         FROM TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 100 99 96
   001236         124000         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 95 94 93
   001237         124100         GIVING ACCUMULATOR1.                                     NC2074.2 44
   001238         124200     IF ACCUMULATOR1 EQUAL TO 13                                  NC2074.2 44
   001239      1  124300         PERFORM PASS                                             NC2074.2 468
   001240      1  124400         GO TO SUB-WRITE-F2-2.                                    NC2074.2 1249
   001241         124500     GO TO SUB-FAIL-F2-2.                                         NC2074.2 1245
   001242         124600 SUB-DELETE-F2-2.                                                 NC2074.2
   001243         124700     PERFORM DE-LETE.                                             NC2074.2 470
   001244         124800     GO TO SUB-WRITE-F2-2.                                        NC2074.2 1249
   001245         124900 SUB-FAIL-F2-2.                                                   NC2074.2
   001246         125000     MOVE 13 TO CORRECT-N.                                        NC2074.2 344
   001247         125100     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001248         125200     PERFORM FAIL.                                                NC2074.2 469
   001249         125300 SUB-WRITE-F2-2.                                                  NC2074.2
   001250         125400     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001251         125500*                                                                 NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125600 SUB-INIT-F2-3.                                                   NC2074.2
   001253         125700     MOVE "SUB-TEST-F2-3  " TO PAR-NAME.                          NC2074.2 318
   001254         125800     MOVE "QUALIFIED SUBTRACT" TO FEATURE.                        NC2074.2 314
   001255         125900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001256         126000     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001257         126100 SUB-TEST-F2-3.                                                   NC2074.2
   001258         126200     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 56 55 54
   001259         126300         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   001260         126400         FROM TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 103 102 101
   001261         126500         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 95 94 93
   001262         126600         GIVING ACCUMULATOR1.                                     NC2074.2 44
   001263         126700     IF ACCUMULATOR1 EQUAL TO 11                                  NC2074.2 44
   001264      1  126800         PERFORM PASS                                             NC2074.2 468
   001265      1  126900         GO TO SUB-WRITE-F2-3.                                    NC2074.2 1274
   001266         127000     GO TO SUB-FAIL-F2-3.                                         NC2074.2 1270
   001267         127100 SUB-DELETE-F2-3.                                                 NC2074.2
   001268         127200     PERFORM DE-LETE.                                             NC2074.2 470
   001269         127300     GO TO SUB-WRITE-F2-3.                                        NC2074.2 1274
   001270         127400 SUB-FAIL-F2-3.                                                   NC2074.2
   001271         127500     MOVE 11 TO CORRECT-N.                                        NC2074.2 344
   001272         127600     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001273         127700     PERFORM FAIL.                                                NC2074.2 469
   001274         127800 SUB-WRITE-F2-3.                                                  NC2074.2
   001275         127900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001276         128000*                                                                 NC2074.2
   001277         128100 SUB-INIT-F2-4.                                                   NC2074.2
   001278         128200     MOVE "SUB-TEST-F2-4  " TO PAR-NAME.                          NC2074.2 318
   001279         128300     MOVE "QUALIFIED SUBTRACT" TO FEATURE.                        NC2074.2 314
   001280         128400     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001281         128500     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001282         128600 SUB-TEST-F2-4.                                                   NC2074.2
   001283         128700     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 58 57 54
   001284         128800         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   001285         128900         FROM TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 105 104 101
   001286         129000         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 95 94 93
   001287         129100         GIVING ACCUMULATOR1.                                     NC2074.2 44
   001288         129200     IF ACCUMULATOR1 EQUAL TO 9                                   NC2074.2 44
   001289      1  129300         PERFORM PASS                                             NC2074.2 468
   001290      1  129400         GO TO SUB-WRITE-F2-4.                                    NC2074.2 1299
   001291         129500     GO TO SUB-FAIL-F2-4.                                         NC2074.2 1295
   001292         129600 SUB-DELETE-F2-4.                                                 NC2074.2
   001293         129700     PERFORM DE-LETE.                                             NC2074.2 470
   001294         129800     GO TO SUB-WRITE-F2-4.                                        NC2074.2 1299
   001295         129900 SUB-FAIL-F2-4.                                                   NC2074.2
   001296         130000     MOVE 9 TO CORRECT-N.                                         NC2074.2 344
   001297         130100     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001298         130200     PERFORM FAIL.                                                NC2074.2 469
   001299         130300 SUB-WRITE-F2-4.                                                  NC2074.2
   001300         130400     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001301         130500*                                                                 NC2074.2
   001302         130600 SUB-INIT-F2-5.                                                   NC2074.2
   001303         130700     MOVE "QUALIFIED SUBTRACT" TO FEATURE.                        NC2074.2 314
   001304         130800     MOVE "SUB-TEST-F2-5  " TO PAR-NAME.                          NC2074.2 318
   001305         130900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001306         131000     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001307         131100 SUB-TEST-F2-5.                                                   NC2074.2
   001308         131200     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 62 61 60
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131300         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   001310         131400         FROM TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 109 108 107
   001311         131500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 106 94 93
   001312         131600         GIVING ACCUMULATOR1.                                     NC2074.2 44
   001313         131700     IF ACCUMULATOR1 EQUAL TO 7                                   NC2074.2 44
   001314      1  131800         PERFORM PASS                                             NC2074.2 468
   001315      1  131900         GO TO SUB-WRITE-F2-5.                                    NC2074.2 1324
   001316         132000     GO TO SUB-FAIL-F2-5.                                         NC2074.2 1320
   001317         132100 SUB-DELETE-F2-5.                                                 NC2074.2
   001318         132200     PERFORM DE-LETE.                                             NC2074.2 470
   001319         132300     GO TO SUB-WRITE-F2-5.                                        NC2074.2 1324
   001320         132400 SUB-FAIL-F2-5.                                                   NC2074.2
   001321         132500     MOVE 7 TO CORRECT-N.                                         NC2074.2 344
   001322         132600     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001323         132700     PERFORM FAIL.                                                NC2074.2 469
   001324         132800 SUB-WRITE-F2-5.                                                  NC2074.2
   001325         132900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001326         133000*                                                                 NC2074.2
   001327         133100 SUB-INIT-F2-6.                                                   NC2074.2
   001328         133200     MOVE "SUB-TEST-F2-6  " TO PAR-NAME.                          NC2074.2 318
   001329         133300     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001330         133400     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001331         133500 SUB-TEST-F2-6.                                                   NC2074.2
   001332         133600     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 64 63 60
   001333         133700         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   001334         133800         FROM TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 111 110 107
   001335         133900         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 106 94 93
   001336         134000         GIVING ACCUMULATOR1.                                     NC2074.2 44
   001337         134100     IF ACCUMULATOR1 EQUAL TO 5                                   NC2074.2 44
   001338      1  134200         PERFORM PASS                                             NC2074.2 468
   001339      1  134300         GO TO SUB-WRITE-F2-6.                                    NC2074.2 1348
   001340         134400     GO TO SUB-FAIL-F2-6.                                         NC2074.2 1344
   001341         134500 SUB-DELETE-F2-6.                                                 NC2074.2
   001342         134600     PERFORM DE-LETE.                                             NC2074.2 470
   001343         134700     GO TO SUB-WRITE-F2-6.                                        NC2074.2 1348
   001344         134800 SUB-FAIL-F2-6.                                                   NC2074.2
   001345         134900     MOVE 5 TO CORRECT-N.                                         NC2074.2 344
   001346         135000     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001347         135100     PERFORM FAIL.                                                NC2074.2 469
   001348         135200 SUB-WRITE-F2-6.                                                  NC2074.2
   001349         135300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001350         135400*                                                                 NC2074.2
   001351         135500 SUB-INIT-F2-7.                                                   NC2074.2
   001352         135600     MOVE "SUB-TEST-F2-7  " TO PAR-NAME.                          NC2074.2 318
   001353         135700     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001354         135800     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001355         135900 SUB-TEST-F2-7.                                                   NC2074.2
   001356         136000     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 67 66 65
   001357         136100         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   001358         136200         FROM TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 114 113 112
   001359         136300         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 106 94 93
   001360         136400         GIVING ACCUMULATOR1.                                     NC2074.2 44
   001361         136500     IF ACCUMULATOR1 EQUAL TO 3                                   NC2074.2 44
   001362      1  136600         PERFORM PASS                                             NC2074.2 468
   001363      1  136700         GO TO SUB-WRITE-F2-7.                                    NC2074.2 1372
   001364         136800     GO TO SUB-FAIL-F2-7.                                         NC2074.2 1368
   001365         136900 SUB-DELETE-F2-7.                                                 NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         137000     PERFORM DE-LETE.                                             NC2074.2 470
   001367         137100     GO TO SUB-WRITE-F2-7.                                        NC2074.2 1372
   001368         137200 SUB-FAIL-F2-7.                                                   NC2074.2
   001369         137300     MOVE 3 TO CORRECT-N.                                         NC2074.2 344
   001370         137400     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001371         137500     PERFORM FAIL.                                                NC2074.2 469
   001372         137600 SUB-WRITE-F2-7.                                                  NC2074.2
   001373         137700     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001374         137800*                                                                 NC2074.2
   001375         137900 SUB-INIT-F2-8.                                                   NC2074.2
   001376         138000     MOVE "SUB-TEST-F2-8  " TO PAR-NAME.                          NC2074.2 318
   001377         138100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001378         138200     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001379         138300 SUB-TEST-F2-8.                                                   NC2074.2
   001380         138400     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 69 68 65
   001381         138500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   001382         138600         FROM TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 116 115 112
   001383         138700         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5B       NC2074.2 106 94 93
   001384         138800         GIVING ACCUMULATOR1.                                     NC2074.2 44
   001385         138900     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
   001386      1  139000         PERFORM PASS                                             NC2074.2 468
   001387      1  139100         GO TO SUB-WRITE-F2-8.                                    NC2074.2 1396
   001388         139200     GO TO SUB-FAIL-F2-8.                                         NC2074.2 1392
   001389         139300 SUB-DELETE-F2-8.                                                 NC2074.2
   001390         139400     PERFORM DE-LETE.                                             NC2074.2 470
   001391         139500     GO TO SUB-WRITE-F2-8.                                        NC2074.2 1396
   001392         139600 SUB-FAIL-F2-8.                                                   NC2074.2
   001393         139700     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   001394         139800     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001395         139900     PERFORM FAIL.                                                NC2074.2 469
   001396         140000 SUB-WRITE-F2-8.                                                  NC2074.2
   001397         140100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001398         140200*                                                                 NC2074.2
   001399         140300 SUB-INIT-F2-9.                                                   NC2074.2
   001400         140400     MOVE "SUB-TEST-F2-9  " TO PAR-NAME.                          NC2074.2 318
   001401         140500     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001402         140600     MOVE 5 TO ACCUMULATOR2.                                      NC2074.2 45
   001403         140700 SUB-TEST-F2-9.                                                   NC2074.2
   001404         140800     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 74 73 72
   001405         140900         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   001406         141000         FROM TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 74 73 72
   001407         141100         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   001408         141200         GIVING ACCUMULATOR2.                                     NC2074.2 45
   001409         141300     IF ACCUMULATOR2 EQUAL TO ZERO                                NC2074.2 45 IMP
   001410      1  141400         PERFORM PASS                                             NC2074.2 468
   001411      1  141500         GO TO SUB-WRITE-F2-9.                                    NC2074.2 1420
   001412         141600     GO TO SUB-FAIL-F2-9.                                         NC2074.2 1416
   001413         141700 SUB-DELETE-F2-9.                                                 NC2074.2
   001414         141800     PERFORM DE-LETE.                                             NC2074.2 470
   001415         141900     GO TO SUB-WRITE-F2-9.                                        NC2074.2 1420
   001416         142000 SUB-FAIL-F2-9.                                                   NC2074.2
   001417         142100     MOVE ZERO TO CORRECT-N.                                      NC2074.2 IMP 344
   001418         142200     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   001419         142300     PERFORM FAIL.                                                NC2074.2 469
   001420         142400 SUB-WRITE-F2-9.                                                  NC2074.2
   001421         142500     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001422         142600*                                                                 NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142700 SUB-INIT-F2-10.                                                  NC2074.2
   001424         142800     MOVE "SUB-TEST-F2-10 " TO PAR-NAME.                          NC2074.2 318
   001425         142900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001426         143000     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   001427         143100 SUB-TEST-F2-10.                                                  NC2074.2
   001428         143200     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 123 122 119
   001429         143300         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5B       NC2074.2 118 117 93
   001430         143400         FROM TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 76 75 72
   001431         143500         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   001432         143600         GIVING ACCUMULATOR2.                                     NC2074.2 45
   001433         143700     IF ACCUMULATOR2 EQUAL TO 3                                   NC2074.2 45
   001434      1  143800         PERFORM PASS                                             NC2074.2 468
   001435      1  143900         GO TO SUB-WRITE-F2-10.                                   NC2074.2 1444
   001436         144000     GO TO SUB-FAIL-F2-10.                                        NC2074.2 1440
   001437         144100 SUB-DELETE-F2-10.                                                NC2074.2
   001438         144200     PERFORM DE-LETE.                                             NC2074.2 470
   001439         144300     GO TO SUB-WRITE-F2-10.                                       NC2074.2 1444
   001440         144400 SUB-FAIL-F2-10.                                                  NC2074.2
   001441         144500     MOVE 3 TO CORRECT-N.                                         NC2074.2 344
   001442         144600     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   001443         144700     PERFORM FAIL.                                                NC2074.2 469
   001444         144800 SUB-WRITE-F2-10.                                                 NC2074.2
   001445         144900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001446         145000*                                                                 NC2074.2
   001447         145100 SUB-INIT-F2-11.                                                  NC2074.2
   001448         145200     MOVE "SUB-TEST-F2-11 " TO PAR-NAME.                          NC2074.2 318
   001449         145300     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001450         145400     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   001451         145500 SUB-TEST-F2-11.                                                  NC2074.2
   001452         145600     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 126 125 124
   001453         145700         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5B       NC2074.2 118 117 93
   001454         145800         FROM TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 79 78 77
   001455         145900         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   001456         146000         GIVING ACCUMULATOR2.                                     NC2074.2 45
   001457         146100     IF ACCUMULATOR2 EQUAL TO 5                                   NC2074.2 45
   001458      1  146200         PERFORM PASS                                             NC2074.2 468
   001459      1  146300         GO TO SUB-WRITE-F2-11.                                   NC2074.2 1468
   001460         146400     GO TO SUB-FAIL-F2-11.                                        NC2074.2 1464
   001461         146500 SUB-DELETE-F2-11.                                                NC2074.2
   001462         146600     PERFORM DE-LETE.                                             NC2074.2 470
   001463         146700     GO TO SUB-WRITE-F2-11.                                       NC2074.2 1468
   001464         146800 SUB-FAIL-F2-11.                                                  NC2074.2
   001465         146900     MOVE 5 TO CORRECT-N.                                         NC2074.2 344
   001466         147000     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   001467         147100     PERFORM FAIL.                                                NC2074.2 469
   001468         147200 SUB-WRITE-F2-11.                                                 NC2074.2
   001469         147300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001470         147400*                                                                 NC2074.2
   001471         147500 SUB-INIT-F2-12.                                                  NC2074.2
   001472         147600     MOVE "SUB-TEST-F2-12 " TO PAR-NAME.                          NC2074.2 318
   001473         147700     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001474         147800     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   001475         147900 SUB-TEST-F2-12.                                                  NC2074.2
   001476         148000     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 128 127 124
   001477         148100         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5B       NC2074.2 118 117 93
   001478         148200         FROM TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 81 80 77
   001479         148300         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148400         GIVING ACCUMULATOR2.                                     NC2074.2 45
   001481         148500     IF ACCUMULATOR2 EQUAL TO 7                                   NC2074.2 45
   001482      1  148600         PERFORM PASS                                             NC2074.2 468
   001483      1  148700         GO TO SUB-WRITE-F2-12.                                   NC2074.2 1492
   001484         148800     GO TO SUB-FAIL-F2-12.                                        NC2074.2 1488
   001485         148900 SUB-DELETE-F2-12.                                                NC2074.2
   001486         149000     PERFORM DE-LETE.                                             NC2074.2 470
   001487         149100     GO TO SUB-WRITE-F2-12.                                       NC2074.2 1492
   001488         149200 SUB-FAIL-F2-12.                                                  NC2074.2
   001489         149300     MOVE 7 TO CORRECT-N.                                         NC2074.2 344
   001490         149400     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   001491         149500     PERFORM FAIL.                                                NC2074.2 469
   001492         149600 SUB-WRITE-F2-12.                                                 NC2074.2
   001493         149700     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001494         149800*                                                                 NC2074.2
   001495         149900 SUB-INIT-F2-13.                                                  NC2074.2
   001496         150000     MOVE "SUB-TEST-F2-13 " TO PAR-NAME.                          NC2074.2 318
   001497         150100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001498         150200     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   001499         150300 SUB-TEST-F2-13.                                                  NC2074.2
   001500         150400     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 132 131 130
   001501         150500         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5B       NC2074.2 129 117 93
   001502         150600         FROM TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 85 84 83
   001503         150700         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   001504         150800         GIVING ACCUMULATOR2.                                     NC2074.2 45
   001505         150900     IF ACCUMULATOR2 EQUAL TO 9                                   NC2074.2 45
   001506      1  151000         PERFORM PASS                                             NC2074.2 468
   001507      1  151100         GO TO SUB-WRITE-F2-13.                                   NC2074.2 1516
   001508         151200     GO TO SUB-FAIL-F2-13.                                        NC2074.2 1512
   001509         151300 SUB-DELETE-F2-13.                                                NC2074.2
   001510         151400     PERFORM DE-LETE.                                             NC2074.2 470
   001511         151500     GO TO SUB-WRITE-F2-13.                                       NC2074.2 1516
   001512         151600 SUB-FAIL-F2-13.                                                  NC2074.2
   001513         151700     MOVE 9 TO CORRECT-N.                                         NC2074.2 344
   001514         151800     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   001515         151900     PERFORM FAIL.                                                NC2074.2 469
   001516         152000 SUB-WRITE-F2-13.                                                 NC2074.2
   001517         152100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001518         152200*                                                                 NC2074.2
   001519         152300 SUB-INIT-F2-14.                                                  NC2074.2
   001520         152400     MOVE "SUB-TEST-F2-14 " TO PAR-NAME.                          NC2074.2 318
   001521         152500     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001522         152600     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   001523         152700 SUB-TEST-F2-14.                                                  NC2074.2
   001524         152800     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 134 133 130
   001525         152900         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5B       NC2074.2 129 117 93
   001526         153000         FROM TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 87 86 83
   001527         153100         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   001528         153200         GIVING ACCUMULATOR2.                                     NC2074.2 45
   001529         153300     IF ACCUMULATOR2 EQUAL TO 11                                  NC2074.2 45
   001530      1  153400         PERFORM PASS                                             NC2074.2 468
   001531      1  153500         GO TO SUB-WRITE-F2-14.                                   NC2074.2 1540
   001532         153600     GO TO SUB-FAIL-F2-14.                                        NC2074.2 1536
   001533         153700 SUB-DELETE-F2-14.                                                NC2074.2
   001534         153800     PERFORM DE-LETE.                                             NC2074.2 470
   001535         153900     GO TO SUB-WRITE-F2-14.                                       NC2074.2 1540
   001536         154000 SUB-FAIL-F2-14.                                                  NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154100     MOVE 11 TO CORRECT-N.                                        NC2074.2 344
   001538         154200     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   001539         154300     PERFORM FAIL.                                                NC2074.2 469
   001540         154400 SUB-WRITE-F2-14.                                                 NC2074.2
   001541         154500     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001542         154600*                                                                 NC2074.2
   001543         154700 SUB-INIT-F2-15.                                                  NC2074.2
   001544         154800     MOVE "SUB-TEST-F2-15 " TO PAR-NAME.                          NC2074.2 318
   001545         154900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001546         155000     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   001547         155100 SUB-TEST-F2-15.                                                  NC2074.2
   001548         155200     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 137 136 135
   001549         155300         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5B       NC2074.2 129 117 93
   001550         155400         FROM TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 90 89 88
   001551         155500         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   001552         155600         GIVING ACCUMULATOR2.                                     NC2074.2 45
   001553         155700     IF ACCUMULATOR2 EQUAL TO 13                                  NC2074.2 45
   001554      1  155800         PERFORM PASS                                             NC2074.2 468
   001555      1  155900         GO TO SUB-WRITE-F2-15.                                   NC2074.2 1564
   001556         156000     GO TO SUB-FAIL-F2-15.                                        NC2074.2 1560
   001557         156100 SUB-DELETE-F2-15.                                                NC2074.2
   001558         156200     PERFORM DE-LETE.                                             NC2074.2 470
   001559         156300     GO TO SUB-WRITE-F2-15.                                       NC2074.2 1564
   001560         156400 SUB-FAIL-F2-15.                                                  NC2074.2
   001561         156500     MOVE 13 TO CORRECT-N.                                        NC2074.2 344
   001562         156600     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   001563         156700     PERFORM FAIL.                                                NC2074.2 469
   001564         156800 SUB-WRITE-F2-15.                                                 NC2074.2
   001565         156900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001566         157000*                                                                 NC2074.2
   001567         157100 SUB-INIT-F2-16.                                                  NC2074.2
   001568         157200     MOVE "SUB-TEST-F2-16 " TO PAR-NAME.                          NC2074.2 318
   001569         157300     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001570         157400     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   001571         157500 SUB-TEST-F2-16.                                                  NC2074.2
   001572         157600     SUBTRACT TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 139 138 135
   001573         157700         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5B       NC2074.2 129 117 93
   001574         157800         FROM TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 92 91 88
   001575         157900         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   001576         158000         GIVING ACCUMULATOR2.                                     NC2074.2 45
   001577         158100     IF ACCUMULATOR2 EQUAL TO 15                                  NC2074.2 45
   001578      1  158200         PERFORM PASS                                             NC2074.2 468
   001579      1  158300         GO TO SUB-WRITE-F2-16.                                   NC2074.2 1588
   001580         158400     GO TO SUB-FAIL-F2-16.                                        NC2074.2 1584
   001581         158500 SUB-DELETE-F2-16.                                                NC2074.2
   001582         158600     PERFORM DE-LETE.                                             NC2074.2 470
   001583         158700     GO TO SUB-WRITE-F2-16.                                       NC2074.2 1588
   001584         158800 SUB-FAIL-F2-16.                                                  NC2074.2
   001585         158900     MOVE 15 TO CORRECT-N.                                        NC2074.2 344
   001586         159000     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   001587         159100     PERFORM FAIL.                                                NC2074.2 469
   001588         159200 SUB-WRITE-F2-16.                                                 NC2074.2
   001589         159300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001590         159400*                                                                 NC2074.2
   001591         159500 SUB-INIT-F3-17.                                                  NC2074.2
   001592         159600     MOVE "SUB-TEST-F3-17" TO PAR-NAME.                           NC2074.2 318
   001593         159700     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159800     MOVE "       CORRESPONDING" TO FEATURE.                      NC2074.2 314
   001595         159900     SUBTRACT CORRESPONDING TABLE-LEVEL-5A FROM TABLE-LEVEL-5C.   NC2074.2 46 141
   001596         160000 SUB-TEST-F3-17.                                                  NC2074.2
   001597         160100     IF       TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 146 145 144
   001598         160200         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 143 142 141
   001599         160300         EQUAL TO ZERO                                            NC2074.2 IMP
   001600      1  160400         PERFORM PASS                                             NC2074.2 468
   001601      1  160500         GO TO SUB-WRITE-F3-17.                                   NC2074.2 1612
   001602         160600     GO TO SUB-FAIL-F3-17.                                        NC2074.2 1606
   001603         160700 SUB-DELETE-F3-17.                                                NC2074.2
   001604         160800     PERFORM DE-LETE.                                             NC2074.2 470
   001605         160900     GO TO SUB-WRITE-F3-17.                                       NC2074.2 1612
   001606         161000 SUB-FAIL-F3-17.                                                  NC2074.2
   001607         161100     MOVE 00 TO CORRECT-N.                                        NC2074.2 344
   001608         161200     MOVE     TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 146 145 144
   001609         161300         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 143 142 141
   001610         161400         TO COMPUTED-N.                                           NC2074.2 330
   001611         161500     PERFORM FAIL.                                                NC2074.2 469
   001612         161600 SUB-WRITE-F3-17.                                                 NC2074.2
   001613         161700     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001614         161800*                                                                 NC2074.2
   001615         161900 SUB-INIT-F3-18.                                                  NC2074.2
   001616         162000     MOVE "SUB-TEST-F3-18" TO PAR-NAME.                           NC2074.2 318
   001617         162100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001618         162200 SUB-TEST-F3-18.                                                  NC2074.2
   001619         162300     IF       TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 148 147 144
   001620         162400         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 143 142 141
   001621         162500         EQUAL TO ZERO                                            NC2074.2 IMP
   001622      1  162600         PERFORM PASS                                             NC2074.2 468
   001623      1  162700         GO TO SUB-WRITE-F3-18.                                   NC2074.2 1634
   001624         162800     GO TO SUB-FAIL-F3-18.                                        NC2074.2 1628
   001625         162900 SUB-DELETE-F3-18.                                                NC2074.2
   001626         163000     PERFORM DE-LETE.                                             NC2074.2 470
   001627         163100     GO TO SUB-WRITE-F3-18.                                       NC2074.2 1634
   001628         163200 SUB-FAIL-F3-18.                                                  NC2074.2
   001629         163300     MOVE 00 TO CORRECT-N.                                        NC2074.2 344
   001630         163400     MOVE     TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 148 147 144
   001631         163500         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 143 142 141
   001632         163600         TO COMPUTED-N.                                           NC2074.2 330
   001633         163700     PERFORM FAIL.                                                NC2074.2 469
   001634         163800 SUB-WRITE-F3-18.                                                 NC2074.2
   001635         163900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001636         164000*                                                                 NC2074.2
   001637         164100 SUB-INIT-F3-19.                                                  NC2074.2
   001638         164200     MOVE "SUB-TEST-F3-19" TO PAR-NAME.                           NC2074.2 318
   001639         164300     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001640         164400 SUB-TEST-F3-19.                                                  NC2074.2
   001641         164500     IF       TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 151 150 149
   001642         164600         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 143 142 141
   001643         164700         EQUAL TO ZERO                                            NC2074.2 IMP
   001644      1  164800         PERFORM PASS                                             NC2074.2 468
   001645      1  164900         GO TO SUB-WRITE-F3-19.                                   NC2074.2 1656
   001646         165000     GO TO SUB-FAIL-F3-19.                                        NC2074.2 1650
   001647         165100 SUB-DELETE-F3-19.                                                NC2074.2
   001648         165200     PERFORM DE-LETE.                                             NC2074.2 470
   001649         165300     GO TO SUB-WRITE-F3-19.                                       NC2074.2 1656
   001650         165400 SUB-FAIL-F3-19.                                                  NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165500     MOVE 00 TO CORRECT-N.                                        NC2074.2 344
   001652         165600     MOVE     TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 151 150 149
   001653         165700         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 143 142 141
   001654         165800         TO COMPUTED-N.                                           NC2074.2 330
   001655         165900     PERFORM FAIL.                                                NC2074.2 469
   001656         166000 SUB-WRITE-F3-19.                                                 NC2074.2
   001657         166100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001658         166200*                                                                 NC2074.2
   001659         166300 SUB-INIT-F3-20.                                                  NC2074.2
   001660         166400     MOVE "SUB-TEST-F3-20" TO PAR-NAME.                           NC2074.2 318
   001661         166500     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001662         166600 SUB-TEST-F3-20.                                                  NC2074.2
   001663         166700     IF       TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 153 152 149
   001664         166800         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 143 142 141
   001665         166900         EQUAL TO ZERO                                            NC2074.2 IMP
   001666      1  167000         PERFORM PASS                                             NC2074.2 468
   001667      1  167100         GO TO SUB-WRITE-F3-20.                                   NC2074.2 1678
   001668         167200     GO TO SUB-FAIL-F3-20.                                        NC2074.2 1672
   001669         167300 SUB-DELETE-F3-20.                                                NC2074.2
   001670         167400     PERFORM DE-LETE.                                             NC2074.2 470
   001671         167500     GO TO SUB-WRITE-F3-20.                                       NC2074.2 1678
   001672         167600 SUB-FAIL-F3-20.                                                  NC2074.2
   001673         167700     MOVE 00 TO CORRECT-N.                                        NC2074.2 344
   001674         167800     MOVE     TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 153 152 149
   001675         167900         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 143 142 141
   001676         168000         TO COMPUTED-N.                                           NC2074.2 330
   001677         168100     PERFORM FAIL.                                                NC2074.2 469
   001678         168200 SUB-WRITE-F3-20.                                                 NC2074.2
   001679         168300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001680         168400*                                                                 NC2074.2
   001681         168500 SUB-INIT-F3-21.                                                  NC2074.2
   001682         168600     MOVE "SUB-TEST-F3-21" TO PAR-NAME.                           NC2074.2 318
   001683         168700     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001684         168800 SUB-TEST-F3-21.                                                  NC2074.2
   001685         168900     IF       TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 157 156 155
   001686         169000         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 154 142 141
   001687         169100         EQUAL TO ZERO                                            NC2074.2 IMP
   001688      1  169200         PERFORM PASS                                             NC2074.2 468
   001689      1  169300         GO TO SUB-WRITE-F3-21.                                   NC2074.2 1700
   001690         169400     GO TO SUB-FAIL-F3-21.                                        NC2074.2 1694
   001691         169500 SUB-DELETE-F3-21.                                                NC2074.2
   001692         169600     PERFORM DE-LETE.                                             NC2074.2 470
   001693         169700     GO TO SUB-WRITE-F3-21.                                       NC2074.2 1700
   001694         169800 SUB-FAIL-F3-21.                                                  NC2074.2
   001695         169900     MOVE 00 TO CORRECT-N.                                        NC2074.2 344
   001696         170000     MOVE     TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 157 156 155
   001697         170100         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 154 142 141
   001698         170200         TO COMPUTED-N.                                           NC2074.2 330
   001699         170300     PERFORM FAIL.                                                NC2074.2 469
   001700         170400 SUB-WRITE-F3-21.                                                 NC2074.2
   001701         170500     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001702         170600*                                                                 NC2074.2
   001703         170700 SUB-INIT-F3-22.                                                  NC2074.2
   001704         170800     MOVE "SUB-TEST-F3-22" TO PAR-NAME.                           NC2074.2 318
   001705         170900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001706         171000 SUB-TEST-F3-22.                                                  NC2074.2
   001707         171100     IF       TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 159 158 155
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171200         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 154 142 141
   001709         171300         EQUAL TO ZERO                                            NC2074.2 IMP
   001710      1  171400         PERFORM PASS                                             NC2074.2 468
   001711      1  171500         GO TO SUB-WRITE-F3-22.                                   NC2074.2 1722
   001712         171600     GO TO SUB-FAIL-F3-22.                                        NC2074.2 1716
   001713         171700 SUB-DELETE-F3-22.                                                NC2074.2
   001714         171800     PERFORM DE-LETE.                                             NC2074.2 470
   001715         171900     GO TO SUB-WRITE-F3-22.                                       NC2074.2 1722
   001716         172000 SUB-FAIL-F3-22.                                                  NC2074.2
   001717         172100     MOVE 00 TO CORRECT-N.                                        NC2074.2 344
   001718         172200     MOVE     TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 159 158 155
   001719         172300         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 154 142 141
   001720         172400         TO COMPUTED-N.                                           NC2074.2 330
   001721         172500     PERFORM FAIL.                                                NC2074.2 469
   001722         172600 SUB-WRITE-F3-22.                                                 NC2074.2
   001723         172700     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001724         172800*                                                                 NC2074.2
   001725         172900 SUB-INIT-F3-23.                                                  NC2074.2
   001726         173000     MOVE "SUB-TEST-F3-23" TO PAR-NAME.                           NC2074.2 318
   001727         173100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001728         173200 SUB-TEST-F3-23.                                                  NC2074.2
   001729         173300     IF       TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 162 161 160
   001730         173400         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 154 142 141
   001731         173500         EQUAL TO ZERO                                            NC2074.2 IMP
   001732      1  173600         PERFORM PASS                                             NC2074.2 468
   001733      1  173700         GO TO SUB-WRITE-F3-23.                                   NC2074.2 1744
   001734         173800     GO TO SUB-FAIL-F3-23.                                        NC2074.2 1738
   001735         173900 SUB-DELETE-F3-23.                                                NC2074.2
   001736         174000     PERFORM DE-LETE.                                             NC2074.2 470
   001737         174100     GO TO SUB-WRITE-F3-23.                                       NC2074.2 1744
   001738         174200 SUB-FAIL-F3-23.                                                  NC2074.2
   001739         174300     MOVE 00 TO CORRECT-N.                                        NC2074.2 344
   001740         174400     MOVE     TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 162 161 160
   001741         174500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 154 142 141
   001742         174600         TO COMPUTED-N.                                           NC2074.2 330
   001743         174700     PERFORM FAIL.                                                NC2074.2 469
   001744         174800 SUB-WRITE-F3-23.                                                 NC2074.2
   001745         174900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001746         175000*                                                                 NC2074.2
   001747         175100 SUB-INIT-F3-24.                                                  NC2074.2
   001748         175200     MOVE "SUB-TEST-F3-24" TO PAR-NAME.                           NC2074.2 318
   001749         175300     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001750         175400 SUB-TEST-F3-24.                                                  NC2074.2
   001751         175500     IF       TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 164 163 160
   001752         175600         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 154 142 141
   001753         175700         EQUAL TO ZERO                                            NC2074.2 IMP
   001754      1  175800         PERFORM PASS                                             NC2074.2 468
   001755      1  175900         GO TO SUB-WRITE-F3-24.                                   NC2074.2 1766
   001756         176000     GO TO SUB-FAIL-F3-24.                                        NC2074.2 1760
   001757         176100 SUB-DELETE-F3-24.                                                NC2074.2
   001758         176200     PERFORM DE-LETE.                                             NC2074.2 470
   001759         176300     GO TO SUB-WRITE-F3-24.                                       NC2074.2 1766
   001760         176400 SUB-FAIL-F3-24.                                                  NC2074.2
   001761         176500     MOVE 00 TO CORRECT-N.                                        NC2074.2 344
   001762         176600     MOVE     TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 164 163 160
   001763         176700         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5C       NC2074.2 154 142 141
   001764         176800         TO COMPUTED-N.                                           NC2074.2 330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176900     PERFORM FAIL.                                                NC2074.2 469
   001766         177000 SUB-WRITE-F3-24.                                                 NC2074.2
   001767         177100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001768         177200*                                                                 NC2074.2
   001769         177300 SUB-INIT-F2-25.                                                  NC2074.2
   001770         177400*    ===-->  48 LEVELS OF QUALIFICATION  <--===                   NC2074.2
   001771         177500     MOVE   "SUB-TEST-F2-25 " TO PAR-NAME.                        NC2074.2 318
   001772         177600     MOVE   "VI-2 1.3.2" TO ANSI-REFERENCE.                       NC2074.2 374
   001773         177700     MOVE    ZERO TO ACCUMULATOR1.                                NC2074.2 IMP 44
   001774         177800 SUB-TEST-F2-25.                                                  NC2074.2
   001775         177900     SUBTRACT GROUP-49-2  OF GROUP-48 IN GROUP-47 OF GROUP-46     NC2074.2 307 305 304 303
   001776         178000              IN GROUP-45 OF GROUP-44 IN GROUP-43 OF GROUP-42     NC2074.2 302 301 300 299
   001777         178100              IN GROUP-41 OF GROUP-40 IN GROUP-39 OF GROUP-38     NC2074.2 298 297 296 295
   001778         178200              IN GROUP-37 OF GROUP-36 IN GROUP-35 OF GROUP-34     NC2074.2 294 293 292 291
   001779         178300              IN GROUP-33 OF GROUP-32 IN GROUP-31 OF GROUP-30     NC2074.2 290 289 288 287
   001780         178400              IN GROUP-29 OF GROUP-28 IN GROUP-27 OF GROUP-26     NC2074.2 286 285 284 283
   001781         178500              IN GROUP-25 OF GROUP-24 IN GROUP-23 OF GROUP-22     NC2074.2 282 281 280 279
   001782         178600              IN GROUP-21 OF GROUP-20 IN GROUP-19 OF GROUP-18     NC2074.2 278 277 276 275
   001783         178700              IN GROUP-17 OF GROUP-16 IN GROUP-15 OF GROUP-14     NC2074.2 274 273 272 271
   001784         178800              IN GROUP-13 OF GROUP-12 IN GROUP-11 OF GROUP-10     NC2074.2 270 269 268 267
   001785         178900              IN GROUP-09 OF GROUP-08 IN GROUP-07 OF GROUP-06     NC2074.2 266 265 264 263
   001786         179000              IN GROUP-05 OF GROUP-04 IN GROUP-03 OF GROUP-02     NC2074.2 262 261 260 259
   001787         179100              IN SECOND-GROUP                                     NC2074.2 258
   001788         179200         FROM 200                                                 NC2074.2
   001789         179300       GIVING ACCUMULATOR1.                                       NC2074.2 44
   001790         179400     IF      ACCUMULATOR1 EQUAL TO ZERO                           NC2074.2 44 IMP
   001791      1  179500             PERFORM PASS                                         NC2074.2 468
   001792      1  179600             GO TO   SUB-WRITE-F2-25.                             NC2074.2 1814
   001793         179700     GO TO SUB-FAIL-F2-25.                                        NC2074.2 1797
   001794         179800 SUB-DELETE-F2-25.                                                NC2074.2
   001795         179900     PERFORM DE-LETE.                                             NC2074.2 470
   001796         180000     GO TO   SUB-WRITE-F2-25.                                     NC2074.2 1814
   001797         180100 SUB-FAIL-F2-25.                                                  NC2074.2
   001798         180200     MOVE    200 TO CORRECT-N.                                    NC2074.2 344
   001799         180300     MOVE    GROUP-49-2  OF GROUP-48 IN GROUP-47 OF GROUP-46      NC2074.2 307 305 304 303
   001800         180400             IN GROUP-45 OF GROUP-44 IN GROUP-43 OF GROUP-42      NC2074.2 302 301 300 299
   001801         180500             IN GROUP-41 OF GROUP-40 IN GROUP-39 OF GROUP-38      NC2074.2 298 297 296 295
   001802         180600             IN GROUP-37 OF GROUP-36 IN GROUP-35 OF GROUP-34      NC2074.2 294 293 292 291
   001803         180700             IN GROUP-33 OF GROUP-32 IN GROUP-31 OF GROUP-30      NC2074.2 290 289 288 287
   001804         180800             IN GROUP-29 OF GROUP-28 IN GROUP-27 OF GROUP-26      NC2074.2 286 285 284 283
   001805         180900             IN GROUP-25 OF GROUP-24 IN GROUP-23 OF GROUP-22      NC2074.2 282 281 280 279
   001806         181000             IN GROUP-21 OF GROUP-20 IN GROUP-19 OF GROUP-18      NC2074.2 278 277 276 275
   001807         181100             IN GROUP-17 OF GROUP-16 IN GROUP-15 OF GROUP-14      NC2074.2 274 273 272 271
   001808         181200             IN GROUP-13 OF GROUP-12 IN GROUP-11 OF GROUP-10      NC2074.2 270 269 268 267
   001809         181300             IN GROUP-09 OF GROUP-08 IN GROUP-07 OF GROUP-06      NC2074.2 266 265 264 263
   001810         181400             IN GROUP-05 OF GROUP-04 IN GROUP-03 OF GROUP-02      NC2074.2 262 261 260 259
   001811         181500             IN SECOND-GROUP                                      NC2074.2 258
   001812         181600          TO COMPUTED-N.                                          NC2074.2 330
   001813         181700     PERFORM FAIL.                                                NC2074.2 469
   001814         181800 SUB-WRITE-F2-25.                                                 NC2074.2
   001815         181900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001816         182000     PERFORM END-ROUTINE.                                         NC2074.2 493
   001817         182100*                                                                 NC2074.2
   001818         182200 MPY-INIT-F2-1.                                                   NC2074.2
   001819         182300     MOVE "MPY-TEST-F2-1  " TO PAR-NAME.                          NC2074.2 318
   001820         182400     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   001821         182500     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822         182600 MPY-TEST-F2-1.                                                   NC2074.2
   001823         182700     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001824         182800     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 51 50 49
   001825         182900         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   001826         183000         BY   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 51 50 49
   001827         183100         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   001828         183200     GIVING ACCUMULATOR1.                                         NC2074.2 44
   001829         183300     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
   001830      1  183400         PERFORM PASS                                             NC2074.2 468
   001831      1  183500         GO TO MPY-WRITE-F2-1.                                    NC2074.2 1840
   001832         183600     GO TO MPY-FAIL-F2-1.                                         NC2074.2 1836
   001833         183700 MPY-DELETE-F2-1.                                                 NC2074.2
   001834         183800     PERFORM DE-LETE.                                             NC2074.2 470
   001835         183900     GO TO MPY-WRITE-F2-1.                                        NC2074.2 1840
   001836         184000 MPY-FAIL-F2-1.                                                   NC2074.2
   001837         184100     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001838         184200     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   001839         184300     PERFORM FAIL.                                                NC2074.2 469
   001840         184400 MPY-WRITE-F2-1.                                                  NC2074.2
   001841         184500     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001842         184600*                                                                 NC2074.2
   001843         184700 MPY-INIT-F2-2.                                                   NC2074.2
   001844         184800     MOVE "MPY-TEST-F2-2  " TO PAR-NAME.                          NC2074.2 318
   001845         184900     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   001846         185000     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001847         185100     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001848         185200 MPY-TEST-F2-2.                                                   NC2074.2
   001849         185300     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 53 52 49
   001850         185400         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   001851         185500         BY   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 53 52 49
   001852         185600         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   001853         185700         GIVING ACCUMULATOR1.                                     NC2074.2 44
   001854         185800     IF ACCUMULATOR1 EQUAL TO 4                                   NC2074.2 44
   001855      1  185900         PERFORM PASS                                             NC2074.2 468
   001856      1  186000         GO TO MPY-WRITE-F2-2.                                    NC2074.2 1865
   001857         186100     GO TO MPY-FAIL-F2-2.                                         NC2074.2 1861
   001858         186200 MPY-DELETE-F2-2.                                                 NC2074.2
   001859         186300     PERFORM DE-LETE.                                             NC2074.2 470
   001860         186400     GO TO MPY-WRITE-F2-2.                                        NC2074.2 1865
   001861         186500 MPY-FAIL-F2-2.                                                   NC2074.2
   001862         186600     MOVE 4 TO CORRECT-N.                                         NC2074.2 344
   001863         186700     PERFORM FAIL                                                 NC2074.2 469
   001864         186800     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001865         186900 MPY-WRITE-F2-2.                                                  NC2074.2
   001866         187000     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001867         187100*                                                                 NC2074.2
   001868         187200 MPY-INIT-F2-3.                                                   NC2074.2
   001869         187300     MOVE "MPY-TEST-F2-3  " TO PAR-NAME.                          NC2074.2 318
   001870         187400     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   001871         187500     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001872         187600     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001873         187700 MPY-TEST-F2-3.                                                   NC2074.2
   001874         187800     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 56 55 54
   001875         187900         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A BY 1  NC2074.2 48 47 46
   001876         188000     GIVING ACCUMULATOR1.                                         NC2074.2 44
   001877         188100     IF ACCUMULATOR1 EQUAL TO 3                                   NC2074.2 44
   001878      1  188200         PERFORM PASS                                             NC2074.2 468
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879      1  188300         GO TO MPY-WRITE-F2-3.                                    NC2074.2 1888
   001880         188400     GO TO MPY-FAIL-F2-3.                                         NC2074.2 1884
   001881         188500 MPY-DELETE-F2-3.                                                 NC2074.2
   001882         188600     PERFORM DE-LETE.                                             NC2074.2 470
   001883         188700     GO TO MPY-WRITE-F2-3.                                        NC2074.2 1888
   001884         188800 MPY-FAIL-F2-3.                                                   NC2074.2
   001885         188900     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001886         189000     MOVE 3 TO CORRECT-N.                                         NC2074.2 344
   001887         189100     PERFORM FAIL.                                                NC2074.2 469
   001888         189200 MPY-WRITE-F2-3.                                                  NC2074.2
   001889         189300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001890         189400*                                                                 NC2074.2
   001891         189500 MPY-INIT-F2-4.                                                   NC2074.2
   001892         189600     MOVE "MPY-TEST-F2-4  " TO PAR-NAME.                          NC2074.2 318
   001893         189700     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   001894         189800     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001895         189900     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001896         190000 MPY-TEST-F2-4.                                                   NC2074.2
   001897         190100     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 58 57 54
   001898         190200         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A BY 1  NC2074.2 48 47 46
   001899         190300     GIVING ACCUMULATOR1.                                         NC2074.2 44
   001900         190400     IF ACCUMULATOR1 EQUAL TO 4                                   NC2074.2 44
   001901      1  190500         PERFORM PASS                                             NC2074.2 468
   001902      1  190600         GO TO MPY-WRITE-F2-4.                                    NC2074.2 1911
   001903         190700     GO TO MPY-FAIL-F2-4.                                         NC2074.2 1907
   001904         190800 MPY-DELETE-F2-4.                                                 NC2074.2
   001905         190900     PERFORM DE-LETE.                                             NC2074.2 470
   001906         191000     GO TO MPY-WRITE-F2-4.                                        NC2074.2 1911
   001907         191100 MPY-FAIL-F2-4.                                                   NC2074.2
   001908         191200     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001909         191300     MOVE 4 TO CORRECT-N.                                         NC2074.2 344
   001910         191400     PERFORM FAIL.                                                NC2074.2 469
   001911         191500 MPY-WRITE-F2-4.                                                  NC2074.2
   001912         191600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001913         191700*                                                                 NC2074.2
   001914         191800 MPY-INIT-F2-5.                                                   NC2074.2
   001915         191900     MOVE "MPY-TEST-F2-5  " TO PAR-NAME.                          NC2074.2 318
   001916         192000     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   001917         192100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001918         192200     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001919         192300 MPY-TEST-F2-5.                                                   NC2074.2
   001920         192400     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 62 61 60
   001921         192500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   001922         192600         BY   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 62 61 60
   001923         192700         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   001924         192800     GIVING ACCUMULATOR1.                                         NC2074.2 44
   001925         192900     IF ACCUMULATOR1 EQUAL TO 25                                  NC2074.2 44
   001926      1  193000         PERFORM PASS                                             NC2074.2 468
   001927      1  193100         GO TO MPY-WRITE-F2-5.                                    NC2074.2 1936
   001928         193200     GO TO MPY-FAIL-F2-5.                                         NC2074.2 1932
   001929         193300 MPY-DELETE-F2-5.                                                 NC2074.2
   001930         193400     PERFORM DE-LETE.                                             NC2074.2 470
   001931         193500     GO TO MPY-WRITE-F2-5.                                        NC2074.2 1936
   001932         193600 MPY-FAIL-F2-5.                                                   NC2074.2
   001933         193700     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001934         193800     MOVE 25 TO CORRECT-N.                                        NC2074.2 344
   001935         193900     PERFORM FAIL.                                                NC2074.2 469
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         194000 MPY-WRITE-F2-5.                                                  NC2074.2
   001937         194100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001938         194200*                                                                 NC2074.2
   001939         194300 MPY-INIT-F2-6.                                                   NC2074.2
   001940         194400     MOVE "MPY-TEST-F2-6  " TO PAR-NAME.                          NC2074.2 318
   001941         194500     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   001942         194600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001943         194700     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001944         194800 MPY-TEST-F2-6.                                                   NC2074.2
   001945         194900     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 64 63 60
   001946         195000         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   001947         195100         BY   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 64 63 60
   001948         195200         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   001949         195300     GIVING ACCUMULATOR1.                                         NC2074.2 44
   001950         195400     IF ACCUMULATOR1 EQUAL TO 36                                  NC2074.2 44
   001951      1  195500         PERFORM PASS                                             NC2074.2 468
   001952      1  195600         GO TO MPY-WRITE-F2-6.                                    NC2074.2 1961
   001953         195700     GO TO MPY-FAIL-F2-6.                                         NC2074.2 1957
   001954         195800 MPY-DELETE-F2-6.                                                 NC2074.2
   001955         195900     PERFORM DE-LETE.                                             NC2074.2 470
   001956         196000     GO TO MPY-WRITE-F2-6.                                        NC2074.2 1961
   001957         196100 MPY-FAIL-F2-6.                                                   NC2074.2
   001958         196200     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001959         196300     MOVE 36 TO CORRECT-N.                                        NC2074.2 344
   001960         196400     PERFORM FAIL.                                                NC2074.2 469
   001961         196500 MPY-WRITE-F2-6.                                                  NC2074.2
   001962         196600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001963         196700*                                                                 NC2074.2
   001964         196800 MPY-INIT-F2-7.                                                   NC2074.2
   001965         196900     MOVE "MPY-TEST-F2-7  " TO PAR-NAME.                          NC2074.2 318
   001966         197000     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   001967         197100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001968         197200     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001969         197300 MPY-TEST-F2-7.                                                   NC2074.2
   001970         197400     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 67 66 65
   001971         197500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A BY 1  NC2074.2 59 47 46
   001972         197600     GIVING ACCUMULATOR1.                                         NC2074.2 44
   001973         197700     IF ACCUMULATOR1 EQUAL TO 7                                   NC2074.2 44
   001974      1  197800         PERFORM PASS                                             NC2074.2 468
   001975      1  197900         GO TO MPY-WRITE-F2-7.                                    NC2074.2 1984
   001976         198000     GO TO MPY-FAIL-F2-7.                                         NC2074.2 1980
   001977         198100 MPY-DELETE-F2-7.                                                 NC2074.2
   001978         198200     PERFORM DE-LETE.                                             NC2074.2 470
   001979         198300     GO TO MPY-WRITE-F2-7.                                        NC2074.2 1984
   001980         198400 MPY-FAIL-F2-7.                                                   NC2074.2
   001981         198500     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   001982         198600     MOVE 7 TO CORRECT-N.                                         NC2074.2 344
   001983         198700     PERFORM FAIL.                                                NC2074.2 469
   001984         198800 MPY-WRITE-F2-7.                                                  NC2074.2
   001985         198900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   001986         199000*                                                                 NC2074.2
   001987         199100 MPY-INIT-F2-8.                                                   NC2074.2
   001988         199200     MOVE "MPY-TEST-F2-8  " TO PAR-NAME.                          NC2074.2 318
   001989         199300     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   001990         199400     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   001991         199500     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   001992         199600 MPY-TEST-F2-8.                                                   NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993         199700     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 69 68 65
   001994         199800         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A BY 1  NC2074.2 59 47 46
   001995         199900     GIVING ACCUMULATOR1.                                         NC2074.2 44
   001996         200000     IF ACCUMULATOR1 EQUAL TO 8                                   NC2074.2 44
   001997      1  200100         PERFORM PASS                                             NC2074.2 468
   001998      1  200200         GO TO MPY-WRITE-F2-8.                                    NC2074.2 2007
   001999         200300     GO TO MPY-FAIL-F2-8.                                         NC2074.2 2003
   002000         200400 MPY-DELETE-F2-8.                                                 NC2074.2
   002001         200500     PERFORM DE-LETE.                                             NC2074.2 470
   002002         200600     GO TO MPY-WRITE-F2-8.                                        NC2074.2 2007
   002003         200700 MPY-FAIL-F2-8.                                                   NC2074.2
   002004         200800     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   002005         200900     MOVE 8 TO CORRECT-N.                                         NC2074.2 344
   002006         201000     PERFORM FAIL.                                                NC2074.2 469
   002007         201100 MPY-WRITE-F2-8.                                                  NC2074.2
   002008         201200     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002009         201300*                                                                 NC2074.2
   002010         201400 MPY-INIT-F2-9.                                                   NC2074.2
   002011         201500     MOVE "MPY-TEST-F2-9  " TO PAR-NAME.                          NC2074.2 318
   002012         201600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002013         201700     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   002014         201800     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002015         201900 MPY-TEST-F2-9.                                                   NC2074.2
   002016         202000     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 74 73 72
   002017         202100         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A BY 1  NC2074.2 71 70 46
   002018         202200     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002019         202300     IF ACCUMULATOR2 EQUAL TO 9                                   NC2074.2 45
   002020      1  202400         PERFORM PASS                                             NC2074.2 468
   002021      1  202500         GO TO MPY-WRITE-F2-9.                                    NC2074.2 2030
   002022         202600     GO TO MPY-FAIL-F2-9.                                         NC2074.2 2026
   002023         202700 MPY-DELETE-F2-9.                                                 NC2074.2
   002024         202800     PERFORM DE-LETE.                                             NC2074.2 470
   002025         202900     GO TO MPY-WRITE-F2-9.                                        NC2074.2 2030
   002026         203000 MPY-FAIL-F2-9.                                                   NC2074.2
   002027         203100     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002028         203200     MOVE 9 TO CORRECT-N.                                         NC2074.2 344
   002029         203300     PERFORM FAIL.                                                NC2074.2 469
   002030         203400 MPY-WRITE-F2-9.                                                  NC2074.2
   002031         203500     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002032         203600*                                                                 NC2074.2
   002033         203700 MPY-INIT-F2-10.                                                  NC2074.2
   002034         203800     MOVE "MPY-TEST-F2-10 " TO PAR-NAME.                          NC2074.2 318
   002035         203900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002036         204000     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   002037         204100     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002038         204200 MPY-TEST-F2-10.                                                  NC2074.2
   002039         204300     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 76 75 72
   002040         204400         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A BY 1  NC2074.2 71 70 46
   002041         204500     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002042         204600     IF ACCUMULATOR2 EQUAL TO 10                                  NC2074.2 45
   002043      1  204700         PERFORM PASS                                             NC2074.2 468
   002044      1  204800         GO TO MPY-WRITE-F2-10.                                   NC2074.2 2053
   002045         204900     GO TO MPY-FAIL-F2-10.                                        NC2074.2 2049
   002046         205000 MPY-DELETE-F2-10.                                                NC2074.2
   002047         205100     PERFORM DE-LETE.                                             NC2074.2 470
   002048         205200     GO TO MPY-WRITE-F2-10.                                       NC2074.2 2053
   002049         205300 MPY-FAIL-F2-10.                                                  NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050         205400     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002051         205500     MOVE 10 TO CORRECT-N.                                        NC2074.2 344
   002052         205600     PERFORM FAIL.                                                NC2074.2 469
   002053         205700 MPY-WRITE-F2-10.                                                 NC2074.2
   002054         205800     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002055         205900*                                                                 NC2074.2
   002056         206000 MPY-INIT-F2-11.                                                  NC2074.2
   002057         206100     MOVE "MPY-TEST-F2-11 " TO PAR-NAME.                          NC2074.2 318
   002058         206200     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002059         206300     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   002060         206400     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002061         206500 MPY-TEST-F2-11.                                                  NC2074.2
   002062         206600     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 79 78 77
   002063         206700         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   002064         206800         BY   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 79 78 77
   002065         206900         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   002066         207000     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002067         207100     IF ACCUMULATOR2 EQUAL TO 121                                 NC2074.2 45
   002068      1  207200         PERFORM PASS                                             NC2074.2 468
   002069      1  207300         GO TO MPY-WRITE-F2-11.                                   NC2074.2 2078
   002070         207400     GO TO MPY-FAIL-F2-11.                                        NC2074.2 2074
   002071         207500 MPY-DELETE-F2-11.                                                NC2074.2
   002072         207600     PERFORM DE-LETE.                                             NC2074.2 470
   002073         207700     GO TO MPY-WRITE-F2-11.                                       NC2074.2 2078
   002074         207800 MPY-FAIL-F2-11.                                                  NC2074.2
   002075         207900     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002076         208000     MOVE 121 TO CORRECT-N.                                       NC2074.2 344
   002077         208100     PERFORM FAIL.                                                NC2074.2 469
   002078         208200 MPY-WRITE-F2-11.                                                 NC2074.2
   002079         208300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002080         208400*                                                                 NC2074.2
   002081         208500 MPY-INIT-F2-12.                                                  NC2074.2
   002082         208600     MOVE "MPY-TEST-F2-12 " TO PAR-NAME.                          NC2074.2 318
   002083         208700     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002084         208800     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   002085         208900     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002086         209000 MPY-TEST-F2-12.                                                  NC2074.2
   002087         209100     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 81 80 77
   002088         209200         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   002089         209300         BY   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 81 80 77
   002090         209400         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   002091         209500     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002092         209600     IF ACCUMULATOR2 EQUAL TO 144                                 NC2074.2 45
   002093      1  209700         PERFORM PASS                                             NC2074.2 468
   002094      1  209800         GO TO MPY-WRITE-F2-12.                                   NC2074.2 2103
   002095         209900     GO TO MPY-FAIL-F2-12.                                        NC2074.2 2099
   002096         210000 MPY-DELETE-F2-12.                                                NC2074.2
   002097         210100     PERFORM DE-LETE.                                             NC2074.2 470
   002098         210200     GO TO MPY-WRITE-F2-12.                                       NC2074.2 2103
   002099         210300 MPY-FAIL-F2-12.                                                  NC2074.2
   002100         210400     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002101         210500     MOVE 144 TO CORRECT-N.                                       NC2074.2 344
   002102         210600     PERFORM FAIL.                                                NC2074.2 469
   002103         210700 MPY-WRITE-F2-12.                                                 NC2074.2
   002104         210800     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002105         210900*                                                                 NC2074.2
   002106         211000 MPY-INIT-F2-13.                                                  NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107         211100     MOVE "MPY-TEST-F2-13 " TO PAR-NAME.                          NC2074.2 318
   002108         211200     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002109         211300     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   002110         211400     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002111         211500 MPY-TEST-F2-13.                                                  NC2074.2
   002112         211600     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 85 84 83
   002113         211700         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A BY 1  NC2074.2 82 70 46
   002114         211800     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002115         211900     IF ACCUMULATOR2 EQUAL TO 13                                  NC2074.2 45
   002116      1  212000         PERFORM PASS                                             NC2074.2 468
   002117      1  212100         GO TO MPY-WRITE-F2-13.                                   NC2074.2 2126
   002118         212200     GO TO MPY-FAIL-F2-13.                                        NC2074.2 2122
   002119         212300 MPY-DELETE-F2-13.                                                NC2074.2
   002120         212400     PERFORM DE-LETE.                                             NC2074.2 470
   002121         212500     GO TO MPY-WRITE-F2-13.                                       NC2074.2 2126
   002122         212600 MPY-FAIL-F2-13.                                                  NC2074.2
   002123         212700     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002124         212800     MOVE 13 TO CORRECT-N.                                        NC2074.2 344
   002125         212900     PERFORM FAIL.                                                NC2074.2 469
   002126         213000 MPY-WRITE-F2-13.                                                 NC2074.2
   002127         213100     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002128         213200*                                                                 NC2074.2
   002129         213300 MPY-INIT-F2-14.                                                  NC2074.2
   002130         213400     MOVE "MPY-TEST-F2-14 " TO PAR-NAME.                          NC2074.2 318
   002131         213500     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002132         213600     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   002133         213700     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002134         213800 MPY-TEST-F2-14.                                                  NC2074.2
   002135         213900     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 87 86 83
   002136         214000         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A BY 1  NC2074.2 82 70 46
   002137         214100     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002138         214200     IF ACCUMULATOR2 EQUAL TO 14                                  NC2074.2 45
   002139      1  214300         PERFORM PASS                                             NC2074.2 468
   002140      1  214400         GO TO MPY-WRITE-F2-14.                                   NC2074.2 2149
   002141         214500     GO TO MPY-FAIL-F2-14.                                        NC2074.2 2145
   002142         214600 MPY-DELETE-F2-14.                                                NC2074.2
   002143         214700     PERFORM DE-LETE.                                             NC2074.2 470
   002144         214800     GO TO MPY-WRITE-F2-14.                                       NC2074.2 2149
   002145         214900 MPY-FAIL-F2-14.                                                  NC2074.2
   002146         215000     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002147         215100     MOVE 14 TO CORRECT-N.                                        NC2074.2 344
   002148         215200     PERFORM FAIL.                                                NC2074.2 469
   002149         215300 MPY-WRITE-F2-14.                                                 NC2074.2
   002150         215400     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002151         215500*                                                                 NC2074.2
   002152         215600 MPY-INIT-F2-15.                                                  NC2074.2
   002153         215700     MOVE "MPY-TEST-F2-15 " TO PAR-NAME.                          NC2074.2 318
   002154         215800     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002155         215900     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   002156         216000     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002157         216100 MPY-TEST-F2-15.                                                  NC2074.2
   002158         216200     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 90 89 88
   002159         216300         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   002160         216400         BY   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 90 89 88
   002161         216500         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   002162         216600     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002163         216700     IF ACCUMULATOR2 EQUAL TO 225                                 NC2074.2 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002164      1  216800         PERFORM PASS                                             NC2074.2 468
   002165      1  216900         GO TO MPY-WRITE-F2-15.                                   NC2074.2 2174
   002166         217000     GO TO MPY-FAIL-F2-15.                                        NC2074.2 2170
   002167         217100 MPY-DELETE-F2-15.                                                NC2074.2
   002168         217200     PERFORM DE-LETE.                                             NC2074.2 470
   002169         217300     GO TO MPY-WRITE-F2-15.                                       NC2074.2 2174
   002170         217400 MPY-FAIL-F2-15.                                                  NC2074.2
   002171         217500     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002172         217600     MOVE 225 TO CORRECT-N.                                       NC2074.2 344
   002173         217700     PERFORM FAIL.                                                NC2074.2 469
   002174         217800 MPY-WRITE-F2-15.                                                 NC2074.2
   002175         217900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002176         218000*                                                                 NC2074.2
   002177         218100 MPY-INIT-F2-16.                                                  NC2074.2
   002178         218200     MOVE "MPY-TEST-F2-16 " TO PAR-NAME.                          NC2074.2 318
   002179         218300     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002180         218400     MOVE "QUALIFIED MULTIPLY" TO FEATURE.                        NC2074.2 314
   002181         218500     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002182         218600 MPY-TEST-F2-16.                                                  NC2074.2
   002183         218700     MULTIPLY TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 92 91 88
   002184         218800         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   002185         218900         BY   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 92 91 88
   002186         219000         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   002187         219100     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002188         219200     IF ACCUMULATOR2 EQUAL TO 256                                 NC2074.2 45
   002189      1  219300         PERFORM PASS                                             NC2074.2 468
   002190      1  219400         GO TO MPY-WRITE-F2-16.                                   NC2074.2 2199
   002191         219500     GO TO MPY-FAIL-F2-16.                                        NC2074.2 2195
   002192         219600 MPY-DELETE-F2-16.                                                NC2074.2
   002193         219700     PERFORM DE-LETE.                                             NC2074.2 470
   002194         219800     GO TO MPY-WRITE-F2-16.                                       NC2074.2 2199
   002195         219900 MPY-FAIL-F2-16.                                                  NC2074.2
   002196         220000     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002197         220100     MOVE 256 TO CORRECT-N.                                       NC2074.2 344
   002198         220200     PERFORM FAIL.                                                NC2074.2 469
   002199         220300 MPY-WRITE-F2-16.                                                 NC2074.2
   002200         220400     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002201         220500*                                                                 NC2074.2
   002202         220600 MPY-INIT-F2-17.                                                  NC2074.2
   002203         220700*    ===-->  48 LEVELS OF QUALIFICATION  <--===                   NC2074.2
   002204         220800     MOVE   "MPY-TEST-F2-17 " TO PAR-NAME.                        NC2074.2 318
   002205         220900     MOVE   "VI-2 1.3.2" TO ANSI-REFERENCE.                       NC2074.2 374
   002206         221000     MOVE    ZERO TO ACCUMULATOR1.                                NC2074.2 IMP 44
   002207         221100 MPY-TEST-F2-17.                                                  NC2074.2
   002208         221200     MULTIPLY GROUP-49-3  OF GROUP-48 IN GROUP-47 OF GROUP-46     NC2074.2 255 252 251 250
   002209         221300              IN GROUP-45 OF GROUP-44 IN GROUP-43 OF GROUP-42     NC2074.2 249 248 247 246
   002210         221400              IN GROUP-41 OF GROUP-40 IN GROUP-39 OF GROUP-38     NC2074.2 245 244 243 242
   002211         221500              IN GROUP-37 OF GROUP-36 IN GROUP-35 OF GROUP-34     NC2074.2 241 240 239 238
   002212         221600              IN GROUP-33 OF GROUP-32 IN GROUP-31 OF GROUP-30     NC2074.2 237 236 235 234
   002213         221700              IN GROUP-29 OF GROUP-28 IN GROUP-27 OF GROUP-26     NC2074.2 233 232 231 230
   002214         221800              IN GROUP-25 OF GROUP-24 IN GROUP-23 OF GROUP-22     NC2074.2 229 228 227 226
   002215         221900              IN GROUP-21 OF GROUP-20 IN GROUP-19 OF GROUP-18     NC2074.2 225 224 223 222
   002216         222000              IN GROUP-17 OF GROUP-16 IN GROUP-15 OF GROUP-14     NC2074.2 221 220 219 218
   002217         222100              IN GROUP-13 OF GROUP-12 IN GROUP-11 OF GROUP-10     NC2074.2 217 216 215 214
   002218         222200              IN GROUP-09 OF GROUP-08 IN GROUP-07 OF GROUP-06     NC2074.2 213 212 211 210
   002219         222300              IN GROUP-05 OF GROUP-04 IN GROUP-03 OF GROUP-02     NC2074.2 209 208 207 206
   002220         222400              IN FIRST-GROUP                                      NC2074.2 205
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002221         222500           BY 3                                                   NC2074.2
   002222         222600       GIVING ACCUMULATOR1.                                       NC2074.2 44
   002223         222700     IF      ACCUMULATOR1 EQUAL TO 9                              NC2074.2 44
   002224      1  222800             PERFORM PASS                                         NC2074.2 468
   002225      1  222900             GO TO   MPY-WRITE-F2-17.                             NC2074.2 2248
   002226         223000     GO TO MPY-FAIL-F2-17.                                        NC2074.2 2230
   002227         223100 MPY-DELETE-F2-17.                                                NC2074.2
   002228         223200     PERFORM DE-LETE.                                             NC2074.2 470
   002229         223300     GO TO   MPY-WRITE-F2-17.                                     NC2074.2 2248
   002230         223400 MPY-FAIL-F2-17.                                                  NC2074.2
   002231         223500     MOVE    9 TO CORRECT-N.                                      NC2074.2 344
   002232         223600     MOVE    GROUP-49-3  OF GROUP-48 IN GROUP-47 OF GROUP-46      NC2074.2 255 252 251 250
   002233         223700             IN GROUP-45 OF GROUP-44 IN GROUP-43 OF GROUP-42      NC2074.2 249 248 247 246
   002234         223800             IN GROUP-41 OF GROUP-40 IN GROUP-39 OF GROUP-38      NC2074.2 245 244 243 242
   002235         223900             IN GROUP-37 OF GROUP-36 IN GROUP-35 OF GROUP-34      NC2074.2 241 240 239 238
   002236         224000             IN GROUP-33 OF GROUP-32 IN GROUP-31 OF GROUP-30      NC2074.2 237 236 235 234
   002237         224100             IN GROUP-29 OF GROUP-28 IN GROUP-27 OF GROUP-26      NC2074.2 233 232 231 230
   002238         224200             IN GROUP-25 OF GROUP-24 IN GROUP-23 OF GROUP-22      NC2074.2 229 228 227 226
   002239         224300             IN GROUP-21 OF GROUP-20 IN GROUP-19 OF GROUP-18      NC2074.2 225 224 223 222
   002240         224400             IN GROUP-17 OF GROUP-16 IN GROUP-15 OF GROUP-14      NC2074.2 221 220 219 218
   002241         224500             IN GROUP-13 OF GROUP-12 IN GROUP-11 OF GROUP-10      NC2074.2 217 216 215 214
   002242         224600             IN GROUP-09 OF GROUP-08 IN GROUP-07 OF GROUP-06      NC2074.2 213 212 211 210
   002243         224700             IN GROUP-05 OF GROUP-04 IN GROUP-03 OF GROUP-02      NC2074.2 209 208 207 206
   002244         224800             IN FIRST-GROUP                                       NC2074.2 205
   002245         224900          TO COMPUTED-N.                                          NC2074.2 330
   002246         225000     MOVE   "3 TIMES 3 SHOULD BE 9" TO RE-MARK.                   NC2074.2 323
   002247         225100     PERFORM FAIL.                                                NC2074.2 469
   002248         225200 MPY-WRITE-F2-17.                                                 NC2074.2
   002249         225300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002250         225400     PERFORM END-ROUTINE.                                         NC2074.2 493
   002251         225500*                                                                 NC2074.2
   002252         225600 DIV-INIT-F3-1.                                                   NC2074.2
   002253         225700     MOVE "DIV-TEST-F3-1  " TO PAR-NAME                           NC2074.2 318
   002254         225800     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002255         225900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002256         226000     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   002257         226100 DIV-TEST-F3-1.                                                   NC2074.2
   002258         226200     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 51 50 49
   002259         226300         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   002260         226400         BY   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 51 50 49
   002261         226500         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   002262         226600     GIVING ACCUMULATOR1.                                         NC2074.2 44
   002263         226700     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
   002264      1  226800         PERFORM PASS                                             NC2074.2 468
   002265      1  226900         GO TO DIV-WRITE-F3-1.                                    NC2074.2 2274
   002266         227000     GO TO DIV-FAIL-F3-1.                                         NC2074.2 2270
   002267         227100 DIV-DELETE-F3-1.                                                 NC2074.2
   002268         227200     PERFORM DE-LETE.                                             NC2074.2 470
   002269         227300     GO TO DIV-WRITE-F3-1.                                        NC2074.2 2274
   002270         227400 DIV-FAIL-F3-1.                                                   NC2074.2
   002271         227500     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   002272         227600     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002273         227700     PERFORM FAIL.                                                NC2074.2 469
   002274         227800 DIV-WRITE-F3-1.                                                  NC2074.2
   002275         227900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002276         228000*                                                                 NC2074.2
   002277         228100 DIV-INIT-F3-2.                                                   NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002278         228200     MOVE "DIV-TEST-F3-2  " TO PAR-NAME                           NC2074.2 318
   002279         228300     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002280         228400     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002281         228500     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   002282         228600 DIV-TEST-F3-2.                                                   NC2074.2
   002283         228700     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 53 52 49
   002284         228800         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   002285         228900         BY   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 53 52 49
   002286         229000         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 48 47 46
   002287         229100     GIVING ACCUMULATOR1.                                         NC2074.2 44
   002288         229200     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
   002289      1  229300         PERFORM PASS                                             NC2074.2 468
   002290      1  229400         GO TO DIV-WRITE-F3-2.                                    NC2074.2 2299
   002291         229500     GO TO DIV-FAIL-F3-2.                                         NC2074.2 2295
   002292         229600 DIV-DELETE-F3-2.                                                 NC2074.2
   002293         229700     PERFORM DE-LETE.                                             NC2074.2 470
   002294         229800     GO TO DIV-WRITE-F3-2.                                        NC2074.2 2299
   002295         229900 DIV-FAIL-F3-2.                                                   NC2074.2
   002296         230000     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002297         230100     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   002298         230200     PERFORM FAIL.                                                NC2074.2 469
   002299         230300 DIV-WRITE-F3-2.                                                  NC2074.2
   002300         230400     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002301         230500*                                                                 NC2074.2
   002302         230600 DIV-INIT-F3-3.                                                   NC2074.2
   002303         230700     MOVE "DIV-TEST-F3-3  " TO PAR-NAME                           NC2074.2 318
   002304         230800     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002305         230900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002306         231000     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   002307         231100 DIV-TEST-F3-3.                                                   NC2074.2
   002308         231200     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 56 55 54
   002309         231300         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A BY 3  NC2074.2 48 47 46
   002310         231400     GIVING ACCUMULATOR1.                                         NC2074.2 44
   002311         231500     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
   002312      1  231600         PERFORM PASS                                             NC2074.2 468
   002313      1  231700         GO TO DIV-WRITE-F3-3.                                    NC2074.2 2322
   002314         231800     GO TO DIV-FAIL-F3-3.                                         NC2074.2 2318
   002315         231900 DIV-DELETE-F3-3.                                                 NC2074.2
   002316         232000     PERFORM DE-LETE.                                             NC2074.2 470
   002317         232100     GO TO DIV-WRITE-F3-3.                                        NC2074.2 2322
   002318         232200 DIV-FAIL-F3-3.                                                   NC2074.2
   002319         232300     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002320         232400     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   002321         232500     PERFORM FAIL.                                                NC2074.2 469
   002322         232600 DIV-WRITE-F3-3.                                                  NC2074.2
   002323         232700     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002324         232800*                                                                 NC2074.2
   002325         232900 DIV-INIT-F3-4.                                                   NC2074.2
   002326         233000     MOVE "DIV-TEST-F3-4  " TO PAR-NAME                           NC2074.2 318
   002327         233100     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002328         233200     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002329         233300     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   002330         233400 DIV-TEST-F3-4.                                                   NC2074.2
   002331         233500     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 58 57 54
   002332         233600         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A BY 3  NC2074.2 48 47 46
   002333         233700     GIVING ACCUMULATOR1.                                         NC2074.2 44
   002334         233800     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002335      1  233900         PERFORM PASS                                             NC2074.2 468
   002336      1  234000         GO TO DIV-WRITE-F3-4.                                    NC2074.2 2345
   002337         234100     GO TO DIV-FAIL-F3-4.                                         NC2074.2 2341
   002338         234200 DIV-DELETE-F3-4.                                                 NC2074.2
   002339         234300     PERFORM DE-LETE.                                             NC2074.2 470
   002340         234400     GO TO DIV-WRITE-F3-4.                                        NC2074.2 2345
   002341         234500 DIV-FAIL-F3-4.                                                   NC2074.2
   002342         234600     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002343         234700     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   002344         234800     PERFORM FAIL.                                                NC2074.2 469
   002345         234900 DIV-WRITE-F3-4.                                                  NC2074.2
   002346         235000     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002347         235100*                                                                 NC2074.2
   002348         235200 DIV-INIT-F3-5.                                                   NC2074.2
   002349         235300     MOVE "DIV-TEST-F3-5  " TO PAR-NAME                           NC2074.2 318
   002350         235400     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002351         235500     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002352         235600     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   002353         235700 DIV-TEST-F3-5.                                                   NC2074.2
   002354         235800     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 62 61 60
   002355         235900         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   002356         236000         BY   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 62 61 60
   002357         236100         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   002358         236200     GIVING ACCUMULATOR1.                                         NC2074.2 44
   002359         236300     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
   002360      1  236400         PERFORM PASS                                             NC2074.2 468
   002361      1  236500         GO TO DIV-WRITE-F3-5.                                    NC2074.2 2370
   002362         236600     GO TO DIV-FAIL-F3-5.                                         NC2074.2 2366
   002363         236700 DIV-DELETE-F3-5.                                                 NC2074.2
   002364         236800     PERFORM DE-LETE.                                             NC2074.2 470
   002365         236900     GO TO DIV-WRITE-F3-5.                                        NC2074.2 2370
   002366         237000 DIV-FAIL-F3-5.                                                   NC2074.2
   002367         237100     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002368         237200     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   002369         237300     PERFORM FAIL.                                                NC2074.2 469
   002370         237400 DIV-WRITE-F3-5.                                                  NC2074.2
   002371         237500     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002372         237600*                                                                 NC2074.2
   002373         237700 DIV-INIT-F3-6.                                                   NC2074.2
   002374         237800     MOVE "DIV-TEST-F3-6  " TO PAR-NAME                           NC2074.2 318
   002375         237900     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002376         238000     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002377         238100     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   002378         238200 DIV-TEST-F3-6.                                                   NC2074.2
   002379         238300     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 64 63 60
   002380         238400         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   002381         238500         BY   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 64 63 60
   002382         238600         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A       NC2074.2 59 47 46
   002383         238700     GIVING ACCUMULATOR1.                                         NC2074.2 44
   002384         238800     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
   002385      1  238900         PERFORM PASS                                             NC2074.2 468
   002386      1  239000         GO TO DIV-WRITE-F3-6.                                    NC2074.2 2395
   002387         239100     GO TO DIV-FAIL-F3-6.                                         NC2074.2 2391
   002388         239200 DIV-DELETE-F3-6.                                                 NC2074.2
   002389         239300     PERFORM DE-LETE.                                             NC2074.2 470
   002390         239400     GO TO DIV-WRITE-F3-6.                                        NC2074.2 2395
   002391         239500 DIV-FAIL-F3-6.                                                   NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    45
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002392         239600     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002393         239700     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   002394         239800     PERFORM FAIL.                                                NC2074.2 469
   002395         239900 DIV-WRITE-F3-6.                                                  NC2074.2
   002396         240000     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002397         240100*                                                                 NC2074.2
   002398         240200 DIV-INIT-F3-7.                                                   NC2074.2
   002399         240300     MOVE "DIV-TEST-F3-7  " TO PAR-NAME                           NC2074.2 318
   002400         240400     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002401         240500     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002402         240600     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   002403         240700 DIV-TEST-F3-7.                                                   NC2074.2
   002404         240800     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 67 66 65
   002405         240900         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A BY 7  NC2074.2 59 47 46
   002406         241000     GIVING ACCUMULATOR1.                                         NC2074.2 44
   002407         241100     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
   002408      1  241200         PERFORM PASS                                             NC2074.2 468
   002409      1  241300         GO TO DIV-WRITE-F3-7.                                    NC2074.2 2418
   002410         241400     GO TO DIV-FAIL-F3-7.                                         NC2074.2 2414
   002411         241500 DIV-DELETE-F3-7.                                                 NC2074.2
   002412         241600     PERFORM DE-LETE.                                             NC2074.2 470
   002413         241700     GO TO DIV-WRITE-F3-7.                                        NC2074.2 2418
   002414         241800 DIV-FAIL-F3-7.                                                   NC2074.2
   002415         241900     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002416         242000     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   002417         242100     PERFORM FAIL.                                                NC2074.2 469
   002418         242200 DIV-WRITE-F3-7.                                                  NC2074.2
   002419         242300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002420         242400*                                                                 NC2074.2
   002421         242500 DIV-INIT-F3-8.                                                   NC2074.2
   002422         242600     MOVE "DIV-TEST-F3-8  " TO PAR-NAME                           NC2074.2 318
   002423         242700     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002424         242800     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002425         242900     MOVE ZERO TO ACCUMULATOR1.                                   NC2074.2 IMP 44
   002426         243000 DIV-TEST-F3-8.                                                   NC2074.2
   002427         243100     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 69 68 65
   002428         243200         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A BY 8  NC2074.2 59 47 46
   002429         243300     GIVING ACCUMULATOR1.                                         NC2074.2 44
   002430         243400     IF ACCUMULATOR1 EQUAL TO 1                                   NC2074.2 44
   002431      1  243500         PERFORM PASS                                             NC2074.2 468
   002432      1  243600         GO TO DIV-WRITE-F3-8.                                    NC2074.2 2441
   002433         243700     GO TO DIV-FAIL-F3-8.                                         NC2074.2 2437
   002434         243800 DIV-DELETE-F3-8.                                                 NC2074.2
   002435         243900     PERFORM DE-LETE.                                             NC2074.2 470
   002436         244000     GO TO DIV-WRITE-F3-8.                                        NC2074.2 2441
   002437         244100 DIV-FAIL-F3-8.                                                   NC2074.2
   002438         244200     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002439         244300     MOVE ACCUMULATOR1 TO COMPUTED-N.                             NC2074.2 44 330
   002440         244400     PERFORM FAIL.                                                NC2074.2 469
   002441         244500 DIV-WRITE-F3-8.                                                  NC2074.2
   002442         244600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002443         244700*                                                                 NC2074.2
   002444         244800 DIV-INIT-F3-9.                                                   NC2074.2
   002445         244900     MOVE "DIV-TEST-F3-9  " TO PAR-NAME                           NC2074.2 318
   002446         245000     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002447         245100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002448         245200     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    46
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002449         245300 DIV-TEST-F3-9.                                                   NC2074.2
   002450         245400     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 74 73 72
   002451         245500         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A BY 9  NC2074.2 71 70 46
   002452         245600     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002453         245700     IF ACCUMULATOR2 EQUAL TO 1                                   NC2074.2 45
   002454      1  245800         PERFORM PASS                                             NC2074.2 468
   002455      1  245900         GO TO DIV-WRITE-F3-9.                                    NC2074.2 2464
   002456         246000     GO TO DIV-FAIL-F3-9.                                         NC2074.2 2460
   002457         246100 DIV-DELETE-F3-9.                                                 NC2074.2
   002458         246200     PERFORM DE-LETE.                                             NC2074.2 470
   002459         246300     GO TO DIV-WRITE-F3-9.                                        NC2074.2 2464
   002460         246400 DIV-FAIL-F3-9.                                                   NC2074.2
   002461         246500     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002462         246600     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002463         246700     PERFORM FAIL.                                                NC2074.2 469
   002464         246800 DIV-WRITE-F3-9.                                                  NC2074.2
   002465         246900     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002466         247000*                                                                 NC2074.2
   002467         247100 DIV-INIT-F3-10.                                                  NC2074.2
   002468         247200     MOVE "DIV-TEST-F3-10 " TO PAR-NAME                           NC2074.2 318
   002469         247300     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002470         247400     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002471         247500     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002472         247600 DIV-TEST-F3-10.                                                  NC2074.2
   002473         247700     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 76 75 72
   002474         247800         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A BY 10 NC2074.2 71 70 46
   002475         247900     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002476         248000     IF ACCUMULATOR2 EQUAL TO 1                                   NC2074.2 45
   002477      1  248100         PERFORM PASS                                             NC2074.2 468
   002478      1  248200         GO TO DIV-WRITE-F3-10.                                   NC2074.2 2487
   002479         248300     GO TO DIV-FAIL-F3-10.                                        NC2074.2 2483
   002480         248400 DIV-DELETE-F3-10.                                                NC2074.2
   002481         248500     PERFORM DE-LETE.                                             NC2074.2 470
   002482         248600     GO TO DIV-WRITE-F3-10.                                       NC2074.2 2487
   002483         248700 DIV-FAIL-F3-10.                                                  NC2074.2
   002484         248800     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002485         248900     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002486         249000     PERFORM FAIL.                                                NC2074.2 469
   002487         249100 DIV-WRITE-F3-10.                                                 NC2074.2
   002488         249200     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002489         249300*                                                                 NC2074.2
   002490         249400 DIV-INIT-F3-11.                                                  NC2074.2
   002491         249500     MOVE "DIV-TEST-F3-11 " TO PAR-NAME                           NC2074.2 318
   002492         249600     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002493         249700     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002494         249800     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002495         249900 DIV-TEST-F3-11.                                                  NC2074.2
   002496         250000     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 79 78 77
   002497         250100         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   002498         250200         BY   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 79 78 77
   002499         250300         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   002500         250400     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002501         250500     IF ACCUMULATOR2 EQUAL TO 1                                   NC2074.2 45
   002502      1  250600         PERFORM PASS                                             NC2074.2 468
   002503      1  250700         GO TO DIV-WRITE-F3-11.                                   NC2074.2 2512
   002504         250800     GO TO DIV-FAIL-F3-11.                                        NC2074.2 2508
   002505         250900 DIV-DELETE-F3-11.                                                NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    47
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002506         251000     PERFORM DE-LETE.                                             NC2074.2 470
   002507         251100     GO TO DIV-WRITE-F3-11.                                       NC2074.2 2512
   002508         251200 DIV-FAIL-F3-11.                                                  NC2074.2
   002509         251300     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002510         251400     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002511         251500     PERFORM FAIL.                                                NC2074.2 469
   002512         251600 DIV-WRITE-F3-11.                                                 NC2074.2
   002513         251700     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002514         251800*                                                                 NC2074.2
   002515         251900 DIV-INIT-F3-12.                                                  NC2074.2
   002516         252000     MOVE "DIV-TEST-F3-12 " TO PAR-NAME                           NC2074.2 318
   002517         252100     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002518         252200     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002519         252300     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002520         252400 DIV-TEST-F3-12.                                                  NC2074.2
   002521         252500     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 81 80 77
   002522         252600         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   002523         252700         BY   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 81 80 77
   002524         252800         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 71 70 46
   002525         252900     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002526         253000     IF ACCUMULATOR2 EQUAL TO 1                                   NC2074.2 45
   002527      1  253100         PERFORM PASS                                             NC2074.2 468
   002528      1  253200         GO TO DIV-WRITE-F3-12.                                   NC2074.2 2537
   002529         253300     GO TO DIV-FAIL-F3-12.                                        NC2074.2 2533
   002530         253400 DIV-DELETE-F3-12.                                                NC2074.2
   002531         253500     PERFORM DE-LETE.                                             NC2074.2 470
   002532         253600     GO TO DIV-WRITE-F3-12.                                       NC2074.2 2537
   002533         253700 DIV-FAIL-F3-12.                                                  NC2074.2
   002534         253800     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002535         253900     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002536         254000     PERFORM FAIL.                                                NC2074.2 469
   002537         254100 DIV-WRITE-F3-12.                                                 NC2074.2
   002538         254200     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002539         254300*                                                                 NC2074.2
   002540         254400 DIV-INIT-F3-13.                                                  NC2074.2
   002541         254500     MOVE "DIV-TEST-F3-13 " TO PAR-NAME                           NC2074.2 318
   002542         254600     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002543         254700     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002544         254800     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002545         254900 DIV-TEST-F3-13.                                                  NC2074.2
   002546         255000     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF   NC2074.2 85 84 83
   002547         255100         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A BY 13 NC2074.2 82 70 46
   002548         255200     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002549         255300     IF ACCUMULATOR2 EQUAL TO 1                                   NC2074.2 45
   002550      1  255400         PERFORM PASS                                             NC2074.2 468
   002551      1  255500         GO TO DIV-WRITE-F3-13.                                   NC2074.2 2560
   002552         255600     GO TO DIV-FAIL-F3-13.                                        NC2074.2 2556
   002553         255700 DIV-DELETE-F3-13.                                                NC2074.2
   002554         255800     PERFORM DE-LETE.                                             NC2074.2 470
   002555         255900     GO TO DIV-WRITE-F3-13.                                       NC2074.2 2560
   002556         256000 DIV-FAIL-F3-13.                                                  NC2074.2
   002557         256100     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002558         256200     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002559         256300     PERFORM FAIL.                                                NC2074.2 469
   002560         256400 DIV-WRITE-F3-13.                                                 NC2074.2
   002561         256500     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002562         256600*                                                                 NC2074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    48
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002563         256700 DIV-INIT-F3-14.                                                  NC2074.2
   002564         256800     MOVE "DIV-TEST-F3-14 " TO PAR-NAME                           NC2074.2 318
   002565         256900     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002566         257000     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002567         257100     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002568         257200 DIV-TEST-F3-14.                                                  NC2074.2
   002569         257300     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2A OF   NC2074.2 87 86 83
   002570         257400         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A BY 14 NC2074.2 82 70 46
   002571         257500     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002572         257600     IF ACCUMULATOR2 EQUAL TO 1                                   NC2074.2 45
   002573      1  257700         PERFORM PASS                                             NC2074.2 468
   002574      1  257800         GO TO DIV-WRITE-F3-14.                                   NC2074.2 2583
   002575         257900     GO TO DIV-FAIL-F3-14.                                        NC2074.2 2579
   002576         258000 DIV-DELETE-F3-14.                                                NC2074.2
   002577         258100     PERFORM DE-LETE.                                             NC2074.2 470
   002578         258200     GO TO DIV-WRITE-F3-14.                                       NC2074.2 2583
   002579         258300 DIV-FAIL-F3-14.                                                  NC2074.2
   002580         258400     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002581         258500     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002582         258600     PERFORM FAIL.                                                NC2074.2 469
   002583         258700 DIV-WRITE-F3-14.                                                 NC2074.2
   002584         258800     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002585         258900*                                                                 NC2074.2
   002586         259000 DIV-INIT-F3-15.                                                  NC2074.2
   002587         259100     MOVE "DIV-TEST-F3-15 " TO PAR-NAME                           NC2074.2 318
   002588         259200     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002589         259300     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002590         259400     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002591         259500 DIV-TEST-F3-15.                                                  NC2074.2
   002592         259600     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 90 89 88
   002593         259700         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   002594         259800         BY   TBL-ITEM-1 OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B OF   NC2074.2 90 89 88
   002595         259900         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   002596         260000     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002597         260100     IF ACCUMULATOR2 EQUAL TO 1                                   NC2074.2 45
   002598      1  260200         PERFORM PASS                                             NC2074.2 468
   002599      1  260300         GO TO DIV-WRITE-F3-15.                                   NC2074.2 2608
   002600         260400     GO TO DIV-FAIL-F3-15.                                        NC2074.2 2604
   002601         260500 DIV-DELETE-F3-15.                                                NC2074.2
   002602         260600     PERFORM DE-LETE.                                             NC2074.2 470
   002603         260700     GO TO DIV-WRITE-F3-15.                                       NC2074.2 2608
   002604         260800 DIV-FAIL-F3-15.                                                  NC2074.2
   002605         260900     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002606         261000     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002607         261100     PERFORM FAIL.                                                NC2074.2 469
   002608         261200 DIV-WRITE-F3-15.                                                 NC2074.2
   002609         261300     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002610         261400*                                                                 NC2074.2
   002611         261500 DIV-INIT-F3-16.                                                  NC2074.2
   002612         261600     MOVE "DIV-TEST-F3-16 " TO PAR-NAME                           NC2074.2 318
   002613         261700     MOVE "QUALIFIED DIVIDE " TO  FEATURE.                        NC2074.2 314
   002614         261800     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2074.2 374
   002615         261900     MOVE ZERO TO ACCUMULATOR2.                                   NC2074.2 IMP 45
   002616         262000 DIV-TEST-F3-16.                                                  NC2074.2
   002617         262100     DIVIDE   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 92 91 88
   002618         262200         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   002619         262300         BY   TBL-ITEM-1 OF TABLE-LEVEL-1B IN TABLE-LEVEL-2B OF   NC2074.2 92 91 88
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    49
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002620         262400         TABLE-LEVEL-3B IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2074.2 82 70 46
   002621         262500     GIVING ACCUMULATOR2.                                         NC2074.2 45
   002622         262600     IF ACCUMULATOR2 EQUAL TO 1                                   NC2074.2 45
   002623      1  262700         PERFORM PASS                                             NC2074.2 468
   002624      1  262800         GO TO DIV-WRITE-F3-16.                                   NC2074.2 2633
   002625         262900     GO TO DIV-FAIL-F3-16.                                        NC2074.2 2629
   002626         263000 DIV-DELETE-F3-16.                                                NC2074.2
   002627         263100     PERFORM DE-LETE.                                             NC2074.2 470
   002628         263200     GO TO DIV-WRITE-F3-16.                                       NC2074.2 2633
   002629         263300 DIV-FAIL-F3-16.                                                  NC2074.2
   002630         263400     MOVE 1 TO CORRECT-N.                                         NC2074.2 344
   002631         263500     MOVE ACCUMULATOR2 TO COMPUTED-N.                             NC2074.2 45 330
   002632         263600     PERFORM FAIL.                                                NC2074.2 469
   002633         263700 DIV-WRITE-F3-16.                                                 NC2074.2
   002634         263800     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002635         263900*                                                                 NC2074.2
   002636         264000 DIV-INIT-F3-17.                                                  NC2074.2
   002637         264100*    ===-->  48 LEVELS OF QUALIFICATION  <--===                   NC2074.2
   002638         264200     MOVE   "DIV-TEST-F3-17 " TO PAR-NAME.                        NC2074.2 318
   002639         264300     MOVE   "VI-2 1.3.2" TO ANSI-REFERENCE.                       NC2074.2 374
   002640         264400     MOVE    ZERO TO ACCUMULATOR1.                                NC2074.2 IMP 44
   002641         264500 DIV-TEST-F3-17.                                                  NC2074.2
   002642         264600     DIVIDE  GROUP-49-4  OF GROUP-48 IN GROUP-47 OF GROUP-46      NC2074.2 309 305 304 303
   002643         264700             IN GROUP-45 OF GROUP-44 IN GROUP-43 OF GROUP-42      NC2074.2 302 301 300 299
   002644         264800             IN GROUP-41 OF GROUP-40 IN GROUP-39 OF GROUP-38      NC2074.2 298 297 296 295
   002645         264900             IN GROUP-37 OF GROUP-36 IN GROUP-35 OF GROUP-34      NC2074.2 294 293 292 291
   002646         265000             IN GROUP-33 OF GROUP-32 IN GROUP-31 OF GROUP-30      NC2074.2 290 289 288 287
   002647         265100             IN GROUP-29 OF GROUP-28 IN GROUP-27 OF GROUP-26      NC2074.2 286 285 284 283
   002648         265200             IN GROUP-25 OF GROUP-24 IN GROUP-23 OF GROUP-22      NC2074.2 282 281 280 279
   002649         265300             IN GROUP-21 OF GROUP-20 IN GROUP-19 OF GROUP-18      NC2074.2 278 277 276 275
   002650         265400             IN GROUP-17 OF GROUP-16 IN GROUP-15 OF GROUP-14      NC2074.2 274 273 272 271
   002651         265500             IN GROUP-13 OF GROUP-12 IN GROUP-11 OF GROUP-10      NC2074.2 270 269 268 267
   002652         265600             IN GROUP-09 OF GROUP-08 IN GROUP-07 OF GROUP-06      NC2074.2 266 265 264 263
   002653         265700             IN GROUP-05 OF GROUP-04 IN GROUP-03 OF GROUP-02      NC2074.2 262 261 260 259
   002654         265800             IN SECOND-GROUP                                      NC2074.2 258
   002655         265900          BY 40                                                   NC2074.2
   002656         266000       GIVING ACCUMULATOR1.                                       NC2074.2 44
   002657         266100     IF      ACCUMULATOR1 EQUAL TO 10                             NC2074.2 44
   002658      1  266200             PERFORM PASS                                         NC2074.2 468
   002659      1  266300             GO TO   DIV-WRITE-F3-17.                             NC2074.2 2681
   002660         266400     GO TO DIV-FAIL-F3-17.                                        NC2074.2 2664
   002661         266500 DIV-DELETE-F3-17.                                                NC2074.2
   002662         266600     PERFORM DE-LETE.                                             NC2074.2 470
   002663         266700     GO TO   DIV-WRITE-F3-17.                                     NC2074.2 2681
   002664         266800 DIV-FAIL-F3-17.                                                  NC2074.2
   002665         266900     MOVE    10 TO CORRECT-N.                                     NC2074.2 344
   002666         267000     MOVE    GROUP-49-4  OF GROUP-48 IN GROUP-47 OF GROUP-46      NC2074.2 309 305 304 303
   002667         267100             IN GROUP-45 OF GROUP-44 IN GROUP-43 OF GROUP-42      NC2074.2 302 301 300 299
   002668         267200             IN GROUP-41 OF GROUP-40 IN GROUP-39 OF GROUP-38      NC2074.2 298 297 296 295
   002669         267300             IN GROUP-37 OF GROUP-36 IN GROUP-35 OF GROUP-34      NC2074.2 294 293 292 291
   002670         267400             IN GROUP-33 OF GROUP-32 IN GROUP-31 OF GROUP-30      NC2074.2 290 289 288 287
   002671         267500             IN GROUP-29 OF GROUP-28 IN GROUP-27 OF GROUP-26      NC2074.2 286 285 284 283
   002672         267600             IN GROUP-25 OF GROUP-24 IN GROUP-23 OF GROUP-22      NC2074.2 282 281 280 279
   002673         267700             IN GROUP-21 OF GROUP-20 IN GROUP-19 OF GROUP-18      NC2074.2 278 277 276 275
   002674         267800             IN GROUP-17 OF GROUP-16 IN GROUP-15 OF GROUP-14      NC2074.2 274 273 272 271
   002675         267900             IN GROUP-13 OF GROUP-12 IN GROUP-11 OF GROUP-10      NC2074.2 270 269 268 267
   002676         268000             IN GROUP-09 OF GROUP-08 IN GROUP-07 OF GROUP-06      NC2074.2 266 265 264 263
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    50
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002677         268100             IN GROUP-05 OF GROUP-04 IN GROUP-03 OF GROUP-02      NC2074.2 262 261 260 259
   002678         268200             IN SECOND-GROUP                                      NC2074.2 258
   002679         268300          TO COMPUTED-N.                                          NC2074.2 330
   002680         268400     PERFORM FAIL.                                                NC2074.2 469
   002681         268500 DIV-WRITE-F3-17.                                                 NC2074.2
   002682         268600     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002683         268700     PERFORM END-ROUTINE.                                         NC2074.2 493
   002684         268800*                                                                 NC2074.2
   002685         268900 CND-INIT-GF-1.                                                   NC2074.2
   002686         269000*    ===-->  48 LEVELS OF QUALIFICATION  <--===                   NC2074.2
   002687         269100     MOVE   "CND-TEST-GF-1 " TO PAR-NAME.                         NC2074.2 318
   002688         269200     MOVE   "VI-2 1.3.2" TO ANSI-REFERENCE.                       NC2074.2 374
   002689         269300     MOVE   "CONDITION NAME " TO  FEATURE.                        NC2074.2 314
   002690         269400 CND-TEST-GF-1.                                                   NC2074.2
   002691         269500     IF      LEVEL-49-OK                                          NC2074.2 311
   002692      1  269600             PERFORM PASS                                         NC2074.2 468
   002693      1  269700             GO TO   CND-WRITE-GF-1.                              NC2074.2 2715
   002694         269800     GO TO CND-FAIL-GF-1.                                         NC2074.2 2698
   002695         269900 CND-DELETE-GF-1.                                                 NC2074.2
   002696         270000     PERFORM DE-LETE.                                             NC2074.2 470
   002697         270100     GO TO   CND-WRITE-GF-1.                                      NC2074.2 2715
   002698         270200 CND-FAIL-GF-1.                                                   NC2074.2
   002699         270300     MOVE    500 TO CORRECT-N.                                    NC2074.2 344
   002700         270400     MOVE    GROUP-49-5  OF GROUP-48 IN GROUP-47 OF GROUP-46      NC2074.2 310 305 304 303
   002701         270500             IN GROUP-45 OF GROUP-44 IN GROUP-43 OF GROUP-42      NC2074.2 302 301 300 299
   002702         270600             IN GROUP-41 OF GROUP-40 IN GROUP-39 OF GROUP-38      NC2074.2 298 297 296 295
   002703         270700             IN GROUP-37 OF GROUP-36 IN GROUP-35 OF GROUP-34      NC2074.2 294 293 292 291
   002704         270800             IN GROUP-33 OF GROUP-32 IN GROUP-31 OF GROUP-30      NC2074.2 290 289 288 287
   002705         270900             IN GROUP-29 OF GROUP-28 IN GROUP-27 OF GROUP-26      NC2074.2 286 285 284 283
   002706         271000             IN GROUP-25 OF GROUP-24 IN GROUP-23 OF GROUP-22      NC2074.2 282 281 280 279
   002707         271100             IN GROUP-21 OF GROUP-20 IN GROUP-19 OF GROUP-18      NC2074.2 278 277 276 275
   002708         271200             IN GROUP-17 OF GROUP-16 IN GROUP-15 OF GROUP-14      NC2074.2 274 273 272 271
   002709         271300             IN GROUP-13 OF GROUP-12 IN GROUP-11 OF GROUP-10      NC2074.2 270 269 268 267
   002710         271400             IN GROUP-09 OF GROUP-08 IN GROUP-07 OF GROUP-06      NC2074.2 266 265 264 263
   002711         271500             IN GROUP-05 OF GROUP-04 IN GROUP-03 OF GROUP-02      NC2074.2 262 261 260 259
   002712         271600             IN SECOND-GROUP                                      NC2074.2 258
   002713         271700          TO COMPUTED-N.                                          NC2074.2 330
   002714         271800     PERFORM FAIL.                                                NC2074.2 469
   002715         271900 CND-WRITE-GF-1.                                                  NC2074.2
   002716         272000     PERFORM PRINT-DETAIL.                                        NC2074.2 472
   002717         272100 CCVS-EXIT SECTION.                                               NC2074.2
   002718         272200 CCVS-999999.                                                     NC2074.2
   002719         272300     GO TO CLOSE-FILES.                                           NC2074.2 461
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    51
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       44   ACCUMULATOR1 . . . . . . . . .  M573 M577 578 M598 M602 603 M623 M627 628 M648 M652 653 M673 M677 678 M698 M702
                                            703 M723 M727 728 M748 M752 753 M1206 M1212 1213 1222 M1231 M1237 1238 1247 M1256
                                            M1262 1263 1272 M1281 M1287 1288 1297 M1306 M1312 1313 1322 M1330 M1336 1337
                                            1346 M1354 M1360 1361 1370 M1378 M1384 1385 1394 M1773 M1789 1790 M1823 M1828
                                            1829 1837 M1847 M1853 1854 1864 M1872 M1876 1877 1885 M1895 M1899 1900 1908 M1918
                                            M1924 1925 1933 M1943 M1949 1950 1958 M1968 M1972 1973 1981 M1991 M1995 1996
                                            2004 M2206 M2222 2223 M2256 M2262 2263 2271 M2281 M2287 2288 2297 M2306 M2310
                                            2311 2320 M2329 M2333 2334 2343 M2352 M2358 2359 2368 M2377 M2383 2384 2393 M2402
                                            M2406 2407 2416 M2425 M2429 2430 2439 M2640 M2656 2657
       45   ACCUMULATOR2 . . . . . . . . .  M773 M779 780 788 M798 M804 805 813 M823 M829 830 838 M848 M854 855 863 M873
                                            M879 880 888 M898 M904 905 913 M923 M929 930 938 M948 M954 955 963 M1158 M1173
                                            1174 M1402 M1408 1409 1418 M1426 M1432 1433 1442 M1450 M1456 1457 1466 M1474
                                            M1480 1481 1490 M1498 M1504 1505 1514 M1522 M1528 1529 1538 M1546 M1552 1553
                                            1562 M1570 M1576 1577 1586 M2014 M2018 2019 2027 M2037 M2041 2042 2050 M2060
                                            M2066 2067 2075 M2085 M2091 2092 2100 M2110 M2114 2115 2123 M2133 M2137 2138
                                            2146 M2156 M2162 2163 2171 M2181 M2187 2188 2196 M2448 M2452 2453 2462 M2471
                                            M2475 2476 2485 M2494 M2500 2501 2510 M2519 M2525 2526 2535 M2544 M2548 2549
                                            2558 M2567 M2571 2572 2581 M2590 M2596 2597 2606 M2615 M2621 2622 2631
      374   ANSI-REFERENCE . . . . . . . .  546 553 562 M572 M597 M622 M647 M672 M697 M722 M747 M772 M797 M822 M847 M872
                                            M897 M922 M947 M971 M995 M1017 M1040 M1064 M1087 M1110 M1133 M1157 M1204 M1230
                                            M1255 M1280 M1305 M1329 M1353 M1377 M1401 M1425 M1449 M1473 M1497 M1521 M1545
                                            M1569 M1593 M1617 M1639 M1661 M1683 M1705 M1727 M1749 M1772 M1821 M1846 M1871
                                            M1894 M1917 M1942 M1967 M1990 M2012 M2035 M2058 M2083 M2108 M2131 M2154 M2179
                                            M2205 M2255 M2280 M2305 M2328 M2351 M2376 M2401 M2424 M2447 M2470 M2493 M2518
                                            M2543 M2566 M2589 M2614 M2639 M2688
      353   CCVS-C-1 . . . . . . . . . . .  490 532
      358   CCVS-C-2 . . . . . . . . . . .  491 533
      408   CCVS-E-1 . . . . . . . . . . .  496
      413   CCVS-E-2 . . . . . . . . . . .  505 512 519 524
      416   CCVS-E-2-2 . . . . . . . . . .  M504
      421   CCVS-E-3 . . . . . . . . . . .  525
      430   CCVS-E-4 . . . . . . . . . . .  504
      431   CCVS-E-4-1 . . . . . . . . . .  M502
      433   CCVS-E-4-2 . . . . . . . . . .  M503
      375   CCVS-H-1 . . . . . . . . . . .  485
      380   CCVS-H-2A. . . . . . . . . . .  486
      389   CCVS-H-2B. . . . . . . . . . .  487
      401   CCVS-H-3 . . . . . . . . . . .  488
      451   CCVS-PGM-ID. . . . . . . . . .  457 457
      335   CM-18V0
      329   COMPUTED-A . . . . . . . . . .  330 332 333 334 335 558 561
      330   COMPUTED-N . . . . . . . . . .  M589 M614 M638 M664 M689 M714 M738 M763 M788 M813 M838 M863 M888 M913 M938 M963
                                            M988 M1010 M1033 M1056 M1079 M1102 M1125 M1148 M1196 M1222 M1247 M1272 M1297
                                            M1322 M1346 M1370 M1394 M1418 M1442 M1466 M1490 M1514 M1538 M1562 M1586 M1610
                                            M1632 M1654 M1676 M1698 M1720 M1742 M1764 M1812 M1837 M1864 M1885 M1908 M1933
                                            M1958 M1981 M2004 M2027 M2050 M2075 M2100 M2123 M2146 M2171 M2196 M2245 M2271
                                            M2297 M2320 M2343 M2368 M2393 M2416 M2439 M2462 M2485 M2510 M2535 M2558 M2581
                                            M2606 M2631 M2679 M2713
      328   COMPUTED-X . . . . . . . . . .  M480 544
      332   COMPUTED-0V18
      334   COMPUTED-14V4
      336   COMPUTED-18V0
      333   COMPUTED-4V14
      352   COR-ANSI-REFERENCE . . . . . .  M553 M555
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    52
0 Defined   Cross-reference of data names   References

0     343   CORRECT-A. . . . . . . . . . .  344 345 346 347 348 559 561
      344   CORRECT-N. . . . . . . . . . .  M586 M611 M639 M661 M686 M711 M739 M764 M789 M814 M839 M864 M889 M914 M939 M964
                                            M985 M1007 M1030 M1053 M1076 M1099 M1122 M1145 M1182 M1221 M1246 M1271 M1296
                                            M1321 M1345 M1369 M1393 M1417 M1441 M1465 M1489 M1513 M1537 M1561 M1585 M1607
                                            M1629 M1651 M1673 M1695 M1717 M1739 M1761 M1798 M1838 M1862 M1886 M1909 M1934
                                            M1959 M1982 M2005 M2028 M2051 M2076 M2101 M2124 M2147 M2172 M2197 M2231 M2272
                                            M2296 M2319 M2342 M2367 M2392 M2415 M2438 M2461 M2484 M2509 M2534 M2557 M2580
                                            M2605 M2630 M2665 M2699
      342   CORRECT-X. . . . . . . . . . .  M481 545
      345   CORRECT-0V18
      347   CORRECT-14V4
      349   CORRECT-18V0
      346   CORRECT-4V14
      348   CR-18V0
      366   DELETE-COUNTER . . . . . . . .  M470 499 515 517
      321   DOTVALUE . . . . . . . . . . .  M475
      372   DUMMY-HOLD . . . . . . . . . .  M529 535
       42   DUMMY-RECORD . . . . . . . . .  M485 M486 M487 M488 M490 M491 M492 M494 M496 M505 M512 M519 M524 M525 529 M530
                                            531 M532 M533 M534 M535 539 M540 M548 M563
      419   ENDER-DESC . . . . . . . . . .  M507 M518 M523
      367   ERROR-COUNTER. . . . . . . . .  M469 498 508 511
      371   ERROR-HOLD . . . . . . . . . .  M498 M499 M499 M500 503
      417   ERROR-TOTAL. . . . . . . . . .  M509 M511 M516 M517 M521 M522
      314   FEATURE. . . . . . . . . . . .  M571 M596 M621 M646 M671 M696 M721 M746 M771 M796 M821 M846 M871 M896 M921 M946
                                            M972 M996 M1018 M1041 M1063 M1086 M1109 M1132 M1203 M1229 M1254 M1279 M1303 M1594
                                            M1820 M1845 M1870 M1893 M1916 M1941 M1966 M1989 M2013 M2036 M2059 M2084 M2109
                                            M2132 M2155 M2180 M2254 M2279 M2304 M2327 M2350 M2375 M2400 M2423 M2446 M2469
                                            M2492 M2517 M2542 M2565 M2588 M2613 M2689
      205   FIRST-GROUP. . . . . . . . . .  2220 2244
      206   GROUP-02 . . . . . . . . . . .  2219 2243
      259   GROUP-02 . . . . . . . . . . .  1171 1194 1786 1810 2653 2677 2711
      207   GROUP-03 . . . . . . . . . . .  2219 2243
      260   GROUP-03 . . . . . . . . . . .  1171 1194 1786 1810 2653 2677 2711
      208   GROUP-04 . . . . . . . . . . .  2219 2243
      261   GROUP-04 . . . . . . . . . . .  1171 1194 1786 1810 2653 2677 2711
      209   GROUP-05 . . . . . . . . . . .  2219 2243
      262   GROUP-05 . . . . . . . . . . .  1171 1194 1786 1810 2653 2677 2711
      210   GROUP-06 . . . . . . . . . . .  2218 2242
      263   GROUP-06 . . . . . . . . . . .  1170 1193 1785 1809 2652 2676 2710
      211   GROUP-07 . . . . . . . . . . .  2218 2242
      264   GROUP-07 . . . . . . . . . . .  1170 1193 1785 1809 2652 2676 2710
      212   GROUP-08 . . . . . . . . . . .  2218 2242
      265   GROUP-08 . . . . . . . . . . .  1170 1193 1785 1809 2652 2676 2710
      213   GROUP-09 . . . . . . . . . . .  2218 2242
      266   GROUP-09 . . . . . . . . . . .  1170 1193 1785 1809 2652 2676 2710
      214   GROUP-10 . . . . . . . . . . .  2217 2241
      267   GROUP-10 . . . . . . . . . . .  1169 1192 1784 1808 2651 2675 2709
      215   GROUP-11 . . . . . . . . . . .  2217 2241
      268   GROUP-11 . . . . . . . . . . .  1169 1192 1784 1808 2651 2675 2709
      216   GROUP-12 . . . . . . . . . . .  2217 2241
      269   GROUP-12 . . . . . . . . . . .  1169 1192 1784 1808 2651 2675 2709
      217   GROUP-13 . . . . . . . . . . .  2217 2241
      270   GROUP-13 . . . . . . . . . . .  1169 1192 1784 1808 2651 2675 2709
      218   GROUP-14 . . . . . . . . . . .  2216 2240
      271   GROUP-14 . . . . . . . . . . .  1168 1191 1783 1807 2650 2674 2708
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    53
0 Defined   Cross-reference of data names   References

0     219   GROUP-15 . . . . . . . . . . .  2216 2240
      272   GROUP-15 . . . . . . . . . . .  1168 1191 1783 1807 2650 2674 2708
      220   GROUP-16 . . . . . . . . . . .  2216 2240
      273   GROUP-16 . . . . . . . . . . .  1168 1191 1783 1807 2650 2674 2708
      221   GROUP-17 . . . . . . . . . . .  2216 2240
      274   GROUP-17 . . . . . . . . . . .  1168 1191 1783 1807 2650 2674 2708
      222   GROUP-18 . . . . . . . . . . .  2215 2239
      275   GROUP-18 . . . . . . . . . . .  1167 1190 1782 1806 2649 2673 2707
      223   GROUP-19 . . . . . . . . . . .  2215 2239
      276   GROUP-19 . . . . . . . . . . .  1167 1190 1782 1806 2649 2673 2707
      224   GROUP-20 . . . . . . . . . . .  2215 2239
      277   GROUP-20 . . . . . . . . . . .  1167 1190 1782 1806 2649 2673 2707
      225   GROUP-21 . . . . . . . . . . .  2215 2239
      278   GROUP-21 . . . . . . . . . . .  1167 1190 1782 1806 2649 2673 2707
      226   GROUP-22 . . . . . . . . . . .  2214 2238
      279   GROUP-22 . . . . . . . . . . .  1166 1189 1781 1805 2648 2672 2706
      227   GROUP-23 . . . . . . . . . . .  2214 2238
      280   GROUP-23 . . . . . . . . . . .  1166 1189 1781 1805 2648 2672 2706
      228   GROUP-24 . . . . . . . . . . .  2214 2238
      281   GROUP-24 . . . . . . . . . . .  1166 1189 1781 1805 2648 2672 2706
      229   GROUP-25 . . . . . . . . . . .  2214 2238
      282   GROUP-25 . . . . . . . . . . .  1166 1189 1781 1805 2648 2672 2706
      230   GROUP-26 . . . . . . . . . . .  2213 2237
      283   GROUP-26 . . . . . . . . . . .  1165 1188 1780 1804 2647 2671 2705
      231   GROUP-27 . . . . . . . . . . .  2213 2237
      284   GROUP-27 . . . . . . . . . . .  1165 1188 1780 1804 2647 2671 2705
      232   GROUP-28 . . . . . . . . . . .  2213 2237
      285   GROUP-28 . . . . . . . . . . .  1165 1188 1780 1804 2647 2671 2705
      233   GROUP-29 . . . . . . . . . . .  2213 2237
      286   GROUP-29 . . . . . . . . . . .  1165 1188 1780 1804 2647 2671 2705
      234   GROUP-30 . . . . . . . . . . .  2212 2236
      287   GROUP-30 . . . . . . . . . . .  1164 1187 1779 1803 2646 2670 2704
      235   GROUP-31 . . . . . . . . . . .  2212 2236
      288   GROUP-31 . . . . . . . . . . .  1164 1187 1779 1803 2646 2670 2704
      236   GROUP-32 . . . . . . . . . . .  2212 2236
      289   GROUP-32 . . . . . . . . . . .  1164 1187 1779 1803 2646 2670 2704
      237   GROUP-33 . . . . . . . . . . .  2212 2236
      290   GROUP-33 . . . . . . . . . . .  1164 1187 1779 1803 2646 2670 2704
      238   GROUP-34 . . . . . . . . . . .  2211 2235
      291   GROUP-34 . . . . . . . . . . .  1163 1186 1778 1802 2645 2669 2703
      239   GROUP-35 . . . . . . . . . . .  2211 2235
      292   GROUP-35 . . . . . . . . . . .  1163 1186 1778 1802 2645 2669 2703
      240   GROUP-36 . . . . . . . . . . .  2211 2235
      293   GROUP-36 . . . . . . . . . . .  1163 1186 1778 1802 2645 2669 2703
      241   GROUP-37 . . . . . . . . . . .  2211 2235
      294   GROUP-37 . . . . . . . . . . .  1163 1186 1778 1802 2645 2669 2703
      242   GROUP-38 . . . . . . . . . . .  2210 2234
      295   GROUP-38 . . . . . . . . . . .  1162 1185 1777 1801 2644 2668 2702
      243   GROUP-39 . . . . . . . . . . .  2210 2234
      296   GROUP-39 . . . . . . . . . . .  1162 1185 1777 1801 2644 2668 2702
      244   GROUP-40 . . . . . . . . . . .  2210 2234
      297   GROUP-40 . . . . . . . . . . .  1162 1185 1777 1801 2644 2668 2702
      245   GROUP-41 . . . . . . . . . . .  2210 2234
      298   GROUP-41 . . . . . . . . . . .  1162 1185 1777 1801 2644 2668 2702
      246   GROUP-42 . . . . . . . . . . .  2209 2233
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    54
0 Defined   Cross-reference of data names   References

0     299   GROUP-42 . . . . . . . . . . .  1161 1184 1776 1800 2643 2667 2701
      247   GROUP-43 . . . . . . . . . . .  2209 2233
      300   GROUP-43 . . . . . . . . . . .  1161 1184 1776 1800 2643 2667 2701
      248   GROUP-44 . . . . . . . . . . .  2209 2233
      301   GROUP-44 . . . . . . . . . . .  1161 1184 1776 1800 2643 2667 2701
      249   GROUP-45 . . . . . . . . . . .  2209 2233
      302   GROUP-45 . . . . . . . . . . .  1161 1184 1776 1800 2643 2667 2701
      250   GROUP-46 . . . . . . . . . . .  2208 2232
      303   GROUP-46 . . . . . . . . . . .  1160 1183 1775 1799 2642 2666 2700
      251   GROUP-47 . . . . . . . . . . .  2208 2232
      304   GROUP-47 . . . . . . . . . . .  1160 1183 1775 1799 2642 2666 2700
      252   GROUP-48 . . . . . . . . . . .  2208 2232
      305   GROUP-48 . . . . . . . . . . .  1160 1183 1775 1799 2642 2666 2700
      253   GROUP-49-1
      306   GROUP-49-1 . . . . . . . . . .  1160 1183
      254   GROUP-49-2
      307   GROUP-49-2 . . . . . . . . . .  1775 1799
      255   GROUP-49-3 . . . . . . . . . .  2208 2232
      308   GROUP-49-3
      256   GROUP-49-4
      309   GROUP-49-4 . . . . . . . . . .  2642 2666
      257   GROUP-49-5
      310   GROUP-49-5 . . . . . . . . . .  2700
      445   HYPHEN-LINE. . . . . . . . . .  492 494 534
      411   ID-AGAIN . . . . . . . . . . .  M457
      444   INF-ANSI-REFERENCE . . . . . .  M546 M549 M562 M564
      439   INFO-TEXT. . . . . . . . . . .  M547
      368   INSPECT-COUNTER. . . . . . . .  M467 498 520 522
      311   LEVEL-49-OK. . . . . . . . . .  2691
      316   P-OR-F . . . . . . . . . . . .  M467 M468 M469 M470 477 M480
      318   PAR-NAME . . . . . . . . . . .  M482 M570 M595 M620 M645 M670 M695 M720 M745 M770 M795 M820 M845 M870 M895 M920
                                            M945 M970 M994 M1016 M1039 M1062 M1085 M1108 M1131 M1156 M1202 M1228 M1253 M1278
                                            M1304 M1328 M1352 M1376 M1400 M1424 M1448 M1472 M1496 M1520 M1544 M1568 M1592
                                            M1616 M1638 M1660 M1682 M1704 M1726 M1748 M1771 M1819 M1844 M1869 M1892 M1915
                                            M1940 M1965 M1988 M2011 M2034 M2057 M2082 M2107 M2130 M2153 M2178 M2204 M2253
                                            M2278 M2303 M2326 M2349 M2374 M2399 M2422 M2445 M2468 M2491 M2516 M2541 M2564
                                            M2587 M2612 M2638 M2687
      320   PARDOT-X . . . . . . . . . . .  M474
      369   PASS-COUNTER . . . . . . . . .  M468 500 502
       40   PRINT-FILE . . . . . . . . . .  36 456 462
       41   PRINT-REC. . . . . . . . . . .  M476 M552 M554
      323   RE-MARK. . . . . . . . . . . .  M471 M483 M2246
      365   REC-CT . . . . . . . . . . . .  473 475 482
      364   REC-SKL-SUB
      373   RECORD-COUNT . . . . . . . . .  M527 528 M536
      258   SECOND-GROUP . . . . . . . . .  1172 1195 1787 1811 2654 2678 2712
       50   TABLE-LEVEL-1A . . . . . . . .  575 587 1208 1824 1826 2258 2260
       55   TABLE-LEVEL-1A . . . . . . . .  625 636 1258 1874 2308
       61   TABLE-LEVEL-1A . . . . . . . .  675 687 1308 1920 1922 2354 2356
       66   TABLE-LEVEL-1A . . . . . . . .  725 736 1356 1970 2404
       73   TABLE-LEVEL-1A . . . . . . . .  775 777 1404 1406 2016 2450
       78   TABLE-LEVEL-1A . . . . . . . .  825 827 1454 2062 2064 2496 2498
       84   TABLE-LEVEL-1A . . . . . . . .  875 877 1502 2112 2546
       89   TABLE-LEVEL-1A . . . . . . . .  925 927 1550 2158 2160 2592 2594
       97   TABLE-LEVEL-1A . . . . . . . .  975 986 1210
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    55
0 Defined   Cross-reference of data names   References

0     102   TABLE-LEVEL-1A . . . . . . . .  1020 1031 1260
      108   TABLE-LEVEL-1A . . . . . . . .  1066 1077 1310
      113   TABLE-LEVEL-1A . . . . . . . .  1112 1123 1358
      120   TABLE-LEVEL-1A
      125   TABLE-LEVEL-1A . . . . . . . .  1452
      131   TABLE-LEVEL-1A . . . . . . . .  1500
      136   TABLE-LEVEL-1A . . . . . . . .  1548
      145   TABLE-LEVEL-1A . . . . . . . .  1597 1608
      150   TABLE-LEVEL-1A . . . . . . . .  1641 1652
      156   TABLE-LEVEL-1A . . . . . . . .  1685 1696
      161   TABLE-LEVEL-1A . . . . . . . .  1729 1740
      168   TABLE-LEVEL-1A
      173   TABLE-LEVEL-1A
      179   TABLE-LEVEL-1A
      184   TABLE-LEVEL-1A
       52   TABLE-LEVEL-1B . . . . . . . .  600 612 1233 1849 1851 2283 2285
       57   TABLE-LEVEL-1B . . . . . . . .  650 662 1283 1897 2331
       63   TABLE-LEVEL-1B . . . . . . . .  700 712 1332 1945 1947 2379 2381
       68   TABLE-LEVEL-1B . . . . . . . .  750 761 1380 1993 2427
       75   TABLE-LEVEL-1B . . . . . . . .  800 802 1430 2039 2473
       80   TABLE-LEVEL-1B . . . . . . . .  850 852 1478 2087 2089 2521 2523
       86   TABLE-LEVEL-1B . . . . . . . .  900 902 1526 2135 2569
       91   TABLE-LEVEL-1B . . . . . . . .  950 952 1574 2183 2185 2617 2619
       99   TABLE-LEVEL-1B . . . . . . . .  998 1008 1235
      104   TABLE-LEVEL-1B . . . . . . . .  1043 1054 1285
      110   TABLE-LEVEL-1B . . . . . . . .  1089 1100 1334
      115   TABLE-LEVEL-1B . . . . . . . .  1135 1146 1382
      122   TABLE-LEVEL-1B . . . . . . . .  1428
      127   TABLE-LEVEL-1B . . . . . . . .  1476
      133   TABLE-LEVEL-1B . . . . . . . .  1524
      138   TABLE-LEVEL-1B . . . . . . . .  1572
      147   TABLE-LEVEL-1B . . . . . . . .  1619 1630
      152   TABLE-LEVEL-1B . . . . . . . .  1663 1674
      158   TABLE-LEVEL-1B . . . . . . . .  1707 1718
      163   TABLE-LEVEL-1B . . . . . . . .  1751 1762
      170   TABLE-LEVEL-1B
      175   TABLE-LEVEL-1B
      181   TABLE-LEVEL-1B
      186   TABLE-LEVEL-1B
       49   TABLE-LEVEL-2A . . . . . . . .  575 587 600 612 1208 1233 1824 1826 1849 1851 2258 2260 2283 2285
       60   TABLE-LEVEL-2A . . . . . . . .  675 687 700 712 1308 1332 1920 1922 1945 1947 2354 2356 2379 2381
       72   TABLE-LEVEL-2A . . . . . . . .  775 777 800 802 1404 1406 1430 2016 2039 2450 2473
       83   TABLE-LEVEL-2A . . . . . . . .  875 877 900 902 1502 1526 2112 2135 2546 2569
       96   TABLE-LEVEL-2A . . . . . . . .  975 986 998 1008 1210 1235
      107   TABLE-LEVEL-2A . . . . . . . .  1066 1077 1089 1100 1310 1334
      119   TABLE-LEVEL-2A . . . . . . . .  1428
      130   TABLE-LEVEL-2A . . . . . . . .  1500 1524
      144   TABLE-LEVEL-2A . . . . . . . .  1597 1608 1619 1630
      155   TABLE-LEVEL-2A . . . . . . . .  1685 1696 1707 1718
      167   TABLE-LEVEL-2A
      178   TABLE-LEVEL-2A
       54   TABLE-LEVEL-2B . . . . . . . .  625 636 650 662 1258 1283 1874 1897 2308 2331
       65   TABLE-LEVEL-2B . . . . . . . .  725 736 750 761 1356 1380 1970 1993 2404 2427
       77   TABLE-LEVEL-2B . . . . . . . .  825 827 850 852 1454 1478 2062 2064 2087 2089 2496 2498 2521 2523
       88   TABLE-LEVEL-2B . . . . . . . .  925 927 950 952 1550 1574 2158 2160 2183 2185 2592 2594 2617 2619
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    56
0 Defined   Cross-reference of data names   References

0     101   TABLE-LEVEL-2B . . . . . . . .  1020 1031 1043 1054 1260 1285
      112   TABLE-LEVEL-2B . . . . . . . .  1112 1123 1135 1146 1358 1382
      124   TABLE-LEVEL-2B . . . . . . . .  1452 1476
      135   TABLE-LEVEL-2B . . . . . . . .  1548 1572
      149   TABLE-LEVEL-2B . . . . . . . .  1641 1652 1663 1674
      160   TABLE-LEVEL-2B . . . . . . . .  1729 1740 1751 1762
      172   TABLE-LEVEL-2B
      183   TABLE-LEVEL-2B
       48   TABLE-LEVEL-3A . . . . . . . .  576 588 601 613 626 637 651 663 1209 1234 1259 1284 1825 1827 1850 1852 1875
                                            1898 2259 2261 2284 2286 2309 2332
       71   TABLE-LEVEL-3A . . . . . . . .  776 778 801 803 826 828 851 853 1405 1407 1431 1455 1479 2017 2040 2063 2065
                                            2088 2090 2451 2474 2497 2499 2522 2524
       95   TABLE-LEVEL-3A . . . . . . . .  976 987 999 1009 1021 1032 1044 1055 1211 1236 1261 1286
      118   TABLE-LEVEL-3A . . . . . . . .  1429 1453 1477
      143   TABLE-LEVEL-3A . . . . . . . .  1598 1609 1620 1631 1642 1653 1664 1675
      166   TABLE-LEVEL-3A
       59   TABLE-LEVEL-3B . . . . . . . .  676 688 701 713 726 737 751 762 1309 1333 1357 1381 1921 1923 1946 1948 1971
                                            1994 2355 2357 2380 2382 2405 2428
       82   TABLE-LEVEL-3B . . . . . . . .  876 878 901 903 926 928 951 953 1503 1527 1551 1575 2113 2136 2159 2161 2184
                                            2186 2547 2570 2593 2595 2618 2620
      106   TABLE-LEVEL-3B . . . . . . . .  1067 1078 1090 1101 1113 1124 1136 1147 1311 1335 1359 1383
      129   TABLE-LEVEL-3B . . . . . . . .  1501 1525 1549 1573
      154   TABLE-LEVEL-3B . . . . . . . .  1686 1697 1708 1719 1730 1741 1752 1763
      177   TABLE-LEVEL-3B
       47   TABLE-LEVEL-4A . . . . . . . .  576 588 601 613 626 637 651 663 676 688 701 713 726 737 751 762 1209 1234 1259
                                            1284 1309 1333 1357 1381 1825 1827 1850 1852 1875 1898 1921 1923 1946 1948 1971
                                            1994 2259 2261 2284 2286 2309 2332 2355 2357 2380 2382 2405 2428
       94   TABLE-LEVEL-4A . . . . . . . .  976 987 999 1009 1021 1032 1044 1055 1067 1078 1090 1101 1113 1124 1136 1147
                                            1211 1236 1261 1286 1311 1335 1359 1383
      142   TABLE-LEVEL-4A . . . . . . . .  1598 1609 1620 1631 1642 1653 1664 1675 1686 1697 1708 1719 1730 1741 1752 1763
       70   TABLE-LEVEL-4B . . . . . . . .  776 778 801 803 826 828 851 853 876 878 901 903 926 928 951 953 1405 1407 1431
                                            1455 1479 1503 1527 1551 1575 2017 2040 2063 2065 2088 2090 2113 2136 2159 2161
                                            2184 2186 2451 2474 2497 2499 2522 2524 2547 2570 2593 2595 2618 2620
      117   TABLE-LEVEL-4B . . . . . . . .  1429 1453 1477 1501 1525 1549 1573
      165   TABLE-LEVEL-4B
       46   TABLE-LEVEL-5A . . . . . . . .  576 588 601 613 626 637 651 663 676 688 701 713 726 737 751 762 776 778 801 803
                                            826 828 851 853 876 878 901 903 926 928 951 953 973 1209 1234 1259 1284 1309
                                            1333 1357 1381 1405 1407 1431 1455 1479 1503 1527 1551 1575 1595 1825 1827 1850
                                            1852 1875 1898 1921 1923 1946 1948 1971 1994 2017 2040 2063 2065 2088 2090 2113
                                            2136 2159 2161 2184 2186 2259 2261 2284 2286 2309 2332 2355 2357 2380 2382 2405
                                            2428 2451 2474 2497 2499 2522 2524 2547 2570 2593 2595 2618 2620
       93   TABLE-LEVEL-5B . . . . . . . .  M973 976 987 999 1009 1021 1032 1044 1055 1067 1078 1090 1101 1113 1124 1136
                                            1147 M1205 1211 1236 1261 1286 1311 1335 1359 1383 1429 1453 1477 1501 1525 1549
                                            1573
      141   TABLE-LEVEL-5C . . . . . . . .  M1595 1598 1609 1620 1631 1642 1653 1664 1675 1686 1697 1708 1719 1730 1741 1752
                                            1763
      188   TABLE-5B-INIT. . . . . . . . .  1205
       51   TBL-ITEM-1 . . . . . . . . . .  575 587 973 1208 1595 1824 M1826 2258 2260
       53   TBL-ITEM-1 . . . . . . . . . .  600 612 973 1233 1595 1849 M1851 2283 2285
       56   TBL-ITEM-1 . . . . . . . . . .  625 636 973 1258 1595 1874 2308
       58   TBL-ITEM-1 . . . . . . . . . .  650 662 973 1283 1595 1897 2331
       62   TBL-ITEM-1 . . . . . . . . . .  675 687 973 1308 1595 1920 M1922 2354 2356
       64   TBL-ITEM-1 . . . . . . . . . .  700 712 973 1332 1595 1945 M1947 2379 2381
       67   TBL-ITEM-1 . . . . . . . . . .  725 736 973 1356 1595 1970 2404
       69   TBL-ITEM-1 . . . . . . . . . .  750 761 973 1380 1595 1993 2427
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    57
0 Defined   Cross-reference of data names   References

0      74   TBL-ITEM-1 . . . . . . . . . .  775 777 973 1404 M1406 1595 2016 2450
       76   TBL-ITEM-1 . . . . . . . . . .  800 802 973 M1430 1595 2039 2473
       79   TBL-ITEM-1 . . . . . . . . . .  825 827 973 M1454 1595 2062 M2064 2496 2498
       81   TBL-ITEM-1 . . . . . . . . . .  850 852 973 M1478 1595 2087 M2089 2521 2523
       85   TBL-ITEM-1 . . . . . . . . . .  875 877 973 M1502 1595 2112 2546
       87   TBL-ITEM-1 . . . . . . . . . .  900 902 973 M1526 1595 2135 2569
       90   TBL-ITEM-1 . . . . . . . . . .  925 927 973 M1550 1595 2158 M2160 2592 2594
       92   TBL-ITEM-1 . . . . . . . . . .  950 952 973 M1574 1595 2183 M2185 2617 2619
       98   TBL-ITEM-1 . . . . . . . . . .  M973 975 986 M1210
      100   TBL-ITEM-1 . . . . . . . . . .  M973 998 1008 M1235
      103   TBL-ITEM-1 . . . . . . . . . .  M973 1020 1031 M1260
      105   TBL-ITEM-1 . . . . . . . . . .  M973 1043 1054 M1285
      109   TBL-ITEM-1 . . . . . . . . . .  M973 1066 1077 M1310
      111   TBL-ITEM-1 . . . . . . . . . .  M973 1089 1100 M1334
      114   TBL-ITEM-1 . . . . . . . . . .  M973 1112 1123 M1358
      116   TBL-ITEM-1 . . . . . . . . . .  M973 1135 1146 M1382
      121   TBL-ITEM-1 . . . . . . . . . .  M973
      123   TBL-ITEM-1 . . . . . . . . . .  M973 1428
      126   TBL-ITEM-1 . . . . . . . . . .  M973 1452
      128   TBL-ITEM-1 . . . . . . . . . .  M973 1476
      132   TBL-ITEM-1 . . . . . . . . . .  M973 1500
      134   TBL-ITEM-1 . . . . . . . . . .  M973 1524
      137   TBL-ITEM-1 . . . . . . . . . .  M973 1548
      139   TBL-ITEM-1 . . . . . . . . . .  M973 1572
      146   TBL-ITEM-1 . . . . . . . . . .  M1595 1597 1608
      148   TBL-ITEM-1 . . . . . . . . . .  M1595 1619 1630
      151   TBL-ITEM-1 . . . . . . . . . .  M1595 1641 1652
      153   TBL-ITEM-1 . . . . . . . . . .  M1595 1663 1674
      157   TBL-ITEM-1 . . . . . . . . . .  M1595 1685 1696
      159   TBL-ITEM-1 . . . . . . . . . .  M1595 1707 1718
      162   TBL-ITEM-1 . . . . . . . . . .  M1595 1729 1740
      164   TBL-ITEM-1 . . . . . . . . . .  M1595 1751 1762
      169   TBL-ITEM-1 . . . . . . . . . .  M1595
      171   TBL-ITEM-1 . . . . . . . . . .  M1595
      174   TBL-ITEM-1 . . . . . . . . . .  M1595
      176   TBL-ITEM-1 . . . . . . . . . .  M1595
      180   TBL-ITEM-1 . . . . . . . . . .  M1595
      182   TBL-ITEM-1 . . . . . . . . . .  M1595
      185   TBL-ITEM-1 . . . . . . . . . .  M1595
      187   TBL-ITEM-1 . . . . . . . . . .  M1595
      324   TEST-COMPUTED. . . . . . . . .  552
      339   TEST-CORRECT . . . . . . . . .  554
      392   TEST-ID. . . . . . . . . . . .  M457
      312   TEST-RESULTS . . . . . . . . .  M458 476
      370   TOTAL-ERROR
      441   XXCOMPUTED . . . . . . . . . .  M561
      443   XXCORRECT. . . . . . . . . . .  M561
      436   XXINFO . . . . . . . . . . . .  548 563
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    58
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

      582   ADD-DELETE-F1-1
      607   ADD-DELETE-F1-2
     1178   ADD-DELETE-F1-25
      632   ADD-DELETE-F1-3
      657   ADD-DELETE-F1-4
      682   ADD-DELETE-F1-5
      707   ADD-DELETE-F1-6
      732   ADD-DELETE-F1-7
      757   ADD-DELETE-F1-8
      809   ADD-DELETE-F2-10
      834   ADD-DELETE-F2-11
      859   ADD-DELETE-F2-12
      884   ADD-DELETE-F2-13
      909   ADD-DELETE-F2-14
      934   ADD-DELETE-F2-15
      959   ADD-DELETE-F2-16
      784   ADD-DELETE-F2-9
      981   ADD-DELETE-F3-17
     1003   ADD-DELETE-F3-18
     1026   ADD-DELETE-F3-19
     1049   ADD-DELETE-F3-20
     1072   ADD-DELETE-F3-21
     1095   ADD-DELETE-F3-22
     1118   ADD-DELETE-F3-23
     1141   ADD-DELETE-F3-24
      585   ADD-FAIL-F1-1. . . . . . . . .  G581
      610   ADD-FAIL-F1-2. . . . . . . . .  G606
     1181   ADD-FAIL-F1-25 . . . . . . . .  G1177
      635   ADD-FAIL-F1-3. . . . . . . . .  G631
      660   ADD-FAIL-F1-4. . . . . . . . .  G656
      685   ADD-FAIL-F1-5. . . . . . . . .  G681
      710   ADD-FAIL-F1-6. . . . . . . . .  G706
      735   ADD-FAIL-F1-7. . . . . . . . .  G731
      760   ADD-FAIL-F1-8. . . . . . . . .  G756
      812   ADD-FAIL-F2-10 . . . . . . . .  G808
      837   ADD-FAIL-F2-11 . . . . . . . .  G833
      862   ADD-FAIL-F2-12 . . . . . . . .  G858
      887   ADD-FAIL-F2-13 . . . . . . . .  G883
      912   ADD-FAIL-F2-14 . . . . . . . .  G908
      937   ADD-FAIL-F2-15 . . . . . . . .  G933
      962   ADD-FAIL-F2-16 . . . . . . . .  G958
      787   ADD-FAIL-F2-9. . . . . . . . .  G783
      984   ADD-FAIL-F3-17 . . . . . . . .  G980
     1006   ADD-FAIL-F3-18
     1029   ADD-FAIL-F3-19 . . . . . . . .  G1025
     1052   ADD-FAIL-F3-20 . . . . . . . .  G1048
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    59
0 Defined   Cross-reference of procedures   References

0    1075   ADD-FAIL-F3-21 . . . . . . . .  G1071
     1098   ADD-FAIL-F3-22 . . . . . . . .  G1094
     1121   ADD-FAIL-F3-23 . . . . . . . .  G1117
     1144   ADD-FAIL-F3-24 . . . . . . . .  G1140
      569   ADD-INIT-F1-1
      594   ADD-INIT-F1-2
     1154   ADD-INIT-F1-25
      619   ADD-INIT-F1-3
      644   ADD-INIT-F1-4
      669   ADD-INIT-F1-5
      694   ADD-INIT-F1-6
      719   ADD-INIT-F1-7
      744   ADD-INIT-F1-8
      794   ADD-INIT-F2-10
      819   ADD-INIT-F2-11
      844   ADD-INIT-F2-12
      869   ADD-INIT-F2-13
      894   ADD-INIT-F2-14
      919   ADD-INIT-F2-15
      944   ADD-INIT-F2-16
      769   ADD-INIT-F2-9
      969   ADD-INIT-F3-17
      993   ADD-INIT-F3-18
     1015   ADD-INIT-F3-19
     1038   ADD-INIT-F3-20
     1061   ADD-INIT-F3-21
     1084   ADD-INIT-F3-22
     1107   ADD-INIT-F3-23
     1130   ADD-INIT-F3-24
      574   ADD-TEST-F1-1
      599   ADD-TEST-F1-2
     1159   ADD-TEST-F1-25
      624   ADD-TEST-F1-3
      649   ADD-TEST-F1-4
      674   ADD-TEST-F1-5
      699   ADD-TEST-F1-6
      724   ADD-TEST-F1-7
      749   ADD-TEST-F1-8
      799   ADD-TEST-F2-10
      824   ADD-TEST-F2-11
      849   ADD-TEST-F2-12
      874   ADD-TEST-F2-13
      899   ADD-TEST-F2-14
      924   ADD-TEST-F2-15
      949   ADD-TEST-F2-16
      774   ADD-TEST-F2-9
      974   ADD-TEST-F3-17
      997   ADD-TEST-F3-18
     1019   ADD-TEST-F3-19
     1042   ADD-TEST-F3-20
     1065   ADD-TEST-F3-21
     1088   ADD-TEST-F3-22
     1111   ADD-TEST-F3-23
     1134   ADD-TEST-F3-24
      591   ADD-WRITE-F1-1 . . . . . . . .  G580 G584
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    60
0 Defined   Cross-reference of procedures   References

0     616   ADD-WRITE-F1-2 . . . . . . . .  G605 G609
     1198   ADD-WRITE-F1-25. . . . . . . .  G1176 G1180
      641   ADD-WRITE-F1-3 . . . . . . . .  G630 G634
      666   ADD-WRITE-F1-4 . . . . . . . .  G655 G659
      691   ADD-WRITE-F1-5 . . . . . . . .  G680 G684
      716   ADD-WRITE-F1-6 . . . . . . . .  G705 G709
      741   ADD-WRITE-F1-7 . . . . . . . .  G730 G734
      766   ADD-WRITE-F1-8 . . . . . . . .  G755 G759
      816   ADD-WRITE-F2-10. . . . . . . .  G807 G811
      841   ADD-WRITE-F2-11. . . . . . . .  G832 G836
      866   ADD-WRITE-F2-12. . . . . . . .  G857 G861
      891   ADD-WRITE-F2-13. . . . . . . .  G882 G886
      916   ADD-WRITE-F2-14. . . . . . . .  G907 G911
      941   ADD-WRITE-F2-15. . . . . . . .  G932 G936
      966   ADD-WRITE-F2-16. . . . . . . .  G957 G961
      791   ADD-WRITE-F2-9 . . . . . . . .  G782 G786
      990   ADD-WRITE-F3-17. . . . . . . .  G979 G983
     1012   ADD-WRITE-F3-18. . . . . . . .  G1002 G1005
     1035   ADD-WRITE-F3-19. . . . . . . .  G1024 G1028
     1058   ADD-WRITE-F3-20. . . . . . . .  G1047 G1051
     1081   ADD-WRITE-F3-21. . . . . . . .  G1070 G1074
     1104   ADD-WRITE-F3-22. . . . . . . .  G1093 G1097
     1127   ADD-WRITE-F3-23. . . . . . . .  G1116 G1120
     1150   ADD-WRITE-F3-24. . . . . . . .  G1139 G1143
      557   BAIL-OUT . . . . . . . . . . .  P479
      565   BAIL-OUT-EX. . . . . . . . . .  E479 G559
      560   BAIL-OUT-WRITE . . . . . . . .  G558
      541   BLANK-LINE-PRINT
     2717   CCVS-EXIT
     2718   CCVS-999999
      454   CCVS1
      566   CCVS1-EXIT . . . . . . . . . .  G460
      461   CLOSE-FILES. . . . . . . . . .  G2719
     2695   CND-DELETE-GF-1
     2698   CND-FAIL-GF-1. . . . . . . . .  G2694
     2685   CND-INIT-GF-1
     2690   CND-TEST-GF-1
     2715   CND-WRITE-GF-1 . . . . . . . .  G2693 G2697
      489   COLUMN-NAMES-ROUTINE . . . . .  E459
      470   DE-LETE. . . . . . . . . . . .  P583 P608 P633 P658 P683 P708 P733 P758 P785 P810 P835 P860 P885 P910 P935 P960
                                            P982 P1004 P1027 P1050 P1073 P1096 P1119 P1142 P1179 P1218 P1243 P1268 P1293
                                            P1318 P1342 P1366 P1390 P1414 P1438 P1462 P1486 P1510 P1534 P1558 P1582 P1604
                                            P1626 P1648 P1670 P1692 P1714 P1736 P1758 P1795 P1834 P1859 P1882 P1905 P1930
                                            P1955 P1978 P2001 P2024 P2047 P2072 P2097 P2120 P2143 P2168 P2193 P2228 P2268
                                            P2293 P2316 P2339 P2364 P2389 P2412 P2435 P2458 P2481 P2506 P2531 P2554 P2577
                                            P2602 P2627 P2662 P2696
     2267   DIV-DELETE-F3-1
     2480   DIV-DELETE-F3-10
     2505   DIV-DELETE-F3-11
     2530   DIV-DELETE-F3-12
     2553   DIV-DELETE-F3-13
     2576   DIV-DELETE-F3-14
     2601   DIV-DELETE-F3-15
     2626   DIV-DELETE-F3-16
     2661   DIV-DELETE-F3-17
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    61
0 Defined   Cross-reference of procedures   References

0    2292   DIV-DELETE-F3-2
     2315   DIV-DELETE-F3-3
     2338   DIV-DELETE-F3-4
     2363   DIV-DELETE-F3-5
     2388   DIV-DELETE-F3-6
     2411   DIV-DELETE-F3-7
     2434   DIV-DELETE-F3-8
     2457   DIV-DELETE-F3-9
     2270   DIV-FAIL-F3-1. . . . . . . . .  G2266
     2483   DIV-FAIL-F3-10 . . . . . . . .  G2479
     2508   DIV-FAIL-F3-11 . . . . . . . .  G2504
     2533   DIV-FAIL-F3-12 . . . . . . . .  G2529
     2556   DIV-FAIL-F3-13 . . . . . . . .  G2552
     2579   DIV-FAIL-F3-14 . . . . . . . .  G2575
     2604   DIV-FAIL-F3-15 . . . . . . . .  G2600
     2629   DIV-FAIL-F3-16 . . . . . . . .  G2625
     2664   DIV-FAIL-F3-17 . . . . . . . .  G2660
     2295   DIV-FAIL-F3-2. . . . . . . . .  G2291
     2318   DIV-FAIL-F3-3. . . . . . . . .  G2314
     2341   DIV-FAIL-F3-4. . . . . . . . .  G2337
     2366   DIV-FAIL-F3-5. . . . . . . . .  G2362
     2391   DIV-FAIL-F3-6. . . . . . . . .  G2387
     2414   DIV-FAIL-F3-7. . . . . . . . .  G2410
     2437   DIV-FAIL-F3-8. . . . . . . . .  G2433
     2460   DIV-FAIL-F3-9. . . . . . . . .  G2456
     2252   DIV-INIT-F3-1
     2467   DIV-INIT-F3-10
     2490   DIV-INIT-F3-11
     2515   DIV-INIT-F3-12
     2540   DIV-INIT-F3-13
     2563   DIV-INIT-F3-14
     2586   DIV-INIT-F3-15
     2611   DIV-INIT-F3-16
     2636   DIV-INIT-F3-17
     2277   DIV-INIT-F3-2
     2302   DIV-INIT-F3-3
     2325   DIV-INIT-F3-4
     2348   DIV-INIT-F3-5
     2373   DIV-INIT-F3-6
     2398   DIV-INIT-F3-7
     2421   DIV-INIT-F3-8
     2444   DIV-INIT-F3-9
     2257   DIV-TEST-F3-1
     2472   DIV-TEST-F3-10
     2495   DIV-TEST-F3-11
     2520   DIV-TEST-F3-12
     2545   DIV-TEST-F3-13
     2568   DIV-TEST-F3-14
     2591   DIV-TEST-F3-15
     2616   DIV-TEST-F3-16
     2641   DIV-TEST-F3-17
     2282   DIV-TEST-F3-2
     2307   DIV-TEST-F3-3
     2330   DIV-TEST-F3-4
     2353   DIV-TEST-F3-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    62
0 Defined   Cross-reference of procedures   References

0    2378   DIV-TEST-F3-6
     2403   DIV-TEST-F3-7
     2426   DIV-TEST-F3-8
     2449   DIV-TEST-F3-9
     2274   DIV-WRITE-F3-1 . . . . . . . .  G2265 G2269
     2487   DIV-WRITE-F3-10. . . . . . . .  G2478 G2482
     2512   DIV-WRITE-F3-11. . . . . . . .  G2503 G2507
     2537   DIV-WRITE-F3-12. . . . . . . .  G2528 G2532
     2560   DIV-WRITE-F3-13. . . . . . . .  G2551 G2555
     2583   DIV-WRITE-F3-14. . . . . . . .  G2574 G2578
     2608   DIV-WRITE-F3-15. . . . . . . .  G2599 G2603
     2633   DIV-WRITE-F3-16. . . . . . . .  G2624 G2628
     2681   DIV-WRITE-F3-17. . . . . . . .  G2659 G2663
     2299   DIV-WRITE-F3-2 . . . . . . . .  G2290 G2294
     2322   DIV-WRITE-F3-3 . . . . . . . .  G2313 G2317
     2345   DIV-WRITE-F3-4 . . . . . . . .  G2336 G2340
     2370   DIV-WRITE-F3-5 . . . . . . . .  G2361 G2365
     2395   DIV-WRITE-F3-6 . . . . . . . .  G2386 G2390
     2418   DIV-WRITE-F3-7 . . . . . . . .  G2409 G2413
     2441   DIV-WRITE-F3-8 . . . . . . . .  G2432 G2436
     2464   DIV-WRITE-F3-9 . . . . . . . .  G2455 G2459
      493   END-ROUTINE. . . . . . . . . .  P462 P1152 P1816 P2250 P2683
      497   END-ROUTINE-1
      506   END-ROUTINE-12
      514   END-ROUTINE-13 . . . . . . . .  E462
      495   END-RTN-EXIT
      469   FAIL . . . . . . . . . . . . .  P590 P615 P640 P665 P690 P715 P740 P765 P790 P815 P840 P865 P890 P915 P940 P965
                                            P989 P1011 P1034 P1057 P1080 P1103 P1126 P1149 P1197 P1223 P1248 P1273 P1298
                                            P1323 P1347 P1371 P1395 P1419 P1443 P1467 P1491 P1515 P1539 P1563 P1587 P1611
                                            P1633 P1655 P1677 P1699 P1721 P1743 P1765 P1813 P1839 P1863 P1887 P1910 P1935
                                            P1960 P1983 P2006 P2029 P2052 P2077 P2102 P2125 P2148 P2173 P2198 P2247 P2273
                                            P2298 P2321 P2344 P2369 P2394 P2417 P2440 P2463 P2486 P2511 P2536 P2559 P2582
                                            P2607 P2632 P2680 P2714
      543   FAIL-ROUTINE . . . . . . . . .  P478
      556   FAIL-ROUTINE-EX. . . . . . . .  E478 G550
      551   FAIL-ROUTINE-WRITE . . . . . .  G544 G545
      484   HEAD-ROUTINE . . . . . . . . .  P459
      467   INSPT
     1833   MPY-DELETE-F2-1
     2046   MPY-DELETE-F2-10
     2071   MPY-DELETE-F2-11
     2096   MPY-DELETE-F2-12
     2119   MPY-DELETE-F2-13
     2142   MPY-DELETE-F2-14
     2167   MPY-DELETE-F2-15
     2192   MPY-DELETE-F2-16
     2227   MPY-DELETE-F2-17
     1858   MPY-DELETE-F2-2
     1881   MPY-DELETE-F2-3
     1904   MPY-DELETE-F2-4
     1929   MPY-DELETE-F2-5
     1954   MPY-DELETE-F2-6
     1977   MPY-DELETE-F2-7
     2000   MPY-DELETE-F2-8
     2023   MPY-DELETE-F2-9
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    63
0 Defined   Cross-reference of procedures   References

0    1836   MPY-FAIL-F2-1. . . . . . . . .  G1832
     2049   MPY-FAIL-F2-10 . . . . . . . .  G2045
     2074   MPY-FAIL-F2-11 . . . . . . . .  G2070
     2099   MPY-FAIL-F2-12 . . . . . . . .  G2095
     2122   MPY-FAIL-F2-13 . . . . . . . .  G2118
     2145   MPY-FAIL-F2-14 . . . . . . . .  G2141
     2170   MPY-FAIL-F2-15 . . . . . . . .  G2166
     2195   MPY-FAIL-F2-16 . . . . . . . .  G2191
     2230   MPY-FAIL-F2-17 . . . . . . . .  G2226
     1861   MPY-FAIL-F2-2. . . . . . . . .  G1857
     1884   MPY-FAIL-F2-3. . . . . . . . .  G1880
     1907   MPY-FAIL-F2-4. . . . . . . . .  G1903
     1932   MPY-FAIL-F2-5. . . . . . . . .  G1928
     1957   MPY-FAIL-F2-6. . . . . . . . .  G1953
     1980   MPY-FAIL-F2-7. . . . . . . . .  G1976
     2003   MPY-FAIL-F2-8. . . . . . . . .  G1999
     2026   MPY-FAIL-F2-9. . . . . . . . .  G2022
     1818   MPY-INIT-F2-1
     2033   MPY-INIT-F2-10
     2056   MPY-INIT-F2-11
     2081   MPY-INIT-F2-12
     2106   MPY-INIT-F2-13
     2129   MPY-INIT-F2-14
     2152   MPY-INIT-F2-15
     2177   MPY-INIT-F2-16
     2202   MPY-INIT-F2-17
     1843   MPY-INIT-F2-2
     1868   MPY-INIT-F2-3
     1891   MPY-INIT-F2-4
     1914   MPY-INIT-F2-5
     1939   MPY-INIT-F2-6
     1964   MPY-INIT-F2-7
     1987   MPY-INIT-F2-8
     2010   MPY-INIT-F2-9
     1822   MPY-TEST-F2-1
     2038   MPY-TEST-F2-10
     2061   MPY-TEST-F2-11
     2086   MPY-TEST-F2-12
     2111   MPY-TEST-F2-13
     2134   MPY-TEST-F2-14
     2157   MPY-TEST-F2-15
     2182   MPY-TEST-F2-16
     2207   MPY-TEST-F2-17
     1848   MPY-TEST-F2-2
     1873   MPY-TEST-F2-3
     1896   MPY-TEST-F2-4
     1919   MPY-TEST-F2-5
     1944   MPY-TEST-F2-6
     1969   MPY-TEST-F2-7
     1992   MPY-TEST-F2-8
     2015   MPY-TEST-F2-9
     1840   MPY-WRITE-F2-1 . . . . . . . .  G1831 G1835
     2053   MPY-WRITE-F2-10. . . . . . . .  G2044 G2048
     2078   MPY-WRITE-F2-11. . . . . . . .  G2069 G2073
     2103   MPY-WRITE-F2-12. . . . . . . .  G2094 G2098
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    64
0 Defined   Cross-reference of procedures   References

0    2126   MPY-WRITE-F2-13. . . . . . . .  G2117 G2121
     2149   MPY-WRITE-F2-14. . . . . . . .  G2140 G2144
     2174   MPY-WRITE-F2-15. . . . . . . .  G2165 G2169
     2199   MPY-WRITE-F2-16. . . . . . . .  G2190 G2194
     2248   MPY-WRITE-F2-17. . . . . . . .  G2225 G2229
     1865   MPY-WRITE-F2-2 . . . . . . . .  G1856 G1860
     1888   MPY-WRITE-F2-3 . . . . . . . .  G1879 G1883
     1911   MPY-WRITE-F2-4 . . . . . . . .  G1902 G1906
     1936   MPY-WRITE-F2-5 . . . . . . . .  G1927 G1931
     1961   MPY-WRITE-F2-6 . . . . . . . .  G1952 G1956
     1984   MPY-WRITE-F2-7 . . . . . . . .  G1975 G1979
     2007   MPY-WRITE-F2-8 . . . . . . . .  G1998 G2002
     2030   MPY-WRITE-F2-9 . . . . . . . .  G2021 G2025
      455   OPEN-FILES
      468   PASS . . . . . . . . . . . . .  P579 P604 P629 P654 P679 P704 P729 P754 P781 P806 P831 P856 P881 P906 P931 P956
                                            P978 P1001 P1023 P1046 P1069 P1092 P1115 P1138 P1175 P1214 P1239 P1264 P1289
                                            P1314 P1338 P1362 P1386 P1410 P1434 P1458 P1482 P1506 P1530 P1554 P1578 P1600
                                            P1622 P1644 P1666 P1688 P1710 P1732 P1754 P1791 P1830 P1855 P1878 P1901 P1926
                                            P1951 P1974 P1997 P2020 P2043 P2068 P2093 P2116 P2139 P2164 P2189 P2224 P2264
                                            P2289 P2312 P2335 P2360 P2385 P2408 P2431 P2454 P2477 P2502 P2527 P2550 P2573
                                            P2598 P2623 P2658 P2692
      472   PRINT-DETAIL . . . . . . . . .  P592 P617 P642 P667 P692 P717 P742 P767 P792 P817 P842 P867 P892 P917 P942 P967
                                            P991 P1013 P1036 P1059 P1082 P1105 P1128 P1151 P1199 P1225 P1250 P1275 P1300
                                            P1325 P1349 P1373 P1397 P1421 P1445 P1469 P1493 P1517 P1541 P1565 P1589 P1613
                                            P1635 P1657 P1679 P1701 P1723 P1745 P1767 P1815 P1841 P1866 P1889 P1912 P1937
                                            P1962 P1985 P2008 P2031 P2054 P2079 P2104 P2127 P2150 P2175 P2200 P2249 P2275
                                            P2300 P2323 P2346 P2371 P2396 P2419 P2442 P2465 P2488 P2513 P2538 P2561 P2584
                                            P2609 P2634 P2682 P2716
      568   SECT-NC207A-001
     1217   SUB-DELETE-F2-1
     1437   SUB-DELETE-F2-10
     1461   SUB-DELETE-F2-11
     1485   SUB-DELETE-F2-12
     1509   SUB-DELETE-F2-13
     1533   SUB-DELETE-F2-14
     1557   SUB-DELETE-F2-15
     1581   SUB-DELETE-F2-16
     1242   SUB-DELETE-F2-2
     1794   SUB-DELETE-F2-25
     1267   SUB-DELETE-F2-3
     1292   SUB-DELETE-F2-4
     1317   SUB-DELETE-F2-5
     1341   SUB-DELETE-F2-6
     1365   SUB-DELETE-F2-7
     1389   SUB-DELETE-F2-8
     1413   SUB-DELETE-F2-9
     1603   SUB-DELETE-F3-17
     1625   SUB-DELETE-F3-18
     1647   SUB-DELETE-F3-19
     1669   SUB-DELETE-F3-20
     1691   SUB-DELETE-F3-21
     1713   SUB-DELETE-F3-22
     1735   SUB-DELETE-F3-23
     1757   SUB-DELETE-F3-24
     1220   SUB-FAIL-F2-1. . . . . . . . .  G1216
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    65
0 Defined   Cross-reference of procedures   References

0    1440   SUB-FAIL-F2-10 . . . . . . . .  G1436
     1464   SUB-FAIL-F2-11 . . . . . . . .  G1460
     1488   SUB-FAIL-F2-12 . . . . . . . .  G1484
     1512   SUB-FAIL-F2-13 . . . . . . . .  G1508
     1536   SUB-FAIL-F2-14 . . . . . . . .  G1532
     1560   SUB-FAIL-F2-15 . . . . . . . .  G1556
     1584   SUB-FAIL-F2-16 . . . . . . . .  G1580
     1245   SUB-FAIL-F2-2. . . . . . . . .  G1241
     1797   SUB-FAIL-F2-25 . . . . . . . .  G1793
     1270   SUB-FAIL-F2-3. . . . . . . . .  G1266
     1295   SUB-FAIL-F2-4. . . . . . . . .  G1291
     1320   SUB-FAIL-F2-5. . . . . . . . .  G1316
     1344   SUB-FAIL-F2-6. . . . . . . . .  G1340
     1368   SUB-FAIL-F2-7. . . . . . . . .  G1364
     1392   SUB-FAIL-F2-8. . . . . . . . .  G1388
     1416   SUB-FAIL-F2-9. . . . . . . . .  G1412
     1606   SUB-FAIL-F3-17 . . . . . . . .  G1602
     1628   SUB-FAIL-F3-18 . . . . . . . .  G1624
     1650   SUB-FAIL-F3-19 . . . . . . . .  G1646
     1672   SUB-FAIL-F3-20 . . . . . . . .  G1668
     1694   SUB-FAIL-F3-21 . . . . . . . .  G1690
     1716   SUB-FAIL-F3-22 . . . . . . . .  G1712
     1738   SUB-FAIL-F3-23 . . . . . . . .  G1734
     1760   SUB-FAIL-F3-24 . . . . . . . .  G1756
     1201   SUB-INIT-F2-1
     1423   SUB-INIT-F2-10
     1447   SUB-INIT-F2-11
     1471   SUB-INIT-F2-12
     1495   SUB-INIT-F2-13
     1519   SUB-INIT-F2-14
     1543   SUB-INIT-F2-15
     1567   SUB-INIT-F2-16
     1227   SUB-INIT-F2-2
     1769   SUB-INIT-F2-25
     1252   SUB-INIT-F2-3
     1277   SUB-INIT-F2-4
     1302   SUB-INIT-F2-5
     1327   SUB-INIT-F2-6
     1351   SUB-INIT-F2-7
     1375   SUB-INIT-F2-8
     1399   SUB-INIT-F2-9
     1591   SUB-INIT-F3-17
     1615   SUB-INIT-F3-18
     1637   SUB-INIT-F3-19
     1659   SUB-INIT-F3-20
     1681   SUB-INIT-F3-21
     1703   SUB-INIT-F3-22
     1725   SUB-INIT-F3-23
     1747   SUB-INIT-F3-24
     1207   SUB-TEST-F2-1
     1427   SUB-TEST-F2-10
     1451   SUB-TEST-F2-11
     1475   SUB-TEST-F2-12
     1499   SUB-TEST-F2-13
     1523   SUB-TEST-F2-14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    66
0 Defined   Cross-reference of procedures   References

0    1547   SUB-TEST-F2-15
     1571   SUB-TEST-F2-16
     1232   SUB-TEST-F2-2
     1774   SUB-TEST-F2-25
     1257   SUB-TEST-F2-3
     1282   SUB-TEST-F2-4
     1307   SUB-TEST-F2-5
     1331   SUB-TEST-F2-6
     1355   SUB-TEST-F2-7
     1379   SUB-TEST-F2-8
     1403   SUB-TEST-F2-9
     1596   SUB-TEST-F3-17
     1618   SUB-TEST-F3-18
     1640   SUB-TEST-F3-19
     1662   SUB-TEST-F3-20
     1684   SUB-TEST-F3-21
     1706   SUB-TEST-F3-22
     1728   SUB-TEST-F3-23
     1750   SUB-TEST-F3-24
     1224   SUB-WRITE-F2-1 . . . . . . . .  G1215 G1219
     1444   SUB-WRITE-F2-10. . . . . . . .  G1435 G1439
     1468   SUB-WRITE-F2-11. . . . . . . .  G1459 G1463
     1492   SUB-WRITE-F2-12. . . . . . . .  G1483 G1487
     1516   SUB-WRITE-F2-13. . . . . . . .  G1507 G1511
     1540   SUB-WRITE-F2-14. . . . . . . .  G1531 G1535
     1564   SUB-WRITE-F2-15. . . . . . . .  G1555 G1559
     1588   SUB-WRITE-F2-16. . . . . . . .  G1579 G1583
     1249   SUB-WRITE-F2-2 . . . . . . . .  G1240 G1244
     1814   SUB-WRITE-F2-25. . . . . . . .  G1792 G1796
     1274   SUB-WRITE-F2-3 . . . . . . . .  G1265 G1269
     1299   SUB-WRITE-F2-4 . . . . . . . .  G1290 G1294
     1324   SUB-WRITE-F2-5 . . . . . . . .  G1315 G1319
     1348   SUB-WRITE-F2-6 . . . . . . . .  G1339 G1343
     1372   SUB-WRITE-F2-7 . . . . . . . .  G1363 G1367
     1396   SUB-WRITE-F2-8 . . . . . . . .  G1387 G1391
     1420   SUB-WRITE-F2-9 . . . . . . . .  G1411 G1415
     1612   SUB-WRITE-F3-17. . . . . . . .  G1601 G1605
     1634   SUB-WRITE-F3-18. . . . . . . .  G1623 G1627
     1656   SUB-WRITE-F3-19. . . . . . . .  G1645 G1649
     1678   SUB-WRITE-F3-20. . . . . . . .  G1667 G1671
     1700   SUB-WRITE-F3-21. . . . . . . .  G1689 G1693
     1722   SUB-WRITE-F3-22. . . . . . . .  G1711 G1715
     1744   SUB-WRITE-F3-23. . . . . . . .  G1733 G1737
     1766   SUB-WRITE-F3-24. . . . . . . .  G1755 G1759
      465   TERMINATE-CALL
      463   TERMINATE-CCVS
      526   WRITE-LINE . . . . . . . . . .  P476 P477 P485 P486 P487 P488 P490 P491 P492 P494 P496 P505 P513 P519 P524 P525
                                            P548 P552 P554 P563
      538   WRT-LN . . . . . . . . . . . .  P532 P533 P534 P537 P542
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    67
0 Defined   Cross-reference of programs     References

        3   NC207A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC207A    Date 06/04/2022  Time 12:00:55   Page    68
0LineID  Message code  Message text

     40  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC207A:
 *    Source records = 2719
 *    Data Division statements = 314
 *    Procedure Division statements = 1354
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1379
0End of compilation 1,  program NC207A,  highest severity 0.
0Return code 0
