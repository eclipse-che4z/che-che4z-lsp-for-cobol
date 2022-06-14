1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:31   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:31   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2064.2
   000002         000200 PROGRAM-ID.                                                      NC2064.2
   000003         000400*                                                              *  NC2064.2
   000004         000500*    VALIDATION FOR:-                                          *  NC2064.2
   000005         000600*                                                              *  NC2064.2
   000006         000700*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2064.2
   000007         000800*                                                              *  NC2064.2
   000008         000900*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2064.2
   000009         001000*                                                              *  NC2064.2
   000010         001200*                                                              *  NC2064.2
   000011         001300*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2064.2
   000012         001400*                                                              *  NC2064.2
   000013         001500*        X-55  - SYSTEM PRINTER NAME.                          *  NC2064.2
   000014         001600*        X-82  - SOURCE COMPUTER NAME.                         *  NC2064.2
   000015         001700*        X-83  - OBJECT COMPUTER NAME.                         *  NC2064.2
   000016         001800*                                                              *  NC2064.2
   000017         002000     NC206A.                                                      NC2064.2
   000018         002100*                                                              *  NC2064.2
   000019         002200*    PROGRAM NC206A TESTS THE ACCESSING OF ELEMENTARY ITEMS    *  NC2064.2
   000020         002300*    USING FORMAT 1 QUALIFICATION WITH UP TO 5 LEVELS OF       *  NC2064.2
   000021         002400*    QUALIFIERS.  SINGLE DIMENSION TABLES ARE ALSO ACCESSES    *  NC2064.2
   000022         002500*    USING SUBSCRIPTS QUALIFIED TO ONE LEVEL.                  *  NC2064.2
   000023         002600*                                                              *  NC2064.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2064.2
   000025         002900 CONFIGURATION SECTION.                                           NC2064.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2064.2
   000027         003100     XXXXX082.                                                    NC2064.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2064.2
   000029         003300     XXXXX083.                                                    NC2064.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2064.2
   000031         003500 FILE-CONTROL.                                                    NC2064.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2064.2 36
   000033         003700     XXXXX055.                                                    NC2064.2
   000034         003800 DATA DIVISION.                                                   NC2064.2
   000035         003900 FILE SECTION.                                                    NC2064.2
   000036         004000 FD  PRINT-FILE.                                                  NC2064.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2064.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2064.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2064.2
   000040         004400 77  MAX-NAME-1        PICTURE S9(18) VALUE +1.                   NC2064.2
   000041         004500 01  TABLE-LEVEL-5A.                                              NC2064.2
   000042         004600     02  TABLE-LEVEL-4A.                                          NC2064.2
   000043         004700         03  TABLE-LEVEL-3A.                                      NC2064.2
   000044         004800             04  TABLE-LEVEL-2A.                                  NC2064.2
   000045         004900                 05  TABLE-LEVEL-1A.                              NC2064.2
   000046         005000                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4A3A2A1A0A".NC2064.2
   000047         005100                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4A3A2A1A0B".NC2064.2
   000048         005200                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4A3A2A1A0C".NC2064.2
   000049         005300                   06 TBL-LEVEL-0D PIC X(12) VALUE "5A4A3A2A1A0D".NC2064.2
   000050         005400                 05  TABLE-LEVEL-1B.                              NC2064.2
   000051         005500                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4A3A2A1B0A".NC2064.2
   000052         005600                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4A3A2A1B0B".NC2064.2
   000053         005700                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4A3A2A1B0C".NC2064.2
   000054         005800             04  TABLE-LEVEL-2B.                                  NC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900                 05  TABLE-LEVEL-1A.                              NC2064.2
   000056         006000                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4A3A2B1A0A".NC2064.2
   000057         006100                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4A3A2B1A0B".NC2064.2
   000058         006200                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4A3A2B1A0C".NC2064.2
   000059         006300                 05  TABLE-LEVEL-1B.                              NC2064.2
   000060         006400                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4A3A2B1B0A".NC2064.2
   000061         006500                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4A3A2B1B0B".NC2064.2
   000062         006600                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4A3A2B1B0C".NC2064.2
   000063         006700         03  TABLE-LEVEL-3B.                                      NC2064.2
   000064         006800             04  TABLE-LEVEL-2A.                                  NC2064.2
   000065         006900                 05  TABLE-LEVEL-1A.                              NC2064.2
   000066         007000                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4A3B2A1A0A".NC2064.2
   000067         007100                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4A3B2A1A0B".NC2064.2
   000068         007200                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4A3B2A1A0C".NC2064.2
   000069         007300                 05  TABLE-LEVEL-1B.                              NC2064.2
   000070         007400                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4A3B2A1B0A".NC2064.2
   000071         007500                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4A3B2A1B0B".NC2064.2
   000072         007600                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4A3B2A1B0C".NC2064.2
   000073         007700             04  TABLE-LEVEL-2B.                                  NC2064.2
   000074         007800                 05  TABLE-LEVEL-1A.                              NC2064.2
   000075         007900                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4A3B2B1A0A".NC2064.2
   000076         008000                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4A3B2B1A0B".NC2064.2
   000077         008100                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4A3B2B1A0C".NC2064.2
   000078         008200                 05  TABLE-LEVEL-1B.                              NC2064.2
   000079         008300                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4A3B2B1B0A".NC2064.2
   000080         008400                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4A3B2B1B0B".NC2064.2
   000081         008500                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4A3B2B1B0C".NC2064.2
   000082         008600     02  TABLE-LEVEL-4B.                                          NC2064.2
   000083         008700         03  TABLE-LEVEL-3A.                                      NC2064.2
   000084         008800             04  TABLE-LEVEL-2A.                                  NC2064.2
   000085         008900                 05  TABLE-LEVEL-1A.                              NC2064.2
   000086         009000                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4B3A2A1A0A".NC2064.2
   000087         009100                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4B3A2A1A0B".NC2064.2
   000088         009200                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4B3A2A1A0C".NC2064.2
   000089         009300                 05  TABLE-LEVEL-1B.                              NC2064.2
   000090         009400                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4B3A2A1B0A".NC2064.2
   000091         009500                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4B3A2A1B0B".NC2064.2
   000092         009600                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4B3A2A1B0C".NC2064.2
   000093         009700             04  TABLE-LEVEL-2B.                                  NC2064.2
   000094         009800                 05  TABLE-LEVEL-1A.                              NC2064.2
   000095         009900                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4B3A2B1A0A".NC2064.2
   000096         010000                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4B3A2B1A0B".NC2064.2
   000097         010100                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4B3A2B1A0C".NC2064.2
   000098         010200                 05  TABLE-LEVEL-1B.                              NC2064.2
   000099         010300                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4B3A2B1B0A".NC2064.2
   000100         010400                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4B3A2B1B0B".NC2064.2
   000101         010500                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4B3A2B1B0C".NC2064.2
   000102         010600         03  TABLE-LEVEL-3B.                                      NC2064.2
   000103         010700             04  TABLE-LEVEL-2A.                                  NC2064.2
   000104         010800                 05  TABLE-LEVEL-1A.                              NC2064.2
   000105         010900                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4B3B2A1A0A".NC2064.2
   000106         011000                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4B3B2A1A0B".NC2064.2
   000107         011100                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4B3B2A1A0C".NC2064.2
   000108         011200                 05  TABLE-LEVEL-1B.                              NC2064.2
   000109         011300                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4B3B2A1B0A".NC2064.2
   000110         011400                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4B3B2A1B0B".NC2064.2
   000111         011500                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4B3B2A1B0C".NC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600             04  TABLE-LEVEL-2B.                                  NC2064.2
   000113         011700                 05  TABLE-LEVEL-1A.                              NC2064.2
   000114         011800                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4B3B2B1A0A".NC2064.2
   000115         011900                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4B3B2B1A0B".NC2064.2
   000116         012000                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4B3B2B1A0C".NC2064.2
   000117         012100                 05  TABLE-LEVEL-1B.                              NC2064.2
   000118         012200                   06 TBL-LEVEL-0A PIC X(12) VALUE "5A4B3B2B1B0A".NC2064.2
   000119         012300                   06 TBL-LEVEL-0B PIC X(12) VALUE "5A4B3B2B1B0B".NC2064.2
   000120         012400                   06 TBL-LEVEL-0C PIC X(12) VALUE "5A4B3B2B1B0C".NC2064.2
   000121         012500 01  TABLE-LEVEL-5B.                                              NC2064.2
   000122         012600     02  TABLE-LEVEL-4A.                                          NC2064.2
   000123         012700         03  TABLE-LEVEL-3A.                                      NC2064.2
   000124         012800             04  TABLE-LEVEL-2A.                                  NC2064.2
   000125         012900             05  TABLE-LEVEL-1A.                                  NC2064.2
   000126         013000                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000127         013100                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000128         013200                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000129         013300             05  TABLE-LEVEL-1B.                                  NC2064.2
   000130         013400                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000131         013500                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000132         013600                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000133         013700             04  TABLE-LEVEL-2B.                                  NC2064.2
   000134         013800             05  TABLE-LEVEL-1A.                                  NC2064.2
   000135         013900                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000136         014000                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000137         014100                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000138         014200             05  TABLE-LEVEL-1B.                                  NC2064.2
   000139         014300                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000140         014400                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000141         014500                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000142         014600         03  TABLE-LEVEL-3B.                                      NC2064.2
   000143         014700             04  TABLE-LEVEL-2A.                                  NC2064.2
   000144         014800             05  TABLE-LEVEL-1A.                                  NC2064.2
   000145         014900                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000146         015000                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000147         015100                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000148         015200             05  TABLE-LEVEL-1B.                                  NC2064.2
   000149         015300                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000150         015400                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000151         015500                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000152         015600             04  TABLE-LEVEL-2B.                                  NC2064.2
   000153         015700             05  TABLE-LEVEL-1A.                                  NC2064.2
   000154         015800                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000155         015900                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000156         016000                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000157         016100             05  TABLE-LEVEL-1B.                                  NC2064.2
   000158         016200                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000159         016300                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000160         016400                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000161         016500     02  TABLE-LEVEL-4B.                                          NC2064.2
   000162         016600         03  TABLE-LEVEL-3A.                                      NC2064.2
   000163         016700             04  TABLE-LEVEL-2A.                                  NC2064.2
   000164         016800             05  TABLE-LEVEL-1A.                                  NC2064.2
   000165         016900                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000166         017000                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000167         017100                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000168         017200             05  TABLE-LEVEL-1B.                                  NC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000170         017400                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000171         017500                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000172         017600             04  TABLE-LEVEL-2B.                                  NC2064.2
   000173         017700             05  TABLE-LEVEL-1A.                                  NC2064.2
   000174         017800                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000175         017900                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000176         018000                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000177         018100             05  TABLE-LEVEL-1B.                                  NC2064.2
   000178         018200                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000179         018300                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000180         018400                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000181         018500         03  TABLE-LEVEL-3B.                                      NC2064.2
   000182         018600             04  TABLE-LEVEL-2A.                                  NC2064.2
   000183         018700             05  TABLE-LEVEL-1A.                                  NC2064.2
   000184         018800                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000185         018900                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000186         019000                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000187         019100             05  TABLE-LEVEL-1B.                                  NC2064.2
   000188         019200                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000189         019300                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000190         019400                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000191         019500             04  TABLE-LEVEL-2B.                                  NC2064.2
   000192         019600             05  TABLE-LEVEL-1A.                                  NC2064.2
   000193         019700                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000194         019800                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000195         019900                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000196         020000             05  TABLE-LEVEL-1B.                                  NC2064.2
   000197         020100                 06  TBL-LEVEL-0A  PIC X VALUE SPACE.             NC2064.2 IMP
   000198         020200                 06  TBL-LEVEL-0B  PIC X VALUE SPACE.             NC2064.2 IMP
   000199         020300                 06  TBL-LEVEL-0C  PIC X VALUE SPACE.             NC2064.2 IMP
   000200         020400 01  QUAL-SUB-TABLE.                                              NC2064.2
   000201         020500     02  AX.                                                      NC2064.2
   000202         020600         03  AX-1 OCCURS 5 TIMES.                                 NC2064.2
   000203         020700              04  AX-2 PIC X.                                     NC2064.2
   000204         020800              04  AX-3 PIC X.                                     NC2064.2
   000205         020900     02  BX.                                                      NC2064.2
   000206         021000         03  AX-1 OCCURS 2 TIMES.                                 NC2064.2
   000207         021100              04  AX-2 PIC 9.                                     NC2064.2
   000208         021200              04  AX-3 PIC 9.                                     NC2064.2
   000209         021300     02  CX.                                                      NC2064.2
   000210         021400         03  CX-SUB PIC 9 VALUE 2.                                NC2064.2
   000211         021500     02  DX.                                                      NC2064.2
   000212         021600         03  CX-SUB USAGE IS INDEX.                               NC2064.2
   000213         021700 01  TEST-RESULTS.                                                NC2064.2
   000214         021800     02 FILLER                   PIC X      VALUE SPACE.          NC2064.2 IMP
   000215         021900     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2064.2 IMP
   000216         022000     02 FILLER                   PIC X      VALUE SPACE.          NC2064.2 IMP
   000217         022100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2064.2 IMP
   000218         022200     02 FILLER                   PIC X      VALUE SPACE.          NC2064.2 IMP
   000219         022300     02  PAR-NAME.                                                NC2064.2
   000220         022400       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2064.2 IMP
   000221         022500       03  PARDOT-X              PIC X      VALUE SPACE.          NC2064.2 IMP
   000222         022600       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2064.2 IMP
   000223         022700     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2064.2 IMP
   000224         022800     02 RE-MARK                  PIC X(61).                       NC2064.2
   000225         022900 01  TEST-COMPUTED.                                               NC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2064.2 IMP
   000227         023100     02 FILLER                   PIC X(17)  VALUE                 NC2064.2
   000228         023200            "       COMPUTED=".                                   NC2064.2
   000229         023300     02 COMPUTED-X.                                               NC2064.2
   000230         023400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2064.2 IMP
   000231         023500     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2064.2 230
   000232         023600                                 PIC -9(9).9(9).                  NC2064.2
   000233         023700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2064.2 230
   000234         023800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2064.2 230
   000235         023900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2064.2 230
   000236         024000     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2064.2 230
   000237         024100         04 COMPUTED-18V0                    PIC -9(18).          NC2064.2
   000238         024200         04 FILLER                           PIC X.               NC2064.2
   000239         024300     03 FILLER PIC X(50) VALUE SPACE.                             NC2064.2 IMP
   000240         024400 01  TEST-CORRECT.                                                NC2064.2
   000241         024500     02 FILLER PIC X(30) VALUE SPACE.                             NC2064.2 IMP
   000242         024600     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2064.2
   000243         024700     02 CORRECT-X.                                                NC2064.2
   000244         024800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2064.2 IMP
   000245         024900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2064.2 244
   000246         025000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2064.2 244
   000247         025100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2064.2 244
   000248         025200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2064.2 244
   000249         025300     03      CR-18V0 REDEFINES CORRECT-A.                         NC2064.2 244
   000250         025400         04 CORRECT-18V0                     PIC -9(18).          NC2064.2
   000251         025500         04 FILLER                           PIC X.               NC2064.2
   000252         025600     03 FILLER PIC X(2) VALUE SPACE.                              NC2064.2 IMP
   000253         025700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2064.2 IMP
   000254         025800 01  CCVS-C-1.                                                    NC2064.2
   000255         025900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2064.2
   000256         026000-    "SS  PARAGRAPH-NAME                                          NC2064.2
   000257         026100-    "       REMARKS".                                            NC2064.2
   000258         026200     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2064.2 IMP
   000259         026300 01  CCVS-C-2.                                                    NC2064.2
   000260         026400     02 FILLER                     PIC X        VALUE SPACE.      NC2064.2 IMP
   000261         026500     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2064.2
   000262         026600     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2064.2 IMP
   000263         026700     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2064.2
   000264         026800     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2064.2 IMP
   000265         026900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2064.2 IMP
   000266         027000 01  REC-CT                        PIC 99       VALUE ZERO.       NC2064.2 IMP
   000267         027100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2064.2 IMP
   000268         027200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2064.2 IMP
   000269         027300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2064.2 IMP
   000270         027400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2064.2 IMP
   000271         027500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2064.2 IMP
   000272         027600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2064.2 IMP
   000273         027700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2064.2 IMP
   000274         027800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2064.2 IMP
   000275         027900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2064.2 IMP
   000276         028000 01  CCVS-H-1.                                                    NC2064.2
   000277         028100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2064.2 IMP
   000278         028200     02  FILLER                    PIC X(42)    VALUE             NC2064.2
   000279         028300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2064.2
   000280         028400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2064.2 IMP
   000281         028500 01  CCVS-H-2A.                                                   NC2064.2
   000282         028600   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2064.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2064.2
   000284         028800   02  FILLER                        PIC XXXX   VALUE             NC2064.2
   000285         028900     "4.2 ".                                                      NC2064.2
   000286         029000   02  FILLER                        PIC X(28)  VALUE             NC2064.2
   000287         029100            " COPY - NOT FOR DISTRIBUTION".                       NC2064.2
   000288         029200   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2064.2 IMP
   000289         029300                                                                  NC2064.2
   000290         029400 01  CCVS-H-2B.                                                   NC2064.2
   000291         029500   02  FILLER                        PIC X(15)  VALUE             NC2064.2
   000292         029600            "TEST RESULT OF ".                                    NC2064.2
   000293         029700   02  TEST-ID                       PIC X(9).                    NC2064.2
   000294         029800   02  FILLER                        PIC X(4)   VALUE             NC2064.2
   000295         029900            " IN ".                                               NC2064.2
   000296         030000   02  FILLER                        PIC X(12)  VALUE             NC2064.2
   000297         030100     " HIGH       ".                                              NC2064.2
   000298         030200   02  FILLER                        PIC X(22)  VALUE             NC2064.2
   000299         030300            " LEVEL VALIDATION FOR ".                             NC2064.2
   000300         030400   02  FILLER                        PIC X(58)  VALUE             NC2064.2
   000301         030500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2064.2
   000302         030600 01  CCVS-H-3.                                                    NC2064.2
   000303         030700     02  FILLER                      PIC X(34)  VALUE             NC2064.2
   000304         030800            " FOR OFFICIAL USE ONLY    ".                         NC2064.2
   000305         030900     02  FILLER                      PIC X(58)  VALUE             NC2064.2
   000306         031000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2064.2
   000307         031100     02  FILLER                      PIC X(28)  VALUE             NC2064.2
   000308         031200            "  COPYRIGHT   1985 ".                                NC2064.2
   000309         031300 01  CCVS-E-1.                                                    NC2064.2
   000310         031400     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2064.2 IMP
   000311         031500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2064.2
   000312         031600     02 ID-AGAIN                     PIC X(9).                    NC2064.2
   000313         031700     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2064.2 IMP
   000314         031800 01  CCVS-E-2.                                                    NC2064.2
   000315         031900     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2064.2 IMP
   000316         032000     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2064.2 IMP
   000317         032100     02 CCVS-E-2-2.                                               NC2064.2
   000318         032200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2064.2 IMP
   000319         032300         03 FILLER                   PIC X      VALUE SPACE.      NC2064.2 IMP
   000320         032400         03 ENDER-DESC               PIC X(44)  VALUE             NC2064.2
   000321         032500            "ERRORS ENCOUNTERED".                                 NC2064.2
   000322         032600 01  CCVS-E-3.                                                    NC2064.2
   000323         032700     02  FILLER                      PIC X(22)  VALUE             NC2064.2
   000324         032800            " FOR OFFICIAL USE ONLY".                             NC2064.2
   000325         032900     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2064.2 IMP
   000326         033000     02  FILLER                      PIC X(58)  VALUE             NC2064.2
   000327         033100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2064.2
   000328         033200     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2064.2 IMP
   000329         033300     02 FILLER                       PIC X(15)  VALUE             NC2064.2
   000330         033400             " COPYRIGHT 1985".                                   NC2064.2
   000331         033500 01  CCVS-E-4.                                                    NC2064.2
   000332         033600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2064.2 IMP
   000333         033700     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2064.2
   000334         033800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2064.2 IMP
   000335         033900     02 FILLER                       PIC X(40)  VALUE             NC2064.2
   000336         034000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2064.2
   000337         034100 01  XXINFO.                                                      NC2064.2
   000338         034200     02 FILLER                       PIC X(19)  VALUE             NC2064.2
   000339         034300            "*** INFORMATION ***".                                NC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     02 INFO-TEXT.                                                NC2064.2
   000341         034500       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2064.2 IMP
   000342         034600       04 XXCOMPUTED                 PIC X(20).                   NC2064.2
   000343         034700       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2064.2 IMP
   000344         034800       04 XXCORRECT                  PIC X(20).                   NC2064.2
   000345         034900     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2064.2
   000346         035000 01  HYPHEN-LINE.                                                 NC2064.2
   000347         035100     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2064.2 IMP
   000348         035200     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2064.2
   000349         035300-    "*****************************************".                 NC2064.2
   000350         035400     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2064.2
   000351         035500-    "******************************".                            NC2064.2
   000352         035600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2064.2
   000353         035700     "NC206A".                                                    NC2064.2
   000354         035800 PROCEDURE DIVISION.                                              NC2064.2
   000355         035900 CCVS1 SECTION.                                                   NC2064.2
   000356         036000 OPEN-FILES.                                                      NC2064.2
   000357         036100     OPEN     OUTPUT PRINT-FILE.                                  NC2064.2 36
   000358         036200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2064.2 352 293 352 312
   000359         036300     MOVE    SPACE TO TEST-RESULTS.                               NC2064.2 IMP 213
   000360         036400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2064.2 385 390
   000361         036500     GO TO CCVS1-EXIT.                                            NC2064.2 467
   000362         036600 CLOSE-FILES.                                                     NC2064.2
   000363         036700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2064.2 394 415 36
   000364         036800 TERMINATE-CCVS.                                                  NC2064.2
   000365         036900     EXIT PROGRAM.                                                NC2064.2
   000366         037000 TERMINATE-CALL.                                                  NC2064.2
   000367         037100     STOP     RUN.                                                NC2064.2
   000368         037200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2064.2 217 269
   000369         037300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2064.2 217 270
   000370         037400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2064.2 217 268
   000371         037500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2064.2 217 267
   000372         037600     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2064.2 224
   000373         037700 PRINT-DETAIL.                                                    NC2064.2
   000374         037800     IF REC-CT NOT EQUAL TO ZERO                                  NC2064.2 266 IMP
   000375      1  037900             MOVE "." TO PARDOT-X                                 NC2064.2 221
   000376      1  038000             MOVE REC-CT TO DOTVALUE.                             NC2064.2 266 222
   000377         038100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2064.2 213 37 427
   000378         038200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2064.2 217 427
   000379      1  038300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2064.2 444 457
   000380      1  038400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2064.2 458 466
   000381         038500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2064.2 IMP 217 IMP 229
   000382         038600     MOVE SPACE TO CORRECT-X.                                     NC2064.2 IMP 243
   000383         038700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2064.2 266 IMP IMP 219
   000384         038800     MOVE     SPACE TO RE-MARK.                                   NC2064.2 IMP 224
   000385         038900 HEAD-ROUTINE.                                                    NC2064.2
   000386         039000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2064.2 276 38 427
   000387         039100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2064.2 281 38 427
   000388         039200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2064.2 290 38 427
   000389         039300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2064.2 302 38 427
   000390         039400 COLUMN-NAMES-ROUTINE.                                            NC2064.2
   000391         039500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2064.2 254 38 427
   000392         039600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2064.2 259 38 427
   000393         039700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2064.2 346 38 427
   000394         039800 END-ROUTINE.                                                     NC2064.2
   000395         039900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2064.2 346 38 427
   000396         040000 END-RTN-EXIT.                                                    NC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2064.2 309 38 427
   000398         040200 END-ROUTINE-1.                                                   NC2064.2
   000399         040300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2064.2 268 272 269
   000400         040400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2064.2 272 267 272
   000401         040500      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2064.2 270 272
   000402         040600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2064.2
   000403         040700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2064.2 270 332
   000404         040800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2064.2 272 334
   000405         040900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2064.2 331 317
   000406         041000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2064.2 314 38 427
   000407         041100  END-ROUTINE-12.                                                 NC2064.2
   000408         041200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2064.2 320
   000409         041300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2064.2 268 IMP
   000410      1  041400         MOVE "NO " TO ERROR-TOTAL                                NC2064.2 318
   000411         041500         ELSE                                                     NC2064.2
   000412      1  041600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2064.2 268 318
   000413         041700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2064.2 314 38
   000414         041800     PERFORM WRITE-LINE.                                          NC2064.2 427
   000415         041900 END-ROUTINE-13.                                                  NC2064.2
   000416         042000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2064.2 267 IMP
   000417      1  042100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2064.2 318
   000418      1  042200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2064.2 267 318
   000419         042300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2064.2 320
   000420         042400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2064.2 314 38 427
   000421         042500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2064.2 269 IMP
   000422      1  042600          MOVE "NO " TO ERROR-TOTAL                               NC2064.2 318
   000423      1  042700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2064.2 269 318
   000424         042800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2064.2 320
   000425         042900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2064.2 314 38 427
   000426         043000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2064.2 322 38 427
   000427         043100 WRITE-LINE.                                                      NC2064.2
   000428         043200     ADD 1 TO RECORD-COUNT.                                       NC2064.2 274
   000429         043300     IF RECORD-COUNT GREATER 50                                   NC2064.2 274
   000430      1  043400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2064.2 38 273
   000431      1  043500         MOVE SPACE TO DUMMY-RECORD                               NC2064.2 IMP 38
   000432      1  043600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2064.2 38
   000433      1  043700         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2064.2 254 38 439
   000434      1  043800         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2064.2 259 38 439
   000435      1  043900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2064.2 346 38 439
   000436      1  044000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2064.2 273 38
   000437      1  044100         MOVE ZERO TO RECORD-COUNT.                               NC2064.2 IMP 274
   000438         044200     PERFORM WRT-LN.                                              NC2064.2 439
   000439         044300 WRT-LN.                                                          NC2064.2
   000440         044400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2064.2 38
   000441         044500     MOVE SPACE TO DUMMY-RECORD.                                  NC2064.2 IMP 38
   000442         044600 BLANK-LINE-PRINT.                                                NC2064.2
   000443         044700     PERFORM WRT-LN.                                              NC2064.2 439
   000444         044800 FAIL-ROUTINE.                                                    NC2064.2
   000445         044900     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2064.2 229 IMP 452
   000446         045000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2064.2 243 IMP 452
   000447         045100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2064.2 275 345
   000448         045200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2064.2 340
   000449         045300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2064.2 337 38 427
   000450         045400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2064.2 IMP 345
   000451         045500     GO TO  FAIL-ROUTINE-EX.                                      NC2064.2 457
   000452         045600 FAIL-ROUTINE-WRITE.                                              NC2064.2
   000453         045700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2064.2 225 37 427
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2064.2 275 253
   000455         045900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2064.2 240 37 427
   000456         046000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2064.2 IMP 253
   000457         046100 FAIL-ROUTINE-EX. EXIT.                                           NC2064.2
   000458         046200 BAIL-OUT.                                                        NC2064.2
   000459         046300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2064.2 230 IMP 461
   000460         046400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2064.2 244 IMP 466
   000461         046500 BAIL-OUT-WRITE.                                                  NC2064.2
   000462         046600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2064.2 244 344 230 342
   000463         046700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2064.2 275 345
   000464         046800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2064.2 337 38 427
   000465         046900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2064.2 IMP 345
   000466         047000 BAIL-OUT-EX. EXIT.                                               NC2064.2
   000467         047100 CCVS1-EXIT.                                                      NC2064.2
   000468         047200     EXIT.                                                        NC2064.2
   000469         047300 SECT-NC206A-001 SECTION.                                         NC2064.2
   000470         047400 NC-06-001.                                                       NC2064.2
   000471         047500*    5 LEVELS OF QUALIFICATION ARE USED IN ORDER TO MAKE THE      NC2064.2
   000472         047600*    IDENTIFIERS UNIQUE. SEE THE 01 WORKING-STORAGE ENTRIES       NC2064.2
   000473         047700*    CALLED TABLE-LEVEL-5A AND TABLE-LEVEL-5B.                    NC2064.2
   000474         047800 QAL-INIT-F1-1.                                                   NC2064.2

 ==000474==> IGYPS2015-I The paragraph or section prior to paragraph or section "QAL-INIT-F1-1"
                         did not contain any statements.

   000475         047900     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000476         048000     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000477         048100     MOVE "QAL-TEST-F1-1 " TO PAR-NAME.                           NC2064.2 219
   000478         048200 QAL-TEST-F1-1.                                                   NC2064.2
   000479         048300     IF TBL-LEVEL-0A OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2064.2 46 45 44
   000480         048400         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   000481         048500         TO "5A4A3A2A1A0A"                                        NC2064.2
   000482      1  048600         PERFORM PASS                                             NC2064.2 369
   000483      1  048700         GO TO QAL-WRITE-F1-1.                                    NC2064.2 494
   000484         048800     GO TO QAL-FAIL-F1-1.                                         NC2064.2 488
   000485         048900 QAL-DELETE-F1-1.                                                 NC2064.2
   000486         049000     PERFORM DE-LETE.                                             NC2064.2 371
   000487         049100     GO TO QAL-WRITE-F1-1.                                        NC2064.2 494
   000488         049200 QAL-FAIL-F1-1.                                                   NC2064.2
   000489         049300     MOVE TBL-LEVEL-0A OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF     NC2064.2 46 45 44
   000490         049400         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   000491         049500         COMPUTED-A.                                              NC2064.2 230
   000492         049600     MOVE "5A4A3A2A1A0A" TO CORRECT-A.                            NC2064.2 244
   000493         049700     PERFORM FAIL.                                                NC2064.2 370
   000494         049800 QAL-WRITE-F1-1.                                                  NC2064.2
   000495         049900     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000496         050000*                                                                 NC2064.2
   000497         050100 QAL-INIT-F1-2.                                                   NC2064.2
   000498         050200     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000499         050300     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000500         050400     MOVE "QAL-TEST-F1-2 " TO PAR-NAME.                           NC2064.2 219
   000501         050500 QAL-TEST-F1-2.                                                   NC2064.2
   000502         050600     IF TBL-LEVEL-0A IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN       NC2064.2 51 50 44
   000503         050700         TABLE-LEVEL-3A OF TABLE-LEVEL-4A IN TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   000504         050800         TO "5A4A3A2A1B0A"                                        NC2064.2
   000505      1  050900         PERFORM PASS                                             NC2064.2 369
   000506      1  051000         GO TO QAL-WRITE-F1-2.                                    NC2064.2 517
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051100     GO TO QAL-FAIL-F1-2.                                         NC2064.2 511
   000508         051200 QAL-DELETE-F1-2.                                                 NC2064.2
   000509         051300     PERFORM DE-LETE.                                             NC2064.2 371
   000510         051400     GO TO QAL-WRITE-F1-2.                                        NC2064.2 517
   000511         051500 QAL-FAIL-F1-2.                                                   NC2064.2
   000512         051600     MOVE TBL-LEVEL-0A IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN     NC2064.2 51 50 44
   000513         051700         TABLE-LEVEL-3A OF TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   000514         051800         COMPUTED-A.                                              NC2064.2 230
   000515         051900     MOVE "5A4A3A2A1B0A" TO CORRECT-A.                            NC2064.2 244
   000516         052000     PERFORM FAIL.                                                NC2064.2 370
   000517         052100 QAL-WRITE-F1-2.                                                  NC2064.2
   000518         052200     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000519         052300*                                                                 NC2064.2
   000520         052400 QAL-INIT-F1-3.                                                   NC2064.2
   000521         052500     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000522         052600     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000523         052700     MOVE "QAL-TEST-F1-3" TO PAR-NAME.                            NC2064.2 219
   000524         052800 QAL-TEST-F1-3.                                                   NC2064.2
   000525         052900     IF TBL-LEVEL-0A IN TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN       NC2064.2 56 55 54
   000526         053000         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   000527         053100         TO "5A4A3A2B1A0A"                                        NC2064.2
   000528      1  053200         PERFORM PASS                                             NC2064.2 369
   000529      1  053300         GO TO QAL-WRITE-F1-3.                                    NC2064.2 540
   000530         053400     GO TO QAL-FAIL-F1-3.                                         NC2064.2 534
   000531         053500 QAL-DELETE-F1-3.                                                 NC2064.2
   000532         053600     PERFORM DE-LETE.                                             NC2064.2 371
   000533         053700     GO TO QAL-WRITE-F1-3.                                        NC2064.2 540
   000534         053800 QAL-FAIL-F1-3.                                                   NC2064.2
   000535         053900     MOVE TBL-LEVEL-0A IN TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN     NC2064.2 56 55 54
   000536         054000         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   000537         054100         COMPUTED-A.                                              NC2064.2 230
   000538         054200     MOVE "5A4A3A2B1A0A" TO CORRECT-A.                            NC2064.2 244
   000539         054300     PERFORM FAIL.                                                NC2064.2 370
   000540         054400 QAL-WRITE-F1-3.                                                  NC2064.2
   000541         054500     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000542         054600*                                                                 NC2064.2
   000543         054700 QAL-INIT-F1-4.                                                   NC2064.2
   000544         054800     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000545         054900     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000546         055000     MOVE "QAL-TEST-F1-4 " TO PAR-NAME.                           NC2064.2 219
   000547         055100 QAL-TEST-F1-4.                                                   NC2064.2
   000548         055200     IF TBL-LEVEL-0A OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2064.2 60 59 54
   000549         055300         TABLE-LEVEL-3A OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   000550         055400         TO "5A4A3A2B1B0A"                                        NC2064.2
   000551      1  055500         PERFORM PASS                                             NC2064.2 369
   000552      1  055600         GO TO QAL-WRITE-F1-4.                                    NC2064.2 563
   000553         055700     GO TO QAL-FAIL-F1-4.                                         NC2064.2 557
   000554         055800 QAL-DELETE-F1-4.                                                 NC2064.2
   000555         055900     PERFORM DE-LETE.                                             NC2064.2 371
   000556         056000     GO TO QAL-WRITE-F1-4.                                        NC2064.2 563
   000557         056100 QAL-FAIL-F1-4.                                                   NC2064.2
   000558         056200     MOVE TBL-LEVEL-0A OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF     NC2064.2 60 59 54
   000559         056300         TABLE-LEVEL-3A OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   000560         056400         COMPUTED-A.                                              NC2064.2 230
   000561         056500     MOVE "5A4A3A2B1B0A" TO CORRECT-A.                            NC2064.2 244
   000562         056600     PERFORM FAIL.                                                NC2064.2 370
   000563         056700 QAL-WRITE-F1-4.                                                  NC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564         056800     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000565         056900*                                                                 NC2064.2
   000566         057000 QAL-INIT-F1-5.                                                   NC2064.2
   000567         057100     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000568         057200     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000569         057300     MOVE "QAL-TEST-F1-5 " TO PAR-NAME.                           NC2064.2 219
   000570         057400 QAL-TEST-F1-5.                                                   NC2064.2
   000571         057500     IF TBL-LEVEL-0A OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2064.2 66 65 64
   000572         057600         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   000573         057700         TO "5A4A3B2A1A0A"                                        NC2064.2
   000574      1  057800         PERFORM PASS                                             NC2064.2 369
   000575      1  057900         GO TO QAL-WRITE-F1-5.                                    NC2064.2 586
   000576         058000     GO TO QAL-FAIL-F1-5.                                         NC2064.2 580
   000577         058100 QAL-DELETE-F1-5.                                                 NC2064.2
   000578         058200     PERFORM DE-LETE.                                             NC2064.2 371
   000579         058300     GO TO QAL-WRITE-F1-5.                                        NC2064.2 586
   000580         058400 QAL-FAIL-F1-5.                                                   NC2064.2
   000581         058500     MOVE TBL-LEVEL-0A OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF     NC2064.2 66 65 64
   000582         058600         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   000583         058700         COMPUTED-A.                                              NC2064.2 230
   000584         058800     MOVE "5A4A3B2A1A0A" TO CORRECT-A.                            NC2064.2 244
   000585         058900     PERFORM FAIL.                                                NC2064.2 370
   000586         059000 QAL-WRITE-F1-5.                                                  NC2064.2
   000587         059100     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000588         059200*                                                                 NC2064.2
   000589         059300 QAL-INIT-F1-6.                                                   NC2064.2
   000590         059400     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000591         059500     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000592         059600     MOVE "QAL-TEST-F1-6 " TO PAR-NAME.                           NC2064.2 219
   000593         059700 QAL-TEST-F1-6.                                                   NC2064.2
   000594         059800     IF TBL-LEVEL-0A OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN       NC2064.2 70 69 64
   000595         059900         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   000596         060000         TO "5A4A3B2A1B0A"                                        NC2064.2
   000597      1  060100         PERFORM PASS                                             NC2064.2 369
   000598      1  060200         GO TO QAL-WRITE-F1-6.                                    NC2064.2 609
   000599         060300     GO TO QAL-FAIL-F1-6.                                         NC2064.2 603
   000600         060400 QAL-DELETE-F1-6.                                                 NC2064.2
   000601         060500     PERFORM DE-LETE.                                             NC2064.2 371
   000602         060600     GO TO QAL-WRITE-F1-6.                                        NC2064.2 609
   000603         060700 QAL-FAIL-F1-6.                                                   NC2064.2
   000604         060800     MOVE TBL-LEVEL-0A OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN     NC2064.2 70 69 64
   000605         060900         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   000606         061000         COMPUTED-A.                                              NC2064.2 230
   000607         061100     MOVE "5A4A3B2A1B0A" TO CORRECT-A.                            NC2064.2 244
   000608         061200     PERFORM FAIL.                                                NC2064.2 370
   000609         061300 QAL-WRITE-F1-6.                                                  NC2064.2
   000610         061400     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000611         061500*                                                                 NC2064.2
   000612         061600 QAL-INIT-F1-7.                                                   NC2064.2
   000613         061700     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000614         061800     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000615         061900     MOVE "QAL-TEST-F1-7 " TO PAR-NAME.                           NC2064.2 219
   000616         062000 QAL-TEST-F1-7.                                                   NC2064.2
   000617         062100     IF TBL-LEVEL-0A OF TABLE-LEVEL-1A OF TABLE-LEVEL-2B IN       NC2064.2 75 74 73
   000618         062200         TABLE-LEVEL-3B IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   000619         062300         TO "5A4A3B2B1A0A"                                        NC2064.2
   000620      1  062400         PERFORM PASS                                             NC2064.2 369
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000621      1  062500         GO TO QAL-WRITE-F1-7.                                    NC2064.2 632
   000622         062600     GO TO QAL-FAIL-F1-7.                                         NC2064.2 626
   000623         062700 QAL-DELETE-F1-7.                                                 NC2064.2
   000624         062800     PERFORM DE-LETE.                                             NC2064.2 371
   000625         062900     GO TO QAL-WRITE-F1-7.                                        NC2064.2 632
   000626         063000 QAL-FAIL-F1-7.                                                   NC2064.2
   000627         063100     MOVE TBL-LEVEL-0A OF TABLE-LEVEL-1A OF TABLE-LEVEL-2B IN     NC2064.2 75 74 73
   000628         063200         TABLE-LEVEL-3B IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   000629         063300         COMPUTED-A.                                              NC2064.2 230
   000630         063400     MOVE "5A4A3B2B1A0A" TO CORRECT-A.                            NC2064.2 244
   000631         063500     PERFORM FAIL.                                                NC2064.2 370
   000632         063600 QAL-WRITE-F1-7.                                                  NC2064.2
   000633         063700     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000634         063800*                                                                 NC2064.2
   000635         063900 QAL-INIT-F1-8.                                                   NC2064.2
   000636         064000     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000637         064100     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000638         064200     MOVE "QAL-TEST-F1-8 " TO PAR-NAME.                           NC2064.2 219
   000639         064300 QAL-TEST-F1-8.                                                   NC2064.2
   000640         064400     IF TBL-LEVEL-0A IN TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN       NC2064.2 79 78 73
   000641         064500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   000642         064600         TO "5A4A3B2B1B0A"                                        NC2064.2
   000643      1  064700         PERFORM PASS                                             NC2064.2 369
   000644      1  064800         GO TO QAL-WRITE-F1-8.                                    NC2064.2 655
   000645         064900     GO TO QAL-FAIL-F1-8.                                         NC2064.2 649
   000646         065000 QAL-DELETE-F1-8.                                                 NC2064.2
   000647         065100     PERFORM DE-LETE.                                             NC2064.2 371
   000648         065200     GO TO QAL-WRITE-F1-8.                                        NC2064.2 655
   000649         065300 QAL-FAIL-F1-8.                                                   NC2064.2
   000650         065400     MOVE TBL-LEVEL-0A IN TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN     NC2064.2 79 78 73
   000651         065500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   000652         065600         COMPUTED-A.                                              NC2064.2 230
   000653         065700     MOVE "5A4A3B2B1B0A" TO CORRECT-A.                            NC2064.2 244
   000654         065800     PERFORM FAIL.                                                NC2064.2 370
   000655         065900 QAL-WRITE-F1-8.                                                  NC2064.2
   000656         066000     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000657         066100*                                                                 NC2064.2
   000658         066200 QAL-INIT-F1-9.                                                   NC2064.2
   000659         066300     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000660         066400     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000661         066500     MOVE "QAL-TEST-F1-9 " TO PAR-NAME.                           NC2064.2 219
   000662         066600 QAL-TEST-F1-9.                                                   NC2064.2
   000663         066700     IF TBL-LEVEL-0A OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2064.2 86 85 84
   000664         066800         TABLE-LEVEL-3A OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   000665         066900         TO "5A4B3A2A1A0A"                                        NC2064.2
   000666      1  067000         PERFORM PASS                                             NC2064.2 369
   000667      1  067100         GO TO QAL-WRITE-F1-9.                                    NC2064.2 678
   000668         067200     GO TO QAL-FAIL-F1-9.                                         NC2064.2 672
   000669         067300 QAL-DELETE-F1-9.                                                 NC2064.2
   000670         067400     PERFORM DE-LETE.                                             NC2064.2 371
   000671         067500     GO TO QAL-WRITE-F1-9.                                        NC2064.2 678
   000672         067600 QAL-FAIL-F1-9.                                                   NC2064.2
   000673         067700     MOVE TBL-LEVEL-0A OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF     NC2064.2 86 85 84
   000674         067800         TABLE-LEVEL-3A OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   000675         067900         COMPUTED-A.                                              NC2064.2 230
   000676         068000     MOVE "5A4B3A2A1A0A" TO CORRECT-A.                            NC2064.2 244
   000677         068100     PERFORM FAIL.                                                NC2064.2 370
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000678         068200 QAL-WRITE-F1-9.                                                  NC2064.2
   000679         068300     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000680         068400*                                                                 NC2064.2
   000681         068500 QAL-INIT-F1-10.                                                  NC2064.2
   000682         068600     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000683         068700     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000684         068800     MOVE "QAL-TEST-F1-10 " TO PAR-NAME.                          NC2064.2 219
   000685         068900 QAL-TEST-F1-10.                                                  NC2064.2
   000686         069000     IF TBL-LEVEL-0A IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A OF       NC2064.2 90 89 84
   000687         069100         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   000688         069200         TO "5A4B3A2A1B0A"                                        NC2064.2
   000689      1  069300         PERFORM PASS                                             NC2064.2 369
   000690      1  069400         GO TO QAL-WRITE-F1-10.                                   NC2064.2 701
   000691         069500     GO TO QAL-FAIL-F1-10.                                        NC2064.2 695
   000692         069600 QAL-DELETE-F1-10.                                                NC2064.2
   000693         069700     PERFORM DE-LETE.                                             NC2064.2 371
   000694         069800     GO TO QAL-WRITE-F1-10.                                       NC2064.2 701
   000695         069900 QAL-FAIL-F1-10.                                                  NC2064.2
   000696         070000     MOVE TBL-LEVEL-0A IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A OF     NC2064.2 90 89 84
   000697         070100         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   000698         070200         COMPUTED-A.                                              NC2064.2 230
   000699         070300     MOVE "5A4B3A2A1B0A" TO CORRECT-A.                            NC2064.2 244
   000700         070400     PERFORM FAIL.                                                NC2064.2 370
   000701         070500 QAL-WRITE-F1-10.                                                 NC2064.2
   000702         070600     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000703         070700*                                                                 NC2064.2
   000704         070800 QAL-INIT-F1-11.                                                  NC2064.2
   000705         070900     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000706         071000     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000707         071100     MOVE "QAL-TEST-F1-11 " TO PAR-NAME.                          NC2064.2 219
   000708         071200 QAL-TEST-F1-11.                                                  NC2064.2
   000709         071300     IF TBL-LEVEL-0A IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF       NC2064.2 95 94 93
   000710         071400         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   000711         071500         TO "5A4B3A2B1A0A"                                        NC2064.2
   000712      1  071600         PERFORM PASS                                             NC2064.2 369
   000713      1  071700         GO TO QAL-WRITE-F1-11.                                   NC2064.2 724
   000714         071800     GO TO QAL-FAIL-F1-11.                                        NC2064.2 718
   000715         071900 QAL-DELETE-F1-11.                                                NC2064.2
   000716         072000     PERFORM DE-LETE.                                             NC2064.2 371
   000717         072100     GO TO QAL-WRITE-F1-11.                                       NC2064.2 724
   000718         072200 QAL-FAIL-F1-11.                                                  NC2064.2
   000719         072300     MOVE "5A4B3A2B1A0A" TO CORRECT-A.                            NC2064.2 244
   000720         072400     MOVE TBL-LEVEL-0A IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF     NC2064.2 95 94 93
   000721         072500         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   000722         072600         COMPUTED-A.                                              NC2064.2 230
   000723         072700     PERFORM FAIL.                                                NC2064.2 370
   000724         072800 QAL-WRITE-F1-11.                                                 NC2064.2
   000725         072900     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000726         073000*                                                                 NC2064.2
   000727         073100 QAL-INIT-F1-12.                                                  NC2064.2
   000728         073200     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000729         073300     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000730         073400     MOVE "QAL-TEST-F1-12 " TO PAR-NAME.                          NC2064.2 219
   000731         073500 QAL-TEST-F1-12.                                                  NC2064.2
   000732         073600     IF TBL-LEVEL-0A OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2064.2 99 98 93
   000733         073700         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   000734         073800         TO "5A4B3A2B1B0A"                                        NC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000735      1  073900         PERFORM PASS                                             NC2064.2 369
   000736      1  074000         GO TO QAL-WRITE-F1-12.                                   NC2064.2 747
   000737         074100     GO TO QAL-FAIL-F1-12.                                        NC2064.2 741
   000738         074200 QAL-DELETE-F1-12.                                                NC2064.2
   000739         074300     PERFORM DE-LETE.                                             NC2064.2 371
   000740         074400     GO TO QAL-WRITE-F1-12.                                       NC2064.2 747
   000741         074500 QAL-FAIL-F1-12.                                                  NC2064.2
   000742         074600     MOVE TBL-LEVEL-0A OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF     NC2064.2 99 98 93
   000743         074700         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   000744         074800         COMPUTED-A.                                              NC2064.2 230
   000745         074900     MOVE "5A4B3A2B1B0A" TO CORRECT-A.                            NC2064.2 244
   000746         075000     PERFORM FAIL.                                                NC2064.2 370
   000747         075100 QAL-WRITE-F1-12.                                                 NC2064.2
   000748         075200     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000749         075300*                                                                 NC2064.2
   000750         075400 QAL-INIT-F1-13.                                                  NC2064.2
   000751         075500     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000752         075600     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000753         075700     MOVE "QAL-TEST-F1-13 " TO PAR-NAME.                          NC2064.2 219
   000754         075800 QAL-TEST-F1-13.                                                  NC2064.2
   000755         075900     IF TBL-LEVEL-0A OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF       NC2064.2 105 104 103
   000756         076000         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   000757         076100         TO "5A4B3B2A1A0A"                                        NC2064.2
   000758      1  076200         PERFORM PASS                                             NC2064.2 369
   000759      1  076300         GO TO QAL-WRITE-F1-13.                                   NC2064.2 770
   000760         076400     GO TO QAL-FAIL-F1-13.                                        NC2064.2 764
   000761         076500 QAL-DELETE-F1-13.                                                NC2064.2
   000762         076600     PERFORM DE-LETE.                                             NC2064.2 371
   000763         076700     GO TO QAL-WRITE-F1-13.                                       NC2064.2 770
   000764         076800 QAL-FAIL-F1-13.                                                  NC2064.2
   000765         076900     MOVE TBL-LEVEL-0A OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF     NC2064.2 105 104 103
   000766         077000         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2064.2 102 82 41
   000767         077100         TO COMPUTED-A.                                           NC2064.2 230
   000768         077200     MOVE "5A4B3B2A1A0A" TO CORRECT-A.                            NC2064.2 244
   000769         077300     PERFORM FAIL.                                                NC2064.2 370
   000770         077400 QAL-WRITE-F1-13.                                                 NC2064.2
   000771         077500     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000772         077600*                                                                 NC2064.2
   000773         077700 QAL-INIT-F1-14.                                                  NC2064.2
   000774         077800     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000775         077900     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000776         078000     MOVE "QAL-TEST-F1-14 " TO PAR-NAME.                          NC2064.2 219
   000777         078100 QAL-TEST-F1-14.                                                  NC2064.2
   000778         078200     IF TBL-LEVEL-0A IN TABLE-LEVEL-1B IN TABLE-LEVEL-2A IN       NC2064.2 109 108 103
   000779         078300         TABLE-LEVEL-3B OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   000780         078400         TO "5A4B3B2A1B0A"                                        NC2064.2
   000781      1  078500         PERFORM PASS                                             NC2064.2 369
   000782      1  078600         GO TO QAL-WRITE-F1-14.                                   NC2064.2 793
   000783         078700     GO TO QAL-FAIL-F1-14.                                        NC2064.2 787
   000784         078800 QAL-DELETE-F1-14.                                                NC2064.2
   000785         078900     PERFORM DE-LETE.                                             NC2064.2 371
   000786         079000     GO TO QAL-WRITE-F1-14.                                       NC2064.2 793
   000787         079100 QAL-FAIL-F1-14.                                                  NC2064.2
   000788         079200     MOVE TBL-LEVEL-0A IN TABLE-LEVEL-1B IN TABLE-LEVEL-2A IN     NC2064.2 109 108 103
   000789         079300         TABLE-LEVEL-3B OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A TO    NC2064.2 102 82 41
   000790         079400         COMPUTED-A.                                              NC2064.2 230
   000791         079500     MOVE "5A4B3B2A1B0A" TO CORRECT-A.                            NC2064.2 244
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000792         079600     PERFORM FAIL.                                                NC2064.2 370
   000793         079700 QAL-WRITE-F1-14.                                                 NC2064.2
   000794         079800     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000795         079900*                                                                 NC2064.2
   000796         080000 QAL-INIT-F1-15.                                                  NC2064.2
   000797         080100     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000798         080200     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000799         080300     MOVE "QAL-TEST-F1-15 " TO PAR-NAME.                          NC2064.2 219
   000800         080400 QAL-TEST-F1-15.                                                  NC2064.2
   000801         080500     IF TBL-LEVEL-0A OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN       NC2064.2 114 113 112
   000802         080600         TABLE-LEVEL-3B IN TABLE-LEVEL-4B IN TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   000803         080700         TO "5A4B3B2B1A0A"                                        NC2064.2
   000804      1  080800         PERFORM PASS                                             NC2064.2 369
   000805      1  080900         GO TO QAL-WRITE-F1-15.                                   NC2064.2 816
   000806         081000     GO TO QAL-FAIL-F1-15.                                        NC2064.2 810
   000807         081100 QAL-DELETE-F1-15.                                                NC2064.2
   000808         081200     PERFORM DE-LETE.                                             NC2064.2 371
   000809         081300     GO TO QAL-WRITE-F1-15.                                       NC2064.2 816
   000810         081400 QAL-FAIL-F1-15.                                                  NC2064.2
   000811         081500     MOVE "5A4B3B2B1A0A" TO CORRECT-A.                            NC2064.2 244
   000812         081600     MOVE TBL-LEVEL-0A OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN     NC2064.2 114 113 112
   000813         081700         TABLE-LEVEL-3B IN TABLE-LEVEL-4B IN TABLE-LEVEL-5A TO    NC2064.2 102 82 41
   000814         081800         COMPUTED-A.                                              NC2064.2 230
   000815         081900     PERFORM FAIL.                                                NC2064.2 370
   000816         082000 QAL-WRITE-F1-15.                                                 NC2064.2
   000817         082100     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000818         082200*                                                                 NC2064.2
   000819         082300 QAL-INIT-F1-16.                                                  NC2064.2
   000820         082400     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000821         082500     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000822         082600     MOVE "QAL-TEST-F1-16 " TO PAR-NAME.                          NC2064.2 219
   000823         082700 QAL-TEST-F1-16.                                                  NC2064.2
   000824         082800     IF TBL-LEVEL-0A IN TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2064.2 118 117 112
   000825         082900         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   000826         083000         TO "5A4B3B2B1B0A"                                        NC2064.2
   000827      1  083100         PERFORM PASS                                             NC2064.2 369
   000828      1  083200         GO TO QAL-WRITE-F1-16.                                   NC2064.2 839
   000829         083300     GO TO QAL-FAIL-F1-16.                                        NC2064.2 833
   000830         083400 QAL-DELETE-F1-16.                                                NC2064.2
   000831         083500     PERFORM DE-LETE.                                             NC2064.2 371
   000832         083600     GO TO QAL-WRITE-F1-16.                                       NC2064.2 839
   000833         083700 QAL-FAIL-F1-16.                                                  NC2064.2
   000834         083800     MOVE TBL-LEVEL-0A IN TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF     NC2064.2 118 117 112
   000835         083900         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 102 82 41
   000836         084000         COMPUTED-A.                                              NC2064.2 230
   000837         084100     MOVE "5A4B3B2B1B0A" TO CORRECT-A.                            NC2064.2 244
   000838         084200     PERFORM FAIL.                                                NC2064.2 370
   000839         084300 QAL-WRITE-F1-16.                                                 NC2064.2
   000840         084400     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000841         084500*                                                                 NC2064.2
   000842         084600 QAL-INIT-F1-17.                                                  NC2064.2
   000843         084700     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000844         084800     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000845         084900     MOVE "QAL-TEST-F1-17" TO PAR-NAME.                           NC2064.2 219
   000846         085000 QAL-TEST-F1-17.                                                  NC2064.2
   000847         085100     IF TBL-LEVEL-0B OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2064.2 47 45 44
   000848         085200         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000849         085300         TO "5A4A3A2A1A0B"                                        NC2064.2
   000850      1  085400         PERFORM PASS                                             NC2064.2 369
   000851      1  085500         GO TO QAL-WRITE-F1-17.                                   NC2064.2 862
   000852         085600     GO TO QAL-FAIL-F1-17.                                        NC2064.2 856
   000853         085700 QAL-DELETE-F1-17.                                                NC2064.2
   000854         085800     PERFORM DE-LETE.                                             NC2064.2 371
   000855         085900     GO TO QAL-WRITE-F1-17.                                       NC2064.2 862
   000856         086000 QAL-FAIL-F1-17.                                                  NC2064.2
   000857         086100     MOVE TBL-LEVEL-0B OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF     NC2064.2 47 45 44
   000858         086200         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   000859         086300         COMPUTED-A.                                              NC2064.2 230
   000860         086400     MOVE "5A4A3A2A1A0B" TO CORRECT-A.                            NC2064.2 244
   000861         086500     PERFORM FAIL.                                                NC2064.2 370
   000862         086600 QAL-WRITE-F1-17.                                                 NC2064.2
   000863         086700     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000864         086800*                                                                 NC2064.2
   000865         086900 QAL-INIT-F1-18.                                                  NC2064.2
   000866         087000     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000867         087100     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000868         087200     MOVE "QAL-TEST-F1-18" TO PAR-NAME.                           NC2064.2 219
   000869         087300 QAL-TEST-F1-18.                                                  NC2064.2
   000870         087400     IF TBL-LEVEL-0B IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN       NC2064.2 52 50 44
   000871         087500         TABLE-LEVEL-3A OF TABLE-LEVEL-4A IN TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   000872         087600         TO "5A4A3A2A1B0B"                                        NC2064.2
   000873      1  087700         PERFORM PASS                                             NC2064.2 369
   000874      1  087800         GO TO QAL-WRITE-F1-18.                                   NC2064.2 885
   000875         087900     GO TO QAL-FAIL-F1-18.                                        NC2064.2 879
   000876         088000 QAL-DELETE-F1-18.                                                NC2064.2
   000877         088100     PERFORM DE-LETE.                                             NC2064.2 371
   000878         088200     GO TO QAL-WRITE-F1-18.                                       NC2064.2 885
   000879         088300 QAL-FAIL-F1-18.                                                  NC2064.2
   000880         088400     MOVE TBL-LEVEL-0B IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN     NC2064.2 52 50 44
   000881         088500         TABLE-LEVEL-3A OF TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   000882         088600         COMPUTED-A.                                              NC2064.2 230
   000883         088700     MOVE "5A4A3A2A1B0B" TO CORRECT-A.                            NC2064.2 244
   000884         088800     PERFORM FAIL.                                                NC2064.2 370
   000885         088900 QAL-WRITE-F1-18.                                                 NC2064.2
   000886         089000     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000887         089100*                                                                 NC2064.2
   000888         089200 QAL-INIT-F1-19.                                                  NC2064.2
   000889         089300     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000890         089400     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000891         089500     MOVE "QAL-TEST-F1-19" TO PAR-NAME.                           NC2064.2 219
   000892         089600 QAL-TEST-F1-19.                                                  NC2064.2
   000893         089700     IF TBL-LEVEL-0B IN TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN       NC2064.2 57 55 54
   000894         089800         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   000895         089900         TO "5A4A3A2B1A0B"                                        NC2064.2
   000896      1  090000         PERFORM PASS                                             NC2064.2 369
   000897      1  090100         GO TO QAL-WRITE-F1-19.                                   NC2064.2 908
   000898         090200     GO TO QAL-FAIL-F1-19.                                        NC2064.2 902
   000899         090300 QAL-DELETE-F1-19.                                                NC2064.2
   000900         090400     PERFORM DE-LETE.                                             NC2064.2 371
   000901         090500     GO TO QAL-WRITE-F1-19.                                       NC2064.2 908
   000902         090600 QAL-FAIL-F1-19.                                                  NC2064.2
   000903         090700     MOVE TBL-LEVEL-0B IN TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN     NC2064.2 57 55 54
   000904         090800         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   000905         090900         COMPUTED-A.                                              NC2064.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000906         091000     MOVE "5A4A3A2B1A0B" TO CORRECT-A.                            NC2064.2 244
   000907         091100     PERFORM FAIL.                                                NC2064.2 370
   000908         091200 QAL-WRITE-F1-19.                                                 NC2064.2
   000909         091300     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000910         091400*                                                                 NC2064.2
   000911         091500 QAL-INIT-F1-20.                                                  NC2064.2
   000912         091600     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000913         091700     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000914         091800     MOVE "QAL-TEST-F1-20" TO PAR-NAME.                           NC2064.2 219
   000915         091900 QAL-TEST-F1-20.                                                  NC2064.2
   000916         092000     IF TBL-LEVEL-0B OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2064.2 61 59 54
   000917         092100         TABLE-LEVEL-3A OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   000918         092200         TO "5A4A3A2B1B0B"                                        NC2064.2
   000919      1  092300         PERFORM PASS                                             NC2064.2 369
   000920      1  092400         GO TO QAL-WRITE-F1-20.                                   NC2064.2 931
   000921         092500     GO TO QAL-FAIL-F1-20.                                        NC2064.2 925
   000922         092600 QAL-DELETE-F1-20.                                                NC2064.2
   000923         092700     PERFORM DE-LETE.                                             NC2064.2 371
   000924         092800     GO TO QAL-WRITE-F1-20.                                       NC2064.2 931
   000925         092900 QAL-FAIL-F1-20.                                                  NC2064.2
   000926         093000     MOVE TBL-LEVEL-0B OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF     NC2064.2 61 59 54
   000927         093100         TABLE-LEVEL-3A OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   000928         093200         COMPUTED-A.                                              NC2064.2 230
   000929         093300     MOVE "5A4A3A2B1B0B" TO CORRECT-A.                            NC2064.2 244
   000930         093400     PERFORM FAIL.                                                NC2064.2 370
   000931         093500 QAL-WRITE-F1-20.                                                 NC2064.2
   000932         093600     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000933         093700*                                                                 NC2064.2
   000934         093800 QAL-INIT-F1-21.                                                  NC2064.2
   000935         093900     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000936         094000     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000937         094100     MOVE "QAL-TEST-F1-21" TO PAR-NAME.                           NC2064.2 219
   000938         094200 QAL-TEST-F1-21.                                                  NC2064.2
   000939         094300     IF TBL-LEVEL-0B OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2064.2 67 65 64
   000940         094400         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   000941         094500         TO "5A4A3B2A1A0B"                                        NC2064.2
   000942      1  094600         PERFORM PASS                                             NC2064.2 369
   000943      1  094700         GO TO QAL-WRITE-F1-21.                                   NC2064.2 954
   000944         094800     GO TO QAL-FAIL-F1-21.                                        NC2064.2 948
   000945         094900 QAL-DELETE-F1-21.                                                NC2064.2
   000946         095000     PERFORM DE-LETE.                                             NC2064.2 371
   000947         095100     GO TO QAL-WRITE-F1-21.                                       NC2064.2 954
   000948         095200 QAL-FAIL-F1-21.                                                  NC2064.2
   000949         095300     MOVE TBL-LEVEL-0B OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF     NC2064.2 67 65 64
   000950         095400         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   000951         095500         COMPUTED-A.                                              NC2064.2 230
   000952         095600     MOVE "5A4A3B2A1A0B" TO CORRECT-A.                            NC2064.2 244
   000953         095700     PERFORM FAIL.                                                NC2064.2 370
   000954         095800 QAL-WRITE-F1-21.                                                 NC2064.2
   000955         095900     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000956         096000*                                                                 NC2064.2
   000957         096100 QAL-INIT-F1-22.                                                  NC2064.2
   000958         096200     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000959         096300     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000960         096400     MOVE "QAL-TEST-F1-22" TO PAR-NAME.                           NC2064.2 219
   000961         096500 QAL-TEST-F1-22.                                                  NC2064.2
   000962         096600     IF TBL-LEVEL-0B OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN       NC2064.2 71 69 64
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000963         096700         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   000964         096800         TO "5A4A3B2A1B0B"                                        NC2064.2
   000965      1  096900         PERFORM PASS                                             NC2064.2 369
   000966      1  097000         GO TO QAL-WRITE-F1-22.                                   NC2064.2 977
   000967         097100     GO TO QAL-FAIL-F1-22.                                        NC2064.2 971
   000968         097200 QAL-DELETE-F1-22.                                                NC2064.2
   000969         097300     PERFORM DE-LETE.                                             NC2064.2 371
   000970         097400     GO TO QAL-WRITE-F1-22.                                       NC2064.2 977
   000971         097500 QAL-FAIL-F1-22.                                                  NC2064.2
   000972         097600     MOVE TBL-LEVEL-0B OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN     NC2064.2 71 69 64
   000973         097700         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   000974         097800         COMPUTED-A.                                              NC2064.2 230
   000975         097900     MOVE "5A4A3B2A1B0B" TO CORRECT-A.                            NC2064.2 244
   000976         098000     PERFORM FAIL.                                                NC2064.2 370
   000977         098100 QAL-WRITE-F1-22.                                                 NC2064.2
   000978         098200     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   000979         098300*                                                                 NC2064.2
   000980         098400 QAL-INIT-F1-23.                                                  NC2064.2
   000981         098500     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   000982         098600     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   000983         098700     MOVE "QAL-TEST-F1-23" TO PAR-NAME.                           NC2064.2 219
   000984         098800 QAL-TEST-F1-23.                                                  NC2064.2
   000985         098900     IF TBL-LEVEL-0B OF TABLE-LEVEL-1A OF TABLE-LEVEL-2B IN       NC2064.2 76 74 73
   000986         099000         TABLE-LEVEL-3B IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   000987         099100         TO "5A4A3B2B1A0B"                                        NC2064.2
   000988      1  099200         PERFORM PASS                                             NC2064.2 369
   000989      1  099300         GO TO QAL-WRITE-F1-23.                                   NC2064.2 998
   000990         099400     MOVE TBL-LEVEL-0B OF TABLE-LEVEL-1A OF TABLE-LEVEL-2B IN     NC2064.2 76 74 73
   000991         099500         TABLE-LEVEL-3B IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   000992         099600         COMPUTED-A.                                              NC2064.2 230
   000993         099700     MOVE "5A4A3B2B1A0B" TO CORRECT-A.                            NC2064.2 244
   000994         099800     PERFORM FAIL.                                                NC2064.2 370
   000995         099900     GO TO QAL-WRITE-F1-23.                                       NC2064.2 998
   000996         100000 QAL-DELETE-F1-23.                                                NC2064.2
   000997         100100     PERFORM DE-LETE.                                             NC2064.2 371
   000998         100200 QAL-WRITE-F1-23.                                                 NC2064.2
   000999         100300     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001000         100400*                                                                 NC2064.2
   001001         100500 QAL-INIT-F1-24.                                                  NC2064.2
   001002         100600     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001003         100700     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001004         100800     MOVE "QAL-TEST-F1-24" TO PAR-NAME.                           NC2064.2 219
   001005         100900 QAL-TEST-F1-24.                                                  NC2064.2
   001006         101000     IF TBL-LEVEL-0B IN TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN       NC2064.2 80 78 73
   001007         101100         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   001008         101200         TO "5A4A3B2B1B0B"                                        NC2064.2
   001009      1  101300         PERFORM PASS                                             NC2064.2 369
   001010      1  101400         GO TO QAL-WRITE-F1-24.                                   NC2064.2 1021
   001011         101500     GO TO QAL-FAIL-F1-24.                                        NC2064.2 1015
   001012         101600 QAL-DELETE-F1-24.                                                NC2064.2
   001013         101700     PERFORM DE-LETE.                                             NC2064.2 371
   001014         101800     GO TO QAL-WRITE-F1-24.                                       NC2064.2 1021
   001015         101900 QAL-FAIL-F1-24.                                                  NC2064.2
   001016         102000     MOVE TBL-LEVEL-0B IN TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN     NC2064.2 80 78 73
   001017         102100         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   001018         102200         COMPUTED-A.                                              NC2064.2 230
   001019         102300     MOVE "5A4A3B2B1B0B" TO CORRECT-A.                            NC2064.2 244
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001020         102400     PERFORM FAIL.                                                NC2064.2 370
   001021         102500 QAL-WRITE-F1-24.                                                 NC2064.2
   001022         102600     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001023         102700*                                                                 NC2064.2
   001024         102800 QAL-INIT-F1-25.                                                  NC2064.2
   001025         102900     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001026         103000     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001027         103100     MOVE "QAL-TEST-F1-25" TO PAR-NAME.                           NC2064.2 219
   001028         103200 QAL-TEST-F1-25.                                                  NC2064.2
   001029         103300     IF TBL-LEVEL-0B OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2064.2 87 85 84
   001030         103400         TABLE-LEVEL-3A OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   001031         103500         TO "5A4B3A2A1A0B"                                        NC2064.2
   001032      1  103600         PERFORM PASS                                             NC2064.2 369
   001033      1  103700         GO TO QAL-WRITE-F1-25.                                   NC2064.2 1044
   001034         103800     GO TO QAL-FAIL-F1-25.                                        NC2064.2 1038
   001035         103900 QAL-DELETE-F1-25.                                                NC2064.2
   001036         104000     PERFORM DE-LETE.                                             NC2064.2 371
   001037         104100     GO TO QAL-WRITE-F1-25.                                       NC2064.2 1044
   001038         104200 QAL-FAIL-F1-25.                                                  NC2064.2
   001039         104300     MOVE TBL-LEVEL-0B OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF     NC2064.2 87 85 84
   001040         104400         TABLE-LEVEL-3A OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   001041         104500         COMPUTED-A.                                              NC2064.2 230
   001042         104600     MOVE "5A4B3A2A1A0B" TO CORRECT-A.                            NC2064.2 244
   001043         104700     PERFORM FAIL.                                                NC2064.2 370
   001044         104800 QAL-WRITE-F1-25.                                                 NC2064.2
   001045         104900     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001046         105000*                                                                 NC2064.2
   001047         105100 QAL-INIT-F1-26.                                                  NC2064.2
   001048         105200     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001049         105300     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001050         105400     MOVE "QAL-TEST-F1-26" TO PAR-NAME.                           NC2064.2 219
   001051         105500 QAL-TEST-F1-26.                                                  NC2064.2
   001052         105600     IF TBL-LEVEL-0B IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A OF       NC2064.2 91 89 84
   001053         105700         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   001054         105800         TO "5A4B3A2A1B0B"                                        NC2064.2
   001055      1  105900         PERFORM PASS                                             NC2064.2 369
   001056      1  106000         GO TO QAL-WRITE-F1-26.                                   NC2064.2 1067
   001057         106100     GO TO QAL-FAIL-F1-26.                                        NC2064.2 1061
   001058         106200 QAL-DELETE-F1-26.                                                NC2064.2
   001059         106300     PERFORM DE-LETE.                                             NC2064.2 371
   001060         106400     GO TO QAL-WRITE-F1-26.                                       NC2064.2 1067
   001061         106500 QAL-FAIL-F1-26.                                                  NC2064.2
   001062         106600     MOVE TBL-LEVEL-0B IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A OF     NC2064.2 91 89 84
   001063         106700         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   001064         106800         COMPUTED-A.                                              NC2064.2 230
   001065         106900     MOVE "5A4B3A2A1B0B" TO CORRECT-A.                            NC2064.2 244
   001066         107000     PERFORM FAIL.                                                NC2064.2 370
   001067         107100 QAL-WRITE-F1-26.                                                 NC2064.2
   001068         107200     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001069         107300*                                                                 NC2064.2
   001070         107400 QAL-INIT-F1-27.                                                  NC2064.2
   001071         107500     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001072         107600     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001073         107700     MOVE "QAL-TEST-F1-27" TO PAR-NAME.                           NC2064.2 219
   001074         107800 QAL-TEST-F1-27.                                                  NC2064.2
   001075         107900     IF TBL-LEVEL-0B IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF       NC2064.2 96 94 93
   001076         108000         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001077         108100         TO "5A4B3A2B1A0B"                                        NC2064.2
   001078      1  108200         PERFORM PASS                                             NC2064.2 369
   001079      1  108300         GO TO QAL-WRITE-F1-27.                                   NC2064.2 1090
   001080         108400     GO TO QAL-FAIL-F1-27.                                        NC2064.2 1084
   001081         108500 QAL-DELETE-F1-27.                                                NC2064.2
   001082         108600     PERFORM DE-LETE.                                             NC2064.2 371
   001083         108700     GO TO QAL-WRITE-F1-27.                                       NC2064.2 1090
   001084         108800 QAL-FAIL-F1-27.                                                  NC2064.2
   001085         108900     MOVE "5A4B3A2B1A0B" TO CORRECT-A.                            NC2064.2 244
   001086         109000     MOVE TBL-LEVEL-0B IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF     NC2064.2 96 94 93
   001087         109100         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   001088         109200         COMPUTED-A.                                              NC2064.2 230
   001089         109300     PERFORM FAIL.                                                NC2064.2 370
   001090         109400 QAL-WRITE-F1-27.                                                 NC2064.2
   001091         109500     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001092         109600*                                                                 NC2064.2
   001093         109700 QAL-INIT-F1-28.                                                  NC2064.2
   001094         109800     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001095         109900     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001096         110000     MOVE "QAL-TEST-F1-28" TO PAR-NAME.                           NC2064.2 219
   001097         110100 QAL-TEST-F1-28.                                                  NC2064.2
   001098         110200     IF TBL-LEVEL-0B OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2064.2 100 98 93
   001099         110300         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   001100         110400         TO "5A4B3A2B1B0B"                                        NC2064.2
   001101      1  110500         PERFORM PASS                                             NC2064.2 369
   001102      1  110600         GO TO QAL-WRITE-F1-28.                                   NC2064.2 1113
   001103         110700     GO TO QAL-FAIL-F1-28.                                        NC2064.2 1107
   001104         110800 QAL-DELETE-F1-28.                                                NC2064.2
   001105         110900     PERFORM DE-LETE.                                             NC2064.2 371
   001106         111000     GO TO QAL-WRITE-F1-28.                                       NC2064.2 1113
   001107         111100 QAL-FAIL-F1-28.                                                  NC2064.2
   001108         111200     MOVE TBL-LEVEL-0B OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF     NC2064.2 100 98 93
   001109         111300         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   001110         111400         COMPUTED-A.                                              NC2064.2 230
   001111         111500     MOVE "5A4B3A2B1B0B" TO CORRECT-A.                            NC2064.2 244
   001112         111600     PERFORM FAIL.                                                NC2064.2 370
   001113         111700 QAL-WRITE-F1-28.                                                 NC2064.2
   001114         111800     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001115         111900*                                                                 NC2064.2
   001116         112000 QAL-INIT-F1-29.                                                  NC2064.2
   001117         112100     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001118         112200     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001119         112300     MOVE "QAL-TEST-F1-29" TO PAR-NAME.                           NC2064.2 219
   001120         112400 QAL-TEST-F1-29.                                                  NC2064.2
   001121         112500     IF TBL-LEVEL-0B OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF       NC2064.2 106 104 103
   001122         112600         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   001123         112700         TO "5A4B3B2A1A0B"                                        NC2064.2
   001124      1  112800         PERFORM PASS                                             NC2064.2 369
   001125      1  112900         GO TO QAL-WRITE-F1-29.                                   NC2064.2 1136
   001126         113000     GO TO QAL-FAIL-F1-29.                                        NC2064.2 1130
   001127         113100 QAL-DELETE-F1-29.                                                NC2064.2
   001128         113200     PERFORM DE-LETE.                                             NC2064.2 371
   001129         113300     GO TO QAL-WRITE-F1-29.                                       NC2064.2 1136
   001130         113400 QAL-FAIL-F1-29.                                                  NC2064.2
   001131         113500     MOVE TBL-LEVEL-0B OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF     NC2064.2 106 104 103
   001132         113600         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2064.2 102 82 41
   001133         113700         TO COMPUTED-A.                                           NC2064.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001134         113800     MOVE "5A4B3B2A1A0B" TO CORRECT-A.                            NC2064.2 244
   001135         113900     PERFORM FAIL.                                                NC2064.2 370
   001136         114000 QAL-WRITE-F1-29.                                                 NC2064.2
   001137         114100     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001138         114200*                                                                 NC2064.2
   001139         114300 QAL-INIT-F1-30.                                                  NC2064.2
   001140         114400     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001141         114500     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001142         114600     MOVE "QAL-TEST-F1-30" TO PAR-NAME.                           NC2064.2 219
   001143         114700 QAL-TEST-F1-30.                                                  NC2064.2
   001144         114800     IF TBL-LEVEL-0B IN TABLE-LEVEL-1B IN TABLE-LEVEL-2A IN       NC2064.2 110 108 103
   001145         114900         TABLE-LEVEL-3B OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   001146         115000         TO "5A4B3B2A1B0B"                                        NC2064.2
   001147      1  115100         PERFORM PASS                                             NC2064.2 369
   001148      1  115200         GO TO QAL-WRITE-F1-30.                                   NC2064.2 1159
   001149         115300     GO TO QAL-FAIL-F1-30.                                        NC2064.2 1153
   001150         115400 QAL-DELETE-F1-30.                                                NC2064.2
   001151         115500     PERFORM DE-LETE.                                             NC2064.2 371
   001152         115600     GO TO QAL-WRITE-F1-30.                                       NC2064.2 1159
   001153         115700 QAL-FAIL-F1-30.                                                  NC2064.2
   001154         115800     MOVE TBL-LEVEL-0B IN TABLE-LEVEL-1B IN TABLE-LEVEL-2A IN     NC2064.2 110 108 103
   001155         115900         TABLE-LEVEL-3B OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A TO    NC2064.2 102 82 41
   001156         116000         COMPUTED-A.                                              NC2064.2 230
   001157         116100     MOVE "5A4B3B2A1B0B" TO CORRECT-A.                            NC2064.2 244
   001158         116200     PERFORM FAIL.                                                NC2064.2 370
   001159         116300 QAL-WRITE-F1-30.                                                 NC2064.2
   001160         116400     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001161         116500*                                                                 NC2064.2
   001162         116600 QAL-INIT-F1-31.                                                  NC2064.2
   001163         116700     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001164         116800     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001165         116900     MOVE "QAL-TEST-F1-31" TO PAR-NAME.                           NC2064.2 219
   001166         117000 QAL-TEST-F1-31.                                                  NC2064.2
   001167         117100     IF TBL-LEVEL-0B OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN       NC2064.2 115 113 112
   001168         117200         TABLE-LEVEL-3B IN TABLE-LEVEL-4B IN TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   001169         117300         TO "5A4B3B2B1A0B"                                        NC2064.2
   001170      1  117400         PERFORM PASS                                             NC2064.2 369
   001171      1  117500         GO TO QAL-WRITE-F1-31.                                   NC2064.2 1182
   001172         117600     GO TO QAL-FAIL-F1-31.                                        NC2064.2 1176
   001173         117700 QAL-DELETE-F1-31.                                                NC2064.2
   001174         117800     PERFORM DE-LETE.                                             NC2064.2 371
   001175         117900     GO TO QAL-WRITE-F1-31.                                       NC2064.2 1182
   001176         118000 QAL-FAIL-F1-31.                                                  NC2064.2
   001177         118100     MOVE "5A4B3B2B1A0B" TO CORRECT-A.                            NC2064.2 244
   001178         118200     MOVE TBL-LEVEL-0B OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN     NC2064.2 115 113 112
   001179         118300         TABLE-LEVEL-3B IN TABLE-LEVEL-4B IN TABLE-LEVEL-5A TO    NC2064.2 102 82 41
   001180         118400         COMPUTED-A.                                              NC2064.2 230
   001181         118500     PERFORM FAIL.                                                NC2064.2 370
   001182         118600 QAL-WRITE-F1-31.                                                 NC2064.2
   001183         118700     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001184         118800*                                                                 NC2064.2
   001185         118900 QAL-INIT-F1-32.                                                  NC2064.2
   001186         119000     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001187         119100     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001188         119200     MOVE "QAL-TEST-F1-32" TO PAR-NAME.                           NC2064.2 219
   001189         119300 QAL-TEST-F1-32.                                                  NC2064.2
   001190         119400     IF TBL-LEVEL-0B IN TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2064.2 119 117 112
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001191         119500         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   001192         119600         TO "5A4B3B2B1B0B"                                        NC2064.2
   001193      1  119700         PERFORM PASS                                             NC2064.2 369
   001194      1  119800         GO TO QAL-WRITE-F1-32.                                   NC2064.2 1205
   001195         119900     GO TO QAL-FAIL-F1-32.                                        NC2064.2 1199
   001196         120000 QAL-DELETE-F1-32.                                                NC2064.2
   001197         120100     PERFORM DE-LETE.                                             NC2064.2 371
   001198         120200     GO TO QAL-WRITE-F1-32.                                       NC2064.2 1205
   001199         120300 QAL-FAIL-F1-32.                                                  NC2064.2
   001200         120400     MOVE TBL-LEVEL-0B IN TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF     NC2064.2 119 117 112
   001201         120500         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 102 82 41
   001202         120600         COMPUTED-A.                                              NC2064.2 230
   001203         120700     MOVE "5A4B3B2B1B0B" TO CORRECT-A.                            NC2064.2 244
   001204         120800     PERFORM FAIL.                                                NC2064.2 370
   001205         120900 QAL-WRITE-F1-32.                                                 NC2064.2
   001206         121000     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001207         121100*                                                                 NC2064.2
   001208         121200 QAL-INIT-F1-33.                                                  NC2064.2
   001209         121300     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001210         121400     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001211         121500     MOVE "QAL-TEST-F1-33" TO PAR-NAME.                           NC2064.2 219
   001212         121600 QAL-TEST-F1-33.                                                  NC2064.2
   001213         121700     IF TBL-LEVEL-0C OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2064.2 48 45 44
   001214         121800         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   001215         121900         TO "5A4A3A2A1A0C"                                        NC2064.2
   001216      1  122000         PERFORM PASS                                             NC2064.2 369
   001217      1  122100         GO TO QAL-WRITE-F1-33.                                   NC2064.2 1228
   001218         122200     GO TO QAL-FAIL-F1-33.                                        NC2064.2 1222
   001219         122300 QAL-DELETE-F1-33.                                                NC2064.2
   001220         122400     PERFORM DE-LETE.                                             NC2064.2 371
   001221         122500     GO TO QAL-WRITE-F1-33.                                       NC2064.2 1228
   001222         122600 QAL-FAIL-F1-33.                                                  NC2064.2
   001223         122700     MOVE TBL-LEVEL-0C OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF     NC2064.2 48 45 44
   001224         122800         TABLE-LEVEL-3A IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   001225         122900         COMPUTED-A.                                              NC2064.2 230
   001226         123000     MOVE "5A4A3A2A1A0C" TO CORRECT-A.                            NC2064.2 244
   001227         123100     PERFORM FAIL.                                                NC2064.2 370
   001228         123200 QAL-WRITE-F1-33.                                                 NC2064.2
   001229         123300     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001230         123400*                                                                 NC2064.2
   001231         123500 QAL-INIT-F1-34.                                                  NC2064.2
   001232         123600     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001233         123700     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001234         123800     MOVE "QAL-TEST-F1-34" TO PAR-NAME.                           NC2064.2 219
   001235         123900 QAL-TEST-F1-34.                                                  NC2064.2
   001236         124000     IF TBL-LEVEL-0C IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN       NC2064.2 53 50 44
   001237         124100         TABLE-LEVEL-3A OF TABLE-LEVEL-4A IN TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   001238         124200         TO "5A4A3A2A1B0C"                                        NC2064.2
   001239      1  124300         PERFORM PASS                                             NC2064.2 369
   001240      1  124400         GO TO QAL-WRITE-F1-34.                                   NC2064.2 1251
   001241         124500     GO TO QAL-FAIL-F1-34.                                        NC2064.2 1245
   001242         124600 QAL-DELETE-F1-34.                                                NC2064.2
   001243         124700     PERFORM DE-LETE.                                             NC2064.2 371
   001244         124800     GO TO QAL-WRITE-F1-34.                                       NC2064.2 1251
   001245         124900 QAL-FAIL-F1-34.                                                  NC2064.2
   001246         125000     MOVE TBL-LEVEL-0C IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN     NC2064.2 53 50 44
   001247         125100         TABLE-LEVEL-3A OF TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2064.2 43 42 41
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001248         125200         COMPUTED-A.                                              NC2064.2 230
   001249         125300     MOVE "5A4A3A2A1B0C" TO CORRECT-A.                            NC2064.2 244
   001250         125400     PERFORM FAIL.                                                NC2064.2 370
   001251         125500 QAL-WRITE-F1-34.                                                 NC2064.2
   001252         125600     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001253         125700*                                                                 NC2064.2
   001254         125800 QAL-INIT-F1-35.                                                  NC2064.2
   001255         125900     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001256         126000     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001257         126100     MOVE "QAL-TEST-F1-35" TO PAR-NAME.                           NC2064.2 219
   001258         126200 QAL-TEST-F1-35.                                                  NC2064.2
   001259         126300     IF TBL-LEVEL-0C IN TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN       NC2064.2 58 55 54
   001260         126400         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   001261         126500         TO "5A4A3A2B1A0C"                                        NC2064.2
   001262      1  126600         PERFORM PASS                                             NC2064.2 369
   001263      1  126700         GO TO QAL-WRITE-F1-35.                                   NC2064.2 1274
   001264         126800     GO TO QAL-FAIL-F1-35.                                        NC2064.2 1268
   001265         126900 QAL-DELETE-F1-35.                                                NC2064.2
   001266         127000     PERFORM DE-LETE.                                             NC2064.2 371
   001267         127100     GO TO QAL-WRITE-F1-35.                                       NC2064.2 1274
   001268         127200 QAL-FAIL-F1-35.                                                  NC2064.2
   001269         127300     MOVE TBL-LEVEL-0C IN TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN     NC2064.2 58 55 54
   001270         127400         TABLE-LEVEL-3A IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   001271         127500         COMPUTED-A.                                              NC2064.2 230
   001272         127600     MOVE "5A4A3A2B1A0C" TO CORRECT-A.                            NC2064.2 244
   001273         127700     PERFORM FAIL.                                                NC2064.2 370
   001274         127800 QAL-WRITE-F1-35.                                                 NC2064.2
   001275         127900     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001276         128000*                                                                 NC2064.2
   001277         128100 QAL-INIT-F1-36.                                                  NC2064.2
   001278         128200     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001279         128300     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001280         128400     MOVE "QAL-TEST-F1-36" TO PAR-NAME.                           NC2064.2 219
   001281         128500 QAL-TEST-F1-36.                                                  NC2064.2
   001282         128600     IF TBL-LEVEL-0C OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2064.2 62 59 54
   001283         128700         TABLE-LEVEL-3A OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 43 42 41
   001284         128800         TO "5A4A3A2B1B0C"                                        NC2064.2
   001285      1  128900         PERFORM PASS                                             NC2064.2 369
   001286      1  129000         GO TO QAL-WRITE-F1-36.                                   NC2064.2 1297
   001287         129100     GO TO QAL-FAIL-F1-36.                                        NC2064.2 1291
   001288         129200 QAL-DELETE-F1-36.                                                NC2064.2
   001289         129300     PERFORM DE-LETE.                                             NC2064.2 371
   001290         129400     GO TO QAL-WRITE-F1-36.                                       NC2064.2 1297
   001291         129500 QAL-FAIL-F1-36.                                                  NC2064.2
   001292         129600     MOVE TBL-LEVEL-0C OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF     NC2064.2 62 59 54
   001293         129700         TABLE-LEVEL-3A OF TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 43 42 41
   001294         129800         COMPUTED-A.                                              NC2064.2 230
   001295         129900     MOVE "5A4A3A2B1B0C" TO CORRECT-A.                            NC2064.2 244
   001296         130000     PERFORM FAIL.                                                NC2064.2 370
   001297         130100 QAL-WRITE-F1-36.                                                 NC2064.2
   001298         130200     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001299         130300*                                                                 NC2064.2
   001300         130400 QAL-INIT-F1-37.                                                  NC2064.2
   001301         130500     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001302         130600     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001303         130700     MOVE "QAL-TEST-F1-37" TO PAR-NAME.                           NC2064.2 219
   001304         130800 QAL-TEST-F1-37.                                                  NC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001305         130900     IF TBL-LEVEL-0C OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2064.2 68 65 64
   001306         131000         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   001307         131100         TO "5A4A3B2A1A0C"                                        NC2064.2
   001308      1  131200         PERFORM PASS                                             NC2064.2 369
   001309      1  131300         GO TO QAL-WRITE-F1-37.                                   NC2064.2 1320
   001310         131400     GO TO QAL-FAIL-F1-37.                                        NC2064.2 1314
   001311         131500 QAL-DELETE-F1-37.                                                NC2064.2
   001312         131600     PERFORM DE-LETE.                                             NC2064.2 371
   001313         131700     GO TO QAL-WRITE-F1-37.                                       NC2064.2 1320
   001314         131800 QAL-FAIL-F1-37.                                                  NC2064.2
   001315         131900     MOVE TBL-LEVEL-0C OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF     NC2064.2 68 65 64
   001316         132000         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   001317         132100         COMPUTED-A.                                              NC2064.2 230
   001318         132200     MOVE "5A4A3B2A1A0C" TO CORRECT-A.                            NC2064.2 244
   001319         132300     PERFORM FAIL.                                                NC2064.2 370
   001320         132400 QAL-WRITE-F1-37.                                                 NC2064.2
   001321         132500     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001322         132600*                                                                 NC2064.2
   001323         132700 QAL-INIT-F1-38.                                                  NC2064.2
   001324         132800     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001325         132900     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001326         133000     MOVE "QAL-TEST-F1-38" TO PAR-NAME.                           NC2064.2 219
   001327         133100 QAL-TEST-F1-38.                                                  NC2064.2
   001328         133200     IF TBL-LEVEL-0C OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN       NC2064.2 72 69 64
   001329         133300         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   001330         133400         TO "5A4A3B2A1B0C"                                        NC2064.2
   001331      1  133500         PERFORM PASS                                             NC2064.2 369
   001332      1  133600         GO TO QAL-WRITE-F1-38.                                   NC2064.2 1343
   001333         133700     GO TO QAL-FAIL-F1-38.                                        NC2064.2 1337
   001334         133800 QAL-DELETE-F1-38.                                                NC2064.2
   001335         133900     PERFORM DE-LETE.                                             NC2064.2 371
   001336         134000     GO TO QAL-WRITE-F1-38.                                       NC2064.2 1343
   001337         134100 QAL-FAIL-F1-38.                                                  NC2064.2
   001338         134200     MOVE TBL-LEVEL-0C OF TABLE-LEVEL-1B OF TABLE-LEVEL-2A IN     NC2064.2 72 69 64
   001339         134300         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   001340         134400         COMPUTED-A.                                              NC2064.2 230
   001341         134500     MOVE "5A4A3B2A1B0C" TO CORRECT-A.                            NC2064.2 244
   001342         134600     PERFORM FAIL.                                                NC2064.2 370
   001343         134700 QAL-WRITE-F1-38.                                                 NC2064.2
   001344         134800     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001345         134900*                                                                 NC2064.2
   001346         135000 QAL-INIT-F1-39.                                                  NC2064.2
   001347         135100     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001348         135200     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001349         135300     MOVE "QAL-TEST-F1-39" TO PAR-NAME.                           NC2064.2 219
   001350         135400 QAL-TEST-F1-39.                                                  NC2064.2
   001351         135500     IF TBL-LEVEL-0C OF TABLE-LEVEL-1A OF TABLE-LEVEL-2B IN       NC2064.2 77 74 73
   001352         135600         TABLE-LEVEL-3B IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   001353         135700         TO "5A4A3B2B1A0C"                                        NC2064.2
   001354      1  135800         PERFORM PASS                                             NC2064.2 369
   001355      1  135900         GO TO QAL-WRITE-F1-39.                                   NC2064.2 1366
   001356         136000     GO TO QAL-FAIL-F1-39.                                        NC2064.2 1360
   001357         136100 QAL-DELETE-F1-39.                                                NC2064.2
   001358         136200     PERFORM DE-LETE.                                             NC2064.2 371
   001359         136300     GO TO QAL-WRITE-F1-39.                                       NC2064.2 1366
   001360         136400 QAL-FAIL-F1-39.                                                  NC2064.2
   001361         136500     MOVE TBL-LEVEL-0C OF TABLE-LEVEL-1A OF TABLE-LEVEL-2B IN     NC2064.2 77 74 73
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001362         136600         TABLE-LEVEL-3B IN TABLE-LEVEL-4A IN TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   001363         136700         COMPUTED-A.                                              NC2064.2 230
   001364         136800     MOVE "5A4A3B2B1A0C" TO CORRECT-A.                            NC2064.2 244
   001365         136900     PERFORM FAIL.                                                NC2064.2 370
   001366         137000 QAL-WRITE-F1-39.                                                 NC2064.2
   001367         137100     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001368         137200*                                                                 NC2064.2
   001369         137300 QAL-INIT-F1-40.                                                  NC2064.2
   001370         137400     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001371         137500     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001372         137600     MOVE "QAL-TEST-F1-40" TO PAR-NAME.                           NC2064.2 219
   001373         137700 QAL-TEST-F1-40.                                                  NC2064.2
   001374         137800     IF TBL-LEVEL-0C IN TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN       NC2064.2 81 78 73
   001375         137900         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A EQUAL NC2064.2 63 42 41
   001376         138000         TO "5A4A3B2B1B0C"                                        NC2064.2
   001377      1  138100         PERFORM PASS                                             NC2064.2 369
   001378      1  138200         GO TO QAL-WRITE-F1-40.                                   NC2064.2 1389
   001379         138300     GO TO QAL-FAIL-F1-40.                                        NC2064.2 1383
   001380         138400 QAL-DELETE-F1-40.                                                NC2064.2
   001381         138500     PERFORM DE-LETE.                                             NC2064.2 371
   001382         138600     GO TO QAL-WRITE-F1-40.                                       NC2064.2 1389
   001383         138700 QAL-FAIL-F1-40.                                                  NC2064.2
   001384         138800     MOVE TBL-LEVEL-0C IN TABLE-LEVEL-1B IN TABLE-LEVEL-2B IN     NC2064.2 81 78 73
   001385         138900         TABLE-LEVEL-3B IN TABLE-LEVEL-4A OF TABLE-LEVEL-5A TO    NC2064.2 63 42 41
   001386         139000         COMPUTED-A.                                              NC2064.2 230
   001387         139100     MOVE "5A4A3B2B1B0C" TO CORRECT-A.                            NC2064.2 244
   001388         139200     PERFORM FAIL.                                                NC2064.2 370
   001389         139300 QAL-WRITE-F1-40.                                                 NC2064.2
   001390         139400     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001391         139500*                                                                 NC2064.2
   001392         139600 QAL-INIT-F1-41.                                                  NC2064.2
   001393         139700     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001394         139800     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001395         139900     MOVE "QAL-TEST-F1-41" TO PAR-NAME.                           NC2064.2 219
   001396         140000 QAL-TEST-F1-41.                                                  NC2064.2
   001397         140100     IF TBL-LEVEL-0C OF TABLE-LEVEL-1A IN TABLE-LEVEL-2A OF       NC2064.2 88 85 84
   001398         140200         TABLE-LEVEL-3A OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   001399         140300         TO "5A4B3A2A1A0C"                                        NC2064.2
   001400      1  140400         PERFORM PASS                                             NC2064.2 369
   001401      1  140500         GO TO QAL-WRITE-F1-41.                                   NC2064.2 1412
   001402         140600     GO TO QAL-FAIL-F1-41.                                        NC2064.2 1406
   001403         140700 QAL-DELETE-F1-41.                                                NC2064.2
   001404         140800     PERFORM DE-LETE.                                             NC2064.2 371
   001405         140900     GO TO QAL-WRITE-F1-41.                                       NC2064.2 1412
   001406         141000 QAL-FAIL-F1-41.                                                  NC2064.2
   001407         141100     MOVE TBL-LEVEL-0C OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF     NC2064.2 88 85 84
   001408         141200         TABLE-LEVEL-3A OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   001409         141300         COMPUTED-A.                                              NC2064.2 230
   001410         141400     MOVE "5A4B3A2A1A0C" TO CORRECT-A.                            NC2064.2 244
   001411         141500     PERFORM FAIL.                                                NC2064.2 370
   001412         141600 QAL-WRITE-F1-41.                                                 NC2064.2
   001413         141700     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001414         141800*                                                                 NC2064.2
   001415         141900 QAL-INIT-F1-42.                                                  NC2064.2
   001416         142000     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001417         142100     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001418         142200     MOVE "QAL-TEST-F1-42" TO PAR-NAME.                           NC2064.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001419         142300 QAL-TEST-F1-42.                                                  NC2064.2
   001420         142400     IF TBL-LEVEL-0C IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A OF       NC2064.2 92 89 84
   001421         142500         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   001422         142600         TO "5A4B3A2A1B0C"                                        NC2064.2
   001423      1  142700         PERFORM PASS                                             NC2064.2 369
   001424      1  142800         GO TO QAL-WRITE-F1-42.                                   NC2064.2 1435
   001425         142900     GO TO QAL-FAIL-F1-42.                                        NC2064.2 1429
   001426         143000 QAL-DELETE-F1-42.                                                NC2064.2
   001427         143100     PERFORM DE-LETE.                                             NC2064.2 371
   001428         143200     GO TO QAL-WRITE-F1-42.                                       NC2064.2 1435
   001429         143300 QAL-FAIL-F1-42.                                                  NC2064.2
   001430         143400     MOVE TBL-LEVEL-0C IN TABLE-LEVEL-1B OF TABLE-LEVEL-2A OF     NC2064.2 92 89 84
   001431         143500         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   001432         143600         COMPUTED-A.                                              NC2064.2 230
   001433         143700     MOVE "5A4B3A2A1B0C" TO CORRECT-A.                            NC2064.2 244
   001434         143800     PERFORM FAIL.                                                NC2064.2 370
   001435         143900 QAL-WRITE-F1-42.                                                 NC2064.2
   001436         144000     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001437         144100*                                                                 NC2064.2
   001438         144200 QAL-INIT-F1-43.                                                  NC2064.2
   001439         144300     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001440         144400     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001441         144500     MOVE "QAL-TEST-F1-43" TO PAR-NAME.                           NC2064.2 219
   001442         144600 QAL-TEST-F1-43.                                                  NC2064.2
   001443         144700     IF TBL-LEVEL-0C IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF       NC2064.2 97 94 93
   001444         144800         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   001445         144900         TO "5A4B3A2B1A0C"                                        NC2064.2
   001446      1  145000         PERFORM PASS                                             NC2064.2 369
   001447      1  145100         GO TO QAL-WRITE-F1-43.                                   NC2064.2 1458
   001448         145200     GO TO QAL-FAIL-F1-43.                                        NC2064.2 1452
   001449         145300 QAL-DELETE-F1-43.                                                NC2064.2
   001450         145400     PERFORM DE-LETE.                                             NC2064.2 371
   001451         145500     GO TO QAL-WRITE-F1-43.                                       NC2064.2 1458
   001452         145600 QAL-FAIL-F1-43.                                                  NC2064.2
   001453         145700     MOVE "5A4B3A2B1A0C" TO CORRECT-A.                            NC2064.2 244
   001454         145800     MOVE TBL-LEVEL-0C IN TABLE-LEVEL-1A OF TABLE-LEVEL-2B OF     NC2064.2 97 94 93
   001455         145900         TABLE-LEVEL-3A OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   001456         146000         COMPUTED-A.                                              NC2064.2 230
   001457         146100     PERFORM FAIL.                                                NC2064.2 370
   001458         146200 QAL-WRITE-F1-43.                                                 NC2064.2
   001459         146300     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001460         146400*                                                                 NC2064.2
   001461         146500 QAL-INIT-F1-44.                                                  NC2064.2
   001462         146600     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001463         146700     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001464         146800     MOVE "QAL-TEST-F1-44" TO PAR-NAME.                           NC2064.2 219
   001465         146900 QAL-TEST-F1-44.                                                  NC2064.2
   001466         147000     IF TBL-LEVEL-0C OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2064.2 101 98 93
   001467         147100         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 83 82 41
   001468         147200         TO "5A4B3A2B1B0C"                                        NC2064.2
   001469      1  147300         PERFORM PASS                                             NC2064.2 369
   001470      1  147400         GO TO QAL-WRITE-F1-44.                                   NC2064.2 1481
   001471         147500     GO TO QAL-FAIL-F1-44.                                        NC2064.2 1475
   001472         147600 QAL-DELETE-F1-44.                                                NC2064.2
   001473         147700     PERFORM DE-LETE.                                             NC2064.2 371
   001474         147800     GO TO QAL-WRITE-F1-44.                                       NC2064.2 1481
   001475         147900 QAL-FAIL-F1-44.                                                  NC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001476         148000     MOVE TBL-LEVEL-0C OF TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF     NC2064.2 101 98 93
   001477         148100         TABLE-LEVEL-3A IN TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 83 82 41
   001478         148200         COMPUTED-A.                                              NC2064.2 230
   001479         148300     MOVE "5A4B3A2B1B0C" TO CORRECT-A.                            NC2064.2 244
   001480         148400     PERFORM FAIL.                                                NC2064.2 370
   001481         148500 QAL-WRITE-F1-44.                                                 NC2064.2
   001482         148600     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001483         148700*                                                                 NC2064.2
   001484         148800 QAL-INIT-F1-45.                                                  NC2064.2
   001485         148900     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001486         149000     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001487         149100     MOVE "QAL-TEST-F1-45" TO PAR-NAME.                           NC2064.2 219
   001488         149200 QAL-TEST-F1-45.                                                  NC2064.2
   001489         149300     IF TBL-LEVEL-0C OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF       NC2064.2 107 104 103
   001490         149400         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   001491         149500         TO "5A4B3B2A1A0C"                                        NC2064.2
   001492      1  149600         PERFORM PASS                                             NC2064.2 369
   001493      1  149700         GO TO QAL-WRITE-F1-45.                                   NC2064.2 1504
   001494         149800     GO TO QAL-FAIL-F1-45.                                        NC2064.2 1498
   001495         149900 QAL-DELETE-F1-45.                                                NC2064.2
   001496         150000     PERFORM DE-LETE.                                             NC2064.2 371
   001497         150100     GO TO QAL-WRITE-F1-45.                                       NC2064.2 1504
   001498         150200 QAL-FAIL-F1-45.                                                  NC2064.2
   001499         150300     MOVE TBL-LEVEL-0C OF TABLE-LEVEL-1A OF TABLE-LEVEL-2A OF     NC2064.2 107 104 103
   001500         150400         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A       NC2064.2 102 82 41
   001501         150500         TO COMPUTED-A.                                           NC2064.2 230
   001502         150600     MOVE "5A4B3B2A1A0C" TO CORRECT-A.                            NC2064.2 244
   001503         150700     PERFORM FAIL.                                                NC2064.2 370
   001504         150800 QAL-WRITE-F1-45.                                                 NC2064.2
   001505         150900     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001506         151000*                                                                 NC2064.2
   001507         151100 QAL-INIT-F1-46.                                                  NC2064.2
   001508         151200     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001509         151300     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001510         151400     MOVE "QAL-TEST-F1-46" TO PAR-NAME.                           NC2064.2 219
   001511         151500 QAL-TEST-F1-46.                                                  NC2064.2
   001512         151600     IF TBL-LEVEL-0C IN TABLE-LEVEL-1B IN TABLE-LEVEL-2A IN       NC2064.2 111 108 103
   001513         151700         TABLE-LEVEL-3B OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   001514         151800         TO "5A4B3B2A1B0C"                                        NC2064.2
   001515      1  151900         PERFORM PASS                                             NC2064.2 369
   001516      1  152000         GO TO QAL-WRITE-F1-46.                                   NC2064.2 1527
   001517         152100     GO TO QAL-FAIL-F1-46.                                        NC2064.2 1521
   001518         152200 QAL-DELETE-F1-46.                                                NC2064.2
   001519         152300     PERFORM DE-LETE.                                             NC2064.2 371
   001520         152400     GO TO QAL-WRITE-F1-46.                                       NC2064.2 1527
   001521         152500 QAL-FAIL-F1-46.                                                  NC2064.2
   001522         152600     MOVE TBL-LEVEL-0C IN TABLE-LEVEL-1B IN TABLE-LEVEL-2A IN     NC2064.2 111 108 103
   001523         152700         TABLE-LEVEL-3B OF TABLE-LEVEL-4B IN TABLE-LEVEL-5A TO    NC2064.2 102 82 41
   001524         152800         COMPUTED-A.                                              NC2064.2 230
   001525         152900     MOVE "5A4B3B2A1B0C" TO CORRECT-A.                            NC2064.2 244
   001526         153000     PERFORM FAIL.                                                NC2064.2 370
   001527         153100 QAL-WRITE-F1-46.                                                 NC2064.2
   001528         153200     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001529         153300*                                                                 NC2064.2
   001530         153400 QAL-INIT-F1-47.                                                  NC2064.2
   001531         153500     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001532         153600     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001533         153700     MOVE "QAL-TEST-F1-47" TO PAR-NAME.                           NC2064.2 219
   001534         153800 QAL-TEST-F1-47.                                                  NC2064.2
   001535         153900     IF TBL-LEVEL-0C OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN       NC2064.2 116 113 112
   001536         154000         TABLE-LEVEL-3B IN TABLE-LEVEL-4B IN TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   001537         154100         TO "5A4B3B2B1A0C"                                        NC2064.2
   001538      1  154200         PERFORM PASS                                             NC2064.2 369
   001539      1  154300         GO TO QAL-WRITE-F1-47.                                   NC2064.2 1550
   001540         154400     GO TO QAL-FAIL-F1-47.                                        NC2064.2 1544
   001541         154500 QAL-DELETE-F1-47.                                                NC2064.2
   001542         154600     PERFORM DE-LETE.                                             NC2064.2 371
   001543         154700     GO TO QAL-WRITE-F1-47.                                       NC2064.2 1550
   001544         154800 QAL-FAIL-F1-47.                                                  NC2064.2
   001545         154900     MOVE "5A4B3B2B1A0C" TO CORRECT-A.                            NC2064.2 244
   001546         155000     MOVE TBL-LEVEL-0C OF TABLE-LEVEL-1A IN TABLE-LEVEL-2B IN     NC2064.2 116 113 112
   001547         155100         TABLE-LEVEL-3B IN TABLE-LEVEL-4B IN TABLE-LEVEL-5A TO    NC2064.2 102 82 41
   001548         155200         COMPUTED-A.                                              NC2064.2 230
   001549         155300     PERFORM FAIL.                                                NC2064.2 370
   001550         155400 QAL-WRITE-F1-47.                                                 NC2064.2
   001551         155500     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001552         155600*                                                                 NC2064.2
   001553         155700 QAL-INIT-F1-48.                                                  NC2064.2
   001554         155800     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001555         155900     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001556         156000     MOVE "QAL-TEST-F1-48" TO PAR-NAME.                           NC2064.2 219
   001557         156100 QAL-TEST-F1-48.                                                  NC2064.2
   001558         156200     IF TBL-LEVEL-0C IN TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF       NC2064.2 120 117 112
   001559         156300         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A EQUAL NC2064.2 102 82 41
   001560         156400         TO "5A4B3B2B1B0C"                                        NC2064.2
   001561      1  156500         PERFORM PASS                                             NC2064.2 369
   001562      1  156600         GO TO QAL-WRITE-F1-48.                                   NC2064.2 1573
   001563         156700     GO TO QAL-FAIL-F1-48.                                        NC2064.2 1567
   001564         156800 QAL-DELETE-F1-48.                                                NC2064.2
   001565         156900     PERFORM DE-LETE.                                             NC2064.2 371
   001566         157000     GO TO QAL-WRITE-F1-48.                                       NC2064.2 1573
   001567         157100 QAL-FAIL-F1-48.                                                  NC2064.2
   001568         157200     MOVE TBL-LEVEL-0C IN TABLE-LEVEL-1B OF TABLE-LEVEL-2B OF     NC2064.2 120 117 112
   001569         157300         TABLE-LEVEL-3B OF TABLE-LEVEL-4B OF TABLE-LEVEL-5A TO    NC2064.2 102 82 41
   001570         157400         COMPUTED-A.                                              NC2064.2 230
   001571         157500     MOVE "5A4B3B2B1B0C" TO CORRECT-A.                            NC2064.2 244
   001572         157600     PERFORM FAIL.                                                NC2064.2 370
   001573         157700 QAL-WRITE-F1-48.                                                 NC2064.2
   001574         157800     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001575         157900*                                                                 NC2064.2
   001576         158000 QAL-INIT-F1-49.                                                  NC2064.2
   001577         158100     MOVE "IV-19 4.3.8.1"  TO ANSI-REFERENCE.                     NC2064.2 275
   001578         158200     MOVE "QUAL LIMITS "   TO FEATURE.                            NC2064.2 215
   001579         158300     MOVE "QAL-TEST-F1-49" TO PAR-NAME.                           NC2064.2 219
   001580         158400 QAL-TEST-F1-49.                                                  NC2064.2
   001581         158500     IF TBL-LEVEL-0D EQUAL TO "5A4A3A2A1A0D"                      NC2064.2 49
   001582      1  158600         PERFORM PASS                                             NC2064.2 369
   001583      1  158700         GO TO QAL-WRITE-F1-49.                                   NC2064.2 1595
   001584         158800     GO TO QAL-FAIL-F1-49.                                        NC2064.2 1588
   001585         158900 QAL-DELETE-F1-49.                                                NC2064.2
   001586         159000     PERFORM DE-LETE.                                             NC2064.2 371
   001587         159100     GO TO QAL-WRITE-F1-49.                                       NC2064.2 1595
   001588         159200 QAL-FAIL-F1-49.                                                  NC2064.2
   001589         159300     MOVE "5A4A3A2A1A0D" TO CORRECT-A.                            NC2064.2 244
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001590         159400     MOVE TBL-LEVEL-0D IN TABLE-LEVEL-5A TO COMPUTED-A.           NC2064.2 49 41 230
   001591         159500*    NOTE  TBL-LEVEL-0D IS UNIQUE AND NEED NOT BE QUALIFIED       NC2064.2
   001592         159600*         HOWEVER, REFERENCE IS MADE TO IT BOTH QUALIFIED AND     NC2064.2
   001593         159700*         UNQUALIFIED TO INSURE THE ABILITY TO DO SO.             NC2064.2
   001594         159800     PERFORM FAIL.                                                NC2064.2 370
   001595         159900 QAL-WRITE-F1-49.                                                 NC2064.2
   001596         160000     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001597         160100*                                                                 NC2064.2
   001598         160200     PERFORM END-ROUTINE.                                         NC2064.2 394
   001599         160300*                                                                 NC2064.2
   001600         160400 SUB-INIT-F1-0.                                                   NC2064.2
   001601         160500     PERFORM END-ROUTINE.                                         NC2064.2 394
   001602         160600     MOVE "AA1122DD33" TO AX.                                     NC2064.2 201
   001603         160700     MOVE "IV-19 4.3.8.1"    TO ANSI-REFERENCE.                   NC2064.2 275
   001604         160800     MOVE "QUALIFIED SUBSCRIPTS" TO FEATURE.                      NC2064.2 215
   001605         160900*                                                                 NC2064.2
   001606         161000 SUB-INIT-F1-1.                                                   NC2064.2
   001607         161100     MOVE "SUB-TEST-F1-1" TO PAR-NAME.                            NC2064.2 219
   001608         161200 SUB-TEST-F1-1.                                                   NC2064.2
   001609         161300     IF AX-2 IN AX (CX-SUB OF CX) EQUAL TO "1"                    NC2064.2 203 201 210 209
   001610      1  161400         PERFORM PASS                                             NC2064.2 369
   001611      1  161500         GO TO SUB-WRITE-F1-1.                                    NC2064.2 1620
   001612         161600     GO TO SUB-FAIL-F1-1.                                         NC2064.2 1616
   001613         161700 SUB-DELETE-F1-1.                                                 NC2064.2
   001614         161800     PERFORM DE-LETE.                                             NC2064.2 371
   001615         161900     GO TO SUB-WRITE-F1-1.                                        NC2064.2 1620
   001616         162000 SUB-FAIL-F1-1.                                                   NC2064.2
   001617         162100     MOVE AX-2 IN AX (CX-SUB OF CX) TO COMPUTED-A.                NC2064.2 203 201 210 209 230
   001618         162200     MOVE 1 TO CORRECT-A.                                         NC2064.2 244
   001619         162300     PERFORM FAIL.                                                NC2064.2 370
   001620         162400 SUB-WRITE-F1-1.                                                  NC2064.2
   001621         162500     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001622         162600*                                                                 NC2064.2
   001623         162700 SUB-INIT-F1-2.                                                   NC2064.2
   001624         162800     MOVE "SUB-TEST-F1-2" TO PAR-NAME.                            NC2064.2 219
   001625         162900     MOVE "IV-19 4.3.8.1"    TO ANSI-REFERENCE.                   NC2064.2 275
   001626         163000     MOVE "QUALIFIED SUBSCRIPTS" TO FEATURE.                      NC2064.2 215
   001627         163100     MOVE 4 TO CX.                                                NC2064.2 209
   001628         163200     MOVE "DD" TO CORRECT-A.                                      NC2064.2 244
   001629         163300 SUB-TEST-F1-2.                                                   NC2064.2
   001630         163400     MOVE AX-1 OF AX (CX-SUB OF CX) TO COMPUTED-A.                NC2064.2 202 201 210 209 230
   001631         163500     IF COMPUTED-A EQUAL TO CORRECT-A                             NC2064.2 230 244
   001632      1  163600         PERFORM PASS                                             NC2064.2 369
   001633      1  163700         MOVE SPACE TO COMPUTED-A CORRECT-A                       NC2064.2 IMP 230 244
   001634      1  163800         GO TO   SUB-WRITE-F1-2.                                  NC2064.2 1641
   001635         163900     GO TO SUB-FAIL-F1-2.                                         NC2064.2 1639
   001636         164000 SUB-DELETE-F1-2.                                                 NC2064.2
   001637         164100     PERFORM DE-LETE.                                             NC2064.2 371
   001638         164200     GO TO SUB-WRITE-F1-2.                                        NC2064.2 1641
   001639         164300 SUB-FAIL-F1-2.                                                   NC2064.2
   001640         164400     PERFORM FAIL.                                                NC2064.2 370
   001641         164500 SUB-WRITE-F1-2.                                                  NC2064.2
   001642         164600     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001643         164700*                                                                 NC2064.2
   001644         164800 SUB-INIT-F1-3.                                                   NC2064.2
   001645         164900     MOVE "SUB-TEST-F1-3" TO PAR-NAME.                            NC2064.2 219
   001646         165000     MOVE "IV-19 4.3.8.1"    TO ANSI-REFERENCE.                   NC2064.2 275
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001647         165100     MOVE "QUALIFIED SUBSCRIPTS" TO FEATURE.                      NC2064.2 215
   001648         165200     MOVE 5 TO CX.                                                NC2064.2 209
   001649         165300     MOVE 5 TO AX-3 OF BX (1)  AX-2 OF BX (1).                    NC2064.2 208 205 207 205
   001650         165400     MOVE AX-1 IN BX (1) TO AX-1 OF AX (CX-SUB OF CX).            NC2064.2 206 205 202 201 210 209
   001651         165500 SUB-TEST-F1-3.                                                   NC2064.2
   001652         165600     IF AX-1 OF BX (1) EQUAL TO AX-1 IN AX (CX-SUB IN CX)         NC2064.2 206 205 202 201 210 209
   001653      1  165700         PERFORM PASS                                             NC2064.2 369
   001654      1  165800         GO TO SUB-WRITE-F1-3.                                    NC2064.2 1664
   001655         165900     GO TO SUB-FAIL-F1-3.                                         NC2064.2 1659
   001656         166000 SUB-DELETE-F1-3.                                                 NC2064.2
   001657         166100     PERFORM DE-LETE.                                             NC2064.2 371
   001658         166200     GO TO SUB-WRITE-F1-3.                                        NC2064.2 1664
   001659         166300 SUB-FAIL-F1-3.                                                   NC2064.2
   001660         166400     MOVE AX-1 OF BX (1) TO COMPUTED-A.                           NC2064.2 206 205 230
   001661         166500     MOVE AX-1 IN AX (CX-SUB IN CX) TO CORRECT-A.                 NC2064.2 202 201 210 209 244
   001662         166600     PERFORM FAIL.                                                NC2064.2 370
   001663         166700     MOVE "UNEQUAL COMPARISON" TO RE-MARK.                        NC2064.2 224
   001664         166800 SUB-WRITE-F1-3.                                                  NC2064.2
   001665         166900     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001666         167000*                                                                 NC2064.2
   001667         167100 SUB-INIT-F1-4.                                                   NC2064.2
   001668         167200     MOVE "IV-19 4.3.8.1"    TO ANSI-REFERENCE.                   NC2064.2 275
   001669         167300     MOVE "QUALIFIED SUBSCRIPTS" TO FEATURE.                      NC2064.2 215
   001670         167400     MOVE "SUB-TEST-F1-4" TO PAR-NAME.                            NC2064.2 219
   001671         167500     MOVE 1 TO CX.                                                NC2064.2 209
   001672         167600     MOVE 11 TO AX-1 OF BX (CX-SUB IN CX).                        NC2064.2 206 205 210 209
   001673         167700     ADD AX-3 IN BX (CX-SUB OF CX) TO AX-2 IN BX (CX-SUB IN CX).  NC2064.2 208 205 210 209 207 205 210 209
   001674         167800 SUB-TEST-F1-4.                                                   NC2064.2
   001675         167900     IF AX-2 IN BX (CX-SUB IN CX) EQUAL TO AX-2 IN AX (3)         NC2064.2 207 205 210 209 203 201
   001676      1  168000         PERFORM PASS                                             NC2064.2 369
   001677      1  168100         GO TO SUB-WRITE-F1-4.                                    NC2064.2 1687
   001678         168200     GO TO SUB-FAIL-F1-4.                                         NC2064.2 1682
   001679         168300 SUB-DELETE-F1-4.                                                 NC2064.2
   001680         168400     PERFORM DE-LETE.                                             NC2064.2 371
   001681         168500     GO TO SUB-WRITE-F1-4.                                        NC2064.2 1687
   001682         168600 SUB-FAIL-F1-4.                                                   NC2064.2
   001683         168700     MOVE AX-2 IN BX (CX-SUB IN CX) TO COMPUTED-A.                NC2064.2 207 205 210 209 230
   001684         168800     MOVE AX-2 IN AX (3) TO CORRECT-A.                            NC2064.2 203 201 244
   001685         168900     MOVE "UNEQUAL COMPARISON" TO RE-MARK.                        NC2064.2 224
   001686         169000     PERFORM FAIL.                                                NC2064.2 370
   001687         169100 SUB-WRITE-F1-4.                                                  NC2064.2
   001688         169200     PERFORM PRINT-DETAIL.                                        NC2064.2 373
   001689         169300 CCVS-EXIT SECTION.                                               NC2064.2
   001690         169400 CCVS-999999.                                                     NC2064.2
   001691         169500     GO TO CLOSE-FILES.                                           NC2064.2 362
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    33
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      275   ANSI-REFERENCE . . . . . . . .  447 454 463 M475 M498 M521 M544 M567 M590 M613 M636 M659 M682 M705 M728 M751
                                            M774 M797 M820 M843 M866 M889 M912 M935 M958 M981 M1002 M1025 M1048 M1071 M1094
                                            M1117 M1140 M1163 M1186 M1209 M1232 M1255 M1278 M1301 M1324 M1347 M1370 M1393
                                            M1416 M1439 M1462 M1485 M1508 M1531 M1554 M1577 M1603 M1625 M1646 M1668
      201   AX . . . . . . . . . . . . . .  M1602 1609 1617 1630 1650 1652 1661 1675 1684
      202   AX-1 . . . . . . . . . . . . .  1630 M1650 1652 1661
      206   AX-1 . . . . . . . . . . . . .  1650 1652 1660 M1672
      203   AX-2 . . . . . . . . . . . . .  1609 1617 1675 1684
      207   AX-2 . . . . . . . . . . . . .  M1649 M1673 1675 1683
      204   AX-3
      208   AX-3 . . . . . . . . . . . . .  M1649 1673
      205   BX . . . . . . . . . . . . . .  1649 1649 1650 1652 1660 1672 1673 1673 1675 1683
      254   CCVS-C-1 . . . . . . . . . . .  391 433
      259   CCVS-C-2 . . . . . . . . . . .  392 434
      309   CCVS-E-1 . . . . . . . . . . .  397
      314   CCVS-E-2 . . . . . . . . . . .  406 413 420 425
      317   CCVS-E-2-2 . . . . . . . . . .  M405
      322   CCVS-E-3 . . . . . . . . . . .  426
      331   CCVS-E-4 . . . . . . . . . . .  405
      332   CCVS-E-4-1 . . . . . . . . . .  M403
      334   CCVS-E-4-2 . . . . . . . . . .  M404
      276   CCVS-H-1 . . . . . . . . . . .  386
      281   CCVS-H-2A. . . . . . . . . . .  387
      290   CCVS-H-2B. . . . . . . . . . .  388
      302   CCVS-H-3 . . . . . . . . . . .  389
      352   CCVS-PGM-ID. . . . . . . . . .  358 358
      236   CM-18V0
      230   COMPUTED-A . . . . . . . . . .  231 233 234 235 236 459 462 M491 M514 M537 M560 M583 M606 M629 M652 M675 M698
                                            M722 M744 M767 M790 M814 M836 M859 M882 M905 M928 M951 M974 M992 M1018 M1041
                                            M1064 M1088 M1110 M1133 M1156 M1180 M1202 M1225 M1248 M1271 M1294 M1317 M1340
                                            M1363 M1386 M1409 M1432 M1456 M1478 M1501 M1524 M1548 M1570 M1590 M1617 M1630
                                            1631 M1633 M1660 M1683
      231   COMPUTED-N
      229   COMPUTED-X . . . . . . . . . .  M381 445
      233   COMPUTED-0V18
      235   COMPUTED-14V4
      237   COMPUTED-18V0
      234   COMPUTED-4V14
      253   COR-ANSI-REFERENCE . . . . . .  M454 M456
      244   CORRECT-A. . . . . . . . . . .  245 246 247 248 249 460 462 M492 M515 M538 M561 M584 M607 M630 M653 M676 M699
                                            M719 M745 M768 M791 M811 M837 M860 M883 M906 M929 M952 M975 M993 M1019 M1042
                                            M1065 M1085 M1111 M1134 M1157 M1177 M1203 M1226 M1249 M1272 M1295 M1318 M1341
                                            M1364 M1387 M1410 M1433 M1453 M1479 M1502 M1525 M1545 M1571 M1589 M1618 M1628
                                            1631 M1633 M1661 M1684
      245   CORRECT-N
      243   CORRECT-X. . . . . . . . . . .  M382 446
      246   CORRECT-0V18
      248   CORRECT-14V4
      250   CORRECT-18V0
      247   CORRECT-4V14
      249   CR-18V0
      209   CX . . . . . . . . . . . . . .  1609 1617 M1627 1630 M1648 1650 1652 1661 M1671 1672 1673 1673 1675 1683
      210   CX-SUB . . . . . . . . . . . .  1609 1617 1630 1650 1652 1661 1672 1673 1673 1675 1683
      212   CX-SUB
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    34
0 Defined   Cross-reference of data names   References

0     267   DELETE-COUNTER . . . . . . . .  M371 400 416 418
      222   DOTVALUE . . . . . . . . . . .  M376
      273   DUMMY-HOLD . . . . . . . . . .  M430 436
       38   DUMMY-RECORD . . . . . . . . .  M386 M387 M388 M389 M391 M392 M393 M395 M397 M406 M413 M420 M425 M426 430 M431
                                            432 M433 M434 M435 M436 440 M441 M449 M464
      211   DX
      320   ENDER-DESC . . . . . . . . . .  M408 M419 M424
      268   ERROR-COUNTER. . . . . . . . .  M370 399 409 412
      272   ERROR-HOLD . . . . . . . . . .  M399 M400 M400 M401 404
      318   ERROR-TOTAL. . . . . . . . . .  M410 M412 M417 M418 M422 M423
      215   FEATURE. . . . . . . . . . . .  M476 M499 M522 M545 M568 M591 M614 M637 M660 M683 M706 M729 M752 M775 M798 M821
                                            M844 M867 M890 M913 M936 M959 M982 M1003 M1026 M1049 M1072 M1095 M1118 M1141
                                            M1164 M1187 M1210 M1233 M1256 M1279 M1302 M1325 M1348 M1371 M1394 M1417 M1440
                                            M1463 M1486 M1509 M1532 M1555 M1578 M1604 M1626 M1647 M1669
      346   HYPHEN-LINE. . . . . . . . . .  393 395 435
      312   ID-AGAIN . . . . . . . . . . .  M358
      345   INF-ANSI-REFERENCE . . . . . .  M447 M450 M463 M465
      340   INFO-TEXT. . . . . . . . . . .  M448
      269   INSPECT-COUNTER. . . . . . . .  M368 399 421 423
       40   MAX-NAME-1
      217   P-OR-F . . . . . . . . . . . .  M368 M369 M370 M371 378 M381
      219   PAR-NAME . . . . . . . . . . .  M383 M477 M500 M523 M546 M569 M592 M615 M638 M661 M684 M707 M730 M753 M776 M799
                                            M822 M845 M868 M891 M914 M937 M960 M983 M1004 M1027 M1050 M1073 M1096 M1119 M1142
                                            M1165 M1188 M1211 M1234 M1257 M1280 M1303 M1326 M1349 M1372 M1395 M1418 M1441
                                            M1464 M1487 M1510 M1533 M1556 M1579 M1607 M1624 M1645 M1670
      221   PARDOT-X . . . . . . . . . . .  M375
      270   PASS-COUNTER . . . . . . . . .  M369 401 403
       36   PRINT-FILE . . . . . . . . . .  32 357 363
       37   PRINT-REC. . . . . . . . . . .  M377 M453 M455
      200   QUAL-SUB-TABLE
      224   RE-MARK. . . . . . . . . . . .  M372 M384 M1663 M1685
      266   REC-CT . . . . . . . . . . . .  374 376 383
      265   REC-SKL-SUB
      274   RECORD-COUNT . . . . . . . . .  M428 429 M437
       45   TABLE-LEVEL-1A . . . . . . . .  479 489 847 857 1213 1223
       55   TABLE-LEVEL-1A . . . . . . . .  525 535 893 903 1259 1269
       65   TABLE-LEVEL-1A . . . . . . . .  571 581 939 949 1305 1315
       74   TABLE-LEVEL-1A . . . . . . . .  617 627 985 990 1351 1361
       85   TABLE-LEVEL-1A . . . . . . . .  663 673 1029 1039 1397 1407
       94   TABLE-LEVEL-1A . . . . . . . .  709 720 1075 1086 1443 1454
      104   TABLE-LEVEL-1A . . . . . . . .  755 765 1121 1131 1489 1499
      113   TABLE-LEVEL-1A . . . . . . . .  801 812 1167 1178 1535 1546
      125   TABLE-LEVEL-1A
      134   TABLE-LEVEL-1A
      144   TABLE-LEVEL-1A
      153   TABLE-LEVEL-1A
      164   TABLE-LEVEL-1A
      173   TABLE-LEVEL-1A
      183   TABLE-LEVEL-1A
      192   TABLE-LEVEL-1A
       50   TABLE-LEVEL-1B . . . . . . . .  502 512 870 880 1236 1246
       59   TABLE-LEVEL-1B . . . . . . . .  548 558 916 926 1282 1292
       69   TABLE-LEVEL-1B . . . . . . . .  594 604 962 972 1328 1338
       78   TABLE-LEVEL-1B . . . . . . . .  640 650 1006 1016 1374 1384
       89   TABLE-LEVEL-1B . . . . . . . .  686 696 1052 1062 1420 1430
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    35
0 Defined   Cross-reference of data names   References

0      98   TABLE-LEVEL-1B . . . . . . . .  732 742 1098 1108 1466 1476
      108   TABLE-LEVEL-1B . . . . . . . .  778 788 1144 1154 1512 1522
      117   TABLE-LEVEL-1B . . . . . . . .  824 834 1190 1200 1558 1568
      129   TABLE-LEVEL-1B
      138   TABLE-LEVEL-1B
      148   TABLE-LEVEL-1B
      157   TABLE-LEVEL-1B
      168   TABLE-LEVEL-1B
      177   TABLE-LEVEL-1B
      187   TABLE-LEVEL-1B
      196   TABLE-LEVEL-1B
       44   TABLE-LEVEL-2A . . . . . . . .  479 489 502 512 847 857 870 880 1213 1223 1236 1246
       64   TABLE-LEVEL-2A . . . . . . . .  571 581 594 604 939 949 962 972 1305 1315 1328 1338
       84   TABLE-LEVEL-2A . . . . . . . .  663 673 686 696 1029 1039 1052 1062 1397 1407 1420 1430
      103   TABLE-LEVEL-2A . . . . . . . .  755 765 778 788 1121 1131 1144 1154 1489 1499 1512 1522
      124   TABLE-LEVEL-2A
      143   TABLE-LEVEL-2A
      163   TABLE-LEVEL-2A
      182   TABLE-LEVEL-2A
       54   TABLE-LEVEL-2B . . . . . . . .  525 535 548 558 893 903 916 926 1259 1269 1282 1292
       73   TABLE-LEVEL-2B . . . . . . . .  617 627 640 650 985 990 1006 1016 1351 1361 1374 1384
       93   TABLE-LEVEL-2B . . . . . . . .  709 720 732 742 1075 1086 1098 1108 1443 1454 1466 1476
      112   TABLE-LEVEL-2B . . . . . . . .  801 812 824 834 1167 1178 1190 1200 1535 1546 1558 1568
      133   TABLE-LEVEL-2B
      152   TABLE-LEVEL-2B
      172   TABLE-LEVEL-2B
      191   TABLE-LEVEL-2B
       43   TABLE-LEVEL-3A . . . . . . . .  480 490 503 513 526 536 549 559 848 858 871 881 894 904 917 927 1214 1224 1237
                                            1247 1260 1270 1283 1293
       83   TABLE-LEVEL-3A . . . . . . . .  664 674 687 697 710 721 733 743 1030 1040 1053 1063 1076 1087 1099 1109 1398
                                            1408 1421 1431 1444 1455 1467 1477
      123   TABLE-LEVEL-3A
      162   TABLE-LEVEL-3A
       63   TABLE-LEVEL-3B . . . . . . . .  572 582 595 605 618 628 641 651 940 950 963 973 986 991 1007 1017 1306 1316 1329
                                            1339 1352 1362 1375 1385
      102   TABLE-LEVEL-3B . . . . . . . .  756 766 779 789 802 813 825 835 1122 1132 1145 1155 1168 1179 1191 1201 1490
                                            1500 1513 1523 1536 1547 1559 1569
      142   TABLE-LEVEL-3B
      181   TABLE-LEVEL-3B
       42   TABLE-LEVEL-4A . . . . . . . .  480 490 503 513 526 536 549 559 572 582 595 605 618 628 641 651 848 858 871 881
                                            894 904 917 927 940 950 963 973 986 991 1007 1017 1214 1224 1237 1247 1260 1270
                                            1283 1293 1306 1316 1329 1339 1352 1362 1375 1385
      122   TABLE-LEVEL-4A
       82   TABLE-LEVEL-4B . . . . . . . .  664 674 687 697 710 721 733 743 756 766 779 789 802 813 825 835 1030 1040 1053
                                            1063 1076 1087 1099 1109 1122 1132 1145 1155 1168 1179 1191 1201 1398 1408 1421
                                            1431 1444 1455 1467 1477 1490 1500 1513 1523 1536 1547 1559 1569
      161   TABLE-LEVEL-4B
       41   TABLE-LEVEL-5A . . . . . . . .  480 490 503 513 526 536 549 559 572 582 595 605 618 628 641 651 664 674 687 697
                                            710 721 733 743 756 766 779 789 802 813 825 835 848 858 871 881 894 904 917 927
                                            940 950 963 973 986 991 1007 1017 1030 1040 1053 1063 1076 1087 1099 1109 1122
                                            1132 1145 1155 1168 1179 1191 1201 1214 1224 1237 1247 1260 1270 1283 1293 1306
                                            1316 1329 1339 1352 1362 1375 1385 1398 1408 1421 1431 1444 1455 1467 1477 1490
                                            1500 1513 1523 1536 1547 1559 1569 1590
      121   TABLE-LEVEL-5B
       46   TBL-LEVEL-0A . . . . . . . . .  479 489
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    36
0 Defined   Cross-reference of data names   References

0      51   TBL-LEVEL-0A . . . . . . . . .  502 512
       56   TBL-LEVEL-0A . . . . . . . . .  525 535
       60   TBL-LEVEL-0A . . . . . . . . .  548 558
       66   TBL-LEVEL-0A . . . . . . . . .  571 581
       70   TBL-LEVEL-0A . . . . . . . . .  594 604
       75   TBL-LEVEL-0A . . . . . . . . .  617 627
       79   TBL-LEVEL-0A . . . . . . . . .  640 650
       86   TBL-LEVEL-0A . . . . . . . . .  663 673
       90   TBL-LEVEL-0A . . . . . . . . .  686 696
       95   TBL-LEVEL-0A . . . . . . . . .  709 720
       99   TBL-LEVEL-0A . . . . . . . . .  732 742
      105   TBL-LEVEL-0A . . . . . . . . .  755 765
      109   TBL-LEVEL-0A . . . . . . . . .  778 788
      114   TBL-LEVEL-0A . . . . . . . . .  801 812
      118   TBL-LEVEL-0A . . . . . . . . .  824 834
      126   TBL-LEVEL-0A
      130   TBL-LEVEL-0A
      135   TBL-LEVEL-0A
      139   TBL-LEVEL-0A
      145   TBL-LEVEL-0A
      149   TBL-LEVEL-0A
      154   TBL-LEVEL-0A
      158   TBL-LEVEL-0A
      165   TBL-LEVEL-0A
      169   TBL-LEVEL-0A
      174   TBL-LEVEL-0A
      178   TBL-LEVEL-0A
      184   TBL-LEVEL-0A
      188   TBL-LEVEL-0A
      193   TBL-LEVEL-0A
      197   TBL-LEVEL-0A
       47   TBL-LEVEL-0B . . . . . . . . .  847 857
       52   TBL-LEVEL-0B . . . . . . . . .  870 880
       57   TBL-LEVEL-0B . . . . . . . . .  893 903
       61   TBL-LEVEL-0B . . . . . . . . .  916 926
       67   TBL-LEVEL-0B . . . . . . . . .  939 949
       71   TBL-LEVEL-0B . . . . . . . . .  962 972
       76   TBL-LEVEL-0B . . . . . . . . .  985 990
       80   TBL-LEVEL-0B . . . . . . . . .  1006 1016
       87   TBL-LEVEL-0B . . . . . . . . .  1029 1039
       91   TBL-LEVEL-0B . . . . . . . . .  1052 1062
       96   TBL-LEVEL-0B . . . . . . . . .  1075 1086
      100   TBL-LEVEL-0B . . . . . . . . .  1098 1108
      106   TBL-LEVEL-0B . . . . . . . . .  1121 1131
      110   TBL-LEVEL-0B . . . . . . . . .  1144 1154
      115   TBL-LEVEL-0B . . . . . . . . .  1167 1178
      119   TBL-LEVEL-0B . . . . . . . . .  1190 1200
      127   TBL-LEVEL-0B
      131   TBL-LEVEL-0B
      136   TBL-LEVEL-0B
      140   TBL-LEVEL-0B
      146   TBL-LEVEL-0B
      150   TBL-LEVEL-0B
      155   TBL-LEVEL-0B
      159   TBL-LEVEL-0B
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    37
0 Defined   Cross-reference of data names   References

0     166   TBL-LEVEL-0B
      170   TBL-LEVEL-0B
      175   TBL-LEVEL-0B
      179   TBL-LEVEL-0B
      185   TBL-LEVEL-0B
      189   TBL-LEVEL-0B
      194   TBL-LEVEL-0B
      198   TBL-LEVEL-0B
       48   TBL-LEVEL-0C . . . . . . . . .  1213 1223
       53   TBL-LEVEL-0C . . . . . . . . .  1236 1246
       58   TBL-LEVEL-0C . . . . . . . . .  1259 1269
       62   TBL-LEVEL-0C . . . . . . . . .  1282 1292
       68   TBL-LEVEL-0C . . . . . . . . .  1305 1315
       72   TBL-LEVEL-0C . . . . . . . . .  1328 1338
       77   TBL-LEVEL-0C . . . . . . . . .  1351 1361
       81   TBL-LEVEL-0C . . . . . . . . .  1374 1384
       88   TBL-LEVEL-0C . . . . . . . . .  1397 1407
       92   TBL-LEVEL-0C . . . . . . . . .  1420 1430
       97   TBL-LEVEL-0C . . . . . . . . .  1443 1454
      101   TBL-LEVEL-0C . . . . . . . . .  1466 1476
      107   TBL-LEVEL-0C . . . . . . . . .  1489 1499
      111   TBL-LEVEL-0C . . . . . . . . .  1512 1522
      116   TBL-LEVEL-0C . . . . . . . . .  1535 1546
      120   TBL-LEVEL-0C . . . . . . . . .  1558 1568
      128   TBL-LEVEL-0C
      132   TBL-LEVEL-0C
      137   TBL-LEVEL-0C
      141   TBL-LEVEL-0C
      147   TBL-LEVEL-0C
      151   TBL-LEVEL-0C
      156   TBL-LEVEL-0C
      160   TBL-LEVEL-0C
      167   TBL-LEVEL-0C
      171   TBL-LEVEL-0C
      176   TBL-LEVEL-0C
      180   TBL-LEVEL-0C
      186   TBL-LEVEL-0C
      190   TBL-LEVEL-0C
      195   TBL-LEVEL-0C
      199   TBL-LEVEL-0C
       49   TBL-LEVEL-0D . . . . . . . . .  1581 1590
      225   TEST-COMPUTED. . . . . . . . .  453
      240   TEST-CORRECT . . . . . . . . .  455
      293   TEST-ID. . . . . . . . . . . .  M358
      213   TEST-RESULTS . . . . . . . . .  M359 377
      271   TOTAL-ERROR
      342   XXCOMPUTED . . . . . . . . . .  M462
      344   XXCORRECT. . . . . . . . . . .  M462
      337   XXINFO . . . . . . . . . . . .  449 464
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    38
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

      458   BAIL-OUT . . . . . . . . . . .  P380
      466   BAIL-OUT-EX. . . . . . . . . .  E380 G460
      461   BAIL-OUT-WRITE . . . . . . . .  G459
      442   BLANK-LINE-PRINT
     1689   CCVS-EXIT
     1690   CCVS-999999
      355   CCVS1
      467   CCVS1-EXIT . . . . . . . . . .  G361
      362   CLOSE-FILES. . . . . . . . . .  G1691
      390   COLUMN-NAMES-ROUTINE . . . . .  E360
      371   DE-LETE. . . . . . . . . . . .  P486 P509 P532 P555 P578 P601 P624 P647 P670 P693 P716 P739 P762 P785 P808 P831
                                            P854 P877 P900 P923 P946 P969 P997 P1013 P1036 P1059 P1082 P1105 P1128 P1151
                                            P1174 P1197 P1220 P1243 P1266 P1289 P1312 P1335 P1358 P1381 P1404 P1427 P1450
                                            P1473 P1496 P1519 P1542 P1565 P1586 P1614 P1637 P1657 P1680
      394   END-ROUTINE. . . . . . . . . .  P363 P1598 P1601
      398   END-ROUTINE-1
      407   END-ROUTINE-12
      415   END-ROUTINE-13 . . . . . . . .  E363
      396   END-RTN-EXIT
      370   FAIL . . . . . . . . . . . . .  P493 P516 P539 P562 P585 P608 P631 P654 P677 P700 P723 P746 P769 P792 P815 P838
                                            P861 P884 P907 P930 P953 P976 P994 P1020 P1043 P1066 P1089 P1112 P1135 P1158
                                            P1181 P1204 P1227 P1250 P1273 P1296 P1319 P1342 P1365 P1388 P1411 P1434 P1457
                                            P1480 P1503 P1526 P1549 P1572 P1594 P1619 P1640 P1662 P1686
      444   FAIL-ROUTINE . . . . . . . . .  P379
      457   FAIL-ROUTINE-EX. . . . . . . .  E379 G451
      452   FAIL-ROUTINE-WRITE . . . . . .  G445 G446
      385   HEAD-ROUTINE . . . . . . . . .  P360
      368   INSPT
      470   NC-06-001
      356   OPEN-FILES
      369   PASS . . . . . . . . . . . . .  P482 P505 P528 P551 P574 P597 P620 P643 P666 P689 P712 P735 P758 P781 P804 P827
                                            P850 P873 P896 P919 P942 P965 P988 P1009 P1032 P1055 P1078 P1101 P1124 P1147
                                            P1170 P1193 P1216 P1239 P1262 P1285 P1308 P1331 P1354 P1377 P1400 P1423 P1446
                                            P1469 P1492 P1515 P1538 P1561 P1582 P1610 P1632 P1653 P1676
      373   PRINT-DETAIL . . . . . . . . .  P495 P518 P541 P564 P587 P610 P633 P656 P679 P702 P725 P748 P771 P794 P817 P840
                                            P863 P886 P909 P932 P955 P978 P999 P1022 P1045 P1068 P1091 P1114 P1137 P1160
                                            P1183 P1206 P1229 P1252 P1275 P1298 P1321 P1344 P1367 P1390 P1413 P1436 P1459
                                            P1482 P1505 P1528 P1551 P1574 P1596 P1621 P1642 P1665 P1688
      485   QAL-DELETE-F1-1
      692   QAL-DELETE-F1-10
      715   QAL-DELETE-F1-11
      738   QAL-DELETE-F1-12
      761   QAL-DELETE-F1-13
      784   QAL-DELETE-F1-14
      807   QAL-DELETE-F1-15
      830   QAL-DELETE-F1-16
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    39
0 Defined   Cross-reference of procedures   References

0     853   QAL-DELETE-F1-17
      876   QAL-DELETE-F1-18
      899   QAL-DELETE-F1-19
      508   QAL-DELETE-F1-2
      922   QAL-DELETE-F1-20
      945   QAL-DELETE-F1-21
      968   QAL-DELETE-F1-22
      996   QAL-DELETE-F1-23
     1012   QAL-DELETE-F1-24
     1035   QAL-DELETE-F1-25
     1058   QAL-DELETE-F1-26
     1081   QAL-DELETE-F1-27
     1104   QAL-DELETE-F1-28
     1127   QAL-DELETE-F1-29
      531   QAL-DELETE-F1-3
     1150   QAL-DELETE-F1-30
     1173   QAL-DELETE-F1-31
     1196   QAL-DELETE-F1-32
     1219   QAL-DELETE-F1-33
     1242   QAL-DELETE-F1-34
     1265   QAL-DELETE-F1-35
     1288   QAL-DELETE-F1-36
     1311   QAL-DELETE-F1-37
     1334   QAL-DELETE-F1-38
     1357   QAL-DELETE-F1-39
      554   QAL-DELETE-F1-4
     1380   QAL-DELETE-F1-40
     1403   QAL-DELETE-F1-41
     1426   QAL-DELETE-F1-42
     1449   QAL-DELETE-F1-43
     1472   QAL-DELETE-F1-44
     1495   QAL-DELETE-F1-45
     1518   QAL-DELETE-F1-46
     1541   QAL-DELETE-F1-47
     1564   QAL-DELETE-F1-48
     1585   QAL-DELETE-F1-49
      577   QAL-DELETE-F1-5
      600   QAL-DELETE-F1-6
      623   QAL-DELETE-F1-7
      646   QAL-DELETE-F1-8
      669   QAL-DELETE-F1-9
      488   QAL-FAIL-F1-1. . . . . . . . .  G484
      695   QAL-FAIL-F1-10 . . . . . . . .  G691
      718   QAL-FAIL-F1-11 . . . . . . . .  G714
      741   QAL-FAIL-F1-12 . . . . . . . .  G737
      764   QAL-FAIL-F1-13 . . . . . . . .  G760
      787   QAL-FAIL-F1-14 . . . . . . . .  G783
      810   QAL-FAIL-F1-15 . . . . . . . .  G806
      833   QAL-FAIL-F1-16 . . . . . . . .  G829
      856   QAL-FAIL-F1-17 . . . . . . . .  G852
      879   QAL-FAIL-F1-18 . . . . . . . .  G875
      902   QAL-FAIL-F1-19 . . . . . . . .  G898
      511   QAL-FAIL-F1-2. . . . . . . . .  G507
      925   QAL-FAIL-F1-20 . . . . . . . .  G921
      948   QAL-FAIL-F1-21 . . . . . . . .  G944
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    40
0 Defined   Cross-reference of procedures   References

0     971   QAL-FAIL-F1-22 . . . . . . . .  G967
     1015   QAL-FAIL-F1-24 . . . . . . . .  G1011
     1038   QAL-FAIL-F1-25 . . . . . . . .  G1034
     1061   QAL-FAIL-F1-26 . . . . . . . .  G1057
     1084   QAL-FAIL-F1-27 . . . . . . . .  G1080
     1107   QAL-FAIL-F1-28 . . . . . . . .  G1103
     1130   QAL-FAIL-F1-29 . . . . . . . .  G1126
      534   QAL-FAIL-F1-3. . . . . . . . .  G530
     1153   QAL-FAIL-F1-30 . . . . . . . .  G1149
     1176   QAL-FAIL-F1-31 . . . . . . . .  G1172
     1199   QAL-FAIL-F1-32 . . . . . . . .  G1195
     1222   QAL-FAIL-F1-33 . . . . . . . .  G1218
     1245   QAL-FAIL-F1-34 . . . . . . . .  G1241
     1268   QAL-FAIL-F1-35 . . . . . . . .  G1264
     1291   QAL-FAIL-F1-36 . . . . . . . .  G1287
     1314   QAL-FAIL-F1-37 . . . . . . . .  G1310
     1337   QAL-FAIL-F1-38 . . . . . . . .  G1333
     1360   QAL-FAIL-F1-39 . . . . . . . .  G1356
      557   QAL-FAIL-F1-4. . . . . . . . .  G553
     1383   QAL-FAIL-F1-40 . . . . . . . .  G1379
     1406   QAL-FAIL-F1-41 . . . . . . . .  G1402
     1429   QAL-FAIL-F1-42 . . . . . . . .  G1425
     1452   QAL-FAIL-F1-43 . . . . . . . .  G1448
     1475   QAL-FAIL-F1-44 . . . . . . . .  G1471
     1498   QAL-FAIL-F1-45 . . . . . . . .  G1494
     1521   QAL-FAIL-F1-46 . . . . . . . .  G1517
     1544   QAL-FAIL-F1-47 . . . . . . . .  G1540
     1567   QAL-FAIL-F1-48 . . . . . . . .  G1563
     1588   QAL-FAIL-F1-49 . . . . . . . .  G1584
      580   QAL-FAIL-F1-5. . . . . . . . .  G576
      603   QAL-FAIL-F1-6. . . . . . . . .  G599
      626   QAL-FAIL-F1-7. . . . . . . . .  G622
      649   QAL-FAIL-F1-8. . . . . . . . .  G645
      672   QAL-FAIL-F1-9. . . . . . . . .  G668
      474   QAL-INIT-F1-1
      681   QAL-INIT-F1-10
      704   QAL-INIT-F1-11
      727   QAL-INIT-F1-12
      750   QAL-INIT-F1-13
      773   QAL-INIT-F1-14
      796   QAL-INIT-F1-15
      819   QAL-INIT-F1-16
      842   QAL-INIT-F1-17
      865   QAL-INIT-F1-18
      888   QAL-INIT-F1-19
      497   QAL-INIT-F1-2
      911   QAL-INIT-F1-20
      934   QAL-INIT-F1-21
      957   QAL-INIT-F1-22
      980   QAL-INIT-F1-23
     1001   QAL-INIT-F1-24
     1024   QAL-INIT-F1-25
     1047   QAL-INIT-F1-26
     1070   QAL-INIT-F1-27
     1093   QAL-INIT-F1-28
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    41
0 Defined   Cross-reference of procedures   References

0    1116   QAL-INIT-F1-29
      520   QAL-INIT-F1-3
     1139   QAL-INIT-F1-30
     1162   QAL-INIT-F1-31
     1185   QAL-INIT-F1-32
     1208   QAL-INIT-F1-33
     1231   QAL-INIT-F1-34
     1254   QAL-INIT-F1-35
     1277   QAL-INIT-F1-36
     1300   QAL-INIT-F1-37
     1323   QAL-INIT-F1-38
     1346   QAL-INIT-F1-39
      543   QAL-INIT-F1-4
     1369   QAL-INIT-F1-40
     1392   QAL-INIT-F1-41
     1415   QAL-INIT-F1-42
     1438   QAL-INIT-F1-43
     1461   QAL-INIT-F1-44
     1484   QAL-INIT-F1-45
     1507   QAL-INIT-F1-46
     1530   QAL-INIT-F1-47
     1553   QAL-INIT-F1-48
     1576   QAL-INIT-F1-49
      566   QAL-INIT-F1-5
      589   QAL-INIT-F1-6
      612   QAL-INIT-F1-7
      635   QAL-INIT-F1-8
      658   QAL-INIT-F1-9
      478   QAL-TEST-F1-1
      685   QAL-TEST-F1-10
      708   QAL-TEST-F1-11
      731   QAL-TEST-F1-12
      754   QAL-TEST-F1-13
      777   QAL-TEST-F1-14
      800   QAL-TEST-F1-15
      823   QAL-TEST-F1-16
      846   QAL-TEST-F1-17
      869   QAL-TEST-F1-18
      892   QAL-TEST-F1-19
      501   QAL-TEST-F1-2
      915   QAL-TEST-F1-20
      938   QAL-TEST-F1-21
      961   QAL-TEST-F1-22
      984   QAL-TEST-F1-23
     1005   QAL-TEST-F1-24
     1028   QAL-TEST-F1-25
     1051   QAL-TEST-F1-26
     1074   QAL-TEST-F1-27
     1097   QAL-TEST-F1-28
     1120   QAL-TEST-F1-29
      524   QAL-TEST-F1-3
     1143   QAL-TEST-F1-30
     1166   QAL-TEST-F1-31
     1189   QAL-TEST-F1-32
     1212   QAL-TEST-F1-33
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    42
0 Defined   Cross-reference of procedures   References

0    1235   QAL-TEST-F1-34
     1258   QAL-TEST-F1-35
     1281   QAL-TEST-F1-36
     1304   QAL-TEST-F1-37
     1327   QAL-TEST-F1-38
     1350   QAL-TEST-F1-39
      547   QAL-TEST-F1-4
     1373   QAL-TEST-F1-40
     1396   QAL-TEST-F1-41
     1419   QAL-TEST-F1-42
     1442   QAL-TEST-F1-43
     1465   QAL-TEST-F1-44
     1488   QAL-TEST-F1-45
     1511   QAL-TEST-F1-46
     1534   QAL-TEST-F1-47
     1557   QAL-TEST-F1-48
     1580   QAL-TEST-F1-49
      570   QAL-TEST-F1-5
      593   QAL-TEST-F1-6
      616   QAL-TEST-F1-7
      639   QAL-TEST-F1-8
      662   QAL-TEST-F1-9
      494   QAL-WRITE-F1-1 . . . . . . . .  G483 G487
      701   QAL-WRITE-F1-10. . . . . . . .  G690 G694
      724   QAL-WRITE-F1-11. . . . . . . .  G713 G717
      747   QAL-WRITE-F1-12. . . . . . . .  G736 G740
      770   QAL-WRITE-F1-13. . . . . . . .  G759 G763
      793   QAL-WRITE-F1-14. . . . . . . .  G782 G786
      816   QAL-WRITE-F1-15. . . . . . . .  G805 G809
      839   QAL-WRITE-F1-16. . . . . . . .  G828 G832
      862   QAL-WRITE-F1-17. . . . . . . .  G851 G855
      885   QAL-WRITE-F1-18. . . . . . . .  G874 G878
      908   QAL-WRITE-F1-19. . . . . . . .  G897 G901
      517   QAL-WRITE-F1-2 . . . . . . . .  G506 G510
      931   QAL-WRITE-F1-20. . . . . . . .  G920 G924
      954   QAL-WRITE-F1-21. . . . . . . .  G943 G947
      977   QAL-WRITE-F1-22. . . . . . . .  G966 G970
      998   QAL-WRITE-F1-23. . . . . . . .  G989 G995
     1021   QAL-WRITE-F1-24. . . . . . . .  G1010 G1014
     1044   QAL-WRITE-F1-25. . . . . . . .  G1033 G1037
     1067   QAL-WRITE-F1-26. . . . . . . .  G1056 G1060
     1090   QAL-WRITE-F1-27. . . . . . . .  G1079 G1083
     1113   QAL-WRITE-F1-28. . . . . . . .  G1102 G1106
     1136   QAL-WRITE-F1-29. . . . . . . .  G1125 G1129
      540   QAL-WRITE-F1-3 . . . . . . . .  G529 G533
     1159   QAL-WRITE-F1-30. . . . . . . .  G1148 G1152
     1182   QAL-WRITE-F1-31. . . . . . . .  G1171 G1175
     1205   QAL-WRITE-F1-32. . . . . . . .  G1194 G1198
     1228   QAL-WRITE-F1-33. . . . . . . .  G1217 G1221
     1251   QAL-WRITE-F1-34. . . . . . . .  G1240 G1244
     1274   QAL-WRITE-F1-35. . . . . . . .  G1263 G1267
     1297   QAL-WRITE-F1-36. . . . . . . .  G1286 G1290
     1320   QAL-WRITE-F1-37. . . . . . . .  G1309 G1313
     1343   QAL-WRITE-F1-38. . . . . . . .  G1332 G1336
     1366   QAL-WRITE-F1-39. . . . . . . .  G1355 G1359
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    43
0 Defined   Cross-reference of procedures   References

0     563   QAL-WRITE-F1-4 . . . . . . . .  G552 G556
     1389   QAL-WRITE-F1-40. . . . . . . .  G1378 G1382
     1412   QAL-WRITE-F1-41. . . . . . . .  G1401 G1405
     1435   QAL-WRITE-F1-42. . . . . . . .  G1424 G1428
     1458   QAL-WRITE-F1-43. . . . . . . .  G1447 G1451
     1481   QAL-WRITE-F1-44. . . . . . . .  G1470 G1474
     1504   QAL-WRITE-F1-45. . . . . . . .  G1493 G1497
     1527   QAL-WRITE-F1-46. . . . . . . .  G1516 G1520
     1550   QAL-WRITE-F1-47. . . . . . . .  G1539 G1543
     1573   QAL-WRITE-F1-48. . . . . . . .  G1562 G1566
     1595   QAL-WRITE-F1-49. . . . . . . .  G1583 G1587
      586   QAL-WRITE-F1-5 . . . . . . . .  G575 G579
      609   QAL-WRITE-F1-6 . . . . . . . .  G598 G602
      632   QAL-WRITE-F1-7 . . . . . . . .  G621 G625
      655   QAL-WRITE-F1-8 . . . . . . . .  G644 G648
      678   QAL-WRITE-F1-9 . . . . . . . .  G667 G671
      469   SECT-NC206A-001
     1613   SUB-DELETE-F1-1
     1636   SUB-DELETE-F1-2
     1656   SUB-DELETE-F1-3
     1679   SUB-DELETE-F1-4
     1616   SUB-FAIL-F1-1. . . . . . . . .  G1612
     1639   SUB-FAIL-F1-2. . . . . . . . .  G1635
     1659   SUB-FAIL-F1-3. . . . . . . . .  G1655
     1682   SUB-FAIL-F1-4. . . . . . . . .  G1678
     1600   SUB-INIT-F1-0
     1606   SUB-INIT-F1-1
     1623   SUB-INIT-F1-2
     1644   SUB-INIT-F1-3
     1667   SUB-INIT-F1-4
     1608   SUB-TEST-F1-1
     1629   SUB-TEST-F1-2
     1651   SUB-TEST-F1-3
     1674   SUB-TEST-F1-4
     1620   SUB-WRITE-F1-1 . . . . . . . .  G1611 G1615
     1641   SUB-WRITE-F1-2 . . . . . . . .  G1634 G1638
     1664   SUB-WRITE-F1-3 . . . . . . . .  G1654 G1658
     1687   SUB-WRITE-F1-4 . . . . . . . .  G1677 G1681
      366   TERMINATE-CALL
      364   TERMINATE-CCVS
      427   WRITE-LINE . . . . . . . . . .  P377 P378 P386 P387 P388 P389 P391 P392 P393 P395 P397 P406 P414 P420 P425 P426
                                            P449 P453 P455 P464
      439   WRT-LN . . . . . . . . . . . .  P433 P434 P435 P438 P443
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    44
0 Defined   Cross-reference of programs     References

       17   NC206A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC206A    Date 06/04/2022  Time 12:00:31   Page    45
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    474  IGYPS2015-I   The paragraph or section prior to paragraph or section "QAL-INIT-F1-1" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC206A:
 *    Source records = 1691
 *    Data Division statements = 236
 *    Procedure Division statements = 829
 *    Generated COBOL statements = 0
 *    Program complexity factor = 852
0End of compilation 1,  program NC206A,  highest severity 0.
0Return code 0
