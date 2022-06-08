1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:03   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:03   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2464.2
   000002         000200 PROGRAM-ID.                                                      NC2464.2
   000003         000300     NC246A.                                                      NC2464.2
   000004         000500*                                                              *  NC2464.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2464.2
   000006         000700*                                                              *  NC2464.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2464.2
   000008         000900*                                                              *  NC2464.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2464.2
   000010         001100*                                                              *  NC2464.2
   000011         001300*                                                              *  NC2464.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2464.2
   000013         001500*                                                              *  NC2464.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2464.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2464.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2464.2
   000017         001900*                                                              *  NC2464.2
   000018         002100*                                                              *  NC2464.2
   000019         002200*    PROGRAM NC246A TESTS THE USE OF QUALIFIED DATA NAMES AND  *  NC2464.2
   000020         002300*    SUBSCRIPTS WHEN ACCESSING A SEVEN-DIMENSIONAL TABLE.      *  NC2464.2
   000021         002400*    QUALIFIED CONDITION-NAMES AND RELATIVE INDEXING ARE ALSO  *  NC2464.2
   000022         002500*    USED IN ACCESSING THREE-DIMENSIONAL TABLES.               *  NC2464.2
   000023         002600*                                                              *  NC2464.2
   000024         002800*                                                              *  NC2464.2
   000025         002900*    DATA-NAMES MAY BE QUALIFIED AND THE NUMBER OF QUALIFIERS*    NC2464.2
   000026         003000*    PERMITTED MUST BE AT LEAST FIVE.  WHEN A SUBSCRIPT IS     *  NC2464.2
   000027         003100*    REPRESENTED BY A DATA-NAME, THE DATA-NAME MAY BE QUALIFIED*  NC2464.2
   000028         003200*    BUT NOT SUBSCRIPTED.                                      *  NC2464.2
   000029         003300*                                                              *  NC2464.2
   000030         003500*                                                              *  NC2464.2
   000031         003600*    STATEMENT DELETION INSTRUCTIONS                           *  NC2464.2
   000032         003700*                                                              *  NC2464.2
   000033         003800*    IF THE COMPILER REJECTS ANY OF THE TABLE REFERENCES IN  *    NC2464.2
   000034         003900*    THIS ROUTINE, DELETE THAT LINE OF CODE BY PLACING AN * IN *  NC2464.2
   000035         004000*    COLUMN 7.  LEAVE THE PERFORM STATEMENT.  THE TEST ELEMENT *  NC2464.2
   000036         004100*    DELETED APPEARS AS A FAILURE ON THE OUTPUT REPORT AND THE *  NC2464.2
   000037         004200*    COMPUTED RESULTS ARE SPACES.                              *  NC2464.2
   000038         004300*                                                              *  NC2464.2
   000039         004500 ENVIRONMENT DIVISION.                                            NC2464.2
   000040         004600 CONFIGURATION SECTION.                                           NC2464.2
   000041         004700 SOURCE-COMPUTER.                                                 NC2464.2
   000042         004800     XXXXX082.                                                    NC2464.2
   000043         004900 OBJECT-COMPUTER.                                                 NC2464.2
   000044         005000     XXXXX083.                                                    NC2464.2
   000045         005100 INPUT-OUTPUT SECTION.                                            NC2464.2
   000046         005200 FILE-CONTROL.                                                    NC2464.2
   000047         005300     SELECT PRINT-FILE ASSIGN TO                                  NC2464.2 51
   000048         005400     XXXXX055.                                                    NC2464.2
   000049         005500 DATA DIVISION.                                                   NC2464.2
   000050         005600 FILE SECTION.                                                    NC2464.2
   000051         005700 FD  PRINT-FILE.                                                  NC2464.2

 ==000051==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000052         005800 01  PRINT-REC PICTURE X(120).                                    NC2464.2
   000053         005900 01  DUMMY-RECORD PICTURE X(120).                                 NC2464.2
   000054         006000 WORKING-STORAGE SECTION.                                         NC2464.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006100 01  TABLE-A.                                                     NC2464.2
   000056         006200  02  L2 OCCURS 2.                                                NC2464.2
   000057         006300   03  L3 OCCURS 2.                                               NC2464.2
   000058         006400    04  L4 OCCURS 2.                                              NC2464.2
   000059         006500     05  L5 OCCURS 2.                                             NC2464.2
   000060         006600      06  L6 OCCURS 2.                                            NC2464.2
   000061         006700       07  L7 OCCURS 2.                                           NC2464.2
   000062         006800        08  L8 OCCURS 2.                                          NC2464.2
   000063         006900         09  ELEM1        PIC 99.                                 NC2464.2
   000064         007000         09  ELEM2        PIC 99.                                 NC2464.2
   000065         007100 01  TABLE-B.                                                     NC2464.2
   000066         007200  02  L2 OCCURS 2.                                                NC2464.2
   000067         007300   03  L3 OCCURS 2.                                               NC2464.2
   000068         007400    04  L4 OCCURS 2.                                              NC2464.2
   000069         007500     05  L5 OCCURS 2.                                             NC2464.2
   000070         007600      06  L6 OCCURS 2.                                            NC2464.2
   000071         007700       07  L7 OCCURS 2.                                           NC2464.2
   000072         007800        08  L8 OCCURS 2.                                          NC2464.2
   000073         007900         09  ELEM1        PIC 99.                                 NC2464.2
   000074         008000         09  ELEM2        PIC 99.                                 NC2464.2
   000075         008100 01  SUBSCRIPTS-GROUP-1.                                          NC2464.2
   000076         008200  02  SO2.                                                        NC2464.2
   000077         008300   03  SO3.                                                       NC2464.2
   000078         008400    04  SO4.                                                      NC2464.2
   000079         008500     05  SO5.                                                     NC2464.2
   000080         008600      06  SO6.                                                    NC2464.2
   000081         008700       07  SO7.                                                   NC2464.2
   000082         008800        08  SO8.                                                  NC2464.2
   000083         008900         09  SO9.                                                 NC2464.2
   000084         009000          10  S10.                                                NC2464.2
   000085         009100           11  S11.                                               NC2464.2
   000086         009200            12  S12.                                              NC2464.2
   000087         009300             13  S13.                                             NC2464.2
   000088         009400              14  S14.                                            NC2464.2
   000089         009500               15  S15.                                           NC2464.2
   000090         009600                16  S16.                                          NC2464.2
   000091         009700                 17  S17.                                         NC2464.2
   000092         009800                  18  S18.                                        NC2464.2
   000093         009900                   19  S19.                                       NC2464.2
   000094         010000                    20  S20.                                      NC2464.2
   000095         010100                     21  S21.                                     NC2464.2
   000096         010200                      22  S22.                                    NC2464.2
   000097         010300                       23  S23.                                   NC2464.2
   000098         010400                        24  S24.                                  NC2464.2
   000099         010500                         25  S25.                                 NC2464.2
   000100         010600                          26  S26.                                NC2464.2
   000101         010700                           27  S27.                               NC2464.2
   000102         010800                            28  S28.                              NC2464.2
   000103         010900                             29  S29.                             NC2464.2
   000104         011000                              30  S30.                            NC2464.2
   000105         011100                               31  S31.                           NC2464.2
   000106         011200                                32  S32.                          NC2464.2
   000107         011300                                 33  S33.                         NC2464.2
   000108         011400                                  34  S34.                        NC2464.2
   000109         011500                                   35  S35.                       NC2464.2
   000110         011600                                    36  S36.                      NC2464.2
   000111         011700                                     37  S37.                     NC2464.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011800                                      38  S38.                    NC2464.2
   000113         011900                                       39  S39.                   NC2464.2
   000114         012000                                        40  S40.                  NC2464.2
   000115         012100                                         41  S41.                 NC2464.2
   000116         012200                                          42  S42.                NC2464.2
   000117         012300                                           43  S43.               NC2464.2
   000118         012400                                            44  S44.              NC2464.2
   000119         012500                                             45  S45.             NC2464.2
   000120         012600                                              46  S46.            NC2464.2
   000121         012700                                               47  S47.           NC2464.2
   000122         012800                                                48  S48.          NC2464.2
   000123         012900                                                 49  SUB1 PIC 9   NC2464.2
   000124         013000                                                     VALUE 1.     NC2464.2
   000125         013100                                                 49  SUB2 PIC 9   NC2464.2
   000126         013200                                                     VALUE 1.     NC2464.2
   000127         013300                                                 49  SUB3 PIC 9   NC2464.2
   000128         013400                                                     VALUE 1.     NC2464.2
   000129         013500                                                 49  SUB4 PIC 9   NC2464.2
   000130         013600                                                     VALUE 1.     NC2464.2
   000131         013700                                                 49  SUB5 PIC 9   NC2464.2
   000132         013800                                                     VALUE 1.     NC2464.2
   000133         013900                                                 49  SUB6 PIC 9   NC2464.2
   000134         014000                                                     VALUE 1.     NC2464.2
   000135         014100                                                 49  SUB7 PIC 9   NC2464.2
   000136         014200                                                     VALUE 1.     NC2464.2
   000137         014300 01  SUBSCRIPTS-GROUP-2.                                          NC2464.2
   000138         014400  02  SO2.                                                        NC2464.2
   000139         014500   03  SO3.                                                       NC2464.2
   000140         014600    04  SO4.                                                      NC2464.2
   000141         014700     05  SO5.                                                     NC2464.2
   000142         014800      06  SO6.                                                    NC2464.2
   000143         014900       07  SO7.                                                   NC2464.2
   000144         015000        08  SO8.                                                  NC2464.2
   000145         015100         09  SO9.                                                 NC2464.2
   000146         015200          10  S10.                                                NC2464.2
   000147         015300           11  S11.                                               NC2464.2
   000148         015400            12  S12.                                              NC2464.2
   000149         015500             13  S13.                                             NC2464.2
   000150         015600              14  S14.                                            NC2464.2
   000151         015700               15  S15.                                           NC2464.2
   000152         015800                16  S16.                                          NC2464.2
   000153         015900                 17  S17.                                         NC2464.2
   000154         016000                  18  S18.                                        NC2464.2
   000155         016100                   19  S19.                                       NC2464.2
   000156         016200                    20  S20.                                      NC2464.2
   000157         016300                     21  S21.                                     NC2464.2
   000158         016400                      22  S22.                                    NC2464.2
   000159         016500                       23  S23.                                   NC2464.2
   000160         016600                        24  S24.                                  NC2464.2
   000161         016700                         25  S25.                                 NC2464.2
   000162         016800                          26  S26.                                NC2464.2
   000163         016900                           27  S27.                               NC2464.2
   000164         017000                            28  S28.                              NC2464.2
   000165         017100                             29  S29.                             NC2464.2
   000166         017200                              30  S30.                            NC2464.2
   000167         017300                               31  S31.                           NC2464.2
   000168         017400                                32  S32.                          NC2464.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017500                                 33  S33.                         NC2464.2
   000170         017600                                  34  S34.                        NC2464.2
   000171         017700                                   35  S35.                       NC2464.2
   000172         017800                                    36  S36.                      NC2464.2
   000173         017900                                     37  S37.                     NC2464.2
   000174         018000                                      38  S38.                    NC2464.2
   000175         018100                                       39  S39.                   NC2464.2
   000176         018200                                        40  S40.                  NC2464.2
   000177         018300                                         41  S41.                 NC2464.2
   000178         018400                                          42  S42.                NC2464.2
   000179         018500                                           43  S43.               NC2464.2
   000180         018600                                            44  S44.              NC2464.2
   000181         018700                                             45  S45.             NC2464.2
   000182         018800                                              46  S46.            NC2464.2
   000183         018900                                               47  S47.           NC2464.2
   000184         019000                                                48  S48.          NC2464.2
   000185         019100                                                 49  SUB1 PIC 9   NC2464.2
   000186         019200                                                     VALUE 2.     NC2464.2
   000187         019300                                                 49  SUB2 PIC 9   NC2464.2
   000188         019400                                                     VALUE 2.     NC2464.2
   000189         019500                                                 49  SUB3 PIC 9   NC2464.2
   000190         019600                                                     VALUE 2.     NC2464.2
   000191         019700                                                 49  SUB4 PIC 9   NC2464.2
   000192         019800                                                     VALUE 2.     NC2464.2
   000193         019900                                                 49  SUB5 PIC 9   NC2464.2
   000194         020000                                                     VALUE 2.     NC2464.2
   000195         020100                                                 49  SUB6 PIC 9   NC2464.2
   000196         020200                                                     VALUE 2.     NC2464.2
   000197         020300                                                 49  SUB7 PIC 9   NC2464.2
   000198         020400                                                     VALUE 2.     NC2464.2
   000199         020500 01  COMPARISON-VALUES.                                           NC2464.2
   000200         020600     02  EXPECTED-VALUE   PICTURE X(6).                           NC2464.2
   000201         020700     02  TEMP-VALUE       PICTURE X(6).                           NC2464.2
   000202         020800 01  GROUP-1-TABLE.                                               NC2464.2
   000203         020900     02  TABLE-LEVEL-2.                                           NC2464.2
   000204         021000         03  FILLER  PIC X(13)  VALUE "GROUP-1-TABLE".            NC2464.2
   000205         021100         03  TABLE-LEVEL-3.                                       NC2464.2
   000206         021200             04  FILLER  PIC X  VALUE SPACE.                      NC2464.2 IMP
   000207         021300             04  TABLE-LEVEL-4.                                   NC2464.2
   000208         021400                 05  FILLER  PIC X  VALUE "=".                    NC2464.2
   000209         021500                 05  TABLE-LEVEL-5.                               NC2464.2
   000210         021600                     06  FILLER  PIC X   VALUE SPACE.             NC2464.2 IMP
   000211         021700                     06  TABLE-ITEM   PICTURE X                   NC2464.2
   000212         021800                           OCCURS 15 TIMES                        NC2464.2
   000213         021900                           INDEXED BY IN1.                        NC2464.2
   000214         022000                     88  EQUALS-A   VALUE "A".                    NC2464.2
   000215         022100                     88  EQUALS-C   VALUE "C".                    NC2464.2
   000216         022200                     88  EQUALS-M   VALUE "M".                    NC2464.2
   000217         022300                 05  GROUP-1-ENTRY REDEFINES TABLE-LEVEL-5.       NC2464.2 209
   000218         022400                     06  FILLER  PIC X(16).                       NC2464.2
   000219         022500 01  GROUP-2-TABLE.                                               NC2464.2
   000220         022600     02  TABLE-LEVEL-2.                                           NC2464.2
   000221         022700         03  FILLER  PIC X(13)  VALUE "GROUP-2-TABLE".            NC2464.2
   000222         022800         03  TABLE-LEVEL-3.                                       NC2464.2
   000223         022900             04  FILLER  PIC X  VALUE SPACE.                      NC2464.2 IMP
   000224         023000             04  TABLE-LEVEL-4.                                   NC2464.2
   000225         023100                 05  FILLER  PIC X  VALUE "=".                    NC2464.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023200                 05  TABLE-LEVEL-5.                               NC2464.2
   000227         023300                     06  FILLER  PIC X   VALUE SPACE.             NC2464.2 IMP
   000228         023400                     06  TABLE-ITEM   PICTURE X                   NC2464.2
   000229         023500                           OCCURS 12 TIMES                        NC2464.2
   000230         023600                           INDEXED BY IN2.                        NC2464.2
   000231         023700                     88  EQUALS-A   VALUE "A".                    NC2464.2
   000232         023800                     88  EQUALS-C   VALUE "C".                    NC2464.2
   000233         023900                     88  EQUALS-M   VALUE "M".                    NC2464.2
   000234         024000                 05  GROUP-2-ENTRY REDEFINES TABLE-LEVEL-5.       NC2464.2 226
   000235         024100                     06  FILLER  PIC X(13).                       NC2464.2
   000236         024200 01  GROUP-3-TABLE.                                               NC2464.2
   000237         024300     02  TABLE-LEVEL-2.                                           NC2464.2
   000238         024400         03  FILLER  PIC X(15)  VALUE "GROUP-3-TABLE =".          NC2464.2
   000239         024500         03  TABLE-LEVEL-3.                                       NC2464.2
   000240         024600             04  TABLE-LEVEL-4                                    NC2464.2
   000241         024700                   OCCURS 2 TIMES                                 NC2464.2
   000242         024800                   INDEXED BY IN3.                                NC2464.2
   000243         024900                 05  TABLE-LEVEL-5                                NC2464.2
   000244         025000                       OCCURS 2 TIMES                             NC2464.2
   000245         025100                       INDEXED BY IN4.                            NC2464.2
   000246         025200                   06  TABLE-ITEM      PICTURE X                  NC2464.2
   000247         025300                           OCCURS 4 TIMES                         NC2464.2
   000248         025400                           INDEXED BY IN5.                        NC2464.2
   000249         025500                     88  EQUALS-A   VALUE "A".                    NC2464.2
   000250         025600                     88  EQUALS-C   VALUE "C".                    NC2464.2
   000251         025700                     88  EQUALS-M   VALUE "M".                    NC2464.2
   000252         025800         03  GROUP-3-ENTRY REDEFINES TABLE-LEVEL-3.               NC2464.2 239
   000253         025900                     06  FILLER  PIC X(16).                       NC2464.2
   000254         026000 01  GROUP-4-TABLE.                                               NC2464.2
   000255         026100     02  UNQUAL-TABLE-2.                                          NC2464.2
   000256         026200         03  UNQUAL-TABLE-3.                                      NC2464.2
   000257         026300             04  UNQUAL-TABLE-4.                                  NC2464.2
   000258         026400                 05  FILLER  PIC X(15)  VALUE "GROUP-4-TABLE =".  NC2464.2
   000259         026500                05  UNQUAL-TABLE-5.                               NC2464.2
   000260         026600                     06  UNQUAL-ITEM  PIC X                       NC2464.2
   000261         026700                        OCCURS 15 TIMES.                          NC2464.2
   000262         026800 01  GROUP-5-TABLE.                                               NC2464.2
   000263         026900     02  TABLE5-LEVEL-2.                                          NC2464.2
   000264         027000         03  FILLER  PIC X(15)   VALUE "GROUP-5-TABLE =".         NC2464.2
   000265         027100         03  TABLE5-LEVEL-3.                                      NC2464.2
   000266         027200             04  TABLE5-LEVEL-4  OCCURS 2 TIMES.                  NC2464.2
   000267         027300                 05  TABLE5-LEVEL-5 OCCURS 2 TIMES.               NC2464.2
   000268         027400                     06  TABLE5-ITEM-UNQUAL   PIC X               NC2464.2
   000269         027500                           OCCURS 4 TIMES.                        NC2464.2
   000270         027600 01  FIRST-SUB    PIC  99    VALUE 1.                             NC2464.2
   000271         027700 01  FOURTH-SUB   PIC  99    VALUE 4.                             NC2464.2
   000272         027800 01  UNQUAL-SUB   PIC  99.                                        NC2464.2
   000273         027900 01  SUBSCRIPTS-PART1.                                            NC2464.2
   000274         028000     02  SUBSCRIPTS.                                              NC2464.2
   000275         028100         03  SUB1  PIC 9    VALUE 5.                              NC2464.2
   000276         028200         03  SUB2  PIC 99   VALUE 12.                             NC2464.2
   000277         028300         03  SUB3  PIC 999   USAGE COMP   VALUE 1.                NC2464.2
   000278         028400     02  SOME-MORE-SUBSCRIPTS.                                    NC2464.2
   000279         028500         03  SUB1   PIC 9   USAGE COMP   VALUE 3.                 NC2464.2
   000280         028600         03  SUB2   PIC 99  USAGE COMP   VALUE 7.                 NC2464.2
   000281         028700         03  SUB3   PIC 999   VALUE 15.                           NC2464.2
   000282         028800 01  SUBSCRIPTS-PART2.                                            NC2464.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028900     02  SUB-PART2-LEVEL2.                                        NC2464.2
   000284         029000         03  SUB-PART2-LEVEL3.                                    NC2464.2
   000285         029100             04  SUB-PART2-LEVEL4.                                NC2464.2
   000286         029200                 05  SUBSCRIPTS.                                  NC2464.2
   000287         029300                     06  SUB1   PIC 999   VALUE 5.                NC2464.2
   000288         029400                     06  SUB2   PIC 99   VALUE 12.                NC2464.2
   000289         029500                     06  SUB3   PIC 99   USAGE COMP   VALUE 1.    NC2464.2
   000290         029600         03  SOME-MORE-SUBSCRIPTS.                                NC2464.2
   000291         029700             04  SUB1  PIC 999   USAGE COMP   VALUE 3.            NC2464.2
   000292         029800             04  SUB2   PIC 99   VALUE 7.                         NC2464.2
   000293         029900         04  SUB3  PIC 99  USAGE COMP  VALUE 15.                  NC2464.2
   000294         030000 01  TEST-RESULTS.                                                NC2464.2
   000295         030100     02 FILLER                   PIC X      VALUE SPACE.          NC2464.2 IMP
   000296         030200     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2464.2 IMP
   000297         030300     02 FILLER                   PIC X      VALUE SPACE.          NC2464.2 IMP
   000298         030400     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2464.2 IMP
   000299         030500     02 FILLER                   PIC X      VALUE SPACE.          NC2464.2 IMP
   000300         030600     02  PAR-NAME.                                                NC2464.2
   000301         030700       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2464.2 IMP
   000302         030800       03  PARDOT-X              PIC X      VALUE SPACE.          NC2464.2 IMP
   000303         030900       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2464.2 IMP
   000304         031000     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2464.2 IMP
   000305         031100     02 RE-MARK                  PIC X(61).                       NC2464.2
   000306         031200 01  TEST-COMPUTED.                                               NC2464.2
   000307         031300     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2464.2 IMP
   000308         031400     02 FILLER                   PIC X(17)  VALUE                 NC2464.2
   000309         031500            "       COMPUTED=".                                   NC2464.2
   000310         031600     02 COMPUTED-X.                                               NC2464.2
   000311         031700     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2464.2 IMP
   000312         031800     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2464.2 311
   000313         031900                                 PIC -9(9).9(9).                  NC2464.2
   000314         032000     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2464.2 311
   000315         032100     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2464.2 311
   000316         032200     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2464.2 311
   000317         032300     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2464.2 311
   000318         032400         04 COMPUTED-18V0                    PIC -9(18).          NC2464.2
   000319         032500         04 FILLER                           PIC X.               NC2464.2
   000320         032600     03 FILLER PIC X(50) VALUE SPACE.                             NC2464.2 IMP
   000321         032700 01  TEST-CORRECT.                                                NC2464.2
   000322         032800     02 FILLER PIC X(30) VALUE SPACE.                             NC2464.2 IMP
   000323         032900     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2464.2
   000324         033000     02 CORRECT-X.                                                NC2464.2
   000325         033100     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2464.2 IMP
   000326         033200     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2464.2 325
   000327         033300     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2464.2 325
   000328         033400     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2464.2 325
   000329         033500     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2464.2 325
   000330         033600     03      CR-18V0 REDEFINES CORRECT-A.                         NC2464.2 325
   000331         033700         04 CORRECT-18V0                     PIC -9(18).          NC2464.2
   000332         033800         04 FILLER                           PIC X.               NC2464.2
   000333         033900     03 FILLER PIC X(2) VALUE SPACE.                              NC2464.2 IMP
   000334         034000     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2464.2 IMP
   000335         034100 01  CCVS-C-1.                                                    NC2464.2
   000336         034200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2464.2
   000337         034300-    "SS  PARAGRAPH-NAME                                          NC2464.2
   000338         034400-    "       REMARKS".                                            NC2464.2
   000339         034500     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2464.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034600 01  CCVS-C-2.                                                    NC2464.2
   000341         034700     02 FILLER                     PIC X        VALUE SPACE.      NC2464.2 IMP
   000342         034800     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2464.2
   000343         034900     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2464.2 IMP
   000344         035000     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2464.2
   000345         035100     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2464.2 IMP
   000346         035200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2464.2 IMP
   000347         035300 01  REC-CT                        PIC 99       VALUE ZERO.       NC2464.2 IMP
   000348         035400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2464.2 IMP
   000349         035500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2464.2 IMP
   000350         035600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2464.2 IMP
   000351         035700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2464.2 IMP
   000352         035800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2464.2 IMP
   000353         035900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2464.2 IMP
   000354         036000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2464.2 IMP
   000355         036100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2464.2 IMP
   000356         036200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2464.2 IMP
   000357         036300 01  CCVS-H-1.                                                    NC2464.2
   000358         036400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2464.2 IMP
   000359         036500     02  FILLER                    PIC X(42)    VALUE             NC2464.2
   000360         036600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2464.2
   000361         036700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2464.2 IMP
   000362         036800 01  CCVS-H-2A.                                                   NC2464.2
   000363         036900   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2464.2 IMP
   000364         037000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2464.2
   000365         037100   02  FILLER                        PIC XXXX   VALUE             NC2464.2
   000366         037200     "4.2 ".                                                      NC2464.2
   000367         037300   02  FILLER                        PIC X(28)  VALUE             NC2464.2
   000368         037400            " COPY - NOT FOR DISTRIBUTION".                       NC2464.2
   000369         037500   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2464.2 IMP
   000370         037600                                                                  NC2464.2
   000371         037700 01  CCVS-H-2B.                                                   NC2464.2
   000372         037800   02  FILLER                        PIC X(15)  VALUE             NC2464.2
   000373         037900            "TEST RESULT OF ".                                    NC2464.2
   000374         038000   02  TEST-ID                       PIC X(9).                    NC2464.2
   000375         038100   02  FILLER                        PIC X(4)   VALUE             NC2464.2
   000376         038200            " IN ".                                               NC2464.2
   000377         038300   02  FILLER                        PIC X(12)  VALUE             NC2464.2
   000378         038400     " HIGH       ".                                              NC2464.2
   000379         038500   02  FILLER                        PIC X(22)  VALUE             NC2464.2
   000380         038600            " LEVEL VALIDATION FOR ".                             NC2464.2
   000381         038700   02  FILLER                        PIC X(58)  VALUE             NC2464.2
   000382         038800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2464.2
   000383         038900 01  CCVS-H-3.                                                    NC2464.2
   000384         039000     02  FILLER                      PIC X(34)  VALUE             NC2464.2
   000385         039100            " FOR OFFICIAL USE ONLY    ".                         NC2464.2
   000386         039200     02  FILLER                      PIC X(58)  VALUE             NC2464.2
   000387         039300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2464.2
   000388         039400     02  FILLER                      PIC X(28)  VALUE             NC2464.2
   000389         039500            "  COPYRIGHT   1985 ".                                NC2464.2
   000390         039600 01  CCVS-E-1.                                                    NC2464.2
   000391         039700     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2464.2 IMP
   000392         039800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2464.2
   000393         039900     02 ID-AGAIN                     PIC X(9).                    NC2464.2
   000394         040000     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2464.2 IMP
   000395         040100 01  CCVS-E-2.                                                    NC2464.2
   000396         040200     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2464.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040300     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2464.2 IMP
   000398         040400     02 CCVS-E-2-2.                                               NC2464.2
   000399         040500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2464.2 IMP
   000400         040600         03 FILLER                   PIC X      VALUE SPACE.      NC2464.2 IMP
   000401         040700         03 ENDER-DESC               PIC X(44)  VALUE             NC2464.2
   000402         040800            "ERRORS ENCOUNTERED".                                 NC2464.2
   000403         040900 01  CCVS-E-3.                                                    NC2464.2
   000404         041000     02  FILLER                      PIC X(22)  VALUE             NC2464.2
   000405         041100            " FOR OFFICIAL USE ONLY".                             NC2464.2
   000406         041200     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2464.2 IMP
   000407         041300     02  FILLER                      PIC X(58)  VALUE             NC2464.2
   000408         041400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2464.2
   000409         041500     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2464.2 IMP
   000410         041600     02 FILLER                       PIC X(15)  VALUE             NC2464.2
   000411         041700             " COPYRIGHT 1985".                                   NC2464.2
   000412         041800 01  CCVS-E-4.                                                    NC2464.2
   000413         041900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2464.2 IMP
   000414         042000     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2464.2
   000415         042100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2464.2 IMP
   000416         042200     02 FILLER                       PIC X(40)  VALUE             NC2464.2
   000417         042300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2464.2
   000418         042400 01  XXINFO.                                                      NC2464.2
   000419         042500     02 FILLER                       PIC X(19)  VALUE             NC2464.2
   000420         042600            "*** INFORMATION ***".                                NC2464.2
   000421         042700     02 INFO-TEXT.                                                NC2464.2
   000422         042800       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2464.2 IMP
   000423         042900       04 XXCOMPUTED                 PIC X(20).                   NC2464.2
   000424         043000       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2464.2 IMP
   000425         043100       04 XXCORRECT                  PIC X(20).                   NC2464.2
   000426         043200     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2464.2
   000427         043300 01  HYPHEN-LINE.                                                 NC2464.2
   000428         043400     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2464.2 IMP
   000429         043500     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2464.2
   000430         043600-    "*****************************************".                 NC2464.2
   000431         043700     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2464.2
   000432         043800-    "******************************".                            NC2464.2
   000433         043900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2464.2
   000434         044000     "NC246A".                                                    NC2464.2
   000435         044100 PROCEDURE DIVISION.                                              NC2464.2
   000436         044200 CCVS1 SECTION.                                                   NC2464.2
   000437         044300 OPEN-FILES.                                                      NC2464.2
   000438         044400     OPEN     OUTPUT PRINT-FILE.                                  NC2464.2 51
   000439         044500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2464.2 433 374 433 393
   000440         044600     MOVE    SPACE TO TEST-RESULTS.                               NC2464.2 IMP 294
   000441         044700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2464.2 466 471
   000442         044800     GO TO CCVS1-EXIT.                                            NC2464.2 548
   000443         044900 CLOSE-FILES.                                                     NC2464.2
   000444         045000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2464.2 475 496 51
   000445         045100 TERMINATE-CCVS.                                                  NC2464.2
   000446         045200     EXIT PROGRAM.                                                NC2464.2
   000447         045300 TERMINATE-CALL.                                                  NC2464.2
   000448         045400     STOP     RUN.                                                NC2464.2
   000449         045500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2464.2 298 350
   000450         045600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2464.2 298 351
   000451         045700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2464.2 298 349
   000452         045800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2464.2 298 348
   000453         045900     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2464.2 305
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046000 PRINT-DETAIL.                                                    NC2464.2
   000455         046100     IF REC-CT NOT EQUAL TO ZERO                                  NC2464.2 347 IMP
   000456      1  046200             MOVE "." TO PARDOT-X                                 NC2464.2 302
   000457      1  046300             MOVE REC-CT TO DOTVALUE.                             NC2464.2 347 303
   000458         046400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2464.2 294 52 508
   000459         046500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2464.2 298 508
   000460      1  046600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2464.2 525 538
   000461      1  046700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2464.2 539 547
   000462         046800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2464.2 IMP 298 IMP 310
   000463         046900     MOVE SPACE TO CORRECT-X.                                     NC2464.2 IMP 324
   000464         047000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2464.2 347 IMP IMP 300
   000465         047100     MOVE     SPACE TO RE-MARK.                                   NC2464.2 IMP 305
   000466         047200 HEAD-ROUTINE.                                                    NC2464.2
   000467         047300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2464.2 357 53 508
   000468         047400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2464.2 362 53 508
   000469         047500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2464.2 371 53 508
   000470         047600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2464.2 383 53 508
   000471         047700 COLUMN-NAMES-ROUTINE.                                            NC2464.2
   000472         047800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2464.2 335 53 508
   000473         047900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2464.2 340 53 508
   000474         048000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2464.2 427 53 508
   000475         048100 END-ROUTINE.                                                     NC2464.2
   000476         048200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2464.2 427 53 508
   000477         048300 END-RTN-EXIT.                                                    NC2464.2
   000478         048400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2464.2 390 53 508
   000479         048500 END-ROUTINE-1.                                                   NC2464.2
   000480         048600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2464.2 349 353 350
   000481         048700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2464.2 353 348 353
   000482         048800      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2464.2 351 353
   000483         048900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2464.2
   000484         049000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2464.2 351 413
   000485         049100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2464.2 353 415
   000486         049200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2464.2 412 398
   000487         049300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2464.2 395 53 508
   000488         049400  END-ROUTINE-12.                                                 NC2464.2
   000489         049500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2464.2 401
   000490         049600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2464.2 349 IMP
   000491      1  049700         MOVE "NO " TO ERROR-TOTAL                                NC2464.2 399
   000492         049800         ELSE                                                     NC2464.2
   000493      1  049900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2464.2 349 399
   000494         050000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2464.2 395 53
   000495         050100     PERFORM WRITE-LINE.                                          NC2464.2 508
   000496         050200 END-ROUTINE-13.                                                  NC2464.2
   000497         050300     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2464.2 348 IMP
   000498      1  050400         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2464.2 399
   000499      1  050500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2464.2 348 399
   000500         050600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2464.2 401
   000501         050700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2464.2 395 53 508
   000502         050800      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2464.2 350 IMP
   000503      1  050900          MOVE "NO " TO ERROR-TOTAL                               NC2464.2 399
   000504      1  051000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2464.2 350 399
   000505         051100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2464.2 401
   000506         051200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2464.2 395 53 508
   000507         051300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2464.2 403 53 508
   000508         051400 WRITE-LINE.                                                      NC2464.2
   000509         051500     ADD 1 TO RECORD-COUNT.                                       NC2464.2 355
   000510         051600     IF RECORD-COUNT GREATER 50                                   NC2464.2 355
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  051700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2464.2 53 354
   000512      1  051800         MOVE SPACE TO DUMMY-RECORD                               NC2464.2 IMP 53
   000513      1  051900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2464.2 53
   000514      1  052000         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2464.2 335 53 520
   000515      1  052100         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2464.2 340 53 520
   000516      1  052200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2464.2 427 53 520
   000517      1  052300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2464.2 354 53
   000518      1  052400         MOVE ZERO TO RECORD-COUNT.                               NC2464.2 IMP 355
   000519         052500     PERFORM WRT-LN.                                              NC2464.2 520
   000520         052600 WRT-LN.                                                          NC2464.2
   000521         052700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2464.2 53
   000522         052800     MOVE SPACE TO DUMMY-RECORD.                                  NC2464.2 IMP 53
   000523         052900 BLANK-LINE-PRINT.                                                NC2464.2
   000524         053000     PERFORM WRT-LN.                                              NC2464.2 520
   000525         053100 FAIL-ROUTINE.                                                    NC2464.2
   000526         053200     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2464.2 310 IMP 533
   000527         053300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2464.2 324 IMP 533
   000528         053400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2464.2 356 426
   000529         053500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2464.2 421
   000530         053600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2464.2 418 53 508
   000531         053700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2464.2 IMP 426
   000532         053800     GO TO  FAIL-ROUTINE-EX.                                      NC2464.2 538
   000533         053900 FAIL-ROUTINE-WRITE.                                              NC2464.2
   000534         054000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2464.2 306 52 508
   000535         054100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2464.2 356 334
   000536         054200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2464.2 321 52 508
   000537         054300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2464.2 IMP 334
   000538         054400 FAIL-ROUTINE-EX. EXIT.                                           NC2464.2
   000539         054500 BAIL-OUT.                                                        NC2464.2
   000540         054600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2464.2 311 IMP 542
   000541         054700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2464.2 325 IMP 547
   000542         054800 BAIL-OUT-WRITE.                                                  NC2464.2
   000543         054900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2464.2 325 425 311 423
   000544         055000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2464.2 356 426
   000545         055100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2464.2 418 53 508
   000546         055200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2464.2 IMP 426
   000547         055300 BAIL-OUT-EX. EXIT.                                               NC2464.2
   000548         055400 CCVS1-EXIT.                                                      NC2464.2
   000549         055500     EXIT.                                                        NC2464.2
   000550         055600 SECT-NC246A-001 SECTION.                                         NC2464.2
   000551         055700*                                                                 NC2464.2
   000552         055800 TABLE-INIT.                                                      NC2464.2
   000553         055900     MOVE "INIT-TABLE" TO PAR-NAME.                               NC2464.2 300
   000554         056000     MOVE "STORE TABLE VALUES" TO FEATURE.                        NC2464.2 296
   000555         056100*                                                                 NC2464.2
   000556         056200*         THIS SECTION STORES THE LETTERS OF THE ALPHABET IN THE  NC2464.2
   000557         056300*    THREE TABLES WHOSE ITEMS ARE REFERENCED IN THE QUALIFICATION NC2464.2
   000558         056400*    TESTS IN THIS ROUTINE.  THE TABLE CONTENTS ARE AS FOLLOWS    NC2464.2
   000559         056500*            GROUP-1-TABLE     A,B,...,O.                         NC2464.2
   000560         056600*            GROUP-2-TABLE     L,K,J,...,B,A.                     NC2464.2
   000561         056700*            GROUP-3-TABLE     A,B,...,O,P.                       NC2464.2
   000562         056800*            GROUP-4-TABLE     A,B,...,O.                         NC2464.2
   000563         056900*            GROUP-5-TABLE     P,O,N,...,B,A.                     NC2464.2
   000564         057000*    THE TABLES ARE ALSO PRINTED ON THE OUTPUT REPORT.            NC2464.2
   000565         057100*                                                                 NC2464.2
   000566         057200     MOVE " ABCDEFGHIJKLMNO" TO GROUP-1-ENTRY.                    NC2464.2 217
   000567         057300     MOVE " LKJIHGFEDCBA" TO GROUP-2-ENTRY.                       NC2464.2 234
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057400     MOVE "ABCDEFGHIJKLMNOP" TO GROUP-3-ENTRY.                    NC2464.2 252
   000569         057500     MOVE "ABCDEFGHIJKLMNO" TO UNQUAL-TABLE-5.                    NC2464.2 259
   000570         057600     MOVE "PONMLKJIHGFEDCBA" TO TABLE5-LEVEL-3.                   NC2464.2 265
   000571         057700*                                                                 NC2464.2
   000572         057800 TABLE-PRINT.                                                     NC2464.2
   000573         057900     MOVE GROUP-1-TABLE TO RE-MARK.                               NC2464.2 202 305
   000574         058000     MOVE "SEE REMARKS" TO COMPUTED-A.                            NC2464.2 311
   000575         058100     MOVE "ABCDEFGHIJKLMNO" TO CORRECT-A.                         NC2464.2 325
   000576         058200     MOVE 1 TO REC-CT.                                            NC2464.2 347
   000577         058300     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   000578         058400     MOVE GROUP-2-TABLE TO RE-MARK.                               NC2464.2 219 305
   000579         058500     MOVE "LKJIHGFEDCBA" TO CORRECT-A.                            NC2464.2 325
   000580         058600     MOVE "SEE REMARKS" TO COMPUTED-A.                            NC2464.2 311
   000581         058700     MOVE 2 TO REC-CT.                                            NC2464.2 347
   000582         058800     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   000583         058900     MOVE GROUP-3-TABLE TO RE-MARK.                               NC2464.2 236 305
   000584         059000     MOVE "ABCDEFGHIJKLMNOP" TO CORRECT-A.                        NC2464.2 325
   000585         059100     MOVE 3 TO REC-CT.                                            NC2464.2 347
   000586         059200     MOVE "SEE REMARKS" TO COMPUTED-A.                            NC2464.2 311
   000587         059300     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   000588         059400     MOVE GROUP-4-TABLE TO RE-MARK.                               NC2464.2 254 305
   000589         059500     MOVE "ABCDEFGHIJKLMNO" TO CORRECT-A.                         NC2464.2 325
   000590         059600     MOVE "SEE REMARKS" TO COMPUTED-A.                            NC2464.2 311
   000591         059700     MOVE 4 TO REC-CT.                                            NC2464.2 347
   000592         059800     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   000593         059900     MOVE GROUP-5-TABLE TO RE-MARK.                               NC2464.2 262 305
   000594         060000     MOVE "PONMLKJIHGFEDCBA" TO CORRECT-A.                        NC2464.2 325
   000595         060100     MOVE "SEE REMARKS" TO COMPUTED-A.                            NC2464.2 311
   000596         060200     MOVE 5 TO REC-CT.                                            NC2464.2 347
   000597         060300     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   000598         060400*                                                                 NC2464.2
   000599         060500 QUAL-TEST-01.                                                    NC2464.2
   000600         060600     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   000601         060700     MOVE SPACE TO TEMP-VALUE.                                    NC2464.2 IMP 201
   000602         060800     MOVE "QUAL-TEST-01" TO PAR-NAME.                             NC2464.2 300
   000603         060900     MOVE "QUALIFIED TABLE ITEM" TO FEATURE.                      NC2464.2 296
   000604         061000     MOVE "ONE DIMENSIONAL TABLE" TO RE-MARK.                     NC2464.2 305
   000605         061100     MOVE "A" TO EXPECTED-VALUE.                                  NC2464.2 200
   000606         061200*                                                                 NC2464.2
   000607         061300*         THIS TEST CONTAINS QUALIFIED DATA NAMES IN MOVE         NC2464.2
   000608         061400*    STATEMENTS.  THE DATA NAMES REFER TO SINGLE DIMENSIONAL      NC2464.2
   000609         061500*    TABLE ITEMS.  THE SUBSCRIPTS IN THIS TEST ARE CONSTANTS,     NC2464.2
   000610         061600*    UNQUALIFIED DATA NAMES AND INDEXES.  BOTH DIRECT AND RELATIVENC2464.2
   000611         061700*    INDEXING ARE USED.                                           NC2464.2
   000612         061800*                                                                 NC2464.2
   000613         061900 QUAL-TEST-01-01.                                                 NC2464.2
   000614         062000     MOVE TABLE-ITEM OF TABLE-LEVEL-5 OF TABLE-LEVEL-4            NC2464.2 211 209 207
   000615         062100          OF TABLE-LEVEL-3 OF TABLE-LEVEL-2                       NC2464.2 205 203
   000616         062200          OF GROUP-1-TABLE (1) TO TEMP-VALUE.                     NC2464.2 202 201
   000617         062300     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000618         062400*                                                                 NC2464.2
   000619         062500 QUAL-TEST-01-02.                                                 NC2464.2
   000620         062600     MOVE TABLE-ITEM OF TABLE-LEVEL-5 OF TABLE-LEVEL-4            NC2464.2 211 209 207
   000621         062700          OF TABLE-LEVEL-3 OF TABLE-LEVEL-2                       NC2464.2 205 203
   000622         062800          OF GROUP-1-TABLE (FIRST-SUB) TO TEMP-VALUE.             NC2464.2 202 270 201
   000623         062900     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000624         063000*                                                                 NC2464.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         063100 QUAL-TEST-01-03.                                                 NC2464.2
   000626         063200     SET IN1 TO 1.                                                NC2464.2 213
   000627         063300     MOVE TABLE-ITEM OF TABLE-LEVEL-5 OF TABLE-LEVEL-4            NC2464.2 211 209 207
   000628         063400          OF TABLE-LEVEL-3 OF TABLE-LEVEL-2                       NC2464.2 205 203
   000629         063500          OF GROUP-1-TABLE (IN1) TO TEMP-VALUE.                   NC2464.2 202 213 201
   000630         063600     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000631         063700*                                                                 NC2464.2
   000632         063800 QUAL-TEST-01-04.                                                 NC2464.2
   000633         063900     MOVE TABLE-ITEM OF TABLE-LEVEL-5 OF TABLE-LEVEL-4            NC2464.2 228 226 224
   000634         064000          OF TABLE-LEVEL-3 OF TABLE-LEVEL-2                       NC2464.2 222 220
   000635         064100          OF GROUP-2-TABLE (12) TO TEMP-VALUE.                    NC2464.2 219 201
   000636         064200     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000637         064300*                                                                 NC2464.2
   000638         064400 QUAL-TEST-01-05.                                                 NC2464.2
   000639         064500     SET IN1 TO 1.                                                NC2464.2 213
   000640         064600     MOVE "D" TO EXPECTED-VALUE.                                  NC2464.2 200
   000641         064700     MOVE TABLE-ITEM OF TABLE-LEVEL-5 OF TABLE-LEVEL-4            NC2464.2 211 209 207
   000642         064800          OF TABLE-LEVEL-3 OF TABLE-LEVEL-2                       NC2464.2 205 203
   000643         064900          OF GROUP-1-TABLE (IN1 + 3) TO TEMP-VALUE.               NC2464.2 202 213 201
   000644         065000     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000645         065100*                                                                 NC2464.2
   000646         065200 QUAL-TEST-01-06.                                                 NC2464.2
   000647         065300     SET IN1 TO 6.                                                NC2464.2 213
   000648         065400     MOVE TABLE-ITEM OF TABLE-LEVEL-5 OF TABLE-LEVEL-4            NC2464.2 211 209 207
   000649         065500          OF TABLE-LEVEL-3 OF TABLE-LEVEL-2                       NC2464.2 205 203
   000650         065600          OF GROUP-1-TABLE (IN1 - 2) TO TEMP-VALUE.               NC2464.2 202 213 201
   000651         065700     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000652         065800*                                                                 NC2464.2
   000653         065900 QUAL-TEST-01-07.                                                 NC2464.2
   000654         066000     MOVE 9 TO UNQUAL-SUB.                                        NC2464.2 272
   000655         066100     MOVE TABLE-ITEM OF TABLE-LEVEL-5 OF TABLE-LEVEL-4            NC2464.2 228 226 224
   000656         066200          OF TABLE-LEVEL-3 OF TABLE-LEVEL-2                       NC2464.2 222 220
   000657         066300          OF GROUP-2-TABLE (UNQUAL-SUB) TO TEMP-VALUE.            NC2464.2 219 272 201
   000658         066400     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000659         066500     GO TO QUAL-TEST-02.                                          NC2464.2 665
   000660         066600*                                                                 NC2464.2
   000661         066700 QUAL-DELETE-001.                                                 NC2464.2
   000662         066800     PERFORM DE-LETE.                                             NC2464.2 452
   000663         066900     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   000664         067000*                                                                 NC2464.2
   000665         067100 QUAL-TEST-02.                                                    NC2464.2
   000666         067200     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   000667         067300     MOVE "QUAL-TEST-02" TO PAR-NAME.                             NC2464.2 300
   000668         067400     MOVE "TRUE" TO EXPECTED-VALUE.                               NC2464.2 200
   000669         067500*                                                                 NC2464.2
   000670         067600*         THIS TEST CONTAINS TWO QUALIFIED DATA NAMES IN IF       NC2464.2
   000671         067700*    STATEMENTS.  THE DATA NAMES REFER TO SINGLE DIMENSIONAL      NC2464.2
   000672         067800*    TABLE ITEMS.  THE SUBSCRIPTS IN THIS TEST ARE CONSTANTS,     NC2464.2
   000673         067900*    UNQUALIFIED DATA NAMES AND INDEXES.  BOTH DIRECT AND RELATIVENC2464.2
   000674         068000*    INDEXING ARE USED.                                           NC2464.2
   000675         068100*                                                                 NC2464.2
   000676         068200 QUAL-TEST-02-01.                                                 NC2464.2
   000677         068300     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000678         068400     IF TABLE-ITEM IN TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 211 209 207
   000679         068500        IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                         NC2464.2 205 203
   000680         068600        IN GROUP-1-TABLE (1) IS EQUAL TO                          NC2464.2 202
   000681         068700        TABLE-ITEM IN TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 228 226 224
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068800        IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                         NC2464.2 222 220
   000683         068900        IN GROUP-2-TABLE (12)                                     NC2464.2 219
   000684      1  069000              MOVE "TRUE" TO TEMP-VALUE.                          NC2464.2 201
   000685         069100     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000686         069200*                                                                 NC2464.2
   000687         069300 QUAL-TEST-02-02.                                                 NC2464.2
   000688         069400     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000689         069500     IF TABLE-ITEM IN TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 211 209 207
   000690         069600        IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                         NC2464.2 205 203
   000691         069700        IN GROUP-1-TABLE (FIRST-SUB) IS NOT EQUAL TO              NC2464.2 202 270
   000692         069800        TABLE-ITEM IN TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 228 226 224
   000693         069900        IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                         NC2464.2 222 220
   000694         070000        IN GROUP-2-TABLE (FIRST-SUB)                              NC2464.2 219 270
   000695      1  070100              MOVE "TRUE" TO TEMP-VALUE.                          NC2464.2 201
   000696         070200     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000697         070300*                                                                 NC2464.2
   000698         070400 QUAL-TEST-02-03.                                                 NC2464.2
   000699         070500     SET IN1 TO 4.                                                NC2464.2 213
   000700         070600     SET IN2 TO 9.                                                NC2464.2 230
   000701         070700     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000702         070800     IF TABLE-ITEM IN TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 211 209 207
   000703         070900        IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                         NC2464.2 205 203
   000704         071000        IN GROUP-1-TABLE (IN1) IS EQUAL TO                        NC2464.2 202 213
   000705         071100        TABLE-ITEM IN TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 228 226 224
   000706         071200        IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                         NC2464.2 222 220
   000707         071300        IN GROUP-2-TABLE (IN2)                                    NC2464.2 219 230
   000708      1  071400              MOVE "TRUE" TO TEMP-VALUE.                          NC2464.2 201
   000709         071500     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000710         071600*                                                                 NC2464.2
   000711         071700 QUAL-TEST-02-04.                                                 NC2464.2
   000712         071800     SET IN1 IN2 TO 5.                                            NC2464.2 213 230
   000713         071900     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000714         072000     IF TABLE-ITEM IN TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 211 209 207
   000715         072100        IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                         NC2464.2 205 203
   000716         072200        IN GROUP-1-TABLE (IN1 - 1) EQUAL TO                       NC2464.2 202 213
   000717         072300        TABLE-ITEM IN TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 228 226 224
   000718         072400        IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                         NC2464.2 222 220
   000719         072500        IN GROUP-2-TABLE (IN2 + 4)                                NC2464.2 219 230
   000720      1  072600              MOVE "TRUE" TO TEMP-VALUE.                          NC2464.2 201
   000721         072700     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000722         072800*                                                                 NC2464.2
   000723         072900 QUAL-TEST-02-05.                                                 NC2464.2
   000724         073000     SET IN1 TO 5.                                                NC2464.2 213
   000725         073100     MOVE 8 TO UNQUAL-SUB.                                        NC2464.2 272
   000726         073200     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000727         073300     IF TABLE-ITEM IN TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 211 209 207
   000728         073400        IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                         NC2464.2 205 203
   000729         073500        IN GROUP-1-TABLE (IN1) EQUAL TO                           NC2464.2 202 213
   000730         073600        TABLE-ITEM IN TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 228 226 224
   000731         073700        IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                         NC2464.2 222 220
   000732         073800        IN GROUP-2-TABLE (UNQUAL-SUB)                             NC2464.2 219 272
   000733      1  073900              MOVE "TRUE" TO TEMP-VALUE.                          NC2464.2 201
   000734         074000     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000735         074100     GO TO QUAL-INIT-03.                                          NC2464.2 741
   000736         074200*                                                                 NC2464.2
   000737         074300 QUAL-DELETE-002.                                                 NC2464.2
   000738         074400     PERFORM DE-LETE.                                             NC2464.2 452
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074500     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   000740         074600*                                                                 NC2464.2
   000741         074700 QUAL-INIT-03.                                                    NC2464.2
   000742         074800     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   000743         074900     MOVE "QUAL-TEST-03" TO PAR-NAME.                             NC2464.2 300
   000744         075000     MOVE "THREE DIMENSIONAL TABLE" TO RE-MARK.                   NC2464.2 305
   000745         075100     MOVE SPACE TO TEMP-VALUE.                                    NC2464.2 IMP 201
   000746         075200     MOVE "D" TO EXPECTED-VALUE.                                  NC2464.2 200
   000747         075300*                                                                 NC2464.2
   000748         075400*         THIS TEST CONTAINS QUALIFIED DATA NAMES IN MOVE         NC2464.2
   000749         075500*     STATEMENTS.  THE DATA NAMES REFER TO THREE DIMENSIONAL      NC2464.2
   000750         075600*    TABLE ITEMS.  THE SUBSCRIPTS IN THIS TEST ARE CONSTANTS,     NC2464.2
   000751         075700*    UNQUALIFIED DATA NAMES AND INDEXES.  BOTH DIRECT AND RELATIVENC2464.2
   000752         075800*    INDEXING ARE USED.                                           NC2464.2
   000753         075900*                                                                 NC2464.2
   000754         076000*                                                                 NC2464.2
   000755         076100 QUAL-TEST-03-01.                                                 NC2464.2
   000756         076200     MOVE TABLE-ITEM OF TABLE-LEVEL-5 IN TABLE-LEVEL-4            NC2464.2 246 243 240
   000757         076300          OF TABLE-LEVEL-3 IN TABLE-LEVEL-2                       NC2464.2 239 237
   000758         076400          OF GROUP-3-TABLE (1, 1, 4) TO TEMP-VALUE.               NC2464.2 236 201
   000759         076500     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000760         076600*                                                                 NC2464.2
   000761         076700 QUAL-TEST-03-02.                                                 NC2464.2
   000762         076800     MOVE TABLE-ITEM OF TABLE-LEVEL-5 IN TABLE-LEVEL-4            NC2464.2 246 243 240
   000763         076900          OF TABLE-LEVEL-3 IN TABLE-LEVEL-2                       NC2464.2 239 237
   000764         077000          OF GROUP-3-TABLE (FIRST-SUB, FIRST-SUB, FOURTH-SUB)     NC2464.2 236 270 270 271
   000765         077100              TO TEMP-VALUE.                                      NC2464.2 201
   000766         077200     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000767         077300*                                                                 NC2464.2
   000768         077400 QUAL-TEST-03-03.                                                 NC2464.2
   000769         077500     SET IN5 TO 4.                                                NC2464.2 248
   000770         077600     MOVE TABLE-ITEM OF TABLE-LEVEL-5 IN TABLE-LEVEL-4            NC2464.2 246 243 240
   000771         077700          OF TABLE-LEVEL-3 IN TABLE-LEVEL-2                       NC2464.2 239 237
   000772         077800          OF GROUP-3-TABLE (1, 1, IN5) TO TEMP-VALUE.             NC2464.2 236 248 201
   000773         077900     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000774         078000*                                                                 NC2464.2
   000775         078100 QUAL-TEST-03-04.                                                 NC2464.2
   000776         078200     SET IN3, IN4 TO 1.                                           NC2464.2 242 245
   000777         078300     SET IN5 TO 4.                                                NC2464.2 248
   000778         078400     MOVE TABLE-ITEM OF TABLE-LEVEL-5 IN TABLE-LEVEL-4            NC2464.2 246 243 240
   000779         078500          OF TABLE-LEVEL-3 IN TABLE-LEVEL-2                       NC2464.2 239 237
   000780         078600          OF GROUP-3-TABLE (IN3, IN4, IN5) TO TEMP-VALUE.         NC2464.2 236 242 245 248 201
   000781         078700     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000782         078800*                                                                 NC2464.2
   000783         078900 QUAL-TEST-03-05.                                                 NC2464.2
   000784         079000     SET IN3, IN4 TO 2.                                           NC2464.2 242 245
   000785         079100     SET IN5 TO 1.                                                NC2464.2 248
   000786         079200     MOVE TABLE-ITEM OF TABLE-LEVEL-5 IN TABLE-LEVEL-4            NC2464.2 246 243 240
   000787         079300          OF TABLE-LEVEL-3 IN TABLE-LEVEL-2                       NC2464.2 239 237
   000788         079400          IN GROUP-3-TABLE (IN3 - 1, IN4 - 1, IN5 + 3)            NC2464.2 236 242 245 248
   000789         079500              TO TEMP-VALUE.                                      NC2464.2 201
   000790         079600     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000791         079700     GO TO QUAL-INIT-04.                                          NC2464.2 797
   000792         079800*                                                                 NC2464.2
   000793         079900 QUAL-DELETE-003.                                                 NC2464.2
   000794         080000     PERFORM DE-LETE.                                             NC2464.2 452
   000795         080100     PERFORM PRINT-DETAIL.                                        NC2464.2 454
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080200*                                                                 NC2464.2
   000797         080300 QUAL-INIT-04.                                                    NC2464.2
   000798         080400     MOVE "QUAL-TEST-04" TO PAR-NAME.                             NC2464.2 300
   000799         080500     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   000800         080600     MOVE "QUALIFIED SUBSCRIPT" TO FEATURE.                       NC2464.2 296
   000801         080700     MOVE  "ONE DIMENSIONAL TABLE" TO RE-MARK.                    NC2464.2 305
   000802         080800     MOVE SPACE TO TEMP-VALUE.                                    NC2464.2 IMP 201
   000803         080900*                                                                 NC2464.2
   000804         081000*         THIS TEST CONTAINS UNQUALIFIED DATA NAMES WITH          NC2464.2
   000805         081100*    QUALIFIED SUBSCRIPTS IN MOVE STATEMENTS.  THE DATA NAMES     NC2464.2
   000806         081200*    REFER TO SINGLE DIMENSIONAL TABLE ITEMS.                     NC2464.2
   000807         081300*                                                                 NC2464.2
   000808         081400     MOVE "E" TO EXPECTED-VALUE.                                  NC2464.2 200
   000809         081500*                                                                 NC2464.2
   000810         081600 QUAL-TEST-04-01.                                                 NC2464.2
   000811         081700     MOVE UNQUAL-ITEM (SUB1 OF SUBSCRIPTS OF SUBSCRIPTS-PART1)    NC2464.2 260 275 274 273
   000812         081800                   TO TEMP-VALUE.                                 NC2464.2 201
   000813         081900     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000814         082000*                                                                 NC2464.2
   000815         082100 QUAL-TEST-04-02.                                                 NC2464.2
   000816         082200     MOVE UNQUAL-ITEM (SUB1 OF SUBSCRIPTS OF SUB-PART2-LEVEL4)    NC2464.2 260 287 286 285
   000817         082300                   TO TEMP-VALUE.                                 NC2464.2 201
   000818         082400     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000819         082500*                                                                 NC2464.2
   000820         082600 QUAL-TEST-04-03.                                                 NC2464.2
   000821         082700     MOVE UNQUAL-ITEM (SUB1 OF SUBSCRIPTS OF SUB-PART2-LEVEL4     NC2464.2 260 287 286 285
   000822         082800             OF SUB-PART2-LEVEL3 IN SUB-PART2-LEVEL2              NC2464.2 284 283
   000823         082900             IN SUBSCRIPTS-PART2)                                 NC2464.2 282
   000824         083000                   TO TEMP-VALUE.                                 NC2464.2 201
   000825         083100     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000826         083200*                                                                 NC2464.2
   000827         083300 QUAL-TEST-04-04.                                                 NC2464.2
   000828         083400     MOVE "C" TO EXPECTED-VALUE.                                  NC2464.2 200
   000829         083500     MOVE UNQUAL-ITEM (SUB1 OF SOME-MORE-SUBSCRIPTS OF            NC2464.2 260 279 278
   000830         083600             SUBSCRIPTS-PART1)                                    NC2464.2 273
   000831         083700                   TO TEMP-VALUE.                                 NC2464.2 201
   000832         083800     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000833         083900*                                                                 NC2464.2
   000834         084000 QUAL-TEST-04-05.                                                 NC2464.2
   000835         084100     MOVE "G" TO EXPECTED-VALUE.                                  NC2464.2 200
   000836         084200     MOVE UNQUAL-ITEM (SUB2 OF SOME-MORE-SUBSCRIPTS OF            NC2464.2 260 292 290
   000837         084300             SUB-PART2-LEVEL2)                                    NC2464.2 283
   000838         084400                   TO TEMP-VALUE.                                 NC2464.2 201
   000839         084500     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000840         084600     GO TO QUAL-INIT-05.                                          NC2464.2 846
   000841         084700*                                                                 NC2464.2
   000842         084800 QUAL-DELETE-004.                                                 NC2464.2
   000843         084900     PERFORM DE-LETE.                                             NC2464.2 452
   000844         085000     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   000845         085100*                                                                 NC2464.2
   000846         085200 QUAL-INIT-05.                                                    NC2464.2
   000847         085300     MOVE "QUAL-TEST-05" TO PAR-NAME.                             NC2464.2 300
   000848         085400     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   000849         085500     MOVE "THREE DIMENSIONAL TABLE" TO RE-MARK.                   NC2464.2 305
   000850         085600*                                                                 NC2464.2
   000851         085700*         THIS TEST CONTAINS UNQUALIFIED DATA NAMES WITH          NC2464.2
   000852         085800*    QUALIFIED SUBSCRIPTS IN MOVE STATEMENTS.  THE DATA NAMES     NC2464.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085900*    REFER TO THREE DIMENSIONAL TABLE ITEMS.                      NC2464.2
   000854         086000*                                                                 NC2464.2
   000855         086100     MOVE SPACE TO TEMP-VALUE.                                    NC2464.2 IMP 201
   000856         086200     MOVE "N" TO EXPECTED-VALUE.                                  NC2464.2 200
   000857         086300*                                                                 NC2464.2
   000858         086400 QUAL-TEST-05-01.                                                 NC2464.2
   000859         086500     MOVE TABLE5-ITEM-UNQUAL (FIRST-SUB FIRST-SUB                 NC2464.2 268 270 270
   000860         086600             SUB1 OF SOME-MORE-SUBSCRIPTS OF SUB-PART2-LEVEL2     NC2464.2 291 290 283
   000861         086700             IN SUBSCRIPTS-PART2)                                 NC2464.2 282
   000862         086800                  TO TEMP-VALUE.                                  NC2464.2 201
   000863         086900     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000864         087000*                                                                 NC2464.2
   000865         087100 QUAL-TEST-05-02.                                                 NC2464.2
   000866         087200     MOVE TABLE5-ITEM-UNQUAL (SUB3 OF SUBSCRIPTS OF               NC2464.2 268 277 274
   000867         087300             SUBSCRIPTS-PART1 SUB3 OF SUBSCRIPTS OF               NC2464.2 273 289 286
   000868         087400             SUB-PART2-LEVEL4 IN SUB-PART2-LEVEL3 IN              NC2464.2 285 284
   000869         087500             SUB-PART2-LEVEL2 IN SUBSCRIPTS-PART2                 NC2464.2 283 282
   000870         087600             SUB1 OF SOME-MORE-SUBSCRIPTS OF SUB-PART2-LEVEL2     NC2464.2 291 290 283
   000871         087700             IN SUBSCRIPTS-PART2)                                 NC2464.2 282
   000872         087800                  TO TEMP-VALUE.                                  NC2464.2 201
   000873         087900     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000874         088000     GO TO QUAL-INIT-06.                                          NC2464.2 880
   000875         088100*                                                                 NC2464.2
   000876         088200 QUAL-DELETE-005.                                                 NC2464.2
   000877         088300     PERFORM DE-LETE.                                             NC2464.2 452
   000878         088400     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   000879         088500*                                                                 NC2464.2
   000880         088600 QUAL-INIT-06.                                                    NC2464.2
   000881         088700     MOVE "QUAL-TEST-06" TO PAR-NAME.                             NC2464.2 300
   000882         088800     MOVE "ONE DIMENSIONAL TABLE" TO RE-MARK.                     NC2464.2 305
   000883         088900     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   000884         089000*                                                                 NC2464.2
   000885         089100*         THIS TEST CONTAINS QUALIFIED DATA NAMES WITH            NC2464.2
   000886         089200*    QUALIFIED SUBSCRIPTS IN IF STATEMENTS.  THE DATA NAMES       NC2464.2
   000887         089300*    REFER TO SINGLE DIMENSIONAL TABLE ITEMS.                     NC2464.2
   000888         089400*                                                                 NC2464.2
   000889         089500     MOVE "TRUE" TO EXPECTED-VALUE.                               NC2464.2 200
   000890         089600*                                                                 NC2464.2
   000891         089700 QUAL-TEST-06-01.                                                 NC2464.2
   000892         089800     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000893         089900     IF TABLE-ITEM OF TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 211 209 207
   000894         090000              OF TABLE-LEVEL-3 IN TABLE-LEVEL-2                   NC2464.2 205 203
   000895         090100              OF GROUP-1-TABLE (SUB3 IN SOME-MORE-SUBSCRIPTS      NC2464.2 202 293 290
   000896         090200              IN SUB-PART2-LEVEL2 IN SUBSCRIPTS-PART2)            NC2464.2 283 282
   000897         090300         IS EQUAL TO "O"                                          NC2464.2
   000898      1  090400                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   000899         090500     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000900         090600*                                                                 NC2464.2
   000901         090700 QUAL-TEST-06-02.                                                 NC2464.2
   000902         090800     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000903         090900     IF TABLE-ITEM OF TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 211 209 207
   000904         091000              OF TABLE-LEVEL-3 IN TABLE-LEVEL-2                   NC2464.2 205 203
   000905         091100              OF GROUP-1-TABLE (SUB2 OF SUBSCRIPTS OF             NC2464.2 202 288 286
   000906         091200              SUB-PART2-LEVEL4 IN SUB-PART2-LEVEL3 IN             NC2464.2 285 284
   000907         091300              SUB-PART2-LEVEL2 IN SUBSCRIPTS-PART2)               NC2464.2 283 282
   000908         091400         IS EQUAL TO TABLE-ITEM OF TABLE-LEVEL-5                  NC2464.2 228 226
   000909         091500              IN TABLE-LEVEL-4 OF TABLE-LEVEL-3 IN                NC2464.2 224 222
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091600              TABLE-LEVEL-2 OF GROUP-2-TABLE (SUB3 IN SUBSCRIPTS  NC2464.2 220 219 277 274
   000911         091700              OF SUBSCRIPTS-PART1)                                NC2464.2 273
   000912      1  091800                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   000913         091900     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000914         092000     GO TO QUAL-INIT-07.                                          NC2464.2 920
   000915         092100*                                                                 NC2464.2
   000916         092200 QUAL-DELETE-006.                                                 NC2464.2
   000917         092300     PERFORM DE-LETE.                                             NC2464.2 452
   000918         092400     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   000919         092500*                                                                 NC2464.2
   000920         092600 QUAL-INIT-07.                                                    NC2464.2
   000921         092700     MOVE "QUAL-TEST-07" TO PAR-NAME.                             NC2464.2 300
   000922         092800     MOVE "THREE DIMENSIONAL TABLE" TO RE-MARK.                   NC2464.2 305
   000923         092900     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   000924         093000*                                                                 NC2464.2
   000925         093100*         THIS TEST CONTAINS QUALIFIED DATA NAMES WITH            NC2464.2
   000926         093200*    QUALIFIED SUBSCRIPTS IN IF STATEMENTS.  THE DATA NAMES       NC2464.2
   000927         093300*    REFER TO THREE DIMENSIONAL TABLE ITEMS.                      NC2464.2
   000928         093400*                                                                 NC2464.2
   000929         093500     MOVE "TRUE" TO EXPECTED-VALUE.                               NC2464.2 200
   000930         093600*                                                                 NC2464.2
   000931         093700 QUAL-TEST-07-01.                                                 NC2464.2
   000932         093800     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000933         093900     IF TABLE-ITEM OF TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 246 243 240
   000934         094000              IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                   NC2464.2 239 237
   000935         094100              IN GROUP-3-TABLE (SUB3 IN SUBSCRIPTS IN             NC2464.2 236 277 274
   000936         094200              SUBSCRIPTS-PART1 SUB3 OF SUBSCRIPTS OF              NC2464.2 273 277 274
   000937         094300              SUBSCRIPTS-PART1 SUB1 OF SOME-MORE-SUBSCRIPTS OF    NC2464.2 273 279 278
   000938         094400              SUBSCRIPTS-PART1) IS EQUAL TO "C"                   NC2464.2 273
   000939      1  094500                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   000940         094600     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000941         094700*                                                                 NC2464.2
   000942         094800 QUAL-TEST-07-02.                                                 NC2464.2
   000943         094900     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000944         095000     IF TABLE-ITEM OF TABLE-LEVEL-5 IN TABLE-LEVEL-4              NC2464.2 246 243 240
   000945         095100              IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                   NC2464.2 239 237
   000946         095200              OF GROUP-3-TABLE (SUB3 IN SUBSCRIPTS IN             NC2464.2 236 289 286
   000947         095300              SUB-PART2-LEVEL4 OF SUB-PART2-LEVEL3 OF             NC2464.2 285 284
   000948         095400              SUB-PART2-LEVEL2 OF SUBSCRIPTS-PART2   SUB3 IN      NC2464.2 283 282 289
   000949         095500              SUBSCRIPTS IN SUB-PART2-LEVEL4 OF SUB-PART2-LEVEL3  NC2464.2 286 285 284
   000950         095600              IN SUB-PART2-LEVEL2 OF SUBSCRIPTS-PART2   SUB1 OF   NC2464.2 283 282 291
   000951         095700              SOME-MORE-SUBSCRIPTS OF SUB-PART2-LEVEL2            NC2464.2 290 283
   000952         095800              IN SUBSCRIPTS-PART2)                                NC2464.2 282
   000953         095900         IS EQUAL TO TABLE-ITEM OF TABLE-LEVEL-5 IN               NC2464.2 246 243
   000954         096000              TABLE-LEVEL-4 IN TABLE-LEVEL-3 OF TABLE-LEVEL-2     NC2464.2 240 239 237
   000955         096100              IN GROUP-3-TABLE (SUB3 OF SUBSCRIPTS IN             NC2464.2 236 277 274
   000956         096200              SUBSCRIPTS-PART1  SUB3 OF SUBSCRIPTS IN             NC2464.2 273 289 286
   000957         096300              SUB-PART2-LEVEL4 OF SUB-PART2-LEVEL3                NC2464.2 285 284
   000958         096400              OF SUB-PART2-LEVEL2 OF SUBSCRIPTS-PART2  SUB1       NC2464.2 283 282 279
   000959         096500              OF SOME-MORE-SUBSCRIPTS OF SUBSCRIPTS-PART1)        NC2464.2 278 273
   000960      1  096600                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   000961         096700     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000962         096800     GO TO QUAL-INIT-08.                                          NC2464.2 968
   000963         096900*                                                                 NC2464.2
   000964         097000 QUAL-DELETE-007.                                                 NC2464.2
   000965         097100     PERFORM DE-LETE.                                             NC2464.2 452
   000966         097200     PERFORM PRINT-DETAIL.                                        NC2464.2 454
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097300*                                                                 NC2464.2
   000968         097400 QUAL-INIT-08.                                                    NC2464.2
   000969         097500     MOVE "QUAL-TEST-08" TO PAR-NAME.                             NC2464.2 300
   000970         097600     MOVE "QUAL. CONDITION NAME" TO FEATURE.                      NC2464.2 296
   000971         097700     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   000972         097800     MOVE "ONE DIMENSIONAL TABLE" TO RE-MARK.                     NC2464.2 305
   000973         097900*                                                                 NC2464.2
   000974         098000*         THIS TEST CONTAINS QUALIFIED CONDITION NAMES IN IF      NC2464.2
   000975         098100*    STATEMENTS.  THE CONDITION NAMES REFER TO SINGLE DIMENSIONAL NC2464.2
   000976         098200*    CONDITIONAL VARIABLES.  THE SUBSCRIPTS IN THIS TEST ARE      NC2464.2
   000977         098300*    CONSTANTS, UNQUALIFIED DATA NAMES AND INDEXES.  BOTH DIRECT  NC2464.2
   000978         098400*    AND RELATIVE INDEXING ARE USED.                              NC2464.2
   000979         098500*                                                                 NC2464.2
   000980         098600     MOVE "TRUE" TO EXPECTED-VALUE.                               NC2464.2 200
   000981         098700*                                                                 NC2464.2
   000982         098800 QUAL-TEST-08-01.                                                 NC2464.2
   000983         098900     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000984         099000     IF EQUALS-M OF TABLE-LEVEL-5 OF TABLE-LEVEL-4                NC2464.2 216 209 207
   000985         099100              IN TABLE-LEVEL-3 OF TABLE-LEVEL-2                   NC2464.2 205 203
   000986         099200              OF GROUP-1-TABLE (13)                               NC2464.2 202
   000987      1  099300                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   000988         099400     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000989         099500*                                                                 NC2464.2
   000990         099600 QUAL-TEST-08-02.                                                 NC2464.2
   000991         099700     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   000992         099800     IF EQUALS-A OF TABLE-LEVEL-5 OF TABLE-LEVEL-4                NC2464.2 214 209 207
   000993         099900              IN TABLE-LEVEL-3 OF TABLE-LEVEL-2                   NC2464.2 205 203
   000994         100000              OF GROUP-1-TABLE (FIRST-SUB)                        NC2464.2 202 270
   000995      1  100100                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   000996         100200     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   000997         100300*                                                                 NC2464.2
   000998         100400 QUAL-TEST-08-03.                                                 NC2464.2
   000999         100500     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001000         100600     SET IN1 TO 3.                                                NC2464.2 213
   001001         100700     IF EQUALS-C OF TABLE-LEVEL-5 OF TABLE-LEVEL-4                NC2464.2 215 209 207
   001002         100800              IN TABLE-LEVEL-3 OF TABLE-LEVEL-2                   NC2464.2 205 203
   001003         100900              OF GROUP-1-TABLE (IN1)                              NC2464.2 202 213
   001004      1  101000                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   001005         101100     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001006         101200*                                                                 NC2464.2
   001007         101300 QUAL-TEST-08-04.                                                 NC2464.2
   001008         101400     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001009         101500     SET IN1 TO 6.                                                NC2464.2 213
   001010         101600     IF EQUALS-A OF TABLE-LEVEL-5 OF TABLE-LEVEL-4                NC2464.2 214 209 207
   001011         101700              IN TABLE-LEVEL-3 OF TABLE-LEVEL-2                   NC2464.2 205 203
   001012         101800              OF GROUP-1-TABLE (IN1 - 5)                          NC2464.2 202 213
   001013      1  101900                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   001014         102000     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001015         102100*                                                                 NC2464.2
   001016         102200 QUAL-TEST-08-05.                                                 NC2464.2
   001017         102300     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001018         102400     SET IN1 TO 1.                                                NC2464.2 213
   001019         102500     IF EQUALS-C OF TABLE-LEVEL-5 OF TABLE-LEVEL-4                NC2464.2 215 209 207
   001020         102600              IN TABLE-LEVEL-3 OF TABLE-LEVEL-2                   NC2464.2 205 203
   001021         102700              OF GROUP-1-TABLE (IN1 + 2)                          NC2464.2 202 213
   001022      1  102800                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   001023         102900     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         103000     GO TO QUAL-INIT-09.                                          NC2464.2 1030
   001025         103100*                                                                 NC2464.2
   001026         103200 QUAL-DELETE-008.                                                 NC2464.2
   001027         103300     PERFORM DE-LETE.                                             NC2464.2 452
   001028         103400     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   001029         103500*                                                                 NC2464.2
   001030         103600 QUAL-INIT-09.                                                    NC2464.2
   001031         103700     MOVE "QUAL-TEST-09" TO PAR-NAME.                             NC2464.2 300
   001032         103800     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   001033         103900     MOVE "THREE DIMENSIONAL TABLE" TO RE-MARK.                   NC2464.2 305
   001034         104000*                                                                 NC2464.2
   001035         104100*         THIS TEST CONTAINS QUALIFIED CONDITION NAMES IN IF      NC2464.2
   001036         104200*    STATEMENTS.  THE CONDITION NAMES REFER TO THREE DIMENSIONAL  NC2464.2
   001037         104300*    CONDITIONAL VARIABLES.  THE SUBSCRIPTS IN THIS TEST ARE      NC2464.2
   001038         104400*    CONSTANTS, UNQUALIFIED DATA NAMES AND INDEXES.  BOTH DIRECT  NC2464.2
   001039         104500*    AND RELATIVE INDEXING ARE USED.                              NC2464.2
   001040         104600*                                                                 NC2464.2
   001041         104700     MOVE "TRUE" TO EXPECTED-VALUE.                               NC2464.2 200
   001042         104800*                                                                 NC2464.2
   001043         104900 QUAL-TEST-09-01.                                                 NC2464.2
   001044         105000     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001045         105100     IF EQUALS-M OF TABLE-LEVEL-5 IN TABLE-LEVEL-4                NC2464.2 251 243 240
   001046         105200              IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                   NC2464.2 239 237
   001047         105300              OF GROUP-3-TABLE (2, 2, 1)                          NC2464.2 236
   001048      1  105400                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   001049         105500     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001050         105600*                                                                 NC2464.2
   001051         105700 QUAL-TEST-09-02.                                                 NC2464.2
   001052         105800     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001053         105900     IF EQUALS-A OF TABLE-LEVEL-5 IN TABLE-LEVEL-4                NC2464.2 249 243 240
   001054         106000              IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                   NC2464.2 239 237
   001055         106100              OF GROUP-3-TABLE (FIRST-SUB, FIRST-SUB, FIRST-SUB)  NC2464.2 236 270 270 270
   001056      1  106200                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   001057         106300     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001058         106400*                                                                 NC2464.2
   001059         106500 QUAL-TEST-09-03.                                                 NC2464.2
   001060         106600     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001061         106700     SET IN5 TO 3.                                                NC2464.2 248
   001062         106800     IF EQUALS-C OF TABLE-LEVEL-5 IN TABLE-LEVEL-4                NC2464.2 250 243 240
   001063         106900              IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                   NC2464.2 239 237
   001064         107000              OF GROUP-3-TABLE (1, 1, IN5)                        NC2464.2 236 248
   001065      1  107100                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   001066         107200     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001067         107300*                                                                 NC2464.2
   001068         107400 QUAL-TEST-09-04.                                                 NC2464.2
   001069         107500     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001070         107600     SET IN3, IN4 TO 1.                                           NC2464.2 242 245
   001071         107700     SET IN5 TO 3.                                                NC2464.2 248
   001072         107800     IF EQUALS-C OF TABLE-LEVEL-5 IN TABLE-LEVEL-4                NC2464.2 250 243 240
   001073         107900              IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                   NC2464.2 239 237
   001074         108000              OF GROUP-3-TABLE (IN3, IN4, IN5)                    NC2464.2 236 242 245 248
   001075      1  108100                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   001076         108200     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001077         108300*                                                                 NC2464.2
   001078         108400 QUAL-TEST-09-05.                                                 NC2464.2
   001079         108500     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001080         108600     SET IN5 TO 1.                                                NC2464.2 248
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108700     SET IN3, IN4 TO 2.                                           NC2464.2 242 245
   001082         108800     IF EQUALS-C OF TABLE-LEVEL-5 IN TABLE-LEVEL-4                NC2464.2 250 243 240
   001083         108900              IN TABLE-LEVEL-3 IN TABLE-LEVEL-2                   NC2464.2 239 237
   001084         109000              OF GROUP-3-TABLE (IN3 - 1, IN4 - 1, IN5 + 2)        NC2464.2 236 242 245 248
   001085      1  109100                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   001086         109200     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001087         109300     GO TO QUAL-INIT-10.                                          NC2464.2 1093
   001088         109400*                                                                 NC2464.2
   001089         109500 QUAL-DELETE-009.                                                 NC2464.2
   001090         109600     PERFORM DE-LETE.                                             NC2464.2 452
   001091         109700     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   001092         109800*                                                                 NC2464.2
   001093         109900 QUAL-INIT-10.                                                    NC2464.2
   001094         110000     MOVE "QUAL-TEST-10" TO PAR-NAME.                             NC2464.2 300
   001095         110100     MOVE "QUALIFIED SUBSCRIPTS" TO RE-MARK.                      NC2464.2 305
   001096         110200     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   001097         110300*                                                                 NC2464.2
   001098         110400*         THIS TEST CONTAINS QUALIFIED CONDITION NAMES WITH       NC2464.2
   001099         110500*    QUALIFIED SUBSCRIPTS.                                        NC2464.2
   001100         110600*                                                                 NC2464.2
   001101         110700     MOVE "TRUE" TO EXPECTED-VALUE.                               NC2464.2 200
   001102         110800*                                                                 NC2464.2
   001103         110900 QUAL-TEST-10-01.                                                 NC2464.2
   001104         111000     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001105         111100     IF EQUALS-C OF TABLE-LEVEL-5 IN TABLE-LEVEL-4                NC2464.2 215 209 207
   001106         111200              IN TABLE-LEVEL-3 OF TABLE-LEVEL-2                   NC2464.2 205 203
   001107         111300              IN GROUP-1-TABLE (SUB1 OF SOME-MORE-SUBSCRIPTS      NC2464.2 202 279 278
   001108         111400              IN SUBSCRIPTS-PART1)                                NC2464.2 273
   001109      1  111500                    MOVE "TRUE" TO TEMP-VALUE.                    NC2464.2 201
   001110         111600     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001111         111700*                                                                 NC2464.2
   001112         111800 QUAL-TEST-10-02.                                                 NC2464.2
   001113         111900     IF NOT EQUALS-M OF TABLE-LEVEL-5 IN TABLE-LEVEL-4            NC2464.2 233 226 224
   001114         112000              IN TABLE-LEVEL-3 OF TABLE-LEVEL-2                   NC2464.2 222 220
   001115         112100              IN GROUP-2-TABLE (SUB2 OF SUBSCRIPTS                NC2464.2 219 288 286
   001116         112200              OF SUB-PART2-LEVEL4 OF SUB-PART2-LEVEL3             NC2464.2 285 284
   001117         112300              OF SUB-PART2-LEVEL2 OF SUBSCRIPTS-PART2)            NC2464.2 283 282
   001118      1  112400                    MOVE "TRUE" TO TEMP-VALUE.                    NC2464.2 201
   001119         112500     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001120         112600*                                                                 NC2464.2
   001121         112700 QUAL-TEST-10-03.                                                 NC2464.2
   001122         112800     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001123         112900     IF EQUALS-C OF TABLE-LEVEL-5 IN TABLE-LEVEL-4                NC2464.2 250 243 240
   001124         113000              IN TABLE-LEVEL-3 OF TABLE-LEVEL-2                   NC2464.2 239 237
   001125         113100              IN GROUP-3-TABLE (SUB3 OF SUBSCRIPTS OF             NC2464.2 236 289 286
   001126         113200              SUB-PART2-LEVEL4 IN SUB-PART2-LEVEL3 IN             NC2464.2 285 284
   001127         113300              SUB-PART2-LEVEL2 IN SUBSCRIPTS-PART2,               NC2464.2 283 282
   001128         113400              SUB3 IN SUBSCRIPTS IN SUBSCRIPTS-PART1,             NC2464.2 277 274 273
   001129         113500              SUB1 IN SOME-MORE-SUBSCRIPTS IN SUB-PART2-LEVEL2    NC2464.2 291 290 283
   001130         113600              IN SUBSCRIPTS-PART2)                                NC2464.2 282
   001131      1  113700                    MOVE "TRUE" TO TEMP-VALUE.                    NC2464.2 201
   001132         113800     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001133         113900*                                                                 NC2464.2
   001134         114000 QUAL-TEST-10-04.                                                 NC2464.2
   001135         114100     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001136         114200     IF NOT EQUALS-A OF TABLE-LEVEL-5 IN TABLE-LEVEL-4            NC2464.2 249 243 240
   001137         114300              IN TABLE-LEVEL-3 OF TABLE-LEVEL-2                   NC2464.2 239 237
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114400              IN GROUP-3-TABLE (SUB3 OF SUBSCRIPTS OF             NC2464.2 236 289 286
   001139         114500              SUB-PART2-LEVEL4 IN SUB-PART2-LEVEL3 IN             NC2464.2 285 284
   001140         114600              SUB-PART2-LEVEL2 IN SUBSCRIPTS-PART2,               NC2464.2 283 282
   001141         114700              SUB3 IN SUBSCRIPTS OF SUB-PART2-LEVEL4 OF           NC2464.2 289 286 285
   001142         114800              SUB-PART2-LEVEL3 IN SUB-PART2-LEVEL2 IN             NC2464.2 284 283
   001143         114900              SUBSCRIPTS-PART2,  SUB1 OF SOME-MORE-SUBSCRIPTS     NC2464.2 282 291 290
   001144         115000              OF SUB-PART2-LEVEL2 IN SUBSCRIPTS-PART2)            NC2464.2 283 282
   001145      1  115100                    MOVE "TRUE" TO TEMP-VALUE.                    NC2464.2 201
   001146         115200     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001147         115300     GO TO QUAL-INIT-11.                                          NC2464.2 1153
   001148         115400*                                                                 NC2464.2
   001149         115500 QUAL-DELETE-010.                                                 NC2464.2
   001150         115600     PERFORM DE-LETE.                                             NC2464.2 452
   001151         115700     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   001152         115800*                                                                 NC2464.2
   001153         115900 QUAL-INIT-11.                                                    NC2464.2
   001154         116000     MOVE "QUAL-TEST-11" TO PAR-NAME.                             NC2464.2 300
   001155         116100     MOVE "QUALIFICATION" TO FEATURE.                             NC2464.2 296
   001156         116200     MOVE "INTERMEDIATE LEVELS SKIPPED" TO RE-MARK.               NC2464.2 305
   001157         116300     MOVE SPACE TO TEMP-VALUE.                                    NC2464.2 IMP 201
   001158         116400     MOVE ZERO TO REC-CT.                                         NC2464.2 IMP 347
   001159         116500*                                                                 NC2464.2
   001160         116600*         THIS TEST USES QUALIFIED DATA NAMES WITHOUT ALL OF THE  NC2464.2
   001161         116700*    INTERMEDIATE LEVELS SPECIFIED.  THERE ARE QUALIFIED TABLE    NC2464.2
   001162         116800*    ITEMS AND QUALIFIED SUBSCRIPTS INCLUDED IN THE TEST          NC2464.2
   001163         116900*    STATEMENTS.                                                  NC2464.2
   001164         117000*                                                                 NC2464.2
   001165         117100     MOVE "G" TO EXPECTED-VALUE.                                  NC2464.2 200
   001166         117200*                                                                 NC2464.2
   001167         117300 QUAL-TEST-11-01.                                                 NC2464.2
   001168         117400     MOVE TABLE-ITEM OF TABLE-LEVEL-5 OF GROUP-1-TABLE (7)        NC2464.2 211 209 202
   001169         117500              TO TEMP-VALUE.                                      NC2464.2 201
   001170         117600     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001171         117700*                                                                 NC2464.2
   001172         117800 QUAL-TEST-11-02.                                                 NC2464.2
   001173         117900     MOVE UNQUAL-ITEM (SUB2 OF SOME-MORE-SUBSCRIPTS OF            NC2464.2 260 292 290
   001174         118000              SUBSCRIPTS-PART2) TO TEMP-VALUE.                    NC2464.2 282 201
   001175         118100     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001176         118200*                                                                 NC2464.2
   001177         118300 QUAL-TEST-11-03.                                                 NC2464.2
   001178         118400     MOVE   TABLE-ITEM OF GROUP-1-TABLE (SUB2 OF                  NC2464.2 211 202 292
   001179         118500         SOME-MORE-SUBSCRIPTS OF SUB-PART2-LEVEL2) TO TEMP-VALUE. NC2464.2 290 283 201
   001180         118600     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001181         118700*                                                                 NC2464.2
   001182         118800 QUAL-TEST-11-04.                                                 NC2464.2
   001183         118900     MOVE "A" TO EXPECTED-VALUE.                                  NC2464.2 200
   001184         119000     MOVE TABLE-ITEM OF GROUP-3-TABLE (FIRST-SUB, SUB3 OF         NC2464.2 246 236 270 277
   001185         119100              SUBSCRIPTS OF SUBSCRIPTS-PART1,  SUB3 OF            NC2464.2 274 273 289
   001186         119200              SUB-PART2-LEVEL4) TO TEMP-VALUE.                    NC2464.2 285 201
   001187         119300     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001188         119400*                                                                 NC2464.2
   001189         119500 QUAL-TEST-11-05.                                                 NC2464.2
   001190         119600     MOVE "TRUE" TO EXPECTED-VALUE.                               NC2464.2 200
   001191         119700     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001192         119800     SET IN1 TO 3.                                                NC2464.2 213
   001193         119900     IF EQUALS-C OF TABLE-ITEM OF GROUP-1-TABLE (IN1)             NC2464.2 215 211 202 213
   001194      1  120000                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         120100     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001196         120200*                                                                 NC2464.2
   001197         120300 QUAL-TEST-11-06.                                                 NC2464.2
   001198         120400     MOVE "FALSE" TO TEMP-VALUE.                                  NC2464.2 201
   001199         120500     IF EQUALS-C OF TABLE-ITEM OF GROUP-3-TABLE                   NC2464.2 250 246 236
   001200         120600              (FIRST-SUB,  SUB3 OF SUB-PART2-LEVEL3, SUB1 OF      NC2464.2 270 289 284 291
   001201         120700              SOME-MORE-SUBSCRIPTS OF SUBSCRIPTS-PART2)           NC2464.2 290 282
   001202      1  120800                   MOVE "TRUE" TO TEMP-VALUE.                     NC2464.2 201
   001203         120900     PERFORM SECT-TH220-0003.                                     NC2464.2 1299
   001204         121000     GO TO   QUAL-INIT-12.                                        NC2464.2 1209
   001205         121100 QUAL-DELETE-011.                                                 NC2464.2
   001206         121200     PERFORM DE-LETE.                                             NC2464.2 452
   001207         121300     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   001208         121400*                                                                 NC2464.2
   001209         121500 QUAL-INIT-12.                                                    NC2464.2
   001210         121600     MOVE   "IV-21 4.3.8.2.3 SR5 AND VI-2 1.3.2/4"                NC2464.2
   001211         121700          TO ANSI-REFERENCE.                                      NC2464.2 356
   001212         121800     MOVE   "QUAL-TEST-12" TO PAR-NAME.                           NC2464.2 300
   001213         121900     MOVE   "SEVEN DIMENSIONAL TABLE" TO RE-MARK.                 NC2464.2 305
   001214         122000     MOVE    ZEROES TO TABLE-A                                    NC2464.2 IMP 55
   001215         122100                       TABLE-B.                                   NC2464.2 65
   001216         122200     MOVE    27 TO ELEM1 OF L8 IN L7 IN L6 IN L5 IN L4 IN L3      NC2464.2 63 62 61 60 59 58 57
   001217         122300                         IN L2 OF TABLE-A (1, 2, 1, 2, 1, 1, 2).  NC2464.2 56 55
   001218         122400     GO TO   QUAL-TEST-12.                                        NC2464.2 1223
   001219         122500 QUAL-DELETE-12.                                                  NC2464.2
   001220         122600     PERFORM DE-LETE.                                             NC2464.2 452
   001221         122700     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   001222         122800     GO TO   CCVS-EXIT.                                           NC2464.2 1312
   001223         122900 QUAL-TEST-12.                                                    NC2464.2
   001224         123000     IF      ELEM1 OF L8 IN L7 OF L6 OF L5 IN L4 IN L3 OF L2      NC2464.2 63 62 61 60 59 58 57 56
   001225         123100                   IN TABLE-A                                     NC2464.2 55
   001226         123200            (SUB1 OF S48 IN S47 OF S46 IN S45 OF S44 IN S43       NC2464.2 123 122 121 120 119 118 117
   001227         123300                  OF S42 IN S41 OF S40 IN S39 OF S38 IN S37       NC2464.2 116 115 114 113 112 111
   001228         123400                  OF S36 IN S35 OF S34 IN S33 OF S32 IN S31       NC2464.2 110 109 108 107 106 105
   001229         123500                  OF S30 IN S29 OF S28 IN S27 OF S26 IN S25       NC2464.2 104 103 102 101 100 99
   001230         123600                  OF S24 IN S23 OF S22 IN S21 OF S20 IN S19       NC2464.2 98 97 96 95 94 93
   001231         123700                  OF S18 IN S17 OF S16 IN S15 OF S14 IN S13       NC2464.2 92 91 90 89 88 87
   001232         123800                  OF S12 IN S11 OF S10 IN SO9 OF SO8 IN SO7       NC2464.2 86 85 84 83 82 81
   001233         123900                  OF SO6 IN SO5 OF SO4 IN SO3 OF SO2              NC2464.2 80 79 78 77 76
   001234         124000                  IN SUBSCRIPTS-GROUP-1,                          NC2464.2 75
   001235         124100             SUB2 OF S48 IN S47 OF S46 IN S45 OF S44 IN S43       NC2464.2 187 184 183 182 181 180 179
   001236         124200                  OF S42 IN S41 OF S40 IN S39 OF S38 IN S37       NC2464.2 178 177 176 175 174 173
   001237         124300                  OF S36 IN S35 OF S34 IN S33 OF S32 IN S31       NC2464.2 172 171 170 169 168 167
   001238         124400                  OF S30 IN S29 OF S28 IN S27 OF S26 IN S25       NC2464.2 166 165 164 163 162 161
   001239         124500                  OF S24 IN S23 OF S22 IN S21 OF S20 IN S19       NC2464.2 160 159 158 157 156 155
   001240         124600                  OF S18 IN S17 OF S16 IN S15 OF S14 IN S13       NC2464.2 154 153 152 151 150 149
   001241         124700                  OF S12 IN S11 OF S10 IN SO9 OF SO8 IN SO7       NC2464.2 148 147 146 145 144 143
   001242         124800                  OF SO6 IN SO5 OF SO4 IN SO3 OF SO2              NC2464.2 142 141 140 139 138
   001243         124900                  OF SUBSCRIPTS-GROUP-2,                          NC2464.2 137
   001244         125000             SUB3 OF S48 IN S47 OF S46 IN S45 OF S44 IN S43       NC2464.2 127 122 121 120 119 118 117
   001245         125100                  OF S42 IN S41 OF S40 IN S39 OF S38 IN S37       NC2464.2 116 115 114 113 112 111
   001246         125200                  OF S36 IN S35 OF S34 IN S33 OF S32 IN S31       NC2464.2 110 109 108 107 106 105
   001247         125300                  OF S30 IN S29 OF S28 IN S27 OF S26 IN S25       NC2464.2 104 103 102 101 100 99
   001248         125400                  OF S24 IN S23 OF S22 IN S21 OF S20 IN S19       NC2464.2 98 97 96 95 94 93
   001249         125500                  OF S18 IN S17 OF S16 IN S15 OF S14 IN S13       NC2464.2 92 91 90 89 88 87
   001250         125600                  OF S12 IN S11 OF S10 IN SO9 OF SO8 IN SO7       NC2464.2 86 85 84 83 82 81
   001251         125700                  OF SO6 IN SO5 OF SO4 IN SO3 OF SO2              NC2464.2 80 79 78 77 76
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125800                  IN SUBSCRIPTS-GROUP-1,                          NC2464.2 75
   001253         125900             SUB4 OF S48 IN S47 OF S46 IN S45 OF S44 IN S43       NC2464.2 191 184 183 182 181 180 179
   001254         126000                  OF S42 IN S41 OF S40 IN S39 OF S38 IN S37       NC2464.2 178 177 176 175 174 173
   001255         126100                  OF S36 IN S35 OF S34 IN S33 OF S32 IN S31       NC2464.2 172 171 170 169 168 167
   001256         126200                  OF S30 IN S29 OF S28 IN S27 OF S26 IN S25       NC2464.2 166 165 164 163 162 161
   001257         126300                  OF S24 IN S23 OF S22 IN S21 OF S20 IN S19       NC2464.2 160 159 158 157 156 155
   001258         126400                  OF S18 IN S17 OF S16 IN S15 OF S14 IN S13       NC2464.2 154 153 152 151 150 149
   001259         126500                  OF S12 IN S11 OF S10 IN SO9 OF SO8 IN SO7       NC2464.2 148 147 146 145 144 143
   001260         126600                  OF SO6 IN SO5 OF SO4 IN SO3 OF SO2              NC2464.2 142 141 140 139 138
   001261         126700                  OF SUBSCRIPTS-GROUP-2,                          NC2464.2 137
   001262         126800             SUB5 OF S48 IN S47 OF S46 IN S45 OF S44 IN S43       NC2464.2 131 122 121 120 119 118 117
   001263         126900                  OF S42 IN S41 OF S40 IN S39 OF S38 IN S37       NC2464.2 116 115 114 113 112 111
   001264         127000                  OF S36 IN S35 OF S34 IN S33 OF S32 IN S31       NC2464.2 110 109 108 107 106 105
   001265         127100                  OF S30 IN S29 OF S28 IN S27 OF S26 IN S25       NC2464.2 104 103 102 101 100 99
   001266         127200                  OF S24 IN S23 OF S22 IN S21 OF S20 IN S19       NC2464.2 98 97 96 95 94 93
   001267         127300                  OF S18 IN S17 OF S16 IN S15 OF S14 IN S13       NC2464.2 92 91 90 89 88 87
   001268         127400                  OF S12 IN S11 OF S10 IN SO9 OF SO8 IN SO7       NC2464.2 86 85 84 83 82 81
   001269         127500                  OF SO6 IN SO5 OF SO4 IN SO3 OF SO2              NC2464.2 80 79 78 77 76
   001270         127600                  IN SUBSCRIPTS-GROUP-1,                          NC2464.2 75
   001271         127700             SUB6 OF S48 IN S47 OF S46 IN S45 OF S44 IN S43       NC2464.2 133 122 121 120 119 118 117
   001272         127800                  OF S42 IN S41 OF S40 IN S39 OF S38 IN S37       NC2464.2 116 115 114 113 112 111
   001273         127900                  OF S36 IN S35 OF S34 IN S33 OF S32 IN S31       NC2464.2 110 109 108 107 106 105
   001274         128000                  OF S30 IN S29 OF S28 IN S27 OF S26 IN S25       NC2464.2 104 103 102 101 100 99
   001275         128100                  OF S24 IN S23 OF S22 IN S21 OF S20 IN S19       NC2464.2 98 97 96 95 94 93
   001276         128200                  OF S18 IN S17 OF S16 IN S15 OF S14 IN S13       NC2464.2 92 91 90 89 88 87
   001277         128300                  OF S12 IN S11 OF S10 IN SO9 OF SO8 IN SO7       NC2464.2 86 85 84 83 82 81
   001278         128400                  OF SO6 IN SO5 OF SO4 IN SO3 OF SO2              NC2464.2 80 79 78 77 76
   001279         128500                  IN SUBSCRIPTS-GROUP-1,                          NC2464.2 75
   001280         128600             SUB7 OF S48 IN S47 OF S46 IN S45 OF S44 IN S43       NC2464.2 197 184 183 182 181 180 179
   001281         128700                  OF S42 IN S41 OF S40 IN S39 OF S38 IN S37       NC2464.2 178 177 176 175 174 173
   001282         128800                  OF S36 IN S35 OF S34 IN S33 OF S32 IN S31       NC2464.2 172 171 170 169 168 167
   001283         128900                  OF S30 IN S29 OF S28 IN S27 OF S26 IN S25       NC2464.2 166 165 164 163 162 161
   001284         129000                  OF S24 IN S23 OF S22 IN S21 OF S20 IN S19       NC2464.2 160 159 158 157 156 155
   001285         129100                  OF S18 IN S17 OF S16 IN S15 OF S14 IN S13       NC2464.2 154 153 152 151 150 149
   001286         129200                  OF S12 IN S11 OF S10 IN SO9 OF SO8 IN SO7       NC2464.2 148 147 146 145 144 143
   001287         129300                  OF SO6 IN SO5 OF SO4 IN SO3 OF SO2              NC2464.2 142 141 140 139 138
   001288         129400                  OF SUBSCRIPTS-GROUP-2)                          NC2464.2 137
   001289         129500                  = 27                                            NC2464.2
   001290      1  129600                  PERFORM PASS                                    NC2464.2 450
   001291      1  129700                  PERFORM PRINT-DETAIL                            NC2464.2 454
   001292         129800     ELSE                                                         NC2464.2
   001293      1  129900             MOVE  "QUALIFICATION FAILED" TO RE-MARK              NC2464.2 305
   001294      1  130000             PERFORM FAIL                                         NC2464.2 451
   001295      1  130100             PERFORM PRINT-DETAIL.                                NC2464.2 454
   001296         130200*                                                                 NC2464.2
   001297         130300     GO TO CCVS-EXIT.                                             NC2464.2 1312
   001298         130400*                                                                 NC2464.2
   001299         130500 SECT-TH220-0003 SECTION.                                         NC2464.2
   001300         130600 SYNTAX-CHECK.                                                    NC2464.2
   001301         130700     ADD 1 TO REC-CT.                                             NC2464.2 347
   001302         130800     IF TEMP-VALUE IS EQUAL TO EXPECTED-VALUE                     NC2464.2 201 200
   001303      1  130900              PERFORM PASS                                        NC2464.2 450
   001304      1  131000              GO TO SYNTAX-CHECK-WRITE.                           NC2464.2 1309
   001305         131100 SYNTAX-FAIL.                                                     NC2464.2
   001306         131200     MOVE TEMP-VALUE TO COMPUTED-A.                               NC2464.2 201 311
   001307         131300     MOVE EXPECTED-VALUE TO CORRECT-A.                            NC2464.2 200 325
   001308         131400     PERFORM FAIL.                                                NC2464.2 451
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131500 SYNTAX-CHECK-WRITE.                                              NC2464.2
   001310         131600     PERFORM PRINT-DETAIL.                                        NC2464.2 454
   001311         131700     MOVE SPACE TO TEMP-VALUE.                                    NC2464.2 IMP 201
   001312         131800 CCVS-EXIT SECTION.                                               NC2464.2
   001313         131900 CCVS-999999.                                                     NC2464.2
   001314         132000     GO TO CLOSE-FILES.                                           NC2464.2 443
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    27
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      356   ANSI-REFERENCE . . . . . . . .  528 535 544 M1211
      335   CCVS-C-1 . . . . . . . . . . .  472 514
      340   CCVS-C-2 . . . . . . . . . . .  473 515
      390   CCVS-E-1 . . . . . . . . . . .  478
      395   CCVS-E-2 . . . . . . . . . . .  487 494 501 506
      398   CCVS-E-2-2 . . . . . . . . . .  M486
      403   CCVS-E-3 . . . . . . . . . . .  507
      412   CCVS-E-4 . . . . . . . . . . .  486
      413   CCVS-E-4-1 . . . . . . . . . .  M484
      415   CCVS-E-4-2 . . . . . . . . . .  M485
      357   CCVS-H-1 . . . . . . . . . . .  467
      362   CCVS-H-2A. . . . . . . . . . .  468
      371   CCVS-H-2B. . . . . . . . . . .  469
      383   CCVS-H-3 . . . . . . . . . . .  470
      433   CCVS-PGM-ID. . . . . . . . . .  439 439
      317   CM-18V0
      199   COMPARISON-VALUES
      311   COMPUTED-A . . . . . . . . . .  312 314 315 316 317 540 543 M574 M580 M586 M590 M595 M1306
      312   COMPUTED-N
      310   COMPUTED-X . . . . . . . . . .  M462 526
      314   COMPUTED-0V18
      316   COMPUTED-14V4
      318   COMPUTED-18V0
      315   COMPUTED-4V14
      334   COR-ANSI-REFERENCE . . . . . .  M535 M537
      325   CORRECT-A. . . . . . . . . . .  326 327 328 329 330 541 543 M575 M579 M584 M589 M594 M1307
      326   CORRECT-N
      324   CORRECT-X. . . . . . . . . . .  M463 527
      327   CORRECT-0V18
      329   CORRECT-14V4
      331   CORRECT-18V0
      328   CORRECT-4V14
      330   CR-18V0
      348   DELETE-COUNTER . . . . . . . .  M452 481 497 499
      303   DOTVALUE . . . . . . . . . . .  M457
      354   DUMMY-HOLD . . . . . . . . . .  M511 517
       53   DUMMY-RECORD . . . . . . . . .  M467 M468 M469 M470 M472 M473 M474 M476 M478 M487 M494 M501 M506 M507 511 M512
                                            513 M514 M515 M516 M517 521 M522 M530 M545
       63   ELEM1. . . . . . . . . . . . .  M1216 1224
       73   ELEM1
       64   ELEM2
       74   ELEM2
      401   ENDER-DESC . . . . . . . . . .  M489 M500 M505
      214   EQUALS-A . . . . . . . . . . .  992 1010
      231   EQUALS-A
      249   EQUALS-A . . . . . . . . . . .  1053 1136
      215   EQUALS-C . . . . . . . . . . .  1001 1019 1105 1193
      232   EQUALS-C
      250   EQUALS-C . . . . . . . . . . .  1062 1072 1082 1123 1199
      216   EQUALS-M . . . . . . . . . . .  984
      233   EQUALS-M . . . . . . . . . . .  1113
      251   EQUALS-M . . . . . . . . . . .  1045
      349   ERROR-COUNTER. . . . . . . . .  M451 480 490 493
      353   ERROR-HOLD . . . . . . . . . .  M480 M481 M481 M482 485
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    28
0 Defined   Cross-reference of data names   References

0     399   ERROR-TOTAL. . . . . . . . . .  M491 M493 M498 M499 M503 M504
      200   EXPECTED-VALUE . . . . . . . .  M605 M640 M668 M746 M808 M828 M835 M856 M889 M929 M980 M1041 M1101 M1165 M1183
                                            M1190 1302 1307
      296   FEATURE. . . . . . . . . . . .  M554 M603 M800 M970 M1155
      270   FIRST-SUB. . . . . . . . . . .  622 691 694 764 764 859 859 994 1055 1055 1055 1184 1200
      271   FOURTH-SUB . . . . . . . . . .  764
      217   GROUP-1-ENTRY. . . . . . . . .  M566
      202   GROUP-1-TABLE. . . . . . . . .  573 616 622 629 643 650 680 691 704 716 729 895 905 986 994 1003 1012 1021 1107
                                            1168 1178 1193
      234   GROUP-2-ENTRY. . . . . . . . .  M567
      219   GROUP-2-TABLE. . . . . . . . .  578 635 657 683 694 707 719 732 910 1115
      252   GROUP-3-ENTRY. . . . . . . . .  M568
      236   GROUP-3-TABLE. . . . . . . . .  583 758 764 772 780 788 935 946 955 1047 1055 1064 1074 1084 1125 1138 1184 1199
      254   GROUP-4-TABLE. . . . . . . . .  588
      262   GROUP-5-TABLE. . . . . . . . .  593
      427   HYPHEN-LINE. . . . . . . . . .  474 476 516
      393   ID-AGAIN . . . . . . . . . . .  M439
      426   INF-ANSI-REFERENCE . . . . . .  M528 M531 M544 M546
      421   INFO-TEXT. . . . . . . . . . .  M529
      350   INSPECT-COUNTER. . . . . . . .  M449 480 502 504
      213   IN1. . . . . . . . . . . . . .  M626 629 M639 643 M647 650 M699 704 M712 716 M724 729 M1000 1003 M1009 1012 M1018
                                            1021 M1192 1193
      230   IN2. . . . . . . . . . . . . .  M700 707 M712 719
      242   IN3. . . . . . . . . . . . . .  M776 780 M784 788 M1070 1074 M1081 1084
      245   IN4. . . . . . . . . . . . . .  M776 780 M784 788 M1070 1074 M1081 1084
      248   IN5. . . . . . . . . . . . . .  M769 772 M777 780 M785 788 M1061 1064 M1071 1074 M1080 1084
       56   L2 . . . . . . . . . . . . . .  1217 1224
       66   L2
       57   L3 . . . . . . . . . . . . . .  1216 1224
       67   L3
       58   L4 . . . . . . . . . . . . . .  1216 1224
       68   L4
       59   L5 . . . . . . . . . . . . . .  1216 1224
       69   L5
       60   L6 . . . . . . . . . . . . . .  1216 1224
       70   L6
       61   L7 . . . . . . . . . . . . . .  1216 1224
       71   L7
       62   L8 . . . . . . . . . . . . . .  1216 1224
       72   L8
      298   P-OR-F . . . . . . . . . . . .  M449 M450 M451 M452 459 M462
      300   PAR-NAME . . . . . . . . . . .  M464 M553 M602 M667 M743 M798 M847 M881 M921 M969 M1031 M1094 M1154 M1212
      302   PARDOT-X . . . . . . . . . . .  M456
      351   PASS-COUNTER . . . . . . . . .  M450 482 484
       51   PRINT-FILE . . . . . . . . . .  47 438 444
       52   PRINT-REC. . . . . . . . . . .  M458 M534 M536
      305   RE-MARK. . . . . . . . . . . .  M453 M465 M573 M578 M583 M588 M593 M604 M744 M801 M849 M882 M922 M972 M1033 M1095
                                            M1156 M1213 M1293
      347   REC-CT . . . . . . . . . . . .  455 457 464 M576 M581 M585 M591 M596 M600 M666 M742 M799 M848 M883 M923 M971
                                            M1032 M1096 M1158 M1301
      346   REC-SKL-SUB
      355   RECORD-COUNT . . . . . . . . .  M509 510 M518
      278   SOME-MORE-SUBSCRIPTS . . . . .  829 937 959 1107
      290   SOME-MORE-SUBSCRIPTS . . . . .  836 860 870 895 951 1129 1143 1173 1179 1201
       76   SO2. . . . . . . . . . . . . .  1233 1251 1269 1278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    29
0 Defined   Cross-reference of data names   References

0     138   SO2. . . . . . . . . . . . . .  1242 1260 1287
       77   SO3. . . . . . . . . . . . . .  1233 1251 1269 1278
      139   SO3. . . . . . . . . . . . . .  1242 1260 1287
       78   SO4. . . . . . . . . . . . . .  1233 1251 1269 1278
      140   SO4. . . . . . . . . . . . . .  1242 1260 1287
       79   SO5. . . . . . . . . . . . . .  1233 1251 1269 1278
      141   SO5. . . . . . . . . . . . . .  1242 1260 1287
       80   SO6. . . . . . . . . . . . . .  1233 1251 1269 1278
      142   SO6. . . . . . . . . . . . . .  1242 1260 1287
       81   SO7. . . . . . . . . . . . . .  1232 1250 1268 1277
      143   SO7. . . . . . . . . . . . . .  1241 1259 1286
       82   SO8. . . . . . . . . . . . . .  1232 1250 1268 1277
      144   SO8. . . . . . . . . . . . . .  1241 1259 1286
       83   SO9. . . . . . . . . . . . . .  1232 1250 1268 1277
      145   SO9. . . . . . . . . . . . . .  1241 1259 1286
      283   SUB-PART2-LEVEL2 . . . . . . .  822 837 860 869 870 896 907 948 950 951 958 1117 1127 1129 1140 1142 1144 1179
      284   SUB-PART2-LEVEL3 . . . . . . .  822 868 906 947 949 957 1116 1126 1139 1142 1200
      285   SUB-PART2-LEVEL4 . . . . . . .  816 821 868 906 947 949 957 1116 1126 1139 1141 1186
      274   SUBSCRIPTS . . . . . . . . . .  811 866 910 935 936 955 1128 1185
      286   SUBSCRIPTS . . . . . . . . . .  816 821 867 905 946 949 956 1115 1125 1138 1141
       75   SUBSCRIPTS-GROUP-1 . . . . . .  1234 1252 1270 1279
      137   SUBSCRIPTS-GROUP-2 . . . . . .  1243 1261 1288
      273   SUBSCRIPTS-PART1 . . . . . . .  811 830 867 911 936 937 938 956 959 1108 1128 1185
      282   SUBSCRIPTS-PART2 . . . . . . .  823 861 869 871 896 907 948 950 952 958 1117 1127 1130 1140 1143 1144 1174 1201
      123   SUB1 . . . . . . . . . . . . .  1226
      185   SUB1
      275   SUB1 . . . . . . . . . . . . .  811
      279   SUB1 . . . . . . . . . . . . .  829 937 958 1107
      287   SUB1 . . . . . . . . . . . . .  816 821
      291   SUB1 . . . . . . . . . . . . .  860 870 950 1129 1143 1200
      125   SUB2
      187   SUB2 . . . . . . . . . . . . .  1235
      276   SUB2
      280   SUB2
      288   SUB2 . . . . . . . . . . . . .  905 1115
      292   SUB2 . . . . . . . . . . . . .  836 1173 1178
      127   SUB3 . . . . . . . . . . . . .  1244
      189   SUB3
      277   SUB3 . . . . . . . . . . . . .  866 910 935 936 955 1128 1184
      281   SUB3
      289   SUB3 . . . . . . . . . . . . .  867 946 948 956 1125 1138 1141 1185 1200
      293   SUB3 . . . . . . . . . . . . .  895
      129   SUB4
      191   SUB4 . . . . . . . . . . . . .  1253
      131   SUB5 . . . . . . . . . . . . .  1262
      193   SUB5
      133   SUB6 . . . . . . . . . . . . .  1271
      195   SUB6
      135   SUB7
      197   SUB7 . . . . . . . . . . . . .  1280
       84   S10. . . . . . . . . . . . . .  1232 1250 1268 1277
      146   S10. . . . . . . . . . . . . .  1241 1259 1286
       85   S11. . . . . . . . . . . . . .  1232 1250 1268 1277
      147   S11. . . . . . . . . . . . . .  1241 1259 1286
       86   S12. . . . . . . . . . . . . .  1232 1250 1268 1277
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    30
0 Defined   Cross-reference of data names   References

0     148   S12. . . . . . . . . . . . . .  1241 1259 1286
       87   S13. . . . . . . . . . . . . .  1231 1249 1267 1276
      149   S13. . . . . . . . . . . . . .  1240 1258 1285
       88   S14. . . . . . . . . . . . . .  1231 1249 1267 1276
      150   S14. . . . . . . . . . . . . .  1240 1258 1285
       89   S15. . . . . . . . . . . . . .  1231 1249 1267 1276
      151   S15. . . . . . . . . . . . . .  1240 1258 1285
       90   S16. . . . . . . . . . . . . .  1231 1249 1267 1276
      152   S16. . . . . . . . . . . . . .  1240 1258 1285
       91   S17. . . . . . . . . . . . . .  1231 1249 1267 1276
      153   S17. . . . . . . . . . . . . .  1240 1258 1285
       92   S18. . . . . . . . . . . . . .  1231 1249 1267 1276
      154   S18. . . . . . . . . . . . . .  1240 1258 1285
       93   S19. . . . . . . . . . . . . .  1230 1248 1266 1275
      155   S19. . . . . . . . . . . . . .  1239 1257 1284
       94   S20. . . . . . . . . . . . . .  1230 1248 1266 1275
      156   S20. . . . . . . . . . . . . .  1239 1257 1284
       95   S21. . . . . . . . . . . . . .  1230 1248 1266 1275
      157   S21. . . . . . . . . . . . . .  1239 1257 1284
       96   S22. . . . . . . . . . . . . .  1230 1248 1266 1275
      158   S22. . . . . . . . . . . . . .  1239 1257 1284
       97   S23. . . . . . . . . . . . . .  1230 1248 1266 1275
      159   S23. . . . . . . . . . . . . .  1239 1257 1284
       98   S24. . . . . . . . . . . . . .  1230 1248 1266 1275
      160   S24. . . . . . . . . . . . . .  1239 1257 1284
       99   S25. . . . . . . . . . . . . .  1229 1247 1265 1274
      161   S25. . . . . . . . . . . . . .  1238 1256 1283
      100   S26. . . . . . . . . . . . . .  1229 1247 1265 1274
      162   S26. . . . . . . . . . . . . .  1238 1256 1283
      101   S27. . . . . . . . . . . . . .  1229 1247 1265 1274
      163   S27. . . . . . . . . . . . . .  1238 1256 1283
      102   S28. . . . . . . . . . . . . .  1229 1247 1265 1274
      164   S28. . . . . . . . . . . . . .  1238 1256 1283
      103   S29. . . . . . . . . . . . . .  1229 1247 1265 1274
      165   S29. . . . . . . . . . . . . .  1238 1256 1283
      104   S30. . . . . . . . . . . . . .  1229 1247 1265 1274
      166   S30. . . . . . . . . . . . . .  1238 1256 1283
      105   S31. . . . . . . . . . . . . .  1228 1246 1264 1273
      167   S31. . . . . . . . . . . . . .  1237 1255 1282
      106   S32. . . . . . . . . . . . . .  1228 1246 1264 1273
      168   S32. . . . . . . . . . . . . .  1237 1255 1282
      107   S33. . . . . . . . . . . . . .  1228 1246 1264 1273
      169   S33. . . . . . . . . . . . . .  1237 1255 1282
      108   S34. . . . . . . . . . . . . .  1228 1246 1264 1273
      170   S34. . . . . . . . . . . . . .  1237 1255 1282
      109   S35. . . . . . . . . . . . . .  1228 1246 1264 1273
      171   S35. . . . . . . . . . . . . .  1237 1255 1282
      110   S36. . . . . . . . . . . . . .  1228 1246 1264 1273
      172   S36. . . . . . . . . . . . . .  1237 1255 1282
      111   S37. . . . . . . . . . . . . .  1227 1245 1263 1272
      173   S37. . . . . . . . . . . . . .  1236 1254 1281
      112   S38. . . . . . . . . . . . . .  1227 1245 1263 1272
      174   S38. . . . . . . . . . . . . .  1236 1254 1281
      113   S39. . . . . . . . . . . . . .  1227 1245 1263 1272
      175   S39. . . . . . . . . . . . . .  1236 1254 1281
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    31
0 Defined   Cross-reference of data names   References

0     114   S40. . . . . . . . . . . . . .  1227 1245 1263 1272
      176   S40. . . . . . . . . . . . . .  1236 1254 1281
      115   S41. . . . . . . . . . . . . .  1227 1245 1263 1272
      177   S41. . . . . . . . . . . . . .  1236 1254 1281
      116   S42. . . . . . . . . . . . . .  1227 1245 1263 1272
      178   S42. . . . . . . . . . . . . .  1236 1254 1281
      117   S43. . . . . . . . . . . . . .  1226 1244 1262 1271
      179   S43. . . . . . . . . . . . . .  1235 1253 1280
      118   S44. . . . . . . . . . . . . .  1226 1244 1262 1271
      180   S44. . . . . . . . . . . . . .  1235 1253 1280
      119   S45. . . . . . . . . . . . . .  1226 1244 1262 1271
      181   S45. . . . . . . . . . . . . .  1235 1253 1280
      120   S46. . . . . . . . . . . . . .  1226 1244 1262 1271
      182   S46. . . . . . . . . . . . . .  1235 1253 1280
      121   S47. . . . . . . . . . . . . .  1226 1244 1262 1271
      183   S47. . . . . . . . . . . . . .  1235 1253 1280
      122   S48. . . . . . . . . . . . . .  1226 1244 1262 1271
      184   S48. . . . . . . . . . . . . .  1235 1253 1280
       55   TABLE-A. . . . . . . . . . . .  M1214 1217 1225
       65   TABLE-B. . . . . . . . . . . .  M1215
      211   TABLE-ITEM . . . . . . . . . .  614 620 627 641 648 678 689 702 714 727 893 903 1168 1178 1193
      228   TABLE-ITEM . . . . . . . . . .  633 655 681 692 705 717 730 908
      246   TABLE-ITEM . . . . . . . . . .  756 762 770 778 786 933 944 953 1184 1199
      203   TABLE-LEVEL-2. . . . . . . . .  615 621 628 642 649 679 690 703 715 728 894 904 985 993 1002 1011 1020 1106
      220   TABLE-LEVEL-2. . . . . . . . .  634 656 682 693 706 718 731 910 1114
      237   TABLE-LEVEL-2. . . . . . . . .  757 763 771 779 787 934 945 954 1046 1054 1063 1073 1083 1124 1137
      205   TABLE-LEVEL-3. . . . . . . . .  615 621 628 642 649 679 690 703 715 728 894 904 985 993 1002 1011 1020 1106
      222   TABLE-LEVEL-3. . . . . . . . .  634 656 682 693 706 718 731 909 1114
      239   TABLE-LEVEL-3. . . . . . . . .  252 757 763 771 779 787 934 945 954 1046 1054 1063 1073 1083 1124 1137
      207   TABLE-LEVEL-4. . . . . . . . .  614 620 627 641 648 678 689 702 714 727 893 903 984 992 1001 1010 1019 1105
      224   TABLE-LEVEL-4. . . . . . . . .  633 655 681 692 705 717 730 909 1113
      240   TABLE-LEVEL-4. . . . . . . . .  756 762 770 778 786 933 944 954 1045 1053 1062 1072 1082 1123 1136
      209   TABLE-LEVEL-5. . . . . . . . .  217 614 620 627 641 648 678 689 702 714 727 893 903 984 992 1001 1010 1019 1105
                                            1168
      226   TABLE-LEVEL-5. . . . . . . . .  234 633 655 681 692 705 717 730 908 1113
      243   TABLE-LEVEL-5. . . . . . . . .  756 762 770 778 786 933 944 953 1045 1053 1062 1072 1082 1123 1136
      268   TABLE5-ITEM-UNQUAL . . . . . .  859 866
      263   TABLE5-LEVEL-2
      265   TABLE5-LEVEL-3 . . . . . . . .  M570
      266   TABLE5-LEVEL-4
      267   TABLE5-LEVEL-5
      201   TEMP-VALUE . . . . . . . . . .  M601 M616 M622 M629 M635 M643 M650 M657 M677 M684 M688 M695 M701 M708 M713 M720
                                            M726 M733 M745 M758 M765 M772 M780 M789 M802 M812 M817 M824 M831 M838 M855 M862
                                            M872 M892 M898 M902 M912 M932 M939 M943 M960 M983 M987 M991 M995 M999 M1004 M1008
                                            M1013 M1017 M1022 M1044 M1048 M1052 M1056 M1060 M1065 M1069 M1075 M1079 M1085
                                            M1104 M1109 M1118 M1122 M1131 M1135 M1145 M1157 M1169 M1174 M1179 M1186 M1191
                                            M1194 M1198 M1202 1302 1306 M1311
      306   TEST-COMPUTED. . . . . . . . .  534
      321   TEST-CORRECT . . . . . . . . .  536
      374   TEST-ID. . . . . . . . . . . .  M439
      294   TEST-RESULTS . . . . . . . . .  M440 458
      352   TOTAL-ERROR
      260   UNQUAL-ITEM. . . . . . . . . .  811 816 821 829 836 1173
      272   UNQUAL-SUB . . . . . . . . . .  M654 657 M725 732
      255   UNQUAL-TABLE-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    32
0 Defined   Cross-reference of data names   References

0     256   UNQUAL-TABLE-3
      257   UNQUAL-TABLE-4
      259   UNQUAL-TABLE-5 . . . . . . . .  M569
      423   XXCOMPUTED . . . . . . . . . .  M543
      425   XXCORRECT. . . . . . . . . . .  M543
      418   XXINFO . . . . . . . . . . . .  530 545
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    33
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

      539   BAIL-OUT . . . . . . . . . . .  P461
      547   BAIL-OUT-EX. . . . . . . . . .  E461 G541
      542   BAIL-OUT-WRITE . . . . . . . .  G540
      523   BLANK-LINE-PRINT
     1312   CCVS-EXIT. . . . . . . . . . .  G1222 G1297
     1313   CCVS-999999
      436   CCVS1
      548   CCVS1-EXIT . . . . . . . . . .  G442
      443   CLOSE-FILES. . . . . . . . . .  G1314
      471   COLUMN-NAMES-ROUTINE . . . . .  E441
      452   DE-LETE. . . . . . . . . . . .  P662 P738 P794 P843 P877 P917 P965 P1027 P1090 P1150 P1206 P1220
      475   END-ROUTINE. . . . . . . . . .  P444
      479   END-ROUTINE-1
      488   END-ROUTINE-12
      496   END-ROUTINE-13 . . . . . . . .  E444
      477   END-RTN-EXIT
      451   FAIL . . . . . . . . . . . . .  P1294 P1308
      525   FAIL-ROUTINE . . . . . . . . .  P460
      538   FAIL-ROUTINE-EX. . . . . . . .  E460 G532
      533   FAIL-ROUTINE-WRITE . . . . . .  G526 G527
      466   HEAD-ROUTINE . . . . . . . . .  P441
      449   INSPT
      437   OPEN-FILES
      450   PASS . . . . . . . . . . . . .  P1290 P1303
      454   PRINT-DETAIL . . . . . . . . .  P577 P582 P587 P592 P597 P663 P739 P795 P844 P878 P918 P966 P1028 P1091 P1151
                                            P1207 P1221 P1291 P1295 P1310
      661   QUAL-DELETE-001
      737   QUAL-DELETE-002
      793   QUAL-DELETE-003
      842   QUAL-DELETE-004
      876   QUAL-DELETE-005
      916   QUAL-DELETE-006
      964   QUAL-DELETE-007
     1026   QUAL-DELETE-008
     1089   QUAL-DELETE-009
     1149   QUAL-DELETE-010
     1205   QUAL-DELETE-011
     1219   QUAL-DELETE-12
      741   QUAL-INIT-03 . . . . . . . . .  G735
      797   QUAL-INIT-04 . . . . . . . . .  G791
      846   QUAL-INIT-05 . . . . . . . . .  G840
      880   QUAL-INIT-06 . . . . . . . . .  G874
      920   QUAL-INIT-07 . . . . . . . . .  G914
      968   QUAL-INIT-08 . . . . . . . . .  G962
     1030   QUAL-INIT-09 . . . . . . . . .  G1024
     1093   QUAL-INIT-10 . . . . . . . . .  G1087
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    34
0 Defined   Cross-reference of procedures   References

0    1153   QUAL-INIT-11 . . . . . . . . .  G1147
     1209   QUAL-INIT-12 . . . . . . . . .  G1204
      599   QUAL-TEST-01
      613   QUAL-TEST-01-01
      619   QUAL-TEST-01-02
      625   QUAL-TEST-01-03
      632   QUAL-TEST-01-04
      638   QUAL-TEST-01-05
      646   QUAL-TEST-01-06
      653   QUAL-TEST-01-07
      665   QUAL-TEST-02 . . . . . . . . .  G659
      676   QUAL-TEST-02-01
      687   QUAL-TEST-02-02
      698   QUAL-TEST-02-03
      711   QUAL-TEST-02-04
      723   QUAL-TEST-02-05
      755   QUAL-TEST-03-01
      761   QUAL-TEST-03-02
      768   QUAL-TEST-03-03
      775   QUAL-TEST-03-04
      783   QUAL-TEST-03-05
      810   QUAL-TEST-04-01
      815   QUAL-TEST-04-02
      820   QUAL-TEST-04-03
      827   QUAL-TEST-04-04
      834   QUAL-TEST-04-05
      858   QUAL-TEST-05-01
      865   QUAL-TEST-05-02
      891   QUAL-TEST-06-01
      901   QUAL-TEST-06-02
      931   QUAL-TEST-07-01
      942   QUAL-TEST-07-02
      982   QUAL-TEST-08-01
      990   QUAL-TEST-08-02
      998   QUAL-TEST-08-03
     1007   QUAL-TEST-08-04
     1016   QUAL-TEST-08-05
     1043   QUAL-TEST-09-01
     1051   QUAL-TEST-09-02
     1059   QUAL-TEST-09-03
     1068   QUAL-TEST-09-04
     1078   QUAL-TEST-09-05
     1103   QUAL-TEST-10-01
     1112   QUAL-TEST-10-02
     1121   QUAL-TEST-10-03
     1134   QUAL-TEST-10-04
     1167   QUAL-TEST-11-01
     1172   QUAL-TEST-11-02
     1177   QUAL-TEST-11-03
     1182   QUAL-TEST-11-04
     1189   QUAL-TEST-11-05
     1197   QUAL-TEST-11-06
     1223   QUAL-TEST-12 . . . . . . . . .  G1218
      550   SECT-NC246A-001
     1299   SECT-TH220-0003. . . . . . . .  P617 P623 P630 P636 P644 P651 P658 P685 P696 P709 P721 P734 P759 P766 P773 P781
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    35
0 Defined   Cross-reference of procedures   References

0                                           P790 P813 P818 P825 P832 P839 P863 P873 P899 P913 P940 P961 P988 P996 P1005 P1014
                                            P1023 P1049 P1057 P1066 P1076 P1086 P1110 P1119 P1132 P1146 P1170 P1175 P1180
                                            P1187 P1195 P1203
     1300   SYNTAX-CHECK
     1309   SYNTAX-CHECK-WRITE . . . . . .  G1304
     1305   SYNTAX-FAIL
      552   TABLE-INIT
      572   TABLE-PRINT
      447   TERMINATE-CALL
      445   TERMINATE-CCVS
      508   WRITE-LINE . . . . . . . . . .  P458 P459 P467 P468 P469 P470 P472 P473 P474 P476 P478 P487 P495 P501 P506 P507
                                            P530 P534 P536 P545
      520   WRT-LN . . . . . . . . . . . .  P514 P515 P516 P519 P524
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    36
0 Defined   Cross-reference of programs     References

        3   NC246A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC246A    Date 06/04/2022  Time 11:58:03   Page    37
0LineID  Message code  Message text

     51  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC246A:
 *    Source records = 1314
 *    Data Division statements = 262
 *    Procedure Division statements = 443
 *    Generated COBOL statements = 0
 *    Program complexity factor = 456
0End of compilation 1,  program NC246A,  highest severity 0.
0Return code 0
