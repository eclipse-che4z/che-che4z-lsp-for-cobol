1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:12   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:12   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         EXEC84.2
   000002         000200                                                                  EXEC84.2
   000003         000400 PROGRAM-ID.                                                      EXEC84.2
   000004         000500     EXEC85.                                                      EXEC84.2
   000005         000600 INSTALLATION.                                                    EXEC84.2
   000006         000700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".EXEC84.2
   000007         000800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".EXEC84.2
   000008         000900 ENVIRONMENT DIVISION.                                            EXEC84.2
   000009         001000                                                                  EXEC84.2
   000010         001200*                                                              *  EXEC84.2
   000011         001300*    VALIDATION FOR:-                                          *  EXEC84.2
   000012         001400*                                                              *  EXEC84.2
   000013         001500*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".EXEC84.2
   000014         001600*                                                              *  EXEC84.2
   000015         001700*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".EXEC84.2
   000016         001800*                                                              *  EXEC84.2
   000017         002000 CONFIGURATION SECTION.                                           EXEC84.2
   000018         002100                                                                  EXEC84.2
   000019         002200 SPECIAL-NAMES.                                                   EXEC84.2
   000020         002300 INPUT-OUTPUT SECTION.                                            EXEC84.2
   000021         002400 FILE-CONTROL.                                                    EXEC84.2
   000022         002500     SELECT  OPTIONAL POPULATION-FILE                             EXEC84.2 40
   000023         002600     ASSIGN TO                                                    EXEC84.2
   000024         002700     XXXXX001.                                                    EXEC84.2
   000025         002800     SELECT  SOURCE-COBOL-PROGRAMS                                EXEC84.2 51
   000026         002900     ASSIGN TO                                                    EXEC84.2
   000027         003000     XXXXX002                                                     EXEC84.2
   000028         003100     ORGANIZATION SEQUENTIAL.                                     EXEC84.2
   000029         003200     SELECT  UPDATED-POPULATION-FILE                              EXEC84.2 56
   000030         003300     ASSIGN TO                                                    EXEC84.2
   000031         003400     XXXXX003.                                                    EXEC84.2
   000032         003500     SELECT  PRINT-FILE                                           EXEC84.2 47
   000033         003600     ASSIGN TO                                                    EXEC84.2
   000034         003700     XXXXX055.                                                    EXEC84.2
   000035         003800     SELECT  CONTROL-CARD-FILE                                    EXEC84.2 45
   000036         003900     ASSIGN TO                                                    EXEC84.2
   000037         004000     XXXXX058.                                                    EXEC84.2
   000038         004100 DATA DIVISION.                                                   EXEC84.2
   000039         004200 FILE SECTION.                                                    EXEC84.2
   000040         004300 FD  POPULATION-FILE.                                             EXEC84.2

 ==000040==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "POPULATION-FILE".

   000041         004400*    RECORD CONTAINS 2400 CHARACTERS.                             EXEC84.2
   000042         004500 01  SOURCE-IN-2400.                                              EXEC84.2
   000043         004600     02 SOURCE-IN                    PIC X(80).                   EXEC84.2
   000044         004700*                                              OCCURS 30.         EXEC84.2
   000045         004800 FD  CONTROL-CARD-FILE.                                           EXEC84.2

 ==000045==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "CONTROL-CARD-FILE".

   000046         004900 01  CONTROL-RECORD                  PIC X(80).                   EXEC84.2
   000047         005000 FD  PRINT-FILE.                                                  EXEC84.2

 ==000047==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000048         005100 01  PRINT-REC.                                                   EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000049         005200   05        FILLER                  PIC X.                       EXEC84.2
   000050         005300   05        PRINT-DATA              PIC X(131).                  EXEC84.2
   000051         005400 FD  SOURCE-COBOL-PROGRAMS                                        EXEC84.2

 ==000051==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "SOURCE-COBOL-PROGRAMS".

   000052         005500     BLOCK CONTAINS 1 RECORDS.                                    EXEC84.2
   000053         005600 01  CT-OUT.                                                      EXEC84.2
   000054         005700     02 FILLER PIC X(72).                                         EXEC84.2
   000055         005800     02 FILLER PIC X(8).                                          EXEC84.2
   000056         005900 FD  UPDATED-POPULATION-FILE                                      EXEC84.2

 ==000056==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "UPDATED-POPULATION-FILE".

   000057         006000     RECORD CONTAINS 2400 CHARACTERS.                             EXEC84.2
   000058         006100 01  UPDATED-SOURCE-OUT-2400.                                     EXEC84.2
   000059         006200     02 UD-SOURCE-OUT                PIC X(80)  OCCURS 30.        EXEC84.2
   000060         006300                                                                  EXEC84.2
   000061         006400 WORKING-STORAGE SECTION.                                         EXEC84.2
   000062         006500                                                                  EXEC84.2
   000063         006600 01  FILLER                          PIC X(40)  VALUE             EXEC84.2
   000064         006700            "NEWEXEC WORKING-STORAGE STARTS HERE ==->".           EXEC84.2
   000065         006800 01  BLOCK-TYPE                      PIC X(5).                    EXEC84.2
   000066         006900 01  SUB1                            PIC S9(3)  COMP.             EXEC84.2
   000067         007000 01  SUB2                            PIC S9(3)  COMP.             EXEC84.2
   000068         007100 01  SUB3                            PIC S9(3)  COMP.             EXEC84.2
   000069         007200 01  SUB4                            PIC S9(3)  COMP.             EXEC84.2
   000070         007300 01  SUB5                            PIC S9(3)  COMP.             EXEC84.2
   000071         007400 01  SUB6                            PIC S9(3)  COMP.             EXEC84.2
   000072         007500 01  SUB7                            PIC S9(3)  COMP.             EXEC84.2
   000073         007600 01  WA-ERR-IND                      PIC 9 VALUE ZEROES.          EXEC84.2 IMP
   000074         007700 01  WA-FIRST-IND                    PIC 9 VALUE ZEROES.          EXEC84.2 IMP
   000075         007800 01  WA-ZCARD-TABLE.                                              EXEC84.2
   000076         007900   05        WA-ZCARD                OCCURS 10                    EXEC84.2
   000077         008000                                     PIC X(60).                   EXEC84.2
   000078         008100 01  WA-TOP-OF-PAGE-LINE.                                         EXEC84.2
   000079         008200   05        FILLER                  PIC X(4)   VALUE SPACES.     EXEC84.2 IMP
   000080         008300   05        WA-VERSION.                                          EXEC84.2
   000081         008400     07      WA-VERSION-TEXT         PIC X(22)  VALUE             EXEC84.2
   000082         008500            "CCVS85 VERSION NUMBER ".                             EXEC84.2
   000083         008600     07      WA-VERSION-NUM          PIC X(3) VALUE SPACES.       EXEC84.2 IMP
   000084         008700   05        WA-RELEASE.                                          EXEC84.2
   000085         008800     07      WA-RELEASE-TEXT         PIC X(14)  VALUE             EXEC84.2
   000086         008900            ", RELEASED ON ".                                     EXEC84.2
   000087         009000     07      WA-VERSION-DATE         PIC X(11) VALUE SPACES.      EXEC84.2 IMP
   000088         009100   05        FILLER                  PIC X(4)   VALUE SPACES.     EXEC84.2 IMP
   000089         009200   05        WA-COMPANY-AND-COMPILER PIC X(30) VALUE SPACES.      EXEC84.2 IMP
   000090         009300   05        FILLER                  PIC X(5)   VALUE SPACES.     EXEC84.2 IMP
   000091         009400   05        WA-DATE                 PIC XXBXXBXX.                EXEC84.2
   000092         009500   05        FILLER                  PIC X(4)   VALUE SPACES.     EXEC84.2 IMP
   000093         009600   05        FILLER                  PIC X(5)   VALUE "PAGE ".    EXEC84.2
   000094         009700   05        WA-PAGE-CT              PIC Z(5)9.                   EXEC84.2
   000095         009800                                                                  EXEC84.2
   000096         009900 01  WA-ACCT-LINE-1.                                              EXEC84.2
   000097         010000   05        FILLER                  PIC X(19)  VALUE             EXEC84.2
   000098         010100            " ** END OF PROGRAM ".                                EXEC84.2
   000099         010200   05        WA-CURRENT-PROG         PIC X(6).                    EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000100         010300   05        FILLER                  PIC X(32)  VALUE             EXEC84.2
   000101         010400            " FOUND,  COBOL LINES PROCESSED: ".                   EXEC84.2
   000102         010500   05        WA-LINES-COBOL          PIC Z(5)9.                   EXEC84.2
   000103         010600 01  WA-ACCT-LINE-2.                                              EXEC84.2
   000104         010700   05        FILLER                  PIC X(19)  VALUE             EXEC84.2
   000105         010800            " ** LINES INSERTED ".                                EXEC84.2
   000106         010900   05        WA-LINES-INSERTED       PIC Z(5)9.                   EXEC84.2
   000107         011000   05        FILLER                  PIC X(19)  VALUE             EXEC84.2
   000108         011100            " ** LINES REPLACED ".                                EXEC84.2
   000109         011200   05        WA-LINES-REPLACED       PIC Z(5)9.                   EXEC84.2
   000110         011300   05        FILLER                  PIC X(19)  VALUE             EXEC84.2
   000111         011400            " ** LINES DELETED  ".                                EXEC84.2
   000112         011500   05        WA-LINES-DELETED        PIC Z(5)9.                   EXEC84.2
   000113         011600 01  WA-ACCT-LINE-3.                                              EXEC84.2
   000114         011700   05        FILLER                  PIC X(18)  VALUE             EXEC84.2
   000115         011800            " ** OPTIONAL CODE ".                                 EXEC84.2
   000116         011900   05        WA-OPTIONAL-CODE        PIC X(8).                    EXEC84.2
   000117         012000   05        WA-CODE-REMOVED         PIC Z(5)9.                   EXEC84.2
   000118         012100   05        WA-CODE-KILLED          PIC X(21)  VALUE             EXEC84.2
   000119         012200            " ** COMMENTS DELETED ".                              EXEC84.2
   000120         012300   05        WA-COMMENTS-DEL         PIC Z(5)9.                   EXEC84.2
   000121         012400 01  WA-FINAL-LINE-1.                                             EXEC84.2
   000122         012500   05        FILLER                  PIC X(34)  VALUE             EXEC84.2
   000123         012600            " ** END OF POPULATION FILE REACHED".                 EXEC84.2
   000124         012700   05        FILLER                  PIC X(27)  VALUE             EXEC84.2
   000125         012800            " NUMBER OF PROGRAMS FOUND: ".                        EXEC84.2
   000126         012900   05        WA-PROGS-FOUND          PIC Z(5)9.                   EXEC84.2
   000127         013000 01  WA-FINAL-LINE-2.                                             EXEC84.2
   000128         013100   05        FILLER                  PIC X(47)  VALUE             EXEC84.2
   000129         013200            " ** NUMBER OF PROGRAMS WRITTEN TO SOURCE FILE: ".    EXEC84.2
   000130         013300   05        WA-SOURCE-PROGS         PIC Z(5)9.                   EXEC84.2
   000131         013400 01  WA-FINAL-LINE-3.                                             EXEC84.2
   000132         013500   05        FILLER                  PIC X(48)  VALUE             EXEC84.2
   000133         013600            " ** NUMBER OF PROGRAMS WRITTEN TO NEW POPULATION".   EXEC84.2
   000134         013700   05        FILLER                  PIC X(7)   VALUE " FILE: ".  EXEC84.2
   000135         013800   05        WA-NEWPOP-PROGS         PIC Z(5)9.                   EXEC84.2
   000136         013900 01  WB-CONTROL-DATA.                                             EXEC84.2
   000137         014000   05        WB-FILL                 PIC X(80).                   EXEC84.2
   000138         014100   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000139         014200     10      WB-3                    PIC X(3).                    EXEC84.2
   000140         014300     10      FILLER                  PIC X(77).                   EXEC84.2
   000141         014400   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000142         014500     10      WB-4                    PIC X(4).                    EXEC84.2
   000143         014600     10      WB-NN                   PIC 99.                      EXEC84.2
   000144         014700     10      FILLER                  PIC X.                       EXEC84.2
   000145         014800     10      WB-X                    PIC X.                       EXEC84.2
   000146         014900     10      FILLER                  PIC X(72).                   EXEC84.2
   000147         015000   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000148         015100     10      WB-6                    PIC X(6).                    EXEC84.2
   000149         015200     10      FILLER                  PIC X(74).                   EXEC84.2
   000150         015300   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000151         015400     10      WB-7                    PIC X(7).                    EXEC84.2
   000152         015500     10      FILLER                  PIC X(73).                   EXEC84.2
   000153         015600   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000154         015700     10      WB-8                    PIC X(8).                    EXEC84.2
   000155         015800     10      FILLER                  PIC X(72).                   EXEC84.2
   000156         015900   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000157         016000     10      WB-9                    PIC X(9).                    EXEC84.2
   000158         016100     10      FILLER                  PIC X(71).                   EXEC84.2
   000159         016200   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000160         016300     10      WB-10                   PIC X(10).                   EXEC84.2
   000161         016400     10      FILLER                  PIC X(70).                   EXEC84.2
   000162         016500   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000163         016600     10      WB-11                   PIC X(11).                   EXEC84.2
   000164         016700     10      FILLER                  PIC X(69).                   EXEC84.2
   000165         016800   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000166         016900     10      WB-12                   PIC X(12).                   EXEC84.2
   000167         017000     10      FILLER                  PIC X.                       EXEC84.2
   000168         017100     10      WB-PROG                 PIC X(5).                    EXEC84.2
   000169         017200     10      FILLER                  PIC X(62).                   EXEC84.2
   000170         017300   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000171         017400     10      WB-13                   PIC X(13).                   EXEC84.2
   000172         017500     10      FILLER                  PIC X(67).                   EXEC84.2
   000173         017600   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000174         017700     10      WB-14                   PIC X(14).                   EXEC84.2
   000175         017800     10      FILLER                  PIC X.                       EXEC84.2
   000176         017900     10      WB-MODULE               PIC XX.                      EXEC84.2
   000177         018000     10      FILLER                  PIC X.                       EXEC84.2
   000178         018100     10      WB-LEVEL                PIC X.                       EXEC84.2
   000179         018200     10      FILLER                  PIC X(61).                   EXEC84.2
   000180         018300   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000181         018400     10      WB-15                   PIC X(15).                   EXEC84.2
   000182         018500     10      FILLER                  PIC X(65).                   EXEC84.2
   000183         018600   05        FILLER                  REDEFINES  WB-FILL.          EXEC84.2 137
   000184         018700     10      WB-16                   PIC X(16).                   EXEC84.2
   000185         018800     10      FILLER                  PIC X(64).                   EXEC84.2
   000186         018900   05        WB-X-CARD               REDEFINES  WB-FILL.          EXEC84.2 137
   000187         019000     10      WB-X-HYPHEN             PIC XX.                      EXEC84.2
   000188         019100     10      WB-X-CARD-NUM           PIC 9(3).                    EXEC84.2
   000189         019200     10      WB-PROG-POS.                                         EXEC84.2
   000190         019300       15    WB-PROG-POS-NUM         PIC 99.                      EXEC84.2
   000191         019400     10      FILLER                  PIC X.                       EXEC84.2
   000192         019500     10      WB-SUBS-TEXT            PIC X(60).                   EXEC84.2
   000193         019600     10      FILLER                  PIC X(12).                   EXEC84.2
   000194         019700   05        WB-START-CARD           REDEFINES  WB-FILL.          EXEC84.2 137
   000195         019800     10      WB-STAR-START           PIC X(6).                    EXEC84.2
   000196         019900     10      FILLER                  PIC X.                       EXEC84.2
   000197         020000     10      WB-UPDATE-PROG          PIC X(6).                    EXEC84.2
   000198         020100     10      FILLER                  PIC X.                       EXEC84.2
   000199         020200     10      WB-RENUMBER             PIC X.                       EXEC84.2
   000200         020300     10      FILLER                  PIC X(65).                   EXEC84.2
   000201         020400   05        WB-LINE-UPDATE          REDEFINES  WB-FILL.          EXEC84.2 137
   000202         020500     10      WB-SEQ-1                PIC X(6).                    EXEC84.2
   000203         020600     10      WB-COBOL-LINE           PIC X(74).                   EXEC84.2
   000204         020700     10      FILLER                  REDEFINES  WB-COBOL-LINE.    EXEC84.2 203
   000205         020800       15    WB-COL-7                PIC X.                       EXEC84.2
   000206         020900       15    FILLER                  PIC X(73).                   EXEC84.2
   000207         021000     10      FILLER                  REDEFINES  WB-COBOL-LINE.    EXEC84.2 203

 ==000207==> IGYDS1073-I "FILLER" redefined a larger item.

   000208         021100       15    WB-CHAR                 PIC X.                       EXEC84.2
   000209         021200       15    WB-SEQ-2                PIC X(6).                    EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000210         021300/                                                                 EXEC84.2
   000211         021400 01  WC-CURRENT-POP-RECORD.                                       EXEC84.2
   000212         021500   05        WC-1.                                                EXEC84.2
   000213         021600     10      WC-END-OF-POPFILE       PIC X(16).                   EXEC84.2
   000214         021700     10      FILLER                  PIC X(64).                   EXEC84.2
   000215         021800   05        WC-HEADER               REDEFINES WC-1.              EXEC84.2 212
   000216         021900     10      WC-STAR-HEADER          PIC X(7).                    EXEC84.2
   000217         022000     10      FILLER                  PIC X.                       EXEC84.2
   000218         022100     10      WC-COBOL                PIC X(5).                    EXEC84.2
   000219         022200     10      FILLER                  PIC X.                       EXEC84.2
   000220         022300     10      WC-PROG-ID.                                          EXEC84.2
   000221         022400      12     WC-PROG-ID-1-5.                                      EXEC84.2
   000222         022500       15    WC-PROG-ID-1-4.                                      EXEC84.2
   000223         022600        18   WC-MODULE               PIC XX.                      EXEC84.2
   000224         022700        18   WC-LEVEL                PIC X.                       EXEC84.2
   000225         022800        18   FILLER                  PIC X.                       EXEC84.2
   000226         022900       15    FILLER                  PIC X.                       EXEC84.2
   000227         023000      12     WC-PROG-ID-6            PIC X.                       EXEC84.2
   000228         023100     10      FILLER                  PIC X.                       EXEC84.2
   000229         023200     10      WC-SUBPRG               PIC X(6).                    EXEC84.2
   000230         023300     10      FILLER                  PIC X.                       EXEC84.2
   000231         023400     10      WC-PROG2ID.                                          EXEC84.2
   000232         023500      12     WC-PROG2ID-1-5          PIC X(5).                    EXEC84.2
   000233         023600      12     FILLER                  PIC X.                       EXEC84.2
   000234         023700     10      FILLER                  PIC X(46).                   EXEC84.2
   000235         023800   05        FILLER                  REDEFINES WC-1.              EXEC84.2 212
   000236         023900     10      WC-1-72.                                             EXEC84.2
   000237         024000       15    WC-6.                                                EXEC84.2
   000238         024100         20  WC-STAR                 PIC X.                       EXEC84.2
   000239         024200         20  FILLER                  PIC X(5).                    EXEC84.2
   000240         024300       15    FILLER                  REDEFINES  WC-6.             EXEC84.2 237
   000241         024400         20  WC-1-5                  PIC X(5).                    EXEC84.2
   000242         024500         20  FILLER                  PIC X.                       EXEC84.2
   000243         024600       15    WC-COL-7                PIC X.                       EXEC84.2
   000244         024700       15    WC-COL-8                PIC X.                       EXEC84.2
   000245         024800       15    FILLER                  PIC X(3).                    EXEC84.2
   000246         024900       15    WC-SUB-DATA.                                         EXEC84.2
   000247         025000         20  WC-12-15                PIC X(4).                    EXEC84.2
   000248         025100         20  FILLER                  PIC X.                       EXEC84.2
   000249         025200         20  WC-17-19                PIC 9(3).                    EXEC84.2
   000250         025300         20  WC-20                   PIC X.                       EXEC84.2
   000251         025400         20  FILLER                  PIC X(52).                   EXEC84.2
   000252         025500     10      WC-73-80                PIC X(8).                    EXEC84.2
   000253         025600                                                                  EXEC84.2
   000254         025700 01  WD-SOURCE-REC.                                               EXEC84.2
   000255         025800   05        WD-1.                                                EXEC84.2
   000256         025900     10      FILLER                  PIC X(6).                    EXEC84.2
   000257         026000     10      WD-HEADER               PIC X(74).                   EXEC84.2
   000258         026100                                                                  EXEC84.2
   000259         026200 01  WE-PRINT-DATA.                                               EXEC84.2
   000260         026300   05        WE-COBOL-LINE           PIC X(80).                   EXEC84.2
   000261         026400   05        FILLER                  PIC X      VALUE SPACE.      EXEC84.2 IMP
   000262         026500   05        WE-X-CARD               PIC X(9).                    EXEC84.2
   000263         026600   05        FILLER                  PIC XX     VALUE SPACES.     EXEC84.2 IMP
   000264         026700   05        WE-CHANGE-TYPE          PIC X(12).                   EXEC84.2
   000265         026800                                                                  EXEC84.2
   000266         026900 01  WF-PROGRAM-SELECTED-TABLE.                                   EXEC84.2
   000267         027000   05        WF-PROGRAM-SELECTED     PIC X(5)   OCCURS 50.        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000268         027100                                                                  EXEC84.2
   000269         027200 01  WG-MODULE-SELECTED-TABLE.                                    EXEC84.2
   000270         027300   05        FILLER                             OCCURS 10.        EXEC84.2
   000271         027400     10      WG-MODULE-SELECTED      PIC XX.                      EXEC84.2
   000272         027500     10      WG-MODULE-LEVEL         PIC X.                       EXEC84.2
   000273         027600                                                                  EXEC84.2
   000274         027700 01  WV-PRINT-MISCELLANEOUS.                                      EXEC84.2
   000275         027800   05        WV-OPTION-HEADING       PIC X(25)  VALUE             EXEC84.2
   000276         027900            " OPTION SWITCH SETTINGS -".                          EXEC84.2
   000277         028000   05        WV-OPT-1                PIC X(40)  VALUE             EXEC84.2
   000278         028100         " 0                 1                   2".              EXEC84.2
   000279         028200   05        WV-OPT-2                PIC X(52)  VALUE             EXEC84.2
   000280         028300         " 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6".  EXEC84.2
   000281         028400   05        WV-OPT-SWITCHES.                                     EXEC84.2
   000282         028500     10      FILLER                  PIC X      VALUE SPACE.      EXEC84.2 IMP
   000283         028600     10      FILLER                  OCCURS 26.                   EXEC84.2
   000284         028700       15    WV-OPT                  PIC X.                       EXEC84.2
   000285         028800       15    FILLER                  PIC X.                       EXEC84.2
   000286         028900 01  WX-X-CARD-TABLE.                                             EXEC84.2
   000287         029000   05        WX-X-CARD               OCCURS 200.                  EXEC84.2
   000288         029100     10      WX-X-CHAR               PIC X                        EXEC84.2
   000289         029200                                     OCCURS 60.                   EXEC84.2
   000290         029300 01  WX-PROG-POS-TABLE.                                           EXEC84.2
   000291         029400   05        WX-PROG-POS             OCCURS 200                   EXEC84.2
   000292         029500                                     PIC 99.                      EXEC84.2
   000293         029600 01  WY-SWITCHES.                                                 EXEC84.2
   000294         029700   05        WY-OPTION-SWITCHES.                                  EXEC84.2
   000295         029800     10      WY-OPT-SW-1             PIC X.                       EXEC84.2
   000296         029900     10      WY-OPT-SW-2             PIC X.                       EXEC84.2
   000297         030000     10      WY-OPT-SW-3             PIC X.                       EXEC84.2
   000298         030100     10      WY-OPT-SW-4             PIC X.                       EXEC84.2
   000299         030200     10      WY-OPT-SW-5             PIC X.                       EXEC84.2
   000300         030300     10      WY-OPT-SW-6             PIC X.                       EXEC84.2
   000301         030400     10      WY-OPT-SW-7             PIC X.                       EXEC84.2
   000302         030500     10      WY-OPT-SW-8             PIC X.                       EXEC84.2
   000303         030600     10      WY-OPT-SW-9             PIC X.                       EXEC84.2
   000304         030700     10      WY-OPT-SW-10            PIC X.                       EXEC84.2
   000305         030800     10      WY-OPT-SW-11            PIC X.                       EXEC84.2
   000306         030900     10      WY-OPT-SW-12            PIC X.                       EXEC84.2
   000307         031000     10      WY-OPT-SW-13            PIC X.                       EXEC84.2
   000308         031100     10      WY-OPT-SW-14            PIC X.                       EXEC84.2
   000309         031200     10      WY-OPT-SW-15            PIC X.                       EXEC84.2
   000310         031300     10      WY-OPT-SW-16            PIC X.                       EXEC84.2
   000311         031400     10      WY-OPT-SW-17            PIC X.                       EXEC84.2
   000312         031500     10      WY-OPT-SW-18            PIC X.                       EXEC84.2
   000313         031600     10      WY-OPT-SW-19            PIC X.                       EXEC84.2
   000314         031700     10      WY-OPT-SW-20            PIC X.                       EXEC84.2
   000315         031800     10      WY-OPT-SW-21            PIC X.                       EXEC84.2
   000316         031900     10      WY-OPT-SW-22            PIC X.                       EXEC84.2
   000317         032000     10      WY-OPT-SW-23            PIC X.                       EXEC84.2
   000318         032100     10      WY-OPT-SW-24            PIC X.                       EXEC84.2
   000319         032200     10      WY-OPT-SW-25            PIC X.                       EXEC84.2
   000320         032300     10      WY-OPT-SW-26            PIC X.                       EXEC84.2
   000321         032400   05        FILLER                  REDEFINES WY-OPTION-SWITCHES.EXEC84.2 294
   000322         032500     10      WY-OPT-SW               PIC X                        EXEC84.2
   000323         032600                                     OCCURS 26.                   EXEC84.2
   000324         032700   05        WY-PRINT-SWITCHES.                                   EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000325         032800     10      WY-EXTRACT-ALL          PIC X.                       EXEC84.2
   000326         032900     10      WY-EXTRACT-AUTO         PIC X.                       EXEC84.2
   000327         033000     10      WY-EXTRACT-MAN          PIC X.                       EXEC84.2
   000328         033100     10      WY-KILL-DELETIONS       PIC X.                       EXEC84.2
   000329         033200     10      WY-LIST-NO-UPDATES      PIC X.                       EXEC84.2
   000330         033300     10      WY-LIST-X-CARDS         PIC X.                       EXEC84.2
   000331         033400     10      WY-LIST-PROGRAMS        PIC X.                       EXEC84.2
   000332         033500     10      WY-LIST-COMPACT         PIC X.                       EXEC84.2
   000333         033600     10      WY-NO-DATA              PIC X.                       EXEC84.2
   000334         033700     10      WY-NO-LIBRARY           PIC X.                       EXEC84.2
   000335         033800     10      WY-NO-SOURCE            PIC X.                       EXEC84.2
   000336         033900     10      WY-REMOVE-COMMENTS      PIC X.                       EXEC84.2
   000337         034000     10      WY-NEW-POP              PIC X.                       EXEC84.2
   000338         034100     10      WY-SELECT-PROG          PIC X.                       EXEC84.2
   000339         034200     10      WY-SELECT-MODULE        PIC X.                       EXEC84.2
   000340         034300     10      WY-SELECT-LEVEL         PIC X.                       EXEC84.2
   000341         034400                                                                  EXEC84.2
   000342         034500 01  WZ-MISCELLANEOUS.                                            EXEC84.2
   000343         034600   05        WZ-PROGRAM-SELECTED     PIC X.                       EXEC84.2
   000344         034700   05        WZ-END-OF-POPFILE       PIC X.                       EXEC84.2
   000345         034800   05        WZ-FULL-STOP            PIC X.                       EXEC84.2
   000346         034900   05        WZ-DONT-READ-POPFILE    PIC X.                       EXEC84.2
   000347         035000   05        WZ-UPDATE-THIS-PROG     PIC X.                       EXEC84.2
   000348         035100   05        WZ-REPLACE-FLAG         PIC X.                       EXEC84.2
   000349         035200   05        WZ-LINE-UPDATE          PIC X.                       EXEC84.2
   000350         035300   05        WZ-RESEQUENCE-THIS      PIC X.                       EXEC84.2
   000351         035400   05        WZ-RESEQUENCE-NEXT      PIC X.                       EXEC84.2
   000352         035500   05        WZ-END-OF-UPDATES       PIC X.                       EXEC84.2
   000353         035600   05        WZ-OPTIONAL-SELECTED    PIC X.                       EXEC84.2
   000354         035700   05        WZ-DELETE-FLAG          PIC X.                       EXEC84.2
   000355         035800   05        WZ-NOT-THIS-COMMENT     PIC X.                       EXEC84.2
   000356         035900   05        WZ-CURRENT-HEADER       PIC X(5).                    EXEC84.2
   000357         036000   05        WZ-INVALID-DATA.                                     EXEC84.2
   000358         036100     10      FILLER                  PIC X(20).                   EXEC84.2
   000359         036200     10      WZ-ERROR-MESSAGE        PIC X(60).                   EXEC84.2
   000360         036300   05        WZ-CURRENT-UPD-PROG.                                 EXEC84.2
   000361         036400     10      WZ-UPD-PROG-CHAR        PIC X.                       EXEC84.2
   000362         036500     10      FILLER                  PIC X(5).                    EXEC84.2
   000363         036600   05        WZ-CURRENT-MAIN-PROG.                                EXEC84.2
   000364         036700     10      WZ-MAIN-PROG-CHAR       PIC X      OCCURS 6.         EXEC84.2
   000365         036800   05        WZ-PROG-BREAK.                                       EXEC84.2
   000366         036900     10      WZ-1CHAR                PIC X      OCCURS 6.         EXEC84.2
   000367         037000   05        WZ-CURRENT-POP-PROG.                                 EXEC84.2
   000368         037100     10      FILLER                  PIC X(5).                    EXEC84.2
   000369         037200     10      WZ-PROG-ID-6            PIC X.                       EXEC84.2
   000370         037300   05        WZ-MAIN-PROG-FLAG       PIC X.                       EXEC84.2
   000371         037400   05        WZ-LINES-COBOL          PIC 9(6).                    EXEC84.2
   000372         037500   05        WZ-LINES-INSERTED       PIC 9(6).                    EXEC84.2
   000373         037600   05        WZ-LINES-REPLACED       PIC 9(6).                    EXEC84.2
   000374         037700   05        WZ-LINES-DELETED        PIC 9(6).                    EXEC84.2
   000375         037800   05        WZ-COMMENTS-DELETED     PIC 9(6).                    EXEC84.2
   000376         037900   05        WZ-CODE-REMOVED         PIC 9(6).                    EXEC84.2
   000377         038000   05        WZ-SOURCE-PROGS         PIC 9(6).                    EXEC84.2
   000378         038100   05        WZ-NEWPOP-PROGS         PIC 9(6).                    EXEC84.2
   000379         038200   05        WZ-PROGS-FOUND          PIC 9(6).                    EXEC84.2
   000380         038300   05        WZ-COMMENTS-DEL         PIC 9(6).                    EXEC84.2
   000381         038400   05        WZ-SEQ-NO               PIC 9(6).                    EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000382         038500   05        WZ-SAVE-POP-RECORD.                                  EXEC84.2
   000383         038600     10      WZ-SAVE-SEQ             PIC X(6).                    EXEC84.2
   000384         038700     10      FILLER                  PIC X(5).                    EXEC84.2
   000385         038800     10      WZ-SAVE-12-20.                                       EXEC84.2
   000386         038900       15    WZ-SAVE-12-15           PIC X(4).                    EXEC84.2
   000387         039000       15    FILLER                  PIC X(5).                    EXEC84.2
   000388         039100     10      FILLER                  PIC X(60).                   EXEC84.2
   000389         039200   05        WZ-PAGE-CT              PIC 9(6).                    EXEC84.2
   000390         039300   05        WZ-LINE-CT              PIC 9(6).                    EXEC84.2
   000391         039400   05        WZ-MODULE               PIC XX.                      EXEC84.2
   000392         039500   05        WZ-LEVEL                PIC X.                       EXEC84.2
   000393         039600   05        WZ-PRINT-HOLD           PIC X(132).                  EXEC84.2
   000394         039700   05        WZ-X-CARD.                                           EXEC84.2
   000395         039800     10      WZ-X-CHAR               PIC X                        EXEC84.2
   000396         039900                                     OCCURS 60.                   EXEC84.2
   000397         040000   05        WZ-WITHIN-DELETE-SERIES-FLAG  PIC X.                 EXEC84.2
   000398         040100 01  WZ-VERSION-CARD.                                             EXEC84.2
   000399         040200     10  FILLER                      PIC X(55) VALUE              EXEC84.2
   000400         040300     "CCVS85  VERSION 4.2   01 OCT 1992 0032                 ".   EXEC84.2
   000401         040400 01  WZ-VERSION-CONTROL REDEFINES WZ-VERSION-CARD.                EXEC84.2 398
   000402         040500     10      FILLER                  PIC X(16).                   EXEC84.2
   000403         040600     10      WZ-VERSION-NUM          PIC X(3).                    EXEC84.2
   000404         040700     10      FILLER                  PIC X(3).                    EXEC84.2
   000405         040800     10      WZ-VERSION-DATE         PIC X(11).                   EXEC84.2
   000406         040900                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000407         041000/                                                                 EXEC84.2
   000408         041100 PROCEDURE DIVISION.                                              EXEC84.2
   000409         041200*==================                                               EXEC84.2
   000410         041300*                                                                 EXEC84.2
   000411         041400 A10-MAIN SECTION.                                                EXEC84.2
   000412         041500*================                                                 EXEC84.2
   000413         041600*                                                                 EXEC84.2
   000414         041800*    THIS IS THE HIGHEST LEVEL CONTROL MODULE                  *  EXEC84.2
   000415         041900*                                                              *  EXEC84.2
   000416         042100 A10-1-MAIN.                                                      EXEC84.2
   000417         042200     PERFORM B10-INITIALISE.                                      EXEC84.2 429
   000418         042300                                                                  EXEC84.2
   000419         042400     PERFORM C10-PROCESS-MONITOR.                                 EXEC84.2 487
   000420         042500                                                                  EXEC84.2
   000421         042600     PERFORM D10-MERGE-UPDATE-CARDS.                              EXEC84.2 948
   000422         042700                                                                  EXEC84.2
   000423         042800     PERFORM E10-TERMINATE.                                       EXEC84.2 2045
   000424         042900                                                                  EXEC84.2
   000425         043000 A10-EXIT.                                                        EXEC84.2
   000426         043100     EXIT.                                                        EXEC84.2
   000427         043200                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000428         043300/                                                                 EXEC84.2
   000429         043400 B10-INITIALISE SECTION.                                          EXEC84.2
   000430         043500*======================                                           EXEC84.2
   000431         043600*                                                                 EXEC84.2
   000432         043800* THIS SECTION INITIALIZES THE OPTION SWITCH AND X-CARD FIELDS *  EXEC84.2
   000433         043900* PRIOR TO READING IN CONTROL CARD FILE.                       *  EXEC84.2
   000434         044000*                                                              *  EXEC84.2
   000435         044100*                                                              *  EXEC84.2
   000436         044200*                                                              *  EXEC84.2
   000437         044300*                                                              *  EXEC84.2
   000438         044500 B10-1-INIT-OPTION-SWITCHES.                                      EXEC84.2
   000439         044600     MOVE    SPACES  TO WZ-MISCELLANEOUS.                         EXEC84.2 IMP 342
   000440         044700     MOVE    SPACES  TO WF-PROGRAM-SELECTED-TABLE.                EXEC84.2 IMP 266
   000441         044800     MOVE    SPACES  TO WG-MODULE-SELECTED-TABLE.                 EXEC84.2 IMP 269
   000442         044900     MOVE    SPACES  TO WY-SWITCHES.                              EXEC84.2 IMP 293
   000443         045000     MOVE    "A"     TO WY-OPT-SW-1.                              EXEC84.2 295
   000444         045100     MOVE    "E"     TO WY-OPT-SW-2.                              EXEC84.2 296
   000445         045200     MOVE    "H"     TO WY-OPT-SW-3.                              EXEC84.2 297
   000446         045300     MOVE    "L"     TO WY-OPT-SW-4.                              EXEC84.2 298
   000447         045400     MOVE    "Y"     TO WY-OPT-SW-7.                              EXEC84.2 301
   000448         045500     MOVE    "T"     TO WY-OPT-SW-11.                             EXEC84.2 305
   000449         045600                                                                  EXEC84.2
   000450         045700 B10-2-INIT-X-CARDS.                                              EXEC84.2
   000451         045800     MOVE    ZERO TO SUB1.                                        EXEC84.2 IMP 66
   000452         045900     MOVE    ZERO TO SUB6.                                        EXEC84.2 IMP 71
   000453         046000     MOVE    ZERO TO SUB7.                                        EXEC84.2 IMP 72
   000454         046100     MOVE    1    TO SUB5.                                        EXEC84.2 70
   000455         046200     PERFORM B20-INIT-X-CARDS 200 TIMES.                          EXEC84.2 477
   000456         046300     MOVE   "    OMITTED" TO WX-X-CARD (84).                      EXEC84.2 287
   000457         046400     MOVE    ZERO TO WZ-LINES-COBOL.                              EXEC84.2 IMP 371
   000458         046500     MOVE    ZERO TO WZ-LINES-INSERTED.                           EXEC84.2 IMP 372
   000459         046600     MOVE    ZERO TO WZ-LINES-REPLACED.                           EXEC84.2 IMP 373
   000460         046700     MOVE    ZERO TO WZ-LINES-DELETED.                            EXEC84.2 IMP 374
   000461         046800     MOVE    ZERO TO WZ-COMMENTS-DELETED.                         EXEC84.2 IMP 375
   000462         046900     MOVE    ZERO TO WZ-CODE-REMOVED.                             EXEC84.2 IMP 376
   000463         047000     MOVE    ZERO TO WZ-SOURCE-PROGS.                             EXEC84.2 IMP 377
   000464         047100     MOVE    ZERO TO WZ-NEWPOP-PROGS.                             EXEC84.2 IMP 378
   000465         047200     MOVE    ZERO TO WZ-PROGS-FOUND.                              EXEC84.2 IMP 379
   000466         047300     MOVE    ZERO TO WZ-COMMENTS-DEL.                             EXEC84.2 IMP 380
   000467         047400     MOVE    ZERO TO WZ-SEQ-NO.                                   EXEC84.2 IMP 381
   000468         047500     MOVE    ZERO TO WZ-PAGE-CT.                                  EXEC84.2 IMP 389
   000469         047600     MOVE    ZERO TO WZ-LINE-CT.                                  EXEC84.2 IMP 390
   000470         047700     ACCEPT WA-DATE FROM DATE.                                    EXEC84.2 91
   000471         047800 B10-EXIT.                                                        EXEC84.2
   000472         047900     EXIT.                                                        EXEC84.2
   000473         048000                                                                  EXEC84.2
   000474         048100                                                                  EXEC84.2
   000475         048200                                                                  EXEC84.2
   000476         048300                                                                  EXEC84.2
   000477         048400 B20-INIT-X-CARDS SECTION.                                        EXEC84.2
   000478         048500*========================                                         EXEC84.2
   000479         048600 B20-1-INIT.                                                      EXEC84.2
   000480         048700     ADD     1 TO SUB1.                                           EXEC84.2 66
   000481         048800     MOVE   "**** X-CARD UNDEFINED ****" TO WX-X-CARD (SUB1).     EXEC84.2 287 66
   000482         048900     MOVE    ZERO TO WX-PROG-POS (SUB1).                          EXEC84.2 IMP 291 66
   000483         049000                                                                  EXEC84.2
   000484         049100 B20-EXIT.                                                        EXEC84.2
   000485         049200     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000486         049300/                                                                 EXEC84.2
   000487         049400 C10-PROCESS-MONITOR SECTION.                                     EXEC84.2
   000488         049500*===========================                                      EXEC84.2
   000489         049600                                                                  EXEC84.2
   000490         049800*    THIS SECTION PROCESSES THE RECORDS COMMENCING WITH "*"    *  EXEC84.2
   000491         049900*    AND "X-" (THE MONITOR PART OF THE INPUT FILE ) AND READS  *  EXEC84.2
   000492         050000*    THE FIRST "*START" UPDATE RECORD.                         *  EXEC84.2
   000493         050100*                                                              *  EXEC84.2
   000494         050200*    PERFORMED BY    A10-MAIN                                  *  EXEC84.2
   000495         050300*    PERFORMS        C20-PROCESS-STAR-CARDS                    *  EXEC84.2
   000496         050400*                    C30-CHECK-COMBINATIONS                    *  EXEC84.2
   000497         050500*                    C40-PROCESS-X-CARDS                       *  EXEC84.2
   000498         050700 C10-1-OPEN-FILES.                                                EXEC84.2
   000499         050800     OPEN    OUTPUT  PRINT-FILE.                                  EXEC84.2 47
   000500         050900     MOVE    SPACES TO PRINT-REC.                                 EXEC84.2 IMP 48
   000501         051000     OPEN    INPUT   CONTROL-CARD-FILE.                           EXEC84.2 45
   000502         051100     READ    CONTROL-CARD-FILE INTO  WB-CONTROL-DATA              EXEC84.2 45 136
   000503      1  051200             AT END  MOVE "CONTROL-CARD-FILE IS EMPTY"            EXEC84.2
   000504      1  051300                  TO PRINT-DATA                                   EXEC84.2 50
   000505      1  051400             PERFORM  X20-PRINT-DETAIL                            EXEC84.2 2100
   000506      1  051500             STOP RUN.                                            EXEC84.2
   000507         051600     PERFORM C20-PROCESS-STAR-CARDS                               EXEC84.2 540
   000508         051700             UNTIL   WB-X-HYPHEN = "X-".                          EXEC84.2 187
   000509         051800     PERFORM C30-CHECK-COMBINATIONS.                              EXEC84.2 654
   000510         051900     PERFORM C40-PROCESS-X-CARDS                                  EXEC84.2 750
   000511         052000             UNTIL   WB-12 = "*END-MONITOR".                      EXEC84.2 166
   000512         052100                                                                  EXEC84.2
   000513         052200     PERFORM C50-PRINT-OPTIONS.                                   EXEC84.2 798
   000514         052300                                                                  EXEC84.2
   000515         052400 C10-10-GET-FIRST-START-CARD.                                     EXEC84.2
   000516         052500     READ    CONTROL-CARD-FILE INTO  WB-CONTROL-DATA              EXEC84.2 45 136
   000517      1  052600             AT END  MOVE "NO BEGIN-UPDATE CARD FOUND"            EXEC84.2
   000518      1  052700                  TO PRINT-DATA                                   EXEC84.2 50
   000519      1  052800             PERFORM  X20-PRINT-DETAIL                            EXEC84.2 2100
   000520      1  052900             STOP RUN.                                            EXEC84.2
   000521         053000     IF WB-13 NOT = "*BEGIN-UPDATE"                               EXEC84.2 171
   000522      1  053100             MOVE "*BEGIN-UPDATE CARD MISSING"                    EXEC84.2
   000523      1  053200                  TO PRINT-DATA                                   EXEC84.2 50
   000524      1  053300             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000525      1  053400             STOP RUN.                                            EXEC84.2
   000526         053500     READ    CONTROL-CARD-FILE INTO  WB-CONTROL-DATA              EXEC84.2 45 136
   000527      1  053600             AT END  MOVE "NO END-UPDATE CARD FOUND"              EXEC84.2
   000528      1  053700                  TO PRINT-DATA                                   EXEC84.2 50
   000529      1  053800             PERFORM  X20-PRINT-DETAIL                            EXEC84.2 2100
   000530      1  053900             STOP RUN.                                            EXEC84.2
   000531         054000     IF      WB-11 = "*END-UPDATE"                                EXEC84.2 163
   000532      1  054100             MOVE   "Y" TO WZ-END-OF-UPDATES                      EXEC84.2 352
   000533      1  054200             GO TO   C10-EXIT.                                    EXEC84.2 537
   000534         054300     IF      WB-STAR-START = "*START"                             EXEC84.2 195
   000535      1  054400             PERFORM C60-START-CARD.                              EXEC84.2 923
   000536         054500                                                                  EXEC84.2
   000537         054600 C10-EXIT.                                                        EXEC84.2
   000538         054700     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000539         054800/                                                                 EXEC84.2
   000540         054900 C20-PROCESS-STAR-CARDS SECTION.                                  EXEC84.2
   000541         055000*==============================                                   EXEC84.2
   000542         055100*                                                                 EXEC84.2
   000543         055300*    THIS SECTION PROCESSES THE INPUT PARAMETER FILE RECORDS   *  EXEC84.2
   000544         055400*    WHICH START WITH AN ASTERISK IN COLUMN 1 AND SETS VARIOUS *  EXEC84.2
   000545         055500*    FLAGS WHICH CONTROL THE WAY THIS EXECUTIVE ROUTINE WORKS. *  EXEC84.2
   000546         055600*                                                              *  EXEC84.2
   000547         055700*    PERFORMED BY  C10-PROCESS-MONITOR                         *  EXEC84.2
   000548         055800*    PERFORMS      C25-SET-FLAGS                               *  EXEC84.2
   000549         056000 C20-1-UPDATE-CHECK.                                              EXEC84.2
   000550         056100     IF      WB-13 = "*BEGIN-UPDATE"                              EXEC84.2 171
   000551      1  056200             MOVE    WB-13 TO WZ-INVALID-DATA                     EXEC84.2 171 357
   000552      1  056300             MOVE   "ENCOUNTERED BEFORE *END-MONITOR CARD"        EXEC84.2
   000553      1  056400                  TO WZ-ERROR-MESSAGE                             EXEC84.2 359
   000554      1  056500             MOVE    WZ-INVALID-DATA TO PRINT-DATA                EXEC84.2 357 50
   000555      1  056600             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000556      1  056700             STOP RUN.                                            EXEC84.2
   000557         056800                                                                  EXEC84.2
   000558         056900     IF      WB-6  = "*START"                                     EXEC84.2 148
   000559      1  057000             MOVE    WB-6  TO WZ-INVALID-DATA                     EXEC84.2 148 357
   000560      1  057100             MOVE   "ENCOUNTERED BEFORE *END-MONITOR CARD"        EXEC84.2
   000561      1  057200                  TO WZ-ERROR-MESSAGE                             EXEC84.2 359
   000562      1  057300             MOVE    WZ-INVALID-DATA TO PRINT-DATA                EXEC84.2 357 50
   000563      1  057400             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000564      1  057500             STOP RUN.                                            EXEC84.2
   000565         057600                                                                  EXEC84.2
   000566         057700     IF      WB-11 = "*END-UPDATE"                                EXEC84.2 163
   000567      1  057800             MOVE    WB-11 TO WZ-INVALID-DATA                     EXEC84.2 163 357
   000568      1  057900             MOVE   "ENCOUNTERED BEFORE *END-MONITOR CARD"        EXEC84.2
   000569      1  058000                  TO WZ-ERROR-MESSAGE                             EXEC84.2 359
   000570      1  058100             MOVE    WZ-INVALID-DATA TO PRINT-DATA                EXEC84.2 357 50
   000571      1  058200             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000572      1  058300             STOP RUN.                                            EXEC84.2
   000573         058400                                                                  EXEC84.2
   000574         058500     PERFORM C25-SET-FLAGS.                                       EXEC84.2 580
   000575         058600                                                                  EXEC84.2
   000576         058700 C20-EXIT.                                                        EXEC84.2
   000577         058800     EXIT.                                                        EXEC84.2
   000578         058900                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000579         059000/                                                                 EXEC84.2
   000580         059100 C25-SET-FLAGS SECTION.                                           EXEC84.2
   000581         059200*=====================                                            EXEC84.2
   000582         059300 C25-1.                                                           EXEC84.2
   000583         059400     MOVE    WB-CONTROL-DATA TO PRINT-DATA.                       EXEC84.2 136 50
   000584         059500     PERFORM X20-PRINT-DETAIL.                                    EXEC84.2 2100
   000585         059600     IF      WB-12 = "*EXTRACT-ALL"                               EXEC84.2 166
   000586      1  059700             MOVE   "Y" TO WY-EXTRACT-ALL.                        EXEC84.2 325
   000587         059800     IF      WB-13 = "*EXTRACT-AUTO"                              EXEC84.2 171
   000588      1  059900             MOVE   "Y" TO WY-EXTRACT-AUTO.                       EXEC84.2 326
   000589         060000     IF      WB-12 = "*EXTRACT-MAN"                               EXEC84.2 166
   000590      1  060100             MOVE   "Y" TO WY-EXTRACT-MAN.                        EXEC84.2 327
   000591         060200     IF      WB-15 = "*KILL-DELETIONS"                            EXEC84.2 181
   000592      1  060300             MOVE   "Y" TO WY-KILL-DELETIONS.                     EXEC84.2 328
   000593         060400     IF      WB-16 = "*LIST NO-UPDATES"                           EXEC84.2 184
   000594      1  060500             MOVE   "Y" TO WY-LIST-NO-UPDATES.                    EXEC84.2 329
   000595         060600     IF      WB-13 = "*LIST X-CARDS"                              EXEC84.2 171
   000596      1  060700             MOVE   "Y" TO WY-LIST-X-CARDS.                       EXEC84.2 330
   000597         060800     IF      WB-14 = "*LIST PROGRAMS"                             EXEC84.2 174
   000598      1  060900             MOVE   "Y" TO WY-LIST-PROGRAMS.                      EXEC84.2 331
   000599         061000     IF      WB-13 = "*LIST COMPACT"                              EXEC84.2 171
   000600      1  061100             MOVE   "Y" TO WY-LIST-COMPACT.                       EXEC84.2 332
   000601         061200     IF      WB-8  = "*NO-DATA"                                   EXEC84.2 154
   000602      1  061300             MOVE   "Y" TO WY-NO-DATA.                            EXEC84.2 333
   000603         061400     IF      WB-11 = "*NO-LIBRARY"                                EXEC84.2 163
   000604      1  061500             MOVE   "Y" TO WY-NO-LIBRARY.                         EXEC84.2 334
   000605         061600     IF      WB-10 = "*NO-SOURCE"                                 EXEC84.2 160
   000606      1  061700             MOVE   "Y" TO WY-NO-SOURCE.                          EXEC84.2 335
   000607         061800     IF      WB-16 = "*REMOVE-COMMENTS"                           EXEC84.2 184
   000608      1  061900             MOVE   "Y" TO WY-REMOVE-COMMENTS.                    EXEC84.2 336
   000609         062000     IF      WB-8  = "*NEW-POP"                                   EXEC84.2 154
   000610      1  062100             MOVE   "Y" TO WY-NEW-POP.                            EXEC84.2 337
   000611         062200     IF      WB-4  = "*OPT"                                       EXEC84.2 142
   000612      1  062300             MOVE   WB-X TO WY-OPT-SW (WB-NN).                    EXEC84.2 145 322 143
   000613         062400     IF      WB-14 = "*SELECT-MODULE"                             EXEC84.2 174
   000614      1  062500             IF      WB-MODULE = SPACE                            EXEC84.2 176 IMP
   000615      2  062600                     MOVE  "SELECTED MODULE NOT SPECIFIED"        EXEC84.2
   000616      2  062700                         TO PRINT-DATA                            EXEC84.2 50
   000617      2  062800                     PERFORM X20-PRINT-DETAIL                     EXEC84.2 2100
   000618      2  062900                     STOP RUN.                                    EXEC84.2
   000619         063000                                                                  EXEC84.2
   000620         063100     IF      WB-14 = "*SELECT-MODULE"                             EXEC84.2 174
   000621      1  063200             ADD     1 TO SUB6                                    EXEC84.2 71
   000622      1  063300             IF      SUB6 > 10                                    EXEC84.2 71
   000623      2  063400                     MOVE   "MORE THAN 10 MODULES SELECTED"       EXEC84.2
   000624      2  063500                          TO PRINT-DATA                           EXEC84.2 50
   000625      2  063600                     PERFORM X20-PRINT-DETAIL                     EXEC84.2 2100
   000626      2  063700                     STOP RUN                                     EXEC84.2
   000627      1  063800             ELSE                                                 EXEC84.2
   000628      2  063900                     MOVE   "Y" TO WY-SELECT-MODULE               EXEC84.2 339
   000629      2  064000                     MOVE    WB-MODULE                            EXEC84.2 176
   000630      2  064100                          TO WG-MODULE-SELECTED (SUB6)            EXEC84.2 271 71
   000631      2  064200                     MOVE    WB-LEVEL  TO WG-MODULE-LEVEL (SUB6). EXEC84.2 178 272 71
   000632         064300     IF      WB-12 = "*SELECT-PROG"                               EXEC84.2 166
   000633      1  064400             ADD     1 TO SUB7                                    EXEC84.2 72
   000634      1  064500             IF      SUB7 > 50                                    EXEC84.2 72
   000635      2  064600                     MOVE   "MORE THAN 50 RECORDS SELECTED"       EXEC84.2
   000636      2  064700                          TO PRINT-DATA                           EXEC84.2 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000637      2  064800                     PERFORM X20-PRINT-DETAIL                     EXEC84.2 2100
   000638      2  064900                     STOP RUN                                     EXEC84.2
   000639      1  065000             ELSE                                                 EXEC84.2
   000640      2  065100                     MOVE   "Y" TO WY-SELECT-PROG                 EXEC84.2 338
   000641      2  065200                     MOVE    WB-PROG                              EXEC84.2 168
   000642      2  065300                          TO WF-PROGRAM-SELECTED (SUB7).          EXEC84.2 267 72
   000643         065400                                                                  EXEC84.2
   000644         065500 C25-10-READ-FILE.                                                EXEC84.2
   000645         065600     MOVE    SPACES TO WB-CONTROL-DATA.                           EXEC84.2 IMP 136
   000646         065700     READ    CONTROL-CARD-FILE INTO  WB-CONTROL-DATA              EXEC84.2 45 136
   000647      1  065800             AT END  MOVE "*END-MONITOR NOT ENCOUNTERED"          EXEC84.2
   000648      1  065900                  TO PRINT-DATA                                   EXEC84.2 50
   000649      1  066000             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000650      1  066100             STOP RUN.                                            EXEC84.2
   000651         066200 C25-EXIT.                                                        EXEC84.2
   000652         066300     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000653         066400/                                                                 EXEC84.2
   000654         066500 C30-CHECK-COMBINATIONS SECTION.                                  EXEC84.2
   000655         066600*==============================                                   EXEC84.2
   000656         066700*                                                                 EXEC84.2
   000657         066900*    THIS SECTION CHECKS FOR ANY INVALID COMBINATIONS OF       *  EXEC84.2
   000658         067000*    CARDS INPUT WITH AN ASTERISK IN COLUMN 1.                 *  EXEC84.2
   000659         067100*                                                              *  EXEC84.2
   000660         067200*    PERFORMED BY  C10-PROCESS-MONITOR                         *  EXEC84.2
   000661         067300*    PERFORMS      NONE                                        *  EXEC84.2
   000662         067500 C30-1-SELECTION-CHECK.                                           EXEC84.2
   000663         067600     IF      WY-EXTRACT-ALL = SPACE                               EXEC84.2 325 IMP
   000664      1  067700             GO TO   C30-10.                                      EXEC84.2 671
   000665         067800     IF      WY-EXTRACT-AUTO = "Y"                                EXEC84.2 326
   000666      1  067900             MOVE   "ALL AND AUTO PROGRAMS SELECTED"              EXEC84.2
   000667      1  068000                  TO PRINT-DATA                                   EXEC84.2 50
   000668      1  068100             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000669      1  068200             STOP RUN.                                            EXEC84.2
   000670         068300                                                                  EXEC84.2
   000671         068400 C30-10.                                                          EXEC84.2
   000672         068500     IF      WY-EXTRACT-ALL = SPACE                               EXEC84.2 325 IMP
   000673      1  068600             GO TO   C30-20.                                      EXEC84.2 680
   000674         068700     IF      WY-EXTRACT-MAN = "Y"                                 EXEC84.2 327
   000675      1  068800             MOVE   "ALL AND MANUAL PROGRAMS SELECTED"            EXEC84.2
   000676      1  068900                  TO PRINT-DATA                                   EXEC84.2 50
   000677      1  069000             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000678      1  069100             STOP RUN.                                            EXEC84.2
   000679         069200                                                                  EXEC84.2
   000680         069300 C30-20.                                                          EXEC84.2
   000681         069400     IF      WY-LIST-PROGRAMS = SPACE                             EXEC84.2 331 IMP
   000682      1  069500             GO TO   C30-30.                                      EXEC84.2 689
   000683         069600     IF      WY-LIST-NO-UPDATES = SPACE                           EXEC84.2 329 IMP
   000684      1  069700             MOVE   "BOTH UPDATES AND PROGRAMS SELECTED"          EXEC84.2
   000685      1  069800                  TO PRINT-DATA                                   EXEC84.2 50
   000686      1  069900             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000687      1  070000             STOP RUN.                                            EXEC84.2
   000688         070100                                                                  EXEC84.2
   000689         070200 C30-30.                                                          EXEC84.2
   000690         070300     IF      WY-EXTRACT-AUTO = SPACE                              EXEC84.2 326 IMP
   000691      1  070400             GO TO   C30-40-CHECK-FOR-NEW-FILE.                   EXEC84.2 698
   000692         070500     IF      WY-EXTRACT-MAN  = "Y"                                EXEC84.2 327
   000693      1  070600             MOVE   "AUTO AND MANUAL PROGRAMS SELECTED"           EXEC84.2
   000694      1  070700                  TO PRINT-DATA                                   EXEC84.2 50
   000695      1  070800             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000696      1  070900             STOP RUN.                                            EXEC84.2
   000697         071000                                                                  EXEC84.2
   000698         071100 C30-40-CHECK-FOR-NEW-FILE.                                       EXEC84.2
   000699         071200     IF      WY-NO-SOURCE = SPACE                                 EXEC84.2 335 IMP
   000700      1  071300             GO TO   C30-50.                                      EXEC84.2 707
   000701         071400     IF      WY-NEW-POP   = "Y"                                   EXEC84.2 337
   000702      1  071500             GO TO   C30-50.                                      EXEC84.2 707
   000703         071600     MOVE   "NO SOURCE OR UPDATED POPFILE SELECTED" TO PRINT-DATA.EXEC84.2 50
   000704         071700     PERFORM X20-PRINT-DETAIL                                     EXEC84.2 2100
   000705         071800     STOP RUN.                                                    EXEC84.2
   000706         071900                                                                  EXEC84.2
   000707         072000 C30-50.                                                          EXEC84.2
   000708         072100     IF      WY-EXTRACT-ALL = "Y"                                 EXEC84.2 325
   000709      1  072200             GO TO   C30-55.                                      EXEC84.2 714
   000710         072300     IF      WY-EXTRACT-MAN = "Y"                                 EXEC84.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000711      1  072400             GO TO   C30-55.                                      EXEC84.2 714
   000712         072500     IF      WY-EXTRACT-AUTO = SPACE                              EXEC84.2 326 IMP
   000713      1  072600             GO TO   C30-60.                                      EXEC84.2 726
   000714         072700 C30-55.                                                          EXEC84.2
   000715         072800     IF      WY-SELECT-PROG = "Y"                                 EXEC84.2 338
   000716      1  072900             MOVE  "SINGLE PROGRAM SELECTED WITH ALL/AUTO/MANUAL" EXEC84.2
   000717      1  073000                  TO PRINT-DATA                                   EXEC84.2 50
   000718      1  073100             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000719      1  073200             STOP RUN.                                            EXEC84.2
   000720         073300     IF      WY-SELECT-MODULE = "Y"                               EXEC84.2 339
   000721      1  073400             MOVE  "SINGLE MODULE SELECTED WITH ALL/AUTO/MANUAL"  EXEC84.2
   000722      1  073500                  TO PRINT-DATA                                   EXEC84.2 50
   000723      1  073600             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000724      1  073700             STOP RUN.                                            EXEC84.2
   000725         073800                                                                  EXEC84.2
   000726         073900 C30-60.                                                          EXEC84.2
   000727         074000     IF      WY-SELECT-PROG = SPACE                               EXEC84.2 338 IMP
   000728      1  074100             GO TO   C30-70.                                      EXEC84.2 736
   000729         074200     IF      WY-SELECT-MODULE = "Y"                               EXEC84.2 339
   000730      1  074300             MOVE  "SINGLE MODULE AND SINGLE PROGRAM SELECTED"    EXEC84.2
   000731      1  074400                  TO PRINT-DATA                                   EXEC84.2 50
   000732      1  074500             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000733      1  074600             STOP RUN.                                            EXEC84.2
   000734         074700                                                                  EXEC84.2
   000735         074800                                                                  EXEC84.2
   000736         074900 C30-70.                                                          EXEC84.2
   000737         075000     IF      WY-EXTRACT-ALL = SPACE                               EXEC84.2 325 IMP
   000738      1  075100        IF      WY-EXTRACT-AUTO = SPACE                           EXEC84.2 326 IMP
   000739      2  075200             IF      WY-EXTRACT-MAN = SPACE                       EXEC84.2 327 IMP
   000740      3  075300                 IF      WY-SELECT-PROG = SPACE                   EXEC84.2 338 IMP
   000741      4  075400                     IF      WY-SELECT-MODULE = SPACE             EXEC84.2 339 IMP
   000742      5  075500                             MOVE   "NO PROGRAMS SELECTED"        EXEC84.2
   000743      5  075600                                  TO PRINT-DATA                   EXEC84.2 50
   000744      5  075700                             PERFORM X20-PRINT-DETAIL             EXEC84.2 2100
   000745      5  075800                             STOP RUN.                            EXEC84.2
   000746         075900                                                                  EXEC84.2
   000747         076000 C30-EXIT.                                                        EXEC84.2
   000748         076100     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000749         076200/                                                                 EXEC84.2
   000750         076300 C40-PROCESS-X-CARDS SECTION.                                     EXEC84.2
   000751         076400*===========================                                      EXEC84.2
   000752         076500*                                                                 EXEC84.2
   000753         076700*    THIS SECTION PROCESSES THE INPUT PARAMETER FILE RECORDS   *  EXEC84.2
   000754         076800*    WHICH START WITH AN "X" IN COLUMN 1 AND SETS A TABLE WHICH*  EXEC84.2
   000755         076900*    CONTAINS TEXT TO BE SUBSTITUTED BY THIS EXECUTIVE ROUTINE.*  EXEC84.2
   000756         077000*                                                              *  EXEC84.2
   000757         077100*    PERFORMED BY  C10-PROCESS-MONITOR                         *  EXEC84.2
   000758         077200*    PERFORMS      NONE                                        *  EXEC84.2
   000759         077400 C40-1-PROCESS-CARD.                                              EXEC84.2
   000760         077500     IF      WB-X-HYPHEN NOT = "X-"                               EXEC84.2 187
   000761      1  077600             MOVE   "INVALID X-CARD:" TO WZ-INVALID-DATA          EXEC84.2 357
   000762      1  077700             MOVE    WB-CONTROL-DATA  TO WZ-ERROR-MESSAGE         EXEC84.2 136 359
   000763      1  077800             MOVE    WZ-INVALID-DATA TO PRINT-DATA                EXEC84.2 357 50
   000764      1  077900             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000765      1  078000             GO TO   C40-90-READ-FILE.                            EXEC84.2 786
   000766         078100                                                                  EXEC84.2
   000767         078200     IF      WB-X-CARD-NUM > 200                                  EXEC84.2 188
   000768      1  078300             MOVE   "INVALID X-CARD:" TO WZ-INVALID-DATA          EXEC84.2 357
   000769      1  078400             MOVE    WB-CONTROL-DATA  TO WZ-ERROR-MESSAGE         EXEC84.2 136 359
   000770      1  078500             MOVE    WZ-INVALID-DATA  TO PRINT-DATA               EXEC84.2 357 50
   000771      1  078600             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   000772      1  078700             GO TO   C40-90-READ-FILE.                            EXEC84.2 786
   000773         078800                                                                  EXEC84.2
   000774         078900 C40-20-MOVE-DATA.                                                EXEC84.2
   000775         079000     MOVE    WB-SUBS-TEXT TO WX-X-CARD (WB-X-CARD-NUM).           EXEC84.2 192 287 188
   000776         079100     IF      WB-PROG-POS = SPACES                                 EXEC84.2 189 IMP
   000777      1  079200             GO TO   C40-30-MOVE-DATA.                            EXEC84.2 782
   000778         079300     IF      WB-PROG-POS-NUM < 55                                 EXEC84.2 190
   000779      1  079400             MOVE   WB-PROG-POS-NUM                               EXEC84.2 190
   000780      1  079500                 TO WX-PROG-POS (WB-X-CARD-NUM).                  EXEC84.2 291 188
   000781         079600                                                                  EXEC84.2
   000782         079700 C40-30-MOVE-DATA.                                                EXEC84.2
   000783         079800     MOVE    WB-CONTROL-DATA TO PRINT-DATA.                       EXEC84.2 136 50
   000784         079900     PERFORM X20-PRINT-DETAIL.                                    EXEC84.2 2100
   000785         080000                                                                  EXEC84.2
   000786         080100 C40-90-READ-FILE.                                                EXEC84.2
   000787         080200     READ    CONTROL-CARD-FILE INTO  WB-CONTROL-DATA              EXEC84.2 45 136
   000788      1  080300             AT END  MOVE                                         EXEC84.2
   000789      1  080400     "*BEGIN-UPDATE AND *END-UPDATE CARDS NOT ENCOUNTERED"        EXEC84.2
   000790      1  080500                  TO PRINT-DATA                                   EXEC84.2 50
   000791      1  080600             PERFORM  X20-PRINT-DETAIL                            EXEC84.2 2100
   000792      1  080700             STOP RUN.                                            EXEC84.2
   000793         080800                                                                  EXEC84.2
   000794         080900 C40-EXIT.                                                        EXEC84.2
   000795         081000     EXIT.                                                        EXEC84.2
   000796         081100                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000797         081200/                                                                 EXEC84.2
   000798         081300 C50-PRINT-OPTIONS SECTION.                                       EXEC84.2
   000799         081400*=========================                                        EXEC84.2
   000800         081500*                                                                 EXEC84.2
   000801         081700*    THIS SECTION PRINTS DETAILS OF THE PROCESSING OPTIONS     *  EXEC84.2
   000802         081800*    SELECTED BY THE VARIOUS CONTROL CARDS INPUT               *  EXEC84.2
   000803         081900*                                                              *  EXEC84.2
   000804         082000*    PERFORMED BY  C10-PROCESS-MONITOR                         *  EXEC84.2
   000805         082100*    PERFORMS      NONE                                        *  EXEC84.2
   000806         082300 C50-1-PRINT-OPTION-SWITCHES.                                     EXEC84.2
   000807         082400     WRITE   PRINT-REC FROM WV-OPTION-HEADING AFTER PAGE.         EXEC84.2 48 275
   000808         082500     WRITE   PRINT-REC FROM WV-OPT-1          AFTER 1.            EXEC84.2 48 277
   000809         082600     WRITE   PRINT-REC FROM WV-OPT-2          AFTER 1.            EXEC84.2 48 279
   000810         082700     MOVE    SPACES TO WV-OPT-SWITCHES.                           EXEC84.2 IMP 281
   000811         082800     MOVE    ZERO   TO SUB1.                                      EXEC84.2 IMP 66
   000812         082900     PERFORM C50-4 26 TIMES.                                      EXEC84.2 814
   000813         083000     GO TO   C50-5.                                               EXEC84.2 819
   000814         083100 C50-4.                                                           EXEC84.2
   000815         083200*    PERFORM 26 TIMES                                             EXEC84.2
   000816         083300             ADD     1 TO SUB1                                    EXEC84.2 66
   000817         083400             MOVE    WY-OPT-SW (SUB1) TO WV-OPT (SUB1).           EXEC84.2 322 66 284 66
   000818         083500*    END-PERFORM.                                                 EXEC84.2
   000819         083600 C50-5.                                                           EXEC84.2
   000820         083700     WRITE   PRINT-REC FROM WV-OPT-SWITCHES AFTER 1.              EXEC84.2 48 281
   000821         083800                                                                  EXEC84.2
   000822         083900 C50-20-LISTING-OPTIONS.                                          EXEC84.2
   000823         084000     IF      WY-LIST-NO-UPDATES = "Y"                             EXEC84.2 329
   000824      1  084100             MOVE   "UPDATES WILL NOT BE REPORTED" TO PRINT-DATA  EXEC84.2 50
   000825         084200     ELSE                                                         EXEC84.2
   000826      1  084300             MOVE   "UPDATES WILL BE REPORTED"     TO PRINT-DATA. EXEC84.2 50
   000827         084400     WRITE   PRINT-REC AFTER 3.                                   EXEC84.2 48
   000828         084500                                                                  EXEC84.2
   000829         084600     IF      WY-LIST-X-CARDS = "Y"                                EXEC84.2 330
   000830      1  084700             MOVE   "X-CARD SUBSTITUTIONS WILL BE SHOWN"          EXEC84.2
   000831      1  084800                  TO PRINT-DATA                                   EXEC84.2 50
   000832         084900     ELSE                                                         EXEC84.2
   000833      1  085000             MOVE   "X-CARD SUBSTITUTIONS WILL NOT BE SHOWN"      EXEC84.2
   000834      1  085100                  TO PRINT-DATA.                                  EXEC84.2 50
   000835         085200     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   000836         085300                                                                  EXEC84.2
   000837         085400     IF      WY-LIST-PROGRAMS = "Y"                               EXEC84.2 331
   000838      1  085500             MOVE   "PROGRAM LISTINGS WILL BE PRINTED"            EXEC84.2
   000839      1  085600                  TO PRINT-DATA                                   EXEC84.2 50
   000840         085700     ELSE                                                         EXEC84.2
   000841      1  085800             MOVE   "PROGRAM LISTINGS WILL NOT BE PRINTED"        EXEC84.2
   000842      1  085900                  TO PRINT-DATA.                                  EXEC84.2 50
   000843         086000     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   000844         086100                                                                  EXEC84.2
   000845         086200     IF      WY-LIST-COMPACT = "Y"                                EXEC84.2 332
   000846      1  086300             MOVE   "REPORT WILL BE COMPRESSED" TO PRINT-DATA     EXEC84.2 50
   000847         086400     ELSE                                                         EXEC84.2
   000848      1  086500             MOVE   "REPORT WILL BE EXPANDED"   TO PRINT-DATA.    EXEC84.2 50
   000849         086600     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   000850         086700                                                                  EXEC84.2
   000851         086800     IF      WY-NO-SOURCE = "Y"                                   EXEC84.2 335
   000852      1  086900             MOVE   "SOURCE FILE WILL BE SUPPRESSED" TO PRINT-DATAEXEC84.2 50
   000853         087000     ELSE                                                         EXEC84.2
   000854      1  087100             MOVE   "SOURCE FILE WILL BE CREATED" TO PRINT-DATA.  EXEC84.2 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000855         087200     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   000856         087300                                                                  EXEC84.2
   000857         087400     IF      WY-NEW-POP = "Y"                                     EXEC84.2 337
   000858      1  087500             MOVE   "NEW POPULATION FILE WILL BE CREATED"         EXEC84.2
   000859      1  087600                  TO PRINT-DATA                                   EXEC84.2 50
   000860         087700     ELSE                                                         EXEC84.2
   000861      1  087800             MOVE   "NEW POPULATION FILE WILL BE SUPPRESSED"      EXEC84.2
   000862      1  087900                  TO PRINT-DATA.                                  EXEC84.2 50
   000863         088000     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   000864         088100                                                                  EXEC84.2
   000865         088200                                                                  EXEC84.2
   000866         088300 C50-30.                                                          EXEC84.2
   000867         088400     IF      WY-NO-LIBRARY = "Y"                                  EXEC84.2 334
   000868      1  088500             MOVE "LIBRARY NOT SELECTED"                          EXEC84.2
   000869      1  088600                  TO PRINT-DATA                                   EXEC84.2 50
   000870         088700     ELSE                                                         EXEC84.2
   000871      1  088800             MOVE "LIBRARY FILES WILL BE SELECTED"                EXEC84.2
   000872      1  088900                  TO PRINT-DATA.                                  EXEC84.2 50
   000873         089000     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   000874         089100                                                                  EXEC84.2
   000875         089200 C50-35.                                                          EXEC84.2
   000876         089300     IF      WY-NO-DATA = "Y"                                     EXEC84.2 333
   000877      1  089400             MOVE   "DATA BLOCKS WILL BE IGNORED"                 EXEC84.2
   000878      1  089500                  TO PRINT-DATA                                   EXEC84.2 50
   000879         089600     ELSE                                                         EXEC84.2
   000880      1  089700             MOVE   "DATA BLOCKS WILL BE SENT TO SOURCE FILE"     EXEC84.2
   000881      1  089800                  TO PRINT-DATA.                                  EXEC84.2 50
   000882         089900     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   000883         090000                                                                  EXEC84.2
   000884         090100 C50-40.                                                          EXEC84.2
   000885         090200     IF      WY-EXTRACT-ALL = "Y"                                 EXEC84.2 325
   000886      1  090300             MOVE   "ALL PROGRAMS SELECTED"     TO PRINT-DATA.    EXEC84.2 50
   000887         090400     IF      WY-EXTRACT-AUTO = "Y"                                EXEC84.2 326
   000888      1  090500             MOVE   "ALL AUTOMATIC PROGRAMS SELECTED"             EXEC84.2
   000889      1  090600                  TO PRINT-DATA.                                  EXEC84.2 50
   000890         090700     IF      WY-EXTRACT-MAN = "Y"                                 EXEC84.2 327
   000891      1  090800             MOVE   "ALL MANUAL PROGRAMS SELECTED"                EXEC84.2
   000892      1  090900                  TO PRINT-DATA.                                  EXEC84.2 50
   000893         091000     IF      WY-SELECT-PROG = "Y"                                 EXEC84.2 338
   000894      1  091100             MOVE   "SEPARATE PROGRAMS SELECTED"                  EXEC84.2
   000895      1  091200                  TO PRINT-DATA.                                  EXEC84.2 50
   000896         091300     IF      WY-SELECT-MODULE = "Y"                               EXEC84.2 339
   000897      1  091400             MOVE   "SEPARATE MODULES SELECTED"                   EXEC84.2
   000898      1  091500                  TO PRINT-DATA.                                  EXEC84.2 50
   000899         091600     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   000900         091700                                                                  EXEC84.2
   000901         091800     IF      WY-REMOVE-COMMENTS = "Y"                             EXEC84.2 336
   000902      1  091900             MOVE   "COMMENT LINES WILL BE REMOVED"               EXEC84.2
   000903      1  092000                  TO PRINT-DATA                                   EXEC84.2 50
   000904         092100     ELSE                                                         EXEC84.2
   000905      1  092200             MOVE   "COMMENT LINES WILL BE RETAINED"              EXEC84.2
   000906      1  092300                  TO PRINT-DATA.                                  EXEC84.2 50
   000907         092400     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   000908         092500                                                                  EXEC84.2
   000909         092600                                                                  EXEC84.2
   000910         092700     IF      WY-KILL-DELETIONS = "Y"                              EXEC84.2 328
   000911      1  092800             MOVE   "UNUSED OPTIONAL CODE WILL BE REMOVED"        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000912      1  092900                  TO PRINT-DATA                                   EXEC84.2 50
   000913         093000     ELSE                                                         EXEC84.2
   000914      1  093100             MOVE   "UNUSED OPTIONAL CODE WILL BE CONVERTED TO COMEXEC84.2
   000915      1  093200-    "MENTS AND RETAINED"                                         EXEC84.2
   000916      1  093300                  TO PRINT-DATA.                                  EXEC84.2 50
   000917         093400     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   000918         093500                                                                  EXEC84.2
   000919         093600 C50-EXIT.                                                        EXEC84.2
   000920         093700     EXIT.                                                        EXEC84.2
   000921         093800                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000922         093900/                                                                 EXEC84.2
   000923         094000 C60-START-CARD SECTION.                                          EXEC84.2
   000924         094100*======================                                           EXEC84.2
   000925         094200*                                                                 EXEC84.2
   000926         094400*    WHEN A "*START" CARD IS READ THIS SECTION INITIALISES     *  EXEC84.2
   000927         094500*    VARIOUS FIELDS AND SETS CERTAIN FLAGS.                    *  EXEC84.2
   000928         094600*                                                              *  EXEC84.2
   000929         094700*    PERFORMED BY    C10-PROCESS-MONITOR                       *  EXEC84.2
   000930         094800*                    D62-SERIES-UPDATE                         *  EXEC84.2
   000931         094900*                    D67-LINE-UPDATE                           *  EXEC84.2
   000932         095000*                    D68-LINE-EQUAL                            *  EXEC84.2
   000933         095100*                    D69-LINE-BLANK-OR-LESS                    *  EXEC84.2
   000934         095200*                    D40-ANY-UPDATES                              EXEC84.2
   000935         095300*    PERFORMS        NONE                                      *  EXEC84.2
   000936         095500 C60-1.                                                           EXEC84.2
   000937         095600                                                                  EXEC84.2
   000938         095700     MOVE    WB-UPDATE-PROG TO WZ-CURRENT-UPD-PROG.               EXEC84.2 197 360
   000939         095800                                                                  EXEC84.2
   000940         095900     IF      WZ-CURRENT-UPD-PROG = WZ-CURRENT-POP-PROG            EXEC84.2 360 367
   000941      1  096000             MOVE   "Y"    TO WZ-UPDATE-THIS-PROG                 EXEC84.2 347
   000942         096100     ELSE                                                         EXEC84.2
   000943      1  096200             MOVE    SPACE TO WZ-UPDATE-THIS-PROG.                EXEC84.2 IMP 347
   000944         096300                                                                  EXEC84.2
   000945         096400 C60-EXIT.                                                        EXEC84.2
   000946         096500     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000947         096600/                                                                 EXEC84.2
   000948         096700 D10-MERGE-UPDATE-CARDS SECTION.                                  EXEC84.2
   000949         096800*==============================                                   EXEC84.2
   000950         096900*                                                                 EXEC84.2
   000951         097100*    THIS IS THE MAIN CONTROL SECTION FOR THE PROCESSING OF    *  EXEC84.2
   000952         097200*    THE POPULATION FILE.  IT OBTAINS THE HEADER FOR THE FIRST *  EXEC84.2
   000953         097300*    AUDIT ROUTINE IN THE POPFILE AND PROCESSES ALL RECORDS.   *  EXEC84.2
   000954         097400*                                                              *  EXEC84.2
   000955         097500*    PERFORMED BY    A10-MAIN                                  *  EXEC84.2
   000956         097600*    PERFORMS        D11-GET-NEXT-PROGRAM                      *  EXEC84.2
   000957         097700*                    D15-END-OF-POPFILE                        *  EXEC84.2
   000958         097800*                    D20-PROCESS-POPFILE                       *  EXEC84.2
   000959         098000 D10-1-OPEN-FILES.                                                EXEC84.2
   000960         098100     IF      WY-NEW-POP = "Y"                                     EXEC84.2 337
   000961      1  098200             OPEN    OUTPUT UPDATED-POPULATION-FILE.              EXEC84.2 56
   000962         098300                                                                  EXEC84.2
   000963         098400     IF      WY-NO-SOURCE = SPACE                                 EXEC84.2 335 IMP
   000964      1  098500             OPEN    OUTPUT SOURCE-COBOL-PROGRAMS.                EXEC84.2 51
   000965         098600                                                                  EXEC84.2
   000966         098700     OPEN    INPUT   POPULATION-FILE.                             EXEC84.2 40
   000967         098800     PERFORM D10-20-GET-VERSION.                                  EXEC84.2 982
   000968         098900     MOVE WZ-VERSION-CARD TO PRINT-DATA.                          EXEC84.2 398 50
   000969         099000     PERFORM X20-PRINT-DETAIL.                                    EXEC84.2 2100
   000970         099100                                                                  EXEC84.2
   000971         099200 D10-10-GET-HEADER.                                               EXEC84.2
   000972         099300     PERFORM D11-GET-NEXT-PROGRAM.                                EXEC84.2 992
   000973         099400                                                                  EXEC84.2
   000974         099500     PERFORM D20-PROCESS-POPFILE                                  EXEC84.2 1085
   000975         099600             UNTIL   WZ-END-OF-POPFILE = "Y".                     EXEC84.2 344
   000976         099700                                                                  EXEC84.2
   000977         099800     PERFORM D15-END-OF-POPFILE.                                  EXEC84.2 1024
   000978         099900                                                                  EXEC84.2
   000979         100000 D10-EXIT.                                                        EXEC84.2
   000980         100100     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000981         100200/                                                                 EXEC84.2
   000982         100300 D10-20-GET-VERSION SECTION.                                      EXEC84.2
   000983         100400*============================                                     EXEC84.2
   000984         100500*                                                                 EXEC84.2
   000985         100600 D10-20-INIT-VER.                                                 EXEC84.2
   000986         100700     MOVE WZ-VERSION-NUM TO WA-VERSION-NUM.                       EXEC84.2 403 83
   000987         100800     MOVE WZ-VERSION-DATE TO WA-VERSION-DATE.                     EXEC84.2 405 87
   000988         100900                                                                  EXEC84.2
   000989         101000 D10-20-EXIT.                                                     EXEC84.2
   000990         101100     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   000991         101200/                                                                 EXEC84.2
   000992         101300 D11-GET-NEXT-PROGRAM SECTION.                                    EXEC84.2
   000993         101400*============================                                     EXEC84.2
   000994         101500*                                                                 EXEC84.2
   000995         101700*    PERFORMED BY    D10-MERGE-UPDATE-CARDS                    *  EXEC84.2
   000996         101800*                    D30-PROCESS-HEADER                        *  EXEC84.2
   000997         102000 D11-1-READ-POPFILE.                                              EXEC84.2
   000998         102100     MOVE SPACES  TO WC-STAR-HEADER.                              EXEC84.2 IMP 216
   000999         102200                                                                  EXEC84.2
   001000         102300     PERFORM X30-READ-POPFILE                                     EXEC84.2 2125
   001001         102400             UNTIL   WC-STAR-HEADER = "*HEADER".                  EXEC84.2 216
   001002         102500 D11-TEST-END.                                                    EXEC84.2
   001003         102600     IF      WZ-END-OF-POPFILE = "Y"                              EXEC84.2 344
   001004      1  102700             GO TO   D11-EXIT.                                    EXEC84.2 1021
   001005         102800                                                                  EXEC84.2
   001006         102900     IF      WC-COBOL NOT = "COBOL"                               EXEC84.2 218
   001007      1  103000             IF      WC-COBOL = "CLBRY"                           EXEC84.2 218
   001008      2  103100                     IF      WY-NO-LIBRARY = "Y"                  EXEC84.2 334
   001009      3  103200                             GO TO   D11-1-READ-POPFILE           EXEC84.2 997
   001010      2  103300                     ELSE                                         EXEC84.2
   001011      3  103400                             NEXT SENTENCE                        EXEC84.2
   001012      1  103500              ELSE                                                EXEC84.2
   001013      2  103600                     IF      WC-COBOL = "DATA*"                   EXEC84.2 218
   001014      3  103700                             IF    WY-NO-DATA = "Y"               EXEC84.2 333
   001015      4  103800                                   GO TO D11-1-READ-POPFILE       EXEC84.2 997
   001016      3  103900                             ELSE                                 EXEC84.2
   001017      4  104000                                   NEXT SENTENCE                  EXEC84.2
   001018      2  104100                     ELSE                                         EXEC84.2
   001019      3  104200                             GO TO   D11-1-READ-POPFILE.          EXEC84.2 997
   001020         104300                                                                  EXEC84.2
   001021         104400 D11-EXIT.                                                        EXEC84.2
   001022         104500     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001023         104600/                                                                 EXEC84.2
   001024         104700 D15-END-OF-POPFILE SECTION.                                      EXEC84.2
   001025         104800*==========================                                       EXEC84.2
   001026         104900*                                                                 EXEC84.2
   001027         105100*    THIS SECTION PRINTS END OF RUN ACCOUNTING INFORMATION AND *  EXEC84.2
   001028         105200*    FLAGS ANY OUTSTANDING *UPDATE RECORDS AS UNUSED.          *  EXEC84.2
   001029         105300*                                                              *  EXEC84.2
   001030         105400*    PERFORMED BY           D10-MERGE-UPDATE-CARD              *  EXEC84.2
   001031         105500*    PERFORMS               D16-FLAG-UNUSED-UPDATES            *  EXEC84.2
   001032         105600*                           X20-PRINT-DETAIL                   *  EXEC84.2
   001033         105800 D15-1-SET-UP-FIELDS.                                             EXEC84.2
   001034         105900     MOVE    WZ-PROGS-FOUND  TO WA-PROGS-FOUND.                   EXEC84.2 379 126
   001035         106000     MOVE    WA-FINAL-LINE-1 TO PRINT-DATA.                       EXEC84.2 121 50
   001036         106100     PERFORM X20-PRINT-DETAIL.                                    EXEC84.2 2100
   001037         106200                                                                  EXEC84.2
   001038         106300     IF      WY-NO-SOURCE = SPACE                                 EXEC84.2 335 IMP
   001039      1  106400             MOVE    WZ-SOURCE-PROGS TO WA-SOURCE-PROGS           EXEC84.2 377 130
   001040      1  106500             MOVE    WA-FINAL-LINE-2 TO PRINT-DATA                EXEC84.2 127 50
   001041      1  106600             PERFORM X20-PRINT-DETAIL.                            EXEC84.2 2100
   001042         106700                                                                  EXEC84.2
   001043         106800     IF      WY-NEW-POP = "Y"                                     EXEC84.2 337
   001044      1  106900             MOVE    WZ-NEWPOP-PROGS TO WA-NEWPOP-PROGS           EXEC84.2 378 135
   001045      1  107000             MOVE    WA-FINAL-LINE-3 TO PRINT-DATA                EXEC84.2 131 50
   001046      1  107100             PERFORM X20-PRINT-DETAIL.                            EXEC84.2 2100
   001047         107200                                                                  EXEC84.2
   001048         107300     IF      WZ-END-OF-UPDATES = SPACE                            EXEC84.2 352 IMP
   001049      1  107400             READ    CONTROL-CARD-FILE INTO  WB-CONTROL-DATA      EXEC84.2 45 136
   001050      2  107500                     AT END  MOVE "Y" TO WZ-END-OF-UPDATES.       EXEC84.2 352
   001051         107600                                                                  EXEC84.2
   001052         107700     PERFORM D16-FLAG-UNUSED-UPDATES                              EXEC84.2 1072
   001053         107800       UNTIL WZ-END-OF-UPDATES = "Y".                             EXEC84.2 352
   001054         107900                                                                  EXEC84.2
   001055         108000     IF WY-SELECT-PROG = "Y" AND                                  EXEC84.2 338
   001056         108100       WF-PROGRAM-SELECTED-TABLE NOT = SPACES                     EXEC84.2 266 IMP
   001057      1  108200       MOVE "SOME PROGRAMS NOT FOUND" TO PRINT-DATA               EXEC84.2 50
   001058      1  108300       PERFORM X20-PRINT-DETAIL                                   EXEC84.2 2100
   001059      1  108400       PERFORM VARYING SUB7 FROM 1 BY 1 UNTIL SUB7 > 50           EXEC84.2 72 72
   001060      2  108500         IF WF-PROGRAM-SELECTED (SUB7) NOT = SPACE                EXEC84.2 267 72 IMP
   001061      3  108600              MOVE WF-PROGRAM-SELECTED (SUB7) TO PRINT-DATA       EXEC84.2 267 72 50
   001062      3  108700              PERFORM X20-PRINT-DETAIL                            EXEC84.2 2100
   001063      2  108800              END-IF                                              EXEC84.2
   001064      1  108900         END-PERFORM.                                             EXEC84.2
   001065         109000                                                                  EXEC84.2
   001066         109100 D15-EXIT.                                                        EXEC84.2
   001067         109200     EXIT.                                                        EXEC84.2
   001068         109300                                                                  EXEC84.2
   001069         109400                                                                  EXEC84.2
   001070         109500                                                                  EXEC84.2
   001071         109600                                                                  EXEC84.2
   001072         109700 D16-FLAG-UNUSED-UPDATES SECTION.                                 EXEC84.2
   001073         109800*===============================                                  EXEC84.2
   001074         109900 D16-1-PRINT-UPDATES.                                             EXEC84.2
   001075         110000     MOVE    WB-CONTROL-DATA TO PRINT-DATA.                       EXEC84.2 136 50
   001076         110100     PERFORM X20-PRINT-DETAIL.                                    EXEC84.2 2100
   001077         110200     READ    CONTROL-CARD-FILE INTO  WB-CONTROL-DATA              EXEC84.2 45 136
   001078      1  110300             AT END  MOVE "Y" TO WZ-END-OF-UPDATES.               EXEC84.2 352
   001079         110400                                                                  EXEC84.2
   001080         110500 D16-EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         110600     EXIT.                                                        EXEC84.2
   001082         110700                                                                  EXEC84.2
   001083         110800                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001084         110900/                                                                 EXEC84.2
   001085         111000 D20-PROCESS-POPFILE SECTION.                                     EXEC84.2
   001086         111100*===========================                                      EXEC84.2
   001087         111200*                                                                 EXEC84.2
   001088         111400*    THIS IS THE MAIN CONTROL SECTION FOR POPULATION FILE      *  EXEC84.2
   001089         111500*    PROCESSING.                                               *  EXEC84.2
   001090         111600*                                                              *  EXEC84.2
   001091         111700*    PERFORMED BY    D10-MERGE-UPDATE-CARDS                    *  EXEC84.2
   001092         111800*    PERFORMS        D25-PRINT-REPORT                          *  EXEC84.2
   001093         111900*                    D30-PROCESS-HEADER                        *  EXEC84.2
   001094         112000*                    D90-PROCESS-END-OF                        *  EXEC84.2
   001095         112100*                    X10-WRITE-UPDATED-POPFILE                 *  EXEC84.2
   001096         112200*                    X30-READ-POPFILE                          *  EXEC84.2
   001097         112300*                    X40-WRITE-SOURCE-FILE                     *  EXEC84.2
   001098         112500 D20-1-CHECK-RECORD-TYPE.                                         EXEC84.2
   001099         112600     MOVE    SPACE TO WZ-NOT-THIS-COMMENT.                        EXEC84.2 IMP 355
   001100         112700     MOVE    SPACE TO WZ-LINE-UPDATE.                             EXEC84.2 IMP 349
   001101         112800     MOVE    SPACE TO WZ-REPLACE-FLAG.                            EXEC84.2 IMP 348
   001102         112900*    MOVE   "Y"    TO WZ-UPDATE-THIS-PROG.                        EXEC84.2
   001103         113000     MOVE    SPACE TO WZ-OPTIONAL-SELECTED.                       EXEC84.2 IMP 353
   001104         113100     MOVE    SPACE TO WZ-DELETE-FLAG.                             EXEC84.2 IMP 354
   001105         113200                                                                  EXEC84.2
   001106         113300     IF      WC-STAR-HEADER = "*HEADER"                           EXEC84.2 216
   001107      1  113400             MOVE    SPACE  TO WZ-PROGRAM-SELECTED                EXEC84.2 IMP 343
   001108      1  113500             PERFORM D30-PROCESS-HEADER                           EXEC84.2 1227
   001109      1  113600                     UNTIL  WZ-PROGRAM-SELECTED = "Y"             EXEC84.2 343
   001110         113700     ELSE                                                         EXEC84.2
   001111      1  113800             IF      WC-STAR-HEADER = "*END-OF"                   EXEC84.2 216
   001112      2  113900                     PERFORM D90-PROCESS-END-OF                   EXEC84.2 2006
   001113      1  114000             ELSE                                                 EXEC84.2
   001114      2  114100                     PERFORM D50-PROCESS-COBOL-LINE.              EXEC84.2 1573
   001115         114200                                                                  EXEC84.2
   001116         114300     PERFORM D25-PRINT-REPORT.                                    EXEC84.2 1148
   001117         114400                                                                  EXEC84.2
   001118         114500 D20-10-SOURCE-CHECK.                                             EXEC84.2
   001119         114600     IF      WY-NO-SOURCE        = "Y"                            EXEC84.2 335
   001120      1  114700             GO TO   D20-20-UPDATED-POP-CHECK.                    EXEC84.2 1131
   001121         114800     IF      WZ-DELETE-FLAG      = "Y"                            EXEC84.2 354
   001122      1  114900             GO TO   D20-20-UPDATED-POP-CHECK.                    EXEC84.2 1131
   001123         115000     IF      WZ-NOT-THIS-COMMENT = "Y"                            EXEC84.2 355
   001124      1  115100             GO TO   D20-20-UPDATED-POP-CHECK.                    EXEC84.2 1131
   001125         115200*    IF      WZ-UPDATE-THIS-PROG =  SPACE                         EXEC84.2
   001126         115300*            GO TO   D20-30-READ-FILE.                            EXEC84.2
   001127         115400                                                                  EXEC84.2
   001128         115500     IF      WZ-END-OF-POPFILE NOT = "Y"                          EXEC84.2 344
   001129      1  115600             PERFORM X40-WRITE-SOURCE-FILE.                       EXEC84.2 2177
   001130         115700                                                                  EXEC84.2
   001131         115800 D20-20-UPDATED-POP-CHECK.                                        EXEC84.2
   001132         115900     IF      WY-NEW-POP = "Y"                                     EXEC84.2 337
   001133      1  116000             PERFORM X10-WRITE-UPDATED-POPFILE.                   EXEC84.2 2068
   001134         116100             MOVE WZ-SAVE-POP-RECORD TO WC-CURRENT-POP-RECORD.    EXEC84.2 382 211
   001135         116200                                                                  EXEC84.2
   001136         116300 D20-30-READ-FILE.                                                EXEC84.2
   001137         116400     IF      WZ-END-OF-POPFILE = "Y"                              EXEC84.2 344
   001138      1  116500             GO TO   D20-EXIT.                                    EXEC84.2 1144
   001139         116600     IF      WB-SEQ-1 = SPACES                                    EXEC84.2 202 IMP
   001140      1  116700             MOVE    WZ-SAVE-SEQ TO WC-6                          EXEC84.2 383 237
   001141      1  116800             GO TO   D20-EXIT.                                    EXEC84.2 1144
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001142         116900     PERFORM X30-READ-POPFILE.                                    EXEC84.2 2125
   001143         117000                                                                  EXEC84.2
   001144         117100 D20-EXIT.                                                        EXEC84.2
   001145         117200     EXIT.                                                        EXEC84.2
   001146         117300                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001147         117400/                                                                 EXEC84.2
   001148         117500 D25-PRINT-REPORT SECTION.                                        EXEC84.2
   001149         117600*========================                                         EXEC84.2
   001150         117700*                                                                 EXEC84.2
   001151         117900*    DEPENDING ON THE PRINT OPTIONS SELECTED, THIS SECTION     *  EXEC84.2
   001152         118000*    PRINTS EITHER THE EXTRACTED PROGRAMS OR ANY UPDATES AND   *  EXEC84.2
   001153         118100*    X-CARD SUBSTITUTIONS MADE.                                *  EXEC84.2
   001154         118200*                                                              *  EXEC84.2
   001155         118300*    PERFORMED BY    D20-PROCESS-POPFILE                       *  EXEC84.2
   001156         118400*    PERFORMS        X20-PRINT-DETAIL                          *  EXEC84.2
   001157         118500*                    D27-PRINT-UPDATES                         *  EXEC84.2
   001158         118700 D25-1-CHECK-LIST-PROGRAMS.                                       EXEC84.2
   001159         118800     IF      WY-LIST-PROGRAMS = "Y"                               EXEC84.2 331
   001160      1  118900             MOVE    WC-CURRENT-POP-RECORD TO PRINT-DATA          EXEC84.2 211 50
   001161      1  119000             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   001162      1  119100             GO TO   D25-EXIT.                                    EXEC84.2 1180
   001163         119200                                                                  EXEC84.2
   001164         119300 D25-10-UPDATES-CHECK.                                            EXEC84.2
   001165         119400     IF      WY-LIST-NO-UPDATES = SPACE                           EXEC84.2 329 IMP
   001166      1  119500             IF      WZ-LINE-UPDATE = "Y"                         EXEC84.2 349
   001167      2  119600                     PERFORM D27-PRINT-UPDATES                    EXEC84.2 1186
   001168      2  119700                     GO TO   D25-EXIT.                            EXEC84.2 1180
   001169         119800                                                                  EXEC84.2
   001170         119900 D25-20-X-CARD-CHECK.                                             EXEC84.2
   001171         120000     IF      WY-LIST-X-CARDS = "Y"                                EXEC84.2 330
   001172      1  120100             IF      WZ-SAVE-12-15 = "XXXX"                       EXEC84.2 386
   001173      2  120200                     MOVE    WZ-SAVE-12-20 TO WE-X-CARD           EXEC84.2 385 262
   001174      2  120300                     MOVE   "SUBSTITUTION" TO WE-CHANGE-TYPE      EXEC84.2 264
   001175      2  120400                     MOVE    WC-CURRENT-POP-RECORD                EXEC84.2 211
   001176      2  120500                                           TO WE-COBOL-LINE       EXEC84.2 260
   001177      2  120600                     MOVE    WE-PRINT-DATA TO PRINT-DATA          EXEC84.2 259 50
   001178      2  120700                     PERFORM X20-PRINT-DETAIL.                    EXEC84.2 2100
   001179         120800                                                                  EXEC84.2
   001180         120900 D25-EXIT.                                                        EXEC84.2
   001181         121000     EXIT.                                                        EXEC84.2
   001182         121100                                                                  EXEC84.2
   001183         121200                                                                  EXEC84.2
   001184         121300                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001185         121400/                                                                 EXEC84.2
   001186         121500 D27-PRINT-UPDATES SECTION.                                       EXEC84.2
   001187         121600*=========================                                        EXEC84.2
   001188         121700*                                                                 EXEC84.2
   001189         121900*    THIS SECTION WILL PRINT THE ORIGINAL POPULATION FILE      *  EXEC84.2
   001190         122000*    RECORD (IF "*LIST NO-UPDATES" HAS NOT BEEN SPECIFIED) AND,*  EXEC84.2
   001191         122100*    IF A REPLACEMENT, THE NEW IMAGE OR, IF AN INSERTION, JUST *  EXEC84.2
   001192         122200*    THE NEW LINE OF CODE.                                     *  EXEC84.2
   001193         122300*                                                              *  EXEC84.2
   001194         122400*    PERFORMED BY    D25-PRINT-REPORT                          *  EXEC84.2
   001195         122500*    PERFORMS        X20-PRINT-DETAIL                          *  EXEC84.2
   001196         122700 D27-1-PRINT-REPLACEMENTS.                                        EXEC84.2
   001197         122800     IF      WZ-REPLACE-FLAG = "Y"                                EXEC84.2 348
   001198      1  122900             MOVE    WZ-SAVE-POP-RECORD  TO WE-COBOL-LINE         EXEC84.2 382 260
   001199      1  123000             MOVE    SPACES              TO WE-X-CARD             EXEC84.2 IMP 262
   001200      1  123100             MOVE   "ORIGINAL"           TO WE-CHANGE-TYPE        EXEC84.2 264
   001201      1  123200             MOVE    WE-PRINT-DATA       TO PRINT-DATA            EXEC84.2 259 50
   001202      1  123300             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   001203      1  123400             MOVE   "REPLACEMENT"        TO WE-CHANGE-TYPE        EXEC84.2 264
   001204      1  123500             MOVE    SPACES              TO WE-X-CARD             EXEC84.2 IMP 262
   001205      1  123600             MOVE    WC-CURRENT-POP-RECORD  TO WE-COBOL-LINE      EXEC84.2 211 260
   001206      1  123700             MOVE    WE-PRINT-DATA       TO PRINT-DATA            EXEC84.2 259 50
   001207      1  123800             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   001208      1  123900             GO TO   D27-EXIT.                                    EXEC84.2 1223
   001209         124000                                                                  EXEC84.2
   001210         124100 D27-10-PRINT-NEW-DATA.                                           EXEC84.2
   001211         124200     IF      WZ-DONT-READ-POPFILE = "Y"                           EXEC84.2 346
   001212      1  124300             MOVE    WC-CURRENT-POP-RECORD TO WE-COBOL-LINE       EXEC84.2 211 260
   001213      1  124400             MOVE    WE-PRINT-DATA         TO PRINT-DATA          EXEC84.2 259 50
   001214      1  124500             PERFORM X20-PRINT-DETAIL                             EXEC84.2 2100
   001215      1  124600             GO TO   D27-EXIT.                                    EXEC84.2 1223
   001216         124700                                                                  EXEC84.2
   001217         124800 D27-20-PRINT-DELETIONS.                                          EXEC84.2
   001218         124900     IF      WZ-DELETE-FLAG = "Y"                                 EXEC84.2 354
   001219      1  125000             MOVE    WZ-SAVE-POP-RECORD  TO WE-COBOL-LINE         EXEC84.2 382 260
   001220      1  125100             MOVE    WE-PRINT-DATA       TO PRINT-DATA            EXEC84.2 259 50
   001221      1  125200             PERFORM X20-PRINT-DETAIL.                            EXEC84.2 2100
   001222         125300                                                                  EXEC84.2
   001223         125400 D27-EXIT.                                                        EXEC84.2
   001224         125500     EXIT.                                                        EXEC84.2
   001225         125600                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001226         125700/                                                                 EXEC84.2
   001227         125800 D30-PROCESS-HEADER SECTION.                                      EXEC84.2
   001228         125900*==========================                                       EXEC84.2
   001229         126000*                                                                 EXEC84.2
   001230         126200*    THIS SECTION PROCESSES ANY "*HEADER" RECORDS.             *  EXEC84.2
   001231         126300*                                                              *  EXEC84.2
   001232         126400*    PERFORMED BY    D20-PROCESS-POPFILE                       *  EXEC84.2
   001233         126500*    PERFORMS        D90-PROCESS-END-OF                        *  EXEC84.2
   001234         126600*                    D11-GET-NEXT-PROGRAM                      *  EXEC84.2
   001235         126700*                    D31-PROCESS-DATA-HEADER                   *  EXEC84.2
   001236         126800*                    D32-PROCESS-COBOL-HEADER                  *  EXEC84.2
   001237         126900*                    D40-ANY-UPDATES                           *  EXEC84.2
   001238         127000*                    X10-WRITE-UPDATED-POPFILE                 *  EXEC84.2
   001239         127100*                    D43-PROGRAM-SELECTED                      *  EXEC84.2
   001240         127300 D30-1-CHECK-HEADER-TYPE.                                         EXEC84.2
   001241         127400     MOVE    WC-COBOL TO BLOCK-TYPE                               EXEC84.2 218 65
   001242         127500     IF      WC-COBOL = "CLBRY"                                   EXEC84.2 218
   001243         127600     AND WY-NO-LIBRARY NOT = "Y"                                  EXEC84.2 334
   001244      1  127700             MOVE WC-HEADER TO PRINT-DATA                         EXEC84.2 215 50
   001245      1  127800             MOVE WC-PROG-ID TO WZ-CURRENT-MAIN-PROG              EXEC84.2 220 363
   001246      1  127900                                WZ-CURRENT-POP-PROG               EXEC84.2 367
   001247         128100* NOTE FOLLOWING CHANGES                                      *** EXEC84.2
   001248         128300*            PERFORM D36-INITIALISE-PROGRAM-TOTALS                EXEC84.2
   001249      1  128400             MOVE   "Y" TO WZ-PROGRAM-SELECTED                    EXEC84.2 343
   001250      1  128500             PERFORM D34-PROGRAM-SELECTED.                        EXEC84.2 1435
   001251         128600                                                                  EXEC84.2
   001252         128700     IF      WC-COBOL = "DATA*"                                   EXEC84.2 218
   001253      1  128800             PERFORM D31-PROCESS-DATA-HEADER.                     EXEC84.2 1277
   001254         128900                                                                  EXEC84.2
   001255         129000     IF      WC-COBOL = "COBOL"                                   EXEC84.2 218
   001256      1  129100             ADD     1 TO WZ-PROGS-FOUND                          EXEC84.2 379
   001257      1  129200             PERFORM D32-PROCESS-COBOL-HEADER.                    EXEC84.2 1302
   001258         129300                                                                  EXEC84.2
   001259         129400     IF      WZ-PROGRAM-SELECTED = "Y"                            EXEC84.2 343
   001260      1  129500             GO TO   D30-20-HEADER-SELECTED.                      EXEC84.2 1269
   001261         129600                                                                  EXEC84.2
   001262         129700     PERFORM D11-GET-NEXT-PROGRAM.                                EXEC84.2 992
   001263         129800     IF      WZ-END-OF-POPFILE = "Y"                              EXEC84.2 344
   001264      1  129900             MOVE    "Y" TO WZ-PROGRAM-SELECTED                   EXEC84.2 343
   001265      1  130000             GO TO    D30-EXIT                                    EXEC84.2 1274
   001266         130100     ELSE                                                         EXEC84.2
   001267      1  130200             GO TO    D30-1-CHECK-HEADER-TYPE.                    EXEC84.2 1240
   001268         130300                                                                  EXEC84.2
   001269         130400 D30-20-HEADER-SELECTED.                                          EXEC84.2
   001270         130500     MOVE    WC-COBOL TO WZ-CURRENT-HEADER.                       EXEC84.2 218 356
   001271         130600     IF      WZ-END-OF-UPDATES = SPACE                            EXEC84.2 352 IMP
   001272      1  130700             PERFORM D40-ANY-UPDATES.                             EXEC84.2 1498
   001273         130800                                                                  EXEC84.2
   001274         130900 D30-EXIT.                                                        EXEC84.2
   001275         131000     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001276         131100/                                                                 EXEC84.2
   001277         131200 D31-PROCESS-DATA-HEADER SECTION.                                 EXEC84.2
   001278         131300*===============================                                  EXEC84.2
   001279         131400*                                                                 EXEC84.2
   001280         131500 D31-1-CHECK-FOR-DATA-SELECTED.                                   EXEC84.2
   001281         131600     IF      WY-NO-DATA = "Y"                                     EXEC84.2 333
   001282      1  131700             GO TO   D31-EXIT.                                    EXEC84.2 1298
   001283         131800                                                                  EXEC84.2
   001284         131900     IF      WZ-PROG-ID-6 = "M"                                   EXEC84.2 369
   001285      1  132000             GO TO   D31-30-MANUAL-CHECK.                         EXEC84.2 1293
   001286         132100                                                                  EXEC84.2
   001287         132200 D31-20-AUTO-CHECK.                                               EXEC84.2
   001288         132300     IF      WY-EXTRACT-MAN = SPACE                               EXEC84.2 327 IMP
   001289      1  132400             MOVE   "Y"        TO WZ-PROGRAM-SELECTED             EXEC84.2 343
   001290         132500     ELSE                                                         EXEC84.2
   001291      1  132600             GO TO   D31-EXIT.                                    EXEC84.2 1298
   001292         132700                                                                  EXEC84.2
   001293         132800 D31-30-MANUAL-CHECK.                                             EXEC84.2
   001294         132900     IF      WY-EXTRACT-AUTO = SPACE                              EXEC84.2 326 IMP
   001295      1  133000             MOVE   "Y"        TO WZ-PROGRAM-SELECTED.            EXEC84.2 343
   001296         133100                                                                  EXEC84.2
   001297         133200                                                                  EXEC84.2
   001298         133300 D31-EXIT.                                                        EXEC84.2
   001299         133400     EXIT.                                                        EXEC84.2
   001300         133500                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001301         133600/                                                                 EXEC84.2
   001302         133700 D32-PROCESS-COBOL-HEADER SECTION.                                EXEC84.2
   001303         133800*================================                                 EXEC84.2
   001304         133900*                                                                 EXEC84.2
   001305         134100*    THIS SECTION CHECKS TO SEE IF THE CURRENT HEADER IS       *  EXEC84.2
   001306         134200*    IS WITHIN THE RANGE SPECIFIED BY THE "*EXTRACT" OR        *  EXEC84.2
   001307         134300*    "*SELECT" RECORDS OF THE INPUT CONTROL-FILE.              *  EXEC84.2
   001308         134400*                                                              *  EXEC84.2
   001309         134500*    PERFORMED BY    D30-PROCESS-HEADER                        *  EXEC84.2
   001310         134600*    PERFORMS        D33-MODULE-CHECK                          *  EXEC84.2
   001311         134700*                    D34-PROGRAM-SELECTED                      *  EXEC84.2
   001312         134900*                                                              *  EXEC84.2
   001313         135100*  IF PROGRAM DOES NOT END WITH '5','A','B' OR 'M' IT          *  EXEC84.2
   001314         135200*  SHOULD HAVE A SPACE CHARACTER FOR POSITION 6.               *  EXEC84.2
   001315         135400*                                                              *  EXEC84.2
   001316         135500 D32-0-CHECK-A-OR-M.                                              EXEC84.2
   001317         135600     IF WC-PROG-ID-6 = "A"                                        EXEC84.2 227
   001318      1  135700        GO TO D32-1-CHECK-FOR-ALL-SELECTED.                       EXEC84.2 1326
   001319         135800     IF WC-PROG-ID-6 = "B"                                        EXEC84.2 227
   001320      1  135900        GO TO D32-1-CHECK-FOR-ALL-SELECTED.                       EXEC84.2 1326
   001321         136000     IF WC-PROG-ID-6 = "M"                                        EXEC84.2 227
   001322      1  136100        GO TO D32-1-CHECK-FOR-ALL-SELECTED.                       EXEC84.2 1326
   001323         136200     IF WC-PROG-ID-6 = "5"                                        EXEC84.2 227
   001324      1  136300        GO TO D32-1-CHECK-FOR-ALL-SELECTED.                       EXEC84.2 1326
   001325         136400     MOVE SPACE TO WC-PROG-ID-6.                                  EXEC84.2 IMP 227
   001326         136500 D32-1-CHECK-FOR-ALL-SELECTED.                                    EXEC84.2
   001327         136600     IF      WY-EXTRACT-ALL = "Y"                                 EXEC84.2 325
   001328      1  136700             MOVE   "Y" TO WZ-PROGRAM-SELECTED                    EXEC84.2 343
   001329      1  136800             MOVE    WC-PROG-ID TO WZ-CURRENT-POP-PROG            EXEC84.2 220 367
   001330      1  136900             GO TO   D32-50-CHECK-IF-SELECTED.                    EXEC84.2 1389
   001331         137000                                                                  EXEC84.2
   001332         137100 D32-10-MANUAL-CHECK.                                             EXEC84.2
   001333         137200     IF      WY-EXTRACT-MAN = "Y"                                 EXEC84.2 327
   001334      1  137300             IF      WC-PROG-ID-6 = "M"                           EXEC84.2 227
   001335      2  137400                     MOVE   "Y" TO WZ-PROGRAM-SELECTED            EXEC84.2 343
   001336      2  137500                     MOVE    WC-PROG-ID TO WZ-CURRENT-POP-PROG    EXEC84.2 220 367
   001337      2  137600                     GO TO   D32-50-CHECK-IF-SELECTED.            EXEC84.2 1389
   001338         137700                                                                  EXEC84.2
   001339         137800 D32-20-AUTO-CHECK.                                               EXEC84.2
   001340         137900     IF      WY-EXTRACT-AUTO = "Y"                                EXEC84.2 326
   001341      1  138000             IF      WC-PROG-ID-6 = "A" OR "B"                    EXEC84.2 227
   001342      2  138100                     MOVE   "Y" TO WZ-PROGRAM-SELECTED            EXEC84.2 343
   001343      2  138200                     MOVE    WC-PROG-ID TO WZ-CURRENT-POP-PROG    EXEC84.2 220 367
   001344      2  138300                     GO TO   D32-50-CHECK-IF-SELECTED.            EXEC84.2 1389
   001345         138400                                                                  EXEC84.2
   001346         138500 D32-30-MODULE-CHECK.                                             EXEC84.2
   001347         138600     IF      WY-SELECT-MODULE = "Y"                               EXEC84.2 339
   001348         138700*THE FOLLOWING CHECK ASSUMES THAT THE FILES ON THE POPFILE        EXEC84.2
   001349         138800*ARE IN ORDER!                                                    EXEC84.2
   001350      1  138900             IF WG-MODULE-SELECTED-TABLE = SPACES                 EXEC84.2 269 IMP
   001351      2  139000                MOVE "Y" TO WZ-END-OF-POPFILE                     EXEC84.2 344
   001352      1  139100             ELSE                                                 EXEC84.2
   001353      2  139200             MOVE    1 TO SUB6                                    EXEC84.2 71
   001354      2  139300             PERFORM D33-MODULE-CHECK                             EXEC84.2 1396
   001355      2  139400             GO TO   D32-50-CHECK-IF-SELECTED.                    EXEC84.2 1389
   001356         139500                                                                  EXEC84.2
   001357         139600     MOVE    1 TO SUB7.                                           EXEC84.2 72
   001358         139700 D32-40-PROGRAM-CHECK.                                            EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001359         139800     IF      WY-SELECT-PROG = "Y"                                 EXEC84.2 338
   001360      1  139900             IF WF-PROGRAM-SELECTED-TABLE = SPACES                EXEC84.2 266 IMP
   001361      2  140000                     MOVE "Y" TO WZ-END-OF-POPFILE                EXEC84.2 344
   001362      1  140100             ELSE                                                 EXEC84.2
   001363      2  140200             IF      WC-PROG-ID-1-5 = WF-PROGRAM-SELECTED (SUB7)  EXEC84.2 221 267 72
   001364      3  140300                     MOVE SPACE TO WF-PROGRAM-SELECTED (SUB7)     EXEC84.2 IMP 267 72
   001365      3  140400                     MOVE   "Y" TO WZ-PROGRAM-SELECTED            EXEC84.2 343
   001366      3  140500                     MOVE    WC-PROG-ID TO WZ-CURRENT-POP-PROG    EXEC84.2 220 367
   001367      3  140600                     GO TO   D32-50-CHECK-IF-SELECTED             EXEC84.2 1389
   001368      2  140700             ELSE                                                 EXEC84.2
   001369      3  140800                     IF      SUB7  < 50                           EXEC84.2 72
   001370      4  140900                             ADD     1 TO SUB7                    EXEC84.2 72
   001371      4  141000                             GO TO   D32-40-PROGRAM-CHECK         EXEC84.2 1358
   001372      3  141100                     ELSE                                         EXEC84.2
   001373      4  141200                          IF WC-SUBPRG = "SUBPRG" OR "SUBRTN"     EXEC84.2 229
   001374      5  141300                             MOVE 1 TO SUB7                       EXEC84.2 72
   001375      5  141400                             PERFORM 50 TIMES                     EXEC84.2
   001376      6  141500                                IF WC-PROG2ID-1-5 =               EXEC84.2 232
   001377      6  141600                                  WF-PROGRAM-SELECTED (SUB7)      EXEC84.2 267 72
   001378      7  141700                                  MOVE SPACE TO                   EXEC84.2 IMP
   001379      7  141800                                     WF-PROGRAM-SELECTED (SUB7)   EXEC84.2 267 72
   001380      7  141900                                  MOVE "Y" TO                     EXEC84.2
   001381      7  142000                                     WZ-PROGRAM-SELECTED          EXEC84.2 343
   001382      7  142100                                  MOVE WC-PROG2ID TO              EXEC84.2 231
   001383      7  142200                                     WZ-CURRENT-POP-PROG          EXEC84.2 367
   001384      7  142300                                  GO D32-50-CHECK-IF-SELECTED     EXEC84.2 1389
   001385      6  142400                                  END-IF                          EXEC84.2
   001386      6  142500                             ADD 1 TO SUB7                        EXEC84.2 72
   001387      5  142600                             END-PERFORM.                         EXEC84.2
   001388         142700                                                                  EXEC84.2
   001389         142800 D32-50-CHECK-IF-SELECTED.                                        EXEC84.2
   001390         142900     IF      WZ-PROGRAM-SELECTED = "Y"                            EXEC84.2 343
   001391      1  143000             PERFORM D34-PROGRAM-SELECTED.                        EXEC84.2 1435
   001392         143100                                                                  EXEC84.2
   001393         143200 D32-EXIT.                                                        EXEC84.2
   001394         143300     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001395         143400/                                                                 EXEC84.2
   001396         143500 D33-MODULE-CHECK SECTION.                                        EXEC84.2
   001397         143600*========================                                         EXEC84.2
   001398         143700*                                                                 EXEC84.2
   001399         143900*    IF ONE OR MORE MODULES HAVE BEEN SELECTED, THIS SECTION   *  EXEC84.2
   001400         144000*    CHECKS THAT THE CURRENT POPULATION FILE PROGRAM IS FROM   *  EXEC84.2
   001401         144100*    A SELECTED MODULE (AND LEVEL, IF LEVEL SELECTED).         *  EXEC84.2
   001402         144200*                                                              *  EXEC84.2
   001403         144300*    PERFORMED BY    D32-PROCESS-COBOL-HEADER                  *  EXEC84.2
   001404         144400*    PERFORMS        NONE                                      *  EXEC84.2
   001405         144600 D33-1-MODULE-CHECK.                                              EXEC84.2
   001406         144700     IF      WC-MODULE = WG-MODULE-SELECTED (SUB6)                EXEC84.2 223 271 71
   001407      1  144800             GO TO D33-10-CHECK-MODULE-LEVEL.                     EXEC84.2 1421
   001408         144900     IF      WC-MODULE > WG-MODULE-SELECTED (SUB6) AND            EXEC84.2 223 271 71
   001409         145000*THE FOLLOWING CHECK MAKES SURE SOME FILES GET OFF                EXEC84.2
   001410         145100             WZ-SOURCE-PROGS NOT = 0                              EXEC84.2 377
   001411      1  145200             MOVE SPACE TO WG-MODULE-SELECTED (SUB6)              EXEC84.2 IMP 271 71
   001412      1  145300             MOVE SPACE TO WG-MODULE-LEVEL (SUB6)                 EXEC84.2 IMP 272 71
   001413      1  145400             IF      SUB6  < 10                                   EXEC84.2 71
   001414      2  145500                     ADD     1 TO SUB6                            EXEC84.2 71
   001415      2  145600                     GO TO   D33-1-MODULE-CHECK                   EXEC84.2 1405
   001416      1  145700             ELSE                                                 EXEC84.2
   001417      2  145800                     GO TO   D33-EXIT                             EXEC84.2 1431
   001418         145900     ELSE                                                         EXEC84.2
   001419      1  146000             GO TO D33-EXIT.                                      EXEC84.2 1431
   001420         146100                                                                  EXEC84.2
   001421         146200 D33-10-CHECK-MODULE-LEVEL.                                       EXEC84.2
   001422         146300     IF      WG-MODULE-LEVEL (SUB6) = SPACE                       EXEC84.2 272 71 IMP
   001423      1  146400             MOVE    WC-PROG-ID TO WZ-CURRENT-POP-PROG            EXEC84.2 220 367
   001424      1  146500             MOVE   "Y" TO WZ-PROGRAM-SELECTED                    EXEC84.2 343
   001425      1  146600             GO TO   D33-EXIT.                                    EXEC84.2 1431
   001426         146700                                                                  EXEC84.2
   001427         146800     IF      WG-MODULE-LEVEL (SUB6) = WC-LEVEL                    EXEC84.2 272 71 224
   001428      1  146900             MOVE    WC-PROG-ID TO WZ-CURRENT-POP-PROG            EXEC84.2 220 367
   001429      1  147000             MOVE   "Y" TO WZ-PROGRAM-SELECTED.                   EXEC84.2 343
   001430         147100                                                                  EXEC84.2
   001431         147200 D33-EXIT.                                                        EXEC84.2
   001432         147300     EXIT.                                                        EXEC84.2
   001433         147400                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001434         147500/                                                                 EXEC84.2
   001435         147600 D34-PROGRAM-SELECTED SECTION.                                    EXEC84.2
   001436         147700*============================                                     EXEC84.2
   001437         147800*                                                                 EXEC84.2
   001438         148000*    IF THE CURRENT POPULATION FILE PROGRAM HAS BEEN SELECTED  *  EXEC84.2
   001439         148100*    FOR PROCESSING, THIS SECTION UPDATES VARIOUS FIELDS.      *  EXEC84.2
   001440         148200*                                                              *  EXEC84.2
   001441         148300*    PERFORMED BY    D32-PROCESS-COBOL-HEADER                  *  EXEC84.2
   001442         148400*    PERFORMS        NONE                                      *  EXEC84.2
   001443         148600 D34-1-SELECTION-CHECK.                                           EXEC84.2
   001444         148700     IF      WZ-PROGRAM-SELECTED = SPACE                          EXEC84.2 343 IMP
   001445      1  148800             GO TO   D34-EXIT.                                    EXEC84.2 1475
   001446         148900                                                                  EXEC84.2
   001447         149000     IF      WY-NO-SOURCE = SPACE                                 EXEC84.2 335 IMP
   001448      1  149100             ADD     1 TO WZ-SOURCE-PROGS.                        EXEC84.2 377
   001449         149200                                                                  EXEC84.2
   001450         149300     IF      WY-NEW-POP = "Y"                                     EXEC84.2 337
   001451      1  149400             ADD     1 TO WZ-NEWPOP-PROGS.                        EXEC84.2 378
   001452         149500                                                                  EXEC84.2
   001453         149600*    MOVE    SPACE TO WZ-CURRENT-MAIN-PROG.                       EXEC84.2
   001454         149700     MOVE    WZ-CURRENT-POP-PROG TO WZ-CURRENT-MAIN-PROG.         EXEC84.2 367 363
   001455         149800                                                                  EXEC84.2
   001456         149900     PERFORM D36-INITIALISE-PROGRAM-TOTALS.                       EXEC84.2 1478
   001457         150000                                                                  EXEC84.2
   001458         150100     MOVE    WC-HEADER TO PRINT-DATA.                             EXEC84.2 215 50
   001459         150200     IF      WC-SUBPRG = "SUBPRG"                                 EXEC84.2 229
   001460      1  150300             MOVE    WZ-CURRENT-POP-PROG TO WZ-CURRENT-MAIN-PROG  EXEC84.2 367 363
   001461         150400*            MOVE    WC-PROG2ID          TO WZ-CURRENT-UPD-PROG   EXEC84.2
   001462      1  150500             MOVE    WC-PROG2ID          TO WZ-CURRENT-POP-PROG   EXEC84.2 231 367
   001463         150600     END-IF.                                                      EXEC84.2
   001464         150700     IF      WC-SUBPRG = "SUBRTN"                                 EXEC84.2 229
   001465      1  150800             MOVE    WZ-CURRENT-POP-PROG TO WZ-CURRENT-MAIN-PROG  EXEC84.2 367 363
   001466         150900*            MOVE    WC-PROG2ID          TO WZ-CURRENT-UPD-PROG   EXEC84.2
   001467      1  151000             MOVE    WC-PROG2ID          TO WZ-CURRENT-POP-PROG   EXEC84.2 231 367
   001468         151100     END-IF.                                                      EXEC84.2
   001469         151200                                                                  EXEC84.2
   001470         151300 D34-2-OPEN-OUTPUT.                                               EXEC84.2
   001471         151400     IF      WY-LIST-COMPACT = SPACE                              EXEC84.2 332 IMP
   001472      1  151500             MOVE    51 TO WZ-LINE-CT.                            EXEC84.2 390
   001473         151600                                                                  EXEC84.2
   001474         151700     PERFORM X20-PRINT-DETAIL.                                    EXEC84.2 2100
   001475         151800 D34-EXIT.                                                        EXEC84.2
   001476         151900     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001477         152000/                                                                 EXEC84.2
   001478         152100 D36-INITIALISE-PROGRAM-TOTALS SECTION.                           EXEC84.2
   001479         152200*=====================================                            EXEC84.2
   001480         152300*                                                                 EXEC84.2
   001481         152500*    WHEN A PROGRAM "*HEADER" IS SELECTED THIS SECTION RESETS  *  EXEC84.2
   001482         152600*    ALL THE VARIOUS TOTALS FOR THAT PROGRAM.                  *  EXEC84.2
   001483         152700*                                                              *  EXEC84.2
   001484         152800*    PERFORMED BY    D32-PROCESS-COBOL-HEADER                  *  EXEC84.2
   001485         152900*    PERFORMS        NONE                                      *  EXEC84.2
   001486         153100 D36-1-RESET-TOTALS.                                              EXEC84.2
   001487         153200     MOVE    ZERO  TO WZ-LINES-COBOL.                             EXEC84.2 IMP 371
   001488         153300     MOVE    ZERO  TO WZ-LINES-INSERTED.                          EXEC84.2 IMP 372
   001489         153400     MOVE    ZERO  TO WZ-LINES-REPLACED.                          EXEC84.2 IMP 373
   001490         153500     MOVE    ZERO  TO WZ-LINES-DELETED.                           EXEC84.2 IMP 374
   001491         153600     MOVE    ZERO  TO WZ-CODE-REMOVED.                            EXEC84.2 IMP 376
   001492         153700     MOVE    ZERO  TO WZ-COMMENTS-DEL.                            EXEC84.2 IMP 380
   001493         153800     MOVE    ZERO  TO WZ-SEQ-NO.                                  EXEC84.2 IMP 381
   001494         153900                                                                  EXEC84.2
   001495         154000 D36-EXIT.                                                        EXEC84.2
   001496         154100     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001497         154200/                                                                 EXEC84.2
   001498         154300 D40-ANY-UPDATES SECTION.                                         EXEC84.2
   001499         154400*=======================                                          EXEC84.2
   001500         154500*                                                                 EXEC84.2
   001501         154700*    THIS SECTION FINDS THE FIRST UPDATE RECORD (IF ANY) FOR   *  EXEC84.2
   001502         154800*    THE CURRENT POPULATION FILE PROGRAM BEING PROCESSED.      *  EXEC84.2
   001503         154900*                                                              *  EXEC84.2
   001504         155000*    PERFORMED BY    D30-PROCESS-HEADER                        *  EXEC84.2
   001505         155100*    PERFORMS        D42-READ-UPDATE                           *  EXEC84.2
   001506         155300 D40-1-CHECK-UPDATE-AND-POP.                                      EXEC84.2
   001507         155400     MOVE    SPACE TO WZ-UPDATE-THIS-PROG.                        EXEC84.2 IMP 347
   001508         155500     IF      WZ-CURRENT-UPD-PROG > WZ-CURRENT-POP-PROG            EXEC84.2 360 367
   001509      1  155600             GO TO   D40-EXIT.                                    EXEC84.2 1551
   001510         155700                                                                  EXEC84.2
   001511         155800     IF      WZ-CURRENT-UPD-PROG = WZ-CURRENT-POP-PROG            EXEC84.2 360 367
   001512      1  155900             GO TO   D40-20-PROGRAMS-EQUAL.                       EXEC84.2 1539
   001513         156000                                                                  EXEC84.2
   001514         156100*    IF      WZ-CURRENT-POP-PROG = WB-UPDATE-PROG                 EXEC84.2
   001515         156200*            GO TO   D40-20-PROGRAMS-EQUAL.                       EXEC84.2
   001516         156300                                                                  EXEC84.2
   001517         156400     IF      WZ-UPD-PROG-CHAR  = "A"                              EXEC84.2 361
   001518      1  156500             GO TO D40-05-CHECK-LIBRARY.                          EXEC84.2 1524
   001519         156600                                                                  EXEC84.2
   001520         156700     IF      WZ-UPD-PROG-CHAR = "K"                               EXEC84.2 361
   001521      1  156800             GO TO D40-05-CHECK-LIBRARY                           EXEC84.2 1524
   001522      1  156900     ELSE    GO TO D40-10-GET-NEXT-STAR-START.                    EXEC84.2 1528
   001523         157000*                                                                 EXEC84.2
   001524         157100 D40-05-CHECK-LIBRARY.                                            EXEC84.2
   001525         157200     IF      WZ-CURRENT-POP-PROG < "SQ000"                        EXEC84.2 367
   001526      1  157300             GO TO D40-EXIT.                                      EXEC84.2 1551
   001527         157400                                                                  EXEC84.2
   001528         157500 D40-10-GET-NEXT-STAR-START.                                      EXEC84.2
   001529         157600     MOVE    SPACES TO WB-STAR-START.                             EXEC84.2 IMP 195
   001530         157700     PERFORM D42-READ-UPDATE-FILE                                 EXEC84.2 1555
   001531         157800             UNTIL   WB-STAR-START = "*START".                    EXEC84.2 195
   001532         157900                                                                  EXEC84.2
   001533         158000     IF      WZ-END-OF-UPDATES = "Y"                              EXEC84.2 352
   001534      1  158100             GO TO   D40-EXIT.                                    EXEC84.2 1551
   001535         158200     PERFORM C60-START-CARD.                                      EXEC84.2 923
   001536         158300                                                                  EXEC84.2
   001537         158400     GO TO   D40-1-CHECK-UPDATE-AND-POP.                          EXEC84.2 1506
   001538         158500                                                                  EXEC84.2
   001539         158600 D40-20-PROGRAMS-EQUAL.                                           EXEC84.2
   001540         158700     MOVE   "Y"   TO WZ-UPDATE-THIS-PROG.                         EXEC84.2 347
   001541         158800     IF      WB-RENUMBER = "R"                                    EXEC84.2 199
   001542      1  158900             MOVE    "Y"    TO WZ-RESEQUENCE-THIS                 EXEC84.2 350
   001543         159000     ELSE                                                         EXEC84.2
   001544      1  159100             MOVE     SPACE TO WZ-RESEQUENCE-THIS.                EXEC84.2 IMP 350
   001545         159200     READ    CONTROL-CARD-FILE INTO WB-CONTROL-DATA               EXEC84.2 45 136
   001546      1  159300             AT END  MOVE "Y" TO WZ-END-OF-UPDATES.               EXEC84.2 352
   001547         159400                                                                  EXEC84.2
   001548         159500     IF      WB-11 = "*END-UPDATE"                                EXEC84.2 163
   001549      1  159600             MOVE "Y" TO WZ-END-OF-UPDATES.                       EXEC84.2 352
   001550         159700                                                                  EXEC84.2
   001551         159800 D40-EXIT.                                                        EXEC84.2
   001552         159900     EXIT.                                                        EXEC84.2
   001553         160000                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001554         160100/                                                                 EXEC84.2
   001555         160200 D42-READ-UPDATE-FILE SECTION.                                    EXEC84.2
   001556         160300*============================                                     EXEC84.2
   001557         160400 D42-1.                                                           EXEC84.2
   001558         160500     READ    CONTROL-CARD-FILE INTO WB-CONTROL-DATA               EXEC84.2 45 136
   001559      1  160600             AT END  MOVE   "Y"      TO WZ-END-OF-UPDATES         EXEC84.2 352
   001560      1  160700                     MOVE   "*START" TO WB-STAR-START             EXEC84.2 195
   001561      1  160800                     GO TO   D42-EXIT.                            EXEC84.2 1567
   001562         160900                                                                  EXEC84.2
   001563         161000     IF      WB-11 = "*END-UPDATE"                                EXEC84.2 163
   001564      1  161100             MOVE   "Y"      TO WZ-END-OF-UPDATES                 EXEC84.2 352
   001565      1  161200             MOVE   "*START" TO WB-STAR-START.                    EXEC84.2 195
   001566         161300                                                                  EXEC84.2
   001567         161400 D42-EXIT.                                                        EXEC84.2
   001568         161500     EXIT.                                                        EXEC84.2
   001569         161600                                                                  EXEC84.2
   001570         161700                                                                  EXEC84.2
   001571         161800                                                                  EXEC84.2
   001572         161900                                                                  EXEC84.2
   001573         162000 D50-PROCESS-COBOL-LINE SECTION.                                  EXEC84.2
   001574         162100*==============================                                   EXEC84.2
   001575         162200*                                                                 EXEC84.2
   001576         162400*    THIS IS THE MAIN SECTION FOR PROCESSING THE COBOL SOURCE  *  EXEC84.2
   001577         162500*    CODE OF THE POPULATION FILE                               *  EXEC84.2
   001578         162600*                                                              *  EXEC84.2
   001579         162700*                                                              *  EXEC84.2
   001580         162900 D50-1-CHECK-FOR-UPDATING.                                        EXEC84.2
   001581         163000                                                                  EXEC84.2
   001582         163100     IF      WZ-UPDATE-THIS-PROG = "Y"                            EXEC84.2 347
   001583      1  163200             PERFORM D60-PROCESS-UPDATE-CARD.                     EXEC84.2 1596
   001584         163300                                                                  EXEC84.2
   001585         163400     IF      WZ-DELETE-FLAG = "Y"                                 EXEC84.2 354
   001586      1  163500             GO TO   D50-EXIT.                                    EXEC84.2 1593
   001587         163600                                                                  EXEC84.2
   001588         163700     IF      WY-NO-SOURCE = SPACE                                 EXEC84.2 335 IMP
   001589      1  163800             IF    BLOCK-TYPE NOT = "DATA*"                       EXEC84.2 65
   001590      2  163900                   PERFORM D80-RAW-LINE.                          EXEC84.2 1781
   001591         164000                                                                  EXEC84.2
   001592         164100                                                                  EXEC84.2
   001593         164200 D50-EXIT.                                                        EXEC84.2
   001594         164300     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001595         164400/                                                                 EXEC84.2
   001596         164500 D60-PROCESS-UPDATE-CARD SECTION.                                 EXEC84.2
   001597         164600*===============================                                  EXEC84.2
   001598         164700*                                                                 EXEC84.2
   001599         164900*    THIS IS THE MAIN SECTION FOR PROCESSING ANY UPDATE CARDS  *  EXEC84.2
   001600         165000*    WHICH EXIST FOR THE CURRENT POPULATION FILE PROGRAM       *  EXEC84.2
   001601         165100*    BEING PROCESSED.                                          *  EXEC84.2
   001602         165200*                                                              *  EXEC84.2
   001603         165300*    PERFORMED BY    D50-PROCESS-COBOL-LINE                    *  EXEC84.2
   001604         165400*    PERFORMS        D67-LINE-UPDATE                           *  EXEC84.2
   001605         165500*                    D62-SERIES-UPDATE                         *  EXEC84.2
   001606         165700 D60-1-CHECK-BLOCK-INSERT.                                        EXEC84.2
   001607         165800     IF      WB-SEQ-1 = SPACES                                    EXEC84.2 202 IMP
   001608      1  165900             PERFORM D67-LINE-UPDATE                              EXEC84.2 1686
   001609      1  166000             GO TO   D60-30-CHECK-END.                            EXEC84.2 1621
   001610         166100                                                                  EXEC84.2
   001611         166200 D60-10-CHECK-FOR-SERIES-UPDATE.                                  EXEC84.2
   001612         166300     IF      WB-SEQ-1 NOT NUMERIC                                 EXEC84.2 202
   001613      1  166400             GO TO   D60-30-CHECK-END.                            EXEC84.2 1621
   001614         166500                                                                  EXEC84.2
   001615         166600     IF      WB-SEQ-2 NUMERIC                                     EXEC84.2 209
   001616      1  166700             PERFORM D62-SERIES-UPDATE                            EXEC84.2 1629
   001617      1  166800             GO TO   D60-30-CHECK-END                             EXEC84.2 1621
   001618         166900     ELSE                                                         EXEC84.2
   001619      1  167000             PERFORM D67-LINE-UPDATE.                             EXEC84.2 1686
   001620         167100                                                                  EXEC84.2
   001621         167200 D60-30-CHECK-END.                                                EXEC84.2
   001622         167300     IF      WB-11 = "*END-UPDATE"                                EXEC84.2 163
   001623      1  167400             MOVE   "Y" TO WZ-END-OF-UPDATES.                     EXEC84.2 352
   001624         167500                                                                  EXEC84.2
   001625         167600                                                                  EXEC84.2
   001626         167700 D60-EXIT.                                                        EXEC84.2
   001627         167800     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001628         167900/                                                                 EXEC84.2
   001629         168000 D62-SERIES-UPDATE SECTION.                                       EXEC84.2
   001630         168100*=========================                                        EXEC84.2
   001631         168200*                                                                 EXEC84.2
   001632         168400*    THIS SECTION WILL PROCESS SERIES INSERTIONS OR DELETIONS  *  EXEC84.2
   001633         168500*                                                              *  EXEC84.2
   001634         168600*    PERFORMED BY    D60-PROCESS-UPDATE-CARD                   *  EXEC84.2
   001635         168700*    PERFORMS        C60-START-CARD                            *  EXEC84.2
   001636         168900 D62-1-CHECK-FOR-WITHIN-RANGE.                                    EXEC84.2
   001637         169000     IF      WC-6 < WB-SEQ-1                                      EXEC84.2 237 202
   001638      1  169100         IF WZ-WITHIN-DELETE-SERIES-FLAG = "Y"                    EXEC84.2 397
   001639         169200*  ALLOWS FOR OUT-OF-SEQUENCE LINE NUMBER WITHIN DELETE RANGE     EXEC84.2
   001640      2  169300             GO TO D62-20-NOW-WITHIN-RANGE                        EXEC84.2 1666
   001641      1  169400         END-IF                                                   EXEC84.2
   001642      1  169500             GO TO   D62-EXIT.                                    EXEC84.2 1682
   001643         169600                                                                  EXEC84.2
   001644         169700     IF      WC-6 NOT > WB-SEQ-2                                  EXEC84.2 237 209
   001645      1  169800             GO TO   D62-20-NOW-WITHIN-RANGE.                     EXEC84.2 1666
   001646         169900                                                                  EXEC84.2
   001647         170000 D62-10-READ-NEXT-UPDATE-CARD.                                    EXEC84.2
   001648         170100             MOVE SPACES TO WZ-WITHIN-DELETE-SERIES-FLAG.         EXEC84.2 IMP 397
   001649         170200             READ    CONTROL-CARD-FILE INTO WB-CONTROL-DATA       EXEC84.2 45 136
   001650      1  170300             AT END  MOVE "Y" TO WZ-END-OF-UPDATES                EXEC84.2 352
   001651      1  170400                     GO TO   D62-EXIT.                            EXEC84.2 1682
   001652         170500                                                                  EXEC84.2
   001653         170600     IF      WB-STAR-START = "*START"                             EXEC84.2 195
   001654      1  170700             PERFORM C60-START-CARD                               EXEC84.2 923
   001655      1  170800             GO TO   D62-EXIT.                                    EXEC84.2 1682
   001656         170900                                                                  EXEC84.2
   001657         171000     IF      WB-11 = "*END-UPDATE"                                EXEC84.2 163
   001658      1  171100             MOVE   "Y" TO WZ-END-OF-UPDATES                      EXEC84.2 352
   001659      1  171200             GO TO   D62-EXIT.                                    EXEC84.2 1682
   001660         171300                                                                  EXEC84.2
   001661         171400     IF WB-SEQ-2 NUMERIC                                          EXEC84.2 209
   001662      1  171500     GO TO   D62-1-CHECK-FOR-WITHIN-RANGE.                        EXEC84.2 1636
   001663         171600     PERFORM D67-LINE-UPDATE.                                     EXEC84.2 1686
   001664         171700     GO TO D62-EXIT.                                              EXEC84.2 1682
   001665         171800                                                                  EXEC84.2
   001666         171900 D62-20-NOW-WITHIN-RANGE.                                         EXEC84.2
   001667         172000     MOVE   "Y" TO WZ-LINE-UPDATE.                                EXEC84.2 349
   001668         172100     IF      WB-COL-7 = ","                                       EXEC84.2 205
   001669      1  172200             MOVE "Y" TO WZ-WITHIN-DELETE-SERIES-FLAG             EXEC84.2 397
   001670      1  172300             ADD     1  TO WZ-LINES-DELETED                       EXEC84.2 374
   001671      1  172400             MOVE   "Y" TO WZ-DELETE-FLAG                         EXEC84.2 354
   001672      1  172500             MOVE    SPACES     TO WE-X-CARD                      EXEC84.2 IMP 262
   001673      1  172600             MOVE   "DELETIONS" TO WE-CHANGE-TYPE                 EXEC84.2 264
   001674      1  172700             IF WB-SEQ-1 = WB-SEQ-2                               EXEC84.2 202 209
   001675      2  172800                  MOVE SPACE TO WZ-WITHIN-DELETE-SERIES-FLAG      EXEC84.2 IMP 397
   001676      1  172900             END-IF                                               EXEC84.2
   001677      1  173000             GO TO   D62-EXIT.                                    EXEC84.2 1682
   001678         173100                                                                  EXEC84.2
   001679         173200     MOVE   "Y"       TO WZ-REPLACE-FLAG.                         EXEC84.2 348
   001680         173300     MOVE    WB-COL-7 TO WC-COL-7.                                EXEC84.2 205 243
   001681         173400                                                                  EXEC84.2
   001682         173500 D62-EXIT.                                                        EXEC84.2
   001683         173600     EXIT.                                                        EXEC84.2
   001684         173700                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001685         173800/                                                                 EXEC84.2
   001686         173900 D67-LINE-UPDATE SECTION.                                         EXEC84.2
   001687         174000*=======================                                          EXEC84.2
   001688         174100*                                                                 EXEC84.2
   001689         174300*    THIS SECTION PERFORMS SINGLE LINE AMENDMENTS OR DELETIONS *  EXEC84.2
   001690         174400*                                                              *  EXEC84.2
   001691         174500*    PERFORMED BY    D60-PROCESS-UPDATE-CARD                   *  EXEC84.2
   001692         174600*                    D62-SERIES-UPDATE                         *  EXEC84.2
   001693         174700*    PERFORMS        C60-START-CARD                            *  EXEC84.2
   001694         174800*                    D68-LINE-EQUAL                            *  EXEC84.2
   001695         174900*                    D69-LINE-BLANK-OR-LESS                    *  EXEC84.2
   001696         175100 D67-1-CHECK-FOR-WITHIN-RANGE.                                    EXEC84.2
   001697         175200     IF      WC-6  < WB-SEQ-1                                     EXEC84.2 237 202
   001698      1  175300             GO TO   D67-EXIT.                                    EXEC84.2 1730
   001699         175400                                                                  EXEC84.2
   001700         175500 D67-10-LINES-EQUAL-OR-LESS.                                      EXEC84.2
   001701         175600     MOVE   "Y" TO WZ-LINE-UPDATE.                                EXEC84.2 349
   001702         175700     IF      WB-COL-7 = ","                                       EXEC84.2 205
   001703      1  175800             ADD     1  TO WZ-LINES-DELETED                       EXEC84.2 374
   001704      1  175900             MOVE   "Y" TO WZ-DELETE-FLAG                         EXEC84.2 354
   001705      1  176000             MOVE    SPACES     TO WE-X-CARD                      EXEC84.2 IMP 262
   001706      1  176100             MOVE   "DELETION"  TO WE-CHANGE-TYPE                 EXEC84.2 264
   001707      1  176200             GO TO   D67-20-READ-CONTROL.                         EXEC84.2 1721
   001708         176300                                                                  EXEC84.2
   001709         176400     IF      WC-6  = WB-SEQ-1                                     EXEC84.2 237 202
   001710      1  176500             PERFORM D68-LINE-EQUAL                               EXEC84.2 1733
   001711      1  176600             GO TO   D67-EXIT.                                    EXEC84.2 1730
   001712         176700                                                                  EXEC84.2
   001713         176800     IF      WB-SEQ-1 = SPACES                                    EXEC84.2 202 IMP
   001714      1  176900             PERFORM D69-LINE-BLANK-OR-LESS                       EXEC84.2 1760
   001715      1  177000             GO TO   D67-EXIT.                                    EXEC84.2 1730
   001716         177100                                                                  EXEC84.2
   001717         177200     IF      WC-6  > WB-SEQ-1                                     EXEC84.2 237 202
   001718      1  177300             PERFORM D69-LINE-BLANK-OR-LESS                       EXEC84.2 1760
   001719      1  177400             GO TO   D67-EXIT.                                    EXEC84.2 1730
   001720         177500                                                                  EXEC84.2
   001721         177600 D67-20-READ-CONTROL.                                             EXEC84.2
   001722         177700     READ    CONTROL-CARD-FILE INTO  WB-CONTROL-DATA              EXEC84.2 45 136
   001723      1  177800             AT END  MOVE "Y" TO WZ-END-OF-UPDATES.               EXEC84.2 352
   001724         177900     IF WB-STAR-START = "*START"                                  EXEC84.2 195
   001725      1  178000             PERFORM C60-START-CARD.                              EXEC84.2 923
   001726         178100                                                                  EXEC84.2
   001727         178200     IF WB-11 = "*END-UPDATE"                                     EXEC84.2 163
   001728      1  178300             MOVE "Y" TO WZ-END-OF-UPDATES.                       EXEC84.2 352
   001729         178400                                                                  EXEC84.2
   001730         178500 D67-EXIT.                                                        EXEC84.2
   001731         178600     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    45
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001732         178700/                                                                 EXEC84.2
   001733         178800 D68-LINE-EQUAL SECTION.                                          EXEC84.2
   001734         178900*======================                                           EXEC84.2
   001735         179000*                                                                 EXEC84.2
   001736         179200*    THIS SECTION IS PERFORMED WHEN THE SEQUENCE NUMBER OF A   *  EXEC84.2
   001737         179300*    SINGLE UPDATE AMEND CARD IS THE SAME AS THE SEQUENCE      *  EXEC84.2
   001738         179400*    NUMBER OF THE CURRENT POPULATION FILE LINE BEING PROCESSED*  EXEC84.2
   001739         179600*                                                                 EXEC84.2
   001740         179700 D68-1.                                                           EXEC84.2
   001741         179800     MOVE    WB-CONTROL-DATA TO WC-CURRENT-POP-RECORD.            EXEC84.2 136 211
   001742         179900     ADD     1    TO WZ-LINES-REPLACED.                           EXEC84.2 373
   001743         180000     MOVE   "Y"   TO WZ-REPLACE-FLAG.                             EXEC84.2 348
   001744         180100                                                                  EXEC84.2
   001745         180200     READ    CONTROL-CARD-FILE INTO  WB-CONTROL-DATA              EXEC84.2 45 136
   001746      1  180300             AT END  MOVE "Y" TO WZ-END-OF-UPDATES.               EXEC84.2 352
   001747         180400                                                                  EXEC84.2
   001748         180500     IF      WB-STAR-START = "*START"                             EXEC84.2 195
   001749      1  180600             PERFORM C60-START-CARD.                              EXEC84.2 923
   001750         180700                                                                  EXEC84.2
   001751         180800     IF      WB-11 = "*END-UPDATE"                                EXEC84.2 163
   001752      1  180900             MOVE   "Y" TO WZ-END-OF-UPDATES.                     EXEC84.2 352
   001753         181000                                                                  EXEC84.2
   001754         181100 D68-EXIT.                                                        EXEC84.2
   001755         181200     EXIT.                                                        EXEC84.2
   001756         181300                                                                  EXEC84.2
   001757         181400                                                                  EXEC84.2
   001758         181500                                                                  EXEC84.2
   001759         181600                                                                  EXEC84.2
   001760         181700 D69-LINE-BLANK-OR-LESS SECTION.                                  EXEC84.2
   001761         181800*==============================                                   EXEC84.2
   001762         181900 D69-1.                                                           EXEC84.2
   001763         182000     MOVE    WB-CONTROL-DATA TO WC-CURRENT-POP-RECORD.            EXEC84.2 136 211
   001764         182100     ADD     1    TO WZ-LINES-INSERTED.                           EXEC84.2 372
   001765         182200     MOVE   "Y"   TO WZ-DONT-READ-POPFILE.                        EXEC84.2 346
   001766         182300     MOVE   "INSERTIONS" TO WE-CHANGE-TYPE.                       EXEC84.2 264
   001767         182400     MOVE    SPACES      TO WE-X-CARD.                            EXEC84.2 IMP 262
   001768         182500     READ    CONTROL-CARD-FILE INTO  WB-CONTROL-DATA              EXEC84.2 45 136
   001769      1  182600             AT END  MOVE "Y" TO WZ-END-OF-UPDATES.               EXEC84.2 352
   001770         182700                                                                  EXEC84.2
   001771         182800     IF      WB-STAR-START = "*START"                             EXEC84.2 195
   001772      1  182900             PERFORM C60-START-CARD.                              EXEC84.2 923
   001773         183000                                                                  EXEC84.2
   001774         183100     IF      WB-11 = "*END-UPDATE"                                EXEC84.2 163
   001775      1  183200             MOVE   "Y" TO WZ-END-OF-UPDATES.                     EXEC84.2 352
   001776         183300                                                                  EXEC84.2
   001777         183400 D69-EXIT.                                                        EXEC84.2
   001778         183500     EXIT.                                                        EXEC84.2
   001779         183600                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    46
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001780         183700/                                                                 EXEC84.2
   001781         183800 D80-RAW-LINE SECTION.                                            EXEC84.2
   001782         183900*====================                                             EXEC84.2
   001783         184000*                                                                 EXEC84.2
   001784         184200*    IF COLUMN 7 OF THE POPULATION FILE PROGRAM CONTAINS A     *  EXEC84.2
   001785         184300*    SPECIAL CHARACTER OR COLS. 12-16 CONTAIN X-CARD INFO.,    *  EXEC84.2
   001786         184400*    THIS SECTION WILL MAKE THE NECESSARY CHANGES.             *  EXEC84.2
   001787         184500*                                                              *  EXEC84.2
   001788         184600*    PERFORMED BY    D50-PROCESS-COBOL-LINE                    *  EXEC84.2
   001789         184700*    PERFORMS        D82-OPTIONAL-LETTER                       *  EXEC84.2
   001790         184800*                    D86-X-CARD-CHECK                          *  EXEC84.2
   001791         184900*                    X40-WRITE-SOURCE-FILE                     *  EXEC84.2
   001792         185100 D80-1-ASTERISK-CHECK.                                            EXEC84.2
   001793         185200     IF      WC-COL-7 = "D" GO TO D80-30-PRINT-LINE.              EXEC84.2 243 1809
   001794         185300     IF      WC-COL-7  NOT = "*"                                  EXEC84.2 243
   001795      1  185400             GO TO   D80-20-ALPHABETIC-CHECK.                     EXEC84.2 1802
   001796         185500                                                                  EXEC84.2
   001797         185600     IF      WY-REMOVE-COMMENTS = "Y"                             EXEC84.2 336
   001798      1  185700             ADD     1  TO WZ-COMMENTS-DELETED                    EXEC84.2 375
   001799      1  185800             MOVE   "Y" TO WZ-NOT-THIS-COMMENT                    EXEC84.2 355
   001800      1  185900             GO TO   D80-EXIT.                                    EXEC84.2 1813
   001801         186000                                                                  EXEC84.2
   001802         186100 D80-20-ALPHABETIC-CHECK.                                         EXEC84.2
   001803         186200     IF      WC-COL-7 NOT ALPHABETIC                              EXEC84.2 243
   001804      1  186300             GO TO   D80-30-PRINT-LINE.                           EXEC84.2 1809
   001805         186400                                                                  EXEC84.2
   001806         186500     IF      WC-COL-7 NOT = SPACE                                 EXEC84.2 243 IMP
   001807      1  186600             PERFORM D82-OPTIONAL-LETTER.                         EXEC84.2 1817
   001808         186700                                                                  EXEC84.2
   001809         186800 D80-30-PRINT-LINE.                                               EXEC84.2
   001810         186900     IF      WZ-DELETE-FLAG = SPACE                               EXEC84.2 354 IMP
   001811      1  187000             PERFORM D85-X-CARD-CHECK.                            EXEC84.2 1855
   001812         187100                                                                  EXEC84.2
   001813         187200 D80-EXIT.                                                        EXEC84.2
   001814         187300     EXIT.                                                        EXEC84.2
   001815         187400                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    47
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001816         187500/                                                                 EXEC84.2
   001817         187600 D82-OPTIONAL-LETTER SECTION.                                     EXEC84.2
   001818         187700*===========================                                      EXEC84.2
   001819         187800*                                                                 EXEC84.2
   001820         187900 D82-1-SELECT-OPTIONAL.                                           EXEC84.2
   001821         188000     PERFORM D83-CHECK-OPTION-SWITCHES                            EXEC84.2 1844
   001822         188100             VARYING SUB4 FROM 1 BY 1                             EXEC84.2 69
   001823         188200               UNTIL SUB4 > 26.                                   EXEC84.2 69
   001824         188300                                                                  EXEC84.2
   001825         188400     IF      WZ-OPTIONAL-SELECTED = "Y"                           EXEC84.2 353
   001826      1  188500             MOVE    SPACE TO WC-COL-7                            EXEC84.2 IMP 243
   001827      1  188600             GO TO   D82-EXIT.                                    EXEC84.2 1837
   001828         188700                                                                  EXEC84.2
   001829         188800 D82-10-SAVE-OPTIONAL.                                            EXEC84.2
   001830         188900     ADD     1    TO WZ-CODE-REMOVED.                             EXEC84.2 376
   001831         189000     IF      WY-KILL-DELETIONS = "Y"                              EXEC84.2 328
   001832      1  189100             MOVE   "Y" TO WZ-DELETE-FLAG                         EXEC84.2 354
   001833         189200     ELSE                                                         EXEC84.2
   001834      1  189300             MOVE    WC-COL-7 TO WC-COL-8                         EXEC84.2 243 244
   001835      1  189400             MOVE   "*"       TO WC-COL-7.                        EXEC84.2 243
   001836         189500                                                                  EXEC84.2
   001837         189600 D82-EXIT.                                                        EXEC84.2
   001838         189700     EXIT.                                                        EXEC84.2
   001839         189800                                                                  EXEC84.2
   001840         189900                                                                  EXEC84.2
   001841         190000                                                                  EXEC84.2
   001842         190100                                                                  EXEC84.2
   001843         190200                                                                  EXEC84.2
   001844         190300 D83-CHECK-OPTION-SWITCHES SECTION.                               EXEC84.2
   001845         190400*=================================                                EXEC84.2
   001846         190500*                                                                 EXEC84.2
   001847         190600 D83-1-CHECK-SWITCH.                                              EXEC84.2
   001848         190700     IF      WY-OPT-SW (SUB4) = WC-COL-7                          EXEC84.2 322 69 243
   001849      1  190800             MOVE    99 TO SUB4                                   EXEC84.2 69
   001850      1  190900             MOVE   "Y" TO WZ-OPTIONAL-SELECTED.                  EXEC84.2 353
   001851         191000                                                                  EXEC84.2
   001852         191100 D83-EXIT.                                                        EXEC84.2
   001853         191200     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    48
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001854         191300/                                                                 EXEC84.2
   001855         191400 D85-X-CARD-CHECK SECTION.                                        EXEC84.2
   001856         191500*========================                                         EXEC84.2
   001857         191600*                                                                 EXEC84.2
   001858         191800*    WHEN "XXXX" IS ENCOUNTERED IN COLUMNS 12 - 15 THIS        *  EXEC84.2
   001859         191900*    SECTION EITHER SUBSTITUTES THE IMPLEMENTOR ASSIGNED TEXT  *  EXEC84.2
   001860         192000*    OR MOVES THE PROGRAM NAME TO AN IMPLEMENTOR SPECIFIED     *  EXEC84.2
   001861         192100*    POSITION IN THE PROGRAM CODE.                             *  EXEC84.2
   001862         192200*                                                              *  EXEC84.2
   001863         192300*    PERFORMED BY    D80-RAW-LINE                              *  EXEC84.2
   001864         192400*    PERFORMS        D87-PROGRAM-NAME                          *  EXEC84.2
   001865         192500*                    D86-REMOVE-FULL-STOP                      *  EXEC84.2
   001866         192600*                    D86-INSERT-FULL-STOP                      *  EXEC84.2
   001867         192800 D85-1-CHECK-FOR-XXXXX.                                           EXEC84.2
   001868         192900     IF      WC-12-15 NOT = "XXXX"                                EXEC84.2 247
   001869      1  193000             GO TO   D85-EXIT.                                    EXEC84.2 1894
   001870         193100     IF      WC-17-19 NOT NUMERIC                                 EXEC84.2 249
   001871         193200* XXXXX ENTRY IN POPULATION FILE IN ERROR.                        EXEC84.2
   001872      1  193300             GO TO D85-EXIT.                                      EXEC84.2 1894
   001873         193400                                                                  EXEC84.2
   001874         193500 D85-10-SUBSTITUTION-REQUIRED.                                    EXEC84.2
   001875         193600     MOVE    WC-17-19 TO SUB1.                                    EXEC84.2 249 66
   001876         193700     MOVE    WX-X-CARD (SUB1) TO WZ-X-CARD.                       EXEC84.2 287 66 394
   001877         193800     IF      WX-PROG-POS (SUB1) NOT = ZERO                        EXEC84.2 291 66 IMP
   001878      1  193900             PERFORM D88-PROGRAM-NAME                             EXEC84.2 1935
   001879      1  194000             GO TO   D85-EXIT.                                    EXEC84.2 1894
   001880         194100                                                                  EXEC84.2
   001881         194200 D85-20-TEXT-SUBSTITUTION.                                        EXEC84.2
   001882         194300     IF      WC-20 = SPACE                                        EXEC84.2 250 IMP
   001883      1  194400             PERFORM D86-REMOVE-FULL-STOP                         EXEC84.2 1898
   001884      1  194500             VARYING SUB4 FROM 60 BY -1                           EXEC84.2 69
   001885      1  194600               UNTIL SUB4 < 1                                     EXEC84.2 69
   001886      1  194700             MOVE    WZ-X-CARD TO WC-SUB-DATA                     EXEC84.2 394 246
   001887      1  194800             GO TO   D85-EXIT.                                    EXEC84.2 1894
   001888         194900                                                                  EXEC84.2
   001889         195000     IF      WC-20 = "."                                          EXEC84.2 250
   001890      1  195100             PERFORM D87-INSERT-FULL-STOP                         EXEC84.2 1918
   001891      1  195200             VARYING SUB4 FROM 60 BY -1                           EXEC84.2 69
   001892      1  195300               UNTIL SUB4 < 1                                     EXEC84.2 69
   001893      1  195400             MOVE    WZ-X-CARD  TO WC-SUB-DATA.                   EXEC84.2 394 246
   001894         195500 D85-EXIT.                                                        EXEC84.2
   001895         195600     EXIT.                                                        EXEC84.2
   001896         195700                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    49
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001897         195800/                                                                 EXEC84.2
   001898         195900 D86-REMOVE-FULL-STOP SECTION.                                    EXEC84.2
   001899         196000*============================                                     EXEC84.2
   001900         196100*                                                                 EXEC84.2
   001901         196200 D86-1.                                                           EXEC84.2
   001902         196300     IF      WZ-X-CHAR (SUB4) = SPACE                             EXEC84.2 395 69 IMP
   001903      1  196400             GO TO   D86-EXIT.                                    EXEC84.2 1911
   001904         196500                                                                  EXEC84.2
   001905         196600     IF      WZ-X-CHAR (SUB4) = "."                               EXEC84.2 395 69
   001906      1  196700             MOVE    SPACE TO WZ-X-CHAR (SUB4)                    EXEC84.2 IMP 395 69
   001907      1  196800             MOVE    ZERO  TO SUB4                                EXEC84.2 IMP 69
   001908         196900     ELSE                                                         EXEC84.2
   001909      1  197000             MOVE    ZERO  TO SUB4.                               EXEC84.2 IMP 69
   001910         197100                                                                  EXEC84.2
   001911         197200 D86-EXIT.                                                        EXEC84.2
   001912         197300     EXIT.                                                        EXEC84.2
   001913         197400                                                                  EXEC84.2
   001914         197500                                                                  EXEC84.2
   001915         197600                                                                  EXEC84.2
   001916         197700                                                                  EXEC84.2
   001917         197800                                                                  EXEC84.2
   001918         197900 D87-INSERT-FULL-STOP SECTION.                                    EXEC84.2
   001919         198000*============================                                     EXEC84.2
   001920         198100*                                                                 EXEC84.2
   001921         198200 D87-1.                                                           EXEC84.2
   001922         198300     IF      WZ-X-CHAR (SUB4) = SPACE                             EXEC84.2 395 69 IMP
   001923      1  198400             GO TO   D87-EXIT.                                    EXEC84.2 1932
   001924         198500                                                                  EXEC84.2
   001925         198600     IF      WZ-X-CHAR (SUB4) = "."                               EXEC84.2 395 69
   001926      1  198700             MOVE    ZERO  TO SUB4                                EXEC84.2 IMP 69
   001927         198800     ELSE                                                         EXEC84.2
   001928      1  198900             ADD     1     TO SUB4                                EXEC84.2 69
   001929      1  199000             MOVE   "."    TO WZ-X-CHAR (SUB4)                    EXEC84.2 395 69
   001930      1  199100             MOVE    ZERO  TO SUB4.                               EXEC84.2 IMP 69
   001931         199200                                                                  EXEC84.2
   001932         199300 D87-EXIT.                                                        EXEC84.2
   001933         199400     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    50
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   001934         199500/                                                                 EXEC84.2
   001935         199600 D88-PROGRAM-NAME SECTION.                                        EXEC84.2
   001936         199700*========================                                         EXEC84.2
   001937         199800*                                                                 EXEC84.2
   001938         199900 D88-1.                                                           EXEC84.2
   001939         200000     MOVE    WX-PROG-POS (SUB1) TO SUB2.                          EXEC84.2 291 66 67
   001940         200100     MOVE    SPACE TO WZ-MAIN-PROG-FLAG.                          EXEC84.2 IMP 370
   001941         200200     MOVE    SPACE TO WZ-FULL-STOP.                               EXEC84.2 IMP 345
   001942         200300     IF      WC-20 = "."                                          EXEC84.2 250
   001943      1  200400             MOVE    "Y" TO WZ-FULL-STOP.                         EXEC84.2 345
   001944         200500                                                                  EXEC84.2
   001945         200600     IF      WX-X-CHAR (SUB1 SUB2) = "J"                          EXEC84.2 288 66 67
   001946      1  200700             MOVE WZ-CURRENT-MAIN-PROG TO WZ-PROG-BREAK           EXEC84.2 363 365
   001947      1  200800             MOVE   "Y"    TO WZ-MAIN-PROG-FLAG                   EXEC84.2 370
   001948         200900     ELSE                                                         EXEC84.2
   001949      1  201000             MOVE WZ-CURRENT-POP-PROG TO WZ-PROG-BREAK.           EXEC84.2 367 365
   001950         201100                                                                  EXEC84.2
   001951         201200     IF      WZ-CURRENT-MAIN-PROG = SPACE                         EXEC84.2 363 IMP
   001952      1  201300             MOVE    SPACE TO WZ-MAIN-PROG-FLAG.                  EXEC84.2 IMP 370
   001953         201400                                                                  EXEC84.2
   001954         201500     MOVE    1 TO SUB4.                                           EXEC84.2 69
   001955         201600     PERFORM D89-MOVE-PROGRAM-NAME 6 TIMES.                       EXEC84.2 1974
   001956         201700                                                                  EXEC84.2
   001957         201800     IF      WZ-FULL-STOP = "Y"                                   EXEC84.2 345
   001958      1  201900             PERFORM D87-INSERT-FULL-STOP                         EXEC84.2 1918
   001959      1  202000             VARYING SUB4 FROM 60 BY -1                           EXEC84.2 69
   001960      1  202100               UNTIL SUB4 < 1                                     EXEC84.2 69
   001961         202200     ELSE                                                         EXEC84.2
   001962      1  202300             PERFORM D86-REMOVE-FULL-STOP                         EXEC84.2 1898
   001963      1  202400             VARYING SUB4 FROM 60 BY -1                           EXEC84.2 69
   001964      1  202500               UNTIL SUB4 < 1.                                    EXEC84.2 69
   001965         202600                                                                  EXEC84.2
   001966         202700     MOVE    WZ-X-CARD  TO WC-SUB-DATA.                           EXEC84.2 394 246
   001967         202800                                                                  EXEC84.2
   001968         202900 D88-EXIT.                                                        EXEC84.2
   001969         203000     EXIT.                                                        EXEC84.2
   001970         203100                                                                  EXEC84.2
   001971         203200                                                                  EXEC84.2
   001972         203300                                                                  EXEC84.2
   001973         203400                                                                  EXEC84.2
   001974         203500 D89-MOVE-PROGRAM-NAME SECTION.                                   EXEC84.2
   001975         203600*=============================                                    EXEC84.2
   001976         203700*                                                                 EXEC84.2
   001977         203800 D89-1.                                                           EXEC84.2
   001978         203900*    IF      WZ-MAIN-PROG-FLAG = "Y"                              EXEC84.2
   001979         204000*            MOVE    WZ-MAIN-PROG-CHAR (SUB4)                     EXEC84.2
   001980         204100*                 TO WZ-X-CHAR (SUB2)                             EXEC84.2
   001981         204200*    ELSE                                                         EXEC84.2
   001982         204300*            MOVE    WZ-UPD-PROG-CHAR  (SUB4)                     EXEC84.2
   001983         204400*                 TO WZ-X-CHAR (SUB2).                            EXEC84.2
   001984         204500                                                                  EXEC84.2
   001985         204600     MOVE    WZ-1CHAR(SUB4) TO WZ-X-CHAR(SUB2).                   EXEC84.2 366 69 395 67
   001986         204700                                                                  EXEC84.2
   001987         204800     IF      SUB4 = 6 AND WZ-X-CHAR(SUB2) = SPACE                 EXEC84.2 69 395 67 IMP
   001988      1  204900             ADD 1 SUB2 GIVING SUB4                               EXEC84.2 67 69
   001989      1  205000             PERFORM D89-2-CLOSE-SPACE UNTIL WZ-X-CHAR(SUB4) =    EXEC84.2 1999 395 69
   001990      1  205100                  SPACE                                           EXEC84.2 IMP
   001991      1  205200             MOVE SPACE TO WZ-X-CHAR(SUB2).                       EXEC84.2 IMP 395 67
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    51
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001992         205300                                                                  EXEC84.2
   001993         205400     ADD     1 TO SUB2.                                           EXEC84.2 67
   001994         205500     ADD     1 TO SUB4.                                           EXEC84.2 69
   001995         205600                                                                  EXEC84.2
   001996         205700 D89-EXIT.                                                        EXEC84.2
   001997         205800     EXIT.                                                        EXEC84.2
   001998         205900                                                                  EXEC84.2
   001999         206000 D89-2-CLOSE-SPACE SECTION.                                       EXEC84.2
   002000         206100 D89-2-1.                                                         EXEC84.2
   002001         206200                                                                  EXEC84.2
   002002         206300     MOVE WZ-X-CHAR(SUB4) TO WZ-X-CHAR(SUB2).                     EXEC84.2 395 69 395 67
   002003         206400     ADD 1 TO SUB2 SUB4.                                          EXEC84.2 67 69
   002004         206500                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    52
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   002005         206600/                                                                 EXEC84.2
   002006         206700 D90-PROCESS-END-OF SECTION.                                      EXEC84.2
   002007         206800*==========================                                       EXEC84.2
   002008         206900*                                                                 EXEC84.2
   002009         207100*    WHEN A "*END-OF"CARD IS ENCOUNTERED THIS SECTION PERFORMS *  EXEC84.2
   002010         207200*    THE END-OF-PROGRAMS ACTIONS.                              *  EXEC84.2
   002011         207300*                                                              *  EXEC84.2
   002012         207400*    PERFORMED BY    D20-PROCESS-POPFILE                       *  EXEC84.2
   002013         207500*    PERFORMS        X10-WRITE-UPDATED-POP                     *  EXEC84.2
   002014         207700 D90-1-CHECK-HEADER-TYPE.                                         EXEC84.2
   002015         207800     IF      WY-KILL-DELETIONS = "Y"                              EXEC84.2 328
   002016      1  207900             MOVE   "DELETED"    TO WA-OPTIONAL-CODE              EXEC84.2 116
   002017         208000     ELSE                                                         EXEC84.2
   002018      1  208100             MOVE   "UNUSED "    TO WA-OPTIONAL-CODE.             EXEC84.2 116
   002019         208200                                                                  EXEC84.2
   002020         208300     MOVE    WZ-CURRENT-POP-PROG TO WA-CURRENT-PROG               EXEC84.2 367 99
   002021         208400     MOVE    WZ-LINES-COBOL      TO WA-LINES-COBOL                EXEC84.2 371 102
   002022         208500     MOVE    WZ-LINES-INSERTED   TO WA-LINES-INSERTED             EXEC84.2 372 106
   002023         208600     MOVE    WZ-LINES-REPLACED   TO WA-LINES-REPLACED             EXEC84.2 373 109
   002024         208700     MOVE    WZ-LINES-DELETED    TO WA-LINES-DELETED              EXEC84.2 374 112
   002025         208800     MOVE    WZ-CODE-REMOVED     TO WA-CODE-REMOVED               EXEC84.2 376 117
   002026         208900     MOVE    WZ-COMMENTS-DELETED TO WA-COMMENTS-DEL               EXEC84.2 375 120
   002027         209000     MOVE    WA-ACCT-LINE-1      TO PRINT-DATA                    EXEC84.2 96 50
   002028         209100     PERFORM X20-PRINT-DETAIL                                     EXEC84.2 2100
   002029         209200     MOVE    WA-ACCT-LINE-2      TO PRINT-DATA                    EXEC84.2 103 50
   002030         209300     PERFORM X20-PRINT-DETAIL                                     EXEC84.2 2100
   002031         209400     MOVE    WA-ACCT-LINE-3      TO PRINT-DATA                    EXEC84.2 113 50
   002032         209500     PERFORM X20-PRINT-DETAIL                                     EXEC84.2 2100
   002033         209600                                                                  EXEC84.2
   002034         209700     MOVE    SPACES  TO WZ-CURRENT-POP-PROG.                      EXEC84.2 IMP 367
   002035         209800*    CLOSE SOURCE-COBOL-PROGRAMS.                                 EXEC84.2
   002036         209900                                                                  EXEC84.2
   002037         210000 D90-EXIT.                                                        EXEC84.2
   002038         210100     EXIT.                                                        EXEC84.2
   002039         210200                                                                  EXEC84.2
   002040         210300                                                                  EXEC84.2
   002041         210400 D100-PROCESS-DATA.                                               EXEC84.2
   002042         210500     EXIT.                                                        EXEC84.2
   002043         210600                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    53
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   002044         210700/                                                                 EXEC84.2
   002045         210800 E10-TERMINATE SECTION.                                           EXEC84.2
   002046         210900*=====================                                            EXEC84.2
   002047         211000*                                                                 EXEC84.2
   002048         211200*    THIS SECTION CLOSES ANY OPEN FILES                        *  EXEC84.2
   002049         211300*                                                              *  EXEC84.2
   002050         211400*                                                              *  EXEC84.2
   002051         211600 E10-1.                                                           EXEC84.2
   002052         211700     CLOSE   PRINT-FILE.                                          EXEC84.2 47
   002053         211800                                                                  EXEC84.2
   002054         211900     CLOSE   CONTROL-CARD-FILE.                                   EXEC84.2 45
   002055         212000                                                                  EXEC84.2
   002056         212100     IF      WY-NEW-POP  = "Y"                                    EXEC84.2 337
   002057      1  212200             CLOSE   UPDATED-POPULATION-FILE.                     EXEC84.2 56
   002058         212300                                                                  EXEC84.2
   002059         212500     IF      WY-NO-SOURCE = SPACE                                 EXEC84.2 335 IMP
   002060      1  212600             CLOSE   SOURCE-COBOL-PROGRAMS.                       EXEC84.2 51
   002061         212700                                                                  EXEC84.2
   002062         212800     CLOSE   POPULATION-FILE.                                     EXEC84.2 40
   002063         212900     STOP    RUN.                                                 EXEC84.2
   002064         213000 E20-EXIT.                                                        EXEC84.2
   002065         213100     EXIT.                                                        EXEC84.2
   002066         213200                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    54
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   002067         213300/                                                                 EXEC84.2
   002068         213400 X10-WRITE-UPDATED-POPFILE SECTION.                               EXEC84.2
   002069         213500*=================================                                EXEC84.2
   002070         213600*                                                                 EXEC84.2
   002071         213700 X10-1-CHECK-FOR-NC114.                                           EXEC84.2
   002072         213800*    N.B.                                                         EXEC84.2
   002073         213900*    NC114A HAS MISCELLANEOUS CHARACTERS IN COLUMNS 1-6 AND SO    EXEC84.2
   002074         214000*    SHOULD NOT BE RESEQUENCED BY THIS EXECUTIVE.                 EXEC84.2
   002075         214100                                                                  EXEC84.2
   002076         214200     IF      WZ-CURRENT-POP-PROG = "NC114M"                       EXEC84.2 367
   002077      1  214300             GO TO   X10-30-WRITE-FILE.                           EXEC84.2 2086
   002078         214400                                                                  EXEC84.2
   002079         214500 X10-20-RENUMBER-CHECK.                                           EXEC84.2
   002080         214600     IF      WC-STAR = "*"                                        EXEC84.2 238
   002081      1  214700             GO TO   X10-30-WRITE-FILE.                           EXEC84.2 2086
   002082         214800     IF      WZ-RESEQUENCE-THIS = "Y"                             EXEC84.2 350
   002083      1  214900             ADD     100 TO WZ-SEQ-NO                             EXEC84.2 381
   002084      1  215000             MOVE    WZ-SEQ-NO TO WC-6.                           EXEC84.2 381 237
   002085         215100                                                                  EXEC84.2
   002086         215200 X10-30-WRITE-FILE.                                               EXEC84.2
   002087         215300     MOVE    WC-CURRENT-POP-RECORD TO UD-SOURCE-OUT (SUB5).       EXEC84.2 211 59 70
   002088         215400     ADD     1       TO SUB5.                                     EXEC84.2 70
   002089         215500     IF      SUB5    GREATER 30                                   EXEC84.2 70
   002090      1  215600             WRITE   UPDATED-SOURCE-OUT-2400                      EXEC84.2 58
   002091      1  215700             MOVE    1 TO SUB5                                    EXEC84.2 70
   002092      1  215800             MOVE   SPACE TO UPDATED-SOURCE-OUT-2400.             EXEC84.2 IMP 58
   002093         215900                                                                  EXEC84.2
   002094         216000                                                                  EXEC84.2
   002095         216100 X10-EXIT.                                                        EXEC84.2
   002096         216200     EXIT.                                                        EXEC84.2
   002097         216300                                                                  EXEC84.2
   002098         216400                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    55
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   002099         216500/                                                                 EXEC84.2
   002100         216600 X20-PRINT-DETAIL SECTION.                                        EXEC84.2
   002101         216700*========================                                         EXEC84.2
   002102         216800*                                                                 EXEC84.2
   002103         216900 X20-1.                                                           EXEC84.2
   002104         217000                                                                  EXEC84.2
   002105         217100     IF      WZ-LINE-CT > 50                                      EXEC84.2 390
   002106      1  217200             MOVE    PRINT-REC    TO WZ-PRINT-HOLD                EXEC84.2 48 393
   002107      1  217300             ADD     1            TO WZ-PAGE-CT                   EXEC84.2 389
   002108      1  217400             MOVE    WZ-PAGE-CT   TO WA-PAGE-CT                   EXEC84.2 389 94
   002109      1  217500             MOVE    WA-TOP-OF-PAGE-LINE                          EXEC84.2 78
   002110      1  217600                                  TO PRINT-REC                    EXEC84.2 48
   002111      1  217700             WRITE   PRINT-REC AFTER PAGE                         EXEC84.2 48
   002112      1  217800             MOVE    SPACE        TO PRINT-REC                    EXEC84.2 IMP 48
   002113      1  217900             WRITE   PRINT-REC                                    EXEC84.2 48
   002114      1  218000             MOVE    WZ-PRINT-HOLD TO PRINT-REC                   EXEC84.2 393 48
   002115      1  218100             MOVE    ZERO TO WZ-LINE-CT.                          EXEC84.2 IMP 390
   002116         218200     ADD     1 TO WZ-LINE-CT.                                     EXEC84.2 390
   002117         218300                                                                  EXEC84.2
   002118         218400 X20-2.                                                           EXEC84.2
   002119         218500     WRITE   PRINT-REC AFTER 1.                                   EXEC84.2 48
   002120         218600     MOVE    SPACE TO PRINT-REC.                                  EXEC84.2 IMP 48
   002121         218700                                                                  EXEC84.2
   002122         218800 X20-EXIT.                                                        EXEC84.2
   002123         218900     EXIT.                                                        EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    56
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
   002124         219000/                                                                 EXEC84.2
   002125         219100 X30-READ-POPFILE SECTION.                                        EXEC84.2
   002126         219200*========================                                         EXEC84.2
   002127         219300 X30-1.                                                           EXEC84.2
   002128         219400     IF      WZ-DONT-READ-POPFILE = "Y"                           EXEC84.2 346
   002129      1  219500             MOVE    SPACE TO WZ-DONT-READ-POPFILE                EXEC84.2 IMP 346
   002130      1  219600             GO TO   X30-EXIT.                                    EXEC84.2 2170
   002131         219700                                                                  EXEC84.2
   002132         219800*    IF      SUB1 GREATER THAN 30                                 EXEC84.2
   002133         219900     READ    POPULATION-FILE INTO WC-CURRENT-POP-RECORD           EXEC84.2 40 211
   002134      1  220000             AT END  MOVE  "Y"       TO WZ-END-OF-POPFILE         EXEC84.2 344
   002135      1  220100                     MOVE  "*HEADER" TO WC-STAR-HEADER            EXEC84.2 216
   002136      1  220200                     GO TO  X30-EXIT.                             EXEC84.2 2170
   002137         220300     MOVE    WC-CURRENT-POP-RECORD   TO WZ-SAVE-POP-RECORD.       EXEC84.2 211 382
   002138         220400                                                                  EXEC84.2
   002139         220500     IF      WC-STAR = "*"                                        EXEC84.2 238
   002140      1  220600             IF      WZ-CURRENT-HEADER = "COBOL"                  EXEC84.2 356
   002141      2  220700     IF WC-1-5 = "ABCDE"                                          EXEC84.2 241
   002142      3  220800          ADD 1 TO WZ-LINES-COBOL                                 EXEC84.2 371
   002143      2  220900     ELSE                                                         EXEC84.2
   002144      3  221000                     IF      WC-1-5 = "*/+(>"                     EXEC84.2 241
   002145      4  221100                             ADD     1 TO WZ-LINES-COBOL          EXEC84.2 371
   002146      3  221200                     ELSE                                         EXEC84.2
   002147      4  221300                     IF      WC-1-5 = "999-9"                     EXEC84.2 241
   002148      5  221400                             ADD     1 TO WZ-LINES-COBOL          EXEC84.2 371
   002149      4  221500                     ELSE                                         EXEC84.2
   002150      5  221600                     IF      WC-1-5 = "Z=.,;"                     EXEC84.2 241
   002151      6  221700                             ADD     1 TO WZ-LINES-COBOL          EXEC84.2 371
   002152      5  221800                     ELSE                                         EXEC84.2
   002153      6  221900                     IF      WC-1-5 = ")14$ "                     EXEC84.2 241
   002154      7  222000                             ADD     1 TO WZ-LINES-COBOL          EXEC84.2 371
   002155      6  222100                     ELSE                                         EXEC84.2
   002156      7  222200                     IF      WC-1-5 = "  23 "                     EXEC84.2 241
   002157      8  222300                             ADD     1 TO WZ-LINES-COBOL          EXEC84.2 371
   002158      7  222400                     ELSE                                         EXEC84.2
   002159      8  222500                             NEXT    SENTENCE                     EXEC84.2
   002160      1  222600             ELSE                                                 EXEC84.2
   002161      2  222700                     NEXT    SENTENCE                             EXEC84.2
   002162         222800     ELSE                                                         EXEC84.2
   002163      1  222900             IF      WZ-CURRENT-HEADER = "COBOL"                  EXEC84.2 356
   002164      2  223000                     ADD     1    TO WZ-LINES-COBOL.              EXEC84.2 371
   002165         223100                                                                  EXEC84.2
   002166         223200*    MOVE SOURCE-IN (SUB1) TO WC-CURRENT-POP-RECORD.              EXEC84.2
   002167         223300*    ADD     1 TO SUB1.                                           EXEC84.2
   002168         223400                                                                  EXEC84.2
   002169         223500                                                                  EXEC84.2
   002170         223600 X30-EXIT.                                                        EXEC84.2
   002171         223700     EXIT.                                                        EXEC84.2
   002172         223800                                                                  EXEC84.2
   002173         223900                                                                  EXEC84.2
   002174         224000                                                                  EXEC84.2
   002175         224100                                                                  EXEC84.2
   002176         224200                                                                  EXEC84.2
   002177         224300 X40-WRITE-SOURCE-FILE SECTION.                                   EXEC84.2
   002178         224400*= ===========================                                    EXEC84.2
   002179         224500 X40-1.                                                           EXEC84.2
   002180         224600     MOVE    SPACES  TO WD-1.                                     EXEC84.2 IMP 255
   002181         224700*    IF    BLOCK-TYPE NOT = "DATA*"                               EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    57
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002182         224800*          MOVE SPACES TO WC-73-80.                               EXEC84.2
   002183         224900     IF      WC-STAR = "*"                                        EXEC84.2 238
   002184      1  225000             IF      WC-1-5 = "*/+(>"                             EXEC84.2 241
   002185      2  225100                     WRITE   CT-OUT FROM WC-CURRENT-POP-RECORD    EXEC84.2 53 211
   002186      1  225200             ELSE                                                 EXEC84.2
   002187      2  225300                     MOVE    WC-CURRENT-POP-RECORD TO WD-HEADER   EXEC84.2 211 257
   002188      2  225400                     WRITE   CT-OUT FROM WD-SOURCE-REC            EXEC84.2 53 254
   002189         225500     ELSE                                                         EXEC84.2
   002190      1  225600             WRITE   CT-OUT  FROM WC-CURRENT-POP-RECORD.          EXEC84.2 53 211
   002191         225700                                                                  EXEC84.2
   002192         225800 X40-EXIT.                                                        EXEC84.2
   002193         225900     EXIT.                                                        EXEC84.2
   002194         226000                                                                  EXEC84.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    58
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       65   BLOCK-TYPE . . . . . . . . . .  M1241 1589
       45   CONTROL-CARD-FILE. . . . . . .  35 501 502 516 526 646 787 1049 1077 1545 1558 1649 1722 1745 1768 2054
       46   CONTROL-RECORD
       53   CT-OUT . . . . . . . . . . . .  M2185 M2188 M2190
       40   POPULATION-FILE. . . . . . . .  22 966 2062 2133
       50   PRINT-DATA . . . . . . . . . .  M504 M518 M523 M528 M554 M562 M570 M583 M616 M624 M636 M648 M667 M676 M685 M694
                                            M703 M717 M722 M731 M743 M763 M770 M783 M790 M824 M826 M831 M834 M839 M842 M846
                                            M848 M852 M854 M859 M862 M869 M872 M878 M881 M886 M889 M892 M895 M898 M903 M906
                                            M912 M916 M968 M1035 M1040 M1045 M1057 M1061 M1075 M1160 M1177 M1201 M1206 M1213
                                            M1220 M1244 M1458 M2027 M2029 M2031
       47   PRINT-FILE . . . . . . . . . .  32 499 2052
       48   PRINT-REC. . . . . . . . . . .  M500 M807 M808 M809 M820 827 835 843 849 855 863 873 882 899 907 917 2106 M2110
                                            2111 M2112 2113 M2114 2119 M2120
       51   SOURCE-COBOL-PROGRAMS. . . . .  25 964 2060
       43   SOURCE-IN
       42   SOURCE-IN-2400
       66   SUB1 . . . . . . . . . . . . .  M451 M480 481 482 M811 M816 817 817 M1875 1876 1877 1939 1945
       67   SUB2 . . . . . . . . . . . . .  M1939 1945 1985 1987 1988 1991 M1993 2002 M2003
       68   SUB3
       69   SUB4 . . . . . . . . . . . . .  M1822 1823 1848 M1849 M1884 1885 M1891 1892 1902 1905 1906 M1907 M1909 1922 1925
                                            M1926 M1928 1929 M1930 M1954 M1959 1960 M1963 1964 1985 1987 M1988 1989 M1994
                                            2002 M2003
       70   SUB5 . . . . . . . . . . . . .  M454 2087 M2088 2089 M2091
       71   SUB6 . . . . . . . . . . . . .  M452 M621 622 630 631 M1353 1406 1408 1411 1412 1413 M1414 1422 1427
       72   SUB7 . . . . . . . . . . . . .  M453 M633 634 642 M1059 1059 1060 1061 M1357 1363 1364 1369 M1370 M1374 1377
                                            1379 M1386
       59   UD-SOURCE-OUT. . . . . . . . .  M2087
       56   UPDATED-POPULATION-FILE. . . .  29 961 2057
       58   UPDATED-SOURCE-OUT-2400. . . .  2090 M2092
       96   WA-ACCT-LINE-1 . . . . . . . .  2027
      103   WA-ACCT-LINE-2 . . . . . . . .  2029
      113   WA-ACCT-LINE-3 . . . . . . . .  2031
      118   WA-CODE-KILLED
      117   WA-CODE-REMOVED. . . . . . . .  M2025
      120   WA-COMMENTS-DEL. . . . . . . .  M2026
       89   WA-COMPANY-AND-COMPILER
       99   WA-CURRENT-PROG. . . . . . . .  M2020
       91   WA-DATE. . . . . . . . . . . .  M470
       73   WA-ERR-IND
      121   WA-FINAL-LINE-1. . . . . . . .  1035
      127   WA-FINAL-LINE-2. . . . . . . .  1040
      131   WA-FINAL-LINE-3. . . . . . . .  1045
       74   WA-FIRST-IND
      102   WA-LINES-COBOL . . . . . . . .  M2021
      112   WA-LINES-DELETED . . . . . . .  M2024
      106   WA-LINES-INSERTED. . . . . . .  M2022
      109   WA-LINES-REPLACED. . . . . . .  M2023
      135   WA-NEWPOP-PROGS. . . . . . . .  M1044
      116   WA-OPTIONAL-CODE . . . . . . .  M2016 M2018
       94   WA-PAGE-CT . . . . . . . . . .  M2108
      126   WA-PROGS-FOUND . . . . . . . .  M1034
       84   WA-RELEASE
       85   WA-RELEASE-TEXT
      130   WA-SOURCE-PROGS. . . . . . . .  M1039
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    59
0 Defined   Cross-reference of data names   References

0      78   WA-TOP-OF-PAGE-LINE. . . . . .  2109
       80   WA-VERSION
       87   WA-VERSION-DATE. . . . . . . .  M987
       83   WA-VERSION-NUM . . . . . . . .  M986
       81   WA-VERSION-TEXT
       76   WA-ZCARD
       75   WA-ZCARD-TABLE
      208   WB-CHAR
      203   WB-COBOL-LINE. . . . . . . . .  204 207
      205   WB-COL-7 . . . . . . . . . . .  1668 1680 1702
      136   WB-CONTROL-DATA. . . . . . . .  M502 M516 M526 583 M645 M646 762 769 783 M787 M1049 1075 M1077 M1545 M1558 M1649
                                            M1722 1741 M1745 1763 M1768
      137   WB-FILL. . . . . . . . . . . .  138 141 147 150 153 156 159 162 165 170 173 180 183 186 194 201
      178   WB-LEVEL . . . . . . . . . . .  631
      201   WB-LINE-UPDATE
      176   WB-MODULE. . . . . . . . . . .  614 629
      143   WB-NN. . . . . . . . . . . . .  612
      168   WB-PROG. . . . . . . . . . . .  641
      189   WB-PROG-POS. . . . . . . . . .  776
      190   WB-PROG-POS-NUM. . . . . . . .  778 779
      199   WB-RENUMBER. . . . . . . . . .  1541
      202   WB-SEQ-1 . . . . . . . . . . .  1139 1607 1612 1637 1674 1697 1709 1713 1717
      209   WB-SEQ-2 . . . . . . . . . . .  1615 1644 1661 1674
      195   WB-STAR-START. . . . . . . . .  534 M1529 1531 M1560 M1565 1653 1724 1748 1771
      194   WB-START-CARD
      192   WB-SUBS-TEXT . . . . . . . . .  775
      197   WB-UPDATE-PROG . . . . . . . .  938
      145   WB-X . . . . . . . . . . . . .  612
      186   WB-X-CARD
      188   WB-X-CARD-NUM. . . . . . . . .  767 775 780
      187   WB-X-HYPHEN. . . . . . . . . .  508 760
      160   WB-10. . . . . . . . . . . . .  605
      163   WB-11. . . . . . . . . . . . .  531 566 567 603 1548 1563 1622 1657 1727 1751 1774
      166   WB-12. . . . . . . . . . . . .  511 585 589 632
      171   WB-13. . . . . . . . . . . . .  521 550 551 587 595 599
      174   WB-14. . . . . . . . . . . . .  597 613 620
      181   WB-15. . . . . . . . . . . . .  591
      184   WB-16. . . . . . . . . . . . .  593 607
      139   WB-3
      142   WB-4 . . . . . . . . . . . . .  611
      148   WB-6 . . . . . . . . . . . . .  558 559
      151   WB-7
      154   WB-8 . . . . . . . . . . . . .  601 609
      157   WB-9
      218   WC-COBOL . . . . . . . . . . .  1006 1007 1013 1241 1242 1252 1255 1270
      243   WC-COL-7 . . . . . . . . . . .  M1680 1793 1794 1803 1806 M1826 1834 M1835 1848
      244   WC-COL-8 . . . . . . . . . . .  M1834
      211   WC-CURRENT-POP-RECORD. . . . .  M1134 1160 1175 1205 1212 M1741 M1763 2087 M2133 2137 2185 2187 2190
      213   WC-END-OF-POPFILE
      215   WC-HEADER. . . . . . . . . . .  1244 1458
      224   WC-LEVEL . . . . . . . . . . .  1427
      223   WC-MODULE. . . . . . . . . . .  1406 1408
      220   WC-PROG-ID . . . . . . . . . .  1245 1329 1336 1343 1366 1423 1428
      222   WC-PROG-ID-1-4
      221   WC-PROG-ID-1-5 . . . . . . . .  1363
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    60
0 Defined   Cross-reference of data names   References

0     227   WC-PROG-ID-6 . . . . . . . . .  1317 1319 1321 1323 M1325 1334 1341
      231   WC-PROG2ID . . . . . . . . . .  1382 1462 1467
      232   WC-PROG2ID-1-5 . . . . . . . .  1376
      238   WC-STAR. . . . . . . . . . . .  2080 2139 2183
      216   WC-STAR-HEADER . . . . . . . .  M998 1001 1106 1111 M2135
      246   WC-SUB-DATA. . . . . . . . . .  M1886 M1893 M1966
      229   WC-SUBPRG. . . . . . . . . . .  1373 1459 1464
      212   WC-1 . . . . . . . . . . . . .  215 235
      241   WC-1-5 . . . . . . . . . . . .  2141 2144 2147 2150 2153 2156 2184
      236   WC-1-72
      247   WC-12-15 . . . . . . . . . . .  1868
      249   WC-17-19 . . . . . . . . . . .  1870 1875
      250   WC-20. . . . . . . . . . . . .  1882 1889 1942
      237   WC-6 . . . . . . . . . . . . .  240 M1140 1637 1644 1697 1709 1717 M2084
      252   WC-73-80
      257   WD-HEADER. . . . . . . . . . .  M2187
      254   WD-SOURCE-REC. . . . . . . . .  2188
      255   WD-1 . . . . . . . . . . . . .  M2180
      264   WE-CHANGE-TYPE . . . . . . . .  M1174 M1200 M1203 M1673 M1706 M1766
      260   WE-COBOL-LINE. . . . . . . . .  M1176 M1198 M1205 M1212 M1219
      259   WE-PRINT-DATA. . . . . . . . .  1177 1201 1206 1213 1220
      262   WE-X-CARD. . . . . . . . . . .  M1173 M1199 M1204 M1672 M1705 M1767
      267   WF-PROGRAM-SELECTED. . . . . .  M642 1060 1061 1363 M1364 1377 M1379
      266   WF-PROGRAM-SELECTED-TABLE. . .  M440 1056 1360
      272   WG-MODULE-LEVEL. . . . . . . .  M631 M1412 1422 1427
      271   WG-MODULE-SELECTED . . . . . .  M630 1406 1408 M1411
      269   WG-MODULE-SELECTED-TABLE . . .  M441 1350
      284   WV-OPT . . . . . . . . . . . .  M817
      281   WV-OPT-SWITCHES. . . . . . . .  M810 820
      277   WV-OPT-1 . . . . . . . . . . .  808
      279   WV-OPT-2 . . . . . . . . . . .  809
      275   WV-OPTION-HEADING. . . . . . .  807
      274   WV-PRINT-MISCELLANEOUS
      291   WX-PROG-POS. . . . . . . . . .  M482 M780 1877 1939
      290   WX-PROG-POS-TABLE
      287   WX-X-CARD. . . . . . . . . . .  M456 M481 M775 1876
      286   WX-X-CARD-TABLE
      288   WX-X-CHAR. . . . . . . . . . .  1945
      325   WY-EXTRACT-ALL . . . . . . . .  M586 663 672 708 737 885 1327
      326   WY-EXTRACT-AUTO. . . . . . . .  M588 665 690 712 738 887 1294 1340
      327   WY-EXTRACT-MAN . . . . . . . .  M590 674 692 710 739 890 1288 1333
      328   WY-KILL-DELETIONS. . . . . . .  M592 910 1831 2015
      332   WY-LIST-COMPACT. . . . . . . .  M600 845 1471
      329   WY-LIST-NO-UPDATES . . . . . .  M594 683 823 1165
      331   WY-LIST-PROGRAMS . . . . . . .  M598 681 837 1159
      330   WY-LIST-X-CARDS. . . . . . . .  M596 829 1171
      337   WY-NEW-POP . . . . . . . . . .  M610 701 857 960 1043 1132 1450 2056
      333   WY-NO-DATA . . . . . . . . . .  M602 876 1014 1281
      334   WY-NO-LIBRARY. . . . . . . . .  M604 867 1008 1243
      335   WY-NO-SOURCE . . . . . . . . .  M606 699 851 963 1038 1119 1447 1588 2059
      322   WY-OPT-SW. . . . . . . . . . .  M612 817 1848
      295   WY-OPT-SW-1. . . . . . . . . .  M443
      304   WY-OPT-SW-10
      305   WY-OPT-SW-11 . . . . . . . . .  M448
      306   WY-OPT-SW-12
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    61
0 Defined   Cross-reference of data names   References

0     307   WY-OPT-SW-13
      308   WY-OPT-SW-14
      309   WY-OPT-SW-15
      310   WY-OPT-SW-16
      311   WY-OPT-SW-17
      312   WY-OPT-SW-18
      313   WY-OPT-SW-19
      296   WY-OPT-SW-2. . . . . . . . . .  M444
      314   WY-OPT-SW-20
      315   WY-OPT-SW-21
      316   WY-OPT-SW-22
      317   WY-OPT-SW-23
      318   WY-OPT-SW-24
      319   WY-OPT-SW-25
      320   WY-OPT-SW-26
      297   WY-OPT-SW-3. . . . . . . . . .  M445
      298   WY-OPT-SW-4. . . . . . . . . .  M446
      299   WY-OPT-SW-5
      300   WY-OPT-SW-6
      301   WY-OPT-SW-7. . . . . . . . . .  M447
      302   WY-OPT-SW-8
      303   WY-OPT-SW-9
      294   WY-OPTION-SWITCHES . . . . . .  321
      324   WY-PRINT-SWITCHES
      336   WY-REMOVE-COMMENTS . . . . . .  M608 901 1797
      340   WY-SELECT-LEVEL
      339   WY-SELECT-MODULE . . . . . . .  M628 720 729 741 896 1347
      338   WY-SELECT-PROG . . . . . . . .  M640 715 727 740 893 1055 1359
      293   WY-SWITCHES. . . . . . . . . .  M442
      376   WZ-CODE-REMOVED. . . . . . . .  M462 M1491 M1830 2025
      380   WZ-COMMENTS-DEL. . . . . . . .  M466 M1492
      375   WZ-COMMENTS-DELETED. . . . . .  M461 M1798 2026
      356   WZ-CURRENT-HEADER. . . . . . .  M1270 2140 2163
      363   WZ-CURRENT-MAIN-PROG . . . . .  M1245 M1454 M1460 M1465 1946 1951
      367   WZ-CURRENT-POP-PROG. . . . . .  940 M1246 M1329 M1336 M1343 M1366 M1383 M1423 M1428 1454 1460 M1462 1465 M1467
                                            1508 1511 1525 1949 2020 M2034 2076
      360   WZ-CURRENT-UPD-PROG. . . . . .  M938 940 1508 1511
      354   WZ-DELETE-FLAG . . . . . . . .  M1104 1121 1218 1585 M1671 M1704 1810 M1832
      346   WZ-DONT-READ-POPFILE . . . . .  1211 M1765 2128 M2129
      344   WZ-END-OF-POPFILE. . . . . . .  975 1003 1128 1137 1263 M1351 M1361 M2134
      352   WZ-END-OF-UPDATES. . . . . . .  M532 1048 M1050 1053 M1078 1271 1533 M1546 M1549 M1559 M1564 M1623 M1650 M1658
                                            M1723 M1728 M1746 M1752 M1769 M1775
      359   WZ-ERROR-MESSAGE . . . . . . .  M553 M561 M569 M762 M769
      345   WZ-FULL-STOP . . . . . . . . .  M1941 M1943 1957
      357   WZ-INVALID-DATA. . . . . . . .  M551 554 M559 562 M567 570 M761 763 M768 770
      392   WZ-LEVEL
      390   WZ-LINE-CT . . . . . . . . . .  M469 M1472 2105 M2115 M2116
      349   WZ-LINE-UPDATE . . . . . . . .  M1100 1166 M1667 M1701
      371   WZ-LINES-COBOL . . . . . . . .  M457 M1487 2021 M2142 M2145 M2148 M2151 M2154 M2157 M2164
      374   WZ-LINES-DELETED . . . . . . .  M460 M1490 M1670 M1703 2024
      372   WZ-LINES-INSERTED. . . . . . .  M458 M1488 M1764 2022
      373   WZ-LINES-REPLACED. . . . . . .  M459 M1489 M1742 2023
      364   WZ-MAIN-PROG-CHAR
      370   WZ-MAIN-PROG-FLAG. . . . . . .  M1940 M1947 M1952
      342   WZ-MISCELLANEOUS . . . . . . .  M439
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    62
0 Defined   Cross-reference of data names   References

0     391   WZ-MODULE
      378   WZ-NEWPOP-PROGS. . . . . . . .  M464 1044 M1451
      355   WZ-NOT-THIS-COMMENT. . . . . .  M1099 1123 M1799
      353   WZ-OPTIONAL-SELECTED . . . . .  M1103 1825 M1850
      389   WZ-PAGE-CT . . . . . . . . . .  M468 M2107 2108
      393   WZ-PRINT-HOLD. . . . . . . . .  M2106 2114
      365   WZ-PROG-BREAK. . . . . . . . .  M1946 M1949
      369   WZ-PROG-ID-6 . . . . . . . . .  1284
      343   WZ-PROGRAM-SELECTED. . . . . .  M1107 1109 M1249 1259 M1264 M1289 M1295 M1328 M1335 M1342 M1365 M1381 1390 M1424
                                            M1429 1444
      379   WZ-PROGS-FOUND . . . . . . . .  M465 1034 M1256
      348   WZ-REPLACE-FLAG. . . . . . . .  M1101 1197 M1679 M1743
      351   WZ-RESEQUENCE-NEXT
      350   WZ-RESEQUENCE-THIS . . . . . .  M1542 M1544 2082
      382   WZ-SAVE-POP-RECORD . . . . . .  1134 1198 1219 M2137
      383   WZ-SAVE-SEQ. . . . . . . . . .  1140
      386   WZ-SAVE-12-15. . . . . . . . .  1172
      385   WZ-SAVE-12-20. . . . . . . . .  1173
      381   WZ-SEQ-NO. . . . . . . . . . .  M467 M1493 M2083 2084
      377   WZ-SOURCE-PROGS. . . . . . . .  M463 1039 1410 M1448
      361   WZ-UPD-PROG-CHAR . . . . . . .  1517 1520
      347   WZ-UPDATE-THIS-PROG. . . . . .  M941 M943 M1507 M1540 1582
      398   WZ-VERSION-CARD. . . . . . . .  401 968
      401   WZ-VERSION-CONTROL
      405   WZ-VERSION-DATE. . . . . . . .  987
      403   WZ-VERSION-NUM . . . . . . . .  986
      397   WZ-WITHIN-DELETE-SERIES-FLAG .  1638 M1648 M1669 M1675
      394   WZ-X-CARD. . . . . . . . . . .  M1876 1886 1893 1966
      395   WZ-X-CHAR. . . . . . . . . . .  1902 1905 M1906 1922 1925 M1929 M1985 1987 1989 M1991 2002 M2002
      366   WZ-1CHAR . . . . . . . . . . .  1985
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    63
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

      425   A10-EXIT
      411   A10-MAIN
      416   A10-1-MAIN
      471   B10-EXIT
      429   B10-INITIALISE . . . . . . . .  P417
      438   B10-1-INIT-OPTION-SWITCHES
      450   B10-2-INIT-X-CARDS
      484   B20-EXIT
      477   B20-INIT-X-CARDS . . . . . . .  P455
      479   B20-1-INIT
      537   C10-EXIT . . . . . . . . . . .  G533
      487   C10-PROCESS-MONITOR. . . . . .  P419
      498   C10-1-OPEN-FILES
      515   C10-10-GET-FIRST-START-CARD
      576   C20-EXIT
      540   C20-PROCESS-STAR-CARDS . . . .  P507
      549   C20-1-UPDATE-CHECK
      651   C25-EXIT
      580   C25-SET-FLAGS. . . . . . . . .  P574
      582   C25-1
      644   C25-10-READ-FILE
      654   C30-CHECK-COMBINATIONS . . . .  P509
      747   C30-EXIT
      662   C30-1-SELECTION-CHECK
      671   C30-10 . . . . . . . . . . . .  G664
      680   C30-20 . . . . . . . . . . . .  G673
      689   C30-30 . . . . . . . . . . . .  G682
      698   C30-40-CHECK-FOR-NEW-FILE. . .  G691
      707   C30-50 . . . . . . . . . . . .  G700 G702
      714   C30-55 . . . . . . . . . . . .  G709 G711
      726   C30-60 . . . . . . . . . . . .  G713
      736   C30-70 . . . . . . . . . . . .  G728
      794   C40-EXIT
      750   C40-PROCESS-X-CARDS. . . . . .  P510
      759   C40-1-PROCESS-CARD
      774   C40-20-MOVE-DATA
      782   C40-30-MOVE-DATA . . . . . . .  G777
      786   C40-90-READ-FILE . . . . . . .  G765 G772
      919   C50-EXIT
      798   C50-PRINT-OPTIONS. . . . . . .  P513
      806   C50-1-PRINT-OPTION-SWITCHES
      822   C50-20-LISTING-OPTIONS
      866   C50-30
      875   C50-35
      814   C50-4. . . . . . . . . . . . .  P812
      884   C50-40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    64
0 Defined   Cross-reference of procedures   References

0     819   C50-5. . . . . . . . . . . . .  G813
      945   C60-EXIT
      923   C60-START-CARD . . . . . . . .  P535 P1535 P1654 P1725 P1749 P1772
      936   C60-1
      979   D10-EXIT
      948   D10-MERGE-UPDATE-CARDS . . . .  P421
      959   D10-1-OPEN-FILES
      971   D10-10-GET-HEADER
      989   D10-20-EXIT
      982   D10-20-GET-VERSION . . . . . .  P967
      985   D10-20-INIT-VER
     2041   D100-PROCESS-DATA
     1021   D11-EXIT . . . . . . . . . . .  G1004
      992   D11-GET-NEXT-PROGRAM . . . . .  P972 P1262
     1002   D11-TEST-END
      997   D11-1-READ-POPFILE . . . . . .  G1009 G1015 G1019
     1024   D15-END-OF-POPFILE . . . . . .  P977
     1066   D15-EXIT
     1033   D15-1-SET-UP-FIELDS
     1080   D16-EXIT
     1072   D16-FLAG-UNUSED-UPDATES. . . .  P1052
     1074   D16-1-PRINT-UPDATES
     1144   D20-EXIT . . . . . . . . . . .  G1138 G1141
     1085   D20-PROCESS-POPFILE. . . . . .  P974
     1098   D20-1-CHECK-RECORD-TYPE
     1118   D20-10-SOURCE-CHECK
     1131   D20-20-UPDATED-POP-CHECK . . .  G1120 G1122 G1124
     1136   D20-30-READ-FILE
     1180   D25-EXIT . . . . . . . . . . .  G1162 G1168
     1148   D25-PRINT-REPORT . . . . . . .  P1116
     1158   D25-1-CHECK-LIST-PROGRAMS
     1164   D25-10-UPDATES-CHECK
     1170   D25-20-X-CARD-CHECK
     1223   D27-EXIT . . . . . . . . . . .  G1208 G1215
     1186   D27-PRINT-UPDATES. . . . . . .  P1167
     1196   D27-1-PRINT-REPLACEMENTS
     1210   D27-10-PRINT-NEW-DATA
     1217   D27-20-PRINT-DELETIONS
     1274   D30-EXIT . . . . . . . . . . .  G1265
     1227   D30-PROCESS-HEADER . . . . . .  P1108
     1240   D30-1-CHECK-HEADER-TYPE. . . .  G1267
     1269   D30-20-HEADER-SELECTED . . . .  G1260
     1298   D31-EXIT . . . . . . . . . . .  G1282 G1291
     1277   D31-PROCESS-DATA-HEADER. . . .  P1253
     1280   D31-1-CHECK-FOR-DATA-SELECTED
     1287   D31-20-AUTO-CHECK
     1293   D31-30-MANUAL-CHECK. . . . . .  G1285
     1393   D32-EXIT
     1302   D32-PROCESS-COBOL-HEADER . . .  P1257
     1316   D32-0-CHECK-A-OR-M
     1326   D32-1-CHECK-FOR-ALL-SELECTED .  G1318 G1320 G1322 G1324
     1332   D32-10-MANUAL-CHECK
     1339   D32-20-AUTO-CHECK
     1346   D32-30-MODULE-CHECK
     1358   D32-40-PROGRAM-CHECK . . . . .  G1371
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    65
0 Defined   Cross-reference of procedures   References

0    1389   D32-50-CHECK-IF-SELECTED . . .  G1330 G1337 G1344 G1355 G1367 G1384
     1431   D33-EXIT . . . . . . . . . . .  G1417 G1419 G1425
     1396   D33-MODULE-CHECK . . . . . . .  P1354
     1405   D33-1-MODULE-CHECK . . . . . .  G1415
     1421   D33-10-CHECK-MODULE-LEVEL. . .  G1407
     1475   D34-EXIT . . . . . . . . . . .  G1445
     1435   D34-PROGRAM-SELECTED . . . . .  P1250 P1391
     1443   D34-1-SELECTION-CHECK
     1470   D34-2-OPEN-OUTPUT
     1495   D36-EXIT
     1478   D36-INITIALISE-PROGRAM-TOTALS.  P1456
     1486   D36-1-RESET-TOTALS
     1498   D40-ANY-UPDATES. . . . . . . .  P1272
     1551   D40-EXIT . . . . . . . . . . .  G1509 G1526 G1534
     1524   D40-05-CHECK-LIBRARY . . . . .  G1518 G1521
     1506   D40-1-CHECK-UPDATE-AND-POP . .  G1537
     1528   D40-10-GET-NEXT-STAR-START . .  G1522
     1539   D40-20-PROGRAMS-EQUAL. . . . .  G1512
     1567   D42-EXIT . . . . . . . . . . .  G1561
     1555   D42-READ-UPDATE-FILE . . . . .  P1530
     1557   D42-1
     1593   D50-EXIT . . . . . . . . . . .  G1586
     1573   D50-PROCESS-COBOL-LINE . . . .  P1114
     1580   D50-1-CHECK-FOR-UPDATING
     1626   D60-EXIT
     1596   D60-PROCESS-UPDATE-CARD. . . .  P1583
     1606   D60-1-CHECK-BLOCK-INSERT
     1611   D60-10-CHECK-FOR-SERIES-UPDATE
     1621   D60-30-CHECK-END . . . . . . .  G1609 G1613 G1617
     1682   D62-EXIT . . . . . . . . . . .  G1642 G1651 G1655 G1659 G1664 G1677
     1629   D62-SERIES-UPDATE. . . . . . .  P1616
     1636   D62-1-CHECK-FOR-WITHIN-RANGE .  G1662
     1647   D62-10-READ-NEXT-UPDATE-CARD
     1666   D62-20-NOW-WITHIN-RANGE. . . .  G1640 G1645
     1730   D67-EXIT . . . . . . . . . . .  G1698 G1711 G1715 G1719
     1686   D67-LINE-UPDATE. . . . . . . .  P1608 P1619 P1663
     1696   D67-1-CHECK-FOR-WITHIN-RANGE
     1700   D67-10-LINES-EQUAL-OR-LESS
     1721   D67-20-READ-CONTROL. . . . . .  G1707
     1754   D68-EXIT
     1733   D68-LINE-EQUAL . . . . . . . .  P1710
     1740   D68-1
     1777   D69-EXIT
     1760   D69-LINE-BLANK-OR-LESS . . . .  P1714 P1718
     1762   D69-1
     1813   D80-EXIT . . . . . . . . . . .  G1800
     1781   D80-RAW-LINE . . . . . . . . .  P1590
     1792   D80-1-ASTERISK-CHECK
     1802   D80-20-ALPHABETIC-CHECK. . . .  G1795
     1809   D80-30-PRINT-LINE. . . . . . .  G1793 G1804
     1837   D82-EXIT . . . . . . . . . . .  G1827
     1817   D82-OPTIONAL-LETTER. . . . . .  P1807
     1820   D82-1-SELECT-OPTIONAL
     1829   D82-10-SAVE-OPTIONAL
     1844   D83-CHECK-OPTION-SWITCHES. . .  P1821
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    66
0 Defined   Cross-reference of procedures   References

0    1852   D83-EXIT
     1847   D83-1-CHECK-SWITCH
     1894   D85-EXIT . . . . . . . . . . .  G1869 G1872 G1879 G1887
     1855   D85-X-CARD-CHECK . . . . . . .  P1811
     1867   D85-1-CHECK-FOR-XXXXX
     1874   D85-10-SUBSTITUTION-REQUIRED
     1881   D85-20-TEXT-SUBSTITUTION
     1911   D86-EXIT . . . . . . . . . . .  G1903
     1898   D86-REMOVE-FULL-STOP . . . . .  P1883 P1962
     1901   D86-1
     1932   D87-EXIT . . . . . . . . . . .  G1923
     1918   D87-INSERT-FULL-STOP . . . . .  P1890 P1958
     1921   D87-1
     1968   D88-EXIT
     1935   D88-PROGRAM-NAME . . . . . . .  P1878
     1938   D88-1
     1996   D89-EXIT
     1974   D89-MOVE-PROGRAM-NAME. . . . .  P1955
     1977   D89-1
     1999   D89-2-CLOSE-SPACE. . . . . . .  P1989
     2000   D89-2-1
     2037   D90-EXIT
     2006   D90-PROCESS-END-OF . . . . . .  P1112
     2014   D90-1-CHECK-HEADER-TYPE
     2045   E10-TERMINATE. . . . . . . . .  P423
     2051   E10-1
     2064   E20-EXIT
     2095   X10-EXIT
     2068   X10-WRITE-UPDATED-POPFILE. . .  P1133
     2071   X10-1-CHECK-FOR-NC114
     2079   X10-20-RENUMBER-CHECK
     2086   X10-30-WRITE-FILE. . . . . . .  G2077 G2081
     2122   X20-EXIT
     2100   X20-PRINT-DETAIL . . . . . . .  P505 P519 P524 P529 P555 P563 P571 P584 P617 P625 P637 P649 P668 P677 P686 P695
                                            P704 P718 P723 P732 P744 P764 P771 P784 P791 P969 P1036 P1041 P1046 P1058 P1062
                                            P1076 P1161 P1178 P1202 P1207 P1214 P1221 P1474 P2028 P2030 P2032
     2103   X20-1
     2118   X20-2
     2170   X30-EXIT . . . . . . . . . . .  G2130 G2136
     2125   X30-READ-POPFILE . . . . . . .  P1000 P1142
     2127   X30-1
     2192   X40-EXIT
     2177   X40-WRITE-SOURCE-FILE. . . . .  P1129
     2179   X40-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    67
0 Defined   Cross-reference of programs     References

        4   EXEC85
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       EXEC85    Date 06/04/2022  Time 12:00:12   Page    68
0LineID  Message code  Message text

     40  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "POPULATION-FILE".

     45  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "CONTROL-CARD-FILE".

     47  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     51  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "SOURCE-COBOL-PROGRAMS".

     56  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "UPDATED-POPULATION-FILE".

    207  IGYDS1073-I   "FILLER" redefined a larger item.

    423  IGYCB7310-W   The "PERFORM" statement at "PERFORM (line 423.1)" cannot reach its exit.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       7           6              1
-* Statistics for COBOL program EXEC85:
 *    Source records = 2194
 *    Data Division statements = 232
 *    Procedure Division statements = 865
 *    Generated COBOL statements = 0
 *    Program complexity factor = 866
0End of compilation 1,  program EXEC85,  highest severity 4.
0Return code 4
